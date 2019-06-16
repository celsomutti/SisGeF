unit uthrCalculaExtratoFiltroAgente;

interface

uses
  System.Classes, clAgentes, clCodigosEntregadores, clEntrega, clExtrato,
  clLancamentos, clAbastecimentos,
  clRestricoes, clPlanilhaCredito, clUtil, udm, Dialogs, Windows, Forms,
  SysUtils, Messages, Controls,
  System.DateUtils, clGruposVerba;

type
  TRegExtrato = record
    _codigoagente: Integer;
    _nomeagente: String;
    _codigoentregador: Integer;
    _nomeentregador: String;
    _valpercentualEnt: Double;
    _verba: Double;
    _volumes: Integer;
    _entrega: Integer;
    _subtotal: Double;
    _qtdvolumesextra: Double;
    _valvolumesextra: Double;
    _atrasos: Integer;
    _credito: Double;
    _debito: Double;
    _restricao: Double;
    _valorabastecimento: Double;
    _total: Double;
    _datapagamento: TDateTime;
    _inicioabastecimento: TDateTime;
    _finalabastecimento: TDateTime;
    _datafechamento: TDateTime;
    _cadastro: Integer;
  end;

  thrCalculaExtratoFiltroAgente = class(TThread)
  private
    { Private declarations }
    agente: TAgente;
    entregador: TCodigosEntregadores;
    entrega: TEntrega;
    extrato: TExtrato;
    lancamento: TLancamentos;
    restricao: TRestricoes;
    abastecimento: TAbastecimentos;
    planilha: TPlanilhaCredito;
    RegExtrato: TRegExtrato;
    verba: TGruposVerba;

  protected
    procedure Execute; override;
    procedure LimpaRecord;
    procedure IniciaProcesso;
    procedure AtualizaProgress;
    procedure TerminaProcesso;
  end;

implementation

{ thrCalculaExtratoFiltroAgente }

uses
  ufrmExtrato, uGlobais;

procedure thrCalculaExtratoFiltroAgente.Execute;
var
  sInicio, sGrupoAge, sGrupoEnt, sVerba, sExpressaIni, sExpressaFim, sFiltro,
    sAgente, sGrupo: String;
  iConta, Contador, LinhasTotal, i: Integer;
  bFlag, bCLA: Boolean;
  dVerbaEnt, dVerbaAge: Double;
