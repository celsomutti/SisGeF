unit clEtiquetasJornal;

interface

uses clProdutos, clConexao, clTipoAssinatura;

  type
    TEtiquetasJornal = class(TObject)
    private
    function getRoteiro: Integer;
    function getCEP: String;
    function getCicade: String;
    function getCodigo: String;
    function getComplemento: String;
    function getCuidados: String;
    function getData: TDate;
    function getEdicao: String;
    function getEndereco: String;
    function getId: Integer;
    function getNome: String;
    function getProduto: String;
    function getQuantidade: Integer;
    function getReferencia: String;
    function getUF: String;
    procedure setRoteiro(const Value: Integer);
    procedure setCEP(const Value: String);
    procedure setCidade(const Value: String);
    procedure setCodigo(const Value: String);
    procedure setComplemento(const Value: String);
    procedure setCuidados(const Value: String);
    procedure setData(const Value: TDate);
    procedure setEdicao(const Value: String);
    procedure setEndereco(const Value: String);
    procedure setId(const Value: Integer);
    procedure setNome(const Value: String);
    procedure setProduto(const Value: String);
    procedure setQuantidade(const Value: Integer);
    procedure setReferencia(const Value: String);
    procedure setUF(const Value: String);
    function getBairro: String;
    procedure setBairro(const Value: String);
    function getTipo: String;
    procedure setTipo(const Value: String);
    function getBarra: String;
    procedure setBarra(const Value: String);
    protected
      _id           : Integer;
      _codigo       : String;
      _roteiro      : Integer;
      _produto      : String;
      _tipo         : String;
      _edicao       : String;
      _data         : TDateTime;
      _nome         : String;
      _cuidados     : String;
      _endereco     : String;
      _complemento  : String;
      _bairro       : String;
      _referencia   : String;
      _cidade       : String;
      _uf           : String;
      _cep          : String;
      _barra        : String;
      _qtde         : Integer;
      _produtos     : TProdutos;
      _conexao      : TConexao;
      _tipos        : TTipoAssinatura;
    public

      constructor Create;
      destructor  Destroy;

      property  Id          : Integer read  getId           write setId;
      property  Codigo      : String  read  getCodigo       write setCodigo;
      property  Roteiro     : Integer read  getRoteiro      write setRoteiro;
      property  Produto     : String  read  getProduto      write setProduto;
      property  Tipo        : String  read  getTipo         write setTipo;
      property  Edicao      : String  read  getEdicao       write setEdicao;
      property  Data        : TDate   read  getData         write setData;
      property  Nome        : String  read  getNome         write setNome;
      property  Cuidados    : String  read  getCuidados     write setCuidados;
      property  Endereco    : String  read  getEndereco     write setEndereco;
      property  Complemento : String  read  getComplemento  write setComplemento;
      property  Bairro      : String  read  getBairro       write setBairro;
      property  Referencia  : String  read  getReferencia   write setReferencia;
      property  Cidade      : String  read  getCicade       write setCidade;
      property  UF          : String  read  getUF           write setUF;
      property  CEP         : String  read  getCEP          write setCEP;
      property  Quantidade  : Integer read  getQuantidade   write setQuantidade;
      property  Barra       : String  read  getBarra        write setBarra;

      function  Validar()                       : Boolean;
      function  Insert()                        : Boolean;
      function  Update()                        : Boolean;
      function  Delete(filtro: String)          : Boolean;
      function  getObject(id, filtro: String)   : Boolean;
      function  getObjects()                    : Boolean;
      function  getField(campo, coluna: String) : String;
    end;

const
  TABLENAME = 'JOR_ASSINANTES';

implementation

uses
  System.SysUtils, Vcl.Dialogs, udm, uGlobais, clUtil;

{ TEtiquetasJornal }

constructor TEtiquetasJornal.Create;
begin
  _produtos :=  TProdutos.Create;
  _conexao  :=  TConexao.Create;
  _tipos    :=  TTipoAssinatura.Create;
end;

destructor TEtiquetasJornal.Destroy;
begin
  _produtos.Free;
  _conexao.Free;
  _tipos.Free;
end;

