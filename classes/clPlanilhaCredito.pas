unit clPlanilhaCredito;

interface

uses clConexao;

type
  TPlanilhaCredito = class(TObject)

  private
    function getAgencia: String;
    function getAgente: Integer;
    function getBanco: String;
    function getConta: String;
    function getCpfCnpjFavorecido: String;
    function getDataPagamento: TDateTime;
    function getEntregador: Integer;
    function getExecutor: String;
    function getExtrato: String;
    function getFavorecido: String;
    function getManutencao: TDateTime;
    function getSequencia: Integer;
    function getTipoConta: String;
    function getTipoPagamento: String;
    function getValor: Double;
    function getNomeAgente: String;
    function getNomeBanco: String;
    function getNomeEntregador: String;
    function getServico: String;

    procedure setAgencia(const Value: String);
    procedure setAgente(const Value: Integer);
    procedure setBanco(const Value: String);
    procedure setConta(const Value: String);
    procedure setCpfCnpjFavorecido(const Value: String);
    procedure setDataPagamento(const Value: TDateTime);
    procedure setEntregador(const Value: Integer);
    procedure setExecutor(const Value: String);
    procedure setExtrato(const Value: String);
    procedure setFavorecido(const Value: String);
    procedure setManutencao(const Value: TDateTime);
    procedure setSequencia(const Value: Integer);
    procedure setTipoConta(const Value: String);
    procedure setTipoPagamento(const Value: String);
    procedure setValor(const Value: Double);
    procedure setNomeAgente(const Value: String);
    procedure setNomeBanco(const Value: String);
    procedure setNomeEntregador(const Value: String);
    procedure setServico(const Value: String);

    constructor Create;
    destructor Destroy;

  protected
    _sequencia: Integer;
    _datapagamento: TDateTime;
    _extrato: String;
    _agente: Integer;
    _nomeagente: String;
    _entregador: Integer;
    _nomeentregador: String;
    _servico: String;
    _tipoconta: String;
    _banco: String;
    _nomebanco: String;
    _agencia: String;
    _conta: String;
    _favorecido: String;
    _cpfcnpjfavorecido: String;
    _valor: Double;
    _tipopagamento: String;
    _executor: String;
    _manutencao: TDateTime;
    _conexao: TConexao;
  public
    property Sequencia: Integer read getSequencia write setSequencia;
    property DataPagamento: TDateTime read getDataPagamento
      write setDataPagamento;
    property Extrato: String read getExtrato write setExtrato;
    property Agente: Integer read getAgente write setAgente;
    property NomeAgente: String read getNomeAgente write setNomeAgente;
    property Entregador: Integer read getEntregador write setEntregador;
    property NomeEntregador: String read getNomeEntregador
      write setNomeEntregador;
    property Servico: String read getServico write setServico;
    property TipoConta: String read getTipoConta write setTipoConta;
    property Banco: String read getBanco write setBanco;
    property NomeBanco: String read getNomeBanco write setNomeBanco;
    property Agencia: String read getAgencia write setAgencia;
    property Conta: String read getConta write setConta;
    property Favorecido: String read getFavorecido write setFavorecido;
    property CpfCnpjFavorecido: String read getCpfCnpjFavorecido
      write setCpfCnpjFavorecido;
    property Valor: Double read getValor write setValor;
    property TipoPagamento: String read getTipoPagamento write setTipoPagamento;
    property Executor: String read getExecutor write setExecutor;
    property Manutencao: TDateTime read getManutencao write setManutencao;

    function Validar(): Boolean;
    function getObject(id, filtro: String): Boolean;
    function getObjects(): Boolean;
    function getField(campo, coluna: String): String;
    function Insert(): Boolean;
    function Update(): Boolean;
    function Delete(filtro: String): Boolean;
    function Periodo(sDataInicial, sDataFinal: String): Boolean;

    procedure MaxSequencia;
  end;

const
  TABLENAME = 'tbplanilhacredito';

implementation

uses SysUtils, Dialogs, udm, clUtil, ZDataset, ZAbstractRODataset, DB,
  DateUtils;

{ TPlanilhaCredito }

constructor TPlanilhaCredito.Create;
begin
  _conexao := TConexao.Create;
  if (not _conexao.VerifyConnZEOS(0)) then
  begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
      Self.ClassName + ') !', mtError, [mbCancel], 0);
  end;
