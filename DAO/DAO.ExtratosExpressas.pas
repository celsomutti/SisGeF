unit DAO.ExtratosExpressas;

interface

uses DAO.Base, Model.ExtratosExpressas, Generics.Collections, System.Classes;

type
  TExtratosExpressasDAO = class(TDAO)
  public
    function Insert(aExtrato: TExtratosExpressas): Boolean;
    function Update(aExtrato: TExtratosExpressas): Boolean;
    function Delete(iID: Integer): Boolean;
    function CancelaExtrato(aParam: array of Variant): Boolean;
    function FindExtrato(sFiltro: String; aParam: array of Variant): TObjectList<TExtratosExpressas>;
  end;
const
  TABLENAME = 'fin_extrato_expressas';

implementation

uses System.SysUtils, FireDAC.Comp.Client, Data.DB;

{ TExtratosExpressasDAO }

function TExtratosExpressasDAO.CancelaExtrato(aParam: array of Variant): Boolean;
var
  sSQL : String;
begin
  Result := False;
  sSQL := 'DELETE FROM ' + TABLENAME + ' WHERE DAT_INICIO <= :DATA1 AND DAT_FINAL <= :DATA2 AND DOM_FECHADO = :FECHADO';
  Connection.ExecSQL(sSQL,[aParam[0], aParam[1], aParam[2]],[ftDate, ftDate, ftInteger]);
  Result := True;
end;

function TExtratosExpressasDAO.Delete(iID: Integer): Boolean;
var
  sSQL : String;
begin
  Result := False;
  sSQL := 'DELETE FROM ' + TABLENAME + ' WHERE ID_EXTRATO = :ID';
  Connection.ExecSQL(sSQL,[iID],[ftInteger]);
  Result := True;
end;

function TExtratosExpressasDAO.FindExtrato(sFiltro: String; aParam: array of Variant): TObjectList<TExtratosExpressas>;
var
  FdQuery : TFDQuery;
  extratos: TObjectList<TExtratosExpressas>;
