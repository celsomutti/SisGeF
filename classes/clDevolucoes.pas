unit clDevolucoes;

interface

uses clConexao;

type
  TDevolucoes = Class(TObject)

  private
    function getAgente: Integer;
    function getConferencia: TDateTime;
    function getConferente: String;
    function getExpedicao: TDate;
    function getLacre: String;
    function getMotorista: String;
    function getNossoNumero: String;
    function getObjeto: Integer;
    function getRecebedor: String;
    function getRecepcao: TDateTime;
    function getRetirada: TDateTime;
    function getSequencia: Integer;
    function getStatusContainer: Integer;
    function getStatusObjeto: Integer;
    function getVolumes: Integer;
    procedure setAgente(const Value: Integer);
    procedure setConferencia(const Value: TDateTime);
    procedure setConferente(const Value: String);
    procedure setExpedicao(const Value: TDate);
    procedure setLacre(const Value: String);
    procedure setMotorista(const Value: String);
    procedure setNossoNumero(const Value: String);
    procedure setObjeto(const Value: Integer);
    procedure setRecebedor(const Value: String);
    procedure setRecepcao(const Value: TDateTime);
    procedure setRetirada(const Value: TDateTime);
    procedure setSequencia(const Value: Integer);
    procedure setStatusContainer(const Value: Integer);
    procedure setStatusObjeto(const Value: Integer);
    procedure setVolumes(const Value: Integer);

    function getManutencao: TDateTime;
    function getUsuario: String;
    procedure setManutencao(const Value: TDateTime);
    procedure setUsuario(const Value: String);
    function getPesoContainer: Double;
    procedure setPesoContainer(const Value: Double);
    function getDivergencia: String;
    procedure setDivergencian(const Value: String);
    function getDescricao: String;
    procedure setDescricao(const Value: String);

    constructor Create;
    destructor Destroy;
    function getProtocolo: String;
    procedure setProtocolo(const Value: String);
    function getDescoberto: String;
    procedure setDescoberto(const Value: String);

  protected
    _sequencia: Integer;
    _objeto: Integer;
    _expedicao: TDate;
    _lacre: String;
    _nossonumero: String;
    _volumes: Integer;
    _agente: Integer;
    _motorista: String;
    _retirada: TDateTime;
    _recebedor: String;
    _recepcao: TDateTime;
    _conferente: String;
    _conferencia: TDateTime;
    _pesocontainer: Double;
    _statuscontainer: Integer;
    _statusobjeto: Integer;
    _divergencia: String;
    _descricao: String;
    _usuario: String;
    _manutencao: TDateTime;
    _protocolo: String;
    _descoberto: String;
    _conexao: TConexao;
  public

    function Validar(): Boolean;
    function Delete(filtro: String): Boolean;
    function getObject(id, filtro: String): Boolean;
    function getObjects(): Boolean;
    function Insert(): Boolean;
    function Update(): Boolean;
    function getField(campo, coluna: String): String;
    function Exist(): Boolean;
    function FechaExpectativa(): Boolean;
    function ReabrirContainer(bLacre: Boolean): Boolean;
    function FecharContainer(sId: String): Boolean;
    function RetirarContainer(): Boolean;
    function ReceberContainer(): Boolean;
    function NumeroProtocolo(): String;
    function BasesRetorno(): Boolean;

    property Sequencia: Integer read getSequencia write setSequencia;
    property Objeto: Integer read getObjeto write setObjeto;
    property Expedicao: TDate read getExpedicao write setExpedicao;
    property Lacre: String read getLacre write setLacre;
    property NossoNumero: String read getNossoNumero write setNossoNumero;
    property Volumes: Integer read getVolumes write setVolumes;
    property Agente: Integer read getAgente write setAgente;
    property Motorista: String read getMotorista write setMotorista;
    property Retirada: TDateTime read getRetirada write setRetirada;
    property Recebedor: String read getRecebedor write setRecebedor;
    property Recepcao: TDateTime read getRecepcao write setRecepcao;
    property Conferente: String read getConferente write setConferente;
    property Conferencia: TDateTime read getConferencia write setConferencia;
    property PesoContainer: Double read getPesoContainer write setPesoContainer;
    property StatusContainer: Integer read getStatusContainer write setStatusContainer;
    property StatusObjeto: Integer read getStatusObjeto write setStatusObjeto;
    property Divergencia: String read getDivergencia write setDivergencian;
    property Descricao: String read getDescricao write setDescricao;
    property Usuario: String read getUsuario write setUsuario;
    property Manutencao: TDateTime read getManutencao write setManutencao;
    property Protocolo: String read getProtocolo write setProtocolo;
    property Descoberto: String read getDescoberto write setDescoberto;

    procedure MaxExpectativa;
    procedure MaxObjeto;
  end;

const
  TABLENAME = 'tbdevolucoes';

implementation

uses SysUtils, Dialogs, udm, clUtil, ZDataset, ZAbstractRODataset, DB, StrUtils;

{ TDevolucoes }

constructor TDevolucoes.Create;
begin
  _conexao := TConexao.Create;
  if (not _conexao.VerifyConnZEOS(0)) then
  begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
      Self.ClassName + ') !', mtError, [mbCancel], 0);
  end;
end;

destructor TDevolucoes.Destroy;
begin
  _conexao.Destroy
end;

