unit DAO.Entregas;

interface

uses DAO.Base, Model.Entregas, Generics.Collections, System.Classes;

type
  TEntregasDAO = class(TDAO)
  public
    function Insert(aEntregas: Model.Entregas.Tentregas): Boolean;
    function Update(aEntregas: Model.Entregas.TEntregas): Boolean;
    function Delete(sNN: String): Boolean;
    function FindEntrega(sFiltro: String; aParam: array of Variant): TObjectList<Model.Entregas.TEntregas>;
    function FindEntregaLote(aParam: array of Variant): TObjectList<Model.Entregas.TEntregas>;
    function FindEntregaMovimento(aParam: array of Variant): TObjectList<Model.Entregas.TEntregas>;
    function FindEntregaNN(aParam: array of Variant): TObjectList<Model.Entregas.TEntregas>;
    function ChangeConferencia(sNN: String; iStatus: Integer): Boolean;
    function FindEntregasFechamento(aParam: array of Variant): TObjectList<Model.Entregas.TEntregas>;
end;
const
  TABLENAME = 'tbentregas';

implementation

uses System.SysUtils, FireDAC.Comp.Client, Data.DB;

function TEntregasDAO.Insert(aEntregas: TEntregas): Boolean;
var
  sSQL : System.string;
begin
  Result := False;
  //aEntregas.ID := GetKeyValue(TABLENAME,'ID_ENTREGA');
  sSQL := 'INSERT INTO ' + TABLENAME +
          '(NUM_NOSSONUMERO, COD_AGENTE, COD_ENTREGADOR, COD_CLIENTE, NUM_NF, NOM_CONSUMIDOR, DES_ENDERECO, DES_COMPLEMENTO, ' +
          'DES_BAIRRO, NOM_CIDADE, NUM_CEP, NUM_TELEFONE, DAT_EXPEDICAO, DAT_PREV_DISTRIBUICAO, QTD_VOLUMES, DAT_ATRIBUICAO, ' +
          'DAT_BAIXA, DOM_BAIXADO, DAT_PAGAMENTO, DOM_PAGO, DOM_FECHADO, COD_STATUS, DAT_ENTREGA, QTD_PESO_REAL, ' +
          'QTD_PESO_FRANQUIA, VAL_VERBA_FRANQUIA, VAL_ADVALOREM, VAL_PAGO_FRANQUIA, VAL_VERBA_ENTREGADOR, NUM_EXTRATO, ' +
          'QTD_DIAS_ATRASO, QTD_VOLUMES_EXTRA, VAL_VOLUMES_EXTRA, QTD_PESO_COBRADO, DES_TIPO_PESO, DAT_RECEBIDO, DOM_RECEBIDO, ' +
          'NUM_CTRC, NUM_MANIFESTO, DES_RASTREIO, NUM_LOTE_REMESSA, DES_RETORNO, DAT_CREDITO, DOM_CREDITO, NUM_CONTAINER, ' +
          'VAL_PRODUTO, QTD_ALTURA, QTD_LARGURA, QTD_COMPRIMENTO, COD_FEEDBACK, DAT_FEEDBACK, DOM_CONFERIDO) ' +
          'VALUES ' +
          '(:NUM_NOSSONUMERO, :COD_AGENTE, :COD_ENTREGADOR, :COD_CLIENTE, :NUM_NF, :NOM_CONSUMIDOR, :DES_ENDERECO, ' +
          ':DES_COMPLEMENTO, :DES_BAIRRO, :NOM_CIDADE, :NUM_CEP, :NUM_TELEFONE, :DAT_EXPEDICAO, :DAT_PREV_DISTRIBUICAO, ' +
          ':QTD_VOLUMES, :DAT_ATRIBUICAO, :DAT_BAIXA, :DOM_BAIXADO, :DAT_PAGAMENTO, :DOM_PAGO, :DOM_FECHADO, :COD_STATUS, ' +
          ':DAT_ENTREGA, :QTD_PESO_REAL, :QTD_PESO_FRANQUIA, :VAL_VERBA_FRANQUIA, :VAL_ADVALOREM, :VAL_PAGO_FRANQUIA, ' +
          ':VAL_VERBA_ENTREGADOR, :NUM_EXTRATO, :QTD_DIAS_ATRASO, :QTD_VOLUMES_EXTRA, :VAL_VOLUMES_EXTRA, :QTD_PESO_COBRADO, ' +
          ':DES_TIPO_PESO, :DAT_RECEBIDO, :DOM_RECEBIDO, :NUM_CTRC, :NUM_MANIFESTO, :DES_RASTREIO, :NUM_LOTE_REMESSA, ' +
          ':DES_RETORNO, :DAT_CREDITO, :DOM_CREDITO, :NUM_CONTAINER, :VAL_PRODUTO, :QTD_ALTURA, :QTD_LARGURA, :QTD_COMPRIMENTO' +
          ':COD_FEEDBACK, :DAT_FEEDBACK, :DOM_CONFERIDO);';

  Connection.ExecSQL(sSQL,[aEntregas.NN, aEntregas.Distribuidor, aEntregas.Entregador, aEntregas.Cliente,
                           aEntregas.NF, aEntregas.Consumidor, aEntregas.Endereco, aEntregas.Complemento, aEntregas.Bairro,
                           aEntregas.Cidade, aEntregas.CEP, aEntregas.Telefone, aEntregas.Expedicao, aEntregas.Previsao,
                           aEntregas.Volumes, aEntregas.Atribuicao, aEntregas.Baixa, aEntregas.Baixado, aEntregas.Pagamento,
                           aEntregas.Pago, aEntregas.Fechado, aEntregas.Status, aEntregas.Entrega, aEntregas.PesoReal,
                           aEntregas.PesoFranquia, aEntregas.VerbaFranquia, aEntregas.Advalorem, aEntregas.PagoFranquia,
                           aEntregas.VerbaEntregador, aEntregas.Extrato, aEntregas.Atraso, aEntregas.VolumesExtra,
                           aEntregas.ValorVolumes, aEntregas.PesoCobrado, aEntregas.TipoPeso, aEntregas.Recebimento,
                           aEntregas.Recebido, aEntregas.CTRC, aEntregas.Manifesto, aEntregas.Rastreio, aEntregas.Lote,
                           aEntregas.Retorno, aEntregas.Credito, aEntregas.Creditado, aEntregas.Container, aEntregas.ValorProduto,
                           aEntregas.Altura, aEntregas.Largura, aEntregas.Comprimento, aEntregas.CodigoFeedback,
                           aEntregas.DataFeedback, aEntregas.Conferido],
                          [ftString, ftInteger, ftInteger, ftInteger,
                          ftString, ftString, ftString, ftString, ftString,
                          ftString, ftString, ftString, ftDate, ftDate,
                          ftInteger, ftDate, ftDate, ftString, ftDate,
                          ftString, ftString, ftInteger, ftDate, ftFloat,
                          ftFloat, ftFloat, ftFloat, ftFloat,
                          ftFloat, ftString, ftInteger, ftFloat,
                          ftFloat, ftFloat, ftString, ftDate,
                          ftString, ftInteger, ftInteger, ftString, ftInteger,
                          ftString, ftDate, ftString, ftString, ftFloat,
                          ftInteger, ftInteger, ftInteger, ftInteger, ftDateTime, ftInteger]);
  Result := True;
