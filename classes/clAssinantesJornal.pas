unit clAssinantesJornal;

interface

uses udm, System.SysUtils, Vcl.Dialogs, clConexao;

type
  TAssinantesJornal = class(TObject)
  private
    FID: Integer;
    FCodigo: String;
    FModalidade: Integer;
    FProduto: String;
    FOrdem: Integer;
    FQuantidade: Integer;
    FNome: String;
    FTipoLogradouro: String;
    FLogradouro: String;
    FNumero: String;
    FComplemento: String;
    FBairro: String;
    FCidade: String;
    FEstado: String;
    FCEP: String;
    FReferencia: String;
    FRoteiro: String;
    FLOG: String;
    conexao: TConexao;
    procedure SetID(val: Integer);
    procedure SetCodigo(val: String);
    procedure SetModalidade(val: Integer);
    procedure SetProduto(val: String);
    procedure SetOrdem(val: Integer);
    procedure SetQuantidade(val: Integer);
    procedure SetNome(val: String);
    procedure SetTipoLogradouro(val: String);
    procedure SetLogradouro(val: String);
    procedure SetNumero(val: String);
    procedure SetComplemento(val: String);
    procedure SetBairro(val: String);
    procedure SetCidade(val: String);
    procedure SetEstado(val: String);
    procedure SetCEP(val: String);
    procedure SetReferencia(val: String);
    procedure SetRoteiro(val: String);
    procedure SetLOG(val: String);
  public
    property ID: Integer read FID write SetID;
    property Codigo: String read FCodigo write SetCodigo;
    property Modalidade: Integer read FModalidade write SetModalidade;
    property Produto: String read FProduto write SetProduto;
    property Ordem: Integer read FOrdem write SetOrdem;
    property Quantidade: Integer read FQuantidade write SetQuantidade;
    property Nome: String read FNome write SetNome;
    property TipoLogradouro: String read FTipoLogradouro
      write SetTipoLogradouro;
    property Logradouro: String read FLogradouro write SetLogradouro;
    property Numero: String read FNumero write SetNumero;
    property Complemento: String read FComplemento write SetComplemento;
    property Bairro: String read FBairro write SetBairro;
    property Cidade: String read FCidade write SetCidade;
    property Estado: String read FEstado write SetEstado;
    property CEP: String read FCEP write SetCEP;
    property Referencia: String read FReferencia write SetReferencia;
    property Roteiro: String read FRoteiro write SetRoteiro;
    property LOG: String read FLOG write SetLOG;
    function Validar: Boolean;
    constructor Create;
    destructor Destroy; override;
    function Insert: Boolean;
    function Update: Boolean;
    function getObject(sId: String; sFiltro: String): Boolean;
    function getField(sCampo: String; sColuna: String): String;
    function Delete(sFiltro: String): Boolean;
  end;

const
  TABLENAME = 'jor_assinantes_jornal';

implementation

uses uGlobais;

procedure TAssinantesJornal.SetID(val: Integer);
begin
  FID := val;
end;

procedure TAssinantesJornal.SetCodigo(val: String);
begin
  FCodigo := val;
end;

procedure TAssinantesJornal.SetModalidade(val: Integer);
begin
  FModalidade := val;
end;

procedure TAssinantesJornal.SetProduto(val: String);
begin
  FProduto := val;
end;

procedure TAssinantesJornal.SetOrdem(val: Integer);
begin
  FOrdem := val;
end;

procedure TAssinantesJornal.SetQuantidade(val: Integer);
begin
  FQuantidade := val;
end;

procedure TAssinantesJornal.SetNome(val: String);
begin
  FNome := val;
end;

procedure TAssinantesJornal.SetTipoLogradouro(val: String);
begin
  FTipoLogradouro := val;
end;

procedure TAssinantesJornal.SetLogradouro(val: String);
begin
  FLogradouro := val;
end;

procedure TAssinantesJornal.SetNumero(val: String);
begin
  FNumero := val;
end;

procedure TAssinantesJornal.SetComplemento(val: String);
begin
  FComplemento := val;
end;

procedure TAssinantesJornal.SetBairro(val: String);
begin
  FBairro := val;
end;

procedure TAssinantesJornal.SetCidade(val: String);
begin
  FCidade := val;
end;

procedure TAssinantesJornal.SetEstado(val: String);
begin
  FEstado := val;
end;

