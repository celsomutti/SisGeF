unit clOrdemServico;

interface

uses clConexao;

type
  TOrdemServico = Class(TObject)
  private
    function getData: TDateTime;
    function getEntregador: Integer;
    function getExecutor: String;
    function getHoraRetorno: String;
    function getHoraSaida: String;
    function getKmFinal: Integer;
    function getKmInicial: Integer;
    function getManutencao: TDateTime;
    function getNumero: Integer;
    function getRota: String;
    function getValorDiaria: Double;
    function getVeiculo: Integer;
    procedure setData(const Value: TDateTime);
    procedure setEntregador(const Value: Integer);
    procedure setExecutor(const Value: String);
    procedure setHoraRetorno(const Value: String);
    procedure setHoraSaida(const Value: String);
    procedure setKmFinal(const Value: Integer);
    procedure setKmInicial(const Value: Integer);
    procedure setManutencao(const Value: TDateTime);
    procedure setNumero(const Value: Integer);
    procedure setRota(const Value: String);
    procedure setValorDiaria(const Value: Double);
    procedure setVeiculo(const Value: Integer);
    function getDescricao: String;
    procedure setDescricao(const Value: String);
    function getDataPago: TDateTime;
    function getFechado: String;
    procedure setDataPago(const Value: TDateTime);
    procedure setFechado(const Value: String);
    function getExtrato: String;
    procedure setExtrato(const Value: String);
    constructor Create;
    destructor Destroy;
    procedure SetID(val: Integer);
    function getId: Integer;
    function getCliente: Integer;
    procedure setCliente(const Value: Integer);
  protected
    _numero: Integer;
    _data: TDateTime;
    _entregador: Integer;
    _cliente : Integer;
    _veiculo: Integer;
    _rota: String;
    _kminicial: Integer;
    _kmfinal: Integer;
    _horasaida: String;
    _horaretorno: String;
    _descricao: String;
    _valordiaria: Double;
    _fechado: String;
    _datapago: TDateTime;
    _executor: String;
    _manutencao: TDateTime;
    _extrato: String;
    _id: Integer;
    _conexao: TConexao;
  public
    property Numero: Integer read getNumero write setNumero;
    property Data: TDateTime read getData write setData;
    property Entregador: Integer read getEntregador write setEntregador;
    property Cliente : Integer read getCliente write setCliente;
    property Veiculo: Integer read getVeiculo write setVeiculo;
    property Rota: String read getRota write setRota;
    property KmInicial: Integer read getKmInicial write setKmInicial;
    property KmFinal: Integer read getKmFinal write setKmFinal;
    property HoraSaida: String read getHoraSaida write setHoraSaida;
    property HoraRetorno: String read getHoraRetorno write setHoraRetorno;
    property Descricao: String read getDescricao write setDescricao;
    property ValorDiaria: Double read getValorDiaria write setValorDiaria;
    property Fechado: String read getFechado write setFechado;
    property DataPago: TDateTime read getDataPago write setDataPago;
    property Executor: String read getExecutor write setExecutor;
    property Manutencao: TDateTime read getManutencao write setManutencao;
    property Extrato: String read getExtrato write setExtrato;
    property Id: Integer read getId write SetID;

    function Validar(): Boolean;
    function Delete(filtro: String): Boolean;
    function getObject(id, filtro: String): Boolean;
    function getObjects(): Boolean;
    function getField(campo, coluna: String): String;
    function Insert(): Boolean;
    function Update(): Boolean;
    function Periodo(sdtInicial, sdtFinal, sEntregador: String): Boolean;
    function Exist(): Boolean;

    procedure MaxNumero;
    procedure GeraNumeroExtrato;
  end;

const
  TABLENAME = 'tbordemservico';

implementation

{ TOrdemServico }

uses SysUtils, Dialogs, udm, clUtil, ZDataset, ZAbstractRODataset, DB, Math,
  DateUtils;

constructor TOrdemServico.Create;
begin
  _conexao := TConexao.Create;
  if (not _conexao.VerifyConnZEOS(0)) then
  begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados (' + Self.ClassName + ') !', mtError, [mbCancel], 0);
  end;
end;

destructor TOrdemServico.Destroy;
begin
  _conexao.Free;
end;

function TOrdemServico.getCliente: Integer;
begin
  Result := _cliente;
end;

function TOrdemServico.getData: TDateTime;
begin
  Result := _data;
end;

