unit clEntrega;

interface

uses
  clEndereco, clConexao;

type
  TEntrega = Class(TEndereco)

  private
    function getAgente: Integer;
    function getCliente: Integer;
    function getConsumidor: String;
    function getEntregador: Integer;
    function getExpedicao: TDateTime;
    function getNF: String;
    function getNossoNumero: String;
    function getPrevDistribuicao: TDateTime;
    function getTelefone: String;
    function getVolumes: Integer;
    function getBaixado: String;
    function getDataBaixa: TDateTime;
    function getDataPagamento: TDateTime;
    function getPago: String;
    function getRestricao: Integer;
    function getAtribuicao: TDateTime;
    function getEntrega: TDateTime;
    function getStatus: Integer;
    function getAdvalorem: Double;
    function getPesoFranquia: Double;
    function getPesoReal: Double;
    function getValorFranquia: Double;
    function getVerbaDistribuicao: Double;
    function getFechado: String;
    function getExtrato: String;
    function getVerbaEntregador: Double;
    function getDiasAtraso: Integer;
    function getVolumesExtra: Double;
    function getPesoCobrado: Double;
    function getTipoPeso: String;
    function getValorExtra: Double;
    function getDataRecebido: TDate;
    function getRecebido: String;
    function getCtrc: Integer;
    function getManifesto: Integer;
    function getRastreio: String;
    function getLote: Integer;
    function getRetorno: String;
    function getCredito: String;
    function getDataCredito: TDate;
    function getPedido: String;

    procedure setAgente(const Value: Integer);
    procedure setCliente(const Value: Integer);
    procedure setConsumidor(const Value: String);
    procedure setEntregador(const Value: Integer);
    procedure setExpedicao(const Value: TDateTime);
    procedure setNF(const Value: String);
    procedure setNossoNumero(const Value: String);
    procedure setPrevDistribuicao(const Value: TDateTime);
    procedure setTelefone(const Value: String);
    procedure setVolumes(const Value: Integer);
    procedure setBaixado(const Value: String);
    procedure setDataBaixa(const Value: TDateTime);
    procedure setDataPagamento(const Value: TDateTime);
    procedure setPago(const Value: String);
    procedure setRestricao(const Value: Integer);
    procedure setAtribuicao(const Value: TDateTime);
    procedure setStatus(const Value: Integer);
    procedure setEntrega(const Value: TDateTime);
    procedure setAdvalorem(const Value: Double);
    procedure setPesoFranquia(const Value: Double);
    procedure setPesoReal(const Value: Double);
    procedure setValorFranquia(const Value: Double);
    procedure setVerbaDistribuicao(const Value: Double);
    procedure setFechado(const Value: String);
    procedure setExtrato(const Value: String);
    procedure setVerbaEntregador(const Value: Double);
    procedure setDiasAtraso(const Value: Integer);
    procedure setVolumesExtra(const Value: Double);
    procedure setValorExtra(const Value: Double);
    procedure setPesoCobrado(const Value: Double);
    procedure setTipoPeso(const Value: String);
    procedure setDataRecebido(const Value: TDate);
    procedure setRecebido(const Value: String);
    procedure setCtrc(const Value: Integer);
    procedure setManifesto(const Value: Integer);
    procedure setRastreio(const Value: String);
    procedure setLote(const Value: Integer);
    procedure setRetorno(const Value: String);
    procedure setCredito(const Value: String);
    procedure setDataCredito(const Value: TDate);
    procedure setPedido(const Value: String);

    constructor Create;
    destructor Destroy;
    function getAltura: Integer;
    function getComprimento: Integer;
    function getContainer: String;
    function getValorProduto: Double;
    procedure setAltura(const Value: Integer);
    procedure setComprimento(const Value: Integer);
    procedure setContainer(const Value: String);
    procedure setValorProduto(const Value: Double);
    function getCodCliente: Integer;
    procedure setCodCliente(const Value: Integer);

  protected
    _agente: Integer;
    _entregador: Integer;
    _nossonumero: String;
    _cliente: Integer;
    _nf: String;
    _consumidor: String;
    _telefone: String;
    _expedicao: TDateTime;
    _prevdistribuicao: TDateTime;
    _volumes: Integer;
    _databaixa: TDateTime;
    _baixado: String;
    _restricao: Integer;
    _datapagamento: TDateTime;
    _pago: String;
    _atribuicao: TDateTime;
    _status: Integer;
    _entrega: TDateTime;
    _pesoreal: Double;
    _pesofranquia: Double;
    _verbadistribuicao: Double;
    _advalorem: Double;
    _valorfranquia: Double;
    _fechado: String;
    _extrato: String;
    _verbaentregador: Double;
    _diasatraso: Integer;
    _volumesextra: Double;
    _valextra: Double;
    _pesocobrado: Double;
    _tipopeso: String;
    _datarecebido: TDate;
    _recebido: String;
    _ctrc: Integer;
    _manifesto: Integer;
    _rastreio: String;
    _lote: Integer;
    _retorno: String;
    _datcredito: TDate;
    _credito: String;
    _container: String;
    _valorProduto: Double;
    _altura: Integer;
    _largura: Integer;
    _comprimento: Integer;
    _verba: Double;
    _pedido: String;
    _codcliente: Integer;
    _conexao: TConexao;
  public
    property Agente: Integer read getAgente write setAgente;
    property Entregador: Integer read getEntregador write setEntregador;
    property NossoNumero: String read getNossoNumero write setNossoNumero;
    property Cliente: Integer read getCliente write setCliente;
    property NF: String read getNF write setNF;
    property Consumidor: String read getConsumidor write setConsumidor;
    property Telefone: String read getTelefone write setTelefone;
    property Expedicao: TDateTime read getExpedicao write setExpedicao;
    property PrevDistribuicao: TDateTime read getPrevDistribuicao
      write setPrevDistribuicao;
    property Volumes: Integer read getVolumes write setVolumes;
    property DataBaixa: TDateTime read getDataBaixa write setDataBaixa;
    property Baixado: String read getBaixado write setBaixado;
    property Restricao: Integer read getRestricao write setRestricao;
    property DataPagamento: TDateTime read getDataPagamento
      write setDataPagamento;
    property Pago: String read getPago write setPago;
    property Atribuicao: TDateTime read getAtribuicao write setAtribuicao;
    property Status: Integer read getStatus write setStatus;
    property Entrega: TDateTime read getEntrega write setEntrega;
    property PesoReal: Double read getPesoReal write setPesoReal;
    property PesoFranquia: Double read getPesoFranquia write setPesoFranquia;
    property VerbaDistribuicao: Double read getVerbaDistribuicao
      write setVerbaDistribuicao;
    property Advalorem: Double read getAdvalorem write setAdvalorem;
    property ValorFranquia: Double read getValorFranquia write setValorFranquia;
    property Fechado: String read getFechado write setFechado;
    property Extrato: String read getExtrato write setExtrato;
    property VerbaEntregador: Double read getVerbaEntregador
      write setVerbaEntregador;
    property DiasAtraso: Integer read getDiasAtraso write setDiasAtraso;
    property VolumesExtra: Double read getVolumesExtra write setVolumesExtra;
    property ValorExtra: Double read getValorExtra write setValorExtra;
    property PesoCobrado: Double read getPesoCobrado write setPesoCobrado;
    property TipoPeso: String read getTipoPeso write setTipoPeso;
    property DataRecebido: TDate read getDataRecebido write setDataRecebido;
    property Recebido: String read getRecebido write setRecebido;
    property Ctrc: Integer read getCtrc write setCtrc;
    property Manifesto: Integer read getManifesto write setManifesto;
    property Rastreio: String read getRastreio write setRastreio;
    property Lote: Integer read getLote write setLote;
    property Retorno: String read getRetorno write setRetorno;
    property DataCredito: TDate read getDataCredito write setDataCredito;
    property Credito: String read getCredito write setCredito;
    property Container: String read getContainer write setContainer;
    property ValorProduto: Double read getValorProduto write setValorProduto;
    property Altura: Integer read getAltura write setAltura;
    property Largura: Integer read getAltura write setAltura;
    property Comprimento: Integer read getComprimento write setComprimento;
    property Pedido: String read getPedido write setPedido;
    property CodCliente: Integer read getCodCliente write setCodCliente;


    function Validar(): Boolean;
    function Delete(filtro: String): Boolean;
    function getObject(id, filtro: String): Boolean;
    function Insert(): Boolean;
    function Update(): Boolean;
    function getField(campo, coluna: String): String;
    function JaExiste(): Boolean;
    function Periodo(sdtInicial, sdtFinal, sAgente, sEntregador,
      filtro: String): Boolean;
    function UltimaExpedicao(): String;
    function TotalPeriodo(sdtInicial, sdtFinal, sAgente, sEntregador,
      filtro: String): Boolean;
    function Fechar(sdtInicial, sdtFinal, sdtPago, sExtrato, sAgente,
      sEntregador, filtro, sTipo: String; dVerba: Double; iTipo, iCliente: Integer): Boolean;
    function Prazo(sData, sDias: String): Boolean;
    function PrazoExtrato(sData, sData1, sAgente, sEntregador,
      sDias: String): Integer;
    function PosicaoEntregasSimples(sdtInicial, sdtFinal, sAgente, sCliente,
      sTipo: String): Boolean;
    function Previa(sdtData, sdtData1, sAgente: String): Boolean;
    function PesquisaEntrega(sNossoNumero, sExpedicaoI, sExpedicaoF, sPrevisaoI,
      sPrevisaoF, sBaixaI, sBaixaF, sClientes, sEntregador, sAgente, sTipoBaixa,
      sAtraso: String; iClienteEmpresa: Integer): Boolean;
    function ConsolidarExtrato(sInicio: String; sTermino: String;
      sIniAbastecimento: String; sFimAbastecimento: String;
      sDataPagamento: String; sFiltro: String; iTipo: Integer;
      iCliente: Integer): Boolean;
    function ConsolidarEntregas(sFiltro: String): Boolean;
    function PesquisaEntregasPeso(sFiltro: String): Boolean;
  end;

const
  TABLENAME = 'tbentregas';

implementation

{ TEntrega }

uses System.SysUtils, System.StrUtils, Dialogs, udm, clUtil, ZDataset,
  ZAbstractRODataset, DB;

constructor TEntrega.Create;
begin
  _conexao := TConexao.Create;
  if (not _conexao.VerifyConnZEOS(0)) then
  begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
      Self.ClassName + ') !', mtError, [mbCancel], 0);
  end;
end;

destructor TEntrega.Destroy;
begin
  _conexao.Free;
