unit uthrExtratoFechado;

interface

uses
  System.Classes, clExtrato, clUtil, udm, Dialogs, Windows, Forms, SysUtils,
  Messages, Controls,
  System.DateUtils;

type
  thrExtratoFechado = class(TThread)
  private
    { Private declarations }
    extrato: TExtrato;
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

  procedure thrExtratoFechado.UpdateCaption;
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

{ thrExtratoFechado }

uses
  ufrmExtrato, uGlobais;

procedure thrExtratoFechado.Execute;
var
  sData, sData1, sTipo, sAgente, sScopo: String;
  Contador, LinhasTotal, i: Integer;
begin
  extrato := TExtrato.Create;
  try
    if uGlobais.lAgentes.Count = 0 then
    begin
      Exit;
    end;
    sTipo := 'PAGAMENTO';
    sData := frmExtrato.cxInicioPagamento.Text;
    sData1 := frmExtrato.cxTerminoPagamento.Text;
    if frmExtrato.cxFiltroPagamento.ItemIndex = 0 then
    begin
      sScopo := 'A';
    end
    else
    begin
      sScopo := 'E';
    end;
    Contador := 1;
    LinhasTotal := uGlobais.lAgentes.Count;
    Synchronize(IniciaProcesso);
    if dm.tbExtrato.Active then
      dm.tbExtrato.Close;
    dm.tbExtrato.Open;
    for i := 0 to uGlobais.lAgentes.Count - 1 do
    begin
      sAgente := uGlobais.lAgentes[i];
      if extrato.Periodo(sData, sData1, sAgente, sTipo, sScopo) then
      begin
        while not(dm.qryGeral.Eof) do
        begin
          dm.tbExtrato.Insert;
          dm.tbExtratoCOD_AGENTE.Value := dm.qryGeral.FieldByName('COD_AGENTE')
            .AsInteger;
          dm.tbExtratoDES_AGENTE.Value :=
            dm.qryGeral.FieldByName('DES_AGENTE').AsString;
          dm.tbExtratoCOD_ENTREGADOR.Value :=
            dm.qryGeral.FieldByName('COD_ENTREGADOR').AsInteger;
          dm.tbExtratoDES_ENTREGADOR.Value :=
            dm.qryGeral.FieldByName('DES_ENTREGADOR').AsString;
          dm.tbExtratoQTD_VOLUMES.Value :=
            dm.qryGeral.FieldByName('QTD_VOLUMES').AsInteger;
          dm.tbExtratoQTD_ENTREGA.Value :=
            dm.qryGeral.FieldByName('QTD_ENTREGA').AsInteger;
          dm.tbExtratoVAL_VERBA.Value := dm.qryGeral.FieldByName('VAL_VERBA')
            .AsCurrency;
          dm.tbExtratoVAL_VERBA_TOTAL.Value :=
            dm.qryGeral.FieldByName('VAL_VERBA_TOTAL').AsCurrency;
          dm.tbExtratoVAL_CREDITO.Value :=
            dm.qryGeral.FieldByName('VAL_CREDITO').AsCurrency;
          dm.tbExtratoVAL_DEBITO.Value := dm.qryGeral.FieldByName('VAL_DEBITO')
            .AsCurrency;
          dm.tbExtratoVAL_RESTRICAO.Value :=
            dm.qryGeral.FieldByName('VAL_RESTRICAO').AsCurrency;
          dm.tbExtratoVAL_SUB_TOTAL.Value :=
            dm.qryGeral.FieldByName('VAL_SUB_TOTAL').AsCurrency;
          dm.tbExtratoQTD_VOLUMES_EXTRA.Value :=
            dm.qryGeral.FieldByName('QTD_VOLUMES_EXTRA').AsFloat;
          dm.tbExtratoVAL_VOLUMES_EXTRA.Value :=
            dm.qryGeral.FieldByName('VAL_VOLUMES_EXTRA').AsCurrency;
          dm.tbExtratoVAL_TOTAL.Value := dm.qryGeral.FieldByName('VAL_TOTAL')
            .AsCurrency;
          dm.tbExtratoVAL_ABASTECIMENTO.Value :=
            dm.qryGeral.FieldByName('VAL_ABASTECIMENTO').AsCurrency;
          dm.tbExtratoVAL_TOTAL_DESCONTOS.Value :=
            dm.qryGeral.FieldByName('VAL_TOTAL_DESCONTOS').AsCurrency;
          dm.tbExtratoVAL_TOTAL_CREDITOS.Value :=
            dm.qryGeral.FieldByName('VAL_TOTAL_CREDITOS').AsCurrency;
          dm.tbExtratoVAL_TOTAL_GERAL.Value :=
            dm.qryGeral.FieldByName('VAL_TOTAL_GERAL').AsCurrency;
          dm.tbExtratoDAT_INICIO.Value := dm.qryGeral.FieldByName('DAT_INICIO')
            .AsDateTime;
          dm.tbExtratoDAT_TERMINO.Value :=
            dm.qryGeral.FieldByName('DAT_TERMINO').AsDateTime;
          dm.tbExtratoDAT_INICIO_ABASTECIMENTO.Value :=
            dm.qryGeral.FieldByName('DAT_INICIO_ABASTECIMENTO').AsDateTime;
          dm.tbExtratoDAT_FINAL_ABASTECIMENTO.Value :=
            dm.qryGeral.FieldByName('DAT_FINAL_ABASTECIMENTO').AsDateTime;
          dm.tbExtratoDAT_PAGO.Value := dm.qryGeral.FieldByName('DAT_PAGO')
            .AsDateTime;
          dm.tbExtratoNUM_EXTRATO.Value :=
            dm.qryGeral.FieldByName('NUM_EXTRATO').AsString;
          dm.tbExtratoQTD_ATRASOS.Value := dm.qryGeral.FieldByName('QTD_1_DIA')
            .AsInteger;
          dm.tbExtratoQTD_2_DIAS.Value := dm.qryGeral.FieldByName('QTD_2_DIAS')
            .AsInteger;
          dm.tbExtratoQTD_MAIS_DIAS.Value :=
            dm.qryGeral.FieldByName('QTD_MAIS_DIAS').AsInteger;
          dm.tbExtrato.Post;
          dm.qryGeral.Next;
        end;
      end;
      dPosicao := (Contador / LinhasTotal) * 100;
      Inc(Contador);
      if not(Self.Terminated) then
      begin
        Synchronize(AtualizaProgress);
      end
      else
      begin
        extrato.Free;
        Abort;
      end;
    end;
    dm.qryGeral.Close;
    dm.qryGeral.SQL.Clear;
  finally
    Synchronize(TerminaProcesso);
    extrato.Free;
  end;
