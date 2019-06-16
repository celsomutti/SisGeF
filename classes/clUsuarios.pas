unit clUsuarios;

interface

uses clConexao;

type
  TUsuarios = Class(TObject)
  private
    function getAcesso: String;
    function getCodigo: Integer;
    function getDias: Integer;
    function getEMail: String;
    function getExpira: String;
    function getGrupo: Integer;
    function getLogin: String;
    function getNome: String;
    function getPrivilegio: String;
    function getSenha: Variant;
    procedure setAcesso(const Value: String);
    procedure setCodigo(const Value: Integer);
    procedure setDias(const Value: Integer);
    procedure setEMail(const Value: String);
    procedure setExpira(const Value: String);
    procedure setGrupo(const Value: Integer);
    procedure setLogin(const Value: String);
    procedure setNome(const Value: String);
    procedure setPrivilegio(const Value: String);
    procedure setSenha(const Value: Variant);
    function getAtivo: String;
    procedure setAtivo(const Value: String);
    function getExecutor: String;
    function getManutencao: TDateTime;
    procedure setExecutor(const Value: String);
    procedure setManutencao(const Value: TDateTime);
    function getDataSenha: TDate;
    procedure setDataSenha(const Value: TDate);
    function getNivel: Integer;
    procedure setNivel(const Value: Integer);
    constructor Create;
    destructor Destroy;
  protected
    _codigo: Integer;
    _nome: String;
    _login: String;
    _email: String;
    _senha: Variant;
    _grupo: Integer;
    _privilegio: String;
    _expira: String;
    _dias: Integer;
    _acesso: String;
    _ativo: String;
    _datasenha: TDate;
    _nivel: Integer;
    _executor: String;
    _manutencao: TDateTime;
    _conexao: TConexao;
  public
    property Codigo: Integer read getCodigo write setCodigo;
    property Nome: String read getNome write setNome;
    property Login: String read getLogin write setLogin;
    property EMail: String read getEMail write setEMail;
    property Senha: Variant read getSenha write setSenha;
    property Grupo: Integer read getGrupo write setGrupo;
    property Privilegio: String read getPrivilegio write setPrivilegio;
    property Expira: String read getExpira write setExpira;
    property Dias: Integer read getDias write setDias;
    property Acesso: String read getAcesso write setAcesso;
    property Ativo: String read getAtivo write setAtivo;
    property DataSenha: TDate read getDataSenha write setDataSenha;
    property Nivel: Integer read getNivel write setNivel;
    property Executor: String read getExecutor write setExecutor;
    property Manutencao: TDateTime read getManutencao write setManutencao;

    procedure MaxCod;

    function ValidateData(): Boolean;
    function Exist(filtro: String): Boolean;
    function getObject(id, filtro: String): Boolean;
    function getObjects(): Boolean;
    function getField(campo, coluna: String): String;
    function Insert(): Boolean;
    function Update(): Boolean;
    function Delete(filtro: String): Boolean;
    function ValidatePassword(Login, Senha: String): Boolean;
    function ChangePassword(filtro: String): Boolean;
    function ListSearch(filtro: String): Boolean;
    function getGroup(id, filtro: String): Boolean;
  end;

const
  TABLENAME = 'tbusuarios';
  CHAVE = 'ABCDEFGHIJ0987654321KLMNOPQRSTUVXZ0123456789';

implementation

{ TUsuarios }

uses SysUtils, udm, clUtil, VCL.Dialogs;

constructor TUsuarios.Create;
begin
  _conexao := TConexao.Create;
  if (not _conexao.VerifyConnZEOS(0)) then
  begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
      Self.ClassName + ') !', mtError, [mbCancel], 0);
  end;
end;

destructor TUsuarios.Destroy;
begin
  _conexao.Free;
end;

function TUsuarios.getAcesso: String;
begin
  Result := _acesso;
end;

function TUsuarios.getAtivo: String;
begin
  Result := _ativo;
end;

function TUsuarios.getCodigo: Integer;
begin
  Result := _codigo;
end;

function TUsuarios.getDataSenha: TDate;
begin
  Result := _datasenha;
end;

function TUsuarios.getDias: Integer;
begin
  Result := _dias;
end;

function TUsuarios.getEMail: String;
begin
  Result := _email;
end;

function TUsuarios.getExecutor: String;
begin
  Result := _executor;
end;

function TUsuarios.getExpira: String;
begin
  Result := _expira;
end;

function TUsuarios.getGrupo: Integer;
begin
  Result := _grupo;
end;

