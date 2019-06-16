unit Model.ParcelamentoRestricao;

interface
  type
    TParcelamentoRestricao = class
    private
    var
      FRestricao : Integer;
      FParcela: Integer;
      FTotalParcelas : Integer;
      FDebitado: Integer;
      FValor: Double;
      FExtrato: Integer;
      FData: TDate;
    public
      property Restricao : Integer read FRestricao write FRestricao;
      property Parcela: Integer read FParcela write FParcela;
      property TotalParcelas : Integer read FTotalParcelas write FTotalParcelas;
      property Debitado: Integer read FDebitado write FDebitado;
      property Extrato: Integer read FExtrato Write FExtrato;
      property Valor: Double read FValor write FValor;
      property Data: TDate read FData write FData;
      constructor Create(); overload;
      constructor Create(PFRestricao : Integer; pFParcela: Integer; pFTotalParcelas : Integer; pFDebitado: Integer; pFValor: Double; pFExtrato: Integer; pFData: TDate); overload;
    end;

implementation

{ TParcelamentoRestricao }

constructor TParcelamentoRestricao.Create;
begin
  inherited Create;
end;

constructor TParcelamentoRestricao.Create(PFRestricao, pFParcela, pFTotalParcelas, pFDebitado: Integer; pFValor: Double; pFExtrato: Integer; pFData: TDate);
begin
  FRestricao := pFRestricao;
  FParcela := pFParcela;
  FTotalParcelas := pFTotalParcelas;
  FDebitado := pFDebitado;
  FValor := pFValor;
  FExtrato := PFExtrato;
  FData := pFData;
end;

end.
