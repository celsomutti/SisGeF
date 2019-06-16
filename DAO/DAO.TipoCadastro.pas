unit DAO.TipoCadastro;

interface

uses DAO.Base, Model.TipoCadastro, Generics.Collections, System.Classes;

  type
    TTipoCadastroDAO = class(TDAO)
    public
      function Insert(aTipo: Model.TipoCadastro.TTipoCadastro): Boolean;
      function Update(aTipo: Model.TipoCadastro.TTipoCadastro): Boolean;
      function Delete(sFiltro: String): Boolean;
      function FindTipo(sFiltro: String): TObjectList<Model.TipoCadastro.TTipoCadastro>;
    end;
const
  TABLENAME = 'cad_tipo_cadastro';

implementation

uses System.SysUtils, FireDAC.Comp.Client, Data.DB;

function TTipoCadastroDAO.Insert(aTipo: TTipoCadastro): Boolean;
var
  sSQL : System.string;
begin
  Result := False;
  aTipo.Codigo := GetKeyValue(TABLENAME,'COD_TIPO');
  sSQL := 'INSERT INTO ' + TABLENAME + ' '+
          '(COD_TIPO, DES_TIPO, DOM_PESSOA, DOM_RH, DOM_JORNAL, DOM_EXPRESSAS, DES_LOG) ' +
          'VALUES ' +
          '(:CODIGO, :DESCRICAO, :PESSOA, :RH, :JORNAL, :EXPRESSA, :LOG);';
  Connection.ExecSQL(sSQL,[aTipo.Codigo, aTipo.Descricao, aTipo.Pessoa, aTipo.RH, aTipo.Jornal, aTipo.Expressas,
                           aTipo.Log], [ftInteger, ftString, ftInteger, ftBoolean, ftBoolean, ftBoolean, ftString]);
  Result := True;
end;

function TTipoCadastroDAO.Update(aTipo: TTipoCadastro): Boolean;
var
  sSQL: System.string;
begin
  Result := False;
  sSQL := 'UPDATE ' + TABLENAME + ' ' +
          'SET ' +
          'DES_TIPO = :DESCRICAO, DOM_PESSOA = :PESSOA, DOM_RH = :RH, DOM_JORNAL = :JORNAL, DOM_EXPRESSAS = :EXPRESSA, ' +
          'DES_LOG = :LOG ' +
          'WHERE COD_TIPO = :CODIGO;';
  Connection.ExecSQL(sSQL,[aTipo.Descricao, aTipo.Pessoa, aTipo.RH, aTipo.Jornal, aTipo.Expressas,
                           aTipo.Log, aTipo.Codigo], [ftString, ftInteger, ftBoolean, ftBoolean, ftBoolean, ftString, ftInteger]);
  Result := True;
end;

function TTipoCadastroDAO.Delete(sFiltro: string): Boolean;
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

function TTipoCadastroDAO.FindTipo(sFiltro: string): TObjectList<Model.TipoCadastro.TTipoCadastro>;
var
  FDQuery: TFDQuery;
  tipos: TObjectList<Model.TipoCadastro.TTipoCadastro>;
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
    tipos := TObjectList<Model.TipoCadastro.TTipoCadastro>.Create();
    while not FDQuery.Eof do
    begin
      tipos.Add(TTipoCadastro.Create(FDQuery.FieldByName('COD_TIPO').AsInteger, FDQuery.FieldByName('DES_TIPO').AsString,
                 FDQuery.FieldByName('DOM_PESSOA').AsInteger, FDQuery.FieldByName('DOM_RH').AsBoolean,
                 FDQuery.FieldByName('DOM_JORNAL').AsBoolean, FDQuery.FieldByName('DOM_EXPRESSAS').AsBoolean,
                 FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
    Result := tipos;
  finally
    FDQuery.Free;
  end;
end;

end.
