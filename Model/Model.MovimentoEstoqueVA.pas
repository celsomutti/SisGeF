unit Model.MovimentoEstoqueVA;

interface
  type
    TMovimentoEstoqueVA = class
    private
      var
      FID: Integer;
      FData: TDate;
      FProduto: Integer;
      FTIpo: SmallInt;
      FDescricao: String;
      FQuantidade: Double;
      FStatus: Smallint;
      FLog: String;
    public
      property ID: Integer read FID write FID;
      property Data: TDate read FData write FData;
      property Produto: Integer read FProduto write FProduto;
      property Tipo: SmallInt read FTipo write FTipo;
      property Descricao: String read FDescricao write FDescricao;
      property Quantidade: Double read FQuantidade write FQuantidade;
      property Status: SmallInt read FStatus write FStatus;
      property LOG: String read FLog write FLog;
      constructor Creare; overload;
      constructor Create(pFID: Integer; pFData: TDate; pFProduto: Integer; pFTIpo: SmallInt; pFDescricao: String; pFQuantidade: Double; pFStatus: Smallint; pFLog: String);
    end;

implementation

{ TMovimentoEstoqueVA }

constructor TMovimentoEstoqueVA.Creare;
begin
  inherited Create;
end;

constructor TMovimentoEstoqueVA.Create(pFID: Integer; pFData: TDate; pFProduto: Integer; pFTIpo: SmallInt; pFDescricao: String; pFQuantidade: Double; pFStatus: Smallint;
  pFLog: String);
begin
  FID := pFID;
  FData := pFData;
  FProduto := pFProduto;
  FTIpo := pFTIpo;
  FDescricao := pFDescricao;
  FQuantidade := pFQuantidade;
  FStatus := pFStatus;
  FLog := pFLog;
end;

end.