end;

destructor TPlanilhaCredito.Destroy;
begin
  _conexao.Free;
end;

function TPlanilhaCredito.getAgencia: String;
begin
  Result := _agencia;
end;

function TPlanilhaCredito.getAgente: Integer;
begin
  Result := _agente;
end;

function TPlanilhaCredito.getBanco: String;
begin
  Result := _banco;
end;

function TPlanilhaCredito.getConta: String;
begin
  Result := _conta;
end;

function TPlanilhaCredito.getCpfCnpjFavorecido: String;
begin
  Result := _cpfcnpjfavorecido;
end;

function TPlanilhaCredito.getDataPagamento: TDateTime;
begin
  Result := _datapagamento;
end;

function TPlanilhaCredito.getEntregador: Integer;
begin
  Result := _entregador;
end;

function TPlanilhaCredito.getExecutor: String;
begin
  Result := _executor;
end;

function TPlanilhaCredito.getExtrato: String;
begin
  Result := _extrato;
end;

function TPlanilhaCredito.getFavorecido: String;
begin
  Result := _favorecido;
end;

function TPlanilhaCredito.getManutencao: TDateTime;
begin
  Result := _manutencao;
end;

function TPlanilhaCredito.getNomeAgente: String;
begin
  Result := _nomeagente;
end;

function TPlanilhaCredito.getNomeBanco: String;
begin
  Result := _nomebanco;
end;

function TPlanilhaCredito.getNomeEntregador: String;
begin
  Result := _nomeentregador;
end;

function TPlanilhaCredito.getSequencia: Integer;
begin
  Result := _sequencia;
end;

function TPlanilhaCredito.getServico: String;
begin
  Result := _servico;
end;

function TPlanilhaCredito.getTipoConta: String;
begin
  Result := _tipoconta;
end;

function TPlanilhaCredito.getTipoPagamento: String;
begin
  Result := _tipopagamento;
end;

function TPlanilhaCredito.getValor: Double;
begin
  Result := _valor;
end;

