unit ufrmExtrato;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
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
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxGroupBox,
  cxRadioGroup, cxButtonEdit, Menus, ActnList, StdCtrls, cxButtons,
  DB, dxmdaset, cxClasses, cxCustomData, cxStyles, cxCustomPivotGrid,
  cxPivotGrid, cxDBPivotGrid, cxCurrencyEdit, dxSkinscxPCPainter, cxFilter,
  cxData, cxDataStorage, cxDBData, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, DateUtils,
  cxGridCustomPopupMenu, cxGridPopupMenu, cxCalc, cxGridExportLink, ShellAPI,
  cxProgressBar, cxCheckBox, cxGridBandedTableView, cxGridDBBandedTableView,
  cxTimeEdit, Vcl.ComCtrls, dxCore, cxDateUtils, cxNavigator, cxImage,
  clEntrega, Vcl.ExtCtrls, clAgentes, clEntregador, cxCheckListBox, cxPCdxBarPopupMenu, cxPC,
  dxSkinsdxStatusBarPainter, dxStatusBar, cxListBox,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxBarBuiltInMenu, System.Actions, clConexao, cxSpinEdit, clGruposVerba, clCodigosEntregadores,
  clAbastecimentos, clRestricoes, clExtrato, clPlanilhaCredito, clBancos, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmExtrato = class(TForm)
    aclExtrato: TActionList;
    actExtratoCalcular: TAction;
    actExtratoSair: TAction;
    dsExtrato: TDataSource;
    actFechamentoListaApoio: TAction;
    actFechamentoExportarResumo: TAction;
    SaveDialog: TSaveDialog;
    actFechamentoFechar: TAction;
    actFechamentoExportarEntregas: TAction;
    actFechamentoCancelarFechamento: TAction;
    actFechamentoSelecionar: TAction;
    actFechamentoDesmarcar: TAction;
    cxLabel27: TcxLabel;
    actFechamentoIncluir: TAction;
    actFechamentoExcluir: TAction;
    cxGroupBox1: TcxGroupBox;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxLabel3: TcxLabel;
    cxTipoPeriodo: TcxComboBox;
    cxLabel1: TcxLabel;
    cxDatInicial: TcxDateEdit;
    cxLabel2: TcxLabel;
    cxDatFinal: TcxDateEdit;
    cxDatPagamento: TcxDateEdit;
    cxLabel7: TcxLabel;
    Fi: TcxLabel;
    cxFinalAbastecimento: TcxDateEdit;
    cxButton1: TcxButton;
    cxFiltro: TcxRadioGroup;
    cxLabel5: TcxLabel;
    cxParametros: TcxListBox;
    cxButton5: TcxButton;
    cxButton6: TcxButton;
    cxButton8: TcxButton;
    cxLabel6: TcxLabel;
    cxInicioAbastecimento: TcxDateEdit;
    cxTabSheet2: TcxTabSheet;
    cxLabel4: TcxLabel;
    cxLabel8: TcxLabel;
    cxInicioPagamento: TcxDateEdit;
    cxTerminoPagamento: TcxDateEdit;
    cxFiltroPagamento: TcxRadioGroup;
    cxLabel9: TcxLabel;
    cxParametrosPagamento: TcxListBox;
    cxButton7: TcxButton;
    cxButton10: TcxButton;
    cxButton9: TcxButton;
    cxGroupBox2: TcxGroupBox;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxButton2: TcxButton;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxSLA: TcxCheckBox;
    actFechamentoVisualizar: TAction;
    cxGrid1DBTableView1RecId: TcxGridDBColumn;
    cxGrid1DBTableView1COD_AGENTE: TcxGridDBColumn;
    cxGrid1DBTableView1DES_AGENTE: TcxGridDBColumn;
    cxGrid1DBTableView1COD_ENTREGADOR: TcxGridDBColumn;
    cxGrid1DBTableView1DES_ENTREGADOR: TcxGridDBColumn;
    cxGrid1DBTableView1QTD_VOLUMES: TcxGridDBColumn;
    cxGrid1DBTableView1QTD_ENTREGA: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_VERBA: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_VERBA_TOTAL: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_CREDITO: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_DEBITO: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_RESTRICAO: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_SUB_TOTAL: TcxGridDBColumn;
    cxGrid1DBTableView1QTD_VOLUMES_EXTRA: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_VOLUMES_EXTRA: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_ABASTECIMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_PERCENTUAL_AGENTE: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_PERCENTUAL_ENTREGADOR: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_TOTAL: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_TOTAL_DESCONTOS: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_TOTAL_CREDITOS: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_TOTAL_GERAL: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_INICIO: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_TERMINO: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_INICIO_ABASTECIMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_FINAL_ABASTECIMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_PAGO: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_EXTRATO: TcxGridDBColumn;
    cxGrid1DBTableView1QTD_ATRASOS: TcxGridDBColumn;
    cxGrid1DBTableView1QTD_2_DIAS: TcxGridDBColumn;
    cxGrid1DBTableView1QTD_MAIS_DIAS: TcxGridDBColumn;
    cxGrid1DBTableView1COD_CADASTRO: TcxGridDBColumn;
    cxRestricoes: TcxCheckBox;
    cxButton11: TcxButton;
    actFechamentoEmitir: TAction;
    cxButton12: TcxButton;
    cxCultura: TcxCheckBox;
    procedure actExtratoSairExecute(Sender: TObject);
    procedure actExtratoCalcularExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actFechamentoExportarResumoExecute(Sender: TObject);
    procedure actFechamentoExportarEntregasExecute(Sender: TObject);
    procedure cxGroupBox2Resize(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure actFechamentoFecharExecute(Sender: TObject);
    procedure actFechamentoCancelarFechamentoExecute(Sender: TObject);
    procedure cxRadioGroup1PropertiesChange(Sender: TObject);
    procedure actFechamentoIncluirExecute(Sender: TObject);
    procedure actFechamentoExcluirExecute(Sender: TObject);
    procedure cxPageControl1Click(Sender: TObject);
    procedure actFechamentoVisualizarExecute(Sender: TObject);
    procedure cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
      AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure actFechamentoEmitirExecute(Sender: TObject);
  private
    { Private declarations }
    procedure ExportarEntregas(sArquivo: String);
    procedure ListaAgentes;
    procedure ListaEntregadores;
    procedure MontaListaAgentes;
    function Validar(): Boolean;
    procedure ListaObjetosEntregador;
    procedure ProcessarExtrato;
    procedure FecharExtrato;
    procedure ReabrirExtrato;
    procedure ExtratoFechado;
  public
    { Public declarations }
  end;

var
  frmExtrato: TfrmExtrato;
  agente: TAgente;
  entrega: TEntrega;
  entregador: TEntregador;
  verbas: TGruposVerba;
  codigos: TCodigosEntregadores;
  conexao: TConexao;
  abastecimento: TAbastecimentos;
  restricao: TRestricoes;
  extrato: TExtrato;
  planilha: TPlanilhaCredito;
  bancos: TBancos;
  sAtraso: String;
  sDistribuidores: String;
implementation

{$R *.dfm}

uses udm, ufrmPrincipal, clUtil, Math, uGlobais, ufrmLancamentos, ufrmTipoExportacao, ufrmListaApoio, ufrmListaObjetos,
  ufrmProcesso;

procedure TfrmExtrato.actExtratoSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmExtrato.actExtratoCalcularExecute(Sender: TObject);
begin
  if Application.MessageBox('Confirma a Gerar o Extrato?', 'Gerar Extrato', MB_ICONQUESTION + MB_YESNO) = IDNO then
  begin
    Exit;
  end;
  ProcessarExtrato;
end;

procedure TfrmExtrato.FormShow(Sender: TObject);
begin
  sAtraso := 'N';
  codigos := TCodigosEntregadores.Create;
  agente := TAgente.Create;
  entrega := TEntrega.Create;
  entregador := TEntregador.Create;
  uGlobais.lAgentes := TStringList.Create;
  conexao := TConexao.Create;
  abastecimento := TAbastecimentos.Create;
  restricao := TRestricoes.Create;
  extrato := TExtrato.Create;
  planilha := TPlanilhaCredito.Create;
  bancos := TBancos.Create;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    actExtratoSairExecute(Sender);
    Exit;
  end;
  cxDatInicial.SetFocus;
end;

procedure TfrmExtrato.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dm.qryGeral.Active then
  begin
    dm.qryGeral.Close;
    dm.qryGeral.SQL.Clear;
  end;
  dm.tbExtrato.Close;
  codigos.Free;
  agente.Free;
  entrega.Free;
  entregador.Free;
  conexao.Free;
  abastecimento.Free;
  restricao.Free;
  extrato.Free;
  planilha.Free;
  bancos.Free;
  Action := caFree;
  frmExtrato := Nil;
end;

procedure TfrmExtrato.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then
  begin
    if cxGrid1.IsFocused then
    begin
      Exit;
    end;
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfrmExtrato.actFechamentoExportarResumoExecute(Sender: TObject);
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
  sFile := 'extrato_' + Trim(dm.tbExtratoCOD_AGENTE.AsString) + '_';
  if cxTipoPeriodo.ItemIndex = 2 then
  begin
    sFile := sFile + Copy(dm.tbExtratoDAT_INICIO.AsString, 1, 2) +
      Copy(dm.tbExtratoDAT_INICIO.AsString, 4, 2) +
      Copy(dm.tbExtratoDAT_INICIO.AsString, 7, 4) + '_' +
      Copy(dm.tbExtratoDAT_TERMINO.AsString, 1, 2) +
      Copy(dm.tbExtratoDAT_TERMINO.AsString, 4, 2) +
      Copy(dm.tbExtratoDAT_TERMINO.AsString, 7, 4);
  end
  else
  begin
    sFile := sFile + Copy(cxDatInicial.Text, 1, 2) + Copy(cxDatInicial.Text, 4,
      2) + Copy(cxDatInicial.Text, 7, 4) + '_' + Copy(cxDatFinal.Text, 1, 2) +
      Copy(cxDatFinal.Text, 4, 2) + Copy(cxDatFinal.Text, 7, 4);
  end;
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

procedure TfrmExtrato.actFechamentoFecharExecute(Sender: TObject);
begin
  if dm.tbExtrato.IsEmpty then
  begin
    Exit;
  end;
  if TUtil.Empty(cxDatPagamento.Text) then
  begin
    MessageDlg('Informe a Data do Pagamento!', mtWarning, [mbOK], 0);
    Exit;
  end;
  if MessageDlg('Confirma o Fechamento deste Extrato?', mtConfirmation,
    [mbYes, mbNo], 0) = mrNo then
  begin
    Exit;
  end;
  FecharExtrato;
end;

procedure TfrmExtrato.actFechamentoIncluirExecute(Sender: TObject);
begin
  if cxPageControl1.ActivePageIndex = 0 then
  begin
    if cxFiltro.ItemIndex = 0 then
    begin
      ListaAgentes;
    end
    else if cxFiltro.ItemIndex = 1 then
    begin
      ListaEntregadores;
    end;
  end
  else if cxPageControl1.ActivePageIndex = 1 then
  begin
    if cxFiltroPagamento.ItemIndex = 0 then
    begin
      ListaAgentes;
    end
    else if cxFiltroPagamento.ItemIndex = 1 then
    begin
      ListaEntregadores;
    end;
  end;
end;

procedure TfrmExtrato.actFechamentoVisualizarExecute(Sender: TObject);
begin
  ListaObjetosEntregador;
end;

procedure TfrmExtrato.actFechamentoCancelarFechamentoExecute(Sender: TObject);
begin
  if dm.tbExtrato.IsEmpty then
  begin
    Exit;
  end;
  if MessageDlg('Confirma o Cancelamnto do Fechamento deste Extrato?',
    mtConfirmation, [mbYes, mbNo], 0) = mrNo then
  begin
    Exit;
  end;
  ReabrirExtrato;
end;

procedure TfrmExtrato.actFechamentoEmitirExecute(Sender: TObject);
begin
  MontaListaAgentes;
  dm.tbExtrato.Close;
  dm.tbExtrato.Open;
  ExtratoFechado;
end;

procedure TfrmExtrato.actFechamentoExcluirExecute(Sender: TObject);
begin
  if cxPageControl1.ActivePageIndex = 0 then
  begin
    cxParametros.DeleteSelected
  end
  else if cxPageControl1.ActivePageIndex = 1 then
  begin
    if cxParametrosPagamento.ItemIndex >= 0 then
    begin
      cxParametrosPagamento.Items.Delete(cxParametrosPagamento.ItemIndex);
    end;
  end;
end;

procedure TfrmExtrato.actFechamentoExportarEntregasExecute(Sender: TObject);
var
  sArquivo, sMess: String;
begin
  if dm.tbExtrato.IsEmpty then
    Exit;
  uGlobais.TipoExportacao := -1;
  if not Assigned(frmTipoExportacao) then
    frmTipoExportacao := TfrmTipoExportacao.Create(Application);
  frmTipoExportacao.cxRadioGroup1.Properties.Items[1].Caption := 'Pelo Agente ('
    + dm.tbExtratoDES_AGENTE.AsString + ')';
  frmTipoExportacao.cxRadioGroup1.Properties.Items[2].Caption :=
    'Pelo Entregador (' + dm.tbExtratoDES_ENTREGADOR.AsString + ')';
  if frmTipoExportacao.ShowModal = mrCancel then
    Exit;
  frmTipoExportacao.Free;
  frmTipoExportacao := Nil;
  if uGlobais.TipoExportacao = -1 then
    Exit;
  SaveDialog.Filter := 'Arquivo Valores Separados por Virgulas (*.csv) |*.csv';
  SaveDialog.DefaultExt := 'csv';
  if SaveDialog.Execute then
  begin
    sArquivo := SaveDialog.FileName;
    if FileExists(sArquivo) then
    begin
      sMess := 'Arquivo ' + sArquivo +
        ' já existe! Deseja sobrescrever este arquivo?';
      if Application.MessageBox(pchar(sMess), 'Atenção',
        MB_YESNO + MB_ICONQUESTION) = IDNO then
      begin
        Exit;
      end
      else
      begin
        DeleteFile(sArquivo);
      end;
    end;
    ExportarEntregas(sArquivo);
  end;
end;

function TfrmExtrato.Validar(): Boolean;
begin
  Result := False;
  if cxPageControl1.ActivePageIndex = 0 then
  begin
    if TUtil.Empty(cxDatInicial.Text) then
    begin
      MessageDlg('Informe a data INICIAL do período!', mtWarning, [mbOK], 0);
      cxDatInicial.SetFocus;
      Exit;
    end;
    if TUtil.Empty(cxDatFinal.Text) then
    begin
      MessageDlg('Informe a data FINAL do período!', mtWarning, [mbOK], 0);
      cxDatFinal.SetFocus;
      Exit;
    end;
    if cxDatInicial.Date > cxDatFinal.Date then
    begin
      MessageDlg
        ('A data INICIAL do período não pode ser maior que a data FINAL!',
        mtWarning, [mbOK], 0);
      cxDatInicial.SetFocus;
      Exit;
    end;
  end
  else if cxPageControl1.ActivePageIndex = 1 then
  begin
    if TUtil.Empty(cxInicioPagamento.Text) then
    begin
      MessageDlg('Informe a data INICIAL do pagamento!', mtWarning, [mbOK], 0);
      cxInicioPagamento.SetFocus;
      Exit;
    end;
    if TUtil.Empty(cxTerminoPagamento.Text) then
    begin
      MessageDlg('Informe a data FINAL do pagamento!', mtWarning, [mbOK], 0);
      cxTerminoPagamento.SetFocus;
      Exit;
    end;
    if cxInicioPagamento.Date > cxTerminoPagamento.Date then
    begin
      MessageDlg
        ('A data INICIAL do período não pode ser maior que a data FINAL!',
        mtWarning, [mbOK], 0);
      cxInicioPagamento.SetFocus;
      Exit;
    end;
  end;
  Result := True;
end;

procedure TfrmExtrato.cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  if ACellViewInfo.Item.Caption = 'Entregas' then
  begin
    sAtraso := 'N';
  end
  else if ACellViewInfo.Item.Caption = 'Atrasos' then
  begin
    sAtraso := 'S';
  end
  else
  begin
    Exit;
  end;
  ListaObjetosEntregador;
end;

procedure TfrmExtrato.cxGroupBox2Resize(Sender: TObject);
begin
  cxGrid1.Realign;
end;

procedure TfrmExtrato.cxPageControl1Click(Sender: TObject);
begin
  if cxPageControl1.ActivePageIndex = 0 then
  begin
    cxGrid1DBTableView1.Columns[23].Visible := False;
    cxGrid1DBTableView1.Columns[24].Visible := False;
    cxGrid1DBTableView1.Columns[25].Visible := False;
    cxGrid1DBTableView1.Columns[26].Visible := False;
    cxGrid1DBTableView1.Columns[27].Visible := False;
    cxGrid1DBTableView1.Columns[28].Visible := False;
  end
  else
  begin
    cxGrid1DBTableView1.Columns[23].Visible := True;
    cxGrid1DBTableView1.Columns[24].Visible := True;
    cxGrid1DBTableView1.Columns[25].Visible := True;
    cxGrid1DBTableView1.Columns[26].Visible := True;
    cxGrid1DBTableView1.Columns[27].Visible := True;
    cxGrid1DBTableView1.Columns[28].Visible := True;
  end;

end;

procedure TfrmExtrato.cxRadioGroup1PropertiesChange(Sender: TObject);
begin
  if cxPageControl1.ActivePageIndex = 0 then
  begin
    if cxParametros.Items.Count > 0 then
    begin
      if Application.MessageBox
        ('Alterar a opção do Fitlro irá limpar os parâmetros de Pesquisa. Deseja Continuar?',
        'Atenção', MB_OK + MB_YESNO) = IDNO then
      begin
        Exit;
      end;
      cxParametros.Items.Clear;
    end;
  end
  else if cxPageControl1.ActivePageIndex = 0 then
  begin
    if cxParametrosPagamento.Items.Count > 0 then
    begin
      if Application.MessageBox
        ('Alterar a opção do Fitlro irá limpar os parâmetros de Pesquisa. Deseja Continuar?',
        'Atenção', MB_OK + MB_YESNO) = IDNO then
      begin
        Exit;
      end;
      cxParametrosPagamento.Items.Clear;
    end;
  end;
end;

procedure TfrmExtrato.ExportarEntregas(sArquivo: String);
var
  sAgente, sDataIni, sDataFim, sEntregador, filtro, sLinha, sTipo: String;
  fArquivo: TextFile;
  iConta, iPagina, iAgente, iEntregador, iTotEntregador, iTotAgente,
    iTotGeral: Integer;
begin
  try
    sAgente := '';
    sEntregador := '';
    iAgente := 0;
    iEntregador := 0;
    if cxPageControl1.ActivePageIndex = 0 then
    begin
      if cxTipoPeriodo.ItemIndex = 2 then
      begin
        sDataIni := dm.tbExtratoDAT_INICIO.AsString;
        sDataFim := dm.tbExtratoDAT_TERMINO.AsString;
      end
      else
      begin
        sDataIni := FormatDateTime('dd/mm/yyyy', cxDatInicial.Date);
        sDataFim := FormatDateTime('dd/mm/yyyy', cxDatFinal.Date);
      end;
    end
    else
    begin
      sDataIni := dm.tbExtratoDAT_INICIO.AsString;
      sDataFim := dm.tbExtratoDAT_TERMINO.AsString;
    end;
    iConta := 0;

    Screen.Cursor := crHourGlass;

    if TUtil.Empty(sArquivo) then
      Exit;
    sAgente := dm.tbExtratoCOD_AGENTE.AsString;
    sEntregador := dm.tbExtratoCOD_ENTREGADOR.AsString;
    if cxTipoPeriodo.ItemIndex = 1 then
      filtro := 'ATRIBUICAO'
    else
      filtro := 'BAIXA';
    if uGlobais.TipoExportacao = 0 then
    begin
      sAgente := '';
      sEntregador := '';
    end
    else if uGlobais.TipoExportacao = 1 then
    begin
      sEntregador := '';
    end
    else if uGlobais.TipoExportacao = 2 then
    begin
      sAgente := '';
    end;
    if entrega.Periodo(sDataIni, sDataFim, sAgente, sEntregador, filtro) then
    begin
      if not(dm.qryGeral.Active) then
        Exit;
      if dm.qryGeral.IsEmpty then
        Exit;
      dm.qryGeral.First;
      if cxTipoPeriodo.ItemIndex = 0 then
      begin
        sTipo := 'Digitalização (Baixas)';
      end
      else
      begin
        sTipo := 'Atribuições';
      end;
      AssignFile(fArquivo, sArquivo);
      Rewrite(fArquivo);
      iPagina := 0;
      iAgente := 0;
      iEntregador := 0;
      iTotAgente := 0;
      iTotEntregador := 0;
      iTotGeral := 0;
      sLinha := '';
      while not(dm.qryGeral.Eof) do
      begin
        sLinha := 'Entregas de Encomendas Expressas por ' + sTipo +
          ' de Protocolos (Detalhado)';
        Writeln(fArquivo, sLinha);
        if agente.getObject(dm.qryGeral.FieldByName('COD_AGENTE').AsString,
          'CODIGO') then
        begin
          iAgente := StrToInt(agente.Codigo);
          sAgente := agente.Fantasia;
        end
        else
        begin
          iAgente := StrToInt(agente.Codigo);
          sAgente := '---';
        end;
        if entregador.getObject(dm.qryGeral.FieldByName('COD_ENTREGADOR')
          .AsString, 'CODIGO') then
        begin
          iEntregador := StrToInt(entregador.Codigo);
          sEntregador := entregador.Alias;
        end
        else
        begin
          iEntregador := StrToInt(entregador.Codigo);
          sEntregador := '---';
        end;
        sLinha := 'Período de ' + sDataIni + ' à ' + sDataFim;
        sLinha := sLinha + StringOfChar(';', 7);
        Writeln(fArquivo, sLinha);
        sLinha := 'Agente:;' + IntToStr(iAgente) + '/' + sAgente +
          ';Entregador:;' + IntToStr(iEntregador) + '/' + sEntregador;
        Writeln(fArquivo, sLinha);
        sLinha := 'Nosso Número;Volumes;Data Atribuição;Data Baixa;Nosso Número;Volumes;Data Atribuição;Data Baixa;'
          + 'Nosso Número;Volumes;Data Atribuição;Data Baixa;';
        Writeln(fArquivo, sLinha);
        iConta := 1;
        sLinha := '';
        while (iAgente = dm.qryGeral.FieldByName('COD_AGENTE').AsInteger) and
          (iEntregador = dm.qryGeral.FieldByName('COD_ENTREGADOR').AsInteger)
          and (not(dm.qryGeral.Eof)) do
        begin
          if iConta <= 3 then
          begin
            sLinha := sLinha + dm.qryGeral.FieldByName('NUM_NOSSONUMERO')
              .AsString + ';';
            sLinha := sLinha + dm.qryGeral.FieldByName('QTD_VOLUMES')
              .AsString + ';';
            sLinha := sLinha + dm.qryGeral.FieldByName('DAT_ATRIBUICAO')
              .AsString + ';';
            sLinha := sLinha + dm.qryGeral.FieldByName('DAT_BAIXA')
              .AsString + ';';
            Inc(iConta);
            Inc(iTotAgente);
            Inc(iTotEntregador);
            Inc(iTotGeral);
            dm.qryGeral.Next;
          end
          else
          begin
            if not(TUtil.Empty(sLinha)) then
            begin
              Writeln(fArquivo, sLinha);
              sLinha := '';
              iConta := 1;
            end;
          end;
        end;
        if not(TUtil.Empty(sLinha)) then
        begin
          Writeln(fArquivo, sLinha);
          sLinha := '';
        end;
        if not(dm.qryGeral.Eof) then
        begin
          if iEntregador <> dm.qryGeral.FieldByName('COD_ENTREGADOR').AsInteger
          then
          begin
            if iTotEntregador > 0 then
            begin
              sLinha := ';Total do Entregador;' + IntToStr(iTotEntregador);
              Writeln(fArquivo, sLinha);
              iTotEntregador := 0;
              sLinha := '';
            end;
          end;
          if iAgente <> dm.qryGeral.FieldByName('COD_AGENTE').AsInteger then
          begin
            if iTotAgente > 0 then
            begin
              sLinha := ';Total do Agente;' + IntToStr(iTotAgente);
              Writeln(fArquivo, sLinha);
              iTotAgente := 0;
              sLinha := '';
            end;
          end;
        end
        else
        begin
          if iTotEntregador > 0 then
          begin
            sLinha := ';Total do Entregador;' + IntToStr(iTotEntregador);
            Writeln(fArquivo, sLinha);
            iTotAgente := 0;
            sLinha := '';
          end;
          if iTotAgente > 0 then
          begin
            sLinha := ';Total do Agente;' + IntToStr(iTotAgente);
            Writeln(fArquivo, sLinha);
            iTotAgente := 0;
            sLinha := '';
          end;
          if iTotGeral > 0 then
          begin
            sLinha := ';Total GERAL;' + IntToStr(iTotGeral);
            iTotGeral := 0;
            Writeln(fArquivo, sLinha);
          end;
        end;
      end;
    end;
    dm.qryGeral.Close;
    dm.qryGeral.SQL.Clear;

    Screen.Cursor := crDefault;

    CloseFile(fArquivo);

    MessageDlg('Exportação concluída!', mtInformation, [mbOK], 0);

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

procedure TfrmExtrato.ListaAgentes;
var
  sId: String;
  i: Integer;
  bFlag: Boolean;
  y: Integer;
begin
  sId := '';
  Screen.Cursor := crHourGlass;
  with dm.qryPesquisa do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT COD_AGENTE AS "Código", NOM_FANTASIA AS "Nome" ' +
      'FROM tbagentes WHERE COD_STATUS = 1';
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
  frmListaApoio.Caption := 'Agentes';
  Screen.Cursor := crDefault;
  i := 0;
  if frmListaApoio.ShowModal = mrOk then
  begin
    for y := 0 to frmListaApoio.cxGrid1DBTableView1.Controller.SelectedRecordCount - 1 do
    begin
      sId := frmListaApoio.cxGrid1DBTableView1.Controller.SelectedRows[y].DisplayTexts[0] + '-' +
             frmListaApoio.cxGrid1DBTableView1.Controller.SelectedRows[y].DisplayTexts[1];
      bFlag := True;
      if cxPageControl1.ActivePageIndex = 0 then
      begin
        for i := 0 to cxParametros.Items.Count - 1 do
        begin
          if cxParametros.Items[i] = sId then
          begin
            bFlag := False;
          end;
        end;
        if bFlag then
        begin
          cxParametros.Items.Add(sId);
        end;
      end
      else if cxPageControl1.ActivePageIndex = 1 then
      begin
        for i := 0 to cxParametrosPagamento.Items.Count - 1 do
        begin
          if cxParametrosPagamento.Items[i] = sId then
          begin
            bFlag := False;
          end;
        end;
        if bFlag then
        begin
          cxParametrosPagamento.Items.Add(sId);
        end;
      end;
    end;
  end;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  FreeAndNil(frmListaApoio);
end;

procedure TfrmExtrato.ListaEntregadores;
var
  sId: String;
  i: Integer;
  bFlag: Boolean;
begin
  sId := '';
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
  i := 0;
  if frmListaApoio.ShowModal = mrOk then
  begin
    sId := dm.qryPesquisa.Fields[0].AsString + '-' + dm.qryPesquisa.Fields[1].AsString;
    bFlag := True;
    if cxPageControl1.ActivePageIndex = 0 then
    begin
      for i := 0 to cxParametros.Items.Count - 1 do
      begin
        if cxParametros.Items[i] = sId then
        begin
          bFlag := False;
        end;
      end;
      if bFlag then
      begin
        cxParametros.Items.Add(sId);
      end;
    end
    else if cxPageControl1.ActivePageIndex = 1 then
    begin
      for i := 0 to cxParametrosPagamento.Items.Count - 1 do
      begin
        if cxParametrosPagamento.Items[i] = sId then
        begin
          bFlag := False;
        end;
      end;
      if bFlag then
      begin
        cxParametrosPagamento.Items.Add(sId);
      end;
    end;
  end;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  FreeAndNil(frmListaApoio);
end;

procedure TfrmExtrato.MontaListaAgentes;
var
  i: Integer;
  sCodigos: String;
begin
  uGlobais.lAgentes.Clear;
  // extrato aberto
  sCodigos := '';
  sDistribuidores := '';
  if cxPageControl1.ActivePageIndex = 0 then
  begin
    if cxParametros.Items.Count > 0 then
    begin
      for i := 0 to cxParametros.Items.Count - 1 do
      begin
        if not sCodigos.IsEmpty then
        begin
          sCodigos := sCodigos + ',';
        end;
        sCodigos := sCodigos + Copy(cxParametros.Items[i], 1, Pos('-', cxParametros.Items[i]) - 1);
      end;
      if cxFiltroPagamento.ItemIndex = 0 then
      begin
        if not sCodigos.IsEmpty then
        begin
          sDistribuidores := ' AND tbentregas.COD_AGENTE IN (' + sCodigos + ') ';
        end;
      end
      else
      begin
        if not sCodigos.IsEmpty then
        begin
          sDistribuidores := ' AND tbentregas.COD_ENTREGADOR IN (' + sCodigos + ') ';
        end;
      end;
    end;
  end
  // extrato fechado
  else if cxPageControl1.ActivePageIndex = 1 then
  begin
    if cxParametrosPagamento.Items.Count = 0 then
    begin
      cxFiltroPagamento.ItemIndex := 0;
      if (not agente.getObjects()) then
      begin
        Exit;
      end;
      while (not dm.qryGetObject.Eof) do
      begin
        if dm.qryGetObject.FieldByName('COD_STATUS').AsInteger = 1 then
        begin
          uGlobais.lAgentes.Add(dm.qryGetObject.FieldByName('COD_AGENTE')
            .AsString);
        end;
        dm.qryGetObject.Next;
      end;
      dm.qryGetObject.Close;
      dm.qryGetObject.SQL.Clear;
    end
    else
    begin
      for i := 0 to cxParametrosPagamento.Items.Count - 1 do
      begin
        uGlobais.lAgentes.Add(Copy(cxParametrosPagamento.Items[i], 1,
          Pos('-', cxParametrosPagamento.Items[i]) - 1));
      end;
    end;
  end;
end;

procedure TfrmExtrato.ListaObjetosEntregador;
var
  sTitulo, sDataIni, sDataFim, sCodigo: String;
begin
  if dm.tbExtrato.IsEmpty then
  begin
    Exit;
  end;
  sCodigo := dm.tbExtratoCOD_ENTREGADOR.AsString;
  sTitulo := dm.tbExtratoCOD_ENTREGADOR.AsString + '-' + dm.tbExtratoDES_ENTREGADOR.AsString;
  if cxPageControl1.ActivePageIndex = 0 then
  begin
    sDataIni := cxDatInicial.Text;
    sDataFim := cxDatFinal.Text;
  end
  else
  begin
    sDataIni := dm.tbExtratoDAT_INICIO.AsString;
    sDataFim := dm.tbExtratoDAT_TERMINO.AsString;
  end;
  if not (entrega.PesquisaEntrega('','','','','',sDataIni,sDataFim,'',sCodigo,'','S',sAtraso)) then
  begin
    Application.MessageBox('Nenhum objeto encontrado!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONINFORMATION);
    dm.qryGrid.Close;
    dm.qryGrid.SQL.Clear;
    Exit;
  end;
  if not Assigned(frmListaObjetos) then
  begin
    frmListaObjetos := TfrmListaObjetos.Create(Application);
  end;
  frmListaObjetos.cxLabel1.Caption := sTitulo;
  frmListaObjetos.ShowModal;
end;

procedure TfrmExtrato.ProcessarExtrato;
var
  dPercentual, dVerba, dPosicao: Double;
  iGrupo, iContador, iRecords, i: Integer;
  sFiltro: String;
  bInserir: Boolean;
  sEntregador: String;
  iCultura: Integer;
begin
  sFiltro := '';
  actFechamentoFechar.Enabled := False;
  actFechamentoExportarResumo.Enabled := False;
  dm.tbExtrato.Close;
  dm.tbExtrato.Open;
  verbas := TGruposVerba.Create;
  Screen.Cursor := crHourGlass;
  dPercentual := 0;
  if not Assigned(frmProcesso) then
  begin
    frmProcesso := TfrmProcesso.Create(Application);
  end;
  frmProcesso.Show;
  frmProcesso.cxGroupBox1.Caption := 'Calculando as Entregas e Atrasos. Aguarde...';
  frmProcesso.cxGroupBox1.Refresh;
  MontaListaAgentes;
  iCultura := 0;
  if cxCultura.Checked then
  begin
    iCultura := 1
  end;
  if entrega.ConsolidarExtrato(cxDatInicial.Text, cxDatFinal.Text, cxInicioAbastecimento.Text,
                               cxFinalAbastecimento.Text, cxDatPagamento.Text,sDistribuidores,cxTipoPeriodo.ItemIndex, iCultura) then
  begin
    dm.tbExtrato.IsLoading := True;
    dm.tbExtrato.LoadFromDataSet(dm.qryCalculo);
    dm.tbExtrato.IsLoading := False;
  end;
  frmProcesso.cxProgressBar1.Position := 100;
  frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
  frmProcesso.cxProgressBar1.Refresh;
  if not dm.tbExtrato.IsEmpty then
  begin
    frmProcesso.cxGroupBox1.Caption := 'Dados dos Distribuidores e Entregadores. Aguarde...';
    frmProcesso.cxGroupBox1.Refresh;
    frmProcesso.cxProgressBar1.Position := 0;
    frmProcesso.cxProgressBar1.Refresh;
    iRecords := dm.tbExtrato.RecordCount;
    iContador := 1;
    dPosicao := 0;
    dm.tbExtrato.First;
    while not dm.tbExtrato.Eof do
    begin
      dm.tbExtrato.Edit;
      agente.Codigo := dm.tbExtratoCOD_AGENTE.AsString;
      dm.tbExtratoDES_AGENTE.AsString := agente.getField('NOM_FANTASIA','CODIGO');
      dm.tbExtratoCOD_GRUPO_DISTRIBUIDOR.AsInteger := StrToIntDef(agente.getField('COD_GRUPO','CODIGO'),0);
      dm.tbExtratoVAL_VERBA_DISTRIBUIDOR.AsFloat := StrToIntDef(agente.getField('VAL_VERBA','CODIGO'),0);
      codigos.Codigo := dm.tbExtratoCOD_ENTREGADOR.AsInteger;
      dm.tbExtratoDES_ENTREGADOR.AsString := codigos.getField('NOM_FANTASIA','CODIGO');
      if dm.tbExtratoDES_ENTREGADOR.AsString.IsEmpty then
      begin
        dm.tbExtratoDES_ENTREGADOR.AsString := 'NÃO CADASTRADO';
      end;
      if iCultura = 1 then
      begin
        dm.tbExtratoDES_ENTREGADOR.AsString := dm.tbExtratoDES_ENTREGADOR.AsString + ' - CULTURA';
      end;
      dm.tbExtratoCOD_CADASTRO.AsInteger := StrToIntDef(codigos.getField('COD_CADASTRO','CODIGO'),0);
      dm.tbExtratoCOD_GRUPO_ENTREGADOR.AsInteger := StrToIntDef(codigos.getField('COD_GRUPO','CODIGO'),0);
      dm.tbExtratoVAL_VERBA_ENTREGADOR.AsFloat := StrToFloatDef(codigos.getField('VAL_VERBA','CODIGO'),0);
      dm.tbExtratoVAL_PERCENTUAL.AsFloat := (dm.tbExtratoQTD_ATRASOS.AsInteger / dm.tbExtratoQTD_ENTREGA.AsInteger) * 100;
      dm.tbExtrato.Post;
      dPosicao := (iContador / iRecords) * 100;
      Inc(iContador,1);
      frmProcesso.cxProgressBar1.Position := dPosicao;
      frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
      frmProcesso.cxProgressBar1.Refresh;
      dm.tbExtrato.Next;
    end;
    dm.tbExtrato.First;
    frmProcesso.cxGroupBox1.Caption := 'Calculando as Verbas. Aguarde...';
    frmProcesso.cxGroupBox1.Refresh;
    frmProcesso.cxProgressBar1.Position := 0;
    frmProcesso.cxProgressBar1.Refresh;
    iRecords := dm.tbExtrato.RecordCount;
    iContador := 1;
    dPosicao := 0;
    dm.tbExtrato.First;
    while not dm.tbExtrato.Eof do
    begin
      if dm.tbExtratoCOD_GRUPO_DISTRIBUIDOR.AsInteger > 0 then
      begin
        iGrupo := dm.tbExtratoCOD_GRUPO_DISTRIBUIDOR.AsInteger;
      end;
      if dm.tbExtratoCOD_GRUPO_ENTREGADOR.AsInteger > 0 then
      begin
        iGrupo := dm.tbExtratoCOD_GRUPO_ENTREGADOR.AsInteger;
      end;
      dPercentual := (100 - dm.tbExtratoVAL_PERCENTUAL.AsFloat);
      if not cxSLA.Checked then
      begin
        dPercentual := 99;
      end;
      if verbas.RetornaVerba(IntToStr(iGrupo),dPercentual) then
      begin
        dVerba := verbas.Verba;
        dPercentual := verbas.Percentual;
      end
      else
      begin
        dVerba := 0;
      end;
      if dm.tbExtratoVAL_VERBA_DISTRIBUIDOR.AsFloat > 0 then
      begin
        dVerba := dm.tbExtratoVAL_VERBA_DISTRIBUIDOR.AsFloat;
      end;
      if dm.tbExtratoVAL_VERBA_ENTREGADOR.AsFloat > 0 then
      begin
        dVerba := dm.tbExtratoVAL_VERBA_ENTREGADOR.AsFloat;
      end;
      if iCultura = 1 then
      begin
        dVerba := 3;
      end;
      dm.tbExtrato.Edit;
      dm.tbExtratoCOD_TIPO.AsInteger := iCultura;
      dm.tbExtratoVAL_VERBA.AsFloat := dVerba;
      dm.tbExtratoVAL_PERCENTUAL_ENTREGADOR.AsFloat := dPercentual;
      dm.tbExtrato.Post;
      dPosicao := (iContador / iRecords) * 100;
      Inc(iContador,1);
      frmProcesso.cxProgressBar1.Position := dPosicao;
      frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
      frmProcesso.cxProgressBar1.Refresh;
      dm.tbExtrato.Next;
    end;
    dm.tbExtrato.First;
    verbas.Free;
  end;
  if iCultura = 0 then
  begin
    frmProcesso.cxGroupBox1.Caption := 'Calculando os Lançamentos de Créditos e Débitos. Aguarde...';
    frmProcesso.cxGroupBox1.Refresh;
    dm.tbResumoLancamentos.Close;
    //dm.tbResumoLancamentos.Open;
    if lancamento.ConsolidaLancamentos(cxDatInicial.Text, cxDatFinal.Text) then
    begin
      //dm.tbResumoLancamentos.IsLoading := True;
      //dm.tbResumoLancamentos.LoadFromDataSet(dm.qryPesquisa);
      //dm.tbResumoLancamentos.IsLoading := False;
      //dm.qryPesquisa.Close;
      //dm.qryPesquisa.SQL.Clear;
      dm.qryPesquisa.First;
    end;
    dPercentual := 0;
    frmProcesso.cxProgressBar1.Position := 0;
    frmProcesso.cxProgressBar1.Refresh;
    iRecords := dm.qryPesquisa.RecordCount;
    iContador := 1;
    dPosicao := 0;
    if iRecords > 0 then
    begin
      dm.qryPesquisa.First;
    end;
    while not dm.qryPesquisa.Eof do
    begin
      dm.tbExtrato.First;
      if dm.tbExtrato.Locate('COD_CADASTRO', dm.qryPesquisa.FieldByName('COD_ENTREGADOR').AsInteger,[]) then
      begin
        dm.tbExtrato.IsLoading := True;
        dm.tbExtrato.Edit;
        if dm.qryPesquisa.FieldByName('DES_TIPO').AsString = 'CREDITO' then
        begin
          dm.tbExtratoVAL_CREDITO.Value := dm.qryPesquisa.FieldByName('VAL_LANCAMENTO').AsFloat;
        end
        else
        begin
          dm.tbExtratoVAL_DEBITO.Value := 0 - dm.qryPesquisa.FieldByName('VAL_LANCAMENTO').AsFloat;
        end;
        dm.tbExtrato.Post;
        dm.tbExtrato.IsLoading := False;
      end
      else
      begin
        bInserir := False;
        if cxParametros.Items.Count = 0 then
        begin
          bInserir := True;
        end
        else
        begin
          codigos.Cadastro := dm.qryPesquisa.FieldByName('COD_ENTREGADOR').AsInteger;
          sEntregador := '';
          if cxFiltro.ItemIndex = 0 then
          begin
            sEntregador := codigos.getField('COD_AGENTE','CADASTRO');
          end
          else
          begin
            sEntregador := codigos.getField('COD_ENTREGADOR','CADASTRO');
          end;
          if not sEntregador.IsEmpty then
          begin
            if Pos(sEntregador,sDistribuidores) > 0 then
            begin
              bInserir := True;
            end;
          end;
        end;
        if bInserir then
        begin
          dm.tbExtrato.Insert;
          codigos.Cadastro := dm.qryPesquisa.FieldByName('COD_ENTREGADOR').AsInteger;
          dm.tbExtratoCOD_ENTREGADOR.AsInteger := StrToIntDef(codigos.getField('COD_ENTREGADOR','CADASTRO'),codigos.Cadastro);
          dm.tbExtratoDES_ENTREGADOR.AsString := codigos.getField('NOM_FANTASIA','CADASTRO');
          dm.tbExtratoCOD_TIPO.AsInteger := iCultura;
          dm.tbExtratoCOD_AGENTE.AsInteger := StrToIntDef(codigos.getField('COD_AGENTE','CADASTRO'),1);
          agente.Codigo := dm.tbExtratoCOD_AGENTE.AsString;
          dm.tbExtratoDES_AGENTE.AsString := agente.getField('NOM_FANTASIA','CODIGO');
          dm.tbExtratoQTD_VOLUMES.AsInteger := 0;
          dm.tbExtratoQTD_ENTREGA.AsInteger := 0;
          dm.tbExtratoVAL_VERBA.AsFloat := 0;
          dm.tbExtratoVAL_VERBA_TOTAL.AsFloat := 0;
          if dm.qryPesquisa.FieldByName('DES_TIPO').AsString = 'CREDITO' then
          begin
            dm.tbExtratoVAL_CREDITO.Value := dm.qryPesquisa.FieldByName('VAL_LANCAMENTO').AsFloat;
            dm.tbExtratoVAL_DEBITO.Value := 0;
          end
          else
          begin
            dm.tbExtratoVAL_CREDITO.Value := 0;
            dm.tbExtratoVAL_DEBITO.Value := 0 - dm.qryPesquisa.FieldByName('VAL_LANCAMENTO').AsFloat;
          end;
          dm.tbExtratoVAL_RESTRICAO.AsFloat := 0;
          dm.tbExtratoVAL_SUB_TOTAL.AsFloat := 0;
          dm.tbExtratoQTD_VOLUMES_EXTRA.AsFloat := 0;
          dm.tbExtratoVAL_VOLUMES_EXTRA.AsFloat := 0;
          dm.tbExtratoVAL_ABASTECIMENTO.AsFloat := 0;
          dm.tbExtratoVAL_PERCENTUAL_AGENTE.AsFloat := 0;
          dm.tbExtratoVAL_PERCENTUAL_ENTREGADOR.AsFloat := 0;
          dm.tbExtratoVAL_TOTAL.AsFloat := 0;
          dm.tbExtratoVAL_TOTAL_DESCONTOS.AsFloat := 0;
          dm.tbExtratoVAL_TOTAL_CREDITOS.AsFloat := 0;
          dm.tbExtratoVAL_TOTAL_GERAL.AsFloat := 0;
          dm.tbExtratoDAT_INICIO.AsDateTime := cxDatInicial.Date;
          dm.tbExtratoDAT_TERMINO.AsDateTime := cxDatFinal.Date;
          dm.tbExtratoDAT_INICIO_ABASTECIMENTO.AsDateTime := cxInicioAbastecimento.Date;
          dm.tbExtratoDAT_FINAL_ABASTECIMENTO.AsDateTime := cxFinalAbastecimento.Date;
          dm.tbExtratoDAT_PAGO.AsDateTime := cxDatPagamento.Date;
          dm.tbExtratoNUM_EXTRATO.AsString := '0';
          dm.tbExtratoQTD_ATRASOS.AsInteger := 0;
          dm.tbExtratoQTD_2_DIAS.AsInteger := 0;
          dm.tbExtratoQTD_MAIS_DIAS.AsInteger := 0;
          dm.tbExtratoCOD_CADASTRO.AsInteger := dm.qryPesquisa.FieldByName('COD_ENTREGADOR').AsInteger;
          dm.tbExtratoCOD_GRUPO_DISTRIBUIDOR.AsInteger := 0;
          dm.tbExtratoVAL_VERBA_DISTRIBUIDOR.AsFloat := 0;
          dm.tbExtratoCOD_GRUPO_ENTREGADOR.AsInteger := 0;
          dm.tbExtratoVAL_VERBA_ENTREGADOR.AsFloat := 0;
          dm.tbExtratoVAL_PERCENTUAL.AsFloat := 0;
          dm.tbExtrato.Post;
        end;
      end;
      dPosicao := (iContador / iRecords) * 100;
      Inc(iContador,1);
      frmProcesso.cxProgressBar1.Position := dPosicao;
      frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
      frmProcesso.cxProgressBar1.Refresh;
      dm.qryPesquisa.Next;
    end;
    dm.qryPesquisa.Close;
    dm.qryPesquisa.SQL.Clear;
    if cxFinalAbastecimento.Text <> '' then
    begin
      frmProcesso.cxGroupBox1.Caption := 'Calculando os Débitos de Abastecimentos. Aguarde...';
      frmProcesso.cxGroupBox1.Refresh;
      dm.tbResumoAbastecimento.Close;
      dm.tbResumoAbastecimento.Open;
      if abastecimento.ConsolidaAbastecimentos(cxInicioAbastecimento.Text, cxFinalAbastecimento.Text) then
      begin
        dm.tbResumoAbastecimento.IsLoading := True;
        dm.tbResumoAbastecimento.LoadFromDataSet(dm.qryPesquisa);
        dm.tbResumoAbastecimento.IsLoading := False;
        dm.qryPesquisa.Close;
        dm.qryPesquisa.SQL.Clear;
      end;
      dPercentual := 0;
      frmProcesso.cxProgressBar1.Position := 0;
      frmProcesso.cxProgressBar1.Refresh;
      iRecords := dm.tbResumoAbastecimento.RecordCount;
      iContador := 1;
      dPosicao := 0;
      if iRecords > 0 then
      begin
        dm.tbResumoAbastecimento.First;
      end;
      while not dm.tbResumoAbastecimento.Eof do
      begin
        dm.tbExtrato.First;
        if dm.tbExtrato.Locate('COD_CADASTRO', dm.tbResumoAbastecimentoCOD_ENTREGADOR.AsInteger,[]) then
        begin
          dm.tbExtrato.IsLoading := True;
          dm.tbExtrato.Edit;
          dm.tbExtratoVAL_ABASTECIMENTO.Value := 0 - dm.tbResumoAbastecimentoVAL_TOTAL.AsFloat;
          dm.tbExtrato.Post;
          dm.tbExtrato.IsLoading := False;
        end
        else
        begin
          bInserir := False;
          codigos.Cadastro := dm.tbResumoAbastecimentoCOD_ENTREGADOR.AsInteger;
          sEntregador := '';
          if cxFiltro.ItemIndex = 0 then
          begin
            sEntregador := codigos.getField('COD_AGENTE','CADASTRO');
          end
          else
          begin
            sEntregador := codigos.getField('COD_ENTREGADOR','CADASTRO');
          end;
          if not sEntregador.IsEmpty then
          begin
            if Pos(sEntregador,sDistribuidores) > 0 then
            begin
              bInserir := True;
            end;
          end;
          if bInserir then
          begin
            dm.tbExtrato.Insert;
            codigos.Cadastro := dm.tbResumoAbastecimentoCOD_ENTREGADOR.AsInteger;
            dm.tbExtratoCOD_ENTREGADOR.AsInteger := StrToIntDef(codigos.getField('COD_ENTREGADOR','CADASTRO'),codigos.Cadastro);
            dm.tbExtratoDES_ENTREGADOR.AsString := codigos.getField('NOM_FANTASIA','CADASTRO');
            dm.tbExtratoCOD_TIPO.AsInteger := iCultura;
            dm.tbExtratoCOD_AGENTE.AsInteger := StrToIntDef(codigos.getField('COD_AGENTE','CADASTRO'),1);
            agente.Codigo := dm.tbExtratoCOD_AGENTE.AsString;
            dm.tbExtratoDES_AGENTE.AsString := agente.getField('NOM_FANTASIA','CODIGO');
            dm.tbExtratoQTD_VOLUMES.AsInteger := 0;
            dm.tbExtratoQTD_ENTREGA.AsInteger := 0;
            dm.tbExtratoVAL_VERBA.AsFloat := 0;
            dm.tbExtratoVAL_VERBA_TOTAL.AsFloat := 0;
            dm.tbExtratoVAL_CREDITO.Value := 0;
            dm.tbExtratoVAL_DEBITO.Value := 0;
            dm.tbExtratoVAL_RESTRICAO.AsFloat := 0;
            dm.tbExtratoVAL_SUB_TOTAL.AsFloat := 0;
            dm.tbExtratoQTD_VOLUMES_EXTRA.AsFloat := 0;
            dm.tbExtratoVAL_VOLUMES_EXTRA.AsFloat := 0;
            dm.tbExtratoVAL_ABASTECIMENTO.AsFloat := 0 - dm.tbResumoAbastecimentoVAL_TOTAL.AsFloat;
            dm.tbExtratoVAL_PERCENTUAL_AGENTE.AsFloat := 0;
            dm.tbExtratoVAL_PERCENTUAL_ENTREGADOR.AsFloat := 0;
            dm.tbExtratoVAL_TOTAL.AsFloat := 0;
            dm.tbExtratoVAL_TOTAL_DESCONTOS.AsFloat := 0;
            dm.tbExtratoVAL_TOTAL_CREDITOS.AsFloat := 0;
            dm.tbExtratoVAL_TOTAL_GERAL.AsFloat := 0;
            dm.tbExtratoDAT_INICIO.AsDateTime := cxDatInicial.Date;
            dm.tbExtratoDAT_TERMINO.AsDateTime := cxDatFinal.Date;
            dm.tbExtratoDAT_INICIO_ABASTECIMENTO.AsDateTime := cxInicioAbastecimento.Date;
            dm.tbExtratoDAT_FINAL_ABASTECIMENTO.AsDateTime := cxFinalAbastecimento.Date;
            dm.tbExtratoDAT_PAGO.AsDateTime := cxDatPagamento.Date;
            dm.tbExtratoNUM_EXTRATO.AsString := '0';
            dm.tbExtratoQTD_ATRASOS.AsInteger := 0;
            dm.tbExtratoQTD_2_DIAS.AsInteger := 0;
            dm.tbExtratoQTD_MAIS_DIAS.AsInteger := 0;
            dm.tbExtratoCOD_CADASTRO.AsInteger := dm.tbResumoLancamentosCOD_ENTREGADOR.AsInteger;
            dm.tbExtratoCOD_GRUPO_DISTRIBUIDOR.AsInteger := 0;
            dm.tbExtratoVAL_VERBA_DISTRIBUIDOR.AsFloat := 0;
            dm.tbExtratoCOD_GRUPO_ENTREGADOR.AsInteger := 0;
            dm.tbExtratoVAL_VERBA_ENTREGADOR.AsFloat := 0;
            dm.tbExtratoVAL_PERCENTUAL.AsFloat := 0;
            dm.tbExtrato.Post;
          end;
        end;
        dPosicao := (iContador / iRecords) * 100;
        Inc(iContador,1);
        frmProcesso.cxProgressBar1.Position := dPosicao;
        frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
        frmProcesso.cxProgressBar1.Refresh;
        dm.tbResumoAbastecimento.Next;
      end;
    end;
    if cxRestricoes.Checked then
    begin
      frmProcesso.cxGroupBox1.Caption := 'Atribuindo as Restrições. Aguarde...';
      frmProcesso.cxGroupBox1.Refresh;
      if not restricao.getObjects then
      begin
        Exit;
      end;
      dPercentual := 0;
      frmProcesso.cxProgressBar1.Position := 0;
      frmProcesso.cxProgressBar1.Refresh;
      iRecords := dm.qryGeral.RecordCount;
      iContador := 1;
      dPosicao := 0;
      if iRecords > 0 then
      begin
        dm.qryGeral.First;
      end;
      while not dm.qryGeral.Eof do
      begin
        if dm.qryGeral.FieldByName('VAL_DEBITAR').AsFloat > 0 then
        begin
          dm.tbExtrato.First;
          if dm.tbExtrato.Locate('COD_ENTREGADOR', dm.qryGeral.FieldByName('COD_ENTREGADOR').AsInteger,[]) then
          begin
            dm.tbExtrato.IsLoading := True;
            dm.tbExtrato.Edit;
            DM.tbExtratoVAL_RESTRICAO.AsFloat := 0 - dm.qryGeral.FieldByName('VAL_DEBITAR').AsFloat;
            dm.tbExtrato.Post;
            dm.tbExtrato.IsLoading := False;
          end
          else
          begin
            bInserir := False;
            if cxParametros.Items.Count = 0 then
            begin
              bInserir := True;
            end
            else
            begin
              codigos.Codigo := dm.qryGeral.FieldByName('COD_ENTREGADOR').AsInteger;
              sEntregador := '';
              sEntregador := codigos.getField('COD_ENTREGADOR','CODIGO');
              if not sEntregador.IsEmpty then
              begin
                if Pos(sEntregador,sDistribuidores) > 0 then
                begin
                  bInserir := True;
                end;
              end;
            end;
            if bInserir then
            begin
              dm.tbExtrato.Insert;
              codigos.Codigo := dm.qryGeral.FieldByName('COD_ENTREGADOR').AsInteger;
              codigos.Cadastro := StrToIntDef(codigos.getField('COD_CADASTRO','CODIGO'),codigos.Codigo);
              dm.tbExtratoCOD_ENTREGADOR.AsInteger := dm.qryGeral.FieldByName('COD_ENTREGADOR').AsInteger;
              dm.tbExtratoDES_ENTREGADOR.AsString := codigos.getField('NOM_FANTASIA','CODIGO');
              dm.tbExtratoCOD_TIPO.AsInteger := iCultura;
              dm.tbExtratoCOD_AGENTE.AsInteger := StrToIntDef(codigos.getField('COD_AGENTE','CODIGO'),1);
              agente.Codigo := dm.tbExtratoCOD_AGENTE.AsString;
              dm.tbExtratoDES_AGENTE.AsString := agente.getField('NOM_FANTASIA','CODIGO');
              dm.tbExtratoQTD_VOLUMES.AsInteger := 0;
              dm.tbExtratoQTD_ENTREGA.AsInteger := 0;
              dm.tbExtratoVAL_VERBA.AsFloat := 0;
              dm.tbExtratoVAL_VERBA_TOTAL.AsFloat := 0;
              dm.tbExtratoVAL_CREDITO.Value := 0;
              dm.tbExtratoVAL_DEBITO.Value := 0;
              dm.tbExtratoVAL_RESTRICAO.AsFloat := 0 - dm.qryGeral.FieldByName('VAL_DEBITAR').AsFloat;
              dm.tbExtratoVAL_SUB_TOTAL.AsFloat := 0;
              dm.tbExtratoQTD_VOLUMES_EXTRA.AsFloat := 0;
              dm.tbExtratoVAL_VOLUMES_EXTRA.AsFloat := 0;
              dm.tbExtratoVAL_ABASTECIMENTO.AsFloat := 0;
              dm.tbExtratoVAL_PERCENTUAL_AGENTE.AsFloat := 0;
              dm.tbExtratoVAL_PERCENTUAL_ENTREGADOR.AsFloat := 0;
              dm.tbExtratoVAL_TOTAL.AsFloat := 0;
              dm.tbExtratoVAL_TOTAL_DESCONTOS.AsFloat := 0;
              dm.tbExtratoVAL_TOTAL_CREDITOS.AsFloat := 0;
              dm.tbExtratoVAL_TOTAL_GERAL.AsFloat := 0;
              dm.tbExtratoDAT_INICIO.AsDateTime := cxDatInicial.Date;
              dm.tbExtratoDAT_TERMINO.AsDateTime := cxDatFinal.Date;
              dm.tbExtratoDAT_INICIO_ABASTECIMENTO.AsDateTime := cxInicioAbastecimento.Date;
              dm.tbExtratoDAT_FINAL_ABASTECIMENTO.AsDateTime := cxFinalAbastecimento.Date;
              dm.tbExtratoDAT_PAGO.AsDateTime := cxDatPagamento.Date;
              dm.tbExtratoNUM_EXTRATO.AsString := '0';
              dm.tbExtratoQTD_ATRASOS.AsInteger := 0;
              dm.tbExtratoQTD_2_DIAS.AsInteger := 0;
              dm.tbExtratoQTD_MAIS_DIAS.AsInteger := 0;
              dm.tbExtratoCOD_CADASTRO.AsInteger := dm.qryGeral.FieldByName('COD_ENTREGADOR').AsInteger;
              dm.tbExtratoCOD_GRUPO_DISTRIBUIDOR.AsInteger := 0;
              dm.tbExtratoVAL_VERBA_DISTRIBUIDOR.AsFloat := 0;
              dm.tbExtratoCOD_GRUPO_ENTREGADOR.AsInteger := 0;
              dm.tbExtratoVAL_VERBA_ENTREGADOR.AsFloat := 0;
              dm.tbExtratoVAL_PERCENTUAL.AsFloat := 0;
              dm.tbExtrato.Post;
            end;
          end;
        end;
        dPosicao := (iContador / iRecords) * 100;
        Inc(iContador,1);
        frmProcesso.cxProgressBar1.Position := dPosicao;
        frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
        frmProcesso.cxProgressBar1.Refresh;
        dm.qryGeral.Next;
      end;
    end;
  end;
  frmProcesso.cxGroupBox1.Caption := 'Totalizando o Extrato. Aguarde...';
  frmProcesso.cxGroupBox1.Refresh;
  frmProcesso.cxProgressBar1.Position := 0;
  frmProcesso.cxProgressBar1.Refresh;
  iRecords := dm.tbExtrato.RecordCount;
  iContador := 1;
  dPosicao := 0;
  dm.tbExtrato.First;
  while not dm.tbExtrato.Eof do
  begin
    dm.tbExtrato.Edit;
    dm.tbExtratoVAL_TOTAL_GERAL.AsFloat := dm.tbExtratoVAL_CREDITO.AsFloat + dm.tbExtratoVAL_DEBITO.AsFloat +
                                           dm.tbExtratoVAL_RESTRICAO.AsFloat + dm.tbExtratoVAL_ABASTECIMENTO.AsFloat +
                                           (dm.tbExtratoQTD_ENTREGA.AsInteger + dm.tbExtratoQTD_VOLUMES_EXTRA.AsFloat) *
                                           dm.tbExtratoVAL_VERBA.AsFloat;
    dm.tbExtrato.Post;
    dPosicao := (iContador / iRecords) * 100;
    Inc(iContador,1);
    frmProcesso.cxProgressBar1.Position := dPosicao;
    frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
    frmProcesso.cxProgressBar1.Refresh;
    dm.tbExtrato.Next;
  end;
  if not dm.tbExtrato.IsEmpty then
  begin
    dm.tbExtrato.First;
    actFechamentoFechar.Enabled := True;
    actFechamentoExportarResumo.Enabled := True;
  end;
  frmProcesso.Close;
  FreeAndNil(frmProcesso);
  cxGrid1DBTableView1.ViewData.Expand(True);
  Screen.Cursor := crDefault;
end;

procedure TfrmExtrato.FecharExtrato;
var
  dPercentual: Double;
  LinhasTotal: Integer;
  Contador: Integer;
  iCodigo: Integer;
  sInicio: string;
  dValor: Double;
  sChave: string;
  sNome: string;
  sCadastro: string;
begin
  dPercentual := 0;
  if not Assigned(frmProcesso) then
  begin
    frmProcesso := TfrmProcesso.Create(Application);
  end;
  Screen.Cursor := crHourGlass;
  frmProcesso.Show;
  frmProcesso.cxGroupBox1.Caption := 'Fechando o Extrato. Aguarde...';
  frmProcesso.cxGroupBox1.Refresh;
  LinhasTotal := dm.tbExtrato.RecordCount;
  Contador := 1;
  dm.tbExtrato.First;
  iCodigo := dm.tbExtratoCOD_ENTREGADOR.AsInteger;
  while not(dm.tbExtrato.Eof) do
  begin
    extrato.Tipo := dm.tbExtratoCOD_TIPO.AsInteger;
    extrato.CodigoAgente := dm.tbExtratoCOD_AGENTE.AsInteger;
    extrato.NomeAgente := dm.tbExtratoDES_AGENTE.AsString;
    extrato.CodigoEntregador := dm.tbExtratoCOD_ENTREGADOR.AsInteger;
    extrato.NomeEntregador := dm.tbExtratoDES_ENTREGADOR.AsString;
    extrato.DataBase := frmExtrato.cxDatFinal.Date;
    extrato.DataPagamento := frmExtrato.cxDatPagamento.Date;
    extrato.GeraNumero;
    extrato.DataInicio := frmExtrato.cxDatInicial.Date;
    extrato.DataTermino := frmExtrato.cxDatFinal.Date;
    extrato.Volumes := dm.tbExtratoQTD_VOLUMES.AsInteger;
    extrato.entrega := dm.tbExtratoQTD_ENTREGA.AsInteger;
    extrato.Verba := dm.tbExtratoVAL_VERBA.AsFloat;
    extrato.VerbaTotal := dm.tbExtratoVAL_VERBA_TOTAL.AsCurrency;
    extrato.Credito := dm.tbExtratoVAL_CREDITO.AsCurrency;
    extrato.Debito := dm.tbExtratoVAL_DEBITO.AsCurrency;
    extrato.restricao := dm.tbExtratoVAL_RESTRICAO.AsCurrency;
    extrato.SubTotal := dm.tbExtratoVAL_SUB_TOTAL.AsCurrency;
    extrato.VolumesExtra := dm.tbExtratoQTD_VOLUMES_EXTRA.AsFloat;
    extrato.ValorVolumesExtra := dm.tbExtratoVAL_PERCENTUAL_ENTREGADOR.AsFloat;
    extrato.Total := dm.tbExtratoVAL_TOTAL.AsCurrency;
    extrato.DataPagamento := frmExtrato.cxDatPagamento.Date;
    extrato.MarcaPago := 'S';
    extrato.ValorAbastecimento := dm.tbExtratoVAL_ABASTECIMENTO.AsCurrency;
    if not(TUtil.Empty(frmExtrato.cxFinalAbastecimento.Text)) then
    begin
      if DayOf(frmExtrato.cxFinalAbastecimento.Date) = 15 then
      begin
        sInicio := '01' + Copy(frmExtrato.cxFinalAbastecimento.Text, 3, 8);
      end
      else
      begin
        sInicio := '16' + Copy(frmExtrato.cxFinalAbastecimento.Text, 3, 8);
      end;
      extrato.IncioAbastecimento := StrToDate(sInicio);
      extrato.FinalAbastecimento := frmExtrato.cxFinalAbastecimento.Date;
    end
    else
    begin
      extrato.IncioAbastecimento := 0;
      extrato.FinalAbastecimento := 0;
    end;
    extrato.TotalDescontos := dm.tbExtratoVAL_TOTAL_DESCONTOS.AsCurrency;
    extrato.TotalCreditos := dm.tbExtratoVAL_TOTAL_CREDITOS.AsCurrency;
    extrato.TotalGeral := dm.tbExtratoVAL_TOTAL_GERAL.AsCurrency;
    extrato.MarcaFechado := 'S';
    extrato.DataFechado := Now;
    extrato.Executante := uGlobais.sUsuario;
    extrato.Manutencao := Now;
    extrato.Dia1 := dm.tbExtratoQTD_ATRASOS.AsInteger;
    extrato.Dia2 := dm.tbExtratoQTD_2_DIAS.AsInteger;
    extrato.Dia3 := dm.tbExtratoQTD_MAIS_DIAS.AsInteger;

    if entregador.getObject(IntToStr(extrato.CodigoEntregador), 'CODIGO') then
    begin
      iCodigo := entregador.Cadastro;
    end;
    // Fechar entregas
    if not(entrega.Fechar(frmExtrato.cxDatInicial.Text, frmExtrato.cxDatFinal.Text, frmExtrato.cxDatPagamento.Text,
           extrato.NumeroExtrato, dm.tbExtratoCOD_AGENTE.AsString, dm.tbExtratoCOD_ENTREGADOR.AsString,
           'BAIXA', 'FECHAR', extrato.Verba, extrato.Tipo, 0)) then
    begin
      MessageDlg('Erro Fechamento: ENTREGAS; Agente: ' + dm.tbExtratoCOD_AGENTE.AsString + ' / Entregador: ' +
                 dm.tbExtratoCOD_ENTREGADOR.AsString, mtWarning, [mbOK], 0);
      Exit;
    end;

    // Processar abastecimentos
    if not(TUtil.Empty(frmExtrato.cxInicioAbastecimento.Text)) then
    begin
      sInicio := frmExtrato.cxInicioAbastecimento.Text;
      if not(abastecimento.Fechar(sInicio,frmExtrato.cxFinalAbastecimento.Text, IntToStr(ICodigo), extrato.NumeroExtrato,
             'FECHAR')) then
      begin
        MessageDlg('Erro Fechamento: ABASTECIMENTO; Entregador: ' + dm.tbExtratoCOD_ENTREGADOR.AsString, mtWarning, [mbOK], 0);
        Exit;
      end;
    end;

    // Processar restrições
    if extrato.restricao <> 0 then
    begin
      if restricao.getObject(IntToStr(extrato.CodigoEntregador), 'ENTREGADOR')
      then
      begin
        restricao.Valor := restricao.Valor + extrato.restricao;
        restricao.Pago := restricao.Pago + ABS(extrato.restricao);
        restricao.Debitar := 0;
        if not(restricao.Update) then
        begin
          MessageDlg('Erro Fechamento: RESTRIÇÃO; Agente: ' + dm.tbExtratoCOD_AGENTE.AsString + ' / Entregador: ' +
                     dm.tbExtratoCOD_ENTREGADOR.AsString, mtWarning, [mbOK], 0);
          Exit;;
        end;
      end
      else
      begin
        if restricao.getObject(IntToStr(extrato.CodigoAgente), 'AGENTE') then
        begin
          restricao.Valor := restricao.Valor + extrato.restricao;
          restricao.Pago := restricao.Pago + ABS(extrato.restricao);
          restricao.Debitar := 0;
          if not(restricao.Update) then
          begin
            MessageDlg('Erro Fechamento: RESTRIÇÃO; Agente: ' + dm.tbExtratoCOD_AGENTE.AsString + ' / Entregador: ' +
                       dm.tbExtratoCOD_ENTREGADOR.AsString, mtWarning, [mbOK], 0);
            Exit;
          end;
        end;
      end;
    end;

    // Fechar lançamentos de débitos e créditos
    if not(lancamento.Fechar(frmExtrato.cxDatInicial.Text, frmExtrato.cxDatFinal.Text, frmExtrato.cxDatPagamento.Text,
           extrato.NumeroExtrato, IntToStr(ICodigo), 'FECHAR')) then
    begin
      MessageDlg('Erro Fechamento: LANÇAMENTO; Agente: ' + dm.tbExtratoCOD_AGENTE.AsString + ' / Entregador: ' +
                 dm.tbExtratoCOD_ENTREGADOR.AsString, mtWarning, [mbOK], 0);
      Exit;
    end;
    if not(lancamento.Persistecia) then
    begin
      MessageDlg('Erro Fechamento: Persistência LANÇAMENTO; Agente: ' + dm.tbExtratoCOD_AGENTE.AsString + ' / Entregador: ' +
                 dm.tbExtratoCOD_ENTREGADOR.AsString, mtWarning, [mbOK], 0);
      Exit;
    end;

    // Gera Planilha de Crédito
    dValor := 0;
    sChave := '';
    sNome := '';
    sCadastro := '';
    if agente.getObject(IntToStr(extrato.CodigoAgente), 'CODIGO') then
    begin
      if agente.Forma = 'NENHUMA' then
      begin
        sCadastro := dm.tbExtratoCOD_CADASTRO.AsString;
        if TUtil.Empty(sCadastro) then
        begin
          sCadastro := '-1';
        end;
        if entregador.getObject(sCadastro, 'CADASTRO') then
        begin
          if entregador.Forma <> 'NENHUMA' then
          begin
            planilha.DataPagamento := extrato.DataPagamento;
            sNome := '';
            planilha.agente := StrToInt(sCadastro);
            planilha.NomeAgente := entregador.Nome;
            planilha.entregador := 0;
            planilha.NomeEntregador := '';
            planilha.Servico := 'EXPRESSAS';
            planilha.TipoConta := entregador.TipoConta;
            planilha.banco := entregador.banco;
            bancos.Codigo := planilha.banco;
            sNome := bancos.getField('NOM_BANCO', 'CODIGO');
            if TUtil.Empty(sNome) then
            begin
              sNome := 'BANCO NÃO CADASTRADO'
            end;
            planilha.NomeBanco := sNome;
            planilha.Agencia := entregador.Agencia;
            planilha.Conta := entregador.NumeroConta;
            planilha.Favorecido := entregador.Favorecido;
            planilha.CpfCnpjFavorecido := entregador.CpfCnpjFavorecido;
            planilha.TipoPagamento := entregador.Forma;
            planilha.extrato := extrato.NumeroExtrato;
            dValor := extrato.TotalGeral;
            planilha.Executor := uGlobais.sUsuario;
            planilha.Manutencao := Now;
            sChave := '';
            if planilha.getObject(sChave, 'CHAVE') then
            begin
              planilha.Valor := planilha.Valor + dValor;
              if not(planilha.Update()) then
              begin
                MessageDlg
                  ('Erro ao alterar os dados na planilha de crédito. Chave: E'
                  + sChave, mtWarning, [mbOK], 0);
                Exit;
              end;
            end
            else
            begin
              planilha.Valor := dValor;
              if not(planilha.Insert()) then
              begin
                MessageDlg
                  ('Erro ao incluir os dados na planilha de crédito. Chave: E'
                  + sChave, mtWarning, [mbOK], 0);
                Exit;
              end;
            end
          end;
        end;
      end
      else
      begin
        planilha.DataPagamento := extrato.DataPagamento;
        planilha.agente := extrato.CodigoAgente;
        planilha.NomeAgente := agente.Razao;
        planilha.Servico := 'EXPRESSAS';
        planilha.entregador := 0;
        planilha.NomeEntregador := '';
        planilha.TipoConta := agente.TipoConta;
        planilha.banco := agente.banco;
        bancos.Codigo := planilha.banco;
        sNome := bancos.getField('NOM_BANCO', 'CODIGO');
        if TUtil.Empty(sNome) then
        begin
          sNome := 'BANCO NÃO CADASTRADO'
        end;
        planilha.NomeBanco := sNome;
        planilha.Agencia := agente.Agencia;
        planilha.Conta := agente.NumeroConta;
        planilha.Favorecido := agente.Favorecido;
        planilha.CpfCnpjFavorecido := agente.CpfCnpjFavorecido;
        planilha.TipoPagamento := agente.Forma;
        planilha.extrato := extrato.NumeroExtrato;
        dValor := extrato.TotalGeral;
        planilha.Executor := uGlobais.sUsuario;
        planilha.Manutencao := Now;
        sChave := '';
        if planilha.getObject(sChave, 'CHAVE') then
        begin
          planilha.Valor := planilha.Valor + dValor;
          if not(planilha.Update()) then
          begin
            MessageDlg('Erro ao alterar os dados na planilha de crédito. Chave: A' + sChave, mtWarning, [mbOK], 0);
            Exit;
          end;
        end
        else
        begin
          planilha.Valor := dValor;
          if not(planilha.Insert()) then
          begin
            MessageDlg('Erro ao incluir os dados na planilha de crédito. Chave: A' + sChave, mtWarning, [mbOK], 0);
            Exit;
          end;
        end
      end;
    end;

    // Salvar extrato
    if not(extrato.Insert) then
    begin
      MessageDlg('Erro Fechamento: EXTRATO; Agente: ' + dm.tbExtratoCOD_AGENTE.AsString + ' / Entregador: ' +
                 dm.tbExtratoCOD_ENTREGADOR.AsString, mtWarning, [mbOK], 0);
      Exit;
    end;
    dPosicao := (Contador / LinhasTotal) * 100;
    Inc(Contador);
    frmProcesso.cxProgressBar1.Position := dPosicao;
    frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
    frmProcesso.cxProgressBar1.Refresh;
    dm.tbExtrato.Next;
  end;
  frmProcesso.Close;
  FreeAndNil(frmProcesso);
  cxGrid1DBTableView1.ViewData.Expand(True);
  Screen.Cursor := crDefault;
  actFechamentoExportarResumo.Enabled := True;
  actFechamentoExportarEntregas.Enabled := True;
  actExtratoCalcular.Enabled := True;
  actFechamentoFechar.Enabled := False;
  actFechamentoCancelarFechamento.Enabled := False;
  cxGrid1DBTableView1.ViewData.Expand(True);
  dm.tbExtrato.Close;
  Application.MessageBox('Fechamento concluído.', 'Fechando Extrato', MB_OK + MB_ICONINFORMATION);
end;

procedure TfrmExtrato.ReabrirExtrato;
var
  dPercentual: Double;
  LinhasTotal: Integer;
  Contador: Integer;
  iCodigo: Integer;
begin
  dPercentual := 0;
  if not Assigned(frmProcesso) then
  begin
    frmProcesso := TfrmProcesso.Create(Application);
  end;
  Screen.Cursor := crHourGlass;
  frmProcesso.Show;
  frmProcesso.cxGroupBox1.Caption := 'Reabrindo o Extrato. Aguarde...';
  frmProcesso.cxGroupBox1.Refresh;
  Contador := 1;
  LinhasTotal := dm.tbExtrato.RecordCount;
  dm.tbExtrato.First;
  while not(dm.tbExtrato.Eof) do
  begin
    iCodigo := dm.tbExtratoCOD_ENTREGADOR.AsInteger;
    // Cancela fechamento das entregas
    if not(entrega.Fechar(dm.tbExtratoDAT_INICIO.AsString,
      dm.tbExtratoDAT_TERMINO.AsString, dm.tbExtratoDAT_PAGO.AsString,
      dm.tbExtratoNUM_EXTRATO.AsString, dm.tbExtratoCOD_AGENTE.AsString,
      dm.tbExtratoCOD_ENTREGADOR.AsString, 'BAIXA', 'CANCELAR', 0, dm.tbExtratoCOD_TIPO.AsInteger, 0)) then
    begin
      MessageDlg('Erro Cancelamento de Fechamento: ENTREGAS; Agente: ' +
        dm.tbExtratoCOD_AGENTE.AsString + ' / Entregador: ' +
        dm.tbExtratoCOD_ENTREGADOR.AsString, mtWarning, [mbOK], 0);
      Exit;
    end;
    // Cancela fechameto dos abastecimentos
    if not(TUtil.Empty(dm.tbExtratoDAT_INICIO_ABASTECIMENTO.AsString)) then
    begin
      if not(abastecimento.Fechar(dm.tbExtratoDAT_INICIO_ABASTECIMENTO.
        AsString, dm.tbExtratoDAT_FINAL_ABASTECIMENTO.AsString,
        dm.tbExtratoCOD_ENTREGADOR.AsString, dm.tbExtratoNUM_EXTRATO.AsString, 'CANCELAR')) then
      begin
        MessageDlg('Erro Cancelamento Fechamento: ENTREGAS; Agente: ' +
          dm.tbExtratoCOD_AGENTE.AsString + ' / Entregador: ' +
          dm.tbExtratoCOD_ENTREGADOR.AsString, mtWarning, [mbOK], 0);
        Exit;
      end;
    end;
    // Retorna valores das restrições
    if dm.tbExtratoVAL_RESTRICAO.Value < 0 then
    begin
      if restricao.getObject(dm.tbExtratoCOD_ENTREGADOR.AsString, 'ENTREGADOR')
      then
      begin
        restricao.Valor := restricao.Valor + ABS(dm.tbExtratoVAL_RESTRICAO.Value);
        restricao.Pago := restricao.Pago + dm.tbExtratoVAL_RESTRICAO.Value;
        restricao.Debitar := ABS(dm.tbExtratoVAL_RESTRICAO.Value);
        if not(restricao.Update) then
        begin
          MessageDlg('Erro Cancelamento do Fechamento: RESTRIÇÃO; Agente: ' +
            dm.tbExtratoCOD_AGENTE.AsString + ' / Entregador: ' +
            dm.tbExtratoCOD_ENTREGADOR.AsString, mtWarning, [mbOK], 0);
          Exit;
        end;
      end
      else
      begin
        if restricao.getObject(dm.tbExtratoCOD_AGENTE.AsString, 'AGENTE') then
        begin
          restricao.Valor := restricao.Valor + ABS(dm.tbExtratoVAL_RESTRICAO.Value);
          restricao.Pago := restricao.Pago + dm.tbExtratoVAL_RESTRICAO.Value;
          restricao.Debitar := ABS(dm.tbExtratoVAL_RESTRICAO.Value);
          if not(restricao.Update) then
          begin
            MessageDlg('Erro Cancelamento Fechamento: RESTRIÇÃO; Agente: ' +
              dm.tbExtratoCOD_AGENTE.AsString + ' / Entregador: ' +
              dm.tbExtratoCOD_ENTREGADOR.AsString, mtWarning, [mbOK], 0);
            Exit;
          end;
        end;
      end;
    end;
    // Cancela fechamento de lançamentos de débitos e créditos
    if entregador.getObject(dm.tbExtratoCOD_ENTREGADOR.AsString, 'CODIGO')
    then
    begin
      iCodigo := entregador.Cadastro;
    end;

    if not(lancamento.Fechar(dm.tbExtratoDAT_INICIO.AsString,
      dm.tbExtratoDAT_TERMINO.AsString, dm.tbExtratoDAT_PAGO.AsString,
      dm.tbExtratoNUM_EXTRATO.AsString, IntToStr(iCodigo), 'CANCELAR')) then
    begin
      MessageDlg('Erro Cancelamento Fechamento: LANÇAMENTO; Agente: ' +
        dm.tbExtratoCOD_AGENTE.AsString + ' / Entregador: ' +
        dm.tbExtratoCOD_ENTREGADOR.AsString, mtWarning, [mbOK], 0);
      Exit;
    end;

    // Excluir planilha de crédito
    planilha.extrato := dm.tbExtratoNUM_EXTRATO.AsString;
    if not(planilha.Delete('EXTRATO')) then
    begin
      MessageDlg('Erro Cancelamento Fechamento: PLANILHA: Agente: ' +
        dm.tbExtratoCOD_AGENTE.AsString + ' / Entregador: ' +
        dm.tbExtratoCOD_ENTREGADOR.AsString, mtWarning, [mbOK], 0);
      Exit;
    end;

    // Excluir registro do extrato
    extrato.CodigoAgente := dm.tbExtratoCOD_AGENTE.Value;
    extrato.CodigoEntregador := dm.tbExtratoCOD_ENTREGADOR.Value;
    extrato.DataBase := dm.tbExtratoDAT_TERMINO.Value;

    if not(extrato.Delete('BASE1')) then
    begin
      MessageDlg('Erro Fechamento: EXTRATO; Agente: ' +
        dm.tbExtratoCOD_AGENTE.AsString + ' / Entregador: ' +
        dm.tbExtratoCOD_ENTREGADOR.AsString, mtWarning, [mbOK], 0);
      Exit;
    end;
    dPosicao := (Contador / LinhasTotal) * 100;
    Inc(Contador);
    frmProcesso.cxProgressBar1.Position := dPosicao;
    frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
    frmProcesso.cxProgressBar1.Refresh;
    dm.tbExtrato.Next;
  end;
  frmProcesso.Close;
  FreeAndNil(frmProcesso);
  cxGrid1DBTableView1.ViewData.Expand(True);
  Screen.Cursor := crDefault;
  actFechamentoExportarResumo.Enabled := False;
  actFechamentoExportarEntregas.Enabled := False;
  actExtratoCalcular.Enabled := True;
  actFechamentoFechar.Enabled := False;
  actFechamentoCancelarFechamento.Enabled := False;
  dm.tbExtrato.Close;
  Application.MessageBox('Cancelamento concluído.', 'Cancelando Fechamento do Extrato', MB_OK + MB_ICONINFORMATION);
end;

procedure TfrmExtrato.ExtratoFechado;
var
  dPercentual: Double;
  sTipo: string;
  sData: string;
  sData1: string;
  sScopo: string;
  Contador: Integer;
  LinhasTotal: Integer;
  sAgente: string;
  i: Integer;
begin
  dPercentual := 0;
  if not Assigned(frmProcesso) then
  begin
    frmProcesso := TfrmProcesso.Create(Application);
  end;
  Screen.Cursor := crHourGlass;
  frmProcesso.Show;
  frmProcesso.cxGroupBox1.Caption := 'Emitindo o Extrato. Aguarde...';
  frmProcesso.cxGroupBox1.Refresh;
  if uGlobais.lAgentes.Count = 0 then
  begin
    Exit;
  end;
  sTipo := 'PAGAMENTO';
  sData := frmExtrato.cxInicioPagamento.Text;
  sData1 := frmExtrato.cxTerminoPagamento.Text;
  if frmExtrato.cxFiltroPagamento.ItemIndex = 0 then
  begin
    sScopo := 'A';
  end
  else
  begin
    sScopo := 'E';
  end;
  Contador := 1;
  LinhasTotal := uGlobais.lAgentes.Count;
  if dm.tbExtrato.Active then
    dm.tbExtrato.Close;
  dm.tbExtrato.Open;
  for i := 0 to uGlobais.lAgentes.Count - 1 do
  begin
    sAgente := uGlobais.lAgentes[i];
    if extrato.Periodo(sData, sData1, sAgente, sTipo, sScopo) then
    begin
      while not(dm.qryGeral.Eof) do
      begin
        dm.tbExtrato.Insert;
        dm.tbExtratoCOD_TIPO.Value := dm.qryGeral.FieldByName('COD_TIPO').AsInteger;
        dm.tbExtratoCOD_AGENTE.Value := dm.qryGeral.FieldByName('COD_AGENTE').AsInteger;
        dm.tbExtratoDES_AGENTE.Value :=
          dm.qryGeral.FieldByName('DES_AGENTE').AsString;
        dm.tbExtratoVAL_PERCENTUAL_ENTREGADOR.Value := dm.qryGeral.FieldByName('VAL_VOLUMES_EXTRA').AsFloat;
        dm.tbExtratoCOD_ENTREGADOR.Value :=
          dm.qryGeral.FieldByName('COD_ENTREGADOR').AsInteger;
        dm.tbExtratoDES_ENTREGADOR.Value :=
          dm.qryGeral.FieldByName('DES_ENTREGADOR').AsString;
        dm.tbExtratoQTD_VOLUMES.Value :=
          dm.qryGeral.FieldByName('QTD_VOLUMES').AsInteger;
        dm.tbExtratoQTD_ENTREGA.Value :=
          dm.qryGeral.FieldByName('QTD_ENTREGA').AsInteger;
        dm.tbExtratoVAL_VERBA.Value := dm.qryGeral.FieldByName('VAL_VERBA')
          .AsCurrency;
        dm.tbExtratoVAL_VERBA_TOTAL.Value :=
          dm.qryGeral.FieldByName('VAL_VERBA_TOTAL').AsCurrency;
        dm.tbExtratoVAL_CREDITO.Value :=
          dm.qryGeral.FieldByName('VAL_CREDITO').AsCurrency;
        dm.tbExtratoVAL_DEBITO.Value := dm.qryGeral.FieldByName('VAL_DEBITO')
          .AsCurrency;
        dm.tbExtratoVAL_RESTRICAO.Value :=
          dm.qryGeral.FieldByName('VAL_RESTRICAO').AsCurrency;
        dm.tbExtratoVAL_SUB_TOTAL.Value :=
          dm.qryGeral.FieldByName('VAL_SUB_TOTAL').AsCurrency;
        dm.tbExtratoQTD_VOLUMES_EXTRA.Value :=
          dm.qryGeral.FieldByName('QTD_VOLUMES_EXTRA').AsFloat;
        dm.tbExtratoVAL_VOLUMES_EXTRA.Value :=
          dm.qryGeral.FieldByName('VAL_VOLUMES_EXTRA').AsCurrency;
        dm.tbExtratoVAL_TOTAL.Value := dm.qryGeral.FieldByName('VAL_TOTAL')
          .AsCurrency;
        dm.tbExtratoVAL_ABASTECIMENTO.Value :=
          dm.qryGeral.FieldByName('VAL_ABASTECIMENTO').AsCurrency;
        dm.tbExtratoVAL_TOTAL_DESCONTOS.Value :=
          dm.qryGeral.FieldByName('VAL_TOTAL_DESCONTOS').AsCurrency;
        dm.tbExtratoVAL_TOTAL_CREDITOS.Value :=
          dm.qryGeral.FieldByName('VAL_TOTAL_CREDITOS').AsCurrency;
        dm.tbExtratoVAL_TOTAL_GERAL.Value :=
          dm.qryGeral.FieldByName('VAL_TOTAL_GERAL').AsCurrency;
        dm.tbExtratoDAT_INICIO.Value := dm.qryGeral.FieldByName('DAT_INICIO')
          .AsDateTime;
        dm.tbExtratoDAT_TERMINO.Value :=
          dm.qryGeral.FieldByName('DAT_TERMINO').AsDateTime;
        dm.tbExtratoDAT_INICIO_ABASTECIMENTO.Value :=
          dm.qryGeral.FieldByName('DAT_INICIO_ABASTECIMENTO').AsDateTime;
        dm.tbExtratoDAT_FINAL_ABASTECIMENTO.Value :=
          dm.qryGeral.FieldByName('DAT_FINAL_ABASTECIMENTO').AsDateTime;
        dm.tbExtratoDAT_PAGO.Value := dm.qryGeral.FieldByName('DAT_PAGO')
          .AsDateTime;
        dm.tbExtratoNUM_EXTRATO.Value :=
          dm.qryGeral.FieldByName('NUM_EXTRATO').AsString;
        dm.tbExtratoQTD_ATRASOS.Value := dm.qryGeral.FieldByName('QTD_1_DIA')
          .AsInteger;
        dm.tbExtratoQTD_2_DIAS.Value := dm.qryGeral.FieldByName('QTD_2_DIAS')
          .AsInteger;
        dm.tbExtratoQTD_MAIS_DIAS.Value :=
          dm.qryGeral.FieldByName('QTD_MAIS_DIAS').AsInteger;
        dm.tbExtrato.Post;
        dm.qryGeral.Next;
      end;
    end;
    dPosicao := (Contador / LinhasTotal) * 100;
    Inc(Contador);
    frmProcesso.cxProgressBar1.Position := dPosicao;
    frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
    frmProcesso.cxProgressBar1.Refresh;
  end;
  frmProcesso.Close;
  FreeAndNil(frmProcesso);
  cxGrid1DBTableView1.ViewData.Expand(True);
  Screen.Cursor := crDefault;
  actFechamentoExportarResumo.Enabled := True;
  actFechamentoExportarEntregas.Enabled := True;
  actExtratoCalcular.Enabled := True;
  actFechamentoFechar.Enabled := False;
  if (not dm.tbExtrato.IsEmpty) then
  begin
    actFechamentoCancelarFechamento.Enabled := True;
  end
  else
  begin
    actFechamentoCancelarFechamento.Enabled := True;
  end;
  cxGrid1DBTableView1.ViewData.Expand(True);
end;




End.




























