unit DAO.ControleBaixasTFO;

interface

uses DAO.Base, Model.ControleBaixasTFO, Generics.Collections, System.Classes;

type
  TControleBaixaTFODAO = class(TDAO)
  public
    function Insert(aControle: TControleBaixasTFO): Boolean;
    function Update(aControle: TControleBaixasTFO): Boolean;
    function Detele(aParam: array of variant): Boolean;
    function Find(aParam:array of Variant): TObjectList<TControleBaixasTFO>;
    function MaxDate(dtBaixa: TDate): TDate;
  end;
  const
    TABLENAME = 'exp_controle_baixas_TFO';


implementation

{ TControleBaixaTFODAO }

uses System.SysUtils, FireDAC.Comp.Client, Data.DB;

function TControleBaixaTFODAO.Detele(aParam: array of variant): Boolean;
var
  sSQL : String;
begin
  Result := False;
  sSQL := 'delete from ' + TABLENAME;
  if aParam[0] = 'ID' then
  begin
    sSQL := sSQL + ' where ID_CONTROLE = :ID';
    Connection.ExecSQL(sSQL,[aParam[1]],[ftInteger]);
  end
  else
  begin
    sSQL := sSQL + ' where DAT_CONTROLE = :DATA';
    Connection.ExecSQL(sSQL,[aParam[1]],[ftDate]);
  end;
  Result := True;
end;

function TControleBaixaTFODAO.Find(aParam: array of Variant): TObjectList<TControleBaixasTFO>;
var
  FDQuery: TFDQuery;
  controles: TObjectList<TControleBaixasTFO>;
begin
  try
    controles := TObjectList<TControleBaixasTFO>.Create;
    FDQuery := TFDQuery.Create(nil);
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('select * from ' + TABLENAME);
    if Length(aParam) < 2 then Exit;
    if aParam[0] = 'ID' then
    begin
      FDQuery.SQL.Add('where ID_CONTROLE = :ID');
      FDQuery.ParamByName('ID').AsInteger := aParam[1];
    end;
    if aParam[0] = 'DATA' then
    begin
      FDQuery.SQL.Add('where DAT_CONTROLE = :DATA');
      FDQuery.ParamByName('DATA').AsDate := aParam[1];
    end;
    FDQuery.Open();
    while not FDQuery.Eof do
    begin
      controles.Add(TControleBaixasTFO.Create(FDQuery.FieldByName('ID_CONTROLE').AsInteger,
                    FDQuery.FieldByName('DAT_CONTROLE').AsDateTime,
                    FDQuery.FieldByName('DOM_STATUS').AsInteger,
                    FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
    Result := controles;
  finally
    FDQuery.Free;
  end;
end;

function TControleBaixaTFODAO.Insert(aControle: TControleBaixasTFO): Boolean;
var
  sSQL : String;
begin
  Result := False;
  sSQL := 'INSERT INTO ' + TABLENAME + ' (ID_CONTROLE, DAT_CONTROLE, DOM_STATUS, DES_LOG) VALUES (:ID_CONTROLE, :DAT_CONTROLE, :DOM_STATUS, :DES_LOG);';
  Connection.ExecSQL(sSQL,[aControle.Id, aControle.Data, aControle.Status, aControle.Log], [ftInteger, ftDate, ftInteger, ftString]);
  Result := True;
end;

function TControleBaixaTFODAO.MaxDate(dtBaixa: TDate): TDate;
var
  FDQuery: TFDQuery;
  dtData: TDate;
begin
  try
    FDQuery := TFDQuery.Create(nil);
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('select max(DAT_CONTROLE) from ' + TABLENAME);
    FDQuery.Open();
    if FDQuery.RecordCount > 0 then
    begin
      dtData := FDQuery.Fields[0].AsDateTime;
      if dtData = 0 then
      begin
        dtData := dtBaixa;
      end;
    end
    else
    begin
      dtData := dtBaixa;
    end;
    Result := dtData;
  finally
    FDQuery.Free;
  end;
end;

function TControleBaixaTFODAO.Update(aControle: TControleBaixasTFO): Boolean;
var
  sSQL : String;
begin
  Result := False;
  sSQL := 'UPDATE ' + TABLENAME + ' SET  DAT_CONTROLE = :DAT_CONTROLE, DOM_STATUS = :DOM_STATUS, DES_LOG = :DES_LOG WHERE ID_CONTROLE = :ID_CONTROLE;';
  Connection.ExecSQL(sSQL,[aControle.Data, aControle.Status, aControle.Log, aControle.Id], [ftDate, ftInteger, ftString, ftInteger]);
  Result := True;
end;

end.
