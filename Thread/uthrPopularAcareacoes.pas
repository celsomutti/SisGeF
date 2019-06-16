unit uthrPopularAcareacoes;

interface

uses
  System.Classes, clUtil, udm, Dialogs, Windows, Forms, SysUtils, Messages,
  Controls,
  System.DateUtils, clCodigosEntregadores, clAgentes, clAcareacoes;

type
  thrPopularAcareacoes = class(TThread)
  private
    { Private declarations }
    acareacoes: TAcareacoes;
    entregador: TCodigosEntregadores;
    agente: TAgente;
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

{ thrPopularAcareacoes }

uses uGlobais, ufrmAcareacoes, ufrmPrincipal;

procedure thrPopularAcareacoes.Execute;
var
  Contador, LinhasTotal: Integer;
  sNome, sValor, sFiltro: String;
begin
  try
    sValor := frmAcareacoes.sId;
    sFiltro := frmAcareacoes.sColuna;
    acareacoes := TAcareacoes.Create;
    entregador := TCodigosEntregadores.Create;
    agente := TAgente.Create;
    while not(Self.Terminated) do
    begin
      if dm.tbAcareacoes.Active then
      begin
        dm.tbAcareacoes.Close;
      end;
      dm.tbAcareacoes.Open;
      if (not acareacoes.GetObject(sValor, sFiltro)) then
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
        dm.tbAcareacoes.Insert;
        dm.tbAcareacoesSEQ_ACAREACAO.Value := dm.qryGetObject.FieldByName
          ('SEQ_ACAREACAO').AsInteger;
        dm.tbAcareacoesID_ACAREACAO.Value := dm.qryGetObject.FieldByName
          ('ID_ACAREACAO').AsString;
        dm.tbAcareacoesDAT_ACAREACAO.Value := dm.qryGetObject.FieldByName
          ('DAT_ACAREACAO').AsDateTime;
        dm.tbAcareacoesNUM_NOSSONUMERO.Value :=
          dm.qryGetObject.FieldByName('NUM_NOSSONUMERO').AsString;
        dm.tbAcareacoesCOD_ENTREGADOR.Value := dm.qryGetObject.FieldByName
          ('COD_ENTREGADOR').AsInteger;
        sNome := '';
        entregador.Codigo := dm.qryGetObject.FieldByName('COD_ENTREGADOR')
          .AsInteger;
        sNome := entregador.getField('NOM_FANTASIA', 'CODIGO');
        dm.tbAcareacoesNOM_ENTREGADOR.Value := sNome;
        dm.tbAcareacoesCOD_BASE.Value := dm.qryGetObject.FieldByName('COD_BASE')
          .AsInteger;
        sNome := '';
        agente.Codigo := dm.qryGetObject.FieldByName('COD_BASE').AsString;
        sNome := agente.getField('NOM_FANTASIA', 'CODIGO');
        dm.tbAcareacoesNOM_BASE.Value := sNome;
        dm.tbAcareacoesDES_MOTIVO.Value := dm.qryGetObject.FieldByName
          ('DES_MOTIVO').AsString;
        dm.tbAcareacoesDES_TRATATIVA.Value := dm.qryGetObject.FieldByName
          ('DES_TRATATIVA').AsString;
        dm.tbAcareacoesDES_APURACAO.Value := dm.qryGetObject.FieldByName
          ('DES_APURACAO').AsString;
        dm.tbAcareacoesDES_RESULTADO.Value := dm.qryGetObject.FieldByName
          ('DES_RESULTADO').AsString;
        dm.tbAcareacoesVAL_EXTRAVIO.Value := dm.qryGetObject.FieldByName
          ('VAL_EXTRAVIO').AsFloat;
        dm.tbAcareacoesVAL_MULTA.Value := dm.qryGetObject.FieldByName
          ('VAL_MULTA').AsFloat;
        dm.tbAcareacoesDES_ENVIO_CORRESPONDENCIA.Value :=
          dm.qryGetObject.FieldByName('DES_ENVIO_CORRESPONDENCIA').AsString;
        dm.tbAcareacoesDES_RETORNO_CORRESPONDENCIA.Value :=
          dm.qryGetObject.FieldByName('DES_RETORNO_CORRESPONDENCIA').AsString;
        dm.tbAcareacoesDES_OBSERVACOES.Value :=
          dm.qryGetObject.FieldByName('DES_OBSERVACOES').AsString;
        dm.tbAcareacoes.Post;
        dPosicao := (Contador / LinhasTotal) * 100;
        Inc(Contador);
        if not(Self.Terminated) then
        begin
          Synchronize(AtualizaProgress);
        end
        else
        begin
          Synchronize(TerminaProcesso);
          acareacoes.Free;
          entregador.Free;
          agente.Free;
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
    acareacoes.Free;
    entregador.Free;
    agente.Free;
  end;
end;

procedure thrPopularAcareacoes.AtualizaProgress;
begin
  frmAcareacoes.cxProgressBar.Visible := True;
  frmAcareacoes.cxProgressBar.Position := Round(dPosicao);
  frmAcareacoes.cxProgressBar.Properties.Text :=
    IntToStr(Round(dPosicao)) + '%';
  frmAcareacoes.cxProgressBar.Refresh;
end;

