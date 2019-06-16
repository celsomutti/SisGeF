unit DAO.FaixaVerba;

interface

uses DAO.Base, Model.FaixaVerba, Generics.Collections, System.Classes;

type
  TFaixaVerbaDAO = class(TDAO)
  public
    function Insert(aFaixas: Model.FaixaVerba.TFaixaVerba): Boolean;
    function Update(aFaixas: Model.FaixaVerba.TFaixaVerba): Boolean;
    function Delete(sFiltro: String): Boolean;
    function FindFaixa(sFiltro: String): TObjectList<Model.FaixaVerba.TFaixaVerba>;
  end;
const
    TABLENAME = 'tbfaixaverba';

implementation

uses System.SysUtils, FireDAC.Comp.Client, Data.DB;

function TFaixaVerbaDAO.Insert(aFaixas: TFaixaVerba): Boolean;
var
  sSQL : System.string;
begin
  Result := False;
  aFaixas.ID := GetKeyValue(TABLENAME,'ID_VERBA');
  sSQL := 'INSERT INTO ' + TABLENAME + ' '+
          '(ID_VERBA, ID_FAIXA, VAL_VERBA, DES_LOG) ' +
          'VALUES ' +
          '(:ID, :FAIXA, :VALOR, :LOG);';
  Connection.ExecSQL(sSQL,[aFaixas.ID, aFaixas.Faixa, aFaixas.Verba, aFaixas.Log],
                          [ftInteger, ftInteger, ftFloat, ftString]);
  Result := True;
end;

function TFaixaVerbaDAO.Update(aFaixas: TFaixaVerba): Boolean;
var
  sSQL: System.string;
begin
  Result := False;
  sSQL := 'UPDATE ' + TABLENAME + ' ' +
          'SET ' +
          'val_verba = :FINAL, DES_LOG = :LOG ' +
          'WHERE ID_VERBA = :ID AND ID_FAIXA = :FAIXA;';
  Connection.ExecSQL(sSQL,[aFaixas.Verba, aFaixas.Log, aFaixas.ID, aFaixas.Faixa],
                          [ftFloat, ftString, ftInteger, ftInteger]);
  Result := True;
end;

function TFaixaVerbaDAO.Delete(sFiltro: string): Boolean;
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

function TFaixaVerbaDAO.FindFaixa(sFiltro: string): TObjectList<Model.FaixaVerba.TFaixaVerba>;
var
  FDQuery: TFDQuery;
  faixas: TObjectList<TFaixaVerba>;
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
    faixas := TObjectList<TFaixaVerba>.Create();
    while not FDQuery.Eof do
    begin
      faixas.Add(TFaixaVerba.Create(FDQuery.FieldByName('ID_VERBA').AsInteger, FDQuery.FieldByName('ID_FAIXA').AsInteger,
                 FDQuery.FieldByName('VAL_VERBA').AsFloat, FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := faixas;
end;

end.
