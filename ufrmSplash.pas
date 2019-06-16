unit ufrmSplash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxLabel, dxGDIPlusClasses, cxImage;

type
  TfrmSplash = class(TForm)
    cxImage1: TcxImage;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function  VerificaInicializacao(): Boolean;
    function  VerificaConexao(): Boolean;
  end;

var
  frmSplash : TfrmSplash;
  sFileIni  : String;
implementation

{$R *.dfm}

uses
  clUtil, udm, ufrmPrincipal, ufrmLogin, uGlobais;

procedure TfrmSplash.FormActivate(Sender: TObject);
begin
  Screen.Cursor     :=  crHourGlass;
  cxLabel1.Caption  :=  'SisGeF' + ' Versão ' + TUtil.VersaoExe();
  uGlobais.sSistema :=  cxLabel1.Caption;
  cxLabel2.Caption  :=  Application.Title;
  cxLabel3.Caption  :=  'Verificando arquivo de incialização. Aguarde ...';
  Refresh;
  if not (VerificaInicializacao()) then begin
    Application.Terminate;
    ExitProcess(0);
  end;
  Sleep(1000);
  cxlabel1.Refresh;
  cxlabel2.Refresh;
  cxLabel3.Caption  :=  'Verificando a conexão com o banco de dados. Aguarde ...';
  Refresh;
  if not (VerificaConexao()) then begin
    Application.Terminate;
    ExitProcess(0);
  end;
  Sleep(1000);
  cxlabel1.Refresh;
  cxlabel2.Refresh;
  cxLabel3.Caption  :=  'Inciando ...';
  Refresh;
  Screen.Cursor     :=  crDefault;
  if not Assigned(frmLogin) then begin
    frmLogin :=  TfrmLogin.Create(Application);
  end;
  if frmLogin.ShowModal <> mrOk then begin
    FreeAndNil(frmLogin);
    Application.Terminate;
    ExitProcess(0);
  end
  else begin
    FreeAndNil(frmLogin);
    frmPrincipal.UserControl.Execute;
  end;
end;

procedure TfrmSplash.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action    :=  caFree;
  frmSplash :=  Nil;
end;

function TfrmSplash.VerificaInicializacao(): Boolean;
begin
  try
    Result  :=  False;
    sFileIni := ExtractFilePath(Application.ExeName) + 'database.ini';
    if not FileExists(sFileIni) then begin
      Application.MessageBox('Arquivo de inicialização não encontrado! Verifique.','Atenção',MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
    Result  :=  True;
  except on E: Exception do begin
      MessageDlg(E.Message,mtError,mbOKCancel,0);
    end;
  end;
end;

function TfrmSplash.VerificaConexao(): Boolean;
begin
  try
    Result  :=  False;
    if dm.ZConn.Connected then
      dm.ZConn.Disconnect;
    if FileExists(sFileIni) then begin
      dm.ZConn.Catalog   :=  TUtil.LeIni(sFileIni,'Database','Catalog');
      dm.ZConn.Database  :=  TUtil.LeIni(sFileIni,'Database','Database');
      dm.ZConn.HostName  :=  TUtil.LeIni(sFileIni,'Database','HostName');
      dm.ZConn.Password  :=  'rjsmart01';
      dm.ZConn.Port      :=  StrToInt(TUtil.LeIni(sFileIni,'Database','Port'));
      dm.ZConn.Protocol  :=  TUtil.LeIni(sFileIni,'Database','Protocol');
      if dm.ZConn.HostName = 'localhost' then begin
        dm.ZConn.User      :=  'root';
      end
      else begin
        dm.ZConn.User      := 'rjsmart';
      end;
      dm.ZConn.Connect;
    end;
    if not (dm.ZConn.Connected)  then begin
      Exit;
    end;
    Result  :=  True;
  except on E: Exception do begin
      MessageDlg(E.Message,mtError,mbOKCancel,0);
    end;
  end;
end;

end.
