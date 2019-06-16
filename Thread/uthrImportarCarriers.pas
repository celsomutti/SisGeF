unit uthrImportarCarriers;

interface

uses
  System.Classes, Dialogs, Windows, Forms, SysUtils, clUtil,
  clCodigosEntregadores, clStatus, clAgentes, clEntrega,
  Messages, Controls, System.DateUtils, System.StrUtils, clCliente;

type
  TCSVEntrega = record
    _agenteTFO: String;
    _descricaoAgenteTFO: String;
    _nossonumero: String;
    _pedido: String;
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
    _databaixa: String;
    _codcliente: String;
  end;

type
  thrImportarEntregas = class(TThread)
  private
    { Private declarations }
    entregador: TCodigosEntregadores;
    entrega: TEntrega;
    agentes: TAgente;
    clientes: TCliente;
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
  sDetalhe: TStringList;
  sAgente: String;
  sEntregador : String;
  sCliente: String;

begin

  entregador := TCodigosEntregadores.Create;
  entrega := TEntrega.Create;
  agentes := TAgente.Create;
  status := TStatus.Create;
  clientes := TCliente.Create;

  LinhasTotal := TUtil.NumeroDeLinhasTXT(frmImportaEntregas.cxArquivo.Text);

  // Carregando o arquivo ...
  AssignFile(ArquivoCSV, frmImportaEntregas.cxArquivo.Text);
  try
    Reset(ArquivoCSV);
    Readln(ArquivoCSV, Linha);
    if Copy(Linha, 0, 59) <> 'Nr Rota;Rota;Motorista;Ordem Rota;Embarcador;Destinatario;' then
    begin
      MessageDlg
        ('Arquivo informado não é de planilha de entregas da Carriers.',
        mtWarning, [mbOK], 0);
      Abort;
    end;
    sDetalhe := TStringList.Create;
    sDetalhe.StrictDelimiter := True;
    sDetalhe.Delimiter := ';';
    Contador := 2;
    while not Eoln(ArquivoCSV) do
    begin
      Readln(ArquivoCSV, Linha);
      sDetalhe.DelimitedText := Linha;
      with CSVEntrega do
      begin
        entregador.Nome := sDetalhe[2];
        sAgente := entregador.getField('COD_AGENTE','NOME');
        sEntregador := entregador.getField('COD_ENTREGADOR','NOME');
        _agenteTFO := sAgente;
        _descricaoAgenteTFO := '';
        _nossonumero := sDetalhe[18];
        _pedido := sDetalhe[8];
        cliente.Razao := Trim(sDetalhe[4]) + ' (CARRIERS)';
        sCliente := cliente.getField('COD_CLIENTE','NOME');
        _cliente := sCliente;
        _nota := sDetalhe[7];
        _consumidor := sDetalhe[5];
        _cuidados := '';
        _logradouro := sDetalhe[19];
        _complemento := '';
        _bairro := sDetalhe[20];
        _cidade :=  sDetalhe[21];
        _cep := sDetalhe[22];
        _telefone := '';
        _expedicao := sDetalhe[30];
        _previsao := sDetalhe[30];
        _status := '909';
        _descricaoStatus := sDetalhe[23];
        _entregador := sEntregador;
        _container := '0';
        _valorProduto := sDetalhe[27];
        _verba := '0';
        _altura := '0';
        _largura := '0';
        _comprimento := '0';
        _peso := sDetalhe[26];
        _volumes := sDetalhe[11];
        _databaixa := sDetalhe[15];
        _codcliente := '2';
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
        entrega.Complemento := CSVEntrega._complemento;
        entrega.Bairro := CSVEntrega._bairro;
        entrega.Cidade := CSVEntrega._cidade;
        entrega.Cep := CSVEntrega._cep;
        entrega.Telefone := Copy(CSVEntrega._telefone,1,30);
        entrega.Expedicao := StrToDate(CSVEntrega._expedicao);
        entrega.PrevDistribuicao := StrToDate(CSVEntrega._previsao);
        entrega.status := StrToInt(CSVEntrega._status);
        if sDetalhe[17] = 'REALIZADA' then
        begin
          entrega.DataBaixa := StrToDate(CSVEntrega._databaixa);
          entrega.Baixado := 'S';
        end;
        CSVEntrega._verba := ReplaceStr(CSVEntrega._verba, 'R$ ', '');
        entrega.VerbaDistribuicao := StrToFloatDef(CSVEntrega._verba,0);
        CSVEntrega._peso := ReplaceStr(CSVEntrega._peso, ' KG', '');
        CSVEntrega._peso := ReplaceStr(CSVEntrega._peso, '.', ',');
        entrega.PesoReal := StrToFloatDef(CSVEntrega._peso,0);
        entrega.PesoCobrado := StrToFloatDef(CSVEntrega._peso,0);
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
        entrega.CodCliente := StrToInt(CSVEntrega._codcliente);
        entrega.Rastreio := 'Entrega importada em ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' por ' + uGlobais.sNomeUsuario;
        if not(entrega.Insert) then
        begin
          sMensagem := 'Erro ao Incluir os dados do NN ' +
            entrega.NossoNumero + ' !';
          Synchronize(AtualizaLog);
        end
        else
        begin
          if sDetalhe[17] = 'REALIZADA' then
          begin
            if not(entrega.Update) then
            begin
              sMensagem := 'Erro ao Alterar os dados do NN ' +
                entrega.NossoNumero + ' !';
              Synchronize(AtualizaLog);
            end;
          end;
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
        entrega.PesoCobrado := StrToFloatDef(CSVEntrega._peso,0);
        entrega.Volumes := StrToInt(CSVEntrega._volumes);
        entrega.Container := CSVEntrega._container;
        CSVEntrega._valorProduto := ReplaceStr(CSVEntrega._valorProduto, 'R$ ', '');
        entrega.ValorProduto := StrToFloatDef(CSVEntrega._valorProduto,0);
        entrega.Altura := StrToIntDef(CSVEntrega._altura, 0);
        entrega.Largura := StrToIntDef(CSVEntrega._largura, 0);
        entrega.Comprimento := StrToIntDef(CSVEntrega._comprimento, 0);
        entrega.CodCliente := StrToInt(CSVEntrega._codcliente);
        if sDetalhe[17] = 'REALIZADA' then
        begin
          entrega.DataBaixa := StrToDate(CSVEntrega._databaixa);
          entrega.Baixado := 'S';
        end;
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