end;

function TEntrega.getAgente: Integer;
begin
  Result := _agente;
end;

function TEntrega.getAltura: Integer;
begin
  Result := _Altura
end;

function TEntrega.getCliente: Integer;
begin
  Result := _cliente;
end;

function TEntrega.getCodCliente: Integer;
begin
  Result := _codcliente;
end;

function TEntrega.getComprimento: Integer;
begin
  Result := _comprimento;
end;

function TEntrega.getConsumidor: String;
begin
  Result := _consumidor;
end;

function TEntrega.getContainer: String;
begin
  Result := _container;
end;

function TEntrega.getCredito: String;
begin
  Result := _credito;
end;

function TEntrega.getCtrc: Integer;
begin
  Result := _ctrc;
end;

function TEntrega.getEntregador: Integer;
begin
  Result := _entregador;
end;

function TEntrega.getExpedicao: TDateTime;
begin
  Result := _expedicao;
end;

function TEntrega.getNF: String;
begin
  Result := _nf;
end;

function TEntrega.getNossoNumero: String;
begin
  Result := _nossonumero;
end;

function TEntrega.getPrevDistribuicao: TDateTime;
begin
  Result := _prevdistribuicao;
end;

function TEntrega.getTelefone: String;
begin
  Result := _telefone;
end;

function TEntrega.getTipoPeso: String;
begin
  Result := _tipopeso;
end;

function TEntrega.getVolumes: Integer;
begin
  Result := _volumes;
end;

