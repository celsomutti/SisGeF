unit ufrmAssinantesJornal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxLabel, dxSkinscxPCPainter, dxLayoutContainer, dxLayoutControl, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxImageComboBox, cxDBLookupComboBox, cxMaskEdit, cxTextEdit, System.Actions,
  Vcl.ActnList, Vcl.Menus, Vcl.StdCtrls, cxButtons, clAssinantesJornal, clProdutos, clEstados, clAcessos, cxGridExportLink,
  ShellAPI;

type
  TfrmAssinantesJornal = class(TForm)
    cxLabel27: TcxLabel;
    dsAssinaturas: TDataSource;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1RecId: TcxGridDBColumn;
    cxGrid1DBTableView1ID_ASSINANTE: TcxGridDBColumn;
    cxGrid1DBTableView1COD_ASSINANTE: TcxGridDBColumn;
    cxGrid1DBTableView1COD_MODALIDADE: TcxGridDBColumn;
    cxGrid1DBTableView1COD_PRODUTO: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_ORDEM: TcxGridDBColumn;
    cxGrid1DBTableView1QTD_EXEMPLARES: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_ASSINANTE: TcxGridDBColumn;
    cxGrid1DBTableView1DES_TIPO_LOGRADOURO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_LOGRADOURO: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_LOGRADOURO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_COMPLEMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_BAIRRO: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_CIDADE: TcxGridDBColumn;
    cxGrid1DBTableView1UF_ESTADO: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_CEP: TcxGridDBColumn;
    cxGrid1DBTableView1DES_REFERENCIA: TcxGridDBColumn;
    cxGrid1DBTableView1DES_ROTEIRO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_LOG: TcxGridDBColumn;
    dsProdutos: TDataSource;
    dsEstados: TDataSource;
    aclAssinantesJornal: TActionList;
    actimportar: TAction;
    actLocalizar: TAction;
    actExportar: TAction;
    actFiltrar: TAction;
    actCancelar: TAction;
    actSair: TAction;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxButton5: TcxButton;
    cxButton6: TcxButton;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actSairExecute(Sender: TObject);
    procedure FiltrarDados;
    procedure LocalizarAssinatura;
    procedure cxGrid1DBTableView1COD_ASSINANTEPropertiesValidate(Sender: TObject; var DisplayValue: Variant;
      var ErrorText: TCaption; var Error: Boolean);
    procedure cxGrid1DBTableView1COD_PRODUTOPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure FormShow(Sender: TObject);
    procedure cxGrid1DBTableView1COD_MODALIDADEPropertiesValidate(Sender: TObject; var DisplayValue: Variant;
      var ErrorText: TCaption; var Error: Boolean);
    procedure cxGrid1DBTableView1NOM_ASSINANTEPropertiesValidate(Sender: TObject; var DisplayValue: Variant;
      var ErrorText: TCaption; var Error: Boolean);
    procedure actFiltrarExecute(Sender: TObject);
    procedure actLocalizarExecute(Sender: TObject);
    procedure cxGrid1DBTableView1ID_ASSINANTEPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure actimportarExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure dsAssinaturasStateChange(Sender: TObject);
    procedure actExportarExecute(Sender: TObject);
  private
    { Private declarations }
    procedure ImportarAssinaturas;
    procedure PopulaEstados;
    procedure PopulaProdutos;
  public
    { Public declarations }
  end;

var
  frmAssinantesJornal: TfrmAssinantesJornal;
  sId, sColuna, sOperacao: String;
  assinante: TAssinantesJornal;
  produtos: TProdutos;
  estados: TEstados;
  acessos: TAcessos;
implementation

{$R *.dfm}

uses ufrmFiltro, udm, clUtil, uGlobais, ufrmProcesso;

procedure TfrmAssinantesJornal.actCancelarExecute(Sender: TObject);
begin
  dm.tbAssinantesJornal.Close;
end;

procedure TfrmAssinantesJornal.actExportarExecute(Sender: TObject);
var
  FileExt, sFile: String;
begin
  if not(dm.tbAssinantesJornal.Active) then
  begin
    Exit;
  end;
  if dm.tbAssinantes.IsEmpty then
  begin
    Exit;
  end;
  SaveDialog.Filter := '';
  SaveDialog.Filter := 'Excel (*.xls) |*.xls|XML (*.xml) |*.xml|Arquivo Texto (*.txt) |*.txt|Página Web (*.html)|*.html';
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

