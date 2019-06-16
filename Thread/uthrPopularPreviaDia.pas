unit uthrPopularPreviaDia;

interface

uses
  System.Classes, clEntrega, clEntregador, clUtil, udm, Dialogs, Windows, Forms, SysUtils, Messages, Controls, System.DateUtils;

type
  thrPopularPreviaDia = class(TThread)
  private
    { Private declarations }
    entrega     : TEntrega;
    entregador  : TEntregador;
  protected
    procedure Execute; override;
    procedure IniciaProcesso;
    procedure AtualizaProgress;
    procedure TerminaProcesso;
  end;

implementation

{ thrPopularPreviaDia }

uses
  ufrmRestricoes, uGlobais;

procedure thrPopularPreviaDia.Execute;
var
  Contador, LinhasTotal : Integer;
  sNome                 : String;
begin
  try
    entregador  :=  TEntregador.Create;
    entrega     :=  TEntrega.Create;
    while not (Self.Terminated) do begin
      if dm.tbPrevia.Active then begin
        dm.tbPrevia.Close;
      end;
      dm.tbPrevia.Open;
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
        dm.tbPrevia.Insert;
        dm.tbPreviaCOD_RESTRICAO.Value  :=  dm.qryGeral.FieldByName('COD_RESTRICAO').AsInteger;
        agente.Codigo                       :=  dm.qryGeral.FieldByName('COD_AGENTE').AsString;
        sNome                               :=  agente.Codigo;
        SNome                               :=  sNome + '-' + agente.getField('NOM_FANTASIA','CODIGO');
        dm.tbPreviaNOM_AGENTE.Value     :=  sNome;
        entregador.Codigo                   :=  dm.qryGeral.FieldByName('COD_ENTREGADOR').AsString;
        sNome                               :=  entregador.Codigo;
        sNome                               :=  sNome + '-' + entregador.getField('NOM_FANTASIA','CODIGO');
        dm.tbPreviaNOM_ENTREGADOR.Value :=  sNome;
        dm.tbPreviaVAL_RESTRICAO.Value  :=  dm.qryGeral.FieldByName('VAL_RESTRICAO').AsFloat;
        dm.tbPreviaVAL_PAGO.Value       :=  dm.qryGeral.FieldByName('VAL_PAGO').AsFloat;;
        dm.tbPreviaVAL_DEBITAR.Value    :=  dm.qryGeral.FieldByName('VAL_DEBITAR').AsFloat;
        dm.tbPrevia.Post;
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

 procedure thrPopularPreviaDia.AtualizaProgress;
begin
  frmRestricoes.cxProgressBar.Visible          :=  True;
  frmRestricoes.cxProgressBar.Position         :=  Round(dPosicao);
  frmRestricoes.cxProgressBar.Properties.Text  :=  IntToStr(Round(dPosicao)) + '%';
  frmRestricoes.cxProgressBar.Refresh;
end;

procedure thrPopularPreviaDia.TerminaProcesso;
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

procedure thrPopularPreviaDia.IniciaProcesso;
begin
  frmRestricoes.cxGrid1DBTableView1.OptionsView.NoDataToDisplayInfoText  := 'Atualizando a grade. Aguarde...';
  frmRestricoes.actCadastroExcluir.Enabled                               :=  False;
  frmRestricoes.actCadastroCancelar.Enabled                              :=  False;
  frmRestricoes.actCadastroSalvar.Enabled                                :=  False;
  frmRestricoes.actCadastroExcluir.Enabled                               :=  False;
  frmRestricoes.actCadastroSair.Enabled                                  :=  True;
end;



end.
