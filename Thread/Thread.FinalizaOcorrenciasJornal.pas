unit Thread.FinalizaOcorrenciasJornal;

interface

uses
  System.Classes, System.Generics.Collections, System.SysUtils, Model.OcorrenciasJornal, DAO.OcorrenciasJornal, Vcl.Forms,
  System.UITypes;

type
  Thread_FinalizaOcorrenciasJornal = class(TThread)
  private
    { Private declarations }
    FdPos: Double;
    FTexto: String;
    ocorrencia : TOcorrenciasJornal;
    ocorrencias : TObjectList<TOcorrenciasJornal>;
    ocorrenciaDAO : TOcorrenciasJornalDAO;
  protected
    procedure Execute; override;
    procedure IniciaProcesso;
    procedure AtualizaProcesso;
    procedure TerminaProcesso;
    procedure SetupClass;
  end;

implementation

{ 
  Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);  

  and UpdateCaption could look like,

    procedure Thread_FinalizaOcorrenciasJornal.UpdateCaption;
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

uses View.OcorrenciasJornal, View.ResultatoProcesso;

{ Thread_FinalizaOcorrenciasJornal }

procedure Thread_FinalizaOcorrenciasJornal.IniciaProcesso;
begin
  view_OcorrenciasJornal.pbOcorrencias.Visible := True;
  view_OcorrenciasJornal.ds.Enabled := False;
  view_OcorrenciasJornal.tbPlanilha.IsLoading := True;
  view_OcorrenciasJornal.pbOcorrencias.Position := 0;
  view_OcorrenciasJornal.pbOcorrencias.Refresh;
end;

procedure Thread_FinalizaOcorrenciasJornal.Execute;
var
  ocorrenciaTMP: TOcorrenciasJornal;
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
    ocorrenciaDAO := TOcorrenciasJornalDAO.Create();
    iTotal := view_OcorrenciasJornal.tbPlanilha.RecordCount;
    iPos := 0;
    FdPos := 0;
    if not view_OcorrenciasJornal.tbPlanilha.IsEmpty then view_OcorrenciasJornal.tbPlanilha.First;
    while not view_OcorrenciasJornal.tbPlanilha.Eof do
    begin
      sMensagem := '';
      if view_OcorrenciasJornal.tbPlanilhaDOM_FINALIZAR.Value then
      begin
        if view_OcorrenciasJornal.tbPlanilhaDOM_PROCESSADO.AsString = 'S' then
        begin
          SetupClass;
          ocorrencia.Status := 3;
          if ocorrenciaDAO.Exist(ocorrencia.CodigoAssinstura, ocorrencia.Produto, ocorrencia.Roteiro,
                                 ocorrencia.CodigoOcorrencia, ocorrencia.Entregador, ocorrencia.DataOcorrencia) then
          begin
            if not ocorrenciaDAO.Update(ocorrencia) then
            begin
              sMensagem := 'Erro ao alterar a ocorrência! Nº ' + view_OcorrenciasJornal.tbPlanilhaNUM_OCORRENCIA.AsString;
            end
            else
            begin
              view_OcorrenciasJornal.tbPlanilha.Edit;
              view_OcorrenciasJornal.tbPlanilhaDOM_GRAVAR.AsString := 'N';
              view_OcorrenciasJornal.tbPlanilhaDOM_FINALIZAR.AsString := 'N';
              view_OcorrenciasJornal.tbPlanilha.Post;
            end;
          end
          else
          begin
            if not ocorrenciaDAO.Insert(ocorrencia) then
            begin
              sMensagem := 'Erro ao incluir a ocorrência! Assinatura Nº ' + view_OcorrenciasJornal.tbPlanilhaCOD_ASSINATURA.AsString
                           + ' Data: ' + view_OcorrenciasJornal.tbPlanilhaDAT_OCORRENCIA.AsString;
            end
            else
            begin
              view_OcorrenciasJornal.tbPlanilha.Edit;
              view_OcorrenciasJornal.tbPlanilhaNUM_OCORRENCIA.AsInteger := ocorrencia.Numero;
              view_OcorrenciasJornal.tbPlanilhaDOM_GRAVAR.AsString := 'N';
              view_OcorrenciasJornal.tbPlanilhaDOM_FINALIZAR.AsString := 'N';
              view_OcorrenciasJornal.tbPlanilha.Post;
            end;
          end;
        end
        else
        begin
          sMensagem := 'Ocorrência da Assinatura Nº ' + view_OcorrenciasJornal.tbPlanilhaCOD_ASSINATURA.AsString +
                       ' Data da Ocorrência: ' + view_OcorrenciasJornal.tbPlanilhaDAT_OCORRENCIA.AsString + ' não foi processada!';
        end;
      end;
      if not sMensagem.IsEmpty then
      begin
        view_ResultadoProcesso.edtResultado.Lines.Add(sMensagem);
        view_ResultadoProcesso.edtResultado.Refresh;
      end;
      view_OcorrenciasJornal.tbPlanilha.Next;
      iPos := iPos + 1;
      FdPos := (iPos / iTotal) * 100;
      Synchronize(AtualizaProcesso);
    end;
  finally
    Synchronize(TerminaProcesso);
    Screen.Cursor := crDefault;
    ocorrenciaDAO.Free;
  end;