function TUsuarios.getLogin: String;
begin
  Result := _login;
end;

function TUsuarios.getManutencao: TDateTime;
begin
  Result := _manutencao;
end;

function TUsuarios.getNivel: Integer;
begin
  Result := _nivel;
end;

function TUsuarios.getNome: String;
begin
  Result := _nome;
end;

function TUsuarios.getPrivilegio: String;
begin
  Result := _privilegio;
end;

function TUsuarios.getSenha: Variant;
begin
  Result := _senha;
end;

procedure TUsuarios.MaxCod;
begin
  try
    with dm.qryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT MAX(COD_USUARIO) AS CODIGO FROM ' + TABLENAME;
      dm.ZConn.PingServer;
      Open;
      if IsEmpty then
      begin
        Self.Codigo := 1;
      end
      else
      begin
        Self.Codigo := FieldByName('CODIGO').AsInteger + 1;
      end;
      Close;
      SQL.Clear;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

function TUsuarios.Exist(filtro: String): Boolean;
begin
  try
    Result := False;
    with dm.qryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT COD_USUARIO, DES_LOGIN FROM ' + TABLENAME);
      if filtro = 'CODIGO' then
      begin
        SQL.Add('WHERE COD_USUARIO = :CODIGO');
        ParamByName('CODIGO').AsInteger := Self.Codigo;
      end;
      if filtro = 'NOME' then
      begin
        SQL.Add('WHERE NOM_USUARIO = :NOME');
        ParamByName('NOME').AsString := Self.Nome;
      end;
      if filtro = 'LOGIN' then
      begin
        SQL.Add('WHERE DES_LOGIN = :LOGIN');
        ParamByName('LOGIN').AsString := Self.Nome;
      end;
      dm.ZConn.PingServer;
      Open;
      if not(IsEmpty) then
      begin
        Result := True;
      end;
      Close;
      SQL.Clear;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

function TUsuarios.getObject(id, filtro: String): Boolean;
begin
  try
    Result := False;
    with dm.qryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);
      if filtro = 'CODIGO' then
      begin
        SQL.Add('WHERE COD_USUARIO = :CODIGO');
        ParamByName('CODIGO').AsInteger := StrToInt(id);
      end;
      if filtro = 'NOME' then
      begin
        SQL.Add('WHERE NOM_USUARIO = :NOME');
        ParamByName('NOME').AsString := id;
      end;
      if filtro = 'LOGIN' then
      begin
        SQL.Add('WHERE DES_LOGIN = :LOGIN');
        ParamByName('LOGIN').AsString := id;
      end;
      if filtro = 'GRUPO' then
      begin
        SQL.Add('WHERE COD_GRUPO = :GRUPO');
        ParamByName('GRUPO').AsInteger := StrToInt(id);
      end;
      dm.ZConn.PingServer;
      Open;
      if IsEmpty then
      begin
        Close;
        SQL.Clear;
        Exit;
      end;
      Self.Codigo := FieldByName('COD_USUARIO').AsInteger;
      Self.Nome := FieldByName('NOM_USUARIO').AsString;
      Self.Login := FieldByName('DES_LOGIN').AsString;
      Self.EMail := FieldByName('DES_EMAIL').AsString;
      Self.Senha := ''; // FieldByName('DES_SENHA').AsString;
      Self.Grupo := FieldByName('COD_GRUPO').AsInteger;
      Self.Privilegio := FieldByName('DOM_PRIVILEGIO').AsString;
      Self.Expira := FieldByName('DOM_EXPIRA').AsString;
      Self.Dias := FieldByName('QTD_DIAS_EXPIRA').AsInteger;
      Self.Acesso := FieldByName('DOM_PRIMEIRO_ACESSO').AsString;
      Self.Ativo := FieldByName('DOM_ATIVO').AsString;
      Self.DataSenha := FieldByName('DAT_SENHA').AsDateTime;
      Self.Nivel := FieldByName('COD_NIVEL').AsInteger;
      Self.Executor := FieldByName('NOM_EXECUTOR').AsString;
      Self.Manutencao := FieldByName('DAT_MANUTENCAO').AsDateTime;
      if RecordCount = 1 then
      begin
        Close;
        SQL.Clear;
      end;
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

