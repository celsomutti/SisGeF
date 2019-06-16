unit ufrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UCBase, Vcl.ActnList, UCDataConnector, UCZEOSConn, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxSkinsdxBarPainter, dxBar, cxClasses, UCSettings, UCMail, UCIdle, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsdxNavBarPainter, dxNavBar, dxNavBarGroupItems, dxNavBarCollns, dxNavBarBase, dxSkinsdxStatusBarPainter, dxStatusBar,
  cxCalendar, Vcl.ExtCtrls, dxSkinscxPCPainter, cxPCdxBarPopupMenu, cxPC, cxContainer, cxEdit, Vcl.Imaging.jpeg, cxImage,
  Vcl.OleCtrls, SHDocVw, clAcessos;

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
    PrinterSetupDialog1: TPrinterSetupDialog;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxBarButton1: TdxBarButton;
    dxBarSubItem1: TdxBarSubItem;
    dxBarSubItem2: TdxBarSubItem;
    dxBarButton2: TdxBarButton;
    dxBarSubItem3: TdxBarSubItem;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    dxBarButton6: TdxBarButton;
    dxBarButton7: TdxBarButton;
    dxBarSubItem4: TdxBarSubItem;
    dxBarButton8: TdxBarButton;
    dxBarButton9: TdxBarButton;
    dxBarButton10: TdxBarButton;
    dxBarButton11: TdxBarButton;
    dxBarButton12: TdxBarButton;
    dxBarButton13: TdxBarButton;
    dxBarButton14: TdxBarButton;
    dxBarSubItem5: TdxBarSubItem;
    dxBarButton15: TdxBarButton;
    dxBarSubItem6: TdxBarSubItem;
    dxBarButton16: TdxBarButton;
    dxBarButton17: TdxBarButton;
    dxBarButton18: TdxBarButton;
    dxBarButton19: TdxBarButton;
    dxBarButton20: TdxBarButton;
    dxBarButton21: TdxBarButton;
    dxBarButton22: TdxBarButton;
    dxBarSubItem7: TdxBarSubItem;
    dxBarButton23: TdxBarButton;
    dxBarButton24: TdxBarButton;
    dxBarButton25: TdxBarButton;
    dxBarButton26: TdxBarButton;
    dxBarButton27: TdxBarButton;
    dxBarButton28: TdxBarButton;
    dxBarSubItem8: TdxBarSubItem;
    dxBarSubItem9: TdxBarSubItem;
    dxBarButton29: TdxBarButton;
    dxBarButton30: TdxBarButton;
    dxBarSubItem10: TdxBarSubItem;
    dxBarButton31: TdxBarButton;
    dxBarButton32: TdxBarButton;
    dxBarButton33: TdxBarButton;
    dxBarButton34: TdxBarButton;
    dxBarButton35: TdxBarButton;
    dxBarButton36: TdxBarButton;
    dxBarButton37: TdxBarButton;
    dxBarButton38: TdxBarButton;
    dxBarSubItem11: TdxBarSubItem;
    dxBarButton39: TdxBarButton;
    dxBarButton40: TdxBarButton;
    dxStatusBar1: TdxStatusBar;
    Timer1: TTimer;
    dxBarManager1Bar2: TdxBar;
    dxBarButton41: TdxBarButton;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarLargeButton6: TdxBarLargeButton;
    dxBarSubItem12: TdxBarSubItem;
    dxBarLargeButton7: TdxBarLargeButton;
    dxBarLargeButton8: TdxBarLargeButton;
    dxBarLargeButton9: TdxBarLargeButton;
    dxBarSubItem13: TdxBarSubItem;
    dxBarLargeButton10: TdxBarLargeButton;
    dxBarLargeButton11: TdxBarLargeButton;
    dxBarLargeButton12: TdxBarLargeButton;
    dxBarLargeButton13: TdxBarLargeButton;
    actOperacaoAcompanhamento: TAction;
    dxBarButton42: TdxBarButton;
    dxBarLargeButton14: TdxBarLargeButton;
    actFinanceiroContasReceber: TAction;
    dxBarLargeButton15: TdxBarLargeButton;
    dxBarButton43: TdxBarButton;
    actCadastroCentroCusto: TAction;
    dxBarButton44: TdxBarButton;
    cxImage1: TcxImage;
    actExpressasAtribuicoes: TAction;
    dxBarLargeButton16: TdxBarLargeButton;
    dxBarButton45: TdxBarButton;
    actExpressasRecepcaoHermes: TAction;
    dxBarButton46: TdxBarButton;
    dxBarSubItem14: TdxBarSubItem;
    dxBarButton47: TdxBarButton;
    dxBarLargeButton17: TdxBarLargeButton;
    dxBarLargeButton18: TdxBarLargeButton;
    actExpressasRetornoBaixa: TAction;
    dxBarButton48: TdxBarButton;
    dxBarLargeButton19: TdxBarLargeButton;
    dxBarButton49: TdxBarButton;
    actCadastroGruposVerbas: TAction;
    actSegurancaGruposUsuarios: TAction;
    dxBarButton50: TdxBarButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure actArquivoSairExecute(Sender: TObject);

    function  CriarForm(FormClass: TFormClass): TForm;
    procedure actCadastroAgentesExecute(Sender: TObject);
    procedure actCadastroEntregadoresExecute(Sender: TObject);
    procedure actCadastroClientesExecute(Sender: TObject);
    procedure actCadastroServicosExecute(Sender: TObject);
    procedure actCadastroVeiculosExecute(Sender: TObject);
    procedure actCadastroVerbaCEPExecute(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
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
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure actOperacaoAcompanhamentoExecute(Sender: TObject);
    procedure actFinanceiroContasReceberExecute(Sender: TObject);
    procedure actCadastroCentroCustoExecute(Sender: TObject);
    procedure actExpressasAtribuicoesExecute(Sender: TObject);
    procedure actExpressasRecepcaoHermesExecute(Sender: TObject);
    procedure actExpressasRetornoBaixaExecute(Sender: TObject);
    procedure actCadastroGruposVerbasExecute(Sender: TObject);
    procedure actSistemaTrocaUsuarioExecute(Sender: TObject);
    procedure actSegurancaUsuarioExecute(Sender: TObject);
    procedure actSegurancaGruposUsuariosExecute(Sender: TObject);
  private
    { Private declarations }
    function  VerifyIni()          : Boolean;
    function  VerifyConnetionDB()  : Boolean;
    function  Login()              : Boolean;

    procedure SetAcessos;
  public
    { Public declarations }
    UserAut: String;
  end;

var
  frmPrincipal: TfrmPrincipal;
  acessos     : TAcessos;

implementation

uses
  udm, clUtil,
  ufrmEmpresasAgentes, uGlobais, ufrmEntregadoresFuncionarios,
  ufrmClientes, ufrmServicos, ufrmVeiculos, ufrmVerbaCEP, ufrmImportaEntrega,
  ufrmExtravios, ufrmMalotes, ufrmOrdemServico, ufrmControleAbastecimento, ufrmImportaBaixas,
  ufrmImportaAbastacimentos, ufrmLancamentos, ufrmControleKm, ufrmPrazosEntrega, ufrmRestricoes,
  ufrmPlanilhaCredito, ufrmExtrato, ufrmRelatorioDiarioOperacional, ufrmContasReceber,
  ufrmCentroCusto, ufrmAtribuicoesEntregas, ufrmRecepcaoHermes, ufrmRetornoEntregas, ufrmGrupoVerba,
  ufrmUsuarios, ufrmLogin, ufrmGruposUsuarios;

{$R *.dfm}

procedure TfrmPrincipal.actArquivoSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  acessos.Free;
  Action        :=  caFree;
  frmPrincipal  :=  nil;
  ExitProcess(0);
end;
procedure TfrmPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose  :=  (Application.MessageBox('Confirma sair do sistema?','Sair', MB_YESNO + MB_ICONQUESTION) = IDYES);
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  acessos   :=  TAcessos.Create;
  if not (VerifyIni()) then begin
    Application.Terminate;
  end;
  if not (VerifyConnetionDB()) then begin
    Application.Terminate;
  end;
  if not (Login()) then begin
    Application.Terminate;
  end;
  Self.Caption                :=  Application.Title + ' - Versão ' + TUtil.VersaoExe;
  dxStatusBar1.Panels[2].Text :=  'Conectado a ' + dm.ZConn.HostName + '/' + dm.ZConn.Database;
  Self.Top                    :=  0;
  Self.Left                   :=  0;
  Self.Width                  :=  Screen.WorkAreaWidth;
  Self.Height                 :=  Screen.WorkAreaHeight;
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
  dxStatusBar1.Panels[0].Text :=  FormatDateTime('dddd, dd/mm/yyyy hh:mm:ss',Now);
end;

procedure TfrmPrincipal.actCadastroAgentesExecute(Sender: TObject);
begin
  if not Assigned(frmEmpresasAgentes) then begin
    frmEmpresasAgentes :=  TfrmEmpresasAgentes.Create(Application);
  end;
  frmEmpresasAgentes.Show;
end;

procedure TfrmPrincipal.actCadastroCentroCustoExecute(Sender: TObject);
begin
  if not Assigned(frmCentroCusto) then begin
    frmCentroCusto :=  TfrmCentroCusto.Create(Application);
  end;
  frmCentroCusto.Show;
end;

procedure TfrmPrincipal.actCadastroClientesExecute(Sender: TObject);
begin
  if not Assigned(frmClientes) then begin
    frmClientes :=  TfrmClientes.Create(Application);
  end;
  frmClientes.Show;
end;

procedure TfrmPrincipal.actCadastroEntregadoresExecute(Sender: TObject);
begin
  if not Assigned(frmEntregadoresFuncionarios) then begin
    frmEntregadoresFuncionarios :=  TfrmEntregadoresFuncionarios.Create(Application);
  end;
  frmEntregadoresFuncionarios.Show;
end;

procedure TfrmPrincipal.actCadastroGruposVerbasExecute(Sender: TObject);
begin
  if not Assigned(frmGrupoVerba) then begin
    frmGrupoVerba :=  TfrmGrupoVerba.Create(Application);
  end;
  frmGrupoVerba.Show;
end;

procedure TfrmPrincipal.actCadastroServicosExecute(Sender: TObject);
begin
  if not Assigned(frmServicos) then begin
    frmServicos :=  TfrmServicos.Create(Application);
  end;
  frmServicos.Show;
end;

procedure TfrmPrincipal.actCadastroVeiculosExecute(Sender: TObject);
begin
  if not Assigned(frmVeiculos) then begin
    frmVeiculos :=  TfrmVeiculos.Create(Application);
  end;
  frmVeiculos.Show;
end;

procedure TfrmPrincipal.actCadastroVerbaCEPExecute(Sender: TObject);
begin
  if not Assigned(frmVerbaCEP) then begin
    frmVerbaCEP :=  TfrmVerbaCEP.Create(Application);
  end;
  frmVerbaCEP.Show;
end;

procedure TfrmPrincipal.actExpressasAtribuicoesExecute(Sender: TObject);
begin
  if not Assigned(frmAtribuicoesEntregas) then begin
    frmAtribuicoesEntregas :=  TfrmAtribuicoesEntregas.Create(Application);
  end;
  frmAtribuicoesEntregas.Show;
end;

procedure TfrmPrincipal.actExpressasExtraviosExecute(Sender: TObject);
begin
  if not Assigned(frmExtravios) then begin
    frmExtravios :=  TfrmExtravios.Create(Application);
  end;
  frmExtravios.Show;
end;

procedure TfrmPrincipal.actFinanceiroContasReceberExecute(Sender: TObject);
begin
  if not Assigned(frmContasReceber) then begin
    frmContasReceber :=  TfrmContasReceber.Create(Application);
  end;
  frmContasReceber.Show;
end;

procedure TfrmPrincipal.actFinanceiroFechamentoExpressasExecute(Sender: TObject);
begin
  if not Assigned(frmExtrato) then begin
    frmExtrato :=  TfrmExtrato.Create(Application);
  end;
  frmExtrato.Show;
end;

procedure TfrmPrincipal.actFinanceiroLancamentosExecute(Sender: TObject);
begin
  if not Assigned(frmLancamentos) then begin
    frmLancamentos :=  TfrmLancamentos.Create(Application);
  end;
  frmLancamentos.Show;
end;

procedure TfrmPrincipal.actFinanceiroRestricoesExecute(Sender: TObject);
begin
  if not Assigned(frmRestricoes) then begin
    frmRestricoes :=  TfrmRestricoes.Create(Application);
  end;
  frmRestricoes.Show;
end;

procedure TfrmPrincipal.actFinanceirroPlanilhaCrerditoExecute(Sender: TObject);
begin
  if not Assigned(frmPlanilhaCredito) then begin
    frmPlanilhaCredito :=  TfrmPlanilhaCredito.Create(Application);
  end;
  frmPlanilhaCredito.Show;
end;

procedure TfrmPrincipal.actImportarAbastecimentosExecute(Sender: TObject);
begin
  if not Assigned(frmImportaAbastecimentos) then begin
    frmImportaAbastecimentos :=  TfrmImportaAbastecimentos.Create(Application);
  end;
  frmImportaAbastecimentos.Show;
end;

procedure TfrmPrincipal.actImportarBaixasExecute(Sender: TObject);
begin
  if not Assigned(frmImportaBaixas) then begin
    frmImportaBaixas :=  TfrmImportaBaixas.Create(Application);
  end;
  frmImportaBaixas.Show;
end;

procedure TfrmPrincipal.actImportarEntregasExecute(Sender: TObject);
begin
  if not Assigned(frmImportaEntregas) then begin
    frmImportaEntregas :=  TfrmImportaEntregas.Create(Application);
  end;
  frmImportaEntregas.Show;
end;

procedure TfrmPrincipal.actOperacaoAbastecimentosExecute(Sender: TObject);
begin
  if not Assigned(frmControleAbastecimento) then begin
    frmControleAbastecimento :=  TfrmControleAbastecimento.Create(Application);
  end;
  frmControleAbastecimento.Show;
end;

procedure TfrmPrincipal.actOperacaoAcompanhamentoExecute(Sender: TObject);
begin
  if not Assigned(frmRelatorioDiarioOperacional) then begin
    frmRelatorioDiarioOperacional :=  TfrmRelatorioDiarioOperacional.Create(Application);
  end;
  frmRelatorioDiarioOperacional.Show;
end;

procedure TfrmPrincipal.actOperacaoControleKMExecute(Sender: TObject);
begin
  if not Assigned(frmControleKM) then begin
    frmControleKM :=  TfrmControleKM.Create(Application);
  end;
  frmControleKM.Show;
end;

procedure TfrmPrincipal.actOperacaoMaloteExecute(Sender: TObject);
begin
  if not Assigned(frmMalotes) then begin
    frmMalotes :=  TfrmMalotes.Create(Application);
  end;
  frmMalotes.Show;
end;

procedure TfrmPrincipal.actOperacaoOrdemServicoExecute(Sender: TObject);
begin
  if not Assigned(frmOrdemServico) then begin
    frmOrdemServico :=  TfrmOrdemServico.Create(Application);
  end;
  frmOrdemServico.Show;
end;

procedure TfrmPrincipal.actOperacaoPrazoEntregaExecute(Sender: TObject);
begin
  if not Assigned(frmPrazosEntrega) then begin
    frmPrazosEntrega :=  TfrmPrazosEntrega.Create(Application);
  end;
  frmPrazosEntrega.Show;
end;

procedure TfrmPrincipal.actSegurancaGruposUsuariosExecute(Sender: TObject);
begin
  if not Assigned(frmGruposUsuarios) then begin
    frmGruposUsuarios :=  TfrmGruposUsuarios.Create(Application);
  end;
  frmGruposUsuarios.Show;
end;

procedure TfrmPrincipal.actSegurancaUsuarioExecute(Sender: TObject);
begin
  if not Assigned(frmUsuarios) then begin
    frmUsuarios :=  TfrmUsuarios.Create(Application);
  end;
  frmUsuarios.Show;
end;

procedure TfrmPrincipal.actSistemaConfiguracaoImpressoraExecute(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TfrmPrincipal.actSistemaTrocaUsuarioExecute(Sender: TObject);
begin
  if not (Login()) then begin
    Application.Terminate;
  end;
end;

procedure TfrmPrincipal.actExpressasRecepcaoHermesExecute(Sender: TObject);
begin
  if not Assigned(frmRecepcaoHermes) then begin
    frmRecepcaoHermes :=  TfrmRecepcaoHermes.Create(Application);
  end;
  frmRecepcaoHermes.Show;
end;

procedure TfrmPrincipal.actExpressasRetornoBaixaExecute(Sender: TObject);
begin
  if not Assigned(frmRetornoEntregas) then begin
    frmRetornoEntregas :=  TfrmRetornoEntregas.Create(Application);
  end;
  frmRetornoEntregas.Show;
end;

function TfrmPrincipal.CriarForm(FormClass: TFormClass): TForm;
var
  i : Integer;
begin
  Result  :=  Nil;
  for i :=  0 to  Screen.FormCount - 1 do begin
    if Screen.Forms[i] is FormClass then begin
      Result := Screen.Forms[i];
    end;
  end;
  if Result = nil then begin
    LockWindowUpdate(Handle);
    Application.CreateForm(FormClass, Result);
    LockWindowUpdate(0);
    Result.Position     :=  poDefault;
    Result.Top := 0;
  end
  else begin
    Result.WindowState  :=  wsMaximized;
    Result.BringToFront;
    Result.SetFocus;
  end;
  Result.Show;
end;

function TfrmPrincipal.VerifyIni(): Boolean;
var
  sFile : String;
begin
  Result  :=  False;
  sFile :=  ExtractFilePath(Application.ExeName) + 'database.ini';
  if not (FileExists(sFile)) then begin
    Application.MessageBox('Arquivo de informações de Banco de Dados não foi encontrado! Saindo do Sistema.',
                           'Atenção!', MB_ICONEXCLAMATION + MB_OK);
    Exit;
  end;
  uGlobais.sIni :=  sFile;
  Result  := True;
end;

function TfrmPrincipal.VerifyConnetionDB(): Boolean;
begin
  try
    Result  :=  False;
    if TUtil.Empty(uGlobais.sIni) then begin
      Application.MessageBox('Erro na Conexão com o Banco de Dados (SINI#00) ! Saindo do Sistema.',
                             'Atenção!', MB_ICONERROR + MB_OK);
      Exit;
    end;
    if dm.ZConn.Connected then begin
      dm.ZConn.Disconnect;
    end;
    if FileExists(uGlobais.sIni) then begin
      dm.ZConn.Catalog   :=  TUtil.LeIni(uGlobais.sIni,'Database','Catalog');
      dm.ZConn.Database  :=  TUtil.LeIni(uGlobais.sIni,'Database','Database');
      dm.ZConn.HostName  :=  TUtil.LeIni(uGlobais.sIni,'Database','HostName');
      dm.ZConn.Password  :=  'rjsmart01';
      dm.ZConn.Port      :=  StrToInt(TUtil.LeIni(uGlobais.sIni,'Database','Port'));
      dm.ZConn.Protocol  :=  TUtil.LeIni(uGlobais.sIni,'Database','Protocol');
      if dm.ZConn.HostName = 'localhost' then begin
        dm.ZConn.User      :=  'root';
      end
      else begin
        dm.ZConn.User      := 'rjsmart';
      end;
      dm.ZConn.Connect;
    end;
    if not (dm.ZConn.Connected)  then begin
      Application.MessageBox('Erro na Conexão com o Banco de Dados (BD#00) ! Saindo do Sistema.',
                             'Atenção!', MB_ICONERROR + MB_OK);
      Exit;
    end;
    Result  :=  True;
  except on E: Exception do begin
      Application.MessageBox(PChar(e.Message), 'Erro!', MB_ICONERROR + MB_OK);
    end;
  end;

end;

function TfrmPrincipal.Login(): Boolean;
begin
  Result  :=  False;
  dxStatusBar1.Panels[1].Text :=  '';
  if not Assigned(frmLogin) then begin
    frmLogin :=  TfrmLogin.Create(Application);
  end;
  if TUTil.Empty(uGlobais.sUsuario) then begin
    frmLogin.cxLabel1.Caption  :=  frmLogin.Caption + ' ' + Application.Title + ' Vs. ' + TUtil.VersaoExe;
  end
  else begin
    frmLogin.cxLabel1.Caption  :=  'Logoff - Troca de Usuário';
  end;
  if frmLogin.ShowModal = mrCancel then begin
    FreeAndNil(frmLogin);
    Exit;
  end;
  FreeAndNil(frmLogin);
  dxStatusBar1.Panels[1].Text :=  'Usuário: ' + uGlobais.sNomeUsuario;
  SetAcessos;
  Result  :=  True;
end;

procedure TfrmPrincipal.SetAcessos;
var
  i : Integer;
begin
  for i := 0 to actPrincipal.ActionCount - 1 do begin
    acessos.Formulario                        :=  Self.Name;
    acessos.Modulo                            :=  actPrincipal.Actions[i].Name;
    if StrToInt(uGlobais.idGrupoUsuario) = 0 then begin
      acessos.Usuario :=  StrToInt(uGlobais.idUsuario);
    end
    else begin
      acessos.Usuario :=  StrToInt(uGlobais.idGrupoUsuario);
    end;
    TAction(actPrincipal.Actions[i]).Visible  :=  acessos.getAcessos('CHAVE')
  end;
end;


end.