end;

procedure Thread_FinalizaOcorrenciasJornal.AtualizaProcesso;
begin
  view_OcorrenciasJornal.pbOcorrencias.Position := FdPos;
  view_OcorrenciasJornal.pbOcorrencias.Properties.Text := FormatFloat('0.00%',FdPos);
  view_OcorrenciasJornal.pbOcorrencias.Refresh;
end;

procedure Thread_FinalizaOcorrenciasJornal.TerminaProcesso;
begin
  view_OcorrenciasJornal.pbOcorrencias.Position := 0;
  view_OcorrenciasJornal.pbOcorrencias.Properties.Text := '';
  view_OcorrenciasJornal.pbOcorrencias.Refresh;
  view_OcorrenciasJornal.tbPlanilha.IsLoading := False;
  view_OcorrenciasJornal.ds.Enabled := True;
  view_OcorrenciasJornal.pbOcorrencias.Visible := False;
end;

procedure Thread_FinalizaOcorrenciasJornal.SetupClass;
begin
  ocorrencia.Numero := view_OcorrenciasJornal.tbPlanilhaNUM_OCORRENCIA.AsInteger;
  ocorrencia.DataOcorrencia := view_OcorrenciasJornal.tbPlanilhaDAT_OCORRENCIA.AsDateTime;
  ocorrencia.CodigoAssinstura := view_OcorrenciasJornal.tbPlanilhaCOD_ASSINATURA.AsString;
  ocorrencia.Nome := view_OcorrenciasJornal.tbPlanilhaNOM_ASSINANTE.AsString;
  ocorrencia.Roteiro := view_OcorrenciasJornal.tbPlanilhaDES_ROTEIRO.AsString;
  ocorrencia.Entregador := view_OcorrenciasJornal.tbPlanilhaCOD_ENTREGADOR.AsInteger;
  ocorrencia.Produto := view_OcorrenciasJornal.tbPlanilhaCOD_PRODUTO.AsString;
  ocorrencia.CodigoOcorrencia := view_OcorrenciasJornal.tbPlanilhaCOD_OCORRENCIA.AsInteger;
  ocorrencia.Reincidente := view_OcorrenciasJornal.tbPlanilhaDOM_REINCIDENTE.AsString;
  ocorrencia.Descricao := view_OcorrenciasJornal.tbPlanilhaDES_DESCRICAO.AsString;
  ocorrencia.Endereco := view_OcorrenciasJornal.tbPlanilhaDES_ENDERECO.AsString;
  ocorrencia.Retorno := view_OcorrenciasJornal.tbPlanilhaDES_RETORNO.AsString;
  ocorrencia.Resultado := view_OcorrenciasJornal.tbPlanilhaCOD_RESULTADO.AsInteger;
  ocorrencia.Origem := view_OcorrenciasJornal.tbPlanilhaCOD_ORIGEM.AsInteger;
  ocorrencia.Obs := view_OcorrenciasJornal.tbPlanilhaDES_OBS.AsString;
  ocorrencia.Status := view_OcorrenciasJornal.tbPlanilhaCOD_STATUS.AsInteger;
  ocorrencia.Apuracao := view_OcorrenciasJornal.tbPlanilhaDES_APURACAO.AsString;
  ocorrencia.Qtde := view_OcorrenciasJornal.tbPlanilhaQTD_OCORRENCIAS.AsInteger;
  ocorrencia.Valor := view_OcorrenciasJornal.tbPlanilhaVAL_OCORRENCIA.AsFloat;
  ocorrencia.Impressao := view_OcorrenciasJornal.tbPlanilhaDOM_IMPRESSAO.AsString;
  ocorrencia.Anexo := view_OcorrenciasJornal.tbPlanilhaDES_ANEXO.AsString;
  ocorrencia.Log := view_OcorrenciasJornal.tbPlanilhaDES_LOG.AsString;
end;


end.
