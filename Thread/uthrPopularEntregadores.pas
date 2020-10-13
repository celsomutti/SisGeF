unit uthrPopularEntregadores;

interface

uses
  System.Classes, clUtil, udm, Dialogs, Windows, Forms, SysUtils, Messages,
  Controls, System.DateUtils;

type
  thrPopularEntregadores = class(TThread)
  private
    { Private declarations }
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

  procedure thrPopularEntregadores.UpdateCaption;
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

{ thrPopularEntregadores }

uses
  ufrmPesquisaEntregadores, uGlobais;

procedure thrPopularEntregadores.Execute;
var
  Contador, LinhasTotal: Integer;
  sNome, sSQL, sAgente: String;
  bAgente, bEntregador, bSalva: Boolean;
  sStatus: String;
begin
  try
    bAgente := frmPesquisaEntregadores.cxAgenteAtivo.Checked;
    bEntregador := frmPesquisaEntregadores.cxEntregadoresAtivos.Checked;
    sStatus := '';
    while not(Self.Terminated) do
    begin
      if dm.tbPesquisaEntregador.Active then
      begin
        dm.tbPesquisaEntregador.Close;
      end;
      dm.tbPesquisaEntregador.Open;
      sSQL := 'SELECT tbentregadores.COD_CADASTRO, ' +
        'tbcodigosentregadores.COD_ENTREGADOR, tbentregadores.DOM_FUNCIONARIO, tbentregadores.NUM_CNPJ, ' +
        'tbentregadores.DES_RAZAO_SOCIAL, ' +
        'tbcodigosentregadores.NOM_FANTASIA AS ALIAS, ' +
        'tbentregadores.DAT_GV, ' + 'tbentregadores.DAT_VALIDADE_CNH, ' +
        'tbentregadores.COD_STATUS AS STATUS_ENTREGADOR, ' +
        'tbveiculos.ANO_EXERCICIO_CLRV, tbveiculos.DES_PLACA, tbveiculos.DES_MODELO, ' +
        'tbagentes.COD_AGENTE, ' + 'tbagentes.NOM_FANTASIA, ' +
        'tbagentes.COD_STATUS AS STATUS_AGENTE ' + 'FROM   tbentregadores ' +
        'LEFT JOIN tbcodigosentregadores ON tbentregadores.COD_CADASTRO = tbcodigosentregadores.COD_CADASTRO ' +
        'LEFT JOIN tbagentes ON tbcodigosentregadores.COD_AGENTE = tbagentes.COD_AGENTE ' +
        'LEFT JOIN tbveiculos ON tbentregadores.COD_CADASTRO = tbveiculos.COD_ENTREGADOR;';
      if dm.qryPesquisa.Active then
      begin
        dm.qryPesquisa.Close;
        dm.qryPesquisa.SQL.Clear;
      end;
      dm.qryPesquisa.SQL.Text := sSQL;
      dm.ZConn.PingServer;
      dm.qryPesquisa.Open;
      if dm.qryPesquisa.IsEmpty then
      begin
        Self.Terminate;
      end;
      if Self.Terminated then
      begin
        Break;
      end;
      Contador := 1;
      LinhasTotal := dm.qryPesquisa.RecordCount;
      Synchronize(IniciaProcesso);
      while not(dm.qryPesquisa.Eof) do
      begin
        bSalva := True;
        if bAgente then
        begin
          sStatus := dm.qryPesquisa.FieldByName('STATUS_AGENTE').AsString;
          if TUtil.Empty(sStatus) then
          begin
            sStatus := '1';
          end;
          if Pos(sStatus, '1') = 0 then
          begin
            bSalva := False;
          end;
        end;
        if bEntregador then
        begin
          if bSalva then
          begin
            sStatus := dm.qryPesquisa.FieldByName('STATUS_ENTREGADOR').AsString;
            if TUtil.Empty(sStatus) then
            begin
              sStatus := '1';
            end;
            if Pos(sStatus, '015') = 0 then
            begin
              bSalva := False;
            end;
          end;
        end;
        if bSalva then
        begin
          dm.tbPesquisaEntregador.Insert;
          if TUtil.Empty(dm.qryPesquisa.FieldByName('COD_AGENTE').AsString) then
          begin
            dm.tbPesquisaEntregadorCOD_AGENTE.Value := 0;
          end
          else
          begin
            dm.tbPesquisaEntregadorCOD_AGENTE.Value :=
              dm.qryPesquisa.FieldByName('COD_AGENTE').AsInteger;
          end;
          sAgente := dm.qryPesquisa.FieldByName('NOM_FANTASIA').AsString;
          if TUtil.Empty(sAgente) then
          begin
            sAgente := 'NÃO CADASTRADO';
          end;
          dm.tbPesquisaEntregadorNOM_AGENTE.Value :=
            dm.tbPesquisaEntregadorCOD_AGENTE.AsString + '-' + sAgente;
          dm.tbPesquisaEntregadorDOM_FUNCIONARIO.Value :=
            dm.qryPesquisa.FieldByName('DOM_FUNCIONARIO').AsString;
          dm.tbPesquisaEntregadorCOD_ENTREGADOR.Value :=
            dm.qryPesquisa.FieldByName('COD_ENTREGADOR').AsInteger;
          dm.tbPesquisaEntregadorNUM_CPF.Value :=
            dm.qryPesquisa.FieldByName('NUM_CNPJ').AsString;
          dm.tbPesquisaEntregadorDES_ENTREGADOR.Value :=
            dm.qryPesquisa.FieldByName('DES_RAZAO_SOCIAL').AsString;
          dm.tbPesquisaEntregadorNOM_ENTREGADOR.Value :=
            dm.qryPesquisa.FieldByName('ALIAS').AsString;
          if dm.qryPesquisa.FieldByName('DAT_GV').AsDateTime <> 0 then
          begin
            dm.tbPesquisaEntregadorDAT_GV.Value :=
              dm.qryPesquisa.FieldByName('DAT_GV').AsDateTime;
          end;
          if dm.qryPesquisa.FieldByName('DAT_VALIDADE_CNH').AsDateTime <> 0 then
          begin
            dm.tbPesquisaEntregadorDAT_CNH.Value :=
              dm.qryPesquisa.FieldByName('DAT_VALIDADE_CNH').AsDateTime;
          end;
          dm.tbPesquisaEntregadorCOD_CADASTRO.Value :=
            dm.qryPesquisa.FieldByName('COD_CADASTRO').AsInteger;
          dm.tbPesquisaEntregadorCOD_STATUS.Value := dm.qryPesquisa.FieldByName('STATUS_ENTREGADOR').AsInteger;
          dm.tbPesquisaEntregadorANO_EXERCICIO_CLRV.Value := dm.qryPesquisa.FieldByName('ANO_EXERCICIO_CLRV').AsString;
          dm.tbPesquisaEntregadorDES_PLACA.Value := dm.qryPesquisa.FieldByName('DES_PLACA').AsString;
          dm.tbPesquisaEntregadorDES_MODELO.Value := dm.qryPesquisa.FieldByName('DES_MODELO').AsString;
          dm.tbPesquisaEntregador.Post;
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
          Abort;
        end;
        dm.qryPesquisa.Next;
      end;
      Self.Terminate;
    end;
    dm.qryPesquisa.Close;
    dm.qryPesquisa.SQL.Clear;
  finally
    Synchronize(TerminaProcesso);
  end;
