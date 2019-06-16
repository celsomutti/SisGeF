unit DAO.Modalidade;

interface

uses DAO.Base, Model.Modalidades, Generics.Collections, System.Classes;

type
  TModalidadeDAO = class(TDAO)
  public
    function Insert(aModalidades: TModalidades): Boolean;
    function Update(aModalidades: TModalidades): Boolean;
    function Delete(iCodigo: Integer): Boolean;
    function FindByCodigo(iCodigo: Integer): TObjectList<TModalidades>;
    function FindByDescricao(sDescricao: String): TObjectList<TModalidades>;
    function FindField(sCampo: String; iId: Integer): String;
end;
const
  TABLENAME = 'jor_modalidade_jornal';

implementation

uses System.SysUtils, FireDAC.Comp.Client, Data.DB;

function TModalidadeDAO.Insert(aModalidades: TModalidades): Boolean;
var
  sSQL : System.string;
begin
  Result := False;
  sSQL := 'INSERT INTO ' + TABLENAME + ' '+
          '(COD_MODALIDADE, DES_MODALIDADE, DES_OPERACAO, DES_LOG) ' +
          'VALUES ' +
          '(:CODIGO, :DESCRICAO, :OPERACAO , :LOG);';
  Connection.ExecSQL(sSQL,[aModalidades.Codigo, aModalidades.Descricao, aModalidades.Operacao, aModalidades.Log],
                          [ftInteger, ftString, ftString, ftString]);
  Result := True;
end;

function TModalidadeDAO.Update(aModalidades: TModalidades): Boolean;
var
  sSQL : System.string;
begin
  Result := False;
  sSQL := 'UPDATE ' + TABLENAME + ' SET '+
          'DES_MODALIDADE = :DESCRICAO, DES_OPERACAO = :OPERACAO, DES_LOG = :LOG) ' +
          'WHERE COD_MODALIDADE = :CODIGO;';
  Connection.ExecSQL(sSQL,[aModalidades.Descricao, aModalidades.Operacao, aModalidades.Log, aModalidades.Codigo],
                          [ftString, ftString, ftString, ftInteger]);
  Result := True;
end;

function TModalidadeDAO.Delete(iCodigo: Integer): Boolean;
var
  sSQL : String;
begin
  Result := False;
  sSQL := 'DELETE FROM ' + TABLENAME + ' WHERE COD_MODALIDADE = :CODIGO;';
  Connection.ExecSQL(sSQL,[iCodigo],[ftInteger]);
  Result := True;
end;

function TModalidadeDAO.FindByCodigo(iCodigo: Integer): TObjectList<TModalidades>;
var
  FDQuery: TFDQuery;
  modalidades: TObjectList<TModalidades>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE COD_MODALIDADE = :CODIGO');
    FDQuery.ParamByName('CODIGO').AsInteger := iCodigo;
    FDQuery.Open();
    modalidades := TObjectList<TModalidades>.Create();
    while not FDQuery.Eof do
    begin
      modalidades.Add(TModalidades.Create(FDQuery.FieldByName('COD_MODALIDADE').AsInteger,
                                          FDQuery.FieldByName('DES_MODALIDADE').AsString,
                                          FDQuery.FieldByName('DES_OPERACAO').AsString,
                                          FDQuery.FieldByName('DES_LOG').AsString));

      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := modalidades;
end;

function TModalidadeDAO.FindByDescricao(sDescricao: String): TObjectList<TModalidades>;
var
  FDQuery: TFDQuery;
  modalidades: TObjectList<TModalidades>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    if not sDescricao.IsEmpty then
    begin
      FDQuery.SQL.Add('WHERE DES_MODALIDADE LIKE :DESCRICAO');
      FDQuery.ParamByName('DESCRICAO').AsString := sDescricao;
    end;
    FDQuery.Open();
    modalidades := TObjectList<TModalidades>.Create();
    while not FDQuery.Eof do
    begin
      modalidades.Add(TModalidades.Create(FDQuery.FieldByName('COD_MODALIDADE').AsInteger,
                                          FDQuery.FieldByName('DES_MODALIDADE').AsString,
                                          FDQuery.FieldByName('DES_OPERACAO').AsString,
                                          FDQuery.FieldByName('DES_LOG').AsString));

      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := modalidades;
end;

function TModalidadeDAO.FindField(sCampo: string; iId: Integer): String;
var
  FDQuery: TFDQuery;
begin
  Result := '';
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT ' + sCampo + ' FROM ' + TABLENAME + ' WHERE COD_MODALIDADE = :ID');
    FDQuery.ParamByName('ID').AsInteger := iId;
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
