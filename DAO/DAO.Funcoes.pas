unit DAO.Funcoes;

interface

uses DAO.Base, Model.Funcoes, Generics.Collections, System.Classes;

type
  TFuncoesDAO = class(TDAO)
public
  function Insert(aFuncoes: Model.Funcoes.TFuncoes): Boolean;
  function Update(aFuncoes: Model.Funcoes.TFuncoes): Boolean;
  function Delete(sFiltro: String): Boolean;
  function FindFuncoes(sFiltro: String): TObjectList<Model.Funcoes.TFuncoes>;
end;
const
  TABLENAME = 'cad_funcoes';

implementation

uses System.SysUtils, FireDAC.Comp.Client, Data.DB;

function TFuncoesDAO.Insert(aFuncoes: TFuncoes): Boolean;
var
  sSQL : System.string;
begin
  Result := False;
  aFuncoes.ID := GetKeyValue(TABLENAME, 'ID_FUNCAO');
  sSQL := 'INSERT INTO ' + TABLENAME + ' '+
          '(ID_FUNCAO, DES_FUNCAO, DES_LOG) ' +
          'VALUES ' +
          '(:ID, :DESCRICAO, :LOG);';
  Connection.ExecSQL(sSQL,[aFuncoes.ID, aFuncoes.Descricao, aFuncoes.Log],
                          [ftInteger, ftString, ftString]);
  Result := True;
end;

function TFuncoesDAO.Update(aFuncoes: TFuncoes): Boolean;
var
  sSQL: System.string;
begin
  Result := False;
  sSQL := 'UPDATE ' + TABLENAME + ' ' +
          'SET ' +
          'DES_FUNCAO  = :DESCRICAO, DES_LOG = :LOG ' +
          'WHERE ID_FUNCAO = :ID;';
  Connection.ExecSQL(sSQL,[aFuncoes.Descricao, aFuncoes.Log, aFuncoes.ID],
                          [ftString, ftString, ftInteger]);
  Result := True;
end;

function TFuncoesDAO.Delete(sFiltro: string): Boolean;
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

function TFuncoesDAO.FindFuncoes(sFiltro: string): TObjectList<Model.Funcoes.TFuncoes>;
var
  FDQuery: TFDQuery;
  funcoes: TObjectList<TFuncoes>;
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
    funcoes := TObjectList<TFuncoes>.Create();
    while not FDQuery.Eof do
    begin
      funcoes.Add(TFuncoes.Create(FDQuery.FieldByName('ID_FUNCAO').AsInteger, FDQuery.FieldByName('DES_FUNCAO').AsString,
                  FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := funcoes;
end;

end.
