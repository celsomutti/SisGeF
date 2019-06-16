unit ufrmcontroleTransportes;

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
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxLabel, dxSkinscxPCPainter, dxLayoutContainer, dxLayoutControl, udm, Data.DB,
  dxLayoutcxEditAdapters, cxTextEdit, cxMaskEdit, Vcl.ComCtrls, dxCore, cxDateUtils, cxDropDownEdit, cxCalendar, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxDBEdit, cxCurrencyEdit, cxSpinEdit, cxTimeEdit, cxButtonEdit, cxMemo, cxImageComboBox,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxBlobEdit, cxDBNavigator, System.Actions, Vcl.ActnList,
  dxLayoutControlAdapters, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxGridExportLink, ShellAPI, clServicos, clOrdemServico,
  clContasReceber, clVeiculos, System.DateUtils, clControleKM, clAcessos, cxCheckBox, clCliente, clAbastecimentos, dxmdaset,
  Model.ControleTransporte, DAO.ControleTransporte, System.Generics.Collections, dxSkinsdxBarPainter, dxBar, clEntregador,
  Model.InsumosTransportes, DAO.InsumosTransportes, Model.ConsumoInsumos, DAO.ConsumoInsumos, DAO.EstoqueInsumos,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light;

type
  TfrmControleTransportes = class(TForm)
    cxLabel27: TcxLabel;
    lcgTransporte_Root: TdxLayoutGroup;
    lcTransporte: TdxLayoutControl;
    dsTransporte: TDataSource;
    edtID: TcxDBMaskEdit;
    lcTransporteItem1: TdxLayoutItem;
    datTransporte: TcxDBDateEdit;
    lcTransporteItem2: TdxLayoutItem;
    lcbClientes: TcxDBLookupComboBox;
    lcTransporteItem3: TdxLayoutItem;
    dsCliente: TDataSource;
    cboOperacao: TcxDBComboBox;
    lcTransporteItem4: TdxLayoutItem;
    edtPlaca: TcxDBTextEdit;
    lcTransporteItem5: TdxLayoutItem;
    lcbVeiculo: TcxDBLookupComboBox;
    lcTransporteItem6: TdxLayoutItem;
    dsVeiculos: TDataSource;
    edtCodigoMotorista: TcxDBMaskEdit;
    lcTransporteItem7: TdxLayoutItem;
    lcbMotorista: TcxDBLookupComboBox;
    lcTransporteItem8: TdxLayoutItem;
    dsEntregadores: TDataSource;
    edtKMSaida: TcxDBCurrencyEdit;
    lcTransporteItem9: TdxLayoutItem;
    timSaida: TcxDBTimeEdit;
    lcTransporteItem10: TdxLayoutItem;
    edtKMRetorno: TcxDBCurrencyEdit;
    lcTransporteItem11: TdxLayoutItem;
    timRetorno: TcxDBTimeEdit;
    lcTransporteItem12: TdxLayoutItem;
    lcTransporteGroup5: TdxLayoutAutoCreatedGroup;
    lcTransporteGroup6: TdxLayoutAutoCreatedGroup;
    edtServicos: TcxDBButtonEdit;
    lcTransporteItem13: TdxLayoutItem;
    memObs: TcxDBMemo;
    lcTransporteItem14: TdxLayoutItem;
    cxDBImageComboBox1: TcxDBImageComboBox;
    lcTransporteItem15: TdxLayoutItem;
    tvViagens: TcxGridDBTableView;
    lvViagens: TcxGridLevel;
    grdViagens: TcxGrid;
    lcTransporteItem16: TdxLayoutItem;
    tvViagensID_CONTROLE: TcxGridDBColumn;
    tvViagensDAT_TRANSPORTE: TcxGridDBColumn;
    tvViagensCOD_CLIENTE: TcxGridDBColumn;
    tvViagensDES_OPERACAO: TcxGridDBColumn;
    tvViagensDES_PLACA: TcxGridDBColumn;
    tvViagensCOD_MOTORISTA: TcxGridDBColumn;
    tvViagensQTD_KM_SAIDA: TcxGridDBColumn;
    tvViagensHOR_SAIDA: TcxGridDBColumn;
    tvViagensQTD_KM_RETORNO: TcxGridDBColumn;
    tvViagensHOR_RETORNO: TcxGridDBColumn;
    tvViagensQTD_KM_RODADO: TcxGridDBColumn;
    tvViagensDES_SERVICO: TcxGridDBColumn;
    tvViagensDES_OBS: TcxGridDBColumn;
    tvViagensCOD_STATUS: TcxGridDBColumn;
    tvViagensDES_LOG: TcxGridDBColumn;
    tvViagensDES_MODELO: TcxGridDBColumn;
    aclTransporte: TActionList;
    actIncluir: TAction;
    actEditar: TAction;
    actExcluir: TAction;
    actCancelar: TAction;
    actGravar: TAction;
    actCancelarViagem: TAction;
    actFinalizar: TAction;
    actExportar: TAction;
    tvViagensVAL_SERVICO: TcxGridDBColumn;
    actFechar: TAction;
    actLocalizar: TAction;
    SaveDialog: TSaveDialog;
    cboVisualizacao: TcxComboBox;
    lcTransporteItem27: TdxLayoutItem;
    edtCodigoCliente: TcxDBMaskEdit;
    lcTransporteItem28: TdxLayoutItem;
    tvAbastecimentos: TcxGridDBTableView;
    lvAbastecimentos: TcxGridLevel;
    grdAbastecimentos: TcxGrid;
    lcTransporteItem29: TdxLayoutItem;
    dsAbastecimento: TDataSource;
    tvAbastecimentosNUM_ABASTECIMENTO: TcxGridDBColumn;
    tvAbastecimentosNUM_CUPOM: TcxGridDBColumn;
    tvAbastecimentosCOD_ENTREGADOR: TcxGridDBColumn;
    tvAbastecimentosDES_PLACA: TcxGridDBColumn;
    tvAbastecimentosDAT_ABASTECIMENTO: TcxGridDBColumn;
    tvAbastecimentosDES_PRODUTO: TcxGridDBColumn;
    tvAbastecimentosQTD_ABASTECIMENTO: TcxGridDBColumn;
    tvAbastecimentosVAL_UNITARIO: TcxGridDBColumn;
    tvAbastecimentosVAL_TOTAL: TcxGridDBColumn;
    tvAbastecimentosNOM_EXECUTANTE: TcxGridDBColumn;
    tvAbastecimentosDAT_MANUTENCAO: TcxGridDBColumn;
    tvAbastecimentosDOM_DESCONTO: TcxGridDBColumn;
    tvAbastecimentosNUM_EXTRATO: TcxGridDBColumn;
    tvAbastecimentosVAL_VERBA_COMBUSTIVEL: TcxGridDBColumn;
    tvAbastecimentosVAL_DESCONTO: TcxGridDBColumn;
    tvAbastecimentosDAT_BASE: TcxGridDBColumn;
    tvAbastecimentosNOM_ENTREGADOR: TcxGridDBColumn;
    tbAbastecimentos: TdxMemData;
    tbAbastecimentosNUM_ABASTECIMENTO: TIntegerField;
    tbAbastecimentosNUM_CUPOM: TWideStringField;
    tbAbastecimentosCOD_ENTREGADOR: TIntegerField;
    tbAbastecimentosDES_PLACA: TWideStringField;
    tbAbastecimentosDAT_ABASTECIMENTO: TDateField;
    tbAbastecimentosDES_PRODUTO: TWideStringField;
    tbAbastecimentosQTD_ABASTECIMENTO: TFloatField;
    tbAbastecimentosVAL_UNITARIO: TFloatField;
    tbAbastecimentosVAL_TOTAL: TFloatField;
    tbAbastecimentosNOM_EXECUTANTE: TWideStringField;
    tbAbastecimentosDAT_MANUTENCAO: TDateTimeField;
    tbAbastecimentosDOM_DESCONTO: TWideStringField;
    tbAbastecimentosNUM_EXTRATO: TWideStringField;
    tbAbastecimentosVAL_VERBA_COMBUSTIVEL: TFloatField;
    tbAbastecimentosVAL_DESCONTO: TFloatField;
    tbAbastecimentosDAT_BASE: TDateField;
    tbAbastecimentosNOM_ENTREGADOR: TWideStringField;
    tbAbastecimentosID_CONTROLE: TIntegerField;
    tbControle: TdxMemData;
    tbControleID_CONTROLE: TIntegerField;
    tbControleDAT_TRANSPORTE: TDateField;
    tbControleCOD_CLIENTE: TIntegerField;
    tbControleDES_OPERACAO: TWideStringField;
    tbControleDES_PLACA: TWideStringField;
    tbControleCOD_MOTORISTA: TIntegerField;
    tbControleQTD_KM_SAIDA: TFloatField;
    tbControleHOR_SAIDA: TTimeField;
    tbControleQTD_KM_RETORNO: TFloatField;
    tbControleHOR_RETORNO: TTimeField;
    tbControleQTD_KM_RODADO: TFloatField;
    tbControleDES_SERVICO: TWideStringField;
    tbControleDES_OBS: TWideMemoField;
    tbControleVAL_SERVICO: TFloatField;
    tbControleCOD_STATUS: TIntegerField;
    tbControleDES_LOG: TWideMemoField;
    bmControle: TdxBarManager;
    bmControleBar1: TdxBar;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    dxBarButton6: TdxBarButton;
    dxBarButton7: TdxBarButton;
    dxBarButton8: TdxBarButton;
    dxBarButton9: TdxBarButton;
    tbClientes: TdxMemData;
    tbClientesCOD_CLIENTE: TIntegerField;
    tbClientesNOM_CLIENTE: TWideStringField;
    tbClientesDOM_OS: TIntegerField;
    tbVeiculos: TdxMemData;
    tbVeiculosCOD_VEICULO: TIntegerField;
    tbVeiculosDES_TIPO_DOC: TWideStringField;
    tbVeiculosNUM_CNPJ: TWideStringField;
    tbVeiculosNOM_PROPRIETARIO: TWideStringField;
    tbVeiculosDAT_NASCIMENTO: TDateField;
    tbVeiculosNOM_MAE: TWideStringField;
    tbVeiculosNOM_PAI: TWideStringField;
    tbVeiculosNUM_RG: TWideStringField;
    tbVeiculosUF_RG: TWideStringField;
    tbVeiculosDAT_EMISSAO_RG: TDateField;
    tbVeiculosUF_ENDERECO: TWideStringField;
    tbVeiculosNOM_CIDADE: TWideStringField;
    tbVeiculosDES_ENDERECO: TWideStringField;
    tbVeiculosNUM_CEP: TWideStringField;
    tbVeiculosDES_BAIRRO: TWideStringField;
    tbVeiculosNUM_TELEFONE_1: TWideStringField;
    tbVeiculosDES_TELEFONE_1: TWideStringField;
    tbVeiculosNUM_TELEFONE_2: TWideStringField;
    tbVeiculosDES_TELEFONE_2: TWideStringField;
    tbVeiculosCOD_ENTREGADOR: TIntegerField;
    tbVeiculosDES_MARCA: TWideStringField;
    tbVeiculosDES_MODELO: TWideStringField;
    tbVeiculosDES_PLACA: TWideStringField;
    tbVeiculosUF_PLACA: TWideStringField;
    tbVeiculosNOM_CIDADE_PLACA: TWideStringField;
    tbVeiculosDES_TIPO: TWideStringField;
    tbVeiculosNUM_CHASSIS: TWideStringField;
    tbVeiculosDES_ANO: TWideStringField;
    tbVeiculosDES_COR: TWideStringField;
    tbVeiculosNUM_RENAVAN: TWideStringField;
    tbVeiculosANO_EXERCICIO_CLRV: TWideStringField;
    tbVeiculosDOM_RASTREAMENTO: TWideStringField;
    tbVeiculosDOM_ABASTECIMENTO: TWideStringField;
    tbVeiculosNOM_EXECUTOR: TWideStringField;
    tbVeiculosDAT_MANUTENCAO: TDateTimeField;
    tbMotoristas: TdxMemData;
    tbMotoristasCOD_CADASTRO: TIntegerField;
    tbMotoristasDOM_FUNCIONARIO: TWideStringField;
    tbMotoristasCOD_ENTREGADOR: TIntegerField;
    tbMotoristasDES_TIPO_DOC: TWideStringField;
    tbMotoristasDES_RAZAO_SOCIAL: TWideStringField;
    tbMotoristasNOM_FANTASIA: TWideStringField;
    tbMotoristasNUM_CNPJ: TWideStringField;
    tbMotoristasNUM_IE: TWideStringField;
    tbMotoristasDAT_NASCIMENTO: TDateTimeField;
    tbMotoristasUF_RG: TWideStringField;
    tbMotoristasDAT_EMISSAO_RG: TDateTimeField;
    tbMotoristasUF_NASCIMENTO: TWideStringField;
    tbMotoristasNOM_CIDADE_NASCIMENTO: TWideStringField;
    tbMotoristasNOM_PAI: TWideStringField;
    tbMotoristasNOM_MAE: TWideStringField;
    tbMotoristasNUM_IEST: TWideStringField;
    tbMotoristasNUM_IM: TWideStringField;
    tbMotoristasCOD_CNAE: TWideStringField;
    tbMotoristasCOD_CRT: TIntegerField;
    tbMotoristasNUM_CNH: TWideStringField;
    tbMotoristasNUM_REGISTRO_CNH: TWideStringField;
    tbMotoristasDES_CATEGORIA_CNH: TWideStringField;
    tbMotoristasDAT_VALIDADE_CNH: TDateField;
    tbMotoristasUF_CNH: TWideStringField;
    tbMotoristasDAT_1_HABILITACAO: TDateTimeField;
    tbMotoristasDES_PAGINA: TWideStringField;
    tbMotoristasCOD_AGENTE: TIntegerField;
    tbMotoristasCOD_STATUS: TIntegerField;
    tbMotoristasDES_OBSERVACAO: TWideMemoField;
    tbMotoristasDAT_CADASTRO: TDateField;
    tbMotoristasCOD_USUARIO: TIntegerField;
    tbMotoristasVAL_VERBA: TFloatField;
    tbMotoristasVAL_VERBA_COMBUSTIVEL: TFloatField;
    tbMotoristasDES_TIPO_CONTA: TWideStringField;
    tbMotoristasCOD_BANCO: TWideStringField;
    tbMotoristasCOD_AGENCIA: TWideStringField;
    tbMotoristasNUM_CONTA: TWideStringField;
    tbMotoristasNOM_FAVORECIDO: TWideStringField;
    tbMotoristasNUM_CPF_CNPJ_FAVORECIDO: TWideStringField;
    tbMotoristasDES_FORMA_PAGAMENTO: TWideStringField;
    tbMotoristasCOD_CENTRO_CUSTO: TIntegerField;
    tbMotoristasDOM_VITIMA_ROUBO: TWideStringField;
    tbMotoristasQTD_VITIMA_ROUBO: TIntegerField;
    tbMotoristasDOM_ACIDENTES: TWideStringField;
    tbMotoristasQTD_ACIDENTES: TIntegerField;
    tbMotoristasDOM_TRANSPORTE_EMPRESA: TWideStringField;
    tbMotoristasQTD_TRANSPORTE: TIntegerField;
    tbMotoristasDOM_GV: TWideStringField;
    tbMotoristasDAT_GV: TDateField;
    tbMotoristasNOM_EXECUTANTE: TWideStringField;
    tbMotoristasDAT_ALTERACAO: TDateTimeField;
    tbMotoristasDES_CHAVE: TWideStringField;
    tbMotoristasCOD_GRUPO: TIntegerField;
    tbMotoristasCOD_ROTEIRO: TWideStringField;
    tbInsumos: TdxMemData;
    tbInsumosID_INSUMO: TIntegerField;
    tbInsumosDES_INSUMO: TWideStringField;
    tbInsumosDES_UNIDADE: TWideStringField;
    tbInsumosDES_LOG: TWideMemoField;
    tbConsumo: TdxMemData;
    tbConsumoID_CONSUMO: TIntegerField;
    tbConsumoID_INSUMO: TIntegerField;
    tbConsumoDAT_CONSUMO: TDateField;
    tbConsumoQTD_KM_CONSUMO: TFloatField;
    tbConsumoID_CONTROLE: TIntegerField;
    tbConsumoQTD_CONSUMO: TFloatField;
    tbConsumoVAL_CONSUMO: TFloatField;
    tbConsumoDES_LOG: TWideMemoField;
    dsInsumos: TDataSource;
    dsConsumo: TDataSource;
    tbConsumoDES_PLACA: TStringField;
    tvInsumos: TcxGridDBTableView;
    lvInsumos: TcxGridLevel;
    grdInsumos: TcxGrid;
    lcTransporteItem17: TdxLayoutItem;
    lcTransporteGroup3: TdxLayoutAutoCreatedGroup;
    tvInsumosRecId: TcxGridDBColumn;
    tvInsumosID_CONSUMO: TcxGridDBColumn;
    tvInsumosID_INSUMO: TcxGridDBColumn;
    tvInsumosDES_PLACA: TcxGridDBColumn;
    tvInsumosDAT_CONSUMO: TcxGridDBColumn;
    tvInsumosQTD_KM_CONSUMO: TcxGridDBColumn;
    tvInsumosID_CONTROLE: TcxGridDBColumn;
    tvInsumosQTD_CONSUMO: TcxGridDBColumn;
    tvInsumosVAL_CONSUMO: TcxGridDBColumn;
    tvInsumosDES_LOG: TcxGridDBColumn;
    lcTransporteGroup1: TdxLayoutAutoCreatedGroup;
    tbConsumoDOM_CONSUMO: TStringField;
    datInicio: TcxDateEdit;
    liInicio: TdxLayoutItem;
    lcTransporteGroup2: TdxLayoutAutoCreatedGroup;
    datFinal: TcxDateEdit;
    liFinal: TdxLayoutItem;
    lgPeriodo: TdxLayoutGroup;
    actPeriodo: TAction;
    cxButton1: TcxButton;
    liExecutar: TdxLayoutItem;
    tbControleVAL_TOTAL_COMBUSTIVEL: TFloatField;
    tbControleVAL_TOTAL_INSUMOS: TFloatField;
    tvViagensVAL_TOTAL_COMBUSTIVEL: TcxGridDBColumn;
    tvViagensVAL_TOTAL_INSUMOS: TcxGridDBColumn;
    tbControleNUM_SM: TStringField;
    tvViagensNUM_SM: TcxGridDBColumn;
    mskSM: TcxDBMaskEdit;
    dxLayoutItem1: TdxLayoutItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actFecharExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actIncluirExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actGravarExecute(Sender: TObject);
    procedure dsTransporteStateChange(Sender: TObject);
    procedure actLocalizarExecute(Sender: TObject);
    procedure actCancelarViagemExecute(Sender: TObject);
    procedure cboVisualizacaoPropertiesChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure actFinalizarExecute(Sender: TObject);
    procedure chkDetalhesPropertiesChange(Sender: TObject);
    procedure tvViagensDblClick(Sender: TObject);
    procedure actExportarExecute(Sender: TObject);
    procedure tbAbastecimentosVAL_UNITARIOValidate(Sender: TField);
    procedure tbAbastecimentosQTD_ABASTECIMENTOValidate(Sender: TField);
    procedure tbAbastecimentosBeforeDelete(DataSet: TDataSet);
    procedure tvViagensCanSelectRecord(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; var AAllow: Boolean);
    procedure tbAbastecimentosAfterDelete(DataSet: TDataSet);
    procedure tvAbastecimentosNUM_CUPOMPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure tbConsumoBeforePost(DataSet: TDataSet);
    procedure tbConsumoAfterInsert(DataSet: TDataSet);
    procedure actPeriodoExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function ValidaDados(): Boolean;
    function ValidarViagem(): Boolean;
    procedure SearchServicos();
    procedure ExportaTransporte();
    procedure FinalizarViagem();
    procedure FiltroViagens();
    procedure GeraOS(dValorAgregado: Double);
    procedure ConverteServico(sServico: String; dValor: Double);
    procedure GeraContasReceber(iOs: Integer; dtData: TDate);
    procedure CancelarViagem();
    procedure GerarControleKM();
    procedure SetAcessos();
    procedure DetalhesGrade();
    procedure PopulaAbastecimentos();
    procedure SalvaAbastecimentos();
    procedure SetupAbastecimentos();
    procedure SetupControle();
    procedure SalvaControle();
    procedure LocalizaAbastecimento(sCupom: String);
    procedure PopulaClientes();
    procedure PopulaVeiculos();
    procedure PopulaMotoristas();
    procedure PopulaInsumos();
    procedure PopulaConsumos();
    procedure SetupConsumo();
    procedure SalvaConsumo();
    procedure SalvaEstoque();
    procedure CalculaArla();
  public
    { Public declarations }
  end;

