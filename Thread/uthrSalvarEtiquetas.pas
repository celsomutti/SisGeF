unit uthrSalvarEtiquetas;

interface

uses
  System.Classes, Dialogs, Windows, Forms, SysUtils, clUtil, Messages, Controls,
  System.DateUtils, clAssinantes;

type
  thrSalvarEtiquetas = class(TThread)
  private
    { Private declarations }
    assinatura: TAssinantes;
  protected
    procedure Execute; override;
    procedure AtualizaProgress;
    procedure TerminaProcesso;
  end;

implementation

{ thrSalvarEtiquetas }

uses
  uGlobais, udm, ufrmProcesso;

procedure thrSalvarEtiquetas.Execute;
var
  Contador, I, LinhasTotal, iRet, iCod: Integer;
  codigo, sMess, sData, sProtocolo: String;
  d: Real;
begin
  assinatura := TAssinantes.Create;
  LinhasTotal := dm.tbImportacaoEtiquetas.RecordCount;
  dm.tbImportacaoEtiquetas.First;
  try
    while (not dm.tbImportacaoEtiquetas.Eof) do
    begin
      assinatura.codigo := dm.tbImportacaoEtiquetasCOD_ASSINANTE.AsString;
      assinatura.Produto := dm.tbImportacaoEtiquetasCOD_PRODUTO.AsString;
      assinatura.Tipo := dm.tbImportacaoEtiquetasCOD_TIPO_ASSINATURA.AsString;
      if (not assinatura.getObject(dm.tbImportacaoEtiquetasCOD_ASSINANTE.AsString, 'CHAVE1')) then
      begin
        iCod := dm.tbImportacaoEtiquetasNUM_ROTEIRO.AsInteger;
        sProtocolo := dm.tbImportacaoEtiquetasDOM_PROTOCOLO.AsString;
      end
      else
      begin
        dm.qryGetObject1.First;
        iCod := dm.qryGetObject1.FieldByName('NUM_ROTEIRO').AsInteger;
        sProtocolo := dm.qryGetObject1.FieldByName('DOM_PROTOCOLO').AsString;
      end;
      assinatura.codigo := dm.tbImportacaoEtiquetasCOD_ASSINANTE.AsString;
      assinatura.Produto := dm.tbImportacaoEtiquetasCOD_PRODUTO.AsString;
      assinatura.Tipo := dm.tbImportacaoEtiquetasCOD_TIPO_ASSINATURA.AsString;
      assinatura.Edicao := dm.tbImportacaoEtiquetasNUM_EDICAO.AsString;
      if (not assinatura.getObject(dm.tbImportacaoEtiquetasCOD_ASSINANTE.AsString, 'CHAVE')) then
      begin
        assinatura.Id := 0;
      end;
      assinatura.codigo := dm.tbImportacaoEtiquetasCOD_ASSINANTE.AsString;
      assinatura.Produto := dm.tbImportacaoEtiquetasCOD_PRODUTO.AsString;
      assinatura.Tipo := dm.tbImportacaoEtiquetasCOD_TIPO_ASSINATURA.AsString;
      assinatura.Edicao := dm.tbImportacaoEtiquetasNUM_EDICAO.AsString;
      assinatura.Data := dm.tbImportacaoEtiquetasDAT_EDICAO.AsDateTime;
      assinatura.Nome := dm.tbImportacaoEtiquetasNOM_ASSINANTE.AsString;
      assinatura.Cuidados := dm.tbImportacaoEtiquetasNOM_CUIDADOS.AsString;
      assinatura.Endereco := dm.tbImportacaoEtiquetasDES_ENDERECO.AsString;
      assinatura.Complemento := dm.tbImportacaoEtiquetasDES_COMPLEMENTO.AsString;
      assinatura.Bairro := dm.tbImportacaoEtiquetasDES_BAIRRO.AsString;
      assinatura.Referencia := dm.tbImportacaoEtiquetasDES_REFERENCIA.AsString;
      assinatura.Cidade := dm.tbImportacaoEtiquetasDES_CIDADE.AsString;
      assinatura.UF := dm.tbImportacaoEtiquetasDES_UF.AsString;
      assinatura.CEP := dm.tbImportacaoEtiquetasCEP_ENDERECO.AsString;
      assinatura.Roteiro := iCod;
      assinatura.Quantidade := dm.tbImportacaoEtiquetasQTD_EXEMPLARES.AsInteger;
      //assinatura.Barra := '';
      assinatura.Protocolo := sProtocolo;
      assinatura.Revista := dm.tbImportacaoEtiquetasID_REVISTA.AsString;
      assinatura.Baixa := 'N';
      assinatura.Recebedor := '';
      assinatura.Grau := '';
      if assinatura.Id = 0 then
      begin
        if (not assinatura.Insert()) then
        begin
          Application.MessageBox(PChar('Erro ao incluir assinatura! Código: ' +
            assinatura.codigo + '.'), 'Atenção!', MB_ICONEXCLAMATION + MB_OK);
        end;
        if assinatura.getObject(dm.tbImportacaoEtiquetasCOD_ASSINANTE.AsString,'CHAVE') then
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
      dm.tbImportacaoEtiquetas.Next;
    end;
  finally
    Synchronize(TerminaProcesso);
  end;
end;

procedure thrSalvarEtiquetas.AtualizaProgress;
begin
  frmProcesso.cxProgressBar1.Position := dPosicao;
  frmProcesso.cxProgressBar1.Properties.Text := 'Registro ' + IntToStr(iConta) +
    ' de ' + IntToStr(iTotal);
  frmProcesso.cxProgressBar1.Refresh;
end;

procedure thrSalvarEtiquetas.TerminaProcesso;
begin
  frmProcesso.Close;
  assinatura.Free;
  dm.dsImportaEtiquetas.Enabled := True;
  dm.tbImportacaoEtiquetas.Close;
  Application.MessageBox('Etiquetas gravadas com sucesso!', 'Gravar',
    MB_OK + MB_ICONINFORMATION);
end;

end.
