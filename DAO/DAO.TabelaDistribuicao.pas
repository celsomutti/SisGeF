unit DAO.TabelaDistribuicao;

interface

uses DAO.Base, Model.TabelasDistribuicao, Generics.Collections, System.Classes;

type
  TTabelaDistribuicaoDAO = class(TDAO)
    function Insert(aTabela: Model.TabelasDistribuicao.TTabelasDistribuicao): Boolean;
    function Update(aTabela: Model.TabelasDistribuicao.TTabelasDistribuicao): Boolean;
    function Delete(sFiltro: String): Boolean;
    function FindTabela(sFiltro: String): TObjectList<Model.TabelasDistribuicao.TTabelasDistribuicao>;
  end;
const
  TABLENAME = 'tbtabelasdistribuicao';

implementation

uses System.SysUtils, FireDAC.Comp.Client, Data.DB;

function TTabelaDistribuicaoDAO.Insert(aTabela: TTabelasDistribuicao): Boolean;
var
  sSQL: String;
begin
  Result := False;
  aTabela.ID := GetKeyValue(TABLENAME,'ID_TABELA');
  sSQL := 'INSERT INTO ' + TABLENAME + ' '+
          '(ID_TABELA, DAT_TABELA, COD_TABELA, COD_GRUPO, COD_TIPO, COD_ENTREGADOR, DES_LOG) ' +
          'VALUES ' +
          '(:ID, :DATA, :TABELA, :GRUPO, :TIPO, :ENTREGADOR, :LOG);';
  Connection.ExecSQL(sSQL,[aTabela.ID, aTabela.Data, aTabela.Tabela, aTabela.Grupo, aTabela.Tipo, aTabela.Entregador, aTabela.Log],
                          [ftInteger, ftDate, ftInteger, ftInteger, ftInteger, ftInteger, ftString]);
  Result := True;
end;

function TTabelaDistribuicaoDAO.Update(aTabela: TTabelasDistribuicao): Boolean;
var
  sSQL: System.string;
begin
  Result := False;
  sSQL := 'UPDATE ' + TABLENAME + ' ' +
          'SET ' +
          'DAT_TABELA = :DATA, COD_TABELA = :TABELA, COD_GRUPO = :GRUPO, COD_TIPO = :TIPO, ' +
          'COD_ENTREGADOR = :ENTREGADOR, DES_LOG = :LOG ' +
          'WHERE ID_TABELA = :ID';
  Connection.ExecSQL(sSQL,[aTabela.Data, aTabela.Tabela, aTabela.Grupo, aTabela.Tipo, aTabela.Entregador, aTabela.Log,
                          aTabela.ID], [ftDate, ftInteger, ftInteger, ftInteger, ftInteger, ftString, ftInteger]);
  Result := True;
end;

function TTabelaDistribuicaoDAO.Delete(sFiltro: string): Boolean;
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
  Connection.ExecSQL(sSQL);
  Result := True;
end;

function TTabelaDistribuicaoDAO.FindTabela(sFiltro: string): TObjectList<Model.TabelasDistribuicao.TTabelasDistribuicao>;
var
  FDQuery: TFDQuery;
  tabelas: TObjectList<TTabelasDistribuicao>;
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
    tabelas := TObjectList<TTabelasDistribuicao>.Create();
    while not FDQuery.Eof do
    begin
      tabelas.Add(TTabelasDistribuicao.Create(FDQuery.FieldByName('ID_TABELA').AsInteger,
                 FDQuery.FieldByName('DAT_TABELA').AsInteger, FDQuery.FieldByName('COD_TABELA').AsInteger,
                 FDQuery.FieldByName('COD_GRUPO').AsInteger, FDQuery.FieldByName('COD_TIPO').AsInteger,
                 FDQuery.FieldByName('COD_ENTREGADOR').AsInteger, FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := tabelas;
end;


end.
