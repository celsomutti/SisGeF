unit DAO.ProdutosVA;

interface

uses DAO.Base, Model.ProdutosVA, Generics.Collections, System.Classes;

type
  TProdutosVADAO = class(TDAO)
  public
    function Insert(aProdutos: TProdutosVA): Boolean;
    function Update(aProdutos: TProdutosVA): Boolean;
    function Delete(iID: Integer): Boolean;
    function FindByID(iID: Integer): TObjectList<TProdutosVA>;
    function FindByCodigo(sCodigo: String): TObjectList<TProdutosVA>;
    function FindByBarras(sBarras: String): TObjectList<TProdutosVA>;
    function FindByEncalhe(sValor: String): TObjectList<TProdutosVA>;
  end;
const
  TABLENAME = 'va_produtos';

implementation

uses System.SysUtils, FireDAC.Comp.Client, Data.DB;

function TProdutosVADAO.Insert(aProdutos: TProdutosVA): Boolean;
var
  sSQL: String;
begin
  Result := False;
  aProdutos.ID := GetKeyValue(TABLENAME,'ID_PRODUTO');
  sSQL := 'INSERT INTO ' + TABLENAME + '(' +
  'ID_PRODUTO, COD_PRODUTO, DES_PRODUTO, QTD_PADRAO, DOM_DIARIO, VAL_COBRANCA, VAL_VENDA, COD_BARRAS, DES_LOG) ' +
  'VALUE (' +
  ':pID_PRODUTO, :pCOD_PRODUTO, :pDES_PRODUTO, :pQTD_PADRAO, :pDOM_DIARIO, :PVAL_COBRANCA, :PVAL_VENDA, :pCOD_BARRAS, :pDES_LOG); ';
  Connection.ExecSQL(sSQL, [aProdutos.ID, aProdutos.Codigo, aProdutos.Descricao, aProdutos.Padrao ,aProdutos.Diario,
                            aProdutos.Cobranca, aProdutos.Venda, aProdutos.Barras, aProdutos.Log],
                    [ftInteger, ftString, ftInteger, ftString, ftSmallint, ftFloat, ftFloat,  ftString, ftString]);
  Result := True;
end;

function TProdutosVADAO.Update(aProdutos: TProdutosVA): Boolean;
var
  sSQL: String;
begin
  Result := False;
  sSQL := 'UPDATE ' + TABLENAME + ' SET ' +
  'COD_PRODUTO = :pCOD_PRODUTO, DES_PRODUTO = :pDES_PRODUTO, QTD_PADRAO = :pQTD_PADRAO, DOM_DIARIO = :pDOM_DIARIO, ' +
  'VAL_COBRANCA = :PVAL_COBRANCA, VAL_VENDA = +PVAL_VENDA, COD_BARRAS = :pCOD_BARRAS, DES_LOG = :pDES_LOG ' +
  'WHERE ' +
  'ID_PRODUTO = :pID_PRODUTO.;';
  Connection.ExecSQL(sSQL, [aProdutos.Codigo, aProdutos.Descricao, aProdutos.Padrao, aProdutos.Diario, aProdutos.Cobranca, aProdutos.Venda, aProdutos.Barras,
                            aProdutos.Log, aProdutos.ID],
                            [ftString, ftString, ftInteger, ftSmallInt, ftFloat, ftFloat,  ftString, ftInteger]);
  Result := True;
end;

function TProdutosVADAO.Delete(iID: Integer): Boolean;
var
  sSQL: String;
begin
  Result := False;
  sSQL := 'DELETE FROM ' + TABLENAME + ' WHERE ID_PRODUTO = :pID_PRODUTO;';
  Connection.ExecSQL(sSQL,[iID],[ftInteger]);
  Result := True;
end;