function TEtiquetasJornal.getBairro: String;
begin
  Result  :=  _bairro;
end;

function TEtiquetasJornal.getBarra: String;
begin
  Result  :=  _barra;
end;

function TEtiquetasJornal.getCEP: String;
begin
  Result  :=  _cep;
end;

function TEtiquetasJornal.getCicade: String;
begin
  Result  :=  _cidade;
end;

function TEtiquetasJornal.getCodigo: String;
begin
  Result  :=  _codigo;
end;

function TEtiquetasJornal.getComplemento: String;
begin
  Result  :=  _complemento;
end;

function TEtiquetasJornal.getCuidados: String;
begin
  Result  :=  _cuidados;
end;

function TEtiquetasJornal.getData: TDate;
begin
  Result  :=  _data;
end;

function TEtiquetasJornal.getEdicao: String;
begin
  Result  :=  _edicao;
end;

function TEtiquetasJornal.getEndereco: String;
begin
  Result  :=  _endereco;
end;

function TEtiquetasJornal.getId: Integer;
begin
  Result  :=  _id;
end;

function TEtiquetasJornal.getNome: String;
begin
  Result  :=  _nome;
end;

function TEtiquetasJornal.getProduto: String;
begin
  Result  :=  _produto;
end;

function TEtiquetasJornal.getQuantidade: Integer;
begin
  Result  :=  _qtde;
end;

function TEtiquetasJornal.getReferencia: String;
begin
  Result  :=  _referencia;
end;

function TEtiquetasJornal.getRoteiro: Integer;
begin
  Result  :=  _roteiro;
end;

function TEtiquetasJornal.getTipo: String;
begin
  Result  :=  _tipo;
end;

function TEtiquetasJornal.getUF: String;
begin
  Result  :=  _uf;
end;

function TEtiquetasJornal.Validar(): Boolean;
begin
  try
  Result  :=  False;
  if TUtil.Empty(Self.Codigo) then begin
    MessageDlg('Código do Assinante vazio!', mtWarning, [mbOK],0);
    Exit;
  end;
  if TUtil.Empty(Self.Produto) then begin
    MessageDlg('Código do Produto vazio!', mtWarning, [mbOK],0);
    Exit;
  end;
  if _produtos.getObject(Self.Produto,'CODIGO') then begin
    MessageDlg('Código do Produto Inexistente!', mtWarning, [mbOK],0);
    Exit;
  end;
  if TUtil.Empty(Self.Tipo) then begin
    MessageDlg('Tipo de Assinatura vazio!', mtWarning, [mbOK],0);
    Exit;
  end;
  if _tipos.getObject(Self.Tipo,'CODIGO') then begin
    MessageDlg('Tipo de Assinatura Inexistente!', mtWarning, [mbOK],0);
    Exit;
  end;
  if TUtil.Empty(Self.Edicao) then begin
    MessageDlg('Número de Edição vazio!', mtWarning, [mbOK],0);
    Exit;
  end;
  if Self.Data  = 0 then begin
    MessageDlg('Data de Edição inválida!', mtWarning, [mbOK],0);
    Exit;
  end;
  if TUtil.Empty(Self.Nome) then begin
    MessageDlg('Nome de Assinante vazio!', mtWarning, [mbOK],0);
    Exit;
  end;
  if TUtil.Empty(Self.Endereco) then begin
    MessageDlg('Endereço do Assinature vazio!', mtWarning, [mbOK],0);
    Exit;
  end;
  if TUtil.Empty(Self.Bairro) then begin
    MessageDlg('Bairro do Endereço do Assinante vazio!', mtWarning, [mbOK],0);
    Exit;
  end;
  if TUtil.Empty(Self.Cidade) then begin
    MessageDlg('Cidade do Endereço do Assinante vazia!', mtWarning, [mbOK],0);
    Exit;
  end;
  if TUtil.Empty(Self.CEP) then begin
    MessageDlg('CEP do Endereço do Assinante vazio!', mtWarning, [mbOK],0);
    Exit;
  end;
  Result  :=  True;
  Except on E : Exception do begin
      ShowMessage('Classe: '+ e.ClassName + chr(13) + 'Mensagem: '+ e.Message);
  end;
  end;
