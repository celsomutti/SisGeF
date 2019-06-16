unit ufrmUsuarios;

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
  dxSkinsdxBarPainter, Vcl.ActnList, dxBar, Vcl.ImgList,
  cxGraphics, cxClasses, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinscxPCPainter, cxPCdxBarPopupMenu, cxPC,
  cxContainer, cxEdit, cxTextEdit, cxLabel, cxMaskEdit, cxDropDownEdit,
  cxCheckBox, cxSpinEdit, Data.DB, dxmdaset, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxGridCustomView, cxGrid, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  clUsuarios, clAcessos, DateUtils, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxBarBuiltInMenu, System.Actions,
  clConexao;

type
  TfrmUsuarios = class(TForm)
    dxBarManager1: TdxBarManager;
    aclUsuarios: TActionList;
    cxImageList: TcxImageList;
    actUsuariosIncluir: TAction;
    actUsuariosEditar: TAction;
    actUsuariosExcluir: TAction;
    actUsuariosSalvar: TAction;
    actUsuariosCancelar: TAction;
    actUsuariosAlterarSenha: TAction;
    dxBarManager1Bar1: TdxBar;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    dxBarButton6: TdxBarButton;
    actrUsuariosSair: TAction;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxLabel1: TcxLabel;
    cxNomeUsuário: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxLogin: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxEMail: TcxTextEdit;
    dxBarButton7: TdxBarButton;
    actUsuariosLocalizar: TAction;
    cxLabel4: TcxLabel;
    cxGrupoUsuario: TcxComboBox;
    cxSenhaExpira: TcxCheckBox;
    cxLabel5: TcxLabel;
    cxDiasExpira: TcxSpinEdit;
    cxLabel6: TcxLabel;
    cxPrivilegiado: TcxCheckBox;
    dsAcessos: TDataSource;
    tbAcessos: TdxMemData;
    tbAcessosDES_CATEGORIA: TStringField;
    tbAcessosDES_MENU: TStringField;
    tbAcessosDES_ACTION: TStringField;
    tbAcessosDOM_SELECAO: TStringField;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1DOM_SELECAO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_CATEGORIA: TcxGridDBColumn;
    cxGrid1DBTableView1DES_MENU: TcxGridDBColumn;
    cxGrid1DBTableView1DES_ACTION: TcxGridDBColumn;
    dxBarButton8: TdxBarButton;
    actUsuariosSelecionarTodos: TAction;
    actUsuariosDesmarcarTodos: TAction;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxAtivo: TcxCheckBox;
    tbAcessosDES_FORM: TStringField;
    cxGrid1DBTableView1DES_FORM: TcxGridDBColumn;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxNivel: TcxSpinEdit;
    cxLabel9: TcxLabel;
    cxCodigo: TcxTextEdit;
    procedure cxSenhaExpiraPropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actUsuariosIncluirExecute(Sender: TObject);
    procedure actUsuariosEditarExecute(Sender: TObject);
    procedure actrUsuariosSairExecute(Sender: TObject);
    procedure actUsuariosExcluirExecute(Sender: TObject);
    procedure actUsuariosCancelarExecute(Sender: TObject);
    procedure actUsuariosLocalizarExecute(Sender: TObject);
    procedure actUsuariosSalvarExecute(Sender: TObject);
    procedure actUsuariosAlterarSenhaExecute(Sender: TObject);
    procedure actUsuariosSelecionarTodosExecute(Sender: TObject);
    procedure actUsuariosDesmarcarTodosExecute(Sender: TObject);
    procedure cxGrupoUsuarioPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxTabSheet2Show(Sender: TObject);
    procedure cxPrivilegiadoPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    procedure PopulaGrupos;
    procedure PopulaAcessosPrincipal;
    procedure Modo;
    procedure ListaUsuarios;
    procedure SetupForm;
    procedure SetupClass;
    procedure LimpaClass;
    function SalvaAcessos(): Boolean;
  public
    { Public declarations }
  end;

var
  frmUsuarios: TfrmUsuarios;
  sOperacao: String;
  usuario: TUsuarios;
  acessos: TAcessos;
  conexao: TConexao;

implementation

{$R *.dfm}

uses
  udm, clUtil, ufrmMain, uGlobais, ufrmListaApoio, ufrmCadastraSenha;

