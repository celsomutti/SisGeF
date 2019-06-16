unit clLacres;

interface

uses clConexao;

type
  TLacre = Class(TObject)

  private
    function getBase: Integer;
    function getNumero: String;
    function getStatus: Integer;
    procedure setBse(const Value: Integer);
    procedure setNumero(const Value: String);
    procedure setStatus(const Value: Integer);
    function getManutencao: TDateTime;
    function getUsuario: String;
    procedure setManutencao(const Value: TDateTime);
    procedure setUsuario(const Value: String);
    constructor Create;
    destructor Destroy;
  protected
    _base: Integer;
    _numero: String;
    _status: Integer;
    _usuario: String;
    _manutencao: TDateTime;
    _conexao: TConexao;
  public
    property Base: Integer read getBase write setBse;
    property Numero: String read getNumero write setNumero;
    property Status: Integer read getStatus write setStatus;
    property Usuario: String read getUsuario write setUsuario;
    property Manutencao: TDateTime read getManutencao write setManutencao;

    function Validar(): Boolean;
    function JaExiste(id: String): Boolean;
    function Delete(filtro: String): Boolean;
    function getObject(id, filtro: String): Boolean;
    function Insert(): Boolean;
    function Update(): Boolean;
    function getObjects(): Boolean;
    function getField(campo, coluna: String): String;
  end;

const
  TABLENAME = 'tblacres';

implementation

{ TLacre }

uses SysUtils, Dialogs, udm, clUtil, ZDataset, ZAbstractRODataset, DB, Math;

constructor TLacre.Create;
begin
  _conexao := TConexao.Create;
  if (not _conexao.VerifyConnZEOS(0)) then
  begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
      Self.ClassName + ') !', mtError, [mbCancel], 0);
  end;
end;

destructor TLacre.Destroy;
begin
  _conexao.Free;
end;

procedure TLacre.setBse(const Value: Integer);
begin
  _base := Value;
end;

procedure TLacre.setManutencao(const Value: TDateTime);
begin
  _manutencao := Value;
end;

procedure TLacre.setNumero(const Value: String);
begin
  _numero := Value;
end;

procedure TLacre.setStatus(const Value: Integer);
begin
  _status := Value;
end;

procedure TLacre.setUsuario(const Value: String);
begin
  _usuario := Value;
end;

function TLacre.Validar(): Boolean;
begin
  Result := False;
  if Self.Base = 0 then
  begin
    MessageDlg('Informe o código da Base', mtWarning, [mbOK], 0);
    Exit
  end;
  if TUtil.Empty(Self.Numero) then
  begin
    MessageDlg('Informe o número do Lacre!', mtWarning, [mbNo], 0);
    Exit;
  end;
  Result := True;
end;

function TLacre.JaExiste(id: String): Boolean;
begin
  try
    Result := False;
    if TUtil.Empty(id) then
    begin
      Exit;
    end;
    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);
      SQL.Add(' WHERE NUM_LACRE = :NUMERO ');
      SQL.Add('AND COD_BASE     = :BASE ');
      ParamByName('NUMERO').AsString := id;
      ParamByName('BASE').AsInteger := Self.Base;
      dm.ZConn.PingServer;
      Open;
      if not IsEmpty then
      begin
        Result := True;
      end;
      Close;
      SQL.Clear;
    end;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TLacre.Delete(filtro: String): Boolean;
begin
  try
    Result := False;
    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Add('DELETE FROM ' + TABLENAME);
      if filtro = 'BASE' then
      begin
        SQL.Add(' WHERE COD_BASE =  :BASE');
        ParamByName('BASE').AsInteger := Self.Base;
      end
      else if filtro = 'NUMERO' then
      begin
        SQL.Add(' WHERE COD_BASE = :BASE');
        SQL.Add(' AND NUM_LACRE = :NUMERO');
        ParamByName('BASE').AsInteger := Self.Base;
        ParamByName('NUMERO').AsString := Self.Numero;
      end;
      dm.ZConn.PingServer;
      ExecSQL;
      Close;
      SQL.Clear;
    end;
    Result := True;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TLacre.getObject(id, filtro: String): Boolean;
