unit Model.TipoCadastro;

interface
  type
    TTipoCadastro = class
    private
      FCodigo: System.Integer;
      FDescricao: System.string;
      FPessoa: System.Integer;
      FRH: System.Boolean;
      FJornal: System.Boolean;
      FExpressas: System.Boolean;
      FLog: System.string;
    public
      property Codigo: Integer read FCodigo write FCodigo;
      property Descricao: String read FDescricao write FDescricao;
      property Pessoa: Integer read FPessoa write FPessoa;
      property RH: Boolean read FRH write FRH;
      property Jornal: Boolean read FJornal write FJornal;
      property Expressas: Boolean read FExpressas write FExpressas;
      property Log: String read FLog write FLog;
      constructor Create; overload;
      constructor Create(pFCodigo: System.Integer; pFDescricao: System.string; pFPessoa: System.Integer; pFRH: System.Boolean;
                         pFJornal: System.Boolean; pFExpressas: System.Boolean; pFLog: System.string); overload;

    end;

implementation

constructor TTipoCadastro.Create;
begin
  inherited Create;
end;

constructor TTipoCadastro.Create(pFCodigo: Integer; pFDescricao: string; pFPessoa: Integer; pFRH: Boolean; pFJornal: Boolean;
                                 pFExpressas: Boolean; pFLog: string);
begin
  FCodigo := pFCodigo;
  FDescricao := pFDescricao;
  FPessoa := pFPessoa;
  FRH := pFRH;
  FJornal := pFJornal;
  FExpressas := pFExpressas;
  FLog := pFLog;
end;

end.
