  unit uthrImportarBaixas;

interface

uses
  System.Classes, Dialogs, Windows, Forms, SysUtils, clUtil, clBaixas,
  clCodigosEntregadores, clStatus, clAgentes, clEntrega,
  Messages, Controls, System.DateUtils, Model.ControleBaixasTFO, DAO.ControleBaixasTFO, Generics.Collections, clCliente;

type
  TCSVBaixa = record
    _nossonumero: String;
    _dataentrega: String;
    _horaentrega: String;
    _recebedor: String;
    _grau: String;
    _documento: String;
    _codigoentregador: String;
    _nomeentregador: String;
    _atribuicao: String;
    _observacao: String;
    _usuario: String;
    _datadigitacao: String;
    _cliente: String;
    _pedido: String;
    _previsao: String;
    _codigoagenteTFO: String;
    _nomeagenteTFO: String;
    _pesocobrado: String;
    _tipopeso: String;
  end;

  thrImportaBaixas = class(TThread)
  private
    { Private declarations }
    baixa: TBaixa;
    entregador: TCodigosEntregadores;
    entrega: TEntrega;
    agentes: TAgente;
    cliente: TCliente;
    CSVBaixa: TCSVBaixa;
    codigoEntregador: TCodigosEntregadores;
    controle : TControleBaixasTFO;
    controleDAO : TControleBaixaTFODAO;
    controles : TObjectList<TControleBaixasTFO>;
  protected
    procedure Execute; override;
    procedure AtualizaLog;
    procedure AtualizaProgress;
    procedure TerminaProcesso;
    function TrataLinha(sLinha: String): String;
  end;

implementation

