unit Model.TotalEntregas;

interface
  type
    TTotalEntregas = class
    private
    var
      FAgente: Integer;
      FEntregador: Integer;
      FVolumes: Integer;
      FEntregas: Integer;
      FExtra: Double;
      FAtraso: Integer;
      FSLA: Double;
      FTotalVerbaFranquia: Double;
      FPFP: Integer;
    public
      property Agente: Integer read FAgente write FAgente;
      property Entregador: Integer read FEntregador write Fentregador;
      property Volumes: Integer read FVolumes write FVolumes;
      property Entregas: Integer read FEntregas write FEntregas;
      property Extra: Double read FExtra write FExtra;
      property Atraso: Integer read FAtraso write FAtraso;
      property SLA: Double read FSLA write FSLA;
      property TotalVerbaFranquia: Double read FTotalVerbaFranquia write FTotalVerbaFranquia;
      property PFP: Integer read FPFP write FPFP;
      constructor Create; overload;
      constructor Create(pFAgente: Integer; pFEntregador: Integer; pFVolumes: Integer; pFEntregas: Integer; pFExtra: Double; pFAtraso: Integer; pFSLA: Double;
                         pFTotalVerbaFranquia: Double; pFPFP: Integer); overload;
    end;

implementation

{ TTotalEntregas }

constructor TTotalEntregas.Create;
begin
  inherited Create;
end;

constructor TTotalEntregas.Create(pFAgente, pFEntregador, pFVolumes, pFEntregas: Integer; pFExtra: Double; pFAtraso: Integer; pFSLA, pFTotalVerbaFranquia: Double; pFPFP: Integer);
begin
  FAgente := pFAgente;
  FEntregador := pFEntregador;
  FVolumes := pFVolumes;
  FEntregas := pFEntregas;
  FExtra := pFExtra;
  FAtraso := pFAtraso;
  FSLA := pFSLA;
  FTotalVerbaFranquia := pFTotalVerbaFranquia;
  FPFP:= pFPFP;
end;

end.
