unit uthrSalvaAtribuicoes;

interface

uses
  System.Classes, clAssinantes, clUtil, udm, Dialogs, Windows, Forms, SysUtils,
  Messages, Controls,
  System.DateUtils, clAtribuicoesJornal;

type
  thrSalvaAtribuicoes = class(TThread)
  private
    { Private declarations }
    atribuicoes: TAtribuicoes;
  protected
    procedure Execute; override;
    procedure IniciaProcesso;
    procedure AtualizaProgress;
    procedure TerminaProcesso;
  end;

implementation

{
  Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

  Synchronize(UpdateCaption);

  and UpdateCaption could look like,

  procedure thrSalvaAtribuicoes.UpdateCaption;
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

{ thrSalvaAtribuicoes }

uses
  uGlobais, ufrmAtribuicoesJornal, ufrmProcesso;

procedure thrSalvaAtribuicoes.Execute;
var
  Contador, LinhasTotal: Integer;
begin
  atribuicoes := TAtribuicoes.Create;
  try
    Contador := 1;
    LinhasTotal := dm.tbAtribuicoes.RecordCount;
    dm.tbAtribuicoes.First;
    Synchronize(IniciaProcesso);
    while (not dm.tbAtribuicoes.Eof) do
    begin
      atribuicoes.Id := dm.tbAtribuicoesID_ASSINANTE.AsInteger;
      atribuicoes.Codigo := dm.tbAtribuicoesNUM_NOSSONUMERO.AsString;
      atribuicoes.Produto := dm.tbAtribuicoesCOD_PRODUTO.AsString;
      atribuicoes.Tipo := dm.tbAtribuicoesCOD_TIPO_ASSINATURA.AsString;
      atribuicoes.Edicao := dm.tbAtribuicoesNUM_EDICAO.AsString;
      atribuicoes.Data := dm.tbAtribuicoesDAT_ATRIBUICAO.AsDateTime;
      atribuicoes.Entregador := dm.tbAtribuicoesCOD_ENTREGADOR.AsInteger;
      atribuicoes.Nome := dm.tbAtribuicoesNOM_CONSUMIDOR.AsString;
      atribuicoes.Cuidados := dm.tbAtribuicoesNOM_CUIDADOS.AsString;
      atribuicoes.Endereco := dm.tbAtribuicoesDES_ENDERECO.AsString;
      atribuicoes.Complemento := dm.tbAtribuicoesDES_COMPLEMENTO.AsString;
      atribuicoes.Bairro := dm.tbAtribuicoesDES_BAIRRO.AsString;
      // atribuicoes.Referencia   :=  dm.tbAtribuicoesDES_REFERENCIA.AsString;
      atribuicoes.Cidade := dm.tbAtribuicoesNOM_CIDADE.AsString;
      atribuicoes.UF := dm.tbAtribuicoesDES_UF.AsString;
      atribuicoes.CEP := dm.tbAtribuicoesNUM_CEP.AsString;
      atribuicoes.Roteiro := dm.tbAtribuicoesCOD_AGENTE.AsInteger;
      atribuicoes.Quantidade := dm.tbAtribuicoesQTD_VOLUMES.AsInteger;
      atribuicoes.Barra := dm.tbAtribuicoesCOD_BARRA.AsString;
      atribuicoes.Usuario := uGlobais.sUsuario;
      atribuicoes.Manutencao := Now;;
      if (not atribuicoes.Insert()) then
      begin
        Application.MessageBox(PChar('Erro ao dalvar a atribuição ' +
          atribuicoes.Codigo + '!'), 'Erro!', MB_OK + MB_ICONERROR);
      end;
      dm.tbAtribuicoes.Next;
      dPosicao := (Contador / LinhasTotal) * 100;
      Inc(Contador);
      if not(Self.Terminated) then
      begin
        Synchronize(AtualizaProgress);
      end
      else
      begin
        atribuicoes.Free;
        Abort;
      end;
      dm.tbAtribuicoes.Next;
    end;
  finally
    Synchronize(TerminaProcesso);
    atribuicoes.Free;
  end;
end;

procedure thrSalvaAtribuicoes.AtualizaProgress;
begin
  frmProcesso.cxProgressBar1.Visible := True;
  frmProcesso.cxProgressBar1.Position := Round(dPosicao);
  frmProcesso.cxProgressBar1.Properties.Text := IntToStr(Round(dPosicao)) + '%';
  frmProcesso.cxProgressBar1.Refresh;
end;

procedure thrSalvaAtribuicoes.TerminaProcesso;
begin
  frmProcesso.Close;
  dm.dsAtribuicoes.Enabled := True;
  dm.tbAtribuicoes.Close;
end;

procedure thrSalvaAtribuicoes.IniciaProcesso;
begin
  frmProcesso.cxProgressBar1.Clear;
end;

end.
