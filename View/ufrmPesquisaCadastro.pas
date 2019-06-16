unit ufrmPesquisaCadastro;

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
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxGroupBox, Data.DB, dxmdaset, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxMaskEdit, cxImageComboBox, cxLabel, dxLayoutContainer, dxLayoutControl, System.Actions, Vcl.ActnList,
  cxDBLookupComboBox, dxLayoutcxEditAdapters, cxTextEdit, cxDropDownEdit;

type
  TfrmPesquisaCadastro = class(TForm)
    dsPesquisa: TDataSource;
    cxLabel1: TcxLabel;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    dxLayoutControl2Group_Root: TdxLayoutGroup;
    dxLayoutControl2: TdxLayoutControl;
    dxLayoutControl1Item1: TdxLayoutItem;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dxLayoutControl1Item2: TdxLayoutItem;
    aclCadastro: TActionList;
    Action1: TAction;
    tbPesquisa: TdxMemData;
    tbPesquisaCOD_CADASTRO: TIntegerField;
    tbPesquisaCOD_TIPO_CADASTRO: TIntegerField;
    tbPesquisaCOD_DEPARTAMENTO: TIntegerField;
    tbPesquisaCOD_SUB_TIPO: TIntegerField;
    tbPesquisaCOD_FILIAL: TIntegerField;
    tbPesquisaNOM_NOME_RAZAO: TWideStringField;
    tbPesquisaNOM_RESPONSAVEL: TWideStringField;
    tbPesquisaNOM_FANTASIA: TWideStringField;
    tbPesquisaCOD_FUNCAO: TIntegerField;
    tbPesquisaDES_TIPO_DOC: TWideStringField;
    tbPesquisaNUM_CPF: TWideStringField;
    tbPesquisaNUM_CNPJ: TWideStringField;
    tbPesquisaNUM_RG: TWideStringField;
    tbPesquisaNUM_IE: TWideStringField;
    tbPesquisaNUM_IEST: TWideStringField;
    tbPesquisaNUM_IM: TWideStringField;
    tbPesquisaDES_EXPEDIDOR: TWideStringField;
    tbPesquisaUF_EXPEDIDOR: TWideStringField;
    tbPesquisaDAT_EMISSAO_RG: TDateField;
    tbPesquisaDAT_NASCIMENTO: TDateField;
    tbPesquisaNOM_PAI: TWideStringField;
    tbPesquisaNOM_MAE: TWideStringField;
    tbPesquisaDES_NATURALIDADE: TWideStringField;
    tbPesquisaUF_NATURALIDADE: TWideStringField;
    tbPesquisaNUM_SUFRAMA: TWideStringField;
    tbPesquisaNUM_CNH: TWideStringField;
    tbPesquisaNUM_CNAE: TWideStringField;
    tbPesquisaNUM_CRT: TIntegerField;
    tbPesquisaNUM_REGISTRO_CNH: TWideStringField;
    tbPesquisaUF_CNH: TWideStringField;
    tbPesquisaDAT_VALIDADE_CNH: TDateField;
    tbPesquisaDES_CATEGORIA_CNH: TWideStringField;
    tbPesquisaDAT_PRIMEIRA_CNH: TDateField;
    tbPesquisaNUM_PIS: TWideStringField;
    tbPesquisaNUM_CTPS: TWideStringField;
    tbPesquisaNUM_SERIE_CTPS: TWideStringField;
    tbPesquisaUF_CTPS: TWideStringField;
    tbPesquisaDES_ESTADO_CIVIL: TWideStringField;
    tbPesquisaNUM_TITULO_ELEITOR: TWideStringField;
    tbPesquisaNUM_RESERVISTA: TWideStringField;
    tbPesquisaDES_FORMA_CREDITO: TWideStringField;
    tbPesquisaDES_TIPO_CONTA: TWideStringField;
    tbPesquisaCOD_BANCO: TWideStringField;
    tbPesquisaNUM_AGENCIA: TWideStringField;
    tbPesquisaNUM_CONTA: TWideStringField;
    tbPesquisaNOM_FAVORECIDO: TWideStringField;
    tbPesquisaNUM_CPF_CNPJ_FAVORECIDO: TWideStringField;
    tbPesquisaDAT_CADASTRO: TDateField;
    tbPesquisaCOD_USUARIO_PROPRIETARIO: TIntegerField;
    tbPesquisaNUM_ROTEIRO: TIntegerField;
    tbPesquisaDES_STATUS_GR: TWideStringField;
    tbPesquisaDES_STATUS_CADASTRO: TIntegerField;
    cxGrid1DBTableView1RecId: TcxGridDBColumn;
    cxGrid1DBTableView1COD_CADASTRO: TcxGridDBColumn;
    cxGrid1DBTableView1COD_TIPO_CADASTRO: TcxGridDBColumn;
    cxGrid1DBTableView1COD_DEPARTAMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1COD_SUB_TIPO: TcxGridDBColumn;
    cxGrid1DBTableView1COD_FILIAL: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_NOME_RAZAO: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_RESPONSAVEL: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_FANTASIA: TcxGridDBColumn;
    cxGrid1DBTableView1COD_FUNCAO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_TIPO_DOC: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_CPF: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_CNPJ: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_RG: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_IE: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_IEST: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_IM: TcxGridDBColumn;
    cxGrid1DBTableView1DES_EXPEDIDOR: TcxGridDBColumn;
    cxGrid1DBTableView1UF_EXPEDIDOR: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_EMISSAO_RG: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_NASCIMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_PAI: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_MAE: TcxGridDBColumn;
    cxGrid1DBTableView1DES_NATURALIDADE: TcxGridDBColumn;
    cxGrid1DBTableView1UF_NATURALIDADE: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_SUFRAMA: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_CNH: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_CNAE: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_CRT: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_REGISTRO_CNH: TcxGridDBColumn;
    cxGrid1DBTableView1UF_CNH: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_VALIDADE_CNH: TcxGridDBColumn;
    cxGrid1DBTableView1DES_CATEGORIA_CNH: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_PRIMEIRA_CNH: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_PIS: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_CTPS: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_SERIE_CTPS: TcxGridDBColumn;
    cxGrid1DBTableView1UF_CTPS: TcxGridDBColumn;
    cxGrid1DBTableView1DES_ESTADO_CIVIL: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_TITULO_ELEITOR: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_RESERVISTA: TcxGridDBColumn;
    cxGrid1DBTableView1DES_FORMA_CREDITO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_TIPO_CONTA: TcxGridDBColumn;
    cxGrid1DBTableView1COD_BANCO: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_AGENCIA: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_CONTA: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_FAVORECIDO: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_CPF_CNPJ_FAVORECIDO: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_CADASTRO: TcxGridDBColumn;
    cxGrid1DBTableView1COD_USUARIO_PROPRIETARIO: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_ROTEIRO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_STATUS_GR: TcxGridDBColumn;
    cxGrid1DBTableView1DES_STATUS_CADASTRO: TcxGridDBColumn;
    dsTipoCadastro: TDataSource;
    dsSubTipo: TDataSource;
    dsDepartamentos: TDataSource;
    dsFilial: TDataSource;
    cxTipoCadastro: TcxComboBox;
    dxLayoutControl2Item1: TdxLayoutItem;
    cxDepartamento: TcxComboBox;
    dxLayoutControl2Item2: TdxLayoutItem;
    cxFilial: TcxComboBox;
    dxLayoutControl2Item3: TdxLayoutItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesquisaCadastro: TfrmPesquisaCadastro;

implementation

{$R *.dfm}

uses udm;

end.
