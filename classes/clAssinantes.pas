unit clAssinantes;

interface

uses clProdutos, clTipoAssinatura;

type
  TAssinantes = class(TObject)
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
    function getRevista: String;
    procedure setRevista(const Value: String);
    function getBaixa: String;
    procedure setBaixa(const Value: String);
    function getGrau: String;
    function getRecebedor: String;
    procedure setGrau(const Value: String);
    procedure setRecebedor(const Value: String);
  protected
    _id: Integer;
    _codigo: String;
    _roteiro: Integer;
    _produto: String;
    _tipo: String;
    _edicao: String;
    _data: TDateTime;
    _nome: String;
    _cuidados: String;
    _endereco: String;
    _complemento: String;
    _bairro: String;
    _referencia: String;
    _cidade: String;
    _uf: String;
    _cep: String;
    _barra: String;
    _qtde: Integer;
    _protocolo: String;
    _revista: String;
    _baixa: String;
    _recebedor: String;
    _grau: String;
    _produtos: TProdutos;
    _tipos: TTipoAssinatura;
  public

    constructor Create;
    destructor Destroy;

    property Id: Integer read getId write setId;
    property Codigo: String read getCodigo write setCodigo;
    property Roteiro: Integer read getRoteiro write setRoteiro;
    property Produto: String read getProduto write setProduto;
    property Tipo: String read getTipo write setTipo;
    property Edicao: String read getEdicao write setEdicao;
    property Data: TDate read getData write setData;
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
    property Revista: String read getRevista write setRevista;
    property Baixa: String read getBaixa write setBaixa;
    property Recebedor: String read getRecebedor write setRecebedor;
    property Grau: String read getGrau write setGrau;

    function Validar(): Boolean;
    function Insert(): Boolean;
    function Update(): Boolean;
    function Delete(filtro: String): Boolean;
    function getObject(Id, filtro: String): Boolean;
    function getObjects(): Boolean;
    function getField(campo, coluna: String): String;
    function TotalEtiquetas(sId: String; sFiltro: String): Integer;
    function ExistProtocol(sId: String; sFiltro: String): Boolean;
  end;

const
  TABLENAME = 'jor_assinantes';

implementation

uses
  System.SysUtils, Vcl.Dialogs, udm, uGlobais, clUtil;

{ TAssinantes }

constructor TAssinantes.Create;
begin
  _produtos := TProdutos.Create;
  _tipos := TTipoAssinatura.Create;
end;

destructor TAssinantes.Destroy;
begin
  _produtos.Free;
  _tipos.Free;
end;

function TAssinantes.getBairro: String;
begin
  Result := _bairro;
end;

function TAssinantes.getBaixa: String;
begin
  Result := _baixa;
end;

function TAssinantes.getBarra: String;
begin
  Result := _barra;
end;

function TAssinantes.getCEP: String;
begin
  Result := _cep;
end;

function TAssinantes.getCicade: String;
begin
  Result := _cidade;
end;

function TAssinantes.getCodigo: String;
begin
  Result := _codigo;
end;

function TAssinantes.getComplemento: String;
begin
  Result := _complemento;
end;

function TAssinantes.getCuidados: String;
begin
  Result := _cuidados;
end;

function TAssinantes.getData: TDate;
begin
  Result := _data;
end;

function TAssinantes.getEdicao: String;
begin
  Result := _edicao;
end;

function TAssinantes.getEndereco: String;
begin
  Result := _endereco;
end;

function TAssinantes.getId: Integer;
begin
  Result := _id;
end;

function TAssinantes.getNome: String;
begin
  Result := _nome;
end;

function TAssinantes.getProduto: String;
begin
  Result := _produto;
end;

function TAssinantes.getProtocolo: String;
begin
  Result := _protocolo;
end;

function TAssinantes.getQuantidade: Integer;
begin
  Result := _qtde;
end;

function TAssinantes.getRecebedor: String;
begin
  Result := _recebedor;
end;

function TAssinantes.getReferencia: String;
begin
  Result := _referencia;
