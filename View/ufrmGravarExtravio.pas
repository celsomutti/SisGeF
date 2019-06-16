unit ufrmGravarExtravio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLabel, Vcl.Menus, System.Actions, Vcl.ActnList,
  Vcl.StdCtrls, cxButtons, cxCheckBox, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmGravarExtravio = class(TForm)
    cxLabel1: TcxLabel;
    cxComboBox1: TcxComboBox;
    aclGravarExtravio: TActionList;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    actGravarExtravioGravar: TAction;
    actGravarExtravioCancelar: TAction;
    cxAVista: TcxCheckBox;
    procedure actGravarExtravioGravarExecute(Sender: TObject);
    procedure actGravarExtravioCancelarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGravarExtravio: TfrmGravarExtravio;

implementation

{$R *.dfm}

uses udm, uGlobais, clUtil;

procedure TfrmGravarExtravio.actGravarExtravioCancelarExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmGravarExtravio.actGravarExtravioGravarExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