function TOrdemServico.getDataPago: TDateTime;
begin
  Result := _datapago;
end;

function TOrdemServico.getEntregador: Integer;
begin
  Result := _entregador;
end;

function TOrdemServico.getExecutor: String;
begin
  Result := _executor;
end;

function TOrdemServico.getExtrato: String;
begin
  Result := _extrato;
end;

function TOrdemServico.getHoraRetorno: String;
begin
  Result := _horaretorno;
end;

function TOrdemServico.getHoraSaida: String;
begin
  Result := _horasaida;
end;

function TOrdemServico.getKmFinal: Integer;
begin
  Result := _kmfinal;
end;

function TOrdemServico.getKmInicial: Integer;
begin
  Result := _kminicial;
end;

function TOrdemServico.getManutencao: TDateTime;
begin
  Result := _manutencao;
end;

function TOrdemServico.getNumero: Integer;
begin
  Result := _numero;
end;

function TOrdemServico.getRota: String;
begin
  Result := _rota;
end;

function TOrdemServico.getValorDiaria: Double;
begin
  Result := _valordiaria;
end;

function TOrdemServico.getVeiculo: Integer;
begin
  Result := _veiculo;
end;

function TOrdemServico.getDescricao: String;
begin
  Result := _descricao;
end;

function TOrdemServico.getId: Integer;
begin
  Result := _id;
end;

function TOrdemServico.Validar(): Boolean;
begin
  Result := False;
  if Self.Entregador = 0 then
  begin
    MessageDlg('Informe o Entregador!', mtWarning, [mbOK], 0);
    Exit;
  end;
  if Self.Veiculo = 0 then
  begin
    MessageDlg('Informe o Veiculo!', mtWarning, [mbOK], 0);
    Exit;
  end;
  if Self.KmFinal > 0 then
  begin
    if Self.KmFinal < Self.KmInicial then
    begin
      MessageDlg('O KM Final não pode ser menor que o KM inicial!', mtWarning,
        [mbOK], 0);
      Exit;
    end;
  end;
  if TUtil.Empty(Self.Descricao) then
  begin
    MessageDlg('Informe o(s) serviço(s)!', mtWarning, [mbOK], 0);
    Exit;
  end;
  Result := True;
end;

function TOrdemServico.Delete(filtro: String): Boolean;
begin
  try
    Result := False;
    with dm.qryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Add('DELETE FROM ' + TABLENAME);
      if filtro = 'NUMERO' then
      begin
        SQL.Add('WHERE NUM_OS = :NUMERO');
        ParamByName('NUMERO').AsInteger := Self.Numero;
      end
      else if filtro = 'DATA' then
      begin
        SQL.Add('WHERE DAT_OS = :DATA');
        ParamByName('DATA').AsDate := Self.Data;
      end;
      dm.ZConn.PingServer;
      ExecSQL;
      Close;
      SQL.Clear;
    end;
    Result := True;
  Except
    on E: Exception do
    begin
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

