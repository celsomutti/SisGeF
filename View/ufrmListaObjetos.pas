unit ufrmListaObjetos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, dxLayoutContainer, cxTextEdit, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses,
  cxGridCustomView, cxGrid, dxLayoutControl, System.Actions, Vcl.ActnList, dxLayoutControlAdapters, Vcl.Menus, Vcl.StdCtrls,
  cxButtons, cxGridExportLink, ShellAPI, dxLayoutcxEditAdapters, cxContainer, cxLabel;

type
  TfrmListaObjetos = class(TForm)
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dxLayoutControl1Item1: TdxLayoutItem;
    cxGrid1DBTableView1NUM_NOSSONUMERO: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_CEP: TcxGridDBColumn;
    cxGrid1DBTableView1QTD_DIAS_ATRASO: TcxGridDBColumn;
    aclLista: TActionList;
    actExportar: TAction;
    actSair: TAction;
    cxButton1: TcxButton;
    dxLayoutControl1Item2: TdxLayoutItem;
    cxButton2: TcxButton;
    dxLayoutControl1Item3: TdxLayoutItem;
    dxLayoutControl1Group1: TdxLayoutAutoCreatedGroup;
    ds: TDataSource;
    SaveDialog: TSaveDialog;
    cxLabel1: TcxLabel;
    dxLayoutControl1Item4: TdxLayoutItem;
    cxGrid1DBTableView1DAT_ATRIBUICAO: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_BAIXA: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_ENTREGA: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_PREV_DISTRIBUICAO: TcxGridDBColumn;
    procedure actSairExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actExportarExecute(Sender: TObject);
  private
    { Private declarations }
    procedure ExportarGrade;
  public
    { Public declarations }
  end;

var
  frmListaObjetos: TfrmListaObjetos;

implementation

{$R *.dfm}

uses udm;

procedure TfrmListaObjetos.actExportarExecute(Sender: TObject);
begin
  ExportarGrade;
end;

procedure TfrmListaObjetos.actSairExecute(Sender: TObject);
begin
  frmListaObjetos.Close;
end;

procedure TfrmListaObjetos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm.qryGetObject.Close;
  dm.qryGetObject.SQL.Clear;
  Action := caFree;
  frmListaObjetos := Nil;
end;

procedure TfrmListaObjetos.ExportarGrade;
var
  FileExt: String;
begin
  if not(dm.qryGrid.Active) then
  begin
    Exit;
  end;
  if dm.qryGrid.IsEmpty then
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
    ShellExecute(Handle, 'open', pChar(SaveDialog.FileName), nil, nil, SW_SHOW);
  end;
end;


end.