end;

function TEntregasDAO.Update(aEntregas: TEntregas): Boolean;
var
  sSQL: System.string;
begin
  Result := False;
  sSQL := 'UPDATE ' + TABLENAME + ' ' +
          'SET ' +
          'COD_AGENTE = :COD_AGENTE, COD_ENTREGADOR = :COD_ENTREGADOR, ' +
          'COD_CLIENTE = :COD_CLIENTE, NUM_NF = :NUM_NF, NOM_CONSUMIDOR = :NOM_CONSUMIDOR, DES_ENDERECO = :DES_ENDERECO, ' +
          'DES_COMPLEMENTO = :DES_COMPLEMENTO, DES_BAIRRO = :DES_BAIRRO, NOM_CIDADE = :NOM_CIDADE, NUM_CEP = :NUM_CEP, ' +
          'NUM_TELEFONE = :NUM_TELEFONE, DAT_EXPEDICAO = :DAT_EXPEDICAO, DAT_PREV_DISTRIBUICAO = :DAT_PREV_DISTRIBUICAO, ' +
          'QTD_VOLUMES = :QTD_VOLUMES, DAT_ATRIBUICAO = :DAT_ATRIBUICAO, DAT_BAIXA = :DAT_BAIXA, DOM_BAIXADO = :DOM_BAIXADO, ' +
          'DAT_PAGAMENTO = :DAT_PAGAMENTO, DOM_PAGO = :DOM_PAGO, DOM_FECHADO = :DOM_FECHADO, COD_STATUS = :COD_STATUS, ' +
          'DAT_ENTREGA = :DAT_ENTREGA, QTD_PESO_REAL = :QTD_PESO_REAL, QTD_PESO_FRANQUIA = :QTD_PESO_FRANQUIA, ' +
          'VAL_VERBA_FRANQUIA = :VAL_VERBA_FRANQUIA, VAL_ADVALOREM = :VAL_ADVALOREM, VAL_PAGO_FRANQUIA = :VAL_PAGO_FRANQUIA, ' +
          'VAL_VERBA_ENTREGADOR = :VAL_VERBA_ENTREGADOR, NUM_EXTRATO = :NUM_EXTRATO, QTD_DIAS_ATRASO = :QTD_DIAS_ATRASO, ' +
          'QTD_VOLUMES_EXTRA = :QTD_VOLUMES_EXTRA, VAL_VOLUMES_EXTRA = :VAL_VOLUMES_EXTRA, QTD_PESO_COBRADO = :QTD_PESO_COBRADO, ' +
          'DES_TIPO_PESO = :DES_TIPO_PESO, DAT_RECEBIDO = :DAT_RECEBIDO, DOM_RECEBIDO = :DOM_RECEBIDO, NUM_CTRC = :NUM_CTRC, ' +
          'NUM_MANIFESTO = :NUM_MANIFESTO, DES_RASTREIO = :DES_RASTREIO, NUM_LOTE_REMESSA = :NUM_LOTE_REMESSA, ' +
          'DES_RETORNO = :DES_RETORNO, DAT_CREDITO = :DAT_CREDITO, DOM_CREDITO = :DOM_CREDITO, NUM_CONTAINER = :NUM_CONTAINER, ' +
          'VAL_PRODUTO = :VAL_PRODUTO, QTD_ALTURA = :QTD_ALTURA, QTD_LARGURA = :QTD_LARGURA, QTD_COMPRIMENTO = :QTD_COMPRIMENTO, ' +
          'COD_FEEDBACK = :COD_FEEDBACK, DAT_FEEDBACK = :DAT_FEEDBACK, DOM_CONFERIDO = :DOM_CONFERIDO ' +
          'WHERE ' +
          'NUM_NOSSONUMERO = :NUM_NOSSONUMERO;';

  Connection.ExecSQL(sSQL,[aEntregas.Distribuidor, aEntregas.Entregador, aEntregas.Cliente,
                           aEntregas.NF, aEntregas.Consumidor, aEntregas.Endereco, aEntregas.Complemento, aEntregas.Bairro,
                           aEntregas.Cidade, aEntregas.CEP, aEntregas.Telefone, aEntregas.Expedicao, aEntregas.Previsao,
                           aEntregas.Volumes, aEntregas.Atribuicao, aEntregas.Baixa, aEntregas.Baixado, aEntregas.Pagamento,
                           aEntregas.Pago, aEntregas.Fechado, aEntregas.Status, aEntregas.Entrega, aEntregas.PesoReal,
                           aEntregas.PesoFranquia, aEntregas.VerbaFranquia, aEntregas.Advalorem, aEntregas.PagoFranquia,
                           aEntregas.VerbaEntregador, aEntregas.Extrato, aEntregas.Atraso, aEntregas.VolumesExtra,
                           aEntregas.ValorVolumes, aEntregas.PesoCobrado, aEntregas.TipoPeso, aEntregas.Recebimento,
                           aEntregas.Recebido, aEntregas.CTRC, aEntregas.Manifesto, aEntregas.Rastreio, aEntregas.Lote,
                           aEntregas.Retorno, aEntregas.Credito, aEntregas.Creditado, aEntregas.Container, aEntregas.ValorProduto,
                           aEntregas.Altura, aEntregas.Largura, aEntregas.Comprimento, aEntregas.CodigoFeedback,
                           aEntregas.DataFeedback, aEntregas.Conferido, aEntregas.NN],
                          [ftInteger, ftInteger, ftInteger,
                          ftString, ftString, ftString, ftString, ftString,
                          ftString, ftString, ftString, ftDate, ftDate,
                          ftInteger, ftDate, ftDate, ftString, ftDate,
                          ftString, ftString, ftInteger, ftDate, ftFloat,
                          ftFloat, ftFloat, ftFloat, ftFloat,
                          ftFloat, ftString, ftInteger, ftFloat,
                          ftFloat, ftFloat, ftString, ftDate,
                          ftString, ftInteger, ftInteger, ftString, ftInteger,
                          ftString, ftDate, ftString, ftString, ftFloat,
                          ftInteger, ftInteger, ftInteger, ftInteger, ftDateTime, ftInteger, ftString]);
  Result := True;
