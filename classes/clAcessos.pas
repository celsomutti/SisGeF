unit clAcessos;

interface

uses Vcl.ActnList, clConexao, System.Classes;

type
  TAcessos = Class(TObject)
  private
    function getFormulario: String;
    function getModulo: String;
    function getUsuario: Integer;
    procedure setFormulario(const Value: String);
    procedure setModulo(const Value: String);
    procedure setUsuario(const Value: Integer);
  protected
    _form: String;
    _modulo: String;
    _usuario: Integer;
    _conexao: TConexao;
  public

    constructor Create;
    destructor Destroy;

    property Formulario: String read getFormulario write setFormulario;
    property Modulo: String read getModulo write setModulo;
    property Usuario: Integer read getUsuario write setUsuario;

    function getAcessos(filtro: String): Boolean;
    function Insert(): Boolean;
    function Delete(filtro: String): Boolean;

    procedure SetAcessos(aMenu: TActionList);
    procedure SetNivel(aMenu: TActionList);
  end;

const
  TABLENAME = 'tbacessos';

implementation

{ TAcessos }

uses SysTem.SysUtils, Vcl.Dialogs, udm, clUtil, uGlobais;

constructor TAcessos.Create;
begin
  _conexao := TConexao.Create;
  if (not _conexao.VerifyConnZEOS(0)) then
  begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
      Self.ClassName + ') !', mtError, [mbCancel], 0);
  end;
end;

destructor TAcessos.Destroy;
begin
  _conexao.Free;
end;

function TAcessos.getFormulario: String;
begin
  Result := _form;
end;

function TAcessos.getModulo: String;
begin
  Result := _modulo;
end;

function TAcessos.getUsuario: Integer;
begin
  Result := _usuario;
end;

function TAcessos.getAcessos(filtro: String): Boolean;
begin
  try
    Result := False;
    if TUtil.Empty(filtro) then
    begin
      Exit;
    end;
    with dm.qryPesquisa do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);
      if filtro = 'CHAVE' then
      begin
        SQL.Add('WHERE NOM_FORM = :FORM AND NOM_MODULO = :MODULO AND COD_USUARIO = :USUARIO');
        ParamByName('FORM').AsString := Self.Formulario;
        ParamByName('MODULO').AsString := Self.Modulo;
        ParamByName('USUARIO').AsInteger := Self.Usuario;
      end;
      if filtro = 'USUARIO' then
      begin
        SQL.Add('WHERE COD_USUARIO = :USUARIO');
        ParamByName('USUARIO').AsInteger := Self.Usuario;
      end;
      if filtro = 'FORM' then
      begin
        SQL.Add('WHERE NOM_FORM = :FORM');
        ParamByName('FORM').AsString := Self.Formulario;
      end;
      dm.ZConn.PingServer;
      Open;
      if IsEmpty then
      begin
        Close;
        SQL.Clear;
        Exit;
      end;
    end;
    Result := True;
  except
    on E: Exception do
    begin
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

function TAcessos.Insert(): Boolean;
begin
  try
    Result := False;
    with dm.qryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'INSERT INTO ' + TABLENAME + ' (' + 'NOM_FORM, ' +
        'NOM_MODULO, ' + 'COD_USUARIO ' + ') VALUES (' + ':FORM, ' + ':MODULO, '
        + ':USUARIO)';
      ParamByName('FORM').AsString := Self.Formulario;
      ParamByName('MODULO').AsString := Self.Modulo;
      ParamByName('USUARIO').AsInteger := Self.Usuario;
      dm.ZConn.PingServer;
      ExecSQL;
      Close;
      SQL.Clear;
    end;
    Result := True;
  except
    on E: Exception do
    begin
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

function TAcessos.Delete(filtro: string): Boolean;
begin
  try
    Result := False;
    if TUtil.Empty(filtro) then
    begin
      Exit;
    end;
    with dm.qryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Add('DELETE FROM ' + TABLENAME);
      if filtro = 'CHAVE' then
      begin
        SQL.Add('WHERE NOM_FORM = :FORM AND NOM_MODULO = :MODULO AND COD_USUARIO = :USUARIO');
        ParamByName('FORM').AsString := Self.Formulario;
        ParamByName('MODULO').AsString := Self.Modulo;
        ParamByName('USUARIO').AsInteger := Self.Usuario;
      end;
      if filtro = 'USUARIO' then
      begin
        SQL.Add('WHERE COD_USUARIO = :USUARIO');
        ParamByName('USUARIO').AsInteger := Self.Usuario;
      end;
      if filtro = 'FORM' then
      begin
        SQL.Add('WHERE NOM_FORM = :FORM');
        ParamByName('FORM').AsString := Self.Formulario;
      end;
      dm.ZConn.PingServer;
      ExecSQL;
      Close;
      SQL.Clear;
    end;
    Result := True;
  except
    on E: Exception do
    begin
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

procedure TAcessos.SetAcessos(aMenu: TActionList);
var
  i: Integer;
begin
  for i := 0 to aMenu.ActionCount - 1 do
  begin
    Self.Modulo := aMenu.Actions[i].Name;
    TAction(aMenu.Actions[i]).Visible := Self.getAcessos('CHAVE')
  end;
end;

procedure TAcessos.SetNivel(aMenu: TActionList);
var
  i: Integer;
begin
  for i := 0 to aMenu.ActionCount - 1 do
  begin
    TAction(aMenu.Actions[i]).Visible := (uGlobais.iNivelUsuario <= aMenu.Actions[i].Tag);
  end;
end;

procedure TAcessos.setFormulario(const Value: String);
begin
  _form := Value;
end;

procedure TAcessos.setModulo(const Value: String);
begin
  _modulo := Value;
end;

procedure TAcessos.setUsuario(const Value: Integer);
begin
  _usuario := Value;
end;

end.
