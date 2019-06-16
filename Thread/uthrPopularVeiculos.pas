unit uthrPopularVeiculos;

interface

uses
  System.Classes, clEntregador, clVeiculos, clUtil, udm, Dialogs, Windows,
  Forms, SysUtils, Messages, Controls,
  System.DateUtils;

type
  thrPopularVeiculos = class(TThread)
  private
    { Private declarations }
    veiculos: TVeiculos;
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

  procedure thrPopularVeiculos.UpdateCaption;
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

{ thrPopularVeiculos }

uses
  ufrmVeiculos, uGlobais;

procedure thrPopularVeiculos.Execute;
var
  Contador, LinhasTotal: Integer;
  sNome: String;
begin
  try
    entregador := TEntregador.Create;
    veiculos := TVeiculos.Create;
    while not(Self.Terminated) do
    begin
      if dm.tbVeiculos.Active then
      begin
        dm.tbVeiculos.Close;
      end;
      dm.tbVeiculos.Open;
      if not(veiculos.getObjects()) then
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
        dm.tbVeiculos.Insert;
        dm.tbVeiculosDES_PLACA.Value := dm.qryGetObject.FieldByName
          ('DES_PLACA').AsString;
        dm.tbVeiculosUF_PLACA.Value := dm.qryGetObject.FieldByName
          ('UF_PLACA').AsString;
        dm.tbVeiculosNUM_CNPJ.Value := dm.qryGetObject.FieldByName
          ('NUM_CNPJ').AsString;
        dm.tbVeiculosNOM_PROPRIETARIO.Value := dm.qryGetObject.FieldByName
          ('NOM_PROPRIETARIO').AsString;
        if dm.qryGetObject.FieldByName('COD_ENTREGADOR').AsInteger > 0 then
        begin
          entregador.Cadastro := dm.qryGetObject.FieldByName('COD_ENTREGADOR')
            .AsInteger;
          sNome := entregador.getField('DES_RAZAO_SOCIAL', 'CADASTRO');
        end
        else
        begin
          sNome := 'NÃO ATRIBUIDO';
        end;
        dm.tbVeiculosDES_RAZAO_SOCIAL.Value := sNome;
        dm.tbVeiculosDES_MODELO.Value := dm.qryGetObject.FieldByName
          ('DES_MODELO').AsString;
        dm.tbVeiculosDES_TIPO.Value := dm.qryGetObject.FieldByName
          ('DES_TIPO').AsString;
        dm.tbVeiculosNUM_CHASSIS.Value := dm.qryGetObject.FieldByName
          ('NUM_CHASSIS').AsString;
        dm.tbVeiculosDES_ANO.Value := dm.qryGetObject.FieldByName
          ('DES_ANO').AsString;
        dm.tbVeiculosNUM_RENAVAN.Value := dm.qryGetObject.FieldByName
          ('NUM_RENAVAN').AsString;
        dm.tbVeiculosANO_EXERCICIO_CLRV.Value :=
          dm.qryGetObject.FieldByName('ANO_EXERCICIO_CLRV').AsString;
        dm.tbVeiculosCOD_VEICULO.Value := dm.qryGetObject.FieldByName
          ('COD_VEICULO').AsInteger;
        dm.tbVeiculos.Post;
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
          veiculos.Free;
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
    entregador.Free;
    veiculos.Free;
  end;
end;

procedure thrPopularVeiculos.AtualizaProgress;
begin
  frmveiculos.cxProgressBar.Visible := True;
  frmveiculos.cxProgressBar.Position := Round(dPosicao);
  frmveiculos.cxProgressBar.Properties.Text := IntToStr(Round(dPosicao)) + '%';
  frmveiculos.cxProgressBar.Refresh;
end;

procedure thrPopularVeiculos.TerminaProcesso;
begin
  frmveiculos.cxGrid1DBTableView1.OptionsView.NoDataToDisplayInfoText :=
    'Nenhuma Informação Disponível';
  frmveiculos.ds.Enabled := True;
  frmveiculos.cxGrid1.Repaint;
  frmveiculos.cxProgressBar.Visible := False;
  frmveiculos.cxProgressBar.Properties.Text := '';
  frmveiculos.cxProgressBar.Position := 0;
  frmveiculos.cxProgressBar.Clear;
  { frmveiculos.actAtribuicoesIniciar.Enabled                            :=  False;
    frmveiculos.actAtribuicoesCancelar.Enabled                           :=  True;
    frmveiculos.actAtribuicoesReatribuir.Enabled                         :=  True;
    frmveiculos.actAtribuicoesSalvar.Enabled                             :=  True;
    frmveiculos.actAtribuicoesSair.Enabled                               :=  True;
    frmveiculos.actAtribuicoesExportar.Enabled                           :=  True;
    frmveiculos.actAtribuicoesImprimir.Enabled                           :=  True; }
end;

procedure thrPopularVeiculos.IniciaProcesso;
begin
  frmveiculos.cxGrid1DBTableView1.OptionsView.NoDataToDisplayInfoText :=
    'Atualizando a grade. Aguarde...';
  { frmveiculos.actAtribuicoesIniciar.Enabled                            :=  False;
    frmveiculos.actAtribuicoesCancelar.Enabled                           :=  False;
    frmveiculos.actAtribuicoesReatribuir.Enabled                         :=  False;
    frmveiculos.actAtribuicoesSalvar.Enabled                             :=  False;
    frmveiculos.actAtribuicoesSair.Enabled                               :=  False;
    frmveiculos.actAtribuicoesExportar.Enabled                           :=  False;
    frmveiculos.actAtribuicoesImprimir.Enabled                           :=  False;
    frmveiculos.cxProgressBar.Clear; }
end;

end.