{
  Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

  Synchronize(UpdateCaption);

  and UpdateCaption could look like,

  procedure thrImportaBaixas.UpdateCaption;
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

{ thrImportaBaixas }

uses
  uGlobais, ufrmImportaBaixas;

function thrImportaBaixas.TrataLinha(sLinha: String): String;
var
  iConta: Integer;
  sLin: String;
  bFlag: Boolean;
begin

  if Pos('"', sLinha) = 0 then
  begin
    Result := sLinha;
    Exit;
  end;

  iConta := 1;
  bFlag := False;
  sLin := '';
  while sLinha[iConta] >= ' ' do
  begin
    if sLinha[iConta] = '"' then
    begin
      if bFlag then
        bFlag := False
      else
        bFlag := True;
    end;
    if bFlag then
    begin
      if sLinha[iConta] = ';' then
        sLin := sLin + ' '
      else
        sLin := sLin + sLinha[iConta];
    end
    else
      sLin := sLin + sLinha[iConta];
    Inc(iConta);
  end;
  Result := sLin;
end;

procedure thrImportaBaixas.Execute;
var
  ArquivoCSV: TextFile;
  Contador, I, LinhasTotal, iVolumes, iRet, iAtraso, iCadastro: Integer;
  Linha, campo, codigo, sDescricao, agente, sData, sMess, sCEP: String;
  dVerba: Double;
  bFlagPrimeiro, bFlagData: Boolean;
  d: Real;
  sBaixa: string;
  controleTMP : TControleBaixasTFO;
  aParam: Array of variant;
  dtDataArquivo: TDate;
  iStatusData: Integer;
  lLog: TStringList;
  // Lê Linha e Monta os valores
  function MontaValor: String;
  var
    ValorMontado: String;
  begin
    ValorMontado := '';
    Inc(I);
    While Linha[I] >= ' ' do
    begin
      If Linha[I] = ';' then // vc pode usar qualquer delimitador ... eu
        // estou usando o ";"
        break;
      ValorMontado := ValorMontado + Linha[I];
      Inc(I);
    end;
    Result := ValorMontado;
  end;

begin
  dVerba := 0;
  baixa := TBaixa.Create;
  entregador := TCodigosEntregadores.Create;
  entrega := TEntrega.Create;
  agentes := TAgente.Create;
  cliente := TCliente.Create;
  codigoEntregador := TCodigosEntregadores.Create;
  bFlagPrimeiro := False;
  controleDAO := TControleBaixaTFODAO.Create();
  controles := TObjectList<TControleBaixasTFO>.Create;
  LinhasTotal := TUtil.NumeroDeLinhasTXT(frmImportaBaixas.cxArquivo.Text);
  sCEP := '';
  // Carregando o arquivo ...
  AssignFile(ArquivoCSV, frmImportaBaixas.cxArquivo.Text);
  try
    Reset(ArquivoCSV);
    Readln(ArquivoCSV, Linha);
    sDescricao := Copy(Linha, 0, 69);
    if sDescricao <> 'CONSULTA DE PROTOCOLOS ENVIADOS PELA WEB DO CANAL DE ENTREGA EXPRESSA'
    then
    begin
      MessageDlg('Arquivo informado não é de ' + sDescricao + ' !', mtWarning,
        [mbOK], 0);
      Abort;
    end;
    Readln(ArquivoCSV, Linha);
    Readln(ArquivoCSV, Linha);
    Readln(ArquivoCSV, Linha);
    Linha := TrataLinha(Linha);
    Contador := 4;
    sData := '';
    bFlagPrimeiro := True;
    with CSVBaixa do
    begin
      _nossonumero := MontaValor;
      _dataentrega := MontaValor;
      _horaentrega := MontaValor;
      _recebedor := MontaValor;
      _grau := MontaValor;
      _documento := MontaValor;
      _codigoentregador := MontaValor;
      _nomeentregador := MontaValor;
      _atribuicao := MontaValor;
      _observacao := MontaValor;
      _usuario := MontaValor;
      _datadigitacao := MontaValor;
      _cliente := MontaValor;
      _pedido := MontaValor;
      _previsao := MontaValor;
      _codigoagenteTFO := MontaValor;
      _nomeagenteTFO := MontaValor;
      _pesocobrado := MontaValor;
      _tipopeso := MontaValor;
    end;
    I := 0;
    if TUtil.Empty(sData) then
    begin
      sData := DateToStr(StrToDate(Copy(CSVBaixa._datadigitacao, 1, 10)));
    end;
    bFlagData := False;
    dtDataArquivo := controleDAO.MaxDate(StrToDate(sData));
    if dtDataArquivo = 0 then
    begin
      dtDataArquivo := StrToDate(sData);
    end
    else
    begin
      dtDataArquivo:= IncDay(dtDataArquivo,1);
    end;

    SetLength(aParam,2);
    aParam[0] := 'DATA';
    aparam[1] := StrToDate(sData);
    controles := controleDAO.Find(aParam);
    Finalize(aParam);
    if controles.Count > 0 then
    begin
      if controles[0].Status < 3 then
      begin
        if Application.MessageBox(PChar('Arquivo de Baixas do dia ' + sData + ' já importado. Confirma a importação novamente?'), 'Importar', MB_YESNO + MB_ICONQUESTION) = IDNO then
        begin
          Exit;
        end
        else
        begin
          iStatusData := 2;
          bFlagData := True;
        end;
      end
      else
      begin
        if Application.MessageBox(PChar('Foi registrado que na data de ' + sData + ' não havia importação. Confirma a importação sdesta data?'), 'Importar', MB_YESNO + MB_ICONWARNING) = IDNO then
        begin
          Exit;
        end
        else
        begin
          iStatusData := 2;
          bFlagData := True;
        end;
      end;
    end
    else
    begin
      iStatusData := 1;
    end;
    if not bFlagData then
    begin
      if StrToDate(sData) <> dtDataArquivo then
      begin
        sMess := 'A próxima data de baixa a ser importada é de ' +  DateToStr((dtDataArquivo)) + ' ! Confirma a importação assim mesmo? ';
        if Application.MessageBox(pChar(sMess), 'Atenção', MB_YESNO + MB_ICONWARNING) = IDNO then
        begin
          Exit;
        end
        else
        begin
          iStatusData := 3;
          while dtDataArquivo <  StrToDate(sData) do
          begin
            SetLength(aParam,2);
            aParam[0] := 'DATA';
            aparam[1] := dtDataArquivo;
            controles := controleDAO.Find(aParam);
            Finalize(aParam);
            if controles.Count = 0 then
            begin
              controle := TControleBaixasTFO.Create;
              controle.Id := 0;
              controle.Data := dtDataArquivo;
              controle.Status := iStatusData;
              controle.Log :=  FormatDateTime('dd/mm/yyyy hh:mm:ss', Now()) + ' data sem importação. Processada por ' + uGlobais.sUsuario;
              if not controleDAO.Insert(controle) then
              begin
                Application.MessageBox('Erro ao salvar a data no controle!', 'Atenção', MB_OK + MB_ICONERROR);
              end;
              controle.Free;
            end;
            dtDataArquivo := IncDay(dtDataArquivo,1);
          end;
          dtDataArquivo := StrToDate(sData);
          iStatusData := 1;
        end;
      end;
    end;
    SetLength(aParam,2);
    aParam[0] := 'DATA';
    aparam[1] := StrToDate(sData);
    controles := controleDAO.Find(aParam);
    Finalize(aParam);
    if controles.Count = 0 then
    begin
      controle := TControleBaixasTFO.Create;
      controle.Id := 0;
      controle.Data := dtDataArquivo;
      if iStatusData < 3 then
      begin
        controle.Status := iStatusData;
      end
      else
      begin
        controle.Status := 2
      end;
      if iStatusData = 1 then
      begin
        controle.Log :=  FormatDateTime('dd/mm/yyyy hh:mm:ss', Now()) + ' importação em ordem feita por ' + uGlobais.sUsuario;
      end
      else if iStatusData = 2 then
      begin
        controle.Log :=  FormatDateTime('dd/mm/yyyy hh:mm:ss', Now()) + ' re-importação feita por ' + uGlobais.sUsuario;
      end
      else
      begin
        controle.Log :=  FormatDateTime('dd/mm/yyyy hh:mm:ss', Now()) + ' data sem importação. Processada por ' + uGlobais.sUsuario;
      end;
      if not controleDAO.Insert(controle) then
      begin
        Application.MessageBox('Erro ao salvar a data no controle!', 'Atenção', MB_OK + MB_ICONERROR);
      end;
    end
    else
    begin
      lLog := TStringList.Create;
      controle := TControleBaixasTFO.Create;
      controle.Id := controles[0].Id;
      controle.Data := controles[0].Data;
      controle.Status := iStatusData;
      lLog.Add(controle.Log);
      lLog.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now()) + ' re-importação feita por ' + uGlobais.sUsuario);
      controle.Log := lLog.Text;
      if not controleDAO.Update(controle) then
      begin
        Application.MessageBox('Erro ao alterar a data no controle!', 'Atenção', MB_OK + MB_ICONERROR);
      end;
    end;
    while not Eoln(ArquivoCSV) do
    begin
      dVerba := 0;
      iVolumes := 1;
      if not(bFlagPrimeiro) then
      begin
        Readln(ArquivoCSV, Linha);
        Linha := TrataLinha(Linha);
      end;
      with CSVBaixa do
      begin
        _nossonumero := MontaValor;
        _dataentrega := MontaValor;
        _horaentrega := MontaValor;
        _recebedor := MontaValor;
        _grau := MontaValor;
        _documento := MontaValor;
        _codigoentregador := Montavalor;
        _nomeentregador := MontaValor;
        _atribuicao := MontaValor;
        _observacao := MontaValor;
        _usuario := MontaValor;
        _datadigitacao := MontaValor;
        _cliente := MontaValor;
        _pedido := MontaValor;
        _previsao := MontaValor;
        _codigoagenteTFO := MontaValor;
        _nomeagenteTFO := MontaValor;
        _pesocobrado := MontaValor;
        _tipopeso := MontaValor;
      end;
      if entrega.getObject(CSVBaixa._nossonumero, 'NOSSONUMERO') then
      begin
        sBaixa := entrega.Baixado;
        baixa.Status := entrega.Status;
        iVolumes := entrega.Volumes;
        sCEP := entrega.Cep;
      end
      else
      begin
        baixa.Status := 0;
        iVolumes := 1;
        sCEP := '00000000';
      end;
      baixa.NossoNumero := CSVBaixa._nossonumero;
      if StrToIntDef(CSVBaixa._codigoentregador, 0) = 0 then
      begin
        CSVBaixa._codigoentregador := CSVBaixa._codigoagenteTFO;
      end;
      dVerba := 0;
      if (not codigoEntregador.getObject(CSVBaixa._codigoentregador,'CODIGO')) then
      begin
        sMensagem := 'Entregador ' + CSVBaixa._nomeentregador + '/' + CSVBaixa._nomeagenteTFO +
          ' não cadastrado !';
        Synchronize(AtualizaLog);
        agente := '1';
        codigo := CSVBaixa._codigoentregador;
        dVerba := 0;
        sCEP := '';
      end
      else
      begin
        codigo := IntToStr(codigoEntregador.codigo);
        agente := IntToStr(codigoEntregador.agente);
        sCEP := '';
        if agentes.getObject(agente, 'CODIGO') then
        begin
          dVerba := agentes.Verba;
        end;
        if codigoEntregador.Verba > 0 then dVerba := codigoEntregador.Verba;
        if cliente.getObject(CSVBaixa._cliente,'CODIGO') then
        begin
          if cliente.Verba > 0 then dVerba := cliente.Verba
        end;
      end;
      baixa.agente := StrToInt(agente);
      baixa.entregador := StrToInt(codigo);
      if not(TUtil.Empty(CSVBaixa._atribuicao)) then
      begin
        baixa.Atribuicao := StrToDateTime(CSVBaixa._atribuicao);
      end;
      if not(TUtil.Empty(CSVBaixa._dataentrega)) then
      begin
        baixa.entrega := StrToDateTime(CSVBaixa._dataentrega);
      end
      else
      begin
        baixa.entrega := StrToDateTime(CSVBaixa._datadigitacao);
      end;
      baixa.PrevDistribuicao := StrToDate(CSVBaixa._previsao);

      if baixa.entrega > baixa.PrevDistribuicao then
      begin
        iAtraso := DaysBetween(baixa.entrega, baixa.PrevDistribuicao);
      end
      else
      begin
        iAtraso := 0;
      end;
      if iAtraso < 0 then
      begin
        iAtraso := 0;
      end;
      baixa.DiasAtraso := iAtraso;
      //baixa.VolumesExtra := ((iVolumes - 1) / 2);
      baixa.VolumesExtra := 0;
      if sBaixa = 'E' then
      begin
        baixa.Baixado := sBaixa;
      end
      else
      begin
        sBaixa := 'S';
        baixa.Baixado := sBaixa;
        baixa.DataBaixa := StrToDateTime(CSVBaixa._datadigitacao);
      end;
      baixa.ValorExtra := 0;
      baixa.Pedido := CSVBaixa._pedido;
      if TUtil.Empty(CSVBaixa._pesocobrado) then
      begin
        baixa.PesoCobrado := 0;
      end
      else
      begin
        baixa.PesoCobrado := StrToFloat(CSVBaixa._pesocobrado);
      end;
      if baixa.PesoCobrado > 25 then
      begin
        dVerba := 15;
      end;
      baixa.VerbaEntregador := dVerba;
      if TUtil.Empty(CSVBaixa._tipopeso) then
      begin
        baixa.TipoPeso := 'NORMAL';
      end
      else
      begin
        baixa.TipoPeso := CSVBaixa._tipopeso;
      end;
      if not(baixa.JaExiste) then
      begin
        sMensagem := 'NN ' + baixa.NossoNumero + ' não encontrado !';
        Synchronize(AtualizaLog);
      end
      else if not(baixa.Baixar) then
      begin
        sMensagem := 'Erro ao baixar o NN ' + baixa.NossoNumero + ' !';
        Synchronize(AtualizaLog);
      end;
      I := 0;
      bFlagPrimeiro := False;
      iConta := Contador;
      iTotal := LinhasTotal;
      dPosicao := (iConta / iTotal) * 100;
      Inc(Contador, 1);
      if not(Self.Terminated) then
      begin
        Synchronize(AtualizaProgress);
      end
      else
      begin
        baixa.Free;
        entregador.Free;
        entrega.Free;
        agentes.Free;
        codigoEntregador.Free;
        Abort;
      end;
    end;
  finally
    CloseFile(ArquivoCSV);
    Application.MessageBox('Importação concluída!', 'Importação de Baixas',
      MB_OK + MB_ICONINFORMATION);
    sMensagem := 'Importação terminada em ' +
      FormatDateTime('dd/mm/yyyy hh:mm:ss', Now);
    Synchronize(AtualizaLog);
    Synchronize(TerminaProcesso);
    baixa.Free;
    entregador.Free;
    entrega.Free;
    agentes.Free;
    codigoEntregador.Free;
  end;
