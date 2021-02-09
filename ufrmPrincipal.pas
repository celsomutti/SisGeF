unit ufrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans,
  dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp,
  dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxSkinsdxBarPainter, dxBar, cxClasses, Vcl.ActnList,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, cxListBox, dxSkinsdxStatusBarPainter,
  dxStatusBar, clAcessos, Vcl.ExtCtrls, dxRibbonSkins, dxSkinsdxRibbonPainter,
  dxBarApplicationMenu, dxRibbon, Vcl.ImgList,
  dxRibbonStatusBar, dxSkinscxPCPainter, cxPC, dxBevel,
  dxSkinsdxNavBarPainter, dxNavBarCollns, dxNavBarBase,
  dxNavBar, dxCustomTileControl, dxTileControl, dxTabbedMDI, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, System.Actions,
  ufrmAcareacoes, dxRibbonCustomizationForm, dxBarBuiltInMenu,
  clConexao, dxRibbonBackstageView, cxLabel, cxImage, Vcl.Menus, Vcl.StdCtrls, cxButtons, Vcl.ComCtrls, Winapi.ShlObj,
  cxShellCommon, cxGroupBox, cxListView, cxShellListView, dxLayoutContainer, dxLayoutControl, dxLayoutLookAndFeels, cxCustomData,
  cxStyles, cxTL, cxTLdxBarBuiltInMenu, cxInplaceContainer, dxNavBarGroupItems, dxGDIPlusClasses, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView, cxGrid,
  dxmdaset, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinsdxNavBarAccordionViewPainter;

type
  TfrmPrincipal = class(TForm)
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
    Timer1: TTimer;
    PrinterSetupDialog1: TPrinterSetupDialog;
    actOperacaoExpectativas: TAction;
    actOperacaoDevolucaoBase: TAction;
    actOperacaoRetirada: TAction;
    actOperacaoReceberContainer: TAction;
    actCadastroLacres: TAction;
    actExpressasAcareacoes: TAction;
    dxTabbedMDIManager1: TdxTabbedMDIManager;
    actJornalAgentes: TAction;
    actJornalProdutos: TAction;
    actJornalAssinante: TAction;
    actJornalImportarEtiquetas: TAction;
    actJornalEtiquetas: TAction;
    actJornalAtribuicoes: TAction;
    actArquivoEmpresas: TAction;
    actJornalBaixaProtocolo: TAction;
    actCadastroCadastro: TAction;
    Panel1: TPanel;
    cxImage1: TcxImage;
    cxLabel1: TcxLabel;
    cxButton1: TcxButton;
    cxGroupBox1: TcxGroupBox;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxGroupBox2: TcxGroupBox;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxGroupBox3: TcxGroupBox;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    PopupUsuario: TPopupMenu;
    cxLabel10: TcxLabel;
    cxLabel9: TcxLabel;
    PopupAmbiente: TPopupMenu;
    rocadeUsurio1: TMenuItem;
    actSistemaAmbiente: TAction;
    dxBevel1: TdxBevel;
    dxNavBar1: TdxNavBar;
    dxNavBar1Group1: TdxNavBarGroup;
    dxNavBar1Group2: TdxNavBarGroup;
    dxNavBar1Item1: TdxNavBarItem;
    dxNavBar1Item2: TdxNavBarItem;
    dxNavBar1Item3: TdxNavBarItem;
    dxNavBar1Item4: TdxNavBarItem;
    dxNavBar1Item5: TdxNavBarItem;
    dxNavBar1Item6: TdxNavBarItem;
    dxNavBar1Item14: TdxNavBarItem;
    dxNavBar1Separator1: TdxNavBarSeparator;
    dxNavBar1Item7: TdxNavBarItem;
    dxNavBar1Item8: TdxNavBarItem;
    dxNavBar1Separator2: TdxNavBarSeparator;
    dxNavBar1Item9: TdxNavBarItem;
    dxNavBar1Item11: TdxNavBarItem;
    dxNavBar1Item12: TdxNavBarItem;
    dxNavBar1Item13: TdxNavBarItem;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    Ambiente1: TMenuItem;
    cxLabel11: TcxLabel;
    dxNavBar1Item10: TdxNavBarItem;
    dxNavBar1Item15: TdxNavBarItem;
    dxNavBar1Item16: TdxNavBarItem;
    dxNavBar1Item17: TdxNavBarItem;
    dxNavBar1Item18: TdxNavBarItem;
    dxNavBar1Item19: TdxNavBarItem;
    cxButton5: TcxButton;
    dxNavBar1Group3: TdxNavBarGroup;
    dxNavBar1Item20: TdxNavBarItem;
    dxNavBar1Item21: TdxNavBarItem;
    dxNavBar1Item22: TdxNavBarItem;
    dxNavBar1Item23: TdxNavBarItem;
    dxNavBar1Item24: TdxNavBarItem;
    dxNavBar1Item25: TdxNavBarItem;
    dxNavBar1Separator3: TdxNavBarSeparator;
    dxNavBar1Group4: TdxNavBarGroup;
    dxNavBar1Group5: TdxNavBarGroup;
    dxNavBar1Group6: TdxNavBarGroup;
    dxNavBar1Item26: TdxNavBarItem;
    dxNavBar1Item27: TdxNavBarItem;
    dxNavBar1Item28: TdxNavBarItem;
    dxNavBar1Item29: TdxNavBarItem;
    dxNavBar1Separator4: TdxNavBarSeparator;
    dxNavBar1Item30: TdxNavBarItem;
    dxNavBar1Item31: TdxNavBarItem;
    dxNavBar1Item32: TdxNavBarItem;
    dxNavBar1Item33: TdxNavBarItem;
    dxNavBar1Item34: TdxNavBarItem;
    dxNavBar1Item35: TdxNavBarItem;
    dxNavBar1Item36: TdxNavBarItem;
    dxNavBar1Item37: TdxNavBarItem;
    dxNavBar1Item38: TdxNavBarItem;
    dxNavBar1Item39: TdxNavBarItem;
    dxNavBar1Item40: TdxNavBarItem;
    dxNavBar1Item42: TdxNavBarItem;
    dxNavBar1Item44: TdxNavBarItem;
    dxNavBar1Item45: TdxNavBarItem;
    dxNavBar1Item41: TdxNavBarItem;
    dxNavBar1Item43: TdxNavBarItem;
    dxNavBar1Item46: TdxNavBarItem;
    dxNavBar1Item47: TdxNavBarItem;
    dxNavBar1Item48: TdxNavBarItem;
    dxNavBar1Item50: TdxNavBarItem;
    dxNavBar1Item51: TdxNavBarItem;
    dxNavBar1Item52: TdxNavBarItem;
    dxNavBar1Item53: TdxNavBarItem;
    cxButton6: TcxButton;
    dxNavBar1Item49: TdxNavBarItem;
    dxNavBar1Item54: TdxNavBarItem;
    dxNavBar1Item55: TdxNavBarItem;
    dxNavBar1Item56: TdxNavBarItem;
    dxNavBar1Item57: TdxNavBarItem;
    actJornalAssinaturas: TAction;
    dxNavBar1Item58: TdxNavBarItem;
    actJornalOcorrencias: TAction;
    dxNavBar1Item59: TdxNavBarItem;
    actJornalRoteiros: TAction;
    dxNavBar1Item60: TdxNavBarItem;
    actJornalOperacional: TAction;
    dxNavBar1Item61: TdxNavBarItem;
    cxImage2: TcxImage;
    cxImage3: TcxImage;
    cxImage4: TcxImage;
    actFinanceiroCusteioOcorrencias: TAction;
    dxNavBar1Item62: TdxNavBarItem;
    actCadastroFaixaPeso: TAction;
    dxNavBar1Item63: TdxNavBarItem;
    actCadastroCepDistribuidor: TAction;
    dxNavBar1Item64: TdxNavBarItem;
    procedure actSegurancaUsuarioExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actSegurancaGruposUsuariosExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure actSistemaTrocaUsuarioExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure actArquivoSairExecute(Sender: TObject);

    procedure actCadastroAgentesExecute(Sender: TObject);
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
    procedure actExpressasAcareacoesExecute(Sender: TObject);
    procedure actJornalAgentesExecute(Sender: TObject);
    procedure actJornalProdutosExecute(Sender: TObject);
    procedure actJornalAssinanteExecute(Sender: TObject);
    procedure actJornalImportarEtiquetasExecute(Sender: TObject);
    procedure actJornalEtiquetasExecute(Sender: TObject);
    procedure actJornalAtribuicoesExecute(Sender: TObject);
    procedure actArquivoEmpresasExecute(Sender: TObject);
    procedure actJornalBaixaProtocoloExecute(Sender: TObject);
    procedure actCadastroCadastroExecute(Sender: TObject);
    procedure cxGroupBox1Click(Sender: TObject);
    procedure cxLabel10Click(Sender: TObject);
    procedure actSistemaAmbienteExecute(Sender: TObject);
    procedure cxGroupBox3Click(Sender: TObject);
    procedure actJornalAssinaturasExecute(Sender: TObject);
    procedure actJornalOcorrenciasExecute(Sender: TObject);
    procedure actJornalRoteirosExecute(Sender: TObject);
    procedure actJornalOperacionalExecute(Sender: TObject);
    procedure actFinanceiroCusteioOcorrenciasExecute(Sender: TObject);
    procedure cxImage2Click(Sender: TObject);
    procedure cxImage4Click(Sender: TObject);
    procedure actCadastroFaixaPesoExecute(Sender: TObject);
    procedure actCadastroCepDistribuidorExecute(Sender: TObject);
  private
    { Private declarations }
    function Login(): Boolean;
    function CriarForm(FormClass: TFormClass { ; CapMnu: string; MnuRel: TMenuItem } ): TForm;
    procedure SetAcessos;
    procedure FechaForms;
    procedure MudaAmbiente;
  public
    { Public declarations }
    UserAut: String;
  end;

