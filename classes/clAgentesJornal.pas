unit clAgentesJornal;

interface

uses
  clPessoaJ, clConexao;

type
  TAgenteJornal = Class(TPessoaJ)

  private
    function getCodigo: Integer;
    procedure setCodigo(const Value: Integer);
    function getOperacao: String;
    procedure setOperacao(const Value: String);

  protected
    _codigo: Integer;
    _operacao: String;
    _conexao: TConexao;
  public

    constructor Create;
    destructor Destroy;

    property Codigo: Integer read getCodigo write setCodigo;
    property Operacao: String read getOperacao write setOperacao;

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
  TABLENAME = 'jor_agentes';

implementation

{ TAgenteJornal }

uses SysUtils, Dialogs, udm, clUtil, ZDataset, ZAbstractRODataset, DB, Math;

constructor TAgenteJornal.Create;
begin
  _conexao := TConexao.Create;
end;

destructor TAgenteJornal.Destroy;
begin
  _conexao.Free;
end;

function TAgenteJornal.getCodigo: Integer;
begin
  Result := _codigo;
end;

function TAgenteJornal.getOperacao: String;
begin
  Result := _operacao;
end;

function TAgenteJornal.Validar(): Boolean;
begin
  Result := False;
  if Self.Codigo = 0 then
  begin
    MessageDlg('Informe o código do Agente!', mtWarning, [mbOK], 0);
    Exit
  end;
  if Self.Operacao = 'I' then
  begin
    if Self.JaExiste(IntToStr(Self.Codigo)) then
    begin
      MessageDlg('Código de Agente já Cadastrado', mtWarning, [mbOK], 0);
      Exit;
    end;
  end;
  if TUtil.Empty(Self.Razao) then
  begin
    MessageDlg('Informe o nome do Agente!', mtWarning, [mbNo], 0);
    Exit;
  end;
  Result := True;
end;

function TAgenteJornal.JaExiste(id: String): Boolean;
begin
  try
    Result := False;
    if TUtil.Empty(id) then
    begin
      Exit;
    end;
    if (not _conexao.VerifyConnZEOS(1)) then
    begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
        Self.ClassName + ') !', mtError, [mbCancel], 0);
    end;
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
    dm.qryGetObject.SQL.Add('SELECT * FROM ' + TABLENAME);
    dm.qryGetObject.SQL.Add(' WHERE COD_AGENTE = :CODIGO');
    dm.qryGetObject.ParamByName('CODIGO').AsInteger := StrToInt(id);
    dm.ZConn.PingServer;
    dm.qryGetObject.Open;
    if (not dm.qryGetObject.IsEmpty) then
    begin
      dm.qryGetObject.First;
    end;
    if dm.qryGetObject.RecordCount > 0 then
    begin
      Result := True;
    end;
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TAgenteJornal.Delete(filtro: String): Boolean;
begin
  try
    Result := False;
    if (not _conexao.VerifyConnZEOS(1)) then
    begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
        Self.ClassName + ') !', mtError, [mbCancel], 0);
    end;
    dm.QryCRUD.Close;
    dm.QryCRUD.SQL.Clear;
    dm.QryCRUD.SQL.Add('DELETE FROM ' + TABLENAME);
    if filtro = 'CODIGO' then
    begin
      dm.QryCRUD.SQL.Add('WHERE COD_AGENTE = :CODIGO');
      dm.QryCRUD.ParamByName('CODIGO').AsInteger := Self.Codigo;
    end;
    dm.ZConn.PingServer;
    dm.QryCRUD.ExecSQL;
    dm.QryCRUD.Close;
    dm.QryCRUD.SQL.Clear;
    Result := True;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TAgenteJornal.getObject(id, filtro: String): Boolean;
begin
  Try
    Result := False;
    if (not _conexao.VerifyConnZEOS(1)) then
    begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
        Self.ClassName + ') !', mtError, [mbCancel], 0);
    end;
    if TUtil.Empty(id) then
    begin
      Exit;
    end;
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
    dm.qryGetObject.SQL.Add('SELECT * FROM ' + TABLENAME);
    if filtro = 'CODIGO' then
    begin
      dm.qryGetObject.SQL.Add(' WHERE COD_AGENTE = :CODIGO');
      dm.qryGetObject.ParamByName('CODIGO').AsInteger := StrToInt(id);
    end
    else if filtro = 'NOME' then
    begin
      dm.qryGetObject.SQL.Add(' WHERE NOM_AGENTE = :NOME');
      dm.qryGetObject.ParamByName('NOME').AsString := id;
    end;
    dm.ZConn.PingServer;
    dm.qryGetObject.Open;
    if (not dm.qryGetObject.IsEmpty) then
    begin
      dm.qryGetObject.First;
    end;
    if dm.qryGetObject.RecordCount > 0 then
    begin
      dm.qryGetObject.First;
      Self.Codigo := dm.qryGetObject.FieldByName('COD_AGENTE').AsInteger;
      Self.Razao := dm.qryGetObject.FieldByName('NOM_AGENTE').AsString;
      Result := True;
    end
    else
    begin
      dm.qryGetObject.Close;
      dm.qryGetObject.SQL.Clear;
    end;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TAgenteJornal.Insert(): Boolean;
