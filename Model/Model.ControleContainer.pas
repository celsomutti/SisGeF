unit Model.ControleContainer;

interface
  type
    TControleContainer = class
    private
    var
      FContainer: String;
      FData: TDate;
      FPeso: Double;
      FValorTotal: Double;
      FVerbaTotal: Double;
      FDestino: Integer;
      FStatus: Integer;
      FLog: String;
    public
      property Container: String read FContainer write FContainer;
      property Data: TDate read FData write FData;
      property Peso: Double read FPeso write FPeso;
      property ValorTotal: Double read FValorTotal write FValorTotal;
      property VerbaTotal: Double read FVerbaTotal write FVerbaTotal;
      property Destino: Integer read FDestino write FDestino;
      property Status: Integer read FStatus write FStatus;
      property Log: String read FLog write FLog;
      constructor Create; overload;
      constructor Create(pFContainer: String; pFData: TDate; pFPeso: Double; pFValorTotal: Double; pFVerbaTotal: Double; pFDestino: Integer; pFStatus: Integer;
                         pFLog: String); overload;


    end;

implementation

{ TControleContainer }

constructor TControleContainer.Create;
begin
  inherited Create;
end;

constructor TControleContainer.Create(pFContainer: String; pFData: TDate; pFPeso, pFValorTotal, pFVerbaTotal: Double; pFDestino, pFStatus: Integer; pFLog: String);
begin
  FContainer := pFContainer;
  FData:= pFData ;
  FPeso:= pFPeso ;
  FValorTotal := pFValorTotal;
  FVerbaTotal := pFVerbaTotal;
  FDestino := pFDestino;
  FStatus := pFStatus;
  FLog := pFLog;
end;

end.