end;

function TEtiquetasJornal.Insert(): Boolean;
begin
  try
    Result  :=  False;
    if (not _conexao.VerifyConnZEOS(1)) then begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados (' + Self.ClassName +') !', mtError, [mbCancel],0);
    end;
    dm.qryCRUD.Close;
    dm.qryCRUD.SQL.Clear;
    dm.qryCRUD.SQL.Text :=  'INSERT INTO ' + TABLENAME +
                            '(COD_ASSINANTE, ' +
                            'COD_PRODUTO, ' +
                            'COD_TIPO_ASSINATURA, ' +
                            'NUM_EDICAO, ' +
                            'DAT_EDICAO, ' +
                            'NOM_ASSINANTE, ' +
                            'NOM_CUIDADOS, ' +
                            'DES_ENDERECO, ' +
                            'DES_COMPLEMENTO, ' +
                            'DES_BAIRRO, ' +
                            'DES_REFERENCIA, ' +
                            'DES_CIDADE, ' +
                            'DES_UF, ' +
                            'CEP_ENDERECO, ' +
                            'NUM_ROTEIRO, ' +
                            'QTD_EXEMPLARES, ' +
                            'COD_BARRA) ' +
                            'VALUES (' +
                            ':CODIGO, ' +
                            ':PRODUTO, ' +
                            ':TIPO, ' +
                            ':EDICAO, ' +
                            ':DATA, ' +
                            ':NOME, ' +
                            ':CUIDADOS, ' +
                            ':ENDERECO, ' +
                            ':COMPLEMENTO, ' +
                            ':BAIRRO, ' +
                            ':REFERENCIA, ' +
                            ':CIDADE, ' +
                            ':UF, ' +
                            ':CEP, ' +
                            ':ROTEIRO, ' +
                            ':QTDE, ' +
                            ':BARRA);';
    dm.qryCRUD.ParamByName('CODIGO').AsString       :=  Self.Codigo;
    dm.qryCRUD.ParamByName('PRODUTO').AsString      :=  Self.Produto;
    dm.qryCRUD.ParamByName('TIPO').AsString         :=  Self.Tipo;
    dm.qryCRUD.ParamByName('EDICAO').AsString       :=  Self.Edicao;
    dm.qryCRUD.ParamByName('DATA').AsDate           :=  Self.Data;
    dm.qryCRUD.ParamByName('NOME').AsString         :=  Self.Nome;
    dm.qryCRUD.ParamByName('CUIDADOS').AsString     :=  Self.Cuidados;
    dm.qryCRUD.ParamByName('ENDERECO').AsString     :=  Self.Endereco;
    dm.qryCRUD.ParamByName('COMPLEMENTO').AsString  :=  Self.Complemento;
    dm.qryCRUD.ParamByName('BAIRRO').AsString       :=  Self.Bairro;
    dm.qryCRUD.ParamByName('REFERENCIA').AsString   :=  Self.Referencia;
    dm.qryCRUD.ParamByName('CIDADE').AsString       :=  Self.Cidade;
    dm.qryCRUD.ParamByName('UF').AsString           :=  Self.UF;
    dm.qryCRUD.ParamByName('CEP').AsString          :=  Self.CEP;
    dm.qryCRUD.ParamByName('ROTEIRO').AsInteger     :=  Self.Roteiro;
    dm.qryCRUD.ParamByName('QTDE').AsInteger        :=  Self.Quantidade;
    dm.qryCRUD.ParamByName('BARRA').AsString        :=  Self.Barra;
    dm.ZConn.PingServer;
    dm.qryCRUD.ExecSQL;
    dm.qryCRUD.Close;
    dm.qryCRUD.SQL.Clear;
    Result  :=  True;
  Except on E : Exception do begin
      ShowMessage('Classe: '+ e.ClassName + chr(13) + 'Mensagem: '+ e.Message);
  end;
  end;
end;

