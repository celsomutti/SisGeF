unit DAO.BancaVA;

interface

uses System.Generics.Collections, DAO.Base, Model.BancaVA, Generics.Collections,
  System.Classes;

type
  TBancaVADAO = class(TDAO)
  public
    function Insert(aBanca: Model.BancaVA.TBancaVA): Boolean;
    function Update(aBanca: Model.BancaVA.TBancaVA): Boolean;
    function Delete(iID: Integer): Boolean;
    function FindByID(iID: Integer): TObjectList<TBancaVA>;
    function FindByCodigo(iCodigo: Integer): TObjectList<TBancaVA>;
    function FindByDistribuidor(iDistribuidor: Integer): TObjectList<TBancaVA>;
    function FindByCEP(sCEP: String): TObjectList<TBancaVA>;
  end;
const
  TABLENAME = 'va_banca';

implementation

uses System.SysUtils, FireDAC.Comp.Client, Data.DB;

function TBancaVADAO.Insert(aBanca: Model.BancaVA.TBancaVA): Boolean;
var
  sSQL: String;
begin
  Result := False;
  aBanca.ID := GetKeyValue(TABLENAME,'ID_BANCA');
  sSQL := 'INSERT INTO ' + TABLENAME + '(' +
  'ID_BANCA, COD_BANCA, COD_DISTRIBUIDOR, NOM_BANCA, NUM_CEP, DES_ENDERECO, DES_COMPLEMENTO, DES_BAIRRO, DES_CIDADE, ' +
  'UF_ENDERECO, DES_ORDEM, DES_LOG) ' +
  'VALUE (' +
  ':pID_BANCA, :pCOD_BANCA, :pCOD_DISTRIBUIDOR, :pNOM_BANCA, :pNUM_CEP, :pDES_ENDERECO, :pDES_COMPLEMENTO, :pDES_BAIRRO, ' +
  ':pDES_CIDADE, :pUF_ENDERECO, :pDES_ORDEM, :pDES_LOG); ';
  Connection.ExecSQL(sSQL, [aBanca.ID, aBanca.Codigo, aBanca.Distribuidor, aBanca.Nome, aBanca.CEP, aBanca.Endereco,
                     aBanca.Complemento, aBanca.Bairro, aBanca.Cidade, aBanca.Estado, aBanca.Ordem, aBanca.Log],
                    [ftInteger, ftInteger, ftInteger, ftString, ftString, ftString, ftString, ftString, ftString,
                     ftString, ftString, ftString]);
  Result := True;
end;

function TBancaVADAO.Update(aBanca: Model.BancaVA.TBancaVA): Boolean;
var
  sSQL: String;
begin
  Result := False;
  sSQL := 'UPDATE ' + TABLENAME + ' SET ' +
  'COD_BANCA = :pCOD_BANCA, COD_DISTRIBUIDOR = :pCOD_DISTRIBUIDOR, NOM_BANCA = :pNOM_BANCA, ' +
  'NUM_CEP = :pNUM_CEP, DES_ENDERECO = :pDES_ENDERECO, DES_COMPLEMENTO = :pDES_COMPLEMENTO, DES_BAIRRO = :pDES_BAIRRO, ' +
  'DES_CIDADE = :pDES_CIDADE, UF_ENDERECO = :pUF_ENDERECO, DES_ORDEM = :pDES_ORDEM, DES_LOG = :pDES_LOG ' +
  'WHERE ' +
  'ID_BANCA = :pID_BANCA;';
  Connection.ExecSQL(sSQL, [aBanca.Codigo, aBanca.Distribuidor, aBanca.Nome, aBanca.CEP, aBanca.Endereco,
                     aBanca.Complemento, aBanca.Bairro, aBanca.Cidade, aBanca.Estado, aBanca.Ordem, aBanca.Log, aBanca.ID],
                    [ftInteger, ftInteger, ftString, ftString, ftString, ftString, ftString, ftString,
                     ftString, ftString, ftString, ftInteger]);
  Result := True;
end;

function TBancaVADAO.Delete(iID: Integer): Boolean;
var
  sSQL: String;
begin
  Result := False;
  sSQL := 'DELETE FROM ' + TABLENAME + ' WHERE ID_BANCA = :pID_BANCA;';
  Connection.ExecSQL(sSQL,[iID],[ftInteger]);
  Result := True;
end;

