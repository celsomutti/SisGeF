unit uthrPopularExtravios;

interface

uses
  System.Classes, clExtravios, clUtil, udm, Dialogs, Windows, Forms, SysUtils,
  Messages, Controls,
  System.DateUtils, clCodigosEntregadores, clAgentes;

type
  thrPopularExtravios = class(TThread)
  private
    { Private declarations }
    extravios: TExtravios;
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

{ thrPopularExtravios }

uses uGlobais, ufrmExtraviosProdutos;

procedure thrPopularExtravios.Execute;
var
  Contador, LinhasTotal: Integer;
  sNome, sValor, sFiltro: String;
begin
  try
    sValor := frmExtraviosProdutos.sId;
    sFiltro := frmExtraviosProdutos.sColuna;
    extravios := TExtravios.Create;
    entregador := TCodigosEntregadores.Create;
    agente := TAgente.Create;
    while not(Self.Terminated) do
    begin
      if dm.tbExtravios.Active then
      begin
        dm.tbExtravios.Close;
      end;
      dm.tbExtravios.Open;
      if (not extravios.getObject(sValor, sFiltro)) then
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
        dm.tbExtravios.Insert;
        dm.tbExtraviosCOD_EXTRAVIO.Value := dm.qryGetObject.FieldByName
          ('COD_EXTRAVIO').AsInteger;
        dm.tbExtraviosDES_EXTRAVIO.Value := dm.qryGetObject.FieldByName
          ('DES_EXTRAVIO').AsString;
        dm.tbExtraviosDAT_EXTRAVIO.Value := dm.qryGetObject.FieldByName
          ('DAT_EXTRAVIO').AsDateTime;
        dm.tbExtraviosNUM_NOSSONUMERO.Value := dm.qryGetObject.FieldByName
          ('NUM_NOSSONUMERO').AsString;
        dm.tbExtraviosVAL_TOTAL.Value := dm.qryGetObject.FieldByName
          ('VAL_TOTAL').AsFloat;
        dm.tbExtraviosVAL_PRODUTO.Value := dm.qryGetObject.FieldByName
          ('VAL_PRODUTO').AsFloat;
        dm.tbExtraviosVAL_MULTA.Value := dm.qryGetObject.FieldByName
          ('VAL_MULTA').AsFloat;
        dm.tbExtraviosVAL_VERBA.Value := dm.qryGetObject.FieldByName
          ('VAL_VERBA').AsFloat;
        dm.tbExtraviosCOD_ENTREGADOR.Value := dm.qryGetObject.FieldByName
          ('COD_ENTREGADOR').AsInteger;
        dm.tbExtraviosCOD_AGENTE.Value := dm.qryGetObject.FieldByName
          ('COD_AGENTE').AsInteger;
        dm.tbExtraviosDES_ENVIO_CORRESPONDENCIA.Value :=
          dm.qryGetObject.FieldByName('DES_ENVIO_CORRESPONDENCIA').AsString;
        dm.tbExtraviosDES_RETORNO_CORRESPONDENCIA.Value :=
          dm.qryGetObject.FieldByName('DES_RETORNO_CORRESPONDENCIA').AsString;
        dm.tbExtraviosDES_OBSERVACOES.Value := dm.qryGetObject.FieldByName
          ('DES_OBSERVACOES').AsString;
        dm.tbExtraviosVAL_TOTAL.Value := dm.qryGetObject.FieldByName
          ('VAL_TOTAL').AsFloat;
        dm.tbExtraviosDOM_RESTRICAO.Value := dm.qryGetObject.FieldByName
          ('DOM_RESTRICAO').AsString;
        dm.tbExtraviosCOD_TIPO.Value := dm.qryGetObject.FieldByName('COD_TIPO')
          .AsInteger;
        sNome := '';
        entregador.Codigo := dm.qryGetObject.FieldByName('COD_ENTREGADOR')
          .AsInteger;
        sNome := entregador.getField('NOM_FANTASIA', 'CODIGO');
        dm.tbExtraviosNOM_ENTREGADOR.Value := sNome;
        sNome := '';
        agente.Codigo := dm.qryGetObject.FieldByName('COD_AGENTE').AsString;
        sNome := agente.getField('NOM_FANTASIA', 'CODIGO');
        dm.tbExtraviosNOM_AGENTE.Value := sNome;
        dm.tbExtravios.Post;
        dPosicao := (Contador / LinhasTotal) * 100;
        Inc(Contador);
        if not(Self.Terminated) then
        begin
          Synchronize(AtualizaProgress);
        end
        else
        begin
          Synchronize(TerminaProcesso);
          extravios.Free;
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
    extravios.Free;
    entregador.Free;
    agente.Free;
  end;
end;

