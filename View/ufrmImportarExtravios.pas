unit ufrmImportarExtravios;

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
  clCodigosEntregadores, clExtravios, clRestricoes,
  uthrImportarExtravios, uthrSalvarExtravios, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, System.Actions, Vcl.ClipBrd,
  clConexao, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light;

type
  TfrmImportarExtravios = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxDataExtravio: TcxDateEdit;
    DS: TDataSource;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1NUM_NOSSONUMERO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_EXTRAVIO: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_EXTRAVIO: TcxGridDBColumn;
    cxGrid1DBTableView1COD_ENTREGADOR: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_ENTREGADOR: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_PRODUTO: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_MULTA: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_VERBA: TcxGridDBColumn;
    cxLabel27: TcxLabel;
    aclImportarExtravio: TActionList;
    actImportarSalvar: TAction;
    actImportarLer: TAction;
    actImportarSair: TAction;
    actImportarApoio: TAction;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxProgressBar1: TcxProgressBar;
    OpenDialog: TOpenDialog;
    cxGrid1DBTableView1DES_RESTRICAO: TcxGridDBColumn;
    PopupMenu1: TPopupMenu;
    actImportarColarTodos: TAction;
    Colaremtodos1: TMenuItem;
    procedure actImportarApoioExecute(Sender: TObject);
    procedure actImportarLerExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actImportarSairExecute(Sender: TObject);
    procedure cxGrid1DBTableView1COD_ENTREGADORPropertiesValidate
      (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure actImportarSalvarExecute(Sender: TObject);
    procedure actImportarColarTodosExecute(Sender: TObject);
  private
    { Private declarations }
    procedure ListaEntregador;
  public
    { Public declarations }
    sArquivo: String;
  end;

var
  frmImportarExtravios: TfrmImportarExtravios;
  entregador: TCodigosEntregadores;
  extravio: TExtravios;
  restricao: TRestricoes;
  thrExtravios: thrImportarExtravios;
  thrSalvaExtravios: thrSalvarExtravios;
  conexao: TConexao;

implementation

{$R *.dfm}

uses
  udm, uGlobais, clUtil, ufrmListaApoio;

procedure TfrmImportarExtravios.actImportarApoioExecute(Sender: TObject);
begin
  if cxGrid1DBTableView1COD_ENTREGADOR.Focused then
  begin
    ListaEntregador;
  end;
end;

procedure TfrmImportarExtravios.actImportarColarTodosExecute(Sender: TObject);
var
  iCodigo: Integer;
begin
  if dm.tbImportacaoExtravio.IsEmpty then
  begin
    Exit;
  end;
  if (not dm.tbImportacaoExtravio.Active) then
  begin
    Exit;
  end;
  if cxGrid1DBTableView1DES_EXTRAVIO.Focused then
  begin
    if TUtil.Empty(Clipboard.AsText) then
    begin
      Exit;
    end;
    while (not dm.tbImportacaoExtravio.Eof) do
    begin
      dm.tbImportacaoExtravio.Edit;
      dm.tbImportacaoExtravioDES_EXTRAVIO.Value := Clipboard.AsText;
      dm.tbImportacaoExtravio.Post;
      dm.tbImportacaoExtravio.Next;
    end;
  end;
  if cxGrid1DBTableView1COD_ENTREGADOR.Focused then
  begin
    iCodigo := 0;
    if TUtil.Empty(Clipboard.AsText) then
    begin
      Exit;
    end;
    if (not TryStrToInt(Clipboard.AsText, iCodigo)) then
    begin
      Exit;
    end;
    while (not dm.tbImportacaoExtravio.Eof) do
    begin
      dm.tbImportacaoExtravio.Edit;
      dm.tbImportacaoExtravioCOD_ENTREGADOR.Value := StrToInt(Clipboard.AsText);
      entregador.Codigo := StrToInt(Clipboard.AsText);
      dm.tbImportacaoExtravioNOM_ENTREGADOR.Value :=
        entregador.getField('NOM_FANTASIA', 'CODIGO');
      dm.tbImportacaoExtravio.Post;
      dm.tbImportacaoExtravio.Next;
    end;
  end;
  if cxGrid1DBTableView1DES_RESTRICAO.Focused then
  begin
    if TUtil.Empty(Clipboard.AsText) then
    begin
      Exit;
    end;
    while (not dm.tbImportacaoExtravio.Eof) do
    begin
      dm.tbImportacaoExtravio.Edit;
      dm.tbImportacaoExtravioDES_RESTRICAO.Value := Clipboard.AsText;
      dm.tbImportacaoExtravio.Post;
      dm.tbImportacaoExtravio.Next;
    end;
  end;
end;

procedure TfrmImportarExtravios.actImportarLerExecute(Sender: TObject);
begin
  if TUtil.Empty(cxDataExtravio.Text) then
  begin
    Application.MessageBox('Informe a data do Extravio.', 'Atenção!',
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
  DS.Enabled := False;
  cxProgressBar1.Visible := True;
  dm.tbImportacaoExtravio.Open;
  thrExtravios := thrImportarExtravios.Create(True);
  thrExtravios.FreeOnTerminate := True;
  thrExtravios.Priority := tpNormal;
  thrExtravios.Start;
end;

procedure TfrmImportarExtravios.actImportarSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmImportarExtravios.actImportarSalvarExecute(Sender: TObject);
begin
  if dm.tbImportacaoExtravio.IsEmpty then
  begin
    Exit;
  end;
  if Application.MessageBox('Confirma gravar os extravios?', 'Gravar Extravios',
    MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  DS.Enabled := False;
  cxProgressBar1.Visible := True;
  thrSalvaExtravios := thrSalvarExtravios.Create(True);
  thrSalvaExtravios.FreeOnTerminate := True;
  thrSalvaExtravios.Priority := tpNormal;
  thrSalvaExtravios.Start;
end;

procedure TfrmImportarExtravios.
  cxGrid1DBTableView1COD_ENTREGADORPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if entregador.getObject(DisplayValue, 'CODIGO') then
  begin
    dm.tbImportacaoExtravioCOD_ENTREGADOR.Value := DisplayValue;
    dm.tbImportacaoExtravioNOM_ENTREGADOR.Value := entregador.Nome;
  end
  else
  begin
    dm.tbImportacaoExtravioNOM_ENTREGADOR.Value := '';
  end;
end;

procedure TfrmImportarExtravios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  entregador.Free;
  extravio.Free;
  restricao.Free;
  conexao.Free;
  dm.tbImportacaoExtravio.Close;
  Action := caFree;
  frmImportarExtravios := nil;
end;

procedure TfrmImportarExtravios.FormShow(Sender: TObject);
begin
  entregador := TCodigosEntregadores.Create;
  extravio := TExtravios.Create;
  restricao := TRestricoes.Create;
  conexao := TConexao.Create;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    actImportarSairExecute(Sender);
    Exit;
  end;
end;

procedure TfrmImportarExtravios.ListaEntregador;
begin
  Screen.Cursor := crHourGlass;
  with dm.qryPesquisa do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT COD_ENTREGADOR AS "Código", NOM_FANTASIA AS "Nome" ' +
      'FROM tbcodigosentregadores ';
    dm.ZConn.PingServer;
    Open;
  end;
  if dm.qryPesquisa.IsEmpty then
  begin
    dm.qryPesquisa.Close;
    dm.qryPesquisa.SQL.Clear;
    Exit;
  end
  else
  begin
    dm.qryPesquisa.First;
  end;
  if not Assigned(frmListaApoio) then
  begin
    frmListaApoio := TfrmListaApoio.Create(Application);
  end;
  frmListaApoio.Caption := 'Entregadores';
  Screen.Cursor := crDefault;
  if frmListaApoio.ShowModal = mrOk then
  begin
    dm.tbImportacaoExtravio.Edit;
    dm.tbImportacaoExtravioCOD_ENTREGADOR.Value := dm.qryPesquisa.Fields[0]
      .AsInteger;
    dm.tbImportacaoExtravioNOM_ENTREGADOR.Value := dm.qryPesquisa.Fields
      [1].AsString;
    dm.tbImportacaoExtravio.Post;
  end;
  dm.tbApoio.Close;
  FreeAndNil(frmListaApoio);
end;

end.
