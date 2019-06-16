unit DAO.RHOperacionalAusencias;

interface

uses DAO.Base, Model.RHOperacionalausencias, Generics.Collections, System.Classes;

type
  TRHOperacionalAusenciasDAO = class(TDAO)
  public
    function Insert(aAusencias: TRHOperacionalAusencias): Boolean;
    function Update(aAusencias: TRHOperacionalAusencias): Boolean;
    function Delete(iID: Integer): Boolean;
    function FindByID(iID: Integer): TObjectList<TRHOperacionalAusencias>;
    function FindByEntregador(iEntregador: Integer): TObjectList<TRHOperacionalAusencias>;
    function FindByData(dtData: TDate): TObjectList<TRHOperacionalAusencias>;
    function FindByPeriodo(dtData1: TDate; dtData2: TDate): TObjectList<TRHOperacionalAusencias>;
    function FindByOperacao(dtData: TDate; iEntregador: Integer): TObjectList<TRHOperacionalAusencias>;
  end;
const
  TABLENAME = 'rh_operacao_ausencias';

implementation

uses System.SysUtils, FireDAC.Comp.Client, Data.DB;

function TRHOperacionalAusenciasDAO.Insert(aAusencias: TRHOperacionalAusencias): Boolean;
var
  sSQL : System.string;
begin
  Result := False;
  aAusencias.ID := GetKeyValue(TABLENAME,'ID_AUSENCIA');
  sSQL := 'INSERT INTO ' + TABLENAME +
          '(ID_AUSENCIA, DAT_OPERACAO, COD_CADASTRO, COD_STATUS_OPERACAO, DES_OBSERVACOES, ID_REFERENCIA, DES_LOG) ' +
          'VALUES ' +
          '(:pID_AUSENCIA, , :pDAT_OPERACAO, :pCOD_CADASTRO, :pCOD_STATUS_OPERACAO, :pDES_OBSERVACOES, :pID_REFERENCIA, ' +
           ':pDES_LOG);';
  Connection.ExecSQL(sSQL,[aAusencias.ID, aAusencias.Cadastro, aAusencias.Data, aAusencias.StatusOperacao, aAusencias.IDReferencia,
                           aAusencias.Log],
                          [ftInteger, ftInteger, ftDate, ftString, ftInteger, ftString]);
  Result := True;
end;

function TRHOperacionalAusenciasDAO.Update(aAusencias: TRHOperacionalAusencias): Boolean;
var
  sSQL : System.string;
begin
  Result := False;
  sSQL := 'UPDATE ' + TABLENAME + ' SET ' +
          'DAT_OPERACAO = :pDAT_OPERACAO, COD_CADASTRO = :pCOD_CADASTRO, COD_STATUS_OPERACAO = :pCOD_STATUS_OPERACAO, ' +
          'DES_OBSERVACOES = :pDES_OBSERVACOES, ID_REFERENCIA = :pID_REFERENCIA, DES_LOG = :pDES_LOG ' +
          'WHERE ID_AUSENCIA = :pID_AUSENCIA;';

  Connection.ExecSQL(sSQL,[aAusencias.Cadastro, aAusencias.Data, aAusencias.StatusOperacao, aAusencias.IDReferencia,
                           aAusencias.Log, aAusencias.ID],
                          [ftInteger, ftDate, ftString, ftInteger, ftString, ftInteger]);
  Result := True;
end;

function TRHOperacionalAusenciasDAO.Delete(iID: Integer): Boolean;
var
  sSQL : String;
begin
  Result := False;
  sSQL := 'DELETE FROM ' + TABLENAME + ' WHERE ID_AUSENCIA = :pID_AUSENCIA;';
  Connection.ExecSQL(sSQL,[iID],[ftInteger]);
  Result := True;
end;