procedure TAssinantesJornal.SetCEP(val: String);
begin
  FCEP := val;
end;

procedure TAssinantesJornal.SetReferencia(val: String);
begin
  FReferencia := val;
end;

procedure TAssinantesJornal.SetRoteiro(val: String);
begin
  FRoteiro := val;
end;

procedure TAssinantesJornal.SetLOG(val: String);
begin
  FLOG := val;
end;

function TAssinantesJornal.Validar: Boolean;
begin
  try
    Result := False;
    if Self.Codigo.IsEmpty then
    begin
      MessageDlg('Informe o código do assinante!',mtWarning, [mbOK],0);
      Exit;
    end;
    if Self.Modalidade = 0 then
    begin
      MessageDlg('Informe a modalidade da assinantura!',mtWarning, [mbOK],0);
      Exit;
    end;
    if Self.Produto.IsEmpty then
    begin
      MessageDlg('Informe o produto da assinantura!',mtWarning, [mbOK],0);
      Exit;
    end;
    if Self.Quantidade = 0 then
    begin
      MessageDlg('Informe a quantidade de exemplares da assinantura!',mtWarning, [mbOK],0);
      Exit;
    end;
    if Self.Nome.IsEmpty then
    begin
      MessageDlg('Informe o nome do assinante!',mtWarning, [mbOK],0);
      Exit;
    end;
    if Self.Logradouro.IsEmpty then
    begin
      MessageDlg('Informe o endereço da assinantura!',mtWarning, [mbOK],0);
      Exit;
    end;
    if Self.Cidade.IsEmpty then
    begin
      MessageDlg('Informe a cidade da assinantura!',mtWarning, [mbOK],0);
      Exit;
    end;
    if Self.Estado.IsEmpty then
    begin
      MessageDlg('Informe o estado da assinantura!',mtWarning, [mbOK],0);
      Exit;
    end;
    if Self.CEP.IsEmpty then
    begin
      MessageDlg('Informe o CEP da assinantura!',mtWarning, [mbOK],0);
      Exit;
    end;
    Result := True;
  except
    on E: Exception do
    begin
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' + E.Message);
    end;
  end;
end;

constructor TAssinantesJornal.Create;
begin
  inherited Create;
  conexao :=  TConexao.Create;
end;

destructor TAssinantesJornal.Destroy;
begin
  conexao.Free;
  inherited Destroy;
end;

function TAssinantesJornal.Insert: Boolean;
begin
  try
    Result := False;
    if (not conexao.VerifyConnZEOS(0)) then begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados!', mtError, [mbCancel], 0);
      Exit;
    end;
    if dm.qryCRUD.Active then begin
      dm.qryCRUD.Close;
    end;
    dm.qryCRUD.SQL.Clear;
    dm.qryCRUD.SQL.Text :=  'INSERT INTO ' +  TABLENAME +
                            '(COD_ASSINANTE, ' +
                            'COD_MODALIDADE, ' +
                            'COD_PRODUTO, ' +
                            'NUM_ORDEM, ' +
                            'QTD_EXEMPLARES, ' +
                            'NOM_ASSINANTE, ' +
                            'DES_TIPO_LOGRADOURO, ' +
                            'DES_LOGRADOURO, ' +
                            'NUM_LOGRADOURO , ' +
                            'DES_COMPLEMENTO, ' +
                            'NOM_BAIRRO, ' +
                            'NOM_CIDADE, ' +
                            'UF_ESTADO, ' +
                            'NUM_CEP, ' +
                            'DES_REFERENCIA, ' +
                            'DES_ROTEIRO, ' +
                            'DES_LOG) ' +
                            'VALUES ' +
                            '(:CODIGO, ' +
                            ':MODALIDADE, ' +
                            ':PRODUTO, ' +
                            ':ORDEM, ' +
                            ':EXEMPLARES, ' +
                            ':NOME, ' +
                            ':TIPO, ' +
                            ':LOGRADOURO, ' +
                            ':NUMERO, ' +
                            ':COMPLEMENTO, ' +
                            ':BAIRRO, ' +
                            ':CIDADE, ' +
                            ':UF, ' +
                            ':CEP, ' +
                            ':REFERENCIA, ' +
                            ':ROTEIRO, ' +
                            ':LOG);';

    dm.qryCRUD.ParamByName('CODIGO').AsString := Self.Codigo;
    dm.qryCRUD.ParamByName('MODALIDADE').AsInteger := Self.Modalidade;
    dm.qryCRUD.ParamByName('PRODUTO').AsString := Self.Produto;
    dm.qryCRUD.ParamByName('ORDEM').AsInteger := Self.Ordem;
    dm.qryCRUD.ParamByName('EXEMPLARES').AsInteger := Self.Quantidade;
    dm.qryCRUD.ParamByName('NOME').AsString := Self.Nome;
    dm.qryCRUD.ParamByName('TIPO').AsString := Self.TipoLogradouro;
    dm.qryCRUD.ParamByName('LOGRADOURO').AsString := Self.Logradouro;
    dm.qryCRUD.ParamByName('NUMERO').AsString := Self.Numero;
    dm.qryCRUD.ParamByName('COMPLEMENTO').AsString := Self.Complemento;
    dm.qryCRUD.ParamByName('BAIRRO').AsString := Self.Bairro;
    dm.qryCRUD.ParamByName('CIDADE').AsString := Self.Cidade;
    dm.qryCRUD.ParamByName('UF').AsString := Self.Estado;
    dm.qryCRUD.ParamByName('CEP').AsString := Self.CEP;
    dm.qryCRUD.ParamByName('REFERENCIA').AsString := Self.Referencia;
    dm.qryCRUD.ParamByName('ROTEIRO').AsString := Self.Roteiro;
    dm.qryCRUD.ParamByName('LOG').AsString := Self.Log;
    dm.ZConn.PingServer;
    dm.qryCRUD.ExecSQL;
    dm.qryCRUD.Close;
    dm.qryCRUD.SQL.Clear;
    Result := True;
  except on E: Exception do
    begin
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

