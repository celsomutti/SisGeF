unit Model.PessoaFisica;

interface
  type
    TPessoaFisica = class
    private
      FNome: System.String;
      FAlias: System.string;
      FNascimento: System.TDate;
      FNomePai: System.String;
      FNomeMae: System.String;
      FCPF: System.String;
      FRG: System.String;
      FExpedidor: System.String;
      FUFRG: System.String;
      FDataRG: System.TDate;
      FNaturalidade: System.String;
      FUFNaturalidade: System.String;
      FCNH: System.String;
      FRegistroCNH: System.String;
      FValidadeCNH: System.TDate;
      FCategoriaCNH: System.String;
      FPrimeiraCNH: System.TDate;
      FPIS: System.String;
      FCTPS: System.String;
      FSerieCTPS: System.String;
      FUFCTPS: System.String;
      FUFCNH: System.String;
      FEstadoCivil: System.String;
      FTituloEleitor: System.String;
      FZonaEleitoral: System.string;
      FSecaoEleitoral: System.string;
      FMunicipioEleitoral: System.string;
      FUFEleitoral: System.string;
      FReservista: System.String;
    public
      property Nome: String read FNome write FNome;
      property Alias: String read FAlias write FAlias;
      property Nascimento: TDate read FNascimento write FNascimento;
      property NomePai: String read FNomePai write FNomePai;
      property Mae: String read FNomeMae write FNomeMae;
      property CPF: String read FCPF write FCPF;
      property RG: String read FRG write FRG;
      property Expedidor: String read FExpedidor write FExpedidor;
      property UFRG: String read FUFRG write FUFRG;
      property DataRG: TDate read FDataRG write FDataRG;
      property Naturalidade: String read FNaturalidade write FNaturalidade;
      property UFNaturalidade: String read FUFNaturalidade write FNaturalidade;
      property CNH: String read FCNH write FCNH;
      property RegistroCNH: String read FRegistroCNH write FRegistroCNH;
      property ValidadeCNH: TDate read FValidadeCNH write FValidadeCNH;
      property CategoriaCNH: String read FCategoriaCNH write FCategoriaCNH;
      property PrimeiraCNH: TDate read FPrimeiraCNH write FPrimeiraCNH;
      property PIS: String read FPIS write FPIS;
      property CTPS: String read FCTPS write FCTPS;
      property SerieCTPS: String read FSerieCTPS write FSerieCTPS;
      property UFCTPS: String read FUFCTPS write FUFCTPS;
      property UFCNH: String read FUFCNH write FUFCNH;
      property EstadoCivil: String read FEstadoCivil write FEstadoCivil;
      property TituloEleitor: String read FTituloEleitor write FTituloEleitor;
      property ZonaEleitoral: String read FZonaEleitoral write FZonaEleitoral;
      property SecaoEleitoral: String read FSecaoEleitoral write FSecaoEleitoral;
      property MunicipioEleitoral: String read FMunicipioeleitoral write FMunicipioEleitoral;
      property UFEleitoral: String read FUFEleitoral write FUFEleitoral;
      property Reservista: String read FReservista write FReservista;
    end;

implementation

end.
