unit uthrImportarAero;

interface

uses
  System.Classes, Dialogs, Windows, Forms, SysUtils, clUtil, clEntregador, clStatus, clAgentes, clEntrega,
  Messages, Controls, System.DateUtils;

type
  thrImportarAero = class(TThread)
  private
    entregador  : TEntregador;
    entrega     : TEntrega;
    agentes     : TAgente;
    status      : TStatus;

    procedure AtualizaLog;
    procedure AtualizaProgress;
    procedure TerminaProcesso;
    function  MontaLista(campo: String): TStringList;
  protected
    procedure Execute; override;
  end;

implementation

{
  Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure thrImportarAero.UpdateCaption;
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

{ thrImportarAero }

uses
  ufrmImportaentrega, uGlobais;

function thrImportarAero.MontaLista(campo: string): TStringList;
var
  lList   : TStringList;
  iI2     : Integer;
  sCampo  : String;
begin
  sCampo  :=  '';
  iI2     :=  0;
  Inc(iI2,1);
  lList  :=  TStringList.Create();
  lList.Clear;
  while campo[iI2] >= ' ' do begin
    if campo[iI2] = '\' then begin
      lList.Add(sCampo);
      Inc(iI2,1);
      sCampo  :=  '';
    end;
    sCampo  :=  sCampo + campo[iI2];
    Inc(iI2,1);
  end;
  if not (TUtil.Empty(sCampo)) then begin
    lList.Add(sCampo);
    sCampo  :=  '';
  end;
  Result  :=  lList;
end;


procedure thrImportarAero.Execute;
var
  ArquivoCSV                              : TextFile;
  iContador, LinhasTotal, iRet, iCliente  : Integer;
  Linha,campo, sNN, sMess, sData, sFile   : String;
  d                                       : Real;
  dtData                                  : TDate;
begin
  //instancioa as classes
  entregador  :=  TEntregador.Create;
  entrega     :=  TEntrega.Create;
  agentes     :=  TAgente.Create;
  status      :=  TStatus.Create;
  //apanha o número de linhas do arquivo a se importado
  sFile       :=  frmImportaEntregas.cxArquivo.Text;
  LinhasTotal := TUtil.NumeroDeLinhasTXT(frmImportaEntregas.cxArquivo.Text);
  //guarda o código do cliente
  iCliente    :=  StrToInt(frmImportaEntregas.cxCliente.Text);
  // Carregando o arquivo ...
  AssignFile(ArquivoCSV, frmImportaEntregas.cxArquivo.Text);
  try
    Reset(ArquivoCSV);
    Readln(ArquivoCSV, Linha);
    //verifica se o arquivo está identificado
    if Copy(Linha,1,8) <> 'AERONOVA' then begin
      MessageDlg('Arquivo informado não é de ENTREGAS AERONOVA.',mtWarning,[mbOK],0);
      Abort;
    end;
    //inicia o processo de leitura / importação
    iContador := 1;
    while not Eoln(ArquivoCSV) do begin
      Readln(ArquivoCSV, Linha);
      sNN                   :=  Trim(Copy(Linha,346,10));
      if not (entrega.getObject(sNN, 'NOSSONUMERO')) then begin
        entrega.Agente            :=  0;
        entrega.Entregador        :=  0;
        entrega.NossoNumero       :=  sNN;
        entrega.Cliente           :=  iCliente;
        entrega.NF                :=  Copy(Linha,346,10);
        entrega.Consumidor        :=  Copy(Linha,203,35);
        entrega.Telefone          :=  '';
        entrega.Expedicao         :=  StrToDate(Copy(Linha,24,2) + '/' + Copy(Linha,26,2) + '/' + Copy(Linha,28,4));
        entrega.PrevDistribuicao  :=  IncDay(entrega.Expedicao,2);
        entrega.Volumes           :=  StrToInt(Copy(Linha,374,6));
        entrega.Status            :=  5;
        entrega.PesoReal          :=  (StrToInt(Copy(Linha,368,6))) / 1000;
        entrega.VolumesExtra      :=  0;
        entrega.ValorExtra        :=  0;
        entrega.DiasAtraso        :=  0;
        entrega.Endereco          :=  Copy(Linha,238,35);
        entrega.Bairro            :=  Copy(Linha,273,10);
        entrega.Cidade            :=  Copy(Linha,283,35);
        entrega.Cep               :=  Copy(Linha,338,8);
        entrega.Baixado           :=  'N';
        entrega.Pago              :=  'N';
        if not (entrega.Insert) then begin
          sMensagem := 'Erro ao Incluir os dados do NN ' + entrega.NossoNumero + ' !';
          Synchronize(AtualizaLog);
        end;
      end
      else begin
        entrega.Consumidor        :=  Copy(Linha,203,35);
        entrega.Telefone          :=  '';
        entrega.Expedicao         :=  StrToDate(Copy(Linha,24,2) + '/' + Copy(Linha,26,2) + '/' + Copy(Linha,28,4));
        entrega.PrevDistribuicao  :=  IncDay(entrega.Expedicao,2);
        entrega.Volumes           :=  StrToInt(Copy(Linha,374,6));
        entrega.Status            :=  5;
        entrega.PesoReal          :=  (StrToInt(Copy(Linha,368,6))) / 1000;
        entrega.VolumesExtra      :=  0;
        entrega.ValorExtra        :=  0;
        entrega.DiasAtraso        :=  0;
        entrega.Endereco          :=  Copy(Linha,238,35);
        entrega.Bairro            :=  Copy(Linha,273,10);
        entrega.Cidade            :=  Copy(Linha,283,35);
        entrega.Cep               :=  Copy(Linha,338,8);
        if entrega.Pago <> 'S' then begin
          if not (entrega.Update) then begin
            sMensagem := 'Erro ao Alterar os dados do NN ' + entrega.NossoNumero + ' !';
            Synchronize(AtualizaLog);
          end;
        end;
      end;
      iTotal                          :=  LinhasTotal;
      dPosicao                        :=  (iContador / iTotal) * 100;
      Inc(iContador,1);
      iConta                          :=  iContador;
      if not (Self.Terminated) then begin
        Synchronize(AtualizaProgress);
      end
      else begin
        entregador.Free;
        entrega.Free;
        agentes.Free;
        status.Free;
        Abort;
      end;
    end;
  finally
    CloseFile(ArquivoCSV);
    Application.MessageBox('Importação concluída!', 'Importação de Entregas', MB_OK + MB_ICONINFORMATION);
    sMensagem :=  'Importação terminada em ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now);
    Synchronize(AtualizaLog);
    Synchronize(TerminaProcesso);
    entregador.Free;
    entrega.Free;
    agentes.Free;
    status.Free;
  end;
end;

procedure thrImportarAero.AtualizaLog;
begin
  frmImportaEntregas.cxLog.Lines.Add(sMensagem);
  frmImportaEntregas.cxLog.Refresh;
end;

procedure thrImportarAero.AtualizaProgress;
begin
  frmImportaEntregas.cxProgressBar1.Position         :=  dPosicao;
  frmImportaEntregas.cxProgressBar1.Properties.Text  :=  'Registro ' + IntToStr(iConta) + ' de ' + IntToStr(iTotal);
  frmImportaEntregas.cxProgressBar1.Refresh;
  if not (frmImportaEntregas.actImportaEntregaCancelar.Visible) then begin
    frmImportaEntregas.actImportaEntregaCancelar.Visible :=  True;
    frmImportaEntregas.actImportaEntregaSair.Enabled :=  False;
  end;
end;

procedure thrImportarAero.TerminaProcesso;
begin
  frmImportaEntregas.actImportaEntregaCancelar.Visible  :=  False;
  frmImportaEntregas.actImportaEntregaSair.Enabled      :=  True;
  frmImportaEntregas.cxArquivo.Clear;
  frmImportaEntregas.cxProgressBar1.Properties.Text     := '';
  frmImportaEntregas.cxProgressBar1.Position            :=  0;
  frmImportaEntregas.cxProgressBar1.Clear;
end;


end.
