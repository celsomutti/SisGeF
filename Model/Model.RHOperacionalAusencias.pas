unit Model.RHOperacionalAusencias;

interface
  type
  TRHOperacionalAusencias = class
  private
  var
    FID: Integer;
    FCadastro: Integer;
    FData: System.TDate;
    FStatusOperacao: String;
    FObs: String;
    FIDReferencia: Integer;
    FLog: String;
  public
    property ID: Integer read FID write FID;
    property Data: System.TDate read FData write FData;
    property Cadastro: Integer read FCadastro write FCadastro;
    property StatusOperacao: String read FStatusOperacao write FStatusOperacao;
    property Obs: String read FObs write FObs;
    property IDReferencia: Integer read FIDReferencia write FIDReferencia;
    property Log: String read FLog write FLog;
    constructor Create; overload;
    constructor Create(pFID: Integer; pFData: System.TDate; pFCadastro: Integer; pFStatusOperacao: String;
                       pFObs: String; pFIDReferencia: Integer; pFLog: String); overload;
  end;

implementation

constructor TRHOperacionalAusencias.Create;
begin
  inherited Create;
end;

constructor TRHOperacionalAusencias.Create(pFID: Integer; pFData: System.TDate; pFCadastro: Integer; pFStatusOperacao: String;
                                           pFObs: String; pFIDReferencia: Integer; pFLog: String);
begin
  FID := pFID;
  FData := pFData;
  FCadastro := pFCadastro;
  FStatusOperacao := pFStatusOperacao;
  FObs := pFObs;
  FIDReferencia := pFIDReferencia;
  FLog := pFLog;
end;
end.