end;

procedure thrExtratoFechado.AtualizaProgress;
begin
  frmExtrato.cxProgressBar.Visible := True;
  frmExtrato.cxProgressBar.Position := Round(dPosicao);
  frmExtrato.cxProgressBar.Properties.Text := IntToStr(Round(dPosicao)) + '%';
  frmExtrato.cxProgressBar.Refresh;

end;

procedure thrExtratoFechado.TerminaProcesso;
begin
  frmExtrato.cxGrid1DBTableView1.OptionsView.NoDataToDisplayInfoText :=
    '<Nenhuma Informação Disponível>';
  frmExtrato.cxProgressBar.Visible := False;
  frmExtrato.cxProgressBar.Properties.Text := '';
  frmExtrato.cxProgressBar.Position := 0;
  frmExtrato.cxProgressBar.Clear;
  frmExtrato.dsExtrato.Enabled := True;
  frmExtrato.actFechamentoExportarResumo.Enabled := True;
  frmExtrato.actFechamentoExportarEntregas.Enabled := True;
  frmExtrato.actExtratoCalcular.Enabled := True;
  frmExtrato.actFechamentoFechar.Enabled := False;
  if (not dm.tbExtrato.IsEmpty) then
  begin
    frmExtrato.actFechamentoCancelarFechamento.Enabled := True;
  end
  else
  begin
    frmExtrato.actFechamentoCancelarFechamento.Enabled := True;
  end;
  frmExtrato.dsExtrato.Enabled := True;
  frmExtrato.cxGrid1DBTableView1.ViewData.Expand(True);
end;

procedure thrExtratoFechado.IniciaProcesso;
begin
  frmExtrato.dsExtrato.Enabled := False;
  frmExtrato.cxGrid1DBTableView1.OptionsView.NoDataToDisplayInfoText :=
    '<Atualizando a grade. Aguarde...>';
  frmExtrato.actFechamentoExportarResumo.Enabled := False;
  frmExtrato.actFechamentoExportarEntregas.Enabled := False;
  frmExtrato.actExtratoCalcular.Enabled := False;
  frmExtrato.actFechamentoFechar.Enabled := False;
  frmExtrato.actFechamentoCancelarFechamento.Enabled := False;
  frmExtrato.cxProgressBar.Clear;
end;

end.
