unit DAO.DesrinosTransporte;

interface

uses DAO.base, Model.DestinosTransporte, Generics.Collections, System.Classes;

type
  tDestinosTransporteDAO = class(TDAO)
  public
    function Insert(aDestinos: TDestinosTransporte): Boolean;
    function Update(aDestinos: TDestinosTransporte): Boolean;
    function Delete(aParam: array of Variant): Boolean;
    function Find(aParam: array of Variant): TObjectList<TDestinosTransporte>;
  end;
const
  TABLENAME = 'trs_destinos';

implementation

{ tDestinosTransporteDAO }

Uses System.SysUtils, FireDAC.Comp.Client, Data.DB;

function tDestinosTransporteDAO.Delete(aParam: array of Variant): Boolean;
var
  sSQL: String;
  sWhere: String;
begin
  Result := False;
  if Length(aParam) <= 1 then Exit;
  sSQL := 'DELETE FROM ' + TABLENAME + ' ';
  if aParam[0] = 'CODIGO' then
  begin
    sSQL := 'WHERE COD_DESTINO = :CODIGO';
    Connection.ExecSQL(sSQL + sWhere,[aParam[1]], [ftInteger]);
  end;
  Result := True;
end;

function tDestinosTransporteDAO.Find(aParam: array of Variant): TObjectList<TDestinosTransporte>;
var
  FdQuery : TFDQuery;
  destinos : TObjectList<TDestinosTransporte>;
begin
  try
    if Length(aParam) <= 1 then Exit;
    FdQuery := TFDQuery.Create(nil);
    FdQuery.Connection := Connection;
    FdQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    destinos := TObjectList<TDestinosTransporte>.Create;
    if aParam[0] = 'CODIGO' then
    begin
      FDQuery.SQL.Add('WHERE COD_DESTINO = :CODIGO');
      FDQuery.ParamByName('CODIGO').AsInteger := aParam[1];
    end;
    if aParam[0] = 'DESCRICAO' then
    begin
      FDQuery.SQL.Add('WHERE DES_DESTINO = :DESTINO');
      FDQuery.ParamByName('DESTINO').AsString := aParam[1];
    end;
    if aParam[0] = 'FILTRO' then
    begin
      FDQuery.SQL.Add('WHERE ' + aParam[2]);
    end;
    destinos := TObjectList<TDestinosTransporte>.Create;
    FDQuery.Open();
    while not FDQuery.Eof do
    begin
      destinos.Add(TDestinosTransporte.Create(FDQuery.FieldByName('COD_DESTINO').AsInteger,
                                              FdQuery.FieldByName('DES_DESTINO').AsString,
                                              FdQuery.FieldByName('DES_LOG').AsString));
      FdQuery.Next;
    end;
    Result := destinos;
  finally
    FdQuery.Free;
  end;
end;

function tDestinosTransporteDAO.Insert(aDestinos: TDestinosTransporte): Boolean;
var
  sSQL : String;
begin
  Result := False;
  sSQL := 'INSERT INTO ' + TABLENAME + '(COD_DESTINO, DES_DESTINO, DES_LOG) VALUES (:PCOD_DESTINO, :PDES_DESTINO, :PDES_LOG)';
  Connection.ExecSQL(sSQL,[aDestinos.Destino, aDestinos.Descricao, aDestinos.Log], [ftInteger, ftString, ftString]);
  Result := True;
end;

function tDestinosTransporteDAO.Update(aDestinos: TDestinosTransporte): Boolean;
var
  sSQL : String;
begin
  Result := False;
  sSQL := 'UPDATE ' + TABLENAME + 'SET DES_DESTINO = :PDES_DESTINO, DES_LOG = :PDES_LOG WHERE COD_DESTINO = :PCOD_DESTINO';
  Connection.ExecSQL(sSQL,[aDestinos.Descricao, aDestinos.Log, aDestinos.Destino], [ftString, ftString, ftInteger]);
  Result := True;
end;

end.