function TEtiquetasJornal.Update(): Boolean;
begin
  try
    Result  :=  False;
    if (not _conexao.VerifyConnZEOS(1)) then begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados (' + Self.ClassName +') !', mtError, [mbCancel],0);
    end;
    dm.qryCRUD.Close;
    dm.qryCRUD.SQL.Clear;
    dm.qryCRUD.SQL.Text :=  'UPDATE ' + TABLENAME + ' SET ' +
                            'COD_ASSINANTE = :CODIGO, ' +
                            'COD_PRODUTO = :PRODUTO, ' +
                            'COD_TIPO_ASSINATURA = :TIPO, ' +
                            'NUM_EDICAO = :EDICAO, ' +
                            'DAT_EDICAO = :DATA, ' +
                            'NOM_ASSINANTE = :NOME, ' +
                            'NOM_CUIDADOS = :CUIDADOS, ' +
                            'DES_ENDERECO = :ENDERECO, ' +
                            'DES_COMPLEMENTO = :COMPLEMENTO, ' +
                            'DES_BAIRRO = :BAIRRO, ' +
                            'DES_REFERENCIA = :REFERENCIA, ' +
                            'DES_CIDADE = :CIDADE, ' +
                            'DES_UF = :UF, ' +
                            'CEP_ENDERECO = :CEP, ' +
                            'NUM_ROTEIRO = :ROTEIRO, ' +
                            'QTD_EXEMPLARES = :QTDE, ' +
                            'COD_BARRA = :BARRA ' +
                            'WHERE ID_ASSINANTE = :ID;';
    dm.qryCRUD.ParamByName('ID').AsInteger          :=  Self.Id;
    dm.qryCRUD.ParamByName('CODIGO').AsString       :=  Self.Codigo;
    dm.qryCRUD.ParamByName('PRODUTO').AsString      :=  Self.Produto;
    dm.qryCRUD.ParamByName('TIPO').AsString         :=  Self.Tipo;
    dm.qryCRUD.ParamByName('EDICAO').AsString       :=  Self.Edicao;
    dm.qryCRUD.ParamByName('DATA').AsDate           :=  Self.Data;
    dm.qryCRUD.ParamByName('NOME').AsString         :=  Self.Nome;
    dm.qryCRUD.ParamByName('CUIDADOS').AsString     :=  Self.Cuidados;
    dm.qryCRUD.ParamByName('ENDERECO').AsString     :=  Self.Endereco;
    dm.qryCRUD.ParamByName('COMPLEMENTO').AsString  :=  Self.Complemento;
    dm.qryCRUD.ParamByName('BAIRRO').AsString       :=  Self.Bairro;
    dm.qryCRUD.ParamByName('REFERENCIA').AsString   :=  Self.Referencia;
    dm.qryCRUD.ParamByName('CIDADE').AsString       :=  Self.Cidade;
    dm.qryCRUD.ParamByName('UF').AsString           :=  Self.UF;
    dm.qryCRUD.ParamByName('CEP').AsString          :=  Self.CEP;
    dm.qryCRUD.ParamByName('ROTEIRO').AsInteger     :=  Self.Roteiro;
    dm.qryCRUD.ParamByName('QTDE').AsInteger        :=  Self.Quantidade;
    dm.qryCRUD.ParamByName('BARRA').AsString        :=  Self.Barra;
    dm.ZConn.PingServer;
    dm.qryCRUD.ExecSQL;
    dm.qryCRUD.Close;
    dm.qryCRUD.SQL.Clear;
    Result  :=  True;
  Except on E : Exception do begin
      ShowMessage('Classe: '+ e.ClassName + chr(13) + 'Mensagem: '+ e.Message);
  end;
  end;
end;