end;

procedure thrPopularEntregadores.AtualizaProgress;
begin
  frmPesquisaEntregadores.cxProgressBar.Visible := True;
  frmPesquisaEntregadores.cxProgressBar.Position := Round(dPosicao);
  frmPesquisaEntregadores.cxProgressBar.Properties.Text :=
    IntToStr(Round(dPosicao)) + '%';
  frmPesquisaEntregadores.cxProgressBar.Refresh;
end;

procedure thrPopularEntregadores.TerminaProcesso;
begin
  frmPesquisaEntregadores.cxGrid1DBTableView1.OptionsView.
    NoDataToDisplayInfoText := '<Nenhuma Informação Disponível>';
  frmPesquisaEntregadores.ds.Enabled := True;
  frmPesquisaEntregadores.cxGrid1.Repaint;
  frmPesquisaEntregadores.cxProgressBar.Visible := False;
  frmPesquisaEntregadores.cxProgressBar.Properties.Text := '';
  frmPesquisaEntregadores.cxProgressBar.Position := 0;
  frmPesquisaEntregadores.cxProgressBar.Clear;
  frmPesquisaEntregadores.actPesquisaSelecionar.Enabled := True;
  frmPesquisaEntregadores.actPesquisaNovo.Enabled := True;
  frmPesquisaEntregadores.cxAgenteAtivo.Enabled := True;
  frmPesquisaEntregadores.cxEntregadoresAtivos.Enabled := True;
  frmPesquisaEntregadores.cxDetalhes.Enabled := True;
  frmPesquisaEntregadores.actPesquisaAtualizar.Enabled := True;
  frmPesquisaEntregadores.acPesquisaExportar.Enabled := True;
  frmPesquisaEntregadores.actPesquisaVeicidos.Enabled := True;
  frmPesquisaEntregadores.cxGrid1DBTableView1.ViewData.Collapse(True);
end;

procedure thrPopularEntregadores.IniciaProcesso;
begin
  frmPesquisaEntregadores.cxGrid1DBTableView1.OptionsView.
    NoDataToDisplayInfoText := '>Atualizando a grade. Aguarde...<';
  frmPesquisaEntregadores.cxAgenteAtivo.Enabled := False;
  frmPesquisaEntregadores.cxEntregadoresAtivos.Enabled := False;
  frmPesquisaEntregadores.cxDetalhes.Enabled := False;
  frmPesquisaEntregadores.actPesquisaSelecionar.Enabled := False;
  frmPesquisaEntregadores.actPesquisaNovo.Enabled := False;
  frmPesquisaEntregadores.actPesquisaAtualizar.Enabled := False;
  frmPesquisaEntregadores.acPesquisaExportar.Enabled := False;
  frmPesquisaEntregadores.actPesquisaVeicidos.Enabled := False;
end;

end.
