unit DAO.Usuarios;

interface

uses DAO.Base, Model.Usuarios, Generics.Collections, System.Classes;

type
  TUsuariosDAO = class(TDAO)
  public
    function Insert(aUsuarios: Model.Usuarios.TUsuarios): Boolean;
    function Update(aUsuarios: Model.Usuarios.TUsuarios): Boolean;
    function Delete(iID: System.Integer): Boolean;
    function FindByID(iID: System.Integer): TObjectList<Model.Usuarios.TUsuarios>;
    function FindByLogin(sLogin: System.String): TObjectList<Model.Usuarios.TUsuarios>;
    function FindByEMail(sEmail: System.String): TObjectList<Model.Usuarios.TUsuarios>;
    function FindByGrupo(iGrupo: System.Integer): TObjectList<Model.Usuarios.TUsuarios>;
    function ValidatePassword(login,senha: System.string): Boolean;
    function ExistUserMySQL(sLogin: System.string): Boolean;
    function CreateUserMySQL(sLogin, sSenha: System.string; iNivel: System.Integer): Boolean;
    function RevokeUserMySQL(sLogin: System.string): Boolean;
    function ValidatePasswordMySQL(login,senha: System.string): Boolean;
    function FindGrupo(iID: System.Integer): String;
    function ExistUser(sLogin: System.string): Boolean;
    function ChangePwdMySQL(sLogin, sSenha: String): Boolean;
  end;
const
  TABLENAME = 'tbusuarios';
  CHAVE = 'ABCDEFGHIJ0987654321KLMNOPQRSTUVXZ0123456789';
implementation

uses System.SysUtils, FireDAC.Comp.Client, Data.DB;

function TUsuariosDAO.Insert(aUsuarios: TUsuarios): Boolean;
var
  sSQL : System.string;
begin
  Result := False;
  aUsuarios.ID := GetKeyValue(TABLENAME, 'COD_USUARIO');
  sSQL := 'INSERT INTO ' + TABLENAME + ' '+
          '(COD_USUARIO, ' +
          'NOM_USUARIO, ' +
          'DES_LOGIN, ' +
          'DES_EMAIL, ' +
          'DES_SENHA,' +
          'COD_GRUPO, ' +
          'DOM_PRIVILEGIO, ' +
          'DOM_EXPIRA, ' +
          'QTD_DIAS_EXPIRA, ' +
          'DOM_PRIMEIRO_ACESSO, ' +
          'DOM_ATIVO, ' +
          'DAT_SENHA, ' +
          'COD_NIVEL, ' +
          'NOM_EXECUTOR, ' +
          'DAT_MANUTENCAO) ' +
          'VALUES ' +
          '(:pCOD_USUARIO, ' +
          ':pNOM_USUARIO, ' +
          ':pDES_LOGIN, ' +
          ':pDES_EMAIL, ' +
          'AES_ENCRYPT(:pDES_SENHA,' + QuotedStr(CHAVE) + '), ' +
          ':pCOD_GRUPO, ' +
          ':pDOM_PRIVILEGIO, ' +
          ':pDOM_EXPIRA, ' +
          ':pQTD_DIAS_EXPIRA, ' +
          ':pDOM_PRIMEIRO_ACESSO, ' +
          ':pDOM_ATIVO, ' +
          ':pDAT_SENHA, ' +
          ':pCOD_NIVEL, ' +
          ':pNOM_EXECUTOR, ' +
          ':pDAT_MANUTENCAO)';

  Connection.ExecSQL(sSQL,[aUsuarios.ID, aUsuarios.Nome, aUsuarios.Login, aUsuarios.EMail, aUsuarios.Senha, aUsuarios.Grupo ,
                          aUsuarios.ADM, aUsuarios.Expira, aUsuarios.Dias, aUsuarios.Acesso, aUsuarios.Ativo, aUsuarios.Data,
                          aUsuarios.Nivel, aUsuarios.Executor, aUsuarios.Manutencao],
                          [ftInteger, ftString, ftString, ftString, ftString, ftInteger, ftString, ftString, ftSmallint, ftString,
                          ftString, ftDate, ftSmallint, ftString, ftDateTime]);
  Result := True;
