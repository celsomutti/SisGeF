unit DAO.Acessos;

interface

uses DAO.Base, Model.Acessos, Generics.Collections, System.Classes;

type
  TAcessosDAO = class(TDAO)
  public
    function Insert(aAcessos: Model.Acessos.TAcesso): Boolean;
    function Update(aAcessos: Model.Acessos.TAcesso): Boolean;
    function Delete(sFiltro: String): Boolean;
    function FindForm(sForm: String): TObjectList<Model.Acessos.TAcesso>;
    function FindModulo(sModulo: String): TObjectList<Model.Acessos.TAcesso>;
    function FindUsuario(sUsuario: String): TObjectList<Model.Acessos.TAcesso>;
    function FindAcesso(sForm, sModulo, sUsuario: String): Boolean;
    function SetNivelAcessos(iTagControl: Integer; iLevelUser: Integer): Boolean;
  end;
const
  TABLENAME = 'tbacessos';

implementation

uses System.SysUtils, FireDAC.Comp.Client, Data.DB;

function TAcessosDAO.Insert(aAcessos: TAcesso): Boolean;
var
  sSQL : System.string;
begin
  Result := False;
  sSQL := 'INSERT INTO ' + TABLENAME +
          '(NOM_FORM, NOM_MODULO, COD_USUARIO) ' +
          'VALUES ' +
          '(:pNOM_FORM, :pNOM_MODULO, :pCOD_USUARIO)';
  Connection.ExecSQL(sSQL,[aAcessos.Form, aAcessos.Modulo, aAcessos.Usuario],
                          [ftString, ftString, ftInteger]);
  Result := True;
end;

function TAcessosDAO.Update(aAcessos: TAcesso): Boolean;
var
  sSQL: String;
begin
  Result := False;
  sSQL := 'UPDATE ' + TABLENAME +
          'SET ' +
          'NOM_FORM = :pNOM_FORM, NOM_MODULO = :pNOM_MODULO, COD_USUARIO = :pCOD_USUARIO ' +
          'WHERE NOM_FORM = :pNOM_FORM AND NOM_MODULO = :pNOM_MODULO AND COD_USUARIO = :pCOD_USUARIO;';
  Connection.ExecSQL(sSQL,[aAcessos.Form, aAcessos.Modulo, aAcessos.Usuario, aAcessos.Form, aAcessos.Modulo, aAcessos.Usuario],
                          [ftString, ftString, ftInteger, ftString, ftString, ftInteger]);
  Result := True;
end;

function TAcessosDAO.Delete(sFiltro: string): Boolean;
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

function TAcessosDAO.FindForm(sForm: string): TObjectList<Model.Acessos.TAcesso>;
var
  FDQuery: TFDQuery;
  acessos: TObjectList<TAcesso>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE NOM_FORM = :pNOM_FORM');
    FDQuery.ParamByName('pNOM_FORM').AsString := sForm;
    FDQuery.Open();
    acessos := TObjectList<TAcesso>.Create();
    while not FDQuery.Eof do
    begin
      acessos.Add(TAcesso.Create(FDQuery.FieldByName('NOM_FORM').AsString, FDQuery.FieldByName('NOM_MODULO').AsString,
                 FDQuery.FieldByName('COD_USUARIO').AsInteger));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := acessos;
end;

function TAcessosDAO.FindModulo(sModulo: string): TObjectList<Model.Acessos.TAcesso>;
var
  FDQuery: TFDQuery;
  acessos: TObjectList<TAcesso>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE NOM_MODULO = :pNOM_MODULO');
    FDQuery.ParamByName('pNOM_MODULO').AsString := sModulo;
    FDQuery.Open();
    acessos := TObjectList<TAcesso>.Create();
    while not FDQuery.Eof do
    begin
      acessos.Add(TAcesso.Create(FDQuery.FieldByName('NOM_FORM').AsString, FDQuery.FieldByName('NOM_MODULO').AsString,
                 FDQuery.FieldByName('COD_USUARIO').AsInteger));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := acessos;
end;

function TAcessosDAO.FindUsuario(sUsuario: string): TObjectList<Model.Acessos.TAcesso>;
var
  FDQuery: TFDQuery;
  acessos: TObjectList<TAcesso>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE COD_USUARIO = :pCOD_USUARIO');
    FDQuery.ParamByName('pCOD_USUARIO').AsString := sUsuario;
    FDQuery.Open();
    acessos := TObjectList<TAcesso>.Create();
    while not FDQuery.Eof do
    begin
      acessos.Add(TAcesso.Create(FDQuery.FieldByName('NOM_FORM').AsString, FDQuery.FieldByName('NOM_MODULO').AsString,
                 FDQuery.FieldByName('COD_USUARIO').AsInteger));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := acessos;
end;

function TAcessosDAO.FindAcesso(sForm: string; sModulo: string; sUsuario: string): Boolean;
var
  FDQuery: TFDQuery;
begin
  Result := False;
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE NOM_FORM = :pNOM_FORM AND NOM_MODULO = :pNOM_MODULO AND COD_USUARIO = :pCOD_USUARIO');
    FDQuery.ParamByName('pNOM_FORM').AsString := sForm;
    FDQuery.ParamByName('pNOM_MODULO').AsString := sModulo;
    FDQuery.ParamByName('pCOD_USUARIO').AsString := sUsuario;
    FDQuery.Open();
    if FDQuery.IsEmpty then
    begin
      Exit;
    end;
    Result := True;
  finally
    FDQuery.Free;
  end;
end;

function TAcessosDAO.SetNivelAcessos(iTagControl: Integer; iLevelUser: Integer): Boolean;
begin
  Result := (iLevelUser <= iTagControl);
end;

end.
