unit ufrmExtratoAgente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin,
  dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxSkinscxPCPainter,  dxSkinsdxStatusBarPainter, cxPC,
  dxStatusBar, Data.DB, dxmdaset, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLabel, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxCalendar, cxProgressBar, cxGridBandedTableView,
  cxGridDBBandedTableView, Vcl.ActnList, DateUtils,
  uthrExtratoFechadoAgente, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  cxGridExportLink, ShellAPI, uthrExtratoPrevioAgente, clBaixas,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxBarBuiltInMenu, System.Actions, cxButtonEdit, clAgentes, cxCheckBox,
  clAcessos, clConexao, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxDateRanges, cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TfrmExtratoAgente = class(TForm)
    cxPageControl1: TcxPageControl;
    dxStatusBar1: TdxStatusBar;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    dsPrevia: TDataSource;
    cxLabel1: TcxLabel;
    dxStatusBar1Container0: TdxStatusBarContainerControl;
    cxProgressBar: TcxProgressBar;
    cxLabel2: TcxLabel;
    dsExtrato: TDataSource;
    aclExtrato: TActionList;
    cxDataPagamento: TcxComboBox;
    cxDataInicio: TcxDateEdit;
    cxLabel3: TcxLabel;
    cxDataTermino: TcxDateEdit;
    actExtratoPrevia: TAction;
    actExtratoFechado: TAction;
    actExtratoExportarPrevia: TAction;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    SaveDialog: TSaveDialog;
    actExtratoExportarExtrato: TAction;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1COD_ENTREGADOR: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_FANTASIA: TcxGridDBColumn;
    cxGrid1DBTableView1QTD_ENTREGAS_1: TcxGridDBColumn;
    cxGrid1DBTableView1QTD_ENTREGAS_2: TcxGridDBColumn;
    cxGrid1DBTableView1QTD_ENTREGAS_3: TcxGridDBColumn;
    cxGrid1DBTableView1QTD_ENTREGAS_4: TcxGridDBColumn;
    cxGrid1DBTableView1QTD_ENTREGAS_5: TcxGridDBColumn;
    cxGrid1DBTableView1QTD_ENTREGAS_6: TcxGridDBColumn;
    cxGrid1DBTableView1QTD_ENTREGAS_7: TcxGridDBColumn;
    cxGrid1DBTableView1QTD_ENTREGAS_8: TcxGridDBColumn;
    cxGrid1DBTableView1QTD_ENTREGAS_9: TcxGridDBColumn;
    cxGrid1DBTableView1QTD_ENTREGAS_10: TcxGridDBColumn;
    cxGrid1DBTableView1QTD_ENTREGAS_11: TcxGridDBColumn;
    cxGrid1DBTableView1QTD_ENTREGAS_12: TcxGridDBColumn;
    cxGrid1DBTableView1QTD_ENTREGAS_13: TcxGridDBColumn;
    cxGrid1DBTableView1QTD_ENTREGAS_14: TcxGridDBColumn;
    cxGrid1DBTableView1QTD_ENTREGAS_15: TcxGridDBColumn;
    cxGrid1DBTableView1QTD_ENTREGAS_16: TcxGridDBColumn;
    cxGrid1DBTableView1QTD_TOTAL: TcxGridDBColumn;
    cxLabel27: TcxLabel;
    actExtratoSair: TAction;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DES_AGENTE: TcxGridDBColumn;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DES_ENTREGADOR: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_PERCENTUAL_ENTREGADOR: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_VERBA: TcxGridDBColumn;
    cxGrid1DBTableView1QTD_VOLUMES: TcxGridDBColumn;
    cxGrid1DBTableView1QTD_ENTREGA: TcxGridDBColumn;
    cxGrid1DBTableView1QTD_VOLUMES_EXTRA: TcxGridDBColumn;
    cxGrid1DBTableView1QTD_ATRASOS: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_CREDITO: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_DEBITO: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_RESTRICAO: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_ABASTECIMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_TOTAL_GERAL: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_INICIO: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_TERMINO: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_INICIO_ABASTECIMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_FINAL_ABASTECIMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_PAGO: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_EXTRATO: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxCodigoAgente: TcxButtonEdit;
    cxNomeAgente: TcxTextEdit;
    cxLabel6: TcxLabel;
    cxCodAgente: TcxButtonEdit;
    cxNomAgente: TcxTextEdit;
    actExtratoApoio: TAction;
    cxGrid1DBTableView1DES_AGENTE1: TcxGridDBColumn;
    cxDetalhes: TcxCheckBox;
    cxButton5: TcxButton;
    actExtratoExtravios: TAction;
    cxButton6: TcxButton;
    ActExtratoLancamentos: TAction;
    cxButton7: TcxButton;
    procedure actExtratoPreviaExecute(Sender: TObject);
    procedure MontaListaAgentes(sAgente: String);
    procedure DatasPagamento;
    procedure MontaCabecalho;
    procedure actExtratoFechadoExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actExtratoExportarPreviaExecute(Sender: TObject);
    procedure actExtratoExportarExtratoExecute(Sender: TObject);
    procedure actExtratoSairExecute(Sender: TObject);
    procedure cxCodigoAgentePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure actExtratoApoioExecute(Sender: TObject);
    procedure cxDetalhesPropertiesChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure actExtratoExtraviosExecute(Sender: TObject);
    procedure cxCodAgentePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure ActExtratoLancamentosExecute(Sender: TObject);
  private
    { Private declarations }
    procedure ListaAgente;
    procedure PopularExtravios;
    procedure PopularLancamentos;
  public
    { Public declarations }
  end;

