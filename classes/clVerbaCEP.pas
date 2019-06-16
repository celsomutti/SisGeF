unit clVerbaCEP;

interface

uses clConexao;

type
  TVerbaCEP = Class(TObject)

  private
    function getCep: String;
    function getExecutor: String;
    function getManutencao: TDateTime;
    function getVerba: Double;
    procedure setCep(const Value: String);
    procedure setExecutor(const Value: String);
    procedure setManutencao(const Value: TDateTime);
    procedure setVerba(const Value: Double);
    function getCep1: String;
    procedure setCep1(const Value: String);
    function getAgente: Integer;
    procedure setAgente(const Value: Integer);
    constructor Create;
    destructor Destroy;
  protected
    _cep: String;
    _cep1: String;
    _verba: Double;
    _agente: Integer;
    _executor: String;
    _manutencao: TDateTime;
    _conexao: TConexao;
  public
    property Cep: String read getCep write setCep;
    property Cep1: String read getCep1 write setCep1;
    property Verba: Double read getVerba write setVerba;
    property Agente: Integer read getAgente write setAgente;
    property Executor: String read getExecutor write setExecutor;
    property Manutencao: TDateTime read getManutencao write setManutencao;

    function Validar(): Boolean;
    function Delete(filtro: String): Boolean;
    function getObject(id, id1, filtro: String): Boolean;
    function getObjects(): Boolean;
    function getField(campo, coluna: String): String;
    function Insert(): Boolean;
    function Update(): Boolean;
    function Exists(id, id1, id2: String): Boolean;
    function PegaVerba(id, id1, id2: String): Double;

  end;

const
  TABLENAME = 'tbverbacep';

implementation

{ TVerbaCEP }

uses SysUtils, Dialogs, udm, clUtil, ZDataset, ZAbstractRODataset, DB;

constructor TVerbaCEP.Create;
begin
  _conexao := TConexao.Create;
  if (not _conexao.VerifyConnZEOS(0)) then
  begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
      Self.ClassName + ') !', mtError, [mbCancel], 0);
  end;
end;

destructor TVerbaCEP.Destroy;
begin
  _conexao.Free;
end;

function TVerbaCEP.getAgente: Integer;
begin
  Result := _agente;
end;

function TVerbaCEP.getCep: String;
begin
  Result := _cep;
end;

function TVerbaCEP.getCep1: String;
begin
  Result := _cep1;
end;

function TVerbaCEP.getExecutor: String;
begin
  Result := _executor;
end;

function TVerbaCEP.getManutencao: TDateTime;
begin
  Result := _manutencao;
end;

function TVerbaCEP.getVerba: Double;
begin
  Result := _verba;
end;

function TVerbaCEP.Validar(): Boolean;
begin
  Result := False;
  if TUtil.Empty(Self.Cep) then
  begin
    MessageDlg('Informe o CEP inicial!', mtWarning, [mbOK], 0);
    Exit;
  end;
  if TUtil.Empty(Self.Cep1) then
  begin
    MessageDlg('Informe o CEP Final!', mtWarning, [mbOK], 0);
    Exit;
  end;
  if Self.Cep > Self.Cep1 then
  begin
    MessageDlg('CEP Final menor que CEP Inicial!', mtWarning, [mbOK], 0);
    Exit;
  end;
  if Self.Verba = 0 then
  begin
    MessageDlg('Informe o Valor da Verba!', mtWarning, [mbOK], 0);
    Exit;
  end;
  Result := True;
end;

function TVerbaCEP.Delete(filtro: String): Boolean;
begin
  try
    Result := False;

    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Add('DELETE FROM ' + TABLENAME);
      if filtro = 'CEP' then
      begin
        SQL.Add('WHERE NUM_CEP <= :CEP AND NUM_CEP_1 >= :CEP1');
        ParamByName('CEP').AsString := Self.Cep;
        ParamByName('CEP1').AsString := Self.Cep1;
      end
      else if filtro = 'AGENTE' then
      begin
        SQL.Add('WHERE COD_AGENTE = :AGENTE');
        ParamByName('AGENTE').AsInteger := Self.Agente;
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

function TVerbaCEP.getObject(id, id1, filtro: String): Boolean;
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

      if filtro = 'CEP' then
      begin
        SQL.Add('WHERE NUM_CEP <= :CEP AND NUM_CEP_1 >= :CEP1');
        ParamByName('CEP').AsString := id;
        ParamByName('CEP1').AsString := id1;
      end
      else if filtro = 'AGENTE' then
      begin
        SQL.Add('WHERE COD_AGENTE = :AGENTE');
        ParamByName('AGENTE').AsInteger := StrToInt(id);
      end;
      dm.ZConn.PingServer;
      Open;
      if not IsEmpty then
      begin
        First;
      end;
    end;

    if dm.QryGetObject.RecordCount > 0 then
    begin
      Self.Cep := dm.QryGetObject.FieldByName('NUM_CEP').AsString;
      Self.Cep1 := dm.QryGetObject.FieldByName('NUM_CEP_1').AsString;
      Self.Verba := dm.QryGetObject.FieldByName('VAL_VERBA').AsFloat;
      Self.Executor := dm.QryGetObject.FieldByName('NOM_EXECUTOR').AsString;
      Self.Manutencao := dm.QryGetObject.FieldByName('DAT_MANUTENCAO')
        .AsDateTime;
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

