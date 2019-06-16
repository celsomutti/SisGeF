unit Model.TipoOcorrenciaJornal;

interface
  type
    TTipoOcorrenciaJornal = class
    private
      FCodigo: Integer;
      FDescricao: String;
    public
      property Codigo: Integer read FCodigo write FCodigo;
      property Descricao: String read FDescricao write FDescricao;
      constructor Create; overload;
      constructor Create(pFCodigo: Integer; pFDescricao: String); overload;
    end;

implementation

constructor TTipoOcorrenciaJornal.Create;
begin
  inherited Create;
end;

constructor TTipoOcorrenciaJornal.Create(pFCodigo: Integer; pFDescricao: string);
begin
  FCodigo := pFCodigo;
  FDescricao := pFDescricao;
end;

end.
