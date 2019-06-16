unit Model.ExtraviosMultas;

interface

  type
    TExtraviosMultas = class
    private
      var
      FID: Integer;
      FDescricao: String;
      FNN: String;
      FAgente: Integer;
      FValorProduto: Double;
      FData: TDate;
      FMulta: Double;
      FVerba: Double;
      FTotal: Double;
      FRestricao: String;
      FEntregador: Integer;
      FTipo: Integer;
      FValorFranquia: Double;
      FExtrato: String;
      FDataFranquia: TDate;
      FEnvioCorrespondencia: String;
      FRetornoCorrespondencia: String;
      FObs: String;
      FPercentual: Double;
      FIDExtrato: Integer;
      FExecutor: String;
      FManutencao: TDateTime;
    public
      property ID: Integer read FID write FID;
      property Descricao: String read FDescricao write FDescricao;
      property NN: String read FNN write FNN;
      property Agente: Integer read FAgente write FAgente;
      property ValorProduto: Double read FValorProduto write FValorProduto;
      property Data: TDate read FData write FData;
      property Multa: Double read FMulta write FMulta;
      property Verba: Double read FVerba write FVerba;
      property Total: Double read FTotal write FTotal;
      property Restricao: String read FRestricao write FRestricao;
      property Entregador: Integer read FEntregador write FEntregador;
      property Tipo: Integer read FTipo write FTipo;
      property ValorFranquia: Double read FValorFranquia write FValorFranquia;
      property Extrato: String read FExtrato write FExtrato;
      property DataFranquia: TDate read FDataFranquia write FDataFranquia;
      property EnvioCorrespondencia: String read FEnvioCorrespondencia write FEnvioCorrespondencia;
      property RetornoCorrespondencia: String read FRetornoCorrespondencia write FRetornoCorrespondencia;
      property Obs: String read FObs write FObs;
      property Percentual: Double read FPercentual write FPercentual;
      property IDExtrato: Integer read FIDExtrato  write FIDExtrato;
      property Executor: String read FExecutor write FExecutor;
      property Manutencao: TDateTime read FManutencao write FManutencao;
      constructor Create(); overload;
      constructor Create(pFID: Integer; pFDescricao: String; pFNN: String; pFAgente: Integer; pFValorProduto: Double; pFData: TDate; pFMulta: Double; pFVerba: Double;
                         pFTotal: Double; pFRestricao: String; pFEntregador: Integer; pFTipo: Integer; pFValorFranquia: Double; pFExtrato: String; pFDataFranquia: TDate;
                         pFEnvioCorrespondencia: String; pFRetornoCorrespondencia: String; pFObs: String; pFPercentual: Double; pFIDExtrato: Integer; pFExecutor: String;
                         pFManutencao: TDateTime); overload;
    end;

{ TExtraviosMultas }

implementation

constructor TExtraviosMultas.Create;
begin
  inherited Create;
end;


constructor TExtraviosMultas.Create(pFID: Integer; pFDescricao, pFNN: String; pFAgente: Integer; pFValorProduto: Double; pFData: TDate; pFMulta, pFVerba, pFTotal: Double;
  pFRestricao: String; pFEntregador, pFTipo: Integer; pFValorFranquia: Double; pFExtrato: String; pFDataFranquia: TDate; pFEnvioCorrespondencia, pFRetornoCorrespondencia,
  pFObs: String; pFPercentual: Double; pFIDExtrato: Integer; pFExecutor: String; pFManutencao: TDateTime);
begin
  FID := pFID;
  FDescricao := pFDescricao;
  FNN := pFNN;
  FAgente := pFAgente;
  FValorProduto := pFValorProduto;
  FData := pFData;
  FMulta := pFMulta;
  FVerba := pFVerba;
  FTotal := pFTotal;
  FRestricao := pFRestricao;
  FEntregador := pFEntregador;
  FTipo := pFTipo ;
  FValorFranquia := pFValorFranquia;
  FExtrato := pFExtrato;
  FDataFranquia := pFDataFranquia;
  FEnvioCorrespondencia := pFEnvioCorrespondencia;
  FRetornoCorrespondencia := pFRetornoCorrespondencia;
  FObs := pFObs;
  FPercentual := pFPercentual;
  FIDExtrato := pFIDExtrato;
  FExecutor := pFExecutor;
  FManutencao := pFManutencao;
end;

end.