begin
  agente := TAgente.Create();
  entregador := TCodigosEntregadores.Create();
  entrega := TEntrega.Create();
  extrato := TExtrato.Create();
  lancamento := TLancamentos.Create();
  restricao := TRestricoes.Create();
  abastecimento := TAbastecimentos.Create();
  planilha := TPlanilhaCredito.Create();
  verba := TGruposVerba.Create();
  try
    Synchronize(IniciaProcesso);
    sExpressaIni := frmExtrato.cxDatInicial.Text;
    sExpressaFim := frmExtrato.cxDatFinal.Text;
    if frmExtrato.cxTipoPeriodo.ItemIndex = 0 then
    begin
      sFiltro := 'BAIXA';
    end
    else if frmExtrato.cxTipoPeriodo.ItemIndex = 1 then
    begin
      sFiltro := 'ATRIBUICAO';
    end;
    if (not entregador.getObjects()) then
    begin
      MessageDlg('Nenhum Entregador cadastrado!', mtWarning, [mbOK], 0);
      Self.Terminate;
    end;
    iTotal := dm.qryGetObject.RecordCount;
    dm.qryGetObject.First;
    while (not dm.qryGetObject.Eof) do
    begin
      LimpaRecord;
      sGrupoAge := '0';
      sGrupoEnt := '0';
      sGrupo := '0';
      dVerbaEnt := 0;
      dVerbaAge := 0;
      sAgente := '';
      bCLA := frmExtrato.cxSLA.Checked;
      RegExtrato._codigoentregador := dm.qryGetObject.FieldByName
        ('COD_ENTREGADOR').AsInteger;
      if RegExtrato._codigoentregador <> 0 then
      begin
        RegExtrato._nomeentregador := dm.qryGetObject.FieldByName
          ('NOM_FANTASIA').AsString;
        RegExtrato._cadastro := dm.qryGetObject.FieldByName('COD_CADASTRO')
          .AsInteger;
        RegExtrato._codigoagente := dm.qryGetObject.FieldByName('COD_AGENTE')
          .AsInteger;
        dVerbaEnt := dm.qryGetObject.FieldByName('VAL_VERBA').AsFloat;
        sGrupoEnt := dm.qryGetObject.FieldByName('COD_GRUPO').AsString;
        if TUtil.Empty(sGrupoEnt) then
        begin
          sGrupoEnt := '0';
        end;
        if entrega.TotalPeriodo(sExpressaIni, sExpressaFim, '',
          IntToStr(RegExtrato._codigoentregador), sFiltro) then
        begin
          while (not dm.qryGeral.Eof) do
          begin
            RegExtrato._codigoagente := dm.qryGeral.FieldByName('COD_AGENTE')
              .AsInteger;
            RegExtrato._volumes := dm.qryGeral.FieldByName('VOLUMES').AsInteger;
            RegExtrato._entrega := dm.qryGeral.FieldByName('ENTREGAS')
              .AsInteger;
            RegExtrato._atrasos := entrega.PrazoExtrato(sExpressaIni,
              sExpressaFim, IntToStr(RegExtrato._codigoagente),
              IntToStr(RegExtrato._codigoentregador), '99');
            RegExtrato._qtdvolumesextra :=
              dm.qryGeral.FieldByName('EXTRA').AsFloat;
            if uGlobais.lAgentes.IndexOf(IntToStr(RegExtrato._codigoagente)) > -1
            then
            begin
              agente.Codigo := IntToStr(RegExtrato._codigoagente);
              sAgente := agente.getField('NOM_FANTASIA', 'CODIGO');
              if TUtil.Empty(sAgente) then
              begin
                sAgente := 'ADM. CEP NÃO CADASTRADO';
              end;
              RegExtrato._nomeagente := IntToStr(RegExtrato._codigoagente) +
                ' - ' + sAgente;
              sVerba := agente.getField('VAL_VERBA', 'CODIGO');
              if TUtil.Empty(sVerba) then
              begin
                sVerba := '0';
              end;
              dVerbaAge := StrToFloat(sVerba);
              sGrupoAge := agente.getField('COD_GRUPO', 'CODIGO');;
              if TUtil.Empty(sGrupoAge) then
              begin
                sGrupoAge := '0';
              end;
              if sGrupoAge <> '0' then
              begin
                sGrupo := sGrupoAge;
              end;
              if sGrupoEnt <> '0' then
              begin
                sGrupo := sGrupoEnt;
              end;
              if sGrupo <> '0' then
              begin
                if RegExtrato._entrega > 0 then
                begin
                  if bCLA then
                  begin
                    RegExtrato._valpercentualEnt :=
                      100 - ((RegExtrato._atrasos / RegExtrato._entrega) * 100);
                  end
                  else
                  begin
                    RegExtrato._valpercentualEnt := 100;
                  end;
                  if verba.RetornaVerba(sGrupo, RegExtrato._valpercentualEnt)
                  then
                  begin
                    RegExtrato._verba := verba.verba;
                    RegExtrato._valpercentualEnt := verba.Percentual;
                  end;
                end
                else
                begin
                  RegExtrato._verba := 0;
                  RegExtrato._valpercentualEnt := 0;
                end;
              end;
              if dVerbaAge > 0 then
              begin
                RegExtrato._verba := dVerbaAge;
              end;
              if dVerbaEnt > 0 then
              begin
                RegExtrato._verba := dVerbaEnt;
              end;

              // verifica se período de abastecimento foi informado. Se foi, totaliza o período informado.

              if not(TUtil.Empty(frmExtrato.cxFinalAbastecimento.Text)) then
              begin
                sInicio := frmExtrato.cxInicioAbastecimento.Text;
                RegExtrato._inicioabastecimento := StrToDate(sInicio);
                RegExtrato._finalabastecimento :=
                  frmExtrato.cxFinalAbastecimento.Date;
                RegExtrato._valorabastecimento :=
                  0 - (abastecimento.TotalPeriodo(sInicio,
                  frmExtrato.cxFinalAbastecimento.Text,
                  IntToStr(RegExtrato._cadastro)));
              end
              else
              begin
                RegExtrato._inicioabastecimento := 0;
                RegExtrato._finalabastecimento := 0;
                RegExtrato._valorabastecimento := 0;
              end;

              // totaliza os valores de crédito
              RegExtrato._credito := lancamento.Totalizacao
                (frmExtrato.cxDatInicial.Text, frmExtrato.cxDatFinal.Text,
                IntToStr(RegExtrato._cadastro), 'CREDITO');

              // totaliza os valores de débito
              RegExtrato._debito :=
                (0 - lancamento.Totalizacao(frmExtrato.cxDatInicial.Text,
                frmExtrato.cxDatFinal.Text, IntToStr(RegExtrato._cadastro),
                'DEBITO'));
              // apanha o valor a debitar da restrição do agente

              RegExtrato._restricao :=
                (0 - restricao.RetornaDebito(RegExtrato._codigoentregador));
              RegExtrato._subtotal := RegExtrato._entrega * RegExtrato._verba;
              RegExtrato._valvolumesextra := RegExtrato._qtdvolumesextra *
                RegExtrato._verba;
              RegExtrato._total := RegExtrato._subtotal +
                RegExtrato._valvolumesextra + RegExtrato._credito +
                RegExtrato._debito + RegExtrato._restricao +
                RegExtrato._valorabastecimento;

              if (RegExtrato._total <> 0) or (RegExtrato._entrega <> 0) then
              begin
                dm.tbExtrato.IsLoading := True;
                dm.tbExtrato.Insert;
                dm.tbExtratoCOD_AGENTE.Value := RegExtrato._codigoagente;
                dm.tbExtratoDES_AGENTE.Value := RegExtrato._nomeagente;
                dm.tbExtratoCOD_ENTREGADOR.Value :=
                  RegExtrato._codigoentregador;
                dm.tbExtratoDES_ENTREGADOR.Value := RegExtrato._nomeentregador;
                dm.tbExtratoQTD_VOLUMES.Value := RegExtrato._volumes;
                dm.tbExtratoQTD_ENTREGA.Value := RegExtrato._entrega;
                dm.tbExtratoVAL_VERBA.Value := RegExtrato._verba;
                dm.tbExtratoVAL_VERBA_TOTAL.Value := 0;
                dm.tbExtratoVAL_CREDITO.Value := RegExtrato._credito;
                dm.tbExtratoVAL_DEBITO.Value := RegExtrato._debito;
                dm.tbExtratoVAL_RESTRICAO.Value := RegExtrato._restricao;
                dm.tbExtratoVAL_SUB_TOTAL.Value := 0;
                dm.tbExtratoQTD_VOLUMES_EXTRA.Value :=
                  RegExtrato._qtdvolumesextra;
                dm.tbExtratoVAL_VOLUMES_EXTRA.Value :=
                  RegExtrato._valpercentualEnt;
                dm.tbExtratoVAL_TOTAL.Value := 0;
                dm.tbExtratoVAL_ABASTECIMENTO.Value :=
                  RegExtrato._valorabastecimento;
                dm.tbExtratoVAL_TOTAL_DESCONTOS.Value := 0;
                dm.tbExtratoVAL_TOTAL_CREDITOS.Value := 0;
                dm.tbExtratoVAL_TOTAL_GERAL.Value := RegExtrato._total;
                dm.tbExtratoQTD_ATRASOS.Value := RegExtrato._atrasos;
                dm.tbExtratoQTD_2_DIAS.Value := 0;
                dm.tbExtratoQTD_MAIS_DIAS.Value := 0;
                dm.tbExtrato.Post;
                dm.tbExtrato.IsLoading := False;
              end;
            end;
            dm.qryGeral.Next;
          end;
        end
        else
        begin
          RegExtrato._codigoagente := dm.qryGetObject.FieldByName('COD_AGENTE')
            .AsInteger;
          RegExtrato._nomeentregador := dm.qryGetObject.FieldByName
            ('NOM_FANTASIA').AsString;
          RegExtrato._volumes := 0;
          RegExtrato._entrega := 0;
          RegExtrato._atrasos := 0;
          RegExtrato._qtdvolumesextra := 0;
          RegExtrato._cadastro := dm.qryGetObject.FieldByName('COD_CADASTRO')
            .AsInteger;
          dVerbaEnt := dm.qryGetObject.FieldByName('VAL_VERBA').AsFloat;
          sGrupoEnt := dm.qryGetObject.FieldByName('COD_GRUPO').AsString;
          if TUtil.Empty(sGrupoEnt) then
          begin
            sGrupoEnt := '0';
          end;
          if uGlobais.lAgentes.IndexOf(IntToStr(RegExtrato._codigoagente)) > -1
          then
          begin
            agente.Codigo := IntToStr(RegExtrato._codigoagente);
            sAgente := agente.getField('NOM_FANTASIA', 'CODIGO');
            if TUtil.Empty(sAgente) then
            begin
              sAgente := 'ADM. CEP NÃO CADASTRADO';
            end;
            RegExtrato._nomeagente := IntToStr(RegExtrato._codigoagente) + ' - '
              + sAgente;
            sVerba := agente.getField('VAL_VERBA', 'CODIGO');
            if TUtil.Empty(sVerba) then
            begin
              sVerba := '0';
            end;
            dVerbaAge := StrToFloat(sVerba);
            sGrupoAge := agente.getField('COD_GRUPO', 'CODIGO');;
            if TUtil.Empty(sGrupoAge) then
            begin
              sGrupoAge := '0';
            end;
            if sGrupoAge <> '0' then
            begin
              sGrupo := sGrupoAge;
            end;
            if sGrupoEnt <> '0' then
            begin
              sGrupo := sGrupoEnt;
            end;
            if sGrupo <> '0' then
            begin
              if RegExtrato._entrega > 0 then
              begin
                if bCLA then
                begin
                  RegExtrato._valpercentualEnt :=
                    100 - ((RegExtrato._atrasos / RegExtrato._entrega) * 100);
                end
                else
                begin
                  RegExtrato._valpercentualEnt := 100;
                end;
                if verba.RetornaVerba(sGrupo, RegExtrato._valpercentualEnt) then
                begin
                  RegExtrato._verba := verba.verba;
                  RegExtrato._valpercentualEnt := verba.Percentual;
                end;
              end
              else
              begin
                RegExtrato._valpercentualEnt := 0;
                RegExtrato._verba := 0;
                RegExtrato._valpercentualEnt := 0;
              end;
            end;
            if dVerbaAge > 0 then
            begin
              RegExtrato._verba := dVerbaAge;
            end;
            if dVerbaEnt > 0 then
            begin
              RegExtrato._verba := dVerbaEnt;
            end;

            // verifica se período de abastecimento foi informado. Se foi, totaliza o período informado.

            if not(TUtil.Empty(frmExtrato.cxFinalAbastecimento.Text)) then
            begin
              sInicio := frmExtrato.cxInicioAbastecimento.Text;
              RegExtrato._inicioabastecimento := StrToDate(sInicio);
              RegExtrato._finalabastecimento :=
                frmExtrato.cxFinalAbastecimento.Date;
              RegExtrato._valorabastecimento :=
                0 - (abastecimento.TotalPeriodo(sInicio,
                frmExtrato.cxFinalAbastecimento.Text,
                IntToStr(RegExtrato._cadastro)));
            end
            else
            begin
              RegExtrato._inicioabastecimento := 0;
              RegExtrato._finalabastecimento := 0;
              RegExtrato._valorabastecimento := 0;
            end;

            // totaliza os valores de crédito
            RegExtrato._credito := lancamento.Totalizacao
              (frmExtrato.cxDatInicial.Text, frmExtrato.cxDatFinal.Text,
              IntToStr(RegExtrato._cadastro), 'CREDITO');

            // totaliza os valores de débito
            RegExtrato._debito :=
              (0 - lancamento.Totalizacao(frmExtrato.cxDatInicial.Text,
              frmExtrato.cxDatFinal.Text, IntToStr(RegExtrato._cadastro),
              'DEBITO'));
            // apanha o valor a debitar da restrição do agente

            RegExtrato._restricao :=
              (0 - restricao.RetornaDebito(RegExtrato._codigoentregador));

            RegExtrato._subtotal := RegExtrato._entrega * RegExtrato._verba;
            RegExtrato._valvolumesextra := RegExtrato._qtdvolumesextra *
              RegExtrato._verba;
            RegExtrato._total := RegExtrato._subtotal +
              RegExtrato._valvolumesextra + RegExtrato._credito +
              RegExtrato._debito + RegExtrato._restricao +
              RegExtrato._valorabastecimento;
            if (RegExtrato._total <> 0) or (RegExtrato._entrega <> 0) then
            begin
              dm.tbExtrato.IsLoading := True;
              dm.tbExtrato.Insert;
              dm.tbExtratoCOD_AGENTE.Value := RegExtrato._codigoagente;
              dm.tbExtratoDES_AGENTE.Value := RegExtrato._nomeagente;
              dm.tbExtratoCOD_ENTREGADOR.Value := RegExtrato._codigoentregador;
              dm.tbExtratoDES_ENTREGADOR.Value := RegExtrato._nomeentregador;
              dm.tbExtratoQTD_VOLUMES.Value := RegExtrato._volumes;
              dm.tbExtratoQTD_ENTREGA.Value := RegExtrato._entrega;
              dm.tbExtratoVAL_VERBA.Value := RegExtrato._verba;
              dm.tbExtratoVAL_VERBA_TOTAL.Value := 0;
              dm.tbExtratoVAL_CREDITO.Value := RegExtrato._credito;
              dm.tbExtratoVAL_DEBITO.Value := RegExtrato._debito;
              dm.tbExtratoVAL_RESTRICAO.Value := RegExtrato._restricao;
              dm.tbExtratoVAL_SUB_TOTAL.Value := 0;
              dm.tbExtratoQTD_VOLUMES_EXTRA.Value :=
                RegExtrato._qtdvolumesextra;
              dm.tbExtratoVAL_VOLUMES_EXTRA.Value :=
                RegExtrato._valpercentualEnt;
              dm.tbExtratoVAL_TOTAL.Value := 0;
              dm.tbExtratoVAL_ABASTECIMENTO.Value :=
                RegExtrato._valorabastecimento;
              dm.tbExtratoVAL_TOTAL_DESCONTOS.Value := 0;
              dm.tbExtratoVAL_TOTAL_CREDITOS.Value := 0;
              dm.tbExtratoVAL_TOTAL_GERAL.Value := RegExtrato._total;
              dm.tbExtratoQTD_ATRASOS.Value := RegExtrato._atrasos;
              dm.tbExtratoQTD_2_DIAS.Value := 0;
              dm.tbExtratoQTD_MAIS_DIAS.Value := 0;
              dm.tbExtrato.Post;
              dm.tbExtrato.IsLoading := False;
            end;
          end;
        end;
      end;

      dm.qryGetObject.Next;
      iConta := iConta + 1;
      dPosicao := (iConta / iTotal) * 100;
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
        verba.Free;
        Abort;
      end;
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
  end;
