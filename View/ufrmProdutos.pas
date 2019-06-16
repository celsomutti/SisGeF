unit ufrmProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans,
  dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp,
  dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  cxTextEdit, cxLabel, Menus, StdCtrls, cxButtons,
  clEntrega, Data.DB, dxmdaset, cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxImage,
  Vcl.ExtCtrls, cxSpinEdit, cxGridExportLink, ShellAPI, dxCustomTileControl,
  dxTileControl, cxGroupBox, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, System.Actions, clAcessos,
  clConexao, clProdutos;

type
  TfrmProdutos = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxButton5: TcxButton;
    cxButton1: TcxButton;
    aclCadastro: TActionList;
    actCadastroIncluir: TAction;
    actCadastroEditar: TAction;
    actCadastroExcluir: TAction;
    actCadastroCancelar: TAction;
    actCadastroSalvar: TAction;
    actCadastroImprimir: TAction;
    actCadastroLocalizar: TAction;
    actCadastroSair: TAction;
    actCadastroExcluirEndereco: TAction;
    actCadastroListaApoio: TAction;
    actCadastroExportar: TAction;
    tbProdutos: TdxMemData;
    ds: TDataSource;
    SaveDialog: TSaveDialog;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxLabel16: TcxLabel;
    tbProdutosCOD_PRODUTO: TStringField;
    tbProdutosDES_PRODUTO: TStringField;
    cxGrid1DBTableView1COD_PRODUTO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_PRODUTO: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actCadastroSairExecute(Sender: TObject);
    procedure tbProdutosBeforeDelete(DataSet: TDataSet);
    procedure tbProdutosAfterDelete(DataSet: TDataSet);
    procedure tbProdutosBeforePost(DataSet: TDataSet);
    procedure tbProdutosBeforeInsert(DataSet: TDataSet);
    procedure tbProdutosBeforeEdit(DataSet: TDataSet);
    procedure tbProdutosAfterPost(DataSet: TDataSet);
    procedure tbProdutosBeforeCancel(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure actCadastroExportarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AtualizaGrid;
  end;

var
  frmProdutos: TfrmProdutos;
  produto: TProdutos;
  acessos: TAcessos;
  conexao: TConexao;

implementation

{$R *.dfm}

uses
  udm, clUtil, ufrmPrincipal;

procedure TfrmProdutos.FormShow(Sender: TObject);
begin
  produto := TProdutos.Create();
  acessos := TAcessos.Create;
  conexao := TConexao.Create;
  if (not conexao.VerifyConnZEOS(1)) then
  begin
    actCadastroSairExecute(Sender);
    Exit;
  end;
  acessos.SetNivel(aclCadastro);
end;

procedure TfrmProdutos.FormActivate(Sender: TObject);
begin
  tbProdutos.Open;
  AtualizaGrid;
end;

procedure TfrmProdutos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tbProdutos.Close;
  produto.Free;
  acessos.Free;
  conexao.Free;
  Action := caFree;
  frmProdutos := Nil;
end;

procedure TfrmProdutos.tbProdutosAfterDelete(DataSet: TDataSet);
begin
  if not(produto.Delete('CODIGO')) then
  begin
    Application.MessageBox('Erro ao excluir o produto!', 'Atenção',
      MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  Application.MessageBox('produto Excluído com sucesso !', 'Atenção',
    MB_OK + MB_ICONINFORMATION);
end;

procedure TfrmProdutos.tbProdutosAfterPost(DataSet: TDataSet);
begin
  if tbProdutos.IsLoading then
  begin
    Exit;
  end;
  if produto.Operacao = 'I' then
  begin
    if not(produto.Insert) then
    begin
      Application.MessageBox('Erro ao incluir o produto!', 'Atenção',
        MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
  end
  else if produto.Operacao = 'U' then
  begin
    if not(produto.Update) then
    begin
      Application.MessageBox('Erro ao alterar o produto!', 'Atenção',
        MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
  end;
end;

procedure TfrmProdutos.tbProdutosBeforeCancel(DataSet: TDataSet);
begin
  produto.Operacao := '';
end;

procedure TfrmProdutos.tbProdutosBeforeDelete(DataSet: TDataSet);
var
  sMess: String;
begin
  produto.Codigo := tbProdutosCOD_PRODUTO.AsString;
  sMess := 'Deseja Excluir o produto ' + tbProdutosCOD_PRODUTO.AsString + ' - '
    + tbProdutosDES_PRODUTO.Value + ' ?';
  if Application.MessageBox(PChar(sMess), 'Excluir', MB_YESNO + MB_ICONQUESTION)
    = IDNO then
  begin
    Abort;
    Exit;
  end;
end;

procedure TfrmProdutos.tbProdutosBeforeEdit(DataSet: TDataSet);
begin
  produto.Operacao := 'U';
  cxGrid1DBTableView1COD_PRODUTO.Properties.ReadOnly := True;
end;

procedure TfrmProdutos.tbProdutosBeforeInsert(DataSet: TDataSet);
begin
  produto.Operacao := 'I';
  cxGrid1DBTableView1COD_PRODUTO.Properties.ReadOnly := False;
end;

procedure TfrmProdutos.tbProdutosBeforePost(DataSet: TDataSet);
begin
  if tbProdutos.IsLoading then
  begin
    Exit;
  end;
  produto.Codigo := tbProdutosCOD_PRODUTO.AsString;
  produto.Descricao := tbProdutosDES_PRODUTO.AsString;
  if not(produto.Validar) then
  begin
    Abort;
    tbProdutos.Refresh;
    Exit;
  end;
  if Application.MessageBox('Confirma gravar os dados?', 'Incluir',
    MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Abort;
    Exit;
  end;
end;

procedure TfrmProdutos.actCadastroExportarExecute(Sender: TObject);
var
  FileExt, sFile: String;
begin
  if not(tbProdutos.Active) then
  begin
    Exit;
  end;
  if tbProdutos.IsEmpty then
  begin
    Exit;
  end;
  sFile := 'produtos';
  SaveDialog.FileName := sFile;
  SaveDialog.Filter := '';
  SaveDialog.Filter :=
    'Excel (*.xls) |*.xls|XML (*.xml) |*.xml|Arquivo Texto (*.txt) |*.txt|Página Web (*.html)|*.html';
  SaveDialog.Title := 'Exportar Dados';
  SaveDialog.DefaultExt := 'xls';
  if SaveDialog.Execute then
  begin
    FileExt := LowerCase(ExtractFileExt(SaveDialog.FileName));
    if FileExt = '.xls' then
      ExportGridToExcel(SaveDialog.FileName, cxGrid1, False)
    else if FileExt = '.xml' then
      ExportGridToXML(SaveDialog.FileName, cxGrid1, False)
    else if FileExt = '.txt' then
      ExportGridToText(SaveDialog.FileName, cxGrid1, False)
    else if FileExt = '.html' then
      ExportGridToHTML(SaveDialog.FileName, cxGrid1, False);
    ShellExecute(Handle, 'open', PChar(SaveDialog.FileName), nil, nil, SW_SHOW);
  end;
end;

procedure TfrmProdutos.actCadastroSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmProdutos.AtualizaGrid;
begin
  if not(produto.getObjects) then
  begin
    Exit;
  end;
  tbProdutos.Close;
  tbProdutos.Open;
  tbProdutos.IsLoading := True;
  while not(dm.qryGetObject.Eof) do
  begin
    tbProdutos.Insert;
    tbProdutosCOD_PRODUTO.Value := dm.qryGetObject.FieldByName
      ('COD_PRODUTO').AsString;
    tbProdutosDES_PRODUTO.Value := dm.qryGetObject.FieldByName
      ('DES_PRODUTO').AsString;
    tbProdutos.Post;
    dm.qryGetObject.Next;
  end;
  tbProdutos.IsLoading := False;
  dm.qryGetObject.Close;
  dm.qryGetObject.SQL.Clear;
  if not(tbProdutos.IsEmpty) then
  begin
    tbProdutos.First;
  end;

end;

end.