procedure TfrmUsuarios.actrUsuariosSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmUsuarios.actUsuariosAlterarSenhaExecute(Sender: TObject);
begin
  if not Assigned(frmCadastraSenha) then
  begin
    frmCadastraSenha := TfrmCadastraSenha.Create(Application);
  end;
  if frmCadastraSenha.ShowModal = mrOk then
  begin
    usuario.Senha := frmCadastraSenha.cxSenha.Text;
    if frmCadastraSenha.cxPrimeiroAcesso.Checked then
    begin
      usuario.Acesso := 'S';
    end
    else
    begin
      usuario.Acesso := 'N';
    end;
    usuario.DataSenha := IncDay(Now, usuario.Dias);
    FreeAndNil(frmCadastraSenha);
    if not(usuario.ChangePassword('CODIGO')) then
    begin
      Application.MessageBox('Erro ao tentar alterar a senha do usuário!',
        'Erro!', MB_OK + MB_ICONERROR);
      Exit;
    end;
    if not(usuario.Update()) then
    begin
      Application.MessageBox('Erro ao tentar alterar o primeiro acesso!',
        'Erro!', MB_OK + MB_ICONERROR);
      Exit;
    end;
    Application.MessageBox('Senha alterada com sucesso!', 'Senha Alterada',
      MB_OK + MB_ICONINFORMATION);
  end;
end;