procedure TfrmAssinantesJornal.actFiltrarExecute(Sender: TObject);
begin
  FiltrarDados;
end;

procedure TfrmAssinantesJornal.actimportarExecute(Sender: TObject);
begin
  if Application.MessageBox('Confirma a importação das assinaturas?', PChar('Atenção ' + uGlobais.sUsuario),
                            MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  ImportarAssinaturas;
end;

procedure TfrmAssinantesJornal.actLocalizarExecute(Sender: TObject);
begin
  sOperacao := 'S';
  dm.tbAssinantesJornal.Close;
  dm.tbAssinantesJornal.Open;
  dm.tbAssinantesJornal.Insert;
  cxGrid1DBTableView1ID_ASSINANTE.FocusWithSelection;
end;

procedure TfrmAssinantesJornal.actSairExecute(Sender: TObject);
begin
  Perform(WM_CLOSE, 0, 0);
end;

procedure TfrmAssinantesJornal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm.tbProdutos.Close;
  dm.tbEstados.Close;
  dm.tbAssinantesJornal.Close;
  acessos.Free;
  produtos.Free;
  estados.Free;
  assinante.Free;
  Action := caFree;
  frmAssinantesJornal := Nil;
end;

procedure TfrmAssinantesJornal.FormShow(Sender: TObject);
begin
  acessos := Tacessos.Create;
  assinante := TAssinantesJornal.Create;
  produtos := TProdutos.Create;
  estados:= TEstados.Create;
  PopulaEstados;
  PopulaProdutos;
  acessos.SetNivel(aclAssinantesJornal);
end;

procedure TfrmAssinantesJornal.cxGrid1DBTableView1COD_ASSINANTEPropertiesValidate(Sender: TObject; var DisplayValue: Variant;
  var ErrorText: TCaption; var Error: Boolean);
begin
  if sOperacao = 'S' then
  begin
    sId := DisplayValue;
    sId := Format('%.10d', [StrToInt(sId)]);
    sColuna := 'CODIGO';
    LocalizarAssinatura;
  end;
end;

procedure TfrmAssinantesJornal.cxGrid1DBTableView1COD_MODALIDADEPropertiesValidate(Sender: TObject; var DisplayValue: Variant;
  var ErrorText: TCaption; var Error: Boolean);
begin
  if sOperacao = 'S' then
  begin
    sId := cxGrid1DBTableView1COD_MODALIDADE.DataBinding.Field.Value;
    sColuna := 'MODALIDADE';
    LocalizarAssinatura;
  end;
end;

procedure TfrmAssinantesJornal.cxGrid1DBTableView1COD_PRODUTOPropertiesValidate(Sender: TObject; var DisplayValue: Variant;
  var ErrorText: TCaption; var Error: Boolean);
begin
  if sOperacao = 'S' then
  begin
    produtos.Descricao := DisplayValue;
    sId := produtos.getField('COD_PRODUTO', 'DESCRICAO');
    if sId.IsEmpty then
    begin
      Exit;
    end;
    sColuna := 'PRODUTO';
    LocalizarAssinatura;
  end;
end;

procedure TfrmAssinantesJornal.cxGrid1DBTableView1ID_ASSINANTEPropertiesValidate(Sender: TObject; var DisplayValue: Variant;
  var ErrorText: TCaption; var Error: Boolean);
begin
  if sOperacao = 'S' then
  begin
    sId := DisplayValue;
    sColuna := 'ID';
    LocalizarAssinatura;
  end;
end;

procedure TfrmAssinantesJornal.cxGrid1DBTableView1NOM_ASSINANTEPropertiesValidate(Sender: TObject; var DisplayValue: Variant;
  var ErrorText: TCaption; var Error: Boolean);
begin
  if sOperacao = 'S' then
  begin
    sId := DisplayValue;
    sColuna := 'NOME';
    LocalizarAssinatura;
  end;
end;

procedure TfrmAssinantesJornal.dsAssinaturasStateChange(Sender: TObject);
begin
  if TDataSource(Sender).DataSet.State in [dsInsert, dsEdit] then
  begin
    actimportar.Enabled := False;
    actFiltrar.Enabled := False;
    actExportar.Enabled := False;
    actSair.Enabled := True;
    actCancelar.Enabled := True;
    if TDataSource(Sender).DataSet.State in [dsEdit] then
    begin
      cxGrid1DBTableView1DES_ROTEIRO.Properties.ReadOnly := False;
    end
    else begin
      cxGrid1DBTableView1DES_ROTEIRO.Properties.ReadOnly := True;
    end;
  end
  else if TDataSource(Sender).DataSet.State in [dsBrowse] then
  begin
    actimportar.Enabled := True;
    actFiltrar.Enabled := True;
    actExportar.Enabled := True;
    actSair.Enabled := True;
    actCancelar.Enabled := True;
  end;
end;

procedure TfrmAssinantesJornal.FiltrarDados;
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
    if (cxGrid1DBTableView1.Columns[i].Visible) and (cxGrid1DBTableView1.Columns[i].Tag >= 0) then
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
  sId := sFiltro;
  sColuna := 'FILTRO';
  FreeAndNil(frmFiltro);
  sOperacao := 'S';
  LocalizarAssinatura;
end;

procedure TfrmAssinantesJornal.LocalizarAssinatura;
begin
  dm.tbAssinantesJornal.Close;
  dm.tbAssinantesJornal.Open;
  dm.tbAssinantesJornal.IsLoading := True;
  if assinante.getObject(sId, sColuna) then
  begin
    dm.tbAssinantesJornal.LoadFromDataSet(dm.qryGetObject);
    dm.tbAssinantesJornal.First;
    sOperacao := 'U';
  end
  else
  begin
    sOperacao := 'X';
  end;
  dm.tbAssinantesJornal.IsLoading := False;
  dm.qryGetObject1.Close;
  dm.qryGetObject1.SQL.Clear;
end;

procedure TfrmAssinantesJornal.ImportarAssinaturas;
var
  sDir, sFile, sDatabase, sMess: String;
  dPosicao: Double;
  iLinhasTotal, iContador, iNovas, iAlteradas: Integer;
begin
  OpenDialog.Title := 'Abrir Banco de dados STD Cliente';
  if OpenDialog.Execute then
  begin
    sFile := OpenDialog.FileName;
    sDir := ExtractFilePath(sFile);
  end
  else
  begin
    Exit;
  end;
  dm.ZConn1.HostName := sDir;
  sDatabase := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=#BD#;Persist Security Info=False;Jet OLEDB:Database Password=i8f0';
  sDatabase := TUtil.ReplaceStr(sDatabase, '#BD#', sFile);
  dm.ZConn1.Database := sDatabase;
  dm.ZConn1.Connect;
  dm.qryAccess.Close;
  dm.qryAccess.SQL.Clear;
  dm.qryAccess.SQL.Text := 'SELECT * FROM Diario_Edicao_Movimentacao ORDER BY sdtEdicaoreal';
  dm.qryAccess.Open;
  iLinhasTotal := 0;
  iNovas := 0;
  ialteradas := 0;
  iContador := 1;
  if not dm.qryAccess.IsEmpty then
  begin
    iLinhasTotal := dm.qryAccess.RecordCount;
    dm.qryAccess.First;
  end;
  if not Assigned(frmProcesso) then
  begin
    frmProcesso := TfrmProcesso.Create(Application);
  end;
  frmProcesso.Show;
  while not dm.qryAccess.Eof do
  begin
    assinante.Codigo := FloatToStr(dm.qryAccess.FieldByName('sCdAssinante').AsFloat);
    assinante.Produto := dm.qryAccess.FieldByName('nCdProduto').AsString;
    assinante.Modalidade := dm.qryAccess.FieldByName('nCdModalidade').AsInteger;
    if not assinante.getObject('', 'CHAVE') then
    begin
      assinante.ID := 0;
      assinante.Ordem := dm.qryAccess.FieldByName('nOrdenacao').AsInteger;
      assinante.Quantidade := dm.qryAccess.FieldByName('nQuantidade').AsInteger;
      assinante.Nome := dm.qryAccess.FieldByName('sDscAssinante').AsString;
      assinante.TipoLogradouro := dm.qryAccess.FieldByName('sTipoLogr').AsString;
      assinante.Logradouro := dm.qryAccess.FieldByName('sLogradouro').AsString;
      assinante.Numero := dm.qryAccess.FieldByName('sNumLogr').AsString;
      assinante.Complemento := dm.qryAccess.FieldByName('sComplLogr').AsString;
      assinante.Bairro := dm.qryAccess.FieldByName('sBairro').AsString;
      assinante.CEP := dm.qryAccess.FieldByName('sCep05').AsString + dm.qryAccess.FieldByName('sCep03').AsString;
      assinante.Cidade := dm.qryAccess.FieldByName('sCidade').AsString;
      assinante.Estado := dm.qryAccess.FieldByName('sUF').AsString;
      assinante.Referencia := dm.qryAccess.FieldByName('sReferencia').AsString;
      assinante.Roteiro := dm.qryAccess.FieldByName('nCdAgente').AsString;
      assinante.LOG := 'Importado em ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' por ' + uGlobais.sNomeUsuario;
      if not assinante.Insert then
      begin
        Application.MessageBox(PChar('Erro ao incluir a assinatura ' + assinante.Codigo + ' !'),
                               PChar('Atenção ' + uglobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
      end
      else
      begin
        Inc(iNovas);
      end;
    end
    else
    begin
      assinante.Ordem := dm.qryAccess.FieldByName('nOrdenacao').AsInteger;
      assinante.Quantidade := dm.qryAccess.FieldByName('nQuantidade').AsInteger;
      assinante.Nome := dm.qryAccess.FieldByName('sDscAssinante').AsString;
      assinante.TipoLogradouro := dm.qryAccess.FieldByName('sTipoLogr').AsString;
      assinante.Logradouro := dm.qryAccess.FieldByName('sLogradouro').AsString;
      assinante.Numero := dm.qryAccess.FieldByName('sNumLogr').AsString;
      assinante.Complemento := dm.qryAccess.FieldByName('sComplLogr').AsString;
      assinante.Bairro := dm.qryAccess.FieldByName('sBairro').AsString;
      assinante.CEP := dm.qryAccess.FieldByName('sCep05').AsString + dm.qryAccess.FieldByName('sCep03').AsString;
      assinante.Cidade := dm.qryAccess.FieldByName('sCidade').AsString;
      assinante.Estado := dm.qryAccess.FieldByName('sUF').AsString;
      assinante.Referencia := dm.qryAccess.FieldByName('sReferencia').AsString;
      assinante.Roteiro := dm.qryAccess.FieldByName('nCdAgente').AsString;
      assinante.LOG := assinante.LOG + #13 +
                       'Atualizado em ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' por ' + uGlobais.sNomeUsuario;
      if not assinante.Update then
      begin
        Application.MessageBox(PChar('Erro ao alterar a assinatura ' + assinante.Codigo + ' !'),
                               PChar('Atenção ' + uglobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
      end
      else
      begin
        Inc(iAlteradas);
      end;
    end;
    dm.qryAccess.Next;
    dPosicao := (iContador / iLinhasTotal) * 100;
    frmProcesso.cxProgressBar1.Position := dPosicao;
    frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
    frmProcesso.cxProgressBar1.Refresh;
    Inc(iContador, 1);
  end;
  frmProcesso.Close;
  FreeAndNil(frmProcesso);
  dm.qryAccess.Close;
  dm.qryAccess.SQL.Clear;
  dm.ZConn1.Disconnect;
  sMess := 'Importação terminada.' + #13 + #13 + FormatFloat(',0',iNovas) + ' Assinaturas Incluídas.' + #13 +
           FormatFloat(',0',iAlteradas) + ' Assinaturas Alteradas' + #13 +
           FormatFloat(',0', iContador) + ' Assinaturas Processadas';
  Application.MessageBox(PChar(sMess), PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONINFORMATION);
end;

procedure TfrmAssinantesJornal.PopulaProdutos;
begin
  dm.tbProdutos.Close;
  dm.tbProdutos.Open;
  dm.tbProdutos.IsLoading := True;
  if produtos.getObjects() then
  begin
    dm.tbProdutos.LoadFromDataSet(dm.qryGetObject1);
  end;
  dm.tbProdutos.IsLoading := False;
  dm.qryGetObject1.Close;
  dm.qryGetObject1.SQL.Clear;
end;

procedure TfrmAssinantesJornal.PopulaEstados;
begin
  dm.tbEstados.Close;
  dm.tbEstados.Open;
  dm.tbEstados.IsLoading := True;
  if estados.getObjects() then
  begin
    dm.tbEstados.LoadFromDataSet(dm.qryGetObject);
  end;
  dm.tbEstados.IsLoading := False;
  dm.qryGetObject.Close;
  dm.qryGetObject.SQL.Clear;
end;

end.

