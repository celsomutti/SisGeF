unit uthrImportarExtravios;

interface

uses
  System.Classes, Dialogs, Windows, Forms, SysUtils, clUtil, Messages, Controls,
  System.DateUtils;

type
  TCSVExtravio = record
    _nossonumero: String;
    _valor: String;
  end;

type
  thrImportarExtravios = class(TThread)
  private
    { Private declarations }
    CSVExtravio: TCSVExtravio;
  protected
    procedure Execute; override;
    procedure AtualizaProgress;
    procedure TerminaProcesso;
    function TrataLinha(sLinha: String): String;
  end;

implementation

{ thrImportarExtravios }

uses
  ufrmImportarExtravios, uGlobais, udm;

function thrImportarExtravios.TrataLinha(sLinha: String): String;
var
  iConta: Integer;
  sLin: String;
  bFlag: Boolean;
begin

  if Pos('"', sLinha) = 0 then
  begin
    Result := sLinha;
    Exit;
  end;

  iConta := 1;
  bFlag := False;
  sLin := '';
  while sLinha[iConta] >= ' ' do
  begin
    if sLinha[iConta] = '"' then
    begin
      if bFlag then
        bFlag := False
      else
        bFlag := True;
    end;
    if bFlag then
    begin
      if sLinha[iConta] = ';' then
        sLin := sLin + ' '
      else
        sLin := sLin + sLinha[iConta];
    end
    else
      sLin := sLin + sLinha[iConta];
    Inc(iConta);
  end;
  Result := sLin;
end;

procedure thrImportarExtravios.Execute;
var
  ArquivoCSV: TextFile;
  Contador, I, LinhasTotal, iRet: Integer;
  Linha, campo, codigo, sMess, sData: String;
  d: Real;

  // Lê Linha e Monta os valores
  function MontaValor: String;
  var
    ValorMontado: String;
  begin
    ValorMontado := '';
    Inc(I);
    While Linha[I] >= ' ' do
    begin
      If Linha[I] = ';' then // vc pode usar qualquer delimitador ... eu
        // estou usando o ";"
        break;
      ValorMontado := ValorMontado + Linha[I];
      Inc(I);
    end;
    Result := ValorMontado;
  end;

begin

  LinhasTotal := TUtil.NumeroDeLinhasTXT(frmImportarExtravios.sArquivo);

  // Carregando o arquivo ...
  AssignFile(ArquivoCSV, frmImportarExtravios.sArquivo);
  sData := frmImportarExtravios.cxDataExtravio.Text;
  try
    Reset(ArquivoCSV);
    Readln(ArquivoCSV, Linha);
    Contador := 2;
    while not Eoln(ArquivoCSV) do
    begin
      Readln(ArquivoCSV, Linha);
      Linha := TrataLinha(Linha);
      with CSVExtravio do
      begin
        campo := MontaValor;
        _nossonumero := MontaValor;
        campo := MontaValor;
        campo := MontaValor;
        campo := MontaValor;
        campo := MontaValor;
        _valor := TUtil.ReplaceStr(campo, '.', '');
        dm.tbImportacaoExtravio.Insert;
        dm.tbImportacaoExtravioNUM_NOSSONUMERO.Value := _nossonumero;
        dm.tbImportacaoExtravioDES_EXTRAVIO.Value := 'EXTRAVIO';
        dm.tbImportacaoExtravioDAT_EXTRAVIO.Value := StrToDate(sData);
        dm.tbImportacaoExtravioCOD_ENTREGADOR.Value := 0;
        dm.tbImportacaoExtravioVAL_PRODUTO.Value := StrToFloat(_valor);
        dm.tbImportacaoExtravioVAL_MULTA.Value := 0;
        dm.tbImportacaoExtravioVAL_VERBA.Value := 0;
        dm.tbImportacaoExtravioDES_RESTRICAO.Value := 'ADM. CEP';
        dm.tbImportacaoExtravio.Post;
      end;
      I := 0;
      iConta := Contador;
      iTotal := LinhasTotal;
      dPosicao := (iConta / iTotal) * 100;
      Inc(Contador, 1);
      if not(Self.Terminated) then
      begin
        Synchronize(AtualizaProgress);
      end
      else
      begin
        Abort;
      end;
    end;
  finally
    CloseFile(ArquivoCSV);
    Synchronize(TerminaProcesso);
  end;
end;

procedure thrImportarExtravios.AtualizaProgress;
begin
  frmImportarExtravios.cxProgressBar1.Position := dPosicao;
  frmImportarExtravios.cxProgressBar1.Properties.Text := 'Registro ' +
    IntToStr(iConta) + ' de ' + IntToStr(iTotal);
  frmImportarExtravios.cxProgressBar1.Refresh;
end;

procedure thrImportarExtravios.TerminaProcesso;
begin
  frmImportarExtravios.cxProgressBar1.Properties.Text := '';
  frmImportarExtravios.cxProgressBar1.Position := 0;
  frmImportarExtravios.cxProgressBar1.Clear;
  frmImportarExtravios.cxProgressBar1.Visible := False;
  frmImportarExtravios.ds.Enabled := True;
  if (not dm.tbImportacaoExtravio.IsEmpty) then
  begin
    frmImportarExtravios.actImportarSalvar.Enabled := True;
  end;
  frmImportarExtravios.cxGrid1DBTableView1.ViewData.Expand(True);
end;

end.
