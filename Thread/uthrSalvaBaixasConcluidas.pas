unit uthrSalvaBaixasConcluidas;

interface

uses
  System.Classes, clEntrega, clUtil, udm, Dialogs, Windows, Forms, SysUtils,
  Messages, Controls,
  System.DateUtils;

type
  thrSalvaBaixasConcluidas = class(TThread)
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

{ thrSalvaBaixasConcluidas }

uses
  ufrmRetornoEntregas, uGlobais;

procedure thrSalvaBaixasConcluidas.Execute;
var
  Contador, LinhasTotal: Integer;
  sItens: TStringList;
begin
  entrega := TEntrega.Create;
  try
    Contador := 1;
    LinhasTotal := dm.tbRetorno.RecordCount;
    sItens := TStringList.Create();
    dm.tbRetorno.First;
    Synchronize(IniciaProcesso);
    while not(dm.tbRetorno.Eof) do
    begin
      if entrega.getObject(dm.tbRetornoNUM_NOSSONUMERO.AsString, 'NOSSONUMERO')
      then
      begin
        sItens.Text := dm.tbRetornoDES_RASTREIO.Text;
        sItens.Add('> ' + FormatDateTime('dd/mm/yyyy hh:mm', Now) +
          ' | Entrega Baixada (Concluída). | ' + 'Por ' +
          uGlobais.sNomeUsuario + ' | ');
        entrega.DataBaixa := Now;
        entrega.Baixado := 'S';
        entrega.Rastreio := sItens.Text;
        entrega.Status := 12;
        sItens.Clear;
        entrega.Retorno := 'ENTREGA BAIXADA (CONCLUÍDA)';
        if not(entrega.Update()) then
        begin
          dm.tbRetorno.Edit;
          dm.tbRetornoNOM_CONSUMIDOR.Value :=
            '*** ERRO SALVAR BAIXA (CLASSE) ***';
          dm.tbRetorno.Post;
        end;
      end
      else
      begin
        dm.tbRetorno.Edit;
        dm.tbRetornoNOM_CONSUMIDOR.Value := '*** NN NÃO ENCONTRADA ***';
        dm.tbRetorno.Post;
      end;
      dm.tbRetorno.Next;
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

procedure thrSalvaBaixasConcluidas.AtualizaProgress;
begin
  frmRetornoEntregas.cxProgressBar.Visible := True;
  frmRetornoEntregas.cxProgressBar.Position := Round(dPosicao);
  frmRetornoEntregas.cxProgressBar.Properties.Text :=
    IntToStr(Round(dPosicao)) + '%';
  frmRetornoEntregas.cxProgressBar.Refresh;
end;

procedure thrSalvaBaixasConcluidas.TerminaProcesso;
begin
  frmRetornoEntregas.cxGrid1DBTableView1.OptionsView.NoDataToDisplayInfoText :=
    'Nenhuma Informação Disponível';
  frmRetornoEntregas.ds.Enabled := True;
  frmRetornoEntregas.cxProgressBar.Visible := False;
  frmRetornoEntregas.cxProgressBar.Properties.Text := '';
  frmRetornoEntregas.cxProgressBar.Position := 0;
  frmRetornoEntregas.cxProgressBar.Clear;
  frmRetornoEntregas.actRetornoCancelar.Enabled := True;
  frmRetornoEntregas.actRetornoSalvar.Enabled := True;
  frmRetornoEntregas.actRetornoSair.Enabled := True;
  frmRetornoEntregas.actRetornoExportar.Enabled := True;
  // frmRetornoEntregas.actRetornoImprimir.Enabled                             :=  True;
  frmRetornoEntregas.ds.Enabled := True;
  dm.tbRetorno.Close;
  dm.tbRetorno.Open;
  frmRetornoEntregas.cxGrid1.Refresh;
end;

procedure thrSalvaBaixasConcluidas.IniciaProcesso;
begin
  frmRetornoEntregas.cxGrid1DBTableView1.OptionsView.NoDataToDisplayInfoText :=
    'Salvando a Recepção. Aguarde...';
  frmRetornoEntregas.actRetornoCancelar.Enabled := False;
  frmRetornoEntregas.actRetornoSalvar.Enabled := False;
  frmRetornoEntregas.actRetornoSair.Enabled := False;
  frmRetornoEntregas.actRetornoExportar.Enabled := False;
  // frmRetornoEntregas.actRetornoImprimir.Enabled                             :=  False;
  frmRetornoEntregas.cxProgressBar.Clear;
end;

end.
