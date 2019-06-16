unit Model.PenalizacaoAtrasos;

interface
  type TPenalizacaoAtrasos = class
  private
  var
    FId: System.Integer;
    FData: System.TDate;
    FAtraso: System.Integer;
    FValor: System.Double;
    FPercentual: System.Double;
    FLog: System.string;
  public
    property ID: System.Integer read FId write FId;
    property Data: System.TDate read FData write FData;
    property Atraso: System.Integer read FAtraso write FAtraso;
    property Valor: System.Double read FValor write FValor;
    property Percentual: System.Double read FPercentual write FPercentual;
    property Log: System.string read FLog write FLog;
    constructor Create; overload;
    constructor Create(pFId: System.Integer; pFData: System.TDate; pFAtraso: System.Integer; pFValor: System.Double;
                       pFPercentual: System.Double; pFLog: System.string); overload;

  end;
implementation

constructor TPenalizacaoAtrasos.Create;
begin
  inherited Create;
end;

constructor TPenalizacaoAtrasos.Create(pFId: System.Integer; pFData: System.TDate; pFAtraso: System.Integer; pFValor: System.Double;
                                       pFPercentual: System.Double; pFLog: System.string);
begin
  FId := pFId;
  FData := pFData;
  FAtraso := pFAtraso;
  FValor := pFValor;
  FPercentual := pFPercentual;
  FLog := pFLog;
end;

end.
