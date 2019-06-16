unit Model.Cadastro;

interface
  type
    TCadastro = class
      private
      var
        FCodigo: Integer;
        FPessoa: Integer;
        FNome: System.String;
        FAlias: System.string;
        FNascimento: System.TDate;
        FNomePai: System.String;
        FNomeMae: System.String;
        FTipoDoc: String;
        FCPFCNPJ: System.String;
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
        FSexo: System.Integer;
        FCNAE: System.String;
        FCRT: System.Integer;
        FSUFRAMA: System.String;
        FResponsavel: System.Integer;
        FCadastro: TDateTime;
        FUsuario: System.Integer;
        FStatus: Integer;
        FLog: String;
      public
        property Codigo: Integer read FCodigo write FCodigo;
        property Pessoa: integer read FPessoa write FPessoa;
        property Nome: String read FNome write FNome;
        property Alias: String read FAlias write FAlias;
        property Nascimento: TDate read FNascimento write FNascimento;
        property NomePai: String read FNomePai write FNomePai;
        property NomeMae: String read FNomeMae write FNomeMae;
        property TipoDoc: String read FTipoDoc write FTipoDoc;
        property CPFCNPJ: String read FCPFCNPJ write FCPFCNPJ;
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
        property Sexo: Integer read FSexo write FSexo;
        property CNAE: String read FCNAE write FCNAE;
        property CRT: Integer read FCRT write FCRT;
        property SUFRAMA: String read FSUFRAMA write FSUFRAMA;
        property Responsavel: Integer read FResponsavel write FResponsavel;
        property Cadastro: TDateTime read FCadastro write FCadastro;
        property Usuario: Integer read FUsuario write FUsuario;
        property Status: Integer read  FStatus write FStatus;
        property Log: String read FLog write FLog;
        constructor Create; overload;
        constructor Create(pFCodigo: Integer; pFPessoa: Integer; pFNome: System.String; pFAlias: System.string;
                           pFNascimento: System.TDate; pFNomePai: System.String; pFNomeMae: System.String; pFTipoDoc: String;
                           pFCPFCNPJ: System.String; pFRG: System.String; pFExpedidor: System.String; pFUFRG: System.String;
                           pFDataRG: System.TDate; pFNaturalidade: System.String; pFUFNaturalidade: System.String;
                           pFCNH: System.String; pFRegistroCNH: System.String; pFValidadeCNH: System.TDate;
                           pFCategoriaCNH: System.String; pFPrimeiraCNH: System.TDate; pFPIS: System.String; pFCTPS: System.String;
                           pFSerieCTPS: System.String; pFUFCTPS: System.String; pFUFCNH: System.String;
                           pFEstadoCivil: System.String; pFTituloEleitor: System.String; pFZonaEleitoral: System.string;
                           pFSecaoEleitoral: System.string; pFMunicipioEleitoral: System.string; pFUFEleitoral: System.string;
                           pFReservista: System.String; pFSexo: Integer; pFCNAE: System.String; pFCRT: System.Integer;
                           pFSUFRAMA: System.String; pFResponsavel: System.Integer; pFCadastro: TDateTime;
                           pFUsuario: System.Integer; pFStatus: Integer; pFLog: String); overload;

    end;

implementation

constructor TCadastro.Create;
begin
  inherited Create;
end;

constructor TCadastro.Create(pFCodigo: Integer; pFPessoa: Integer; pFNome: string; pFAlias: string;
                             pFNascimento: TDate; pFNomePai: string; pFNomeMae: string; pFTipoDoc: string; pFCPFCNPJ: string;
                             pFRG: string; pFExpedidor: string; pFUFRG: string; pFDataRG: TDate; pFNaturalidade: string;
                             pFUFNaturalidade: string; pFCNH: string; pFRegistroCNH: string; pFValidadeCNH: TDate;
                             pFCategoriaCNH: string; pFPrimeiraCNH: TDate; pFPIS: string; pFCTPS: string; pFSerieCTPS: string;
                             pFUFCTPS: string; pFUFCNH: string; pFEstadoCivil: string; pFTituloEleitor: string;
                             pFZonaEleitoral: string; pFSecaoEleitoral: string; pFMunicipioEleitoral: string; pFUFEleitoral: string;
                             pFReservista: string; pFSexo: Integer; pFCNAE: string; pFCRT: Integer; pFSUFRAMA: string;
                             pFResponsavel: Integer; pFCadastro: TDateTime; pFUsuario: Integer; pFStatus: Integer; pFLog: string);
begin
  FCodigo  := pFCodigo;
  FPessoa := pFPessoa;
  FNome := pFNome;
  FAlias := pFAlias;
  FNascimento := pFNascimento;
  FNomePai := pFNomePai;
  FNomeMae := pFNomeMae;
  FTipoDoc := pFTipoDoc;
  FCPFCNPJ := pFCPFCNPJ;
  FRG := pFRG;
  FExpedidor := pFExpedidor;
  FUFRG := pFUFRG;
  FDataRG := pFDataRG;
  FNaturalidade := pFNaturalidade;
  FUFNaturalidade := pFUFNaturalidade;
  FCNH := pFCNH;
  FRegistroCNH := pFRegistroCNH;
  FValidadeCNH := pFValidadeCNH;
  FCategoriaCNH := pFCategoriaCNH;
  FPrimeiraCNH := pFPrimeiraCNH;
  FPIS := pFPIS;
  FCTPS := pFCTPS;
  FSerieCTPS := pFSerieCTPS;
  FUFCTPS := pFUFCTPS;
  FUFCNH := pFUFCNH;
  FEstadoCivil := pFEstadoCivil;
  FTituloEleitor := pFTituloEleitor;
  FZonaEleitoral := pFZonaEleitoral;
  FSecaoEleitoral := pFSecaoEleitoral;
  FMunicipioEleitoral := pFMunicipioEleitoral;
  FUFEleitoral := pFUFEleitoral;
  FReservista := pFReservista;
  FSexo := pFSexo;
  FCNAE := pFCNAE;
  FCRT := pFCRT;
  FSUFRAMA := pFSUFRAMA;
  FResponsavel := pFResponsavel;
  FCadastro := pFCadastro;
  FUsuario := pFUsuario;
  FStatus := pFStatus;
  FLog := pFLog;
end;

end.