end;

procedure thrCalculaExtratoFiltroAgente.LimpaRecord;
begin
  with RegExtrato do
  begin
    _codigoagente := 0;
    _nomeagente := '';
    _codigoentregador := 0;
    _nomeentregador := '';
    _valpercentualEnt := 0;
    _verba := 0;
    _volumes := 0;
    _entrega := 0;
    _subtotal := 0;
    _qtdvolumesextra := 0;
    _valvolumesextra := 0;
    _atrasos := 0;
    _credito := 0;
    _debito := 0;
    _restricao := 0;
    _valorabastecimento := 0;
    _total := 0;
    _datapagamento := 0;
    _inicioabastecimento := 0;
    _finalabastecimento := 0;
    _datafechamento := 0;
    _cadastro := 0;
  end;
end;

procedure thrCalculaExtratoFiltroAgente.AtualizaProgress;
begin
  frmExtrato.cxProgressBar.Visible := True;

  frmExtrato.cxProgressBar.Position := Round(dPosicao);
  frmExtrato.cxProgressBar.Properties.Text := IntToStr(Round(dPosicao)) + '%';
  frmExtrato.cxProgressBar.Refresh;

end;

procedure thrCalculaExtratoFiltroAgente.TerminaProcesso;
begin
  frmExtrato.cxGrid1DBTableView1.OptionsView.NoDataToDisplayInfoText :=
    '<Nenhuma Informação Disponível>';
  frmExtrato.cxProgressBar.Visible := False;
  frmExtrato.cxProgressBar.Properties.Text := '';
  frmExtrato.cxProgressBar.Position := 0;
  frmExtrato.cxProgressBar.Clear;
  frmExtrato.dsExtrato.Enabled := True;
  if not(dm.tbExtrato.IsEmpty) then
  begin
    frmExtrato.actFechamentoExportarResumo.Enabled := True;
    frmExtrato.actFechamentoExportarEntregas.Enabled := True;
    frmExtrato.actFechamentoFechar.Enabled := True;
    frmExtrato.actFechamentoCancelarFechamento.Enabled := False;
  end;
  frmExtrato.actExtratoCalcular.Enabled := True;
  frmExtrato.cxGrid1DBTableView1.ViewData.Expand(True);
  Application.MessageBox('Processo concluído.', 'Calculando Extrato',
    MB_OK + MB_ICONINFORMATION);
end;

procedure thrCalculaExtratoFiltroAgente.IniciaProcesso;
begin
  frmExtrato.cxGrid1DBTableView1.OptionsView.NoDataToDisplayInfoText :=
    '<Atualizando a grade. Aguarde...>';
  frmExtrato.actFechamentoExportarResumo.Enabled := False;
  frmExtrato.actFechamentoExportarEntregas.Enabled := False;
  frmExtrato.actExtratoCalcular.Enabled := False;
  frmExtrato.actFechamentoFechar.Enabled := False;
  frmExtrato.actFechamentoCancelarFechamento.Enabled := False;
  frmExtrato.cxProgressBar.Clear;
end;

end.