var
  frmPrincipal: TfrmPrincipal;
  acessos: TAcessos;
  conexao: TConexao;
  iAmbiente: Integer;
implementation

{$R *.dfm}

uses
  udm, clUtil,
  ufrmEmpresasAgentes, uGlobais, ufrmEntregadoresFuncionarios,
  ufrmClientes, ufrmServicos, ufrmVeiculos, ufrmVerbaCEP, ufrmImportaEntrega,
  ufrmMalotes, ufrmOrdemServico, ufrmAbastecimentos, ufrmImportaBaixas,
  ufrmImportaAbastacimentos, ufrmLancamentos, ufrmControleKm, ufrmPrazosEntrega,
  ufrmPlanilhaCredito, ufrmContasReceber,
  ufrmCentroCusto, ufrmAtribuicoesEntregas, ufrmRecepcaoHermes,
  ufrmRetornoEntregas, ufrmGrupoVerba,
  ufrmLogin, ufrmGruposUsuarios, ufrmExtratoAgente,
  ufrmPesquisaEntregadores, ufrmDevolucoes, ufrmDevolucaoBase,
  ufrmRetiradaDevolucoes, ufrmRecepcaoContainers, ufrmLacres, ufrmEntregas,
  ufrmImportarFinanceiro, ufrmManutencaoRestricoes,
  ufrmExtraviosProdutos, ufrmAgentesJornal, ufrmProdutos, ufrmAssinantes,
  ufrmImportarEtiquetas, ufrmEtiquetasJornal,
  ufrmAtribuicoesJornal, ufrmEmpresas, ufrmBaixaProtocoloJornal, ufrmCadastro, ufrmAmbientes, ufrmAssinantesJornal,
  ufrmOcorrenciasJornal, ufrmRoteiroEntregador, ufrmPlanilhaOperacionalJornal, ufrmCusteioOcorrencias, ufrmVerbaFaixaPeso,
  ufrmCepDistribuidores;

