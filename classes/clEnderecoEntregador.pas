unit clEnderecoEntregador;

interface

uses
  clEndereco, System.Classes, clConexao;

type
  TEnderecoEntregador = class(TEndereco)
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
    function PopulaLocal(Filtro: String): TStringList;

  end;

const
  TABLENAME = 'tbenderecosentregadores';

implementation

uses SysUtils, Dialogs, udm, clUtil, ZDataset, ZAbstractRODataset, DB;

{ TEnderecoEntregador }

constructor TEnderecoEntregador.Create;
begin
  _conexao := TConexao.Create;
  if (not _conexao.VerifyConnZEOS(0)) then
  begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
      Self.ClassName + ') !', mtError, [mbCancel], 0);
  end;
end;

destructor TEnderecoEntregador.Destroy;
begin
  _conexao.Free;
end;

function TEnderecoEntregador.getCodigo: Integer;
begin
  Result := _codigo;
end;

function TEnderecoEntregador.getSequencia: Integer;
begin
  Result := _sequencia;
end;

function TEnderecoEntregador.getTipo: String;
begin
  Result := _tipo;
end;

function TEnderecoEntregador.getCorrespondencia: Integer;
begin
  Result := _correspondencia;
end;

function TEnderecoEntregador.Delete(Filtro: String): Boolean;
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
        SQL.Add('WHERE COD_ENTREGADOR =:CODIGO');
        ParamByName('CODIGO').AsString := IntToStr(Self.Codigo);
      end
      else if Filtro = 'TIPO' then
      begin
        SQL.Add('WHERE COD_ENTREGADOR =:CODIGO AND DES_TIPO = :TIPO');
        ParamByName('CODIGO').AsString := IntToStr(Self.Codigo);
        ParamByName('TIPO').AsString := Self.Tipo;
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

function TEnderecoEntregador.getObject(Id, Filtro: String): Boolean;
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
        SQL.Add(' WHERE COD_ENTREGADOR =:CODIGO AND DES_TIPO =:TIPO');
        ParamByName('CODIGO').AsInteger := Self.Codigo;
        ParamByName('TIPO').AsString := Id;
      end
      else if Filtro = 'CODIGO' then
      begin
        SQL.Add(' WHERE COD_ENTREGADOR =:CODIGO');
        ParamByName('CODIGO').AsInteger := StrToInt(Id);
      end;
      dm.ZConn.PingServer;
      Open;
      if not IsEmpty then
        First;
    end;

    if dm.QryGetObject.RecordCount > 0 then
    begin
      Self.Codigo := dm.QryGetObject.FieldByName('COD_ENTREGADOR').AsInteger;
      Self.Sequencia := dm.QryGetObject.FieldByName('SEQ_ENDERECO').AsInteger;
      Self.Tipo := dm.QryGetObject.FieldByName('DES_TIPO').AsString;
      Self.Endereco := dm.QryGetObject.FieldByName('DES_LOGRADOURO').AsString;
      Self.Numero := dm.QryGetObject.FieldByName('NUM_LOGRADOURO').AsString;
      Self.Complemento := dm.QryGetObject.FieldByName
        ('DES_COMPLEMENTO').AsString;
      Self.Bairro := dm.QryGetObject.FieldByName('DES_BAIRRO').AsString;
      Self.Cidade := dm.QryGetObject.FieldByName('NOM_CIDADE').AsString;
      Self.Cep := dm.QryGetObject.FieldByName('NUM_CEP').AsString;
      Self.Referencia := dm.QryGetObject.FieldByName('DES_REFERENCIA').AsString;
      Self.UF := dm.QryGetObject.FieldByName('UF_ESTADO').AsString;
      Self.Correspondencia := dm.QryGetObject.FieldByName('DOM_CORRESPONDENCIA')
        .AsInteger;
    end
    else
    begin
      dm.QryGetObject.Close;
      dm.QryGetObject.SQL.Clear;
      Exit;
    end;
    Result := True;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TEnderecoEntregador.Insert(): Boolean;
