unit ufrmDebitosRestricoes;

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
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  Data.DB, cxDBData, dxSkinsdxStatusBarPainter, cxProgressBar, dxStatusBar,
  cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxLabel,
  uthrExtratoFechadoRestricoes, System.Actions,
  Vcl.ActnList, cxCurrencyEdit, cxCalendar, cxGridExportLink, ShellAPI,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, clConexao;

type
  TfrmDebitosRestricoes = class(TForm)
    cxLabel27: TcxLabel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dxStatusBar1: TdxStatusBar;
    dxStatusBar1Container0: TdxStatusBarContainerControl;
    cxProgressBar: TcxProgressBar;
    dsDebitosRestricoes: TDataSource;
    aclDebitosRestricoes: TActionList;
    actDebitosRestricoesExportar: TAction;
    actDebitosRestricoesSair: TAction;
    cxGrid1DBTableView1VAL_RESTRICAO: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_INICIO: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_TERMINO: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_PAGO: TcxGridDBColumn;
    SaveDialog: TSaveDialog;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    procedure actDebitosRestricoesSairExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actDebitosRestricoesExportarExecute(Sender: TObject);
  private
    { Private declarations }
    procedure AtualizaGrade;
    procedure ExportarGrade;
  public
    { Public declarations }
    sEntregador: String;
  end;

var
  frmDebitosRestricoes: TfrmDebitosRestricoes;
  thrextrato: thrExtratoFechadoRestricoes;
  conexao: TConexao;

implementation

{$R *.dfm}

uses udm, clUtil;

procedure TfrmDebitosRestricoes.actDebitosRestricoesExportarExecute
  (Sender: TObject);
begin
  ExportarGrade;
end;

procedure TfrmDebitosRestricoes.actDebitosRestricoesSairExecute
  (Sender: TObject);
begin
  Close;
end;

procedure TfrmDebitosRestricoes.AtualizaGrade;
begin
  dsDebitosRestricoes.Enabled := False;
  thrextrato := thrExtratoFechadoRestricoes.Create(True);
  thrextrato.FreeOnTerminate := True;
  thrextrato.Priority := tpNormal;
  thrextrato.Start;

end;

procedure TfrmDebitosRestricoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dm.tbExtrato.Close;
  conexao.Free;
  Action := caFree;
  frmDebitosRestricoes := Nil;
end;

procedure TfrmDebitosRestricoes.FormShow(Sender: TObject);
begin
  conexao := TConexao.Create;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    actDebitosRestricoesSairExecute(Sender);
    Exit;
  end;
  AtualizaGrade;
end;

procedure TfrmDebitosRestricoes.ExportarGrade;
var
  FileExt: String;
begin
  if not(dm.tbExtravios.Active) then
  begin
    Exit;
  end;
  if dm.tbExtravios.IsEmpty then
  begin
    Exit;
  end;
  SaveDialog.Filter :=
    'Excel (*.xls) |*.xls|XML (*.xml) |*.xml|Arquivo Texto (*.txt) |*.txt|Página Web (*.html)|*.html';
  SaveDialog.Title := 'Exportar Dados';
  SaveDialog.DefaultExt := 'xls';
  if SaveDialog.Execute then
  begin
    cxGrid1.Refresh;
    FileExt := LowerCase(ExtractFileExt(SaveDialog.FileName));
    if FileExt = '.xls' then
      ExportGridToExcel(SaveDialog.FileName, cxGrid1, False, True, False)
    else if FileExt = '.xml' then
      ExportGridToXML(SaveDialog.FileName, cxGrid1, False)
    else if FileExt = '.txt' then
      ExportGridToText(SaveDialog.FileName, cxGrid1, False)
    else if FileExt = '.html' then
      ExportGridToHTML(SaveDialog.FileName, cxGrid1, False);
    ShellExecute(Handle, 'open', pchar(SaveDialog.FileName), nil, nil, SW_SHOW);
  end;
end;

end.
