unit Thread.PopulaExtratoExpressa;

interface

uses
  System.Classes, Model.ExtratosExpressas, Generics.Collections, DAO.ExtratosExpressas, Model.Entregadores, DAO.Entregadores, clAgentes, Forms, Windows, System.SysUtils;

type
  Thread_PopulaExtratoExpressa = class(TThread)
  private
    { Private declarations }
    FdPos: Double;
    extratos : TObjectList<TExtratosExpressas>;
    extrato : TExtratosExpressas;
    extratoDAO : TExtratosExpressasDAO;
    entregadores : TObjectList<TEntregadores>;
    entregador : TEntregadores;
    entregadorDAO : TEntregadoresDAO;
    agente : TAgente;
    sMensagem: String;
  public
    dtInicio: TDate;
    dtFinal: TDate;
  protected
    procedure IniciaProcesso;
    procedure AtualizaProcesso;
    procedure TerminaProcesso;
    procedure PopulaExtrato;
    procedure Execute; override;
  end;

implementation

{ 
  Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);  

  and UpdateCaption could look like,

    procedure Thread_PopulaExtratoExpressa.UpdateCaption;
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

uses udm, View.ExtratoExpressas;

{ Thread_PopulaExtratoExpressa }

procedure Thread_PopulaExtratoExpressa.AtualizaProcesso;
begin
  view_ExtratoExpressas.sbExtrato.Panels[0].Text := sMensagem;
  view_ExtratoExpressas.sbExtrato.Refresh;
  view_ExtratoExpressas.pbExtrato.Position := FdPos;
  view_ExtratoExpressas.pbExtrato.Properties.Text := FormatFloat('0.00%',FdPos);
  view_ExtratoExpressas.pbExtrato.Refresh;
end;

procedure Thread_PopulaExtratoExpressa.Execute;
begin
  { Place thread code here }
  Synchronize(IniciaProcesso);
  Synchronize(PopulaExtrato);
  Synchronize(TerminaProcesso);
end;

procedure Thread_PopulaExtratoExpressa.IniciaProcesso;
begin
  view_ExtratoExpressas.dsExtrato.Enabled := False;
  view_ExtratoExpressas.sbExtrato.Panels[0].Text := '';
  view_ExtratoExpressas.pbExtrato.Visible := True;
  view_ExtratoExpressas.pbExtrato.Position := 0;
  view_ExtratoExpressas.pbExtrato.Refresh;
  view_ExtratoExpressas.sbExtrato.Refresh;
end;

procedure Thread_PopulaExtratoExpressa.PopulaExtrato;
var
  aParam: array of Variant;
  extratoTMP: TExtratosExpressas;
  sNome: String;
  iPos: Integer;
  iTotal: Integer;
