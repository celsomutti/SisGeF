unit DAO.ParcelamentoRestricao;

interface

uses DAO.Base, Model.Parcelamentorestricao, Generics.Collections, System.Classes;

type
  TParcelamentoRestricaoDAO = class(TDAO)
  public
    function Insert(aParcelamentos: TParcelamentorestricao): Boolean;
    function Update(aParcelamentos: TParcelamentorestricao): Boolean;
    function DeleteCodigo(iCodigo: Integer): Boolean;
    function DeleteParcela(iCodigo: Integer; iParcela: Integer): Boolean;
    function CancelaFechamento(iExtrato: Integer): Boolean;
    function FindParcelamentos(sFiltro: String; aParam: array of Variant): TObjectList<TParcelamentorestricao>;
  end;
const
  TABLENAME = 'fin_parcelamento_restricao';

implementation

uses System.SysUtils, FireDAC.Comp.Client, Data.DB;

{ TParcelamentoRestricaoDAO }

function TParcelamentoRestricaoDAO.CancelaFechamento(iExtrato: Integer): Boolean;
var
  sSQL : String;
begin
  Result := False;
  sSQL := 'UPDATE ' + TABLENAME + ' SET ID_EXTRATO = 0 WHERE ID_EXTRATO = :ID AND DOM_DEBITADO = 0';
  Connection.ExecSQL(sSQL,[iExtrato],[ftInteger]);
  Result := True;
end;

function TParcelamentoRestricaoDAO.DeleteCodigo(iCodigo: Integer): Boolean;
var
  sSQL : String;
begin
  Result := False;
  if iCodigo = 0 then
  begin
    Exit;
  end;
  sSQL := 'DELETE FROM ' + TABLENAME + ' WHERE COD_RESTRICAO = :CODIGO AND DOM_DEBITADO = 0';
  Connection.ExecSQL(sSQL,[iCodigo],[ftInteger]);
  Result := True;
end;

function TParcelamentoRestricaoDAO.DeleteParcela(iCodigo: Integer; iParcela: Integer): Boolean;
var
  sSQL : String;
begin
  Result := False;
  if iCodigo = 0 then
  begin
    Exit;
  end;
  sSQL := 'DELETE FROM ' + TABLENAME + ' WHERE COD_RESTRICAO = :CODIGO AND NUM_PARCELA = :PARCELA';
  Connection.ExecSQL(sSQL,[iCodigo, iParcela],[ftInteger, ftInteger]);
  Result := True;
end;

function TParcelamentoRestricaoDAO.FindParcelamentos(sFiltro: String; aParam: array of Variant): TObjectList<TParcelamentorestricao>;
var
  FDQuery: TFDQuery;
  debitos: TObjectList<TParcelamentoRestricao>;
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
      FDQuery.SQL.Add('WHERE COD_RESTRICAO = :CODIGO');
      FDQuery.ParamByName('CODIGO').AsInteger := aParam[0];
    end;
    if sFiltro = 'PARCELA' then
    begin
      FDQuery.SQL.Add('WHERE COD_RESTRICAO = :CODIGO AND NUM_PARCELA = :PARCELA');
      FDQuery.ParamByName('CODIGO').AsInteger := aParam[0];
      FDQuery.ParamByName('PARCELA').AsInteger := aParam[1];
    end;
    if sFiltro = 'FILTRO' then
    begin
      FDQuery.SQL.Add(aParam[0]);
    end;
    FDQuery.Open();
    debitos := TObjectList<TParcelamentoRestricao>.Create;
    while not FDQuery.Eof do
    begin
      debitos.Add(TParcelamentoRestricao.Create(FDQuery.FieldByName('COD_RESTRICAO').AsInteger,
                                               FDQuery.FieldByName('NUM_PARCELA').AsInteger,
                                               FDQuery.FieldByName('QTD_TOTAL_PARCELAS').AsInteger,
                                               FDQuery.FieldByName('DOM_DEBITADO').AsInteger,
                                               FDQuery.FieldByName('VAL_PARCELA').AsFloat,
                                               FDQuery.FieldByName('ID_EXTRATO').asInteger,
                                               FDQuery.FieldByName('DAT_DEBITO').AsDateTime));
      FDQuery.Next;
    end;
    Result := debitos;
  finally
    FDQuery.Free;
  end;
end;

function TParcelamentoRestricaoDAO.Insert(aParcelamentos: TParcelamentorestricao): Boolean;
var
  sSQL : System.string;
begin
  Result := False;
  sSQL := 'INSERT INTO ' + TABLENAME + ' (COD_RESTRICAO, NUM_PARCELA, QTD_TOTAL_PARCELAS, DOM_DEBITADO, VAL_PARCELA, ID_EXTRATO, DAT_DEBITO)' +
                                       'VALUES ' +
                                       '(:PCOD_RESTRICAO, :PNUM_PARCELA, :PQTD_TOTAL_PARCELAS, :PDOM_DEBITADO, :PVAL_PARCELA, :pID_EXTRATO, :PDAT_DEBITO)';
  Connection.ExecSQL(sSQL,[aParcelamentos.Restricao, aParcelamentos.Parcela, aParcelamentos.TotalParcelas, aParcelamentos.Debitado, aParcelamentos.Valor, aParcelamentos.Extrato,
                          aParcelamentos.Data],
                          [ftInteger, ftInteger, ftInteger, ftInteger, ftFloat, ftInteger, ftDate]);
  Result := True;
end;

function TParcelamentoRestricaoDAO.Update(aParcelamentos: TParcelamentorestricao): Boolean;
var
  sSQL : System.string;
begin
  Result := False;
  sSQL := 'UPDATE ' + TABLENAME + ' SET QTD_TOTAL_PARCELAS = :PQTD_TOTAL_PARCELAS, DOM_DEBITADO = :PDOM_DEBITADO, ' +
          'VAL_PARCELA = :PVAL_PARCELA, ID_EXTRATO = :PID_EXTRATO, DAT_DEBITO = :PDAT_DEBITO WHERE COD_RESTRICAO = :PCOD_RESTRICAO AND NUM_PARCELA = PNUM_PARCELA';
  Connection.ExecSQL(sSQL,[aParcelamentos.TotalParcelas, aParcelamentos.Debitado, aParcelamentos.Valor, aParcelamentos.Extrato, aParcelamentos.Data,
                          aParcelamentos.Restricao, aParcelamentos.Parcela],
                          [ftInteger, ftInteger, ftFloat, ftInteger, ftDate, ftInteger, ftInteger]);
  Result := True;
end;

end.
