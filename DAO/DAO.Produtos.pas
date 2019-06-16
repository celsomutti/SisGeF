unit DAO.Produtos;

interface

uses DAO.Base, Generics.Collections, System.Classes, Model.Produtos;

type
  TProdutosDAO = class(TDAO)
  public
    function Insert(aProdutos: TProdutos): Boolean;
    function Update(aProdutos: TProdutos): Boolean;
    function Delete(sCodigo: String): Boolean;
    function FindByCodigo(sCodigo: String): TObjectList<TProdutos>;
    function FindByDescricao(sDescricao: String): TObjectList<TProdutos>;
    function FindField(sCampo: String; sCodigo: String): String;
  end;
const
  TABLENAME = 'jor_produtos';

implementation

uses System.SysUtils, FireDAC.Comp.Client, Data.DB;

function TProdutosDAO.Insert(aProdutos: TProdutos): Boolean;
var
  sSQL : System.string;
begin
  Result := False;
  sSQL := 'INSERT INTO ' + TABLENAME + ' '+
          '(COD_PRODUTO, DES_PRODUTO, DOM_DIARIO, DES_LOG) ' +
          'VALUES ' +
          '(:CODIGO, :DESCRICAO, :DIARIO , :LOG);';
  Connection.ExecSQL(sSQL,[aProdutos.Codigo, aProdutos.Descricao, aProdutos.Diario, aProdutos.Log],
                          [ftString, ftString, ftString, ftString]);
  Result := True;
end;

function TProdutosDAO.Update(aProdutos: TProdutos): Boolean;
var
  sSQL : System.string;
begin
  Result := False;
  sSQL := 'UPDATE ' + TABLENAME + ' SET '+
          'DES_PRODUTO = :DESCRICAO, DOM_DIADIO = :DIARIO, DES_LOG = :LOG ' +
          'WHERE ' +
          'COD_PRODUTO = :CODIGO';
  Connection.ExecSQL(sSQL,[aProdutos.Descricao, aProdutos.Diario, aProdutos.Log, aProdutos.Codigo],
                          [ftString, ftString, ftString, ftString]);
  Result := True;
end;

function TProdutosDAO.Delete(sCodigo: string): Boolean;
var
  sSQL : String;
begin
  Result := False;
  sSQL := 'DELETE FROM ' + TABLENAME + ' WHERE COD_PRODUTO = :CODIGO;';
  Connection.ExecSQL(sSQL,[sCodigo],[ftString]);
  Result := True;
end;

function TProdutosDAO.FindByCodigo(sCodigo: string): TObjectList<TProdutos>;
var
  FDQuery: TFDQuery;
  produtos: TObjectList<TProdutos>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE COD_PRODUTO = :CODIGO');
    FDQuery.ParamByName('CODIGO').AsString := sCodigo;
    FDQuery.Open();
    produtos := TObjectList<TProdutos>.Create();
    while not FDQuery.Eof do
    begin
      produtos.Add(TProdutos.Create(FDQuery.FieldByName('COD_PRODUTO').AsString,
                                       FDQuery.FieldByName('DES_PRODUTO').AsString,
                                       FDQuery.FieldByName('DOM_DIARIO').AsString,
                                       FDQuery.FieldByName('DES_LOG').AsString));

      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := produtos;
end;

function  TProdutosDAO.FindByDescricao(sDescricao: string): TObjectList<TProdutos>;
var
  FDQuery: TFDQuery;
  modalidades: TObjectList<TProdutos>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    if not sDescricao.IsEmpty then
    begin
      FDQuery.SQL.Add('WHERE DES_PRODUTO LIKE :DESCRICAO');
      FDQuery.ParamByName('DESCRICAO').AsString := sDescricao;
    end;
    FDQuery.Open();
    modalidades := TObjectList<TProdutos>.Create();
    while not FDQuery.Eof do
    begin
      modalidades.Add(TProdutos.Create(FDQuery.FieldByName('COD_PRODUTO').AsString,
                                       FDQuery.FieldByName('DES_PRODUTO').AsString,
                                       FDQuery.FieldByName('DOM_DIARIO').AsString,
                                       FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := modalidades;
end;

function TProdutosDAO.FindField(sCampo: string; sCodigo: string): String;
var
  FDQuery: TFDQuery;
begin
  Result := '';
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT ' + sCampo + ' FROM ' + TABLENAME + ' WHERE COD_PRODUTO = :CODIGO');
    FDQuery.ParamByName('CODIGO').AsString := sCodigo;
    FDQuery.Open();
    if FDQuery.IsEmpty then
    begin
      Exit;
    end;
    Result := FDQuery.FieldByName(sCampo).AsString;
  finally
    FDQuery.Free;
  end;
end;

end.
