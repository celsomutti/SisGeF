unit View.CadastroBanca;

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
  Model.BancaVA, Model.DistribuidorVA, DAO.BancaVA, DAO.DistribuidorVA, Data.DB, dxmdaset, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, System.Generics.Collections, Model.Estados, DAO.Estados, System.Actions,
  Vcl.ActnList, dxLayoutControlAdapters, Vcl.Menus, Vcl.StdCtrls, cxButtons, dxSkinsdxStatusBarPainter, dxStatusBar, cxProgressBar,
  cxMemo, Model.RemessasVA, DAO.RemessasVA, Thread.ImportaBancasJones, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, cxClasses;

type
  Tview_CadastroBanca = class(TForm)
    lcgRoot: TdxLayoutGroup;
    lcBanca: TdxLayoutControl;
    lblTitulo: TcxLabel;
    lciTitulo: TdxLayoutItem;
    dsDistribuidor: TDataSource;
    mskID: TcxMaskEdit;
    lciIdBanca: TdxLayoutItem;
    mskCodigo: TcxMaskEdit;
    lciCodigo: TdxLayoutItem;
    lcgIdBanca: TdxLayoutAutoCreatedGroup;
    lcbDistribuidor: TcxLookupComboBox;
    lciDistribuidor: TdxLayoutItem;
    edtNomeBanca: TcxTextEdit;
    lciNomeBanca: TdxLayoutItem;
    mskCEP: TcxMaskEdit;
    lciCEP: TdxLayoutItem;
    edtEndereco: TcxTextEdit;
    lciEndereco: TdxLayoutItem;
    edtComplemento: TcxTextEdit;
    lciComplemento: TdxLayoutItem;
    lcgEndereco: TdxLayoutAutoCreatedGroup;
    edtBairro: TcxTextEdit;
    lciBairro: TdxLayoutItem;
    edtCidade: TcxTextEdit;
    lciCidade: TdxLayoutItem;
    lcgLocalidade: TdxLayoutAutoCreatedGroup;
    dsEstados: TDataSource;
    lcbEstado: TcxLookupComboBox;
    lciEstado: TdxLayoutItem;
    mskOrdemImpressao: TcxMaskEdit;
    lciOrdemImpressao: TdxLayoutItem;
    aclBancas: TActionList;
    actIncluir: TAction;
    actLocalizar: TAction;
    actExcluir: TAction;
    actCancelar: TAction;
    actSalvar: TAction;
    actImportar: TAction;
    actFechar: TAction;
    btnIncluir: TcxButton;
    lciIncluir: TdxLayoutItem;
    btnLocalizar: TcxButton;
    lciLocalizar: TdxLayoutItem;
    lcgOpcoes: TdxLayoutAutoCreatedGroup;
    btnExcluir: TcxButton;
    lciExcluit: TdxLayoutItem;
    btnCancelar: TcxButton;
    lciCancelar: TdxLayoutItem;
    btnSalvar: TcxButton;
    lciSalvar: TdxLayoutItem;
    btnImportar: TcxButton;
    lciImportar: TdxLayoutItem;
    btnFechar: TcxButton;
    lciFechar: TdxLayoutItem;
    sbBancas: TdxStatusBar;
    lciBarraStatus: TdxLayoutItem;
    sbBancasContainer3: TdxStatusBarContainerControl;
    pbBanca: TcxProgressBar;
    lcgHistorico: TdxLayoutGroup;
    memHistorico: TcxMemo;
    lciHistorico: TdxLayoutItem;
    OpenDialog: TOpenDialog;
    procedure FormShow(Sender: TObject);
    procedure lcgHistoricoCaptionClick(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actImportarExecute(Sender: TObject);
    procedure actIncluirExecute(Sender: TObject);
    procedure actLocalizarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
  private
    { Private declarations }
    procedure ClearForm(bReadOnly: Boolean);
    procedure SetupForm;
    procedure Incluir;
    procedure Localizar;
    procedure Excluir(iID: Integer);
    procedure Cancela;
    procedure SetupBanca;
    procedure Salvar;
    procedure PopulaAuxiliares;
    procedure Importar;
    function ValidaDados(): Boolean;
  public
    { Public declarations }
    procedure Modo(sFlag: String);
    var
    bFlagImporta : Boolean;
  end;

var
  view_CadastroBanca: Tview_CadastroBanca;
  banca : TBancaVA;
  bancaTMP: TBancaVA;
  bancas : TObjectList<TBancaVA>;
  bancaDAO : TBancaVADAO;
  distribuidor : TDistribuidorVA;
  distribuidorTMP: TDistribuidorVA;
  distribuidores : TObjectList<TDistribuidorVA>;
  distribuidorDAO : TDistribuidorVADAO;
  estado : TEstados;
  estadoTMP: TEstados;
  estados : TObjectList<TEstados>;
  estadoDAO : TEstadosDAO;
  remessa : TRemessasVA;
  remessaTMP: TRemessasVA;
  remessas : TObjectList<TRemessasVA>;
  remessaDAO : TRemessasVADAO;
  thrImportaBanca : Thread_ImportaBancasJones;

implementation

{$R *.dfm}

uses udm, ufrmPesquisarPessoa, uGlobais, clUtil;

procedure Tview_CadastroBanca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dm.tbDistribuidorVA.Active then dm.tbDistribuidorVA.Close;
  if dm.tbEstados.Active then dm.tbEstados.Close;
  Action := caFree;
  view_CadastroBanca := Nil;
end;

procedure Tview_CadastroBanca.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if bFlagImporta then
  begin
    CanClose := (Application.MessageBox(
    'Processo de importação de planilha está ocorrendo neste momento! Deseja realmente sair e cancelar a importação?',
    'Atenção', MB_YESNO + MB_ICONQUESTION) = IDYES);
  end;
end;

procedure Tview_CadastroBanca.FormShow(Sender: TObject);
begin
  Modo('');
  PopulaAuxiliares;
  bFlagImporta := False;
end;

procedure Tview_CadastroBanca.lcgHistoricoCaptionClick(Sender: TObject);
begin
  if lcgHistorico.Expanded then
  begin
    lcgHistorico.Expanded := False;
  end
  else
  begin
    lcgHistorico.Expanded := True;
  end;
end;

procedure Tview_CadastroBanca.Modo(sFlag: string);
begin
  if sFlag = 'I' then
  begin
    btnIncluir.Enabled := False;
    btnLocalizar.Enabled := False;
    btnExcluir.Enabled := False;
    btnCancelar.Enabled := True;
    btnSalvar.Enabled := True;
    btnImportar.Enabled := False;
    ClearForm(True);
  end
  else if sFlag = 'E' then
  begin
    btnIncluir.Enabled := True;
    btnLocalizar.Enabled := True;
    btnExcluir.Enabled := True;
    btnCancelar.Enabled := True;
    btnSalvar.Enabled := True;
    btnImportar.Enabled := False;
    ClearForm(True);
  end
  else if sFlag = 'M' then
  begin
    btnIncluir.Enabled := False;
    btnLocalizar.Enabled := False;
    btnExcluir.Enabled := False;
    btnCancelar.Enabled := False;
    btnSalvar.Enabled := False;
    btnImportar.Enabled := False;
    btnFechar.Enabled := False;
    ClearForm(False);
  end
  else
  begin
    btnIncluir.Enabled := True;
    btnLocalizar.Enabled := True;
    btnExcluir.Enabled := False;
    btnCancelar.Enabled := False;
    btnSalvar.Enabled := False;
    btnImportar.Enabled := True;
    btnFechar.Enabled := True;
    ClearForm(False);
  end;
end;

procedure Tview_CadastroBanca.ClearForm(bReadOnly: Boolean);
begin
  mskID.Text := '0';
  mskCodigo.Text := '0';
  lcbDistribuidor.Clear;
  edtNomeBanca.Clear;
  mskCEP.Clear;
  edtEndereco.Clear;
  edtComplemento.Clear;
  edtBairro.Clear;
  edtCidade.Clear;
  lcbEstado.Clear;
  mskOrdemImpressao.Clear;
  memHistorico.Clear;
  memHistorico.Lines.Add('nenhum histórico registrado');
  mskCodigo.Properties.ReadOnly := not bReadOnly;
  lcbDistribuidor.Properties.ReadOnly := not bReadOnly;
  edtNomeBanca.Properties.ReadOnly := not bReadOnly;
  mskCEP.Properties.ReadOnly := not bReadOnly;
  edtEndereco.Properties.ReadOnly := not bReadOnly;
  edtComplemento.Properties.ReadOnly := not bReadOnly;
  edtBairro.Properties.ReadOnly := not bReadOnly;
  edtCidade.Properties.ReadOnly := not bReadOnly;
  lcbEstado.Properties.ReadOnly := not bReadOnly;
  mskOrdemImpressao.Properties.ReadOnly := not bReadOnly;
end;

procedure Tview_CadastroBanca.SetupForm;
begin
  mskID.Text := IntToStr(bancaTMP.ID);
  mskCodigo.Text := IntToStr(bancaTMP.Codigo);
  lcbDistribuidor.EditValue := bancaTMP.Distribuidor;
  edtNomeBanca.Text := bancaTMP.Nome;
  mskCEP.Text := bancaTMP.CEP;
  edtEndereco.Text := bancaTMP.Endereco;
  edtComplemento.Text := bancaTMP.Complemento;
  edtBairro.Text := bancaTMP.Bairro;
  edtCidade.Text := bancaTMP.Cidade;
  lcbEstado.Text := bancaTMP.Estado;
  mskOrdemImpressao.Text := bancaTMP.Ordem;
  memHistorico.Clear;
  memHistorico.Lines.Text := bancaTMP.Log;
end;

procedure Tview_CadastroBanca.Incluir;
begin
  Modo('I');
  mskCodigo.SetFocus;
end;

procedure Tview_CadastroBanca.Localizar;
var
  x: Integer;
  sCodigo: String;
begin
  bancaDAO := TBancaVADAO.Create();
  try
    x := 0;
    sCodigo := '';
    if not Assigned(frmPesquisarPessoa) then
    begin
      frmPesquisarPessoa := TfrmPesquisarPessoa.Create(Application);
    end;
    frmPesquisarPessoa.Caption := frmPesquisarPessoa.Caption + ' de Bancas/Ponto de Vendas';
    frmPesquisarPessoa.cboCampo.Clear;
    frmPesquisarPessoa.tvPesquisa.ClearItems;
    x := frmPesquisarPessoa.cboCampo.Properties.Items.Add('ID');
    frmPesquisarPessoa.lListaCampos.Add('ID_BANCA');
    x := frmPesquisarPessoa.cboCampo.Properties.Items.Add('Código');
    frmPesquisarPessoa.lListaCampos.Add('COD_BANCA');
    x := frmPesquisarPessoa.cboCampo.Properties.Items.Add('Nome');
    frmPesquisarPessoa.lListaCampos.Add('NOM_BANCA');
    x := frmPesquisarPessoa.cboCampo.Properties.Items.Add('CEP');
    frmPesquisarPessoa.lListaCampos.Add('NUM_CEP');
    x := frmPesquisarPessoa.cboCampo.Properties.Items.Add('Endereço');
    frmPesquisarPessoa.lListaCampos.Add('DES_ENDERECO');
    frmPesquisarPessoa.cboCampo.ItemIndex := 1;
    frmPesquisarPessoa.sTabela := 'va_Banca';
    if frmPesquisarPessoa.ShowModal = mrOk then
    begin
      ClearForm(True);
      sCodigo := frmPesquisarPessoa.qryPesquisa.Fields[1].AsString;
      bancas := bancaDAO.FindByID(StrToIntDef(sCodigo,0));
      for bancaTMP in bancas do
      begin
        Modo('E');
        SetupForm;
      end;
    end;
  finally
    bancaDAO.Free;
    FreeAndNil(frmPesquisarPessoa);
  end;
end;

procedure Tview_CadastroBanca.Excluir(iID: Integer);
begin
  try
    sbBancas.Panels[0].Text := 'Verificando. Aguarde...';
    sbBancas.Refresh;
    remessaDAO := TRemessasVADAO.Create();
    if remessaDAO.FindExistBanca(iID) then
    begin
      Application.MessageBox('Banca com remessas registradas. Impossível Excluir!', 'Atenção', MB_ICONWARNING + MB_OK);
      Exit;
    end;
    if Application.MessageBox('Confirma a exclusão desta Banca?', 'Excluir', MB_ICONQUESTION + MB_YESNO) = ID_NO then Exit;
    bancaDAO := TBancaVADAO.Create();
    if bancaDAO.Delete(iID) then Application.MessageBox('Banca excluida com sucesso!', 'Atenção', MB_ICONINFORMATION + MB_OK);
    Cancela;
  finally
    remessaDAO.Free;
    bancaDAO.Free;
    sbBancas.Panels[0].Text  := '';
    sbBancas.Refresh;
  end;
end;

procedure Tview_CadastroBanca.actCancelarExecute(Sender: TObject);
begin
  Cancela;
end;

procedure Tview_CadastroBanca.actExcluirExecute(Sender: TObject);
begin
  Excluir(StrToIntDef(mskID.Text,0));
end;

procedure Tview_CadastroBanca.actFecharExecute(Sender: TObject);
begin
  Perform(WM_CLOSE, 0, 0);
end;

procedure Tview_CadastroBanca.actImportarExecute(Sender: TObject);
begin
  Importar;
end;

procedure Tview_CadastroBanca.actIncluirExecute(Sender: TObject);
begin
  Incluir;
end;

procedure Tview_CadastroBanca.actLocalizarExecute(Sender: TObject);
begin
  Localizar;
end;

procedure Tview_CadastroBanca.actSalvarExecute(Sender: TObject);
begin
  Salvar;
end;

procedure Tview_CadastroBanca.Cancela;
begin
  Modo('');
end;

procedure Tview_CadastroBanca.SetupBanca;
var
  sLog: TStringList;
  sHistorico: String;
begin
  sLog := TStringList.Create;
  sLog.Text := memHistorico.Text;
  sHistorico := FormatDateTime('yyyy-mm-dd hh:mm:ss', Now());
  if StrToIntDef(mskID.Text,0) = 0 then
  begin
    sHistorico := sHistorico + ' inserido por ' + uGlobais.sUsuario;
  end
  else
  begin
    sHistorico := sHistorico + ' editado e alterado por ' + uGlobais.sUsuario;
  end;
  sLog.Add(sHistorico);
  banca.ID := StrToIntDef(mskID.Text,0);
  banca.Codigo := StrToIntDef(mskCodigo.Text,0);
  banca.Distribuidor := lcbDistribuidor.EditValue;
  banca.Nome := edtNomeBanca.Text;
  banca.CEP := mskCEP.Text;
  banca.Endereco := edtEndereco.Text;
  banca.Complemento := edtComplemento.Text;
  banca.Bairro := edtBairro.Text;
  banca.Cidade := edtCidade.Text;
  banca.Estado := lcbEstado.Text;
  banca.Ordem := TUtil.AlinhaD(Trim(mskOrdemImpressao.Text),10);
  banca.Log := sLog.Text;
end;

procedure Tview_CadastroBanca.Salvar;
begin
  try
    banca := TBancaVA.Create();
    bancaDAO := TBancaVADAO.Create();
    SetupBanca;
    if not ValidaDados() then Exit;
    if Application.MessageBox('Confirma salvar os dados?','Salvar', MB_YESNO + MB_ICONQUESTION) = IDNO then Exit;
    if banca.ID = 0 then
    begin
      if not bancaDAO.Insert(banca) then
      begin
        Application.MessageBox('Erro ao tentar incluir a banca!', 'Atenção', MB_OK + MB_ICONERROR);
        Exit;
      end
      else
      begin
        Application.MessageBox('Banca inserida com sucesso!', 'Inclusão', MB_OK + MB_ICONINFORMATION);
        Modo('');
      end;
    end
    else
    begin
      if not bancaDAO.Update(banca) then
      begin
        Application.MessageBox('Erro ao tentar incluir a banca!', 'Atenção', MB_OK + MB_ICONERROR);
        Exit;
      end
      else
      begin
        Application.MessageBox('Banca alterada com sucesso!', 'Alteração', MB_OK + MB_ICONINFORMATION);
        Modo('');
      end;
    end;
  finally
    banca.Free;
    bancaDAO.Free;
  end;
end;

procedure Tview_CadastroBanca.PopulaAuxiliares;
begin
  distribuidor := TDistribuidorVA.Create();
  distribuidorDAO := TDistribuidorVADAO.Create();
  estado := TEstados.Create();
  estadoDAO := TEstadosDAO.Create();
  if dm.tbDistribuidorVA.Active then dm.tbDistribuidorVA.Close;
  dm.tbDistribuidorVA.Open;
  distribuidores := distribuidorDAO.FindByID(-1);
  for distribuidorTMP in distribuidores do
  begin
    dm.tbDistribuidorVA.Insert;
    dm.tbDistribuidorVAID_DISTRIBUIDOR.AsInteger := distribuidorTMP.ID;
    dm.tbDistribuidorVACOD_DISTRIBUIDOR.AsInteger := distribuidorTMP.Codigo;
    dm.tbDistribuidorVANOM_DISTRIBUIDOR.AsString := distribuidorTMP.Nome;
    dm.tbDistribuidorVA.Post;
  end;
  if dm.tbEstados.Active then dm.tbEstados.Close;
  dm.tbEstados.Open;
  estados := estadoDAO.FindByUF('');
  for estadoTMP in estados do
  begin
    dm.tbEstados.Insert;
    dm.tbEstadosUF_ESTADO.AsString := estadoTMP.UF;
    dm.tbEstadosNOM_ESTADO.AsString := estadoTMP.Nome;
    dm.tbEstados.Post;
  end;
  estado.Free;
  estadoDAO.Free;
  distribuidor.Free;
  distribuidorDAO.Free;
end;

procedure Tview_CadastroBanca.Importar;
var
  sArquivo: String;
begin
  if OpenDialog.Execute then
  begin
    sArquivo := OpenDialog.FileName;
  end
  else
  begin
    Exit;
  end;
  if not FileExists(sArquivo) then
  begin
    Application.MessageBox(PChar('Arquivo ' + sArquivo + ' não encontrado!'), 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if Application.MessageBox('Confirma a importação da planilha?','Importar Planilha', MB_YESNO + MB_ICONQUESTION) = IDNO then Exit;
  thrImportaBanca := Thread_ImportaBancasJones.Create(True);
  thrImportaBanca.FreeOnTerminate := True;
  thrImportaBanca.Priority := tpNormal;
  thrImportaBanca.Arquivo := sArquivo;
  thrImportaBanca.Start;
end;

function Tview_CadastroBanca.ValidaDados(): Boolean;
begin
  bancaDAO := TBancaVADAO.Create;
  Result := False;
  if banca.ID = 0 then
  begin
    bancas := bancaDAO.FindByCodigo(banca.Codigo);
    if bancas.Count > 0 then
    begin
      Application.MessageBox(PChar('Código de Banca ' + IntToStr(banca.Codigo) + ' já cadastrado!'), 'Atenção', MB_OK +
                             MB_ICONWARNING);
      Exit;
    end;
  end;
  if banca.Distribuidor = 0 then
  begin
    Application.MessageBox('Informe o Distribuidor desta Banca!', 'Atenção', MB_OK +
                           MB_ICONWARNING);
    lcbDistribuidor.SetFocus;
    Exit;
  end;
  if banca.Nome.IsEmpty then
  begin
    Application.MessageBox('Informe Nome desta Banca!', 'Atenção', MB_OK +
                           MB_ICONWARNING);
    lcbDistribuidor.SetFocus;
    Exit;
  end;
  bancaDAO.Free;
  Result := True;
end;

end.
