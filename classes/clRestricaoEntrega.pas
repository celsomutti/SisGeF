unit clRestricaoEntrega;

interface

uses clConexao;

type
  TRestricaoEntrega = Class(TObject)

  private
    function getNossoNumero: String;
    function getRestricao: Integer;
    procedure setNossoNumero(const Value: String);
    procedure setRestricao(const Value: Integer);
    constructor Create;
    destructor Destroy;
  protected
    _restricao: Integer;
    _nossonumero: String;
    _conexao: TConexao;
  public
    property Restricao: Integer read getRestricao write setRestricao;
    property NossoNumero: String read getNossoNumero write setNossoNumero;

    function Validar(): Boolean;
    function Delete(filtro: String): Boolean;
    function getObject(id, filtro: String): Boolean;
    function Insert(): Boolean;

  end;

const
  TABLENAME = 'tbrestricaoentrega';

implementation

{ TRestricaoEntrega }

uses SysUtils, Dialogs, udm, clUtil, ZDataset, ZAbstractRODataset, DB;

constructor TRestricaoEntrega.Create;
begin
  _conexao := TConexao.Create;
  if (not _conexao.VerifyConnZEOS(0)) then
  begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
      Self.ClassName + ') !', mtError, [mbCancel], 0);
  end;
end;

destructor TRestricaoEntrega.Destroy;
begin
  _conexao.Free;
end;

function TRestricaoEntrega.getNossoNumero: String;
begin
  Result := _nossonumero;
end;

function TRestricaoEntrega.getRestricao: Integer;
begin
  Result := _restricao;
end;

function TRestricaoEntrega.Validar(): Boolean;
begin
  try
    Result := False;

    if Self.Restricao = 0 then
    begin
      MessageDlg('Código da Restrição incorreto!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if TUtil.Empty(Self.NossoNumero) then
    begin
      MessageDlg('Informe o Nosso Número!', mtWarning, [mbOK], 0);
      Exit;
    end;

    Result := True;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TRestricaoEntrega.Delete(filtro: String): Boolean;
begin
  try
    Result := False;

    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Add('DELETE FROM ' + TABLENAME);
      if filtro = 'CODIGO' then
      begin
        SQL.Add('WHERE COD_RESTRICAO = :CODIGO');
        ParamByName('CODIGO').AsInteger := Self.Restricao;
      end
      else if filtro = 'NOSSONUMERO' then
      begin
        SQL.Add('WHERE NUM_NOSSONUMERO = :NOSSONUMERO AND COD_RESTRICAO = :CODIGO');
        ParamByName('CODIGO').AsInteger := Self.Restricao;
        ParamByName('NOSSONUMERO').AsString := Self.NossoNumero;
      end;
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

function TRestricaoEntrega.getObject(id, filtro: String): Boolean;
begin
  try
    Result := False;

    if TUtil.Empty(id) then
      Exit;

    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);

      if filtro = 'CODIGO' then
      begin
        SQL.Add('WHERE COD_RESTRICAO = :CODIGO');
        ParamByName('CODIGO').AsInteger := Self.Restricao;
      end
      else if filtro = 'NOSSONUMERO' then
      begin
        SQL.Add('WHERE NUM_NOSSONUMERO = :NOSSONUMERO');
        ParamByName('NOSSONUMERO').AsString := Self.NossoNumero;
      end;
      Open;
      if not IsEmpty then
        First;
    end;

    if dm.QryGetObject.RecordCount = 1 then
    begin
      Self.Restricao := dm.QryGetObject.FieldByName('COD_RESTRICAO').AsInteger;
      Self.NossoNumero := dm.QryGetObject.FieldByName
        ('NUM_NOSSONUMERO').AsString;
      dm.QryGetObject.Close;
      dm.QryGetObject.SQL.Clear;
      Result := True;
    end
    else if dm.QryGetObject.RecordCount > 1 then
    begin
      Result := True;
      Exit;
    end;

    dm.QryGetObject.Close;
    dm.QryGetObject.SQL.Clear;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TRestricaoEntrega.Insert(): Boolean;
begin
  Try
    Result := False;

    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'INSERT INTO ' + TABLENAME + '(' + 'COD_RESTRICAO, ' +
        'NUM_NOSSONUMERO) ' + 'VALUES (' + ':CODIGO, ' + ':NOSSONUMERO)';

      ParamByName('CODIGO').AsInteger := Self.Restricao;
      ParamByName('NOSSONUMERO').AsString := Self.NossoNumero;

      ExecSQL;
    end;

    dm.QryCRUD.Close;
    dm.QryCRUD.SQL.Clear;

    Result := True;

    MessageDlg('Os dados foram salvos com sucesso!', mtInformation, [mbOK], 0);

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

procedure TRestricaoEntrega.setNossoNumero(const Value: String);
begin
  _nossonumero := Value;
end;

procedure TRestricaoEntrega.setRestricao(const Value: Integer);
begin
  _restricao := Value;
end;

end.
