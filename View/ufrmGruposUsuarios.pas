unit ufrmGruposUsuarios;

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
  dxSkinscxPCPainter,  cxPC,
  cxContainer, cxEdit, cxTextEdit, cxLabel, cxMaskEdit, cxDropDownEdit,
  cxCheckBox, cxSpinEdit, Data.DB, dxmdaset, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxGridCustomView, cxGrid, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  clUsuarios, clAcessos, DateUtils, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxBarBuiltInMenu, System.Actions,
  clConexao, dxDateRanges, cxDataControllerConditionalFormattingRulesManagerDialog, System.ImageList, cxImageList;

type
  TfrmGruposUsuarios = class(TForm)
    dxBarManager1: TdxBarManager;
    aclUsuarios: TActionList;
    cxImageList: TcxImageList;
    actUsuariosIncluir: TAction;
    actUsuariosEditar: TAction;
    actUsuariosExcluir: TAction;
    actUsuariosSalvar: TAction;
    actUsuariosCancelar: TAction;
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
    dxBarButton7: TdxBarButton;
    actUsuariosLocalizar: TAction;
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
    tbAcessosDES_FORM: TStringField;
    cxGrid1DBTableView1DES_FORM: TcxGridDBColumn;
    cxLabel7: TcxLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actUsuariosIncluirExecute(Sender: TObject);
    procedure actUsuariosEditarExecute(Sender: TObject);
    procedure actrUsuariosSairExecute(Sender: TObject);
    procedure actUsuariosExcluirExecute(Sender: TObject);
    procedure actUsuariosCancelarExecute(Sender: TObject);
    procedure actUsuariosLocalizarExecute(Sender: TObject);
    procedure actUsuariosSalvarExecute(Sender: TObject);
    procedure actUsuariosSelecionarTodosExecute(Sender: TObject);
    procedure actUsuariosDesmarcarTodosExecute(Sender: TObject);
  private
    { Private declarations }
    procedure PopulaAcessosPrincipal;
    procedure Modo;
    procedure ListaUsuarios;
    procedure SetupForm;
    procedure SetupClass;
    function SalvaAcessos(): Boolean;
  public
    { Public declarations }
  end;

var
  frmGruposUsuarios: TfrmGruposUsuarios;
  sOperacao: String;
  usuario: TUsuarios;
  acessos: TAcessos;
  conexao: TConexao;

implementation

{$R *.dfm}

uses
  udm, clUtil, ufrmMain, uGlobais, ufrmListaApoio, ufrmCadastraSenha;

