unit ufrmListaApoio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  Menus, StdCtrls, cxButtons, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  ActnList, dxmdaset, cxNavigator, Vcl.ImgList, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, System.Actions, cxCheckBox;

type
  TfrmListaApoio = class(TForm)
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    ds: TDataSource;
    aclApoio: TActionList;
    actApoioSelecionar: TAction;
    actApoioCancelar: TAction;
    cxImageList: TcxImageList;
    procedure actApoioSelecionarExecute(Sender: TObject);
    procedure actApoioCancelarExecute(Sender: TObject);
    procedure cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iColuna: Integer;
  end;

var
  frmListaApoio: TfrmListaApoio;

implementation

{$R *.dfm}

uses
  udm, clUtil, uGlobais;

procedure TfrmListaApoio.actApoioSelecionarExecute(Sender: TObject);
begin
  Resultado := True;
  ModalResult := mrOk;
end;

procedure TfrmListaApoio.actApoioCancelarExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmListaApoio.cxGrid1DBTableView1CellDblClick
  (Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  actApoioSelecionarExecute(Self);
end;

procedure TfrmListaApoio.FormShow(Sender: TObject);
begin
  cxGrid1DBTableView1.DataController.CreateAllItems;
end;

end.