begin
  try
    Result := False;
    MaxSeq;
    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'INSERT INTO ' + TABLENAME + ' ( ' + 'COD_ENTREGADOR, ' +
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

function TEnderecoEntregador.Merge: Boolean;
begin
  // nada implementado aqui, INSERT e UPDATE executados diretamente
  // o modificador de acesso deste método pode ser definido como private!
  // ou sua declaração pode ser até mesmo removida,
  // não foi removida para manter a padronização de código.

  Result := False;
end;

function TEnderecoEntregador.Update(): Boolean;
begin
  try
    Result := False;

    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'UPDATE ' + TABLENAME + ' SET ' +
        'DES_TIPO_ENDERECO = :TIPO, ' +
        'DOM_CORRESPONDENCIA = :CORRESPONDENCIA, ' +
        'DES_LOGRADOURO = :ENDERECO, ' + 'NUM_LOGRADOURO = :NUMERO, ' +
        'DES_COMPLEMENTO = :COMPLEMENTO, ' + 'DES_BAIRRO = :BAIRRO, ' +
        'NOM_CIDADE = :CIDADE, ' + 'UF_ESTADO = :UF, ' + 'NUM_CEP = :CEP, ' +
        'DES_REFERENCIA = :REFERENCIA ' +
        'WHERE COD_ENTREGADOR = :CODIGO AND SEQ_ENDERECO = :SEQUENCIA';

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

function TEnderecoEntregador.Validar: Boolean;
begin
  // Na validação de dados podemos colocar qualquer atributo para ser validado
  // codigo abaixo deve ser customizado por cada leitor!

  Result := True;
end;

function TEnderecoEntregador.EnderecoJaExiste(): Boolean;
begin
  try
    Result := False;

    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);
      SQL.Add(' WHERE COD_ENTREGADOR = :CODIGO AND DES_TIPO = :TIPO');
      ParamByName('CODIGO').AsInteger := Self.Codigo;
      ParamByName('TIPO').AsString := Self.Tipo;
      dm.ZConn.PingServer;
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

procedure TEnderecoEntregador.MaxSeq;
begin
  Try
    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT MAX(SEQ_ENDERECO) AS SEQUENCIA FROM ' + TABLENAME +
        ' WHERE COD_ENTREGADOR = :CODIGO';
      ParamByName('CODIGO').AsInteger := Self.Codigo;
      dm.ZConn.PingServer;
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

function TEnderecoEntregador.PopulaLocal(Filtro: string): TStringList;
var
  lista: TStringList;
  campo: String;
begin
  lista := TStringList.Create;
  Result := lista;
  if Filtro = 'BAIRRO' then
  begin
    campo := 'DES_BAIRRO';
  end
  else if Filtro = 'CIDADE' then
  begin
    campo := 'NOM_CIDADE';
  end
  else
  begin
    Exit;
  end;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  dm.qryPesquisa.SQL.Text := 'SELECT DISTINCT(' + campo + ') FROM ' + TABLENAME;
  dm.ZConn.PingServer;
  dm.qryPesquisa.Open;
  while (not dm.qryPesquisa.Eof) do
  begin
    lista.Add(dm.qryPesquisa.FieldByName(campo).AsString);
    dm.qryPesquisa.Next;
  end;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  Result := lista;
end;

procedure TEnderecoEntregador.setCodigo(const Value: Integer);
begin
  _codigo := Value;
end;

procedure TEnderecoEntregador.setTipo(const Value: String);
begin
  _tipo := Value;
end;

procedure TEnderecoEntregador.setSequencia(const Value: Integer);
begin
  _sequencia := Value;
end;

procedure TEnderecoEntregador.setCorrespondencia(const Value: Integer);
begin
  _correspondencia := Value;
end;

end.