function TProdutosVADAO.FindByID(iID: Integer): TObjectList<TProdutosVA>;
var
  FDQuery: TFDQuery;
  produtos: TObjectList<TProdutosVA>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE ID_PRODUTO = :pID_PRODUTO');
    FDQuery.ParamByName('pID_PRODUTO').AsInteger := iID;
    FDQuery.Open();
    produtos := TObjectList<TProdutosVA>.Create();
    while not FDQuery.Eof do
    begin
      produtos.Add(TProdutosVA.Create(FDQuery.FieldByName('ID_PRODUTO').AsInteger, FDQuery.FieldByName('COD_PRODUTO').AsString,
                 FDQuery.FieldByName('DES_PRODUTO').AsString, FDQuery.FieldByName('QTD_PADRAO').AsInteger,
                 FDQuery.FieldByName('DOM_DIARIO').AsInteger, FDQuery.FieldByName('VAL_COBRANCA').AsFloat, FDQuery.FieldByName('VAL_VENDA').AsFloat,
                 FDQuery.FieldByName('COD_BARRAS').AsString, FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := produtos;
end;

function TProdutosVADAO.FindByCodigo(sCodigo: string): TObjectList<TProdutosVA>;
var
  FDQuery: TFDQuery;
  produtos: TObjectList<TProdutosVA>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE COD_PRODUTO = :pCOD_PRODUTO');
    FDQuery.ParamByName('pCOD_PRODUTO').AsString := sCodigo;
    FDQuery.Open();
    produtos := TObjectList<TProdutosVA>.Create();
    while not FDQuery.Eof do
    begin
      produtos.Add(TProdutosVA.Create(FDQuery.FieldByName('ID_PRODUTO').AsInteger, FDQuery.FieldByName('COD_PRODUTO').AsString,
                 FDQuery.FieldByName('DES_PRODUTO').AsString, FDQuery.FieldByName('QTD_PADRAO').AsInteger,
                 FDQuery.FieldByName('DOM_DIARIO').AsInteger, FDQuery.FieldByName('VAL_COBRANCA').AsFloat, FDQuery.FieldByName('VAL_VENDA').AsFloat,
                 FDQuery.FieldByName('COD_BARRAS').AsString, FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := produtos;
end;

function TProdutosVADAO.FindByBarras(sBarras: string): TObjectList<TProdutosVA>;
var
  FDQuery: TFDQuery;
  produtos: TObjectList<TProdutosVA>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE COD_BARRAS = :pCOD_BARRAS');
    FDQuery.ParamByName('pCOD_BARRAS').AsString := sBarras;
    FDQuery.Open();
    produtos := TObjectList<TProdutosVA>.Create();
    while not FDQuery.Eof do
    begin
      produtos.Add(TProdutosVA.Create(FDQuery.FieldByName('ID_PRODUTO').AsInteger, FDQuery.FieldByName('COD_PRODUTO').AsString,
                 FDQuery.FieldByName('DES_PRODUTO').AsString, FDQuery.FieldByName('QTD_PADRAO').AsInteger,
                 FDQuery.FieldByName('DOM_DIARIO').AsInteger, FDQuery.FieldByName('VAL_COBRANCA').AsFloat, FDQuery.FieldByName('VAL_VENDA').AsFloat,
                 FDQuery.FieldByName('COD_BARRAS').AsString, FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := produtos;
end;

function TProdutosVADAO.FindByEncalhe(sValor: string): TObjectList<TProdutosVA>;
var
  FDQuery: TFDQuery;
  produtos: TObjectList<TProdutosVA>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE COD_BARRAS = :pCOD_BARRAS OR COD_PRODUTO LIKE :pCOD_PRODUTO OR DES_PRODUTO LIKE :pDES_PRODUTO');
    FDQuery.ParamByName('pCOD_BARRAS').AsString := sValor;
    FDQuery.ParamByName('pCOD_PRODUTO').AsString := '%' + sValor + '%';
    FDQuery.ParamByName('pDES_PRODUTO').AsString := '%' + sValor + '%';
    FDQuery.Open();
    produtos := TObjectList<TProdutosVA>.Create();
    while not FDQuery.Eof do
    begin
      produtos.Add(TProdutosVA.Create(FDQuery.FieldByName('ID_PRODUTO').AsInteger, FDQuery.FieldByName('COD_PRODUTO').AsString,
                 FDQuery.FieldByName('DES_PRODUTO').AsString, FDQuery.FieldByName('QTD_PADRAO').AsInteger,
                 FDQuery.FieldByName('DOM_DIARIO').AsInteger, FDQuery.FieldByName('VAL_COBRANCA').AsFloat, FDQuery.FieldByName('VAL_VENDA').AsFloat,
                 FDQuery.FieldByName('COD_BARRAS').AsString, FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := produtos;
end;

end.
