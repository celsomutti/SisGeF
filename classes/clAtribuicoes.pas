unit clAtribuicoes;

interface

uses clConexao;

type
  TAtribuicoes = Class(TObject)
  private
    function getCep: String;
    function getEntregador: Integer;
    function getNossoNumero: String;
    function getOcorrencia: String;
    function getPedido: String;
    procedure setCep(const Value: String);
    procedure setEntregador(const Value: Integer);
    procedure setNossoNumero(const Value: String);
    procedure setOcorrencia(const Value: String);
    procedure setPedido(const Value: String);
    function getCliente: Integer;
    function getData: TDateTime;
    procedure setCliente(const Value: Integer);
    procedure setData(const Value: TDateTime);
    function getExcluir: String;
    procedure setExcluir(const Value: String);
    function getStatus: Integer;
    procedure setStatus(const Value: Integer);
    function getAdvalorem: Double;
    function getPagoFranquia: Double;
    function getPesoFranquia: Double;
    function getPesoReal: Double;
    function getVerbaFranquia: Double;
    procedure setAdvalorem(const Value: Double);
    procedure setPagoFranquia(const Value: Double);
    procedure setPesoFranquia(const Value: Double);
    procedure setPesoReal(const Value: Double);
    procedure setVerbaFranquia(const Value: Double);

  protected
    _nossonumero: String;
    _entregador: Integer;
    _cep: String;
    _data: TDateTime;
    _cliente: Integer;
    _pedido: String;
    _ocorrencia: String;
    _excluir: String;
    _status: Integer;
    _pesoreal: Double;
    _pesofranquia: Double;
    _verbafranquia: Double;
    _advalorem: Double;
    _pagofranquia: Double;
    _conexao: TConexao;
  public

    constructor Create;
    destructor Destroy;

    property NossoNumero: String read getNossoNumero write setNossoNumero;
    property Entregador: Integer read getEntregador write setEntregador;
    property Cep: String read getCep write setCep;
    property Pedido: String read getPedido write setPedido;
    property Ocorrencia: String read getOcorrencia write setOcorrencia;
    property Cliente: Integer read getCliente write setCliente;
    property Data: TDateTime read getData write setData;
    property Excluir: String read getExcluir write setExcluir;
    property Status: Integer read getStatus write setStatus;
    property PesoReal: Double read getPesoReal write setPesoReal;
    property PesoFranquia: Double read getPesoFranquia write setPesoFranquia;
    property VerbaFranquia: Double read getVerbaFranquia write setVerbaFranquia;
    property Advalorem: Double read getAdvalorem write setAdvalorem;
    property PagoFranquia: Double read getPagoFranquia write setPagoFranquia;

    function Validar(): Boolean;
    function Delete(filtro: String): Boolean;
    function getObject(id, filtro: String): Boolean;
    function getObjects(): Boolean;
    function Insert(): Boolean;
    function Update(): Boolean;
    function getField(campo, coluna: String): String;
    function JaExiste(): Boolean;

  end;

const
  TABLENAME = 'tbatribuicoespendentes';

implementation

{ TAtribuicoes }

uses SysUtils, Dialogs, udm, clUtil, ZDataset, ZAbstractRODataset, DB;

constructor TAtribuicoes.Create;
begin
  _conexao := TConexao.Create;
  if (not _conexao.VerifyConnZEOS(0)) then
  begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
      Self.ClassName + ') !', mtError, [mbCancel], 0);
  end;
end;

destructor TAtribuicoes.Destroy;
begin
  _conexao.Free;
end;

function TAtribuicoes.getCep: String;
begin
  Result := _cep;
end;

function TAtribuicoes.getEntregador: Integer;
begin
  Result := _entregador;
end;

function TAtribuicoes.getNossoNumero: String;
begin
  Result := _nossonumero;
end;

function TAtribuicoes.getOcorrencia: String;
begin
  Result := _ocorrencia;
end;