function TAssinantesJornal.Update: Boolean;
begin
  try
    Result := False;
    if (not conexao.VerifyConnZEOS(0)) then begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados!', mtError, [mbCancel], 0);
      Exit;
    end;
    if dm.qryCRUD.Active then begin
      dm.qryCRUD.Close;
    end;
    dm.qryCRUD.SQL.Clear;
    dm.qryCRUD.SQL.Text :=  'UPDATE ' + TABLENAME +
                            ' SET '+
                            'COD_ASSINANTE = :CODIGO, ' +
                            'COD_MODALIDADE = :MODALIDADE, ' +
                            'COD_PRODUTO = :PRODUTO, ' +
                            'NUM_ORDEM = :ORDEM, ' +
                            'QTD_EXEMPLARES = :EXEMPLARES, ' +
                            'NOM_ASSINANTE = :NOME, ' +
                            'DES_TIPO_LOGRADOURO = :TIPO, ' +
                            'DES_LOGRADOURO = :LOGRADOURO, ' +
                            'NUM_LOGRADOURO = :NUMERO, ' +
                            'DES_COMPLEMENTO = :COMPLEMENTO, ' +
                            'NOM_BAIRRO = :BAIRRO, ' +
                            'NOM_CIDADE = :CIDADE, ' +
                            'UF_ESTADO = :UF, ' +
                            'NUM_CEP = :CEP, ' +
                            'DES_REFERENCIA = :REFERENCIA, ' +
                            'DES_ROTEIRO = :ROTEIRO, ' +
                            'DES_LOG = :LOG ' +
                            'WHERE ID_ASSINANTE = :ID;';

    dm.qryCRUD.ParamByName('ID').AsInteger := Self.ID;
    dm.qryCRUD.ParamByName('CODIGO').AsString := Self.Codigo;
    dm.qryCRUD.ParamByName('MODALIDADE').AsInteger := Self.Modalidade;
    dm.qryCRUD.ParamByName('PRODUTO').AsString := Self.Produto;
    dm.qryCRUD.ParamByName('ORDEM').AsInteger := Self.Ordem;
    dm.qryCRUD.ParamByName('EXEMPLARES').AsInteger := Self.Quantidade;
    dm.qryCRUD.ParamByName('NOME').AsString := Self.Nome;
    dm.qryCRUD.ParamByName('TIPO').AsString := Self.TipoLogradouro;
    dm.qryCRUD.ParamByName('LOGRADOURO').AsString := Self.Logradouro;
    dm.qryCRUD.ParamByName('NUMERO').AsString := Self.Numero;
    dm.qryCRUD.ParamByName('COMPLEMENTO').AsString := Self.Complemento;
    dm.qryCRUD.ParamByName('BAIRRO').AsString := Self.Bairro;
    dm.qryCRUD.ParamByName('CIDADE').AsString := Self.Cidade;
    dm.qryCRUD.ParamByName('UF').AsString := Self.Estado;
    dm.qryCRUD.ParamByName('CEP').AsString := Self.CEP;
    dm.qryCRUD.ParamByName('REFERENCIA').AsString := Self.Referencia;
    dm.qryCRUD.ParamByName('ROTEIRO').AsString := Self.Roteiro;
    dm.qryCRUD.ParamByName('LOG').AsString := Self.Log;
    dm.ZConn.PingServer;
    dm.qryCRUD.ExecSQL;
    dm.qryCRUD.Close;
    dm.qryCRUD.SQL.Clear;
    Result := True;
  except on E: Exception do
    begin
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

