unit Model.ExtratoExpressas;

interface

type
  TExtratoExpressas = class
  private
    FTipo: Integer;
    FNumExtrato: String;
    FCliente: Integer;
    FDatBase: System.TDate;
    FDatInicio: System.TDate;
    FDatTermino: System.TDate;
    FCadastro: Integer;
    FCodDistribuidor: Integer;
    FNomDistribuidor: String;
    FPerDistribuidor: Double;
    FCodEntregador: Integer;
    FNomEntregador: String;
    FPerEntregador: Double;
    FVerba: Double;
    FQtdVolumes: Integer;
    FQtdVolumesExtra: Double;
    FQtdEntregas: Integer;
    FQtdAtrasos: Integer;
    FValVerbaTotal: Double;
    FValVolumesExtra: Double;
    FValCreditos: Double;
    FValRestricao: Double;
    FValAbastecimentos: Double;
    FValPenalidadeAtrasos: Double;
    FValDebitos: Double;
    FValTotalCreditos: Double;
    FValTotalDebitos: Double;
    FValTotalGeral: Double;
    FPago: String;
    FDatPago: System.TDate;
    FFechado: String;
    FDatFechamento: System.TDate;
    FExecutante: String;
    FManutencao: System.TDateTime;
  public
    property Tipo: Integer read FTipo write FTipo;
    property NumeroExtrato: String read FNumExtrato write FNumExtrato;
    property Cliente: Integer read FCliente write FCliente;
    property DataBase: System.TDate read FDatBase write FDatBase;
    property DataInicio: System.TDate read FDatInicio write FDatInicio;
    property DataTermino: System.TDate read FDatTermino write FDatTermino;
    property Cadastro: Integer read FCadastro write FCadastro;
    property Codigodistribuidor: Integer read FCodDistribuidor write FCodDistribuidor;
    property NomeDistribuidor: String read FNomDistribuidor write FNomDistribuidor;
    property PercentualDistribuidor: Double read FPerDistribuidor write FPerDistribuidor;
    property CodigoEntregador: Integer read FCodEntregador write FCodEntregador;
    property NomeEntregador: String read FNomEntregador write FNomEntregador;
    property PercentualEntregador: Double read FPerEntregador write FPerEntregador;
    property Verba: Double read FVerba write FVerba;
    property Volumes: Integer read FQtdVolumes write FQtdVolumes;
    property VolumesExtra: Double read FQtdVolumesExtra write FQtdVolumesExtra;
    property Entregas: Integer read FQtdEntregas write FQtdEntregas;
    property Atrasos: Integer read FQtdAtrasos write FQtdAtrasos;
    property VerbaTotal: Double read FValVerbaTotal write FValVerbaTotal;
    property ValorVolumesExtra: Double read FValVolumesExtra write FValVolumesExtra;
    property Creditos: Double read FValCreditos write FValCreditos;
    property Restricao: Double read FValRestricao write FValRestricao;
    property Abastecimentos: Double read FValAbastecimentos write FValAbastecimentos;
    property PenalizadaAtrasos: Double read FValPenalidadeAtrasos write FValPenalidadeAtrasos;
    property Debitos: Double read FValDebitos write FValDebitos;
    property TotalCreaditos: Double read FValTotalCreditos write FValTotalCreditos;
    property TotalDebitos: Double read FValTotalDebitos write FValTotalDebitos;
    property TotalGeral: Double read FValTotalGeral write FValTotalGeral;
    property Pago: String read FPago write FPago;
    property DataPago: System.TDate read FDatPago write FDatPago;
    property Fechado: String read FFechado write FFechado;
    property DataFechado: System.TDate read FDatFechamento write FDatFechamento;
    property Executante: String read FExecutante write FExecutante;
    property Manutencao: System.TDateTime read FManutencao write FManutencao;
    constructor Create; overload;
    constructor Create(pFTipo: Integer; pFNumExtrato: String; pFCliente: Integer; pFDatBase: System.TDate; pFDatInicio: System.TDate;
      pFDatTermino: System.TDate; pFCadastro: Integer; pFCodDistribuidor: Integer; pFNomDistribuidor: String;
      pFPerDistribuidor: Double; pFCodEntregador: Integer; pFNomEntregador: String; pFPerEntregador: Double; pFVerba: Double;
      pFQtdVolumes: Integer; pFQtdVolumesExtra: Double; pFQtdEntregas: Integer; pFQtdAtrasos: Integer; pFValVerbaTotal: Double;
      pFValVolumesExtra: Double; pFValCreditos: Double; pFValRestricao: Double; pFValAbastecimentos: Double;
      pFValPenalidadeAtrasos: Double; pFValDebitos: Double; pFValTotalCreditos: Double; pFValTotalDebitos: Double;
      pFValTotalGeral: Double; pFPago: String; pFDatPago: System.TDate; pFFechado: String; pFDatFechamento: System.TDate;
      pFExecutante: String; pFManutencao: System.TDateTime); overload;
  end;

