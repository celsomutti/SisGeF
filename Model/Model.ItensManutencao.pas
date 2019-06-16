unit Model.ItensManutencao;

interface
  type
    TItensManutencao = class
    private
    var
      FID: Integer;
      FDescricao: String;
      FInsumo: Integer;
      FLog: String;
    public
      property ID: Integer read FID write FID;
      property Descricao: String read FDescricao write FDescricao;
      property Insumo: Integer read FInsumo write FInsumo;
      property Log: String read FLog write FLog;
      constructor Create; overload;
      constructor Create(pFID: Integer; pFDescricao: String; pFInsumo: Integer; pFLog: String); overload;
    end;

implementation

constructor TItensManutencao.Create;
begin
  inherited Create;
end;

constructor TItensManutencao.Create(pFID: Integer; pFDescricao: String; pFInsumo: Integer; pFLog: String);
begin
  FID := pFID;
  FDescricao := pFDescricao;
  FInsumo := pFInsumo;
  FLog := pFLog;
end;

end.
