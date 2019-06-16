unit clExtravios;

interface

uses clConexao;

type
  TExtravios = Class(TObject)

  private
    function getCodigo: Integer;
    function getData: TDateTime;
    function getDescricao: String;
    function getAgente: Integer;
    function getMulta: Double;
    function getNossoNumero: String;
    function getProduto: Double;
    function getTotal: Double;
    function getVerba: Double;
    function getRestricao: String;
    function getEntregador: Integer;
    function getExecutor: String;
    function getManutencao: TDateTime;
    function getTipo: Integer;
    procedure setCodigo(const Value: Integer);
    procedure setData(const Value: TDateTime);
    procedure setDescricao(const Value: String);
    procedure setAgente(const Value: Integer);
    procedure setMulta(const Value: Double);
    procedure setNossoNumero(const Value: String);
    procedure setProduto(const Value: Double);
    procedure setTotal(const Value: Double);
    procedure setVerba(const Value: Double);
    procedure setRestricao(const Value: String);
    procedure setEntregador(const Value: Integer);
    procedure setExecutor(const Value: String);
    procedure setManutencao(const Value: TDateTime);
    procedure setTipo(const Value: Integer);
    function getDebito: String;
    function getValDebito: Double;
    procedure setDebito(const Value: String);
    procedure setValDebito(const Value: Double);
    function getEnvio: String;
    function getObs: String;
    function getRetorno: String;
    procedure setEnvio(const Value: String);
    procedure setObs(const Value: String);
    procedure setRetorno(const Value: String);
    function getExtrato: Integer;
    function getPercentual: Double;
    procedure setExtrato(const Value: Integer);
    procedure setPercentual(const Value: Double);

  protected
    _codigo: Integer;
    _descricao: String;
    _nossonumero: String;
    _Agente: Integer;
    _produto: Double;
    _data: TDateTime;
    _multa: Double;
    _verba: Double;
    _total: Double;
    _restricao: String;
    _entregador: Integer;
    _executor: String;
    _manutencao: TDateTime;
    _tipo: Integer;
    _valdebito: Double;
    _debito: String;
    _envio: String;
    _retorno: String;
    _obs: String;
    _percentual: Double;
    _extrato: Integer;
    _conexao: TConexao;
  public
    property Codigo: Integer read getCodigo write setCodigo;
    property Descricao: String read getDescricao write setDescricao;
    property NossoNumero: String read getNossoNumero write setNossoNumero;
    property Agente: Integer read getAgente write setAgente;
    property Produto: Double read getProduto write setProduto;
    property Data: TDateTime read getData write setData;
    property Multa: Double read getMulta write setMulta;
    property Verba: Double read getVerba write setVerba;
    property Total: Double read getTotal write setTotal;
    property Restricao: String read getRestricao write setRestricao;
    property Entregador: Integer read getEntregador write setEntregador;
    property Excutor: String read getExecutor write setExecutor;
    property Manutencao: TDateTime read getManutencao write setManutencao;
    property Tipo: Integer read getTipo write setTipo;
    property ValDebito: Double read getValDebito write setValDebito;
    property Debito: String read getDebito write setDebito;
    property Envio: String read getEnvio write setEnvio;
    property Retorno: String read getRetorno write setRetorno;
    property Obs: String read getObs write setObs;
    property Percentual: Double read getPercentual write setPercentual;
    property Extrato: Integer read getExtrato write setExtrato;

    procedure MaxCod;

    function Validar(): Boolean;
    function Delete(filtro: String): Boolean;
    function getObject(id, filtro: String): Boolean;
    function Insert(): Boolean;
    function Update(): Boolean;
    function getField(campo, coluna: String): String;
    function NNExiste(id: String): Boolean;
    function Periodo(dtInicio, dtFinal: TDate): Boolean;
    function RecExist(): Boolean;
    // procedure Merge;

    constructor Create;
    destructor Destroy;

  end;

const
  TABLENAME = 'tbextravios';

