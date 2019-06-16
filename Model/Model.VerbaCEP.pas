unit Model.VerbaCEP;

interface
  type
    TVerbaCEP = class
    private
    var
      FID: System.Integer;
      FCEPInicial: System.string;
      FCEPFinal: System.string;
      FVerba: System.Double;
      FGrupo: System.Integer;
      FFaixa: System.Integer;
      FLog: System.string;
    public
      property ID: System.Integer read FID write FID;
      property CEPInicial: System.string read FCEPInicial write FCEPInicial;
      property CEPFinal: System.string read FCEPFinal write FCEPFinal;
      property Verba: System.Double read FVerba write FVerba;
      property Grupo: System.Integer read Fgrupo write FGrupo;
      property Faixa: System.Integer read FFaixa write FFaixa;
      property Log: System.string read FLog write FLog;
      constructor Create; overload;
      constructor Create(pFID: System.Integer; pFCEPInicial: System.string; pFCEPFinal: System.string; pFVerba: System.Double;
                         pFGrupo: System.Integer; pFFaixa: System.Integer; pFLog: System.string); overload;

    end;

implementation

constructor TVerbaCEP.Create;
begin
  inherited Create;
end;

constructor TVerbaCEP.Create(pFID: Integer; pFCEPInicial: string; pFCEPFinal: string; pFVerba: Double; pFGrupo: Integer;
                             pFFaixa: Integer; pFLog: string);
begin
  FID := pFID;
  FCEPInicial := pFCEPInicial;
  FCEPFinal := pFCEPFinal;
  FVerba := pFVerba;
  FGrupo := pFGrupo;
  FFaixa := pFFaixa;
  FLog := pFLog;
end;

end.
