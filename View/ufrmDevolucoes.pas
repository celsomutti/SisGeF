unit ufrmDevolucoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin,
  dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxSkinscxPCPainter,  cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxLabel, cxPC, cxButtonEdit, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  Data.DB, cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  dxmdaset, clAgentes, clDevolucoes, Vcl.ActnList, Vcl.Menus, Vcl.StdCtrls,
  cxButtons, System.Win.ComObj, cxCheckBox,
  System.StrUtils, clBarrTFO, cxImageComboBox, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, cxCalc, clContatoAgente,
  uthrImportarDevolucao, cxProgressBar, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxBarBuiltInMenu, System.Actions, clAcessos, clConexao, cxDBLookupComboBox, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxDateRanges,
  cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TfrmDevolucoes = class(TForm)
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxLabel1: TcxLabel;
    cxExpedicaoExpectativa: TcxDateEdit;
    tbExpectativas: TdxMemData;
    ds1: TDataSource;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    tbExpectativasNUM_NOSSONUMERO: TStringField;
    aclDevolucao: TActionList;
    actDevolucaoNovaExpectativa: TAction;
    actDevolucaoExcluirExpectativa: TAction;
    cxLabel3: TcxLabel;
    actDevolucaoFecharExpectativa: TAction;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    actDevolucaoListaApoio: TAction;
    chkTFO: TcxCheckBox;
    cxTabSheet2: TcxTabSheet;
    cxNossoNumero: TcxTextEdit;
    actDevolucaoSair: TAction;
    cxButton5: TcxButton;
    tbExpectativasQTD_VOLUMES: TIntegerField;
    tbExpectativasCOD_STATUS_OBJETO: TIntegerField;
    cxGrid1DBTableView1NUM_NOSSONUMERO: TcxGridDBColumn;
    cxGrid1DBTableView1QTD_VOLUMES: TcxGridDBColumn;
    cxGrid1DBTableView1COD_STATUS_OBJETO: TcxGridDBColumn;
    actDevolucaoSalvarExpectativas: TAction;
    cxGrid1DBTableView1CD_STATUS_CONTAINER: TcxGridDBColumn;
    tbExpectativasCOD_STATUS_CONTAINER: TIntegerField;
    cxNomAgente: TcxTextEdit;
    cxCheckBox1: TcxCheckBox;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxPesoContainer: TcxTextEdit;
    cxLabel8: TcxLabel;
    cxLacre: TcxMaskEdit;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1QTD_PESO_OBJETO: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    actDevolucaoEncerrarConferencia: TAction;
    cxButton6: TcxButton;
    ds2: TDataSource;
    tbExpectativasQTD_PESO_OBJETO: TFloatField;
    actDevolucaoAlterarExpedicao: TAction;
    actDevolucaoExtraviar: TAction;
    cxButton7: TcxButton;
    cxButton8: TcxButton;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    actDevolucaoIniciarConferencia: TAction;
    cxButton9: TcxButton;
    cxCodAgente: TcxTextEdit;
    cxDataExpedicao: TcxTextEdit;
    actDevolucaoDivergencia: TAction;
    cxButton10: TcxButton;
    cxLabel27: TcxLabel;
    cxTabSheet3: TcxTabSheet;
    cxLabel4: TcxLabel;
    cxData: TcxDateEdit;
    cxLabel5: TcxLabel;
    cxArquivo: TcxButtonEdit;
    OpenDialog1: TOpenDialog;
    actDevolucaoImportar: TAction;
    ds3: TDataSource;
    cxGrid3DBTableView1: TcxGridDBTableView;
    cxGrid3Level1: TcxGridLevel;
    cxGrid3: TcxGrid;
    cxGrid3DBTableView1COD_BASE: TcxGridDBColumn;
    cxGrid3DBTableView1DES_BASE: TcxGridDBColumn;
    cxGrid3DBTableView1DAT_EXPEDICAO: TcxGridDBColumn;
    cxGrid3DBTableView1NUM_NOSSONUMERO: TcxGridDBColumn;
    cxGrid3DBTableView1COD_STATUS: TcxGridDBColumn;
    cxButton11: TcxButton;
    cxProgressBar1: TcxProgressBar;
    actDevolucaoSalvarImportacao: TAction;
    cxButton12: TcxButton;
    cxGrid3DBTableView1DES_CEP: TcxGridDBColumn;
    cxGridDBTableView1DAT_EXPEDICAO: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_EXPEDICAO: TcxGridDBColumn;
    tbExpectativasDAT_EXPEDICAO: TDateField;
    cxGrid3DBTableView1DOM_MARCA: TcxGridDBColumn;
    actDevolucaoMarcar: TAction;
    actDevolucaoDesmarcar: TAction;
    cxButton13: TcxButton;
    cxButton14: TcxButton;
    tbExpectativasDES_DIVERGENCIA: TStringField;
    tbExpectativasDES_DEVOLUCAO: TStringField;
    tbExpectativasDES_CHAVE: TStringField;
    cxGrid1DBTableView1DES_DEVOLUCAO: TcxGridDBColumn;
    cxGrid3DBTableView1NUM_VOLUME: TcxGridDBColumn;
    actDEvolucaoAlterarBase: TAction;
    cxButton15: TcxButton;
    tbExpectativasCOD_BASE: TIntegerField;
    cxGrid1DBTableView1COD_BASE: TcxGridDBColumn;
    tbBases: TdxMemData;
    tbBasesCOD_AGENTE: TIntegerField;
    tbBasesDES_RAZAO_SOCIAL: TWideStringField;
    tbBasesNOM_FANTASIA: TWideStringField;
    tbBasesDES_TIPO_DOC: TWideStringField;
    tbBasesNUM_CNPJ: TWideStringField;
    tbBasesNUM_IE: TWideStringField;
    tbBasesNUM_IEST: TWideStringField;
    tbBasesNUM_IM: TWideStringField;
    tbBasesCOD_CNAE: TWideStringField;
    tbBasesCOD_CRT: TIntegerField;
    tbBasesNUM_CNH: TWideStringField;
    tbBasesDES_CATEGORIA_CNH: TWideStringField;
    tbBasesDAT_VALIDADE_CNH: TDateField;
    tbBasesDES_PAGINA: TWideStringField;
    tbBasesCOD_STATUS: TIntegerField;
    tbBasesDES_OBSERVACAO: TWideMemoField;
    tbBasesDAT_CADASTRO: TDateField;
    tbBasesDAT_ALTERACAO: TDateTimeField;
    tbBasesVAL_VERBA: TFloatField;
    tbBasesDES_TIPO_CONTA: TWideStringField;
    tbBasesCOD_BANCO: TWideStringField;
    tbBasesCOD_AGENCIA: TWideStringField;
    tbBasesNUM_CONTA: TWideStringField;
    tbBasesNOM_FAVORECIDO: TWideStringField;
    tbBasesNUM_CPF_CNPJ_FAVORECIDO: TWideStringField;
    tbBasesDES_FORMA_PAGAMENTO: TWideStringField;
    tbBasesCOD_CENTRO_CUSTO: TIntegerField;
    tbBasesCOD_GRUPO: TIntegerField;
    dsBases: TDataSource;
    tbExpectativasDOM_MARCA: TStringField;
    cxGrid1DBTableView1DOM_MARCA: TcxGridDBColumn;
    actDevolucaoIniciarExpectativa: TAction;
    cxButton16: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cxNossoNumeroExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxGrid1DBTableView1NUM_NOSSONUMEROPropertiesValidate
      (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure actDevolucaoNovaExpectativaExecute(Sender: TObject);
    procedure actDevolucaoSairExecute(Sender: TObject);
    procedure cxExpedicaoExpectativaPropertiesChange(Sender: TObject);
    procedure cxGrid1DBTableView1QTD_VOLUMESPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure actDevolucaoSalvarExpectativasExecute(Sender: TObject);
    procedure tbExpectativasAfterInsert(DataSet: TDataSet);
    procedure actDevolucaoExcluirExpectativaExecute(Sender: TObject);
    procedure actDevolucaoFecharExpectativaExecute(Sender: TObject);
    procedure cxLacrePropertiesEditValueChanged(Sender: TObject);
    procedure cxPageControl1Click(Sender: TObject);
    procedure actDevolucaoEncerrarConferenciaExecute(Sender: TObject);
    procedure actDevolucaoAlterarExpedicaoExecute(Sender: TObject);
    procedure actDevolucaoIniciarConferenciaExecute(Sender: TObject);
    procedure actDevolucaoDivergenciaExecute(Sender: TObject);
    procedure cxButton7Click(Sender: TObject);
    procedure actDevolucaoImportarExecute(Sender: TObject);
    procedure cxArquivoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure actDevolucaoSalvarImportacaoExecute(Sender: TObject);
    procedure cxGrid3DBTableView1DOM_MARCAPropertiesChange(Sender: TObject);
    procedure actDevolucaoMarcarExecute(Sender: TObject);
    procedure actDevolucaoDesmarcarExecute(Sender: TObject);
    procedure actDevolucaoExtraviarExecute(Sender: TObject);
    procedure actDEvolucaoAlterarBaseExecute(Sender: TObject);
    procedure actDevolucaoIniciarExpectativaExecute(Sender: TObject);
    procedure ds1StateChange(Sender: TObject);
  private
    { Private declarations }
    procedure SalvaObjeto;
    procedure ListaExpectativa;
    procedure SalvaExpectativa;
    procedure Modo;
    procedure FechaExpectativa;
    procedure EMailExpectativa(sBase: String);
    procedure EMailDivergencia;
    procedure EMailBase(sBase: String);
    procedure EMailExpedicao(sData: String);
    procedure DestinatarioEmail;
    procedure SalvaImportacao;
    procedure EMailExtravio;
    procedure PopulaBases;
    function ListaLacre(): Boolean;
    function EncerrarConferencia(): Boolean;
    function AtribuiBase(): Boolean;
    procedure MandaEmail;
  public
    { Public declarations }
  end;

var
  frmDevolucoes: TfrmDevolucoes;
  agente: TAgente;
  devolucao: TDevolucoes;
  contato: TContatoAgente;
  barra: TBarrTFO;
  thrDEvolucao: thrImportarDevolucao;
  sOperacao: String;
  sEmailBase: String;
  acessos: TAcessos;
  conexao: TConexao;

implementation

{$R *.dfm}

uses
  udm, uGlobais, clUtil, ufrmListaApoio, ufrmData, ufrmEnvioEmail,
  ufrmDivergencia;

procedure TfrmDevolucoes.actDEvolucaoAlterarBaseExecute(Sender: TObject);
var
  sBase: String;
begin
  sBase := '';
  if tbExpectativas.IsEmpty then
  begin
    Exit;
  end;
  Screen.Cursor := crHourGlass;
  with dm.qryPesquisa do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT COD_AGENTE AS "C�digo", NOM_FANTASIA AS "Nome" FROM tbagentes ';
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
  Screen.Cursor := crDefault;
  if frmListaApoio.ShowModal = mrOk then
  begin
    sBase := dm.qryPesquisa.Fields[0].AsString;
  end;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  FreeAndNil(frmListaApoio);
  if StrToIntDef(sBase,0) = 0 then
  begin
    Application.MessageBox('C�digo de Base inv�lido!', PChar('Aten��o ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if devolucao.getObject(tbExpectativasNUM_NOSSONUMERO.AsString,'NN') then
  begin
    devolucao.Agente := StrToInt(sBase);
    if (not devolucao.Update) then
    begin
      Application.MessageBox('Erro ao salvar a Base!', PChar('Aten��o ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
  end;
  tbExpectativas.Edit;
  tbExpectativasCOD_BASE.AsInteger := StrToInt(sBase);
  tbExpectativas.Post;
end;

procedure TfrmDevolucoes.actDevolucaoAlterarExpedicaoExecute(Sender: TObject);
var
  sData: String;
begin
  if tbExpectativas.IsEmpty then
  begin
    Exit;
  end;
  if tbExpectativasCOD_STATUS_OBJETO.Value = 4 then
  begin
    Application.MessageBox('Objeto j� conferido!', 'Aten��o',
      MB_ICONWARNING + MB_OK);
    Exit;
  end;
  if not Assigned(frmData) then
  begin
    frmData := TfrmData.Create(Application);
    frmData.Caption := 'Alterar Expedi��o';
    frmData.cxLabel1.Caption := 'Data de Expedi��o';
  end;
  if frmData.ShowModal = mrCancel then
  begin
    FreeAndNil(frmData);
    Exit;
  end;
  if Application.MessageBox('Confirma alterar a expedi��o deste objeto?',
    'Alterar Expedi��o', MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    FreeAndNil(frmData);
    Exit;
  end;
  sData := frmData.cxData.Text;
  if devolucao.getObject(tbExpectativasNUM_NOSSONUMERO.AsString, 'NN') then
  begin
    devolucao.Expedicao := StrToDate(sData);
    devolucao.Lacre := '0';
    devolucao.Motorista := '';
    devolucao.Recebedor := '';
    devolucao.Conferente := '';
    devolucao.StatusContainer := 0;
    devolucao.StatusObjeto := 0;
    devolucao.Usuario := uGlobais.sUsuario;
    devolucao.Manutencao := Now;
    if (not devolucao.Update()) then
    begin
      Application.MessageBox('Erro ao trocar a expedi��o!', 'Aten��o',
        MB_ICONWARNING + MB_OK);
      dm.qryGetObject.Close;
      dm.qryGetObject.SQL.Clear;
      Exit;
    end;
    EMailExpedicao(sData);
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
    tbExpectativas.Delete;
  end;
end;

procedure TfrmDevolucoes.actDevolucaoDesmarcarExecute(Sender: TObject);
begin
  if dm.tbDevolucao.IsEmpty then
  begin
    Exit;
  end;
  dm.tbDevolucao.IsLoading := True;
  dm.tbDevolucao.First;
  while (not dm.tbDevolucao.Eof) do
  begin
    dm.tbDevolucao.Edit;
    dm.tbDevolucaoDOM_MARCA.Value := 'N';
    dm.tbDevolucao.Post;
    dm.tbDevolucao.Next
  end;
  dm.tbDevolucao.First;
  dm.tbDevolucao.IsLoading := False;
end;

procedure TfrmDevolucoes.actDevolucaoDivergenciaExecute(Sender: TObject);
begin
  if tbExpectativas.IsEmpty then
  begin
    Exit;
  end;
  if not Assigned(frmDivergencia) then
  begin
    frmDivergencia := TfrmDivergencia.Create(Application);
  end;
  frmDivergencia.cxDivergencia.Text := tbExpectativasDES_DIVERGENCIA.AsString;
  if frmDivergencia.ShowModal = mrCancel then
  begin
    FreeAndNil(frmDivergencia);
    Exit;
  end;
  tbExpectativas.Edit;
  tbExpectativasDES_DIVERGENCIA.Text := frmDivergencia.cxDivergencia.Text;
  tbExpectativas.Post;
  EMailDivergencia;
  FreeAndNil(frmDivergencia);
end;

procedure TfrmDevolucoes.actDevolucaoEncerrarConferenciaExecute
  (Sender: TObject);
var
  bFlag: Boolean;
begin
  if tbExpectativas.IsEmpty then
  begin
    Exit;
  end;
  bFlag := False;
  tbExpectativas.First;
  while NOT(tbExpectativas.Eof) do
  begin
    if tbExpectativasCOD_STATUS_OBJETO.Value <> 4 then
    begin
      bFlag := True;
    end;
    tbExpectativas.Next;
  end;
  tbExpectativas.First;
  if bFlag then
  begin
    Application.MessageBox
      (PChar('Existem objetos nesse container que n�o foram conferidos!' + #13 +
      'Proceda com a Confer�ncia, Altera��o da Expedi��o ou Extravio do(s) Objeto(s).'),
      'Aten��o!', MB_ICONERROR + MB_OK);
    Exit;
  end;
  if (not EncerrarConferencia()) then
  begin
    Application.MessageBox('Erro no Encerramento da Confer�ncia.', 'Aten��o!',
      MB_OK + MB_ICONINFORMATION);
  end;
end;

procedure TfrmDevolucoes.actDevolucaoExcluirExpectativaExecute(Sender: TObject);
begin
  if Application.MessageBox('Confirma a exclus�o desta Expectativa?', 'Excluir',
    MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  devolucao.NossoNumero := tbExpectativasNUM_NOSSONUMERO.AsString;
  devolucao.Volumes := tbExpectativasQTD_VOLUMES.AsInteger;
  if (not devolucao.getObject('', 'NN0')) then
  begin
    tbExpectativas.Delete;
  end
  else
  begin
    if devolucao.StatusContainer >= 2 then
    begin
      Application.MessageBox('Produto em Container j� Fechado!', PChar('Aten��o ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
      dm.qryGetObject.Close;
      dm.qryGetObject.SQL.Clear;
      Exit;
    end;
    if devolucao.StatusObjeto >= 1 then
    begin
      Application.MessageBox('Produto j� est� em um Container!', PChar('Aten��o ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
      dm.qryGetObject.Close;
      dm.qryGetObject.SQL.Clear;
      Exit;
    end;
  end;
  dm.qryGetObject.Close;
  dm.qryGetObject.SQL.Clear;
  devolucao.NossoNumero := tbExpectativasNUM_NOSSONUMERO.AsString;
  devolucao.Volumes := tbExpectativasQTD_VOLUMES.AsInteger;
  if (not devolucao.Delete('NN0')) then
  begin
    Application.MessageBox('Erro ao excluir a Expectativa!', 'Aten��o', MB_ICONERROR + MB_OK);
    Exit;
  end;
  tbExpectativas.Delete;
end;

procedure TfrmDevolucoes.actDevolucaoExtraviarExecute(Sender: TObject);
begin
  if tbExpectativas.IsEmpty then
  begin
    Exit;
  end;
  if not Assigned(frmDivergencia) then
  begin
    frmDivergencia := TfrmDivergencia.Create(Application);
  end;
  frmDivergencia.cxDivergencia.Text := tbExpectativasDES_DIVERGENCIA.AsString;
  if frmDivergencia.ShowModal = mrCancel then
  begin
    FreeAndNil(frmDivergencia);
    Exit;
  end;
  tbExpectativas.Edit;
  tbExpectativasDES_DIVERGENCIA.Text := frmDivergencia.cxDivergencia.Text;
  tbExpectativasCOD_STATUS_OBJETO.Value := 3;
  tbExpectativas.Post;
  EMailExtravio;
  FreeAndNil(frmDivergencia);
end;

procedure TfrmDevolucoes.actDevolucaoFecharExpectativaExecute(Sender: TObject);
begin
  if Application.MessageBox('Confirma Fechar a Expedi��o?', 'Salvar',
    MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  FechaExpectativa;
  MandaEmail;
  TUtil.LimparFields(Self);
  sOperacao := 'I';
  tbExpectativas.Close;
  tbExpectativas.Open;
  cxExpedicaoExpectativa.SetFocus;
  Modo;
end;

procedure TfrmDevolucoes.actDevolucaoImportarExecute(Sender: TObject);
begin
  if TUtil.Empty(cxData.Text) then
  begin
    Application.MessageBox('Informe a data da Expedi��o!', 'Aten��o',
      MB_OK + MB_ICONWARNING);
    Exit;
  end;
  if TUtil.Empty(cxArquivo.Text) then
  begin
    Application.MessageBox('Informe o nome do arquivo!', 'Aten��o',
      MB_OK + MB_ICONWARNING);
    Exit;
  end;
{  if devolucao.getObject(cxData.Text, 'EXPEDICAO') then
  begin
    if devolucao.StatusObjeto > 0 then
    begin
      Application.MessageBox('Expedi��o j� est� fechada!', 'Aten��o', MB_ICONWARNING + MB_OK);
      dm.qryGetObject.Close;
      dm.qryGetObject.SQL.Clear;
      Exit;
    end;
  end;}
  if Application.MessageBox('Confirma a Importa��o do Arquivo de Devolu��es?',
    'Importar Devolu��es', MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  if dm.tbDevolucao.Active then
  begin
    dm.tbDevolucao.Close;
  end;
  ds3.Enabled := False;
  cxProgressBar1.Visible := True;
  dm.tbDevolucao.Open;
  thrDEvolucao := thrImportarDevolucao.Create(True);
  thrDEvolucao.FreeOnTerminate := True;
  thrDEvolucao.Priority := tpNormal;
  thrDEvolucao.Start;
end;

procedure TfrmDevolucoes.actDevolucaoIniciarConferenciaExecute(Sender: TObject);
var
  sLacre: String;
begin
  sLacre := '';
  sLacre := InputBox('N� do Lacre/Protocolo.', 'Informe o N� do Lacre ou Protocolo.: ', '0');
  if StrToFloatDef(sLacre,0) = 0 then
  begin
    Application.MessageBox('Informe um n�mero v�lido!', PChar('Aten��o ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  cxLacre.Text := sLacre;
  if Application.MessageBox('Confirma abrir este container?', 'Abrir o container.', MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  if (not ListaLacre()) then
  begin
    Application.MessageBox('Container n�o encontrado!', 'Aten��o',
      MB_OK + MB_ICONWARNING);
    Exit;
  end;
  if (not tbExpectativas.IsEmpty) then
  begin
    cxNossoNumero.Properties.ReadOnly := False;
    cxNossoNumero.SetFocus;
  end;
end;

procedure TfrmDevolucoes.actDevolucaoIniciarExpectativaExecute(Sender: TObject);
begin
  devolucao.Expedicao := cxExpedicaoExpectativa.Date;
  ListaExpectativa;
end;

procedure TfrmDevolucoes.actDevolucaoMarcarExecute(Sender: TObject);
begin
  if dm.tbDevolucao.IsEmpty then
  begin
    Exit;
  end;
  dm.tbDevolucao.IsLoading := True;
  dm.tbDevolucao.First;
  while (not dm.tbDevolucao.Eof) do
  begin
    dm.tbDevolucao.Edit;
    dm.tbDevolucaoDOM_MARCA.Value := 'S';
    dm.tbDevolucao.Post;
    dm.tbDevolucao.Next
  end;
  dm.tbDevolucao.First;
  dm.tbDevolucao.IsLoading := False;
end;

procedure TfrmDevolucoes.actDevolucaoNovaExpectativaExecute(Sender: TObject);
begin
  TUtil.LimparFields(Self);
  sOperacao := 'I';
  tbExpectativas.Close;
  tbExpectativas.Open;
  cxExpedicaoExpectativa.SetFocus;
  Modo;
end;

procedure TfrmDevolucoes.actDevolucaoSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmDevolucoes.actDevolucaoSalvarExpectativasExecute(Sender: TObject);
begin
  if Application.MessageBox('Confirma Salvar a Expectativa?', 'Salvar',
    MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  SalvaExpectativa;
end;

procedure TfrmDevolucoes.actDevolucaoSalvarImportacaoExecute(Sender: TObject);
begin
  if Application.MessageBox('Confirma Salvar a Importa��o?',
    'Salvar Importa��o', MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  dm.qryGetObject.Close;
  dm.qryGetObject.SQL.Clear;
  actDevolucaoSalvarImportacao.Enabled := False;
  SalvaImportacao;
end;

procedure TfrmDevolucoes.cxArquivoPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  if OpenDialog1.Execute then
  begin
    cxArquivo.Text := OpenDialog1.FileName;
  end;
end;

procedure TfrmDevolucoes.cxButton7Click(Sender: TObject);
begin
  if tbExpectativas.IsEmpty then
  begin
    Exit;
  end;
  if tbExpectativasCOD_STATUS_OBJETO.Value = 4 then
  begin
    Application.MessageBox('Objeto j� conferido!', 'Aten��o',
      MB_ICONWARNING + MB_OK);
    Exit;
  end;
  if Application.MessageBox('Confirma Extraviar este objeto?',
    'Alterar Expedi��o', MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  if devolucao.getObject(tbExpectativasNUM_NOSSONUMERO.AsString, 'NN') then
  begin
    devolucao.StatusContainer := 5;
    devolucao.StatusObjeto := 3;
    devolucao.Usuario := uGlobais.sUsuario;
    devolucao.Manutencao := Now;
    if (not devolucao.Update()) then
    begin
      Application.MessageBox('Erro ao registrar o extravio deste objeto!',
        'Aten��o', MB_ICONWARNING + MB_OK);
      dm.qryGetObject.Close;
      dm.qryGetObject.SQL.Clear;
      Exit;
    end;
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
    tbExpectativas.Edit;
    tbExpectativasCOD_STATUS_OBJETO.Value := devolucao.StatusObjeto;
    tbExpectativasCOD_STATUS_CONTAINER.Value := devolucao.StatusContainer;
    tbExpectativas.Post;
  end;
end;

procedure TfrmDevolucoes.cxExpedicaoExpectativaPropertiesChange
  (Sender: TObject);
begin
  if TUtil.Empty(cxExpedicaoExpectativa.Text) then begin
    Exit;
  end;
  sOperacao := 'I';
  tbExpectativas.Close;
  tbExpectativas.Open;
  Modo;
end;

procedure TfrmDevolucoes.cxGrid1DBTableView1NUM_NOSSONUMEROPropertiesValidate
  (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
  sNN: String;
begin
  if tbExpectativas.IsLoading then begin
    Exit;
  end;
  if TUtil.Empty(VarToStr(DisplayValue)) then begin
    Exit;
  end;
  if (not chkTFO.Checked) then begin
    Exit;
  end;
  if Pos(sOperacao, 'IU') = 0 then begin
    Exit;
  end;
  sNN := FormatFloat('00000000000', DisplayValue);
  DisplayValue := sNN;
  If StrToInt(RightStr(sNN, 1)) <> StrToInt(barra.RetDV(LeftStr(sNN, 10))) then begin
    ErrorText := 'D�gito verificador do nosso n�mero n�o confere!';
    Error := True;
    Exit;
  end;
  if devolucao.getObject(sNN, 'NN') then begin
    if devolucao.Expedicao <> cxExpedicaoExpectativa.Date then begin
      ErrorText := PChar('Objeto pertence � expedi��o do dia ' +
        DateToStr(devolucao.Expedicao) + '!');
      Error := True;
      Exit;
    end;
  end;

end;

procedure TfrmDevolucoes.cxGrid1DBTableView1QTD_VOLUMESPropertiesValidate
  (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  if tbExpectativas.IsLoading then
  begin
    Exit;
  end;
  if TUtil.Empty(VarToStr(DisplayValue)) then
  begin
    ErrorText := 'Informe a quantidade de volumes!';
    Error := True;
    Exit;
  end;
  if DisplayValue = 0 then
  begin
    ErrorText := 'Informe a quantidade de volumes!';
    Error := True;
    Exit;
  end;

end;

procedure TfrmDevolucoes.cxGrid3DBTableView1DOM_MARCAPropertiesChange
  (Sender: TObject);
begin
  if dm.tbDevolucao.IsLoading then
  begin
    Exit;
  end;
  dm.tbDevolucao.Post;
  if dm.tbDevolucaoDOM_MARCA.Value = 'N' then
  begin
    if Application.MessageBox('Deseja atribuir esta devolu��o a outra base?', PChar('Aten��o ' + uGlobais.sUsuario), MB_YESNO + MB_ICONQUESTION) = IDYES then
    begin
      Screen.Cursor := crHourGlass;
      with dm.qryPesquisa do
      begin
        Close;
        SQL.Clear;
        SQL.Text := 'SELECT COD_AGENTE AS "C�digo", NOM_FANTASIA AS "Nome" ' +
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
      frmListaApoio.Caption := 'Agentes';
      if frmListaApoio.ShowModal = mrOk then
      begin
        dm.tbDevolucao.Edit;
        dm.tbDevolucaoCOD_BASE.AsInteger := dm.qryPesquisa.Fields[0].AsInteger;
        dm.tbDevolucaoDES_BASE.AsString := dm.qryPesquisa.Fields[1].AsString;
        dm.tbDevolucaoDOM_MARCA.AsString := 'S';
        dm.tbDevolucao.Post;
      end;
      Screen.Cursor := crDefault;
      dm.qryPesquisa.Close;
      dm.qryPesquisa.SQL.Clear;
      FreeAndNil(frmListaApoio);
      cxGrid3DBTableView1.DataController.Refresh;
    end;

  end;

end;

procedure TfrmDevolucoes.cxLacrePropertiesEditValueChanged(Sender: TObject);
begin
  cxDataExpedicao.Clear;
  cxCodAgente.Clear;
  cxNomAgente.Clear;
  cxPesoContainer.Clear;
  tbExpectativas.Close;
  tbExpectativas.Open;
  cxNossoNumero.Clear;
  cxNossoNumero.Properties.ReadOnly := True;
  actDevolucaoEncerrarConferencia.Enabled := False;
end;

procedure TfrmDevolucoes.cxNossoNumeroExit(Sender: TObject);
begin
  if (not TUtil.Empty(cxNossoNumero.Text)) then
  begin
    SalvaObjeto;
    cxNossoNumero.Clear;
  end;
end;

procedure TfrmDevolucoes.cxPageControl1Click(Sender: TObject);
begin
  if cxPageControl1.ActivePageIndex = 0 then
  begin
    tbExpectativas.Close;
    tbExpectativas.Open;
  end
  else if cxPageControl1.ActivePageIndex = 1 then
  begin
    tbExpectativas.Close;
    tbExpectativas.Open;
  end
  else if cxPageControl1.ActivePageIndex = 2 then
  begin
    dm.tbDevolucao.Close;
    dm.tbDevolucao.Open;
  end;
end;

procedure TfrmDevolucoes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if tbExpectativas.Active then
  begin
    tbExpectativas.Close;
  end;
  if dm.tbDevolucao.Active then
  begin
    dm.tbDevolucao.Close;
  end;
  tbBases.Close;
  agente.Free;
  devolucao.Free;
  contato.Free;
  barra.Free;
  acessos.Free;
  conexao.Free;
  Action := caFree;
  frmDevolucoes := Nil;
end;

procedure TfrmDevolucoes.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmDevolucoes.FormShow(Sender: TObject);
begin
  agente := TAgente.Create;
  devolucao := TDevolucoes.Create;
  contato := TContatoAgente.Create;
  barra := TBarrTFO.Create;
  acessos := TAcessos.Create;
  conexao := TConexao.Create;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    actDevolucaoSairExecute(Sender);
    Exit;
  end;
  PopulaBases;
  acessos.SetNivel(aclDevolucao);
  sOperacao := '';
end;

procedure TfrmDevolucoes.SalvaObjeto;
var
  sNossoNumero, sIdEntrega, sVolume, sErro, sCodCorrenteSelecionado, sMess,
    sPeso: String;
  nSobra: Integer;
  nIdEntrega, nVolume: Int64;
begin
  if (not tbExpectativas.Active) then
  begin
    tbExpectativas.Open;
  end;
  try
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
            ('O C�digo compactado TFO sempre tem 10 posi��es!', 'Aten��o',
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
          Application.MessageBox('N�mero do Volume Inv�lido!', 'Aten��o',
            MB_OK + MB_ICONEXCLAMATION);
          cxNossoNumero.Clear;
          cxNossoNumero.SetFocus;
          Exit;
        end;
        sVolume := Trim(IntToStr(nVolume));
        nIdEntrega := barra.ExpandLong(sIdEntrega);
        if nIdEntrega = 0 then
        begin
          Application.MessageBox('Nosso N�mero Inv�lido!', 'Aten��o',
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
          ('D�gito verificador do nosso n�mero n�o confere!', 'Aten��o',
          MB_OK + MB_ICONEXCLAMATION);
        cxNossoNumero.Clear;
        cxNossoNumero.SetFocus;
        Exit;
      end;
    end
    else
    begin
      sIdEntrega := cxNossoNumero.Text;
    end;
    sNossoNumero := sIdEntrega;
    sPeso := '0';
    if tbExpectativas.Locate('NUM_NOSSONUMERO', sNossoNumero, []) then
    begin
      if tbExpectativasCOD_STATUS_CONTAINER.Value >= 5 then
      begin
        Application.MessageBox(PChar('Container j� despachado!'), 'Aten��o!',
          MB_OK + MB_ICONWARNING);
      end
      else if tbExpectativasCOD_STATUS_OBJETO.Value = 4 then
      begin
        Application.MessageBox
          (PChar('Objeto ' + sNossoNumero + ' j� est� conferido!'), 'Aten��o!',
          MB_OK + MB_ICONWARNING);
      end
      else
      begin
        tbExpectativas.Edit;
        tbExpectativasCOD_STATUS_OBJETO.Value := 4;
        tbExpectativas.Post;
      end;
    end;
  finally
    cxNossoNumero.SetFocus;
  end;
end;

procedure TfrmDevolucoes.tbExpectativasAfterInsert(DataSet: TDataSet);
begin
  if (not tbExpectativas.IsLoading) then
  begin
    tbExpectativasQTD_VOLUMES.Value := 1;
    tbExpectativasCOD_STATUS_OBJETO.Value := 0;
    tbExpectativasCOD_STATUS_CONTAINER.Value := 0;
    tbExpectativasDAT_EXPEDICAO.Value := cxExpedicaoExpectativa.Date;
  end;
end;

procedure TfrmDevolucoes.ListaExpectativa;
var
  sMess: String;
begin
  try
    tbExpectativas.IsLoading := True;
    devolucao.Expedicao := cxExpedicaoExpectativa.Date;
    if not(devolucao.getObject(cxExpedicaoExpectativa.Text, 'CHAVE7')) then
    begin
      Exit;
    end;
    sOperacao := 'U';
    Modo;
    tbExpectativas.Close;
    tbExpectativas.Open;
    while (not dm.qryGetObject.Eof) do
    begin
      tbExpectativas.Insert;
      tbExpectativasNUM_NOSSONUMERO.Value := dm.qryGetObject.FieldByName('NUM_NOSSONUMERO').AsString;
      tbExpectativasQTD_VOLUMES.Value := dm.qryGetObject.FieldByName('QTD_VOLUMES').AsInteger;
      tbExpectativasCOD_STATUS_OBJETO.Value := dm.qryGetObject.FieldByName('COD_STATUS_OBJETO').AsInteger;
      tbExpectativasCOD_STATUS_CONTAINER.Value := dm.qryGetObject.FieldByName('COD_STATUS_CONTAINER').AsInteger;
      tbExpectativasQTD_PESO_OBJETO.Value := dm.qryGetObject.FieldByName('QTD_PESO_CONTAINER').AsFloat;
      tbExpectativasDAT_EXPEDICAO.Value := dm.qryGetObject.FieldByName('DAT_EXPEDICAO').AsDateTime;
      tbExpectativasDES_DEVOLUCAO.Value := dm.qryGetObject.FieldByName('DES_DEVOLUCAO').AsString;
      tbExpectativasCOD_BASE.Value := dm.qryGetObject.FieldByName('COD_AGENTE').AsInteger;
      if dm.qryGetObject.FieldByName('COD_STATUS_CONTAINER').AsInteger <> 0 then
      begin
        tbExpectativasDOM_MARCA.Value := 'N';
      end
      else
      begin
        tbExpectativasDOM_MARCA.Value := 'S';
      end;
      tbExpectativas.Post;
      dm.qryGetObject.Next;
    end;
  finally
    tbExpectativas.IsLoading := False;
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
  end;
end;

procedure TfrmDevolucoes.SalvaExpectativa;
begin
  try
    if tbExpectativas.IsEmpty then
    begin
      Exit;
    end;
    tbExpectativas.First;
    devolucao.Expedicao := cxExpedicaoExpectativa.Date;
    devolucao.agente := tbExpectativasCOD_BASE.AsInteger;
    if (not devolucao.Delete('CHAVE')) then
    begin
      Application.MessageBox('Erro ao excluir a expectativa!', 'Aten��o',
        MB_ICONERROR + MB_OK);
      Exit;
    end;
    devolucao.MaxExpectativa;
    while (not tbExpectativas.Eof) do
    begin
      devolucao.Objeto := tbExpectativas.RecIdField.Value;
      devolucao.Expedicao := tbExpectativasDAT_EXPEDICAO.Value;
      devolucao.agente := tbExpectativasCOD_BASE.AsInteger;
      devolucao.Lacre := '0';
      devolucao.NossoNumero := tbExpectativasNUM_NOSSONUMERO.Value;
      devolucao.Volumes := tbExpectativasQTD_VOLUMES.Value;
      devolucao.StatusObjeto := tbExpectativasCOD_STATUS_OBJETO.Value;
      devolucao.StatusContainer := 0;
      devolucao.Divergencia := '';
      devolucao.Motorista := '';
      devolucao.Retirada := 0;
      devolucao.Recebedor := '';
      devolucao.Recepcao := 0;
      devolucao.Conferente := '';
      devolucao.Conferencia := 0;
      devolucao.PesoContainer := tbExpectativasQTD_PESO_OBJETO.Value;
      devolucao.Descricao := tbExpectativasDES_DEVOLUCAO.AsString;
      devolucao.Usuario := uGlobais.sUsuario;
      devolucao.Manutencao := Now;
      if (not devolucao.Exist()) then
      begin
        if (not devolucao.Insert()) then
        begin
          Application.MessageBox
            (PChar('Erro ao incluir Objeto' + devolucao.NossoNumero + ' !'),
            'Aten��o', MB_ICONERROR + MB_OK);
        end;
      end;
      tbExpectativas.Next;
    end;
  finally
    tbExpectativas.First;
    Application.MessageBox('Expectativa Salva.', 'Aten��o',
      MB_OK + MB_ICONINFORMATION);
    sOperacao := 'U';
    Modo;
  end;
end;

procedure TfrmDevolucoes.Modo;
begin
  if sOperacao = 'I' then
  begin
    actDevolucaoNovaExpectativa.Enabled := True;
    actDevolucaoExcluirExpectativa.Enabled := False;
    actDevolucaoFecharExpectativa.Enabled := False;
    actDevolucaoSalvarExpectativas.Enabled := True;
  end
  else if sOperacao = 'U' then
  begin
    actDevolucaoNovaExpectativa.Enabled := True;
    actDevolucaoExcluirExpectativa.Enabled := True;
    actDevolucaoFecharExpectativa.Enabled := True;
    actDevolucaoSalvarExpectativas.Enabled := True;
  end
  else if sOperacao = 'X' then
  begin
    actDevolucaoNovaExpectativa.Enabled := True;
    actDevolucaoExcluirExpectativa.Enabled := False;
    actDevolucaoFecharExpectativa.Enabled := False;
    actDevolucaoSalvarExpectativas.Enabled := False;
  end;
  acessos.SetNivel(aclDevolucao);
end;

procedure TfrmDevolucoes.FechaExpectativa;
var
  sBasesVez: String;
begin
  try
    sBasesVez := '';
    if tbExpectativas.IsEmpty then begin
      Exit;
    end;
    tbExpectativas.First;
    while (not tbExpectativas.Eof) do begin
      if tbExpectativasDOM_MARCA.AsString = 'S' then
      begin
        if tbExpectativasCOD_STATUS_CONTAINER.AsInteger = 0 then
        begin
          devolucao.NossoNumero := tbExpectativasNUM_NOSSONUMERO.AsString;
          devolucao.StatusContainer := 0;
          if devolucao.Descricao.IsEmpty  then
          begin
            devolucao.Descricao := 'DST-Devolu��o Solicita��o TFO'
          end;
          devolucao.Usuario := uGlobais.sUsuario;
          devolucao.Manutencao := Now;
          if (not devolucao.FechaExpectativa()) then begin
            Application.MessageBox(PChar('Erro ao Fechar Objeto' + devolucao.NossoNumero + ' !'), 'Aten��o', MB_ICONERROR + MB_OK);
          end
          else begin
            tbExpectativas.Edit;
            tbExpectativasCOD_STATUS_CONTAINER.Value := 0;
            tbExpectativas.Post;
          end;
          {if Pos(tbExpectativasCOD_BASE.AsString,sBasesVez) = 0 then
          begin
            sBasesVez := sBasesVez + ',' + tbExpectativasCOD_BASE.AsString;
            EMailExpectativa(tbExpectativasCOD_BASE.AsString);
          end;}
        end;
      end;
      tbExpectativas.Next;
    end;
  finally
    tbExpectativas.First;
    Application.MessageBox('Expedi��o Fechada.', 'Aten��o',
      MB_OK + MB_ICONINFORMATION);
  end;
end;

function TfrmDevolucoes.ListaLacre(): Boolean;
var
  dPeso: Double;
begin
  try
    Result := False;
    dPeso := 0;
    tbExpectativas.IsLoading := True;
    devolucao.Lacre := cxLacre.Text;
    devolucao.Protocolo := cxLacre.Text;
    if (not devolucao.getObject('', 'PROTOCOLO')) then
    begin
      if (not devolucao.getObject('', 'LACRE')) then
      begin
        Exit;
      end;
    end;
    cxDataExpedicao.Text := dm.qryGetObject.FieldByName('DAT_EXPEDICAO').AsString;
    cxCodAgente.Text := dm.qryGetObject.FieldByName('COD_AGENTE').AsString;
    agente.Codigo := dm.qryGetObject.FieldByName('COD_AGENTE').AsString;
    cxNomAgente.Text := agente.getField('NOM_FANTASIA', 'CODIGO');
    if TUtil.Empty(cxNomAgente.Text) then
    begin
      cxNomAgente.Text := 'N�O CADASTRADO';
    end;
    tbExpectativas.Close;
    tbExpectativas.Open;
    while (not dm.qryGetObject.Eof) do
    begin
      tbExpectativas.Insert;
      tbExpectativasNUM_NOSSONUMERO.Value := dm.qryGetObject.FieldByName
        ('NUM_NOSSONUMERO').AsString;
      tbExpectativasQTD_VOLUMES.Value := dm.qryGetObject.FieldByName
        ('QTD_VOLUMES').AsInteger;
      tbExpectativasCOD_STATUS_OBJETO.Value := dm.qryGetObject.FieldByName
        ('COD_STATUS_OBJETO').AsInteger;
      tbExpectativasCOD_STATUS_CONTAINER.Value :=
        dm.qryGetObject.FieldByName('COD_STATUS_CONTAINER').AsInteger;
      dPeso := dPeso + dm.qryGetObject.FieldByName
        ('QTD_PESO_CONTAINER').AsFloat;
      tbExpectativasQTD_PESO_OBJETO.Value := dm.qryGetObject.FieldByName
        ('QTD_PESO_CONTAINER').AsFloat;
      tbExpectativasDES_DIVERGENCIA.Value := dm.qryGetObject.FieldByName
        ('DES_DIVERGENCIA').AsString;
      tbExpectativasDAT_EXPEDICAO.Value := dm.qryGetObject.FieldByName
        ('DAT_EXPEDICAO').AsDateTime;
      tbExpectativas.Post;
      dm.qryGetObject.Next;
    end;
    cxPesoContainer.Text := FormatFloat('0.000', dPeso);
    actDevolucaoEncerrarConferencia.Enabled := True;
    Result := True;
  finally
    tbExpectativas.IsLoading := False;
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
  end;
end;

function TfrmDevolucoes.EncerrarConferencia(): Boolean;
begin
  try
    Result := False;
    tbExpectativas.IsLoading := True;
    devolucao.Lacre := cxLacre.Text;
    while (not tbExpectativas.Eof) do
    begin
      if devolucao.getObject(tbExpectativasNUM_NOSSONUMERO.Text, 'NN') then
      begin
        if tbExpectativasCOD_STATUS_OBJETO.Value = 4 then
        begin
          devolucao.StatusObjeto := tbExpectativasCOD_STATUS_OBJETO.Value;
          devolucao.StatusContainer := 5;
          devolucao.Divergencia := tbExpectativasDES_DIVERGENCIA.Value;
          devolucao.Conferente := uGlobais.sNomeUsuario;
          devolucao.Conferencia := Now;
          if TUtil.Empty(devolucao.Recebedor) then
          begin
            devolucao.Recebedor := uGlobais.sNomeUsuario;
            devolucao.Recepcao := Now;
          end;
          if not(devolucao.Update()) then
          begin
            Application.MessageBox
              (PChar('Erro a fechar a confer�ncia! Objeto NN ' +
              devolucao.NossoNumero + '.'), 'Aten��o!', MB_OK + MB_ICONWARNING);
          end;
          tbExpectativas.Edit;
          tbExpectativasCOD_STATUS_CONTAINER.Value := 5;
          tbExpectativas.Post
        end;
      end
      else
      begin
        Application.MessageBox(PChar('Objeto NN ' + devolucao.NossoNumero +
          ' n�o encontrado.'), 'Aten��o!', MB_OK + MB_ICONWARNING);
      end;
      tbExpectativas.Next;
    end;
    cxDataExpedicao.Clear;
    cxLacre.Clear;
    cxCodAgente.Clear;
    cxNomAgente.Clear;
    cxPesoContainer.Clear;
    cxNossoNumero.Clear;
    cxNossoNumero.Properties.ReadOnly := True;
    cxLacre.SetFocus;
    actDevolucaoEncerrarConferencia.Enabled := False;
    Application.MessageBox(PChar('Container n�. ' + devolucao.Lacre +
      ' conferido!'), 'Aten��o', MB_OK + MB_ICONINFORMATION);
    Result := True;
  finally
    tbExpectativas.Close;
    tbExpectativas.Open;
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
  end;
end;

procedure TfrmDevolucoes.EMailExpectativa(sBase: String);
begin
  EMailBase(sBase);
  if not Assigned(frmEnvioEmail) then begin
    frmEnvioEmail := TfrmEnvioEmail.Create(Application);
  end;
  DestinatarioEmail;
  frmEnvioEmail.cxAssunto.Text :=
    'Ordem de Devolu��o de Produto. Expedi��o ' +
    cxExpedicaoExpectativa.Text + '.';
  frmEnvioEmail.cxMensagem.Clear;
  frmEnvioEmail.cxMensagem.Lines.Add('Senhores(as) ');
  frmEnvioEmail.cxMensagem.Lines.Add(' ');
  frmEnvioEmail.cxMensagem.Lines.Add
    ('Seguem abaixo os NNs de produtos a serem devolvidos na expedi��o de ' +
    cxExpedicaoExpectativa.Text + '.');
  frmEnvioEmail.cxMensagem.Lines.Add(' ');
  frmEnvioEmail.cxMensagem.Lines.Add('NN            VOL N�.');
  frmEnvioEmail.cxMensagem.Lines.Add('------------  -------');
  devolucao.StatusObjeto := 0;
  if devolucao.getObject(sBase, 'CHAVE4') then
  begin
    while (not dm.qryGetObject.Eof) do
    begin
      frmEnvioEmail.cxMensagem.Lines.Add
        (dm.qryGetObject.FieldByName('NUM_NOSSONUMERO').AsString + '    ' +
        dm.qryGetObject.FieldByName('QTD_VOLUMES').AsString);
      dm.qryGetObject.Next;
    end;
  end;
  dm.qryGetObject.Close;
  dm.qryGetObject.SQL.Clear;
  frmEnvioEmail.cxMensagem.Lines.Add(' ');
  frmEnvioEmail.cxMensagem.Lines.Add('ATEN��O!');
  frmEnvioEmail.cxMensagem.Lines.Add(' ');
  frmEnvioEmail.cxMensagem.Lines.Add('Atraso na Devolu��o tamb�m afeta a sua PERFORMANCE, e � pass�vel de extravio.');
  frmEnvioEmail.cxMensagem.Lines.Add('Mantenha suas Devolu��es em dia e siga as recomenda��es abaixo:');
  frmEnvioEmail.cxMensagem.Lines.Add('Sempre verificar, observando o Protocolo ou Hist�rico do Produto se este trata-se ' +
                                     ' de uma Entrega com mais de um volume;');
  frmEnvioEmail.cxMensagem.Lines.Add('Caso o Produto a ser devolvido � oriundo de uma autoriza��o de Entrega via e-mail ' +
                                     '(Embalagem Avariada), fotografe as condi��es do Produto na hora da Devolu��o;');
  frmEnvioEmail.cxMensagem.Lines.Add('� recomend�vel que todos os Produtos a serem Devolvidos sejam pelos senhores fotografados ' +
                                     'e tenham as fotos sob guarda.');
frmEnvioEmail.cxMensagem.Lines.Add(' ');
  frmEnvioEmail.cxMensagem.Lines.Add('O CONTAINER DEVE ESTAR LACRADO NO MOMENTO DA RETIRADA PELO MOTORISTA.');
  frmEnvioEmail.cxMensagem.Lines.Add('O MOTORISTA N�O EST� AUTORIZADO A AGUARDAR O FECHAMENTO DO CONTAINER DE DEVOLU��O.');
  frmEnvioEmail.cxMensagem.Lines.Add(' ');
  frmEnvioEmail.cxMensagem.Lines.Add(' ');
  frmEnvioEmail.cxMensagem.Lines.Add('Atenciosamente ');
  frmEnvioEmail.cxMensagem.Lines.Add('Controle Franquia');
  frmEnvioEmail.cxMensagem.Lines.Add('TRANSFOLHA Franquia Novo Rio');
  if frmEnvioEmail.ShowModal = mrCancel then
  begin
    FreeAndNil(frmEnvioEmail);
    Exit;
  end;
  FreeAndNil(frmEnvioEmail);
end;

procedure TfrmDevolucoes.EMailDivergencia;
begin
  EMailBase(cxCodAgente.Text);
  if not Assigned(frmEnvioEmail) then
  begin
    frmEnvioEmail := TfrmEnvioEmail.Create(Application);
  end;
  DestinatarioEmail;
  frmEnvioEmail.cxAssunto.Text :=
    'Informa��o de diverg�ncia de devolu��o de produtos. Expedi��o ' +
    tbExpectativasDAT_EXPEDICAO.AsString + ', NN ' +
    tbExpectativasNUM_NOSSONUMERO.AsString;
  frmEnvioEmail.cxMensagem.Clear;
  frmEnvioEmail.cxMensagem.Lines.Add('Caros ');
  frmEnvioEmail.cxMensagem.Lines.Add(' ');
  frmEnvioEmail.cxMensagem.Lines.Add
    ('Constatada a diverg�ncia abaixo descrita no NN ' +
    tbExpectativasNUM_NOSSONUMERO.AsString + ' da expedi��o de ' +
    tbExpectativasDAT_EXPEDICAO.AsString + '.');
  frmEnvioEmail.cxMensagem.Lines.Add(' ');
  frmEnvioEmail.cxMensagem.Lines.Add(tbExpectativasDES_DIVERGENCIA.AsString);
  frmEnvioEmail.cxMensagem.Lines.Add(' ');
  frmEnvioEmail.cxMensagem.Lines.Add('Grato ');
  frmEnvioEmail.cxMensagem.Lines.Add('Setor de Devolu��es');
  frmEnvioEmail.cxMensagem.Lines.Add('TRANSFOLHA Franquia Novo Rio');
  if frmEnvioEmail.ShowModal = mrCancel then
  begin
    FreeAndNil(frmEnvioEmail);
    Exit;
  end;
  FreeAndNil(frmEnvioEmail);
end;

procedure TfrmDevolucoes.EMailBase(sBase: String);
begin
  sEmailBase := '';
  if (not contato.getObject(sBase, 'CODIGO')) then begin
    Exit;
  end;
  dm.qryGetObject.First;
  while (not dm.qryGetObject.Eof) do begin
    if (not dm.qryGetObject.FieldByName('DES_EMAIL').AsString.IsEmpty) then begin
      if (not sEmailBase.IsEmpty) then begin
        sEmailBase := sEmailBase + ';';
      end;
      sEmailBase := sEmailBase + dm.qryGetObject.FieldByName('DES_EMAIL').AsString;
    end;
    dm.qryGetObject.Next;
  end;
  dm.qryGetObject.Close;
  dm.qryGetObject.SQL.Clear;
end;

procedure TfrmDevolucoes.EMailExpedicao(sData: String);
begin
  EMailBase(cxCodAgente.Text);
  if not Assigned(frmEnvioEmail) then
  begin
    frmEnvioEmail := TfrmEnvioEmail.Create(Application);
  end;
  DestinatarioEmail;
  frmEnvioEmail.cxAssunto.Text := 'Altera��o da data de Expedicao. NN ' +
    tbExpectativasNUM_NOSSONUMERO.AsString + '.';
  frmEnvioEmail.cxMensagem.Clear;
  frmEnvioEmail.cxMensagem.Lines.Add('Caros ');
  frmEnvioEmail.cxMensagem.Lines.Add(' ');
  frmEnvioEmail.cxMensagem.Lines.Add
    ('O NN teve sua data de expedi��o alterada para ' + sData + '.');
  frmEnvioEmail.cxMensagem.Lines.Add(' ');
  frmEnvioEmail.cxMensagem.Lines.Add('NN            VOL N�.');
  frmEnvioEmail.cxMensagem.Lines.Add(tbExpectativasNUM_NOSSONUMERO.AsString +
    '    ' + tbExpectativasQTD_VOLUMES.AsString);
  frmEnvioEmail.cxMensagem.Lines.Add(' ');
  frmEnvioEmail.cxMensagem.Lines.Add('Grato ');
  frmEnvioEmail.cxMensagem.Lines.Add('Setor de Devolu��es');
  frmEnvioEmail.cxMensagem.Lines.Add('TRANSFOLHA Franquia Novo Rio');
  if frmEnvioEmail.ShowModal = mrCancel then
  begin
    FreeAndNil(frmEnvioEmail);
    Exit;
  end;
  FreeAndNil(frmEnvioEmail);
end;

procedure TfrmDevolucoes.DestinatarioEmail;
begin
  frmEnvioEmail.cxDestintarios.Items.Clear;
  frmEnvioEmail.cxDestintarios.Items.Add(sEmailBase);
  frmEnvioEmail.cxCopiaCom.Items.Clear;
  frmEnvioEmail.cxCopiaCom.Items.Add('amarildo@rjsmart.com.br');
  frmEnvioEmail.cxCopiaCom.Items.Add('riodejaneiro.oper@transfolha.com.br');
  frmEnvioEmail.cxCopiaCom.Items.Add(uGlobais.sEMailUser);
end;

procedure TfrmDevolucoes.ds1StateChange(Sender: TObject);
begin
  if TDataSource(Sender).DataSet.State in [dsInsert] then
  begin
    cxGrid1DBTableView1COD_BASE.Properties.ReadOnly := False;
  end
  else
  begin
    cxGrid1DBTableView1COD_BASE.Properties.ReadOnly := True;
  end;
end;

procedure TfrmDevolucoes.SalvaImportacao;
var
  iConta, iTotal: Integer;
begin
  try
    if dm.tbDevolucao.IsEmpty then
    begin
      Exit;
    end;
    dm.tbDevolucao.First;
    devolucao.MaxExpectativa;
    iTotal := dm.tbDevolucaoNUM_VOLUME.Value;
    while (not dm.tbDevolucao.Eof) do
    begin
      if dm.tbDevolucaoDOM_MARCA.Value = 'S' then
      begin
        if dm.tbDevolucaoCOD_BASE.Value <> 0 then
        begin
          for iConta := 1 to iTotal do
          begin
            devolucao.MaxObjeto;
            devolucao.Expedicao := dm.tbDevolucaoDAT_EXPEDICAO.Value;;
            devolucao.agente := dm.tbDevolucaoCOD_BASE.Value;;
            devolucao.Lacre := '0';
            devolucao.NossoNumero := dm.tbDevolucaoNUM_NOSSONUMERO.Value;
            devolucao.Volumes := iConta;
            devolucao.StatusObjeto := 0;
            devolucao.StatusContainer := 0;
            devolucao.Divergencia := '';
            devolucao.Descricao := 'DST-Devolu��o Solicita��o TFO';
            devolucao.Motorista := '';
            devolucao.Retirada := 0;
            devolucao.Recebedor := '';
            devolucao.Recepcao := 0;
            devolucao.Conferente := '';
            devolucao.Conferencia := 0;
            devolucao.PesoContainer := 0;
            devolucao.Usuario := uGlobais.sUsuario;
            devolucao.Manutencao := Now;
            if (not devolucao.Exist()) then
            begin
              if (not devolucao.Insert()) then
              begin
                Application.MessageBox(PChar('Erro ao incluir Objeto' + devolucao.NossoNumero +
                  ' !'), 'Aten��o', MB_ICONERROR + MB_OK);
                dm.tbDevolucao.Edit;
                dm.tbDevolucaoCOD_STATUS.Value := 2;
                dm.tbDevolucao.Post;
              end
              else
              begin
                dm.tbDevolucao.Edit;
                dm.tbDevolucaoCOD_STATUS.Value := 1;
                dm.tbDevolucao.Post;
              end;
            end
            else
            begin
              dm.tbDevolucao.Edit;
              dm.tbDevolucaoCOD_STATUS.Value := 2;
              dm.tbDevolucao.Post;
            end;
          end;
        end;
      end;
      dm.tbDevolucao.Next;
    end;
  finally
    dm.tbDevolucao.Close;
    Application.MessageBox('Expectativas Salvas.', 'Aten��o',
      MB_OK + MB_ICONINFORMATION);
  end;
end;

procedure TfrmDevolucoes.EMailExtravio;
begin
  EMailBase(cxCodAgente.Text);
  if not Assigned(frmEnvioEmail) then
  begin
    frmEnvioEmail := TfrmEnvioEmail.Create(Application);
  end;
  DestinatarioEmail;
  frmEnvioEmail.cxAssunto.Text :=
    'Informa��o de EXTRAVIO Objeto Desvolvido. Expedi��o ' +
    tbExpectativasDAT_EXPEDICAO.AsString + ', NN ' +
    tbExpectativasNUM_NOSSONUMERO.AsString;
  frmEnvioEmail.cxMensagem.Clear;
  frmEnvioEmail.cxMensagem.Lines.Add('Caros ');
  frmEnvioEmail.cxMensagem.Lines.Add(' ');
  frmEnvioEmail.cxMensagem.Lines.Add('Registrado EXTRAVIO do Objeto no NN ' +
    tbExpectativasNUM_NOSSONUMERO.AsString + ' da expedi��o de ' +
    tbExpectativasDAT_EXPEDICAO.AsString + ' pelos motivos abaixo descritos.');
  frmEnvioEmail.cxMensagem.Lines.Add(' ');
  frmEnvioEmail.cxMensagem.Lines.Add(tbExpectativasDES_DIVERGENCIA.AsString);
  frmEnvioEmail.cxMensagem.Lines.Add(' ');
  frmEnvioEmail.cxMensagem.Lines.Add('Grato ');
  frmEnvioEmail.cxMensagem.Lines.Add('Setor de Devolu��es');
  frmEnvioEmail.cxMensagem.Lines.Add('TRANSFOLHA Franquia Novo Rio');
  if frmEnvioEmail.ShowModal = mrCancel then
  begin
    FreeAndNil(frmEnvioEmail);
    Exit;
  end;
  FreeAndNil(frmEnvioEmail);
end;

procedure TfrmDevolucoes.PopulaBases;
begin
  tbBases.Close;
  tbBases.Open;
  if (not agente.getObjects) then
  begin
    Exit;
  end;
  tbBases.LoadFromDataSet(dm.qryGetObject);
  dm.qryGetObject.Close;
  dm.qryGetObject.SQL.Clear;
  if (not tbBases.IsEmpty) then
  begin
    tbBases.First;
  end;
end;

function TfrmDevolucoes.AtribuiBase(): Boolean;
var
  sBase: String;
begin
  sBase := '';
  if tbExpectativas.IsEmpty then
  begin
    Exit;
  end;
  Screen.Cursor := crHourGlass;
  with dm.qryPesquisa do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT COD_AGENTE AS "C�digo", NOM_FANTASIA AS "Nome" FROM tbagentes ';
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
  frmListaApoio.Caption := 'Seleciona uma Base';
  Screen.Cursor := crDefault;
  if frmListaApoio.ShowModal = mrOk then
  begin
    sBase := dm.qryPesquisa.Fields[0].AsString;
  end
  else
  begin
    Application.MessageBox('A Base deve ser Informada!', PChar('Aten��o ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
    dm.qryPesquisa.Close;
    dm.qryPesquisa.SQL.Clear;
    tbExpectativas.Cancel;
    Exit;
  end;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  FreeAndNil(frmListaApoio);
  if StrToIntDef(sBase,0) = 0 then
  begin
    Application.MessageBox('Base n�o encontrada!', PChar('Aten��o ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  tbExpectativasCOD_BASE.AsInteger := StrToInt(sBase);
end;

procedure TfrmDevolucoes.MandaEmail;
begin
  if not devolucao.BasesRetorno() then
  begin
    Exit;
  end;
  while not dm.qryPesquisa.Eof do
  begin
    EMailExpectativa(dm.qryPesquisa.FieldByName('COD_AGENTE').AsString);
    dm.qryPesquisa.Next;
  end;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
end;

end.
