unit DAO.Connection;

interface

uses
  FireDAC.Comp.Client, FireDAC.Stan.Def, FireDAC.Phys.MSSQL, FireDAC.Stan.Error,
  FireDAC.Stan.Async, FireDAC.VCLUI.Wait, FireDAC.DApt;

type
  TConnection = class(TObject)
  private
    class var FDConnection: TFDConnection;
  public
    class function GetConnection: TFDConnection;
  end;

implementation

{ TConnection }

uses uGlobais;

class function TConnection.GetConnection: TFDConnection;
begin
  FDConnection := TFDConnection.Create(nil);
  FDConnection.Params.Clear;
  FDConnection.Params.Add('DriverID := ' + uGlobais.pDriverID);
  FDConnection.Params.Add('Database := ' + uGlobais.pDatabase);
  FDConnection.Params.Add('UserName := ' + uGlobais.pUser_name);
  FDConnection.Params.Add('Password := ' + uGlobais.pPassword);
  FDConnection.Connected := True;
  Result := FDConnection;
end;

end.
