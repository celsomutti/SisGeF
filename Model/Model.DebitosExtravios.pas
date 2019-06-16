unit Model.DebitosExtravios;

interface
  type
    TDebitosExtravios = class
    private
      FCodigo: Integer;
      FExtrato: Integer;
    public
      property Codigo: Integer read FCodigo write FCodigo;
      property Extrato: Integer read FExtrato write FExtrato;
      constructor Create(); overload;
      constructor Create(pFCodigo: Integer; pFExtrato: Integer); overload;
    end;

implementation

{ TDebitosExtravios }

constructor TDebitosExtravios.Create;
begin
  inherited Create;
end;

constructor TDebitosExtravios.Create(pFCodigo: Integer; pFExtrato: Integer);
begin
  FCodigo := pFCodigo;
  FExtrato := pFExtrato;
end;

end.
