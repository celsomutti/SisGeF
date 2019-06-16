unit ufrmCadastraSenha;

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
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxTextEdit, cxLabel, cxCheckBox,
  Vcl.ActnList, Vcl.ImgList, Vcl.Menus, Vcl.StdCtrls,
  cxButtons, cxGroupBox, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, System.Actions;

type
  TfrmCadastraSenha = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxSenha: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxConfirmaSenha: TcxTextEdit;
    cxPrimeiroAcesso: TcxCheckBox;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    aclCadastraSenha: TActionList;
    actCadastraSenhaCadastrar: TAction;
    actCadastraSenhaCancelar: TAction;
    procedure actCadastraSenhaCadastrarExecute(Sender: TObject);
    procedure actCadastraSenhaCancelarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastraSenha: TfrmCadastraSenha;

implementation

{$R *.dfm}

uses
  clUtil, udm;

procedure TfrmCadastraSenha.actCadastraSenhaCadastrarExecute(Sender: TObject);
begin
  if TUtil.Empty(cxSenha.Text) then
  begin
    Application.MessageBox('Informe a Senha do Usuário!', 'Atenção',
      MB_OK + MB_ICONEXCLAMATION);
    cxSenha.SetFocus;
    Exit;
  end;
  if TUtil.Empty(cxConfirmaSenha.Text) then
  begin
    Application.MessageBox('Informe a Senha do Usuário!', 'Atenção',
      MB_OK + MB_ICONEXCLAMATION);
    cxConfirmaSenha.SetFocus;
    Exit;
  end;
  if cxConfirmaSenha.Text <> cxSenha.Text then
  begin
    Application.MessageBox('Confirmação Não Confere com a Senha!', 'Atenção',
      MB_OK + MB_ICONEXCLAMATION);
    cxConfirmaSenha.SetFocus;
    Exit;
  end;
  ModalResult := mrOk;
end;

procedure TfrmCadastraSenha.actCadastraSenhaCancelarExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
