unit DAO.ApontamentoOperacional;

interface

uses DAO.Base, Model.ApontamentoOperacional, Generics.Collections, System.Classes;

type
  TApontamentoOperacionalDAO = class(TDAO)
  public
    function Insert(aApontamentos: TApontamentoOperacional): Boolean;
    function Update(aApontamentos: TApontamentoOperacional): Boolean;
    function Delete(iID: Integer): Boolean;
    function FindByID(iID: Integer): TObjectList<TApontamentoOperacional>;
    function FindByEntregador(iEntregador: Integer): TObjectList<TApontamentoOperacional>;
    function FindByData(dtData: TDate): TObjectList<TApontamentoOperacional>;
    function FindByPeriodo(dtData1: TDate; dtData2: TDate): TObjectList<TApontamentoOperacional>;
  end;
const
  TABLENAME = 'jor_operacao_jornal';

implementation

uses System.SysUtils, FireDAC.Comp.Client, Data.DB;

function TApontamentoOperacionalDAO.Insert(aApontamentos: TApontamentoOperacional): Boolean;
var
  sSQL : System.string;
begin
  Result := False;
  aApontamentos.ID := GetKeyValue(TABLENAME,'ID_OPERACAO');
  sSQL := 'INSERT INTO ' + TABLENAME +
          '(ID_OPERACAO, COD_ENTREGADOR, COD_ROTEIRO_ANTIGO, DAT_OPERACAO, COD_STATUS_OPERACAO, COD_ROTEIRO_NOVO, ' +
          'DES_OBSERVACOES, DOM_PLANILHA, ID_REFERENCIA, DAT_REFERENCIA, DES_LOG) ' +
          'VALUES ' +
          '(:pID_OPERACAO, :pCOD_ENTREGADOR, :pCOD_ROTEIRO_ANTIGO, :pDAT_OPERACAO, :pCOD_STATUS_OPERACAO, :pCOD_ROTEIRO_NOVO, ' +
          ':pDES_OBSERVACOES, :pDOM_PLANILHA, :pID_REFERENCIA, :pDAT_REFERENCIA, :pDES_LOG);';
  Connection.ExecSQL(sSQL,[aApontamentos.ID, aApontamentos.Entregador, aApontamentos.RoteiroAntigo, aApontamentos.Data,
                           aApontamentos.StatusOperacao, aApontamentos.RoteiroNovo, aApontamentos.Obs, aApontamentos.Planilha,
                           aApontamentos.IDReferencia, aApontamentos.DataReferencia, aApontamentos.Log],
                           [ftInteger, ftInteger, ftString, ftDate, ftString, ftString, ftString, ftString, ftInteger,
                            ftDate, ftString]);
  Result := True;
end;

function TApontamentoOperacionalDAO.Update(aApontamentos: TApontamentoOperacional): Boolean;
var
  sSQL : System.string;
begin
  Result := False;
  sSQL := 'UPDATE ' + TABLENAME + ' SET ' +
          'COD_ENTREGADOR = :pCOD_ENTREGADOR, COD_ROTEIRO_ANTIGO = :pCOD_ROTEIRO_ANTIGO, ' +
          'DAT_OPERACAO = :pDAT_OPERACAO, COD_STATUS_OPERACAO = :pCOD_STATUS_OPERACAO, COD_ROTEIRO_NOVO = :pCOD_ROTEIRO_NOVO, ' +
          'DES_OBSERVACOES = :pDES_OBSERVACOES, DOM_PLANILHA = :pDOM_PLANILHA, ID_REFERENCIA = :pID_REFERENCIA, ' +
          'DAT_REFERENCIA = :pDAT_REFERENCIA, DES_LOG = :pDES_LOG ' +
          'WHERE ID_OPERACAO = :pID_OPERACAO;';

  Connection.ExecSQL(sSQL,[aApontamentos.Entregador, aApontamentos.RoteiroAntigo, aApontamentos.Data,
                           aApontamentos.StatusOperacao, aApontamentos.RoteiroNovo, aApontamentos.Obs, aApontamentos.Planilha,
                           aApontamentos.IDReferencia, aApontamentos.DataReferencia, aApontamentos.Log, aApontamentos.ID],
                           [ftInteger, ftString, ftDate, ftString, ftString, ftString, ftString, ftInteger,
                            ftDate, ftString, ftInteger]);
  Result := True;
end;

function TApontamentoOperacionalDAO.Delete(iID: Integer): Boolean;
var
  sSQL : String;
begin
  Result := False;
  sSQL := 'DELETE FROM ' + TABLENAME + ' WHERE ID_OPERACAO = :pID_OPERACAO;';
  Connection.ExecSQL(sSQL,[iID],[ftInteger]);
  Result := True;
end;

