unit uthrSalvarExtravios;

interface

uses
  System.Classes, Dialogs, Windows, Forms, SysUtils, clUtil, Messages, Controls,
  System.DateUtils, clExtravios, clRestricoes;

type
  thrSalvarExtravios = class(TThread)
  private
    { Private declarations }
    extravio: TExtravios;
  protected
    procedure Execute; override;
    procedure AtualizaProgress;
    procedure TerminaProcesso;
  end;

implementation

{ thrSalvarExtravios }

uses
  ufrmImportarExtravios, uGlobais, udm;

procedure thrSalvarExtravios.Execute;
var
  Contador, I, LinhasTotal, iRet, iCod: Integer;
  codigo, sMess, sData: String;
  d: Real;
  dValor: Double;
begin
  extravio := TExtravios.Create;
  LinhasTotal := dm.tbImportacaoExtravio.RecordCount;
  dm.tbImportacaoExtravio.First;
  try
    while (not dm.tbImportacaoExtravio.Eof) do
    begin
      dValor := 0;
      if (not extravio.getObject(dm.tbImportacaoExtravioNUM_NOSSONUMERO.Value,
        'NOSSONUMERO')) then
      begin
        extravio.codigo := 0;
        extravio.Descricao := dm.tbImportacaoExtravioDES_EXTRAVIO.Value;
        extravio.Data := dm.tbImportacaoExtravioDAT_EXTRAVIO.Value;
        extravio.NossoNumero := dm.tbImportacaoExtravioNUM_NOSSONUMERO.Value;
        extravio.Produto := dm.tbImportacaoExtravioVAL_PRODUTO.Value;
        extravio.Multa := dm.tbImportacaoExtravioVAL_MULTA.Value;
        extravio.Verba := dm.tbImportacaoExtravioVAL_VERBA.Value;
        extravio.Total := extravio.Produto + extravio.Multa + extravio.Verba;
        if dm.tbImportacaoExtravioDES_RESTRICAO.Value = 'ADM. CEP' then
        begin
          extravio.Tipo := 0;
          extravio.Restricao := 'S';
        end
        else if dm.tbImportacaoExtravioDES_RESTRICAO.Value = 'ENTREGADOR' then
        begin
          extravio.Tipo := 1;
          extravio.Restricao := 'S';
        end
        else
        begin
          extravio.Restricao := 'N';
        end;
        extravio.Entregador := dm.tbImportacaoExtravioCOD_ENTREGADOR.Value;
        Entregador.codigo := dm.tbImportacaoExtravioCOD_ENTREGADOR.Value;
        codigo := Entregador.getField('COD_AGENTE', 'CODIGO');
        if (not TUtil.Empty(codigo)) then
        begin
          extravio.Agente := StrToInt(codigo);
        end
        else
        begin
          extravio.Agente := 0;
        end;
        extravio.Excutor := uGlobais.sUsuario;
        extravio.Manutencao := Now;
        if (not extravio.Insert()) then
        begin
          Application.MessageBox(PChar('Erro ao incluir o extravio! NN ' +
            extravio.NossoNumero), 'Atenção!', MB_OK + MB_ICONWARNING);
        end;
        if extravio.Restricao = 'S' then
        begin
          if extravio.Tipo = 0 then
          begin
            iCod := extravio.Agente;
          end
          else
          begin
            iCod := extravio.Entregador;
          end;
          Restricao.Entregador := iCod;
          if Restricao.getObject(IntToStr(iCod), 'ENTREGADOR') then
          begin
            dValor := Restricao.Valor;
            Restricao.Valor := dValor + extravio.Total;
            if not(Restricao.Update()) then
            begin
              MessageDlg('Erro ao alterar o valor da Restrição!', mtWarning,
                [mbOK], 0);
            end;
          end
          else
          begin
            Restricao.Agente := extravio.Agente;
            if extravio.Tipo = 0 then
            begin
              Restricao.Entregador := extravio.Agente;
            end
            else
            begin
              Restricao.Entregador := extravio.Entregador;
            end;
            Restricao.Pago := 0;
            Restricao.Debitar := 0;
            dValor := extravio.Total;
            Restricao.Valor := dValor;
            if not(Restricao.Insert()) then
            begin
              MessageDlg('Erro ao incluir o valor da Restrição!', mtWarning,
                [mbOK], 0);
            end;
          end;
        end;
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
        extravio.Free;
        Abort;
      end;
      dm.tbImportacaoExtravio.Next;
    end;
  finally
    extravio.Free;
    Synchronize(TerminaProcesso);
  end;
end;

procedure thrSalvarExtravios.AtualizaProgress;
begin
  frmImportarExtravios.cxProgressBar1.Position := dPosicao;
  frmImportarExtravios.cxProgressBar1.Properties.Text := 'Registro ' +
    IntToStr(iConta) + ' de ' + IntToStr(iTotal);
  frmImportarExtravios.cxProgressBar1.Refresh;
end;

procedure thrSalvarExtravios.TerminaProcesso;
begin
  frmImportarExtravios.cxProgressBar1.Properties.Text := '';
  frmImportarExtravios.cxProgressBar1.Position := 0;
  frmImportarExtravios.cxProgressBar1.Clear;
  frmImportarExtravios.cxProgressBar1.Visible := False;
  frmImportarExtravios.ds.Enabled := True;
  frmImportarExtravios.actImportarSalvar.Enabled := False;
  dm.tbImportacaoExtravio.Close;
end;

end.
