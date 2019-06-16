unit ufrmDetalhesLancamentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans,
  dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxLabel, cxCurrencyEdit, System.Actions,
  Vcl.ActnList, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  cxGridExportLink, ShellAPI, dxSkinsdxStatusBarPainter, cxProgressBar,
  dxStatusBar, cxTextEdit, cxCalendar, cxImageComboBox,
  uthrPopularLancamentosExtrato, clConexao, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmDetalhesLancamentos = class(TForm)
    cxLabel27: TcxLabel;
    dsDetalhesLancamentos: TDataSource;
    aclDetalhesLancamentos: TActionList;
    actDetalhesRestricoesExportar: TAction;
    actDetalhesRestricoesSair: TAction;
    cxButton2: TcxButton;
    SaveDialog: TSaveDialog;
    dxStatusBar1: TdxStatusBar;
    dxStatusBar1Container0: TdxStatusBarContainerControl;
    cxProgressBar: TcxProgressBar;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1COD_LANCAMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1DOM_DESCONTO: TcxGridDBColumn;
    cxGrid1DBTableViewCOD_ENTREGADOR: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_ENTREGADOR: TcxGridDBColumn;
    cxGrid1DBTableView1DES_LANCAMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_LANCAMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_LANCAMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_DEBITO: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_DESCONTO: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_EXTRATO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_TIPO: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actDetalhesRestricoesSairExecute(Sender: TObject);
    procedure actDetalhesRestricoesExportarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxGrid1DBTableView1NavigatorButtonsButtonClick(Sender: TObject; AButtonIndex: Integer; var ADone: Boolean);
  private
    { Private declarations }
    procedure AtualizaGrid;
    procedure ExportarGrade;
  public
    { Public declarations }
    sId: String;
    sFiltro: String;
  end;

var
  frmDetalhesLancamentos: TfrmDetalhesLancamentos;
  thrlancamentos: thrPopularLancamentosExtrato;
  conexao: TConexao;

implementation

{$R *.dfm}

uses uGlobais, clUtil, udm;

procedure TfrmDetalhesLancamentos.actDetalhesRestricoesExportarExecute
  (Sender: TObject);
begin
  ExportarGrade;
end;

procedure TfrmDetalhesLancamentos.actDetalhesRestricoesSairExecute
  (Sender: TObject);
begin
  Close;
end;

procedure TfrmDetalhesLancamentos.AtualizaGrid;
begin
  dsDetalhesLancamentos.Enabled := False;
  thrlancamentos := thrPopularLancamentosExtrato.Create(True);
  thrlancamentos.FreeOnTerminate := True;
  thrlancamentos.Priority := tpNormal;
  thrlancamentos.Start;
end;

procedure TfrmDetalhesLancamentos.cxGrid1DBTableView1NavigatorButtonsButtonClick(Sender: TObject; AButtonIndex: Integer; var ADone: Boolean);
begin
  case AButtonIndex of
    16: ExportarGrade;
  end;

end;

procedure TfrmDetalhesLancamentos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dm.tbLancamentos.Close;
  conexao.Free;
  Action := caFree;
  frmDetalhesLancamentos := Nil;
end;

procedure TfrmDetalhesLancamentos.FormShow(Sender: TObject);
begin
  conexao := TConexao.Create;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    actDetalhesRestricoesSairExecute(Sender);
    Exit;
  end;
  AtualizaGrid;
end;

procedure TfrmDetalhesLancamentos.ExportarGrade;
var
  FileExt: String;
begin
  if not(dm.tbLancamentos.Active) then
  begin
    Exit;
  end;
  if dm.tbLancamentos.IsEmpty then
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