procedure TfrmPrincipal.actArquivoEmpresasExecute(Sender: TObject);
begin
  CriarForm(TfrmEmpresas);
end;

procedure TfrmPrincipal.actArquivoSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.actSegurancaGruposUsuariosExecute(Sender: TObject);
begin
  if not Assigned(frmGruposUsuarios) then
  begin
    frmGruposUsuarios := TfrmGruposUsuarios.Create(Application);
  end;
  frmGruposUsuarios.Show;
end;

procedure TfrmPrincipal.actSegurancaUsuarioExecute(Sender: TObject);
begin
{  if not Assigned(frmUsuarios) then
  begin
    frmUsuarios := TfrmUsuarios.Create(Application);
  end;
  frmUsuarios.Show;}
end;

procedure TfrmPrincipal.actSistemaTrocaUsuarioExecute(Sender: TObject);
begin
  if not(Login()) then
  begin
    Application.Terminate;
  end;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  acessos.Free;
  dm.ZConn.Disconnect;
  dm.ZConn1.Disconnect;
end;

procedure TfrmPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := (Application.MessageBox('Confirma sair do sistema?', 'Sair',
    MB_YESNO + MB_ICONQUESTION) = IDYES);
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  uGlobais.sIni := ExtractFilePath(Application.ExeName) + 'database.ini';
  acessos := TAcessos.Create;
  conexao := TConexao.Create;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    Application.Terminate;
    Exit;
  end;
  if (not conexao.VerifyConnZEOS(1)) then
  begin
    Application.Terminate;
    Exit;
  end;
  if not(Login()) then
  begin
    Application.Terminate;
  end;
  cxLabel1.Caption := Application.Title;
  Self.Caption := Application.Title + ' - Versão ' + TUtil.VersaoExe;
  cxLabel9.Caption := dxNavBar1.Groups[dxNavBar1.ActiveGroupIndex].Caption;
  cxLabel11.Caption := 'Versão ' + TUtil.VersaoExe;
  Self.Top := 0;
  Self.Left := 0;
  Self.Width := Screen.WorkAreaWidth;
  Self.Height := Screen.WorkAreaHeight;
end;

function TfrmPrincipal.Login(): Boolean;
begin
  Result := False;
  if not Assigned(frmLogin) then
  begin
    frmLogin := TfrmLogin.Create(Application);
  end;
  if TUtil.Empty(uGlobais.sUsuario) then
  begin
    frmLogin.cxLabel1.Caption := frmLogin.Caption + ' ' + Application.Title +
      ' Vs. ' + TUtil.VersaoExe;
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
  cxLabel3.Caption := uGlobais.sNomeUsuario;
  SetAcessos;
  Result := True;
end;

procedure TfrmPrincipal.SetAcessos;
var
  i,x: Integer;
  bFlag: Boolean;
  sAmbiente: String;
  sLista: TStringList;
begin
  sAmbiente := '';
  sLista := TStringList.Create;
  sLista.Clear;
  bFlag := True;
  acessos.Formulario := Self.Name;
  if StrToInt(uGlobais.idGrupoUsuario) = 0 then
  begin
    acessos.Usuario := StrToInt(uGlobais.idUsuario);
  end
  else
  begin
    acessos.Usuario := StrToInt(uGlobais.idGrupoUsuario);
  end;
  acessos.SetAcessos(actPrincipal);
  for i := 0 to actPrincipal.ActionCount - 1 do
  begin
    if TAction(actPrincipal.Actions[i]).Visible then
    begin
      bFlag := True;
      for x := 0 to sLista.Count -1 do
      begin
        if sLista[x] = actPrincipal.Actions[i].Category then
        begin
          bFlag := False;
        end;
      end;
      if bFlag then
      begin
        sLista.Add(actPrincipal.Actions[i].Category);
      end;
    end;
  end;
  if sLista.Count > 0 then
  begin
    sLista.Sort;
    uGlobais.ListaAmbiente := sLista.Create;
    sAmbiente := sLista[0];
    if sLista.Count > 1 then
    begin
      if sAmbiente = 'Sistema' then
      begin
        sAmbiente := sLista[1];
      end;
    end;
    if sAmbiente = 'Expressas' then
    begin
      iAmbiente := 0;
    end
    else if sAmbiente = 'Jornal' then
    begin
      iAmbiente := 1;
    end
    else if sAmbiente = 'Transportes e Serviços' then
    begin
      iAmbiente := 2;
    end
    else if sAmbiente = 'Financeiro' then
    begin
      iAmbiente := 3;
    end
    else if sAmbiente = 'Arquivo' then
    begin
      iAmbiente := 4;
    end
    else if sAmbiente = 'Sistema' then
    begin
      iAmbiente := 5;
    end;
    if iAmbiente <> dxNavBar1.ActiveGroupIndex then
    begin
      FechaForms;
      dxNavBar1.ActiveGroupIndex := iAmbiente;
      cxLabel9.Caption := dxNavBar1.Groups[dxNavBar1.ActiveGroupIndex].Caption;
    end;
  end
  else begin
    dxNavBar1.Visible := False;
  end;
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
  cxLabel6.Caption := FormatDateTime('DDDD, dd/mm/yyyy hh:mm:ss', Now);
