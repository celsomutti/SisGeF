unit clRestricoes;

interface

uses clConexao;

type
  TRestricoes = Class(TObject)

  private
    function getAgente: Integer;
    function getCodigo: Integer;
    function getEntregador: Integer;
    function getValor: Double;
    procedure setAgente(const Value: Integer);
    procedure setCodigo(const Value: Integer);
    procedure setEntregador(const Value: Integer);
    procedure setValor(const Value: Double);
    function getPago: Double;
    procedure setPago(const Value: Double);
    function getDebitar: Double;
    procedure setDebitar(const Value: Double);
    constructor Create;
    destructor Destroy;
  protected
    _codigo: Integer;
    _valor: Double;
    _pago: Double;
    _agente: Integer;
    _entregador: Integer;
    _debitar: Double;
    _conexao: TConexao;
  public
    property Codigo: Integer read getCodigo write setCodigo;
    property Valor: Double read getValor write setValor;
    property Agente: Integer read getAgente write setAgente;
    property Entregador: Integer read getEntregador write setEntregador;
    property Pago: Double read getPago write setPago;
    property Debitar: Double read getDebitar write setDebitar;

    procedure MaxCod;

    function Validar(): Boolean;
    function Delete(filtro: String): Boolean;
    function getObject(id, filtro: String): Boolean;
    function Insert(): Boolean;
    function Update(): Boolean;
    function getField(campo, coluna: String): String;
    function getObjects(): Boolean;
    function RetornaDebito(iEntregador: Integer): Double;
    function RetornaTotal(iAgente: Integer): Double;

  end;

const
  TABLENAME = 'tbrestricoes';

implementation

{ TRestricoes }

uses SysUtils, Dialogs, udm, clUtil, ZDataset, ZAbstractRODataset, DB, Windows;

constructor TRestricoes.Create;
begin
  _conexao := TConexao.Create;
  if (not _conexao.VerifyConnZEOS(0)) then
  begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
      Self.ClassName + ') !', mtError, [mbCancel], 0);
  end;
end;

destructor TRestricoes.Destroy;
begin
  _conexao.Free;
end;

function TRestricoes.getAgente: Integer;
begin
  Result := _agente;
end;

function TRestricoes.getCodigo: Integer;
begin
  Result := _codigo;
end;

function TRestricoes.getEntregador: Integer;
begin
  Result := _entregador;
end;

function TRestricoes.getValor: Double;
begin
  Result := _valor;
end;

procedure TRestricoes.MaxCod;
begin
  Try
    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT MAX(COD_RESTRICAO) AS CODIGO FROM ' + TABLENAME;
      dm.ZConn.PingServer;
      Open;
      if not(IsEmpty) then
        First;
    end;

    Self.Codigo := (dm.QryGetObject.FieldByName('CODIGO').AsInteger) + 1;

    dm.QryGetObject.Close;
    dm.QryGetObject.SQL.Clear;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TRestricoes.Validar(): Boolean;
