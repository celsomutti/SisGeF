unit ufrmConsolidadoBaseJornal;

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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, dxLayoutContainer, dxLayoutControl, System.Actions, Vcl.ActnList, cxContainer, cxEdit,
  dxLayoutcxEditAdapters, cxLabel, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxGridExportLink,
  ShellAPI, cxTextEdit, cxCurrencyEdit, dxLayoutControlAdapters, Vcl.Menus, Vcl.StdCtrls, cxButtons;

type
  TfrmConsolidadoBaseJornal = class(TForm)
    aclConsolidadoBaseJornal: TActionList;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    dxLayoutControl1Item1: TdxLayoutItem;
    cxLabel27: TcxLabel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dxLayoutControl1Item2: TdxLayoutItem;
    actExportar: TAction;
    actSair: TAction;
    cxGrid1DBTableView1DES_ROTEIRO: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_OCORRENCIA: TcxGridDBColumn;
    SaveDialog: TSaveDialog;
    dsConsolidado: TDataSource;
    cxButton1: TcxButton;
    dxLayoutControl1Item3: TdxLayoutItem;
    cxButton2: TcxButton;
    dxLayoutControl1Item4: TdxLayoutItem;
    dxLayoutControl1Group1: TdxLayoutAutoCreatedGroup;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actSairExecute(Sender: TObject);
    procedure actExportarExecute(Sender: TObject);
  private
    { Private declarations }
    procedure Exportar;
  public
    { Public declarations }
  end;

var
  frmConsolidadoBaseJornal: TfrmConsolidadoBaseJornal;

implementation

{$R *.dfm}

uses udm;

procedure TfrmConsolidadoBaseJornal.actExportarExecute(Sender: TObject);
begin
  Exportar();
end;

procedure TfrmConsolidadoBaseJornal.actSairExecute(Sender: TObject);
begin
  Perform(WM_CLOSE, 0, 0);
end;

procedure TfrmConsolidadoBaseJornal.Exportar;
var
  FileExt, sFile: String;
begin
  if not(dm.qryCalculo.Active) then
  begin
    Exit;
  end;
  if dm.qryCalculo.IsEmpty then
  begin
    Exit;
  end;
  sFile := 'consolidado';
  SaveDialog.FileName := sFile;
  SaveDialog.Filter := '';
  SaveDialog.Filter :=
    'Excel (*.xls) |*.xls|XML (*.xml) |*.xml|Arquivo Texto (*.txt) |*.txt|Página Web (*.html)|*.html';
  SaveDialog.Title := 'Exportar Dados';
  SaveDialog.DefaultExt := 'xls';
  if SaveDialog.Execute then
  begin
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


procedure TfrmConsolidadoBaseJornal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmConsolidadoBaseJornal := Nil;
end;

end.
