unit DAO.EstoqueVA;

interface

uses DAO.Base, Model.EstoqueVA, Generics.Collections, System.Classes;

type
  TInventarioProdutosVADAO = class(TDAO)
  public
    function Insert(aEstoque: TEstoqueVA): Boolean;
    function Update(aEstoque: TEstoqueVA): Boolean;
    function Delete(iID: Integer): Boolean;
    function FindByID(iID: Integer): TObjectList<TEstoqueVA>;
    function FindByProduto(iProduto: Integer): TObjectList<TEstoqueVA>;
    function FindByData(dtData: TDate): TObjectList<TEstoqueVA>;
  end;
const
  TABLENAME = 'va_EstoqueVA';


implementation

uses System.SysUtils, FireDAC.Comp.Client, Data.DB;

{ TInventarioProdutosVADAO }

function TInventarioProdutosVADAO.Delete(iID: Integer): Boolean;
var
  sSQL: String;
begin
  Result := False;
  sSQL := 'DELETE FROM ' + TABLENAME + ' WHERE ID_ESTOQUE = :pID_ESTOQUE;';
  Connection.ExecSQL(sSQL,[iID],[ftInteger]);
  Result := True;
end;

function TInventarioProdutosVADAO.FindByData(dtData: TDate): TObjectList<TEstoqueVA>;
var
  FDQuery: TFDQuery;
  estoques: TObjectList<TEstoqueVA>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE DAT_ESTOQUE = :pDAT_ESTOQUE');
    FDQuery.ParamByName('pDAT_ESTOQUE').AsDate := dtData;
    FDQuery.Open();
    estoques := TObjectList<TEstoqueVA>.Create();
    while not FDQuery.Eof do
    begin
      estoques.Add(TEstoqueVA.Create(FDQuery.FieldByName('ID_ESTOQUE').AsInteger,
                 FDQuery.FieldByName('ID_PRODUTO').AsInteger, FDQuery.FieldByName('DAT_ESTOQUE').AsDateTime,
                 FDQuery.FieldByName('QTD_ESTOQUE').AsFloat, FDQuery.FieldByName('VAL_UNITARIO').AsFloat,
                 FDQuery.FieldByName('VAL_TOTAL').AsFloat, FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := estoques;
end;

function TInventarioProdutosVADAO.FindByID(iID: Integer): TObjectList<TEstoqueVA>;
var
  FDQuery: TFDQuery;
  estoques: TObjectList<TEstoqueVA>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE ID_ESTOQUE = :pID_ESTOQUE');
    FDQuery.ParamByName('pID_ESTOQUE').AsInteger := iID;
    FDQuery.Open();
    estoques := TObjectList<TEstoqueVA>.Create();
    while not FDQuery.Eof do
    begin
      estoques.Add(TEstoqueVA.Create(FDQuery.FieldByName('ID_ESTOQUE').AsInteger,
                 FDQuery.FieldByName('ID_PRODUTO').AsInteger, FDQuery.FieldByName('DAT_ESTOQUE').AsDateTime,
                 FDQuery.FieldByName('QTD_ESTOQUE').AsFloat, FDQuery.FieldByName('VAL_UNITARIO').AsFloat,
                 FDQuery.FieldByName('VAL_TOTAL').AsFloat, FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := estoques;
end;

function TInventarioProdutosVADAO.FindByProduto(iProduto: Integer): TObjectList<TEstoqueVA>;
var
  FDQuery: TFDQuery;
  estoques: TObjectList<TEstoqueVA>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE ID_PRODUTO = :pID_PRODUTO');
    FDQuery.ParamByName('pID_PRODUTO').AsInteger := iProduto;
    FDQuery.Open();
    estoques := TObjectList<TEstoqueVA>.Create();
    while not FDQuery.Eof do
    begin
      estoques.Add(TEstoqueVA.Create(FDQuery.FieldByName('ID_ESTOQUE').AsInteger,
                 FDQuery.FieldByName('ID_PRODUTO').AsInteger, FDQuery.FieldByName('DAT_ESTOQUE').AsDateTime,
                 FDQuery.FieldByName('QTD_ESTOQUE').AsFloat, FDQuery.FieldByName('VAL_UNITARIO').AsFloat,
                 FDQuery.FieldByName('VAL_TOTAL').AsFloat, FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := estoques;
end;

function TInventarioProdutosVADAO.Insert(aEstoque: TEstoqueVA): Boolean;
var
  sSQL: String;
begin
  Result := False;
  aEstoque.ID := GetKeyValue(TABLENAME,'ID_ESTOQUE');
  sSQL := 'INSERT INTO ' + TABLENAME + ' (' +
  'ID_ESTOQUE, ID_PRODUTO, DAT_ESTOQUE, QTD_ESTOQUE, VAL_UNITARIO, VAL_ESTOQUE, DES_LOG) ' +
  'VALUE (' +
  ':pID_ESTOQUE, :pID_PRODUTO, :pDAT_ESTOQUE, :pQTD_ESTOQUE, :pVAL_UNITARIO, :pVAL_ESTOQUE,  :pDES_LOG); ';
  Connection.ExecSQL(sSQL, [aEstoque.ID, aEstoque.Produto, aEstoque.Data, aEstoque.Qtde, aEstoque.Unitario, aEstoque.Total,
                     aEstoque.Log], [ftInteger, ftInteger, ftDate, ftFloat, ftFloat, ftFloat, ftString]);
  Result := True;
end;

function TInventarioProdutosVADAO.Update(aEstoque: TEstoqueVA): Boolean;
var
  sSQL: String;
begin
  Result := False;
  sSQL := 'UPDATE ' + TABLENAME + ' SET ' +
  'ID_PRODUTO = :pID_PRODUTO, DAT_ESTOQUE = :pDAT_ESTOQUE, ' +
  'QTD_ESTOQUE = :pQTD_ESTOQUE, VAL_UNITARIO = :pVAL_UNITARIO, VAL_ESTOQUE = :pVAL_ESTOQUE, DES_LOG = :pDES_LOG ' +
  'WHERE ID_ESTOQUE = :pID_ESTOQUE;';
  Connection.ExecSQL(sSQL, [aEstoque.Produto, aEstoque.Data, aEstoque.Qtde, aEstoque.Unitario, aEstoque.Total,
                     aEstoque.Log, aEstoque.ID], [ftInteger, ftDate, ftFloat, ftFloat, ftFloat, ftString, ftInteger]);
  Result := True;
end;

end.
