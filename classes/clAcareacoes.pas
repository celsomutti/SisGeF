unit clAcareacoes;

interface

uses clConexao;

type
  TAcareacoes = Class(Tobject)
  private
    function getApuracao: String;
    function getBase: Integer;
    function getEntregador: Integer;
    function getEnvio: String;
    function getExecutor: String;
    function getExtravio: Double;
    function getId: String;
    function getManutencao: TDateTime;
    function getMotivo: String;
    function getMulta: Double;
    function getNossonumero: String;
    function getObs: String;
    function getResultado: String;
    function getRetorno: String;
    function getSequencia: Integer;
    function getTratativa: String;
    function getData: TDateTime;
    procedure setApuracao(const Value: String);
    procedure setBase(const Value: Integer);
    procedure setEntregador(const Value: Integer);
    procedure setEnvio(const Value: String);
    procedure setExecutor(const Value: String);
    procedure setExtravio(const Value: Double);
    procedure setId(const Value: String);
    procedure setManutencao(const Value: TDateTime);
    procedure setMotivo(const Value: String);
    procedure setMulta(const Value: Double);
    procedure setNossoNumero(const Value: String);
    procedure setObs(const Value: String);
    procedure setResultado(const Value: String);
    procedure setRetorno(const Value: String);
    procedure setSequencia(const Value: Integer);
    procedure setTratativa(const Value: String);
    procedure setData(const Value: TDateTime);

  protected
    _sequencia: Integer;
    _id: String;
    _data: TDateTime;
    _nossonumero: String;
    _entregador: Integer;
    _base: Integer;
    _motivo: String;
    _tratativa: String;
    _apuracao: String;
    _resultado: String;
    _extravio: Double;
    _multa: Double;
    _envio: String;
    _retorno: String;
    _obs: String;
    _executor: String;
    _manutencao: TDateTime;
    _conexao: TConexao;
  public

    procedure MaxSeq;

    constructor Create;
    destructor Destroy;

    function Validar(): Boolean;
    function Delete(sfiltro: String): Boolean;
    function GetObject(id, filtro: String): Boolean;
    function GetObjects(): Boolean;
    function Insert(): Boolean;
    function Update(): Boolean;
    function NNExist(sNN: String): Boolean;
    function IDExist(sID: String): Boolean;
    function GetField(campo, coluna: String): String;

    property Sequencia: Integer read getSequencia write setSequencia;
    property id: String read getId write setId;
    property Data: TDateTime read getData write setData;
    property NossoNumero: String read getNossonumero write setNossoNumero;
    property Entregador: Integer read getEntregador write setEntregador;
    property Base: Integer read getBase write setBase;
    property Motivo: String read getMotivo write setMotivo;
    property Tratativa: String read getTratativa write setTratativa;
    property Apuracao: String read getApuracao write setApuracao;
    property Resultado: String read getResultado write setResultado;
    property Extravio: Double read getExtravio write setExtravio;
    property Multa: Double read getMulta write setMulta;
    property Envio: String read getEnvio write setEnvio;
    property Retorno: String read getRetorno write setRetorno;
    property Obs: String read getObs write setObs;
    property Executor: String read getExecutor write setExecutor;
    property Manutencao: TDateTime read getManutencao write setManutencao;
  end;

const
  TABLENAME = 'tbacareacoes';

implementation

{ TAcareacoes }

uses udm, clUtil, System.SysUtils, System.DateUtils, Vcl.Dialogs;

constructor TAcareacoes.Create;
begin
  _conexao := TConexao.Create;
  if (not _conexao.VerifyConnZEOS(0)) then
  begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
      Self.ClassName + ') !', mtError, [mbCancel], 0);
  end;
end;

destructor TAcareacoes.Destroy;
begin
  _conexao.Free;
end;

function TAcareacoes.getApuracao: String;
begin
  Result := _apuracao;
end;

function TAcareacoes.getBase: Integer;
begin
  Result := _base;
end;

function TAcareacoes.getData: TDateTime;
begin
  Result := _data;
end;

function TAcareacoes.getEntregador: Integer;
begin
  Result := _entregador;
