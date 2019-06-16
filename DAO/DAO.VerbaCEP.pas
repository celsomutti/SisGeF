unit DAO.VerbaCEP;

interface

uses DAO.Base, Model.VerbaCEP, Generics.Collections, System.Classes;

type
  TVerbaCEPDAO = class(TDAO)
  public
    function Insert(aVerbas: Model.VerbaCEP.TVerbaCEP): Boolean;
    function Update(aVerbas: Model.VerbaCEP.TVerbaCEP): Boolean;
    function Delete(sFiltro: String): Boolean;
    function FindVerba(sFiltro: String): TObjectList<Model.VerbaCEP.TVerbaCEP>;
  end;
const
  TABLENAME = 'tbverbacep';

implementation

uses System.SysUtils, FireDAC.Comp.Client, Data.DB;

function TVerbaCEPDAO.Insert(aVerbas: Model.VerbaCEP.TVerbaCEP): Boolean;
var
  sSQL : System.string;
begin
  Result := False;
  aVerbas.ID := GetKeyValue(TABLENAME,'ID_VERBA');
  sSQL := 'INSERT INTO ' + TABLENAME + ' '+
          '(ID_VERBA, NUM_CEP_INICIAL, NUM_CEP_FINAL, VAL_VERBA, COD_GRUPO, ID_FAIXA, DES_LOG) ' +
          'VALUES ' +
          '(:ID, :INICIO, :FINAL, :VERBA, :GRUPO, :FAIXA, :LOG);';
  Connection.ExecSQL(sSQL,[aVerbas.ID, aVerbas.CEPInicial, aVerbas.CEPFinal, aVerbas.Verba, aVerbas.Grupo, aVerbas.Faixa,
                           aVerbas.Log], [ftInteger, ftString, ftString, ftFloat, ftInteger, ftInteger, ftString]);
  Result := True;
end;

function TVerbaCEPDAO.Update(aVerbas: Model.VerbaCEP.TVerbaCEP): Boolean;
var
  sSQL: System.string;
begin
  Result := False;
  sSQL := 'UPDATE ' + TABLENAME + ' ' +
          'SET ' +
          'NUM_CEP_INICIAL = :INICIO, NUM_CEP_FINAL = :FINAL, VAL_VERBA = :VERBA, COD_GRUPO = :GRUPO, ID_FAIXA = :FAIXA, ' +
          'DES_LOG = :LOG ' +
          'WHERE ID_VERBA = :ID;';
  Connection.ExecSQL(sSQL,[aVerbas.CEPInicial, aVerbas.CEPFinal, aVerbas.Verba, aVerbas.Grupo, aVerbas.Faixa, aVerbas.Log,
                           aVerbas.ID],[ftString, ftString, ftFloat, ftInteger, ftInteger, ftString, ftInteger]);
  Result := True;
end;

function TVerbaCEPDAO.Delete(sFiltro: string): Boolean;
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

function TVerbaCEPDAO.FindVerba(sFiltro: string): TObjectList<Model.VerbaCEP.TVerbaCEP>;
var
  FDQuery: TFDQuery;
  verbas: TObjectList<Model.VerbaCEP.TVerbaCEP>;
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
    verbas := TObjectList<Model.VerbaCEP.TVerbaCEP>.Create();
    while not FDQuery.Eof do
    begin
      verbas.Add(TVerbaCEP.Create(FDQuery.FieldByName('ID_VERBA').AsInteger, FDQuery.FieldByName('NUM_CEP_INICIAL').AsString,
                 FDQuery.FieldByName('NUM_CEP_FINAL').AsString, FDQuery.FieldByName('VAL_VERBA').AsFloat,
                 FDQuery.FieldByName('COD_GRUPO').AsInteger, FDQuery.FieldByName('ID_FAIXA').AsInteger,
                 FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
    Result := verbas;
  finally
    FDQuery.Free;
  end;
end;

end.
