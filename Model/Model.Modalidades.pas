unit Model.Modalidades;

interface
  type
    TModalidades = class
    private
      FCodigo: Integer;
      FDescricao: String;
      FOperacao: String;
      FLog: String;
    public
      property Codigo: Integer read FCodigo write FCodigo;
      property Descricao: String read FDescricao write FDescricao;
      property Operacao: String read FOperacao write FOperacao;
      property Log: String read FLog write FLog;
      constructor Create; overload;
      constructor Create(pFCodigo: Integer; pFDescricao: String; pFOperacao: String; pFLog: String); overload;
    end;
implementation

constructor TModalidades.Create;
begin
  inherited Create;
end;

constructor TModalidades.Create(pFCodigo: Integer; pFDescricao: string; pFOperacao: string; pFLog: string);
begin
  FCodigo := pFCodigo;
  FDescricao := pFDescricao;
  FOperacao := pFOperacao;
  FLog := pFLog;
end;

end.
