unit Model.DestinosTransporte;

interface
  type
    TDestiosTransporte = class
    private
    var
      FDestino: Integer;
      FDescricao: String;
      FLog: String;
    public
      property Destino: Integer read FDestino write FDestino;
      property Descricao: String read FDescricao write FDEscricao;
      property Log: String read FLog write FLog;
      constructor Create; overload;
      constructor Create(pFDestino: Integer; pFDescricao: String; pFLog: String); overload;
    end;

implementation

{ TDestiosTransporte }

constructor TDestiosTransporte.Create;
begin
  inherited Create;
end;

constructor TDestiosTransporte.Create(pFDestino: Integer; pFDescricao, pFLog: String);
begin
  FDestino := pFDestino;
  FDescricao := pFDescricao;
  FLog := pFLog;
end;

end.
