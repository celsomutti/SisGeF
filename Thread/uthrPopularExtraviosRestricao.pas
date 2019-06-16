unit uthrPopularExtraviosRestricao;

interface

uses
  System.Classes, clExtravios, clUtil, udm, Dialogs, Windows, Forms, SysUtils,
  Messages, Controls,
  System.DateUtils, clCodigosEntregadores;

type
  thrPopularExtraviosRestricao = class(TThread)
  private
    { Private declarations }
    extravios: TExtravios;
    entregador: TCodigosEntregadores;
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

  procedure thrPopularLancamentos.UpdateCaption;
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

{ thrPopularExtraviosRestricao }

uses uGlobais, ufrmDetalhesRestricoes;

procedure thrPopularExtraviosRestricao.Execute;
var
  Contador, LinhasTotal: Integer;
  sNome, sEntregador, sTipo, sFiltro: String;
begin
  try
    sEntregador := frmDetalhesRestricoes.sCodEntregadores;
    sTipo := frmDetalhesRestricoes.sTipo;
    extravios := TExtravios.Create;
    entregador := TCodigosEntregadores.Create;
    while not(Self.Terminated) do
    begin
      if dm.tbExtravios.Active then
      begin
        dm.tbExtravios.Close;
      end;
      if sTipo = 'A' then
      begin
        sFiltro := 'AGENTE';
      end
      else
      begin
        sFiltro := 'ENTREGADOR';
      end;
      dm.tbExtravios.Open;
      if not(extravios.getObject(sEntregador, sFiltro)) then
      begin
        Self.Terminate;
      end;
      if Self.Terminated then
      begin
        Break;
      end;
      Contador := 1;
      LinhasTotal := dm.qryGetObject.RecordCount;
      Synchronize(IniciaProcesso);
      while not(dm.qryGetObject.Eof) do
      begin
        dm.tbExtravios.Insert;
        dm.tbExtraviosCOD_EXTRAVIO.Value := dm.qryGetObject.FieldByName
          ('COD_EXTRAVIO').AsInteger;
        dm.tbExtraviosDES_EXTRAVIO.Value := dm.qryGetObject.FieldByName
          ('DES_EXTRAVIO').AsString;
        dm.tbExtraviosDAT_EXTRAVIO.Value := dm.qryGetObject.FieldByName
          ('DAT_EXTRAVIO').AsDateTime;
        dm.tbExtraviosNUM_NOSSONUMERO.Value := dm.qryGetObject.FieldByName
          ('NUM_NOSSONUMERO').AsString;
        dm.tbExtraviosVAL_TOTAL.Value := dm.qryGetObject.FieldByName
          ('VAL_TOTAL').AsFloat;
        dm.tbExtraviosVAL_PRODUTO.Value := dm.qryGetObject.FieldByName
          ('VAL_PRODUTO').AsFloat;
        dm.tbExtraviosVAL_MULTA.Value := dm.qryGetObject.FieldByName
          ('VAL_MULTA').AsFloat;
        dm.tbExtraviosVAL_VERBA.Value := dm.qryGetObject.FieldByName
          ('VAL_VERBA').AsFloat;
        dm.tbExtraviosCOD_ENTREGADOR.Value := dm.qryGetObject.FieldByName
          ('COD_ENTREGADOR').AsInteger;
        entregador.Codigo := dm.qryGetObject.FieldByName('COD_ENTREGADOR')
          .AsInteger;
        sNome := entregador.getField('NOM_FANTASIA', 'CODIGO');
        dm.tbExtraviosNOM_ENTREGADOR.Value := sNome;
        dm.tbExtravios.Post;
        dPosicao := (Contador / LinhasTotal) * 100;
        Inc(Contador);
        if not(Self.Terminated) then
        begin
          Synchronize(AtualizaProgress);
        end
        else
        begin
          Synchronize(TerminaProcesso);
          extravios.Free;
          entregador.Free;
          Abort;
        end;
        dm.qryGetObject.Next;
      end;
      Self.Terminate;
    end;
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
  finally
    Synchronize(TerminaProcesso);
    extravios.Free;
    entregador.Free;
  end;
end;

procedure thrPopularExtraviosRestricao.AtualizaProgress;
begin
  frmDetalhesRestricoes.cxProgressBar.Visible := True;
  frmDetalhesRestricoes.cxProgressBar.Position := Round(dPosicao);
  frmDetalhesRestricoes.cxProgressBar.Properties.Text :=
    IntToStr(Round(dPosicao)) + '%';
  frmDetalhesRestricoes.cxProgressBar.Refresh;
end;

procedure thrPopularExtraviosRestricao.TerminaProcesso;
begin
  frmDetalhesRestricoes.cxGrid1DBTableView1.OptionsView.NoDataToDisplayInfoText
    := '<nenhuma informação disponível>';
  frmDetalhesRestricoes.dsDetalhesRestricoes.Enabled := True;
  frmDetalhesRestricoes.cxGrid1.Repaint;
  frmDetalhesRestricoes.cxProgressBar.Visible := False;
  frmDetalhesRestricoes.cxProgressBar.Properties.Text := '';
  frmDetalhesRestricoes.cxProgressBar.Position := 0;
  frmDetalhesRestricoes.cxProgressBar.Clear;
  frmDetalhesRestricoes.actDetalhesRestricoesExportar.Enabled := True;
end;

procedure thrPopularExtraviosRestricao.IniciaProcesso;
begin
  frmDetalhesRestricoes.cxGrid1DBTableView1.OptionsView.NoDataToDisplayInfoText
    := '>Atualizando a grade. Aguarde...<';
  frmDetalhesRestricoes.actDetalhesRestricoesExportar.Enabled := False;
end;

end.