function TEntrega.Validar(): Boolean;
begin
  try
    Result := False;
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
    if TUtil.Empty(Self.NossoNumero) then
    begin
      MessageDlg('Informe o Nosso Número!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if Self.Volumes = 0 then
    begin
      MessageDlg('Informe a Quantidade de Volumes!', mtWarning, [mbOK], 0);
      Exit;
    end;
    Result := True;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TEntrega.Delete(filtro: String): Boolean;
begin
  try
    Result := False;
    with dm.qryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Add('DELETE FROM ' + TABLENAME);
      if filtro = 'AGENTE' then
      begin
        SQL.Add(' WHERE COD_AGENTE = :AGENTE');
        ParamByName('AGENTE').AsInteger := Self.Agente;
      end;
      if filtro = 'ENTREGADOR' then
      begin
        SQL.Add(' WHERE COD_AGENTE = :AGENTE AND COD_ENTREGADOR = :ENTREGADOR');
        ParamByName('AGENTE').AsInteger := Self.Agente;
        ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
      end;
      if filtro = 'NOSSONUMERO' then
      begin
        SQL.Add(' WHERE NUM_NOSSONUMERO = :NOSSONUMERO');
        ParamByName('NOSSONUMERO').AsString := Self.NossoNumero;
      end;
      if filtro = 'CONTAINER' then
      begin
        SQL.Add(' WHERE NUM_CONTAINER = :CONTAINER');
        ParamByName('CONTAINER').AsString := Self.Container;
      end;
      if filtro = 'CTRC' then
      begin
        SQL.Add(' WHERE NUM_CTRC = :CTRC');
        ParamByName('CTRC').AsInteger := Self.Ctrc;
      end;
      if filtro = 'MANIFESTO' then
      begin
        SQL.Add(' WHERE NUM_MANIFESTO = :MANIFESTO');
        ParamByName('MANIFESTO').AsInteger := Self.Manifesto;
      end;
      dm.ZConn.PingServer;
      ExecSQL;
    end;
    dm.qryCRUD.Close;
    dm.qryCRUD.SQL.Clear;
    Result := True;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TEntrega.getObject(id, filtro: String): Boolean;
begin
  Try
    Result := False;
    if TUtil.Empty(id) then
      Exit;
    with dm.qryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT * ' + 'FROM ' + TABLENAME;
      if filtro = 'AGENTE' then
      begin
        SQL.Add(' WHERE COD_AGENTE = :AGENTE');
        ParamByName('AGENTE').AsInteger := StrToInt(id);
      end;
      if filtro = 'ENTREGADOR' then
      begin
        SQL.Add(' WHERE COD_ENTREGADOR = :ENTREGADOR');
        ParamByName('ENTREGADOR').AsInteger := StrToInt(id);
      end;
      if filtro = 'NOSSONUMERO' then
      begin
        SQL.Add(' WHERE NUM_NOSSONUMERO = :NOSSONUMERO');
        ParamByName('NOSSONUMERO').AsString := id;
      end;
      if filtro = 'CONTAINER' then
      begin
        SQL.Add(' WHERE NUM_CONTAINER = :CONTAINER');
        ParamByName('CONTAINER').AsString := id;
      end;
      if filtro = 'EXPEDICAO' then
      begin
        SQL.Add(' WHERE DAT_EXPEDICAO = :EXPEDICAO');
        ParamByName('EXPEDICAO').AsDate := StrToDate(id);
      end;
      if filtro = 'ATRIBUICAO' then
      begin
        SQL.Add(' WHERE DAT_ATRIBUICAO = :ATRIBUICAO');
        ParamByName('ATRIBUICAO').AsDate := StrToDate(id);
      end;
      if filtro = 'PREVISAO' then
      begin
        SQL.Add(' WHERE DAT_PREV_DISTRIBUICAO = :PREVISAO');
        ParamByName('PREVISAO').AsDate := StrToDate(id);
      end;
      if filtro = 'EXTRATO' then
      begin
        SQL.Add(' WHERE NUM_EXTRATO = :NUMEROEXTRATO');
        ParamByName('NUMEROEXTRATO').AsInteger := StrToInt(id);
      end;
      if filtro = 'CLIENTE' then
      begin
        SQL.Add(' WHERE COD_CLIENTE = :CLIENTE');
        ParamByName('CLIENTE').AsInteger := StrToInt(id);
      end;
      if filtro = 'NF' then
      begin
        SQL.Add(' WHERE NUM_NF = :NF');
        ParamByName('NF').AsString := id;
      end;
      if filtro = 'RESTRICAO' then
      begin
        SQL.Add(' WHERE COD_RESTRICAO = :RESTRICAO');
        ParamByName('RESTRICAO').AsInteger := StrToInt(id);
      end;
      if filtro = 'CTRC' then
      begin
        SQL.Add(' WHERE NUM_CTRC = :CTRC');
        ParamByName('CTRC').AsInteger := StrToInt(id);
      end;
      if filtro = 'MANIFESTO' then
      begin
        SQL.Add(' WHERE NUM_MANIFESTO = :MANIFESTO');
        ParamByName('MANIFESTO').AsInteger := StrToInt(id);
      end;
      if filtro = 'CONSUMIDOR' then
      begin
        SQL.Add(' WHERE NOM_CONSUMIDOR LIKE %:CONSUMIDOR%');
        ParamByName('CONSUMIDOR').AsString := id;
      end;
      dm.ZConn.PingServer;
      Open;
      if not IsEmpty then
        First;
    end;
    if dm.qryGetObject.RecordCount >= 1 then
    begin
      Self.Agente := dm.qryGetObject.FieldByName('COD_AGENTE').AsInteger;
      Self.Entregador := dm.qryGetObject.FieldByName('COD_ENTREGADOR').AsInteger;
      Self.NossoNumero := dm.qryGetObject.FieldByName('NUM_NOSSONUMERO').AsString;
      Self.Cliente := dm.qryGetObject.FieldByName('COD_CLIENTE').AsInteger;
      Self.NF := dm.qryGetObject.FieldByName('NUM_NF').AsString;
      Self.Consumidor := dm.qryGetObject.FieldByName('NOM_CONSUMIDOR').AsString;
      Self.Endereco := dm.qryGetObject.FieldByName('DES_ENDERECO').AsString;
      Self.Complemento := dm.qryGetObject.FieldByName('DES_COMPLEMENTO').AsString;
      Self.Bairro := dm.qryGetObject.FieldByName('DES_BAIRRO').AsString;
      Self.Cidade := dm.qryGetObject.FieldByName('NOM_CIDADE').AsString;
      Self.Cep := dm.qryGetObject.FieldByName('NUM_CEP').AsString;
      Self.Telefone := dm.qryGetObject.FieldByName('NUM_TELEFONE').AsString;
      Self.Expedicao := dm.qryGetObject.FieldByName('DAT_EXPEDICAO').AsDateTime;
      Self.PrevDistribuicao := dm.qryGetObject.FieldByName('DAT_PREV_DISTRIBUICAO').AsDateTime;
      Self.Volumes := dm.qryGetObject.FieldByName('QTD_VOLUMES').AsInteger;
      Self.DataBaixa := dm.qryGetObject.FieldByName('DAT_BAIXA').AsDateTime;
      Self.Baixado := dm.qryGetObject.FieldByName('DOM_BAIXADO').AsString;
      Self.DataPagamento := dm.qryGetObject.FieldByName('DAT_PAGAMENTO').AsDateTime;
      Self.Pago := dm.qryGetObject.FieldByName('DOM_PAGO').AsString;
      Self.Atribuicao := dm.qryGetObject.FieldByName('DAT_ATRIBUICAO').AsDateTime;
      Self.Status := dm.qryGetObject.FieldByName('COD_STATUS').AsInteger;
      Self.Entrega := dm.qryGetObject.FieldByName('DAT_ENTREGA').AsDateTime;
      Self.PesoReal := dm.qryGetObject.FieldByName('QTD_PESO_REAL').AsFloat;
      Self.PesoFranquia := dm.qryGetObject.FieldByName('QTD_PESO_FRANQUIA').AsFloat;
      Self.VerbaDistribuicao := dm.qryGetObject.FieldByName('VAL_VERBA_FRANQUIA').AsFloat;
      Self.Advalorem := dm.qryGetObject.FieldByName('VAL_ADVALOREM').AsFloat;
      Self.ValorFranquia := dm.qryGetObject.FieldByName('VAL_PAGO_FRANQUIA').AsFloat;
      Self.Fechado := dm.qryGetObject.FieldByName('DOM_FECHADO').AsString;
      Self.Extrato := dm.qryGetObject.FieldByName('NUM_EXTRATO').AsString;
      Self.VerbaEntregador := dm.qryGetObject.FieldByName('VAL_VERBA_ENTREGADOR').AsFloat;
      Self.DiasAtraso := dm.qryGetObject.FieldByName('QTD_DIAS_ATRASO').AsInteger;
      Self.VolumesExtra := dm.qryGetObject.FieldByName('QTD_VOLUMEs_EXTRA').AsFloat;
      Self.ValorExtra := dm.qryGetObject.FieldByName('VAL_VOLUMES_EXTRA').AsFloat;
      Self.PesoCobrado := dm.qryGetObject.FieldByName('QTD_PESO_COBRADO').AsFloat;
      Self.TipoPeso := dm.qryGetObject.FieldByName('DES_TIPO_PESO').AsString;
      Self.DataRecebido := dm.qryGetObject.FieldByName('DAT_RECEBIDO').AsDateTime;
      Self.Recebido := dm.qryGetObject.FieldByName('DOM_RECEBIDO').AsString;
      Self.Ctrc := dm.qryGetObject.FieldByName('NUM_CTRC').AsInteger;
      Self.Manifesto := dm.qryGetObject.FieldByName('NUM_MANIFESTO').AsInteger;
      Self.Rastreio := dm.qryGetObject.FieldByName('DES_RASTREIO').AsString;
      Self.Lote := dm.qryGetObject.FieldByName('NUM_LOTE_REMESSA').AsInteger;
      Self.Retorno := dm.qryGetObject.FieldByName('DES_RETORNO').AsString;
      Self.DataCredito := dm.qryGetObject.FieldByName('DAT_CREDITO').AsDateTime;
      Self.Credito := dm.qryGetObject.FieldByName('DOM_CREDITO').AsString;
      Self.Container := dm.qryGetObject.FieldByName('NUM_CONTAINER').AsString;
      Self.ValorProduto := dm.qryGetObject.FieldByName('VAL_PRODUTO').AsFloat;
      Self.Altura := dm.qryGetObject.FieldByName('QTD_ALTURA').AsInteger;
      Self.Largura := dm.qryGetObject.FieldByName('QTD_LARGURA').AsInteger;
      Self.Comprimento := dm.qryGetObject.FieldByName('QTD_COMPRIMENTO').AsInteger;

      Result := True;
    end
    else
    begin
      dm.qryGetObject.Close;
      dm.qryGetObject.SQL.Clear;
      Result := False;
    end;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TEntrega.Insert(): Boolean;
begin
  try
    Result := False;
    with dm.qryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'INSERT INTO ' + TABLENAME + '(' + 'COD_AGENTE, ' +
        'COD_ENTREGADOR, ' + 'NUM_NOSSONUMERO, ' + 'COD_CLIENTE, ' + 'NUM_NF, '
        + 'NOM_CONSUMIDOR, ' + 'DES_ENDERECO, ' + 'DES_COMPLEMENTO, ' +
        'DES_BAIRRO, ' + 'NOM_CIDADE, ' + 'NUM_CEP, ' + 'NUM_TELEFONE, ' +
        'DAT_EXPEDICAO, ' + 'DAT_PREV_DISTRIBUICAO, ' + 'QTD_VOLUMES, ' +
        'DAT_ATRIBUICAO, ' + 'COD_STATUS, ' + 'DAT_ENTREGA, ' +
        'QTD_PESO_REAL, ' + 'QTD_PESO_FRANQUIA, ' + 'VAL_VERBA_FRANQUIA, ' +
        'VAL_ADVALOREM, ' + 'VAL_PAGO_FRANQUIA, ' + 'DOM_FECHADO, ' +
        'NUM_EXTRATO, ' + 'VAL_VERBA_ENTREGADOR, ' + 'QTD_DIAS_ATRASO, ' +
        'QTD_VOLUMES_EXTRA, ' + 'VAL_VOLUMES_EXTRA, ' + 'QTD_PESO_COBRADO, ' +
        'DES_TIPO_PESO, ' + 'DAT_RECEBIDO, ' + 'DOM_RECEBIDO, ' + 'NUM_CTRC, ' +
        'NUM_MANIFESTO, ' + 'DES_RASTREIO, ' + 'NUM_LOTE_REMESSA, ' +
        'DES_RETORNO, ' + 'DAT_CREDITO, ' + 'DOM_CREDITO, NUM_CONTAINER, VAL_PRODUTO, ' +
        'QTD_ALTURA, QTD_LARGURA, QTD_COMPRIMENTO)' + 'VALUES (' +
        ':AGENTE, ' + ':ENTREGADOR, ' + ':NOSSONUMERO, ' + ':CLIENTE, ' +
        ':NF, ' + ':CONSUMIDOR, ' + ':ENDERECO, ' + ':COMPLEMENTO, ' +
        ':BAIRRO, ' + ':CIDADE, ' + ':CEP, ' + ':TELEFONE, ' + ':EXPEDICAO, ' +
        ':PREVDISTRIBUICAO, ' + ':VOLUMES, ' + ':ATRIBUICAO, ' + ':STATUS, ' +
        ':ENTREGA,' + ':PESOREAL, ' + ':PESOFRANQUIA, ' + ':VERBAFRANQUIA, ' +
        ':ADVALOREM, ' + ':PAGOFRANQUIA, ' + ':FECHADO, ' + ':NUMEROEXTRATO, ' +
        ':VERBAENTREGADOR, ' + ':DIASATRASO, ' + ':VOLUMESEXTRA, ' +
        ':VALOREXTRA, ' + ':PESOCOBRADO, ' + ':TIPOPESO, ' + ':DATARECEBIDO, ' +
        ':RECEBIDO, ' + ':CTRC, ' + ':MANIFESTO, ' + ':RASTREIO, ' + ':LOTE,' +
        ':RETORNO, ' + ':DATACREDITO, ' + ':CREDITO, :CONTAINER, :VALPRODUTO, :ALTURA, :LARGURA, :COMPRIMENTO)';

      ParamByName('AGENTE').AsInteger := Self.Agente;
      ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
      ParamByName('NOSSONUMERO').AsString := Self.NossoNumero;
      ParamByName('CLIENTE').AsInteger := Self.Cliente;
      ParamByName('NF').AsString := Self.NF;
      ParamByName('CONSUMIDOR').AsString := Self.Consumidor;
      ParamByName('ENDERECO').AsString := Self.Endereco;
      ParamByName('COMPLEMENTO').AsString := Self.Complemento;
      ParamByName('BAIRRO').AsString := Self.Bairro;
      ParamByName('CIDADE').AsString := Self.Cidade;
      ParamByName('CEP').AsString := Self.Cep;
      ParamByName('TELEFONE').AsString := Self.Telefone;
      ParamByName('EXPEDICAO').AsDate := Self.Expedicao;
      ParamByName('PREVDISTRIBUICAO').AsDate := Self.PrevDistribuicao;
      ParamByName('VOLUMES').AsInteger := Self.Volumes;
      ParamByName('ATRIBUICAO').AsDateTime := Self.Atribuicao;
      ParamByName('STATUS').AsInteger := Self.Status;
      ParamByName('ENTREGA').AsDate := Self.Entrega;
      ParamByName('PESOREAL').AsFloat := Self.PesoReal;
      ParamByName('PESOFRANQUIA').AsFloat := Self.PesoFranquia;
      ParamByName('VERBAFRANQUIA').AsFloat := Self.VerbaDistribuicao;
      ParamByName('ADVALOREM').AsFloat := Self.Advalorem;
      ParamByName('PAGOFRANQUIA').AsFloat := Self.ValorFranquia;
      ParamByName('FECHADO').AsString := Self.Fechado;
      ParamByName('NUMEROEXTRATO').AsString := Self.Extrato;
      ParamByName('VERBAENTREGADOR').AsFloat := Self.VerbaEntregador;
      ParamByName('DIASATRASO').AsInteger := Self.DiasAtraso;
      ParamByName('VOLUMESEXTRA').AsFloat := Self.VolumesExtra;
      ParamByName('VALOREXTRA').AsFloat := Self.ValorExtra;
      ParamByName('PESOCOBRADO').AsFloat := Self.PesoCobrado;
      ParamByName('TIPOPESO').AsString := Self.TipoPeso;
      ParamByName('DATARECEBIDO').AsDate := Self.DataRecebido;
      ParamByName('RECEBIDO').AsString := Self.Recebido;
      ParamByName('CTRC').AsInteger := Self.Ctrc;
      ParamByName('MANIFESTO').AsInteger := Self.Manifesto;
      ParamByName('RASTREIO').AsString := Self.Rastreio;
      ParamByName('LOTE').AsInteger := Self.Lote;
      ParamByName('RETORNO').AsString := Self.Retorno;
      ParamByName('DATACREDITO').AsDate := Self.DataCredito;
      ParamByName('CREDITO').AsString := Self.Credito;
      ParamByName('CONTAINER').AsString := Self.Container;
      ParamByName('VALPRODUTO').AsFloat := Self.ValorProduto;
      ParamByName('ALTURA').AsInteger := Self.Altura;
      ParamByName('LARGURA').AsInteger := Self.Largura;
      ParamByName('COMPRIMENTO').AsInteger := Self.Comprimento;
      dm.ZConn.PingServer;
      ExecSQL;

    end;
    dm.qryCRUD.Close;
    dm.qryCRUD.SQL.Clear;
    Result := True;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TEntrega.Update(): Boolean;
begin
  try
    Result := False;
    with dm.qryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'UPDATE ' + TABLENAME + ' SET ' + 'COD_AGENTE = :AGENTE, ' +
        'COD_ENTREGADOR = :ENTREGADOR, ' + 'COD_CLIENTE = :CLIENTE, ' +
        'NUM_NF = :NF, ' + 'NOM_CONSUMIDOR = :CONSUMIDOR, ' +
        'DES_ENDERECO = :ENDERECO, ' + 'DES_COMPLEMENTO = :COMPLEMENTO, ' +
        'DES_BAIRRO = :BAIRRO, ' + 'NOM_CIDADE = :CIDADE, ' + 'NUM_CEP = :CEP, '
        + 'NUM_TELEFONE = :TELEFONE, ' + 'DAT_EXPEDICAO = :EXPEDICAO, ' +
        'DAT_PREV_DISTRIBUICAO = :PREVDISTRIBUICAO, ' +
        'QTD_VOLUMES = :VOLUMES, ' + 'DAT_ATRIBUICAO = :ATRIBUICAO, ' +
        'COD_STATUS = :STATUS, ' + 'DAT_ENTREGA = :ENTREGA, ' +
        'DAT_BAIXA  = :BAIXA, ' + 'DOM_BAIXADO  = :BAIXADO, ' +
        'QTD_PESO_REAL = :PESOREAL, ' + 'QTD_PESO_FRANQUIA = :PESOFRANQUIA, ' +
        'VAL_VERBA_FRANQUIA = :VERBAFRANQUIA, ' + 'VAL_ADVALOREM = :ADVALOREM, '
        + 'VAL_PAGO_FRANQUIA = :PAGOFRANQUIA, ' + 'DOM_FECHADO = :FECHADO, ' +
        'NUM_EXTRATO = :NUMEROEXTRATO, ' +
        'VAL_VERBA_ENTREGADOR = :VERBAENTREGADOR, ' +
        'QTD_DIAS_ATRASO = :DIASATRASO, ' +
        'QTD_VOLUMES_EXTRA = :VOLUMESEXTRA, ' +
        'VAL_VOLUMES_EXTRA = :VALOREXTRA, ' +
        'QTD_PESO_COBRADO = :PESOCOBRADO, ' + 'DES_TIPO_PESO = :TIPOPESO, ' +
        'DAT_RECEBIDO = :DATARECEBIDO, ' + 'DOM_RECEBIDO = :RECEBIDO, ' +
        'NUM_CTRC = :CTRC, ' + 'NUM_MANIFESTO = :MANIFESTO, ' +
        'DES_RASTREIO = :RASTREIO,  ' + 'NUM_LOTE_REMESSA := :LOTE, ' +
        'DES_RETORNO = :RETORNO, ' + 'DAT_CREDITO = :DATACREDITO, ' + 'DOM_CREDITO = :CREDITO, ' +
        'NUM_CONTAINER = :CONTAINER, VAL_PRODUTO = :VALPRODUTO, ' +
        'QTD_ALTURA = :ALTURA, QTD_LARGURA = :LARGURA, QTD_COMPRIMENTO = :COMPRIMENTO ' +
        'WHERE ' + 'NUM_NOSSONUMERO = :NOSSONUMERO';

      ParamByName('AGENTE').AsInteger := Self.Agente;
      ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
      ParamByName('NOSSONUMERO').AsString := Self.NossoNumero;
      ParamByName('CLIENTE').AsInteger := Self.Cliente;
      ParamByName('NF').AsString := Self.NF;
      ParamByName('CONSUMIDOR').AsString := Self.Consumidor;
      ParamByName('ENDERECO').AsString := Self.Endereco;
      ParamByName('COMPLEMENTO').AsString := Self.Complemento;
      ParamByName('BAIRRO').AsString := Self.Bairro;
      ParamByName('CIDADE').AsString := Self.Cidade;
      ParamByName('CEP').AsString := Self.Cep;
      ParamByName('TELEFONE').AsString := Self.Telefone;
      ParamByName('EXPEDICAO').AsDate := Self.Expedicao;
      ParamByName('PREVDISTRIBUICAO').AsDate := Self.PrevDistribuicao;
      ParamByName('VOLUMES').AsInteger := Self.Volumes;
      ParamByName('ATRIBUICAO').AsDateTime := Self.Atribuicao;
      ParamByName('STATUS').AsInteger := Self.Status;
      ParamByName('ENTREGA').AsDate := Self.Entrega;
      ParamByName('BAIXA').AsDateTime := Self.DataBaixa;
      ParamByName('BAIXADO').AsString := Self.Baixado;
      ParamByName('PESOREAL').AsFloat := Self.PesoReal;
      ParamByName('PESOFRANQUIA').AsFloat := Self.PesoFranquia;
      ParamByName('VERBAFRANQUIA').AsFloat := Self.VerbaDistribuicao;
      ParamByName('ADVALOREM').AsFloat := Self.Advalorem;
      ParamByName('PAGOFRANQUIA').AsFloat := Self.ValorFranquia;
      ParamByName('FECHADO').AsString := Self.Fechado;
      ParamByName('NUMEROEXTRATO').AsString := Self.Extrato;
      ParamByName('VERBAENTREGADOR').AsFloat := Self.VerbaEntregador;
      ParamByName('DIASATRASO').AsInteger := Self.DiasAtraso;
      ParamByName('VOLUMESEXTRA').AsFloat := Self.VolumesExtra;
      ParamByName('VALOREXTRA').AsFloat := Self.ValorExtra;
      ParamByName('PESOCOBRADO').AsFloat := Self.PesoCobrado;
      ParamByName('TIPOPESO').AsString := Self.TipoPeso;
      ParamByName('DATARECEBIDO').AsDate := Self.DataRecebido;
      ParamByName('RECEBIDO').AsString := Self.Recebido;
      ParamByName('CTRC').AsInteger := Self.Ctrc;
      ParamByName('MANIFESTO').AsInteger := Self.Manifesto;
      ParamByName('RASTREIO').AsString := Self.Rastreio;
      ParamByName('LOTE').AsInteger := Self.Lote;
      ParamByName('RETORNO').AsString := Self.Retorno;
      ParamByName('DATACREDITO').AsDate := Self.DataCredito;
      ParamByName('CREDITO').AsString := Self.Credito;
      ParamByName('CONTAINER').AsString := Self.Container;
      ParamByName('VALPRODUTO').AsFloat := Self.ValorProduto;
      ParamByName('ALTURA').AsInteger := Self.Altura;
      ParamByName('LARGURA').AsInteger := Self.Largura;
      ParamByName('COMPRIMENTO').AsInteger := Self.Comprimento;

      dm.ZConn.PingServer;
      ExecSQL;
    end;
    dm.qryCRUD.Close;
    dm.qryCRUD.SQL.Clear;
    Result := True;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TEntrega.getField(campo, coluna: String): String;
begin
  try
    Result := '';
    dm.ZConn.Reconnect;
    with dm.qryFields do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT ' + campo + ' FROM ' + TABLENAME);
      if coluna = 'NOSSONUMERO' then
      begin
        SQL.Add(' WHERE NUM_NOSSONUMERO = :NOSSONUMERO');
        ParamByName('NOSSONUMERO').AsString := Self.NossoNumero;
      end
      else if coluna = 'CONSUMIDOR' then
      begin
        SQL.Add(' WHERE NOM_CONSUMIDOR = :CONSUMIDOR');
        ParamByName('CONSUMIDOR').AsString := Self.Consumidor;
      end;
      dm.ZConn.PingServer;
      Open;
      if not IsEmpty then
      begin
        First;
        Result := FieldByName(campo).AsString;
      end;
    end;
    dm.qryFields.Close;
    dm.qryFields.SQL.Clear;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TEntrega.getLote: Integer;
begin
  Result := _lote;
end;

function TEntrega.getManifesto: Integer;
begin
  Result := _manifesto;
end;

function TEntrega.JaExiste(): Boolean;
begin
  try
    Result := False;

    with dm.qryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);
      SQL.Add(' WHERE NUM_NOSSONUMERO = :NOSSONUMERO');
      ParamByName('NOSSONUMERO').AsString := Self.NossoNumero;
      dm.ZConn.PingServer;
      Open;
      if not(IsEmpty) then
        Result := True;
    end;

    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TEntrega.Periodo(sdtInicial, sdtFinal, sAgente, sEntregador,
  filtro: String): Boolean;
