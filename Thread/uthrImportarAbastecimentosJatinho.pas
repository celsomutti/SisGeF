unit uthrImportarAbastecimentosJatinho;

interface

uses
  System.Classes, Dialogs, Windows, Forms, SysUtils, clUtil, clAbastecimentos,
  clEntregador, clVeiculos, Messages, Controls,
  System.DateUtils;

type
  TCSVAbastecimento = record
    _cliente: String;
    _placa: String;
    _data: String;
    _produto: String;
    _quantidade: String;
    _unitario: String;
    _total: String;
    _cupom: String;
    _hodometro: String;
  end;

  thrImportaAbastecimentosJatinho = class(TThread)
  private
    { Private declarations }
    abastecimento: TAbastecimentos;
    entregador: TEntregador;
    veiculos: TVeiculos;
    CSVAbastecimento: TCSVAbastecimento;

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
  ufrmImportaAbastacimentos, uGlobais;

function thrImportaAbastecimentosJatinho.TrataLinha(sLinha: String): String;
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

procedure thrImportaAbastecimentosJatinho.Execute;
var
  ArquivoCSV: TextFile;
  Contador, I, LinhasTotal, iVolumes, iRet, iEntregador: Integer;
  Linha, campo, codigo, sDescricao, sMess: String;
  dtBase: TDate;
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

  abastecimento := TAbastecimentos.Create;
  entregador := TEntregador.Create;
  veiculos := TVeiculos.Create;

  LinhasTotal := TUtil.NumeroDeLinhasTXT
    (frmImportaAbastecimentos.cxArquivo.Text);

  // Carregando o arquivo ...

  AssignFile(ArquivoCSV, frmImportaAbastecimentos.cxArquivo.Text);
  try
    Reset(ArquivoCSV);
    Readln(ArquivoCSV, Linha);
    sDescricao := Copy(Linha, 0, 35);
    if sDescricao <> 'NOME DO CLIENTE;PLACA;DATA;PRODUTO;' then
    begin
      MessageDlg('Arquivo informado não é de Abastecimentos.', mtWarning,
        [mbOK], 0);
      Exit;
    end;
    Linha := TrataLinha(Linha);
    Contador := 1;
    I := 0;
    dtBase := frmImportaAbastecimentos.cxDataBase.Date;
    abastecimento.Base := dtBase;
    if (not abastecimento.Delete('BASE')) then
    begin
      MessageDlg('Erro ao excluir a Data Base.', mtWarning, [mbOK], 0);
      Exit;
    end;
    while not Eoln(ArquivoCSV) do
    begin
      Readln(ArquivoCSV, Linha);
      with CSVAbastecimento do
      begin
        _cliente := MontaValor;
        _placa := MontaValor;
        _data := MontaValor;
        _produto := MontaValor;
        _quantidade := MontaValor;
        _unitario := MontaValor;
        _total := MontaValor;
        _cupom := MontaValor;
        _hodometro := MontaValor;
        if TUtil.Empty(_data) then
        begin
          _data := FormatDateTime('dd/mm/yyyy', Now);
        end;
        if TUtil.Empty(_quantidade) then
        begin
          _quantidade := '0';
        end;
        if TUtil.Empty(_unitario) then
        begin
          _unitario := '0';
        end;
        if TUtil.Empty(_total) then
        begin
          _total := '0';
        end;
        if TUtil.Empty(_cupom) then
        begin
          _cupom := '0';
        end;
        if TUtil.Empty(_hodometro) then
        begin
          _hodometro := '0';
        end;
        if TUtil.Empty(_placa) then
        begin
          _placa := '---0000';
        end;
      end;
      if not(TUtil.Empty(CSVAbastecimento._placa)) then
      begin
        if veiculos.getObject(CSVAbastecimento._placa, 'PLACA') then
        begin
          iEntregador := veiculos.entregador
        end
        else
        begin
          iEntregador := 0;
        end;
        if iEntregador <> 0 then
        begin
          if entregador.getObject(IntToStr(iEntregador), 'CADASTRO') then
          begin
            abastecimento.Nome := entregador.Nome;
            abastecimento.Verba := entregador.Combustivel;
          end
          else
          begin
            abastecimento.Verba := 0;
          end
        end
        else
        begin
          abastecimento.Verba := 0;
        end;
        abastecimento.Placa := Trim(CSVAbastecimento._placa);
        abastecimento.entregador := iEntregador;
        abastecimento.Data := StrToDate(CSVAbastecimento._data);
        abastecimento.Produto := Trim(CSVAbastecimento._produto);
        abastecimento.Quantidade := StrToFloat(CSVAbastecimento._quantidade);
        abastecimento.Unitario := StrToFloat(CSVAbastecimento._unitario);
        abastecimento.Total := StrToFloat(CSVAbastecimento._total);
        abastecimento.Desconto := abastecimento.Total;
        abastecimento.Cupom := Trim(CSVAbastecimento._cupom);
        abastecimento.Executante := uGlobais.sUsuario;
        abastecimento.Manutencao := Now;
        abastecimento.Descontado := 'N';
        if iEntregador = 0 then
        begin
          sMensagem := 'Veículo Placa ' + abastecimento.Placa +
            ' não está vinculado a nenhum entregador.';
          Synchronize(AtualizaLog);
        end;
        { if abastecimento.Exist() then begin
          if not (abastecimento.Update()) then begin
          sMensagem := 'Não possível alterar o abastecimento da placa ' + abastecimento.Placa + ' em ' +
          DateToStr(abastecimento.Data) + ', Cupom N°. ' + abastecimento.Cupom + '.';
          Synchronize(AtualizaLog);
          end;
          end
          else begin }
        if not(abastecimento.insert()) then
        begin
          sMensagem := 'Não possível incluir o abastecimento da placa ' +
            abastecimento.Placa + ' em ' + DateToStr(abastecimento.Data) +
            ', Cupom N°. ' + abastecimento.Cupom + '.';
          Synchronize(AtualizaLog);
        end;

        // end;
      end;
      I := 0;
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
        abastecimento.Free;
        entregador.Free;
        veiculos.Free;
        Abort;
      end;
    end;
  finally
    CloseFile(ArquivoCSV);
    Application.MessageBox('Importação concluída!',
      'Importação de Abastecimentos', MB_OK + MB_ICONINFORMATION);
    sMensagem := 'Importação terminada em ' +
      FormatDateTime('dd/mm/yyyy hh:mm:ss', Now);
    Synchronize(AtualizaLog);
    Synchronize(TerminaProcesso);
    abastecimento.Free;
    entregador.Free;
    veiculos.Free;
  end;
