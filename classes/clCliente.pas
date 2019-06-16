unit clCliente;

interface

uses
  clPessoaJ, clConexao;

type
  TCliente = Class(TPessoaJ)

  private
    function getCodigo: Integer;
    procedure setCodigo(const Value: Integer);
    function getOperacao: String;
    procedure setOperacao(const Value: String);
    constructor Create;
    destructor Destroy;
    function getOS: Integer;
    procedure setOS(const Value: Integer);
    function getVerba: Double;
    procedure setVerba(const Value: Double);
  protected
    _codigo: Integer;
    _os : Integer;
    _operacao: String;
    _verba: Double;
    _conexao: TConexao;
  public
    property Codigo: Integer read getCodigo write setCodigo;
    property Operacao: String read getOperacao write setOperacao;
    property Verba: Double read getVerba write setVerba;
    property OS: Integer read getOS write setOS;

    function Validar(): Boolean;
    function JaExiste(id: String): Boolean;
    function Delete(filtro: String): Boolean;
    function getObject(id, filtro: String): Boolean;
    function Insert(): Boolean;
    function Update(): Boolean;
    function getObjects(): Boolean;
    function getField(campo, coluna: String): String;
  end;

const
  TABLENAME = 'tbclientes';

implementation

{ TCliente }

uses SysUtils, Dialogs, udm, clUtil, ZDataset, ZAbstractRODataset, DB, Math;

constructor TCliente.Create;
begin
  _conexao := TConexao.Create;
  if (not _conexao.VerifyConnZEOS(0)) then
  begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
      Self.ClassName + ') !', mtError, [mbCancel], 0);
  end;
end;

destructor TCliente.Destroy;
begin
  _conexao.Free;
end;

function TCliente.getCodigo: Integer;
begin
  Result := _codigo;
end;

function TCliente.getOperacao: String;
begin
  Result := _operacao;
end;

function TCliente.getOS: Integer;
begin
  Result := _os;
end;

function TCliente.getVerba: Double;
begin
  Result := _verba;
end;

function TCliente.Validar(): Boolean;
begin
  Result := False;
  if Self.Codigo = 0 then
  begin
    MessageDlg('Informe o código do cliente', mtWarning, [mbOK], 0);
    Exit
  end;
  if Self.Operacao = 'I' then
  begin
    if Self.JaExiste(IntToStr(Self.Codigo)) then
    begin
      MessageDlg('Código de Cliente já Cadastrado', mtWarning, [mbOK], 0);
      Exit;
    end;
  end;
  if TUtil.Empty(Self.Razao) then
  begin
    MessageDlg('Informe o nome do cliente!', mtWarning, [mbNo], 0);
    Exit;
  end;
  Result := True;
end;

function TCliente.JaExiste(id: String): Boolean;
begin
  try
    Result := False;
    if TUtil.Empty(id) then
      Exit;
    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);
      SQL.Add(' WHERE COD_CLIENTE =:CODIGO');
      ParamByName('CODIGO').AsInteger := StrToInt(id);
      dm.ZConn.PingServer;
      Open;
      if not IsEmpty then
        First;
    end;

    if dm.QryGetObject.RecordCount > 0 then
    begin
      Result := True;
    end;

    dm.QryGetObject.Close;
    dm.QryGetObject.SQL.Clear;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TCliente.Delete(filtro: String): Boolean;
begin
  try

    Result := False;

    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Add('DELETE FROM ' + TABLENAME);
      if filtro = 'CODIGO' then
      begin
        SQL.Add('WHERE COD_CLIENTE = :CODIGO');
        ParamByName('CODIGO').AsInteger := Self.Codigo;
      end;
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

