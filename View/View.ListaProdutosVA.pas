unit View.ListaProdutosVA;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, dxLayoutContainer, dxLayoutControl, Data.DB, dxmdaset, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, System.Actions, Vcl.ActnList, dxLayoutControlAdapters, Vcl.Menus, Vcl.StdCtrls,
  cxButtons, System.Generics.Collections, Model.Modalidades, DAO.Modalidade, cxDBLookupComboBox, dxLayoutcxEditAdapters,
  cxContainer, cxLabel;

type
  Tview_ListaProdutosVA = class(TForm)
    lcgRoot: TdxLayoutGroup;
    lcEndereco: TdxLayoutControl;
    tbProdutos: TdxMemData;
    tvEnderecos: TcxGridDBTableView;
    lvEnderecos: TcxGridLevel;
    grdEnderecos: TcxGrid;
    lciEnderecos: TdxLayoutItem;
    aclProdutos: TActionList;
    actSelecionar: TAction;
    actCancelar: TAction;
    cxButton1: TcxButton;
    lciSelecionar: TdxLayoutItem;
    cxButton2: TcxButton;
    lciCancelar: TdxLayoutItem;
    lcEnderecoGroup1: TdxLayoutAutoCreatedGroup;
    cxLabel1: TcxLabel;
    lcEnderecoItem1: TdxLayoutItem;
    dsProdutos: TDataSource;
    tbProdutosCOD_BARRAS: TStringField;
    tbProdutosCOD_PRODUTO: TStringField;
    tbProdutosDES_PRODUTO: TStringField;
    tvEnderecosRecId: TcxGridDBColumn;
    tvEnderecosCOD_BARRAS: TcxGridDBColumn;
    tvEnderecosCOD_PRODUTO: TcxGridDBColumn;
    tvEnderecosDES_PRODUTO: TcxGridDBColumn;
    procedure actSelecionarExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  view_ListaProdutosVA: Tview_ListaProdutosVA;
implementation

{$R *.dfm}

uses udm;

procedure Tview_ListaProdutosVA.actCancelarExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure Tview_ListaProdutosVA.actSelecionarExecute(Sender: TObject);
begin
  ModalResult := mrOK;
end;

end.
