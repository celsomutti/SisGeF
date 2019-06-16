unit Model.StatusCadastro;

interface
  type
    TStatusCadastro = class
    private
      FID: System.Integer;
      FDescricao: System.string;
      FAtivo: System.Boolean;
      FLog: System.string;
    public
      property ID: System.Integer read FID write FID;
      property Descricao: System.string read FDescricao write FDescricao;
      property Ativo: System.Boolean read FAtivo write FAtivo;
      property Log: System.string read FLog write Flog;
      constructor Create; overload;
      constructor Create(pFID: System.Integer; pFDescricao: System.string; pFAtivo: system.Boolean; pFLog: System.string); overload;
    end;

implementation

constructor TStatusCadastro.Create;
begin
  inherited Create;
end;

constructor TStatusCadastro.Create(pFID: Integer; pFDescricao: string; pFAtivo: Boolean; pFLog: string);
begin
  FID := pFID;
  FDescricao := pFDescricao;
  FAtivo := pFAtivo;
  FLog := pFLog;
end;

end.