function TUsuarios.ValidateData(): Boolean;
begin
  try
    Result := False;
    if TUtil.Empty(Self.Nome) then
    begin
      MessageDlg('Informe o Nome Completo do Usuário!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if TUtil.Empty(Self.Login) then
    begin
      if Self.Grupo >= 0 then
      begin
        MessageDlg('Informe o Login do Usuário!', mtWarning, [mbOK], 0);
        Exit;
      end;
    end;
    if TUtil.Empty(Self.Senha) then
    begin
      if Self.Grupo >= 0 then
      begin
        if Self.Codigo = 0 then
        begin
          MessageDlg('Informe a Senha do Usuário!', mtWarning, [mbOK], 0);
          Exit;
        end;
      end;
    end;
    if Self.Grupo >= 0 then
    begin
      if Self.Expira = 'S' then
      begin
        if Self.Dias = 0 then
        begin
          MessageDlg('Informe o número de dias para expirar a senha!',
            mtWarning, [mbOK], 0);
          Exit;
        end;
      end;
    end;
    if Self.Codigo = 0 then
    begin
      if Exist('NOME') then
      begin
        MessageDlg('Nome de Usuário já Cadastrado!', mtWarning, [mbOK], 0);
        Exit;
      end;
      if Self.Grupo >= 0 then
      begin
        if Exist('LOGIN') then
        begin
          MessageDlg('Login de Usuário já Cadastrado!', mtWarning, [mbOK], 0);
          Exit;
        end;
      end;
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

function TUsuarios.getField(campo: string; coluna: string): String;
begin
  try
    Result := '';
    if TUtil.Empty(campo) then
    begin
      Exit;
    end;
    if TUtil.Empty(coluna) then
    begin
      Exit;
    end;
    with dm.qryFields do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT (' + campo + ') AS CAMPO FROM ' + TABLENAME);
      if coluna = 'CODIGO' then
      begin
        SQL.Add('WHERE COD_USUARIO = :CODIGO');
        ParamByName('CODIGO').AsInteger := Self.Codigo;
      end;
      if coluna = 'NOME' then
      begin
        SQL.Add('WHERE NOM_USUARIO = :NOME');
        ParamByName('NOME').AsString := Self.Nome;
      end;
      if coluna = 'LOGIN' then
      begin
        SQL.Add('WHERE DES_LOGIN = :LOGIN');
        ParamByName('LOGIN').AsString := Self.Login;
      end;
      if coluna = 'GRUPO' then
      begin
        SQL.Add('WHERE COD_USUARIO = :GRUPO');
        ParamByName('GRUPO').AsInteger := Self.Grupo;
      end;
      dm.ZConn.PingServer;
      Open;
      if IsEmpty then
      begin
        Close;
        SQL.Clear;
        Exit;
      end;
      Result := FieldByName('CAMPO').AsString;
      Close;
      SQL.Clear;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

function TUsuarios.Insert(): Boolean;
begin
  try
    Result := False;
    with dm.qryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'INSERT INTO ' + TABLENAME + ' (' + 'COD_USUARIO, ' +
        'NOM_USUARIO, ' + 'DES_LOGIN, ' + 'DES_EMAIL, ' + 'DES_SENHA, ' +
        'COD_GRUPO, ' + 'DOM_PRIVILEGIO, ' + 'DOM_EXPIRA, ' +
        'QTD_DIAS_EXPIRA, ' + 'DOM_PRIMEIRO_ACESSO, ' + 'DOM_ATIVO, ' +
        'DAT_SENHA, ' + 'COD_NIVEL, ' + 'NOM_EXECUTOR, ' + 'DAT_MANUTENCAO) ' +
        'VALUES(' + ':CODIGO, ' + ':NOME, ' + ':LOGIN, ' + ':EMAIL, ' +
        'AES_ENCRYPT(:SENHA,:CHAVE), ' + ':GRUPO, ' + ':PRIVILEGIO, ' +
        ':EXPIRA, ' + ':DIAS, ' + ':ACESSO, ' + ':ATIVO, ' + ':DATASENHA, ' +
        ':NIVEL, ' + ':EXECUTOR, ' + ':MANUTENCAO)';
      MaxCod;
      ParamByName('CODIGO').AsInteger := Self.Codigo;
      ParamByName('NOME').AsString := Self.Nome;
      ParamByName('LOGIN').AsString := Self.Login;
      ParamByName('EMAIL').AsString := Self.EMail;
      ParamByName('SENHA').AsString := Self.Senha;
      ParamByName('GRUPO').AsInteger := Self.Grupo;
      ParamByName('PRIVILEGIO').AsString := Self.Privilegio;
      ParamByName('EXPIRA').AsString := Self.Expira;
      ParamByName('DIAS').AsInteger := Self.Dias;
      ParamByName('ACESSO').AsString := Self.Acesso;
      ParamByName('ATIVO').AsString := Self.Ativo;
      ParamByName('DATASENHA').AsDate := Self.DataSenha;
      ParamByName('NIVEL').AsInteger := Self.Nivel;
      ParamByName('EXECUTOR').AsString := Self.Executor;
      ParamByName('MANUTENCAO').AsDateTime := Self.Manutencao;
      ParamByName('CHAVE').AsString := CHAVE;
      dm.ZConn.PingServer;
      ExecSQL;
      Close;
      SQL.Clear;
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

function TUsuarios.Update(): Boolean;
begin
  try
    Result := False;
    with dm.qryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'UPDATE ' + TABLENAME + ' SET ' + 'NOM_USUARIO  = :NOME, ' +
        'DES_LOGIN = :LOGIN, ' + 'DES_EMAIL = :EMAIL, ' + 'COD_GRUPO = :GRUPO, '
        + 'DOM_PRIVILEGIO = :PRIVILEGIO, ' + 'DOM_EXPIRA = :EXPIRA, ' +
        'QTD_DIAS_EXPIRA = :DIAS, ' + 'DOM_PRIMEIRO_ACESSO = :ACESSO, ' +
        'DOM_ATIVO = :ATIVO, ' + 'DAT_SENHA = :DATASENHA, ' +
        'COD_NIVEL = :NIVEL, ' + 'NOM_EXECUTOR = :EXECUTOR, ' +
        'DAT_MANUTENCAO = :MANUTENCAO ' + 'WHERE COD_USUARIO =:CODIGO';
      ParamByName('CODIGO').AsInteger := Self.Codigo;
      ParamByName('NOME').AsString := Self.Nome;
      ParamByName('LOGIN').AsString := Self.Login;
      ParamByName('EMAIL').AsString := Self.EMail;
      ParamByName('GRUPO').AsInteger := Self.Grupo;
      ParamByName('PRIVILEGIO').AsString := Self.Privilegio;
      ParamByName('EXPIRA').AsString := Self.Expira;
      ParamByName('DIAS').AsInteger := Self.Dias;
      ParamByName('ACESSO').AsString := Self.Acesso;
      ParamByName('ATIVO').AsString := Self.Ativo;
      ParamByName('DATASENHA').AsDate := Self.DataSenha;
      ParamByName('NIVEL').AsInteger := Self.Nivel;
      ParamByName('EXECUTOR').AsString := Self.Executor;
      ParamByName('MANUTENCAO').AsDateTime := Self.Manutencao;
      dm.ZConn.PingServer;
      ExecSQL;
      Close;
      SQL.Clear;
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

function TUsuarios.ValidatePassword(Login: string; Senha: string): Boolean;
var
  sSenha: String;
begin
  try
    Result := False;
    with dm.qryPesquisa do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT AES_DECRYPT(DES_SENHA,:CHAVE) AS SENHA FROM ' +
        TABLENAME + ' WHERE DES_LOGIN = :LOGIN';
      ParamByName('LOGIN').AsString := Login;
      ParamByName('CHAVE').AsString := CHAVE;
      dm.ZConn.PingServer;
      Open;
      if IsEmpty then
      begin
        Close;
        SQL.Clear;
        Exit;
      end;
      sSenha := FieldByName('SENHA').AsString;
      Close;
      SQL.Clear;
      if sSenha <> Senha then
      begin
        Exit;
      end;
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

function TUsuarios.ChangePassword(filtro: String): Boolean;
begin
  try
    Result := False;
    if TUtil.Empty(filtro) then
    begin
      Exit;
    end;
    with dm.qryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE ' + TABLENAME +
        ' SET DES_SENHA = AES_ENCRYPT(:SENHA,:CHAVE), DAT_SENHA = :DATASENHA');
      ParamByName('SENHA').AsString := Self.Senha;
      ParamByName('DATASENHA').AsDate := Self.DataSenha;
      ParamByName('CHAVE').AsString := CHAVE;
      if filtro = 'CODIGO' then
      begin
        SQL.Add('WHERE COD_USUARIO = :CODIGO');
        ParamByName('CODIGO').AsInteger := Self.Codigo;
      end;
      if filtro = 'LOGIN' then
      begin
        SQL.Add('WHERE DES_LOGIN = :LOGIN');
        ParamByName('LOGIN').AsString := Self.Login;
      end;
      dm.ZConn.PingServer;
      ExecSQL;
      Close;
      SQL.Clear;
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

