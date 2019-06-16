unit uthrCancelarFechamento;

interface

uses
  System.Classes, clAgentes, clEntregador, clEntrega, clExtrato, clLancamentos,
  clAbastecimentos,
  clRestricoes, clPlanilhaCredito, clUtil, udm, Dialogs, Windows, Forms,
  SysUtils, Messages, Controls,
  System.DateUtils;

type
  thrCancelarFechamento = class(TThread)
  private
    { Private declarations }
    agente: TAgente;
    entregador: TEntregador;
    entrega: TEntrega;
    extrato: TExtrato;
    lancamento: TLancamentos;
    restricao: TRestricoes;
    abastecimento: TAbastecimentos;
    planilha: TPlanilhaCredito;
  protected
    procedure Execute; override;
    procedure IniciaProcesso;
    procedure AtualizaProgress;
    procedure TerminaProcesso;
  end;

implementation

{
  Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

  Synchronize(UpdateCaption);

  and UpdateCaption could look like,

  procedure thrCancelarFechamento.UpdateCaption;
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

{ thrCancelarFechamento }

uses
  ufrmExtrato, uGlobais;

procedure thrCancelarFechamento.Execute;
var
  Contador, LinhasTotal, iCodigo: Integer;
begin
  agente := TAgente.Create();
  entregador := TEntregador.Create();
  entrega := TEntrega.Create();
  extrato := TExtrato.Create();
  lancamento := TLancamentos.Create();
  restricao := TRestricoes.Create();
  abastecimento := TAbastecimentos.Create();
  planilha := TPlanilhaCredito.Create();
  try
    Contador := 1;
    LinhasTotal := dm.tbExtrato.RecordCount;
    Synchronize(IniciaProcesso);
    dm.tbExtrato.First;
    while not(dm.tbExtrato.Eof) do
    begin
      iCodigo := dm.tbExtratoCOD_ENTREGADOR.AsInteger;
      // Cancela fechamento das entregas
      if not(entrega.Fechar(dm.tbExtratoDAT_INICIO.AsString,
        dm.tbExtratoDAT_TERMINO.AsString, dm.tbExtratoDAT_PAGO.AsString,
        dm.tbExtratoNUM_EXTRATO.AsString, dm.tbExtratoCOD_AGENTE.AsString,
        dm.tbExtratoCOD_ENTREGADOR.AsString, 'BAIXA', 'CANCELAR', 0)) then
      begin
        MessageDlg('Erro Cancelamento de Fechamento: ENTREGAS; Agente: ' +
          dm.tbExtratoCOD_AGENTE.AsString + ' / Entregador: ' +
          dm.tbExtratoCOD_ENTREGADOR.AsString, mtWarning, [mbOK], 0);
        Self.Terminate;
      end;
      // Cancela fechameto dos abastecimentos
      if not(TUtil.Empty(dm.tbExtratoDAT_INICIO_ABASTECIMENTO.AsString)) then
      begin
        if not(abastecimento.Fechar(dm.tbExtratoDAT_INICIO_ABASTECIMENTO.
          AsString, dm.tbExtratoDAT_FINAL_ABASTECIMENTO.AsString,
          dm.tbExtratoCOD_ENTREGADOR.AsString, dm.tbExtratoNUM_EXTRATO.AsString, 'CANCELAR')) then
        begin
          MessageDlg('Erro Cancelamento Fechamento: ENTREGAS; Agente: ' +
            dm.tbExtratoCOD_AGENTE.AsString + ' / Entregador: ' +
            dm.tbExtratoCOD_ENTREGADOR.AsString, mtWarning, [mbOK], 0);
          Self.Terminate;
        end;
      end;
      // Retorna valores das restrições
      if dm.tbExtratoVAL_RESTRICAO.Value < 0 then
      begin
        if restricao.getObject(dm.tbExtratoCOD_ENTREGADOR.AsString, 'ENTREGADOR')
        then
        begin
          restricao.Valor := restricao.Valor +
            ABS(dm.tbExtratoVAL_RESTRICAO.Value);
          restricao.Pago := restricao.Pago + dm.tbExtratoVAL_RESTRICAO.Value;
          restricao.Debitar := ABS(dm.tbExtratoVAL_RESTRICAO.Value);
          if not(restricao.Update) then
          begin
            MessageDlg('Erro Cancelamento do Fechamento: RESTRIÇÃO; Agente: ' +
              dm.tbExtratoCOD_AGENTE.AsString + ' / Entregador: ' +
              dm.tbExtratoCOD_ENTREGADOR.AsString, mtWarning, [mbOK], 0);
            Self.Terminate;
          end;
        end
        else
        begin
          if restricao.getObject(dm.tbExtratoCOD_AGENTE.AsString, 'AGENTE') then
          begin
            restricao.Valor := restricao.Valor +
              ABS(dm.tbExtratoVAL_RESTRICAO.Value);
            restricao.Pago := restricao.Pago + dm.tbExtratoVAL_RESTRICAO.Value;
            restricao.Debitar := ABS(dm.tbExtratoVAL_RESTRICAO.Value);
            if not(restricao.Update) then
            begin
              MessageDlg('Erro Cancelamento Fechamento: RESTRIÇÃO; Agente: ' +
                dm.tbExtratoCOD_AGENTE.AsString + ' / Entregador: ' +
                dm.tbExtratoCOD_ENTREGADOR.AsString, mtWarning, [mbOK], 0);
              Self.Terminate;
            end;
          end;
        end;
      end;
      // Cancela fechamento de lançamentos de débitos e créditos
      if entregador.getObject(dm.tbExtratoCOD_ENTREGADOR.AsString, 'CODIGO')
      then
      begin
        iCodigo := entregador.Cadastro;
      end;

      if not(lancamento.Fechar(dm.tbExtratoDAT_INICIO.AsString,
        dm.tbExtratoDAT_TERMINO.AsString, dm.tbExtratoDAT_PAGO.AsString,
        dm.tbExtratoNUM_EXTRATO.AsString, IntToStr(iCodigo), 'CANCELAR')) then
      begin
        MessageDlg('Erro Cancelamento Fechamento: LANÇAMENTO; Agente: ' +
          dm.tbExtratoCOD_AGENTE.AsString + ' / Entregador: ' +
          dm.tbExtratoCOD_ENTREGADOR.AsString, mtWarning, [mbOK], 0);
        Self.Terminate;
      end;

      // Excluir planilha de crédito
      planilha.extrato := dm.tbExtratoNUM_EXTRATO.AsString;
      if not(planilha.Delete('EXTRATO')) then
      begin
        MessageDlg('Erro Cancelamento Fechamento: PLANILHA: Agente: ' +
          dm.tbExtratoCOD_AGENTE.AsString + ' / Entregador: ' +
          dm.tbExtratoCOD_ENTREGADOR.AsString, mtWarning, [mbOK], 0);
        Self.Terminate;
      end;

      // Excluir registro do extrato
      extrato.CodigoAgente := dm.tbExtratoCOD_AGENTE.Value;
      extrato.CodigoEntregador := dm.tbExtratoCOD_ENTREGADOR.Value;
      extrato.DataBase := dm.tbExtratoDAT_TERMINO.Value;

      if not(extrato.Delete('BASE1')) then
      begin
        MessageDlg('Erro Fechamento: EXTRATO; Agente: ' +
          dm.tbExtratoCOD_AGENTE.AsString + ' / Entregador: ' +
          dm.tbExtratoCOD_ENTREGADOR.AsString, mtWarning, [mbOK], 0);
        Self.Terminate;
      end;
      dPosicao := (Contador / LinhasTotal) * 100;
      Inc(Contador);
      if not(Self.Terminated) then
      begin
        Synchronize(AtualizaProgress);
      end
      else
      begin
        agente.Free;
        entregador.Free;
        entrega.Free;
        extrato.Free;
        lancamento.Free;
        restricao.Free;
        abastecimento.Free;
        planilha.Free;
        Abort;
      end;
      dm.tbExtrato.Next;
    end;
  finally
    Synchronize(TerminaProcesso);
    agente.Free;
    entregador.Free;
    entrega.Free;
    extrato.Free;
    lancamento.Free;
    restricao.Free;
    abastecimento.Free;
    planilha.Free;
  end;
end;

procedure thrCancelarFechamento.AtualizaProgress;
begin
  frmExtrato.cxProgressBar.Visible := True;
  frmExtrato.cxProgressBar.Position := Round(dPosicao);
  frmExtrato.cxProgressBar.Properties.Text := IntToStr(Round(dPosicao)) + '%';
  frmExtrato.cxProgressBar.Refresh;

end;

procedure thrCancelarFechamento.TerminaProcesso;
begin
  frmExtrato.cxGrid1DBTableView1.OptionsView.NoDataToDisplayInfoText :=
    '<Nenhuma Informação Disponível>';
  frmExtrato.cxProgressBar.Visible := False;
  frmExtrato.cxProgressBar.Properties.Text := '';
  frmExtrato.cxProgressBar.Position := 0;
  frmExtrato.cxProgressBar.Clear;
  frmExtrato.dsExtrato.Enabled := True;
  frmExtrato.actFechamentoExportarResumo.Enabled := False;
  frmExtrato.actFechamentoExportarEntregas.Enabled := False;
  frmExtrato.actExtratoCalcular.Enabled := True;
  frmExtrato.actFechamentoFechar.Enabled := False;
  frmExtrato.actFechamentoCancelarFechamento.Enabled := False;
  dm.tbExtrato.Close;
  frmExtrato.dsExtrato.Enabled := True;
  Application.MessageBox('Cancelamento concluído.',
    'Cancelando Fechamento do Extrato', MB_OK + MB_ICONINFORMATION);
end;

procedure thrCancelarFechamento.IniciaProcesso;
begin
  frmExtrato.dsExtrato.Enabled := False;
  frmExtrato.cxGrid1DBTableView1.OptionsView.NoDataToDisplayInfoText :=
    '<Cancelando o Fechamento do Extrato. Aguarde...>';
  frmExtrato.actFechamentoExportarResumo.Enabled := False;
  frmExtrato.actFechamentoExportarEntregas.Enabled := False;
  frmExtrato.actExtratoCalcular.Enabled := False;
  frmExtrato.actFechamentoFechar.Enabled := False;
  frmExtrato.actFechamentoCancelarFechamento.Enabled := False;
  frmExtrato.cxProgressBar.Clear;
end;

end.
