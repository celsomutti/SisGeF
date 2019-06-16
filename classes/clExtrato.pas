unit clExtrato;

interface

uses clConexao;

type
  TExtrato = class(TObject)

  private
    function getCodigoAgente: Integer;
    function getCodigoEntregador: Integer;
    function getCredito: Double;
    function getDataBase: TDateTime;
    function getDataFechado: TDateTime;
    function getDataInicio: TDateTime;
    function getDataPagamento: TDateTime;
    function getDataTermino: TDateTime;
    function getDebito: Double;
    function getEntrega: Integer;
    function getExecutante: String;
    function getFinalAbastecimento: TDateTime;
    function getIncioAbastecimento: TDateTime;
    function getManutencao: TDateTime;
    function getMarcaFechado: String;
    function getMarcaPago: String;
    function getNomeAgente: String;
    function getNomeEntregador: String;
    function getNumeroExtrato: String;
    function getRestricao: Double;
    function getSubTotal: Double;
    function getTotal: Double;
    function getTotalCreditos: Double;
    function getTotalDescontos: Double;
    function getTotalGeral: Double;
    function getValorVolumesExtra: Double;
    function getVerbaTotal: Double;
    function getVolumes: Integer;
    function getVolumesExtra: Double;
    procedure setCodigoAgente(const Value: Integer);
    procedure setCodigoEntregador(const Value: Integer);
    procedure setCredito(const Value: Double);
    procedure setDataBase(const Value: TDateTime);
    procedure setDataFechado(const Value: TDateTime);
    procedure setDataInicio(const Value: TDateTime);
    procedure setDataPagamento(const Value: TDateTime);
    procedure setDataTermino(const Value: TDateTime);
    procedure setDebito(const Value: Double);
    procedure setEntrega(const Value: Integer);
    procedure setExecutante(const Value: String);
    procedure setFinalAbastecimento(const Value: TDateTime);
    procedure setIncioAbastecimento(const Value: TDateTime);
    procedure setManutencao(const Value: TDateTime);
    procedure setMarcaFechado(const Value: String);
    procedure setMarcaPago(const Value: String);
    procedure setNomeAgente(const Value: String);
    procedure setNomeEntregador(const Value: String);
    procedure setNumeroExtrato(const Value: String);
    procedure setRestricao(const Value: Double);
    procedure setSubTotal(const Value: Double);
    procedure setTotal(const Value: Double);
    procedure setTotalCreditos(const Value: Double);
    procedure setTotalDescontos(const Value: Double);
    procedure setTotalGeral(const Value: Double);
    procedure setValorVolumesExtra(const Value: Double);
    procedure setVerbaTotal(const Value: Double);
    procedure setVolumes(const Value: Integer);
    procedure setVolumesExtra(const Value: Double);
    function getValorAbastecimento: Double;
    procedure setValorAbastecimento(const Value: Double);
    function getVerba: Double;
    procedure setVerba(const Value: Double);
    function getDia1: Integer;
    function getDia2: Integer;
    function getDia3: Integer;
    procedure setDia1(const Value: Integer);
    procedure setDia2(const Value: Integer);
    procedure setDia3(const Value: Integer);

    constructor Create;
    destructor Destroy;
    function getTipo: Integer;
    procedure setTipo(const Value: Integer);

  protected
    _tipo: Integer;
    _codigoagente: Integer;
    _nomeagente: String;
    _codigoentregador: Integer;
    _nomeentregador: String;
    _database: TDateTime;
    _numextrato: String;
    _datainicio: TDateTime;
    _datatermino: TDateTime;
    _volumes: Integer;
    _entrega: Integer;
    _verbatotal: Double;
    _credito: Double;
    _debito: Double;
    _restricao: Double;
    _subtotal: Double;
    _qtdvolumesextra: Double;
    _valvolumesextra: Double;
    _total: Double;
    _datapagamento: TDateTime;
    _marcapago: String;
    _valorabastecimento: Double;
    _inicioabastecimento: TDateTime;
    _finalabastecimento: TDateTime;
    _totaldescontos: Double;
    _totalcreditos: Double;
    _totalgeral: Double;
    _marcafechado: String;
    _datafechamento: TDateTime;
    _executante: String;
    _manutencao: TDateTime;
    _verba: Double;
    _1diaatraso: Integer;
    _2diasatraso: Integer;
    _3diasatraso: Integer;
    _conexao: TConexao;
  public
    property Tipo: Integer read getTipo write setTipo;
    property CodigoAgente: Integer read getCodigoAgente write setCodigoAgente;
    property NomeAgente: String read getNomeAgente write setNomeAgente;
    property CodigoEntregador: Integer read getCodigoEntregador write setCodigoEntregador;
    property NomeEntregador: String read getNomeEntregador write setNomeEntregador;
    property DataBase: TDateTime read getDataBase write setDataBase;
    property NumeroExtrato: String read getNumeroExtrato write setNumeroExtrato;
    property DataInicio: TDateTime read getDataInicio write setDataInicio;
    property DataTermino: TDateTime read getDataTermino write setDataTermino;
    property Volumes: Integer read getVolumes write setVolumes;
    property Entrega: Integer read getEntrega write setEntrega;
    property VerbaTotal: Double read getVerbaTotal write setVerbaTotal;
    property Credito: Double read getCredito write setCredito;
    property Debito: Double read getDebito write setDebito;
    property Restricao: Double read getRestricao write setRestricao;
    property SubTotal: Double read getSubTotal write setSubTotal;
    property VolumesExtra: Double read getVolumesExtra write setVolumesExtra;
    property ValorVolumesExtra: Double read getValorVolumesExtra write setValorVolumesExtra;
    property Total: Double read getTotal write setTotal;
    property DataPagamento: TDateTime read getDataPagamento write setDataPagamento;
    property MarcaPago: String read getMarcaPago write setMarcaPago;
    property ValorAbastecimento: Double read getValorAbastecimento write setValorAbastecimento;
    property IncioAbastecimento: TDateTime read getIncioAbastecimento write setIncioAbastecimento;
    property FinalAbastecimento: TDateTime read getFinalAbastecimento write setFinalAbastecimento;
    property TotalDescontos: Double read getTotalDescontos write setTotalDescontos;
    property TotalCreditos: Double read getTotalCreditos write setTotalCreditos;
    property TotalGeral: Double read getTotalGeral write setTotalGeral;
    property MarcaFechado: String read getMarcaFechado write setMarcaFechado;
    property DataFechado: TDateTime read getDataFechado write setDataFechado;
    property Executante: String read getExecutante write setExecutante;
    property Manutencao: TDateTime read getManutencao write setManutencao;
    property Verba: Double read getVerba write setVerba;
    property Dia1: Integer read getDia1 write setDia1;
    property Dia2: Integer read getDia2 write setDia2;
    property Dia3: Integer read getDia3 write setDia3;
    function Validar(): Boolean;
    function Delete(filtro: String): Boolean;
    function getObject(id, filtro: String): Boolean;
    function Insert(): Boolean;
    function Update(): Boolean;
    function getField(campo, coluna: String): String;
    function Periodo(sdtInicial, sdtFinal, sAgente, sTipo, sScopo: String): Boolean;

    procedure GeraNumero;

  end;