end;

procedure TfrmPrincipal.actCadastroAgentesExecute(Sender: TObject);
begin
  if not Assigned(frmEmpresasAgentes) then
  begin
    frmEmpresasAgentes := TfrmEmpresasAgentes.Create(Application);
  end;
  frmEmpresasAgentes.Show;
end;

procedure TfrmPrincipal.actCadastroCadastroExecute(Sender: TObject);
begin
  if not Assigned(frmCadastro) then
  begin
    frmCadastro := TfrmCadastro.Create(Application);
  end;
  frmCadastro.Show;
end;

procedure TfrmPrincipal.actCadastroCentroCustoExecute(Sender: TObject);
begin
  if not Assigned(frmCentroCusto) then
  begin
    frmCentroCusto := TfrmCentroCusto.Create(Application);
  end;
  frmCentroCusto.Show;
end;

procedure TfrmPrincipal.actCadastroCepDistribuidorExecute(Sender: TObject);
begin
  if not Assigned(frmCepDistribuidores) then
  begin
    frmCepDistribuidores := TfrmCepDistribuidores.Create(Application);
  end;
  frmCepDistribuidores.Show;
end;

procedure TfrmPrincipal.actCadastroClientesExecute(Sender: TObject);
begin
  if not Assigned(frmClientes) then
  begin
    frmClientes := TfrmClientes.Create(Application);
  end;
  frmClientes.Show;
end;

procedure TfrmPrincipal.actCadastroEntregadoresExecute(Sender: TObject);
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

procedure TfrmPrincipal.actCadastroFaixaPesoExecute(Sender: TObject);
begin
  if not Assigned(frmVerbaFaixaPeso) then
  begin
    frmVerbaFaixaPeso := TfrmVerbaFaixaPeso.Create(Application);
  end;
  frmVerbaFaixaPeso.Show;
end;

procedure TfrmPrincipal.actCadastroGruposVerbasExecute(Sender: TObject);
begin
  if not Assigned(frmGrupoVerba) then
  begin
    frmGrupoVerba := TfrmGrupoVerba.Create(Application);
  end;
  frmGrupoVerba.Show;
end;

procedure TfrmPrincipal.actCadastroLacresExecute(Sender: TObject);
begin
  if not Assigned(frmLacres) then
  begin
    frmLacres := TfrmLacres.Create(Application);
  end;
  frmLacres.Show;
end;

procedure TfrmPrincipal.actCadastroServicosExecute(Sender: TObject);
begin
  if not Assigned(frmServicos) then
  begin
    frmServicos := TfrmServicos.Create(Application);
  end;
  frmServicos.Show;
end;

procedure TfrmPrincipal.actCadastroVeiculosExecute(Sender: TObject);
begin
  if not Assigned(frmVeiculos) then
  begin
    frmVeiculos := TfrmVeiculos.Create(Application);
  end;
  frmVeiculos.Show;
end;

