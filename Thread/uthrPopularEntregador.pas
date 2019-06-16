unit uthrPopularEntregador;

interface

uses
  System.Classes, clUtil, udm, Dialogs, Windows, Forms, SysUtils, Messages,
  Controls, System.DateUtils, clCodigosEntregadores;

type
  thrPopularEntregador = class(TThread)
  private
    { Private declarations }
    entregador : TCodigosEntregadores;
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

  procedure thrPopularEntregadores.UpdateCaption;
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

{ thrPopularEntregador }

uses
  uGlobais, ufrmExtratoExpressa;

procedure thrPopularEntregador.Execute;
var
  sItem : String;
  i : Integer;
begin
  try
    Synchronize(IniciaProcesso);
    sItem := '';
    i := 0;
    while not(Self.Terminated) do
    begin
      if not entregador.getObjects then
      begin
        Self.Terminate;
      end;
      if Self.Terminated then
      begin
        Break;
      end;
      frmExtratoExpressa.clbListaDistribuidoresEntregadores.Items.Clear;
      while not(dm.qryGetObject.Eof) do
      begin
        if dm.qryGetObject.FieldByName('COD_AGENTE').AsInteger > 0 then
        begin
          sItem := dm.qryGetObject.FieldByName('NOM_FANTASIA').AsString;
          frmExtratoExpressa.clbListaDistribuidoresEntregadores.AddItem(sItem);
          frmExtratoExpressa.clbListaDistribuidoresEntregadores.Items[i].Tag :=
          dm.qryGetObject.FieldByName('COD_ENTREGADOR').AsInteger;
          Inc(i);
        end;
        dm.qryGetObject.Next;
      end;
      Self.Terminate;
    end;
  finally
    Synchronize(TerminaProcesso);
  end;
end;

procedure thrPopularEntregador.AtualizaProgress;
begin
    {Rotina de procedimento demonstrativo de processo}
end;

procedure thrPopularEntregador.TerminaProcesso;
begin
  entregador.Free;
  dm.qryGetObject.Close;
  dm.qryGetObject.SQL.Clear;
  if frmExtratoExpressa.clbListaDistribuidoresEntregadores.Items.Count > 0 then
  begin
    frmExtratoExpressa.clbListaDistribuidoresEntregadores.ItemIndex := 0;
  end;
end;

procedure thrPopularEntregador.IniciaProcesso;
begin
  entregador := TCodigosEntregadores.Create;
end;

end.