const
  TABLENAME = 'tbextratos';

implementation

uses SysUtils, Dialogs, udm, clUtil, ZDataset, ZAbstractRODataset, DB,
  DateUtils;

{ TExtrato }

constructor TExtrato.Create;
begin
  _conexao := TConexao.Create;
  if (not _conexao.VerifyConnZEOS(0)) then
  begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
      Self.ClassName + ') !', mtError, [mbCancel], 0);
  end;
end;

destructor TExtrato.Destroy;
begin
  _conexao.Free;
end;

function TExtrato.getCodigoAgente: Integer;
begin
  Result := _codigoagente;
end;

function TExtrato.getCodigoEntregador: Integer;
begin
  Result := _codigoentregador;
end;

function TExtrato.getCredito: Double;
begin
  Result := _credito;
end;

function TExtrato.getDataBase: TDateTime;
begin
  Result := _database;
end;

function TExtrato.getDataFechado: TDateTime;
begin
  Result := _datafechamento;
end;

function TExtrato.getDataInicio: TDateTime;
begin
  Result := _datainicio;
end;

function TExtrato.getDataPagamento: TDateTime;
begin
  Result := _datapagamento;
end;

function TExtrato.getDataTermino: TDateTime;
begin
  Result := _datatermino;
end;

function TExtrato.getDebito: Double;
begin
  Result := _debito;
end;

function TExtrato.getEntrega: Integer;
begin
  Result := _entrega;
end;

function TExtrato.getExecutante: String;
begin
  Result := _executante;
end;

function TExtrato.getFinalAbastecimento: TDateTime;
begin
  Result := _finalabastecimento;