begin
  try
    FdQuery := TFDQuery.Create(nil);
    if Length(aParam) = 0 then Exit;
    FdQuery.Connection := Connection;
    FdQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    if SfILTRO = 'ID' then
    begin
      FdQuery.SQL.Add('WHERE ID_EXTRATO = :ID');
      FdQuery.ParamByName('ID').AsInteger := aParam[0];
    end
    else if sFiltro = 'AGENTE' then
    begin
      FdQuery.SQL.Add('WHERE COD_AGENTE = :AGENTE');
      FdQuery.ParamByName('AGENTE').AsInteger := aParam[0];
    end
    else if sFiltro = 'ENTREGADOR' then
    begin
      FdQuery.SQL.Add('WHERE COD_ENTREGADOR = :ENTREGADOR');
      FdQuery.ParamByName('ENTREGADOR').AsInteger := aParam[0];
    end
    else if sFiltro = 'REFERENCIA' then
    begin
      FdQuery.SQL.Add('WHERE DAT_INICIO >= :INICIO AND DAT_FINAL <= :FINAL AND COD_ENTREGADOR = :ENTREGADOR');
      FdQuery.ParamByName('INICIO').AsDate := aParam[0];
      FdQuery.ParamByName('FINAL').AsDate := aParam[1];
      FdQuery.ParamByName('ENTREGADOR').AsInteger := aParam[2];
    end
    else if sFiltro = 'REFERENCIAAG' then
    begin
      FdQuery.SQL.Add('WHERE DAT_INICIO >= :INICIO AND DAT_FINAL <= :FINAL AND COD_AGENTE = :AGENTE');
      FdQuery.ParamByName('INICIO').AsDate := aParam[0];
      FdQuery.ParamByName('FINAL').AsDate := aParam[1];
      FdQuery.ParamByName('AGENTE').AsInteger := aParam[2];
    end
    else if sFiltro = 'DATA' then
    begin
      FdQuery.SQL.Add('WHERE DAT_INICIO >= :INICIO AND DAT_FINAL <= :FINAL');
      FdQuery.ParamByName('INICIO').AsDate := aParam[0];
      FdQuery.ParamByName('FINAL').AsDate := aParam[1];
    end
    else if sFiltro = 'PERIODO' then
    begin
      FdQuery.SQL.Add('WHERE DAT_INICIO >= :INICIO AND DAT_FINAL <= :FINAL AND DOM_FECHADO = :FECHADO');
      FdQuery.ParamByName('INICIO').AsDate := aParam[0];
      FdQuery.ParamByName('FINAL').AsDate := aParam[1];
      FdQuery.ParamByName('FECHADO').AsInteger := aParam[2];
    end
    else if sFiltro = 'PAGAMENTO' then
    begin
      if Length(aParam) = 2 then
      begin
        FdQuery.SQL.Add('WHERE DAT_PAGAMENTO BETWEEN :INICIO AND :FINAL AND DOM_FECHADO = :FECHAD0');
        FdQuery.ParamByName('INICIO').AsDate := aParam[0];
        FdQuery.ParamByName('FINAL').AsDate := aParam[1];
        FdQuery.ParamByName('FECHADO').AsInteger := 1;
      end
      else
      begin
        FdQuery.SQL.Add('WHERE DAT_PAGAMENTO = :DATA');
        FdQuery.ParamByName('DATA').AsDate := aParam[0];
      end;
    end
    else if sFiltro = 'FILTRO' then
    begin
      FdQuery.SQL.Add('WHERE ' + aParam[0]);
    end;
    extratos := TObjectList<TExtratosExpressas>.Create;
    FdQuery.Open();
    while not FdQuery.Eof do
    begin
      extratos.Add(TExtratosExpressas.Create(FDQuery.FieldByName('ID_EXTRATO').AsInteger,
                                             FDQuery.FieldByName('COD_AGENTE').AsInteger,
                                             FDQuery.FieldByName('COD_ENTREGADOR').AsInteger,
                                             FDQuery.FieldByName('DAT_INICIO').AsDateTime,
                                             FDQuery.FieldByName('DAT_FINAL').AsDateTime,
                                             FDQuery.FieldByName('DAT_PAGAMENTO').AsDateTime,
                                             FDQuery.FieldByName('QTD_VOLUMES').AsInteger,
                                             FDQuery.FieldByName('QTD_ENTREGAS').AsInteger,
                                             FDQuery.FieldByName('QTD_ITENS_ATRASO').AsInteger,
                                             FDQuery.FieldByName('QTD_VOLUMES_EXTRA').AsFloat,
                                             FDQuery.FieldByName('VAL_PERCENTUAL_SLA').AsFloat,
                                             FDQuery.FieldByName('VAL_VERBA').AsFloat,
                                             FDQuery.FieldByName('VAL_ENTREGAS').AsFloat,
                                             FDQuery.FieldByName('VAL_VOLUMES_EXTRA').AsFloat,
                                             FDQuery.FieldByName('VAL_PRODUCAO').AsFloat,
                                             FDQuery.FieldByName('VAL_CREDITOS').AsFloat,
                                             FDQuery.FieldByName('VAL_RESTRICAO').AsFloat,
                                             FDQuery.FieldByName('VAL_EXTRAVIOS').AsFloat,
                                             FDQuery.FieldByName('VAL_DEBITOS').AsFloat,
                                             FDQuery.FieldByName('VAL_TOTAL_CREDITOS').AsFloat,
                                             FDQuery.FieldByName('VAL_TOTAL_DEBITOS').AsFloat,
                                             FDQuery.FieldByName('VAL_TOTAL_GERAL').AsFloat,
                                             FDQuery.FieldByName('DOM_FECHADO').AsInteger,
                                             FDQuery.FieldByName('TOT_VERBA_FRANQUIA').AsFloat,
                                             FDQuery.FieldByName('QTD_PFP').AsInteger,
                                             FDQuery.FieldByName('DES_LOG').AsString));
      FdQuery.Next;
    end;
    Result := extratos;
  finally
    FdQuery.Free;
  end;
end;

function TExtratosExpressasDAO.Insert(aExtrato: TExtratosExpressas): Boolean;
var
  sSQL: String;
begin
  Result := False;
  aExtrato.Id := GetKeyValue(TABLENAME,'ID_EXTRATO');
  sSQL := 'INSERT INTO ' + TABLENAME +
          '(ID_EXTRATO, COD_AGENTE, COD_ENTREGADOR, DAT_INICIO, DAT_FINAL, DAT_PAGAMENTO, QTD_VOLUMES, QTD_ENTREGAS, QTD_ITENS_ATRASO, QTD_VOLUMES_EXTRA, ' +
          'VAL_PERCENTUAL_SLA, VAL_VERBA, VAL_ENTREGAS, VAL_VOLUMES_EXTRA, VAL_PRODUCAO, VAL_CREDITOS, VAL_RESTRICAO, VAL_EXTRAVIOS, VAL_DEBITOS, VAL_TOTAL_CREDITOS, ' +
          'VAL_TOTAL_DEBITOS, VAL_TOTAL_GERAL, DOM_FECHADO, TOT_VERBA_FRANQUIA, QTD_PFP, DES_LOG) ' +
          'VALUE ' +
          '(:PID_EXTRATO, :PCOD_AGENTE, :PCOD_ENTREGADOR, :PDAT_INICIO, :PDAT_FINAL, :PDAT_PAGAMENTO, :PQTD_VOLUMES, :PQTD_ENTREGAS, :PQTD_ITENS_ATRASO, ' +
          ':PQTD_VOLUMES_EXTRA, :PVAL_PERCENTUAL_SLA, :PVAL_VERBA, :PVAL_ENTREGAS, :PVAL_VOLUMES_EXTRA, :PVAL_PRODUCAO, :PVAL_CREDITOS, :PVAL_RESTRICAO, :PVAL_EXTRAVIOS, ' +
          ':PVAL_DEBITOS, :PVAL_TOTAL_CREDITOS, :PVAL_TOTAL_DEBITOS, :PVAL_TOTAL_GERAL, :PDOM_FECHADO, :PTOT_VERBA_FRANQUIA, :PQTD_PFP, :PDES_LOG)';
  Connection.ExecSQL(sSQL, [aExtrato.Id, aExtrato.Agente, aExtrato.Entregador, aExtrato.DataInicio, aExtrato.DataFinal, aExtrato.DataPagamento,
                           aExtrato.Volumes, aExtrato.Entregas, aExtrato.Atrasos, aExtrato.VolumesExtra, aExtrato.SLA, aExtrato.Verba, aExtrato.ValorEntregas,
                           aExtrato.ValorVolumesExtra, aExtrato.ValorProducao, aExtrato.ValorCreditos, aExtrato.ValorRestricao, aExtrato.ValorExtravio, aExtrato.ValorDebitos,
                           aExtrato.ValorTotalCreditos, aExtrato.ValorTotalDebitos, aExtrato.ValorTotalGeral, aExtrato.Fechado, aExtrato.TotalVerbaFranquia, AeXTRATO.PFP, aExtrato.Log],
                           [ftInteger, ftInteger, ftInteger, ftDate, ftDate, ftDate, ftInteger, ftInteger, ftInteger, ftFloat, ftFloat, ftFloat, ftFloat, ftFloat,
                           ftFloat, ftFloat, ftFloat, ftFloat, ftFloat, ftFloat, ftFloat, ftFloat, ftInteger, ftFloat, ftInteger, ftString]);
  Result := True;
