unit DAO.FaixaPeso;

interface

uses DAO.Base, Model.FaixaPeso, Generics.Collections, System.Classes;

type
  TFaixaPesoDAO = class(TDAO)
  public
    function Insert(aFaixas: Model.FaixaPeso.TFaixaPeso): Boolean;
    function Update(aFaixas: Model.FaixaPeso.TFaixaPeso): Boolean;
    function Delete(sFiltro: String): Boolean;
    function FindFaixa(sFiltro: String): TObjectList<Model.FaixaPeso.TFaixaPeso>;
  end;
const
    TABLENAME = 'tbfaixapeso';

implementation

uses System.SysUtils, FireDAC.Comp.Client, Data.DB;

function TFaixaPesoDAO.Insert(aFaixas: TFaixaPeso): Boolean;
var
  sSQL : System.string;
begin
  Result := False;
  aFaixas.ID := GetKeyValue(TABLENAME,'ID_VERBA');
  sSQL := 'INSERT INTO ' + TABLENAME + ' '+
          '(ID_VERBA, QTD_PESO_INICIAL, QTD_PESO_FINAL, DES_LOG) ' +
          'VALUES ' +
          '(:ID, :INICIAL, :FINAL, :LOG);';
  Connection.ExecSQL(sSQL,[aFaixas.ID, aFaixas.PesoInicial, aFaixas.PesoFinal, aFaixas.Log],
                          [ftInteger, ftFloat, ftFloat, ftString]);
  Result := True;
end;

function TFaixaPesoDAO.Update(aFaixas: TFaixaPeso): Boolean;
var
  sSQL: System.string;
begin
  Result := False;
  sSQL := 'UPDATE ' + TABLENAME + ' ' +
          'SET ' +
          'QTD_PESO_INICIAL = :INICIAL, QTD_PESO_FINAL = :FINAL, DES_LOG = :LOG ' +
          'WHERE ID_VERBA = :ID;';
  Connection.ExecSQL(sSQL,[aFaixas.PesoInicial, aFaixas.PesoFinal, aFaixas.Log, aFaixas.ID],
                          [ftFloat, ftFloat, ftString, ftInteger]);
  Result := True;
end;

function TFaixaPesoDAO.Delete(sFiltro: string): Boolean;
var
  sSQL : String;
begin
  Result := False;
  sSQL := 'DELETE FROM ' + TABLENAME + ' ';
  if not sFiltro.IsEmpty then
  begin
    sSQl := sSQL + sFiltro;
  end
  else
  begin
    Exit;
  end;
  Connection.ExecSQL(sSQL);
  Result := True;
end;

function TFaixaPesoDAO.FindFaixa(sFiltro: string): TObjectList<Model.FaixaPeso.TFaixaPeso>;
var
  FDQuery: TFDQuery;
  faixas: TObjectList<TFaixaPeso>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    if not sFiltro.IsEmpty then
    begin
      FDQuery.SQL.Add(sFiltro);
    end;
    FDQuery.Open();
    faixas := TObjectList<TFaixaPeso>.Create();
    while not FDQuery.Eof do
    begin
      faixas.Add(TFaixaPeso.Create(FDQuery.FieldByName('ID_VERBA').AsInteger, FDQuery.FieldByName('QTD_PESO_INICIAL').AsFloat,
                 FDQuery.FieldByName('QTD_PESO_FINAL').AsFloat, FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := faixas;
end;


end.
