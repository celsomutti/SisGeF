unit DAO.RemessasVA;

interface

uses DAO.Base, Model.RemessasVA, Generics.Collections, System.Classes;

type
  TRemessasVADAO = class(TDAO)
  public
    function Insert(aRemessa: TRemessasVA): Boolean;
    function Update(aRemessa: TRemessasVA): Boolean;
    function Delete(iId: Integer): Boolean;
    function FindByID(iId: Integer): TObjectList<TRemessasVA>;
    function FindByProduto(iProduto: Integer): TObjectList<TRemessasVA>;
    function FindByBanca(iBanca: Integer): TObjectList<TRemessasVA>;
    function FindByDataRemessa(dtData: TDate): TObjectList<TRemessasVA>;
    function FindByNumeroRemessa(sNumero: String): TObjectList<TRemessasVA>;
    function FindByDataRecobertura(dtData: TDate): TObjectList<TRemessasVA>;
    function FindByDataChamada(dtData: TDate): TObjectList<TRemessasVA>;
    function FindByNumeroDevolucao(sNumero: String): TObjectList<TRemessasVA>;
    function FindByMovimento(iDistribuidor: Integer; iBanca: Integer; iTipo: Integer; sProduto: String; dtData: TDate):
             TObjectList<TRemessasVA>;
    function FindByAvulso(iDistribuidor: Integer; iBanca: Integer; sProduto: String):
             TObjectList<TRemessasVA>;
    function ProdutoCirculacaoUnique(dtData: TDate): TStringList;
    function FindExistBanca(iBanca: Integer): Boolean;
  end;
const
  TABLENAME = 'va_remessas';

implementation

uses System.SysUtils, FireDAC.Comp.Client, Data.DB;

function TRemessasVADAO.Insert(aRemessa: TRemessasVA): Boolean;
var
  sSQL: String;
begin
  Result := False;
  aRemessa.Id := GetKeyValue(TABLENAME,'ID_REMESSAS');
  sSQL := 'INSERT INTO ' + TABLENAME +
          '(ID_REMESSAS, COD_DISTRIBUIDOR, COD_BANCA, COD_PRODUTO, DAT_REMESSA, NUM_REMESSA, QTD_REMESSA, DAT_RECOBERTURA, ' +
          'QTD_RECOBERTURA, DAT_CHAMADA, NUM_DEVOLUCAO, QTD_ENCALHE, VAL_COBRANCA, VAL_VENDA, DOM_INVENTARIO, , DOM_DIVERGENCIA, DES_LOG) ' +
          'VALUES ' +
          '(:pID_REMESSAS, :pCOD_DISTRIBUIDOR, :pID_BANCA, :pID_PRODUTO, :pDAT_REMESSA, :pNUM_REMESSA, :pQTD_REMESSA, ' +
          ':pDAT_RECOBERTURA, :pQTD_RECOBERTURA, :pDAT_CHAMADA, :pNUM_DEVOLUCAO, :pQTD_ENCALHE, :pVAL_COBRANCA, :pVAL_VENDA, ' +
          ':pDOM_INVENTARIO, :pDOM_DIVERGENCIA, , :pDES_LOG)';
  Connection.ExecSQL(sSQL,[aRemessa.Id, aRemessa.Distribuidor, aRemessa.Banca, aRemessa.Produto, aRemessa.DataRemessa,
                     aRemessa.NumeroRemessa, aRemessa.Remessa, aRemessa.DataRecobertura, aRemessa.Recobertura, aRemessa.DataChamada,
                     aRemessa.NumeroDevolucao, aRemessa.Encalhe, aRemessa.ValorCobranca, aRemessa.ValorVenda, aRemessa.Inventario,
                     aRemessa.Divergencia, aRemessa.Log],
                     [ftInteger, ftInteger, ftInteger, ftString, ftDate, ftString, ftFloat, ftDate, ftFloat, ftDate, ftString, ftFloat,
                     ftFloat, ftFloat, ftInteger, ftInteger, ftString]);
  Result := True;
end;

function TRemessasVADAO.Update(aRemessa: TRemessasVA): Boolean;
var
  sSQL: String;
