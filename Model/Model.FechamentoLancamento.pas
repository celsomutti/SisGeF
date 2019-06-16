unit Model.FechamentoLancamento;

interface
  type
    TFechamentoLancamento = class
    private
      FLancamento: Integer;
      FExtrato: Integer;
    public
      property Lancamento: Integer read FLancamento write FLancamento;
      property Extrato: Integer read FExtrato write FExtrato;
      constructor Create(); overload;
      constructor Create(pFLancamemto: Integer; pFExtrato: Integer); overload;
    end;

implementation

{ TFechamentoLancamento }

constructor TFechamentoLancamento.Create;
begin
  inherited Create;
end;

constructor TFechamentoLancamento.Create(pFLancamemto: Integer; pFExtrato: Integer);
begin
  FLancamento := pFLancamemto;
  FExtrato := pFExtrato;
end;
end.
