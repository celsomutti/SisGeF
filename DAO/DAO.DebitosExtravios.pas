unit DAO.DebitosExtravios;

interface

uses DAO.Base, Model.DebitosExtravios, Generics.Collections, System.Classes;

type
  TDebitosExtraviosDAO = class(TDAO)
  public
    function Insert(aDebitos: TDebitosExtravios): Boolean;
    function DeleteCodigo(iCodigo: Integer): Boolean;
    function DeleteFechamento(iExtrato: Integer): Boolean;
    function FindDebitos(sFiltro: String; aParam: array of Variant): TObjectList<TDebitosExtravios>;
  end;
const
  TABLENAME = 'fin_debito_extravio';

implementation

uses System.SysUtils, FireDAC.Comp.Client, Data.DB;

{ TDebitosExtraviosDAO }

function TDebitosExtraviosDAO.DeleteCodigo(iCodigo: Integer): Boolean;
var
  sSQL : String;
begin
  Result := False;
  if iCodigo = 0 then
  begin
    Exit;
  end;
  sSQL := 'DELETE FROM ' + TABLENAME + ' WHERE COD_EXTRAVIO = :CODIGO';
  Connection.ExecSQL(sSQL,[iCodigo],[ftInteger]);
  Result := True;
end;

function TDebitosExtraviosDAO.DeleteFechamento(iExtrato: Integer): Boolean;
var
  sSQL : String;
begin
  Result := False;
  if iExtrato = 0 then
  begin
    Exit;
  end;
  sSQL := 'DELETE FROM ' + TABLENAME + ' WHERE ID_EXTRATO = :ID';
  Connection.ExecSQL(sSQL,[iExtrato],[ftInteger]);
  Result := True;
end;


function TDebitosExtraviosDAO.FindDebitos(sFiltro: String; aParam: array of Variant): TObjectList<TDebitosExtravios>;
var
  FDQuery: TFDQuery;
  debitos: TObjectList<TDebitosExtravios>;
begin
  try
    FDQuery := TFDQuery.Create(nil);
    if Length(aParam) = 0 then
    begin
      Exit;
    end;
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    if sFiltro = 'CODIGO' then
    begin
      FDQuery.SQL.Add('WHERE COD_EXTRAVIO = :CODIGO');
      FDQuery.ParamByName('CODIGO').AsInteger := aParam[0];
    end;
    if sFiltro = 'EXTRATO' then
    begin
      FDQuery.SQL.Add('WHERE ID_EXTRATO = :ID');
      FDQuery.ParamByName('ID').AsInteger := aParam[1];
    end;
    if sFiltro = 'FILTRO' then
    begin
      FDQuery.SQL.Add(aParam[0]);
    end;
    FDQuery.Open();
    debitos := TObjectList<TDebitosExtravios>.Create;
    while not FDQuery.Eof do
    begin
      debitos.Add(TDebitosExtravios.Create(FDQuery.FieldByName('COD_EXTRAVIO').AsInteger,
                                           FDQuery.FieldByName('ID_EXTRATO').AsInteger));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
end;

function TDebitosExtraviosDAO.Insert(aDebitos: TDebitosExtravios): Boolean;
var
  sSQL : System.string;
begin
  Result := False;
  sSQL := 'INSERT INTO ' + TABLENAME + ' (COD_EXTRAVIO, ID_EXTRATO)' +
                                       'VALUES ' +
                                       '(:PCOD_EXTRAVIO, :PID_FECHAMENTO)';
  Connection.ExecSQL(sSQL,[aDebitos.Codigo, aDebitos.Extrato],
                          [ftInteger, ftInteger]);
  Result := True;
end;

end.
