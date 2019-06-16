unit ufrmDevolucaoBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxGroupBox, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxLabel, clDevolucoes, clBarrTFO, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Vcl.ActnList, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  cxCheckBox, cxImageComboBox, dxmdaset,
  System.StrUtils, cxCalc, clLacres, frxClass, frxDBSet, frxBarcode,
  clEntregador, clAgentes, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, System.Actions, clAcessos,
  clConexao, cxButtonEdit, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light;

type
  TfrmDevolucaoBase = class(TForm)
    cxGroupBox1: TcxGroupBox;
    aclDevolucao: TActionList;
    actDevolucaoProcessar: TAction;
    actDevolucoesAbrirContainer: TAction;
    actDevolucoesFecharContainer: TAction;
    actDevolucoesReabrirContainer: TAction;
    actDevolucoesSair: TAction;
    cxGroupBox3: TcxGroupBox;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1NUM_NOSSONUMERO: TcxGridDBColumn;
    cxGrid1DBTableView1QTD_VOLUMES: TcxGridDBColumn;
    cxGrid1DBTableView1COD_STATUS_OBJETO: TcxGridDBColumn;
    cxGrid1DBTableView1CD_STATUS_CONTAINER: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxButton5: TcxButton;
    tbDevolucoes: TdxMemData;
    tbDevolucoesNUM_NOSSONUMERO: TStringField;
    tbDevolucoesQTD_VOLUMES: TIntegerField;
    tbDevolucoesCOD_STATUS_OBJETO: TIntegerField;
    tbDevolucoesCOD_STATUS_CONTAINER: TIntegerField;
    cxButton2: TcxButton;
    cxButton4: TcxButton;
    cxLabel2: TcxLabel;
    chkTFO: TcxCheckBox;
    cxNossoNumero: TcxMaskEdit;
    cxLabel3: TcxLabel;
    cxButton3: TcxButton;
    actDevolucoesCancelar: TAction;
    cxButton1: TcxButton;
    ds: TDataSource;
    tbDevolucoesQTD_PESO_OBJETO: TFloatField;
    cxGrid1DBTableView1QTD_PESO_OBJETO: TcxGridDBColumn;
    tbDevolucoesNUM_LACRE: TStringField;
    cxGrid1DBTableView1NUM_LACRE: TcxGridDBColumn;
    cxLacre: TcxTextEdit;
    cxLabel27: TcxLabel;
    tbDevolucoesCOD_BASE: TIntegerField;
    actDevolucoesDescoberto: TAction;
    actDevolucoesListar: TAction;
    tbDevolucoesDES_DEVOLUCAO: TStringField;
    cxGrid1DBTableView1DES_DEVOLUCAO: TcxGridDBColumn;
    tbDevolucoesDAT_EXPEDICAO: TDateField;
    cxGrid1DBTableView1DAT_EXPEDICAO: TcxGridDBColumn;
    tbDevolucoesDES_CHAVE: TStringField;
    cxProtocolo: TcxCheckBox;
    cxLabel4: TcxLabel;
    cxCodAdmCEP: TcxButtonEdit;
    cxNomeAdmCEP: TcxTextEdit;
    actDevolucoesBases: TAction;
    actDevolucoesProtocolo: TAction;
    cxButton7: TcxButton;
    tbDevolucoesNUM_PROTOCOLO: TStringField;
    tbDevolucoesDOM_DESCOBERTO: TStringField;
    cxGrid1DBTableView1DOM_DESCOBERTO: TcxGridDBColumn;
    procedure actDevolucaoProcessarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actDevolucoesSairExecute(Sender: TObject);
    procedure actDevolucoesAbrirContainerExecute(Sender: TObject);
    procedure actDevolucoesReabrirContainerExecute(Sender: TObject);
    procedure actDevolucoesCancelarExecute(Sender: TObject);
    procedure actDevolucoesFecharContainerExecute(Sender: TObject);
    procedure cxNossoNumeroExit(Sender: TObject);
    procedure cxNossoNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure actDevolucoesDescobertoExecute(Sender: TObject);
    procedure actDevolucoesListarExecute(Sender: TObject);
    procedure actDevolucoesBasesExecute(Sender: TObject);
    procedure cxCodAdmCEPPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure actDevolucoesProtocoloExecute(Sender: TObject);
  private
    { Private declarations }
    procedure MontaListaAgentes;
    procedure ListaExpectativas;
    procedure SalvaObjeto;
    procedure SalvaDescoberto;
    procedure ImprimirProtocolo;
    procedure IncluirExpectativa(sNN, sVol: String);
    function AbrirContainer(): Boolean;
    function ListaLacre(): Boolean;
    function ReAbrirContainer(): Boolean;
    function FecharContainer(): Boolean;
    function ImprimeProtocolo(ITipo: Integer): Boolean;
    function ObjetoDescoberto(): Boolean;
    function FecharDescoberto(): Boolean;

  public
    { Public declarations }
  end;

var
  frmDevolucaoBase: TfrmDevolucaoBase;
  sAgentes: String;
  devolucao: TDevolucoes;
  barra: TBarrTFO;
  bLacre: Boolean;
  lacre: TLacre;
  bDescoberto: Boolean;
  agente: TAgente;
  entregador: TEntregador;
  sNomeBase: String;
  acessos: TAcessos;
  conexao: TConexao;

implementation

{$R *.dfm}

uses
  udm, uGlobais, clUtil, ufrmTipoDevolucao, ufrmImpressao, ufrmListaApoio, ufrmData, ufrmSegundaViaProtocolo,
  ufrmInformacoesProduto, ufrmDivergencia;