begin
  try
    Result := False;
    if TUtil.Empty(id) then
    begin
      Exit;
    end;
    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);
      if filtro = 'BASE' then
      begin
        SQL.Add(' WHERE COD_BASE =  :BASE');
        ParamByName('BASE').AsInteger := StrToInt(id);
      end
      else if filtro = 'NUMERO' then
      begin
        SQL.Add(' WHERE COD_BASE = :BASE');
        SQL.Add(' AND NUM_LACRE = :NUMERO');
        ParamByName('BASE').AsInteger := Self.Base;
        ParamByName('NUMERO').AsString := id;
      end
      else if filtro = 'LACRE' then
      begin
        SQL.Add(' WHERE COD_BASE IN (:BASE)');
        SQL.Add(' AND NUM_LACRE = :NUMERO');
        ParamByName('BASE').AsString := id;
        ParamByName('NUMERO').AsString := Self.Numero;
      end;
      dm.ZConn.PingServer;
      Open;
      if (not IsEmpty) then
      begin
        First;
        Self.Base := FieldByName('COD_BASE').AsInteger;
        Self.Numero := FieldByName('NUM_LACRE').AsString;
        Self.Status := FieldByName('COD_STATUS').AsInteger;
        Self.Usuario := FieldByName('NOM_USUARIO').AsString;
        Self.Manutencao := FieldByName('DAT_MANUTENCAO').AsDateTime;
        Result := True;
      end
      else
      begin
        Close;
        SQL.Clear;
      end;
    end;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TLacre.Insert(): Boolean;
begin
  Try
    Result := False;
    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'INSERT INTO ' + TABLENAME + '(' + 'COD_BASE, ' +
        'NUM_LACRE, ' + 'COD_STATUS, ' + 'NOM_USUARIO, ' + 'DAT_MANUTENCAO) ' +
        'VALUES (' + ':BASE, ' + ':NUMERO, ' + ':STATUS, ' + ':USUARIO, ' +
        ':MANUTENCAO) ';

      ParamByName('BASE').AsInteger := Self.Base;
      ParamByName('NUMERO').AsString := Self.Numero;
      ParamByName('STATUS').AsInteger := Self.Status;
      ParamByName('USUARIO').AsString := Self.Usuario;
      ParamByName('MANUTENCAO').AsDateTime := Self.Manutencao;
      dm.ZConn.PingServer;
      ExecSQL;
      Close;
      SQL.Clear;
    end;
    Result := True;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TLacre.Update(): Boolean;
begin
  try
    Result := False;
    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'UPDATE ' + TABLENAME + ' SET ' + 'COD_STATUS = :STATUS, ' +
        'NOM_USUARIO = :USUARIO, ' + 'DAT_MANUTENCAO = :MANUTENCAO ' + 'WHERE '
        + 'COD_BASE = :BASE AND ' + 'NUM_LACRE = :NUMERO';
      ParamByName('BASE').AsInteger := Self.Base;
      ParamByName('NUMERO').AsString := Self.Numero;
      ParamByName('STATUS').AsInteger := Self.Status;
      ParamByName('USUARIO').AsString := Self.Usuario;
      ParamByName('MANUTENCAO').AsDateTime := Self.Manutencao;
      dm.ZConn.PingServer;
      ExecSQL;
      Close;
      SQL.Clear;
      Result := True;
    end;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TLacre.getObjects(): Boolean;
begin
  try
    Result := False;
    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);
      dm.ZConn.PingServer;
      Open;
      if not IsEmpty then
      begin
        Result := True;
      end;
      Close;
      SQL.Clear;
    end;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TLacre.getField(campo, coluna: String): String;
begin
  try
    Result := '';
    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT ' + campo + ' FROM ' + TABLENAME;
      if coluna = 'BASE' then
      begin
        SQL.Add(' WHERE COD_BASE =  :BASE');
        ParamByName('BASE').AsInteger := Self.Base;
      end
      else if coluna = 'NUMERO' then
      begin
        SQL.Add(' WHERE COD_BASE = :BASE');
        SQL.Add(' AND NUM_LACRE = :NUMERO');
        ParamByName('BASE').AsInteger := Self.Base;
        ParamByName('NUMERO').AsString := Self.Numero;
      end;
      dm.ZConn.PingServer;
      Open;
      if (not IsEmpty) then
      begin
        First;
        Result := FieldByName(campo).AsString;
      end;
      Close;
      SQL.Clear;
    end;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TLacre.getManutencao: TDateTime;
begin
  Result := _manutencao;
end;

function TLacre.getBase: Integer;
begin
  Result := _base;
end;

function TLacre.getStatus: Integer;
begin
  Result := _status;
end;

function TLacre.getUsuario: String;
begin
  Result := _usuario;
end;

function TLacre.getNumero: String;
begin
  Result := _numero;
end;

end.
