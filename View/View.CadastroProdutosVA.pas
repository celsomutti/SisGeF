unit View.CadastroProdutosVA;

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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, dxLayoutContainer, dxLayoutControl, cxContainer, cxEdit, dxLayoutcxEditAdapters, cxLabel,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxTextEdit, cxMaskEdit, cxCheckBox, System.Actions,
  Vcl.ActnList, dxLayoutControlAdapters, Vcl.Menus, Vcl.StdCtrls, cxButtons;

type
  Tview_CadastroProdutosVA = class(TForm)
    lcgProdutosVA: TdxLayoutGroup;
    lciRoot: TdxLayoutControl;
    lblTitulo: TcxLabel;
    lciTitulo: TdxLayoutItem;
    tvProdutos: TcxGridDBTableView;
    lvProdutos: TcxGridLevel;
    grdProdutos: TcxGrid;
    lciGrade: TdxLayoutItem;
    dsProduto: TDataSource;
    tvProdutosID_PRODUTO: TcxGridDBColumn;
    tvProdutosCOD_PRODUTO: TcxGridDBColumn;
    tvProdutosDES_PRODUTO: TcxGridDBColumn;
    tvProdutosQTD_PADRAO: TcxGridDBColumn;
    tvProdutosDOM_DIARIO: TcxGridDBColumn;
    tvProdutosCOD_BARRAS: TcxGridDBColumn;
    tvProdutosDES_LOG: TcxGridDBColumn;
    actCadastro: TActionList;
    actSair: TAction;
    btnSair: TcxButton;
    lciSair: TdxLayoutItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actSairExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  view_CadastroProdutosVA: Tview_CadastroProdutosVA;

implementation

{$R *.dfm}

uses udm;

procedure Tview_CadastroProdutosVA.actSairExecute(Sender: TObject);
begin
  Perform(WM_CLOSE, 0, 0);
end;

procedure Tview_CadastroProdutosVA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm.fdqProdutosVA.Close;
  dm.FDConn.Close;
  Action := caFree;
  view_CadastroProdutosVA := Nil;
end;

procedure Tview_CadastroProdutosVA.FormShow(Sender: TObject);
begin
  dm.FDConn.Open();
  dm.fdqProdutosVA.Active := True

end;

end.
