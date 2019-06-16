unit View.CadastroProdutoVA;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, dxLayoutContainer, dxLayoutControl, cxContainer, cxEdit, dxLayoutcxEditAdapters,
  cxTextEdit, Model.ProdutosVA, DAO.ProdutosVA, System.Generics.Collections, System.Actions, Vcl.ActnList, dxLayoutControlAdapters,
  Vcl.Menus, Vcl.StdCtrls, cxButtons;

type
  Tview_CadastroProdutoVA = class(TForm)
    lcgRoot: TdxLayoutGroup;
    lcCadastro: TdxLayoutControl;
    edtBarras: TcxTextEdit;
    lciBarras: TdxLayoutItem;
    edtCodigo: TcxTextEdit;
    lciCodigo: TdxLayoutItem;
    edtDescricao: TcxTextEdit;
    lciDescricao: TdxLayoutItem;
    lcgProduto: TdxLayoutAutoCreatedGroup;
    aclCadastro: TActionList;
    actGravar: TAction;
    actCancelar: TAction;
    btnGravar: TcxButton;
    lciGravar: TdxLayoutItem;
    btnCancelar: TcxButton;
    lciCancelar: TdxLayoutItem;
    lcgOpcoes: TdxLayoutAutoCreatedGroup;
    procedure actGravarExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
  private
    { Private declarations }
    function VerificaProduto(sCodigo: String): Boolean;
    function VerificaDados(): Boolean;
  public
    { Public declarations }
  end;

var
  view_CadastroProdutoVA: Tview_CadastroProdutoVA;
  produto : TProdutosVA;
  produtoTMP: TProdutosVA;
  produtos : TObjectList<TProdutosVA>;
  produtoDAO : TProdutosVADAO;

implementation

{$R *.dfm}

uses udm, uGlobais;

procedure Tview_CadastroProdutoVA.actCancelarExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure Tview_CadastroProdutoVA.actGravarExecute(Sender: TObject);
begin
  if Application.MessageBox('Confirma salvar os dados?','Salvar!', MB_YESNO + MB_ICONQUESTION) = IDNO then Exit;
  if not VerificaDados() then Exit;
  if VerificaProduto(edtCodigo.Text) then
  begin
    ModalResult := mrCancel;
  end
  else
  begin
    ModalResult := mrOk;
  end;
end;

function Tview_CadastroProdutoVA.VerificaProduto(sCodigo: string): Boolean;
begin
  produtoDAO := TProdutosVADAO.Create();
  Result := False;
  try
    produtos := produtoDAO.FindByCodigo(sCodigo);
    if produtos.Count = 0 then
    begin
      Exit;
    end;
    for produtoTMP in produtos do
    begin
      if produtoTMP.Barras.IsEmpty then
      begin
        Exit;
      end;
      Application.MessageBox('Produto já cadastrado!,','Atenção!', MB_OK + MB_ICONEXCLAMATION);
    end;
    Result := True;
  finally
    produtoDAO.Free;
  end;
end;

function Tview_CadastroProdutoVA.VerificaDados(): Boolean;
begin
  Result := False;
  if edtCodigo.Text = '' then
  begin
    Application.MessageBox('Informe o Código do Produto!,','Atenção!', MB_OK + MB_ICONEXCLAMATION);
    edtCodigo.SetFocus;
    Exit;
  end;
  if edtDescricao.Text = '' then
  begin
    Application.MessageBox('Informe a Descrição do Produto!,','Atenção!', MB_OK + MB_ICONEXCLAMATION);
    edtDescricao.SetFocus;
    Exit;
  end;
  Result := True;
end;

end.
