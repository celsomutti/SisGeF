unit clServicos;

interface

uses clConexao;

type
  TServicos = Class(TObject)

  private
    function getCodigo: Integer;
    procedure setCodigo(const Value: Integer);
    function getDescricao: String;
    procedure setDescricao(const Value: String);
    function getAgregacao: String;
    procedure setAgregacao(const Value: String);
    function getValor: Double;
    procedure setValor(const Value: Double);
    constructor Create;
    destructor Destroy;
    function getValorAgregado: Double;
    procedure setValorAgregado(const Value: Double);
  protected
    _codigo: Integer;
    _descricao: String;
    _agregacao: String;
    _valor: Double;
    _valoragregado: Double;
    _conexao: TConexao;
  public
    property Codigo: Integer read getCodigo write setCodigo;
    property Descricao: String read getDescricao write setDescricao;
    property Agregacao: String read getAgregacao write setAgregacao;
    property Valor: Double read getValor write setValor;
    property ValorAgregado: Double read getValorAgregado write setValorAgregado;

    function Validar(): Boolean;
    function Delete(filtro: String): Boolean;
    function getObject(id, filtro: String): Boolean;
    function Insert(): Boolean;
    function Update(): Boolean;
    function getObjects(): Boolean;
    function getField(campo, coluna: String): String;

    procedure MaxCod;
  end;

const
  TABLENAME = 'tbservicos';

implementation

{ TServicos }

uses SysUtils, Dialogs, udm, clUtil, ZDataset, ZAbstractRODataset, DB, Math;

constructor TServicos.Create;
begin
  _conexao := TConexao.Create;
  if (not _conexao.VerifyConnZEOS(0)) then
  begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
      Self.ClassName + ') !', mtError, [mbCancel], 0);
  end;
end;

destructor TServicos.Destroy;
begin
  _conexao.Free;
end;

function TServicos.getAgregacao: String;
begin
  Result := _agregacao;
end;

function TServicos.getCodigo: Integer;
begin
  Result := _codigo;
end;

function TServicos.getDescricao: String;
begin
  Result := _descricao;
end;

function TServicos.Validar(): Boolean;
begin
  Result := False;
  if TUtil.Empty(Self.Descricao) then
  begin
    MessageDlg('Informe o nome do cliente!', mtWarning, [mbNo], 0);
    Exit;
  end;
  Result := True;
end;

procedure TServicos.MaxCod;
begin
  try
    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT MAX(COD_SERVICO) AS CODIGO FROM ' + TABLENAME;
      dm.ZConn.PingServer;
      Open;
      if not(IsEmpty) then
        First;
    end;

    Self.Codigo := (dm.QryGetObject.FieldByName('CODIGO').AsInteger) + 1;

    dm.QryGetObject.Close;
    dm.QryGetObject.SQL.Clear;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TServicos.Delete(filtro: String): Boolean;
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
        SQL.Add('WHERE COD_SERVICO = :CODIGO');
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

function TServicos.getObject(id, filtro: String): Boolean;
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
        SQL.Add(' WHERE COD_SERVICO = :CODIGO');
        ParamByName('CODIGO').AsInteger := StrToInt(id);
      end
      else if filtro = 'DESCRICAO' then
      begin
        SQL.Add(' WHERE DES_SERVICO = :DESCRICAO');
        ParamByName('DESCRICAO').AsString := id;
      end;
      dm.ZConn.PingServer;
      Open;
      if not IsEmpty then
        First;
    end;

    if dm.QryGetObject.RecordCount > 0 then
    begin
      dm.QryGetObject.First;
      Self.Codigo := dm.QryGetObject.FieldByName('COD_SERVICO').AsInteger;
      Self.Descricao := dm.QryGetObject.FieldByName('DES_SERVICO').AsString;
      Self.Agregacao := dm.QryGetObject.FieldByName('DOM_AGREGACAO').AsString;
      Self.Valor := dm.QryGetObject.FieldByName('VAL_SERVICO').AsFloat;
      Self.ValorAgregado := dm.QryGetObject.FieldByName('VAL_AGREGADO').AsFloat;
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

function TServicos.Insert(): Boolean;
begin
  Try
    Result := False;

    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'INSERT INTO ' + TABLENAME + '(' + 'COD_SERVICO, ' +
        'DES_SERVICO, ' + 'DOM_AGREGACAO, ' + 'VAL_SERVICO, VAL_AGREGADO) ' + 'VALUES (' +
        ':CODIGO, ' + ':DESCRICAO, ' + ':AGREGACAO, ' + ':VALOR, :VALAGREGADO)';

      MaxCod;

      ParamByName('CODIGO').AsInteger := Self.Codigo;
      ParamByName('DESCRICAO').AsString := Self.Descricao;
      ParamByName('AGREGACAO').AsString := Self.Agregacao;
      ParamByName('VALOR').AsFloat := Self.Valor;
      ParamByName('VALAGREGADO').AsFloat := Self.ValorAgregado;
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

function TServicos.Update(): Boolean;
begin
  try
    Result := False;

    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'UPDATE ' + TABLENAME + ' SET ' + 'DES_SERVICO = :DESCRICAO, '
        + 'DOM_AGREGACAO = :AGREGACAO, ' + 'VAL_SERVICO = :VALOR, VAL_AGREGADO = :VALAGREGADO ' + 'WHERE ' +
        'COD_SERVICO = :CODIGO';

      ParamByName('CODIGO').AsInteger := Self.Codigo;
      ParamByName('DESCRICAO').AsString := Self.Descricao;
      ParamByName('AGREGACAO').AsString := Self.Agregacao;
      ParamByName('VALOR').AsFloat := Self.Valor;
      ParamByName('VALAGREGADO').AsFloat := Self.ValorAgregado;
      dm.ZConn.PingServer;
      ExecSQL;
    end;

    dm.QryCRUD.Close;
    dm.QryCRUD.SQL.Clear;

    Result := True;

    MessageDlg('Os dados foram alterado com sucesso!', mtInformation,
      [mbOK], 0);

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TServicos.getObjects(): Boolean;
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

function TServicos.getValor: Double;
begin
  Result := _valor;
end;

function TServicos.getValorAgregado: Double;
begin
  Result := _valoragregado;
end;

function TServicos.getField(campo, coluna: String): String;
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
        SQL.Add(' WHERE COD_SERVICO = :CODIGO ');
        ParamByName('CODIGO').AsInteger := Self.Codigo;
      end
      else if coluna = 'NOME' then
      begin
        SQL.Add(' WHERE DES_SERVICO = :DESCRICAO ');
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

procedure TServicos.setAgregacao(const Value: String);
begin
  _agregacao := Value;
end;

procedure TServicos.setCodigo(const Value: Integer);
begin
  _codigo := Value;
end;

procedure TServicos.setDescricao(const Value: String);
begin
  _descricao := Value;
end;

procedure TServicos.setValor(const Value: Double);
begin
  _valor := Value;
end;

procedure TServicos.setValorAgregado(const Value: Double);
begin
  _valoragregado := valUE;
end;

end.
