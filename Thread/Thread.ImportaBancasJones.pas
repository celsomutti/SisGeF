unit Thread.ImportaBancasJones;

interface

uses
  System.Classes, Dialogs, Windows, Forms, SysUtils, clUtil, Messages, Controls, System.DateUtils, System.StrUtils,
  Model.DistribuidorVA, DAO.DistribuidorVA, Model.BancaVA, DAO.BancaVA, System.Generics.Collections;

type
  Thread_ImportaBancasJones = class(TThread)
  private
    { Private declarations }
    FArquivo: String;
    FErro: TStringList;
    FdPos: Double;
    banca : TBancaVA;
    bancaTMP: TBancaVA;
    bancas : TObjectList<TBancaVA>;
    bancaDAO : TBancaVADAO;
    distribuidor : TDistribuidorVA;
    distribuidorTMP: TDistribuidorVA;
    distribuidores : TObjectList<TDistribuidorVA>;
    distribuidorDAO : TDistribuidorVADAO;
  protected
    procedure Execute; override;
    procedure IniciaProcesso;
    procedure AtualizaLog(sTexto: String);
    procedure AtualizaProgress;
    procedure TerminaProcesso;
    function TrataLinha(sLinha: String): String;
    procedure PopulaDistribuidor;
  public
    property Arquivo: String read FArquivo write FArquivo;
  end;

implementation

{
  Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

  Synchronize(UpdateCaption);

  and UpdateCaption could look like,

  procedure thrImportarEntregas.UpdateCaption;
  begin
  Form1.Caption := 'Updated in a thread';
  end;

  or

  Synchronize(
  procedure
  begin
  Form1.Caption := 'Updated in thread via an anonymous method'
  end
  )
  );

  where an anonymous method is passed.

  Similarly, the developer can call the Queue method with similar parameters as
  above, instead passing another TThread class as the first parameter, putting
  the calling thread in a queue with the other thread.

}

{ thrImportarEntregas }

uses
  View.CadastroBanca, uGlobais, udm, View.ResultatoProcesso;

function Thread_ImportaBancasJones.TrataLinha(sLinha: String): String;
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

procedure Thread_ImportaBancasJones.Execute;
var
  ArquivoCSV: TextFile;
  sDetalhe: TStringList;
  sLogB: TStringList;
  sLogd: TStringList;
  sCEP: String;
  sEndereco: String;
  sCidade: String;
  sEstado: String;
  sLinha: String;
  iLinhasTotal: Integer;
  iContador : Integer;
  iPos: Integer;
  bFlagBanca: Boolean;

begin
  Synchronize(IniciaProcesso);
  Screen.Cursor := crHourGlass;
  iLinhasTotal := TUtil.NumeroDeLinhasTXT(FArquivo);
  // Carregando o arquivo ...
  AssignFile(ArquivoCSV, FArquivo);
  try
    banca := TBancaVA.Create();
    bancaDAO := TBancaVADAO.Create();
    distribuidor := TDistribuidorVA.Create();
    distribuidorDAO := TDistribuidorVADAO.Create();
    sLogB := TStringList.Create;
    sLogD := TStringList.Create;
    FErro := TStringList.Create;
    sDetalhe := TStringList.Create;
    sDetalhe.StrictDelimiter := True;
    sDetalhe.Delimiter := ';';
    Reset(ArquivoCSV);
    Readln(ArquivoCSV, sLinha);
    if Copy(sLinha, 0, 23) <> 'Bancas por Distribuidor' then
    begin
      MessageDlg
        ('Arquivo informado não foi identificado como a Planila de Bancas por Distribuidor do Jones!', mtWarning, [mbOK], 0);
      Abort;
    end;
    Readln(ArquivoCSV, sLinha);
    iContador := 2;
    FdPos := 0;
    while not Eoln(ArquivoCSV) do
    begin
      Readln(ArquivoCSV, sLinha);
      sDetalhe.DelimitedText := sLinha;
      if TUtil.ENumero(sDetalhe[0]) then
      begin
        sLogB.Clear;
        sLogD.Clear;
        iPos := Pos('CEP:',sDetalhe[10]) + 5;
        sCEP := Trim(Copy(sDetalhe[10], iPos, 5)) + '-' + Trim(Copy(sDetalhe[10], iPos + 6, 3));
        sEndereco := Trim(Copy(sDetalhe[10], 0, iPos - 9));
        iPos := Pos(' - ',sDetalhe[11]);
        sCidade := Trim(Copy(sDetalhe[11],0,iPos));
        sEstado := Trim(Copy(sDetalhe[11], iPos + 3, 2));
        banca.ID := 0;
        banca.Codigo := StrToIntDef(sDetalhe[4],0);
        banca.Distribuidor := StrToIntDef(sDetalhe[0],0);
        banca.Nome := sDetalhe[5];
        banca.CEP := sCEP;
        banca.Endereco := sEndereco;
        banca.Complemento := '';
        banca.Bairro := '';
        banca.Cidade := sCidade;
        banca.Estado := sEstado;
        banca.Ordem := TUtil.AlinhaD(Trim(sDetalhe[3]),10);
        bancas := bancaDAO.FindByCodigo(banca.Codigo);
        if bancas.Count > 0 then
        begin
          banca.ID := bancas[0].ID;
          sLogB.Text := bancas[0].Log;
        end;
        distribuidor.ID := 0;
        distribuidor.Codigo := StrToIntDef(sDetalhe[0],0);
        distribuidor.Nome := sDetalhe[1];
        distribuidores := distribuidorDAO.FindByCodigo(StrToIntDef(sDetalhe[0],0));
        if distribuidores.Count > 0 then
        begin
          distribuidor.ID := distribuidores[0].ID;
          sLogD.Text := distribuidores[0].Log;
        end;
        bFlagBanca := True;
        if distribuidor.ID = 0 then
        begin
          sLogD.Add(FormatDateTime('yyyy-mm-dd hh:mm:ss', Now()) + ' inserido por importação de planilha Jones por ' +
                                   uGlobais.sUsuario);
          distribuidor.Log := sLogD.Text;
          if not distribuidorDAO.Insert(distribuidor) then
          begin
            AtualizaLog('Erro ao incluir Distribuidor código ' + IntToStr(distribuidor.Codigo));
            bFlagBanca := False;
          end;
{        end
        else
        begin
          sLogD.Add(FormatDateTime('yyyy-mm-dd hh:mm:ss', Now()) + ' alterado por importação de planilha Jones por ' +
                                   uGlobais.sUsuario);
          distribuidor.Log := sLogD.Text;
          if not distribuidorDAO.Update(distribuidor) then
          begin
            AtualizaLog('Erro ao alterar Distribuidor código ' + IntToStr(distribuidor.Codigo));
            bFlagBanca := False;
          end;}
        end;
        if bFlagBanca then
        begin
          if banca.ID = 0 then
          begin
            sLogB.Add(FormatDateTime('yyyy-mm-dd hh:mm:ss', Now()) + ' inserida por importação de planilha Jones por ' +
                                     uGlobais.sUsuario);
            banca.Log := sLogB.Text;
            if not bancaDAO.Insert(banca) then
            begin
              AtualizaLog('Erro ao incluir Banca código ' + IntToStr(banca.Codigo));
            end;
          {end
          else
          begin
            sLogB.Add(FormatDateTime('yyyy-mm-dd hh:mm:ss', Now()) + ' alterada por importação de planilha Jones por ' +
                                     uGlobais.sUsuario);
            banca.Log := sLogB.Text;
            if not bancaDAO.Update(banca) then
            begin
              AtualizaLog('Erro ao alterar Banca código ' + IntToStr(banca.Codigo));
            end;}
          end;
        end;
      end;
      iContador := iContador + 1;
      FdPos := (iContador / iLinhasTotal) * 100;
      Synchronize(AtualizaProgress);
    end;
  finally
    CloseFile(ArquivoCSV);
    Screen.Cursor := crDefault;
    Application.MessageBox('Importação concluída!', 'Importação Planilha Jones', MB_OK + MB_ICONINFORMATION);
    banca.Free;
    bancaDAO.Free;
    distribuidor.Free;
    distribuidorDAO.Free;
    Synchronize(TerminaProcesso);
  end;
