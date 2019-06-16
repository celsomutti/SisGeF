unit uthrExtratoFechadoRestricoes;

interface

uses
  System.Classes, clExtrato, clUtil, udm, Dialogs, Windows, Forms, SysUtils,
  Messages, Controls,
  System.DateUtils;

type
  thrExtratoFechadoRestricoes = class(TThread)
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

  procedure thrExtratoFechadoRestricoes.UpdateCaption;
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

{ thrExtratoFechadoRestricoes }

uses uGlobais, ufrmDebitosRestricoes;

procedure thrExtratoFechadoRestricoes.Execute;
var
  sCodigo: String;
  Contador, LinhasTotal, i: Integer;
begin
  extrato := TExtrato.Create;
  sCodigo := frmDebitosRestricoes.sEntregador;
  try
    Contador := 1;
    Synchronize(IniciaProcesso);
    if dm.tbExtrato.Active then
      dm.tbExtrato.Close;
    dm.tbExtrato.Open;
    if extrato.getObject(sCodigo, 'ENTREGADOR') then
    begin
      LinhasTotal := dm.qryGetObject.RecordCount;
      while not(dm.qryGetObject.Eof) do
      begin
        if dm.qryGetObject.FieldByName('VAL_RESTRICAO').AsCurrency <> 0 then
        begin
          dm.tbExtrato.Insert;
          dm.tbExtratoCOD_AGENTE.Value := dm.qryGetObject.FieldByName
            ('COD_AGENTE').AsInteger;
          dm.tbExtratoDES_AGENTE.Value := dm.qryGetObject.FieldByName
            ('DES_AGENTE').AsString;
          dm.tbExtratoCOD_ENTREGADOR.Value := dm.qryGetObject.FieldByName
            ('COD_ENTREGADOR').AsInteger;
          dm.tbExtratoDES_ENTREGADOR.Value := dm.qryGetObject.FieldByName
            ('DES_ENTREGADOR').AsString;
          dm.tbExtratoQTD_VOLUMES.Value := dm.qryGetObject.FieldByName
            ('QTD_VOLUMES').AsInteger;
          dm.tbExtratoQTD_ENTREGA.Value := dm.qryGetObject.FieldByName
            ('QTD_ENTREGA').AsInteger;
          dm.tbExtratoVAL_VERBA.Value := dm.qryGetObject.FieldByName
            ('VAL_VERBA').AsCurrency;
          dm.tbExtratoVAL_VERBA_TOTAL.Value := dm.qryGetObject.FieldByName
            ('VAL_VERBA_TOTAL').AsCurrency;
          dm.tbExtratoVAL_CREDITO.Value := dm.qryGetObject.FieldByName
            ('VAL_CREDITO').AsCurrency;
          dm.tbExtratoVAL_DEBITO.Value := dm.qryGetObject.FieldByName
            ('VAL_DEBITO').AsCurrency;
          dm.tbExtratoVAL_RESTRICAO.Value := dm.qryGetObject.FieldByName
            ('VAL_RESTRICAO').AsCurrency;
          dm.tbExtratoVAL_SUB_TOTAL.Value := dm.qryGetObject.FieldByName
            ('VAL_SUB_TOTAL').AsCurrency;
          dm.tbExtratoQTD_VOLUMES_EXTRA.Value :=
            dm.qryGetObject.FieldByName('QTD_VOLUMES_EXTRA').AsFloat;
          dm.tbExtratoVAL_VOLUMES_EXTRA.Value :=
            dm.qryGetObject.FieldByName('VAL_VOLUMES_EXTRA').AsCurrency;
          dm.tbExtratoVAL_TOTAL.Value := dm.qryGetObject.FieldByName
            ('VAL_TOTAL').AsCurrency;
          dm.tbExtratoVAL_ABASTECIMENTO.Value :=
            dm.qryGetObject.FieldByName('VAL_ABASTECIMENTO').AsCurrency;
          dm.tbExtratoVAL_TOTAL_DESCONTOS.Value :=
            dm.qryGetObject.FieldByName('VAL_TOTAL_DESCONTOS').AsCurrency;
          dm.tbExtratoVAL_TOTAL_CREDITOS.Value :=
            dm.qryGetObject.FieldByName('VAL_TOTAL_CREDITOS').AsCurrency;
          dm.tbExtratoVAL_TOTAL_GERAL.Value := dm.qryGetObject.FieldByName
            ('VAL_TOTAL_GERAL').AsCurrency;
          dm.tbExtratoDAT_INICIO.Value := dm.qryGetObject.FieldByName
            ('DAT_INICIO').AsDateTime;
          dm.tbExtratoDAT_TERMINO.Value := dm.qryGetObject.FieldByName
            ('DAT_TERMINO').AsDateTime;
          dm.tbExtratoDAT_INICIO_ABASTECIMENTO.Value :=
            dm.qryGetObject.FieldByName('DAT_INICIO_ABASTECIMENTO').AsDateTime;
          dm.tbExtratoDAT_FINAL_ABASTECIMENTO.Value :=
            dm.qryGetObject.FieldByName('DAT_FINAL_ABASTECIMENTO').AsDateTime;
          dm.tbExtratoDAT_PAGO.Value := dm.qryGetObject.FieldByName('DAT_PAGO')
            .AsDateTime;
          dm.tbExtratoNUM_EXTRATO.Value := dm.qryGetObject.FieldByName
            ('NUM_EXTRATO').AsString;
          dm.tbExtratoQTD_ATRASOS.Value := dm.qryGetObject.FieldByName
            ('QTD_1_DIA').AsInteger;
          dm.tbExtratoQTD_2_DIAS.Value := dm.qryGetObject.FieldByName
            ('QTD_2_DIAS').AsInteger;
          dm.tbExtratoQTD_MAIS_DIAS.Value := dm.qryGetObject.FieldByName
            ('QTD_MAIS_DIAS').AsInteger;
          dm.tbExtrato.Post;
        end;
        dm.qryGetObject.Next;
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

    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
  finally
    Synchronize(TerminaProcesso);
    extrato.Free;
  end;
