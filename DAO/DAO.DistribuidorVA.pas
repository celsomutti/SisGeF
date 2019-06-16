unit DAO.DistribuidorVA;

interface

uses DAO.Base, Model.DistribuidorVA, Generics.Collections, System.Classes;

type
  TDistribuidorVADAO = class(TDAO)
  public
    function Insert(aDistribuidor: TDistribuidorVA): Boolean;
    function Update(aDistribuidor: TDistribuidorVA): Boolean;
    function Delete(iID: Integer): Boolean;
    function FindByID(iID: Integer): TObjectList<TDistribuidorVA>;
    function FindByCodigo(iCodigo: Integer): TObjectList<TDistribuidorVA>;
  end;
const
  TABLENAME = 'va_distribuidor';

implementation

uses System.SysUtils, FireDAC.Comp.Client, Data.DB;

function TDistribuidorVADAO.Insert(aDistribuidor: TDistribuidorVA): Boolean;
var
  sSQL: String;
begin
  Result := False;
  aDistribuidor.ID := GetKeyValue(TABLENAME,'ID_DISTRIBUIDOR');
  sSQL := 'INSERT INTO ' + TABLENAME + '(' +
  'ID_DISTRIBUIDOR, COD_DISTRIBUIDOR, NOM_DISTRIBUIDOR, DES_LOG) ' +
  'VALUE (' +
  ':pID_DISTRIBUIDOR, :pCOD_DISTRIBUIDOR, :pNOM_DISTRIBUIDOR, :pDES_LOG); ';
  Connection.ExecSQL(sSQL, [aDistribuidor.ID, aDistribuidor.Codigo, aDistribuidor.Nome, aDistribuidor.Log],
                    [ftInteger, ftInteger, ftString, ftString]);
  Result := True;
end;

function TDistribuidorVADAO.Update(aDistribuidor: TDistribuidorVA): Boolean;
var
  sSQL: String;
begin
  Result := False;
  sSQL := 'UPDATE ' + TABLENAME + ' SET ' +
  'COD_DISTRIBUIDOR = :pCOD_DISTRIBUIDOR, NOM_DISTRIBUIDOR = :pNOM_DISTRIBUIDOR, DES_LOG = :pDES_LOG ' +
  'WHERE ' +
  'ID_DISTRIBUIDOR = :pID_DISTRIBUIDOR, ; ';
  Connection.ExecSQL(sSQL, [aDistribuidor.Codigo, aDistribuidor.Nome, aDistribuidor.Log, aDistribuidor.ID],
                    [ftInteger, ftString, ftString, ftInteger]);
  Result := True;
end;

function TDistribuidorVADAO.Delete(iID: Integer): Boolean;
var
  sSQL: String;
begin
  Result := False;
  sSQL := 'DELETE FROM ' + TABLENAME + ' WHERE ID_DISTRIBUIDOR = :pID_DISTRIBUIDOR;';
  Connection.ExecSQL(sSQL,[iID],[ftInteger]);
  Result := True;
end;

function TDistribuidorVADAO.FindByID(iID: Integer): TObjectList<TDistribuidorVA>;
var
  FDQuery: TFDQuery;
  produtos: TObjectList<TDistribuidorVA>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    if iID >= 0 then
    begin
      FDQuery.SQL.Add('WHERE ID_DISTRIBUIDOR = :pID_DISTRIBUIDOR');
      FDQuery.ParamByName('pID_DISTRIBUIDOR').AsInteger := iID;
    end;
    FDQuery.Open();
    produtos := TObjectList<TDistribuidorVA>.Create();
    while not FDQuery.Eof do
    begin
      produtos.Add(TDistribuidorVA.Create(FDQuery.FieldByName('ID_DISTRIBUIDOR').AsInteger,
                 FDQuery.FieldByName('COD_DISTRIBUIDOR').AsInteger, FDQuery.FieldByName('NOM_DISTRIBUIDOR').AsString,
                 FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := produtos;
end;

function TDistribuidorVADAO.FindByCodigo(iCodigo: Integer): TObjectList<TDistribuidorVA>;
var
  FDQuery: TFDQuery;
  produtos: TObjectList<TDistribuidorVA>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE COD_DISTRIBUIDOR = :pCOD_DISTRIBUIDOR');
    FDQuery.ParamByName('pCOD_DISTRIBUIDOR').AsInteger := iCodigo;
    FDQuery.Open();
    produtos := TObjectList<TDistribuidorVA>.Create();
    while not FDQuery.Eof do
    begin
      produtos.Add(TDistribuidorVA.Create(FDQuery.FieldByName('ID_DISTRIBUIDOR').AsInteger,
                 FDQuery.FieldByName('COD_DISTRIBUIDOR').AsInteger, FDQuery.FieldByName('NOM_DISTRIBUIDOR').AsString,
                 FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := produtos;
end;

end.
