unit DAO.PlanilhaEntradaCarriers;

interface

uses Generics.Collections, System.Classes, System.SysUtils, Forms, Windows, Model.PlanilhaEntradaCarriers;

type
  TPlanilhaEntradaCarriersDAO = class
  public
    function GetPlanilha(sFile: String): TObjectList<TPlanilhaEntradaCarriers>;
  end;

implementation

{ TPlanilhaEntradaCarriersDAO }

uses Common.Utils;

function TPlanilhaEntradaCarriersDAO.GetPlanilha(sFile: String): TObjectList<TPlanilhaEntradaCarriers>;
var
  ArquivoCSV: TextFile;
  sLinha: String;
  sDetalhe: TStringList;
  entradas : TObjectList<TPlanilhaEntradaCarriers>;
  i : Integer;
begin
  try
    entradas := TObjectList<TPlanilhaEntradaCarriers>.Create;
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
    Reset(ArquivoCSV);
    Readln(ArquivoCSV, sLinha);
    sDetalhe.DelimitedText := sLinha;
    if Pos('Nr Rota;',sLinha) = 0 then
    begin
      Application.MessageBox('Arquivo informado não foi identificado como a Planilha de Entrada da Carriers!', 'Atenção', MB_ICONWARNING + MB_OK);
      Exit;
    end;
    sDetalhe.DelimitedText := sLinha;
    i := 0;
    while not Eoln(ArquivoCSV) do
    begin
      Readln(ArquivoCSV, sLinha);
      sDetalhe.DelimitedText := sLinha;
      if TUtils.ENumero(sDetalhe[6]) then
      begin
        entradas.Add(TPlanilhaEntradaCarriers.Create);
        i := entradas.Count - 1;
        entradas[i].NRRota := sDetalhe[0];
        entradas[i].Rota :=  sDetalhe[1];
        entradas[i].Motorista := sDetalhe[2];
        entradas[i].OrdemRota := sDetalhe[3];
        entradas[i].Embarcador := sDetalhe[4];
        entradas[i].Destinatario := sDetalhe[5];
        entradas[i].NREntrega := sDetalhe[6];
        entradas[i].NF := sDetalhe[7];
        entradas[i].Pedido := sDetalhe[8];
        entradas[i].Tipo := sDetalhe[9];
        entradas[i].TipoFrete := sDetalhe[10];
        entradas[i].Volumes := sDetalhe[11];
        entradas[i].ACobrar := sDetalhe[12];
        entradas[i].OBSEntrega := sDetalhe[13];
        entradas[i].IDViagem := sDetalhe[14];
        entradas[i].DataEntrega := sDetalhe[15];
        entradas[i].DataOcorrencia := sDetalhe[16];
        entradas[i].Ocorrencia := sDetalhe[17];
        entradas[i].IDRemessa := sDetalhe[18];
        entradas[i].Endereco := sDetalhe[19];
        entradas[i].Bairro := sDetalhe[20];
        entradas[i].Municipio := sDetalhe[21];
        entradas[i].CEP := sDetalhe[22];
        entradas[i].SituacaoEntrega := sDetalhe[23];
        entradas[i].FreteRemessa := sDetalhe[24];
        entradas[i].FreteCobrar := sDetalhe[25];
        entradas[i].Peso := sDetalhe[26];
        entradas[i].Valor := sDetalhe[27];
        entradas[i].Tentativa := sDetalhe[28];
        entradas[i].Coleta := sDetalhe[29];
        entradas[i].Viagem := sDetalhe[30];
        entradas[i].TipoBaixa := sDetalhe[31];
        entradas[i].IDVolume := sDetalhe[32];
        entradas[i].Situacao := sDetalhe[33];
        entradas[i].OBS := sDetalhe[34];
        entradas[i].NomeBase := sDetalhe[35];
        entradas[i].Latitude := sDetalhe[36];
        entradas[i].Longitude := sDetalhe[37];
        entradas[i].IDPedido := sDetalhe[38];
      end;
    end;
    Result := entradas;
  finally
    CloseFile(ArquivoCSV);
  end;
end;
end.
