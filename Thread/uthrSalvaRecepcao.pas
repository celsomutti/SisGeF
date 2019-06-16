unit uthrSalvaRecepcao;

interface

uses
  System.Classes, clEntrega, clUtil, udm, Dialogs, Windows, Forms, SysUtils,
  Messages, Controls,
  System.DateUtils;

type
  thrSalvaRecepcao = class(TThread)
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

{ thrSalvaRecepcao }

uses
  ufrmRecepcaoHermes, uGlobais;

procedure thrSalvaRecepcao.Execute;
var
  Contador, LinhasTotal: Integer;
  sItens: TStringList;
begin
  entrega := TEntrega.Create;
  try
    Contador := 1;
    LinhasTotal := dm.tbRecepcao.RecordCount;
    sItens := TStringList.Create();
    dm.tbRecepcao.First;
    Synchronize(IniciaProcesso);
    while not(dm.tbRecepcao.Eof) do
    begin
      if entrega.getObject(dm.tbRecepcaoNUM_NOSSONUMERO.AsString, 'NOSSONUMERO')
      then
      begin
        if (entrega.Baixado <> 'S') and (entrega.Recebido <> 'S') then
        begin
          sItens.Add('> ' + FormatDateTime('dd/mm/yyyy hh:mm', Now) +
            ' | Entrega Recebida. | ' + 'Por ' + uGlobais.sNomeUsuario + ' |');
          entrega.Rastreio := sItens.Text;
          sItens.Clear;
          entrega.DataRecebido := Now;
          entrega.Recebido := 'S';
          entrega.Status := 5;
          if not(entrega.Update()) then
          begin
            dm.tbRecepcao.Edit;
            dm.tbRecepcaoNOM_CONSUMIDOR.Value :=
              '*** ERRO SALVAR RECEPÇÃO (CLASSE) ***';
            dm.tbRecepcao.Post;
          end;
        end
        else
        begin
          dm.tbRecepcao.Edit;
          dm.tbRecepcaoNOM_CONSUMIDOR.Value :=
            '*** ENTREGA BAIXADA / RECEBIDA ***';
          dm.tbRecepcao.Post;
        end;
      end
      else
      begin
        dm.tbRecepcao.Edit;
        dm.tbRecepcaoNOM_CONSUMIDOR.Value := '*** NN NÃO ENCONTRADA ***';
        dm.tbRecepcao.Post;
      end;
      dm.tbRecepcao.Next;
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

procedure thrSalvaRecepcao.AtualizaProgress;
begin
  frmRecepcaoHermes.cxProgressBar.Visible := True;
  frmRecepcaoHermes.cxProgressBar.Position := Round(dPosicao);
  frmRecepcaoHermes.cxProgressBar.Properties.Text :=
    IntToStr(Round(dPosicao)) + '%';
  frmRecepcaoHermes.cxProgressBar.Refresh;
end;

procedure thrSalvaRecepcao.TerminaProcesso;
begin
  frmRecepcaoHermes.cxGrid1DBTableView1.OptionsView.NoDataToDisplayInfoText :=
    'Nenhuma Informação Disponível';
  frmRecepcaoHermes.ds.Enabled := True;
  frmRecepcaoHermes.cxProgressBar.Visible := False;
  frmRecepcaoHermes.cxProgressBar.Properties.Text := '';
  frmRecepcaoHermes.cxProgressBar.Position := 0;
  frmRecepcaoHermes.cxProgressBar.Clear;
  frmRecepcaoHermes.actRecepcaoCancelar.Enabled := True;
  frmRecepcaoHermes.actRecepcaoSalvar.Enabled := False;
  frmRecepcaoHermes.actRecepcaoSair.Enabled := True;
  frmRecepcaoHermes.actRecepcaoExportar.Enabled := True;
  // frmRecepcaoHermes.actRecepcaoImprimir.Enabled                             :=  True;
  frmRecepcaoHermes.ds.Enabled := True;
  frmRecepcaoHermes.cxGrid1.Refresh;
end;

procedure thrSalvaRecepcao.IniciaProcesso;
begin
  frmRecepcaoHermes.cxGrid1DBTableView1.OptionsView.NoDataToDisplayInfoText :=
    'Salvando a Recepção. Aguarde...';
  frmRecepcaoHermes.actRecepcaoCancelar.Enabled := False;
  frmRecepcaoHermes.actRecepcaoSalvar.Enabled := False;
  frmRecepcaoHermes.actRecepcaoSair.Enabled := False;
  frmRecepcaoHermes.actRecepcaoExportar.Enabled := False;
  // frmRecepcaoHermes.actRecepcaoImprimir.Enabled                             :=  False;
  frmRecepcaoHermes.cxProgressBar.Clear;
end;

end.