function TRHOperacionalAusenciasDAO.FindByID(iID: Integer): TObjectList<TRHOperacionalAusencias>;
var
  FDQuery: TFDQuery;
  ausencias: TObjectList<TRHOperacionalAusencias>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE ID_AUSENCIA = :pID_AUSENCIA');
    FDQuery.ParamByName('pID_AUSENCIA').AsInteger := iID;
    FDQuery.Open();
    ausencias := TObjectList<TRHOperacionalAusencias>.Create();
    while not FDQuery.Eof do
    begin
      ausencias.Add(TRHOperacionalAusencias.Create(FDQuery.FieldByName('ID_AUSENCIA').AsInteger,
                                       FDQuery.FieldByName('DAT_OPERACAO').AsDateTime,
                                       FDQuery.FieldByName('COD_CADASTRO').AsInteger,
                                       FDQuery.FieldByName('COD_STATUS_OPERACAO').AsString,
                                       FDQuery.FieldByName('DES_OBSERVACOES').AsString,
                                       FDQuery.FieldByName('ID_REFERENCIA').AsInteger,
                                       FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := ausencias;
end;

function TRHOperacionalAusenciasDAO.FindByEntregador(iEntregador: Integer): TObjectList<TRHOperacionalAusencias>;
var
  FDQuery: TFDQuery;
  ausencias: TObjectList<TRHOperacionalAusencias>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE COD_CADASTRO = :pCOD_CADASTRO');
    FDQuery.ParamByName('pCOD_CADASTRO').AsInteger := iEntregador;
    FDQuery.Open();
    ausencias := TObjectList<TRHOperacionalAusencias>.Create();
    while not FDQuery.Eof do
    begin
      ausencias.Add(TRHOperacionalAusencias.Create(FDQuery.FieldByName('ID_AUSENCIA').AsInteger,
                                       FDQuery.FieldByName('DAT_OPERACAO').AsDateTime,
                                       FDQuery.FieldByName('COD_CADASTRO').AsInteger,
                                       FDQuery.FieldByName('COD_STATUS_OPERACAO').AsString,
                                       FDQuery.FieldByName('DES_OBSERVACOES').AsString,
                                       FDQuery.FieldByName('ID_REFERENCIA').AsInteger,
                                       FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := ausencias;
end;

function TRHOperacionalAusenciasDAO.FindByData(dtData: TDate): TObjectList<TRHOperacionalAusencias>;
var
  FDQuery: TFDQuery;
  ausencias: TObjectList<TRHOperacionalAusencias>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE DAT_OPERACAO = :pDAT_OPERACAO');
    FDQuery.ParamByName('pDAT_OPERACAO').AsDate := dtData;
    FDQuery.Open();
    ausencias := TObjectList<TRHOperacionalAusencias>.Create();
    while not FDQuery.Eof do
    begin
      ausencias.Add(TRHOperacionalAusencias.Create(FDQuery.FieldByName('ID_AUSENCIA').AsInteger,
                                       FDQuery.FieldByName('DAT_OPERACAO').AsDateTime,
                                       FDQuery.FieldByName('COD_CADASTRO').AsInteger,
                                       FDQuery.FieldByName('COD_STATUS_OPERACAO').AsString,
                                       FDQuery.FieldByName('DES_OBSERVACOES').AsString,
                                       FDQuery.FieldByName('ID_REFERENCIA').AsInteger,
                                       FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := ausencias;
end;

function TRHOperacionalAusenciasDAO.FindByPeriodo(dtData1: TDate; dtData2: TDate): TObjectList<TRHOperacionalAusencias>;
var
  FDQuery: TFDQuery;
  ausencias: TObjectList<TRHOperacionalAusencias>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE DAT_OPERACAO BETWEEN :pDAT_OPERACAO1 AND :pDAT_OPERACAO2');
    FDQuery.ParamByName('pDAT_OPERACAO1').AsDate := dtData1;
    FDQuery.ParamByName('pDAT_OPERACAO2').AsDate := dtData2;
    FDQuery.Open();
    ausencias := TObjectList<TRHOperacionalAusencias>.Create();
    while not FDQuery.Eof do
    begin
      ausencias.Add(TRHOperacionalAusencias.Create(FDQuery.FieldByName('ID_AUSENCIA').AsInteger,
                                       FDQuery.FieldByName('DAT_OPERACAO').AsDateTime,
                                       FDQuery.FieldByName('COD_CADASTRO').AsInteger,
                                       FDQuery.FieldByName('COD_STATUS_OPERACAO').AsString,
                                       FDQuery.FieldByName('DES_OBSERVACOES').AsString,
                                       FDQuery.FieldByName('ID_REFERENCIA').AsInteger,
                                       FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := ausencias;
end;

function TRHOperacionalAusenciasDAO.FindByOperacao(dtData: TDate; iEntregador: Integer): TObjectList<TRHOperacionalAusencias>;
var
  FDQuery: TFDQuery;
  ausencias: TObjectList<TRHOperacionalAusencias>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE DAT_OPERACAO = :pDAT_OPERACAO AND COD_CADASTRO = pCOD_CADASTRO');
    FDQuery.ParamByName('pDAT_OPERACAO').AsDate := dtData;
    FDQuery.ParamByName('pCOD_CADASTRO').AsInteger := iEntregador;
    FDQuery.Open();
    ausencias := TObjectList<TRHOperacionalAusencias>.Create();
    while not FDQuery.Eof do
    begin
      ausencias.Add(TRHOperacionalAusencias.Create(FDQuery.FieldByName('ID_AUSENCIA').AsInteger,
                                       FDQuery.FieldByName('DAT_OPERACAO').AsDateTime,
                                       FDQuery.FieldByName('COD_CADASTRO').AsInteger,
                                       FDQuery.FieldByName('COD_STATUS_OPERACAO').AsString,
                                       FDQuery.FieldByName('DES_OBSERVACOES').AsString,
                                       FDQuery.FieldByName('ID_REFERENCIA').AsInteger,
                                       FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := ausencias;
end;

end.
