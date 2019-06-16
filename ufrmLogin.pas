unit ufrmLogin;

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
  dxSkinWhiteprint, dxSkinXmas2008Blue, Vcl.Imaging.jpeg, cxImage, cxLabel,
  dxSkinsdxStatusBarPainter, dxStatusBar, cxGroupBox,
  cxTextEdit, Vcl.ImgList, Vcl.ActnList, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  cxCalendar, clUsuarios, DateUtils, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, System.Actions, clConexao, Vcl.ExtCtrls,
  dxLayoutLookAndFeels, cxClasses, dxSkinscxPCPainter, dxLayoutContainer,
  dxLayoutControl, dxLayoutcxEditAdapters, dxLayoutControlAdapters, dxBevel, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, System.ImageList;

type
  TfrmLogin = class(TForm)
    aclLogin: TActionList;
    cxImageList: TcxImageList;
    actLoginAceitar: TAction;
    actLoginCancelar: TAction;
    dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList;
    Panel1: TPanel;
    cxImage1: TcxImage;
    cxLabel1: TcxLabel;
    dxLayoutCxLookAndFeel1: TdxLayoutCxLookAndFeel;
    dxBevel1: TdxBevel;
    cxLabel2: TcxLabel;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    cxLogin: TcxTextEdit;
    dxLayoutControl1Item1: TdxLayoutItem;
    cxSenha: TcxTextEdit;
    dxLayoutControl1Item2: TdxLayoutItem;
    cxButton1: TcxButton;
    dxLayoutControl1Item3: TdxLayoutItem;
    cxButton2: TcxButton;
    dxLayoutControl1Item4: TdxLayoutItem;
    dxLayoutControl1Group1: TdxLayoutAutoCreatedGroup;
    dxBevel2: TdxBevel;
    dxLayoutControl1Item5: TdxLayoutItem;
    cxLabel4: TcxLabel;
    dxLayoutControl1Item6: TdxLayoutItem;
    procedure actLoginAceitarExecute(Sender: TObject);
    procedure actLoginCancelarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxSenhaEnter(Sender: TObject);
    procedure cxSenhaExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;
  iTentativas: Integer;
  usuario: TUsuarios;
  conexao: TConexao;

implementation

{$R *.dfm}

uses
  uGlobais, clUtil, ufrmPrincipal, ufrmCadastraSenha, Global.Parametros;

procedure TfrmLogin.actLoginAceitarExecute(Sender: TObject);
var
  sPrimeiroAcesso: String;
begin
  if not(usuario.ValidatePassword(cxLogin.Text, cxSenha.Text)) then
  begin
    iTentativas := iTentativas - 1;
    Application.MessageBox('Usuário ou Senha inválidos!', 'Aenção!',
      MB_OK + MB_ICONWARNING);
    if iTentativas = 0 then
    begin
      Application.MessageBox('Número de tentativas foi ultrapassado!',
        'Atenção!', MB_OK + MB_ICONWARNING);
      ModalResult := mrCancel;
    end
    else
    begin
      cxLabel4.Caption := 'Usuário tem mais ' + IntToStr(iTentativas) +
        ' tentativas!';
      cxLabel4.Refresh;
    end;
  end
  else
  begin
    if usuario.getObject(cxLogin.Text, 'LOGIN') then
    begin
      if usuario.Ativo = 'N' then
      begin
        Application.MessageBox('Usuário Inativo!', 'Atenção!',
          MB_OK + MB_ICONWARNING);
        ModalResult := mrCancel;
        Exit;
      end;
      uGlobais.sUsuario := usuario.Login;
      Global.Parametros.pUser_Name := usuario.Login;
      uGlobais.sNomeUsuario := usuario.Nome;
      Global.Parametros.pNameUser := usuario.Nome;
      uGlobais.idUsuario := IntToStr(usuario.Codigo);
      Global.Parametros.pUser_ID := usuario.Codigo;
      uGlobais.idGrupoUsuario := IntToStr(usuario.Grupo);
      uGlobais.iNivelUsuario := usuario.Nivel;
      uGlobais.pPrivilegio := usuario.Privilegio;
      uGlobais.sEmailUser := usuario.EMail;
      if usuario.Acesso = 'S' then
      begin
        if not Assigned(frmCadastraSenha) then
        begin
          frmCadastraSenha := TfrmCadastraSenha.Create(Application);
        end;
        frmCadastraSenha.Caption := 'Alterar a Senha no Primeiro Acesso';
        frmCadastraSenha.cxPrimeiroAcesso.Checked := False;
        frmCadastraSenha.cxPrimeiroAcesso.Visible := False;
        if frmCadastraSenha.ShowModal = mrOk then
        begin
          usuario.Senha := frmCadastraSenha.cxSenha.Text;
          if usuario.ChangePassword('CODIGO') then
          begin
            usuario.DataSenha := IncDay(Now, usuario.Dias);
            usuario.Acesso := 'N';
            if not(usuario.Update()) then
            begin
              Application.MessageBox('Erro ao salvar primeiro acesso!', 'Erro!',
                MB_OK + MB_ICONERROR);
            end;
            Application.MessageBox
              ('Senha alterada. Nos próximos acessos utilize a senha nova.',
              'Atenção!', MB_OK + MB_ICONINFORMATION);
          end;
        end;
      end;
      FreeAndNil(frmCadastraSenha);
    end;
    TUtil.GravaIni(uGlobais.sIni, 'Login', 'LastUser', uGlobais.sUsuario);
    ModalResult := mrOk;
  end;
end;

procedure TfrmLogin.actLoginCancelarExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmLogin.cxSenhaEnter(Sender: TObject);
begin
  cxButton1.Default := True;
end;

procedure TfrmLogin.cxSenhaExit(Sender: TObject);
begin
  cxButton1.Default := False;
end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  usuario.Free;
  conexao.Free;
end;

procedure TfrmLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  iTentativas := 6;
  usuario := TUsuarios.Create;
  conexao := TConexao.Create;
  cxLabel1.Caption := Application.Title + ' - Versão ' + TUtil.VersaoExe;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    actLoginCancelarExecute(Sender);
    Exit;
  end;
  cxLogin.Text := TUtil.LeIni(uGlobais.sIni, 'Login', 'LastUser');
  cxLogin.SetFocus;
end;

end.
