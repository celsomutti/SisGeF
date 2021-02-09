unit ufrmControleKM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans,
  dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter,
  cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxPC, dxmdaset, cxContainer, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxButtonEdit, ActnList,
  Menus, StdCtrls, cxButtons, clControleKM, clEntregador, clVeiculos,
  clAbastecimentos,
  cxGridExportLink, ShellAPI, cxSpinEdit, cxTimeEdit, cxCurrencyEdit,
  cxNavigator, Vcl.ComCtrls, dxCore, cxDateUtils, cxImage,
  Vcl.ExtCtrls, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxBarBuiltInMenu, System.Actions, clAcessos, clConexao, dxBevel, cxGroupBox, cxDBLookupComboBox, cxDBEdit,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxDateRanges, cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TfrmControleKM = class(TForm)
    tbGrid: TdxMemData;
    ds: TDataSource;
    aclCadastro: TActionList;
    actCadastroExcluir: TAction;
    actCadastroCancelar: TAction;
    actCadastroListaApoio: TAction;
    actCadastroSalvar: TAction;
    actCadastroSair: TAction;
    actCadastroExportar: TAction;
    SaveDialog: TSaveDialog;
    cxLabel27: TcxLabel;
    tbGridSEQ_CONTROLE: TIntegerField;
    tbGridDAT_CONTROLE: TDateField;
    tbGridDES_PLACA: TWideStringField;
    tbGridQTD_KM_INICIAL: TIntegerField;
    tbGridDES_HORA_SAIDA: TWideStringField;
    tbGridQTD_KM_FINAL: TIntegerField;
    tbGridDES_HORA_RETORNO: TWideStringField;
    tbGridCOD_ENTREGADOR: TIntegerField;
    tbGridCOD_ENTREGADOR_: TIntegerField;
    tbGridDES_OBSERVACOES: TWideStringField;
    tbGridNOM_EXECUTOR: TWideStringField;
    tbGridDAT_MANUTENCAO: TDateTimeField;
    tbGridQTD_KM: TFloatField;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1SEQ_CONTROLE: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_CONTROLE: TcxGridDBColumn;
    cxGrid1DBTableView1DES_PLACA: TcxGridDBColumn;
    cxGrid1DBTableView1QTD_KM_INICIAL: TcxGridDBColumn;
    cxGrid1DBTableView1DES_HORA_SAIDA: TcxGridDBColumn;
    cxGrid1DBTableView1QTD_KM_FINAL: TcxGridDBColumn;
    cxGrid1DBTableView1DES_HORA_RETORNO: TcxGridDBColumn;
    cxGrid1DBTableView1QTD_KM: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel10: TcxLabel;
    cxNomeEntregador: TcxTextEdit;
    cxLabel7: TcxLabel;
    dxBevel1: TdxBevel;
    cxButton2: TcxButton;
    cxButton1: TcxButton;
    cxButton5: TcxButton;
    dsCadastro: TDataSource;
    cxGrid1DBTableView1COD_ENTREGADOR: TcxGridDBColumn;
    actCadastroIncluir: TAction;
    actCadastroFiltro: TAction;
    cxButton6: TcxButton;
    cxButton7: TcxButton;
    cxButton4: TcxButton;
    cxButton3: TcxButton;
    cxButton8: TcxButton;
    actCadastroEditar: TAction;
    cxData: TcxDBDateEdit;
    cxPlaca: TcxDBTextEdit;
    cxKMInicial: TcxDBMaskEdit;
    cxHoraSaida: TcxDBMaskEdit;
    cxKMFinal: TcxDBMaskEdit;
    cxHoraRetorno: TcxDBMaskEdit;
    cxCodigoEntregador: TcxDBButtonEdit;
    cxObs: TcxDBTextEdit;
    cxButton9: TcxButton;
    actCadastroAtualizar: TAction;
    procedure actCadastroExcluirExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actCadastroCancelarExecute(Sender: TObject);
    procedure actCadastroListaApoioExecute(Sender: TObject);
    procedure cxCodigoEntregadorPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure actCadastroSalvarExecute(Sender: TObject);
    procedure actCadastroSairExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actCadastroExportarExecute(Sender: TObject);
    procedure cxKMInicialKeyPress(Sender: TObject; var Key: Char);
    procedure cxKMFinalKeyPress(Sender: TObject; var Key: Char);
    procedure cxCodigoEntregadorKeyPress(Sender: TObject; var Key: Char);
    procedure cxPlacaPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure tbGridCalcFields(DataSet: TDataSet);
    procedure dsStateChange(Sender: TObject);
    procedure actCadastroIncluirExecute(Sender: TObject);
    procedure actCadastroFiltroExecute(Sender: TObject);
    procedure actCadastroEditarExecute(Sender: TObject);
    procedure actCadastroAtualizarExecute(Sender: TObject);

  private
    { Private declarations }
    procedure AtualizaGrid;
    procedure Modo;
    procedure SetupForm;
    procedure SetupClass;
    procedure ListaEntregador;
    procedure PopulaEntregador;
    procedure FiltraDados;
  public
    { Public declarations }
  end;

