unit Thread.PopulaEntregadoresJornal;

interface

uses
  System.Classes, System.Generics.Collections, System.SysUtils, clEntregador, Vcl.Forms, System.UITypes;


type
  Thread_PopulaEntregadoresJornal = class(TThread)
  private
    { Private declarations }
    entregador: TEntregador;
  protected
    procedure Execute; override;
  end;

implementation

{ 
  Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);  

  and UpdateCaption could look like,

    procedure Thread_PopulaEntregadoresJornal.UpdateCaption;
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

uses udm;

{ Thread_PopulaEntregadoresJornal }

procedure Thread_PopulaEntregadoresJornal.Execute;
begin
  { Place thread code here }
  Screen.Cursor := crHourGlass;
  entregador := TEntregador.Create();
  if not entregador.ListaEntregadores then
  begin
    dm.qryPesquisa.Close;
    dm.qryPesquisa.SQL.Clear;
    Screen.Cursor := crDefault;
    Exit;
  end
  else
  begin
    dm.qryPesquisa.First;
  end;
  dm.tbListaEntregadores.Close;
  dm.tbListaEntregadores.Open;
  while not dm.qryPesquisa.Eof do
  begin
    dm.tbListaEntregadores.Insert;
    dm.tbListaEntregadoresCOD_CADASTRO.AsInteger := dm.qryPesquisa.FieldByName('COD_CADASTRO').AsInteger;
    dm.tbListaEntregadoresDES_RAZAO_SOCIAL.AsString := dm.qryPesquisa.FieldByName('NOM_FANTASIA').AsString;
    dm.qryPesquisa.Next;
  end;
  if not dm.tbListaEntregadores.IsEmpty then dm.tbListaEntregadores.First;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  entregador.Free;
  Screen.Cursor := crDefault;
end;

end.
