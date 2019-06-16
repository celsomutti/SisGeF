unit clCEPAgentes;

interface

uses clConexao;

type
  TCEPAgentes = Class(TObject)

  private
    function getAgente: Integer;
    function getCep: String;
    procedure setAgente(const Value: Integer);
    procedure setCep(const Value: String);
    function getGrupo: Integer;
    procedure setGrupo(const Value: Integer);

  protected
    _agente: Integer;
    _cep: String;
    _grupo: Integer;
    _conexao: TConexao;
  public

    constructor Create;
    destructor Destroy;

    property Agente: Integer read getAgente write setAgente;
    property Cep: String read getCep write setCep;
    property Grupo: Integer read getGrupo write setGrupo;

    function Validar(): Boolean;
    function Delete(filtro: String): Boolean;
    function getObject(id, filtro: String): Boolean;
    function Insert(): Boolean;
    function Update(): Boolean;
    function getField(campo, coluna: String): String;

  end;

const
  TABLENAME = 'tbcepagente';

implementation

{ TCEPAgentes }

uses SysUtils, Dialogs, udm, clUtil, ZDataset, ZAbstractRODataset, DB;

constructor TCEPAgentes.Create;
begin
  _conexao := TConexao.Create;
  if (not _conexao.VerifyConnZEOS(0)) then
  begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
      Self.ClassName + ') !', mtError, [mbCancel], 0);
  end;
end;

destructor TCEPAgentes.Destroy;
begin
  _conexao.Free;
end;

function TCEPAgentes.getAgente: Integer;
begin
  Result := _agente;
end;

function TCEPAgentes.getCep: String;
begin
  Result := _cep;
end;

function TCEPAgentes.Validar(): Boolean;
begin
  try
    Result := False;
    if Self.Agente = 0 then
    begin
      MessageDlg('Informe o Agente!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if TUtil.Empty(Self.Cep) then
    begin
      MessageDlg('Informe a Cabeça de CEP!', mtWarning, [mbOK], 0);
      Exit;
    end;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TCEPAgentes.Delete(filtro: String): Boolean;
begin
  try
    Result := False;
    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Add('DELETE FROM ' + TABLENAME);
      if filtro = 'AGENTE' then
      begin
        SQL.Add('WHERE COD_AGENTE = :AGENTE');
        ParamByName('AGENTE').AsInteger := Self.Agente;
      end
      else if filtro = 'CEP' then
      begin
        SQL.Add('WHERE COD_CABECA_CEP = :CEP');
        ParamByName('CEP').AsString := Self.Cep;
      end;
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

function TCEPAgentes.getObject(id, filtro: String): Boolean;
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

      if filtro = 'AGENTE' then
      begin
        SQL.Add('WHERE COD_AGENTE= :AGENTE');
        ParamByName('AGENTE').AsInteger := StrToInt(id);
      end
      else if filtro = 'CEP' then
      begin
        SQL.Add('WHERE COD_CABECA_CEP = :CEP');
        ParamByName('CEP').AsString := id;
      end;
      Open;
      if not IsEmpty then
        First;
    end;

    if dm.QryGetObject.RecordCount > 0 then
    begin
      Self.Agente := dm.QryGetObject.FieldByName('COD_AGENTE').AsInteger;
      Self.Cep := dm.QryGetObject.FieldByName('COD_CABECA_CEP').AsString;
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

function TCEPAgentes.Insert(): Boolean;
begin
  Try
    Result := False;

    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'INSERT INTO ' + TABLENAME + '(' +
      'COD_AGENTE, ' +
      'COD_CABECA_CEP, ' +
      'COD_GRUPO) ' +
      'VALUES (' +
      ':AGENTE, ' +
      ':CEP, ' +
      ':GRUPO)';

      ParamByName('AGENTE').AsInteger := Self.Agente;
      ParamByName('CEP').AsString := Self.Cep;
      ParamByName('GRUPO').AsInteger := Self.Grupo;
      dm.ZConn.Ping;
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

function TCEPAgentes.Update(): Boolean;
begin
  try
    Result := False;

    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'UPDATE ' + TABLENAME + ' SET ' +
      'COD_CABECA_CEP = :CEP ' +
      'WHERE ' +
      'COD_AGENTE = :AGENTE, ' +
      'COD_GRUPO = :GRUPO';

      ParamByName('AGENTE').AsInteger := Self.Agente;
      ParamByName('CEP').AsString := Self.Cep;
      ParamByName('GRUPO').AsInteger := Self.Grupo;
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

function TCEPAgentes.getField(campo, coluna: String): String;
begin
  Try
    Result := '';

    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT ' + campo + ' FROM ' + TABLENAME;

      if coluna = 'CEP' then
      begin
        SQL.Add(' WHERE COD_CABECA_CEP =:CEP ');
        ParamByName('CEP').AsString := Self.Cep;
      end;
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

function TCEPAgentes.getGrupo: Integer;
begin
  Result := _grupo;
end;

procedure TCEPAgentes.setAgente(const Value: Integer);
begin
  _agente := Value;
end;

procedure TCEPAgentes.setCep(const Value: String);
begin
  _cep := Value;
end;

procedure TCEPAgentes.setGrupo(const Value: Integer);
begin
  _grupo := Value;
end;

end.
