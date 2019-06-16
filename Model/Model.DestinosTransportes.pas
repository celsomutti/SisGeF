unit Model.DestinosTransportes;

interface
  type
    TDestinosTransportes = class
    private
    var
      FId: Integer;
      FDestino: Integer;
      FControle: Integer;
    public
      property Id: integer read Fid write FId;
      property Destino: Integer read FDestino write FDestino;
      property Controle: Integer read FControle write FControle;
      constructor Create; overload;
      constructor Create(pFId: Integer; pFDestino: Integer; pFControle: Integer); overload;
    end;

implementation

{ TDestinosTransportes }

constructor TDestinosTransportes.Create;
begin
  inherited Create;
end;

constructor TDestinosTransportes.Create(pFId, pFDestino, pFControle: Integer);
begin
  Fid := pFId;
  FDestino := pFDestino;
  FControle := pFControle;
end;

end.
