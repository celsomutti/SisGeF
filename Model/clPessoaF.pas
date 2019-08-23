unit clPessoaF;

interface

type
  TPessoaF = Class(TObject)
  private
    function getAlias: String;
    function getCategoriaCNH: String;
    function getCNH: String;
    function getCPF: String;
    function getDataRG: TDate;
    function getEstadoCivil: String;
    function getNaturalidade: String;
    function getNome: String;
    function getNomeConjuge: String;
    function getNomeMae: String;
    function getNomePai: String;
    function getNumeroCTPS: String;
    function getOrgaoRG: String;
    function getPIS: String;
    function getRG: String;
    function getSerieCTPS: String;
    function getTipoDoc: String;
    function getUFCTPS: String;
    function getUFNatural: String;
    function getUFRG: String;
    function getValidadeCNH: TDate;
    procedure setAlias(const Value: String);
    procedure setCategoriaCNH(const Value: String);
    procedure setCNH(const Value: String);
    procedure setCPF(const Value: String);
    procedure setDataRG(const Value: TDate);
    procedure setEstadoCivil(const Value: String);
    procedure setNaturalidade(const Value: String);
    procedure setNome(const Value: String);
    procedure setNomeConjuge(const Value: String);
    procedure setNomeMae(const Value: String);
    procedure setNomePai(const Value: String);
    procedure setNumeroCTPS(const Value: String);
    procedure setOrgaoRG(const Value: String);
    procedure setPIS(const Value: String);
    procedure setRG(const Value: String);
    procedure setSerieCTPS(const Value: String);
    procedure setTipoDoc(const Value: String);
    procedure setUFCTPS(const Value: String);
    procedure setUFNatural(const Value: String);
    procedure setUFRG(const Value: String);
    procedure setValidadeCNH(const Value: TDate);
    function getAgencia: String;
    function getBanco: String;
    function getCpfCnpjFavorecido: String;
    function getFavorecido: String;
    function getForma: String;
    function getNumeroConta: String;
    function getTipoConta: String;
    procedure setAgencia(const Value: String);
    procedure setBanco(const Value: String);
    procedure setCpfCnpjFavorecido(const Value: String);
    procedure setFavorecido(const Value: String);
    procedure setForma(const Value: String);
    procedure setNumeroConta(const Value: String);
    procedure setTipoConta(const Value: String);
    function getCNHRegistro: String;
    procedure setCNHRegistro(const Value: String);
    function getCNHUF: String;
    procedure setCNHUF(const Value: String);
    function getDataPrimeiraCNH: TDate;
    procedure setDataPrimeiraCN(const Value: TDate);
    function getDtNascimento: TDate;
    procedure setDtNascimento(const Value: TDate);
    function getEmissaoCNH: TDate;
    procedure setEmissaoCNH(const Value: TDate);
    function getCodigoCNH: String;
    procedure setCodigoCNH(const Value: String);
  protected
    _cpf: String;
    _tipodoc: String;
    _nascimento: TDate;
    _nome: String;
    _alias: String;
    _rg: String;
    _ufrg: String;
    _orgaorg: String;
    _datarg: TDate;
    _naturalidade: String;
    _ufnatural: String;
    _numeroctps: String;
    _seriectps: String;
    _ufctps: String;
    _pis: String;
    _codcnh: String;
    _cnh: String;
    _cnhregistro: String;
    _categoriacnh: String;
    _validadecnh: TDate;
    _emissaoCNH: TDate;
    _cnhuf: String;
    _dataprimeiracnh: TDate;
    _nomepai: String;
    _nomemae: String;
    _estadocivil: String;
    _nomeconjuge: String;
    _forma: String;
    _tipoconta: String;
    _codigobanco: String;
    _codigoagencia: String;
    _numeroconta: String;
    _favorecido: String;
    _cpfcnpjfavorecido: String;

  public
    property CPF: String read getCPF write setCPF;
    property TipoDoc: String read getTipoDoc write setTipoDoc;
    property DtNascimento: TDate read getDtNascimento write setDtNascimento;
    property Nome: String read getNome write setNome;
    property Alias: String read getAlias write setAlias;
    property RG: String read getRG write setRG;
    property UFRG: String read getUFRG write setUFRG;
    property OrgaoRG: String read getOrgaoRG write setOrgaoRG;
    property DataRG: TDate read getDataRG write setDataRG;
    property Naturalidade: String read getNaturalidade write setNaturalidade;
    property UFNatural: String read getUFNatural write setUFNatural;
    property NumeroCTPS: String read getNumeroCTPS write setNumeroCTPS;
    property SerieCTPS: String read getSerieCTPS write setSerieCTPS;
    property UFCTPS: String read getUFCTPS write setUFCTPS;
    property PIS: String read getPIS write setPIS;
    property CNH: String read getCNH write setCNH;
    property CodigoCNH: String read getCodigoCNH write setCodigoCNH;
    property CNHRegistro: String read getCNHRegistro write setCNHRegistro;
    property CategoriaCNH: String read getCategoriaCNH write setCategoriaCNH;
    property ValidadeCNH: TDate read getValidadeCNH write setValidadeCNH;
    property EmissaoCNH: TDate read getEmissaoCNH write setEmissaoCNH;
    property CNHUF: String read getCNHUF write setCNHUF;
    property DataPrimeiraCNH: TDate read getDataPrimeiraCNH
      write setDataPrimeiraCN;
    property NomePai: String read getNomePai write setNomePai;
    property NomeMae: String read getNomeMae write setNomeMae;
    property EstadoCivil: String read getEstadoCivil write setEstadoCivil;
    property NomeConjuge: String read getNomeConjuge write setNomeConjuge;
    property Forma: String read getForma write setForma;
    property TipoConta: String read getTipoConta write setTipoConta;
    property Banco: String read getBanco write setBanco;
    property Agencia: String read getAgencia write setAgencia;
    property NumeroConta: String read getNumeroConta write setNumeroConta;
    property Favorecido: String read getFavorecido write setFavorecido;
    property CpfCnpjFavorecido: String read getCpfCnpjFavorecido
      write setCpfCnpjFavorecido;

  end;

