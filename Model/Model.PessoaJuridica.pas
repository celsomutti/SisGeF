unit Model.PessoaJuridica;

interface
  type
    TPessoaJuridica = class
    private
      FRazao: System.String;
      FFantasia: System.String;
      FCNPJ: System.String;
      FIEstadual: System.String;
      FIEstadualST: System.String;
      FIMunicipal: System.String;
      FCNAE: System.String;
      FCRT: System.Integer;
      FSUFRAMA: System.String;
      FResponsavel: System.Integer;
    public
      property Razao: String read FRazao write FRazao;
      property Fantasia: String read FFantasia write FFantasia;
      property CNPJ: String read FCNPJ write FCNPJ;
      property IE: String read FIEstadual write FIEstadual;
      property IEST: String read FIEstadualST write FIEstadualST;
      property IM: String read FIMunicipal write FIMunicipal;
      property CNAE: String read FCNAE write FCNAE;
      property CRT: Integer read FCRT write FCRT;
      property SUFRAMA: String read FSUFRAMA write FSUFRAMA;
      property Responsavel: Integer read FResponsavel write FResponsavel;
    end;

implementation

end.
