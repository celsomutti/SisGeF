unit uthrSalvarAssinantes;

interface

uses
  System.Classes, Dialogs, Windows, Forms, SysUtils, clUtil, Messages, Controls,
  System.DateUtils, clAssinantes;

type
  thrSalvarAssinantes = class(TThread)
  private
    { Private declarations }
    assinatura: TAssinantes;
  protected
    procedure Execute; override;
    procedure AtualizaProgress;
    procedure TerminaProcesso;
  end;

implementation

{ thrSalvarAssinantes }

uses
  uGlobais, udm, ufrmProcesso;

procedure thrSalvarAssinantes.Execute;
var
  Contador, I, LinhasTotal, iRet, iCod: Integer;
  codigo, sMess, sData: String;
  d: Real;
begin
  assinatura := TAssinantes.Create;
  LinhasTotal := dm.tbAssinantes.RecordCount;
  dm.tbAssinantes.First;
  try
    while (not dm.tbAssinantes.Eof) do
    begin
      if (not assinatura.getObject(dm.tbAssinantesID_ASSINANTE.AsString, 'ID'))
      then
      begin
        assinatura.Id := dm.tbAssinantesID_ASSINANTE.AsInteger;
        assinatura.codigo := dm.tbAssinantesCOD_ASSINANTE.AsString;
        assinatura.Produto := dm.tbAssinantesCOD_PRODUTO.AsString;
        assinatura.Tipo := dm.tbAssinantesCOD_TIPO_ASSINATURA.AsString;
        assinatura.Edicao := dm.tbAssinantesNUM_EDICAO.AsString;
        assinatura.Data := dm.tbAssinantesDAT_EDICAO.AsDateTime;
        assinatura.Nome := dm.tbAssinantesNOM_ASSINANTE.AsString;
        assinatura.Cuidados := dm.tbAssinantesNOM_CUIDADOS.AsString;
        assinatura.Endereco := dm.tbAssinantesDES_ENDERECO.AsString;
        assinatura.Complemento := dm.tbAssinantesDES_COMPLEMENTO.AsString;
        assinatura.Bairro := dm.tbAssinantesDES_BAIRRO.AsString;
        assinatura.Referencia := dm.tbAssinantesDES_REFERENCIA.AsString;
        assinatura.Cidade := dm.tbAssinantesDES_CIDADE.AsString;
        assinatura.UF := dm.tbAssinantesDES_UF.AsString;
        assinatura.CEP := dm.tbAssinantesCEP_ENDERECO.AsString;
        assinatura.Roteiro := dm.tbAssinantesNUM_ROTEIRO.AsInteger;
        assinatura.Quantidade := dm.tbAssinantesQTD_EXEMPLARES.AsInteger;
        assinatura.Barra := dm.tbAssinantesCOD_BARRA.AsString;
        assinatura.Protocolo := dm.tbAssinantesDOM_PROTOCOLO.AsString;
        if (not assinatura.Insert()) then
        begin
          Application.MessageBox(PChar('Erro ao incluir assinatura! Código: ' +
            assinatura.codigo + '.'), 'Atenção!', MB_ICONEXCLAMATION + MB_OK);
        end;
        if assinatura.getObject(dm.tbAssinantesID_ASSINANTE.AsString, 'ID') then
        begin
          assinatura.Barra := Format('%.10d', [assinatura.Id]);
          if (not assinatura.Update()) then
          begin
            Application.MessageBox
              (PChar('Erro ao gerar o código de barras  da assinatura! Código: '
              + assinatura.codigo + '.'), 'Atenção!',
              MB_ICONEXCLAMATION + MB_OK);
          end;
        end;
      end
      else
      begin
        assinatura.Id := dm.tbAssinantesID_ASSINANTE.AsInteger;
        assinatura.codigo := dm.tbAssinantesCOD_ASSINANTE.AsString;
        assinatura.Produto := dm.tbAssinantesCOD_PRODUTO.AsString;
        assinatura.Tipo := dm.tbAssinantesCOD_TIPO_ASSINATURA.AsString;
        assinatura.Edicao := dm.tbAssinantesNUM_EDICAO.AsString;
        assinatura.Data := dm.tbAssinantesDAT_EDICAO.AsDateTime;
        assinatura.Nome := dm.tbAssinantesNOM_ASSINANTE.AsString;
        assinatura.Cuidados := dm.tbAssinantesNOM_CUIDADOS.AsString;
        assinatura.Endereco := dm.tbAssinantesDES_ENDERECO.AsString;
        assinatura.Complemento := dm.tbAssinantesDES_COMPLEMENTO.AsString;
        assinatura.Bairro := dm.tbAssinantesDES_BAIRRO.AsString;
        assinatura.Referencia := dm.tbAssinantesDES_REFERENCIA.AsString;
        assinatura.Cidade := dm.tbAssinantesDES_CIDADE.AsString;
        assinatura.UF := dm.tbAssinantesDES_UF.AsString;
        assinatura.CEP := dm.tbAssinantesCEP_ENDERECO.AsString;
        assinatura.Roteiro := dm.tbAssinantesNUM_ROTEIRO.AsInteger;
        assinatura.Quantidade := dm.tbAssinantesQTD_EXEMPLARES.AsInteger;
        assinatura.Barra := dm.tbAssinantesCOD_BARRA.AsString;
        assinatura.Protocolo := dm.tbAssinantesDOM_PROTOCOLO.AsString;
        if (not assinatura.Update()) then
        begin
          Application.MessageBox(PChar('Erro ao alterar assinatura! Código: ' +
            assinatura.codigo + '.'), 'Atenção!', MB_ICONEXCLAMATION + MB_OK);
        end;
      end;
      dm.qryGetObject1.Close;
      dm.qryGetObject1.SQL.Clear;
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
        assinatura.Free;
        Abort;
      end;
      dm.tbAssinantes.Next;
    end;
  finally
    Synchronize(TerminaProcesso);
  end;
end;

procedure thrSalvarAssinantes.AtualizaProgress;
begin
  frmProcesso.cxProgressBar1.Position := dPosicao;
  frmProcesso.cxProgressBar1.Properties.Text := 'Registro ' + IntToStr(iConta) +
    ' de ' + IntToStr(iTotal);
  frmProcesso.cxProgressBar1.Refresh;
end;

procedure thrSalvarAssinantes.TerminaProcesso;
begin
  frmProcesso.Close;
  assinatura.Free;
  dm.dsAssinantes.Enabled := True;
  dm.tbAssinantes.Close;
  Application.MessageBox('Assinaturas gravadas com sucesso!', 'Gravar',
    MB_OK + MB_ICONINFORMATION);
end;

end.
