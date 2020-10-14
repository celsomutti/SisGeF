unit ufrmEntregadoresFuncionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxLabel, cxImage, Vcl.ExtCtrls,
  clAgentes, clEstados, dxSkinscxPCPainter,
  cxPCdxBarPopupMenu, cxTextEdit, cxMaskEdit, cxPC, cxDropDownEdit, cxGroupBox,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar,
  cxMemo, cxCalc, cxButtonEdit, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxmdaset,
  Vcl.ActnList, Vcl.Menus, Vcl.StdCtrls, cxButtons, clBancos, clAbastecimentos,
  clEntregador, clExtravios, clLancamentos,
  clOrdemServico, clPlanilhaCredito, clRestricoes, clVeiculos, clVerbaCEP,
  clEntrega, clCentroCusto, dxSkinsdxBarPainter, dxBar,
  cxSpinEdit, dxSkinsdxStatusBarPainter, dxStatusBar, clEnderecoEntregador,
  clContatoEntregador, cxImageComboBox, cxCheckBox,
  cxProgressBar, uthrPopularExtraviosCadastro, clFTPSimples, cxListBox,
  ShellAPI, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdExplicitTLSClientServerBase, IdFTP, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxBarBuiltInMenu,
  System.Actions, clCodigosEntregadores, clAcessos,
  cxGridBandedTableView, cxGridDBBandedTableView, cxVGrid, cxInplaceContainer,
  cxDBVGrid, cxCurrencyEdit, cxGridCardView,
  cxGridDBCardView, cxGridCustomLayoutView, clConexao, frxClass, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, uGlobais, Winapi.ShlObj, cxShellCommon,
  cxListView, cxShellListView, dxDateRanges, cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TfrmEntregadoresFuncionarios = class(TForm)
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxGroupBox1: TcxGroupBox;
    cxLabel3: TcxLabel;
    cxCPF: TcxMaskEdit;
    cxLabel4: TcxLabel;
    cxNome: TcxTextEdit;
    cxLabel6: TcxLabel;
    cxRGIE: TcxTextEdit;
    cxLabel11: TcxLabel;
    cxCNH: TcxTextEdit;
    cxLabel12: TcxLabel;
    cxValidadeCNH: TcxDateEdit;
    cxLabel13: TcxLabel;
    cxCategoria: TcxTextEdit;
    tbContatos: TdxMemData;
    tbContatosSEQ_CONTATO: TIntegerField;
    tbContatosDES_CONTATO: TStringField;
    tbContatosNUM_TELEFONE: TStringField;
    tbContatosDES_EMAIL: TStringField;
    ds: TDataSource;
    aclCadastro: TActionList;
    actCadastroIncluir: TAction;
    actCadastroLocalizar: TAction;
    actCadastroEditar: TAction;
    actCadastroExcluir: TAction;
    actCadastroCancelar: TAction;
    actCadastroSalvar: TAction;
    actCadastroSair: TAction;
    actCadastroExcluirEndereco: TAction;
    tbEnderecos: TdxMemData;
    tbEnderecosDES_TIPO: TStringField;
    tbEnderecosDES_LOGRADOURO: TStringField;
    tbEnderecosNUM_LOGRADOURO: TStringField;
    tbEnderecosDES_COMPLEMENTO: TStringField;
    tbEnderecosDOM_CORRESPONDENCIA: TIntegerField;
    tbEnderecosDES_BAIRRO: TStringField;
    tbEnderecosNOM_CIDADE: TStringField;
    tbEnderecosUF_ESTADO: TStringField;
    tbEnderecosNUM_CEP: TStringField;
    tbEnderecosDES_REFERENCIA: TStringField;
    actCadastroApoio: TAction;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    dxBarButton6: TdxBarButton;
    dxBarButton7: TdxBarButton;
    cxTabSheet2: TcxTabSheet;
    cxGroupBox5: TcxGroupBox;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1SEQ_CONTATO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_CONTATO: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_TELEFONE: TcxGridDBColumn;
    cxGrid1DBTableView1DES_EMAIL: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxLabel16: TcxLabel;
    cxCodigoSistema: TcxTextEdit;
    cxLabel34: TcxLabel;
    cxVinculo: TcxComboBox;
    cxLabel7: TcxLabel;
    cxDataEmissaoRG: TcxDateEdit;
    cxLabel8: TcxLabel;
    cxUFRG: TcxComboBox;
    cxLabel9: TcxLabel;
    cxNaturalidade: TcxTextEdit;
    cxLabel10: TcxLabel;
    cxUFNatural: TcxComboBox;
    cxLabel36: TcxLabel;
    cxDataNascimento: TcxDateEdit;
    cxLabel37: TcxLabel;
    cxRegistroCNH: TcxTextEdit;
    cxLabel38: TcxLabel;
    cxUFCNH: TcxComboBox;
    cxLabel39: TcxLabel;
    cxDataPrimeiraCNH: TcxDateEdit;
    cxLabel40: TcxLabel;
    cxNomePai: TcxTextEdit;
    cxLabel41: TcxLabel;
    cxNomeMae: TcxTextEdit;
    dxBarButton8: TdxBarButton;
    actCadastroAnexar: TAction;
    actCadastroSolicitarGV: TAction;
    dxBarButton9: TdxBarButton;
    actCadastroInformarGV: TAction;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton10: TdxBarButton;
    dxBarButton11: TdxBarButton;
    cxTabSheet3: TcxTabSheet;
    cxGroupBox4: TcxGroupBox;
    cxLabel25: TcxLabel;
    cxFormaPgto: TcxComboBox;
    cxLabel26: TcxLabel;
    cxTipoConta: TcxComboBox;
    cxLabel27: TcxLabel;
    cxBanco: TcxButtonEdit;
    cxNomeBanco: TcxTextEdit;
    cxLabel28: TcxLabel;
    cxAgencia: TcxTextEdit;
    cxLabel29: TcxLabel;
    cxConta: TcxTextEdit;
    cxLabel30: TcxLabel;
    cxFavorecido: TcxTextEdit;
    cxLabel31: TcxLabel;
    cxCPFFavorecido: TcxMaskEdit;
    cxLabel32: TcxLabel;
    cxCentroCusto: TcxButtonEdit;
    cxDescricaoCentroCusto: TcxTextEdit;
    cxGroupBox6: TcxGroupBox;
    cxObservacoes: TcxMemo;
    cxLabel52: TcxLabel;
    cxGroupBox2: TcxGroupBox;
    cxLabel14: TcxLabel;
    cxTipoEndereco: TcxComboBox;
    cxLabel15: TcxLabel;
    cxCEP: TcxMaskEdit;
    cxLabel17: TcxLabel;
    cxLogradouro: TcxTextEdit;
    cxLabel18: TcxLabel;
    cxNumero: TcxTextEdit;
    cxLabel19: TcxLabel;
    cxComplemento: TcxTextEdit;
    cxLabel20: TcxLabel;
    cxBairro: TcxTextEdit;
    cxLabel21: TcxLabel;
    cxCidade: TcxTextEdit;
    cxLabel22: TcxLabel;
    cxUF: TcxComboBox;
    cxLabel23: TcxLabel;
    cxReferencia: TcxTextEdit;
    cxButton7: TcxButton;
    cxGroupBox7: TcxGroupBox;
    cxGroupBox8: TcxGroupBox;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1COD_EXTRAVIO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_EXTRAVIO: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_EXTRAVIO: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_NOSSONUMERO: TcxGridDBColumn;
    cxGrid1DBTableView1DOM_RESTRICAO: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_PRODUTO: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_MULTA: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_VERBA: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_TOTAL: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    dxStatusBar1: TdxStatusBar;
    dxStatusBar1Container0: TdxStatusBarContainerControl;
    cxManutencao: TcxTextEdit;
    cxProgressBar: TcxProgressBar;
    cxLabel53: TcxLabel;
    cxCodigoVeiculo: TcxTextEdit;
    cxLabel54: TcxLabel;
    cxPropriedade: TcxTextEdit;
    cxLabel55: TcxLabel;
    cxMarca: TcxTextEdit;
    cxLabel56: TcxLabel;
    cxModelo: TcxTextEdit;
    cxLabel57: TcxLabel;
    cxLabel58: TcxLabel;
    cxTipo: TcxComboBox;
    cxLabel59: TcxLabel;
    cxAno: TcxTextEdit;
    cxLabel60: TcxLabel;
    cxCor: TcxTextEdit;
    cxLabel61: TcxLabel;
    cxRenavan: TcxTextEdit;
    cxLabel62: TcxLabel;
    cxLicenciamento: TcxComboBox;
    cxRastreamento: TcxCheckBox;
    cxAbastecimento: TcxCheckBox;
    ds1: TDataSource;
    actCadastroVeiculo: TAction;
    cxButton1: TcxButton;
    OpenDialog: TOpenDialog;
    cxTabSheet4: TcxTabSheet;
    cxButton2: TcxButton;
    actCadastroBaixarDocumento: TAction;
    actCadastroExcluirDocumento: TAction;
    SaveDialog1: TSaveDialog;
    actCadastroEditarVeiculo: TAction;
    cxButton5: TcxButton;
    actCadastroExcluirVeiculo: TAction;
    cxButton6: TcxButton;
    cxPlacas: TcxComboBox;
    actCadastroAtualizarDocumentos: TAction;
    tbCodigos: TdxMemData;
    tbCodigosCOD_ENTREGADOR: TIntegerField;
    tbCodigosNOM_FANTASIA: TStringField;
    tbCodigosCOD_AGENTE: TIntegerField;
    tbCodigosDAT_CODIGO: TDateField;
    tbCodigosNOM_EXECUTANTE: TStringField;
    tbCodigosDAT_MANUTENCAO: TDateTimeField;
    cxGroupBox3: TcxGroupBox;
    cxLabel48: TcxLabel;
    cxDataCadastro: TcxDateEdit;
    cxLabel50: TcxLabel;
    cxLabel51: TcxLabel;
    cxVencimentoGV: TcxDateEdit;
    cxStatus: TcxImageComboBox;
    cxLabel24: TcxLabel;
    cxVerba: TcxCalcEdit;
    cxLabel35: TcxLabel;
    cxCombustível: TcxCalcEdit;
    cxTextEdit1: TcxTextEdit;
    ds2: TDataSource;
    actCadastroIncluirCodigo: TAction;
    actCadastroEditarCodigo: TAction;
    actCadastroDesvincularCodigo: TAction;
    cxButton9: TcxButton;
    cxButton10: TcxButton;
    cxButton11: TcxButton;
    tbCodigosCOD_GRUPO: TIntegerField;
    tbCodigosVAL_VERBA: TFloatField;
    tbCodigosNOM_AGENTE: TStringField;
    cxGrid3Level1: TcxGridLevel;
    cxGrid3: TcxGrid;
    cxGrid3DBCardView1: TcxGridDBCardView;
    cxGrid3DBCardView1COD_ENTREGADOR: TcxGridDBCardViewRow;
    cxGrid3DBCardView1NOM_FANTASIA: TcxGridDBCardViewRow;
    cxGrid3DBCardView1COD_AGENTE: TcxGridDBCardViewRow;
    cxGrid3DBCardView1NOM_AGENTE: TcxGridDBCardViewRow;
    cxGrid3DBCardView1COD_GRUPO: TcxGridDBCardViewRow;
    cxGrid3DBCardView1VAL_VERBA: TcxGridDBCardViewRow;
    cxGridDBTableView1NOM_ENTREGADOR: TcxGridDBColumn;
    cxLabel1: TcxLabel;
    cxTabSheet5: TcxTabSheet;
    cxLabel2: TcxLabel;
    cxNomeGuerra: TcxTextEdit;
    cxLabel5: TcxLabel;
    cxRoteiro: TcxTextEdit;
    dxBarButton12: TdxBarButton;
    actCadastroContrato: TAction;
    rptContrato: TfrxReport;
    cxGroupBox9: TcxGroupBox;
    cxLabel33: TcxLabel;
    mskMEI: TcxMaskEdit;
    cxLabel42: TcxLabel;
    txtRazaoMEI: TcxTextEdit;
    cxLabel43: TcxLabel;
    txtFantasiaMEI: TcxTextEdit;
    cxLabel44: TcxLabel;
    mskCNPJMEI: TcxMaskEdit;
    cxLabel45: TcxLabel;
    cxEmissaoCNH: TcxDateEdit;
    cxLabel46: TcxLabel;
    cxOrgaoRG: TcxTextEdit;
    cxLabel47: TcxLabel;
    cxCodigoCNH: TcxTextEdit;
    cxShellListView: TcxShellListView;
    procedure FormShow(Sender: TObject);
    procedure actCadastroIncluirExecute(Sender: TObject);
    procedure actCadastroEditarExecute(Sender: TObject);
    procedure actCadastroCancelarExecute(Sender: TObject);
    procedure cxBancoPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxBancoPropertiesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actCadastroSairExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure actCadastroLocalizarExecute(Sender: TObject);
    procedure actCadastroApoioExecute(Sender: TObject);
    procedure actCadastroExcluirEnderecoExecute(Sender: TObject);
    procedure actCadastroExcluirExecute(Sender: TObject);
    procedure actCadastroSalvarExecute(Sender: TObject);
    procedure cxTipoEnderecoPropertiesChange(Sender: TObject);
    procedure cxCentroCustoPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxCentroCustoPropertiesChange(Sender: TObject);
    procedure cxAgentePropertiesChange(Sender: TObject);
    procedure cxAgentePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxVinculoPropertiesChange(Sender: TObject);
    procedure actCadastroInformarGVExecute(Sender: TObject);
    procedure actCadastroVeiculoExecute(Sender: TObject);
    procedure actCadastroSolicitarGVExecute(Sender: TObject);
    procedure cxCPFExit(Sender: TObject);
    procedure actCadastroAnexarExecute(Sender: TObject);
    procedure actCadastroBaixarDocumentoExecute(Sender: TObject);
    procedure actCadastroExcluirDocumentoExecute(Sender: TObject);
    procedure actCadastroAtualizarDocumentosExecute(Sender: TObject);
    procedure cxTabSheet4Show(Sender: TObject);
    procedure cxPlacasPropertiesChange(Sender: TObject);
    procedure actCadastroEditarVeiculoExecute(Sender: TObject);
    procedure actCadastroExcluirVeiculoExecute(Sender: TObject);
    procedure cxStatusPropertiesChange(Sender: TObject);
    procedure actCadastroIncluirCodigoExecute(Sender: TObject);
    procedure actCadastroEditarCodigoExecute(Sender: TObject);
    procedure actCadastroDesvincularCodigoExecute(Sender: TObject);
    procedure cxNomePropertiesChange(Sender: TObject);
    procedure actCadastroContratoExecute(Sender: TObject);
  private
    { Private declarations }
    procedure Modo;
    procedure PopulaContatos;
    procedure PopulaEnderecos;
    procedure SetupDados;
    procedure SetupEndereco;
    procedure LimpaEndereco;
    procedure ListaBancos;
    procedure ExcluirEndereco;
    procedure Localizar;
    procedure ExcluirEntregador;
    procedure SetupClass;
    procedure SalvaDados;
    procedure SalvaEnderecos;
    procedure SalvaContatos;
    function SalvaTabelaEndereco(): Boolean;
    procedure PopulaEstados;
    procedure ListaCentroCusto;
    procedure ListaAgente;
    function VerificaNivel(): Boolean;
    procedure PopulaVeiculo;
    procedure PopulaExtravios;
    procedure PopulaVeiculosEx;
    Procedure FindReplace(const Enc, subs: String; Var Texto: TcxMemo);
    procedure TrocaCampos;
    procedure ValidaCPFCNPJ;
    procedure ListaDocumentos;
    procedure PopulaGrupos;
    procedure PopulaPlacas;
    procedure PopulaLocais;
    procedure PopulaEntregadores;
    procedure SalvaCodigos;
    procedure ImprimeContrato;
  public
    { Public declarations }
    iCodigo: Integer;
    sCodEntregadores: String;
    PASTA: String;
  end;

