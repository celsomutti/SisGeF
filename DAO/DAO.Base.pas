unit DAO.Base;

interface

uses
  DAO.ConnectionFactory, FireDAC.Comp.Client;

type
  TDAO = class
  protected
    Connection: TFDConnection;
    function GetKeyValue(ATable, AColumn: string): Integer;
  public
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TDAO }

constructor TDAO.Create;
begin
  Connection := TConnectionFactory.GetConnection;
end;

destructor TDAO.Destroy;
begin
  Connection.Free;
  inherited;
end;

function TDAO.GetKeyValue(ATable, AColumn: string): Integer;
var
  SQL: string;
  Id: Integer;
begin
  SQL := 'select coalesce(max(' + AColumn + '),0) + 1 from ' + ATable;
  Id := Integer(Connection.ExecSQLScalar(SQL));
  result := Id;
end;

end.
