unit Model.ControleBaixasTFO;

interface
  type
    TControleBaixasTFO = class
    private
      FId : Integer;
      FData: TDate;
      FStatus: Integer;
      FLog: String;
    public
      property Id : Integer read FId write FId;
      property Data: TDate read FData write FData;
      property Status: Integer  read FStatus write FStatus;
      property Log: String read FLog write FLog;
      constructor Create; overload;
      constructor Create(pFId : Integer; pFData: TDate; pFStatus: Integer; pFLog: String); overload;
    end;

implementation

{ TControleBaixasTFO }

constructor TControleBaixasTFO.Create;
begin
  inherited Create;
end;

constructor TControleBaixasTFO.Create(pFId: Integer; pFData: TDate; pFStatus: Integer; pFLog: String);
begin
  FId := pFId;
  FData := pFData;
  FStatus := pFStatus;
  FLog := pFLog;
end;

end.
