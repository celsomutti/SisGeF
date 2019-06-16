unit Thread.PopulaProdutos;

interface

uses
  System.Classes, Model.Produtos, DAO.Produtos, System.Generics.Collections, dxmdaset, System.SysUtils;

type
  TThread_PopulaProdutos = class(TThread)
  private
    { Private declarations }
    produto: TProdutos;
    produtos: TObjectList<TProdutos>;
    produtoDAO: TProdutosDAO;
    FtbProdutos: TdxMemData;
  protected
    procedure Execute; override;
  public
    property tbProdutos: TdxMemData read FtbProdutos write FtbProdutos;
  end;

implementation

{
  Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure Thread_Produtos.UpdateCaption;
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

{ Thread_Produtos }

procedure TThread_PopulaProdutos.Execute;
var
  produtoTMP: TProdutos;
begin
  { Place thread code here }
  try
    if Self.tbProdutos.Active then Self.tbProdutos.Close;
    Self.tbProdutos.Open;
    produtoDAO := TProdutosDAO.Create();
    produtos := produtoDAO.FindByDescricao('');
    for produtoTMP in produtos do
    begin
      Self.tbProdutos.Insert;
      Self.tbprodutos.FieldByName('COD_PRODUTO').AsString := produtoTMP.Codigo;
      Self.tbprodutos.FieldByName('DES_PRODUTO').AsString := produtoTMP.Descricao;
      Self.tbProdutos.Post;
    end;
  finally
    produtoDAO.Free;
  end;
end;

end.
