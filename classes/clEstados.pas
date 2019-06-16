unit clEstados;

interface

uses clConexao;

type
  TEstados = class(TConexao)

  private
    function getNome: String;
    function getSigla: String;
    function getExecutante: String;
    function getData: TDateTime;
    procedure setSigla(const Value: String);
    procedure setNome(const Value: String);
    procedure setExecutante(const Value: String);
    procedure setData(const Value: TDateTime);

  protected
    _sigla: String;
    _nome: String;
    _executante: String;
    _data: TDateTime;
  public
    property Sigla: String read getSigla write setSigla;
    property Nome: String read getNome write setNome;
    property Executante: String read getExecutante write setExecutante;
    property Data: TDateTime read getData write setData;
    function Validar(sOperacao: String): Boolean;
    function Insert(): Boolean;
    function Update(): Boolean;
    function Delete(): Boolean;
    function getObject(id, coluna: String): Boolean;
    function getObjects(): Boolean;
    function getField(campo, coluna: String): String;

  end;

const
  TABLENAME = 'tbestados';

implementation

uses Variants, SysUtils, udm, clUtil, Math, Dialogs, DB,
  ZAbstractRODataset, ZDataset;

{ TProdutos }

function TEstados.getNome: String;
begin
  Result := _nome;
end;

function TEstados.getSigla: String;
begin
  Result := _sigla;
end;

function TEstados.getExecutante: String;
begin
  Result := _executante;
end;

function TEstados.getData: TDateTime;
begin
  Result := _data;
end;

procedure TEstados.setNome(const Value: String);
begin
  _nome := Value;
end;

procedure TEstados.setSigla(const Value: String);
begin
  _sigla := Value;
end;

procedure TEstados.setExecutante(const Value: String);
begin
  _executante := Value;
end;

procedure TEstados.setData(const Value: TDateTime);
begin
  _data := Value;
end;

function TEstados.Validar(sOperacao: String): Boolean;
begin
  if Trim(Self.Sigla) = '' then
  begin
    MessageDlg('Informe a Sigla do Estado.', mtWarning, [mbOK], 0);
    Result := False;
    Exit;
  end;
  if sOperacao = 'I' then
  begin
    if getField('UF_ESTADO', 'SIGLA') <> '' then
    begin
      MessageDlg('Sigla já cadastrada.', mtWarning, [mbOK], 0);
      Result := False;
      Exit;
    end;
  end;
  if Self.Nome = '' then
  begin
    MessageDlg('Informe o nome do Estado.', mtWarning, [mbOK], 0);
    Result := False;
    Exit;
  end;
  Result := True;
end;

function TEstados.Insert(): Boolean;
begin
  Try
    Result := False;
    if (not Self.VerifyConnZEOS(0)) then
    begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
        Self.ClassName + ') !', mtError, [mbCancel], 0);
      Exit;
    end;
    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'INSERT INTO ' + TABLENAME +
        ' (UF_ESTADO, NOM_ESTADO, NOM_EXECUTANTE, DAT_MANUTENCAO) ' +
        'VALUES(:SIGLA, :NOME, :EXECUTANTE, :DATA) ';

      ParamByName('NOME').AsString := Self.Nome;
      ParamByName('SIGLA').AsString := Self.Sigla;
      ParamByName('EXECUTANTE').AsString := Self.Executante;
      ParamByName('DATA').AsDateTime := Self.Data;
      dm.ZConn.Reconnect;
      ExecSQL;
    end;

    dm.QryCRUD.Close;
    dm.QryCRUD.SQL.Clear;

    Result := True;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TEstados.Update(): Boolean;
begin
  Try
    Result := False;
    if (not Self.VerifyConnZEOS(0)) then
    begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
        Self.ClassName + ') !', mtError, [mbCancel], 0);
      Exit;
    end;
    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'UPDATE ' + TABLENAME +
        ' SET NOM_ESTADO = :NOME, NOM_EXECUTANTE = :EXECUTANTE, ' +
        'DAT_MANUTENCAO = :DATA WHERE UF_ESTADO =:SIGLA';

      ParamByName('NOME').AsString := Self.Nome;
      ParamByName('SIGLA').AsString := Self.Sigla;
      ParamByName('EXECUTANTE').AsString := Self.Executante;
      ParamByName('DATA').AsDateTime := Self.Data;
      dm.ZConn.Reconnect;
      ExecSQL;
    end;

    Result := True;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TEstados.Delete(): Boolean;