end;

function TEntregasDAO.ChangeConferencia(sNN: String; iStatus: Integer): Boolean;
var
  sSQL: String;
begin
  Result := False;
  sSQL := 'UPDATE ' + TABLENAME + ' ' +
          'SET ' +
          'DOM_CONFERIDO = :DOM_CONFERIDO ' +
          'WHERE ' +
          'NUM_NOSSONUMERO = :NUM_NOSSONUMERO;';
  Connection.ExecSQL(sSQL,[iStatus, sNN], [ftInteger,ftString]);
  Result := True;
end;

function TEntregasDAO.Delete(sNN: String): Boolean;
var
  sSQL : String;
begin
  Result := False;
  if sNN.isEmpty then
  begin
    Exit;
  end;
  sSQL := 'DELETE FROM ' + TABLENAME + ' WHERE NUM_NOSSONUMERO = :NUM_NOSSONUMERO';
  Connection.ExecSQL(sSQL,[sNN], [ftString]);
  Result := True;
end;

function TEntregasDAO.FindEntrega(sFiltro: string; aParam: array of Variant): TObjectList<Model.Entregas.TEntregas>;
var
  FDQuery: TFDQuery;
  entregas: TObjectList<TEntregas>;
begin
  try
    FDQuery := TFDQuery.Create(nil);
    if Length(aParam) = 0 then
    begin
      Exit;
    end;
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    if sFiltro = 'NN' then
    begin
      FDQuery.SQL.Add('WHERE NUM_NOSSONUMERO = :NN');
      FDQuery.ParamByName('NN').AsString := aParam[0];
    end;
    if sFiltro = 'DISTRIBUIDOR' then
    begin
      FDQuery.SQL.Add('WHERE COD_AGENTE = :AGENTE');
      FDQuery.ParamByName('AGENTE').AsInteger := aParam[0];
    end;
    if sFiltro = 'ENTREGADOR' then
    begin
      FDQuery.SQL.Add('WHERE COD_ENTREGADOR = :ENTREHADOR');
      FDQuery.ParamByName('ENTREGADOR').AsInteger := aParam[0];
    end;
    if sFiltro = 'CONTAINER' then
    begin
      FDQuery.SQL.Add('WHERE NUM_CONTAINER = :CONTAINER');
      FDQuery.ParamByName('CONTAINER').AsString := aParam[0];
    end;
    if sFiltro = 'EXPEDICAO' then
    begin
      FDQuery.SQL.Add('WHERE DAT_EXPEDICAO BETWEEN :EXPEDICAO AND :EXPEDICAO1');
      FDQuery.ParamByName('EXPEDICAO').AsDate := aParam[0];
      FDQuery.ParamByName('EXPEDICAO1').AsDate := aParam[1];
    end;
    if sFiltro = 'ATRIBUICAO' then
    begin
      FDQuery.SQL.Add('WHERE DAT_ATRIBUICAO BETWEEN :ATRIBUICAO AND :ATRIBUICAO1');
      FDQuery.ParamByName('ATRIBUICAO').AsDate := aParam[0];
      FDQuery.ParamByName('ATRIBUICAO1').AsDate := aParam[1];
    end;
    if sFiltro = 'BAIXA' then
    begin
      FDQuery.SQL.Add('WHERE DAT_BAIXA BETWEEN :BAIXA AND :BAIXA1');
      FDQuery.ParamByName('BAIXA').AsDate := aParam[0];
      FDQuery.ParamByName('BAIXA1').AsDate := aParam[1];
    end;
    if sFiltro = 'ENTREGA' then
    begin
      FDQuery.SQL.Add('WHERE DAT_ENTREGA BETWEEN :ENTREGA AND :ENTREGA1');
      FDQuery.ParamByName('ENTREGA').AsDate := aParam[0];
      FDQuery.ParamByName('ENTREGA').AsDate := aParam[1];
    end;
    if sFiltro = 'VENCIMENTO' then
    begin
      FDQuery.SQL.Add('WHERE DAT_PREV_DISTRIBUICAO BETWEEN :PREVISAO AND :PREVISAO1');
      FDQuery.ParamByName('PREVISAO').AsDate := aParam[0];
      FDQuery.ParamByName('PREVISAO1').AsDate := aParam[1];
    end;
    if sFiltro = 'EXTRATO' then
    begin
      FDQuery.SQL.Add('WHERE NUM_EXTRATO = :EXTRATO');
      FDQuery.ParamByName('EXTRATO').AsString := aParam[0];
    end;
    if sFiltro = 'CLIENTE' then
    begin
      FDQuery.SQL.Add('WHERE COD_CLIENTE = :CLIENTE');
      FDQuery.ParamByName('CLIENTE').AsInteger := aParam[0];
    end;
    if sFiltro = 'NF' then
    begin
      FDQuery.SQL.Add('WHERE NUM_NF = :NF');
      FDQuery.ParamByName('NF').AsString := aParam[0];
    end;
    if sFiltro = 'CTRC' then
    begin
      FDQuery.SQL.Add('WHERE NUM_CTRC = :CTRC');
      FDQuery.ParamByName('CTRC').AsInteger := aParam[0];
    end;
    if sFiltro = 'MANIFESTO' then
    begin
      FDQuery.SQL.Add('WHERE NUM_MANIFESTO = :MANIFESTO');
      FDQuery.ParamByName('MANIFESTO').AsInteger := aParam[0];
    end;
    if sFiltro = 'CONSUMIDOR' then
    begin
      FDQuery.SQL.Add('WHERE NOM_CONSUMIDOR LIKE :CONSUMIDOR');
      FDQuery.ParamByName('CONSUMIDOR').AsString := aParam[0];
    end;
    if sFiltro = 'CEP' then
    begin
      FDQuery.SQL.Add('WHERE NUM_CEP = :CEP');
      FDQuery.ParamByName('CEP').AsString := aParam[0];
    end;
    if sFiltro = 'LOTE' then
    begin
      FDQuery.SQL.Add('WHERE NUM_LOTE_REMESSA = :LOTE');
      FDQuery.ParamByName('LOTE').AsInteger := aParam[0];
    end;
    if sFiltro = 'CODFEEDBACK' then
    begin
      FDQuery.SQL.Add('WHERE COD_FEEDBACK = :CODIGO');
      FDQuery.ParamByName('CODIGO').AsInteger := aParam[0];
    end;
    if sFiltro = 'DATFEEDBACK' then
    begin
      FDQuery.SQL.Add('WHERE DAT_FEEDBACK = :DATA');
      FDQuery.ParamByName('DATA').AsDateTime := aParam[0];
    end;
    if sFiltro = 'MOVFEEDBACK' then
    begin
      FDQuery.SQL.Add('WHERE COD_FEEDBACK = :CODIGO AND DAT_FEEDBACK = :DATA');
      FDQuery.ParamByName('CODIGO').AsInteger := aParam[0];
      FDQuery.ParamByName('DATA').AsDateTime := aParam[1];
    end;
    if sFiltro = 'LOTFEEDBACK' then
    begin
      FDQuery.SQL.Add('WHERE NUM_LOTE_REMESSA = :LOTE AND COD_FEEDBACK = :CODIGO');
      FDQuery.ParamByName('LOTE').AsInteger := aParam[0];
      FDQuery.ParamByName('CODIGO').AsInteger := aParam[1];
    end;
    if sFiltro = 'FILTRO' then
    begin
      FDQuery.SQL.Add(aParam[0]);
    end;
    if sFiltro <> 'TUDO' then
    begin
      Exit;
    end;
    FDQuery.Open();
    entregas := TObjectList<TEntregas>.Create;
    while not FDQuery.Eof do
    begin
      entregas.Add(TEntregas.Create(FDQuery.FieldByName('NUM_NOSSONUMERO').AsString,
                                    FDQuery.FieldByName('COD_AGENTE').AsInteger, FDQuery.FieldByName('COD_ENTREGADOR').AsInteger,
                                    FDQuery.FieldByName('COD_CLIENTE').AsInteger, FDQuery.FieldByName('NUM_NF').AsString,
                                    FDQuery.FieldByName('NOM_CONSUMIDOR').AsString, FDQuery.FieldByName('DES_ENDERECO').AsString,
                                    FDQuery.FieldByName('DES_COMPLEMENTO').AsString, FDQuery.FieldByName('DES_BAIRRO').AsString,
                                    FDQuery.FieldByName('NOM_CIDADE').AsString, FDQuery.FieldByName('NUM_CEP').AsString,
                                    FDQuery.FieldByName('NUM_TELEFONE').AsString, FDQuery.FieldByName('DAT_EXPEDICAO').AsDateTime,
                                    FDQuery.FieldByName('DAT_PREV_DISTRIBUICAO').AsDateTime,
                                    FDQuery.FieldByName('QTD_VOLUMES').AsInteger,
                                    FDQuery.FieldByName('DAT_ATRIBUICAO').AsDateTime,
                                    FDQuery.FieldByName('DAT_BAIXA').AsDateTime, FDQuery.FieldByName('DOM_BAIXADO').AsString,
                                    FDQuery.FieldByName('DAT_PAGAMENTO').AsDateTime, FDQuery.FieldByName('DOM_PAGO').AsString,
                                    FDQuery.FieldByName('DOM_FECHADO').AsString, FDQuery.FieldByName('COD_STATUS').AsInteger,
                                    FDQuery.FieldByName('DAT_ENTREGA').AsDateTime, FDQuery.FieldByName('QTD_PESO_REAL').AsFloat,
                                    FDQuery.FieldByName('QTD_PESO_FRANQUIA').AsFloat,
                                    FDQuery.FieldByName('VAL_VERBA_FRANQUIA').AsFloat, FDQuery.FieldByName('VAL_ADVALOREM').AsFloat,
                                    FDQuery.FieldByName('VAL_PAGO_FRANQUIA').AsFloat,
                                    FDQuery.FieldByName('VAL_VERBA_ENTREGADOR').AsFloat,
                                    FDQuery.FieldByName('NUM_EXTRATO').AsString, FDQuery.FieldByName('QTD_DIAS_ATRASO').AsInteger,
                                    FDQuery.FieldByName('QTD_VOLUMES_EXTRA').AsFloat,
                                    FDQuery.FieldByName('VAL_VOLUMES_EXTRA').AsFloat,
                                    FDQuery.FieldByName('QTD_PESO_COBRADO').AsFloat, FDQuery.FieldByName('DES_TIPO_PESO').AsString,
                                    FDQuery.FieldByName('DAT_RECEBIDO').AsDateTime, FDQuery.FieldByName('DOM_RECEBIDO').AsString,
                                    FDQuery.FieldByName('NUM_CTRC').AsInteger, FDQuery.FieldByName('NUM_MANIFESTO').AsInteger,
                                    FDQuery.FieldByName('DES_RASTREIO').AsString, FDQuery.FieldByName('NUM_LOTE_REMESSA').AsInteger,
                                    FDQuery.FieldByName('DES_RETORNO').AsString, FDQuery.FieldByName('DAT_CREDITO').AsDateTime,
                                    FDQuery.FieldByName('DOM_CREDITO').AsString, FDQuery.FieldByName('NUM_CONTAINER').AsString,
                                    FDQuery.FieldByName('VAL_PRODUTO').AsFloat, FDQuery.FieldByName('QTD_ALTURA').AsInteger,
                                    FDQuery.FieldByName('QTD_LARGURA').AsInteger, FDQuery.FieldByName('QTD_COMPRIMENTO').AsInteger,
                                    FDQuery.FieldByName('COD_FEEDBACK').AsInteger, FDQuery.FieldByName('DAT_FEEDBACK').AsDateTime,
                                    FDQuery.FieldByName('DOM_CONFERIDO').AsInteger));
      FDQuery.Next;
    end;
    Result := entregas;
  finally
    FDQuery.Free;
  end;
