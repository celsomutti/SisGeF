unit Model.Departamentos;

interface
  type
    TDepartamentos = class
    private
      FCodigo: System.Integer;
      FDEscricao: System.string;
      FLog: System.string;
    public
      property Codigo: System.Integer read FCodigo write FCodigo;
      property Descricao: System.string read FDescricao write FDescricao;
      property Log: System.string read FLog write FLog;
      constructor Create; overload;
      constructor Create(pFCodigo: System.Integer; pFDescricao: System.string; pFLog: System.string); overload;
    end;

implementation

constructor TDepartamentos.Create;
begin
  inherited Create;
end;

constructor TDepartamentos.Create(pFCodigo: Integer; pFDescricao: string; pFLog: string);
begin
  FCodigo := pFCodigo;
  FDescricao := pFDescricao;
  FLog := pFLog;
end;

end.
