unit View.ExtratoExpressas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxClasses, dxLayoutContainer, dxLayoutControl,
  cxContainer, cxEdit, dxLayoutcxEditAdapters, cxLabel, Data.DB, dxmdaset, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxCurrencyEdit, cxImageComboBox, cxCalendar, System.Actions, Vcl.ActnList,
  dxLayoutControlAdapters, Vcl.Menus, Vcl.StdCtrls, cxButtons, dxSkinsdxStatusBarPainter, dxStatusBar, cxProgressBar, Thread.PopulaExtratoExpressa, cxGridExportLink, ShellAPI;

type
  Tview_ExtratoExpressas = class(TForm)
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    cxLabel1: TcxLabel;
    dxLayoutItem1: TdxLayoutItem;
    mtbExtrato: TdxMemData;
    mtbExtratoID_EXTRATO: TIntegerField;
    mtbExtratoCOD_AGENTE: TIntegerField;
    mtbExtratoNOM_AGENTE: TStringField;
    mtbExtratoCOD_ENTREGADOR: TIntegerField;
    mtbExtratoNOM_ENTREGADOR: TStringField;
    mtbExtratoDAT_INICIO: TDateField;
    mtbExtratoDAT_FINAL: TDateField;
    mtbExtratoDAT_PAGAMENTO: TDateField;
    mtbExtratoQTD_VOLUMES: TIntegerField;
    mtbExtratoQTD_ENTREGAS: TIntegerField;
    mtbExtratoQTD_ITENS_ATRASO: TIntegerField;
    mtbExtratoQTD_VOLUMES_EXTRA: TFloatField;
    mtbExtratoVAL_PERCENTUAL_SLA: TFloatField;
    mtbExtratoVAL_VERBA: TFloatField;
    mtbExtratoVAL_ENTREGAS: TFloatField;
    mtbExtratoVAL_VOLUMES_EXTRA: TFloatField;
    mtbExtratoVAL_PRODUCAO: TFloatField;
    mtbExtratoVAL_CREDITOS: TFloatField;
    mtbExtratoVAL_RESTRICAO: TFloatField;
    mtbExtratoVAL_EXTRAVIOS: TFloatField;
    mtbExtratoVAL_DEBITOS: TFloatField;
    mtbExtratoVAL_TOTAL_CREDTOS: TFloatField;
    mtbExtratoVAL_TOTAL_DEBITOS: TFloatField;
    mtbExtratoVAL_TOTAL_GERAL: TFloatField;
    mtbExtratoDOM_FECHADO: TIntegerField;
    mtbExtratoDES_LOG: TMemoField;
    tvExtrato: TcxGridDBTableView;
    lvExtrato: TcxGridLevel;
    grdExtrato: TcxGrid;
    dxLayoutItem2: TdxLayoutItem;
    dsExtrato: TDataSource;
    tvExtratoRecId: TcxGridDBColumn;
    tvExtratoID_EXTRATO: TcxGridDBColumn;
    tvExtratoCOD_AGENTE: TcxGridDBColumn;
    tvExtratoNOM_AGENTE: TcxGridDBColumn;
    tvExtratoCOD_ENTREGADOR: TcxGridDBColumn;
    tvExtratoNOM_ENTREGADOR: TcxGridDBColumn;
    tvExtratoDAT_INICIO: TcxGridDBColumn;
    tvExtratoDAT_FINAL: TcxGridDBColumn;
    tvExtratoDAT_PAGAMENTO: TcxGridDBColumn;
    tvExtratoQTD_VOLUMES: TcxGridDBColumn;
    tvExtratoQTD_ENTREGAS: TcxGridDBColumn;
    tvExtratoQTD_ITENS_ATRASO: TcxGridDBColumn;
    tvExtratoQTD_VOLUMES_EXTRA: TcxGridDBColumn;
    tvExtratoVAL_PERCENTUAL_SLA: TcxGridDBColumn;
    tvExtratoVAL_VERBA: TcxGridDBColumn;
    tvExtratoVAL_ENTREGAS: TcxGridDBColumn;
    tvExtratoVAL_VOLUMES_EXTRA: TcxGridDBColumn;
    tvExtratoVAL_PRODUCAO: TcxGridDBColumn;
    tvExtratoVAL_CREDITOS: TcxGridDBColumn;
    tvExtratoVAL_RESTRICAO: TcxGridDBColumn;
    tvExtratoVAL_EXTRAVIOS: TcxGridDBColumn;
    tvExtratoVAL_DEBITOS: TcxGridDBColumn;
    tvExtratoVAL_TOTAL_CREDTOS: TcxGridDBColumn;
    tvExtratoVAL_TOTAL_DEBITOS: TcxGridDBColumn;
    tvExtratoVAL_TOTAL_GERAL: TcxGridDBColumn;
    tvExtratoDOM_FECHADO: TcxGridDBColumn;
    tvExtratoDES_LOG: TcxGridDBColumn;
    aclExtrato: TActionList;
    actFechar: TAction;
    btnFechar: TcxButton;
    dxLayoutItem3: TdxLayoutItem;
    sbExtrato: TdxStatusBar;
    dxLayoutItem4: TdxLayoutItem;
    sbExtratoContainer1: TdxStatusBarContainerControl;
    pbExtrato: TcxProgressBar;
    SaveDialog: TSaveDialog;
    mtbExtratoQTD_PFP: TIntegerField;
    procedure actFecharExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tvExtratoNavigatorButtonsButtonClick(Sender: TObject; AButtonIndex: Integer; var ADone: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure PopulaDados;
    procedure Exportar;
  public
    { Public declarations }
    dtInicial: TDate;
    dtTermino: TDate;
  end;

var
  view_ExtratoExpressas: Tview_ExtratoExpressas;
  thrPopula: Thread_PopulaExtratoExpressa;
implementation

{$R *.dfm}

uses udm;

procedure Tview_ExtratoExpressas.actFecharExecute(Sender: TObject);
begin
  Perform(WM_CLOSE, 0, 0);
end;

procedure Tview_ExtratoExpressas.Exportar;
var
  FileExt, sFile: String;
begin
  if not (mtbExtrato.Active) then
  begin
    Exit;
  end;
  if mtbExtrato.IsEmpty then
  begin
    Exit;
  end;
  sFile := 'extravios';
  SaveDialog.FileName := sFile;
  SaveDialog.Filter := '';
  SaveDialog.Filter := 'Excel (*.xls) |*.xls|XML (*.xml) |*.xml|Arquivo Texto (*.txt) |*.txt|Página Web (*.html)|*.html';
  SaveDialog.Title := 'Exportar Dados';
  SaveDialog.DefaultExt := 'xls';
  if SaveDialog.Execute then
  begin
    FileExt := LowerCase(ExtractFileExt(SaveDialog.FileName));
    if FileExt = '.xls' then
      ExportGridToExcel(SaveDialog.FileName, grdExtrato, False, True, False)
    else if FileExt = '.xml' then
      ExportGridToXML(SaveDialog.FileName, grdExtrato, False)
    else if FileExt = '.txt' then
      ExportGridToText(SaveDialog.FileName, grdExtrato, False)
    else if FileExt = '.html' then
      ExportGridToHTML(SaveDialog.FileName, grdExtrato, False);
    ShellExecute(Handle, 'open', pchar(SaveDialog.FileName), nil, nil, SW_SHOW);
  end;
end;

procedure Tview_ExtratoExpressas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  mtbExtrato.Close;
  Action := caFree;
  view_ExtratoExpressas := Nil;
end;

procedure Tview_ExtratoExpressas.FormShow(Sender: TObject);
begin
  PopulaDados;
end;

procedure Tview_ExtratoExpressas.PopulaDados;
begin
  thrPopula := Thread_PopulaExtratoExpressa.Create(True);
  thrPopula.FreeOnTerminate := True;
  thrPopula.Priority := tpNormal;
  thrPopula.dtInicio := dtInicial;
  thrPopula.dtFinal := dtTermino;
  thrPopula.Start;
end;

procedure Tview_ExtratoExpressas.tvExtratoNavigatorButtonsButtonClick(Sender: TObject; AButtonIndex: Integer; var ADone: Boolean);
begin
  case AButtonIndex of
    16: Exportar;
  end;
end;

end.