end;

function TEntregasDAO.FindEntregaLote(aParam: array of Variant): TObjectList<Model.Entregas.TEntregas>;
var
  FDQuery: TFDQuery;
  entregas: TObjectList<TEntregas>;
begin
  try
    if Length(aParam) = 0 then
    begin
      Exit;
    end;
    FDQuery := TFDQuery.Create(nil);
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    if Length(aParam) = 2 then
    begin
      FDQuery.SQL.Add('WHERE NUM_LOTE_REMESSA = :LOTE AND COD_FEEDBACK = :CODIGO');
      FDQuery.ParamByName('LOTE').AsInteger := aParam[0];
      FDQuery.ParamByName('CODIGO').AsInteger := aParam[1];
    end
    else if Length(aParam) = 1 then
    begin
      FDQuery.SQL.Add('WHERE NUM_LOTE_REMESSA = :LOTE');
      FDQuery.ParamByName('LOTE').AsInteger := aParam[0];
    end;
    entregas := TObjectList<TEntregas>.Create;
    FDQuery.Open();
    while not FDQuery.Eof do
    begin
      entregas.Add(TEntregas.Create(FDQuery.FieldByName('NUM_NOSSONUMERO').AsString,
                                    FDQuery.FieldByName('COD_AGENTE').AsInteger,
                                    FDQuery.FieldByName('COD_ENTREGADOR').AsInteger,
                                    FDQuery.FieldByName('COD_CLIENTE').AsInteger,
                                    FDQuery.FieldByName('NUM_NF').AsString,
                                    FDQuery.FieldByName('NOM_CONSUMIDOR').AsString,
                                    FDQuery.FieldByName('DES_ENDERECO').AsString,
                                    FDQuery.FieldByName('DES_COMPLEMENTO').AsString,
                                    FDQuery.FieldByName('DES_BAIRRO').AsString,
                                    FDQuery.FieldByName('NOM_CIDADE').AsString,
                                    FDQuery.FieldByName('NUM_CEP').AsString,
                                    FDQuery.FieldByName('NUM_TELEFONE').AsString,
                                    FDQuery.FieldByName('DAT_EXPEDICAO').AsDateTime,
                                    FDQuery.FieldByName('DAT_PREV_DISTRIBUICAO').AsDateTime,
                                    FDQuery.FieldByName('QTD_VOLUMES').AsInteger,
                                    FDQuery.FieldByName('DAT_ATRIBUICAO').AsDateTime,
                                    FDQuery.FieldByName('DAT_BAIXA').AsDateTime,
                                    FDQuery.FieldByName('DOM_BAIXADO').AsString,
                                    FDQuery.FieldByName('DAT_PAGAMENTO').AsDateTime,
                                    FDQuery.FieldByName('DOM_PAGO').AsString,
                                    FDQuery.FieldByName('DOM_FECHADO').AsString,
                                    FDQuery.FieldByName('COD_STATUS').AsInteger,
                                    FDQuery.FieldByName('DAT_ENTREGA').AsDateTime,
                                    FDQuery.FieldByName('QTD_PESO_REAL').AsFloat,
                                    FDQuery.FieldByName('QTD_PESO_FRANQUIA').AsFloat,
                                    FDQuery.FieldByName('VAL_VERBA_FRANQUIA').AsFloat,
                                    FDQuery.FieldByName('VAL_ADVALOREM').AsFloat,
                                    FDQuery.FieldByName('VAL_PAGO_FRANQUIA').AsFloat,
                                    FDQuery.FieldByName('VAL_VERBA_ENTREGADOR').AsFloat,
                                    FDQuery.FieldByName('NUM_EXTRATO').AsString,
                                    FDQuery.FieldByName('QTD_DIAS_ATRASO').AsInteger,
                                    FDQuery.FieldByName('QTD_VOLUMES_EXTRA').AsFloat,
                                    FDQuery.FieldByName('VAL_VOLUMES_EXTRA').AsFloat,
                                    FDQuery.FieldByName('QTD_PESO_COBRADO').AsFloat,
                                    FDQuery.FieldByName('DES_TIPO_PESO').AsString,
                                    FDQuery.FieldByName('DAT_RECEBIDO').AsDateTime,
                                    FDQuery.FieldByName('DOM_RECEBIDO').AsString,
                                    FDQuery.FieldByName('NUM_CTRC').AsInteger,
                                    FDQuery.FieldByName('NUM_MANIFESTO').AsInteger,
                                    FDQuery.FieldByName('DES_RASTREIO').AsString,
                                    FDQuery.FieldByName('NUM_LOTE_REMESSA').AsInteger,
                                    FDQuery.FieldByName('DES_RETORNO').AsString,
                                    FDQuery.FieldByName('DAT_CREDITO').AsDateTime,
                                    FDQuery.FieldByName('DOM_CREDITO').AsString,
                                    FDQuery.FieldByName('NUM_CONTAINER').AsString,
                                    FDQuery.FieldByName('VAL_PRODUTO').AsFloat,
                                    FDQuery.FieldByName('QTD_ALTURA').AsInteger,
                                    FDQuery.FieldByName('QTD_LARGURA').AsInteger,
                                    FDQuery.FieldByName('QTD_COMPRIMENTO').AsInteger,
                                    FDQuery.FieldByName('COD_FEEDBACK').AsInteger,
                                    FDQuery.FieldByName('DAT_FEEDBACK').AsDateTime,
                                    FDQuery.FieldByName('DOM_CONFERIDO').AsInteger));
      FDQuery.Next;
    end;
    Result := entregas;
  finally
    FDQuery.Free;
  end;
  Result := entregas;