function TDevolucoes.getObjeto: Integer;
begin
  Result := _objeto;
end;

function TDevolucoes.getPesoContainer: Double;
begin
  Result := _pesocontainer;
end;

function TDevolucoes.getProtocolo: String;
begin
  Result := _protocolo;
end;

function TDevolucoes.getRecebedor: String;
begin
  Result := _recebedor;
end;

function TDevolucoes.getRecepcao: TDateTime;
begin
  Result := _recepcao;
end;

function TDevolucoes.getRetirada: TDateTime;
begin
  Result := _retirada;
end;

function TDevolucoes.getSequencia: Integer;
begin
  Result := _sequencia;
end;

function TDevolucoes.getStatusContainer: Integer;
begin
  Result := _statuscontainer;
end;

function TDevolucoes.getStatusObjeto: Integer;
begin
  Result := _statusobjeto;
end;

function TDevolucoes.getUsuario: String;
begin
  Result := _usuario;
end;

function TDevolucoes.getVolumes: Integer;
begin
  Result := _volumes;
end;

function TDevolucoes.getAgente: Integer;
begin
  Result := _agente;
end;

function TDevolucoes.getConferencia: TDateTime;
begin
  Result := _conferencia;
end;

function TDevolucoes.getConferente: String;
begin
  Result := _conferente;
end;

function TDevolucoes.getDescoberto: String;
begin
  Result := _descoberto;
end;

function TDevolucoes.getDescricao: String;
begin
  Result := _descricao;
end;

function TDevolucoes.getDivergencia: String;
begin
  Result := _divergencia;
end;

function TDevolucoes.getExpedicao: TDate;
begin
  Result := _expedicao;
end;

function TDevolucoes.getLacre: String;
begin
  Result := _lacre;
end;

function TDevolucoes.getManutencao: TDateTime;
begin
  Result := _manutencao;
end;

function TDevolucoes.getMotorista: String;
begin
  Result := _motorista;
end;

function TDevolucoes.getNossoNumero: String;
begin
  Result := _nossonumero;
end;

function TDevolucoes.Validar(): Boolean;
begin
  Result := False;
  if TUtil.Empty(DateToStr(Self.Expedicao)) then
  begin
    MessageDlg('Informe a data da Expedição.', mtWarning, [mbOK], 0);
    Exit;
  end;
  if TUtil.Empty(Self.NossoNumero) then
  begin
    MessageDlg('Informe o Nosso Número.', mtWarning, [mbOK], 0);
    Exit;
  end;
  if Self.Agente = 0 then
  begin
    MessageDlg('Informe a Base.', mtWarning, [mbOK], 0);
    Exit;
  end;
  Result := True;
end;

function TDevolucoes.Delete(filtro: String): Boolean;
begin
  try
    Result := False;
    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Add('DELETE FROM ' + TABLENAME);
      if filtro = 'SEQUENCIA' then
      begin
        SQL.Add('WHERE SEQ_DEVOLUCAO = :SEQUENCIA');
        ParamByName('SEQUENCIA').AsInteger := Self.Sequencia;
      end
      else if filtro = 'LACRE' then
      begin
        SQL.Add('WHERE NUM_LACRE = :LACRE');
        ParamByName('LACRE').AsString := Self.Lacre;
      end
      else if filtro = 'PROTOCOLO' then
      begin
        SQL.Add('WHERE NUM_PROTOCOLO = :PROTOCOLO');
        ParamByName('PROTOCOLO').AsString := Self.Protocolo;
      end
      else if filtro = 'AGENTE' then
      begin
        SQL.Add('WHERE COD_AGENTE = :AGENTE');
        ParamByName('AGENTE').AsInteger := Self.Agente;
      end
      else if filtro = 'EXPEDICAO' then
      begin
        SQL.Add('WHERE DAT_EXPEDICAO = :EXPEDICAO');
        ParamByName('EXPEDICAO').AsDate := Self.Expedicao;
      end
      else if filtro = 'NN' then
      begin
        SQL.Add('WHERE NUM_NOSSONUMERO = :NN');
        ParamByName('NN').AsString := Self.NossoNumero;
      end
      else if filtro = 'NN0' then
      begin
        SQL.Add('WHERE NUM_NOSSONUMERO = :NN');
        SQL.Add(' AND QTD_VOLUMES = :VOLUME');
        ParamByName('NN').AsString := Self.NossoNumero;
        ParamByName('VOLUME').AsInteger := Self.Volumes;
      end
      else if filtro = 'CHAVE' then
      begin
        SQL.Add('WHERE DAT_EXPEDICAO = :EXPEDICAO');
        SQL.Add('AND COD_AGENTE = :AGENTE');
        ParamByName('EXPEDICAO').AsDate := Self.Expedicao;
        ParamByName('AGENTE').AsInteger := Self.Agente;
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

function TDevolucoes.getObjects(): Boolean;
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
    begin
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