end;

function TAcareacoes.getEnvio: String;
begin
  Result := _envio;
end;

function TAcareacoes.getExecutor: String;
begin
  Result := _executor;
end;

function TAcareacoes.getExtravio: Double;
begin
  Result := _extravio;
end;

function TAcareacoes.getId: String;
begin
  Result := _id;
end;

function TAcareacoes.getManutencao: TDateTime;
begin
  Result := _manutencao;
end;

function TAcareacoes.getMotivo: String;
begin
  Result := _motivo;
end;

function TAcareacoes.getMulta: Double;
begin
  Result := _multa;
end;

function TAcareacoes.getNossonumero: String;
begin
  Result := _nossonumero;
end;

function TAcareacoes.getObs: String;
begin
  Result := _obs;
end;

function TAcareacoes.getResultado: String;
begin
  Result := _resultado;
end;

function TAcareacoes.getRetorno: String;
begin
  Result := _retorno;
end;

function TAcareacoes.getSequencia: Integer;
begin
  Result := _sequencia;
end;

function TAcareacoes.getTratativa: String;
begin
  Result := _tratativa;
end;

procedure TAcareacoes.MaxSeq;
begin
  Try
    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT MAX(SEQ_ACAREACAO) AS SEQUENCIA FROM ' + TABLENAME;
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

function TAcareacoes.Validar(): Boolean;
var
  iApuracao, iResultado: Integer;
