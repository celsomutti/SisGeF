unit DAO.ItensManutencao;

interface

uses DAO.base, Model.ItensManutencao, Generics.Collections, System.Classes;

type
  TItensManutencaoDAO = class(TDAO)
  public
    function Insert(aItens: Model.ItensManutencao.TItensManutencao): Boolean;
    function Update(aItens: Model.ItensManutencao.TItensManutencao): Boolean;
    function Delete(sFiltro: String): Boolean;
    function FindItem(sFiltro: String): TObjectList<Model.ItensManutencao.TItensManutencao>;
  end;

CONST
  TABLENAME = 'tbitensmanutencao';

implementation

uses System.SysUtils, FireDAC.Comp.Client, Data.DB;

function TItensManutencaoDAO.Insert(aItens: TItensManutencao): Boolean;
var
  sSQL: String;
begin
  Result := False;
  aItens.ID := GetKeyValue(TABLENAME, 'ID_ITEM');
  sSQL := 'INSERT INTO ' + TABLENAME + ' ' +
          '(ID_ITEM, DES_ITEM, ID_INSUMO, DES_LOG) ' +
          'VALUES ' +
          '(:ID, :DESCRICAO, :INSUMO, :LOG);';
  Connection.ExecSQL(sSQL,[aItens.ID, aItens.Descricao, aItens.Insumo, aItens.Log],[ftInteger, ftString, ftInteger,
                     ftString]);
  Result := True;
end;

function TItensManutencaoDAO.Update(aItens: TItensManutencao): Boolean;
var
  sSQL: String;
begin
  Result := False;
  sSQL := 'UPDATE ' + TABLENAME + ' ' +
          'SET ' +
          'DES_ITEM = :DESCRICAO, ID_INSUMO = :INSUMO, DES_LOG = :LOG WHERE ID_ITEM = :ID;';
  Connection.ExecSQL(sSQL,[aItens.Descricao, aItens.Insumo, aItens.Log, aItens.ID],[ftString, ftInteger, ftString,
                     ftInteger]);
  Result := True;
end;

function TItensManutencaoDAO.Delete(sFiltro: string): Boolean;
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
  Result := True;
end;

function TItensManutencaoDAO.FindItem(sFiltro: string): TObjectList<TItensManutencao>;
var
  FDQuery: TFDQuery;
  Extratos: TObjectList<TItensManutencao>;
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
    Extratos := TObjectList<TItensManutencao>.Create();
    while not FDQuery.Eof do
    begin
      Extratos.Add(TItensManutencao.Create(FDQuery.FieldByName('ID_ITEM').AsInteger,
                   FDQuery.FieldByName('DES_ITEM').AsString, FDQuery.FieldByName('ID_INSUMO').AsInteger,
                   FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := Extratos;
end;

end.
