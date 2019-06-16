unit Thread.ProcessaFechamento;

interface

uses
  System.Classes, Model.ExtratosExpressas, DAO.ExtratosExpressas, Model.FechamentoExpressas, Model.FechamentoLancamento, Model.FechamentoRestricao, DAO.FechamentoLancamento,
  DAO.FechamentoRestricao, DAO.FechamentosExpressas, Model.ParcelamentoRestricao, DAO.ParcelamentoRestricao, Model.ExtraviosMultas, DAO.ExtraviosMultas, clRestricoes,
  Generics.Collections, clLancamentos, Model.DebitosExtravios, DAO.DebitosExtravios, Model.TotalEntregas, DAO.TotalizaEntregas, Forms, Windows, Model.Entregadores, DAO.Entregadores,
  clAgentes, clGruposVerba, Dialogs, clEntregador;

type
  Thread_ProcessaFechamento = class(TThread)
  private
    { Private declarations }
    FdPos: Double;
    extratos : TObjectList<TExtratosExpressas>;
    fechamentos : TObjectList<TFechamentoExpressas>;
    fechalancamentos : TObjectList<TFechamentoLancamento>;
    fecharestricoes : TObjectList<TFechamentoRestricao>;
    parcelas: TObjectList<TParcelamentoRestricao>;
    extravios : TObjectList<TExtraviosMultas>;
    extravioDAO : TExtraviosMultasDAO;
    entregas : TObjectList<TTotalEntregas>;
    debitosextravios: TObjectList<TDebitosExtravios>;
    extrato : TExtratosExpressas;
    entrega : TTotalEntregas;
    fechamento : TFechamentoExpressas;
    fechalancamento : TFechamentoLancamento;
    fecharestricao : TFechamentoRestricao;
    parcela: TParcelamentoRestricao;
    extravio : TExtraviosMultas;
    lancamento : TLancamentos;
    restricao : TRestricoes;
    extratoDAO : TExtratosExpressasDAO;
    entregaDAO: TTotalizaEntregasDAO;
    fechamentoDAO : TFechamentoExpressasDAO;
    fechalancamentoDAO : TFechamentoLancamentoDAO;
    fecharestricaoDAO : TFechamentoRestricaoDAO;
    parcelaDAO: TParcelamentoRestricaoDAO;
    entregadores : TObjectList<TEntregadores>;
    entregador : TEntregadores;
    entregadorDAO : TEntregadoresDAO;
    agente : TAgente;
    verba : TGruposVerba;
    iCodigoExpressa : Integer;
    iTipo: Integer;
    sMensagem: String;
    bFlag: Boolean;
    cadastro : TEntregador;
  public
    dtInicio: TDate;
    dtFinal: TDate;
    bRestricao : Boolean;
    bLancamentos: Boolean;
    bSLA : Boolean;
  protected
    procedure ProcessaExtrato;
    procedure IniciaProcesso;
    procedure AtualizaProcesso;
    procedure TerminaProcesso;
    procedure ProcessaFechamentos;
    procedure ProcessaVerba;
    procedure ProcessaLancamentos;
    procedure ProcessaRestricao;
    procedure ProcessaExtravios;
    procedure TotalizaExtrato;
    procedure PopulaFechamento;
    procedure Execute; override;
  end;

implementation

