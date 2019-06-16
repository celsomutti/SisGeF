unit clServicosFuncionarios;

interface

uses clConexao;

type
  TFuncionariosServicos = class(TObject)

  private
    constructor Create;
    destructor Destroy;
    function getCadastro: Integer;
    function getCodigo: Integer;
    procedure setCadastro(const Value: Integer);
    procedure setCodigo(const Value: Integer);
  protected
    _codigo   : Integer;
    _cadastro : Integer;
    _conexao: TConexao;
  public
    property Codigo   : Integer read getCodigo    write setCodigo;
    property Cadastro : Integer read getCadastro  write setCadastro;

    function Validar(): Boolean;
    function Delete(filtro: String): Boolean;
    function getObject(id, filtro: String): Boolean;
    function Insert(): Boolean;
    function Update(): Boolean;
    function getField(campo, coluna: String): String;

  end;

const
  TABLENAME = 'TBSERVICOSFUNCIONARIOS';

implementation

uses SysUtils, Dialogs, udm, clUtil, ZDataset, ZAbstractRODataset, DB;

{ TFuncionariosServicos }

function TFuncionariosServicos.getCadastro: Integer;
begin
  Result  :=  _cadastro;
end;

function TFuncionariosServicos.getCodigo: Integer;
begin
  Result  :=  _codigo;
end;

constructor TFuncionariosServicos.Create;
begin
  _conexao := TConexao.Create;
end;

destructor TFuncionariosServicos.Destroy;
begin
  _conexao.Free;
end;

function TFuncionariosServicos.Validar(): Boolean;
begin
  try
    Result := False;
    if Self.Codigo = 0 then
    begin
      MessageDlg('Informe o código do Serviço!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if Self.Cadastro = 0 then
    begin
      MessageDlg('Informe o código do Funcionário!', mtWarning, [mbOK], 0);
      Exit;
    end;
    Result := True;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TFuncionariosServicos.Delete(filtro: String): Boolean;
begin
  try
    Result := False;
    if (not _conexao.VerifyConnZEOS(0)) then
    begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
        Self.ClassName + ') !', mtError, [mbCancel], 0);
    end;
    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Add('DELETE FROM ' + TABLENAME);
      if filtro = 'CODIGO' then
      begin
        SQL.Add('WHERE COD_SERVCO = :CODIGO');
        ParamByName('CODIGO').AsInteger := Self.Codigo;
      end
      else if filtro = 'CADASTRO' then
      begin
        SQL.Add('WHERE COD_CADASTRO = :CADASTRO');
        ParamByName('CADASTRO').AsInteger := Self.Cadastro;
      end;
      dm.ZConn.PingServer;
      ExecSQL;
    end;
    dm.QryCRUD.Close;
    dm.QryCRUD.SQL.Clear;
    Result := True;
  except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TFuncionariosServicos.getObject(id, filtro: String): Boolean;
begin
  try
    Result := False;

    if TUtil.Empty(id) then begin
      Exit;
    end;
    if (not _conexao.VerifyConnZEOS(0)) then
    begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
        Self.ClassName + ') !', mtError, [mbCancel], 0);
    end;
    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);

      if filtro = 'CODIGO' then
      begin
        SQL.Add('WHERE COD_SERVICO = :CODIGO');
        ParamByName('CODIGO').AsInteger := StrToInt(id);
      end
      else if filtro = 'CADASTRO' then
      begin
        SQL.Add('WHERE COD_CADASTRO = :CADASTRO');
        ParamByName('CADASTRO').AsInteger := StrToInt(id);
      end;
      dm.ZConn.PingServer;
      Open;
      if not IsEmpty then
        First;
    end;

    if dm.QryGetObject.RecordCount > 0 then
    begin
      Self.Codigo   := dm.QryGetObject.FieldByName('COD_SERVICO').AsInteger;
      Self.Cadastro := dm.QryGetObject.FieldByName('COD_CADASTRO').AsInteger;
      Result := True;
    end
    else
    begin
      dm.QryGetObject.Close;
      dm.QryGetObject.SQL.Clear;
    end;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TFuncionariosServicos.Insert(): Boolean;
begin
  try
    Result := False;
    if (not _conexao.VerifyConnZEOS(0)) then
    begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
        Self.ClassName + ') !', mtError, [mbCancel], 0);
    end;
    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'INSERT INTO ' + TABLENAME + '(' +
                  'COD_SERVICO, ' +
                  'COD_CADASTRO) ' +
                  'VALUES (' +
                  ':CODIGO, ' +
                  ':CADASTRO);';
      ParamByName('CODIGO').AsInteger := Self.Codigo;
      ParamByName('CADASTRO').AsInteger := Self.Cadastro;
      dm.ZConn.PingServer;
      ExecSQL;
    end;

    dm.QryCRUD.Close;
    dm.QryCRUD.SQL.Clear;

    Result := True;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TFuncionariosServicos.Update(): Boolean;
begin
  try
    Result := False;
    if (not _conexao.VerifyConnZEOS(0)) then
    begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
        Self.ClassName + ') !', mtError, [mbCancel], 0);
    end;
    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'UPDATE ' + TABLENAME + ' SET ' +
                  'COD_CADASTRO = :CADASTRO ' +
                  'WHERE COD_CADASTRO = :CADASTRO';
      ParamByName('CODIGO').AsInteger := Self.Codigo;
      ParamByName('CADASTRO').AsInteger := Self.Cadastro;
      dm.ZConn.PingServer;
      ExecSQL;

    end;

    dm.QryCRUD.Close;
    dm.QryCRUD.SQL.Clear;

    Result := True;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TFuncionariosServicos.getField(campo, coluna: String): String;
begin
  try
    Result := '';
    if (not _conexao.VerifyConnZEOS(0)) then
    begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
        Self.ClassName + ') !', mtError, [mbCancel], 0);
    end;
    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT ' + campo + ' FROM ' + TABLENAME;

      if coluna = 'CODIGO' then
      begin
        SQL.Add(' WHERE COD_SERVICO = :CODIGO ');
        ParamByName('CODIGO').AsInteger := Self.Codigo;
      end
      else if coluna = 'CADASTRO' then
      begin
        SQL.Add(' WHERE COD_CADASTRO = :CADASTRO ');
        ParamByName('CADASTRO').AsString := Self.Cadastro;
      end;
      dm.ZConn.PingServer;
      Open;
      if not IsEmpty then
        First;
    end;

    if dm.QryGetObject.RecordCount > 0 then
      Result := dm.QryGetObject.FieldByName(campo).AsString;

    dm.QryGetObject.Close;
    dm.QryGetObject.SQL.Clear;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

procedure TFuncionariosServicos.setCadastro(const Value: Integer);
begin
  _cadastro :=  Value;
end;

procedure TFuncionariosServicos.setCodigo(const Value: Integer);
begin
  _codigo   :=  Value;
end;


end.
