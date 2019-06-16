unit DAO.ManutencaoVeiculos;

interface

uses DAO.base, Model.ManutencaoVeiculos, Generics.Collections, System.Classes;

type TManutencaoVeiculosDAO = class(TDAO)
public
  function Insert(aManutencao: Model.ManutencaoVeiculos.TManutencaoVeiculos): Boolean;
  function Update(aManutencao: Model.ManutencaoVeiculos.TManutencaoVeiculos): Boolean;
  function Delete(sFiltro: String): Boolean;
  function FindManutencao(sFiltro: String): TObjectList<Model.ManutencaoVeiculos.TManutencaoVeiculos>;
end;

const
  TABLENAME = 'tbmanutencaoveiculos';

implementation

uses System.SysUtils, FireDAC.Comp.Client, Data.DB;

function TManutencaoVeiculosDAO.Insert(aManutencao: TManutencaoVeiculos): Boolean;
var
  sSQL: String;
begin
  Result := False;
  aManutencao.ID := GetKeyValue(TABLENAME, 'ID_MANUTENCAO');
  sSQL := 'INSERT INTO ' + TABLENAME + ' ' +
          '(ID_MANUTENCAO, DES_TIPO, COD_VEICULO, COD_MOTORISTA, ID_ITEM, DAT_MANUTENCAO, QTD_KM_MANUTENCAO, DAT_PREVISAO, '  +
          'QTD_KM_PREVISAO, VAL_CUSTO_MANUTENCAO, DAT_LIBERACAO, DOM_SITUACAO, DES_OBS, DES_ARQUIVO, COD_CCUSTO, DES_LOG) ' +
          'VALUES ' +
          '(:ID, :TIPO, :VEICULO, :MOTORISTA, :ITEM, :DATAMANUTENCAO, :KMMANUTENCAO, :DATAPREVISAO, :KMPREVISAO, :VALOR, ' +
          ':DATALIBERACAO, :SITUACAO, :OBS, :ARQUIVO, :CCUSTO, :LOG);';

  Connection.ExecSQL(sSQL,[aManutencao.ID, aManutencao.Tipo, aManutencao.Veiculo, aManutencao.Motorista, aManutencao.Item,
                           aManutencao.DataManutencao, aManutencao.KMManutencao, aManutencao.DataPrevisao, aManutencao.KMPrevisao,
                           aManutencao.Valor, aManutencao.DataLiberacao, aManutencao.Situacao, aManutencao.Obs, aManutencao.Arquivo,
                           aManutencao.CCusto, aManutencao.Log], [ftInteger, ftString, ftInteger, ftInteger, ftinteger, ftDate,
                           ftFloat, ftDate, ftFloat, ftFloat, ftDate, ftInteger, ftString, ftString, ftInteger, ftString]);
  Result := True;
end;

function TManutencaoVeiculosDAO.Update(aManutencao: TManutencaoVeiculos): Boolean;
var
  sSQL: String;
begin
  Result := False;
  sSQL := 'UPDATE  ' + TABLENAME + ' ' +
          'SET ' +
          'DES_TIPO = :TIPO, COD_VEICULO = :VEICULO, COD_MOTORISTA = : MOTORISTA, ID_ITEM = :ITEM, ' +
          'DAT_MANUTENCAO = :DATAMANUTENCAO, QTD_KM_MANUTENCAO = :KMMANUTENCAO, DAT_PREVISAO = :DATAPREVISAO, ' +
          'QTD_KM_PREVISAO = :KMPREVISAO, VAL_CUSTO_MANUTENCAO = :VALOR, DAT_LIBERACAO = :DATALIBERACAO, ' +
          'DOM_SITUACAO = :SITUACAO, DES_OBS = :OBS, DES_ARQUIVO = :ARQUIVO, COD_CCUSTO = :CCUSTO, DES_LOG = :LOG ' +
          'WHERE ID_MANUTENCAO = :ID;';

  Connection.ExecSQL(sSQL,[aManutencao.Tipo, aManutencao.Veiculo, aManutencao.Motorista, aManutencao.Item,
                           aManutencao.DataManutencao, aManutencao.KMManutencao, aManutencao.DataPrevisao, aManutencao.KMPrevisao,
                           aManutencao.Valor, aManutencao.DataLiberacao, aManutencao.Situacao, aManutencao.Obs, aManutencao.Arquivo,
                           aManutencao.CCusto, aManutencao.Log, aManutencao.ID], [FtString, ftInteger, ftInteger, ftinteger, ftDate,
                           ftFloat, ftDate, ftFloat, ftFloat, ftDate, ftInteger, ftString, ftString, ftInteger, ftString,
                           ftInteger]);
  Result := True;
end;

function TManutencaoVeiculosDAO.Delete(sFiltro: string): Boolean;
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

function TManutencaoVeiculosDAO.FindManutencao(sFiltro: string): TObjectList<TManutencaoVeiculos>;
var
  FDQuery: TFDQuery;
  manutencao: TObjectList<TManutencaoVeiculos>;
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
    manutencao := TObjectList<TManutencaoVeiculos>.Create();
    while not FDQuery.Eof do
    begin
      manutencao.Add(TManutencaoVeiculos.Create(FDQuery.FieldByName('ID_MANUTENCAO').AsInteger,
      FDQuery.FieldByName('DES_TIPO').AsString, FDQuery.FieldByName('COD_VEICULO').AsInteger,
      FDQuery.FieldByName('COD_MOTORISTA').AsInteger,  FDQuery.FieldByName('ID_ITEM').AsInteger,
      FDQuery.FieldByName('DAT_MANUTENCAO').AsDateTime, FDQuery.FieldByName('QTD_KM_MANUTENCAO').AsFloat,
      FDQuery.FieldByName('DAT_PREVISAO').AsDateTime, FDQuery.FieldByName('QTD_KM_PREVISAO').AsFloat,
      FDQuery.FieldByName('VAL_CUSTO_MANUTENCAO').AsFloat, FDQuery.FieldByName('DAT_LIBERACAO').AsDateTime,
      FDQuery.FieldByName('DOM_SITUACAO').AsInteger, FDQuery.FieldByName('DES_OBS').AsString,
      FDQuery.FieldByName('DES_ARQUIVO').AsString, FDQuery.FieldByName('COD_CCUSTO').AsInteger,
      FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := manutencao;
end;

end.