implementation

{ TPessoaF }

function TPessoaF.getAgencia: String;
begin
  Result := _codigoagencia;
end;

function TPessoaF.getAlias: String;
begin
  Result := _alias;
end;

function TPessoaF.getBanco: String;
begin
  Result := _codigobanco;
end;

function TPessoaF.getCategoriaCNH: String;
begin
  Result := _categoriacnh;
end;

function TPessoaF.getCNH: String;
begin
  Result := _cnh;
end;

function TPessoaF.getCNHRegistro: String;
begin
  Result := _cnhregistro;
end;

function TPessoaF.getCNHUF: String;
begin
  Result := _cnhuf;
end;

function TPessoaF.getCodigoCNH: String;
begin
  Result := _codcnh;
end;

function TPessoaF.getCPF: String;
begin
  Result := _cpf;
end;

function TPessoaF.getCpfCnpjFavorecido: String;
begin
  Result := _cpfcnpjfavorecido;
end;

function TPessoaF.getDataPrimeiraCNH: TDate;
begin
  Result := _dataprimeiracnh;
end;

function TPessoaF.getDataRG: TDate;
begin
  Result := _datarg;
end;

function TPessoaF.getDtNascimento: TDate;
begin
  Result := _nascimento;
end;

function TPessoaF.getEmissaoCNH: TDate;
begin
  Result := _emissaoCNH;
end;

function TPessoaF.getEstadoCivil: String;
begin
  Result := _estadocivil;
end;

function TPessoaF.getFavorecido: String;
begin
  Result := _favorecido;
end;

function TPessoaF.getForma: String;
begin
  Result := _forma;
end;

function TPessoaF.getNaturalidade: String;
begin
  Result := _naturalidade;
end;

function TPessoaF.getNome: String;
begin
  Result := _nome;
end;

function TPessoaF.getNomeConjuge: String;
begin
  Result := _nomeconjuge;
end;

function TPessoaF.getNomeMae: String;
begin
  Result := _nomemae
end;

function TPessoaF.getNomePai: String;
begin
  Result := _nomepai;
end;

function TPessoaF.getNumeroConta: String;
begin
  Result := _numeroconta;
end;

function TPessoaF.getNumeroCTPS: String;
begin
  Result := _numeroctps;
end;

function TPessoaF.getOrgaoRG: String;
begin
  Result := _orgaorg;
end;

function TPessoaF.getPIS: String;
begin
  Result := _pis;
end;

function TPessoaF.getRG: String;
begin
  Result := _rg;
