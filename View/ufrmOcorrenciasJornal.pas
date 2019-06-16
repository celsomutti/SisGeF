unit ufrmOcorrenciasJornal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  dxmdaset, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, Vcl.Clipbrd, System.Actions, Vcl.ActnList, cxDBLookupComboBox, cxDropDownEdit,
  cxContainer, cxLabel, cxTextEdit, cxImageComboBox, cxCurrencyEdit, Vcl.ExtCtrls,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxMaskEdit, cxCalendar, ZAbstractRODataset, ZDataset, clEntregador, clOperacaoJornal,
  clRoteiroEntregador, cxGridCustomPopupMenu, cxGridPopupMenu, cxBlobEdit, cxCheckBox, cxGridExportLink,
  ShellAPI, frxClass, frxDBSet, clAcessos, System.DateUtils, DAO.Produtos, Model.Produtos, Model.AssinaturaJornal,
  System.Generics.Collections, DAO.AssinantesJornal, DAO.OcorrenciasJornal, Model.OcorrenciasJornal, clTipoOcorrencias,
  ZAbstractConnection, ZConnection, Model.Modalidades, DAO.Modalidade, Model.OcorrenciaEntregador, DAO.OcorrenciaEntregador,
  cxGroupBox, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light;

type
  TfrmOcorrenciasJornal = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    tbPlanilha: TdxMemData;
    ds: TDataSource;
    tbPlanilhaNUM_OCORRENCIA: TIntegerField;
    tbPlanilhaDAT_OCORRENCIA: TDateTimeField;
    tbPlanilhaCOD_ASSINATURA: TWideStringField;
    tbPlanilhaNOM_ASSINANTE: TWideStringField;
    tbPlanilhaDES_ROTEIRO: TWideStringField;
    tbPlanilhaCOD_ENTREGADOR: TIntegerField;
    tbPlanilhaCOD_OCORRENCIA: TIntegerField;
    tbPlanilhaDOM_REINCIDENTE: TWideStringField;
    tbPlanilhaDES_ENDERECO: TWideStringField;
    tbPlanilhaDES_RETORNO: TWideStringField;
    tbPlanilhaCOD_RESULTADO: TIntegerField;
    tbPlanilhaCOD_ORIGEM: TIntegerField;
    tbPlanilhaDES_OBS: TWideStringField;
    tbPlanilhaCOD_STATUS: TIntegerField;
    tbPlanilhaDES_LOG: TWideMemoField;
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
    cxGrid1DBTableView1DES_LOG: TcxGridDBColumn;
    aclOcorrencias: TActionList;
    actColar: TAction;
    tbPlanilhaCOD_PRODUTO: TStringField;
    dsProduto: TDataSource;
    dsTipoOcorrencia: TDataSource;
    cxLabel27: TcxLabel;
    cxGrid1DBTableView1DES_OCORRENCIA: TcxGridDBColumn;
    tbPlanilhaDOM_PROCESSADO: TStringField;
    tbPlanilhaVAL_OCORRENCIA: TFloatField;
    cxGrid1DBTableView1VAL_OCORRENCIA: TcxGridDBColumn;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    cxDataInicial: TcxDateEdit;
    cxLabel2: TcxLabel;
    cxDataFinal: TcxDateEdit;
    cxGrid1DBTableView1NOM_ENTREGADOR: TcxGridDBColumn;
    dsEntregador: TDataSource;
    tbPlanilhaQTD_OCORRENCIAS: TIntegerField;
    actProcessar: TAction;
    cxButton2: TcxButton;
    tbPlanilhaDES_CHAVE: TStringField;
    tbPlanilhaDES_APURACAO: TMemoField;
    actPesquisar: TAction;
    cxButton3: TcxButton;
    OpenDialog: TOpenDialog;
    actImportarPlanilha: TAction;
    PopupMenu1: TPopupMenu;
    Importar1: TMenuItem;
    actGravar: TAction;
    cxButton4: TcxButton;
    cxGrid1DBTableView1QTD_OCORRENCIAS: TcxGridDBColumn;
    actCustear: TAction;
    tbPlanilhaDES_DESCRICAO: TStringField;
    tbPlanilhaDOM_FINALIZAR: TBooleanField;
    cxGrid1DBTableView1DOM_FINALIZAR: TcxGridDBColumn;
    cxLabel3: TcxLabel;
    cxStatusOcorrencia: TcxComboBox;
    SaveDialog: TSaveDialog;
    actExportar: TAction;
    cxButton6: TcxButton;
    actFinalizar: TAction;
    cxButton5: TcxButton;
    actSair: TAction;
    cxButton7: TcxButton;
    cxGrid1DBTableView1COD_STATUS: TcxGridDBColumn;
    cxGrid1DBTableView1DES_APURACAO: TcxGridDBColumn;
    cxGrid1DBTableView1DOM_PROCESSADO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_CHAVE: TcxGridDBColumn;
    actEntregador: TAction;
    cxButton8: TcxButton;
    tbPlanilhaDAT_DESCONTO: TDateField;
    actIncluir: TAction;
    cxButton9: TcxButton;
    cxButton10: TcxButton;
    actExcluir: TAction;
    actCancelar: TAction;
    cxButton11: TcxButton;
    tbPlanilhaDES_ROTEIRO_NOVO: TStringField;
    tbPlanilhaDOM_IMPRESSAO: TStringField;
    tbPlanilhaDES_ANEXO: TStringField;
    cxGrid1DBTableView1DAT_DESCONTO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_ROTEIRO_NOVO: TcxGridDBColumn;
    cxGrid1DBTableView1DOM_IMPRESSAO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_ANEXO: TcxGridDBColumn;
    actDeclaracao: TAction;
    cxButton12: TcxButton;
    rptdsDeclaracaoJornal: TfrxDBDataset;
    rptDeclaracaoJornal: TfrxReport;
    tbPlanilhaDES_OCORRENCIA: TStringField;
    tbPlanilhaDES_PRODUTO: TStringField;
    tbProdutos: TdxMemData;
    tbProdutosCOD_PRODUTO: TWideStringField;
    tbProdutosDES_PRODUTO: TWideStringField;
    tbListaEntregadores: TdxMemData;
    tbListaEntregadoresCOD_CADASTRO: TIntegerField;
    tbListaEntregadoresDES_RAZAO_SOCIAL: TStringField;
    tbTipoOcorrencias: TdxMemData;
    tbTipoOcorrenciasCOD_TIPO_OCORRENCIA: TIntegerField;
    tbTipoOcorrenciasDES_TIPO_OCORRENCIA: TWideStringField;
    ZConn: TZConnection;
    qryAccess: TZReadOnlyQuery;
    tbPlanilhaDOM_GRAVAR: TStringField;
    Panel2: TPanel;
    dsErros: TDataSource;
    cxGroupBox1: TcxGroupBox;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2DBTableView1RecId: TcxGridDBColumn;
    cxGrid2DBTableView1COD_ASSINATURA: TcxGridDBColumn;
    cxGrid2DBTableView1NOM_ASSINANTE: TcxGridDBColumn;
    cxGrid2DBTableView1QTD_OCORRENCIAS: TcxGridDBColumn;
    cxGrid2DBTableView1VAL_UNITARIO: TcxGridDBColumn;
    cxGrid2DBTableView1VAL_OCORRENCIA: TcxGridDBColumn;
    cxGrid2DBTableView1DES_DESCRICAO: TcxGridDBColumn;
    cxGrid2Level1: TcxGridLevel;
    actFecharErros: TAction;
    actExportarErros: TAction;
    cxButton1: TcxButton;
    cxButton13: TcxButton;
    tbErros: TdxMemData;
    tbErrosCOD_ASSINATURA: TStringField;
    tbErrosNOM_ASSINANTE: TStringField;
    tbErrosQTD_OCORRENCIAS: TIntegerField;
    tbErrosVAL_UNITARIO: TFloatField;
    tbErrosVAL_OCORRENCIA: TFloatField;
    tbErrosDES_DESCRICAO: TStringField;
    cxButton14: TcxButton;
    actCancelarOcorrencia: TAction;
    cxButton15: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actProcessarExecute(Sender: TObject);
    procedure actImportarPlanilhaExecute(Sender: TObject);
    procedure actGravarExecute(Sender: TObject);
    procedure actPesquisarExecute(Sender: TObject);
    procedure actCustearExecute(Sender: TObject);
    procedure cxStatusOcorrenciaPropertiesChange(Sender: TObject);
    procedure actExportarExecute(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
    procedure actFinalizarExecute(Sender: TObject);
    procedure actEntregadorExecute(Sender: TObject);
    procedure dsDataChange(Sender: TObject; Field: TField);
    procedure actIncluirExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actDeclaracaoExecute(Sender: TObject);
    procedure rptDeclaracaoJornalAfterPrintReport(Sender: TObject);
    procedure cxGrid1DBTableView1COD_ASSINATURAPropertiesValidate(Sender: TObject; var DisplayValue: Variant;
      var ErrorText: TCaption; var Error: Boolean);
    procedure tbPlanilhaBeforePost(DataSet: TDataSet);
    procedure actFecharErrosExecute(Sender: TObject);
    procedure actExportarErrosExecute(Sender: TObject);
    procedure actCancelarOcorrenciaExecute(Sender: TObject);
  private
    { Private declarations }
    procedure PopulaProdutos;
    procedure PopulaTiposOcorrencias;
    procedure PopulaEntregadores;
    procedure ProcessaOcorrencias;
    procedure SetupClass;
    procedure PopulaOcorrencias;
    procedure ImportaPlanilha;
    procedure SalvaPlanilha;
    procedure ProcessaFinanceiro;
    procedure Exportar();
    procedure ExportarErros();
    procedure FinalizaOcorrencia();
    procedure ListaEntregadores;
    procedure ExcluirOcorrencia;
    procedure ImprimirDeclaracao;
    procedure SalvaImpressos;
    procedure SetupAssinaturaSTD;
    procedure SetupOcorrencias;
    procedure SetupOcorrenciasSTD;
    procedure SearchBD;
    procedure SalvaAssinatura;
    procedure CancelarOcorrencia;
    function SearchAssinatura(sCodigo: String): Boolean;
    function SearchSTD(sCodigo: String): Boolean;
    function SeparaDatas(sTexto: String): TStringList;
  public
    { Public declarations }
  end;

var
  frmOcorrenciasJornal: TfrmOcorrenciasJornal;
  tipoocorrencia: TTiposOcorrencias;
  entregador: TEntregador;
  roteiro: TRoteiroEntregador;
  operacao: TOperacionalJornal;
  acesso: TAcessos;
  assinante: TAssinaturaJornal;
  assinanteTMP: TAssinaturaJornal;
  assinantes: TObjectList<TAssinaturaJornal>;
  assinanteDAO: TAssinantesJornalDAO;
  ocorrencia: TOcorrenciasJornal;
  ocorrenciaTMP: TOcorrenciasJornal;
  ocorrencias: TObjectList<TOcorrenciasJornal>;
  ocorrenciaDAO: TOcorrenciasJornalDAO;
  produto: TProdutos;
  produtoTMP: TProdutos;
  produtos: TObjectList<TProdutos>;
  produtoDAO: TProdutosDAO;
  modalidade: TModalidades;
  modalidadeTMP: TModalidades;
  modalidades: TObjectList<TModalidades>;
  modalidadeDAO: TModalidadeDAO;
  ocorrenciaEntregador: TOcorrenciaEntregador;
  ocorrenciaEntregadorTMP: TOcorrenciaEntregador;
  ocorrenciasEntregador: TObjectList<TOcorrenciaEntregador>;
  ocorrenciaEntregadorDAO: TOcorrenciaEntregadorDAO;
  sBanco : String;
implementation

{$R *.dfm}

uses udm, clUtil, uGlobais, ufrmProcesso, ufrmListaApoio, ufrmImpressao, ufrmPesquisarPessoa, ufrmListaEnderecos;

procedure TfrmOcorrenciasJornal.actCancelarOcorrenciaExecute(Sender: TObject);
begin
  CancelarOcorrencia;
end;

procedure TfrmOcorrenciasJornal.actCustearExecute(Sender: TObject);
begin
  if Application.MessageBox('Confirma Custear as ocorrências?', PChar('Atenção ' + uGlobais.sUsuario), MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  ProcessaFinanceiro;
end;

procedure TfrmOcorrenciasJornal.actDeclaracaoExecute(Sender: TObject);
begin
  if tbPlanilha.State in [dsInsert, dsInsert] then
  begin
    tbPlanilha.Post;
  end;
  ImprimirDeclaracao;
end;

procedure TfrmOcorrenciasJornal.actEntregadorExecute(Sender: TObject);
begin
  if tbPlanilhaCOD_STATUS.AsInteger > 2 then
  begin
    if uGlobais.iNivelUsuario <> 0 then
    begin
      Application.MessageBox('Ocorrência finalizada! Não é possível alterar o entregador.', PChar('Atenção ' + uGlobais.sUsuario),
                             MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
  end;
  ListaEntregadores;
end;

procedure TfrmOcorrenciasJornal.actExcluirExecute(Sender: TObject);
begin
  ExcluirOcorrencia;
end;

procedure TfrmOcorrenciasJornal.actExportarErrosExecute(Sender: TObject);
begin
  ExportarErros();
end;

procedure TfrmOcorrenciasJornal.actExportarExecute(Sender: TObject);
begin
  Exportar();
end;

procedure TfrmOcorrenciasJornal.actFecharErrosExecute(Sender: TObject);
begin
  tbErros.Close;
  cxGroupBox1.Visible := False;
end;

procedure TfrmOcorrenciasJornal.actFinalizarExecute(Sender: TObject);
begin
  if tbPlanilha.State in [dsInsert, dsInsert] then
  begin
    tbPlanilha.Post;
  end;
  FinalizaOcorrencia;
  PopulaOcorrencias;
end;

procedure TfrmOcorrenciasJornal.actGravarExecute(Sender: TObject);
begin
  if Application.MessageBox('Confirma a gravação?', PChar('Atenção ' + uGlobais.sUsuario), MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  SalvaPlanilha;
end;

procedure TfrmOcorrenciasJornal.actImportarPlanilhaExecute(Sender: TObject);
begin
  ImportaPlanilha;
end;

procedure TfrmOcorrenciasJornal.actIncluirExecute(Sender: TObject);
begin
  if not tbPlanilha.Active then
  begin
    tbPlanilha.Open;
  end;
  tbPlanilha.Insert;
end;

procedure TfrmOcorrenciasJornal.actPesquisarExecute(Sender: TObject);
begin
  PopulaOcorrencias;
end;

procedure TfrmOcorrenciasJornal.actProcessarExecute(Sender: TObject);
begin
  if Application.MessageBox('Confirma o Processamento?', PChar('Atenção ' + uGlobais.sUsuario), MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  ProcessaOcorrencias;
end;

procedure TfrmOcorrenciasJornal.actSairExecute(Sender: TObject);
begin
  Perform(WM_CLOSE, 0, 0);
end;

procedure TfrmOcorrenciasJornal.actCancelarExecute(Sender: TObject);
begin
  cxDataInicial.Text := '';
  cxDataFinal.Text := '';
  cxStatusOcorrencia.ItemIndex := 0;
  tbPlanilha.Cancel;
  if tbPlanilha.Active then tbPlanilha.Close;
  tbPlanilha.Open;
  tbErros.Close;
  cxGroupBox1.Visible := False;
end;

procedure TfrmOcorrenciasJornal.cxGrid1DBTableView1COD_ASSINATURAPropertiesValidate(Sender: TObject; var DisplayValue: Variant;
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

procedure TfrmOcorrenciasJornal.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
  cxGrid1DBTableView1.ViewData.Expand(True);
end;

procedure TfrmOcorrenciasJornal.cxStatusOcorrenciaPropertiesChange(Sender: TObject);
begin
  if tbPlanilha.Active then
  begin
    tbPlanilha.Close;
  end;
  if (cxStatusOcorrencia.ItemIndex >= 2) AND (cxStatusOcorrencia.ItemIndex <> 5) then
  begin
    ds.AutoEdit := False;
    cxGrid1DBTableView1DOM_FINALIZAR.Visible := False;
    cxGrid1DBTableView1DOM_IMPRESSAO.Visible := False;
    actFinalizar.Enabled := False;
    actDeclaracao.Enabled := False;
  end
  else
  begin
    ds.AutoEdit := True;
    cxGrid1DBTableView1DOM_FINALIZAR.Visible := True;
    cxGrid1DBTableView1DOM_IMPRESSAO.Visible := True;
    actFinalizar.Enabled := True;
    actDeclaracao.Enabled := True;
  end;
end;

procedure TfrmOcorrenciasJornal.dsDataChange(Sender: TObject; Field: TField);
begin
  if tbPlanilha.IsLoading then
  begin
    Exit;
  end;
  actGravar.Enabled := True;
end;

procedure TfrmOcorrenciasJornal.dsStateChange(Sender: TObject);
begin
  if TDataSource(Sender).DataSet.State in [dsInsert, dsEdit] then
  begin
    actColar.Enabled := False;
    actIncluir.Enabled := False;
    actExcluir.Enabled := False;
    actProcessar.Enabled := False;
    actGravar.Enabled := False;
    if (cxStatusOcorrencia.ItemIndex = 1) or (cxStatusOcorrencia.ItemIndex = 2) then
    begin
      actFinalizar.Enabled := True;
    end
    else
    begin
      actFinalizar.Enabled := False;
    end;
    actExportar.Enabled := False;
    actEntregador.Enabled := False;
    actCancelar.Enabled := True;
    actCancelarOcorrencia.Enabled := False;
    actSair.Enabled := True;
  end
  else if TDataSource(Sender).DataSet.State in [dsBrowse] then
  begin
    actIncluir.Enabled := True;
    actExcluir.Enabled := True;
    actColar.Enabled := True;
    actProcessar.Enabled := True;
    actGravar.Enabled := False;
    actFinalizar.Enabled := True;
    actExportar.Enabled := True;
    actEntregador.Enabled := True;
    actCancelar.Enabled := True;
    actCancelarOcorrencia.Enabled := True;
    actSair.Enabled := True;
  end;
end;

procedure TfrmOcorrenciasJornal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tbListaEntregadores.Close;
  tbProdutos.Close;
  tbTipoOcorrencias.Close;
  tbTipoOcorrencias.Close;
  tipoocorrencia.Free;
  produto.Free;
  entregador.Free;
  roteiro.Free;
  operacao.Free;
  ocorrencia.Free;
  acesso.Free;
  Action := caFree;
  frmOcorrenciasJornal := Nil;
end;

procedure TfrmOcorrenciasJornal.FormShow(Sender: TObject);
begin
  produto := TProdutos.Create;
  tipoocorrencia := TTiposOcorrencias.Create;
  entregador := TEntregador.Create;
  roteiro := TRoteiroEntregador.Create;
  operacao := TOperacionalJornal.Create;
  ocorrencia := TOcorrenciasJornal.Create;
  PopulaEntregadores;
  PopulaProdutos;
  PopulaTiposOcorrencias;
  acesso.SetNivel(aclOcorrencias);
end;

procedure TfrmOcorrenciasJornal.PopulaProdutos;
begin
  if tbProdutos.Active then
  begin
    tbProdutos.Close;
  end;
  tbProdutos.Open;
  produtoDAO := TProdutosDAO.Create();
  produtos := produtoDAO.FindByDescricao('');
  tbProdutos.IsLoading := True;
  for produtoTMP in produtos do
  begin
    tbProdutos.Insert;
    tbProdutosCOD_PRODUTO.AsString := produtoTMP.Codigo;
    tbProdutosDES_PRODUTO.AsString := produtoTMP.Descricao;
    tbProdutos.Post;
  end;
  if not dm.tbProdutos.IsEmpty then
  begin
    dm.tbProdutos.First;
  end;
  dm.tbProdutos.IsLoading := False;
  produtoDAO.Free;
end;

procedure TfrmOcorrenciasJornal.PopulaTiposOcorrencias;
begin
  if tbTipoOcorrencias.Active then
  begin
    tbTipoOcorrencias.Close;
  end;
  tbTipoOcorrencias.Open;
  if tipoocorrencia.getObjects then
  begin
    tbTipoOcorrencias.IsLoading := True;
    tbTipoOcorrencias.LoadFromDataSet(dm.qryGetObject1);
    tbTipoOcorrencias.IsLoading := False;
    if not dm.tbTipoOcorrencias.IsEmpty then
    begin
      tbTipoOcorrencias.First;
    end;
  end;
  dm.qryGetObject.Close;
  dm.qryGetObject.SQL.Clear;
end;

procedure TfrmOcorrenciasJornal.PopulaEntregadores;
begin
  tbListaEntregadores.Close;
  tbListaEntregadores.Open;
  if entregador.ListaEntregadores then
  begin
    while not dm.qryPesquisa.Eof do
    begin
      tbListaEntregadores.Insert;
      tbListaEntregadoresCOD_CADASTRO.AsInteger := dm.qryPesquisa.FieldByName('COD_CADASTRO').AsInteger;
      tbListaEntregadoresDES_RAZAO_SOCIAL.AsString := dm.qryPesquisa.FieldByName('NOM_FANTASIA').AsString;
      tbListaEntregadores.Post;
      dm.qryPesquisa.Next;
    end;
  end;
  if not tbListaEntregadores.IsEmpty then
  begin
    tbListaEntregadores.First;
  end;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
end;

procedure TfrmOcorrenciasJornal.ProcessaOcorrencias;
var
  i, iNumero: Integer;
  sData: String;
  sDataTmp: String;
  sDataLonga: String;
  sTexto: String;
  sRoteiro: string;
  dtData: TDate;
  bFlagOperacao: Boolean;
  bFlagData: Boolean;
  sRoteiroNovo: String;
  lDatas : TStringList;
begin
  if tbPlanilha.IsEmpty then
  begin
    Exit;
  end;
  sTexto := tbPlanilhaDES_DESCRICAO.AsString;
  sRoteiro := tbPlanilhaDES_ROTEIRO.AsString;
  lDatas := TStringList.Create;
  lDatas := SeparaDatas(sTexto);
  sData := lDatas[0];
  operacao.RoteiroAntigo := sRoteiro;
  sDataLonga := FormatDateTime('dd/mm/yyyy', StrToDate(sData));
  operacao.Data := StrToDate(sDataLonga);
  roteiro.RoteiroAntigo := sRoteiro;
  sRoteiroNovo := roteiro.getField('COD_ROTEIRO_NOVO','ANTIGO');
  bFlagOperacao := False;
  iNumero := tbPlanilhaNUM_OCORRENCIA.AsInteger;
  if operacao.getObject('','CHAVE1') then
  begin
    bFlagOperacao := True;
  end;
  if not bFlagOperacao then
  begin
    if operacao.getObject(sRoteiroNovo,'CHAVE2') then
    begin
      bFlagOperacao := True;
    end;
  end;
  if bFlagOperacao then
  begin
    dtData := StrToDate(sDataLonga);
    tbPlanilha.Edit;
    tbPlanilhaDES_LOG.AsString := ocorrencia.Log + #13 + '>' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) +
                                  ' alterado em processamento de ocorrência por ' +
                                  uGlobais.sUsuario;
    tbPlanilhaCOD_ENTREGADOR.AsInteger := OPERACAO.Entregador;
    tbPlanilhaDOM_PROCESSADO.AsString := 'S';
    tbPlanilhaDES_CHAVE.AsString := '';
    tbPlanilhaDOM_GRAVAR.AsString := 'S';
    tbPlanilhaDOM_FINALIZAR.AsBoolean := True;
    tbPlanilha.Post;
  end;
  ocorrenciaEntregadorDAO.Free;
  ocorrenciaEntregador.Free;
end;

procedure TfrmOcorrenciasJornal.rptDeclaracaoJornalAfterPrintReport(Sender: TObject);
begin
  SalvaImpressos;
  PopulaOcorrencias;
end;

procedure TfrmOcorrenciasJornal.SetupClass;
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
  ocorrencia.Impressao := 'S';
  ocorrencia.Anexo := 'Anexada ao Roteiro do dia ' + FormatDateTime('dd/mm/yyyy', Now + 1);
  ocorrencia.Log := tbPlanilhaDES_LOG.AsString;
end;

procedure TfrmOcorrenciasJornal.PopulaOcorrencias;
var
  i: Integer;
  iRecords: Integer;
  iContador: Integer;
  sRoteiroNovo: string;
begin
  try
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
  if (not TUtil.Empty(cxDataFinal.Text)) and (not TUtil.Empty(cxDataInicial.Text))  then
  begin
    if cxDataFinal.Date < cxDataInicial.Date then
    begin
      Application.MessageBox('A data Final do período é menor que a data Inicial!', PChar('Atenção ' + uGlobais.sUsuario),
                             MB_OK + MB_ICONEXCLAMATION);
      cxDataFinal.SetFocus;
      Exit;
    end;
  end;
  tbPlanilha.Close;
  tbPlanilha.Open;
  ocorrenciaDAO := TOcorrenciasJornalDAO.Create();
  ocorrencias := ocorrenciaDAO.FindByPeriodo(FormatDateTime('yyyy-mm-dd', cxDataInicial.Date), FormatDateTime('yyyy-mm-dd',
                                             cxDataFinal.Date), cxStatusOcorrencia.ItemIndex);
  if ocorrencias.Count = 0 then
  begin
    Application.MessageBox('Nenhuma ocorrência encontrada no período informado!', PChar('Atenção ' + uGlobais.sUsuario),
                           MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if not Assigned(frmProcesso) then
  begin
    frmProcesso := TfrmProcesso.Create(Application);
  end;
  frmProcesso.Show;
  frmProcesso.cxGroupBox1.Caption := 'Aguarde...';
  frmProcesso.cxGroupBox1.Refresh;
  iRecords := ocorrencias.Count;
  iContador := 1;
  dPosicao := 0;
  produtoDAO := TProdutosDAO.Create();
  tbPlanilha.IsLoading := True;
  for ocorrenciaTMP in ocorrencias do
  begin
    tbPlanilha.Insert;
    tbPlanilhaNUM_OCORRENCIA.AsInteger := ocorrenciaTMP.Numero;
    tbPlanilhaDAT_OCORRENCIA.AsDateTime := ocorrenciaTMP.DataOcorrencia;
    tbPlanilhaCOD_ASSINATURA.AsString := ocorrenciaTMP.CodigoAssinstura;
    tbPlanilhaNOM_ASSINANTE.AsString := ocorrenciaTMP.Nome;
    tbPlanilhaDES_ROTEIRO.AsString := ocorrenciaTMP.Roteiro;
    tbPlanilhaCOD_ENTREGADOR.AsInteger := ocorrenciaTMP.Entregador;
    tbPlanilhaCOD_OCORRENCIA.AsInteger := ocorrenciaTMP.CodigoOcorrencia;
    tbPlanilhaDOM_REINCIDENTE.AsString := ocorrenciaTMP.Reincidente;
    tbPlanilhaDES_ENDERECO.AsString := ocorrenciaTMP.Endereco;
    tbPlanilhaDES_RETORNO.AsString := ocorrenciaTMP.Retorno;
    tbPlanilhaCOD_RESULTADO.AsInteger := ocorrenciaTMP.Resultado;
    tbPlanilhaCOD_ORIGEM.AsInteger := ocorrenciaTMP.Origem;
    tbPlanilhaDES_OBS.AsString := ocorrenciaTMP.Obs;
    tbPlanilhaCOD_STATUS.AsInteger := ocorrenciaTMP.Status;
    tbPlanilhaDES_LOG.AsString := ocorrenciaTMP.Log;
    tbPlanilhaCOD_PRODUTO.AsString := ocorrenciaTMP.Produto;
    tbPlanilhaDOM_PROCESSADO.AsString := ocorrenciaTMP.Processado;
    tbPlanilhaVAL_OCORRENCIA.AsFloat := ocorrenciaTMP.Valor;
    tbPlanilhaQTD_OCORRENCIAS.AsInteger := ocorrenciaTMP.Qtde;
    tbPlanilhaDES_APURACAO.AsString := ocorrenciaTMP.Apuracao;
    tbPlanilhaDES_DESCRICAO.AsString := ocorrenciaTMP.Descricao;
    tbPlanilhaDOM_FINALIZAR.AsBoolean := False;
    tbPlanilhaDAT_DESCONTO.AsDateTime := ocorrenciaTMP.DataDesconto;
    tbPlanilhaDES_ANEXO.AsString := ocorrenciaTMP.Anexo;
    tbPlanilhaDOM_IMPRESSAO.AsString := ocorrenciaTMP.Impressao;
    if tbPlanilhaCOD_ENTREGADOR.AsInteger > 0 then
    begin
      tbPlanilhaDES_CHAVE.AsString := tbPlanilhaCOD_ASSINATURA.AsString +
                                      tbPlanilhaCOD_PRODUTO.AsString +
                                      tbPlanilhaDES_ROTEIRO.AsString +
                                      tbPlanilhaCOD_OCORRENCIA.AsString +
                                      tbPlanilhaDAT_OCORRENCIA.AsString;
    end;
    roteiro.RoteiroAntigo := tbPlanilhaDES_ROTEIRO.AsString;
    sRoteiroNovo := roteiro.getField('COD_ROTEIRO_NOVO','ANTIGO');
    tbPlanilhaDES_ROTEIRO_NOVO.AsString := sRoteiroNovo;
    tipoocorrencia.Codigo := tbPlanilhaCOD_OCORRENCIA.AsString;
    tbPlanilhaDES_OCORRENCIA.AsString := tipoocorrencia.getField('DES_TIPO_OCORRENCIA','CODIGO');

    produtos := produtoDAO.FindByCodigo(tbPlanilhaCOD_PRODUTO.AsString);
    for produtoTMP in produtos do
    begin
      tbPlanilhaDES_PRODUTO.AsString := produtoTMP.Descricao;
    end;
    tbPlanilhaDOM_GRAVAR.AsString := 'N';
    tbPlanilha.Post;
    dPosicao := (iContador / iRecords) * 100;
    Inc(iContador,1);
    frmProcesso.cxProgressBar1.Position := dPosicao;
    frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
    frmProcesso.cxProgressBar1.Refresh;
  end;
  tbPlanilha.IsLoading := False;
  produtoDAO.Free;
  finally
    if Assigned(frmProcesso) then
    begin
      frmProcesso.Close;
      FreeAndNil(frmProcesso);
    end;
    if not tbPlanilha.IsEmpty then
    begin
      tbPlanilha.First;
      cxGrid1DBTableView1.ViewData.Expand(True);
    end;
  end;
end;

procedure TfrmOcorrenciasJornal.ImportaPlanilha;
var
  sLista: String;
  sDetalhe: TStringList;
  ArquivoCSV: TextFile;
  sArquivo: string;
  i: Integer;
  dPercentual: Double;
  LinhasTotal: Integer;
  Contador: Integer;
  sCampo: string;
  sNomeEntregador: String;
  sCodigoEntregador: string;
begin
  try
    sArquivo := '';
    if OpenDialog.Execute then
    begin
      sArquivo := OpenDialog.FileName;
    end
    else
    begin
      Exit;
    end;
    if Application.MessageBox('Confirma a importação?', PChar('Atenção ' + uGlobais.sUsuario), MB_YESNO + MB_ICONQUESTION) = IDNO then
    begin
      Exit;
    end;
    AssignFile(ArquivoCSV, sArquivo);
    dPercentual := 0;
    if not Assigned(frmProcesso) then
    begin
      frmProcesso := TfrmProcesso.Create(Application);
    end;
    Screen.Cursor := crHourGlass;
    frmProcesso.Show;
    frmProcesso.cxGroupBox1.Caption := 'Importando Planilha. Aguarde...';
    frmProcesso.cxGroupBox1.Refresh;
    LinhasTotal := TUtil.NumeroDeLinhasTXT(sArquivo);
    AssignFile(ArquivoCSV, sArquivo);
    Reset(ArquivoCSV);
    sLista := '';
    sDetalhe := TStringList.Create;
    sDetalhe.StrictDelimiter := True;
    sDetalhe.Delimiter := ';';
    Readln(ArquivoCSV, sLista);
    produtoDAO := TProdutosDAO.Create();
    ocorrenciaDAO := TOcorrenciasJornalDAO.Create();
    while not Eoln(ArquivoCSV) do
    begin
      sDetalhe.DelimitedText := sLista;
      if sDetalhe.Count > 0 then
      begin
        if TUtil.ENumero(sDetalhe[1]) then
        begin
          ocorrencia.Roteiro := sDetalhe[0];
          ocorrencia.CodigoAssinstura := sDetalhe[1];
          ocorrencia.Nome := sDetalhe[2];
          produtos := produtoDAO.FindByDescricao(sDetalhe[3]);
          for produtoTMP in produtos do
          begin
            ocorrencia.Produto := produtoTMP.Codigo;
          end;
          ocorrencia.CodigoOcorrencia := StrToIntDef(sDetalhe[4],0);
          ocorrencia.Reincidente := Copy(sDetalhe[6],1,1);
          ocorrencia.DataOcorrencia := StrToDateDef(sDetalhe[7],Now);
          ocorrencia.Descricao := sDetalhe[8];
          ocorrencia.Endereco := sDetalhe[9];
          ocorrencia.Retorno := sDetalhe[10];
          ocorrencia.Resultado := StrToIntDef(sDetalhe[11],0);
          ocorrencia.Origem := StrToIntDef(sDetalhe[12],0);
          ocorrencia.Apuracao := sDetalhe[13];
          ocorrencia.Obs := sDetalhe[14];
          ocorrencia.Status := ocorrencia.Resultado;
          sCampo := sDetalhe[15];
          sCodigoEntregador := '0';
          if Copy(sCampo,1,6) = 'FALHA ' then
          begin
            sNomeEntregador := Trim(Copy(sCampo,7,Length(sCampo)));
            if not sNomeEntregador.IsEmpty then
            begin
              entregador.Alias := sNomeEntregador;
              sCodigoEntregador := entregador.getField('COD_CADASTRO', 'ALIAS');
            end;
          end;
          ocorrencia.Entregador := StrToIntDef(sCodigoEntregador,0);
          if ocorrenciaDAO.Exist(ocorrencia.CodigoAssinstura, ocorrencia.Produto, ocorrencia.Roteiro,
                                 ocorrencia.CodigoOcorrencia, ocorrencia.Entregador, ocorrencia.DataOcorrencia) then
          begin
            if not ocorrenciaDAO.Update(ocorrencia) then
            begin
              Application.MessageBox('Erro ao alterar a ocorrência!', PChar('Atenção ' + uGlobais.sUsuario),
                                     MB_OK + MB_ICONEXCLAMATION);
            end;
          end
          else
          begin
            if not ocorrenciaDAO.Insert(ocorrencia) then
            begin
              Application.MessageBox('Erro ao incluir a ocorrência!', PChar('Atenção ' + uGlobais.sUsuario),
                                     MB_OK + MB_ICONEXCLAMATION);
            end;
          end;
        end;
      end;
      Readln(ArquivoCSV, sLista);
      dPosicao := (Contador / LinhasTotal) * 100;
      Inc(Contador);
      frmProcesso.cxProgressBar1.Position := dPosicao;
      frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
      frmProcesso.cxProgressBar1.Refresh;
    end;
    Application.MessageBox('Importação Concluída!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONINFORMATION);
  finally
    Screen.Cursor := crDefault;
    produtoDAO.Free;
    ocorrenciaDAO.Free;
    if Assigned(frmProcesso) then
    begin
      frmProcesso.Close;
      FreeAndNil(frmProcesso);
    end;
    CloseFile(ArquivoCSV);
    sLista := '';
    FreeAndNil(sDetalhe);
  end;
end;

procedure TfrmOcorrenciasJornal.SalvaPlanilha;
var
  dPercentual: Double;
  Contador: Integer;
  LinhasTotal: Integer;
begin
  ocorrenciaDAO := TOcorrenciasJornalDAO.Create();
  try
    if tbPlanilha.IsEmpty then
    begin
      Exit;
    end;
    dPercentual := 0;
    if not Assigned(frmProcesso) then
    begin
      frmProcesso := TfrmProcesso.Create(Application);
    end;
  Screen.Cursor := crHourGlass;
  LinhasTotal := tbPlanilha.RecordCount;
  tbPlanilha.First;
  while not tbPlanilha.Eof do
  begin
    if tbPlanilhaDOM_FINALIZAR.Value = True then
    begin
      ocorrencia.Numero := tbPlanilhaNUM_OCORRENCIA.AsInteger;
      ocorrencia.Roteiro := tbPlanilhaDES_ROTEIRO.AsString;
      ocorrencia.CodigoAssinstura := tbPlanilhaCOD_ASSINATURA.AsString;
      ocorrencia.Nome := tbPlanilhaNOM_ASSINANTE.AsString;
      ocorrencia.Produto := tbPlanilhaCOD_PRODUTO.AsString;
      ocorrencia.CodigoAssinstura := tbPlanilhaCOD_ASSINATURA.AsString;
      ocorrencia.Reincidente := tbPlanilhaDOM_REINCIDENTE.AsString;
      ocorrencia.DataOcorrencia := tbPlanilhaDAT_OCORRENCIA.AsDateTime;
      ocorrencia.Descricao := tbPlanilhaDES_DESCRICAO.AsString;
      ocorrencia.Endereco := tbPlanilhaDES_ENDERECO.AsString;
      ocorrencia.Retorno := tbPlanilhaDES_RETORNO.AsString;
      ocorrencia.Resultado := tbPlanilhaCOD_RESULTADO.AsInteger;
      ocorrencia.Origem := tbPlanilhaCOD_ORIGEM.AsInteger;
      ocorrencia.Apuracao := tbPlanilhaDES_APURACAO.Text;
      ocorrencia.Obs := tbPlanilhaDES_OBS.Text;
      if tbPlanilhaCOD_STATUS.AsInteger <= 2 then
      begin
        if tbPlanilhaCOD_RESULTADO.AsInteger = 1 then
        begin
          tbplanilha.Edit;
          tbPlanilhaCOD_STATUS.AsInteger := 1;
          tbPlanilha.Post;
        end
        else if (tbPlanilhaCOD_RESULTADO.AsInteger = 16) AND (tbPlanilhaCOD_ENTREGADOR.AsInteger = 0) then
        begin
          tbplanilha.Edit;
          tbPlanilhaCOD_STATUS.AsInteger := 2;
          tbPlanilha.Post;
        end;
      end;
      ocorrencia.Status := tbPlanilhaCOD_STATUS.AsInteger;
      ocorrencia.Entregador := tbPlanilhaCOD_ENTREGADOR.AsInteger;
      ocorrencia.Processado := tbPlanilhaDOM_PROCESSADO.AsString;
      ocorrencia.Valor := tbPlanilhaVAL_OCORRENCIA.AsFloat;
      ocorrencia.Qtde := tbPlanilhaQTD_OCORRENCIAS.AsInteger;
      ocorrencia.Impressao := 'N';
      ocorrencia.Log := tbPlanilhaDES_LOG.Text;
      if ocorrencia.Numero > 0 then
      begin
        if not ocorrenciaDAO.Update(ocorrencia) then
        begin
          Application.MessageBox('Erro ao alterar a ocorrência!', PChar('Atenção ' + uGlobais.sUsuario),
                                 MB_OK + MB_ICONEXCLAMATION);
        end;
      end
      else
      begin
        if not ocorrenciaDAO.Insert(ocorrencia) then
        begin
          Application.MessageBox('Erro ao incluir a ocorrência!', PChar('Atenção ' + uGlobais.sUsuario),
                                 MB_OK + MB_ICONEXCLAMATION);
        end;
      end;
    end;
    dPosicao := (Contador / LinhasTotal) * 100;
    Inc(Contador);
    frmProcesso.cxProgressBar1.Position := dPosicao;
    frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
    frmProcesso.cxProgressBar1.Refresh;
    tbPlanilha.Next;
  end;
  finally
    ocorrenciaDAO.Free;
    if Assigned(frmProcesso) then
    begin
      frmProcesso.Close;
      FreeAndNil(frmProcesso);
    end;
    tbPlanilha.Close;
    cxDataInicial.Clear;
    cxDataFinal.Clear;
    cxDataInicial.SetFocus;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmOcorrenciasJornal.ProcessaFinanceiro;
var
  sLista: String;
  sDetalhe: TStringList;
  ArquivoCSV: TextFile;
  sArquivo: string;
  i: Integer;
  dPercentual: Double;
  LinhasTotal: Integer;
  Contador: Integer;
  sData: String;
  sDataDesconto: String;
  sTexto: String;
  iQtde: Integer;
  dValor: Double;
  dTotalOK: Double;
  dTotalErro: Double;
  lDatas : TStringList;
begin
  try
    sArquivo := '';
    ocorrenciaDAO := TOcorrenciasJornalDAO.Create();
    ocorrenciaentregadorDAO := TOcorrenciaEntregadorDAO.Create();
    if OpenDialog.Execute then
    begin
      sArquivo := OpenDialog.FileName;
    end
    else
    begin
      Exit;
    end;
    lDatas := TStringList.Create();
    AssignFile(ArquivoCSV, sArquivo);
    dPercentual := 0;
    if not Assigned(frmProcesso) then
    begin
      frmProcesso := TfrmProcesso.Create(Application);
    end;
    Screen.Cursor := crHourGlass;
    frmProcesso.Show;
    frmProcesso.cxGroupBox1.Caption := 'Importando Planilha. Aguarde...';
    frmProcesso.cxGroupBox1.Refresh;
    LinhasTotal := TUtil.NumeroDeLinhasTXT(sArquivo);
    AssignFile(ArquivoCSV, sArquivo);
    Reset(ArquivoCSV);
    sLista := '';
    sDetalhe := TStringList.Create;
    sDetalhe.StrictDelimiter := True;
    sDetalhe.Delimiter := ';';
    Readln(ArquivoCSV, sLista);
    dValor := 0;
    dTotalOK := 0;
    dTotalErro := 0;
    if tbErros.Active then tbErros.Close;
    while not Eoln(ArquivoCSV) do
    begin
      iQtde := 0;
      sDetalhe.DelimitedText := sLista;
      if sDetalhe.Count > 0 then
      begin
        if TUtil.ENumero(sDetalhe[0]) then
        begin
          sTexto := sDetalhe[11];
          lDatas := SeparaDatas(sTexto);
          sData :=  FormatDateTime('dd/mm/yyyy', StrToDateDef(lDatas[0],0));
          ocorrencias := ocorrenciaDAO.FindbyFinanceiro(sDetalhe[4],sData);
          for ocorrenciaTMP in ocorrencias do
          begin
            iQtde := StrToIntDef(sDetalhe[8],0);
            dValor := StrToFloatDef(sDetalhe[10],0);
            sDataDesconto := Copy(sDetalhe[3],1,10);
            if (ocorrenciaTMP.Status = 6) and (ocorrenciaTMP.Qtde <> iQtde)  then
            begin
              if not tbErros.Active then tbErros.Open;
              dTotalErro := dTotalErro + dValor;
              tbErros.Insert;
              tbErrosCOD_ASSINATURA.AsString := sDetalhe[4];
              tbErrosNOM_ASSINANTE.AsString := sDetalhe[6];
              tbErrosQTD_OCORRENCIAS.AsInteger := StrToIntDef(sDetalhe[8],0);
              tbErrosVAL_UNITARIO.AsFloat := StrToFloatDef(sDetalhe[9],0);
              tbErrosVAL_OCORRENCIA.AsFloat := StrToFloatDef(sDetalhe[10],0);
              tbErrosDES_DESCRICAO.AsString := sDetalhe[11];
              tbErros.Post;
            end
            else
            begin
              dTotalOK := dTotalOK + dValor;
              ocorrenciaTMP.DataDesconto := StrToDateDef(sDataDesconto,0);
              ocorrenciaTMP.Qtde := iQtde;
              ocorrenciaTMP.Valor := dValor;
              if not ocorrenciaDAO.Update(ocorrenciaTMP) then
              begin
                Application.MessageBox(PChar('Erro ao alterar a ocorrência ' + sDetalhe[3] + ' de ' + sData + ' !'),
                                               PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
              end;
            end;
          end;
          if ocorrencias.Count = 0 then
          begin
            dValor := StrToFloatDef(sDetalhe[10],0);
            dTotalErro := dTotalErro + dValor;
            if not tbErros.Active then tbErros.Open;
            tbErros.Insert;
            tbErrosCOD_ASSINATURA.AsString := sDetalhe[4];
            tbErrosNOM_ASSINANTE.AsString := sDetalhe[6];
            tbErrosQTD_OCORRENCIAS.AsInteger := StrToIntDef(sDetalhe[8],0);
            tbErrosVAL_UNITARIO.AsFloat := StrToFloatDef(sDetalhe[9],0);
            tbErrosVAL_OCORRENCIA.AsFloat := StrToFloatDef(sDetalhe[10],0);
            tbErrosDES_DESCRICAO.AsString := sDetalhe[11];
            tbErros.Post;
          end;
        end;
      end;
      Readln(ArquivoCSV, sLista);
      dPosicao := (Contador / LinhasTotal) * 100;
      Inc(Contador);
      frmProcesso.cxProgressBar1.Position := dPosicao;
      frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
      frmProcesso.cxProgressBar1.Refresh;
      if not tbErros.IsEmpty then
      begin
        cxGroupBox1.Visible := True;
      end;
    end;
    Application.MessageBox('Importação Concluída!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONINFORMATION);
  finally
    Screen.Cursor := crDefault;
    ocorrenciaDAO.Free;
    if Assigned(frmProcesso) then
    begin
      frmProcesso.Close;
      FreeAndNil(frmProcesso);
    end;
    Screen.Cursor := crDefault;
    CloseFile(ArquivoCSV);
    sLista := '';
    FreeAndNil(sDetalhe);
  end;
end;

procedure TfrmOcorrenciasJornal.Exportar;
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

procedure TfrmOcorrenciasJornal.FinalizaOcorrencia();
var
  iRecords: Integer;
  iContador: Integer;
begin
  try
    if Application.MessageBox('Confirma a finalização da(s) ocorrência(s)?',PChar('Atenção ' + uGlobais.sUsuario), MB_YESNO + MB_ICONQUESTION) = IDNO then
    begin
      Exit;
    end;
    if tbPlanilha.IsEmpty then
    begin
      Exit;
    end;
    Screen.Cursor := crHourGlass;
    ocorrenciaDAO := TOcorrenciasJornalDAO.Create();
    if not Assigned(frmProcesso) then
    begin
      frmProcesso := TfrmProcesso.Create(Application);
    end;
    frmProcesso.Show;
    frmProcesso.cxGroupBox1.Caption := 'Aguarde...';
    frmProcesso.cxGroupBox1.Refresh;
    iRecords := tbPlanilha.RecordCount;
    iContador := 1;
    dPosicao := 0;
    tbPlanilha.First;
    while not tbPlanilha.Eof do
    begin
      if tbPlanilhaDOM_FINALIZAR.Value then
      begin
        if tbPlanilhaCOD_ENTREGADOR.AsInteger <> 0 then
        begin
          SetupClass;
          ocorrencia.Status := 4;
          if ocorrenciaDAO.Exist(ocorrencia.CodigoAssinstura, ocorrencia.Produto, ocorrencia.Roteiro,
                                 ocorrencia.CodigoOcorrencia, ocorrencia.Entregador, ocorrencia.DataOcorrencia) then
          begin
            if not ocorrenciaDAO.Update(ocorrencia) then
            begin
              sMensagem := 'Erro ao alterar a ocorrência! Nº ' + tbPlanilhaNUM_OCORRENCIA.AsString;
              Application.MessageBox(PChar(sMensagem), PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
            end;
          end
          else
          begin
            if not ocorrenciaDAO.Insert(ocorrencia) then
            begin
              sMensagem := 'Erro ao incluir a ocorrência! Assinatura Nº ' + tbPlanilhaCOD_ASSINATURA.AsString + ' Data: ' +
                           tbPlanilhaDAT_OCORRENCIA.AsString;
              Application.MessageBox(PChar(sMensagem), PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
            end;
          end;
        end
        else
        begin
          sMensagem := 'Informe o entregador da Assinatura Nº ' + tbPlanilhaCOD_ASSINATURA.AsString + ' Data da Ocorrência: ' +
                       tbPlanilhaDAT_OCORRENCIA.AsString;
          Application.MessageBox(PChar(sMensagem), PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
        end;
      end;
      dPosicao := (iContador / iRecords) * 100;
      Inc(iContador,1);
      frmProcesso.cxProgressBar1.Position := dPosicao;
      frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
      frmProcesso.cxProgressBar1.Refresh;
      tbPlanilha.Next;
    end;
  finally
    Screen.Cursor := crDefault;
    ocorrenciaDAO.Free;
    if Assigned(frmProcesso) then
    begin
      frmProcesso.Close;
      FreeAndNil(frmProcesso);
    end;
    if not tbPlanilha.IsEmpty then
    begin
      tbPlanilha.First;
    end;
  end;
end;

procedure TfrmOcorrenciasJornal.ListaEntregadores;
var
  sId: String;
  sCodigo: string;
  sNome: string;
  sMess: string;
begin
  sId := '';
  Screen.Cursor := crHourGlass;
  sId := '';
  if not entregador.ListaEntregadores then
  begin
    dm.qryPesquisa.Close;
    dm.qryPesquisa.SQL.Clear;
    Exit;
  end
  else
  begin
    dm.qryPesquisa.First;
  end;
  if not Assigned(frmListaApoio) then
  begin
    frmListaApoio := TfrmListaApoio.Create(Application);
  end;
  frmListaApoio.Caption := 'Entregadores';
  frmListaApoio.cxGrid1DBTableView1.OptionsView.Header := False;
  Screen.Cursor := crDefault;
  if frmListaApoio.ShowModal = mrOk then
  begin
    sCodigo := dm.qryPesquisa.Fields[0].AsString;
    sNome := dm.qryPesquisa.Fields[1].AsString;
    if tbPlanilhaCOD_ENTREGADOR.AsString <> sCodigo then
    begin
      sMess := 'Confirma alterar o Entregador para ' + sNome + '?';
      if Application.MessageBox(PChar(sMess),PChar('Atenção ' + uGlobais.sUsuario), MB_YESNO + MB_ICONQUESTION) = IDYES then
      begin
        tbPlanilha.Edit;
        tbPlanilhaCOD_ENTREGADOR.Value := StrToIntDef(sCodigo,0);
        tbPlanilha.Post;
      end;
    end;
  end;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  FreeAndNil(frmListaApoio);
end;

procedure TfrmOcorrenciasJornal.ExcluirOcorrencia;
begin
  if not tbPlanilha.Active then
  begin
    Exit;
  end;
  if tbPlanilha.IsEmpty then
  begin
    Exit;
  end;
  ocorrenciaDAO := TOcorrenciasJornalDAO.Create();
  if tbPlanilhaNUM_OCORRENCIA.AsInteger = 0 then
  begin
    Exit;
  end;
  if tbPlanilhaCOD_STATUS.AsInteger > 2 then
  begin
    Application.MessageBox('Ocorrência não pode ser excluída!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
   if Application.MessageBox('Confirma excluir esta ocorrência?', PChar('Atenção ' + uGlobais.sUsuario), MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  if not ocorrenciaDAO.Delete(tbPlanilhaNUM_OCORRENCIA.AsInteger) then
  begin
    Application.MessageBox('Erro ao excluir esta ocorrência!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  tbPlanilha.Delete;
  ocorrenciaDAO.Free;
end;

procedure TfrmOcorrenciasJornal.ImprimirDeclaracao;
var
  sEndereco: String;
  sOcorrencia: string;
  sImpressao: string;
begin
  sEndereco := '';
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
    sOcorrencia :=  tbPlanilhaCOD_OCORRENCIA.AsString + ' - ' + cxGrid1DBTableView1DES_OCORRENCIA.DataBinding.Field.Value;
    LoadFromFile(frmImpressao.cxArquivo.Text);
    sImpressao := 'Impresso pelo ' + Application.Title + ' Versão ' + TUtil.VersaoExe + ' por ' + uGlobais.sNomeUsuario +
                  ' em ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now);
    Variables.Items[Variables.IndexOf('parImpressao')].Value :=  QuotedStr(sImpressao);
    FreeAndNil(frmImpressao);
    if (not uGlobais.bFlagImprimir) then
    begin
      ShowReport(True);
    end
    else
    begin
      Print;
    end;
  end;
end;

procedure TfrmOcorrenciasJornal.SalvaImpressos;
var
  iRecords: Integer;
  iContador: Integer;
begin
  try
    if tbPlanilha.IsEmpty then
    begin
      Exit;
    end;
    Screen.Cursor := crHourGlass;
    if not Assigned(frmProcesso) then
    begin
      frmProcesso := TfrmProcesso.Create(Application);
    end;
    frmProcesso.Show;
    frmProcesso.cxGroupBox1.Caption := 'Aguarde...';
    frmProcesso.cxGroupBox1.Refresh;
    iRecords := tbPlanilha.RecordCount;
    iContador := 1;
    dPosicao := 0;
    ocorrenciaDAO := TOcorrenciasJornalDAO.Create();
    tbPlanilha.First;
    while not tbPlanilha.Eof do
    begin
      if tbPlanilhaDOM_IMPRESSAO.AsString = 'P' then
      begin
        SetupClass;
        if ocorrenciaDAO.Exist(ocorrencia.CodigoAssinstura, ocorrencia.Produto, ocorrencia.Roteiro,
                               ocorrencia.CodigoOcorrencia, ocorrencia.Entregador, ocorrencia.DataOcorrencia) then
        begin
          if not ocorrenciaDAO.Update(ocorrencia) then
          begin
            sMensagem := 'Erro ao alterar a ocorrência! Nº ' + tbPlanilhaNUM_OCORRENCIA.AsString;
            Application.MessageBox(PChar(sMensagem), PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
          end;
        end
        else
        begin
          if not ocorrenciaDAO.Insert(ocorrencia) then
          begin
            sMensagem := 'Erro ao incluir a ocorrência! Assinatura Nº ' + tbPlanilhaCOD_ASSINATURA.AsString + ' Data: ' +
                         tbPlanilhaDAT_OCORRENCIA.AsString;
            Application.MessageBox(PChar(sMensagem), PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
          end;
        end;
        tbPlanilha.Edit;
        tbPlanilhaDOM_IMPRESSAO.AsString := 'S';
        tbPlanilha.Post;
      end;
      dPosicao := (iContador / iRecords) * 100;
      Inc(iContador,1);
      frmProcesso.cxProgressBar1.Position := dPosicao;
      frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
      frmProcesso.cxProgressBar1.Refresh;
      tbPlanilha.Next;
    end;
  finally
    Screen.Cursor := crDefault;
    ocorrenciaDAO.Free;
    if Assigned(frmProcesso) then
    begin
      frmProcesso.Close;
      FreeAndNil(frmProcesso);
    end;
    if not tbPlanilha.IsEmpty then
    begin
      tbPlanilha.First;
    end;
  end;
end;

procedure TfrmOcorrenciasJornal.SetupAssinaturaSTD;
var
  sCodigo: String;
begin
  assinanteDAO := TAssinantesJornalDAO.Create();
  assinante.ID := 0;
  assinante.Codigo := qryAccess.FieldByName('sCdAssinante').AsString;
  sCodigo := Trim(qryAccess.FieldByName('sCdAssinante').AsString);
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

function TfrmOcorrenciasJornal.SearchAssinatura(sCodigo: String): Boolean;
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

function TfrmOcorrenciasJornal.SearchSTD(sCodigo: String): Boolean;
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

procedure TfrmOcorrenciasJornal.SearchBD;
begin
  OpenDialog.Title := 'Abrir Banco de dados STD Cliente';
  if OpenDialog.Execute then
  begin
    sBanco := OpenDialog.FileName;
  end;
end;

procedure TfrmOcorrenciasJornal.SetupOcorrencias;
var
  sRoteiroNovo: String;
begin
  produtoDAO := TProdutosDAO.Create();
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
    tbPlanilhaDOM_FINALIZAR.AsBoolean := True;
    tbPlanilhaDAT_DESCONTO.AsDateTime := 0;
    tbPlanilhaDES_ANEXO.AsString := '';
    roteiro.RoteiroAntigo := tbPlanilhaDES_ROTEIRO.AsString;
    sRoteiroNovo := roteiro.getField('COD_ROTEIRO_NOVO','ANTIGO');
    tbPlanilhaDES_ROTEIRO_NOVO.AsString := sRoteiroNovo;
    tbPlanilhaDES_OCORRENCIA.AsString := '';
    produtos := produtoDAO.FindByCodigo(tbPlanilhaCOD_PRODUTO.AsString);
    for produtoTMP in produtos do
    begin
      tbPlanilhaDES_PRODUTO.AsString := produtoTMP.Descricao;
    end;
    tbPlanilha.Post;
  end;
  produtoDAO.Free;
end;

procedure TfrmOcorrenciasJornal.SetupOcorrenciasSTD;
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
  roteiro.RoteiroAntigo := tbPlanilhaDES_ROTEIRO.AsString;
  sRoteiroNovo := roteiro.getField('COD_ROTEIRO_NOVO','ANTIGO');
  tbPlanilhaDES_ROTEIRO_NOVO.AsString := sRoteiroNovo;
  tbPlanilhaDES_OCORRENCIA.AsString := '';
  produtos := produtoDAO.FindByCodigo(tbPlanilhaCOD_PRODUTO.AsString);
  for produtoTMP in produtos do
  begin
    tbPlanilhaDES_PRODUTO.AsString := produtoTMP.Descricao;
  end;
  tbPlanilha.Post;
  produtoDAO.Free;
end;

procedure TfrmOcorrenciasJornal.tbPlanilhaBeforePost(DataSet: TDataSet);
begin
  if tbPlanilha.IsLoading then Exit;
  tbPlanilhaDOM_GRAVAR.AsString := 'S';
  tbPlanilhaDOM_FINALIZAR.AsBoolean := True;
  if tbPlanilhaCOD_STATUS.AsInteger < 3 then
  begin
    if tbPlanilhaCOD_RESULTADO.AsInteger = 16 then
    begin
      tbPlanilhaCOD_STATUS.AsInteger := 2;
    end
    else if (tbPlanilhaCOD_RESULTADO.AsInteger > 0) and (tbPlanilhaCOD_RESULTADO.AsInteger <>  16) then
    begin
      tbPlanilhaCOD_STATUS.AsInteger := 1;
    end;
  end;
end;

procedure TfrmOcorrenciasJornal.SalvaAssinatura;
begin
  assinanteDAO := TAssinantesJornalDAO.Create();
  if not assinanteDAO.Insert(assinante)  then
  begin
    Application.MessageBox('Erro ao incluir a assinatura no banco de dados!', 'Atenção!', MB_OK + MB_ICONERROR);
  end;
  assinanteDAO.Free;
end;

function TfrmOcorrenciasJornal.SeparaDatas(sTexto: String): TStringList;
var
  lResultado : TStringList;
  i : Integer;
  sCaracter : String;
  sData: String;
begin
  try
    lResultado := TStringList.Create();
    sCaracter := '';
    sData := '';
    for i := 0 to Length(sTexto) - 1 do
    begin
      sCaracter := Copy(sTexto,i,1);
      if Pos(sCaracter,'0123456789/') <> 0 then
      begin
        sData := sData + sCaracter;
      end
      else
      begin
        if StrToDateDef(sData,0) <> 0 then
        begin
          lResultado.Add(sData);
        end;
        sData := '';
      end;
    end;
    Result := lResultado;
  finally
    lResultado.Free;
  end;
end;

procedure TfrmOcorrenciasJornal.ExportarErros;
var
  FileExt, sFile: String;
begin
  if not(tbErros.Active) then
  begin
    Exit;
  end;
  if tbErros.IsEmpty then
  begin
    Exit;
  end;
  sFile := 'erros';
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
      ExportGridToExcel(SaveDialog.FileName, cxGrid2, False, True, False)
    else if FileExt = '.xml' then
      ExportGridToXML(SaveDialog.FileName, cxGrid2, False)
    else if FileExt = '.txt' then
      ExportGridToText(SaveDialog.FileName, cxGrid2, False)
    else if FileExt = '.html' then
      ExportGridToHTML(SaveDialog.FileName, cxGrid2, False);
    ShellExecute(Handle, 'open', pchar(SaveDialog.FileName), nil, nil, SW_SHOW);
  end;
end;

procedure TfrmOcorrenciasJornal.CancelarOcorrencia;
var
  sLog : TStringList;
  sMess : String;
begin
  if not tbPlanilha.Active then Exit;
  if tbPlanilha.IsEmpty then Exit;
  if Application.MessageBox('Confirma Cancelar as Ocorrências Pendentes Selecionada?',
                              'Atenção!', MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  tbPlanilha.First;
  sLog := TStringList.Create();
  while not tbPlanilha.Eof do
  begin
    if tbPlanilhaDOM_FINALIZAR.Value = True then
    begin
      if tbPlanilhaCOD_STATUS.AsInteger <> 2 then
      begin
        sMess := 'Ocorrência Nº. ' + tbPlanilhaNUM_OCORRENCIA.AsString + ' não pode ser Cancelada pois não está Pendente!';
        Application.MessageBox(PChar(sMess),'Atenção!', MB_OK + MB_ICONWARNING);
        Exit;
      end;
      sLog.Text := tbPlanilhaDES_LOG.AsString;
      sLog.Add('> ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' ocorrência cancelada por ' + uGlobais.sUsuario);
      tbPlanilha.Edit;
      tbPlanilhaCOD_STATUS.AsInteger := 5;
      tbPlanilhaCOD_ENTREGADOR.AsInteger := 0;
      tbPlanilhaDES_LOG.AsString := sLog.Text;
      tbPlanilha.Post;
    end;
    tbPlanilha.Next;
  end;
  sLog.Free;
end;



end.
