unit DAO.ConsumoInsumos;

interface

uses DAO.base, Model.ConsumoInsumos, Generics.Collections, System.Classes;

type TConsumoInsumosDAO = class(TDAO)
public
  function Insert(aConsumo: Model.ConsumoInsumos.TConsumoInsumos): Boolean;
  function Update(aConsumo: Model.ConsumoInsumos.TConsumoInsumos): Boolean;
  function Delete(sFiltro: String): Boolean;
  function FindConsumo(sFiltro: String): TObjectList<Model.ConsumoInsumos.TConsumoInsumos>;
  function TotalConsumo(iID: Integer): Double;
end;

const
  TABLENAME = 'tbconsumoinsumos';

implementation

uses System.SysUtils, FireDAC.Comp.Client, Data.DB;

function TConsumoInsumosDAO.Insert(aConsumo: TConsumoInsumos): Boolean;
var
  sSQL: String;
begin
  Result := False;
  aConsumo.ID := GetKeyValue(TABLENAME, 'ID_CONSUMO');
  sSQL := 'INSERT INTO ' + TABLENAME + ' ' +
          '(ID_CONSUMO, ID_INSUMO, DES_PLACA, DAT_CONSUMO, QTD_KM_CONSUMO, ID_CONTROLE, QTD_CONSUMO, VAL_CONSUMO, ' +
          'DOM_ESTOQUE, DES_LOG) ' +
          'VALUES ' +
          '(:ID, :INSUMO, :PLACA, :DATA, :KM, :CONTROLE, :CONSUMO, :VALOR, :ESTOQUE, :LOG);';

  Connection.ExecSQL(sSQL,[aConsumo.ID, aConsumo.Insumo, aConsumo.Placa, aConsumo.Data, aConsumo.KMConsumo, aConsumo.Controle,
                     aConsumo.Consumo, aConsumo.Valor, aConsumo.Estoque ,aConsumo.Log], [ftInteger, ftInteger, ftString, ftDate,
                     ftFloat, ftInteger, ftFloat, ftFloat, ftString, ftString]);
  Result := True;
end;

function TConsumoInsumosDAO.Update(aConsumo: TConsumoInsumos): Boolean;
var
  sSQL: String;
begin
  Result := False;
  sSQL := 'UPDATE  ' + TABLENAME + ' ' +
          'SET ' +
          'ID_INSUMO = :INSUMO, DES_PLACA = :PLACA, DAT_CONSUMO = :DATA, QTD_KM_CONSUMO = :KM, ' +
          'ID_CONTROLE = :CONTROLE, QTD_CONSUMO = :CONSUMO, VAL_CONSUMO = :VALOR, DOM_ESTOQUE = :ESTOQUE, DES_LOG = :LOG ' +
          'WHERE ID_CONSUMO = :ID;';
  Connection.ExecSQL(sSQL,[aConsumo.Insumo, aConsumo.Placa, aConsumo.Data, aConsumo.KMConsumo, aConsumo.Controle,
                     aConsumo.Consumo, aConsumo.Valor, aConsumo.Estoque, aConsumo.Log, aConsumo.ID], [ftInteger, ftString,
                     ftDate, ftFloat, ftInteger, ftFloat, ftFloat, ftString, ftString, ftInteger]);
  Result := True;
end;

function TConsumoInsumosDAO.Delete(sFiltro: string): Boolean;
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

function TConsumoInsumosDAO.FindConsumo(sFiltro: string): TObjectList<TConsumoInsumos>;
var
  FDQuery: TFDQuery;
  Extratos: TObjectList<TConsumoInsumos>;
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
    Extratos := TObjectList<TConsumoInsumos>.Create();
    while not FDQuery.Eof do
    begin
      Extratos.Add(TConsumoInsumos.Create(FDQuery.FieldByName('ID_CONSUMO').AsInteger, FDQuery.FieldByName('ID_INSUMO').AsInteger,
                   FDQuery.FieldByName('DES_PLACA').AsString, FDQuery.FieldByName('DAT_CONSUMO').AsDateTime,
                   FDQuery.FieldByName('QTD_KM_CONSUMO').AsFloat, FDQuery.FieldByName('ID_CONTROLE').AsInteger,
                   FDQuery.FieldByName('QTD_CONSUMO').AsFloat, FDQuery.FieldByName('VAL_CONSUMO').AsFloat,
                   FDQuery.FieldByName('DOM_ESTOQUE').AsString, FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := Extratos;
end;

function TConsumoInsumosDAO.TotalConsumo(iID: Integer): Double;
var
  FDQuery: TFDQuery;
begin
  Result := 0;
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT ID_CONTROLE, SUM(VAL_CONSUMO) AS TOTAL FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE ID_CONTROLE = :ID');
    FDQuery.ParamByName('ID').AsInteger := iID;
    FDQuery.Open();
    if not FDQuery.IsEmpty then Result := FDQuery.FieldByName('TOTAL').AsFloat;
    FDQuery.Close;
  finally
    FDQuery.Free;
  end;
end;


end.
