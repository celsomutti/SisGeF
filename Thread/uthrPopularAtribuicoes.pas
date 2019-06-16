unit uthrPopularAtribuicoes;

interface

uses
  System.Classes, Dialogs, Windows, Forms, SysUtils, clUtil, Messages, Controls,
  System.DateUtils;

type
  thrPopularAtribuicoes = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
    procedure AtualizaProgress;
    procedure TerminaProcesso;
    procedure IniciaProcesso;
  end;

implementation

{ thrPopularAtribuicoes }

uses
  uGlobais, udm, ufrmProcesso, ufrmImpressao;

procedure thrPopularAtribuicoes.Execute;
var
  Contador, I, LinhasTotal, iRet, iPos, iEtiqueta: Integer;
  Linha, campo, codigo, sMess: String;
  d: Real;
begin

  iLinhas := dm.qrygetObject1.RecordCount - 1;

  LinhasTotal := iLinhas;

  // Carregando o arquivo ...
  dm.qrygetObject1.First;
  try
    Synchronize(IniciaProcesso);
    Contador := 1;
    iEtiqueta := iLinhas + 1;
    while (not dm.qrygetObject1.Eof) do
    begin
      dm.tbAtribuicoes.Insert;
      dm.tbAtribuicoesID_ASSINANTE.Value := dm.qrygetObject1.FieldByName
        ('ID_ASSINANTE').AsInteger;
      dm.tbAtribuicoesDAT_ATRIBUICAO.Value := dm.qrygetObject1.FieldByName
        ('DAT_EDICAO').AsDateTime;
      dm.tbAtribuicoesCOD_PRODUTO.Value := dm.qrygetObject1.FieldByName
        ('COD_PRODUTO').AsString;
      dm.tbAtribuicoesNUM_EDICAO.Value := dm.qrygetObject1.FieldByName
        ('NUM_EDICAO').AsString;
      dm.tbAtribuicoesNUM_NOSSONUMERO.Value := dm.qrygetObject1.FieldByName
        ('COD_ASSINANTE').AsString;
      dm.tbAtribuicoesCOD_TIPO_ASSINATURA.Value :=
        dm.qrygetObject1.FieldByName('COD_TIPO_ASSINATURA').AsString;
      dm.tbAtribuicoesCOD_ENTREGADOR.Value := StrToInt(uGlobais.sResultado);
      dm.tbAtribuicoesNOM_CONSUMIDOR.Value := dm.qrygetObject1.FieldByName
        ('NOM_ASSINANTE').AsString;
      dm.tbAtribuicoesCOD_BARRA.Value := dm.qrygetObject1.FieldByName
        ('COD_BARRA').AsString;
      dm.tbAtribuicoesNOM_CUIDADOS.Value := dm.qrygetObject1.FieldByName
        ('NOM_CUIDADOS').AsString;
      dm.tbAtribuicoesDES_ENDERECO.Value := dm.qrygetObject1.FieldByName
        ('DES_ENDERECO').AsString;
      dm.tbAtribuicoesDES_COMPLEMENTO.Value := dm.qrygetObject1.FieldByName
        ('DES_COMPLEMENTO').AsString;
      dm.tbAtribuicoesDES_BAIRRO.Value := dm.qrygetObject1.FieldByName
        ('DES_BAIRRO').AsString;
      dm.tbAtribuicoesNOM_CIDADE.Value := dm.qrygetObject1.FieldByName
        ('DES_CIDADE').AsString;
      dm.tbAtribuicoesDES_UF.Value := dm.qrygetObject1.FieldByName
        ('DES_UF').AsString;
      dm.tbAtribuicoesNUM_CEP.Value := dm.qrygetObject1.FieldByName
        ('CEP_ENDERECO').AsString;
      dm.tbAtribuicoesQTD_VOLUMES.Value := dm.qrygetObject1.FieldByName
        ('QTD_EXEMPLARES').AsInteger;
      dm.tbAtribuicoesQTD_PESO_REAL.Value := 0;
      dm.tbAtribuicoesCOD_AGENTE.Value := dm.qrygetObject1.FieldByName
        ('NUM_ROTEIRO').AsInteger;
      dm.qrygetObject1.Next;
      I := 0;
      iConta := Contador;
      iTotal := LinhasTotal;
      dPosicao := (iConta / iTotal) * 100;
      Inc(Contador, 1);
      if not(Self.Terminated) then
      begin
        Synchronize(AtualizaProgress);
      end
      else
      begin
        dm.qrygetObject1.Close;
        dm.qrygetObject1.SQL.Clear;
        Abort;
      end;
    end;
  finally
    Synchronize(TerminaProcesso);
  end;
end;

procedure thrPopularAtribuicoes.AtualizaProgress;
begin
  frmProcesso.cxProgressBar1.Position := dPosicao;
  frmProcesso.cxProgressBar1.Properties.Text := 'Registro ' + IntToStr(iConta) +
    ' de ' + IntToStr(iTotal);
  frmProcesso.cxProgressBar1.Refresh;
end;

procedure thrPopularAtribuicoes.TerminaProcesso;
begin
  dm.dsAtribuicoes.Enabled := True;
  dm.qrygetObject1.Close;
  dm.qrygetObject1.SQL.Clear;
  frmProcesso.Close;
end;

procedure thrPopularAtribuicoes.IniciaProcesso;
begin
end;

end.
