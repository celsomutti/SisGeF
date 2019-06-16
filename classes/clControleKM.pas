unit clControleKM;

interface

uses clConexao;

type
  TControleKM = Class(TObject)
  private
    function getData: TDateTime;
    function getEntregador: Integer;
    function getExecutor: String;
    function getHoraRetorno: String;
    function getHoraSaida: String;
    function getKMFinal: Integer;
    function getKMInicial: Integer;
    function getManutencao: TDateTime;
    function getObs: String;
    function getPlaca: String;
    function getSequencia: Integer;
    procedure setData(const Value: TDateTime);
    procedure setEntregador(const Value: Integer);
    procedure setExecutor(const Value: String);
    procedure setHoraRetorno(const Value: String);
    procedure setHoraSaida(const Value: String);
    procedure setKMFinal(const Value: Integer);
    procedure setKMInicial(const Value: Integer);
    procedure setManutencao(const Value: TDateTime);
    procedure setObs(const Value: String);
    procedure setPlaca(const Value: String);
    procedure setSequencia(const Value: Integer);

    constructor Create;
    destructor Destroy;

  protected
    _sequencia: Integer;
    _data: TDateTime;
    _placa: String;
    _kminicial: Integer;
    _horasaida: String;
    _kmfinal: Integer;
    _horaretorno: String;
    _entregador: Integer;
    _obs: String;
    _executor: String;
    _manutencao: TDateTime;
    _conexao: TConexao;
  public

    property Sequencia: Integer read getSequencia write setSequencia;
    property Data: TDateTime read getData write setData;
    property Placa: String read getPlaca write setPlaca;
    property KMInicial: Integer read getKMInicial write setKMInicial;
    property HoraSaida: String read getHoraSaida write setHoraSaida;
    property KMFinal: Integer read getKMFinal write setKMFinal;
    property HoraRetorno: String read getHoraRetorno write setHoraRetorno;
    property Entregador: Integer read getEntregador write setEntregador;
    property Obs: String read getObs write setObs;
    property Executor: String read getExecutor write setExecutor;
    property Manutencao: TDateTime read getManutencao write setManutencao;

    function Validar(): Boolean;
    function Delete(filtro: String): Boolean;
    function getObject(id, filtro: String): Boolean;
    function Insert(): Boolean;
    function Update(): Boolean;
    function getField(campo, coluna: String): String;
    function getObjects(): Boolean;
    function getSeq(iKm1, iKm2, sData, sPlaca: String): Integer;
    function Exist(): Boolean;

    procedure MaxSequencia;
  end;

const
  TABLENAME = 'tbcontrolekm';

implementation

{ TControleKM }

uses udm, ufrmPrincipal, clUtil, Math, ufrmListaApoio, uGlobais, Dialogs,
  SysUtils, DB;

constructor TControleKM.Create;
begin
  _conexao := TConexao.Create;
  if (not _conexao.VerifyConnZEOS(0)) then
  begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
      Self.ClassName + ') !', mtError, [mbCancel], 0);
  end;
end;

destructor TControleKM.Destroy;
begin
  _conexao.Free;
end;

function TControleKM.getData: TDateTime;
begin
  Result := _data;
end;

function TControleKM.getEntregador: Integer;
begin
  Result := _entregador;
end;

function TControleKM.getExecutor: String;
begin
  Result := _executor;
end;

function TControleKM.getHoraRetorno: String;
begin
  Result := _horaretorno;
end;

function TControleKM.getHoraSaida: String;
begin
  Result := _horasaida;
end;

function TControleKM.getKMFinal: Integer;
begin
  Result := _kmfinal;
end;

function TControleKM.getKMInicial: Integer;
begin
  Result := _kminicial;
end;

function TControleKM.getManutencao: TDateTime;
begin
  Result := _manutencao;
end;

function TControleKM.getObs: String;
begin
  Result := _obs;
end;

function TControleKM.getPlaca: String;
begin
  Result := _placa;
end;

function TControleKM.getSequencia: Integer;
begin
  Result := _sequencia;
end;

