unit clContatoAgente;

interface

uses
  clContatos, clConexao;

type
  TContatoAgente = class(TContatos)
  private

    constructor Creatre;
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
  TABLENAME = 'tbcontatosagentes';

implementation

uses SysUtils, Dialogs, udm, clUtil, ZDataset, ZAbstractRODataset, DB;

constructor TContatoAgente.Creatre;
begin
  _conexao := TConexao.Create;
  if (not _conexao.VerifyConnZEOS(0)) then
  begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
      Self.ClassName + ') !', mtError, [mbCancel], 0);
  end;
end;

destructor TContatoAgente.Destroy;
begin
  _conexao.Free;
end;
{ TContatoAgente }

function TContatoAgente.getCodigo: Integer;
begin
  Result := _codigo;
end;

function TContatoAgente.getSequencia: Integer;
begin
  Result := _sequencia;
end;

procedure TContatoAgente.MaxSeq;
begin
  Try
    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT MAX(SEQ_CONTATO) AS SEQUENCIA FROM ' + TABLENAME +
        ' WHERE COD_AGENTE = :CODIGO';
      ParamByName('CODIGO').AsInteger := Self.Codigo;
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

function TContatoAgente.Validar(): Boolean;
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

function TContatoAgente.Delete(filtro: String): Boolean;
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
        SQL.Add('WHERE COD_AGENTE =:CODIGO');
        ParamByName('CODIGO').AsInteger := Self.Codigo;
      end
      else if filtro = 'TIPO' then
      begin
        SQL.Add('WHERE COD_AGENTE =:CODIGO AND SEQ_CONTATO = :SEQUENCIA');
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

function TContatoAgente.getObject(Id, filtro: String): Boolean;
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
        SQL.Add(' WHERE COD_AGENTE = :CODIGO AND SEQ_CONTATO = :SEQUENCIA ORDER BY SEQ_CONTATO');
        ParamByName('CODIGO').AsInteger := Self.Codigo;
        ParamByName('SEQUENCIA').AsInteger := StrToInt(Id);
      end
      else if filtro = 'CODIGO' then
      begin
        SQL.Add(' WHERE COD_AGENTE = :CODIGO ORDER BY SEQ_CONTATO');
        ParamByName('CODIGO').AsInteger := StrToInt(Id);
      end;
      dm.ZConn.PingServer;
      Open;
      if not(IsEmpty) then
      begin
        First;
        Self.Codigo := dm.QryGetObject.FieldByName('COD_AGENTE').AsInteger;
        Self.Sequencia := dm.QryGetObject.FieldByName('SEQ_CONTATO').AsInteger;
        Self.Contato := dm.QryGetObject.FieldByName('DES_CONTATO').AsString;
        Self.Telefone := dm.QryGetObject.FieldByName('NUM_TELEFONE').AsString;
        Self.EMail := dm.QryGetObject.FieldByName('DES_EMAIL').AsString;
      end
      else
      begin
        Close;
        SQL.Clear;
        Exit;
      end;
    end;
    Result := True;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TContatoAgente.Insert(): Boolean;
begin
  try
    Result := False;

    MaxSeq;

    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'INSERT INTO ' + TABLENAME + ' ( ' + 'COD_AGENTE, ' +
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

function TContatoAgente.Update(): Boolean;
begin
  try
    Result := False;

    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'UPDATE ' + TABLENAME + ' SET ' + 'DES_CONTATO = :CONTATO, ' +
        'NUM_TELEFONE = :TELEFONE, ' + 'DES_EMAIL = :EMAIL ' + 'WHERE ' +
        'COD_AGENTE = :CODIGO AND SEQ_CONTATO = :SEQUENCIA';

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

procedure TContatoAgente.setCodigo(const Value: Integer);
begin
  _codigo := Value;
end;

procedure TContatoAgente.setSequencia(const Value: Integer);
begin
  _sequencia := Value;
end;

end.
