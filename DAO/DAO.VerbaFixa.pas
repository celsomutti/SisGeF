unit DAO.VerbaFixa;

interface

uses DAO.Base, Model.VerbaFixa, Generics.Collections, System.Classes;

type
  TVerbaFixaDAO = class(TDAO)
  public
    function Insert(aVerbas: Model.VerbaFixa.TVerbaFixa): Boolean;
    function Update(aVerbas: Model.VerbaFixa.TVerbaFixa): Boolean;
    function Delete(sFiltro: String): Boolean;
    function FindVerba(sFiltro: String): TObjectList<Model.VerbaFixa.TVerbaFixa>;
    function RetornaVerba(iGrupo: Integer; dtData: TDate): Double;
  end;
const
  TABLENAME = 'tbverbafixa';

implementation

uses System.SysUtils, FireDAC.Comp.Client, Data.DB;

function TVerbaFixaDAO.Insert(aVerbas: TVerbaFixa): Boolean;
var
  sSQL : System.string;
begin
  Result := False;
  aVerbas.ID := GetKeyValue(TABLENAME,'ID_VERBA_FIXA');
  sSQL := 'INSERT INTO ' + TABLENAME + ' '+
          '(ID_VERBA_FIXA, ID_GRUPO, DAT_VERBA_FIXA, DES_VERBA_FIXA, VAL_VERBA_FIXA, DOM_ATIVO, DES_LOG) ' +
          'VALUES ' +
          '(:ID, :GRUPO, :DATA, :DESCRICAO, :VALOR, :ATIVO, :LOG);';
  Connection.ExecSQL(sSQL,[aVerbas.ID, aVerbas.Grupo, aVerbas.Data, aVerbas.Descricao, aVerbas.Valor, aVerbas.Ativo, aVerbas.Log],
                          [ftInteger, ftInteger, ftDate, ftString, ftFloat, ftInteger, ftString]);
  Result := True;
end;

function TVerbaFixaDAO.Update(aVerbas: TVerbaFixa): Boolean;
var
  sSQL: System.string;
begin
  Result := False;
  sSQL := 'UPDATE ' + TABLENAME + ' ' +
          'SET ' +
          'ID_GRUPO = :GRUPO, DAT_VERBA_FIXA = :DATA, DES_VERBA_FIXA = :DESCRICAO, VAL_VERBA_FIXA = :VALOR, DOM_ATIVO = :ATIVO, ' +
          'DES_LOG = :LOG ' +
          'WHERE ID_VERBA_FIXA = :ID;';
  Connection.ExecSQL(sSQL,[aVerbas.Grupo, aVerbas.Data, aVerbas.Descricao, aVerbas.Valor, aVerbas.Ativo, aVerbas.Log, aVerbas.ID],
                          [ftInteger, ftDate, ftString, ftFloat, ftInteger, ftString, ftInteger]);
  Result := True;
end;

function TVerbaFixaDAO.Delete(sFiltro: string): Boolean;
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

function TVerbaFixaDAO.FindVerba(sFiltro: string): TObjectList<Model.VerbaFixa.TVerbaFixa>;
var
  FDQuery: TFDQuery;
  verbas: TObjectList<TVerbaFixa>;
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
    verbas := TObjectList<TVerbaFixa>.Create();
    while not FDQuery.Eof do
    begin
      verbas.Add(TVerbafixa.Create(FDQuery.FieldByName('ID_VERBA_FIXA').AsInteger, FDQuery.FieldByName('ID_GRUPO').AsInteger,
                 FDQuery.FieldByName('DAT_VERBA_FIXA').AsDateTime,
                 FDQuery.FieldByName('DES_VERBA_FIXA').AsString, FDQuery.FieldByName('VAL_VERBA_FIXA').AsFloat,
                 FDQuery.FieldByName('DOM_ATIVO').AsInteger, FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := verbas;
end;

function TVerbaFixaDAO.RetornaVerba(iGrupo: Integer; dtData: TDate): Double;
var
  FDQuery: TFDQuery;
  sSQL : String;
  dValor : Double;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    dValor := 0;
    sSQL := 'SELECT DAT_VERBA_FIXA, VAL_VERBA_FIXA FROM ' + TABLENAME +
            ' WHERE ID_GRUPO = :GRUPO AND DAT_VERBA_FIXA <= :DATA ORDER BY DAT_VERBA_FIXA';
    FDQuery.Connection := Connection;
    FDQuery.Open(sSQL,[iGrupo, dtData],[ftInteger, ftDate]);
    if not FDQuery.IsEmpty then
    begin
      FDQuery.Last;
      dValor := FDQuery.FieldByName('VAL_VERBA_FIXA').AsFloat;
    end;
    Result := dValor;
  finally
    FDQuery.Free;
  end;
end;

end.
