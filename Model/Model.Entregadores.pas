unit Model.Entregadores;

interface

type
  TEntregadores = class
  private
    FCadastro: Integer;
    FEntregador: Integer;
    FFantasia: String;
    FAgente: Integer;
    FData: TDate;
    FChave: String;
    FGrupo: Integer;
    FVerba: Double;
    FExecutor: String;
    FManutencao: TDateTime;
  public
    property Cadastro: Integer read FCadastro write FCadastro;
    property Entregador: Integer read FEntregador write FEntregador;
    property Fantasia: String read FFantasia write FFantasia;
    property Agente: Integer read FAgente write FAgente;
    property Data: TDate read FData write FData;
    property Chave: String read FChave write FChave;
    property Grupo: Integer read FGrupo write FGrupo;
    property Verba: Double read FVerba write FVerba;
    property Executor: String read FExecutor write FExecutor;
    property Manutencao: TDateTime read FManutencao write FManutencao;
    constructor Create; overload;
    constructor Create(pFCadastro: Integer; pFEntregador: Integer; pFFantasia: String; pFAgente: Integer; pFData: TDate;
                       pFChave: String; pFGrupo: Integer; pFVerba: Double; pFExecutor: String; pFManutencao: TDateTime); overload;
  end;

implementation

{ TEntregadores }

constructor TEntregadores.Create;
begin
  inherited Create;
end;

constructor TEntregadores.Create(pFCadastro, pFEntregador: Integer; pFFantasia: String; pFAgente: Integer; pFData: TDate;
  pFChave: String; pFGrupo: Integer; pFVerba: Double; pFExecutor: String; pFManutencao: TDateTime);
begin
  FCadastro := pFCadastro;
  FEntregador := pFEntregador;
  FFantasia := pFFantasia;
  FAgente := pFAgente;
  FData := pFData;
  FChave := pFChave;
  FGrupo := pFGrupo;
  FVerba := pFVerba;
  FExecutor := pFExecutor;
  FManutencao := pFManutencao;
end;

end.