function TOrdemServico.getObject(id, filtro: String): Boolean;
begin
  try
    Result := False;
    With dm.qryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);
      if filtro = 'NUMERO' then
      begin
        SQL.Add('WHERE NUM_OS = :NUMERO');
        ParamByName('NUMERO').AsInteger := StrToInt(id);
      end
      else if filtro = 'DATA' then
      begin
        SQL.Add('WHERE DAT_OS = :DATA');
        ParamByName('DATA').AsDate := StrToDate(id);
      end
      else if filtro = 'ENTREGADOR' then
      begin
        SQL.Add('WHERE COD_ENTREGADOR = :ENTREGADOR');
        ParamByName('ENTREGADOR').AsInteger := StrToInt(id);
      end
      else if filtro = 'CLIENTE' then
      begin
        SQL.Add('WHERE COD_CLIENTE = :CLIENTE');
        ParamByName('CLIENTE').AsInteger := StrToInt(id);
      end
      else if filtro = 'VEICULO' then
      begin
        SQL.Add('WHERE COD_VEICULO = :VEICULO');
        ParamByName('VEICULO').AsInteger := StrToInt(id);
      end
      else if filtro = 'ID' then
      begin
        SQL.Add('WHERE ID_CONTROLE = :ID');
        ParamByName('ID').AsInteger := StrToInt(id);
      end;
      dm.ZConn.PingServer;
      Open;
      if not(IsEmpty) then
      begin
        First;
        Self.Numero := FieldByName('NUM_OS').AsInteger;
        Self.Data := FieldByName('DAT_OS').AsDateTime;
        Self.Entregador := FieldByName('COD_ENTREGADOR').AsInteger;
        Self.Cliente := FieldByName('COD_CLIENTE').AsInteger;
        Self.Veiculo := FieldByName('COD_VEICULO').AsInteger;
        Self.Rota := FieldByName('DES_ROTA').AsString;
        Self.KmInicial := FieldByName('QTD_KM_INICIAL').AsInteger;
        Self.KmFinal := FieldByName('QTD_KM_FINAL').AsInteger;
        Self.HoraSaida := FieldByName('DES_HORA_SAIDA').AsString;
        Self.HoraRetorno := FieldByName('DES_HORA_RETORNO').AsString;
        Self.Descricao := FieldByName('DES_SERVICO').AsString;
        Self.ValorDiaria := FieldByName('VAL_DIARIA').AsFloat;
        Self.Executor := FieldByName('NOM_EXECUTOR').AsString;
        Self.Manutencao := FieldByName('DAT_MANUTENCAO').AsDateTime;
        Self.Fechado := FieldByName('DOM_FECHADO').AsString;
        Self.DataPago := FieldByName('DAT_PAGO').AsDateTime;
        Self.Extrato := FieldByName('NUM_EXTRATO').AsString;
        Self.Id := FieldByName('ID_CONTROLE').AsInteger;
        if RecordCount = 1 then
        begin
          Close;
          SQL.Clear;
        end;
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
    begin
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

function TOrdemServico.getObjects(): Boolean;
begin
  try
    Result := False;
    With dm.qryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);
      dm.ZConn.PingServer;
      Open;
      if IsEmpty then
      begin
        MessageDlg('Nenhum registro encontrado!', mtWarning, [mbOK], 0);
        Close;
        SQL.Clear;
        Exit;
      end;
    end;
    Result := True;
  Except
    on E: Exception do
    begin
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

function TOrdemServico.getFechado: String;
begin
  Result := _fechado;
end;

function TOrdemServico.getField(campo, coluna: String): String;
begin
  try
    Result := '';
    with dm.qryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT :CAMPO FROM ' + TABLENAME);
      ParamByName('CAMPO').AsString := campo;
      if coluna = 'NUMERO' then
      begin
        SQL.Add('WHERE NUM_OS = :NUMERO');
        ParamByName('NUMERO').AsInteger := Self.Numero;
      end;
      dm.ZConn.PingServer;
      Open;
      if not(IsEmpty) then
      begin
        First;
        Result := FieldByName(campo).AsString;
      end;
      Close;
      SQL.Clear;
    end;
  Except
    on E: Exception do
    begin
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

function TOrdemServico.Insert(): Boolean;
begin
  try
    Result := False;
    with dm.qryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'INSERT INTO ' + TABLENAME + '(' +
                  'NUM_OS, ' +
                  'DAT_OS, ' +
                  'COD_ENTREGADOR, ' +
                  'COD_CLIENTE, ' +
                  'COD_VEICULO, ' +
                  'DES_ROTA, ' +
                  'QTD_KM_INICIAL, ' +
                  'QTD_KM_FINAL, ' +
                  'DES_HORA_SAIDA, ' +
                  'DES_HORA_RETORNO, ' +
                  'DES_SERVICO, ' +
                  'VAL_DIARIA, ' +
                  'DOM_FECHADO, ' +
                  'DAT_PAGO, ' +
                  'ID_CONTROLE, ' +
                  'NOM_EXECUTOR, ' +
                  'NUM_EXTRATO, ' +
                  'DAT_MANUTENCAO) ' +
                  'VALUES (' +
                  ':NUMERO, ' +
                  ':DATA, ' +
                  ':ENTREGADOR, ' +
                  ':CLIENTE, ' +
                  ':VEICULO, ' +
                  ':ROTA, ' +
                  ':KMINICIAL, ' +
                  ':KMFINAL, ' +
                  ':HORASAIDA, ' +
                  ':HORARETORNO, ' +
                  ':SERVICO, ' +
                  ':DIARIA, ' +
                  ':FECHADO, ' +
                  ':DATAPAGO, ' +
                  ':ID, ' +
                  ':EXECUTOR, ' +
                  ':EXTRATO, ' +
                  ':MANUTENCAO)';
      MaxNumero;
      ParamByName('NUMERO').AsInteger := Self.Numero;
      ParamByName('DATA').AsDate := Self.Data;
      ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
      ParamByName('CLIENTE').AsInteger := Self.Cliente;
      ParamByName('VEICULO').AsInteger := Self.Veiculo;
      ParamByName('ROTA').AsString := Self.Rota;
      ParamByName('KMINICIAL').AsInteger := Self.KmInicial;
      ParamByName('KMFINAL').AsInteger := Self.KmFinal;
      ParamByName('HORASAIDA').AsString := Self.HoraSaida;
      ParamByName('HORARETORNO').AsString := Self.HoraRetorno;
      ParamByName('SERVICO').AsString := Self.Descricao;
      ParamByName('DIARIA').AsFloat := Self.ValorDiaria;
      ParamByName('FECHADO').AsString := Self.Fechado;
      ParamByName('DATAPAGO').AsDateTime := Self.DataPago;
      ParamByName('EXECUTOR').AsString := Self.Executor;
      ParamByName('EXTRATO').AsString := Self.Extrato;
      ParamByName('MANUTENCAO').AsDateTime := Self.Manutencao;
      ParamByName('ID').AsInteger := Self.Id;
      dm.ZConn.PingServer;
      ExecSQL;

      Close;
      SQL.Clear;
    end;

    Result := True;

  Except
    on E: Exception do
    begin
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