function TEtiquetasJornal.Delete(filtro: string): Boolean;
begin
  try
    Result := False;
    if (not _conexao.VerifyConnZEOS(1)) then begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados (' + Self.ClassName +') !', mtError, [mbCancel],0);
    end;
    dm.QryCRUD.Close;
    dm.QryCRUD.SQL.Clear;
    dm.QryCRUD.SQL.Add('DELETE FROM '+ TABLENAME);
    if Filtro = 'CODIGO' then begin
      dm.QryCRUD.SQL.Add('WHERE COD_ASSINANTE = :CODIGO');
      dm.QryCRUD.ParamByName('CODIGO').AsString := Self.Codigo;
    end
    else if Filtro = 'ID' then begin
      dm.QryCRUD.SQL.Add('WHERE ID_ASSINANTE = :ID');
      dm.QryCRUD.ParamByName('ID').AsInteger := Self.Id;
    end
    else if Filtro = 'ROTEIRO' then begin
      dm.QryCRUD.SQL.Add('WHERE NUM_ROTEIRO = :ROTEIRO');
      dm.QryCRUD.ParamByName('ID').AsInteger := Self.Roteiro;
    end
    else if Filtro = 'PRODUTO' then begin
      dm.QryCRUD.SQL.Add('WHERE COD_PRODUTO = :PRODUTO');
      dm.QryCRUD.ParamByName('PRODUTO').AsString := Self.Produto;
    end
    else if Filtro = 'TIPO' then begin
      dm.QryCRUD.SQL.Add('WHERE COD_TIPO_ASSINATURA = :TIPO');
      dm.QryCRUD.ParamByName('TIPO').AsString := Self.Tipo;
    end;
    dm.ZConn.PingServer;
    dm.QryCRUD.ExecSQL;
    dm.QryCRUD.Close;
    dm.QryCRUD.SQL.Clear;
    Result := True;
  Except on E : Exception do begin
      ShowMessage('Classe: '+ e.ClassName + chr(13) + 'Mensagem: '+ e.Message);
  end;
  end;
end;