end;

function TEntregasDAO.FindEntregaMovimento(aParam: array of Variant): TObjectList<Model.Entregas.TEntregas>;
var
  FDQuery: TFDQuery;
  entregas: TObjectList<TEntregas>;
begin
  try
    if Length(aParam) = 0 then
    begin
      Exit;
    end;
    FDQuery := TFDQuery.Create(nil);
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    if Length(aParam) = 2 then
    begin
      FDQuery.SQL.Add('WHERE COD_FEEDBACK = :CODIGO AND DAT_FEEDBACK = :DATA');
      FDQuery.ParamByName('CODIGO').AsInteger := aParam[0];
      FDQuery.ParamByName('DATA').AsDateTime := aParam[1];
    end
    else
    begin
      Exit;
    end;
    entregas := TObjectList<TEntregas>.Create;
    FDQuery.Open();
    while not FDQuery.Eof do
    begin
      entregas.Add(TEntregas.Create(FDQuery.FieldByName('NUM_NOSSONUMERO').AsString,
                                    FDQuery.FieldByName('COD_AGENTE').AsInteger,
                                    FDQuery.FieldByName('COD_ENTREGADOR').AsInteger,
                                    FDQuery.FieldByName('COD_CLIENTE').AsInteger,
                                    FDQuery.FieldByName('NUM_NF').AsString,
                                    FDQuery.FieldByName('NOM_CONSUMIDOR').AsString,
                                    FDQuery.FieldByName('DES_ENDERECO').AsString,
                                    FDQuery.FieldByName('DES_COMPLEMENTO').AsString,
                                    FDQuery.FieldByName('DES_BAIRRO').AsString,
                                    FDQuery.FieldByName('NOM_CIDADE').AsString,
                                    FDQuery.FieldByName('NUM_CEP').AsString,
                                    FDQuery.FieldByName('NUM_TELEFONE').AsString,
                                    FDQuery.FieldByName('DAT_EXPEDICAO').AsDateTime,
                                    FDQuery.FieldByName('DAT_PREV_DISTRIBUICAO').AsDateTime,
                                    FDQuery.FieldByName('QTD_VOLUMES').AsInteger,
                                    FDQuery.FieldByName('DAT_ATRIBUICAO').AsDateTime,
                                    FDQuery.FieldByName('DAT_BAIXA').AsDateTime,
                                    FDQuery.FieldByName('DOM_BAIXADO').AsString,
                                    FDQuery.FieldByName('DAT_PAGAMENTO').AsDateTime,
                                    FDQuery.FieldByName('DOM_PAGO').AsString,
                                    FDQuery.FieldByName('DOM_FECHADO').AsString,
                                    FDQuery.FieldByName('COD_STATUS').AsInteger,
                                    FDQuery.FieldByName('DAT_ENTREGA').AsDateTime,
                                    FDQuery.FieldByName('QTD_PESO_REAL').AsFloat,
                                    FDQuery.FieldByName('QTD_PESO_FRANQUIA').AsFloat,
                                    FDQuery.FieldByName('VAL_VERBA_FRANQUIA').AsFloat,
                                    FDQuery.FieldByName('VAL_ADVALOREM').AsFloat,
                                    FDQuery.FieldByName('VAL_PAGO_FRANQUIA').AsFloat,
                                    FDQuery.FieldByName('VAL_VERBA_ENTREGADOR').AsFloat,
                                    FDQuery.FieldByName('NUM_EXTRATO').AsString,
                                    FDQuery.FieldByName('QTD_DIAS_ATRASO').AsInteger,
                                    FDQuery.FieldByName('QTD_VOLUMES_EXTRA').AsFloat,
                                    FDQuery.FieldByName('VAL_VOLUMES_EXTRA').AsFloat,
                                    FDQuery.FieldByName('QTD_PESO_COBRADO').AsFloat,
                                    FDQuery.FieldByName('DES_TIPO_PESO').AsString,
                                    FDQuery.FieldByName('DAT_RECEBIDO').AsDateTime,
                                    FDQuery.FieldByName('DOM_RECEBIDO').AsString,
                                    FDQuery.FieldByName('NUM_CTRC').AsInteger,
                                    FDQuery.FieldByName('NUM_MANIFESTO').AsInteger,
                                    FDQuery.FieldByName('DES_RASTREIO').AsString,
                                    FDQuery.FieldByName('NUM_LOTE_REMESSA').AsInteger,
                                    FDQuery.FieldByName('DES_RETORNO').AsString,
                                    FDQuery.FieldByName('DAT_CREDITO').AsDateTime,
                                    FDQuery.FieldByName('DOM_CREDITO').AsString,
                                    FDQuery.FieldByName('NUM_CONTAINER').AsString,
                                    FDQuery.FieldByName('VAL_PRODUTO').AsFloat,
                                    FDQuery.FieldByName('QTD_ALTURA').AsInteger,
                                    FDQuery.FieldByName('QTD_LARGURA').AsInteger,
                                    FDQuery.FieldByName('QTD_COMPRIMENTO').AsInteger,
                                    FDQuery.FieldByName('COD_FEEDBACK').AsInteger,
                                    FDQuery.FieldByName('DAT_FEEDBACK').AsDateTime,
                                    FDQuery.FieldByName('DOM_CONFERIDO').AsInteger));
      FDQuery.Next;
    end;
    Result := entregas;
  finally
    FDQuery.Free;
  end;
  Result := entregas;
