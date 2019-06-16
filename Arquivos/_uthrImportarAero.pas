unit uthrImportarAero;

interface

uses
  System.Classes, Dialogs, Windows, Forms, SysUtils, clUtil, clEntregador, clStatus, clAgentes, clEntrega,
  Messages, Controls, System.DateUtils;

type
  TCSVEntrega = record
  _agenteTFO: String;
  _descricaoAgenteTFO: String;
  _nossonumero: String;
  _cliente: String;
  _nota: String;
  _consumidor: String;
  _cuidados: String;
  _logradouro: String;
  _complemento: String;
  _bairro: String;
  _cidade: String;
  _cep: String;
  _telefone: String;
  _expedicao: String;
  _previsao: String;
  _status: String;
  _descricaoStatus: String;
  _entregador: String;
  _volumes: String;
  _peso:  String;
  end;

type
  thrImportarAero = class(TThread)
  private
    entregador  : TEntregador;
    entrega     : TEntrega;
    agentes     : TAgente;
    status      : TStatus;
    CSVEntrega  : TCSVEntrega;
    procedure AtualizaLog;
    procedure AtualizaProgress;
    procedure TerminaProcesso;
    function  TrataLinha(sLinha: String): String;
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

function thrImportarAero.TrataLinha(sLinha: String): String;
var
  iConta: Integer;
  sLin: String;
  bFlag: Boolean;
begin

  if Pos('"',sLinha) = 0 then begin
    Result := sLinha;
    Exit;
  end;

  iConta := 1;
  bFlag := False;
  sLin := '';
  while sLinha[iConta] >= ' ' do begin
    if sLinha[iConta] = '"' then begin
      if bFlag then
        bFlag := False
      else
        bFlag := True;
    end;
    if bFlag then begin
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
  lLista                                  : TStringList;
  ArquivoCSV                              : TextFile;
  Contador, I, LinhasTotal, iRet, iI, Ii3 : Integer;
  Linha,campo,codigo, sMess, sData, sNN   : String;
  d                                       : Real;

   // Lê Linha e Monta os valores
  function MontaValor: String;
  var
    ValorMontado: String;
  begin
    ValorMontado := '';
    inc(I);
    While Linha[I] >= ' ' do
    begin
      If Linha[I] = ';' then // vc pode usar qualquer delimitador ... eu
        // estou usando o ";"
        break;
      ValorMontado := ValorMontado + Linha[I];
      inc(I);
    end;
    result := ValorMontado;
  end;

