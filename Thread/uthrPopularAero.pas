unit uthrPopularAero;

interface

uses
  System.Classes, clEntrega, clUtil, udm, Dialogs, Windows, Forms, SysUtils,
  Messages, Controls,
  System.DateUtils;

type
  thrPopularAero = class(TThread)
  private
    { Private declarations }
    entrega: TEntrega;
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

  procedure thrPopularAero.UpdateCaption;
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

{ thrPopularAero }

uses
  ufrmAtribuicoesEntregas, uGlobais;

procedure thrPopularAero.Execute;
var
  Contador, LinhasTotal: Integer;
begin
  try
    entrega := TEntrega.Create;
    while not(Self.Terminated) do
    begin
      if dm.tbAtribuicoes.Active then
      begin
        dm.tbAtribuicoes.Close;
      end;
      dm.tbAtribuicoes.Open;
      entrega.Lote := frmAtribuicoesEntregas.cxLote.ItemIndex;
      entrega.Cliente := 0;
      if not(entrega.Periodo(frmAtribuicoesEntregas.cxData.Text,
        frmAtribuicoesEntregas.cxData.Text, '',
        frmAtribuicoesEntregas.cxCodigoEntregador.Text, 'AERO')) then
      begin
        Self.Terminate;
      end;
      if Self.Terminated then
      begin
        Break;
      end;
      Contador := 1;
      LinhasTotal := dm.qryGeral.RecordCount;
      Synchronize(IniciaProcesso);
      while not(dm.qryGeral.Eof) do
      begin
        dm.tbAtribuicoes.Insert;
        dm.tbAtribuicoesNUM_NOSSONUMERO.Value :=
          dm.qryGeral.FieldByName('NUM_NOSSONUMERO').AsString;
        dm.tbAtribuicoesNOM_CONSUMIDOR.Value :=
          dm.qryGeral.FieldByName('NOM_CONSUMIDOR').AsString;
        dm.tbAtribuicoesDES_ENDERECO.Value :=
          dm.qryGeral.FieldByName('DES_ENDERECO').AsString;
        dm.tbAtribuicoesDES_COMPLEMENTO.Value :=
          dm.qryGeral.FieldByName('DES_COMPLEMENTO').AsString;
        dm.tbAtribuicoesDES_BAIRRO.Value :=
          dm.qryGeral.FieldByName('DES_BAIRRO').AsString;
        dm.tbAtribuicoesNOM_CIDADE.Value :=
          dm.qryGeral.FieldByName('NOM_CIDADE').AsString;
        dm.tbAtribuicoesNUM_CEP.Value := dm.qryGeral.FieldByName
          ('NUM_CEP').AsString;
        dm.tbAtribuicoesQTD_VOLUMES.Value :=
          dm.qryGeral.FieldByName('QTD_VOLUMES').AsInteger;
        dm.tbAtribuicoesQTD_PESO_REAL.Value :=
          dm.qryGeral.FieldByName('QTD_PESO_REAL').AsFloat;
        dm.tbAtribuicoesCOD_AGENTE.Value :=
          dm.qryGeral.FieldByName('COD_AGENTE').AsInteger;
        dm.tbAtribuicoesCOD_ENTREGADOR.Value :=
          dm.qryGeral.FieldByName('COD_ENTREGADOR').AsInteger;
        dm.tbAtribuicoesDAT_ATRIBUICAO.Value :=
          dm.qryGeral.FieldByName('DAT_ATRIBUICAO').AsDateTime;
        dm.tbAtribuicoes.Post;
        dPosicao := (Contador / LinhasTotal) * 100;
        Inc(Contador);
        if not(Self.Terminated) then
        begin
          Synchronize(AtualizaProgress);
        end
        else
        begin
          Synchronize(TerminaProcesso);
          entrega.Free;
          Abort;
        end;
        dm.qryGeral.Next;
      end;
      Self.Terminate;
    end;
    dm.qryGeral.Close;
    dm.qryGeral.SQL.Clear;
  finally
    Synchronize(TerminaProcesso);
    entrega.Free;
  end;
end;

procedure thrPopularAero.AtualizaProgress;
begin
  frmAtribuicoesEntregas.cxProgressBar.Visible := True;
  frmAtribuicoesEntregas.cxProgressBar.Position := Round(dPosicao);
  frmAtribuicoesEntregas.cxProgressBar.Properties.Text :=
    IntToStr(Round(dPosicao)) + '%';
  frmAtribuicoesEntregas.cxProgressBar.Refresh;
end;

procedure thrPopularAero.TerminaProcesso;
begin
  frmAtribuicoesEntregas.cxGrid1DBTableView1.OptionsView.NoDataToDisplayInfoText
    := 'Nenhuma Informação Disponível';
  frmAtribuicoesEntregas.ds.Enabled := True;
  frmAtribuicoesEntregas.cxGrid1.Repaint;
  frmAtribuicoesEntregas.cxProgressBar.Visible := False;
  frmAtribuicoesEntregas.cxProgressBar.Properties.Text := '';
  frmAtribuicoesEntregas.cxProgressBar.Position := 0;
  frmAtribuicoesEntregas.cxProgressBar.Clear;
  frmAtribuicoesEntregas.actAtribuicoesIniciar.Enabled := False;
  frmAtribuicoesEntregas.actAtribuicoesCancelar.Enabled := True;
  frmAtribuicoesEntregas.actAtribuicoesReatribuir.Enabled := True;
  frmAtribuicoesEntregas.actAtribuicoesSalvar.Enabled := True;
  frmAtribuicoesEntregas.actAtribuicoesSair.Enabled := True;
  frmAtribuicoesEntregas.actAtribuicoesExportar.Enabled := True;
  frmAtribuicoesEntregas.actAtribuicoesImprimir.Enabled := True;
end;

procedure thrPopularAero.IniciaProcesso;
begin
  frmAtribuicoesEntregas.cxGrid1DBTableView1.OptionsView.NoDataToDisplayInfoText
    := 'Atualizando a grade. Aguarde...';
  frmAtribuicoesEntregas.actAtribuicoesIniciar.Enabled := False;
  frmAtribuicoesEntregas.actAtribuicoesCancelar.Enabled := False;
  frmAtribuicoesEntregas.actAtribuicoesReatribuir.Enabled := False;
  frmAtribuicoesEntregas.actAtribuicoesSalvar.Enabled := False;
  frmAtribuicoesEntregas.actAtribuicoesSair.Enabled := False;
  frmAtribuicoesEntregas.actAtribuicoesExportar.Enabled := False;
  frmAtribuicoesEntregas.actAtribuicoesImprimir.Enabled := False;
  frmAtribuicoesEntregas.cxProgressBar.Clear;
end;

end.