procedure thrPopularExtravios.AtualizaProgress;
begin
  frmExtraviosProdutos.cxProgressBar.Visible := True;
  frmExtraviosProdutos.cxProgressBar.Position := Round(dPosicao);
  frmExtraviosProdutos.cxProgressBar.Properties.Text :=
    IntToStr(Round(dPosicao)) + '%';
  frmExtraviosProdutos.cxProgressBar.Refresh;
end;

procedure thrPopularExtravios.TerminaProcesso;
begin
  frmExtraviosProdutos.cxGrid1DBTableView1.OptionsView.NoDataToDisplayInfoText
    := '<nenhuma informação disponível>';
  frmExtraviosProdutos.cxGrid1.Repaint;
  frmExtraviosProdutos.cxProgressBar.Visible := False;
  frmExtraviosProdutos.cxProgressBar.Properties.Text := '';
  frmExtraviosProdutos.cxProgressBar.Position := 0;
  frmExtraviosProdutos.cxProgressBar.Clear;
  frmExtraviosProdutos.dsExtravios.Enabled := True;
  frmExtraviosProdutos.cxGrid1DBTableView1COD_AGENTE.Properties.
    ReadOnly := True;
  if (not dm.tbExtravios.IsEmpty) then
  begin
    frmExtraviosProdutos.actExtraviosProdutosIncluir.Enabled := True;
    frmExtraviosProdutos.actExtraviosProdutosEstornar.Enabled := True;
    frmExtraviosProdutos.actExtraviosProdutosGravar.Enabled := True;
    frmExtraviosProdutos.actExtraviosProdutosLocalizar.Enabled := False;
    frmExtraviosProdutos.actExtraviosProdutosCancelar.Enabled := True;
    frmExtraviosProdutos.actExtraviosProdutosExportar.Enabled := True;
    frmExtraviosProdutos.actExtraviosProdutosImportar.Enabled := False;
    frmExtraviosProdutos.actExtraviosProdutosFiltrar.Enabled := False;
    frmExtraviosProdutos.actExtraviosProdutosEditar.Enabled := True;
    frmExtraviosProdutos.cxGrid1DBTableView1NUM_NOSSONUMERO.Properties.
      ReadOnly := True;
    frmExtraviosProdutos.cxGrid1DBTableView1COD_ENTREGADOR.Properties.
      ReadOnly := True;
    frmExtraviosProdutos.cxGrid1DBTableView1VAL_PRODUTO.Properties.
      ReadOnly := True;
    frmExtraviosProdutos.cxGrid1DBTableView1VAL_MULTA.Properties.
      ReadOnly := True;
    frmExtraviosProdutos.sOperacao := 'U';
  end
  else
  begin
    frmExtraviosProdutos.actExtraviosProdutosIncluir.Enabled := True;
    frmExtraviosProdutos.actExtraviosProdutosEstornar.Enabled := True;
    frmExtraviosProdutos.actExtraviosProdutosGravar.Enabled := False;
    frmExtraviosProdutos.actExtraviosProdutosLocalizar.Enabled := True;
    frmExtraviosProdutos.actExtraviosProdutosCancelar.Enabled := False;
    frmExtraviosProdutos.actExtraviosProdutosExportar.Enabled := False;
    frmExtraviosProdutos.actExtraviosProdutosImportar.Enabled := True;
    frmExtraviosProdutos.actExtraviosProdutosFiltrar.Enabled := True;
    frmExtraviosProdutos.actExtraviosProdutosEditar.Enabled := False;
    frmExtraviosProdutos.cxGrid1DBTableView1NUM_NOSSONUMERO.Properties.
      ReadOnly := False;
    frmExtraviosProdutos.cxGrid1DBTableView1COD_ENTREGADOR.Properties.
      ReadOnly := False;
    frmExtraviosProdutos.cxGrid1DBTableView1VAL_PRODUTO.Properties.
      ReadOnly := False;
    frmExtraviosProdutos.cxGrid1DBTableView1VAL_MULTA.Properties.
      ReadOnly := False;
    frmExtraviosProdutos.sOperacao := 'X';
  end;

end;

procedure thrPopularExtravios.IniciaProcesso;
begin
  frmExtraviosProdutos.cxGrid1DBTableView1.OptionsView.NoDataToDisplayInfoText
    := '>Atualizando a grade. Aguarde...<';
  frmExtraviosProdutos.cxGrid1DBTableView1NUM_NOSSONUMERO.Properties.
    ReadOnly := True;
  frmExtraviosProdutos.cxGrid1DBTableView1COD_ENTREGADOR.Properties.
    ReadOnly := True;
  frmExtraviosProdutos.cxGrid1DBTableView1VAL_PRODUTO.Properties.
    ReadOnly := True;
  frmExtraviosProdutos.cxGrid1DBTableView1VAL_MULTA.Properties.ReadOnly := True;
end;

end.