begin

  entregador  :=  TEntregador.Create;
  entrega     :=  TEntrega.Create;
  agentes     :=  TAgente.Create;
  status      :=  TStatus.Create;

  LinhasTotal := TUtil.NumeroDeLinhasTXT(frmImportaEntregas.cxArquivo.Text);

  // Carregando o arquivo ...
  AssignFile(ArquivoCSV, frmImportaEntregas.cxArquivo.Text);
  try
    Reset(ArquivoCSV);
    {Readln(ArquivoCSV, Linha);
    if Copy(Linha,0,18) <> 'AERONOVA;;;;;;;;;;' then begin
      MessageDlg('Arquivo informado não é de ENTREGAS AERONOVA.',mtWarning,[mbOK],0);
      Abort;
    end;
    Readln(ArquivoCSV, Linha);}
    contador := 1;
    lLista  :=  TStringList.Create();
    while not Eoln(ArquivoCSV) do begin
      Readln(ArquivoCSV, Linha);
      Linha := TrataLinha(Linha);
      I :=  0;
      with CSVEntrega do begin
        campo               :=  MontaValor;
        campo               :=  MontaValor;
        campo               :=  MontaValor;
        campo               :=  MontaValor;
        campo               :=  MontaValor;
        _consumidor         :=  MontaValor;
        _logradouro         :=  MontaValor;
        _bairro             :=  MontaValor;
        campo               :=  MontaValor;
        _cidade             :=  Copy(campo,1,Pos('/',campo) - 1);
        campo               :=  MontaValor;
        campo               :=  MontaValor;
        lLista.Clear;
        lLista              :=  MontaLista(campo);
        _volumes            :=  MontaValor;
        _peso               :=  MontaValor;
        _cep                :=  MontaValor;
        _expedicao          :=  MontaValor;
        _agenteTFO          :=  '1';
        _descricaoAgenteTFO :=  'ALÔ CARIOCA';
        _nossonumero        :=  '';
        _cliente            :=  '99991';
        _nota               :=  '';
        _cuidados           :=  '';
        _complemento        :=  '';
        _telefone           :=  '';
        _previsao           :=  '';
        _status             :=  '5';
        _descricaoStatus    :=  'RECEBIDO E NÃO ENTREGUE';
        _entregador         :=  '';
      end;
      for iI3 := 0 to lLista.Count - 1 do begin
        entrega.NF                :=  lLista[iI3];
        sNN                       :=  Copy(entrega.NF,1,(Pos('-',entrega.NF) - 1));
        if not (entrega.getObject(sNN,'NOSSONUMERO')) then begin
          entrega.Agente            :=  0;
          entrega.Entregador        :=  0;
          entrega.NossoNumero       :=  sNN;
          entrega.Cliente           :=  StrToInt(CSVEntrega._cliente);
          entrega.Consumidor        :=  CSVEntrega._consumidor;
          entrega.Endereco          :=  CSVEntrega._logradouro;
          entrega.Complemento       :=  CSVEntrega._complemento;
          entrega.Bairro            :=  CSVEntrega._bairro;
          entrega.Cidade            :=  CSVEntrega._cidade;
          entrega.Cep               :=  CSVEntrega._cep;
          entrega.Telefone          :=  CSVEntrega._telefone;
          entrega.Expedicao         :=  StrToDate(CSVEntrega._expedicao);
          entrega.PrevDistribuicao  :=  IncDay (StrToDate(CSVEntrega._expedicao),2);
          entrega.Status            :=   StrToInt(CSVEntrega._status);
          if not (status.getObject(CSVEntrega._status,'CODIGO')) then begin
            sMensagem :=  'Status <' +  CSVEntrega._status + '-' +CSVEntrega._descricaoStatus  + '> do NN ' +
                      CSVEntrega._nossonumero + ' não está cadastrado!';
            Synchronize(AtualizaLog);
          end;
          entrega.Volumes           :=  StrToInt(CSVEntrega._volumes);
          entrega.PesoReal          :=  StrToFloat(CSVEntrega._peso);
          entrega.VolumesExtra      :=  0;
          entrega.ValorExtra        :=  0;
          entrega.DiasAtraso        :=  0;
          if not (entrega.Insert) then begin
            sMensagem := 'Erro ao Incluir os dados do NN ' + entrega.NossoNumero + ' !';
            Synchronize(AtualizaLog);
          end;
        end
        else begin
          entrega.Status          :=  StrToInt(CSVEntrega._status);
          if not (status.getObject(CSVEntrega._status,'CODIGO')) then begin
            sMensagem := 'Status <' +  CSVEntrega._status + '-' +CSVEntrega._descricaoStatus  + '> do NN ' +
                            CSVEntrega._nossonumero + ' não está cadastrado!';
            Synchronize(AtualizaLog);
          end;
          if entrega.Pago <> 'S' then begin
            if not (entrega.Update) then begin
              sMensagem := 'Erro ao Alterar os dados do NN ' + entrega.NossoNumero + ' !';
              Synchronize(AtualizaLog);
            end;
          end;
        end;
      end;
      I := 0;
      iConta                          :=  contador;
      iTotal                          :=  LinhasTotal;
      dPosicao                        :=  (iConta / iTotal) * 100;
      Inc(contador,1);
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
