unit ufrmExtratoExpressas;

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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, dxLayoutContainer, dxLayoutControl, cxContainer, cxEdit, cxLabel, dxLayoutcxEditAdapters,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxCheckBox, dxmdaset;

type
  TfrmExtratosExpressas = class(TForm)
    lcMainGroup_Root: TdxLayoutGroup;
    lcMain: TdxLayoutControl;
    cxLabel27: TcxLabel;
    lcParametrosGroup_Root: TdxLayoutGroup;
    lcParametros: TdxLayoutControl;
    lcMainItem1: TdxLayoutItem;
    cxTipoPeríodo: TcxComboBox;
    lcParametrosItem2: TdxLayoutItem;
    cxData: TcxDateEdit;
    lcParametrosItem3: TdxLayoutItem;
    cxDataFinal: TcxDateEdit;
    lcParametrosItem4: TdxLayoutItem;
    cxTipoExtrato: TcxComboBox;
    lcParametrosItem1: TdxLayoutItem;
    grdEntregadoresDBTableView1: TcxGridDBTableView;
    grdEntregadoresLevel1: TcxGridLevel;
    grdEntregadores: TcxGrid;
    lcParametrosItem5: TdxLayoutItem;
    lcParametrosGroup1: TdxLayoutAutoCreatedGroup;
    grdEntregadoresDBTableView1DOM_SELECIONAR: TcxGridDBColumn;
    tbEntregadores: TdxMemData;
    tbEntregadoresCOD_ENTREGADOR: TIntegerField;
    tbEntregadoresDES_ENTREGADOR: TStringField;
    tbEntregadoresDOM_SELECIONAR: TBooleanField;
    dsEntregador: TDataSource;
    grdEntregadoresDBTableView1COD_ENTREGADOR: TcxGridDBColumn;
    grdEntregadoresDBTableView1DES_ENTREGADOR: TcxGridDBColumn;
    cxComboBox1: TcxComboBox;
    lcParametrosItem6: TdxLayoutItem;
    lcParametrosGroup2: TdxLayoutAutoCreatedGroup;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExtratosExpressas: TfrmExtratosExpressas;

implementation

{$R *.dfm}

uses udm;

end.
