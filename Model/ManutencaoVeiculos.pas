unit ManutencaoVeiculos;

interface
  type
    TManutencaoVeiculos = class
    private
    var
      FID: Integer;
      FVeiculo: Integer;
      FItem: Integer;
      FDataManuencao: System.TDate;
      FKmManutencao: Double;
      FDataPrevisao: System.TDate;
      FKmPrevisao: Double;
      FValor: Double;
      FDataLiberacao: System.TDate;
      FSituacao: Integer;
      FObs: String;
      FLog: String;
    public
      property ID: Integer read FID write FID;
      property Veiculo: Integer read FVeiculo write FVeiculo;
      property Item: Integer read FItem write FItem;
      property DataManutencao: System.TDate read FDataManuencao write FDataManuencao;
      property KMManutencao: Double read FKmManutencao write FKmManutencao;
      property DataPrevisao: System.TDate read FDataPrevisao write FDataPrevisao;
      property KMPrevisao: Double read FKmPrevisao write FKmPrevisao;
      property Valor: Double read FValor write FValor;
      property DataLiberacao: System.TDate read FDataLiberacao write FDataLiberacao;
      property Situacao: Integer read FSituacao write FSituacao;
      property Obs: String read FObs write FObs;
      property Log: String read FLog write FLog;
      constructor Create; overload;
      constructor Create(pFID: Integer; pFVeiculo: Integer; pFItem: Integer; pFDataManuencao: System.TDate; pFKmManutencao: Double;
                         pFDataPrevisao: System.TDate; pFKmPrevisao: Double; pFValor: Double; pFDataLiberacao: System.TDate;
                         pFSituacao: Integer; pFObs: String; pFLog: String); overload;
    end;


implementation

constructor TManutencaoVeiculos.Create;
begin
  inherited Create;
end;

constructor TManutencaoVeiculos.Create(pFID: Integer; pFVeiculo: Integer; pFItem: Integer; pFDataManuencao: System.TDate;
                                       pFKmManutencao: Double; pFDataPrevisao: System.TDate; pFKmPrevisao: Double; pFValor: Double;
                                       pFDataLiberacao: System.TDate; pFSituacao: Integer; pFObs: String; pFLog: String);
begin
  FID := pFID;
  FVeiculo := pFVeiculo;
  FItem := pFItem;
  FDataManuencao := pFDataManuencao;
  FKmManutencao := pFKmManutencao;
  FDataPrevisao := pFDataPrevisao;
  FKmPrevisao := pFKmPrevisao;
  FValor := pFValor;
  FDataLiberacao := pFDataLiberacao;
  FSituacao := pFSituacao;
  FObs := pFObs;
  FLog := pFLog;
end;

end.