function TDevolucoes.getObject(id, filtro: String): Boolean;
begin
  try
    Result := False;

    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      if filtro = 'RETIRADA' then
      begin
        SQL.Add('SELECT DISTINCT(NUM_LACRE) FROM ' + TABLENAME);
      end
      else if Copy(filtro,1,1) = '_' then
      begin
        SQL.Add('SELECT DISTINCT(DAT_EXPEDICAO) AS DAT_DEVOLUCAO, NUM_LACRE, NUM_PROTOCOLO FROM ' + TABLENAME);
      end
      else
      begin
        SQL.Add('SELECT * FROM ' + TABLENAME);
      end;

      if filtro = 'SEQUENCIA' then
      begin
        SQL.Add('WHERE SEQ_DEVOLUCAO = :SEQUENCIA');
        ParamByName('SEQUENCIA').AsInteger := StrToInt(id);
      end
      else if filtro = 'LACRE' then
      begin
        SQL.Add('WHERE NUM_LACRE = :LACRE ');
        if (not TUtil.Empty(id)) then
        begin
          SQL.Add('AND COD_AGENTE IN (:AGENTES)');
        end;
        ParamByName('LACRE').AsString := Self.Lacre;
        if (not TUtil.Empty(id)) then
        begin
          ParamByName('AGENTES').AsString := id;
        end;
      end
      else if filtro = '_DATA' then
      begin
        SQL.Add('WHERE DAT_EXPEDICAO = :DATA ');
        if (not TUtil.Empty(id)) then
        begin
          SQL.Add('AND COD_AGENTE IN (:AGENTES)');
        end;
        SQL.Add('AND COD_STATUS_CONTAINER >= :STATUS');
        ParamByName('STATUS').AsInteger := 2;
        ParamByName('DATA').AsDate := Self.Expedicao;
        if (not TUtil.Empty(id)) then
        begin
          ParamByName('AGENTES').AsString := id;
        end;
      end
      else if filtro = '_LACRE' then
      begin
        SQL.Add('WHERE NUM_LACRE = :LACRE ');
        if (not TUtil.Empty(id)) then
        begin
          SQL.Add('AND COD_AGENTE IN (:AGENTES)');
        end;
        SQL.Add('AND COD_STATUS_CONTAINER >= :STATUS');
        ParamByName('STATUS').AsInteger := 2;
        ParamByName('LACRE').AsString := Self.Lacre;
        if (not TUtil.Empty(id)) then
        begin
          ParamByName('AGENTES').AsString := id;
        end;
      end
      else if filtro = '_PROTOCOLO' then
      begin
        SQL.Add('WHERE NUM_PROTOCOLO = :PROTOCOLO ');
        if (not TUtil.Empty(id)) then
        begin
          SQL.Add('AND COD_AGENTE IN (:AGENTES)');
        end;
        SQL.Add('AND COD_STATUS_CONTAINER >= :STATUS');
        ParamByName('STATUS').AsInteger := 2;
        ParamByName('PROTOCOLO').AsString := Self.Protocolo;
        if (not TUtil.Empty(id)) then
        begin
          ParamByName('AGENTES').AsString := id;
        end;
      end
      else if filtro = 'PROTOCOLO' then
      begin
        SQL.Add('WHERE NUM_PROTOCOLO = :PROTOCOLO ');
        if (not id.IsEmpty) then
        begin
          SQL.Add('AND COD_AGENTE IN (:AGENTES)');
          ParamByName('AGENTES').AsString := id;
        end;
        ParamByName('PROTOCOLO').AsString := Self.Protocolo;
      end
      else if filtro = 'AGENTE' then
      begin
        SQL.Add('WHERE COD_AGENTE = :AGENTE');
        ParamByName('AGENTE').AsInteger := StrToInt(id);
      end
      else if filtro = 'EXPEDICAO' then
      begin
        SQL.Add('WHERE DAT_EXPEDICAO = :EXPEDICAO');
        ParamByName('EXPEDICAO').AsDate := StrToDate(id);
      end
      else if filtro = 'RETIRADA' then
      begin
        SQL.Add('WHERE COD_STATUS_CONTAINER = :STATUSCONTAINER');
        ParamByName('STATUSCONTAINER').AsInteger := StrToInt(id);
      end
      else if filtro = 'OBJETO' then
      begin
        SQL.Add('WHERE SEQ_OBJETO = :OBJETO');
        ParamByName('SEQUENCIA').AsInteger := Self.Sequencia;
        ParamByName('OBJETO').AsInteger := Self.Objeto;
      end
      else if filtro = 'NN' then
      begin
        SQL.Add('WHERE NUM_NOSSONUMERO = :NN');
        ParamByName('NN').AsString := id;
      end
      else if filtro = 'NN0' then
      begin
        SQL.Add('WHERE NUM_NOSSONUMERO = :NN');
        SQL.Add(' AND QTD_VOLUMES = :VOLUME');
        ParamByName('NN').AsString := Self.NossoNumero;
        ParamByName('VOLUME').AsInteger := Self.Volumes;
      end
      else if filtro = 'NN1' then
      begin
        SQL.Add('WHERE NUM_NOSSONUMERO = :NN');
        SQL.Add(' AND QTD_VOLUMES = :VOLUME');
        SQL.Add(' AND COD_AGENTE IN (:AGENTES)');
        ParamByName('NN').AsString := Self.NossoNumero;
        ParamByName('VOLUME').AsInteger := Self.Volumes;
        ParamByName('AGENTES').AsString := id;
      end
      else if filtro = 'CHAVE' then
      begin
        SQL.Add('WHERE DAT_EXPEDICAO = :EXPEDICAO');
        SQL.Add('AND COD_AGENTE IN (:AGENTE)');
        ParamByName('EXPEDICAO').AsDate := Self.Expedicao;
        ParamByName('AGENTE').AsString := Id;
      end
      else if filtro = 'CHAVE1' then
      begin
        SQL.Add('WHERE DAT_EXPEDICAO      = :EXPEDICAO ');
        SQL.Add('AND COD_AGENTE IN (:AGENTES) ');
        SQL.Add('AND COD_STATUS_CONTAINER  = :STATUSCONTAINER');
        ParamByName('EXPEDICAO').AsDate := Self.Expedicao;
        ParamByName('AGENTES').AsString := id;
        ParamByName('STATUSCONTAINER').AsInteger := Self.StatusContainer;
      end
      else if filtro = 'CHAVE2' then
      begin
        SQL.Add('WHERE DAT_EXPEDICAO      = :EXPEDICAO ');
        SQL.Add('AND COD_AGENTE IN (:AGENTES) ');
        SQL.Add('AND COD_STATUS_CONTAINER  <= :STATUSCONTAINER');
        ParamByName('EXPEDICAO').AsDate := Self.Expedicao;
        ParamByName('AGENTES').AsString := id;
        ParamByName('STATUSCONTAINER').AsInteger := Self.StatusContainer;
      end
      else if filtro = 'CHAVE3' then
      begin
        SQL.Add('WHERE DAT_EXPEDICAO      >= :EXPEDICAO ');
        SQL.Add('AND COD_AGENTE IN (:AGENTES) ');
        SQL.Add('AND COD_STATUS_CONTAINER  > :STATUSCONTAINER');
        ParamByName('STATUSCONTAINER').AsInteger := Self.StatusContainer;
        ParamByName('EXPEDICAO').AsDate := Now - 45;
        ParamByName('AGENTES').AsString := id;
      end
      else if filtro = 'CHAVE4' then
      begin
        SQL.Add('WHERE COD_AGENTE IN (:AGENTES) ');
        SQL.Add('AND COD_STATUS_OBJETO  = :STATUSOBJETO ');
        SQL.Add('ORDER BY DAT_EXPEDICAO, NUM_NOSSONUMERO');
        ParamByName('STATUSOBJETO').AsInteger := Self.StatusObjeto;
        ParamByName('AGENTES').AsString := id;
      end
      else if filtro = 'CHAVE5' then
      begin
        SQL.Add('WHERE DAT_EXPEDICAO      >= :EXPEDICAO ');
        SQL.Add('AND COD_AGENTE IN (:AGENTES) ');
        ParamByName('EXPEDICAO').AsDate := Now - 45;
        ParamByName('AGENTES').AsString := id;
      end
      else if filtro = 'CHAVE6' then
      begin
        SQL.Add('WHERE COD_AGENTE IN (:AGENTES) ');
        SQL.Add('AND COD_STATUS_CONTAINER  = :STATUSCONTAINER ');
        SQL.Add('ORDER BY DAT_EXPEDICAO, NUM_NOSSONUMERO');
        ParamByName('STATUSCONTAINER').AsInteger := Self.StatusContainer;
        ParamByName('AGENTES').AsString := id;
      end
      else if filtro = 'CHAVE7' then
      begin
        SQL.Add('WHERE DAT_EXPEDICAO = :EXPEDICAO');
        SQL.Add('ORDER BY DAT_EXPEDICAO, COD_AGENTE, NUM_NOSSONUMERO');
        ParamByName('EXPEDICAO').AsDate := Self.Expedicao;
      end
      else if filtro = 'CONTAINER' then
      begin
        SQL.Clear;
        SQL.Add('SELECT DISTINCT NUM_LACRE, DAT_RECEPCAO, NOM_RECEBEDOR FROM ' + TABLENAME +
                ' WHERE DAT_RECEPCAO BETWEEN ' + id + ' GROUP BY NUM_LACRE, DAT_RECEPCAO, NOM_RECEBEDOR');
      end;
      dm.ZConn.PingServer;
      Open;
      if not IsEmpty then
        First;
    end;

    if dm.QryGetObject.RecordCount > 0 then
    begin
      if (filtro <> 'RETIRADA') and (Copy(filtro,1,1) <> '_') and (filtro <> 'CONTAINER') then
      begin
        Self.Sequencia := dm.QryGetObject.FieldByName('SEQ_DEVOLUCAO').AsInteger;
        Self.Objeto := dm.QryGetObject.FieldByName('SEQ_OBJETO').AsInteger;
        Self.Expedicao := dm.QryGetObject.FieldByName('DAT_EXPEDICAO').AsDateTime;
        Self.Lacre := dm.QryGetObject.FieldByName('NUM_LACRE').AsString;
        Self.NossoNumero := dm.QryGetObject.FieldByName('NUM_NOSSONUMERO').AsString;
        Self.Volumes := dm.QryGetObject.FieldByName('QTD_VOLUMES').AsInteger;
        Self.Agente := dm.QryGetObject.FieldByName('COD_AGENTE').AsInteger;
        Self.Motorista := dm.QryGetObject.FieldByName('NOM_MOTORISTA').AsString;
        Self.Retirada := dm.QryGetObject.FieldByName('DAT_RETIRADA').AsDateTime;
        Self.Recebedor := dm.QryGetObject.FieldByName('NOM_RECEBEDOR').AsString;
        Self.Recepcao := dm.QryGetObject.FieldByName('DAT_RECEPCAO').AsDateTime;
        Self.Conferente := dm.QryGetObject.FieldByName('NOM_CONFERENTE').AsString;
        Self.Conferencia := dm.QryGetObject.FieldByName('DAT_CONFERENCIA').AsDateTime;
        Self.PesoContainer := dm.QryGetObject.FieldByName('QTD_PESO_CONTAINER').AsFloat;
        Self.StatusContainer := dm.QryGetObject.FieldByName('COD_STATUS_CONTAINER').AsInteger;
        Self.StatusObjeto := dm.QryGetObject.FieldByName('COD_STATUS_OBJETO').AsInteger;
        Self.Divergencia := dm.QryGetObject.FieldByName('DES_DIVERGENCIA').AsString;
        Self.Descricao := dm.QryGetObject.FieldByName('DES_DEVOLUCAO').AsString;
        Self.Protocolo := dm.QryGetObject.FieldByName('NUM_PROTOCOLO').AsString;
        Self.Descoberto := dm.QryGetObject.FieldByName('DOM_DESCOBERTO').AsString;
        Self.Usuario := dm.QryGetObject.FieldByName('NOM_USUARIO').AsString;
        Self.Manutencao := dm.QryGetObject.FieldByName('DAT_MANUTENCAO').AsDateTime;
        Self.Descoberto := dm.QryGetObject.FieldByName('DOM_DESCOBERTO').AsString;
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

