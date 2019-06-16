unit uthrPopularEtiquetas;

interface

uses
  System.Classes, Dialogs, Windows, Forms, SysUtils, clUtil, Messages, Controls,
  System.DateUtils, clProdutos, clTipoAssinatura;

type
  thrPopularEtiquetas = class(TThread)
  private
    { Private declarations }
    produto: TProdutos;
    tipo: TTipoAssinatura;
  protected
    procedure Execute; override;
    procedure AtualizaProgress;
    procedure TerminaProcesso;
    procedure IniciaProcesso;
    function RetornaProduto(sTexto: String): String;
    function RetornaTipo(sTexto: String): String;
  end;

implementation

{ thrPopularEtiquetas }

uses
  uGlobais, udm, ufrmProcesso, ufrmImpressao;

procedure thrPopularEtiquetas.Execute;
var
  Contador, I, LinhasTotal, iRet, iPos: Integer;
  Linha, campo, codigo, sMess: String;
  iTotalRoteiro, iTotalGeral, iRoteiro: Integer;
  d: Real;
begin

  iLinhas := dm.qrygetObject1.RecordCount;
  LinhasTotal := iLinhas;
  // Carregando o arquivo ...
  dm.qrygetObject1.First;
  try
    Synchronize(IniciaProcesso);
    Contador := 1;
    iTotalRoteiro := 0;
    iTotalGeral := 0;
    iRoteiro := dm.qrygetObject1.FieldByName('NUM_ROTEIRO').AsInteger;
    while (not dm.qrygetObject1.Eof) do
    begin
      if iRoteiro = dm.qrygetObject1.FieldByName('NUM_ROTEIRO').AsInteger then
      begin
        dm.tbEtiquetas.Insert;
        dm.tbEtiquetasID_ASSINANTE.Value := dm.qrygetObject1.FieldByName('ID_ASSINANTE').AsInteger;
        dm.tbEtiquetasCOD_ASSINANTE.Value := dm.qrygetObject1.FieldByName('COD_ASSINANTE').AsString;
        dm.tbEtiquetasCOD_PRODUTO.Value := RetornaProduto(dm.qrygetObject1.FieldByName('COD_PRODUTO').AsString);
        dm.tbEtiquetasNUM_EDICAO.Value := dm.qrygetObject1.FieldByName('NUM_EDICAO').AsString;
        dm.tbEtiquetasCOD_TIPO_ASSINATURA.Value := RetornaTipo(dm.qrygetObject1.FieldByName('COD_TIPO_ASSINATURA').AsString);
        dm.tbEtiquetasDAT_EDICAO.Value := dm.qrygetObject1.FieldByName('DAT_EDICAO').AsDateTime;
        dm.tbEtiquetasNOM_ASSINANTE.Value := dm.qrygetObject1.FieldByName('NOM_ASSINANTE').AsString;
        if TUtil.Empty(dm.tbEtiquetasNOM_CUIDADOS.Value) then
        begin
          dm.tbEtiquetasNOM_CUIDADOS.Value := 'A/C: ' + dm.qrygetObject1.FieldByName('NOM_CUIDADOS').AsString;
        end
        else
        begin
          dm.tbEtiquetasNOM_CUIDADOS.Value := '';
        end;
        dm.tbEtiquetasDES_ENDERECO.Value := Trim(dm.qrygetObject1.FieldByName('DES_ENDERECO').AsString);
        dm.tbEtiquetasDES_COMPLEMENTO.Value := Trim(dm.qrygetObject1.FieldByName('DES_COMPLEMENTO').AsString);
        dm.tbEtiquetasDES_BAIRRO.Value := dm.qrygetObject1.FieldByName('DES_BAIRRO').AsString;
        dm.tbEtiquetasDES_REFERENCIA.Value := dm.qrygetObject1.FieldByName('DES_REFERENCIA').AsString;
        dm.tbEtiquetasDES_CIDADE.Value := Trim(dm.qrygetObject1.FieldByName('DES_CIDADE').AsString);
        dm.tbEtiquetasDES_UF.Value := dm.qrygetObject1.FieldByName('DES_UF').AsString;
        dm.tbEtiquetasCEP_ENDERECO.Value := Copy(dm.qrygetObject1.FieldByName('CEP_ENDERECO').AsString, 1, 5) +
          '-' + Copy(dm.qrygetObject1.FieldByName('CEP_ENDERECO').AsString, 6, 3);
        dm.tbEtiquetasQTD_EXEMPLARES.Value := dm.qrygetObject1.FieldByName('QTD_EXEMPLARES').AsInteger;
        dm.tbEtiquetasCOD_BARRA.Value := dm.qrygetObject1.FieldByName('COD_BARRA').AsString;
        dm.tbEtiquetasNUM_ROTEIRO.Value := dm.qrygetObject1.FieldByName('NUM_ROTEIRO').AsInteger;
        dm.tbEtiquetasNUM_ORDEM.Value := uGlobais.iTotalEtiquetas;
        dm.tbEtiquetasID_REVISTA.Value := dm.qrygetObject1.FieldByName('ID_REVISTA').AsString;
        dm.tbEtiquetas.Post;
        Dec( uGlobais.iTotalEtiquetas);
        Inc(iTotalRoteiro);
        Inc(iTotalGeral);
      end
      else
      begin
        dm.tbEtiquetas.Insert;
        dm.tbEtiquetasID_ASSINANTE.Value := 0;
        dm.tbEtiquetasCOD_ASSINANTE.Value := '';
        dm.tbEtiquetasCOD_PRODUTO.Value := '';
        dm.tbEtiquetasNUM_EDICAO.Value := '';
        dm.tbEtiquetasCOD_TIPO_ASSINATURA.Value := '';
        dm.tbEtiquetasDAT_EDICAO.Value := dm.qrygetObject1.FieldByName('DAT_EDICAO').AsDateTime;
        dm.tbEtiquetasNOM_ASSINANTE.Value := '';
        dm.tbEtiquetasNOM_CUIDADOS.Value := '';
        dm.tbEtiquetasDES_ENDERECO.Value := 'TOTAL DO ROTEIRO ' + dm.qrygetObject1.FieldByName('NUM_ROTEIRO').AsString +
        ': ' + IntToStr(iTotalRoteiro);
        dm.tbEtiquetasDES_COMPLEMENTO.Value := '';
        dm.tbEtiquetasDES_BAIRRO.Value := '';
        dm.tbEtiquetasDES_REFERENCIA.Value := '';
        dm.tbEtiquetasDES_CIDADE.Value := '';
        dm.tbEtiquetasDES_UF.Value := '';
        dm.tbEtiquetasCEP_ENDERECO.Value := '';
        dm.tbEtiquetasQTD_EXEMPLARES.Value := 0;
        dm.tbEtiquetasCOD_BARRA.Value := '';
        dm.tbEtiquetasNUM_ROTEIRO.Value := iRoteiro;
        dm.tbEtiquetasNUM_ORDEM.Value := 0;
        dm.tbEtiquetasID_REVISTA.Value := '';
        dm.tbEtiquetas.Post;
        iTotalRoteiro := 0;
        iRoteiro := dm.qrygetObject1.FieldByName('NUM_ROTEIRO').AsInteger;
      end;
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
        tipo.Free;
        produto.Free;
        Abort;
      end;
    end;
    dm.tbEtiquetas.Insert;
    dm.tbEtiquetasID_ASSINANTE.Value := 0;
    dm.tbEtiquetasCOD_ASSINANTE.Value := '';
    dm.tbEtiquetasCOD_PRODUTO.Value := '';
    dm.tbEtiquetasNUM_EDICAO.Value := '';
    dm.tbEtiquetasCOD_TIPO_ASSINATURA.Value := '';
    dm.tbEtiquetasDAT_EDICAO.Value := dm.qrygetObject1.FieldByName('DAT_EDICAO').AsDateTime;
    dm.tbEtiquetasNOM_ASSINANTE.Value := '';
    dm.tbEtiquetasNOM_CUIDADOS.Value := '';
    dm.tbEtiquetasDES_ENDERECO.Value := 'TOTAL GERAL: ' + IntToStr(iTotalGeral);
    dm.tbEtiquetasDES_COMPLEMENTO.Value := '';
    dm.tbEtiquetasDES_BAIRRO.Value := '';
    dm.tbEtiquetasDES_REFERENCIA.Value := '';
    dm.tbEtiquetasDES_CIDADE.Value := '';
    dm.tbEtiquetasDES_UF.Value := '';
    dm.tbEtiquetasCEP_ENDERECO.Value := '';
    dm.tbEtiquetasQTD_EXEMPLARES.Value := 0;
    dm.tbEtiquetasCOD_BARRA.Value := '';
    dm.tbEtiquetasNUM_ROTEIRO.Value := iRoteiro;
    dm.tbEtiquetasNUM_ORDEM.Value := 0;
    dm.tbEtiquetasID_REVISTA.Value := '';
    dm.tbEtiquetas.Post;
    iTotalGeral := 0;
  finally
    Synchronize(TerminaProcesso);
  end;
