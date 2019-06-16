unit Model.InsumosTransportes;

interface
  type
    TInsumosTransportes = class
    private
    var
      FID: Integer;
      FDescricao: String;
      FUnidade: String;
      FLog: String;
    public
      property ID: Integer read FID write FID;
      property Descricao: String read FDescricao write FDescricao;
      property Unidade: String read FUnidade write FUnidade;
      property Log: String read FLog write FLog;
      constructor Create; overload;
      constructor Create(pFID: Integer; pFDescricao: String; pFUnidade: String; pFLog: String); overload;
    end;

implementation

constructor TInsumosTransportes.Create;
begin
  inherited Create;
end;

constructor TInsumosTransportes.Create(pFID: Integer; pFDescricao: String; pFUnidade: String; pFLog: String);
begin
  FID := pFID;
  FDescricao := pFDescricao;
  FUnidade := pFUnidade;
  FLog := pFLog;
end;

end.