procedure TfrmPrincipal.actCadastroVerbaCEPExecute(Sender: TObject);
begin
  if not Assigned(frmVerbaCEP) then
  begin
    frmVerbaCEP := TfrmVerbaCEP.Create(Application);
  end;
  frmVerbaCEP.Show;
end;

procedure TfrmPrincipal.actExpressasAcareacoesExecute(Sender: TObject);
begin
  CriarForm(TfrmAcareacoes);
end;

procedure TfrmPrincipal.actExpressasAtribuicoesExecute(Sender: TObject);
begin
  if not Assigned(frmAtribuicoesEntregas) then
  begin
    frmAtribuicoesEntregas := TfrmAtribuicoesEntregas.Create(Application);
  end;
  frmAtribuicoesEntregas.Show;
end;

procedure TfrmPrincipal.actExpressasEntregasExecute(Sender: TObject);
begin
  if not Assigned(frmEntregas) then
  begin
    frmEntregas := TfrmEntregas.Create(Application);
  end;
  frmEntregas.Show;
end;

procedure TfrmPrincipal.actExpressasExtraviosExecute(Sender: TObject);
begin
  CriarForm(TfrmExtraviosProdutos);
end;

procedure TfrmPrincipal.actFinanceiroContasReceberExecute(Sender: TObject);
begin
  if not Assigned(frmContasReceber) then
  begin
    frmContasReceber := TfrmContasReceber.Create(Application);
  end;
  frmContasReceber.Show;
end;

procedure TfrmPrincipal.actFinanceiroCusteioOcorrenciasExecute(Sender: TObject);
begin
  if not Assigned(frmCusteioOcorrencia) then
  begin
    frmCusteioOcorrencia := TfrmCusteioOcorrencia.Create(Application);
  end;
  frmCusteioOcorrencia.Show;
end;

procedure TfrmPrincipal.actFinanceiroExtratoAgentesExecute(Sender: TObject);
begin
  if not Assigned(frmExtratoAgente) then
  begin
    frmExtratoAgente := TfrmExtratoAgente.Create(Application);
  end;
  frmExtratoAgente.Show;

end;

procedure TfrmPrincipal.actFinanceiroFechamentoExpressasExecute
  (Sender: TObject);
begin
  {if not Assigned(frmExtrato) then
  begin
    frmExtrato := TfrmExtrato.Create(Application);
  end;
  frmExtrato.Show;}
end;

procedure TfrmPrincipal.actFinanceiroLancamentosExecute(Sender: TObject);
begin
  if not Assigned(frmLancamentos) then
  begin
    frmLancamentos := TfrmLancamentos.Create(Application);
  end;
  frmLancamentos.Show;
end;

procedure TfrmPrincipal.actFinanceiroRestricoesExecute(Sender: TObject);
begin
  if not Assigned(frmManutencaoRestricoes) then
  begin
    frmManutencaoRestricoes := TfrmManutencaoRestricoes.Create(Application);
  end;
  frmManutencaoRestricoes.Show;
end;

procedure TfrmPrincipal.actFinanceirroPlanilhaCrerditoExecute(Sender: TObject);
begin
  if not Assigned(frmPlanilhaCredito) then
  begin
    frmPlanilhaCredito := TfrmPlanilhaCredito.Create(Application);
  end;
  frmPlanilhaCredito.Show;
end;

procedure TfrmPrincipal.actImportarAbastecimentosExecute(Sender: TObject);
begin
  if not Assigned(frmImportaAbastecimentos) then
  begin
    frmImportaAbastecimentos := TfrmImportaAbastecimentos.Create(Application);
  end;
  frmImportaAbastecimentos.Show;
end;

procedure TfrmPrincipal.actImportarBaixasExecute(Sender: TObject);
begin
  if not Assigned(frmImportaBaixas) then
  begin
    frmImportaBaixas := TfrmImportaBaixas.Create(Application);
  end;
  frmImportaBaixas.Show;
end;

