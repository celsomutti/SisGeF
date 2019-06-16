unit ufrmConfiguracao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxLayoutcxEditAdapters, dxLayoutControl, cxLabel,
  cxTextEdit, cxMaskEdit, cxButtonEdit, Menus, StdCtrls, cxButtons,
  ActnList, cxGroupBox, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue;

type
  TfrmConfiguracao = class(TForm)
    aclConfiguracao: TActionList;
    actConfiguracaoSalvar: TAction;
    actConfiguracaoSair: TAction;
    OpenDialog1: TOpenDialog;
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxbeBancoDados: TcxButtonEdit;
    cxbSalvar: TcxButton;
    cxbSair: TcxButton;
    procedure actConfiguracaoSairExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actConfiguracaoSalvarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxbeBancoDadosPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfiguracao: TfrmConfiguracao;
  sFile: String;
  sArquivo: String;

implementation

{$R *.dfm}

uses
  clUtil, udm;

procedure TfrmConfiguracao.actConfiguracaoSairExecute(Sender: TObject);
begin
  Perform(WM_CLOSE, 0, 0);
end;

procedure TfrmConfiguracao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmConfiguracao := nil;
end;

procedure TfrmConfiguracao.actConfiguracaoSalvarExecute(Sender: TObject);
begin

  sArquivo := '';

  if Trim(cxbeBancoDados.Text) = '' then
    begin
      Application.MessageBox('Favor informar o arquivo de banco de dados','Atenção',MB_OK + MB_ICONEXCLAMATION);
      cxbeBancoDados.SetFocus;
      Exit;
    end;

  if Application.MessageBox('Confirma salvar os dados?','Salvar',MB_YESNO + MB_ICONQUESTION) = IDNO then
    Exit;

  if not (FileExists(sFile)) then
    TUtil.CriarIni(sFile);

  sArquivo := Trim(cxbeBancoDados.Text);

  if TUtil.GravaIni(sFile,'Database','Database', sArquivo) then
    begin
      Application.MessageBox('Configuração Salva com Sucesso!','Atenção',
                              MB_OK + MB_ICONINFORMATION);
      dm.ZConn.Disconnect;
      dm.ZConn.Database := sArquivo;
      dm.ZConn.Connect;
      actConfiguracaoSairExecute(Sender);
    end;

end;

procedure TfrmConfiguracao.FormShow(Sender: TObject);
begin
  sFile := ExtractFilePath(Application.ExeName) + 'database.ini';
  if FileExists(sFile) then
    cxbeBancoDados.Text := TUtil.LeIni(sFile,'Database','Database');
end;

procedure TfrmConfiguracao.cxbeBancoDadosPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  if OpenDialog1.Execute then
    cxbeBancoDados.Text := OpenDialog1.FileName;
end;

end.