function TDevolucoes.Insert(): Boolean;
begin
  try
    Result := False;

    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'INSERT INTO ' + TABLENAME +
                  '(' + 'SEQ_DEVOLUCAO, ' +
                  'SEQ_OBJETO, ' +
                  'DAT_EXPEDICAO, ' +
                  'NUM_LACRE, ' +
                  'NUM_NOSSONUMERO, ' +
                  'QTD_VOLUMES, ' +
                  'COD_AGENTE, ' +
                  'NOM_MOTORISTA, ' +
                  'DAT_RETIRADA, ' +
                  'NOM_RECEBEDOR, ' +
                  'DAT_RECEPCAO, ' +
                  'NOM_CONFERENTE, ' +
                  'DAT_CONFERENCIA, ' +
                  'QTD_PESO_CONTAINER, ' +
                  'DES_DIVERGENCIA, ' +
                  'DES_DEVOLUCAO, ' +
                  'COD_STATUS_CONTAINER, ' +
                  'COD_STATUS_OBJETO, ' +
                  'NUM_PROTOCOLO, ' +
                  'DOM_DESCOBERTO, ' +
                  'NOM_USUARIO, ' +
                  'DAT_MANUTENCAO) ' +
                  'VALUES(' +
                  ':SEQUENCIA, ' +
                  ':OBJETO, ' +
                  ':EXPEDICAO, ' +
                  ':LACRE, ' +
                  ':NOSSONUMERO, ' +
                  ':VOLUMES, ' +
                  ':AGENTE, ' +
                  ':MOTORISTA, ' +
                  ':RETIRADA, ' +
                  ':RECEBEDOR, ' +
                  ':RECEPCAO, ' +
                  ':CONFERENTE, ' +
                  ':CONFERENCIA, ' +
                  ':PESOCONTAINER, ' +
                  ':DIVERGENCIA, ' +
                  ':DESCRICAO, ' +
                  ':STATUSCONTAINER, ' +
                  ':STATUSOBJETO, ' +
                  ':PROTOCOLO, ' +
                  ':DESCOBERTO, ' +
                  ':USUARIO, ' +
                  ':MANUTENCAO)';

      if Self.Sequencia = 0 then
      begin
        MaxExpectativa;
      end;
      if Self.Objeto = 0 then
      begin
        MaxObjeto;
      end;
      ParamByName('SEQUENCIA').AsInteger := Self.Sequencia;
      ParamByName('OBJETO').AsInteger := Self.Objeto;
      ParamByName('EXPEDICAO').AsDate := Self.Expedicao;
      ParamByName('LACRE').AsString := Self.Lacre;
      ParamByName('NOSSONUMERO').AsString := Self.NossoNumero;
      ParamByName('VOLUMES').AsInteger := Self.Volumes;
      ParamByName('AGENTE').AsInteger := Self.Agente;
      ParamByName('MOTORISTA').AsString := Self.Motorista;
      if Self.Retirada > 0 then
      begin
        ParamByName('RETIRADA').AsDateTime := Self.Retirada;
      end;
      ParamByName('RECEBEDOR').AsString := Self.Recebedor;
      if Self.Recepcao > 0 then
      begin
        ParamByName('RECEPCAO').AsDateTime := Self.Recepcao;
      end;
      ParamByName('CONFERENTE').AsString := Self.Conferente;
      if Self.Conferencia > 0 then
      begin
        ParamByName('CONFERENCIA').AsDate := Self.Conferencia;
      end;
      ParamByName('PESOCONTAINER').AsFloat := Self.PesoContainer;
      ParamByName('STATUSCONTAINER').AsInteger := Self.StatusContainer;
      ParamByName('STATUSOBJETO').AsInteger := Self.StatusObjeto;
      ParamByName('DIVERGENCIA').AsString := Self.Divergencia;
      ParamByName('DESCRICAO').AsString := Self.Descricao;
      ParamByName('PROTOCOLO').AsString := Self.Protocolo;
      ParamByName('DESCOBERTO').AsString := Self.Descoberto;
      ParamByName('USUARIO').AsString := Self.Usuario;
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

