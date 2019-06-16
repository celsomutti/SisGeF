unit uthrPopulaRecepcao;

interface

uses
  System.Classes, clEntrega, clUtil, udm, Dialogs, Windows, Forms, SysUtils,
  Messages, Controls,
  System.DateUtils;

type
  thrPopularecepcao = class(TThread)
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
  ufrmRecepcaoHermes, uGlobais;

procedure thrPopularecepcao.Execute;
var
  Contador, LinhasTotal: Integer;
begin
  try
    entrega := TEntrega.Create;
    while not(Self.Terminated) do
    begin
      if dm.tbRecepcao.Active then
      begin
        dm.tbRecepcao.Close;
      end;
      dm.tbRecepcao.Open;
      with dm.qryGeral do
      begin
        Close;
        SQL.Clear;
        if frmRecepcaoHermes.cxSituacao.ItemIndex = 0 then
        begin
          if StrToInt(frmRecepcaoHermes.cxManifesto.Text) > 0 then
          begin
            SQL.Text :=
              'SELECT * FROM tbentregas WHERE NUM_MANIFESTO = :MANIFESTO AND ' +
              'COD_CLIENTE = :CLIENTE AND DOM_RECEBIDO = :RECEBIDO';
            ParamByName('MANIFESTO').AsInteger :=
              StrToInt(frmRecepcaoHermes.cxManifesto.Text);
            ParamByName('CLIENTE').AsInteger := 99991;
            ParamByName('RECEBIDO').AsString := 'S';
          end
          else
          begin
            SQL.Text :=
              'SELECT * FROM tbentregas WHERE COD_CLIENTE = :CLIENTE AND DOM_RECEBIDO = :RECEBIDO';
            ParamByName('CLIENTE').AsInteger := 99991;
            ParamByName('RECEBIDO').AsString := 'S';
          end;
        end
        else
        begin
          if StrToInt(frmRecepcaoHermes.cxManifesto.Text) > 0 then
          begin
            SQL.Text :=
              'SELECT * FROM tbentregas WHERE NUM_MANIFESTO = :MANIFESTO AND ' +
              'COD_CLIENTE = :CLIENTE AND DOM_RECEBIDO <> :RECEBIDO';
            ParamByName('MANIFESTO').AsInteger :=
              StrToInt(frmRecepcaoHermes.cxManifesto.Text);
            ParamByName('CLIENTE').AsInteger := 99991;
            ParamByName('RECEBIDO').AsString := 'S';
          end
          else
          begin
            SQL.Text :=
              'SELECT * FROM tbentregas WHERE COD_CLIENTE = :CLIENTE AND DOM_RECEBIDO <> :RECEBIDO';
            ParamByName('CLIENTE').AsInteger := 99991;
            ParamByName('RECEBIDO').AsString := 'S';
          end;
        end;
        Open;
        if IsEmpty then
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
        while not(Eof) do
        begin
          dm.tbRecepcao.Insert;
          dm.tbRecepcaoNUM_NOSSONUMERO.Value :=
            FieldByName('NUM_NOSSONUMERO').AsString;
          dm.tbRecepcaoNOM_CONSUMIDOR.Value :=
            FieldByName('NOM_CONSUMIDOR').AsString;
          dm.tbRecepcaoDES_ENDERECO.Value :=
            FieldByName('DES_ENDERECO').AsString;
          dm.tbRecepcaoDES_COMPLEMENTO.Value :=
            FieldByName('DES_COMPLEMENTO').AsString;
          dm.tbRecepcaoDES_BAIRRO.Value := FieldByName('DES_BAIRRO').AsString;
          dm.tbRecepcaoNOM_CIDADE.Value := FieldByName('NOM_CIDADE').AsString;
          dm.tbRecepcaoNUM_CEP.Value := FieldByName('NUM_CEP').AsString;
          dm.tbRecepcaoQTD_VOLUMES.Value := FieldByName('QTD_VOLUMES')
            .AsInteger;
          dm.tbRecepcaoQTD_PESO_REAL.Value :=
            FieldByName('QTD_PESO_REAL').AsFloat;
          dm.tbRecepcaoNUM_MANIFESTO.Value := FieldByName('NUM_MANIFESTO')
            .AsInteger;
          dm.tbRecepcaoNUM_CTRC.Value := FieldByName('NUM_CTRC').AsInteger;
          dm.tbRecepcao.Post;
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
          Next;
        end;
        Self.Terminate;
      end;
    end;
    dm.qryGeral.Close;
    dm.qryGeral.SQL.Clear;
  finally
    Synchronize(TerminaProcesso);
    entrega.Free;
  end;
end;

procedure thrPopularecepcao.AtualizaProgress;
begin
  frmRecepcaoHermes.cxProgressBar.Visible := True;
  frmRecepcaoHermes.cxProgressBar.Position := Round(dPosicao);
  frmRecepcaoHermes.cxProgressBar.Properties.Text :=
    IntToStr(Round(dPosicao)) + '%';
  frmRecepcaoHermes.cxProgressBar.Refresh;
end;

procedure thrPopularecepcao.TerminaProcesso;
begin
  frmRecepcaoHermes.cxGrid2DBBandedTableView2.OptionsView.
    NoDataToDisplayInfoText := 'Nenhuma Informação Disponível';
  frmRecepcaoHermes.cxGrid2DBBandedTableView2.Bands[0].Caption :=
    'LISTA DE RECEPÇÃO DE PRODUTOS ' + frmRecepcaoHermes.cxSituacao.Text;
  frmRecepcaoHermes.ds.Enabled := True;
  frmRecepcaoHermes.cxGrid2DBBandedTableView2.ViewData.Expand(True);
  frmRecepcaoHermes.cxGrid2.Refresh;
  frmRecepcaoHermes.cxProgressBar.Visible := False;
  frmRecepcaoHermes.cxProgressBar.Properties.Text := '';
  frmRecepcaoHermes.cxProgressBar.Position := 0;
  frmRecepcaoHermes.cxProgressBar.Clear;
  frmRecepcaoHermes.actRecepcaoCancelar.Enabled := True;
  frmRecepcaoHermes.actRecepcaoSalvar.Enabled := True;
  frmRecepcaoHermes.actRecepcaoSair.Enabled := True;
  frmRecepcaoHermes.actRecepcaoExportar.Enabled := True;
  // frmRecepcaoHermes.actRecepcaoImprimir.Enabled                                   :=  True;
end;

procedure thrPopularecepcao.IniciaProcesso;
begin
  frmRecepcaoHermes.cxGrid2DBBandedTableView2.OptionsView.
    NoDataToDisplayInfoText := 'Atualizando a grade. Aguarde...';
  frmRecepcaoHermes.actRecepcaoCancelar.Enabled := False;
  frmRecepcaoHermes.actRecepcaoSalvar.Enabled := False;
  frmRecepcaoHermes.actRecepcaoSair.Enabled := False;
  frmRecepcaoHermes.actRecepcaoExportar.Enabled := False;
  // frmRecepcaoHermes.actRecepcaoImprimir.Enabled                                   :=  False;
  frmRecepcaoHermes.cxProgressBar.Clear;
end;

end.
