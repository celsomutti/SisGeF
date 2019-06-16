unit clEnderecosCadastro;

interface

uses clendereco, clConexao, Vcl.Dialogs, System.SysUtils;

type
  TEndrecosCadastro = class(TEndereco)
  private
    FCadastro: Integer;
    FTipo: String;
    FCorrespondencia: Integer;
    conexao : TConexao;
    procedure SetEmpresa(val: Integer);
    procedure SetTipo(val: String);
    procedure SetCorrespondencia(val: Integer);
  public
    property Cadastro: Integer read FCadastro write SetEmpresa;
    property Tipo: String read FTipo write SetTipo;
    property Correspondencia: Integer read FCorrespondencia write SetCorrespondencia;
    constructor Create;
    destructor Destroy; override;
    function Validar: Boolean;
    function Insert: Boolean;
    function Update: Boolean;
    function Delete(sFiltro: String): Boolean;
    function getObject(sId: String; sFiltro: String): Boolean;
    function getField(sCampo: String; sColuna: String): String;
    function getObjects: Boolean;
  end;

const
  TABLENAME = 'cad_enderecos_cadastro';

implementation

uses udm;

procedure TEndrecosCadastro.SetEmpresa(val: Integer);
begin
  FCadastro := val;
end;

procedure TEndrecosCadastro.SetTipo(val: String);
begin
  fTipo := val;
end;

procedure TEndrecosCadastro.SetCorrespondencia(val: Integer);
begin
  FCorrespondencia := val;
end;

constructor TEndrecosCadastro.Create;
begin
  inherited Create;
  conexao := TConexao.Create;
end;

destructor TEndrecosCadastro.Destroy;
begin
  conexao.Free;
  inherited Destroy;
end;

function TEndrecosCadastro.Validar: Boolean;
begin
  Result  :=  False;
  if Self.Cadastro = 0 then
  begin
    MessageDlg('Código de Cadastro inválido!',mtWarning,[mbCancel],0);
    Exit;
  end;
  {if Self.Cadastro = 0 then
  begin
    MessageDlg('Sequência de Endereço inválida!',mtWarning,[mbCancel],0);
    Exit;
  end;}
  if Self.Tipo.IsEmpty then
  begin
    MessageDlg('Informe o Tipo de Endereço!',mtWarning,[mbCancel],0);
    Exit;
  end;
  if Self.Endereco.IsEmpty then
  begin
    MessageDlg('Informe o Endereço!',mtWarning,[mbCancel],0);
    Exit;
  end;
  if Self.Numero.IsEmpty then
  begin
    MessageDlg('Informe o Número do Endereço (caso não exista informe SN ou 0)!',mtWarning,[mbCancel],0);
    Exit;
  end;
  if Self.Bairro.IsEmpty then
  begin
    MessageDlg('Informe o Bairro do Endereço!',mtWarning,[mbCancel],0);
    Exit;
  end;
  if Self.Cidade.IsEmpty then
  begin
    MessageDlg('Informe a Cidade do Endereço!',mtWarning,[mbCancel],0);
    Exit;
  end;
  if Self.UF.IsEmpty then
  begin
    MessageDlg('Informe a Sigla do Estado do Endereço!',mtWarning,[mbCancel],0);
    Exit;
  end;
  Result  :=  True;
end;

