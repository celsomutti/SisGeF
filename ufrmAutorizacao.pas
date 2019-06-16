unit ufrmAutorizacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp,
  dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  cxTextEdit, cxLabel, ActnList, Menus, StdCtrls, cxButtons, clUsuarios,
  dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  System.Actions, clConexao, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmAutorizacao = class(TForm)
    cxLabel1: TcxLabel;
    cxUsuario: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxSenha: TcxTextEdit;
    aclAutorizacao: TActionList;
    actAutorizacaoOK: TAction;
    actAutorizacaoCancelar: TAction;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    procedure actAutorizacaoOKExecute(Sender: TObject);
    procedure actAutorizacaoCancelarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    UserAut: String;
  end;

var
  frmAutorizacao: TfrmAutorizacao;
  usuario: TUsuarios;
  conexao: TConexao;

implementation

{$R *.dfm}

uses
  udm, clUtil, ufrmPrincipal;

procedure TfrmAutorizacao.actAutorizacaoOKExecute(Sender: TObject);
var
  iRetorno: Integer;
  sNome: String;
begin
  if not(usuario.ValidatePassword(cxUsuario.Text, cxSenha.Text)) then
  begin
    MessageDlg('Usuário ou senha inválidos!', mtWarning, [mbOK], 0);
    cxUsuario.Clear;
    cxSenha.Clear;
    cxUsuario.SetFocus;
    Exit;
  end;
  if not(usuario.getObject(cxUsuario.Text, 'LOGIN')) then
  begin
    MessageDlg('Login não encontrado!', mtWarning, [mbOK], 0);
    cxUsuario.Clear;
    cxSenha.Clear;
    cxUsuario.SetFocus;
    Exit;
  end
  else
  begin
    if usuario.Ativo <> 'S' then
    begin
      MessageDlg('Usuário informado está inativo!', mtWarning, [mbOK], 0);
      cxUsuario.Clear;
      cxSenha.Clear;
      cxUsuario.SetFocus;
      Exit;
    end;
    if usuario.Privilegio <> 'S' then
    begin
      MessageDlg
        ('Usuário informado não tem permissão para esse tipo de autorização!',
        mtWarning, [mbOK], 0);
      cxUsuario.Clear;
      cxSenha.Clear;
      cxUsuario.SetFocus;
      Exit;
    end;
  end;
  frmPrincipal.UserAut := usuario.Nome;
  frmAutorizacao.ModalResult := mrOk;
end;

procedure TfrmAutorizacao.actAutorizacaoCancelarExecute(Sender: TObject);
begin
  frmAutorizacao.ModalResult := mrCancel
end;

procedure TfrmAutorizacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  usuario.Free;
  conexao.Free;
end;

procedure TfrmAutorizacao.FormShow(Sender: TObject);
begin
  usuario := TUsuarios.Create;
  conexao := TConexao.Create;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    actAutorizacaoCancelarExecute(Sender);
    Exit;
  end;
  cxUsuario.Clear;
  cxSenha.Clear;
end;

end.
