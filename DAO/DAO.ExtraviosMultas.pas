unit DAO.ExtraviosMultas;

interface

uses DAO.Base, Model.ExtraviosMultas, Generics.Collections, System.Classes;

type
  TExtraviosMultasDAO = class(TDAO)
  public
    function Insert(aExtravios: TExtraviosMultas): Boolean;
    function Update(aExtravios: TExtraviosMultas): Boolean;
    function Delete(iID: Integer): Boolean;
    function FindExtravio(sFiltro: String; aParam: array of Variant): TObjectList<TExtraviosMultas>;
    function CancelaFechamento(iExtrato: Integer): Boolean;
  end;
const
  TABLENAME = 'tbextravios';

implementation

uses System.SysUtils, FireDAC.Comp.Client, Data.DB;

{ TExtraviosMultasDAO }

function TExtraviosMultasDAO.CancelaFechamento(iExtrato: Integer): Boolean;
var
  sSQL : String;
begin
  Result := False;
  sSQL := 'UPDATE ' + TABLENAME + ' SET ID_EXTRATO = 0 WHERE ID_EXTRATO = :ID';
  Connection.ExecSQL(sSQL,[iExtrato],[ftInteger]);
  Result := True;
end;

function TExtraviosMultasDAO.Delete(iID: Integer): Boolean;
var
  sSQL : String;
begin
  Result := False;
  if iID = 0 then
  begin
    Exit;
  end;
  sSQL := 'DELETE FROM ' + TABLENAME + ' WHERE COD_EXTRAVIO = :ID';
  Connection.ExecSQL(sSQL,[iID],[ftInteger]);
  Result := True;
end;

function TExtraviosMultasDAO.FindExtravio(sFiltro: String; aParam: array of Variant): TObjectList<TExtraviosMultas>;
var
  FDQuery: TFDQuery;
  extravios: TObjectList<TExtraviosMultas>;
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
    if sFiltro = 'CODIGO' then
    begin
      FDQuery.SQL.Add('WHERE COD_EXTRAVIO = :CODIGO');
      FDQuery.ParamByName('CODIGO').AsInteger := aParam[0];
    end;
    if sFiltro = 'ENTREGADOR' then
    begin
      FDQuery.SQL.Add('WHERE COD_ENTREGADOR = :ENTREGADOR');
      FDQuery.ParamByName('ENTREGADOR').AsInteger := aParam[0];
    end;
    if sFiltro = 'DESCRICAO' then
    begin
      FDQuery.SQL.Add('WHERE DES_EXTRAVIO = :DESCRICAO');
      FDQuery.ParamByName('DESCRICAO').AsString := aParam[0];
    end;
    if sFiltro = 'NN' then
    begin
      FDQuery.SQL.Add('WHERE NUM_NOSSONUMERO = :NN');
      FDQuery.ParamByName('NN').AsString := aParam[0];
    end;
    if sFiltro = 'AGENTE' then
    begin
      FDQuery.SQL.Add('WHERE COD_AGENTE = :AGENTE');
      FDQuery.ParamByName('AGENTE').AsInteger := aParam[0];
    end;
    if sFiltro = 'EXTRATO' then
    begin
      FDQuery.SQL.Add('WHERE ID_EXTRATO = :EXTRATO AND VAL_PERCENTUAL_PAGO < 100');
      FDQuery.ParamByName('EXTRATO').AsInteger := aParam[0];
    end;
    if sFiltro = 'DATA' then
    begin
      if Length(aParam) = 1 then
      begin
        FDQuery.SQL.Add('WHERE DAT_EXTRAVIO = :DATA');
        FDQuery.ParamByName('DATA').AsDate := aParam[0];
      end
      else if Length(aParam) = 2 then
      begin
        FDQuery.SQL.Add('WHERE DAT_EXTRAVIO BETWEEN :DATA AND :DATA1');
        FDQuery.ParamByName('DATA').AsDate := aParam[0];
        FDQuery.ParamByName('DATA1').AsDate := aParam[0];
      end;
    end;
    if sFiltro = 'DATAFRANQUIA' then
    begin
      if Length(aParam) = 1 then
      begin
        FDQuery.SQL.Add('WHERE DAT_EXTRAVIO_FRANQUIA = :DATA');
        FDQuery.ParamByName('DATA').AsDate := aParam[0];
      end
      else if Length(aParam) = 2 then
      begin
        FDQuery.SQL.Add('WHERE DAT_EXTRAVIO_FRANQUIA BETWEEN :DATA AND :DATA1');
        FDQuery.ParamByName('DATA').AsDate := aParam[0];
        FDQuery.ParamByName('DATA1').AsDate := aParam[1];
      end;
    end;
    if sFiltro = 'FILTRO' then
    begin
      FDQuery.SQL.Add(aParam[0]);
    end;
    FDQuery.Open();
    extravios := TObjectList<TExtraviosMultas>.Create;
    while not FDQuery.Eof do
    begin
      extravios.Add(TExtraviosMultas.Create(FDQuery.FieldByName('COD_EXTRAVIO').AsInteger,
                                               FDQuery.FieldByName('DES_EXTRAVIO').AsString,
                                               FDQuery.FieldByName('NUM_NOSSONUMERO').AsString,
                                               FDQuery.FieldByName('COD_AGENTE').AsInteger,
                                               FDQuery.FieldByName('VAL_PRODUTO').AsFloat,
                                               FDQuery.FieldByName('DAT_EXTRAVIO').AsDateTime,
                                               FDQuery.FieldByName('VAL_MULTA').AsFloat,
                                               FDQuery.FieldByName('VAL_VERBA').AsFloat,
                                               FDQuery.FieldByName('VAL_TOTAL').AsFloat,
                                               FDQuery.FieldByName('DOM_RESTRICAO').AsString,
                                               FDQuery.FieldByName('COD_ENTREGADOR').AsInteger,
                                               FDQuery.FieldByName('COD_TIPO').AsInteger,
                                               FDQuery.FieldByName('VAL_EXTRATO_FRANQUIA').AsFloat,
                                               FDQuery.FieldByName('DOM_EXTRATO_FRANQUIA').AsString,
                                               FDQuery.FieldByName('DAT_EXTRAVIO_FRANQUIA').AsDateTime,
                                               FDQuery.FieldByName('DES_ENVIO_CORRESPONDENCIA').AsString,
                                               FDQuery.FieldByName('DES_RETORNO_CORRESPONDENCIA').AsString,
                                               FDQuery.FieldByName('DES_OBSERVACOES').AsString,
                                               FDQuery.FieldByName('VAL_PERCENTUAL_PAGO').AsFloat,
                                               FDQuery.FieldByName('ID_EXTRATO').AsInteger,
                                               FDQuery.FieldByName('NOM_EXECUTOR').AsString,
                                               FDQuery.FieldByName('DAT_MANUTENCAO').AsDateTime));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := extravios;