function TPlanilhaCredito.Validar(): Boolean;
begin
  try
    Result := False;
    if (Self.DataPagamento = StrToDate('30/12/1899')) then
    begin
      MessageDlg('Informe a data do pagamento!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if TUtil.Empty(Self.Extrato) then
    begin
      MessageDlg('Informe o número do extrato!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if TUtil.Empty(Self.Servico) then
    begin
      MessageDlg('Informe o tipo de serviço!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if Self.Agente = 0 then
    begin
      MessageDlg('Informe o código do Agente!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if Self.Entregador = 0 then
    begin
      MessageDlg('Informe o código do Entregador!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if TUtil.Empty(Self.TipoConta) then
    begin
      MessageDlg('Informe o tipo de conta!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if TUtil.Empty(Self.Banco) then
    begin
      MessageDlg('Informe o número do Banco!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if TUtil.Empty(Self.Agencia) then
    begin
      MessageDlg('Informe o código da Agencia!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if TUtil.Empty(Self.Conta) then
    begin
      MessageDlg('Informe o número da Conta!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if TUtil.Empty(Self.Favorecido) then
    begin
      MessageDlg('Informe o nome do Favorecido!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if not(TUtil.Empty(Self.CpfCnpjFavorecido)) then
    begin
      if Length(Self.CpfCnpjFavorecido) = 14 then
      begin
        if not(TUtil.CPF(Self.CpfCnpjFavorecido)) then
        begin
          MessageDlg('CPF do Favorecido incorreto!', mtWarning, [mbOK], 0);
          Exit;
        end;
      end
      else
      begin
        if not(TUtil.CNPJ(Self.CpfCnpjFavorecido)) then
        begin
          MessageDlg('CNPJ Favorecido incorreto!', mtWarning, [mbOK], 0);
          Exit;
        end;
      end;
    end;
    if Self.Valor = 0 then
    begin
      MessageDlg('Informe o valor do Crédito!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if TUtil.Empty(Self.TipoPagamento) then
    begin
      MessageDlg('Informe o Tipo de Pagamento!', mtWarning, [mbOK], 0);
      Exit;
    end;
    Result := True;
  except
    on E: Exception do
    begin
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

function TPlanilhaCredito.getObject(id, filtro: String): Boolean;
begin
  try
    Result := False;
    with dm.qryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);
      if filtro = 'SEQUENCIA' then
      begin
        SQL.Add('WHERE SEQ_CREDITO = :SEQUENCIA');
        ParamByName('SEQUENCIA').AsInteger := StrToInt(id);
      end
      else if filtro = 'DATA' then
      begin
        SQL.Add('WHERE DAT_PAGO = :PAGO');
        ParamByName('PAGO').AsDate := StrToDate(id);
      end
      else if filtro = 'EXTRATO' then
      begin
        SQL.Add('WHERE NUM_EXTRATO = :EXTRATO');
        ParamByName('EXTRATO').AsString := id;
      end
      else if filtro = 'AGENTE' then
      begin
        SQL.Add('WHERE COD_AGENTE = :AGENTE');
        ParamByName('AGENTE').AsInteger := StrToInt(id);
      end
      else if filtro = 'ENTREGADOR' then
      begin
        SQL.Add('WHERE COD_ENTREGADOR = :ENTREGADOR');
        ParamByName('ENTREGADOR').AsInteger := StrToInt(id);
      end
      else if filtro = 'BANCO' then
      begin
        SQL.Add('WHERE COD_BANCO = :BANCO');
        ParamByName('BANCO').AsString := id;
      end
      else if filtro = 'CPF' then
      begin
        SQL.Add('WHERE NUM_CPF_CNPJ_FAVORECIDO = :CPF');
        ParamByName('CPF').AsString := id;
      end
      else if filtro = 'TIPO' then
      begin
        SQL.Add('WHERE DES_TIPO_PAGAMENTO = :TIPO');
        ParamByName('TIPO').AsString := id;
      end
      else if filtro = 'CHAVE' then
      begin
        SQL.Add('WHERE COD_AGENTE = :AGENTE AND DAT_PAGO = :DATA AND DES_SERVICO = :SERVICO');
        ParamByName('AGENTE').AsInteger := Self.Agente;
        ParamByName('DATA').AsDate := Self.DataPagamento;
        ParamByName('SERVICO').AsString := Self.Servico;
      end
      else if filtro = 'CHAVE2' then
      begin
        SQL.Add('WHERE DES_TIPO_PAGAMENTO = :TIPO');
        ParamByName('TIPO').AsString := id;
      end;
      dm.ZConn.PingServer;
      Open;
      if IsEmpty then
      begin
        Close;
        SQL.Clear;
        Exit;
      end;
      if RecordCount >= 1 then
      begin
        Self.Sequencia := FieldByName('SEQ_CREDITO').AsInteger;
        Self.DataPagamento := FieldByName('DAT_PAGO').AsDateTime;
        Self.Extrato := FieldByName('NUM_EXTRATO').AsString;
        Self.Agente := FieldByName('COD_AGENTE').AsInteger;
        Self.NomeAgente := FieldByName('NOM_AGENTE').AsString;
        Self.Entregador := FieldByName('COD_ENTREGADOR').AsInteger;
        Self.Servico := FieldByName('DES_SERVICO').AsString;
        Self.NomeEntregador := FieldByName('NOM_ENTREGADOR').AsString;
        Self.TipoConta := FieldByName('DES_TIPO_CONTA').AsString;
        Self.Banco := FieldByName('COD_BANCO').AsString;
        Self.NomeBanco := FieldByName('NOM_BANCO').AsString;
        Self.Agencia := FieldByName('COD_AGENCIA').AsString;
        Self.Conta := FieldByName('NUM_CONTA').AsString;
        Self.Favorecido := FieldByName('NOM_FAVORECIDO').AsString;
        Self.CpfCnpjFavorecido :=
          FieldByName('NUM_CPF_CNPJ_FAVORECIDO').AsString;
        Self.Valor := FieldByName('VAL_CREDITO').AsFloat;
        Self.TipoPagamento := FieldByName('DES_TIPO_PAGAMENTO').AsString;
        Self.Executor := FieldByName('NOM_EXECUTOR').AsString;
        Self.Manutencao := FieldByName('DAT_MANUTENCAO').AsDateTime;
        Close;
        SQL.Clear;
      end;
    end;
    Result := True;
  except
    on E: Exception do
    begin
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

function TPlanilhaCredito.getObjects(): Boolean;
begin
  try
    Result := False;
    with dm.qryGetObject do
    begin
      Close;
      SQL.Add('SELECT * FROM ' + TABLENAME);
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
  except
    on E: Exception do
    begin
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

function TPlanilhaCredito.getField(campo, coluna: String): String;
begin
  try
    Result := '';
    with dm.qryGetObject do
    begin
      Close;
      SQL.Add('SELECT ' + campo + 'FROM ' + TABLENAME);
      if coluna = 'SEQUENCIA' then
      begin
        SQL.Add('WHERE SEQ_CREDITO = :SEQUENCIA');
        ParamByName('SEQUENCIA').AsInteger := Self.Sequencia;
      end
      else if coluna = 'EXTRATO' then
      begin
        SQL.Add('WHERE NUM_EXTRATO = :EXTRATO');
        ParamByName('EXTRATO').AsString := Self.Extrato;
      end
      else if coluna = 'AGENTE' then
      begin
        SQL.Add('WHERE COD_AGENTE = :AGENTE');
        ParamByName('AGENTE').AsInteger := Self.Agente;
      end
      else if coluna = 'ENTREGADOR' then
      begin
        SQL.Add('WHERE COD_ENTREGADOR = :ENTREGADOR');
        ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
      end
      else if coluna = 'CPF' then
      begin
        SQL.Add('WHERE NUM_CPF_CNPJ_FAVORECIDO = :CPF');
        ParamByName('CPF').AsString := Self.CpfCnpjFavorecido;
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
  except
    on E: Exception do
    begin
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

function TPlanilhaCredito.Insert(): Boolean;
begin
  try
    Result := False;
    with dm.qryCRUD do
    begin
      Close;
      SQL.Text := 'INSERT INTO ' + TABLENAME + ' (' + 'SEQ_CREDITO, ' +
        'DAT_PAGO, ' + 'NUM_EXTRATO, ' + 'COD_AGENTE, ' + 'NOM_AGENTE, ' +
        'COD_ENTREGADOR, ' + 'NOM_ENTREGADOR, ' + 'DES_SERVICO, ' +
        'DES_TIPO_CONTA, ' + 'COD_BANCO, ' + 'NOM_BANCO, ' + 'COD_AGENCIA,' +
        'NUM_CONTA, ' + 'NOM_FAVORECIDO, ' + 'NUM_CPF_CNPJ_FAVORECIDO, ' +
        'VAL_CREDITO, ' + 'DES_TIPO_PAGAMENTO, ' + 'NOM_EXECUTOR, ' +
        'DAT_MANUTENCAO) ' + 'VALUES (' + ':SEQUENCIA, ' + ':DATA, ' +
        ':EXTRATO, ' + ':AGENTE, ' + ':NOMEAGENTE, ' + ':ENTREGADOR, ' +
        ':NOMEENTREGADOR, ' + ':SERVICO, ' + ':TIPOCONTA, ' + ':BANCO, ' +
        ':NOMEBANCO, ' + ':AGENCIA,' + ':CONTA, ' + ':FAVORECIDO, ' + ':CPF, ' +
        ':VALOR, ' + ':TIPOPAGAMENTO, ' + ':EXECUTOR, ' + ':MANUTENCAO)';
      MaxSequencia;
      ParamByName('SEQUENCIA').AsInteger := Self.Sequencia;
      ParamByName('DATA').AsDate := Self.DataPagamento;
      ParamByName('EXTRATO').AsString := Self.Extrato;
      ParamByName('AGENTE').AsInteger := Self.Agente;
      ParamByName('NOMEAGENTE').AsString := Self.NomeAgente;
      ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
      ParamByName('NOMEENTREGADOR').AsString := Self.NomeEntregador;
      ParamByName('SERVICO').AsString := Self.Servico;
      ParamByName('TIPOCONTA').AsString := Self.TipoConta;
      ParamByName('BANCO').AsString := Self.Banco;
      ParamByName('NOMEBANCO').AsString := Self.NomeBanco;
      ParamByName('AGENCIA').AsString := Self.Agencia;
      ParamByName('CONTA').AsString := Self.Conta;
      ParamByName('FAVORECIDO').AsString := Self.Favorecido;
      ParamByName('CPF').AsString := Self.CpfCnpjFavorecido;
      ParamByName('VALOR').AsFloat := Self.Valor;
      ParamByName('TIPOPAGAMENTO').AsString := Self.TipoPagamento;
      ParamByName('EXECUTOR').AsString := Self.Executor;
      ParamByName('MANUTENCAO').AsDateTime := Self.Manutencao;
      dm.ZConn.PingServer;
      ExecSQL;
      Close;
      SQL.Clear;
    end;
    Result := True;
  except
    on E: Exception do
    begin
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

function TPlanilhaCredito.Update(): Boolean;
begin
  try
    Result := False;
    with dm.qryCRUD do
    begin
      Close;
      SQL.Text := 'UPDATE ' + TABLENAME + ' SET ' +
        'DAT_PAGO                 = :DATA, ' +
        'NUM_EXTRATO              = :EXTRATO, ' +
        'COD_AGENTE               = :AGENTE, ' +
        'NOM_AGENTE               = :NOMEAGENTE, ' +
        'COD_ENTREGADOR           = :ENTREGADOR, ' +
        'NOM_ENTREGADOR           = :NOMEENTREGADOR, ' +
        'DES_SERVICO              = :SERVICO, ' +
        'DES_TIPO_CONTA           = :TIPOCONTA, ' +
        'COD_BANCO                = :BANCO, ' +
        'NOM_BANCO                = :NOMEBANCO, ' +
        'COD_AGENCIA              = :AGENCIA, ' +
        'NUM_CONTA                = :CONTA, ' +
        'NOM_FAVORECIDO           = :FAVORECIDO, ' +
        'NUM_CPF_CNPJ_FAVORECIDO  = :CPF, ' +
        'VAL_CREDITO              = :VALOR, ' +
        'DES_TIPO_PAGAMENTO       = :TIPOPAGAMENTO, ' +
        'NOM_EXECUTOR             = :EXECUTOR, ' +
        'DAT_MANUTENCAO           = :MANUTENCAO ' + 'WHERE ' +
        'SEQ_CREDITO              = :SEQUENCIA ';
      ParamByName('SEQUENCIA').AsInteger := Self.Sequencia;
      ParamByName('DATA').AsDate := Self.DataPagamento;
      ParamByName('EXTRATO').AsString := Self.Extrato;
      ParamByName('AGENTE').AsInteger := Self.Agente;
      ParamByName('NOMEAGENTE').AsString := Self.NomeAgente;
      ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
      ParamByName('NOMEENTREGADOR').AsString := Self.NomeEntregador;
      ParamByName('SERVICO').AsString := Self.Servico;
      ParamByName('TIPOCONTA').AsString := Self.TipoConta;
      ParamByName('BANCO').AsString := Self.Banco;
      ParamByName('NOMEBANCO').AsString := Self.NomeBanco;
      ParamByName('AGENCIA').AsString := Self.Agencia;
      ParamByName('CONTA').AsString := Self.Conta;
      ParamByName('FAVORECIDO').AsString := Self.Favorecido;
      ParamByName('CPF').AsString := Self.CpfCnpjFavorecido;
      ParamByName('VALOR').AsFloat := Self.Valor;
      ParamByName('TIPOPAGAMENTO').AsString := Self.TipoPagamento;
      ParamByName('EXECUTOR').AsString := Self.Executor;
      ParamByName('MANUTENCAO').AsDateTime := Self.Manutencao;
      dm.ZConn.PingServer;
      ExecSQL;
      Close;
      SQL.Clear;
    end;
    Result := True;
  except
    on E: Exception do
    begin
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

function TPlanilhaCredito.Delete(filtro: String): Boolean;
begin
  try
    Result := False;
    with dm.qryCRUD do
    begin
      Close;
      SQL.Add('DELETE FROM ' + TABLENAME);
      if filtro = 'SEQUENCIA' then
      begin
        SQL.Add('WHERE SEQ_CREDITO = :SEQUENCIA');
        ParamByName('SEQUENCIA').AsInteger := Self.Sequencia;
      end
      else if filtro = 'EXTRATO' then
      begin
        SQL.Add('WHERE NUM_EXTRATO = :EXTRATO');
        ParamByName('EXTRATO').AsString := Self.Extrato
      end
      else if filtro = 'DATA' then
      begin
        SQL.Add('WHERE DAT_PAGO = :DATA');
        ParamByName('DATA').AsDate := Self.DataPagamento;
      end
      else if filtro = 'AGENTE' then
      begin
        SQL.Add('WHERE COD_AGENTE = :AGENTE');
        ParamByName('AGENTE').AsInteger := Self.Agente;
      end
      else if filtro = 'ENTREGADOR' then
      begin
        SQL.Add('WHERE COD_ENTREGADOR = :ENTREGADOR');
        ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
      end
      else if filtro = 'CPF' then
      begin
        SQL.Add('WHERE NUM_CPF_CNPJ_FAVORECIDO = :CPF');
        ParamByName('CPF').AsString := Self.CpfCnpjFavorecido;
      end;
      dm.ZConn.PingServer;
      ExecSQL;
      Close;
      SQL.Clear;
    end;
    Result := True;
  except
    on E: Exception do
    begin
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

procedure TPlanilhaCredito.MaxSequencia();
begin
  try
    with dm.qryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT MAX(SEQ_CREDITO) AS SEQ FROM ' + TABLENAME;
      dm.ZConn.PingServer;
      Open;
      if not(IsEmpty) then
      begin
        First;
        Self.Sequencia := (FieldByName('SEQ').AsInteger) + 1;
      end;
      Close;
      SQL.Clear;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

function TPlanilhaCredito.Periodo(sDataInicial, sDataFinal: String): Boolean;
begin
  try
    Result := False;
    with dm.qryGeral do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);
      SQL.Add('WHERE DAT_PAGO BETWEEN :DATA1 AND :DATA2');
      ParamByName('DATA1').AsDate := StrToDate(sDataInicial);
      ParamByName('DATA2').AsDate := StrToDate(sDataFinal);
      dm.ZConn.PingServer;
      Open;
      if IsEmpty then
      begin
        Close;
        SQL.Clear;
        Exit;
      end;
      First;
    end;
    Result := True;
  except
    on E: Exception do
    begin
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

procedure TPlanilhaCredito.setAgencia(const Value: String);
begin
  _agencia := Value;
end;

procedure TPlanilhaCredito.setAgente(const Value: Integer);
begin
  _agente := Value;
end;

procedure TPlanilhaCredito.setBanco(const Value: String);
begin
  _banco := Value;
end;

procedure TPlanilhaCredito.setConta(const Value: String);
begin
  _conta := Value;
end;

procedure TPlanilhaCredito.setCpfCnpjFavorecido(const Value: String);
begin
  _cpfcnpjfavorecido := Value;
end;

procedure TPlanilhaCredito.setDataPagamento(const Value: TDateTime);
begin
  _datapagamento := Value;
end;

procedure TPlanilhaCredito.setEntregador(const Value: Integer);
begin
  _entregador := Value;
end;

procedure TPlanilhaCredito.setExecutor(const Value: String);
begin
  _executor := Value;
end;

procedure TPlanilhaCredito.setExtrato(const Value: String);
begin
  _extrato := Value;
end;

procedure TPlanilhaCredito.setFavorecido(const Value: String);
begin
  _favorecido := Value;
end;

procedure TPlanilhaCredito.setManutencao(const Value: TDateTime);
begin
  _manutencao := Value;
end;

procedure TPlanilhaCredito.setNomeAgente(const Value: String);
begin
  _nomeagente := Value;
end;

procedure TPlanilhaCredito.setNomeBanco(const Value: String);
begin
  _nomebanco := Value;
end;

procedure TPlanilhaCredito.setNomeEntregador(const Value: String);
begin
  _nomeentregador := Value;
end;

procedure TPlanilhaCredito.setSequencia(const Value: Integer);
begin
  _sequencia := Value;
end;

procedure TPlanilhaCredito.setServico(const Value: String);
begin
  _servico := Value;
end;

procedure TPlanilhaCredito.setTipoConta(const Value: String);
begin
  _tipoconta := Value;
end;

procedure TPlanilhaCredito.setTipoPagamento(const Value: String);
begin
  _tipopagamento := Value;
end;

procedure TPlanilhaCredito.setValor(const Value: Double);
begin
  _valor := Value;
end;

end.
