unit ufrmImportarEtiquetas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxButtonEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxLabel, cxGroupBox, Data.DB, dxmdaset, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid, Vcl.ActnList, Vcl.Menus, cxProgressBar, Vcl.StdCtrls, cxButtons,
  dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  System.Actions, Vcl.ClipBrd, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, uthrImportarEtiquetas, cxSpinEdit,
  clEstados, uthrSalvarEtiquetas, cxImageComboBox;

type
  TfrmImportarEtiquetas = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxDataEdicao: TcxDateEdit;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxLabel27: TcxLabel;
    aclImportarEtiquetas: TActionList;
    actImportarSalvar: TAction;
    actImportarLer: TAction;
    actImportarSair: TAction;
    actImportarApoio: TAction;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    OpenDialog: TOpenDialog;
    PopupMenu1: TPopupMenu;
    actImportarColarTodos: TAction;
    Colaremtodos1: TMenuItem;
    cxGrid1DBTableView1COD_ASSINANTE: TcxGridDBColumn;
    cxGrid1DBTableView1COD_PRODUTO: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_EDICAO: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_EDICAO: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_ASSINANTE: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_CUIDADOS: TcxGridDBColumn;
    cxGrid1DBTableView1DES_ENDERECO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_COMPLEMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_BAIRRO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_REFERENCIA: TcxGridDBColumn;
    cxGrid1DBTableView1DES_CIDADE: TcxGridDBColumn;
    cxGrid1DBTableView1DES_UF: TcxGridDBColumn;
    cxGrid1DBTableView1CEP_ENDERECO: TcxGridDBColumn;
    cxGrid1DBTableView1QTD_EXEMPLARES: TcxGridDBColumn;
    dsEstado: TDataSource;
    dsProdutos: TDataSource;
    dsTipo: TDataSource;
    cxGrid1DBTableView1COD_TIPO_ASSINATURA: TcxGridDBColumn;
    cxGrid1DBTableView1DOM_PROTOCOLO: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_ROTEIRO: TcxGridDBColumn;
    procedure actImportarLerExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actImportarSairExecute(Sender: TObject);
    procedure actImportarSalvarExecute(Sender: TObject);
    procedure actImportarColarTodosExecute(Sender: TObject);
  private
    { Private declarations }
    procedure PopulaEstados;
  public
    { Public declarations }
    sArquivo: String;
  end;

var
  frmImportarEtiquetas: TfrmImportarEtiquetas;
  estados: TEstados;
  thrEtiquetas: thrImportarEtiquetas;
  thrSalvaEtiquetas: thrSalvarEtiquetas;

implementation

{$R *.dfm}

uses
  udm, uGlobais, clUtil, ufrmListaApoio, ufrmProcesso;

procedure TfrmImportarEtiquetas.actImportarColarTodosExecute(Sender: TObject);
var
  iCodigo: Integer;
  sCodigo: String;
begin
  if dm.tbImportacaoEtiquetas.IsEmpty then
  begin
    Exit;
  end;
  if (not dm.tbImportacaoEtiquetas.Active) then
  begin
    Exit;
  end;
  if cxGrid1DBTableView1COD_PRODUTO.Focused then
  begin
    sCodigo := dm.tbImportacaoEtiquetasCOD_PRODUTO.Value;
    dm.tbImportacaoEtiquetas.First;
    dm.tbImportacaoEtiquetas.IsLoading := True;
    while (not dm.tbImportacaoEtiquetas.Eof) do
    begin
      dm.tbImportacaoEtiquetas.Edit;
      dm.tbImportacaoEtiquetasCOD_PRODUTO.Value := sCodigo;
      dm.tbImportacaoEtiquetas.Post;
      dm.tbImportacaoEtiquetas.Next;
    end;
    dm.tbImportacaoEtiquetas.First;
    dm.tbImportacaoEtiquetas.IsLoading := False;
  end;
  if cxGrid1DBTableView1NUM_EDICAO.Focused then
  begin
    sCodigo := dm.tbImportacaoEtiquetasNUM_EDICAO.Value;
    dm.tbImportacaoEtiquetas.First;
    dm.tbImportacaoEtiquetas.IsLoading := True;
    while (not dm.tbImportacaoEtiquetas.Eof) do
    begin
      dm.tbImportacaoEtiquetas.Edit;
      dm.tbImportacaoEtiquetasNUM_EDICAO.Value := sCodigo;
      dm.tbImportacaoEtiquetas.Post;
      dm.tbImportacaoEtiquetas.Next;
    end;
    dm.tbImportacaoEtiquetas.First;
    dm.tbImportacaoEtiquetas.IsLoading := False;
  end;
  if cxGrid1DBTableView1DAT_EDICAO.Focused then
  begin
    sCodigo := dm.tbImportacaoEtiquetasDAT_EDICAO.AsString;
    dm.tbImportacaoEtiquetas.First;
    dm.tbImportacaoEtiquetas.IsLoading := True;
    while (not dm.tbImportacaoEtiquetas.Eof) do
    begin
      dm.tbImportacaoEtiquetas.Edit;
      dm.tbImportacaoEtiquetasDAT_EDICAO.Value := StrToDate(sCodigo);
      dm.tbImportacaoEtiquetas.Post;
      dm.tbImportacaoEtiquetas.Next;
    end;
    dm.tbImportacaoEtiquetas.First;
    dm.tbImportacaoEtiquetas.IsLoading := False;
  end;
  if cxGrid1DBTableView1NUM_ROTEIRO.Focused then
  begin
    sCodigo := dm.tbImportacaoEtiquetasNUM_ROTEIRO.AsString;
    dm.tbImportacaoEtiquetas.First;
    dm.tbImportacaoEtiquetas.IsLoading := True;
    while (not dm.tbImportacaoEtiquetas.Eof) do
    begin
      dm.tbImportacaoEtiquetas.Edit;
      dm.tbImportacaoEtiquetasNUM_ROTEIRO.Value := StrToIntDef(sCodigo,0);
      dm.tbImportacaoEtiquetas.Post;
      dm.tbImportacaoEtiquetas.Next;
    end;
    dm.tbImportacaoEtiquetas.First;
    dm.tbImportacaoEtiquetas.IsLoading := False;
  end;
