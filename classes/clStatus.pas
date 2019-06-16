unit clStatus;

interface

uses clConexao;

type
  TStatus = class(TObject)

  private
    function getBaixa: String;
    function getCodigo: Integer;
    function getDescricao: String;
    function getPercentual: Double;
    procedure setBaixa(const Value: String);
    procedure setCodigo(const Value: Integer);
    procedure setDescricao(const Value: String);
    procedure setPercentual(const Value: Double);
    constructor Create;
    destructor Destroy;
  protected
    _codigo: Integer;
    _descricao: String;
    _percentual: Double;
    _baixa: String;
    _conexao: TConexao;
  public
    property Codigo: Integer read getCodigo write setCodigo;
    property Descricao: String read getDescricao write setDescricao;
    property Percentual: Double read getPercentual write setPercentual;
    property Baixa: String read getBaixa write setBaixa;

    function Validar(): Boolean;
    function Delete(filtro: String): Boolean;
    function getObject(id, filtro: String): Boolean;
    function Insert(): Boolean;
    function Update(): Boolean;
    function getField(campo, coluna: String): String;

  end;

const
  TABLENAME = 'tbstatusentrega';

implementation

uses SysUtils, Dialogs, udm, clUtil, ZDataset, ZAbstractRODataset, DB;

{ TStatus }

constructor TStatus.Create;
begin
  _conexao := TConexao.Create;
  if (not _conexao.VerifyConnZEOS(0)) then
  begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
      Self.ClassName + ') !', mtError, [mbCancel], 0);
  end;
end;

destructor TStatus.Destroy;
begin
  _conexao.Free;
end;

function TStatus.getBaixa: String;
begin
  Result := _baixa;
end;

function TStatus.getCodigo: Integer;
begin
  Result := _codigo;
end;

function TStatus.getDescricao: String;
begin
  Result := _descricao;
end;

function TStatus.getPercentual: Double;
begin
  Result := _percentual;
end;

function TStatus.Validar(): Boolean;
begin
  try
    Result := False;
    if Self.Codigo = 0 then
    begin
      MessageDlg('Informe o código do Status!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if TUtil.Empty(Self.Descricao) then
    begin
      MessageDlg('Informe a Descrição do Status!', mtWarning, [mbOK], 0);
      Exit;
    end;
    Result := True;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TStatus.Delete(filtro: String): Boolean;
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
        SQL.Add('WHERE COD_STATUS = :CODIGO');
        ParamByName('CODIGO').AsInteger := Self.Codigo;
      end
      else if filtro = 'DESCRICAO' then
      begin
        SQL.Add('WHERE DES_STATUS = :DESCRICAO');
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

function TStatus.getObject(id, filtro: String): Boolean;
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
        SQL.Add('WHERE COD_STATUS = :CODIGO');
        ParamByName('CODIGO').AsInteger := StrToInt(id);
      end
      else if filtro = 'ENTREGADOR' then
      begin
        SQL.Add('WHERE DES_STATUS = :DESCRICAO');
        ParamByName('DESCRICAO').AsString := id;
      end;
      dm.ZConn.PingServer;
      Open;
      if not IsEmpty then
        First;
    end;

    if dm.QryGetObject.RecordCount > 0 then
    begin
      Self.Codigo := dm.QryGetObject.FieldByName('COD_STATUS').AsInteger;
      Self.Descricao := dm.QryGetObject.FieldByName('DES_STATUS').AsString;
      Self.Percentual := dm.QryGetObject.FieldByName
        ('VAL_PERCENTUAL_VERBA').AsFloat;
      Self.Baixa := dm.QryGetObject.FieldByName('DOM_BAIXA').AsString;
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

function TStatus.Insert(): Boolean;
begin
  try
    Result := False;

    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'INSERT INTO ' + TABLENAME + '(' + 'COD_STATUS, ' +
        'DES_STATUS, ' + 'VAL_PERCENTUAL_VERBA, ' + 'DOM_BAIXA) ' + 'VALUES (' +
        ':CODIGO, ' + ':DESCRICAO, ' + ':PERCENTUAL, ' + ':BAIXA)';

      ParamByName('CODIGO').AsInteger := Self.Codigo;
      ParamByName('DESCRICAO').AsString := Self.Descricao;
      ParamByName('PERCENTUAL').AsFloat := Self.Percentual;
      ParamByName('BAIXA').AsString := Self.Baixa;
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

function TStatus.Update(): Boolean;
begin
  try
    Result := False;

    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'UPDATE ' + TABLENAME + ' SET ' + 'DES_STATUS = :DESCRICAO, '
        + 'VAL_PERCENTUAL_VERBA = :PERCENTUAL, ' + 'DOM_BAIXA = :BAIXA ' +
        'WHERE ' + 'COD_STATUS = :CODIGO';

      ParamByName('CODIGO').AsInteger := Self.Codigo;
      ParamByName('DESCRICAO').AsString := Self.Descricao;
      ParamByName('PERCENTUAL').AsFloat := Self.Percentual;
      ParamByName('BAIXA').AsString := Self.Baixa;
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

function TStatus.getField(campo, coluna: String): String;
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
        SQL.Add(' WHERE COD_STATUS =:CODIGO ');
        ParamByName('CODIGO').AsInteger := Self.Codigo;
      end
      else if coluna = 'DESCRICAO' then
      begin
        SQL.Add(' WHERE DES_STATUS = :DESCRICAO ');
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

procedure TStatus.setBaixa(const Value: String);
begin
  _baixa := Value;
end;

procedure TStatus.setCodigo(const Value: Integer);
begin
  _codigo := Value;
end;

procedure TStatus.setDescricao(const Value: String);
begin
  _descricao := Value;
end;

procedure TStatus.setPercentual(const Value: Double);
begin
  _percentual := Value;
end;

end.