function TDevolucoes.Update(): Boolean;
begin
  try
    Result := False;

    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'UPDATE ' + TABLENAME + ' SET ' +
        'DAT_EXPEDICAO        = :EXPEDICAO, ' +
        'NUM_LACRE            = :LACRE, ' +
        'NUM_NOSSONUMERO      = :NOSSONUMERO, ' +
        'QTD_VOLUMES          = :VOLUMES, ' +
        'COD_AGENTE           = :AGENTE, '+
        'NOM_MOTORISTA        = :MOTORISTA, ' +
        'DAT_RETIRADA         = :RETIRADA, ' +
        'NOM_RECEBEDOR        = :RECEBEDOR, ' +
        'DAT_RECEPCAO         = :RECEPCAO, ' +
        'NOM_CONFERENTE       = :CONFERENTE, ' +
        'DAT_CONFERENCIA      = :CONFERENCIA, ' +
        'QTD_PESO_CONTAINER   = :PESOCONTAINER, ' +
        'DES_DIVERGENCIA      = :DIVERGENCIA, ' +
        'DES_DEVOLUCAO        = :DESCRICAO, ' +
        'COD_STATUS_CONTAINER = :STATUSCONTAINER, ' +
        'COD_STATUS_OBJETO    = :STATUSOBJETO, ' +
        'NUM_PROTOCOLO        = :PROTOCOLO, ' +
        'DOM_DESCOBERTO       = :DESCOBERTO, ' +
        'NOM_USUARIO          = :USUARIO, ' +
        'DAT_MANUTENCAO       = :MANUTENCAO ' +
        'WHERE ' +
        'SEQ_DEVOLUCAO        = :SEQUENCIA AND SEQ_OBJETO = :OBJETO';

      ParamByName('SEQUENCIA').AsInteger := Self.Sequencia;
      ParamByName('OBJETO').AsInteger := Self.Objeto;
      ParamByName('EXPEDICAO').AsDate := Self.Expedicao;
      ParamByName('LACRE').AsString := Self.Lacre;
      ParamByName('NOSSONUMERO').AsString := Self.NossoNumero;
      ParamByName('VOLUMES').AsInteger := Self.Volumes;
      ParamByName('AGENTE').AsInteger := Self.Agente;
      ParamByName('MOTORISTA').AsString := Self.Motorista;
      if Self.Retirada > 0 then
      begin
        ParamByName('RETIRADA').AsDateTime := Self.Retirada;
      end;
      ParamByName('RECEBEDOR').AsString := Self.Recebedor;
      if Self.Recepcao > 0 then
      begin
        ParamByName('RECEPCAO').AsDateTime := Self.Recepcao;
      end;
      ParamByName('CONFERENTE').AsString := Self.Conferente;
      if Self.Conferencia > 0 then
      begin
        ParamByName('CONFERENCIA').AsDate := Self.Conferencia;
      end;
      ParamByName('PESOCONTAINER').AsFloat := Self.PesoContainer;
      ParamByName('STATUSCONTAINER').AsInteger := Self.StatusContainer;
      ParamByName('STATUSOBJETO').AsInteger := Self.StatusObjeto;
      ParamByName('DIVERGENCIA').AsString := Self.Divergencia;
      ParamByName('DESCRICAO').AsString := Self.Descricao;
      ParamByName('PROTOCOLO').AsString := Self.Protocolo;
      ParamByName('DESCOBERTO').AsString := Self.Descoberto;
      ParamByName('USUARIO').AsString := Self.Usuario;
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

