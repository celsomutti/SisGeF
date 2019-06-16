unit DAO.ExtratoExpressas;

interface

uses DAO.Base, Model.ExtratoExpressas, Generics.Collections, System.Classes;

type
  TExtratoExpressasDAO = class(TDAO)
  private
  public
    function Insert(aExtrato: TExtratoExpressas): Boolean;
    function Update(aExtrato: TExtratoExpressas): Boolean;
    function Delete(sFiltro: String): Boolean;
    function FindExtrato(sFiltro: String): TObjectList<TExtratoExpressas>;
    function FindDatas(): TStringList;
  end;

const
  TABLENAME = 'tbextratosexpressas';
implementation

{TExtratoExpressasDAO}

uses System.SysUtils, FireDAC.Comp.Client, Data.DB;

function TExtratoExpressasDAO.Insert(aExtrato: TExtratoExpressas): Boolean;
var
  sSQL: String;
begin
  Result := False;
  sSQL := 'INSERT INTO ' + TABLENAME +
          '(COD_TIPO, NUM_EXTRATO, COD_CLIENTE, DAT_BASE, DAT_INICIO, DAT_TERMINO, COD_CADASTRO, COD_DISTRIBUIDOR, ' +
          'NOM_DISTRIBUIDOR, VAL_PERCENTUAL_DISTRIBUIDOR, COD_ENTREGADOR, NOM_ENTREGADOR, VAL_PERCENTUAL_ENTREGADOR, ' +
          'VAL_VERBA, QTD_VOLUMES, QTD_VOLUMES_EXTRA, QTD_ENTREGA, QTD_ATRASOS, VAL_VERBA_TOTAL, VAL_VOLUMES_EXTRA, ' +
          'VAL_CREDITO, VAL_RESTRICAO, VAL_ABASTECIMENTO, VAL_PENALIDADE_ATRASOS, VAL_DEBITO, VAL_TOTAL_CREDITOS, ' +
          'VAL_TOTAL_DEBITOS, VAL_TOTAL_GERAL, DOM_PAGO, DAT_PAGO, DOM_FECHADO, DAT_FECHAMENTO, NOM_EXECUTANTE, DAT_MANUTENCAO) ' +
          'VALUES (' +
          ':TIPO, :EXTRATO, :CLIENTE, :BASE, :INICIO, :TERMINO, :CADASTRO, :CODDISTRIBUIDOR, :NOMDISTRIBUIDOR, ' +
          ':PERCENTUALDISTRIBUIDOR, :CODENTREGADOR, :NOMENTREGADOR, :PERCENTUALENTREGADOR, :VALVERBA, :VOLUMES, :VOLUMESEXTRA, ' +
          ':ENTREGA, :ATRASOS, :VERBATOTAL, :VALVOLUMESEXTRA, :VALCREDITO, :VALRESTRICAO, :VALABASTECIMENTO, ' +
          ':VALPENALIDADEATRASOS, :VALDEBITO, :VALTOTALCREDITOS, :VALTOTALDEBITOS, :VALTOTALGERAL, :PAGO, :DATPAGO, :FECHADO, ' +
          ':DATFECHAMENTO, :EXECUTANTE, :MANUTENCAO);';
  Connection.ExecSQL(sSQL,[aExtrato.Tipo, aExtrato.NumeroExtrato, aExtrato.Cliente, aExtrato.DataBase, aExtrato.DataInicio,
                          aExtrato.DataTermino, aExtrato.Cadastro, aExtrato.Codigodistribuidor, aExtrato.NomeDistribuidor,
                          aExtrato.PercentualDistribuidor, aExtrato.CodigoEntregador, aExtrato.NomeEntregador,
                          aExtrato.PercentualEntregador, aExtrato.Verba, aExtrato.Volumes, aExtrato.VolumesExtra,
                          aExtrato.Entregas, aExtrato.Atrasos, aExtrato.VerbaTotal, aExtrato.ValorVolumesExtra, aExtrato.Creditos,
                          aExtrato.Restricao, aExtrato.Abastecimentos, aExtrato.PenalizadaAtrasos, aExtrato.Debitos,
                          aExtrato.TotalCreaditos, aExtrato.TotalDebitos, aExtrato.TotalGeral, aExtrato.Pago, aExtrato.DataPago,
                          aExtrato.Fechado, aExtrato.DataFechado, aExtrato.Executante, aExtrato.Manutencao], [ftInteger, ftString,
                          ftInteger, ftDate, ftDate, ftDate, ftInteger, ftInteger, ftString, ftFloat, ftInteger, ftString, ftFloat,
                          ftFloat, ftInteger, ftFloat, ftInteger, ftInteger, ftFloat, ftFloat, ftFloat, ftFloat, ftFloat, ftFloat,
                          ftFloat, ftFloat, ftFloat, ftFloat, ftString, ftDate, ftString, ftDate, ftString, ftDateTime]);
  Result := True;
