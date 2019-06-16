unit Model.FaixaVerba;

interface
  type
    TFaixaVerba = class
    private
    var
      FID: System.Integer;
      FFaixa: System.Integer;
      FVerba: System.Double;
      FLog: System.string;
    public
      property ID: System.Integer read FID write FID;
      property Faixa: System.Integer read FFaixa write FFaixa;
      property Verba: System.Double read FVerba write FVerba;
      property Log: System.string read FLog write FLog;
      constructor Create; overload;
      constructor Create(pFID: System.Integer; pFFaixa: System.Integer; pFVerba: System.Double; pFLog: System.string); overload;
    end;

implementation

constructor TFaixaVerba.Create;
begin
  inherited Create;
end;

constructor TFaixaVerba.Create(pFID: Integer; pFFaixa: Integer; pFVerba: Double; pFLog: string);
begin
  FID := pFID;
  FFaixa := FFaixa;
  FVerba := pFVerba;
  FLog := pFLog;
end;


end.
