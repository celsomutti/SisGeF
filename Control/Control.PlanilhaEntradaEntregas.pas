unit Control.PlanilhaEntradaEntregas;

interface

uses System.SysUtils, Model.PlanilhaEntradaEntregas, Generics.Collections;

type
  TPlanilhasEntradasEntregasControl = class
  private
    FPlanilha : TPlanilhaEntradaEntregas;
  public
    constructor Create();
    destructor Destroy(); override;
    property Planilha: TPlanilhaEntradaEntregas read FPlanilha write FPlanilha;
    function GetPlanilha(sFile: String): TObjectList<TPlanilhaEntradaEntregas>;
  end;

implementation

{ TPlanilhasEntradasEntregasControl }

constructor TPlanilhasEntradasEntregasControl.Create;
begin
  FPlanilha:= TPlanilhaEntradaEntregas.Create;
end;

destructor TPlanilhasEntradasEntregasControl.Destroy;
begin
  FPlanilha.Free;
  inherited;
end;

function TPlanilhasEntradasEntregasControl.GetPlanilha(sFile: String): TObjectList<TPlanilhaEntradaEntregas>;
begin
  Result := FPlanilha.GetPlanilha(sFile);
end;

end.
