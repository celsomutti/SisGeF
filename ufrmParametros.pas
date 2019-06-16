unit ufrmParametros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, dxmdaset, cxGraphics, cxControls,
  cxLookAndFeels, cxContainer, cxEdit, cxGroupBox,
  cxCheckBox, cxDBEdit, Menus, ActnList, cxButtons, cxRadioGroup,
  cxTextEdit, cxLabel, cxMaskEdit, cxButtonEdit, ComCtrls, ShellCtrls,
  ShlObj, cxShellCommon, cxDropDownEdit, cxShellComboBox, cxDBShellComboBox,
  dxLayoutcxEditAdapters, dxLayoutControl, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
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
  dxSkinsForm, cxLookAndFeelPainters;

type
  TfrmParametros = class(TForm)
    dsParametros: TDataSource;
    aclParametros: TActionList;
    actSalvarSair: TAction;
    actSair: TAction;
    dsParLocal: TDataSource;
    actOK: TAction;
    actSairPasta: TAction;
    SaveDialog1: TSaveDialog;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox6: TcxGroupBox;
    cxLabel6: TcxLabel;
    cxHostName: TcxDBTextEdit;
    cxLabel7: TcxLabel;
    cxUsuarioFTP: TcxDBTextEdit;
    cxLabel8: TcxLabel;
    cxSenhaFTP: TcxDBTextEdit;
    cxLabel9: TcxLabel;
    cxPastaRemota: TcxDBTextEdit;
    cxGroupBox3: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxServidorSMTP: TcxDBTextEdit;
    cxLabel2: TcxLabel;
    cxUsuarioSMTP: TcxDBTextEdit;
    cxLabel3: TcxLabel;
    cxSenhaSMTP: TcxDBTextEdit;
    cxLabel4: TcxLabel;
    cxEMailRemetente: TcxDBTextEdit;
    cxGroupBox2: TcxGroupBox;
    cxDbCbHistorico: TcxDBCheckBox;
    cxDBCheckBox1: TcxDBCheckBox;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    actBancoDados: TAction;
    cxAutSMTP: TcxDBCheckBox;
    cxGroupBox4: TcxGroupBox;
    cxLabel5: TcxLabel;
    cxSkinName: TcxDBComboBox;
    procedure actSalvarSairExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
    procedure actBancoDadosExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParametros : TfrmParametros;
  lSkins        : TStringList;
  lResSkins     : TStringList;
implementation

{$R *.dfm}

uses
  clUtil, udm, ufrmPrincipal, ufrmConfiguracao;

procedure TfrmParametros.actSalvarSairExecute(Sender: TObject);
var
  sFile  : String;
begin
  try

    if dsParametros.State in [dsInsert, dsEdit] then
      dm.tbParametros.Post;

    sFile   :=  ExtractFilePath(Application.ExeName) + 'parGlobal.dat';

    if not dm.tbParametros.IsEmpty then
      begin
        frmPrincipal.UserControl.UsersLogged.Active :=  dm.tbParametrosDOM_USUARIO_LOGADO.Value;
       // frmPrincipal.UCControlHistorico.Active      :=  dm.tbParametrosDOM_HISTORICO.Value;
        frmPrincipal.MailUserControl.ServidorSMTP   :=  dm.tbParametrosDES_SERVIDOR_SMTP.Value;
        frmPrincipal.MailUserControl.EmailRemetente :=  dm.tbParametrosDES_EMAIL_REMETENTE.Value;
        frmPrincipal.MailUserControl.Usuario        :=  dm.tbParametrosDES_USERNAME.Value;
        frmPrincipal.MailUserControl.Senha          :=  dm.tbParametrosDES_SENHA.Value;
        frmPrincipal.MailUserControl.NomeRemetente  :=  'Administrador';
        if TUtil.Empty(dm.tbParametrosNOM_SKIN.Value) then begin
          dm.dxSkinController1.SkinName       :=  'Black';
        end
        else begin
          dm.dxSkinController1.SkinName       :=  dm.tbParametrosNOM_SKIN.Value;
        end;
      end;

    if sFile <> '' then
      dm.tbParametros.SaveToBinaryFile(sFile);

    dm.tbParametros.Close;

//    frmPrincipal.actSistemaHistorico.Visible := frmPrincipal.UCControlHistorico.Active;

    Close;

  except
    on E: Exception do MessageDlg(E.Message, mtError, mbOKCancel, 0);
  end;
end;

procedure TfrmParametros.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  try

    dm.cxHintStyleController.HintPause :=  2500;
    Action := caFree;
    frmParametros := nil;

  except on E: Exception do
    MessageDlg(e.Message, mtError, mbOKCancel, 0);
  end;
end;

procedure TfrmParametros.FormShow(Sender: TObject);
var
  sFile   : String;
  j       : Integer;
begin
  try

    dm.tbParametros.Open;

    sFile   :=  ExtractFilePath(Application.ExeName) + 'parGlobal.dat';

    if not FileExists(sFile) then
      dm.tbParametros.SaveToBinaryFile(sFile);

    dm.tbParametros.LoadFromBinaryFile(sFile);

    dm.cxHintStyleController.HintHidePause :=  25000;

  except on E: Exception do
    MessageDlg(e.Message, mtError, mbOKCancel, 0);
  end;
end;

procedure TfrmParametros.actSairExecute(Sender: TObject);
begin
  try

    Close;

  except
    on E: Exception do MessageDlg(E.Message, mtError, mbOKCancel, 0);
  end;
end;

procedure TfrmParametros.actBancoDadosExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmConfiguracao, frmConfiguracao);
  frmConfiguracao.ShowModal;
  frmConfiguracao.Free;
end;

end.
