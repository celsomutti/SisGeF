unit DAO.FechamentosExpressas;

interface

uses DAO.Base, Model.FechamentoExpressas, Generics.Collections, System.Classes;

type
  TFechamentoExpressasDAO = class(TDAO)
  public
    function Insert(aFechamento: TFechamentoExpressas): Boolean;
    function Update(aFechamento: TFechamentoExpressas): Boolean;
    function Delete(iId: Integer): Boolean;
    function FindFechamento(sFiltro: String; aParam: array of Variant): TObjectList<TFechamentoExpressas>;
    function CancelaFechamento(aParam: array of Variant): Boolean;
  end;
const
  TABLENAME = 'fin_fechamento_expressas';
implementation

uses System.SysUtils, FireDAC.Comp.Client, Data.DB;

{ TFechamentoExpressasDAO }

function TFechamentoExpressasDAO.CancelaFechamento(aParam: array of Variant): Boolean;
var
  sSQL : String;
begin
  Result := False;
  sSQL := 'DELETE FROM ' + TABLENAME + ' WHERE DAT_INICIO <= :DATA1 AND DAT_FINAL <= :DATA2 AND DOM_FECHADO = :FECHADO';
  Connection.ExecSQL(sSQL,[aParam[0], aParam[1], aParam[2]],[ftDate, ftDate, ftInteger]);
  Result := True;
end;

function TFechamentoExpressasDAO.Delete(iId: Integer): Boolean;
var
  sSQL: String;
begin
  Result := False;
  if iId = 0 then Exit;
  sSQL := 'DELETE FROM ' + TABLENAME + ' WHERE ID_FECHAMENTO = :ID_FECHAMENTO';
  Connection.ExecSQL(sSQL,[iID], [ftInteger]);
  Result := True;
end;

function TFechamentoExpressasDAO.FindFechamento(sFiltro: String; aParam: array of Variant): TObjectList<TFechamentoExpressas>;
var
  FDQuery : TFDQuery;
  fechamentos : TobjectList<TFechamentoExpressas>;