end;

procedure thrExtratoFechadoRestricoes.AtualizaProgress;
begin
  frmDebitosRestricoes.cxProgressBar.Visible := True;
  frmDebitosRestricoes.cxProgressBar.Position := Round(dPosicao);
  frmDebitosRestricoes.cxProgressBar.Properties.Text :=
    IntToStr(Round(dPosicao)) + '%';
  frmDebitosRestricoes.cxProgressBar.Refresh;
end;

procedure thrExtratoFechadoRestricoes.TerminaProcesso;
begin
  frmDebitosRestricoes.cxGrid1DBTableView1.OptionsView.NoDataToDisplayInfoText
    := '<nenhuma informação disponível>';
  frmDebitosRestricoes.cxProgressBar.Visible := False;
  frmDebitosRestricoes.cxProgressBar.Properties.Text := '';
  frmDebitosRestricoes.cxProgressBar.Position := 0;
  frmDebitosRestricoes.cxProgressBar.Clear;
  frmDebitosRestricoes.dsDebitosRestricoes.Enabled := True;
  frmDebitosRestricoes.actDebitosRestricoesExportar.Enabled := True;
  frmDebitosRestricoes.cxGrid1DBTableView1.ViewData.Expand(True);
end;

procedure thrExtratoFechadoRestricoes.IniciaProcesso;
begin
  frmDebitosRestricoes.dsDebitosRestricoes.Enabled := False;
  frmDebitosRestricoes.cxGrid1DBTableView1.OptionsView.NoDataToDisplayInfoText
    := '>Atualizando a grade. Aguarde...<';
  frmDebitosRestricoes.actDebitosRestricoesExportar.Enabled := False;
  frmDebitosRestricoes.cxProgressBar.Clear;
end;

end.