function TControleKM.Validar(): Boolean;
begin
  try
    Result := False;
    if TUtil.Empty(Self.Placa) then
    begin
      MessageDlg('Informe a Placa do Veículo!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if Self.KMInicial > Self.KMFinal then
    begin
      MessageDlg('KM Inicial não pode ser maior que KM Final!', mtWarning,
        [mbOK], 0);
      Exit;
    end;
    if Self.Entregador = 0 then
    begin
      MessageDlg('Informe o Entregador / Funcionário!', mtWarning, [mbOK], 0);
      Exit;
    end;
    Result := True;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TControleKM.Delete(filtro: String): Boolean;
begin
  try
    Result := False;
    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Add('DELETE FROM ' + TABLENAME);
      if filtro = 'PLACA' then
      begin
        SQL.Add('WHERE DES_PLACA = :PLACA');
        ParamByName('PLACA').AsString := Self.Placa;
      end
      else if filtro = 'ENTREGADOR' then
      begin
        SQL.Add('WHERE COD_ENTREGADOR = :ENTREGADOR');
        ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
      end
      else if filtro = 'CODIGO' then
      begin
        SQL.Add('WHERE SEQ_CONTROLE = :CODIGO');
        ParamByName('CODIGO').AsInteger := Self.Sequencia;
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

function TControleKM.getObject(id, filtro: String): Boolean;
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

      if filtro = 'PLACA' then
      begin
        SQL.Add('WHERE DES_PLACA = :PLACA');
        ParamByName('PLACA').AsString := id;
      end
      else if filtro = 'CODIGO' then
      begin
        SQL.Add('WHERE SEQ_CONTROLE = :CODIGO');
        ParamByName('CODIGO').AsInteger := StrToInt(id);
      end
      else if filtro = 'ENTREGADOR' then
      begin
        SQL.Add('WHERE COD_ENTREGADOR = :ENTREGADOR');
        ParamByName('ENTREGADOR').AsInteger := StrToInt(id);
      end
      else if filtro = 'FILTRO' then
      begin
        dm.qrygetObject.SQL.Add('WHERE ' + Id);
      end
      else if filtro = 'DATA' then
      begin
        SQL.Add('WHERE DAT_CONTROLE = :DATA');
        ParamByName('DATA').AsDate := StrToDate(id);
      end;
      dm.ZConn.PingServer;
      Open;
      if not IsEmpty then
        First;
    end;

    if dm.QryGetObject.RecordCount > 0 then
    begin
      Self.Sequencia := dm.QryGetObject.FieldByName('SEQ_CONTROLE').AsInteger;
      Self.Data := dm.QryGetObject.FieldByName('DAT_CONTROLE').AsDateTime;
      Self.Placa := dm.QryGetObject.FieldByName('DES_PLACA').AsString;
      Self.KMInicial := dm.QryGetObject.FieldByName('QTD_KM_INICIAL').AsInteger;
      Self.HoraSaida := dm.QryGetObject.FieldByName('DES_HORA_SAIDA').AsString;
      Self.KMFinal := dm.QryGetObject.FieldByName('QTD_KM_FINAL').AsInteger;
      Self.HoraRetorno := dm.QryGetObject.FieldByName('DES_HORA_RETORNO').AsString;
      Self.Entregador := dm.QryGetObject.FieldByName('COD_ENTREGADOR').AsInteger;
      Self.Obs := dm.QryGetObject.FieldByName('DES_OBSERVACOES').AsString;
      Self.Executor := dm.QryGetObject.FieldByName('NOM_EXECUTOR').AsString;
      Self.Manutencao := dm.QryGetObject.FieldByName('DAT_MANUTENCAO').AsDateTime;
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

function TControleKM.Insert(): Boolean;
begin
  Try
    Result := False;

    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'INSERT INTO ' + TABLENAME + '(' + 'SEQ_CONTROLE, ' +
        'DAT_CONTROLE, ' + 'DES_PLACA, ' + 'QTD_KM_INICIAL, ' +
        'DES_HORA_SAIDA, ' + 'QTD_KM_FINAL, ' + 'DES_HORA_RETORNO, ' +
        'COD_ENTREGADOR, ' + 'DES_OBSERVACOES, ' + 'NOM_EXECUTOR, ' +
        'DAT_MANUTENCAO) ' + 'VALUES (' + ':CODIGO, ' + ':DATA, ' + ':PLACA, ' +
        ':KMINICIAL, ' + ':HORASAIDA, ' + ':KMFINAL, ' + ':HORARETORNO, ' +
        ':ENTREGADOR, ' + ':OBS, ' + ':EXECUTOR, ' + ':MANUTENCAO)';

      MaxSequencia;

      ParamByName('CODIGO').AsInteger := Self.Sequencia;
      ParamByName('DATA').AsDate := Self.Data;
      ParamByName('PLACA').AsString := Self.Placa;
      ParamByName('KMINICIAL').AsInteger := Self.KMInicial;
      ParamByName('HORASAIDA').AsString := Self.HoraSaida;
      ParamByName('KMFINAL').AsInteger := Self.KMFinal;
      ParamByName('HORARETORNO').AsString := Self.HoraRetorno;
      ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
      ParamByName('OBS').AsString := Self.Obs;
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

function TControleKM.Update(): Boolean;
begin
  try
    Result := False;

    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'UPDATE ' + TABLENAME + ' SET ' + 'DAT_CONTROLE     = :DATA, '
        + 'DES_PLACA        = :PLACA, ' + 'QTD_KM_INICIAL   = :KMINICIAL, ' +
        'DES_HORA_SAIDA   = :HORASAIDA, ' + 'QTD_KM_FINAL     = :KMFINAL, ' +
        'DES_HORA_RETORNO = :HORARETORNO, ' + 'COD_ENTREGADOR   = :ENTREGADOR, '
        + 'DES_OBSERVACOES  = :OBS, ' + 'NOM_EXECUTOR     = :EXECUTOR, ' +
        'DAT_MANUTENCAO   = :MANUTENCAO ' + 'WHERE ' +
        'SEQ_CONTROLE  = :CODIGO';

      ParamByName('CODIGO').AsInteger := Self.Sequencia;
      ParamByName('DATA').AsDate := Self.Data;
      ParamByName('PLACA').AsString := Self.Placa;
      ParamByName('KMINICIAL').AsInteger := Self.KMInicial;
      ParamByName('HORASAIDA').AsString := Self.HoraSaida;
      ParamByName('KMFINAL').AsInteger := Self.KMFinal;
      ParamByName('HORARETORNO').AsString := Self.HoraRetorno;
      ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
      ParamByName('OBS').AsString := Self.Obs;
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

function TControleKM.getField(campo, coluna: String): String;
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
        SQL.Add(' WHERE SEQ_CONTROLE     = :CODIGO ');
        ParamByName('CODIGO').AsInteger := Self.Sequencia;
      end
      else if coluna = 'PLACA' then
      begin
        SQL.Add(' WHERE DES_PLACA       = :PLACA ');
        ParamByName('PLACA').AsString := Self.Placa;
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

function TControleKM.getObjects(): Boolean;
begin
  Try
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

    if not(dm.QryGetObject.IsEmpty) then
    begin
      dm.QryGetObject.First;
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

procedure TControleKM.MaxSequencia;
begin
  try
    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT MAX(SEQ_CONTROLE) AS CODIGO FROM ' + TABLENAME;
      dm.ZConn.PingServer;
      Open;
      if not(IsEmpty) then
        First;
    end;

    Self.Sequencia := (dm.QryGetObject.FieldByName('CODIGO').AsInteger + 1);

    dm.QryGetObject.Close;
    dm.QryGetObject.SQL.Clear;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TControleKM.getSeq(iKm1, iKm2, sData, sPlaca: String): Integer;
begin
  try
    Result := 0;
    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);
      SQL.Add('WHERE QTD_KM_INICIAL = :KM1 AND ');
      SQL.Add('QTD_KM_FINAL = :KM2 AND ');
      SQL.Add('DAT_CONTROLE = :DATA AND ');
      SQL.Add('DES_PLACA = :PLACA');
      ParamByName('KM1').AsInteger := StrToInt(iKm1);
      ParamByName('KM2').AsInteger := StrToInt(iKm2);
      ParamByName('DATA').AsDate := StrToDate(sData);
      ParamByName('PLACA').AsString := sPlaca;
      dm.ZConn.PingServer;
      Open;
      if not IsEmpty then
      begin
        First;
        Result := FieldByName('SEQ_CONTROLE').AsInteger;
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

