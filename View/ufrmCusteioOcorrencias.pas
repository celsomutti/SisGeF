unit ufrmCusteioOcorrencias;

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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, dxLayoutContainer, dxLayoutControl, cxContainer, cxEdit, dxLayoutcxEditAdapters, cxLabel,
  dxBevel, Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, Data.DB, dxmdaset, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, cxSpinEdit, cxCurrencyEdit, cxDBLookupComboBox, cxMemo, System.Actions,
  Vcl.ActnList, dxLayoutControlAdapters, Vcl.Menus, Vcl.StdCtrls, cxButtons, clCusteioOcorrencias, cxGridExportLink, ShellAPI,
  cxImageComboBox;

type
  TfrmCusteioOcorrencia = class(TForm)
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    dxLayoutControl1Item1: TdxLayoutItem;
    cxLabel27: TcxLabel;
    cxDataInicial: TcxDateEdit;
    dxLayoutControl1Item2: TdxLayoutItem;
    cxDataFinal: TcxDateEdit;
    dxLayoutControl1Item3: TdxLayoutItem;
    dxLayoutControl1Group1: TdxLayoutAutoCreatedGroup;
    tbCusteio: TdxMemData;
    tbCusteioNUM_OCORRENCIA: TIntegerField;
    tbCusteioDAT_OCORRENCIA: TDateTimeField;
    tbCusteioCOD_ASSINATURA: TWideStringField;
    tbCusteioNOM_ASSINANTE: TWideStringField;
    tbCusteioDES_ROTEIRO: TWideStringField;
    tbCusteioCOD_ENTREGADOR: TIntegerField;
    tbCusteioCOD_PRODUTO: TStringField;
    tbCusteioCOD_OCORRENCIA: TIntegerField;
    tbCusteioDOM_REINCIDENTE: TWideStringField;
    tbCusteioDES_DESCRICAO: TStringField;
    tbCusteioDES_ENDERECO: TWideStringField;
    tbCusteioDES_RETORNO: TWideStringField;
    tbCusteioCOD_RESULTADO: TIntegerField;
    tbCusteioCOD_ORIGEM: TIntegerField;
    tbCusteioDES_OBS: TWideStringField;
    tbCusteioCOD_STATUS: TIntegerField;
    tbCusteioDES_APURACAO: TMemoField;
    tbCusteioDOM_PROCESSADO: TStringField;
    tbCusteioQTD_OCORRENCIAS: TIntegerField;
    tbCusteioVAL_OCORRENCIA: TFloatField;
    tbCusteioDES_LOG: TWideMemoField;
    tbCusteioDES_CHAVE: TStringField;
    tbCusteioDOM_FINALIZAR: TBooleanField;
    ds: TDataSource;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dxLayoutControl1Item4: TdxLayoutItem;
    cxGrid1DBTableView1RecId: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_OCORRENCIA: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_OCORRENCIA: TcxGridDBColumn;
    cxGrid1DBTableView1COD_ASSINATURA: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_ASSINANTE: TcxGridDBColumn;
    cxGrid1DBTableView1DES_ROTEIRO: TcxGridDBColumn;
    cxGrid1DBTableView1COD_ENTREGADOR: TcxGridDBColumn;
    cxGrid1DBTableView1COD_PRODUTO: TcxGridDBColumn;
    cxGrid1DBTableView1COD_OCORRENCIA: TcxGridDBColumn;
    cxGrid1DBTableView1DOM_REINCIDENTE: TcxGridDBColumn;
    cxGrid1DBTableView1DES_DESCRICAO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_ENDERECO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_RETORNO: TcxGridDBColumn;
    cxGrid1DBTableView1COD_RESULTADO: TcxGridDBColumn;
    cxGrid1DBTableView1COD_ORIGEM: TcxGridDBColumn;
    cxGrid1DBTableView1DES_OBS: TcxGridDBColumn;
    cxGrid1DBTableView1COD_STATUS: TcxGridDBColumn;
    cxGrid1DBTableView1DES_APURACAO: TcxGridDBColumn;
    cxGrid1DBTableView1DOM_PROCESSADO: TcxGridDBColumn;
    cxGrid1DBTableView1QTD_OCORRENCIAS: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_OCORRENCIA: TcxGridDBColumn;
    cxGrid1DBTableView1DES_LOG: TcxGridDBColumn;
    cxGrid1DBTableView1DES_CHAVE: TcxGridDBColumn;
    cxGrid1DBTableView1DOM_FINALIZAR: TcxGridDBColumn;
    dsProdutos: TDataSource;
    dsEntregador: TDataSource;
    cxLOG: TcxMemo;
    dxLayoutControl1Item5: TdxLayoutItem;
    aclCusteio: TActionList;
    actProcessar: TAction;
    actImportar: TAction;
    actExportar: TAction;
    actsair: TAction;
    cxButton1: TcxButton;
    dxLayoutControl1Item6: TdxLayoutItem;
    cxButton2: TcxButton;
    dxLayoutControl1Item7: TdxLayoutItem;
    cxButton3: TcxButton;
    dxLayoutControl1Item8: TdxLayoutItem;
    dxLayoutControl1Group2: TdxLayoutAutoCreatedGroup;
    cxButton4: TcxButton;
    dxLayoutControl1Item9: TdxLayoutItem;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    actEncerrar: TAction;
    cxButton5: TcxButton;
    dxLayoutControl1Item10: TdxLayoutItem;
    actConsolidado: TAction;
    cxButton6: TcxButton;
    dxLayoutControl1Item11: TdxLayoutItem;
    tbCusteioDAT_DESCONTO: TDateField;
    tbCusteioDOM_IMPRESSAO: TStringField;
    tbCusteioDES_ANEXO: TStringField;
    procedure actsairExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure actImportarExecute(Sender: TObject);
    procedure actExportarExecute(Sender: TObject);
    procedure actProcessarExecute(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure actConsolidadoExecute(Sender: TObject);
  private
    { Private declarations }
    custeio : TCusteioOcorrencias;
  public
    { Public declarations }
  end;

var
  frmCusteioOcorrencia: TfrmCusteioOcorrencia;

implementation

{$R *.dfm}

uses udm, uGlobais, clUtil;

procedure TfrmCusteioOcorrencia.actConsolidadoExecute(Sender: TObject);
begin
  if not TUtil.DataOk(cxDataInicial.Text) then
  begin
    Application.MessageBox('Informe a data Inicial do período!', PChar('Atenção ' + uGlobais.sUsuario),
                           MB_OK + MB_ICONEXCLAMATION);
    cxDataInicial.SetFocus;
    Exit;
  end;
  if not TUtil.DataOk(cxDataFinal.Text) then
  begin
    Application.MessageBox('Informe a data Final do período!', PChar('Atenção ' + uGlobais.sUsuario),
                           MB_OK + MB_ICONEXCLAMATION);
    cxDataFinal.SetFocus;
    Exit;
  end;
  if cxDataFinal.Date < cxDataInicial.Date then
  begin
    Application.MessageBox('A data Final do período é menor que a data Inicial!', PChar('Atenção ' + uGlobais.sUsuario),
                           MB_OK + MB_ICONEXCLAMATION);
    cxDataFinal.SetFocus;
    Exit;
  end;
  custeio.DataInicial := cxDataInicial.Text;
  custeio.DataFinal := cxDataFinal.Text;
  custeio.Consolidado;
end;

procedure TfrmCusteioOcorrencia.actExportarExecute(Sender: TObject);
var
  FileExt, sFile: String;
begin
  if not tbCusteio.Active then
  begin
    Exit;
  end;
  if tbCusteio.IsEmpty then
  begin
    Exit;
  end;
  sFile := 'ocorrencias';
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

procedure TfrmCusteioOcorrencia.actImportarExecute(Sender: TObject);
begin
 custeio.Mensagem := '';
  if OpenDialog.Execute then
  begin
    custeio.ProcessaCusteio(OpenDialog.FileName);
    cxLOG.Clear;
    cxLOG.Text := custeio.Mensagem;
  end;
end;

procedure TfrmCusteioOcorrencia.actProcessarExecute(Sender: TObject);
begin
  if TUtil.Empty(cxDataInicial.Text) then
  begin
    Application.MessageBox('Informe a data Inicial do período!', PChar('Atenção ' + uGlobais.sUsuario),
                           MB_OK + MB_ICONEXCLAMATION);
    cxDataInicial.SetFocus;
    Exit;
  end;
  if TUtil.Empty(cxDataFinal.Text) then
  begin
    Application.MessageBox('Informe a data Final do período!', PChar('Atenção ' + uGlobais.sUsuario),
                           MB_OK + MB_ICONEXCLAMATION);
    cxDataFinal.SetFocus;
    Exit;
  end;
  if cxDataFinal.Date < cxDataInicial.Date then
  begin
    Application.MessageBox('A data Final do período é menor que a data Inicial!', PChar('Atenção ' + uGlobais.sUsuario),
                           MB_OK + MB_ICONEXCLAMATION);
    cxDataFinal.SetFocus;
    Exit;
  end;
  custeio.DataInicial := cxDataInicial.Text;
  custeio.DataFinal := cxDataFinal.Text;
  custeio.Tipo := 4;
  custeio.PopulaOcorrencias(tbCusteio);
end;

procedure TfrmCusteioOcorrencia.actsairExecute(Sender: TObject);
begin
  Perform(WM_CLOSE, 0, 0);
end;

procedure TfrmCusteioOcorrencia.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
  cxGrid1DBTableView1.ViewData.Expand(True);
end;

procedure TfrmCusteioOcorrencia.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm.tbListaEntregadores.Close;
  dm.tbProdutos.Close;
  custeio.Free;
  Action := caFree;
  frmCusteioOcorrencia := nil;
end;

procedure TfrmCusteioOcorrencia.FormShow(Sender: TObject);
begin
  custeio := TCusteioOcorrencias.Create();
  custeio.PopulaProdutos;
  custeio.PopulaEntregadores;
end;

end.