begin
  Try
    Result := False;
    if (not Self.VerifyConnZEOS(0)) then
    begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
        Self.ClassName + ') !', mtError, [mbCancel], 0);
      Exit;
    end;
    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'DELETE FROM ' + TABLENAME + ' WHERE UF_ESTADO =:SIGLA';
      ParamByName('SIGLA').AsString := Self.Sigla;
      dm.ZConn.Reconnect;
      ExecSQL;
    end;

    dm.QryCRUD.Close;
    dm.QryCRUD.SQL.Clear;

    Result := True;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TEstados.getObject(id, coluna: String): Boolean;
begin
  Try
    Result := False;
    if TUtil.Empty(id) then
      Exit;
    if (not Self.VerifyConnZEOS(0)) then
    begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
        Self.ClassName + ') !', mtError, [mbCancel], 0);
      Exit;
    end;
    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);
      if coluna = 'NOME' then
      begin
        if Pos('%', id) > 0 then
          SQL.Add(' WHERE NOM_ESTADO LIKE :NOME')
        else
          SQL.Add(' WHERE NOM_ESTADO = :NOME');
        ParamByName('NOME').AsString := id;
      end
      else if coluna = 'SIGLA' then
      begin
        if Pos('%', id) > 0 then
          SQL.Add(' WHERE UF_ESTADO LIKE :SIGLA')
        else
          SQL.Add(' WHERE UF_ESTADO = :SIGLA');
        ParamByName('SIGLA').AsString := id;
      end;
      dm.ZConn.Reconnect;
      Open;
      if not IsEmpty then
        First;
    end;

    if dm.QryGetObject.RecordCount = 1 then
    begin
      Self.Sigla := dm.QryGetObject.FieldByName('UF_ESTADO').AsString;
      Self.Nome := dm.QryGetObject.FieldByName('NOM_ESTADO').AsString;
      Self.Executante := dm.QryGetObject.FieldByName('NOM_EXECUTANTE').AsString;
      Self.Data := dm.QryGetObject.FieldByName('DAT_MANUTENCAO').AsDateTime;
      Result := True;
    end
    else if dm.QryGetObject.RecordCount = 0 then
      ShowMessage('Registro não encontrado!')
    else
      Result := True;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TEstados.getObjects(): Boolean;
begin
  Try
    Result := False;
    if (not Self.VerifyConnZEOS(0)) then
    begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
        Self.ClassName + ') !', mtError, [mbCancel], 0);
      Exit;
    end;
    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT * FROM ' + TABLENAME + ' ORDER BY UF_ESTADO';
      dm.ZConn.Reconnect;
      Open;
      if not IsEmpty then
        First;
    end;

    if dm.QryGetObject.RecordCount > 0 then
      Result := True;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TEstados.getField(campo, coluna: String): String;
begin
  Try
    Result := '';
    if (not Self.VerifyConnZEOS(0)) then
    begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
        Self.ClassName + ') !', mtError, [mbCancel], 0);
      Exit;
    end;
    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT ' + campo + ' FROM ' + TABLENAME;

      if coluna = 'NOME' then
      begin
        SQL.Add(' WHERE NOM_ESTADO = :NOME ');
        ParamByName('NOME').AsString := Self.Nome;
      end
      else if coluna = 'SIGLA' then
      begin
        SQL.Add(' WHERE UF_ESTADO = :SIGLA ');
        ParamByName('SIGLA').AsString := Self.Sigla;
      end;
      dm.ZConn.Reconnect;
      Open;
      if not IsEmpty then
        First;
    end;

    if dm.QryGetObject.RecordCount > 0 then
      Result := dm.QryGetObject.FieldByName(campo).AsString;

    dm.QryGetObject.Close;
    dm.QryGetObject.SQL.Clear;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

end.
