unit clEnderecoAgente;

interface

uses
  clEndereco, clConexao;

type
  TEnderecoAgente = class(TEndereco)
  private
    function getCodigo: Integer;
    function getSequencia: Integer;
    function getTipo: String;
    function getCorrespondencia: Integer;

    procedure setCodigo(const Value: Integer);
    procedure setSequencia(const Value: Integer);
    procedure setTipo(const Value: String);
    procedure setCorrespondencia(const Value: Integer);

    constructor Create;
    destructor Destroy;

  protected
    // declaração de atributos
    _codigo: Integer;
    _sequencia: Integer;
    _tipo: String;
    _correspondencia: Integer;
    _conexao: TConexao;

  public
    // declaração das propriedades da classe, encapsulamento de atributos
    property Codigo: Integer read getCodigo write setCodigo;
    property Sequencia: Integer read getSequencia write setSequencia;
    property Tipo: String read getTipo write setTipo;
    property Correspondencia: Integer read getCorrespondencia
      write setCorrespondencia;
    // na linha acima antes do ponto e virgula (setCidade) pressione Ctrl + Shift + C
    // para gerar os métodos acessores getter e setter automaticamente

    // declaração de métodos

    procedure MaxSeq;

    function Validar(): Boolean;
    function Merge(): Boolean;
    function Delete(Filtro: String): Boolean;
    function getObject(Id: String; Filtro: String): Boolean;
    function Insert(): Boolean;
    function Update(): Boolean;
    function EnderecoJaExiste(): Boolean;

  end;

const
  TABLENAME = 'tbenderecosagentes';

implementation

uses SysUtils, Dialogs, udm, clUtil, ZDataset, ZAbstractRODataset, DB;

{ TEnderecoAgente }

constructor TEnderecoAgente.Create;
begin
  _conexao := TConexao.Create;
  if (not _conexao.VerifyConnZEOS(0)) then
  begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
      Self.ClassName + ') !', mtError, [mbCancel], 0);
  end;
end;

destructor TEnderecoAgente.Destroy;
begin
  _conexao.Free;
end;

function TEnderecoAgente.getCodigo: Integer;
begin
  Result := _codigo;
end;

function TEnderecoAgente.getSequencia: Integer;
begin
  Result := _sequencia;
end;

function TEnderecoAgente.getTipo: String;
begin
  Result := _tipo;
end;

function TEnderecoAgente.getCorrespondencia: Integer;
begin
  Result := _correspondencia;
end;

function TEnderecoAgente.Delete(Filtro: String): Boolean;
begin
  try
    Result := False;

    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Add('DELETE FROM ' + TABLENAME);
      if Filtro = 'CODIGO' then
      begin
        SQL.Add('WHERE COD_AGENTE =:CODIGO');
        ParamByName('CODIGO').AsInteger := Self.Codigo;
      end
      else if Filtro = 'TIPO' then
      begin
        SQL.Add('WHERE COD_AGENTE =:CODIGO AND DES_TIPO = :TIPO');
        ParamByName('CODIGO').AsInteger := Self.Codigo;
        ParamByName('TIPO').AsString := Self.Tipo;
      end;
      if not(dm.ZConn.Ping) then
      begin
        dm.ZConn.PingServer;
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

function TEnderecoAgente.getObject(Id, Filtro: String): Boolean;
begin
  try
    Result := False;

    if TUtil.Empty(Id) then
      Exit;

    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);

      if Filtro = 'TIPO' then
      begin
        SQL.Add(' WHERE COD_AGENTE =:CODIGO AND DES_TIPO =:TIPO');
        ParamByName('CODIGO').AsInteger := Self.Codigo;
        ParamByName('TIPO').AsString := Id;
      end
      else if Filtro = 'CODIGO' then
      begin
        SQL.Add(' WHERE COD_AGENTE = :CODIGO');
        ParamByName('CODIGO').AsInteger := StrToInt(Id);
      end;
      if not(dm.ZConn.Ping) then
      begin
        dm.ZConn.PingServer;
      end;
      Open;
      if not IsEmpty then
      begin
        First;
        Self.Codigo := dm.QryGetObject.FieldByName('COD_AGENTE').AsInteger;
        Self.Sequencia := dm.QryGetObject.FieldByName('SEQ_ENDERECO').AsInteger;
        Self.Tipo := dm.QryGetObject.FieldByName('DES_TIPO').AsString;
        Self.Endereco := dm.QryGetObject.FieldByName('DES_LOGRADOURO').AsString;
        Self.Numero := dm.QryGetObject.FieldByName('NUM_LOGRADOURO').AsString;
        Self.Complemento := dm.QryGetObject.FieldByName
          ('DES_COMPLEMENTO').AsString;
        Self.Bairro := dm.QryGetObject.FieldByName('DES_BAIRRO').AsString;
        Self.Cidade := dm.QryGetObject.FieldByName('NOM_CIDADE').AsString;
        Self.Cep := dm.QryGetObject.FieldByName('NUM_CEP').AsString;
        Self.Referencia := dm.QryGetObject.FieldByName
          ('DES_REFERENCIA').AsString;
        Self.UF := dm.QryGetObject.FieldByName('UF_ESTADO').AsString;
        Self.Correspondencia := dm.QryGetObject.FieldByName
          ('DOM_CORRESPONDENCIA').AsInteger;
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