function TCliente.getObject(id, filtro: String): Boolean;
begin
  Try
    Result := False;

    if TUtil.Empty(id) then
      Exit;

    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);

      if filtro = 'CODIGO' then
      begin
        SQL.Add(' WHERE COD_CLIENTE =:CODIGO');
        ParamByName('CODIGO').AsInteger := StrToInt(id);
      end
      else if filtro = 'NOME' then
      begin
        SQL.Add(' WHERE NOM_CLIENTE = :NOME');
        ParamByName('NOME').AsString := id;
      end;
      dm.ZConn.PingServer;
      Open;
      if not IsEmpty then
        First;
    end;

    if dm.QryGetObject.RecordCount > 0 then
    begin
      dm.QryGetObject.First;
      Self.Codigo := dm.QryGetObject.FieldByName('COD_CLIENTE').AsInteger;
      Self.Razao := dm.QryGetObject.FieldByName('NOM_CLIENTE').AsString;
      Self.Verba := dm.QryGetObject.FieldByName('VAL_VERBA').AsFloat;;
      Self.OS := dm.QryGetObject.FieldByName('DOM_OS').AsInteger;
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

function TCliente.Insert(): Boolean;
begin
  Try
    Result := False;

    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'INSERT INTO ' + TABLENAME +
                  '(' + 'COD_CLIENTE, ' +
                  'NOM_CLIENTE, ' +
                  'VAL_VERB, ' +
                  'DOM_OS) ' +
                  'VALUES (' +
                  ':CODIGO, ' +
                  ':NOME, ' +
                  ':VERBA, ' +
                  ':OS)';
      ParamByName('CODIGO').AsInteger := Self.Codigo;
      ParamByName('NOME').AsString := Self.Razao;
      ParamByName('VERBA').AsFloat := Self.Verba;
      ParamByName('OS').AsInteger := Self.OS;
      dm.ZConn.PingServer;
      ExecSQL;
    end;

    dm.QryCRUD.Close;
    dm.QryCRUD.SQL.Clear;

    Result := True;

    MessageDlg('Os dados foram salvos com sucesso!', mtInformation, [mbOK], 0);

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TCliente.Update(): Boolean;
begin
  try
    Result := False;

    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'UPDATE ' + TABLENAME +
                  ' SET ' +
                  'NOM_CLIENTE = :NOME, ' +
                  'VAL_VERBA = :VERBA, ' +
                  'DOM_OS = :OS ' +
                  'WHERE ' +
                  'COD_CLIENTE = :CODIGO ';
      ParamByName('CODIGO').AsInteger := Self.Codigo;
      ParamByName('NOME').AsString := Self.Razao;
      ParamByName('VERBA').AsFloat := Self.Verba;
      ParamByName('OS').AsInteger := Self.OS;
      dm.ZConn.PingServer;
      ExecSQL;
    end;

    dm.QryCRUD.Close;
    dm.QryCRUD.SQL.Clear;

    Result := True;

    MessageDlg('Os dados foram alterados com sucesso!', mtInformation,
      [mbOK], 0);

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TCliente.getObjects(): Boolean;
begin
  try
    Result := False;

    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);
      dm.ZConn.PingServer;
      Open;
      if not IsEmpty then
        First;
    end;

    if dm.QryGetObject.RecordCount > 0 then
      Result := True;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TCliente.getField(campo, coluna: String): String;
begin
  Try
    Result := '';

    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT ' + campo + ' FROM ' + TABLENAME;

      if coluna = 'CODIGO' then
      begin
        SQL.Add(' WHERE COD_CLIENTE = :CODIGO ');
        ParamByName('CODIGO').AsInteger := Self.Codigo;
      end
      else if coluna = 'NOME' then
      begin
        SQL.Add(' WHERE NOM_CLIENTE =:NOME ');
        ParamByName('NOME').AsString := Self.Razao;
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

procedure TCliente.setCodigo(const Value: Integer);
begin
  _codigo := Value;
end;

procedure TCliente.setOperacao(const Value: String);
begin
  _operacao := Value;
end;

procedure TCliente.setOS(const Value: Integer);
begin
  _os := Value;
end;

procedure TCliente.setVerba(const Value: Double);
begin
  _verba := Value;
end;

end.