begin
  try
    Result := False;
    if Self.Agente = 0 then
    begin
      MessageDlg('Informe o Agente!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if Self.Valor = 0 then
    begin
      if MessageDlg('Confirma Restrição com o valor igual a zero?',
        mtConfirmation, [mbYes, mbNo], 0) = IDNO then
      begin
        Exit;
      end;
    end;
    if Self.Debitar > Self.Valor then
    begin
      MessageDlg
        ('Valor a Debitar não pode ser maior que o valor da Restrição Pendente!',
        mtWarning, [mbOK], 0);
      Exit;
    end;
    Result := True;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TRestricoes.Delete(filtro: String): Boolean;
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
        ParamByName('CODIGO').AsInteger := Self.Codigo;
      end
      else if filtro = 'AGENTE' then
      begin
        SQL.Add('WHERE COD_AGENTE = :AGENTE');
        ParamByName('AGENTE').AsInteger := Self.Agente;
      end
      else if filtro = 'ENTREGADOR' then
      begin
        SQL.Add('WHERE COD_ENTREGADOR = :ENTREGADOR');
        ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
      end;
      dm.ZConn.PingServer;
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

function TRestricoes.getObject(id, filtro: String): Boolean;
begin
  Try
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
        ParamByName('CODIGO').AsInteger := StrToInt(id);
      end
      else if filtro = 'AGENTE' then
      begin
        SQL.Add('WHERE COD_AGENTE = :AGENTE AND COD_ENTREGADOR = :ENTREGADOR');
        ParamByName('AGENTE').AsInteger := StrToInt(id);
        ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
      end
      else if filtro = 'ENTREGADOR' then
      begin
        SQL.Add('WHERE COD_ENTREGADOR = :ENTREGADOR');
        ParamByName('ENTREGADOR').AsInteger := StrToInt(id);
      end
      else if filtro = 'VALOR' then
      begin
        SQL.Add('WHERE VAL_DEBITAR > :VALOR');
        ParamByName('VALOR').asFloat := StrToFloat(id);
      end;
      dm.ZConn.PingServer;
      Open;
      if not (IsEmpty) then
      begin
        First;
        if RecordCount = 1 then
        begin
          Self.Codigo := FieldByName('COD_RESTRICAO').AsInteger;
          Self.Valor := FieldByName('VAL_RESTRICAO').AsFloat;
          Self.Agente := FieldByName('COD_AGENTE').AsInteger;
          Self.Entregador := FieldByName('COD_ENTREGADOR').AsInteger;
          Self.Pago := FieldByName('VAL_PAGO').AsFloat;
          Self.Debitar := FieldByName('VAL_DEBITAR').AsFloat;
        end
      end
      else
      begin
        Close;
        SQL.Clear;
        Exit;
      end;
    end;

    Result := True;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TRestricoes.Insert(): Boolean;
begin
  Try
    Result := False;

    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'INSERT INTO ' + TABLENAME + '(' + 'COD_RESTRICAO, ' +
        'VAL_RESTRICAO, ' + 'COD_AGENTE, ' + 'COD_ENTREGADOR, ' + 'VAL_PAGO, ' +
        'VAL_DEBITAR) ' + 'VALUES (' + ':CODIGO, ' + ':VALOR, ' + ':AGENTE, ' +
        ':ENTREGADOR, ' + ':PAGO, ' + ':DEBITAR)';

      MaxCod;

      ParamByName('CODIGO').AsInteger := Self.Codigo;
      ParamByName('VALOR').AsFloat := Self.Valor;
      ParamByName('AGENTE').AsInteger := Self.Agente;
      ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
      ParamByName('PAGO').AsFloat := Self.Pago;
      ParamByName('DEBITAR').AsFloat := Self.Debitar;
      dm.ZConn.PingServer;
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

function TRestricoes.Update(): Boolean;
begin
  try
    Result := False;

    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'UPDATE ' + TABLENAME + ' SET ' + 'VAL_RESTRICAO = :VALOR, ' +
        'COD_AGENTE = :AGENTE, ' + 'COD_ENTREGADOR = :ENTREGADOR, ' +
        'VAL_PAGO = :PAGO,  ' + 'VAL_DEBITAR = :DEBITAR ' + 'WHERE ' +
        'COD_RESTRICAO = :CODIGO';
      ParamByName('CODIGO').AsInteger := Self.Codigo;
      ParamByName('VALOR').AsFloat := Self.Valor;
      ParamByName('AGENTE').AsInteger := Self.Agente;
      ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
      ParamByName('PAGO').AsFloat := Self.Pago;
      ParamByName('DEBITAR').AsFloat := Self.Debitar;
      dm.ZConn.PingServer;
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

function TRestricoes.getField(campo, coluna: String): String;
begin
  Try
    Result := '';

    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT ' + campo + ' FROM ' + TABLENAME;

      if coluna = 'CODIGO' then
      begin
        SQL.Add(' WHERE COD_RESTRICAO =:CODIGO ');
        ParamByName('CODIGO').AsInteger := Self.Codigo;
      end
      else if coluna = 'VALOR' then
      begin
        SQL.Add(' WHERE VAL_RESTRICAO =:VALOR ');
        ParamByName('VALOR').AsFloat := Self.Valor;
      end
      else if coluna = 'AGENTE' then
      begin
        SQL.Add(' WHERE COD_AGENTE =:AGENTE ');
        ParamByName('AGENTE').AsInteger := Self.Agente;
      end
      else if coluna = 'ENTREGADOR' then
      begin
        SQL.Add(' WHERE COD_ENTREGADOR = :ENTREGADOR ');
        ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
      end;
      dm.ZConn.PingServer;
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

function TRestricoes.getObjects(): Boolean;
begin
  Try
    Result := False;

    with dm.qryGeral do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);
      dm.ZConn.PingServer;
      Open;
      if not IsEmpty then
      begin
        First;
      end
      else
      begin
        Close;
        SQL.Clear;
        Exit;
      end;
    end;

    Result := True;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TRestricoes.RetornaDebito(iEntregador: Integer): Double;
begin
  Try
    Result := 0;
    with dm.qryCalculo do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);
      SQL.Add('WHERE COD_ENTREGADOR = :ENTREGADOR');
      ParamByName('ENTREGADOR').AsInteger := iEntregador;
      dm.ZConn.PingServer;
      Open;
      if not(IsEmpty) then
      begin
        First;
        Result := FieldByName('VAL_DEBITAR').AsFloat;
        Close;
        SQL.Clear;
        Exit;
      end;
    end;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TRestricoes.RetornaTotal(iAgente: Integer): Double;
begin
  Try
    Result := 0;
    with dm.qryCalculo do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT SUM(VAL_DEBITAR) as TOTAL FROM ' + TABLENAME);
      SQL.Add('WHERE COD_AGENTE = :AGENTE');
      ParamByName('AGENTE').AsInteger := iAgente;
      dm.ZConn.PingServer;
      Open;
      if not(IsEmpty) then
      begin
        First;
        Result := FieldByName('TOTAL').AsFloat;
        Close;
        SQL.Clear;
        Exit;
      end;
    end;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

procedure TRestricoes.setAgente(const Value: Integer);
begin
  _agente := Value;
end;

procedure TRestricoes.setCodigo(const Value: Integer);
begin
  _codigo := Value;
end;

procedure TRestricoes.setEntregador(const Value: Integer);
begin
  _entregador := Value;
end;

procedure TRestricoes.setValor(const Value: Double);
begin
  _valor := Value;
end;

function TRestricoes.getPago: Double;
begin
  Result := _pago;
end;

procedure TRestricoes.setPago(const Value: Double);
begin
  _pago := Value;
end;

function TRestricoes.getDebitar: Double;
begin
  Result := _debitar;
end;

procedure TRestricoes.setDebitar(const Value: Double);
begin
  _debitar := Value;
end;

end.