end;

procedure Thread_ImportaBancasJones.IniciaProcesso;
begin
  view_CadastroBanca.pbBanca.Visible := True;
  view_CadastroBanca.pbBanca.Position := 0;
  view_CadastroBanca.pbBanca.Refresh;
  view_CadastroBanca.Modo('M');
end;


procedure Thread_ImportaBancasJones.AtualizaLog(sTexto: String);
begin
  FErro.Add(FormatDateTime('yyyy-mm-dd hh:mm:ss', Now()) + ' ' + sTexto)
end;

procedure Thread_ImportaBancasJones.AtualizaProgress;
begin
  view_CadastroBanca.pbBanca.Position := FdPos;
  view_CadastroBanca.pbBanca.Properties.Text := FormatFloat('0.00%',FdPos);
  view_CadastroBanca.pbBanca.Refresh;
end;

procedure Thread_ImportaBancasJones.TerminaProcesso;
begin
  PopulaDistribuidor;
  view_CadastroBanca.pbBanca.Position := 0;
  view_CadastroBanca.pbBanca.Properties.Text := '';
  view_CadastroBanca.pbBanca.Visible := False;
  view_CadastroBanca.pbBanca.Refresh;
  view_CadastroBanca.bFlagImporta := False;
  view_CadastroBanca.Modo('');
  if FErro.Count > 0 then
  begin
    if not Assigned(view_ResultadoProcesso) then
    begin
      view_ResultadoProcesso := Tview_ResultadoProcesso.Create(Application);
    end;
    view_ResultadoProcesso.edtResultado.Text := FErro.Text;
    view_ResultadoProcesso.ShowModal;
    FreeAndNil(view_ResultadoProcesso);
    FErro.Clear;
  end;
end;

procedure Thread_ImportaBancasJones.PopulaDistribuidor;
var
  distribuidorTMP: TDistribuidorVA;
  distribuidores: TObjectList<TDistribuidorVA>;
  distribuidorDAO: TDistribuidorVADAO;
begin
  distribuidorDAO := TDistribuidorVADAO.Create();
  if dm.tbDistribuidorVA.Active then dm.tbDistribuidorVA.Close;
  dm.tbDistribuidorVA.Open;
  distribuidorTMP := TDistribuidorVA.Create();
  distribuidores := distribuidorDAO.FindByID(-1);
  for distribuidorTMP in distribuidores do
  begin
    dm.tbDistribuidorVA.Insert;
    dm.tbDistribuidorVAID_DISTRIBUIDOR.AsInteger := distribuidorTMP.ID;
    dm.tbDistribuidorVACOD_DISTRIBUIDOR.AsInteger := distribuidorTMP.Codigo;
    dm.tbDistribuidorVANOM_DISTRIBUIDOR.AsString := distribuidorTMP.Nome;
    dm.tbDistribuidorVA.Post;
  end;
end;

end.
