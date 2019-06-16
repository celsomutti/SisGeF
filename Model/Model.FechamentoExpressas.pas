unit Model.FechamentoExpressas;

interface
  type
    TFechamentoExpressas = class
    private
    var
      FId: Integer;
      FDataInicio: TDateTime;
      FDataFinal: TDateTime;
      FTipo: Integer;
      FCodigo: Integer;
      FValorProducao: Double;
      FVerbaEntregador: Double;
      FTotalVerbaFranquia: Double;
      FSaldoRestricao: Double;
      FValorResticao: Double;
      FValorExtravios: Double;
      FValorCreditos: Double;
      FValorDebitos: Double;
      FValorFinanciado: Double;
      FTotalDebitos: Double;
      FTotalCreditos: Double;
      FTotalGeral: Double;
      FFechado: Integer;
      FExtratos: String;
      FTotalEntregas: Integer;
      FLog: String;
      FPFP: Integer;
      FBanco: Integer;
      FCPFCNPJ: String;
      FTipoConta: String;
      FFavorecido: String;
      FConta: String;
      FAgencia: String;
    public
      property Id: Integer read FId WRITE FId;
      property DataInicio: TDateTime read FDataInicio write FDataInicio;
      property DataFinal: TDateTime read FDataFinal write FDataFinal;
      property Tipo: Integer read FTipo write FTipo;
      property Codigo: Integer read FCodigo write FCodigo;
      property ValorProducao: Double read FValorProducao write FValorProducao;
      property VerbaEntregador: Double read FVerbaEntregador write FVerbaEntregador;
      property TotalVerbaFranquia: Double read FTotalVerbaFranquia write FTotalVerbaFranquia;
      property SaldoRestricao: Double read FSaldoRestricao write FSaldoRestricao;
      property ValorResticao: Double read FValorResticao write FValorResticao;
      property ValorExtravios: Double read FValorExtravios write FValorExtravios;
      property ValorCreditos: Double read FValorCreditos write FValorCreditos;
      property ValorDebitos: Double read FValorDebitos write FValorDebitos;
      property ValorFinanciado: Double read FValorFinanciado write FValorFinanciado;
      property TotalDebitos: Double read FTotalDebitos write FTotalDebitos;
      property TotalCreditos: Double read FTotalCreditos write FTotalCreditos;
      property TotalGeral: double read FTotalGeral write FTotalGeral;
      property Fechado: Integer read FFechado write FFechado;
      property Extratos: String read FExtratos write FExtratos;
      property TotalEntregas: Integer read FTotalEntregas write FTotalEntregas;
      property PFP: Integer read FPFP write FPFP;
      property Favorecido: String read FFavorecido write FFavorecido;
      property CPFCNPJ: String read FCPFCNPJ write FCPFCNPJ;
      property Banco: Integer read FBanco write FBanco;
      property Agencia: String read FAgencia write FAgencia;
      property TipoConta: String read FTipoConta write FTipoConta;
      property Conta: String read FConta write FConta;
      property Log: String read FLog write FLog;
      constructor Create; overload;
      constructor Create(pFId: Integer; pFDataInicio: TDateTime; pFDataFinal: TDateTime; pFTipo: Integer; pFCodigo: Integer; pFValorProducao: Double; pFVerbaentregador: Double;
                         pFTotalVerbaFranquia: Double; pFSaldoRestricao: Double; pFValorResticao: Double; pFValorExtravios: Double; pFValorCreditos: Double; pFValorDebitos: Double;
                         pFValorFinanciado: Double; pFTotalDebitos: Double; pFTotalCreditos: Double; pFTotalGeral: Double; pFFechado: Integer; pFExtratos: String;
                         pFTotalEntregas: Integer; pFPFP: Integer; pFFavorecido: String; pFCPFCNPJ: String; pFBanco: Integer;
                         pFAgencia: String; pFTipoConta: String; pFConta: String; pFLog: String); overload;
    end;

implementation

{ TFechamentoExpressas }


constructor TFechamentoExpressas.Create(pFId: Integer; pFDataInicio, pFDataFinal: TDateTime; pFTipo, pFCodigo: Integer; pFValorProducao,
  pFVerbaentregador, pFTotalVerbaFranquia, pFSaldoRestricao, pFValorResticao, pFValorExtravios, pFValorCreditos, pFValorDebitos,
  pFValorFinanciado, pFTotalDebitos, pFTotalCreditos, pFTotalGeral: Double; pFFechado: Integer; pFExtratos: String; pFTotalEntregas,
  pFPFP: Integer; pFFavorecido, pFCPFCNPJ: String; pFBanco: Integer; pFAgencia, pFTipoConta, pFConta,
  pFLog: String);
begin
FId := pFId;
  FDataInicio := pFDataInicio;
  FDataFinal := pFDataFinal;
  FTipo := pFTipo;
  FCodigo := pFCodigo;
  FValorProducao := pFValorProducao;
  FVerbaentregador := pFVerbaentregador;
  FTotalVerbaFranquia := pFTotalVerbaFranquia;
  FSaldoRestricao := pFSaldoRestricao;
  FValorResticao := pFValorResticao;
  FValorExtravios := pFValorExtravios;
  FValorCreditos := pFValorCreditos;
  FValorDebitos := pFValorDebitos;
  FValorFinanciado := pFValorFinanciado;
  FTotalDebitos := pFTotalDebitos;
  FTotalCreditos := pFTotalCreditos;
  FTotalGeral := pFTotalGeral;
  FFechado := pFFechado;
  FExtratos := pFExtratos;
  FTotalEntregas := pFTotalEntregas;
  FPFP := pFPFP;
  FFavorecido := pFFavorecido;
  FCPFCNPJ := pFCPFCNPJ;
  FBanco := pFBanco;
  FAgencia := pFAgencia;
  FTipoConta := pFTipoConta;
  FConta :=pFConta;
  FLog := pFLog;
end;

constructor TFechamentoExpressas.Create;
begin
  inherited Create;
end;

end.
