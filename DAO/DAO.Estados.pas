unit DAO.Estados;

interface

uses DAO.Base, Model.Estados, Generics.Collections, System.Classes;

type
  TEstadosDAO = class(TDAO)
public
  function Insert(aEstados: TEstados): Boolean;
  function Update(aEstados: TEstados): Boolean;
  function Delete(sUF: String): Boolean;
  function FindByUF(sUF: String): TObjectList<Testados>;
end;
const
  TABLENAME = 'tbestados';

implementation

uses System.SysUtils, FireDAC.Comp.Client, Data.DB;

function TEstadosDAO.Insert(aEstados: TEstados): Boolean;
var
  sSQL : System.string;
begin
  Result := False;
  sSQL := 'INSERT INTO ' + TABLENAME + ' '+
          '(UF_ESTADO, NOM_ESTADO) ' +
          'VALUES ' +
          '(:UF, :NOME);';
  Connection.ExecSQL(sSQL,[aEstados.UF, aEstados.Nome],
                          [ftString, ftString]);
  Result := True;
end;

function TEstadosDAO.Update(aEstados: TEstados): Boolean;
var
  sSQL: System.string;
begin
  Result := False;
  sSQL := 'UPDATE ' + TABLENAME + ' ' +
          'SET ' +
          'NOM_ESTADO  = :NOME ' +
          'WHERE UF_ESTADO = :UF;';
  Connection.ExecSQL(sSQL,[aEstados.Nome, aEstados.UF],
                          [ftString, ftString]);
  Result := True;
end;

function TEstadosDAO.Delete(sUF: String): Boolean;
var
  sSQL : String;
begin
  Result := False;
  sSQL := 'DELETE FROM ' + TABLENAME + ' WHERE UF_ESTADO = :UF';

  Connection.ExecSQL(sSQL,[sUF],[ftString]);
  Result := True;
end;

function TEstadosDAO.FindByUF(sUF: string): TObjectList<TEstados>;
var
  FDQuery: TFDQuery;
  estados: TObjectList<TEstados>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    if sUF.IsEmpty then
    begin
      FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    end
    else
    begin
      FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME + ' WHERE UF_ESTADO = :UF');
      FDQuery.ParamByName('UF').AsString := sUF;
    end;
    FDQuery.Open();
    estados := TObjectList<TEstados>.Create();
    while not FDQuery.Eof do
    begin
      estados.Add(TEstados.Create(FDQuery.FieldByName('UF_ESTADO').AsString, FDQuery.FieldByName('NOM_ESTADO').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := estados;
end;

end.
