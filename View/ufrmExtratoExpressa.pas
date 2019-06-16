unit ufrmExtratoExpressa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxLabel, dxSkinscxPCPainter, dxLayoutContainer, dxLayoutControl, Vcl.ComCtrls, dxCore,
  cxDateUtils, dxLayoutcxEditAdapters, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxCheckListBox, System.Actions,
  Vcl.ActnList, dxLayoutControlAdapters, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxCurrencyEdit, cxCheckBox, clAgentes, clCliente,
  clCodigosEntregadores, cxListBox, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, dxmdaset,
  cxGridBandedTableView, cxGridDBBandedTableView, clEntrega, clGruposVerba, clLancamentos, clAbastecimentos, clRestricoes,
  cxGridExportLink, ShellAPI, Model.ExtratoExpressas, DAO.ExtratoExpressas, Generics.Collections, System.DateUtils,
  cxDBLookupComboBox, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light;

type
  TfrmExtratoExpressa = class(TForm)
    cxLabel27: TcxLabel;
    aclExtrato: TActionList;
    actSelecionarTodosClientes: TAction;
    actDesmarcarTodosClientes: TAction;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    dxLayoutControl2Group_Root: TdxLayoutGroup;
    dxLayoutControl2: TdxLayoutControl;
    dxLayoutControl1Item1: TdxLayoutItem;
    dxLayoutControl3Group_Root: TdxLayoutGroup;
    dxLayoutControl3: TdxLayoutControl;
    lciExtrato: TdxLayoutItem;
    dxLayoutControl4Group_Root: TdxLayoutGroup;
    dxLayoutControl4: TdxLayoutControl;
    dxLayoutControl2Item2: TdxLayoutItem;
    datinicioExtrato: TcxDateEdit;
    lcDataInicialExtrato: TdxLayoutItem;
    datFinalExtrato: TcxDateEdit;
    lciDataFinalExtrato: TdxLayoutItem;
    cboTipoPeriodo: TcxComboBox;
    lciTipoPeriodo: TdxLayoutItem;
    cboTipoExtrato: TcxComboBox;
    lciTipoExtrato: TdxLayoutItem;
    cboTipoCalculo: TcxComboBox;
    lcitipoCalculo: TdxLayoutItem;
    curValorVerba: TcxCurrencyEdit;
    lciVerbaFixa: TdxLayoutItem;
    pupClientes: TPopupMenu;
    SelecionarTodos1: TMenuItem;
    DesmarcarTodos1: TMenuItem;
    actSelecionarTodosDistribuidores: TAction;
    actDesmarcarTodosDistribuidores: TAction;
    pupDistribuidores: TPopupMenu;
    SelecionarTodos2: TMenuItem;
    Desmarcartodos2: TMenuItem;
    chkRestricoes: TcxCheckBox;
    cliRestricoes: TdxLayoutItem;
    dxLayoutControl3Group1: TdxLayoutAutoCreatedGroup;
    chkLancamentos: TcxCheckBox;
    cliLancamentos: TdxLayoutItem;
    chkAbastecimento: TcxCheckBox;
    cliAbastecimento: TdxLayoutItem;
    actProcessar: TAction;
    cxButton1: TcxButton;
    dxLayoutControl3Item1: TdxLayoutItem;
    lbClientes: TcxListBox;
    lciClientes: TdxLayoutItem;
    lbDistribuidores: TcxListBox;
    lciDistribuidores: TdxLayoutItem;
    actFechar: TAction;
    cxButton2: TcxButton;
    dxLayoutControl1Item2: TdxLayoutItem;
    actgPesquisarClientes: TAction;
    Pesquisar1: TMenuItem;
    actExcluirCliente: TAction;
    Excluir1: TMenuItem;
    actPesquisarDistribuidores: TAction;
    actExcluirDistribuidores: TAction;
    Pesquisa1: TMenuItem;
    Excluir2: TMenuItem;
    tbExtrato: TdxMemData;
    tbExtratoCOD_TIPO: TIntegerField;
    tbExtratoCOD_DISTRIBUIDOR: TIntegerField;
    tbExtratoNOM_DISTRIBUIDOR: TWideStringField;
    tbExtratoCOD_ENTREGADOR: TIntegerField;
    tbExtratoNOM_ENTREGADOR: TWideStringField;
    tbExtratoQTD_VOLUMES: TLargeintField;
    tbExtratoQTD_ENTREGA: TLargeintField;
    tbExtratoVAL_VERBA: TFloatField;
    tbExtratoVAL_CREDITO: TFloatField;
    tbExtratoVAL_DEBITO: TFloatField;
    tbExtratoVAL_RESTRICAO: TFloatField;
    tbExtratoVAL_PENALIDADE_ATRASOS: TFloatField;
    tbExtratoQTD_VOLUMES_EXTRA: TFloatField;
    tbExtratoVAL_VOLUMES_EXTRA: TFloatField;
    tbExtratoVAL_ABASTECIMENTO: TFloatField;
    tbExtratoVAL_PERCENTUAL_DISTRIBUIDOR: TFloatField;
    tbExtratoVAL_PERCENTUAL_ENTREGADOR: TFloatField;
    tbExtratoVAL_TOTAL_DEBITOS: TFloatField;
    tbExtratoVAL_TOTAL_CREDITOS: TFloatField;
    tbExtratoVAL_TOTAL_GERAL: TFloatField;
    tbExtratoDAT_INICIO: TDateField;
    tbExtratoDAT_TERMINO: TDateField;
    tbExtratoDAT_PAGAMENTO: TDateField;
    tbExtratoNUM_EXTRATO: TWideStringField;
    tbExtratoQTD_ATRASOS: TLargeintField;
    tbExtratoCOD_CADASTRO: TIntegerField;
    lvExtrato: TcxGridLevel;
    grdExtrato: TcxGrid;
    dxLayoutControl1Item3: TdxLayoutItem;
    tvExtrato: TcxGridDBBandedTableView;
    dsExtrato: TDataSource;
    tvExtratoRecId: TcxGridDBBandedColumn;
    tvExtratoCOD_TIPO: TcxGridDBBandedColumn;
    tvExtratoCOD_DISTRIBUIDOR: TcxGridDBBandedColumn;
    tvExtratoNOM_DISTRIBUIDOR: TcxGridDBBandedColumn;
    tvExtratoCOD_CADASTRO: TcxGridDBBandedColumn;
    tvExtratoCOD_ENTREGADOR: TcxGridDBBandedColumn;
    tvExtratoNOM_ENTREGADOR: TcxGridDBBandedColumn;
    tvExtratoVAL_PERCENTUAL_DISTRIBUIDOR: TcxGridDBBandedColumn;
    tvExtratoVAL_PERCENTUAL_ENTREGADOR: TcxGridDBBandedColumn;
    tvExtratoQTD_VOLUMES: TcxGridDBBandedColumn;
    tvExtratoQTD_VOLUMES_EXTRA: TcxGridDBBandedColumn;
    tvExtratoQTD_ENTREGA: TcxGridDBBandedColumn;
    tvExtratoQTD_ATRASOS: TcxGridDBBandedColumn;
    tvExtratoVAL_VERBA: TcxGridDBBandedColumn;
    tvExtratoVAL_VOLUMES_EXTRA: TcxGridDBBandedColumn;
    tvExtratoVAL_CREDITO: TcxGridDBBandedColumn;
    tvExtratoVAL_RESTRICAO: TcxGridDBBandedColumn;
    tvExtratoVAL_ABASTECIMENTO: TcxGridDBBandedColumn;
    tvExtratoVAL_PENALIDADE_ATRASOS: TcxGridDBBandedColumn;
    tvExtratoVAL_DEBITO: TcxGridDBBandedColumn;
    tvExtratoVAL_TOTAL_CREDITOS: TcxGridDBBandedColumn;
    tvExtratoVAL_TOTAL_DEBITOS: TcxGridDBBandedColumn;
    tvExtratoVAL_TOTAL_GERAL: TcxGridDBBandedColumn;
    tvExtratoDAT_INICIO: TcxGridDBBandedColumn;
    tvExtratoDAT_TERMINO: TcxGridDBBandedColumn;
    tvExtratoDAT_PAGAMENTO: TcxGridDBBandedColumn;
    tvExtratoNUM_EXTRATO: TcxGridDBBandedColumn;
    tbExtratoVAL_VERBA_TOTAL: TFloatField;
    tvExtratoVAL_VERBA_TOTAL: TcxGridDBBandedColumn;
    actOpcoesClientes: TAction;
    actOpcoesDistribuidores: TAction;
    actExportar: TAction;
    SaveDialog: TSaveDialog;
    cxButton3: TcxButton;
    dxLayoutControl1Item4: TdxLayoutItem;
    dxLayoutControl1Group1: TdxLayoutAutoCreatedGroup;
    chkAtribuirVerbas: TcxCheckBox;
    cliAtribuirVerbas: TdxLayoutItem;
    dxLayoutControl3Group3: TdxLayoutAutoCreatedGroup;
    dxLayoutControl3Group5: TdxLayoutAutoCreatedGroup;
    dxLayoutControl3Group2: TdxLayoutAutoCreatedGroup;
    actFecharExtrato: TAction;
    cxButton4: TcxButton;
    dxLayoutControl3Item2: TdxLayoutItem;
    dxLayoutControl3Group4: TdxLayoutAutoCreatedGroup;
    cboDatas: TcxComboBox;
    lciDatasPagamento: TdxLayoutItem;
    cboTipoExtratoFechado: TcxComboBox;
    lciTipoExtratoFechado: TdxLayoutItem;
    lbDistribuidoresFechado: TcxListBox;
    lciDistribuidoresFechado: TdxLayoutItem;
    actSelecionarDistribuidoresFechado: TAction;
    actDesmarcarTodosDistribuidoresFechados: TAction;
    actPesquisaDistribuidoresFechado: TAction;
    actExcluirDistribuicaoFechado: TAction;
    pupDistribuidoresFechado: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    cxButton5: TcxButton;
    dxLayoutControl4Item4: TdxLayoutItem;
    actEmitirExtrato: TAction;
    actReabrirExtrato: TAction;
    tvExtratoCOD_CLIENTE: TcxGridDBBandedColumn;
    dsClientes: TDataSource;
    tbClientes: TdxMemData;
    tbClientesCOD_CLIENTE: TIntegerField;
    tbClientesNOM_CLIENTE: TStringField;
    tbClientesDOM_OS: TStringField;
    tbExtratoCOD_CLIENTE: TIntegerField;
    procedure cboTipoCalculoPropertiesChange(Sender: TObject);
    procedure actSelecionarTodosClientesExecute(Sender: TObject);
    procedure actSelecionarTodosDistribuidoresExecute(Sender: TObject);
    procedure actDesmarcarTodosDistribuidoresExecute(Sender: TObject);
    procedure actDesmarcarTodosClientesExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cboTipoExtratoPropertiesChange(Sender: TObject);
    procedure actgPesquisarClientesExecute(Sender: TObject);
    procedure actExcluirClienteExecute(Sender: TObject);
    procedure actPesquisarDistribuidoresExecute(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
    procedure actProcessarExecute(Sender: TObject);
    procedure actExcluirDistribuidoresExecute(Sender: TObject);
    procedure actExportarExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure actFecharExtratoExecute(Sender: TObject);
    procedure actSelecionarDistribuidoresFechadoExecute(Sender: TObject);
    procedure actDesmarcarTodosDistribuidoresFechadosExecute(Sender: TObject);
    procedure actPesquisaDistribuidoresFechadoExecute(Sender: TObject);
    procedure actEmitirExtratoExecute(Sender: TObject);
    procedure cboTipoExtratoFechadoPropertiesChange(Sender: TObject);
    procedure actExcluirDistribuicaoFechadoExecute(Sender: TObject);
  private
    { Private declarations }
    procedure ChangeTextDistribuidor(iAba: Integer);
    procedure SearchDistribuidor(iAba: Integer);
    procedure SearchCliente();
    procedure SearchEntregador(iAba: Integer);
    procedure CalcSLA();
    procedure AtribuiVerbaPeso();
    procedure CalcPeso();
    procedure CalcVerbaFixa();
    procedure SomaCreditos();
    procedure SomaDebitos();
    procedure SomaAbastecimento();
    procedure SomaRestricoes();
    procedure TotalizarExtrato();
    procedure ExportaExtrato();
    procedure SetupExtrato();
    procedure FecharExtrato();
    procedure ReabrirExtrato();
    procedure EmitirExtrato();
    procedure PopulaDatas();
    procedure PopulaClientes();
    function MontaFiltro(): String;
    function MontaFiltroFechado(): String;
    function ValidaExtrato(): Boolean;
  public
    { Public declarations }
  end;

var
  frmExtratoExpressa : TfrmExtratoExpressa;
  cliente : TCliente;
  agente : TAgente;
  entregador : TCodigosEntregadores;
  entrega : TEntrega;
  verba : TGruposVerba;
  lancamentos : TLancamentos;
  restricao : TRestricoes;
  abastecimento : TAbastecimentos;
  extrato: TExtratoExpressas;
  extratos: TObjectList<TExtratoExpressas>;
  extratosDAO: TExtratoExpressasDAO;
  spAgentes: String;
implementation

{$R *.dfm}

uses udm, uGlobais, ufrmPesquisarPessoas, ufrmProcesso, clUtil, ufrmData;

procedure TfrmExtratoExpressa.actDesmarcarTodosClientesExecute(Sender: TObject);
begin
  lbClientes.ClearSelection;
end;

procedure TfrmExtratoExpressa.actDesmarcarTodosDistribuidoresExecute(Sender: TObject);
begin
  lbDistribuidores.ClearSelection;
end;

procedure TfrmExtratoExpressa.actDesmarcarTodosDistribuidoresFechadosExecute(Sender: TObject);
begin
  lbDistribuidoresFechado.ClearSelection;
end;

procedure TfrmExtratoExpressa.actEmitirExtratoExecute(Sender: TObject);
begin
  if cboDatas.ItemIndex = 0 then
  begin
    Application.MessageBox('Selecione uma data de Pagamento!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if Application.MessageBox('Confirma a emissão deste extrato?', PChar('Atenção ' + uGlobais.sUsuario), MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  EmitirExtrato();
end;

procedure TfrmExtratoExpressa.actExcluirClienteExecute(Sender: TObject);
begin
  lbClientes.DeleteSelected;
end;

procedure TfrmExtratoExpressa.actExcluirDistribuicaoFechadoExecute(Sender: TObject);
begin
  lbDistribuidoresFechado.DeleteSelected;
end;

procedure TfrmExtratoExpressa.actExcluirDistribuidoresExecute(Sender: TObject);
begin
  lbDistribuidores.DeleteSelected;
end;

procedure TfrmExtratoExpressa.actExportarExecute(Sender: TObject);
begin
  ExportaExtrato();
end;

procedure TfrmExtratoExpressa.actFecharExecute(Sender: TObject);
begin
  Perform(WM_CLOSE, 0, 0);
end;

procedure TfrmExtratoExpressa.actFecharExtratoExecute(Sender: TObject);
begin
  if tbExtrato.IsEmpty then
  begin
    Exit;
  end;
  if not tbExtratoNUM_EXTRATO.AsString.IsEmpty then
  begin
    Exit;
  end;
  if Application.MessageBox('Confirma o Fechamento deste extrato?', PChar('Atenção ' + uGlobais.sUsuario), MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  FecharExtrato();
end;

procedure TfrmExtratoExpressa.actgPesquisarClientesExecute(Sender: TObject);
begin
  SearchCliente();
end;

procedure TfrmExtratoExpressa.actPesquisaDistribuidoresFechadoExecute(Sender: TObject);
begin
  if cboTipoExtratoFechado.ItemIndex = 0 then
  begin
    SearchDistribuidor(1);
  end
  else if cboTipoExtratoFechado.ItemIndex = 1 then
  begin
    SearchEntregador(1);
  end;
end;

procedure TfrmExtratoExpressa.actPesquisarDistribuidoresExecute(Sender: TObject);
begin
  if cboTipoExtrato.ItemIndex = 0 then
  begin
    SearchDistribuidor(0);
  end
  else if cboTipoExtrato.ItemIndex = 1 then
  begin
    SearchEntregador(0);
  end;
end;

procedure TfrmExtratoExpressa.actProcessarExecute(Sender: TObject);
var
  sMensagem: String;
begin
  if not ValidaExtrato() then
  begin
    Exit;
  end;
  if Application.MessageBox('Confirma a emissão deste extrato?', PChar('Atenção ' + uGlobais.sUsuario), MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  if cboTipoCalculo.ItemIndex = 0 then
  begin
    CalcSLA();
  end
  else if cboTipoCalculo.ItemIndex = 1 then
  begin
    if chkAtribuirVerbas.Checked then
    begin
      sMensagem := 'O processo de Atribuição de Verbas pode demorar pois todas as entregas do período serão analisadas. Confirma o processo?';
      if Application.MessageBox(PChar(sMensagem), PChar('Atenção ' + uGlobais.sUsuario), MB_YESNO + MB_ICONQUESTION) = IDNO then
      begin
        Exit;
      end;
      AtribuiVerbaPeso();
    end;
    CalcPeso();
  end
  else if cboTipoCalculo.ItemIndex = 2 then
  begin
    CalcVerbaFixa();
  end;
  if chkLancamentos.Checked then
  begin
    SomaCreditos();
    SomaDebitos();
  end;
  if chkAbastecimento.Checked then
  begin
    SomaAbastecimento();
  end;
  if chkRestricoes.Checked then
  begin
    SomaRestricoes();
  end;
  TotalizarExtrato();
end;

procedure TfrmExtratoExpressa.actSelecionarDistribuidoresFechadoExecute(Sender: TObject);
begin
  lbDistribuidoresFechado.SelectAll;
end;

procedure TfrmExtratoExpressa.actSelecionarTodosClientesExecute(Sender: TObject);
begin
  lbClientes.SelectAll;
end;

procedure TfrmExtratoExpressa.actSelecionarTodosDistribuidoresExecute(Sender: TObject);
begin
  lbDistribuidores.SelectAll;
end;

procedure TfrmExtratoExpressa.cboTipoCalculoPropertiesChange(Sender: TObject);
begin
  lciVerbaFixa.Visible := (cboTipoCalculo.Text = 'VERBA FIXA');
  cliAtribuirVerbas.Visible := (cboTipoCalculo.Text = 'FAIXAS DE PESO X CEP');
  tvExtratoVAL_PERCENTUAL_ENTREGADOR.Visible := (cboTipoCalculo.Text = 'SLA');
  tvExtratoVAL_PENALIDADE_ATRASOS.Visible := (cboTipoCalculo.Text <> 'SLA');
  tvExtratoQTD_VOLUMES_EXTRA.Visible := (cboTipoCalculo.Text = 'SLA');
  tvExtratoVAL_VOLUMES_EXTRA.Visible := (cboTipoCalculo.Text = 'SLA');
  if cboTipoCalculo.Text = 'FAIXAS DE PESO X CEP' then
  begin
    tvExtratoVAL_VERBA.Caption := 'Verba Média';
  end
  else
  begin
    tvExtratoVAL_VERBA.Caption := 'Valor da Verba';
  end;
  tbExtrato.Close;
  tbExtrato.Open;
end;

procedure TfrmExtratoExpressa.cboTipoExtratoFechadoPropertiesChange(Sender: TObject);
begin
  ChangeTextDistribuidor(1);
end;

procedure TfrmExtratoExpressa.cboTipoExtratoPropertiesChange(Sender: TObject);
begin
  ChangeTextDistribuidor(0);
end;

procedure TfrmExtratoExpressa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tbExtrato.Close;
  tbClientes.Close;
  extrato.Free;
  Action := caFree;
  frmExtratoExpressa := Nil;
end;

procedure TfrmExtratoExpressa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then
  begin
    if grdExtrato.IsFocused then
    begin
      Exit;
    end;
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfrmExtratoExpressa.FormShow(Sender: TObject);
begin
  extrato:= TExtratoExpressas.Create();
  ChangeTextDistribuidor(0);
  PopulaDatas();
  PopulaClientes();
end;

procedure TfrmExtratoExpressa.ChangeTextDistribuidor(iAba: Integer);
begin
  if iAba = 0 then
  begin
    lciDistribuidores.CaptionOptions.Text := cboTipoExtrato.Text;
  end
  else
  if iAba = 1 then
  begin
    lciDistribuidoresFechado.CaptionOptions.Text := cboTipoExtratoFechado.Text;
  end;
end;

procedure TfrmExtratoExpressa.SearchCliente();
var
  i,x,y : Integer;
  sItem: String;
begin
  try
    if dm.qryClientes.Active then
    begin
      dm.qryClientes.Close;
    end;
    x := 0;
    sItem := '';
    if not Assigned(frmPesquisarPessoas) then
    begin
      frmPesquisarPessoas := TfrmPesquisarPessoas.Create(Application);
    end;
    frmPesquisarPessoas.Caption := frmPesquisarPessoas.Caption + ' de Clientes';
    frmPesquisarPessoas.cboCampo.Clear;
    for i := 0 to dm.qryClientes.FieldCount - 1 do
    begin
      frmPesquisarPessoas.tvPesquisa.ClearItems;
      if dm.qryClientes.Fields[i].Tag = 1 then
      begin
        x := frmPesquisarPessoas.cboCampo.Properties.Items.Add(Trim(dm.qryClientes.Fields[i].DisplayLabel));
        frmPesquisarPessoas.lListaCampos.Add(Trim(dm.qryClientes.Fields[i].FieldName));
      end;
      frmPesquisarPessoas.cboCampo.ItemIndex := 1;
    end;
    frmPesquisarPessoas.qryPesquisa.SQL.Text := 'SELECT * FROM tbclientes';
    if frmPesquisarPessoas.ShowModal = mrOk then
    begin
      for y := 0 to frmPesquisarPessoas.tvPesquisa.Controller.SelectedRowCount - 1 do
      begin
        sItem := frmPesquisarPessoas.tvPesquisa.Controller.SelectedRows[y].DisplayTexts[0] + '-' +
                 frmPesquisarPessoas.tvPesquisa.Controller.SelectedRows[y].DisplayTexts[1];
        lbClientes.Items.Add(sItem);
      end;
    end;
  finally
    frmPesquisarPessoas.qryPesquisa.Close;
    frmPesquisarPessoas.qryPesquisa.SQL.Clear;
    FreeAndNil(frmPesquisarPessoas);
  end;
end;

procedure TfrmExtratoExpressa.SearchDisTribuidor(iAba: Integer);
var
  i,x,y : Integer;
  sItem: String;
begin
  try
    x := 0;
    sItem := '';
    if not Assigned(frmPesquisarPessoas) then
    begin
      frmPesquisarPessoas := TfrmPesquisarPessoas.Create(Application);
    end;
    frmPesquisarPessoas.Caption := frmPesquisarPessoas.Caption + ' de Distribuidores';
    frmPesquisarPessoas.cboCampo.Clear;
    for i := 0 to dm.qryAgentes.FieldCount - 1 do
    begin
      frmPesquisarPessoas.tvPesquisa.ClearItems;
      if dm.qryAgentes.Fields[i].Tag = 1 then
      begin
        x := frmPesquisarPessoas.cboCampo.Properties.Items.Add(Trim(dm.qryAgentes.Fields[i].DisplayLabel));
        frmPesquisarPessoas.lListaCampos.Add(Trim(dm.qryAgentes.Fields[i].FieldName));
      end;
      frmPesquisarPessoas.cboCampo.ItemIndex := 2;
    end;
    frmPesquisarPessoas.qryPesquisa.SQL.Text := 'SELECT COD_AGENTE, DES_RAZAO_SOCIAL, NOM_FANTASIA, NUM_CNPJ FROM tbagentes';
    if frmPesquisarPessoas.ShowModal = mrOk then
    begin
      for y := 0 to frmPesquisarPessoas.tvPesquisa.Controller.SelectedRowCount - 1 do
      begin
        sItem := frmPesquisarPessoas.tvPesquisa.Controller.SelectedRows[y].DisplayTexts[0] + '-' +
                 frmPesquisarPessoas.tvPesquisa.Controller.SelectedRows[y].DisplayTexts[1];
        if iAba = 0 then
        begin
          lbDistribuidores.Items.Add(sItem);
        end
        else if iAba = 1 then

        begin
          lbDistribuidoresFechado.Items.Add(sItem);
        end;
      end;
    end;
  finally
    frmPesquisarPessoas.qryPesquisa.Close;
    frmPesquisarPessoas.qryPesquisa.SQL.Clear;
    FreeAndNil(frmPesquisarPessoas);
  end;
end;

procedure TfrmExtratoExpressa.SearchEntregador(iAba: Integer);
var
  i,x,y : Integer;
  sItem: String;
begin
  try
    x := 0;
    sItem := '';
    if not Assigned(frmPesquisarPessoas) then
    begin
      frmPesquisarPessoas := TfrmPesquisarPessoas.Create(Application);
    end;
    frmPesquisarPessoas.Caption := frmPesquisarPessoas.Caption + ' de Entregadores';
    frmPesquisarPessoas.cboCampo.Clear;
    for i := 0 to dm.qryCodigosEntregadores.FieldCount - 1 do
    begin
      frmPesquisarPessoas.tvPesquisa.ClearItems;
      if dm.qryCodigosEntregadores.Fields[i].Tag = 1 then
      begin
        x := frmPesquisarPessoas.cboCampo.Properties.Items.Add(Trim(dm.qryCodigosEntregadores.Fields[i].DisplayLabel));
        frmPesquisarPessoas.lListaCampos.Add(Trim(dm.qryCodigosEntregadores.Fields[i].FieldName));
      end;
      frmPesquisarPessoas.cboCampo.ItemIndex := 2;
    end;
    frmPesquisarPessoas.qryPesquisa.SQL.Text := 'SELECT COD_CADASTRO, COD_ENTREGADOR, NOM_FANTASIA FROM tbcodigosentregadores ';
    if frmPesquisarPessoas.ShowModal = mrOk then
    begin
      for y := 0 to frmPesquisarPessoas.tvPesquisa.Controller.SelectedRowCount - 1 do
      begin
        sItem := frmPesquisarPessoas.tvPesquisa.Controller.SelectedRows[y].DisplayTexts[1] + '-' +
                 frmPesquisarPessoas.tvPesquisa.Controller.SelectedRows[y].DisplayTexts[2];
        if iAba = 0 then
        begin
          lbDistribuidores.Items.Add(sItem);
        end
        else if iAba = 1 then
        begin
          lbDistribuidoresFechado.Items.Add(sItem);
        end;
      end;
    end;
  finally
    frmPesquisarPessoas.qryPesquisa.Close;
    frmPesquisarPessoas.qryPesquisa.SQL.Clear;
    FreeAndNil(frmPesquisarPessoas);
  end;
end;

procedure TfrmExtratoExpressa.CalcSLA();
var
  sFiltro : String;
  iCadastro: Integer;
  dPercentual: Double;
  iGrupo: Integer;
  dVerba, dPosicao: Double;
  iContador: Integer;
  iRecords: Integer;
begin
  sFiltro := '';
  try
    sFiltro := MontaFiltro();
    if sFiltro.isEmpty then
    begin
      Exit;
    end;
    if tbExtrato.Active then
    begin
      tbExtrato.Close;
    end;
    tbExtrato.Open;
    if not Assigned(frmProcesso) then
    begin
      frmProcesso := TfrmProcesso.Create(Application);
    end;
    entregador := TCodigosEntregadores.Create();
    entrega := TEntrega.Create();
    verba := TGruposVerba.Create();
    agente := TAgente.Create();
    if entrega.ConsolidarEntregas(sFiltro) then
    begin
      iRecords := dm.qryCalculo.RecordCount;
      iContador := 0;
      frmProcesso.cxGroupBox1.Caption := 'Dados dos Distribuidores e Entregadores. Aguarde...';
      frmProcesso.cxGroupBox1.Refresh;
      frmProcesso.cxProgressBar1.Position := 0;
      frmProcesso.Show;
      while not dm.qryCalculo.Eof do
      begin
        iGrupo := 0;
        dVerba := 0;
        tbExtrato.Insert;
        tbExtratoCOD_TIPO.AsInteger := cboTipoCalculo.ItemIndex;
        tbExtratoCOD_DISTRIBUIDOR.AsInteger := dm.qryCalculo.FieldByName('COD_DISTRIBUIDOR').AsInteger;
        agente.Codigo := dm.qryCalculo.FieldByName('COD_DISTRIBUIDOR').AsString;
        tbExtratoNOM_DISTRIBUIDOR.AsString := agente.getField('NOM_FANTASIA','CODIGO');
        iGrupo := StrToIntDef(agente.getField('COD_GRUPO','CODIGO'),0);
        dVerba := StrToFloatDef(agente.getField('VAL_VERBA','CODIGO'),0);
        if dVerba > 0 then
        begin
          iGrupo := 0;
        end;
        entregador.Codigo := dm.qryCalculo.FieldByName('COD_ENTREGADOR').AsInteger;
        iCadastro := StrToIntDef(entregador.getField('COD_CADASTRO','CODIGO'),0);
        if StrToIntDef(entregador.getField('COD_GRUPO','CODIGO'),0) > 0 then
        begin
          iGrupo := StrToIntDef(entregador.getField('COD_GRUPO','CODIGO'),0);
        end;
        if StrToFloatDef(entregador.getField('VAL_VERBA','CODIGO'),0) > 0 then
        begin
          dVerba := StrToFloatDef(entregador.getField('VAL_VERBA','CODIGO'),0);
        end;
        if dVerba > 0 then
        begin
          iGrupo := 0;
        end;
        tbExtratoCOD_ENTREGADOR.AsInteger := dm.qryCalculo.FieldByName('COD_ENTREGADOR').AsInteger;
        tbExtratoNOM_ENTREGADOR.AsString := entregador.getField('NOM_FANTASIA','CODIGO');
        tbExtratoCOD_CADASTRO.AsInteger := iCadastro;
        tbExtratoQTD_VOLUMES.AsInteger := dm.qryCalculo.FieldByName('QTD_VOLUMES').AsInteger;
        tbExtratoQTD_ENTREGA.AsInteger := dm.qryCalculo.FieldByName('QTD_ENTREGA').AsInteger;
        tbExtratoQTD_VOLUMES_EXTRA.AsFloat := dm.qryCalculo.FieldByName('QTD_VOLUMES_EXTRA').AsFloat;
        tbExtratoQTD_ATRASOS.AsInteger := dm.qryCalculo.FieldByName('QTD_ATRASOS').AsInteger;
        tbExtratoVAL_PERCENTUAL_DISTRIBUIDOR.AsFloat := 0;
        dPercentual := 100 - ((dm.qryCalculo.FieldByName('QTD_ATRASOS').AsInteger / dm.qryCalculo.FieldByName('QTD_ENTREGA').AsInteger) * 100);
        if dVerba = 0 then
        begin
          if verba.RetornaVerba(IntToStr(iGrupo),dPercentual) then
          begin
            dVerba := verba.Verba;
            dPercentual := verba.Percentual;
          end
        end;
        tbExtratoVAL_PERCENTUAL_ENTREGADOR.AsFloat := dPercentual;
        tbExtratoVAL_VERBA.AsFloat := dVerba;
        tbExtratoVAL_CREDITO.AsFloat := 0;
        tbExtratoVAL_DEBITO.AsFloat := 0;
        tbExtratoVAL_RESTRICAO.AsFloat := 0;
        tbExtratoVAL_PENALIDADE_ATRASOS.AsFloat := 0;
        tbExtratoVAL_ABASTECIMENTO.AsFloat := 0;
        tbExtratoVAL_TOTAL_DEBITOS.AsFloat := 0;
        tbExtratoVAL_TOTAL_CREDITOS.AsFloat := 0;
        tbExtratoVAL_TOTAL_GERAL.AsFloat := 0;
        tbExtratoDAT_INICIO.AsDateTime := datinicioExtrato.Date;
        tbExtratoDAT_TERMINO.AsDateTime := datFinalExtrato.Date;
        tbExtratoVAL_VERBA_TOTAL.AsFloat := dVerba * dm.qryCalculo.FieldByName('QTD_ENTREGA').AsInteger;
        tbExtratoVAL_VOLUMES_EXTRA.AsFloat := dVerba * dm.qryCalculo.FieldByName('QTD_VOLUMES_EXTRA').AsFloat;
        tbExtratoNUM_EXTRATO.AsString := '';
        dPosicao := (iContador / iRecords) * 100;
        Inc(iContador,1);
        frmProcesso.cxProgressBar1.Position := dPosicao;
        frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
        frmProcesso.cxProgressBar1.Refresh;
        tbExtrato.Post;
        dm.qryCalculo.Next;
      end;
    end
    else
    begin
      Application.MessageBox('Nenhuma entrega encontrado no período e condições informados!',
                             PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
  finally
    FreeAndNil(frmProcesso);
    if tbExtrato.IsEmpty then
    begin
      tbExtrato.Close;
    end
    else
    begin
      tbExtrato.First;
      tvExtrato.ViewData.Expand(True);
    end;
    dm.qryCalculo.Close;
    dm.qryCalculo.SQL.Clear;
    entrega.Free;
    verba.Free;
    agente.Free;
    entregador.Free;
  end;
end;

function TfrmExtratoExpressa.MontaFiltro(): String;
var
  sFiltro, sCampoPeriodo, sClientes, sCodigos : String;
  i: Integer;
  bFlagClientes : Boolean;
begin
  Result := '';
  sFiltro := '';
  sCampoPeriodo := '';
  sClientes := '';
  bFlagClientes := False;
  if cboTipoPeriodo.ItemIndex = 0 then
  begin
    sCampoPeriodo := 'DAT_BAIXA';
  end
  else if cboTipoPeriodo.ItemIndex = 1 then
  begin
    sCampoPeriodo := 'DAT_ENTREGA';
  end
  else if cboTipoPeriodo.ItemIndex = 2 then
  begin
    sCampoPeriodo := 'DAT_ATRIBUICAO';
  end;
  if sCampoPeriodo.IsEmpty then
  begin
    Exit;
  end;
  if sFiltro.IsEmpty then
  begin
    sFiltro := sFiltro + 'WHERE ';
  end;
  sFiltro := sFiltro + sCampoPeriodo + ' BETWEEN ' + QuotedStr(FormatDateTime('yyyy-mm-dd', datinicioExtrato.Date)) + ' AND ' +
             QuotedStr(FormatDateTime('yyyy-mm-dd', datFinalExtrato.Date));
  if lbClientes.Count > 0 then
  begin
    for i := 0 to lbClientes.Items.Count - 1 do
    begin
      if not sClientes.IsEmpty then
      begin
        sClientes := sClientes + ',';
      end;
      sClientes := sClientes + Copy(lbClientes.Items[i], 1, Pos('-', lbClientes.Items[i]) - 1);
    end;
    if not sClientes.IsEmpty then
    begin
      sFiltro := sFiltro + ' AND COD_CLIENTE IN (' + sClientes + ')';
    end
    else
    begin
      sFiltro := sFiltro + ' AND COD_CLIENTE <> 2 ';
    end;
    bFlagClientes := True;
  end;
  spAgentes := '';
  if lbDistribuidores.Count > 0 then
  begin
    for i := 0 to lbDistribuidores.Items.Count - 1 do
    begin
      if not sCodigos.IsEmpty then
      begin
        sCodigos := sCodigos + ',';
      end;
      sCodigos := sCodigos + Copy(lbDistribuidores.Items[i], 1, Pos('-', lbDistribuidores.Items[i]) - 1);
      spAgentes := sCodigos;
    end;
    if cboTipoExtrato.ItemIndex = 0 then
    begin
      if not sCodigos.IsEmpty then
      begin
        sFiltro := sFiltro + ' AND COD_AGENTE IN (' + sCodigos + ')';
      end;
    end
    else
    begin
      if not sCodigos.IsEmpty then
      begin
        sFiltro := sFiltro + ' AND COD_ENTREGADOR IN (' + sCodigos + ')';
      end;
    end;
  end;
  sFiltro := sFiltro + ' AND DOM_BAIXADO = ' + QuotedStr('S') + ' AND DOM_FECHADO <> ' + QuotedStr('S');
  if bFlagClientes then
  begin
    sFiltro := sFiltro + ' GROUP BY COD_CLIENTE, COD_ENTREGADOR';
    tvExtratoCOD_CLIENTE.Visible := True;
  end
  else
  begin
    sFiltro := sFiltro + ' GROUP BY COD_ENTREGADOR';
    tvExtratoCOD_CLIENTE.Visible := False;
  end;
  Result := sFiltro;
end;

procedure TfrmExtratoExpressa.SomaCreditos();
var
  iRecords : Integer;
  iContador : Integer;
  dCredito, dPosicao : Double;
  iCadastro: Integer;
  sAgente: string;
  bIncluir: Boolean;
begin
  if not tbExtrato.Active then
  begin
    Exit;
  end;
  try
    lancamentos := TLancamentos.Create();
    entregador := TCodigosEntregadores.Create();
    agente := TAgente.Create();
    if lancamentos.EncontraLancamentos(datFinalExtrato.Text,'CREDITO') then
    begin
      if not Assigned(frmProcesso) then
      begin
        frmProcesso := TfrmProcesso.Create(Application);
      end;
      iRecords := dm.qryPesquisa.RecordCount;
      iContador := 0;
      frmProcesso.cxGroupBox1.Caption := 'Calculando os Lancamentos de Créditos. Aguarde...';
      frmProcesso.cxGroupBox1.Refresh;
      frmProcesso.cxProgressBar1.Position := 0;
      frmProcesso.Show;
      dCredito := 0;
      while not dm.qryPesquisa.Eof do
      begin
        if tbExtrato.Locate('COD_CADASTRO',dm.qryPesquisa.FieldByName('COD_ENTREGADOR').AsInteger,[]) then
        begin
          dCredito := tbExtratoVAL_CREDITO.AsFloat;
          dCredito := dCredito + dm.qryPesquisa.FieldByName('VAL_LANCAMENTO').AsFloat;
          tbExtrato.Edit;
          tbExtratoVAL_CREDITO.AsFloat := dCredito;
          tbExtrato.Post;
        end
        else
        begin
          iCadastro := dm.qryPesquisa.FieldByName('COD_ENTREGADOR').AsInteger;
          entregador.Cadastro := iCadastro;
          sAgente := entregador.getField('COD_AGENTE','CADASTRO');
          if not spAgentes.IsEmpty then
          begin
            if Pos(sAgente,spAgentes) > 0 then
            begin
              bIncluir := True;
            end;
          end
          else
          begin
            bIncluir := True;
          end;
          if bIncluir then
          begin
            tbExtrato.Insert;
            tbExtratoCOD_TIPO.AsInteger := 0;
            tbExtratoCOD_ENTREGADOR.AsInteger := StrToIntDef(entregador.getField('COD_ENTREGADOR','CADASTRO'),0);
            tbExtratoNOM_ENTREGADOR.AsString := entregador.getField('NOM_FANTASIA','CADASTRO');
            tbExtratoCOD_DISTRIBUIDOR.AsInteger := StrToIntDef(entregador.getField('COD_AGENTE','CADASTRO'),0);
            agente.Codigo := entregador.getField('COD_AGENTE','CADASTRO');
            if TUtil.Empty(agente.Codigo) then
            begin
              agente.Codigo := '0';
            end;
            tbExtratoNOM_DISTRIBUIDOR.AsString := agente.getField('NOM_FANTASIA','CODIGO');
            tbExtratoCOD_CADASTRO.AsInteger := iCadastro;
            tbExtratoQTD_VOLUMES.AsInteger := 0;
            tbExtratoQTD_ENTREGA.AsInteger := 0;
            tbExtratoQTD_VOLUMES_EXTRA.AsFloat := 0;
            tbExtratoQTD_ATRASOS.AsInteger := 0;
            tbExtratoVAL_PERCENTUAL_DISTRIBUIDOR.AsFloat := 0;
            tbExtratoVAL_PERCENTUAL_ENTREGADOR.AsFloat := 0;
            tbExtratoVAL_VERBA.AsFloat := 0;
            tbExtratoVAL_CREDITO.AsFloat := dm.qryPesquisa.FieldByName('VAL_LANCAMENTO').AsFloat;
            tbExtratoVAL_DEBITO.AsFloat := 0;
            tbExtratoVAL_RESTRICAO.AsFloat := 0;
            tbExtratoVAL_PENALIDADE_ATRASOS.AsFloat := 0;
            tbExtratoVAL_ABASTECIMENTO.AsFloat := 0;
            tbExtratoVAL_TOTAL_DEBITOS.AsFloat := 0;
            tbExtratoVAL_TOTAL_CREDITOS.AsFloat := 0;
            tbExtratoVAL_TOTAL_GERAL.AsFloat := 0;
            tbExtratoDAT_INICIO.AsDateTime := datinicioExtrato.Date;
            tbExtratoDAT_TERMINO.AsDateTime := datFinalExtrato.Date;
            tbExtratoVAL_VERBA_TOTAL.AsFloat := 0;
            tbExtratoVAL_VOLUMES_EXTRA.AsFloat := 0;
            tbExtrato.Post;
          end;
        end;
        dPosicao := (iContador / iRecords) * 100;
        Inc(iContador,1);
        frmProcesso.cxProgressBar1.Position := dPosicao;
        frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
        frmProcesso.cxProgressBar1.Refresh;
        bIncluir := False;
        dm.qryPesquisa.Next;
      end;
    end;
  finally
    FreeAndNil(frmProcesso);
    tvExtrato.ViewData.Expand(True);
    dm.qryPesquisa.Close;
    dm.qryPesquisa.SQL.Clear;
    lancamentos.Free;
    agente.Free;
    entregador.Free;
  end;
end;

function TfrmExtratoExpressa.ValidaExtrato(): Boolean;
begin
  Result := False;
  if TUtil.Empty(datinicioExtrato.Text) then
  begin
    Application.MessageBox('Informe a data inicial do período!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
    datinicioExtrato.SetFocus;
    Exit;
  end;
  if TUtil.Empty(datFinalExtrato.Text) then
  begin
    Application.MessageBox('Informe a data final do período!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
    datFinalExtrato.SetFocus;
    Exit;
  end;
  if datFinalExtrato.Date < datinicioExtrato.Date then
  begin
    Application.MessageBox('A data final não poe seer menor que a data inicial do período!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
    datFinalExtrato.SetFocus;
    Exit;
  end;
  if cboTipoCalculo.ItemIndex = 2 then
  begin
    if curValorVerba.Value = 0 then
    begin
      Application.MessageBox('Informe o Valor da Verba Fixa!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
      curValorVerba.SetFocus;
      Exit;
    end;
  end;
  Result := True;
end;

procedure TfrmExtratoExpressa.SomaDebitos();
var
  iRecords : Integer;
  iContador : Integer;
  dDebito, dPosicao : Double;
  iCadastro: Integer;
  sAgente: string;
  bIncluir: Boolean;
begin
  if not tbExtrato.Active then
  begin
    Exit;
  end;
  try
    lancamentos := TLancamentos.Create();
    entregador := TCodigosEntregadores.Create();
    agente := TAgente.Create();
    if lancamentos.EncontraLancamentos(datFinalExtrato.Text,'DEBITO') then
    begin
      if not Assigned(frmProcesso) then
      begin
        frmProcesso := TfrmProcesso.Create(Application);
      end;
      iRecords := dm.qryPesquisa.RecordCount;
      iContador := 0;
      frmProcesso.cxGroupBox1.Caption := 'Calculando os Lançamentos de Débitos. Aguarde...';
      frmProcesso.cxGroupBox1.Refresh;
      frmProcesso.cxProgressBar1.Position := 0;
      frmProcesso.Show;
      dDebito := 0;
      while not dm.qryPesquisa.Eof do
      begin
        if tbExtrato.Locate('COD_CADASTRO',dm.qryPesquisa.FieldByName('COD_ENTREGADOR').AsInteger,[]) then
        begin
          if not Assigned(frmProcesso) then
          begin
            frmProcesso := TfrmProcesso.Create(Application);
          end;
          dDebito := tbExtratoVAL_DEBITO.AsFloat;
          dDebito := dDebito + (0 - dm.qryPesquisa.FieldByName('VAL_LANCAMENTO').AsFloat);
          tbExtrato.Edit;
          tbExtratoVAL_DEBITO.AsFloat := dDebito;
          tbExtrato.Post;
        end
        else
        begin
          iCadastro := dm.qryPesquisa.FieldByName('COD_ENTREGADOR').AsInteger;
          entregador.Cadastro := iCadastro;
          sAgente := entregador.getField('COD_AGENTE','CADASTRO');
          if not spAgentes.IsEmpty then
          begin
            if Pos(sAgente,spAgentes) > 0 then
            begin
              bIncluir := True;
            end;
          end
          else
          begin
            bIncluir := True;
          end;
          if bIncluir then
          begin
            tbExtrato.Insert;
            tbExtratoCOD_TIPO.AsInteger := 0;
            iCadastro := dm.qryPesquisa.FieldByName('COD_ENTREGADOR').AsInteger;
            entregador.Cadastro := iCadastro;
            tbExtratoCOD_ENTREGADOR.AsInteger := StrToIntDef(entregador.getField('COD_ENTREGADOR','CADASTRO'),0);
            tbExtratoNOM_ENTREGADOR.AsString := entregador.getField('NOM_FANTASIA','CADASTRO');
            tbExtratoCOD_DISTRIBUIDOR.AsInteger := StrToIntDef(entregador.getField('COD_AGENTE','CADASTRO'),0);
            agente.Codigo := entregador.getField('COD_AGENTE','CADASTRO');
            if TUtil.Empty(agente.Codigo) then
            begin
              agente.Codigo := '0';
            end;
            tbExtratoNOM_DISTRIBUIDOR.AsString := agente.getField('NOM_FANTASIA','CODIGO');
            tbExtratoCOD_CADASTRO.AsInteger := iCadastro;
            tbExtratoQTD_VOLUMES.AsInteger := 0;
            tbExtratoQTD_ENTREGA.AsInteger := 0;
            tbExtratoQTD_VOLUMES_EXTRA.AsFloat := 0;
            tbExtratoQTD_ATRASOS.AsInteger := 0;
            tbExtratoVAL_PERCENTUAL_DISTRIBUIDOR.AsFloat := 0;
            tbExtratoVAL_PERCENTUAL_ENTREGADOR.AsFloat := 0;
            tbExtratoVAL_VERBA.AsFloat := 0;
            tbExtratoVAL_CREDITO.AsFloat := 0;
            tbExtratoVAL_DEBITO.AsFloat := 0 - dm.qryPesquisa.FieldByName('VAL_LANCAMENTO').AsFloat;
            tbExtratoVAL_RESTRICAO.AsFloat := 0;
            tbExtratoVAL_PENALIDADE_ATRASOS.AsFloat := 0;
            tbExtratoVAL_ABASTECIMENTO.AsFloat := 0;
            tbExtratoVAL_TOTAL_DEBITOS.AsFloat := 0;
            tbExtratoVAL_TOTAL_CREDITOS.AsFloat := 0;
            tbExtratoVAL_TOTAL_GERAL.AsFloat := 0;
            tbExtratoDAT_INICIO.AsDateTime := datinicioExtrato.Date;
            tbExtratoDAT_TERMINO.AsDateTime := datFinalExtrato.Date;
            tbExtratoVAL_VERBA_TOTAL.AsFloat := 0;
            tbExtratoVAL_VOLUMES_EXTRA.AsFloat := 0;
            tbExtrato.Post;
          end;
        end;
        dPosicao := (iContador / iRecords) * 100;
        Inc(iContador,1);
        frmProcesso.cxProgressBar1.Position := dPosicao;
        frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
        frmProcesso.cxProgressBar1.Refresh;
        bIncluir := False;
        dm.qryPesquisa.Next;
      end;
    end;
  finally
    FreeAndNil(frmProcesso);
    tvExtrato.ViewData.Expand(True);
    dm.qryPesquisa.Close;
    dm.qryPesquisa.SQL.Clear;
    lancamentos.Free;
    agente.Free;
    entregador.Free;
  end;
end;

procedure TfrmExtratoExpressa.SomaAbastecimento();
var
  iRecords : Integer;
  iContador : Integer;
  dDebito, dPosicao : Double;
  iCadastro: Integer;
  sAgente: string;
  bIncluir: Boolean;
begin
  if not tbExtrato.Active then
  begin
    Exit;
  end;
  try
    abastecimento := TAbastecimentos.Create();
    entregador := TCodigosEntregadores.Create();
    agente := TAgente.Create();
    if abastecimento.ConsolidaAbastecimentos(datinicioExtrato.TextHint,datFinalExtrato.Text) then
    begin
      if not Assigned(frmProcesso) then
      begin
        frmProcesso := TfrmProcesso.Create(Application);
      end;
      iRecords := dm.qryPesquisa.RecordCount;
      iContador := 0;
      frmProcesso.cxGroupBox1.Caption := 'Calculando os Débitos de Abastecimentos. Aguarde...';
      frmProcesso.cxGroupBox1.Refresh;
      frmProcesso.cxProgressBar1.Position := 0;
      frmProcesso.Show;
      dDebito := 0;
      while not dm.qryPesquisa.Eof do
      begin
        if tbExtrato.Locate('COD_CADASTRO',dm.qryPesquisa.FieldByName('COD_ENTREGADOR').AsInteger,[]) then
        begin
          if not Assigned(frmProcesso) then
          begin
            frmProcesso := TfrmProcesso.Create(Application);
          end;
          dDebito := tbExtratoVAL_ABASTECIMENTO.AsFloat;
          dDebito := dDebito + (0 - dm.qryPesquisa.FieldByName('VAL_TOTAL').AsFloat);
          tbExtrato.Edit;
          tbExtratoVAL_ABASTECIMENTO.AsFloat := dDebito;
          tbExtrato.Post;
        end
        else
        begin
          iCadastro := dm.qryPesquisa.FieldByName('COD_ENTREGADOR').AsInteger;
          entregador.Cadastro := iCadastro;
          sAgente := entregador.getField('COD_AGENTE','CADASTRO');
          if not spAgentes.IsEmpty then
          begin
            if Pos(sAgente,spAgentes) > 0 then
            begin
              bIncluir := True;
            end;
          end
          else
          begin
            bIncluir := True;
          end;
          if bIncluir then
          begin
            tbExtrato.Insert;
            tbExtratoCOD_TIPO.AsInteger := 0;
            iCadastro := dm.qryPesquisa.FieldByName('COD_ENTREGADOR').AsInteger;
            entregador.Cadastro := iCadastro;
            tbExtratoCOD_ENTREGADOR.AsInteger := StrToIntDef(entregador.getField('COD_ENTREGADOR','CADASTRO'),0);
            tbExtratoNOM_ENTREGADOR.AsString := entregador.getField('NOM_FANTASIA','CADASTRO');
            tbExtratoCOD_DISTRIBUIDOR.AsInteger := StrToIntDef(entregador.getField('COD_AGENTE','CADASTRO'),0);
            agente.Codigo := entregador.getField('COD_AGENTE','CADASTRO');
            if TUtil.Empty(agente.Codigo) then
            begin
              agente.Codigo := '0';
            end;
            tbExtratoNOM_DISTRIBUIDOR.AsString := agente.getField('NOM_FANTASIA','CODIGO');
            tbExtratoCOD_CADASTRO.AsInteger := iCadastro;
            tbExtratoQTD_VOLUMES.AsInteger := 0;
            tbExtratoQTD_ENTREGA.AsInteger := 0;
            tbExtratoQTD_VOLUMES_EXTRA.AsFloat := 0;
            tbExtratoQTD_ATRASOS.AsInteger := 0;
            tbExtratoVAL_PERCENTUAL_DISTRIBUIDOR.AsFloat := 0;
            tbExtratoVAL_PERCENTUAL_ENTREGADOR.AsFloat := 0;
            tbExtratoVAL_VERBA.AsFloat := 0;
            tbExtratoVAL_CREDITO.AsFloat := 0;
            tbExtratoVAL_DEBITO.AsFloat := 0;
            tbExtratoVAL_RESTRICAO.AsFloat := 0;
            tbExtratoVAL_PENALIDADE_ATRASOS.AsFloat := 0;
            tbExtratoVAL_ABASTECIMENTO.AsFloat := 0 - dm.qryPesquisa.FieldByName('VAL_TOTAL').AsFloat;
            tbExtratoVAL_TOTAL_DEBITOS.AsFloat := 0;
            tbExtratoVAL_TOTAL_CREDITOS.AsFloat := 0;
            tbExtratoVAL_TOTAL_GERAL.AsFloat := 0;
            tbExtratoDAT_INICIO.AsDateTime := datinicioExtrato.Date;
            tbExtratoDAT_TERMINO.AsDateTime := datFinalExtrato.Date;
            tbExtratoVAL_VERBA_TOTAL.AsFloat := 0;
            tbExtratoVAL_VOLUMES_EXTRA.AsFloat := 0;
            tbExtrato.Post;
          end;
        end;
        dPosicao := (iContador / iRecords) * 100;
        Inc(iContador,1);
        frmProcesso.cxProgressBar1.Position := dPosicao;
        frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
        frmProcesso.cxProgressBar1.Refresh;
        bIncluir := False;
        dm.qryPesquisa.Next;
      end;
    end;
  finally
    FreeAndNil(frmProcesso);
    tvExtrato.ViewData.Expand(True);
    dm.qryPesquisa.Close;
    dm.qryPesquisa.SQL.Clear;
    abastecimento.Free;
    agente.Free;
    entregador.Free;
  end;
end;

procedure TfrmExtratoExpressa.SomaRestricoes();
var
  iRecords : Integer;
  iContador : Integer;
  dDebito, dPosicao : Double;
  iCadastro: Integer;
begin
  if not tbExtrato.Active then
  begin
    Exit;
  end;
  try
    restricao := TRestricoes.Create();
    entregador := TCodigosEntregadores.Create();
    agente := TAgente.Create();
    if restricao.getObjects then
    begin
      if not Assigned(frmProcesso) then
      begin
        frmProcesso := TfrmProcesso.Create(Application);
      end;
      iRecords := dm.qryGeral.RecordCount;
      iContador := 0;
      frmProcesso.cxGroupBox1.Caption := 'Calculando os Débitos de Restrições. Aguarde...';
      frmProcesso.cxGroupBox1.Refresh;
      frmProcesso.cxProgressBar1.Position := 0;
      frmProcesso.Show;
      dDebito := 0;
      while not dm.qryGeral.Eof do
      begin
        if dm.qryGeral.FieldByName('VAL_DEBITAR').AsFloat <> 0 then
        begin
          if tbExtrato.Locate('COD_ENTREGADOR',dm.qryGeral.FieldByName('COD_ENTREGADOR').AsInteger,[]) then
          begin
            if not Assigned(frmProcesso) then
            begin
              frmProcesso := TfrmProcesso.Create(Application);
            end;
            dDebito := tbExtratoVAL_restricao.AsFloat;
            dDebito := dDebito + (0 - dm.qryGeral.FieldByName('VAL_DEBITAR').AsFloat);
            tbExtrato.Edit;
            tbExtratoVAL_RESTRICAO.AsFloat := dDebito;
            tbExtrato.Post;
          end
          else
          begin
            if lbDistribuidores.Items.Count = 0 then
            begin
              tbExtrato.Insert;
              tbExtratoCOD_TIPO.AsInteger := 0;
              entregador.Codigo := dm.qryGeral.FieldByName('COD_ENTREGADOR').AsInteger;
              iCadastro := entregador.Cadastro;
              tbExtratoCOD_ENTREGADOR.AsInteger := dm.qryGeral.FieldByName('COD_ENTREGADOR').AsInteger;
              tbExtratoNOM_ENTREGADOR.AsString := entregador.getField('NOM_FANTASIA','CODIGO');
              tbExtratoCOD_DISTRIBUIDOR.AsInteger := StrToIntDef(entregador.getField('COD_AGENTE','CODIGO'),0);
              agente.Codigo := entregador.getField('COD_AGENTE','CODIGO');
              if TUtil.Empty(agente.Codigo) then
              begin
                agente.Codigo := '0';
              end;
              tbExtratoNOM_DISTRIBUIDOR.AsString := agente.getField('NOM_FANTASIA','CODIGO');
              tbExtratoCOD_CADASTRO.AsInteger := iCadastro;
              tbExtratoQTD_VOLUMES.AsInteger := 0;
              tbExtratoQTD_ENTREGA.AsInteger := 0;
              tbExtratoQTD_VOLUMES_EXTRA.AsFloat := 0;
              tbExtratoQTD_ATRASOS.AsInteger := 0;
              tbExtratoVAL_PERCENTUAL_DISTRIBUIDOR.AsFloat := 0;
              tbExtratoVAL_PERCENTUAL_ENTREGADOR.AsFloat := 0;
              tbExtratoVAL_VERBA.AsFloat := 0;
              tbExtratoVAL_CREDITO.AsFloat := 0;
              tbExtratoVAL_DEBITO.AsFloat := 0;
              tbExtratoVAL_RESTRICAO.AsFloat := 0 - dm.qryGeral.FieldByName('VAL_DEBITAR').AsFloat;
              tbExtratoVAL_PENALIDADE_ATRASOS.AsFloat := 0;
              tbExtratoVAL_ABASTECIMENTO.AsFloat := 0;
              tbExtratoVAL_TOTAL_DEBITOS.AsFloat := 0;
              tbExtratoVAL_TOTAL_CREDITOS.AsFloat := 0;
              tbExtratoVAL_TOTAL_GERAL.AsFloat := 0;
              tbExtratoDAT_INICIO.AsDateTime := datinicioExtrato.Date;
              tbExtratoDAT_TERMINO.AsDateTime := datFinalExtrato.Date;
              tbExtratoVAL_VERBA_TOTAL.AsFloat := 0;
              tbExtratoVAL_VOLUMES_EXTRA.AsFloat := 0;
              tbExtrato.Post;
            end;
          end;
        end;
        dPosicao := (iContador / iRecords) * 100;
        Inc(iContador,1);
        frmProcesso.cxProgressBar1.Position := dPosicao;
        frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
        frmProcesso.cxProgressBar1.Refresh;
        dm.qryGeral.Next;
      end;
    end;
  finally
    FreeAndNil(frmProcesso);
    tvExtrato.ViewData.Expand(True);
    dm.qryGeral.Close;
    dm.qryGeral.SQL.Clear;
    restricao.Free;
    agente.Free;
    entregador.Free;
  end;
end;

procedure TfrmExtratoExpressa.TotalizarExtrato();
var
  dDebitos, dCreditos, dTotal, dPosicao: Double;
  iContador: Integer;
  iRecords: Integer;
begin
  try
    if not tbExtrato.Active then
    begin
      Exit;
    end;
    if tbExtrato.IsEmpty then
    begin
      Exit;
    end;
    if not Assigned(frmProcesso) then
    begin
      frmProcesso := TfrmProcesso.Create(Application);
    end;
    iRecords := tbExtrato.RecordCount;
    iContador := 0;
    frmProcesso.cxGroupBox1.Caption := 'Totalizando o Extrato. Aguarde...';
    frmProcesso.cxGroupBox1.Refresh;
    frmProcesso.cxProgressBar1.Position := 0;
    frmProcesso.Show;
    tbExtrato.First;
    while not tbExtrato.Eof do
    begin
      dCreditos := 0;
      dDebitos := 0;
      dTotal := 0;
      dCreditos := tbExtratoVAL_CREDITO.AsFloat + tbExtratoVAL_VERBA_TOTAL.AsFloat + tbExtratoVAL_VOLUMES_EXTRA.AsFloat;
      dDebitos := tbExtratoVAL_DEBITO.AsFloat + tbExtratoVAL_ABASTECIMENTO.AsFloat + tbExtratoVAL_RESTRICAO.AsFloat;
      dTotal := dCreditos + dDebitos;
      tbExtrato.Edit;
      tbExtratoVAL_TOTAL_CREDITOS.AsFloat := dCreditos;
      tbExtratoVAL_TOTAL_DEBITOS.AsFloat := dDebitos;
      tbExtratoVAL_TOTAL_GERAL.AsFloat := dTotal;
      tbExtrato.Post;
      dPosicao := (iContador / iRecords) * 100;
      Inc(iContador,1);
      frmProcesso.cxProgressBar1.Position := dPosicao;
      frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
      frmProcesso.cxProgressBar1.Refresh;
      tbExtrato.Next;
    end;
  finally
    FreeAndNil(frmProcesso);
    if not tbExtrato.IsEmpty then
    begin
      tbExtrato.First;
    end;
  end;
end;

procedure TfrmExtratoExpressa.CalcPeso();
var
  sFiltro : String;
  iCadastro: Integer;
  dPosicao: Double;
  iContador: Integer;
  iRecords: Integer;
begin
  sFiltro := '';
  try
    sFiltro := MontaFiltro();
    if sFiltro.isEmpty then
    begin
      Exit;
    end;
    if tbExtrato.Active then
    begin
      tbExtrato.Close;
    end;
    tbExtrato.Open;
    if not Assigned(frmProcesso) then
    begin
      frmProcesso := TfrmProcesso.Create(Application);
    end;
    entregador := TCodigosEntregadores.Create();
    entrega := TEntrega.Create();
    agente := TAgente.Create();
    if entrega.ConsolidarEntregas(sFiltro) then
    begin
      iRecords := dm.qryCalculo.RecordCount;
      iContador := 0;
      frmProcesso.cxGroupBox1.Caption := 'Dados dos Distribuidores e Entregadores. Aguarde...';
      frmProcesso.cxGroupBox1.Refresh;
      frmProcesso.cxProgressBar1.Position := 0;
      frmProcesso.Show;
      while not dm.qryCalculo.Eof do
      begin
        tbExtrato.Insert;
        tbExtratoCOD_TIPO.AsInteger := cboTipoCalculo.ItemIndex;
        tbExtratoCOD_DISTRIBUIDOR.AsInteger := dm.qryCalculo.FieldByName('COD_DISTRIBUIDOR').AsInteger;
        agente.Codigo := dm.qryCalculo.FieldByName('COD_DISTRIBUIDOR').AsString;
        tbExtratoNOM_DISTRIBUIDOR.AsString := agente.getField('NOM_FANTASIA','CODIGO');
        entregador.Codigo := dm.qryCalculo.FieldByName('COD_ENTREGADOR').AsInteger;
        iCadastro := StrToIntDef(entregador.getField('COD_CADASTRO','CODIGO'),0);
        tbExtratoCOD_ENTREGADOR.AsInteger := dm.qryCalculo.FieldByName('COD_ENTREGADOR').AsInteger;
        tbExtratoNOM_ENTREGADOR.AsString := entregador.getField('NOM_FANTASIA','CODIGO');
        tbExtratoCOD_CADASTRO.AsInteger := iCadastro;
        tbExtratoQTD_VOLUMES.AsInteger := dm.qryCalculo.FieldByName('QTD_VOLUMES').AsInteger;
        tbExtratoQTD_ENTREGA.AsInteger := dm.qryCalculo.FieldByName('QTD_ENTREGA').AsInteger;
        tbExtratoQTD_VOLUMES_EXTRA.AsFloat := 0;
        tbExtratoQTD_ATRASOS.AsInteger := dm.qryCalculo.FieldByName('QTD_ATRASOS').AsInteger;
        tbExtratoVAL_PERCENTUAL_DISTRIBUIDOR.AsFloat := 0;
        tbExtratoVAL_PERCENTUAL_ENTREGADOR.AsFloat := 0;
        tbExtratoVAL_VERBA.AsFloat := dm.qryCalculo.FieldByName('VAL_TOTAL_VERBA').AsFloat / dm.qryCalculo.FieldByName('QTD_ENTREGA').AsInteger;
        tbExtratoVAL_CREDITO.AsFloat := 0;
        tbExtratoVAL_DEBITO.AsFloat := 0;
        tbExtratoVAL_RESTRICAO.AsFloat := 0;
        tbExtratoVAL_PENALIDADE_ATRASOS.AsFloat := 0;
        tbExtratoVAL_ABASTECIMENTO.AsFloat := 0;
        tbExtratoVAL_TOTAL_DEBITOS.AsFloat := 0;
        tbExtratoVAL_TOTAL_CREDITOS.AsFloat := 0;
        tbExtratoVAL_TOTAL_GERAL.AsFloat := 0;
        tbExtratoDAT_INICIO.AsDateTime := datinicioExtrato.Date;
        tbExtratoDAT_TERMINO.AsDateTime := datFinalExtrato.Date;
        tbExtratoVAL_VERBA_TOTAL.AsFloat := dm.qryCalculo.FieldByName('VAL_TOTAL_VERBA').AsFloat;
        tbExtratoVAL_VOLUMES_EXTRA.AsFloat := 0;
        tbExtratoNUM_EXTRATO.AsString := '';
        dPosicao := (iContador / iRecords) * 100;
        Inc(iContador,1);
        frmProcesso.cxProgressBar1.Position := dPosicao;
        frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
        frmProcesso.cxProgressBar1.Refresh;
        tbExtrato.Post;
        dm.qryCalculo.Next;
      end;
    end
    else
    begin
      Application.MessageBox('Nenhuma entrega encontrado no peeríodo e condições informados!',
                             PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
  finally
    FreeAndNil(frmProcesso);
    if tbExtrato.IsEmpty then
    begin
      tbExtrato.Close;
    end
    else
    begin
      tbExtrato.First;
      tvExtrato.ViewData.Expand(True);
    end;
    dm.qryCalculo.Close;
    dm.qryCalculo.SQL.Clear;
    entrega.Free;
    agente.Free;
    entregador.Free;
  end;
end;

procedure TfrmExtratoExpressa.AtribuiVerbaPeso();
var
  iFaixa, iVerba: Integer;
  dVerba, dPeso, dPesoMax, dFracao : Double;
  iRecords: Integer;
  iContador: Integer;
  iPeso, iPesoMax : Integer;
  sFiltro, sCEP: string;
  iVerbaMax: Integer;
  sNN: string;
begin
  try
    entrega := TEntrega.Create();
    if dm.qryFaixasPesos.Active then
    begin
      dm.qryFaixasPesos.Close;
      dm.qryFaixasPesos.SQL[1] := '';
    end;
    if dm.qryFaixaVerba.Active then
    begin
      dm.qryFaixaVerba.Close;
      dm.qryFaixaVerba.SQL[1] := '';
    end;
    if dm.qryCepVerba.Active then
    begin
      dm.qryCepVerba.Close;
      dm.qryCepVerba.SQL[1] := '';
    end;
    if not Assigned(frmProcesso) then
    begin
      frmProcesso := TfrmProcesso.Create(Application);
    end;
    sFiltro := '';
    iFaixa := 0;
    dVerba := 0;
    dFracao := 0;
    dPesoMax := 0;
    sCEP := '';
    dPeso := 0;
    sFiltro := MontaFiltro();
    sFiltro := Copy(sFiltro,0,Pos(' GROUP', sFiltro));
    if entrega.PesquisaEntregasPeso(sFiltro) then
    begin
      iRecords := dm.qryPesquisa.RecordCount;
      iContador := 0;
      frmProcesso.cxGroupBox1.Caption := 'Atribuindo valor de verba. Aguarde...';
      frmProcesso.cxGroupBox1.Refresh;
      frmProcesso.cxProgressBar1.Position := 0;
      frmProcesso.Show;
      dm.qryFaixasPesos.SQL[1] := ' ORDER BY QTD_PESO_INICIAL';
      dm.qryFaixasPesos.Open;
      dm.qryFaixasPesos.Last;
      dPesoMax := Int(dm.qryFaixasPesos.FieldByName('QTD_PESO_INICIAL').AsFloat);
      iVerbaMax := dm.qryFaixasPesos.FieldByName('ID_VERBA').AsInteger;
      dm.qryFaixasPesos.Close;
      dm.qryFaixasPesos.SQL[1] := '';
      while not dm.qryPesquisa.Eof do
      begin
        dVerba := 0;
        dFracao := 0;
        iFaixa := 0;
        iPeso := 0;
        iPesoMax := 0;
        sCEP := dm.qryPesquisa.FieldByName('NUM_CEP').AsString;
        dm.qryCepVerba.SQL[1] := ' WHERE NUM_CEP_INICIAL <= ' + QuotedStr(sCEP) + ' AND NUM_CEP_FINAL >= ' + QuotedStr(sCEP);
        dm.qryCepVerba.Open;
        if not dm.qryCepVerba.IsEmpty then
        begin
          dm.qryCepVerba.First;
          iFaixa := dm.qryCepVerba.FieldByName('ID_FAIXA').AsInteger;
        end;
        dm.qryCepVerba.Close;
        dm.qryCepVerba.SQL[1] := '';
        dPeso := dm.qryPesquisa.FieldByName('QTD_PESO_COBRADO').AsFloat;
        dm.qryFaixasPesos.Close;
        dm.qryFaixasPesos.SQL[1] := '';
        dm.qryFaixasPesos.SQL[1] := ' WHERE QTD_PESO_INICIAL <= :PESO AND QTD_PESO_FINAL >= :PESO';
        iPeso := Round(dPeso);
        iPesoMax := Round(dPesoMax);
        if iPesoMax >= iPeso then
        begin
          dm.qryFaixasPesos.ParamByName('PESO').AsFloat := dPeso;
        end
        else
        begin
          dm.qryFaixasPesos.ParamByName('PESO').AsFloat := dPesoMax;
        end;
        dm.qryFaixasPesos.Open;
        if not dm.qryFaixasPesos.IsEmpty then
        begin
          dm.qryFaixasPesos.First;
          iVerba := dm.qryFaixasPesos.FieldByName('ID_VERBA').AsInteger;
          dm.qryFaixaVerba.SQL[1] := ' WHERE ID_VERBA = ' + IntToStr(iVerba) + ' AND ID_FAIXA = ' + IntToStr(iFaixa);
          dm.qryFaixaVerba.Open;
          if not dm.qryFaixaVerba.IsEmpty then
          begin
            dVerba := dm.qryFaixaVerba.FieldByName('VAL_VERBA').AsFloat;
          end
          else
          begin
            dVerba := 0;
          end;
          dm.qryFaixaVerba.Close;
          dm.qryFaixaVerba.SQL[1] := '';
        end;
        dm.qryFaixasPesos.Close;
        dm.qryFaixasPesos.SQL[1] := '';

        dFracao := 0;
        if iPesoMax < iPeso then
        begin
          dm.qryFaixasPesos.SQL[1] := ' WHERE QTD_PESO_INICIAL <= :PESO AND QTD_PESO_FINAL >= :PESO';
          dm.qryFaixasPesos.ParamByName('PESO').AsFloat := dPeso;
          dm.qryFaixasPesos.Open;
          if not dm.qryFaixasPesos.IsEmpty then
          begin
            dm.qryFaixasPesos.First;
            dm.qryFaixaVerba.SQL[1] := ' WHERE ID_VERBA = ' + IntToStr(iVerba) + ' AND ID_FAIXA = ' + IntToStr(iFaixa);
            dm.qryFaixaVerba.Open;
            if not dm.qryFaixaVerba.IsEmpty then
            begin
              dFracao := dm.qryFaixaVerba.FieldByName('VAL_VERBA').AsFloat;
            end;
            dm.qryFaixaVerba.Close;
            dm.qryFaixaVerba.SQL[1] := '';
          end;
          dm.qryFaixasPesos.Close;
          dm.qryFaixasPesos.SQL[1] := '';
        end;
        if dVerba > 0 then
        begin
          if iPesoMax < iPeso then
          begin
            dVerba := dVerba + ((iPeso - iPesoMax) * dFracao);
          end;
          sNN := dm.qryPesquisa.FieldByName('NUM_NOSSONUMERO').AsString;
          if entrega.getObject(sNN, 'NOSSONUMERO') then
          begin
            entrega.VerbaEntregador := dVerba;
            if not entrega.Update() then
            begin
              Application.MessageBox(PChar('Erro ao atualizar a verba do NN ' + sNN + ' !'), PChar('Atenção ' + uGlobais.sUsuario),
                                     MB_OK + MB_ICONEXCLAMATION);
            end;
          end;
        end;
        dPosicao := (iContador / iRecords) * 100;
        Inc(iContador,1);
        frmProcesso.cxProgressBar1.Position := dPosicao;
        frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
        frmProcesso.cxProgressBar1.Refresh;
        dm.qryPesquisa.Next;
      end;
    end;
  finally
    FreeAndNil(frmProcesso);
    entrega.Free;
    dm.qryFaixasPesos.Close;
    dm.qryFaixasPesos.Filtered := False;
    dm.qryFaixasPesos.Filter := '';
    dm.qryFaixaVerba.Close;
    dm.qryFaixaVerba.Filtered := False;
    dm.qryFaixaVerba.Filter := '';
    dm.qryCepVerba.Close;
    dm.qryCepVerba.Filtered := False;
    dm.qryCepVerba.Filter := '';
    dm.qryPesquisa.Close;
    dm.qryPesquisa.SQL.Clear;
  end;
end;

procedure TfrmExtratoExpressa.ExportaExtrato();
var
  FileExt, sFile: String;
begin
  if not tbExtrato.Active then
  begin
    Exit;
  end;
  if tbExtrato.IsEmpty then
  begin
    Exit;
  end;
  sFile := 'extrato_';
  SaveDialog.FileName := sFile;
  SaveDialog.Filter := '';
  SaveDialog.Filter :=
    'Excel (*.xls) |*.xls|XML (*.xml) |*.xml|Arquivo Texto (*.txt) |*.txt|Página Web (*.html)|*.html';
  SaveDialog.Title := 'Exportar Dados';
  SaveDialog.DefaultExt := 'xls';
  if SaveDialog.Execute then
  begin
    FileExt := LowerCase(ExtractFileExt(SaveDialog.FileName));
    if FileExt = '.xls' then
      ExportGridToExcel(SaveDialog.FileName, grdExtrato, False, True, False)
    else if FileExt = '.xml' then
      ExportGridToXML(SaveDialog.FileName, grdExtrato, False)
    else if FileExt = '.txt' then
      ExportGridToText(SaveDialog.FileName, grdExtrato, False)
    else if FileExt = '.html' then
      ExportGridToHTML(SaveDialog.FileName, grdExtrato, False);
    ShellExecute(Handle, 'open', pchar(SaveDialog.FileName), nil, nil, SW_SHOW);
  end;
end;

procedure TfrmExtratoExpressa.SetupExtrato();
begin
  extrato.Tipo := tbExtratoCOD_TIPO.AsInteger;
  extrato.NumeroExtrato := tbExtratoNUM_EXTRATO.AsString;
  extrato.Cliente := tbExtratoCOD_CLIENTE.AsInteger;
  extrato.DataBase := datFinalExtrato.Date;
  extrato.DataInicio := datinicioExtrato.Date;
  extrato.DataTermino := datFinalExtrato.Date;
  extrato.Cadastro := tbExtratoCOD_CADASTRO.AsInteger;
  extrato.Codigodistribuidor := tbExtratoCOD_DISTRIBUIDOR.AsInteger;
  extrato.NomeDistribuidor := tbExtratoNOM_DISTRIBUIDOR.AsString;
  extrato.PercentualDistribuidor := tbExtratoVAL_PERCENTUAL_DISTRIBUIDOR.AsFloat;
  extrato.CodigoEntregador := tbExtratoCOD_ENTREGADOR.AsInteger;
  extrato.NomeEntregador := tbExtratoNOM_ENTREGADOR.AsString;
  extrato.PercentualEntregador := tbExtratoVAL_PERCENTUAL_ENTREGADOR.AsFloat;
  extrato.Verba := tbExtratoVAL_VERBA.AsFloat;
  extrato.Volumes := tbExtratoQTD_VOLUMES.AsInteger;
  extrato.VolumesExtra := tbExtratoVAL_VOLUMES_EXTRA.AsFloat;
  extrato.Entregas := tbExtratoQTD_ENTREGA.AsInteger;
  extrato.Atrasos := tbExtratoQTD_ATRASOS.AsInteger;
  extrato.VerbaTotal := tbExtratoVAL_VERBA_TOTAL.AsFloat;
  extrato.ValorVolumesExtra := tbExtratoVAL_VOLUMES_EXTRA.AsFloat;
  extrato.Creditos := tbExtratoVAL_CREDITO.AsFloat;
  extrato.Restricao := tbExtratoVAL_RESTRICAO.AsFloat;
  extrato.Abastecimentos := tbExtratoVAL_ABASTECIMENTO.AsFloat;
  extrato.PenalizadaAtrasos := tbExtratoVAL_PENALIDADE_ATRASOS.AsFloat;
  extrato.Debitos := tbExtratoVAL_DEBITO.AsFloat;
  extrato.TotalCreaditos := tbExtratoVAL_TOTAL_CREDITOS.AsFloat;
  extrato.TotalDebitos := tbExtratoVAL_TOTAL_DEBITOS.AsFloat;
  extrato.TotalGeral := tbExtratoVAL_TOTAL_GERAL.AsFloat;
  extrato.Pago := 'N';
  extrato.DataPago := 0;
  extrato.Fechado := 'S';
  extrato.DataFechado := Now();
  extrato.Executante := uGlobais.sUsuario;
  extrato.Manutencao := Now();
end;

procedure TfrmExtratoExpressa.FecharExtrato();
var
  iRecords: Integer;
  iContador: Integer;
  sData: String;
  sExtrato: string;
begin
  try
    lancamentos := TLancamentos.Create();
    abastecimento := TAbastecimentos.Create();
    restricao := TRestricoes.Create();
    extratosDAO := TExtratoExpressasDAO.Create();
    entrega := TEntrega.Create();
    if not Assigned(frmData) then
    begin
      frmData := TfrmData.Create(Application);
    end;
    if frmData.ShowModal = mrCancel then
    begin
      FreeAndNil(frmData);
      Application.MessageBox('Fechamento Cancelado!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
    sData := frmData.cxData.Text;
    FreeAndNil(frmData);
    if tbExtrato.IsEmpty then
    begin
      Exit;
    end;
    if not Assigned(frmProcesso) then
    begin
      frmProcesso := TfrmProcesso.Create(Application);
    end;
    iRecords :=tbExtrato.RecordCount;
    iContador := 0;
    frmProcesso.cxGroupBox1.Caption := 'Fechando o Extrato. Aguarde...';
    frmProcesso.cxGroupBox1.Refresh;
    frmProcesso.cxProgressBar1.Position := 0;
    frmProcesso.Show;
    tbextrato.First;
    while not tbExtrato.Eof do
    begin
      sExtrato := FloatToStr(DaysBetween(StrToDate('01/01/1900'), StrToDate(sData)));
      sExtrato := sExtrato + tbExtratoCOD_DISTRIBUIDOR.AsString;
      SetupExtrato;

      //lançamentos
      if chkLancamentos.Checked then
      begin
        if extrato.Creditos > 0 then
        begin
          if not lancamentos.Fechar(datinicioExtrato.Text, datFinalExtrato.Text, sData, sExtrato, IntToStr(extrato.Cadastro), 'FECHAR') then
          begin
            Application.MessageBox(PChar('Erro ao fechar os Lançamentos do entregador ' + IntToStr(extrato.CodigoEntregador) + ' !'),
                                   PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
          end;
        end
        else if extrato.Debitos < 0 then
        begin
          if not lancamentos.Fechar(datinicioExtrato.Text, datFinalExtrato.Text, sData, sExtrato, IntToStr(extrato.Cadastro), 'FECHAR') then
          begin
            Application.MessageBox(PChar('Erro ao fechar os Lançamentos do entregador ' + IntToStr(extrato.CodigoEntregador) + ' !'),
                                   PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
          end;
        end;
      end;

      //abastecimentos

      if chkAbastecimento.Checked then
      begin
        if extrato.Abastecimentos < 0 then
        begin
          if not abastecimento.Fechar(datinicioExtrato.Text, datFinalExtrato.Text,IntToStr(extrato.Cadastro), sExtrato, 'FECHAR') then
          begin
            Application.MessageBox(PChar('Erro ao fechar os Abastecimentos do entregador ' + IntToStr(extrato.CodigoEntregador) + ' !'),
                                   PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
          end;
        end;
      end;

      //restrições

      if chkRestricoes.Checked then
      begin
        if extrato.Restricao <> 0 then
        begin
          if restricao.getObject(IntToStr(extrato.CodigoEntregador), 'ENTREGADOR')
          then
          begin
            restricao.Valor := restricao.Valor + extrato.Restricao;
            restricao.Pago := restricao.Pago + ABS(extrato.Restricao);
            restricao.Debitar := 0;
            if not(restricao.Update()) then
            begin
              MessageDlg('Erro Fechamento: RESTRIÇÃO; Distribuidor: ' + IntToStr(extrato.Codigodistribuidor) + ' / Entregador: ' +
                         IntToStr(extrato.CodigoEntregador) , mtWarning, [mbOK], 0);
              Exit;;
            end;
          end
          else
          begin
            if restricao.getObject(IntToStr(extrato.Codigodistribuidor), 'AGENTE') then
            begin
              restricao.Valor := restricao.Valor + extrato.restricao;
              restricao.Pago := restricao.Pago + ABS(extrato.restricao);
              restricao.Debitar := 0;
              if not(restricao.Update) then
              begin
                MessageDlg('Erro Fechamento: RESTRIÇÃO; Agente: ' + IntToStr(extrato.Codigodistribuidor) + ' / Entregador: ' +
                           IntToStr(extrato.CodigoEntregador), mtWarning, [mbOK], 0);
                Exit;
              end;
            end;
          end;
        end;
      end;

      //entregas

      if not entrega.Fechar(datinicioExtrato.Text, datFinalExtrato.Text, sData, sExtrato, IntToStr(extrato.Codigodistribuidor),
             IntToStr(extrato.CodigoEntregador), cboTipoPeriodo.Text, 'FECHAR',extrato.Verba, extrato.Tipo, extrato.Cliente) then
      begin
        Application.MessageBox(PChar('Erro ao fechar as Entregas do entregador ' + IntToStr(extrato.CodigoEntregador) + ' !'),
                               PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
      end;

      //extrato

      extrato.NumeroExtrato := sExtrato;
      extrato.DataPago := StrToDate(sData);
      if not extratosDAO.Insert(extrato) then
      begin
        Application.MessageBox(PChar('Erro ao fechar Extrato do entregador ' + IntToStr(extrato.CodigoEntregador) + ' !'),
                           PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
        Exit;
      end;
      dPosicao := (iContador / iRecords) * 100;
      Inc(iContador,1);
      frmProcesso.cxProgressBar1.Position := dPosicao;
      frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
      frmProcesso.cxProgressBar1.Refresh;
      tbExtrato.Next
    end;
  finally
    FreeAndNil(frmProcesso);
    lancamentos.Free;
    abastecimento.Free;
    restricao.Free;
    extratosDAO.Free;
    tbExtrato.Close;
    tbExtrato.Open;
    entrega.Free;
  end;
end;

procedure TfrmExtratoExpressa.ReabrirExtrato();
var
  iRecords: Integer;
  iContador: Integer;
  sData: String;
  sExtrato: string;
begin
  try
    lancamentos := TLancamentos.Create();
    abastecimento := TAbastecimentos.Create();
    restricao := TRestricoes.Create();
    extratosDAO := TExtratoExpressasDAO.Create();
    sData := FormatDateTime('dd/mm/yyyy', Now());
    if tbExtrato.IsEmpty then
    begin
      Exit;
    end;
    iRecords :=tbExtrato.RecordCount;
    iContador := 0;
    frmProcesso.cxGroupBox1.Caption := 'Reabrindo o Extrato. Aguarde...';
    frmProcesso.cxGroupBox1.Refresh;
    frmProcesso.cxProgressBar1.Position := 0;
    frmProcesso.Show;
    tbextrato.First;
    while not tbExtrato.Eof do
    begin
      SetupExtrato;
      sExtrato := extrato.NumeroExtrato;

      //lançamentos

      if extrato.Creditos > 0 then
      begin
        if not lancamentos.Fechar(datinicioExtrato.Text, datFinalExtrato.Text, sData, sExtrato, IntToStr(extrato.Cadastro), 'ABRIR') then
        begin
          Application.MessageBox(PChar('Erro ao reabrir os Lançamentos do entregador ' + IntToStr(extrato.CodigoEntregador) + ' !'),
                                 PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
        end;
      end
      else if extrato.Debitos < 0 then
      begin
        if not lancamentos.Fechar(datinicioExtrato.Text, datFinalExtrato.Text, sData, sExtrato, IntToStr(extrato.Cadastro), 'ABRIR') then
        begin
          Application.MessageBox(PChar('Erro ao reabrir os Lançamentos do entregador ' + IntToStr(extrato.CodigoEntregador) + ' !'),
                                 PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
        end;
      end;

      //abastecimentos

      if extrato.Abastecimentos < 0 then
      begin
        if not abastecimento.Fechar(datinicioExtrato.Text, datFinalExtrato.Text,IntToStr(extrato.Cadastro), sExtrato, 'ABRIR') then
        begin
          Application.MessageBox(PChar('Erro ao reabrir os Abastecimentos do entregador ' + IntToStr(extrato.CodigoEntregador) + ' !'),
                                 PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
        end;
      end;

      //restrições

      if extrato.Restricao < 0 then
      begin
        if restricao.getObject(IntToStr(extrato.CodigoEntregador), 'ENTREGADOR')
        then
        begin
          restricao.Valor := restricao.Valor + ABS(extrato.Restricao);
          restricao.Pago := restricao.Pago + extrato.Restricao;
          restricao.Debitar := ABS(extrato.Restricao);
          if not(restricao.Update) then
          begin
            MessageDlg('Erro Cancelamento do Fechamento: RESTRIÇÃO; Agente: ' +
              IntToStr(extrato.Codigodistribuidor) + ' / Entregador: ' +
              IntToStr(extrato.CodigoEntregador), mtWarning, [mbOK], 0);
            Exit;
          end;
        end
        else
        begin
          if restricao.getObject(IntToStr(extrato.Codigodistribuidor), 'AGENTE') then
          begin
            restricao.Valor := restricao.Valor + ABS(extrato.Restricao);
            restricao.Pago := restricao.Pago + extrato.Restricao;
            restricao.Debitar := ABS(extrato.Restricao);
            if not(restricao.Update) then
            begin
              MessageDlg('Erro Cancelamento Fechamento: RESTRIÇÃO; Agente: ' +
                IntToStr(extrato.Codigodistribuidor) + ' / Entregador: ' +
                IntToStr(extrato.CodigoEntregador), mtWarning, [mbOK], 0);
              Exit;
            end;
          end;
        end;
      end;

      //entregas

      if not entrega.Fechar(datinicioExtrato.Text, datFinalExtrato.Text, sData, sExtrato, IntToStr(extrato.Codigodistribuidor),
             IntToStr(extrato.CodigoEntregador), cboTipoPeriodo.Text, 'ABRIR',extrato.Verba, extrato.Tipo, extrato.Cliente) then
      begin
        Application.MessageBox(PChar('Erro ao Reabrir as Entregas do entregador ' + IntToStr(extrato.CodigoEntregador) + ' !'),
                               PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
      end;

      //extrato

      if not extratosDAO.Delete('NUM_EXTRATO = ' + QuotedStr(extrato.NumeroExtrato) + ' AND COD_ENTREGADOR = ' + QuotedStr(IntToStr(extrato.CodigoEntregador))) then
      begin
        Application.MessageBox(PChar('Erro ao Reabrir Extrato do entregador ' + IntToStr(extrato.CodigoEntregador) + ' !'),
                           PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
        Exit;
      end;
      dPosicao := (iContador / iRecords) * 100;
      Inc(iContador,1);
      frmProcesso.cxProgressBar1.Position := dPosicao;
      frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
      frmProcesso.cxProgressBar1.Refresh;
      tbExtrato.Next
    end;
  finally
    FreeAndNil(frmProcesso);
    lancamentos.Free;
    abastecimento.Free;
    restricao.Free;
    extratosDAO.Free;
  end;
end;

procedure TfrmExtratoExpressa.EmitirExtrato();
var
  sFiltro : String;
  extratoTmp : TExtratoExpressas;
  dPosicao: Double;
  iContador: Integer;
  iRecords: Integer;
  i : Integer;
begin
  sFiltro := '';
  try
    sFiltro := MontaFiltroFechado();
    if sFiltro.isEmpty then
    begin
      Exit;
    end;
    if tbExtrato.Active then
    begin
      tbExtrato.Close;
    end;
    tbExtrato.Open;
    if not Assigned(frmProcesso) then
    begin
      frmProcesso := TfrmProcesso.Create(Application);
    end;
    extratosDAO := TExtratoExpressasDAO.Create();
    extratos := extratosDAO.FindExtrato(sFiltro);
    iRecords := extratos.Count ;
    iContador := 0;
    frmProcesso.cxGroupBox1.Caption := 'Gerando a grade. Aguarde...';
    frmProcesso.cxGroupBox1.Refresh;
    frmProcesso.cxProgressBar1.Position := 0;
    frmProcesso.Show;

    for extratoTmp in extratos do
    begin
      tbExtrato.Insert;
      tbExtratoCOD_TIPO.AsInteger := extratoTmp.Tipo;
      tbExtratoCOD_DISTRIBUIDOR.AsInteger := extratoTmp.Codigodistribuidor;
      tbExtratoNOM_DISTRIBUIDOR.AsString :=extratoTmp.NomeDistribuidor;
      tbExtratoCOD_ENTREGADOR.AsInteger := extratoTmp.CodigoEntregador;
      tbExtratoNOM_ENTREGADOR.AsString := extratoTmp.NomeEntregador;
      tbExtratoCOD_CADASTRO.AsInteger := extratoTmp.Cadastro;
      tbExtratoQTD_VOLUMES.AsInteger := extratoTmp.Volumes;
      tbExtratoQTD_ENTREGA.AsInteger := extratoTmp.Entregas;
      tbExtratoQTD_VOLUMES_EXTRA.AsFloat := extratoTmp.VolumesExtra;
      tbExtratoQTD_ATRASOS.AsInteger := extratoTmp.Atrasos;
      tbExtratoVAL_PERCENTUAL_DISTRIBUIDOR.AsFloat := extratoTmp.PercentualDistribuidor;
      tbExtratoVAL_PERCENTUAL_ENTREGADOR.AsFloat := extratoTmp.PercentualEntregador;
      tbExtratoVAL_VERBA.AsFloat := extratoTmp.Verba;
      tbExtratoVAL_CREDITO.AsFloat := extratoTmp.Creditos;
      tbExtratoVAL_DEBITO.AsFloat := extratoTmp.Debitos;
      tbExtratoVAL_RESTRICAO.AsFloat := extratoTmp.Restricao;
      tbExtratoVAL_PENALIDADE_ATRASOS.AsFloat := extratoTmp.PenalizadaAtrasos;
      tbExtratoVAL_ABASTECIMENTO.AsFloat := extratoTmp.Abastecimentos;
      tbExtratoVAL_TOTAL_DEBITOS.AsFloat := extratoTmp.TotalDebitos;
      tbExtratoVAL_TOTAL_CREDITOS.AsFloat := extratoTmp.TotalCreaditos;
      tbExtratoVAL_TOTAL_GERAL.AsFloat := extratoTmp.TotalGeral;
      tbExtratoDAT_INICIO.AsDateTime := extratoTmp.DataInicio;
      tbExtratoDAT_TERMINO.AsDateTime := extratoTmp.DataTermino;
      tbExtratoVAL_VERBA_TOTAL.AsFloat := extratoTmp.VerbaTotal;
      tbExtratoVAL_VOLUMES_EXTRA.AsFloat := extratoTmp.ValorVolumesExtra;
      tbExtratoNUM_EXTRATO.AsString := extratoTmp.NumeroExtrato;
      tbExtratoCOD_CLIENTE.AsInteger := extratoTmp.Cliente;
      dPosicao := (iContador / iRecords) * 100;
      Inc(iContador,1);
      frmProcesso.cxProgressBar1.Position := dPosicao;
      frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
      frmProcesso.cxProgressBar1.Refresh;
      tbExtrato.Post;
    end;
    if tbExtrato.IsEmpty then
    begin
      Application.MessageBox('Nenhuma extrato encontrado no período e condições informados!',
                             PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
    lciVerbaFixa.Visible := (tbExtratoCOD_TIPO.AsInteger = 1);
    cliAtribuirVerbas.Visible := (tbExtratoCOD_TIPO.AsInteger = 1);
    tvExtratoVAL_PERCENTUAL_ENTREGADOR.Visible := (tbExtratoCOD_TIPO.AsInteger = 0);
    tvExtratoVAL_PENALIDADE_ATRASOS.Visible := (tbExtratoCOD_TIPO.AsInteger <> 0);
    tvExtratoQTD_VOLUMES_EXTRA.Visible := (tbExtratoCOD_TIPO.AsInteger = 0);
    tvExtratoVAL_VOLUMES_EXTRA.Visible := (tbExtratoCOD_TIPO.AsInteger = 0);
    if tbExtratoCOD_TIPO.AsInteger = 1 then
    begin
      tvExtratoVAL_VERBA.Caption := 'Verba Média';
    end
    else
    begin
      tvExtratoVAL_VERBA.Caption := 'Valor da Verba';
    end;
    tvExtratoCOD_CLIENTE.Visible := True;
  finally
    FreeAndNil(frmProcesso);
    if tbExtrato.IsEmpty then
    begin
      tbExtrato.Close;
    end
    else
    begin
      tbExtrato.First;
      tvExtrato.ViewData.Expand(True);
    end;
    extratoTmp.Free;
    extratosDAO.Free;
  end;
end;

function TfrmExtratoExpressa.MontaFiltroFechado(): String;
var
  sFiltro, sCampoPeriodo, sClientes, sCodigos : String;
  i: Integer;
begin
  Result := '';
  sFiltro := '';
  sCampoPeriodo := 'DAT_PAGO';
  sClientes := '';
  if sFiltro.IsEmpty then
  begin
    sFiltro := sFiltro + 'WHERE ';
  end;
  sFiltro := sFiltro + sCampoPeriodo + ' = ' + QuotedStr(FormatDateTime('yyyy-mm-dd', StrToDate(cboDatas.Text)));
  if lbDistribuidoresFechado.Count > 0 then
  begin
    for i := 0 to lbDistribuidoresFechado.Items.Count - 1 do
    begin
      if not sCodigos.IsEmpty then
      begin
        sCodigos := sCodigos + ',';
      end;
      sCodigos := sCodigos + Copy(lbDistribuidoresFechado.Items[i], 1, Pos('-', lbDistribuidoresFechado.Items[i]) - 1);
    end;
    if cboTipoExtratoFechado.ItemIndex = 0 then
    begin
      if not sCodigos.IsEmpty then
      begin
        sFiltro := sFiltro + ' AND COD_DISTRIBUIDOR IN (' + sCodigos + ')';
      end;
    end
    else
    begin
      if not sCodigos.IsEmpty then
      begin
        sFiltro := sFiltro + ' AND COD_ENTREGADOR IN (' + sCodigos + ')';
      end;
    end;
  end;
  Result := sFiltro;
end;

procedure TfrmExtratoExpressa.PopulaDatas();
var
  lLista : TStringList;
  extratoDAO : TExtratoExpressasDAO;
  i: Integer;
begin
  try
    extratoDAO := TExtratoExpressasDAO.Create();
    lLista := TStringList.Create();
    lLista.Text := extratoDAO.FindDatas().Text;
    cboDatas.Properties.Items.Clear;
    cboDatas.Properties.Items.Add('Selecione uma data...');
    for i := 0 to lLista.Count - 1 do
    begin
      cboDatas.Properties.Items.Add(lLista[i]);
    end;
  finally
    lLista.Free;
    extratoDAO.Free;
    if cboDatas.Properties.Items.Count > 0 then
    begin
      cboDatas.ItemIndex := 0;
    end;
  end;
end;

procedure TfrmExtratoExpressa.PopulaClientes();
begin
  try
    dm.qryROClientes.Open;
    if tbClientes.Active then
    begin
      tbClientes.Close;
    end;
    tbClientes.Open;
    tbClientes.Insert;
    tbClientesCOD_CLIENTE.AsInteger := 0;
    tbClientesNOM_CLIENTE.AsString := 'TODOS';
    tbClientesDOM_OS.AsString := 'N';
    tbClientes.Post;
    while not dm.qryROClientes.Eof do
    begin
      tbClientes.Insert;
      tbClientesCOD_CLIENTE.AsInteger := dm.qryROClientesCOD_CLIENTE.AsInteger;
      tbClientesNOM_CLIENTE.AsString := dm.qryROClientesNOM_CLIENTE.AsString;
      tbClientesDOM_OS.AsString := dm.qryROClientesDOM_OS.AsString;
      tbClientes.Post;
      dm.qryROClientes.Next;
    end;
    if not tbClientes.IsEmpty then
    begin
      tbClientes.First;
    end;
  finally
    dm.qryROClientes.Close;
  end;
end;

procedure TfrmExtratoExpressa.CalcVerbaFixa();
var
  sFiltro : String;
  iCadastro: Integer;
  dPosicao: Double;
  iContador: Integer;
  iRecords: Integer;
begin
  sFiltro := '';
  try
    sFiltro := MontaFiltro();
    if sFiltro.isEmpty then
    begin
      Exit;
    end;
    if tbExtrato.Active then
    begin
      tbExtrato.Close;
    end;
    tbExtrato.Open;
    if not Assigned(frmProcesso) then
    begin
      frmProcesso := TfrmProcesso.Create(Application);
    end;
    entregador := TCodigosEntregadores.Create();
    entrega := TEntrega.Create();
    agente := TAgente.Create();
    if entrega.ConsolidarEntregas(sFiltro) then
    begin
      iRecords := dm.qryCalculo.RecordCount;
      iContador := 0;
      frmProcesso.cxGroupBox1.Caption := 'Dados dos Distribuidores e Entregadores. Aguarde...';
      frmProcesso.cxGroupBox1.Refresh;
      frmProcesso.cxProgressBar1.Position := 0;
      frmProcesso.Show;
      while not dm.qryCalculo.Eof do
      begin
        tbExtrato.Insert;
        tbExtratoCOD_TIPO.AsInteger := cboTipoCalculo.ItemIndex;
        tbExtratoCOD_DISTRIBUIDOR.AsInteger := dm.qryCalculo.FieldByName('COD_DISTRIBUIDOR').AsInteger;
        agente.Codigo := dm.qryCalculo.FieldByName('COD_DISTRIBUIDOR').AsString;
        tbExtratoNOM_DISTRIBUIDOR.AsString := agente.getField('NOM_FANTASIA','CODIGO');
        entregador.Codigo := dm.qryCalculo.FieldByName('COD_ENTREGADOR').AsInteger;
        iCadastro := StrToIntDef(entregador.getField('COD_CADASTRO','CODIGO'),0);
        tbExtratoCOD_ENTREGADOR.AsInteger := dm.qryCalculo.FieldByName('COD_ENTREGADOR').AsInteger;
        tbExtratoNOM_ENTREGADOR.AsString := entregador.getField('NOM_FANTASIA','CODIGO');
        tbExtratoCOD_CADASTRO.AsInteger := iCadastro;
        tbExtratoQTD_VOLUMES.AsInteger := dm.qryCalculo.FieldByName('QTD_VOLUMES').AsInteger;
        tbExtratoQTD_ENTREGA.AsInteger := dm.qryCalculo.FieldByName('QTD_ENTREGA').AsInteger;
        tbExtratoQTD_VOLUMES_EXTRA.AsFloat := 0;
        tbExtratoQTD_ATRASOS.AsInteger := dm.qryCalculo.FieldByName('QTD_ATRASOS').AsInteger;
        tbExtratoVAL_PERCENTUAL_DISTRIBUIDOR.AsFloat := 0;
        tbExtratoVAL_PERCENTUAL_ENTREGADOR.AsFloat := 0;
        tbExtratoVAL_VERBA.AsFloat := curValorVerba.Value;
        tbExtratoVAL_CREDITO.AsFloat := 0;
        tbExtratoVAL_DEBITO.AsFloat := 0;
        tbExtratoVAL_RESTRICAO.AsFloat := 0;
        tbExtratoVAL_PENALIDADE_ATRASOS.AsFloat := 0;
        tbExtratoVAL_ABASTECIMENTO.AsFloat := 0;
        tbExtratoVAL_TOTAL_DEBITOS.AsFloat := 0;
        tbExtratoVAL_TOTAL_CREDITOS.AsFloat := 0;
        tbExtratoVAL_TOTAL_GERAL.AsFloat := 0;
        tbExtratoDAT_INICIO.AsDateTime := datinicioExtrato.Date;
        tbExtratoDAT_TERMINO.AsDateTime := datFinalExtrato.Date;
        tbExtratoVAL_VERBA_TOTAL.AsFloat := curValorVerba.Value *  dm.qryCalculo.FieldByName('QTD_ENTREGA').AsInteger;;
        tbExtratoVAL_VOLUMES_EXTRA.AsFloat := 0;
        tbExtratoNUM_EXTRATO.AsString := '';
        tbExtratoCOD_CLIENTE.AsInteger := dm.qryCalculo.FieldByName('COD_CLIENTE').AsInteger;
        dPosicao := (iContador / iRecords) * 100;
        Inc(iContador,1);
        frmProcesso.cxProgressBar1.Position := dPosicao;
        frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
        frmProcesso.cxProgressBar1.Refresh;
        tbExtrato.Post;
        dm.qryCalculo.Next;
      end;
    end
    else
    begin
      Application.MessageBox('Nenhuma entrega encontrado no peeríodo e condições informados!',
                             PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
  finally
    FreeAndNil(frmProcesso);
    if tbExtrato.IsEmpty then
    begin
      tbExtrato.Close;
    end
    else
    begin
      tbExtrato.First;
      tvExtrato.ViewData.Expand(True);
    end;
    dm.qryCalculo.Close;
    dm.qryCalculo.SQL.Clear;
    entrega.Free;
    agente.Free;
    entregador.Free;
  end;
end;

end.
