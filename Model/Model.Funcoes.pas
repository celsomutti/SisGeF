unit Model.Funcoes;

interface
  type
    TFuncoes = class
    private
      FID: System.Integer;
      FDescricao: System.string;
      FLog: System.string;
    public
      property ID: System.integer read FID write FID;
      property Descricao: System.string read FDEscricao write FDescricao;
      property Log: System.string read FLog write FLog;
      constructor Create; overload;
      constructor Create(pFID: System.Integer; pFDescricao: System.string; pFLog: System.string); overload;
    end;

implementation

constructor TFuncoes.Create;
begin
  inherited Create;
end;

constructor TFuncoes.Create(pFID: Integer; pFDescricao: string; pFLog: string);
begin
  FID := pFID;
  FDescricao := pFDescricao;
  FLog := pFLog;
end;

end.
