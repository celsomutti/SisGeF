unit DAO.FechamentoRestricao;

interface

uses DAO.Base, Model.FechamentoRestricao, Generics.Collections, System.Classes;

type
  TFechamentoRestricaoDAO = class(TDAO)
  public
    function Insert(aRestricao: TFechamentoRestricao): Boolean;
    function Update(aRestricao: TFechamentoRestricao): Boolean;
    function Delete(iRestricao: Integer): Boolean;
    function Findrestricao(sFiltro: String; aParam: array of Variant): TObjectList<TFechamentoRestricao>;
  end;
const
  TABLENAME = 'fin_fechamento_restricao';

implementation

uses System.SysUtils, FireDAC.Comp.Client, Data.DB;

{ TFechamentoRestricaoDAO }

function TFechamentoRestricaoDAO.Delete(iRestricao: Integer): Boolean;
var
  sSQL: String;
begin
  Result := False;
  if iRestricao = 0 then Exit;
  sSQL := 'DELETE * FROM ' + TABLENAME + ' WHERE COD_RESTRICAO = :PCOD_RESTRICAO';
  Connection.ExecSQL(sSQL,[iRestricao],[ftInteger]);
  Result := True;
end;

function TFechamentoRestricaoDAO.Findrestricao(sFiltro: String; aParam: array of Variant): TObjectList<TFechamentoRestricao>;
var
  FDQuery : TFDQuery;
  restricoes : TObjectList<TFechamentoRestricao>;
begin
  try
    restricoes := TObjectList<TFechamentoRestricao>.Create;
    FDQuery := TFDQuery.Create(nil);
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    if sFiltro = 'CODIGO' then
    begin
      FDQuery.SQL.Add('WHERE COD_RESTRICAO = :CODIGO');
      FDQuery.ParamByName('CODIGO').AsInteger := aParam[0];
    end
    else if sFiltro = 'FECHAMENTO' then
    begin
      FDQuery.SQL.Add('WHERE ID_FECHAMENTO = :ID');
      FDQuery.ParamByName('ID').AsInteger := aParam[0];
    end
    else if sFiltro = 'FILTRO' then
    begin
      FDQuery.SQL.Add(aParam[0]);
    end
    else
    begin
      Exit;
    end;
    restricoes.Add(TFechamentoRestricao.Create(FdQuery.FieldByName('COD_RESTRICAO').AsInteger,
                                               FDQuery.FieldByName('NUM_PARCELA').AsInteger,
                                               FDQuery.FieldByName('ID_FECHAMENTO').AsInteger));
    Result := restricoes;
  finally
      FDQuery.Free;
  end;
end;

function TFechamentoRestricaoDAO.Insert(aRestricao: TFechamentoRestricao): Boolean;
var
  sSQL : String;
begin
  Result := False;
  sSQL := 'INSERT INTO ' + TABLENAME +
           '(COD_RESTRICAO, NUM_PARCELA, ID_FECHAMENTO) ' +
           'VALUES (COD_RESTRICAO, NUM_PARCELA, ID_FECHAMENTO)';
  Connection.ExecSQL(sSQL, [aRestricao.Restricao, aRestricao.Parcela, aRestricao.Fechamento],
                           [ftInteger, ftInteger, ftInteger]);
  Result := True;
end;

function TFechamentoRestricaoDAO.Update(aRestricao: TFechamentoRestricao): Boolean;
var
  sSQL : String;
begin
  Result := False;
  sSQL := 'UPDATE ' + TABLENAME + ' SET ' +
           'ID_FECHAMENTO = :PID_FECHAMENTO' +
           'WHERE ' +
           'COD_RESTRICAO = :PCOD_RESTRICAO AND COD_RESTRICAO = :PCOD_RESTRICAO';
  Connection.ExecSQL(sSQL, [aRestricao.Restricao, aRestricao.Parcela, aRestricao.Fechamento],
                           [ftInteger, ftInteger, ftInteger]);
  Result := True;
end;

end.
