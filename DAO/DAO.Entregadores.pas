unit DAO.Entregadores;

interface

uses DAO.Base, Model.Entregadores, Generics.Collections, System.Classes;

type
  TEntregadoresDAO = class (TDAO)
  public
    function Insert(aEntregadores: Model.Entregadores.TEntregadores): Boolean;
    function Update(aEntregadores: Model.Entregadores.TEntregadores): Boolean;
    function Delete(iCadastro: Integer): Boolean;
    function FindEntregador(sFiltro: String; aParam: array of Variant): TObjectList<Model.Entregadores.TEntregadores>;
  end;
const
  TABLENAME = 'tbcodigosentregadores';



implementation

uses System.SysUtils, FireDAC.Comp.Client, Data.DB;

{ TEntregadoresDAO }

function TEntregadoresDAO.Delete(iCadastro: Integer): Boolean;
var
  sSQL : String;
begin
  Result := False;
  if iCadastro = 0 then
  begin
    Exit;
  end;
  sSQL := 'DELETE FROM ' + TABLENAME + ' WHERE COD_CADASTRO = :CADASTRO';
  Connection.ExecSQL(sSQL,[iCadastro],[ftInteger]);
  Result := True;
end;

function TEntregadoresDAO.FindEntregador(sFiltro: String; aParam: array of Variant): TObjectList<Model.Entregadores.TEntregadores>;
var
  FDQuery: TFDQuery;
  entregadores: TObjectList<TEntregadores>;
begin
  try
    FDQuery := TFDQuery.Create(nil);
    if Length(aParam) = 0 then
    begin
      Exit;
    end;
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    if sFiltro = 'CADASTRO' then
    begin
      FDQuery.SQL.Add('WHERE COD_CADASTRO = :CADASTRO');
      FDQuery.ParamByName('CADASTRO').AsInteger := aParam[0];
    end;
    if sFiltro = 'ENTREGADOR' then
    begin
      FDQuery.SQL.Add('WHERE COD_ENTREGADOR = :ENTREGADOR');
      FDQuery.ParamByName('ENTREGADOR').AsInteger := aParam[0];
    end;
    if sFiltro = 'FANTASIA' then
    begin
      FDQuery.SQL.Add('WHERE NOM_FANTASIA = :FANTASIA');
      FDQuery.ParamByName('FANTASIA').AsString := aParam[0];
    end;
    if sFiltro = 'AGENTE' then
    begin
      FDQuery.SQL.Add('WHERE COD_AGENTE = :AGENTE ORDER BY COD_ENTREGADOR');
      FDQuery.ParamByName('AGENTE').AsInteger := aParam[0];
    end;
    if sFiltro = 'CHAVE' then
    begin
      FDQuery.SQL.Add('WHERE DES_CHAVE = :CHAVE');
      FDQuery.ParamByName('CHAVE').AsString := aParam[0];
    end;
    if sFiltro = 'GRUPO' then
    begin
      FDQuery.SQL.Add('WHERE COD_GRUPO = :GRUPO');
      FDQuery.ParamByName('GRUPO').AsInteger := aParam[0];
    end;
    if sFiltro = 'FILTRO' then
    begin
      FDQuery.SQL.Add(aParam[0]);
    end;
    FDQuery.Open();
    entregadores := TObjectList<TEntregadores>.Create;
    while not FDQuery.Eof do
    begin
      entregadores.Add(TEntregadores.Create(FDQuery.FieldByName('COD_CADASTRO').AsInteger,
                                     FDQuery.FieldByName('COD_ENTREGADOR').AsInteger,
                                     FDQuery.FieldByName('NOM_FANTASIA').AsString,
                                     FDQuery.FieldByName('COD_AGENTE').AsInteger,
                                     FDQuery.FieldByName('DAT_CODIGO').AsDateTime,
                                     FDQuery.FieldByName('DES_CHAVE').AsString,
                                     FDQuery.FieldByName('COD_GRUPO').AsInteger,
                                     FDQuery.FieldByName('VAL_VERBA').AsFloat,
                                     FDQuery.FieldByName('NOM_EXECUTANTE').AsString,
                                     FDQuery.FieldByName('DAT_MANUTENCAO').AsDateTime));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := entregadores;
end;

function TEntregadoresDAO.Insert(aEntregadores: Model.Entregadores.TEntregadores): Boolean;
var
  sSQL : System.string;
begin
  Result := False;
  sSQL := 'INSERT INTO ' + TABLENAME + ' (COD_CADASTRO, COD_ENTREGADOR, NOM_FANTASIA, COD_AGENTE, DAT_CODIGO, ' +
          'DES_CHAVE, COD_GRUPO, VAL_VERBA, NOM_EXECUTANTE, DAT_MANUTENCAO) ' +
          'VALUES ' +
          '(:COD_CADASTRO, :COD_ENTREGADOR, :NOM_FANTASIA, :COD_AGENTE, :DAT_CODIGO, ' +
          ':DES_CHAVE, :COD_GRUPO, :VAL_VERBA, :NOM_EXECUTANTE, :DAT_MANUTENCAO) ';
  Connection.ExecSQL(sSQL,[aEntregadores.Cadastro, aEntregadores.Entregador, aEntregadores.Fantasia, aEntregadores.Agente,
                          aEntregadores.Data, aEntregadores.Chave, aEntregadores.Grupo, aEntregadores.Verba,
                          aEntregadores.Executor, aEntregadores.Manutencao],
                          [ftInteger, ftInteger, ftString, ftInteger, ftDate, ftString, ftInteger, ftFloat,
                          ftString, ftDateTime]);
  Result := True;
end;

function TEntregadoresDAO.Update(aEntregadores: Model.Entregadores.TEntregadores): Boolean;
var
  sSQL : System.string;
begin
  Result := False;
  sSQL := 'UPDATE ' + TABLENAME + ' SET ' +
          'NOM_FANTASIA = :NOM_FANTASIA, COD_AGENTE = :COD_AGENTE, DAT_CODIGO = :DAT_CODIGO, DES_CHAVE = :DES_CHAVE, ' +
          'COD_GRUPO = :COD_GRUPO, VAL_VERBA = :VAL_VERBA, NOM_EXECUTANTE = :NOM_EXECUTANTE, ' +
          'DAT_MANUTENCAO = :DAT_MANUTENCAO ' +
          'WHERE COD_CADASTRO = :COD_CADASTRO AND COD_ENTREGADOR = :COD_ENTREGADOR;';

  Connection.ExecSQL(sSQL,[aEntregadores.Fantasia, aEntregadores.Agente,
                          aEntregadores.Data, aEntregadores.Chave, aEntregadores.Grupo, aEntregadores.Verba,
                          aEntregadores.Executor, aEntregadores.Manutencao, aEntregadores.Cadastro, aEntregadores.Entregador],
                          [ftString, ftInteger, ftDate, ftString, ftInteger, ftFloat,
                          ftString, ftDateTime, ftInteger, ftInteger]);
  Result := True;
end;

end.