var
  iAgente: Integer;
  sSQL: STring;
begin
  Try
    Result := False;
    if TUtil.Empty(sdtInicial) then
      Exit;
    if TUtil.Empty(sdtFinal) then
      Exit;

    with dm.qryGeral do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);
      if filtro = 'BAIXA' then
      begin
        SQL.Add(' WHERE DOM_BAIXADO = :BAIXADO AND DAT_BAIXA BETWEEN :INICIO AND :TERMINO');
        ParamByName('INICIO').AsDate := StrToDate(sdtInicial);
        ParamByName('TERMINO').AsDate := StrToDate(sdtFinal);
        ParamByName('BAIXADO').AsString := 'S';
        if Self.Cliente = 0 then
        begin
          SQL.Add(' AND COD_CLIENTE > :CLIENTE AND COD_CLIENTE < :CLIENTE1');
          ParamByName('CLIENTE').AsInteger := 2;
          ParamByName('CLIENTE1').AsInteger := 90000;
        end
        else
        begin
          SQL.Add(' AND COD_CLIENTE <> :CLIENTE');
          ParamByName('CLIENTE').AsInteger := Self.Cliente;
        end;
      end;
      if filtro = 'ENTREGA' then
      begin
        SQL.Add(' WHERE DOM_BAIXADO = :BAIXADO AND DAT_ENTREGA BETWEEN :INICIO AND :TERMINO AND COD_CLIENTE > :CLIENTE AND COD_CLIENTE < :CLIENTE1');
        ParamByName('INICIO').AsDate := StrToDate(sdtInicial);
        ParamByName('TERMINO').AsDate := StrToDate(sdtFinal);
        ParamByName('BAIXADO').AsString := 'S';
        ParamByName('CLIENTE').AsInteger := 2;
        ParamByName('CLIENTE1').AsInteger := 90000;
      end;
      if filtro = 'ATRIBUICAO' then
      begin
        SQL.Add(' WHERE DAT_ATRIBUICAO BETWEEN :INICIO AND :TERMINO AND COD_CLIENTE > :CLIENTE AND COD_CLIENTE < :CLIENTE1');
        ParamByName('INICIO').AsDate := StrToDate(sdtInicial);
        ParamByName('TERMINO').AsDate := StrToDate(sdtFinal);
        ParamByName('CLIENTE').AsInteger := 2;
        ParamByName('CLIENTE1').AsInteger := 90000;
      end;
      if filtro = 'AERO' then
      begin
        SQL.Add(' WHERE DAT_ATRIBUICAO BETWEEN :INICIO AND :TERMINO AND COD_CLIENTE = :CLIENTE AND DOM_BAIXADO <> :BAIXADO AND '
          + 'NUM_LOTE_REMESSA = :LOTE');
        ParamByName('INICIO').AsDate := StrToDate(sdtInicial);
        ParamByName('TERMINO').AsDate := StrToDate(sdtFinal);
        ParamByName('CLIENTE').AsInteger := 99991;
        ParamByName('BAIXADO').AsString := 'S';
        ParamByName('LOTE').AsInteger := Self.Lote;
      end;
      if not(TUtil.Empty(sAgente)) then
      begin
        SQL.Add(' AND COD_AGENTE = :AGENTE');
        ParamByName('AGENTE').AsInteger := StrToInt(sAgente);
      end;
      if not(TUtil.Empty(sEntregador)) then
      begin
        SQL.Add(' AND COD_ENTREGADOR = :ENTREGADOR');
        ParamByName('ENTREGADOR').AsInteger := StrToInt(sEntregador);
      end;
      SQL.Add(' ORDER BY COD_AGENTE, COD_ENTREGADOR, NUM_NOSSONUMERO');
      dm.ZConn.PingServer;
      Open;
      if not(IsEmpty) then
        First
      else
        Exit;
    end;
    Result := True

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TEntrega.UltimaExpedicao(): String;
begin
  try
    Result := '';
    with dm.qryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT MAX(DAT_EXPEDICAO) DATA FROM ' + TABLENAME);
      dm.ZConn.PingServer;
      Open;
      if not(IsEmpty) then
        Result := dm.qryGetObject.FieldByName('DATA').AsString;
    end;

    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TEntrega.TotalPeriodo(sdtInicial, sdtFinal, sAgente, sEntregador,
  filtro: String): Boolean;