function TEtiquetasJornal.getObject(id: string; filtro: string): Boolean;
begin
  Try
    Result := False;
    if TUtil.Empty(Id) then begin
      Exit;
    end;
    if (not _conexao.VerifyConnZEOS(1)) then begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados (' + Self.ClassName +') !', mtError, [mbCancel],0);
    end;
    dm.QryGetObject.Close;
    dm.QryGetObject.SQL.Clear;
    dm.QryGetObject.SQL.Add('SELECT * FROM '+ TABLENAME);

    if filtro = 'CODIGO' then begin
      dm.QryGetObject.SQL.Add(' WHERE COD_ASSINANTE = :CODIGO');
      dm.QryGetObject.ParamByName('CODIGO').AsString := id;
    end
    else if filtro = 'NOME' then begin
      dm.QryGetObject.SQL.Add(' WHERE NOM_ASSINANTE = :NOME');
      dm.QryGetObject.ParamByName('NOME').AsString := Id;
    end
    else if filtro = 'ID' then begin
      dm.QryGetObject.SQL.Add(' WHERE ID_ASSINANTE =  :ID');
      dm.QryGetObject.ParamByName('ID').AsInteger := StrToInt(Id);
    end
    else if filtro = 'EDICAO' then begin
      dm.QryGetObject.SQL.Add(' WHERE NUM_EDICAO =  :EDICAO');
      dm.QryGetObject.ParamByName('EDICAO').AsString := Id;
    end
    else if filtro = 'DATA' then begin
      dm.QryGetObject.SQL.Add(' WHERE DAT_EDICAO =  :DATA');
      dm.QryGetObject.ParamByName('DATA').AsDate := StrToDate(Id);
    end
    else if filtro = 'ROTEIRO' then begin
      dm.QryGetObject.SQL.Add(' WHERE NUM_ROTEIRO =  :ROTEIRO');
      dm.QryGetObject.ParamByName('ROTEIRO').AsInteger := StrToInt(Id);
    end
    else if filtro = 'PRODUTO' then begin
      dm.QryGetObject.SQL.Add(' WHERE COD_BARRA =  :BARRA');
      dm.QryGetObject.ParamByName('BARRA').AsString := Id;
    end
    else if filtro = 'PRODUTO' then begin
      dm.QryGetObject.SQL.Add(' WHERE COD_PRODUTO =  :PRODUTO');
      dm.QryGetObject.ParamByName('PRODUTO').AsString := Id;
    end
    else if filtro = 'TIPO' then begin
      dm.QryGetObject.SQL.Add(' WHERE COD_TIPO_ASSINATURA =  :TIPO');
      dm.QryGetObject.ParamByName('TIPO').AsString := Id;
    end
    else if filtro = 'CHAVE1' then begin
      dm.QryGetObject.SQL.Add(' WHERE COD_ASSINANTE = :CODIGO AND COD_PRODUTO = :PRODUTO AND COD_TIPO_ASSINATURA = :TIPO');
      dm.QryGetObject.ParamByName('CODIGO').AsString := id;
      dm.QryGetObject.ParamByName('PRODUTO').AsString := Self.Produto;
      dm.QryGetObject.ParamByName('TIPO').AsString := Self.Tipo;
    end
    else if filtro = 'CHAVE' then begin
      dm.QryGetObject.SQL.Add(' WHERE COD_ASSINANTE = :CODIGO AND COD_PRODUTO = :PRODUTO AND COD_TIPO_ASSINATURA = :TIPO AND ' +
                              'NUM_EDICAO = :EDICAO');
      dm.QryGetObject.ParamByName('CODIGO').AsString := id;
      dm.QryGetObject.ParamByName('PRODUTO').AsString := Self.Produto;
      dm.QryGetObject.ParamByName('TIPO').AsString := Self.Tipo;
      dm.QryGetObject.ParamByName('EDICAO').AsString := Self.Edicao;
    end
    else if Filtro = 'FILTRO' then begin
      dm.QryGetObject.SQL.Add('WHERE ' + id);
    end;
    dm.ZConn.PingServer;
    dm.QryGetObject.Open;
    if (not dm.QryGetObject.IsEmpty) then begin
      dm.QryGetObject.First;
      Self.Id           :=  dm.QryGetObject.FieldByName('ID_ASSINANTE').AsInteger;
      Self.Codigo       :=  dm.QryGetObject.FieldByName('COD_ASSINANTE').AsString;
      Self.Produto      :=  dm.QryGetObject.FieldByName('COD_PRODUTO').AsString;
      Self.Tipo         :=  dm.QryGetObject.FieldByName('COD_TIPO_ASSINATURA').AsString;
      Self.Edicao       :=  dm.QryGetObject.FieldByName('NUM_EDICAO').AsString;
      Self.Data         :=  dm.QryGetObject.FieldByName('DAT_EDICAO').AsDateTime;
      Self.Nome         :=  dm.QryGetObject.FieldByName('NOM_ASSINANTE').AsString;
      Self.Cuidados     :=  dm.QryGetObject.FieldByName('NOM_CUIDADOS').AsString;
      Self.Endereco     :=  dm.QryGetObject.FieldByName('DES_ENDERECO').AsString;
      Self.Complemento  :=  dm.QryGetObject.FieldByName('DES_COMPLEMENTO').AsString;
      Self.Bairro       :=  dm.QryGetObject.FieldByName('DES_BAIRRO').AsString;
      Self.Referencia   :=  dm.QryGetObject.FieldByName('DES_REFERENCIA').AsString;
      Self.Cidade       :=  dm.QryGetObject.FieldByName('DES_CIDADE').AsString;
      Self.UF           :=  dm.QryGetObject.FieldByName('DES_UF').AsString;
      Self.CEP          :=  dm.QryGetObject.FieldByName('CEP_ENDERECO').AsString;
      Self.Roteiro      :=  dm.QryGetObject.FieldByName('NUM_ROTEIRO').AsInteger;
      Self.Quantidade   :=  dm.QryGetObject.FieldByName('QTD_EXEMPLARES').AsInteger;
      Self.Barra        :=  dm.QryGetObject.FieldByName('COD_BARRA').AsString;
    end
    else begin
      dm.QryGetObject.Close;
      dm.QryGetObject.SQL.Clear;
      Exit;
    end;
    Result  :=  True;
  Except
    on E : Exception do
      ShowMessage('Classe: '+ e.ClassName + chr(13) + 'Mensagem: '+ e.Message);
  end;
end;

