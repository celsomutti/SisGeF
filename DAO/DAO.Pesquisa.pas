unit DAO.Pesquisa;

interface

uses DAO.Base, Generics.Collections, System.Classes, FireDAC.Comp.Client, Data.DB;

type
  TPesquisa = class(TDAO)
  public
    function FindSQL(sSQL: System.string): TFDQuery;
  end;

implementation

uses System.SysUtils;

function TPesquisa.FindSQL(sSQL: string): TFDQuery;
var
  FDQuery: TFDQuery;
begin
  FDQuery := TFDQuery.Create(nil);
  FDQuery.Connection := Connection;
  FDQuery.SQL.Clear;
  FDQuery.SQL.Add(sSQL);
  FDQuery.Open();
  Result := FDQuery;
end;

end.
