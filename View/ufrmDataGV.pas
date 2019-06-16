unit ufrmDataGV;

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
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxLabel, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, Vcl.ActnList, Vcl.Menus, Vcl.StdCtrls, cxButtons, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, System.Actions;

type
  TfrmDataGV = class(TForm)
    cxLabel1: TcxLabel;
    cxData: TcxDateEdit;
    actData: TActionList;
    actDataOk: TAction;
    actDataCancelar: TAction;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    procedure actDataOkExecute(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDataGV: TfrmDataGV;

implementation

{$R *.dfm}

uses
  udm, clUtil, ufrmPrincipal;

procedure TfrmDataGV.actDataOkExecute(Sender: TObject);
begin
  if TUtil.Empty(cxData.Text) then
  begin
    Application.MessageBox('Informe a data da Validade!', 'Atenção',
      MB_OK + MB_ICONEXCLAMATION);
    cxData.SetFocus;
    Exit;
  end;

  ModalResult := mrOk;
end;

procedure TfrmDataGV.cxButton2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