var
  iAgente: Integer;
  sSQL: STring;
begin
  try
    Result := False;
    if TUtil.Empty(sdtInicial) then
      Exit;
    if TUtil.Empty(sdtFinal) then
      Exit;
    with dm.qryGeral do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT COD_ENTREGADOR, ' + 'COD_AGENTE, ' +
        'SUM(QTD_VOLUMES) VOLUMES, ' + 'COUNT(NUM_NOSSONUMERO) ENTREGAS, ' +
        'SUM(QTD_VOLUMES_EXTRA) EXTRA, ' + 'SUM(VAL_VERBA_ENTREGADOR) VERBA, ' +
        'SUM(VAL_VOLUMES_EXTRA) VALOR ' + 'FROM ' + TABLENAME);
      if filtro = 'BAIXA' then
      begin
        SQL.Add(' WHERE DOM_BAIXADO = :BAIXADO AND DAT_BAIXA BETWEEN :INICIO AND :TERMINO AND COD_CLIENTE > :CLIENTE AND COD_CLIENTE < :CLIENTE1');
        ParamByName('INICIO').AsDate := StrToDate(sdtInicial);
        ParamByName('TERMINO').AsDate := StrToDate(sdtFinal);
        ParamByName('BAIXADO').AsString := 'S';
        ParamByName('CLIENTE').AsInteger := 2;
        ParamByName('CLIENTE1').AsInteger := 90000;
      end;
      if filtro = 'ATRIBUICAO' then
      begin
        SQL.Add(' WHERE AND DAT_ATRIBUICAO BETWEEN :INICIO AND :TERMINO AND COD_CLIENTE > :CLIENTE AND COD_CLIENTE < :CLIENTE1');
        ParamByName('INICIO').AsString := sdtInicial;
        ParamByName('TERMINO').AsString := sdtFinal;
        ParamByName('CLIENTE').AsInteger := 2;
        ParamByName('CLIENTE1').AsInteger := 90000;
      end;
      if not(TUtil.Empty(sAgente)) then
      begin
        SQL.Add(' AND COD_AGENTE = :AGENTE');
        ParamByName('AGENTE').AsInteger := StrToInt(sAgente);
      end;
      if not(TUtil.Empty(sEntregador)) then
      begin
        SQL.Add(' AND COD_ENTREGADOR = :ENTREGADOR');
        ParamByName('ENTREGADOR').AsInteger := StrToInt(sEntregador);
      end;
      SQL.Add(' AND DOM_FECHADO <> :FECHADO');
      ParamByName('FECHADO').AsString := 'S';
      SQL.Add(' GROUP BY COD_AGENTE, COD_ENTREGADOR');
      dm.ZConn.PingServer;
      Open;
      if not(IsEmpty) then
      begin
        First;
      end
      else
      begin
        Close;
        SQL.Clear;
        Exit;
      end;
    end;
    Result := True

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TEntrega.Fechar(sdtInicial, sdtFinal, sdtPago, sExtrato, sAgente, sEntregador, filtro, sTipo: String; dVerba: Double; iTipo, iCliente: Integer): Boolean;
var
  iAgente: Integer;
  sSQL: STring;
begin
  try
    Result := False;
    if TUtil.Empty(sdtInicial) then
      Exit;
    if TUtil.Empty(sdtFinal) then
      Exit;
    if TUtil.Empty(sdtPago) then
      Exit;
    if TUtil.Empty(sExtrato) then
      Exit;
    with dm.qryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE ' + TABLENAME);
      SQL.Add('SET DOM_FECHADO = :FECHADO, ');
      SQL.Add('NUM_EXTRATO = :EXTRATO, ');
      SQL.Add('DAT_PAGAMENTO = :PAGAMENTO, ');
      SQL.Add('DOM_PAGO = :PAGO ');
      if iTipo <> 1 then
      begin
        SQL.Add(', VAL_VERBA_ENTREGADOR = :VERBA ');
        ParamByName('VERBA').AsFloat := dVerba;
      end;
      if filtro = 'BAIXAS' then
      begin
        SQL.Add(' WHERE DOM_BAIXADO = :BAIXADO AND DAT_BAIXA BETWEEN :INICIO AND :TERMINO');
        ParamByName('INICIO').AsDate := StrToDate(sdtInicial);
        ParamByName('TERMINO').AsDate := StrToDate(sdtFinal);
        ParamByName('BAIXADO').AsString := 'S';
      end;
      if filtro = 'ATRIBUIÇÕES' then
      begin
        SQL.Add(' WHERE AND DAT_ATRIBUICAO BETWEEN :INICIO AND :TERMINO');
        ParamByName('INICIO').AsString := sdtInicial;
        ParamByName('TERMINO').AsString := sdtFinal;
      end;
      if filtro = 'ENTREGAS' then
      begin
        SQL.Add(' WHERE AND DAT_ENTREGA BETWEEN :INICIO AND :TERMINO');
        ParamByName('INICIO').AsString := sdtInicial;
        ParamByName('TERMINO').AsString := sdtFinal;
      end;
      if iCliente = 0 then
      begin
        SQL.Add(' AND COD_CLIENTE <> :CLIENTE');
        ParamByName('CLIENTE').AsInteger := 2;
      end
      else
      begin
        SQL.Add(' AND COD_CLIENTE = :CLIENTE');
        ParamByName('CLIENTE').AsInteger := iCliente;
      end;
      if not(TUtil.Empty(sAgente)) then
      begin
        SQL.Add(' AND COD_AGENTE = :AGENTE');
        ParamByName('AGENTE').AsInteger := StrToInt(sAgente);
      end;
      if not(TUtil.Empty(sEntregador)) then
      begin
        SQL.Add(' AND COD_ENTREGADOR = :ENTREGADOR');
        ParamByName('ENTREGADOR').AsInteger := StrToInt(sEntregador);
      end;
      if sTipo = 'FECHAR' then
      begin
        ParamByName('FECHADO').AsString := 'S';
        ParamByName('EXTRATO').AsString := sExtrato;
        ParamByName('PAGAMENTO').AsDate := StrToDate(sdtPago);
        ParamByName('PAGO').AsString := 'S';
      end
      else
      begin
        ParamByName('FECHADO').AsString := 'N';
        ParamByName('EXTRATO').AsString := '0';
        ParamByName('PAGAMENTO').AsDate := 0;
        ParamByName('PAGO').AsString := 'N';
      end;
      dm.ZConn.PingServer;
      ExecSQL;
      Close;
      SQL.Clear;
    end;
    Result := True
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TEntrega.Prazo(sData, sDias: String): Boolean;
begin
  try
    Result := False;
    if TUtil.Empty(sData) then
      Exit;
    if TUtil.Empty(sDias) then
      Exit;
    with dm.qryGeral do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT tbentregas.DAT_ENTREGA, tbentregas.DAT_BAIXA, ');
      SQL.Add('COUNT(tbentregas.NUM_NOSSONUMERO) ENTREGAS ');
      SQL.Add('FROM ' + TABLENAME);
      SQL.Add(' WHERE tbentregas.DOM_BAIXADO = :BAIXADO AND tbentregas.DAT_ENTREGA = :DATA');
      if sDias = '0' then
      begin
        SQL.Add(' AND tbentregas.QTD_DIAS_ATRASO <= :DIAS');
        ParamByName('DIAS').AsInteger := StrToInt(sDias);
      end
      else if sDias = '1' then
      begin
        SQL.Add(' AND tbentregas.QTD_DIAS_ATRASO = :DIAS');
        ParamByName('DIAS').AsInteger := StrToInt(sDias);
      end
      else if sDias = '2' then
      begin
        SQL.Add(' AND tbentregas.QTD_DIAS_ATRASO = :DIAS');
        ParamByName('DIAS').AsInteger := StrToInt(sDias);
      end
      else if sDias = '3' then
      begin
        SQL.Add(' AND tbentregas.QTD_DIAS_ATRASO >= :DIAS');
        ParamByName('DIAS').AsInteger := StrToInt(sDias);
      end;
      if Self.Cliente <> 0 then
      begin
        SQL.Add(' AND tbentregas.COD_CLIENTE = :CLIENTE');
        ParamByName('CLIENTE').AsInteger := Self.Cliente;
      end
      else
      begin
        SQL.Add(' AND tbentregas.COD_CLIENTE > :CLIENTE AND tbentregas.COD_CLIENTE < :CLIENTE1');
        ParamByName('CLIENTE').AsInteger := 2;
        ParamByName('CLIENTE1').AsInteger := 90000;
      end;
      if Self.Agente <> 0 then
      begin
        SQL.Add(' AND tbentregas.COD_AGENTE = :AGENTE');
        ParamByName('AGENTE').AsInteger := Self.Agente;
      end;
      SQL.Add(' GROUP BY tbentregas.DAT_ENTREGA');
      ParamByName('DATA').AsDate := StrToDate(sData);
      ParamByName('BAIXADO').AsString := 'S';
      dm.ZConn.PingServer;
      Open;
      if not(IsEmpty) then
        First
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

function TEntrega.PrazoExtrato(sData, sData1, sAgente, sEntregador,
  sDias: String): Integer;
