unit DAO.OcorrenciaEntregador;

interface

uses DAO.Base, Model.OcorrenciaEntregador, Generics.Collections, System.Classes;

  type
    TOcorrenciaEntregadorDAO = class(TDAO)
    public
      function Insert(aOcorrencias: TOcorrenciaEntregador): Boolean;
      function Update(aOcorrencias: TOcorrenciaEntregador): Boolean;
      function Delete(iID: Integer): Boolean;
      function FindByID(iID: Integer): TObjectList<TOcorrenciaEntregador>;
      function FindByReferencia(iReferencia: Integer): TObjectList<TOcorrenciaEntregador>;
      function FindByCapa(dtData: TDate): TObjectList<TOcorrenciaEntregador>;
      function FindByEntregador(iEntregador: Integer): TObjectList<TOcorrenciaEntregador>;
      function FindByCusteio(iReferencia: Integer; dtData: TDate; iEntregador: Integer): TObjectList<TOcorrenciaEntregador>;
    end;
const
  TABLENAME = 'jor_ocorrencias_entregador';

implementation

uses System.SysUtils, FireDAC.Comp.Client, Data.DB;

function TOcorrenciaEntregadorDAO.Insert(aOcorrencias: TOcorrenciaEntregador): Boolean;
var
  sSQL : System.string;
begin
  Result := False;
  aoCORRENCIAS.ID := GetKeyValue(TABLENAME,'ID_ATRIBUICAO');
  sSQL := 'INSERT INTO ' + TABLENAME + ' '+
          '(ID_ATRIBUICAO, ID_REFERENCIA, DAT_CAPA, COD_ENTREGADOR, VAL_CAPA, DES_LOG) ' +
          'VALUES ' +
          '(:pID_ATRIBUICAO, :pID_REFERENCIA, :pDAT_CAPA, :pCOD_ENTREGADOR, :pVAL_CAPA, :pDES_LOG);';
  Result := True;
end;

function TOcorrenciaEntregadorDAO.Update(aOcorrencias: TOcorrenciaEntregador): Boolean;
var
  sSQL : System.string;
begin
  Result := False;
  sSQL := 'UPDATE ' + TABLENAME + ' SET '+
          'ID_REFERENCIA = :pID_REFERENCIA, DAT_CAPA = :pDAT_CAPA, '+
          'COD_ENTREGADOR = :pCOD_ENTREGADOR, VAL_CAPA = :pVAL_CAPA, DES_LOG = :LOG) ' +
          'WHERE ID_ATRIBUICAO = :pID_ATRIBUICAO;';
  Connection.ExecSQL(sSQL,[aOcorrencias.Referencia, aOcorrencias.Data, aOcorrencias.Entregador, aOcorrencias.Valor,
                           aOcorrencias.Log, aOcorrencias.ID], [ftInteger, ftDate, ftInteger, ftFloat, ftString, ftInteger]);
  Result := True;
end;

function TOcorrenciaEntregadorDAO.Delete(iID: Integer): Boolean;
var
  sSQL : String;
begin
  Result := False;
  sSQL := 'DELETE FROM ' + TABLENAME + ' WHERE ID_ATRIBUICAO = :pID_ATRIBUICAO;';
  Connection.ExecSQL(sSQL,[iID],[ftInteger]);
  Result := True;
end;

function TOcorrenciaEntregadorDAO.FindByID(iID: Integer): TObjectList<TOcorrenciaEntregador>;
var
  FDQuery: TFDQuery;
  ocorrencias: TObjectList<TocorrenciaEntregador>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE ID_ATRIBUICAO = :pID_ATRIBUICAO');
    FDQuery.ParamByName('pID_ATRIBUICAO').AsInteger := iID;
    FDQuery.Open();
    ocorrencias := TObjectList<TOcorrenciaEntregador>.Create();
    while not FDQuery.Eof do
    begin
      ocorrencias.Add(TOcorrenciaEntregador.Create(FDQuery.FieldByName('ID_ATRIBUICAO').AsInteger,
                                          FDQuery.FieldByName('ID_REFERENCIA').AsInteger,
                                          FDQuery.FieldByName('DAT_CAPA').AsDateTime,
                                          FDQuery.FieldByName('COD_ENTREGADOR').AsInteger,
                                          FDQuery.FieldByName('VAL_CAPA').AsFloat,
                                          FDQuery.FieldByName('DES_LOG').AsString));

      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := ocorrencias;
end;

