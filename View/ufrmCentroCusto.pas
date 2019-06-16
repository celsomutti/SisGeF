unit ufrmCentroCusto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp,
  dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  cxTextEdit, cxLabel, Menus, StdCtrls, cxButtons, clCentroCusto, Data.DB,
  dxmdaset, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxImage,
  Vcl.ExtCtrls, cxSpinEdit,
  cxGridExportLink, ShellAPI, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, System.Actions, clAcessos, clConexao, cxFilterControl;

type
  TfrmCentroCusto = class(TForm)
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
    cxButton5: TcxButton;
    tbCentroCusto: TdxMemData;
    ds: TDataSource;
    tbCentroCustoCOD_CENTRO_CUSTO: TIntegerField;
    tbCentroCustoDES_CENTRO_CUSTO: TStringField;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1COD_CENTRO_CUSTO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_CENTRO_CUSTO: TcxGridDBColumn;
    actCadastroExportar: TAction;
    SaveDialog: TSaveDialog;
    cxButton1: TcxButton;
    cxLabel27: TcxLabel;
    cxFilterControl1: TcxFilterControl;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actCadastroSairExecute(Sender: TObject);
    procedure tbCentroCustoBeforeDelete(DataSet: TDataSet);
    procedure tbCentroCustoAfterDelete(DataSet: TDataSet);
    procedure tbCentroCustoBeforePost(DataSet: TDataSet);
    procedure tbCentroCustoBeforeInsert(DataSet: TDataSet);
    procedure tbCentroCustoBeforeEdit(DataSet: TDataSet);
    procedure tbCentroCustoAfterPost(DataSet: TDataSet);
    procedure tbCentroCustoBeforeCancel(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure actCadastroExportarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AtualizaGrid;
  end;

var
  frmCentroCusto: TfrmCentroCusto;
  centrocusto: TCentroCusto;
  acessos: TAcessos;
  conexao: TConexao;

implementation

{$R *.dfm}

uses
  udm, clUtil, ufrmPrincipal;

procedure TfrmCentroCusto.FormShow(Sender: TObject);
begin
  centrocusto := TCentroCusto.Create();
  acessos := TAcessos.Create;
  conexao := TConexao.Create;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    actCadastroSairExecute(Sender);
    Exit;
  end;
  acessos.SetNivel(aclCadastro);
end;

procedure TfrmCentroCusto.FormActivate(Sender: TObject);
begin
  tbCentroCusto.Open;
  AtualizaGrid;
end;

procedure TfrmCentroCusto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tbCentroCusto.Close;
  centrocusto.Free;
  acessos.Free;
  conexao.Free;
  Action := caFree;
  frmCentroCusto := Nil;
end;

procedure TfrmCentroCusto.tbCentroCustoAfterDelete(DataSet: TDataSet);
begin
  if not(centrocusto.Delete('CODIGO')) then
  begin
    Application.MessageBox('Erro ao excluir o Centro de Custo!', 'Atenção',
      MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  Application.MessageBox('Centro de Custo Excluído com sucesso !', 'Atenção',
    MB_OK + MB_ICONINFORMATION);
end;

procedure TfrmCentroCusto.tbCentroCustoAfterPost(DataSet: TDataSet);
begin
  if tbCentroCusto.IsLoading then
  begin
    Exit;
  end;
  if centrocusto.Operacao = 'I' then
  begin
    if not(centrocusto.Insert) then
    begin
      Application.MessageBox('Erro ao incluir o Centro de Custo!', 'Atenção',
        MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
  end
  else if centrocusto.Operacao = 'U' then
  begin
    if not(centrocusto.Update) then
    begin
      Application.MessageBox('Erro ao alterar o Centro de Custo!', 'Atenção',
        MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
  end;
end;

procedure TfrmCentroCusto.tbCentroCustoBeforeCancel(DataSet: TDataSet);
begin
  centrocusto.Operacao := '';
end;

procedure TfrmCentroCusto.tbCentroCustoBeforeDelete(DataSet: TDataSet);
var
  sMess: String;
begin
  centrocusto.Codigo := tbCentroCustoCOD_CENTRO_CUSTO.AsInteger;
  sMess := 'Deseja Excluir o Centro de custo ' +
    tbCentroCustoCOD_CENTRO_CUSTO.AsString + ' - ' +
    tbCentroCustoDES_CENTRO_CUSTO.Value + ' ?';
  if Application.MessageBox(PChar(sMess), 'Excluir', MB_YESNO + MB_ICONQUESTION)
    = IDNO then
  begin
    Abort;
    Exit;
  end;
end;

procedure TfrmCentroCusto.tbCentroCustoBeforeEdit(DataSet: TDataSet);
begin
  centrocusto.Operacao := 'U';
  cxGrid1DBTableView1COD_CENTRO_CUSTO.Properties.ReadOnly := True;
end;

procedure TfrmCentroCusto.tbCentroCustoBeforeInsert(DataSet: TDataSet);
begin
  centrocusto.Operacao := 'I';
  cxGrid1DBTableView1COD_CENTRO_CUSTO.Properties.ReadOnly := False;
end;

procedure TfrmCentroCusto.tbCentroCustoBeforePost(DataSet: TDataSet);
begin
  if tbCentroCusto.IsLoading then
  begin
    Exit;
  end;
  centrocusto.Codigo := tbCentroCustoCOD_CENTRO_CUSTO.AsInteger;
  centrocusto.Descricao := tbCentroCustoDES_CENTRO_CUSTO.AsString;
  if not(centrocusto.Validar) then
  begin
    Abort;
    tbCentroCusto.Refresh;
    Exit;
  end;
  if Application.MessageBox('Confirma salvar os dados?', 'Incluir',
    MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Abort;
    Exit;
  end;
end;

procedure TfrmCentroCusto.actCadastroExportarExecute(Sender: TObject);
var
  FileExt, sFile: String;
begin
  if not(tbCentroCusto.Active) then
  begin
    Exit;
  end;
  if tbCentroCusto.IsEmpty then
  begin
    Exit;
  end;
  sFile := 'centro_custo';
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

procedure TfrmCentroCusto.actCadastroSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmCentroCusto.AtualizaGrid;
begin
  if not(centrocusto.getObjects) then
  begin
    Exit;
  end;
  tbCentroCusto.Close;
  tbCentroCusto.Open;
  tbCentroCusto.IsLoading := True;
  while not(dm.qryGetObject.Eof) do
  begin
    tbCentroCusto.Insert;
    tbCentroCustoCOD_CENTRO_CUSTO.Value := dm.qryGetObject.FieldByName
      ('COD_CENTRO_CUSTO').AsInteger;
    tbCentroCustoDES_CENTRO_CUSTO.Value := dm.qryGetObject.FieldByName
      ('DES_CENTRO_CUSTO').AsString;
    tbCentroCusto.Post;
    dm.qryGetObject.Next;
  end;
  tbCentroCusto.IsLoading := False;
  dm.qryGetObject.Close;
  dm.qryGetObject.SQL.Clear;
  if not(tbCentroCusto.IsEmpty) then
  begin
    tbCentroCusto.First;
  end;

end;

end.