begin
  try
    Result := 0;
    if TUtil.Empty(sData) then
      Exit;
    if TUtil.Empty(sDias) then
      Exit;
    with dm.qryCalculo do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT COUNT(tbentregas.NUM_NOSSONUMERO) ENTREGAS ');
      SQL.Add('FROM ' + TABLENAME);
      SQL.Add(' WHERE tbentregas.DOM_BAIXADO = :BAIXADO AND tbentregas.DAT_BAIXA BETWEEN :DATA AND :DATA1 AND '
        + 'tbentregas.COD_CLIENTE > :CLIENTE AND tbentregas.COD_CLIENTE < :CLIENTE1');
      if not(TUtil.Empty(sAgente)) then
      begin
        SQL.Add(' AND tbentregas.COD_AGENTE = :AGENTE');
        ParamByName('AGENTE').AsInteger := StrToInt(sAgente);
      end;
      if not(TUtil.Empty(sEntregador)) then
      begin
        SQL.Add(' AND tbentregas.COD_ENTREGADOR = :ENTREGADOR');
        ParamByName('ENTREGADOR').AsInteger := StrToInt(sEntregador);
      end;
      if sDias = '1' then
      begin
        SQL.Add(' AND tbentregas.QTD_DIAS_ATRASO = :DIAS');
        ParamByName('DIAS').AsInteger := StrToInt(sDias);
      end
      else if sDias = '2' then
      begin
        SQL.Add(' AND tbentregas.QTD_DIAS_ATRASO = :DIAS');
        ParamByName('DIAS').AsInteger := StrToInt(sDias);
      end
      else if sDias = '3' then
      begin
        SQL.Add(' AND tbentregas.QTD_DIAS_ATRASO >= :DIAS');
        ParamByName('DIAS').AsInteger := StrToInt(sDias);
      end
      else if sDias = '99' then
      begin
        SQL.Add(' AND tbentregas.QTD_DIAS_ATRASO >= :DIAS');
        ParamByName('DIAS').AsInteger := 1;
      end;
      ParamByName('DATA').AsDate := StrToDate(sData);
      ParamByName('DATA1').AsDate := StrToDate(sData1);
      ParamByName('BAIXADO').AsString := 'S';
      ParamByName('CLIENTE').AsInteger := 2;
      ParamByName('CLIENTE1').AsInteger := 90000;
      dm.ZConn.PingServer;
      Open;
      if not(IsEmpty) then
      begin
        First;
        Result := FieldByName('ENTREGAS').AsInteger;
        Close;
        SQL.Clear;
      end
      else
      begin
        Result := 0;
        Close;
        SQL.Clear;
      end;
    end;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TEntrega.PosicaoEntregasSimples(sdtInicial, sdtFinal, sAgente, sCliente, sTipo: String): Boolean;
begin
  try
    Result := False;
    with dm.qryGeral do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);
      if sTipo = '0' then
      begin
        SQL.Add('WHERE DAT_ATRIBUICAO BETWEEN :DATAINCIAL AND :DATAFINAL AND DOM_BAIXADO <> :BAIXADO AND COD_STATUS = :STATUS ');
        if not(TUtil.Empty(sAgente)) then
        begin
          SQL.Add('AND COD_AGENTE = :AGENTE');
          ParamByName('AGENTE').AsInteger := StrToInt(sAgente);
        end;
        if not(TUtil.Empty(sCliente)) then
        begin
          SQL.Add('AND COD_CLIENTE = :CLIENTE');
          ParamByName('CLIENTE').AsInteger := StrToInt(sCliente);
        end;
        ParamByName('DATAINCIAL').AsDate := StrToDate(sdtInicial);
        ParamByName('DATAFINAL').AsDate := StrToDate(sdtFinal);
        ParamByName('BAIXADO').AsString := 'S';
        ParamByName('STATUS').AsInteger := 5;
      end;
      if sTipo = '1' then
      begin
        SQL.Add('WHERE DAT_BAIXA BETWEEN :DATAINCIAL AND :DATAFINAL AND DOM_BAIXADO = :BAIXADO AND COD_STATUS = :STATUS ');
        if not(TUtil.Empty(sAgente)) then
        begin
          SQL.Add('AND COD_AGENTE = :AGENTE');
          ParamByName('AGENTE').AsInteger := StrToInt(sAgente);
        end;
        if not(TUtil.Empty(sCliente)) then
        begin
          SQL.Add('AND COD_CLIENTE = :CLIENTE');
          ParamByName('CLIENTE').AsInteger := StrToInt(sCliente);
        end;
        ParamByName('DATAINCIAL').AsDate := StrToDate(sdtInicial);
        ParamByName('DATAFINAL').AsDate := StrToDate(sdtFinal);
        ParamByName('BAIXADO').AsString := 'S';
        ParamByName('STATUS').AsInteger := 12;
      end;
      if sTipo = '2' then
      begin
        SQL.Add('WHERE DAT_BAIXA BETWEEN :DATAINCIAL AND :DATAFINAL AND DOM_BAIXADO <> :BAIXADO AND COD_STATUS = :STATUS');
        if not(TUtil.Empty(sAgente)) then
        begin
          SQL.Add('AND COD_AGENTE = :AGENTE');
          ParamByName('AGENTE').AsInteger := StrToInt(sAgente);
        end;
        if not(TUtil.Empty(sCliente)) then
        begin
          SQL.Add('AND COD_CLIENTE = :CLIENTE');
          ParamByName('CLIENTE').AsInteger := StrToInt(sCliente);
        end;
        ParamByName('DATAINCIAL').AsDate := StrToDate(sdtInicial);
        ParamByName('DATAFINAL').AsDate := StrToDate(sdtFinal);
        ParamByName('BAIXADO').AsString := 'S';
        ParamByName('STATUS').AsInteger := 6
      end;
      if sTipo = '3' then
      begin
        SQL.Add('WHERE DAT_BAIXA BETWEEN :DATAINCIAL AND :DATAFINAL AND DOM_BAIXADO = :BAIXADO AND COD_AGENTE = :AGENTE AND COD_STATUS = :STATUS ');
        SQL.Add('AND COD_AGENTE = :AGENTE');
        ParamByName('AGENTE').AsInteger := 99991;
        if not(TUtil.Empty(sCliente)) then
        begin
          SQL.Add('AND COD_CLIENTE = :CLIENTE');
          ParamByName('CLIENTE').AsInteger := StrToInt(sCliente);
        end;
        ParamByName('DATAINCIAL').AsDate := StrToDate(sdtInicial);
        ParamByName('DATAFINAL').AsDate := StrToDate(sdtFinal);
        ParamByName('BAIXADO').AsString := 'S';
        ParamByName('STATUS').AsInteger := 11
      end;
      if sTipo = '4' then
      begin
        SQL.Add('WHERE COD_ENTREGADOR = :ENTREGADOR AND DOM_BAIXADO <> :BAIXADO AND COD_STATUS = :STATUS ');
        if not(TUtil.Empty(sAgente)) then
        begin
          SQL.Add('AND COD_AGENTE = :AGENTE');
          ParamByName('AGENTE').AsInteger := StrToInt(sAgente);
        end;
        if not(TUtil.Empty(sCliente)) then
        begin
          SQL.Add('AND COD_CLIENTE = :CLIENTE');
          ParamByName('CLIENTE').AsInteger := StrToInt(sCliente);
        end;
        ParamByName('ENTREGADOR').AsInteger := 0;
        ParamByName('BAIXADO').AsString := 'S';
        ParamByName('STATUS').AsInteger := 5;
      end;
      dm.ZConn.PingServer;
      Open;
      if not IsEmpty then
      begin
        First;
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

function TEntrega.Previa(sdtData, sdtData1, sAgente: String): Boolean;
begin
  try
    Result := False;
    with dm.qryGeral do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT COD_ENTREGADOR, DAT_BAIXA, COUNT(NUM_NOSSONUMERO) TOTAL FROM '
        + TABLENAME);
      SQL.Add('WHERE COD_AGENTE IN (' + sAgente + ') ');
      SQL.Add('AND DAT_BAIXA BETWEEN :DATA AND :DATA1 AND DOM_BAIXADO = :BAIXADO ');
      SQL.Add('GROUP BY COD_ENTREGADOR, DAT_BAIXA');
      // ParamByName('AGENTE').AsString      :=  sAgente;
      ParamByName('DATA').AsDate := StrToDate(sdtData);
      ParamByName('DATA1').AsDate := StrToDate(sdtData1);
      ParamByName('BAIXADO').AsString := 'S';
      dm.ZConn.PingServer;
      Open;
      if not IsEmpty then
      begin
        First;
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

function TEntrega.PesquisaEntrega(sNossoNumero, sExpedicaoI, sExpedicaoF, sPrevisaoI, sPrevisaoF, sBaixaI,
                                  sBaixaF, sClientes, sEntregador, sAgente, sTipoBaixa, sAtraso: String; iClienteEmpresa: Integer): Boolean;
var
  bWhere: Boolean;
  sCampos: String;
