unit Model.ApontamentoOperacional;

interface
  type
  TApontamentoOperacional = class
  private
  var
    FID: Integer;
    FEntregador: Integer;
    FRoteiroAntigo: String;
    FData: System.TDate;
    FStatusOperacao: String;
    FRoteiroNovo: String;
    FObs: String;
    FPlanilha: String;
    FIDReferencia: Integer;
    FDataReferencia: System.TDate;
    FLog: String;
  public
    property ID: Integer read FID write FID;
    property Entregador: Integer read FEntregador write FEntregador;
    property RoteiroAntigo: String read FRoteiroAntigo write FRoteiroAntigo;
    property Data: System.TDate read FData write FData;
    property StatusOperacao: String read FStatusOperacao write FStatusOperacao;
    property RoteiroNovo: String read FRoteiroNovo write FRoteiroNovo;
    property Obs: String read FObs write FObs;
    property Planilha: String read FPlanilha write FPlanilha;
    property IDReferencia: Integer read FIDReferencia write FIDReferencia;
    property DataReferencia: System.TDate read FDataReferencia write FDataReferencia;
    property Log: String read FLog write FLog;
    constructor Create; overload;
    constructor Create(pFID: Integer; pFEntregador: Integer;
      pFRoteiroAntigo: String; pFData: System.TDate; pFStatusOperacao: String;
      pFRoteiroNovo: String; pFObs: String; pFPlanilha: String;
      pFIDReferencia: Integer; pFDataReferencia: TDate;
      pFLog: String); overload;
  end;

implementation

constructor TApontamentoOperacional.Create;
begin
  inherited Create;
end;

constructor TApontamentoOperacional.Create(pFID: Integer; pFEntregador: Integer;
  pFRoteiroAntigo: String; pFData: System.TDate; pFStatusOperacao: String;
  pFRoteiroNovo: String; pFObs: String; pFPlanilha: String;
  pFIDReferencia: Integer; pFDataReferencia: TDate; pFLog: String);
begin
  FID := pFID;
  FEntregador := pFEntregador;
  FRoteiroAntigo := pFRoteiroAntigo;
  FData := pFData;
  FStatusOperacao := pFStatusOperacao;
  FRoteiroNovo := pFRoteiroNovo;
  FObs := pFObs;
  FPlanilha := pFPlanilha;
  FIDReferencia := pFIDReferencia;
  FDataReferencia := pFDataReferencia;
  FLog := pFLog;
end;

end.
