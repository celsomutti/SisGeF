unit Model.Produtos;

interface
  type
    TProdutos = class
    private
    var
      FCodigo: String;
      FDescricao: String;
      FDiario: String;
      FLog: String;
    public
      property Codigo: String read FCodigo write FCodigo;
      property Descricao: String read FDescricao write FDescricao;
      property Diario: String read FDiario write FDiario;
      property Log: String read FLog write FLog;
      constructor Create; overload;
      constructor Create(pFCodigo: String; pFDescricao: String; pFDiario: String; pFLog: String); overload;
    end;

implementation

constructor TProdutos.Create;
begin
  inherited Create;
end;

constructor TProdutos.Create(pFCodigo: string; pFDescricao: string; pFDiario: string; pFLog: string);
begin
  FCodigo := pFCodigo;
  FDescricao := pFDescricao;
  FDiario := pFDiario;
  FLog := pFLog;
end;

end.
