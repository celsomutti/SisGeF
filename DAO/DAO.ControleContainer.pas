unit DAO.ControleContainer;

interface

uses DAO.base, Model.ControleContainer, Generics.Collections, System.Classes;

type
  TControleContainerDAO = class(TDAO)
  public
    function Insert(aControle: TControleContainer): Boolean;
    function Update(aControle: TControleContainer): Boolean;
    function Delete(aParam: array of Variant): Boolean;
    function Find(aParam: array of Variant): TObjectList<TControleContainer>;
  end;
const
  TABLENAME = 'trs_controle_container';

implementation

{ TControleContainerDAO }

uses System.SysUtils, FireDAC.Comp.Client, Data.DB;

function TControleContainerDAO.Delete(aParam: array of Variant): Boolean;
var
  sSQL: String;
  sWhere: String;
begin
  Result := False;
  sSQL := 'DELETE FROM ' + TABLENAME + ' ';
  if aParam[0] = 'CONTAINER' then
  begin
    sSQL := 'WHERE NUM_CONTAINER = :CONTAINER';
    Connection.ExecSQL(sSQL + sWhere,[aParam[1]], [ftString]);
  end;
  if aParam[0] = 'DATA' then
  begin
    sSQL := 'WHERE DAT_EXPEDICAO = :DATA';
    Connection.ExecSQL(sSQL + sWhere,[aParam[1]], [ftDate]);
  end;
  if aParam[0] = 'DESTINO' then
  begin
    sSQL := 'WHERE COD_DESTINO = :DESTINO';
    Connection.ExecSQL(sSQL + sWhere,[aParam[1]], [ftInteger]);
  end;
  Result := True;
end;

function TControleContainerDAO.Find(aParam: array of Variant): TObjectList<TControleContainer>;
var
  FdQuery : TFDQuery;
  controles : TObjectList<TControleContainer>;
begin
  try
    if Length(aParam) <= 1 then Exit;
    FdQuery := TFDQuery.Create(nil);
    FdQuery.Connection := Connection;
    FdQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    controles := TObjectList<TControleContainer>.Create;
    if aParam[0] = 'CONTAINER' then
    begin
      FDQuery.SQL.Add('WHERE NUM_CONTAINER = :CONTAINER');
      FDQuery.ParamByName('CONTAINER').AsString := aParam[1];
    end;
    if aParam[0] = 'CONTAINER0' then
    begin
      FDQuery.SQL.Add('WHERE NUM_CONTAINER = :CONTAINER AND DAT_EXPEDICAO = :DATA AND COD_DESTINO = :DESTINO');
      FDQuery.ParamByName('CONTAINER').AsString := aParam[1];
      FDQuery.ParamByName('DATA').AsDate := aParam[2];
      FDQuery.ParamByName('DESTINO').AsInteger := aParam[3];
    end;
    if aParam[0] = 'DATA' then
    begin
      FDQuery.SQL.Add('WHERE DAT_EXPEDICAO = :DATA');
      FDQuery.ParamByName('DATA').AsDate := aParam[1];
    end;
    if aParam[0] = 'DESTINO' then
    begin
      FDQuery.SQL.Add('WHERE COD_DESTINO = :DESTINO');
      FDQuery.ParamByName('DESTINO').AsInteger := aParam[1];
    end;
    if aParam[0] = 'STATUSDESTINO' then
    begin
      FDQuery.SQL.Add('WHERE COD_DESTINO = :DESTINO AND DOM_STATUS = :STATUS');
      FDQuery.ParamByName('DESTINO').AsInteger := aParam[1];
      FDQuery.ParamByName('STATUS').AsInteger := aParam[2];
    end;
    if aParam[0] = 'STATUSDATA' then
    begin
      FDQuery.SQL.Add('WHERE DAT_EXPEDICAO = :DATA AND DOM_STATUS = :STATUS');
      FDQuery.ParamByName('DATA').AsDate := aParam[1];
      FDQuery.ParamByName('STATUS').AsInteger := aParam[2];
    end;
    if aParam[0] = 'filtro' then
    begin
      FDQuery.SQL.Add('WHERE ' + aParam[2]);
    end;
    controles := TObjectList<TControleContainer>.Create;
    FDQuery.Open();
    while not FDQuery.Eof do
    begin
      controles.Add(TControleContainer.Create(FDQuery.FieldByName('NUM_CONTAINER').AsString,
                                              FDQuery.FieldByName('DAT_EXPEDICAO').AsDateTime,
                                              FDQuery.FieldByName('QTD_PESO_CONTAINER').AsFloat,
                                              FDQuery.FieldByName('VAL_TOTAL_CONTAINER').AsFloat,
                                              FDQuery.FieldByName('VAL_TOTAL_VERBA').AsFloat,
                                              FDQuery.FieldByName('COD_DESTINO').AsInteger,
                                              FdQuery.FieldByName('DOM_STATUS').AsInteger,
                                              FdQuery.FieldByName('DES_LOG').AsString));
      FdQuery.Next;
    end;
    Result := controles;
  finally
    FdQuery.Free;
  end;

end;

function TControleContainerDAO.Insert(aControle: TControleContainer): Boolean;
var
  sSQL :  String;
begin
  Result := False;
  sSQL := 'INSERT INTO '  + TABLENAME + '(NUM_CONTAINER, DAT_EXPEDICAO, QTD_PESO_CONTAINER, VAL_TOTAL_CONTAINER, VAL_TOTAL_VERBA, COD_DESTINO, DOM_STATUS, DES_LOG) ' +
                                        'VALUES (:PNUM_CONTAINER, :PDAT_EXPEDICAO, :PQTD_PESO_CONTAINER, :PVAL_TOTAL_CONTAINER, :PVAL_TOTAL_VERBA, :PCOD_DESTINO, ' +
                                        ':PDOM_STATUS, :PDES_LOG)';
  Connection.ExecSQL(sSQL,[aControle.Container, aControle.Data, aControle.Peso, aControle.ValorTotal, aControle.VerbaTotal, aControle.Destino, aControle.Status, aControle.Log],
                     [ftString, ftDate, ftFloat, ftFloat, ftFloat, ftInteger, ftInteger, ftString]);

  Result := True;
end;

function TControleContainerDAO.Update(aControle: TControleContainer): Boolean;
var
  sSQL : String;
begin
  Result := False;
  sSQL := 'UPDATE ' + TABLENAME + ' SET DAT_EXPEDICAO = :PDAT_EXPEDICAO, QTD_PESO_CONTAINER = :PQTD_PESO_CONTAINER, VAL_TOTAL_CONTAINER = :PVAL_TOTAL_CONTAINER, ' +
                                  'VAL_TOTAL_VERBA = :PVAL_TOTAL_VERBA, COD_DESTINO = :PCOD_DESTINO, DOM_STATUS = :PDOM_STATUS, DES_LOG = :PDES_LOG ' +
                                  'WHERE NUM_CONTAINER = :PNUM_CONTAINER';
  Connection.ExecSQL(sSQL,[aControle.Data, aControle.Peso, aControle.ValorTotal, aControle.VerbaTotal, aControle.Destino, aControle.Status, aControle.Log, aControle.Container],
                     [ftDate, ftFloat, ftFloat, ftFloat, ftInteger, ftInteger, ftString, ftString]);
  Result := True;
end;

end.
