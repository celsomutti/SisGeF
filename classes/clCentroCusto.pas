unit clCentroCusto;

interface

uses clConexao;

type
  TCentroCusto = class(TObject)

  private
    function getCodigo: Integer;
    function getDescricao: String;
    procedure setCodigo(const Value: Integer);
    procedure setDescricao(const Value: String);
    function getOperacao: String;
    procedure setOperacao(const Value: String);

  protected
    _codigo: Integer;
    _descricao: String;
    _operacao: String;
    _conexao: TConexao;
  public

    constructor Create;
    destructor Destroy;

    property Codigo: Integer read getCodigo write setCodigo;
    property Descricao: String read getDescricao write setDescricao;
    property Operacao: String read getOperacao write setOperacao;

    function Validar(): Boolean;
    function Delete(filtro: String): Boolean;
    function getObject(id, filtro: String): Boolean;
    function getObjects(): Boolean;
    function Insert(): Boolean;
    function Update(): Boolean;
    function getField(campo, coluna: String): String;
    function JaExiste(id: String): Boolean;
  end;

const
  TABLENAME = 'tbcentrocusto';

implementation

uses SysUtils, Dialogs, udm, clUtil, ZDataset, ZAbstractRODataset, DB;

{ TCentroCusto }

constructor TCentroCusto.Create;
begin
  _conexao := TConexao.Create;
  if (not _conexao.VerifyConnZEOS(0)) then
  begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
      Self.ClassName + ') !', mtError, [mbCancel], 0);
  end;
end;

destructor TCentroCusto.Destroy;
begin
  _conexao.Free;
end;

function TCentroCusto.getCodigo: Integer;
begin
  Result := _codigo;
end;

function TCentroCusto.getDescricao: String;
begin
  Result := _descricao;
end;

function TCentroCusto.getOperacao: String;
begin
  Result := _operacao;
end;

function TCentroCusto.Validar(): Boolean;
begin
  Result := False;
  if Self.Codigo = 0 then
  begin
    MessageDlg('Informe o Código do Centro de Custo!', mtWarning, [mbOK], 0);
    Exit
  end;
  if Self.Operacao = 'I' then
  begin
    if Self.JaExiste(IntToStr(Self.Codigo)) then
    begin
      MessageDlg('Código de Centro de Custo já Cadastrado!', mtWarning,
        [mbOK], 0);
      Exit;
    end;
  end;
  if TUtil.Empty(Self.Descricao) then
  begin
    MessageDlg('Informe a Descrição do Centro de Custo!', mtWarning, [mbNo], 0);
    Exit;
  end;
  Result := True;
end;

function TCentroCusto.Delete(filtro: String): Boolean;
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
        SQL.Add('WHERE COD_CENTRO_CUSTO = :CODIGO');
        ParamByName('CODIGO').AsInteger := Self.Codigo;
      end
      else if filtro = 'DESCRICAO' then
      begin
        SQL.Add('WHERE DES_CENTRO_CUSTO = :DESCRICAO');
        ParamByName('DESCRICAO').AsString := Self.Descricao;
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

function TCentroCusto.getObject(id, filtro: String): Boolean;
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

      if filtro = 'CODIGO' then
      begin
        SQL.Add('WHERE COD_CENTRO_CUSTO = :CODIGO');
        ParamByName('CODIGO').AsInteger := StrToInt(id);
      end
      else if filtro = 'DESCRICAO' then
      begin
        SQL.Add('WHERE DES_CENTRO_CUSTO = :DESCRICAO');
        ParamByName('DESCRICAO').AsString := id;
      end;
      dm.ZConn.PingServer;
      Open;
      if not IsEmpty then
        First;
    end;

    if dm.QryGetObject.RecordCount > 0 then
    begin
      Self.Codigo := dm.QryGetObject.FieldByName('COD_CENTRO_CUSTO').AsInteger;
      Self.Descricao := dm.QryGetObject.FieldByName('DES_CENTRO_CUSTO')
        .AsString;
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

function TCentroCusto.Insert(): Boolean;
begin
  try
    Result := False;

    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'INSERT INTO ' + TABLENAME + '(' + 'COD_CENTRO_CUSTO, ' +
        'DES_CENTRO_CUSTO) ' + 'VALUES (' + ':CODIGO, ' + ':DESCRICAO)';

      ParamByName('CODIGO').AsInteger := Self.Codigo;
      ParamByName('DESCRICAO').AsString := Self.Descricao;
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

function TCentroCusto.Update(): Boolean;
begin
  try
    Result := False;

    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'UPDATE ' + TABLENAME + ' SET ' +
        'DES_CENTRO_CUSTO = :DESCRICAO ' + 'WHERE ' +
        'COD_CENTRO_CUSTO = :CODIGO';

      ParamByName('CODIGO').AsInteger := Self.Codigo;
      ParamByName('DESCRICAO').AsString := Self.Descricao;
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

function TCentroCusto.getField(campo, coluna: String): String;
begin
  try
    Result := '';

    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT ' + campo + ' FROM ' + TABLENAME;

      if coluna = 'CODIGO' then
      begin
        SQL.Add(' WHERE COD_CENTRO_CUSTO =:CODIGO ');
        ParamByName('CODIGO').AsInteger := Self.Codigo;
      end
      else if coluna = 'DESCRICAO' then
      begin
        SQL.Add(' WHERE DES_CENTRO_CUSTO = :DESCRICAO ');
        ParamByName('DESCRICAO').AsString := Self.Descricao;
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

function TCentroCusto.getObjects(): Boolean;
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

function TCentroCusto.JaExiste(id: String): Boolean;
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
      SQL.Add(' WHERE COD_CENTRO_CUSTO =:CODIGO');
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

procedure TCentroCusto.setCodigo(const Value: Integer);
begin
  _codigo := Value;
end;

procedure TCentroCusto.setDescricao(const Value: String);
begin
  _descricao := Value;
end;

procedure TCentroCusto.setOperacao(const Value: String);
begin
  _operacao := Value;
end;

end.
