unit Model.ExtratosExpressas;

interface

type
  TExtratosExpressas = class
  private
  var
    FId: Integer;
    FAgente: Integer;
    FEntregador: Integer;
    FDataInicio: TDate;
    FDataFinal: TDate;
    FDataPagamento: TDate;
    FVolumes: Integer;
    FEntregas: Integer;
    FAtrasos: Integer;
    FVolumesExtra: Double;
    FSLA: Double;
    FVerba: Double;
    FValorEntregas: Double;
    FValorVolumesExtra: Double;
    FValorProducao: Double;
    FValorCreditos: Double;
    FValorRestricao: Double;
    FValorExtravio: Double;
    FValorDebitos: Double;
    FValorTotalCreditos: Double;
    FValorTotalDebitos: Double;
    FValorTotalGeral: Double;
    FFechado: Integer;
    FTotalVerbaFranquia: Double;
    FLog: String;
    FPFP: Integer;
  public
    property Id: Integer read FId write FId;
    property Agente: Integer read FAgente write FAgente;
    property Entregador: Integer read FEntregador write FEntregador;
    property DataInicio: TDate read FDataInicio write FDataInicio;
    property DataFinal: TDate read FDataFinal write FDataFinal;
    property DataPagamento: TDate read FDataPagamento write FDataPagamento;
    property Volumes: Integer read FVolumes write FVolumes;
    property Entregas: Integer read FEntregas write FEntregas;
    property Atrasos: Integer read FAtrasos write FAtrasos;
    property VolumesExtra: Double read FVolumesExtra write FVolumesExtra;
    property SLA: Double read FSLA write FSLA;
    property Verba: Double read FVerba write FVerba;
    property ValorEntregas: Double read FValorEntregas write FValorEntregas;
    property ValorVolumesExtra: Double read FValorVolumesExtra write FValorVolumesExtra;
    property ValorProducao: Double read FValorProducao write FValorProducao;
    property ValorCreditos: Double read FValorCreditos write FValorCreditos;
    property ValorRestricao: Double read FValorRestricao write FValorRestricao;
    property ValorExtravio: Double read FValorExtravio write FValorExtravio;
    property ValorDebitos: Double read FValorDebitos write FValorDebitos;
    property ValorTotalCreditos: Double read FValorTotalCreditos write FValorTotalCreditos;
    property ValorTotalDebitos: Double read FValorTotalDebitos write FValorTotalDebitos;
    property ValorTotalGeral: Double read FValorTotalGeral write FValorTotalGeral;
    property Fechado: Integer read FFechado write FFechado;
    property TotalVerbaFranquia: Double read FTotalVerbaFranquia write FTotalVerbaFranquia;
    property PFP: Integer read FPFP write FPFP;
    property Log: String read FLog write FLog;
    constructor Create; overload;
    constructor Create (pFId: Integer; pFAgente: Integer; pFEntregador: Integer; pFDataInicio: TDate; pFDataFinal: TDate; pFDataPagamento: TDate;
                        pFVolumes: Integer; pFEntregas: Integer; pFAtrasos: Integer; pFVolumesExtra: Double; pFSLA: Double; pFVerba: Double; pFValorEntregas: Double;
                        pFValorVolumesExtra: Double; pFValorProducao: Double; pFValorCreditos: Double; pFValorRestricao: Double;  pFValorExtravio: double;
                        pFValorDebitos: Double; pFValorTotalCreditos: Double; pFValorTotalDebitos: Double; pFValorTotalGeral: Double; pFFechado: Integer;
                        pFTotalVerbaFranquia: Double; pFPFP: Integer; pFLog: String); overload;

  end;

implementation

{ TExtratosExpressas }

constructor TExtratosExpressas.Create;
begin
  inherited Create;
end;


constructor TExtratosExpressas.Create(pFId, pFAgente, pFEntregador: Integer; pFDataInicio, pFDataFinal, pFDataPagamento: TDate; pFVolumes, pFEntregas,
  pFAtrasos: Integer; pFVolumesExtra, pFSLA, pFVerba, pFValorEntregas, pFValorVolumesExtra, pFValorProducao, pFValorCreditos, pFValorRestricao, pFValorExtravio, pFValorDebitos,
  pFValorTotalCreditos, pFValorTotalDebitos, pFValorTotalGeral: Double; pFFechado: Integer; pFTotalVerbaFranquia: Double; pFPFP: Integer; pFLog: String);
begin
  FId := pFId;
  FAgente := pFAgente;
  FEntregador := pFEntregador;
  FDataInicio := pFDataInicio;
  FDataFinal := pFDataFinal;
  FDataPagamento := pFDataPagamento;
  FVolumes := pFVolumes;
  FEntregas := pFEntregas;
  FAtrasos := pFAtrasos;
  FVolumesExtra := pFVolumesExtra;
  FSLA := pFSLA;
  FVerba := pFVerba;
  FValorEntregas := pFValorEntregas;
  FValorVolumesExtra := pFValorVolumesExtra;
  FValorProducao := pFValorProducao;
  FValorCreditos := pFValorCreditos;
  FValorRestricao := pFValorRestricao;
  FValorExtravio := pFValorExtravio;
  FValorDebitos := pFValorDebitos;
  FValorTotalCreditos := pFValorTotalCreditos;
  FValorTotalDebitos := pFValorTotalDebitos;
  FValorTotalGeral := pFValorTotalGeral;
  FFechado := pFFechado;
  FTotalVerbaFranquia := pFTotalVerbaFranquia;
  FPFP := pFPFP;
  FLog := pFLog;
end;

end.
