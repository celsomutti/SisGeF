unit ufrmValor;

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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, dxLayoutContainer, dxLayoutControl, cxContainer, cxEdit, dxLayoutcxEditAdapters,
  cxTextEdit, cxCurrencyEdit, System.Actions, Vcl.ActnList, dxLayoutControlAdapters, Vcl.Menus, Vcl.StdCtrls, cxButtons;

type
  TfrmValor = class(TForm)
    lcValorGroup_Root: TdxLayoutGroup;
    lcValor: TdxLayoutControl;
    curValor: TcxCurrencyEdit;
    lciValor: TdxLayoutItem;
    aclValor: TActionList;
    actOK: TAction;
    actCancelar: TAction;
    cxButton1: TcxButton;
    lcValorItem1: TdxLayoutItem;
    cxButton2: TcxButton;
    lcValorItem2: TdxLayoutItem;
    lcValorGroup1: TdxLayoutAutoCreatedGroup;
    procedure actOKExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmValor: TfrmValor;

implementation

{$R *.dfm}

uses udm;

procedure TfrmValor.actCancelarExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmValor.actOKExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