implementation

{ TExtravios }

uses System.SysUtils, Vcl.Dialogs, udm, clUtil, ZDataset, ZAbstractRODataset,
  DB, System.StrUtils;

constructor TExtravios.Create;
begin
  _conexao := TConexao.Create;
  if (not _conexao.VerifyConnZEOS(0)) then
  begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
      Self.ClassName + ') !', mtError, [mbCancel], 0);
  end;
end;

destructor TExtravios.Destroy;
begin
  _conexao.Free;
end;

function TExtravios.getCodigo: Integer;
begin
  Result := _codigo;
end;

function TExtravios.getData: TDateTime;
begin
  Result := _data;
end;

function TExtravios.getDebito: String;
begin
  Result := _debito;
end;

function TExtravios.getDescricao: String;
begin
  Result := _descricao;
end;

function TExtravios.getAgente: Integer;
begin
  Result := _Agente;
end;

function TExtravios.getMulta: Double;
begin
  Result := _multa;
end;

function TExtravios.getNossoNumero: String;
begin
  Result := _nossonumero;
end;

function TExtravios.getPercentual: Double;
begin
  Result := _percentual;
end;

function TExtravios.getProduto: Double;
begin
  Result := _produto;
end;

function TExtravios.getTotal: Double;
begin
  Result := _total;
end;

function TExtravios.getValDebito: Double;
begin
  Result := _valdebito;
end;

function TExtravios.getVerba: Double;
begin
  Result := _verba;
end;

function TExtravios.getRestricao: String;
begin
  Result := _restricao;
end;

function TExtravios.getRetorno: String;
begin
  Result := _retorno;
end;

function TExtravios.getTipo: Integer;
begin
  Result := _tipo;
end;

function TExtravios.getManutencao: TDateTime;
begin
  Result := _manutencao;
end;

function TExtravios.getEntregador: Integer;
begin
  Result := _entregador;
end;

function TExtravios.getEnvio: String;
begin
  Result := _envio;
end;

function TExtravios.getObs: String;
begin
  Result := _obs;
end;

function TExtravios.getExecutor: String;
begin
  Result := _executor;
end;

function TExtravios.getExtrato: Integer;
begin
  Result := _extrato;
end;

procedure TExtravios.MaxCod;
begin
  Try
    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT MAX(COD_EXTRAVIO) AS CODIGO FROM ' + TABLENAME;
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