end;

procedure thrImportaBaixas.AtualizaLog;
begin
  frmImportaBaixas.cxLog.Lines.Add(sMensagem);
  frmImportaBaixas.cxLog.Refresh;
end;

procedure thrImportaBaixas.AtualizaProgress;
begin
  frmImportaBaixas.cxProgressBar1.Position := dPosicao;
  frmImportaBaixas.cxProgressBar1.Properties.Text := 'Registro ' +
    IntToStr(iConta) + ' de ' + IntToStr(iTotal);
  frmImportaBaixas.cxProgressBar1.Refresh;
  if not(frmImportaBaixas.actImportarBaixaCancelar.Visible) then
  begin
    frmImportaBaixas.actImportarBaixaCancelar.Visible := True;
    frmImportaBaixas.actImportaBaixaSair.Enabled := False;
    frmImportaBaixas.actImportarBaixaImportar.Enabled := False;
  end;

end;

procedure thrImportaBaixas.TerminaProcesso;
begin
  frmImportaBaixas.actImportarBaixaCancelar.Visible := False;
  frmImportaBaixas.actImportaBaixaSair.Enabled := True;
  frmImportaBaixas.actImportarBaixaImportar.Enabled := True;
  frmImportaBaixas.cxArquivo.Clear;
  frmImportaBaixas.cxProgressBar1.Properties.Text := '';
  frmImportaBaixas.cxProgressBar1.Position := 0;
  frmImportaBaixas.cxProgressBar1.Clear;
end;

end.