end;

function TEntregasDAO.FindEntregaNN(aParam: array of Variant): TObjectList<Model.Entregas.TEntregas>;
var
  FDQuery: TFDQuery;
  entregas: TObjectList<TEntregas>;
begin
  try
    if Length(aParam) = 0 then
    begin
      Exit;
    end;
    FDQuery := TFDQuery.Create(nil);
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE NUM_NOSSONUMERO = :NN');
    FDQuery.ParamByName('NN').AsString := aParam[0];
    entregas := TObjectList<TEntregas>.Create;
    FDQuery.Open();
    while not FDQuery.Eof do
    begin
      entregas.Add(TEntregas.Create(FDQuery.FieldByName('NUM_NOSSONUMERO').AsString,
                                    FDQuery.FieldByName('COD_AGENTE').AsInteger,
                                    FDQuery.FieldByName('COD_ENTREGADOR').AsInteger,
                                    FDQuery.FieldByName('COD_CLIENTE').AsInteger,
                                    FDQuery.FieldByName('NUM_NF').AsString,
                                    FDQuery.FieldByName('NOM_CONSUMIDOR').AsString,
                                    FDQuery.FieldByName('DES_ENDERECO').AsString,
                                    FDQuery.FieldByName('DES_COMPLEMENTO').AsString,
                                    FDQuery.FieldByName('DES_BAIRRO').AsString,
                                    FDQuery.FieldByName('NOM_CIDADE').AsString,
                                    FDQuery.FieldByName('NUM_CEP').AsString,
                                    FDQuery.FieldByName('NUM_TELEFONE').AsString,
                                    FDQuery.FieldByName('DAT_EXPEDICAO').AsDateTime,
                                    FDQuery.FieldByName('DAT_PREV_DISTRIBUICAO').AsDateTime,
                                    FDQuery.FieldByName('QTD_VOLUMES').AsInteger,
                                    FDQuery.FieldByName('DAT_ATRIBUICAO').AsDateTime,
                                    FDQuery.FieldByName('DAT_BAIXA').AsDateTime,
                                    FDQuery.FieldByName('DOM_BAIXADO').AsString,
                                    FDQuery.FieldByName('DAT_PAGAMENTO').AsDateTime,
                                    FDQuery.FieldByName('DOM_PAGO').AsString,
                                    FDQuery.FieldByName('DOM_FECHADO').AsString,
                                    FDQuery.FieldByName('COD_STATUS').AsInteger,
                                    FDQuery.FieldByName('DAT_ENTREGA').AsDateTime,
                                    FDQuery.FieldByName('QTD_PESO_REAL').AsFloat,
                                    FDQuery.FieldByName('QTD_PESO_FRANQUIA').AsFloat,
                                    FDQuery.FieldByName('VAL_VERBA_FRANQUIA').AsFloat,
                                    FDQuery.FieldByName('VAL_ADVALOREM').AsFloat,
                                    FDQuery.FieldByName('VAL_PAGO_FRANQUIA').AsFloat,
                                    FDQuery.FieldByName('VAL_VERBA_ENTREGADOR').AsFloat,
                                    FDQuery.FieldByName('NUM_EXTRATO').AsString,
                                    FDQuery.FieldByName('QTD_DIAS_ATRASO').AsInteger,
                                    FDQuery.FieldByName('QTD_VOLUMES_EXTRA').AsFloat,
                                    FDQuery.FieldByName('VAL_VOLUMES_EXTRA').AsFloat,
                                    FDQuery.FieldByName('QTD_PESO_COBRADO').AsFloat,
                                    FDQuery.FieldByName('DES_TIPO_PESO').AsString,
                                    FDQuery.FieldByName('DAT_RECEBIDO').AsDateTime,
                                    FDQuery.FieldByName('DOM_RECEBIDO').AsString,
                                    FDQuery.FieldByName('NUM_CTRC').AsInteger,
                                    FDQuery.FieldByName('NUM_MANIFESTO').AsInteger,
                                    FDQuery.FieldByName('DES_RASTREIO').AsString,
                                    FDQuery.FieldByName('NUM_LOTE_REMESSA').AsInteger,
                                    FDQuery.FieldByName('DES_RETORNO').AsString,
                                    FDQuery.FieldByName('DAT_CREDITO').AsDateTime,
                                    FDQuery.FieldByName('DOM_CREDITO').AsString,
                                    FDQuery.FieldByName('NUM_CONTAINER').AsString,
                                    FDQuery.FieldByName('VAL_PRODUTO').AsFloat,
                                    FDQuery.FieldByName('QTD_ALTURA').AsInteger,
                                    FDQuery.FieldByName('QTD_LARGURA').AsInteger,
                                    FDQuery.FieldByName('QTD_COMPRIMENTO').AsInteger,
                                    FDQuery.FieldByName('COD_FEEDBACK').AsInteger,
                                    FDQuery.FieldByName('DAT_FEEDBACK').AsDateTime,
                                    FDQuery.FieldByName('DOM_CONFERIDO').AsInteger));
      FDQuery.Next;
    end;
    Result := entregas;
  finally
    FDQuery.Free;
  end;
  Result := entregas;