end;
function TExtratoExpressasDAO.Update(aExtrato: TExtratoExpressas): Boolean;
var
  sSQL: String;
begin
  Result := False;
  sSQL := 'UPDATE ' + TABLENAME +
          'SET ' +
          'COD_TIPO = :TIPO, NUM_EXTRATO :EXTRATO:, COD_CLIENTE = :CLIENTE, DAT_BASE = :DATABASE, DAT_INICIO = :INICIO, ' +
          'DAT_TERMINO = :TERMINO, COD_CADASTRO = :CADASTRO, COD_DISTRIBUIDOR = :CODDISTRIBUIDOR, ' +
          'NOM_DISTRIBUIDOR = :NOMDISTRIBUIDOR, VAL_PERCENTUAL_DISTRIBUIDOR = :PERCENTUALDISTRIBUIDOR, ' +
          'COD_ENTREGADOR = :CODENTREGADOR, NOM_ENTREGADOR = :NOMENTREGADOR, VAL_PERCENTUAL_ENTREGADOR = :PERCENTUALENTREGADOR, ' +
          'VAL_VERBA = :VALVERBA, QTD_VOLUMES = :VOLUMES, QTD_VOLUMES_EXTRA = :VOLUMESEXTRA, QTD_ENTREGA = :ENTREGA, ' +
          'QTD_ATRASOS = :ATRASOS, VAL_VERBA_TOTAL = :VERBATOTAL, VAL_VOLUMES_EXTRA = :VALVOLUMESEXTRA, ' +
          'VAL_CREDITO = :VALCREDITO, VAL_RESTRICAO = :VALRESTRICAO, VAL_ABASTECIMENTO = :VALABASTECIMENTO, ' +
          'VAL_PENALIDADE_ATRASOS = :VALPENALIDADEATRASOS, VAL_DEBITO = :VALDEBITO, VAL_TOTAL_CREDITOS = :VALTOTALCREDITOS, ' +
          'VAL_TOTAL_DEBITOS = :VALTOTALDEBITOS, VAL_TOTAL_GERAL = :VALTOTALGERAL, DOM_PAGO = :PAGO, DAT_PAGO = :DATPAGO, ' +
          'DOM_FECHADO = :FECHADO, DAT_FECHAMENTO = :DATFECHAMENTO, NOM_EXECUTANTE = :EXECUTANTE, DAT_MANUTENCAO = :MANUTENCAO ' +
          'WHERE COD_TIPO = :TIPO AND COD_CLIENTE = :CLIENTE AND DAT_INICIO = :INICIO AND DAT_TERMINO = :TERMINO AND ' +
          'COD_DISTRIBUIDOR = :CODDISTRIBUIDOR AND COD_ENTREGADOR = :CODENTREGADOR;';
  Connection.ExecSQL(sSQL,[aExtrato.Tipo, aExtrato.NumeroExtrato, aExtrato.Cliente, aExtrato.DataBase, aExtrato.DataInicio,
                          aExtrato.DataTermino, aExtrato.Cadastro, aExtrato.Codigodistribuidor, aExtrato.NomeDistribuidor,
                          aExtrato.PercentualDistribuidor, aExtrato.CodigoEntregador, aExtrato.NomeEntregador,
                          aExtrato.PercentualEntregador, aExtrato.Verba, aExtrato.Volumes, aExtrato.VolumesExtra,
                          aExtrato.Entregas, aExtrato.Atrasos, aExtrato.VerbaTotal, aExtrato.ValorVolumesExtra, aExtrato.Creditos,
                          aExtrato.Restricao, aExtrato.Abastecimentos, aExtrato.PenalizadaAtrasos, aExtrato.Debitos,
                          aExtrato.TotalCreaditos, aExtrato.TotalDebitos, aExtrato.TotalGeral, aExtrato.Pago, aExtrato.DataPago,
                          aExtrato.Fechado, aExtrato.DataFechado, aExtrato.Executante, aExtrato.Manutencao], [ftInteger, ftString,
                          ftInteger, ftDate, ftDate, ftDate, ftInteger, ftInteger, ftString, ftFloat, ftInteger, ftString, ftFloat,
                          ftFloat, ftInteger, ftFloat, ftInteger, ftInteger, ftFloat, ftFloat, ftFloat, ftFloat, ftFloat, ftFloat,
                          ftFloat, ftFloat, ftFloat, ftFloat, ftString, ftDate, ftString, ftDate, ftString, ftDateTime]);
  Result := True;