function TAssinantesJornal.getObject(sId: String; sFiltro: String): Boolean;
begin
  Result := False;
  if (not conexao.VerifyConnZEOS(0)) then begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados!', mtError, [mbCancel], 0);
    Exit;
  end;
  dm.QryGetObject.Close;
  dm.QryGetObject.SQL.Clear;
  dm.QryGetObject.SQL.Add('SELECT * FROM ' + TABLENAME);
  if sFiltro = 'ID' then
  begin
    dm.QryGetObject.SQL.Add('WHERE ID_ASSINANTE = :ID');
    dm.QryGetObject.ParamByName('ID').AsInteger :=  StrToInt(sId);
  end
  else if sFiltro = 'CODIGO' then
  begin
    dm.QryGetObject.SQL.Add('WHERE COD_ASSINANTE = :CODIGO');
    dm.QryGetObject.ParamByName('CODIGO').AsString :=  sId;
  end
  else if sFiltro = 'ROTEIRO' then
  begin
    dm.QryGetObject.SQL.Add('WHERE DES_ROTEIRO = :ROTEIRO');
    dm.QryGetObject.ParamByName('ROTEIRO').AsString :=  sId;
  end
  else if sFiltro = 'NOME' then
  begin
    dm.QryGetObject.SQL.Add('WHERE NOM_ASSINANTE LIKE :NOME');
    dm.QryGetObject.ParamByName('NOME').AsString := '%' +  sId + '%';
  end
  else if sFiltro = 'PRODUTO' then
  begin
    dm.QryGetObject.SQL.Add('WHERE COD_PRODUTO = :PRODUTO');
    dm.QryGetObject.ParamByName('PRODUTO').AsString := sId;
  end
  else if sFiltro = 'MODALIDADE' then
  begin
    dm.QryGetObject.SQL.Add('WHERE COD_MODALIDADE = :MODALIDADE');
    dm.QryGetObject.ParamByName('MODALIDADE').AsInteger := StrToIntDef(sId,0);
  end
  else if sFiltro = 'CHAVE' then
  begin
    dm.QryGetObject.SQL.Add('WHERE COD_ASSINANTE = :CODIGO AND COD_PRODUTO = :PRODUTO AND COD_MODALIDADE = :MODALIDADE');
    dm.QryGetObject.ParamByName('CODIGO').AsString := Self.Codigo;
    dm.QryGetObject.ParamByName('PRODUTO').AsString := Self.Produto;
    dm.QryGetObject.ParamByName('MODALIDADE').AsInteger := Self.Modalidade;
  end;
  dm.ZConn.PingServer;
  dm.QryGetObject.Open;
  if (not dm.QryGetObject.IsEmpty) then
  begin
    dm.QryGetObject.First;
    Self.ID := dm.QryGetObject.FieldByName('ID_ASSINANTE').AsInteger;
    Self.Codigo := dm.QryGetObject.FieldByName('COD_ASSINANTE').AsString;
    Self.Modalidade := dm.QryGetObject.FieldByName('COD_MODALIDADE').AsInteger;
    Self.Produto := dm.QryGetObject.FieldByName('COD_PRODUTO').AsString;
    Self.Ordem := dm.QryGetObject.FieldByName('NUM_ORDEM').AsInteger;
    Self.Quantidade := dm.QryGetObject.FieldByName('QTD_EXEMPLARES').AsInteger;
    Self.Nome := dm.QryGetObject.FieldByName('NOM_ASSINANTE').AsString;
    Self.TipoLogradouro := dm.QryGetObject.FieldByName('DES_TIPO_LOGRADOURO').AsString;
    Self.Logradouro := dm.QryGetObject.FieldByName('DES_LOGRADOURO').AsString;
    Self.Numero := dm.QryGetObject.FieldByName('NUM_LOGRADOURO').AsString;
    Self.Complemento := dm.QryGetObject.FieldByName('DES_COMPLEMENTO').AsString;
    Self.Bairro := dm.QryGetObject.FieldByName('NOM_BAIRRO').AsString;
    Self.Cidade := dm.QryGetObject.FieldByName('NOM_CIDADE').AsString;
    Self.Estado := dm.QryGetObject.FieldByName('UF_ESTADO').AsString;
    Self.CEP := dm.QryGetObject.FieldByName('NUM_CEP').AsString;
    Self.Referencia := dm.QryGetObject.FieldByName('DES_REFERENCIA').AsString;
    Self.Roteiro := dm.QryGetObject.FieldByName('DES_ROTEIRO').AsString;
    Self.Log := dm.QryGetObject.FieldByName('DES_LOG').AsString;
    Result  :=  True;
    Exit;
  end;
  dm.QryGetObject.Close;
  dm.QryGetObject.SQL.Clear;
