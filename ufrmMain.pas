unit ufrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxRibbonSkins, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinsdxRibbonPainter, dxRibbonCustomizationForm, dxStatusBar, dxRibbonStatusBar,
  cxClasses, dxRibbon, dxSkinscxPCPainter, dxLayoutContainer, dxLayoutControl, dxSkinsdxBarPainter, System.Actions, Vcl.ActnList,
  dxBar, Vcl.ImgList, cxPC, dxBarBuiltInMenu, dxTabbedMDI, Vcl.ExtCtrls, cxContainer, cxEdit, cxTextEdit, cxMemo,
  dxBarApplicationMenu, ufrmImportacaoTiragemJornal, DAO.Acessos, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, System.ImageList;

type
  TfrmMain = class(TForm)
    bmMain: TdxBarManager;
    actPrincipal: TActionList;
    actCadastroAgentes: TAction;
    actCadastroEntregadores: TAction;
    actCadastroClientes: TAction;
    actCadastroProdutos: TAction;
    actCadastroServicos: TAction;
    actCadastroVeiculos: TAction;
    actCadastroVerbasExpressas: TAction;
    actCadastroVerbaTiragem: TAction;
    actImportarEntregas: TAction;
    actImportarBaixas: TAction;
    actImportarAbastecimentos: TAction;
    actImportarFinanceiro: TAction;
    actImportarTiragem: TAction;
    actCadastroVerbaCEP: TAction;
    actArquivoArquivar: TAction;
    actArquivoSair: TAction;
    actExpressasEntregas: TAction;
    actExpressasExtravios: TAction;
    actExpressasResumoEntregas: TAction;
    actOperacaoMalote: TAction;
    actOperacaoOrdemServico: TAction;
    actOperacaoAbastecimentos: TAction;
    actOperacaoControleKM: TAction;
    actFinanceiroLancamentos: TAction;
    actFinanceiroRestricoes: TAction;
    actFinanceiroFechamentoExpressas: TAction;
    actFinanceiroFechamentoTiragens: TAction;
    actFinanceiroExtratoAgentes: TAction;
    actFinanceiroExtratoFranquia: TAction;
    actSistemaParametros: TAction;
    actSistemaConfiguracaoImpressora: TAction;
    actSegurancaUsuario: TAction;
    actSistemaSenha: TAction;
    actSistemaTrocaUsuario: TAction;
    actSistemaHistorico: TAction;
    actSistemaMensagem: TAction;
    actOperacaoPrazoEntrega: TAction;
    actFinanceirroPlanilhaCrerdito: TAction;
    actOperacaoAcompanhamento: TAction;
    actFinanceiroContasReceber: TAction;
    actCadastroCentroCusto: TAction;
    actExpressasAtribuicoes: TAction;
    actExpressasRecepcaoHermes: TAction;
    actExpressasRetornoBaixa: TAction;
    actCadastroGruposVerbas: TAction;
    actSegurancaGruposUsuarios: TAction;
    actOperacaoExpectativas: TAction;
    actOperacaoDevolucaoBase: TAction;
    actOperacaoRetirada: TAction;
    actOperacaoReceberContainer: TAction;
    actCadastroLacres: TAction;
    actExpressasAcareacoes: TAction;
    actJornalAgentes: TAction;
    actJornalProdutos: TAction;
    actJornalAssinante: TAction;
    actJornalImportarEtiquetas: TAction;
    actJornalEtiquetas: TAction;
    actJornalAtribuicoes: TAction;
    actArquivoEmpresas: TAction;
    actJornalBaixaProtocolo: TAction;
    actCadastroCadastro: TAction;
    actSistemaAmbiente: TAction;
    actJornalAssinaturas: TAction;
    actJornalOcorrencias: TAction;
    actJornalRoteiros: TAction;
    actJornalOperacional: TAction;
    actFinanceiroCusteioOcorrencias: TAction;
    actCadastroFaixaPeso: TAction;
    actCadastroCepDistribuidor: TAction;
    rtbCadastro: TdxRibbonTab;
    rbMain: TdxRibbon;
    rsbMain: TdxRibbonStatusBar;
    bmMainBar1: TdxBar;
    dxBarLargeButton1: TdxBarLargeButton;
    imlMain32: TcxImageList;
    dxBarLargeButton2: TdxBarLargeButton;
    bmMainBar2: TdxBar;
    dxBarLargeButton3: TdxBarLargeButton;
    bmMainBar3: TdxBar;
    dxBarButton3: TdxBarButton;
    dxBarButton5: TdxBarButton;
    bmMainBar4: TdxBar;
    dxBarButton6: TdxBarButton;
    dxBarButton7: TdxBarButton;
    dxBarButton8: TdxBarButton;
    dxBarButton9: TdxBarButton;
    bmMainBar5: TdxBar;
    dxBarButton10: TdxBarButton;
    dxBarButton11: TdxBarButton;
    dxBarButton12: TdxBarButton;
    dxBarButton13: TdxBarButton;
    dxBarLargeButton4: TdxBarLargeButton;
    rtbArquivo: TdxRibbonTab;
    bmMainBar6: TdxBar;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarLargeButton6: TdxBarLargeButton;
    rtbExpressas: TdxRibbonTab;
    bmMainBar7: TdxBar;
    dxBarLargeButton7: TdxBarLargeButton;
    dxBarLargeButton8: TdxBarLargeButton;
    bmMainBar8: TdxBar;
    dxBarLargeButton9: TdxBarLargeButton;
    dxBarLargeButton10: TdxBarLargeButton;
    dxBarLargeButton11: TdxBarLargeButton;
    bmMainBar9: TdxBar;
    dxBarLargeButton12: TdxBarLargeButton;
    dxBarLargeButton13: TdxBarLargeButton;
    bmMainBar10: TdxBar;
    dxBarButton14: TdxBarButton;
    rtbFinanceiro: TdxRibbonTab;
    bmMainBar11: TdxBar;
    dxBarLargeButton14: TdxBarLargeButton;
    bmMainBar12: TdxBar;
    dxBarButton16: TdxBarButton;
    bmMainBar13: TdxBar;
    dxBarButton18: TdxBarButton;
    bmMainBar14: TdxBar;
    dxBarButton19: TdxBarButton;
    dxBarButton20: TdxBarButton;
    dxBarLargeButton15: TdxBarLargeButton;
    dxBarLargeButton16: TdxBarLargeButton;
    dxBarLargeButton17: TdxBarLargeButton;
    dxBarLargeButton18: TdxBarLargeButton;
    rtbDiario: TdxRibbonTab;
    bmMainBar15: TdxBar;
    dxBarLargeButton19: TdxBarLargeButton;
    bmMainBar16: TdxBar;
    dxBarLargeButton20: TdxBarLargeButton;
    bmMainBar17: TdxBar;
    dxBarLargeButton21: TdxBarLargeButton;
    dxBarLargeButton22: TdxBarLargeButton;
    dxBarLargeButton23: TdxBarLargeButton;
    bmMainBar18: TdxBar;
    dxBarLargeButton24: TdxBarLargeButton;
    dxBarLargeButton25: TdxBarLargeButton;
    dxBarLargeButton26: TdxBarLargeButton;
    dxBarLargeButton27: TdxBarLargeButton;
    rtbServicos: TdxRibbonTab;
    bmMainBar19: TdxBar;
    dxBarLargeButton28: TdxBarLargeButton;
    bmMainBar20: TdxBar;
    dxBarLargeButton29: TdxBarLargeButton;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarLargeButton30: TdxBarLargeButton;
    rtbSistema: TdxRibbonTab;
    bmMainBar21: TdxBar;
    dxBarLargeButton31: TdxBarLargeButton;
    dxBarLargeButton32: TdxBarLargeButton;
    dxBarButton15: TdxBarButton;
    dxBarButton17: TdxBarButton;
    dxBarButton4: TdxBarButton;
    PrinterSetupDialog1: TPrinterSetupDialog;
    Timer1: TTimer;
    tmmMain: TdxTabbedMDIManager;
    dxBarLargeButton33: TdxBarLargeButton;
    dxBarLargeButton34: TdxBarLargeButton;
    actRecados: TAction;
    dxBarLargeButton35: TdxBarLargeButton;
    dxBarLargeButton37: TdxBarLargeButton;
    actTransporteInsumos: TAction;
    dxBarLargeButton36: TdxBarLargeButton;
    dxBarLargeButton38: TdxBarLargeButton;
    dxBarLargeButton39: TdxBarLargeButton;
    actEstoquesInsumos: TAction;
    actCadastroItensManutencao: TAction;
    dxBarLargeButton41: TdxBarLargeButton;
    dxBarLargeButton40: TdxBarLargeButton;
    actOperacaoManutencao: TAction;
    dxBarLargeButton42: TdxBarLargeButton;
    dxBarButton21: TdxBarButton;
    actTabelasAuxiliares: TAction;
    dxBarButton22: TdxBarButton;
    rtbVA: TdxRibbonTab;
    actInventarioVA: TAction;
    bmMainBar22: TdxBar;
    dxBarLargeButton43: TdxBarLargeButton;
    actBancaVA: TAction;
    dxBarButton23: TdxBarButton;
    dxBarLargeButton44: TdxBarLargeButton;
    bmMainBar24: TdxBar;
    actProdutosVA: TAction;
    dxBarLargeButton45: TdxBarLargeButton;
    actEncalheExpedicao: TAction;
    dxBarLargeButton46: TdxBarLargeButton;
    actRemessasVA: TAction;
    dxBarLargeButton47: TdxBarLargeButton;
    procedure FormShow(Sender: TObject);
    procedure actSegurancaUsuarioExecute(Sender: TObject);
    procedure actSegurancaGruposUsuariosExecute(Sender: TObject);
    procedure actSistemaTrocaUsuarioExecute(Sender: TObject);
    procedure actExpressasAcareacoesExecute(Sender: TObject);
    procedure actCadastroEntregadoresExecute(Sender: TObject);
    procedure actCadastroClientesExecute(Sender: TObject);
    procedure actCadastroServicosExecute(Sender: TObject);
    procedure actCadastroVeiculosExecute(Sender: TObject);
    procedure actCadastroVerbaCEPExecute(Sender: TObject);
    procedure actImportarEntregasExecute(Sender: TObject);
    procedure actExpressasExtraviosExecute(Sender: TObject);
    procedure actOperacaoMaloteExecute(Sender: TObject);
    procedure actOperacaoOrdemServicoExecute(Sender: TObject);
    procedure actOperacaoAbastecimentosExecute(Sender: TObject);
    procedure actImportarBaixasExecute(Sender: TObject);
    procedure actImportarAbastecimentosExecute(Sender: TObject);
    procedure actFinanceiroLancamentosExecute(Sender: TObject);
    procedure actOperacaoControleKMExecute(Sender: TObject);
    procedure actOperacaoPrazoEntregaExecute(Sender: TObject);
    procedure actFinanceiroRestricoesExecute(Sender: TObject);
    procedure actSistemaConfiguracaoImpressoraExecute(Sender: TObject);
    procedure actFinanceirroPlanilhaCrerditoExecute(Sender: TObject);
    procedure actFinanceiroFechamentoExpressasExecute(Sender: TObject);
    procedure actOperacaoAcompanhamentoExecute(Sender: TObject);
    procedure actFinanceiroContasReceberExecute(Sender: TObject);
    procedure actCadastroCentroCustoExecute(Sender: TObject);
    procedure actExpressasAtribuicoesExecute(Sender: TObject);
    procedure actExpressasRecepcaoHermesExecute(Sender: TObject);
    procedure actExpressasRetornoBaixaExecute(Sender: TObject);
    procedure actCadastroGruposVerbasExecute(Sender: TObject);
    procedure actFinanceiroExtratoAgentesExecute(Sender: TObject);
    procedure actOperacaoExpectativasExecute(Sender: TObject);
    procedure actOperacaoRetiradaExecute(Sender: TObject);
    procedure actOperacaoDevolucaoBaseExecute(Sender: TObject);
    procedure actOperacaoReceberContainerExecute(Sender: TObject);
    procedure actCadastroLacresExecute(Sender: TObject);
    procedure actExpressasEntregasExecute(Sender: TObject);
    procedure actImportarFinanceiroExecute(Sender: TObject);
    procedure actJornalAgentesExecute(Sender: TObject);
    procedure actJornalProdutosExecute(Sender: TObject);
    procedure actJornalAssinanteExecute(Sender: TObject);
    procedure actJornalImportarEtiquetasExecute(Sender: TObject);
    procedure actJornalEtiquetasExecute(Sender: TObject);
    procedure actJornalAtribuicoesExecute(Sender: TObject);
    procedure actJornalBaixaProtocoloExecute(Sender: TObject);
    procedure actJornalAssinaturasExecute(Sender: TObject);
    procedure actJornalOcorrenciasExecute(Sender: TObject);
    procedure actJornalRoteirosExecute(Sender: TObject);
    procedure actJornalOperacionalExecute(Sender: TObject);
    procedure actFinanceiroCusteioOcorrenciasExecute(Sender: TObject);
    procedure actCadastroFaixaPesoExecute(Sender: TObject);
    procedure actCadastroCepDistribuidorExecute(Sender: TObject);
    procedure actArquivoSairExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure actCadastroAgentesExecute(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure actRecadosExecute(Sender: TObject);
    procedure actTransporteInsumosExecute(Sender: TObject);
    procedure actEstoquesInsumosExecute(Sender: TObject);
    procedure actCadastroItensManutencaoExecute(Sender: TObject);
    procedure actOperacaoManutencaoExecute(Sender: TObject);
    procedure actCadastroVerbasExpressasExecute(Sender: TObject);
    procedure actTabelasAuxiliaresExecute(Sender: TObject);
    procedure actImportarTiragemExecute(Sender: TObject);
    procedure actInventarioVAExecute(Sender: TObject);
    procedure actBancaVAExecute(Sender: TObject);
    procedure actProdutosVAExecute(Sender: TObject);
    procedure actEncalheExpedicaoExecute(Sender: TObject);
    procedure actRemessasVAExecute(Sender: TObject);
  private
    { Private declarations }
    function Login(): Boolean;
    function CriarForm(FormClass : TFormClass { ; CapMnu: string; MnuRel: TMenuItem } ): TForm;
    procedure FechaForms;
    procedure SetAcessos;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  acessosDAO : TAcessosDAO;
implementation

{$R *.dfm}

uses udm, uGlobais, ufrmLogin, clUtil, ufrmEmpresasAgentes, ufrmEntregadoresFuncionarios, ufrmClientes, ufrmServicos,
     ufrmVeiculos, ufrmVerbaCEP, ufrmMalotes, ufrmOrdemServico, ufrmAbastecimentos, ufrmImportaBaixas,
     ufrmImportaAbastacimentos, ufrmLancamentos, ufrmControleKm, ufrmPrazosEntrega, ufrmPlanilhaCredito,
     ufrmContasReceber, ufrmCentroCusto, ufrmAtribuicoesEntregas, ufrmRecepcaoHermes, ufrmRetornoEntregas,
     ufrmGrupoVerba, ufrmGruposUsuarios, ufrmExtratoAgente, ufrmPesquisaEntregadores, ufrmDevolucoes,
     ufrmDevolucaoBase, ufrmRetiradaDevolucoes, ufrmRecepcaoContainers, ufrmLacres, ufrmEntregas, ufrmImportarFinanceiro,
     ufrmManutencaoRestricoes, ufrmAgentesJornal, ufrmProdutos, ufrmAssinantes, ufrmImportarEtiquetas,
     ufrmEtiquetasJornal, ufrmAtribuicoesJornal, ufrmEmpresas, ufrmBaixaProtocoloJornal, ufrmAmbientes,
     ufrmAssinanteJornal, ufrmRoteiroEntregador, ufrmPlanilhaOperacionalJornal, ufrmCusteioOcorrencias,
     ufrmVerbaFaixaPeso, ufrmCepDistribuidores, ufrmAcareacoes, ufrmRecadosJornal, ufrmExtratoExpressa, ufrmControleTransportes,
     ufrmInsumosTransporte, ufrmEstoqueInsumosTransportes, ufrmItensManutencao, ufrmManutencaoVeiculos, ufrmVerbasExpressas,
     ufrmTabelasAuxiliaresCadastro, ufrmCadastroUsuarios, View.InventarioProdutosVA, View.ApontamentoOperacional,
     View.CadastroBanca, View.CadastroProdutosVA, View.DigitacaoEncalheExpedicao,View.OcorrenciasJornal, View.ManutencaoRepartes, View.ExtraviosMultas, View.FechamentoExpressas,
     View.ImportacaoPlanilhaEntradas, Global.Parametros;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm.ZConn.Disconnect;
  dm.ZConn1.Disconnect;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := (Application.MessageBox('Confirma sair do sistema?', 'Sair', MB_YESNO + MB_ICONQUESTION) = IDYES);
end;

procedure TfrmMain.FormShow(Sender: TObject);
var
  iKey: Integer;
begin
  iKey := 0;
  uGlobais.sIni := ExtractFilePath(Application.ExeName) + 'database.ini';
  Global.Parametros.pFileIni := ExtractFilePath(Application.ExeName) + 'database.ini';
  if not FileExists(Global.Parametros.pFileIni) then
  begin
    Application.MessageBox('Arquivo de configuração de acesso não encontrado! Entre em contato com o suporte.', 'Atenção!', MB_OK + MB_ICONEXCLAMATION);
    Application.Terminate;
    Exit;
  end;
  if not(Login()) then
  begin
    Application.Terminate;
  end;
  Self.Caption := Application.Title;
  rsbMain.Panels[0].Text := 'Vs. ' + TUtil.VersaoExe;
end;

function TfrmMain.Login(): Boolean;
begin
  Result := False;
  if not Assigned(frmLogin) then
  begin
    frmLogin := TfrmLogin.Create(Application);
  end;
  if not TUtil.Empty(uGlobais.sUsuario) then
  begin
    frmLogin.cxLabel1.Caption := Application.Title + ' Vs. ' + TUtil.VersaoExe;
  end
  else
  begin
    frmLogin.cxLabel1.Caption := 'Logoff - Troca de Usuário';
  end;
  if frmLogin.ShowModal = mrCancel then
  begin
    FreeAndNil(frmLogin);
    Exit;
  end;
  FreeAndNil(frmLogin);
  rsbMain.Panels[2].Text := uGlobais.sNomeUsuario;
  SetAcessos;
  Result := True;
end;

procedure TfrmMain.SetAcessos;
var
  i,x, iTag, iCategoria, iConta : Integer;
  bFlag : Boolean;
  sTexto: string;
begin
  acessosDAO := TAcessosDAO.Create();
  for i := 0 to actPrincipal.ActionCount - 1 do
  begin
    TAction(actPrincipal.Actions[i]).Visible := acessosDAO.FindAcesso(Self.Name, actPrincipal.Actions[i].Name, uGlobais.idUsuario);
  end;
  iConta := 0;
  iTag := 0;
  iCategoria := 0;
  for i := 0 to bmMain.Bars.Count - 1 do
  begin
    bFlag := False;
    for x := 0 to bmMain.Bars.Items[i].ItemLinks.Count - 1 do
    begin
      iTag := bmMain.Bars.Items[i].ItemLinks.Items[x].Item.Tag;
      if actPrincipal.Actions[iTag].Visible then
      begin
        bFlag := True;
      end;
    end;
    bmMain.Bars[i].Visible := bFlag;
  end;
  i := 0;
  x := 0;
  for i := 0 to rbMain.TabCount - 1 do
  begin
    bFlag := False;
    for x := 0 to rbMain.Tabs[i].Groups.Count - 1 do
    begin
      if rbMain.Tabs[i].Groups.Items[x].Visible then
      begin
        bFlag := True;
      end;
    end;
    rbMain.Tabs[i].Visible := bFlag;
  end;
  acessoDAO.Free;
end;

procedure TfrmMain.Timer1Timer(Sender: TObject);
begin
  rsbMain.Panels[3].Text := FormatDateTime('dddd dd/mm/yyyy hh:mm:ss', Now);
end;

function TfrmMain.CriarForm(FormClass : TFormClass { ; CapMnu: string; MnuRel: TMenuItem } ): TForm;
var
  I: Integer;
  // MnuJanela: TMenuItem;
begin
  Result := nil;
  for I := 0 to Screen.FormCount - 1 do
  begin
    if Screen.Forms[I] is FormClass then
    begin
      Result := Screen.Forms[I];
    end;
  end;
  if Result = nil then
  begin
    { CASO O FORM AINDA NÃO FOI CRIADO ENTRA NO BLOCO E CRIA O FORM + ITEM NO MENU }
    { EVITA A MAXIMIZAÇÃO INDESEJADO DO FORM }
    LockWindowUpdate(Handle);
    { CRIA O FORM }
    Application.CreateForm(FormClass, Result);
    LockWindowUpdate(0);
    Result.Position := poDefault;
    Result.Top := 0;

    { *2 CRIA O ITEM NO MENU JANELAS REFERENTE AO FORM CRIADO }
    { MnuJanela := TMenuItem.Create(Janelas1);
      MnuJanela.Caption := CapMnu;
      MnuJanela.OnClick := MnuRel.OnClick;
      MainMenu1.Items.Items[1].Insert(0, MnuJanela); }
  end
  { CASO O FORM JA ESTEJA NA MEORIA ENTÃO MAXIMIZA-O E O CHAMA PARA
    FRENTE DOS OUTROS FORMS }
  else
  begin
    Result.WindowState := wsNormal;
    Result.BringToFront;
    Result.SetFocus;
  END;
  Result.Show;
end;

procedure tfrmMain.actSegurancaGruposUsuariosExecute(Sender: TObject);
begin
  if not Assigned(frmGruposUsuarios) then
  begin
    frmGruposUsuarios := TfrmGruposUsuarios.Create(Application);
  end;
  frmGruposUsuarios.Show;
end;

procedure tfrmMain.actSegurancaUsuarioExecute(Sender: TObject);
begin
  CriarForm(TfrmCadastroUsuarios);
end;

procedure tfrmMain.actSistemaTrocaUsuarioExecute(Sender: TObject);
begin
  if not(Login()) then
  begin
    Application.Terminate;
  end;
end;

procedure TfrmMain.actTabelasAuxiliaresExecute(Sender: TObject);
begin
  CriarForm(TfrmTabelasAuxiliaresCadastro);
end;

procedure TfrmMain.actTransporteInsumosExecute(Sender: TObject);
begin
  CriarForm(TfrmInsumosTransporte);
end;

procedure TfrmMain.actArquivoSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.actBancaVAExecute(Sender: TObject);
begin
  if not Assigned(view_CadastroBanca) then
  begin
    view_CadastroBanca := Tview_CadastroBanca.Create(Application);
  end;
  view_CadastroBanca.Show;
end;

procedure TfrmMain.actCadastroAgentesExecute(Sender: TObject);
begin
  if not Assigned(frmEmpresasAgentes) then
  begin
    frmEmpresasAgentes := TfrmEmpresasAgentes.Create(Application);
  end;
  frmEmpresasAgentes.Show;
end;

procedure tfrmMain.actCadastroCentroCustoExecute(Sender: TObject);
begin
  if not Assigned(frmCentroCusto) then
  begin
    frmCentroCusto := TfrmCentroCusto.Create(Application);
  end;
  frmCentroCusto.Show;
end;

procedure tfrmMain.actCadastroCepDistribuidorExecute(Sender: TObject);
begin
  if not Assigned(frmCepDistribuidores) then
  begin
    frmCepDistribuidores := TfrmCepDistribuidores.Create(Application);
  end;
  frmCepDistribuidores.Show;
end;

procedure tfrmMain.actCadastroClientesExecute(Sender: TObject);
begin
  if not Assigned(frmClientes) then
  begin
    frmClientes := TfrmClientes.Create(Application);
  end;
  frmClientes.Show;
end;

procedure tfrmMain.actCadastroEntregadoresExecute(Sender: TObject);
begin
  { if not Assigned(frmEntregadoresFuncionarios) then begin
    frmEntregadoresFuncionarios :=  TfrmEntregadoresFuncionarios.Create(Application);
    end;
    frmEntregadoresFuncionarios.Show; }
  if not Assigned(frmPesquisaEntregadores) then
  begin
    frmPesquisaEntregadores := TfrmPesquisaEntregadores.Create(Application);
  end;
  frmPesquisaEntregadores.ShowModal;
end;

procedure tfrmMain.actCadastroFaixaPesoExecute(Sender: TObject);
begin
  if not Assigned(frmVerbaFaixaPeso) then
  begin
    frmVerbaFaixaPeso := TfrmVerbaFaixaPeso.Create(Application);
  end;
  frmVerbaFaixaPeso.Show;
end;

procedure tfrmMain.actCadastroGruposVerbasExecute(Sender: TObject);
begin
  if not Assigned(frmGrupoVerba) then
  begin
    frmGrupoVerba := TfrmGrupoVerba.Create(Application);
  end;
  frmGrupoVerba.Show;
end;

procedure TfrmMain.actCadastroItensManutencaoExecute(Sender: TObject);
begin
   CriarForm(TfrmItensManutencao);
end;

procedure tfrmMain.actCadastroLacresExecute(Sender: TObject);
begin
  if not Assigned(frmLacres) then
  begin
    frmLacres := TfrmLacres.Create(Application);
  end;
  frmLacres.Show;
end;

procedure tfrmMain.actCadastroServicosExecute(Sender: TObject);
begin
  if not Assigned(frmServicos) then
  begin
    frmServicos := TfrmServicos.Create(Application);
  end;
  frmServicos.Show;
end;

procedure tfrmMain.actCadastroVeiculosExecute(Sender: TObject);
begin
  if not Assigned(frmVeiculos) then
  begin
    frmVeiculos := TfrmVeiculos.Create(Application);
  end;
  frmVeiculos.Show;
end;

procedure tfrmMain.actCadastroVerbaCEPExecute(Sender: TObject);
begin
  if not Assigned(frmVerbaCEP) then
  begin
    frmVerbaCEP := TfrmVerbaCEP.Create(Application);
  end;
  frmVerbaCEP.Show;
end;

procedure TfrmMain.actCadastroVerbasExpressasExecute(Sender: TObject);
begin
  CriarForm(TfrmVerbasExpressas);
end;

procedure TfrmMain.actEncalheExpedicaoExecute(Sender: TObject);
begin
  if not Assigned(view_DigitacaoEncalheExpedicao) then
  begin
    view_DigitacaoEncalheExpedicao := Tview_DigitacaoEncalheExpedicao.Create(Application);
  end;
  view_DigitacaoEncalheExpedicao.Show;
end;

procedure TfrmMain.actEstoquesInsumosExecute(Sender: TObject);
begin
  CriarForm(TfrmEstoqueInsumosTransportes);
end;

procedure tfrmMain.actExpressasAcareacoesExecute(Sender: TObject);
begin
  CriarForm(TfrmAcareacoes);
end;

procedure tfrmMain.actExpressasAtribuicoesExecute(Sender: TObject);
begin
  if not Assigned(frmAtribuicoesEntregas) then
  begin
    frmAtribuicoesEntregas := TfrmAtribuicoesEntregas.Create(Application);
  end;
  frmAtribuicoesEntregas.Show;
end;

procedure tfrmMain.actExpressasEntregasExecute(Sender: TObject);
begin
  if not Assigned(frmEntregas) then
  begin
    frmEntregas := TfrmEntregas.Create(Application);
  end;
  frmEntregas.Show;
end;

procedure tfrmMain.actExpressasExtraviosExecute(Sender: TObject);
begin
  if not Assigned(view_ExtraviosMultas) then
  begin
    view_ExtraviosMultas := Tview_ExtraviosMultas.Create(Application);
  end;
  view_ExtraviosMultas.Show;
end;

procedure tfrmMain.actFinanceiroContasReceberExecute(Sender: TObject);
begin
  if not Assigned(frmContasReceber) then
  begin
    frmContasReceber := TfrmContasReceber.Create(Application);
  end;
  frmContasReceber.Show;
end;

procedure tfrmMain.actFinanceiroCusteioOcorrenciasExecute(Sender: TObject);
begin
  if not Assigned(frmCusteioOcorrencia) then
  begin
    frmCusteioOcorrencia := TfrmCusteioOcorrencia.Create(Application);
  end;
  frmCusteioOcorrencia.Show;
end;

procedure tfrmMain.actFinanceiroExtratoAgentesExecute(Sender: TObject);
begin
  if not Assigned(frmExtratoAgente) then
  begin
    frmExtratoAgente := TfrmExtratoAgente.Create(Application);
  end;
  frmExtratoAgente.Show;

end;

procedure tfrmMain.actFinanceiroFechamentoExpressasExecute
  (Sender: TObject);
begin
  if not Assigned(view_FechamentoExpressas) then
  begin
    view_FechamentoExpressas := Tview_FechamentoExpressas.Create(Application);
  end;
  view_FechamentoExpressas.Show;
//  CriarForm(TfrmExtratoExpressa);
end;

procedure tfrmMain.actFinanceiroLancamentosExecute(Sender: TObject);
begin
  if not Assigned(frmLancamentos) then
  begin
    frmLancamentos := TfrmLancamentos.Create(Application);
  end;
  frmLancamentos.Show;
end;

procedure tfrmMain.actFinanceiroRestricoesExecute(Sender: TObject);
begin
  if not Assigned(frmManutencaoRestricoes) then
  begin
    frmManutencaoRestricoes := TfrmManutencaoRestricoes.Create(Application);
  end;
  frmManutencaoRestricoes.Show;
end;

procedure tfrmMain.actFinanceirroPlanilhaCrerditoExecute(Sender: TObject);
begin
  if not Assigned(frmPlanilhaCredito) then
  begin
    frmPlanilhaCredito := TfrmPlanilhaCredito.Create(Application);
  end;
  frmPlanilhaCredito.Show;
end;

procedure tfrmMain.actImportarAbastecimentosExecute(Sender: TObject);
begin
  if not Assigned(frmImportaAbastecimentos) then
  begin
    frmImportaAbastecimentos := TfrmImportaAbastecimentos.Create(Application);
  end;
  frmImportaAbastecimentos.Show;
end;

procedure tfrmMain.actImportarBaixasExecute(Sender: TObject);
begin
  if not Assigned(frmImportaBaixas) then
  begin
    frmImportaBaixas := TfrmImportaBaixas.Create(Application);
  end;
  frmImportaBaixas.Show;
end;

procedure tfrmMain.actImportarEntregasExecute(Sender: TObject);
begin
  if not Assigned(view_ImportacaoPlanilhaEntradas) then
  begin
    view_ImportacaoPlanilhaEntradas := Tview_ImportacaoPlanilhaEntradas.Create(Application);
  end;
  view_ImportacaoPlanilhaEntradas.Show;
end;

procedure tfrmMain.actImportarFinanceiroExecute(Sender: TObject);
begin
  if not Assigned(frmImportarFinanceiro) then
  begin
    frmImportarFinanceiro := TfrmImportarFinanceiro.Create(Application);
  end;
  frmImportarFinanceiro.Show;
end;

procedure TfrmMain.actImportarTiragemExecute(Sender: TObject);
begin
  CriarForm(TfrmImportacaoTiragemJornal);
end;

procedure TfrmMain.actInventarioVAExecute(Sender: TObject);
begin
  CriarForm(Tview_InventarioProdutosVA);
end;

procedure tfrmMain.actJornalAgentesExecute(Sender: TObject);
begin
  CriarForm(TfrmAgentesJornal);
end;

procedure tfrmMain.actJornalAssinanteExecute(Sender: TObject);
begin
  CriarForm(TfrmAssinantes);
end;

procedure tfrmMain.actJornalAssinaturasExecute(Sender: TObject);
begin
  CriarForm(TfrmAssinanteJornal);
end;

procedure tfrmMain.actJornalAtribuicoesExecute(Sender: TObject);
begin
  CriarForm(TfrmAtribuicoesJornal);
end;

procedure tfrmMain.actJornalBaixaProtocoloExecute(Sender: TObject);
begin
  CriarForm(TfrmBaixaProtocoloJornal);
end;

procedure tfrmMain.actJornalEtiquetasExecute(Sender: TObject);
begin
  CriarForm(TfrmEtiquetasJornal);
end;

procedure tfrmMain.actJornalImportarEtiquetasExecute(Sender: TObject);
begin
  CriarForm(TfrmImportarEtiquetas);
end;

procedure tfrmMain.actJornalOcorrenciasExecute(Sender: TObject);
begin
  if not Assigned(view_OcorrenciasJornal) then
  begin
    view_OcorrenciasJornal := Tview_OcorrenciasJornal.Create(Application);
  end;
  view_OcorrenciasJornal.Show;
end;

procedure tfrmMain.actJornalOperacionalExecute(Sender: TObject);
begin
  CriarForm(Tview_ApontamentoOperacional);
end;

procedure tfrmMain.actJornalProdutosExecute(Sender: TObject);
begin
  CriarForm(TfrmProdutos);
end;

procedure tfrmMain.actJornalRoteirosExecute(Sender: TObject);
begin
  CriarForm(TfrmRoteiroEntregador);
end;

procedure tfrmMain.actOperacaoAbastecimentosExecute(Sender: TObject);
begin
  CriarForm(TfrmAbastecimentos);
end;

procedure tfrmMain.actOperacaoAcompanhamentoExecute(Sender: TObject);
begin
  CriarForm(TfrmControleTransportes);
end;

procedure tfrmMain.actOperacaoControleKMExecute(Sender: TObject);
begin
  CriarForm(TfrmControleKM);
end;

procedure tfrmMain.actOperacaoDevolucaoBaseExecute(Sender: TObject);
begin
  if not Assigned(frmDevolucaoBase) then
  begin
    frmDevolucaoBase := TfrmDevolucaoBase.Create(Application);
  end;
  frmDevolucaoBase.ShowModal;
end;

procedure tfrmMain.actOperacaoExpectativasExecute(Sender: TObject);
begin
  if not Assigned(frmDevolucoes) then
  begin
    frmDevolucoes := TfrmDevolucoes.Create(Application);
  end;
  frmDevolucoes.ShowModal;
end;

procedure tfrmMain.actOperacaoMaloteExecute(Sender: TObject);
begin
  if not Assigned(frmMalotes) then
  begin
    frmMalotes := TfrmMalotes.Create(Application);
  end;
  frmMalotes.Show;
end;

procedure TfrmMain.actOperacaoManutencaoExecute(Sender: TObject);
begin
  CriarForm(TfrmManutencaoVeiculos);
end;

procedure tfrmMain.actOperacaoOrdemServicoExecute(Sender: TObject);
begin
  if not Assigned(frmOrdemServico) then
  begin
    frmOrdemServico := TfrmOrdemServico.Create(Application);
  end;
  frmOrdemServico.Show;
  {if not Assigned(frmOS) then
  begin
    frmOS := TfrmOS.Create(Application);
  end;
  frmOS.Show;}
end;

procedure tfrmMain.actOperacaoPrazoEntregaExecute(Sender: TObject);
begin
  if not Assigned(frmPrazosEntrega) then
  begin
    frmPrazosEntrega := TfrmPrazosEntrega.Create(Application);
  end;
  frmPrazosEntrega.Show;
end;

procedure tfrmMain.actOperacaoReceberContainerExecute(Sender: TObject);
begin
  if not Assigned(frmRecepcaoContainers) then
  begin
    frmRecepcaoContainers := TfrmRecepcaoContainers.Create(Application);
  end;
  frmRecepcaoContainers.ShowModal;
end;

procedure tfrmMain.actOperacaoRetiradaExecute(Sender: TObject);
begin
  if not Assigned(frmRetiradaDevolucoes) then
  begin
    frmRetiradaDevolucoes := TfrmRetiradaDevolucoes.Create(Application);
  end;
  frmRetiradaDevolucoes.ShowModal;
end;

procedure TfrmMain.actProdutosVAExecute(Sender: TObject);
begin
  if not Assigned(view_CadastroProdutosVA) then
  begin
    view_CadastroProdutosVA := Tview_CadastroProdutosVA.Create(Application);
  end;
  view_CadastroProdutosVA.Show;
end;

procedure TfrmMain.actRecadosExecute(Sender: TObject);
begin
  CriarForm(TfrmRecadosJornal);
end;

procedure TfrmMain.actRemessasVAExecute(Sender: TObject);
begin
  if not Assigned(view_ManutencaoRepartesVA) then
  begin
    view_ManutencaoRepartesVA := Tview_ManutencaoRepartesVA.Create(Application) ;
  end;
  view_ManutencaoRepartesVA.Show;
end;

procedure tfrmMain.actSistemaConfiguracaoImpressoraExecute
  (Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure tfrmMain.actExpressasRecepcaoHermesExecute(Sender: TObject);
begin
  if not Assigned(frmRecepcaoHermes) then
  begin
    frmRecepcaoHermes := TfrmRecepcaoHermes.Create(Application);
  end;
  frmRecepcaoHermes.Show;
end;

procedure tfrmMain.actExpressasRetornoBaixaExecute(Sender: TObject);
begin
  if not Assigned(frmRetornoEntregas) then
  begin
    frmRetornoEntregas := TfrmRetornoEntregas.Create(Application);
  end;
  frmRetornoEntregas.Show;
end;

procedure TfrmMain.FechaForms;
var
  n : integer;
  Form : TForm;
begin
  // Fechas os forms criados na aplicação
  n := 0;
  while n <= ( Application.ComponentCount - 1 ) do
  begin
    if ( Application.Components[ n ] is TForm ) then
    begin
      Form := TForm(Application.Components[n]);
      If ( Form <> Application.MainForm ) then
      begin
        N := -1;
        Form.Close;
        Form.Free;
      end;
    end;
    Inc( N );
  end;
end;


end.