var
  frmEntregadoresFuncionarios: TfrmEntregadoresFuncionarios;
  agente: TAgente;
  estado: TEstados;
  banco: TBancos;
  abastecimento: TAbastecimentos;
  entregador: TEntregador;
  extravio: TExtravios;
  lancamento: TLancamentos;
  os: TOrdemServico;
  planilha: TPlanilhaCredito;
  restricao: TRestricoes;
  veiculo: TVeiculos;
  verbacep: TVerbaCEP;
  entrega: TEntrega;
  centrocusto: TCentroCusto;
  enderecos: TEnderecoEntregador;
  contatos: TContatoEntregador;
  thrExtravios: thrPopularExtraviosCadastro;
  ftp: TFTPSimples;
  codigoentregador: TCodigosEntregadores;
  acessos: TAcessos;
  conexao: TConexao;

implementation

{$R *.dfm}

uses
  udm, clUtil, ufrmLocalizar, ufrmListaApoio, ufrmDataGV,
  ufrmVeiculosEx, ufrmEnvioEmail, ufrmEntregadorEx, ufrmImpressao, Global.Parametros;

procedure TfrmEntregadoresFuncionarios.actCadastroAnexarExecute
  (Sender: TObject);
var
  //lArquivo: TStringList;
  sOrigem : String;
  sDestino : String;
  sArquivo: String;
