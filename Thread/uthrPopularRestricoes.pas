unit uthrPopularRestricoes;

interface

uses
  System.Classes, clRestricoes, clCodigosEntregadores, clAgentes, clUtil, udm,
  Dialogs, Windows, Forms, SysUtils, Messages,
  Controls, System.DateUtils;

type
  thrPopularRestricoes = class(TThread)
  private
    { Private declarations }
    restricao: TRestricoes;
    agente: TAgente;
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

  procedure thrPopularrestricao.UpdateCaption;
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

{ thrPopularRestricoes }

uses
  ufrmManutencaoRestricoes, uGlobais;

procedure thrPopularRestricoes.Execute;
var
  Contador, LinhasTotal: Integer;
  sNomeAdm, sNomeEntregador, sStatus: String;
  bAtivo, bSalva: Boolean;
begin
  try
    agente := TAgente.Create;
    entregador := TCodigosEntregadores.Create;
    restricao := TRestricoes.Create;
    sNomeAdm := '';
    sNomeEntregador := '';
    bAtivo := uGlobais.bFlagAtivo;
    bSalva := True;
    while not(Self.Terminated) do
    begin
      if dm.tbRestricoes.Active then
      begin
        dm.tbRestricoes.Close;
      end;
      dm.tbRestricoes.Open;
      if not(restricao.getObjects()) then
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
        agente.Codigo := dm.qryGeral.FieldByName('COD_AGENTE').AsString;
        sNomeAdm := agente.Codigo;
        sNomeAdm := sNomeAdm + '-' + agente.getField('NOM_FANTASIA', 'CODIGO');
        sStatus := agente.getField('COD_STATUS', 'CODIGO');
        if TUtil.Empty(sStatus) then
        begin
          sStatus := '0';
        end;
        entregador.Codigo := dm.qryGeral.FieldByName('COD_ENTREGADOR')
          .AsInteger;
        sNomeEntregador := IntToStr(entregador.Codigo);
        sNomeEntregador := sNomeEntregador + '-' + entregador.getField
          ('NOM_FANTASIA', 'CODIGO');
        bSalva := True;
        if bAtivo then
        begin
          if sStatus = '0' then
          begin
            bSalva := False;
          end;
        end;
        if bSalva then
        begin
          dm.tbRestricoes.Insert;
          dm.tbRestricoesCOD_RESTRICAO.Value :=
            dm.qryGeral.FieldByName('COD_RESTRICAO').AsInteger;
          dm.tbRestricoesNOM_AGENTE.Value := sNomeAdm;
          dm.tbRestricoesNOM_ENTREGADOR.Value := sNomeEntregador;
          dm.tbRestricoesVAL_RESTRICAO.Value :=
            dm.qryGeral.FieldByName('VAL_RESTRICAO').AsFloat;
          dm.tbRestricoesVAL_PAGO.Value :=
            dm.qryGeral.FieldByName('VAL_PAGO').AsFloat;;
          dm.tbRestricoesVAL_DEBITAR.Value :=
            dm.qryGeral.FieldByName('VAL_DEBITAR').AsFloat;
          dm.tbRestricoesCOD_AGENTE.Value :=
            dm.qryGeral.FieldByName('COD_AGENTE').AsInteger;
          dm.tbRestricoesCOD_ENTREGADOR.Value :=
            dm.qryGeral.FieldByName('COD_ENTREGADOR').AsInteger;
          if StrToInt(agente.Codigo) = entregador.Codigo then
          begin
            dm.tbRestricoesDOM_RESTRICAO.Value := 'A';
          end
          else
          begin
            dm.tbRestricoesDOM_RESTRICAO.Value := 'E';
          end;
          dm.tbRestricoes.Post;
        end;
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
          restricao.Free;
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
    entregador.Free;
    restricao.Free;
  end;
end;

procedure thrPopularRestricoes.AtualizaProgress;
begin
  frmManutencaoRestricoes.cxProgressBar.Visible := True;
  frmManutencaoRestricoes.cxProgressBar.Position := Round(dPosicao);
  frmManutencaoRestricoes.cxProgressBar.Properties.Text :=
    IntToStr(Round(dPosicao)) + '%';
  frmManutencaoRestricoes.cxProgressBar.Refresh;
end;

procedure thrPopularRestricoes.TerminaProcesso;
begin
  frmManutencaoRestricoes.cxGrid1DBTableView1.OptionsView.
    NoDataToDisplayInfoText := '<nenhuma informação disponível>';
  frmManutencaoRestricoes.dsRestricoes.Enabled := True;
  frmManutencaoRestricoes.cxGrid1.Repaint;
  frmManutencaoRestricoes.cxProgressBar.Visible := False;
  frmManutencaoRestricoes.cxProgressBar.Properties.Text := '';
  frmManutencaoRestricoes.cxProgressBar.Position := 0;
  frmManutencaoRestricoes.cxProgressBar.Clear;
  frmManutencaoRestricoes.actManutencaoRestricoesExtravios.Enabled := True;
  frmManutencaoRestricoes.actManutencaoRestricoesDebitos.Enabled := True;
  frmManutencaoRestricoes.actManutencaoRestricoesExportar.Enabled := True;

end;

procedure thrPopularRestricoes.IniciaProcesso;
begin
  frmManutencaoRestricoes.cxGrid1DBTableView1.OptionsView.
    NoDataToDisplayInfoText := '>Atualizando a grade. Aguarde...<';
  frmManutencaoRestricoes.actManutencaoRestricoesExtravios.Enabled := False;
  frmManutencaoRestricoes.actManutencaoRestricoesDebitos.Enabled := False;
  frmManutencaoRestricoes.actManutencaoRestricoesExportar.Enabled := False;
end;

end.
