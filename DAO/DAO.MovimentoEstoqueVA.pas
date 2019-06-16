unit DAO.MovimentoEstoqueVA;

interface

uses DAO.Base, Model.MovimentoEstoqueVA, Generics.Collections, System.Classes;

type
  TMovimentoEstoqueVADAO = class(TDAO)
  public
    function Insert(aMovimento: TMovimentoEstoqueVA): Boolean;
    function Update(amovimento: TMovimentoEstoqueVA): Boolean;
    function Delete(iID: Integer): Boolean;
    function FindByID(iID: Integer): TObjectList<TMovimentoEstoqueVA>;
    function FindByProduto(iProduto: Integer): TObjectList<TMovimentoEstoqueVA>;
    function FindByData(dtData: TDate): TObjectList<TMovimentoEstoqueVA>;
  end;
const
  TABLENAME = 'va_MovimentoEstoque';

implementation

{ TMovimentoEstoqueVADAO }

uses System.SysUtils, FireDAC.Comp.Client, Data.DB;

function TMovimentoEstoqueVADAO.Delete(iID: Integer): Boolean;
var
  sSQL: String;
begin
  Result := False;
  sSQL := 'DELETE FROM ' + TABLENAME + ' WHERE ID_MOVIMENTO = :pID_MOVIMENTO;';
  Connection.ExecSQL(sSQL,[iID],[ftInteger]);
  Result := True;
end;

function TMovimentoEstoqueVADAO.FindByData(dtData: TDate): TObjectList<TMovimentoEstoqueVA>;
var
  FDQuery: TFDQuery;
  movimentos: TObjectList<TMovimentoEstoqueVA>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE DAT_MOVIMENTO = :pDAT_MOVIMENTO');
    FDQuery.ParamByName('pDAT_MOVIMENTO').AsDate := dtData;
    FDQuery.Open();
    movimentos := TObjectList<TMovimentoEstoqueVA>.Create();
    while not FDQuery.Eof do
    begin
      movimentos.Add(TMovimentoEstoqueVA.Create(FDQuery.FieldByName('ID_MOVIMENTO').AsInteger,
                 FDQuery.FieldByName('DAT_MOVIMENTO').AsDateTime, FDQuery.FieldByName('ID_PRODUTO').AsInteger,
                 FDQuery.FieldByName('DOM_TIPO').AsInteger, FDQuery.FieldByName('DES_MOVIMENTO').AsString,
                 FDQuery.FieldByName('QTD_MOVIMENTO').AsFloat, FDQuery.FieldByName('COD_STATUS').AsInteger,
                 FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
end;

function TMovimentoEstoqueVADAO.FindByID(iID: Integer): TObjectList<TMovimentoEstoqueVA>;
var
  FDQuery: TFDQuery;
  movimentos: TObjectList<TMovimentoEstoqueVA>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE ID_MOVIMENTO = :pID_MOVIMENTO');
    FDQuery.ParamByName('pID_MOVIMENTO').AsInteger := iID;
    FDQuery.Open();
    movimentos := TObjectList<TMovimentoEstoqueVA>.Create();
    while not FDQuery.Eof do
    begin
      movimentos.Add(TMovimentoEstoqueVA.Create(FDQuery.FieldByName('ID_MOVIMENTO').AsInteger,
                 FDQuery.FieldByName('DAT_MOVIMENTO').AsDateTime, FDQuery.FieldByName('ID_PRODUTO').AsInteger,
                 FDQuery.FieldByName('DOM_TIPO').AsInteger, FDQuery.FieldByName('DES_MOVIMENTO').AsString,
                 FDQuery.FieldByName('QTD_MOVIMENTO').AsFloat, FDQuery.FieldByName('COD_STATUS').AsInteger,
                 FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
end;

function TMovimentoEstoqueVADAO.FindByProduto(iProduto: Integer): TObjectList<TMovimentoEstoqueVA>;
var
  FDQuery: TFDQuery;
  movimentos: TObjectList<TMovimentoEstoqueVA>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE ID_PEODUTO = :pID_PRODUTO');
    FDQuery.ParamByName('pID_PRODUTO').AsInteger := iProduto;
    FDQuery.Open();
    movimentos := TObjectList<TMovimentoEstoqueVA>.Create();
    while not FDQuery.Eof do
    begin
      movimentos.Add(TMovimentoEstoqueVA.Create(FDQuery.FieldByName('ID_MOVIMENTO').AsInteger,
                 FDQuery.FieldByName('DAT_MOVIMENTO').AsDateTime, FDQuery.FieldByName('ID_PRODUTO').AsInteger,
                 FDQuery.FieldByName('DOM_TIPO').AsInteger, FDQuery.FieldByName('DES_MOVIMENTO').AsString,
                 FDQuery.FieldByName('QTD_MOVIMENTO').AsFloat, FDQuery.FieldByName('COD_STATUS').AsInteger,
                 FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
end;

function TMovimentoEstoqueVADAO.Insert(aMovimento: TMovimentoEstoqueVA): Boolean;
var
  sSQL: String;
begin
  Result := False;
  aMovimento.ID := GetKeyValue(TABLENAME,'ID_MOVIMENTO');
  sSQL := 'INSERT INTO ' + TABLENAME + ' (' +
  'ID_MOVIMENTO, DAT_MOVIMENTO, ID_PRODUTO, DOM_TIPO, DES_MOVIMENTO, QTD_MOVIMENTO, COD_STATUS, DES_LOG) ' +
  'VALUE (' +
  ':pID_MOVIMENTO, :pDAT_MOVIMENTO, :pID_PRODUTO, :pDOM_TIPO, :PDES_MOVIMENTO, :pQTD_MOVIMENTO, :pCOD_STATUS,  :pDES_LOG); ';
  Connection.ExecSQL(sSQL, [aMovimento.ID, aMovimento.Data, aMovimento.Produto, aMovimento.Tipo, aMovimento.Descricao, aMovimento.Quantidade,
                     aMovimento.Status, aMovimento.Log], [ftInteger, ftDate, ftInteger, ftSmallint, ftString, ftFloat, ftSmallint, ftString]);
  Result := True;
end;

function TMovimentoEstoqueVADAO.Update(amovimento: TMovimentoEstoqueVA): Boolean;
var
  sSQL: String;
begin
  Result := False;
  sSQL := 'UPDATE ' + TABLENAME + ' SET ' +
  'DAT_MOVIMENTO = :PDAT_MOVIMENTO, ID_PRODUTO = :PID_PRODUTO, DOM_TIPO = :PDOM_TIPO, DES_MOVIMENTO = :PDES_MOVIMENTO, QTD_MOVIMENTO = :PQTD_MOVIMENTO, ' +
  'COD_STATUS = :PCOD_STATUS, DES_LOG = :PDES_LOG ' +
  'WHERE ID_MOVIMENTO = :PI_DMOVIMENTO';
  Connection.ExecSQL(sSQL, [aMovimento.Data, aMovimento.Produto, aMovimento.Tipo, aMovimento.Descricao, aMovimento.Quantidade,
                     aMovimento.Status, aMovimento.Log, aMovimento.ID], [ftDate, ftInteger, ftSmallint, ftString, ftFloat, ftSmallint, ftString, ftInteger]);
  Result := True;
end;

end.