begin
  try
    Result := False;
    iApuracao := 0;
    iResultado := 0;
    if TUtil.Empty(Self.id) then
    begin
      MessageDlg('Informe um ID válido para esta Acareação!', mtWarning,
        [mbOK], 0);
      Exit;
    end;
    if TUtil.Empty(Self.NossoNumero) then
    begin
      MessageDlg('Informe o Nosso Número!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if Self.Entregador = 0 then
    begin
      MessageDlg('Informe o Código do Entregador!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if Self.Base = 0 then
    begin
      MessageDlg('Informe o Código da Base!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if TUtil.Empty(Self.Motivo) then
    begin
      MessageDlg('Informe o Motivo desta Acareação!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if TUtil.Empty(Self.Tratativa) then
    begin
      MessageDlg('Informe o Motivo desta Acareação!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if (not TUtil.Empty(Self.Apuracao)) then
    begin
      iApuracao := StrToInt(Copy(Self.Apuracao, 1, 2));
    end;
    if (not TUtil.Empty(Self.Resultado)) then
    begin
      if iApuracao = 1 then
      begin
        if iResultado < 3 then
        begin
          MessageDlg
            ('Resultado da Acareação inválido para o tipo de Apuração informada!',
            mtWarning, [mbOK], 0);
          Exit;
        end;
      end;
      if iApuracao = 3 then
      begin
        if iResultado > 2 then
        begin
          MessageDlg
            ('Resultado da Acareação inválido para o tipo de Apuração informada!',
            mtWarning, [mbOK], 0);
          Exit;
        end;
      end;
      if iApuracao = 6 then
      begin
        if iResultado > 2 then
        begin
          MessageDlg
            ('Resultado da Acareação inválido para o tipo de Apuração informada!',
            mtWarning, [mbOK], 0);
          Exit;
        end;
      end;
      if iApuracao = 7 then
      begin
        if iResultado > 2 then
        begin
          MessageDlg
            ('Resultado da Acareação inválido para o tipo de Apuração informada!',
            mtWarning, [mbOK], 0);
          Exit;
        end;
      end;
      if iApuracao = 10 then
      begin
        if iResultado > 2 then
        begin
          MessageDlg
            ('Resultado da Acareação inválido para o tipo de Apuração informada!',
            mtWarning, [mbOK], 0);
          Exit;
        end;
      end;
      if iApuracao = 11 then
      begin
        if iResultado > 2 then
        begin
          MessageDlg
            ('Resultado da Acareação inválido para o tipo de Apuração informada!',
            mtWarning, [mbOK], 0);
          Exit;
        end;
      end;
      if iResultado = 2 then
      begin
        if Self.Extravio = 0 then
        begin
          MessageDlg('Informe o Valor do Extravio!', mtWarning, [mbOK], 0);
          Exit;
        end;
        if Self.Multa > 0 then
        begin
          MessageDlg('Valor de Multa inválido para o Resultado informado!',
            mtWarning, [mbOK], 0);
          Exit;
        end;
      end;
      if iResultado = 3 then
      begin
        if Self.Extravio = 0 then
        begin
          MessageDlg('Informe o Valor do Extravio!', mtWarning, [mbOK], 0);
          Exit;
        end;
        if Self.Multa = 0 then
        begin
          MessageDlg('Informe o Valor da Multa!', mtWarning, [mbOK], 0);
          Exit;
        end;
      end;
      if iResultado = 4 then
      begin
        if Self.Extravio > 0 then
        begin
          MessageDlg('Valor do Extravio inválido para o Resultado informado!',
            mtWarning, [mbOK], 0);
          Exit;
        end;
        if Self.Multa = 0 then
        begin
          MessageDlg('Informe o Valor da Multa!', mtWarning, [mbOK], 0);
          Exit;
        end;
      end;
    end;
    Result := True;
  except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TAcareacoes.Delete(sfiltro: String): Boolean;
begin
  try
    Result := False;
    dm.QryCRUD.Close;
    dm.QryCRUD.SQL.Clear;
    dm.QryCRUD.SQL.Add('DELETE FROM ' + TABLENAME);
    if sfiltro = 'SEQUENCIA' then
    begin
      dm.QryCRUD.SQL.Add('WHERE SEQ_ACAREACAO = :CODIGO');
      dm.QryCRUD.ParamByName('SEQUENCIA').AsInteger := Self.Sequencia;
    end
    else if sfiltro = 'ID' then
    begin
      dm.QryCRUD.SQL.Add('WHERE ID_ACAREACAO = :ID');
      dm.QryCRUD.ParamByName('ID').AsString := Self.id;
    end
    else if sfiltro = 'NOSSONUMERO' then
    begin
      dm.QryCRUD.SQL.Add('WHERE NUM_NOSSONUMERO = :NOSSONUMERO');
      dm.QryCRUD.ParamByName('NOSSORUMERO').AsString := Self.NossoNumero;
    end
    else if sfiltro = 'ENTREGADOR' then
    begin
      dm.QryCRUD.SQL.Add('WHERE COD_ENTREGADOR = :ENTREGADOR');
      dm.QryCRUD.ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
    end
    else if sfiltro = 'BASE' then
    begin
      dm.QryCRUD.SQL.Add('WHERE COD_BASE = :BASE');
      dm.QryCRUD.ParamByName('BASE').AsInteger := Self.Base;
    end;
    dm.ZConn.PingServer;
    dm.QryCRUD.ExecSQL;
    dm.QryCRUD.Close;
    dm.QryCRUD.SQL.Clear;
    Result := True;
  except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TAcareacoes.GetObject(id: string; filtro: string): Boolean;
begin
  try
    Result := False;
    if filtro <> 'RESULTADO' then
    begin
      if TUtil.Empty(id) then
      begin
        Exit;
      end;
    end;
    dm.QryGetObject.Close;
    dm.QryGetObject.SQL.Clear;
    dm.QryGetObject.SQL.Add('SELECT * FROM ' + TABLENAME);
    if filtro = 'SEQUENCIA' then
    begin
      dm.QryGetObject.SQL.Add('WHERE SEQ_ACAREACAO = :SEQUENCIA');
      dm.QryGetObject.ParamByName('SEQUENCIA').AsInteger := StrToInt(id);
    end
    else if filtro = 'ID' then
    begin
      dm.QryGetObject.SQL.Add('WHERE ID_ACAREACAO = :ID');
      dm.QryGetObject.ParamByName('ID').AsString := id;
    end
    else if filtro = 'NOSSONUMERO' then
    begin
      dm.QryGetObject.SQL.Add('WHERE NUM_NOSSONUMERO = :NOSSONUMERO');
      dm.QryGetObject.ParamByName('NOSSONUMERO').AsString := id;
    end
    else if filtro = 'MOTIVO' then
    begin
      dm.QryGetObject.SQL.Add('WHERE DES_MOTIVO = :MOTIVO');
      dm.QryGetObject.ParamByName('MOTIVO').AsString := id;
    end
    else if filtro = 'ENVIO' then
    begin
      dm.QryGetObject.SQL.Add('WHERE DES_ENVIO_CORRESPONDENCIA = :ENVIO');
      dm.QryGetObject.ParamByName('ENVIO').AsString := id;
    end
    else if filtro = 'RETORNO' then
    begin
      dm.QryGetObject.SQL.Add('WHERE DES_RETORNO_CORRESPONDENCIA = :RETORNO');
      dm.QryGetObject.ParamByName('RETORNO').AsString := id;
    end
    else if filtro = 'DATA' then
    begin
      dm.QryGetObject.SQL.Add('WHERE DATE(DAT_ACAREACAO) = :DATA');
      dm.QryGetObject.ParamByName('DATA').AsDate := StrToDate(id);
    end
    else if filtro = 'ENTREGADOR' then
    begin
      dm.QryGetObject.SQL.Add('WHERE COD_ENTREGADOR = :ENTREGADOR');
      dm.QryGetObject.ParamByName('ENTREGADOR').AsInteger := StrToInt(id);
    end
    else if filtro = 'ENTREGADORES' then
    begin
      dm.QryGetObject.SQL.Add('WHERE COD_ENTREGADOR IN (:ENTREGADOR)');
      dm.QryGetObject.ParamByName('ENTREGADOR').AsString := id;
    end
    else if filtro = 'TRATATIVA' then
    begin
      dm.QryGetObject.SQL.Add('WHERE DES_TRATATIVA = :TRATATIVA');
      dm.QryGetObject.ParamByName('TRATATIVA').AsString := id;
    end
    else if filtro = 'RESULTADO' then
    begin
      dm.QryGetObject.SQL.Add('WHERE DES_RESULTADO = :RESULTADO');
      dm.QryGetObject.ParamByName('RESULTADO').AsString := id;
    end
    else if filtro = 'APURACAO' then
    begin
      dm.QryGetObject.SQL.Add('WHERE DES_APURACAO = :APURACAO');
      dm.QryGetObject.ParamByName('APURACAO').AsString := id;
    end
    else if filtro = 'AGENTE' then
    begin
      dm.QryGetObject.SQL.Add('WHERE COD_BASE = :BASE');
      dm.QryGetObject.ParamByName('BASE').AsInteger := StrToInt(id);
    end
    else if filtro = 'FILTRO' then
    begin
      dm.QryGetObject.SQL.Add('WHERE ' + id);
    end
    else if filtro = 'SQL' then
    begin
      dm.QryGetObject.SQL.Clear;
      dm.QryGetObject.SQL.Add(id);
    end;
    dm.ZConn.PingServer;
    dm.QryGetObject.Open;
    if (not dm.QryGetObject.IsEmpty) then
    begin
      dm.QryGetObject.First;
    end;
    if (not dm.QryGetObject.IsEmpty) then
    begin
      if filtro <> 'SQL' then
      begin
        Self.Sequencia := dm.QryGetObject.FieldByName('SEQ_ACAREACAO')
          .AsInteger;
        Self.id := dm.QryGetObject.FieldByName('ID_ACAREACAO').AsString;
        Self.Data := dm.QryGetObject.FieldByName('DAT_ACAREACAO').AsDateTime;
        Self.NossoNumero := dm.QryGetObject.FieldByName
          ('NUM_NOSSONUMERO').AsString;
        Self.Entregador := dm.QryGetObject.FieldByName('COD_ENTREGADOR')
          .AsInteger;
        Self.Base := dm.QryGetObject.FieldByName('COD_BASE').AsInteger;
        Self.Motivo := dm.QryGetObject.FieldByName('DES_MOTIVO').AsString;
        Self.Tratativa := dm.QryGetObject.FieldByName('DES_TRATATIVA').AsString;
        Self.Apuracao := dm.QryGetObject.FieldByName('DES_APURACAO').AsString;
        Self.Resultado := dm.QryGetObject.FieldByName('DES_RESULTADO').AsString;
        Self.Extravio := dm.QryGetObject.FieldByName('VAL_EXTRAVIO').AsFloat;
        Self.Multa := dm.QryGetObject.FieldByName('VAL_MULTA').AsFloat;
        Self.Envio := dm.QryGetObject.FieldByName
          ('DES_ENVIO_CORRESPONDENCIA').AsString;
        Self.Retorno := dm.QryGetObject.FieldByName
          ('DES_RETORNO_CORRESPONDENCIA').AsString;
        Self.Obs := dm.QryGetObject.FieldByName('DES_OBSERVACOES').AsString;
        Self.Executor := dm.QryGetObject.FieldByName('DES_EXECUTOR').AsString;
        Self.Manutencao := dm.QryGetObject.FieldByName('DAT_MANUTENCAO')
          .AsDateTime;
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

function TAcareacoes.GetObjects(): Boolean;
begin
  try
    Result := False;
    if TUtil.Empty(id) then
    begin
      Exit;
    end;
    dm.QryGetObject.Close;
    dm.QryGetObject.SQL.Clear;
    dm.QryGetObject.SQL.Add('SELECT * FROM ' + TABLENAME);
    dm.ZConn.PingServer;
    dm.QryGetObject.Open;
    if (not dm.QryGetObject.IsEmpty) then
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

function TAcareacoes.Insert(): Boolean;
begin
  try
    Result := False;
    dm.QryCRUD.Close;
    dm.QryCRUD.SQL.Clear;
    dm.QryCRUD.SQL.Text := 'INSERT INTO ' + TABLENAME + '(SEQ_ACAREACAO, ' +
      'ID_ACAREACAO, ' + 'DAT_ACAREACAO, ' + 'NUM_NOSSONUMERO, ' +
      'COD_ENTREGADOR, ' + 'COD_BASE, ' + 'DES_MOTIVO, ' + 'DES_TRATATIVA, ' +
      'DES_APURACAO, ' + 'DES_RESULTADO, ' + 'VAL_EXTRAVIO, ' + 'VAL_MULTA, ' +
      'DES_ENVIO_CORRESPONDENCIA, ' + 'DES_RETORNO_CORRESPONDENCIA, ' +
      'DES_OBSERVACOES, ' + 'DES_EXECUTOR, ' + 'DAT_MANUTENCAO) ' + 'VALUES ' +
      '(:SEQUENCIA, ' + ':ID, ' + ':DATA, ' + ':NOSSONUMERO, ' + ':ENTREGADOR, '
      + ':BASE, ' + ':MOTIVO, ' + ':TRATATIVA, ' + ':APURACAO, ' +
      ':RESULTADO, ' + ':EXTRAVIO, ' + ':MULTA, ' + ':ENVIO, ' + ':RETORNO, ' +
      ':OBS, ' + ':EXECUTOR, ' + ':MANUTENCAO);';
    MaxSeq;
    dm.QryCRUD.ParamByName('SEQUENCIA').AsInteger := Self.Sequencia;
    dm.QryCRUD.ParamByName('ID').AsString := Self.id;
    dm.QryCRUD.ParamByName('DATA').AsDateTime := Self.Data;
    dm.QryCRUD.ParamByName('NOSSONUMERO').AsString := Self.NossoNumero;
    dm.QryCRUD.ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
    dm.QryCRUD.ParamByName('BASE').AsInteger := Self.Base;
    dm.QryCRUD.ParamByName('MOTIVO').AsString := Self.Motivo;
    dm.QryCRUD.ParamByName('TRATATIVA').AsString := Self.Tratativa;
    dm.QryCRUD.ParamByName('APURACAO').AsString := Self.Apuracao;
    dm.QryCRUD.ParamByName('RESULTADO').AsString := Self.Resultado;
    dm.QryCRUD.ParamByName('EXTRAVIO').AsFloat := Self.Extravio;
    dm.QryCRUD.ParamByName('MULTA').AsFloat := Self.Multa;
    dm.QryCRUD.ParamByName('ENVIO').AsString := Self.Envio;
    dm.QryCRUD.ParamByName('RETORNO').AsString := Self.Retorno;
    dm.QryCRUD.ParamByName('OBS').AsString := Self.Obs;
    dm.QryCRUD.ParamByName('EXECUTOR').AsString := Self.Executor;
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

function TAcareacoes.Update(): Boolean;
begin
  try
    Result := False;
    dm.QryCRUD.Close;
    dm.QryCRUD.SQL.Clear;
    dm.QryCRUD.SQL.Text := 'UPDATE ' + TABLENAME + ' SET ' +
      'ID_ACAREACAO = :ID, ' + 'DAT_ACAREACAO = :DATA, ' +
      'NUM_NOSSONUMERO = :NOSSONUMERO, ' + 'COD_ENTREGADOR = :ENTREGADOR, ' +
      'COD_BASE = :BASE, ' + 'DES_MOTIVO = :MOTIVO, ' +
      'DES_TRATATIVA = :TRATATIVA, ' + 'DES_APURACAO = :APURACAO, ' +
      'DES_RESULTADO = :RESULTADO, ' + 'VAL_EXTRAVIO = :EXTRAVIO, ' +
      'VAL_MULTA = :MULTA, ' + 'DES_ENVIO_CORRESPONDENCIA = :ENVIO, ' +
      'DES_RETORNO_CORRESPONDENCIA = :RETORNO, ' + 'DES_OBSERVACOES = :OBS, ' +
      'DES_EXECUTOR = :EXECUTOR, ' + 'DAT_MANUTENCAO = :MANUTENCAO  ' +
      'WHERE SEQ_ACAREACAO = :SEQUENCIA;';

    dm.QryCRUD.ParamByName('SEQUENCIA').AsInteger := Self.Sequencia;
    dm.QryCRUD.ParamByName('ID').AsString := Self.id;
    dm.QryCRUD.ParamByName('DATA').AsDateTime := Self.Data;
    dm.QryCRUD.ParamByName('NOSSONUMERO').AsString := Self.NossoNumero;
    dm.QryCRUD.ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
    dm.QryCRUD.ParamByName('BASE').AsInteger := Self.Base;
    dm.QryCRUD.ParamByName('MOTIVO').AsString := Self.Motivo;
    dm.QryCRUD.ParamByName('TRATATIVA').AsString := Self.Tratativa;
    dm.QryCRUD.ParamByName('APURACAO').AsString := Self.Apuracao;
    dm.QryCRUD.ParamByName('RESULTADO').AsString := Self.Resultado;
    dm.QryCRUD.ParamByName('EXTRAVIO').AsFloat := Self.Extravio;
    dm.QryCRUD.ParamByName('MULTA').AsFloat := Self.Multa;
    dm.QryCRUD.ParamByName('ENVIO').AsString := Self.Envio;
    dm.QryCRUD.ParamByName('RETORNO').AsString := Self.Retorno;
    dm.QryCRUD.ParamByName('OBS').AsString := Self.Obs;
    dm.QryCRUD.ParamByName('EXECUTOR').AsString := Self.Executor;
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

function TAcareacoes.NNExist(sNN: string): Boolean;
begin
  Try
    Result := False;
    if TUtil.Empty(sNN) then
    begin
      Exit;
    end;
    dm.QryGetObject.Close;
    dm.QryGetObject.SQL.Clear;
    dm.QryGetObject.SQL.Add('SELECT * FROM ' + TABLENAME);
    dm.QryGetObject.SQL.Add('WHERE NUM_NOSSONUMERO = :NOSSONUMERO');
    dm.QryGetObject.ParamByName('NOSSONUMERO').AsString := sNN;
    dm.ZConn.PingServer;
    dm.QryGetObject.Open;
    if not(dm.QryGetObject.IsEmpty) then
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

function TAcareacoes.IDExist(sID: string): Boolean;
begin
  Try
    Result := False;
    if TUtil.Empty(sID) then
    begin
      Exit;
    end;
    dm.QryGetObject.Close;
    dm.QryGetObject.SQL.Clear;
    dm.QryGetObject.SQL.Add('SELECT * FROM ' + TABLENAME);
    dm.QryGetObject.SQL.Add('WHERE ID_ACAREACAO = :ID');
    dm.QryGetObject.ParamByName('ID').AsString := sID;
    dm.ZConn.PingServer;
    dm.QryGetObject.Open;
    if not(dm.QryGetObject.IsEmpty) then
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

function TAcareacoes.GetField(campo: string; coluna: string): String;
begin
  try
    Result := '';
    if TUtil.Empty(id) then
    begin
      Exit;
    end;
    dm.qryFields.Close;
    dm.qryFields.SQL.Clear;
    dm.qryFields.SQL.Add('SELECT ' + campo + ' FROM ' + TABLENAME);
    if coluna = 'SEQUENCIA' then
    begin
      dm.qryFields.SQL.Add('WHERE SEQ_ACAREACAO = :SEQUENCIA');
      dm.qryFields.ParamByName('SEQUENCIA').AsInteger := Self.Sequencia;
    end
    else if coluna = 'ID' then
    begin
      dm.qryFields.SQL.Add('WHERE ID_ACAREACAO = :ID');
      dm.qryFields.ParamByName('ID').AsString := Self.id;
    end
    else if coluna = 'NOSSONUMERO' then
    begin
      dm.qryFields.SQL.Add('WHERE NUM_NOSSONUMERO = :NOSSONUMERO');
      dm.qryFields.ParamByName('NOSSONUMERO').AsString := Self.NossoNumero;
    end
    else if coluna = 'ENTREGADOR' then
    begin
      dm.qryFields.SQL.Add('WHERE COD_ENTREGADOR = :ENTREGADOR');
      dm.qryFields.ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
    end
    else if coluna = 'BASE' then
    begin
      dm.qryFields.SQL.Add('WHERE COD_BASE = :BASE');
      dm.qryFields.ParamByName('BASE').AsInteger := Self.Base;
    end;
    dm.ZConn.PingServer;
    dm.qryFields.Open;
    if (not dm.qryFields.IsEmpty) then
    begin
      dm.qryFields.First;
      Result := dm.qryFields.FieldByName(campo).AsString
    end;
    dm.qryFields.Close;
    dm.qryFields.SQL.Clear;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

procedure TAcareacoes.setApuracao(const Value: String);
begin
  _apuracao := Value;
end;

procedure TAcareacoes.setBase(const Value: Integer);
begin
  _base := Value;
end;

procedure TAcareacoes.setData(const Value: TDateTime);
begin
  _data := Value;
end;

procedure TAcareacoes.setEntregador(const Value: Integer);
begin
  _entregador := Value;
end;

procedure TAcareacoes.setEnvio(const Value: String);
begin
  _envio := Value;
end;

procedure TAcareacoes.setExecutor(const Value: String);
begin
  _executor := Value;
end;

procedure TAcareacoes.setExtravio(const Value: Double);
begin
  _extravio := Value;
end;

procedure TAcareacoes.setId(const Value: String);
begin
  _id := Value;
end;

procedure TAcareacoes.setManutencao(const Value: TDateTime);
begin
  _manutencao := Value;
end;

procedure TAcareacoes.setMotivo(const Value: String);
begin
  _motivo := Value;
end;

procedure TAcareacoes.setMulta(const Value: Double);
begin
  _multa := Value;
end;

procedure TAcareacoes.setNossoNumero(const Value: String);
begin
  _nossonumero := Value;
end;

procedure TAcareacoes.setObs(const Value: String);
begin
  _obs := Value;
end;

procedure TAcareacoes.setResultado(const Value: String);
begin
  _resultado := Value;
end;

procedure TAcareacoes.setRetorno(const Value: String);
begin
  _retorno := Value;
end;

procedure TAcareacoes.setSequencia(const Value: Integer);
begin
  _sequencia := Value;
end;

procedure TAcareacoes.setTratativa(const Value: String);
begin
  _tratativa := Value;
end;

end.
