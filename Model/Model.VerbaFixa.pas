unit Model.VerbaFixa;

interface
  type
    TVerbaFixa = Class
    private
    var
      FId: System.Integer;
      FGrupo: System.Integer;
      FData: System.TDate;
      FDescricao: System.string;
      FValor: System.Double;
      FAtivo: System.Integer;
      FLog: System.string;
    public
      property ID: System.Integer read FId write FId;
      property Grupo: System.Integer read FGrupo write FGrupo;
      property Data: System.TDate read FData write FData;
      property Descricao: System.string read FDescricao write FDescricao;
      property Valor: System.Double read FValor write FValor;
      property Ativo: System.Integer read FAtivo write FAtivo;
      property Log: System.string read FLog write FLog;
      constructor Create; overload;
      constructor Create(pFId: System.Integer; pFGrupo: System.Integer; pFData: System.TDate; pFDescricao: System.string;
                         pFValor: System.Double; pFAtivo: System.Integer; pFLog: System.string); overload;
    end;

implementation

constructor TVerbaFixa.Create;
begin
  Inherited Create;
end;

constructor TVerbaFixa.Create(pFId: System.Integer; pFGrupo: System.Integer; pFData: System.TDate; pFDescricao: System.string;
                              pFValor: System.Double; pFAtivo: System.Integer; pFLog: System.string);
begin
  FId := pFId;
  FGrupo := pFGrupo;
  FData := pFData;
  FDescricao := pFDescricao;
  FValor := pFValor;
  FAtivo := pFAtivo;
  FLog := pFLog;
end;

end.