function TUsuarios.Delete(filtro: String): Boolean;
begin
  try
    Result := False;
    if TUtil.Empty(filtro) then
    begin
      Exit;
    end;
    with dm.qryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Add('DELETE FROM ' + TABLENAME);
      if filtro = 'CODIGO' then
      begin
        SQL.Add('WHERE COD_USUARIO = :CODIGO');
        ParamByName('CODIGO').AsInteger := Self.Codigo;
      end;
      if filtro = 'LOGIN' then
      begin
        SQL.Add('WHERE DES_LOGIN = :LOGIN');
        ParamByName('LOGIN').AsString := Self.Login;
      end;
      if filtro = 'GRUPO' then
      begin
        SQL.Add('WHERE COD_GRUPO = :GRUPO');
        ParamByName('GRUPO').AsInteger := Self.Grupo;
      end;
      dm.ZConn.PingServer;
      ExecSQL;
      Close;
      SQL.Clear;
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

function TUsuarios.ListSearch(filtro: String): Boolean;
begin
  try
    Result := False;
    if TUtil.Empty(filtro) then
    begin
      Exit;
    end;
    with dm.qryPesquisa do
    begin
      Close;
      SQL.Clear;
      if filtro = 'USUARIO' then
      begin
        SQL.Text :=
          'SELECT NOM_USUARIO AS Nome, DES_LOGIN AS Login, DES_EMAIL AS "E-Mail" FROM '
          + TABLENAME + ' WHERE COD_GRUPO >= 0';
      end;
      if filtro = 'GRUPO' then
      begin
        SQL.Text := 'SELECT NOM_USUARIO AS "Descrição" FROM ' + TABLENAME +
          ' WHERE COD_GRUPO < 0';
      end;
      dm.ZConn.PingServer;
      Open;
      if IsEmpty then
      begin
        Close;
        SQL.Clear;
        Exit;
      end;
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

