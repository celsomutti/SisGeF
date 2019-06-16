unit ufrmAcareacoes;

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
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxLabel, clAgentes, clAcareacoes,
  clBarrTFO, clCodigosEntregadores, clEntrega, clEnvioEMail,
  clExtravios, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxCalendar,
  cxMaskEdit, cxButtonEdit, cxTextEdit, cxDropDownEdit, cxCurrencyEdit, cxMemo,
  System.Actions, Vcl.ActnList, System.StrUtils,
  clRestricoes, clAcessos, dxSkinsdxStatusBarPainter, cxProgressBar,
  dxStatusBar, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxBlobEdit,
  uthrPopularAcareacoes, clConexao, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmAcareacoes = class(TForm)
    cxLabel27: TcxLabel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dsAcareacoes: TDataSource;
    cxGrid1DBTableView1ID_ACAREACAO: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_ACAREACAO: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_NOSSONUMERO: TcxGridDBColumn;
    cxGrid1DBTableView1COD_ENTREGADOR: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_ENTREGADOR: TcxGridDBColumn;
    cxGrid1DBTableView1COD_BASE: TcxGridDBColumn;
    cxGrid1DBTableView1DES_MOTIVO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_TRATATIVA: TcxGridDBColumn;
    cxGrid1DBTableView1DES_APURACAO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_RESULTADO: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_EXTRAVIO: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_MULTA: TcxGridDBColumn;
    cxGrid1DBTableView1DES_ENVIO_CORRESPONDENCIA: TcxGridDBColumn;
    cxGrid1DBTableView1DES_RETORNO_CORRESPONDENCIA: TcxGridDBColumn;
    cxGrid1DBTableView1DES_OBSERVACOES: TcxGridDBColumn;
    aclAcareacao: TActionList;
    actAcareacoesIncluir: TAction;
    actAcareacoesEditar: TAction;
    actAcareacoesLocalizar: TAction;
    actAcareacoesCancelar: TAction;
    actAcareacoesGravar: TAction;
    actAcareacoesExportar: TAction;
    actAcareacoesSair: TAction;
    dxStatusBar1: TdxStatusBar;
    dxStatusBar1Container0: TdxStatusBarContainerControl;
    cxProgressBar: TcxProgressBar;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxButton5: TcxButton;
    cxButton6: TcxButton;
    cxButton7: TcxButton;
    actAcareacoesFiltrar: TAction;
    cxButton8: TcxButton;
    actAcareacoesPendentes: TAction;
    cxButton9: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actAcareacoesIncluirExecute(Sender: TObject);
    procedure actAcareacoesEditarExecute(Sender: TObject);
    procedure actAcareacoesLocalizarExecute(Sender: TObject);
    procedure actAcareacoesCancelarExecute(Sender: TObject);
    procedure actAcareacoesSairExecute(Sender: TObject);
    procedure cxGrid1DBTableView1NUM_NOSSONUMEROPropertiesValidate
      (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cxGrid1DBTableView1COD_ENTREGADORPropertiesValidate
      (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure actAcareacoesGravarExecute(Sender: TObject);
    procedure cxGrid1DBTableView1ID_ACAREACAOPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGrid1DBTableView1COD_BASEPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGrid1DBTableView1DES_MOTIVOPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGrid1DBTableView1DES_TRATATIVAPropertiesValidate
      (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cxGrid1DBTableView1DES_APURACAOPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGrid1DBTableView1DES_RESULTADOPropertiesValidate
      (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cxGrid1DBTableView1DES_ENVIO_CORRESPONDENCIAPropertiesValidate
      (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cxGrid1DBTableView1DES_RETORNO_CORRESPONDENCIAPropertiesValidate
      (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cxGrid1DBTableView1DAT_ACAREACAOPropertiesValidate
      (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cxGrid1DBTableView1CanFocusRecord(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; var AAllow: Boolean);
    procedure actAcareacoesFiltrarExecute(Sender: TObject);
    procedure actAcareacoesPendentesExecute(Sender: TObject);
  private
    { Private declarations }
    procedure ListaEntregador;
    procedure ListaAgente;
    procedure SalvaExtravio(iTipo: Integer);
    procedure GeraRestricao(bAVista: Boolean);
    procedure Modo;
    procedure ModoGrid;
    procedure SalvaAcareacao;
    procedure LocalizarAcareacao;
    procedure FiltrarDados;

    function ValidaNN(sNN: String; var sMensagem: TCaption): Boolean;
    function ValidaEntregador(sCodigo: String; var sMensagem: TCaption)
      : Boolean;
  public
    { Public declarations }

    sId: String;
    sColuna: String;
    sOperacao: String;
  end;

var
  frmAcareacoes: TfrmAcareacoes;
  agente: TAgente;
  acareacao: TAcareacoes;
  barra: TBarrTFO;
  entregador: TCodigosEntregadores;
  entrega: TEntrega;
  email: TEnviarEmail;
  extravio: TExtravios;
  restricao: TRestricoes;
  acessos: TAcessos;
  bSalva: Boolean;
  thracareacao: thrPopularAcareacoes;
  conexao: TConexao;

implementation

{$R *.dfm}

uses udm, clUtil, ufrmGravarExtravio, uGlobais, ufrmListaApoio, ufrmFiltro;

function TfrmAcareacoes.ValidaNN(sNN: String; var sMensagem: TCaption): Boolean;
var
  sNumero: String;
  sAgente : String;
begin
  Result := False;
  if sOperacao = 'I' then
  begin
    sNumero := FormatFloat('00000000000', StrToInt(sNN));
    If StrToInt(RightStr(sNumero, 1)) <>
      StrToInt(barra.RetDV(LeftStr(sNumero, 10))) then
    begin
      sMensagem := 'Nosso Número informado é inválido!';
      Exit;
    end;
    if entrega.getObject(sNN, 'NOSSONUMERO') then
    begin
      dm.tbAcareacoesNUM_NOSSONUMERO.Value := sNN;
      dm.tbAcareacoesCOD_ENTREGADOR.Value := entrega.entregador;
      entregador.Codigo := entrega.entregador;
      dm.tbAcareacoesNOM_ENTREGADOR.Value := entregador.getField('NOM_FANTASIA','CODIGO');
      sAgente := entregador.getField('COD_AGENTE','CODIGO');
      dm.tbAcareacoesCOD_BASE.Value := StrToIntDef(sAgente,0);
      agente.Codigo := IntToStr(entrega.agente);
      dm.tbAcareacoesNOM_BASE.Value := agente.getField('NOM_FANTASIA','CODIGO');
      dm.tbAcareacoesVAL_EXTRAVIO.Value := entrega.ValorProduto;
      dm.qryGetObject.Close;
      dm.qryGetObject.SQL.Clear;
    end;
  end;
  Result := True;
end;

function TfrmAcareacoes.ValidaEntregador(sCodigo: String;
  var sMensagem: TCaption): Boolean;
var
  sNome, sCodADm, sAdm: String;
begin
  Result := False;
  if sOperacao = 'I' then
  begin

    if (not entregador.getObject(sCodigo, 'CODIGO')) then
    begin
      sMensagem := 'Código de Entregador não cadastrado!';
      Exit;
    end;
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
    sNome := entregador.Nome;
    sCodADm := IntToStr(entregador.agente);
    agente.Codigo := sCodADm;
    sAdm := agente.getField('NOM_FANTASIA', 'CODIGO');
    dm.tbAcareacoesCOD_ENTREGADOR.Value := StrToInt(sCodigo);
    dm.tbAcareacoesNOM_ENTREGADOR.Value := sNome;
    dm.tbAcareacoesCOD_BASE.Value := StrToInt(sCodADm);
    dm.tbAcareacoesNOM_BASE.Value := sAdm;
  end;
  Result := True;
end;

procedure TfrmAcareacoes.ListaEntregador;
var
  sId: String;
  i: Integer;
  bFlag: Boolean;
begin
  sId := '';
  Screen.Cursor := crHourGlass;
  with dm.qryPesquisa do
  begin
    Close;
    SQL.Clear;
    SQL.Text :=
      'SELECT COD_ENTREGADOR AS "Código", NOM_FANTASIA AS "Nome", COD_AGENTE AS "Ad. CEP" '
      + 'FROM tbcodigosentregadores ';
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
  frmListaApoio.Caption := 'Entregadores';
  Screen.Cursor := crDefault;
  i := 0;
  if frmListaApoio.ShowModal = mrOk then
  begin
    sId := dm.qryPesquisa.Fields[0].AsString;
    cxGrid1DBTableView1COD_ENTREGADOR.DataBinding.Field.Value := sId;
    cxGrid1DBTableView1NOM_ENTREGADOR.DataBinding.Field.Value :=
      dm.qryPesquisa.Fields[1].AsString;
    cxGrid1DBTableView1COD_BASE.DataBinding.Field.Value := dm.qryPesquisa.Fields
      [2].AsString;
    agente.Codigo := dm.qryPesquisa.Fields[2].AsString;
    dm.tbAcareacoesNOM_BASE.Value := agente.getField('NOM_FANTASIA', 'CODIGO');
    bFlag := True;
  end;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  FreeAndNil(frmListaApoio);

end;

procedure TfrmAcareacoes.ListaAgente;
var
  sId: String;
  i: Integer;
  bFlag: Boolean;
begin
  sId := '';
  Screen.Cursor := crHourGlass;
  with dm.qryPesquisa do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT COD_AGENTE AS "Código", NOM_FANTASIA AS "Nome" ' +
      'FROM tbagentes ';
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
  frmListaApoio.Caption := 'Administradores de CEP';
  Screen.Cursor := crDefault;
  i := 0;
  if frmListaApoio.ShowModal = mrOk then
  begin
    sId := dm.qryPesquisa.Fields[0].AsString;
    cxGrid1DBTableView1COD_BASE.DataBinding.Field.Value := sId;
    agente.Codigo := dm.qryPesquisa.Fields[2].AsString;
    dm.tbAcareacoesNOM_BASE.Value := agente.getField('NOM_FANTASIA', 'CODIGO');
    bFlag := True;
  end;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  FreeAndNil(frmListaApoio);
end;

procedure TfrmAcareacoes.SalvaExtravio(iTipo: Integer);
var
  sItens, sRastreio: TStringList;
  bAVista: Boolean;
  sNN : String;
  dVerba: Double;
begin
  sNN := FloatToStr(dm.tbAcareacoesNUM_NOSSONUMERO.AsFloat);
  if extravio.NNExiste(sNN) then
  begin
    Application.MessageBox(PChar('Já existe um extravio registro para este NN (' + sNN + ')'), 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  dVerba := 0;
  sRastreio := TStringList.Create;
  if entrega.getObject(sNN, 'NOSSONUMERO') then
  begin
    if entrega.Fechado = 'S' then
    begin
      dVerba := entrega.VerbaEntregador
    end
    else
    begin
      entrega.Baixado := 'E';
      entrega.DataBaixa := dm.tbAcareacoesDAT_ACAREACAO.AsDateTime;
      sRastreio.Text := entrega.Rastreio;
      sRastreio.Add('Entrega Extraviada em ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' por ' + uGlobais.sNomeUsuario);
      entrega.Rastreio := sRastreio.Text;
      if not entrega.Update then
      begin
        Application.MessageBox('Erro ao atualizar o registro de entrega!', PChar('Atenção ' + uGlobais.sUsuario),
        MB_OK + MB_ICONEXCLAMATION);
      end;
    end;
  end;
  bAVista := False;
  sItens := TStringList.Create();
  sResultado := '';
  if dm.tbAcareacoes.State = dsInsert then
  begin
    cxGrid1DBTableView1NUM_NOSSONUMERO.FocusWithSelection;
    dm.tbAcareacoes.Post;
  end;
  bAVista := False;
  extravio.Codigo := 0;
  extravio.NossoNumero := FloatToStr(dm.tbAcareacoesNUM_NOSSONUMERO.AsFloat);
  extravio.Data := dm.tbAcareacoesDAT_ACAREACAO.AsDateTime;
  extravio.entregador := dm.tbAcareacoesCOD_ENTREGADOR.AsInteger;
  extravio.agente := dm.tbAcareacoesCOD_BASE.AsInteger;
  extravio.Descricao := dm.tbAcareacoesDES_RESULTADO.AsString;
  extravio.Produto := dm.tbAcareacoesVAL_EXTRAVIO.AsFloat;
  extravio.Multa := dm.tbAcareacoesVAL_MULTA.AsFloat;
  extravio.Verba := dVerba;
  extravio.Envio := dm.tbAcareacoesDES_ENVIO_CORRESPONDENCIA.AsString;
  extravio.Retorno := dm.tbAcareacoesDES_RETORNO_CORRESPONDENCIA.AsString;
  extravio.Obs := dm.tbAcareacoesDES_OBSERVACOES.Text + #13 + 'Extravio gerado por acareação ID ' + acareacao.id;
  extravio.Total := extravio.Produto + extravio.Multa + extravio.Verba;
  extravio.Percentual := 0;
  extravio.Extrato := 0;
  extravio.Excutor := uGlobais.sUsuario;
  extravio.Manutencao := Now;
  extravio.restricao := 'N';
  extravio.Tipo := iTipo;
  extravio.ValDebito := 0;
  extravio.Debito := 'N';
  if (not extravio.Insert()) then
  begin
    Application.MessageBox('Falha ao gravar o extravio!', 'Erro',
      MB_OK + MB_ICONERROR);
    if dm.tbAcareacoes.Locate('NUM_NOSSONUMERO', extravio.NossoNumero, []) then
    begin
      dm.tbAcareacoes.Edit;
      cxGrid1DBTableView1NUM_NOSSONUMERO.FocusWithSelection;
      Exit;
    end;
  end;
  //GeraRestricao(bAVista);
  sOperacao := 'X';
  Modo;
end;

procedure TfrmAcareacoes.actAcareacoesCancelarExecute(Sender: TObject);
begin
  dm.tbAcareacoes.Close;
  dm.tbAcareacoes.Open;
  sOperacao := 'X';
  Modo;
  ModoGrid;
end;

procedure TfrmAcareacoes.actAcareacoesEditarExecute(Sender: TObject);
begin
  sOperacao := 'U';
  Modo;
  ModoGrid;
  cxGrid1DBTableView1ID_ACAREACAO.FocusWithSelection;
  dm.tbAcareacoes.Edit;
end;

procedure TfrmAcareacoes.actAcareacoesFiltrarExecute(Sender: TObject);
begin
  FiltrarDados;
end;

procedure TfrmAcareacoes.actAcareacoesGravarExecute(Sender: TObject);
begin
  SalvaAcareacao;
end;

procedure TfrmAcareacoes.actAcareacoesIncluirExecute(Sender: TObject);
begin
  sOperacao := 'I';
  Modo;
  ModoGrid;
  if (not dm.tbAcareacoes.Active) then
  begin
    dm.tbAcareacoes.Open;
  end;
  dm.tbAcareacoes.Insert;
  dm.tbAcareacoesDES_OBSERVACOES.Text := '';
  dm.tbAcareacoesDAT_ACAREACAO.Value := Now;
  bSalva := True;
end;

procedure TfrmAcareacoes.actAcareacoesLocalizarExecute(Sender: TObject);
begin
  if bSalva then
  begin
    if Application.MessageBox
      ('Existem dados qua ainda não foram salvos. Continuar?', 'Atenção',
      MB_YESNO + MB_ICONQUESTION) = IDNO then
    begin
      Exit;
    end;
  end;
  dm.tbAcareacoes.Close;
  dm.tbAcareacoes.Open;
  sOperacao := 'S';
  Modo;
  ModoGrid;
  dm.tbAcareacoes.Insert;
  cxGrid1DBTableView1ID_ACAREACAO.FocusWithSelection;
end;

procedure TfrmAcareacoes.actAcareacoesPendentesExecute(Sender: TObject);
begin
  sId := '';
  sColuna := 'RESULTADO';
  LocalizarAcareacao;
end;

procedure TfrmAcareacoes.actAcareacoesSairExecute(Sender: TObject);
begin
  try
    Perform(WM_CLOSE, 0, 0);
  except
    on E: Exception do
      MessageDlg(E.Message, mtError, mbOKCancel, 0);
  end;
end;

procedure TfrmAcareacoes.cxGrid1DBTableView1CanFocusRecord
  (Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  var AAllow: Boolean);
begin
  if Pos(sOperacao, 'IU') > 0 then
  begin
    if (not TUtil.Empty(ARecord.DisplayTexts[9])) then
    begin
      if StrToInt(Copy(ARecord.DisplayTexts[9], 1, 2)) > 1 then
      begin
        cxGrid1DBTableView1DES_MOTIVO.Properties.ReadOnly := True;
        cxGrid1DBTableView1DES_TRATATIVA.Properties.ReadOnly := True;
        cxGrid1DBTableView1DES_APURACAO.Properties.ReadOnly := True;
        cxGrid1DBTableView1DES_RESULTADO.Properties.ReadOnly := True;
        cxGrid1DBTableView1VAL_EXTRAVIO.Properties.ReadOnly := True;
        cxGrid1DBTableView1VAL_MULTA.Properties.ReadOnly := True;
        cxGrid1DBTableView1DES_ENVIO_CORRESPONDENCIA.Properties.
          ReadOnly := False;
        cxGrid1DBTableView1DES_RETORNO_CORRESPONDENCIA.Properties.
          ReadOnly := False;
        cxGrid1DBTableView1DES_OBSERVACOES.Properties.ReadOnly := False;
      end
      else
      begin
        cxGrid1DBTableView1DES_MOTIVO.Properties.ReadOnly := False;
        cxGrid1DBTableView1DES_TRATATIVA.Properties.ReadOnly := False;
        cxGrid1DBTableView1DES_APURACAO.Properties.ReadOnly := False;
        cxGrid1DBTableView1DES_RESULTADO.Properties.ReadOnly := False;
        cxGrid1DBTableView1VAL_EXTRAVIO.Properties.ReadOnly := False;
        cxGrid1DBTableView1VAL_MULTA.Properties.ReadOnly := False;
        cxGrid1DBTableView1DES_ENVIO_CORRESPONDENCIA.Properties.
          ReadOnly := False;
        cxGrid1DBTableView1DES_RETORNO_CORRESPONDENCIA.Properties.
          ReadOnly := False;
        cxGrid1DBTableView1DES_OBSERVACOES.Properties.ReadOnly := False;
      end;
    end;
  end;
end;

procedure TfrmAcareacoes.cxGrid1DBTableView1COD_BASEPropertiesValidate
  (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  if sOperacao = 'S' then
  begin
    sId := DisplayValue;
    sColuna := 'AGENTE';
    LocalizarAcareacao;
  end;
end;

procedure TfrmAcareacoes.cxGrid1DBTableView1COD_ENTREGADORPropertiesValidate
  (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  if sOperacao = 'I' then
  begin
    Error := (not ValidaEntregador(DisplayValue, ErrorText));
  end
  else if sOperacao = 'S' then
  begin
    sId := DisplayValue;
    sColuna := 'ENTREGADOR';
    LocalizarAcareacao;
  end;
end;

procedure TfrmAcareacoes.cxGrid1DBTableView1DAT_ACAREACAOPropertiesValidate
  (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  if sOperacao = 'S' then
  begin
    sId := DisplayValue;
    sColuna := 'DATA';
    LocalizarAcareacao;
  end;
end;

procedure TfrmAcareacoes.cxGrid1DBTableView1DES_APURACAOPropertiesValidate
  (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  if sOperacao = 'S' then
  begin
    sId := DisplayValue;
    sColuna := 'APURACAO';
    LocalizarAcareacao;
  end;
end;

procedure TfrmAcareacoes.
  cxGrid1DBTableView1DES_ENVIO_CORRESPONDENCIAPropertiesValidate
  (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  if sOperacao = 'S' then
  begin
    sId := DisplayValue;
    sColuna := 'ENVIO';
    LocalizarAcareacao;
  end;
end;

procedure TfrmAcareacoes.cxGrid1DBTableView1DES_MOTIVOPropertiesValidate
  (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  if sOperacao = 'S' then
  begin
    sId := DisplayValue;
    sColuna := 'MOTIVO';
    LocalizarAcareacao;
  end;
end;

procedure TfrmAcareacoes.cxGrid1DBTableView1DES_RESULTADOPropertiesValidate
  (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  if sOperacao = 'S' then
  begin
    sId := DisplayValue;
    sColuna := 'RESULTADO';
    LocalizarAcareacao;
  end;
end;

procedure TfrmAcareacoes.
  cxGrid1DBTableView1DES_RETORNO_CORRESPONDENCIAPropertiesValidate
  (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  if sOperacao = 'S' then
  begin
    sId := DisplayValue;
    sColuna := 'RETORNO';
    LocalizarAcareacao;
  end;
end;

procedure TfrmAcareacoes.cxGrid1DBTableView1DES_TRATATIVAPropertiesValidate
  (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  if sOperacao = 'S' then
  begin
    sId := DisplayValue;
    sColuna := 'TRATATIVA';
    LocalizarAcareacao;
  end;
end;

procedure TfrmAcareacoes.cxGrid1DBTableView1ID_ACAREACAOPropertiesValidate
  (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  if sOperacao = 'S' then
  begin
    sId := DisplayValue;
    sColuna := 'ID';
    LocalizarAcareacao;
  end;
end;

procedure TfrmAcareacoes.cxGrid1DBTableView1NUM_NOSSONUMEROPropertiesValidate
  (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  if TUtil.Empty(DisplayValue) then
  begin
    Exit;
  end;
  if sOperacao = 'I' then
  begin
    Error := (not ValidaNN(DisplayValue, ErrorText));
  end
  else if sOperacao = 'S' then
  begin
    sId := DisplayValue;
    sColuna := 'NOSSONUMERO';
    LocalizarAcareacao;
  end;
end;

procedure TfrmAcareacoes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm.tbAcareacoes.Close;
  barra.Free;
  extravio.Free;
  entregador.Free;
  agente.Free;
  restricao.Free;
  acessos.Free;
  entrega.Free;
  acareacao.Free;
  conexao.Free;
  Action := caFree;
  frmAcareacoes := Nil;
end;

procedure TfrmAcareacoes.FormShow(Sender: TObject);
begin
  barra := TBarrTFO.Create;
  extravio := TExtravios.Create;
  entregador := TCodigosEntregadores.Create;
  agente := TAgente.Create;
  restricao := TRestricoes.Create;
  acessos := TAcessos.Create;
  entrega := TEntrega.Create;
  acareacao := TAcareacoes.Create;
  conexao := TConexao.Create;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    actAcareacoesSairExecute(Sender);
    Exit;
  end;
  sOperacao := 'X';
  Modo;
  ModoGrid;
end;

procedure TfrmAcareacoes.GeraRestricao(bAVista: Boolean);
var
  dValor: Double;
  iEntregador: Integer;
  sFiltro: String;
begin
  dValor := 0;
  iEntregador := 0;
  sFiltro := '';
  iEntregador := extravio.entregador;
  restricao.entregador := iEntregador;
  sFiltro := 'ENTREGADOR';
  if extravio.Tipo = 0 then
  begin
    iEntregador := extravio.agente;
    restricao.entregador := iEntregador;
    sFiltro := 'AGENTE';
  end;
  if not(agente.getObject(IntToStr(extravio.agente), 'CODIGO')) then
  begin
    MessageDlg('Código de Adm. de CEP não Encontrado!', mtWarning, [mbOK], 0);
    Exit;
  end;
  if restricao.getObject(IntToStr(iEntregador), sFiltro) then
  begin
    dValor := restricao.Valor;
    restricao.Valor := dValor + extravio.Total;
    if bAVista then
    begin
      dValor := 0;
      dValor := restricao.Debitar;
      restricao.Debitar := dValor + extravio.Total;
    end;
    if not(restricao.Update()) then
    begin
      MessageDlg('Erro ao alterar o valor da Restrição!', mtWarning, [mbOK], 0);
    end;
  end
  else
  begin
    restricao.agente := extravio.agente;
    restricao.entregador := iEntregador;
    restricao.Pago := 0;
    if bAVista then
    begin
      dValor := 0;
      dValor := restricao.Debitar;
      restricao.Debitar := dValor + extravio.Total;
    end
    else
    begin
      restricao.Debitar := 0;
    end;
    dValor := extravio.Total;
    restricao.Valor := dValor;
    if not(restricao.Insert()) then
    begin
      MessageDlg('Erro ao incluir o valor da Restrição!', mtWarning, [mbOK], 0);
    end;
  end;
end;

procedure TfrmAcareacoes.Modo;
begin
  if sOperacao = 'I' then
  begin
    actAcareacoesIncluir.Enabled := False;
    actAcareacoesGravar.Enabled := True;
    actAcareacoesLocalizar.Enabled := False;
    actAcareacoesCancelar.Enabled := True;
    actAcareacoesExportar.Enabled := False;
    actAcareacoesEditar.Enabled := False;
    actAcareacoesFiltrar.Enabled := False;
    actAcareacoesPendentes.Enabled := False;
    cxGrid1DBTableView1.NewItemRow.InfoText := 'Clique aqui para Incluir';
    cxGrid1DBTableView1.NewItemRow.Visible := True;
  end
  else if sOperacao = 'U' then
  begin
    actAcareacoesIncluir.Enabled := False;
    actAcareacoesGravar.Enabled := True;
    actAcareacoesLocalizar.Enabled := False;
    actAcareacoesCancelar.Enabled := True;
    actAcareacoesExportar.Enabled := False;
    actAcareacoesEditar.Enabled := False;
    actAcareacoesFiltrar.Enabled := False;
    actAcareacoesPendentes.Enabled := False;
    cxGrid1DBTableView1.NewItemRow.Visible := False;
  end
  else if sOperacao = 'S' then
  begin
    actAcareacoesIncluir.Enabled := True;
    actAcareacoesGravar.Enabled := False;
    actAcareacoesLocalizar.Enabled := False;
    actAcareacoesCancelar.Enabled := True;
    actAcareacoesExportar.Enabled := True;
    actAcareacoesEditar.Enabled := True;
    actAcareacoesFiltrar.Enabled := False;
    actAcareacoesPendentes.Enabled := False;
    cxGrid1DBTableView1.NewItemRow.InfoText := 'Clique aqui para Localizar';
    cxGrid1DBTableView1.NewItemRow.Visible := True;
  end
  else
  begin
    actAcareacoesIncluir.Enabled := True;
    actAcareacoesGravar.Enabled := False;
    actAcareacoesLocalizar.Enabled := True;
    actAcareacoesCancelar.Enabled := False;
    actAcareacoesExportar.Enabled := False;
    actAcareacoesEditar.Enabled := False;
    actAcareacoesFiltrar.Enabled := True;
    actAcareacoesPendentes.Enabled := True;
    cxGrid1DBTableView1.NewItemRow.Visible := False;
  end;
  bSalva := False;
  acessos.SetNivel(aclAcareacao);

end;

procedure TfrmAcareacoes.ModoGrid;
var
  iResultado: Integer;
begin
  iResultado := 0;
  if sOperacao = 'I' then
  begin
    cxGrid1DBTableView1ID_ACAREACAO.Properties.ReadOnly := False;
    cxGrid1DBTableView1DAT_ACAREACAO.Properties.ReadOnly := True;
    cxGrid1DBTableView1NUM_NOSSONUMERO.Properties.ReadOnly := False;
    cxGrid1DBTableView1COD_ENTREGADOR.Properties.ReadOnly := False;
    cxGrid1DBTableView1NOM_ENTREGADOR.Properties.ReadOnly := True;
    cxGrid1DBTableView1COD_BASE.Properties.ReadOnly := True;
    cxGrid1DBTableView1DES_MOTIVO.Properties.ReadOnly := False;
    cxGrid1DBTableView1DES_TRATATIVA.Properties.ReadOnly := False;
    cxGrid1DBTableView1DES_APURACAO.Properties.ReadOnly := False;
    cxGrid1DBTableView1DES_RESULTADO.Properties.ReadOnly := False;
    cxGrid1DBTableView1VAL_EXTRAVIO.Properties.ReadOnly := False;
    cxGrid1DBTableView1VAL_MULTA.Properties.ReadOnly := False;
    cxGrid1DBTableView1DES_ENVIO_CORRESPONDENCIA.Properties.ReadOnly := False;
    cxGrid1DBTableView1DES_RETORNO_CORRESPONDENCIA.Properties.ReadOnly := False;
    cxGrid1DBTableView1DES_OBSERVACOES.Properties.ReadOnly := False;
  end
  else if sOperacao = 'U' then
  begin
    if (not TUtil.Empty(cxGrid1DBTableView1DES_RESULTADO.DataBinding.Field.
      Value)) then
    begin
      iResultado :=
        StrToInt(Copy(cxGrid1DBTableView1DES_RESULTADO.DataBinding.Field.
        Value, 1, 2));
    end;
    cxGrid1DBTableView1ID_ACAREACAO.Properties.ReadOnly := True;
    cxGrid1DBTableView1DAT_ACAREACAO.Properties.ReadOnly := True;
    cxGrid1DBTableView1NUM_NOSSONUMERO.Properties.ReadOnly := True;
    cxGrid1DBTableView1COD_ENTREGADOR.Properties.ReadOnly := True;
    cxGrid1DBTableView1NOM_ENTREGADOR.Properties.ReadOnly := True;
    cxGrid1DBTableView1COD_BASE.Properties.ReadOnly := True;
    if iResultado > 1 then
    begin
      cxGrid1DBTableView1DES_MOTIVO.Properties.ReadOnly := True;
      cxGrid1DBTableView1DES_TRATATIVA.Properties.ReadOnly := True;
      cxGrid1DBTableView1DES_APURACAO.Properties.ReadOnly := True;
      cxGrid1DBTableView1DES_RESULTADO.Properties.ReadOnly := True;
      cxGrid1DBTableView1VAL_EXTRAVIO.Properties.ReadOnly := True;
      cxGrid1DBTableView1VAL_MULTA.Properties.ReadOnly := True;
      cxGrid1DBTableView1DES_ENVIO_CORRESPONDENCIA.Properties.ReadOnly := False;
      cxGrid1DBTableView1DES_RETORNO_CORRESPONDENCIA.Properties.
        ReadOnly := False;
      cxGrid1DBTableView1DES_OBSERVACOES.Properties.ReadOnly := False;
    end
    else
    begin
      cxGrid1DBTableView1DES_MOTIVO.Properties.ReadOnly := False;
      cxGrid1DBTableView1DES_TRATATIVA.Properties.ReadOnly := False;
      cxGrid1DBTableView1DES_APURACAO.Properties.ReadOnly := False;
      cxGrid1DBTableView1DES_RESULTADO.Properties.ReadOnly := False;
      cxGrid1DBTableView1VAL_EXTRAVIO.Properties.ReadOnly := False;
      cxGrid1DBTableView1VAL_MULTA.Properties.ReadOnly := False;
      cxGrid1DBTableView1DES_ENVIO_CORRESPONDENCIA.Properties.ReadOnly := False;
      cxGrid1DBTableView1DES_RETORNO_CORRESPONDENCIA.Properties.
        ReadOnly := False;
      cxGrid1DBTableView1DES_OBSERVACOES.Properties.ReadOnly := False;
    end;
  end
  else if sOperacao = 'S' then
  begin
    cxGrid1DBTableView1ID_ACAREACAO.Properties.ReadOnly := False;
    cxGrid1DBTableView1DAT_ACAREACAO.Properties.ReadOnly := False;
    cxGrid1DBTableView1NUM_NOSSONUMERO.Properties.ReadOnly := False;
    cxGrid1DBTableView1COD_ENTREGADOR.Properties.ReadOnly := False;
    cxGrid1DBTableView1NOM_ENTREGADOR.Properties.ReadOnly := True;
    cxGrid1DBTableView1COD_BASE.Properties.ReadOnly := False;
    cxGrid1DBTableView1DES_MOTIVO.Properties.ReadOnly := False;
    cxGrid1DBTableView1DES_TRATATIVA.Properties.ReadOnly := False;
    cxGrid1DBTableView1DES_APURACAO.Properties.ReadOnly := False;
    cxGrid1DBTableView1DES_RESULTADO.Properties.ReadOnly := False;
    cxGrid1DBTableView1VAL_EXTRAVIO.Properties.ReadOnly := False;
    cxGrid1DBTableView1VAL_MULTA.Properties.ReadOnly := False;
    cxGrid1DBTableView1DES_ENVIO_CORRESPONDENCIA.Properties.ReadOnly := False;
    cxGrid1DBTableView1DES_RETORNO_CORRESPONDENCIA.Properties.ReadOnly := False;
    cxGrid1DBTableView1DES_OBSERVACOES.Properties.ReadOnly := False;
  end
  else
  begin
    cxGrid1DBTableView1ID_ACAREACAO.Properties.ReadOnly := True;
    cxGrid1DBTableView1DAT_ACAREACAO.Properties.ReadOnly := True;
    cxGrid1DBTableView1NUM_NOSSONUMERO.Properties.ReadOnly := True;
    cxGrid1DBTableView1COD_ENTREGADOR.Properties.ReadOnly := True;
    cxGrid1DBTableView1NOM_ENTREGADOR.Properties.ReadOnly := True;
    cxGrid1DBTableView1COD_BASE.Properties.ReadOnly := True;
    cxGrid1DBTableView1DES_MOTIVO.Properties.ReadOnly := True;
    cxGrid1DBTableView1DES_TRATATIVA.Properties.ReadOnly := True;
    cxGrid1DBTableView1DES_APURACAO.Properties.ReadOnly := True;
    cxGrid1DBTableView1DES_RESULTADO.Properties.ReadOnly := True;
    cxGrid1DBTableView1VAL_EXTRAVIO.Properties.ReadOnly := True;
    cxGrid1DBTableView1VAL_MULTA.Properties.ReadOnly := True;
    cxGrid1DBTableView1DES_ENVIO_CORRESPONDENCIA.Properties.ReadOnly := True;
    cxGrid1DBTableView1DES_RETORNO_CORRESPONDENCIA.Properties.ReadOnly := True;
    cxGrid1DBTableView1DES_OBSERVACOES.Properties.ReadOnly := True;
  end;
end;

procedure TfrmAcareacoes.SalvaAcareacao;
var
  sItens: TStringList;
  iResultado: Integer;
  bSalvaExtravio: Boolean;
  iTipo: Integer;
begin
  iResultado := 0;
  iTipo := 0;
  if sOperacao = 'I' then
  begin
    sItens := TStringList.Create();
    if acareacao.NNExist(dm.tbAcareacoesNUM_NOSSONUMERO.AsString) then
    begin
      Application.MessageBox('Já foi registrada uma acareação para este NN !', 'Atenção', MB_ICONEXCLAMATION + MB_OK);
      Abort;
      Exit;
    end;
    if dm.tbAcareacoes.State = dsInsert then
    begin
      cxGrid1DBTableView1NUM_NOSSONUMERO.FocusWithSelection;
      dm.tbAcareacoes.Post;
    end;
    if Application.MessageBox('Confirma Gravar os dados?', 'Gravar os Dados',
      MB_YESNO + MB_ICONQUESTION) = IDNO then
    begin
      dm.tbAcareacoes.Edit;
      cxGrid1DBTableView1ID_ACAREACAO.FocusWithSelection;
      Exit;
    end;
    acareacao.Sequencia := dm.TbAcareacoesSEQ_ACAREACAO.AsInteger;
    acareacao.Id := dm.TbAcareacoesID_ACAREACAO.AsString;
    acareacao.Data := dm.tbAcareacoesDAT_ACAREACAO.AsDateTime;
    acareacao.NossoNumero := dm.tbAcareacoesNUM_NOSSONUMERO.AsString;
    acareacao.entregador := dm.tbAcareacoesCOD_ENTREGADOR.AsInteger;
    acareacao.Base := dm.tbAcareacoesCOD_BASE.AsInteger;
    acareacao.Motivo := dm.TbAcareacoesDES_MOTIVO.AsString;
    acareacao.Tratativa := dm.TbAcareacoesDES_TRATATIVA.AsString;
    acareacao.Apuracao := dm.TbAcareacoesDES_APURACAO.AsString;
    acareacao.Resultado := dm.tbAcareacoesDES_RESULTADO.AsString;
    acareacao.extravio := dm.tbAcareacoesVAL_EXTRAVIO.AsFloat;
    acareacao.Multa := dm.tbAcareacoesVAL_MULTA.AsFloat;
    acareacao.Envio := dm.tbAcareacoesDES_ENVIO_CORRESPONDENCIA.AsString;
    acareacao.Retorno := dm.tbAcareacoesDES_RETORNO_CORRESPONDENCIA.AsString;
    acareacao.Obs := dm.tbAcareacoesDES_OBSERVACOES.AsString;
    acareacao.Executor := uGlobais.sUsuario;
    acareacao.Manutencao := Now;
    if (not TUtil.Empty(acareacao.Resultado)) then
    begin
      iResultado := StrToInt(Copy(acareacao.Resultado, 1, 2));
    end;
    if iResultado = 2 then
    begin
      if acareacao.Extravio = 0 then
      begin
        Application.MessageBox('Informe o Valor do Produto!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
        Exit;
      end;
      acareacao.Multa := 0;
    end
    else if iResultado = 3 then
    begin
      if acareacao.Extravio = 0 then
      begin
        Application.MessageBox('Informe o Valor do Produto!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
        Exit;
      end;
      if acareacao.Multa = 0 then
      begin
        Application.MessageBox('Informe o Valor da Multa!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
        Exit;
      end;
    end
    else if iResultado = 4 then
    begin
      if acareacao.Multa = 0 then
      begin
        Application.MessageBox('Informe o Valor da Multa!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
        Exit;
      end;
      acareacao.Extravio := 0;
      iTipo := 2;
    end;
    if (not acareacao.Insert()) then
    begin
      Application.MessageBox('Falha ao gravar a acareação!', 'Erro',
        MB_OK + MB_ICONERROR);
      if dm.tbAcareacoes.Locate('NUM_NOSSONUMERO', acareacao.NossoNumero, [])
      then
      begin
        dm.tbAcareacoes.Edit;
        cxGrid1DBTableView1ID_ACAREACAO.FocusWithSelection;
        Exit;
      end;
    end;
    if iResultado > 1 then
    begin
      SalvaExtravio(iTipo);
    end;
    sOperacao := 'X';
    Modo;
    ModoGrid;
  end
  else
  begin
    bSalvaExtravio := acareacao.getObject(dm.tbAcareacoesNUM_NOSSONUMERO.AsString, 'NOSSONUMERO');
    bSalvaExtravio := (not extravio.getObject(dm.tbAcareacoesNUM_NOSSONUMERO.AsString,'NOSSONUMERO'));
    acareacao.Sequencia := dm.TbAcareacoesSEQ_ACAREACAO.AsInteger;
    acareacao.Id := dm.TbAcareacoesID_ACAREACAO.AsString;
    acareacao.Data := dm.tbAcareacoesDAT_ACAREACAO.AsDateTime;
    acareacao.NossoNumero := dm.tbAcareacoesNUM_NOSSONUMERO.AsString;
    acareacao.entregador := dm.tbAcareacoesCOD_ENTREGADOR.AsInteger;
    acareacao.Base := dm.tbAcareacoesCOD_BASE.AsInteger;
    acareacao.Motivo := dm.TbAcareacoesDES_MOTIVO.AsString;
    acareacao.Tratativa := dm.TbAcareacoesDES_TRATATIVA.AsString;
    acareacao.Apuracao := dm.TbAcareacoesDES_APURACAO.AsString;
    acareacao.Resultado := dm.tbAcareacoesDES_RESULTADO.AsString;
    acareacao.extravio := dm.tbAcareacoesVAL_EXTRAVIO.AsFloat;
    acareacao.Multa := dm.tbAcareacoesVAL_MULTA.AsFloat;
    acareacao.Envio := dm.tbAcareacoesDES_ENVIO_CORRESPONDENCIA.AsString;
    acareacao.Retorno := dm.tbAcareacoesDES_RETORNO_CORRESPONDENCIA.AsString;
    acareacao.Obs := dm.tbAcareacoesDES_OBSERVACOES.AsString;
    acareacao.Executor := uGlobais.sUsuario;
    acareacao.Manutencao := Now;
    iResultado := StrToInt(Copy(acareacao.Resultado, 1, 2));
    if bSalvaExtravio then
    begin
      if (not TUtil.Empty(acareacao.Resultado)) then
      begin
        if StrToInt(Copy(acareacao.Resultado, 1, 2)) <= 1 then
        begin
          bSalvaExtravio := False;
        end;
      end;
    end;
    if Application.MessageBox('Confirma Gravar os dados?', 'Gravar os Dados',
      MB_YESNO + MB_ICONQUESTION) = IDNO then
    begin
      dm.tbAcareacoes.Edit;
      cxGrid1DBTableView1DES_ENVIO_CORRESPONDENCIA.FocusWithSelection;
      Exit;
    end;
    if (not acareacao.Update()) then
    begin
      Application.MessageBox('Falha ao gravar a alteração da acareacao!',
        'Erro', MB_OK + MB_ICONERROR);
      if dm.tbAcareacoes.Locate('NUM_NOSSONUMERO', extravio.NossoNumero, [])
      then
      begin
        dm.tbAcareacoes.Edit;
      end;
      cxGrid1DBTableView1DES_ENVIO_CORRESPONDENCIA.FocusWithSelection;
      Exit;
    end;
    if bSalvaExtravio then
    begin
      iTipo := 0;
      if iResultado = 4 then iTipo := 2;
      SalvaExtravio(iTipo);
    end;
    sOperacao := 'S';
    Modo;
    ModoGrid;
  end;
end;

procedure TfrmAcareacoes.LocalizarAcareacao;
var
  sSQL, sQuery: String;
begin
  sSQL := '';
  sQuery := '';
  cxGrid1DBTableView1.NewItemRow.Visible := False;
  { dsAcareacoes.Enabled                    :=  False;
    thracareacao                            :=  thrPopularAcareacoes.Create(True);
    thracareacao.FreeOnTerminate            :=  True;
    thracareacao.Priority                   :=  tpNormal;
    thracareacao.Start; }
  if sColuna = 'ID' then
  begin
    sQuery := sQuery + 'WHERE tbacareacoes.ID_ACAREACAO = ' + sId;
  end
  else if sColuna = 'NOSSONUMERO' then
  begin
    sQuery := sQuery + 'WHERE tbacareacoes.NUM_NOSSONUMERO = ' + QuotedStr(sId);
  end
  else if sColuna = 'MOTIVO' then
  begin
    sQuery := sQuery + 'WHERE tbacareacoes.DES_MOTIVO = ' + QuotedStr(sId);
  end
  else if sColuna = 'ENVIO' then
  begin
    sQuery := sQuery + 'WHERE tbacareacoes.DES_ENVIO_CORRESPONDENCIA = ' +
      QuotedStr(sId);
  end
  else if sColuna = 'RETORNO' then
  begin
    sQuery := sQuery + 'WHERE tbacareacoes.DES_RETORNO_CORRESPONDENCIA = ' +
      QuotedStr(sId);
  end
  else if sColuna = 'DATA' then
  begin
    sQuery := sQuery + 'WHERE tbacareacoes.DATE(DAT_ACAREACAO) = ' +
      QuotedStr(FormatDateTime('yyyy-mm-dd', StrToDate(sId)));
  end
  else if sColuna = 'ENTREGADOR' then
  begin
    sQuery := sQuery + 'WHERE tbacareacoes.COD_ENTREGADOR = ' + sId;
  end
  else if sColuna = 'TRATATIVA' then
  begin
    sQuery := sQuery + 'WHERE tbacareacoes.DES_TRATATIVA = ' + QuotedStr(sId);
  end
  else if sColuna = 'RESULTADO' then
  begin
    sQuery := sQuery + 'WHERE tbacareacoes.DES_RESULTADO = ' + QuotedStr(sId);
  end
  else if sColuna = 'APURACAO' then
  begin
    sQuery := sQuery + 'WHERE tbacareacoes.DES_APURACAO = ' + QuotedStr(sId);
  end
  else if sColuna = 'AGENTE' then
  begin
    sQuery := sQuery + 'WHERE tbacareacoes.COD_BASE = ' + sId;
  end;
  sSQL := 'SELECT tbacareacoes.SEQ_ACAREACAO, ' + 'tbacareacoes.ID_ACAREACAO, '
    + 'tbacareacoes.DAT_ACAREACAO, ' + 'tbacareacoes.NUM_NOSSONUMERO, ' +
    'tbacareacoes.COD_ENTREGADOR, ' +
    'tbcodigosentregadores.NOM_FANTASIA AS NOM_ENTREGADOR, ' +
    'tbacareacoes.COD_BASE, ' + 'tbagentes.NOM_FANTASIA AS NOM_BASE, ' +
    'tbacareacoes.DES_MOTIVO, ' + 'tbacareacoes.DES_TRATATIVA, ' +
    'tbacareacoes.DES_APURACAO, ' + 'tbacareacoes.DES_RESULTADO, ' +
    'tbacareacoes.VAL_EXTRAVIO, ' + 'tbacareacoes.VAL_MULTA, ' +
    'tbacareacoes.DES_ENVIO_CORRESPONDENCIA, ' +
    'tbacareacoes.DES_RETORNO_CORRESPONDENCIA, ' +
    'tbacareacoes.DES_OBSERVACOES ' + 'FROM   tbacareacoes ' +
    'LEFT JOIN tbcodigosentregadores ON tbacareacoes.COD_ENTREGADOR = tbcodigosentregadores.COD_ENTREGADOR '
    + 'LEFT JOIN tbagentes ON tbacareacoes.COD_BASE = tbagentes.COD_AGENTE ' +
    sQuery + ';';
  dm.tbacareacoes.Close;
  dm.tbacareacoes.Open;
  if (not acareacao.getObject(sSQL, 'SQL')) then
  begin
    Application.MessageBox('Nenhuma acareação encontrada!', 'Atenção!',
      MB_OK + MB_ICONEXCLAMATION);
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
    Exit;
  end;
  dm.tbacareacoes.LoadFromDataSet(dm.qryGetObject);
  dm.qryGetObject.Close;
  dm.qryGetObject.SQL.Clear;
end;

procedure TfrmAcareacoes.FiltrarDados;
var
  i: Integer;
  sFiltro: String;
begin
  if not Assigned(frmFiltro) then
  begin
    frmFiltro := TfrmFiltro.Create(Application);
  end;
  for i := 0 to cxGrid1DBTableView1.ColumnCount - 1 do
  begin
    if (cxGrid1DBTableView1.Columns[i].Visible) and
      (cxGrid1DBTableView1.Columns[i].Tag >= 0) then
    begin
      frmFiltro.slCampos.Add(cxGrid1DBTableView1.Columns[i].Caption);
      frmFiltro.slSQL.Add(cxGrid1DBTableView1.Columns[i].DataBinding.FieldName);
      frmFiltro.slValores.Add(cxGrid1DBTableView1.Columns[i]
        .DataBinding.ValueType);
    end;
  end;
  if frmFiltro.ShowModal = mrCancel then
  begin
    FreeAndNil(frmFiltro);
    Exit;
  end;
  sFiltro := '';
  i := 0;
  for i := 0 to frmFiltro.slSQLFil.Count - 1 do
  begin
    sFiltro := sFiltro + frmFiltro.slSQLFil[i];
  end;
  sId := sFiltro;
  sColuna := 'FILTRO';
  FreeAndNil(frmFiltro);
  LocalizarAcareacao;
end;

end.
