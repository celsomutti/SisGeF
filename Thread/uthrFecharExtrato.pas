unit uthrFecharExtrato;

interface

uses
  System.Classes, clAgentes, clEntregador, clEntrega, clExtrato, clLancamentos,
  clAbastecimentos,
  clRestricoes, clPlanilhaCredito, clUtil, udm, Dialogs, Windows, Forms,
  SysUtils, Messages, Controls,
  System.DateUtils, clBancos, clCodigosEntregadores;

type
  thrFecharExtrato = class(TThread)
  private
    { Private declarations }
    agente: TAgente;
    entregador: TEntregador;
    entrega: TEntrega;
    extrato: TExtrato;
    lancamento: TLancamentos;
    restricao: TRestricoes;
    abastecimento: TAbastecimentos;
    planilha: TPlanilhaCredito;
    codentregador: TCodigosEntregadores;
    banco: TBancos;
  protected
    procedure Execute; override;
    procedure IniciaProcesso;
    procedure AtualizaProgress;
    procedure TerminaProcesso;
  end;

implementation

{ thrFecharExtrato }

uses
  ufrmExtrato, uGlobais;

procedure thrFecharExtrato.Execute;
var
  dValor: Double;
  sFiltro, sAgente, sChave, sInicio, sNome, sCadastro: String;
  iConta, Contador, LinhasTotal, ICodigo: Integer;