function TVerbaCEP.getObjects(): Boolean;
begin
  try

    Result := False;
    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);

      Open;
      if not(IsEmpty) then
      begin
        Result := True;
        First;
      end;
    end;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TVerbaCEP.getField(campo, coluna: String): String;
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
        SQL.Add(' WHERE NUM_CEP  <= :CEP AND NUM_CEP_1 >= :CEP1');
        ParamByName('CEP').AsString := Self.Cep;
        ParamByName('CEP1').AsString := Self.Cep1;
      end
      else if coluna = 'AGENTE' then
      begin
        SQL.Add(' WHERE COD_AGENTE = :AGENTE');
        ParamByName('AGENTE').AsInteger := Self.Agente;
      end;

      dm.ZConn.PingServer;
      Open;
      if not IsEmpty then
        First;
    end;

    if dm.QryGetObject.RecordCount > 0 then
    begin
      Result := dm.QryGetObject.FieldByName(campo).AsString;
    end;

    dm.QryGetObject.Close;
    dm.QryGetObject.SQL.Clear;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TVerbaCEP.Insert(): Boolean;
begin
  Try

    Result := False;

    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'INSERT INTO ' + TABLENAME + '(' + 'NUM_CEP, ' + 'NUM_CEP_1, '
        + 'VAL_VERBA, ' + 'COD_AGENTE, ' + 'NOM_EXECUTOR, ' + 'DAT_MANUTENCAO) '
        + 'VALUES (' + ':CEP, ' + ':CEP1, ' + ':VERBA, ' + ':AGENTE, ' +
        ':EXECUTOR, ' + ':MANUTENCAO)';

      ParamByName('CEP').AsString := Self.Cep;
      ParamByName('CEP1').AsString := Self.Cep1;
      ParamByName('VERBA').AsFloat := Self.Verba;
      ParamByName('AGENTE').AsInteger := Self.Agente;
      ParamByName('EXECUTOR').AsString := Self.Executor;
      ParamByName('MANUTENCAO').AsDateTime := Self.Manutencao;
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

function TVerbaCEP.Update(): Boolean;
begin
  Try

    Result := False;

    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'UPDATE ' + TABLENAME + ' SET ' +
        'VAL_VERBA        = :VERBA, ' + 'COD_AGENTE       = :AGENTE, ' +
        'NOM_EXECUTOR     = :EXECUTOR, ' + 'DAT_MANUTENCAO   = :MANUTENCAO ' +
        'WHERE ' + 'NUM_CEP <= :CEP AND NUM_CEP_1 >= :CEP1';

      ParamByName('CEP').AsString := Self.Cep;
      ParamByName('CEP1').AsString := Self.Cep1;
      ParamByName('VERBA').AsFloat := Self.Verba;
      ParamByName('AGENTE').AsInteger := Self.Agente;
      ParamByName('EXECUTOR').AsString := Self.Executor;
      ParamByName('MANUTENCAO').AsDateTime := Self.Manutencao;
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

function TVerbaCEP.Exists(id, id1, id2: String): Boolean;
begin
  try
    Result := False;
    if TUtil.Empty(id) then
    begin
      Exit;
    end;
    with dm.qryGeral do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);
      SQL.Add('WHERE NUM_CEP <= :CEP AND NUM_CEP_1  >= :CEP1 AND COD_AGENTE = :AGENTE');
      ParamByName('CEP').AsString := id;
      ParamByName('CEP1').AsString := id1;
      ParamByName('AGENTE').AsInteger := StrToInt(id2);
      dm.ZConn.PingServer;
      Open;
      if not IsEmpty then
      begin
        First;
      end;
    end;

    if dm.qryGeral.RecordCount > 0 then
    begin
      Result := True;
    end
    else
    begin
      dm.qryGeral.Close;
      dm.qryGeral.SQL.Clear;
    end;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TVerbaCEP.PegaVerba(id, id1, id2: String): Double;
begin
  try
    Result := 0;
    if TUtil.Empty(id) then
    begin
      Exit;
    end;
    with dm.qryGeral do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);
      SQL.Add('WHERE NUM_CEP <= :CEP AND NUM_CEP_1  >= :CEP1 AND COD_AGENTE = :AGENTE');
      ParamByName('CEP').AsString := id;
      ParamByName('CEP1').AsString := id1;
      ParamByName('AGENTE').AsInteger := StrToInt(id2);
      dm.ZConn.PingServer;
      Open;
      if not IsEmpty then
      begin
        First;
        Result := FieldByName('VAL_VERBA').AsFloat;
      end;
      Close;
      SQL.Clear;
    end;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

procedure TVerbaCEP.setAgente(const Value: Integer);
begin
  _agente := Value;
end;

procedure TVerbaCEP.setCep(const Value: String);
begin
  _cep := Value;
end;

procedure TVerbaCEP.setCep1(const Value: String);
begin
  _cep1 := Value;
end;

procedure TVerbaCEP.setExecutor(const Value: String);
begin
  _executor := Value;
end;

procedure TVerbaCEP.setManutencao(const Value: TDateTime);
begin
  _manutencao := Value;
end;

procedure TVerbaCEP.setVerba(const Value: Double);
begin
  _verba := Value;
end;

end.
