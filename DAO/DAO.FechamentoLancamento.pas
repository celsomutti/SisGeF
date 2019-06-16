unit DAO.FechamentoLancamento;

interface

uses DAO.Base, Model.FechamentoLancamento, Generics.Collections, System.Classes;

type
  TFechamentoLancamentoDAO = class(TDAO)
  public
    function Insert(aLancamento: TFechamentoLancamento): Boolean;
    function DeleteCodigo(iCodigo: Integer): Boolean;
    function DeleteFechamento(iExtrato: Integer): Boolean;
    function FindLancamentos(sFiltro: String; aParam: array of Variant): TObjectList<TFechamentoLancamento>;
  end;
const
  TABLENAME = 'fin_debito_extravio';

implementation

uses System.SysUtils, FireDAC.Comp.Client, Data.DB;

{ TDebitosExtraviosDAO }

function TFechamentoLancamentoDAO.DeleteCodigo(iCodigo: Integer): Boolean;
var
  sSQL : String;
begin
  Result := False;
  if iCodigo = 0 then
  begin
    Exit;
  end;
  sSQL := 'DELETE FROM ' + TABLENAME + ' WHERE COD_LANCAMENTO = :CODIGO';
  Connection.ExecSQL(sSQL,[iCodigo],[ftInteger]);
  Result := True;
end;

function TFechamentoLancamentoDAO.DeleteFechamento(iExtrato: Integer): Boolean;
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

function TFechamentoLancamentoDAO.FindLancamentos(sFiltro: String; aParam: array of Variant): TObjectList<TFechamentoLancamento>;
var
  FDQuery: TFDQuery;
  debitos: TObjectList<TFechamentoLancamento>;
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
      FDQuery.SQL.Add('WHERE COD_LANCAMENTO = :CODIGO');
      FDQuery.ParamByName('CODIGO').AsInteger := aParam[0];
    end;
    if sFiltro = 'FECHAMENTO' then
    begin
      FDQuery.SQL.Add('WHERE ID_EXTRATO = :ID');
      FDQuery.ParamByName('ID').AsInteger := aParam[0];
    end;
    if sFiltro = 'FILTRO' then
    begin
      FDQuery.SQL.Add(aParam[0]);
    end;
    FDQuery.Open();
    debitos := TObjectList<TFechamentoLancamento>.Create;
    while not FDQuery.Eof do
    begin
      debitos.Add(TFechamentoLancamento.Create(FDQuery.FieldByName('COD_EXTRAVIO').AsInteger,
                                               FDQuery.FieldByName('ID_EXTRATO').AsInteger));
      FDQuery.Next;
    end;
    Result := debitos;
  finally
    FDQuery.Free;
  end;
end;

function TFechamentoLancamentoDAO.Insert(aLancamento: TFechamentoLancamento): Boolean;
var
  sSQL : System.string;
begin
  Result := False;
  sSQL := 'INSERT INTO ' + TABLENAME + ' (COD_EXTRAVIO, ID_EXTRATO)' +
                                       'VALUES ' +
                                       '(:PCOD_EXTRAVIO, :PID_EXTRATO)';
  Connection.ExecSQL(sSQL,[aLancamento.Lancamento, aLancamento.Extrato],
                          [ftInteger, ftInteger]);
  Result := True;
end;

end.
