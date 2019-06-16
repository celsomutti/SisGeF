unit uthrImportarFinanceiroTFO;

interface

uses
  System.Classes, VCL.Dialogs, Windows, VCL.Forms, System.SysUtils, clUtil,
  clEntregador, clAgentes, clEntrega, Messages, Controls,
  System.DateUtils;

type
  TCSVFinanceiro = record
    _codigoagenteTFO: String;
    _nomeagenteTFO: String;
    _identregador: String;
    _nomeentregador: String;
    _atribuicao: String;
    _idcliente: String;
    _nomecliente: String;
    _pedido: String;
    _nossonumero: String;
    _cep: String;
    _volume: String;
    _pesoreal: String;
    _pesopago: String;
    _valorverba: String;
    _advalorem: String;
    _valorpago: String;
    _situacao: String;
    _tipopeso: String;
  end;

  thrImportarFinanceiroTFO = class(TThread)
  private
    { Private declarations }
    entregador: TEntregador;
    entrega: TEntrega;
    agentes: TAgente;
    CSVFinanceiro: TCSVFinanceiro;

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

  procedure thrImportaBaixas.UpdateCaption;
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

{ thrImportaBaixas }

uses ufrmImportarFinanceiro, uGlobais;

function thrImportarFinanceiroTFO.TrataLinha(sLinha: String): String;
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

