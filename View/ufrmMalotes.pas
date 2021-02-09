unit ufrmMalotes;

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
  cxGridTableView, cxGridDBTableView, cxGrid,  cxPC,
  cxContainer, cxLabel, dxmdaset, cxTextEdit, clMalote, ActnList, Menus,
  StdCtrls, cxButtons, cxMaskEdit, cxDropDownEdit, cxCalendar, cxButtonEdit,
  cxCurrencyEdit, Vcl.ComCtrls, dxCore, cxDateUtils, cxNavigator, cxImage,
  Vcl.ExtCtrls,
  cxGridExportLink, ShellAPI, cxGroupBox, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, System.Actions, clAcessos,
  clConexao, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxDateRanges, cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TfrmMalotes = class(TForm)
    tbMalote: TdxMemData;
    tbMaloteNUM_OS: TIntegerField;
    tbMaloteNUM_ROTEIRO: TIntegerField;
    tbMaloteDAT_OS: TDateField;
    tbMaloteDES_ORIGEM: TStringField;
    tbMaloteNOM_EXPEDIDOR: TStringField;
    tbMaloteDES_DESTINO: TStringField;
    tbMaloteNOM_RECEBEDOR: TStringField;
    tbMaloteDES_DOCUMENTO: TStringField;
    tbMaloteNUM_LACRE: TIntegerField;
    ds: TDataSource;
    aclCadastro: TActionList;
    actCadastroLocalizar: TAction;
    actCadastroExcluir: TAction;
    actCadastroCancelar: TAction;
    actCadastroSalvar: TAction;
    actCadastroSair: TAction;
    actCadastroCalcular: TAction;
    actCadastroExportar: TAction;
    tbMaloteDES_MESANO: TStringField;
    OpenDialog1: TOpenDialog;
    SaveDialog: TSaveDialog;
    tbMaloteVAL_SERVICO: TCurrencyField;
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLacre: TcxTextEdit;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxButton5: TcxButton;
    cxLabel6: TcxLabel;
    cxData: TcxDateEdit;
    cxLabel7: TcxLabel;
    cxDocumento: TcxButtonEdit;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1NUM_OS: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_ROTEIRO: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_OS: TcxGridDBColumn;
    cxGrid1DBTableView1DES_ORIGEM: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_EXPEDIDOR: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_LACRE: TcxGridDBColumn;
    cxGrid1DBTableView1DES_DESTINO: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_RECEBEDOR: TcxGridDBColumn;
    cxGrid1DBTableView1DES_DOCUMENTO: TcxGridDBColumn;
    colDES_MESANO: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_SERVICO: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxLabel11: TcxLabel;
    cxVisualizar: TcxComboBox;
    cxButton1: TcxButton;
    cxOrigem: TcxComboBox;
    cxExpedidor: TcxComboBox;
    cxDestino: TcxComboBox;
    cxRecebedor: TcxComboBox;
    cxLabel27: TcxLabel;
    procedure actCadastroExcluirExecute(Sender: TObject);
    procedure actCadastroCancelarExecute(Sender: TObject);
    procedure actCadastroSalvarExecute(Sender: TObject);
    procedure actCadastroSairExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxDocumentoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cxLacreKeyPress(Sender: TObject; var Key: Char);
    procedure cxGrid1DBTableView1CanFocusRecord(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; var AAllow: Boolean);
    procedure cxVisualizarPropertiesCloseUp(Sender: TObject);
    procedure actCadastroExportarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Modo;
    procedure SetupForm;
    procedure SetupClass;
    procedure AtualizaGrid;
    procedure SalvaGrid;
    procedure ListaCampos;
  end;

var
  frmMalotes: TfrmMalotes;
  malote: TMalote;
  sOperacao: String;
  iOS, iRoteiro: Integer;
  acessos: TAcessos;
  conexao: TConexao;

implementation

{$R *.dfm}

uses udm, clUtil, ufrmPrincipal, ZDataset, DateUtils;

