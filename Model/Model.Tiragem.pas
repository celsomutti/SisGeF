unit Model.Tiragem;

interface

type
  TTiragem = class
  private
  var
    FId: System.Integer;
    FData: System.TDate;
    FRoteiro: System.String;
    FEntregador: System.Integer;
    FProduto: System.String;
    FTiragem: System.Integer;
  public
    property ID: System.Integer read FId write FId;
    property Data: System.TDate read FData write FData;
    property Roteiro: System.string read FRoteiro write FRoteiro;
    property Entregador: System.Integer read FEntregador write FEntregador;
    property Produto: System.string read FProduto write FProduto;
    property Tiragem: System.Integer read FTiragem write FTiragem;
    constructor Create; overload;
    constructor Create(pFId: System.Integer; pFData: System.TDate; pFRoteiro: System.String; pFEntregador: System.Integer;
                        pFProduto: System.String; pFTiragem: System.Integer); overload;

  end;

implementation

constructor TTiragem.Create;
begin
  inherited Create;
end;

constructor TTiragem.Create(pFId: Integer; pFData: TDate; pFRoteiro: string; pFEntregador: Integer; pFProduto: string;
                             pFTiragem: Integer);
begin
  FId := pFId;
  FData := pFData;
  FRoteiro := pFRoteiro;
  FEntregador := pFEntregador;
  FProduto := pFProduto;
  FTiragem := pFTiragem;
end;

end.
