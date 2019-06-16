unit uthrImportarEntregas;

interface

uses
  System.Classes, Dialogs, Windows, Forms, SysUtils, clUtil,
  clCodigosEntregadores, clStatus, clAgentes, clEntrega,
  Messages, Controls, System.DateUtils, System.StrUtils;

type
  TCSVEntrega = record
    _agenteTFO: String;
    _descricaoAgenteTFO: String;
    _nossonumero: String;
    _cliente: String;
    _nota: String;
    _consumidor: String;
    _cuidados: String;
    _logradouro: String;
    _complemento: String;
    _bairro: String;
    _cidade: String;
    _cep: String;
    _telefone: String;
    _expedicao: String;
    _previsao: String;
    _status: String;
    _descricaoStatus: String;
    _entregador: String;
    _container: String;
    _valorProduto: String;
    _verba: String;
    _altura: String;
    _largura: String;
    _comprimento: String;
    _peso: String;
    _volumes: String;
    _codcliente: String;
  end;

type
  thrImportarEntregas = class(TThread)
  private
    { Private declarations }
    entregador: TCodigosEntregadores;
    entrega: TEntrega;
    agentes: TAgente;
    status: TStatus;
    CSVEntrega: TCSVEntrega;
  protected
    procedure Execute; override;
    procedure AtualizaLog;
    procedure AtualizaProgress;
    procedure TerminaProcesso;
    function TrataLinha(sLinha: String): String;
  end;

implementation

{
  Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

  Synchronize(UpdateCaption);

  and UpdateCaption could look like,

  procedure thrImportarEntregas.UpdateCaption;
  begin
  Form1.Caption := 'Updated in a thread';
  end;

  or

  Synchronize(
  procedure
  begin
  Form1.Caption := 'Updated in thread via an anonymous method'
  end
  )
  );

  where an anonymous method is passed.

  Similarly, the developer can call the Queue method with similar parameters as
  above, instead passing another TThread class as the first parameter, putting
  the calling thread in a queue with the other thread.

}

{ thrImportarEntregas }

uses
  ufrmImportaentrega, uGlobais;

function thrImportarEntregas.TrataLinha(sLinha: String): String;
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

