unit uthrPopularExtraviosCadastro;

interface

uses
  System.Classes, clExtravios, clUtil, udm, Dialogs, Windows, Forms, SysUtils,
  Messages, Controls, System.StrUtils,
  System.DateUtils;

type
  thrPopularExtraviosCadastro = class(TThread)
  private
    { Private declarations }
    extravios: TExtravios;
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

{ thrPopularExtraviosCadastro }

uses
  ufrmEntregadoresFuncionarios, uGlobais;

procedure thrPopularExtraviosCadastro.Execute;
var
  Contador, LinhasTotal: Integer;
  sNome, sEntregador: String;
begin
  try
    sEntregador := frmEntregadoresFuncionarios.sCodEntregadores;
    extravios := TExtravios.Create;
    while not(Self.Terminated) do
    begin
      if dm.tbExtravios.Active then
      begin
        dm.tbExtravios.Close;
      end;
      dm.tbExtravios.Open;
      if not(extravios.getObject(sEntregador, 'ENTREGADORES')) then
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
        dm.tbExtraviosCOD_ENTREGADOR.Value := dm.qryGetObject.FieldByName
          ('COD_ENTREGADOR').AsInteger;
        codigoentregador.Codigo := dm.qryGetObject.FieldByName('COD_ENTREGADOR')
          .AsInteger;
        sNome := '';
        sNome := codigoentregador.getField('NOM_FANTASIA', 'CODIGO');
        if TUtil.Empty(sNome) then
        begin
          sNome := 'NÃO CADASTRADO';
        end;
        dm.tbExtraviosNOM_ENTREGADOR.Value := dm.qryGetObject.FieldByName
          ('COD_ENTREGADOR').AsString + ' - ' + sNome;
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
  end;
end;

procedure thrPopularExtraviosCadastro.AtualizaProgress;
begin
  frmEntregadoresFuncionarios.cxProgressBar.Visible := True;
  frmEntregadoresFuncionarios.cxProgressBar.Position := Round(dPosicao);
  frmEntregadoresFuncionarios.cxProgressBar.Properties.Text :=
    IntToStr(Round(dPosicao)) + '%';
  frmEntregadoresFuncionarios.cxProgressBar.Refresh;
end;

procedure thrPopularExtraviosCadastro.TerminaProcesso;
begin
  frmEntregadoresFuncionarios.cxGridDBTableView1.OptionsView.
    NoDataToDisplayInfoText := 'Nenhuma Informação Disponível';
  frmEntregadoresFuncionarios.ds1.Enabled := True;
  frmEntregadoresFuncionarios.cxGrid1.Repaint;
  frmEntregadoresFuncionarios.cxProgressBar.Visible := False;
  frmEntregadoresFuncionarios.cxProgressBar.Properties.Text := '';
  frmEntregadoresFuncionarios.cxProgressBar.Position := 0;
  frmEntregadoresFuncionarios.cxProgressBar.Clear;
  frmEntregadoresFuncionarios.cxGridDBTableView1.ViewData.Expand(True);
  { frmEntregadoresFuncionarios.actAtribuicoesIniciar.Enabled                            :=  False;
    frmEntregadoresFuncionarios.actAtribuicoesCancelar.Enabled                           :=  True;
    frmEntregadoresFuncionarios.actAtribuicoesReatribuir.Enabled                         :=  True;
    frmEntregadoresFuncionarios.actAtribuicoesSalvar.Enabled                             :=  True;
    frmEntregadoresFuncionarios.actAtribuicoesSair.Enabled                               :=  True;
    frmEntregadoresFuncionarios.actAtribuicoesExportar.Enabled                           :=  True;
    frmEntregadoresFuncionarios.actAtribuicoesImprimir.Enabled                           :=  True; }
end;

procedure thrPopularExtraviosCadastro.IniciaProcesso;
begin
  frmEntregadoresFuncionarios.cxGridDBTableView1.OptionsView.
    NoDataToDisplayInfoText := 'Atualizando a grade. Aguarde...';
  { frmEntregadoresFuncionarios.actAtribuicoesIniciar.Enabled                            :=  False;
    frmEntregadoresFuncionarios.actAtribuicoesCancelar.Enabled                           :=  False;
    frmEntregadoresFuncionarios.actAtribuicoesReatribuir.Enabled                         :=  False;
    frmEntregadoresFuncionarios.actAtribuicoesSalvar.Enabled                             :=  False;
    frmEntregadoresFuncionarios.actAtribuicoesSair.Enabled                               :=  False;
    frmEntregadoresFuncionarios.actAtribuicoesExportar.Enabled                           :=  False;
    frmEntregadoresFuncionarios.actAtribuicoesImprimir.Enabled                           :=  False;
    frmEntregadoresFuncionarios.cxProgressBar.Clear; }
end;

end.
