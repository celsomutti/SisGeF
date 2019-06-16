unit Model.FaixaPeso;

interface
  type
    TFaixaPeso = class
    private
    var
      FID: System.Integer;
      FPesoInicial: System.Double;
      FPesoFinal: System.Double;
      FLog: System.string;
    public
      property ID: System.Integer read FID write FID;
      property PesoInicial: System.Double read FPesoInicial write FPesoInicial;
      property PesoFinal: System.Double read FPesoFinal write FPesoFinal;
      property Log: System.string read FLog write FLog;
      constructor Create; overload;
      constructor Create(pFID: System.Integer; pFPesoInicial: System.Double; pFPesoFinal: System.Double; pFLog: System.string);
                  overload;
    end;

implementation

constructor TFaixaPeso.Create;
begin
  inherited Create;
end;

constructor TFaixaPeso.Create(pFID: Integer; pFPesoInicial: Double; pFPesoFinal: Double; pFLog: string);
begin
  FID := pFID;
  FPesoInicial := pFPesoInicial;
  FPesoFinal := pFPesoFinal;
  FLog := pFLog;
end;

end.