procedure TfrmMalotes.actCadastroExcluirExecute(Sender: TObject);
begin
  if sOperacao = 'I' then
    Exit;

  if Application.MessageBox('Confirma excluir este Controle?',
    'Extrair Controle', MB_ICONQUESTION + MB_YESNO) = idno then
    Exit;

  if malote.Delete('ROTEIRO') then
  begin
    MessageDlg('Registro Excluído.', mtInformation, [mbOK], 0);
    tbMalote.IsLoading := True;
    TUtil.LimparFields(Self);
    tbMalote.IsLoading := False;
    sOperacao := 'I';
    Modo;
    AtualizaGrid;
    cxData.SetFocus;
  end;
end;

procedure TfrmMalotes.actCadastroExportarExecute(Sender: TObject);
var
  FileExt: String;
begin
  if not(tbMalote.Active) then
  begin
    Exit;
  end;
  if tbMalote.IsEmpty then
  begin
    Exit;
  end;
  SaveDialog.Filter :=
    'Excel (*.xls) |*.xls|XML (*.xml) |*.xml|Arquivo Texto (*.txt) |*.txt|Página Web (*.html)|*.html';
  SaveDialog.Title := 'Exportar Dados';
  SaveDialog.DefaultExt := 'xls';
  if SaveDialog.Execute then
  begin
    cxGrid1DBTableView1VAL_SERVICO.Visible := True;
    cxGrid1.Refresh;
    FileExt := LowerCase(ExtractFileExt(SaveDialog.FileName));
    if FileExt = '.xls' then
      ExportGridToExcel(SaveDialog.FileName, cxGrid1, False, True, False)
    else if FileExt = '.xml' then
      ExportGridToXML(SaveDialog.FileName, cxGrid1, False)
    else if FileExt = '.txt' then
      ExportGridToText(SaveDialog.FileName, cxGrid1, False)
    else if FileExt = '.html' then
      ExportGridToHTML(SaveDialog.FileName, cxGrid1, False);
    cxGrid1DBTableView1VAL_SERVICO.Visible := False;
    ShellExecute(Handle, 'open', pchar(SaveDialog.FileName), nil, nil, SW_SHOW);
  end;
end;

procedure TfrmMalotes.actCadastroCancelarExecute(Sender: TObject);
begin
  TUtil.LimparFields(Self);
  sOperacao := 'I';
  Modo;
  cxData.SetFocus;
end;

procedure TfrmMalotes.actCadastroSalvarExecute(Sender: TObject);
var
  iItem: Integer;
begin
  iItem := 0;
  SetupClass;
  if not(malote.Validar()) then
    Exit;
  if Application.MessageBox('Confirma salvar este Controle?', 'Salvar',
    MB_ICONQUESTION + MB_YESNO) = idno then
    Exit;
  if sOperacao = 'I' then
  begin
    if not(malote.Insert()) then
    begin
      MessageDlg('Não foi possível incluir este Controle!', mtWarning,
        [mbOK], 0);
      Exit;
    end;
  end
  else
  begin
    if not(malote.Update()) then
      MessageDlg('Não foi possível alterar este Controle!', mtWarning,
        [mbOK], 0);
    Exit;
  end;
  MessageDlg('Registro Salvo com sucesso!', mtInformation, [mbOK], 0);
  if sOperacao = 'U' then
  begin
    AtualizaGrid;
  end
  else
  begin
    SalvaGrid;
  end;
  sOperacao := 'I';
  tbMalote.IsLoading := True;
  iItem := cxVisualizar.ItemIndex;
  TUtil.LimparFields(Self);
  cxVisualizar.ItemIndex := iItem;
  tbMalote.IsLoading := False;
  ListaCampos;
  Modo;
  cxData.SetFocus;
end;

procedure TfrmMalotes.actCadastroSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmMalotes.FormShow(Sender: TObject);
begin
  iOS := 0;
  iRoteiro := 0;
  malote := TMalote.Create();
  acessos := TAcessos.Create;
  conexao := TConexao.Create;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    actCadastroSairExecute(Sender);
    Exit;
  end;
  AtualizaGrid;
  ListaCampos;
  sOperacao := 'I';
  cxData.SetFocus;