function TEndrecosCadastro.Insert: Boolean;
begin
  try
    Result := False;
    if (not conexao.VerifyConnZEOS(0)) then
    begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados!', mtError, [mbCancel], 0);
      Exit;
    end;
    dm.QryCRUD.Close;
    dm.QryCRUD.SQL.Clear;
    dm.QryCRUD.SQL.Text :=  'INSERT INTO ' + TABLENAME + ' ( ' +
                            'COD_CADASTRO, ' +
                            'DES_TIPO, ' +
                            'DOM_CORRESPONDENCIA,' +
                            'DES_LOGRADOURO, ' +
                            'NUM_LOGRADOURO, ' +
                            'DES_COMPLEMENTO, ' +
                            'DES_BAIRRO, ' +
                            'NOM_CIDADE, ' +
                            'UF_ESTADO, ' +
                            'NUM_CEP, ' +
                            'DES_REFERENCIA) ' +
                            'VALUES(' +
                            ':CODIGO, ' +
                            ':SEQUENCIA, ' +
                            ':TIPO, ' +
                            ':CORRESPONDENCIA, ' +
                            ':ENDERECO, ' +
                            ':NUMERO, ' +
                            ':COMPLEMENTO, ' +
                            ':BAIRRO, ' +
                            ':CIDADE, ' +
                            ':UF, ' +
                            ':CEP, ' +
                            ':REFERENCIA);';

    dm.QryCRUD.ParamByName('CODIGO').AsInteger := Self.Cadastro;
    dm.QryCRUD.ParamByName('TIPO').AsString := Self.Tipo;
    dm.QryCRUD.ParamByName('ENDERECO').AsString := Self.Endereco;
    dm.QryCRUD.ParamByName('NUMERO').AsString := Self.Numero;
    dm.QryCRUD.ParamByName('COMPLEMENTO').AsString := Self.Complemento;
    dm.QryCRUD.ParamByName('CORRESPONDENCIA').AsInteger := Self.Correspondencia;
    dm.QryCRUD.ParamByName('BAIRRO').AsString := Self.Bairro;
    dm.QryCRUD.ParamByName('CIDADE').AsString := Self.Cidade;
    dm.QryCRUD.ParamByName('UF').AsString := Self.UF;
    dm.QryCRUD.ParamByName('CEP').AsString := Self.Cep;
    dm.QryCRUD.ParamByName('REFERENCIA').AsString := Self.Referencia;
    dm.ZConn.PingServer;
    dm.QryCRUD.ExecSQL;
    dm.QryCRUD.Close;
    dm.QryCRUD.SQL.Clear;
    Result := True;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +  E.Message);
  end;
end;

function TEndrecosCadastro.Update: Boolean;
begin
  try
    Result := False;
    if (not conexao.VerifyConnZEOS(0)) then
    begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados!', mtError, [mbCancel], 0);
      Exit;
    end;
    dm.QryCRUD.Close;
    dm.QryCRUD.SQL.Clear;
    dm.QryCRUD.SQL.Text :=  'UPDATE ' + TABLENAME + ' SET ' +
                            'DOM_CORRESPONDENCIA = :CORRESPONDENCIA, ' +
                            'DES_LOGRADOURO = :ENDERECO, ' +
                            'NUM_LOGRADOURO = :NUMERO, ' +
                            'DES_COMPLEMENTO = :COMPLEMENTO, ' +
                            'DES_BAIRRO = :BAIRRO, ' +
                            'NOM_CIDADE = :CIDADE, ' +
                            'UF_ESTADO = :UF, ' +
                            'NUM_CEP = :CEP, ' +
                            'DES_REFERENCIA = :REFERENCIA ' +
                            'WHERE COD_CASTRO = :CODIGO AND DES_TIPO = :TIPO';
    dm.QryCRUD.ParamByName('CODIGO').AsInteger := Self.Cadastro;
    dm.QryCRUD.ParamByName('TIPO').AsString := Self.Tipo;
    dm.QryCRUD.ParamByName('CORRESPONDENCIA').AsInteger := Self.Correspondencia;
    dm.QryCRUD.ParamByName('ENDERECO').AsString := Self.Endereco;
    dm.QryCRUD.ParamByName('NUMERO').AsString := Self.Numero;
    dm.QryCRUD.ParamByName('COMPLEMENTO').AsString := Self.Complemento;
    dm.QryCRUD.ParamByName('BAIRRO').AsString := Self.Bairro;
    dm.QryCRUD.ParamByName('CIDADE').AsString := Self.Cidade;
    dm.QryCRUD.ParamByName('UF').AsString := Self.UF;
    dm.QryCRUD.ParamByName('CEP').AsString := Self.Cep;
    dm.QryCRUD.ParamByName('REFERENCIA').AsString := Self.Referencia;
    dm.ZConn.PingServer;
    dm.QryCRUD.ExecSQL;
    dm.QryCRUD.Close;
    dm.QryCRUD.SQL.Clear;

    Result := True;
  Except on E: Exception do
    ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' + E.Message);
  end;
end;