begin
  Try
    Result := False;
    if (not _conexao.VerifyConnZEOS(1)) then
    begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
        Self.ClassName + ') !', mtError, [mbCancel], 0);
    end;
    dm.QryCRUD.Close;
    dm.QryCRUD.SQL.Clear;
    dm.QryCRUD.SQL.Text := 'INSERT INTO ' + TABLENAME + '(' + 'COD_AGENTE, ' +
      'NOM_AGENTE) ' + 'VALUES (' + ':CODIGO, ' + ':NOME) ';
    dm.QryCRUD.ParamByName('CODIGO').AsInteger := Self.Codigo;
    dm.QryCRUD.ParamByName('NOME').AsString := Self.Razao;
    dm.ZConn.PingServer;
    dm.QryCRUD.ExecSQL;
    dm.QryCRUD.Close;
    dm.QryCRUD.SQL.Clear;
    Result := True;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TAgenteJornal.Update(): Boolean;
begin
  try
    Result := False;
    if (not _conexao.VerifyConnZEOS(1)) then
    begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
        Self.ClassName + ') !', mtError, [mbCancel], 0);
    end;
    dm.QryCRUD.Close;
    dm.QryCRUD.SQL.Clear;
    dm.QryCRUD.SQL.Text := 'UPDATE ' + TABLENAME + ' SET ' +
      'NOM_AGENTE = :NOME ' + 'WHERE ' + 'COD_AGENTE = :CODIGO';
    dm.QryCRUD.ParamByName('CODIGO').AsInteger := Self.Codigo;
    dm.QryCRUD.ParamByName('NOME').AsString := Self.Razao;
    dm.ZConn.PingServer;
    dm.QryCRUD.ExecSQL;
    dm.QryCRUD.Close;
    dm.QryCRUD.SQL.Clear;
    Result := True;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TAgenteJornal.getObjects(): Boolean;
begin
  try
    Result := False;
    if (not _conexao.VerifyConnZEOS(1)) then
    begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
        Self.ClassName + ') !', mtError, [mbCancel], 0);
    end;
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
    dm.qryGetObject.SQL.Add('SELECT * FROM ' + TABLENAME);
    dm.ZConn.PingServer;
    dm.qryGetObject.Open;
    if (not dm.qryGetObject.IsEmpty) then
    begin
      dm.qryGetObject.First;
    end;
    if dm.qryGetObject.RecordCount > 0 then
    begin
      Result := True;
    end;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TAgenteJornal.getField(campo, coluna: String): String;
begin
  Try
    Result := '';
    if (not _conexao.VerifyConnZEOS(1)) then
    begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
        Self.ClassName + ') !', mtError, [mbCancel], 0);
    end;
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
    dm.qryGetObject.SQL.Text := 'SELECT ' + campo + ' FROM ' + TABLENAME;
    if coluna = 'CODIGO' then
    begin
      dm.qryGetObject.SQL.Add(' WHERE COD_AGENTE = :CODIGO ');
      dm.qryGetObject.ParamByName('CODIGO').AsInteger := Self.Codigo;
    end
    else if coluna = 'NOME' then
    begin
      dm.qryGetObject.SQL.Add(' WHERE NOM_AGENTE = :NOME ');
      dm.qryGetObject.ParamByName('NOME').AsString := Self.Razao;
    end;
    dm.ZConn.PingServer;
    dm.qryGetObject.Open;
    if (not dm.qryGetObject.IsEmpty) then
    begin
      dm.qryGetObject.First;
    end;
    if dm.qryGetObject.RecordCount > 0 then
    begin
      Result := dm.qryGetObject.FieldByName(campo).AsString;
    end;
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

procedure TAgenteJornal.setCodigo(const Value: Integer);
begin
  _codigo := Value;
end;

procedure TAgenteJornal.setOperacao(const Value: String);
begin
  _operacao := Value;
end;

end.
