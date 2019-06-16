unit View.ManutencaoRepartes;

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
  Model.ProdutosVA, Model.BancaVA, Model.DistribuidorVA, Model.RemessasVA, DAO.ProdutosVA, DAO.BancaVA, DAO.DistribuidorVA,
  DAO.RemessasVA, System.Generics.Collections, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, Data.DB, Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar, dxLayoutControlAdapters, Vcl.Menus, Vcl.StdCtrls,
  cxButtons, System.Actions, Vcl.ActnList, dxSkinsdxStatusBarPainter, dxStatusBar, cxProgressBar, dxmdaset, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxCurrencyEdit, cxImageComboBox, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Comp.BatchMove.DataSet, FireDAC.Comp.BatchMove,
  FireDAC.Comp.BatchMove.Text, cxButtonEdit, cxGridCustomPopupMenu, cxGridPopupMenu, Thread.GravaRemessasVA, dxPSGlbl, dxPSUtl,
  dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, dxPScxEditorProducers, dxPScxExtEditorProducers, dxSkinsdxBarPainter, dxSkinsdxRibbonPainter, dxPSCore,
  dxPScxCommon, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  Tview_ManutencaoRepartesVA = class(TForm)
    lcgRoot: TdxLayoutGroup;
    lcRepartes: TdxLayoutControl;
    lblTitulo: TcxLabel;
    lciTitulo: TdxLayoutItem;
    lcgFiltro: TdxLayoutGroup;
    mskCodigoDistribuidor: TcxMaskEdit;
    lciCodigoDistribuidor: TdxLayoutItem;
    lcbNomeDistribuidor: TcxLookupComboBox;
    lciNomeDistribuidor: TdxLayoutItem;
    dsDistribuidor: TDataSource;
    mskCodigoBanca: TcxMaskEdit;
    lciCodigoBanca: TdxLayoutItem;
    lcbNomeBanca: TcxLookupComboBox;
    lciNomeBanca: TdxLayoutItem;
    dsBancas: TDataSource;
    cbotipodata: TcxComboBox;
    lciTipoData: TdxLayoutItem;
    datData: TcxDateEdit;
    lciData: TdxLayoutItem;
    btnProcessar: TcxButton;
    lciProcessar: TdxLayoutItem;
    aclRemessas: TActionList;
    actProcessar: TAction;
    sbRepartes: TdxStatusBar;
    lciBarraStatus: TdxLayoutItem;
    sbRepartesContainer1: TdxStatusBarContainerControl;
    pbRepartes: TcxProgressBar;
    tvRepartes: TcxGridDBTableView;
    lvRepartes: TcxGridLevel;
    grdRepartes: TcxGrid;
    lciRepartes: TdxLayoutItem;
    dsRepartes: TDataSource;
    tvRepartesRecId: TcxGridDBColumn;
    tvRepartesID_REMESSA: TcxGridDBColumn;
    tvRepartesCOD_DISTRIBUIDOR: TcxGridDBColumn;
    tvRepartesCOD_BANCA: TcxGridDBColumn;
    tvRepartesCOD_PRODUTO: TcxGridDBColumn;
    tvRepartesDAT_REMESSA: TcxGridDBColumn;
    tvRepartesNUM_REMESSA: TcxGridDBColumn;
    tvRepartesQTD_REMESSA: TcxGridDBColumn;
    tvRepartesDAT_RECOBERTURA: TcxGridDBColumn;
    tvRepartesQTD_RECOBERTURA: TcxGridDBColumn;
    tvRepartesDAT_CHAMADA: TcxGridDBColumn;
    tvRepartesNUM_DEVOLUCAO: TcxGridDBColumn;
    tvRepartesQTD_ENCALHE: TcxGridDBColumn;
    tvRepartesVAL_COBRANCA: TcxGridDBColumn;
    tvRepartesVAL_VENDA: TcxGridDBColumn;
    tvRepartesDOM_INVENTARIO: TcxGridDBColumn;
    tvRepartesNOM_BANCA: TcxGridDBColumn;
    tvRepartesDES_PRODUTO: TcxGridDBColumn;
    tvRepartesNOM_DISTRIBUIDOR: TcxGridDBColumn;
    actCancelarOperacao: TAction;
    dsProduto: TDataSource;
    lcgRepartes: TdxLayoutGroup;
    lcgManutencao: TdxLayoutGroup;
    lcgImportacao: TdxLayoutGroup;
    lcgGeral: TdxLayoutAutoCreatedGroup;
    edtArquivo: TcxButtonEdit;
    lciArquivo: TdxLayoutItem;
    tvRemessas: TcxGridDBTableView;
    lvRemessas: TcxGridLevel;
    grdRemessas: TcxGrid;
    lciGradeRemessas: TdxLayoutItem;
    tvRemessasCOD_BANCA: TcxGridDBColumn;
    tvRemessasDAT_CIRCULACAO: TcxGridDBColumn;
    tvRemessasCOD_PRODUTO: TcxGridDBColumn;
    tvRemessasDES_PRODUTO: TcxGridDBColumn;
    tvRemessasQTD_REMESSA: TcxGridDBColumn;
    actImportarRemessa: TAction;
    btnImportarRemessa: TcxButton;
    lciImportar: TdxLayoutItem;
    lcgArquivo: TdxLayoutAutoCreatedGroup;
    OpenDialog: TOpenDialog;
    btnGravarImportacao: TcxButton;
    lciBotaoGravar: TdxLayoutItem;
    actGravarImportacao: TAction;
    actFechar: TAction;
    btnFechar: TcxButton;
    lciFechar: TdxLayoutItem;
    pmRepartes: TPopupMenu;
    actpmExpandir: TAction;
    actpmRecolher: TAction;
    gpmREpartes: TcxGridPopupMenu;
    Expandir1: TMenuItem;
    Recolher1: TMenuItem;
    btnCancelarOperacao: TcxButton;
    lciCancelarOperacao: TdxLayoutItem;
    actLimparDados: TAction;
    btnLimparDados: TcxButton;
    lciLimparDados: TdxLayoutItem;
    lcRepartesGroup1: TdxLayoutAutoCreatedGroup;
    ComponentPrinter: TdxComponentPrinter;
    actImprimir: TAction;
    btnImprimirRemessas: TcxButton;
    lciImprimirRemessas: TdxLayoutItem;
    lcRepartesGroup2: TdxLayoutAutoCreatedGroup;
    ComponentPrinterLink1: TdxGridReportLink;
    actEditar: TAction;
    actGravar: TAction;
    btnEditar: TcxButton;
    lciEditar: TdxLayoutItem;
    btnGravar: TcxButton;
    lciGravar: TdxLayoutItem;
    procedure mskCodigoDistribuidorPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure lcbNomeDistribuidorPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure mskCodigoBancaPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure lcbNomeBancaPropertiesChange(Sender: TObject);
    procedure actImportarRemessaExecute(Sender: TObject);
    procedure edtArquivoPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actGravarImportacaoExecute(Sender: TObject);
    procedure actProcessarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actpmExpandirExecute(Sender: TObject);
    procedure actpmRecolherExecute(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
    procedure actCancelarOperacaoExecute(Sender: TObject);
    procedure actLimparDadosExecute(Sender: TObject);
    procedure actImprimirExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure actGravarExecute(Sender: TObject);
  private
    { Private declarations }
    function DataDevolucao(dtData: TDate; sProduto: string): TDate;
    procedure Filtro;
    procedure ClearForm;
    procedure AbrirArquivoRemessa;
    procedure ImportaRemessa;
    procedure GravaImportacaoRemessa;
    procedure CancelarOperacao;
    procedure LimpaDados;
  public
    { Public declarations }
  end;

var
  view_ManutencaoRepartesVA: Tview_ManutencaoRepartesVA;
  banca : TBancaVA;
  bancaTMP: TBancaVA;
  bancas : TObjectList<TBancaVA>;
  bancaDAO : TBancaVADAO;
  distribuidor : TDistribuidorVA;
  distribuidorTMP: TDistribuidorVA;
  distribuidores : TObjectList<TDistribuidorVA>;
  distribuidorDAO : TDistribuidorVADAO;
  produto : TProdutosVA;
  produtoTMP: TProdutosVA;
  produtos : TObjectList<TProdutosVA>;
  produtoDAO : TProdutosVADAO;
  remessa : TRemessasVA;
  remessaTMP: TRemessasVA;
  remessas : TObjectList<TRemessasVA>;
  remessaDAO : TRemessasVADAO;
  thrRemessa: Thread_GravaRemessasVA;
implementation

{$R *.dfm}

uses udm, uGlobais, View.ResultatoProcesso;

procedure Tview_ManutencaoRepartesVA.lcbNomeBancaPropertiesChange(Sender: TObject);
begin
  mskCodigoBanca.Text := VarToStr(lcbNomeBanca.EditValue);
end;

procedure Tview_ManutencaoRepartesVA.lcbNomeDistribuidorPropertiesValidate(Sender: TObject; var DisplayValue: Variant;
  var ErrorText: TCaption; var Error: Boolean);
begin
  mskCodigoDistribuidor.Text := VarToStr(lcbNomeDistribuidor.EditValue);
end;

procedure Tview_ManutencaoRepartesVA.mskCodigoBancaPropertiesValidate(Sender: TObject; var DisplayValue: Variant;
  var ErrorText: TCaption; var Error: Boolean);
begin
  lcbNomeBanca.EditValue := DisplayValue;
end;

procedure Tview_ManutencaoRepartesVA.mskCodigoDistribuidorPropertiesValidate(Sender: TObject; var DisplayValue: Variant;
  var ErrorText: TCaption; var Error: Boolean);
begin
  lcbNomeDistribuidor.EditValue := DisplayValue;
end;

procedure Tview_ManutencaoRepartesVA.Filtro;
var
  sFiltro : String;
begin
  if datData.Date = 0 then
  begin
    Application.MessageBox(PChar('Informe a data da ' + cboTipoData.Text + '!'), 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  sFiltro := '';
  if dm.fdqRemessasVA.Active then dm.fdqRemessasVA.Close;
  if StrToIntDef(mskCodigoDistribuidor.Text,0) > 0 then
  begin
    if sFiltro.IsEmpty then
    begin
      sFiltro := SFiltro + 'COD_DISTRIBUIDOR = ' + mskCodigoDistribuidor.Text;
    end
    else
    begin
      sFiltro := SFiltro + 'AND COD_DISTRIBUIDOR = ' + mskCodigoDistribuidor.Text;
    end;
  end;
  if StrToIntDef(mskCodigoBanca.Text,0) > 0 then
  begin
    if sFiltro.IsEmpty then
    begin
      sFiltro := SFiltro + 'COD_BANCA = ' + mskCodigoBanca.Text;
    end
    else
    begin
      sFiltro := SFiltro + 'AND COD_BANCA = ' + mskCodigoBanca.Text;
    end;
  end;
  if cbotipodata.ItemIndex = 0 then
  begin
    if sFiltro.IsEmpty then
    begin
      sFiltro := SFiltro + 'DAT_REMESSA = ' + QuotedStr(datData.Text);
    end
    else
    begin
      sFiltro := SFiltro + 'AND DAT_REMESSA = ' + QuotedStr(datData.Text);
    end;
  end
  else if cbotipodata.ItemIndex = 1 then
  begin
    if sFiltro.IsEmpty then
    begin
      sFiltro := SFiltro + 'DAT_CHAMADA = ' + QuotedStr(datData.Text);
    end
    else
    begin
      sFiltro := SFiltro + 'AND DAT_CHAMADA = ' + QuotedStr(datData.Text);
    end;
  end;
  dm.fdqRemessasVA.Filter := sFiltro;
  dm.fdqRemessasVA.Filtered := True;
  dm.fdqRemessasVA.Active := True;
  tvRepartes.ViewData.Expand(True)
end;

procedure Tview_ManutencaoRepartesVA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm.fdqProdutosVA.Close;
  dm.fdqBancas.Close;
  dm.fdqDistribuidor.Close;
  if dm.fdmRemessa.Active then dm.fdmRemessa.Close;
  if dm.fdqRemessasVA.Active then dm.fdqRemessasVA.Close;
  dm.fdqRemessasVA.Filtered := False;
  dm.fdqRemessasVA.Filter := '';
  Action := caFree;
  view_ManutencaoRepartesVA := Nil;
end;

procedure Tview_ManutencaoRepartesVA.FormShow(Sender: TObject);
begin
  dm.fdqProdutosVA.Active := True;;
  dm.fdqBancas.Active := True;;
  dm.fdqDistribuidor.Active := True;;
end;

procedure Tview_ManutencaoRepartesVA.actCancelarOperacaoExecute(Sender: TObject);
begin
  CancelarOperacao;
end;

procedure Tview_ManutencaoRepartesVA.actEditarExecute(Sender: TObject);
begin
  dm.fdqRemessasVA.Edit;
  tvRepartesQTD_ENCALHE.FocusWithSelection;
end;

procedure Tview_ManutencaoRepartesVA.actFecharExecute(Sender: TObject);
begin
  Perform(WM_CLOSE, 0, 0);
end;

procedure Tview_ManutencaoRepartesVA.actGravarExecute(Sender: TObject);
begin
  if Application.MessageBox('Confirma gravar as alterações?', 'Gravar', MB_YESNO + MB_ICONQUESTION) = IDNO then Exit;
  dm.fdqRemessasVA.Post;
  dm.fdqRemessasVA.CommitUpdates();
end;

procedure Tview_ManutencaoRepartesVA.actGravarImportacaoExecute(Sender: TObject);
begin
  GravaImportacaoRemessa
end;

procedure Tview_ManutencaoRepartesVA.actImportarRemessaExecute(Sender: TObject);
begin
  ImportaRemessa;
end;

procedure Tview_ManutencaoRepartesVA.actImprimirExecute(Sender: TObject);
begin
  if not dm.fdqRemessasVA.Active then Exit;
  ComponentPrinter.Preview();
end;

procedure Tview_ManutencaoRepartesVA.actLimparDadosExecute(Sender: TObject);
begin
  LimpaDados;
end;

procedure Tview_ManutencaoRepartesVA.actpmExpandirExecute(Sender: TObject);
begin
  tvRepartes.ViewData.Expand(True);
end;

procedure Tview_ManutencaoRepartesVA.actpmRecolherExecute(Sender: TObject);
begin
  tvRepartes.ViewData.Collapse(True);
end;

procedure Tview_ManutencaoRepartesVA.actProcessarExecute(Sender: TObject);
begin
  Filtro;
end;

procedure Tview_ManutencaoRepartesVA.ClearForm;
begin
  mskCodigoDistribuidor.Text := '0';
  lcbNomeDistribuidor.Clear;
  mskCodigoBanca.Text := '0';
  lcbNomeBanca.Clear;
  cbotipodata.ItemIndex := 0;
  datData.Clear;
end;

procedure Tview_ManutencaoRepartesVA.edtArquivoPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  AbrirArquivoRemessa;
end;

procedure Tview_ManutencaoRepartesVA.AbrirArquivoRemessa;
begin
  if OpenDialog.Execute then
  begin
    edtArquivo.Text := OpenDialog.FileName;
  end;
end;

procedure Tview_ManutencaoRepartesVA.ImportaRemessa;
begin
  if edtArquivo.Text = '' then Exit;
  if not FileExists(edtArquivo.Text) then
  begin
    Application.MessageBox(PChar('Arquivo ' + edtArquivo.Text + ' não foi encontrado!'), 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  dm.FDBatchMoveTextReaderRemessa.FileName := edtArquivo.Text;
  if dm.fdmRemessa.Active then dm.fdmRemessa.Close;
  dm.FDBatchMoveRemessa.Execute;
  dm.fdmRemessa.Open;
end;

procedure Tview_ManutencaoRepartesVA.GravaImportacaoRemessa;
begin
  if not dm.fdmRemessa.Active then Exit;
  if dm.fdmRemessa.IsEmpty then Exit;
  if Application.MessageBox('Confirma Gravar das remessas?', 'Gravar Remessas', MB_YESNO + MB_ICONQUESTION) = IDNO then Exit;
  thrRemessa := Thread_GravaRemessasVA.Create(True);
  thrRemessa.FreeOnTerminate := True;
  thrRemessa.Priority := tpNormal;
  thrRemessa.Start;
end;

procedure Tview_ManutencaoRepartesVA.CancelarOperacao;
begin
  if dm.fdqRemessasVA.Active then dm.fdqRemessasVA.Close;
  dm.fdqRemessasVA.Filtered := False;
  dm.fdqRemessasVA.Filter := '';
  mskCodigoDistribuidor.Text := '0';
  lcbNomeDistribuidor.EditValue := 0;
  mskCodigoBanca.Text := '0';
  lcbNomeBanca.EditValue := 0;
  cbotipodata.ItemIndex := 0;
  datData.Clear;
  mskCodigoDistribuidor.SetFocus;
end;

function Tview_ManutencaoRepartesVA.DataDevolucao(dtData: TDate; sProduto: string): TDate;
var
  iDia: Integer;
  dtDataDevolucao: TDate;
begin
  try
    Result := 0;
    iDia := 0;
    produtoDAO := TProdutosVADAO.Create;
    produtos := produtoDAO.FindByCodigo(sProduto);
    if produtos.Count > 0 then
    begin
      if produtos[0].Diario = 1 then
      begin
        iDia := DayOfWeek(dtData);
        if iDia in [2,3,4,5] then
        begin
          dtDataDevolucao := dtData + 1;
        end
        else if iDia = 6 then
        begin
          dtDataDevolucao := dtData + 3;
        end
        else if iDia = 7 then
        begin
          dtDataDevolucao := dtData + 2;
        end
        else if iDia = 1 then
        begin
          dtDataDevolucao := dtData + 2;
        end;
        Result := dtDataDevolucao;
      end;
    end;
  finally
    produtoTMP.Free;
    produtoDAO.Free;
    produtos.Free;
  end;
end;

procedure Tview_ManutencaoRepartesVA.LimpaDados;
begin
  if dm.fdmRemessa.Active then dm.fdmRemessa.Close;
  edtArquivo.SetFocus;
  edtArquivo.Clear;
end;


end.