function TControleKM.Exist: Boolean;
begin
  Result := False;
  With dm.qryGetObject do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM ' + TABLENAME);
    SQL.Add('WHERE DAT_CONTROLE = :DATA ');
    SQL.Add('AND COD_ENTREGADOR = :ENTREGADOR ');
    SQL.Add('AND DES_PLACA = :PLACA ');
    SQL.Add('AND QTD_KM_INICIAL = :KMINICIAL ' );
    SQL.Add('AND QTD_KM_FINAL = :KMFINAL');
    ParamByName('DATA').AsDate := Self.Data;
    ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
    ParamByName('PLACA').AsString := Self.Placa;
    ParamByName('KMINICIAL').AsInteger := Self.KMInicial;
    ParamByName('KMFINAL').AsInteger := Self.KMFinal;
    dm.ZConn.PingServer;
    Open;
    if IsEmpty then
    begin
      Close;
      SQL.Clear;
      Exit;
    end;
    Close;
    SQL.Clear;
  end;
  Result := True;
end;

procedure TControleKM.setData(const Value: TDateTime);
begin
  _data := Value;
end;

procedure TControleKM.setEntregador(const Value: Integer);
begin
  _entregador := Value;
end;

procedure TControleKM.setExecutor(const Value: String);
begin
  _executor := Value;
end;

procedure TControleKM.setHoraRetorno(const Value: String);
begin
  _horaretorno := Value;
end;

procedure TControleKM.setHoraSaida(const Value: String);
begin
  _horasaida := Value;
end;

procedure TControleKM.setKMFinal(const Value: Integer);
begin
  _kmfinal := Value;
end;

procedure TControleKM.setKMInicial(const Value: Integer);
begin
  _kminicial := Value;
end;

procedure TControleKM.setManutencao(const Value: TDateTime);
begin
  _manutencao := Value;
end;

procedure TControleKM.setObs(const Value: String);
begin
  _obs := Value;
end;

procedure TControleKM.setPlaca(const Value: String);
begin
  _placa := Value;
end;

procedure TControleKM.setSequencia(const Value: Integer);
begin
  _sequencia := Value;
end;

end.
