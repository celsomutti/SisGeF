unit Thread.PopulaOcorrenciasJornal;

interface

uses
  System.Classes, System.Generics.Collections, System.SysUtils, Model.OcorrenciasJornal, DAO.OcorrenciasJornal, Vcl.Forms,
  System.UITypes;

type
  TThread_PopulaOcorrenciasJornal = class(TThread)
  private
    { Private declarations }
    FFiltro: String;
    FData1: TDate;
    FData2: TDate;
    FOpcao: Integer;
    FdPos: Double;
    ocorrencia : TOcorrenciasJornal;
    ocorrencias : TObjectList<TOcorrenciasJornal>;
    ocorrenciaDAO : TOcorrenciasJornalDAO;
  protected
    procedure Execute; override;
    procedure IniciaProcesso;
    procedure AtualizaProcesso;
    procedure TerminaProcesso;
  public
    property Filtro: String read FFiltro write FFiltro;
    property Opcao: Integer read FOpcao write FOpcao;
    property Data1: TDate read FData1 write FData1;
    property Data2: TDate read FData2 write FData2;
  end;

implementation

{
  Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure TThread_PopulaOcorrencias.UpdateCaption;
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

uses View.OcorrenciasJornal;



{ TThread_PopulaOcorrencias }

procedure TThread_PopulaOcorrenciasJornal.Execute;
var
  ocorrenciaTMP: TOcorrenciasJornal;
  iTotal : Integer;
  iPos : Integer;
begin
  try
    Synchronize(IniciaProcesso);
    Screen.Cursor := crHourGlass;
    ocorrenciaDAO := TOcorrenciasJornalDAO.Create();
    case Self.Opcao of
      0 : ocorrencias := ocorrenciaDAO.FindByStatus(StrToIntDef(Self.Filtro,0));
      1 : ocorrencias := ocorrenciaDAO.FindByNumero(StrToIntDef(Self.Filtro,0));
      2 : ocorrencias := ocorrenciaDAO.FindByPeriodo(FormatDateTime('yyyy-mm-dd',Self.Data1),
                                                     FormatDateTime('yyyy-mm-dd',Self.Data2), StrToIntDef(Self.Filtro,0));
      3 : ocorrencias := ocorrenciaDAO.FindByAssinatura(Self.Filtro);
      4 : ocorrencias := ocorrenciaDAO.FindByNome(Self.Filtro);
      5 : ocorrencias := ocorrenciaDAO.FindByRoteiro(Self.Filtro);
      6 : ocorrencias := ocorrenciaDAO.FindByProduto(Copy(Self.Filtro,0,Pos('-',Self.Filtro) - 1));
      7 : ocorrencias := ocorrenciaDAO.FindByTipo(StrToIntDef(Copy(Self.Filtro,0,Pos('-',Self.Filtro) - 1), 0));
      8 : ocorrencias := ocorrenciaDAO.FindByEndereco(Self.Filtro);
    end;
    iTotal := ocorrencias.Count;
    iPos := 0;
    if view_OcorrenciasJornal.tbPlanilha.Active then view_OcorrenciasJornal.tbPlanilha.Close;
    view_OcorrenciasJornal.tbPlanilha.Open;
    for ocorrenciaTMP in ocorrencias do
    begin
      view_OcorrenciasJornal.tbPlanilha.Insert;
      view_OcorrenciasJornal.tbPlanilhaNUM_OCORRENCIA.AsInteger := ocorrenciaTMP.Numero;
      view_OcorrenciasJornal.tbPlanilhaDAT_OCORRENCIA.AsDateTime := ocorrenciaTMP.DataOcorrencia;
      view_OcorrenciasJornal.tbPlanilhaCOD_ASSINATURA.AsString := ocorrenciaTMP.CodigoAssinstura;
      view_OcorrenciasJornal.tbPlanilhaNOM_ASSINANTE.AsString := ocorrenciaTMP.Nome;
      view_OcorrenciasJornal.tbPlanilhaDES_ROTEIRO.AsString := ocorrenciaTMP.Roteiro;
      view_OcorrenciasJornal.tbPlanilhaCOD_ENTREGADOR.AsInteger := ocorrenciaTMP.Entregador;
      view_OcorrenciasJornal.tbPlanilhaCOD_PRODUTO.AsString := ocorrenciaTMP.Produto;
      view_OcorrenciasJornal.tbPlanilhaCOD_OCORRENCIA.AsInteger := ocorrenciaTMP.CodigoOcorrencia;
      view_OcorrenciasJornal.tbPlanilhaDOM_REINCIDENTE.AsString := ocorrenciaTMP.Reincidente;
      view_OcorrenciasJornal.tbPlanilhaDES_DESCRICAO.AsString := ocorrenciaTMP.Descricao;
      view_OcorrenciasJornal.tbPlanilhaDES_ENDERECO.AsString := ocorrenciaTMP.Endereco;
      view_OcorrenciasJornal.tbPlanilhaDES_RETORNO.AsString := ocorrenciaTMP.Retorno;
      view_OcorrenciasJornal.tbPlanilhaCOD_RESULTADO.AsInteger := ocorrenciaTMP.Resultado;
      view_OcorrenciasJornal.tbPlanilhaCOD_ORIGEM.AsInteger := ocorrenciaTMP.Origem;
      view_OcorrenciasJornal.tbPlanilhaDES_OBS.AsString := ocorrenciaTMP.Obs;
      view_OcorrenciasJornal.tbPlanilhaCOD_STATUS.AsInteger := ocorrenciaTMP.Status;
      view_OcorrenciasJornal.tbPlanilhaDES_APURACAO.Text := ocorrenciaTMP.Apuracao;
      view_OcorrenciasJornal.tbPlanilhaDOM_PROCESSADO.AsString := ocorrenciaTMP.Processado;
      view_OcorrenciasJornal.tbPlanilhaQTD_OCORRENCIAS.AsInteger := ocorrenciaTMP.Qtde;
      view_OcorrenciasJornal.tbPlanilhaVAL_OCORRENCIA.AsFloat := ocorrenciaTMP.Valor;
      view_OcorrenciasJornal.tbPlanilhaDAT_DESCONTO.AsDateTime := ocorrenciaTMP.DataDesconto;
      view_OcorrenciasJornal.tbPlanilhaDES_LOG.Text := ocorrenciaTMP.Log;
      view_OcorrenciasJornal.tbPlanilhaDES_CHAVE.AsString := '';
      view_OcorrenciasJornal.tbPlanilhaDOM_FINALIZAR.AsBoolean := False;
      view_OcorrenciasJornal.tbPlanilhaDES_ROTEIRO_NOVO.AsString := '';
      view_OcorrenciasJornal.tbPlanilhaDOM_IMPRESSAO.AsString := ocorrenciaTMP.Impressao;
      view_OcorrenciasJornal.tbPlanilhaDES_ANEXO.AsString := ocorrenciaTMP.Anexo;
      view_OcorrenciasJornal.tbPlanilha.Post;
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

procedure TThread_PopulaOcorrenciasJornal.IniciaProcesso;
begin
  view_OcorrenciasJornal.pbOcorrencias.Visible := True;
  view_OcorrenciasJornal.ds.Enabled := False;
  view_OcorrenciasJornal.tbPlanilha.IsLoading := True;
  view_OcorrenciasJornal.pbOcorrencias.Position := 0;
  view_OcorrenciasJornal.pbOcorrencias.Refresh;
end;

procedure TThread_PopulaOcorrenciasJornal.AtualizaProcesso;
begin
  view_OcorrenciasJornal.pbOcorrencias.Position := FdPos;
  view_OcorrenciasJornal.pbOcorrencias.Properties.Text := FormatFloat('0.00%',FdPos);
  view_OcorrenciasJornal.pbOcorrencias.Refresh;
end;

procedure TThread_PopulaOcorrenciasJornal.TerminaProcesso;
begin
  view_OcorrenciasJornal.pbOcorrencias.Position := 0;
  view_OcorrenciasJornal.pbOcorrencias.Properties.Text := '';
  view_OcorrenciasJornal.pbOcorrencias.Refresh;
  view_OcorrenciasJornal.tbPlanilha.IsLoading := False;
  view_OcorrenciasJornal.ds.Enabled := True;
  view_OcorrenciasJornal.pbOcorrencias.Visible := False;
end;

end.
