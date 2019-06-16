unit ufrmCadastroAbastecimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, clAbastecimentos;

type
  TfrmCadastroAbastecimento = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroAbastecimento: TfrmCadastroAbastecimento;

implementation

{$R *.dfm}

uses udm, clUtil, ufrmPrincipal,ufrmLocalizar, ZDataset, ufrmListaApoio, uGlobais;

end.