function TDevolucoes.getField(campo, coluna: String): String;
begin
  try
    Result := '';

    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT ' + campo + ' FROM ' + TABLENAME;

      if coluna = 'SEQUENCIA' then
      begin
        SQL.Add('WHERE SEQUENCIA = :SEQUENCIA');
        ParamByName('SEQUENCIA').AsInteger := Self.Sequencia;
      end
      else if coluna = 'LACRE' then
      begin
        SQL.Add('WHERE NUM_LACRE = :LACRE');
        ParamByName('LACRE').AsString := Self.Lacre;
      end
      else if coluna = 'PROTOCOLO' then
      begin
        SQL.Add('WHERE NUM_PROTOCOLO = :PROTOCOLO');
        ParamByName('PROTOCOLO').AsString := Self.Protocolo;
      end
      else if coluna = 'EXPEDICAO' then
      begin
        SQL.Add('WHERE DAT_EXPEDICAO = :EXPEDICAO');
        ParamByName('EXPEDICAO').AsDate := Self.Expedicao;
      end
      else if coluna = 'OBJETO' then
      begin
        SQL.Add('WHERE SEQ_OBJETO = :OBJETO');
        SQL.Add('AND SEQ_OBJETO = :OBJETO');
        ParamByName('SEQUENCIA').AsInteger := Self.Sequencia;
        ParamByName('OBJETO').AsInteger := Self.Objeto;
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