end;

procedure TfrmMalotes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  malote.Free;
  acessos.Free;
  conexao.Free;
  if tbMalote.Active then
    tbMalote.Close;
  Action := caFree;
  frmMalotes := Nil;
end;

procedure TfrmMalotes.Modo;
begin
  if sOperacao = 'I' then
  begin
    actCadastroExcluir.Enabled := False;
    actCadastroCancelar.Enabled := True;
    actCadastroSalvar.Enabled := True;
    actCadastroLocalizar.Enabled := True;
    actCadastroSair.Enabled := True;
  end
  else if sOperacao = 'U' then
  begin
    actCadastroCancelar.Enabled := True;
    actCadastroExcluir.Enabled := True;
    actCadastroSalvar.Enabled := True;
    actCadastroLocalizar.Enabled := True;
    actCadastroSair.Enabled := True;
  end;
  acessos.SetNivel(aclCadastro);
end;

procedure TfrmMalotes.SetupForm;
begin
  iOS := malote.Os;
  iRoteiro := malote.Roteiro;
  cxData.Date := malote.Data;
  cxOrigem.Text := malote.Origem;
  cxExpedidor.Text := malote.Expedidor;
  cxLacre.Text := IntToStr(malote.Lacre);
  cxDestino.Text := malote.Destino;
  cxRecebedor.Text := malote.Recebedor;
  cxDocumento.Text := malote.Documento;
end;

procedure TfrmMalotes.SetupClass;
begin
  if sOperacao = 'I' then
  begin
    if (malote.getObject(cxData.Text, 'DATA')) then
    begin
      malote.MaxRoteiro;
    end
    else
    begin
      malote.MaxOS;
      malote.MaxRoteiro;
    end;
  end
  else
  begin
    malote.Os := iOS;
    malote.Roteiro := iRoteiro;
  end;
  malote.Data := cxData.Date;
  malote.Origem := cxOrigem.Text;
  malote.Expedidor := cxExpedidor.Text;
  malote.Destino := cxDestino.Text;
  malote.Recebedor := cxRecebedor.Text;
  malote.Documento := cxDocumento.Text;
  if TUtil.Empty(cxLacre.Text) then
  begin
    cxLacre.Text := '0';
  end;
  malote.Lacre := StrToInt(cxLacre.Text);
end;

procedure TfrmMalotes.cxDocumentoPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  if OpenDialog1.Execute then
  begin
    cxDocumento.Text := OpenDialog1.FileName;
  end;
end;

procedure TfrmMalotes.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then
  begin
    if cxGrid1.IsFocused then
      Exit;
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfrmMalotes.AtualizaGrid;
var
  sMesAno, sData: String;
  dtData: TDate;
  iMes, iAno: Integer;
