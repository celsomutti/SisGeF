unit Control.PlanilhaEntradaCarriers;

interface

uses System.SysUtils, Model.PlanilhaEntradaCarriers, Generics.Collections;

type
  TPlanilhaEntradaCarriersControl = class
  private
    FPlanilha: TPlanilhaEntradaCarriers;
  public
    constructor Create();
    destructor Destroy(); override;
    function GetPlanilha(sFile: String): TObjectList<TPlanilhaEntradaCarriers>;
  end;

implementation

{ TPlanilhaEntradaCarriersControl }

constructor TPlanilhaEntradaCarriersControl.Create;
begin
  FPlanilha := TPlanilhaEntradaCarriers.Create;
end;

destructor TPlanilhaEntradaCarriersControl.Destroy;
begin
  FPlanilha.Create;
  inherited;
end;

function TPlanilhaEntradaCarriersControl.GetPlanilha(sFile: String): TObjectList<TPlanilhaEntradaCarriers>;
begin
  Result := FPlanilha.GetPlanilha(sFile);
end;

end.
