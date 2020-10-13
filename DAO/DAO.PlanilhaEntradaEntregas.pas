unit DAO.PlanilhaEntradaEntregas;

interface

uses Generics.Collections, System.Classes, System.SysUtils, Forms, Windows, Model.PlanilhaEntradaEntregas;

type
  TPlanilhaEntradaEntregasDAO = class
  public
    function GetPlanilha(sFile: String): TObjectList<TPlanilhaEntradaEntregas>;
  end;

implementation

{ TPlanilhaEntradaEntregasDAO }

uses Common.Utils;

function TPlanilhaEntradaEntregasDAO.GetPlanilha(sFile: String): TObjectList<TPlanilhaEntradaEntregas>;
var
  ArquivoCSV: TextFile;
  sLinha: String;
  sDetalhe: TStringList;
  entradas : TObjectList<TPlanilhaEntradaEntregas>;
  i : Integer;
  lstRemessa: TStringList;
  iIndex: Integer;
  bFlag: Boolean;
begin
  try
    entradas := TObjectList<TPlanilhaEntradaEntregas>.Create;
    if not FileExists(sFile) then
    begin
      Application.MessageBox(PChar('Arquivo ' + sFile + ' não foi encontrado!'), 'Atenção', MB_ICONWARNING + MB_OK);
      Exit;
    end;
    AssignFile(ArquivoCSV, sFile);
    if sFile.IsEmpty then Exit;
    sDetalhe := TStringList.Create;
    sDetalhe.StrictDelimiter := True;
    sDetalhe.Delimiter := ';';
    lstRemessa := TStringList.Create;
    Reset(ArquivoCSV);
    Readln(ArquivoCSV, sLinha);
    if Copy(sLinha, 0, 38) <> 'CONSULTA DE ENTREGAS NA WEB POR STATUS' then
    begin
      Application.MessageBox('Arquivo informado não foi identificado como a Planilha de Entrada de Entregas!', 'Atenção', MB_ICONWARNING + MB_OK);
      Exit;
    end;
    sDetalhe.DelimitedText := sLinha;
    if sDetalhe.Count <> 26 then
    begin
      Application.MessageBox('Quantidade de Colunas não indica ser da Planilha de Entrada de Entregas!', 'Atenção', MB_ICONWARNING + MB_OK);
      Exit;
    end;
    i := 0;
    while not Eoln(ArquivoCSV) do
    begin
      Readln(ArquivoCSV, sLinha);
      sDetalhe.DelimitedText := sLinha + ';';
      bFlag := False;
      if TUtils.ENumero(sDetalhe[0]) then
      begin
        if StrToIntDef(sDetalhe[25], 1) > 1 then
        begin
          if not lstRemessa.Find(sDetalhe[2], iIndex) then
          begin
            lstRemessa.Add(sDetalhe[2]);
            lstRemessa.Sort;
            bFlag := True;
          end
          else
          begin
            bFlag := False;
          end;
        end
        else
        begin
          bFlag := True;
        end;
        if bFlag then
          begin
          entradas.Add(TPlanilhaEntradaEntregas.Create);
          i := entradas.Count - 1;
          entradas[i].CodigoDestino := sDetalhe[0];
          entradas[i].NomeDestino := sDetalhe[1];
          entradas[i].NossoNumero := sDetalhe[2];
          entradas[i].CodigoCliente := sDetalhe[3];
          entradas[i].NumeroNF := sDetalhe[4];
          entradas[i].NomeConsumidor := sDetalhe[5];
          entradas[i].AosCuidados := sDetalhe[6];
          entradas[i].Logradouro := sDetalhe[7];
          entradas[i].Complemento := sDetalhe[8];
          entradas[i].Bairro := sDetalhe[9];
          entradas[i].Cidade := sDetalhe[10];
          entradas[i].CEP := sDetalhe[11];
          entradas[i].Telefone := sDetalhe[12];
          entradas[i].Expedicao := sDetalhe[13];
          entradas[i].Previsao := sDetalhe[14];
          entradas[i].Status := sDetalhe[15];
          entradas[i].DescricaoStatus := sDetalhe[16];
          entradas[i].NomeEntregador := sDetalhe[17];
          entradas[i].Container := sDetalhe[18];
          entradas[i].ValorProuto := sDetalhe[19];
          entradas[i].ValorVerba := sDetalhe[20];
          entradas[i].Altura := sDetalhe[21];
          entradas[i].Largura := sDetalhe[22];
          entradas[i].Comprimento := sDetalhe[23];
          entradas[i].Peso := sDetalhe[24];
          entradas[i].Volume := sDetalhe[25];
        end;
      end;
    end;
    Result := entradas;
  finally
    CloseFile(ArquivoCSV);
  end;
end;
end.
