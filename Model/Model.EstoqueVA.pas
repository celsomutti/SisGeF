unit Model.EstoqueVA;

interface

  type
  TEstoqueVA = class
  private
  var
    FID: Integer;
    FProduto: Integer;
    FData: TDate;
    FQtde: Double;
    FUnitario: Double;
    FTotal: Double;
    FLog: String;
  public
    property ID: Integer read FID write FID;
    property Produto: Integer read FProduto write FProduto;
    property Data: TDate read FData write FData;
    property Qtde: Double read FQtde write FQtde;
    property Unitario: Double read FUnitario write FUnitario;
    property Total: Double read FTotal write FTotal;
    property Log: String read FLog write FLog;
    constructor Create; overload;
    constructor Create(pFID: Integer; pFProduto: Integer; pFData: TDate; pFQtde: Double; pFUnitario: Double; pFTotal: Double; pFLog: String); overload;
  end;

implementation

constructor TEstoqueVA.Create;
begin
  inherited Create;
end;

constructor TEstoqueVA.Create(pFID, pFProduto: Integer; pFData: TDate; pFQtde, pFUnitario, pFTotal: Double; pFLog: String);
begin
  FID := pFID;
  FProduto := pFProduto;
  FData := pFData;
  FQtde := pFQtde;
  FUnitario := pFUnitario;
  FTotal := pFTotal;
  FLog := pFLog;
end;

end.