implementation

constructor TExtratoExpressas.Create;
begin
  inherited Create;
end;

constructor TExtratoExpressas.Create(pFTipo: Integer; pFNumExtrato: String; pFCliente: Integer; pFDatBase: System.TDate;
      pFDatInicio: System.TDate; pFDatTermino: System.TDate; pFCadastro: Integer; pFCodDistribuidor: Integer;
      pFNomDistribuidor: String; pFPerDistribuidor: Double; pFCodEntregador: Integer; pFNomEntregador: String;
      pFPerEntregador: Double; pFVerba: Double; pFQtdVolumes: Integer; pFQtdVolumesExtra: Double; pFQtdEntregas: Integer;
      pFQtdAtrasos: Integer; pFValVerbaTotal: Double; pFValVolumesExtra: Double; pFValCreditos: Double; pFValRestricao: Double;
      pFValAbastecimentos: Double; pFValPenalidadeAtrasos: Double; pFValDebitos: Double; pFValTotalCreditos: Double;
      pFValTotalDebitos: Double; pFValTotalGeral: Double; pFPago: String; pFDatPago: System.TDate; pFFechado: String;
      pFDatFechamento: System.TDate; pFExecutante: String; pFManutencao: System.TDateTime);
begin
    FTipo := pFTipo;
    FNumExtrato:= pFNumExtrato;
    FCliente:= pFCliente;
    FDatBase:= pFDatBase;
    FDatInicio:= pFDatInicio;
    FDatTermino:= pFDatTermino;
    FCadastro:= pFCadastro;
    FCodDistribuidor:= pFCodDistribuidor;
    FNomDistribuidor:= pFNomDistribuidor;
    FPerDistribuidor:= pFPerDistribuidor;
    FCodEntregador:= pFCodEntregador;
    FNomEntregador:= pFNomEntregador;
    FPerEntregador:= pFPerEntregador;
    FVerba:= pFVerba;
    FQtdVolumes:= pFQtdVolumes;
    FQtdVolumesExtra:= pFQtdVolumesExtra;
    FQtdEntregas:= pFQtdEntregas;
    FQtdAtrasos:= pFQtdAtrasos;
    FValVerbaTotal:= pFValVerbaTotal;
    FValVolumesExtra:= pFValVolumesExtra;
    FValCreditos:= pFValCreditos;
    FValRestricao:= pFValRestricao;
    FValAbastecimentos:= pFValAbastecimentos;
    FValPenalidadeAtrasos:= pFValPenalidadeAtrasos;
    FValDebitos:= pFValDebitos;
    FValTotalCreditos:= pFValTotalCreditos;
    FValTotalDebitos:= pFValTotalDebitos;
    FValTotalGeral:= pFValTotalGeral;
    FPago:= pFPago;
    FDatPago := pFDatPago;
    FFechado:= pFFechado;
    FDatFechamento:= pFDatFechamento;
    FExecutante:= pFExecutante;
    FManutencao:= pFManutencao;
end;

end.
