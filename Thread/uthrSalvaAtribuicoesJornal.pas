unit uthrSalvaAtribuicoesJornal;

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
    LinhasTotal := dm.tbAtribuicoesJornal.RecordCount;
    dm.tbAtribuicoesJornal.First;
    Synchronize(IniciaProcesso);
    while (not dm.tbAtribuicoesJornal.Eof) do
    begin
      atribuicoes.Id := dm.tbAtribuicoesJornalID_ASSINANTE.AsInteger;
      atribuicoes.Codigo := dm.tbAtribuicoesJornalCOD_ASSINANTE.AsString;
      atribuicoes.Produto := dm.tbAtribuicoesJornalCOD_PRODUTO.AsString;
      atribuicoes.Tipo := dm.tbAtribuicoesJornalCOD_TIPO_ASSINATURA.AsString;
      atribuicoes.Edicao := dm.tbAtribuicoesJornalNUM_EDICAO.AsString;
      if (not atribuicoes.getObject(dm.tbAtribuicoesJornalCOD_ASSINANTE.AsString, 'CHAVE')) then
      begin
        atribuicoes.Data := dm.tbAtribuicoesJornalDAT_ATRIBUICAO.AsDateTime;
        atribuicoes.Entregador := dm.tbAtribuicoesJornalCOD_ENTREGADOR.AsInteger;
        atribuicoes.Nome := dm.tbAtribuicoesJornalNOM_ASSINANTE.AsString;
        atribuicoes.Cuidados := dm.tbAtribuicoesJornalNOM_CUIDADOS.AsString;
        atribuicoes.Endereco := dm.tbAtribuicoesJornalDES_ENDERECO.AsString;
        atribuicoes.Complemento := dm.tbAtribuicoesJornalDES_COMPLEMENTO.AsString;
        atribuicoes.Bairro := dm.tbAtribuicoesJornalDES_BAIRRO.AsString;
        // atribuicoes.Cuidados   :=  dm.tbAtribuicoesJornalDES_REFERENCIA.AsString;
        atribuicoes.Cidade := dm.tbAtribuicoesJornalDES_CIDADE.AsString;
        atribuicoes.UF := dm.tbAtribuicoesJornalDES_UF.AsString;
        atribuicoes.CEP := dm.tbAtribuicoesJornalCEP_ENDERECO.AsString;
        atribuicoes.Roteiro := dm.tbAtribuicoesJornalNUM_ROTEIRO.AsInteger;
        atribuicoes.Quantidade := dm.tbAtribuicoesJornalQTD_EXEMPLARES.AsInteger;
        atribuicoes.Barra := dm.tbAtribuicoesJornalCOD_BARRA.AsString;
        atribuicoes.Usuario := uGlobais.sUsuario;
        atribuicoes.Manutencao := Now;;
        if (not atribuicoes.Insert()) then
        begin
          Application.MessageBox(PChar('Erro ao dalvar a atribuição ' +
            atribuicoes.Codigo + '!'), 'Erro!', MB_OK + MB_ICONERROR);
        end;
      end;
      dPosicao := (Contador / LinhasTotal) * 100;
      Inc(Contador);
      if (not Self.Terminated) then
      begin
        Synchronize(AtualizaProgress);
      end
      else
      begin
        atribuicoes.Free;
        Abort;
      end;
      dm.tbAtribuicoesJornal.Next;
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
  dm.tbAtribuicoesJornal.Close;
end;

procedure thrSalvaAtribuicoes.IniciaProcesso;
begin
  frmProcesso.cxProgressBar1.Clear;
end;

end.
