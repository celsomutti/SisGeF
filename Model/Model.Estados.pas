unit Model.Estados;

interface
  type
    TEstados = class
    private
      FUF: System.string;
      FNome: System.string;
    public
      property UF: System.String read FUF write FUF;
      property Nome: System.string read FNome write FNome;
      constructor Create; overload;
      constructor Create(pFUF: System.String; pFNome: System.string); overload;
    end;

implementation

constructor TEstados.Create;
begin
  inherited Create;
end;

constructor TEstados.Create(pFUF: String; pFNome: string);
begin
  FUF := pFUF;
  FNome := pFNome;
end;

end.
