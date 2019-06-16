unit Model.EstoqueInsumos;

interface
  type
    TEstoqueInsumos = class
    private
    var
      FID: Integer;
      FInsumo: Integer;
      FData: System.TDate;
      FQtde: Double;
      FUnitario: Double;
      FTotal: Double;
      FLog: String;
    public
      property ID: Integer read FID write FID;
      property Insumo: Integer read FInsumo write FInsumo;
      property Data: System.TDate read FData write FData;
      property Qtde: Double read FQtde write FQtde;
      property Unitario: Double read FUnitario write FUnitario;
      property Total: Double read FTotal write FTotal;
      property Log: String read FLog write FLog;
      constructor Create; overload;
      constructor Create(pFID: Integer; pFInsumo: Integer; pFData: System.TDate; pFQtde: Double; pFUnitario: Double;
                         pFTotal: Double; pFLog: String); overload;
    end;
implementation

constructor TEstoqueInsumos.Create;
begin
  inherited Create;
end;

constructor TEstoqueInsumos.Create(pFID: Integer; pFInsumo: Integer; pFData: System.TDate; pFQtde: Double; pFUnitario: Double;
                         pFTotal: Double; pFLog: String);
begin
  FID := pFID;
  FInsumo := pFInsumo;
  FData := pFData;
  FQtde := pFQtde;
  FUnitario := pFUnitario;
  FTotal := pFTotal;
  FLog := pFLog;
end;

end.