end;

function TPessoaF.getSerieCTPS: String;
begin
  Result := _seriectps;
end;

function TPessoaF.getTipoConta: String;
begin
  Result := _tipoconta;
end;

function TPessoaF.getTipoDoc: String;
begin
  Result := _tipodoc;
end;

function TPessoaF.getUFCTPS: String;
begin
  Result := _ufctps;
end;

function TPessoaF.getUFNatural: String;
begin
  Result := _ufnatural;
end;

function TPessoaF.getUFRG: String;
begin
  Result := _ufrg;
end;

function TPessoaF.getValidadeCNH: TDate;
begin
  Result := _validadecnh;
end;

procedure TPessoaF.setAgencia(const Value: String);
begin
  _codigoagencia := Value;
end;

procedure TPessoaF.setAlias(const Value: String);
begin
  _alias := Value;
end;

procedure TPessoaF.setBanco(const Value: String);
begin
  _codigobanco := Value;
end;

procedure TPessoaF.setCategoriaCNH(const Value: String);
begin
  _categoriacnh := Value;
end;

procedure TPessoaF.setCNH(const Value: String);
begin
  _cnh := Value;
end;

procedure TPessoaF.setCNHRegistro(const Value: String);
begin
  _cnhregistro := Value;
end;

procedure TPessoaF.setCNHUF(const Value: String);
begin
  _cnhuf := Value;
end;

procedure TPessoaF.setCodigoCNH(const Value: String);
begin
  _codcnh := Value;
end;

procedure TPessoaF.setCPF(const Value: String);
begin
  _cpf := Value;
end;

procedure TPessoaF.setCpfCnpjFavorecido(const Value: String);
begin
  _cpfcnpjfavorecido := Value;
end;

procedure TPessoaF.setDataPrimeiraCN(const Value: TDate);
begin
  _dataprimeiracnh := Value;
end;

procedure TPessoaF.setDataRG(const Value: TDate);
begin
  _datarg := Value;
end;

procedure TPessoaF.setDtNascimento(const Value: TDate);
begin
  _nascimento := Value;
end;

procedure TPessoaF.setEmissaoCNH(const Value: TDate);
begin
  _emissaoCNH := value;
end;

procedure TPessoaF.setEstadoCivil(const Value: String);
begin
  _estadocivil := Value;
end;

procedure TPessoaF.setFavorecido(const Value: String);
begin
  _favorecido := Value;
end;

procedure TPessoaF.setForma(const Value: String);
begin
  _forma := Value;
end;

procedure TPessoaF.setNaturalidade(const Value: String);
begin
  _naturalidade := Value;
end;

procedure TPessoaF.setNome(const Value: String);
begin
  _nome := Value;
end;

procedure TPessoaF.setNomeConjuge(const Value: String);
begin
  _nomeconjuge := Value;
end;

procedure TPessoaF.setNomeMae(const Value: String);
begin
  _nomemae := Value;
end;

procedure TPessoaF.setNomePai(const Value: String);
begin
  _nomepai := Value;
end;

procedure TPessoaF.setNumeroConta(const Value: String);
begin
  _numeroconta := Value;
end;

procedure TPessoaF.setNumeroCTPS(const Value: String);
begin
  _numeroctps := Value;
end;

procedure TPessoaF.setOrgaoRG(const Value: String);
begin
  _orgaorg := Value;
end;

procedure TPessoaF.setPIS(const Value: String);
begin
  _pis := Value;
end;

procedure TPessoaF.setRG(const Value: String);
begin
  _rg := Value;
end;

procedure TPessoaF.setSerieCTPS(const Value: String);
begin
  _seriectps := Value;
end;

procedure TPessoaF.setTipoConta(const Value: String);
begin
  _tipoconta := Value;
end;

procedure TPessoaF.setTipoDoc(const Value: String);
begin
  _tipodoc := Value;
end;

procedure TPessoaF.setUFCTPS(const Value: String);
begin
  _ufctps := Value;
end;

procedure TPessoaF.setUFNatural(const Value: String);
begin
  _ufnatural := Value;
end;

procedure TPessoaF.setUFRG(const Value: String);
begin
  _ufrg := Value;
end;

procedure TPessoaF.setValidadeCNH(const Value: TDate);
begin
  _validadecnh := Value;
end;

end.
