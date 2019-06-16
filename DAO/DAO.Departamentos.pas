unit DAO.Departamentos;

interface

uses DAO.Base, Model.Departamentos, Generics.Collections, System.Classes;

type
  TDepartamentosDAO = class(TDAO)
  public
    function Insert(aDepartamentos: Model.Departamentos.TDepartamentos): Boolean;
    function Update(aDepartamentos: Model.Departamentos.TDepartamentos): Boolean;
    function Delete(sFiltro: String): Boolean;
    function FindDepartamento(sFiltro: String): TObjectList<Model.Departamentos.TDepartamentos>;
  end;
const
  TABLENAME = 'cad_departamentos';

implementation

uses System.SysUtils, FireDAC.Comp.Client, Data.DB;

function TDepartamentosDAO.Insert(aDepartamentos: TDepartamentos): Boolean;
var
  sSQL : System.string;
begin
  Result := False;
  aDepartamentos.Codigo := GetKeyValue(TABLENAME, 'COD_DEPARTAMENTO');
  sSQL := 'INSERT INTO ' + TABLENAME + ' '+
          '(COD_DEPARTAMENTO, DES_DEPARTAMENTO, DES_LOG) ' +
          'VALUES ' +
          '(:CODIGO, :DESCRICAO, :LOG);';
  Connection.ExecSQL(sSQL,[aDepartamentos.Codigo, aDepartamentos.Descricao, aDepartamentos.Log],
                          [ftInteger, ftString, ftString]);
  Result := True;
end;

function TDepartamentosDAO.Update(aDepartamentos: TDepartamentos): Boolean;
var
  sSQL: System.string;
begin
  Result := False;
  sSQL := 'UPDATE ' + TABLENAME + ' ' +
          'SET ' +
          'DES_DEPARTAMENTO  = :DESCRICAO, DES_LOG = :LOG ' +
          'WHERE COD_DEPARTAMENTO = :CODIGO;';
  Connection.ExecSQL(sSQL,[aDepartamentos.Descricao, aDepartamentos.Log, aDepartamentos.Codigo],
                          [ftString, ftString, ftInteger]);
  Result := True;
end;

function TDepartamentosDAO.Delete(sFiltro: string): Boolean;
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

function TDepartamentosDAO.FindDepartamento(sFiltro: string): TObjectList<Model.Departamentos.TDepartamentos>;
var
  FDQuery: TFDQuery;
  departamentos: TObjectList<TDepartamentos>;
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
    departamentos := TObjectList<TDepartamentos>.Create();
    while not FDQuery.Eof do
    begin
      departamentos.Add(TDepartamentos.Create(FDQuery.FieldByName('COD_DEPARTAMENTO').AsInteger,
                                              FDQuery.FieldByName('DES_DEPARTAMENTO').AsString,
                                              FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := departamentos;
end;

end.