begin
  Result := False;
  sSQL := 'UPDATE ' + TABLENAME + ' SET ' +
          'COD_DISTRIBUIDOR = :pCOD_DISTRIBUIDIR, COD_BANCA = :pCOD_BANCA, COD_PRODUTO = :pCOD_PRODUTO, ' +
          'DAT_REMESSA = :pDAT_REMESSA, NUM_REMESSA = :pNUM_REMESSA, QTD_REMESSA = :pQTD_REMESSA, ' +
          'DAT_RECOBERTURA = :pDAT_RECOBERTURA, QTD_RECOBERTURA = :pQTD_RECOBERTURA, DAT_CHAMADA = :pDAT_CHAMADA, ' +
          'NUM_DEVOLUCAO = :pUM_DEVOLUCAO, QTD_ENCALHE = :pQTD_ENCALHE, VAL_COBRANCA = :pVAL_COBRANCA, VAL_VENDA = :pVAL_VENDA, ' +
          'DOM_INVENTARIO = :pDOM_INVENTARIO, DOM_DIVERGENCIA = :pDOM_DIVERGENCIA, DES_LOG = :pDES_LOG ' +
          'WHERE ' +
          'ID_REMESSAS = :pID_REMESSAS';
  Connection.ExecSQL(sSQL,[aRemessa.Distribuidor, aRemessa.Banca, aRemessa.Produto, aRemessa.DataRemessa, aRemessa.NumeroRemessa,
                     aRemessa.Remessa, aRemessa.DataRecobertura, aRemessa.Recobertura, aRemessa.DataChamada,
                     aRemessa.NumeroDevolucao, aRemessa.Encalhe, aRemessa.ValorCobranca, aRemessa.ValorVenda, aRemessa.Inventario, aRemessa.Divergencia,
                     aRemessa.Log, aRemessa.Id],
                     [ftInteger, ftInteger, ftString, ftDate, ftString, ftFloat, ftDate, ftFloat, ftDate, ftString, ftFloat,
                     ftFloat, ftFloat, ftInteger, ftInteger, ftString, ftInteger]);
  Result := True;
end;

function TRemessasVADAO.Delete(iId: Integer): Boolean;
var
  sSQL : String;
begin
  Result := False;
  sSQL := 'DELETE FROM ' + TABLENAME + ' WHERE ID_REMESSA = :pID_REMESSA';
  Connection.ExecSQL(sSQL,[iID],[ftInteger]);
  Result := True;
end;

