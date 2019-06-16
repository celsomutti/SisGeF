unit ufrmBaixaContasReceber;

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
  dxSkinWhiteprint, dxSkinXmas2008Blue, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxLabel, cxCalc, Vcl.ActnList, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  System.Actions;

type
  TfrmBaixaContaReceber = class(TForm)
    cxLabel1: TcxLabel;
    cxDataBaixa: TcxDateEdit;
    cxLabel2: TcxLabel;
    cxValorBaixa: TcxCalcEdit;
    aclBaixa: TActionList;
    cxButton1: TcxButton;
    actBaixaBaixar: TAction;
    actBaixaCancelar: TAction;
    cxButton2: TcxButton;
    procedure actBaixaCancelarExecute(Sender: TObject);
    procedure actBaixaBaixarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBaixaContaReceber: TfrmBaixaContaReceber;

implementation

{$R *.dfm}

uses
  udm, ufrmPrincipal, clUtil, Math, uGlobais;

procedure TfrmBaixaContaReceber.actBaixaBaixarExecute(Sender: TObject);
begin
  if TUtil.Empty(cxDataBaixa.Text) then
  begin
    Application.MessageBox('Informe a Data da Baixa!', 'Atenção',
      MB_OK + MB_ICONEXCLAMATION);
    cxDataBaixa.SetFocus;
    Exit;
  end;
  if TUtil.Empty(cxValorBaixa.Text) then
  begin
    cxValorBaixa.Value := 0;
  end;
  ModalResult := mrOk;
end;

procedure TfrmBaixaContaReceber.actBaixaCancelarExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