procedure thrImportarFinanceiroTFO.Execute;
var
  ArquivoCSV: TextFile;
  Contador, I, LinhasTotal, iVolumes, iRet, iAtraso, iCadastro: Integer;
  Linha, campo, codigo, sDescricao, agente, sMess, sData: String;
  dVerba: Double;
  bFlagPrimeiro, bAtivo: Boolean;
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
  entregador := TEntregador.Create;
  entrega := TEntrega.Create;
  agentes := TAgente.Create;
  bFlagPrimeiro := False;
  LinhasTotal := TUtil.NumeroDeLinhasTXT(frmImportarFinanceiro.sFile);
  // Carregando o arquivo ...

  AssignFile(ArquivoCSV, frmImportarFinanceiro.sFile);
  try
    Reset(ArquivoCSV);
    Readln(ArquivoCSV, Linha);
    sDescricao := Copy(Linha, 0, 18);
    sData := Copy(Linha, 20, 10);
    if sDescricao <> 'EXPRESSA DATA BASE' then
    begin
      MessageDlg('Arquivo informado não é de Entrada de Financeiro !',
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
      with CSVFinanceiro do
      begin
        _codigoagenteTFO := MontaValor;
        _nomeagenteTFO := MontaValor;
        _identregador := MontaValor;
        _nomeentregador := MontaValor;
        _atribuicao := MontaValor;
        _idcliente := MontaValor;
        _nomecliente := MontaValor;
        _pedido := MontaValor;
        _nossonumero := MontaValor;
        _cep := MontaValor;
        _volume := MontaValor;
        _pesoreal := MontaValor;
        _pesopago := MontaValor;
        _valorverba := MontaValor;
        _advalorem := MontaValor;
        _valorpago := MontaValor;
        _situacao := MontaValor;
        _tipopeso := MontaValor;
      end;
      if entrega.getObject(CSVFinanceiro._nossonumero, 'NOSSONUMERO') then
      begin
        if StrToInt(CSVFinanceiro._identregador) > 0 then
        begin
          if (entrega.entregador <> StrToInt(CSVFinanceiro._identregador)) then
          begin
            entrega.entregador := StrToInt(CSVFinanceiro._identregador);
          end;
        end;
        if (not TUtil.Empty(CSVFinanceiro._atribuicao)) then
        begin
          entrega.Atribuicao := StrToDateTime(CSVFinanceiro._atribuicao);
        end;
        entrega.PesoReal := StrToFloat(CSVFinanceiro._pesoreal);
        entrega.VerbaDistribuicao := StrToFloat(CSVFinanceiro._valorverba);
        entrega.Advalorem := StrToFloat(CSVFinanceiro._advalorem);
        entrega.ValorFranquia := StrToFloat(CSVFinanceiro._valorpago);
        entrega.PesoCobrado := StrToFloat(CSVFinanceiro._pesopago);
        entrega.TipoPeso := CSVFinanceiro._tipopeso;
        entrega.DataCredito := StrToDate(sData);
        entrega.Credito := 'S';
        if (not entrega.Update()) then
        begin
          sMensagem := 'Erro ao salvar Financeiro do NN ' +
            entrega.NossoNumero + ' !';
          Synchronize(AtualizaLog);
        end;
      end
      else
      begin
        if entregador.getObject(CSVFinanceiro._identregador, 'CODIGO') then
        begin
          entrega.agente := entregador.agente;
        end;
        entrega.entregador := StrToInt(CSVFinanceiro._identregador);
        entrega.NossoNumero := CSVFinanceiro._nossonumero;
        entrega.Cliente := StrToInt(CSVFinanceiro._idcliente);
        entrega.NF := '0';
        entrega.Consumidor := 'DADOS FINANCEIRO';
        entrega.Endereco := '';
        entrega.Complemento := '';
        entrega.Bairro := '';
        entrega.Cidade := '';
        entrega.Cep := CSVFinanceiro._cep;
        entrega.Telefone := '';
        entrega.Volumes := StrToInt(CSVFinanceiro._volume);
        entrega.Baixado := 'S';
        entrega.Pago := 'S';
        if (not TUtil.Empty(CSVFinanceiro._atribuicao)) then
        begin
          entrega.Atribuicao := StrToDateTime(CSVFinanceiro._atribuicao);
        end;
        entrega.Status := 0;
        entrega.PesoReal := StrToFloat(CSVFinanceiro._pesoreal);
        entrega.VerbaDistribuicao := StrToFloat(CSVFinanceiro._valorverba);
        entrega.Advalorem := StrToFloat(CSVFinanceiro._advalorem);
        entrega.ValorFranquia := StrToFloat(CSVFinanceiro._valorpago);
        entrega.Fechado := 'S';
        entrega.Extrato := '0';
        entrega.VerbaEntregador := 0;
        entrega.DiasAtraso := 0;
        entrega.VolumesExtra := 0;
        entrega.ValorExtra := 0;
        entrega.PesoCobrado := StrToFloat(CSVFinanceiro._pesopago);
        entrega.TipoPeso := CSVFinanceiro._tipopeso;
        entrega.Recebido := 'S';
        entrega.Ctrc := 0;
        entrega.Manifesto := 0;
        entrega.Rastreio := '';
        entrega.Lote := 0;
        entrega.Retorno := '';
        entrega.DataCredito := StrToDate(sData);
        entrega.Credito := 'S';
        if (not entrega.Insert()) then
        begin
          sMensagem := 'Erro ao incluir Financeiro do NN ' +
            entrega.NossoNumero + ' !';
          Synchronize(AtualizaLog);
        end;
        sMensagem := 'NN ' + entrega.NossoNumero + ' incluido!';
        Synchronize(AtualizaLog);
      end;
      I := 0;
      bFlagPrimeiro := False;
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
        Abort;
      end;
    end;
  finally
    CloseFile(ArquivoCSV);
    Application.MessageBox('Importação concluída!', 'Importação de Baixas',
      MB_OK + MB_ICONINFORMATION);
    sMensagem := 'Importação terminada em ' +
      FormatDateTime('dd/mm/yyyy hh:mm:ss', Now);
    Synchronize(AtualizaLog);
    Synchronize(TerminaProcesso);
    entregador.Free;
    entrega.Free;
    agentes.Free;
  end;
end;

procedure thrImportarFinanceiroTFO.AtualizaLog;
begin
  frmImportarFinanceiro.cxLog.Lines.Add(sMensagem);
  frmImportarFinanceiro.cxLog.Refresh;
end;

procedure thrImportarFinanceiroTFO.AtualizaProgress;
begin
  frmImportarFinanceiro.cxProgressBar1.Position := dPosicao;
  frmImportarFinanceiro.cxProgressBar1.Properties.Text := 'Registro ' +
    IntToStr(iConta) + ' de ' + IntToStr(iTotal);
  frmImportarFinanceiro.cxProgressBar1.Refresh;
  if not(frmImportarFinanceiro.actImportarImportar.Visible) then
  begin
    frmImportarFinanceiro.actImportarCancelar.Visible := True;
    frmImportarFinanceiro.actImportarSair.Enabled := False;
    frmImportarFinanceiro.actImportarImportar.Enabled := False;
  end;

end;

procedure thrImportarFinanceiroTFO.TerminaProcesso;
begin
  frmImportarFinanceiro.actImportarCancelar.Visible := False;
  frmImportarFinanceiro.actImportarSair.Enabled := True;
  frmImportarFinanceiro.actImportarImportar.Enabled := True;
  frmImportarFinanceiro.cxProgressBar1.Properties.Text := '';
  frmImportarFinanceiro.cxProgressBar1.Position := 0;
  frmImportarFinanceiro.cxProgressBar1.Visible := False;
  frmImportarFinanceiro.cxProgressBar1.Clear;
end;

end.