function TApontamentoOperacionalDAO.FindByID(iID: Integer): TObjectList<TApontamentoOperacional>;
var
  FDQuery: TFDQuery;
  apontamentos: TObjectList<TApontamentoOperacional>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE ID_OPERACAO = :pID_OPERACAO');
    FDQuery.ParamByName('pID_OPERACAO').AsInteger := iID;
    FDQuery.Open();
    apontamentos := TObjectList<TApontamentoOperacional>.Create();
    while not FDQuery.Eof do
    begin
      apontamentos.Add(TApontamentoOperacional.Create(FDQuery.FieldByName('ID_OPERACAO').AsInteger,
                                       FDQuery.FieldByName('COD_ENTREGADOR').AsInteger,
                                       FDQuery.FieldByName('COD_ROTEIRO_ANTIGO').AsString,
                                       FDQuery.FieldByName('DAT_OPERACAO').AsDateTime,
                                       FDQuery.FieldByName('COD_STATUS_OPERACAO').AsString,
                                       FDQuery.FieldByName('COD_ROTEIRO_NOVO').AsString,
                                       FDQuery.FieldByName('DES_OBSERVACOES').AsString,
                                       FDQuery.FieldByName('DOM_PLANILHA').AsString,
                                       FDQuery.FieldByName('ID_REFERENCIA').AsInteger,
                                       FDQuery.FieldByName('DAT_REFERENCIA').AsDateTime,
                                       FDQuery.FieldByName('DES_LOG').AsString));

      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := apontamentos;
end;

function TApontamentoOperacionalDAO.FindByEntregador(iEntregador: Integer): TObjectList<TApontamentoOperacional>;
var
  FDQuery: TFDQuery;
  apontamentos: TObjectList<TApontamentoOperacional>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE COD_ENTREGADOR = :pCOD_ENTREGADOR');
    FDQuery.ParamByName('pCOD_ENTREGADOR').AsInteger := iEntregador;
    FDQuery.Open();
    apontamentos := TObjectList<TApontamentoOperacional>.Create();
    while not FDQuery.Eof do
    begin
      apontamentos.Add(TApontamentoOperacional.Create(FDQuery.FieldByName('ID_OPERACAO').AsInteger,
                                       FDQuery.FieldByName('COD_ENTREGADOR').AsInteger,
                                       FDQuery.FieldByName('COD_ROTEIRO_ANTIGO').AsString,
                                       FDQuery.FieldByName('DAT_OPERACAO').AsDateTime,
                                       FDQuery.FieldByName('COD_STATUS_OPERACAO').AsString,
                                       FDQuery.FieldByName('COD_ROTEIRO_NOVO').AsString,
                                       FDQuery.FieldByName('DES_OBSERVACOES').AsString,
                                       FDQuery.FieldByName('DOM_PLANILHA').AsString,
                                       FDQuery.FieldByName('ID_REFERENCIA').AsInteger,
                                       FDQuery.FieldByName('DAT_REFERENCIA').AsDateTime,
                                       FDQuery.FieldByName('DES_LOG').AsString));

      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := apontamentos;
end;

function TApontamentoOperacionalDAO.FindByData(dtData: TDate): TObjectList<TApontamentoOperacional>;
var
  FDQuery: TFDQuery;
  apontamentos: TObjectList<TApontamentoOperacional>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE DAT_OPERACAO = :pDAT_OPERACAO');
    FDQuery.ParamByName('pDAT_OPERACAO').AsDate := dtData;
    FDQuery.Open();
    apontamentos := TObjectList<TApontamentoOperacional>.Create();
    while not FDQuery.Eof do
    begin
      apontamentos.Add(TApontamentoOperacional.Create(FDQuery.FieldByName('ID_OPERACAO').AsInteger,
                                       FDQuery.FieldByName('COD_ENTREGADOR').AsInteger,
                                       FDQuery.FieldByName('COD_ROTEIRO_ANTIGO').AsString,
                                       FDQuery.FieldByName('DAT_OPERACAO').AsDateTime,
                                       FDQuery.FieldByName('COD_STATUS_OPERACAO').AsString,
                                       FDQuery.FieldByName('COD_ROTEIRO_NOVO').AsString,
                                       FDQuery.FieldByName('DES_OBSERVACOES').AsString,
                                       FDQuery.FieldByName('DOM_PLANILHA').AsString,
                                       FDQuery.FieldByName('ID_REFERENCIA').AsInteger,
                                       FDQuery.FieldByName('DAT_REFERENCIA').AsDateTime,
                                       FDQuery.FieldByName('DES_LOG').AsString));

      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := apontamentos;
end;

function TApontamentoOperacionalDAO.FindByPeriodo(dtData1: TDate; dtData2: TDate): TObjectList<TApontamentoOperacional>;
var
  FDQuery: TFDQuery;
  apontamentos: TObjectList<TApontamentoOperacional>;
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
    apontamentos := TObjectList<TApontamentoOperacional>.Create();
    while not FDQuery.Eof do
    begin
      apontamentos.Add(TApontamentoOperacional.Create(FDQuery.FieldByName('ID_OPERACAO').AsInteger,
                                       FDQuery.FieldByName('COD_ENTREGADOR').AsInteger,
                                       FDQuery.FieldByName('COD_ROTEIRO_ANTIGO').AsString,
                                       FDQuery.FieldByName('DAT_OPERACAO').AsDateTime,
                                       FDQuery.FieldByName('COD_STATUS_OPERACAO').AsString,
                                       FDQuery.FieldByName('COD_ROTEIRO_NOVO').AsString,
                                       FDQuery.FieldByName('DES_OBSERVACOES').AsString,
                                       FDQuery.FieldByName('DOM_PLANILHA').AsString,
                                       FDQuery.FieldByName('ID_REFERENCIA').AsInteger,
                                       FDQuery.FieldByName('DAT_REFERENCIA').AsDateTime,
                                       FDQuery.FieldByName('DES_LOG').AsString));

      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := apontamentos;
end;


end.