var
  frmControleTransportes: TfrmControleTransportes;
  servicos : TServicos;
  os : TOrdemServico;
  contas : TContasReceber;
  veiculos : TVeiculos;
  km : TControleKM;
  acesso : TAcessos;
  cliente : TCliente;
  abastecimento : TAbastecimentos;
  controle: TControleTransporte;
  controles: TObjectList<TControleTransporte>;
  controleDAO: TControleTransporteDAO;
  motoristas: TEntregador;
  insumo : TInsumosTransportes;
  insumos : TObjectList<TInsumosTransportes>;
  insumoDAO : TInsumosTransportesDAO;
  consumo : TConsumoInsumos;
  consumos : TObjectList<TConsumoInsumos>;
  consumoDAO : TConsumoInsumosDAO;
implementation

{$R *.dfm}

uses uGlobais, ufrmPesquisarPessoas, clUtil, ufrmValor, ufrmProcesso;

procedure TfrmControleTransportes.actCancelarExecute(Sender: TObject);
begin
  tbControle.Cancel;
end;

procedure TfrmControleTransportes.actCancelarViagemExecute(Sender: TObject);
begin
  CancelarViagem();
end;

procedure TfrmControleTransportes.actEditarExecute(Sender: TObject);
begin
  if not tbControle.Active then
  begin
    Exit;
  end;
  if tbControle.IsEmpty then
  begin
    Exit;
  end;
  if tbControleCOD_STATUS.AsInteger = 2 then
  begin
    Application.MessageBox('Viagem já cancelada. Impossível editar!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if tbControleCOD_STATUS.AsInteger = 1 then
  begin
    Application.MessageBox('Viagem já finalizada. Impossível editar!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  datTransporte.SetFocus;
  tbControle.Edit;
end;

procedure TfrmControleTransportes.actExcluirExecute(Sender: TObject);
var
  sFiltro : String;
begin
  try
    controleDAO := TControleTransporteDAO.Create();
    if not tbControle.Active then
    begin
      Exit;
    end;
    if tbControle.IsEmpty then
    begin
      Exit;
    end;
    if tbControleCOD_STATUS.AsInteger > 0 then
    begin
      Application.MessageBox('Viagem não pode ser excluída!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
    if Application.MessageBox('Confirma excluir esta viagem ?', PChar('Atenção ' + uGlobais.sUsuario), MB_YESNO + MB_ICONQUESTION) = IDNO then
    begin
      Exit;
    end;
    sFiltro := 'WHERE ID_CONTROLE = ' + tbControleID_CONTROLE.AsString;
    if controleDAO.Delete(sFiltro) then
    begin
      tbControle.Delete;
    end
    else
    begin
      Application.MessageBox('Erro ao excluir Viagem!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONERROR);
    end;
  finally
    controleDAO.Free;
  end;
end;

procedure TfrmControleTransportes.actExportarExecute(Sender: TObject);
begin
  ExportaTransporte();
end;

procedure TfrmControleTransportes.actFecharExecute(Sender: TObject);
begin
  Perform(WM_CLOSE, 0, 0);
end;

procedure TfrmControleTransportes.actFinalizarExecute(Sender: TObject);
begin
  FinalizarViagem();
end;

procedure TfrmControleTransportes.actGravarExecute(Sender: TObject);
begin
  if Application.MessageBox('Confirma gravar esta Viagem?', PChar('Atenção ' + uGlobais.sUsuario), MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  SalvaControle();
  SalvaAbastecimentos();
  SalvaConsumo();
  Application.MessageBox('Dados gravados com sucesso!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONINFORMATION);
end;

procedure TfrmControleTransportes.actIncluirExecute(Sender: TObject);
begin
  datTransporte.SetFocus;
  tbControle.Insert;
  tbControleID_CONTROLE.AsInteger := 0;
  tbControleCOD_STATUS.AsInteger := 0;
  tbAbastecimentos.Close;
  tbAbastecimentos.Open;
end;

procedure TfrmControleTransportes.actLocalizarExecute(Sender: TObject);
begin
  SearchServicos();
end;

procedure TfrmControleTransportes.actPeriodoExecute(Sender: TObject);
begin
  FiltroViagens();
end;

procedure TfrmControleTransportes.cboVisualizacaoPropertiesChange(Sender: TObject);
begin
  if cboVisualizacao.ItemIndex <> 5 then
  begin
    lgPeriodo.Visible := False;
    FiltroViagens();
  end
  else
  begin
    lgPeriodo.Visible := True;
  end;
end;

procedure TfrmControleTransportes.chkDetalhesPropertiesChange(Sender: TObject);
begin
  DetalhesGrade();
end;

procedure TfrmControleTransportes.dsTransporteStateChange(Sender: TObject);
begin
  if TDataSource(Sender).DataSet.State in [dsInsert] then
  begin
    actIncluir.Enabled := False;
    actEditar.Enabled := False;
    actExcluir.Enabled := False;
    actCancelar.Enabled := True;
    actGravar.Enabled := True;
    actCancelarViagem.Enabled := False;
    actFinalizar.Enabled := False;
    actExportar.Enabled := False;
    actLocalizar.Enabled := True;
    actFechar.Enabled := True;
    tvAbastecimentos.Navigator.Buttons.Insert.Enabled := True;
    tvAbastecimentos.Navigator.Buttons.Delete.Enabled := True;
    tvAbastecimentos.Navigator.Buttons.Edit.Enabled := True;
    tvAbastecimentos.Navigator.Buttons.Post.Enabled := True;
    tvAbastecimentos.Navigator.Buttons.Cancel.Enabled := True;
    tvAbastecimentos.Navigator.Buttons.Refresh.Enabled := True;
    dsAbastecimento.AutoEdit := True;
    tvInsumos.Navigator.Buttons.Insert.Enabled := True;
    tvInsumos.Navigator.Buttons.Delete.Enabled := True;
    tvInsumos.Navigator.Buttons.Edit.Enabled := True;
    tvInsumos.Navigator.Buttons.Post.Enabled := True;
    tvInsumos.Navigator.Buttons.Cancel.Enabled := True;
    tvInsumos.Navigator.Buttons.Refresh.Enabled := True;
    dsConsumo.AutoEdit := True;
  end
  else if TDataSource(Sender).DataSet.State in [dsEdit] then
  begin
    actIncluir.Enabled := False;
    actEditar.Enabled := False;
    actExcluir.Enabled := False;
    actCancelar.Enabled := True;
    actGravar.Enabled := True;
    actCancelarViagem.Enabled := False;
    actFinalizar.Enabled := False;
    actExportar.Enabled := False;
    actLocalizar.Enabled := True;
    actFechar.Enabled := True;
    tvAbastecimentos.Navigator.Buttons.Insert.Enabled := True;
    tvAbastecimentos.Navigator.Buttons.Delete.Enabled := True;
    tvAbastecimentos.Navigator.Buttons.Edit.Enabled := True;
    tvAbastecimentos.Navigator.Buttons.Post.Enabled := True;
    tvAbastecimentos.Navigator.Buttons.Cancel.Enabled := True;
    tvAbastecimentos.Navigator.Buttons.Refresh.Enabled := True;
    dsAbastecimento.AutoEdit := True;
    tvInsumos.Navigator.Buttons.Insert.Enabled := True;
    tvInsumos.Navigator.Buttons.Delete.Enabled := True;
    tvInsumos.Navigator.Buttons.Edit.Enabled := True;
    tvInsumos.Navigator.Buttons.Post.Enabled := True;
    tvInsumos.Navigator.Buttons.Cancel.Enabled := True;
    tvInsumos.Navigator.Buttons.Refresh.Enabled := True;
    dsConsumo.AutoEdit := True;
  end
  else if TDataSource(Sender).DataSet.State in [dsBrowse] then
  begin
    actIncluir.Enabled := True;
    actEditar.Enabled := True;
    actExcluir.Enabled := True;
    actCancelar.Enabled := False;
    actGravar.Enabled := False;
    actCancelarViagem.Enabled := True;
    actFinalizar.Enabled := True;
    actExportar.Enabled := True;
    actLocalizar.Enabled := False;
    actFechar.Enabled := True;
    tvAbastecimentos.Navigator.Buttons.Insert.Enabled := False;
    tvAbastecimentos.Navigator.Buttons.Delete.Enabled := False;
    tvAbastecimentos.Navigator.Buttons.Edit.Enabled := False;
    tvAbastecimentos.Navigator.Buttons.Post.Enabled := False;
    tvAbastecimentos.Navigator.Buttons.Cancel.Enabled := False;
    tvAbastecimentos.Navigator.Buttons.Refresh.Enabled := False;
    dsAbastecimento.AutoEdit := False;
    tvInsumos.Navigator.Buttons.Insert.Enabled := False;
    tvInsumos.Navigator.Buttons.Delete.Enabled := False;
    tvInsumos.Navigator.Buttons.Edit.Enabled := False;
    tvInsumos.Navigator.Buttons.Post.Enabled := False;
    tvInsumos.Navigator.Buttons.Cancel.Enabled := False;
    tvInsumos.Navigator.Buttons.Refresh.Enabled := False;
    dsConsumo.AutoEdit := False;
  end;
end;

procedure TfrmControleTransportes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  controle.Free;
  tbControle.Close;
  tbClientes.Close;
  tbVeiculos.Close;
  tbMotoristas.Close;
  tbAbastecimentos.Close;
  tbInsumos.Close();
  tbConsumo.Close();
  Action := caFree;
  frmControleTransportes := Nil;
end;

procedure TfrmControleTransportes.FormCreate(Sender: TObject);
begin
  controle := TControleTransporte.Create();
  FiltroViagens();
end;

procedure TfrmControleTransportes.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then
  begin
    if grdViagens.IsFocused then
    begin
      Exit;
    end;
    if grdAbastecimentos.IsFocused then
    begin
      Exit;
    end;
    if grdInsumos.IsFocused then
    begin
      Exit;
    end;
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfrmControleTransportes.FormShow(Sender: TObject);
begin
  PopulaClientes();
  PopulaVeiculos();
  PopulaMotoristas();
  PopulaInsumos();
  SetAcessos();
  grdViagens.SetFocus;
end;

function TfrmControleTransportes.ValidaDados(): Boolean;
begin
  Result := False;
  if tbControleDAT_TRANSPORTE.AsString.IsEmpty then
  begin
    Application.MessageBox('Informe a data da viagem!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if tbControleCOD_CLIENTE.AsInteger = 0 then
  begin
    Application.MessageBox('Informe o Cliente!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if tbControleDES_OPERACAO.AsString.IsEmpty then
  begin
    Application.MessageBox('Informe o tipo de Operação!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if tbControleCOD_MOTORISTA.AsInteger = 0 then
  begin
    Application.MessageBox('Informe o Motorista!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if tbControleDES_PLACA.AsString.IsEmpty then
  begin
    Application.MessageBox('Informe o Veículo!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if tbControleDES_SERVICO.AsString.IsEmpty then
  begin
    Application.MessageBox('Informe o Serviço!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  Result := True;
end;

procedure TfrmControleTransportes.SearchServicos();
var
  i,x,y : Integer;
  sItem: String;
begin
  try
    if dm.qryROServicos.Active then
    begin
      dm.qryROServicos.Close;
    end;
    x := 0;
    sItem := '';
    if not Assigned(frmPesquisarPessoas) then
    begin
      frmPesquisarPessoas := TfrmPesquisarPessoas.Create(Application);
    end;
    frmPesquisarPessoas.Caption := frmPesquisarPessoas.Caption + ' de Serviços';
    frmPesquisarPessoas.cboCampo.Clear;
    for i := 0 to dm.qryROServicos.FieldCount - 1 do
    begin
      frmPesquisarPessoas.tvPesquisa.ClearItems;
      if dm.qryROServicos.Fields[i].Tag = 1 then
      begin
        x := frmPesquisarPessoas.cboCampo.Properties.Items.Add(Trim(dm.qryROServicos.Fields[i].DisplayLabel));
        frmPesquisarPessoas.lListaCampos.Add(Trim(dm.qryROServicos.Fields[i].FieldName));
      end;
      frmPesquisarPessoas.cboCampo.ItemIndex := 1;
    end;
    frmPesquisarPessoas.qryPesquisa.SQL.Text := 'SELECT COD_SERVICO, DES_SERVICO FROM tbservicos';
    if frmPesquisarPessoas.ShowModal = mrOk then
    begin
      for y := 0 to 0 do
      begin
        sItem :=  frmPesquisarPessoas.tvPesquisa.Controller.SelectedRows[y].DisplayTexts[1];
        tbControleDES_SERVICO.AsString := sItem;
      end;
    end;
  finally
    frmPesquisarPessoas.qryPesquisa.Close;
    frmPesquisarPessoas.qryPesquisa.SQL.Clear;
    FreeAndNil(frmPesquisarPessoas);
  end;
end;

procedure TfrmControleTransportes.ExportaTransporte();
var
  FileExt, sFile: String;
begin
  if not tbControle.Active then
  begin
    Exit;
  end;
  if tbControle.IsEmpty then
  begin
    Exit;
  end;
  try
    tvViagensDES_LOG.Visible := False;
    tvViagens.ViewData.Expand(True);
    sFile := 'transporte_';
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
        ExportGridToExcel(SaveDialog.FileName, grdViagens, False, True, False)
      else if FileExt = '.xml' then
        ExportGridToXML(SaveDialog.FileName, grdViagens, False)
      else if FileExt = '.txt' then
        ExportGridToText(SaveDialog.FileName, grdViagens, False)
      else if FileExt = '.html' then
        ExportGridToHTML(SaveDialog.FileName, grdViagens, False);
      ShellExecute(Handle, 'open', pchar(SaveDialog.FileName), nil, nil, SW_SHOW);
    end;
  finally
    tvViagensDES_LOG.Visible := True;
  end;
end;

procedure TfrmControleTransportes.FinalizarViagem();
var
  dRodado, dValor, dValorAgregado, dValorTotal : Double;
  sServico, sAgregado : String;
  iOS: Integer;
  sLog: TStringList;
begin
  if tbControle.IsEmpty then
  begin
    Exit;
  end;
  controleDAO := TControleTransporteDAO.Create;
  if not ValidaDados() then
  begin
    Exit
  end;
  if not ValidarViagem() then
  begin
    Exit
  end;
  if Application.MessageBox('Confirma Finalizar esta viagem ?', PChar('Atenção ' + uGlobais.sUsuario), MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  dValor := 0;
  dValorAgregado := 0;
  dValorTotal := 0;
  dRodado := 0;
  sServico := '';
  sAgregado := '';
  iOS := 0;
  try
    servicos := TServicos.Create();
    cliente := TCliente.Create();
    sServico := Trim(edtServicos.Text);
    if servicos.getObject(sServico,'DESCRICAO') then
    begin
      dValor := servicos.Valor;
      dValorAgregado := servicos.ValorAgregado;
      sAgregado := servicos.Agregacao;
      dm.qryGetObject.Close;
      dm.qryGetObject.SQL.Clear;
    end
    else
    begin
      dValor := 0;
      sAgregado := 'S';
      dValorAgregado := 0;
    end;
    dRodado := tbControleQTD_KM_RETORNO.AsFloat - tbControleQTD_KM_SAIDA.AsFloat;
    if sAgregado <> 'S' then
    begin
      dValorTotal := dValor * dRodado;
    end
    else
    begin
      dValorTotal := dValor;
    end;
    if dValor = 0 then
    begin
      if Application.MessageBox('Deseja atribuir um valor para este serviço?', PChar('Atenção ' + uGlobais.sUsuario), MB_YESNO + MB_ICONQUESTION) = IDYES then
      begin
        if not Assigned(frmValor) then
        begin
          frmValor := TfrmValor.Create(Application);
        end;
        frmValor.Caption := 'Informe o Valor do Serviço';
        frmValor.lciValor.Caption := 'Valor do Serviço';
        if frmValor.ShowModal = mrOk then
        begin
          dValorTotal := StrToFloatDef(frmValor.curValor.Text,0);
        end;
        FreeAndNil(frmValor);
      end;
    end;
    tbControle.Edit;
    tbControleQTD_KM_RODADO.AsFloat := dRodado;
    tbControleVAL_SERVICO.AsFloat := dValorTotal;
    tbControleCOD_STATUS.AsInteger := 1;
    tbControle.Post;
    SetupControle();
    sLog := TStringList.Create;
    sLog.Append(controle.Log);
    sLog.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss',Now) + ' finalização feita por ' + uGlobais.sUsuario);
    controle.Log := sLog.Text;
    if not controleDAO.Update(controle) then
    begin
      Application.MessageBox('Erro ao Finalizar esta Viagem!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONERROR);
      Exit;
    end;
    cliente.Codigo := tbControleCOD_CLIENTE.AsInteger;
    iOS := StrToIntDef(cliente.getField('DOM_OS', 'CODIGO'),0);
    if not tbAbastecimentos.IsEmpty then
    begin
      // alterar para parametrização
      if Pos(Copy(tbControleDES_PLACA.AsString,1,3), 'LSB,KQS,KWP') > 0 then
      begin
        CalculaArla();
      end;
    end;
    SalvaEstoque();
    if iOS = 1 then
    begin
      GeraOS(dValorAgregado);
    end;
    GerarControleKM();
  finally
    controleDAO.Free;
    cliente.Free;
    servicos.Free;
    sLog.Free;
  end;
end;

function TfrmControleTransportes.ValidarViagem(): Boolean;
begin
  Result := False;
  if tbControleCOD_STATUS.AsInteger = 1 then
  begin
    Application.MessageBox('Viagem já Finalizada', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if tbControleHOR_SAIDA.IsNull then
  begin
    Application.MessageBox('Informe a hora de Saída!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
      timSaida.SetFocus;
    Exit;
  end;
  if tbControleQTD_KM_SAIDA.AsFloat = 0 then
  begin
    Application.MessageBox('Informe o KM da Saída!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
      edtKMSaida.SetFocus;
    Exit;
  end;
  if tbControleHOR_RETORNO.IsNull then
  begin
    Application.MessageBox('Informe a hora de Retorno!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
      timSaida.SetFocus;
    Exit;
  end;
  if tbControleQTD_KM_RETORNO.AsFloat = 0 then
  begin
    Application.MessageBox('Informe o KM do Retorno!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
      edtKMRetorno.SetFocus;
    Exit;
  end;
  if tbControleHOR_RETORNO.AsDateTime < tbControleHOR_SAIDA.AsDateTime then
  begin
    Application.MessageBox('Hora do Retorno menor que a Hora de Saída!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
      timRetorno.SetFocus;
    Exit;
  end;
  if tbControleQTD_KM_RETORNO.AsFloat < tbControleQTD_KM_SAIDA.AsFloat then
  begin
    Application.MessageBox('KM do Retorno menor que o KM de Saída!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
      edtKMRetorno.SetFocus;
    Exit;
  end;
  if (tbControleNUM_SM.AsString.IsEmpty) or (StrToFloatDef(tbControleNUM_SM.AsString,0) = 0) then
  begin
    if Application.MessageBox('Número de SM não informado! Finalizar assim mesmo?', PChar('Atenção ' + uGlobais.sUsuario), MB_YESNO + MB_ICONQUESTION) = IDNO then
      begin
        mskSM.SetFocus;
        Exit;
      end;
  end;
  Result := True;
end;

procedure TfrmControleTransportes.FiltroViagens();
var
  sFiltro : String;
  controleTmp : TControleTransporte;
  dPosicao: Double;
  iContador: Integer;
  iRecords: Integer;
begin
  try
    tbControle.Close;
    if cboVisualizacao.ItemIndex = 0 then
    begin
      sFiltro := 'WHERE DAT_TRANSPORTE >= (DATE_ADD(NOW(), INTERVAL -7 DAY))';
    end;
    if cboVisualizacao.ItemIndex = 1 then
    begin
      sFiltro := 'WHERE MONTH(DAT_TRANSPORTE) = MONTH(NOW()) AND YEAR(DAT_TRANSPORTE) = YEAR(NOW())';
    end;
    if cboVisualizacao.ItemIndex = 2 then
    begin
      sFiltro := 'WHERE YEAR(DAT_TRANSPORTE) = YEAR(NOW())';
    end;
    if cboVisualizacao.ItemIndex = 3 then
    begin
      sFiltro := 'WHERE DAT_TRANSPORTE >= (DATE_ADD(NOW(), INTERVAL -1 YEAR))';
    end;
    if cboVisualizacao.ItemIndex = 4 then
    begin
      sFiltro := '';
    end;
    if cboVisualizacao.ItemIndex = 5 then
    begin
      if datInicio.Date = 0 then
      begin
        Application.MessageBox('Informe a data inicial!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONWARNING);
        datInicio.SetFocus;
        Exit;
      end;
      if datFinal.Date = 0 then
      begin
        Application.MessageBox('Informe a data final!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONWARNING);
        datFinal.SetFocus;
        Exit;
      end;
      if datFinal.Date < datInicio.Date then
      begin
        Application.MessageBox('Data final menor que a data inicial!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONWARNING);
        datFinal.SetFocus;
        Exit;
      end;
      sFiltro := 'WHERE DAT_TRANSPORTE BETWEEN ' + QuotedStr(FormatDateTime('yyyy-mm-dd', datInicio.Date)) + ' AND ' +
                 QuotedStr(FormatDateTime('yyyy-mm-dd', datFinal.Date));
    end;
    if not Assigned(frmProcesso) then
    begin
      frmProcesso := TfrmProcesso.Create(Application);
    end;
    tbControle.Open;
    controleDAO := TControleTransporteDAO.Create();
    controles := controleDAO.FindControle(sFiltro);
    consumoDAO := TConsumoInsumosDAO.Create();
    iRecords := controles.Count ;
    iContador := 0;
    frmProcesso.cxGroupBox1.Caption := 'Gerando a grade. Aguarde...';
    frmProcesso.cxGroupBox1.Refresh;
    frmProcesso.cxProgressBar1.Position := 0;
    frmProcesso.Show;
    for controleTmp in controles do
    begin
      tbControle.Insert;
      tbControleID_CONTROLE.AsInteger := controleTmp.ID;
      tbControleNUM_SM.AsString := controleTmp.SM;
      tbControleDAT_TRANSPORTE.AsDateTime := controleTmp.DataTransporte;
      tbControleCOD_CLIENTE.AsInteger :=controleTmp.Cliente;
      tbControleDES_OPERACAO.AsString := controleTmp.Operacao;
      tbControleDES_PLACA.AsString := controleTmp.Placa;
      tbControleCOD_MOTORISTA.AsInteger := controleTmp.Motorista;
      tbControleQTD_KM_SAIDA.AsFloat := controleTmp.KmSaida;
      tbControleHOR_SAIDA.AsDateTime := controleTmp.HoraSaida;
      tbControleQTD_KM_RETORNO.AsFloat := controleTmp.KmRetorno;
      tbControleHOR_RETORNO.AsFloat := controleTmp.HoraRetorno;
      tbControleQTD_KM_RODADO.AsFloat := controleTmp.KmRodado;
      tbControleDES_SERVICO.AsString := controleTmp.Servico;
      tbControleVAL_TOTAL_COMBUSTIVEL.AsFloat := abastecimento.TotalControle(controleTMP.ID);
      tbControleVAL_TOTAL_INSUMOS.AsFloat := consumoDAO.TotalConsumo(controleTMP.ID);
      tbControleDES_OBS.AsString := controleTmp.Obs;
      tbControleVAL_SERVICO.AsFloat := controleTmp.ValServico;
      tbControleCOD_STATUS.AsInteger := controleTmp.Status;
      tbControleDES_LOG.AsString := controleTmp.Log;
      dPosicao := (iContador / iRecords) * 100;
      Inc(iContador,1);
      frmProcesso.cxProgressBar1.Position := dPosicao;
      frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
      frmProcesso.cxProgressBar1.Refresh;
      tbControle.Post;
    end;
    if not tbControle.IsEmpty then
    begin
      tbControle.First;
      PopulaAbastecimentos();
      DetalhesGrade();
    end;
  finally
    FreeAndNil(frmProcesso);
    controleDAO.Free;
  end;
end;

procedure TfrmControleTransportes.GeraOS(dValorAgregado: Double);
var
  sVeiculo, sCodigo, sMensagem : String;
  sTipo: String;
begin
  try
    sVeiculo := '';
    sCodigo := '';
    veiculos := TVeiculos.Create();
    os := TOrdemServico.Create();
    motoristas := TEntregador.Create;
    veiculos.Placa := controle.Placa;
    sVeiculo := veiculos.getField('COD_VEICULO','PLACA');
    sCodigo := veiculos.getField('COD_ENTREGADOR','PLACA');
    motoristas.Cadastro := StrToIntDef(sCodigo,0);
    sTipo := motoristas.getField('DOM_FUNCIONARIO','CADASTRO');
    os.Data := controle.DataTransporte;
    os.Entregador := controle.Motorista;
    os.Veiculo := StrToIntDef(sVeiculo,0);
    os.Cliente := controle.Cliente;
    os.Rota := controle.Operacao;
    os.KmInicial := Trunc(controle.KmSaida);
    os.HoraSaida :=  FormatDateTime('hh:mm', controle.HoraSaida);
    os.KmFinal := Trunc(controle.KmRetorno);
    os.HoraRetorno :=  FormatDateTime('hh:mm', controle.HoraRetorno);
    ConverteServico(controle.Servico, controle.ValServico);
    os.ValorDiaria := controle.ValServico;
    os.Id := controle.ID;
    os.Executor := uGlobais.sUsuario;
    os.Manutencao := Now();
    if not os.Insert() then
    begin
      Application.MessageBox('Ocorreu um problema ao se tentar gerar a OS do Cliente!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONERROR);
      Exit;
    end;
    GeraContasReceber(os.Numero,os.Data);
    //mudar esta rotina com base no novo cadastro
    if StrToIntDef(sCodigo,0) <> 0 then
    begin
      if sTipo <> '0' then
      begin
        if dValorAgregado > 0 then
        begin
          sVeiculo := '';
          sCodigo := '';
          veiculos := TVeiculos.Create();
          os := TOrdemServico.Create();
          os.Data := controle.DataTransporte;
          os.Entregador := controle.Motorista;
          veiculos.Placa := controle.Placa;
          sVeiculo := veiculos.getField('COD_VEICULO','PLACA');
          os.Veiculo := StrToIntDef(sVeiculo,0);
          os.Cliente := 1010;
          os.Rota := controle.Operacao;
          os.KmInicial := Trunc(controle.KmSaida);
          os.HoraSaida :=  FormatDateTime('hh:mm', controle.HoraSaida);
          os.KmFinal := Trunc(controle.KmRetorno);
          os.HoraRetorno :=  FormatDateTime('hh:mm', controle.HoraRetorno);
          ConverteServico(controle.Servico, dValorAgregado);
          os.ValorDiaria := dValorAgregado;
          os.Id := controle.ID;
          os.Executor := uGlobais.sUsuario;
          os.Manutencao := Now();
          if not os.Insert() then
          begin
            Application.MessageBox('Ocorreu um problema ao se tentar gerar a OS do Agregado!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONERROR);
            Exit;
          end;
        end
        else
        begin
          sMensagem := 'Atenção ' + uGlobais.sNomeUsuario + '! Não existe um valor para o agregado nesta OS. Para contabilização ' +
                       'e paragamento ao Agregado uma Os deverá ser gerada na tela Ordens de Serviços.';
          Application.MessageBox(PChar(sMensagem), PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONWARNING);
        end;
      end;
    end;
  finally
    os.Free;
    veiculos.Free;
  end;
end;

procedure TfrmControleTransportes.ConverteServico(sServico: String; dValor: Double);
var
  sItens: TStringList;
  x : Integer;
begin
  try
    x := 0;
    os.Descricao := '';
    sItens := TStringList.Create();
    Inc(x);
    sItens.Add(IntToStr(x) + '|' + sServico + '|' +
               FloatToStr(dValor) + '|');
    os.Descricao := sItens.Text;
  finally
    sItens.Free;
  end;
end;

procedure TfrmControleTransportes.GeraContasReceber(iOs: Integer; dtData: TDate);
var
  sData, sDescricao: String;
begin
  try
    contas := TContasReceber.Create();
    sData := '';
    sDescricao := '';
    if contas.getObject(IntToStr(iOs), 'OS') then
    begin
      if contas.Baixado = 'S' then
      begin
        Application.MessageBox('Lançamento em Contas a contas referente a esta OS já foi baixado.', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
        Exit;
      end;
      if not(contas.Delete('OS')) then
      begin
        Application.MessageBox('Erro ao Excluir o Lançamento em Contas a contas referente a esta OS.', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
        Exit;
      end;
      contas.Data := dtData;
      sDescricao := controle.Servico;
      contas.Descricao := Trim(sDescricao);
      contas.Valor := controle.ValServico;
      contas.Cliente := controle.Cliente;
      sData := FormatDateTime('dd/mm/yyyy', IncDay(Now(),15));
      contas.Vencimento := StrToDate(sData);
      contas.Os := iOs;
      contas.NossoNumero := '';
      contas.Baixado := 'N';
      contas.Documento := 'OS Nº. ' + IntToStr(iOs);
      contas.Executor := uGlobais.sUsuario;
      contas.Manutencao := Now;
      if not(contas.Insert()) then
      begin
        Application.MessageBox
          (PChar('Erro ao Incluir o Lançamento em Contas a contas referente a OS Nº. ' + IntToStr(iOs)), Pchar('Atenção' +
           uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
        Exit;
      end;
    end;
  finally
    contas.Free;
  end;
end;

procedure TfrmControleTransportes.CancelarViagem();
var
  sLog : TStringList;
begin
  try
    if tbControle.IsEmpty then
    begin
      Exit;
    end;
    controleDAO := TControleTransporteDAO.Create;
    if tbControleCOD_STATUS.AsInteger = 1 then
    begin
      Application.MessageBox('Viagem não pode ser cancelada!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
    if tbControleCOD_STATUS.AsInteger = 2 then
    begin
      Application.MessageBox('Viagem já está cancelada!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
    if tbControleDES_OBS.AsString.IsEmpty then
    begin
      Application.MessageBox('Informe no campo Observações o motivo do cancelamento!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
      memObs.SetFocus;
      Exit;
    end;
    if Application.MessageBox('Confirma o cancelamento esta viagem ?', PChar('Atenção ' + uGlobais.sUsuario), MB_YESNO + MB_ICONQUESTION) = IDNO then
    begin
      Exit;
    end;
    tbControle.Edit;
    tbControleCOD_STATUS.AsInteger := 2;
    tbControle.Post;
    SetupControle();
    sLog := TStringList.Create;
    sLog.Append(controle.Log);
    sLog.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss',Now) + ' Cancelamento feito por ' + uGlobais.sUsuario);
    controle.Log := sLog.Text;
    if not controleDAO.Update(controle) then
    begin
      Application.MessageBox('Erro no canclamento da Viagem!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONERROR);
    end;
  finally
    controleDAO.Free;
    sLog.Free;
  end;

end;

procedure TfrmControleTransportes.GerarControleKM();
begin
  try
    km := TControleKM.Create();
    km.Data := tbControleDAT_TRANSPORTE.AsDateTime;
    km.Placa := tbControleDES_PLACA.AsString;
    km.KMInicial := tbControleQTD_KM_SAIDA.AsInteger;
    km.HoraSaida := FormatDateTime('hh:mm', tbControleHOR_SAIDA.AsDateTime);
    km.KMFinal := tbControleQTD_KM_RETORNO.AsInteger;
    km.HoraRetorno := FormatDateTime('hh:mm', tbControleHOR_RETORNO.AsDateTime);
    km.Entregador := tbControleCOD_MOTORISTA.AsInteger;
    km.Executor := uGlobais.sUsuario;
    km.Manutencao := Now();
    if not km.Insert then
    begin
      Application.MessageBox('Erro ao inserir controle de KM!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONERROR);
      Exit;
    end;
  finally
    km.Free;
  end;
end;

procedure TfrmControleTransportes.SetAcessos();
begin
  try
    acesso := TAcessos.Create;
    acesso.SetNivel(aclTransporte);
  if uGlobais.iNivelUsuario = 0 then
  begin
    tvViagensVAL_SERVICO.Visible := True;
    tvViagensDES_LOG.Visible := True;
    tbConsumoVAL_CONSUMO.Visible := True;
  end
  else
  begin
    tvViagensVAL_SERVICO.Visible := False;
    tvViagensDES_LOG.Visible := False;
    tbConsumoVAL_CONSUMO.Visible := False;
  end;
  finally
    acesso.Free;
  end;
end;

procedure TfrmControleTransportes.tbAbastecimentosAfterDelete(DataSet: TDataSet);
begin
  actCancelarExecute(Self);
end;

procedure TfrmControleTransportes.tbAbastecimentosBeforeDelete(DataSet: TDataSet);
begin
  try
    abastecimento := TAbastecimentos.Create();
    SetupAbastecimentos;
    if abastecimento.Numero > 0 then
    begin
      if not abastecimento.Delete('NUMERO') then
      begin
        Application.MessageBox('Erro ao Excluir o Abastecimento!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONERROR);
        Exit;
      end;
    end;
  finally
    abastecimento.Free;
  end;

end;

procedure TfrmControleTransportes.tbAbastecimentosQTD_ABASTECIMENTOValidate(Sender: TField);
begin
  tbAbastecimentosVAL_TOTAL.AsFloat := tbAbastecimentosQTD_ABASTECIMENTO.AsFloat * tbAbastecimentosVAL_UNITARIO.AsFloat;
end;

procedure TfrmControleTransportes.tbAbastecimentosVAL_UNITARIOValidate(Sender: TField);
begin
  tbAbastecimentosVAL_TOTAL.AsFloat := tbAbastecimentosQTD_ABASTECIMENTO.AsFloat * tbAbastecimentosVAL_UNITARIO.AsFloat;
end;

procedure TfrmControleTransportes.tbConsumoAfterInsert(DataSet: TDataSet);
begin
  if not tbConsumo.IsLoading then
  begin
    if tbConsumoID_CONSUMO.AsInteger >  0 then
    begin
      tbConsumoID_CONSUMO.AsInteger := 0;
      tbConsumoDAT_CONSUMO.AsDateTime := tbControleDAT_TRANSPORTE.AsDateTime;
      tbConsumoID_CONTROLE.AsInteger := tbControleID_CONTROLE.AsInteger;
      tbConsumoDES_PLACA.AsString := tbControleDES_PLACA.AsString;
      tbConsumoDOM_CONSUMO.AsString := 'N';
    end;
  end;
end;

procedure TfrmControleTransportes.tbConsumoBeforePost(DataSet: TDataSet);
begin
  if tbConsumoID_INSUMO.AsInteger = 0 then
  begin
    Application.MessageBox('Informe o Insumo!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONWARNING);
    Abort;
    Exit;
  end;
  if tbConsumoQTD_CONSUMO.AsFloat = 0 then
  begin
    Application.MessageBox('Informe a Quantidade!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONWARNING);
    Abort;
    Exit;
  end;
end;

procedure TfrmControleTransportes.tvAbastecimentosNUM_CUPOMPropertiesValidate(Sender: TObject; var DisplayValue: Variant;
  var ErrorText: TCaption; var Error: Boolean);
begin
  LocalizaAbastecimento(DisplayValue);
end;

procedure TfrmControleTransportes.tvViagensCanSelectRecord(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  var AAllow: Boolean);
begin
  PopulaAbastecimentos();
  PopulaConsumos();
end;

procedure TfrmControleTransportes.tvViagensDblClick(Sender: TObject);
begin
  DetalhesGrade();
end;

procedure TfrmControleTransportes.DetalhesGrade();
begin
  tvViagens.ViewData.Expand(True);
end;

procedure TfrmControleTransportes.PopulaAbastecimentos();
var
  i: Integer;
  sId: string;
begin
  try
    i := 0;
    abastecimento := TAbastecimentos.Create();
    sId := tbControleID_CONTROLE.AsString;
    tbAbastecimentos.Close;
    tbAbastecimentos.Open;
    if abastecimento.getObject(sId,'CONTROLE') then
    begin
      while not dm.qryGetObject.Eof do
      begin
        tbAbastecimentos.Insert;
        for i := 0 to dm.qryGetObject.FieldCount - 1 do
        begin
          tbAbastecimentos.FieldByName(dm.qryGetObject.Fields[i].FieldName).Value := dm.qryGetObject.Fields[i].Value;
        end;
        tbAbastecimentos.Post;
        dm.qryGetObject.Next;
      end;
    end;
  finally
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
    if not tbAbastecimentos.IsEmpty then
    begin
      tbAbastecimentos.First;
    end;
    abastecimento.Free;
  end;
end;

procedure TfrmControleTransportes.SalvaAbastecimentos();
begin
  try
    abastecimento := TAbastecimentos.Create();
    if tbAbastecimentos.IsEmpty then
    begin
      Exit;
    end;
    tbAbastecimentos.First;
    while not tbAbastecimentos.Eof do
    begin
      SetupAbastecimentos;
      if abastecimento.Numero = 0 then
      begin
        if not abastecimento.Insert() then
        begin
          Application.MessageBox(PChar('Erro ao incluir o abastecimento do cupom ' + abastecimento.Cupom + '!'), PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
        end;
        tbAbastecimentos.Edit;
        tbAbastecimentosNUM_ABASTECIMENTO.AsInteger := abastecimento.Numero;
        tbAbastecimentos.Post;
      end
      else
      begin
        if not abastecimento.Update() then
        begin
          Application.MessageBox(PChar('Erro ao alterar o abastecimento do cupom ' + abastecimento.Cupom + '!'), PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
        end;
      end;
      tbAbastecimentos.Next;
    end;
    tbAbastecimentos.First;
  finally
    abastecimento.Free;
  end;
end;

procedure TfrmControleTransportes.SetupAbastecimentos();
begin
  abastecimento.Numero := tbAbastecimentosNUM_ABASTECIMENTO.AsInteger;
  abastecimento.Cupom := tbAbastecimentosNUM_CUPOM.AsString;
  abastecimento.Entregador := controle.Motorista;
  abastecimento.Nome := lcbMotorista.Text;
  abastecimento.Placa := controle.Placa;
  abastecimento.Data := controle.DataTransporte;
  abastecimento.Produto := 'BIO DIESEL';
  abastecimento.Quantidade := tbAbastecimentosQTD_ABASTECIMENTO.AsFloat;
  abastecimento.Unitario := tbAbastecimentosVAL_UNITARIO.AsFloat;
  abastecimento.Total := tbAbastecimentosVAL_TOTAL.AsFloat;
  abastecimento.Executante := uGlobais.sUsuario;
  abastecimento.Manutencao := Now();
  abastecimento.Descontado := 'S';
  abastecimento.Extrato := 0;
  abastecimento.Verba := 0;
  abastecimento.Desconto := 0;
  abastecimento.Base := controle.DataTransporte;
  abastecimento.Controle := controle.ID;
end;

procedure TfrmControleTransportes.SetupControle();
begin
  controle.ID := tbControleID_CONTROLE.AsInteger;
  controle.SM := tbControleNUM_SM.AsString;
  controle.DataTransporte := tbControleDAT_TRANSPORTE.AsDateTime;
  controle.Cliente := tbControleCOD_CLIENTE.AsInteger;
  controle.Operacao := tbControleDES_OPERACAO.AsString;
  controle.Placa := tbControleDES_PLACA.AsString;
  controle.Motorista := tbControleCOD_MOTORISTA.AsInteger;
  controle.KmSaida := tbControleQTD_KM_SAIDA.AsFloat;
  controle.HoraSaida := tbControleHOR_SAIDA.AsDateTime;
  controle.KmRetorno := tbControleQTD_KM_RETORNO.AsFloat;
  controle.HoraRetorno := tbControleHOR_RETORNO.AsDateTime;
  controle.KmRodado := tbControleQTD_KM_RODADO.AsFloat;
  controle.Servico := tbControleDES_SERVICO.AsString;
  controle.Obs := tbControleDES_OBS.AsString;
  controle.ValServico := tbControleVAL_SERVICO.AsFloat;
  controle.Status := tbControleCOD_STATUS.AsInteger;
  controle.Log := tbControleDES_LOG.AsString;
end;

procedure TfrmControleTransportes.SalvaControle();
var
  sLog : TStringList;
begin
  try
    tbControle.Post;
    if tbControleQTD_KM_RETORNO.AsFloat > 0 then
    begin
      if tbControleQTD_KM_SAIDA.AsFloat > 0 then
      begin
        tbControle.Edit;
        tbControleQTD_KM_RODADO.AsFloat := tbControleQTD_KM_RETORNO.AsFloat - tbControleQTD_KM_SAIDA.AsFloat;
        tbControle.Post;
      end;
    end;
    SetupControle();
    sLog := TStringList.Create;
    sLog.Append(controle.Log);
    sLog.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss',Now) + ' manutenção feita por ' + uGlobais.sUsuario);
    controle.Log := sLog.Text;
    controleDAO := TControleTransporteDAO.Create();
    if controle.ID = 0 then
    begin
      if not controleDAO.Insert(controle) then
      begin
        Application.MessageBox('Erro ao gravar a Viagem!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONERROR);
        Exit;
      end
      else
      begin
        tbControle.Edit;
        tbControleID_CONTROLE.AsInteger := controle.ID;
        tbControle.Post;
      end;
    end
    else
    begin
      if not controleDAO.Update(controle) then
      begin
        Application.MessageBox('Erro ao gravar a Viagem!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONERROR);
        Exit;
      end;
    end;
  finally
    controleDAO.Free;
    sLog.Free;
  end;
end;

procedure TfrmControleTransportes.LocalizaAbastecimento(sCupom: String);
begin
  try
    abastecimento := TAbastecimentos.Create;
    if abastecimento.getObject(sCupom,'CUPOM') then
    begin
      tbAbastecimentosNUM_ABASTECIMENTO.AsInteger := abastecimento.Numero;
      tbAbastecimentosNUM_CUPOM.AsString := abastecimento.Cupom;
      tbAbastecimentosCOD_ENTREGADOR.AsInteger := abastecimento.Entregador;
      tbAbastecimentosDES_PLACA.AsString := abastecimento.Placa;
      tbAbastecimentosDAT_ABASTECIMENTO.AsDateTime := abastecimento.Data;
      tbAbastecimentosDES_PRODUTO.AsString := abastecimento.Produto;
      tbAbastecimentosQTD_ABASTECIMENTO.AsFloat := abastecimento.Quantidade;
      tbAbastecimentosVAL_UNITARIO.AsFloat := abastecimento.Unitario;
      tbAbastecimentosVAL_TOTAL.AsFloat := abastecimento.Total;
      tbAbastecimentosNOM_EXECUTANTE.AsString := abastecimento.Executante;
      tbAbastecimentosDAT_MANUTENCAO.AsDateTime := abastecimento.Manutencao;
      tbAbastecimentosDOM_DESCONTO.AsString := abastecimento.Descontado;
      tbAbastecimentosNUM_EXTRATO.AsString := '';
    end;
  finally
    abastecimento.Free;
  end;
end;

procedure TfrmControleTransportes.PopulaClientes();
begin
  try
    cliente := TCliente.Create();
    tbClientes.Close;
    if cliente.getObjects() then
    begin
      tbClientes.LoadFromDataSet(dm.qryGetObject);
    end;
  finally
    cliente.Free;
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
  end;
end;

procedure TfrmControleTransportes.PopulaVeiculos();
begin
  try
    veiculos := TVeiculos.Create();
    tbVeiculos.Open;
    if veiculos.getObjects() then
    begin
      tbVeiculos.LoadFromDataSet(dm.qryGetObject);
    end;
  finally
    veiculos.Free;
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
  end;
end;

procedure TfrmControleTransportes.PopulaMotoristas();
var
  sFiltro: String;
begin
  try
    sFiltro := 'DOM_FUNCIONARIO IN (' + QuotedStr('F') + QuotedStr('T') + ') AND COD_STATUS <= 1';
    motoristas := TEntregador.Create();
    tbMotoristas.Open;
    if motoristas.getObject('FILTRO', sFiltro) then
    begin
      tbMotoristas.LoadFromDataSet(dm.qryGetObject);
    end;
  finally
    motoristas.Free;
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
  end;
end;

procedure TfrmControleTransportes.PopulaInsumos();
var
  iRecords: Integer;
  iContador: Integer;
  insumoTmp : TInsumosTransportes;
begin
  try
    tbInsumos.Close;
    if not Assigned(frmProcesso) then
    begin
      frmProcesso := TfrmProcesso.Create(Application);
    end;
    tbInsumos.Open;
    insumoDAO := TInsumosTransportesDAO.Create();
    insumos := insumoDAO.FindInsumo('');
    iRecords := insumos.Count ;
    iContador := 0;
    frmProcesso.cxGroupBox1.Caption := 'Carregando os Insumos. Aguarde...';
    frmProcesso.cxGroupBox1.Refresh;
    frmProcesso.cxProgressBar1.Position := 0;
    frmProcesso.Show;
    for insumoTmp in insumos do
    begin
      tbInsumos.Insert;
      tbInsumosID_INSUMO.AsInteger := insumoTmp.ID;
      tbInsumosDES_INSUMO.AsString := insumoTmp.Descricao;
      tbInsumosDES_UNIDADE.AsString := insumoTmp.Unidade;
      tbInsumosDES_LOG.AsString := insumoTmp.Log;
      dPosicao := (iContador / iRecords) * 100;
      Inc(iContador,1);
      frmProcesso.cxProgressBar1.Position := dPosicao;
      frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
      frmProcesso.cxProgressBar1.Refresh;
      tbInsumos.Post;
    end;
  finally
    FreeAndNil(frmProcesso);
    insumoDAO.Free;
  end;
end;

procedure TfrmControleTransportes.PopulaConsumos();
var
  iRecords: Integer;
  iContador: Integer;
  consumoTmp: TConsumoInsumos;
  sFiltro : String;
begin
  try
    tbConsumo.Close;
    if not Assigned(frmProcesso) then
    begin
      frmProcesso := TfrmProcesso.Create(Application);
    end;
    tbConsumo.Open;
    consumoDAO := TConsumoInsumosDAO.Create();
    sFiltro := 'WHERE ID_CONTROLE = ' + tbControleID_CONTROLE.AsString;
    consumos := consumoDAO.FindConsumo(sFiltro);
    iRecords := consumos.Count ;
    iContador := 0;
    frmProcesso.cxGroupBox1.Caption := 'Carregando os Consumos. Aguarde...';
    frmProcesso.cxGroupBox1.Refresh;
    frmProcesso.cxProgressBar1.Position := 0;
    frmProcesso.Show;
    tbConsumo.IsLoading := True;
    for consumoTmp in consumos do
    begin
      tbConsumo.Insert;
      tbConsumoID_CONSUMO.AsInteger := consumoTmp.ID;
      tbConsumoID_INSUMO.AsInteger := consumoTmp.Insumo;
      tbConsumoDAT_CONSUMO.AsDateTime := consumoTmp.Data;
      tbConsumoQTD_KM_CONSUMO.AsFloat := consumoTmp.KMConsumo;
      tbConsumoID_CONTROLE.AsInteger := consumoTmp.Controle;
      tbConsumoQTD_CONSUMO.AsFloat := consumoTmp.Consumo;
      tbConsumoVAL_CONSUMO.AsFloat := consumoTmp.Valor;
      tbConsumoDES_LOG.AsString := consumoTmp.Log;
      tbConsumoDES_PLACA.AsString := consumoTmp.Placa;
      dPosicao := (iContador / iRecords) * 100;
      Inc(iContador,1);
      frmProcesso.cxProgressBar1.Position := dPosicao;
      frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
      frmProcesso.cxProgressBar1.Refresh;
      tbConsumo.Post;
    end;
  finally
    tbConsumo.IsLoading := False;
    FreeAndNil(frmProcesso);
    consumoDAO.Free;
  end;
end;

procedure TfrmControleTransportes.SetupConsumo();
begin
  consumo.ID := tbConsumoID_CONSUMO.AsInteger;
  consumo.Insumo := tbConsumoID_INSUMO.AsInteger;
  consumo.Placa := tbConsumoDES_PLACA.AsString;
  consumo.Data := tbConsumoDAT_CONSUMO.AsDateTime;
  consumo.KMConsumo := tbConsumoQTD_KM_CONSUMO.AsFloat;
  consumo.Controle := tbConsumoID_CONTROLE.AsInteger;
  consumo.Consumo := tbConsumoQTD_CONSUMO.AsFloat;
  consumo.Valor := tbConsumoVAL_CONSUMO.AsFloat;
  consumo.Estoque := tbConsumoDOM_CONSUMO.AsString;
  consumo.Log := tbConsumoDES_LOG.AsString;
end;

procedure TfrmControleTransportes.SalvaConsumo();
var
  sLog: TStringList;
begin
  try
    consumo := TConsumoInsumos.Create();
    consumoDAO := TConsumoInsumosDAO.Create();
    if tbConsumo.IsEmpty then
    begin
      Exit;
    end;
    tbConsumo.First;
    while not tbConsumo.Eof do
    begin
      SetupConsumo();
      sLog := TStringList.Create;
      sLog.Append(controle.Log);
      sLog.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss',Now) + ' manutenção feita por ' + uGlobais.sUsuario);
      consumo.Log := sLog.Text;
      if consumo.ID = 0 then
      begin
       consumo.Data := tbControleDAT_TRANSPORTE.AsDateTime;
       consumo.Controle := tbControleID_CONTROLE.AsInteger;
       consumo.Placa := tbControleDES_PLACA.AsString;
       consumo.Estoque := 'N';
        if not consumoDAO.Insert(consumo) then
        begin
          Application.MessageBox(PChar('Erro ao incluir o Insumo ' + IntToStr(consumo.Insumo) + '!'), PChar('Atenção ' +
                                 uGlobais.sUsuario), MB_OK + MB_ICONERROR);
          Exit;
        end;
        tbConsumo.Edit;
        tbConsumoID_CONSUMO.AsInteger := consumo.ID;
        tbConsumo.Post;
      end
      else
      begin
        if not consumoDAO.Update(consumo) then
        begin
          Application.MessageBox(PChar('Erro ao alterar o Insumo ' + IntToStr(consumo.Insumo) + '!'), PChar('Atenção ' +
                                 uGlobais.sUsuario), MB_OK + MB_ICONERROR);
          Exit;
        end;
      end;
      sLog.Free;
      tbConsumo.Next;
    end;
  finally
    consumo.Free;
    consumoDAO.Free;
    if not tbConsumo.IsEmpty then
    begin
      tbConsumo.First;
    end;
  end;
end;

procedure TfrmControleTransportes.SalvaEstoque();
var
  estoqueDAO : TEstoqueInsumosDAO;
  dValor : Double;
  sLog: TStringList;
begin
  try
    estoqueDAO := TEstoqueInsumosDAO.Create();
    consumo := TConsumoInsumos.Create();
    consumoDAO := TConsumoInsumosDAO.Create();
    if tbConsumo.IsEmpty then
    begin
      Exit;
    end;
    tbConsumo.First;
    while not tbConsumo.Eof do
    begin
      SetupConsumo();
      sLog := TStringList.Create;
      sLog.Append(controle.Log);
      sLog.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss',Now) + ' manutenção feita por ' + uGlobais.sUsuario);
      consumo.Log := sLog.Text;
      if consumo.Estoque <> 'S' then
      begin
        dValor := 0;
        dValor := estoqueDAO.AtualizaEstoque(consumo.Insumo, consumo.Consumo);
        consumo.Valor := dValor;
        consumo.Estoque := 'S';
        if not consumoDAO.Update(consumo) then
        begin
          Application.MessageBox(PChar('Erro ao alterar o Insumo ' + IntToStr(consumo.Insumo) + '!'), PChar('Atenção ' +
                                 uGlobais.sUsuario), MB_OK + MB_ICONERROR);
          Exit;
        end;
        tbConsumo.Edit;
        tbConsumoVAL_CONSUMO.AsFloat := consumo.Valor;
        tbConsumoDOM_CONSUMO.AsString := consumo.Estoque;
        tbConsumo.Post;
      end;
      sLog.Free;
      tbConsumo.Next;
    end;
  finally
    estoqueDAO.Free;
    consumo.Free;
    consumoDAO.Free;
    if not tbConsumo.IsEmpty then
    begin
      tbConsumo.First;
    end;
  end;
end;

procedure TfrmControleTransportes.CalculaArla();
var
  estoqueDAO : TEstoqueInsumosDAO;
  dConsumo: Double;
  dCombustivel : Double;
begin
  try
    estoqueDAO := TEstoqueInsumosDAO.Create();
    dConsumo := 0;
    dCombustivel := 0;
    tbAbastecimentos.First;
    while not tbAbastecimentos.Eof do
    begin
      dCombustivel := dCombustivel + tbAbastecimentosQTD_ABASTECIMENTO.AsFloat;
      tbAbastecimentos.Next;
    end;
    dConsumo := dCombustivel * 0.02;
    tbConsumo.Insert;
    tbConsumoID_CONSUMO.AsInteger := 0;
    tbConsumoID_INSUMO.AsInteger := 1;
    tbConsumoDAT_CONSUMO.AsDateTime := tbControleDAT_TRANSPORTE.AsDateTime;
    tbConsumoQTD_KM_CONSUMO.AsFloat := tbControleQTD_KM_RETORNO.AsFloat;
    tbConsumoID_CONTROLE.AsInteger := tbControleID_CONTROLE.AsInteger;
    tbConsumoQTD_CONSUMO.AsFloat := dConsumo;
    tbConsumoVAL_CONSUMO.AsFloat := 0;
    tbConsumoDES_PLACA.AsString := tbControleDES_PLACA.AsString;
    tbConsumoDOM_CONSUMO.AsString := 'N';
    tbConsumo.Post;
    SalvaConsumo();
  finally
    tbAbastecimentos.First;
    estoqueDAO.Free;
  end;
end;



end.
