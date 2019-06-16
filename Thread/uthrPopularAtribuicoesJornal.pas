unit uthrPopularAtribuicoesJornal;

interface

uses
  System.Classes, Dialogs, Windows, Forms, SysUtils, clUtil, Messages, Controls,
  System.DateUtils, clProdutos, clTipoAssinatura;

type
  thrPopularAtribuicoes = class(TThread)
  private
    { Private declarations }
    produto: TProdutos;
    tipo: TTipoAssinatura;
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

  iLinhas := dm.qrygetObject1.RecordCount;

  LinhasTotal := iLinhas;

  // Carregando o arquivo ...
  dm.qrygetObject1.First;
  try
    Synchronize(IniciaProcesso);
    Contador := 1;
    produto := TProdutos.Create;
    tipo := TTipoAssinatura.Create;
    while (not dm.qrygetObject1.Eof) do
    begin
      dm.tbAtribuicoesJornal.Insert;
      dm.tbAtribuicoesJornalID_ASSINANTE.Value :=
        dm.qrygetObject1.FieldByName('ID_ASSINANTE').AsInteger;;
      dm.tbAtribuicoesJornalDAT_ATRIBUICAO.Value :=
        dm.qrygetObject1.FieldByName('DAT_ATRIBUICAO').AsDateTime;
      dm.tbAtribuicoesJornalCOD_PRODUTO.Value := dm.qrygetObject1.FieldByName
        ('COD_PRODUTO').AsString;
      dm.tbAtribuicoesJornalNUM_EDICAO.Value := dm.qrygetObject1.FieldByName
        ('NUM_EDICAO').AsString;
      dm.tbAtribuicoesJornalCOD_ASSINANTE.Value :=
        dm.qrygetObject1.FieldByName('COD_ASSINANTE').AsString;
      dm.tbAtribuicoesJornalCOD_TIPO_ASSINATURA.Value :=
        dm.qrygetObject1.FieldByName('COD_TIPO_ASSINATURA').AsString;
      dm.tbAtribuicoesJornalCOD_ENTREGADOR.Value :=
        dm.qrygetObject1.FieldByName('COD_ENTREGADOR').AsInteger;
      dm.tbAtribuicoesJornalNOM_ASSINANTE.Value :=
        dm.qrygetObject1.FieldByName('NOM_ASSINANTE').AsString;
      dm.tbAtribuicoesJornalCOD_BARRA.Value := dm.qrygetObject1.FieldByName
        ('COD_BARRA').AsString;
      dm.tbAtribuicoesJornalNOM_CUIDADOS.Value :=
        dm.qrygetObject1.FieldByName('NOM_CUIDADOS').AsString;
      dm.tbAtribuicoesJornalDES_ENDERECO.Value :=
        dm.qrygetObject1.FieldByName('DES_ENDERECO').AsString;
      dm.tbAtribuicoesJornalDES_COMPLEMENTO.Value :=
        dm.qrygetObject1.FieldByName('DES_COMPLEMENTO').AsString;
      dm.tbAtribuicoesJornalDES_BAIRRO.Value := dm.qrygetObject1.FieldByName
        ('DES_BAIRRO').AsString;
      dm.tbAtribuicoesJornalDES_CIDADE.Value := dm.qrygetObject1.FieldByName
        ('DES_CIDADE').AsString;
      dm.tbAtribuicoesJornalDES_UF.Value := dm.qrygetObject1.FieldByName
        ('DES_UF').AsString;
      dm.tbAtribuicoesJornalCEP_ENDERECO.Value :=
        dm.qrygetObject1.FieldByName('CEP_ENDERECO').AsString;
      dm.tbAtribuicoesJornalQTD_EXEMPLARES.Value :=
        dm.qrygetObject1.FieldByName('QTD_EXEMPLARES').AsInteger;
      dm.tbAtribuicoesJornalNUM_ROTEIRO.Value := dm.qrygetObject1.FieldByName
        ('NUM_ROTEIRO').AsInteger;
      produto.codigo := dm.qrygetObject1.FieldByName('COD_PRODUTO').AsString;
      dm.tbAtribuicoesJornalDES_PRODUTO.Value := produto.getField('DES_PRODUTO',
        'CODIGO');
      tipo.codigo := dm.qrygetObject1.FieldByName
        ('COD_TIPO_ASSINATURA').AsString;
      dm.tbAtribuicoesJornalDES_TIPO_ASSINATURA.Value :=
        tipo.getField('DES_TIPO_ASSINATURA', 'CODIGO');
      dm.tbAtribuicoesJornal.Post;
      dm.qrygetObject1.Next;
      I := 0;
      iConta := Contador;
      iTotal := LinhasTotal;
      dPosicao := (iConta / iTotal) * 100;
      Inc(Contador, 1);
      if (not Self.Terminated) then
      begin
        Synchronize(AtualizaProgress);
      end
      else
      begin
        produto.Free;
        tipo.Free;
        dm.qrygetObject1.Close;
        dm.qrygetObject1.SQL.Clear;
        Abort;
      end;
    end;
  finally
    produto.Free;
    tipo.Free;
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