{
  Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure Thread_TotalizaEntregas.UpdateCaption;
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

{ Thread_TotalizaEntregas }

uses System.SysUtils, FireDAC.Comp.Client, Data.DB, View.FechamentoExpressas, udm, uGlobais, Global.Parametros, Common.Utils;

procedure Thread_ProcessaFechamento.AtualizaProcesso;
begin
  view_FechamentoExpressas.sbFechamento.Panels[0].Text := sMensagem;
  view_FechamentoExpressas.sbFechamento.Refresh;
  view_FechamentoExpressas.pbFechamento.Position := FdPos;
  view_FechamentoExpressas.pbFechamento.Properties.Text := FormatFloat('0.00%',FdPos);
  view_FechamentoExpressas.pbFechamento.Refresh;
end;

procedure Thread_ProcessaFechamento.Execute;
var
    aParam: array of Variant;
begin
  { Place thread code here }
  Synchronize(IniciaProcesso);
  fechamentos := TObjectList<TFechamentoExpressas>.Create;
  fechamentoDAO := TFechamentoExpressasDAO.Create;
  SetLength(aParam,2);
  aParam[0] := dtInicio;
  aParam[1] := dtFinal;
  fechamentos := fechamentoDAO.FindFechamento('DATAS', aParam) ;
  Finalize(aParam);
  fechamentoDAO.Free;
  bFlag := False;
  if fechamentos.Count > 0 then
  begin
    if fechamentos[0].Fechado = 1 then bFlag := True;
  end;
  if fechamentos.Count = 0 then
  begin
    Synchronize(ProcessaExtrato);
    Synchronize(ProcessaVerba);
    if bLancamentos then Synchronize(ProcessaLancamentos);
    if bRestricao then Synchronize(ProcessaRestricao);
    Synchronize(ProcessaExtravios);
    Synchronize(TotalizaExtrato);
    Synchronize(ProcessaFechamentos);
  end;
  Synchronize(PopulaFechamento);
  Synchronize(TerminaProcesso);
end;

procedure Thread_ProcessaFechamento.IniciaProcesso;
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
  view_FechamentoExpressas.dxActivityIndicator1.Active := True;
end;

procedure Thread_ProcessaFechamento.ProcessaFechamentos;
var
  aParam: array of Variant;
  fechamentoTMP : TFechamentoExpressas;
  extratoTMP: TExtratosExpressas;
  iPos: Integer;
  iTotal : Integer;
  dRestricao: Double;
  sExtratos: String;
begin
  try
    agente := TAgente.Create;
    restricao := TRestricoes.Create;
    fechamentos := TObjectList<TFechamentoExpressas>.Create;
    fechamentoDAO := TFechamentoExpressasDAO.Create;
    entregadores := TObjectList<TEntregadores>.Create;
    entregadorDAO := TEntregadoresDAO.Create;
    extratos := TObjectList<TExtratosExpressas>.Create;
    extratoDAO := TExtratosExpressasDAO.Create;
    FdPos := 0;
    iPos := 0;
    iTotal := 0;
    sMensagem := 'PROCESSANDO O FECHAMENTO. Aguarde ...';
    Synchronize(AtualizaProcesso);
    SetLength(aParam,3);
    aParam[0] := dtInicio;
    aParam[1] := dtFinal;
    aParam[2] := 0;
    extratos := extratoDAO.FindExtrato('PERIODO', aParam);
    Finalize(aParam);
    iTotal := extratos.Count;
    for extratoTMP in extratos do
    begin
      iCodigoExpressa := 0;
      iTipo := 0;
      if agente.getObject(extratoTMP.Agente.ToString,'CODIGO') then
      begin
        if agente.Forma <> 'NENHUMA' then
        begin
          iCodigoExpressa := agente.Codigo.ToInteger();
          iTipo := 1;
        end;
      end;
      if iCodigoExpressa = 0 then
      begin
        iCodigoExpressa := extratoTMP.Entregador;
        iTipo := 2;
      end;
      if iCodigoExpressa = 0 then
      begin
        iCodigoExpressa := 1;
        iTipo := 1;
      end;
      dRestricao := 0;
      if iTipo = 1 then dRestricao := restricao.RetornaTotal(iCodigoExpressa);
      if iTipo = 2 then dRestricao := restricao.RetornaDebito(iCodigoExpressa);
      SetLength(aParam,4);
      aParam[0] := dtInicio;
      aParam[1] := dtFinal;
      aParam[2] := iTipo;
      aParam[3] := iCodigoExpressa;
      fechamentos := fechamentoDAO.FindFechamento('EXTRATO', aParam);
      Finalize(aParam);
      if fechamentos.Count = 0 then
      begin
        fechamento := TFechamentoExpressas.Create;
        fechamento.Id := 0;
        fechamento.Tipo := iTipo;
        fechamento.DataInicio := dtInicio;
        fechamento.DataFinal := dtFinal;
        fechamento.Codigo := iCodigoExpressa;
        fechamento.ValorProducao := extratoTMP.ValorProducao;
        fechamento.VerbaEntregador := extratoTMP.Verba;
        fechamento.TotalVerbaFranquia := extratoTMP.TotalVerbaFranquia;
        fechamento.SaldoRestricao := dRestricao;
        fechamento.ValorResticao := extratoTMP.ValorRestricao;
        fechamento.ValorExtravios := extratoTMP.ValorExtravio;
        fechamento.ValorCreditos := extratoTMP.ValorCreditos;
        fechamento.ValorDebitos := extratoTMP.ValorDebitos;
        fechamento.ValorFinanciado := 0;
        fechamento.TotalDebitos := extratoTMP.ValorTotalDebitos;
        fechamento.TotalCreditos := extratoTMP.ValorCreditos;
        fechamento.TotalGeral := extratoTMP.ValorTotalGeral;
        fechamento.Fechado := 0;
        fechamento.Extratos := extratoTMP.Id.ToString;
        fechamento.TotalEntregas := extratoTMP.Entregas;
        fechamento.PFP := extratoTMP.PFP;
        fechamento.Log := FormatDateTime('yyyy/mm/dd ', Now()) + ' processado por ' + uGlobais.sUsuario;
        if not fechamentoDAO.Insert(fechamento) then
        begin
          Application.MessageBox(PChar('Erro ao criar o fechamento do agente/entregador ' + iCodigoExpressa.ToString + ' !'), 'Atenção', MB_OK + MB_ICONERROR);
        end;
        fechamento.Free;
      end
      else
      begin
        for fechamentoTMP in fechamentos do
        begin
         sExtratos:= '';
         fechamentoTMP.ValorProducao := fechamentoTMP.ValorProducao + extratoTMP.ValorProducao;
         if fechamentotmp.VerbaEntregador < extratoTMP.Verba then fechamentoTMP.VerbaEntregador := extratoTMP.Verba;
         fechamentoTMP.TotalVerbaFranquia := fechamentoTMP.TotalVerbaFranquia + extratoTMP.TotalVerbaFranquia;
         fechamentoTMP.SaldoRestricao := dRestricao;
         fechamentoTMP.ValorResticao := fechamentoTMP.ValorResticao + extratoTMP.ValorRestricao;
         fechamentoTMP.ValorExtravios := fechamentoTMP.ValorExtravios + extratoTMP.ValorExtravio;
         fechamentoTMP.ValorCreditos := fechamentoTMP.ValorCreditos + extratoTMP.ValorCreditos;
         fechamentoTMP.ValorDebitos := fechamentoTMP.ValorDebitos + extratoTMP.ValorDebitos;
         fechamentoTMP.TotalDebitos := fechamentoTMP.TotalDebitos + extratoTMP.ValorTotalDebitos;
         fechamentoTMP.TotalCreditos := fechamentoTMP.TotalCreditos + extratoTMP.ValorTotalCreditos;
         fechamentoTMP.TotalGeral := fechamentoTMP.TotalGeral + extratoTMP.ValorTotalGeral;
         sExtratos := fechamentoTMP.Extratos;
         if sExtratos.IsEmpty then
         begin
           sExtratos := extratoTMP.Id.ToString;
         end
         else
         begin
           sExtratos := sExtratos + ',' + extratoTMP.Id.ToString;
         end;
         fechamentoTMP.Extratos := sExtratos;
         fechamentoTMP.TotalEntregas := fechamentoTMP.TotalEntregas + extratoTMP.Entregas;
         fechamentoTMP.PFP := fechamentoTMP.PFP + extratoTMP.PFP;
         if not fechamentoDAO.Update(fechamentoTMP) then
         begin
            Application.MessageBox(PChar('Erro ao atualizar o fechamento do agente/entregador ' + iCodigoExpressa.ToString + ' !'), 'Atenção', MB_OK + MB_ICONERROR);
         end;
       end;
      end;
      iPos := iPos + 1;
      FdPos := (iPos / iTotal) * 100;
      Synchronize(AtualizaProcesso);
    end;
  finally
    agente.Free;
    restricao.Free;
    fechamentoDAO.Free;
    entregadorDAO.Free;
    extratoDAO.Free;
  end;
end;

procedure Thread_ProcessaFechamento.PopulaFechamento;
var
  aParam: array of Variant;
  fechamentoTMP: TFechamentoExpressas;
  sNome: String;
  iPos: Integer;
  iCadastro: Integer;
begin
  try
    fechamentos := TObjectList<TFechamentoExpressas>.Create;
    fechamentoDAO := TFechamentoExpressasDAO.Create;
    cadastro := TEntregador.Create;
    SetLength(aParam,2);
    aParam[0] := dtInicio;
    aParam[1] := dtFinal;
    fechamentos := fechamentoDAO.FindFechamento('DATAS', aParam);
    Finalize(aParam);
    agente := TAgente.Create;
    entregadores := TObjectList<TEntregadores>.Create;
    entregadorDAO := TEntregadoresDAO.Create;
    FdPos := 0;
    iPos := 0;
    sMensagem := 'POPULANDO O FECHAMENTO. Aguarde ...';
    Synchronize(AtualizaProcesso);
    iTotal := fechamentos.Count;
    view_FechamentoExpressas.mtbFechamento.IsLoading := True;
    view_FechamentoExpressas.mtbFechamento.Close;
    view_FechamentoExpressas.mtbFechamento.Open;
    iCadastro := 0;
    for fechamentoTMP in fechamentos do
    begin
      view_FechamentoExpressas.mtbFechamento.Insert;
      view_FechamentoExpressas.mtbFechamentoID_FECHAMENTO.AsInteger := fechamentoTMP.Id;
      view_FechamentoExpressas.mtbFechamentoDAT_INICIO.AsDateTime :=fechamentoTMP.DataInicio;
      view_FechamentoExpressas.mtbFechamentoDAT_FINAL.AsDateTime := fechamentoTMP.DataFinal;
      view_FechamentoExpressas.mtbFechamentoCOD_TIPO.AsInteger := fechamentoTMP.Tipo;
      view_FechamentoExpressas.mtbFechamentoCOD_EXPRESSA.AsInteger := fechamentoTMP.Codigo;
      view_FechamentoExpressas.mtbFechamentoVAL_SALDO_RESTRICAO.AsFloat := fechamentoTMP.SaldoRestricao;
      view_FechamentoExpressas.mtbFechamentoVAL_RESTRICAO.AsFloat := fechamentoTMP.ValorResticao;
      view_FechamentoExpressas.mtbFechamentoVAL_VERBA_ENTREGADOR.AsFloat := fechamentoTMP.VerbaEntregador;
      view_FechamentoExpressas.mtbFechamentoTOT_VERBA_FRANQUIA.AsFloat := fechamentoTMP.TotalVerbaFranquia;
      view_FechamentoExpressas.mtbFechamentoVAL_EXTRAVIOS.AsFloat := fechamentoTMP.ValorExtravios;
      view_FechamentoExpressas.mtbFechamentoVAL_CREDITOS.AsFloat := fechamentoTMP.ValorCreditos;
      view_FechamentoExpressas.mtbFechamentoVAL_DEBITOS.AsFloat := fechamentoTMP.ValorDebitos;
      view_FechamentoExpressas.mtbFechamentoVAL_FINANCIADO.AsFloat := fechamentoTMP.ValorFinanciado;
      view_FechamentoExpressas.mtbFechamentoVAL_TOTAL_DEBITOS.AsFloat := fechamentoTMP.ValorResticao + fechamentoTMP.ValorExtravios + fechamentoTMP.ValorDebitos;
      view_FechamentoExpressas.mtbFechamentoVAL_TOTAL_CREDITOS.AsFloat := fechamentoTMP.ValorProducao + fechamentoTMP.ValorCreditos;
      view_FechamentoExpressas.mtbFechamentoVAL_TOTAL_GERAL.AsFloat := fechamentoTMP.ValorProducao + fechamentoTMP.ValorCreditos + fechamentoTMP.ValorResticao +
                                                                       fechamentoTMP.ValorExtravios + fechamentoTMP.ValorDebitos;
      view_FechamentoExpressas.mtbFechamentoDES_LOG.AsString := fechamentoTMP.Log;
      view_FechamentoExpressas.mtbFechamentoDES_EXTRATOS.AsString := fechamentoTMP.Extratos;
      view_FechamentoExpressas.mtbFechamentoVAL_PRODUCAO.AsFloat := fechamentoTMP.ValorProducao;
      view_FechamentoExpressas.mtbFechamentoQTD_PFP.AsInteger := fechamentoTMP.PFP;
      view_FechamentoExpressas.mtbFechamentoNOM_FAVORECIDO.asString := fechamentoTMP.Favorecido;
      view_FechamentoExpressas.mtbFechamentoNUM_CPF_CNPJ.AsString := fechamentoTMP.CPFCNPJ;
      view_FechamentoExpressas.mtbFechamentoCOD_BANCO.AsInteger := fechamentoTMP.Banco;
      view_FechamentoExpressas.mtbFechamentoCOD_AGENCIA.AsString := fechamentoTMP.Agencia;
      view_FechamentoExpressas.mtbFechamentoDES_TIPO_CONTA.AsString := fechamentoTMP.TipoConta;
      view_FechamentoExpressas.mtbFechamentoNUM_CONTA.AsString := fechamentoTMP.Conta;

      if fechamentoTMP.Tipo = 1 then
      begin
        if agente.getObject(fechamentoTMP.Codigo.ToString,'CODIGO') then
        begin
          view_FechamentoExpressas.mtbFechamentoNOM_EXPRESSA.AsString := agente.Fantasia;
          if view_FechamentoExpressas.mtbFechamentoNUM_CONTA.AsString.IsEmpty then
          begin
            view_FechamentoExpressas.mtbFechamentoNOM_FAVORECIDO.asString := agente.Favorecido;
            view_FechamentoExpressas.mtbFechamentoNUM_CPF_CNPJ.AsString := agente.CpfCnpjFavorecido;
            view_FechamentoExpressas.mtbFechamentoCOD_BANCO.AsInteger := StrToIntDef(Agente.Banco, 0);
            view_FechamentoExpressas.mtbFechamentoCOD_AGENCIA.AsString := agente.Agencia;
            view_FechamentoExpressas.mtbFechamentoDES_TIPO_CONTA.AsString := agente.TipoConta;
            view_FechamentoExpressas.mtbFechamentoNUM_CONTA.AsString := agente.NumeroConta;
          end;
        end;
      end
      else
      begin
        SetLength(aParam,1);
        aParam[0] := fechamentoTMP.Codigo;
        entregadores := entregadorDAO.FindEntregador('ENTREGADOR', aParam);
        Finalize(aParam);
        if entregadores.Count > 0 then
        begin
          view_FechamentoExpressas.mtbFechamentoNOM_EXPRESSA.AsString := entregadores[0].Fantasia;
          iCadastro := entregadores[0].Cadastro;
        end
        else
        begin
          view_FechamentoExpressas.mtbFechamentoNOM_EXPRESSA.AsString := 'NONE';
          iCadastro := 0;
        end;
        if view_FechamentoExpressas.mtbFechamentoNUM_CONTA.AsString.IsEmpty then
        begin
          if iCadastro > 0 then
          begin
            if cadastro.getObject(iCadastro.ToString, 'CADASTRO') then
            begin
              view_FechamentoExpressas.mtbFechamentoNOM_FAVORECIDO.asString := cadastro.Favorecido;
              view_FechamentoExpressas.mtbFechamentoNUM_CPF_CNPJ.AsString := cadastro.CpfCnpjFavorecido;
              view_FechamentoExpressas.mtbFechamentoCOD_BANCO.AsInteger := StrToIntDef(cadastro.Banco, 0);
              view_FechamentoExpressas.mtbFechamentoCOD_AGENCIA.AsString := cadastro.Agencia;
              view_FechamentoExpressas.mtbFechamentoDES_TIPO_CONTA.AsString := cadastro.TipoConta;
              view_FechamentoExpressas.mtbFechamentoNUM_CONTA.AsString := cadastro.NumeroConta;
            end;
          end;
        end;

      end;

      view_FechamentoExpressas.mtbFechamentoTOT_ENTREGAS.AsInteger := fechamentoTMP.TotalEntregas;
      view_FechamentoExpressas.mtbFechamento.Post;
      iPos := iPos + 1;
      FdPos := (iPos / iTotal) * 100;
      Synchronize(AtualizaProcesso);
   end;
  finally
    view_FechamentoExpressas.mtbFechamento.IsLoading := False;
    entregadorDAO.Free;
    agente.Free;
    fechamentoDAO.Free;
    cadastro.Free;
  end;
end;

procedure Thread_ProcessaFechamento.ProcessaExtrato;
var
  aParam: array of Variant;
  entregaTMP : TTotalEntregas;
  iPos : Integer;
  iTotal : Integer;
begin
  try
    entregas := TObjectList<TTotalEntregas>.Create;
    entrega := TTotalEntregas.Create;
    entregaDAO := TTotalizaEntregasDAO.Create;
    extratoDAO := TExtratosExpressasDAO.Create;
    extrato := TExtratosExpressas.Create;
    SetLength(aParam,4);
    aParam[0] := 'S';
    aParam[1] := dtInicio;
    aparam[2] := dtFinal;
    aparam[3] := 'S';
    entregas := entregaDAO.Totaliza(aParam);
    Finalize(aParam);
    FdPos := 0;
    iPos := 0;
    sMensagem := 'PROCESSANDO AS ENTREGAS. Aguarde ...';
    Synchronize(AtualizaProcesso);
    iTotal := entregas.Count;
    for entregaTMP in entregas do
    begin
      extrato.Id := 0;
      extrato.Agente := entregaTMP.Agente;
      extrato.Entregador := entregaTMP.Entregador;
      extrato.DataInicio := dtInicio;
      extrato.DataFinal := dtFinal;
      extrato.DataPagamento := 0;
      extrato.Volumes := entregaTMP.Volumes;
      extrato.Entregas := entregaTMP.Entregas;
      extrato.Atrasos := entregaTMP.Atraso;
      extrato.VolumesExtra := 0;
      extrato.SLA := entregaTMP.SLA;
      extrato.Verba := 0;
      extrato.ValorEntregas := 0;
      extrato.ValorVolumesExtra := 0;
      extrato.ValorProducao := 0;
      extrato.ValorCreditos := 0;
      extrato.ValorDebitos := 0;
      extrato.ValorTotalCreditos := 0;
      extrato.ValorTotalDebitos := 0;
      extrato.ValorTotalGeral := 0;
      extrato.TotalVerbaFranquia := entregaTMP.TotalVerbaFranquia;
      extrato.PFP := entregaTMP.PFP;
      extrato.Log := FormatDateTime('yyyy-mm-dd hh:mm:ss', Now()) + ' processado por ' + uGlobais.sUsuario;
      if not extratoDAO.Insert(extrato) then
      begin
        Application.MessageBox(PChar('Erro ao salvar os totais de entregas no extrato do entregador ' + extrato.Entregador.ToString + ' !'), 'Atenção', MB_OK + MB_ICONERROR);
      end;
      iPos := iPos + 1;
      FdPos := (iPos / iTotal) * 100;
      Synchronize(AtualizaProcesso);
    end;
  finally
    entrega.Free;
    entregaDAO.Free;
    view_FechamentoExpressas.pbFechamento.Position := 0;
    view_FechamentoExpressas.pbFechamento.Refresh;
  end;
end;

procedure Thread_ProcessaFechamento.ProcessaExtravios;
var
  extravioTMP : TExtraviosMultas;
  extratoTMP : TExtratosExpressas;
  iPos: Integer;
  aParam: array of Variant;
  dtDataBase : TDate;
  dValor : Double;
begin
  try
    dtDataBase := Now();
    dValor := 0;
    extravios := TObjectList<TExtraviosMultas>.Create;
    extravioDAO := TExtraviosMultasDAO.Create;
    extratos := TObjectList<TExtratosExpressas>.Create;
    extratoDAO := TExtratosExpressasDAO.Create;
    SetLength(aParam,1);
    aParam[0] := 'WHERE DOM_RESTRICAO = ' + QuotedStr('S') + ' AND VAL_PERCENTUAL_PAGO < 100';
    extravios := extravioDAO.FindExtravio('FILTRO', aParam);
    Finalize(aParam);
    iTotal := extravios.Count;
    FdPos := 0;
    iPos := 0;
    sMensagem := 'PROCESSANDO OS EXTRAVIOS. Aguarde ...';
    Synchronize(AtualizaProcesso);
    for extravioTMP in extravios do
    begin
      SetLength(aParam,3);
      aParam[0] := dtInicio;
      aParam[1] := dtFinal;
      aParam[2] := extravioTMP.Entregador;
      extratos := extratoDAO.FindExtrato('REFERENCIA',aParam);
      if extratos.Count > 0 then
      begin
        for extratoTMP in extratos do
        begin
          dValor := extratoTMP.ValorExtravio;
          if dValor > 0 then dValor := 0 - extratoTMP.ValorExtravio;
          extratoTMP.ValorExtravio := dValor + (0 - extravioTMP.Total);
          extratoTMP.Log := FormatDateTime('yyyy/mm/dd hh:mm:ss', Now()) + ' processado por ' + Global.Parametros.pUser_Name;
          if not extratoDAO.Update(extratoTMP) then
          begin
            Application.MessageBox(PChar('Erro ao salvar os extravios no extrato do entregador ' + extratoTMP.Entregador.ToString + ' !'), 'Atenção', MB_OK + MB_ICONERROR);
          end;
          extravioTMP.IDExtrato := extratoTMP.ID;
          if not extravioDAO.Update(extravioTMP) then
          begin
            Application.MessageBox(PChar('Erro ao atualizar o extravio do entregador ' + extravioTMP.Entregador.ToString + '!'), 'Atenção', MB_OK + MB_ICONERROR);
          end;
        end;
      end
      else
      begin
        extrato := TExtratosExpressas.Create;
        extrato.Id := 0;
        extrato.Agente := extravioTMP.Agente;
        extrato.Entregador := extravioTMP.Entregador;
        extrato.DataInicio := dtInicio;
        extrato.DataFinal := dtFinal;
        extrato.DataPagamento := 0;
        extrato.Volumes := 0;
        extrato.Entregas := 0;
        extrato.Atrasos := 0;
        extrato.VolumesExtra := 0;
        extrato.SLA := 0;
        extrato.Verba := 0;
        extrato.ValorEntregas := 0;
        extrato.ValorVolumesExtra := 0;
        extrato.ValorProducao := 0;
        extrato.ValorCreditos := 0;
        extrato.ValorExtravio  := 0 - extravioTMP.Total;
        extrato.ValorDebitos := 0;
        extrato.ValorRestricao := 0;
        extrato.ValorTotalCreditos := 0;
        extrato.ValorTotalDebitos := 0;
        extrato.ValorTotalGeral := 0;
        extrato.Fechado := 0;
        extrato.TotalVerbaFranquia := 0;
        extrato.Log := FormatDateTime('yyyy/mm/dd hh:mm:ss', Now()) + ' processado por ' + Global.Parametros.pUser_Name;
        if not extratoDAO.Insert(extrato) then
        begin
          Application.MessageBox(PChar('Erro ao criar o extrato com extravios do entregador ' + extravioTMP.Entregador.ToString + '!'), 'Atenção', MB_OK + MB_ICONERROR);
        end;
        extravioTMP.IDExtrato := extrato.ID;
        extrato.Free;
      end;
      if not extravioDAO.Update(extravioTMP) then
      begin
        Application.MessageBox(PChar('Erro ao atualizar o extravio do entregador ' + extravioTMP.Entregador.ToString + '!'), 'Atenção', MB_OK + MB_ICONERROR);
      end;
      iPos := iPos + 1;
      FdPos := (iPos / iTotal) * 100;
      Synchronize(AtualizaProcesso);
    end;
  finally
  extravioDAO.Free;
  extratoDAO.Free;
  end;
end;

procedure Thread_ProcessaFechamento.ProcessaLancamentos;
var
  extratoTMP: TExtratosExpressas;
  aParam: array of Variant;
  iAgente : Integer;
  iEntregador: Integer;
  dValor : Double;
  iPos: Integer;
  iTotal: integer;
begin
  try
    entregadores := TObjectList<TEntregadores>.Create;
    extratos := TObjectList<TExtratosExpressas>.Create;
    fechalancamentos := TObjectList<TFechamentoLancamento>.Create;
    entregadorDAO := TEntregadoresDAO.Create;
    extratoDAO := TExtratosExpressasDAO.Create;
    extrato := TExtratosExpressas.Create;
    lancamento := TLancamentos.Create;
    agente := TAgente.Create;
    FdPos := 0;
    iPos := 0;
    iTotal := 0;
    sMensagem := 'PROCESSANDO OS LANÇMENTOS DE CRÉDITOS E DÉBITOS. Aguarde ...';
    Synchronize(AtualizaProcesso);
    if lancamento.getObject(DateToStr(dtFinal), 'PERIODO') then
    begin
      iTotal := dm.QryGetObject.RecordCount;
      while not dm.QryGetObject.Eof do
      begin
        if dm.qryGetObject.FieldByName('DOM_DESCONTO').AsString <> 'S' then
        begin
          dValor := 0;
          iAgente := 0;
          iEntregador := 0;
          SetLength(aParam,1);
          aParam[0] := dm.QryGetObject.FieldByName('COD_ENTREGADOR').AsInteger;
          entregadores := entregadorDAO.FindEntregador('CADASTRO', aParam);
          Finalize(aParam);
          if entregadores.Count > 0 then
          begin
            iAgente := entregadores[0].Agente;
            iEntregador := entregadores[0].Entregador;
          end;
          SetLength(aParam,3);
          aParam[0] := dtInicio;
          aParam[1] := dtFinal;
          aParam[2] := iEntregador;
          extratos := extratoDAO.FindExtrato('REFERENCIA', aParam);
          Finalize(aParam);
          if extratos.Count > 0 then
          begin
            for extratoTMP in extratos do
            begin
              if dm.QryGetObject.FieldByName('DES_TIPO').AsString = 'DEBITO' then
              begin
                dValor := 0 - dm.QryGetObject.FieldByName('VAL_LANCAMENTO').AsFloat;
              end
              else
              begin
                dValor := dm.QryGetObject.FieldByName('VAL_LANCAMENTO').AsFloat;
              end;
              if dValor < 0 then
              begin
                extratoTMP.ValorDebitos := extratoTMP.ValorDebitos + dValor;
              end
              else
              begin
                extratoTMP.ValorCreditos := extratoTMP.ValorCreditos + dValor;
              end;
              if not extratoDAO.Update(extratoTMP) then
              begin
                 Application.MessageBox(PChar('Erro ao atualizar o extrato do entregador ' + extratoTMP.Entregador.ToString + ' !'), 'Atenção', MB_OK + MB_ICONERROR);
              end;
  //            if lancamento.getObject(dm.qryPesquisa.FieldByName('COD_LANCAMENTO').AsString, 'CODIGO') then
  //            begin
  //              if not lancamento.Update() then
  //              begin
  //                Application.MessageBox(PChar('Erro ao atualizar o lancamento do entregador ' + extratoTMP.Entregador.ToString + ' !'), 'Atenção', MB_OK + MB_ICONERROR);
  //              end;
  //            end;
              dm.QryGetObject.Edit;
              dm.QryGetObject.FieldByName('NUM_EXTRATO').AsString := extratoTMP.Id.ToString;
              dm.ZConn.PingServer;
              dm.QryGetObject.Post;
            end;
          end
          else
          begin
            dValor := 0;
            if dm.QryGetObject.FieldByName('DES_TIPO').AsString = 'DEBITO' then
            begin
              dValor := 0 - dm.QryGetObject.FieldByName('VAL_LANCAMENTO').AsFloat;
            end
            else
            begin
              dValor := dm.QryGetObject.FieldByName('VAL_LANCAMENTO').AsFloat;
            end;
            extrato := TExtratosExpressas.Create;
            extrato.Id := 0;
            extrato.Agente := iAgente;
            extrato.Entregador := iEntregador;
            extrato.DataInicio := dtInicio;
            extrato.DataFinal := dtFinal;
            extrato.DataPagamento := 0;
            extrato.Volumes := 0;
            extrato.Entregas := 0;
            extrato.Atrasos := 0;
            extrato.VolumesExtra := 0;
            extrato.SLA := 0;
            extrato.Verba := 0;
            extrato.ValorEntregas := 0;
            extrato.ValorVolumesExtra := 0;
            extrato.ValorProducao := 0;
            if dValor < 0 then
            begin
              extrato.ValorDebitos := dValor;
            end
            else
            begin
              extrato.ValorCreditos := dValor;
            end;
            extrato.ValorTotalCreditos := 0;
            extrato.ValorTotalDebitos := 0;
            extrato.ValorTotalGeral := 0;
            if not extratoDAO.Insert(extrato) then
            begin
              Application.MessageBox(PChar('Erro ao salvar os totais de entregas no extrato do entregador ' + extrato.Entregador.ToString + ' !'), 'Atenção', MB_OK + MB_ICONERROR);
            end;
  //          if lancamento.getObject(dm.qryPesquisa.FieldByName('COD_LANCAMENTO').AsString, 'CODIGO') then
  //          begin
  //            lancamento.Extrato := extratoTMP.Id.ToString;
  //            if not lancamento.Update() then
  //            begin
  //              Application.MessageBox(PChar('Erro ao atualizar o lancamento do entregador ' + extratoTMP.Entregador.ToString + ' !'), 'Atenção', MB_OK + MB_ICONERROR);
  //            end;
  //          end;
            dm.QryGetObject.Edit;
            dm.QryGetObject.FieldByName('NUM_EXTRATO').AsString := extrato.Id.ToString;
            dm.ZConn.PingServer;
            dm.QryGetObject.Post;
          end;
        end;
        iPos := iPos + 1;
        FdPos := (iPos / iTotal) * 100;
        Synchronize(AtualizaProcesso);
        dm.QryGetObject.Next;
      end;
    end;
  finally
    dm.QryGetObject.Close;
    extratoTMP.Free;
    entregadorDAO.Free;
    extratoDAO.Free;
    lancamento.Free;
    agente.Free;
  end;
end;

procedure Thread_ProcessaFechamento.ProcessaRestricao;
var
  parcelaTMP : TParcelamentoRestricao;
  extratoTMP: TExtratosExpressas;
  dtDataBase: TDate;
  sFiltro: String;
  aParam: array of Variant;
  dValor: Double;
  iExtrato : Integer;
  iPos : Integer;
begin
  try
    restricao := TRestricoes.Create;
    parcelas := TObjectList<TParcelamentoRestricao>.Create;
    parcela := TParcelamentoRestricao.Create;
    parcelaDAO :=TParcelamentoRestricaoDAO.Create;
    extratoDAO := TExtratosExpressasDAO.Create;
    extrato := TExtratosExpressas.Create;
    dtDataBase := Now();
    dValor := 0;
    FdPos := 0;
    iPos := 0;
    sMensagem := 'PROCESSANDO AS RESTRICÕES. Aguarde ...';
    Synchronize(AtualizaProcesso);
    if restricao.getObject('0','VALOR') then
    begin
      while not dm.QryGetObject.Eof do
      begin
        iTotal := dm.QryGetObject.RecordCount;
        dm.QryGetObject.First;
        sFiltro := 'WHERE COD_RESTRICAO = ' + restricao.Codigo.ToString + ' AND DAT_DEBITO <= ' + FormatDateTime('yyyy-mm-dd', dtDataBase) + ' AND DOM_DEBITADO = 0';
        SetLength(aParam,1);
        aParam[0] := sFiltro;
        parcelas := parcelaDAO.FindParcelamentos('FILTRO', aParam);
        Finalize(aParam);
        if parcelas.Count > 0 then
        begin
          for parcelaTMP in parcelas do
          begin
            SetLength(aParam,1);
            aParam[0] := restricao.Entregador;
            extratos := extratoDAO.FindExtrato('ENTREGADOR', aParam);
            Finalize(aParam);
            iExtrato := 0;
            if extratos.Count > 0 then
            begin
              for extratoTMP in extratos do
              begin
                dValor := extratotmP.ValorRestricao;
                dValor := dValor + parcelaTMP.Valor;
                iExtrato := extratoTMP.Id;
                extratoTMP.ValorRestricao := (0 - dValor);
                if not extratoDAO.Update(extratoTMP) then
                begin
                  Application.MessageBox(PChar('Erro ao salvar a restrição no extrato do entregador ' + extratoTMP.Entregador.ToString + '!'), 'Atenção', MB_OK + MB_ICONERROR);
                end;
                if parcelaTMP.Extrato <> iExtrato then
                begin
                  parcelaTMP.Extrato := iExtrato;
                  if not parcelaDAO.Update(parcelaTMP) then
                  begin
                    Application.MessageBox(PChar('Erro ao salvar o número do extrato da restrição nº. ' + parcelaTMP.Restricao.ToString + '!'), 'Atenção', MB_OK + MB_ICONERROR);
                  end;
                end;
              end;
            end
            else
            begin
              dValor := 0;
              extrato.Id := 0;
              extrato.Agente := restricao.Agente;
              extrato.Entregador := restricao.Entregador;
              extrato.DataInicio := dtInicio;
              extrato.DataFinal := dtFinal;
              extrato.DataPagamento := 0;
              extrato.Volumes := 0;
              extrato.Entregas := 0;
              extrato.Atrasos := 0;
              extrato.VolumesExtra := 0;
              extrato.SLA := 0;
              extrato.Verba := 0;
              extrato.ValorEntregas := 0;
              extrato.ValorVolumesExtra := 0;
              extrato.ValorProducao := 0;
              extrato.ValorCreditos := 0;
              extrato.ValorExtravio  := 0;
              extrato.ValorDebitos := 0;
              dValor := extratotmP.ValorRestricao;
              dValor := dValor + parcelaTMP.Valor;
              extrato.ValorRestricao := (0 - dValor);
              extrato.ValorTotalCreditos := 0;
              extrato.ValorTotalDebitos := 0;
              extrato.ValorTotalGeral := 0;
              extrato.Fechado := 0;
              extrato.Log := FormatDateTime('yyyy/mm/dd hh:mm:ss', Now()) + ' processado por ' + Global.Parametros.pUser_Name;
              if not extratoDAO.Insert(extrato) then
              begin
                Application.MessageBox(PChar('Erro ao criar o extrato da restrição nº. ' + parcelaTMP.Restricao.ToString + '!'), 'Atenção', MB_OK + MB_ICONERROR);
              end;
              iExtrato := extrato.Id;
            end;
            parcelaTMP.Extrato := iExtrato;
            if not parcelaDAO.Update(parcelaTMP) then
            begin
              Application.MessageBox(PChar('Erro ao salvar o número do extrato da restrição nº. ' + parcelaTMP.Restricao.ToString + '!'), 'Atenção', MB_OK + MB_ICONERROR);
            end;
          end;
        end
        else
        begin
          parcela.Restricao := restricao.Codigo;
          parcela.Parcela := 1;
          parcela.TotalParcelas := 1;
          parcela.Debitado := 0;
          parcela.Extrato := 0;
          parcela.Valor := restricao.Debitar;
          parcela.Data := Now();
          SetLength(aParam,1);
          aParam[0] := restricao.Entregador;
          extratos := extratoDAO.FindExtrato('ENTREGADOR', aParam);
          Finalize(aParam);
          if extratos.Count > 0 then
          begin
            for extratoTMP in extratos do
            begin
              dValor := extratotmP.ValorRestricao;
              dValor := dValor + parcela.Valor;
              iExtrato := extratoTMP.Id;
              extratoTMP.ValorRestricao := (0 - dValor);
              if not extratoDAO.Update(extratoTMP) then
              begin
                Application.MessageBox(PChar('Erro ao salvar a restrição no extrato do entregador ' + extratoTMP.Entregador.ToString + '!'), 'Atenção', MB_OK + MB_ICONERROR);
              end;
            end;
          end
          else
          begin
            dValor := 0;
            extrato.Id := 0;
            extrato.Agente := restricao.Agente;
            extrato.Entregador := restricao.Entregador;
            extrato.DataInicio := dtInicio;
            extrato.DataFinal := dtFinal;
            extrato.DataPagamento := 0;
            extrato.Volumes := 0;
            extrato.Entregas := 0;
            extrato.Atrasos := 0;
            extrato.VolumesExtra := 0;
            extrato.SLA := 0;
            extrato.Verba := 0;
            extrato.ValorEntregas := 0;
            extrato.ValorVolumesExtra := 0;
            extrato.ValorProducao := 0;
            extrato.ValorCreditos := 0;
            extrato.ValorExtravio  := 0;
            extrato.ValorDebitos := 0;
            dValor := extratotmP.ValorRestricao;
            dValor := dValor + parcelaTMP.Valor;
            extrato.ValorRestricao := (0 - dValor);
            extrato.ValorTotalCreditos := 0;
            extrato.ValorTotalDebitos := 0;
            extrato.ValorTotalGeral := 0;
            extrato.Fechado := 0;
            extrato.Log := FormatDateTime('yyyy/mm/dd hh:mm:ss', Now()) + ' processado por ' + Global.Parametros.pUser_Name;
            if not extratoDAO.Insert(extrato) then
            begin
              Application.MessageBox(PChar('Erro ao criar o extrato da restrição nº. ' + parcelaTMP.Restricao.ToString + '!'), 'Atenção', MB_OK + MB_ICONERROR);
            end;
            iExtrato := extrato.Id;
          end;
          parcela.Extrato := iExtrato;
          if not parcelaDAO.Insert(parcela) then
          begin
            Application.MessageBox(PChar('Erro ao gravar a parcela única da restrição ' + parcelaTMP.Restricao.ToString + '!'), 'Atenção', MB_OK + MB_ICONERROR);
          end;
        end;
        iPos := iPos + 1;
        FdPos := (iPos / iTotal) * 100;
        Synchronize(AtualizaProcesso);
        dm.QryGetObject.Next;
      end;
    end;
  finally
    restricao.Free;
    extratoTMP.Free;
    extrato.Free;
    parcela.Free;
    parcelaTMP.Free;
    parcelaDAO.Free;
    extratoDAO.Free;
  end;
end;

procedure Thread_ProcessaFechamento.ProcessaVerba;
var
  dVerba : Double;
  dPercentual : Double;
  dPercentualMin: Double;
  dPercentualMax: Double;
  aParam: array of Variant;
  extratoTMP: TExtratosExpressas;
  iPos: Integer;
  iTotal : Integer;
  iGrupo : Integer;
begin
  try
    dVerba := 0;
    dPercentual := 0;
    dPercentualMin := 0;
    dPercentualMax := 0;
    iGrupo := 0;
    agente := Tagente.Create;
    verba := TGruposVerba.Create;
    entregadores := TObjectList<TEntregadores>.Create;
    entregadorDAO := TEntregadoresDAO.Create;
    extratos := TObjectList<TExtratosExpressas>.Create;
    extratoDAO := TExtratosExpressasDAO.Create;
    SetLength(aParam,3);
    aParam[0] := dtInicio;
    aParam[1] := dtFinal;
    aParam[2] := 0;
    extratos := extratoDAO.FindExtrato('PERIODO',aParam);
    Finalize(aParam);
    FdPos := 0;
    iPos := 0;
    sMensagem := 'PROCESSANDO AS VERBAS DE ENTREGA. Aguarde ...';
    Synchronize(AtualizaProcesso);
    iTotal := extratos.Count;
    for extratoTMP in extratos do
    begin
      if agente.getObject(extratoTMP.Agente.ToString,'CODIGO') then
      begin
        iGrupo := agente.Grupo;
        dVerba := agente.Verba;
      end;

      // grupo de verba por agente ou verba fixa

      if iGrupo > 0 then
      begin
        if dVerba = 0 then
        begin
          dPercentualMax := verba.MaxPercentualGrupo(iGrupo.ToString);
          dPercentualMin := verba.MinPercentualGrupo(iGrupo.ToString);
          if bSLA then
          begin
            dPercentual := Trunc(extratoTMP.SLA);
            if dPercentual < dpercentualMin then dPercentual := dPercentualMin;
            if dPercentual > dpercentualMax then dPercentual := dPercentualMax;
          end
          else
          begin
            dPercentual := dPercentualMax;
          end;
          if dVerba = 0 then
          begin
            verba.Percentual := dPercentual;
            if verba.getObject(iGrupo.ToString,'PERCENTUAL') then
            begin
              dVerba := verba.Verba;
            end;
          end;
        end;
      end;

      // grupo de verba por entregador ou verba fixa

      SetLength(aParam,1);
      aParam[0] := extratoTMP.Entregador;
      entrEgadores := entregadorDAO.FindEntregador('ENTREGADOR', aParam);
      Finalize(aParam);
      if entregadores.Count > 0 then
      begin
        if entregadores[0].Verba > 0 then dVerba := entregadores[0].Verba;
        iGrupo := entregadores[0].Grupo;
      end;
      if iGrupo > 0 then
      begin
        dPercentualMax := verba.MaxPercentualGrupo(iGrupo.ToString);
        dPercentualMin := verba.MinPercentualGrupo(iGrupo.ToString);
        if bSLA then
        begin
          dPercentual := Trunc(extratoTMP.SLA);
          if dPercentual < dpercentualMin then dPercentual := dPercentualMin;
          if dPercentual > dpercentualMax then dPercentual := dPercentualMax;
        end
        else
        begin
          dPercentual := dPercentualMax;
        end;
        if dVerba = 0 then
        begin
          verba.Percentual := dPercentual;
          if verba.getObject(iGrupo.ToString,'PERCENTUAL') then
          begin
            dVerba := verba.Verba;
          end;
        end;
      end;
      extratoTMP.Verba := dVerba;
      if not extratoDAO.Update(extratoTMP) then
      begin
        Application.MessageBox(PChar('Erro ao gravar a verba no extrato do entregador ' + extrato.Id.ToString + ' !'), 'Atenção', MB_OK + MB_ICONERROR);
      end;
      iPos := iPos + 1;
      FdPos := (iPos / iTotal) * 100;
      Synchronize(AtualizaProcesso);
    end;
  finally
    agente.Free;
    entregadorDAO.Free;
    extratoTMP.Free;
    extratoDAO.Free;
  end;
end;

procedure Thread_ProcessaFechamento.TerminaProcesso;
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
  if bFlag then
  begin
    Application.MessageBox('Fechamento já encerrado!', 'Atenção', MB_OK + MB_ICONINFORMATION);
  end
  else
  begin
    view_FechamentoExpressas.actCancelar.Enabled := True;
    view_FechamentoExpressas.actEncerrar.Enabled := True  ;
  end;
  view_FechamentoExpressas.dxActivityIndicator1.Active := False;
end;

procedure Thread_ProcessaFechamento.TotalizaExtrato;
var
  extratoTMP: TExtratosExpressas;
  aParam: array of Variant;
  iPos: Integer;
  iTotal: Integer;
begin
  try
    extratoDAO := TExtratosExpressasDAO.Create;
    extratos := TObjectList<TExtratosExpressas>.Create;
    SetLength(aParam,3);
    aParam[0] := dtInicio;
    aParam[1] := dtFinal;
    aParam[2] := 0;
    extratos := extratoDAO.FindExtrato('PERIODO', aParam);
    Finalize(aParam);
    FdPos := 0;
    iPos := 0;
    sMensagem := 'PROCESSANDO A TOTALIZAÇÃO DO EXTRATO. Aguarde ...';
    Synchronize(AtualizaProcesso);
    iTotal := extratos.Count;
    for extratoTMP in extratos do
    begin
      extratoTMP.ValorEntregas := (extratoTMP.Entregas - extratoTMP.PFP) * extratoTMP.Verba;
      extratoTMP.ValorVolumesExtra := extratoTMP.PFP * 15;
      extratoTMP.ValorProducao := extratoTMP.ValorEntregas + extratoTMP.ValorVolumesExtra;
      extratoTMP.ValorTotalCreditos := extratoTMP.ValorProducao + extratoTMP.ValorCreditos;
      extratoTMP.ValorTotalDebitos := extratoTMP.ValorRestricao + extratoTMP.ValorExtravio + extratoTMP.ValorDebitos;
      extratoTMP.ValorTotalGeral := extratoTMP.ValorTotalCreditos + extratoTMP.ValorTotalDebitos;
      if not extratoDAO.Update(extratoTMP) then
      begin
        Application.MessageBox(PChar('Erro ao totalizar o extrato do entregador ' + extratoTMP.Id.ToString + ' !'), 'Atenção', MB_OK + MB_ICONERROR);
      end;
      iPos := iPos + 1;
      FdPos := (iPos / iTotal) * 100;
      Synchronize(AtualizaProcesso);
    end;
  finally
    extratoDAO.Free;
  end;
end;

end.