var
  frmExtratoAgente: TfrmExtratoAgente;
  thrPrevia: thrExtratoPrevio;
  thrExtrato: thrExtratoFechado;
  baixa: TBaixa;
  agente: TAgente;
  acessos: TAcessos;
  conexao: TConexao;

implementation

{$R *.dfm}

uses
  udm, clUtil, uGlobais, ufrmListaApoio, ufrmDetalhesRestricoes,
  ufrmDetalhesLancamentos;

procedure TfrmExtratoAgente.actExtratoApoioExecute(Sender: TObject);
begin
  ListaAgente;
end;

procedure TfrmExtratoAgente.actExtratoExportarExtratoExecute(Sender: TObject);
var
  FileExt, sFile: String;
begin
  if not(dm.tbExtrato.Active) then
  begin
    Exit;
  end;
  if dm.tbExtrato.IsEmpty then
  begin
    Exit;
  end;
  sFile := 'extrato_fechado';
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
      ExportGridToExcel(SaveDialog.FileName, cxGrid2, False, True, False)
    else if FileExt = '.xml' then
      ExportGridToXML(SaveDialog.FileName, cxGrid2, False)
    else if FileExt = '.txt' then
      ExportGridToText(SaveDialog.FileName, cxGrid2, False)
    else if FileExt = '.html' then
      ExportGridToHTML(SaveDialog.FileName, cxGrid2, False);
    ShellExecute(Handle, 'open', pchar(SaveDialog.FileName), nil, nil, SW_SHOW);
  end;
end;

procedure TfrmExtratoAgente.actExtratoExportarPreviaExecute(Sender: TObject);
var
  FileExt, sFile: String;
begin
  if not(dm.tbPrevia.Active) then
  begin
    Exit;
  end;
  if dm.tbPrevia.IsEmpty then
  begin
    Exit;
  end;
  sFile := 'extrato_previo';
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
      ExportGridToExcel(SaveDialog.FileName, cxGrid1, False, True, False)
    else if FileExt = '.xml' then
      ExportGridToXML(SaveDialog.FileName, cxGrid1, False)
    else if FileExt = '.txt' then
      ExportGridToText(SaveDialog.FileName, cxGrid1, False)
    else if FileExt = '.html' then
      ExportGridToHTML(SaveDialog.FileName, cxGrid1, False);
    ShellExecute(Handle, 'open', pchar(SaveDialog.FileName), nil, nil, SW_SHOW);
  end;
