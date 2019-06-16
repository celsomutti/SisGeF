unit Model.FechamentoRestricao;

interface
  type
    TFechamentoRestricao = class
    private
    var
      FRestricao: Integer;
      FParcela: Integer;
      FFechamento: Integer;
    public
      property Restricao: Integer read FRestricao write FRestricao;
      property Parcela: Integer read FParcela write FParcela;
      property Fechamento: Integer read FFechamento write FFechamento;
      constructor Create; overload;
      constructor Create(pFRestricao: Integer; pFParcela: Integer; pFFechamento: integer); overload;
    end;

implementation

{ TFechamentoRestricao }

constructor TFechamentoRestricao.Create;
begin
  inherited Create;
end;

constructor TFechamentoRestricao.Create(pFRestricao, pFParcela, pFFechamento: integer);
begin
  FRestricao := pFRestricao;
  FParcela := pFParcela;
  FFechamento := pFFechamento;
end;

end.
