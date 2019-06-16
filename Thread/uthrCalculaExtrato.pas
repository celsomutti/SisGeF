unit uthrCalculaExtrato;

interface

uses
  System.Classes, clAgentes, clEntregador, clEntrega, clExtrato, clLancamentos, clAbastecimentos,
  clRestricoes, clPlanilhaCredito, clUtil, udm, Dialogs, Windows, Forms, SysUtils, Messages, Controls,
  System.DateUtils, clGruposVerba;

type
  TRegExtrato = record
    _codigoagente         : Integer;
    _nomeagente           : String;
    _codigoentregador     : Integer;
    _nomeentregador       : String;
    _valpercentualEnt     : Double;
    _verba                : Double;
    _volumes              : Integer;
    _entrega              : Integer;
    _qtdvolumesextra      : Double;
    _atrasos              : Integer;
    _credito              : Double;
    _debito               : Double;
    _restricao            : Double;
    _valorabastecimento   : Double;
    _total                : Double;
    _datapagamento        : TDateTime;
    _inicioabastecimento  : TDateTime;
    _finalabastecimento   : TDateTime;
    _datafechamento       : TDateTime;
    _cadastro             : Integer;
    end;
  thrCalculaExtrato = class(TThread)
  private
    { Private declarations }
    agente        : TAgente;
    entregador    : TEntregador;
    entrega       : TEntrega;
    extrato       : TExtrato;
    lancamento    : TLancamentos;
    restricao     : TRestricoes;
    abastecimento : TAbastecimentos;
    planilha      : TPlanilhaCredito;
    RegExtrato    : TRegExtrato;
    verba         : TGruposVerba;

  protected
    procedure Execute; override;
    procedure LimpaRecord;
    procedure IniciaProcesso;
    procedure AtualizaProgress;
    procedure TerminaProcesso;
  end;

implementation


{ thrCalculaExtrato }

uses
  ufrmExtrato, uGlobais;

procedure thrCalculaExtrato.Execute;
var
  lLista                                                                                                                : TStringList;
  sFiltro, sAgente, sEntregador, sInicio, sGrupo, Linha, sPercentual, sVerba, sExpressaIni, sExpressaFim, sGrupoAgente  : String;
  iConta,Contador, LinhasTotal,i, iTotalEntregas, iAtrasos, ch, iFiltro                                                 : Integer;
  bFlag                                                                                                                 : Boolean;
  dPercentual, dVerba, dAtraso, dPercentualAgente, dVerbaEnt                                                            : Double;
   // Lê Linha e Monta os valores
  function MontaValor: String;
  var
    ValorMontado: String;
  begin
    ValorMontado := '';
    inc(ch);
    While Linha[ch] >= ' ' do
    begin
      If Linha[ch] = ';' then // vc pode usar qualquer delimitador ... eu
        // estou usando o ";"
        break;
      ValorMontado := ValorMontado + Linha[ch];
      Inc(ch);
    end;
    result := ValorMontado;
  end;
begin
  agente          :=  TAgente.Create();
  entregador      :=  TEntregador.Create();
  entrega         :=  TEntrega.Create();
  extrato         :=  TExtrato.Create();
  lancamento      :=  TLancamentos.Create();
  restricao       :=  TRestricoes.Create();
  abastecimento   :=  TAbastecimentos.Create();
  planilha        :=  TPlanilhaCredito.Create();
  verba           :=  TGruposVerba.Create();
  lLista          :=  TStringList.Create();