end;

function TAssinantes.getRevista: String;
begin
  Result := _revista;
end;

function TAssinantes.getRoteiro: Integer;
begin
  Result := _roteiro;
end;

function TAssinantes.getTipo: String;
begin
  Result := _tipo;
end;

function TAssinantes.getUF: String;
begin
  Result := _uf;
end;

function TAssinantes.Validar(): Boolean;
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

function TAssinantes.Insert(): Boolean;
begin
  try
    Result := False;
    dm.qryCRUD1.Close;
    dm.qryCRUD1.SQL.Clear;
    dm.qryCRUD1.SQL.Text := 'INSERT INTO ' + TABLENAME + '(COD_ASSINANTE, ' +
      'COD_PRODUTO, ' + 'COD_TIPO_ASSINATURA, ' + 'NUM_EDICAO, ' +
      'DAT_EDICAO, ' + 'NOM_ASSINANTE, ' + 'NOM_CUIDADOS, ' + 'DES_ENDERECO, ' +
      'DES_COMPLEMENTO, ' + 'DES_BAIRRO, ' + 'DES_REFERENCIA, ' + 'DES_CIDADE, '
      + 'DES_UF, ' + 'CEP_ENDERECO, ' + 'NUM_ROTEIRO, ' + 'QTD_EXEMPLARES, ' +
      'COD_BARRA, ' + 'DOM_PROTOCOLO, ' + 'ID_REVISTA, DOM_BAIXA, NOM_RECEBEDOR, DES_GRAU_RELACIONAMENTO) ' +
      'VALUES (' + ':CODIGO, ' +
      ':PRODUTO, ' + ':TIPO, ' + ':EDICAO, ' + ':DATA, ' + ':NOME, ' +
      ':CUIDADOS, ' + ':ENDERECO, ' + ':COMPLEMENTO, ' + ':BAIRRO, ' +
      ':REFERENCIA, ' + ':CIDADE, ' + ':UF, ' + ':CEP, ' + ':ROTEIRO, ' +
      ':QTDE, ' + ':BARRA, ' + ':PROTOCOLO, ' + ':REVISTA, :BAIXA, :RECEBEDOR, :GRAU);';
    dm.qryCRUD1.ParamByName('CODIGO').AsString := Self.Codigo;
    dm.qryCRUD1.ParamByName('PRODUTO').AsString := Self.Produto;
    dm.qryCRUD1.ParamByName('TIPO').AsString := Self.Tipo;
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
    dm.qryCRUD1.ParamByName('PROTOCOLO').AsString := Self.Protocolo;
    dm.qryCRUD1.ParamByName('REVISTA').AsString := Self.Revista;
    dm.qryCRUD1.ParamByName('BAIXA').AsString := Self.Baixa;
    dm.qryCRUD1.ParamByName('RECEBEDOR').AsString := Self.Recebedor;
    dm.qryCRUD1.ParamByName('GRAU').AsString := Self.Grau;
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