procedure TfrmPrincipal.actImportarEntregasExecute(Sender: TObject);
begin
  if not Assigned(frmImportaEntregas) then
  begin
    frmImportaEntregas := TfrmImportaEntregas.Create(Application);
  end;
  frmImportaEntregas.Show;
end;

procedure TfrmPrincipal.actImportarFinanceiroExecute(Sender: TObject);
begin
  if not Assigned(frmImportarFinanceiro) then
  begin
    frmImportarFinanceiro := TfrmImportarFinanceiro.Create(Application);
  end;
  frmImportarFinanceiro.Show;
end;

procedure TfrmPrincipal.actJornalAgentesExecute(Sender: TObject);
begin
  CriarForm(TfrmAgentesJornal);
end;

procedure TfrmPrincipal.actJornalAssinanteExecute(Sender: TObject);
begin
  CriarForm(TfrmAssinantes);
end;

procedure TfrmPrincipal.actJornalAssinaturasExecute(Sender: TObject);
begin
  CriarForm(TfrmAssinantesJornal);
end;

procedure TfrmPrincipal.actJornalAtribuicoesExecute(Sender: TObject);
begin
  CriarForm(TfrmAtribuicoesJornal);
end;

procedure TfrmPrincipal.actJornalBaixaProtocoloExecute(Sender: TObject);
begin
  CriarForm(TfrmBaixaProtocoloJornal);
end;

procedure TfrmPrincipal.actJornalEtiquetasExecute(Sender: TObject);
begin
  CriarForm(TfrmEtiquetasJornal);
end;

procedure TfrmPrincipal.actJornalImportarEtiquetasExecute(Sender: TObject);
begin
  CriarForm(TfrmImportarEtiquetas);
end;

procedure TfrmPrincipal.actJornalOcorrenciasExecute(Sender: TObject);
begin
  CriarForm(TfrmOcorrenciasJornal);
end;

procedure TfrmPrincipal.actJornalOperacionalExecute(Sender: TObject);
begin
  CriarForm(TfrmPlanilhaOperacionalJornal);
end;

procedure TfrmPrincipal.actJornalProdutosExecute(Sender: TObject);
begin
  CriarForm(TfrmProdutos);
end;

procedure TfrmPrincipal.actJornalRoteirosExecute(Sender: TObject);
begin
  CriarForm(TfrmRoteiroEntregador);
end;

procedure TfrmPrincipal.actOperacaoAbastecimentosExecute(Sender: TObject);
begin
  CriarForm(TfrmAbastecimentos);
end;

procedure TfrmPrincipal.actOperacaoControleKMExecute(Sender: TObject);
begin
  CriarForm(TfrmControleKM);
end;

procedure TfrmPrincipal.actOperacaoDevolucaoBaseExecute(Sender: TObject);
begin
  if not Assigned(frmDevolucaoBase) then
  begin
    frmDevolucaoBase := TfrmDevolucaoBase.Create(Application);
  end;
  frmDevolucaoBase.ShowModal;
end;

procedure TfrmPrincipal.actOperacaoExpectativasExecute(Sender: TObject);
begin
  if not Assigned(frmDevolucoes) then
  begin
    frmDevolucoes := TfrmDevolucoes.Create(Application);
  end;
  frmDevolucoes.ShowModal;
end;

procedure TfrmPrincipal.actOperacaoMaloteExecute(Sender: TObject);
begin
  if not Assigned(frmMalotes) then
  begin
    frmMalotes := TfrmMalotes.Create(Application);
  end;
  frmMalotes.Show;
end;

procedure TfrmPrincipal.actOperacaoOrdemServicoExecute(Sender: TObject);
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

procedure TfrmPrincipal.actOperacaoPrazoEntregaExecute(Sender: TObject);
begin
  if not Assigned(frmPrazosEntrega) then
  begin
    frmPrazosEntrega := TfrmPrazosEntrega.Create(Application);
  end;
  frmPrazosEntrega.Show;
end;

procedure TfrmPrincipal.actOperacaoReceberContainerExecute(Sender: TObject);
begin
  if not Assigned(frmRecepcaoContainers) then
  begin
    frmRecepcaoContainers := TfrmRecepcaoContainers.Create(Application);
  end;
  frmRecepcaoContainers.ShowModal;