end;

function TAssinantesJornal.getField(sCampo: String; sColuna: String): String;
begin
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
  if sColuna = 'ID' then
  begin
    dm.QryGetObject.SQL.Add('WHERE ID_ASSINANTE = :ID');
    dm.QryGetObject.ParamByName('ID').AsInteger :=  Self.ID;
  end
  else if sColuna = 'CODIGO' then
  begin
    dm.QryGetObject.SQL.Add('WHERE COD_ASSINNTE = :CODIGO');
    dm.QryGetObject.ParamByName('CODIGO').AsString :=  Self.Codigo;
  end;
  dm.ZConn.PingServer;
  dm.qryFields.Open;
  if (not dm.qryFields.IsEmpty) then begin
    dm.qryFields.First;
    Result  :=  dm.qryFields.FieldByName(sCampo).AsString;
  end;
  dm.qryFields.Close;
  dm.qryFields.SQL.Clear;
end;

function TAssinantesJornal.Delete(sFiltro: String): Boolean;
begin
  Result := False;
  if (not conexao.VerifyConnZEOS(0)) then begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados!', mtError, [mbCancel], 0);
    Exit;
  end;
  if dm.qryCRUD.Active then begin
    dm.qryCRUD.Close;
  end;
  dm.qryCRUD.SQL.Clear;
  dm.qryCRUD.SQL.Add('DELETE FROM' + TABLENAME);
  if sFiltro = 'ID' then
  begin
    dm.QryGetObject.SQL.Add('WHERE ID_ASSINANTE = :ID');
    dm.QryGetObject.ParamByName('ID').AsInteger :=  sELF.ID;
  end
  else if sFiltro = 'CODIGO' then
  begin
    dm.QryGetObject.SQL.Add('WHERE COD_ASSINNTE = :CODIGO');
    dm.QryGetObject.ParamByName('CODIGO').AsString :=  sELF.Codigo;
  end
  else if sFiltro = 'ROTEIRO' then
  begin
    dm.QryGetObject.SQL.Add('WHERE DES_ROTEIRO = :ROTEIRO');
    dm.QryGetObject.ParamByName('ROTEIRO').AsString :=  sELF.Roteiro;
  end
  else if sFiltro = 'NOME' then
  begin
    dm.QryGetObject.SQL.Add('WHERE NOM_ASSINANTE = :NOME');
    dm.QryGetObject.ParamByName('NOME').AsString := Self.Nome;
  end
  else if sFiltro = 'PRODUTO' then
  begin
    dm.QryGetObject.SQL.Add('WHERE COD_PRODUTO = :PRODUTO');
    dm.QryGetObject.ParamByName('PRODUTO').AsString := Self.Produto;
  end
  else if sFiltro = 'MODALIDADE' then
  begin
    dm.QryGetObject.SQL.Add('WHERE COD_MODALIDADE = :MODALIDADE');
    dm.QryGetObject.ParamByName('MODALIDADE').AsInteger := Self.Modalidade;
  end;
  dm.ZConn.PingServer;
  dm.qryCRUD.ExecSQL;
  dm.qryCRUD.Close;
  dm.qryCRUD.SQL.Clear;
  Result := True;
end;

end.