try
  Synchronize(IniciaProcesso);
  sExpressaIni  :=  frmExtrato.cxDatInicial.Text;
  sExpressaFim  :=  frmExtrato.cxDatFinal.Text;
  iFiltro       :=  frmExtrato.cxFiltro.ItemIndex;
  if frmExtrato.cxTipoPeriodo.ItemIndex = 0 then begin
    sFiltro :=  'BAIXA';
  end
  else if frmExtrato.cxTipoPeriodo.ItemIndex = 1 then begin
    sFiltro :=  'ATRIBUICAO';
  end;
  if uGlobais.lAgentes.Count > 0 then begin
    for i := 0 to uGlobais.lAgentes.Count - 1 do begin
      LimpaRecord;
      if iFiltro = 0 then begin
        if entregador.getObject(uGlobais.lAgentes[i], 'AGENTE') then begin
          while not (dm.qryGetObject.Eof) do begin
            sGrupo            :=  '0';
            dPercentual       :=  0;
            dVerba            :=  0;
            dVerbaEnt         :=  0;
            if dm.qryGetObject.FieldByName('COD_ENTREGADOR').AsInteger > 0 then begin
              if (dm.qryGetObject.FieldByName('DOM_FUNCIONARIO').AsString = 'E') and (dm.qryGetObject.FieldByName('COD_STATUS').AsInteger >= 0) then begin
                agente.Codigo   :=  dm.qryGetObject.FieldByName('COD_AGENTE').AsString;
                sGrupo          :=  agente.getField('COD_GRUPO','CODIGO');
                dVerbaEnt       :=  dm.qryGetObject.FieldByName('VAL_VERBA').AsFloat;
                if TUtil.Empty(sGrupo) then begin
                  sGrupo    :=  '0';
                end;
                dPercentual     :=  0;
                dVerba          :=  0;
                RegExtrato._codigoentregador  :=  dm.qryGetObject.FieldByName('COD_ENTREGADOR').AsInteger;
                RegExtrato._nomeentregador    :=  dm.qryGetObject.FieldByName('NOM_FANTASIA').AsString;
                RegExtrato._atrasos           :=  entrega.PrazoExtrato(sExpressaIni,sExpressaFim,'',IntToStr(RegExtrato._codigoentregador),'99');
                if entrega.TotalPeriodo(sExpressaIni,sExpressaFim,uGlobais.lAgentes[i],IntToStr(RegExtrato._codigoentregador), sFiltro) then begin
                  RegExtrato._volumes :=  dm.qryGeral.FieldByName('VOLUMES').AsInteger;
                  RegExtrato._entrega :=  dm.qryGeral.FieldByName('ENTREGAS').AsInteger;
                end
                else begin
                  RegExtrato._volumes :=  0;
                  RegExtrato._entrega :=  0;
                end;
                dm.qryGeral.Close;
                dm.qryGeral.SQL.Clear;

                if sGrupo <> '0' then begin
                  if RegExtrato._entrega > 0 then begin
                     RegExtrato._valpercentualEnt :=  100 - ((RegExtrato._atrasos / RegExtrato._entrega) * 100);
                  end
                  else begin
                    RegExtrato._valpercentualEnt  :=  0;
                  end;
                  if verba.RetornaVerba(sGrupo, RegExtrato._valpercentualEnt) then begin
                    RegExtrato._verba             :=  verba.Verba;
                    RegExtrato._valpercentualEnt  :=  verba.Percentual;
                  end;
                end
                 else begin
                  sVerba          :=  agente.getField('VAL_VERBA','CODIGO');
                  if TUtil.Empty(sVerba) then begin
                    sVerba  :=  '0';
                  end;
                  dVerba          :=  StrToFloat(sVerba);
                end;
                if dVerba = 0 then begin
                  sGrupo                        :=  dm.qryGetObject.FieldByName('COD_GRUPO').AsString;
                  if TUtil.Empty(sGrupo) then begin
                    sGrupo             :=  '0';
                  end;
                  if sGrupo <> '0' then begin
                    if RegExtrato._entrega > 0 then begin
                       RegExtrato._valpercentualEnt :=  100 - ((RegExtrato._atrasos / RegExtrato._entrega) * 100);
                    end
                    else begin
                      RegExtrato._valpercentualEnt  :=  0;
                    end;
                    if verba.RetornaVerba(sGrupo, RegExtrato._valpercentualEnt) then begin
                      RegExtrato._verba             :=  verba.Verba;
                      RegExtrato._valpercentualEnt  :=  verba.Percentual;
                    end;
                  end
                end;
                if dVerbaEnt <> 0 then begin
                  RegExtrato._verba :=  dVerbaEnt;
                end
                else begin
                  RegExtrato._verba :=  dVerba;
                end;
              end;
            end;
            dm.qryGetObject.Next;
          end;
        end;
      end
      else begin
        RegExtrato._codigoentregador  :=  StrToInt(uGlobais.lAgentes[i]);
        if entrega.TotalPeriodo(sExpressaIni,sExpressaFim,'',IntToStr(RegExtrato._codigoentregador), sFiltro) then begin
          while (not dm.qryGeral.Eof) do begin
            sGrupo              :=  '0';
            dPercentual         :=  0;
            dVerba              :=  0;
            RegExtrato._volumes :=  dm.qryGeral.FieldByName('VOLUMES').AsInteger;
            RegExtrato._entrega :=  dm.qryGeral.FieldByName('ENTREGAS').AsInteger;
            agente.Codigo       :=  dm.qryGeral.FieldByName('COD_AGENTE').AsString;
            RegExtrato._atrasos :=  entrega.PrazoExtrato(sExpressaIni,sExpressaFim,'',IntToStr(RegExtrato._codigoentregador),'99');
            sGrupo              :=  agente.getField('COD_GRUPO','CODIGO');
            if TUtil.Empty(sGrupo) then begin
              sGrupo    :=  '0';
            end;
            if sGrupo <> '0' then begin
              if RegExtrato._entrega > 0 then begin
                 RegExtrato._valpercentualEnt :=  100 - ((RegExtrato._atrasos / RegExtrato._entrega) * 100);
              end
              else begin
                RegExtrato._valpercentualEnt  :=  0;
              end;
              if verba.RetornaVerba(sGrupo, RegExtrato._valpercentualEnt) then begin
                RegExtrato._verba             :=  verba.Verba;
                RegExtrato._valpercentualEnt  :=  verba.Percentual;
              end;
            end
            else begin
              sVerba :=  agente.getField('VAL_VERBA','CODIGO');
              if TUtil.Empty(sVerba) then begin
                sVerba :=  '0';
              end;
              RegExtrato._verba :=  StrToFloat(sVerba);
            end;
            if entregador.getObject(dm.qryGeral.FieldByName('COD_ENTREGADOR').AsString, 'CODIGO') then begin
              RegExtrato._codigoentregador  :=  dm.qryGetObject.FieldByName('COD_ENTREGADOR').AsInteger;
              RegExtrato._nomeentregador    :=  dm.qryGetObject.FieldByName('NOM_FANTASIA').AsString;
              if RegExtrato._verba = 0 then begin
                sGrupo      :=  dm.qryGetObject.FieldByName('COD_GRUPO').AsString;
                if sGrupo <> '0' then begin
                  if RegExtrato._entrega > 0 then begin
                    RegExtrato._valpercentualEnt :=  100 - ((RegExtrato._atrasos / RegExtrato._entrega) * 100);
                  end
                  else begin
                    RegExtrato._valpercentualEnt  :=  0;
                  end;
                  if verba.RetornaVerba(sGrupo, RegExtrato._valpercentualEnt) then begin
                    RegExtrato._verba             :=  verba.Verba;
                    RegExtrato._valpercentualEnt  :=  verba.Percentual;
                  end;
                end
                else begin
                  RegExtrato._verba :=  0;
                end;
              end;
              if dVerbaEnt <> 0 then begin
                RegExtrato._verba :=  dVerbaEnt;
              end;
            end
            else begin
              RegExtrato._codigoentregador  :=  dm.qryGeral.FieldByName('COD_ENTREGADOR').AsInteger;
              RegExtrato._nomeentregador    :=  'NÃO CADASTRADO';
            end;
            dm.qryGeral.Next;
          end;
        end;
      end;
    end;
  end;

  contador  :=  0;

  if dm.tbExtrato.Active then
    dm.tbExtrato.Close;
  dm.tbExtrato.Open;

  bFlag   :=  False;
  sAgente :=  '';
  iTotal  :=  lLista.Count;

  for contador := 0 to iTotal - 1 do begin
    LimpaRecord;
    ch          :=  0;
    Linha       :=  lLista[contador];
    sEntregador :=  MontaValor;
    sVerba      :=  MontaValor;
    sPercentual :=  MontaValor;
    sGrupo      :=  MontaValor;
    ch          :=  0;
    // localiza os dados do entregador e agente

    if entregador.getObject(sEntregador,'CODIGO') then begin
      RegExtrato._codigoentregador  :=  StrToInt(entregador.Codigo);
      RegExtrato._nomeentregador    :=  entregador.Alias;
      RegExtrato._codigoagente      :=  entregador.Agente;
      RegExtrato._cadastro          :=  entregador.Cadastro;
      if agente.getObject(IntToStr(RegExtrato._codigoagente),'CODIGO') then begin
        RegExtrato._nomeagente  :=  agente.Fantasia;
      end
      else begin
        RegExtrato._nomeagente  :=  'AGENTE ' + IntToStr(RegExtrato._codigoagente);
      end;
    end
    else begin
      RegExtrato._codigoentregador  :=  StrToInt(entregador.Codigo);
      RegExtrato._nomeentregador    :=  'ENTREGADOR ' + entregador.Codigo;
      RegExtrato._codigoagente      :=  0;
      RegExtrato._nomeagente        :=  'AGENTE 0';
      RegExtrato._cadastro          :=  0;
    end;

    //totaliza as entregas baixadas no período especificado

    dAtraso :=  0;
    if entrega.TotalPeriodo(sExpressaIni,sExpressaFim,IntToStr(RegExtrato._codigoagente),IntToStr(RegExtrato._codigoentregador),sFiltro) then begin
      RegExtrato._volumes         :=  dm.qryGeral.FieldByName('VOLUMES').AsInteger;
      RegExtrato._entrega         :=  dm.qryGeral.FieldByName('ENTREGAS').AsInteger;
      dVerba                      :=  StrToFloat(sVerba);
      {if sGrupo = '0' then begin
        dVerba                        :=  StrToFloat(sVerba);
      end
      else begin
        sGrupo      :=  IntToStr(entregador.Grupo);
        if sGrupo <> '0' then begin
          iAtrasos    :=  entrega.PrazoExtrato(sExpressaIni,sExpressaFim,IntToStr(entregador.Agente),entregador.Codigo,'99');
          dPercentual :=  100 - ((iAtrasos / RegExtrato._entrega) * 100);
          if verba.RetornaVerba(sGrupo,dPercentual) then begin
            dVerba      :=  verba.Verba;
            dPercentual :=  verba.Percentual;
          end
          else begin
            dVerba  :=  0;
          end;
        end;
      end;
      if iAtrasos > 0 then begin
        dAtraso :=  (dVerba / 2) * iAtrasos;
      end;}
      RegExtrato._verbatotal      :=  (dVerba * dm.qryGeral.FieldByName('ENTREGAS').AsInteger) {- dAtraso};
      RegExtrato._qtdvolumesextra :=  dm.qryGeral.FieldByName('EXTRA').AsFloat;
      RegExtrato._valvolumesextra :=  dVerba * dm.qryGeral.FieldByName('EXTRA').AsFloat;
    end
    else begin
      RegExtrato._volumes         :=  0;
      RegExtrato._entrega         :=  0;
      RegExtrato._verbatotal      :=  0;
      RegExtrato._qtdvolumesextra :=  0;
      RegExtrato._valvolumesextra :=  0;
    end;

    //verifica se período de abastecimento foi informado. Se foi, totaliza o período informado.

    if not (TUtil.Empty(frmExtrato.cxFinalAbastecimento.Text)) then begin
      {if DayOf(frmExtrato.cxFinalAbastecimento.Date) = 15  then begin
        sInicio :=  '01' + Copy(frmExtrato.cxFinalAbastecimento.Text,3,8);
      end
      else begin
        sInicio :=  '16' + Copy(frmExtrato.cxFinalAbastecimento.Text,3,8);
      end;}
      sInicio :=  DateToStr(frmExtrato.cxFinalAbastecimento.Date - 45);
      RegExtrato._inicioabastecimento :=  StrToDate(sInicio);
      RegExtrato._finalabastecimento  :=  frmExtrato.cxFinalAbastecimento.Date;
      RegExtrato._valorabastecimento  :=  0 - (abastecimento.TotalPeriodo(sInicio,frmExtrato.cxFinalAbastecimento.Text,
                                               IntToStr(RegExtrato._cadastro)));
    end
    else begin
      RegExtrato._inicioabastecimento :=  0;
      RegExtrato._finalabastecimento  :=  0;
      RegExtrato._valorabastecimento  :=  0;
    end;

    //totaliza os valores de crédito
    RegExtrato._credito   :=  lancamento.Totalizacao(frmExtrato.cxDatInicial.Text,frmExtrato.cxDatFinal.Text,IntToStr(RegExtrato._cadastro),'CREDITO');

    //totaliza os valores de débito
    RegExtrato._debito    :=  ( 0 - lancamento.Totalizacao(frmExtrato.cxDatInicial.Text,frmExtrato.cxDatFinal.Text,IntToStr(RegExtrato._cadastro),'DEBITO'));

    //apanha o valor a debitar da restrição do agente

    if restricao.getObject(IntToStr(RegExtrato._codigoentregador),'ENTREGADOR') then begin
      RegExtrato._restricao := (0 - restricao.Debitar);
    end
    else if restricao.getObject(IntToStr(RegExtrato._codigoentregador),'AGENTE') then begin
      if Pos(IntToStr(RegExtrato._codigoagente),sAgente) = 0 then begin
        RegExtrato._restricao := (0 - restricao.Debitar);
        if not (TUtil.Empty(sAgente)) then begin
          sAgente :=  sAgente + ',';
        end;
        sAgente :=  sAgente + Trim(IntToStr(RegExtrato._codigoagente));
      end
      else begin
        RegExtrato._restricao :=  0;
      end;
    end
    else begin
      RegExtrato._restricao :=  0;
    end;

    //calcula os dias de atraso

    RegExtrato._1diaatraso  :=  entrega.PrazoExtrato(frmExtrato.cxDatInicial.Text,frmExtrato.cxDatFinal.Text,'',IntToStr(RegExtrato._codigoentregador),'1');
    RegExtrato._2diasatraso  :=  entrega.PrazoExtrato(frmExtrato.cxDatInicial.Text,frmExtrato.cxDatFinal.Text,'',IntToStr(RegExtrato._codigoentregador),'2');
    RegExtrato._3diasatraso  :=  entrega.PrazoExtrato(frmExtrato.cxDatInicial.Text,frmExtrato.cxDatFinal.Text,'',IntToStr(RegExtrato._codigoentregador),'3');

    RegExtrato._subtotal        :=  RegExtrato._verbatotal + RegExtrato._credito + RegExtrato._debito + RegExtrato._restricao +
                                    RegExtrato._valorabastecimento;
    RegExtrato._total           :=  RegExtrato._subtotal + RegExtrato._valvolumesextra;
    RegExtrato._totaldescontos  :=  RegExtrato._debito + RegExtrato._restricao + RegExtrato._valorabastecimento;
    RegExtrato._totalcreditos   :=  RegExtrato._verbatotal + RegExtrato._credito + RegExtrato._valvolumesextra;
    RegExtrato._totalgeral      :=  RegExtrato._totalcreditos + RegExtrato._totaldescontos;

    if RegExtrato._totaldescontos = 0 then begin
      if RegExtrato._totalcreditos = 0 then begin
        if RegExtrato._entrega =  0 then begin
          bFlag :=  False;
        end
        else begin
          bFlag := True;
        end
      end
      else begin
        bFlag :=  True;
      end;
    end
    else begin
      bFlag :=  True;
    end;
    if bflag then begin
      dm.tbExtrato.IsLoading                 :=  True;
      dm.tbExtrato.Insert;
      dm.tbExtratoCOD_AGENTE.Value           :=  RegExtrato._codigoagente;
      dm.tbExtratoDES_AGENTE.Value           :=  IntToStr(RegExtrato._codigoagente) + '-' +  RegExtrato._nomeagente +
                                                 ' - ' + sPercentual + '% - Grupo ' + sGrupo;
      dm.tbExtratoCOD_ENTREGADOR.Value       :=  RegExtrato._codigoentregador;
      dm.tbExtratoDES_ENTREGADOR.Value       :=  RegExtrato._nomeentregador;
      dm.tbExtratoQTD_VOLUMES.Value          :=  RegExtrato._volumes;
      dm.tbExtratoQTD_ENTREGA.Value          :=  RegExtrato._entrega;
      if RegExtrato._entrega > 0 then begin
        dm.tbExtratoVAL_VERBA.Value  :=  RegExtrato._verbatotal / RegExtrato._entrega;
      end
      else begin
        dm.tbExtratoVAL_VERBA.Value  :=  0;
      end;
      dm.tbExtratoVAL_VERBA_TOTAL.Value      :=  RegExtrato._verbatotal;
      dm.tbExtratoVAL_CREDITO.Value          :=  RegExtrato._credito;
      dm.tbExtratoVAL_DEBITO.Value           :=  RegExtrato._debito;
      dm.tbExtratoVAL_RESTRICAO.Value        :=  RegExtrato._restricao;
      dm.tbExtratoVAL_SUB_TOTAL.Value        :=  RegExtrato._subtotal;
      dm.tbExtratoQTD_VOLUMES_EXTRA.Value    :=  RegExtrato._qtdvolumesextra;
      dm.tbExtratoVAL_VOLUMES_EXTRA.Value    :=  RegExtrato._valvolumesextra;
      dm.tbExtratoVAL_TOTAL.Value            :=  RegExtrato._total;
      dm.tbExtratoVAL_ABASTECIMENTO.Value    :=  RegExtrato._valorabastecimento;
      dm.tbExtratoVAL_TOTAL_DESCONTOS.Value  :=  RegExtrato._totaldescontos;
      dm.tbExtratoVAL_TOTAL_CREDITOS.Value   :=  RegExtrato._totalcreditos;
      dm.tbExtratoVAL_TOTAL_GERAL.Value      :=  RegExtrato._totalgeral;
      dm.tbExtratoQTD_1_DIA.Value            :=  RegExtrato._1diaatraso;
      dm.tbExtratoQTD_2_DIAS.Value           :=  RegExtrato._2diasatraso;
      dm.tbExtratoQTD_MAIS_DIAS.Value        :=  RegExtrato._3diasatraso;
      dm.tbExtrato.Post;
      dm.tbExtrato.IsLoading                 :=  False;
    end;
    iConta                          :=  contador + 1;
    dPosicao                        :=  (iConta / iTotal) * 100;
    if not (Self.Terminated) then begin
      Synchronize(AtualizaProgress);
    end
    else begin
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