function TAtribuicoes.Validar(): Boolean;
begin
  try
    Result := False;
    if TUtil.Empty(Self.NossoNumero) then
    begin
      MessageDlg('Informe o Nosso Número!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if TUtil.Empty(Self.Ocorrencia) then
    begin
      MessageDlg('Informe a Ocorrência da Pendência!', mtWarning, [mbOK], 0);
      Exit;
    end;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TAtribuicoes.Delete(filtro: String): Boolean;
begin
  try

    Result := False;

    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Add('DELETE FROM ' + TABLENAME);
      if filtro = 'NOSSONUMERO' then
      begin
        SQL.Add('WHERE NUM_NOSSONUMERO = :NOSSONUMERO');
        ParamByName('NOSSONUMERO').AsString := Self.NossoNumero;
      end
      else if filtro = 'ENTREGADOR' then
      begin
        SQL.Add('WHERE COD_ENTREGADOR = :ENTREGADOR');
        ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
      end
      else if filtro = 'STATUS' then
      begin
        SQL.Add('WHERE COD_STATUS = :STATUS');
        ParamByName('STATUS').AsInteger := Self.Status;
      end
      else if filtro = 'EXCLUIR' then
      begin
        SQL.Add('WHERE DOM_EXCLUIR = :EXCLUIR');
        ParamByName('EXCLUIR').AsString := 'S';
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

function TAtribuicoes.getObject(id, filtro: String): Boolean;
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

      if filtro = 'NOSSONUMERO' then
      begin
        SQL.Add('WHERE NUM_NOSSONUMERO = :NOSSONUMERO');
        ParamByName('NOSSONUMERO').AsInteger := StrToInt(id);
      end
      else if filtro = 'ENTREGADOR' then
      begin
        SQL.Add('WHERE COD_ENTREGADOR = :ENTREGADOR');
        ParamByName('ENTREGADOR').AsInteger := StrToInt(id);
      end
      else if filtro = 'ID' then
      begin
        SQL.Add('WHERE ID_ASSINANTE = :ID');
        ParamByName('ID').AsInteger := StrToInt(id);
      end;
      Open;
      if not IsEmpty then
        First;
    end;

    if dm.QryGetObject.RecordCount > 0 then
    begin
      Self.NossoNumero := dm.QryGetObject.FieldByName
        ('NUM_NOSSONUMERO').AsString;
      Self.Entregador := dm.QryGetObject.FieldByName('COD_ENTREGADOR')
        .AsInteger;
      Self.Cep := dm.QryGetObject.FieldByName('NUM_CEP').AsString;
      Self.Data := dm.QryGetObject.FieldByName('DAT_ATRIBUICAO').AsDateTime;
      Self.Cliente := dm.QryGetObject.FieldByName('COD_CLIENTE').AsInteger;
      Self.Pedido := dm.QryGetObject.FieldByName('NUM_PEDIDO').AsString;
      Self.Ocorrencia := dm.QryGetObject.FieldByName('DES_OCORRENCIA').AsString;
      Self.Excluir := dm.QryGetObject.FieldByName('DOM_EXCLUIR').AsString;
      Self.Status := dm.QryGetObject.FieldByName('COD_STATUS').AsInteger;
      Self.PesoReal := dm.QryGetObject.FieldByName('QTD_PESO_REAL').AsFloat;
      Self.PesoFranquia := dm.QryGetObject.FieldByName
        ('QTD_PESO_FRANQUIA').AsFloat;
      Self.VerbaFranquia := dm.QryGetObject.FieldByName
        ('VAL_VERBA_FRANQUIA').AsFloat;
      Self.Advalorem := dm.QryGetObject.FieldByName('VAL_ADVALOREM').AsFloat;
      Self.PagoFranquia := dm.QryGetObject.FieldByName
        ('VAL_PAGO_FRANQUIA').AsFloat;
      Result := True;
    end
    else
    begin
      dm.QryGetObject.Close;
      dm.QryGetObject.SQL.Clear;
    end;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TAtribuicoes.getObjects(): Boolean;
begin
  try
    Result := False;

    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);
      Open;
      if not IsEmpty then
        First;
    end;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TAtribuicoes.Insert(): Boolean;