function TEndrecosCadastro.Delete(sFiltro: String): Boolean;
begin
  try
    Result := False;
    if sFiltro.IsEmpty then
    begin
      Exit;
    end;
    if (not conexao.VerifyConnZEOS(0)) then
    begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados!', mtError, [mbCancel], 0);
      Exit;
    end;
    dm.QryCRUD.Close;
    dm.QryCRUD.SQL.Clear;
    dm.QryCRUD.SQL.Add('DELETE FROM ' + TABLENAME);
    if sFiltro = 'CODIGO' then
    begin
      dm.QryCRUD.SQL.Add('WHERE COD_EMPRESA = :CODIGO');
      dm.QryCRUD.ParamByName('CODIGO').AsInteger := Self.Cadastro;
    end
    else if sFiltro = 'TIPO' then
    begin
      dm.QryCRUD.SQL.Add('WHERE COD_EMPRESA = :CODIGO AND DES_TIPO = :TIPO');
      dm.QryCRUD.ParamByName('CODIGO').AsInteger := Self.Cadastro;
      dm.QryCRUD.ParamByName('TIPO').AsString := Self.Tipo;
    end;
    dm.ZConn.PingServer;
    dm.QryCRUD.ExecSQL;
    dm.QryCRUD.Close;
    dm.QryCRUD.SQL.Clear;
    Result := True;
  Except on E: Exception do
    ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' + E.Message);
  end;
end;

function TEndrecosCadastro.getObject(sId: String; sFiltro: String): Boolean;
begin
  try
    Result  :=  False;
    if sId.IsEmpty then
    begin
      Exit;
    end;
    if sFiltro.IsEmpty then
    begin
      Exit;
    end;
    if (not conexao.VerifyConnZEOS(0)) then
    begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados!', mtError, [mbCancel], 0);
      Exit;
    end;
    dm.QryGetObject.Close;
    dm.QryGetObject.SQL.Clear;
    dm.QryGetObject.SQL.Add('SELECT * FROM ' + TABLENAME);
    if sFiltro = 'CODIGO' then
    begin
      dm.QryGetObject.SQL.Add('WHERE COD_CADASTRO = :CODIGO');
      dm.QryGetObject.ParamByName('CODIGO').AsInteger :=  StrToInt(sId);
    end
    else if sFiltro = 'CHAVE' then
    begin
      dm.QryGetObject.SQL.Add('WHERE COD_CADASTRO = :CODIGO AND DES_TIPO = :TIPO');
      dm.QryGetObject.ParamByName('CODIGO').AsInteger :=  Self.Cadastro;
      dm.QryGetObject.ParamByName('TIPO').AsString :=  sId;
    end
    else if sFiltro = 'TIPO' then
    begin
      dm.QryGetObject.SQL.Add('WHERE DES_TIPO = :TIPO');
      dm.QryGetObject.ParamByName('TIPO').AsString :=  sId;
    end
    else if sFiltro = 'ENDERECO' then
    begin
      dm.QryGetObject.SQL.Add('WHERE DES_LOGRADOURO LIKE :ENDERECO');
      dm.QryGetObject.ParamByName('ENDERECO').AsString :=  sId;
    end
    else if sFiltro = 'BAIRRO' then
    begin
      dm.QryGetObject.SQL.Add('WHERE DES_BAIRRO LIKE :BAIRRO');
      dm.QryGetObject.ParamByName('BAIRRO').AsString :=  sId;
    end
    else if sFiltro = 'CIDADE' then
    begin
      dm.QryGetObject.SQL.Add('WHERE DES_CIDADE LIKE :CIDADE');
      dm.QryGetObject.ParamByName('CIDADE').AsString :=  sId;
    end
    else if sFiltro = 'UF' then
    begin
      dm.QryGetObject.SQL.Add('WHERE UF_ESTADO = :UF');
      dm.QryGetObject.ParamByName('UF').AsString :=  sId;
    end
    else if sFiltro = 'CEP' then
    begin
      dm.QryGetObject.SQL.Add('WHERE NUM_CEP = :CEP');
      dm.QryGetObject.ParamByName('CEP').AsString :=  sId;
    end;
    dm.ZConn.PingServer;
    dm.QryGetObject.Open;
    if (not dm.QryGetObject.IsEmpty) then
    begin
      dm.QryGetObject.First;
      Self.Cadastro := dm.QryGetObject.FieldByName('COD_CADASTRO').AsInteger;
      Self.Tipo := dm.QryGetObject.FieldByName('DES_TIPO').AsString;
      Self.Endereco := dm.QryGetObject.FieldByName('DES_LOGRADOURO').AsString;
      Self.Numero := dm.QryGetObject.FieldByName('NUM_LOGRADOURO').AsString;
      Self.Complemento := dm.QryGetObject.FieldByName('DES_COMPLEMENTO').AsString;
      Self.Bairro := dm.QryGetObject.FieldByName('DES_BAIRRO').AsString;
      Self.Cidade := dm.QryGetObject.FieldByName('NOM_CIDADE').AsString;
      Self.Cep := dm.QryGetObject.FieldByName('NUM_CEP').AsString;
      Self.Referencia := dm.QryGetObject.FieldByName('DES_REFERENCIA').AsString;
      Self.UF := dm.QryGetObject.FieldByName('UF_ESTADO').AsString;
      Self.Correspondencia := dm.QryGetObject.FieldByName('DOM_CORRESPONDENCIA').AsInteger;
      Result  :=  True;
      Exit;
    end;
    dm.QryGetObject.Close;
    dm.QryGetObject.SQL.Clear;
  Except on E: Exception do
    ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' + E.Message);
  end;