function TExtravios.Validar(): Boolean;
begin
  try
    Result := False;
    if TUtil.Empty(Self.Descricao) then
    begin
      MessageDlg('Informe a Motivo do Extravio!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if TUtil.Empty(Self.NossoNumero) then
    begin
      MessageDlg('Informe o Nosso Número do Extravio!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if Self.Agente = 0 then
    begin
      MessageDlg('Informe o Administrador do CEP!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if Self.Entregador = 0 then
    begin
      MessageDlg('Informe o Entregador!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if Self.Data = 0 then
    begin
      MessageDlg('Informe a data do Extravio!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if Self.Tipo < 0 then
    begin
      MessageDlg
        ('Informe se a Restrição será para o Administrador do CEP ou Entregador!',
        mtWarning, [mbOK], 0);
      Exit;
    end;
    if TUtil.Empty(Self.Envio) then
    begin
      MessageDlg('Informe se a Correspondencia foi enviada!', mtWarning,
        [mbOK], 0);
      Exit;
    end;
    if Self.Total = 0 then
    begin
      MessageDlg('Informe o Valor do Extravio/Multa!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if Self.RecExist() then
    begin
      MessageDlg
        ('Já existe um lançamento de extravio idêntico no banco de dados!',
        mtWarning, [mbOK], 0);
      Exit;
    end;
    Result := True;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TExtravios.Delete(filtro: String): Boolean;
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
        SQL.Add('WHERE COD_EXTRAVIO = :CODIGO');
        ParamByName('CODIGO').AsInteger := Self.Codigo;
      end
      else if filtro = 'NOSSONUMERO' then
      begin
        SQL.Add('WHERE NUM_NOSSONUMERO = :NOSSONUMERO');
        ParamByName('NOSSORUMERO').AsString := Self.NossoNumero;
      end
      else if filtro = 'ENTREGADOR' then
      begin
        SQL.Add('WHERE COD_ENTREGADOR = :ENTREGADOR');
        ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
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

function TExtravios.getObject(id, filtro: String): Boolean;
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
        SQL.Add('WHERE COD_EXTRAVIO = :CODIGO');
        ParamByName('CODIGO').AsInteger := StrToInt(id);
      end
      else if filtro = 'NOSSONUMERO' then
      begin
        SQL.Add('WHERE NUM_NOSSONUMERO = :NOSSONUMERO');
        ParamByName('NOSSONUMERO').AsString := id;
      end
      else if filtro = 'MOTIVO' then
      begin
        SQL.Add('WHERE DES_EXTRAVIO = :MOTIVO');
        ParamByName('MOTIVO').AsString := id;
      end
      else if filtro = 'ENVIO' then
      begin
        SQL.Add('WHERE DES_ENVIO_CORRESPONDENCIA = :ENVIO');
        ParamByName('ENVIO').AsString := id;
      end
      else if filtro = 'RETORNO' then
      begin
        SQL.Add('WHERE DES_RETORNO_CORRESPONDENCIA = :RETORNO');
        ParamByName('RETORNO').AsString := id;
      end
      else if filtro = 'DATA' then
      begin
        SQL.Add('WHERE DAT_EXTRAVIO = :DATA');
        ParamByName('DATA').AsDate := StrToDate(id);
      end
      else if filtro = 'ENTREGADOR' then
      begin
        SQL.Add('WHERE COD_ENTREGADOR = :ENTREGADOR');
        ParamByName('ENTREGADOR').AsInteger := StrToInt(id);
      end
      else if filtro = 'ENTREGADORES' then
      begin
        SQL.Add('WHERE COD_ENTREGADOR IN (' + id + ')');
      end
      else if filtro = 'AGENTE' then
      begin
        SQL.Add('WHERE COD_AGENTE = :AGENTE');
        ParamByName('AGENTE').AsInteger := StrToInt(id);
      end
      else if filtro = 'FILTRO' then
      begin
        SQL.Add('WHERE ' + id);
      end;
      dm.ZConn.PingServer;
      Open;
      if not IsEmpty then
        First;
    end;
    if (not dm.QryGetObject.IsEmpty) then
    begin
      Self.Codigo := dm.QryGetObject.FieldByName('COD_EXTRAVIO').AsInteger;
      Self.Descricao := dm.QryGetObject.FieldByName('DES_EXTRAVIO').AsString;
      Self.NossoNumero := dm.QryGetObject.FieldByName
        ('NUM_NOSSONUMERO').AsString;
      Self.Agente := dm.QryGetObject.FieldByName('COD_AGENTE').AsInteger;
      Self.Produto := dm.QryGetObject.FieldByName('VAL_PRODUTO').AsFloat;
      Self.Data := dm.QryGetObject.FieldByName('DAT_EXTRAVIO').AsDateTime;
      Self.Multa := dm.QryGetObject.FieldByName('VAL_MULTA').AsFloat;
      Self.Verba := dm.QryGetObject.FieldByName('VAL_VERBA').AsFloat;
      Self.Total := dm.QryGetObject.FieldByName('VAL_TOTAL').AsFloat;
      Self.Restricao := dm.QryGetObject.FieldByName('DOM_RESTRICAO').AsString;
      Self.Entregador := dm.QryGetObject.FieldByName('COD_ENTREGADOR')
        .AsInteger;
      Self.Excutor := dm.QryGetObject.FieldByName('NOM_EXECUTOR').AsString;
      Self.Manutencao := dm.QryGetObject.FieldByName('DAT_MANUTENCAO')
        .AsDateTime;
      Self.Tipo := dm.QryGetObject.FieldByName('COD_TIPO').AsInteger;
      Self.ValDebito := dm.QryGetObject.FieldByName
        ('VAL_EXTRATO_FRANQUIA').AsFloat;
      Self.Debito := dm.QryGetObject.FieldByName
        ('DOM_EXTRATO_FRANQUIA').AsString;
      Self.Envio := dm.QryGetObject.FieldByName
        ('DES_ENVIO_CORRESPONDENCIA').AsString;
      Self.Retorno := dm.QryGetObject.FieldByName
        ('DES_RETORNO_CORRESPONDENCIA').AsString;
      Self.Obs := dm.QryGetObject.FieldByName('DES_OBSERVACOES').AsString;
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

function TExtravios.Insert(): Boolean;
begin
  Try
    Result := False;

    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'INSERT INTO ' + TABLENAME + '(COD_EXTRAVIO, DES_EXTRAVIO, NUM_NOSSONUMERO, COD_AGENTE, VAL_PRODUTO, DAT_EXTRAVIO, VAL_MULTA, VAL_VERBA, VAL_TOTAL, DOM_RESTRICAO, ' +
        'COD_ENTREGADOR, COD_TIPO, VAL_EXTRATO_FRANQUIA, DOM_EXTRATO_FRANQUIA, DAT_EXTRAVIO_FRANQUIA, DES_ENVIO_CORRESPONDENCIA, DES_RETORNO_CORRESPONDENCIA, DES_OBSERVACOES, ' +
        'VAL_PERCENTUAL_PAGO, ID_EXTRATO, NOM_EXECUTOR, DAT_MANUTENCAO) ' +
        'VALUES ' +
        '(:CODIGO, :DESCRICAO, :NOSSONUMERO, :AGENTE, :PRODUTO, :DATA, :MULTA, :VERBA, :TOTAL, :RESTRICAO, :ENTREGADOR, :TIPO, :VALORFRANQUIA, :EXTRATOFRANQUIA, ' +
        ':DATAFRANQUIA, :ENVIO, :RETORNO, :OBS, :PERCENTUAL, :EXTRATO, :EXECUTOR, :MANUTENCAO)';

      MaxCod;
      ParamByName('CODIGO').AsInteger := Self.Codigo;
      ParamByName('DESCRICAO').AsString := Self.Descricao;
      ParamByName('NOSSONUMERO').AsString := Self.NossoNumero;
      ParamByName('AGENTE').AsInteger := Self.Agente;
      ParamByName('PRODUTO').AsFloat := Self.Produto;
      ParamByName('DATA').AsDate := Self.Data;
      ParamByName('MULTA').AsFloat := Self.Multa;
      ParamByName('VERBA').AsFloat := Self.Verba;
      ParamByName('TOTAL').AsFloat := Self.Total;
      ParamByName('RESTRICAO').AsString := Self.Restricao;
      ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
      ParamByName('TIPO').AsInteger := Self.Tipo;
      ParamByName('VALORFRANQUIA').AsFloat := Self.ValDebito;
      ParamByName('EXTRATOFRANQUIA').AsString := Self.Debito;
      ParamByName('DATAFRANQUIA').AsDate := 0;
      ParamByName('ENVIO').AsString := Self.Envio;
      ParamByName('RETORNO').AsString := Self.Retorno;
      ParamByName('OBS').AsString := Self.Obs;
      ParamByName('PERCENTUAL').AsFloat := Self.Percentual;
      ParamByName('EXTRATO').AsInteger := Self.Extrato;
      ParamByName('EXECUTOR').AsString := Self.Excutor;
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

function TExtravios.Update(): Boolean;
begin
  try
    Result := False;

    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'UPDATE ' + TABLENAME + ' SET ' +
                  'DES_EXTRAVIO = :DESCRICAO, ' +
                  'NUM_NOSSONUMERO = :NOSSONUMERO, ' +
                  'COD_AGENTE = :AGENTE, ' +
                  'VAL_PRODUTO = :PRODUTO, ' +
                  'DAT_EXTRAVIO = :DATA, ' +
                  'VAL_MULTA = :MULTA, ' +
                  'VAL_VERBA = :VERBA, ' +
                  'VAL_TOTAL = :TOTAL, ' +
                  'DOM_RESTRICAO = :RESTRICAO, ' +
                  'COD_ENTREGADOR = :ENTREGADOR, ' +
                  'COD_TIPO = :TIPO, ' +
                  'NOM_EXECUTOR = :EXECUTOR, ' +
                  'DAT_MANUTENCAO = :MANUTENCAO, ' +
                  'VAL_EXTRATO_FRANQUIA = :VALDEBITO, ' +
                  'DOM_EXTRATO_FRANQUIA = :DEBITO, ' +
                  'DES_ENVIO_CORRESPONDENCIA  = :ENVIO, ' +
                  'DES_RETORNO_CORRESPONDENCIA = :RETORNO, ' +
                  'DES_OBSERVACOES = :OBS, ' +
                  'VAL_PERCENTUAL_PAGO = :PERCENTUAL, ' +
                  'ID_EXTRAT0 = :EXTRATO ' +
                  'WHERE ' +
                  'COD_EXTRAVIO = :CODIGO';
      ParamByName('CODIGO').AsInteger := Self.Codigo;
      ParamByName('DESCRICAO').AsString := Self.Descricao;
      ParamByName('NOSSONUMERO').AsString := Self.NossoNumero;
      ParamByName('AGENTE').AsInteger := Self.Agente;
      ParamByName('PRODUTO').AsFloat := Self.Produto;
      ParamByName('DATA').AsDate := Self.Data;
      ParamByName('MULTA').AsFloat := Self.Multa;
      ParamByName('VERBA').AsFloat := Self.Verba;
      ParamByName('TOTAL').AsFloat := Self.Total;
      ParamByName('RESTRICAO').AsString := Self.Restricao;
      ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
      ParamByName('TIPO').AsInteger := Self.Tipo;
      ParamByName('EXECUTOR').AsString := Self.Excutor;
      ParamByName('MANUTENCAO').AsDateTime := Self.Manutencao;
      ParamByName('VALDEBITO').AsFloat := Self.ValDebito;
      ParamByName('DEBITO').AsString := Self.Debito;
      ParamByName('ENVIO').AsString := Self.Envio;
      ParamByName('RETORNO').AsString := Self.Retorno;
      ParamByName('OBS').AsString := Self.Obs;
      ParamByName('PERCENTUAL').AsFloat := Self.Percentual;
      ParamByName('EXTRATO').AsInteger := Self.Extrato;
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

function TExtravios.getField(campo, coluna: String): String;
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
        SQL.Add(' WHERE COD_EXTRAVIO =:CODIGO ');
        ParamByName('CODIGO').AsInteger := Self.Codigo;
      end
      else if coluna = 'DESCRICAO' then
      begin
        SQL.Add(' WHERE DES_EXTRAVIO =:DESCRICAO ');
        ParamByName('DESCRICAO').AsString := Self.Descricao;
      end
      else if coluna = 'NOSSONUMERO' then
      begin
        SQL.Add(' WHERE NUM_NOSSONUMERO =:NOSSONUMERO ');
        ParamByName('NOSSONUMERO').AsString := Self.NossoNumero;
      end
      else if coluna = 'AGENTE' then
      begin
        SQL.Add(' WHERE COD_AGENTE = :AGENTE ');
        ParamByName('AGENTE').AsInteger := Self.Agente;
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

function TExtravios.NNExiste(id: String): Boolean;
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
      SQL.Add('WHERE NUM_NOSSONUMERO = :NOSSONUMERO');
      ParamByName('NOSSONUMERO').AsString := id;
      dm.ZConn.PingServer;
      Open;
    end;

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

function TExtravios.Periodo(dtInicio: TDate; dtFinal: TDate): Boolean;
begin
  Try
    Result := False;
    with dm.qryPesquisa do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);
      SQL.Add('WHERE DAT_EXTRAVIO BETWEEN :INICIO AND :FINAL');
      ParamByName('INICIO').AsDate := dtInicio;
      ParamByName('FINAL').AsDate := dtFinal;
      dm.ZConn.PingServer;
      Open;
    end;
    if dm.qryPesquisa.IsEmpty then
    begin
      dm.QryGetObject.Close;
      dm.QryGetObject.SQL.Clear;
      Exit;
    end;
    Result := True;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TExtravios.RecExist(): Boolean;
begin
  Try
    Result := False;
    with dm.qryPesquisa do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);
      SQL.Add('WHERE DES_EXTRAVIO = :DESCRICAO AND NUM_NOSSONUMERO = :NOSSONUMERO AND DAT_EXTRAVIO = :DATA '
        + 'AND VAL_PRODUTO = :PRODUTO AND VAL_MULTA = :MULTA AND VAL_VERBA = :VERBA AND VAL_TOTAL = :TOTAL');
      ParamByName('DESCRICAO').AsString := Self.Descricao;
      ParamByName('NOSSONUMERO').AsString := Self.NossoNumero;
      ParamByName('DATA').AsDate := Self.Data;
      ParamByName('PRODUTO').AsFloat := Self.Produto;
      ParamByName('MULTA').AsFloat := Self.Multa;
      ParamByName('VERBA').AsFloat := Self.Verba;
      ParamByName('TOTAL').AsFloat := Self.Total;
      dm.ZConn.PingServer;
      Open;
    end;
    if (not dm.qryPesquisa.IsEmpty) then
    begin
      Result := True;
    end;
    dm.qryPesquisa.Close;
    dm.qryPesquisa.SQL.Clear;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

procedure TExtravios.setCodigo(const Value: Integer);
begin
  _codigo := Value;
end;

procedure TExtravios.setData(const Value: TDateTime);
begin
  _data := Value;
end;

procedure TExtravios.setDebito(const Value: String);
begin
  _debito := Value;
end;

procedure TExtravios.setDescricao(const Value: String);
begin
  _descricao := Value;
end;

procedure TExtravios.setAgente(const Value: Integer);
begin
  _Agente := Value;
end;

procedure TExtravios.setMulta(const Value: Double);
begin
  _multa := Value;
end;

procedure TExtravios.setNossoNumero(const Value: String);
begin
  _nossonumero := Value;
end;

procedure TExtravios.setObs(const Value: String);
begin
  _obs := Value;
end;

procedure TExtravios.setPercentual(const Value: Double);
begin
  _percentual := Value;
end;

procedure TExtravios.setProduto(const Value: Double);
begin
  _produto := Value;
end;

procedure TExtravios.setTotal(const Value: Double);
begin
  _total := Value;
end;

procedure TExtravios.setValDebito(const Value: Double);
begin
  _valdebito := Value;
end;

procedure TExtravios.setVerba(const Value: Double);
begin
  _verba := Value;
end;

procedure TExtravios.setRestricao(const Value: String);
begin
  _restricao := Value;
end;

procedure TExtravios.setRetorno(const Value: String);
begin
  _retorno := Value;
end;

procedure TExtravios.setEntregador(const Value: Integer);
begin
  _entregador := Value;
end;

procedure TExtravios.setEnvio(const Value: String);
begin
  _envio := Value;
end;

procedure TExtravios.setExecutor(const Value: String);
begin
  _executor := Value;
end;

procedure TExtravios.setExtrato(const Value: Integer);
begin
  _extrato := Value;
end;

procedure TExtravios.setManutencao(const Value: TDateTime);
begin
  _manutencao := Value;
end;

procedure TExtravios.setTipo(const Value: Integer);
begin
  _tipo := Value;
end;

end.