begin
  agente := TAgente.Create();
  entregador := TEntregador.Create();
  entrega := TEntrega.Create();
  extrato := TExtrato.Create();
  lancamento := TLancamentos.Create();
  restricao := TRestricoes.Create();
  abastecimento := TAbastecimentos.Create();
  planilha := TPlanilhaCredito.Create();
  codentregador := TCodigosEntregadores.Create();
  banco := TBancos.Create();
  try
    LinhasTotal := dm.tbExtrato.RecordCount;
    Contador := 1;
    Synchronize(IniciaProcesso);
    dm.tbExtrato.First;
    ICodigo := dm.tbExtratoCOD_ENTREGADOR.AsInteger;
    while not(dm.tbExtrato.Eof) do
    begin
      extrato.CodigoAgente := dm.tbExtratoCOD_AGENTE.AsInteger;
      extrato.NomeAgente := dm.tbExtratoDES_AGENTE.AsString;
      extrato.CodigoEntregador := dm.tbExtratoCOD_ENTREGADOR.AsInteger;
      extrato.NomeEntregador := dm.tbExtratoDES_ENTREGADOR.AsString;
      extrato.DataBase := frmExtrato.cxDatFinal.Date;
      extrato.DataPagamento := frmExtrato.cxDatPagamento.Date;
      extrato.GeraNumero;
      extrato.DataInicio := frmExtrato.cxDatInicial.Date;
      extrato.DataTermino := frmExtrato.cxDatFinal.Date;
      extrato.Volumes := dm.tbExtratoQTD_VOLUMES.AsInteger;
      extrato.entrega := dm.tbExtratoQTD_ENTREGA.AsInteger;
      extrato.Verba := dm.tbExtratoVAL_VERBA.AsFloat;
      extrato.VerbaTotal := dm.tbExtratoVAL_VERBA_TOTAL.AsCurrency;
      extrato.Credito := dm.tbExtratoVAL_CREDITO.AsCurrency;
      extrato.Debito := dm.tbExtratoVAL_DEBITO.AsCurrency;
      extrato.restricao := dm.tbExtratoVAL_RESTRICAO.AsCurrency;
      extrato.SubTotal := dm.tbExtratoVAL_SUB_TOTAL.AsCurrency;
      extrato.VolumesExtra := dm.tbExtratoQTD_VOLUMES_EXTRA.AsFloat;
      extrato.ValorVolumesExtra := dm.tbExtratoVAL_VOLUMES_EXTRA.AsCurrency;
      extrato.Total := dm.tbExtratoVAL_TOTAL.AsCurrency;
      extrato.DataPagamento := frmExtrato.cxDatPagamento.Date;
      extrato.MarcaPago := 'S';
      extrato.ValorAbastecimento := dm.tbExtratoVAL_ABASTECIMENTO.AsCurrency;
      if not(TUtil.Empty(frmExtrato.cxFinalAbastecimento.Text)) then
      begin
        if DayOf(frmExtrato.cxFinalAbastecimento.Date) = 15 then
        begin
          sInicio := '01' + Copy(frmExtrato.cxFinalAbastecimento.Text, 3, 8);
        end
        else
        begin
          sInicio := '16' + Copy(frmExtrato.cxFinalAbastecimento.Text, 3, 8);
        end;
        extrato.IncioAbastecimento := StrToDate(sInicio);
        extrato.FinalAbastecimento := frmExtrato.cxFinalAbastecimento.Date;
      end
      else
      begin
        extrato.IncioAbastecimento := 0;
        extrato.FinalAbastecimento := 0;
      end;
      extrato.TotalDescontos := dm.tbExtratoVAL_TOTAL_DESCONTOS.AsCurrency;
      extrato.TotalCreditos := dm.tbExtratoVAL_TOTAL_CREDITOS.AsCurrency;
      extrato.TotalGeral := dm.tbExtratoVAL_TOTAL_GERAL.AsCurrency;
      extrato.MarcaFechado := 'S';
      extrato.DataFechado := Now;
      extrato.Executante := uGlobais.sUsuario;
      extrato.Manutencao := Now;
      extrato.Dia1 := dm.tbExtratoQTD_ATRASOS.AsInteger;
      extrato.Dia2 := dm.tbExtratoQTD_2_DIAS.AsInteger;
      extrato.Dia3 := dm.tbExtratoQTD_MAIS_DIAS.AsInteger;

      if entregador.getObject(IntToStr(extrato.CodigoEntregador), 'CODIGO') then
      begin
        ICodigo := entregador.Cadastro;
      end;

      // Fechar entregas
      if not(entrega.Fechar(frmExtrato.cxDatInicial.Text,
        frmExtrato.cxDatFinal.Text, frmExtrato.cxDatPagamento.Text,
        extrato.NumeroExtrato, dm.tbExtratoCOD_AGENTE.AsString,
        dm.tbExtratoCOD_ENTREGADOR.AsString, 'BAIXA', 'FECHAR', extrato.Verba)) then
      begin
        MessageDlg('Erro Fechamento: ENTREGAS; Agente: ' +
          dm.tbExtratoCOD_AGENTE.AsString + ' / Entregador: ' +
          dm.tbExtratoCOD_ENTREGADOR.AsString, mtWarning, [mbOK], 0);
        Self.Terminate;
      end;

      // Processar abastecimentos
      if not(TUtil.Empty(frmExtrato.cxInicioAbastecimento.Text)) then
      begin
        sInicio := frmExtrato.cxInicioAbastecimento.Text;
        if not(abastecimento.Fechar(sInicio,frmExtrato.cxFinalAbastecimento.Text, IntToStr(ICodigo), extrato.NumeroExtrato, 'FECHAR')) then
        begin
          MessageDlg('Erro Fechamento: ABASTECIMENTO; Entregador: ' +
            dm.tbExtratoCOD_ENTREGADOR.AsString, mtWarning, [mbOK], 0);
          Self.Terminate;
        end;
      end;

      // Processar restrições
      if extrato.restricao <> 0 then
      begin
        if restricao.getObject(IntToStr(extrato.CodigoEntregador), 'ENTREGADOR')
        then
        begin
          restricao.Valor := restricao.Valor + extrato.restricao;
          restricao.Pago := restricao.Pago + ABS(extrato.restricao);
          restricao.Debitar := 0;
          if not(restricao.Update) then
          begin
            MessageDlg('Erro Fechamento: RESTRIÇÃO; Agente: ' +
              dm.tbExtratoCOD_AGENTE.AsString + ' / Entregador: ' +
              dm.tbExtratoCOD_ENTREGADOR.AsString, mtWarning, [mbOK], 0);
            Self.Terminate;
          end;
        end
        else
        begin
          if restricao.getObject(IntToStr(extrato.CodigoAgente), 'AGENTE') then
          begin
            restricao.Valor := restricao.Valor + extrato.restricao;
            restricao.Pago := restricao.Pago + ABS(extrato.restricao);
            restricao.Debitar := 0;
            if not(restricao.Update) then
            begin
              MessageDlg('Erro Fechamento: RESTRIÇÃO; Agente: ' +
                dm.tbExtratoCOD_AGENTE.AsString + ' / Entregador: ' +
                dm.tbExtratoCOD_ENTREGADOR.AsString, mtWarning, [mbOK], 0);
              Self.Terminate;
            end;
          end;
        end;
      end;

      // Fechar lançamentos de débitos e créditos
      if not(lancamento.Fechar(frmExtrato.cxDatInicial.Text,
        frmExtrato.cxDatFinal.Text, frmExtrato.cxDatPagamento.Text,
        extrato.NumeroExtrato, IntToStr(ICodigo), 'FECHAR')) then
      begin
        MessageDlg('Erro Fechamento: LANÇAMENTO; Agente: ' +
          dm.tbExtratoCOD_AGENTE.AsString + ' / Entregador: ' +
          dm.tbExtratoCOD_ENTREGADOR.AsString, mtWarning, [mbOK], 0);
        Self.Terminate;
      end;
      if not(lancamento.Persistecia) then
      begin
        MessageDlg('Erro Fechamento: Persistência LANÇAMENTO; Agente: ' +
          dm.tbExtratoCOD_AGENTE.AsString + ' / Entregador: ' +
          dm.tbExtratoCOD_ENTREGADOR.AsString, mtWarning, [mbOK], 0);
        Self.Terminate;
      end;

      // Gera Planilha de Crédito
      dValor := 0;
      sChave := '';
      sNome := '';
      sCadastro := '';
      if agente.getObject(IntToStr(extrato.CodigoAgente), 'CODIGO') then
      begin
        if agente.Forma = 'NENHUMA' then
        begin
          codentregador.Codigo := extrato.CodigoEntregador;
          sCadastro := codentregador.getField('COD_CADASTRO', 'CODIGO');
          if TUtil.Empty(sCadastro) then
          begin
            sCadastro := '-1';
          end;
          if entregador.getObject(sCadastro, 'CADASTRO') then
          begin
            if entregador.Forma <> 'NENHUMA' then
            begin
              planilha.DataPagamento := extrato.DataPagamento;
              sNome := '';
              planilha.agente := StrToInt(sCadastro);
              planilha.NomeAgente := entregador.Nome;
              planilha.entregador := 0;
              planilha.NomeEntregador := '';
              planilha.Servico := 'EXPRESSAS';
              planilha.TipoConta := entregador.TipoConta;
              planilha.banco := entregador.banco;
              banco.Codigo := planilha.banco;
              sNome := banco.getField('NOM_BANCO', 'CODIGO');
              if TUtil.Empty(sNome) then
              begin
                sNome := 'BANCO NÃO CADASTRADO'
              end;
              planilha.NomeBanco := sNome;
              planilha.Agencia := entregador.Agencia;
              planilha.Conta := entregador.NumeroConta;
              planilha.Favorecido := entregador.Favorecido;
              planilha.CpfCnpjFavorecido := entregador.CpfCnpjFavorecido;
              planilha.TipoPagamento := entregador.Forma;
              planilha.extrato := extrato.NumeroExtrato;
              dValor := extrato.TotalGeral;
              planilha.Executor := uGlobais.sUsuario;
              planilha.Manutencao := Now;
              sChave := '';
              if planilha.getObject(sChave, 'CHAVE') then
              begin
                planilha.Valor := planilha.Valor + dValor;
                if not(planilha.Update()) then
                begin
                  MessageDlg
                    ('Erro ao alterar os dados na planilha de crédito. Chave: E'
                    + sChave, mtWarning, [mbOK], 0);
                  Self.Terminate;
                end;
              end
              else
              begin
                planilha.Valor := dValor;
                if not(planilha.Insert()) then
                begin
                  MessageDlg
                    ('Erro ao incluir os dados na planilha de crédito. Chave: E'
                    + sChave, mtWarning, [mbOK], 0);
                  Self.Terminate;
                end;
              end
            end;
          end;
        end
        else
        begin
          planilha.DataPagamento := extrato.DataPagamento;
          planilha.agente := extrato.CodigoAgente;
          planilha.NomeAgente := agente.Razao;
          planilha.Servico := 'EXPRESSAS';
          planilha.entregador := 0;
          planilha.NomeEntregador := '';
          planilha.TipoConta := agente.TipoConta;
          planilha.banco := agente.banco;
          banco.Codigo := planilha.banco;
          sNome := banco.getField('NOM_BANCO', 'CODIGO');
          if TUtil.Empty(sNome) then
          begin
            sNome := 'BANCO NÃO CADASTRADO'
          end;
          planilha.NomeBanco := sNome;
          planilha.Agencia := agente.Agencia;
          planilha.Conta := agente.NumeroConta;
          planilha.Favorecido := agente.Favorecido;
          planilha.CpfCnpjFavorecido := agente.CpfCnpjFavorecido;
          planilha.TipoPagamento := agente.Forma;
          planilha.extrato := extrato.NumeroExtrato;
          dValor := extrato.TotalGeral;
          planilha.Executor := uGlobais.sUsuario;
          planilha.Manutencao := Now;
          sChave := '';
          if planilha.getObject(sChave, 'CHAVE') then
          begin
            planilha.Valor := planilha.Valor + dValor;
            if not(planilha.Update()) then
            begin
              MessageDlg
                ('Erro ao alterar os dados na planilha de crédito. Chave: A' +
                sChave, mtWarning, [mbOK], 0);
              Self.Terminate;
            end;
          end
          else
          begin
            planilha.Valor := dValor;
            if not(planilha.Insert()) then
            begin
              MessageDlg
                ('Erro ao incluir os dados na planilha de crédito. Chave: A' +
                sChave, mtWarning, [mbOK], 0);
              Self.Terminate;
            end;
          end
        end;
      end;

      // Salvar extrato
      if not(extrato.Insert) then
      begin
        MessageDlg('Erro Fechamento: EXTRATO; Agente: ' +
          dm.tbExtratoCOD_AGENTE.AsString + ' / Entregador: ' +
          dm.tbExtratoCOD_ENTREGADOR.AsString, mtWarning, [mbOK], 0);
        Self.Terminate;
      end;
      dPosicao := (Contador / LinhasTotal) * 100;
      Inc(Contador);
      if not(Self.Terminated) then
      begin
        Synchronize(AtualizaProgress);
      end
      else
      begin
        agente.Free;
        entregador.Free;
        entrega.Free;
        extrato.Free;
        lancamento.Free;
        restricao.Free;
        abastecimento.Free;
        planilha.Free;
        codentregador.Free;
        banco.Free;
        Abort;
      end;
      dm.tbExtrato.Next;
    end;
  finally
    Synchronize(TerminaProcesso);
    agente.Free;
    entregador.Free;
    entrega.Free;
    extrato.Free;
    lancamento.Free;
    restricao.Free;
    abastecimento.Free;
    planilha.Free;
    codentregador.Free;
    banco.Free;
  end;
