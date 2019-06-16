 unit clPessoaJ;

interface

uses
  clEndereco;

type
  TPessoaJ = class(TObject)
  private
    function  getAlias              : String;
    function  getCnae               : String;
    function  getCnpj               : String;
    function  getContato            : String;
    function  getCrt                : Integer;
    function  getTipoDoc            : String;
    function  getFantasia           : String;
    function  getIE                 : String;
    function  getIEST               : String;
    function  getIM                 : String;
    function  getRazao              : String;
    function  getAgencia            : String;
    function  getBanco              : String;
    function  getNumeroConta        : String;
    function  getTipoConta          : String;
    function  getCpfCnpjFavorecido  : String;
    function  getFavorecido         : String;
    function  getForma              : String;

    procedure setAlias              (const Value: String);
    procedure setCnae               (const Value: String);
    procedure setCnpj               (const Value: String);
    procedure setContato            (const Value: String);
    procedure setCrt                (const Value: Integer);
    procedure setTipoDoc            (const Value: String);
    procedure setFantasia           (const Value: String);
    procedure setIE                 (const Value: String);
    procedure setIEST               (const Value: String);
    procedure setIM                 (const Value: String);
    procedure setRazao              (const Value: String);
    procedure setAgencia            (const Value: String);
    procedure setBanco              (const Value: String);
    procedure setNumeroConta        (const Value: String);
    procedure setTipoConta          (const Value: String);
    procedure setCpfCnpjFavorecido  (const Value: String);
    procedure setFavorecido         (const Value: String);
    procedure setForma              (const Value: String);

  protected
    // declaração de atributos
    _razao              : String;
    _fantasia           : String;
    _cnpj               : String;
    _ie                 : String;
    _iest               : String;
    _im                 : String;
    _cnae               : String;
    _crt                : Integer;
    _alias              : String;
    _tipodoc            : String;
    _contato            : String;
    _tipoconta          : String;
    _codigobanco        : String;
    _codigoagencia      : String;
    _numeroconta        : String;
    _favorecido         : String;
    _cpfcnpjfavorecido  : String;
    _forma              : String;

  public
    // declaração das propriedades da classe, encapsulamento de atributos
    property Razao: String read getRazao write setRazao;
    property Fantasia: String read getFantasia write setFantasia;
    property Cnpj: String read getCnpj write setCnpj;
    property IE: String read getIE write setIE;
    property IEST: String read getIEST write setIEST;
    property IM: String read getIM write setIM;
    property Cnae: String read getCnae write setCnae;
    property Crt: Integer read getCrt write setCrt;
    property Alias: String read getAlias write setAlias;
    property TipoDoc: String read getTipoDoc write setTipoDoc;
    property Contato: String read getContato write setContato;
    property TipoConta: String read getTipoConta write setTipoConta;
    property Banco: String read getBanco write setBanco;
    property Agencia: String read getAgencia write setAgencia;
    property NumeroConta: String read getNumeroConta write setNumeroConta;
    property Favorecido: String read getFavorecido write setFavorecido;
    property CpfCnpjFavorecido: String read getCpfCnpjFavorecido
      write setCpfCnpjFavorecido;
    property Forma: String read getForma write setForma;
    // na linha acima antes do ponto e virgula (setContato) pressione Ctrl + Shift + C
    // para gerar os métodos acessores getter e setter automaticamente

  end;

implementation

uses SysUtils;

{ TPessoaJ }

function TPessoaJ.getAlias: String;
begin
  Result := _alias;
end;

function TPessoaJ.getCnae: String;
begin
  Result := _cnae;
end;

function TPessoaJ.getCnpj: String;
begin
  Result := _cnpj;
end;

function TPessoaJ.getContato: String;
begin
  Result := _contato;
end;

function TPessoaJ.getCrt: Integer;
begin
  Result := _crt;
end;

function TPessoaJ.getTipoDoc: String;
begin
  Result := _tipodoc;
end;

function TPessoaJ.getFantasia: String;
begin
  Result := _fantasia;
end;

function TPessoaJ.getIE: String;
begin
  Result := _ie;
end;

function TPessoaJ.getIEST: String;
begin
  Result := _iest;
end;

function TPessoaJ.getIM: String;
begin
  Result := _im;
end;

function TPessoaJ.getRazao: String;
begin
  Result := _razao;
end;

procedure TPessoaJ.setAlias(const Value: String);
begin
  _alias := Trim(Value);
end;

procedure TPessoaJ.setCnae(const Value: String);
begin
  _cnae := Trim(Value);
end;

procedure TPessoaJ.setCnpj(const Value: String);
begin
  _cnpj := Trim(Value);
end;

procedure TPessoaJ.setContato(const Value: String);
begin
  _contato := Trim(Value);
end;

procedure TPessoaJ.setCrt(const Value: Integer);
begin
  _crt := Value;
end;

procedure TPessoaJ.setTipoDoc(const Value: String);
begin
  _tipodoc := Value;
end;

procedure TPessoaJ.setFantasia(const Value: String);
begin
  _fantasia := Trim(Value);
end;

procedure TPessoaJ.setIE(const Value: String);
begin
  _ie := Trim(Value);
end;

procedure TPessoaJ.setIEST(const Value: String);
begin
  _iest := Trim(Value);
end;

procedure TPessoaJ.setIM(const Value: String);
begin
  _im := Trim(Value);
end;

procedure TPessoaJ.setRazao(const Value: String);
begin
  _razao := Trim(Value);
end;

function TPessoaJ.getAgencia: String;
begin
  Result := _codigoagencia;
end;

function TPessoaJ.getBanco: String;
begin
  Result := _codigobanco;
end;

function TPessoaJ.getNumeroConta: String;
begin
  Result := _numeroconta;
end;

function TPessoaJ.getTipoConta: String;
begin
  Result := _tipoconta;
end;

procedure TPessoaJ.setAgencia(const Value: String);
begin
  _codigoagencia := Value;
end;

procedure TPessoaJ.setBanco(const Value: String);
begin
  _codigobanco := Value;
end;

procedure TPessoaJ.setNumeroConta(const Value: String);
begin
  _numeroconta := Value;
end;

procedure TPessoaJ.setTipoConta(const Value: String);
begin
  _tipoconta := Value;
end;

function TPessoaJ.getCpfCnpjFavorecido: String;
begin
  Result := _cpfcnpjfavorecido;
end;

function TPessoaJ.getFavorecido: String;
begin
  Result := _favorecido;
end;

procedure TPessoaJ.setCpfCnpjFavorecido(const Value: String);
begin
  _cpfcnpjfavorecido := Value;
end;

procedure TPessoaJ.setFavorecido(const Value: String);
begin
  _favorecido := Value;
end;

function TPessoaJ.getForma: String;
begin
  Result := _forma;
end;

procedure TPessoaJ.setForma(const Value: String);
begin
  _forma := Value;
end;

end.