begin
  try
    Result := False;
    bWhere := False;
    sCampos := sNossoNumero + sExpedicaoI + sExpedicaoF + sPrevisaoI +
      sPrevisaoF + sBaixaI + sBaixaF + sClientes + sEntregador + sAgente + iClienteEmpresa.ToString;
    if sCampos.isEmpty then
    begin
      MessageDlg('Informe ao menos um parâmetro de pesquisa!', mtWarning,
        [mbOK], 0);
      Exit;
    end;
    dm.qryGrid.Close;
    dm.qryGrid.SQL.Clear;
    dm.qryGrid.SQL.Add('SELECT * FROM ' + TABLENAME);
    if not(TUtil.Empty(sNossoNumero)) then
    begin
      if (not bWhere) then
      begin
        dm.qryGrid.SQL.Add('WHERE NUM_NOSSONUMERO IN (' + sNossoNumero + ')');
        bWhere := True;
      end
      else
      begin
        dm.qryGrid.SQL.Add('AND NUM_NOSSONUMERO IN (' + sNossoNumero + ')');
      end;
      // dm.qryGrid.ParamByName('NOSSONUMERO').AsString  := sNossoNumero;
    end;
    if (not TUtil.Empty(sExpedicaoI)) then
    begin
      if (not TUtil.Empty(sExpedicaoF)) then
      begin
        if (not bWhere) then
        begin
          dm.qryGrid.SQL.Add
            ('WHERE DAT_EXPEDICAO BETWEEN :EXPEDICAO1 AND :EXPEDICAO2');
          bWhere := True;
        end
        else
        begin
          dm.qryGrid.SQL.Add
            ('AND DAT_EXPEDICAO BETWEEN :EXPEDICAO1 AND :EXPEDICAO2');
        end;
        dm.qryGrid.ParamByName('EXPEDICAO1').AsDate := StrToDate(sExpedicaoI);
        dm.qryGrid.ParamByName('EXPEDICAO2').AsDate := StrToDate(sExpedicaoF);
      end
      else
      begin
        if (not bWhere) then
        begin
          dm.qryGrid.SQL.Add('WHERE DAT_EXPEDICAO = :EXPEDICAO1');
          bWhere := True;
        end
        else
        begin
          dm.qryGrid.SQL.Add('AND DAT_EXPEDICAO = :EXPEDICAO1');
        end;
        dm.qryGrid.ParamByName('EXPEDICAO1').AsDate := StrToDate(sExpedicaoI);
      end;
    end;
    if (not TUtil.Empty(sPrevisaoI)) then
    begin
      if (not TUtil.Empty(sPrevisaoF)) then
      begin
        if (not bWhere) then
        begin
          dm.qryGrid.SQL.Add
            ('WHERE DAT_PREV_DISTRIBUICAO BETWEEN :PREVISAO1 AND :PREVISAO2');
          bWhere := True;
        end
        else
        begin
          dm.qryGrid.SQL.Add
            ('AND DAT_PREV_DISTRIBUICAO BETWEEN :PREVISAO1 AND :PREVISAO2');
        end;
        dm.qryGrid.ParamByName('PREVISAO1').AsDate := StrToDate(sPrevisaoI);
        dm.qryGrid.ParamByName('PREVISAO2').AsDate := StrToDate(sPrevisaoF);
      end
      else
      begin
        if (not bWhere) then
        begin
          dm.qryGrid.SQL.Add('WHERE DAT_PREV_DISTRIBUICAO = :PREVISAO1');
          bWhere := True;
        end
        else
        begin
          dm.qryGrid.SQL.Add('AND DAT_PREV_DISTRIBUICAO = :PREVISAO1');
        end;
        dm.qryGrid.ParamByName('PREVISAO1').AsDate := StrToDate(sPrevisaoI);
      end;
    end;
    if (not TUtil.Empty(sBaixaI)) then
    begin
      if (not TUtil.Empty(sBaixaF)) then
      begin
        if (not bWhere) then
        begin
          dm.qryGrid.SQL.Add('WHERE DAT_BAIXA BETWEEN :BAIXA1 AND :BAIXA2 AND DOM_BAIXADO = :TIPOBAIXA');
          bWhere := True;
        end
        else
        begin
          dm.qryGrid.SQL.Add('AND DAT_BAIXA BETWEEN :BAIXA1 AND :BAIXA2 AND DOM_BAIXADO = :TIPOBAIXA');
        end;
        dm.qryGrid.ParamByName('BAIXA1').AsDate := StrToDate(sBaixaI);
        dm.qryGrid.ParamByName('BAIXA2').AsDate := StrToDate(sBaixaF);
        dm.qryGrid.ParamByName('TIPOBAIXA').AsString := sTipoBaixa;
      end
      else
      begin
        if (not bWhere) then
        begin
          dm.qryGrid.SQL.Add('WHERE DAT_BAIXA = :BAIXA1 AND DOM_BAIXADO = :TIPOBAIXA');
          bWhere := True;
        end
        else
        begin
          dm.qryGrid.SQL.Add('AND DAT_BAIXA = :BAIXA1 AND DOM_BAIXADO = :TIPOBAIXA');
        end;
        dm.qryGrid.ParamByName('BAIXA1').AsDate := StrToDate(sBaixaI);
        dm.qryGrid.ParamByName('TIPOBAIXA').AsString := sTipoBaixa;
      end;
    end;
    if not(TUtil.Empty(sClientes)) then
    begin
      if (not bWhere) then
      begin
        dm.qryGrid.SQL.Add('WHERE COD_CLIENTE IN (:CLIENTE)');
        bWhere := True;
      end
      else
      begin
        dm.qryGrid.SQL.Add('AND COD_CLIENTE IN (:CLIENTE)');
      end;
      dm.qryGrid.ParamByName('CLIENTE').AsString := sClientes;
    end;
    if not(sAgente.IsEmpty) then
    begin
      if (not bWhere) then
      begin
        dm.qryGrid.SQL.Add('WHERE COD_AGENTE = :AGENTE');
        bWhere := True;
      end
      else
      begin
        dm.qryGrid.SQL.Add('AND COD_AGENTE = :AGENTE');
      end;
      dm.qryGrid.ParamByName('AGENTE').AsInteger := StrToIntDef(sAgente,0);
    end;
    if not(sEntregador.IsEmpty) then
    begin
      if (not bWhere) then
      begin
        dm.qryGrid.SQL.Add('WHERE COD_ENTREGADOR = :ENTREGADOR');
        bWhere := True;
      end
      else
      begin
        dm.qryGrid.SQL.Add('AND COD_ENTREGADOR = :ENTREGADOR');
      end;
      dm.qryGrid.ParamByName('ENTREGADOR').AsInteger := StrToIntDef(sEntregador,0);
    end;

    if iClienteEmpresa > 0 then
    begin
      if (not bWhere) then
      begin
        dm.qryGrid.SQL.Add('WHERE COD_CLIENTE_EMPRESA = :CLIENTE');
        bWhere := True;
      end
      else
      begin
        dm.qryGrid.SQL.Add('AND COD_CLIENTE_EMPRESA = :CLIENTE');
      end;
      dm.qryGrid.ParamByName('CLIENTE').AsInteger := iClienteEmpresa;
    end;

    if sAtraso = 'S' then
    begin
      if (not bWhere) then
      begin
        dm.qryGrid.SQL.Add('WHERE QTD_DIAS_ATRASO >= 1');
        bWhere := True;
      end
      else
      begin
        dm.qryGrid.SQL.Add('AND QTD_DIAS_ATRASO >= 1');
      end;
    end;
    dm.ZConn.PingServer;
    dm.qryGrid.Open;
    if dm.qryGrid.IsEmpty then
    begin
      dm.qryGrid.Close;
      dm.qryGrid.SQL.Clear;
      Exit;
    end;
    Result := True;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

procedure TEntrega.setAgente(const Value: Integer);
begin
  _agente := Value;
end;

procedure TEntrega.setAltura(const Value: Integer);
begin
  _altura := Value;
end;

procedure TEntrega.setCliente(const Value: Integer);
begin
  _cliente := Value;
end;

procedure TEntrega.setCodCliente(const Value: Integer);
begin
  _codcliente := value;
end;

procedure TEntrega.setComprimento(const Value: Integer);
begin
  _comprimento := Value;
end;

procedure TEntrega.setConsumidor(const Value: String);
begin
  _consumidor := Value;
end;

procedure TEntrega.setContainer(const Value: String);
begin
  _container := Value;
end;

procedure TEntrega.setCredito(const Value: String);
begin
  _credito := Value;
end;

procedure TEntrega.setCtrc(const Value: Integer);
begin
  _ctrc := Value;
end;

procedure TEntrega.setEntregador(const Value: Integer);
begin
  _entregador := Value;
end;

procedure TEntrega.setExpedicao(const Value: TDateTime);
begin
  _expedicao := Value;
end;

procedure TEntrega.setNF(const Value: String);
begin
  _nf := Value;
end;

procedure TEntrega.setNossoNumero(const Value: String);
begin
  _nossonumero := Value;
end;

procedure TEntrega.setPrevDistribuicao(const Value: TDateTime);
begin
  _prevdistribuicao := Value;
end;

procedure TEntrega.setTelefone(const Value: String);
begin
  _telefone := Value;
end;

procedure TEntrega.setTipoPeso(const Value: String);
begin
  _tipopeso := Value;
end;

procedure TEntrega.setVolumes(const Value: Integer);
begin
  _volumes := Value;
end;

function TEntrega.getBaixado: String;
begin
  Result := _baixado;
end;

function TEntrega.getDataBaixa: TDateTime;
begin
  Result := _databaixa;
end;

function TEntrega.getDataCredito: TDate;
begin
  Result := _datcredito;
end;

function TEntrega.getDataPagamento: TDateTime;
begin
  Result := _datapagamento;
end;

function TEntrega.getDataRecebido: TDate;
begin
  Result := _datarecebido;
end;

function TEntrega.getPago: String;
begin
  Result := _pago;
end;

function TEntrega.getRastreio: String;
begin
  Result := _rastreio;
end;

function TEntrega.getRecebido: String;
begin
  Result := _recebido;
end;

function TEntrega.getRestricao: Integer;
begin
  Result := _restricao;
end;

function TEntrega.getRetorno: String;
begin
  Result := _retorno;
end;

procedure TEntrega.setBaixado(const Value: String);
begin
  _baixado := Value;
end;

procedure TEntrega.setDataBaixa(const Value: TDateTime);
begin
  _databaixa := Value;
end;

procedure TEntrega.setDataCredito(const Value: TDate);
begin
  _datcredito := Value;
end;

procedure TEntrega.setDataPagamento(const Value: TDateTime);
begin
  _datapagamento := Value;
end;

procedure TEntrega.setDataRecebido(const Value: TDate);
begin
  _datarecebido := Value;
end;

procedure TEntrega.setPago(const Value: String);
begin
  _pago := Value;
end;

procedure TEntrega.setRastreio(const Value: String);
begin
  _rastreio := Value;
end;

procedure TEntrega.setRecebido(const Value: String);
begin
  _recebido := Value;
end;

procedure TEntrega.setRestricao(const Value: Integer);
begin
  _restricao := Value;
end;

procedure TEntrega.setRetorno(const Value: String);
begin
  _retorno := Value;
end;

function TEntrega.getAtribuicao: TDateTime;
begin
  Result := _atribuicao;
end;

procedure TEntrega.setAtribuicao(const Value: TDateTime);
begin
  _atribuicao := Value;
end;

function TEntrega.getStatus: Integer;
begin
  Result := _status;
end;

procedure TEntrega.setStatus(const Value: Integer);
begin
  _status := Value;
end;

function TEntrega.getEntrega: TDateTime;
begin
  Result := _entrega;
end;

procedure TEntrega.setEntrega(const Value: TDateTime);
begin
  _entrega := Value;
end;

function TEntrega.getAdvalorem: Double;
begin
  Result := _advalorem;
end;

function TEntrega.getPedido: String;
begin
  Result := _pedido;
end;

function TEntrega.getPesoCobrado: Double;
begin
  Result := _pesocobrado;
end;

function TEntrega.getPesoFranquia: Double;
begin
  Result := _pesofranquia;
end;

function TEntrega.getPesoReal: Double;
begin
  Result := _pesoreal;
end;

function TEntrega.getValorFranquia: Double;
begin
  Result := _valorfranquia;
end;

function TEntrega.getValorProduto: Double;
begin
  REsult := _valorProduto;
end;

function TEntrega.getVerbaDistribuicao: Double;
begin
  Result := _verbadistribuicao;
end;

procedure TEntrega.setAdvalorem(const Value: Double);
begin
  _advalorem := Value;
end;

procedure TEntrega.setPedido(const Value: String);
begin
  _pedido := Value;
end;

procedure TEntrega.setPesoCobrado(const Value: Double);
begin
  _pesocobrado := Value;
end;

procedure TEntrega.setPesoFranquia(const Value: Double);
begin
  _pesofranquia := Value;
end;