begin
  try
    Result := False;

    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'INSERT INTO ' + TABLENAME + '(' + 'NUM_NOSSONUMERO, ' +
        'COD_ENTREGADOR, ' + 'NUM_CEP, ' + 'DAT_ATRIBUICAO, ' + 'COD_CLIENTE, '
        + 'NUM_PEDIDO, ' + 'DES_OCORRENCIA, ' + 'DOM_EXCLUIR, ' + 'COD_STATUS, '
        + 'QTD_PESO_REAL, ' + 'QTD_PESO_FRANQUIA, ' + 'VAL_VERBA_FRANQUIA, ' +
        'VAL_ADVALOREM, ' + 'VAL_PAGO_FRANQUIA) ' + 'VALUES (' +
        ':NOSSONUMERO, ' + ':ENTREGADOR, ' + ':CEP, ' + ':DATA, ' + ':CLIENTE, '
        + ':PEDIDO, ' + ':OCORRENCIA, ' + ':EXCLUIR, ' + ':STATUS, ' +
        ':PESOREAL, ' + ':PESOFRANQUIA, ' + ':VERBAFRANQUIA, ' + ':ADVALOREM, '
        + ':PAGOFRANQUIA)';

      ParamByName('NOSSONUMERO').AsString := Self.NossoNumero;
      ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
      ParamByName('CEP').AsString := Self.Cep;
      ParamByName('DATA').AsDateTime := Self.Data;
      ParamByName('CLIENTE').AsInteger := Self.Cliente;
      ParamByName('PEDIDO').AsString := Self.Pedido;
      ParamByName('OCORRENCIA').AsString := Self.Ocorrencia;
      ParamByName('EXCLUIR').AsString := Self.Excluir;
      ParamByName('STATUS').AsInteger := Self.Status;
      ParamByName('PESOREAL').AsFloat := Self.PesoReal;
      ParamByName('PESOFRANQUIA').AsFloat := Self.PesoFranquia;
      ParamByName('VERBAFRANQUIA').AsFloat := Self.VerbaFranquia;
      ParamByName('ADVALOREM').AsFloat := Self.Advalorem;
      ParamByName('PAGOFRANQUIA').AsFloat := Self.PagoFranquia;
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

function TAtribuicoes.Update(): Boolean;
begin
  try
    Result := False;

    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'UPDATE ' + TABLENAME + ' SET ' +
        'COD_ENTREGADOR = :ENTREGADOR, ' + 'NUM_CEP = :CEP, ' +
        'DAT_ATRIBUICAO = :DATA, ' + 'COD_CLIENTE = :CLIENTE, ' +
        'NUM_PEDIDO = :PEDIDO, ' + 'DES_OCORRENCIA = :OCORRENCIA, ' +
        'DOM_EXCLUIR = :EXCLUIR, ' + 'COD_STATUS = :STATUS, ' +
        'QTD_PESO_REAL = :PESOREAL, ' + 'QTD_PEDO_FRANQUIA = :PESOFRANQUIA, ' +
        'VAL_VERBA_FRANQUIA = :VERBAFRANQUIA, ' + 'VAL_ADVALOREM = :ADVALOREM, '
        + 'VAL_PAGO_FRANQUIA = :PAGOFRANQUIA ' + 'WHERE ' +
        'NUM_NOSSONUMERO = :NOSSONUMERO';

      ParamByName('NOSSONUMERO').AsString := Self.NossoNumero;
      ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
      ParamByName('CEP').AsString := Self.Cep;
      ParamByName('DATA').AsDateTime := Self.Data;
      ParamByName('CLIENTE').AsInteger := Self.Cliente;
      ParamByName('PEDIDO').AsString := Self.Pedido;
      ParamByName('OCORRENCIA').AsString := Self.Ocorrencia;
      ParamByName('EXCLUIR').AsString := Self.Excluir;
      ParamByName('STATUS').AsInteger := Self.Status;
      ParamByName('PESOREAL').AsFloat := Self.PesoReal;
      ParamByName('PESOFRANQUIA').AsFloat := Self.PesoFranquia;
      ParamByName('VERBAFRANQUIA').AsFloat := Self.VerbaFranquia;
      ParamByName('ADVALOREM').AsFloat := Self.Advalorem;
      ParamByName('PAGOFRANQUIA').AsFloat := Self.PagoFranquia;
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

