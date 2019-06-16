unit Model.DistribuidorVA;

interface
  type
    TDistribuidorVA = class
    private
    var
      FId: Integer;
      FCodigo: Integer;
      FNome: String;
      FLog: String;
    public
      property ID: Integer read FId write FId;
      property Codigo: Integer read FCodigo write FCodigo;
      property Nome: String read FNome write FNome;
      property Log: String read FLog write FLog;
      constructor Create; overload;
      constructor Create(pFId: Integer; pFCodigo: Integer; pFNome: String; pFLog: String); overload;

    end;

implementation

constructor TDistribuidorVA.Create;
begin
  inherited Create;
end;

constructor TDistribuidorVA.Create(pFId: Integer; pFCodigo: Integer; pFNome: string; pFLog: string);
begin
  FId := pFId;
  FCodigo := pFCodigo;
  FNome := pFNome;
  FLog := pFLog;
end;

end.