function TAssinantes.Update(): Boolean;
begin
  try
    Result := False;
    dm.qryCRUD1.Close;
    dm.qryCRUD1.SQL.Clear;
    dm.qryCRUD1.SQL.Text := 'UPDATE ' + TABLENAME + ' SET ' +
      'COD_ASSINANTE = :CODIGO, ' + 'COD_PRODUTO = :PRODUTO, ' +
      'COD_TIPO_ASSINATURA = :TIPO, ' + 'NUM_EDICAO = :EDICAO, ' +
      'DAT_EDICAO = :DATA, ' + 'NOM_ASSINANTE = :NOME, ' +
      'NOM_CUIDADOS = :CUIDADOS, ' + 'DES_ENDERECO = :ENDERECO, ' +
      'DES_COMPLEMENTO = :COMPLEMENTO, ' + 'DES_BAIRRO = :BAIRRO, ' +
      'DES_REFERENCIA = :REFERENCIA, ' + 'DES_CIDADE = :CIDADE, ' +
      'DES_UF = :UF, ' + 'CEP_ENDERECO = :CEP, ' + 'NUM_ROTEIRO = :ROTEIRO, ' +
      'QTD_EXEMPLARES = :QTDE, ' + 'COD_BARRA = :BARRA, ' +
      'DOM_PROTOCOLO = :PROTOCOLO, ID_REVISTA = :REVISTA, DOM_BAIXA = :BAIXA, ' +
      'NOM_RECEBEDOR = :RECEBEDOR, DES_GRAU_RELACIONAMENTO = :GRAU ' +
      'WHERE ID_ASSINANTE = :ID;';
    dm.qryCRUD1.ParamByName('ID').AsInteger := Self.Id;
    dm.qryCRUD1.ParamByName('CODIGO').AsString := Self.Codigo;
    dm.qryCRUD1.ParamByName('PRODUTO').AsString := Self.Produto;
    dm.qryCRUD1.ParamByName('TIPO').AsString := Self.Tipo;
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
    dm.qryCRUD1.ParamByName('PROTOCOLO').AsString := Self.Protocolo;
    dm.qryCRUD1.ParamByName('REVISTA').AsString := Self.Revista;
    dm.qryCRUD1.ParamByName('BAIXA').AsString := Self.Baixa;
    dm.qryCRUD1.ParamByName('RECEBEDOR').AsString := Self.Recebedor;
    dm.qryCRUD1.ParamByName('GRAU').AsString := Self.Grau;
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

function TAssinantes.Delete(filtro: string): Boolean;
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
    else if filtro = 'REVISTA' then
    begin
      dm.qryCRUD1.SQL.Add('WHERE ID_REVISTA = :REVISTA');
      dm.qryCRUD1.ParamByName('REVISTA').AsString := Self.Revista;
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

function TAssinantes.getObject(Id: string; filtro: string): Boolean;
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
      dm.qrygetObject1.SQL.Add(' WHERE DAT_EDICAO =  :DATA');
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
    else if filtro = 'REVISTA' then
    begin
      dm.qrygetObject1.SQL.Add(' WHERE ID_REVISTA =  :REVISTA');
      dm.qrygetObject1.ParamByName('REVISTA').AsString := Id;
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
    else if filtro = 'CHAVE1' then
    begin
      dm.qrygetObject1.SQL.Add
        (' WHERE COD_ASSINANTE = :CODIGO AND COD_PRODUTO = :PRODUTO AND COD_TIPO_ASSINATURA = :TIPO ORDER BY ID_ASSINANTE DESC');
      dm.qrygetObject1.ParamByName('CODIGO').AsString := Id;
      dm.qrygetObject1.ParamByName('PRODUTO').AsString := Self.Produto;
      dm.qrygetObject1.ParamByName('TIPO').AsString := Self.Tipo;
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
        Self.Data := dm.qrygetObject1.FieldByName('DAT_EDICAO').AsDateTime;
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
        Self.Protocolo := dm.qrygetObject1.FieldByName('DOM_PROTOCOLO').AsString;
        Self.Revista := dm.qrygetObject1.FieldByName('ID_REVISTA').AsString;
        Self.Baixa := dm.qrygetObject1.FieldByName('DOM_BAIXA').AsString;
        Self.Recebedor := dm.qrygetObject1.FieldByName('NOM_RECEBEDOR').AsString;
        Self.Grau := dm.qrygetObject1.FieldByName('DES_GRAU_RELACIONAMENTO').AsString;
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

function TAssinantes.getObjects(): Boolean;
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

function TAssinantes.getField(campo, coluna: String): String;
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

function TAssinantes.getGrau: String;
begin
  Result  := _grau;
end;

procedure TAssinantes.setBairro(const Value: String);
begin
  _bairro := Value;
end;

procedure TAssinantes.setBaixa(const Value: String);
begin
  _baixa := Value;
end;

procedure TAssinantes.setBarra(const Value: String);
begin
  _barra := Value;
end;

procedure TAssinantes.setCEP(const Value: String);
begin
  _cep := Value;
end;

