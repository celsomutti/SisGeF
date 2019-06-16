unit Model.RemessasVA;

interface
  type
    TRemessasVA = class
    private
    var
      FId: Integer;
      FDistribuidor: Integer;
      FBanca: Integer;
      FProduto: String;
      FDataRemessa: TDate;
      FNumeroRemessa: String;
      FRemessa: Double;
      FDataRecobertura: TDate;
      FRecobertura: Double;
      FDataChamada: TDate;
      FNumeroDevolucao: String;
      FEncalhe: Double;
      FValorCobranca: Double;
      FValorVenda: Double;
      FInventario: Integer;
      FDivergencia: Integer;
      FLog: String;
    public
      property Id: Integer read FId write FId;
      property Distribuidor: Integer read FDistribuidor write FDistribuidor;
      property Banca: Integer read FBanca write FBanca;
      property Produto: String read FProduto write FProduto;
      property DataRemessa: TDate read FDataRemessa write FDataRemessa;
      property NumeroRemessa: String read FNumeroRemessa write FNumeroRemessa;
      property Remessa: Double read FRemessa write FRemessa;
      property DataRecobertura: TDate read FDataRecobertura write FDataRecobertura;
      property Recobertura: Double read FRecobertura write FRecobertura;
      property DataChamada: TDate read FDataChamada write FDataChamada;
      property NumeroDevolucao: String read FNumeroDevolucao write FNumeroDevolucao;
      property Encalhe: Double read FEncalhe write FEncalhe;
      property ValorCobranca: Double read FValorCobranca write FValorCobranca;
      property ValorVenda: Double read FValorVenda write FValorVenda;
      property Inventario: Integer read FInventario write FInventario;
      property Divergencia: Integer read FDivergencia write FDivergencia;
      property Log: String read FLog write FLog;
      constructor Create; overload;
      constructor Create(pFId: Integer; pFDistribuidor: Integer; pFBanca: Integer; pFProduto: String; pFDataRemessa: TDate;
                         pFNumeroRemessa: String; pFRemessa: Double; pFDataRecobertura: TDate; pFRecobertura: Double;
                         pFDataChamada: TDate; pFNumeroDevolucao: String; pFEncalhe: Double; pFValorCobranca: Double;
                         pFValorVenda: Double; pFInventario: Integer;  pFDivergencia: Integer; pFLog: String); overload;

    end;

implementation

constructor TRemessasVA.Create;
begin
  inherited Create;
end;

constructor TRemessasVA.Create(pFId: Integer; pFDistribuidor: Integer; pFBanca: Integer; pFProduto: String; pFDataRemessa: TDate;
                               pFNumeroRemessa: string; pFRemessa: Double; pFDataRecobertura: TDate; pFRecobertura: Double;
                               pFDataChamada: TDate; pFNumeroDevolucao: string; pFEncalhe: Double; pFValorCobranca: Double;
                               pFValorVenda: Double; pFInventario: Integer; pFDivergencia: Integer; pFLog: string);
begin
  FId := pFId;
  FDistribuidor := pFDistribuidor;
  FBanca := pFBanca;
  FProduto := pFProduto;
  FDataRemessa := pFDataRemessa;
  FNumeroRemessa := pFNumeroRemessa;
  FRemessa := pFRemessa;
  FDataRecobertura := pFDataRecobertura;
  FRecobertura := pFRecobertura;
  FDataChamada := pFDataChamada;
  FNumeroDevolucao := pFNumeroDevolucao;
  FEncalhe := pFEncalhe;
  FValorCobranca := pFValorCobranca;
  FValorVenda := pFValorVenda;
  FDivergencia := pFDivergencia;
  FInventario := pFInventario;
  FLog := pFLog;
end;

end.
