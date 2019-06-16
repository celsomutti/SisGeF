unit DAO.PenalizacaoAtrasos;

interface

uses DAO.Base, Model.PenalizacaoAtrasos, Generics.Collections, System.Classes;

type
  TPenalizacaoAtrasosDAO = class(TDAO)
  public
    function Insert(aPenas: Model.PenalizacaoAtrasos.TPenalizacaoatrasos): Boolean;
    function Update(aPenas: Model.PenalizacaoAtrasos.TPenalizacaoatrasos): Boolean;
    function Delete(sFiltro: String): Boolean;
    function FindPenalizacao(sFiltro: String): TObjectList<Model.PenalizacaoAtrasos.TPenalizacaoatrasos>;
  end;
const
  TABLENAME = 'tbpenalizacaoatrasos';

implementation

uses System.SysUtils, FireDAC.Comp.Client, Data.DB;

function TPenalizacaoAtrasosDAO.Insert(aPenas: TPenalizacaoAtrasos):Boolean;
var
  sSQL: System.string;
begin
  Result := False;
  aPenas.ID := GetKeyValue(TABLENAME,'ID_PENALIZACAO');
  sSQL := 'INSERT INTO ' + TABLENAME + ' '+
          '(ID_PENALIZACAO, DAT_PENALIZACAO, QTD_DIAS_ATRASO, VAL_PENALIZACAO, PER_PENALIZACAO, DES_LOG)' +
          'VALUES ' +
          '(:ID, :DATA, :ATRASO, :VALOR, :PERCENTUAL, :LOG);';
  Connection.ExecSQL(sSQL,[aPenas.ID, aPenas.Data, aPenas.Atraso, aPenas.Valor, aPenas.Percentual, aPenas.Log],[ftInteger,
                           ftDate, ftInteger, ftFloat, ftFloat, ftString]);
  Result := True;
end;

function TPenalizacaoAtrasosDAO.Update(aPenas: TPenalizacaoAtrasos): Boolean;
var
  sSQL: System.string;
begin
  Result := False;
  sSQL := 'UPDATE ' + TABLENAME + ' ' +
          'SET ' +
          'DAT_PENALIZACAO = :DATA, QTD_DIAS_ATRASO = :ATRASO, VAL_PENALIZACAO = :VALOR, PER_PENALIZACAO = :PERCENTUAL, ' +
          'DES_LOG = :LOG ' +
          'WHERE ID_PENALIZACAO = :ID';
  Connection.ExecSQL(sSQL,[aPenas.Data, aPenas.Atraso, aPenas.Valor, aPenas.Percentual, aPenas.Log],[ftDate, ftInteger, ftFloat,
                           ftFloat, ftString, ftInteger]);
  Result := True;
end;

function TPenalizacaoAtrasosDAO.Delete(sFiltro: string): Boolean;
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
  connection.ExecSQL(sSQL);
  Result := True;
end;

function TPenalizacaoAtrasosDAO.FindPenalizacao(sFiltro: string): TObjectList<Model.PenalizacaoAtrasos.TPenalizacaoatrasos>;
var
  FDQuery: TFDQuery;
  penas: TObjectList<TPenalizacaoAtrasos>;
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
    penas := TObjectList<TPenalizacaoAtrasos>.Create();
    while not FDQuery.Eof do
    begin
      penas.Add(TPenalizacaoAtrasos.Create(FDQuery.FieldByName('ID_PENALIZACAO').AsInteger,
                                           FDQuery.FieldByName('DAT_PENALIZACAO').AsDateTime,
                 FDQuery.FieldByName('QTD_DIAS_ATRASO').AsInteger, FDQuery.FieldByName('VAL_PENALIZACAO').AsFloat,
                 FDQuery.FieldByName('PER_PENALIZACAO').AsFloat, FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := penas;
end;
end.