procedure thrImportarEntregas.Execute;
var
  ArquivoCSV: TextFile;
  Contador, I, LinhasTotal, iRet: Integer;
  Linha, campo, codigo, sMess, sData: String;
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

  entregador := TCodigosEntregadores.Create;
  entrega := TEntrega.Create;
  agentes := TAgente.Create;
  status := TStatus.Create;

  LinhasTotal := TUtil.NumeroDeLinhasTXT(frmImportaEntregas.cxArquivo.Text);

  // Carregando o arquivo ...
  AssignFile(ArquivoCSV, frmImportaEntregas.cxArquivo.Text);
  try
    Reset(ArquivoCSV);
    Readln(ArquivoCSV, Linha);
    if Copy(Linha, 0, 38) <> 'CONSULTA DE ENTREGAS NA WEB POR STATUS' then
    begin
      MessageDlg
        ('Arquivo informado não é de CONSULTA DE ENTREGAS NA WEB POR STATUS.',
        mtWarning, [mbOK], 0);
      Abort;
    end;
    Readln(ArquivoCSV, Linha);
    Readln(ArquivoCSV, Linha);
    Contador := 3;
    while not Eoln(ArquivoCSV) do
    begin
      Readln(ArquivoCSV, Linha);
      Linha := TrataLinha(Linha);
      with CSVEntrega do
      begin
        _agenteTFO := MontaValor;
        _descricaoAgenteTFO := MontaValor;
        _nossonumero := MontaValor;
        _cliente := MontaValor;
        _nota := MontaValor;
        _consumidor := MontaValor;
        _cuidados := MontaValor;
        _logradouro := MontaValor;
        _complemento := MontaValor;
        _bairro := MontaValor;
        _cidade :=  MontaValor;
        _cep := MontaValor;
        _telefone := MontaValor;
        _expedicao := MontaValor;
        _previsao := MontaValor;
        _status := MontaValor;
        _descricaoStatus := MontaValor;
        _entregador := MontaValor;
        _container := MontaValor;
        _valorProduto := MontaValor;
        _verba := MontaValor;
        _altura := MontaValor;
        _largura := MontaValor;
        _comprimento := MontaValor;
        _peso := MontaValor;
        _volumes := MontaValor;
        _codcliente := '1';
      end;
      if not(entrega.getObject(CSVEntrega._nossonumero, 'NOSSONUMERO')) then
      begin
        entrega.Agente := 0;
        entrega.entregador := 0;
        entrega.NossoNumero := CSVEntrega._nossonumero;
        entrega.Cliente := StrToInt(CSVEntrega._cliente);
        entrega.NF := CSVEntrega._nota;
        entrega.Consumidor := CSVEntrega._consumidor;
        entrega.Endereco := CSVEntrega._logradouro;
        entrega.Complemento := Copy(Trim(CSVEntrega._complemento),1,50);
        entrega.Bairro := CSVEntrega._bairro;
        entrega.Cidade := CSVEntrega._cidade;
        entrega.Cep := CSVEntrega._cep;
        entrega.Telefone := Copy(CSVEntrega._telefone,1,30);
        entrega.Expedicao := StrToDate(CSVEntrega._expedicao);
        entrega.PrevDistribuicao := StrToDate(CSVEntrega._previsao);
        entrega.status := StrToInt(CSVEntrega._status);
        entrega.Baixado := 'N';
        if not(status.getObject(CSVEntrega._status, 'CODIGO')) then
        begin
          status.Codigo := StrToInt(CSVEntrega._status);
          status.Descricao := CSVEntrega._descricaoStatus;
          status.Percentual := 0;
          status.Baixa := 'S';
          if (not status.Insert) then
          begin
          sMensagem := 'Erro ao Incluir o Status de Entrega ' + CSVEntrega._status + ' - ' + CSVEntrega._descricaoStatus +
                       ' na tabela de Apoio!';
          Synchronize(AtualizaLog);
          end;
        end;
        CSVEntrega._verba := ReplaceStr(CSVEntrega._verba, 'R$ ', '');
        entrega.VerbaDistribuicao := StrToFloatDef(CSVEntrega._verba,0);
        CSVEntrega._peso := ReplaceStr(CSVEntrega._peso, ' KG', '');
        CSVEntrega._peso := ReplaceStr(CSVEntrega._peso, '.', ',');
        entrega.PesoReal := StrToFloatDef(CSVEntrega._peso,0);
        entrega.Volumes := StrToInt(CSVEntrega._volumes);
        entrega.VolumesExtra := 0;
        entrega.ValorExtra := 0;
        entrega.DiasAtraso := 0;
        entrega.Container := CSVEntrega._container;
        CSVEntrega._valorProduto := ReplaceStr(CSVEntrega._valorProduto, 'R$ ', '');
        entrega.ValorProduto := StrToFloatDef(CSVEntrega._valorProduto,0);
        entrega.Altura := StrToIntDef(CSVEntrega._altura, 0);
        entrega.Largura := StrToIntDef(CSVEntrega._largura, 0);
        entrega.Comprimento := StrToIntDef(CSVEntrega._comprimento, 0);
        entrega.CodCliente := StrToIntDef(CSVEntrega._codcliente, 0);
        entrega.Rastreio := 'Entrega importada em ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' por ' + uGlobais.sNomeUsuario;
        if not(entrega.Insert) then
        begin
          sMensagem := 'Erro ao Incluir os dados do NN ' +
            entrega.NossoNumero + ' !';
          Synchronize(AtualizaLog);
        end;
      end
      else
      begin
        entrega.Cliente := StrToInt(CSVEntrega._cliente);
        entrega.NF := CSVEntrega._nota;
        entrega.Consumidor := CSVEntrega._consumidor;
        entrega.Endereco := CSVEntrega._logradouro;
        entrega.Complemento := CSVEntrega._complemento;
        entrega.Bairro := CSVEntrega._bairro;
        entrega.Cidade := CSVEntrega._cidade;
        entrega.Cep := CSVEntrega._cep;
        entrega.Telefone := Copy(CSVEntrega._telefone,1,30);
        entrega.Expedicao := StrToDate(CSVEntrega._expedicao);
        entrega.PrevDistribuicao := StrToDate(CSVEntrega._previsao);
        entrega.status := StrToInt(CSVEntrega._status);
        CSVEntrega._verba := ReplaceStr(CSVEntrega._verba, 'R$ ', '');
        entrega.VerbaDistribuicao := StrToFloatDef(CSVEntrega._verba,0);
        CSVEntrega._peso := ReplaceStr(CSVEntrega._peso, ' KG', '');
        CSVEntrega._peso := ReplaceStr(CSVEntrega._peso, '.', ',');
        entrega.PesoReal := StrToFloatDef(CSVEntrega._peso,0);
        entrega.Volumes := StrToInt(CSVEntrega._volumes);
        entrega.Container := CSVEntrega._container;
        CSVEntrega._valorProduto := ReplaceStr(CSVEntrega._valorProduto, 'R$ ', '');
        entrega.ValorProduto := StrToFloatDef(CSVEntrega._valorProduto,0);
        entrega.Altura := StrToIntDef(CSVEntrega._altura, 0);
        entrega.Largura := StrToIntDef(CSVEntrega._largura, 0);
        entrega.Comprimento := StrToIntDef(CSVEntrega._comprimento, 0);
        entrega.CodCliente := StrToIntDef(CSVEntrega._codcliente, 0);
        entrega.Rastreio := entrega.Rastreio + #13 +
                            'Entrega re-importada em ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' por ' + uGlobais.sNomeUsuario;
        if not(entrega.Update) then
        begin
          sMensagem := 'Erro ao Alterar os dados do NN ' +
            entrega.NossoNumero + ' !';
          Synchronize(AtualizaLog);
        end;
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
        entregador.Free;
        entrega.Free;
        agentes.Free;
        status.Free;
        Abort;
      end;
    end;
  finally
    CloseFile(ArquivoCSV);
    Application.MessageBox('Importação concluída!', 'Importação de Entregas',
      MB_OK + MB_ICONINFORMATION);
    sMensagem := 'Importação terminada em ' +
      FormatDateTime('dd/mm/yyyy hh:mm:ss', Now);
    Synchronize(AtualizaLog);
    Synchronize(TerminaProcesso);
    entregador.Free;
    entrega.Free;
    agentes.Free;
    status.Free;
  end;
