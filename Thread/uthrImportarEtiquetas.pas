unit uthrImportarEtiquetas;

interface

uses
  System.Classes, Dialogs, Windows, Forms, SysUtils, clUtil, Messages, Controls,
  System.DateUtils, clProdutos, clTipoAssinatura,
  clConexao;

type
  TCSVEtiqueta = record
    _codigo: String;
    _tipo: String;
    _nome: String;
    _cuidados: String;
    _endereco: String;
    _complemento: String;
    _referencia: String;
    _bairro: String;
    _cidade: String;
    _cep: String;
    _exemplares: String;
    _agente: String;
    _roteiro: String;
    _condicao: String;
    _ocorrencias: String;
    _revista: String;
  end;

type
  thrImportarEtiquetas = class(TThread)
  private
    { Private declarations }
    CSVEtiqueta: TCSVEtiqueta;
    produto: TProdutos;
    tipo: TTipoAssinatura;
    conexao: TConexao;
  protected
    procedure Execute; override;
    procedure AtualizaProgress;
    procedure TerminaProcesso;
    function TrataLinha(sLinha: String): String;
    function RetornaProduto(sTexto: String): String;
    function RetornaTipo(sTexto: String): String;
  end;

implementation

{ thrImportarEtiquetas }

uses
  uGlobais, udm, ufrmProcesso;

function thrImportarEtiquetas.TrataLinha(sLinha: String): String;
var
  iConta: Integer;
  sLin: String;
  bFlag: Boolean;
begin

  if Pos('"', sLinha) = 0 then
  begin
    Result := sLinha;
    Exit;
  end;

  iConta := 1;
  bFlag := False;
  sLin := '';
  while sLinha[iConta] >= ' ' do
  begin
    if sLinha[iConta] = '"' then
    begin
      if bFlag then
        bFlag := False
      else
        bFlag := True;
    end;
    if bFlag then
    begin
      if sLinha[iConta] = ';' then
        sLin := sLin + ' '
      else
        sLin := sLin + sLinha[iConta];
    end
    else
      sLin := sLin + sLinha[iConta];
    Inc(iConta);
  end;
  Result := sLin;
end;

procedure thrImportarEtiquetas.Execute;
var
  ArquivoCSV: TextFile;
  Contador, I, LinhasTotal, iRet, iPos, iOcorrencias: Integer;
  Linha, campo, codigo, sMess, sData, sEdicao, sProduto, sTipo: String;
  d: Real;

  // Lê Linha e Monta os valores
  function MontaValor: String;
  var
    ValorMontado: String;
  begin
    ValorMontado := '';
    Inc(I);
    While Linha[I] >= ' ' do
    begin
      If Linha[I] = ';' then // vc pode usar qualquer delimitador ... eu
        // estou usando o ";"
        break;
      ValorMontado := ValorMontado + Linha[I];
      Inc(I);
    end;
    Result := ValorMontado;
  end;

begin

  LinhasTotal := iLinhas;

  // Carregando o arquivo ...
  AssignFile(ArquivoCSV, uGlobais.sParametro1);
  sData := uGlobais.sParemetro;
  try
    Reset(ArquivoCSV);
    Readln(ArquivoCSV, Linha);
    iPos := Pos('EDIÇÃO', Linha);
    sEdicao := Copy(Linha, iPos + 8, 8);
    iPos := Pos('PRODUTO:', Linha);
    sProduto := RetornaProduto(Copy(Linha, iPos + 9, Length(Linha)));
    sTipo := RetornaTipo(Copy(Linha, iPos + 9, Length(Linha)));
    Readln(ArquivoCSV, Linha);
    Readln(ArquivoCSV, Linha);
    Contador := 4;
    iOcorrencias := 0;
    while not Eoln(ArquivoCSV) do
    begin
      Readln(ArquivoCSV, Linha);
      Linha := TrataLinha(Linha);
      with CSVEtiqueta do
      begin
        _codigo := MontaValor;
        _nome := MontaValor;
        _cuidados := MontaValor;
        _endereco := MontaValor;
        _complemento := MontaValor;
        _referencia := MontaValor;
        _bairro := MontaValor;
        _cidade := MontaValor;
        _cep := MontaValor;
        _exemplares := MontaValor;
        _agente := MontaValor;
        _roteiro := MontaValor;
        _condicao := MontaValor;
        _ocorrencias := MontaValor;
        _revista := MontaValor;
        if (not TryStrToInt(_ocorrencias, iOcorrencias)) then
        begin
          iOcorrencias := 0;
        end;
        dm.tbImportacaoEtiquetas.Insert;
        dm.tbImportacaoEtiquetasCOD_ASSINANTE.Value := _codigo;
        dm.tbImportacaoEtiquetasCOD_PRODUTO.Value := sProduto;
        dm.tbImportacaoEtiquetasNUM_EDICAO.Value := sEdicao;
        dm.tbimportacaoetiquetasCOD_TIPO_ASSINATURA.Value := sTipo;
        dm.tbImportacaoEtiquetasDAT_EDICAO.Value := StrToDate(sData);
        dm.tbImportacaoEtiquetasNOM_ASSINANTE.Value := _nome;
        dm.tbImportacaoEtiquetasNOM_CUIDADOS.Value := _cuidados;
        dm.tbImportacaoEtiquetasDES_ENDERECO.Value := _endereco;
        dm.tbImportacaoEtiquetasDES_COMPLEMENTO.Value := _complemento;
        dm.tbImportacaoEtiquetasDES_BAIRRO.Value := _bairro;
        dm.tbImportacaoEtiquetasDES_REFERENCIA.Value := _referencia;
        dm.tbImportacaoEtiquetasDES_CIDADE.Value := _cidade;
        dm.tbImportacaoEtiquetasDES_UF.Value := 'RJ';
        dm.tbImportacaoEtiquetasCEP_ENDERECO.Value := _cep;
        dm.tbImportacaoEtiquetasQTD_EXEMPLARES.Value := StrToIntDef(_exemplares, 1);
        dm.tbImportacaoEtiquetasNUM_ROTEIRO.Value := StrToIntDef(_roteiro, 0);
        dm.tbImportacaoEtiquetasCOD_BARRA.Value := '0';
        if iOcorrencias > 0 then
        begin
          dm.tbImportacaoEtiquetasDOM_PROTOCOLO.Value := 'S';
        end
        else
        begin
          dm.tbImportacaoEtiquetasDOM_PROTOCOLO.Value := 'N';
        end;
        dm.tbImportacaoEtiquetasID_REVISTA.Value := _revista;
        dm.tbImportacaoEtiquetas.Post;
      end;
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
        produto.Free;
        Abort;
      end;
    end;
  finally
    CloseFile(ArquivoCSV);
    Synchronize(TerminaProcesso);
  end;
