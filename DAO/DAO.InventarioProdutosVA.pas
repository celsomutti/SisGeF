unit DAO.InventarioProdutosVA;

interface

uses DAO.Base, Model.InventarioProdutosVA, Generics.Collections, System.Classes;

type
  TInventarioProdutosVADAO = class(TDAO)
  public
    function Insert(aInventarios: TInventarioProdutosVA): Boolean;
    function Update(aInventarios: TInventarioProdutosVA): Boolean;
    function Delete(iID: Integer): Boolean;
    function FindByID(iID: Integer): TObjectList<TInventarioProdutosVA>;
    function FindByInventario(iProduto: Integer; dtData: TDate; iBanca: Integer): TObjectList<TInventarioProdutosVA>;
    function FindByData(dtData: TDate): TObjectList<TInventarioProdutosVA>;
  end;
const
  TABLENAME = 'va_inventarioProdutos';

implementation

uses System.SysUtils, FireDAC.Comp.Client, Data.DB;

function TInventarioProdutosVADAO.Insert(aInventarios: TInventarioProdutosVA): Boolean;
var
  sSQL: String;
begin
  Result := False;
  aInventarios.ID := GetKeyValue(TABLENAME,'ID_INVENTARIO');
  sSQL := 'INSERT INTO ' + TABLENAME + ' (' +
  'ID_INVENTARIO, ID_PRODUTO, DAT_INVENTARIO, QTD_PRODUTO, DES_LOG) ' +
  'VALUE (' +
  ':pID_INVENTARIO, :pID_PRODUTO, :pDAT_INVENTARIO, :pQTD_PRODUTO, :pDES_LOG); ';
  Connection.ExecSQL(sSQL, [aInventarios.ID, aInventarios.Produto, aInventarios.Data, aInventarios.Qtde,
                     aInventarios.Log], [ftInteger, ftInteger, ftInteger, ftDate, ftFloat, ftString]);
  Result := True;
end;

function TInventarioProdutosVADAO.Update(aInventarios: TInventarioProdutosVA): Boolean;
var
  sSQL: String;
begin
  Result := False;
  sSQL := 'UPDATE ' + TABLENAME + ' SET ' +
  'ID_PRODUTO = :pID_PRODUTO, DAT_INVENTARIO = :pDAT_INVENTARIO, ' +
  'QTD_PRODUTO = :pQTD_PRODUTO, DES_LOG = :pDES_LOG ' +
  'WHERE ID_INVENTARIO = :pID_INVENTARIO;';
  Connection.ExecSQL(sSQL, [aInventarios.Produto, aInventarios.Data, aInventarios.Qtde,
                     aInventarios.Log, aInventarios.ID], [ftInteger, ftInteger, ftDate, ftFloat, ftString, ftInteger]);
  Result := True;
end;

function TInventarioProdutosVADAO.Delete(iID: Integer): Boolean;
var
  sSQL: String;
begin
  Result := False;
  sSQL := 'DELETE FROM ' + TABLENAME + ' WHERE ID_INVENTARIO = :pID_INVENTARIO;';
  Connection.ExecSQL(sSQL,[iID],[ftInteger]);
  Result := True;
end;

function TInventarioProdutosVADAO.FindByID(iID: Integer): TObjectList<TInventarioProdutosVA>;
var
  FDQuery: TFDQuery;
  inventarios: TObjectList<TInventarioProdutosVA>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE ID_INVENTARIO = :pID_INVENTARIO');
    FDQuery.ParamByName('pID_INVENTARIO').AsInteger := iID;
    FDQuery.Open();
    inventarios := TObjectList<TInventarioProdutosVA>.Create();
    while not FDQuery.Eof do
    begin
      inventarios.Add(TInventarioProdutosVA.Create(FDQuery.FieldByName('ID_INVENTARIO').AsInteger,
                 FDQuery.FieldByName('ID_PRODUTO').AsInteger, FDQuery.FieldByName('DAT_INVENTARIO').AsDateTime,
                 FDQuery.FieldByName('QTD_PRODUTO').AsFloat, FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := inventarios;
end;

function TInventarioProdutosVADAO.FindByInventario(iProduto: Integer; dtData: TDate; iBanca: Integer):
                                                  TObjectList<TInventarioProdutosVA>;
var
  FDQuery: TFDQuery;
  inventarios: TObjectList<TInventarioProdutosVA>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE ID_PRODUTO = :pID_PRODUTO AND DAT_INVENTARIO = :pDAT_INVENTARIO AND COD_BANCA = :pCOD_BANCA');
    FDQuery.ParamByName('pID_PRODUTO').AsInteger := iProduto;
    FDQuery.ParamByName('pDAT_INVENTARIO').AsDate := dtData;
    FDQuery.ParamByName('pCOD_BANCA').AsInteger := iBanca;
    FDQuery.Open();
    inventarios := TObjectList<TInventarioProdutosVA>.Create();
    while not FDQuery.Eof do
    begin
      inventarios.Add(TInventarioProdutosVA.Create(FDQuery.FieldByName('ID_INVENTARIO').AsInteger,
                 FDQuery.FieldByName('ID_PRODUTO').AsInteger, FDQuery.FieldByName('DAT_INVENTARIO').AsDateTime,
                 FDQuery.FieldByName('QTD_PRODUTO').AsFloat, FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := inventarios;
end;

function TInventarioProdutosVADAO.FindByData(dtData: TDate): TObjectList<TInventarioProdutosVA>;
var
  FDQuery: TFDQuery;
  inventarios: TObjectList<TInventarioProdutosVA>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE DAT_INVENTARIO = :pDAT_INVENTARIO');
    FDQuery.ParamByName('pDAT_INVENTARIO').AsDate := dtData;
    FDQuery.Open();
    inventarios := TObjectList<TInventarioProdutosVA>.Create();
    while not FDQuery.Eof do
    begin
      inventarios.Add(TInventarioProdutosVA.Create(FDQuery.FieldByName('ID_INVENTARIO').AsInteger,
                 FDQuery.FieldByName('ID_PRODUTO').AsInteger, FDQuery.FieldByName('DAT_INVENTARIO').AsDateTime,
                 FDQuery.FieldByName('QTD_PRODUTO').AsFloat, FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := inventarios;
end;

end.
