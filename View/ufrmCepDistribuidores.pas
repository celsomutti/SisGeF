unit ufrmCepDistribuidores;

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
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter, dxLayoutContainer, dxLayoutControl, cxLabel, System.Actions,
  Vcl.ActnList, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxMaskEdit, dxLayoutControlAdapters,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxTextEdit, cxDBLookupComboBox, cxBlobEdit;

type
  TfrmCepDistribuidores = class(TForm)
    cxLabel27: TcxLabel;
    lcMain: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    aclCadastro: TActionList;
    actSair: TAction;
    tvCep: TcxGridDBTableView;
    lvCep: TcxGridLevel;
    grdCep: TcxGrid;
    dxLayoutControl1Item1: TdxLayoutItem;
    tvCepID_CEP: TcxGridDBColumn;
    tvCepCOD_DISTRIBUIDOR: TcxGridDBColumn;
    tvCepDES_CEP_INICIAL: TcxGridDBColumn;
    tvCepDES_CEP_FINAL: TcxGridDBColumn;
    tvCepDES_LOG: TcxGridDBColumn;
    cxButton1: TcxButton;
    dxLayoutControl1Item2: TdxLayoutItem;
    tvCepNOM_DISTRIBUIDOR: TcxGridDBColumn;
    dsAgentes: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actSairExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCepDistribuidores: TfrmCepDistribuidores;

implementation

{$R *.dfm}

uses udm, uGlobais;

procedure TfrmCepDistribuidores.actSairExecute(Sender: TObject);
begin
  Perform(WM_CLOSE, 0, 0);
end;

procedure TfrmCepDistribuidores.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm.qryROAgentes.Close;
  dm.qryCepDistribuidor.Close;
  Action := caFree;
  frmCepDistribuidores := Nil;
end;

procedure TfrmCepDistribuidores.FormShow(Sender: TObject);
begin
  if uGlobais.iNivelUsuario = 0 then
  begin
    tvCepDES_LOG.Visible := True;
  end
  else
  begin
    tvCepDES_LOG.Visible := False;
  end;
  dm.qryROAgentes.Open;
  dm.qryCepDistribuidor.Open;
end;

end.