var
  frmControleKM: TfrmControleKM;
  sOperacao: String;
  controle: TControleKM;
  entregador: TEntregador;
  veiculo: TVeiculos;
  abastecimento: TAbastecimentos;
  acessos: TAcessos;
  conexao: TConexao;

implementation

{$R *.dfm}

uses
  udm, ufrmPrincipal, clUtil, Math, uGlobais, ufrmListaApoio, ufrmFiltro;

procedure TfrmControleKM.actCadastroEditarExecute(Sender: TObject);
begin
  cxGroupBox1.Visible := True;
  entregador.Cadastro := tbGridCOD_ENTREGADOR.Value;
  cxNomeEntregador.Text := entregador.getField('DES_RAZAO_SOCIAL','CADASTRO');
  tbGrid.Edit;
  cxData.SetFocus;
end;

procedure TfrmControleKM.actCadastroExcluirExecute(Sender: TObject);
var
  iSeq: Integer;
begin
  iSeq := tbGridSEQ_CONTROLE.AsInteger;
  if MessageDlg('Confirma excluir este Registro?', mtConfirmation, [mbYes, mbNo], 0) = IDNO then
  begin
    Exit;
  end;
  controle.Sequencia := iSeq;
  if controle.Delete('CODIGO') then
  begin
    MessageDlg('Registro Excluído.', mtInformation, [mbOK], 0);
    if (not tbGrid.Locate('SEQ_CONTROLE',iSeq,[])) then
    begin
      AtualizaGrid;
    end;
    sOperacao := 'I';
  end;
end;

procedure TfrmControleKM.FormShow(Sender: TObject);
begin
  veiculo := TVeiculos.Create();
  entregador := TEntregador.Create();
  controle := TControleKM.Create();
  abastecimento := TAbastecimentos.Create();
  acessos := TAcessos.Create;
  PopulaEntregador;
  acessos.SetNivel(aclCadastro);
  AtualizaGrid;
  sOperacao := 'I';
  //Modo;
end;

procedure TfrmControleKM.actCadastroAtualizarExecute(Sender: TObject);
begin
  AtualizaGrid;
end;

procedure TfrmControleKM.actCadastroCancelarExecute(Sender: TObject);
begin
  sOperacao := 'I';
  tbGrid.Cancel;
end;

procedure TfrmControleKM.actCadastroListaApoioExecute(Sender: TObject);
begin
  if Pos(sOperacao, 'IU') = 0 then
  begin
    Exit;
  end;
  if cxCodigoEntregador.IsFocused then
  begin
    ListaEntregador;
  end;
end;

procedure TfrmControleKM.cxCodigoEntregadorPropertiesButtonClick
  (Sender: TObject; AButtonIndex: Integer);
begin
  actCadastroListaApoioExecute(Self);
end;

procedure TfrmControleKM.actCadastroSalvarExecute(Sender: TObject);
begin
  SetupClass;
  if not(controle.Validar()) then
  begin
    Exit;
  end;
  if TUtil.Empty(cxData.Text) then
  begin
    MessageDlg('Informe a Data!', mtWarning, [mbOK], 0);
    Exit;
  end;
  if MessageDlg('Confirma salvar os dados?', mtConfirmation, [mbYes, mbNo], 0) = IDNO
  then
  begin
    Exit;
  end;
  if sOperacao = 'I' then
  begin
    if not(controle.Insert()) then
    begin
      MessageDlg('Não foi possível incluir os dados!', mtWarning, [mbOK], 0);
      Exit;
    end;
  end
  else
  begin
    if not(controle.Update()) then
    begin
      MessageDlg('Não foi possível alterar os dados!', mtWarning, [mbOK], 0);
      Exit;
    end;
  end;
  tbGrid.Post;
  sOperacao := 'I';
  MessageDlg('Dados Salvos com Sucesso!', mtInformation, [mbOK], 0);
end;

procedure TfrmControleKM.actCadastroSairExecute(Sender: TObject);
begin
  try
    Perform(WM_CLOSE, 0, 0);
  except
    on E: Exception do
      MessageDlg(E.Message, mtError, mbOKCancel, 0);
  end;
end;

procedure TfrmControleKM.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm.tbCadastro.Close;
  tbGrid.Close;
  veiculo.Free;
  entregador.Free;
  controle.Free;
  abastecimento.Free;
  acessos.Free;
  conexao.Free;
  Action := caFree;
  frmControleKM := Nil;
end;

procedure TfrmControleKM.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmControleKM.actCadastroExportarExecute(Sender: TObject);
var
  FileExt: String;
