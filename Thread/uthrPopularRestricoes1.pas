unit uthrPopularRestricoes1;

interface

uses
  System.Classes, clEntrega, clEntregador, clAgentes, clUtil, udm, Dialogs, Windows, Forms, SysUtils, Messages,
  Controls, System.DateUtils;

type
  thrPopularRestricoes = class(TThread)
  private
    { Private declarations }
    entrega     : TEntrega;
    agente      : TAgente;
    entregador  : TEntregador;
  protected
    procedure Execute; override;
    procedure IniciaProcesso;
    procedure AtualizaProgress;
    procedure TerminaProcesso;
  end;

implementation

{ thrPopularRestricoes }

uses
  ufrmRestricoes, uGlobais;

procedure thrPopularRestricoes.Execute;
var
  Contador, LinhasTotal : Integer;
  sNome, sData1, sData2 : String;
begin
  try
    agente      :=  TAgente.Create;
    entregador  :=  TEntregador.Create;
    entrega     :=  TRestricoes.Create;
    while not (Self.Terminated) do begin
      if dm.tbRestricoes.Active then begin
        dm.tbRestricoes.Close;
      end;
      dm.tbRestricoes.Open;
      if not (restricao.getObjects()) then begin
        Self.Terminate;
      end;
      if Self.Terminated then begin
        Break;
      end;
      Contador    :=  1;
      LinhasTotal :=  dm.qryGeral.RecordCount;
      Synchronize(IniciaProcesso);
      sNome       :=  '';
      while not (dm.qryGeral.Eof) do begin
        dm.tbRestricoes.Insert;
        dm.tbRestricoesCOD_RESTRICAO.Value  :=  dm.qryGeral.FieldByName('COD_RESTRICAO').AsInteger;
        agente.Codigo                       :=  dm.qryGeral.FieldByName('COD_AGENTE').AsString;
        sNome                               :=  agente.Codigo;
        SNome                               :=  sNome + '-' + agente.getField('NOM_FANTASIA','CODIGO');
        dm.tbRestricoesNOM_AGENTE.Value     :=  sNome;
        entregador.Codigo                   :=  dm.qryGeral.FieldByName('COD_ENTREGADOR').AsString;
        sNome                               :=  entregador.Codigo;
        sNome                               :=  sNome + '-' + entregador.getField('NOM_FANTASIA','CODIGO');
        dm.tbRestricoesNOM_ENTREGADOR.Value :=  sNome;
        dm.tbRestricoesVAL_RESTRICAO.Value  :=  dm.qryGeral.FieldByName('VAL_RESTRICAO').AsFloat;
        dm.tbRestricoesVAL_PAGO.Value       :=  dm.qryGeral.FieldByName('VAL_PAGO').AsFloat;;
        dm.tbRestricoesVAL_DEBITAR.Value    :=  dm.qryGeral.FieldByName('VAL_DEBITAR').AsFloat;
        dm.tbRestricoes.Post;
        dPosicao  :=  (Contador / LinhasTotal) * 100;
        Inc(Contador);
        if not (Self.Terminated) then begin
          Synchronize(AtualizaProgress);
        end
        else begin
          Synchronize(TerminaProcesso);
          entregador.Free;
          restricao.Free;
          Abort;
        end;
        dm.qryGeral.Next;
      end;
      Self.Terminate;
    end;
    dm.qryGeral.Close;
    dm.qryGeral.SQL.Clear;
  finally
    Synchronize(TerminaProcesso);
    entregador.Free;
    restricao.Free;
  end;
end;

 procedure thrPopularRestricoes.AtualizaProgress;
begin
  frmRestricoes.cxProgressBar.Visible          :=  True;
  frmRestricoes.cxProgressBar.Position         :=  Round(dPosicao);
  frmRestricoes.cxProgressBar.Properties.Text  :=  IntToStr(Round(dPosicao)) + '%';
  frmRestricoes.cxProgressBar.Refresh;
end;

procedure thrPopularRestricoes.TerminaProcesso;
begin
  frmRestricoes.cxGrid1DBTableView1.OptionsView.NoDataToDisplayInfoText := 'Nenhuma Informação Disponível';
  frmRestricoes.ds.Enabled                                              :=  True;
  frmRestricoes.cxGrid1.Repaint;
  frmRestricoes.cxProgressBar.Visible                                   :=  False;
  frmRestricoes.cxProgressBar.Properties.Text                           := '';
  frmRestricoes.cxProgressBar.Position                                  :=  0;
  frmRestricoes.cxProgressBar.Clear;
  frmRestricoes.actCadastroExcluir.Enabled                              :=  True;
  frmRestricoes.actCadastroCancelar.Enabled                             :=  True;
  frmRestricoes.actCadastroSalvar.Enabled                               :=  True;
  frmRestricoes.actCadastroExcluir.Enabled                              :=  True;
  frmRestricoes.actCadastroSair.Enabled                                 :=  True;
end;

procedure thrPopularRestricoes.IniciaProcesso;
begin
  frmRestricoes.cxGrid1DBTableView1.OptionsView.NoDataToDisplayInfoText  := 'Atualizando a grade. Aguarde...';
  frmRestricoes.actCadastroExcluir.Enabled                               :=  False;
  frmRestricoes.actCadastroCancelar.Enabled                              :=  False;
  frmRestricoes.actCadastroSalvar.Enabled                                :=  False;
  frmRestricoes.actCadastroExcluir.Enabled                               :=  False;
  frmRestricoes.actCadastroSair.Enabled                                  :=  True;
end;



end.