end;

function TEndrecosCadastro.getField(sCampo: String; sColuna: String): String;
begin
  try
    Result  :=  '';
    if sCampo.IsEmpty then
    begin
      Exit;
    end;
    if sColuna.IsEmpty then
    begin
      Exit;
    end;
    if (not conexao.VerifyConnZEOS(0)) then
    begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados!', mtError, [mbCancel], 0);
      Exit;
    end;
    dm.qryFields.Close;
    dm.qryFields.SQL.Clear;
    dm.qryFields.SQL.Add('SELECT ' + sCampo + ' FROM ' + TABLENAME);
    if sColuna = 'CODIGO' then
    begin
      dm.qryFields.SQL.Add('WHERE COD_CADASTRO = :CODIGO');
      dm.qryFields.ParamByName('CODIGO').AsInteger := sELF.Cadastro;
    end
    else if sColuna = 'TIPO' then
    begin
      dm.qryFields.SQL.Add('WHERE DES_TIPO = :TIPO');
      dm.qryFields.ParamByName('TIPO').AsString :=  Self.Tipo;
    end
    else if sColuna = 'ENDERECO' then
    begin
      dm.qryFields.SQL.Add('WHERE DES_LOGRADOURO = :ENDERECO');
      dm.qryFields.ParamByName('ENDERECO').AsString :=  Self.Endereco;
    end
    else if sColuna = 'BAIRRO' then
    begin
      dm.qryFields.SQL.Add('WHERE DES_BAIRRO = :BAIRRO');
      dm.qryFields.ParamByName('BAIRRO').AsString :=  Self.Bairro;
    end
    else if sColuna = 'CIDADE' then
    begin
      dm.qryFields.SQL.Add('WHERE DES_CIDADE = :CIDADE');
      dm.qryFields.ParamByName('CIDADE').AsString :=  Self.Cidade;
    end
    else if sColuna = 'UF' then
    begin
      dm.qryFields.SQL.Add('WHERE UF_ESTADO = :UF');
      dm.qryFields.ParamByName('UF').AsString :=  Self.UF;
    end
    else if sColuna = 'CEP' then
    begin
      dm.qryFields.SQL.Add('WHERE NUM_CEP = :CEP');
      dm.qryFields.ParamByName('CEP').AsString :=  Self.Cep;
    end;
    dm.ZConn.PingServer;
    dm.qryFields.Open;
    dm.qryFields.Open;
    if (not dm.qryFields.IsEmpty) then begin
      dm.qryFields.First;
      Result  :=  dm.qryFields.FieldByName(sCampo).AsString;
    end;
    dm.qryFields.Close;
    dm.qryFields.SQL.Clear;
  Except on E: Exception do
    ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' + E.Message);
  end;
end;

function TEndrecosCadastro.getObjects: Boolean;
begin
  try
    Result  :=  False;
    if (not conexao.VerifyConnZEOS(0)) then begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados!', mtError, [mbCancel], 0);
      Exit;
    end;
    if dm.qryGetObject.Active then begin
      dm.qryGetObject.Close;
    end;
    dm.qryGetObject.SQL.Clear;
    dm.qryGetObject.SQL.Add('SELECT * FROM ' + TABLENAME);
    dm.ZConn.PingServer;
    dm.qryGetObject.Open;
    if (not dm.qryGetObject.IsEmpty) then begin
      Result  :=  True;
      Exit;
    end;
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
  except on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' + E.Message);
  end;
end;


end.
