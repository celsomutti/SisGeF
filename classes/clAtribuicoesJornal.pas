unit clAtribuicoesJornal;

interface

uses clProdutos, clTipoAssinatura;

type
  TAtribuicoes = class(TObject)
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
    function getProtocolo: String;
    procedure setProtocolo(const Value: String);
    function getManutencao: TDateTime;
    function getUsuario: String;
    procedure setManutencao(const Value: TDateTime);
    procedure setUsuario(const Value: String);
    function getEntregador: Integer;
    procedure setEntregador(const Value: Integer);
  protected
    _id: Integer;
    _data: TDateTime;
    _produto: String;
    _edicao: String;
    _codigo: String;
    _tipo: String;
    _nome: String;
    _cuidados: String;
    _endereco: String;
    _complemento: String;
    _bairro: String;
    _referencia: String;
    _cidade: String;
    _uf: String;
    _cep: String;
    _qtde: Integer;
    _protocolo: String;
    _roteiro: Integer;
    _usuario: String;
    _barra: String;
    _entregador: Integer;
    _manutencao: TDateTime;
    _produtos: TProdutos;
    _tipos: TTipoAssinatura;
  public

    constructor Create;
    destructor Destroy;

    property Id: Integer read getId write setId;
    property Data: TDate read getData write setData;
    property Produto: String read getProduto write setProduto;
    property Codigo: String read getCodigo write setCodigo;
    property Roteiro: Integer read getRoteiro write setRoteiro;
    property Tipo: String read getTipo write setTipo;
    property Entregador: Integer read getEntregador write setEntregador;
    property Edicao: String read getEdicao write setEdicao;
    property Nome: String read getNome write setNome;
    property Cuidados: String read getCuidados write setCuidados;
    property Endereco: String read getEndereco write setEndereco;
    property Complemento: String read getComplemento write setComplemento;
    property Bairro: String read getBairro write setBairro;
    property Referencia: String read getReferencia write setReferencia;
    property Cidade: String read getCicade write setCidade;
    property UF: String read getUF write setUF;
    property CEP: String read getCEP write setCEP;
    property Quantidade: Integer read getQuantidade write setQuantidade;
    property Barra: String read getBarra write setBarra;
    property Protocolo: String read getProtocolo write setProtocolo;
    property Usuario: String read getUsuario write setUsuario;
    property Manutencao: TDateTime read getManutencao write setManutencao;

    function Validar(): Boolean;
    function Insert(): Boolean;
    function Update(): Boolean;
    function Delete(filtro: String): Boolean;
    function getObject(Id, filtro: String): Boolean;
    function getObjects(): Boolean;
    function getField(campo, coluna: String): String;
  end;

const
  TABLENAME = 'jor_atribuicoes';

implementation

uses
  System.SysUtils, Vcl.Dialogs, udm, uGlobais, clUtil;

{ TAssinantes }

constructor TAtribuicoes.Create;
begin
  _produtos := TProdutos.Create;
  _tipos := TTipoAssinatura.Create;
end;

destructor TAtribuicoes.Destroy;
begin
  _produtos.Free;
  _tipos.Free;
end;

function TAtribuicoes.getBairro: String;
begin
  Result := _bairro;
end;

function TAtribuicoes.getBarra: String;
begin
  Result := _barra;
end;

function TAtribuicoes.getCEP: String;
begin
  Result := _cep;
end;

function TAtribuicoes.getCicade: String;
begin
  Result := _cidade;
end;

function TAtribuicoes.getCodigo: String;
begin
  Result := _codigo;
end;

function TAtribuicoes.getComplemento: String;
begin
  Result := _complemento;
end;

function TAtribuicoes.getCuidados: String;
begin
  Result := _cuidados;
end;

function TAtribuicoes.getData: TDate;
begin
  Result := _data;
end;

function TAtribuicoes.getEdicao: String;
begin
  Result := _edicao;
end;

function TAtribuicoes.getEndereco: String;
begin
  Result := _endereco;
end;

function TAtribuicoes.getEntregador: Integer;
begin
  Result := _entregador;
end;

function TAtribuicoes.getId: Integer;
begin
  Result := _id;
end;

function TAtribuicoes.getManutencao: TDateTime;
begin
  Result := _manutencao;