function TRemessasVADAO.FindByID(iId: Integer): TObjectList<TRemessasVA>;
var
  FDQuery: TFDQuery;
  remessas: TObjectList<TRemessasVA>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE ID_REMESSAS = :pID_REMESSAS');
    FDQuery.ParamByName('pID_REMESSAS').AsInteger := iID;
    FDQuery.Open();
    remessas := TObjectList<TRemessasVA>.Create();
    while not FDQuery.Eof do
    begin
      remessas.Add(TRemessasVA.Create(FDQuery.FieldByName('ID_REMESSAS').AsInteger,
                   FDQuery.FieldByName('COD_DISTRIBUIDOR').AsInteger, FDQuery.FieldByName('COD_BANCA').AsInteger,
                   FDQuery.FieldByName('COD_PRODUTO').AsString, FDQuery.FieldByName('DAT_REMESSA').AsDateTime,
                   FDQuery.FieldByName('NUM_REMESSA').AsString, FDQuery.FieldByName('QTD_REMESSA').AsFloat,
                   FDQuery.FieldByName('DAT_RECOBERTURA').AsDateTime, FDQuery.FieldByName('QTD_RECOBERTURA').AsFloat,
                   FDQuery.FieldByName('DAT_CHAMADA').AsDateTime, FDQuery.FieldByName('NUM_DEVOLUCAO').AsString,
                   FDQuery.FieldByName('QTD_ENCALHE').AsFloat, FDQuery.FieldByName('VAL_COBRANCA').AsFloat,
                   FDQuery.FieldByName('VAL_VENDA').AsFloat, FDQuery.FieldByName('DOM_INVENTARIO').AsInteger,
                   FDQuery.FieldByName('DOM_DIVERGENCIA').AsInteger, FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := remessas;
end;

function TRemessasVADAO.FindByProduto(iProduto: Integer): TObjectList<TRemessasVA>;
var
  FDQuery: TFDQuery;
  remessas: TObjectList<TRemessasVA>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE ID_PRODUTO = :pID_PRODUTO');
    FDQuery.ParamByName('pID_PRODUTO').AsInteger := iProduto;
    FDQuery.Open();
    remessas := TObjectList<TRemessasVA>.Create();
    while not FDQuery.Eof do
    begin
      remessas.Add(TRemessasVA.Create(FDQuery.FieldByName('ID_REMESSAS').AsInteger,
                   FDQuery.FieldByName('COD_DISTRIBUIDOR').AsInteger, FDQuery.FieldByName('COD_BANCA').AsInteger,
                   FDQuery.FieldByName('COD_PRODUTO').AsString, FDQuery.FieldByName('DAT_REMESSA').AsDateTime,
                   FDQuery.FieldByName('NUM_REMESSA').AsString, FDQuery.FieldByName('QTD_REMESSA').AsFloat,
                   FDQuery.FieldByName('DAT_RECOBERTURA').AsDateTime, FDQuery.FieldByName('QTD_RECOBERTURA').AsFloat,
                   FDQuery.FieldByName('DAT_CHAMADA').AsDateTime, FDQuery.FieldByName('NUM_DEVOLUCAO').AsString,
                   FDQuery.FieldByName('QTD_ENCALHE').AsFloat, FDQuery.FieldByName('VAL_COBRANCA').AsFloat,
                   FDQuery.FieldByName('VAL_VENDA').AsFloat, FDQuery.FieldByName('DOM_INVENTARIO').AsInteger,
                   FDQuery.FieldByName('DOM_DIVERGENCIA').AsInteger, FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := remessas;
end;

function TRemessasVADAO.FindByAvulso(iDistribuidor, iBanca: Integer; sProduto: String): TObjectList<TRemessasVA>;
var
  FDQuery: TFDQuery;
  remessas: TObjectList<TRemessasVA>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    if iDistribuidor > 0 then
    begin
      if FDQuery.SQL.Count = 1 then
      begin
        FDQuery.SQL.Add('WHERE COD_DISTRIBUIDOR = :pCOD_DISTRIBUIDOR');
      end
      else
      begin
        FDQuery.SQL.Add('AND COD_DISTRIBUIDOR = :pCOD_DISTRIBUIDOR');
      end;
      FDQuery.ParamByName('pCOD_DISTRIBUIDOR').AsInteger := iDistribuidor;
    end;
    if iBanca > 0 then
    begin
      if FDQuery.SQL.Count = 1 then
      begin
        FDQuery.SQL.Add('WHERE COD_BANCA = :pCOD_BANCA');
      end
      else
      begin
        FDQuery.SQL.Add('AND COD_BANCA = :pCOD_BANCA');
      end;
      FDQuery.ParamByName('pCOD_BANCA').AsInteger := iBanca;
    end;
    if not sProduto.IsEmpty then
    begin
      if FDQuery.SQL.Count = 1 then
      begin
        FDQuery.SQL.Add('WHERE COD_PRODUTO = :pCOD_PRODUTO');
      end
      else
      begin
        FDQuery.SQL.Add('AND COD_PRODUTO = :pCOD_PRODUTO');
      end;
      FDQuery.ParamByName('pCOD_PRODUTO').AsString := sProduto;
    end;
    FDQuery.Open();
    remessas := TObjectList<TRemessasVA>.Create();
    while not FDQuery.Eof do
    begin
      remessas.Add(TRemessasVA.Create(FDQuery.FieldByName('ID_REMESSAS').AsInteger,
                   FDQuery.FieldByName('COD_DISTRIBUIDOR').AsInteger, FDQuery.FieldByName('COD_BANCA').AsInteger,
                   FDQuery.FieldByName('COD_PRODUTO').AsString, FDQuery.FieldByName('DAT_REMESSA').AsDateTime,
                   FDQuery.FieldByName('NUM_REMESSA').AsString, FDQuery.FieldByName('QTD_REMESSA').AsFloat,
                   FDQuery.FieldByName('DAT_RECOBERTURA').AsDateTime, FDQuery.FieldByName('QTD_RECOBERTURA').AsFloat,
                   FDQuery.FieldByName('DAT_CHAMADA').AsDateTime, FDQuery.FieldByName('NUM_DEVOLUCAO').AsString,
                   FDQuery.FieldByName('QTD_ENCALHE').AsFloat, FDQuery.FieldByName('VAL_COBRANCA').AsFloat,
                   FDQuery.FieldByName('VAL_VENDA').AsFloat, FDQuery.FieldByName('DOM_INVENTARIO').AsInteger,
                   FDQuery.FieldByName('DOM_DIVERGENCIA').AsInteger, FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
end;

function TRemessasVADAO.FindByBanca(iBanca: Integer): TObjectList<TRemessasVA>;
var
  FDQuery: TFDQuery;
  remessas: TObjectList<TRemessasVA>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE ID_BANCA = :pID_BANCA');
    FDQuery.ParamByName('pID_BANCA').AsInteger := iBanca;
    FDQuery.Open();
    remessas := TObjectList<TRemessasVA>.Create();
    while not FDQuery.Eof do
    begin
      remessas.Add(TRemessasVA.Create(FDQuery.FieldByName('ID_REMESSAS').AsInteger,
                   FDQuery.FieldByName('COD_DISTRIBUIDOR').AsInteger, FDQuery.FieldByName('COD_BANCA').AsInteger,
                   FDQuery.FieldByName('COD_PRODUTO').AsString, FDQuery.FieldByName('DAT_REMESSA').AsDateTime,
                   FDQuery.FieldByName('NUM_REMESSA').AsString, FDQuery.FieldByName('QTD_REMESSA').AsFloat,
                   FDQuery.FieldByName('DAT_RECOBERTURA').AsDateTime, FDQuery.FieldByName('QTD_RECOBERTURA').AsFloat,
                   FDQuery.FieldByName('DAT_CHAMADA').AsDateTime, FDQuery.FieldByName('NUM_DEVOLUCAO').AsString,
                   FDQuery.FieldByName('QTD_ENCALHE').AsFloat, FDQuery.FieldByName('VAL_COBRANCA').AsFloat,
                   FDQuery.FieldByName('VAL_VENDA').AsFloat, FDQuery.FieldByName('DOM_INVENTARIO').AsInteger,
                   FDQuery.FieldByName('DOM_DIVERGENCIA').AsInteger, FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := remessas;
end;

function TRemessasVADAO.FindByDataRemessa(dtData: TDate): TObjectList<TRemessasVA>;
var
  FDQuery: TFDQuery;
  remessas: TObjectList<TRemessasVA>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE DAT_REMESSA = :pDAT_REMESSA');
    FDQuery.ParamByName('pDAT_REMESSA').AsDate := dtData;
    FDQuery.Open();
    remessas := TObjectList<TRemessasVA>.Create();
    while not FDQuery.Eof do
    begin
      remessas.Add(TRemessasVA.Create(FDQuery.FieldByName('ID_REMESSAS').AsInteger,
                   FDQuery.FieldByName('COD_DISTRIBUIDOR').AsInteger, FDQuery.FieldByName('COD_BANCA').AsInteger,
                   FDQuery.FieldByName('COD_PRODUTO').AsString, FDQuery.FieldByName('DAT_REMESSA').AsDateTime,
                   FDQuery.FieldByName('NUM_REMESSA').AsString, FDQuery.FieldByName('QTD_REMESSA').AsFloat,
                   FDQuery.FieldByName('DAT_RECOBERTURA').AsDateTime, FDQuery.FieldByName('QTD_RECOBERTURA').AsFloat,
                   FDQuery.FieldByName('DAT_CHAMADA').AsDateTime, FDQuery.FieldByName('NUM_DEVOLUCAO').AsString,
                   FDQuery.FieldByName('QTD_ENCALHE').AsFloat, FDQuery.FieldByName('VAL_COBRANCA').AsFloat,
                   FDQuery.FieldByName('VAL_VENDA').AsFloat, FDQuery.FieldByName('DOM_INVENTARIO').AsInteger,
                   FDQuery.FieldByName('DOM_DIVERGENCIA').AsInteger, FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := remessas;
end;

function TRemessasVADAO.FindByNumeroRemessa(sNumero: String): TObjectList<TRemessasVA>;
var
  FDQuery: TFDQuery;
  remessas: TObjectList<TRemessasVA>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE NUM_REMESSA = :pNUM_REMESSA');
    FDQuery.ParamByName('pNUM_REMESSA').AsString := sNumero;
    FDQuery.Open();
    remessas := TObjectList<TRemessasVA>.Create();
    while not FDQuery.Eof do
    begin
      remessas.Add(TRemessasVA.Create(FDQuery.FieldByName('ID_REMESSAS').AsInteger,
                   FDQuery.FieldByName('COD_DISTRIBUIDOR').AsInteger, FDQuery.FieldByName('COD_BANCA').AsInteger,
                   FDQuery.FieldByName('COD_PRODUTO').AsString, FDQuery.FieldByName('DAT_REMESSA').AsDateTime,
                   FDQuery.FieldByName('NUM_REMESSA').AsString, FDQuery.FieldByName('QTD_REMESSA').AsFloat,
                   FDQuery.FieldByName('DAT_RECOBERTURA').AsDateTime, FDQuery.FieldByName('QTD_RECOBERTURA').AsFloat,
                   FDQuery.FieldByName('DAT_CHAMADA').AsDateTime, FDQuery.FieldByName('NUM_DEVOLUCAO').AsString,
                   FDQuery.FieldByName('QTD_ENCALHE').AsFloat, FDQuery.FieldByName('VAL_COBRANCA').AsFloat,
                   FDQuery.FieldByName('VAL_VENDA').AsFloat, FDQuery.FieldByName('DOM_INVENTARIO').AsInteger,
                   FDQuery.FieldByName('DOM_DIVERGENCIA').AsInteger, FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := remessas;
end;

function TRemessasVADAO.FindByDataRecobertura(dtData: TDate): TObjectList<TRemessasVA>;
var
  FDQuery: TFDQuery;
  remessas: TObjectList<TRemessasVA>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE DAT_RECOBERTURA = :pDAT_RECOBERTURA');
    FDQuery.ParamByName('pDAT_RECOBERTURA').AsDate := dtData;
    FDQuery.Open();
    remessas := TObjectList<TRemessasVA>.Create();
    while not FDQuery.Eof do
    begin
      remessas.Add(TRemessasVA.Create(FDQuery.FieldByName('ID_REMESSAS').AsInteger,
                   FDQuery.FieldByName('COD_DISTRIBUIDOR').AsInteger, FDQuery.FieldByName('COD_BANCA').AsInteger,
                   FDQuery.FieldByName('COD_PRODUTO').AsString, FDQuery.FieldByName('DAT_REMESSA').AsDateTime,
                   FDQuery.FieldByName('NUM_REMESSA').AsString, FDQuery.FieldByName('QTD_REMESSA').AsFloat,
                   FDQuery.FieldByName('DAT_RECOBERTURA').AsDateTime, FDQuery.FieldByName('QTD_RECOBERTURA').AsFloat,
                   FDQuery.FieldByName('DAT_CHAMADA').AsDateTime, FDQuery.FieldByName('NUM_DEVOLUCAO').AsString,
                   FDQuery.FieldByName('QTD_ENCALHE').AsFloat, FDQuery.FieldByName('VAL_COBRANCA').AsFloat,
                   FDQuery.FieldByName('VAL_VENDA').AsFloat, FDQuery.FieldByName('DOM_INVENTARIO').AsInteger,
                   FDQuery.FieldByName('DOM_DIVERGENCIA').AsInteger, FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := remessas;
end;

function TRemessasVADAO.FindByDataChamada(dtData: TDate): TObjectList<TRemessasVA>;
var
  FDQuery: TFDQuery;
  remessas: TObjectList<TRemessasVA>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE DAT_CHAMADA = :pDAT_CHAMADA');
    FDQuery.ParamByName('pDAT_CHAMADA').AsDate := dtData;
    FDQuery.Open();
    remessas := TObjectList<TRemessasVA>.Create();
    while not FDQuery.Eof do
    begin
      remessas.Add(TRemessasVA.Create(FDQuery.FieldByName('ID_REMESSAS').AsInteger,
                   FDQuery.FieldByName('COD_DISTRIBUIDOR').AsInteger, FDQuery.FieldByName('COD_BANCA').AsInteger,
                   FDQuery.FieldByName('COD_PRODUTO').AsString, FDQuery.FieldByName('DAT_REMESSA').AsDateTime,
                   FDQuery.FieldByName('NUM_REMESSA').AsString, FDQuery.FieldByName('QTD_REMESSA').AsFloat,
                   FDQuery.FieldByName('DAT_RECOBERTURA').AsDateTime, FDQuery.FieldByName('QTD_RECOBERTURA').AsFloat,
                   FDQuery.FieldByName('DAT_CHAMADA').AsDateTime, FDQuery.FieldByName('NUM_DEVOLUCAO').AsString,
                   FDQuery.FieldByName('QTD_ENCALHE').AsFloat, FDQuery.FieldByName('VAL_COBRANCA').AsFloat,
                   FDQuery.FieldByName('VAL_VENDA').AsFloat, FDQuery.FieldByName('DOM_INVENTARIO').AsInteger,
                   FDQuery.FieldByName('DOM_DIVERGENCIA').AsInteger, FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := remessas;
end;

function TRemessasVADAO.FindByNumeroDevolucao(sNumero: String): TObjectList<TRemessasVA>;
var
  FDQuery: TFDQuery;
  remessas: TObjectList<TRemessasVA>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE NUM_DEVOLUCAO = :pNUM_DEVOLUCAO');
    FDQuery.ParamByName('pNUM_DEVOLUCAO').AsString := sNumero;
    FDQuery.Open();
    remessas := TObjectList<TRemessasVA>.Create();
    while not FDQuery.Eof do
    begin
      remessas.Add(TRemessasVA.Create(FDQuery.FieldByName('ID_REMESSAS').AsInteger,
                   FDQuery.FieldByName('COD_DISTRIBUIDOR').AsInteger, FDQuery.FieldByName('COD_BANCA').AsInteger,
                   FDQuery.FieldByName('COD_PRODUTO').AsString, FDQuery.FieldByName('DAT_REMESSA').AsDateTime,
                   FDQuery.FieldByName('NUM_REMESSA').AsString, FDQuery.FieldByName('QTD_REMESSA').AsFloat,
                   FDQuery.FieldByName('DAT_RECOBERTURA').AsDateTime, FDQuery.FieldByName('QTD_RECOBERTURA').AsFloat,
                   FDQuery.FieldByName('DAT_CHAMADA').AsDateTime, FDQuery.FieldByName('NUM_DEVOLUCAO').AsString,
                   FDQuery.FieldByName('QTD_ENCALHE').AsFloat, FDQuery.FieldByName('VAL_COBRANCA').AsFloat,
                   FDQuery.FieldByName('VAL_VENDA').AsFloat, FDQuery.FieldByName('DOM_INVENTARIO').AsInteger,
                   FDQuery.FieldByName('DOM_DIVERGENCIA').AsInteger, FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := remessas;
end;

function TRemessasVADAO.ProdutoCirculacaoUnique(dtData: TDate): TStringList;
begin

end;

function TRemessasVADAO.FindExistBanca(iBanca: Integer): Boolean;
var
  FDQuery: TFDQuery;
  remessas: TObjectList<TRemessasVA>;
  bFlag: Boolean;
begin
  bFlag := False;
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE ID_BANCA = :pID_BANCA');
    FDQuery.ParamByName('pID_BANCA').AsInteger := iBanca;
    FDQuery.Open();
    remessas := TObjectList<TRemessasVA>.Create();
    if remessas.Count > 0 then bFlag := True;
  finally
    FDQuery.Free;
  end;
  Result := bFlag;
end;

function TRemessasVADAO.FindByMovimento(iDistribuidor: Integer; iBanca: Integer; iTipo: Integer; sProduto: String; dtData: TDate):
                                         TObjectList<TRemessasVA>;
var
  FDQuery: TFDQuery;
  remessas: TObjectList<TRemessasVA>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    if iDistribuidor > 0 then
    begin
      if FDQuery.SQL.Count = 1 then
      begin
        FDQuery.SQL.Add('WHERE COD_DISTRIBUIDOR = :pCOD_DISTRIBUIDOR');
      end
      else
      begin
        FDQuery.SQL.Add('AND COD_DISTRIBUIDOR = :pCOD_DISTRIBUIDOR');
      end;
      FDQuery.ParamByName('pCOD_DISTRIBUIDOR').AsInteger := iDistribuidor;
    end;
    if iBanca > 0 then
    begin
      if FDQuery.SQL.Count = 1 then
      begin
        FDQuery.SQL.Add('WHERE COD_BANCA = :pCOD_BANCA');
      end
      else
      begin
        FDQuery.SQL.Add('AND COD_BANCA = :pCOD_BANCA');
      end;
      FDQuery.ParamByName('pCOD_BANCA').AsInteger := iBanca;
    end;
    if not sProduto.IsEmpty then
    begin
      if FDQuery.SQL.Count = 1 then
      begin
        FDQuery.SQL.Add('WHERE COD_PRODUTO = :pCOD_PRODUTO');
      end
      else
      begin
        FDQuery.SQL.Add('AND COD_PRODUTO = :pCOD_PRODUTO');
      end;
      FDQuery.ParamByName('pCOD_PRODUTO').AsString := sProduto;
    end;
    if iTipo = 0 then
    begin
      if FDQuery.SQL.Count = 1 then
      begin
        FDQuery.SQL.Add('WHERE DAT_REMESSA = :pDAT_REMESSA');
      end
      else
      begin
        FDQuery.SQL.Add('AND DAT_REMESSA = :pDAT_REMESSA');
      end;
      FDQuery.ParamByName('pDAT_REMESSA').AsDate := dtData;
    end
    else if iTipo = 1 then
    begin
      if FDQuery.SQL.Count = 1 then
      begin
        FDQuery.SQL.Add('WHERE DAT_CHAMADA = :pDAT_CHAMADA');
      end
      else
      begin
        FDQuery.SQL.Add('AND DAT_CHAMADA = :pDAT_CHAMADA');
      end;
      FDQuery.ParamByName('pDAT_CHAMADA').AsDate := dtData;
    end;
    if FDQuery.SQL.Count = 1 then
    begin
      FDQuery.SQL.Add('WHERE COM_INVENTARIO = 0');
    end
    else
    begin
      FDQuery.SQL.Add('AND COM_INVENTARIO = 0');
    end;
      FDQuery.ParamByName('pCOD_BANCA').AsInteger := iBanca;
    FDQuery.Open();
    remessas := TObjectList<TRemessasVA>.Create();
    while not FDQuery.Eof do
    begin
      remessas.Add(TRemessasVA.Create(FDQuery.FieldByName('ID_REMESSAS').AsInteger,
                   FDQuery.FieldByName('COD_DISTRIBUIDOR').AsInteger, FDQuery.FieldByName('COD_BANCA').AsInteger,
                   FDQuery.FieldByName('COD_PRODUTO').AsString, FDQuery.FieldByName('DAT_REMESSA').AsDateTime,
                   FDQuery.FieldByName('NUM_REMESSA').AsString, FDQuery.FieldByName('QTD_REMESSA').AsFloat,
                   FDQuery.FieldByName('DAT_RECOBERTURA').AsDateTime, FDQuery.FieldByName('QTD_RECOBERTURA').AsFloat,
                   FDQuery.FieldByName('DAT_CHAMADA').AsDateTime, FDQuery.FieldByName('NUM_DEVOLUCAO').AsString,
                   FDQuery.FieldByName('QTD_ENCALHE').AsFloat, FDQuery.FieldByName('VAL_COBRANCA').AsFloat,
                   FDQuery.FieldByName('VAL_VENDA').AsFloat, FDQuery.FieldByName('DOM_INVENTARIO').AsInteger,
                   FDQuery.FieldByName('DOM_DIVERGENCIA').AsInteger, FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := remessas;
end;

end.