end;

procedure thrFecharExtrato.AtualizaProgress;
begin
  frmExtrato.cxProgressBar.Visible := True;
  frmExtrato.cxProgressBar.Position := Round(dPosicao);
  frmExtrato.cxProgressBar.Properties.Text := IntToStr(Round(dPosicao)) + '%';
  frmExtrato.cxProgressBar.Refresh;

end;

procedure thrFecharExtrato.TerminaProcesso;
begin
  frmExtrato.cxGrid1DBTableView1.OptionsView.NoDataToDisplayInfoText :=
    '<Nenhuma Informação Disponível>';
  frmExtrato.cxProgressBar.Visible := False;
  frmExtrato.cxProgressBar.Properties.Text := '';
  frmExtrato.cxProgressBar.Position := 0;
  frmExtrato.cxProgressBar.Clear;
  frmExtrato.dsExtrato.Enabled := True;
  frmExtrato.actFechamentoExportarResumo.Enabled := True;
  frmExtrato.actFechamentoExportarEntregas.Enabled := True;
  frmExtrato.actExtratoCalcular.Enabled := True;
  frmExtrato.actFechamentoFechar.Enabled := False;
  frmExtrato.actFechamentoCancelarFechamento.Enabled := False;
  frmExtrato.dsExtrato.Enabled := True;
  frmExtrato.cxGrid1DBTableView1.ViewData.Expand(True);
  dm.tbExtrato.Close;
  Application.MessageBox('Fechamento concluído.', 'Fechando Extrato',
    MB_OK + MB_ICONINFORMATION);
end;

procedure thrFecharExtrato.IniciaProcesso;
begin
  frmExtrato.dsExtrato.Enabled := False;
  frmExtrato.cxGrid1DBTableView1.OptionsView.NoDataToDisplayInfoText :=
    '<Realizando o Fechamento do Extrato. Aguarde...>';
  frmExtrato.actFechamentoExportarResumo.Enabled := False;
  frmExtrato.actFechamentoExportarEntregas.Enabled := False;
  frmExtrato.actExtratoCalcular.Enabled := False;
  frmExtrato.actFechamentoFechar.Enabled := False;
  frmExtrato.actFechamentoCancelarFechamento.Enabled := False;
  frmExtrato.cxProgressBar.Clear;
end;

end.