procedure TfrmGruposUsuarios.actrUsuariosSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmGruposUsuarios.actUsuariosCancelarExecute(Sender: TObject);
begin
  if Application.MessageBox('Confirma cancelar a operação atual?', 'Cancelar',
    MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  TUtil.LimparFields(Self);
  sOperacao := '';
  Modo;
end;

procedure TfrmGruposUsuarios.actUsuariosDesmarcarTodosExecute(Sender: TObject);
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

procedure TfrmGruposUsuarios.actUsuariosEditarExecute(Sender: TObject);
begin
  if sOperacao <> 'S' then
  begin
    Exit;
  end;
  sOperacao := 'U';
  Modo;
  cxNomeUsuário.SetFocus;
end;

procedure TfrmGruposUsuarios.actUsuariosExcluirExecute(Sender: TObject);
begin
  if sOperacao <> 'S' then
  begin
    Exit;
  end;
  if Application.MessageBox('Confirma excluir este grupo?', 'Excluir',
    MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  acessos.usuario := usuario.Codigo;
  if not(acessos.Delete('USUARIO')) then
  begin
    Application.MessageBox('Erro ao excluir os acessos deste grupo!', 'Erro!',
      MB_OK + MB_ICONERROR);
    Exit;
  end;
  if not(usuario.Delete('CODIGO')) then
  begin
    Application.MessageBox('Erro ao excluir o grupo!', 'Erro!',
      MB_OK + MB_ICONERROR);
    Exit;
  end;
  Application.MessageBox('Grupo Excluído com sucesso!', 'Excluir',
    MB_OK + +MB_ICONINFORMATION);
  TUtil.LimparFields(Self);
  sOperacao := '';
  Modo;
end;

procedure TfrmGruposUsuarios.actUsuariosIncluirExecute(Sender: TObject);
begin
  sOperacao := 'I';
  Modo;
  TUtil.LimparFields(Self);
  PopulaAcessosPrincipal;
  cxNomeUsuário.SetFocus;
end;

procedure TfrmGruposUsuarios.actUsuariosLocalizarExecute(Sender: TObject);
begin
  ListaUsuarios;
end;

procedure TfrmGruposUsuarios.actUsuariosSalvarExecute(Sender: TObject);
begin
  if dsAcessos.State in [dsEdit] then
  begin
    tbAcessos.Post;
  end;
  SetupClass;
  if sOperacao = 'I' then
  begin
    usuario.Codigo := 0;
  end;
  if not(usuario.ValidateData()) then
  begin
    Exit;
  end;
  if Application.MessageBox('Confirma salvar este Grupo?', 'Salvar',
    MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  if sOperacao = 'I' then
  begin
    if not(usuario.Insert()) then
    begin
      Application.MessageBox('Erro ao tentar incluir o grupo!', 'Erro',
        MB_OK + MB_ICONERROR);
      Exit;
    end;
  end;
  if sOperacao = 'U' then
  begin
    if not(usuario.Update()) then
    begin
      Application.MessageBox('Erro ao tentar alterar o grupo!', 'Erro',
        MB_OK + MB_ICONERROR);
      Exit;
    end;
  end;
  if not(SalvaAcessos()) then
  begin
    Application.MessageBox('Erro ao tentar salvar os acessos do grupo!', 'Erro',
      MB_OK + MB_ICONERROR);
    Exit;
  end;
  Application.MessageBox('Dados salvos com sucesso!', 'Salvar',
    MB_OK + MB_ICONINFORMATION);
  sOperacao := '';
  tbAcessos.Close;
  tbAcessos.Open;
  TUtil.LimparFields(Self);
  Modo;
end;

procedure TfrmGruposUsuarios.actUsuariosSelecionarTodosExecute(Sender: TObject);
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

procedure TfrmGruposUsuarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  usuario.Free;
  acessos.Free;
  conexao.Free;
  Action := caFree;
  frmGruposUsuarios := Nil;
end;

procedure TfrmGruposUsuarios.FormShow(Sender: TObject);
begin
  usuario := TUsuarios.Create;
  acessos := TAcessos.Create;
  conexao := TConexao.Create;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    actrUsuariosSairExecute(Sender);
    Exit;
  end;

  sOperacao := '';
  Modo;
end;

procedure TfrmGruposUsuarios.PopulaAcessosPrincipal;
var
  i, iUser: Integer;
  sCategoria, sCaption, sNome, sForm: String;
begin
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
    acessos.Formulario := sForm;
    acessos.Modulo := sNome;
    acessos.usuario := usuario.Codigo;
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
  cxGrid1DBTableView1.ViewData.Expand(True);
end;

procedure TfrmGruposUsuarios.Modo;
begin
  if TUtil.Empty(sOperacao) then
  begin
    cxPageControl1.ActivePageIndex := 0;
    actUsuariosIncluir.Enabled := True;
    actUsuariosEditar.Enabled := False;
    actUsuariosExcluir.Enabled := False;
    actUsuariosSalvar.Enabled := False;
    actUsuariosCancelar.Enabled := False;
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
    actrUsuariosSair.Enabled := True;
    actUsuariosLocalizar.Enabled := True;
    cxTabSheet1.Enabled := False;
    cxTabSheet2.Enabled := False;
  end;
end;

procedure TfrmGruposUsuarios.ListaUsuarios;
var
  sId: String;
begin
  sId := '';
  if not(usuario.ListSearch('GRUPO')) then
  begin
    Application.MessageBox('Nenhum Grupo cadastrado!', 'Atenção',
      MB_OK + MB_ICONWARNING);
    Exit;
  end;
  dm.qryPesquisa.First;
  if not Assigned(frmListaApoio) then
  begin
    frmListaApoio := TfrmListaApoio.Create(Application);
  end;
  frmListaApoio.Caption := 'Grupos';
  if frmListaApoio.ShowModal = mrOk then
  begin
    sId := dm.qryPesquisa.Fields[0].AsString;
    dm.qryPesquisa.Close;
    dm.qryPesquisa.SQL.Clear;
    if usuario.getObject(sId, 'NOME') then
    begin
      SetupForm;
      sOperacao := 'S';
      Modo;
    end
    else
    begin
      Application.MessageBox('Erro ao tentar localizar o Grupo!', 'Erro!',
        MB_OK + MB_ICONERROR);
    end;
  end;
  FreeAndNil(frmListaApoio);
end;

procedure TfrmGruposUsuarios.SetupForm;
begin
  cxNomeUsuário.Text := usuario.Nome;
  PopulaAcessosPrincipal;
  cxLabel7.Caption := 'Acessos do Grupo ' + cxNomeUsuário.Text;
end;

procedure TfrmGruposUsuarios.SetupClass;
begin
  usuario.Nome := cxNomeUsuário.Text;
  usuario.Login := '';
  usuario.EMail := '';
  usuario.Senha := 'senha';
  usuario.Grupo := -1;
  usuario.Privilegio := 'N';
  usuario.Expira := 'N';
  usuario.Dias := 0;
  usuario.Ativo := 'S';
  usuario.Executor := uGlobais.sUsuario;
  usuario.Manutencao := Now;
end;

function TfrmGruposUsuarios.SalvaAcessos(): Boolean;
begin
  try
    Result := False;
    acessos.usuario := usuario.Codigo;
    if not(acessos.Delete('USUARIO')) then
    begin
      Application.MessageBox('Erro ao excluir os acessos do Grupo!', 'Erro!',
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
          Application.MessageBox('Erro ao incluir os acessos do grupo!',
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

end.