begin
  try
    extratos := TObjectList<TExtratosExpressas>.Create;
    extratoDAO := TExtratosExpressasDAO.Create;
    SetLength(aParam,2);
    aParam[0] := dtInicio;
    aParam[1] := dtFinal;
    extratos := extratoDAO.FindExtrato('DATA', aParam);
    Finalize(aParam);
    agente := TAgente.Create;
    entregadores := TObjectList<TEntregadores>.Create;
    entregadorDAO := TEntregadoresDAO.Create;
    FdPos := 0;
    iPos := 0;
    sMensagem := 'POPULANDO O EXTRATO. Aguarde ...';
    Synchronize(AtualizaProcesso);
    iTotal := extratos.Count;
    view_ExtratoExpressas.mtbExtrato.IsLoading := True;
    view_ExtratoExpressas.mtbExtrato.Open;
    for extratoTMP in extratos do
    begin
      view_ExtratoExpressas.mtbExtrato.Insert;
      view_ExtratoExpressas.mtbExtratoID_EXTRATO.AsInteger := extratoTMP.Id;
      view_ExtratoExpressas.mtbExtratoCOD_AGENTE.AsInteger := extratoTMP.Agente;
      if agente.getObject(extratoTMP.Agente.ToString,'CODIGO') then
      begin
        view_ExtratoExpressas.mtbExtratoNOM_AGENTE.AsString := agente.Fantasia;
      end
      else
      begin
        view_ExtratoExpressas.mtbExtratoNOM_AGENTE.AsString := 'NONE';
      end;
      view_ExtratoExpressas.mtbExtratoCOD_ENTREGADOR.AsInteger := extratoTMP.Entregador;
        SetLength(aParam,1);
        aParam[0] := extratoTMP.Entregador;
        entregadores := entregadorDAO.FindEntregador('ENTREGADOR', aParam);
        Finalize(aParam);
        if entregadores.Count > 0 then
        begin
          view_ExtratoExpressas.mtbExtratoNOM_ENTREGADOR.AsString := entregadores[0].Fantasia;
        end
        else
        begin
          view_ExtratoExpressas.mtbExtratoNOM_ENTREGADOR.AsString := 'NONE';
        end;
      view_ExtratoExpressas.mtbExtratoDAT_INICIO.AsDateTime :=extratoTMP.DataInicio;
      view_ExtratoExpressas.mtbExtratoDAT_FINAL.AsDateTime := extratoTMP.DataFinal;
      view_ExtratoExpressas.mtbExtratoDAT_PAGAMENTO.AsDateTime := extratoTMP.DataPagamento;
      view_ExtratoExpressas.mtbExtratoQTD_VOLUMES.AsInteger := extratoTMP.Volumes;
      view_ExtratoExpressas.mtbExtratoQTD_ENTREGAS.AsInteger := extratoTMP.Entregas;
      view_ExtratoExpressas.mtbExtratoQTD_ITENS_ATRASO.AsInteger := extratoTMP.Atrasos;
      view_ExtratoExpressas.mtbExtratoQTD_VOLUMES_EXTRA.AsFloat := extratoTMP.VolumesExtra;
      view_ExtratoExpressas.mtbExtratoVAL_PERCENTUAL_SLA.AsFloat := extratoTMP.SLA;
      view_ExtratoExpressas.mtbExtratoVAL_VERBA.AsFloat := extratoTMP.Verba;
      view_ExtratoExpressas.mtbExtratoVAL_ENTREGAS.AsFloat := extratoTMP.ValorEntregas;
      view_ExtratoExpressas.mtbExtratoVAL_VOLUMES_EXTRA.AsFloat := extratoTMP.ValorVolumesExtra;
      view_ExtratoExpressas.mtbExtratoVAL_PRODUCAO.AsFloat := extratoTMP.ValorProducao;
      view_ExtratoExpressas.mtbExtratoVAL_CREDITOS.AsFloat := extratoTMP.ValorCreditos;
      view_ExtratoExpressas.mtbExtratoVAL_RESTRICAO.AsFloat := extratoTMP.ValorRestricao;
      view_ExtratoExpressas.mtbExtratoVAL_EXTRAVIOS.AsFloat := extratoTMP.ValorExtravio;
      view_ExtratoExpressas.mtbExtratoVAL_DEBITOS.AsFloat := extratoTMP.ValorDebitos;
      view_ExtratoExpressas.mtbExtratoVAL_TOTAL_CREDTOS.AsFloat := extratoTMP.ValorTotalCreditos;
      view_ExtratoExpressas.mtbExtratoVAL_TOTAL_DEBITOS.AsFloat := extratoTMP.ValorTotalDebitos;
      view_ExtratoExpressas.mtbExtratoVAL_TOTAL_GERAL.AsFloat := extratoTMP.ValorTotalGeral;
      view_ExtratoExpressas.mtbExtratoDOM_FECHADO.AsInteger := extratoTMP.Fechado;
      view_ExtratoExpressas.mtbExtratoDES_LOG.AsString := extratoTMP.Log;
      view_ExtratoExpressas.mtbExtratoQTD_PFP.AsInteger := extratoTMP.PFP;
      view_ExtratoExpressas.mtbExtrato.Post;
      iPos := iPos + 1;
      FdPos := (iPos / iTotal) * 100;
      Synchronize(AtualizaProcesso);
   end;
  finally
    if not view_ExtratoExpressas.mtbExtrato.IsEmpty then view_ExtratoExpressas.mtbExtrato.First;
    view_ExtratoExpressas.mtbExtrato.IsLoading := False;
    entregadorDAO.Free;
    agente.Free;
    extratoDAO.Free;
  end;
end;

procedure Thread_PopulaExtratoExpressa.TerminaProcesso;
begin
  sMensagem := '';
  FdPos := 0;
  view_ExtratoExpressas.sbExtrato.Panels[0].Text := '';
  view_ExtratoExpressas.pbExtrato.Position := 0;
  view_ExtratoExpressas.pbExtrato.Refresh;
  view_ExtratoExpressas.pbExtrato.Visible := False;
  view_ExtratoExpressas.sbExtrato.Refresh;
  view_ExtratoExpressas.dsExtrato.Enabled := True;
  view_ExtratoExpressas.tvExtrato.ViewData.Expand(True);
end;

end.
