unit Model.InventarioProdutosVA;

interface
  type
  TInventarioProdutosVA = class
  private
  var
    FID: Integer;
    FProduto: Integer;
    FData: TDate;
    FQtde: Double;
    FLog: String;
  public
    property ID: Integer read FID write FID;
    property Produto: Integer read FProduto write FProduto;
    property Data: TDate read FData write FData;
    property Qtde: Double read FQtde write FQtde;
    property Log: String read FLog write FLog;
    constructor Create; overload;
    constructor Create(pFID: Integer; pFProduto: Integer; pFData: TDate; pFQtde: Double; pFLog: String); overload;
  end;

implementation

constructor TInventarioProdutosVA.Create;
begin
  inherited Create;
end;

constructor TInventarioProdutosVA.Create(pFID: Integer; pFProduto: Integer; pFData: TDate; pFQtde: Double; pFLog: String);
begin
  FID := pFID;
  FProduto := pFProduto;
  FData := pFData;
  FQtde := pFQtde;
  FLog := pFLog;
end;

end.