end;

function TEntregasDAO.FindEntregasFechamento(aParam: array of Variant): TObjectList<Model.Entregas.TEntregas>;
var
  FDQuery: TFDQuery;
  entregas: TObjectList<TEntregas>;
begin
  try
    if Length(aParam) < 3 then Exit;
    FDQuery := TFDQuery.Create(nil);
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE DAT_BAIXA BETWEEN :DATA AND :DATA1 AND DOM_BAIXADO = :BAIXADO');
    FDQuery.ParamByName('DATA').AsDateTime := aParam[0];
    FDQuery.ParamByName('DATA1').AsDateTime := aParam[1];
    FDQuery.ParamByName('BAIXADO').AsString := aParam[2];
    entregas := TObjectList<TEntregas>.Create;
    FDQuery.Open();
    while not FDQuery.Eof do
    begin
      entregas.Add(TEntregas.Create(FDQuery.FieldByName('NUM_NOSSONUMERO').AsString,
                                    FDQuery.FieldByName('COD_AGENTE').AsInteger,
                                    FDQuery.FieldByName('COD_ENTREGADOR').AsInteger,
                                    FDQuery.FieldByName('COD_CLIENTE').AsInteger,
                                    FDQuery.FieldByName('NUM_NF').AsString,
                                    FDQuery.FieldByName('NOM_CONSUMIDOR').AsString,
                                    FDQuery.FieldByName('DES_ENDERECO').AsString,
                                    FDQuery.FieldByName('DES_COMPLEMENTO').AsString,
                                    FDQuery.FieldByName('DES_BAIRRO').AsString,
                                    FDQuery.FieldByName('NOM_CIDADE').AsString,
                                    FDQuery.FieldByName('NUM_CEP').AsString,
                                    FDQuery.FieldByName('NUM_TELEFONE').AsString,
                                    FDQuery.FieldByName('DAT_EXPEDICAO').AsDateTime,
                                    FDQuery.FieldByName('DAT_PREV_DISTRIBUICAO').AsDateTime,
                                    FDQuery.FieldByName('QTD_VOLUMES').AsInteger,
                                    FDQuery.FieldByName('DAT_ATRIBUICAO').AsDateTime,
                                    FDQuery.FieldByName('DAT_BAIXA').AsDateTime,
                                    FDQuery.FieldByName('DOM_BAIXADO').AsString,
                                    FDQuery.FieldByName('DAT_PAGAMENTO').AsDateTime,
                                    FDQuery.FieldByName('DOM_PAGO').AsString,
                                    FDQuery.FieldByName('DOM_FECHADO').AsString,
                                    FDQuery.FieldByName('COD_STATUS').AsInteger,
                                    FDQuery.FieldByName('DAT_ENTREGA').AsDateTime,
                                    FDQuery.FieldByName('QTD_PESO_REAL').AsFloat,
                                    FDQuery.FieldByName('QTD_PESO_FRANQUIA').AsFloat,
                                    FDQuery.FieldByName('VAL_VERBA_FRANQUIA').AsFloat,
                                    FDQuery.FieldByName('VAL_ADVALOREM').AsFloat,
                                    FDQuery.FieldByName('VAL_PAGO_FRANQUIA').AsFloat,
                                    FDQuery.FieldByName('VAL_VERBA_ENTREGADOR').AsFloat,
                                    FDQuery.FieldByName('NUM_EXTRATO').AsString,
                                    FDQuery.FieldByName('QTD_DIAS_ATRASO').AsInteger,
                                    FDQuery.FieldByName('QTD_VOLUMES_EXTRA').AsFloat,
                                    FDQuery.FieldByName('VAL_VOLUMES_EXTRA').AsFloat,
                                    FDQuery.FieldByName('QTD_PESO_COBRADO').AsFloat,
                                    FDQuery.FieldByName('DES_TIPO_PESO').AsString,
                                    FDQuery.FieldByName('DAT_RECEBIDO').AsDateTime,
                                    FDQuery.FieldByName('DOM_RECEBIDO').AsString,
                                    FDQuery.FieldByName('NUM_CTRC').AsInteger,
                                    FDQuery.FieldByName('NUM_MANIFESTO').AsInteger,
                                    FDQuery.FieldByName('DES_RASTREIO').AsString,
                                    FDQuery.FieldByName('NUM_LOTE_REMESSA').AsInteger,
                                    FDQuery.FieldByName('DES_RETORNO').AsString,
                                    FDQuery.FieldByName('DAT_CREDITO').AsDateTime,
                                    FDQuery.FieldByName('DOM_CREDITO').AsString,
                                    FDQuery.FieldByName('NUM_CONTAINER').AsString,
                                    FDQuery.FieldByName('VAL_PRODUTO').AsFloat,
                                    FDQuery.FieldByName('QTD_ALTURA').AsInteger,
                                    FDQuery.FieldByName('QTD_LARGURA').AsInteger,
                                    FDQuery.FieldByName('QTD_COMPRIMENTO').AsInteger,
                                    FDQuery.FieldByName('COD_FEEDBACK').AsInteger,
                                    FDQuery.FieldByName('DAT_FEEDBACK').AsDateTime,
                                    FDQuery.FieldByName('DOM_CONFERIDO').AsInteger));
      FDQuery.Next;
    end;
    Result := entregas;
  finally
    FDQuery.Free;
  end;
end;

end.