begin
  if tbMalote.IsLoading then
  begin
    Exit;
  end;
  iMes := 0;
  iAno := 0;
  if dm.qryGeral.Active then
    dm.qryGeral.Close;
  dm.qryGeral.SQL.Clear;
  dm.qryGeral.SQL.Add('SELECT * FROM tbcontrolemalotes');
  if cxVisualizar.ItemIndex = 1 then
  begin
    iMes := MonthOf(Now);
    iAno := YearOf(Now);
    dm.qryGeral.SQL.Add
      ('WHERE EXTRACT(MONTH FROM DAT_OS) = :MES AND EXTRACT(YEAR FROM DAT_OS) = :ANO');
    dm.qryGeral.ParamByName('MES').AsInteger := iMes;
    dm.qryGeral.ParamByName('ANO').AsInteger := iAno;
  end;
  if cxVisualizar.ItemIndex = 2 then
  begin
    iAno := YearOf(Now);
    dm.qryGeral.SQL.Add('WHERE EXTRACT(YEAR FROM DAT_OS) = :ANO');
    dm.qryGeral.ParamByName('ANO').AsInteger := iAno;
  end;
  if cxVisualizar.ItemIndex = 3 then
  begin
    iMes := MonthOf(Now);
    iAno := YearOf(Now);
    sData := '01/' + IntToStr(iMes) + '/' + IntToStr(iAno);
    dtData := StrToDate(sData) - 90;
    dm.qryGeral.SQL.Add('WHERE DAT_OS >= :DATA');
    dm.qryGeral.ParamByName('DATA').AsDate := dtData;
  end;
  if cxVisualizar.ItemIndex = 4 then
  begin
    iMes := MonthOf(Now);
    iAno := YearOf(Now);
    sData := '01/' + IntToStr(iMes) + '/' + IntToStr(iAno);
    dtData := StrToDate(sData) - 365;
    dm.qryGeral.SQL.Add('WHERE DAT_OS >= :DATA');
    dm.qryGeral.ParamByName('DATA').AsDate := dtData;
  end;
  dm.ZConn.Reconnect;
  dm.qryGeral.Open;
  if not(dm.qryGeral.IsEmpty) then
    dm.qryGeral.First;
  if tbMalote.Active then
    tbMalote.Close;
  tbMalote.Open;
  while not(dm.qryGeral.Eof) do
  begin
    tbMalote.Insert;
    tbMaloteNUM_OS.Value := dm.qryGeral.FieldByName('NUM_OS').AsInteger;
    tbMaloteNUM_ROTEIRO.Value := dm.qryGeral.FieldByName('NUM_ROTEIRO')
      .AsInteger;
    tbMaloteDAT_OS.Value := dm.qryGeral.FieldByName('DAT_OS').AsDateTime;
    tbMaloteDES_ORIGEM.Value := dm.qryGeral.FieldByName('DES_ORIGEM').AsString;
    tbMaloteNOM_EXPEDIDOR.Value := dm.qryGeral.FieldByName
      ('NOM_EXPEDIDOR').AsString;
    tbMaloteDES_DESTINO.Value := dm.qryGeral.FieldByName('DES_DESTINO')
      .AsString;
    tbMaloteNOM_RECEBEDOR.Value := dm.qryGeral.FieldByName
      ('NOM_RECEBEDOR').AsString;
    tbMaloteDES_DOCUMENTO.Value := dm.qryGeral.FieldByName
      ('DES_DOCUMENTO').AsString;
    tbMaloteNUM_LACRE.Value := dm.qryGeral.FieldByName('NUM_LACRE').AsInteger;
    sMesAno := Copy(FormatDateTime('dd/mm/yyyy', tbMaloteDAT_OS.Value), 4, 7);
    tbMaloteDES_MESANO.Value := sMesAno;
    tbMaloteVAL_SERVICO.Value := 11.5;
    tbMalote.Post;
    dm.qryGeral.Next;
  end;
  if not(tbMalote.IsEmpty) then
    tbMalote.First;
  dm.qryGeral.Close;
  dm.qryGeral.SQL.Clear;
end;

procedure TfrmMalotes.cxLacreKeyPress(Sender: TObject; var Key: Char);
begin
  Key := TUtil.SoNumero(Key);
end;

procedure TfrmMalotes.cxVisualizarPropertiesCloseUp(Sender: TObject);
begin
  AtualizaGrid;
end;

procedure TfrmMalotes.cxGrid1DBTableView1CanFocusRecord
  (Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  var AAllow: Boolean);
var
  sCodigo: String;
  i, iRet: Integer;
begin
  if tbMalote.Active then
  begin
    if not(tbMalote.IsEmpty) then
    begin
      sCodigo := ARecord.DisplayTexts[1];
      Val(sCodigo, i, iRet);
      if iRet <> 0 then
      begin
        TUtil.LimparFields(Self);
        Exit;
      end;
      malote.Os := StrToInt(ARecord.DisplayTexts[0]);
      if malote.getObject(sCodigo, 'ROTEIRO') then
      begin
        SetupForm;
        iOS := malote.Os;
        iRoteiro := malote.Roteiro;
        sOperacao := 'U';
        Modo;
      end
      else
      begin
        TUtil.LimparFields(Self);
        sOperacao := 'I';
        Modo;
      end;
    end;
  end;
