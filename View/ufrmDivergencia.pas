unit ufrmDivergencia;

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
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxGroupBox, cxTextEdit, cxMemo,
  Vcl.ActnList, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, System.Actions;

type
  TfrmDivergencia = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxDivergencia: TcxMemo;
    aclDivergencia: TActionList;
    actDivergenciaGravar: TAction;
    actDivergenciaCancelar: TAction;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    procedure actDivergenciaGravarExecute(Sender: TObject);
    procedure actDivergenciaCancelarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDivergencia: TfrmDivergencia;

implementation

{$R *.dfm}

uses
  udm, uGlobais, clUtil;

procedure TfrmDivergencia.actDivergenciaCancelarExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmDivergencia.actDivergenciaGravarExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