end;

function TUsuariosDAO.Update(aUsuarios: TUsuarios): Boolean;
var
  sSQL : System.string;
begin
  Result := False;
  sSQL := 'UPDATE ' + TABLENAME + ' SET '+
          'NOM_USUARIO = :pNOM_USUARIO, ' +
          'DES_LOGIN = :pDES_LOGIN, ' +
          'DES_EMAIL = :pDES_EMAIL, ' +
          'DES_SENHA = AES_ENCRYPT(:pDES_SENHA,' + QuotedStr(CHAVE) + '), ' +
          'COD_GRUPO = :pCOD_GRUPO, ' +
          'DOM_PRIVILEGIO = :pDOM_PRIVILEGIO, ' +
          'DOM_EXPIRA = :pDOM_EXPIRA, ' +
          'QTD_DIAS_EXPIRA = :pQTD_DIAS_EXPIRA, ' +
          'DOM_PRIMEIRO_ACESSO = :pDOM_PRIMEIRO_ACESSO, ' +
          'DOM_ATIVO = :pDOM_ATIVO, ' +
          'DAT_SENHA = :pDAT_SENHA, ' +
          'COD_NIVEL = :pCOD_NIVEL, ' +
          'NOM_EXECUTOR = :pNOM_EXECUTOR, ' +
          'DAT_MANUTENCAO = :pDAT_MANUTENCAO ' +
          'WHERE COD_USUARIO = :pCOD_USUARIO';

  Connection.ExecSQL(sSQL,[aUsuarios.Nome, aUsuarios.Login, aUsuarios.EMail, aUsuarios.Senha, aUsuarios.Grupo,
                          aUsuarios.ADM, aUsuarios.Expira, aUsuarios.Dias, aUsuarios.Acesso, aUsuarios.Ativo, aUsuarios.Data,
                          aUsuarios.Nivel, aUsuarios.Executor, aUsuarios.Manutencao, aUsuarios.ID],
                          [ftString, ftString, ftString, ftString, ftInteger, ftString, ftString, ftSmallint, ftString,
                          ftString, ftDate, ftSmallint, ftString, ftDateTime, ftInteger]);
  Result := True;
end;

function TUsuariosDAO.Delete(iID: Integer): Boolean;
var
  sSQL : String;
begin
  Result := False;
  sSQL := 'DELETE FROM ' + TABLENAME + ' ' +
          'WHERE COD_USUARIO = ' + IntToStr(iID);
  Connection.ExecSQL(sSQL);
  Result := True;
end;

