unit Model.ProdutosVA;

interface
  type
    TProdutosVA = class
    private
    var
      FID: Integer;
      FCodigo: String;
      FDescricao: String;
      FPadrao: Integer;
      FDiario: SmallInt;
      FCobranca: Double;
      FVenda: Double;
      FBarras: String;
      FLog: String;
    public
      property ID: Integer read FID write FID;
      property Codigo: String read FCodigo write FCodigo;
      property Descricao: String read FDescricao write FDescricao;
      property Padrao: Integer read FPadrao write FPadrao;
      property Diario: SmallInt read FDiario write FDiario;
      property Cobranca: Double read FCobranca write FCobranca;
      property Venda: Double read FVenda write FVenda;
      property Barras: String read FBarras write FBarras;
      property Log: String read FLog write FLog;
      constructor Create; overload;
      constructor Create(pFID: Integer; pFCodigo: String; pFDescricao: String; pFPadrao: Integer; pFDiario: SmallInt;
                  pFCobranca: Double; pFVenda: Double; pFBarras: String; pFLog: String); overload;
    end;

implementation

constructor TProdutosVA.Create;
begin
  inherited Create;
end;

constructor TProdutosVA.Create(pFID: Integer; pFCodigo: String; pFDescricao: String; pFPadrao: Integer; pFDiario: SmallInt;
                               pFCobranca: Double; pFVenda: Double; pFBarras: String; pFLog: String);
begin
  FID := pFID;
  FCodigo := pFCodigo;
  FDescricao := pFDescricao;
  FPadrao := pFPadrao;
  FDiario := pFDiario;
  FCobranca := pFCobranca;
  FVenda:= pFVenda;
  FBarras := pFBarras;
  FLog := pFLog;
end;
end.
