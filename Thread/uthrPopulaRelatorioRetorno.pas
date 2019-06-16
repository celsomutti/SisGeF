unit uthrPopulaRelatorioRetorno;

interface

uses
  System.Classes, clEntrega, clUtil, udm, Dialogs, Windows, Forms, SysUtils,
  Messages, Controls,
  System.DateUtils, clAgentes, clCodigosEntregadores;

type
  thrPopulaRelatorioRetorno = class(TThread)
  private
    { Private declarations }
    entrega: TEntrega;
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

  procedure thrPopulaRelatorio.UpdateCaption;
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

{ thrPopulaRelatorio }

uses
  ufrmRetornoEntregas, uGlobais;

procedure thrPopulaRelatorioRetorno.Execute;
var
  Contador, LinhasTotal: Integer;
  sDataInicial, sDataFinal, sAgente, sCliente, sTipo, sEntregador: String;
begin
  try
    entrega := TEntrega.Create;
    agente := TAgente.Create;
    entregador := TCodigosEntregadores.Create;
    while not(Self.Terminated) do
    begin
      sDataInicial := frmRetornoEntregas.cxDataInicial.Text;
      sDataFinal := frmRetornoEntregas.cxDataFinal.Text;
      sAgente := frmRetornoEntregas.cxCodigoAgente.Text;
      sCliente := frmRetornoEntregas.cxCodigoCliente.Text;
      sTipo := IntToStr(frmRetornoEntregas.cxSituacao.ItemIndex);
      if not(entrega.PosicaoEntregasSimples(sDataInicial, sDataFinal, sAgente,
        sCliente, sTipo)) then
      begin
        Self.Terminate;
        Break;
      end;
      if dm.tbRetorno.Active then
      begin
        dm.tbRetorno.Close;
      end;
      dm.tbRetorno.Open;
      with dm.qryGeral do
      begin
        LinhasTotal := RecordCount;
        First;
        while not(Eof) do
        begin
          agente.Codigo := FieldByName('COD_AGENTE').AsString;
          sAgente := FieldByName('COD_AGENTE').AsString + ' - ' +
            agente.getField('NOM_FANTASIA', 'CODIGO');
          entregador.Codigo := FieldByName('COD_ENTREGADOR').AsInteger;
          sEntregador := FieldByName('COD_ENTREGADOR').AsString + ' - ' +
            entregador.getField('NOM_FANTASIA', 'CODIGO');
          dm.tbRetorno.Insert;
          dm.tbRetornoNUM_NOSSONUMERO.Value :=
            FieldByName('NUM_NOSSONUMERO').AsString;
          dm.tbRetornoNOM_CONSUMIDOR.Value :=
            FieldByName('NOM_CONSUMIDOR').AsString;
          dm.tbRetornoDES_ENDERECO.Value := FieldByName('DES_ENDERECO')
            .AsString;
          dm.tbRetornoDES_BAIRRO.Value := FieldByName('DES_BAIRRO').AsString;
          dm.tbRetornoNOM_CIDADE.Value := FieldByName('NOM_CIDADE').AsString;
          dm.tbRetornoNUM_CEP.Value := FieldByName('NUM_CEP').AsString;
          dm.tbRetornoQTD_VOLUMES.Value := FieldByName('QTD_VOLUMES').AsInteger;
          dm.tbRetornoQTD_PESO_REAL.Value :=
            FieldByName('QTD_PESO_REAL').AsFloat;
          dm.tbRetornoCOD_AGENTE.Value := FieldByName('COD_AGENTE').AsInteger;
          dm.tbRetornoCOD_ENTREGADOR.Value := FieldByName('COD_ENTREGADOR')
            .AsInteger;
          dm.tbRetornoDES_RASTREIO.Value := FieldByName('DES_RASTREIO')
            .AsString;
          dm.tbRetornoDES_RETORNO.Value := FieldByName('DES_RETORNO').AsString;
          dm.tbRetornoDAT_BAIXA.Value := FieldByName('DAT_BAIXA').AsDateTime;
          dm.tbRetornoNOM_AGENTE.Value := sAgente;
          dm.tbRetornoNOM_ENTREGADOR.Value := sEntregador;
          dm.tbRetorno.Post;
          Next;
          dPosicao := (Contador / LinhasTotal) * 100;
          Inc(Contador);
          if not(Self.Terminated) then
          begin
            Synchronize(AtualizaProgress);
          end
          else
          begin
            entrega.Free;
            entregador.Free;
            agente.Free;
            Abort;
          end;
        end;
        Self.Terminate;
      end;
    end;
  finally
    Synchronize(TerminaProcesso);
    entrega.Free;
    entregador.Free;
    agente.Free;
  end;
end;

procedure thrPopulaRelatorioRetorno.AtualizaProgress;
begin
  frmRetornoEntregas.cxProgressBar2.Visible := True;
  frmRetornoEntregas.cxProgressBar2.Position := Round(dPosicao);
  frmRetornoEntregas.cxProgressBar2.Properties.Text :=
    IntToStr(Round(dPosicao)) + '%';
  frmRetornoEntregas.cxProgressBar2.Refresh;
end;

procedure thrPopulaRelatorioRetorno.TerminaProcesso;
begin
  frmRetornoEntregas.cxGridDBTableView2.OptionsView.NoDataToDisplayInfoText :=
    'Nenhuma Informação Disponível';
  frmRetornoEntregas.ds.Enabled := True;
  frmRetornoEntregas.cxProgressBar2.Visible := False;
  frmRetornoEntregas.cxProgressBar2.Properties.Text := '';
  frmRetornoEntregas.cxProgressBar2.Position := 0;
  frmRetornoEntregas.cxProgressBar2.Clear;
  frmRetornoEntregas.actRetornoCancelar.Enabled := True;
  frmRetornoEntregas.actRetornoSalvar.Enabled := False;
  frmRetornoEntregas.actRetornoSair.Enabled := True;
  frmRetornoEntregas.actRetornoExportar.Enabled := True;
  // frmRetornoEntregas.actRetornoImprimir.Enabled                               :=  True;
  frmRetornoEntregas.ds.Enabled := True;
  frmRetornoEntregas.cxGrid3.Refresh;
  frmRetornoEntregas.cxGridDBTableView2.ViewData.Expand(True);
end;

procedure thrPopulaRelatorioRetorno.IniciaProcesso;
begin
  frmRetornoEntregas.cxGridDBTableView2.OptionsView.NoDataToDisplayInfoText :=
    'Populando a Grade. Aguarde...';
  frmRetornoEntregas.actRetornoCancelar.Enabled := False;
  frmRetornoEntregas.actRetornoSalvar.Enabled := False;
  frmRetornoEntregas.actRetornoSair.Enabled := False;
  frmRetornoEntregas.actRetornoExportar.Enabled := False;
  // frmRetornoEntregas.actRetornoImprimir.Enabled                               :=  False;
  frmRetornoEntregas.cxProgressBar.Clear;
end;

end.