procedure thrCalculaExtrato.LimpaRecord;
begin
  with RegExtrato do begin
    _codigoagente         :=  0;
    _nomeagente           :=  '';
    _codigoentregador     :=  0;
    _nomeentregador       :=  '';
    _valpercentualEnt     :=  0;
    _verba                :=  0;
    _volumes              :=  0;
    _entrega              :=  0;
    _qtdvolumesextra      :=  0;
    _atrasos              :=  0;
    _credito              :=  0;
    _debito               :=  0;
    _restricao            :=  0;
    _valorabastecimento   :=  0;
    _total                :=  0;
    _datapagamento        :=  0;
    _inicioabastecimento  :=  0;
    _finalabastecimento   :=  0;
    _datafechamento       :=  0;
    _cadastro             :=  0;
  end;
end;

procedure thrCalculaExtrato.AtualizaProgress;
begin
  frmExtrato.cxProgressBar.Visible          :=  True;

  frmExtrato.cxProgressBar.Position         :=  Round(dPosicao);
  frmExtrato.cxProgressBar.Properties.Text  :=  IntToStr(Round(dPosicao)) + '%';
  frmExtrato.cxProgressBar.Refresh;

end;

procedure thrCalculaExtrato.TerminaProcesso;
begin
  frmExtrato.cxGrid1DBBandedTableView1.OptionsView.NoDataToDisplayInfoText := '<Nenhuma Informação Disponível>';
  frmExtrato.cxProgressBar.Visible          :=  False;
  frmExtrato.cxProgressBar.Properties.Text  := '';
  frmExtrato.cxProgressBar.Position         :=  0;
  frmExtrato.cxProgressBar.Clear;
  frmExtrato.dsExtrato.Enabled  :=  True;
  if not (dm.tbExtrato.IsEmpty) then begin
    frmExtrato.actFechamentoExportarResumo.Enabled      :=  True;
    frmExtrato.actFechamentoExportarEntregas.Enabled    :=  True;
    frmExtrato.actFechamentoFechar.Enabled              :=  True;
    frmExtrato.actFechamentoCancelarFechamento.Enabled  :=  False;
  end;
  frmExtrato.actExtratoCalcular.Enabled               :=  True;
  frmExtrato.cxGrid1DBBandedTableView1.ViewData.Expand(True);
  Application.MessageBox('Processo concluído.', 'Calculando Extrato', MB_OK + MB_ICONINFORMATION);
end;

procedure thrCalculaExtrato.IniciaProcesso;
begin
  frmExtrato.cxGrid1DBBandedTableView1.OptionsView.NoDataToDisplayInfoText := '<Atualizando a grade. Aguarde...>';
  frmExtrato.actFechamentoExportarResumo.Enabled      :=  False;
  frmExtrato.actFechamentoExportarEntregas.Enabled    :=  False;
  frmExtrato.actExtratoCalcular.Enabled               :=  False;
  frmExtrato.actFechamentoFechar.Enabled              :=  False;
  frmExtrato.actFechamentoCancelarFechamento.Enabled  :=  False;
  frmExtrato.cxProgressBar.Clear;
end;


end.
