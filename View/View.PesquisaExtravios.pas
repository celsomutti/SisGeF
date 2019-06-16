unit View.PesquisaExtravios;

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
  cxContainer, cxEdit, dxLayoutcxEditAdapters, cxTextEdit, DAO.Entregadores, DAO.ExtraviosMultas, Model.Entregadores, Model.ExtraviosMultas, System.Actions, Vcl.ActnList,
  dxLayoutControlAdapters, Vcl.Menus, Vcl.StdCtrls, cxButtons, Data.DB, dxSkinsdxStatusBarPainter, dxStatusBar, cxProgressBar, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxDropDownEdit, cxBlobEdit, cxCheckBox,
  cxCurrencyEdit, cxCalendar, cxDBLookupComboBox, Generics.Collections, cxGridExportLink, ShellAPI, cxImageComboBox;

type
  Tview_PesquisaExtravios = class(TForm)
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    dxLayoutGroup1: TdxLayoutGroup;
    txtParametro: TcxTextEdit;
    dxLayoutItem1: TdxLayoutItem;
    aclPesquisa: TActionList;
    actPesquisar: TAction;
    cxButton1: TcxButton;
    dxLayoutItem2: TdxLayoutItem;
    dsPesquisa: TDataSource;
    dxStatusBar1: TdxStatusBar;
    dxLayoutItem3: TdxLayoutItem;
    dxStatusBar1Container1: TdxStatusBarContainerControl;
    cxProgressBar1: TcxProgressBar;
    tvExtravios: TcxGridDBTableView;
    lvExtravios: TcxGridLevel;
    grdExtravios: TcxGrid;
    dxLayoutItem4: TdxLayoutItem;
    actSelecionar: TAction;
    actFechar: TAction;
    cxButton2: TcxButton;
    dxLayoutItem5: TdxLayoutItem;
    cxButton3: TcxButton;
    dxLayoutItem6: TdxLayoutItem;
    dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
    tvExtraviosRecId: TcxGridDBColumn;
    tvExtraviosCOD_EXTRAVIO: TcxGridDBColumn;
    tvExtraviosDES_EXTRAVIO: TcxGridDBColumn;
    tvExtraviosNUM_NOSSONUMERO: TcxGridDBColumn;
    tvExtraviosCOD_AGENTE: TcxGridDBColumn;
    tvExtraviosVAL_PRODUTO: TcxGridDBColumn;
    tvExtraviosDAT_EXTRAVIO: TcxGridDBColumn;
    tvExtraviosVAL_MULTA: TcxGridDBColumn;
    tvExtraviosVAL_VERBA: TcxGridDBColumn;
    tvExtraviosVAL_TOTAL: TcxGridDBColumn;
    tvExtraviosDOM_RESTRICAO: TcxGridDBColumn;
    tvExtraviosCOD_ENTREGADOR: TcxGridDBColumn;
    tvExtraviosCOD_TIPO: TcxGridDBColumn;
    tvExtraviosVAL_EXTRATO_FRANQUIA: TcxGridDBColumn;
    tvExtraviosDOM_EXTRATO_FRANQUIA: TcxGridDBColumn;
    tvExtraviosDAT_EXTRAVIO_FRANQUIA: TcxGridDBColumn;
    tvExtraviosDES_ENVIO_CORRESPONDENCIA: TcxGridDBColumn;
    tvExtraviosDES_RETORNO_CORRESPONDENCIA: TcxGridDBColumn;
    tvExtraviosDES_OBSERVACOES: TcxGridDBColumn;
    tvExtraviosNOM_EXECUTOR: TcxGridDBColumn;
    tvExtraviosDAT_MANUTENCAO: TcxGridDBColumn;
    tvExtraviosNOM_AGENTE: TcxGridDBColumn;
    tvExtraviosNOM_ENTREGADOR: TcxGridDBColumn;
    dsAgentes: TDataSource;
    dsEntregadores: TDataSource;
    tvExtraviosVAL_PERCENTUAL_PAGO: TcxGridDBColumn;
    SaveDialog: TSaveDialog;
    actFinalizar: TAction;
    cxButton4: TcxButton;
    dxLayoutItem7: TdxLayoutItem;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actFecharExecute(Sender: TObject);
    procedure tvExtraviosNavigatorButtonsButtonClick(Sender: TObject; AButtonIndex: Integer; var ADone: Boolean);
    procedure actPesquisarExecute(Sender: TObject);
    procedure actSelecionarExecute(Sender: TObject);
    procedure txtParametroEnter(Sender: TObject);
    procedure txtParametroExit(Sender: TObject);
    procedure grdExtraviosEnter(Sender: TObject);
    procedure grdExtraviosExit(Sender: TObject);
    procedure tvExtraviosCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState;
      var AHandled: Boolean);
    procedure actFinalizarExecute(Sender: TObject);
  private
    { Private declarations }
    procedure LocalizarExtravios;
    procedure Exportar;
    procedure Finalizar;
  public
    { Public declarations }
    sFiltro : String;
  end;

var
  view_PesquisaExtravios: Tview_PesquisaExtravios;