end;

procedure thrImportarEntregas.AtualizaLog;
begin
  frmImportaEntregas.cxLog.Lines.Add(sMensagem);
  frmImportaEntregas.cxLog.Refresh;
end;

procedure thrImportarEntregas.AtualizaProgress;
begin
  frmImportaEntregas.cxProgressBar1.Position := dPosicao;
  frmImportaEntregas.cxProgressBar1.Properties.Text := 'Registro ' +
    IntToStr(iConta) + ' de ' + IntToStr(iTotal);
  frmImportaEntregas.cxProgressBar1.Refresh;
  if not(frmImportaEntregas.actImportaEntregaCancelar.Visible) then
  begin
    frmImportaEntregas.actImportaEntregaCancelar.Visible := True;
    frmImportaEntregas.actImportaEntregaSair.Enabled := False;
    frmImportaEntregas.actImportarEntregaImportar.Enabled := False;
  end;
end;

procedure thrImportarEntregas.TerminaProcesso;
begin
  frmImportaEntregas.actImportaEntregaCancelar.Visible := False;
  frmImportaEntregas.actImportaEntregaSair.Enabled := True;
  frmImportaEntregas.actImportarEntregaImportar.Enabled := True;
  frmImportaEntregas.cxArquivo.Clear;
  frmImportaEntregas.cxProgressBar1.Properties.Text := '';
  frmImportaEntregas.cxProgressBar1.Position := 0;
  frmImportaEntregas.cxProgressBar1.Clear;
end;

end.