function TUsuariosDAO.FindByID(iID: Integer): TObjectList<Model.Usuarios.TUsuarios>;
var
  FDQuery: TFDQuery;
  usuarios: TObjectList<TUsuarios>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT COD_USUARIO, NOM_USUARIO, DES_LOGIN, DES_EMAIL, DES_SENHA, AES_DECRYPT(DES_SENHA,:pCHAVE) as PWD, ');
    FDQuery.SQL.Add('COD_GRUPO, DOM_PRIVILEGIO, DOM_EXPIRA, QTD_DIAS_EXPIRA, DOM_PRIMEIRO_ACESSO, DOM_ATIVO, DAT_SENHA, ');
    FDQuery.SQL.Add('COD_NIVEL, NOM_EXECUTOR, DAT_MANUTENCAO FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE COD_USUARIO = :pCOD_USUARIO');
    FDQuery.ParamByName('pCHAVE').AsString := CHAVE;
    FDQuery.ParamByName('pCOD_USUARIO').AsInteger := iID;
    FDQuery.Open();
    usuarios := TObjectList<TUsuarios>.Create();
    while not FDQuery.Eof do
    begin
      usuarios.Add(TUsuarios.Create(FDQuery.FieldByName('COD_USUARIO').AsInteger, FDQuery.FieldByName('NOM_USUARIO').AsString,
                  FDQuery.FieldByName('DES_LOGIN').AsString, FDQuery.FieldByName('DES_EMAIL').AsString,
                  FDQuery.FieldByName('PWD').AsString, FDQuery.FieldByName('COD_GRUPO').AsInteger,
                  FDQuery.FieldByName('DOM_PRIVILEGIO').AsString, FDQuery.FieldByName('DOM_EXPIRA').AsString,
                  FDQuery.FieldByName('QTD_DIAS_EXPIRA').AsInteger, FDQuery.FieldByName('DOM_PRIMEIRO_ACESSO').AsString,
                  FDQuery.FieldByName('DOM_ATIVO').AsString, FDQuery.FieldByName('DAT_SENHA').AsDateTime,
                  FDQuery.FieldByName('COD_NIVEL').AsInteger, FDQuery.FieldByName('NOM_EXECUTOR').AsString,
                  FDQuery.FieldByName('DAT_MANUTENCAO').AsDateTime));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := usuarios;
end;

function TUsuariosDAO.FindByLogin(sLogin: String): TObjectList<Model.Usuarios.TUsuarios>;
var
  FDQuery: TFDQuery;
  usuarios: TObjectList<TUsuarios>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT COD_USUARIO, NOM_USUARIO, DES_LOGIN, DES_EMAIL, DES_SENHA, AES_DECRYPT(DES_SENHA,:pCHAVE) as PWD, ');
    FDQuery.SQL.Add('COD_GRUPO, DOM_PRIVILEGIO, DOM_EXPIRA, QTD_DIAS_EXPIRA, DOM_PRIMEIRO_ACESSO, DOM_ATIVO, DAT_SENHA, ');
    FDQuery.SQL.Add('COD_NIVEL, NOM_EXECUTOR, DAT_MANUTENCAO FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE DES_LOGIN = :pDES_LOGIN');
    FDQuery.ParamByName('pDES_LOGIN').AsString := sLogin;
    FDQuery.Open();
    usuarios := TObjectList<TUsuarios>.Create();
    while not FDQuery.Eof do
    begin
      usuarios.Add(TUsuarios.Create(FDQuery.FieldByName('COD_USUARIO').AsInteger, FDQuery.FieldByName('NOM_USUARIO').AsString,
                  FDQuery.FieldByName('DES_LOGIN').AsString, FDQuery.FieldByName('DES_EMAIL').AsString,
                  FDQuery.FieldByName('DES_SENHA').AsString, FDQuery.FieldByName('COD_GRUPO').AsInteger,
                  FDQuery.FieldByName('DOM_PRIVILEGIO').AsString, FDQuery.FieldByName('DOM_EXPIRA').AsString,
                  FDQuery.FieldByName('QTD_DIAS_EXPIRA').AsInteger, FDQuery.FieldByName('DOM_PRIMEIRO_ACESSO').AsString,
                  FDQuery.FieldByName('DOM_ATIVO').AsString, FDQuery.FieldByName('DAT_SENHA').AsDateTime,
                  FDQuery.FieldByName('COD_NIVEL').AsInteger, FDQuery.FieldByName('NOM_EXECUTOR').AsString,
                  FDQuery.FieldByName('DAT_MANUTENCAO').AsDateTime));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := usuarios;
end;