end;

procedure thrPopularEtiquetas.AtualizaProgress;
begin
  frmProcesso.cxProgressBar1.Position := dPosicao;
  frmProcesso.cxProgressBar1.Properties.Text := 'Registro ' + IntToStr(iConta) +
    ' de ' + IntToStr(iTotal);
  frmProcesso.cxProgressBar1.Refresh;
end;

procedure thrPopularEtiquetas.TerminaProcesso;
begin
  dm.qrygetObject1.Close;
  dm.qrygetObject1.SQL.Clear;
  produto.Free;
  tipo.Free;
  frmProcesso.Close;
  with dm.frxReport do
  begin
    if not Assigned(frmImpressao) then
    begin
      frmImpressao := TfrmImpressao.Create(Application);
    end;
    if uGlobais.sResultado = 'ETIQUETAS' then
    begin
      frmImpressao.cxLabel1.Caption := 'ETIQUETAS JORNAL';
      frmImpressao.cxArquivo.Text := ExtractFilePath(Application.ExeName) +
        'Reports\frxEtiquetasJornal.fr3';
    end
    else
    begin
      frmImpressao.cxLabel1.Caption := 'PROTOCOLOS JORNAL';
      frmImpressao.cxArquivo.Text := ExtractFilePath(Application.ExeName) +
        'Reports\frxProtocoloJornal.fr3';
    end;
    if frmImpressao.ShowModal <> mrOk then
    begin
      FreeAndNil(frmImpressao);
      Exit;
    end
    else
    begin
      if (not FileExists(frmImpressao.cxArquivo.Text)) then
      begin
        Application.MessageBox(PChar('Arquivo ' + frmImpressao.cxArquivo.Text +
          ' não foi encontrado!'), 'Atenção', MB_OK + MB_ICONWARNING);
        Exit;
      end;
    end;
    LoadFromFile(frmImpressao.cxArquivo.Text);
    if uGlobais.sResultado = 'PROTOCOLOS' then
    begin
      Variables.Items[Variables.IndexOf('Sistema')].Value :=
        QuotedStr(TUtil.Sistema('Internalname') + ' Versão ' + TUtil.VersaoExe);
    end;
    FreeAndNil(frmImpressao);
    if (not uGlobais.bFlagImprimir) then
    begin
      ShowReport(True);
    end
    else
    begin
      PrepareReport(True);
      Print;
    end;
  end;

end;

procedure thrPopularEtiquetas.IniciaProcesso;
begin
  produto := TProdutos.Create;
  tipo := TTipoAssinatura.Create;
end;

function thrPopularEtiquetas.RetornaProduto(sTexto: string): String;
var
  sDescricao: String;
begin
  Result := '';
  sDescricao := '';
  produto.codigo := sTexto;
  sDescricao := produto.getField('DES_PRODUTO', 'CODIGO');
  if TUtil.Empty(sDescricao) then
  begin
    sDescricao := sTexto;
  end;
  Result := sDescricao;
end;

function thrPopularEtiquetas.RetornaTipo(sTexto: string): String;
var
  sDescricao: String;
begin
  Result := '';
  sDescricao := '';
  tipo.codigo := sTexto;
  sDescricao := tipo.getField('DES_TIPO_ASSINATURA', 'CODIGO');
  if TUtil.Empty(sDescricao) then
  begin
    sDescricao := sTexto;
  end;
  Result := sDescricao;
end;

end.
