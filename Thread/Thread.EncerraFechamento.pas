unit Thread.EncerraFechamento;

interface

uses
  System.Classes, Model.FechamentoExpressas, DAO.FechamentosExpressas, Model.ExtratosExpressas, DAO.ExtratosExpressas, Generics.Collections, Model.ParcelamentoRestricao,
  DAO.ParcelamentoRestricao, Model.ExtraviosMultas, DAO.ExtraviosMultas, clLancamentos, System.SysUtils, Forms, Windows, Global.Parametros, clRestricoes;

type
  Thread_EncerraFechamento = class(TThread)
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
    restricao : TRestricoes;
    FdPos: Double;
    sMensagem : String;
  protected
    procedure IniciaProcesso;
    procedure AtualizaProcesso;
    procedure TerminaProcesso;
    procedure EncerraLancamentos;
    procedure EncerraExtravios;
    procedure EncerraParcelamentos;
    procedure EncerraFechamento;
    Procedure EncerraExtrato;
    procedure Execute; override;
  public
    dtInicio: TDate;
    dtFinal: TDate;
    dtPagamento: TDate;
  end;

implementation

{ 
  Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);  

  and UpdateCaption could look like,

    procedure Thread_EncerraFechamento.UpdateCaption;
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

{ Thread_EncerraFechamento }

uses View.FechamentoExpressas, udm, Common.Utils, uGlobais;

procedure Thread_EncerraFechamento.AtualizaProcesso;
begin
  view_FechamentoExpressas.sbFechamento.Panels[0].Text := sMensagem;
  view_FechamentoExpressas.sbFechamento.Refresh;
  view_FechamentoExpressas.pbFechamento.Position := FdPos;
  view_FechamentoExpressas.pbFechamento.Properties.Text := FormatFloat('0.00%',FdPos);
  view_FechamentoExpressas.pbFechamento.Refresh;
end;

procedure Thread_EncerraFechamento.EncerraExtrato;
var
  extratoTMP : TExtratosExpressas;
  aParam: array of Variant;
  iPos: Integer;
  iTotal: Integer;
  lLog: TStringList;
begin
  try
    iTotal := 0;
    iPos := 0;
    lLog := TStringList.Create;
    sMensagem := 'Encerrando o Extrato em aberto. Aguarde...';
    Synchronize(AtualizaProcesso);
    SetLength(aPAram, 3);
    aParam[0] := dtInicio;
    aParam[1] := dtFinal;
    aParam[2] := 0;
    extratos := TObjectList<TExtratosExpressas>.Create;
    extratoDAO := TExtratosExpressasDAO.Create;
    extratos := extratoDAO.FindExtrato('PERIODO',aParam);
    Finalize(aParam);
    iTotal := extratos.Count;
    for extratoTMP in extratos do
    begin
      extratoTMP.DataPagamento := dtPagamento;
      extratoTMP.Fechado := 1;
      lLog.Text := extratoTMP.Log;
      lLog.Add(FormatDateTime('yyyy/mm/dd h:mm:ss', Now()) + ' encerrado por ' + Global.Parametros.pUser_Name);
      extratoTMP.Log := lLog.Text;
      lLog.Clear;
      if not extratoDAO.Update(extratoTMP) then
      begin
        Application.MessageBox(PChar('Erro ao fechar o extrato número ' + extratoTMP.Id.ToString + ' !'), 'Atenção', MB_OK + MB_ICONERROR);
      end;
      iPos := iPos + 1;
      FdPos := (iPos / iTotal) * 100;
      Synchronize(AtualizaProcesso);
    end;
  finally
    EXTRATOdao.Free;
  end;
end;


procedure Thread_EncerraFechamento.EncerraExtravios;
var
  extratoTMP : TExtratosExpressas;
  extravioTMP : TExtraviosMultas;
  aParam: array of Variant;
  iPos: Integer;
  iTotal: Integer;
  sObs: String;
begin
  try
    iTotal := 0;
    iPos := 0;
    sMensagem := 'Encerrando os Extravios. Aguarde...';
    Synchronize(AtualizaProcesso);
    SetLength(aPAram, 3);
    aParam[0] := dtInicio;
    aParam[1] := dtFinal;
    aParam[2] := 0;
    extravios := TObjectList<TExtraviosMultas>.Create;
    extravioDAO := TExtraviosMultasDAO.Create;
    extratos := TObjectList<TExtratosExpressas>.Create;
    extratoDAO := TExtratosExpressasDAO.Create;
    extratos := extratoDAO.FindExtrato('PERIODO', aParam);
    Finalize(aParam);
    iTotal := extratos.Count;
    for extratoTMP in extratos do
    begin
      SetLength(aParam,1);
      aParam[0] := extratoTMP.Id;
      extravios := extravioDAO.FindExtravio('EXTRATO', aParam);
      sObs := '';
      for extravioTMP in extravios do
      begin
        extravioTMP.Percentual := 100;
        extravioTMP.Manutencao := Now();
        extravioTMP.Executor := Global.Parametros.pUser_Name;
        sObs := extravioTMP.Obs;
        sObs := sObs + #13 + 'Extravio encerrado em ' + FormatDateTime('yyyy/mm/dd hh:mm:ss', Now()) + ' por ' + Global.Parametros.pUser_Name;
        extravioTMP.Obs := sObs;
        if not extravioDAO.Update(extravioTMP) then
        begin
          Application.MessageBox(PChar('Erro ao fechar o extravio NN ' + extravio.NN + ' !'), 'Atenção', MB_OK + MB_ICONERROR);
        end;
        iPos := iPos + 1;
        FdPos := (iPos / iTotal) * 100;
        Synchronize(AtualizaProcesso);
      end;
    end;
  finally
    extratoDAO.Free;
    extravioDAO.Free;
  end;
