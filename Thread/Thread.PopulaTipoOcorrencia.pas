unit Thread.PopulaTipoOcorrencia;

interface

uses
  System.Classes, dxmdaset, Model.TipoOcorrenciaJornal, DAO.TipoOcorrenciaJornal, System.Generics.Collections;

type
  Thread_PopulaTIpoOcorrencia = class(TThread)
  private
    { Private declarations }
    FtbTipo : TdxMemData;
    tipo : TTipoOcorrenciaJornal;
    tipoTMP : TTipoOcorrenciaJornal;
    tipos: TObjectList<TTipoOcorrenciaJornal>;
    tipoDAO: TTipoOcorrenciaJornalDAO;
  protected
    procedure Execute; override;
  public
    property tbTipo: TdxMemdata read FtbTipo write FtbTipo;
  end;

implementation

{
  Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure Thread_PopulaTIpoOcorrencias.UpdateCaption;
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

{ Thread_PopulaTIpoOcorrencias }

procedure Thread_PopulaTIpoOcorrencia.Execute;
begin
  try
    if Self.tbTipo.Active then Self.tbTipo.Close;
    Self.tbTipo.Open;
    tipoDAO := TTipoOcorrenciaJornalDAO.Create();
    tipos := tipoDAO.FindByDescricao('');
    for tipoTMP in tipos do
    begin
      Self.tbTipo.Insert;
      Self.tbTipo.FieldByName('COD_TIPO_OCORRENCIA').AsInteger := tipoTMP.Codigo;
      Self.tbTipo.FieldByName('DES_TIPO_OCORRENCIA').AsString := tipoTMP.Descricao;
      Self.tbTipo.Post;
    end;
  finally
    tipoDAO.Free;
  end;

end;

end.