function TEtiquetasJornal.getObjects(): Boolean;
begin
  try
    Result := False;
    if (not _conexao.VerifyConnZEOS(1)) then begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados (' + Self.ClassName +') !', mtError, [mbCancel],0);
    end;
    dm.QryGetObject.Close;
    dm.QryGetObject.SQL.Clear;
    dm.QryGetObject.SQL.Add('SELECT * FROM '+ TABLENAME);
    dm.ZConn.PingServer;
    dm.QryGetObject.Open;
    if dm.QryGetObject.IsEmpty then begin
      Exit;
    end;
    dm.QryGetObject.First;
    Result := True;
  Except
    on E : Exception do
      ShowMessage('Classe: '+ e.ClassName + chr(13) + 'Mensagem: '+ e.Message);
  end;
end;

function TEtiquetasJornal.getField(campo, coluna: String): String;
begin
  Try
    Result := '';
    if (not _conexao.VerifyConnZEOS(1)) then begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados (' + Self.ClassName +') !', mtError, [mbCancel],0);
    end;
    dm.qryFields.Close;
    dm.qryFields.SQL.Clear;
    dm.qryFields.SQL.Text := 'SELECT '+ campo +' FROM '+ TABLENAME;
    if coluna = 'CODIGO' then begin
      dm.qryFields.SQL.Add(' WHERE COD_ASSINANTE = :CODIGO ');
      dm.qryFields.ParamByName('CODIGO').AsString := Self.Codigo;
    end
    else if coluna = 'NOME' then begin
      dm.qryFields.SQL.Add(' WHERE NOM_ASSINANTE = :NOME ');
      dm.qryFields.ParamByName('NOME').AsString := Self.Nome;
    end
    else if coluna = 'ID' then begin
      dm.qryFields.SQL.Add(' WHERE ID_ASSINANTE =  :ID ');
      dm.qryFields.ParamByName('ID').AsInteger := Self.Id;
    end;
    dm.ZConn.PingServer;
    dm.qryFields.Open;
    if dm.qryFields.IsEmpty then begin
      Exit;
    end;
    dm.qryFields.First;
    Result := dm.qryFields.FieldByName(campo).AsString;
    dm.qryFields.Close;
    dm.qryFields.SQL.Clear;
  Except
    on E : Exception do
      ShowMessage('Classe: '+ e.ClassName + chr(13) + 'Mensagem: '+ e.Message);
  end;
end;

procedure TEtiquetasJornal.setBairro(const Value: String);
begin
  _bairro       :=  Value;
end;

procedure TEtiquetasJornal.setBarra(const Value: String);
begin
  _barra        :=  Value;
end;

procedure TEtiquetasJornal.setCEP(const Value: String);
begin
  _cep          :=  Value;
end;

procedure TEtiquetasJornal.setCidade(const Value: String);
begin
  _cidade       :=  Value;
end;

procedure TEtiquetasJornal.setCodigo(const Value: String);
begin
  _codigo       :=  Value;
end;

procedure TEtiquetasJornal.setComplemento(const Value: String);
begin
  _complemento  :=  Value;
end;

procedure TEtiquetasJornal.setCuidados(const Value: String);
begin
  _cuidados     :=  Value;
end;

procedure TEtiquetasJornal.setData(const Value: TDate);
begin
  _data         :=  Value;
end;

procedure TEtiquetasJornal.setEdicao(const Value: String);
begin
  _edicao       :=  Value;
end;

procedure TEtiquetasJornal.setEndereco(const Value: String);
begin
  _endereco     :=  Value;
end;

procedure TEtiquetasJornal.setId(const Value: Integer);
begin
  _id           :=  Value;
end;

procedure TEtiquetasJornal.setNome(const Value: String);
begin
  _nome         :=  Value;
end;

procedure TEtiquetasJornal.setProduto(const Value: String);
begin
  _produto      :=  Value;
end;

procedure TEtiquetasJornal.setQuantidade(const Value: Integer);
begin
  _qtde         :=  Value;
end;

procedure TEtiquetasJornal.setReferencia(const Value: String);
begin
  _referencia   :=  Value;
end;

procedure TEtiquetasJornal.setRoteiro(const Value: Integer);
begin
  _roteiro      :=  Value;
end;

procedure TEtiquetasJornal.setTipo(const Value: String);
begin
  _tipo         :=  Value;
end;

procedure TEtiquetasJornal.setUF(const Value: String);
begin
  _uf           :=  Value;
end;

end.