procedure TEntrega.setPesoReal(const Value: Double);
begin
  _pesoreal := Value;
end;

procedure TEntrega.setValorFranquia(const Value: Double);
begin
  _valorfranquia := Value;
end;

procedure TEntrega.setValorProduto(const Value: Double);
begin
  _valorProduto := Value;
end;

procedure TEntrega.setVerbaDistribuicao(const Value: Double);
begin
  _verbadistribuicao := Value;
end;

function TEntrega.getFechado: String;
begin
  Result := _fechado;
end;

procedure TEntrega.setFechado(const Value: String);
begin
  _fechado := Value;
end;

procedure TEntrega.setLote(const Value: Integer);
begin
  _lote := Value;
end;

procedure TEntrega.setManifesto(const Value: Integer);
begin
  _manifesto := Value;
end;

function TEntrega.getExtrato: String;
begin
  Result := _extrato;
end;

procedure TEntrega.setExtrato(const Value: String);
begin
  _extrato := Value;
end;

function TEntrega.getVerbaEntregador: Double;
begin
  Result := _verbaentregador;
end;

procedure TEntrega.setVerbaEntregador(const Value: Double);
begin
  _verbaentregador := Value;
end;

function TEntrega.getDiasAtraso: Integer;
begin
  Result := _diasatraso
end;

procedure TEntrega.setDiasAtraso(const Value: Integer);
begin
  _diasatraso := Value;
end;

function TEntrega.getVolumesExtra: Double;
begin
  Result := _volumesextra;
end;

procedure TEntrega.setVolumesExtra(const Value: Double);
begin
  _volumesextra := Value;
end;

function TEntrega.getValorExtra: Double;
begin
  Result := _valextra;
end;

procedure TEntrega.setValorExtra(const Value: Double);
begin
  _valextra := Value;
end;

function TEntrega.ConsolidarExtrato(sInicio: String; sTermino: String;
  sIniAbastecimento: String; sFimAbastecimento: String; sDataPagamento: String;
  sFiltro: String; iTipo: Integer; iCliente: Integer): Boolean;
var
  sSQL: String;
begin
  Result := False;
  sSQL := '';
  dm.qryCalculo.Close;
  dm.qryCalculo.SQL.Clear;
  sSQL := 'SELECT ' +
          'tbentregas.COD_AGENTE, ' +
          '"" AS DES_AGENTE, ' +
          'tbentregas.COD_ENTREGADOR, ' +
          '"" AS DES_ENTREGADOR, ' +
          'SUM(tbentregas.QTD_VOLUMES) AS QTD_VOLUMES, ' +
          'COUNT(tbentregas.NUM_NOSSONUMERO) AS QTD_ENTREGA, ' +
          '0.0 AS VAL_VERBA, ' +
          '0.0 AS VAL_VERBA_TOTAL, ' +
          '0.0 AS VAL_CREDITO, ' +
          '0.0 AS VAL_DEBITO, ' +
          '0.0 AS VAL_RESTRICAO, ' +
          '0.0 AS VAL_SUB_TOTAL, ' +
          'IF(SUM(tbentregas.QTD_VOLUMES) > COUNT(tbentregas.NUM_NOSSONUMERO),((SUM(tbentregas.QTD_VOLUMES) ' +
          '- COUNT(tbentregas.NUM_NOSSONUMERO)) / 2),0) AS QTD_VOLUMES_EXTRA, ' +
          '0.0 AS VAL_VOLUMES_EXTRA, ' +
          '0.0 AS VAL_ABASTECIMENTO, ' +
          '0.0 AS VAL_PERCENTUAL_AGENTE, ' +
          '0.0 AS VAL_PERCENTUAL_ENTREGADOR, '+
          '0.0 AS VAL_TOTAL, ' +
          '0.0 AS VAL_TOTAL_DESCONTOS, ' +
          '0.0 AS VAL_TOTAL_CREDITOS, ' +
          '0.0 AS VAL_TOTAL_GERAL, ' +
          ':DATAINICIO AS DAT_INICIO, ' +
          ':DATATERMINO AS DAT_TERMINO, ' +
          ':INICIOABASTECIMENTO AS DAT_INICIO_ABASTECIMENTO, ' +
          ':TERMINOABASTECIMENTO AS DAT_FINAL_ABASTECIMENTO, ' +
          ':DATAPAGAMENTO AS DAT_PAGO, ' +
          '"0" AS NUM_EXTRATO, ' +
          'SUM(CASE WHEN tbentregas.QTD_DIAS_ATRASO > 0 THEN 1 ELSE 0 END) AS QTD_ATRASOS, ' +
          '0 AS QTD_2_DIAS, '+
          '0 AS QTD_MAIS_DIAS, ' +
          '0 AS COD_CADASTRO,  ' +
          '0 AS COD_GRUPO_DISTRIBUIDOR, ' +
          '0 AS VAL_VERBA_DISTRIBUIDOR, ' +
          '0 AS COD_GRUPO_ENTREGADOR, ' +
          '0 AS VAL_VERBA_ENTREGADOR, ' +
          '0 AS VAL_PERCENTUAL ' +
          'FROM ' + TABLENAME +
          ' WHERE ' +
          'tbentregas.DOM_BAIXADO = :BAIXADO AND tbentregas.DOM_FECHADO <> :FECHADO ';
          if iCliente = 0 then
          begin
            sSQL := sSQL + 'AND tbentregas.COD_CLIENTE <> :CLIENTE AND tbentregas.COD_CLIENTE <> :CLIENTE1 ';
          end
          else
          begin
            sSQL := sSQL + 'AND tbentregas.COD_CLIENTE = :CLIENTE ';
          end;

          if iTipo = 0 then
          begin
            sSQL := sSQL + ' AND DAT_BAIXA BETWEEN :DATAINICIO AND :DATATERMINO '
          end
          else
          begin
            sSQL := sSQL + ' AND DAT_EXPEDICAO BETWEEN :DATAINICIO AND :DATATERMINO '
          end;
          if not sFiltro.IsEmpty then
          begin
            sSQL := sSQL + sFiltro;
          end;
          sSQL := sSQL + 'GROUP BY tbentregas.COD_ENTREGADOR;';
  dm.qryCalculo.SQL.Text := sSQL;
  if sIniAbastecimento.IsEmpty then
  begin
    sIniAbastecimento := sInicio
  end;
  if sFimAbastecimento.IsEmpty then
  begin
    sFimAbastecimento := sTermino
  end;
  dm.qryCalculo.ParamByName('DATAINICIO').AsDate := StrToDate(sInicio);
  dm.qryCalculo.ParamByName('DATATERMINO').AsDate := StrToDate(sTermino);
  dm.qryCalculo.ParamByName('INICIOABASTECIMENTO').AsDate := StrToDate(sIniAbastecimento);
  dm.qryCalculo.ParamByName('TERMINOABASTECIMENTO').AsDate := StrToDate(sFimAbastecimento);
  dm.qryCalculo.ParamByName('DATAPAGAMENTO').AsDate := StrToDate(sDataPagamento);
  dm.qryCalculo.ParamByName('BAIXADO').AsString := 'S';
  dm.qryCalculo.ParamByName('FECHADO').AsString := 'S';
  dm.qryCalculo.ParamByName('CLIENTE').AsInteger := 302;
  if iCliente = 0 then
  begin
    dm.qryCalculo.ParamByName('CLIENTE1').AsInteger := 2;
  end;
  dm.ZConn.PingServer;
  dm.qryCalculo.Open;
  if dm.qryCalculo.IsEmpty then
  begin
    dm.qryCalculo.Close;
    dm.qryCalculo.SQL.Clear;
    Exit;
  end;
  Result := True;
end;

function TEntrega.ConsolidarEntregas(sFiltro: String): Boolean;
var
  sSQL : String;
  iCliente : Integer;
begin
  Result := False;
  iCliente := 0;
  if sFiltro.IsEmpty then
  begin
    Exit;
  end;
  try
    iCliente := Pos('GROUP BY COD_CLIENTE',sFiltro);
    dm.qryCalculo.Close;
    dm.qryCalculo.SQL.Clear;
    sSQL := 'SELECT ' +
            'COD_AGENTE AS COD_DISTRIBUIDOR, ' +
            'COD_ENTREGADOR AS COD_ENTREGADOR, ';
            if iCliente > 0 then
            begin
              sSQL := sSQL + 'COD_CLIENTE AS COD_CLIENTE, ';
            end
            else
            begin
              sSQL := sSQL + '0 AS COD_CLIENTE, ';
            end;
            sSQL := sSQL + 'SUM(QTD_VOLUMES) AS QTD_VOLUMES, ' +
            'COUNT(NUM_NOSSONUMERO) AS QTD_ENTREGA, ' +
            'IF(SUM(QTD_VOLUMES) > COUNT(NUM_NOSSONUMERO),((SUM(QTD_VOLUMES) - COUNT(NUM_NOSSONUMERO)) / 2),0) AS QTD_VOLUMES_EXTRA, ' +
            'SUM(CASE WHEN QTD_DIAS_ATRASO > 0 THEN 1 ELSE 0 END) AS QTD_ATRASOS, ' +
            'SUM(VAL_VERBA_ENTREGADOR) AS VAL_TOTAL_VERBA ' +
            'FROM ' + TABLENAME + ' ';
    sSQL := sSQL + sFiltro;
    dm.qryCalculo.SQL.Text := sSQL;
    dm.ZConn.PingServer;
    dm.qryCalculo.Open;
    if dm.qryCalculo.IsEmpty then
    begin
      dm.qryCalculo.Close;
      dm.qryCalculo.SQL.Clear;
      Exit;
    end;
    dm.qryCalculo.First;
    Result := True;
  finally
    sSQL := '';
  end;
end;

function TEntrega.PesquisaEntregasPeso(sFiltro: String): Boolean;
var
  sSQL : String;
begin
  Result := False;
  if sFiltro.IsEmpty then
  begin
    Exit;
  end;
  try
    dm.qryPesquisa.Close;
    dm.qryPesquisa.SQL.Clear;
    sSQL := 'SELECT * ' +
            'FROM ' + TABLENAME + ' ';
    sSQL := sSQL + sFiltro;
    dm.qryPesquisa.SQL.Text := sSQL;
    dm.ZConn.PingServer;
    dm.qryPesquisa.Open;
    if dm.qryPesquisa.IsEmpty then
    begin
      dm.qryPesquisa.Close;
      dm.qryPesquisa.SQL.Clear;
      Exit;
    end;
    dm.qryPesquisa.First;
    Result := True;
  finally
    sSQL := '';
  end;
end;


end.