procedure TDevolucoes.MaxObjeto;
begin
  try
    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT MAX(SEQ_OBJETO) AS OBJETO FROM ' + TABLENAME +
        ' WHERE SEQ_DEVOLUCAO = :SEQUENCIA';
      ParamByName('SEQUENCIA').AsInteger := Self.Sequencia;
      dm.ZConn.PingServer;
      Open;
      if not(IsEmpty) then
        First;
    end;
    Self.Objeto := (dm.QryGetObject.FieldByName('OBJETO').AsInteger) + 1;

    dm.QryGetObject.Close;
    dm.QryGetObject.SQL.Clear;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

procedure TDevolucoes.MaxExpectativa;
begin
  try
    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT DISTINCT MAX(SEQ_DEVOLUCAO) AS SEQUENCIA FROM ' +
        TABLENAME;
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

function TDevolucoes.Exist(): Boolean;
begin
  try
    Result := False;

    with dm.qryPesquisa do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);
      SQL.Add('WHERE NUM_NOSSONUMERO = :NOSSONUMERO ');
      SQL.Add('AND QTD_VOLUMES = :VOLUMES ');
      ParamByName('NOSSONUMERO').AsString := Self.NossoNumero;
      ParamByName('VOLUMES').AsInteger := Self.Volumes;
      dm.ZConn.PingServer;
      Open;
      if not IsEmpty then
      begin
        Result := True;
        dm.qryPesquisa.Close;
        dm.qryPesquisa.SQL.Clear;
      end;
    end;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TDevolucoes.FechaExpectativa(): Boolean;
begin
  try
    Result := False;
    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'UPDATE ' + TABLENAME + ' SET ' +
        'COD_STATUS_OBJETO    = :STATUSOBJETO, ' +
        'COD_STATUS_CONTAINER = :STATUSCONTAINER, ' +
        'NOM_USUARIO          = :USUARIO, ' +
        'DAT_MANUTENCAO       = :MANUTENCAO ' +
        'WHERE ' +
        'NUM_NOSSONUMERO      = :NOSSONUMERO AND ' +
        'QTD_VOLUMES          = :VOLUMES';
      ParamByName('NOSSONUMERO').AsString := Self.NossoNumero;
      ParamByName('STATUSOBJETO').AsInteger := Self.StatusObjeto;
      ParamByName('STATUSCONTAINER').AsInteger := Self.StatusContainer;
      ParamByName('USUARIO').AsString := Self.Usuario;
      ParamByName('MANUTENCAO').AsDateTime := Self.Manutencao;
      ParamByName('VOLUMES').AsInteger := Self.Volumes;
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

function TDevolucoes.ReabrirContainer(bLacre: Boolean): Boolean;
begin
  try
    Result := False;
    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'UPDATE ' + TABLENAME + ' SET ' +
        'NUM_LACRE            = :LACREALTERADO, ' +
        'QTD_PESO_CONTAINER   = :PESOCONTAINER, ' +
        'COD_STATUS_CONTAINER = :STATUSCONTAINER, ' +
        'NUM_PROTOCOLO        = :PROTOCOLO, ' +
        'NOM_USUARIO          = :USUARIO, ' +
        'DAT_MANUTENCAO       = :MANUTENCAO ' + 'WHERE ' +
        'NUM_LACRE            = :LACRE';
      if bLacre then
      begin
        ParamByName('LACREALTERADO').AsString := '0';
      end
      else
      begin
        ParamByName('LACREALTERADO').AsString := Self.Lacre;
      end;
      ParamByName('LACRE').AsString := Self.Lacre;
      ParamByName('PESOCONTAINER').AsFloat := Self.PesoContainer;
      ParamByName('STATUSCONTAINER').AsInteger := 1;
      ParamByName('PROTOCOLO').AsString := '';
      ParamByName('USUARIO').AsString := Self.Usuario;
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

function TDevolucoes.FecharContainer(sId: String): Boolean;
begin
  try
    Result := False;
    dm.QryCRUD.Close;
    dm.QryCRUD.SQL.Clear;
    dm.QryCRUD.SQL.Text :=  'UPDATE ' + TABLENAME + ' SET ' +
                            'NUM_LACRE            = :LACRE, ' +
                            'COD_STATUS_OBJETO    = :STATUSOBJETO, ' +
                            'COD_STATUS_CONTAINER = :STATUSCONTAINER, ' +
                            'QTD_PESO_CONTAINER   = :PESOCONTAINER, ' +
                            'NUM_PROTOCOLO        = :PROTOCOLO, ' +
                            'NOM_USUARIO          = :USUARIO, ' +
                            'DAT_MANUTENCAO       = :MANUTENCAO ' +
                            'WHERE ' +
                            'NUM_NOSSONUMERO      = :NOSSONUMERO';
    dm.QryCRUD.ParamByName('LACRE').AsString := Self.Lacre;
    dm.QryCRUD.ParamByName('NOSSONUMERO').AsString := Self.NossoNumero;
    dm.QryCRUD.ParamByName('PESOCONTAINER').AsFloat := Self.PesoContainer;
    dm.QryCRUD.ParamByName('STATUSOBJETO').AsInteger := Self.StatusObjeto;
    dm.QryCRUD.ParamByName('STATUSCONTAINER').AsInteger := Self.StatusContainer;
    dm.QryCRUD.ParamByName('PROTOCOLO').AsString := Self.Protocolo;
    dm.QryCRUD.ParamByName('USUARIO').AsString := Self.Usuario;
    dm.QryCRUD.ParamByName('MANUTENCAO').AsDateTime := Self.Manutencao;
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