procedure TfrmUsuarios.actUsuariosCancelarExecute(Sender: TObject);
begin
  if Application.MessageBox('Confirma cancelar a operação atual?', 'Cancelar',
    MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  TUtil.LimparFields(Self);
  LimpaClass;
  sOperacao := '';
  Modo;
end;

procedure TfrmUsuarios.actUsuariosDesmarcarTodosExecute(Sender: TObject);
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

procedure TfrmUsuarios.actUsuariosEditarExecute(Sender: TObject);
begin
  if sOperacao <> 'S' then
  begin
    Exit;
  end;
  sOperacao := 'U';
  Modo;
  cxNomeUsuário.SetFocus;
end;

procedure TfrmUsuarios.actUsuariosExcluirExecute(Sender: TObject);
begin
  if sOperacao <> 'S' then
  begin
    Exit;
  end;
  if Application.MessageBox('Confirma excluir este usuário?', 'Excluir',
    MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  if usuario.Grupo = 0 then
  begin
    acessos.usuario := usuario.Codigo;
    if not(acessos.Delete('USUARIO')) then
    begin
      Application.MessageBox('Erro ao excluir os acessos deste usuário!',
        'Erro!', MB_OK + MB_ICONERROR);
      Exit;
    end;
  end;
  if not(usuario.Delete('CODIGO')) then
  begin
    Application.MessageBox('Erro ao excluir usuário!', 'Erro!',
      MB_OK + MB_ICONERROR);
    Exit;
  end;
  Application.MessageBox('Usuário Excluído com sucesso!', 'Excluir',
    MB_OK + +MB_ICONINFORMATION);
  TUtil.LimparFields(Self);
  LimpaClass;
  sOperacao := '';
  Modo;
end;

procedure TfrmUsuarios.actUsuariosIncluirExecute(Sender: TObject);
begin
  sOperacao := 'I';
  Modo;
  TUtil.LimparFields(Self);
  cxNomeUsuário.SetFocus;
end;

procedure TfrmUsuarios.actUsuariosLocalizarExecute(Sender: TObject);
begin
  ListaUsuarios;
end;

procedure TfrmUsuarios.actUsuariosSalvarExecute(Sender: TObject);
begin
  if dsAcessos.State in [dsEdit] then
  begin
    tbAcessos.Post;
  end;
  SetupClass;
  if sOperacao = 'I' then
  begin
    usuario.Codigo := 0;
    if not Assigned(frmCadastraSenha) then
    begin
      frmCadastraSenha := TfrmCadastraSenha.Create(Application);
    end;
    if frmCadastraSenha.ShowModal = mrOk then
    begin
      usuario.Senha := frmCadastraSenha.cxSenha.Text;
      if frmCadastraSenha.cxPrimeiroAcesso.Checked then
      begin
        usuario.Acesso := 'S';
      end
      else
      begin
        usuario.Acesso := 'N';
      end;
      usuario.DataSenha := IncDay(Now, usuario.Dias);
      FreeAndNil(frmCadastraSenha);
    end;
  end;
  if not(usuario.ValidateData()) then
  begin
    Exit;
  end;
  if Application.MessageBox('Confirma salvar este usuário?', 'Salvar',
    MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  if sOperacao = 'I' then
  begin
    if not(usuario.Insert()) then
    begin
      Application.MessageBox('Erro ao tentar incluir o usuário!', 'Erro',
        MB_OK + MB_ICONERROR);
      Exit;
    end;
  end;
  if sOperacao = 'U' then
  begin
    if not(usuario.Update()) then
    begin
      Application.MessageBox('Erro ao tentar alterar o usuário!', 'Erro',
        MB_OK + MB_ICONERROR);
      Exit;
    end;
  end;
  if usuario.Grupo = 0 then
  begin
    if not(SalvaAcessos()) then
    begin
      Application.MessageBox('Erro ao tentar salvar os acessos do usuário!',
        'Erro', MB_OK + MB_ICONERROR);
      Exit;
    end;
  end;
  Application.MessageBox('Dados salvos com sucesso!', 'Salvar',
    MB_OK + MB_ICONINFORMATION);
  LimpaClass;
  sOperacao := '';
  tbAcessos.Close;
  tbAcessos.Open;
  TUtil.LimparFields(Self);
  Modo;
end;

procedure TfrmUsuarios.actUsuariosSelecionarTodosExecute(Sender: TObject);
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

procedure TfrmUsuarios.cxGrupoUsuarioPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if not(usuario.getGroup(DisplayValue, 'NOME')) then
  begin
    usuario.Grupo := 0;
  end;
end;

procedure TfrmUsuarios.cxPrivilegiadoPropertiesChange(Sender: TObject);
begin
  if cxPrivilegiado.Checked then
  begin
    cxNivel.Value := 0;
  end;

end;

procedure TfrmUsuarios.cxSenhaExpiraPropertiesChange(Sender: TObject);
begin
  if cxSenhaExpira.Checked then
  begin
    cxLabel5.Enabled := False;
    cxDiasExpira.Value := 0;
    cxDiasExpira.Enabled := False;
    cxLabel6.Enabled := False;
  end
  else
  begin
    cxLabel5.Enabled := True;
    cxDiasExpira.Value := 30;
    cxDiasExpira.Enabled := True;
    cxLabel6.Enabled := True;
  end;

end;

procedure TfrmUsuarios.cxTabSheet2Show(Sender: TObject);
begin
  if sOperacao = '' then
  begin
    Exit;
  end;
  PopulaAcessosPrincipal;
  if cxGrupoUsuario.ItemIndex <= 0 then
  begin
    cxLabel7.Caption := 'Acessos do usuário ' + cxNomeUsuário.Text;
    actUsuariosSelecionarTodos.Enabled := True;
    actUsuariosDesmarcarTodos.Enabled := True;
  end
  else
  begin
    cxLabel7.Caption := 'Acessos do Grupo ' + cxGrupoUsuario.Text;
    actUsuariosSelecionarTodos.Enabled := False;
    actUsuariosDesmarcarTodos.Enabled := False;
  end;
end;

procedure TfrmUsuarios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  usuario.Free;
  acessos.Free;
  conexao.Free;
  Action := caFree;
  frmUsuarios := Nil;
end;

procedure TfrmUsuarios.FormShow(Sender: TObject);
begin
  usuario := TUsuarios.Create;
  acessos := TAcessos.Create;
  conexao := TConexao.Create;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    actrUsuariosSairExecute(Sender);
    Exit;
  end;
  PopulaGrupos;
  sOperacao := '';
  Modo;
end;

procedure TfrmUsuarios.PopulaAcessosPrincipal;
var
  i, iUser: Integer;
  sCategoria, sCaption, sNome, sForm, sGrupo: String;
  bSelecao: Boolean;
begin
  bSelecao := False;
  if tbAcessos.Active then
  begin
    tbAcessos.Close;
  end;
  tbAcessos.Open;
  for i := 0 to frmMain.actPrincipal.ActionCount - 1 do
  begin
    sCategoria := frmMain.actPrincipal.Actions[i].Category;
    sCaption := TUtil.ReplaceStr(TAction(frmMain.actPrincipal.Actions[i])
      .Caption, '&', '');
    sNome := frmMain.actPrincipal.Actions[i].Name;
    sForm := frmMain.Name;
    tbAcessos.Insert;
    tbAcessosDES_CATEGORIA.Value := sCategoria;
    tbAcessosDES_MENU.Value := sCaption;
    tbAcessosDES_ACTION.Value := sNome;
    tbAcessosDES_FORM.Value := sForm;
    tbAcessosDOM_SELECAO.Value := 'N';
    acessos.Formulario := sForm;
    acessos.Modulo := sNome;
    if usuario.Codigo = 0 then
    begin
      if cxGrupoUsuario.ItemIndex > 0 then
      begin
        usuario.Nome := cxGrupoUsuario.Text;
        sGrupo := usuario.getField('COD_USUARIO', 'NOME');
        acessos.usuario := StrToInt(sGrupo);
        bSelecao := True;
      end;
    end
    else
    begin
      if usuario.Grupo = 0 then
      begin
        acessos.usuario := usuario.Codigo;
      end
      else
      begin
        acessos.usuario := usuario.Grupo;
        bSelecao := True;
      end;
    end;
    if acessos.getAcessos('CHAVE') then
    begin
      tbAcessosDOM_SELECAO.Value := 'S';
    end
    else
    begin
      tbAcessosDOM_SELECAO.Value := 'N';
    end;
    tbAcessos.Post;
  end;
  cxGrid1DBTableView1DOM_SELECAO.Properties.ReadOnly := bSelecao;
  actUsuariosSelecionarTodos.Enabled := not(bSelecao);
  actUsuariosDesmarcarTodos.Enabled := not(bSelecao);
  cxGrid1DBTableView1.ViewData.Expand(True);
end;

procedure TfrmUsuarios.Modo;
begin
  if TUtil.Empty(sOperacao) then
  begin
    cxPageControl1.ActivePageIndex := 0;
    actUsuariosIncluir.Enabled := True;
    actUsuariosEditar.Enabled := False;
    actUsuariosExcluir.Enabled := False;
    actUsuariosSalvar.Enabled := False;
    actUsuariosCancelar.Enabled := False;
    actUsuariosAlterarSenha.Enabled := False;
    actrUsuariosSair.Enabled := True;
    actUsuariosLocalizar.Enabled := True;
    cxTabSheet1.Enabled := False;
    cxTabSheet2.Enabled := False;
  end
  else if sOperacao = 'I' then
  begin
    cxPageControl1.ActivePageIndex := 0;
    actUsuariosIncluir.Enabled := False;
    actUsuariosEditar.Enabled := False;
    actUsuariosExcluir.Enabled := False;
    actUsuariosSalvar.Enabled := True;
    actUsuariosCancelar.Enabled := True;
    actUsuariosAlterarSenha.Enabled := False;
    actrUsuariosSair.Enabled := True;
    actUsuariosLocalizar.Enabled := False;
    cxTabSheet1.Enabled := True;
    cxTabSheet2.Enabled := True;
  end
  else if sOperacao = 'U' then
  begin
    cxPageControl1.ActivePageIndex := 0;
    actUsuariosIncluir.Enabled := False;
    actUsuariosEditar.Enabled := False;
    actUsuariosExcluir.Enabled := False;
    actUsuariosSalvar.Enabled := True;
    actUsuariosCancelar.Enabled := True;
    actUsuariosAlterarSenha.Enabled := False;
    actrUsuariosSair.Enabled := True;
    actUsuariosLocalizar.Enabled := False;
    cxTabSheet1.Enabled := True;
    cxTabSheet2.Enabled := True;
  end
  else if sOperacao = 'S' then
  begin
    cxPageControl1.ActivePageIndex := 0;
    actUsuariosIncluir.Enabled := False;
    actUsuariosEditar.Enabled := True;
    actUsuariosExcluir.Enabled := True;
    actUsuariosSalvar.Enabled := False;
    actUsuariosCancelar.Enabled := True;
    actUsuariosAlterarSenha.Enabled := True;
    actrUsuariosSair.Enabled := True;
    actUsuariosLocalizar.Enabled := True;
    cxTabSheet1.Enabled := False;
    cxTabSheet2.Enabled := False;
  end;
end;

procedure TfrmUsuarios.ListaUsuarios;
var
  sId: String;
begin
  sId := '';
  if not(usuario.ListSearch('USUARIO')) then
  begin
    Application.MessageBox('Nenhum usuário cadastrado!', 'Atenção',
      MB_OK + MB_ICONWARNING);
    Exit;
  end;
  dm.qryPesquisa.First;
  if not Assigned(frmListaApoio) then
  begin
    frmListaApoio := TfrmListaApoio.Create(Application);
  end;
  frmListaApoio.Caption := 'Usuários';
  if frmListaApoio.ShowModal = mrOk then
  begin
    sId := dm.qryPesquisa.Fields[1].AsString;
    dm.qryPesquisa.Close;
    dm.qryPesquisa.SQL.Clear;
    if usuario.getObject(sId, 'LOGIN') then
    begin
      SetupForm;
      sOperacao := 'S';
      Modo;
    end
    else
    begin
      Application.MessageBox('Erro ao tentar localizar o usuário!', 'Erro!',
        MB_OK + MB_ICONERROR);
    end;
  end;
  FreeAndNil(frmListaApoio);
end;

procedure TfrmUsuarios.SetupForm;
var
  sGrupo: String;
begin
  cxCodigo.Text := IntToStr(usuario.Codigo);
  cxNomeUsuário.Text := usuario.Nome;
  cxLogin.Text := usuario.Login;
  cxEMail.Text := usuario.EMail;
  cxDiasExpira.Value := usuario.Dias;
  cxSenhaExpira.Checked := (usuario.Expira = 'N');
  cxPrivilegiado.Checked := (usuario.Privilegio = 'S');
  cxAtivo.Checked := (usuario.Ativo = 'S');
  sGrupo := usuario.getField('NOM_USUARIO', 'GRUPO');
  cxGrupoUsuario.Text := sGrupo;
  cxNivel.Value := usuario.Nivel;
  PopulaAcessosPrincipal;
  if usuario.Grupo = 0 then
  begin
    cxLabel7.Caption := 'Acessos do usuário ' + usuario.Nome;
    actUsuariosSelecionarTodos.Enabled := True;
    actUsuariosDesmarcarTodos.Enabled := True;
  end
  else
  begin
    cxLabel7.Caption := 'Acessos do Grupo ' + sGrupo;
    actUsuariosSelecionarTodos.Enabled := False;
    actUsuariosDesmarcarTodos.Enabled := False;
  end;
end;

procedure TfrmUsuarios.PopulaGrupos;
begin
  cxGrupoUsuario.Properties.Items.Clear;
  cxGrupoUsuario.Properties.Items.Add('NENHUM');
  if usuario.ListSearch('GRUPO') then
  begin
    dm.qryPesquisa.First;
    while not(dm.qryPesquisa.Eof) do
    begin
      cxGrupoUsuario.Properties.Items.Add(dm.qryPesquisa.Fields[0].AsString);
      dm.qryPesquisa.Next;
    end;
    dm.qryPesquisa.Close;
    dm.qryPesquisa.SQL.Clear;
  end;
end;

procedure TfrmUsuarios.SetupClass;
begin
  usuario.Nome := cxNomeUsuário.Text;
  usuario.Login := cxLogin.Text;
  usuario.EMail := cxEMail.Text;
  if cxGrupoUsuario.ItemIndex > 0 then
  begin
    if not(usuario.getGroup(cxGrupoUsuario.Text, 'NOME')) then
    begin
      Application.MessageBox('Erro ao consolidar o Grupo do Usuário!', 'Erro!',
        MB_OK + MB_ICONERROR);
      Exit;
    end;
  end
  else
  begin
    usuario.Grupo := 0;
  end;
  if cxPrivilegiado.Checked then
  begin
    usuario.Privilegio := 'S';
  end
  else
  begin
    usuario.Privilegio := 'N';
  end;
  if cxSenhaExpira.Checked then
  begin
    usuario.Expira := 'N';
    usuario.Dias := 0;
  end
  else
  begin
    usuario.Expira := 'S';
    usuario.Dias := cxDiasExpira.Value;
  end;
  if cxAtivo.Checked then
  begin
    usuario.Ativo := 'S';
  end
  else
  begin
    usuario.Ativo := 'N';
  end;
  usuario.Nivel := cxNivel.Value;
  usuario.Executor := uGlobais.sUsuario;
  usuario.Manutencao := Now;
end;

function TfrmUsuarios.SalvaAcessos(): Boolean;
begin
  try
    Result := False;
    acessos.usuario := usuario.Codigo;
    if not(acessos.Delete('USUARIO')) then
    begin
      Application.MessageBox('Erro ao excluir os acessos do usuário!', 'Erro!',
        MB_OK + MB_ICONERROR);
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
        acessos.Formulario := tbAcessosDES_FORM.AsString;
        acessos.Modulo := tbAcessosDES_ACTION.AsString;
        if not(acessos.Insert()) then
        begin
          Application.MessageBox('Erro ao incluir os acessos do usuário!',
            'Erro!', MB_OK + MB_ICONERROR);
          Exit;
        end;
      end;
      tbAcessos.Next;
    end;
    Result := True;
  except
    on E: Exception do
    begin
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

procedure TfrmUsuarios.LimpaClass;
begin
  usuario.Codigo := 0;
  usuario.Nome := '';
  usuario.Login := '';
  usuario.EMail := '';
  usuario.Senha := '';
  usuario.Grupo := 0;
  usuario.Privilegio := 'N';
  usuario.Expira := 'S';
  usuario.Dias := 0;
  usuario.Acesso := 'N';
  usuario.Ativo := 'S';
  usuario.Executor := 'SISTEMA';
  acessos.Formulario := '';
  acessos.Modulo := '';
  acessos.usuario := 0;

end;

end.