implementation

{$R *.dfm}

uses udm, uGlobais, Global.Parametros;


procedure Tview_PesquisaExtravios.actFecharExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
  dm.mtbExtravios.Close;
  Perform(WM_CLOSE, 0, 0);
end;

procedure Tview_PesquisaExtravios.actFinalizarExecute(Sender: TObject);
begin
  if dm.mtbExtravios.IsEmpty then Exit;
  if dm.mtbExtraviosDOM_RESTRICAO.AsString = 'S' then Exit;
  Finalizar;
end;

procedure Tview_PesquisaExtravios.actPesquisarExecute(Sender: TObject);
begin
  if txtParametro.Text <> '' then LocalizarExtravios;
end;

procedure Tview_PesquisaExtravios.actSelecionarExecute(Sender: TObject);
begin
  ModalResult:= mrOk;
end;

procedure Tview_PesquisaExtravios.Exportar;
var
  FileExt, sFile: String;
begin
  if not (dm.mtbExtravios.Active) then
  begin
    Exit;
  end;
  if dm.mtbExtravios.IsEmpty then
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
      ExportGridToExcel(SaveDialog.FileName, grdExtravios, False, True, False)
    else if FileExt = '.xml' then
      ExportGridToXML(SaveDialog.FileName, grdExtravios, False)
    else if FileExt = '.txt' then
      ExportGridToText(SaveDialog.FileName, grdExtravios, False)
    else if FileExt = '.html' then
      ExportGridToHTML(SaveDialog.FileName, grdExtravios, False);
    ShellExecute(Handle, 'open', pchar(SaveDialog.FileName), nil, nil, SW_SHOW);
  end;
end;

procedure Tview_PesquisaExtravios.Finalizar;
var
  pParam: array of Variant;
  iAgente: Integer;
  extravioTMP: TExtraviosMultas;
  extravioDAO: TExtraviosMultasDAO;
  extravios: TobjectList<TExtraviosMultas>;
  entregadorDAO : TEntregadoresDAO;
  entregadores : TObjectList<TEntregadores>;
  lLog : TStringList;