function TUsuariosDAO.FindByEMail(sEmail: System.String): TObjectList<Model.Usuarios.TUsuarios>;
var
  FDQuery: TFDQuery;
  usuarios: TObjectList<TUsuarios>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT COD_USUARIO, NOM_USUARIO, DES_LOGIN, DES_EMAIL, DES_SENHA, AES_DECRYPT(DES_SENHA,:pCHAVE) as PWD, ');
    FDQuery.SQL.Add('COD_GRUPO, DOM_PRIVILEGIO, DOM_EXPIRA, QTD_DIAS_EXPIRA, DOM_PRIMEIRO_ACESSO, DOM_ATIVO, DAT_SENHA, ');
    FDQuery.SQL.Add('COD_NIVEL, NOM_EXECUTOR, DAT_MANUTENCAO FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE DES_EMAIL = :pDES_EMAIL');
    FDQuery.ParamByName('pDES_EMAIL').AsString := sEmail;
    FDQuery.Open();
    usuarios := TObjectList<TUsuarios>.Create();
    while not FDQuery.Eof do
    begin
      usuarios.Add(TUsuarios.Create(FDQuery.FieldByName('COD_USUARIO').AsInteger, FDQuery.FieldByName('NOM_USUARIO').AsString,
                  FDQuery.FieldByName('DES_LOGIN').AsString, FDQuery.FieldByName('DES_EMAIL').AsString,
                  FDQuery.FieldByName('DES_SENHA').AsString, FDQuery.FieldByName('COD_GRUPO').AsInteger,
                  FDQuery.FieldByName('DOM_PRIVILEGIO').AsString, FDQuery.FieldByName('DOM_EXPIRA').AsString,
                  FDQuery.FieldByName('QTD_DIAS_EXPIRA').AsInteger, FDQuery.FieldByName('DOM_PRIMEIRO_ACESSO').AsString,
                  FDQuery.FieldByName('DOM_ATIVO').AsString, FDQuery.FieldByName('DAT_SENHA').AsDateTime,
                  FDQuery.FieldByName('COD_NIVEL').AsInteger, FDQuery.FieldByName('NOM_EXECUTOR').AsString,
                  FDQuery.FieldByName('DAT_MANUTENCAO').AsDateTime));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := usuarios;
end;

function TUsuariosDAO.ValidatePassword(login: string; senha: string): Boolean;
var
  FDQuery: TFDQuery;
  sSenha  : String;
begin
  Result  :=  False;
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT AES_DECRYPT(DES_SENHA,:pCHAVE) AS SENHA FROM ' + TABLENAME);
    FDQuery.SQL.Add(' WHERE DES_LOGIN = :pDES_LOGIN');
    FDQuery.ParamByName('pDES_LOGIN').AsString := login;
    FDQuery.ParamByName('pCHAVE').AsString := CHAVE;
    FDQuery.Open();
    sSenha := FDQuery.FieldByName('SENHA').AsString;
    if sSenha <> senha then
    begin
      Exit;
    end;
    Result  :=  True;
  finally
    FDQuery.Free;
  end;
end;

function TUsuariosDAO.ExistUserMySQL(sLogin: string): Boolean;
var
  FDQuery: TFDQuery;
begin
  Result := False;
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM MySQL.user WHERE User = :pUSUARIO');
    FDQuery.ParamByName('pUSUARIO').AsString := sLogin;
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

function TUsuariosDAO.CreateUserMySQL(sLogin: string; sSenha: string; iNivel: Integer): Boolean;
var
  sSQL : System.string;
begin
  Result := False;
  if iNivel = 0 then
  begin
    sSQL := 'GRANT ALL PRIVILEGES ON *.* TO :pUSUARIO IDENTIFIED BY :pSENHA';
  end
  else
  begin
    sSQL := 'GRANT DELETE, EXECUTE, FILE, INSERT, SELECT, UPDATE, TRIGGER ON *.* TO :pUSUARIO IDENTIFIED BY :pSENHA';
  end;

  Connection.ExecSQL(sSQL,[sLogin, sSenha], [ftString, ftString]);
  Result := True;
end;

function TUsuariosDAO.RevokeUserMySQL(sLogin: string): Boolean;
var
  sSQL : System.string;
