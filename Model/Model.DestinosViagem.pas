unit Model.DestinosViagem;

interface
  type
    TDestinosViagem = class
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

{ TDestinosViagem }

constructor TDestinosViagem.Create;
begin
  inherited Create;
end;

constructor TDestinosViagem.Create(pFId, pFDestino, pFControle: Integer);
begin
  Fid := pFId;
  FDestino := pFDestino;
  FControle := pFControle;
end;

end.
