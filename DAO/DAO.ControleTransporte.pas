unit DAO.ControleTransporte;

interface

uses DAO.base, Model.ControleTransporte, Generics.Collections, System.Classes;

type
  TControleTransporteDAO = class(TDAO)
  public
    function Insert(aControle: Model.ControleTransporte.TControleTransporte) : Boolean;
    function Update(aControle: Model.ControleTransporte.TControleTransporte) : Boolean;
    function Delete(sFiltro: String): Boolean;
    function FindControle(sFiltro: String): TObjectList<TControleTransporte>;
  end;

CONST
  TABLENAME = 'tbcontroletransporte';

implementation

uses System.SysUtils, FireDAC.Comp.Client, Data.DB;

function TControleTransporteDAO.Insert(aControle : Model.ControleTransporte.TControleTransporte): Boolean;
var
  sSQL : String;
begin
  Result := False;
  aControle.ID := GetKeyValue(TABLENAME,'ID_CONTROLE');
  sSQL := 'INSERT INTO ' + TABLENAME + ' ' +
          '(ID_CONTROLE, NUM_SM, DAT_TRANSPORTE, COD_CLIENTE, DES_OPERACAO, DES_PLACA, COD_MOTORISTA, QTD_KM_SAIDA, HOR_SAIDA, ' +
          'QTD_KM_RETORNO, HOR_RETORNO, QTD_KM_RODADO, DES_SERVICO, DES_OBS, VAL_SERVICO, COD_STATUS, DES_LOG) ' +
          'VALUES (' +
          ':ID, :SM, :DATA, :CLIENTE, :OPERACAO, :PLACA, :MOTORISTA, :KMSAIDA, :HORSAIDA, :KMRETORNO, :HORRETORNO, :KMRODADO, ' +
          ':SERVICO, :OBS, :VALSERVICO, :STATUS, :LOG);';
  Connection.ExecSQL(sSQL,[aControle.ID, aControle.SM, aControle.DataTransporte, aControle.Cliente, aControle.Operacao, aControle.Placa,
                          aControle.Motorista, aControle.KmSaida, aControle.HoraSaida, aControle.KmRetorno, aControle.HoraRetorno,
                          aControle.KmRodado, aControle.Servico, aControle.Obs, aControle.ValServico, aControle.Status,
                          aControle.Log], [ftInteger, ftString, ftDate, ftInteger, ftString, ftString, ftInteger, ftFloat, ftTime,
                          ftFloat, ftTime, ftFloat, ftString, ftString, ftFloat, ftInteger, ftString]);
  Result := True;
end;

function TControleTransporteDAO.Update(aControle : Model.ControleTransporte.TControleTransporte): Boolean;
var
  sSQl : String;
begin
  Result := False;
  sSQL := 'UPDATE ' + TABLENAME + ' ' +
          'SET ' +
          'NUM_SM = :SM, ' +
          'DAT_TRANSPORTE = :DATA, COD_CLIENTE = :CLIENTE, DES_OPERACAO = :OPERACAO, DES_PLACA = :PLACA, ' +
          'COD_MOTORISTA = :MOTORISTA, QTD_KM_SAIDA = :KMSAIDA, HOR_SAIDA  = :HORSAIDA, QTD_KM_RETORNO = :KMRETORNO, ' +
          'HOR_RETORNO = :HORRETORNO, QTD_KM_RODADO = :KMRODADO, DES_SERVICO = :SERVICO, DES_OBS = :OBS, ' +
          'VAL_SERVICO = :VALSERVICO, COD_STATUS = :STATUS, DES_LOG = :LOG ' +
          'WHERE ID_CONTROLE = :ID;';

  Connection.ExecSQL(sSQL,[aControle.SM, aControle.DataTransporte, aControle.Cliente, aControle.Operacao, aControle.Placa,
                          aControle.Motorista, aControle.KmSaida, aControle.HoraSaida, aControle.KmRetorno, aControle.HoraRetorno,
                          aControle.KmRodado, aControle.Servico, aControle.Obs, aControle.ValServico, aControle.Status,
                          aControle.Log, aControle.ID], [ftString, ftDate, ftInteger, ftString, ftString, ftInteger, ftFloat, ftTime,
                          ftFloat, ftTime, ftFloat, ftString, ftString, ftFloat, ftInteger, ftString, ftInteger]);
  Result := True;
end;

function TControleTransporteDAO.Delete(sFiltro: String): Boolean;
var
  sSQL : String;
begin
  Result := False;
  sSQL := 'DELETE FROM ' + TABLENAME + ' ';
  if not sFiltro.IsEmpty then
  begin
    sSQl := sSQL + sFiltro;
  end
  else
  begin
    Exit;
  end;
  Result := True;
end;

function TControleTransporteDAO.FindControle(sFiltro: String): TObjectList<TControleTransporte>;
var
  FDQuery: TFDQuery;
  Extratos: TObjectList<TControleTransporte>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    if not sFiltro.IsEmpty then
    begin
      FDQuery.SQL.Add(sFiltro);
    end;
    FDQuery.Open();
    Extratos := TObjectList<TControleTransporte>.Create();
    while not FDQuery.Eof do
    begin
      Extratos.Add(TControleTransporte.Create(FDQuery.FieldByName('ID_CONTROLE').AsInteger,
                   FDQuery.FieldByName('NUM_SM').AsString, FDQuery.FieldByName('DAT_TRANSPORTE').AsDateTime,
                   FDQuery.FieldByName('COD_CLIENTE').AsInteger, FDQuery.FieldByName('DES_OPERACAO').AsString,
                   FDQuery.FieldByName('DES_PLACA').AsString, FDQuery.FieldByName('COD_MOTORISTA').AsInteger,
                   FDQuery.FieldByName('QTD_KM_SAIDA').AsFloat, FDQuery.FieldByName('HOR_SAIDA').AsDateTime,
                   FDQuery.FieldByName('QTD_KM_RETORNO').AsFloat, FDQuery.FieldByName('HOR_RETORNO').AsDateTime,
                   FDQuery.FieldByName('QTD_KM_RODADO').AsFloat, FDQuery.FieldByName('DES_SERVICO').AsString,
                   FDQuery.FieldByName('DES_OBS').AsString, FDQuery.FieldByName('VAL_SERVICO').AsFloat,
                   FDQuery.FieldByName('COD_STATUS').AsInteger, FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := Extratos;
end;
end.