begin
  if not(tbGrid.Active) then
  begin
    Exit;
  end;
  if tbGrid.IsEmpty then
  begin
    Exit;
  end;
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
    ShellExecute(Handle, 'open', pchar(SaveDialog.FileName), nil, nil, SW_SHOW);
  end;
end;

procedure TfrmControleKM.actCadastroFiltroExecute(Sender: TObject);
begin
  FiltraDados;
end;

procedure TfrmControleKM.actCadastroIncluirExecute(Sender: TObject);
begin
  cxGroupBox1.Visible := True;
  tbGrid.Insert;
  cxData.SetFocus;
end;

procedure TfrmControleKM.AtualizaGrid;
begin
  Screen.Cursor := crHourGlass;
  if tbGrid.Active then
  begin
    tbGrid.Close;
  end;
  tbGrid.Open;
  if controle.getObjects then
  begin
    tbGrid.LoadFromDataSet(dm.qryGetObject);
  end;
  dm.qryGetObject.Close;
  dm.qryGetObject.SQL.Clear;
  Screen.Cursor := crDefault;
end;

procedure TfrmControleKM.Modo;
begin
  if sOperacao = 'I' then
  begin
    actCadastroIncluir.Enabled := False;
    actCadastroFiltro.Enabled := False;
    actCadastroExcluir.Enabled := False;
    actCadastroCancelar.Enabled := True;
    actCadastroSalvar.Enabled := True;
  end
  else if sOperacao = 'U' then
  begin
    actCadastroIncluir.Enabled := False;
    actCadastroFiltro.Enabled := False;
    actCadastroCancelar.Enabled := True;
    actCadastroExcluir.Enabled := True;
    actCadastroSalvar.Enabled := True;
  end
  else
  begin
    actCadastroIncluir.Enabled := False;
    actCadastroFiltro.Enabled := False;
    actCadastroCancelar.Enabled := True;
    actCadastroExcluir.Enabled := True;
    actCadastroSalvar.Enabled := True;
  end;
end;

procedure TfrmControleKM.SetupForm;
begin
  cxData.Date := controle.Data;
  cxPlaca.Text := controle.Placa;
  cxKMInicial.Text := IntToStr(controle.KMInicial);
  cxHoraSaida.Text := controle.HoraSaida;
  cxKMFinal.Text := IntToStr(controle.KMFinal);
  cxHoraRetorno.Text := controle.HoraRetorno;
  cxCodigoEntregador.Text := IntToStr(controle.entregador);
  if entregador.getObject(IntToStr(controle.entregador), 'CADASTRO') then
  begin
    cxNomeEntregador.Text := entregador.Nome;
  end
  else
  begin
    cxNomeEntregador.Text := '---';
  end;
  cxObs.Text := controle.Obs;
end;

procedure TfrmControleKM.tbGridCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('QTD_KM').AsFloat := DataSet.FieldByName('QTD_KM_FINAL').AsFloat -
                                           DataSet.FieldByName('QTD_KM_INICIAL').AsFloat
end;

procedure TfrmControleKM.SetupClass;
begin
  controle.Data := cxData.Date;
  controle.Placa := cxPlaca.Text;
  if Not(TUtil.Empty(cxKMInicial.Text)) then
  begin
    controle.KMInicial := StrToInt(cxKMInicial.Text);
  end
  else
  begin
    controle.KMInicial := 0;
  end;
  controle.HoraSaida := cxHoraSaida.Text;
  if Not(TUtil.Empty(cxKMFinal.Text)) then
  begin
    controle.KMFinal := StrToInt(cxKMFinal.Text);
  end
  else
  begin
    controle.KMFinal := 0;
  end;
  controle.HoraRetorno := cxHoraRetorno.Text;
  if not(TUtil.Empty(cxCodigoEntregador.Text)) then
  begin
    controle.entregador := StrToInt(cxCodigoEntregador.Text);
  end
  else
  begin
    controle.entregador := 0;
  end;
  controle.Obs := cxObs.Text;
  controle.Executor := uGlobais.sUsuario;
  controle.Manutencao := Now;
end;

procedure TfrmControleKM.cxKMInicialKeyPress(Sender: TObject; var Key: Char);
begin
  Key := TUtil.SoNumero(Key);
end;

procedure TfrmControleKM.cxKMFinalKeyPress(Sender: TObject; var Key: Char);
begin
  Key := TUtil.SoNumero(Key);
end;

procedure TfrmControleKM.cxCodigoEntregadorKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := TUtil.SoNumero(Key);
end;

