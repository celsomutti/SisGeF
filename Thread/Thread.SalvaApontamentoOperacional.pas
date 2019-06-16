unit Thread.SalvaApontamentoOperacional;

interface

uses
  System.Classes, System.Generics.Collections, System.SysUtils, Vcl.Forms, System.UITypes, Model.RHOperacionalAusencias,
  DAO.RHOperacionalAusencias, Model.ApontamentoOperacional, DAO.ApontamentoOperacional;

type
  Thread_SalvaApontamentoOperacional = class(TThread)
  private
    { Private declarations }
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
    procedure SetupApontamento;
    procedure SalvaApontamento;
    procedure SetupAusencias;
    procedure SalvaAusencias;
  end;

implementation

{
  Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure Thread_SalvaApontamentoOperacional.UpdateCaption;
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

uses View.ApontamentoOperacional, View.ResultatoProcesso, uGlobais;

{ Thread_SalvaApontamentoOperacional }

procedure Thread_SalvaApontamentoOperacional.IniciaProcesso;
begin
  view_ApontamentoOperacional.pbApontamento.Visible := True;
  view_ApontamentoOperacional.dsApontamento.Enabled := False;
  view_ApontamentoOperacional.tbApontamento.IsLoading := True;
  view_ApontamentoOperacional.pbApontamento.Position := 0;
  view_ApontamentoOperacional.pbApontamento.Refresh;
end;

procedure Thread_SalvaApontamentoOperacional.Execute;
begin
  { Place thread code here }
  SalvaApontamento;
  SalvaAusencias
end;

procedure Thread_SalvaApontamentoOperacional.AtualizaProcesso;
begin
  view_ApontamentoOperacional.pbApontamento.Position := FdPos;
  view_ApontamentoOperacional.pbApontamento.Properties.Text := FormatFloat('0.00%',FdPos);
  view_ApontamentoOperacional.pbApontamento.Refresh;
end;

procedure Thread_SalvaApontamentoOperacional.TerminaProcesso;
begin
  view_ApontamentoOperacional.pbApontamento.Position := 0;
  view_ApontamentoOperacional.pbApontamento.Properties.Text := '';
  view_ApontamentoOperacional.pbApontamento.Refresh;
  view_ApontamentoOperacional.edtData.Text := '';
  view_ApontamentoOperacional.edtTipo.ItemIndex := 0;
  view_ApontamentoOperacional.tbApontamento.IsLoading := False;
  view_ApontamentoOperacional.dsApontamento.Enabled := True;
  view_ApontamentoOperacional.pbApontamento.Visible := False;
end;

procedure Thread_SalvaApontamentoOperacional.SetupApontamento;
var
  lLog : TStringList;
begin
  lLog := TStringList.Create();
  apontamento.ID := view_ApontamentoOperacional.tbApontamentoID_OPERACAO.AsInteger;
  apontamento.Entregador := view_ApontamentoOperacional.tbApontamentoCOD_ENTREGADOR.AsInteger;
  apontamento.RoteiroAntigo := view_ApontamentoOperacional.tbApontamentoCOD_ROTEIRO_ANTIGO.AsString;
  apontamento.Data := view_ApontamentoOperacional.tbApontamentoDAT_OPERACAO.AsDateTime;
  apontamento.StatusOperacao := view_ApontamentoOperacional.tbApontamentoCOD_STATUS_OPERACAO.AsString;
  apontamento.RoteiroNovo := view_ApontamentoOperacional.tbApontamentoCOD_ROTEIRO_NOVO.AsString;
  apontamento.Obs:= view_ApontamentoOperacional.tbApontamentoDES_OBSERVACOES.AsString;
  apontamento.Planilha := view_ApontamentoOperacional.tbApontamentoDOM_PLANILHA.AsString;
  apontamento.IDReferencia := view_ApontamentoOperacional.tbApontamentoID_REFERENCIA.AsInteger;
  apontamento.DataReferencia := view_ApontamentoOperacional.tbApontamentoDAT_REFERENCIA.AsDateTime;
  lLog.Text := view_ApontamentoOperacional.tbApontamentoDES_LOG.AsString;
  if apontamento.ID = 0 then
  begin
    lLog.Add('> ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' inserido ' + uGlobais.sUsuario);
  end
  else
  begin
    lLog.Add('> ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' alterado ' + uGlobais.sUsuario);
  end;
  apontamento.Log := lLog.Text;
end;

procedure Thread_SalvaApontamentoOperacional.SalvaApontamento;
var
  apontamento : TApontamentoOperacional;
  iTotal : Integer;
  iPos : Integer;
  sMensagem: String;
begin
  { Place thread code here }
  try
    Synchronize(IniciaProcesso);
    if not Assigned(view_ResultadoProcesso) then
    begin
      view_ResultadoProcesso := Tview_ResultadoProcesso.Create(Application);
    end;
    view_ResultadoProcesso.Show;
    Screen.Cursor := crHourGlass;
    apontamento := TApontamentoOperacional.Create();
    apontamentoDAO := TApontamentoOperacionalDAO.Create();
    while not view_ApontamentoOperacional.tbApontamento.Eof do
    begin
      sMensagem := '';
      SetupApontamento;
      if apontamento.ID = 0 then
      begin
        if not apontamentoDAO.Insert(apontamento) then
        begin
          sMensagem := 'Erro ao incluir o apontamento do roteiro ' + apontamento.RoteiroAntigo + ' !';
        end;
      end
      else
      begin
        if not apontamentoDAO.Update(apontamento) then
        begin
          sMensagem := 'Erro ao alterar o apontamento do roteiro ' + apontamento.RoteiroAntigo + ' !';
        end;
      end;
      if not sMensagem.IsEmpty then
      begin
        view_ResultadoProcesso.edtResultado.Lines.Add(sMensagem);
        view_ResultadoProcesso.edtResultado.Refresh;
      end;
      view_ApontamentoOperacional.tbApontamento.Next;
      iPos := iPos + 1;
      FdPos := (iPos / iTotal) * 100;
      Synchronize(AtualizaProcesso);
    end;
  finally
    view_ApontamentoOperacional.tbApontamento.Close;
    view_ApontamentoOperacional.tbApontamento.Open;
    Synchronize(TerminaProcesso);
    Screen.Cursor := crDefault;
    apontamentoDAO.Free;
  end;
end;

procedure Thread_SalvaApontamentoOperacional.SetupAusencias;
var
  lLog : TStringList;
begin
  lLog := TStringList.Create();
  ausencia.ID := view_ApontamentoOperacional.tbAusenciasID_AUSENCIA.AsInteger;
  ausencia.Data := view_ApontamentoOperacional.tbAusenciasDAT_OPERACAO.AsDateTime;
  ausencia.Cadastro := view_ApontamentoOperacional.tbAusenciasCOD_CADASTRO.AsInteger;
  ausencia.StatusOperacao := view_ApontamentoOperacional.tbAusenciasCOD_STATUS_OPERACAO.AsString;
  ausencia.Obs:= view_ApontamentoOperacional.tbAusenciasDES_OBSERVACOES.AsString;
  ausencia.IDReferencia := view_ApontamentoOperacional.tbAusenciasID_REFERENCIA.AsInteger;
  lLog.Text := view_ApontamentoOperacional.tbAusenciasDES_LOG.AsString;
  if ausencia.ID = 0 then
  begin
    lLog.Add('> ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' inserido ' + uGlobais.sUsuario);
  end
  else
  begin
    lLog.Add('> ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' alterado ' + uGlobais.sUsuario);
  end;
  ausencia.Log := lLog.Text;
end;

procedure Thread_SalvaApontamentoOperacional.SalvaAusencias;
var
  ausencia : TRHOperacionalAusencias;
  iTotal : Integer;
  iPos : Integer;
  sMensagem: String;
begin
  try
    Synchronize(IniciaProcesso);
    if not Assigned(view_ResultadoProcesso) then
    begin
      view_ResultadoProcesso := Tview_ResultadoProcesso.Create(Application);
      view_ResultadoProcesso.Show;
    end;
    Screen.Cursor := crHourGlass;
    ausencia := TRHOperacionalAusencias.Create();
    ausenciaDAO := TRHOperacionalAusenciasDAO.Create();
    while not view_ApontamentoOperacional.tbAusencias.Eof do
    begin
      SetupAusencias;
      if ausencia.ID = 0 then
      begin
        if not ausenciaDAO.Insert(ausencia) then
        begin
          sMensagem := 'Erro ao incluir a ausencia do entregador ' + view_ApontamentoOperacional.tbAusenciasCOD_CADASTRO.asString + ' !';
        end;
      end
      else
      begin
        if not ausenciaDAO.Update(ausencia) then
        begin
          sMensagem := 'Erro ao alterar a ausencia do entregador ' + view_ApontamentoOperacional.tbAusenciasCOD_CADASTRO.asString + ' !';
        end;
      end;
      view_ApontamentoOperacional.tbAusencias.Next;
      iPos := iPos + 1;
      FdPos := (iPos / iTotal) * 100;
      Synchronize(AtualizaProcesso);
    end;
  finally
    view_ApontamentoOperacional.tbAusencias.Close;
    view_ApontamentoOperacional.tbAusencias.Open;
    Synchronize(TerminaProcesso);
    Screen.Cursor := crDefault;
    ausenciaDAO.Free;
  end;
end;

end.