function TOcorrenciaEntregadorDAO.FindByReferencia(iReferencia: Integer): TObjectList<TOcorrenciaEntregador>;
var
  FDQuery: TFDQuery;
  ocorrencias: TObjectList<TocorrenciaEntregador>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE ID_REFERENCIA = :pID_REFERENCIA');
    FDQuery.ParamByName('pID_REFERENCIA').AsInteger := iReferencia;
    FDQuery.Open();
    ocorrencias := TObjectList<TOcorrenciaEntregador>.Create();
    while not FDQuery.Eof do
    begin
      ocorrencias.Add(TOcorrenciaEntregador.Create(FDQuery.FieldByName('ID_ATRIBUICAO').AsInteger,
                                          FDQuery.FieldByName('ID_REFERENCIA').AsInteger,
                                          FDQuery.FieldByName('DAT_CAPA').AsDateTime,
                                          FDQuery.FieldByName('COD_ENTREGADOR').AsInteger,
                                          FDQuery.FieldByName('VAL_CAPA').AsFloat,
                                          FDQuery.FieldByName('DES_LOG').AsString));

      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := ocorrencias;
end;

function TOcorrenciaEntregadorDAO.FindByCapa(dtData: TDate): TObjectList<TOcorrenciaEntregador>;
var
  FDQuery: TFDQuery;
  ocorrencias: TObjectList<TocorrenciaEntregador>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE DAT_CAPA = :pDAT_CAPA');
    FDQuery.ParamByName('pDAT_CAPA').AsDate := dtData;
    FDQuery.Open();
    ocorrencias := TObjectList<TOcorrenciaEntregador>.Create();
    while not FDQuery.Eof do
    begin
      ocorrencias.Add(TOcorrenciaEntregador.Create(FDQuery.FieldByName('ID_ATRIBUICAO').AsInteger,
                                          FDQuery.FieldByName('ID_REFERENCIA').AsInteger,
                                          FDQuery.FieldByName('DAT_CAPA').AsDateTime,
                                          FDQuery.FieldByName('COD_ENTREGADOR').AsInteger,
                                          FDQuery.FieldByName('VAL_CAPA').AsFloat,
                                          FDQuery.FieldByName('DES_LOG').AsString));

      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := ocorrencias;
end;

function TOcorrenciaEntregadorDAO.FindByEntregador(iEntregador: Integer): TObjectList<TOcorrenciaEntregador>;
var
  FDQuery: TFDQuery;
  ocorrencias: TObjectList<TocorrenciaEntregador>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE COD_ENTREGADOR = :pCOD_ENTREGADOR');
    FDQuery.ParamByName('pCOD_ENTREGADOR').AsInteger := iEntregador;
    FDQuery.Open();
    ocorrencias := TObjectList<TOcorrenciaEntregador>.Create();
    while not FDQuery.Eof do
    begin
      ocorrencias.Add(TOcorrenciaEntregador.Create(FDQuery.FieldByName('ID_ATRIBUICAO').AsInteger,
                                          FDQuery.FieldByName('ID_REFERENCIA').AsInteger,
                                          FDQuery.FieldByName('DAT_CAPA').AsDateTime,
                                          FDQuery.FieldByName('COD_ENTREGADOR').AsInteger,
                                          FDQuery.FieldByName('VAL_CAPA').AsFloat,
                                          FDQuery.FieldByName('DES_LOG').AsString));

      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := ocorrencias;
end;

function TOcorrenciaEntregadorDAO.FindByCusteio(iReferencia: Integer; dtData: TDate; iEntregador: Integer):
                                                TObjectList<TOcorrenciaEntregador>;
var
  FDQuery: TFDQuery;
  ocorrencias: TObjectList<TocorrenciaEntregador>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE ID_REFERENCIA = :pID_REFERENCIA, ');
    FDQuery.SQL.Add('AND DAT_CAPA = :pDAT_CAPA, ');
    FDQuery.SQL.Add('AND COD_ENTREGADOR = :pCOD_ENTREGADOR');
    FDQuery.ParamByName('pID_REFERENCIA').AsInteger := iReferencia;
    FDQuery.ParamByName('pDAT_CAPA').AsDate := dtData;
    FDQuery.ParamByName('pCOD_ENTREGADOR').AsInteger := iEntregador;
    FDQuery.Open();
    ocorrencias := TObjectList<TOcorrenciaEntregador>.Create();
    while not FDQuery.Eof do
    begin
      ocorrencias.Add(TOcorrenciaEntregador.Create(FDQuery.FieldByName('ID_ATRIBUICAO').AsInteger,
                                          FDQuery.FieldByName('ID_REFERENCIA').AsInteger,
                                          FDQuery.FieldByName('DAT_CAPA').AsDateTime,
                                          FDQuery.FieldByName('COD_ENTREGADOR').AsInteger,
                                          FDQuery.FieldByName('VAL_CAPA').AsFloat,
                                          FDQuery.FieldByName('DES_LOG').AsString));

      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := ocorrencias;
end;


end.