end;

procedure TfrmImportarEtiquetas.actImportarLerExecute(Sender: TObject);
begin
  if TUtil.Empty(cxDataEdicao.Text) then
  begin
    Application.MessageBox('Informe a data da Edição.', 'Atenção!',
      MB_OK + MB_ICONWARNING);
    Exit;
  end;
  sArquivo := '';
  if OpenDialog.Execute then
  begin
    sArquivo := OpenDialog.FileName;
  end
  else
  begin
    Exit;
  end;
  if Application.MessageBox(PChar('Confirma importar o arquivo ' + sArquivo +
    ' ?'), 'Importar Etiquetas', MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  uGlobais.sParemetro := cxDataEdicao.Text;
  uGlobais.iLinhas := TUtil.NumeroDeLinhasTXT(sArquivo);
  uGlobais.sParametro1 := sArquivo;
  dm.tbImportacaoEtiquetas.Close;
  dm.tbImportacaoEtiquetas.Open;
  if not Assigned(frmProcesso) then
  begin
    frmProcesso := TfrmProcesso.Create(Application);
  end;
  frmProcesso.Show;
  dm.dsImportaEtiquetas.Enabled := False;
  dm.tbImportacaoEtiquetas.Open;
  thrEtiquetas := thrImportarEtiquetas.Create(True);
  thrEtiquetas.FreeOnTerminate := True;
  thrEtiquetas.Priority := tpNormal;
  thrEtiquetas.Start;
end;

procedure TfrmImportarEtiquetas.actImportarSairExecute(Sender: TObject);
begin
  try
    Perform(WM_CLOSE, 0, 0);
  except
    on E: Exception do
      MessageDlg(E.Message, mtError, mbOKCancel, 0);
  end;
end;

procedure TfrmImportarEtiquetas.actImportarSalvarExecute(Sender: TObject);
begin
  if dm.tbImportacaoEtiquetas.IsEmpty then
  begin
    Exit;
  end;
  if Application.MessageBox('Confirma gravar as etiquetas?', 'Gravar Etiquetas',
    MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  if not Assigned(frmProcesso) then
  begin
    frmProcesso := TfrmProcesso.Create(Application);
  end;
  frmProcesso.Show;
  dm.dsImportaEtiquetas.Enabled := False;
  thrSalvaEtiquetas := thrSalvarEtiquetas.Create(True);
  thrSalvaEtiquetas.FreeOnTerminate := True;
  thrSalvaEtiquetas.Priority := tpNormal;
  thrSalvaEtiquetas.Start;
end;

procedure TfrmImportarEtiquetas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dm.tbEstados.Close;
  dm.tbProdutos.Close;
  dm.tbTipoAssinatura.Close;
  dm.tbImportacaoEtiquetas.Close;
  Action := caFree;
  frmImportarEtiquetas := Nil;
end;

procedure TfrmImportarEtiquetas.FormShow(Sender: TObject);
begin
  PopulaEstados;
end;

procedure TfrmImportarEtiquetas.PopulaEstados;
begin
  estados := TEstados.Create;
  dm.tbEstados.Close;
  dm.tbEstados.Open;
  dm.tbEstados.IsLoading := True;
  if estados.getObjects() then
  begin
    dm.tbEstados.LoadFromDataSet(dm.qryGetObject);
    if (not dm.tbEstados.IsEmpty) then
    begin
      dm.tbEstados.First;
    end;
  end;
  dm.qryGetObject.Close;
  dm.qryGetObject.SQL.Clear;
  estados.Free;
end;

end.