procedure TfrmDevolucaoBase.actDevolucaoProcessarExecute(Sender: TObject);
begin
  if Application.MessageBox('Confirma a Expedição?', 'Atenção!',
    MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  ListaExpectativas;
end;

procedure TfrmDevolucaoBase.MontaListaAgentes;
var
  i: Integer;
begin
  sAgentes := '';
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  dm.qryPesquisa.SQL.Text :=
    'SELECT * FROM tbusuariosagentes WHERE COD_USUARIO = :USUARIO';
  dm.qryPesquisa.ParamByName('USUARIO').AsInteger :=
    StrToInt(uGlobais.idUsuario);
  dm.ZConn.PingServer;
  dm.qryPesquisa.Open;
  dm.qryPesquisa.First;
  while (not dm.qryPesquisa.Eof) do
  begin
    { if (not TUtil.Empty(sAgentes)) then begin
      sAgentes  :=  sAgentes + ',';
                    end; }
    sAgentes := sAgentes + dm.qryPesquisa.FieldByName('COD_AGENTE').AsString + ',';
    dm.qryPesquisa.Next;
  end;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
end;

procedure TfrmDevolucaoBase.actDevolucoesAbrirContainerExecute(Sender: TObject);
var
  sLacre: String;
begin
  sLacre := '';
  sLacre := InputBox('Nº do Lacre.', 'Informe o Nº do Lacre.: ', '0');
  if TUtil.Empty(sLacre) then
  begin
    sLacre := '0';
  end;
  if TUtil.Empty(sLacre) then
  begin
    Application.MessageBox('Informe o número do lacre!', 'Atenção',
      MB_OK + MB_ICONWARNING);
    Exit;
  end;
  if StrToInt(sLacre) = 0 then
  begin
    Application.MessageBox('Informe o número do lacre!', 'Atenção',
      MB_OK + MB_ICONWARNING);
    Exit;
  end;
  lacre.Numero := sLacre;
  if (not lacre.getObject(sAgentes, 'LACRE')) then
  begin
    Application.MessageBox('Lacre não cadastrado!', 'Atenção!',
      MB_OK + MB_ICONWARNING);
    Exit;
  end;
  if lacre.Status = 1 then
  begin
    Application.MessageBox('Lacre já foi utilizado!', 'Atenção!',
      MB_OK + MB_ICONWARNING);
    Exit;
  end;
  if lacre.Status = 2 then
  begin
    Application.MessageBox('Lacre inutilizado!', 'Atenção!',
      MB_OK + MB_ICONWARNING);
    Exit;
  end;
  cxLacre.Text := sLacre;
  ListaExpectativas;
  if AbrirContainer() then
  begin
    Exit;
  end;
end;

procedure TfrmDevolucaoBase.actDevolucoesBasesExecute(Sender: TObject);
var
  sId: String;
begin
  sId := '';
  sId := Trim(cxCodAdmCEP.Text);
  with dm.qryPesquisa do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT COD_AGENTE AS "Código", NOM_FANTASIA AS "Nome" ' +
      'FROM tbagentes WHERE COD_STATUS = 1';
    dm.ZConn.PingServer;
    Open;
  end;
  if dm.qryPesquisa.IsEmpty then
  begin
    dm.qryPesquisa.Close;
    dm.qryPesquisa.SQL.Clear;
    Exit;
  end
  else
  begin
    dm.qryPesquisa.First;
  end;
  if not Assigned(frmListaApoio) then
  begin
    frmListaApoio := TfrmListaApoio.Create(Application);
  end;
  frmListaApoio.Caption := 'Bases';
  if frmListaApoio.ShowModal = mrOk then
  begin
    cxCodAdmCEP.Text := dm.qryPesquisa.Fields[0].AsString;
    cxCodAdmCEP.Refresh;
    cxNomeAdmCEP.Text := dm.qryPesquisa.Fields[1].AsString;
    cxNomeAdmCEP.Refresh;
  end;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  FreeAndNil(frmListaApoio);
end;

procedure TfrmDevolucaoBase.actDevolucoesCancelarExecute(Sender: TObject);
begin
  if Application.MessageBox('Confirma o cancelamento da operação atual?',
    'Cancelar.', MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  actDevolucaoProcessar.Enabled := False;
  actDevolucoesCancelar.Enabled := False;
  actDevolucoesAbrirContainer.Enabled := True;
  actDevolucoesReabrirContainer.Enabled := True;
  actDevolucoesDescoberto.Enabled := True;
  actDevolucoesFecharContainer.Enabled := False;
  cxLacre.Clear;
  cxLacre.Properties.ReadOnly := True;
  cxCodAdmCEP.Clear;
  cxNomeAdmCEP.Clear;
  cxNossoNumero.Clear;
  cxNossoNumero.Properties.ReadOnly := True;
  tbDevolucoes.Close;
  tbDevolucoes.Open;
  if cxCodAdmCEP.Visible then
  begin
    cxCodAdmCEP.SetFocus;
  end
  else
  begin
    ListaExpectativas;
  end;
end;

procedure TfrmDevolucaoBase.actDevolucoesDescobertoExecute(Sender: TObject);
begin
  if ObjetoDescoberto() then
  begin
    Exit;
  end;
end;

procedure TfrmDevolucaoBase.actDevolucoesFecharContainerExecute
  (Sender: TObject);
begin
  if (not bDescoberto) then begin
    if Application.MessageBox('Confirma fechar o container?', 'Fechar.',
      MB_YESNO + MB_ICONQUESTION) = IDNO then begin
      Exit;
    end;
    if (not tbDevolucoes.IsEmpty) then begin
      tbDevolucoes.First;
    end;
    if FecharContainer() then begin
      Exit;
    end;
  end
  else begin
    if Application.MessageBox('Confirma fechar o envio do Objeto Descoberto?',
      'Fechar.', MB_YESNO + MB_ICONQUESTION) = IDNO then begin
      Exit;
    end;
    if (not tbDevolucoes.IsEmpty) then begin
      tbDevolucoes.First;
    end;
    if FecharDescoberto() then begin
      Exit;
    end;
  end;
end;

procedure TfrmDevolucaoBase.actDevolucoesListarExecute(Sender: TObject);
begin
  ListaExpectativas;
end;

procedure TfrmDevolucaoBase.actDevolucoesProtocoloExecute(Sender: TObject);
begin
  if uGlobais.iNivelUsuario < 4 then
  begin
    if cxCodAdmCEP.Text = '' then
    begin
      Application.MessageBox('Informe a Base!', 'Atenção', MB_OK + MB_ICONWARNING);
      Exit;
    end;
  end;
  if sAgentes.IsEmpty then
  begin
    Application.MessageBox('Base não informada!', 'Atenção', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  ImprimirProtocolo;
end;

procedure TfrmDevolucaoBase.actDevolucoesReabrirContainerExecute
  (Sender: TObject);
var
  sLacre: String;
begin
  sLacre := '';
  sLacre := InputBox('Nº do Lacre.', 'Informe o Nº do Lacre.: ', '0');
  if TUtil.Empty(sLacre) then
  begin
    sLacre := '0';
  end;
  cxLacre.Text := sLacre;
  if TUtil.Empty(cxLacre.Text) then
  begin
    Application.MessageBox('Informe o número do lacre!', 'Atenção',
      MB_OK + MB_ICONWARNING);
    Exit;
  end;
  if StrToInt(cxLacre.Text) = 0 then
  begin
    Application.MessageBox('Informe o número do lacre!', 'Atenção',
      MB_OK + MB_ICONWARNING);
    Exit;
  end;
  if ReAbrirContainer() then
  begin
    Exit;
  end;
end;

procedure TfrmDevolucaoBase.actDevolucoesSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmDevolucaoBase.cxCodAdmCEPPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  if VarToStr(DisplayValue).IsEmpty then
  begin
    DisplayValue := '0';
  end;
  agente.Codigo := DisplayValue;
  cxNomeAdmCEP.Text := agente.getField('NOM_FANTASIA', 'CODIGO');
  sNomeBase := cxNomeAdmCEP.Text;
  ListaExpectativas;
end;

procedure TfrmDevolucaoBase.cxNossoNumeroExit(Sender: TObject);
begin
  if (not TUtil.Empty(cxNossoNumero.Text)) then
  begin
    if (not bDescoberto) then
    begin
      SalvaObjeto;
    end
    else
    begin
      SalvaDescoberto;
    end;
    cxNossoNumero.Clear;
  end;
end;

procedure TfrmDevolucaoBase.cxNossoNumeroKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 then
  begin
    if cxGrid1.IsFocused then
    begin
      Exit;
    end;
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfrmDevolucaoBase.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  agente.Free;
  entregador.Free;
  devolucao.Free;
  tbDevolucoes.Close;
  lacre.Free;
  acessos.Free;
  conexao.Free;
  Action := caFree;
  frmDevolucaoBase := Nil;
end;

procedure TfrmDevolucaoBase.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then
  begin
    if cxGrid1.IsFocused then
    begin
      Exit;
    end;
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfrmDevolucaoBase.FormShow(Sender: TObject);
var
  sBase: String;
begin
  agente := TAgente.Create;
  entregador := TEntregador.Create;
  devolucao := TDevolucoes.Create;
  barra := TBarrTFO.Create;
  lacre := TLacre.Create;
  acessos := TAcessos.Create;
  conexao := TConexao.Create;
  acessos.SetNivel(aclDevolucao);
  bDescoberto := False;
  if uGlobais.iNivelUsuario = 4 then
  begin
    MontaListaAgentes;
    if sAgentes.IsEmpty then
    begin
      Application.MessageBox('Nenhuma Base Atribuida para este usuário! Verifique com o Administrador do Sistema.',
                             PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
      actDevolucoesSairExecute(Sender);
      Exit;
    end;
    sBase := Copy(sAgentes, 1, Pos(',', sAgentes) - 1);
    agente.Codigo := sBase;
    sNomeBase := agente.getField('NOM_FANTASIA', 'CODIGO');
    ListaExpectativas;
  end
  else
  begin
    cxLabel4.Visible := True;
    cxCodAdmCEP.Visible := True;
    cxNomeAdmCEP.Visible := True;
  end;
end;

procedure TfrmDevolucaoBase.ListaExpectativas;
var
  sMess, sVolume: String;
begin
  try
    if uGlobais.iNivelUsuario <> 4 then
    begin
      if cxCodAdmCEP.Text = '' then
      begin
        Application.MessageBox('Informe a Base!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
        Exit;
      end;
      if StrToInt(cxCodAdmCEP.Text) = 0 then
      begin
        Application.MessageBox('Informe a Base!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
        Exit;
      end;
      sAgentes := cxCodAdmCEP.Text;
    end;
    tbDevolucoes.Close;
    tbDevolucoes.Open;
    devolucao.StatusContainer := 1;
    if devolucao.getObject(sAgentes, 'CHAVE6') then
    begin
      tbDevolucoes.IsLoading := True;
      while (not dm.qryGetObject.Eof) do
      begin
        sVolume := FormatFloat('00', dm.qryGetObject.FieldByName('QTD_VOLUMES').AsInteger);
        tbDevolucoes.Insert;
        tbDevolucoesNUM_NOSSONUMERO.Value := dm.qryGetObject.FieldByName('NUM_NOSSONUMERO').AsString;
        tbDevolucoesQTD_VOLUMES.Value := dm.qryGetObject.FieldByName('QTD_VOLUMES').AsInteger;
        tbDevolucoesCOD_STATUS_OBJETO.Value := dm.qryGetObject.FieldByName('COD_STATUS_OBJETO').AsInteger;
        tbDevolucoesCOD_STATUS_CONTAINER.Value := dm.qryGetObject.FieldByName('COD_STATUS_CONTAINER').AsInteger;
        tbDevolucoesCOD_BASE.Value := dm.qryGetObject.FieldByName('COD_AGENTE').AsInteger;
        tbDevolucoesDAT_EXPEDICAO.Value := dm.qryGetObject.FieldByName('DAT_EXPEDICAO').AsDateTime;
        tbDevolucoesDES_DEVOLUCAO.Value := dm.qryGetObject.FieldByName('DES_DEVOLUCAO').AsString;
        tbDevolucoesDES_CHAVE.Value := dm.qryGetObject.FieldByName('NUM_NOSSONUMERO').AsString + sVolume;
        tbDevolucoesQTD_PESO_OBJETO.Value := dm.qryGetObject.FieldByName('QTD_PESO_CONTAINER').AsFloat;
        tbDevolucoesNUM_LACRE.Value := dm.qryGetObject.FieldByName('NUM_LACRE').AsString;
        tbDevolucoesNUM_PROTOCOLO.Value := dm.qryGetObject.FieldByName('NUM_PROTOCOLO').AsString;
        if dm.qryGetObject.FieldByName('DOM_DESCOBERTO').AsString.IsEmpty then
        begin
          tbDevolucoesDOM_DESCOBERTO.Value := 'N';
        end
        else
        begin
          tbDevolucoesDOM_DESCOBERTO.Value := dm.qryGetObject.FieldByName('DOM_DESCOBERTO').AsString;
        end;
        tbDevolucoes.Post;
        dm.qryGetObject.Next;
      end;
    end
    else begin
      Application.MessageBox(PChar('Nenhuma expectativa de devoluçao encontrada!'), PChar('Atenção ' +
                             uGlobais.sUsuario), MB_OK + MB_ICONINFORMATION);
    end;
  finally
    if (not tbDevolucoes.IsEmpty) then
    begin
      tbDevolucoes.First;
    end;
    tbDevolucoes.IsLoading := False;
    actDevolucoesCancelar.Enabled := True;
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
  end;
end;

function TfrmDevolucaoBase.AbrirContainer(): Boolean;
var
  sMess, sVolume: String;
begin
  try
    Result := False;
    if uGlobais.iNivelUsuario <> 4 then
    begin
      if cxCodAdmCEP.Text = '' then
      begin
        Application.MessageBox('Informe a Base!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
        Exit;
      end;
      if StrToInt(cxCodAdmCEP.Text) = 0 then
      begin
        Application.MessageBox('Informe a Base!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
        Exit;
      end;
      sAgentes := cxCodAdmCEP.Text;
    end;
    devolucao.lacre := cxLacre.Text;
    devolucao.StatusContainer := 1;
    if devolucao.getObject(sAgentes, 'LACRE') then
    begin
      if devolucao.StatusContainer = 2 then
      begin
        Application.MessageBox
          ('Container já está fechado! Proceda com o processo de Reabertura de Container.', 'Atenção!', MB_OK + MB_ICONWARNING);
        cxLacre.Clear;
        Exit;
      end
      else if devolucao.StatusContainer = 3 then
      begin
        Application.MessageBox('Container já foi retirado!', 'Atenção!', MB_OK + MB_ICONWARNING);
        cxLacre.Clear;
        Exit;
      end
      else if devolucao.StatusContainer >= 4 then
      begin
        Application.MessageBox('Container em poder da franquia!', 'Atenção!', MB_OK + MB_ICONWARNING);
        cxLacre.Clear;
        Exit;
      end;
      while (not dm.qryGetObject.Eof) do
      begin
        sVolume := FormatFloat('00', dm.qryGetObject.FieldByName('QTD_VOLUMES').AsInteger);
        if tbDevolucoes.Locate('NUM_NOSSONUMERO',dm.qryGetObject.FieldByName('NUM_NOSSONUMERO').AsString,[]) then
        begin
          tbDevolucoes.Edit;
        end
        else
        begin
          tbDevolucoes.Insert;
        end;
        tbDevolucoesNUM_NOSSONUMERO.Value := dm.qryGetObject.FieldByName('NUM_NOSSONUMERO').AsString;
        tbDevolucoesQTD_VOLUMES.Value := dm.qryGetObject.FieldByName('QTD_VOLUMES').AsInteger;
        tbDevolucoesCOD_STATUS_OBJETO.Value := dm.qryGetObject.FieldByName('COD_STATUS_OBJETO').AsInteger;
        tbDevolucoesCOD_STATUS_CONTAINER.Value := dm.qryGetObject.FieldByName('COD_STATUS_CONTAINER').AsInteger;
        tbDevolucoesCOD_BASE.Value := dm.qryGetObject.FieldByName('COD_AGENTE').AsInteger;
        tbDevolucoesDAT_EXPEDICAO.Value := dm.qryGetObject.FieldByName('DAT_EXPEDICAO').AsDateTime;
        tbDevolucoesDES_DEVOLUCAO.Value := dm.qryGetObject.FieldByName('DES_DEVOLUCAO').AsString;
        tbDevolucoesDES_CHAVE.Value := dm.qryGetObject.FieldByName('NUM_NOSSONUMERO').AsString + sVolume;
        tbDevolucoes.Post;
        dm.qryGetObject.Next;
      end;
    end;
    tbDevolucoes.IsLoading := True;
    cxLacre.Properties.ReadOnly := True;
    cxNossoNumero.Properties.ReadOnly := False;
    cxNossoNumero.SetFocus;
    Result := True;
  finally
    actDevolucaoProcessar.Enabled := False;
    actDevolucoesCancelar.Enabled := True;
    actDevolucoesAbrirContainer.Enabled := False;
    actDevolucoesReabrirContainer.Enabled := False;
    actDevolucoesDescoberto.Enabled := False;
    actDevolucoesFecharContainer.Enabled := True;
    acessos.SetNivel(aclDevolucao);
    tbDevolucoes.IsLoading := False;
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
  end;
end;

function TfrmDevolucaoBase.ListaLacre(): Boolean;
var
  sVolume: String;
begin
  try
    if uGlobais.iNivelUsuario <> 4 then
    begin
      if cxCodAdmCEP.Text = '' then
      begin
        Application.MessageBox('Informe a Base!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
        Exit;
      end;
      if StrToInt(cxCodAdmCEP.Text) = 0 then
      begin
        Application.MessageBox('Informe a Base!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
        Exit;
      end;
      sAgentes := cxCodAdmCEP.Text;
    end;
    tbDevolucoes.IsLoading := True;
    if not(devolucao.getObject(sAgentes, 'LACRE')) then
    begin
      Application.MessageBox('Container não encontrado!', 'Atenção!',
        MB_OK + MB_ICONINFORMATION);
      Exit;
    end;
    tbDevolucoes.Close;
    tbDevolucoes.Open;
    while (not dm.qryGetObject.Eof) do
    begin
      sVolume := FormatFloat('00', dm.qryGetObject.FieldByName('QTD_VOLUMES')
        .AsInteger);
      tbDevolucoes.Insert;
      tbDevolucoesNUM_NOSSONUMERO.Value := dm.qryGetObject.FieldByName
        ('NUM_NOSSONUMERO').AsString;
      tbDevolucoesQTD_VOLUMES.Value := dm.qryGetObject.FieldByName
        ('QTD_VOLUMES').AsInteger;
      tbDevolucoesCOD_STATUS_OBJETO.Value := dm.qryGetObject.FieldByName
        ('COD_STATUS_OBJETO').AsInteger;
      tbDevolucoesCOD_STATUS_CONTAINER.Value :=
        dm.qryGetObject.FieldByName('COD_STATUS_CONTAINER').AsInteger;
      tbDevolucoesCOD_BASE.Value := dm.qryGetObject.FieldByName('COD_AGENTE')
        .AsInteger;
      tbDevolucoesDAT_EXPEDICAO.Value := dm.qryGetObject.FieldByName
        ('DAT_EXPEDICAO').AsDateTime;
      tbDevolucoesDES_DEVOLUCAO.Value := dm.qryGetObject.FieldByName
        ('DES_DEVOLUCAO').AsString;
      tbDevolucoesDES_CHAVE.Value := dm.qryGetObject.FieldByName
        ('NUM_NOSSONUMERO').AsString + sVolume;
      tbDevolucoes.Post;
      dm.qryGetObject.Next;
    end;
  finally
    tbDevolucoes.IsLoading := False;
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
  end;
end;

procedure TfrmDevolucaoBase.SalvaObjeto;
var
  sNossoNumero, sIdEntrega, sVolume, sErro, sCodCorrenteSelecionado, sMess, sDescoberto, sDescricao, sChave: String;
  nSobra, iVol: Integer;
  nIdEntrega, nVolume: Int64;
  dPeso: Double;
begin
  if (not tbDevolucoes.Active) then
  begin
    tbDevolucoes.Open;
  end;
  try
    if uGlobais.iNivelUsuario <> 4 then
    begin
      if cxCodAdmCEP.Text = '' then
      begin
        Application.MessageBox('Informe a Base!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
        Exit;
      end;
      if StrToInt(cxCodAdmCEP.Text) = 0 then
      begin
        Application.MessageBox('Informe a Base!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
        Exit;
      end;
      sAgentes := cxCodAdmCEP.Text;
    end;
    sCodCorrenteSelecionado := cxNossoNumero.Text;
    sNossoNumero := '';
    sVolume := '';
    if chkTFO.Checked then
    begin
      if (not TUtil.ENumero(sCodCorrenteSelecionado)) then
      begin
        if Length(sCodCorrenteSelecionado) <> 10 then
        begin
          Application.MessageBox
            ('O Código compactado TFO sempre tem 10 posições!', 'Atenção',
            MB_OK + MB_ICONEXCLAMATION);
          cxNossoNumero.Clear;
          cxNossoNumero.SetFocus;
          Exit;
        end;
        sIdEntrega := LeftStr(sCodCorrenteSelecionado, 7);
        sVolume := RightStr(sCodCorrenteSelecionado, 3);
        nVolume := barra.ExpandInt(sVolume);
        if (nVolume < 0) and (nVolume > 999) then
        begin
          Application.MessageBox('Número do Volume Inválido!', 'Atenção',
            MB_OK + MB_ICONEXCLAMATION);
          cxNossoNumero.Clear;
          cxNossoNumero.SetFocus;
          Exit;
        end;
        sVolume := FormatFloat('00',nVolume);
        nIdEntrega := barra.ExpandLong(sIdEntrega);
        if nIdEntrega = 0 then
        begin
          Application.MessageBox('Nosso Número Inválido!', 'Atenção',
            MB_OK + MB_ICONEXCLAMATION);
          cxNossoNumero.Clear;
          cxNossoNumero.SetFocus;
          Exit;
        end;
        sIdEntrega := FormatFloat('00000000000', nIdEntrega);
      end
      else
      begin
        sIdEntrega := FormatFloat('00000000000', StrToFloatDef(cxNossoNumero.Text,0));
      end;
      If StrToInt(RightStr(sIdEntrega, 1)) <>
        StrToInt(barra.RetDV(LeftStr(sIdEntrega, 10))) then
      begin
        Application.MessageBox('Dígito verificador do nosso número não confere!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
        cxNossoNumero.Clear;
        cxNossoNumero.SetFocus;
        Exit;
      end;
    end
    else
    begin
      sIdEntrega := cxNossoNumero.Text;
      sVolume := '';
    end;
    sNossoNumero := sIdEntrega;
    if not Assigned(frmInformacoesProduto) then
    begin
      frmInformacoesProduto := TfrmInformacoesProduto.Create(Application);
      if (not sVolume.IsEmpty) then
      begin
        frmInformacoesProduto.cxVolume.Value := StrToIntDef(sVolume,0);
      end;
    end;
    if frmInformacoesProduto.ShowModal = mrCancel then
    begin
      FreeAndNil(frmInformacoesProduto);
      Exit;
    end;
    dPeso := 0;
    iVol := 0;
    dPeso := frmInformacoesProduto.cxPesoProduto.Value;
    iVol := frmInformacoesProduto.cxVolume.Value;
    sVolume := FormatFloat('00',iVol);
    if frmInformacoesProduto.cxForaContainer.Checked then
    begin
      sDescoberto := 'S';
    end
    else
    begin
      sDescoberto := 'N';
    end;
    FreeAndNil(frmInformacoesProduto);
    if (not tbDevolucoes.Locate('DES_CHAVE',sNossoNumero + sVolume,[])) then
    begin
      sMess := 'Objeto não consta na lista de Expectativas de Devoluções!' +
               'Tem certeza que este produto deve ser devolvido?';
      if Application.MessageBox(PChar(sMess), PChar('Atenção ' +
                                uGlobais.sUsuario),MB_YESNO + MB_ICONQUESTION) = IDYES then
      begin
        IncluirExpectativa(sNossoNumero, sVolume);
      end
      else
      begin
        cxNossoNumero.Clear;
        cxNossoNumero.SetFocus;
        Exit;
      end;
    end;
    devolucao.Volumes := StrToInt(sVolume);
    devolucao.NossoNumero := sNossoNumero;
    if (not devolucao.getObject(sAgentes, 'NN1')) then
    begin
      Application.MessageBox(PChar('Objeto NN ' + sNossoNumero + ' não está em expectativa de devolução!' ),
                             PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end
    else
    begin
      if devolucao.StatusContainer >= 2 then
      begin
        Application.MessageBox(PChar('Objeto em Container já despachado!'),
          'Atenção!', MB_OK + MB_ICONWARNING);
        Exit;
      end
      else if (devolucao.StatusObjeto = 1) or (devolucao.StatusObjeto = 2) then
      begin
        if devolucao.lacre <> cxLacre.Text then
        begin
          Application.MessageBox
            (PChar('Objeto ' + sNossoNumero + ' já está no container nº. ' +
            devolucao.lacre + ' !'), 'Atenção!', MB_OK + MB_ICONWARNING);
          Exit;
        end;
      end
      else if devolucao.StatusObjeto = 3 then
      begin
        Application.MessageBox
          (PChar('Objeto ' + sNossoNumero + ' foi extraviado !'), 'Atenção!',
          MB_OK + MB_ICONWARNING);
        Exit;
      end
      else if devolucao.StatusObjeto = 4 then
      begin
        Application.MessageBox
          (PChar('Objeto ' + sNossoNumero + ' foi conferido !'), 'Atenção!',
          MB_OK + MB_ICONWARNING);
        Exit;
      end;
      tbDevolucoes.Edit;
      tbDevolucoesNUM_NOSSONUMERO.Value := devolucao.NossoNumero;
      tbDevolucoesQTD_VOLUMES.Value := devolucao.Volumes;
      tbDevolucoesQTD_PESO_OBJETO.Value := dPeso;
      tbDevolucoesCOD_STATUS_OBJETO.Value := 1;
      tbDevolucoesCOD_STATUS_CONTAINER.Value := devolucao.StatusContainer;
      tbDevolucoesNUM_LACRE.Value := cxLacre.Text;
      tbDevolucoesCOD_BASE.Value := devolucao.agente;;
      tbDevolucoesDAT_EXPEDICAO.Value := devolucao.Expedicao;
      tbDevolucoesDES_DEVOLUCAO.Value := devolucao.Descricao;
      tbDevolucoesDOM_DESCOBERTO.Value := sDescoberto;
      tbDevolucoes.Post;
      if tbDevolucoesCOD_STATUS_OBJETO.Value = 1 then
      begin
        if tbDevolucoesCOD_STATUS_CONTAINER.Value = 1 then
        begin
          devolucao.NossoNumero := tbDevolucoesNUM_NOSSONUMERO.AsString;;
          devolucao.Volumes := tbDevolucoesQTD_VOLUMES.AsInteger;;
          devolucao.agente := tbDevolucoesCOD_BASE.Value;
          if devolucao.getObject(sAgentes,'NN1') then
          begin
            devolucao.Expedicao := tbDevolucoesDAT_EXPEDICAO.AsDateTime;;
            devolucao.Lacre := tbDevolucoesNUM_LACRE.AsString;;
            devolucao.Motorista := '';
            devolucao.Retirada := 0;
            devolucao.Recebedor := '';
            devolucao.Recepcao := 0;
            devolucao.Conferente := '';
            devolucao.Conferencia := 0;
            devolucao.PesoContainer := tbDevolucoesQTD_PESO_OBJETO.Value;
            devolucao.StatusContainer := tbDevolucoesCOD_STATUS_CONTAINER.Value;
            devolucao.StatusObjeto := tbDevolucoesCOD_STATUS_OBJETO.AsInteger;
            devolucao.Divergencia := '';
            devolucao.Descricao := tbDevolucoesDES_DEVOLUCAO.AsString;
            devolucao.Descoberto := tbDevolucoesDOM_DESCOBERTO.AsString;
            devolucao.Usuario := uGlobais.sUsuario;
            devolucao.Manutencao := Now;
            if (not devolucao.Update()) then
            begin
              Application.MessageBox('Erro ao tentar salvar produto!', PChar('Atenção' + uGlobais.sUsuario),
                                     MB_OK + MB_ICONEXCLAMATION);
            end;
          end
          else
          begin
            Application.MessageBox('Produto não encontrado!', PChar('Atenção' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
          end;
        end;
      end;
    end;
  finally
    cxNossoNumero.SetFocus;
  end;

end;

function TfrmDevolucaoBase.ReAbrirContainer(): Boolean;
var
  sLacre: String;
begin
  try
    Result := False;
    if uGlobais.iNivelUsuario <> 4 then
    begin
      if cxCodAdmCEP.Text = '' then
      begin
        Application.MessageBox('Informe a Base!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
        Exit;
      end;
      if StrToInt(cxCodAdmCEP.Text) = 0 then
      begin
        Application.MessageBox('Informe a Base!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
        Exit;
      end;
      sAgentes := cxCodAdmCEP.Text;
    end;
    devolucao.lacre := cxLacre.Text;
    devolucao.Usuario := uGlobais.sUsuario;
    devolucao.Manutencao := Now;
    if (not devolucao.getObject(sAgentes, 'LACRE')) then
    begin
      Application.MessageBox('Container não encontrado!', 'Atenção!',
        MB_OK + MB_ICONWARNING);
      cxLacre.Clear;
      cxLacre.SetFocus;
      Exit;
    end
    else
    begin
      if devolucao.StatusContainer < 2 then
      begin
        Application.MessageBox('Container não está fechado.', 'Atenção!',
          MB_OK + MB_ICONWARNING);
        cxLacre.SetFocus;
        Exit;
      end
      else if devolucao.StatusContainer >= 3 then
      begin
        Application.MessageBox('Container não pode ser ReAberto.', 'Atenção!',
          MB_OK + MB_ICONWARNING);
        cxLacre.Clear;
        cxLacre.SetFocus;
        Exit;
      end;
    end;
    bLacre := (Application.MessageBox('Inutilizar lacre anterior?', 'Atenção!',
      MB_YESNO + MB_ICONQUESTION) = IDYES);
    if bLacre then
    begin
      sLacre := InputBox('Novo Lacre', 'Informe o número do novo lacre:', '0');
      if TUtil.Empty(sLacre) then
      begin
        sLacre := '0';
      end;
      if sLacre = '0' then
      begin
        Application.MessageBox('Número de Lacre informado é inválido!',
          'Atenção', MB_OK + MB_ICONWARNING);
        Exit;
      end;
      if sLacre = cxLacre.Text then
      begin
        Application.MessageBox
          ('Número de Lacre informado é igual ao inutilizado!', 'Atenção',
          MB_OK + MB_ICONWARNING);
        Exit;
      end;
      cxLacre.Text := sLacre;
      cxLacre.Properties.ReadOnly := True;
    end;
    if (not devolucao.ReAbrirContainer(bLacre)) then
    begin
      Application.MessageBox(PChar('Erro ao reabrir container Nº. ' +
        devolucao.lacre + '!'), 'Atenção!', MB_OK + MB_ICONWARNING);
      Exit;
    end;
    devolucao.PesoContainer := 0;
    tbDevolucoes.IsLoading := True;
    tbDevolucoes.Close;
    tbDevolucoes.Open;
    cxNossoNumero.Properties.ReadOnly := False;
    cxNossoNumero.SetFocus;
    Result := True;
  finally
    actDevolucaoProcessar.Enabled := False;
    actDevolucoesCancelar.Enabled := True;
    actDevolucoesAbrirContainer.Enabled := False;
    actDevolucoesReabrirContainer.Enabled := False;
    actDevolucoesDescoberto.Enabled := False;
    actDevolucoesFecharContainer.Enabled := True;
    acessos.SetNivel(aclDevolucao);
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
  end;
end;

function TfrmDevolucaoBase.FecharContainer(): Boolean;
var
  sProtocolo: String;
begin
  try
    Result := False;
    if uGlobais.iNivelUsuario <> 4 then
    begin
      if cxCodAdmCEP.Text = '' then
      begin
        Application.MessageBox('Informe a Base!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
        Exit;
      end;
      if StrToInt(cxCodAdmCEP.Text) = 0 then
      begin
        Application.MessageBox('Informe a Base!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
        Exit;
      end;
      sAgentes := cxCodAdmCEP.Text;
    end;
    tbDevolucoes.IsLoading := True;
    sProtocolo := devolucao.NumeroProtocolo;
    while (not tbDevolucoes.Eof) do
    begin
      if tbDevolucoesCOD_STATUS_OBJETO.Value = 1 then
      begin
        if tbDevolucoesCOD_STATUS_CONTAINER.Value = 1 then
        begin
          if StrToIntDef(tbDevolucoesNUM_LACRE.AsString,0) > 0 then
          begin
            if (tbDevolucoesNUM_LACRE.AsString = cxLacre.Text) or (tbDevolucoesNUM_LACRE.AsString.IsEmpty) then
            begin
              devolucao.Expedicao := tbDevolucoesDAT_EXPEDICAO.AsDateTime;
              devolucao.Lacre := tbDevolucoesNUM_LACRE.Value;
              devolucao.NossoNumero := tbDevolucoesNUM_NOSSONUMERO.AsString;
              devolucao.Volumes := tbDevolucoesQTD_VOLUMES.AsInteger;
              devolucao.agente := tbDevolucoesCOD_BASE.Value;
              devolucao.Motorista := '';
              devolucao.Retirada := 0;
              devolucao.Recebedor := '';
              devolucao.Recepcao := 0;
              devolucao.Conferente := '';
              devolucao.Conferencia := 0;
              devolucao.PesoContainer := tbDevolucoesQTD_PESO_OBJETO.Value;
              devolucao.StatusContainer := 2;
              devolucao.StatusObjeto := tbDevolucoesCOD_STATUS_OBJETO.AsInteger;
              devolucao.Divergencia := '';
              devolucao.Descricao := '';
              devolucao.Protocolo := sProtocolo;
              devolucao.Descoberto := tbDevolucoesDOM_DESCOBERTO.Value;
              devolucao.Usuario := uGlobais.sUsuario;
              devolucao.Manutencao := Now;
              if not(devolucao.FecharContainer(sAgentes)) then
              begin
                Application.MessageBox(PChar('Erro a fechar container! Objeto NN ' + devolucao.NossoNumero + '.'),
                                       'Atenção!', MB_OK + MB_ICONWARNING);
              end;
              tbDevolucoes.edit;
              tbDevolucoesNUM_PROTOCOLO.Value := devolucao.Protocolo;
              tbDevolucoesCOD_STATUS_CONTAINER.Value := devolucao.StatusContainer;
              tbDevolucoes.Post
            end;
          end;
        end;
      end;
      tbDevolucoes.Next;
    end;
    if lacre.getObject(sAgentes, 'LACRE') then
    begin
      lacre.Status := 1;
      if (not lacre.Update) then
      begin
        Application.MessageBox(PChar('Lacre não foi Marcado.'), 'Atenção!',
          MB_OK + MB_ICONWARNING);
      end;
    end;
    if (not tbDevolucoes.IsEmpty) then
    begin
      tbDevolucoes.First;
    end;
    ImprimeProtocolo(1);
    cxLacre.Clear;
    cxLacre.Properties.ReadOnly := True;
    cxNossoNumero.Clear;
    cxNossoNumero.Properties.ReadOnly := False;
    Application.MessageBox(PChar('Container nº. ' + devolucao.lacre + ' fechado!'), 'Atenção', MB_OK + MB_ICONINFORMATION);
    Result := True;
  finally
    actDevolucaoProcessar.Enabled := False;
    actDevolucoesCancelar.Enabled := False;
    actDevolucoesAbrirContainer.Enabled := True;
    actDevolucoesReabrirContainer.Enabled := True;
    actDevolucoesDescoberto.Enabled := True;
    actDevolucoesFecharContainer.Enabled := False;
    acessos.SetNivel(aclDevolucao);
    tbDevolucoes.Close;
    tbDevolucoes.Open;
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
  end;
end;

function TfrmDevolucaoBase.ImprimeProtocolo(iTipo : Integer): Boolean;
var
  sNumero: String;
  sArquivoRep: String;
begin
  begin
    sArquivoRep := '';
    if iTipo = 0 then begin
      with dm.frxReport do begin
        dm.frxDBDataset.DataSource := ds;
        if not Assigned(frmImpressao) then begin
          frmImpressao := TfrmImpressao.Create(Application);
        end;
        frmImpressao.cxLabel1.Caption := 'PROTOCOLO DE OBJETO DESCOBERTO';
        frmImpressao.cxArquivo.Text := ExtractFilePath(Application.ExeName) + 'Reports\frxProtocoloDescobertos.fr3';
        if frmImpressao.ShowModal <> mrOk then
        begin
          FreeAndNil(frmImpressao);
          Exit;
        end
        else begin
          if (not FileExists(frmImpressao.cxArquivo.Text)) then begin
            Application.MessageBox(PChar('Arquivo ' + frmImpressao.cxArquivo.Text +
                                   ' não foi encontrado!'), 'Atenção', MB_OK + MB_ICONWARNING);
            Exit;
          end;
        end;
        sArquivoRep := frmImpressao.cxArquivo.Text;
        FreeAndNil(frmImpressao);
        LoadFromFile(sArquivoRep);
        Variables.Items[Variables.IndexOf('numero')].Value    :=  QuotedStr(cxLacre.Text);
        Variables.Items[Variables.IndexOf('expedicao')].Value :=  QuotedStr(FormatDateTime('dd/mm/yyyy',
                                                                  tbDevolucoesDAT_EXPEDICAO.AsDateTime));
        Variables.Items[Variables.IndexOf('base')].Value      :=  QuotedStr(sNomeBase);
        if (not uGlobais.bFlagImprimir) then
        begin
          ShowReport(True);
        end
        else
        begin
          Print;
        end;
      end;
    end
    else begin
      if cxProtocolo.Checked then begin
        if (not tbDevolucoes.IsEmpty) then
        begin
          tbDevolucoes.First;
          while (not tbDevolucoes.Eof) do
          begin
            if tbDevolucoesCOD_STATUS_CONTAINER.Value <= 1 then
            begin
              tbDevolucoes.Delete;
            end
            else
            begin
              tbDevolucoes.Next;
            end;
          end;
        end;
        if (not tbDevolucoes.IsEmpty) then
        begin
          tbDevolucoes.First;
          devolucao.Agente := tbDevolucoesCOD_BASE.AsInteger;
          sNumero := tbDevolucoesNUM_PROTOCOLO.AsString;
          with dm.frxReport do begin
            dm.frxDBDataset.DataSet := tbDevolucoes;
            if not Assigned(frmImpressao) then begin
              frmImpressao := TfrmImpressao.Create(Application);
            end;
            frmImpressao.cxLabel1.Caption := 'PROTOCOLO DE DEVOLUÇÕES';
            frmImpressao.cxArquivo.Text := ExtractFilePath(Application.ExeName) + 'Reports\frxProtocoloDevolucao.fr3';
            if frmImpressao.ShowModal <> mrOk then
            begin
              FreeAndNil(frmImpressao);
              Exit;
            end
            else begin
              if (not FileExists(frmImpressao.cxArquivo.Text)) then begin
                Application.MessageBox(PChar('Arquivo ' + frmImpressao.cxArquivo.Text +
                                       ' não foi encontrado!'), 'Atenção', MB_OK + MB_ICONWARNING);
                Exit;
              end;
            end;
            sArquivoRep := frmImpressao.cxArquivo.Text;
            LoadFromFile(sArquivoRep);
            FreeAndNil(frmImpressao);
            Variables.Items[Variables.IndexOf('numero')].Value    :=  QuotedStr(sNumero);
            Variables.Items[Variables.IndexOf('expedicao')].Value :=  QuotedStr(FormatDateTime('dd/mm/yyyy',
                                                                      tbDevolucoesDAT_EXPEDICAO.AsDateTime));
            Variables.Items[Variables.IndexOf('base')].Value      :=  QuotedStr(sNomeBase);
            if (not uGlobais.bFlagImprimir) then
            begin
              ShowReport(True);
            end
            else
            begin
              Print;
            end;
          end;
        end;
      end;
    end;
  end;
end;

function TfrmDevolucaoBase.ObjetoDescoberto(): Boolean;
var
  sMess: String;
begin
  try
    Result := False;
    ListaExpectativas;
    cxLacre.Text := devolucao.NumeroProtocolo;
    cxLacre.Properties.ReadOnly := True;
    cxNossoNumero.Properties.ReadOnly := False;
    cxNossoNumero.SetFocus;
    //bDescoberto := True;
    Result := True;
  finally
    actDevolucaoProcessar.Enabled := False;
    actDevolucoesCancelar.Enabled := True;
    actDevolucoesAbrirContainer.Enabled := False;
    actDevolucoesReabrirContainer.Enabled := False;
    actDevolucoesDescoberto.Enabled := False;
    actDevolucoesFecharContainer.Enabled := True;
    acessos.SetNivel(aclDevolucao);
  end;
end;

procedure TfrmDevolucaoBase.SalvaDescoberto;
var
  sNossoNumero, sIdEntrega, sVolume, sErro, sCodCorrenteSelecionado, sMess,
    sPeso, sDescricao, sChave: String;
  nSobra, iVol: Integer;
  nIdEntrega, nVolume: Int64;
  dPeso: Double;
begin
  if (not tbDevolucoes.Active) then
  begin
    tbDevolucoes.Open;
  end;
  try
    if uGlobais.iNivelUsuario <> 4 then
    begin
      if cxCodAdmCEP.Text = '' then
      begin
        Application.MessageBox('Informe a Base!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
        Exit;
      end;
      if StrToInt(cxCodAdmCEP.Text) = 0 then
      begin
        Application.MessageBox('Informe a Base!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
        Exit;
      end;
      sAgentes := cxCodAdmCEP.Text;
    end;
    sCodCorrenteSelecionado := cxNossoNumero.Text;
    sNossoNumero := '';
    sVolume := '';
    if chkTFO.Checked then
    begin
      if (not TUtil.ENumero(sCodCorrenteSelecionado)) then
      begin
        if Length(sCodCorrenteSelecionado) <> 10 then
        begin
          Application.MessageBox
            ('O Código compactado TFO sempre tem 10 posições!', 'Atenção',
            MB_OK + MB_ICONEXCLAMATION);
          cxNossoNumero.Clear;
          cxNossoNumero.SetFocus;
          Exit;
        end;
        sIdEntrega := LeftStr(sCodCorrenteSelecionado, 7);
        sVolume := RightStr(sCodCorrenteSelecionado, 3);
        nVolume := barra.ExpandInt(sVolume);
        if (nVolume < 0) and (nVolume > 999) then
        begin
          Application.MessageBox('Número do Volume Inválido!', 'Atenção',
            MB_OK + MB_ICONEXCLAMATION);
          cxNossoNumero.Clear;
          cxNossoNumero.SetFocus;
          Exit;
        end;
        sVolume := Trim(IntToStr(nVolume));
        nIdEntrega := barra.ExpandLong(sIdEntrega);
        if nIdEntrega = 0 then
        begin
          Application.MessageBox('Nosso Número Inválido!', 'Atenção',
            MB_OK + MB_ICONEXCLAMATION);
          cxNossoNumero.Clear;
          cxNossoNumero.SetFocus;
          Exit;
        end;
        sIdEntrega := FormatFloat('00000000000', nIdEntrega);
      end
      else
      begin
        sIdEntrega := cxNossoNumero.Text;
      end;
      If StrToInt(RightStr(sIdEntrega, 1)) <>
        StrToInt(barra.RetDV(LeftStr(sIdEntrega, 10))) then
      begin
        Application.MessageBox
          ('Dígito verificador do nosso número não confere!', 'Atenção',
          MB_OK + MB_ICONEXCLAMATION);
        cxNossoNumero.Clear;
        cxNossoNumero.SetFocus;
        Exit;
      end;
    end
    else
    begin
      sIdEntrega := cxNossoNumero.Text;
      sVolume := '';
    end;
    sNossoNumero := sIdEntrega;
    sPeso := '0';
    dPeso := 0;
    sPeso := InputBox('Peso do Objeto NN ' + sNossoNumero,
      'Informe o peso do objeto: ', '0');
    if TUtil.Empty(sPeso) then
    begin
      Application.MessageBox('Informe o peso do objeto!', 'Atenção',
        MB_OK + MB_ICONEXCLAMATION);
      cxNossoNumero.Clear;
      cxNossoNumero.SetFocus;
      Exit;
    end;
    if (not TryStrToFloat(sPeso, dPeso)) then
    begin
      Application.MessageBox('Informe um valor numérico válido!', 'Atenção',
        MB_OK + MB_ICONEXCLAMATION);
      cxNossoNumero.Clear;
      cxNossoNumero.SetFocus;
      Exit;
    end;
    if dPeso = 0 then
    begin
      Application.MessageBox('Informe o peso do objeto!', 'Atenção',
        MB_OK + MB_ICONEXCLAMATION);
      cxNossoNumero.Clear;
      cxNossoNumero.SetFocus;
      Exit;
    end;
    dPeso := StrToFloat(sPeso);
    if sVolume = '' then
    begin
      sVolume := '0';
      iVol := 0;
      sVolume := InputBox('Número do Volume do Objeto ' + sNossoNumero,
        'Informe o Volume do objeto: ', '1');
      if TUtil.Empty(sVolume) then
      begin
        Application.MessageBox('Informe o Volume do objeto!', 'Atenção',
          MB_OK + MB_ICONEXCLAMATION);
        cxNossoNumero.Clear;
        cxNossoNumero.SetFocus;
        Exit;
      end;
      if (not TryStrToInt(sVolume, iVol)) then
      begin
        Application.MessageBox('Informe um valor numérico válido!', 'Atenção',
          MB_OK + MB_ICONEXCLAMATION);
        cxNossoNumero.Clear;
        cxNossoNumero.SetFocus;
        Exit;
      end;
      if iVol = 0 then
      begin
        Application.MessageBox('Informe o volume do objeto!', 'Atenção',
          MB_OK + MB_ICONEXCLAMATION);
        cxNossoNumero.Clear;
        cxNossoNumero.SetFocus;
        Exit;
      end;
    end;
    sChave := sNossoNumero + FormatFloat('00', StrToInt(sVolume));
    if tbDevolucoes.Locate('DES_CHAVE', sChave, []) then
    begin
      if tbDevolucoesCOD_STATUS_CONTAINER.Value >= 2 then
      begin
        Application.MessageBox(PChar('Container já despachado!'), 'Atenção!',
          MB_OK + MB_ICONWARNING);
      end
      else if tbDevolucoesCOD_STATUS_OBJETO.Value = 1 then
      begin
        Application.MessageBox
          (PChar('Objeto ' + sNossoNumero + ' já está lançado!'), 'Atenção!',
          MB_OK + MB_ICONWARNING);
      end;
    end;
    tbDevolucoes.Insert;
    tbDevolucoesNUM_NOSSONUMERO.Value := sNossoNumero;
    tbDevolucoesQTD_VOLUMES.Value := StrToInt(sVolume);
    tbDevolucoesQTD_PESO_OBJETO.Value := dPeso;
    tbDevolucoesCOD_STATUS_OBJETO.Value := 1;
    tbDevolucoesCOD_STATUS_CONTAINER.Value := 1;
    tbDevolucoesNUM_LACRE.Value := cxLacre.Text;
    tbDevolucoesCOD_BASE.Value :=
      StrToInt(Copy(sAgentes, 1, Pos(',', sAgentes) - 1));
    tbDevolucoesDES_DEVOLUCAO.Value := 'DST - Solicitação TFO';
    tbDevolucoesDES_CHAVE.Value := sChave;
    tbDevolucoes.Post;
  finally
    cxNossoNumero.SetFocus;
  end;
end;

function TfrmDevolucaoBase.FecharDescoberto(): Boolean;
begin
  try
    Result := False;
    if uGlobais.iNivelUsuario <> 4 then
    begin
      if cxCodAdmCEP.Text = '' then
      begin
        Application.MessageBox('Informe a Base!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
        Exit;
      end;
      if StrToInt(cxCodAdmCEP.Text) = 0 then
      begin
        Application.MessageBox('Informe a Base!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
        Exit;
      end;
      sAgentes := cxCodAdmCEP.Text;
    end;
    tbDevolucoes.IsLoading := True;
    devolucao.MaxExpectativa;
    while (not tbDevolucoes.Eof) do
    begin
      if tbDevolucoesCOD_STATUS_OBJETO.Value = 1 then
      begin
        if devolucao.getObject(tbDevolucoesNUM_NOSSONUMERO.AsString, 'NN') then
        begin
          Application.MessageBox(PChar('NN ' + tbDevolucoesNUM_NOSSONUMERO.AsString + ' já lançado para devolução!'), 'Atenção',
                                 MB_OK + MB_ICONWARNING);
        end
        else
        begin
          devolucao.MaxObjeto;
          devolucao.Expedicao := Now;
          devolucao.lacre := tbDevolucoesNUM_LACRE.AsString;
          devolucao.NossoNumero := tbDevolucoesNUM_NOSSONUMERO.AsString;
          devolucao.Volumes := tbDevolucoesQTD_VOLUMES.AsInteger;
          devolucao.StatusObjeto := tbDevolucoesCOD_STATUS_OBJETO.AsInteger;
          devolucao.StatusContainer := 2;
          devolucao.PesoContainer := tbDevolucoesQTD_PESO_OBJETO.Value;
          devolucao.agente := tbDevolucoesCOD_BASE.Value;
          devolucao.Divergencia := '';
          devolucao.Descricao := tbDevolucoesDES_DEVOLUCAO.Value;
          devolucao.Motorista := '';
          devolucao.Retirada := 0;
          devolucao.Recebedor := '';
          devolucao.Recepcao := 0;
          devolucao.Conferente := '';
          devolucao.Conferencia := 0;
          devolucao.Usuario := uGlobais.sUsuario;
          devolucao.Manutencao := Now;
          if not(devolucao.Insert()) then
          begin
            Application.MessageBox
              (PChar('Erro a incluir objeto descoberto! Objeto NN ' +
              devolucao.NossoNumero + '.'), 'Atenção!', MB_OK + MB_ICONWARNING);
          end;
          tbDevolucoes.edit;
          tbDevolucoesCOD_STATUS_CONTAINER.Value := 2;
          tbDevolucoes.Post
        end;
      end;
      tbDevolucoes.Next;
    end;
    ImprimeProtocolo(0);
    cxLacre.Clear;
    cxLacre.Properties.ReadOnly := True;
    cxNossoNumero.Clear;
    cxNossoNumero.Properties.ReadOnly := False;
    Application.MessageBox(PChar('Container nº. ' + devolucao.lacre +
      ' fechado!'), 'Atenção', MB_OK + MB_ICONINFORMATION);
    Result := True;
  finally
    actDevolucaoProcessar.Enabled := False;
    actDevolucoesCancelar.Enabled := False;
    actDevolucoesAbrirContainer.Enabled := True;
    actDevolucoesReabrirContainer.Enabled := True;
    actDevolucoesDescoberto.Enabled := True;
    actDevolucoesFecharContainer.Enabled := False;
    bDescoberto := False;
    acessos.SetNivel(aclDevolucao);
    tbDevolucoes.Close;
    tbDevolucoes.Open;
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
  end;
end;

procedure TfrmDevolucaoBase.ImprimirProtocolo;
var
  sVolume: String;
begin
  if not Assigned(frmSegundaViaProtocolo) then
  begin
    frmSegundaViaProtocolo := TfrmSegundaViaProtocolo.Create(Application);
  end;
  frmSegundaViaProtocolo.sBases := sAgentes;
  if frmSegundaViaProtocolo.ShowModal = mrCancel then
  begin
    FreeAndNil(frmSegundaViaProtocolo);
    Exit;
  end;
  devolucao.Protocolo := frmSegundaViaProtocolo.sProtocolo;
  sId := sAgentes;
  FreeAndNil(frmSegundaViaProtocolo);
    tbDevolucoes.Close;
    tbDevolucoes.Open;
    if devolucao.getObject(sId, 'PROTOCOLO') then
    begin
    tbDevolucoes.IsLoading := True;
    while (not dm.qryGetObject.Eof) do
    begin
      sVolume := FormatFloat('00', dm.qryGetObject.FieldByName('QTD_VOLUMES').AsInteger);
      tbDevolucoes.Insert;
      tbDevolucoesNUM_NOSSONUMERO.Value := dm.qryGetObject.FieldByName('NUM_NOSSONUMERO').AsString;
      tbDevolucoesQTD_VOLUMES.Value := dm.qryGetObject.FieldByName('QTD_VOLUMES').AsInteger;
      tbDevolucoesCOD_STATUS_OBJETO.Value := dm.qryGetObject.FieldByName('COD_STATUS_OBJETO').AsInteger;
      tbDevolucoesCOD_STATUS_CONTAINER.Value := dm.qryGetObject.FieldByName('COD_STATUS_CONTAINER').AsInteger;
      tbDevolucoesCOD_BASE.Value := dm.qryGetObject.FieldByName('COD_AGENTE').AsInteger;
      tbDevolucoesDAT_EXPEDICAO.Value := dm.qryGetObject.FieldByName('DAT_EXPEDICAO').AsDateTime;
      tbDevolucoesDES_DEVOLUCAO.Value := dm.qryGetObject.FieldByName('DES_DEVOLUCAO').AsString;
      tbDevolucoesDES_CHAVE.Value := dm.qryGetObject.FieldByName('NUM_NOSSONUMERO').AsString + sVolume;
      tbDevolucoesQTD_PESO_OBJETO.Value := dm.qryGetObject.FieldByName('QTD_PESO_CONTAINER').AsFloat;
      tbDevolucoesNUM_LACRE.Value := dm.qryGetObject.FieldByName('NUM_LACRE').AsString;
      tbDevolucoesNUM_PROTOCOLO.Value := dm.qryGetObject.FieldByName('NUM_PROTOCOLO').AsString;
      tbDevolucoes.Post;
      dm.qryGetObject.Next;
    end;
  end
  else begin
    Application.MessageBox(PChar('Nenhum Protocolo encontrado!'), PChar('Atenção ' +
                           uGlobais.sUsuario), MB_OK + MB_ICONINFORMATION);
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
    Exit;
  end;
  tbDevolucoes.First;
  ImprimeProtocolo(1);
  cxLacre.Clear;
  cxLacre.Properties.ReadOnly := True;
  cxNossoNumero.Clear;
  cxNossoNumero.Properties.ReadOnly := False;
  tbDevolucoes.Close;
  if cxCodAdmCEP.Visible then
  begin
    cxCodAdmCEP.Clear;
    cxNomeAdmCEP.Clear;
    cxCodAdmCEP.SetFocus;
  end;
end;

procedure TfrmDevolucaoBase.IncluirExpectativa(sNN, sVol: String);
var
  sBase, sVolume : String;
begin
    sBase := Copy(sAgentes, 1, Pos(',', sAgentes) - 1);
    sVolume := FormatFloat('00', StrToIntDef(sVol,1));
    tbDevolucoes.Insert;
    tbDevolucoesNUM_NOSSONUMERO.Value := sNN;
    tbDevolucoesQTD_VOLUMES.Value := StrToIntDef(sVol,1);
    tbDevolucoesCOD_STATUS_OBJETO.Value := 1;
    tbDevolucoesCOD_STATUS_CONTAINER.Value := 1;
    tbDevolucoesCOD_BASE.Value := StrToInt(sBase);
    tbDevolucoesDAT_EXPEDICAO.Value := Now;
    tbDevolucoesDES_DEVOLUCAO.Value := 'EGB-Envio Gerado pela Base';
    tbDevolucoesDES_CHAVE.Value := sNN + sVolume;
    tbDevolucoesQTD_PESO_OBJETO.Value := 0;
    tbDevolucoesNUM_LACRE.Value := cxLacre.Text;
    tbDevolucoesNUM_PROTOCOLO.Value := '';
    tbDevolucoesDOM_DESCOBERTO.Value := 'N';
    tbDevolucoes.Post;
    devolucao.Sequencia := 0;
    devolucao.Objeto := 0;
    devolucao.Expedicao := tbDevolucoesDAT_EXPEDICAO.Value;
    devolucao.agente := StrToInt(sBase);
    devolucao.Lacre := tbDevolucoesNUM_LACRE.Value;
    devolucao.NossoNumero := tbDevolucoesNUM_NOSSONUMERO.Value;
    devolucao.Volumes := tbDevolucoesQTD_VOLUMES.Value;
    devolucao.StatusObjeto := tbDevolucoesCOD_STATUS_OBJETO.Value;
    devolucao.StatusContainer := tbDevolucoesCOD_STATUS_CONTAINER.Value;
    devolucao.Divergencia := '';
    devolucao.Motorista := '';
    devolucao.Retirada := 0;
    devolucao.Recebedor := '';
    devolucao.Recepcao := 0;
    devolucao.Conferente := '';
    devolucao.Conferencia := 0;
    devolucao.PesoContainer := tbDevolucoesQTD_PESO_OBJETO.Value;
    devolucao.Descricao := tbDevolucoesDES_DEVOLUCAO.AsString;
    devolucao.Descoberto := tbDevolucoesDOM_DESCOBERTO.Value;
    devolucao.Usuario := uGlobais.sUsuario;
    devolucao.Manutencao := Now;
    if (not devolucao.Exist()) then
    begin
      if (not devolucao.Insert()) then
      begin
        Application.MessageBox
          (PChar('Erro ao incluir Objeto' + devolucao.NossoNumero + ' !'),
          'Atenção', MB_ICONERROR + MB_OK);
      end;
    end
    else
    begin
      Application.MessageBox(PChar('Expectativa NN ' + devolucao.NossoNumero + ' já foi inserida anteriormente!'),
                             PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
    end;

end;

end.
