unit uthrPopularLancamentos;

interface

uses
  System.Classes, clEntregador, clLancamentos, clUtil, udm, Dialogs, Windows,
  Forms, SysUtils, Messages, Controls,
  System.DateUtils;

type
  thrPopularLancamentos = class(TThread)
  private
    { Private declarations }
    lancamentos: TLancamentos;
    entregador: TEntregador;
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

  procedure thrPopularLancamentos.UpdateCaption;
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

{ thrPopularLancamentos }

uses
  ufrmLancamentos, uGlobais;

procedure thrPopularLancamentos.Execute;
var
  Contador, LinhasTotal: Integer;
  sNome: String;
begin
  try
    entregador := TEntregador.Create;
    lancamentos := TLancamentos.Create;
    while not(Self.Terminated) do
    begin
      if dm.tbLancamentos.Active then
      begin
        dm.tbLancamentos.Close;
      end;
      dm.tbLancamentos.Open;
      if not(lancamentos.getObjects()) then
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
        dm.tbLancamentosCOD_LANCAMENTO.Value :=
          dm.qryGetObject.FieldByName('COD_LANCAMENTO').AsInteger;
        dm.tbLancamentosDES_LANCAMENTO.Value :=
          dm.qryGetObject.FieldByName('DES_LANCAMENTO').AsString;
        dm.tbLancamentosDAT_LANCAMENTO.Value :=
          dm.qryGetObject.FieldByName('DAT_LANCAMENTO').AsDateTime;
        dm.tbLancamentosCOD_ENTREGADOR.Value :=
          dm.qryGetObject.FieldByName('COD_ENTREGADOR').AsInteger;
        entregador.Cadastro := dm.qryGetObject.FieldByName('COD_ENTREGADOR')
          .AsInteger;
        sNome := entregador.getField('DES_RAZAO_SOCIAL', 'CADASTRO');
        dm.tbLancamentosNOM_ENTREGADOR.Value := sNome;
        dm.tbLancamentosDES_TIPO.Value := dm.qryGetObject.FieldByName
          ('DES_TIPO').AsString;
        if dm.qryGetObject.FieldByName('DES_TIPO').AsString = 'CREDITO' then
        begin
          dm.tbLancamentosVAL_LANCAMENTO.Value :=
            dm.qryGetObject.FieldByName('VAL_LANCAMENTO').AsFloat;
        end
        else
        begin
          dm.tbLancamentosVAL_DEBITO.Value := dm.qryGetObject.FieldByName
            ('VAL_LANCAMENTO').AsFloat;
        end;
        dm.tbLancamentosDOM_DESCONTO.Value := dm.qryGetObject.FieldByName
          ('DOM_DESCONTO').AsString;
        dm.tbLancamentosDAT_DESCONTO.Value := dm.qryGetObject.FieldByName
          ('DAT_DESCONTO').AsFloat;
        dm.tbLancamentosNUM_EXTRATO.Value := dm.qryGetObject.FieldByName
          ('NUM_EXTRATO').AsString;

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

procedure thrPopularLancamentos.AtualizaProgress;
begin
  frmLancamentos.cxProgressBar.Visible := True;
  frmLancamentos.cxProgressBar.Position := Round(dPosicao);
  frmLancamentos.cxProgressBar.Properties.Text :=
    IntToStr(Round(dPosicao)) + '%';
  frmLancamentos.cxProgressBar.Refresh;
end;

procedure thrPopularLancamentos.TerminaProcesso;
begin
  frmLancamentos.cxGrid1DBTableView1.OptionsView.NoDataToDisplayInfoText :=
    'Nenhuma Informação Disponível';
  frmLancamentos.ds.Enabled := True;
  frmLancamentos.cxGrid1.Repaint;
  frmLancamentos.cxProgressBar.Visible := False;
  frmLancamentos.cxProgressBar.Properties.Text := '';
  frmLancamentos.cxProgressBar.Position := 0;
  frmLancamentos.cxProgressBar.Clear;
  { frmLancamentos.actAtribuicoesIniciar.Enabled                            :=  False;
    frmLancamentos.actAtribuicoesCancelar.Enabled                           :=  True;
    frmLancamentos.actAtribuicoesReatribuir.Enabled                         :=  True;
    frmLancamentos.actAtribuicoesSalvar.Enabled                             :=  True;
    frmLancamentos.actAtribuicoesSair.Enabled                               :=  True;
    frmLancamentos.actAtribuicoesExportar.Enabled                           :=  True;
    frmLancamentos.actAtribuicoesImprimir.Enabled                           :=  True; }
end;

procedure thrPopularLancamentos.IniciaProcesso;
begin
  frmLancamentos.cxGrid1DBTableView1.OptionsView.NoDataToDisplayInfoText :=
    'Atualizando a grade. Aguarde...';
  { frmLancamentos.actAtribuicoesIniciar.Enabled                            :=  False;
    frmLancamentos.actAtribuicoesCancelar.Enabled                           :=  False;
    frmLancamentos.actAtribuicoesReatribuir.Enabled                         :=  False;
    frmLancamentos.actAtribuicoesSalvar.Enabled                             :=  False;
    frmLancamentos.actAtribuicoesSair.Enabled                               :=  False;
    frmLancamentos.actAtribuicoesExportar.Enabled                           :=  False;
    frmLancamentos.actAtribuicoesImprimir.Enabled                           :=  False;
    frmLancamentos.cxProgressBar.Clear; }
end;

end.
