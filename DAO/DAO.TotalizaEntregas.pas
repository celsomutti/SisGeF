unit DAO.TotalizaEntregas;

interface

uses DAO.Base, Model.TotalEntregas, Generics.Collections, System.Classes;

type
  TTotalizaEntregasDAO = class(TDAO)
  public
    function Totaliza(aParam: array of Variant): TObjectList<TTotalEntregas>;
  end;
const
  TABLENAME = 'tbentregas';

implementation

uses System.SysUtils, FireDAC.Comp.Client, Data.DB;

{ TTotalizaEntregasDAO }

function TTotalizaEntregasDAO.Totaliza(aParam: array of Variant): TObjectList<TTotalEntregas>;
var
  sSQL: String;
  FDQuery: TFDQuery;
  totais: TObjectList<TTotalEntregas>;
begin
  try
    sSQL := 'SELECT COD_AGENTE AS AGENTE, COD_ENTREGADOR AS ENTREGADOR, SUM(QTD_VOLUMES) AS VOLUMES, COUNT(NUM_NOSSONUMERO) AS ENTREGAS, ' +
           '((SUM(QTD_VOLUMES) - COUNT(NUM_NOSSONUMERO)) / 2) AS EXTRA, SUM(IF(QTD_DIAS_ATRASO > 0,1,0)) AS ATRASO, ' +
           '(100 - ((SUM(IF(QTD_DIAS_ATRASO > 0,1,0)) / COUNT(NUM_NOSSONUMERO))) * 100) AS SLA, SUM(VAL_VERBA_FRANQUIA) AS VERBA, ' +
           'SUM(IF(QTD_PESO_COBRADO > 30,1,0)) AS PFP ' +
           'FROM ' + TABLENAME +
           ' WHERE DOM_BAIXADO = :BAIXADO AND DAT_BAIXA BETWEEN :DATA1 AND :DATA2 AND DOM_FECHADO <> :FECHADO' +
           ' GROUP BY COD_AGENTE, COD_ENTREGADOR;';
    FDQuery := TFDQuery.Create(nil);
    FDQuery.Connection := Connection;
    FDQuery.SQL.Text := sSQL;
    FDQuery.ParamByName('BAIXADO').AsString := aParam[0];
    FDQuery.ParamByName('DATA1').AsDate := aParam[1];
    FDQuery.ParamByName('DATA2').AsDate := aParam[2];
    FDQuery.ParamByName('FECHADO').AsString := aParam[3];
    FDQuery.Open();
    totais := TObjectList<TTotalEntregas>.Create;
    while not FDQuery.Eof do
    begin
      totais.Add(TTotalEntregas.Create(FDQuery.FieldByName('AGENTE').AsInteger,
                                       FDQuery.FieldByName('ENTREGADOR').AsInteger,
                                       FDQuery.FieldByName('VOLUMES').AsInteger,
                                       FDQuery.FieldByName('ENTREGAS').AsInteger,
                                       FDQuery.FieldByName('EXTRA').AsFloat,
                                       FDQuery.FieldByName('ATRASO').AsInteger,
                                       FDQuery.FieldByName('SLA').AsFloat,
                                       FDQuery.FieldByName('VERBA').AsFloat,
                                       FDQuery.FieldByName('PFP').AsInteger));
      FDQuery.Next;
    end;
    Result := totais;
  finally
    FDQuery.Free;
  end;
end;

end.