begin
  try
    if Application.MessageBox('Confirma finalizar este Extravio/Multa?', 'Finalizar', MB_YESNO + MB_ICONQUESTION) = IDNO then Exit;
    entregadorDAO := TEntregadoresDAO.Create;
    extravioDAO := TExtraviosMultasDAO.Create;
    SetLength(pParam,1);
    pParam[0] := dm.mtbExtraviosCOD_EXTRAVIO.AsInteger;
    extravios := TObjectList<TExtraviosMultas>.Create;
    extravios := extravioDAO.FindExtravio('CODIGO', pParam);
    Finalize(pParam);
    lLog := TStringList.Create;
    entregadores := TObjectList<TEntregadores>.Create;
    Finalize(pParam);
    for extravioTMP in extravios do
    begin
      lLog.Text := extravioTMP.Obs;
      lLog.Add('Extravio finalizado em ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now()) + ' por ' + Global.Parametros.pNameUser);
      extravioTMP.Restricao := 'S';
      extravioTMP.Percentual := 0;
      extravioTMP.Executor := uGlobais.sUsuario;
      extravioTMP.Manutencao := Now();
      extravioTMP.Agente := 0;
      SetLength(pParam,1);
      pParam[0] := extravioTMP.Entregador;
      entregadores := entregadorDAO.FindEntregador('AGENTE', pParam);
      Finalize(pParam);
      if entregadores.Count > 0 then
      begin
        extravioTMP.Agente := entregadores[0].Agente;
      end;
      extravioTMP.Obs := lLog.Text;
      extravioTMP.Executor := Global.Parametros.pUser_Name;
      extravioTMP.Manutencao := Now();
      if not extravioDAO.Update(extravioTMP) then
      begin
        application.MessageBox('Erro ao finalizar o extravio!', 'Erro', MB_OK + MB_ICONERROR);
        Exit;
      end;
      dm.mtbExtravios.IsLoading := True;
      dm.mtbExtravios.Edit;
      dm.mtbExtraviosDOM_RESTRICAO.AsString := 'S';
      dm.mtbExtravios.Post;
      dm.mtbExtravios.IsLoading := False;
      application.MessageBox(PChar('Extravio/Multa NN ' + extravioTMP.NN + ' finalizado com sucesso.'), 'Finalizar', MB_OK + MB_ICONINFORMATION);
    end;
  finally
    extravioDAO.Free;
    entregadorDAO.Free;
  end;
end;

procedure Tview_PesquisaExtravios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm.qryROAgentes.Close;
  dm.qryCodigosEntregadores.Close;
  Action := caFree;
  view_PesquisaExtravios := Nil;
end;

procedure Tview_PesquisaExtravios.FormShow(Sender: TObject);
begin
  dm.qryROAgentes.Open;
  dm.qryCodigosEntregadores.Open;
  if not sFiltro.IsEmpty then LocalizarExtravios;
end;

procedure Tview_PesquisaExtravios.grdExtraviosEnter(Sender: TObject);
begin
  cxButton2.Default := True;
end;

procedure Tview_PesquisaExtravios.grdExtraviosExit(Sender: TObject);
begin
  cxButton3.Default := False;
end;

procedure Tview_PesquisaExtravios.LocalizarExtravios;
var
  extravioTMP: TExtraviosMultas;
  extravioDAO: TExtraviosMultasDAO;
  extravios: TobjectList<TExtraviosMultas>;
  pParam: Array of Variant;
begin
  try
    dm.mtbExtravios.Close;
    dm.mtbExtravios.Open;
    SetLength(pParam,1);
    if sFiltro.IsEmpty then
    begin
      pParam[0] := 'WHERE COD_EXTRAVIO = ' + IntToStr(StrToIntDef(txtParametro.Text,0)) + ' OR NUM_NOSSONUMERO LIKE ' + QuotedStr('%' + txtParametro.Text + '%') +
                  ' OR DES_EXTRAVIO LIKE ' + QuotedStr('%' + txtParametro.Text + '%') + ' OR COD_AGENTE = ' + IntToStr(StrToIntDef(txtParametro.Text,0)) +
                  ' OR COD_ENTREGADOR = ' + IntToStr(StrToIntDef(txtParametro.Text,0));
    end
    else
    begin
      pParam[0] := 'WHERE ' + sFiltro;
    end;
    extravios := TObjectList<TExtraviosMultas>.Create;
    extravioDAO := TExtraviosMultasDAO.Create;
    extravios := extravioDAO.FindExtravio('FILTRO', pParam);
    Finalize(pParam);
    for extravioTMP in extravios do
    begin
      dm.mtbExtravios.Insert;
      dm.mtbExtraviosCOD_EXTRAVIO.AsInteger := extravioTMP.ID;
      dm.mtbExtraviosDES_EXTRAVIO.AsString := extravioTMP.Descricao;
      dm.mtbExtraviosNUM_NOSSONUMERO.AsString := extravioTMP.NN;
      dm.mtbExtraviosCOD_AGENTE.AsInteger := extravioTMP.Agente;
      dm.mtbExtraviosVAL_PRODUTO.AsFloat := extravioTMP.ValorProduto;
      dm.mtbExtraviosDAT_EXTRAVIO.AsDateTime := extravioTMP.Data;
      dm.mtbExtraviosVAL_MULTA.AsFloat := extravioTMP.Multa;
      dm.mtbExtraviosVAL_VERBA.AsFloat := extravioTMP.Verba;
      dm.mtbExtraviosVAL_TOTAL.AsFloat := extravioTMP.Total;
      dm.mtbExtraviosDOM_RESTRICAO.AsString := extravioTMP.Restricao;
      dm.mtbExtraviosCOD_ENTREGADOR.AsInteger := extravioTMP.Entregador;
      dm.mtbExtraviosCOD_TIPO.AsInteger := extravioTMP.Tipo;
      dm.mtbExtraviosVAL_EXTRATO_FRANQUIA.AsFloat := extravioTMP.ValorFranquia;
      dm.mtbExtraviosDOM_EXTRATO_FRANQUIA.AsString := extravioTMP.Extrato;
      dm.mtbExtraviosDAT_EXTRAVIO_FRANQUIA.AsDateTime := extravioTMP.DataFranquia;
      dm.mtbExtraviosDES_ENVIO_CORRESPONDENCIA.AsString := extravioTMP.EnvioCorrespondencia;
      dm.mtbExtraviosDES_RETORNO_CORRESPONDENCIA.AsString := extravioTMP.RetornoCorrespondencia;
      dm.mtbExtraviosDES_OBSERVACOES.Text := extravioTMP.Obs;
      dm.mtbExtraviosVAL_PERCENTUAL_PAGO.AsFloat := extravioTMP.Percentual;
      dm.mtbExtraviosNOM_EXECUTOR.AsString := extravioTMP.Executor;
      dm.mtbExtraviosDAT_MANUTENCAO.AsDateTime := extravioTMP.Manutencao;
      dm.mtbExtravios.Post;
    end;
    if not dm.mtbExtravios.IsEmpty  then
    begin
      dm.mtbExtravios.First;
    end
    else
    begin
      Application.MessageBox('Nenhum registro encontrado!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      sFiltro := '';
      txtParametro.SetFocus;
    end;
  finally
    extravioDAO.Create;
  end;
end;

procedure Tview_PesquisaExtravios.tvExtraviosCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState;
  var AHandled: Boolean);
begin
  if not dm.mtbExtravios.IsEmpty then actSelecionarExecute(Sender);
end;

procedure Tview_PesquisaExtravios.tvExtraviosNavigatorButtonsButtonClick(Sender: TObject; AButtonIndex: Integer; var ADone: Boolean);
begin
  case AButtonIndex of
    16: Exportar;
  end;

end;

procedure Tview_PesquisaExtravios.txtParametroEnter(Sender: TObject);
begin
  cxButton1.Default := True;
end;

procedure Tview_PesquisaExtravios.txtParametroExit(Sender: TObject);
begin
  cxButton1.Default := False;
end;

end.
