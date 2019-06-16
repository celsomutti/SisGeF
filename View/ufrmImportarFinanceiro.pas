unit ufrmImportarFinanceiro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, clEntrega, clExtravios, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, cxLabel, cxGroupBox,
  System.Actions, Vcl.ActnList, cxTextEdit, cxMemo,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxProgressBar, uthrImportarFinanceiroTFO,
  clConexao;

type
  TfrmImportarFinanceiro = class(TForm)
    cxLabel27: TcxLabel;
    cxGroupBox1: TcxGroupBox;
    aclImportaFinanceiro: TActionList;
    cxGroupBox2: TcxGroupBox;
    cxLog: TcxMemo;
    actImportarImportar: TAction;
    actImportarSair: TAction;
    actImportarLimparLOG: TAction;
    OpenDialog1: TOpenDialog;
    cxProgressBar1: TcxProgressBar;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    actImportarCancelar: TAction;
    cxButton4: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actImportarLimparLOGExecute(Sender: TObject);
    procedure actImportarSairExecute(Sender: TObject);
    procedure actImportarImportarExecute(Sender: TObject);
    procedure actImportarCancelarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sFile: String;
  end;

var
  frmImportarFinanceiro: TfrmImportarFinanceiro;
  thrFinanceiro: thrImportarFinanceiroTFO;
  conexao: TConexao;

implementation

{$R *.dfm}

uses udm, clUtil;

procedure TfrmImportarFinanceiro.actImportarCancelarExecute(Sender: TObject);
begin
  thrFinanceiro.Terminate;
end;

procedure TfrmImportarFinanceiro.actImportarImportarExecute(Sender: TObject);
begin
  sFile := '';
  if OpenDialog1.Execute then
  begin
    sFile := OpenDialog1.FileName;
  end;
  if TUtil.Empty(sFile) then
  begin
    Exit;
  end;
  if Application.MessageBox('Confirma a importação ?', 'Importar Financeiro',
    MB_ICONQUESTION + MB_YESNO) = IDNO then
  begin
    Exit;
  end;
  cxProgressBar1.Visible := True;
  actImportarCancelar.Visible := True;
  actImportarImportar.Enabled := False;
  cxLog.Lines.Add('Início da Importação: ' + DateTimeToStr(Now));
  cxLog.Refresh;
  cxLog.Lines.Add('Importando o arquivo ' + sFile);
  cxLog.Refresh;
  cxProgressBar1.Clear;
  thrFinanceiro := thrImportarFinanceiroTFO.Create(True);
  thrFinanceiro.FreeOnTerminate := True;
  thrFinanceiro.Priority := tpNormal;
  thrFinanceiro.Start;
end;

procedure TfrmImportarFinanceiro.actImportarLimparLOGExecute(Sender: TObject);
begin
  cxLog.Clear;
end;

procedure TfrmImportarFinanceiro.actImportarSairExecute(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmImportarFinanceiro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  conexao.Free;
  Action := caFree;
  frmImportarFinanceiro := Nil;
end;

procedure TfrmImportarFinanceiro.FormShow(Sender: TObject);
begin
  conexao := TConexao.Create;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    actImportarSairExecute(Sender);
    Exit;
  end;
end;

end.