begin
  if OpenDialog.Execute then
  begin
    {Screen.Cursor := crHourGlass;
    ftp.Origem := OpenDialog.FileName;
    ftp.Destino := ;
    ftp.FTPSend(IntToStr(entregador.Cadastro));
    Screen.Cursor := crDefault;}
    {if not DirectoryExists(PASTA + '\' + Trim(cxCodigoSistema.Text)) then
      ForceDirectories(PASTA + '\' + Trim(cxCodigoSistema.Text));
    lArquivo := TStringList.Create();
    sArquivo := ExtractFileName(OpenDialog.FileName);
    lArquivo.LoadFromFile(OpenDialog.FileName);

    lArquivo.SaveToFile(PASTA + '\' + Trim(cxCodigoSistema.Text) + '\' + sArquivo);
    lArquivo.Free;}

    if not DirectoryExists(PASTA + '\' + Trim(cxCodigoSistema.Text)) then
    begin
      if not CreateDir(PASTA + '\' + Trim(cxCodigoSistema.Text)) then
      begin
        Exit;
      end;
    end;

    sArquivo := ExtractFileName(OpenDialog.FileName);
    sOrigem := OpenDialog.FileName;
    sDestino := PASTA + '\' + Trim(cxCodigoSistema.Text) + '\' +sArquivo;

    if CopyFile(PChar(sOrigem), PChar(sDestino), False) then
    begin
      Application.MessageBox(PChar('Arquivo ' + sArquivo + ' copiado com sucesso.'), 'Arquivo Copiado', MB_OK + MB_ICONINFORMATION);
    end
    else
    begin
      Application.MessageBox(PChar('Erro ao copiar o arquivo ' + sArquivo + ' !'), 'Erro ao Copiar', MB_OK + MB_ICONERROR);
    end;
    ListaDocumentos;
  end;
end;

procedure TfrmEntregadoresFuncionarios.actCadastroApoioExecute(Sender: TObject);
begin
  if cxBanco.IsFocused then
  begin
    ListaBancos;
  end
  else if cxCentroCusto.IsFocused then
  begin
    ListaCentroCusto;
  end;
end;

procedure TfrmEntregadoresFuncionarios.actCadastroAtualizarDocumentosExecute
  (Sender: TObject);
begin
  ListaDocumentos;
end;

procedure TfrmEntregadoresFuncionarios.actCadastroBaixarDocumentoExecute
  (Sender: TObject);
var
  sArquivo: String;
begin
  //sArquivo := TUtil.ReplaceStr(PASTA + Trim(cxCodigoSistema.Text) + '\' +  cxDocumentos.Items[cxDocumentos.ItemIndex],
  //  '/', '\');
  {SaveDialog1.FileName := ExtractFileName(sArquivo);
  if SaveDialog1.Execute then}
 // begin
    {Screen.Cursor := crHourGlass;
    ftp.Origem := cxDocumentos.Items[cxDocumentos.ItemIndex];
    ftp.Destino := SaveDialog1.FileName;
    ftp.FTPGet(IntToStr(entregador.Cadastro));
    Screen.Cursor := crDefault;}
  //  ShellExecute(Handle, 'open', pchar(sArquivo), nil, nil, SW_SHOW);
  //end;
end;

procedure TfrmEntregadoresFuncionarios.actCadastroCancelarExecute
  (Sender: TObject);
begin
  if entregador.Operacao = 'I' then
  begin
    actCadastroSairExecute(Sender);
    Exit;
  end;
  if entregador.Operacao = 'U' then
  begin
    Localizar;
    Exit;
  end;
  { entregador.Operacao           :=  'X';
    TUtil.LimparFields(Self);
    if dm.tbExtravios.Active then begin
    dm.tbExtravios.Close;
    end;
    cxGroupBox8.Visible :=  False;
    tbEnderecos.Close;
    tbContatos.Close;
    Modo;
    cxCodigo.Properties.ReadOnly  :=  False; }
end;

procedure TfrmEntregadoresFuncionarios.actCadastroContratoExecute(Sender: TObject);
begin
  ImprimeContrato;
end;

procedure TfrmEntregadoresFuncionarios.actCadastroDesvincularCodigoExecute
  (Sender: TObject);
var
  sMess: String;
begin
  if tbCodigos.IsEmpty then
  begin
    Exit;
  end;
  sMess := 'Confirma desvincular o código de entregador ' +
    tbCodigosCOD_ENTREGADOR.AsString + ' - ' + tbCodigosNOM_FANTASIA.AsString +
    ' desse cadastro ?';
  if Application.MessageBox(pchar(sMess), 'Desvincular Código de Entregador',
    MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  if (not codigoentregador.getObject(tbCodigosCOD_ENTREGADOR.AsString, 'CODIGO'))
  then
  begin
    Application.MessageBox('Erro ao localizar o código do Entregador!', 'Erro',
      MB_OK + MB_ICONERROR);
    Exit;
  end
  else
  begin
    if (not codigoentregador.Desvincular()) then
    begin
      Application.MessageBox
        ('Erro ao tentar desvincular o código do Entregador!', 'Erro',
        MB_OK + MB_ICONERROR);
      Exit;
    end;
  end;
  dm.qryGetObject.Close;
  dm.qryGetObject.SQL.Clear;
  PopulaEntregadores;
end;

procedure TfrmEntregadoresFuncionarios.actCadastroEditarCodigoExecute
  (Sender: TObject);
begin
  if (not tbCodigos.IsEmpty) then
  begin
    if not Assigned(frmEntregadorEx) then
    begin
      frmEntregadorEx := TfrmEntregadorEx.Create(Application);
      PopulaGrupos;
      frmEntregadorEx.sOperacao := 'U';
      frmEntregadorEx.iCadastro := StrToInt(cxCodigoSistema.Text);
      frmEntregadorEx.cxCodigoEntregador.Text :=
        tbCodigosCOD_ENTREGADOR.AsString;
      frmEntregadorEx.cxNomeEntregador.Text := tbCodigosNOM_FANTASIA.AsString;
      frmEntregadorEx.cxCodAdmCEP.Text := tbCodigosCOD_AGENTE.AsString;
      frmEntregadorEx.cxNomeAdmCEP.Text := tbCodigosNOM_AGENTE.Value;
      frmEntregadorEx.cxGrupoVerba.Text := tbCodigosCOD_GRUPO.AsString;
      frmEntregadorEx.cxVerba.EditValue := tbCodigosVAL_VERBA.Value;
      frmEntregadorEx.cxCodigoEntregador.Properties.ReadOnly := True;
    end;
    if frmEntregadorEx.ShowModal = mrCancel then
    begin
      FreeAndNil(frmEntregadorEx);
      Exit;
    end;
    if tbCodigos.Locate('COD_ENTREGADOR',
      StrToInt(frmEntregadorEx.cxCodigoEntregador.Text), []) then
    begin
      tbCodigos.Edit;
      tbCodigosNOM_FANTASIA.Value := frmEntregadorEx.cxNomeEntregador.Text;
      tbCodigosCOD_AGENTE.Value := StrToInt(frmEntregadorEx.cxCodAdmCEP.Text);
      tbCodigosNOM_AGENTE.Value := frmEntregadorEx.cxNomeAdmCEP.Text;
      tbCodigosCOD_GRUPO.Value := StrToInt(frmEntregadorEx.cxGrupoVerba.Text);
      tbCodigosVAL_VERBA.Value := frmEntregadorEx.cxVerba.Value;
      tbCodigosNOM_EXECUTANTE.Value := uGlobais.sUsuario;
      tbCodigosDAT_MANUTENCAO.Value := Now;
      tbCodigos.Post;
    end;
    FreeAndNil(frmEntregadorEx);
  end;
end;

procedure TfrmEntregadoresFuncionarios.actCadastroEditarExecute
  (Sender: TObject);
begin
  if not(VerificaNivel()) then
  begin
    Exit;
  end;
  entregador.Operacao := 'U';
  Modo;
end;

procedure TfrmEntregadoresFuncionarios.actCadastroEditarVeiculoExecute
  (Sender: TObject);
begin
  if TUtil.Empty(cxCodigoVeiculo.Text) then
  begin
    cxCodigoVeiculo.Text := '0';
  end;
  if cxCodigoVeiculo.Text <> '0' then
  begin
    if not Assigned(frmVeiculosEx) then
    begin
      frmVeiculosEx := TfrmVeiculosEx.Create(Application);
      frmVeiculosEx.iVeiculo := StrToInt(cxCodigoVeiculo.Text);
      frmVeiculosEx.iEntregador := entregador.Cadastro;
      frmVeiculosEx.sPlaca := cxPlacas.Text;
      frmVeiculosEx.cxPlaca.Properties.ReadOnly := True;
      frmVeiculosEx.sOperacao := 'U';
    end;
    if frmVeiculosEx.ShowModal = mrCancel then
    begin
      FreeAndNil(frmVeiculosEx);
      Exit;
    end;
    PopulaVeiculo;
    FreeAndNil(frmVeiculosEx);
  end;
end;

procedure TfrmEntregadoresFuncionarios.actCadastroExcluirDocumentoExecute
  (Sender: TObject);
var
  sMess: String;
  sArquivo : String;
  i: Integer;
begin
  sMess := 'Confirma exclusão ?';
  if Application.MessageBox(pchar(sMess), 'Excluir', MB_YESNO + MB_ICONQUESTION)
    = IDNO then
  begin
    Exit;
  end;
  if cxShellListView.SelectedFilePaths.Count > 0 then
  begin
    for i := 0 to cxShellListView.SelectedFilePaths.Count - 1 do
    begin
      sArquivo := cxShellListView.SelectedFilePaths[I];
      DeleteFile(PASTA + '\' + Trim(cxCodigoSistema.Text) + '\' + sArquivo);
    end;
    ListaDocumentos;
  end
  else
  begin
    Application.MessageBox('Selecione um arquivo!', 'Atenção', MB_OK+ MB_ICONWARNING);
  end;
end;

procedure TfrmEntregadoresFuncionarios.actCadastroExcluirEnderecoExecute
  (Sender: TObject);
begin
  ExcluirEndereco;
end;

procedure TfrmEntregadoresFuncionarios.actCadastroExcluirExecute
  (Sender: TObject);
begin
  ExcluirEntregador;
end;

procedure TfrmEntregadoresFuncionarios.actCadastroExcluirVeiculoExecute
  (Sender: TObject);
begin
  if Application.MessageBox('Confirma excluir este veículo?', 'Excluir Veículo',
    MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  if veiculo.getObject(cxCodigoVeiculo.Text, 'CODIGO') then
  begin
    veiculo.entregador := 0;
    if (not veiculo.Update()) then
    begin
      Application.MessageBox('Erro ao excluir o veículo deste entregador!',
        'Erro', MB_OK + MB_ICONERROR);
      dm.qryGetObject.Close;
      dm.qryGetObject.SQL.Clear;
      Exit;
    end;
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
    PopulaPlacas;
    PopulaVeiculo;
  end;
end;

procedure TfrmEntregadoresFuncionarios.actCadastroIncluirCodigoExecute
  (Sender: TObject);
begin
  if not Assigned(frmEntregadorEx) then
  begin
    frmEntregadorEx := TfrmEntregadorEx.Create(Application);
    PopulaGrupos;
    frmEntregadorEx.sOperacao := 'I';
    frmEntregadorEx.iCadastro := entregador.Cadastro;
  end;
  if frmEntregadorEx.ShowModal = mrCancel then
  begin
    FreeAndNil(frmEntregadorEx);
    Exit;
  end;
  if (not tbCodigos.Active) then
  begin
    tbCodigos.Open;
  end;
  tbCodigos.Insert;
  tbCodigosCOD_ENTREGADOR.Value :=
    StrToInt(frmEntregadorEx.cxCodigoEntregador.Text);
  tbCodigosNOM_FANTASIA.Value := frmEntregadorEx.cxNomeEntregador.Text;
  tbCodigosCOD_AGENTE.Value := StrToInt(frmEntregadorEx.cxCodAdmCEP.Text);
  agente.Codigo := frmEntregadorEx.cxCodAdmCEP.Text;
  tbCodigosNOM_AGENTE.Value := agente.getField('NOM_FANTASIA', 'CODIGO');
  tbCodigosDAT_CODIGO.Value := Now;
  tbCodigosCOD_GRUPO.Value := StrToInt(frmEntregadorEx.cxGrupoVerba.Text);
  tbCodigosVAL_VERBA.Value := frmEntregadorEx.cxVerba.Value;
  tbCodigosNOM_EXECUTANTE.Value := uGlobais.sUsuario;
  tbCodigosDAT_MANUTENCAO.Value := Now;
  tbCodigos.Post;
  FreeAndNil(frmEntregadorEx);
end;

procedure TfrmEntregadoresFuncionarios.actCadastroIncluirExecute
  (Sender: TObject);
begin
  entregador.Operacao := 'I';
  TUtil.LimparFields(Self);
  if dm.tbExtravios.Active then
  begin
    dm.tbExtravios.Close;
  end;
  cxGroupBox8.Visible := False;
  tbEnderecos.Close;
  tbContatos.Close;
  tbEnderecos.Open;
  tbContatos.Open;
  Modo;
  cxVinculo.SetFocus;
end;

procedure TfrmEntregadoresFuncionarios.actCadastroInformarGVExecute
  (Sender: TObject);
begin
  if not Assigned(frmDataGV) then
  begin
    frmDataGV := TfrmDataGV.Create(Application);
  end;
  if frmDataGV.ShowModal = mrCancel then
  begin
    FreeAndNil(frmDataGV);
    Exit;
  end;
  if frmDataGV.cxData.Date < entregador.DtCadastro then
  begin
    Application.MessageBox
      ('A Data de Validade GR é menor que a Data do Cadastro!', 'Validade GR',
      MB_OK + MB_ICONEXCLAMATION);
    FreeAndNil(frmDataGV);
    Exit;
  end
  else
  begin
    entregador.GV := 'S';
    entregador.DataGV := frmDataGV.cxData.Date;
    entregador.Status := 1;
    FreeAndNil(frmDataGV);
  end;
  if not(entregador.Update()) then
  begin
    Application.MessageBox('Falha ao tentar salvar a Validade GR!', 'Falha',
      MB_OK + MB_ICONERROR);
  end
  else
  begin
    cxManutencao.Text := 'AGUARDE . . .';
    SetupDados;
    Application.MessageBox('Validade GRregistrada!', 'Validade GR',
      MB_OK + MB_ICONINFORMATION);
  end;
end;

procedure TfrmEntregadoresFuncionarios.actCadastroLocalizarExecute
  (Sender: TObject);
begin
  Localizar;
end;

procedure TfrmEntregadoresFuncionarios.actCadastroSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmEntregadoresFuncionarios.actCadastroSalvarExecute
  (Sender: TObject);
begin
  if not(VerificaNivel()) then
  begin
    Exit;
  end;
  SalvaDados;
end;

procedure TfrmEntregadoresFuncionarios.actCadastroSolicitarGVExecute
  (Sender: TObject);
begin
  if not Assigned(frmEnvioEmail) then
  begin
    frmEnvioEmail := TfrmEnvioEmail.Create(Application);
  end;
  frmEnvioEmail.cxDestintarios.Items.Clear;
  frmEnvioEmail.cxDestintarios.Items.Add('gerenciadorisk@novorioexpress.com');
  frmEnvioEmail.cxAssunto.Text := 'Solicitação de Pesquisa GR para ' +
    entregador.Nome;
  TrocaCampos;
  if frmEnvioEmail.ShowModal = mrCancel then
  begin
    FreeAndNil(frmEnvioEmail);
    Exit;
  end;
  FreeAndNil(frmEnvioEmail);
end;

procedure TfrmEntregadoresFuncionarios.actCadastroVeiculoExecute
  (Sender: TObject);
begin
  if not Assigned(frmVeiculosEx) then
  begin
    frmVeiculosEx := TfrmVeiculosEx.Create(Application);
    frmVeiculosEx.sPlaca := '';
    frmVeiculosEx.sOperacao := 'I';
    frmVeiculosEx.iVeiculo := 0;
    frmVeiculosEx.iEntregador := entregador.Cadastro;
  end;
  if frmVeiculosEx.ShowModal = mrCancel then
  begin
    FreeAndNil(frmVeiculosEx);
    Exit;
  end;
  PopulaPlacas;
  PopulaVeiculo;
  FreeAndNil(frmVeiculosEx);
end;

procedure TfrmEntregadoresFuncionarios.cxAgentePropertiesChange
  (Sender: TObject);
begin
  if Pos(entregador.Operacao, 'IU') = 0 then
  begin
    Exit;
  end;
end;

procedure TfrmEntregadoresFuncionarios.cxAgentePropertiesValidate
  (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  if Pos(entregador.Operacao, 'IU') = 0 then
  begin
    Exit;
  end;
end;

procedure TfrmEntregadoresFuncionarios.cxBancoPropertiesChange(Sender: TObject);
begin
  if Pos(entregador.Operacao, 'IU') = 0 then
  begin
    Exit;
  end;
  cxNomeBanco.Clear;
end;

procedure TfrmEntregadoresFuncionarios.cxBancoPropertiesValidate
  (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  if Pos(entregador.Operacao, 'IU') = 0 then
  begin
    Exit;
  end;
  if TUtil.Empty(cxBanco.Text) then
  begin
    cxBanco.Text := '0';
    Exit;
  end;
  if banco.getObject(cxBanco.Text, 'CODIGO') then
  begin
    cxNomeBanco.Text := banco.Nome;
  end
  else
  begin
    cxNomeBanco.Text := 'BANCO NÃO CADASTRADO';
  end;

end;

procedure TfrmEntregadoresFuncionarios.cxCentroCustoPropertiesChange
  (Sender: TObject);
begin
  if Pos(entregador.Operacao, 'IU') = 0 then
  begin
    Exit;
  end;
  cxDescricaoCentroCusto.Clear;
end;

procedure TfrmEntregadoresFuncionarios.cxCentroCustoPropertiesValidate
  (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  if Pos(entregador.Operacao, 'IU') = 0 then
  begin
    Exit;
  end;
  if TUtil.Empty(cxCentroCusto.Text) then
  begin
    cxCentroCusto.Text := '0';
    Exit;
  end;
  if centrocusto.getObject(cxCentroCusto.Text, 'CODIGO') then
  begin
    cxDescricaoCentroCusto.Text := centrocusto.Descricao;
  end
  else
  begin
    cxDescricaoCentroCusto.Text := 'CENTRO DE CUSTO NÃO CADASTRADO';
  end;
end;

procedure TfrmEntregadoresFuncionarios.cxCPFExit(Sender: TObject);
begin
  ValidaCPFCNPJ;
  if entregador.Operacao = 'I' then
  begin
    if TUtil.Empty(cxCPF.Text) then
    begin
      Exit;
    end;
    entregador.CPF := cxCPF.Text;
    if not(TUtil.Empty(entregador.getField('NOM_FANTASIA', 'CPF'))) then
    begin
      Application.MessageBox('CPF/CNPJ de Entregador já Cadastrado!',
        'Atenção!', MB_OK + MB_ICONEXCLAMATION);
      cxCPF.SetFocus;
      Exit;
    end;
  end;
end;

procedure TfrmEntregadoresFuncionarios.cxNomePropertiesChange(Sender: TObject);
begin
  cxLabel1.Caption := cxNome.Text;
end;

procedure TfrmEntregadoresFuncionarios.cxPlacasPropertiesChange
  (Sender: TObject);
begin
  if cxPlacas.Properties.Items.Count > 0 then
  begin
    PopulaVeiculo;
  end;
end;

procedure TfrmEntregadoresFuncionarios.cxStatusPropertiesChange
  (Sender: TObject);
begin
  if cxStatus.ItemIndex = 5 then
  begin
    cxVencimentoGV.Clear;
  end;
end;

procedure TfrmEntregadoresFuncionarios.cxTabSheet4Show(Sender: TObject);
begin
  ListaDocumentos;
end;

procedure TfrmEntregadoresFuncionarios.cxTipoEnderecoPropertiesChange
  (Sender: TObject);
begin
  if Pos(entregador.Operacao, 'IU') = 0 then
  begin
    Exit;
  end;
  LimpaEndereco;
  SetupEndereco;
end;

procedure TfrmEntregadoresFuncionarios.cxVinculoPropertiesChange
  (Sender: TObject);
begin
  if Copy(cxVinculo.Text, 1, 1) = 'E' then
  begin
    actCadastroIncluir.Enabled := True;
    actCadastroEditarCodigo.Enabled := True;
    actCadastroDesvincularCodigo.Enabled := True;
  end
  else
  begin
    actCadastroIncluir.Enabled := False;
    actCadastroEditarCodigo.Enabled := False;
    actCadastroDesvincularCodigo.Enabled := False;
  end;
  if Pos(Copy(cxVinculo.Text, 1, 1),'12TP') > 0 then
  begin
    cxTabSheet5.TabVisible := True;
  end
  else
  begin
    cxTabSheet5.TabVisible := False;
  end;

end;

procedure TfrmEntregadoresFuncionarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  agente.Free;
  estado.Free;
  banco.Free;
  abastecimento.Free;
  entregador.Free;
  extravio.Free;
  lancamento.Free;
  os.Free;
  planilha.Free;
  restricao.Free;
  veiculo.Free;
  verbacep.Free;
  entrega.Free;
  centrocusto.Free;
  enderecos.Free;
  contatos.Free;
  codigoentregador.Free;
  ftp.Free;
  acessos.Free;
  conexao.Free;
  tbEnderecos.Close;
  tbContatos.Close;
  dm.tbExtravios.Close;
  Action := caFree;
  frmEntregadoresFuncionarios := Nil;
end;

procedure TfrmEntregadoresFuncionarios.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 then
  begin
    if cxGrid1.IsFocused then
    begin
      Exit;
    end;
    if cxObservacoes.IsFocused then
    begin
      Exit;
    end;
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfrmEntregadoresFuncionarios.FormShow(Sender: TObject);
begin
  PASTA := Global.Parametros.pPasta;
  //PASTA :=  '\\192.168.0.2\Arquivos\Docs';
  agente := TAgente.Create;
  estado := TEstados.Create;
  banco := TBancos.Create;
  abastecimento := TAbastecimentos.Create;
  entregador := TEntregador.Create;
  extravio := TExtravios.Create;
  lancamento := TLancamentos.Create;
  os := TOrdemServico.Create;
  planilha := TPlanilhaCredito.Create;
  restricao := TRestricoes.Create;
  veiculo := TVeiculos.Create;
  verbacep := TVerbaCEP.Create;
  entrega := TEntrega.Create;
  centrocusto := TCentroCusto.Create;
  enderecos := TEnderecoEntregador.Create;
  contatos := TContatoEntregador.Create;
  codigoentregador := TCodigosEntregadores.Create;
  acessos := TAcessos.Create;
  ftp := TFTPSimples.Create;
  ftp.Servidor := 'ftp.rjsmart.com.br';
  ftp.Usuario := 'rjsmart';
  ftp.Senha := 'sedneM62';
  ftp.Porta := 21;
  conexao := TConexao.Create;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    actCadastroSairExecute(Sender);
    Exit;
  end;
  PopulaEstados;
  PopulaLocais;
  TUtil.LimparFields(Self);
  if dm.tbExtravios.Active then
  begin
    dm.tbExtravios.Close;
  end;
  if tbContatos.Active then
  begin
    tbContatos.Close;
  end;
  cxGroupBox8.Visible := False;
  if iCodigo = 0 then
  begin
    actCadastroIncluirExecute(Sender);
  end
  else
  begin
    actCadastroLocalizarExecute(Sender);
  end;
  { entregador.Operacao :=  'X';
    Modo; }
end;

procedure TfrmEntregadoresFuncionarios.Modo;
begin
  acessos.SetNivel(aclCadastro);
  if entregador.Operacao = 'I' then
  begin
    cxGroupBox1.Enabled := True;
    cxGroupBox2.Enabled := True;
    cxGroupBox3.Enabled := True;
    cxGroupBox4.Enabled := True;
    cxGroupBox5.Enabled := True;
    cxGroupBox6.Enabled := True;
    actCadastroIncluir.Enabled := False;
    actCadastroLocalizar.Enabled := False;
    actCadastroEditar.Enabled := False;
    actCadastroExcluir.Enabled := False;
    actCadastroCancelar.Enabled := True;
    actCadastroSalvar.Enabled := True;
    actCadastroSair.Enabled := True;
    actCadastroAnexar.Enabled := False;
    actCadastroBaixarDocumento.Enabled := False;
    actCadastroExcluirDocumento.Enabled := False;
    actCadastroExcluirEndereco.Enabled := False;
    actCadastroSolicitarGV.Enabled := False;
    actCadastroInformarGV.Enabled := False;
    actCadastroVeiculo.Enabled := False;
    actCadastroEditarVeiculo.Enabled := False;
    actCadastroExcluirVeiculo.Enabled := False;
    actCadastroIncluirCodigo.Enabled := False;
    actCadastroEditarCodigo.Enabled := False;
    actCadastroDesvincularCodigo.Enabled := False;
    actCadastroContrato.Enabled := False;
    with cxGrid1DBTableView1.OptionsData do
    begin
      Deleting := True;
      Editing := True;
      Inserting := True;
    end;
  end
  else if entregador.Operacao = 'U' then
  begin
    cxGroupBox1.Enabled := True;
    cxGroupBox2.Enabled := True;
    cxGroupBox3.Enabled := True;
    cxGroupBox4.Enabled := True;
    cxGroupBox5.Enabled := True;
    cxGroupBox6.Enabled := True;
    actCadastroIncluir.Enabled := False;
    actCadastroLocalizar.Enabled := False;
    actCadastroEditar.Enabled := False;
    actCadastroExcluir.Enabled := False;
    actCadastroCancelar.Enabled := True;
    actCadastroSalvar.Enabled := True;
    actCadastroSolicitarGV.Enabled := False;
    actCadastroInformarGV.Enabled := False;
    actCadastroSair.Enabled := True;
    actCadastroAnexar.Enabled := False;
    actCadastroBaixarDocumento.Enabled := False;
    actCadastroExcluirDocumento.Enabled := False;
    actCadastroVeiculo.Enabled := True;
    actCadastroEditarVeiculo.Enabled := True;
    actCadastroExcluirVeiculo.Enabled := True;
    actCadastroIncluirCodigo.Enabled := True;
    actCadastroEditarCodigo.Enabled := True;
    actCadastroDesvincularCodigo.Enabled := True;
    actCadastroContrato.Enabled := False;
    if not(tbEnderecos.Active) then
    begin
      actCadastroExcluirEndereco.Enabled := False;
    end
    else
    begin
      if tbEnderecos.IsEmpty then
      begin
        actCadastroExcluirEndereco.Enabled := False;
      end
      else
      begin
        actCadastroExcluirEndereco.Enabled := True;
      end;
    end;
    with cxGrid1DBTableView1.OptionsData do
    begin
      Deleting := True;
      Editing := True;
      Inserting := True;
    end;
  end
  else if entregador.Operacao = 'S' then
  begin
    cxGroupBox1.Enabled := False;
    cxGroupBox2.Enabled := False;
    cxGroupBox3.Enabled := False;
    cxGroupBox4.Enabled := False;
    cxGroupBox5.Enabled := False;
    cxGroupBox6.Enabled := False;
    actCadastroIncluir.Enabled := True;
    actCadastroLocalizar.Enabled := True;
    actCadastroEditar.Enabled := True;
    actCadastroExcluir.Enabled := True;
    actCadastroCancelar.Enabled := True;
    actCadastroSalvar.Enabled := False;
    actCadastroSolicitarGV.Enabled := True;
    actCadastroInformarGV.Enabled := True;
    actCadastroSair.Enabled := True;
    actCadastroAnexar.Enabled := True;
    actCadastroBaixarDocumento.Enabled := True;
    actCadastroExcluirDocumento.Enabled := True;
    actCadastroExcluirEndereco.Enabled := False;
    actCadastroVeiculo.Enabled := True;
    actCadastroEditarVeiculo.Enabled := True;
    actCadastroExcluirVeiculo.Enabled := True;
    actCadastroIncluirCodigo.Enabled := True;
    actCadastroEditarCodigo.Enabled := True;
    actCadastroDesvincularCodigo.Enabled := True;
    actCadastroContrato.Enabled := True;
    with cxGrid1DBTableView1.OptionsData do
    begin
      Deleting := False;
      Editing := False;
      Inserting := False;
    end;
  end
  else if entregador.Operacao = 'X' then
  begin
    cxGroupBox1.Enabled := False;
    cxGroupBox2.Enabled := False;
    cxGroupBox3.Enabled := False;
    cxGroupBox4.Enabled := False;
    cxGroupBox5.Enabled := False;
    cxGroupBox6.Enabled := True;
    actCadastroIncluir.Enabled := True;
    actCadastroLocalizar.Enabled := True;
    actCadastroEditar.Enabled := False;
    actCadastroExcluir.Enabled := False;
    actCadastroCancelar.Enabled := False;
    actCadastroSalvar.Enabled := False;
    actCadastroSolicitarGV.Enabled := False;
    actCadastroInformarGV.Enabled := False;
    actCadastroSair.Enabled := True;
    actCadastroAnexar.Enabled := False;
    actCadastroBaixarDocumento.Enabled := False;
    actCadastroExcluirDocumento.Enabled := False;
    actCadastroExcluirEndereco.Enabled := False;
    actCadastroVeiculo.Enabled := False;
    actCadastroEditarVeiculo.Enabled := False;
    actCadastroExcluirVeiculo.Enabled := False;
    actCadastroIncluirCodigo.Enabled := False;
    actCadastroEditarCodigo.Enabled := False;
    actCadastroDesvincularCodigo.Enabled := False;
    with cxGrid1DBTableView1.OptionsData do
    begin
      Deleting := False;
      Editing := False;
      Inserting := False;
    end;
  end;
end;

procedure TfrmEntregadoresFuncionarios.PopulaContatos;
begin
  tbContatos.Close;
  tbContatos.Open;
  tbContatos.IsLoading := True;
  if contatos.getObject(IntToStr(entregador.Cadastro), 'CODIGO') then
  begin
    while not(dm.qryGetObject.Eof) do
    begin
      tbContatos.Insert;
      tbContatosSEQ_CONTATO.AsInteger := dm.qryGetObject.FieldByName
        ('SEQ_CONTATO').AsInteger;
      tbContatosDES_CONTATO.AsString := dm.qryGetObject.FieldByName
        ('DES_CONTATO').AsString;
      tbContatosNUM_TELEFONE.AsString := dm.qryGetObject.FieldByName
        ('NUM_TELEFONE').AsString;
      tbContatosDES_EMAIL.AsString := dm.qryGetObject.FieldByName
        ('DES_EMAIL').AsString;
      tbContatos.Post;
      dm.qryGetObject.Next;
    end;
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
    if not(tbContatos.IsEmpty) then
    begin
      tbContatos.First;
    end;
    tbContatos.IsLoading := False;
  end;
end;

procedure TfrmEntregadoresFuncionarios.PopulaEnderecos;
begin
  tbEnderecos.Close;
  tbEnderecos.Open;
  tbEnderecos.IsLoading := True;
  if enderecos.getObject(IntToStr(entregador.Cadastro), 'CODIGO') then
  begin
    while not(dm.qryGetObject.Eof) do
    begin
      tbEnderecos.Insert;
      tbEnderecosDES_TIPO.AsString := dm.qryGetObject.FieldByName
        ('DES_TIPO').AsString;
      tbEnderecosDES_LOGRADOURO.AsString := dm.qryGetObject.FieldByName
        ('DES_LOGRADOURO').AsString;
      tbEnderecosNUM_LOGRADOURO.AsString := dm.qryGetObject.FieldByName
        ('NUM_LOGRADOURO').AsString;
      tbEnderecosDES_COMPLEMENTO.AsString := dm.qryGetObject.FieldByName
        ('DES_COMPLEMENTO').AsString;
      tbEnderecosDOM_CORRESPONDENCIA.AsInteger :=
        dm.qryGetObject.FieldByName('DOM_CORRESPONDENCIA').AsInteger;
      tbEnderecosDES_BAIRRO.AsString := dm.qryGetObject.FieldByName
        ('DES_BAIRRO').AsString;
      tbEnderecosNOM_CIDADE.AsString := dm.qryGetObject.FieldByName
        ('NOM_CIDADE').AsString;
      tbEnderecosUF_ESTADO.AsString := dm.qryGetObject.FieldByName
        ('UF_ESTADO').AsString;
      tbEnderecosNUM_CEP.AsString := dm.qryGetObject.FieldByName
        ('NUM_CEP').AsString;
      tbEnderecosDES_REFERENCIA.AsString := dm.qryGetObject.FieldByName
        ('DES_REFERENCIA').AsString;
      tbEnderecos.Post;
      dm.qryGetObject.Next;
    end;
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
    if not(tbEnderecos.IsEmpty) then
    begin
      tbEnderecos.First;
    end;
    tbEnderecos.IsLoading := False;
  end;
end;

procedure TfrmEntregadoresFuncionarios.SetupDados;
begin
  cxCodigoSistema.Text := IntToStr(entregador.Cadastro);
  cxVinculo.ItemIndex := (Pos(entregador.Funcionario, 'EFACHDR12TP') - 1);
  cxCPF.Text := entregador.CPF;
  cxDataNascimento.Date := entregador.DtNascimento;
  cxNome.Text := entregador.Nome;
  cxRGIE.Text := entregador.RG;
  if entregador.DataRG <> 0 then
  begin
    cxDataEmissaoRG.Date := entregador.DataRG;
  end;
  cxUFRG.Text := entregador.UFRG;
  cxOrgaoRG.Text := entregador.OrgaoRG;
  cxNaturalidade.Text := entregador.Naturalidade;
  cxUFNatural.Text := entregador.UFNatural;
  cxCNH.Text := entregador.Cnh;
  cxCodigoCNH.Text := entregador.CodigoCNH;
  if entregador.ValidadeCnh <> 0 then
  begin
    cxValidadeCNH.Date := entregador.ValidadeCnh;
  end;
  if entregador.EmissaoCnh <> 0 then
  begin
    cxEmissaoCNH.Date := entregador.EmissaoCnh;
  end;
  cxUFCNH.Text := entregador.CNHUF;
  cxRegistroCNH.Text := entregador.CNHRegistro;
  cxCategoria.Text := entregador.CategoriaCnh;
  if entregador.DataPrimeiraCNH <> 0 then
  begin
    cxDataPrimeiraCNH.Date := entregador.DataPrimeiraCNH;
  end;
  cxNomePai.Text := entregador.NomePai;
  cxNomeMae.Text := entregador.NomeMae;
  cxObservacoes.Text := entregador.Obs;
  cxDataCadastro.Date := entregador.DtCadastro;
  cxStatus.ItemIndex := entregador.Status;
  if entregador.DataGV <> 0 then
  begin
    cxVencimentoGV.Date := entregador.DataGV;
  end;
  cxVerba.Value := entregador.Verba;
  cxCombustível.Value := entregador.Combustivel;
  cxFormaPgto.Text := entregador.Forma;
  cxTipoConta.Text := entregador.TipoConta;
  cxBanco.Text := entregador.banco;
  if TUtil.Empty(cxBanco.Text) then
  begin
    cxBanco.Text := '0';
  end;
  if banco.getObject(cxBanco.Text, 'CODIGO') then
  begin
    cxNomeBanco.Text := banco.Nome;
  end
  else
  begin
    cxNomeBanco.Text := 'BANCO NÃO CADASTRADO';
  end;
  cxAgencia.Text := entregador.Agencia;
  cxConta.Text := entregador.NumeroConta;
  cxFavorecido.Text := entregador.Favorecido;
  cxCPFFavorecido.Text := entregador.CpfCnpjFavorecido;
  cxCentroCusto.Text := IntToStr(entregador.centrocusto);
  cxNomeGuerra.Text := entregador.Alias;
  cxRoteiro.Text := entregador.Roteiro;
  cxManutencao.Text := 'Última atualização feita por ' + entregador.Executante +
    ' em ' + FormatDateTime('dd/mm/yyyy "as" hh:mm:ss', entregador.Manutencao);
  cxManutencao.Refresh;
  if TUtil.Empty(cxCentroCusto.Text) then
  begin
    cxCentroCusto.Text := '0';
  end;
  if centrocusto.getObject(cxCentroCusto.Text, 'CODIGO') then
  begin
    cxDescricaoCentroCusto.Text := centrocusto.Descricao;
  end
  else
  begin
    cxDescricaoCentroCusto.Text := 'CENTRO DE CUSTO NÃO CADASTRADO';
  end;
  mskMEI.Text := entregador.CodigoMEI;
  txtRazaoMEI.Text := entregador.RazaoMEI;
  txtFantasiaMEI.Text := entregador.FantasiaMEI;
  mskCNPJMEI.Text := entregador.CNPJMEI;
end;

procedure TfrmEntregadoresFuncionarios.SetupEndereco;
var
  sTipo: String;
begin
  sTipo := '';
  if not(tbEnderecos.Active) then
  begin
    Exit;
  end;
  if tbEnderecos.IsEmpty then
  begin
    Exit;
  end;
  if TUtil.Empty(cxTipoEndereco.Text) then
  begin
    Exit;
  end;
  sTipo := cxTipoEndereco.Text;
  LimpaEndereco;
  tbEnderecos.First;
  while not(tbEnderecos.Eof) do
  begin
    if tbEnderecosDES_TIPO.AsString = sTipo then
    begin
      cxCEP.Text := tbEnderecosNUM_CEP.AsString;
      cxLogradouro.Text := tbEnderecosDES_LOGRADOURO.AsString;
      cxNumero.Text := tbEnderecosNUM_LOGRADOURO.AsString;
      cxComplemento.Text := tbEnderecosDES_COMPLEMENTO.AsString;
      cxBairro.Text := tbEnderecosDES_BAIRRO.AsString;
      cxCidade.Text := tbEnderecosNOM_CIDADE.AsString;
      cxUF.Text := tbEnderecosUF_ESTADO.AsString;
      cxReferencia.Text := tbEnderecosDES_REFERENCIA.AsString;
      Break;
    end;
    tbEnderecos.Next;
  end;
  tbEnderecos.First;
end;

procedure TfrmEntregadoresFuncionarios.LimpaEndereco;
begin
  cxCEP.Clear;
  cxLogradouro.Clear;
  cxNumero.Clear;
  cxComplemento.Clear;
  cxBairro.Clear;
  cxCidade.Clear;
  cxUF.Clear;
  cxReferencia.Clear;
end;

procedure TfrmEntregadoresFuncionarios.ListaBancos;
var
  sId: String;
begin
  if Pos(entregador.Operacao, 'IU') = 0 then
  begin
    Exit;
  end;
  sId := '';
  Screen.Cursor := crHourGlass;
  sId := Trim(cxBanco.Text);
  with dm.qryPesquisa do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT COD_BANCO AS "Código", NOM_BANCO AS "Nome" ' +
      'FROM tbbancos ';
    dm.ZConn.PingServer;
    Open;
  end;
  if dm.qryPesquisa.IsEmpty then
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
  frmListaApoio.Caption := 'Bancos';
  Screen.Cursor := crDefault;
  if frmListaApoio.ShowModal = mrOk then
  begin
    cxBanco.Text := dm.qryPesquisa.Fields[0].AsString;
    cxBanco.Refresh;
    cxNomeBanco.Text := dm.qryPesquisa.Fields[1].AsString;
    cxNomeBanco.Refresh;
  end;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  FreeAndNil(frmListaApoio);
end;

procedure TfrmEntregadoresFuncionarios.ExcluirEndereco;
var
  sTipo: String;
begin
  sTipo := '';
  if Pos(entregador.Operacao, 'IU') = 0 then
  begin
    Exit;
  end;
  if not(tbEnderecos.Active) then
  begin
    Exit;
  end;
  if tbEnderecos.IsEmpty then
  begin
    Exit;
  end;
  if TUtil.Empty(cxTipoEndereco.Text) then
  begin
    Exit;
  end;
  sTipo := cxTipoEndereco.Text;
  tbEnderecos.First;
  while not(tbEnderecos.Eof) do
  begin
    if tbEnderecosDES_TIPO.AsString = sTipo then
    begin
      tbEnderecos.Delete;
      LimpaEndereco;
    end;
    if not(tbEnderecos.Eof) then
    begin
      tbEnderecos.Next;
    end;
  end;
  if not(tbEnderecos.IsEmpty) then
  begin
    tbEnderecos.First;
  end;
end;

procedure TfrmEntregadoresFuncionarios.Localizar;
begin
  { with dm.qryPesquisa do begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT COD_ENTREGADOR AS "Entregador", COD_CADASTRO AS "Código", NUM_CNPJ AS "CPF/CNPJ", DES_RAZAO_SOCIAL AS "Nome/Razão Social", ' +
    'NOM_FANTASIA AS "Alias/Nome Fantasia", NUM_IE AS "Nº. RG/Ins. Est.", NUM_IEST AS "Nº. IE/ST", ' +
    'NUM_IM AS "Ins. Mun.", COD_CNAE AS "Nº. CNAE", COD_CRT AS "Nº. CRT", NUM_CNH AS "Nº. CNH" ' +
    'FROM TBENTREGADORES ';
    SQL.Add('');
    end;
    if not Assigned(frmLocalizar) then begin
    frmLocalizar :=  TfrmLocalizar.Create(Application);
    end;
    frmLocalizar.cboCamposDisplay.Clear;
    frmLocalizar.cboCamposSQL.Clear;
    frmLocalizar.cboCamposDisplay.Items.Add('Código Entregador');
    frmLocalizar.cboCamposSQL.Items.Add('COD_ENTREGADOR');
    frmLocalizar.cboCamposDisplay.Items.Add('Código Motorista');
    frmLocalizar.cboCamposSQL.Items.Add('COD_CADASTRO');
    frmLocalizar.cboCamposDisplay.Items.Add('CPF');
    frmLocalizar.cboCamposSQL.Items.Add('NUM_CNPJ');
    frmLocalizar.cboCamposDisplay.Items.Add('Nome/Razão Social');
    frmLocalizar.cboCamposSQL.Items.Add('DES_RAZAO_SOCIAL');
    frmLocalizar.cboCamposDisplay.Items.Add('Alias/Nome Fantasia');
    frmLocalizar.cboCamposSQL.Items.Add('NOM_FANTASIA');
    frmLocalizar.cboCamposDisplay.Items.Add('Nº. RG/Inscrição Estadual');
    frmLocalizar.cboCamposSQL.Items.Add('NUM_IE');
    frmLocalizar.cboCamposDisplay.Items.Add('Nº. Ins. Estadual com Subst. Tributária');
    frmLocalizar.cboCamposSQL.Items.Add('NUM_IEST');
    frmLocalizar.cboCamposDisplay.Items.Add('Inscrição Municipal');
    frmLocalizar.cboCamposSQL.Items.Add('NUM_IM');
    frmLocalizar.cboCamposDisplay.Items.Add('N°. CNAE');
    frmLocalizar.cboCamposSQL.Items.Add('COD_CNAE');
    frmLocalizar.cboCamposDisplay.Items.Add('Nº. CRT');
    frmLocalizar.cboCamposSQL.Items.Add('COD_CRT');
    frmLocalizar.cboCamposDisplay.Items.Add('Nº. CNH');
    frmLocalizar.cboCamposSQL.Items.Add('NUM_CNH');

    frmLocalizar.cboCamposDisplay.ItemIndex := 0;
    frmLocalizar.cboCamposSQL.ItemIndex := 0;

    if frmLocalizar.ShowModal = mrOk then begin
    if entregador.getObject(dm.qryPesquisa.Fields[1].AsString,'CADASTRO') then begin
    TUtil.LimparFields(Self);
    if dm.tbExtravios.Active then begin
    dm.tbExtravios.Close;
    end;
    cxGroupBox8.Visible :=  False;
    SetupDados;
    PopulaContatos;
    PopulaEnderecos;
    PopulaVeiculo;
    if uGlobais.iNivelUsuario = 0 then begin
    cxGroupBox8.Visible :=  True;
    PopulaExtravios;
    end;
    SetupEndereco;
    entregador.Operacao :=  'S';
    Modo;
    end;
    end;
    FreeAndNil(frmLocalizar); }
  if iCodigo <> 0 then
  begin
    if entregador.getObject(IntToStr(iCodigo), 'CADASTRO') then
    begin
      TUtil.LimparFields(Self);
      if dm.tbExtravios.Active then
      begin
        dm.tbExtravios.Close;
      end;
      if tbCodigos.Active then
      begin
        tbCodigos.Close;
      end;
      cxGroupBox8.Visible := False;
      SetupDados;
      PopulaEntregadores;
      PopulaContatos;
      PopulaEnderecos;
      PopulaPlacas;
      PopulaVeiculo;
      if uGlobais.iNivelUsuario = 0 then
      begin
        cxGroupBox8.Visible := True;
        PopulaExtravios;
      end;
      SetupEndereco;
      entregador.Operacao := 'S';
      Modo;
    end;
  end;
end;

procedure TfrmEntregadoresFuncionarios.ExcluirEntregador;
begin
  if entregador.Operacao <> 'S' then
  begin
    Exit;
  end;
  if abastecimento.getObject(IntToStr(entregador.Cadastro), 'CODIGO') then
  begin
    Application.MessageBox
      ('Existem Abastecimentos Registrados para este entregador! Exclusão Cancelada.',
      'Excluir entregador', MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if extravio.getObject(entregador.Codigo, 'ENTREGADOR') then
  begin
    Application.MessageBox
      ('Existem Extravios Registrados para este entregador! Exclusão Cancelada.',
      'Excluir entregador', MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if lancamento.getObject(IntToStr(entregador.Cadastro), 'CADASTRO') then
  begin
    Application.MessageBox
      ('Existem Lançamentos de Débitos/Créditos Registrados para este entregador! Exclusão Cancelada.',
      'Excluir entregador', MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if os.getObject(IntToStr(entregador.Cadastro), 'CADASTRO') then
  begin
    Application.MessageBox
      ('Existem Ordens de Serviço Registradas para este entregador! Exclusão Cancelada.',
      'Excluir entregador', MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if planilha.getObject(IntToStr(entregador.Cadastro), 'CADASTRO') then
  begin
    Application.MessageBox
      ('Existem Créditos Registrados para este entregador! Exclusão Cancelada.',
      'Excluir entregador', MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if restricao.getObject(entregador.Codigo, 'ENTREGADOR') then
  begin
    Application.MessageBox
      ('Existem Restrições Registradas para este entregador! Exclusão Cancelada.',
      'Excluir entregador', MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if veiculo.getObject(IntToStr(entregador.Cadastro), 'CADASTRO') then
  begin
    Application.MessageBox
      ('Existem Veículos Registrados para este entregador! Exclusão Cancelada.',
      'Excluir entregador', MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  entrega.agente := entregador.agente;
  if entrega.getObject(entregador.Codigo, 'ENTREGADOR') then
  begin
    Application.MessageBox
      ('Existem Entregas Registrados para este entregador! Exclusão Cancelada.',
      'Excluir entregador', MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;

  if Application.MessageBox('Confirma a Exclusão deste entregador?',
    'Excluir entregador', MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  contatos.Codigo := entregador.Cadastro;
  enderecos.Codigo := entregador.Cadastro;
  if not(contatos.Delete('CODIGO')) then
  begin
    Application.MessageBox
      ('Erro ao excluir os contatos deste entregador! Exclusão Cancelada.',
      'Excluir entregador', MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if not(enderecos.Delete('CODIGO')) then
  begin
    Application.MessageBox
      ('Erro ao excluir os Endereços deste entregador! Exclusão Cancelada.',
      'Excluir entregador', MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if not(entregador.Delete('CADASTRO')) then
  begin
    Application.MessageBox('Erro ao excluir este entregador!',
      'Excluir entregador', MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  Application.MessageBox('Exclusão concluída!', 'Excluir entregador',
    MB_OK + MB_ICONINFORMATION);
  TUtil.LimparFields(Self);
  if dm.tbExtravios.Active then
  begin
    dm.tbExtravios.Close;
  end;
  cxGroupBox8.Visible := False;
  entregador.Operacao := 'X';
  Modo;
end;

procedure TfrmEntregadoresFuncionarios.SetupClass;
begin
  entregador.Funcionario := Copy(cxVinculo.Text, 1, 1);
  entregador.Codigo := '0';
  entregador.TipoDoc := 'CPF';
  entregador.Nome := cxNome.Text;;
  entregador.Alias := cxNomeGuerra.Text;
  entregador.CPF := cxCPF.Text;
  if not(TUtil.Empty(cxDataNascimento.Text)) then
  begin
    entregador.DtNascimento := cxDataNascimento.Date;
  end
  else
  begin
    entregador.DtNascimento := 0;
  end;
  entregador.RG := cxRGIE.Text;
  entregador.UFRG := cxUFRG.Text;
  entregador.OrgaoRG := cxOrgaoRG.Text;
  if not(TUtil.Empty(cxDataEmissaoRG.Text)) then
  begin
    entregador.DataRG := cxDataEmissaoRG.Date;
  end
  else
  begin
    entregador.DataRG := 0;
  end;
  entregador.UFNatural := cxUFNatural.Text;
  entregador.Naturalidade := cxNaturalidade.Text;
  entregador.NomePai := cxNomePai.Text;
  entregador.NomeMae := cxNomeMae.Text;
  entregador.CodigoCNH := cxCodigoCNH.Text;
  entregador.Cnh := cxCNH.Text;
  entregador.CNHRegistro := cxRegistroCNH.Text;
  entregador.CategoriaCnh := cxCategoria.Text;
  if not(TUtil.Empty(cxValidadeCNH.Text)) then
  begin
    entregador.ValidadeCnh := cxValidadeCNH.Date;
  end
  else
  begin
    entregador.ValidadeCnh := 0;
  end;
  if not(TUtil.Empty(cxEmissaoCNH.Text)) then
  begin
    entregador.EmissaoCnh := cxEmissaoCNH.Date;
  end
  else
  begin
    entregador.EmissaoCnh := 0;
  end;
  entregador.CNHUF := cxUFCNH.Text;
  if not(TUtil.Empty(cxDataPrimeiraCNH.Text)) then
  begin
    entregador.DataPrimeiraCNH := cxDataPrimeiraCNH.Date;
  end
  else
  begin
    entregador.DataPrimeiraCNH := 0;
  end;
  entregador.agente := 0;
  entregador.Status := cxStatus.ItemIndex;
  entregador.Obs := cxObservacoes.Text;
  if entregador.Operacao = 'I' then
  begin
    entregador.DtCadastro := Now;
    entregador.Usuario := StrToInt(uGlobais.idUsuario);
  end;
  entregador.Verba := cxVerba.Value;
  entregador.Combustivel := cxCombustível.Value;
  entregador.TipoConta := cxTipoConta.Text;
  entregador.banco := cxBanco.Text;
  entregador.Agencia := cxAgencia.Text;
  entregador.NumeroConta := cxConta.Text;
  entregador.Favorecido := cxFavorecido.Text;
  entregador.CpfCnpjFavorecido := cxCPFFavorecido.Text;
  entregador.Forma := cxFormaPgto.Text;
  entregador.centrocusto := StrToInt(cxCentroCusto.Text);
  entregador.Roubo := 'N';
  entregador.QtdRoubo := 0;
  entregador.Acidente := 'N';
  entregador.QtdAcidente := 0;
  entregador.Tranporte := 'N';
  entregador.QtdTranporte := 0;
  if (entregador.Status = 1) OR (entregador.Status = 5) then
  begin
    entregador.GV := 'S';
  end
  else
  begin
    entregador.GV := 'N';
  end;
  if entregador.GV = 'S' then
  begin
    entregador.DataGV := cxVencimentoGV.Date;
  end
  else
  begin
    entregador.DataGV := 0;
  end;
  entregador.Executante := uGlobais.sUsuario;
  entregador.Manutencao := Now;
  entregador.Chave := '';
  entregador.Grupo := 0;
  entregador.Roteiro := cxRoteiro.Text;
  entregador.CodigoMEI := mskMEI.Text;
  entregador.RazaoMEI := txtRazaoMEI.Text;
  entregador.FantasiaMEI := txtFantasiaMEI.Text;
  entregador.CNPJMEI := mskCNPJMEI.Text;
end;

procedure TfrmEntregadoresFuncionarios.SalvaDados;
begin
  SetupClass;
  if not(entregador.Validar()) then
  begin
    Exit;
  end;
  if not(SalvaTabelaEndereco()) then
  begin
    Exit;
  end;
  if Application.MessageBox('Confirma Salvar os dados?', 'Salvar Dados',
    MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  if entregador.Operacao = 'I' then
  begin
    if not(entregador.Insert()) then
    begin
      Application.MessageBox('Erro ao incluir o entregador!', 'Salvar Dados',
        MB_OK + MB_ICONERROR);
      Exit;
    end
  end
  else if entregador.Operacao = 'U' then
  begin
    if not(entregador.Update()) then
    begin
      Application.MessageBox('Erro ao alterar o entregador!', 'Salvar Dados',
        MB_OK + MB_ICONERROR);
      Exit;
    end;
    SalvaCodigos;
  end;
  SalvaEnderecos;
  SalvaContatos;
  cxCodigoSistema.Text := IntToStr(entregador.Cadastro);
  Application.MessageBox('Salvar Dados Concluído!', 'Salvar Dados',
    MB_OK + MB_ICONINFORMATION);
  if entregador.Operacao = 'I' then
  begin
    if Application.MessageBox('Deseja incluir outro Registro?', 'Incluir',
      MB_YESNO + MB_ICONQUESTION) = IDNO then
    begin
      entregador.Operacao := 'S';
      Modo;
    end
    else
    begin
      actCadastroIncluirExecute(Self);
    end;
  end
  else
  begin
    entregador.Operacao := 'S';
    Modo;
  end;
end;

procedure TfrmEntregadoresFuncionarios.SalvaEnderecos;
begin
  if not(tbEnderecos.Active) then
  begin
    Exit;
  end;
  enderecos.Codigo := entregador.Cadastro;
  if not(enderecos.Delete('CODIGO')) then
  begin
    Application.MessageBox('Erro ao Atualizar os Endereços o entregador (EX) !',
      'Salvar Dados', MB_OK + MB_ICONERROR);
    Exit;
  end;
  if tbEnderecos.IsEmpty then
  begin
    Exit;
  end;
  tbEnderecos.First;
  while not(tbEnderecos.Eof) do
  begin
    enderecos.Codigo := entregador.Cadastro;
    enderecos.MaxSeq;
    enderecos.Tipo := tbEnderecosDES_TIPO.AsString;
    enderecos.Correspondencia := 0;
    enderecos.Endereco := tbEnderecosDES_LOGRADOURO.AsString;
    enderecos.Numero := tbEnderecosNUM_LOGRADOURO.AsString;
    enderecos.Complemento := tbEnderecosDES_COMPLEMENTO.AsString;
    enderecos.Cep := tbEnderecosNUM_CEP.AsString;
    enderecos.Referencia := tbEnderecosDES_REFERENCIA.AsString;
    enderecos.Bairro := tbEnderecosDES_BAIRRO.AsString;
    enderecos.Cidade := tbEnderecosNOM_CIDADE.AsString;
    enderecos.UF := tbEnderecosUF_ESTADO.AsString;
    if not(enderecos.Insert()) then
    begin
      Application.MessageBox
        ('Erro ao Atualizar os Endereços o entregador (INS) !', 'Salvar Dados',
        MB_OK + MB_ICONERROR);
      Break;
      Exit;
    end;
    tbEnderecos.Next;
  end;
  tbEnderecos.First;
end;

procedure TfrmEntregadoresFuncionarios.SalvaContatos;
begin
  if not(tbContatos.Active) then
  begin
    Exit;
  end;
  if tbContatos.IsEmpty then
  begin
    Exit;
  end;
  contatos.Codigo := entregador.Cadastro;
  if not(contatos.Delete('CODIGO')) then
  begin
    Application.MessageBox('Erro ao Atualizar os Contatos o entregador (EX) !',
      'Salvar Dados', MB_OK + MB_ICONERROR);
    Exit;
  end;
  tbContatos.First;
  while not(tbContatos.Eof) do
  begin
    contatos.Codigo := entregador.Cadastro;
    contatos.MaxSeq;
    contatos.Contato := tbContatosDES_CONTATO.AsString;
    contatos.Telefone := tbContatosNUM_TELEFONE.AsString;
    contatos.EMail := tbContatosDES_EMAIL.AsString;
    if not(contatos.Insert()) then
    begin
      Application.MessageBox
        ('Erro ao Atualizar os Endereços o entregador (INS) !', 'Salvar Dados',
        MB_OK + MB_ICONERROR);
      Break;
      Exit;
    end;
    tbContatos.Next;
  end;
  tbContatos.First;
end;

function TfrmEntregadoresFuncionarios.SalvaTabelaEndereco(): Boolean;
var
  bFlag: Boolean;
begin
  bFlag := False;
  Result := bFlag;
  if TUtil.Empty(cxLogradouro.Text) then
  begin
    Result := True;
    Exit;
  end;
  if TUtil.Empty(cxTipoEndereco.Text) then
  begin
    Application.MessageBox('Informe o Tipo de Endereço!', 'Atenção!',
      MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if not(tbEnderecos.IsEmpty) then
  begin
    tbEnderecos.First;
  end;
  while not(tbEnderecos.Eof) do
  begin
    if tbEnderecosDES_TIPO.AsString = cxTipoEndereco.Text then
    begin
      tbEnderecos.Edit;
      tbEnderecosDES_LOGRADOURO.AsString := cxLogradouro.Text;
      tbEnderecosNUM_LOGRADOURO.AsString := cxNumero.Text;
      tbEnderecosDES_COMPLEMENTO.AsString := cxComplemento.Text;
      tbEnderecosDOM_CORRESPONDENCIA.AsInteger := 0;
      tbEnderecosDES_BAIRRO.AsString := cxBairro.Text;
      tbEnderecosNOM_CIDADE.AsString := cxCidade.Text;
      tbEnderecosUF_ESTADO.AsString := cxUF.Text;
      tbEnderecosNUM_CEP.AsString := cxCEP.Text;
      tbEnderecosDES_REFERENCIA.AsString := cxReferencia.Text;
      tbEnderecos.Post;
      bFlag := True;
    end;
    tbEnderecos.Next;
  end;
  if not(bFlag) then
  begin
    tbEnderecos.Insert;
    tbEnderecosDES_TIPO.AsString := cxTipoEndereco.Text;
    tbEnderecosDES_LOGRADOURO.AsString := cxLogradouro.Text;
    tbEnderecosNUM_LOGRADOURO.AsString := cxNumero.Text;
    tbEnderecosDES_COMPLEMENTO.AsString := cxComplemento.Text;
    tbEnderecosDOM_CORRESPONDENCIA.AsInteger := 0;
    tbEnderecosDES_BAIRRO.AsString := cxBairro.Text;
    tbEnderecosNOM_CIDADE.AsString := cxCidade.Text;
    tbEnderecosUF_ESTADO.AsString := cxUF.Text;
    tbEnderecosNUM_CEP.AsString := cxCEP.Text;
    tbEnderecosDES_REFERENCIA.AsString := cxReferencia.Text;
    tbEnderecos.Post;
    bFlag := True;
  end;
  if not(tbEnderecos.IsEmpty) then
  begin
    tbEnderecos.First;
  end;
  Result := bFlag;
end;

procedure TfrmEntregadoresFuncionarios.PopulaEstados;
begin
  if not(estado.getObjects()) then
  begin
    Exit;
  end;
  cxUF.Properties.Items.Clear;
  cxUFRG.Properties.Items.Clear;
  cxUFNatural.Properties.Items.Clear;
  cxUFCNH.Properties.Items.Clear;
  dm.qryGetObject.First;
  while not(dm.qryGetObject.Eof) do
  begin
    cxUF.Properties.Items.Add(dm.qryGetObject.FieldByName('UF_ESTADO')
      .AsString);
    cxUFRG.Properties.Items.Add(dm.qryGetObject.FieldByName('UF_ESTADO')
      .AsString);
    cxUFNatural.Properties.Items.Add(dm.qryGetObject.FieldByName('UF_ESTADO')
      .AsString);
    cxUFCNH.Properties.Items.Add(dm.qryGetObject.FieldByName('UF_ESTADO')
      .AsString);
    dm.qryGetObject.Next;
  end;
  dm.qryGetObject.Close;
  dm.qryGetObject.SQL.Clear;
end;

procedure TfrmEntregadoresFuncionarios.ListaCentroCusto;
var
  sId: String;
begin
  if Pos(entregador.Operacao, 'IU') = 0 then
  begin
    Exit;
  end;
  sId := '';
  sId := Trim(cxBanco.Text);
  with dm.qryPesquisa do
  begin
    Close;
    SQL.Clear;
    SQL.Text :=
      'SELECT COD_CENTRO_CUSTO AS "Código", DES_CENTRO_CUSTO AS "Descrição" ' +
      'FROM tbcentrocusto ';
    dm.ZConn.PingServer;
    Open;
  end;
  if dm.qryPesquisa.IsEmpty then
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
  frmListaApoio.Caption := 'Centro de custo';
  if frmListaApoio.ShowModal = mrOk then
  begin
    cxCentroCusto.Text := dm.qryPesquisa.Fields[0].AsString;
    cxCentroCusto.Refresh;
    cxDescricaoCentroCusto.Text := dm.qryPesquisa.Fields[1].AsString;
    cxDescricaoCentroCusto.Refresh;
  end;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  FreeAndNil(frmListaApoio);
end;

procedure TfrmEntregadoresFuncionarios.ListaAgente;
var
  sId: String;
begin
  if Pos(entregador.Operacao, 'IU') = 0 then
  begin
    Exit;
  end;
  sId := '';
  Screen.Cursor := crHourGlass;
  sId := '0';
  with dm.qryPesquisa do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT COD_AGENTE AS "Código", NOM_FANTASIA AS "Nome" ' +
      'FROM TBAGENTES ';
    dm.ZConn.PingServer;
    Open;
  end;
  if dm.qryPesquisa.IsEmpty then
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
  frmListaApoio.Caption := 'Agentes';
  Screen.Cursor := crDefault;
  if frmListaApoio.ShowModal = mrOk then
  begin
    // cxAgente.Text     :=  dm.qryPesquisa.Fields[0].AsString;
    // cxAgente.Refresh;
    // cxNomeAgente.Text :=  dm.qryPesquisa.Fields[1].AsString;
    // cxNomeAgente.Refresh;
  end;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  FreeAndNil(frmListaApoio);
end;

function TfrmEntregadoresFuncionarios.VerificaNivel(): Boolean;
var
  sMess: String;
begin
  Result := False;
  sMess := '';
  if uGlobais.iNivelUsuario <> 0 then
  begin
    if entregador.Usuario <> StrToInt(uGlobais.idUsuario) then
    begin
      sMess := 'Este usuário não tem permissão para Editar ou Excluir os dados deste Entregador!';
      Application.MessageBox(pchar(sMess), 'Atenção!', MB_OK + MB_ICONWARNING);
      Exit;
    end
    else if entregador.DtCadastro < Now then
    begin
      sMess := 'Prazo expirado para este usuário Editar os dados deste Entregador!';
      Application.MessageBox(pchar(sMess), 'Atenção!', MB_OK + MB_ICONWARNING);
      Exit;
    end;
  end;
  Result := True;
end;

procedure TfrmEntregadoresFuncionarios.PopulaVeiculo;
begin
  cxPropriedade.Clear;
  cxCodigoVeiculo.Clear;
  cxMarca.Clear;
  cxModelo.Clear;
  cxTipo.Clear;
  cxAno.Clear;
  cxCor.Clear;
  cxRenavan.Clear;
  cxLicenciamento.ItemIndex := -1;
  cxRastreamento.Checked := False;
  cxAbastecimento.Checked := False;
  if cxPlacas.Properties.Items.Count > 0 then
  begin
    if veiculo.getObject(cxPlacas.Properties.Items[cxPlacas.ItemIndex], 'PLACA')
    then
    begin
      if TUtil.Empty(dm.qryGetObject.FieldByName('NOM_PROPRIETARIO').AsString)
      then
      begin
        cxPropriedade.Text := 'NÃO INFORMADO';
      end
      else
      begin
        cxPropriedade.Text := dm.qryGetObject.FieldByName
          ('NOM_PROPRIETARIO').AsString;
      end;
      cxCodigoVeiculo.Text := IntToStr(veiculo.Codigo);
      cxMarca.Text := veiculo.Marca;
      cxModelo.Text := veiculo.Modelo;
      cxTipo.Text := veiculo.Tipo;
      cxAno.Text := veiculo.Ano;
      cxCor.Text := veiculo.Cor;
      cxRenavan.Text := veiculo.Renavan;
      cxLicenciamento.Text := veiculo.Exercicio;
      if veiculo.Rastreado = 'S' then
      begin
        cxRastreamento.Checked := True;
      end
      else
      begin
        cxRastreamento.Checked := False;
      end;
      if veiculo.abastecimento = 'S' then
      begin
        cxAbastecimento.Checked := True;
      end
      else
      begin
        cxAbastecimento.Checked := False;
      end;
      dm.qryGetObject.Close;
      dm.qryGetObject.SQL.Clear;
    end;
  end;
end;

procedure TfrmEntregadoresFuncionarios.PopulaExtravios;
begin
  if tbCodigos.IsEmpty then
  begin
    Exit;
  end;
  tbCodigos.First;
  while (not tbCodigos.Eof) do
  begin
    if TUtil.Empty(sCodEntregadores) then
    begin
      sCodEntregadores := Trim(tbCodigosCOD_ENTREGADOR.AsString);
    end
    else
    begin
      sCodEntregadores := sCodEntregadores + ',' +
        Trim(tbCodigosCOD_ENTREGADOR.AsString);
    end;
    tbCodigos.Next;
  end;
  ds1.Enabled := False;
  thrExtravios := thrPopularExtraviosCadastro.Create(True);
  thrExtravios.FreeOnTerminate := True;
  thrExtravios.Priority := tpNormal;
  thrExtravios.Start;
end;

procedure TfrmEntregadoresFuncionarios.PopulaVeiculosEx;
begin
  frmVeiculosEx.cxCodigo.Text := IntToStr(veiculo.Codigo);
  frmVeiculosEx.cxTipoDocumento.Text := veiculo.TipoDoc;
  frmVeiculosEx.cxCPF.Text := veiculo.CPF;
  frmVeiculosEx.cxNome.Text := veiculo.Nome;
  frmVeiculosEx.cxDataNascimento.Date := veiculo.DtNascimento;
  frmVeiculosEx.cxNomeMae.Text := veiculo.NomeMae;
  frmVeiculosEx.cxRGIE.Text := veiculo.RG;
  frmVeiculosEx.cxDataEmissaoRG.Date := veiculo.DataRG;
  frmVeiculosEx.cxUFRG.Text := veiculo.UFRG;
  frmVeiculosEx.cxLogradouro.Text := veiculo.Endereco;
  frmVeiculosEx.cxCEP.Text := veiculo.Cep;
  frmVeiculosEx.cxBairro.Text := veiculo.Bairro;
  frmVeiculosEx.cxCidade.Text := veiculo.Cidade;
  frmVeiculosEx.cxUF.Text := veiculo.UF;
  frmVeiculosEx.cxModelo.Text := veiculo.Modelo;
  frmVeiculosEx.cxMarca.Text := veiculo.Marca;
  frmVeiculosEx.cxPlaca.Text := veiculo.Placa;
  frmVeiculosEx.cxCidadePlaca.Text := veiculo.CidadePlaca;
  frmVeiculosEx.cxUFPlaca.Text := veiculo.UFPlaca;
  frmVeiculosEx.cxTipo.Text := veiculo.Tipo;
  frmVeiculosEx.cxChassi.Text := veiculo.Chassi;
  frmVeiculosEx.cxAno.Text := veiculo.Ano;
  frmVeiculosEx.cxCor.Text := veiculo.Cor;
  frmVeiculosEx.cxRenavan.Text := veiculo.Renavan;
  frmVeiculosEx.cxLicenciamento.Text := veiculo.Exercicio;
  if veiculo.Rastreado = 'S' then
  begin
    frmVeiculosEx.cxRastreamento.Checked := True;
  end
  else
  begin
    frmVeiculosEx.cxRastreamento.Checked := False;
  end;
  if veiculo.abastecimento = 'S' then
  begin
    frmVeiculosEx.cxAbastecimento.Checked := True;
  end
  else
  begin
    frmVeiculosEx.cxAbastecimento.Checked := False;
  end;
end;

procedure TfrmEntregadoresFuncionarios.TrocaCampos;
var
  sEndereco: String;
  iConta: Integer;
  sEMail: String;
begin

  // dados do motorista

  FindReplace('$NOME$', entregador.Nome, frmEnvioEmail.cxMensagem);
  FindReplace('$GUERRA$', entregador.Alias, frmEnvioEmail.cxMensagem);
  FindReplace('$RG$', entregador.RG, frmEnvioEmail.cxMensagem);
  FindReplace('$UFRG$', entregador.UFRG, frmEnvioEmail.cxMensagem);
  FindReplace('$EMISSAORG$', DateToStr(entregador.DataRG),
    frmEnvioEmail.cxMensagem);
  FindReplace('$UFNAT$', entregador.UFNatural, frmEnvioEmail.cxMensagem);
  FindReplace('$CIDADENAT$', entregador.Naturalidade, frmEnvioEmail.cxMensagem);
  FindReplace('$DATANAS$', DateToStr(entregador.DtNascimento),
    frmEnvioEmail.cxMensagem);
  FindReplace('$CPF$', entregador.CPF, frmEnvioEmail.cxMensagem);
  FindReplace('$CODCNH$', entregador.CodigoCNH, frmEnvioEmail.cxMensagem);
  FindReplace('$SEGCNH$', entregador.Cnh, frmEnvioEmail.cxMensagem);
  FindReplace('$VENCCNH$', DateToStr(entregador.ValidadeCnh), frmEnvioEmail.cxMensagem);
  FindReplace('$UFCNH$', entregador.CNHUF, frmEnvioEmail.cxMensagem);
  FindReplace('$REGCNH$', entregador.CNHRegistro, frmEnvioEmail.cxMensagem);
  FindReplace('$CAT$', entregador.CategoriaCnh, frmEnvioEmail.cxMensagem);
  FindReplace('$1CNH$', DateToStr(entregador.DataPrimeiraCNH), frmEnvioEmail.cxMensagem);
  FindReplace('$EMISSAOCNH$', DateToStr(entregador.EmissaoCNH), frmEnvioEmail.cxMensagem);
  FindReplace('$PAI$', entregador.NomePai, frmEnvioEmail.cxMensagem);
  FindReplace('$MAE$', entregador.NomeMae, frmEnvioEmail.cxMensagem);
  sEndereco := tbEnderecosDES_LOGRADOURO.Text + ', ' +
    tbEnderecosNUM_LOGRADOURO.Text;
  if not(TUtil.Empty(tbEnderecosDES_COMPLEMENTO.Text)) then
  begin
    sEndereco := sEndereco + ' - ' + tbEnderecosDES_COMPLEMENTO.Text;
  end;
  FindReplace('$ENDERECO$', sEndereco, frmEnvioEmail.cxMensagem);
  FindReplace('$CEP$', tbEnderecosNUM_CEP.Text, frmEnvioEmail.cxMensagem);
  FindReplace('$BAIRRO$', tbEnderecosDES_BAIRRO.Text, frmEnvioEmail.cxMensagem);
  FindReplace('$UFEND$', tbEnderecosUF_ESTADO.Text, frmEnvioEmail.cxMensagem);
  FindReplace('$CIDADEEND$', tbEnderecosNOM_CIDADE.Text,
    frmEnvioEmail.cxMensagem);
  iConta := 1;
  sEMail := '';
  if not(tbContatos.IsEmpty) then
  begin
    tbContatos.First;
    while not(tbContatos.Eof) do
    begin
      if not tbContatosDES_EMAIL.Text.IsEmpty then
      begin
        if sEMail.IsEmpty then
        begin
          sEmail := tbContatosDES_EMAIL.Text;
        end;
      end;
      FindReplace('$EMAIL$', sEmail, frmEnvioEmail.cxMensagem);
      if iConta = 1 then
      begin
        FindReplace('$TEL1$', tbContatosNUM_TELEFONE.Text,
          frmEnvioEmail.cxMensagem);
        FindReplace('$CONT1$', tbContatosDES_CONTATO.Text,
          frmEnvioEmail.cxMensagem);
        Inc(iConta);
        tbContatos.Next
      end;
      if not(tbContatos.Eof) then
      begin
        if iConta = 2 then
        begin
          FindReplace('$TEL2$', tbContatosNUM_TELEFONE.Text,
            frmEnvioEmail.cxMensagem);
          FindReplace('$CONT2$', tbContatosDES_CONTATO.Text,
            frmEnvioEmail.cxMensagem);
          Inc(iConta);
          tbContatos.Next
        end;
      end
      else
      begin
        FindReplace('$TEL2$', '', frmEnvioEmail.cxMensagem);
        FindReplace('$CONT2$', '', frmEnvioEmail.cxMensagem);
        FindReplace('$TEL3$', '', frmEnvioEmail.cxMensagem);
        FindReplace('$CONT3$', '', frmEnvioEmail.cxMensagem);
      end;
      if not(tbContatos.Eof) then
      begin
        if iConta = 3 then
        begin
          FindReplace('$TEL3$', tbContatosNUM_TELEFONE.Text,
            frmEnvioEmail.cxMensagem);
          FindReplace('$CONT3$', tbContatosDES_CONTATO.Text,
            frmEnvioEmail.cxMensagem);
          Inc(iConta);
          tbContatos.Next
        end;
      end
      else
      begin
        FindReplace('$TEL3$', '', frmEnvioEmail.cxMensagem);
        FindReplace('$CONT3$', '', frmEnvioEmail.cxMensagem);
      end;
    end;
  end
  else
  begin
    FindReplace('$TEL1$', '', frmEnvioEmail.cxMensagem);
    FindReplace('$CONT1$', '', frmEnvioEmail.cxMensagem);
    FindReplace('$TEL2$', '', frmEnvioEmail.cxMensagem);
    FindReplace('$CONT2$', '', frmEnvioEmail.cxMensagem);
    FindReplace('$TEL3$', '', frmEnvioEmail.cxMensagem);
    FindReplace('$CONT3$', '', frmEnvioEmail.cxMensagem);
  end;

  // dados do proprietário do veículo

  if veiculo.TipoDoc = 'CPF' then
  begin
    FindReplace('$PESSOA$', 'FÍSICA', frmEnvioEmail.cxMensagem);
  end
  else
  begin
    FindReplace('$PESSOA$', 'JURÍDICA', frmEnvioEmail.cxMensagem);
  end;
  FindReplace('$CNPJ$', veiculo.CPF, frmEnvioEmail.cxMensagem);
  FindReplace('$PROP$', veiculo.Nome, frmEnvioEmail.cxMensagem);
  FindReplace('$NASPROP$', DateToStr(veiculo.DtNascimento),
    frmEnvioEmail.cxMensagem);
  FindReplace('$MAEPROP$', veiculo.NomeMae, frmEnvioEmail.cxMensagem);
  FindReplace('$PAIPROP$', veiculo.NomePai, frmEnvioEmail.cxMensagem);
  FindReplace('$RGPROP$', veiculo.RG, frmEnvioEmail.cxMensagem);
  FindReplace('$UFRGPROP$', veiculo.UFRG, frmEnvioEmail.cxMensagem);
  FindReplace('$EMISSAORGPROP$', DateToStr(veiculo.DataRG),
    frmEnvioEmail.cxMensagem);
  FindReplace('$UFPROP$', veiculo.UF, frmEnvioEmail.cxMensagem);
  FindReplace('$CIDADEPROP$', veiculo.Cidade, frmEnvioEmail.cxMensagem);
  FindReplace('$ENDERECOPROP$', veiculo.Endereco, frmEnvioEmail.cxMensagem);
  FindReplace('$CEPPROP$', veiculo.Cep, frmEnvioEmail.cxMensagem);
  FindReplace('$BAIRROPROP$', veiculo.Bairro, frmEnvioEmail.cxMensagem);
  FindReplace('$TEL1PROP$', veiculo.Telefone1, frmEnvioEmail.cxMensagem);
  FindReplace('$CONT1PROP$', veiculo.Descricao1, frmEnvioEmail.cxMensagem);
  FindReplace('$TEL2PROP$', veiculo.Telefone2, frmEnvioEmail.cxMensagem);
  FindReplace('$CONT2PROP$', veiculo.Descricao2, frmEnvioEmail.cxMensagem);

  // dados do veículo

  FindReplace('$PLACA$', veiculo.Placa, frmEnvioEmail.cxMensagem);
  FindReplace('$UFVEICULO$', veiculo.UFPlaca, frmEnvioEmail.cxMensagem);
  FindReplace('$CIDADEVEICULO$', veiculo.CidadePlaca, frmEnvioEmail.cxMensagem);
  FindReplace('$RE$', veiculo.Renavan, frmEnvioEmail.cxMensagem);
  FindReplace('$CHASSI$', veiculo.Chassi, frmEnvioEmail.cxMensagem);
  FindReplace('$COR$', veiculo.Cor, frmEnvioEmail.cxMensagem);
  FindReplace('$MODELO$', veiculo.Modelo, frmEnvioEmail.cxMensagem);
  FindReplace('$MARCA$', veiculo.Marca, frmEnvioEmail.cxMensagem);
  FindReplace('$ANO$', veiculo.Ano, frmEnvioEmail.cxMensagem);
  FindReplace('$TIPO$', veiculo.Tipo, frmEnvioEmail.cxMensagem);

  // dados complementares do motorista

  FindReplace('$OBS$', entregador.Obs, frmEnvioEmail.cxMensagem);

  FindReplace('$J1$', entregador.Roubo, frmEnvioEmail.cxMensagem);
  FindReplace('$Q1$', IntToStr(entregador.QtdRoubo), frmEnvioEmail.cxMensagem);
  FindReplace('$J2$', entregador.Acidente, frmEnvioEmail.cxMensagem);
  FindReplace('$Q2$', IntToStr(entregador.QtdAcidente),
    frmEnvioEmail.cxMensagem);
  FindReplace('$J3$', entregador.Tranporte, frmEnvioEmail.cxMensagem);
  FindReplace('$Q3$', IntToStr(entregador.QtdTranporte),
    frmEnvioEmail.cxMensagem);
  FindReplace('$USER$', uGlobais.sNomeUsuario + ' em ' + DateTimeToStr(Now),
    frmEnvioEmail.cxMensagem);
end;

Procedure TfrmEntregadoresFuncionarios.FindReplace(const Enc, subs: String;
  Var Texto: TcxMemo);
Var
  i, Posicao: Integer;
  Linha: string;
Begin
  For i := 0 to Texto.Lines.Count - 1 do
  begin
    Linha := Texto.Lines[i];
    Repeat
      Posicao := Pos(Enc, Linha);
      If Posicao > 0 then
      Begin
        Delete(Linha, Posicao, Length(Enc));
        Insert(subs, Linha, Posicao);
        Texto.Lines[i] := Linha;
      end;
    until Posicao = 0;
  end;
end;

procedure TfrmEntregadoresFuncionarios.ValidaCPFCNPJ;
begin
  if not(TUtil.Empty(cxCPF.Text)) then
  begin
    if not(TUtil.CPF(cxCPF.Text)) then
    begin
      Application.MessageBox('CPF INVÁLIDO!', 'Atenção!',
        MB_OK + MB_ICONWARNING);
      cxCPF.SetFocus;
      Exit;
    end;
    cxCPF.Text := TUtil.FormataCPF(cxCPF.Text);
  end;
end;

procedure TfrmEntregadoresFuncionarios.ListaDocumentos;
var
  lLista: TStrings;
  i: Integer;
  bExiste: Boolean;
  sDir: String;
  SR: TSearchRec;
  sPasta: String;
begin
  sDir := IntToStr(entregador.Cadastro);
  {cxDocumentos.Items.Clear;
  cxDocumentos.Items.Add('Aguarde ...');
  cxDocumentos.Refresh;
  sDir := IntToStr(entregador.Cadastro);
  lLista := TStringList.Create();
  i := findFirst(PASTA + sDir + '\*.*', faAnyFile, SR);
  while i > 0 do
  begin
    if (SR.Name <> '.') and (SR.Name <> '..') then
    begin
      lLista.Add(SR.Name);
    end;
    i := FindNext(SR);
  end;  }
{  bExiste := False;
  lLista := ftp.FTPList(IntToStr(entregador.Cadastro));
  cxDocumentos.Items.Clear;
  if lLista.Count > 0 then
  begin
    for i := 0 to lLista.Count - 1 do
    begin
      cxDocumentos.Items.Add(lLista[i]);
    end;
    lLista.Free;
  end; }
  {cxDocumentos.Clear;
  for i := 0 to lLista.Count - 1 do
  begin
    cxDocumentos.Items.Add(lLista[i]);
  end;}

  sPasta := PASTA + '\' + sDir;

  if not DirectoryExists(sPasta) then
  begin
    if not CreateDir(sPasta) then
    begin
      Exit;
    end;
  end;


  cxShellListView.Root.CustomPath := sPasta;
  cxShellListView.Refresh;

end;

procedure TfrmEntregadoresFuncionarios.PopulaPlacas;
begin
  if veiculo.getObject(IntToStr(entregador.Cadastro), 'ENTREGADOR') then
  begin
    cxPlacas.Properties.Items.Clear;
    while (not dm.qryGetObject.Eof) do
    begin
      cxPlacas.Properties.Items.Add(dm.qryGetObject.FieldByName('DES_PLACA')
        .AsString);
      dm.qryGetObject.Next;
    end;
    if cxPlacas.Properties.Items.Count > 0 then
    begin
      cxPlacas.ItemIndex := 0;
    end;
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
  end;
end;

procedure TfrmEntregadoresFuncionarios.PopulaLocais;
var
  sLocais: TStringList;
begin
  sLocais := TStringList.Create;
  sLocais := Endereco.PopulaLocal('BAIRRO');
  cxBairro.Properties.LookupItems.Clear;
  cxBairro.Properties.LookupItems.AddStrings(sLocais);
  sLocais.Clear;
  sLocais := Endereco.PopulaLocal('CIDADE');
  cxCidade.Properties.LookupItems.Clear;
  cxCidade.Properties.LookupItems.AddStrings(sLocais);
  sLocais.Clear;
  sLocais := entregador.PopulaLocal('NATURAL');
  cxNaturalidade.Properties.LookupItems.Clear;
  cxNaturalidade.Properties.LookupItems.AddStrings(sLocais);
  sLocais.Clear;
end;

procedure TfrmEntregadoresFuncionarios.PopulaEntregadores;
begin
  tbCodigos.Close;
  tbCodigos.Open;
  tbCodigos.IsLoading := True;
  if codigoentregador.getObject(IntToStr(entregador.Cadastro), 'CADASTRO') then
  begin
    while (not dm.qryGetObject.Eof) do
    begin
      tbCodigos.Insert;
      tbCodigosCOD_ENTREGADOR.Value := dm.qryGetObject.FieldByName
        ('COD_ENTREGADOR').AsInteger;
      tbCodigosNOM_FANTASIA.Value := dm.qryGetObject.FieldByName
        ('NOM_FANTASIA').AsString;
      tbCodigosCOD_AGENTE.Value := dm.qryGetObject.FieldByName('COD_AGENTE')
        .AsInteger;
      agente.Codigo := dm.qryGetObject.FieldByName('COD_AGENTE').AsString;
      tbCodigosNOM_AGENTE.Value := agente.getField('NOM_FANTASIA', 'CODIGO');
      tbCodigosDAT_CODIGO.Value := dm.qryGetObject.FieldByName('DAT_CODIGO')
        .AsDateTime;
      tbCodigosCOD_GRUPO.Value := dm.qryGetObject.FieldByName('COD_GRUPO')
        .AsInteger;
      tbCodigosVAL_VERBA.Value := dm.qryGetObject.FieldByName
        ('VAL_VERBA').AsFloat;
      tbCodigosNOM_EXECUTANTE.Value := dm.qryGetObject.FieldByName
        ('NOM_EXECUTANTE').AsString;
      tbCodigosDAT_MANUTENCAO.Value := dm.qryGetObject.FieldByName
        ('DAT_MANUTENCAO').AsDateTime;
      tbCodigos.Post;
      dm.qryGetObject.Next;
    end;
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
    if not(tbCodigos.IsEmpty) then
    begin
      tbCodigos.First;
    end;
    tbCodigos.IsLoading := False;
  end;
end;

procedure TfrmEntregadoresFuncionarios.SalvaCodigos;
var
  sChave: String;
begin
  if not(tbCodigos.Active) then
  begin
    Exit;
  end;
  codigoentregador.Cadastro := entregador.Cadastro;
  if not(codigoentregador.Delete('CADASTRO')) then
  begin
    Application.MessageBox('Erro ao Atualizar os Códigos dos Entregadores!',
      'Salvar Dados', MB_OK + MB_ICONERROR);
    Exit;
  end;
  if tbCodigos.IsEmpty then
  begin
    Exit;
  end;
  tbCodigos.First;
  sChave := entregador.CPF;
  sChave := TUtil.ReplaceStr(sChave, '.', '');
  sChave := TUtil.ReplaceStr(sChave, '-', '');
  sChave := TUtil.ReplaceStr(sChave, '/', '');
  while not(tbCodigos.Eof) do
  begin
    codigoentregador.Cadastro := entregador.Cadastro;
    codigoentregador.Codigo := tbCodigosCOD_ENTREGADOR.AsInteger;
    codigoentregador.Nome := tbCodigosNOM_FANTASIA.AsString;
    codigoentregador.agente := tbCodigosCOD_AGENTE.AsInteger;
    codigoentregador.Data := tbCodigosDAT_CODIGO.AsDateTime;
    codigoentregador.Chave := FormatFloat('0',StrToFloatDef(sChave, 0));
    codigoentregador.Grupo := tbCodigosCOD_GRUPO.Value;
    codigoentregador.Verba := tbCodigosVAL_VERBA.Value;
    codigoentregador.Executor := uGlobais.sUsuario;
    codigoentregador.Manutencao := Now;
    if not(codigoentregador.Insert()) then
    begin
      Application.MessageBox('Erro ao Atualizar os Códigos dos Entregadores!',
        'Salvar Dados', MB_OK + MB_ICONERROR);
      Break;
      Exit;
    end;
    tbCodigos.Next;
  end;
  tbCodigos.First;
end;

procedure TfrmEntregadoresFuncionarios.PopulaGrupos;
begin
  frmEntregadorEx.cxGrupoVerba.Properties.Items.Clear;
  with dm.qryPesquisa do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT DISTINCT(COD_GRUPO) AS GRUPO FROM tbgruposverba';
    dm.ZConn.PingServer;
    Open;
    if not(Eof) then
    begin
      First;
    end;
    frmEntregadorEx.cxGrupoVerba.Properties.Items.Add('0');
    while not(Eof) do
    begin
      frmEntregadorEx.cxGrupoVerba.Properties.Items.Add
        (dm.qryPesquisa.FieldByName('GRUPO').AsString);
      Next;
    end;
    Close;
    SQL.Clear;
  end;
end;

procedure TfrmEntregadoresFuncionarios.ImprimeContrato;
var
  sEndereco: String;
  sDataExtenso: String;
  sData: String;
  dtData: TDate;
begin
  begin
    sEndereco := '';
    sData:= InputBox('Informe a Data','Data da Vigência:', '');
    dtData := StrToDateDef(sData,0);
    sDataExtenso := FormatDateTime('dd "de" mmmm "de" yyyy', dtData);
    with dm.frxReport do begin
      if not Assigned(frmImpressao) then begin
        frmImpressao := TfrmImpressao.Create(Application);
      end;
      frmImpressao.cxLabel1.Caption := 'CONTRATO DE PRESTAÇÃO DE SERVIÇO';
      frmImpressao.cxArquivo.Text := ExtractFilePath(Application.ExeName) + 'Reports\frxContratoServico.fr3';
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
      sEndereco := cxLogradouro.Text + ', ' + cxNumero.Text;
      if not TUtil.Empty(cxComplemento.Text) then
      begin
        sEndereco := sEndereco + ', ' + cxComplemento.Text;
      end;
      sEndereco := sEndereco + ', ' + cxBairro.Text;
      sEndereco := sEndereco + ', ' + cxCidade.Text + '/' + cxUF.Text;
      LoadFromFile(frmImpressao.cxArquivo.Text);
      Variables.Items[Variables.IndexOf('parNome')].Value :=  QuotedStr(cxNome.Text);
      Variables.Items[Variables.IndexOf('parNacionalidade')].Value :=  QuotedStr('brasileira');
      Variables.Items[Variables.IndexOf('parEstadoCivil')].Value :=  QuotedStr('casado');
      Variables.Items[Variables.IndexOf('parProfissao')].Value :=  QuotedStr('entregador');
      Variables.Items[Variables.IndexOf('parIdentidade')].Value :=  QuotedStr(cxRGIE.Text);
      Variables.Items[Variables.IndexOf('parCPF')].Value :=  QuotedStr(cxCPF.Text);
      Variables.Items[Variables.IndexOf('parEndereco')].Value :=  QuotedStr(sEndereco);
      Variables.Items[Variables.IndexOf('parRazaoSocial')].Value :=  QuotedStr(txtRazaoMEI.Text);
      Variables.Items[Variables.IndexOf('parCNPJ')].Value :=  QuotedStr(mskCNPJMEI.Text);
      Variables.Items[Variables.IndexOf('parRG')].Value :=  QuotedStr(cxRGIE.Text);
      Variables.Items[Variables.IndexOf('parVigencia')].Value :=  QuotedStr(FormatDateTime('dd/mm/yyyy', dtData));
      Variables.Items[Variables.IndexOf('parData')].Value :=  QuotedStr(sDataExtenso);
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
end;

end.