function TAtribuicoes.getField(campo, coluna: String): String;
begin
  try
    Result := '';

    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT ' + campo + ' FROM ' + TABLENAME;

      if coluna = 'NOSSONUMERO' then
      begin
        SQL.Add(' WHERE NUM_NOSSONUMERO =:NOSSONUMERO ');
        ParamByName('NOSSONUMERO').AsString := Self.NossoNumero;
      end
      else if coluna = 'ENTREGADOR' then
      begin
        SQL.Add(' WHERE COD_ENTREGADOR = :ENTREGADOR ');
        ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
      end;
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

function TAtribuicoes.JaExiste(): Boolean;
begin
  try
    Result := False;

    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);
      SQL.Add(' WHERE NUM_NOSSONUMERO = :NOSSONUMERO');
      ParamByName('NOSSONUMERO').AsString := Self.NossoNumero;
      Open;
      if not(IsEmpty) then
        Result := True;
    end;

    dm.QryGetObject.Close;
    dm.QryGetObject.SQL.Clear;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TAtribuicoes.getPedido: String;
begin
  Result := _pedido;
end;

procedure TAtribuicoes.setCep(const Value: String);
begin
  _cep := Value;
end;

procedure TAtribuicoes.setEntregador(const Value: Integer);
begin
  _entregador := Value;
end;

procedure TAtribuicoes.setNossoNumero(const Value: String);
begin
  _nossonumero := Value;
end;

procedure TAtribuicoes.setOcorrencia(const Value: String);
begin
  _ocorrencia := Value;
end;

procedure TAtribuicoes.setPedido(const Value: String);
begin
  _pedido := Value;
end;

function TAtribuicoes.getCliente: Integer;
begin
  Result := _cliente;
end;

function TAtribuicoes.getData: TDateTime;
begin
  Result := _data;
end;

procedure TAtribuicoes.setCliente(const Value: Integer);
begin
  _cliente := Value;
end;

procedure TAtribuicoes.setData(const Value: TDateTime);
begin
  _data := Value;
end;

function TAtribuicoes.getExcluir: String;
begin
  Result := _excluir;
end;

procedure TAtribuicoes.setExcluir(const Value: String);
begin
  _excluir := Value;
end;

function TAtribuicoes.getStatus: Integer;
begin
  Result := _status;
end;

procedure TAtribuicoes.setStatus(const Value: Integer);
begin
  _status := Value;
end;

function TAtribuicoes.getAdvalorem: Double;
begin
  Result := _advalorem;
end;

function TAtribuicoes.getPagoFranquia: Double;
begin
  Result := _pagofranquia;
end;

function TAtribuicoes.getPesoFranquia: Double;
begin
  Result := _pesofranquia;
end;

function TAtribuicoes.getPesoReal: Double;
begin
  Result := _pesoreal;
end;

function TAtribuicoes.getVerbaFranquia: Double;
begin
  Result := _verbafranquia;
end;

procedure TAtribuicoes.setAdvalorem(const Value: Double);
begin
  _advalorem := Value;
end;

procedure TAtribuicoes.setPagoFranquia(const Value: Double);
begin
  _pagofranquia := Value;
end;

procedure TAtribuicoes.setPesoFranquia(const Value: Double);
begin
  _pesofranquia := Value;
end;

procedure TAtribuicoes.setPesoReal(const Value: Double);
begin
  _pesoreal := Value;
end;

procedure TAtribuicoes.setVerbaFranquia(const Value: Double);
begin
  _verbafranquia := Value;
end;

end.