end;

procedure TfrmExtratoAgente.actExtratoExtraviosExecute(Sender: TObject);
begin
  PopularExtravios;
end;

procedure TfrmExtratoAgente.actExtratoFechadoExecute(Sender: TObject);
begin
  if Application.MessageBox('Confirma a visualização do Extrato?', 'Extrato',
    MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  MontaListaAgentes(cxCodAgente.Text);;
  dsExtrato.Enabled := False;
  thrExtrato := thrExtratoFechado.Create(True);
  thrExtrato.FreeOnTerminate := True;
  thrExtrato.Priority := tpNormal;
  thrExtrato.Start;
  acessos.SetNivel(aclExtrato);
end;

procedure TfrmExtratoAgente.ActExtratoLancamentosExecute(Sender: TObject);
begin
  PopularLancamentos;
end;

procedure TfrmExtratoAgente.actExtratoPreviaExecute(Sender: TObject);
begin
  if TUtil.Empty(cxDataInicio.Text) then
  begin
    Application.MessageBox('Informe a data inicial da prévia!', 'Atenção!',
      MB_OK + MB_ICONEXCLAMATION);
    cxDataInicio.SetFocus;
    Exit;
  end;
  if TUtil.Empty(cxDataTermino.Text) then
  begin
    Application.MessageBox('Informe a data final da prévia!', 'Atenção!',
      MB_OK + MB_ICONEXCLAMATION);
    cxDataTermino.SetFocus;
    Exit;
  end;
  if (cxDataTermino.Date < cxDataInicio.Date) then
  begin
    Application.MessageBox
      ('A data Final não pode ser menor que a data Inicial!', 'Atenção!',
      MB_OK + MB_ICONEXCLAMATION);
    cxDataTermino.SetFocus;
    Exit;
  end;
  if ((cxDataTermino.Date - cxDataInicio.Date) > 16) then
  begin
    Application.MessageBox
      ('Período solicitado não deve ser maior que uma quinzena!', 'Atenção!',
      MB_OK + MB_ICONEXCLAMATION);
    cxDataInicio.SetFocus;
    Exit;
  end;
  if Application.MessageBox('Confirma a visualização da Prévia?', 'Prévia',
    MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  MontaCabecalho;
  MontaListaAgentes(cxCodigoAgente.Text);
  dsPrevia.Enabled := False;
  thrPrevia := thrExtratoPrevio.Create(True);
  thrPrevia.FreeOnTerminate := True;
  thrPrevia.Priority := tpNormal;
  thrPrevia.Start;
  acessos.SetNivel(aclExtrato);
end;

procedure TfrmExtratoAgente.actExtratoSairExecute(Sender: TObject);
begin
  frmExtratoAgente.Close;
end;

procedure TfrmExtratoAgente.cxCodAgentePropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if TUtil.Empty(cxCodAgente.Text) then
  begin
    cxCodAgente.Text := '0';
    Exit;
  end;
  if agente.getObject(cxCodAgente.Text, 'CODIGO') then
  begin
    cxNomAgente.Text := agente.Fantasia;
  end
  else
  begin
    cxNomAgente.Text := 'AGENTE NÃO CADASTRADO';
  end;
end;

procedure TfrmExtratoAgente.cxCodigoAgentePropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if TUtil.Empty(cxCodigoAgente.Text) then
  begin
    cxCodigoAgente.Text := '0';
    Exit;
  end;
  if agente.getObject(cxCodigoAgente.Text, 'CODIGO') then
  begin
    cxNomeAgente.Text := agente.Fantasia;
  end
  else
  begin
    cxNomeAgente.Text := 'AGENTE NÃO CADASTRADO';
  end;
end;

procedure TfrmExtratoAgente.cxDetalhesPropertiesChange(Sender: TObject);
begin
  if cxDetalhes.Checked then
  begin
    cxGrid1DBTableView1.ViewData.Expand(True);
  end
  else
  begin
    cxGrid1DBTableView1.ViewData.Collapse(True);
  end;
end;

procedure TfrmExtratoAgente.MontaListaAgentes(sAgente: String);
var
  i: Integer;
begin
  uGlobais.lAgentes.Clear;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  if uGlobais.iNivelUsuario = 0 then
  begin
    if TUtil.Empty(sAgente) then
    begin
      dm.qryPesquisa.SQL.Text :=
        'SELECT COD_AGENTE FROM tbagentes WHERE COD_STATUS = :STATUS';
      dm.qryPesquisa.ParamByName('STATUS').AsInteger := 1;
    end
    else
    begin
      dm.qryPesquisa.SQL.Text :=
        'SELECT COD_AGENTE FROM tbagentes WHERE COD_AGENTE = :AGENTE AND COD_STATUS = :STATUS';
      dm.qryPesquisa.ParamByName('AGENTE').AsString := sAgente;
      dm.qryPesquisa.ParamByName('STATUS').AsInteger := 1;
    end;
  end
  else
  begin
    dm.qryPesquisa.SQL.Text :=
      'SELECT * FROM tbusuariosagentes WHERE COD_USUARIO = :USUARIO';
    dm.qryPesquisa.ParamByName('USUARIO').AsInteger :=
      StrToInt(uGlobais.idUsuario);
  end;
  dm.ZConn.PingServer;
  dm.qryPesquisa.Open;
  dm.qryPesquisa.First;
  while (not dm.qryPesquisa.Eof) do
  begin
    uGlobais.lAgentes.Add(dm.qryPesquisa.FieldByName('COD_AGENTE').AsString);
    dm.qryPesquisa.Next;
  end;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
end;

procedure TfrmExtratoAgente.DatasPagamento;
var
  sListaAgentes: String;
  i: Integer;
begin
  i := 0;
  sListaAgentes := '';
  MontaListaAgentes(cxCodigoAgente.Text);
  for i := 0 to uGlobais.lAgentes.Count - 1 do
  begin
    if True then
      if TUtil.Empty(sListaAgentes) then
      begin
        sListaAgentes := uGlobais.lAgentes[i];
      end
      else
      begin
        sListaAgentes := sListaAgentes + ',' + uGlobais.lAgentes[i];
      end;
  end;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  if uGlobais.iNivelUsuario <= 1 then
  begin
    dm.qryPesquisa.SQL.Text :=
      'SELECT DISTINCT(DAT_PAGO) FROM tbextratos ORDER BY DAT_PAGO DESC LIMIT 6';
  end
  else
  begin
    dm.qryPesquisa.SQL.Text :=
      'SELECT DISTINCT(DAT_PAGO) FROM tbextratos WHERE COD_AGENTE IN (' +
      sListaAgentes + ') ORDER BY DAT_PAGO DESC LIMIT 6';
  end;
  dm.ZConn.PingServer;
  dm.qryPesquisa.Open;
  dm.qryPesquisa.First;
  cxDataPagamento.Clear;
  while (not dm.qryPesquisa.Eof) do
  begin
    cxDataPagamento.Properties.Items.Add(dm.qryPesquisa.FieldByName('DAT_PAGO')
      .AsString);
    dm.qryPesquisa.Next;
  end;
  cxDataPagamento.ItemIndex := 0;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
end;

procedure TfrmExtratoAgente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dm.tbPrevia.Close;
  dm.tbExtrato.Close;
  baixa.Free;
  agente.Free;
  acessos.Free;
  conexao.Free;
  Action := caFree;
  frmExtratoAgente := Nil;
end;

procedure TfrmExtratoAgente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then
  begin
    if cxGrid1.IsFocused then
    begin
      Exit;
    end;
    if cxGrid2.IsFocused then
    begin
      Exit;
    end;
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfrmExtratoAgente.FormShow(Sender: TObject);
begin
  uGlobais.lAgentes := TStringList.Create();
  baixa := TBaixa.Create;
  agente := TAgente.Create;
  conexao := TConexao.Create;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    actExtratoSairExecute(Sender);
    Exit;
  end;
  DatasPagamento;
  cxLabel4.Caption := 'Última Atualização em ' + baixa.UltimaBaixa + ' ';
  cxLabel4.Refresh;
  if uGlobais.iNivelUsuario <= 1 then
  begin
    cxLabel5.Visible := True;
    cxCodigoAgente.Visible := True;
    cxNomeAgente.Visible := True;
    cxLabel6.Visible := True;
    cxCodAgente.Visible := True;
    cxNomAgente.Visible := True;
  end
  else
  begin
    cxLabel5.Visible := False;
    cxCodigoAgente.Visible := False;
    cxNomeAgente.Visible := False;
    cxLabel6.Visible := False;
    cxCodAgente.Visible := False;
    cxNomAgente.Visible := False;
  end;
  acessos.SetNivel(aclExtrato);

end;

procedure TfrmExtratoAgente.MontaCabecalho;
var
  dtData: TDate;
  i: Integer;
  sCampo: String;
begin
  dtData := cxDataInicio.Date;
  i := 2;
  while dtData <= cxDataTermino.Date do
  begin
    sCampo := Copy(DateToStr(dtData), 1, 5);
    cxGrid1DBTableView1.Columns[i].Caption := sCampo;
    Inc(i);
    dtData := IncDay(dtData);
  end;
end;

procedure TfrmExtratoAgente.ListaAgente;
var
  sId: String;
begin
  sId := '';
  Screen.Cursor := crHourGlass;
  sId := Trim(cxCodigoAgente.Text);
  with dm.qryPesquisa do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT COD_AGENTE AS "Código", NOM_FANTASIA AS "Nome" ' +
      'FROM tbagentes ';
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
  frmListaApoio.Caption := 'Administradores de CEP';
  Screen.Cursor := crDefault;
  if frmListaApoio.ShowModal = mrOk then
  begin
    if cxPageControl1.ActivePageIndex = 0 then
    begin
      cxCodigoAgente.Text := dm.qryPesquisa.Fields[0].AsString;
      cxCodigoAgente.Refresh;
      cxNomeAgente.Text := dm.qryPesquisa.Fields[1].AsString;
      cxNomeAgente.Refresh;
    end
    else
    begin
      cxCodAgente.Text := dm.qryPesquisa.Fields[0].AsString;
      cxCodAgente.Refresh;
      cxNomAgente.Text := dm.qryPesquisa.Fields[1].AsString;
      cxNomAgente.Refresh;
    end;
  end;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  FreeAndNil(frmListaApoio);
end;

procedure TfrmExtratoAgente.PopularExtravios;
begin
  if not Assigned(frmDetalhesRestricoes) then
  begin
    frmDetalhesRestricoes := TfrmDetalhesRestricoes.Create(Application);
  end;
  frmDetalhesRestricoes.sCodEntregadores := dm.tbExtratoCOD_AGENTE.AsString;
  frmDetalhesRestricoes.sTipo := 'A';
  frmDetalhesRestricoes.ShowModal;
end;

procedure TfrmExtratoAgente.PopularLancamentos;
begin
  if not Assigned(frmDetalhesLancamentos) then
  begin
    frmDetalhesLancamentos := TfrmDetalhesLancamentos.Create(Application);
  end;
  frmDetalhesLancamentos.sId := dm.tbExtratoNUM_EXTRATO.AsString;
  frmDetalhesLancamentos.sFiltro := 'EXTRATO';
  frmDetalhesLancamentos.ShowModal;
end;

end.
