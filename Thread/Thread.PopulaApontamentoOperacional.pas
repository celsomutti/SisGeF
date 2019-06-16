unit Thread.PopulaApontamentoOperacional;

interface

uses
  System.Classes, System.Generics.Collections, System.SysUtils, Vcl.Forms, System.UITypes, Model.RHOperacionalAusencias,
  DAO.RHOperacionalAusencias, Model.ApontamentoOperacional, DAO.ApontamentoOperacional, clRoteiroEntregador;

type
  Thread_PopulaApontamentoOperacional = class(TThread)
  private
    { Private declarations }
    FData: TDate;
    FdPos: Double;
    apontamento: TApontamentoOperacional;
    apontamentos: TObjectList<TApontamentoOperacional>;
    apontamentoDAO: TApontamentoOperacionalDAO;
    ausencia: TRHoperacionalAusencias;
    ausencias: TObjectList<TRHoperacionalAusencias>;
    ausenciaDAO: TRHoperacionalAusenciasDAO;
  protected
    procedure Execute; override;
    procedure IniciaProcesso;
    procedure AtualizaProcesso;
    procedure TerminaProcesso;
  public
    property Data: TDate read FData write FData;
  end;

implementation

{ 
  Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);  

  and UpdateCaption could look like,

    procedure Thread_PopulaApontamentoOperacional.UpdateCaption;
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

uses View.ApontamentoOperacional, udm;

{ Thread_PopulaApontamentoOperacional }

procedure Thread_PopulaApontamentoOperacional.Execute;
var
  apontamentoTMP: TApontamentoOperacional;
  ausenciaTMP: TRHoperacionalAusencias;
  roteiro: TRoteiroEntregador;
  iTotal : Integer;
  iPos : Integer;
