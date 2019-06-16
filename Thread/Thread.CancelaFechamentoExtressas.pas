unit Thread.CancelaFechamentoExtressas;

interface

uses
  System.Classes, Model.FechamentoExpressas, DAO.FechamentosExpressas, Model.ExtratosExpressas, DAO.ExtratosExpressas, Generics.Collections, Model.ParcelamentoRestricao,
  DAO.ParcelamentoRestricao, Model.ExtraviosMultas, DAO.ExtraviosMultas, clLancamentos, System.SysUtils, Forms, Windows;

type
  Thread_CancelaFechamentoExpressas = class(TThread)
  private
    { Private declarations }
    fechamentos : TObjectList<TFechamentoExpressas>;
    fechamentoDAO : TFechamentoExpressasDAO;
    extratos : TObjectList<TExtratosExpressas>;
    extratoTMP : TExtratosExpressasDAO;
    parcelas : TObjectList<TParcelamentoRestricao>;
    parcelaTMP : TParcelamentoRestricaoDAO;
    extravios : TObjectList<TExtraviosMultas>;
    extravioDAO : TExtraviosMultasDAO;
    lancamentos : TLancamentos;
    FdPos: Double;
    sMensagem : String;
  protected
    procedure IniciaProcesso;
    procedure AtualizaProcesso;
    procedure TerminaProcesso;
    procedure CancelaLancamentos;
    procedure CancelaExtravios;
    procedure CancelaParcelamentos;
    procedure CancelaFechamento;
    Procedure CancelaExtrato;
    procedure Execute; override;
  public
    dtInicio: TDate;
    dtFinal: TDate;
  end;

implementation

