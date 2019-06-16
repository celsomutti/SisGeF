unit uthrPopularClientes;

interface

uses
  System.Classes, clUtil, udm, Dialogs, Windows, Forms, SysUtils, Messages,
  Controls, System.DateUtils, clCliente;

type
  thrPopularClientes = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
    procedure IniciaProcesso;
    procedure AtualizaProgress;
    procedure TerminaProcesso;
    procedure LimpaCbo();
    procedure AtualizaCbo();
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

{ thrPopularClientes }

uses
  uGlobais, ufrmExtratoExpressa;


procedure thrPopularClientes.Execute;
var
  cliente : TCliente;
begin
  try
    LimpaCbo();
    cliente := TCliente.Create();
    while not(Self.Terminated) do
    begin
      if not cliente.getObjects then
      begin
        Self.Terminate;
      end;
      if Self.Terminated then
      begin
        Break;
      end;
      while not(dm.qryGetObject.Eof) do
      begin
        AtualizaCbo();
        dm.qryGetObject.Next;
      end;
      Self.Terminate;
    end;
  finally
    cliente.Free;
    Synchronize(TerminaProcesso);
  end;
end;

procedure thrPopularClientes.AtualizaProgress;
begin
    {Rotina de procedimento demonstrativo de processo}
end;

procedure thrPopularClientes.TerminaProcesso;
begin
  dm.qryGetObject.Close;
  dm.qryGetObject.SQL.Clear;
end;

procedure thrPopularClientes.IniciaProcesso;
begin
  //
end;

procedure thrPopularClientes.LimpaCbo();
begin
  Synchronize(
  procedure
  begin
  frmExtratoExpressa.clbClientes.Items.Clear;
  end);
end;

procedure thrPopularClientes.AtualizaCbo();
var
  x: Integer;
begin
  frmExtratoExpressa.clbClientes.AddItem(dm.qryGetObject.FieldByName('NOM_CLIENTE').AsString);
  x := frmExtratoExpressa.clbClientes.ItemIndex;
  frmExtratoExpressa.clbClientes.Items[x].Tag := dm.qryGetObject.FieldByName('COD_CLIENTE').AsInteger;
end;

end.