procedure TAssinantes.setCidade(const Value: String);
begin
  _cidade := Value;
end;

procedure TAssinantes.setCodigo(const Value: String);
begin
  _codigo := Value;
end;

procedure TAssinantes.setComplemento(const Value: String);
begin
  _complemento := Value;
end;

procedure TAssinantes.setCuidados(const Value: String);
begin
  _cuidados := Value;
end;

procedure TAssinantes.setData(const Value: TDate);
begin
  _data := Value;
end;

procedure TAssinantes.setEdicao(const Value: String);
begin
  _edicao := Value;
end;

procedure TAssinantes.setEndereco(const Value: String);
begin
  _endereco := Value;
end;

procedure TAssinantes.setGrau(const Value: String);
begin
  _grau := Value;
end;

procedure TAssinantes.setId(const Value: Integer);
begin
  _id := Value;
end;

procedure TAssinantes.setNome(const Value: String);
begin
  _nome := Value;
end;

procedure TAssinantes.setProduto(const Value: String);
begin
  _produto := Value;
end;

procedure TAssinantes.setProtocolo(const Value: String);
begin
  _protocolo := Value;
end;

procedure TAssinantes.setQuantidade(const Value: Integer);
begin
  _qtde := Value;
end;

procedure TAssinantes.setRecebedor(const Value: String);
begin
  _recebedor := Value;
end;

procedure TAssinantes.setReferencia(const Value: String);
begin
  _referencia := Value;
end;

procedure TAssinantes.setRevista(const Value: String);
begin
  _revista := Value;
end;

procedure TAssinantes.setRoteiro(const Value: Integer);
begin
  _roteiro := Value;
end;

procedure TAssinantes.setTipo(const Value: String);
begin
  _tipo := Value;
end;

procedure TAssinantes.setUF(const Value: String);
begin
  _uf := Value;
end;

