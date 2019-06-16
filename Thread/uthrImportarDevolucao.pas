unit uthrImportarDevolucao;

interface

uses
  System.Classes, Dialogs, Windows, Forms, SysUtils, clUtil, clEntregador,
  clAgentes, clCEPAgentes,
  Messages, Controls, System.DateUtils;

type
  TCSVDevolucao = record
    _nossonumero: String;
    _volumes: String;
    _cep3: String;
    _cep: String;
  end;

type
  thrImportarDevolucao = class(TThread)
  private
    { Private declarations }
    entregador: TEntregador;
    agentes: TAgente;
    cep: TCEPAgentes;
    CSVDevolucao: TCSVDevolucao;
  protected
    procedure Execute; override;
    procedure AtualizaProgress;
    procedure TerminaProcesso;
    function TrataLinha(sLinha: String): String;
  end;

implementation

{ thrImportarDevolucao }

uses
  ufrmDevolucoes, uGlobais, udm;

function thrImportarDevolucao.TrataLinha(sLinha: String): String;
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

procedure thrImportarDevolucao.Execute;
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
  entregador := TEntregador.Create;
  agentes := TAgente.Create;
  cep := TCEPAgentes.Create;

  LinhasTotal := TUtil.NumeroDeLinhasTXT(frmDevolucoes.cxArquivo.Text);

  // Carregando o arquivo ...
  AssignFile(ArquivoCSV, frmDevolucoes.cxArquivo.Text);
  sData := frmDevolucoes.cxData.Text;
  try
    Reset(ArquivoCSV);
    Readln(ArquivoCSV, Linha);
    if Copy(Linha, 0, 15) <> 'GRADE DE DEVOLU' then
    begin
      MessageDlg('Arquivo informado não é da GRADE DE DEVOLUÇÕES PENDENTES.',
        mtWarning, [mbOK], 0);
      Abort;
    end;
    Readln(ArquivoCSV, Linha);
    Readln(ArquivoCSV, Linha);
    Contador := 3;
    while not Eoln(ArquivoCSV) do
    begin
      Readln(ArquivoCSV, Linha);
      Linha := TrataLinha(Linha);
      with CSVDevolucao do
      begin
        campo := MontaValor;
        _nossonumero := MontaValor;
        campo := MontaValor;
        campo := MontaValor;
        campo := MontaValor;
        campo := MontaValor;
        campo := MontaValor;
        campo := MontaValor;
        campo := MontaValor;
        _volumes := MontaValor;
        campo := MontaValor;
        _cep := campo;
        _cep3 := Copy(campo, 1, 3);
      end;
      if cep.getObject(CSVDevolucao._cep3, 'CEP') then
      begin
        if (not dm.tbDevolucao.Locate('NUM_NOSSONUMERO',
          CSVDevolucao._nossonumero, [])) then
        begin
          dm.tbDevolucao.Insert;
          dm.tbDevolucaoCOD_BASE.Value := cep.Agente;
          if Agente.getObject(IntToStr(cep.Agente), 'CODIGO') then
          begin
            dm.tbDevolucaoDES_BASE.Value := Agente.Fantasia;
          end
          else
          begin
            dm.tbDevolucaoDES_BASE.Value := 'BASE NÃO CADASTRADA';
          end;
          dm.tbDevolucaoDAT_EXPEDICAO.Value := StrToDate(sData);
          dm.tbDevolucaoNUM_NOSSONUMERO.Value := FormatFloat('00000000000', StrToFloat(CSVDevolucao._nossonumero));
          dm.tbDevolucaoNUM_VOLUME.Value := StrToInt(CSVDevolucao._volumes);
          dm.tbDevolucaoCOD_STATUS.Value := 0;
          dm.tbDevolucaoDES_CEP.Value := Copy(CSVDevolucao._cep, 1, 5) + '-' + Copy(CSVDevolucao._cep, 6, 3);
          dm.tbDevolucaoDOM_MARCA.Value := 'S';
          dm.tbDevolucao.Post;
        end;
      end
      else
      begin
        if (not dm.tbDevolucao.Locate('NUM_NOSSONUMERO',
          CSVDevolucao._nossonumero, [])) then
        begin
          dm.tbDevolucao.Insert;
          dm.tbDevolucaoCOD_BASE.Value := 0;
          dm.tbDevolucaoDES_BASE.Value := 'BASE IGNORADA';
          dm.tbDevolucaoDAT_EXPEDICAO.Value := StrToDate(sData);
          dm.tbDevolucaoNUM_NOSSONUMERO.Value :=
            FormatFloat('00000000000', StrToFloat(CSVDevolucao._nossonumero));
          dm.tbDevolucaoNUM_VOLUME.Value := StrToInt(CSVDevolucao._volumes);
          dm.tbDevolucaoCOD_STATUS.Value := 0;
          dm.tbDevolucaoDES_CEP.Value := Copy(CSVDevolucao._cep, 1, 5) + '-' +
            Copy(CSVDevolucao._cep, 6, 3);
          dm.tbDevolucaoDOM_MARCA.Value := 'S';
          dm.tbDevolucao.Post;
        end;
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
        entregador.Free;
        cep.Free;
        agentes.Free;
        Abort;
      end;
    end;
  finally
    CloseFile(ArquivoCSV);
    Synchronize(TerminaProcesso);
    entregador.Free;
    cep.Free;
    agentes.Free;
  end;
end;

procedure thrImportarDevolucao.AtualizaProgress;
begin
  frmDevolucoes.cxProgressBar1.Position := dPosicao;
  frmDevolucoes.cxProgressBar1.Properties.Text := 'Registro ' + IntToStr(iConta)
    + ' de ' + IntToStr(iTotal);
  frmDevolucoes.cxProgressBar1.Refresh;
end;

procedure thrImportarDevolucao.TerminaProcesso;
begin
  frmDevolucoes.cxArquivo.Clear;
  frmDevolucoes.cxProgressBar1.Properties.Text := '';
  frmDevolucoes.cxProgressBar1.Position := 0;
  frmDevolucoes.cxProgressBar1.Clear;
  frmDevolucoes.cxProgressBar1.Visible := False;
  frmDevolucoes.ds3.Enabled := True;
  frmDevolucoes.actDevolucaoSalvarImportacao.Enabled := True;
  frmDevolucoes.cxGrid3DBTableView1.ViewData.Expand(True);
end;

end.