function TEnderecoAgente.Insert(): Boolean;
begin
  try
    Result := False;
    MaxSeq;
    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'INSERT INTO ' + TABLENAME + ' ( ' + 'COD_AGENTE, ' +
        'SEQ_ENDERECO, ' + 'DES_TIPO, ' + 'DOM_CORRESPONDENCIA, ' +
        'DES_LOGRADOURO, ' + 'NUM_LOGRADOURO, ' + 'DES_COMPLEMENTO, ' +
        'DES_BAIRRO, ' + 'NOM_CIDADE, ' + 'UF_ESTADO, ' + 'NUM_CEP, ' +
        'DES_REFERENCIA ' + ') ' + 'VALUES(' + ':CODIGO, ' + ':SEQUENCIA, ' +
        ':TIPO, ' + ':CORRESPONDENCIA, ' + ':ENDERECO, ' + ':NUMERO, ' +
        ':COMPLEMENTO, ' + ':BAIRRO, ' + ':CIDADE, ' + ':UF, ' + ':CEP, ' +
        ':REFERENCIA ' + ') ';

      ParamByName('CODIGO').AsInteger := Self.Codigo;
      ParamByName('SEQUENCIA').AsInteger := Self.Sequencia;
      ParamByName('TIPO').AsString := Self.Tipo;
      ParamByName('CORRESPONDENCIA').AsInteger := Self.Correspondencia;
      ParamByName('ENDERECO').AsString := Self.Endereco;
      ParamByName('NUMERO').AsString := Self.Numero;
      ParamByName('COMPLEMENTO').AsString := Self.Complemento;
      ParamByName('BAIRRO').AsString := Self.Bairro;
      ParamByName('CIDADE').AsString := Self.Cidade;
      ParamByName('UF').AsString := Self.UF;
      ParamByName('CEP').AsString := Self.Cep;
      ParamByName('REFERENCIA').AsString := Self.Referencia;
      if not(dm.ZConn.Ping) then
      begin
        dm.ZConn.PingServer;
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

function TEnderecoAgente.Merge: Boolean;
begin
  // nada implementado aqui, INSERT e UPDATE executados diretamente
  // o modificador de acesso deste método pode ser definido como private!
  // ou sua declaração pode ser até mesmo removida,
  // não foi removida para manter a padronização de código.

  Result := False;
end;

function TEnderecoAgente.Update(): Boolean;
begin
  try
    Result := False;

    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'UPDATE ' + TABLENAME + ' SET ' + 'DES_TIPO = :TIPO, ' +
        'DOM_CORRESPONDENCIA = :CORRESPONDENCIA, ' +
        'DES_LOGRADOURO = :ENDERECO, ' + 'NUM_LOGRADOURO = :NUMERO, ' +
        'DES_COMPLEMENTO = :COMPLEMENTO, ' + 'DES_BAIRRO = :BAIRRO, ' +
        'NOM_CIDADE = :CIDADE, ' + 'UF_ESTADO = :UF, ' + 'NUM_CEP = :CEP, ' +
        'DES_REFERENCIA = :REFERENCIA ' +
        'WHERE COD_AGENTE = :CODIGO AND SEQ_ENDERECO = :SEQUENCIA';

      ParamByName('CODIGO').AsInteger := Self.Codigo;
      ParamByName('SEQUENCIA').AsInteger := Self.Sequencia;
      ParamByName('TIPO').AsString := Self.Tipo;
      ParamByName('CORRESPONDENCIA').AsInteger := Self.Correspondencia;
      ParamByName('ENDERECO').AsString := Self.Endereco;
      ParamByName('NUMERO').AsString := Self.Numero;
      ParamByName('COMPLEMENTO').AsString := Self.Complemento;
      ParamByName('BAIRRO').AsString := Self.Bairro;
      ParamByName('CIDADE').AsString := Self.Cidade;
      ParamByName('UF').AsString := Self.UF;
      ParamByName('CEP').AsString := Self.Cep;
      ParamByName('REFERENCIA').AsString := Self.Referencia;
      if not(dm.ZConn.Ping) then
      begin
        dm.ZConn.PingServer;
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

function TEnderecoAgente.Validar: Boolean;
begin
  // Na validação de dados podemos colocar qualquer atributo para ser validado
  // codigo abaixo deve ser customizado por cada leitor!

  Result := True;
end;

function TEnderecoAgente.EnderecoJaExiste(): Boolean;
begin
  try
    Result := False;

    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);
      SQL.Add(' WHERE COD_AGENTE = :CODIGO AND DES_TIPO = :TIPO');
      ParamByName('CODIGO').AsInteger := Self.Codigo;
      ParamByName('TIPO').AsString := Self.Tipo;
      if not(dm.ZConn.Ping) then
      begin
        dm.ZConn.PingServer;
      end;
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

procedure TEnderecoAgente.MaxSeq;
begin
  Try
    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT MAX(SEQ_ENDERECO) AS SEQUENCIA FROM ' + TABLENAME +
        ' WHERE COD_AGENTE = :CODIGO';
      ParamByName('CODIGO').AsInteger := Self.Codigo;
      if not(dm.ZConn.Ping) then
      begin
        dm.ZConn.PingServer;
      end;
      Open;
      if not(IsEmpty) then
        First;
    end;

    Self.Sequencia := (dm.QryGetObject.FieldByName('SEQUENCIA').AsInteger) + 1;

    dm.QryGetObject.Close;
    dm.QryGetObject.SQL.Clear;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

procedure TEnderecoAgente.setCodigo(const Value: Integer);
begin
  _codigo := Value;
end;

procedure TEnderecoAgente.setTipo(const Value: String);
begin
  _tipo := Value;
end;

procedure TEnderecoAgente.setSequencia(const Value: Integer);
begin
  _sequencia := Value;
end;

procedure TEnderecoAgente.setCorrespondencia(const Value: Integer);
begin
  _correspondencia := Value;
end;

end.