end;

function TExtrato.getIncioAbastecimento: TDateTime;
begin
  Result := _inicioabastecimento;
end;

function TExtrato.getManutencao: TDateTime;
begin
  Result := _manutencao;
end;

function TExtrato.getMarcaFechado: String;
begin
  Result := _marcafechado;
end;

function TExtrato.getMarcaPago: String;
begin
  Result := _marcapago;
end;

function TExtrato.getNomeAgente: String;
begin
  Result := _nomeagente;
end;

function TExtrato.getNomeEntregador: String;
begin
  Result := _nomeentregador;
end;

function TExtrato.getNumeroExtrato: String;
begin
  Result := _numextrato;
end;

function TExtrato.getRestricao: Double;
begin
  Result := _restricao;
end;

function TExtrato.getSubTotal: Double;
begin
  Result := _subtotal;
end;

function TExtrato.getTipo: Integer;
begin
  Result := _tipo;
end;

function TExtrato.getTotal: Double;
begin
  Result := _total;
end;

function TExtrato.getTotalCreditos: Double;
begin
  Result := _totalcreditos
end;

function TExtrato.getTotalDescontos: Double;
begin
  Result := _totaldescontos;
end;

function TExtrato.getTotalGeral: Double;
begin
  Result := _totalgeral;
end;

function TExtrato.getValorVolumesExtra: Double;
begin
  Result := _valvolumesextra;
end;

function TExtrato.getVerbaTotal: Double;
begin
  Result := _verbatotal;
end;

function TExtrato.getVolumes: Integer;
begin
  Result := _volumes;
end;

function TExtrato.getVolumesExtra: Double;
begin
  Result := _qtdvolumesextra;
end;