function TAssinantes.TotalEtiquetas(sId: String; sFiltro: String): Integer;
begin
  Try
    Result := 0;
    if TUtil.Empty(sId) then
    begin
      Exit;
    end;
    dm.qrygetObject1.Close;
    dm.qrygetObject1.SQL.Clear;
    dm.qrygetObject1.SQL.Add('SELECT SUM(QTD_EXEMPLARES) AS TOTAL FROM ' + TABLENAME);

    if sFiltro = 'CODIGO' then
    begin
      dm.qrygetObject1.SQL.Add(' WHERE COD_ASSINANTE = :CODIGO');
      dm.qrygetObject1.ParamByName('CODIGO').AsString := sId;
    end
    else if sFiltro = 'NOME' then
    begin
      dm.qrygetObject1.SQL.Add(' WHERE NOM_ASSINANTE = :NOME');
      dm.qrygetObject1.ParamByName('NOME').AsString := sId;
    end
    else if sFiltro = 'ID' then
    begin
      dm.qrygetObject1.SQL.Add(' WHERE ID_ASSINANTE =  :ID');
      dm.qrygetObject1.ParamByName('ID').AsInteger := StrToInt(sId);
    end
    else if sFiltro = 'EDICAO' then
    begin
      dm.qrygetObject1.SQL.Add(' WHERE NUM_EDICAO =  :EDICAO');
      dm.qrygetObject1.ParamByName('EDICAO').AsString := sId;
    end
    else if sFiltro = 'DATA' then
    begin
      dm.qrygetObject1.SQL.Add(' WHERE DAT_EDICAO =  :DATA');
      dm.qrygetObject1.ParamByName('DATA').AsDate := StrToDate(sId);
    end
    else if sFiltro = 'ROTEIRO' then
    begin
      dm.qrygetObject1.SQL.Add(' WHERE NUM_ROTEIRO =  :ROTEIRO');
      dm.qrygetObject1.ParamByName('ROTEIRO').AsInteger := StrToInt(sId);
    end
    else if sFiltro = 'BARRA' then
    begin
      dm.qrygetObject1.SQL.Add(' WHERE COD_BARRA =  :BARRA');
      dm.qrygetObject1.ParamByName('BARRA').AsString := sId;
    end
    else if sFiltro = 'REVISTA' then
    begin
      dm.qrygetObject1.SQL.Add(' WHERE ID_REVISTA =  :REVISTA');
      dm.qrygetObject1.ParamByName('REVISTA').AsString := sId;
    end
    else if sFiltro = 'PROTOCOLO' then
    begin
      dm.qrygetObject1.SQL.Add(' WHERE DOM_PROTOCOLO =  :PROTOCOLO');
      dm.qrygetObject1.ParamByName('PROTOCOLO').AsString := sId;
    end
    else if sFiltro = 'PRODUTO' then
    begin
      dm.qrygetObject1.SQL.Add(' WHERE COD_PRODUTO =  :PRODUTO');
      dm.qrygetObject1.ParamByName('PRODUTO').AsString := sId;
    end
    else if sFiltro = 'TIPO' then
    begin
      dm.qrygetObject1.SQL.Add(' WHERE COD_TIPO_ASSINATURA =  :TIPO');
      dm.qrygetObject1.ParamByName('TIPO').AsString := sId;
    end
    else if sFiltro = 'CHAVE1' then
    begin
      dm.qrygetObject1.SQL.Add
        (' WHERE COD_ASSINANTE = :CODIGO AND COD_PRODUTO = :PRODUTO AND COD_TIPO_ASSINATURA = :TIPO');
      dm.qrygetObject1.ParamByName('CODIGO').AsString := sId;
      dm.qrygetObject1.ParamByName('PRODUTO').AsString := Self.Produto;
      dm.qrygetObject1.ParamByName('TIPO').AsString := Self.Tipo;
    end
    else if sFiltro = 'CHAVE' then
    begin
      dm.qrygetObject1.SQL.Add
        (' WHERE COD_ASSINANTE = :CODIGO AND COD_PRODUTO = :PRODUTO AND COD_TIPO_ASSINATURA = :TIPO AND '
        + 'NUM_EDICAO = :EDICAO');
      dm.qrygetObject1.ParamByName('CODIGO').AsString := sId;
      dm.qrygetObject1.ParamByName('PRODUTO').AsString := Self.Produto;
      dm.qrygetObject1.ParamByName('TIPO').AsString := Self.Tipo;
      dm.qrygetObject1.ParamByName('EDICAO').AsString := Self.Edicao;
    end
    else if sFiltro = 'FILTRO' then
    begin
      dm.qrygetObject1.SQL.Add('WHERE ' + sId);
    end;
    dm.ZConn1.PingServer;
    dm.qrygetObject1.Open;
    if (not dm.qrygetObject1.IsEmpty) then
    begin
      Result := dm.qrygetObject1.FieldByName('TOTAL').AsInteger;
    end;
    dm.qrygetObject1.Close;
    dm.qrygetObject1.SQL.Clear;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' + E.Message);
  end;
end;

