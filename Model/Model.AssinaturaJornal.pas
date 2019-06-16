unit Model.AssinaturaJornal;

interface
  type
    TAssinaturaJornal = class
    private
    var
      FId: Integer;
      FCodigo: String;
      FModalidade: Integer;
      FProduto: String;
      FOrdem: Integer;
      FQtde: Integer;
      FNome: String;
      FTipoLogradouro : String;
      FNomeLogradouro: String;
      FNumeroLogradouro: String;
      FComplemento: String;
      FBairro: String;
      FCidade: String;
      FEstado: String;
      FCEP: String;
      FReferencia: String;
      FRoteiro: String;
      FLog: String;
    public
      property ID: integer read FId write FId;
      property Codigo: String read FCodigo write FCodigo;
      property Modalidade: Integer read FModalidade write FModalidade;
      property Produto: String read FProduto write FProduto;
      property Ordem: Integer read FOrdem write FOrdem;
      property Qtde: Integer read FQtde write FQtde;
      property Nome: String read FNome write FNome;
      property TipoLogradouro: String read FTipoLogradouro write FTipoLogradouro;
      property NomeLogradouro: String read FNomeLogradouro write FNomeLogradouro;
      property NumeroLogradouro: String read FNumeroLogradouro write FNumeroLogradouro;
      property Complemento: String read FComplemento write FComplemento;
      property Bairro: String read FBairro write FBairro;
      property Cidade: String read FCidade write FCidade;
      property Estado: String read FEstado write FEstado;
      property CEP: String read FCEP write FCEP;
      property Referencia: String read FReferencia write FReferencia;
      property Roteiro: String read FRoteiro write FRoteiro;
      property Log: String read FLog write FLog;
      constructor Create; overload;
      constructor Create(pFId: Integer; pFCodigo: String;pFModalidade: Integer; pFProduto:String; pFOrdem: Integer; pFQtde: Integer;
                         pFNome: String; pFTipoLogradouro : String; pFNomeLogradouro: String; pFNumeroLogradouro: String;
                         pFComplemento: String; pFBairro: String; pFCidade: String; pFEstado: String; pFCEP: String;
                         pFReferencia: String; pFRoteiro: String; pFLog: String); overload;


    end;

implementation

constructor TAssinaturaJornal.Create;
begin
  inherited Create;
end;

constructor TAssinaturaJornal.Create(pFId: Integer; pFCodigo: String; pFModalidade: Integer; pFProduto: string; pFOrdem: Integer;
                                     pFQtde: Integer; pFNome: string; pFTipoLogradouro: string; pFNomeLogradouro: string;
                                     pFNumeroLogradouro: string; pFComplemento: string; pFBairro: string; pFCidade: string;
                                     pFEstado: string; pFCEP: string; pFReferencia: string; pFRoteiro: string; pFLog: string);
begin
  FId :=  pFId;
  FCodigo := pFCodigo;
  FModalidade := pFModalidade;
  FProduto := pFProduto;
  FOrdem := pFOrdem;
  FQtde := pFQtde;
  FNome := pFNome;
  FTipoLogradouro := pFTipoLogradouro;
  FNomeLogradouro :=  pFNomeLogradouro;
  FNumeroLogradouro := pFNumeroLogradouro;
  FComplemento := pFComplemento;
  FBairro := pFBairro;
  FCidade := pFCidade;
  FEstado := pFEstado;
  FCEP := pFCEP;
  FReferencia := pFReferencia;
  FRoteiro := pFRoteiro;
  FLog := FLog;
end;

end.
