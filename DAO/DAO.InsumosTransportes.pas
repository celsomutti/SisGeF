unit DAO.InsumosTransportes;

interface

uses DAO.base, Model.InsumosTransportes, Generics.Collections, System.Classes;

type
  TInsumosTransportesDAO = class(TDAO)
  public
    function Insert(aInsumos: Model.InsumosTransportes.TInsumosTransportes): Boolean;
    function Update(aInsumos: Model.InsumosTransportes.TInsumosTransportes): Boolean;
    function Delete(sFiltro: String): Boolean;
    function FindInsumo(sFiltro: String): TObjectList<Model.InsumosTransportes.TInsumosTransportes>;
  end;

CONST
  TABLENAME = 'tbinsumostransportes';

implementation

uses System.SysUtils, FireDAC.Comp.Client, Data.DB;

function TInsumosTransportesDAO.Insert(aInsumos: TInsumosTransportes): Boolean;
var
  sSQL: String;
begin
  Result := False;
  aInsumos.ID := GetKeyValue(TABLENAME, 'ID_INSUMO');
  sSQL := 'INSERT INTO ' + TABLENAME + ' ' +
          '(ID_INSUMO, DES_INSUMO, DES_UNIDADE, DES_LOG) ' +
          'VALUES ' +
          '(:ID, :DESCRICAO, :UNIDADE, :LOG);';
  Connection.ExecSQL(sSQL,[aInsumos.ID, aInsumos.Descricao, aInsumos.Unidade, aInsumos.Log],[ftInteger, ftString, ftString,
                     ftString]);
  Result := True;
end;

function TInsumosTransportesDAO.Update(aInsumos: TInsumosTransportes): Boolean;
var
  sSQL: String;
begin
  Result := False;
  sSQL := 'UPDATE ' + TABLENAME + ' ' +
          'SET ' +
          'DES_INSUMO = :DESCRICAO, DES_UNIDADE = :UNIDADE, DES_LOG = :LOG WHERE ID_INSUMO = :ID;';
  Connection.ExecSQL(sSQL,[aInsumos.Descricao, aInsumos.Unidade, aInsumos.Log, aInsumos.ID],[ftString, ftString, ftString,
                     ftInteger]);
  Result := True;
end;

function TInsumosTransportesDAO.Delete(sFiltro: string): Boolean;
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

function TInsumosTransportesDAO.FindInsumo(sFiltro: string): TObjectList<TInsumosTransportes>;
var
  FDQuery: TFDQuery;
  Extratos: TObjectList<TInsumosTransportes>;
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
    Extratos := TObjectList<TInsumosTransportes>.Create();
    while not FDQuery.Eof do
    begin
      Extratos.Add(TInsumosTransportes.Create(FDQuery.FieldByName('ID_INSUMO').AsInteger,
                   FDQuery.FieldByName('DES_INSUMO').AsString, FDQuery.FieldByName('DES_UNIDADE').AsString,
                   FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := Extratos;
end;


end.