function TUsuarios.getGroup(id: string; filtro: string): Boolean;
begin
  try
    Result := False;
    with dm.qryPesquisa do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT COD_USUARIO, NOM_USUARIO FROM ' + TABLENAME);
      if filtro = 'CODIGO' then
      begin
        SQL.Add('WHERE COD_USUARIO = :CODIGO');
        ParamByName('CODIGO').AsInteger := StrToInt(id);
      end;
      if filtro = 'NOME' then
      begin
        SQL.Add('WHERE NOM_USUARIO = :NOME');
        ParamByName('NOME').AsString := id;
      end;
      dm.ZConn.PingServer;
      Open;
      if IsEmpty then
      begin
        Close;
        SQL.Clear;
        Exit;
      end;
      Self.Grupo := FieldByName('COD_USUARIO').AsInteger;
      Close;
      SQL.Clear;
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

function TUsuarios.getObjects(): Boolean;
begin
  try
    Result := False;
    with dm.qryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT * FROM ' + TABLENAME;
      dm.ZConn.PingServer;
      Open;
      if IsEmpty then
      begin
        Close;
        SQL.Clear;
        Exit;
      end;
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

procedure TUsuarios.setAcesso(const Value: String);
begin
  _acesso := Value;
end;

procedure TUsuarios.setAtivo(const Value: String);
begin
  _ativo := Value;
end;

procedure TUsuarios.setCodigo(const Value: Integer);
begin
  _codigo := Value;
end;

procedure TUsuarios.setDataSenha(const Value: TDate);
begin
  _datasenha := Value;
end;

procedure TUsuarios.setDias(const Value: Integer);
begin
  _dias := Value;
end;

procedure TUsuarios.setEMail(const Value: String);
begin
  _email := Value;
end;

procedure TUsuarios.setExecutor(const Value: String);
begin
  _executor := Value;
end;

procedure TUsuarios.setExpira(const Value: String);
begin
  _expira := Value;
end;

procedure TUsuarios.setGrupo(const Value: Integer);
begin
  _grupo := Value;
end;

procedure TUsuarios.setLogin(const Value: String);
begin
  _login := Value;
end;

procedure TUsuarios.setManutencao(const Value: TDateTime);
begin
  _manutencao := Value;
end;

procedure TUsuarios.setNivel(const Value: Integer);
begin
  _nivel := Value;
end;

procedure TUsuarios.setNome(const Value: String);
begin
  _nome := Value;
end;

procedure TUsuarios.setPrivilegio(const Value: String);
begin
  _privilegio := Value;
end;

procedure TUsuarios.setSenha(const Value: Variant);
begin
  _senha := Value;
end;

end.


