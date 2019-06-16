unit DAO.EstoqueInsumos;

interface

uses DAO.base, Model.EstoqueInsumos, Generics.Collections, System.Classes;

type TEstoqueInsumosDAO = class(TDAO)
public
  function Insert(aEstoque: Model.EstoqueInsumos.TEstoqueInsumos): Boolean;
  function Update(aEstoque: Model.EstoqueInsumos.TEstoqueInsumos): Boolean;
  function Delete(sFiltro: String): Boolean;
  function FindEstoque(sFiltro: String): TObjectList<Model.EstoqueInsumos.TEstoqueInsumos>;
  function AtualizaEstoque(iInsumo: Integer; dQuantidade: Double): Double;
end;

const
  TABLENAME = 'tbestoqueinsumos';

implementation

uses System.SysUtils, FireDAC.Comp.Client, Data.DB, uGlobais;

function TEstoqueInsumosDAO.Insert(aEstoque: TEstoqueInsumos): Boolean;
var
  sSQL: String;
begin
  Result := False;
  aEstoque.ID := GetKeyValue(TABLENAME, 'ID_ESTOQUE');
  sSQL := 'INSERT INTO ' + TABLENAME + ' ' +
          '(ID_ESTOQUE, ID_INSUMO, DAT_ESTOQUE, QTD_ESTOQUE, VAL_UNITARIO, VAL_TOTAL, DES_LOG) ' +
          'VALUES ' +
          '(:ID, :INSUMO, :DATA, :ESTOQUE, :UNITARIO, :TOTAL, :LOG);';

  Connection.ExecSQL(sSQL,[aEstoque.ID, aEstoque.Insumo, aEstoque.Data, aEstoque.Qtde, aEstoque.Unitario, aEstoque.Total,
                     aEstoque.Log],[ftInteger, ftInteger, ftDate, ftFloat, ftFloat, ftFloat, ftString]);
  Result := True;
end;

function TEstoqueInsumosDAO.Update(aEstoque: TEstoqueInsumos): Boolean;
var
  sSQL: String;
begin
  Result := False;
  sSQL := 'UPDATE ' + TABLENAME + ' ' +
          'SET ' +
          'ID_INSUMO = :INSUMO, DAT_ESTOQUE = :DATA, QTD_ESTOQUE = :ESTOQUE, VAL_UNITARIO = :UNITARIO, ' +
          'VAL_TOTAL = :TOTAL, DES_LOG = :LOG ' +
          'WHERE ID_ESTOQUE = :ID;';
  Connection.ExecSQL(sSQL,[aEstoque.Insumo, aEstoque.Data, aEstoque.Qtde, aEstoque.Unitario, aEstoque.Total,
                     aEstoque.Log, aEstoque.ID],[FtInteger, ftDate, ftFloat, ftFloat, ftFloat, ftString, ftInteger]);
  Result := True;
end;

function TEstoqueInsumosDAO.Delete(sFiltro: string): Boolean;
var
  sSQL : String;
begin
  Result := False;
  sSQL := 'DELETE FROM ' + TABLENAME + ' ';
  if not sFiltro.IsEmpty then
  begin
    sSQl := sSQL + sFiltro;
  end
  else
  begin
    Exit;
  end;
  Result := True;
end;

function TEstoqueInsumosDAO.FindEstoque(sFiltro: string): TObjectList<TEstoqueInsumos>;
var
  FDQuery: TFDQuery;
  Estoques: TObjectList<TEstoqueInsumos>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    if not sFiltro.IsEmpty then
    begin
      FDQuery.SQL.Add(sFiltro);
    end;
    FDQuery.Open();
    Estoques := TObjectList<TEstoqueInsumos>.Create();
    while not FDQuery.Eof do
    begin
      Estoques.Add(TEstoqueInsumos.Create(FDQuery.FieldByName('ID_ESTOQUE').AsInteger, FDQuery.FieldByName('ID_INSUMO').AsInteger,
                   FDQuery.FieldByName('DAT_ESTOQUE').AsDateTime, FDQuery.FieldByName('QTD_ESTOQUE').AsFloat,
                   FDQuery.FieldByName('VAL_UNITARIO').AsFloat, FDQuery.FieldByName('VAL_TOTAL').AsFloat,
                   FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := Estoques;
end;

function TEstoqueInsumosDAO.AtualizaEstoque(iInsumo: Integer; dQuantidade: Double): Double;
var
  Estoques: TObjectList<TEstoqueInsumos>;
  estoque : TEstoqueInsumos;
  sFiltro: String;
  i: Integer;
  dValor, dSobra: Double;
  bFlag : Boolean;
  sLog : TStringList;
begin
  try
    Result := 0;
    estoque := TEstoqueInsumos.Create();
    sFiltro := 'WHERE ID_INSUMO = ' + IntToStr(iInsumo) + ' AND QTD_ESTOQUE > 0 ORDER BY DAT_ESTOQUE;' ;
    estoques := Self.FindEstoque(sFiltro);
    dValor := 0;
    dSobra := 0;
    if Estoques.Count > 0 then
    begin
      bFlag := True;
      for i := 0 to Estoques.Count - 1 do
      begin
        if bFlag then
        begin
          if Estoques[i].Qtde >= dQuantidade then
          begin
            dValor := Estoques[i].Unitario * dQuantidade;
            Estoques[i].Qtde := Estoques[i].Qtde - dQuantidade;
            Estoques[i].Total := Estoques[i].Qtde * Estoques[i].Unitario;
            bFlag := False;
          end
          else
          begin
            dValor := Estoques[i].Unitario * dQuantidade;
            dSobra := dQuantidade - Estoques[i].Qtde;
            if dSobra > 0 then
            begin
              Estoques[i].Qtde := 0;
              Estoques[i].Total := Estoques[i].Qtde * Estoques[i].Unitario;
              dQuantidade := dSobra;
            end;
          end;
        end;
      end;
    end;
    sLog := TStringList.Create();
    for i := 0 to Estoques.Count - 1 do
    begin
      estoque.ID := Estoques[i].ID;
      estoque.Insumo := Estoques[i].Insumo;
      estoque.Data := Estoques[i].Data;
      estoque.Qtde := Estoques[i].Qtde;
      estoque.Unitario := Estoques[i].Unitario;
      estoque.Total := Estoques[i].Total;
      sLog.Text := Estoques[i].Log;
      sLog.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now()) + ' registro no controle de transportes por ' + uGlobais.sUsuario);
      estoque.Log := sLog.Text;
      Self.Update(estoque);
    end;
    Result := dValor;
  finally
    estoque.Free;
  end;
end;


end.