end;

procedure TfrmMalotes.SalvaGrid;
var
  sMesAno: String;
begin
  tbMalote.Insert;
  tbMaloteNUM_OS.Value := malote.Os;;
  tbMaloteNUM_ROTEIRO.Value := malote.Roteiro;
  tbMaloteDAT_OS.Value := malote.Data;
  tbMaloteDES_ORIGEM.Value := malote.Origem;
  tbMaloteNOM_EXPEDIDOR.Value := malote.Expedidor;
  tbMaloteDES_DESTINO.Value := malote.Destino;
  tbMaloteNOM_RECEBEDOR.Value := malote.Recebedor;
  tbMaloteDES_DOCUMENTO.Value := malote.Documento;
  tbMaloteNUM_LACRE.Value := malote.Lacre;
  sMesAno := Copy(FormatDateTime('dd/mm/yyyy', malote.Data), 4, 7);
  tbMaloteDES_MESANO.Value := sMesAno;
  tbMaloteVAL_SERVICO.Value := 11.5;
  tbMalote.Post;
end;

procedure TfrmMalotes.ListaCampos;
begin
  with dm.qryGeral do
  begin
    Close;
    SQL.Clear;
    SQL.Text :=
      'SELECT DISTINCT DES_ORIGEM FROM tbcontrolemalotes ORDER BY DES_ORIGEM';
    dm.ZConn.PingServer;
    Open;
    if not(IsEmpty) then
    begin
      First;
    end;
    cxOrigem.Properties.Items.Clear;
    while not(Eof) do
    begin
      cxOrigem.Properties.Items.Add(FieldByName('DES_ORIGEM').AsString);
      Next;
    end;
    cxOrigem.ItemIndex := -1;
    Close;
    SQL.Clear;
  end;
  with dm.qryGeral do
  begin
    Close;
    SQL.Clear;
    SQL.Text :=
      'SELECT DISTINCT NOM_EXPEDIDOR FROM tbcontrolemalotes ORDER BY NOM_EXPEDIDOR';
    dm.ZConn.PingServer;
    Open;
    if not(IsEmpty) then
    begin
      First;
    end;
    cxExpedidor.Properties.Items.Clear;
    while not(Eof) do
    begin
      cxExpedidor.Properties.Items.Add(FieldByName('NOM_EXPEDIDOR').AsString);
      Next;
    end;
    cxExpedidor.ItemIndex := -1;
    Close;
    SQL.Clear;
  end;
  with dm.qryGeral do
  begin
    Close;
    SQL.Clear;
    SQL.Text :=
      'SELECT DISTINCT DES_DESTINO FROM tbcontrolemalotes ORDER BY DES_DESTINO';
    dm.ZConn.PingServer;
    Open;
    if not(IsEmpty) then
    begin
      First;
    end;
    cxDestino.Properties.Items.Clear;
    while not(Eof) do
    begin
      cxDestino.Properties.Items.Add(FieldByName('DES_DESTINO').AsString);
      Next;
    end;
    cxDestino.ItemIndex := -1;
    Close;
    SQL.Clear;
  end;
  with dm.qryGeral do
  begin
    Close;
    SQL.Clear;
    SQL.Text :=
      'SELECT DISTINCT NOM_RECEBEDOR FROM tbcontrolemalotes ORDER BY NOM_RECEBEDOR';
    dm.ZConn.PingServer;
    Open;
    if not(IsEmpty) then
    begin
      First;
    end;
    cxRecebedor.Properties.Items.Clear;
    while not(Eof) do
    begin
      cxRecebedor.Properties.Items.Add(FieldByName('NOM_RECEBEDOR').AsString);
      Next;
    end;
    cxRecebedor.ItemIndex := -1;
    Close;
    SQL.Clear;
  end;
end;

end.
