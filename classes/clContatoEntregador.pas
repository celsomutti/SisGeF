unit clContatoEntregador;

interface

uses
  clContatos, clConexao;

type
  TContatoEntregador = class(TContatos)
  private

    constructor Create;
    destructor Destroy;

    function getCodigo: Integer;
    function getSequencia: Integer;
    procedure setCodigo(const Value: Integer);
    procedure setSequencia(const Value: Integer);

  protected
    _codigo: Integer;
    _sequencia: Integer;
    _conexao: TConexao;
  public

    property Codigo: Integer read getCodigo write setCodigo;
    property Sequencia: Integer read getSequencia write setSequencia;

    procedure MaxSeq;

    function Validar(): Boolean;
    function Delete(filtro: String): Boolean;
    function getObject(Id: String; filtro: String): Boolean;
    function Insert(): Boolean;
    function Update(): Boolean;

  end;

const
  TABLENAME = 'tbcontatosentregadores';

implementation

uses SysUtils, Dialogs, udm, clUtil, ZDataset, ZAbstractRODataset, DB;

{ TContatoEntregador }

constructor TContatoEntregador.Create;
begin
  _conexao := TConexao.Create;
  if (not _conexao.VerifyConnZEOS(0)) then
  begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
      Self.ClassName + ') !', mtError, [mbCancel], 0);
  end;
end;

destructor TContatoEntregador.Destroy;
begin
  _conexao.Free;
end;

function TContatoEntregador.getCodigo: Integer;
begin
  Result := _codigo;
end;

function TContatoEntregador.getSequencia: Integer;
begin
  Result := _sequencia;
end;

procedure TContatoEntregador.MaxSeq;
begin
  Try
    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT MAX(SEQ_CONTATO) AS SEQUENCIA FROM ' + TABLENAME +
        ' WHERE COD_ENTREGADOR = :CODIGO';
      ParamByName('CODIGO').AsString := IntToStr(Self.Codigo);
      dm.ZConn.PingServer;
      Open;
      if not(IsEmpty) then
        First;
    end;

    Self.Sequencia := (dm.QryGetObject.FieldByName('SEQUENCIA').AsInteger) + 1;

    dm.QryGetObject.Close;
    dm.QryGetObject.SQL.Clear;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TContatoEntregador.Validar(): Boolean;
begin
  Result := False;
  if not(TUtil.Empty(Self.EMail)) then
  begin
    if not(TUtil.ValidaEMail(pChar(Self.EMail))) then
    begin
      MessageDlg('Endereço de E-Mail inválido.', mtWarning, [mbOK], 0);
      Exit;
    end;
  end;
  Result := True;
end;

function TContatoEntregador.Delete(filtro: String): Boolean;
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
        SQL.Add('WHERE COD_ENTREGADOR =:CODIGO');
        ParamByName('CODIGO').AsInteger := Self.Codigo;
      end
      else if filtro = 'TIPO' then
      begin
        SQL.Add('WHERE COD_ENTREGADOR =:CODIGO AND SEQ_CONTATO = :SEQUENCIA');
        ParamByName('CODIGO').AsInteger := Self.Codigo;
        ParamByName('SEQUENCIA').AsInteger := Self.Sequencia;
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

function TContatoEntregador.getObject(Id, filtro: String): Boolean;
begin
  try
    Result := False;

    if TUtil.Empty(Id) then
      Exit;

    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);

      if filtro = 'SEQUENCIA' then
      begin
        SQL.Add(' WHERE COD_ENTREGADOR = :CODIGO AND SEQ_CONTATO = :SEQUENCIA');
        ParamByName('CODIGO').AsInteger := Self.Codigo;
        ParamByName('SEQUENCIA').AsInteger := StrToInt(Id);
      end
      else if filtro = 'CODIGO' then
      begin
        SQL.Add(' WHERE COD_ENTREGADOR = :CODIGO');
        ParamByName('CODIGO').AsInteger := StrToInt(Id);
      end;
      dm.ZConn.PingServer;
      Open;
      if not IsEmpty then
        First;
    end;

    if dm.QryGetObject.RecordCount > 0 then
    begin
      if filtro = 'SEQUENCIA' then
      begin
        Self.Codigo := dm.QryGetObject.FieldByName('COD_ENTREGADOR').AsInteger;
        Self.Sequencia := dm.QryGetObject.FieldByName('SEQ_CONTATO').AsInteger;
        Self.Contato := dm.QryGetObject.FieldByName('DES_CONTATO').AsString;
        Self.Telefone := dm.QryGetObject.FieldByName('NUM_TELEFONE').AsString;
        Self.EMail := dm.QryGetObject.FieldByName('DES_EMAIL').AsString;
        dm.QryGetObject.Close;
        dm.QryGetObject.SQL.Clear;
        Result := True;
      end;
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

function TContatoEntregador.Insert(): Boolean;
begin
  try
    Result := False;

    MaxSeq;

    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'INSERT INTO ' + TABLENAME + ' ( ' + 'COD_ENTREGADOR, ' +
        'SEQ_CONTATO, ' + 'DES_CONTATO, ' + 'NUM_TELEFONE, ' + 'DES_EMAIL ' +
        ') ' + 'VALUES(' + ':CODIGO, ' + ':SEQUENCIA, ' + ':CONTATO, ' +
        ':TELEFONE, ' + ':EMAIL ' + ') ';
      ParamByName('CODIGO').AsInteger := Self.Codigo;
      ParamByName('SEQUENCIA').AsInteger := Self.Sequencia;
      ParamByName('CONTATO').AsString := Self.Contato;
      ParamByName('TELEFONE').AsString := Self.Telefone;
      ParamByName('EMAIL').AsString := Self.EMail;
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

function TContatoEntregador.Update(): Boolean;
begin
  try
    Result := False;

    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'UPDATE ' + TABLENAME + ' SET ' + 'DES_CONTATO = :CONTATO, ' +
        'NUM_TELEFONE = :TELEFONE, ' + 'DES_EMAIL = :EMAIL ' + 'WHERE ' +
        'COD_ENTREGADOR = :CODIGO AND SEQ_CONTATO = :SEQUENCIA';

      ParamByName('CODIGO').AsInteger := Self.Codigo;
      ParamByName('SEQUENCIA').AsInteger := Self.Sequencia;
      ParamByName('CONTATO').AsString := Self.Contato;
      ParamByName('TELEFONE').AsString := Self.Telefone;
      ParamByName('EMAIL').AsString := Self.EMail;
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

procedure TContatoEntregador.setCodigo(const Value: Integer);
begin
  _codigo := Value;
end;

procedure TContatoEntregador.setSequencia(const Value: Integer);
begin
  _sequencia := Value;
end;

end.