function TExtrato.Validar(): Boolean;
begin
  try
    Result := False;
    if Self.CodigoAgente = 0 then
    begin
      MessageDlg('Informe o Código do Agente!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if Self.CodigoEntregador = 0 then
    begin
      MessageDlg('Informe o Código do Entregador!', mtWarning, [mbOK], 0);
      Exit;
    end;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TExtrato.Delete(filtro: String): Boolean;
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
        ParamByName('AGENTE').AsInteger := Self.CodigoAgente;
      end
      else if filtro = 'ENTREGADOR' then
      begin
        SQL.Add('WHERE COD_ENTREGADOR = :ENTREGADOR');
        ParamByName('ENTREGADOR').AsInteger := Self.CodigoEntregador;
      end
      else if filtro = 'EXTRATO' then
      begin
        SQL.Add(' WHERE NUM_EXTRATO = :NUMEROEXTRATO ');
        ParamByName('NUMEROEXTRATO').AsString := Self.NumeroExtrato;
      end
      else if filtro = 'BASE' then
      begin
        SQL.Add('WHERE DAT_BASE = :BASE');
        ParamByName('BASE').AsDate := Self.DataBase;
      end
      else if filtro = 'BASE1' then
      begin
        SQL.Add('WHERE COD_AGENTE = :AGENTE AND COD_ENTREGADOR = :ENTREGADOR AND DAT_BASE = :BASE');
        ParamByName('AGENTE').AsInteger := Self.CodigoAgente;
        ParamByName('ENTREGADOR').AsInteger := Self.CodigoEntregador;
        ParamByName('BASE').AsDate := Self.DataBase;
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

function TExtrato.getObject(id, filtro: String): Boolean;
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
        SQL.Add('WHERE COD_AGENTE = :AGENTE');
        ParamByName('AGENTE').AsInteger := StrToInt(id);
      end
      else if filtro = 'ENTREGADOR' then
      begin
        SQL.Add('WHERE COD_ENTREGADOR = :ENTREGADOR');
        ParamByName('ENTREGADOR').AsInteger := StrToInt(id);
      end
      else if filtro = 'EXTRATO' then
      begin
        SQL.Add(' WHERE NUM_EXTRATO = :NUMEROEXTRATO ');
        ParamByName('NUMEROEXTRATO').AsString := id;
      end
      else if filtro = 'BASE' then
      begin
        SQL.Add('WHERE DAT_BASE = :BASE');
        ParamByName('BASE').AsDate := StrToDate(id);
      end;
      dm.ZConn.PingServer;
      Open;
      if not IsEmpty then
        First;
    end;

    if dm.QryGetObject.RecordCount > 0 then
    begin
      Self.Tipo := dm.QryGetObject.FieldByName('COD_TIPO').AsInteger;
      Self.CodigoAgente := dm.QryGetObject.FieldByName('COD_AGENTE').AsInteger;
      Self.NomeAgente := dm.QryGetObject.FieldByName('DES_AGENTE').AsString;
      Self.CodigoEntregador := dm.QryGetObject.FieldByName('COD_ENTREGADOR').AsInteger;
      Self.NomeEntregador := dm.QryGetObject.FieldByName('DES_ENTREGADOR').AsString;
      Self.DataBase := dm.QryGetObject.FieldByName('DAT_BASE').AsDateTime;
      Self.NumeroExtrato := dm.QryGetObject.FieldByName('NUM_EXTRATO').AsString;
      Self.DataInicio := dm.QryGetObject.FieldByName('DAT_INICIO').AsDateTime;
      Self.DataTermino := dm.QryGetObject.FieldByName('DAT_TERMINO').AsDateTime;
      Self.Volumes := dm.QryGetObject.FieldByName('QTD_VOLUMES').AsInteger;
      Self.Entrega := dm.QryGetObject.FieldByName('QTD_ENTREGA').AsInteger;
      Self.VerbaTotal := dm.QryGetObject.FieldByName('VAL_VERBA_TOTAL').AsFloat;
      Self.Verba := dm.QryGetObject.FieldByName('VAL_VERBA').AsFloat;
      Self.Credito := dm.QryGetObject.FieldByName('VAL_CREDITO').AsFloat;
      Self.Debito := dm.QryGetObject.FieldByName('VAL_DEBITO').AsFloat;
      Self.Restricao := dm.QryGetObject.FieldByName('VAL_RESTRICAO').AsFloat;
      Self.SubTotal := dm.QryGetObject.FieldByName('VAL_SUB_TOTAL').AsFloat;
      Self.VolumesExtra := dm.QryGetObject.FieldByName('QTD_VOLUMES_EXTRA').AsInteger;
      Self.ValorVolumesExtra := dm.QryGetObject.FieldByName('VAL_VOLUMES_EXTRA').AsFloat;
      Self.Total := dm.QryGetObject.FieldByName('VAL_TOTAL').AsFloat;
      Self.DataPagamento := dm.QryGetObject.FieldByName('DAT_PAGO').AsDateTime;
      Self.MarcaPago := dm.QryGetObject.FieldByName('DOM_PAGO').AsString;
      Self.ValorAbastecimento := dm.QryGetObject.FieldByName('VAL_ABASTECIMENTO').AsFloat;
      Self.IncioAbastecimento := dm.QryGetObject.FieldByName('DAT_INICIO_ABASTECIMENTO').AsDateTime;
      Self.FinalAbastecimento := dm.QryGetObject.FieldByName('DAT_FINAL_ABASTECIMENTO').AsDateTime;
      Self.TotalDescontos := dm.QryGetObject.FieldByName('VAL_TOTAL_DESCONTOS').AsFloat;
      Self.TotalCreditos := dm.QryGetObject.FieldByName('VAL_TOTAL_CREDITOS').AsFloat;
      Self.TotalGeral := dm.QryGetObject.FieldByName('VAL_TOTAL_GERAL').AsFloat;
      Self.MarcaFechado := dm.QryGetObject.FieldByName('DOM_FECHADO').AsString;
      Self.DataFechado := dm.QryGetObject.FieldByName('DAT_FECHAMENTO').AsDateTime;
      Self.Executante := dm.QryGetObject.FieldByName('NOM_EXECUTANTE').AsString;
      Self.Manutencao := dm.QryGetObject.FieldByName('DAT_MANUTENCAO').AsDateTime;
      Self.Dia1 := dm.QryGetObject.FieldByName('QTD_1_DIA').AsInteger;
      Self.Dia2 := dm.QryGetObject.FieldByName('QTD_2_DIAS').AsInteger;
      Self.Dia3 := dm.QryGetObject.FieldByName('QTD_MAIS_DIAS').AsInteger;
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

function TExtrato.Insert(): Boolean;
begin
  try
    Result := False;

    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'INSERT INTO ' + TABLENAME + '(' + 'COD_TIPO, ' +'COD_AGENTE, ' +
        'DES_AGENTE, ' + 'COD_ENTREGADOR, ' + 'DES_ENTREGADOR, ' + 'DAT_BASE, '
        + 'NUM_EXTRATO, ' + 'DAT_INICIO, ' + 'DAT_TERMINO, ' + 'QTD_VOLUMES, ' +
        'QTD_ENTREGA, ' + 'VAL_VERBA, ' + 'VAL_VERBA_TOTAL, ' + 'VAL_CREDITO, '
        + 'VAL_DEBITO, ' + 'VAL_RESTRICAO, ' + 'VAL_SUB_TOTAL, ' +
        'QTD_VOLUMES_EXTRA, ' + 'VAL_VOLUMES_EXTRA, ' + 'VAL_TOTAL, ' +
        'DAT_PAGO, ' + 'DOM_PAGO, ' + 'VAL_ABASTECIMENTO, ' +
        'DAT_INICIO_ABASTECIMENTO, ' + 'DAT_FINAL_ABASTECIMENTO, ' +
        'VAL_TOTAL_DESCONTOS, ' + 'VAL_TOTAL_CREDITOS, ' + 'VAL_TOTAL_GERAL, ' +
        'DOM_FECHADO, ' + 'DAT_FECHAMENTO, ' + 'NOM_EXECUTANTE, ' +
        'DAT_MANUTENCAO, ' + 'QTD_1_DIA, ' + 'QTD_2_DIAS, ' + 'QTD_MAIS_DIAS) '
        + 'VALUES (' + ':TIPO, ' + ':CODAGENTE, ' + ':NOMEAGENTE, ' + ':CODENTREGADOR, ' +
        ':NOMEENTREGADOR, ' + ':BASE, ' + ':NUMEROEXTRATO, ' + ':INICIO, ' +
        ':TERMINO, ' + ':VOLUMES, ' + ':ENTREGA, ' + ':VERBA, ' +
        ':VERBATOTAL, ' + ':CREDITO, ' + ':DEBITO, ' + ':RESTRICAO, ' +
        ':SUBTOTAL, ' + ':VOLUMESEXTRA, ' + ':VALOREXTRA, ' + ':TOTAL, ' +
        ':PAGAMENTO, ' + ':PAGO, ' + ':VALORABASTECIMENTO, ' +
        ':INICIOABASTECIMENTO, ' + ':FINALABASTECIMENTO, ' + ':TOTALDESCONTOS, '
        + ':TOTALCREDITOS, ' + ':TOTALGERAL, ' + ':FECHADO, ' + ':FECHAMENTO, '
        + ':EXECUTANTE, ' + ':MANUTENCAO, ' + ':DIA1, ' + ':DIA2, ' + ':DIA3)';

      GeraNumero;
      ParamByName('TIPO').AsInteger := Self.Tipo;
      ParamByName('CODAGENTE').AsInteger := Self.CodigoAgente;
      ParamByName('NOMEAGENTE').AsString := Self.NomeAgente;
      ParamByName('CODENTREGADOR').AsInteger := Self.CodigoEntregador;
      ParamByName('NOMEENTREGADOR').AsString := Self.NomeEntregador;
      ParamByName('BASE').AsDate := Self.DataBase;
      ParamByName('NUMEROEXTRATO').AsString := Self.NumeroExtrato;
      ParamByName('INICIO').AsDate := Self.DataInicio;
      ParamByName('TERMINO').AsDate := Self.DataTermino;
      ParamByName('VOLUMES').AsInteger := Self.Volumes;
      ParamByName('ENTREGA').AsInteger := Self.Entrega;
      ParamByName('VERBA').AsFloat := Self.Verba;
      ParamByName('VERBATOTAL').AsFloat := Self.VerbaTotal;
      ParamByName('CREDITO').AsFloat := Self.Credito;
      ParamByName('DEBITO').AsFloat := Self.Debito;
      ParamByName('RESTRICAO').AsFloat := Self.Restricao;
      ParamByName('SUBTOTAL').AsFloat := Self.SubTotal;
      ParamByName('VOLUMESEXTRA').AsFloat := Self.VolumesExtra;
      ParamByName('VALOREXTRA').AsFloat := Self.ValorVolumesExtra;
      ParamByName('TOTAL').AsFloat := Self.Total;
      ParamByName('PAGAMENTO').AsDate := Self.DataPagamento;
      ParamByName('PAGO').AsString := Self.MarcaPago;
      ParamByName('VALORABASTECIMENTO').AsFloat := Self.ValorAbastecimento;
      ParamByName('INICIOABASTECIMENTO').AsDate := Self.IncioAbastecimento;
      ParamByName('FINALABASTECIMENTO').AsDate := Self.FinalAbastecimento;
      ParamByName('TOTALDESCONTOS').AsFloat := Self.TotalDescontos;
      ParamByName('TOTALCREDITOS').AsFloat := Self.TotalCreditos;
      ParamByName('TOTALGERAL').AsFloat := Self.TotalGeral;
      ParamByName('FECHADO').AsString := Self.MarcaFechado;
      ParamByName('FECHAMENTO').AsDate := Self.DataFechado;
      ParamByName('EXECUTANTE').AsString := Self.Executante;
      ParamByName('MANUTENCAO').AsDateTime := Self.Manutencao;
      ParamByName('DIA1').AsInteger := Self.Dia1;
      ParamByName('DIA2').AsInteger := Self.Dia2;
      ParamByName('DIA3').AsInteger := Self.Dia3;
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

function TExtrato.Update(): Boolean;
begin
  try
    Result := False;

    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'UPDATE ' + TABLENAME + ' SET ' +
        'DES_AGENTE := :NOMEAGENTE, ' + 'DES_ENTREGADOR := :NOMEENTREGADOR, ' +
        'NUM_EXTRATO := :NUMEROEXTRATO, ' + 'DAT_INICIO := :INICIO, ' +
        'DAT_TERMINO := :TERMINO, ' + 'QTD_VOLUMES := :VOLUMES, ' +
        'QTD_ENTREGA := :ENTREGA, ' + 'VAL_VERBA_TOTAL := :VERBATOTAL, ' +
        'VAL_VERBA := :VERBA, ' + 'VAL_CREDITO := :CREDITO, ' +
        'VAL_DEBITO := :DEBITO, ' + 'VAL_RESTRICAO := :RESTRICAO, ' +
        'VAL_SUB_TOTAL := :SUBTOTAL, ' + 'QTD_VOLUMES_EXTRA := :VOLUMESEXTRA, '
        + 'VAL_VOLUMES_EXTRA := :VALOREXTRA, ' + 'VAL_TOTAL := :TOTAL, ' +
        'DAT_PAGO := :PAGAMENTO, ' + 'DOM_PAGO := :PAGO, ' +
        'VAL_ABASTECIMENTO = :VALORABASTECIMENTO, ' +
        'DAT_INICIO_ABASTECIMENTO := :INICIOABASTECIMENTO, ' +
        'DAT_FINAL_ABASTECIMENTO := :FINALABASTECIMENTO, ' +
        'VAL_TOTAL_DESCONTOS := :TOTALDESCONTOS, ' +
        'VAL_TOTAL_CREDITOS := :TOTALCREDITOS, ' +
        'VAL_TOTAL_GERAL := :TOTALGERAL, ' + 'DOM_FECHADO := :FECHADO, ' +
        'DAT_FECHAMENTO := :FECHAMENTO, ' + 'NOM_EXECUTANTE := :EXECUTANTE, ' +
        'DAT_MANUTENCAO  :=  :MANUTENCAO, ' + 'QTD_1_DIA = :DIA1, ' +
        'QTD_2_DIAS = :DIA2, ' + 'QTD_MAIS_DIAS = :DIA3 ' + 'WHERE ' +
        'COD_AGENTE = :CODAGENTE AND ' + 'COD_ENTREGADOR = :CODENTREGADOR AND '
        + 'DAT_BASE = :BASE AND ' + 'COD_TIPO = :TIPO';

      ParamByName('TIPO').AsInteger := Self.Tipo;
      ParamByName('CODAGENTE').AsInteger := Self.CodigoAgente;
      ParamByName('NOMEAGENTE').AsString := Self.NomeAgente;
      ParamByName('CODENTREGADOR').AsInteger := Self.CodigoEntregador;
      ParamByName('NOMEENTREGADOR').AsString := Self.NomeEntregador;
      ParamByName('BASE').AsDate := Self.DataBase;
      ParamByName('NUMEROEXTRATO').AsString := Self.NumeroExtrato;
      ParamByName('INICIO').AsDate := Self.DataInicio;
      ParamByName('TERMINO').AsDate := Self.DataTermino;
      ParamByName('VOLUMES').AsInteger := Self.Volumes;
      ParamByName('ENTREGA').AsInteger := Self.Entrega;
      ParamByName('VERBA').AsFloat := Self.Verba;
      ParamByName('VERBATOTAL').AsFloat := Self.VerbaTotal;
      ParamByName('CREDITO').AsFloat := Self.Credito;
      ParamByName('DEBITO').AsFloat := Self.Debito;
      ParamByName('RESTRICAO').AsFloat := Self.Restricao;
      ParamByName('SUBTOTAL').AsFloat := Self.SubTotal;
      ParamByName('VOLUMESEXTRA').AsFloat := Self.VolumesExtra;
      ParamByName('VALOREXTRA').AsFloat := Self.ValorVolumesExtra;
      ParamByName('TOTAL').AsFloat := Self.Total;
      ParamByName('PAGAMENTO').AsDate := Self.DataPagamento;
      ParamByName('PAGO').AsString := Self.MarcaPago;
      ParamByName('VALORABASTECIMENTO').AsFloat := Self.ValorAbastecimento;
      ParamByName('INICIOABASTECIMENTO').AsDate := Self.IncioAbastecimento;
      ParamByName('FINALABASTECIMENTO').AsDate := Self.FinalAbastecimento;
      ParamByName('TOTALDESCONTOS').AsFloat := Self.TotalDescontos;
      ParamByName('TOTALCREDITOS').AsFloat := Self.TotalCreditos;
      ParamByName('TOTALGERAL').AsFloat := Self.TotalGeral;
      ParamByName('FECHADO').AsString := Self.MarcaFechado;
      ParamByName('FECHAMENTO').AsDate := Self.DataFechado;
      ParamByName('EXECUTANTE').AsString := Self.Executante;
      ParamByName('MANUTENCAO').AsDateTime := Self.Manutencao;
      ParamByName('DIA1').AsInteger := Self.Dia1;
      ParamByName('DIA2').AsInteger := Self.Dia2;
      ParamByName('DIA3').AsInteger := Self.Dia3;
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

function TExtrato.getField(campo, coluna: String): String;
begin
  try
    Result := '';

    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT ' + campo + ' FROM ' + TABLENAME;

      if coluna = 'AGENTE' then
      begin
        SQL.Add(' WHERE COD_AGENTE =:AGENTE ');
        ParamByName('AGENTE').AsInteger := Self.CodigoAgente;
      end
      else if coluna = 'ENTREGADOR' then
      begin
        SQL.Add(' WHERE COD_AGENTE =:AGENTE AND COD_ENTREGADOR = :ENTREGADOR ');
        ParamByName('AGENTE').AsInteger := Self.CodigoAgente;
        ParamByName('ENTREGADOR').AsInteger := Self.CodigoEntregador;
      end
      else if coluna = 'BASE' then
      begin
        SQL.Add(' WHERE COD_AGENTE =:AGENTE AND COD_ENTREGADOR = :ENTREGADOR AND DAT_BASE = :BASE');
        ParamByName('AGENTE').AsInteger := Self.CodigoAgente;
        ParamByName('ENTREGADOR').AsInteger := Self.CodigoEntregador;
        ParamByName('BASE').AsDate := Self.DataBase;
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

function TExtrato.Periodo(sdtInicial, sdtFinal, sAgente, sTipo,
  sScopo: String): Boolean;
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
      if sTipo = 'DATA' then
      begin
        SQL.Add(' WHERE DAT_INICIO = :INICIO AND DAT_TERMINO = :TERMINO');
        ParamByName('INICIO').AsDate := StrToDate(sdtInicial);
        ParamByName('TERMINO').AsDate := StrToDate(sdtFinal);
      end
      else if sTipo = 'PAGAMENTO' then
      begin
        SQL.Add(' WHERE DAT_PAGO BETWEEN :INICIO AND :TERMINO');
        ParamByName('INICIO').AsDate := StrToDate(sdtInicial);
        ParamByName('TERMINO').AsDate := StrToDate(sdtFinal);
      end;
      if sScopo = 'A' then
      begin
        if not(TUtil.Empty(sAgente)) then
        begin
          SQL.Add(' AND COD_AGENTE = :AGENTE');
          ParamByName('AGENTE').AsInteger := StrToInt(sAgente);
        end;
      end
      else
      begin
        if not(TUtil.Empty(sAgente)) then
        begin
          SQL.Add(' AND COD_ENTREGADOR = :ENTREGADOR');
          ParamByName('ENTREGADOR').AsInteger := StrToInt(sAgente);
        end;
      end;
      dm.ZConn.PingServer;
      Open;
      if not IsEmpty then
        First
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

procedure TExtrato.GeraNumero;
var
  sNumero: String;
begin
  try

    sNumero := IntToStr(YearOf(Self.DataPagamento)) +
      Format('%3.3d', [DayOfTheYear(Self.DataPagamento)]) +
      Format('%6.6d', [Self.CodigoAgente]);

    Self.NumeroExtrato := sNumero;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

procedure TExtrato.setCodigoAgente(const Value: Integer);
begin
  _codigoagente := Value;
end;

procedure TExtrato.setCodigoEntregador(const Value: Integer);
begin
  _codigoentregador := Value;
end;

procedure TExtrato.setCredito(const Value: Double);
begin
  _credito := Value;
end;

procedure TExtrato.setDataBase(const Value: TDateTime);
begin
  _database := Value;
end;

procedure TExtrato.setDataFechado(const Value: TDateTime);
begin
  _datafechamento := Value;
end;

procedure TExtrato.setDataInicio(const Value: TDateTime);
begin
  _datainicio := Value;
end;

procedure TExtrato.setDataPagamento(const Value: TDateTime);
begin
  _datapagamento := Value;
end;

procedure TExtrato.setDataTermino(const Value: TDateTime);
begin
  _datatermino := Value;
end;

procedure TExtrato.setDebito(const Value: Double);
begin
  _debito := Value;
end;

procedure TExtrato.setEntrega(const Value: Integer);
begin
  _entrega := Value;
end;

procedure TExtrato.setExecutante(const Value: String);
begin
  _executante := Value;
end;

procedure TExtrato.setFinalAbastecimento(const Value: TDateTime);
begin
  _finalabastecimento := Value;
end;

procedure TExtrato.setIncioAbastecimento(const Value: TDateTime);
begin
  _inicioabastecimento := Value;
end;

procedure TExtrato.setManutencao(const Value: TDateTime);
begin
  _manutencao := Value;
end;

procedure TExtrato.setMarcaFechado(const Value: String);
begin
  _marcafechado := Value;
end;

procedure TExtrato.setMarcaPago(const Value: String);
begin
  _marcapago := Value;
end;

procedure TExtrato.setNomeAgente(const Value: String);
begin
  _nomeagente := Value;
end;

procedure TExtrato.setNomeEntregador(const Value: String);
begin
  _nomeentregador := Value;
end;

procedure TExtrato.setNumeroExtrato(const Value: String);
begin
  _numextrato := Value;
end;

procedure TExtrato.setRestricao(const Value: Double);
begin
  _restricao := Value;
end;

procedure TExtrato.setSubTotal(const Value: Double);
begin
  _subtotal := Value;
end;

procedure TExtrato.setTipo(const Value: Integer);
begin
  _tipo := Value;
end;

procedure TExtrato.setTotal(const Value: Double);
begin
  _total := Value;
end;

procedure TExtrato.setTotalCreditos(const Value: Double);
begin
  _totalcreditos := Value;
end;

procedure TExtrato.setTotalDescontos(const Value: Double);
begin
  _totaldescontos := Value;
end;

procedure TExtrato.setTotalGeral(const Value: Double);
begin
  _totalgeral := Value;
end;

procedure TExtrato.setValorVolumesExtra(const Value: Double);
begin
  _valvolumesextra := Value;
end;

procedure TExtrato.setVerbaTotal(const Value: Double);
begin
  _verbatotal := Value;
end;

procedure TExtrato.setVolumes(const Value: Integer);
begin
  _volumes := Value;
end;

procedure TExtrato.setVolumesExtra(const Value: Double);
begin
  _qtdvolumesextra := Value;
end;

function TExtrato.getValorAbastecimento: Double;
begin
  Result := _valorabastecimento;
end;

procedure TExtrato.setValorAbastecimento(const Value: Double);
begin
  _valorabastecimento := Value;
end;

function TExtrato.getVerba: Double;
begin
  Result := _verba;
end;

procedure TExtrato.setVerba(const Value: Double);
begin
  _verba := Value;
end;

function TExtrato.getDia1: Integer;
begin
  Result := _1diaatraso;
end;

function TExtrato.getDia2: Integer;
begin
  Result := _2diasatraso;
end;

function TExtrato.getDia3: Integer;
begin
  Result := _3diasatraso;
end;

procedure TExtrato.setDia1(const Value: Integer);
begin
  _1diaatraso := Value;
end;

procedure TExtrato.setDia2(const Value: Integer);
begin
  _2diasatraso := Value;
end;

procedure TExtrato.setDia3(const Value: Integer);
begin
  _3diasatraso := Value;
end;

end.
