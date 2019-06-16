unit Model.ControleTransporte;

interface

type
  TControleTransporte = class
  private
  var
    FID: Integer;
    FSM: String;
    FDataTransporte: System.TDate;
    FCliente: Integer;
    FOperacao: String;
    FPlaca: String;
    FMotorista: Integer;
    FKmSaida: Double;
    FHoraSaida: System.TTime;
    FKmRetorno: Double;
    FHoraRetorno: System.TTime;
    FKmrodado: Double;
    FServico: String;
    FObs: String;
    FValServico: Double;
    FStatus: Integer;
    FLog: String;
  public
    property ID: Integer read FID write FID;
    property SM: String read FSM write FSM;
    property DataTransporte: System.TDate read FDataTransporte write FDataTransporte;
    property Cliente: Integer read FCliente write FCliente;
    property Operacao: String read FOperacao write FOperacao;
    property Placa: String read FPlaca write FPlaca;
    property Motorista: Integer read FMotorista write FMotorista;
    property KmSaida: Double read FKmSaida write FKmSaida;
    property HoraSaida: System.TTime read FHoraSaida write FHoraSaida;
    property KmRetorno: Double read FKmRetorno write FKmRetorno;
    property HoraRetorno: System.TTime read FHoraRetorno write FHoraRetorno;
    property KmRodado: Double read FKmrodado write FKmrodado;
    property Servico: String read FServico write FServico;
    property Obs: String read FObs write FObs;
    property ValServico: Double read FValServico write FValServico;
    property Status: Integer read FStatus write FStatus;
    property Log: String read FLog write FLog;
    constructor Create; overload;
    constructor Create(pFID: Integer; pFSM: String; pFDataTransporte: System.TDate; pFCliente: Integer; pFOperacao: String; pFPlaca: String;
      pFMotorista: Integer; pFKmSaida: Double; pFHoraSaida: System.TTime; pFKmRetorno: Double; pFHoraRetorno: System.TTime;
      pFKmRodado: Double; pFServico: String; pFObs: String; pFValServico: Double; pFStatus: Integer; pFLog: String); overload;
  end;

implementation

constructor TControleTransporte.Create;
begin
  inherited Create;
end;

constructor TControleTransporte.Create(pFID: Integer; pFSM: String; pFDataTransporte: System.TDate; pFCliente: Integer; pFOperacao: String;
  pFPlaca: String; pFMotorista: Integer; pFKmSaida: Double; pFHoraSaida: System.TTime; pFKmRetorno: Double;
  pFHoraRetorno: System.TTime; pFKmRodado: Double; pFServico: String; pFObs: String; pFValServico: Double; pFStatus: Integer;
  pFLog: String);
begin
    FID := pFID;
    FSM := pFSM;
    FDataTransporte := pFDataTransporte;
    FCliente := pFCliente;
    FOperacao := pFOperacao;
    FPlaca := pFPlaca;
    FMotorista := pFMotorista;
    FKmSaida := pFKmSaida;
    FHoraSaida := pFHoraSaida;
    FKmRetorno := pFKmRetorno;
    FHoraRetorno := pFHoraRetorno;
    FKmrodado := pFKmrodado;
    FServico := pFServico;
    FObs := pFObs;
    FValServico := pFValServico;
    FStatus := pFStatus;
    FLog := pFLog;
end;

end.
