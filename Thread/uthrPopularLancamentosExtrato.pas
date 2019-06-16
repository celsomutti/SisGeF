unit uthrPopularLancamentosExtrato;

interface

uses
  System.Classes, clLancamentos, clUtil, udm, Dialogs, Windows, Forms, SysUtils,
  Messages, Controls,
  System.DateUtils, clCodigosEntregadores;

type
  thrPopularLancamentosExtrato = class(TThread)
  private
    { Private declarations }
    lancamentos: TLancamentos;
    entregador: TCodigosEntregadores;
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

  procedure thrPopularLancamentosExtrato.UpdateCaption;
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

{ thrPopularLancamentosExtrato }

uses
  ufrmDetalhesLancamentos, uGlobais;

procedure thrPopularLancamentosExtrato.Execute;
var
  Contador, LinhasTotal: Integer;
  sNome, sId, sFiltro: String;
begin
  try
    entregador := TCodigosEntregadores.Create;
    lancamentos := TLancamentos.Create;

    while not(Self.Terminated) do
    begin
      if dm.tbLancamentos.Active then
      begin
        dm.tbLancamentos.Close;
      end;
      dm.tbLancamentos.Open;
      sId := frmDetalhesLancamentos.sId;
      sFiltro := frmDetalhesLancamentos.sFiltro;
      if not(lancamentos.getObject(sId, sFiltro)) then
      begin
        Self.Terminate;
      end;
      if Self.Terminated then
      begin
        Break;
      end;
      Contador := 1;
      LinhasTotal := dm.qryGetObject.RecordCount;
      Synchronize(IniciaProcesso);
      while not(dm.qryGetObject.Eof) do
      begin
        dm.tbLancamentos.Insert;
        dm.tbLancamentosCOD_LANCAMENTO.Value := dm.qryGetObject.FieldByName('COD_LANCAMENTO').AsInteger;
        dm.tbLancamentosDES_LANCAMENTO.Value := dm.qryGetObject.FieldByName('DES_LANCAMENTO').AsString;
        dm.tbLancamentosDAT_LANCAMENTO.Value := dm.qryGetObject.FieldByName('DAT_LANCAMENTO').AsDateTime;
        dm.tbLancamentosCOD_ENTREGADOR.Value := dm.qryGetObject.FieldByName('COD_ENTREGADOR').AsInteger;
        entregador.Cadastro := dm.qryGetObject.FieldByName('COD_ENTREGADOR').AsInteger;
        sNome := entregador.getField('NOM_FANTASIA', 'CADASTRO');
        dm.tbLancamentosNOM_ENTREGADOR.Value := sNome;
        dm.tbLancamentosDES_TIPO.Value := dm.qryGetObject.FieldByName('DES_TIPO').AsString;
        if dm.qryGetObject.FieldByName('DES_TIPO').AsString = 'CREDITO' then
        begin
          dm.tbLancamentosVAL_LANCAMENTO.Value :=
            dm.qryGetObject.FieldByName('VAL_LANCAMENTO').AsFloat;
          dm.tbLancamentosVAL_DEBITO.Value := 0;
        end
        else
        begin
          dm.tbLancamentosVAL_LANCAMENTO.Value := 0;
          dm.tbLancamentosVAL_DEBITO.Value := dm.qryGetObject.FieldByName('VAL_LANCAMENTO').AsFloat;
        end;
        dm.tbLancamentosDOM_DESCONTO.Value := dm.qryGetObject.FieldByName('DOM_DESCONTO').AsString;
        dm.tbLancamentosDAT_DESCONTO.Value := dm.qryGetObject.FieldByName('DAT_DESCONTO').AsFloat;
        dm.tbLancamentosNUM_EXTRATO.Value := dm.qryGetObject.FieldByName('NUM_EXTRATO').AsString;
        dm.tbLancamentosNUM_EXTRATO.Value := dm.qryGetObject.FieldByName('NUM_EXTRATO').AsString;
        dm.tbLancamentos.Post;
        dPosicao := (Contador / LinhasTotal) * 100;
        Inc(Contador);
        if not(Self.Terminated) then
        begin
          Synchronize(AtualizaProgress);
        end
        else
        begin
          Synchronize(TerminaProcesso);
          entregador.Free;
          lancamentos.Free;
          Abort;
        end;
        dm.qryGetObject.Next;
      end;
      Self.Terminate;
    end;
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
  finally
    Synchronize(TerminaProcesso);
    entregador.Free;
    lancamentos.Free;
  end;
end;

procedure thrPopularLancamentosExtrato.AtualizaProgress;
begin
  frmDetalhesLancamentos.cxProgressBar.Visible := True;
  frmDetalhesLancamentos.cxProgressBar.Position := Round(dPosicao);
  frmDetalhesLancamentos.cxProgressBar.Properties.Text :=
    IntToStr(Round(dPosicao)) + '%';
  frmDetalhesLancamentos.cxProgressBar.Refresh;
end;

procedure thrPopularLancamentosExtrato.TerminaProcesso;
begin
  frmDetalhesLancamentos.cxGrid1DBTableView1.OptionsView.NoDataToDisplayInfoText
    := 'Nenhuma Informação Disponível';
  frmDetalhesLancamentos.dsDetalhesLancamentos.Enabled := True;
  frmDetalhesLancamentos.cxGrid1.Repaint;
  frmDetalhesLancamentos.cxProgressBar.Visible := False;
  frmDetalhesLancamentos.cxProgressBar.Properties.Text := '';
  frmDetalhesLancamentos.cxProgressBar.Position := 0;
  frmDetalhesLancamentos.cxProgressBar.Clear;
  { frmDetalhesLancamentos.actAtribuicoesIniciar.Enabled                            :=  False;
    frmDetalhesLancamentos.actAtribuicoesCancelar.Enabled                           :=  True;
    frmDetalhesLancamentos.actAtribuicoesReatribuir.Enabled                         :=  True;
    frmDetalhesLancamentos.actAtribuicoesSalvar.Enabled                             :=  True;
    frmDetalhesLancamentos.actAtribuicoesSair.Enabled                               :=  True;
    frmDetalhesLancamentos.actAtribuicoesExportar.Enabled                           :=  True;
    frmDetalhesLancamentos.actAtribuicoesImprimir.Enabled                           :=  True; }
end;

procedure thrPopularLancamentosExtrato.IniciaProcesso;
begin
  frmDetalhesLancamentos.cxGrid1DBTableView1.OptionsView.NoDataToDisplayInfoText
    := 'Atualizando a grade. Aguarde...';
  { frmDetalhesLancamentos.actAtribuicoesIniciar.Enabled                            :=  False;
    frmDetalhesLancamentos.actAtribuicoesCancelar.Enabled                           :=  False;
    frmDetalhesLancamentos.actAtribuicoesReatribuir.Enabled                         :=  False;
    frmDetalhesLancamentos.actAtribuicoesSalvar.Enabled                             :=  False;
    frmDetalhesLancamentos.actAtribuicoesSair.Enabled                               :=  False;
    frmDetalhesLancamentos.actAtribuicoesExportar.Enabled                           :=  False;
    frmDetalhesLancamentos.actAtribuicoesImprimir.Enabled                           :=  False;
    frmDetalhesLancamentos.cxProgressBar.Clear; }
end;

end.
