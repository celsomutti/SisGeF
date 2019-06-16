unit ufrmCadastroUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, dxLayoutContainer, dxLayoutControl, cxContainer, cxEdit, dxLayoutcxEditAdapters, cxLabel,
  cxTextEdit, cxMaskEdit, cxButtonEdit, cxCheckBox, cxSpinEdit, cxDropDownEdit, System.Actions, Vcl.ActnList, Vcl.ComCtrls,
  cxTreeView, dxSkinsdxBarPainter, cxClasses, dxBar, Data.DB, dxmdaset, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  DAO.Usuarios, Model.Usuarios, Model.Acessos, DAO.Acessos, Vcl.Menus, System.Generics.Collections, System.DateUtils,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light;

type
  TfrmCadastroUsuarios = class(TForm)
    lcgRoot: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    lblTitulo: TcxLabel;
    lciTitulo: TdxLayoutItem;
    edtCodigo: TcxMaskEdit;
    lciCodigo: TdxLayoutItem;
    edtNome: TcxTextEdit;
    lciNome: TdxLayoutItem;
    edtLogin: TcxTextEdit;
    lciLogin: TdxLayoutItem;
    edtEMail: TcxTextEdit;
    lciEMail: TdxLayoutItem;
    edtGrupo: TcxButtonEdit;
    lciCodigoGrupo: TdxLayoutItem;
    lblGrupo: TcxLabel;
    lciNomeGrupo: TdxLayoutItem;
    lcgGrupo: TdxLayoutAutoCreatedGroup;
    chkExpiraSenha: TcxCheckBox;
    lciExpira: TdxLayoutItem;
    edtDiasExpira: TcxSpinEdit;
    lciDiasExpira: TdxLayoutItem;
    lcgNivel: TdxLayoutAutoCreatedGroup;
    cxLabel1: TcxLabel;
    lblDias: TdxLayoutItem;
    cboNivel: TcxComboBox;
    lciNivel: TdxLayoutItem;
    chkAtivo: TcxCheckBox;
    lciAtivo: TdxLayoutItem;
    aclUsuarios: TActionList;
    actIncluir: TAction;
    actSenha: TAction;
    actConsistir: TAction;
    actFechar: TAction;
    bmUsuarios: TdxBarManager;
    bmUsuariosBar1: TdxBar;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    actGravar: TAction;
    actLocalizar: TAction;
    dxBarButton5: TdxBarButton;
    dxBarButton6: TdxBarButton;
    dsAcessos: TDataSource;
    tbAcessos: TdxMemData;
    tbAcessosDOM_SELECAO: TStringField;
    tbAcessosDES_CATEGORIA: TStringField;
    tbAcessosDES_MENU: TStringField;
    tbAcessosDES_ACTION: TStringField;
    tbAcessosDES_FORM: TStringField;
    tvAcessos: TcxGridDBTableView;
    lvAcessos: TcxGridLevel;
    grdAcessos: TcxGrid;
    lciAcessos: TdxLayoutItem;
    tvAcessosRecId: TcxGridDBColumn;
    tvAcessosDOM_SELECAO: TcxGridDBColumn;
    tvAcessosDES_CATEGORIA: TcxGridDBColumn;
    tvAcessosDES_MENU: TcxGridDBColumn;
    tvAcessosDES_ACTION: TcxGridDBColumn;
    tvAcessosDES_FORM: TcxGridDBColumn;
    actUsuarioBD: TAction;
    dxBarButton7: TdxBarButton;
    popgrdAcessos: TPopupMenu;
    actSelecionarTodos: TAction;
    actDesmarcarTodos: TAction;
    SelecionarTodos1: TMenuItem;
    DemarcarTodos1: TMenuItem;
    actCancelar: TAction;
    dxBarButton8: TdxBarButton;
    chkCadastraGrupo: TcxCheckBox;
    lciCadastraCrupo: TdxLayoutItem;
    dxLayoutControl1Group1: TdxLayoutAutoCreatedGroup;
    procedure chkExpiraSenhaPropertiesChange(Sender: TObject);
    procedure chkAtivoPropertiesChange(Sender: TObject);
    procedure actIncluirExecute(Sender: TObject);
    procedure actConsistirExecute(Sender: TObject);
    procedure edtGrupoPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actLocalizarExecute(Sender: TObject);
    procedure edtGrupoPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure actUsuarioBDExecute(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure chkCadastraGrupoPropertiesChange(Sender: TObject);
    procedure actGravarExecute(Sender: TObject);
    procedure actSelecionarTodosExecute(Sender: TObject);
    procedure actDesmarcarTodosExecute(Sender: TObject);
    procedure actSenhaExecute(Sender: TObject);
  private
    { Private declarations }
    procedure PopulaAcessosPrincipal;
    procedure SelecionarTodos;
    procedure DesmarcarTodos;
    procedure SetupForm;
    procedure ClearForm;
    procedure ModoForm(bFlag: Boolean);
    procedure ConsistirGrupo;
    procedure SearchGrupo;
    procedure SearchUsuario;
    procedure SetupClass;
    procedure SalvaUsuario;
    procedure SalvaSenha;
    procedure SalvaAcessos;
    procedure ModoGrupo(bFlag: Boolean);
    function ValidaDados(): Boolean;
  public
    { Public declarations }
  end;

var
  frmCadastroUsuarios: TfrmCadastroUsuarios;
  usuarioDAO : TUsuariosDAO;
  usuario : Tusuarios;
  usuarios : TObjectList<TUsuarios>;
  usuarioTMP : TUsuarios;
  acesso : TAcesso;
  acessoDAO : TAcessosDAO;
  sSenha : String;
  sADM : String;
  sAcesso : String;
  dtSenha : TDate;
implementation

{$R *.dfm}

uses ufrmMain, clUtil, uGlobais, ufrmPesquisarPessoa, ufrmCadastraSenha, udm;

procedure TfrmCadastroUsuarios.actCancelarExecute(Sender: TObject);
begin
  inherited;
  ClearForm;
  ModoForm(True);
end;

procedure TfrmCadastroUsuarios.actConsistirExecute(Sender: TObject);
begin
  inherited;
  if StrToIntDef(edtGrupo.Text,0) = 0 then
  begin
    Application.MessageBox('Não há Grupo informado para este Usuário!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK +
                           MB_ICONEXCLAMATION);
    Exit;
  end;
  ConsistirGrupo;
end;

procedure TfrmCadastroUsuarios.actDesmarcarTodosExecute(Sender: TObject);
begin
  inherited;
  DesmarcarTodos;
end;

procedure TfrmCadastroUsuarios.actFecharExecute(Sender: TObject);
begin
  inherited;
  Perform(WM_CLOSE, 0, 0);
end;

procedure TfrmCadastroUsuarios.actGravarExecute(Sender: TObject);
begin
  inherited;
  SalvaUsuario;
end;

procedure TfrmCadastroUsuarios.actIncluirExecute(Sender: TObject);
begin
  inherited;
  ClearForm;
  PopulaAcessosPrincipal;
  ModoForm(False);
  edtNome.SetFocus;
end;

procedure TfrmCadastroUsuarios.actLocalizarExecute(Sender: TObject);
begin
  inherited;
  if chkCadastraGrupo.Checked then
  begin
    SearchGrupo;
  end
  else
  begin
    SearchUsuario;
  end;
end;

procedure TfrmCadastroUsuarios.actSelecionarTodosExecute(Sender: TObject);
begin
  inherited;
  SelecionarTodos;
end;

procedure TfrmCadastroUsuarios.actSenhaExecute(Sender: TObject);
begin
  inherited;
  SalvaSenha;
  SetupClass;
  if not usuarioDAO.Update(usuario) then
  begin
    Application.MessageBox('Falha ao alterar a senha do usuário!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK +
                           MB_ICONEXCLAMATION);
  end;
  {if not usuarioDAO.ChangePwdMySQL(usuario.Login, usuario.Senha) then
  begin
    Application.MessageBox('Falha ao alterar a senha do usuário no Banco de dados!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK +
                           MB_ICONEXCLAMATION);
  end;}
  Application.MessageBox('Senha alterada com sucesso!', 'Alteração de senha.', MB_OK + MB_ICONINFORMATION);
end;

procedure TfrmCadastroUsuarios.actUsuarioBDExecute(Sender: TObject);
begin
  inherited;
  {if usuarioDAO.ExistUserMySQL(edtLogin.Text) then
  begin
    Application.MessageBox('Usuário já credenciando no Banco de Dados!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK +
                           MB_ICONEXCLAMATION);
    Exit;
  end;}
  {if not usuarioDAO.CreateUserMySQL(edtLogin.Text,sSenha,cboNivel.ItemIndex) then
  begin
    Application.MessageBox('Falha ao credenciar o Usuário no Banco de Dados!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK +
                           MB_ICONEXCLAMATION);
    Exit;
  end;
  Application.MessageBox('Usuário credenciando no Banco de Dados!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK +
                         MB_ICONINFORMATION);}
end;

procedure TfrmCadastroUsuarios.chkAtivoPropertiesChange(Sender: TObject);
begin
  if chkAtivo.Checked then
  begin
    chkAtivo.Caption := 'Usuário ATIVO';
  end
  else
  begin
    chkAtivo.Caption := 'Usuário INATIVO';
  end;
end;

procedure TfrmCadastroUsuarios.chkCadastraGrupoPropertiesChange(Sender: TObject);
begin
  inherited;
  ModoGrupo(chkCadastraGrupo.Checked);
end;

procedure TfrmCadastroUsuarios.chkExpiraSenhaPropertiesChange(Sender: TObject);
begin
  lciDiasExpira.Enabled := chkExpiraSenha.Checked;
end;

procedure TfrmCadastroUsuarios.PopulaAcessosPrincipal;
var
  i, iUser: Integer;
  sCategoria, sCaption, sNome, sForm, sGrupo: String;
begin
  if tbAcessos.Active then
  begin
    tbAcessos.Close;
  end;
  tbAcessos.Open;
  for i := 0 to frmMain.actPrincipal.ActionCount - 1 do
  begin
    sCategoria := frmMain.actPrincipal.Actions[i].Category;
    sCaption := TUtil.ReplaceStr(TAction(frmMain.actPrincipal.Actions[i]).Caption, '&', '');
    sNome := frmMain.actPrincipal.Actions[i].Name;
    sForm := frmMain.Name;
    tbAcessos.Insert;
    tbAcessosDES_CATEGORIA.Value := sCategoria;
    tbAcessosDES_MENU.Value := sCaption;
    tbAcessosDES_ACTION.Value := sNome;
    tbAcessosDES_FORM.Value := sForm;
    tbAcessosDOM_SELECAO.Value := 'N';
    if acessoDAO.FindAcesso(sForm, sNome, edtCodigo.Text) then
    begin
      tbAcessosDOM_SELECAO.Value := 'S';
    end;
    tbAcessos.Post;
  end;
  tvAcessos.ViewData.Expand(True);
end;

procedure TfrmCadastroUsuarios.SelecionarTodos;
begin
  if tbAcessos.IsEmpty then
  begin
    Exit;
  end;
  tbAcessos.First;
  while not(tbAcessos.Eof) do
  begin
    tbAcessos.Edit;
    tbAcessosDOM_SELECAO.AsString := 'S';
    tbAcessos.Post;
    tbAcessos.Next;
  end;
  tbAcessos.First;
end;

procedure TfrmCadastroUsuarios.DesmarcarTodos;
begin
  if tbAcessos.IsEmpty then
  begin
    Exit;
  end;
  tbAcessos.First;
  while not(tbAcessos.Eof) do
  begin
    tbAcessos.Edit;
    tbAcessosDOM_SELECAO.AsString := 'N';
    tbAcessos.Post;
    tbAcessos.Next;
  end;
  tbAcessos.First;
end;

procedure TfrmCadastroUsuarios.edtGrupoPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  SearchGrupo;
end;

procedure TfrmCadastroUsuarios.edtGrupoPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  lblGrupo.Caption := usuarioDAO.FindGrupo(StrToIntDef(edtGrupo.Text, 0));
  ConsistirGrupo;
end;

procedure TfrmCadastroUsuarios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  usuario.Free;
  usuarioDAO.Free;
  Action := caFree;
  frmCadastroUsuarios := Nil;
end;

procedure TfrmCadastroUsuarios.FormShow(Sender: TObject);
begin
  inherited;
  usuarioDAO := TUsuariosDAO.Create;
  usuario := TUsuarios.Create;
  acesso := Tacesso.Create;
  acessoDAO := TAcessosDAO.Create;
  ModoForm(True);
end;

procedure TfrmCadastroUsuarios.SetupForm;
begin
  edtCodigo.Text := IntToStr(usuarioTMP.ID);
  edtNome.Text := usuarioTMP.Nome;
  edtLogin.Text := usuarioTMP.Login;
  edtEMail.Text := usuarioTMP.EMail;
  edtGrupo.Text := IntToStr(usuarioTMP.Grupo);
  lblGrupo.Caption := usuarioDAO.FindGrupo(usuarioTMP.Grupo);
  cboNivel.ItemIndex := usuarioTMP.Nivel;
  chkExpiraSenha.Checked := (usuarioTMP.Expira = 'S');
  edtDiasExpira.Value := usuarioTMP.Dias;
  chkAtivo.Checked := (usuarioTMP.Ativo = 'S');
  sSenha := usuarioTMP.Senha;
  sADM := usuarioTMP.ADM;
  dtSenha := usuarioTMP.Data;
  PopulaAcessosPrincipal;
end;

procedure TfrmCadastroUsuarios.ClearForm;
begin
  edtCodigo.Text := '0';
  edtNome.Text := '';
  edtLogin.Text := '';
  edtEMail.Text := '';
  edtGrupo.Text := '0';
  lblGrupo.Caption := '';
  cboNivel.ItemIndex := 1;
  chkExpiraSenha.Checked := False;
  edtDiasExpira.Value := 0;
  chkAtivo.Checked := False;
  sSenha := '';
  sADM := '';
  tbAcessos.Close;
end;

procedure TfrmCadastroUsuarios.ModoForm(bFlag: Boolean);
begin
  edtNome.Properties.ReadOnly := bFlag;
  edtLogin.Properties.ReadOnly := bFlag;
  edtEMail.Properties.ReadOnly := bFlag;
  edtGrupo.Properties.ReadOnly := bFlag;
  cboNivel.Properties.ReadOnly := bFlag;
  chkExpiraSenha.Properties.ReadOnly := bFlag;
  edtDiasExpira.Properties.ReadOnly := bFlag;
  chkAtivo.Properties.ReadOnly := bFlag;
  dsAcessos.AutoEdit := not (bFlag);
  actCancelar.Enabled := not (bFlag);
  actSenha.Enabled := not (bFlag);
  actConsistir.Enabled := not (bFlag);
  actUsuarioBD.Enabled := not (bFlag);
  actGravar.Enabled := not (bFlag);
end;

procedure TfrmCadastroUsuarios.ConsistirGrupo;
var
  i, iUser: Integer;
  sCategoria, sCaption, sNome, sForm, sGrupo: String;
begin
  DesmarcarTodos;
  if tbAcessos.Active then
  begin
    tbAcessos.Close;
  end;
  tbAcessos.Open;
  for i := 0 to frmMain.actPrincipal.ActionCount - 1 do
  begin
    sCategoria := frmMain.actPrincipal.Actions[i].Category;
    sCaption := TUtil.ReplaceStr(TAction(frmMain.actPrincipal.Actions[i]).Caption, '&', '');
    sNome := frmMain.actPrincipal.Actions[i].Name;
    sForm := frmMain.Name;
    tbAcessos.Insert;
    tbAcessosDES_CATEGORIA.Value := sCategoria;
    tbAcessosDES_MENU.Value := sCaption;
    tbAcessosDES_ACTION.Value := sNome;
    tbAcessosDES_FORM.Value := sForm;
    tbAcessosDOM_SELECAO.Value := 'N';
    if acessoDAO.FindAcesso(sForm, sNome, edtGrupo.Text) then
    begin
      tbAcessosDOM_SELECAO.Value := 'S';
    end;
    tbAcessos.Post;
  end;
  tvAcessos.ViewData.Expand(True);
end;

procedure TfrmCadastroUsuarios.SearchGrupo;
var
  x, Y : Integer;
  sCodigo: String;
  sNome: String;
begin
  try
    x := 0;
    sCodigo := '';
    sNome := '';
    if not Assigned(frmPesquisarPessoa) then
    begin
      frmPesquisarPessoa := TfrmPesquisarPessoa.Create(Application);
    end;
    frmPesquisarPessoa.Caption := frmPesquisarPessoa.Caption + ' de Grupo';
    frmPesquisarPessoa.cboCampo.Clear;
    frmPesquisarPessoa.tvPesquisa.ClearItems;
    x := frmPesquisarPessoa.cboCampo.Properties.Items.Add('Código');
    frmPesquisarPessoa.lListaCampos.Add('COD_USUARIO');
    x := frmPesquisarPessoa.cboCampo.Properties.Items.Add('Nome');
    frmPesquisarPessoa.lListaCampos.Add('NOM_USUARIO');
    frmPesquisarPessoa.cboCampo.ItemIndex := 1;
    frmPesquisarPessoa.sTabela := 'tbusuarios WHERE COD_GRUPO = -1';
    if frmPesquisarPessoa.ShowModal = mrOk then
    begin
      if chkCadastraGrupo.Checked then
      begin
        ClearForm;
        sCodigo := frmPesquisarPessoa.qryPesquisa.Fields[1].AsString;
        usuarios := usuarioDAO.FindByID(StrToIntDef(sCodigo,0));
        for usuarioTMP in usuarios do
        begin
          ModoForm(True);
          SetupForm;
        end;
      end
      else
      begin
        sCodigo := frmPesquisarPessoa.qryPesquisa.Fields[1].AsString;
        sNome := frmPesquisarPessoa.qryPesquisa.Fields[2].AsString;
        edtGrupo.Text := sCodigo;
        lblGrupo.Caption := sNome;
      end;
    end;
  finally
    FreeAndNil(frmPesquisarPessoa);
  end;
end;

procedure TfrmCadastroUsuarios.SearchUsuario;
var
  x, Y : Integer;
  sCodigo: String;
  sNome: String;
begin
  try
    x := 0;
    sCodigo := '';
    sNome := '';
    if not Assigned(frmPesquisarPessoa) then
    begin
      frmPesquisarPessoa := TfrmPesquisarPessoa.Create(Application);
    end;
    frmPesquisarPessoa.Caption := frmPesquisarPessoa.Caption + ' de Usuários';
    frmPesquisarPessoa.cboCampo.Clear;
    frmPesquisarPessoa.tvPesquisa.ClearItems;
    x := frmPesquisarPessoa.cboCampo.Properties.Items.Add('Código');
    frmPesquisarPessoa.lListaCampos.Add('COD_USUARIO');
    x := frmPesquisarPessoa.cboCampo.Properties.Items.Add('Nome');
    frmPesquisarPessoa.lListaCampos.Add('NOM_USUARIO');
    x := frmPesquisarPessoa.cboCampo.Properties.Items.Add('Login');
    frmPesquisarPessoa.lListaCampos.Add('DES_LOGIN');
    x := frmPesquisarPessoa.cboCampo.Properties.Items.Add('E-Mail');
    frmPesquisarPessoa.lListaCampos.Add('DES_EMAIL');
    frmPesquisarPessoa.cboCampo.ItemIndex := 1;
    frmPesquisarPessoa.sTabela := 'tbusuarios WHERE COD_GRUPO >= 0';
    if frmPesquisarPessoa.ShowModal = mrOk then
    begin
      ClearForm;
      sCodigo := frmPesquisarPessoa.qryPesquisa.Fields[1].AsString;
      usuarios := usuarioDAO.FindByID(StrToIntDef(sCodigo,0));
      for usuarioTMP in usuarios do
      begin
        ModoForm(False);
        SetupForm;
      end;
    end;
  finally
    usuarios.Free;
    FreeAndNil(frmPesquisarPessoa);
  end;
end;

procedure TfrmCadastroUsuarios.SetupClass;
begin
  usuario.ID := StrToIntDef(edtCodigo.Text,0);
  usuario.Nome := edtNome.Text;
  usuario.Login := edtLogin.Text;
  usuario.EMail := edtEMail.Text;
  usuario.Grupo := StrToIntDef(edtGrupo.Text,0);
  if not chkExpiraSenha.Checked then
  begin
    usuario.Expira := 'N';
    usuario.Dias := 0;
  end
  else
  begin
    usuario.Expira := 'S';
    usuario.Dias :=  edtDiasExpira.Value;
  end;
  if chkAtivo.Checked then
  begin
    usuario.Ativo := 'S';
  end
  else
  begin
    usuario.Ativo := 'N';
  end;
  usuario.Nivel := cboNivel.ItemIndex;
  if usuario.Nivel = 0 then
  begin
    usuario.ADM := 'S';
  end
  else
  begin
    usuario.ADM := 'N';
  end;
  if usuario.ID = 0 then
  begin
    SalvaSenha;
  end;
  usuario.Senha := sSenha;
  usuario.Acesso := sAcesso;
  usuario.Data := dtSenha;
  usuario.Executor := uGlobais.sUsuario;
  usuario.Manutencao := Now;
end;

procedure TfrmCadastroUsuarios.SalvaUsuario;
begin
  SetupClass;
  if not ValidaDados() then
  begin
    Exit;
  end;
  if Application.MessageBox('Confirma gravar os dados do Usuário?', 'Atenção!', MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  if usuario.ID = 0 then
  begin
    if usuarioDAO.Insert(usuario) then
    begin
      SalvaAcessos;
      {if not usuarioDAO.ExistUserMySQL(usuario.Login) then
      begin
        if not usuarioDAO.CreateUserMySQL(usuario.Login,usuario.Senha,usuario.Nivel) then
        begin
          Application.MessageBox('Falha ao credenciar o Usuário no Banco de Dados!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK +
                                 MB_ICONEXCLAMATION);
          Exit;
        end;
      end;}
      Application.MessageBox('Usuário criado com sucesso!', 'Atenção!', MB_OK + MB_ICONINFORMATION);
    end;
  end
  else
  begin
    if usuarioDAO.Update(usuario) then
    begin
      SalvaAcessos;
      Application.MessageBox('Usuário alterado com sucesso!', 'Atenção!', MB_OK + MB_ICONINFORMATION);
    end;
  end;
  ClearForm;
  ModoForm(True);
end;

function TfrmCadastroUsuarios.ValidaDados(): Boolean;
begin
  Result := False;
  if usuario.Nome.IsEmpty then
  begin
    Application.MessageBox('Informe o nome completo do usuário!', 'Atenção!', MB_OK + MB_ICONEXCLAMATION);
    edtNome.SetFocus;
    Exit;
  end;
  if usuario.Grupo >= 0 then
  begin
    if usuario.Login.IsEmpty then
    begin
      Application.MessageBox('Informe o login do usuário!', 'Atenção!', MB_OK + MB_ICONEXCLAMATION);
      edtLogin.SetFocus;
      Exit;
    end;
    if usuario.ID = 0 then
    begin
      if usuarioDAO.ExistUser(usuario.Login) then
      begin
        Application.MessageBox('Login já cadastrado para outro usuário!', 'Atenção!', MB_OK + MB_ICONEXCLAMATION);
        edtLogin.SetFocus;
        Exit;
      end;
      {if usuarioDAO.ExistUserMySQL(usuario.Login) then
      begin
        if Application.MessageBox('Login já Credenciando no Banco de Dados! Deseja Prosseguir?', 'Atenção!', MB_YESNO +
                                  MB_ICONQUESTION) = IDNO then
        begin
          edtLogin.SetFocus;
          Exit;
        end;
      end;}
    end;
    if usuario.EMail.IsEmpty then
    begin
      Application.MessageBox('Informe o E-Mail do usuário!', 'Atenção!', MB_OK + MB_ICONEXCLAMATION);
      edtLogin.SetFocus;
    end;
  end;
  Result := True;
end;

procedure TfrmCadastroUsuarios.SalvaSenha;
begin
  if not Assigned(frmCadastraSenha) then
  begin
    frmCadastraSenha := TfrmCadastraSenha.Create(Application);
  end;
  if frmCadastraSenha.ShowModal = mrOk then
  begin
    sSenha := frmCadastraSenha.cxSenha.Text;
    if frmCadastraSenha.cxPrimeiroAcesso.Checked then
    begin
      sAcesso := 'S';
    end
    else
    begin
      sAcesso := 'N';
    end;
    dtSenha := IncDay(Now, usuario.Dias);
    FreeAndNil(frmCadastraSenha);
  end;
end;

procedure TfrmCadastroUsuarios.SalvaAcessos;
begin
  if not(acessoDAO.Delete('WHERE COD_USUARIO = ' + IntToStr(usuario.ID))) then
  begin
    Application.MessageBox('Erro ao excluir os acessos do usuário!', 'Erro!', MB_OK + MB_ICONERROR);
    Exit;
  end;
  if tbAcessos.RecordCount > 0 then
  begin
    tbAcessos.First;
  end;
  while not(tbAcessos.Eof) do
  begin
    if tbAcessosDOM_SELECAO.AsString = 'S' then
    begin
      acesso.Form := tbAcessosDES_FORM.AsString;
      acesso.Modulo := tbAcessosDES_ACTION.AsString;
      acesso.Usuario := usuario.ID;
      if not(acessoDAO.Insert(acesso)) then
      begin
        Application.MessageBox('Erro ao incluir os acessos do usuário!', 'Erro!', MB_OK + MB_ICONERROR);
        Exit;
      end;
    end;
    tbAcessos.Next;
  end;
end;

procedure TfrmCadastroUsuarios.ModoGrupo(bFlag: Boolean);
begin
  lciLogin.Visible := not (bFlag);
  lciEMail.Visible := not (bFlag);
  lciCodigoGrupo.Visible := not (bFlag);
  lciNomeGrupo.Visible := not (bFlag);
  lciExpira.Visible := not (bFlag);
  lciDiasExpira.Visible := not (bFlag);
  lblDias.Visible := not (bFlag);
  lciNivel.Visible := not (bFlag);
  lciAtivo.Visible := not (bFlag);
  lciLogin.Visible := not (bFlag);
  actSenha.Visible := not (bFlag);
  actConsistir.Visible := not (bFlag);
  actUsuarioBD.Visible := not (bFlag);
  if bFlag then
  begin
    ClearForm;
    edtLogin.Text := '';
    edtEMail.Text := '';
    edtGrupo.Text := '-1';
    cboNivel.ItemIndex := 0;
    chkExpiraSenha.Checked := False;
    chkAtivo.Checked := True;

  end
  else
  begin
    ClearForm;
    edtLogin.Text := '';
    edtEMail.Text := '';
    edtGrupo.Text := '0';
    cboNivel.ItemIndex := 0;
    chkExpiraSenha.Checked := False;
    chkAtivo.Checked := True;
  end;
end;


end.