procedure TfrmControleKM.cxPlacaPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  sEntregador: String;
begin
  if sOperacao = 'I' then
  begin
    sEntregador := '';
    if Not(TUtil.Empty(cxPlaca.Text)) then
    begin
      veiculo.Placa := cxPlaca.Text;
      sEntregador := veiculo.getField('COD_ENTREGADOR', 'PLACA');
      if TUtil.Empty(sEntregador) then
      begin
        cxCodigoEntregador.Text := '';
        cxNomeEntregador.Text := '';
      end
      else
      begin
        cxCodigoEntregador.Text := sEntregador;
        entregador.cADASTRO := StrToInt(sEntregador);
        cxNomeEntregador.Text := entregador.getField('NOM_FANTASIA',
          'CADASTRO');
      end;
    end;
  end;
end;

procedure TfrmControleKM.dsStateChange(Sender: TObject);
begin
  if TDataSource(Sender).DataSet.State in [dsInsert, dsEdit] then
  begin
    actCadastroIncluir.Enabled := False;
    actCadastroFiltro.Enabled := False;
    actCadastroExcluir.Enabled := False;
    actCadastroCancelar.Enabled := True;
    actCadastroSalvar.Enabled := True;
    actCadastroExportar.Enabled := False;
    actCadastroFiltro.Enabled := False;
    actCadastroAtualizar.Enabled := False;
    cxGroupBox1.Visible := True;
  end
  else if TDataSource(Sender).DataSet.State in [dsBrowse] then
  begin
    actCadastroIncluir.Enabled := True;
    actCadastroFiltro.Enabled := True;
    actCadastroCancelar.Enabled := False;
    actCadastroExcluir.Enabled := True;
    actCadastroSalvar.Enabled := False;
    actCadastroExportar.Enabled := True;
    actCadastroFiltro.Enabled := True;
    actCadastroAtualizar.Enabled := True;
    cxGroupBox1.Visible := False;
  end;

end;

procedure TfrmControleKM.ListaEntregador;
var
  sId: String;
begin
  if Pos(sOperacao, 'IU') = 0 then
  begin
    Exit;
  end;
  sId := '';
  Screen.Cursor := crHourGlass;
  sId := Trim(cxCodigoEntregador.Text);
  with dm.qryPesquisa do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT COD_CADASTRO AS "Cadastro", DES_RAZAO_SOCIAL AS "Nome" '
      + 'FROM tbentregadores ';
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
  frmListaApoio.Caption := 'Entregadores/Motoristas';
  Screen.Cursor := crDefault;
  if frmListaApoio.ShowModal = mrOk then
  begin
    cxCodigoEntregador.Text := dm.qryPesquisa.Fields[0].AsString;
    cxCodigoEntregador.Refresh;
    cxNomeEntregador.Text := dm.qryPesquisa.Fields[1].AsString;
    cxNomeEntregador.Refresh;
  end;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  FreeAndNil(frmListaApoio);
end;

procedure TfrmControleKM.PopulaEntregador;
begin
  if dm.tbCadastro.Active then
  begin
    dm.tbCadastro.Close;
  end;
  dm.tbCadastro.Open;
  if entregador.getObjects then
  begin
    dm.tbCadastro.LoadFromDataSet(dm.qryGetObject);
  end;
  dm.qryGetObject.Close;
  dm.qryGetObject.SQL.Clear;
end;

procedure TfrmControleKM.FiltraDados;
var
  i: Integer;
  sFiltro: String;
begin
  if not Assigned(frmFiltro) then
  begin
    frmFiltro := TfrmFiltro.Create(Application);
  end;
  for i := 0 to cxGrid1DBTableView1.ColumnCount - 1 do
  begin
    if (cxGrid1DBTableView1.Columns[i].Visible) and
      (cxGrid1DBTableView1.Columns[i].Tag >= 0) then
    begin
      frmFiltro.slCampos.Add(cxGrid1DBTableView1.Columns[i].Caption);
      frmFiltro.slSQL.Add(cxGrid1DBTableView1.Columns[i].DataBinding.FieldName);
      frmFiltro.slValores.Add(cxGrid1DBTableView1.Columns[i].DataBinding.ValueType);
    end;
  end;
  if frmFiltro.ShowModal = mrCancel then
  begin
    FreeAndNil(frmFiltro);
    Exit;
  end;
  sFiltro := '';
  i := 0;
  for i := 0 to frmFiltro.slSQLFil.Count - 1 do
  begin
    sFiltro := sFiltro + frmFiltro.slSQLFil[i];
  end;
  FreeAndNil(frmFiltro);
  Screen.Cursor := crHourGlass;
  tbGrid.Close;
  tbGrid.Open;
  dm.qryGetObject.Close;
  dm.qryGetObject.SQL.Clear;
  if controle.getObject(sFiltro, 'FILTRO') then
  begin
    tbGrid.LoadFromDataSet(dm.qryGetObject);
  end;
  dm.qryGetObject.Close;
  dm.qryGetObject.SQL.Clear;
  Screen.Cursor := crDefault;
end;

end.