{
  Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure Thread_CancelaFechamento.UpdateCaption;
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

uses View.FechamentoExpressas, Common.Utils, uGlobais;

{ Thread_CancelaFechamento }

procedure Thread_CancelaFechamentoExpressas.AtualizaProcesso;
begin
  view_FechamentoExpressas.sbFechamento.Panels[0].Text := sMensagem;
  view_FechamentoExpressas.sbFechamento.Refresh;
  view_FechamentoExpressas.pbFechamento.Position := FdPos;
  view_FechamentoExpressas.pbFechamento.Properties.Text := FormatFloat('0.00%',FdPos);
  view_FechamentoExpressas.pbFechamento.Refresh;
end;

procedure Thread_CancelaFechamentoExpressas.CancelaExtrato;
var
  aParam: array of Variant;
  iPos: Integer;
  iTotal: Integer;
begin
  try
    iTotal := 2;
    iPos := 1;
    sMensagem := 'Excluindo o Extrato em aberto. Aguarde...';
    Synchronize(AtualizaProcesso);
    SetLength(aPAram, 3);
    aParam[0] := dtInicio;
    aParam[1] := dtFinal;
    aParam[2] := 0;
    extratos := TObjectList<TExtratosExpressas>.Create;
    extratoDAO := TExtratosExpressasDAO.Create;
    if not extratoDAO.CancelaExtrato(aParam)  then
    begin
      Application.MessageBox('Erro ao excluir o extrato em aberto!', 'Erro', MB_OK + MB_ICONERROR);
    end;
    Finalize(aParam);
    iPos := 2;
    FdPos := (iPos / iTotal) * 100;
    Synchronize(AtualizaProcesso);
  finally
    extratoDAO.Free;
  end;
end;

procedure Thread_CancelaFechamentoExpressas.CancelaExtravios;
var
  extratoTMP : TExtratosExpressas;
  aParam: array of Variant;
  iPos: Integer;
  iTotal: Integer;
begin
  try
    iTotal := 0;
    iPos := 0;
    sMensagem := 'Desvinculando os Extravios. Aguarde...';
    Synchronize(AtualizaProcesso);
    SetLength(aPAram, 3);
    aParam[0] := dtInicio;
    aParam[1] := dtFinal;
    aParam[2] := 0;
    extravioDAO := TExtraviosMultasDAO.Create;
    extratos := TObjectList<TExtratosExpressas>.Create;
    extratoDAO := TExtratosExpressasDAO.Create;
    extratos := extratoDAO.FindExtrato('PERIODO', aParam);
    Finalize(aParam);
    iTotal := extratos.Count;
    for extratoTMP in extratos do
    begin
      if not extravioDAO.CancelaFechamento(extratoTMP.Id)  then
      begin
        Application.MessageBox(PChar('Erro ao desvincular o extravio do extrato ' + extratoTMP.Id.ToString + ' !'), 'Erro', MB_OK + MB_ICONERROR);
      end;
      iPos := iPos + 1;
      FdPos := (iPos / iTotal) * 100;
      Synchronize(AtualizaProcesso);
    end;
  finally
    extratoDAO.Free;
    extravioDAO.Free;
  end;
end;

procedure Thread_CancelaFechamentoExpressas.CancelaFechamento;
var
  aParam: array of Variant;
  iPos: Integer;
  iTotal: Integer;
begin
  try
    iTotal := 2;
    iPos := 1;
    sMensagem := 'Excluindo o Fechamento em aberto. Aguarde...';
    Synchronize(AtualizaProcesso);
    SetLength(aPAram, 3);
    aParam[0] := dtInicio;
    aParam[1] := dtFinal;
    aParam[2] := 0;
    fechamentoDAO := TFechamentoExpressasDAO.Create;
    if not fechamentoDAO.CancelaFechamento(aParam)  then
    begin
      Application.MessageBox('Erro ao excluir o fechamento número!', 'Erro', MB_OK + MB_ICONERROR);
    end;
    iPos := 2;
    FdPos := (iPos / iTotal) * 100;
    Synchronize(AtualizaProcesso);
  finally
    Finalize(aParam);
    fechamentoDAO.Free;
  end;
end;

procedure Thread_CancelaFechamentoExpressas.CancelaLancamentos;
var
  aParam: array of Variant;
  extratoTMP : TExtratosExpressas;
  iPos: Integer;
  iTotal: Integer;
begin
  try
    lancamentos := TLancamentos.Create;
    iTotal := 0;
    iPos := 0;
    sMensagem := 'Desvinculando os Lancaçamentos de Créditos e Débitos. Aguarde...';
    Synchronize(AtualizaProcesso);
    SetLength(aPAram, 3);
    aParam[0] := dtInicio;
    aParam[1] := dtFinal;
    aParam[2] := 0;
    extratos := TObjectList<TExtratosExpressas>.Create;
    extratoDAO := TExtratosExpressasDAO.Create;
    extratos := extratoDAO.FindExtrato('PERIODO', aParam);
    Finalize(aParam);
    iTotal := extratos.Count;
    for extratoTMP in extratos do
    begin
      if not lancamentos.Fechar(DateToStr(dtInicio),DateToStr(dtFinal),'0',extratoTMP.Id.ToString, '0', 'ABRIR')  then
      begin
        Application.MessageBox(PChar('Erro ao desvincular o lançamento do extrato ' + extratoTMP.Id.ToString + '!'), 'Erro', MB_OK + MB_ICONERROR);
      end;
      iPos := iPos + 1;
      FdPos := (iPos / iTotal) * 100;
      Synchronize(AtualizaProcesso);
    end;
  finally
    lancamentos.Free;
    extratoDAO.Free;
  end;
end;

procedure Thread_CancelaFechamentoExpressas.CancelaParcelamentos;
var
  extratoTMP : TExtratosExpressas;
  parcelaTMP : TParcelamentoRestricao;
  aParam: array of Variant;
  iPos: Integer;
  iTotal: Integer;
begin
  try
    iTotal := 0;
    iPos := 0;
    sMensagem := 'Desvinculando os Parcelamentos de Restrição. Aguarde...';
    Synchronize(AtualizaProcesso);
    SetLength(aPAram, 3);
    aParam[0] := dtInicio;
    aParam[1] := dtFinal;
    aParam[2] := 0;
    parcelas := TObjectList<TParcelamentoRestricao>.Create;
    parcelaDAO := TParcelamentoRestricaoDAO.Create;
    extratos := TObjectList<TExtratosExpressas>.Create;
    extratoDAO := TExtratosExpressasDAO.Create;
    extratos := extratoDAO.FindExtrato('PERIODO', aParam);
    Finalize(aParam);
    iTotal := extratos.Count;
    for extratoTMP in extratos do
    begin
      if not parcelaDAO.CancelaFechamento(extratoTMP.Id)  then
      begin
        Application.MessageBox(PChar('Erro ao desvincular o parcelamento do extrato número '+  extratoTMP.Id.ToString + '!'), 'Erro', MB_OK + MB_ICONERROR);
      end;
      iPos := iPos + 1;
      FdPos := (iPos / iTotal) * 100;
      Synchronize(AtualizaProcesso);
    end;
  finally
    extratoDAO.Free;
    parcelaDAO.Free;
  end;
end;

procedure Thread_CancelaFechamentoExpressas.Execute;
begin
  { Place thread code here }
  Synchronize(IniciaProcesso);
  Synchronize(CancelaLancamentos);
  Synchronize(CancelaExtravios);
  Synchronize(CancelaParcelamentos);
  Synchronize(CancelaFechamento);
  Synchronize(CancelaExtrato);
  Synchronize(TerminaProcesso);
end;

procedure Thread_CancelaFechamentoExpressas.IniciaProcesso;
begin
  view_FechamentoExpressas.actProcessar.Enabled := False;
  view_FechamentoExpressas.actCancelar.Enabled := False;
  view_FechamentoExpressas.actEncerrar.Enabled := False;
  view_FechamentoExpressas.dsFechamento.Enabled := False;
  view_FechamentoExpressas.sbFechamento.Panels[0].Text := '';
  view_FechamentoExpressas.pbFechamento.Visible := True;
  view_FechamentoExpressas.pbFechamento.Position := 0;
  view_FechamentoExpressas.pbFechamento.Refresh;
  view_FechamentoExpressas.sbFechamento.Refresh;
end;

procedure Thread_CancelaFechamentoExpressas.TerminaProcesso;
begin
  sMensagem := '';
  FdPos := 0;
  view_FechamentoExpressas.sbFechamento.Panels[0].Text := '';
  view_FechamentoExpressas.pbFechamento.Position := 0;
  view_FechamentoExpressas.pbFechamento.Refresh;
  view_FechamentoExpressas.pbFechamento.Visible := False;
  view_FechamentoExpressas.sbFechamento.Refresh;
  view_FechamentoExpressas.dsFechamento.Enabled := True;
  view_FechamentoExpressas.actProcessar.Enabled := True;
  view_FechamentoExpressas.actCancelar.Enabled := False;
  view_FechamentoExpressas.actEncerrar.Enabled := False;
  view_FechamentoExpressas.datInicio.Properties.ReadOnly := False;
  view_FechamentoExpressas.datTermino.Properties.ReadOnly := False;
  view_FechamentoExpressas.datInicio.Clear;
  view_FechamentoExpressas.datTermino.Clear;
  view_FechamentoExpressas.mtbFechamento.Close;
  view_FechamentoExpressas.datInicio.SetFocus;
  view_FechamentoExpressas.cxLabel2.Caption := '0';
  Common.Utils.TUtils.GravaIni(uGlobais.sIni,'Common','RaioX','0');
end;

end.