end;

function TAtribuicoes.getNome: String;
begin
  Result := _nome;
end;

function TAtribuicoes.getProduto: String;
begin
  Result := _produto;
end;

function TAtribuicoes.getProtocolo: String;
begin
  Result := _protocolo;
end;

function TAtribuicoes.getQuantidade: Integer;
begin
  Result := _qtde;
end;

function TAtribuicoes.getReferencia: String;
begin
  Result := _referencia;
end;

function TAtribuicoes.getRoteiro: Integer;
begin
  Result := _roteiro;
end;

function TAtribuicoes.getTipo: String;
begin
  Result := _tipo;
end;

function TAtribuicoes.getUF: String;
begin
  Result := _uf;
end;

function TAtribuicoes.getUsuario: String;
begin
  Result := _usuario;
end;

function TAtribuicoes.Validar(): Boolean;
begin
  try
    Result := False;
    if TUtil.Empty(Self.Codigo) then
    begin
      MessageDlg('Código do Assinante vazio!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if TUtil.Empty(Self.Produto) then
    begin
      MessageDlg('Código do Produto vazio!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if _produtos.getObject(Self.Produto, 'CODIGO') then
    begin
      MessageDlg('Código do Produto Inexistente!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if TUtil.Empty(Self.Tipo) then
    begin
      MessageDlg('Tipo de Assinatura vazio!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if _tipos.getObject(Self.Tipo, 'CODIGO') then
    begin
      MessageDlg('Tipo de Assinatura Inexistente!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if TUtil.Empty(Self.Edicao) then
    begin
      MessageDlg('Número de Edição vazio!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if Self.Data = 0 then
    begin
      MessageDlg('Data de Edição inválida!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if TUtil.Empty(Self.Nome) then
    begin
      MessageDlg('Nome de Assinante vazio!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if TUtil.Empty(Self.Endereco) then
    begin
      MessageDlg('Endereço do Assinature vazio!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if TUtil.Empty(Self.Bairro) then
    begin
      MessageDlg('Bairro do Endereço do Assinante vazio!', mtWarning,
        [mbOK], 0);
      Exit;
    end;
    if TUtil.Empty(Self.Cidade) then
    begin
      MessageDlg('Cidade do Endereço do Assinante vazia!', mtWarning,
        [mbOK], 0);
      Exit;
    end;
    if TUtil.Empty(Self.CEP) then
    begin
      MessageDlg('CEP do Endereço do Assinante vazio!', mtWarning, [mbOK], 0);
      Exit;
    end;
    Result := True;
  Except
    on E: Exception do
    begin
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

function TAtribuicoes.Insert(): Boolean;
begin
  try
    Result := False;
    dm.qryCRUD1.Close;
    dm.qryCRUD1.SQL.Clear;
    dm.qryCRUD1.SQL.Text := 'INSERT INTO ' + TABLENAME + '(ID_ASSINANTE, ' +
      'COD_ASSINANTE, ' + 'COD_PRODUTO, ' + 'COD_TIPO_ASSINATURA, ' +
      'COD_ENTREGADOR, ' + 'NUM_EDICAO, ' + 'DAT_ATRIBUICAO, ' +
      'NOM_ASSINANTE, ' + 'NOM_CUIDADOS, ' + 'DES_ENDERECO, ' +
      'DES_COMPLEMENTO, ' + 'DES_BAIRRO, ' + 'DES_REFERENCIA, ' + 'DES_CIDADE, '
      + 'DES_UF, ' + 'CEP_ENDERECO, ' + 'NUM_ROTEIRO, ' + 'QTD_EXEMPLARES, ' +
      'COD_BARRA, ' +
    { 'DOM_PROTOCOLO, ' + }
      'NOM_USUARIO, ' + 'DAT_MANUTENCAO) ' + 'VALUES (' + ':ID, ' + ':CODIGO, '
      + ':PRODUTO, ' + ':TIPO, ' + ':ENTREGADOR, ' + ':EDICAO, ' + ':DATA, ' +
      ':NOME, ' + ':CUIDADOS, ' + ':ENDERECO, ' + ':COMPLEMENTO, ' + ':BAIRRO, '
      + ':REFERENCIA, ' + ':CIDADE, ' + ':UF, ' + ':CEP, ' + ':ROTEIRO, ' +
      ':QTDE, ' + ':BARRA, ' +
    { ':PROTOCOLO, ' + }
      ':USUARIO, ' + ':MANUTENCAO);';
    dm.qryCRUD1.ParamByName('ID').AsInteger := Self.Id;
    dm.qryCRUD1.ParamByName('CODIGO').AsString := Self.Codigo;
    dm.qryCRUD1.ParamByName('PRODUTO').AsString := Self.Produto;
    dm.qryCRUD1.ParamByName('TIPO').AsString := Self.Tipo;
    dm.qryCRUD1.ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
    dm.qryCRUD1.ParamByName('EDICAO').AsString := Self.Edicao;
    dm.qryCRUD1.ParamByName('DATA').AsDate := Self.Data;
    dm.qryCRUD1.ParamByName('NOME').AsString := Self.Nome;
    dm.qryCRUD1.ParamByName('CUIDADOS').AsString := Self.Cuidados;
    dm.qryCRUD1.ParamByName('ENDERECO').AsString := Self.Endereco;
    dm.qryCRUD1.ParamByName('COMPLEMENTO').AsString := Self.Complemento;
    dm.qryCRUD1.ParamByName('BAIRRO').AsString := Self.Bairro;
    dm.qryCRUD1.ParamByName('REFERENCIA').AsString := Self.Referencia;
    dm.qryCRUD1.ParamByName('CIDADE').AsString := Self.Cidade;
    dm.qryCRUD1.ParamByName('UF').AsString := Self.UF;
    dm.qryCRUD1.ParamByName('CEP').AsString := Self.CEP;
    dm.qryCRUD1.ParamByName('ROTEIRO').AsInteger := Self.Roteiro;
    dm.qryCRUD1.ParamByName('QTDE').AsInteger := Self.Quantidade;
    dm.qryCRUD1.ParamByName('BARRA').AsString := Self.Barra;
    // dm.qryCRUD1.ParamByName('PROTOCOLO').AsString    :=  Self.Protocolo;
    dm.qryCRUD1.ParamByName('USUARIO').AsString := Self.Usuario;
    dm.qryCRUD1.ParamByName('MANUTENCAO').AsDateTime := Self.Manutencao;
    dm.ZConn1.PingServer;
    dm.qryCRUD1.ExecSQL;
    dm.qryCRUD1.Close;
    dm.qryCRUD1.SQL.Clear;
    Result := True;
  Except
    on E: Exception do
    begin
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

function TAtribuicoes.Update(): Boolean;
begin
  try
    Result := False;
    dm.qryCRUD1.Close;
    dm.qryCRUD1.SQL.Clear;
    dm.qryCRUD1.SQL.Text := 'UPDATE ' + TABLENAME + ' SET ' +
      'COD_ASSINANTE = :CODIGO, ' + 'COD_PRODUTO = :PRODUTO, ' +
      'COD_TIPO_ASSINATURA = :TIPO, ' + 'COD_ENTREGADOR = :ENTREGADOR, ' +
      'NUM_EDICAO = :EDICAO, ' + 'DAT_ATRIBUICAO = :DATA, ' +
      'NOM_ASSINANTE = :NOME, ' + 'NOM_CUIDADOS = :CUIDADOS, ' +
      'DES_ENDERECO = :ENDERECO, ' + 'DES_COMPLEMENTO = :COMPLEMENTO, ' +
      'DES_BAIRRO = :BAIRRO, ' + 'DES_REFERENCIA = :REFERENCIA, ' +
      'DES_CIDADE = :CIDADE, ' + 'DES_UF = :UF, ' + 'CEP_ENDERECO = :CEP, ' +
      'NUM_ROTEIRO = :ROTEIRO, ' + 'QTD_EXEMPLARES = :QTDE, ' +
      'COD_BARRA = :BARRA, ' +
    { 'DOM_PROTOCOLO = :PROTOCOLO, ' + }
      'NOM_USUARIO = :USUARIO, ' + 'DAT_MANUTENCAO = :MANUTENCAO ' +
      'WHERE ID_ASSINANTE = :ID;';
    dm.qryCRUD1.ParamByName('ID').AsInteger := Self.Id;
    dm.qryCRUD1.ParamByName('CODIGO').AsString := Self.Codigo;
    dm.qryCRUD1.ParamByName('PRODUTO').AsString := Self.Produto;
    dm.qryCRUD1.ParamByName('TIPO').AsString := Self.Tipo;
    dm.qryCRUD1.ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
    dm.qryCRUD1.ParamByName('EDICAO').AsString := Self.Edicao;
    dm.qryCRUD1.ParamByName('DATA').AsDate := Self.Data;
    dm.qryCRUD1.ParamByName('NOME').AsString := Self.Nome;
    dm.qryCRUD1.ParamByName('CUIDADOS').AsString := Self.Cuidados;
    dm.qryCRUD1.ParamByName('ENDERECO').AsString := Self.Endereco;
    dm.qryCRUD1.ParamByName('COMPLEMENTO').AsString := Self.Complemento;
    dm.qryCRUD1.ParamByName('BAIRRO').AsString := Self.Bairro;
    dm.qryCRUD1.ParamByName('REFERENCIA').AsString := Self.Referencia;
    dm.qryCRUD1.ParamByName('CIDADE').AsString := Self.Cidade;
    dm.qryCRUD1.ParamByName('UF').AsString := Self.UF;
    dm.qryCRUD1.ParamByName('CEP').AsString := Self.CEP;
    dm.qryCRUD1.ParamByName('ROTEIRO').AsInteger := Self.Roteiro;
    dm.qryCRUD1.ParamByName('QTDE').AsInteger := Self.Quantidade;
    dm.qryCRUD1.ParamByName('BARRA').AsString := Self.Barra;
    // dm.qryCRUD1.ParamByName('PROTOCOLO').AsString    :=  Self.Protocolo;
    dm.qryCRUD1.ParamByName('USUARIO').AsString := Self.Usuario;
    dm.qryCRUD1.ParamByName('MANUTENCAO').AsDateTime := Self.Manutencao;
    dm.ZConn1.PingServer;
    dm.qryCRUD1.ExecSQL;
    dm.qryCRUD1.Close;
    dm.qryCRUD1.SQL.Clear;
    Result := True;
  Except
    on E: Exception do
    begin
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

function TAtribuicoes.Delete(filtro: string): Boolean;
begin
  try
    Result := False;
    dm.qryCRUD1.Close;
    dm.qryCRUD1.SQL.Clear;
    dm.qryCRUD1.SQL.Add('DELETE FROM ' + TABLENAME);
    if filtro = 'CODIGO' then
    begin
      dm.qryCRUD1.SQL.Add('WHERE COD_ASSINANTE = :CODIGO');
      dm.qryCRUD1.ParamByName('CODIGO').AsString := Self.Codigo;
    end
    else if filtro = 'ID' then
    begin
      dm.qryCRUD1.SQL.Add('WHERE ID_ASSINANTE = :ID');
      dm.qryCRUD1.ParamByName('ID').AsInteger := Self.Id;
    end
    else if filtro = 'ROTEIRO' then
    begin
      dm.qryCRUD1.SQL.Add('WHERE NUM_ROTEIRO = :ROTEIRO');
      dm.qryCRUD1.ParamByName('ID').AsInteger := Self.Roteiro;
    end
    else if filtro = 'PRODUTO' then
    begin
      dm.qryCRUD1.SQL.Add('WHERE COD_PRODUTO = :PRODUTO');
      dm.qryCRUD1.ParamByName('PRODUTO').AsString := Self.Produto;
    end
    else if filtro = 'TIPO' then
    begin
      dm.qryCRUD1.SQL.Add('WHERE COD_TIPO_ASSINATURA = :TIPO');
      dm.qryCRUD1.ParamByName('TIPO').AsString := Self.Tipo;
    end;
    dm.ZConn1.PingServer;
    dm.qryCRUD1.ExecSQL;
    dm.qryCRUD1.Close;
    dm.qryCRUD1.SQL.Clear;
    Result := True;
  Except
    on E: Exception do
    begin
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

function TAtribuicoes.getObject(Id: string; filtro: string): Boolean;
begin
  Try
    Result := False;
    if TUtil.Empty(Id) then
    begin
      Exit;
    end;
    dm.qrygetObject1.Close;
    dm.qrygetObject1.SQL.Clear;
    dm.qrygetObject1.SQL.Add('SELECT * FROM ' + TABLENAME);

    if filtro = 'CODIGO' then
    begin
      dm.qrygetObject1.SQL.Add(' WHERE COD_ASSINANTE = :CODIGO');
      dm.qrygetObject1.ParamByName('CODIGO').AsString := Id;
    end
    else if filtro = 'NOME' then
    begin
      dm.qrygetObject1.SQL.Add(' WHERE NOM_ASSINANTE = :NOME');
      dm.qrygetObject1.ParamByName('NOME').AsString := Id;
    end
    else if filtro = 'ID' then
    begin
      dm.qrygetObject1.SQL.Add(' WHERE ID_ASSINANTE =  :ID');
      dm.qrygetObject1.ParamByName('ID').AsInteger := StrToInt(Id);
    end
    else if filtro = 'EDICAO' then
    begin
      dm.qrygetObject1.SQL.Add(' WHERE NUM_EDICAO =  :EDICAO');
      dm.qrygetObject1.ParamByName('EDICAO').AsString := Id;
    end
    else if filtro = 'DATA' then
    begin
      dm.qrygetObject1.SQL.Add(' WHERE DAT_ATRIBUICAO =  :DATA');
      dm.qrygetObject1.ParamByName('DATA').AsDate := StrToDate(Id);
    end
    else if filtro = 'ROTEIRO' then
    begin
      dm.qrygetObject1.SQL.Add(' WHERE NUM_ROTEIRO =  :ROTEIRO');
      dm.qrygetObject1.ParamByName('ROTEIRO').AsInteger := StrToInt(Id);
    end
    else if filtro = 'BARRA' then
    begin
      dm.qrygetObject1.SQL.Add(' WHERE COD_BARRA =  :BARRA');
      dm.qrygetObject1.ParamByName('BARRA').AsString := Id;
    end
    else if filtro = 'PROTOCOLO' then
    begin
      dm.qrygetObject1.SQL.Add(' WHERE DOM_PROTOCOLO =  :PROTOCOLO');
      dm.qrygetObject1.ParamByName('PROTOCOLO').AsString := Id;
    end
    else if filtro = 'PRODUTO' then
    begin
      dm.qrygetObject1.SQL.Add(' WHERE COD_PRODUTO =  :PRODUTO');
      dm.qrygetObject1.ParamByName('PRODUTO').AsString := Id;
    end
    else if filtro = 'TIPO' then
    begin
      dm.qrygetObject1.SQL.Add(' WHERE COD_TIPO_ASSINATURA =  :TIPO');
      dm.qrygetObject1.ParamByName('TIPO').AsString := Id;
    end
    else if filtro = 'CHAVE2' then
    begin
      dm.qrygetObject1.SQL.Add
        (' WHERE COD_ENTREGADOR = :ENTREGADOR AND DAT_ATRIBUICAO = :DATA');
      dm.qrygetObject1.ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
      dm.qrygetObject1.ParamByName('DATA').AsDate := Self.Data;
    end
    else if filtro = 'CHAVE1' then
    begin
      dm.qrygetObject1.SQL.Add
        (' WHERE COD_ASSINANTE = :CODIGO AND COD_PRODUTO = :PRODUTO AND COD_TIPO_ASSINATURA = :TIPO');
      dm.qrygetObject1.ParamByName('CODIGO').AsString := Id;
      dm.qrygetObject1.ParamByName('PRODUTO').AsString := Self.Produto;
      dm.qrygetObject1.ParamByName('TIPO').AsString := Self.Tipo;
    end
    else if filtro = 'CHAVE0' then
    begin
      dm.qrygetObject1.SQL.Add
        (' WHERE ID_ASSINANTE = :ID AND DAT_ATRIBUICAO = :DATA');
      dm.qrygetObject1.ParamByName('ID').AsInteger := Self.Id;
      dm.qrygetObject1.ParamByName('DATA').AsDate := Self.Data;
    end
    else if filtro = 'CHAVE' then
    begin
      dm.qrygetObject1.SQL.Add
        (' WHERE COD_ASSINANTE = :CODIGO AND COD_PRODUTO = :PRODUTO AND COD_TIPO_ASSINATURA = :TIPO AND '
        + 'NUM_EDICAO = :EDICAO');
      dm.qrygetObject1.ParamByName('CODIGO').AsString := Id;
      dm.qrygetObject1.ParamByName('PRODUTO').AsString := Self.Produto;
      dm.qrygetObject1.ParamByName('TIPO').AsString := Self.Tipo;
      dm.qrygetObject1.ParamByName('EDICAO').AsString := Self.Edicao;
    end
    else if filtro = 'FILTRO' then
    begin
      dm.qrygetObject1.SQL.Add('WHERE ' + Id);
    end
    else if filtro = 'FILTRO1' then
    begin
      dm.qrygetObject1.SQL.Clear;
      dm.qrygetObject1.SQL.Text := 'SELECT DISTINCT ' + Id + ' FROM ' +
        TABLENAME + ' ORDER BY ' + Id;
    end
    else if filtro = 'FILTRO2' then
    begin
      dm.qrygetObject1.SQL.Clear;
      dm.qrygetObject1.SQL.Text := 'SELECT DISTINCT ' + Id + ' FROM ' +
        TABLENAME + ' ORDER BY ' + Id + ' DESC';
    end
    else if filtro = 'FILTRO3' then
    begin
      dm.qrygetObject1.SQL.Clear;
      dm.qrygetObject1.SQL.Text := 'SELECT DISTINCT ' + Id;
    end;
    dm.ZConn1.PingServer;
    dm.qrygetObject1.Open;
    if (not dm.qrygetObject1.IsEmpty) then
    begin
      if filtro = 'CHAVE' then
      begin
        dm.qrygetObject1.Last;
      end
      else
      begin
        dm.qrygetObject1.First;
      end;
      if (filtro <> 'FILTRO1') AND (filtro <> 'FILTRO2') AND
        (filtro <> 'FILTRO3') then
      begin
        Self.Id := dm.qrygetObject1.FieldByName('ID_ASSINANTE').AsInteger;
        Self.Codigo := dm.qrygetObject1.FieldByName('COD_ASSINANTE').AsString;
        Self.Produto := dm.qrygetObject1.FieldByName('COD_PRODUTO').AsString;
        Self.Tipo := dm.qrygetObject1.FieldByName('COD_TIPO_ASSINATURA').AsString;
        Self.Edicao := dm.qrygetObject1.FieldByName('NUM_EDICAO').AsString;
        Self.Data := dm.qrygetObject1.FieldByName('DAT_ATRIBUICAO').AsDateTime;
        Self.Nome := dm.qrygetObject1.FieldByName('NOM_ASSINANTE').AsString;
        Self.Cuidados := dm.qrygetObject1.FieldByName('NOM_CUIDADOS').AsString;
        Self.Endereco := dm.qrygetObject1.FieldByName('DES_ENDERECO').AsString;
        Self.Complemento := dm.qrygetObject1.FieldByName('DES_COMPLEMENTO').AsString;
        Self.Bairro := dm.qrygetObject1.FieldByName('DES_BAIRRO').AsString;
        Self.Referencia := dm.qrygetObject1.FieldByName('DES_REFERENCIA').AsString;
        Self.Cidade := dm.qrygetObject1.FieldByName('DES_CIDADE').AsString;
        Self.UF := dm.qrygetObject1.FieldByName('DES_UF').AsString;
        Self.CEP := dm.qrygetObject1.FieldByName('CEP_ENDERECO').AsString;
        Self.Roteiro := dm.qrygetObject1.FieldByName('NUM_ROTEIRO').AsInteger;
        Self.Quantidade := dm.qrygetObject1.FieldByName('QTD_EXEMPLARES').AsInteger;
        Self.Barra := dm.qrygetObject1.FieldByName('COD_BARRA').AsString;
        //Self.Protocolo :=  dm.qrygetObject1.FieldByName('DOM_PROTOCOLO').AsString;
        Self.Entregador := dm.qrygetObject1.FieldByName('COD_ENTREGADOR').AsInteger;
        Self.Usuario := dm.qrygetObject1.FieldByName('NOM_USUARIO').AsString;
        Self.Manutencao := dm.qrygetObject1.FieldByName('DAT_MANUTENCAO').AsDateTime;
      end;
    end
    else
    begin
      dm.qrygetObject1.Close;
      dm.qrygetObject1.SQL.Clear;
      Exit;
    end;
    Result := True;
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
    dm.qrygetObject1.Close;
    dm.qrygetObject1.SQL.Clear;
    dm.qrygetObject1.SQL.Add('SELECT * FROM ' + TABLENAME);
    dm.ZConn1.PingServer;
    dm.qrygetObject1.Open;
    if dm.qrygetObject1.IsEmpty then
    begin
      Exit;
    end;
    dm.qrygetObject1.First;
    Result := True;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TAtribuicoes.getField(campo, coluna: String): String;
begin
  Try
    Result := '';
    dm.qryFields1.Close;
    dm.qryFields1.SQL.Clear;
    dm.qryFields1.SQL.Text := 'SELECT ' + campo + ' FROM ' + TABLENAME;
    if coluna = 'CODIGO' then
    begin
      dm.qryFields1.SQL.Add(' WHERE COD_ASSINANTE = :CODIGO ');
      dm.qryFields1.ParamByName('CODIGO').AsString := Self.Codigo;
    end
    else if coluna = 'NOME' then
    begin
      dm.qryFields1.SQL.Add(' WHERE NOM_ASSINANTE = :NOME ');
      dm.qryFields1.ParamByName('NOME').AsString := Self.Nome;
    end
    else if coluna = 'ID' then
    begin
      dm.qryFields1.SQL.Add(' WHERE ID_ASSINANTE =  :ID ');
      dm.qryFields1.ParamByName('ID').AsInteger := Self.Id;
    end;
    dm.ZConn1.PingServer;
    dm.qryFields1.Open;
    if dm.qryFields1.IsEmpty then
    begin
      Exit;
    end;
    dm.qryFields1.First;
    Result := dm.qryFields1.FieldByName(campo).AsString;
    dm.qryFields1.Close;
    dm.qryFields1.SQL.Clear;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

procedure TAtribuicoes.setBairro(const Value: String);
begin
  _bairro := Value;
end;

procedure TAtribuicoes.setBarra(const Value: String);
begin
  _barra := Value;
end;

procedure TAtribuicoes.setCEP(const Value: String);
begin
  _cep := Value;
end;

procedure TAtribuicoes.setCidade(const Value: String);
begin
  _cidade := Value;
end;

procedure TAtribuicoes.setCodigo(const Value: String);
begin
  _codigo := Value;
end;

procedure TAtribuicoes.setComplemento(const Value: String);
begin
  _complemento := Value;
end;

procedure TAtribuicoes.setCuidados(const Value: String);
begin
  _cuidados := Value;
end;

procedure TAtribuicoes.setData(const Value: TDate);
begin
  _data := Value;
end;

procedure TAtribuicoes.setEdicao(const Value: String);
begin
  _edicao := Value;
end;

procedure TAtribuicoes.setEndereco(const Value: String);
begin
  _endereco := Value;
end;

procedure TAtribuicoes.setEntregador(const Value: Integer);
begin
  _entregador := Value;
end;

procedure TAtribuicoes.setId(const Value: Integer);
begin
  _id := Value;
end;

procedure TAtribuicoes.setManutencao(const Value: TDateTime);
begin
  _manutencao := Value;
end;

procedure TAtribuicoes.setNome(const Value: String);
begin
  _nome := Value;
end;

procedure TAtribuicoes.setProduto(const Value: String);
begin
  _produto := Value;
end;

procedure TAtribuicoes.setProtocolo(const Value: String);
begin
  _protocolo := Value;
end;

procedure TAtribuicoes.setQuantidade(const Value: Integer);
begin
  _qtde := Value;
end;

procedure TAtribuicoes.setReferencia(const Value: String);
begin
  _referencia := Value;
end;

procedure TAtribuicoes.setRoteiro(const Value: Integer);
begin
  _roteiro := Value;
end;

procedure TAtribuicoes.setTipo(const Value: String);
begin
  _tipo := Value;
end;

procedure TAtribuicoes.setUF(const Value: String);
begin
  _uf := Value;
end;

procedure TAtribuicoes.setUsuario(const Value: String);
begin
  _usuario := Value;
end;

end.