end;

procedure thrImportaAbastecimentosJatinho.AtualizaLog;
begin
  frmImportaAbastecimentos.cxLog.Lines.Add(sMensagem);
  frmImportaAbastecimentos.cxLog.Refresh;
end;

procedure thrImportaAbastecimentosJatinho.AtualizaProgress;
begin
  frmImportaAbastecimentos.cxProgressBar1.Position := dPosicao;
  frmImportaAbastecimentos.cxProgressBar1.Properties.Text := 'Registro ' +
    IntToStr(iConta) + ' de ' + IntToStr(iTotal);
  frmImportaAbastecimentos.cxProgressBar1.Refresh;
  if not(frmImportaAbastecimentos.actImportarAbastecimetosCancelar.Visible) then
  begin
    frmImportaAbastecimentos.actImportarAbastecimetosCancelar.Visible := True;
    frmImportaAbastecimentos.actImportaAbastecimentosSair.Enabled := False;
    frmImportaAbastecimentos.actImportarAbastecimentosImportar.Enabled := False;
  end;

end;

procedure thrImportaAbastecimentosJatinho.TerminaProcesso;
begin
  frmImportaAbastecimentos.actImportarAbastecimetosCancelar.Visible := False;
  frmImportaAbastecimentos.actImportaAbastecimentosSair.Enabled := True;
  frmImportaAbastecimentos.actImportarAbastecimentosImportar.Enabled := True;
  frmImportaAbastecimentos.cxArquivo.Clear;
  frmImportaAbastecimentos.cxProgressBar1.Properties.Text := '';
  frmImportaAbastecimentos.cxProgressBar1.Position := 0;
  frmImportaAbastecimentos.cxProgressBar1.Clear;
end;

end.
