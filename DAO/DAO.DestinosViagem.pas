unit DAO.DestinosViagem;

interface

uses DAO.base, Model.DestinosViagem, Generics.Collections, System.Classes;

  type
    TDestinosViagemDAO = class(TDAO)
    public
    function Insert(aDestinos: TDestinosViagem): Boolean;
    function Update(aDestinos: TDestinosViagem): Boolean;
    function Delete(aParam: array of Variant): Boolean;
    function Find(aParam: array of Variant): TObjectList<TDestinosViagem>;
  end;
const
  TABLENAME = 'trs_destinos_transporte';

implementation

{ TDestinosViagemDAO }

Uses System.SysUtils, FireDAC.Comp.Client, Data.DB;

function TDestinosViagemDAO.Delete(aParam: array of Variant): Boolean;
var
  sSQL: String;
  sWhere: String;
begin
  Result := False;
  if Length(aParam) <= 1 then Exit;
  sSQL := 'DELETE FROM ' + TABLENAME + ' ';
  if aParam[0] = 'ID' then
  begin
    sSQL := 'WHERE ID_DESTINO = :ID';
    Connection.ExecSQL(sSQL + sWhere,[aParam[1]], [ftInteger]);
  end;
  if aParam[0] = 'DESTINO' then
  begin
    sSQL := 'WHERE COD_DESTINO = :DESTINO';
    Connection.ExecSQL(sSQL + sWhere,[aParam[1]], [ftInteger]);
  end;
  if aParam[0] = 'CONTROLE' then
  begin
    sSQL := 'WHERE ID_CONTROLE = :CONTROLE';
    Connection.ExecSQL(sSQL + sWhere,[aParam[1]], [ftInteger]);
  end;
  Result := True;
end;

function TDestinosViagemDAO.Find(aParam: array of Variant): TObjectList<TDestinosViagem>;
var
  FdQuery : TFDQuery;
  destinos : TObjectList<TDestinosViagem>;
begin
  try
    if Length(aParam) <= 1 then Exit;
    FdQuery := TFDQuery.Create(nil);
    FdQuery.Connection := Connection;
    FdQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    destinos := TObjectList<TDestinosViagem>.Create;
    if aParam[0] = 'ID' then
    begin
      FDQuery.SQL.Add('WHERE ID_DESTINO = :ID');
      FDQuery.ParamByName('ID').AsInteger := aParam[1];
    end;
    if aParam[0] = 'DESTINO' then
    begin
      FDQuery.SQL.Add('WHERE COD_DESTINO = :DESTINO');
      FDQuery.ParamByName('DESTINO').AsInteger := aParam[1];
    end;
    if aParam[0] = 'CONTROLE' then
    begin
      FDQuery.SQL.Add('WHERE ID_CONTROLE = :CONTROLE');
      FDQuery.ParamByName('CONTROLE').AsInteger := aParam[1];
    end;
    if aParam[0] = 'FILTRO' then
    begin
      FDQuery.SQL.Add('WHERE ' + aParam[2]);
    end;
    destinos := TObjectList<TDestinosViagem>.Create;
    FDQuery.Open();
    while not FDQuery.Eof do
    begin
      destinos.Add(TDestinosViagem.Create(FDQuery.FieldByName('ID_DESTINO').AsInteger,
                                          FdQuery.FieldByName('COD_DESTINO').AsInteger,
                                          FdQuery.FieldByName('ID_CONTROLE').AsInteger));
      FdQuery.Next;
    end;
    Result := destinos;
  finally
    FdQuery.Free;
  end;
end;

function TDestinosViagemDAO.Insert(aDestinos: TDestinosViagem): Boolean;
var
  sSQL : String;
begin
  Result := False;
  sSQL := 'INSERT INTO ' + TABLENAME + '(ID_DESTINO, COD_DESTINO, ID_CONTROLE) VALUES (:PID_DESTINO, :PCOD_DESTINO, :PID_CONTROLE)';
  Connection.ExecSQL(sSQL,[aDestinos.Id, aDestinos.Destino, aDestinos.Controle], [ftInteger, ftInteger, ftInteger]);
  Result := True;
end;

function TDestinosViagemDAO.Update(aDestinos: TDestinosViagem): Boolean;
var
  sSQL : String;
begin
  Result := False;
  sSQL := 'UPDATE ' + TABLENAME + 'SET COD_DESTINO = :PCOD_DESTINO, ID_CONTROLE = :PID_CONTROLE WHERE ID_DESTINO = :PID_DESTINO';
  Connection.ExecSQL(sSQL,[aDestinos.Destino, aDestinos.Controle, aDestinos.Id], [ftInteger, ftInteger, ftInteger]);
  Result := True;
end;

end.
