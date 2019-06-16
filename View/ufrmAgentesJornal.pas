unit ufrmAgentesJornal;

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
  Data.DB, dxmdaset, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxImage,
  Vcl.ExtCtrls, cxSpinEdit, cxGridExportLink, ShellAPI, dxCustomTileControl,
  dxTileControl, cxGroupBox, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, System.Actions, clAcessos,
  clAgentesJornal, clConexao;

type
  TfrmAgentesJornal = class(TForm)
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
    tbAgente: TdxMemData;
    ds: TDataSource;
    SaveDialog: TSaveDialog;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1COD_CLIENTE: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxLabel16: TcxLabel;
    tbAgenteCOD_AGENTE: TIntegerField;
    tbAgenteNOM_AGENTE: TStringField;
    cxGrid1DBTableView1NOM_AGENTE: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actCadastroSairExecute(Sender: TObject);
    procedure tbAgenteBeforeDelete(DataSet: TDataSet);
    procedure tbAgenteAfterDelete(DataSet: TDataSet);
    procedure tbAgenteBeforePost(DataSet: TDataSet);
    procedure tbAgenteBeforeInsert(DataSet: TDataSet);
    procedure tbAgenteBeforeEdit(DataSet: TDataSet);
    procedure tbAgenteAfterPost(DataSet: TDataSet);
    procedure tbAgenteBeforeCancel(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure actCadastroExportarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AtualizaGrid;
  end;

var
  frmAgentesJornal: TfrmAgentesJornal;
  agente: TAgenteJornal;
  acessos: TAcessos;
  conexao: TConexao;

implementation

{$R *.dfm}

uses
  udm, clUtil, ufrmPrincipal;

procedure TfrmAgentesJornal.FormShow(Sender: TObject);
begin
  agente := TAgenteJornal.Create();
  acessos := TAcessos.Create;
  conexao := TConexao.Create;
  if (not conexao.VerifyConnZEOS(1)) then
  begin
    actCadastroSairExecute(Sender);
    Exit;
  end;
  acessos.SetNivel(aclCadastro);
end;

procedure TfrmAgentesJornal.FormActivate(Sender: TObject);
begin
  tbAgente.Open;
  AtualizaGrid;
end;

procedure TfrmAgentesJornal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tbAgente.Close;
  agente.Free;
  acessos.Free;
  conexao.Free;
  Action := caFree;
  frmAgentesJornal := Nil;
end;

procedure TfrmAgentesJornal.tbAgenteAfterDelete(DataSet: TDataSet);
begin
  if not(agente.Delete('CODIGO')) then
  begin
    Application.MessageBox('Erro ao excluir o Agente!', 'Atenção',
      MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  Application.MessageBox('Agente excluído com sucesso !', 'Atenção',
    MB_OK + MB_ICONINFORMATION);
end;

procedure TfrmAgentesJornal.tbAgenteAfterPost(DataSet: TDataSet);
begin
  if tbAgente.IsLoading then
  begin
    Exit;
  end;
  if agente.Operacao = 'I' then
  begin
    if not(agente.Insert) then
    begin
      Application.MessageBox('Erro ao incluir o Agente!', 'Atenção',
        MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
  end
  else if agente.Operacao = 'U' then
  begin
    if not(agente.Update) then
    begin
      Application.MessageBox('Erro ao alterar o Agente!', 'Atenção',
        MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
  end;
  Application.MessageBox('Dados gravados com sucesso !', 'Atenção',
    MB_OK + MB_ICONINFORMATION);
end;

procedure TfrmAgentesJornal.tbAgenteBeforeCancel(DataSet: TDataSet);
begin
  agente.Operacao := '';
end;

procedure TfrmAgentesJornal.tbAgenteBeforeDelete(DataSet: TDataSet);
var
  sMess: String;
begin
  agente.Codigo := tbAgenteCOD_AGENTE.AsInteger;
  sMess := 'Deseja Excluir o Cliente ' + tbAgenteCOD_AGENTE.AsString + ' - ' +
    tbAgenteNOM_AGENTE.Value + ' ?';
  if Application.MessageBox(PChar(sMess), 'Excluir', MB_YESNO + MB_ICONQUESTION)
    = IDNO then
  begin
    Abort;
    Exit;
  end;
end;

procedure TfrmAgentesJornal.tbAgenteBeforeEdit(DataSet: TDataSet);
begin
  agente.Operacao := 'U';
  cxGrid1DBTableView1COD_CLIENTE.Properties.ReadOnly := True;
end;

procedure TfrmAgentesJornal.tbAgenteBeforeInsert(DataSet: TDataSet);
begin
  agente.Operacao := 'I';
  cxGrid1DBTableView1COD_CLIENTE.Properties.ReadOnly := False;
end;

procedure TfrmAgentesJornal.tbAgenteBeforePost(DataSet: TDataSet);
begin
  if tbAgente.IsLoading then
  begin
    Exit;
  end;
  agente.Codigo := tbAgenteCOD_AGENTE.AsInteger;
  agente.Razao := tbAgenteNOM_AGENTE.AsString;
  if not(agente.Validar) then
  begin
    Abort;
    tbAgente.Refresh;
    Exit;
  end;
  if Application.MessageBox('Confirma salvar os dados?', 'Gravar',
    MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Abort;
    Exit;
  end;
end;

procedure TfrmAgentesJornal.actCadastroExportarExecute(Sender: TObject);
var
  FileExt, sFile: String;
begin
  if not(tbAgente.Active) then
  begin
    Exit;
  end;
  if tbAgente.IsEmpty then
  begin
    Exit;
  end;
  sFile := 'agentesjornal';
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

procedure TfrmAgentesJornal.actCadastroSairExecute(Sender: TObject);
begin
  try
    Perform(WM_CLOSE, 0, 0);
  except
    on E: Exception do
      MessageDlg(E.Message, mtError, mbOKCancel, 0);
  end;
end;

procedure TfrmAgentesJornal.AtualizaGrid;
begin
  if (not agente.getObjects) then
  begin
    Exit;
  end;
  tbAgente.Close;
  tbAgente.Open;
  tbAgente.IsLoading := True;
  tbAgente.LoadFromDataSet(dm.qryGetObject);
  tbAgente.IsLoading := False;
  dm.qryGetObject.Close;
  dm.qryGetObject.SQL.Clear;
  if (not tbAgente.IsEmpty) then
  begin
    tbAgente.First;
  end;

end;

end.