begin
  Result := False;
  sSQL := 'REVOKE ALL PRIVILEGES, GRANT OPTION FROM :pUSUARIO';
  Connection.ExecSQL(sSQL,[sLogin], [ftString]);
  Result := True;
end;

function TUsuariosDAO.ValidatePasswordMySQL(login: string; senha: string): Boolean;
var
  FDQuery: TFDQuery;
begin
///////////////////////////
  Result  :=  True;
  Exit;
//////////////////////////
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM MySQL.user WHERE User = :pUSUARIO AND Password = PASSWORD(:pPASSWORD)');
    FDQuery.ParamByName('pUSUARIO').AsString := login;
    FDQuery.ParamByName('pPASSWORD').AsString := senha;
    FDQuery.Open();
    if FDQuery.IsEmpty then
    begin
      Exit;
    end;
    Result  :=  True;
  finally
    FDQuery.Free;
  end;
end;

function TUsuariosDAO.FindGrupo(iID: Integer): String;
var
  FDQuery: TFDQuery;
begin
  Result := '';
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME + ' WHERE COD_USUARIO = :pCOD_USUARIO AND COD_GRUPO = :pCOD_GRUPO');
    FDQuery.ParamByName('pCOD_USUARIO').AsInteger := iID;
    FDQuery.ParamByName('pCOD_GRUPO').AsInteger := -1;
    FDQuery.Open();
    if FDQuery.IsEmpty then
    begin
      Exit;
    end;
    Result := FDQuery.FieldByName('NOM_USUARIO').AsString;
  finally
    FDQuery.Free;
  end;
end;

function TUsuariosDAO.FindByGrupo(iGrupo: Integer): TObjectList<Model.Usuarios.TUsuarios>;
var
  FDQuery: TFDQuery;
  usuarios: TObjectList<TUsuarios>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE COD_GRUPO = :pCOD_GRUPO');
    FDQuery.ParamByName('pCOD_GRUPO').AsInteger := iGrupo;
    FDQuery.Open();
    usuarios := TObjectList<TUsuarios>.Create();
    while not FDQuery.Eof do
    begin
      usuarios.Add(TUsuarios.Create(FDQuery.FieldByName('COD_USUARIO').AsInteger, FDQuery.FieldByName('NOM_USUARIO').AsString,
                  FDQuery.FieldByName('DES_LOGIN').AsString, FDQuery.FieldByName('DES_EMAIL').AsString,
                  FDQuery.FieldByName('DES_SENHA').AsString, FDQuery.FieldByName('COD_GRUPO').AsInteger,
                  FDQuery.FieldByName('DOM_PRIVILEGIO').AsString, FDQuery.FieldByName('DOM_EXPIRA').AsString,
                  FDQuery.FieldByName('QTD_DIAS_EXPIRA').AsInteger, FDQuery.FieldByName('DOM_PRIMEIRO_ACESSO').AsString,
                  FDQuery.FieldByName('DOM_ATIVO').AsString, FDQuery.FieldByName('DAT_SENHA').AsDateTime,
                  FDQuery.FieldByName('COD_NIVEL').AsInteger, FDQuery.FieldByName('NOM_EXECUTOR').AsString,
                  FDQuery.FieldByName('DAT_MANUTENCAO').AsDateTime));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := usuarios;
end;

function TUsuariosDAO.ExistUser(sLogin: string): Boolean;
var
  FDQuery: TFDQuery;
begin
  Result := False;
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME + ' WHERE DES_LOGIN = :pLOGIN');
    FDQuery.ParamByName('pLOGIN').AsString := sLogin;
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

function TUsuariosDAO.ChangePwdMySQL(sLogin: string; sSenha: string): Boolean;
var
  sSQL : System.string;
begin
  Result := False;
  sSQL := 'UPDATE MySQL.user SET Password = PASSWORD(:pSENHA) WHERE User = :pUSUARIO';
  Connection.ExecSQL(sSQL,[sLogin, sSenha], [ftString, ftString]);
  Result := True;
end;

end.