function TOrdemServico.Update(): Boolean;
begin
  try
    Result := False;
    with dm.qryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'UPDATE ' + TABLENAME + ' SET ' +
                  'DAT_OS           = :DATA, ' +
                  'COD_ENTREGADOR   = :ENTREGADOR, ' +
                  'COD_CLIENTE      = :CLIENTE, ' +
                  'COD_VEICULO      = :VEICULO, ' +
                  'DES_ROTA         = :ROTA, ' +
                  'QTD_KM_INICIAL   = :KMINICIAL, ' +
                  'QTD_KM_FINAL     = :KMFINAL, ' +
                  'DES_HORA_SAIDA   = :HORASAIDA, ' +
                  'DES_HORA_RETORNO = :HORARETORNO,' +
                  'DES_SERVICO      = :SERVICO, ' +
                  'VAL_DIARIA       = :DIARIA, ' +
                  'DOM_FECHADO      = :FECHADO, ' +
                  'DAT_PAGO         = :DATAPAGO, ' +
                  'ID_CONTROLE      = :ID, ' +
                  'NOM_EXECUTOR     = :EXECUTOR, ' +
                  'NUM_EXTRATO      = :EXTRATO, ' +
                  'DAT_MANUTENCAO   = :MANUTENCAO ' +
                  'WHERE NUM_OS     = :NUMERO';
      ParamByName('NUMERO').AsInteger := Self.Numero;
      ParamByName('DATA').AsDate := Self.Data;
      ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
      ParamByName('CLIENTE').AsInteger := Self.Cliente;
      ParamByName('VEICULO').AsInteger := Self.Veiculo;
      ParamByName('ROTA').AsString := Self.Rota;
      ParamByName('KMINICIAL').AsInteger := Self.KmInicial;
      ParamByName('KMFINAL').AsInteger := Self.KmFinal;
      ParamByName('HORASAIDA').AsString := Self.HoraSaida;
      ParamByName('HORARETORNO').AsString := Self.HoraRetorno;
      ParamByName('SERVICO').AsString := Self.Descricao;
      ParamByName('DIARIA').AsFloat := Self.ValorDiaria;
      ParamByName('FECHADO').AsString := Self.Fechado;
      ParamByName('DATAPAGO').AsDateTime := Self.DataPago;
      ParamByName('ID').AsInteger := Self.Id;
      ParamByName('EXECUTOR').AsString := Self.Executor;
      ParamByName('EXTRATO').AsString := Self.Extrato;
      ParamByName('MANUTENCAO').AsDateTime := Self.Manutencao;
      dm.ZConn.PingServer;
      ExecSQL;

      Close;
      SQL.Clear;
    end;
    Result := True;

  Except
    on E: Exception do
    begin
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

procedure TOrdemServico.MaxNumero;
begin
  try
    with dm.qryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT MAX(NUM_OS) AS NUMERO FROM ' + TABLENAME);
      dm.ZConn.PingServer;
      Open;
      if not(IsEmpty) then
      begin
        Self.Numero := FieldByName('NUMERO').AsInteger + 1;
      end
      else
      begin
        Self.Numero := 1;
      end;
      Close;
      SQL.Clear;
    end;
  Except
    on E: Exception do
    begin
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

