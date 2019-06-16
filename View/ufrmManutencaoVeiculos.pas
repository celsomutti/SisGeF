unit ufrmManutencaoVeiculos;

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
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxLabel, dxSkinscxPCPainter, dxLayoutContainer, dxLayoutControl, Data.DB, dxmdaset,
  dxLayoutcxEditAdapters, cxTextEdit, cxMaskEdit, cxDropDownEdit, System.Actions, Vcl.ActnList, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxCalendar, dxLayoutControlAdapters, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxDBEdit, cxCurrencyEdit, cxImageComboBox, cxMemo;

type
  TfrmManutencaoVeiculos = class(TForm)
    cxLabel27: TcxLabel;
    lcgRoot: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    tbItens: TdxMemData;
    tbItensID_ITEM: TIntegerField;
    tbItensDES_ITEM: TStringField;
    tbItensID_INSUMO: TIntegerField;
    tbItensDES_LOG: TMemoField;
    dsItens: TDataSource;
    cboVisualizar: TcxComboBox;
    lciVisualizar: TdxLayoutItem;
    aclManutencao: TActionList;
    actIncluir: TAction;
    actEditar: TAction;
    actExcluir: TAction;
    actCancelar: TAction;
    actGravar: TAction;
    actCancelarViagem: TAction;
    actFinalizar: TAction;
    actExportar: TAction;
    actFechar: TAction;
    actLocalizar: TAction;
    actPeriodo: TAction;
    datInicio: TcxDateEdit;
    lciDataInicio: TdxLayoutItem;
    datFinal: TcxDateEdit;
    lciFinal: TdxLayoutItem;
    lcgPeriodo: TdxLayoutGroup;
    cxButton1: TcxButton;
    lciExecutar: TdxLayoutItem;
    lcgVisualizar: TdxLayoutGroup;
    tvManutencao: TcxGridDBTableView;
    lvManutencao: TcxGridLevel;
    grdManutencao: TcxGrid;
    liGrade: TdxLayoutItem;
    lcgDados: TdxLayoutGroup;
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
    dsVeiculos: TDataSource;
    tbManutencao: TdxMemData;
    tbManutencaoID_MANUTENCAO: TIntegerField;
    tbManutencaoDES_TIPO: TWideStringField;
    tbManutencaoCOD_VEICULO: TIntegerField;
    tbManutencaoCOD_MOTORISTA: TIntegerField;
    tbManutencaoID_ITEM: TIntegerField;
    tbManutencaoDAT_MANUTENCAO: TDateField;
    tbManutencaoQTD_KM_MANUTENCAO: TFloatField;
    tbManutencaoDAT_PREVISAO: TDateField;
    tbManutencaoQTD_KM_PREVISAO: TFloatField;
    tbManutencaoVAL_CUSTO_MANUTENCAO: TFloatField;
    tbManutencaoDAT_LIBERACAO: TDateField;
    tbManutencaoDOM_SITUACAO: TIntegerField;
    tbManutencaoDES_OBS: TWideMemoField;
    tbManutencaoDES_ARQUIVO: TWideStringField;
    tbManutencaoCOD_CCUSTO: TIntegerField;
    tbManutencaoDES_LOG: TWideMemoField;
    dsManutencao: TDataSource;
    edtID: TcxDBMaskEdit;
    liID: TdxLayoutItem;
    cboTipoManutencao: TcxDBComboBox;
    liTipo: TdxLayoutItem;
    lcbPlaca: TcxDBLookupComboBox;
    liVeiculo: TdxLayoutItem;
    lcbVeiculo: TcxDBLookupComboBox;
    liDescricaoVeiculo: TdxLayoutItem;
    dsMotoristas: TDataSource;
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
    edtCodigoMotorista: TcxDBMaskEdit;
    liMotorista: TdxLayoutItem;
    lcbMotorista: TcxDBLookupComboBox;
    liNomeMotorista: TdxLayoutItem;
    lcgDados1: TdxLayoutGroup;
    lcbItemManutencao: TcxDBLookupComboBox;
    liItens: TdxLayoutItem;
    lcgDados2: TdxLayoutGroup;
    datManutencao: TcxDBDateEdit;
    liDataManutencao: TdxLayoutItem;
    edtKMManutencao: TcxDBCurrencyEdit;
    liKMManutencao: TdxLayoutItem;
    edtcustoManutencao: TcxDBCurrencyEdit;
    liCustoManutencao: TdxLayoutItem;
    cxDBImageComboBox1: TcxDBImageComboBox;
    liSituacao: TdxLayoutItem;
    edtObs: TcxDBMemo;
    liObs: TdxLayoutItem;
    lcgDados3: TdxLayoutGroup;
    datPrevisao: TcxDBDateEdit;
    liDataPrevisao: TdxLayoutItem;
    lcgDados4: TdxLayoutGroup;
    edtKmPrevisao: TcxDBCurrencyEdit;
    liKmPrevisao: TdxLayoutItem;
    dxLayoutControl1Group1: TdxLayoutAutoCreatedGroup;
    cxDBDateEdit1: TcxDBDateEdit;
    liLiberacao: TdxLayoutItem;
    dxLayoutControl1Group2: TdxLayoutAutoCreatedGroup;
    actGravarFinalizacao: TAction;
    cxButton2: TcxButton;
    dxLayoutControl1Item1: TdxLayoutItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManutencaoVeiculos: TfrmManutencaoVeiculos;

implementation

{$R *.dfm}

uses udm;

procedure TfrmManutencaoVeiculos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmManutencaoVeiculos := Nil;
end;

end.