begin
  try
    FDQuery := TFDQuery.Create(nil);
    if Length(aParam) = 0 then Exit;
    FDQuery.Connection := connection;
    FDQuery.SQL.Add('SELECT ID_FECHAMENTO, DAT_INICIO, DAT_FINAL, COD_TIPO, COD_EXPRESSA, VAL_PRODUCAO, VAL_VERBA_ENTREGADOR, ' +
    'TOT_VERBA_FRANQUIA, VAL_SALDO_RESTRICAO, VAL_RESTRICAO, VAL_EXTRAVIOS, VAL_CREDITOS, VAL_DEBITOS, VAL_FINANCIADO, ' +
    'VAL_TOTAL_DEBITOS, VAL_TOTAL_CREDITOS, VAL_TOTAL_GERAL, DOM_FECHADO, DES_EXTRATOS, TOT_ENTREGAS, QTD_PFP, ' +
    'NOM_FAVORECIDO, NUM_CPF_CNPJ, COD_BANCO, COD_AGENCIA, DES_TIPO_CONTA, NUM_CONTA, DES_LOG FROM ' + TABLENAME);
    if sFiltro = 'ID' then
    begin
      FDQuery.SQL.Add('WHERE ID_FECHAMENTO = :ID');
      FDQuery.ParamByName('ID').AsInteger := aParam[0];
    end
    else if sFiltro = 'FECHADO' then
    begin
      FDQuery.SQL.Add('WHERE DOM_FECHADO = :FECHADO');
      FDQuery.ParamByName('FECHADO').AsInteger := aParam[0];
    end
    else if  sFiltro = 'PERIODO' then
    begin
      FDQuery.SQL.Add('WHERE DAT_INICIO >= :INICIO AND DAT_FINAL <= :FINAL AND DOM_FECHADO = :FECHADO');
      FDQuery.ParamByName('INICIO').AsDate := aParam[0];
      FDQuery.ParamByName('FINAL').AsDate := aParam[1];
      FDQuery.ParamByName('FECHADO').AsInteger := aParam[2];
    end
    else if  sFiltro = 'DATAS' then
    begin
      FDQuery.SQL.Add('WHERE DAT_INICIO >= :INICIO AND DAT_FINAL <= :FINAL');
      FDQuery.ParamByName('INICIO').AsDate := aParam[0];
      FDQuery.ParamByName('FINAL').AsDate := aParam[1];
    end
    else if  sFiltro = 'CODIGO' then
    begin
      FDQuery.SQL.Add('WHERE COD_TIPO = :TIPO AND COD_EXPRESSA = :CODIGO');
      FDQuery.ParamByName('TIPO').AsInteger := aParam[0];
      FDQuery.ParamByName('CODIGO').AsInteger := aParam[1];
    end
    else if  sFiltro = 'EXTRATO' then
    begin
      FDQuery.SQL.Add('WHERE DAT_INICIO >= :INICIO AND DAT_FINAL <= :FINAL AND COD_TIPO = :TIPO AND COD_EXPRESSA = :CODIGO');
      FDQuery.ParamByName('INICIO').AsDate := aParam[0];
      FDQuery.ParamByName('FINAL').asDate := aParam[1];
      FDQuery.ParamByName('TIPO').AsInteger := aParam[2];
      FDQuery.ParamByName('CODIGO').AsInteger := aParam[3];
    end;
    FDQuery.Open();
    fechamentos := TObjectList<TFechamentoExpressas>.Create();
    while not FDQuery.Eof do
    begin
      fechamentos.Add(TFechamentoExpressas.Create(FDQuery.FieldByName('ID_FECHAMENTO').AsInteger,
                                                  FDQuery.FieldByName('DAT_INICIO').AsDateTime,
                                                  FDQuery.FieldByName('DAT_FINAL').AsDateTime,
                                                  FDQuery.FieldByName('COD_TIPO').AsInteger,
                                                  FDQuery.FieldByName('COD_EXPRESSA').AsInteger,
                                                  FDQuery.FieldByName('VAL_PRODUCAO').AsFloat,
                                                  FDQuery.FieldByName('VAL_VERBA_ENTREGADOR').AsFloat,
                                                  FDQuery.FieldByName('TOT_VERBA_FRANQUIA').AsFloat,
                                                  FDQuery.FieldByName('VAL_SALDO_RESTRICAO').AsFloat,
                                                  FDQuery.FieldByName('VAL_RESTRICAO').AsFloat,
                                                  FDQuery.FieldByName('VAL_EXTRAVIOS').AsFloat,
                                                  FDQuery.FieldByName('VAL_CREDITOS').AsFloat,
                                                  FDQuery.FieldByName('VAL_DEBITOS').AsFloat,
                                                  FDQuery.FieldByName('VAL_FINANCIADO').AsFloat,
                                                  FDQuery.FieldByName('VAL_TOTAL_DEBITOS').AsFloat,
                                                  FDQuery.FieldByName('VAL_TOTAL_CREDITOS').AsFloat,
                                                  FDQuery.FieldByName('VAL_TOTAL_GERAL').AsFloat,
                                                  FDQuery.FieldByName('DOM_FECHADO').AsInteger,
                                                  FDQuery.FieldByName('DES_EXTRATOS').AsString,
                                                  FDQuery.FieldByName('TOT_ENTREGAS').AsInteger,
                                                  FDQuery.FieldByName('QTD_PFP').AsInteger,
                                                  FDQuery.FieldByName('NOM_FAVORECIDO').AsString,
                                                  FDQuery.FieldByName('NUM_CPF_CNPJ').AsString,
                                                  FDQuery.FieldByName('COD_BANCO').AsInteger,
                                                  FDQuery.FieldByName('COD_AGENCIA').AsString,
                                                  FDQuery.FieldByName('DES_TIPO_CONTA').AsString,
                                                  FDQuery.FieldByName('NUM_CONTA').AsString,
                                                  FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
    Result := fechamentos;
  finally
    FDQuery.Free;
  end;
end;

function TFechamentoExpressasDAO.Insert(aFechamento: TFechamentoExpressas): Boolean;
var
  sSQL: String;
begin
  Result := False;
  aFechamento.Id := GetKeyValue(TABLENAME,'ID_FECHAMENTO');
  sSQL := 'INSERT INTO ' + TABLENAME +
                           '(ID_FECHAMENTO, DAT_INICIO, DAT_FINAL, COD_TIPO, COD_EXPRESSA, VAL_PRODUCAO, VAL_VERBA_ENTREGADOR, TOT_VERBA_FRANQUIA, VAL_SALDO_RESTRICAO, ' +
                           'VAL_RESTRICAO, VAL_EXTRAVIOS, VAL_CREDITOS, VAL_DEBITOS, VAL_FINANCIADO, VAL_TOTAL_DEBITOS, VAL_TOTAL_CREDITOS, VAL_TOTAL_GERAL, DOM_FECHADO, ' +
                           'DES_EXTRATOS, TOT_ENTREGAS,QTD_PFP, NOM_FAVORECIDO, NUM_CPF_CNPJ, COD_BANCO, COD_AGENCIA, DES_TIPO_CONTA, NUM_CONTA, DES_LOG) ' +
                           'VALUE ' +
                           '(:PID_FECHAMENTO, :PDAT_INICIO, :PDAT_FINAL, :PCOD_TIPO, :PCOD_EXPRESSA, :PVAL_PRODUCAO, :PVAL_VERBA_ENTREGADOR, :PTOT_VERBA_FRANQUIA, ' +
                           ':PVAL_SALDO_RESTRICAO, :PVAL_RESTRICAO, :PVAL_EXTRAVIOS, :PVAL_CREDITOS, :PVAL_DEBITOS, :PVAL_FINANCIADO, :PVAL_TOTAL_DEBITOS, ' +
                           ':PVAL_TOTAL_CREDITOS, :PVAL_TOTAL_GERAL, :PDOM_FECHADO, :PDES_EXTRATOS, :PTOT_ENTREGAS, :pQTD_PFP, :NOM_FAVORECIDO, :NUM_CPF_CNPJ, :COD_BANCO, ' +
                           ':COD_AGENCIA, :DES_TIPO_CONTA, :NUM_CONTA, :PDES_LOG)';
  Connection.ExecSQL(sSQL, [aFechamento.Id, aFechamento.DataInicio, aFechamento.DataFinal, aFechamento.Tipo, aFechamento.Codigo, aFechamento.ValorProducao,
                            aFechamento.VerbaEntregador, aFechamento.TotalVerbaFranquia, aFechamento.SaldoRestricao, aFechamento.ValorResticao, aFechamento.ValorExtravios,
                            aFechamento.ValorCreditos, aFechamento.ValorDebitos, aFechamento.ValorFinanciado, aFechamento.TotalDebitos, aFechamento.TotalCreditos,
                            aFechamento.TotalGeral, aFechamento.Fechado, aFechamento.Extratos, aFechamento.TotalEntregas, aFechamento.PFP, aFechamento.Favorecido,
                            aFechamento.CPFCNPJ, aFechamento.Banco, aFechamento.Agencia, aFechamento.TipoConta, aFechamento.Conta, aFechamento.Log],
                            [ftInteger, ftDate, ftDate, ftInteger, ftInteger, ftFloat, ftFloat, ftFloat, ftFloat, ftFloat, ftFloat, ftFloat, ftFloat, ftFloat, ftFloat, ftFloat,
                            ftFloat, ftInteger, ftString, ftInteger, ftInteger, ftString, ftString, ftInteger, ftString, ftString, ftString, ftString]);
  Result := True;
end;

function TFechamentoExpressasDAO.Update(aFechamento: TFechamentoExpressas): Boolean;
var
  sSQL: String;
begin
  Result := False;
  sSQL := 'UPDATE ' + TABLENAME + ' SET ' +
                           'DAT_INICIO = :PDAT_INICIO, DAT_FINAL = :PDAT_FINAL, COD_TIPO = :PCOD_TIPO, COD_EXPRESSA = :PCOD_EXPRESSA, ' +
                           'VAL_PRODUCAO = :PVAL_PRODUCAO, VAL_VERBA_ENTREGADOR = :pVAL_VERBA_ENTREGADOR, TOT_VERBA_FRANQUIA = :pTOT_VERBA_FRANQUIA, ' +
                           'VAL_SALDO_RESTRICAO = :PVAL_SALDO_RESTRICAO, VAL_RESTRICAO = :PVAL_RESTRICAO, VAL_EXTRAVIOS = :PVAL_EXTRAVIOS, ' +
                           'VAL_CREDITOS = :PVAL_CREDITOS, VAL_DEBITOS = :PVAL_DEBITOS, VAL_FINANCIADO = :PVAL_FINANCIADO, VAL_TOTAL_DEBITOS = :PVAL_TOTAL_DEBITOS, ' +
                           'VAL_TOTAL_CREDITOS = :PVAL_TOTAL_CREDITOS, VAL_TOTAL_GERAL = :PVAL_TOTAL_GERAL, DOM_FECHADO = :PDOM_FECHADO, DES_EXTRATOS = :PDES_EXTRATOS, ' +
                           'TOT_ENTREGAS = :PTOT_ENTREGAS, QTD_PFP = :PQTD_PFP, NOM_FAVORECIDO = :NOM_FAVORECIDO, NUM_CPF_CNPJ = :NUM_CPF_CNPJ, ' +
                           'COD_BANCO = :COD_BANCO, COD_AGENCIA = :COD_AGENCIA, DES_TIPO_CONTA = :DES_TIPO_CONTA, NUM_CONTA = :NUM_CONTA, DES_LOG = :PDES_LOG ' +
                           'WHERE ID_FECHAMENTO = :PID_FECHAMENTO';
  Connection.ExecSQL(sSQL, [aFechamento.DataInicio, aFechamento.DataFinal, aFechamento.Tipo, aFechamento.Codigo, aFechamento.ValorProducao,
                            aFechamento.VerbaEntregador, aFechamento.TotalVerbaFranquia, aFechamento.SaldoRestricao, aFechamento.ValorResticao, aFechamento.ValorExtravios,
                            aFechamento.ValorCreditos, aFechamento.ValorDebitos, aFechamento.ValorFinanciado, aFechamento.TotalDebitos, aFechamento.TotalCreditos,
                            aFechamento.TotalGeral, aFechamento.Fechado, aFechamento.Extratos, aFechamento.TotalEntregas, aFechamento.PFP, aFechamento.Favorecido,
                            aFechamento.CPFCNPJ, aFechamento.Banco, aFechamento.Agencia, aFechamento.TipoConta, aFechamento.Conta,aFechamento.Log, aFechamento.Id],
                            [ftDate, ftDate, ftInteger, ftInteger, ftFloat, ftFloat, ftFloat, ftFloat, ftFloat, ftFloat, ftFloat, ftFloat, ftFloat, ftFloat, ftFloat,
                            ftFloat, ftInteger, ftString, ftInteger, ftInteger, ftString, ftString, ftInteger, ftString, ftString, ftString, ftString, ftInteger]);
  Result := True;
end;

end.
