unit ufrmVerbaFaixaPeso;

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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, dxLayoutContainer, dxLayoutControl, cxContainer, cxEdit, cxLabel, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxMaskEdit, cxCurrencyEdit, System.Actions, Vcl.ActnList, dxLayoutControlAdapters,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxBlobEdit;

type
  TfrmVerbaFaixaPeso = class(TForm)
    cxLabel27: TcxLabel;
    lcMainGroup_Root: TdxLayoutGroup;
    lcMain: TdxLayoutControl;
    tvFaixas: TcxGridDBTableView;
    lvFaixas: TcxGridLevel;
    grdFaixas: TcxGrid;
    lcMainItem1: TdxLayoutItem;
    tvFaixasQTD_PESO_INICIAL: TcxGridDBColumn;
    tvFaixasQTD_PESO_FINAL: TcxGridDBColumn;
    tvFaixasID_VERBA: TcxGridDBColumn;
    tvVerbas: TcxGridDBTableView;
    lvVerbas: TcxGridLevel;
    grdVerbas: TcxGrid;
    lcMainItem2: TdxLayoutItem;
    tvVerbasID_FAIXA: TcxGridDBColumn;
    tvVerbasVAL_VERBA: TcxGridDBColumn;
    aclFaixaVerbas: TActionList;
    actSair: TAction;
    cxButton1: TcxButton;
    lcMainItem3: TdxLayoutItem;
    tvFaixasDES_LOG: TcxGridDBColumn;
    tvVerbasDES_LOG: TcxGridDBColumn;
    procedure actSairExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVerbaFaixaPeso: TfrmVerbaFaixaPeso;

implementation

{$R *.dfm}

uses udm, uGlobais;

procedure TfrmVerbaFaixaPeso.actSairExecute(Sender: TObject);
begin
  Perform(WM_CLOSE, 0, 0);
end;

procedure TfrmVerbaFaixaPeso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm.qryFaixaVerba.Close;
  dm.qryFaixasPesos.Close;
  Action := caFree;
  frmVerbaFaixaPeso := nil;
end;

procedure TfrmVerbaFaixaPeso.FormShow(Sender: TObject);
begin
  if uGlobais.iNivelUsuario = 0 then
  begin
    tvFaixasDES_LOG.Visible := True;
    tvVerbasDES_LOG.Visible := True;
  end
  else
  begin
    tvFaixasDES_LOG.Visible := False;
    tvVerbasDES_LOG.Visible := False;
  end;
  dm.qryFaixasPesos.Open;
  dm.qryFaixaVerba.Open;
end;

end.
