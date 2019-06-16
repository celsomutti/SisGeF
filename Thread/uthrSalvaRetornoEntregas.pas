unit uthrSalvaRetornoEntregas;

interface

uses
  System.Classes, clEntrega, clUtil, udm, Dialogs, Windows, Forms, SysUtils,
  Messages, Controls,
  System.DateUtils;

type
  thrSalvaRetornoEntregas = class(TThread)
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

{ thrSalvaRetornoEntregas }

uses
  ufrmRetornoEntregas, uGlobais;

procedure thrSalvaRetornoEntregas.Execute;
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
          ' | Entrega Devolvida para Tratativas. | ' + 'Por ' +
          uGlobais.sNomeUsuario + ' | ');
        entrega.DataBaixa := Now;
        entrega.Baixado := 'N';
        entrega.Rastreio := sItens.Text;
        entrega.Status := 6;
        sItens.Clear;
        entrega.Retorno := dm.tbRetornoDES_RETORNO.Value;
        if not(entrega.Update()) then
        begin
          dm.tbRetorno.Edit;
          dm.tbRetornoNOM_CONSUMIDOR.Value :=
            '*** ERRO SALVAR RETORNO (CLASSE) ***';
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

procedure thrSalvaRetornoEntregas.AtualizaProgress;
begin
  frmRetornoEntregas.cxProgressBar1.Visible := True;
  frmRetornoEntregas.cxProgressBar1.Position := Round(dPosicao);
  frmRetornoEntregas.cxProgressBar1.Properties.Text :=
    IntToStr(Round(dPosicao)) + '%';
  frmRetornoEntregas.cxProgressBar1.Refresh;
end;

procedure thrSalvaRetornoEntregas.TerminaProcesso;
begin
  frmRetornoEntregas.cxGrid1DBTableView1.OptionsView.NoDataToDisplayInfoText :=
    'Nenhuma Informação Disponível';
  frmRetornoEntregas.ds.Enabled := True;
  frmRetornoEntregas.cxProgressBar1.Visible := False;
  frmRetornoEntregas.cxProgressBar1.Properties.Text := '';
  frmRetornoEntregas.cxProgressBar1.Position := 0;
  frmRetornoEntregas.cxProgressBar1.Clear;
  frmRetornoEntregas.actRetornoCancelar.Enabled := True;
  frmRetornoEntregas.actRetornoSalvar.Enabled := True;
  frmRetornoEntregas.actRetornoSair.Enabled := True;
  frmRetornoEntregas.actRetornoExportar.Enabled := True;
  // frmRetornoEntregas.actRetornoImprimir.Enabled                             :=  True;
  frmRetornoEntregas.ds.Enabled := True;
  frmRetornoEntregas.cxGrid1.Refresh;
end;

procedure thrSalvaRetornoEntregas.IniciaProcesso;
begin
  frmRetornoEntregas.cxGrid1DBTableView1.OptionsView.NoDataToDisplayInfoText :=
    'Salvando os Retornos. Aguarde...';
  frmRetornoEntregas.actRetornoCancelar.Enabled := False;
  frmRetornoEntregas.actRetornoSalvar.Enabled := False;
  frmRetornoEntregas.actRetornoSair.Enabled := False;
  frmRetornoEntregas.actRetornoExportar.Enabled := False;
  // frmRetornoEntregas.actRetornoImprimir.Enabled                             :=  False;
  frmRetornoEntregas.cxProgressBar.Clear;
end;

end.