end;

function TExtraviosMultasDAO.Insert(aExtravios: TExtraviosMultas): Boolean;
var
  sSQL : System.string;
begin
  Result := False;
  aExtravios.ID := GetKeyValue(TABLENAME, 'COD_EXTRAVIO');
  sSQL := 'INSERT INTO ' + TABLENAME + '(COD_EXTRAVIO, DES_EXTRAVIO, NUM_NOSSONUMERO, COD_AGENTE, VAL_PRODUTO, DAT_EXTRAVIO, VAL_MULTA, VAL_VERBA, VAL_TOTAL, DOM_RESTRICAO, '  +
                                       'COD_ENTREGADOR, COD_TIPO, VAL_EXTRATO_FRANQUIA, DOM_EXTRATO_FRANQUIA, DAT_EXTRAVIO_FRANQUIA, DES_ENVIO_CORRESPONDENCIA, ' +
                                       'DES_RETORNO_CORRESPONDENCIA, DES_OBSERVACOES, VAL_PERCENTUAL_PAGO, ID_EXTRATO, NOM_EXECUTOR, DAT_MANUTENCAO) ' +
                                       'VALUES ' +
                                       '(:PCOD_EXTRAVIO, :PDES_EXTRAVIO, :PNUM_NOSSONUMERO, :PCOD_AGENTE, :PVAL_PRODUTO, :PDAT_EXTRAVIO, :PVAL_MULTA, :PVAL_VERBA, :PVAL_TOTAL, ' +
                                       ':PDOM_RESTRICAO, :PCOD_ENTREGADOR, :PCOD_TIPO, :PVAL_EXTRATO_FRANQUIA, :PDOM_EXTRATO_FRANQUIA, :PDAT_EXTRAVIO_FRANQUIA, ' +
                                       ':PDES_ENVIO_CORRESPONDENCIA, :PDES_RETORNO_CORRESPONDENCIA, :PDES_OBSERVACOES, :PVAL_PERCENTUAL_PAGO, :PID_EXTRATO, :PNOM_EXECUTOR, ' +
                                       ':PDAT_MANUTENCAO)';
  Connection.ExecSQL(sSQL,[aExtravios.ID, aExtravios.Descricao, aExtravios.NN, aExtravios.Agente, aExtravios.ValorProduto, aExtravios.Data, aExtravios.Multa, aExtravios.Verba,
                           aExtravios.Total, aExtravios.Restricao, aExtravios.Entregador, aExtravios.Tipo, aExtravios.ValorFranquia, aExtravios.Extrato, aExtravios.DataFranquia,
                           aExtravios.EnvioCorrespondencia, aExtravios.RetornoCorrespondencia, aExtravios.Obs, aExtravios.Percentual, aExtravios.IDExtrato, aExtravios.Executor,
                           aExtravios.Manutencao],
                          [ftInteger, ftString, ftString, ftInteger, ftFloat, ftDate, ftFloat, ftFloat, ftFloat, ftString, ftInteger, ftInteger, ftFloat, ftString, ftDate,
                          ftString, ftString, ftString, ftFloat, ftInteger, ftString, FTDateTime]);
  Result := True;
