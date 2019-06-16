unit ufrmServicos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxPCdxBarPopupMenu, cxPC,
  cxContainer, cxTextEdit, cxLabel, dxmdaset, Menus, StdCtrls, cxButtons,
  ActnList, clServicos, cxNavigator, cxImage, Vcl.ExtCtrls,
  cxGridExportLink, ShellAPI, cxSpinEdit, cxCheckBox, cxCurrencyEdit,
  dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  System.Actions, clConexao;

type
  TfrmServicos = class(TForm)
    tbServicos: TdxMemData;
    tbServicosCOD_SERVICO: TIntegerField;
    tbServicosDES_SERVICO: TStringField;
    ds: TDataSource;
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
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1COD_SERVICO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_SERVICO: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    actCadastroExportar: TAction;
    SaveDialog: TSaveDialog;
    tbServicosDOM_AGREGACAO: TStringField;
    cxGrid1DBTableView1DOM_AGREGACAO: TcxGridDBColumn;
    tbServicosVAL_SERVICO: TCurrencyField;
    cxGrid1DBTableView1VAL_SERVICO: TcxGridDBColumn;
    cxLabel16: TcxLabel;
    tbServicosVAL_AGREGADO: TFloatField;
    cxGrid1DBTableView1VAL_AGREGADO: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actCadastroSairExecute(Sender: TObject);
    procedure actCadastroExportarExecute(Sender: TObject);
    procedure tbServicosAfterDelete(DataSet: TDataSet);
    procedure tbServicosAfterPost(DataSet: TDataSet);
    procedure tbServicosBeforeCancel(DataSet: TDataSet);
    procedure tbServicosBeforeDelete(DataSet: TDataSet);
    procedure tbServicosBeforeEdit(DataSet: TDataSet);
    procedure tbServicosBeforeInsert(DataSet: TDataSet);
    procedure tbServicosBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AtualizaGrid;
  end;

var
  frmServicos: TfrmServicos;
  servico: TServicos;
  sOperacao: String;
  conexao: TConexao;

implementation

{$R *.dfm}

uses
  udm, clUtil, ufrmPrincipal;

procedure TfrmServicos.FormShow(Sender: TObject);
begin
  servico := TServicos.Create();
  conexao := TConexao.Create;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    actCadastroSairExecute(Sender);
    Exit;
  end;
  sOperacao := 'I';
  AtualizaGrid;
end;

procedure TfrmServicos.tbServicosAfterDelete(DataSet: TDataSet);
begin
  if not(servico.Delete('CODIGO')) then
  begin
    Application.MessageBox('Erro ao excluir o cliente!', 'Atenção',
      MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  Application.MessageBox('Cliente Excluído com sucesso !', 'Atenção',
    MB_OK + MB_ICONINFORMATION);
end;

procedure TfrmServicos.tbServicosAfterPost(DataSet: TDataSet);
begin
  if tbServicos.IsLoading then
  begin
    Exit;
  end;
  if sOperacao = 'I' then
  begin
    if not(servico.Insert) then
    begin
      Application.MessageBox('Erro ao incluir o serviço!', 'Atenção',
        MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
  end
  else if sOperacao = 'U' then
  begin
    if not(servico.Update) then
    begin
      Application.MessageBox('Erro ao alterar o servico!', 'Atenção',
        MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
  end;
end;

procedure TfrmServicos.tbServicosBeforeCancel(DataSet: TDataSet);
begin
  sOperacao := '';
end;

procedure TfrmServicos.tbServicosBeforeDelete(DataSet: TDataSet);
var
  sMess: String;
begin
  servico.Codigo := tbServicosCOD_SERVICO.AsInteger;
  sMess := 'Deseja Excluir o Serviço ' + tbServicosCOD_SERVICO.AsString + ' - '
    + tbServicosDES_SERVICO.Value + ' ?';
  if Application.MessageBox(PChar(sMess), 'Excluir', MB_YESNO + MB_ICONQUESTION)
    = IDNO then
  begin
    Abort;
    Exit;
  end;
end;

procedure TfrmServicos.tbServicosBeforeEdit(DataSet: TDataSet);
begin
  sOperacao := 'U';
end;

procedure TfrmServicos.tbServicosBeforeInsert(DataSet: TDataSet);
begin
  sOperacao := 'I';
end;

procedure TfrmServicos.tbServicosBeforePost(DataSet: TDataSet);
begin
  if tbServicos.IsLoading then
  begin
    Exit;
  end;
  if sOperacao = 'I' then
  begin
    servico.MaxCod;
    tbServicosCOD_SERVICO.AsInteger := servico.Codigo;
    servico.Descricao := tbServicosDES_SERVICO.AsString;
    servico.Agregacao := tbServicosDOM_AGREGACAO.AsString;
    servico.Valor := tbServicosVAL_SERVICO.AsCurrency;
    servico.ValorAgregado := tbServicosVAL_AGREGADO.AsCurrency;
  end
  else
  begin
    servico.Codigo := tbServicosCOD_SERVICO.AsInteger;
    servico.Descricao := tbServicosDES_SERVICO.AsString;
    servico.Agregacao := tbServicosDOM_AGREGACAO.AsString;
    servico.Valor := tbServicosVAL_SERVICO.AsCurrency;
    servico.ValorAgregado := tbServicosVAL_AGREGADO.AsCurrency;
  end;
  if not(servico.Validar) then
  begin
    Abort;
    tbServicos.Refresh;
    Exit;
  end;
  if Application.MessageBox('Confirma salvar os dados?', 'Incluir',
    MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Abort;
    Exit;
  end;
end;

procedure TfrmServicos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tbServicos.Close;
  servico.Free;
  conexao.Free;
  Action := caFree;
  frmServicos := Nil;
end;

procedure TfrmServicos.AtualizaGrid;
begin
  if not(servico.getObjects) then
  begin
    Exit;
  end;
  if not(dm.qryGetObject.IsEmpty) then
  begin
    dm.qryGetObject.First;
  end;
  if tbServicos.Active then
  begin
    tbServicos.Close;
  end;
  tbServicos.IsLoading := True;
  tbServicos.Open;
  while not(dm.qryGetObject.Eof) do
  begin
    tbServicos.Insert;
    tbServicosCOD_SERVICO.Value := dm.qryGetObject.FieldByName('COD_SERVICO')
      .AsInteger;
    tbServicosDES_SERVICO.Value := dm.qryGetObject.FieldByName
      ('DES_SERVICO').AsString;
    tbServicosDOM_AGREGACAO.Value := dm.qryGetObject.FieldByName
      ('DOM_AGREGACAO').AsString;
    tbServicosVAL_SERVICO.Value := dm.qryGetObject.FieldByName
      ('VAL_SERVICO').AsFloat;
    tbServicosVAL_AGREGADO.Value := dm.qryGetObject.FieldByName
      ('VAL_AGREGADO').AsFloat;
    tbServicos.Post;
    dm.qryGetObject.Next;
  end;

  dm.qryGetObject.Close;
  dm.qryGetObject.SQL.Clear;

  if not(tbServicos.IsEmpty) then
  begin
    tbServicos.First;
  end;
  tbServicos.IsLoading := False;
end;

procedure TfrmServicos.actCadastroExportarExecute(Sender: TObject);
var
  FileExt, sFile: String;
begin
  if not(tbServicos.Active) then
  begin
    Exit;
  end;
  if tbServicos.IsEmpty then
  begin
    Exit;
  end;
  sFile := 'servicos';
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

procedure TfrmServicos.actCadastroSairExecute(Sender: TObject);
begin
  Close;
end;

end.