begin
  { Place thread code here }
  try
    Synchronize(IniciaProcesso);
    Screen.Cursor := crHourGlass;
    if view_ApontamentoOperacional.tbApontamento.Active then view_ApontamentoOperacional.tbApontamento.Close;
    view_ApontamentoOperacional.tbApontamento.Open;
    apontamentoDAO := TApontamentoOperacionalDAO.Create();
    apontamentos := apontamentoDAO.FindByData(Self.Data);
    roteiro := TRoteiroEntregador.Create();
    view_ApontamentoOperacional.tbApontamento.IsLoading := True;
    if apontamentos.Count > 0 then
    begin
      iTotal := apontamentos.Count;
      for apontamentoTMP in apontamentos do
      begin
        view_ApontamentoOperacional.tbApontamento.Insert;
        view_ApontamentoOperacional.tbApontamentoID_OPERACAO.AsInteger := apontamentoTMP.ID;
        view_ApontamentoOperacional.tbApontamentoCOD_ENTREGADOR.AsInteger := apontamentoTMP.Entregador;
        view_ApontamentoOperacional.tbApontamentoCOD_ROTEIRO_ANTIGO.AsString := apontamentoTMP.RoteiroAntigo;
        view_ApontamentoOperacional.tbApontamentoDAT_OPERACAO.AsDateTime := apontamentoTMP.Data;
        view_ApontamentoOperacional.tbApontamentoCOD_STATUS_OPERACAO.AsString := apontamentoTMP.StatusOperacao;
        view_ApontamentoOperacional.tbApontamentoCOD_ROTEIRO_NOVO.AsString := apontamentoTMP.RoteiroNovo;
        view_ApontamentoOperacional.tbApontamentoDES_OBSERVACOES.AsString := apontamentoTMP.Obs;
        view_ApontamentoOperacional.tbApontamentoDOM_PLANILHA.AsString := apontamentoTMP.Planilha;
        view_ApontamentoOperacional.tbApontamentoID_REFERENCIA.AsInteger :=  apontamentoTMP.IDReferencia;
        view_ApontamentoOperacional.tbApontamentoDAT_REFERENCIA.AsDateTime := apontamentoTMP.DataReferencia;
        view_ApontamentoOperacional.tbApontamentoDES_LOG.AsString := apontamentoTMP.Log;
        view_ApontamentoOperacional.tbApontamento.Post;
        iPos := iPos + 1;
        FdPos := (iPos / iTotal) * 100;
        Synchronize(AtualizaProcesso);
      end;
      view_ApontamentoOperacional.dsApontamento.AutoEdit := False;
    end
    else
    begin
      if roteiro.getObject('S','MOSTRAR') then
      begin
        iTotal := dm.qryGetObject.RecordCount;
        dm.qryGetObject.First;
        while not dm.qryGetObject.Eof do
        begin
          view_ApontamentoOperacional.tbApontamento.Insert;
          view_ApontamentoOperacional.tbApontamentoID_OPERACAO.AsInteger := 0;
          view_ApontamentoOperacional.tbApontamentoCOD_ENTREGADOR.AsInteger :=
            dm.qryGetObject.FieldByName('COD_CADASTRO').AsInteger;
          view_ApontamentoOperacional.tbApontamentoCOD_ROTEIRO_ANTIGO.AsString :=
            dm.qryGetObject.FieldByName('COD_ROTEIRO_ANTIGO').AsString;
          view_ApontamentoOperacional.tbApontamentoDAT_OPERACAO.AsDateTime := Self.Data;
          view_ApontamentoOperacional.tbApontamentoCOD_STATUS_OPERACAO.AsString := 'P';
          view_ApontamentoOperacional.tbApontamentoCOD_ROTEIRO_NOVO.AsString :=
            dm.qryGetObject.FieldByName('COD_ROTEIRO_NOVO').AsString;
          view_ApontamentoOperacional.tbApontamentoDES_OBSERVACOES.AsString := '';
          view_ApontamentoOperacional.tbApontamentoDOM_PLANILHA.AsString := dm.qryGetObject.FieldByName('DOM_MOSTRAR').AsString;
          view_ApontamentoOperacional.tbApontamentoID_REFERENCIA.AsInteger :=  0;
          view_ApontamentoOperacional.tbApontamentoDAT_REFERENCIA.AsDateTime := 0;
          view_ApontamentoOperacional.tbApontamentoDES_LOG.AsString := '';
          view_ApontamentoOperacional.tbApontamento.Post;
          dm.qryGetObject.Next;
          iPos := iPos + 1;
          FdPos := (iPos / iTotal) * 100;
          Synchronize(AtualizaProcesso);
        end;
        dm.qryGetObject.Close;
        dm.qryGetObject.SQL.Clear;
        view_ApontamentoOperacional.dsApontamento.AutoEdit := True;
      end;
    end;
    if not view_ApontamentoOperacional.tbApontamento.IsEmpty then view_ApontamentoOperacional.tbApontamento.First;
    ausenciaDAO := TRHOperacionalAusenciasDAO.Create();
    ausencias := ausenciaDAO.FindByData(Self.Data);
    if view_ApontamentoOperacional.tbAusencias.Active then view_ApontamentoOperacional.tbAusencias.Close;
    view_ApontamentoOperacional.tbAusencias.Close;
    for ausenciaTMP in ausencias do
    begin
      view_ApontamentoOperacional.tbAusencias.Insert;
      view_ApontamentoOperacional.tbAusenciasID_AUSENCIA.AsInteger := ausenciaTMP.ID;
      view_ApontamentoOperacional.tbAusenciasDAT_OPERACAO.AsDateTime := ausenciaTMP.Data;
      view_ApontamentoOperacional.tbAusenciasCOD_CADASTRO.AsInteger := ausenciaTMP.Cadastro;
      view_ApontamentoOperacional.tbAusenciasCOD_STATUS_OPERACAO.AsString := ausenciaTMP.StatusOperacao;
      view_ApontamentoOperacional.tbAusenciasDES_OBSERVACOES.AsString := ausenciaTMP.Obs;
      view_ApontamentoOperacional.tbAusenciasID_REFERENCIA.AsInteger :=  ausenciaTMP.IDReferencia;
      view_ApontamentoOperacional.tbAusenciasDES_LOG.AsString := ausenciaTMP.Log;
      view_ApontamentoOperacional.tbAusencias.Post;
    end;
  finally
    Synchronize(TerminaProcesso);
    view_ApontamentoOperacional.tbApontamento.IsLoading := False;
    apontamentoDAO.Free;
    ausenciaDAO.Free;
    roteiro.Free;
  end;
end;

procedure Thread_PopulaApontamentoOperacional.IniciaProcesso;
begin
  view_ApontamentoOperacional.pbApontamento.Visible := True;
  view_ApontamentoOperacional.dsApontamento.Enabled := False;
  view_ApontamentoOperacional.tbApontamento.IsLoading := True;
  view_ApontamentoOperacional.pbApontamento.Position := 0;
  view_ApontamentoOperacional.pbApontamento.Refresh;
end;

procedure Thread_PopulaApontamentoOperacional.AtualizaProcesso;
begin
  view_ApontamentoOperacional.pbApontamento.Position := FdPos;
  view_ApontamentoOperacional.pbApontamento.Properties.Text := FormatFloat('0.00%',FdPos);
  view_ApontamentoOperacional.pbApontamento.Refresh;
end;

procedure Thread_PopulaApontamentoOperacional.TerminaProcesso;
begin
  view_ApontamentoOperacional.pbApontamento.Position := 0;
  view_ApontamentoOperacional.pbApontamento.Properties.Text := '';
  view_ApontamentoOperacional.pbApontamento.Refresh;
  view_ApontamentoOperacional.tbApontamento.IsLoading := False;
  view_ApontamentoOperacional.dsApontamento.Enabled := True;
  view_ApontamentoOperacional.pbApontamento.Visible := False;
end;


end.