function TOrdemServico.Periodo(sdtInicial, sdtFinal,
  sEntregador: String): Boolean;
var
  iAgente: Integer;
begin
  Try
    Result := False;
    if TUtil.Empty(sdtInicial) then
    begin
      Exit;
    end;
    if TUtil.Empty(sdtFinal) then
    begin
      Exit;
    end;
    with dm.qryGeral do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);
      SQL.Add(' WHERE DAT_OS BETWEEN :INICIO AND :TERMINO');
      if StrToInt(sEntregador) > 0 then
      begin
        SQL.Add(' AND COD_CLIENTE = :CLIENTE');
      end;
      ParamByName('INICIO').AsDate := StrToDate(sdtInicial);
      ParamByName('TERMINO').AsDate := StrToDate(sdtFinal);
      if StrToInt(sEntregador) > 0 then
      begin
        ParamByName('CLIENTE').AsInteger := StrToInt(sEntregador);
      end;
      dm.ZConn.PingServer;
      Open;
      if IsEmpty then
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

procedure TOrdemServico.GeraNumeroExtrato;
var
  sNumero: String;
begin
  try

    sNumero := IntToStr(YearOf(Self.DataPago)) +
      Format('%3.3d', [DayOfTheYear(Self.DataPago)]) +
      Format('%6.6d', [Self.Entregador]);

    Self.Extrato := sNumero;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TOrdemServico.Exist(): Boolean;
begin
  Result := False;
  With dm.qryPesquisa do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM ' + TABLENAME);
    SQL.Add('WHERE DAT_OS = :DATA ');
    SQL.Add('AND COD_ENTREGADOR = :ENTREGADOR, ');
    SQL.Add('AND COD_CLIENTE = :CLIENTE ');
    SQL.Add('AND COD_VEICULO = :VEICULO ');
    SQL.Add('AND QTD_KM_INICIAL = :KMINICIAL ' );
    SQL.Add('AND QTD_KM_FINAL = :KMFINAL');
    ParamByName('DATA').AsDate := Self.Data;
    ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
    ParamByName('CLIENTE').AsInteger := Self.Cliente;
    ParamByName('VEICULO').AsInteger := Self.Veiculo;
    ParamByName('KMINICIAL').AsInteger := Self.KmInicial;
    ParamByName('KMFINAL').AsInteger := Self.KmFinal;
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

procedure TOrdemServico.setCliente(const Value: Integer);
begin
  _cliente := Value;
end;

procedure TOrdemServico.setData(const Value: TDateTime);
begin
  _data := Value;
end;

procedure TOrdemServico.setDataPago(const Value: TDateTime);
begin
  _datapago := Value;
end;

procedure TOrdemServico.setEntregador(const Value: Integer);
begin
  _entregador := Value;
end;

procedure TOrdemServico.setExecutor(const Value: String);
begin
  _executor := Value;
end;

procedure TOrdemServico.setExtrato(const Value: String);
begin
  _extrato := Value;
end;

procedure TOrdemServico.setFechado(const Value: String);
begin
  _fechado := Value;
end;

procedure TOrdemServico.setHoraRetorno(const Value: String);
begin
  _horaretorno := Value;
end;

procedure TOrdemServico.setHoraSaida(const Value: String);
begin
  _horasaida := Value;
end;

procedure TOrdemServico.setKmFinal(const Value: Integer);
begin
  _kmfinal := Value;
end;

procedure TOrdemServico.setKmInicial(const Value: Integer);
begin
  _kminicial := Value;
end;

procedure TOrdemServico.setManutencao(const Value: TDateTime);
begin
  _manutencao := Value;
end;

procedure TOrdemServico.setNumero(const Value: Integer);
begin
  _numero := Value;
end;

procedure TOrdemServico.setRota(const Value: String);
begin
  _rota := Value;
end;

procedure TOrdemServico.setValorDiaria(const Value: Double);
begin
  _valordiaria := Value;
end;

procedure TOrdemServico.setVeiculo(const Value: Integer);
begin
  _veiculo := Value;
end;

procedure TOrdemServico.setDescricao(const Value: String);
begin
  _descricao := Value;
end;

procedure TOrdemServico.SetID(val: Integer);
begin
  _id := val;
end;

end.