end;

procedure thrImportarEtiquetas.AtualizaProgress;
begin
  frmProcesso.cxProgressBar1.Position := dPosicao;
  frmProcesso.cxProgressBar1.Properties.Text := 'Registro ' + IntToStr(iConta) +
    ' de ' + IntToStr(iTotal);
  frmProcesso.cxProgressBar1.Refresh;
end;

procedure thrImportarEtiquetas.TerminaProcesso;
begin
  dm.tbProdutos.Close;
  dm.tbProdutos.Open;
  produto := TProdutos.Create;
  if produto.getObjects() then
  begin
    dm.tbProdutos.LoadFromDataSet(dm.qryGetObject1);
    dm.qryGetObject1.Close;
    dm.qryGetObject1.SQL.Clear;
    produto.Free;
  end;
  dm.tbTipoAssinatura.Close;
  tipo := TTipoAssinatura.Create;
  if tipo.getObjects() then
  begin
    dm.tbTipoAssinatura.Open;
    dm.tbTipoAssinatura.LoadFromDataSet(dm.qryGetObject1);
    dm.qryGetObject1.Close;
    dm.qryGetObject1.SQL.Clear;
  end;
  tipo.Free;
  frmProcesso.Close;
  dm.dsImportaEtiquetas.Enabled := True;
end;

function thrImportarEtiquetas.RetornaProduto(sTexto: string): String;
var
  I, Total, iParada: Integer;
  sCodigo, sDescricao: String;
begin
  Result := '';
  produto := TProdutos.Create;
  I := 0;
  iParada := 0;
  iTotal := Length(sTexto);
  sCodigo := '';
  sDescricao := '';
  for I := 0 to iTotal do
  begin
    if sTexto[I] <> ' ' then
    begin
      if Pos(sTexto[I], '0123456789ABCÇDEFGHIJKLMNOPQRSTUVXWYZ') > 0 then
      begin
        sCodigo := sCodigo + sTexto[I];
      end;
    end
    else
    begin
      iParada := I;
      break;
    end;
  end;
  iTotal := Pos('EDIÇÃO', sTexto);
  sDescricao := Trim(Copy(sTexto, iParada, iTotal - 5));
  iTotal := Pos('(', sTexto) - 1;
  iParada := Pos('TIPO ASSINATURA:', sTexto) + 17;
  if (not produto.getObject(sCodigo, 'CODIGO')) then
  begin
    produto.codigo := Trim(sCodigo);
    produto.Descricao := Trim(sDescricao);
    produto.Operacao := 'I';
    if (not produto.Insert()) then
    begin
      produto.Free;
      Exit;
    end;
  end;
  dm.qryGetObject1.Close;
  dm.qryGetObject1.SQL.Clear;
  produto.Free;
  Result := sCodigo;
end;

function thrImportarEtiquetas.RetornaTipo(sTexto: string): String;
var
  I, Total, iParada: Integer;
  sCodigo, sDescricao, sTipo: String;
begin
  Result := '';
  tipo := TTipoAssinatura.Create;
  I := 0;
  iParada := 0;
  iTotal := Length(sTexto);
  sCodigo := '';
  sDescricao := '';
  iTotal := Length(sTexto);
  iParada := Pos('TIPO ASSINATURA:', sTexto) + 17;
  for I := iParada to iTotal do
  begin
    if sTexto[I] <> ' ' then
    begin
      if Pos(sTexto[I], '0123456789ABCÇDEFGHIJKLMNOPQRSTUVXWYZ') > 0 then
      begin
        sCodigo := sCodigo + sTexto[I];
      end;
    end
    else
    begin
      iParada := I;
      break;
    end;
  end;
  iTotal := Pos('(', sTexto, iParada);
  sDescricao := Trim(Copy(sTexto, iParada, iTotal - iParada));
  if (not tipo.getObject(sCodigo, 'CODIGO')) then
  begin
    dm.qryGetObject1.Close;
    dm.qryGetObject1.SQL.Clear;
    tipo.codigo := sCodigo;
    tipo.Descricao := sDescricao;
    tipo.Operacao := 'I';
    if (not tipo.Insert()) then
    begin
      tipo.Free;
      Exit;
    end;
  end;
  dm.qryGetObject1.Close;
  dm.qryGetObject1.SQL.Clear;
  tipo.Free;
  Result := sCodigo;
end;

end.
