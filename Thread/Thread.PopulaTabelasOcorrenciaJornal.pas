unit Thread.PopulaTabelasOcorrenciaJornal;

interface

uses
  System.Classes, Model.Produtos, DAO.Produtos, System.Generics.Collections, System.SysUtils,
  Model.TipoOcorrenciaJornal, DAO.TipoOcorrenciaJornal;

type
  TThread_PopulaTabelasOcorrnciaJornal = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
    procedure PopulaProdutos;
    procedure PopulaTiposOcorrnciasJornal;
  end;

implementation

{
  Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure TThread_PopulaTabelasOcorrnciasJornal.UpdateCaption;
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

{ TThread_PopulaTabelasOcorrnciasJornal }

procedure TThread_PopulaTabelasOcorrnciaJornal.Execute;
begin
  { Place thread code here }
  PopulaProdutos;
  PopulaTiposOcorrnciasJornal;
end;

procedure TThread_PopulaTabelasOcorrnciaJornal.PopulaProdutos;
var
  produto: TProdutos;
  produtoTMP: TProdutos;
  produtos: TObjectList<TProdutos>;
  produtoDAO: TProdutosDAO;
begin
  { Place thread code here }
  try
    if dm.tbProdutos.Active then dm.tbProdutos.Close;
    dm.tbProdutos.Open;
    produtoDAO := TProdutosDAO.Create();
    produtos := produtoDAO.FindByDescricao('');
    for produtoTMP in produtos do
    begin
      dm.tbprodutos.Insert;
      dm.tbprodutos.FieldByName('COD_PRODUTO').AsString := produtoTMP.Codigo;
      dm.tbprodutos.FieldByName('DES_PRODUTO').AsString := produtoTMP.Descricao;
      dm.tbprodutos.Post;
    end;
  finally
    produtoDAO.Free;
  end;
end;

procedure TThread_PopulaTabelasOcorrnciaJornal.PopulaTiposOcorrnciasJornal;
var
  tipo : TTipoOcorrenciaJornal;
  tipoTMP : TTipoOcorrenciaJornal;
  tipos: TObjectList<TTipoOcorrenciaJornal>;
  tipoDAO: TTipoOcorrenciaJornalDAO;

begin
  try
    if dm.tbTipoOcorrencias.Active then dm.tbTipoOcorrencias.Close;
    dm.tbTipoOcorrencias.Open;
    tipoDAO := TTipoOcorrenciaJornalDAO.Create();
    tipos := tipoDAO.FindByDescricao('');
    for tipoTMP in tipos do
    begin
      dm.tbTipoOcorrencias.Insert;
      dm.tbTipoOcorrencias.FieldByName('COD_TIPO_OCORRENCIA').AsInteger := tipoTMP.Codigo;
      dm.tbTipoOcorrencias.FieldByName('DES_TIPO_OCORRENCIA').AsString := tipoTMP.Descricao;
      dm.tbTipoOcorrencias.Post;
    end;
  finally
    tipoDAO.Free;
  end;
end;

end.