end;

function TExtratosExpressasDAO.Update(aExtrato: TExtratosExpressas): Boolean;
var
  sSQL: String;
begin
  Result := False;
  sSQL := 'UPDATE ' + TABLENAME + ' SET ' +
          'COD_AGENTE = :PCOD_AGENTE, COD_ENTREGADOR = :PCOD_ENTREGADOR, DAT_INICIO = :PDAT_INICIO, DAT_FINAL = :PDAT_FINAL, DAT_PAGAMENTO = :PDAT_PAGAMENTO, ' +
          'QTD_VOLUMES = :PQTD_VOLUMES, QTD_ENTREGAS = :PQTD_ENTREGAS, QTD_ITENS_ATRASO = :PQTD_ITENS_ATRASO, QTD_VOLUMES_EXTRA = :PQTD_VOLUMES_EXTRA, ' +
          'VAL_PERCENTUAL_SLA = :PVAL_PERCENTUAL_SLA, VAL_VERBA = :PVAL_VERBA, VAL_ENTREGAS = :PVAL_ENTREGAS, VAL_VOLUMES_EXTRA = :PVAL_VOLUMES_EXTRA, ' +
          'VAL_PRODUCAO = :PVAL_PRODUCAO, VAL_CREDITOS = :PVAL_CREDITOS, VAL_RESTRICAO = :PVAL_RESTRICAO, VAL_EXTRAVIOS = :PVAL_EXTRAVIOS, ' +
          'VAL_DEBITOS = :PVAL_DEBITOS, VAL_TOTAL_CREDITOS = :PVAL_TOTAL_CREDITOS, VAL_TOTAL_DEBITOS = :PVAL_TOTAL_DEBITOS, VAL_TOTAL_GERAL = :PVAL_TOTAL_GERAL, ' +
          'DOM_FECHADO = :PDOM_FECHADO, TOT_VERBA_FRANQUIA = :PTOT_VERBA_FRANQUIA, QTD_PFP = :pQTD_PFP, DES_LOG = :PDES_LOG ' +
          'WHERE ID_EXTRATO = :PID_EXTRATO';
  Connection.ExecSQL(sSQL,[aExtrato.Agente, aExtrato.Entregador, aExtrato.DataInicio, aExtrato.DataFinal, aExtrato.DataPagamento,
                           aExtrato.Volumes, aExtrato.Entregas, aExtrato.Atrasos, aExtrato.VolumesExtra, aExtrato.SLA, aExtrato.Verba, aExtrato.ValorEntregas,
                           aExtrato.ValorVolumesExtra, aExtrato.ValorProducao, aExtrato.ValorCreditos, aExtrato.ValorRestricao, aExtrato.ValorExtravio, aExtrato.ValorDebitos,
                           aExtrato.ValorTotalCreditos, aExtrato.ValorTotalDebitos, aExtrato.ValorTotalGeral, aExtrato.Fechado, aExtrato.TotalVerbaFranquia, aExtrato.PFP, aExtrato.Log,
                           aExtrato.Id],
                           [ftInteger, ftInteger, ftDate, ftDate, ftDate, ftInteger, ftInteger, ftInteger, ftFloat, ftFloat, ftFloat, ftFloat, ftFloat,
                           ftFloat, ftFloat, ftFloat, ftFloat, ftFloat, ftFloat, ftFloat, ftFloat, ftInteger, ftFloat, ftInteger, ftString, ftInteger]);
  Result := True;
end;

end.
