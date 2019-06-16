unit Model.BancaVA;

interface
  type
    TBancaVA = class
    private
    var
      FId: Integer;
      FCodigo: Integer;
      FDistribuidor: Integer;
      FNome: String;
      FCEP: String;
      FEndereco: String;
      FComplemento: String;
      FBairro: String;
      FCidade: String;
      FEstado: String;
      FOrdem: String;
      FLog: String;
    public
      property ID: Integer read FId write FId;
      property Codigo: Integer read FCodigo write FCodigo;
      property Distribuidor: Integer read FDistribuidor write FDistribuidor;
      property Nome: String read FNome write FNome;
      property CEP: String read FCEP write FCEP;
      property Endereco: String read FEndereco write FEndereco;
      property Complemento: String read FComplemento write FComplemento;
      property Bairro: String read FBairro write FBairro;
      property Cidade: String read FCidade write FCidade;
      property Ordem: String read FOrdem write FOrdem;
      property Estado: String read FEstado write FEstado;
      property Log: String read FLog write FLog;
      constructor Create; overload;
      constructor Create(pFId: Integer; pFCodigo: Integer; pFDistribuidor: Integer; pFNome: String; pFCEP: String;
                         pFEndereco: String; pFComplemento: String; pFBairro: String; pFCidade: String;
                         pFEstado: String; pFOrdem: String; pFLog: String); overload;

    end;

implementation

constructor TBancaVA.Create;
begin
  inherited Create;
end;

constructor TBancaVA.Create(pFId: Integer; pFCodigo: Integer; pFDistribuidor: Integer; pFNome: string; pFCEP: string;
                            pFEndereco: string; pFComplemento: string; pFBairro: string; pFCidade: string; pFEstado: string;
                            pFOrdem: String; pFLog: string);
begin
  FId := pFId;
  FCodigo := pFCodigo;
  FDistribuidor := pFDistribuidor;
  FNome := pFNome;
  FCEP := pFCEP;
  FEndereco := pFEndereco;
  FComplemento := pFComplemento;
  FBairro := pFBairro;
  FCidade := pFCidade;
  FEstado := pFEstado;
  FOrdem := pFOrdem;
  FLog := pFLog;
end;

end.
