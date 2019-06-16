unit ufrmVisualizarRepositor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, udm, uGlobais, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, dxLayoutContainer, dxLayoutControl, System.Actions, Vcl.ActnList, cxContainer, cxEdit,
  dxLayoutcxEditAdapters, Data.DB, cxTextEdit, cxDBEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxCalendar, dxLayoutControlAdapters, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxMemo;

type
  TfrmVisualizarRepositor = class(TForm)
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    aclVisualizarRepositor: TActionList;
    cxDBCodigo: TcxDBTextEdit;
    dxLayoutControl1Item1: TdxLayoutItem;
    dsRepositor: TDataSource;
    cxDBNomeEntregador: TcxDBLookupComboBox;
    dxLayoutControl1Item2: TdxLayoutItem;
    dsListaEntregadores: TDataSource;
    cxDBData: TcxDBDateEdit;
    dxLayoutControl1Item3: TdxLayoutItem;
    dxLayoutControl1Group1: TdxLayoutAutoCreatedGroup;
    cxDBRoteiroAntigo: TcxDBTextEdit;
    dxLayoutControl1Item4: TdxLayoutItem;
    dxLayoutControl1Group2: TdxLayoutAutoCreatedGroup;
    cxDBRoteiroNovo: TcxDBTextEdit;
    dxLayoutControl1Item5: TdxLayoutItem;
    actSair: TAction;
    cxButton1: TcxButton;
    dxLayoutControl1Item6: TdxLayoutItem;
    cxDBObs: TcxDBMemo;
    dxLayoutControl1Item7: TdxLayoutItem;
    procedure actSairExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVisualizarRepositor: TfrmVisualizarRepositor;

implementation

{$R *.dfm}

procedure TfrmVisualizarRepositor.actSairExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
