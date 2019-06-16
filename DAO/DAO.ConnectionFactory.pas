unit DAO.ConnectionFactory;

interface

uses
  FireDAC.Comp.Client, FireDAC.Stan.Def, FireDAC.Stan.Error, FireDAC.Stan.Async,
  FireDAC.VCLUI.Wait, FireDAC.DApt, FireDAC.Phys.FB;

type
  TConnectionFactory = class
  private
    class var FDConnection: TFDConnection;
  public
    class function GetConnection: TFDConnection;
  end;

implementation

{ TConnectionFactory }

uses uGlobais, Global.Parametros;

class function TConnectionFactory.GetConnection: TFDConnection;
var
  sConnString: String;
begin
  FDConnection := TFDConnection.Create(nil);
  sConnString := 'DriverID=' + uGlobais.pDriverID +
                                   ';Server=' + uGlobais.pServer +
                                   ';Database=' + uGlobais.pDatabase +
                                   ';Port=' + uGlobais.pPort +
                                   ';User_name=' + Global.Parametros.pUBD +
                                   ';Password=' + Global.Parametros.pPBD;

{    if uGlobais.pServer = 'localhost' then
    begin
         sConnString := sConnString + ';User_name=root' + ';Password=rjsmart01';
    end
    else
    begin
      sConnString := sConnString + ';User_name=usersisgef' + ';Password=al0c@rioca';
    end;}

  FDConnection.ConnectionString := sConnString;

  FDConnection.Connected := True;
  Result := FDConnection;
end;

end.
