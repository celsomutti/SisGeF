unit uthrExtratoPrevioAgente;

interface

uses
  System.Classes, clEntrega, clUtil, udm, Dialogs, Windows, Forms, SysUtils,
  Messages, Controls, clAgentes,
  System.DateUtils, clCodigosEntregadores;

type
  thrExtratoPrevio = class(TThread)
  private
    { Private declarations }
    entrega: TEntrega;
    sAgente: String;
    entregador: TCodigosEntregadores;
    agente: TAgente;
  protected
    procedure Execute; override;
    procedure IniciaProcesso;
    procedure AtualizaProgress;
    procedure TerminaProcesso;
    procedure MontaCabecalho;
    procedure MontaInAgentes;
  end;

implementation

{ thrExtratoPrevio }

uses
  ufrmExtratoAgente, uGlobais;

procedure thrExtratoPrevio.Execute;
var
  sData, sData1, sTipo, sCampo, sNome, sCodigo: String;
  Contador, LinhasTotal, i, iEntregador, iTotal: Integer;
begin
  entrega := TEntrega.Create;
  entregador := TCodigosEntregadores.Create;
  agente := TAgente.Create;
  try
    sData := frmExtratoAgente.cxDataInicio.Text;
    sData1 := frmExtratoAgente.cxDataTermino.Text;
    Contador := 1;
    sNome := '';
    sCodigo := '';
    Synchronize(IniciaProcesso);
    MontaInAgentes;
    MontaCabecalho;
    if dm.tbPrevia.Active then
      dm.tbPrevia.Close;
    dm.tbPrevia.Open;
    if entrega.Previa(sData, sData1, sAgente) then
    begin
      LinhasTotal := dm.qryGeral.RecordCount;
      while not(dm.qryGeral.Eof) do
      begin
        dm.tbPrevia.Insert;
        dm.tbPreviaCOD_ENTREGADOR.Value :=
          dm.qryGeral.FieldByName('COD_ENTREGADOR').AsInteger;
        entregador.Codigo := dm.qryGeral.FieldByName('COD_ENTREGADOR')
          .AsInteger;
        sCodigo := entregador.getField('COD_AGENTE', 'CODIGO');
        if TUtil.Empty(sCodigo) then
        begin
          sCodigo := '1';
        end;
        agente.Codigo := sCodigo;
        sNome := agente.getField('NOM_FANTASIA', 'CODIGO');
        if TUtil.Empty(sNome) then
        begin
          sNome := 'ADM. DE CEP NÃO CADASTRADO';
        end;
        dm.tbPreviaDES_AGENTE.Value := agente.Codigo + ' - ' + sNome;
        sNome := entregador.getField('NOM_FANTASIA', 'CODIGO');
        if TUtil.Empty(sNome) then
        begin
          sNome := 'ENTREGADOR NÃO CADASTRADO';
        end;
        dm.tbPreviaNOM_FANTASIA.Value := sNome;
        iEntregador := dm.qryGeral.FieldByName('COD_ENTREGADOR').AsInteger;
        iTotal := 0;
        while iEntregador = dm.qryGeral.FieldByName('COD_ENTREGADOR')
          .AsInteger do
        begin
          i := 0;
          sCampo := dm.qryGeral.FieldByName('DAT_BAIXA').AsString;
          for i := 3 to 18 do
          begin
            if dm.tbPrevia.Fields[i].DisplayLabel = sCampo then
            begin
              dm.tbPrevia.Fields[i].Value := dm.qryGeral.FieldByName('TOTAL').AsInteger;
              iTotal := iTotal + dm.qryGeral.FieldByName('TOTAL').AsInteger;
            end;
          end;
          dm.qryGeral.Next;
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
          if dm.qryGeral.Eof then
          begin
            iEntregador := 0;
          end;
        end;
        dm.tbPreviaQTD_TOTAL.Value := iTotal;
        dm.tbPrevia.Post;
        dPosicao := (Contador / LinhasTotal) * 100;
        Inc(Contador);
        if not(Self.Terminated) then
        begin
          Synchronize(AtualizaProgress);
        end
        else
        begin
          entrega.Free;
          agente.Free;
          Abort;
        end;
      end;
    end;
    dm.qryGeral.Close;
    dm.qryGeral.SQL.Clear;
  finally
    Synchronize(TerminaProcesso);
    entrega.Free;
    entregador.Free;
    agente.Free;
  end;
end;

procedure thrExtratoPrevio.AtualizaProgress;
begin
  frmExtratoAgente.cxProgressBar.Visible := True;
  frmExtratoAgente.cxProgressBar.Position := Round(dPosicao);
  frmExtratoAgente.cxProgressBar.Properties.Text :=
    IntToStr(Round(dPosicao)) + '%';
  frmExtratoAgente.cxProgressBar.Refresh;
end;

procedure thrExtratoPrevio.TerminaProcesso;
begin
  entrega.Free;
  entregador.Free;
  frmExtratoAgente.cxGrid1DBTableView1.OptionsView.NoDataToDisplayInfoText :=
    '<Nenhuma Informação Disponível>';
  frmExtratoAgente.cxProgressBar.Visible := False;
  frmExtratoAgente.cxProgressBar.Properties.Text := '';
  frmExtratoAgente.cxProgressBar.Position := 0;
  frmExtratoAgente.cxProgressBar.Clear;
  frmExtratoAgente.dsPrevia.Enabled := True;
  frmExtratoAgente.actExtratoPrevia.Enabled := True;
  frmExtratoAgente.actExtratoFechado.Enabled := True;
  frmExtratoAgente.actExtratoExportarPrevia.Enabled := True;
  frmExtratoAgente.actExtratoExportarExtrato.Enabled := True;
  frmExtratoAgente.dsExtrato.Enabled := True;
  frmExtratoAgente.cxDetalhes.Checked := True;
end;

procedure thrExtratoPrevio.IniciaProcesso;
begin
  frmExtratoAgente.dsExtrato.Enabled := False;
  frmExtratoAgente.cxGrid1DBTableView1.OptionsView.NoDataToDisplayInfoText :=
    '<Atualizando a grade. Aguarde...>';
  frmExtratoAgente.actExtratoPrevia.Enabled := False;
  frmExtratoAgente.actExtratoFechado.Enabled := False;
  frmExtratoAgente.actExtratoExportarPrevia.Enabled := False;
  frmExtratoAgente.actExtratoExportarExtrato.Enabled := False;
  frmExtratoAgente.cxProgressBar.Clear;
end;

procedure thrExtratoPrevio.MontaCabecalho;
var
  dtData, dtData1: TDate;
  i: Integer;
  sCampo: String;
begin
  dtData := frmExtratoAgente.cxDataInicio.Date;
  dtData1 := frmExtratoAgente.cxDataTermino.Date;
  i := 1;
  while dtData <= dtData1 do
  begin
    sCampo := DateToStr(dtData);
    dm.tbPrevia.FieldByName('QTD_ENTREGAS_' + IntToStr(i)).DisplayLabel
      := sCampo;
    Inc(i);
    dtData := IncDay(dtData);
  end;
end;

Procedure thrExtratoPrevio.MontaInAgentes;
var
  i: Integer;
begin
  i := 0;
  sAgente := '';
  for i := 0 to uGlobais.lAgentes.Count - 1 do
  begin
    if TUtil.Empty(sAgente) then
    begin
      sAgente := uGlobais.lAgentes[i];
    end
    else
    begin
      sAgente := sAgente + ',' + uGlobais.lAgentes[i];
    end;
  end;
end;

end.