function TAssinantes.ExistProtocol(sId: String; sFiltro: String): Boolean;
begin
  try
    Result := False;
    if sId.isEmpty then
    begin
      Exit;
    end;
    if sFiltro.IsEmpty then
    begin
      Exit;
    end;
    dm.qrygetObject1.Close;
    dm.qrygetObject1.SQL.Clear;
    dm.qrygetObject1.SQL.Add('SELECT * FROM ' + TABLENAME);

    if sFiltro = 'CODIGO' then
    begin
      dm.qrygetObject1.SQL.Add(' WHERE COD_ASSINANTE = :CODIGO');
      dm.qrygetObject1.ParamByName('CODIGO').AsString := sId;
    end
    else if sFiltro = 'NOME' then
    begin
      dm.qrygetObject1.SQL.Add(' WHERE NOM_ASSINANTE = :NOME');
      dm.qrygetObject1.ParamByName('NOME').AsString := sId;
    end
    else if sFiltro = 'ID' then
    begin
      dm.qrygetObject1.SQL.Add(' WHERE ID_ASSINANTE =  :ID');
      dm.qrygetObject1.ParamByName('ID').AsInteger := StrToInt(sId);
    end
    else if sFiltro = 'EDICAO' then
    begin
      dm.qrygetObject1.SQL.Add(' WHERE NUM_EDICAO =  :EDICAO');
      dm.qrygetObject1.ParamByName('EDICAO').AsString := sId;
    end
    else if sFiltro = 'DATA' then
    begin
      dm.qrygetObject1.SQL.Add(' WHERE DAT_EDICAO =  :DATA');
      dm.qrygetObject1.ParamByName('DATA').AsDate := StrToDate(sId);
    end
    else if sFiltro = 'ROTEIRO' then
    begin
      dm.qrygetObject1.SQL.Add(' WHERE NUM_ROTEIRO =  :ROTEIRO');
      dm.qrygetObject1.ParamByName('ROTEIRO').AsInteger := StrToInt(sId);
    end
    else if sFiltro = 'BARRA' then
    begin
      dm.qrygetObject1.SQL.Add(' WHERE COD_BARRA =  :BARRA');
      dm.qrygetObject1.ParamByName('BARRA').AsString := sId;
    end
    else if sFiltro = 'REVISTA' then
    begin
      dm.qrygetObject1.SQL.Add(' WHERE ID_REVISTA =  :REVISTA');
      dm.qrygetObject1.ParamByName('REVISTA').AsString := sId;
    end
    else if sFiltro = 'PROTOCOLO' then
    begin
      dm.qrygetObject1.SQL.Add(' WHERE DOM_PROTOCOLO =  :PROTOCOLO');
      dm.qrygetObject1.ParamByName('PROTOCOLO').AsString := sId;
    end
    else if sFiltro = 'PRODUTO' then
    begin
      dm.qrygetObject1.SQL.Add(' WHERE COD_PRODUTO =  :PRODUTO');
      dm.qrygetObject1.ParamByName('PRODUTO').AsString := sId;
    end
    else if sFiltro = 'TIPO' then
    begin
      dm.qrygetObject1.SQL.Add(' WHERE COD_TIPO_ASSINATURA =  :TIPO');
      dm.qrygetObject1.ParamByName('TIPO').AsString := sId;
    end
    else if sFiltro = 'CHAVE1' then
    begin
      dm.qrygetObject1.SQL.Add
        (' WHERE COD_ASSINANTE = :CODIGO AND COD_PRODUTO = :PRODUTO AND COD_TIPO_ASSINATURA = :TIPO');
      dm.qrygetObject1.ParamByName('CODIGO').AsString := sId;
      dm.qrygetObject1.ParamByName('PRODUTO').AsString := Self.Produto;
      dm.qrygetObject1.ParamByName('TIPO').AsString := Self.Tipo;
    end
    else if sFiltro = 'CHAVE' then
    begin
      dm.qrygetObject1.SQL.Add
        (' WHERE COD_ASSINANTE = :CODIGO AND COD_PRODUTO = :PRODUTO AND COD_TIPO_ASSINATURA = :TIPO AND '
        + 'NUM_EDICAO = :EDICAO');
      dm.qrygetObject1.ParamByName('CODIGO').AsString := sId;
      dm.qrygetObject1.ParamByName('PRODUTO').AsString := Self.Produto;
      dm.qrygetObject1.ParamByName('TIPO').AsString := Self.Tipo;
      dm.qrygetObject1.ParamByName('EDICAO').AsString := Self.Edicao;
    end
    else if sFiltro = 'FILTRO' then
    begin
      dm.qrygetObject1.SQL.Add('WHERE DOM_PROTOCOLO = :PROTOCOLO AND ' + sId);
    end;
    dm.qrygetObject1.ParamByName('PROTOCOLO').AsString := 'S';
    dm.ZConn1.PingServer;
    dm.qrygetObject1.Open;
    if (not dm.qrygetObject1.IsEmpty) then
    begin
      Result := True;
    end;
    dm.qrygetObject1.Close;
    dm.qrygetObject1.SQL.Clear;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' + E.Message);
  end;
end;

end.
