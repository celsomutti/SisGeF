unit ufrmAssinanteJornal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Model.AssinaturaJornal, DAO.AssinantesJornal,
  Model.OcorrenciasJornal, DAO.OcorrenciasJornal, Model.Modalidades, DAO.Modalidade, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxContainer, cxEdit, dxLayoutcxEditAdapters,
  dxLayoutContainer, cxTextEdit, cxMaskEdit, cxLabel, dxLayoutControl, cxButtonEdit, cxDropDownEdit, Model.Produtos, DAO.Produtos,
  Data.DB, dxmdaset, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxCurrencyEdit, cxMemo, System.Actions,
  Vcl.ActnList, dxSkinsdxBarPainter, dxBar, System.Generics.Collections, ZAbstractRODataset, ZDataset, ZAbstractConnection,
  ZConnection, DAO.Estados, Model.Estados;

type
  TfrmAssinanteJornal = class(TForm)
    lcgRoot: TdxLayoutGroup;
    lcCadastro: TdxLayoutControl;
    lblTitulo: TcxLabel;
    lciTitulo: TdxLayoutItem;
    edtID: TcxMaskEdit;
    lciId: TdxLayoutItem;
    edtCodigoAssinatura: TcxMaskEdit;
    lciCodigoAssinatura: TdxLayoutItem;
    lcgIdentificacao: TdxLayoutAutoCreatedGroup;
    edtModalidade: TcxButtonEdit;
    lciCodigoModalidade: TdxLayoutItem;
    lblModalidade: TcxLabel;
    lciDescricaoModalidade: TdxLayoutItem;
    edtCodigoProduto: TcxButtonEdit;
    lciCodigoProduto: TdxLayoutItem;
    lblProduto: TcxLabel;
    lciDescricaoProduto: TdxLayoutItem;
    edtNome: TcxTextEdit;
    lciNome: TdxLayoutItem;
    edtTipoLogradouro: TcxTextEdit;
    lciTipoLogradouro: TdxLayoutItem;
    edtLogradouro: TcxTextEdit;
    lciLogradouro: TdxLayoutItem;
    lcgLogradouro: TdxLayoutAutoCreatedGroup;
    edtNumeroEndereco: TcxTextEdit;
    lciNumeroEndereco: TdxLayoutItem;
    edtComplemento: TcxTextEdit;
    lciComplemento: TdxLayoutItem;
    edtCEP: TcxButtonEdit;
    lciCEP: TdxLayoutItem;
    edtBairro: TcxTextEdit;
    lciBairro: TdxLayoutItem;
    edtCidade: TcxTextEdit;
    lciCidade: TdxLayoutItem;
    lcgEndereco: TdxLayoutAutoCreatedGroup;
    cboUF: TcxComboBox;
    lciUF: TdxLayoutItem;
    tbOcorrencias: TdxMemData;
    tbOcorrenciasNUM_OCORRENCIA: TIntegerField;
    tbOcorrenciasDAT_OCORRENCIA: TDateField;
    tbOcorrenciasCOD_ASSINATURA: TStringField;
    tbOcorrenciasNOM_ASSINANTE: TStringField;
    tbOcorrenciasRES_ROTEIRO: TStringField;
    tbOcorrenciasCOD_ENTREGADOR: TIntegerField;
    tbOcorrenciasCOD_PRODUTO: TStringField;
    tbOcorrenciasCOD_OCORRENCIA: TIntegerField;
    tbOcorrenciasDOM_REINCIDENTE: TStringField;
    tbOcorrenciasDES_DESCRICAO: TMemoField;
    tbOcorrenciasDES_ENDERECO: TStringField;
    tbOcorrenciasDES_RETORNO: TMemoField;
    tbOcorrenciasCOD_RESULTADO: TIntegerField;
    tbOcorrenciasCOD_ORIGEM: TIntegerField;
    tbOcorrenciasDES_OBS: TMemoField;
    tbOcorrenciasCOD_STATUS: TIntegerField;
    tbOcorrenciasDES_APURACAO: TMemoField;
    tbOcorrenciasDOM_PROCESSADO: TStringField;
    tbOcorrenciasQTD_OCORRENCIAS: TIntegerField;
    tbOcorrenciasVAL_OCORRENCIAS: TFloatField;
    tbOcorrenciasDAT_DESCONTO: TDateField;
    tbOcorrenciasDOM_IMPRESSAO: TStringField;
    tbOcorrenciasDES_ANEXO: TStringField;
    tbOcorrenciasDES_LOG: TMemoField;
    dsOcorrencias: TDataSource;
    tvOcorrencias: TcxGridDBTableView;
    lvOcorrencias: TcxGridLevel;
    grdOcorrencias: TcxGrid;
    lciOcorrencias: TdxLayoutItem;
    tvOcorrenciasRecId: TcxGridDBColumn;
    tvOcorrenciasNUM_OCORRENCIA: TcxGridDBColumn;
    tvOcorrenciasDAT_OCORRENCIA: TcxGridDBColumn;
    tvOcorrenciasCOD_ASSINATURA: TcxGridDBColumn;
    tvOcorrenciasNOM_ASSINANTE: TcxGridDBColumn;
    tvOcorrenciasRES_ROTEIRO: TcxGridDBColumn;
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
    tvOcorrenciasVAL_OCORRENCIAS: TcxGridDBColumn;
    tvOcorrenciasDAT_DESCONTO: TcxGridDBColumn;
    tvOcorrenciasDOM_IMPRESSAO: TcxGridDBColumn;
    tvOcorrenciasDES_ANEXO: TcxGridDBColumn;
    tvOcorrenciasDES_LOG: TcxGridDBColumn;
    aclAssinantes: TActionList;
    actIncluir: TAction;
    actExcluir: TAction;
    actLocalizar: TAction;
    actCancelar: TAction;
    actGravar: TAction;
    actFechar: TAction;
    fmCadastro: TdxBarManager;
    fmCadastroBar1: TdxBar;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    dxBarButton6: TdxBarButton;
    actLocalizarSTD: TAction;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton7: TdxBarButton;
    OpenDialog: TOpenDialog;
    ZConn: TZConnection;
    qryAccess: TZReadOnlyQuery;
    edtRoteiro: TcxTextEdit;
    lciRoteiro: TdxLayoutItem;
    edtOrdem: TcxMaskEdit;
    lciOrdem: TdxLayoutItem;
    lcgRoteiro: TdxLayoutAutoCreatedGroup;
    edtReferencia: TcxTextEdit;
    lciReferencia: TdxLayoutItem;
    edtQtde: TcxMaskEdit;
    lciQtde: TdxLayoutItem;
    actBancoSTD: TAction;
    dxBarButton8: TdxBarButton;
    procedure actLocalizarExecute(Sender: TObject);
    procedure actIncluirExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actBancoSTDExecute(Sender: TObject);
    procedure actGravarExecute(Sender: TObject);
    procedure actLocalizarSTDExecute(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtModalidadePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure edtCodigoProdutoPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure edtModalidadePropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure edtCodigoProdutoPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
  private
    { Private declarations }
    procedure ClearForm;
    procedure SetupForm;
    procedure PopulaOcorrencias;
    procedure SearchAssinatura;
    procedure SearchSTD;
    procedure SetupFormSTD;
    procedure ModoForm(bFlag: Boolean);
    procedure SearchBD;
    procedure SetupClass;
    procedure GravaAssinante;
    procedure ExcluirAssinante;
    procedure SearchModalidade;
    procedure SearchProduto;
    procedure PopulaEstados;
    function ContistirDados(): Boolean;
  public
    { Public declarations }
  end;

var
  frmAssinanteJornal: TfrmAssinanteJornal;
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
  estado : TEstados;
  estadoDAO : TEstadosDAO;
  estadoTMP : TEstados;
  estados: TObjectList<TEstados>;
  sBanco: String;
implementation

{$R *.dfm}

uses clUtil, uGlobais, ufrmPesquisarPessoa, udm;

procedure TfrmAssinanteJornal.actBancoSTDExecute(Sender: TObject);
begin

  SearchBD;
end;

procedure TfrmAssinanteJornal.actCancelarExecute(Sender: TObject);
begin

  ClearForm;
  ModoForm(True);
end;

procedure TfrmAssinanteJornal.actExcluirExecute(Sender: TObject);
begin

  ExcluirAssinante;
end;

procedure TfrmAssinanteJornal.actFecharExecute(Sender: TObject);
begin

  Perform(WM_CLOSE, 0, 0);
end;

procedure TfrmAssinanteJornal.actGravarExecute(Sender: TObject);
begin

  GravaAssinante;
end;

procedure TfrmAssinanteJornal.actIncluirExecute(Sender: TObject);
begin

  ClearForm;
  ModoForm(False);
  edtCodigoAssinatura.SetFocus;
end;

procedure TfrmAssinanteJornal.actLocalizarExecute(Sender: TObject);
begin
  SearchAssinatura;
end;

procedure TfrmAssinanteJornal.actLocalizarSTDExecute(Sender: TObject);
begin

  SearchSTD;
end;

procedure TfrmAssinanteJornal.ClearForm;
begin
  edtID.Text := '0';
  edtCodigoAssinatura.Text := '0';
  edtModalidade.Text := '0';
  lblModalidade.Caption := '';
  edtCodigoProduto.Text := '0';
  lblProduto.Caption := '';
  edtQtde.Text := '0';
  edtNome.Text := '0';
  edtCEP.Text := '';
  edtTipoLogradouro.Text := '';
  edtLogradouro.Text := '';
  edtNumeroEndereco.Text := '';
  edtComplemento.Text := '';
  edtBairro.Text := '';
  edtCidade.Text := '';
  cboUF.ItemIndex := -1;
  edtRoteiro.Text := '';
  edtOrdem.Text := '0';
  edtReferencia.Text := '';
  if tbOcorrencias.Active then tbOcorrencias.Close;
end;

procedure TfrmAssinanteJornal.SetupForm;
begin
  produtoDAO := TProdutosDAO.Create();
  modalidadeDAO := TModalidadeDAO.Create();
  edtID.Text := IntToStr(assinanteTMP.ID);
  edtCodigoAssinatura.Text := assinanteTMP.Codigo;
  edtModalidade.Text := IntToStr(assinanteTMP.Modalidade);
  lblModalidade.Caption := modalidadeDAO.FindField('DES_MODALIDADE', assinanteTMP.Modalidade);
  edtCodigoProduto.Text := assinanteTMP.Produto;
  lblProduto.Caption := produtoDAO.FindField('DES_PRODUTO', assinanteTMP.Produto);
  edtQtde.Text := IntToStr(assinanteTMP.Qtde);
  edtNome.Text := assinanteTMP.Nome;
  edtCEP.Text := Copy(assinanteTMP.CEP,1,5) + Copy(assinanteTMP.CEP,6,3);
  edtTipoLogradouro.Text := assinanteTMP.TipoLogradouro;
  edtLogradouro.Text := assinanteTMP.NomeLogradouro;
  edtNumeroEndereco.Text := assinanteTMP.NumeroLogradouro;
  edtComplemento.Text := assinanteTMP.Complemento;
  edtBairro.Text := assinanteTMP.Bairro;
  edtCidade.Text := assinanteTMP.Cidade;
  cboUF.Text := assinanteTMP.Estado;
  edtRoteiro.Text := assinanteTMP.Roteiro;
  edtOrdem.Text := IntToStr(assinanteTMP.Ordem);
  edtReferencia.Text := assinanteTMP.Referencia;
  PopulaOcorrencias;
  produtoDAO.Free;
  modalidadeDAO.Free;
end;

procedure TfrmAssinanteJornal.PopulaOcorrencias;
begin
  ocorrenciaDAO := TOcorrenciasJornalDAO.Create();
  if tbOcorrencias.Active then tbOcorrencias.Close;
  tbOcorrencias.Open;
  try
    ocorrencias := ocorrenciaDAO.FindByAssinatura(edtCodigoAssinatura.Text);
    for ocorrenciaTMP in ocorrencias do
    begin
      tbOcorrencias.Insert;
      tbOcorrenciasNUM_OCORRENCIA.AsInteger := ocorrenciaTMP.Numero;
      tbOcorrenciasDAT_OCORRENCIA.AsDateTime := ocorrenciaTMP.DataOcorrencia;
      tbOcorrenciasCOD_ASSINATURA.AsString := ocorrenciaTMP.CodigoAssinstura;
      tbOcorrenciasNOM_ASSINANTE.AsString := ocorrenciaTMP.Nome;
      tbOcorrenciasRES_ROTEIRO.AsString := ocorrenciaTMP.Roteiro;
      tbOcorrenciasCOD_ENTREGADOR.AsInteger := ocorrenciaTMP.Entregador;
      tbOcorrenciasCOD_PRODUTO.AsString := ocorrenciaTMP.Produto;
      tbOcorrenciasCOD_OCORRENCIA.AsInteger := ocorrenciaTMP.CodigoOcorrencia;
      tbOcorrenciasDOM_REINCIDENTE.AsString := ocorrenciaTMP.Reincidente;
      tbOcorrenciasDES_DESCRICAO.AsString := ocorrenciaTMP.Descricao;
      tbOcorrenciasDES_ENDERECO.AsString := ocorrenciaTMP.Endereco;
      tbOcorrenciasDES_RETORNO.AsString := ocorrenciaTMP.Retorno;
      tbOcorrenciasCOD_RESULTADO.AsInteger := ocorrenciaTMP.Resultado;
      tbOcorrenciasCOD_ORIGEM.AsInteger := ocorrenciaTMP.Origem;
      tbOcorrenciasDES_OBS.AsString := ocorrenciaTMP.Obs;
      tbOcorrenciasCOD_STATUS.AsInteger := ocorrenciaTMP.Status;
      tbOcorrenciasDES_APURACAO.AsString := ocorrenciaTMP.Apuracao;
      tbOcorrenciasDOM_PROCESSADO.AsString := ocorrenciaTMP.Processado;
      tbOcorrenciasQTD_OCORRENCIAS.AsInteger := ocorrenciaTMP.Qtde;
      tbOcorrenciasVAL_OCORRENCIAS.AsFloat := ocorrenciaTMP.Valor;
      tbOcorrenciasDAT_DESCONTO.AsDateTime := ocorrenciaTMP.DataDesconto;
      tbOcorrenciasDOM_IMPRESSAO.AsString := ocorrenciaTMP.Impressao;
      tbOcorrenciasDES_ANEXO.AsString := ocorrenciaTMP.Anexo;
      tbOcorrenciasDES_LOG.AsString := ocorrenciaTMP.Log;
      tbOcorrencias.Post
    end;
  finally
    if not tbOcorrencias.IsEmpty then tbOcorrencias.First;
    ocorrenciaDAO.Free;
  end;
end;

procedure TfrmAssinanteJornal.SearchAssinatura;
var
  x, Y : Integer;
  sCodigo: String;
  sNome: String;
begin
  assinanteDAO := TAssinantesJornalDAO.Create();
  try
    x := 0;
    sCodigo := '';
    sNome := '';
    if not Assigned(frmPesquisarPessoa) then
    begin
      frmPesquisarPessoa := TfrmPesquisarPessoa.Create(Application);
    end;
    frmPesquisarPessoa.Caption := frmPesquisarPessoa.Caption + ' de Assinantes';
    frmPesquisarPessoa.cboCampo.Clear;
    frmPesquisarPessoa.tvPesquisa.ClearItems;
    x := frmPesquisarPessoa.cboCampo.Properties.Items.Add('ID');
    frmPesquisarPessoa.lListaCampos.Add('ID_ASSINANTE');
    x := frmPesquisarPessoa.cboCampo.Properties.Items.Add('Código');
    frmPesquisarPessoa.lListaCampos.Add('COD_ASSINANTE');
    x := frmPesquisarPessoa.cboCampo.Properties.Items.Add('Nome');
    frmPesquisarPessoa.lListaCampos.Add('NOM_ASSINANTE');
    x := frmPesquisarPessoa.cboCampo.Properties.Items.Add('Logradouro');
    frmPesquisarPessoa.lListaCampos.Add('DES_LOGRADOURO');
    x := frmPesquisarPessoa.cboCampo.Properties.Items.Add('Roteiro');
    frmPesquisarPessoa.lListaCampos.Add('DES_ROTEIRO');
    x := frmPesquisarPessoa.cboCampo.Properties.Items.Add('CEP');
    frmPesquisarPessoa.lListaCampos.Add('NUM_CEP');
    frmPesquisarPessoa.cboCampo.ItemIndex := 1;
    frmPesquisarPessoa.sTabela := 'jor_assinantes_jornal';
    if frmPesquisarPessoa.ShowModal = mrOk then
    begin
      ClearForm;
      sCodigo := frmPesquisarPessoa.qryPesquisa.Fields[1].AsString;
      assinantes := assinanteDAO.FindByID(StrToIntDef(sCodigo,0));
      for assinanteTMP in assinantes do
      begin
        ModoForm(False);
        SetupForm;
      end;
    end;
  finally
    assinanteDAO.Free;
    FreeAndNil(frmPesquisarPessoa);
  end;
end;

procedure TfrmAssinanteJornal.ModoForm(bFlag: Boolean);
begin
  edtID.Properties.ReadOnly := bFlag;
  edtCodigoAssinatura.Properties.ReadOnly := bFlag;
  edtModalidade.Properties.ReadOnly := bFlag;
  edtCodigoProduto.Properties.ReadOnly := bFlag;
  edtNome.Properties.ReadOnly := bFlag;
  edtCEP.Properties.ReadOnly := bFlag;
  edtTipoLogradouro.Properties.ReadOnly := bFlag;
  edtLogradouro.Properties.ReadOnly := bFlag;
  edtNumeroEndereco.Properties.ReadOnly := bFlag;
  edtComplemento.Properties.ReadOnly := bFlag;
  edtBairro.Properties.ReadOnly := bFlag;
  edtCidade.Properties.ReadOnly := bFlag;
  cboUF.Properties.ReadOnly := bFlag;
  dsOcorrencias.AutoEdit := not (bFlag);
  actExcluir.Enabled := not (bFlag);
  actCancelar.Enabled := not (bFlag);
  actGravar.Enabled := not (bFlag);
  actLocalizarSTD.Enabled := not(bFlag);
end;

function TfrmAssinanteJornal.ContistirDados(): Boolean;
begin
  Result := False;
  assinanteDAO := TAssinantesJornalDAO.Create();
  if StrToIntDef(edtCodigoAssinatura.Text,0) = 0 then
  begin
    Application.MessageBox('Informe o código da Assinatura!', 'Atenção!', MB_OK + MB_ICONEXCLAMATION);
    edtCodigoAssinatura.SetFocus;
    Exit;
  end;
  if StrToIntDef(edtModalidade.Text,0) = 0 then
  begin
    Application.MessageBox('Informe a Modalidade da Assinatura!', 'Atenção!', MB_OK + MB_ICONEXCLAMATION);
    edtModalidade.SetFocus;
    Exit;
  end;
  if StrToIntDef(edtCodigoProduto.Text,0) = 0 then
  begin
    Application.MessageBox('Informe o produto da Assinatura!', 'Atenção!', MB_OK + MB_ICONEXCLAMATION);
    edtModalidade.SetFocus;
    Exit;
  end;
  if StrToIntDef(edtID.Text,0) = 0 then
  begin
    assinantes := assinanteDAO.FindByAssinatura(edtCodigoAssinatura.Text, StrToInt(edtModalidade.Text), edtCodigoProduto.Text);
    if assinantes.Count > 0 then
    begin
      Application.MessageBox('Assinatura já existe no banco de dados!', 'Atenção!', MB_OK + MB_ICONEXCLAMATION);
      edtModalidade.SetFocus;
      Exit;
    end;
  end;
  assinanteDAO.Free;
  Result := True;
end;

procedure TfrmAssinanteJornal.edtCodigoProdutoPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  SearchProduto;
end;

procedure TfrmAssinanteJornal.edtCodigoProdutoPropertiesValidate(Sender: TObject; var DisplayValue: Variant;
  var ErrorText: TCaption; var Error: Boolean);
begin
  produtoDAO := TProdutosDAO.Create();
  produtos := produtoDAO.FindByCodigo(DisplayValue);
  for produtoTMP in produtos do
  begin
    lblProduto.Caption := produtoTMP.Descricao;
  end;
  produtoDAO.Free;
end;

procedure TfrmAssinanteJornal.edtModalidadePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  SearchModalidade;
end;

procedure TfrmAssinanteJornal.edtModalidadePropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  modalidadeDAO := TModalidadeDAO.Create();
  modalidades := modalidadeDAO.FindByCodigo(DisplayValue);
  for modalidadeTMP in modalidades do
  begin
    lblModalidade.Caption := modalidadeTMP.Descricao;
  end;
  modalidadeDAO.Free;
end;

procedure TfrmAssinanteJornal.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  Action := caFree;
  frmAssinanteJornal := Nil;
end;

procedure TfrmAssinanteJornal.FormShow(Sender: TObject);
begin
  sBanco := '';
  PopulaEstados;
  ClearForm;
  ModoForm(True);
end;

procedure TfrmAssinanteJornal.SearchSTD;
var
  sFile: String;
  sDir: String;
  sDataBase: String;
begin
  if StrToIntDef(edtCodigoAssinatura.Text,0) = 0 then
  begin
    Application.MessageBox('Informe o código da Assinatura!', 'Atenção!', MB_OK + MB_ICONEXCLAMATION);
    edtCodigoAssinatura.SetFocus;
    Exit;
  end;
  if StrToIntDef(edtModalidade.Text,0) = 0 then
  begin
    Application.MessageBox('Informe a Modalidade da Assinatura!', 'Atenção!', MB_OK + MB_ICONEXCLAMATION);
    edtModalidade.SetFocus;
    Exit;
  end;
  if StrToIntDef(edtCodigoProduto.Text,0) = 0 then
  begin
    Application.MessageBox('Informe o produto da Assinatura!', 'Atenção!', MB_OK + MB_ICONEXCLAMATION);
    edtModalidade.SetFocus;
    Exit;
  end;
  if sBanco.IsEmpty then
  begin
    SearchBD;
  end;
  if sBanco.isEmpty then Exit;
  sFile := sBanco;
  sDir := ExtractFilePath(sFile);
  ZConn.HostName := sDir;
  sDatabase := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=#BD#;Persist Security Info=False;Jet OLEDB:Database Password=i8f0';
  sDatabase := TUtil.ReplaceStr(sDatabase, '#BD#', sFile);
  ZConn.Database := sDatabase;
  ZConn.Connect;
  qryAccess.Close;
  qryAccess.SQL.Clear;
  qryAccess.SQL.Text := 'SELECT * FROM Diario_Edicao_Movimentacao WHERE sCdAssinante = :CODIGO ' +
                        'and nCdModalidade = :MODALIDADE and nCdProduto = :PRODUTO';
  qryAccess.ParamByName('CODIGO').AsString := edtCodigoAssinatura.Text;
  qryAccess.ParamByName('MODALIDADE').AsInteger := StrToIntDef(edtModalidade.Text,0);
  qryAccess.ParamByName('PRODUTO').AsInteger := StrToIntDef(edtCodigoProduto.Text,0);
  qryAccess.Open;
  if not qryAccess.IsEmpty then
  begin
    ClearForm;
    SetupFormSTD;
    ModoForm(False);
    edtCodigoAssinatura.SetFocus;
  end
  else
  begin
    Application.MessageBox('Assinatura não encontrada no banco de dados do STD!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
  end;
  qryAccess.Close;
  qryAccess.SQL.Clear;
  ZConn.Disconnect;
end;

procedure TfrmAssinanteJornal.SetupFormSTD;
var
  sCodigo, sProduto: String;
  iModalidade: Integer;
begin
  produtoDAO := TProdutosDAO.Create();
  modalidadeDAO := TModalidadeDAO.Create();
  assinanteDAO := TAssinantesJornalDAO.Create();
  edtID.Text := '0';
  edtCodigoAssinatura.Text := qryAccess.FieldByName('sCdAssinante').AsString;
  sCodigo := qryAccess.FieldByName('sCdAssinante').AsString;
  edtModalidade.Text := qryAccess.FieldByName('nCdModalidade').AsString;
  iModalidade := qryAccess.FieldByName('nCdModalidade').AsInteger;
  lblModalidade.Caption := modalidadeDAO.FindField('DES_MODALIDADE', qryAccess.FieldByName('nCdModalidade').AsInteger);
  edtCodigoProduto.Text := qryAccess.FieldByName('nCdProduto').AsString;
  sProduto := qryAccess.FieldByName('nCdProduto').AsString;
  lblProduto.Caption := produtoDAO.FindField('DES_PRODUTO', qryAccess.FieldByName('nCdProduto').AsString);
  edtQtde.Text := qryAccess.FieldByName('nQuantidade').AsString;
  edtNome.Text := qryAccess.FieldByName('sDscAssinante').AsString;
  edtCEP.Text := qryAccess.FieldByName('sCep05').AsString + qryAccess.FieldByName('sCep03').AsString;
  edtTipoLogradouro.Text := qryAccess.FieldByName('sTipoLogr').AsString;
  edtLogradouro.Text := qryAccess.FieldByName('sLogradouro').AsString;
  edtNumeroEndereco.Text := qryAccess.FieldByName('sNumLogr').AsString;
  edtComplemento.Text := qryAccess.FieldByName('sComplLogr').AsString;
  edtBairro.Text := qryAccess.FieldByName('sBairro').AsString;
  edtCidade.Text := qryAccess.FieldByName('sCidade').AsString;
  cboUF.Text := qryAccess.FieldByName('sUF').AsString;
  edtRoteiro.Text := qryAccess.FieldByName('nCdAgente').AsString;
  edtOrdem.Text := qryAccess.FieldByName('nOrdenacao').AsString;
  edtReferencia.Text := qryAccess.FieldByName('sReferencia').AsString;
  assinantes := assinanteDAO.FindByAssinatura(sCodigo, iModalidade, sProduto);
  for assinanteTMP in assinantes do
  begin
    edtID.Text := IntToStr(assinanteTMP.ID);
  end;
  produtoDAO.Free;
  modalidadeDAO.Free;
  assinanteDAO.Free;
end;

procedure TfrmAssinanteJornal.SearchBD;
begin
  OpenDialog.Title := 'Abrir Banco de dados STD Cliente';
  if OpenDialog.Execute then
  begin
    sBanco := OpenDialog.FileName;
  end;
end;

procedure TfrmAssinanteJornal.GravaAssinante;
begin
  if not ContistirDados() then
  begin
    Exit;
  end;
  if Application.MessageBox('Confirma gravar os dados do Assinante?', 'Gravar', MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  assinante := TAssinaturaJornal.Create();
  assinanteDAO := TAssinantesJornalDAO.Create();
  SetupClass;
  if assinante.ID = 0 then
  begin
    if not assinanteDAO.Insert(assinante) then
    begin
      Application.MessageBox('Erro ao incluir o Assinante!', 'Atenção!', MB_OK + MB_ICONEXCLAMATION);
    end
    else
    begin
      Application.MessageBox('Assinante incluso!', 'Atenção!', MB_OK + MB_ICONINFORMATION);
      ClearForm;
      ModoForm(True);
    end;
  end
  else
  begin
    if not assinanteDAO.Update(assinante) then
    begin
      Application.MessageBox('Erro ao alterar o Assinante!', 'Atenção!', MB_OK + MB_ICONEXCLAMATION);
    end
    else
    begin
      Application.MessageBox('Assinante alterado!', 'Atenção!', MB_OK + MB_ICONINFORMATION);
      ClearForm;
      ModoForm(True);
    end;
  end;
  assinante.Free;
  assinanteDAO.Free;
end;

procedure TfrmAssinanteJornal.SetupClass;
var
  sLog : TStringList;
begin
  assinante.ID := StrToIntDef(edtID.Text, 0);
  assinante.Codigo := edtCodigoAssinatura.Text;
  assinante.Modalidade := StrToIntDef(edtModalidade.Text, 0);
  assinante.Produto := edtCodigoProduto.Text;
  assinante.Qtde := StrToIntDef(edtQtde.Text, 0);
  assinante.Nome := edtNome.Text;
  assinante.CEP := edtCEP.Text;
  assinante.TipoLogradouro := edtTipoLogradouro.Text;
  assinante.NomeLogradouro := edtLogradouro.Text;
  assinante.NumeroLogradouro := edtNumeroEndereco.Text;
  assinante.Complemento := edtComplemento.Text;
  assinante.Bairro := edtBairro.Text;
  assinante.Cidade := edtCidade.Text;
  assinante.Estado := cboUF.Text;
  assinante.Roteiro := edtRoteiro.Text;
  assinante.Ordem := StrToIntDef(edtOrdem.Text, 0);
  assinante.Referencia := edtReferencia.Text;
  sLog := TStringList.Create;
  sLog.Append(assinante.Log);
  sLog.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss',Now) + ' manutenção feita por ' + uGlobais.sUsuario);
  assinante.Log := sLog.Text;
end;

procedure TfrmAssinanteJornal.ExcluirAssinante;
begin
  ocorrenciaDAO := TOcorrenciasJornalDAO.Create();
  assinanteDAO := TAssinantesJornalDAO.Create();
  try
    ocorrencias := ocorrenciaDAO.FindByAssinatura(edtCodigoAssinatura.Text);
    if ocorrencias.Count > 0 then
    begin
      Application.MessageBox('Impossivel excluir Assinatura, existem ocorrências vinculadas e este!', 'Atenção!', MB_OK +
                             MB_ICONEXCLAMATION);
      Exit;
      if Application.MessageBox('Confirma Exluir a Assinatura?', 'Excluir', MB_YESNO + MB_ICONQUESTION) = IDNO then
      begin
        Exit;
      end;
      if not assinanteDAO.Delete(StrToIntDef(edtID.Text, 0)) then
      begin
        Application.MessageBox('Erro ao tentar Excluir Assinatura!', 'Atenção!', MB_OK +
                               MB_ICONEXCLAMATION);
        Exit;
      end;
    end;
  finally
    assinanteDAO.Free;
    ocorrenciaDAO.Free;
  end;
end;

procedure TfrmAssinanteJornal.SearchModalidade;
var
  x, Y : Integer;
  sCodigo: String;
  sDescricao: String;
begin
  modalidadeDAO := TModalidadeDAO.Create();
  try
    x := 0;
    sCodigo := '';
    sDescricao := '';
    if not Assigned(frmPesquisarPessoa) then
    begin
      frmPesquisarPessoa := TfrmPesquisarPessoa.Create(Application);
    end;
    frmPesquisarPessoa.Caption := frmPesquisarPessoa.Caption + ' de Modalidades';
    frmPesquisarPessoa.cboCampo.Clear;
    frmPesquisarPessoa.tvPesquisa.ClearItems;
    x := frmPesquisarPessoa.cboCampo.Properties.Items.Add('Código');
    frmPesquisarPessoa.lListaCampos.Add('COD_MODALIDADE');
    x := frmPesquisarPessoa.cboCampo.Properties.Items.Add('Descrição');
    frmPesquisarPessoa.lListaCampos.Add('DES_MODALIDADE');
    frmPesquisarPessoa.cboCampo.ItemIndex := 1;
    frmPesquisarPessoa.sTabela := 'jor_modalidade_jornal';
    if frmPesquisarPessoa.ShowModal = mrOk then
    begin
      sCodigo := frmPesquisarPessoa.qryPesquisa.Fields[1].AsString;
      modalidades := modalidadeDAO.FindByCodigo(StrToIntDef(sCodigo,0));
      for modalidadeTMP in modalidades do
      begin
        sDescricao := modalidadeTMP.Descricao;
      end;
    end;
    edtModalidade.Text := sCodigo;
    lblModalidade.Caption := sDescricao;
  finally
    modalidadeDAO.Free;
    FreeAndNil(frmPesquisarPessoa);
  end;
end;

procedure TfrmAssinanteJornal.SearchProduto;
var
  x, Y : Integer;
  sCodigo: String;
  sDescricao: String;
begin
  produtoDAO := TProdutosDAO.Create();
  try
    x := 0;
    sCodigo := '';
    sDescricao := '';
    if not Assigned(frmPesquisarPessoa) then
    begin
      frmPesquisarPessoa := TfrmPesquisarPessoa.Create(Application);
    end;
    frmPesquisarPessoa.Caption := frmPesquisarPessoa.Caption + ' de Produtos';
    frmPesquisarPessoa.cboCampo.Clear;
    frmPesquisarPessoa.tvPesquisa.ClearItems;
    x := frmPesquisarPessoa.cboCampo.Properties.Items.Add('Código');
    frmPesquisarPessoa.lListaCampos.Add('COD_PRODUTO');
    x := frmPesquisarPessoa.cboCampo.Properties.Items.Add('Descrição');
    frmPesquisarPessoa.lListaCampos.Add('DES_PRODUTO');
    frmPesquisarPessoa.cboCampo.ItemIndex := 1;
    frmPesquisarPessoa.sTabela := 'jor_produtos WHERE DOM_DIARIO = ' + QuotedStr('S');
    if frmPesquisarPessoa.ShowModal = mrOk then
    begin
      sCodigo := frmPesquisarPessoa.qryPesquisa.Fields[1].AsString;
      produtos := produtoDAO.FindByCodigo(sCodigo);
      for produtoTMP in produtos do
      begin
        sDescricao := produtoTMP.Descricao;
      end;
    end;
    edtCodigoProduto.Text := sCodigo;
    lblProduto.Caption := sDescricao;
  finally
    produtoDAO.Free;
    FreeAndNil(frmPesquisarPessoa);
  end;
end;

procedure TfrmAssinanteJornal.PopulaEstados;
begin
  estadoDAO := TEstadosDAO.Create;
  estados := estadoDAO.FindByUF('');
  cboUF.Clear;
  for estadoTMP in estados do
  begin
    cboUF.Properties.items.Add(estadoTMP.UF);
  end;
  estadoDAO.Free;
end;

end.