end;

function TExtraviosMultasDAO.Update(aExtravios: TExtraviosMultas): Boolean;
var
  sSQL : System.string;
begin
  Result := False;
  sSQL := 'UPDATE ' + TABLENAME + ' SET ' +
                                       'DES_EXTRAVIO = :PDES_EXTRAVIO, NUM_NOSSONUMERO = :PNUM_NOSSONUMERO, COD_AGENTE = :PCOD_AGENTE, ' +
                                       'VAL_PRODUTO = :PVAL_PRODUTO, DAT_EXTRAVIO = :PDAT_EXTRAVIO, VAL_MULTA = :PVAL_MULTA, VAL_VERBA = :PVAL_VERBA, VAL_TOTAL = :PVAL_TOTAL, ' +
                                       'DOM_RESTRICAO = :PDOM_RESTRICAO, COD_ENTREGADOR = :PCOD_ENTREGADOR, COD_TIPO = :PCOD_TIPO, VAL_EXTRATO_FRANQUIA = :PVAL_EXTRATO_FRANQUIA,' +
                                       'DOM_EXTRATO_FRANQUIA = :PDOM_EXTRATO_FRANQUIA, DAT_EXTRAVIO_FRANQUIA = :PDAT_EXTRAVIO_FRANQUIA, ' +
                                       'DES_ENVIO_CORRESPONDENCIA = :PDES_ENVIO_CORRESPONDENCIA, DES_RETORNO_CORRESPONDENCIA = :PDES_RETORNO_CORRESPONDENCIA, ' +
                                       'DES_OBSERVACOES = :PDES_OBSERVACOES, VAL_PERCENTUAL_PAGO = :PVAL_PERCENTUAL_PAGO, ID_EXTRATO = :PID_EXTRATO, ' +
                                       'NOM_EXECUTOR = :PNOM_EXECUTOR, DAT_MANUTENCAO = :PDAT_MANUTENCAO ' +
                                       'WHERE COD_EXTRAVIO = :PCOD_EXTRAVIO';
  Connection.ExecSQL(sSQL,[aExtravios.Descricao, aExtravios.NN, aExtravios.Agente, aExtravios.ValorProduto, aExtravios.Data, aExtravios.Multa, aExtravios.Verba,
                           aExtravios.Total, aExtravios.Restricao, aExtravios.Entregador, aExtravios.Tipo, aExtravios.ValorFranquia, aExtravios.Extrato, aExtravios.DataFranquia,
                           aExtravios.EnvioCorrespondencia, aExtravios.RetornoCorrespondencia, aExtravios.Obs, aExtravios.Percentual, aExtravios.IDExtrato, aExtravios.Executor,
                           aExtravios.Manutencao, aExtravios.ID],
                          [ftString, ftString, ftInteger, ftFloat, ftDate, ftFloat, ftFloat, ftFloat, ftString, ftInteger, ftInteger, ftFloat, ftString, ftDate,
                          ftString, ftString, ftString, ftFloat, ftInteger, ftString, FTDateTime, ftInteger]);
  Result := True;
end;

end.
