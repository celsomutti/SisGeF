unit uthrSalvaAero;

interface

uses
  System.Classes, clEntrega, clUtil, udm, Dialogs, Windows, Forms, SysUtils,
  Messages, Controls,
  System.DateUtils, clEntregador;

type
  thrSalvaAero = class(TThread)
  private
    { Private declarations }
    entrega: TEntrega;
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

  procedure thrSalvaAero.UpdateCaption;
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

{ thrSalvaAero }

uses
  ufrmAtribuicoesEntregas, uGlobais;

procedure thrSalvaAero.Execute;
var
  Contador, LinhasTotal, iLote: Integer;
  sItens: TStringList;
begin
  entrega := TEntrega.Create;
  entregador := TEntregador.Create;
  try
    Contador := 1;
    LinhasTotal := dm.tbAtribuicoes.RecordCount;
    iLote := frmAtribuicoesEntregas.cxLote.ItemIndex;
    sItens := TStringList.Create();
    dm.tbAtribuicoes.First;
    Synchronize(IniciaProcesso);
    while not(dm.tbAtribuicoes.Eof) do
    begin
      if entrega.getObject(dm.tbAtribuicoesNUM_NOSSONUMERO.AsString,
        'NOSSONUMERO') then
      begin
        if entrega.Baixado <> 'S' then
        begin
          sItens.Text := dm.tbRetornoDES_RASTREIO.Text;
          sItens.Add('> ' + FormatDateTime('dd/mm/yyyy hh:mm', Now) +
            ' | Entrega Atribuida ao Entregador' +
            frmAtribuicoesEntregas.cxCodigoEntregador.Text + ' - ' +
            frmAtribuicoesEntregas.cxNomeEntregador.Text + ' no ' +
            frmAtribuicoesEntregas.cxLote.Text + '. | ' + 'Por ' +
            uGlobais.sNomeUsuario + ' | ');
          entrega.Agente := dm.tbAtribuicoesCOD_AGENTE.Value;
          entrega.entregador := dm.tbAtribuicoesCOD_ENTREGADOR.Value;
          entrega.Atribuicao := dm.tbAtribuicoesDAT_ATRIBUICAO.Value;
          entrega.Lote := iLote;
          entrega.Rastreio := sItens.Text;
          if entregador.getObject(IntToStr(entrega.entregador), 'CODIGO') then
          begin
            if entregador.Funcionario = 'D' then
            begin
              entrega.Status := 11;
              entrega.DataBaixa := entrega.Atribuicao;
              entrega.Baixado := 'S';
            end;
          end;
          sItens.Clear;
          if not(entrega.Update()) then
          begin
            dm.tbAtribuicoes.Edit;
            dm.tbAtribuicoesNOM_CONSUMIDOR.Value :=
              '*** ERRO SALVAR ATRIBUIÇÃO (CLASSE) ***';
            dm.tbAtribuicoes.Post;
          end;
        end
        else
        begin
          dm.tbAtribuicoes.Edit;
          dm.tbAtribuicoesNOM_CONSUMIDOR.Value := '*** ENTREGA BAIXADA ***';
          dm.tbAtribuicoes.Post;
        end;
      end
      else
      begin
        dm.tbAtribuicoes.Edit;
        dm.tbAtribuicoesNOM_CONSUMIDOR.Value := '*** NN NÃO ENCONTRADA ***';
        dm.tbAtribuicoes.Post;
      end;
      dm.tbAtribuicoes.Next;
      dPosicao := (Contador / LinhasTotal) * 100;
      Inc(Contador);
      if not(Self.Terminated) then
      begin
        Synchronize(AtualizaProgress);
      end
      else
      begin
        entrega.Free;
        Abort;
      end;
    end;
  finally
    Synchronize(TerminaProcesso);
    entrega.Free;
  end;
end;

procedure thrSalvaAero.AtualizaProgress;
begin
  frmAtribuicoesEntregas.cxProgressBar.Visible := True;
  frmAtribuicoesEntregas.cxProgressBar.Position := Round(dPosicao);
  frmAtribuicoesEntregas.cxProgressBar.Properties.Text :=
    IntToStr(Round(dPosicao)) + '%';
  frmAtribuicoesEntregas.cxProgressBar.Refresh;
end;

procedure thrSalvaAero.TerminaProcesso;
begin
  frmAtribuicoesEntregas.cxGrid1DBTableView1.OptionsView.NoDataToDisplayInfoText
    := 'Nenhuma Informação Disponível';
  frmAtribuicoesEntregas.ds.Enabled := True;
  frmAtribuicoesEntregas.cxGrid1.Repaint;
  frmAtribuicoesEntregas.cxProgressBar.Visible := False;
  frmAtribuicoesEntregas.cxProgressBar.Properties.Text := '';
  frmAtribuicoesEntregas.cxProgressBar.Position := 0;
  frmAtribuicoesEntregas.cxProgressBar.Clear;
  frmAtribuicoesEntregas.actAtribuicoesIniciar.Enabled := True;
  frmAtribuicoesEntregas.actAtribuicoesCancelar.Enabled := True;
  frmAtribuicoesEntregas.actAtribuicoesReatribuir.Enabled := False;
  frmAtribuicoesEntregas.actAtribuicoesSalvar.Enabled := False;
  frmAtribuicoesEntregas.actAtribuicoesSair.Enabled := True;
  frmAtribuicoesEntregas.actAtribuicoesExportar.Enabled := True;
  frmAtribuicoesEntregas.actAtribuicoesImprimir.Enabled := True;
  frmAtribuicoesEntregas.ds.Enabled := True;
  frmAtribuicoesEntregas.cxGrid1.Refresh;
end;

procedure thrSalvaAero.IniciaProcesso;
begin
  frmAtribuicoesEntregas.cxGrid1DBTableView1.OptionsView.NoDataToDisplayInfoText
    := 'Salvando as Atribuições. Aguarde...';
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