end;

function TExtratoExpressasDAO.Delete(sFiltro: String): Boolean;
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

function TExtratoExpressasDAO.FindExtrato(sFiltro: String): TObjectList<TExtratoExpressas>;
var
  FDQuery: TFDQuery;
  Extratos: TObjectList<TExtratoExpressas>;
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
    Extratos := TObjectList<TExtratoExpressas>.Create();
    while not FDQuery.Eof do
    begin
      Extratos.Add(TExtratoExpressas.Create(FDQuery.FieldByName('COD_TIPO').AsInteger, FDQuery.FieldByName('NUM_EXTRATO').AsString,
                   FDQuery.FieldByName('COD_CLIENTE').AsInteger, FDQuery.FieldByName('DAT_BASE').AsDateTime,
                   FDQuery.FieldByName('DAT_INICIO').AsDateTime, FDQuery.FieldByName('DAT_TERMINO').AsDateTime,
                   FDQuery.FieldByName('COD_CADASTRO').AsInteger, FDQuery.FieldByName('COD_DISTRIBUIDOR').AsInteger,
                   FDQuery.FieldByName('NOM_DISTRIBUIDOR').AsString, FDQuery.FieldByName('VAL_PERCENTUAL_DISTRIBUIDOR').AsFloat,
                   FDQuery.FieldByName('COD_ENTREGADOR').AsInteger, FDQuery.FieldByName('NOM_ENTREGADOR').AsString,
                   FDQuery.FieldByName('VAL_PERCENTUAL_ENTREGADOR').AsFloat, FDQuery.FieldByName('VAL_VERBA').AsFloat,
                   FDQuery.FieldByName('QTD_VOLUMES').AsInteger, FDQuery.FieldByName('QTD_VOLUMES_EXTRA').AsFloat,
                   FDQuery.FieldByName('QTD_ENTREGA').AsInteger, FDQuery.FieldByName('QTD_ATRASOS').AsInteger,
                   FDQuery.FieldByName('VAL_VERBA_TOTAL').AsFloat, FDQuery.FieldByName('VAL_VOLUMES_EXTRA').AsFloat,
                   FDQuery.FieldByName('VAL_CREDITO').AsFloat, FDQuery.FieldByName('VAL_RESTRICAO').AsFloat,
                   FDQuery.FieldByName('VAL_ABASTECIMENTO').AsFloat, FDQuery.FieldByName('VAL_PENALIDADE_ATRASOS').AsFloat,
                   FDQuery.FieldByName('VAL_DEBITO').AsFloat, FDQuery.FieldByName('VAL_TOTAL_CREDITOS').AsFloat,
                   FDQuery.FieldByName('VAL_TOTAL_DEBITOS').AsFloat, FDQuery.FieldByName('VAL_TOTAL_GERAL').AsFloat,
                   FDQuery.FieldByName('DOM_PAGO').AsString, FDQuery.FieldByName('DAT_PAGO').AsDateTime,
                   FDQuery.FieldByName('DOM_FECHADO').AsString, FDQuery.FieldByName('DAT_FECHAMENTO').AsDateTime,
                   FDQuery.FieldByName('NOM_EXECUTANTE').AsString, FDQuery.FieldByName('DAT_MANUTENCAO').AsDateTime));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := Extratos;
end;

function TExtratoExpressasDAO.FindDatas(): TStringList;
var
  FDQuery: TFDQuery;
  lLista: TStringlist;
begin
  try
    Result := TStringList.Create();
    lLista := TStringlist.Create();
    FDQuery := TFDQuery.Create(nil);
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT DISTINCT DAT_PAGO FROM ' + TABLENAME);
    FDQuery.Open();
    if not FDQuery.IsEmpty then
    begin
      while not FDQuery.Eof do
      begin
        lLista.Add(FDQuery.FieldByName('DAT_PAGO').AsString);
        FDQuery.Next;
      end;
    end;
    Result.Text := lLista.Text;
  finally
    FDQuery.Free;
    lLista.Free;
  end;
end;

end.
