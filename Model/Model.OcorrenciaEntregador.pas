unit Model.OcorrenciaEntregador;

interface
  type
    TOcorrenciaEntregador = class
    private
      FID: Integer;
      FReferencia: Integer;
      FData: TDate;
      FEntregador: Integer;
      FValor: Double;
      FLog: String;
    public
      property ID: Integer read FID write FID;
      property Referencia: Integer read FReferencia write FReferencia;
      property Data: TDate read FData write FData;
      property Entregador: Integer read FEntregador write FEntregador;
      property Valor: Double read FValor write FValor;
      property Log: String read FLog write FLog;
      constructor Create; overload;
      constructor Create(pFID: Integer; pFReferencia: Integer; pFData: TDate; pFEntregador: Integer; pFValor: Double; pFLog: String);
                  overload;
    end;

implementation

constructor TOcorrenciaEntregador.Create;
begin
  inherited;
end;

constructor TOcorrenciaEntregador.Create(pFID: Integer; pFReferencia: Integer; pFData: TDate; pFEntregador: Integer; pFValor: Double;
            pFLog: string);
begin
  FID := pFID;
  FReferencia := pFReferencia;
  FData := pFData;
  FEntregador := pFEntregador;
  FValor := pFValor;
  FLog := pFLog;
end;


end.
