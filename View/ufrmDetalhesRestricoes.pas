unit ufrmDetalhesRestricoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uthrPopularExtraviosRestricao,
  cxGraphics, cxControls, cxLookAndFeels,
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
  dxStatusBar, cxTextEdit, cxCalendar, clConexao;

type
  TfrmDetalhesRestricoes = class(TForm)
    cxLabel27: TcxLabel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dsDetalhesRestricoes: TDataSource;
    cxGrid1DBTableView1DES_EXTRAVIO: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_EXTRAVIO: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_NOSSONUMERO: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_TOTAL: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_ENTREGADOR: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_PRODUTO: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_MULTA: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_VERBA: TcxGridDBColumn;
    cxGrid1DBTableView1COD_ENTREGADOR: TcxGridDBColumn;
    aclDetalhesRestricoes: TActionList;
    actDetalhesRestricoesExportar: TAction;
    actDetalhesRestricoesSair: TAction;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    SaveDialog: TSaveDialog;
    dxStatusBar1: TdxStatusBar;
    dxStatusBar1Container0: TdxStatusBarContainerControl;
    cxProgressBar: TcxProgressBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actDetalhesRestricoesSairExecute(Sender: TObject);
    procedure actDetalhesRestricoesExportarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure AtualizaGrid;
    procedure ExportarGrade;
  public
    { Public declarations }
    sCodEntregadores: String;
    sTipo: String;
  end;

var
  frmDetalhesRestricoes: TfrmDetalhesRestricoes;
  thrextravios: thrPopularExtraviosRestricao;
  conexao: TConexao;

implementation

{$R *.dfm}

uses uGlobais, clUtil, udm;

procedure TfrmDetalhesRestricoes.actDetalhesRestricoesExportarExecute
  (Sender: TObject);
begin
  ExportarGrade;
end;

procedure TfrmDetalhesRestricoes.actDetalhesRestricoesSairExecute
  (Sender: TObject);
begin
  Close;
end;

procedure TfrmDetalhesRestricoes.AtualizaGrid;
begin
  dsDetalhesRestricoes.Enabled := False;
  thrextravios := thrPopularExtraviosRestricao.Create(True);
  thrextravios.FreeOnTerminate := True;
  thrextravios.Priority := tpNormal;
  thrextravios.Start;
end;

procedure TfrmDetalhesRestricoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dm.tbExtravios.Close;
  conexao.Free;
  Action := caFree;
  frmDetalhesRestricoes := Nil;
end;

procedure TfrmDetalhesRestricoes.FormShow(Sender: TObject);
begin
  conexao := TConexao.Create;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    actDetalhesRestricoesSairExecute(Sender);
    Exit;
  end;
  AtualizaGrid;
end;

procedure TfrmDetalhesRestricoes.ExportarGrade;
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
