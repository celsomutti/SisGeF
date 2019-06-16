unit Model.ConsumoInsumos;

interface
  type
    TConsumoInsumos = class
    private
    var
      FID: Integer;
      FInsumo: Integer;
      FPlaca: String;
      FData: System.TDate;
      FKmConsumo: Double;
      FControle: Integer;
      FConsumo: Double;
      FValor: Double;
      FEstoque: String;
      FLog: String;
    public
      property ID: Integer read FID write FID;
      property Insumo: Integer read FInsumo write FInsumo;
      property Placa: String read FPlaca write FPlaca;
      property Data: System.TDate read FData write FData;
      property KMConsumo: Double read FKmConsumo write FKmConsumo;
      property Controle: Integer read FControle write FControle;
      property Consumo: Double read FConsumo write FConsumo;
      property Valor: Double read FValor write FValor;
      property Estoque: String read FEstoque write FEstoque;
      property Log: String read FLog write FLog;
      constructor Create; overload;
      constructor Create(pFID: Integer; pFInsumo: Integer; pFPlaca: String; pFData: System.TDate;
                  pFKmConsumo: Double; pFControle: Integer; pFConsumo: Double; pFValor: Double; pFEstoque: String;
                  pFLog: String); overload;
    end;


implementation

constructor TConsumoInsumos.Create;
begin
  inherited Create;
end;

constructor TConsumoInsumos.Create(pFID: Integer; pFInsumo: Integer; pFPlaca: String; pFData: System.TDate;
                                   pFKmConsumo: Double; pFControle: Integer; pFConsumo: Double; pFValor: Double; pFEstoque: String;
                                   pFLog: String);
begin
  FID := pFID;
  FInsumo := pFInsumo;
  FPlaca := pFPlaca;
  FData := pFData;
  FKmConsumo := pFKmConsumo;
  FControle := pFControle;
  FConsumo := pFConsumo;
  FValor := pFValor;
  FEstoque := pFEStoque;
  FLog := pFLog;
end;

end.
