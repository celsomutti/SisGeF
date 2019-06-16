unit View.OcorrenciasJornal;

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
  cxTextEdit, cxMaskEdit, cxDropDownEdit, Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar, dxLayoutControlAdapters, Vcl.Menus,
  Vcl.StdCtrls, cxButtons, System.Actions, Vcl.ActnList, Data.DB, dxmdaset, Model.OcorrenciasJornal, DAO.OcorrenciasJornal,
  System.Generics.Collections, Model.Produtos, DAO.Produtos, Model.Modalidades, DAO.Modalidade, Model.AssinaturaJornal,
  DAO.AssinantesJornal, dxSkinsdxStatusBarPainter, dxStatusBar, cxProgressBar,
  Thread.PopulaOcorrenciasJornal, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxDBLookupComboBox, cxCheckBox,
  cxImageComboBox, cxSpinEdit, cxCurrencyEdit, cxMemo, Model.TipoOcorrenciaJornal, DAO.TipoOcorrenciaJornal,
  Thread.PopulaTabelasOcorrenciaJornal, frxClass, frxDBSet, ZAbstractRODataset, ZDataset, ZAbstractConnection, ZConnection,
  clRoteiroEntregador, Thread.FinalizaOcorrenciasJornal, Thread.SalvaOcorrenciasJornal, clEntregador, cxGridExportLink,
  ShellAPI, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  Tview_OcorrenciasJornal = class(TForm)
    lcgRoot: TdxLayoutGroup;
    lcRoot: TdxLayoutControl;
    lblTitulo: TcxLabel;
    lciTitulo: TdxLayoutItem;
    lcgFiltro: TdxLayoutGroup;
    cboFiltro: TcxComboBox;
    lctFiltro: TdxLayoutItem;
    datInicial: TcxDateEdit;
    lciDataInicial: TdxLayoutItem;
    datFinal: TcxDateEdit;
    lciDataFinal: TdxLayoutItem;
    edtTexto: TcxTextEdit;
    lciTexto: TdxLayoutItem;
    cboLista: TcxComboBox;
    lciLista: TdxLayoutItem;
    btnProcessar: TcxButton;
    lciProcessar: TdxLayoutItem;
    aclOcorrencias: TActionList;
    actProcessar: TAction;
    ds: TDataSource;
    tbPlanilha: TdxMemData;
    tbPlanilhaNUM_OCORRENCIA: TIntegerField;
    tbPlanilhaDAT_OCORRENCIA: TDateTimeField;
    tbPlanilhaCOD_ASSINATURA: TWideStringField;
    tbPlanilhaNOM_ASSINANTE: TWideStringField;
    tbPlanilhaDES_ROTEIRO: TWideStringField;
    tbPlanilhaCOD_ENTREGADOR: TIntegerField;
    tbPlanilhaCOD_PRODUTO: TStringField;
    tbPlanilhaCOD_OCORRENCIA: TIntegerField;
    tbPlanilhaDOM_REINCIDENTE: TWideStringField;
    tbPlanilhaDES_DESCRICAO: TStringField;
    tbPlanilhaDES_ENDERECO: TWideStringField;
    tbPlanilhaDES_RETORNO: TWideStringField;
    tbPlanilhaCOD_RESULTADO: TIntegerField;
    tbPlanilhaCOD_ORIGEM: TIntegerField;
    tbPlanilhaDES_OBS: TWideStringField;
    tbPlanilhaCOD_STATUS: TIntegerField;
    tbPlanilhaDES_APURACAO: TMemoField;
    tbPlanilhaDOM_PROCESSADO: TStringField;
    tbPlanilhaQTD_OCORRENCIAS: TIntegerField;
    tbPlanilhaVAL_OCORRENCIA: TFloatField;
    tbPlanilhaDAT_DESCONTO: TDateField;
    tbPlanilhaDES_LOG: TWideMemoField;
    tbPlanilhaDES_CHAVE: TStringField;
    tbPlanilhaDOM_FINALIZAR: TBooleanField;
    tbPlanilhaDES_ROTEIRO_NOVO: TStringField;
    tbPlanilhaDOM_IMPRESSAO: TStringField;
    tbPlanilhaDES_ANEXO: TStringField;
    tbPlanilhaDES_OCORRENCIA: TStringField;
    tbPlanilhaDOM_GRAVAR: TStringField;
    dsProduto: TDataSource;
    dsTipoOcorrencia: TDataSource;
    dbOcorrenciasJornal: TdxStatusBar;
    lciStatusBar: TdxLayoutItem;
    dbOcorrenciasJornalContainer1: TdxStatusBarContainerControl;
    pbOcorrencias: TcxProgressBar;
    tvOcorrencias: TcxGridDBTableView;
    lvOcorrencias: TcxGridLevel;
    grdOcorrencias: TcxGrid;
    lciGradeOcorrencias: TdxLayoutItem;
    tvOcorrenciasRecId: TcxGridDBColumn;
    tvOcorrenciasNUM_OCORRENCIA: TcxGridDBColumn;
    tvOcorrenciasDAT_OCORRENCIA: TcxGridDBColumn;
    tvOcorrenciasCOD_ASSINATURA: TcxGridDBColumn;
    tvOcorrenciasNOM_ASSINANTE: TcxGridDBColumn;
    tvOcorrenciasDES_ROTEIRO: TcxGridDBColumn;
    tvOcorrenciasCOD_ENTREGADOR: TcxGridDBColumn;
    tvOcorrenciasCOD_PRODUTO: TcxGridDBColumn;
    tvOcorrenciasCOD_OCORRENCIA: TcxGridDBColumn;
    tvOcorrenciasDOM_REINCIDENTE: TcxGridDBColumn;
    tvOcorrenciasDES_DESCRICAO: TcxGridDBColumn;
    tvOcorrenciasDES_ENDERECO: TcxGridDBColumn;
    tvOcorrenciasDES_RETORNO: TcxGridDBColumn;
    tvOcorrenciasCOD_RESULTADO: TcxGridDBColumn;
    tvOcorrenciasCOD_ORIGEM: TcxGridDBColumn;
    tvOcorrenciasDES_OBS: TcxGridDBColumn;
    tvOcorrenciasCOD_STATUS: TcxGridDBColumn;
    tvOcorrenciasDES_APURACAO: TcxGridDBColumn;
    tvOcorrenciasDOM_PROCESSADO: TcxGridDBColumn;
    tvOcorrenciasQTD_OCORRENCIAS: TcxGridDBColumn;
    tvOcorrenciasVAL_OCORRENCIA: TcxGridDBColumn;
    tvOcorrenciasDAT_DESCONTO: TcxGridDBColumn;
    tvOcorrenciasDES_LOG: TcxGridDBColumn;
    tvOcorrenciasDES_CHAVE: TcxGridDBColumn;
    tvOcorrenciasDOM_FINALIZAR: TcxGridDBColumn;
    tvOcorrenciasDES_ROTEIRO_NOVO: TcxGridDBColumn;
    tvOcorrenciasDOM_IMPRESSAO: TcxGridDBColumn;
    tvOcorrenciasDES_ANEXO: TcxGridDBColumn;
    tvOcorrenciasDES_OCORRENCIA: TcxGridDBColumn;
    tvOcorrenciasDES_PRODUTO: TcxGridDBColumn;
    tvOcorrenciasDOM_GRAVAR: TcxGridDBColumn;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    rptDeclaracaoJornal: TfrxReport;
    ZConn: TZConnection;
    qryAccess: TZReadOnlyQuery;
    actIncluir: TAction;
    btnIncluir: TcxButton;
    lciBotaoIncluir: TdxLayoutItem;
    lcgOpcoes: TdxLayoutAutoCreatedGroup;
    actLimpar: TAction;
    btnLimpar: TcxButton;
    lciBotaoLimpar: TdxLayoutItem;
    actDeclaracao: TAction;
    btnDeclaracao: TcxButton;
    lciBotaoDeclaracao: TdxLayoutItem;
    actCancelar: TAction;
    btnCancelarOcorrencia: TcxButton;
    lciBotaoCancelar: TdxLayoutItem;
    actFinalizar: TAction;
    btnFinalizar: TcxButton;
    lcibotaoFinalizar: TdxLayoutItem;
    actGravar: TAction;
    btnGravar: TcxButton;
    lciBotaoGravar: TdxLayoutItem;
    actFechar: TAction;
    btnFechar: TcxButton;
    lciBotaoFechar: TdxLayoutItem;
    dsEntregador: TDataSource;
    actExportar: TAction;
    cxButton1: TcxButton;
    lciExportar: TdxLayoutItem;
    procedure cboFiltroPropertiesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure actProcessarExecute(Sender: TObject);
    procedure tvOcorrenciasCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
      AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure tbPlanilhaBeforeEdit(DataSet: TDataSet);
    procedure tbPlanilhaBeforePost(DataSet: TDataSet);
    procedure tvOcorrenciasCOD_ASSINATURAPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure actIncluirExecute(Sender: TObject);
    procedure actLimparExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actFinalizarExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure actFecharExecute(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure actGravarExecute(Sender: TObject);
    procedure actDeclaracaoExecute(Sender: TObject);
    procedure actExportarExecute(Sender: TObject);
  private
    { Private declarations }
    procedure PreparaParametros;
    procedure PreparaFiltroNumero;
    procedure PreparaFiltroData;
    procedure PreparaFiltroCodigo;
    procedure PreparaFiltroNome;
    procedure PreparaFiltroRoteiro;
    procedure PreparaFiltroProduto;
    procedure PreparaFiltroOcorrencia;
    procedure PreparaFiltroEndereco;
    procedure PreparaFiltroStatus;
    procedure PopulaTabelasAuxiliares;
    procedure ProcessaFiltro;
    procedure SetupColunas(iOpcao: Integer);
    procedure ImprimirDeclaracao;
    procedure SetupOcorrencias;
    procedure SalvaAssinatura;
    procedure SetupAssinaturaSTD;
    procedure SetupOcorrenciasSTD;
    procedure SearchBD;
    procedure SetupClass;
    procedure MarcaImpressao;
    procedure ClearParametros;
    procedure CancelarOcorrencia;
    procedure FinalizarOcorrencios;
    procedure SalvaOcorrencias;
    procedure Exportar;
    function ValidaParametros(): Boolean;
    function SearchAssinatura(sCodigo: String): Boolean;
    function SearchSTD(sCodigo: String): Boolean;
    function VerificaGravar(): Boolean;
  public
    { Public declarations }
  end;

var
  view_OcorrenciasJornal: Tview_OcorrenciasJornal;
  ocorrencia: TOcorrenciasJornal;
  ocorrenciaTMP: TOcorrenciasJornal;
  ocorrencias: TObjectList<TOcorrenciasJornal>;
  ocorrenciaDAO: TOcorrenciasJornalDAO;
  produto: TProdutos;
  produtoTMP: TProdutos;
  produtos: TObjectList<TProdutos>;
  produtoDAO: TProdutosDAO;
  tipo : TTipoOcorrenciaJornal;
  tipoTMP : TTipoOcorrenciaJornal;
  tipos: TObjectList<TTipoOcorrenciaJornal>;
  tipoDAO: TTipoOcorrenciaJornalDAO;
  assinante: TAssinaturaJornal;
  assinanteTMP: TAssinaturaJornal;
  assinantes: TObjectList<TAssinaturaJornal>;
  assinanteDAO: TAssinantesJornalDAO;
  modalidade: TModalidades;
  modalidadeTMP: TModalidades;
  modalidades: TObjectList<TModalidades>;
  modalidadeDAO: TModalidadeDAO;
  roteiro: TRoteiroEntregador;
  thrTabelas: TThread_PopulaTabelasOcorrnciaJornal;
  thrFiltro: TThread_PopulaOcorrenciasJornal;
  thrFinalizar: Thread_FinalizaOcorrenciasJornal;
  thrSalvar: Thread_SalvaOcorrenciasJornal;
  sBanco: String;
  entregador: TEntregador;
implementation

{$R *.dfm}

uses udm, uGlobais, clUtil, ufrmImpressao, ufrmListaEnderecos;

procedure Tview_OcorrenciasJornal.PreparaParametros;
begin
  case cboFiltro.ItemIndex of
    -1: ClearParametros;
    0 : PreparaFiltroStatus;
    1 : PreparaFiltroNumero;
    2 : PreparaFiltroData;
    3 : PreparaFiltroCodigo;
    4 : PreparaFiltroNome;
    5 : PreparaFiltroRoteiro;
    6 : PreparaFiltroProduto;
    7 : PreparaFiltroOcorrencia;
    8 : PreparaFiltroEndereco;
  end;

end;

procedure Tview_OcorrenciasJornal.PreparaFiltroNumero;
begin
  lciDataInicial.Visible := False;
  lciDataFinal.Visible := False;
  lciTexto.Visible := True;
  lciLista.Visible := False;
  lciTexto.CaptionOptions.Text := 'Número da Ocorrência';
  edtTexto.Clear;
  edtTexto.Hint := 'Informe o número da ocorrência';
  edtTexto.SetFocus;
end;

procedure Tview_OcorrenciasJornal.PreparaFiltroData;
begin
  PreparaFiltroStatus;
  lciDataInicial.Visible := True;
  lciDataFinal.Visible := True;
  lciTexto.Visible := False;
  lciLista.Visible := True;;
  datInicial.Clear;
  datFinal.Clear;
  datInicial.SetFocus;
end;

procedure Tview_OcorrenciasJornal.actCancelarExecute(Sender: TObject);
begin
  CancelarOcorrencia;
end;

procedure Tview_OcorrenciasJornal.actDeclaracaoExecute(Sender: TObject);
begin
  if tbPlanilha.State in [dsInsert, dsInsert] then
  begin
    tbPlanilha.Post;
  end;
  ImprimirDeclaracao;
end;

procedure Tview_OcorrenciasJornal.actExportarExecute(Sender: TObject);
begin
  Exportar;
end;

procedure Tview_OcorrenciasJornal.actFecharExecute(Sender: TObject);
begin
  Perform(WM_CLOSE, 0, 0);
end;

procedure Tview_OcorrenciasJornal.actFinalizarExecute(Sender: TObject);
begin
  FinalizarOcorrencios;
end;

procedure Tview_OcorrenciasJornal.actGravarExecute(Sender: TObject);
begin
  SalvaOcorrencias;
end;

procedure Tview_OcorrenciasJornal.actIncluirExecute(Sender: TObject);
begin
  if not tbPlanilha.Active then tbPlanilha.Open;
  tbPlanilha.Insert;
end;

procedure Tview_OcorrenciasJornal.actLimparExecute(Sender: TObject);
begin
  tbPlanilha.Close;
  cboFiltro.ItemIndex := -1;
end;

procedure Tview_OcorrenciasJornal.actProcessarExecute(Sender: TObject);
begin
  ProcessaFiltro;
end;

procedure Tview_OcorrenciasJornal.cboFiltroPropertiesChange(Sender: TObject);
begin
  PreparaParametros;
end;

procedure Tview_OcorrenciasJornal.PreparaFiltroCodigo;
begin
  lciDataInicial.Visible := False;
  lciDataFinal.Visible := False;
  lciTexto.Visible := True;
  lciLista.Visible := False;
  lciTexto.CaptionOptions.Text := 'Código da Assinatura';
  edtTexto.Clear;
  edtTexto.Hint := 'Informe o código da assinatura';
  edtTexto.SetFocus;
end;

procedure Tview_OcorrenciasJornal.PreparaFiltroNome;
begin
  lciDataInicial.Visible := False;
  lciDataFinal.Visible := False;
  lciTexto.Visible := True;
  lciLista.Visible := False;
  lciTexto.CaptionOptions.Text := 'Nome do Assinante';
  edtTexto.Clear;
  edtTexto.Hint := 'Informe o nome do assinante';
  edtTexto.SetFocus;
end;

procedure Tview_OcorrenciasJornal.PreparaFiltroRoteiro;
begin
  lciDataInicial.Visible := False;
  lciDataFinal.Visible := False;
  lciTexto.Visible := True;
  lciLista.Visible := False;
  lciTexto.CaptionOptions.Text := 'Roteiro';
  edtTexto.Clear;
  edtTexto.Hint := 'Informe o roteiro';
  edtTexto.SetFocus;
end;

procedure Tview_OcorrenciasJornal.PreparaFiltroProduto;
begin
  lciDataInicial.Visible := False;
  lciDataFinal.Visible := False;
  lciTexto.Visible := False;
  lciLista.Visible := True;
  lciLista.CaptionOptions.Text := 'Produto';
  cboLista.Properties.Items.Clear;
  if not dm.tbProdutos.Active then Exit;
  if not dm.tbProdutos.IsEmpty then dm.tbProdutos.First;
  while not dm.tbProdutos.Eof do
  begin
    cboLista.Properties.Items.Add(dm.tbProdutosCOD_PRODUTO.AsString + '-' + dm.tbProdutosDES_PRODUTO.AsString);
    dm.tbProdutos.Next;
  end;
  if not dm.tbProdutos.IsEmpty then dm.tbProdutos.First;
  cboLista.ItemIndex := -1;
  cboLista.Hint := 'Selecione o produto';
  cboLista.SetFocus;
end;

procedure Tview_OcorrenciasJornal.PreparaFiltroOcorrencia;
begin
  lciDataInicial.Visible := False;
  lciDataFinal.Visible := False;
  lciTexto.Visible := False;
  lciLista.Visible := True;
  lciLista.CaptionOptions.Text := 'Tipos de ocorrência';
  cboLista.Properties.Items.Clear;
  if not dm.tbTipoOcorrencias.Active then Exit;
  if not dm.tbTipoOcorrencias.IsEmpty then dm.tbTipoOcorrencias.First;
  while not dm.tbTipoOcorrencias.Eof do
  begin
    cboLista.Properties.Items.Add(dm.tbTipoOcorrenciasCOD_TIPO_OCORRENCIA.AsString + '-' +
                                  dm.tbTipoOcorrenciasDES_TIPO_OCORRENCIA.AsString);
    dm.tbTipoOcorrencias.Next;
  end;
  cboLista.ItemIndex := -1;
  cboLista.Hint := 'Selecione o tipo de ocorrência';
  cboLista.SetFocus;
end;

procedure Tview_OcorrenciasJornal.PreparaFiltroEndereco;
begin
  lciDataInicial.Visible := False;
  lciDataFinal.Visible := False;
  lciTexto.Visible := True;
  lciLista.Visible := False;
  lciTexto.CaptionOptions.Text := 'Endereço';
  edtTexto.Clear;
  edtTexto.Hint := 'Informe o endereço';
  edtTexto.SetFocus;
end;

procedure Tview_OcorrenciasJornal.PreparaFiltroStatus;
begin
  lciDataInicial.Visible := False;
  lciDataFinal.Visible := False;
  lciTexto.Visible := False;
  lciLista.Visible := True;
  lciLista.CaptionOptions.Text := 'Status';
  cboLista.Properties.Items.Clear;;
  cboLista.Properties.Items.Add('ABERTAS');
  cboLista.Properties.Items.Add('TRATADAS');
  cboLista.Properties.Items.Add('PENDENTES');
  cboLista.Properties.Items.Add('FINALIZADAS');
  cboLista.Properties.Items.Add('CONTABILIZADAS');
  cboLista.Properties.Items.Add('CANCELADAS');
  cboLista.Properties.Items.Add('DESMEMBRADA');
  cboLista.Properties.Items.Add('TODAS');
  cboLista.ItemIndex := 0;
  cboLista.Hint := 'Informe o status da ocorrência';
  cboLista.SetFocus;
end;

procedure Tview_OcorrenciasJornal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if tbPlanilha.Active then tbPlanilha.Close;
  if dm.tbProdutos.Active then dm.tbProdutos.Close;
  if dm.tbTipoOcorrencias.Active then dm.tbTipoOcorrencias.Close;
  Action := caFree;
  view_OcorrenciasJornal := Nil;
end;

procedure Tview_OcorrenciasJornal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if VerificaGravar() then
  begin
    CanClose := (Application.MessageBox('Exitem ocorrências pendentes de gravação! Deseja realmente sair sem grava-las?', 'Atenção',
      MB_YESNO + MB_ICONQUESTION) = IDYES);
  end;
end;

procedure Tview_OcorrenciasJornal.FormShow(Sender: TObject);
begin
  PopulaTabelasAuxiliares;
end;

procedure Tview_OcorrenciasJornal.PopulaTabelasAuxiliares;
begin
  try
    if dm.tbProdutos.Active then dm.tbProdutos.Close;
    dm.tbProdutos.Open;
    produtoDAO := TProdutosDAO.Create();
    produtos := produtoDAO.FindByDescricao('');
    for produtoTMP in produtos do
    begin
      dm.tbprodutos.Insert;
      dm.tbprodutos.FieldByName('COD_PRODUTO').AsString := produtoTMP.Codigo;
      dm.tbprodutos.FieldByName('DES_PRODUTO').AsString := produtoTMP.Descricao;
      dm.tbprodutos.Post;
    end;
    if dm.tbTipoOcorrencias.Active then dm.tbTipoOcorrencias.Close;
    dm.tbTipoOcorrencias.Open;
    tipoDAO := TTipoOcorrenciaJornalDAO.Create();
    tipos := tipoDAO.FindByDescricao('');
    for tipoTMP in tipos do
    begin
      dm.tbTipoOcorrencias.Insert;
      dm.tbTipoOcorrencias.FieldByName('COD_TIPO_OCORRENCIA').AsInteger := tipoTMP.Codigo;
      dm.tbTipoOcorrencias.FieldByName('DES_TIPO_OCORRENCIA').AsString := tipoTMP.Descricao;
      dm.tbTipoOcorrencias.Post;
    end;
    if dm.tbListaEntregadores.Active then dm.tbListaEntregadores.Close;
    dm.tbListaEntregadores.Open;
    entregador := TEntregador.Create;
    if entregador.ListaEntregadores then
    begin
      while not dm.qryPesquisa.Eof do
      begin
        dm.tbListaEntregadores.Insert;
        dm.tbListaEntregadores.FieldByName('COD_CADASTRO').AsInteger := dm.qryPesquisa.FieldByName('COD_CADASTRO').AsInteger;
        dm.tbListaEntregadores.FieldByName('DES_RAZAO_SOCIAL').AsString := dm.qryPesquisa.FieldByName('DES_RAZAO_SOCIAL').AsString;
        dm.tbListaEntregadores.Post;
        dm.qryPesquisa.Next;
      end;
    end;
  finally
    dm.qryPesquisa.Close;
    dm.qryPesquisa.SQL.Clear;;
    entregador.Free;
  end;
end;

function Tview_OcorrenciasJornal.ValidaParametros(): Boolean;
begin
  Result := False;
  if cboFiltro.ItemIndex = -1 then
  begin
    Application.MessageBox('Selecione o tipo de filtro desejado!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if cboFiltro.ItemIndex = 0 then
  begin
    if cboLista.ItemIndex = -1 then
    begin
      Application.MessageBox('Selecione o Status de Ocorrência desejado!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
  end;
  if cboFiltro.ItemIndex = 1 then
  begin
    if not TUtil.ENumero(edtTexto.Text) then
    begin
      Application.MessageBox('Informe um número de ocorrência válido!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
  end;
  if cboFiltro.ItemIndex = 2 then
  begin
    if cboLista.ItemIndex = -1 then
    begin
      Application.MessageBox('Selecione o Status de Ocorrência desejado!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
    if datInicial.Date = 0 then
    begin
      Application.MessageBox('Informe a data inicial!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
    if datFinal.Date = 0 then
    begin
      Application.MessageBox('Informe a data final!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
    if datFinal.Date < datInicial.Date then
    begin
      Application.MessageBox('Data final menor que a data inicial!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
  end;
  if cboFiltro.ItemIndex = 3 then
  begin
    if edtTexto.Text = '' then
    begin
      Application.MessageBox('Informe um código de assinatura válido!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
  end;
  if cboFiltro.ItemIndex = 4 then
  begin
    if edtTexto.Text = '' then
    begin
      Application.MessageBox('Informe um nome do assinante válido!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
  end;
  if cboFiltro.ItemIndex = 5 then
  begin
    if edtTexto.Text = '' then
    begin
      Application.MessageBox('Informe um roteiro válido!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
  end;
  if cboFiltro.ItemIndex = 6 then
  begin
    if cboLista.ItemIndex = -1 then
    begin
      Application.MessageBox('Selecione o produto desejado!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
  end;
  if cboFiltro.ItemIndex = 7 then
  begin
    if cboLista.ItemIndex = -1 then
    begin
      Application.MessageBox('Selecione o tipo de ocorrência desejado!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
  end;
  if cboFiltro.ItemIndex = 8 then
  begin
    if edtTexto.Text = '' then
    begin
      Application.MessageBox('Informe um endereco válido!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
  end;
  Result := True;
end;

procedure Tview_OcorrenciasJornal.ProcessaFiltro;
begin
  if not ValidaParametros() then Exit;
  thrFiltro := TThread_PopulaOcorrenciasJornal.Create(True);
  thrFiltro.FreeOnTerminate := True;
  thrFiltro.Priority := tpNormal;
  thrFiltro.Opcao := cboFiltro.ItemIndex;
  if cboFiltro.ItemIndex = 0 then
  begin
    thrFiltro.Filtro := IntToStr(cboLista.ItemIndex);
  end;
  if cboFiltro.ItemIndex = 1 then
  begin
    thrFiltro.Filtro := edtTexto.Text;;
  end;
  if cboFiltro.ItemIndex = 2 then
  begin
    thrFiltro.Filtro := IntToStr(cboLista.ItemIndex);
    thrFiltro.Data1 := datInicial.Date;
    thrFiltro.Data2 := datFinal.Date;
  end;
  if cboFiltro.ItemIndex = 3 then
  begin
    thrFiltro.Filtro := edtTexto.Text;
  end;
  if cboFiltro.ItemIndex = 4 then
  begin
    thrFiltro.Filtro := edtTexto.Text;
  end;
  if cboFiltro.ItemIndex = 5 then
  begin
    thrFiltro.Filtro := edtTexto.Text;
  end;
  if cboFiltro.ItemIndex = 6 then
  begin
    thrFiltro.Filtro := cboLista.Text;
  end;
  if cboFiltro.ItemIndex = 7 then
  begin
    thrFiltro.Filtro := cboLista.Text;
  end;
  if cboFiltro.ItemIndex = 8 then
  begin
    thrFiltro.Filtro := edtTexto.Text;
  end;
  thrFiltro.Start;
end;

procedure Tview_OcorrenciasJornal.tbPlanilhaBeforeEdit(DataSet: TDataSet);
begin
  if tbPlanilha.IsLoading then Exit;
  SetupColunas(tbPlanilhaCOD_STATUS.AsInteger);
end;

procedure Tview_OcorrenciasJornal.tbPlanilhaBeforePost(DataSet: TDataSet);
begin
  if tbPlanilha.IsLoading then Exit;
  tbPlanilhaDOM_GRAVAR.AsString := 'S';
end;

procedure Tview_OcorrenciasJornal.tvOcorrenciasCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  if not tbPlanilha.IsEmpty then tbPlanilha.Edit;
end;

procedure Tview_OcorrenciasJornal.tvOcorrenciasCOD_ASSINATURAPropertiesValidate(Sender: TObject; var DisplayValue: Variant;
  var ErrorText: TCaption; var Error: Boolean);
begin
  if ds.DataSet.State in [dsInsert] then
  begin
    if not SearchAssinatura(DisplayValue) then
    begin
      if SearchSTD(DisplayValue) then
      begin
        SalvaAssinatura;
      end;
    end;
  end;
end;

procedure Tview_OcorrenciasJornal.SetupColunas(iOpcao: Integer);
begin
  tvOcorrenciasDAT_OCORRENCIA.Properties.ReadOnly := (iOpcao > 0);
  tvOcorrenciasCOD_ASSINATURA.Properties.ReadOnly := (iOpcao > 0);
  tvOcorrenciasNOM_ASSINANTE.Properties.ReadOnly := (iOpcao > 0);
  tvOcorrenciasDES_ROTEIRO.Properties.ReadOnly := (iOpcao > 0);
  tvOcorrenciasDES_PRODUTO.Properties.ReadOnly := (iOpcao > 0);
  tvOcorrenciasCOD_OCORRENCIA.Properties.ReadOnly := (iOpcao > 0);
  tvOcorrenciasDES_OCORRENCIA.Properties.ReadOnly := (iOpcao > 0);
  tvOcorrenciasDOM_REINCIDENTE.Properties.ReadOnly := (iOpcao > 0);
  tvOcorrenciasDES_DESCRICAO.Properties.ReadOnly := (iOpcao > 0);
  tvOcorrenciasDES_ENDERECO.Properties.ReadOnly := (iOpcao > 0);
  tvOcorrenciasDES_RETORNO.Properties.ReadOnly := (iOpcao > 1);
  tvOcorrenciasCOD_RESULTADO.Properties.ReadOnly := (iOpcao > 2);
  tvOcorrenciasCOD_ORIGEM.Properties.ReadOnly := (iOpcao > 2);
  tvOcorrenciasDES_OBS.Properties.ReadOnly := (iOpcao > 0);
  tvOcorrenciasQTD_OCORRENCIAS.Properties.ReadOnly := (iOpcao >= 3);
  tvOcorrenciasVAL_OCORRENCIA.Properties.ReadOnly := (iOpcao >= 3);
end;

procedure Tview_OcorrenciasJornal.ImprimirDeclaracao;
var
  sEndereco: String;
  sOcorrencia: string;
  sImpressao: string;
  sDescricao: String;
  sData: String;
  sProduto: String;
  sNome: String;
  sCodigo: String;
  sDesc : String;
begin
  sEndereco := '';
  sDesc := '';
  with rptDeclaracaoJornal do begin
    if not Assigned(frmImpressao) then begin
      frmImpressao := TfrmImpressao.Create(Application);
    end;
    frmImpressao.cxLabel1.Caption := 'DECLARAÇÃO';
    frmImpressao.cxArquivo.Text := ExtractFilePath(Application.ExeName) + 'Reports\frxDeclaracaoJornal.fr3';
    if frmImpressao.ShowModal <> mrOk then
    begin
      FreeAndNil(frmImpressao);
      Exit;
    end
    else begin
      if (not FileExists(frmImpressao.cxArquivo.Text)) then begin
        Application.MessageBox(PChar('Arquivo ' + frmImpressao.cxArquivo.Text +
                               ' não foi encontrado!'), 'Atenção', MB_OK + MB_ICONWARNING);
        Exit;
      end;
    end;
    sEndereco := tbPlanilhaDES_ENDERECO.AsString + ' Agente: ' + tbPlanilhaDES_ROTEIRO.AsString;
    if dm.tbTipoOcorrencias.Locate('COD_TIPO_OCORRENCIA',tbPlanilhaCOD_OCORRENCIA.AsInteger,[]) then
    begin
      sDesc := dm.tbTipoOcorrenciasDES_TIPO_OCORRENCIA.AsString;
    end
    else
    begin
      sDesc := 'TIPO DE OCORRÊNCIA NÃO CADASTRADA';
    end;
    sOcorrencia :=  tbPlanilhaCOD_OCORRENCIA.AsString + '-' + sDesc;
    sDesc := '';
    sDescricao := tbPlanilhaDES_DESCRICAO.AsString;
    sData := tbPlanilhaDAT_OCORRENCIA.AsString;
    if dm.tbProdutos.Locate('COD_PRODUTO',tbPlanilhaCOD_PRODUTO.AsString,[]) then
    begin
      sDesc := dm.tbProdutosDES_PRODUTO.AsString;
    end
    else
    begin
      sDesc := 'PRODUTO NÃO CADASTRADO';
    end;
    sProduto := sDesc;
    sDesc := '';
    sNome := tbPlanilhaNOM_ASSINANTE.AsString;
    sCodigo := tbPlanilhaCOD_ASSINATURA.AsString;
    LoadFromFile(frmImpressao.cxArquivo.Text);
    sImpressao := 'Impresso pelo ' + Application.Title + ' Versão ' + TUtil.VersaoExe + ' por ' + uGlobais.sNomeUsuario +
                  ' em ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now);
    Variables.Items[Variables.IndexOf('parImpressao')].Value :=  QuotedStr(sImpressao);
    Variables.Items[Variables.IndexOf('parEndereco')].Value :=  QuotedStr(sEndereco);
    Variables.Items[Variables.IndexOf('parOcorrencia')].Value :=  QuotedStr(sOcorrencia);
    Variables.Items[Variables.IndexOf('parDescricao')].Value :=  QuotedStr(sDescricao);
    Variables.Items[Variables.IndexOf('parData')].Value :=  QuotedStr(sData);
    Variables.Items[Variables.IndexOf('parProduto')].Value :=  QuotedStr(sProduto);
    Variables.Items[Variables.IndexOf('parNomeAssinante')].Value :=  QuotedStr(sNome);
    Variables.Items[Variables.IndexOf('parCodigoAssinatura')].Value :=  QuotedStr(sCodigo);
    FreeAndNil(frmImpressao);
    if (not uGlobais.bFlagImprimir) then
    begin
      ShowReport(True);
    end
    else
    begin
      Print;
      MarcaImpressao;
    end;
  end;
end;

function Tview_OcorrenciasJornal.SearchAssinatura(sCodigo: String): Boolean;
var
  iID : Integer;
begin
  try
    Result := False;
    iID := 0;
    assinanteDAO := TAssinantesJornalDAO.Create();
    assinantes := assinanteDAO.FindByCodigo(sCodigo);
    if assinantes.Count = 1 then
    begin
      SetupOcorrencias;
    end
    else if assinantes.Count > 1 then
    begin
      if not Assigned(frmListaEnderecos) then
      begin
        frmListaEnderecos := TfrmListaEnderecos.Create(Application);
      end;
      frmListaEnderecos.tbEnderecos.Open;
      for assinanteTMP in assinantes do
      begin
        frmListaEnderecos.tbEnderecos.Insert;
        frmListaEnderecos.tbEnderecosCOD_MODALIDADE.AsInteger := assinanteTMP.Modalidade;
        frmListaEnderecos.tbEnderecosNUM_CEP.AsString := assinanteTMP.CEP;
        frmListaEnderecos.tbEnderecosDES_ENDERECO.AsString := Trim(assinanteTMP.TipoLogradouro) + ' ' +
                                                              Trim(assinanteTMP.NomeLogradouro) +
                                                              ', ' + Trim(assinanteTMP.NumeroLogradouro) + ' - ' +
                                                              Trim(assinanteTMP.Complemento) + ' - ' + Trim(assinanteTMP.Bairro) +
                                                              ' - ' +
                                                              Trim(assinanteTMP.Cidade) + '/' + Trim(assinanteTMP.Estado);
        frmListaEnderecos.tbEnderecosID_ASSINATURA.AsInteger := assinanteTMP.ID;
        frmListaEnderecos.tbEnderecos.Post;
      end;
      if not frmListaEnderecos.tbEnderecos.IsEmpty then frmListaEnderecos.tbEnderecos.First;
      if frmListaEnderecos.ShowModal = mrOK then
      begin
        iID := frmListaEnderecos.tbEnderecosID_ASSINATURA.AsInteger;
        assinantes.Clear;
        assinantes := assinanteDAO.FindById(iID);
        SetupOcorrencias;
      end;
    end
    else
    begin
      Exit;
    end;
    Result := True;
  finally
    assinanteDAO.Free;
    FreeAndNil(frmListaEnderecos);
  end;
end;

procedure Tview_OcorrenciasJornal.SetupOcorrencias;
var
  sRoteiroNovo: String;
begin
  roteiro := TRoteiroEntregador.Create();
  for assinanteTMP in assinantes do
  begin
    //tbPlanilha.Insert;
    tbPlanilhaNUM_OCORRENCIA.AsInteger := 0;
    tbPlanilhaDAT_OCORRENCIA.AsDateTime := Now;
    tbPlanilhaCOD_ASSINATURA.AsString := assinanteTMP.Codigo;
    tbPlanilhaNOM_ASSINANTE.AsString := assinanteTMP.Nome;
    tbPlanilhaDES_ROTEIRO.AsString := assinanteTMP.Roteiro;
    tbPlanilhaCOD_ENTREGADOR.AsInteger := 0;
    tbPlanilhaCOD_OCORRENCIA.AsInteger := 0;
    tbPlanilhaDOM_REINCIDENTE.AsString := 'N';
    tbPlanilhaDES_ENDERECO.AsString := Trim(assinanteTMP.TipoLogradouro) + ' ' + Trim(assinanteTMP.NomeLogradouro) + ', ' +
                                       Trim(assinanteTMP.NumeroLogradouro) + ' - ' + Trim(assinanteTMP.Complemento) + ' - ' +
                                       Trim(assinanteTMP.Bairro) + ' - ' + Trim(assinanteTMP.Cidade) + '/' +
                                       Trim(assinanteTMP.Estado);
    tbPlanilhaDES_RETORNO.AsString := '';
    tbPlanilhaCOD_RESULTADO.AsInteger := 0;
    tbPlanilhaCOD_ORIGEM.AsInteger := 0;
    tbPlanilhaDES_OBS.AsString := '';
    tbPlanilhaCOD_STATUS.AsInteger := 0;
    tbPlanilhaDES_LOG.AsString := '>' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' inclusão da ocorrência por ' +
                                          uGlobais.sUsuario;
    tbPlanilhaCOD_PRODUTO.AsString := assinanteTMP.Produto;
    tbPlanilhaDOM_PROCESSADO.AsString := 'N';
    tbPlanilhaVAL_OCORRENCIA.AsFloat := 0;
    tbPlanilhaQTD_OCORRENCIAS.AsInteger := 1;
    tbPlanilhaDES_APURACAO.AsString := '';
    tbPlanilhaDES_DESCRICAO.AsString := '';
    tbPlanilhaDOM_FINALIZAR.AsBoolean := False;
    tbPlanilhaDAT_DESCONTO.AsDateTime := 0;
    tbPlanilhaDES_ANEXO.AsString := '';
    roteiro.RoteiroAntigo := tbPlanilhaDES_ROTEIRO.AsString;
    sRoteiroNovo := roteiro.getField('COD_ROTEIRO_NOVO','ANTIGO');
    tbPlanilhaDES_ROTEIRO_NOVO.AsString := sRoteiroNovo;
    tbPlanilhaDES_OCORRENCIA.AsString := '';
    tbPlanilhaDOM_GRAVAR.AsString := 'S';
    tbPlanilha.Post;
  end;
  roteiro.Free;
end;

function Tview_OcorrenciasJornal.SearchSTD(sCodigo: String): Boolean;
var
  sFile: String;
  sDir: String;
  sDataBase: String;
  iId: Integer;
  sCod: String;
begin
  Result := False;
  if sBanco.IsEmpty then
  begin
    SearchBD;
  end;
  if sBanco.isEmpty then Exit;
  sFile := sBanco;
  sCod :=  FormatFloat('0000000000',StrToFloatDef(sCodigo,0));
  sDir := ExtractFilePath(sFile);
  ZConn.HostName := sDir;
  sDatabase := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=#BD#;Persist Security Info=False;Jet OLEDB:Database Password=i8f0';
  sDatabase := TUtil.ReplaceStr(sDatabase, '#BD#', sFile);
  ZConn.Database := sDatabase;
  ZConn.Connect;
  qryAccess.Close;
  qryAccess.SQL.Clear;
  qryAccess.SQL.Text := 'SELECT * FROM Diario_Edicao_Movimentacao WHERE sCdAssinante = :CODIGO';
  qryAccess.ParamByName('CODIGO').AsString := sCod;
  qryAccess.Open;
  if qryAccess.RecordCount > 0 then
  begin
    if qryAccess.RecordCount > 1 then
        begin
          if not Assigned(frmListaEnderecos) then
          begin
            frmListaEnderecos := TfrmListaEnderecos.Create(Application);
          end;
          frmListaEnderecos.tbEnderecos.Open;
          while not qryAccess.Eof do
          begin
            frmListaEnderecos.tbEnderecos.Insert;
            frmListaEnderecos.tbEnderecosCOD_MODALIDADE.AsInteger := qryAccess.FieldByName('nCdModalidade').AsInteger;
            frmListaEnderecos.tbEnderecosNUM_CEP.AsString := Trim(qryAccess.FieldByName('sCep05').AsString) +
                                                             Trim(qryAccess.FieldByName('sCep03').AsString);
            frmListaEnderecos.tbEnderecosDES_ENDERECO.AsString := Trim(qryAccess.FieldByName('sTipoLogr').AsString) + ' ' +
                                                                  Trim(qryAccess.FieldByName('sLogradouro').AsString) +
                                                                  ', ' + Trim(qryAccess.FieldByName('sNumLogr').AsString) + ' - ' +
                                                                  Trim(qryAccess.FieldByName('sComplLogr').AsString) + ' - ' +
                                                                  Trim(qryAccess.FieldByName('sBairro').AsString) + ' - ' +
                                                                  Trim(qryAccess.FieldByName('sCidade').AsString) + '/' +
                                                                  Trim(qryAccess.FieldByName('sUF').AsString);
            frmListaEnderecos.tbEnderecosID_ASSINATURA.AsInteger := 0;
            frmListaEnderecos.tbEnderecos.Post;
            qryAccess.Next;
          end;
          if not frmListaEnderecos.tbEnderecos.IsEmpty then frmListaEnderecos.tbEnderecos.First;
          if frmListaEnderecos.ShowModal = mrOk then
          begin
            assinante := TAssinaturaJornal.Create();
            SetupAssinaturaSTD;
            SetupOcorrenciasSTD;
          end
          else
          begin
            Exit;
          end;
        end
    else
    begin
      assinante := TAssinaturaJornal.Create();
      SetupAssinaturaSTD;
      SetupOcorrenciasSTD;
    end;
  end
  else
  begin
    Application.MessageBox('Assinatura não encontrada no banco de dados do STD!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  FreeAndNil(frmListaEnderecos);
  qryAccess.Close;
  qryAccess.SQL.Clear;
  ZConn.Disconnect;
  Result := True;
end;

procedure Tview_OcorrenciasJornal.SalvaAssinatura;
begin
  assinanteDAO := TAssinantesJornalDAO.Create();
  if not assinanteDAO.Insert(assinante)  then
  begin
    Application.MessageBox('Erro ao incluir a assinatura no banco de dados!', 'Atenção!', MB_OK + MB_ICONERROR);
  end;
  assinanteDAO.Free;
end;

procedure Tview_OcorrenciasJornal.SetupAssinaturaSTD;
var
  sCodigo: String;
begin
  assinanteDAO := TAssinantesJornalDAO.Create();
  assinante.ID := 0;
  sCodigo := FloatToStr(StrToFloatDef(Trim(qryAccess.FieldByName('sCdAssinante').AsString),0));
  assinante.Codigo := sCodigo;
  assinante.Modalidade := qryAccess.FieldByName('nCdModalidade').AsInteger;
  assinante.Produto := Trim(qryAccess.FieldByName('nCdProduto').AsString);
  assinante.Qtde := qryAccess.FieldByName('nQuantidade').AsInteger;
  assinante.Nome := Trim(qryAccess.FieldByName('sDscAssinante').AsString);
  assinante.CEP := qryAccess.FieldByName('sCep05').AsString + qryAccess.FieldByName('sCep03').AsString;
  assinante.TipoLogradouro := Trim(qryAccess.FieldByName('sTipoLogr').AsString);
  assinante.NomeLogradouro := Trim(qryAccess.FieldByName('sLogradouro').AsString);
  assinante.NumeroLogradouro := Trim(qryAccess.FieldByName('sNumLogr').AsString);
  assinante.Complemento := Trim(qryAccess.FieldByName('sComplLogr').AsString);
  assinante.Bairro := Trim(qryAccess.FieldByName('sBairro').AsString);
  assinante.Cidade := Trim(qryAccess.FieldByName('sCidade').AsString);
  assinante.Estado := Trim(qryAccess.FieldByName('sUF').AsString);
  assinante.Roteiro := Trim(qryAccess.FieldByName('nCdAgente').AsString);
  assinante.Ordem := qryAccess.FieldByName('nOrdenacao').AsInteger;
  assinante.Referencia := Trim(qryAccess.FieldByName('sReferencia').AsString);
  assinante.Log := '>' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' inclusão da assinatura dos dados do STD por ' +
                                          uGlobais.sUsuario;
  assinanteDAO.Free;
end;

procedure Tview_OcorrenciasJornal.SetupOcorrenciasSTD;
var
  sRoteiroNovo: String;
begin
  produtoDAO := TProdutosDAO.Create();
  //tbPlanilha.Insert;
  tbPlanilhaNUM_OCORRENCIA.AsInteger := 0;
  tbPlanilhaDAT_OCORRENCIA.AsDateTime := Now;
  tbPlanilhaCOD_ASSINATURA.AsString := FloatToStr(StrToFloatDef(assinante.Codigo,0));
  tbPlanilhaNOM_ASSINANTE.AsString := assinante.Nome;
  tbPlanilhaDES_ROTEIRO.AsString := assinante.Roteiro;
  tbPlanilhaCOD_ENTREGADOR.AsInteger := 0;
  tbPlanilhaCOD_OCORRENCIA.AsInteger := 0;
  tbPlanilhaDOM_REINCIDENTE.AsString := 'N';
  tbPlanilhaDES_ENDERECO.AsString := assinante.TipoLogradouro + ' ' + assinante.NomeLogradouro + ', ' +
                                     assinante.NumeroLogradouro + ' - ' + assinante.Complemento + ' - ' +
                                     assinante.Bairro + ' - ' + assinante.Cidade + '/' + assinante.Estado;
  tbPlanilhaDES_RETORNO.AsString := '';
  tbPlanilhaCOD_RESULTADO.AsInteger := 0;
  tbPlanilhaCOD_ORIGEM.AsInteger := 0;
  tbPlanilhaDES_OBS.AsString := '';
  tbPlanilhaCOD_STATUS.AsInteger := 0;
  tbPlanilhaDES_LOG.AsString := '>' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' inclusão da ocorrência por ' +
                                        uGlobais.sUsuario + ' dados da Assinatura do STD';
  tbPlanilhaCOD_PRODUTO.AsString := assinante.Produto;
  tbPlanilhaDOM_PROCESSADO.AsString := 'N';
  tbPlanilhaVAL_OCORRENCIA.AsFloat := 0;
  tbPlanilhaQTD_OCORRENCIAS.AsInteger := 1;
  tbPlanilhaDES_APURACAO.AsString := '';
  tbPlanilhaDES_DESCRICAO.AsString := '';
  tbPlanilhaDOM_FINALIZAR.AsBoolean := True;
  tbPlanilhaDAT_DESCONTO.AsDateTime := 0;
  tbPlanilhaDES_ANEXO.AsString := '';
  roteiro := TRoteiroEntregador.Create();
  roteiro.RoteiroAntigo := tbPlanilhaDES_ROTEIRO.AsString;
  sRoteiroNovo := roteiro.getField('COD_ROTEIRO_NOVO','ANTIGO');
  tbPlanilhaDES_ROTEIRO_NOVO.AsString := sRoteiroNovo;
  tbPlanilhaDES_OCORRENCIA.AsString := '';
  produtos := produtoDAO.FindByCodigo(tbPlanilhaCOD_PRODUTO.AsString);
  tbPlanilha.Post;
  produtoDAO.Free;
  roteiro.Free;
end;

procedure Tview_OcorrenciasJornal.SearchBD;
begin
  OpenDialog.Title := 'Abrir Banco de dados STD Cliente';
  if OpenDialog.Execute then
  begin
    sBanco := OpenDialog.FileName;
  end;
end;

procedure Tview_OcorrenciasJornal.MarcaImpressao;
var
  lLog: TStringList;
begin
  lLog := TStringList.Create();
  lLog.Text := tbPlanilhaDES_LOG.Text;
  lLog.Add('>' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' declaração impressa por  ' + uGlobais.sUsuario);
  tbPlanilha.IsLoading := True;
  tbPlanilha.Edit;
  tbPlanilhaDOM_IMPRESSAO.AsString := 'S';
  tbPlanilhaDOM_GRAVAR.AsString := 'N';
  tbPlanilhaDES_LOG.Text := lLog.Text;
  tbPlanilha.Post;
  tbPlanilha.IsLoading := False;
  lLog.Free;
  ocorrencia := TOcorrenciasJornal.Create();
  SetupClass;
  ocorrenciaDAO := TOcorrenciasJornalDAO.Create;
  if not ocorrenciaDAO.Update(ocorrencia) then
  begin
    Application.MessageBox('Erro ao salvar o Flag de impressão!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
  end;
  ocorrenciaDAO.Free;
  ocorrencia.Free;
end;

procedure Tview_OcorrenciasJornal.SetupClass;
begin
  ocorrencia.Numero := tbPlanilhaNUM_OCORRENCIA.AsInteger;
  ocorrencia.DataOcorrencia := tbPlanilhaDAT_OCORRENCIA.AsDateTime;
  ocorrencia.CodigoAssinstura := tbPlanilhaCOD_ASSINATURA.AsString;
  ocorrencia.Nome := tbPlanilhaNOM_ASSINANTE.AsString;
  ocorrencia.Roteiro := tbPlanilhaDES_ROTEIRO.AsString;
  ocorrencia.Entregador := tbPlanilhaCOD_ENTREGADOR.AsInteger;
  ocorrencia.Produto := tbPlanilhaCOD_PRODUTO.AsString;
  ocorrencia.CodigoOcorrencia := tbPlanilhaCOD_OCORRENCIA.AsInteger;
  ocorrencia.Reincidente := tbPlanilhaDOM_REINCIDENTE.AsString;
  ocorrencia.Descricao := tbPlanilhaDES_DESCRICAO.AsString;
  ocorrencia.Endereco := tbPlanilhaDES_ENDERECO.AsString;
  ocorrencia.Retorno := tbPlanilhaDES_RETORNO.AsString;
  ocorrencia.Resultado := tbPlanilhaCOD_RESULTADO.AsInteger;
  ocorrencia.Origem := tbPlanilhaCOD_ORIGEM.AsInteger;
  ocorrencia.Obs := tbPlanilhaDES_OBS.AsString;
  ocorrencia.Status := tbPlanilhaCOD_STATUS.AsInteger;
  ocorrencia.Apuracao := tbPlanilhaDES_APURACAO.AsString;
  ocorrencia.Qtde := tbPlanilhaQTD_OCORRENCIAS.AsInteger;
  ocorrencia.Valor := tbPlanilhaVAL_OCORRENCIA.AsFloat;
  ocorrencia.Impressao := tbPlanilhaDOM_IMPRESSAO.AsString;
  ocorrencia.Anexo := tbPlanilhaDES_ANEXO.AsString;
  ocorrencia.Log := tbPlanilhaDES_LOG.AsString;
end;

procedure Tview_OcorrenciasJornal.ClearParametros;
begin
  lciDataInicial.Visible := False;
  lciDataFinal.Visible := False;
  lciTexto.Visible := False;
  lciLista.Visible := False;
end;

procedure Tview_OcorrenciasJornal.dsStateChange(Sender: TObject);
begin
  if TDataSource(Sender).DataSet.State in [dsInsert, dsEdit] then
  begin
    if not tbPlanilha.IsLoading then
    begin
      actGravar.Enabled := False;
      actCancelar.Enabled := False;
      actLimpar.Enabled := False;
      actDeclaracao.Enabled := False;
      actFinalizar.Enabled := False;
      actExportar.Enabled := false;
    end;
  end;
  if TDataSource(Sender).DataSet.State in [dsBrowse] then
  begin
    actGravar.Enabled := True;
    actCancelar.Enabled := True;
    actLimpar.Enabled := True;
    actDeclaracao.Enabled := True;
    actFinalizar.Enabled := True;
    actExportar.Enabled := True;
  end;
end;

procedure Tview_OcorrenciasJornal.CancelarOcorrencia;
var
  lLog: TStringList;
begin
  if tbPlanilhaCOD_STATUS.AsInteger > 1 then
  begin
    Application.MessageBox('Ocorrência não pode ser cancelada!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  lLog := TStringList.Create();
  lLog.Text := tbPlanilhaDES_LOG.Text;
  lLog.Add('>' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' ocorrência cancelada por  ' + uGlobais.sUsuario);
  tbPlanilha.IsLoading := True;
  tbPlanilha.Edit;
  tbPlanilhaCOD_STATUS.AsInteger := 5;
  tbPlanilhaDOM_GRAVAR.AsString := 'N';
  tbPlanilhaDES_LOG.Text := lLog.Text;
  tbPlanilha.Post;
  tbPlanilha.IsLoading := False;
  lLog.Free;
  SetupClass;
  ocorrenciaDAO := TOcorrenciasJornalDAO.Create;
  if not ocorrenciaDAO.Update(ocorrencia) then
  begin
    Application.MessageBox('Erro ao cancelar a ocorrência!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
  end;
  ocorrenciaDAO.Free;
end;

procedure Tview_OcorrenciasJornal.FinalizarOcorrencios;
begin
  if Application.MessageBox('Confirma finalizar as ocorrências selecionadas?','Finalizar', MB_YESNO + MB_ICONQUESTION) = IDNO then
    Exit;
  thrFinalizar := Thread_FinalizaOcorrenciasJornal.Create(True);
  thrFinalizar.FreeOnTerminate := True;
  thrFinalizar.Priority := tpNormal;
  thrFinalizar.Start;
end;

function Tview_OcorrenciasJornal.VerificaGravar(): Boolean;
var
  bFlag : Boolean;
begin
  Result := False;
  bFlag := False;
  if tbPlanilha.IsEmpty then Exit;
  if not tbPlanilha.IsEmpty then tbPlanilha.First;
  while not tbPlanilha.Eof do
  begin
    if tbPlanilhaDOM_GRAVAR.AsString = 'S' then
    begin
      bFlag := True;
    end;
    tbPlanilha.Next;
  end;
  Result := bFlag;
end;

procedure Tview_OcorrenciasJornal.SalvaOcorrencias;
begin
  if Application.MessageBox('Confirma gravar a(s) ocorrência(s)?', 'Gravar', MB_YESNO + MB_ICONQUESTION) = IDNO then Exit;
  thrSalvar := Thread_SalvaOcorrenciasJornal.Create(True);
  thrSalvar.FreeOnTerminate := True;
  thrSalvar.Priority := tpNormal;
  thrSalvar.Start;
end;

procedure Tview_OcorrenciasJornal.Exportar;
var
  FileExt, sFile: String;
begin
  if not(tbPlanilha.Active) then
  begin
    Exit;
  end;
  if tbPlanilha.IsEmpty then
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
      ExportGridToExcel(SaveDialog.FileName, grdOcorrencias, False, True, False)
    else if FileExt = '.xml' then
      ExportGridToXML(SaveDialog.FileName, grdOcorrencias, False)
    else if FileExt = '.txt' then
      ExportGridToText(SaveDialog.FileName, grdOcorrencias, False)
    else if FileExt = '.html' then
      ExportGridToHTML(SaveDialog.FileName, grdOcorrencias, False);
    ShellExecute(Handle, 'open', pchar(SaveDialog.FileName), nil, nil, SW_SHOW);
  end;
end;



end.