function TBancaVADAO.FindByID(iID: Integer): TObjectList<TBancaVA>;
var
  FDQuery: TFDQuery;
  bancas: TObjectList<TBancaVA>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE ID_BANCA = :pID_BANCA');
    FDQuery.ParamByName('pID_BANCA').AsInteger := iID;
    FDQuery.Open();
    bancas := TObjectList<TBancaVA>.Create();
    while not FDQuery.Eof do
    begin
      bancas.Add(TBancaVA.Create(FDQuery.FieldByName('ID_BANCA').AsInteger, FDQuery.FieldByName('COD_BANCA').AsInteger,
                   FDQuery.FieldByName('COD_DISTRIBUIDOR').AsInteger, FDQuery.FieldByName('NOM_BANCA').AsString,
                   FDQuery.FieldByName('NUM_CEP').AsString, FDQuery.FieldByName('DES_ENDERECO').AsString,
                   FDQuery.FieldByName('DES_COMPLEMENTO').AsString, FDQuery.FieldByName('DES_BAIRRO').AsString,
                   FDQuery.FieldByName('DES_CIDADE').AsString, FDQuery.FieldByName('UF_ENDERECO').AsString,
                   FDQuery.FieldByName('DES_ORDEM').AsString, FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := bancas;
end;

function TBancaVADAO.FindByCodigo(iCodigo: Integer): TObjectList<TBancaVA>;
var
  FDQuery: TFDQuery;
  bancas: TObjectList<TBancaVA>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE COD_BANCA = :pCOD_BANCA');
    FDQuery.ParamByName('pCOD_BANCA').AsInteger := iCodigo;
    FDQuery.Open();
    bancas := TObjectList<TBancaVA>.Create();
    while not FDQuery.Eof do
    begin
      bancas.Add(TBancaVA.Create(FDQuery.FieldByName('ID_BANCA').AsInteger, FDQuery.FieldByName('COD_BANCA').AsInteger,
                   FDQuery.FieldByName('COD_DISTRIBUIDOR').AsInteger, FDQuery.FieldByName('NOM_BANCA').AsString,
                   FDQuery.FieldByName('NUM_CEP').AsString, FDQuery.FieldByName('DES_ENDERECO').AsString,
                   FDQuery.FieldByName('DES_COMPLEMENTO').AsString, FDQuery.FieldByName('DES_BAIRRO').AsString,
                   FDQuery.FieldByName('DES_CIDADE').AsString, FDQuery.FieldByName('UF_ENDERECO').AsString,
                   FDQuery.FieldByName('DES_ORDEM').AsString, FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := bancas;
end;

function TBancaVADAO.FindByDistribuidor(iDistribuidor: Integer): TObjectList<TBancaVA>;
var
  FDQuery: TFDQuery;
  bancas: TObjectList<TBancaVA>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE COD_DISTRIBUIDOR = :pCOD_DISTRIBUIDOR');
    FDQuery.ParamByName('pCOD_DISTRIBUIDOR').AsInteger := iDistribuidor;
    FDQuery.Open();
    bancas := TObjectList<TBancaVA>.Create();
    while not FDQuery.Eof do
    begin
      bancas.Add(TBancaVA.Create(FDQuery.FieldByName('ID_BANCA').AsInteger, FDQuery.FieldByName('COD_BANCA').AsInteger,
                   FDQuery.FieldByName('COD_DISTRIBUIDOR').AsInteger, FDQuery.FieldByName('NOM_BANCA').AsString,
                   FDQuery.FieldByName('NUM_CEP').AsString, FDQuery.FieldByName('DES_ENDERECO').AsString,
                   FDQuery.FieldByName('DES_COMPLEMENTO').AsString, FDQuery.FieldByName('DES_BAIRRO').AsString,
                   FDQuery.FieldByName('DES_CIDADE').AsString, FDQuery.FieldByName('UF_ENDERECO').AsString,
                   FDQuery.FieldByName('DES_ORDEM').AsString, FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := bancas;
end;

function TBancaVADAO.FindByCEP(sCEP: String): TObjectList<TBancaVA>;
var
  FDQuery: TFDQuery;
  bancas: TObjectList<TBancaVA>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE NUM_CEP LIKE :pNUM_CEP');
    FDQuery.ParamByName('pNUM_CEP').AsString := sCEP + '%';
    FDQuery.Open();
    bancas := TObjectList<TBancaVA>.Create();
    while not FDQuery.Eof do
    begin
      bancas.Add(TBancaVA.Create(FDQuery.FieldByName('ID_BANCA').AsInteger, FDQuery.FieldByName('COD_BANCA').AsInteger,
                   FDQuery.FieldByName('COD_DISTRIBUIDOR').AsInteger, FDQuery.FieldByName('NOM_BANCA').AsString,
                   FDQuery.FieldByName('NUM_CEP').AsString, FDQuery.FieldByName('DES_ENDERECO').AsString,
                   FDQuery.FieldByName('DES_COMPLEMENTO').AsString, FDQuery.FieldByName('DES_BAIRRO').AsString,
                   FDQuery.FieldByName('DES_CIDADE').AsString, FDQuery.FieldByName('UF_ENDERECO').AsString,
                   FDQuery.FieldByName('DES_ORDEM').AsString, FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := bancas;
end;

end.
