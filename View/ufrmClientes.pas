unit ufrmClientes;

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
  cxTextEdit, cxLabel, Menus, StdCtrls, cxButtons, clCliente, clEntrega,
  Data.DB, dxmdaset, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxImage,
  Vcl.ExtCtrls, cxSpinEdit,
  cxGridExportLink, ShellAPI, dxCustomTileControl, dxTileControl, cxGroupBox,
  dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  System.Actions, clAcessos, clConexao, cxCheckBox, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, cxCurrencyEdit;

type
  TfrmClientes = class(TForm)
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
    tbClientes: TdxMemData;
    tbClientesCOD_CLIENTE: TIntegerField;
    tbClientesNOM_CLIENTE: TStringField;
    ds: TDataSource;
    SaveDialog: TSaveDialog;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1COD_CLIENTE: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_CLIENTE: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxLabel16: TcxLabel;
    tbClientesDOM_OS: TSmallintField;
    cxGrid1DBTableView1DOM_OS: TcxGridDBColumn;
    tbClientesVAL_VERBA: TCurrencyField;
    cxGrid1DBTableView1VAL_VERBA: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actCadastroSairExecute(Sender: TObject);
    procedure tbClientesBeforeDelete(DataSet: TDataSet);
    procedure tbClientesAfterDelete(DataSet: TDataSet);
    procedure tbClientesBeforePost(DataSet: TDataSet);
    procedure tbClientesBeforeInsert(DataSet: TDataSet);
    procedure tbClientesBeforeEdit(DataSet: TDataSet);
    procedure tbClientesAfterPost(DataSet: TDataSet);
    procedure tbClientesBeforeCancel(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure actCadastroExportarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AtualizaGrid;
  end;

var
  frmClientes: TfrmClientes;
  cliente: TCliente;
  acessos: TAcessos;
  conexao: TConexao;

implementation

{$R *.dfm}

uses
  udm, clUtil, ufrmPrincipal;

procedure TfrmClientes.FormShow(Sender: TObject);
begin
  cliente := TCliente.Create();
  acessos := TAcessos.Create;
  conexao := TConexao.Create;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    actCadastroSairExecute(Sender);
    Exit;
  end;
  acessos.SetNivel(aclCadastro);
end;

procedure TfrmClientes.FormActivate(Sender: TObject);
begin
  tbClientes.Open;
  AtualizaGrid;
end;

procedure TfrmClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tbClientes.Close;
  cliente.Free;
  acessos.Free;
  conexao.Free;
  Action := caFree;
  frmClientes := Nil;
end;

procedure TfrmClientes.tbClientesAfterDelete(DataSet: TDataSet);
begin
  if not(cliente.Delete('CODIGO')) then
  begin
    Application.MessageBox('Erro ao excluir o cliente!', 'Atenção',
      MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  Application.MessageBox('Cliente Excluído com sucesso !', 'Atenção',
    MB_OK + MB_ICONINFORMATION);
end;

procedure TfrmClientes.tbClientesAfterPost(DataSet: TDataSet);
begin
  if tbClientes.IsLoading then
  begin
    Exit;
  end;
  if cliente.Operacao = 'I' then
  begin
    if not(cliente.Insert) then
    begin
      Application.MessageBox('Erro ao incluir o cliente!', 'Atenção',
        MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
  end
  else if cliente.Operacao = 'U' then
  begin
    if not(cliente.Update) then
    begin
      Application.MessageBox('Erro ao alterar o cliente!', 'Atenção',
        MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
  end;
end;

procedure TfrmClientes.tbClientesBeforeCancel(DataSet: TDataSet);
begin
  cliente.Operacao := '';
end;

procedure TfrmClientes.tbClientesBeforeDelete(DataSet: TDataSet);
var
  sMess: String;
begin
  cliente.Codigo := tbClientesCOD_CLIENTE.AsInteger;
  sMess := 'Deseja Excluir o Cliente ' + tbClientesCOD_CLIENTE.AsString + ' - '
    + tbClientesNOM_CLIENTE.Value + ' ?';
  if Application.MessageBox(PChar(sMess), 'Excluir', MB_YESNO + MB_ICONQUESTION)
    = IDNO then
  begin
    Abort;
    Exit;
  end;
end;

procedure TfrmClientes.tbClientesBeforeEdit(DataSet: TDataSet);
begin
  cliente.Operacao := 'U';
  cxGrid1DBTableView1COD_CLIENTE.Properties.ReadOnly := True;
end;

procedure TfrmClientes.tbClientesBeforeInsert(DataSet: TDataSet);
begin
  cliente.Operacao := 'I';
  cxGrid1DBTableView1COD_CLIENTE.Properties.ReadOnly := False;
end;

procedure TfrmClientes.tbClientesBeforePost(DataSet: TDataSet);
begin
  if tbClientes.IsLoading then
  begin
    Exit;
  end;
  cliente.Codigo := tbClientesCOD_CLIENTE.AsInteger;
  cliente.Razao := tbClientesNOM_CLIENTE.AsString;
  cliente.Verba := tbClientesVAL_VERBA.AsFloat;
  cliente.OS := tbClientesDOM_OS.AsInteger;
  if not(cliente.Validar) then
  begin
    Abort;
    tbClientes.Refresh;
    Exit;
  end;
  if Application.MessageBox('Confirma salvar os dados?', 'Incluir',
    MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Abort;
    Exit;
  end;
end;

procedure TfrmClientes.actCadastroExportarExecute(Sender: TObject);
var
  FileExt, sFile: String;
begin
  if not(tbClientes.Active) then
  begin
    Exit;
  end;
  if tbClientes.IsEmpty then
  begin
    Exit;
  end;
  sFile := 'clientes';
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

procedure TfrmClientes.actCadastroSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmClientes.AtualizaGrid;
begin
  if not(cliente.getObjects) then
  begin
    Exit;
  end;
  tbClientes.Close;
  tbClientes.Open;
  tbClientes.IsLoading := True;
  while not(dm.qryGetObject.Eof) do
  begin
    tbClientes.Insert;
    tbClientesCOD_CLIENTE.Value := dm.qryGetObject.FieldByName('COD_CLIENTE').AsInteger;
    tbClientesNOM_CLIENTE.Value := dm.qryGetObject.FieldByName('NOM_CLIENTE').AsString;
    tbClientesVAL_VERBA.Value := dm.qryGetObject.FieldByName('VAL_VERBA').AsFloat;
    tbClientesDOM_OS.Value := dm.qryGetObject.FieldByName('DOM_OS').AsInteger;
    tbClientes.Post;
    dm.qryGetObject.Next;
  end;
  tbClientes.IsLoading := False;
  dm.qryGetObject.Close;
  dm.qryGetObject.SQL.Clear;
  if not(tbClientes.IsEmpty) then
  begin
    tbClientes.First;
  end;

end;

end.

