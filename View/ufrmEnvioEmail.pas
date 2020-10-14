unit ufrmEnvioEmail;

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
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxGroupBox, cxTextEdit, cxMaskEdit,
  cxButtonEdit, cxLabel, clEnvioEmail, cxMemo,
  Vcl.ActnList, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxListBox, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, System.Actions, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, cxCustomListBox;

type
  TfrmEnvioEmail = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxAssunto: TcxTextEdit;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxMensagem: TcxMemo;
    aclEMail: TActionList;
    actEMailAnexar: TAction;
    actEMailEnviar: TAction;
    actEMailCancelar: TAction;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxDestintarios: TcxListBox;
    cxAnexos: TcxListBox;
    OpenDialog: TOpenDialog;
    actEMailExcluirAnexo: TAction;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxLabel1: TcxLabel;
    cxCopiaCom: TcxListBox;
    actEMailIncluirDestinatario: TAction;
    actEMailExcluirDestinatario: TAction;
    cxButton6: TcxButton;
    cxButton7: TcxButton;
    actEMailIncluirComCopia: TAction;
    actEMailExcluirComCopia: TAction;
    cxButton8: TcxButton;
    cxButton9: TcxButton;
    procedure actEMailCancelarExecute(Sender: TObject);
    procedure actEMailAnexarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actEMailExcluirAnexoExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actEMailEnviarExecute(Sender: TObject);
    procedure actEMailIncluirDestinatarioExecute(Sender: TObject);
    procedure actEMailExcluirDestinatarioExecute(Sender: TObject);
    procedure actEMailIncluirComCopiaExecute(Sender: TObject);
    procedure actEMailExcluirComCopiaExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEnvioEmail: TfrmEnvioEmail;
  email: TEnviarEmail;

implementation

{$R *.dfm}

uses
  udm, uGlobais, clUtil;

procedure TfrmEnvioEmail.actEMailAnexarExecute(Sender: TObject);
var
  iConta: Integer;
  bFlag: Boolean;
begin
  iConta := 0;
  bFlag := True;
  if OpenDialog.Execute() then
  begin
    if FileExists(OpenDialog.FileName) then
    begin
      if cxAnexos.Items.Count > 0 then
      begin
        for iConta := 0 to cxAnexos.Items.Count - 1 do
        begin
          if cxAnexos.Items[iConta] = OpenDialog.FileName then
          begin
            bFlag := False;
          end;
        end;
      end;
      if bFlag then
      begin
        cxAnexos.Items.Add(OpenDialog.FileName);
      end;
    end;
  end;

end;

procedure TfrmEnvioEmail.actEMailCancelarExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmEnvioEmail.actEMailEnviarExecute(Sender: TObject);
var
  i: Integer;
  bFlag: Boolean;
  sHost, sDe, sUsuario, sSenha, sAssunto, sTexto, sPara, sCopia, CC,
    sNomeDe: String;
begin
  bFlag := False;
  sHost := 'mail.novorioexpress.com';
  sDe := 'sistema@novorioexpress.com';
  sUsuario := 'sistema@novorioexpress.com';
  sSenha := 'e5d4c3b2';
  sNomeDe := 'SisGeF';
  sAssunto := cxAssunto.Text;
  sTexto := cxMensagem.Text;
  sPara := '';
  CC := '';
  for i := 0 to cxDestintarios.Items.Count - 1 do
  begin
    if (not TUtil.Empty(sPara)) then
    begin
      sPara := sPara + ';';
    end;
    sPara := sPara + cxDestintarios.Items[i];
  end;
  for i := 0 to cxCopiaCom.Items.Count - 1 do
  begin
    if (not TUtil.Empty(CC)) then
    begin
      CC := CC + ';';
    end;
    CC := CC + cxCopiaCom.Items[i];
  end;
  bFlag := email.EnviarEmail(sHost, '1025', sUsuario, sSenha, sDe, sNomeDe,
    sPara, sAssunto, sTexto, CC, 0, 7, False, cxAnexos.Items);
  if not(bFlag) then
  begin
    Application.MessageBox
      ('Ocorreu alguma falha no envio do e-mail! Verifique.', 'Atenção!',
      MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.MessageBox('E-mail enviado com sucesso', 'E-Mail Enviado',
    MB_OK + MB_ICONINFORMATION);
  ModalResult := mrOk;
end;

procedure TfrmEnvioEmail.actEMailExcluirAnexoExecute(Sender: TObject);
begin
  if cxAnexos.Items.Count = 0 then
  begin
    Exit;
  end;
  cxAnexos.Items.Delete(cxAnexos.ItemIndex);
end;

procedure TfrmEnvioEmail.actEMailExcluirComCopiaExecute(Sender: TObject);
begin
  cxCopiaCom.DeleteSelected;
end;

procedure TfrmEnvioEmail.actEMailExcluirDestinatarioExecute(Sender: TObject);
begin
  cxDestintarios.DeleteSelected;
end;

procedure TfrmEnvioEmail.actEMailIncluirComCopiaExecute(Sender: TObject);
var
  sComCopia: String;
begin
  sComCopia := '';
  sComCopia := InputBox('Cópia Com','Endereço de E-Mail: ','');
  if sComCopia.IsEmpty then
  begin
    Exit;
  end;
  if Pos(';',sComCopia) = 0 then
  begin
    sComCopia := sComCopia + ';';
  end;
  cxCopiaCom.Items.Add(sComCopia);
end;

procedure TfrmEnvioEmail.actEMailIncluirDestinatarioExecute(Sender: TObject);
var
  sDestinatario: String;
begin
  sDestinatario := '';
  sDestinatario := InputBox('Destinatário de E-Mail','Endereço de E-Mail: ','');
  if sDestinatario.IsEmpty then
  begin
    Exit;
  end;
  if Pos(';',sDestinatario) = 0 then
  begin
    sDestinatario := sDestinatario + ';';
  end;
  cxDestintarios.Items.Add(sDestinatario);
end;

procedure TfrmEnvioEmail.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  email.Free;
end;

procedure TfrmEnvioEmail.FormShow(Sender: TObject);
begin
  email := TEnviarEmail.Create();
end;

end.