procedure thrPopularAcareacoes.TerminaProcesso;
begin
  frmAcareacoes.cxGrid1DBTableView1.OptionsView.NoDataToDisplayInfoText :=
    '<nenhuma informação disponível>';
  frmAcareacoes.cxGrid1.Repaint;
  frmAcareacoes.cxProgressBar.Visible := False;
  frmAcareacoes.cxProgressBar.Properties.Text := '';
  frmAcareacoes.cxProgressBar.Position := 0;
  frmAcareacoes.cxProgressBar.Clear;
  frmAcareacoes.dsAcareacoes.Enabled := True;
  if (not dm.tbAcareacoes.IsEmpty) then
  begin
    frmAcareacoes.actAcareacoesIncluir.Enabled := False;
    frmAcareacoes.actAcareacoesGravar.Enabled := True;
    frmAcareacoes.actAcareacoesLocalizar.Enabled := False;
    frmAcareacoes.actAcareacoesCancelar.Enabled := True;
    frmAcareacoes.actAcareacoesExportar.Enabled := False;
    frmAcareacoes.actAcareacoesEditar.Enabled := True;
    frmAcareacoes.actAcareacoesFiltrar.Enabled := False;
    frmAcareacoes.sOperacao := 'U';
    frmAcareacoes.cxGrid1DBTableView1ID_ACAREACAO.Properties.ReadOnly := True;
    frmAcareacoes.cxGrid1DBTableView1DAT_ACAREACAO.Properties.ReadOnly := True;
    frmAcareacoes.cxGrid1DBTableView1NUM_NOSSONUMERO.Properties.
      ReadOnly := True;
    frmAcareacoes.cxGrid1DBTableView1COD_ENTREGADOR.Properties.ReadOnly := True;
    frmAcareacoes.cxGrid1DBTableView1NOM_ENTREGADOR.Properties.ReadOnly := True;
    frmAcareacoes.cxGrid1DBTableView1COD_BASE.Properties.ReadOnly := True;
    frmAcareacoes.cxGrid1DBTableView1DES_MOTIVO.Properties.ReadOnly := False;
    frmAcareacoes.cxGrid1DBTableView1DES_TRATATIVA.Properties.ReadOnly := False;
    frmAcareacoes.cxGrid1DBTableView1DES_APURACAO.Properties.ReadOnly := False;
    frmAcareacoes.cxGrid1DBTableView1DES_RESULTADO.Properties.ReadOnly := False;
    frmAcareacoes.cxGrid1DBTableView1VAL_EXTRAVIO.Properties.ReadOnly := False;
    frmAcareacoes.cxGrid1DBTableView1VAL_MULTA.Properties.ReadOnly := False;
    frmAcareacoes.cxGrid1DBTableView1DES_ENVIO_CORRESPONDENCIA.Properties.
      ReadOnly := False;
    frmAcareacoes.cxGrid1DBTableView1DES_RETORNO_CORRESPONDENCIA.Properties.
      ReadOnly := False;
    frmAcareacoes.cxGrid1DBTableView1DES_OBSERVACOES.Properties.
      ReadOnly := False;
  end
  else
  begin
    frmAcareacoes.actAcareacoesIncluir.Enabled := True;
    frmAcareacoes.actAcareacoesGravar.Enabled := False;
    frmAcareacoes.actAcareacoesLocalizar.Enabled := True;
    frmAcareacoes.actAcareacoesCancelar.Enabled := False;
    frmAcareacoes.actAcareacoesExportar.Enabled := False;
    frmAcareacoes.actAcareacoesEditar.Enabled := False;
    frmAcareacoes.actAcareacoesFiltrar.Enabled := True;
    frmAcareacoes.sOperacao := 'X';
    frmAcareacoes.cxGrid1DBTableView1ID_ACAREACAO.Properties.ReadOnly := True;
    frmAcareacoes.cxGrid1DBTableView1DAT_ACAREACAO.Properties.ReadOnly := True;
    frmAcareacoes.cxGrid1DBTableView1NUM_NOSSONUMERO.Properties.
      ReadOnly := True;
    frmAcareacoes.cxGrid1DBTableView1COD_ENTREGADOR.Properties.ReadOnly := True;
    frmAcareacoes.cxGrid1DBTableView1NOM_ENTREGADOR.Properties.ReadOnly := True;
    frmAcareacoes.cxGrid1DBTableView1COD_BASE.Properties.ReadOnly := True;
    frmAcareacoes.cxGrid1DBTableView1DES_MOTIVO.Properties.ReadOnly := True;
    frmAcareacoes.cxGrid1DBTableView1DES_TRATATIVA.Properties.ReadOnly := True;
    frmAcareacoes.cxGrid1DBTableView1DES_APURACAO.Properties.ReadOnly := True;
    frmAcareacoes.cxGrid1DBTableView1DES_RESULTADO.Properties.ReadOnly := True;
    frmAcareacoes.cxGrid1DBTableView1VAL_EXTRAVIO.Properties.ReadOnly := True;
    frmAcareacoes.cxGrid1DBTableView1VAL_MULTA.Properties.ReadOnly := True;
    frmAcareacoes.cxGrid1DBTableView1DES_ENVIO_CORRESPONDENCIA.Properties.
      ReadOnly := True;
    frmAcareacoes.cxGrid1DBTableView1DES_RETORNO_CORRESPONDENCIA.Properties.
      ReadOnly := True;
    frmAcareacoes.cxGrid1DBTableView1DES_OBSERVACOES.Properties.
      ReadOnly := True;
  end;

end;

procedure thrPopularAcareacoes.IniciaProcesso;
begin
  frmAcareacoes.cxGrid1DBTableView1.OptionsView.NoDataToDisplayInfoText :=
    '>Atualizando a grade. Aguarde...<';
end;

end.
