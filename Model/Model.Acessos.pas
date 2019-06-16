unit Model.Acessos;

interface
  type
  TAcesso = class
  private
  var
    FForm : System.string;
    FModulo : System.string;
    FUsuario : System.Integer;
  public
    property Form: System.string read FForm write FForm;
    property Modulo: System.string read FModulo write FModulo;
    property Usuario: System.Integer read FUsuario write FUsuario;
    constructor Create; overload;
    constructor Create(pFForm: String; pFModulo: String; pFUsuario: Integer); overload;
  end;

implementation

constructor TAcesso.Create;
begin
  inherited Create;
end;

constructor TAcesso.Create(pFForm: string; pFModulo: string; pFUsuario: Integer);
begin
  FForm := pFForm;
  FModulo := pFModulo;
  FUsuario := pFUsuario;
end;

end.