end;

procedure Thread_EncerraFechamento.EncerraFechamento;
var
  fechamentoTMP: TFechamentoExpressas;
  aParam: array of Variant;
  iPos: Integer;
  iTotal: Integer;
  lLog: TStringList;
begin
  try
    iTotal := 0;
    iPos := 0;
    lLog := TStringList.Create;
    sMensagem := 'Encerrando o Fechamento em aberto. Aguarde...';
    Synchronize(AtualizaProcesso);
    SetLength(aPAram, 3);
    aParam[0] := dtInicio;
    aParam[1] := dtFinal;
    aParam[2] := 0;
    fechamentos := TObjectList<TFechamentoExpressas>.Create;
    fechamentoDAO := TFechamentoExpressasDAO.Create;
    SetLength(aParam,3);
    aParam[0] := dtInicio;
    aParam[1] := dtFinal;
    aParam[2] := 0;
    fechamentos := fechamentoDAO.FindFechamento('PERIODO', aParam);
    Finalize(aParam);
    iTotal := fechamentos.Count;
    for fechamentoTMP in fechamentos do
    begin
      fechamentoTMP.Fechado := 1;
      lLog.Text := fechamentoTMP.Log;
      lLog.Add(FormatDateTime('yyyy-mm-dd hh:mm:ss', Now()) + ' encerrado por ' + Global.Parametros.pUser_Name);
      fechamentoTMP.Log := lLog.Text;
      lLog.Clear;
      if not fechamentoDAO.Update(fechamentoTMP) then
      begin
        Application.MessageBox(PChar('Erro ao encerrar o fechamento número ' + fechamentoTMP.Id.ToString + ' !'), 'Atenção', MB_OK + MB_ICONERROR);
      end;
      iPos := iPos + 1;
      FdPos := (iPos / iTotal) * 100;
      Synchronize(AtualizaProcesso);
    end;
  finally
    Finalize(aParam);
    fechamentoDAO.Free;
  end;
end;

procedure Thread_EncerraFechamento.EncerraLancamentos;
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
    sMensagem := 'Encerrando os Lancaçamentos de Créditos e Débitos. Aguarde...';
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
      if lancamentos.getObject(extratoTMP.Id.ToString, 'EXTRATO') then
      begin
        if lancamentos.Persistir <> 'S' then
        begin
          lancamentos.Descontado := 'S';
          lancamentos.Desconto := dtPagamento;
          dm.qryGetObject.Close;
          dm.qryGetObject.SQL.Clear;
          if not lancamentos.Update()  then
          begin
            Application.MessageBox(PChar('Erro ao encerrar o lançamento número ' + lancamentos.Codigo.ToString + '!'), 'Erro', MB_OK + MB_ICONERROR);
          end;
        end;
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

procedure Thread_EncerraFechamento.EncerraParcelamentos;
var
  extratoTMP : TExtratosExpressas;
  parcelaTMP : TParcelamentoRestricao;
  aParam: array of Variant;
  iPos: Integer;
  iTotal: Integer;
  sFiltro : String;
  dValor : Double;
begin
  try
    iTotal := 0;
    iPos := 0;
    sFiltro := '';
    restricao := TRestricoes.Create;
    sMensagem := 'Encerrando os Parcelamentos de Restrição. Aguarde...';
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
      dValor := 0;
      sFiltro := 'WHERE ID_EXTRATO = ' + extratoTMP.Id.ToString + ' AND DOM_DEBITADO = 0';
      SetLength(aParam,1);
      aParam[0] := sFiltro;
      parcelas := parcelaDAO.FindParcelamentos('FILTRO', aParam);
      Finalize(aParam);
      for parcelaTMP in parcelas do
      begin
        parcelaTMP.Debitado := 1;
        if not parcelaDAO.Update(parcelaTMP)  then
        begin
          Application.MessageBox(PChar('Erro ao desvincular o parcelamento do extrato número '+  extratoTMP.Id.ToString + '!'), 'Erro', MB_OK + MB_ICONERROR);
        end;
        if restricao.getObject(parcelaTMP.Restricao.ToString, 'CODIGO') then
        begin
          dValor := dm.QryGetObject.FieldByName('VAL_RESTRICAO').AsFloat;
          dValor := dValor - parcelaTMP.Valor;
          dm.QryGetObject.Edit;
          dm.QryGetObject.FieldByName('VAL_RESTRICAO').AsFloat := dValor;
          dm.QryGetObject.FieldByName('VAL_debitar').AsFloat := dValor;
          dm.QryGetObject.FieldByName('VAL_PAGO').AsFloat := dm.QryGetObject.FieldByName('VAL_PAGO').AsFloat + parcelaTMP.Valor;
          dm.QryGetObject.Post;
          dm.qryGetObject.Close;
          dm.qryGetObject.SQL.Clear;
        end;
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

procedure Thread_EncerraFechamento.Execute;
begin
  { Place thread code here }
  Synchronize(IniciaProcesso);
  Synchronize(EncerraLancamentos);
  Synchronize(EncerraExtravios);
  Synchronize(EncerraParcelamentos);
  Synchronize(EncerraFechamento);
  Synchronize(EncerraExtrato);
  Synchronize(TerminaProcesso);
end;

procedure Thread_EncerraFechamento.IniciaProcesso;
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

procedure Thread_EncerraFechamento.TerminaProcesso;
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
