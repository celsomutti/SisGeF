unit clEndereco;

interface

type
  TEndereco = class(TObject)
  private
    function getBairro: String;
    function getCep: String;
    function getComplemento: String;
    function getLogradouro: String;
    function getNumero: String;
    function getReferencia: String;
    function getCidade: String;
    function getUf: String;
    procedure setBairro(const Value: String);
    procedure setCep(const Value: String);
    procedure setComplemento(const Value: String);
    procedure setLogradouro(const Value: String);
    procedure setNumero(const Value: String);
    procedure setReferencia(const Value: String);
    procedure setCidade(const Value: String);
    procedure setUf(const Value: String);
    function getEndereco: String;
    procedure setEndereco(const Value: String);

  protected
    // declaração de atributos

    _logradouro: String;
    _numero: String;
    _complemento: String;
    _cep: String;
    _referencia: String;
    _bairro: String;
    _cidade: String;
    _uf: String;
    _endereco: String;

  public
    // declaração das propriedades da classe, encapsulamento de atributos
    property Logradouro: String read getLogradouro write setLogradouro;
    property Numero: String read getNumero write setNumero;
    property Complemento: String read getComplemento write setComplemento;
    property Cep: String read getCep write setCep;
    property Referencia: String read getReferencia write setReferencia;
    property Bairro: String read getBairro write setBairro;
    property Cidade: String read getCidade write setCidade;
    property UF: String read getUf write setUf;
    property Endereco: String read getEndereco write setEndereco;
  end;

implementation

{ TEndereco }

uses
  SysUtils;

function TEndereco.getBairro: String;
begin
  Result := _bairro;
end;

function TEndereco.getCep: String;
begin
  Result := _cep;
end;

function TEndereco.getCidade: String;
begin
  Result := _cidade;
end;

function TEndereco.getComplemento: String;
begin
  Result := _complemento;
end;

function TEndereco.getEndereco: String;
begin
  Result := _endereco;
end;

function TEndereco.getLogradouro: String;
begin
  Result := _logradouro;
end;

function TEndereco.getNumero: String;
begin
  Result := _numero;
end;

function TEndereco.getReferencia: String;
begin
  Result := _referencia;
end;

function TEndereco.getUf: String;
begin
  Result := _uf;
end;

procedure TEndereco.setBairro(const Value: String);
begin
  _bairro := Trim(Value);
end;

procedure TEndereco.setCep(const Value: String);
begin
  _cep := Trim(Value);
end;

procedure TEndereco.setCidade(const Value: String);
begin
  _cidade := Trim(Value);
end;

procedure TEndereco.setComplemento(const Value: String);
begin
  _complemento := Trim(Value);
end;

procedure TEndereco.setEndereco(const Value: String);
begin
  _endereco := Value;
end;

procedure TEndereco.setLogradouro(const Value: String);
begin
  _logradouro := Trim(Value);
end;

procedure TEndereco.setNumero(const Value: String);
begin
  _numero := Trim(Value);
end;

procedure TEndereco.setReferencia(const Value: String);
begin
  _referencia := Trim(Value);
end;

procedure TEndereco.setUf(const Value: String);
begin
  _uf := Value;
end;

end.