function TDevolucoes.RetirarContainer(): Boolean;
begin
  try
    Result := False;
    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'UPDATE ' + TABLENAME + ' SET ' +
        'COD_STATUS_CONTAINER = :STATUSCONTAINER, ' +
        'NOM_MOTORISTA        = :MOTORISTA, ' +
        'DAT_RETIRADA         = :RETIRADA ' +
        'WHERE ' +
        'NUM_LACRE            = :LACRE';
      ParamByName('LACRE').AsString := Self.Lacre;
      ParamByName('STATUSCONTAINER').AsInteger := 3;
      ParamByName('MOTORISTA').AsString := Self.Motorista;
      ParamByName('RETIRADA').AsDateTime := Self.Retirada;;
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

function TDevolucoes.ReceberContainer(): Boolean;
begin
  try
    Result := False;
    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'UPDATE ' + TABLENAME + ' SET ' +
        'COD_STATUS_CONTAINER = :STATUSCONTAINER, ' +
        'NOM_RECEBEDOR        = :RECEBEDOR, ' +
        'DAT_RECEPCAO         = :RECEPCAO ' +
        'WHERE ' +
        'NUM_LACRE            = :LACRE';
      ParamByName('LACRE').AsString := Self.Lacre;
      ParamByName('STATUSCONTAINER').AsInteger := 4;
      ParamByName('RECEBEDOR').AsString := Self.Recebedor;
      ParamByName('RECEPCAO').AsDateTime := Self.Recepcao;;
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

function TDevolucoes.NumeroProtocolo(): String;
var
  sNumero, sBase: String;
begin
  try
    Result := '';
    sBase := FormatFloat('000000', Self.Agente);
    sNumero := sBase + RightStr(FloatToStr(Now),6);
    Self.Protocolo := sNumero;
    while (not Self.getField('NUM_PROTOCOLO','PROTOCOLO').IsEmpty) do
    begin
      sNumero := sBase + RightStr(FloatToStr(Now),6);
      Self.Protocolo := RightStr(sNumero, 6);
    end;
  finally
    Result := Self.Protocolo;
  end;
end;

function TDevolucoes.BasesRetorno(): Boolean;
var
  sSQL: String;
begin
  Result := False;;
  sSQL := 'SELECT DISTINCT COD_AGENTE FROM ' + TABLENAME + ' WHERE COD_STATUS_OBJETO = :STATUSOBJETO';
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  dm.qryPesquisa.SQL.Text := sSQL;
  dm.qryPesquisa.ParamByName('STATUSOBJETO').AsInteger := 0;
  dm.ZConn.PingServer;
  dm.qryPesquisa.Open;
  if not dm.qryPesquisa.IsEmpty then
  begin
    dm.qryPesquisa.First;
  end
  else
  begin
    dm.qryPesquisa.Close;
    dm.qryPesquisa.SQL.Clear;
    Exit;
  end;
  Result := True;;
end;

procedure TDevolucoes.setAgente(const Value: Integer);
begin
  _agente := Value;
end;

procedure TDevolucoes.setConferencia(const Value: TDateTime);
begin
  _conferencia := Value;
end;

procedure TDevolucoes.setConferente(const Value: String);
begin
  _conferente := Value;
end;

procedure TDevolucoes.setDescoberto(const Value: String);
begin
  _descoberto := Value;
end;

procedure TDevolucoes.setDescricao(const Value: String);
begin
  _descricao := Value;
end;

procedure TDevolucoes.setDivergencian(const Value: String);
begin
  _divergencia := Value;
end;

procedure TDevolucoes.setExpedicao(const Value: TDate);
begin
  _expedicao := Value;
end;

procedure TDevolucoes.setLacre(const Value: String);
begin
  _lacre := Value;
end;

procedure TDevolucoes.setManutencao(const Value: TDateTime);
begin
  _manutencao := Value;
end;

procedure TDevolucoes.setMotorista(const Value: String);
begin
  _motorista := Value;
end;

procedure TDevolucoes.setNossoNumero(const Value: String);
begin
  _nossonumero := Value;
end;

procedure TDevolucoes.setObjeto(const Value: Integer);
begin
  _objeto := Value;
end;

procedure TDevolucoes.setPesoContainer(const Value: Double);
begin
  _pesocontainer := Value;
end;

procedure TDevolucoes.setProtocolo(const Value: String);
begin
  _protocolo := Value;
end;

procedure TDevolucoes.setRecebedor(const Value: String);
begin
  _recebedor := Value;
end;

procedure TDevolucoes.setRecepcao(const Value: TDateTime);
begin
  _recepcao := Value;
end;

procedure TDevolucoes.setRetirada(const Value: TDateTime);
begin
  _retirada := Value;
end;

procedure TDevolucoes.setSequencia(const Value: Integer);
begin
  _sequencia := Value;
end;

procedure TDevolucoes.setStatusContainer(const Value: Integer);
begin
  _statuscontainer := Value;
end;

procedure TDevolucoes.setStatusObjeto(const Value: Integer);
begin
  _statusobjeto := Value;
end;

procedure TDevolucoes.setUsuario(const Value: String);
begin
  _usuario := Value;
end;

procedure TDevolucoes.setVolumes(const Value: Integer);
begin
  _volumes := Value;
end;

end.