end;

procedure TfrmPrincipal.actOperacaoRetiradaExecute(Sender: TObject);
begin
  if not Assigned(frmRetiradaDevolucoes) then
  begin
    frmRetiradaDevolucoes := TfrmRetiradaDevolucoes.Create(Application);
  end;
  frmRetiradaDevolucoes.ShowModal;
end;

procedure TfrmPrincipal.actSistemaAmbienteExecute(Sender: TObject);
begin
  MudaAmbiente;
end;

procedure TfrmPrincipal.actSistemaConfiguracaoImpressoraExecute
  (Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TfrmPrincipal.actExpressasRecepcaoHermesExecute(Sender: TObject);
begin
  if not Assigned(frmRecepcaoHermes) then
  begin
    frmRecepcaoHermes := TfrmRecepcaoHermes.Create(Application);
  end;
  frmRecepcaoHermes.Show;
end;

procedure TfrmPrincipal.actExpressasRetornoBaixaExecute(Sender: TObject);
begin
  if not Assigned(frmRetornoEntregas) then
  begin
    frmRetornoEntregas := TfrmRetornoEntregas.Create(Application);
  end;
  frmRetornoEntregas.Show;
end;

function TfrmPrincipal.CriarForm(FormClass
  : TFormClass { ; CapMnu: string; MnuRel: TMenuItem } ): TForm;
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

procedure TfrmPrincipal.cxGroupBox1Click(Sender: TObject);
begin
  PopupUsuario.Popup(cxGroupBox1.Left,cxGroupBox1.Height);
end;

procedure TfrmPrincipal.cxGroupBox3Click(Sender: TObject);
begin
  PopupAmbiente.Popup(cxGroupBox3.Left,cxGroupBox3.Height);
end;

procedure TfrmPrincipal.cxImage2Click(Sender: TObject);
begin
  PopupAmbiente.Popup(cxGroupBox3.Left,cxGroupBox3.Height);
end;

procedure TfrmPrincipal.cxImage4Click(Sender: TObject);
begin
  PopupAmbiente.Popup(cxGroupBox1.Left,cxGroupBox1.Height);
end;

procedure TfrmPrincipal.cxLabel10Click(Sender: TObject);
begin
  Self.WindowState := wsMinimized;
end;

procedure TfrmPrincipal.FechaForms;
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

procedure TfrmPrincipal.MudaAmbiente;
var
  sAmbiente: String;
begin
  sAmbiente := '';
  if not Assigned(SIS09997) then
  begin
    SIS09997 := TSIS09997.Create(Application);
  end;
  SIS09997.Left := cxGroupBox3.Left;
  SIS09997.Top := cxGroupBox3.Height;
  SIS09997.sAmbiente := Trim(cxLabel9.Caption);
  if SIS09997.ShowModal = mrCancel then
  begin
    FreeAndNil(SIS09997);
    Exit;
  end;
  sAmbiente := Trim(SIS09997.cxAmbiente.Text);
  FreeAndNil(SIS09997);
  if sAmbiente = 'Expressas' then
  begin
    iAmbiente := 0;
  end
  else if sAmbiente = 'Jornal' then
  begin
    iAmbiente := 1;
  end
  else if sAmbiente = 'Transportes e Serviços' then
  begin
    iAmbiente := 2;
  end
  else if sAmbiente = 'Financeiro' then
  begin
    iAmbiente := 3;
  end
  else if sAmbiente = 'Arquivo' then
  begin
    iAmbiente := 4;
  end
  else if sAmbiente = 'Sistema' then
  begin
    iAmbiente := 5;
  end;
  if iAmbiente <> dxNavBar1.ActiveGroupIndex then
  begin
    FechaForms;
    dxNavBar1.ActiveGroupIndex := iAmbiente;
    cxLabel9.Caption := dxNavBar1.Groups[dxNavBar1.ActiveGroupIndex].Caption;
  end;
end;
end.
