unit DAO.TipoOcorrenciaJornal;

interface

uses DAO.Base, Generics.Collections, System.Classes, Model.TipoOcorrenciaJornal;

type
  TTipoOcorrenciaJornalDAO = class(TDAO)
  public
    function Insert(aTipos: TTipoOcorrenciaJornal): Boolean;
    function Update(aTipos: TTipoOcorrenciaJornal): Boolean;
    function Delete(sCodigo: String): Boolean;
    function FindByCodigo(iCodigo: Integer): TObjectList<TTipoOcorrenciaJornal>;
    function FindByDescricao(sDescricao: String): TObjectList<TTipoOcorrenciaJornal>;
    function FindField(sCampo: String; sCodigo: String): String;
  end;
const
  TABLENAME = 'jor_tipo_ocorrencia';

implementation

uses System.SysUtils, FireDAC.Comp.Client, Data.DB;

function TTipoOcorrenciaJornalDAO.Insert(aTipos: TTipoOcorrenciaJornal): Boolean;
var
  sSQL : System.string;
begin
  Result := False;
  sSQL := 'INSERT INTO ' + TABLENAME + ' '+
          '(COD_COD_TIPO_OCORRENCIA, DES_TIPO_OCORRENCIA) ' +
          'VALUES ' +
          '(:CODIGO, :DESCRICAO);';
  Connection.ExecSQL(sSQL,[aTipos.Codigo, aTipos.Descricao],[ftInteger, ftString]);
  Result := True;
end;

function TTipoOcorrenciaJornalDAO.Update(aTipos: TTipoOcorrenciaJornal): Boolean;
var
  sSQL : System.string;
begin
  Result := False;
  sSQL := 'UPDATE ' + TABLENAME + ' SET '+
          'DES_TIPO_OCORRENCIA = :DESCRICAO ' +
          'WHERE ' +
          'COD_TIPO_OCORRENCIA = pCOD_TIPO_OCORRENCIA';
  Connection.ExecSQL(sSQL,[aTipos.Descricao, aTipos.Codigo],
                          [ftString, ftInteger]);
  Result := True;
end;

function TTipoOcorrenciaJornalDAO.Delete(sCodigo: string): Boolean;
var
  sSQL : String;
begin
  Result := False;
  sSQL := 'DELETE FROM ' + TABLENAME + ' WHERE COD_TIPO_OCORRENCIA = :CODIGO;';
  Connection.ExecSQL(sSQL,[sCodigo],[ftString]);
  Result := True;
end;

function TTipoOcorrenciaJornalDAO.FindByCodigo(iCodigo: Integer): TObjectList<TTipoOcorrenciaJornal>;
var
  FDQuery: TFDQuery;
  produtos: TObjectList<TTipoOcorrenciaJornal>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE COD_TIPO_OCORRENCIA = :CODIGO');
    FDQuery.ParamByName('CODIGO').AsInteger := iCodigo;
    FDQuery.Open();
    produtos := TObjectList<TTipoOcorrenciaJornal>.Create();
    while not FDQuery.Eof do
    begin
      produtos.Add(TTipoOcorrenciaJornal.Create(FDQuery.FieldByName('COD_TIPO_OCORRENCIA').AsInteger,
                                       FDQuery.FieldByName('DES_TIPO_OCORRENCIA').AsString));

      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := produtos;
end;

function  TTipoOcorrenciaJornalDAO.FindByDescricao(sDescricao: string): TObjectList<TTipoOcorrenciaJornal>;
var
  FDQuery: TFDQuery;
  modalidades: TObjectList<TTipoOcorrenciaJornal>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    if not sDescricao.IsEmpty then
    begin
      FDQuery.SQL.Add('WHERE DES_TIPO_OCORRENCIA LIKE :DESCRICAO');
      FDQuery.ParamByName('DESCRICAO').AsString := '%' + sDescricao + '%';
    end;
    FDQuery.Open();
    modalidades := TObjectList<TTipoOcorrenciaJornal>.Create();
    while not FDQuery.Eof do
    begin
      modalidades.Add(TTipoOcorrenciaJornal.Create(FDQuery.FieldByName('COD_TIPO_OCORRENCIA').AsInteger,
                                       FDQuery.FieldByName('DES_TIPO_OCORRENCIA').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := modalidades;
end;

function TTipoOcorrenciaJornalDAO.FindField(sCampo: string; sCodigo: string): String;
var
  FDQuery: TFDQuery;
begin
  Result := '';
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT ' + sCampo + ' FROM ' + TABLENAME + ' WHERE COD_TIPO_OCORRENCIA = :CODIGO');
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
