unit DAO.StatusCadastro;

interface

uses DAO.Base, Model.StatusCadastro, Generics.Collections, System.Classes;

type
  TStatusCadastroDAO = class(TDAO)
  public
    function Insert(aStatus: Model.StatusCadastro.TStatusCadastro): Boolean;
    function Update(aStatus: Model.StatusCadastro.TStatusCadastro): Boolean;
    function Delete(sFiltro: String): Boolean;
    function FindStatus(sFiltro: String): TObjectList<Model.StatusCadastro.TStatusCadastro>;
  end;
const
  TABLENAME = 'cad_status';

implementation

uses System.SysUtils, FireDAC.Comp.Client, Data.DB;

function TStatusCadastroDAO.Insert(aStatus: TStatusCadastro): Boolean;
var
  sSQL : System.string;
begin
  Result := False;
  aStatus.ID := GetKeyValue(TABLENAME, 'ID_STATUS');
  sSQL := 'INSERT INTO ' + TABLENAME + ' '+
          '(ID_STATUS, DES_STATUS, DOM_ATIVO, DES_LOG) ' +
          'VALUES ' +
          '(:ID, :DESCRICAO, :ATIVO, :LOG);';
  Connection.ExecSQL(sSQL,[aStatus.ID, aStatus.Descricao, aStatus.Ativo, aStatus.Log],
                          [ftInteger, ftString, ftBoolean, ftString]);
  Result := True;
end;

function TStatusCadastroDAO.Update(aStatus: TStatusCadastro): Boolean;
var
  sSQL: System.string;
begin
  Result := False;
  sSQL := 'UPDATE ' + TABLENAME + ' ' +
          'SET ' +
          'DES_STATUS  = :DESCRICAO, DOM_ATIVO = :ATIVO, DES_LOG = :LOG ' +
          'WHERE ID_STATUS = :ID;';
  Connection.ExecSQL(sSQL,[aStatus.Descricao, aStatus.Ativo, aStatus.Log, aStatus.ID],
                          [ftString, ftBoolean, ftString, ftInteger]);
  Result := True;
end;

function TStatusCadastroDAO.Delete(sFiltro: string): Boolean;
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

function TStatusCadastroDAO.FindStatus(sFiltro: string): TObjectList<Model.StatusCadastro.TStatusCadastro>;
var
  FDQuery: TFDQuery;
  status: TObjectList<TStatusCadastro>;
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
    status := TObjectList<TStatusCadastro>.Create();
    while not FDQuery.Eof do
    begin
      status.Add(TStatusCadastro.Create(FDQuery.FieldByName('ID_STATUS').AsInteger, FDQuery.FieldByName('DES_STATUS').AsString,
                 FDQuery.FieldByName('DOM_ATIVO').AsBoolean, FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := status;
end;

end.
