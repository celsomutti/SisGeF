unit ufrmEstoqueInsumosTransportes;

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
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxLabel, dxSkinscxPCPainter, dxLayoutContainer, dxLayoutControl, Data.DB, dxmdaset,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, System.Actions, Vcl.ActnList, dxSkinsdxBarPainter, dxBar,
  Model.InsumosTransportes, Model.EstoqueInsumos, Generics.Collections, DAO.EstoqueInsumos, DAO.InsumosTransportes,
  cxDBLookupComboBox, cxCalendar, cxCurrencyEdit, cxMaskEdit, cxGridExportLink, ShellAPI, cxBlobEdit;

type
  TfrmEstoqueInsumosTransportes = class(TForm)
    cxLabel27: TcxLabel;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    tbEstoque: TdxMemData;
    tbEstoqueID_ESTOQUE: TIntegerField;
    tbEstoqueID_INSUMO: TIntegerField;
    tbEstoqueDAT_ESTOQUE: TDateField;
    tbEstoqueQTD_ESTOQUE: TFloatField;
    tbEstoqueVAL_UNITARIO: TFloatField;
    tbEstoqueVAL_TOTAL: TFloatField;
    tbEstoqueDES_LOG: TMemoField;
    dsEstoque: TDataSource;
    tbInsumos: TdxMemData;
    tbInsumosID_INSUMO: TIntegerField;
    tbInsumosDES_INSUMO: TStringField;
    tbInsumosDES_UNIDADE: TStringField;
    tbInsumosDES_LOG: TMemoField;
    dsInsumo: TDataSource;
    tvEstoque: TcxGridDBTableView;
    lvEstoque: TcxGridLevel;
    grdEstoque: TcxGrid;
    lciGrid: TdxLayoutItem;
    tvEstoqueRecId: TcxGridDBColumn;
    tvEstoqueID_ESTOQUE: TcxGridDBColumn;
    tvEstoqueID_INSUMO: TcxGridDBColumn;
    tvEstoqueDAT_ESTOQUE: TcxGridDBColumn;
    tvEstoqueQTD_ESTOQUE: TcxGridDBColumn;
    tvEstoqueVAL_UNITARIO: TcxGridDBColumn;
    tvEstoqueVAL_TOTAL: TcxGridDBColumn;
    tvEstoqueDES_LOG: TcxGridDBColumn;
    aclEstoque: TActionList;
    actIncluir: TAction;
    actEditar: TAction;
    actExcluir: TAction;
    actExportar: TAction;
    actFechar: TAction;
    bmEstoque: TdxBarManager;
    bmEstoqueBar1: TdxBar;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    SaveDialog: TSaveDialog;
    procedure actFecharExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsEstoqueStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actIncluirExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure tbEstoqueBeforePost(DataSet: TDataSet);
    procedure tbEstoqueAfterPost(DataSet: TDataSet);
    procedure tbEstoqueQTD_ESTOQUEValidate(Sender: TField);
    procedure tbEstoqueVAL_UNITARIOValidate(Sender: TField);
    procedure actExportarExecute(Sender: TObject);
  private
    { Private declarations }
    procedure PopulaInsumos();
    procedure PopulaEstoques();
    procedure Exportar();
    procedure ExcluirEstoque();
    procedure SetupEstoque();
  public
    { Public declarations }
  end;

var
  frmEstoqueInsumosTransportes: TfrmEstoqueInsumosTransportes;
  insumo: TInsumosTransportes;
  insumos: TObjectList<TInsumosTransportes>;
  insumoDAO: TInsumosTransportesDAO;
  estoque: TEstoqueInsumos;
  estoques: TObjectList<TEstoqueInsumos>;
  estoqueDAO: TEstoqueInsumosDAO;
implementation

{$R *.dfm}

uses udm, ufrmProcesso, uGlobais;

procedure TfrmEstoqueInsumosTransportes.actEditarExecute(Sender: TObject);
begin
  tbEstoque.Edit;
end;

procedure TfrmEstoqueInsumosTransportes.actExportarExecute(Sender: TObject);
begin
  Exportar();
end;

procedure TfrmEstoqueInsumosTransportes.actFecharExecute(Sender: TObject);
begin
  Perform(WM_CLOSE, 0, 0);
end;

procedure TfrmEstoqueInsumosTransportes.actIncluirExecute(Sender: TObject);
begin
  tbEstoque.Insert;
  tbEstoqueID_ESTOQUE.AsInteger := 0;
end;

procedure TfrmEstoqueInsumosTransportes.dsEstoqueStateChange(Sender: TObject);
begin
  if TDataSource(Sender).DataSet.State in [dsInsert] then
  begin
    actIncluir.Enabled := False;
    actEditar.Enabled := False;
    actExcluir.Enabled := False;
    actExportar.Enabled := False;
    actFechar.Enabled := True;
  end
  else if TDataSource(Sender).DataSet.State in [dsEdit] then
  begin
    actIncluir.Enabled := False;
    actEditar.Enabled := False;
    actExcluir.Enabled := False;
    actExportar.Enabled := False;
    actFechar.Enabled := True;
  end
  else if TDataSource(Sender).DataSet.State in [dsBrowse] then
  begin
    actIncluir.Enabled := True;
    actEditar.Enabled := True;
    actExcluir.Enabled := True;
    actExportar.Enabled := True;
    actFechar.Enabled := True;
  end;
end;

procedure TfrmEstoqueInsumosTransportes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tbEstoque.Close;
  tbInsumos.Close;
  Action := caFree;
  frmEstoqueInsumosTransportes := Nil;
end;

procedure TfrmEstoqueInsumosTransportes.FormShow(Sender: TObject);
begin
  PopulaInsumos();
  PopulaEstoques();
  tvEstoqueDES_LOG.Visible := (uGlobais.iNivelUsuario = 0);
  actEditar.Enabled := (uGlobais.iNivelUsuario = 0);
end;

procedure TfrmEstoqueInsumosTransportes.PopulaInsumos();
var
  iRecords: Integer;
  iContador: Integer;
  insumoTmp : TInsumosTransportes;
  dPosicao: Double;
begin
  try
    tbInsumos.Close;
    if not Assigned(frmProcesso) then
    begin
      frmProcesso := TfrmProcesso.Create(Application);
    end;
    tbInsumos.Open;
    insumoDAO := TInsumosTransportesDAO.Create();
    insumos := insumoDAO.FindInsumo('');
    iRecords := insumos.Count ;
    iContador := 0;
    frmProcesso.cxGroupBox1.Caption := 'Carregando Insumos. Aguarde...';
    frmProcesso.cxGroupBox1.Refresh;
    frmProcesso.cxProgressBar1.Position := 0;
    frmProcesso.Show;
    for insumoTmp in insumos do
    begin
      tbInsumos.Insert;
      tbInsumosID_INSUMO.AsInteger := insumoTmp.ID;
      tbInsumosDES_INSUMO.AsString := insumoTmp.Descricao;
      tbInsumosDES_UNIDADE.AsString := insumoTmp.Unidade;
      tbInsumosDES_LOG.AsString := insumoTmp.Log;
      dPosicao := (iContador / iRecords) * 100;
      Inc(iContador,1);
      frmProcesso.cxProgressBar1.Position := dPosicao;
      frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
      frmProcesso.cxProgressBar1.Refresh;
      tbInsumos.Post;
    end;
  finally
    FreeAndNil(frmProcesso);
    insumoDAO.Free;
  end;
end;

procedure TfrmEstoqueInsumosTransportes.PopulaEstoques();
var
  iRecords: Integer;
  iContador: Integer;
  estoqueTmp : TEstoqueInsumos;
  dPosicao: Double;
begin
  try
    tbEstoque.Close;
    tbEstoque.IsLoading := True;
    if not Assigned(frmProcesso) then
    begin
      frmProcesso := TfrmProcesso.Create(Application);
    end;
    tbEstoque.Open;
    estoqueDAO := TEstoqueInsumosDAO.Create();
    estoques := estoqueDAO.FindEstoque('');
    iRecords := estoques.Count ;
    iContador := 0;
    frmProcesso.cxGroupBox1.Caption := 'Carregando Estoques. Aguarde...';
    frmProcesso.cxGroupBox1.Refresh;
    frmProcesso.cxProgressBar1.Position := 0;
    frmProcesso.Show;
    for estoqueTmp in estoques do
    begin
      tbEstoque.Insert;
      tbEstoqueID_ESTOQUE.AsInteger := estoqueTmp.ID;
      tbEstoqueID_INSUMO.AsInteger := estoqueTmp.Insumo;
      tbEstoqueDAT_ESTOQUE.AsDateTime := estoqueTmp.Data;
      tbEstoqueQTD_ESTOQUE.AsFloat := estoqueTmp.Qtde;
      tbEstoqueVAL_UNITARIO.AsFloat := estoqueTmp.Unitario;
      tbEstoqueVAL_TOTAL.AsFloat := estoqueTmp.Total;
      tbEstoqueDES_LOG.AsString := estoqueTmp.Log;
      dPosicao := (iContador / iRecords) * 100;
      Inc(iContador,1);
      frmProcesso.cxProgressBar1.Position := dPosicao;
      frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
      frmProcesso.cxProgressBar1.Refresh;
      tbEstoque.Post;
    end;
    if not tbEstoque.IsEmpty then
    begin
      tbEstoque.First;
    end;
  finally
    tbEstoque.IsLoading := False;
    FreeAndNil(frmProcesso);
    estoqueDAO.Free;
    tvEstoqueID_INSUMO.FocusWithSelection;
  end;
end;

procedure TfrmEstoqueInsumosTransportes.Exportar();
var
  FileExt, sFile: String;
begin
  if not tbEstoque.Active then
  begin
    Exit;
  end;
  if tbEstoque.IsEmpty then
  begin
    Exit;
  end;
  try
    tvEstoqueDES_LOG.Visible := False;
    sFile := 'estoque_';
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
        ExportGridToExcel(SaveDialog.FileName, grdEstoque, False, True, False)
      else if FileExt = '.xml' then
        ExportGridToXML(SaveDialog.FileName, grdEstoque, False)
      else if FileExt = '.txt' then
        ExportGridToText(SaveDialog.FileName, grdEstoque, False)
      else if FileExt = '.html' then
        ExportGridToHTML(SaveDialog.FileName, grdEstoque, False);
      ShellExecute(Handle, 'open', pchar(SaveDialog.FileName), nil, nil, SW_SHOW);
    end;
  finally
    tvEstoqueDES_LOG.Visible := True;
  end;
end;

procedure TfrmEstoqueInsumosTransportes.ExcluirEstoque();
var
  sSQL : String;
begin
  try
    //VerificaConsumo();
    if Application.MessageBox('Confirma a exclusão deste registro ?', PChar('Atenção ' + uGlobais.sUsuario), MB_YESNO + MB_ICONQUESTION) = ID_NO then
    begin
      Exit;
    end;
    estoqueDAO := TEstoqueInsumosDAO.Create();
    sSQL := 'WHERE ID_ESTOQUE = ' + tbEstoqueID_ESTOQUE.AsString;
    if  estoqueDAO.Delete(sSQL) then
    begin
      tbEstoque.Delete;
    end;
  finally
    estoqueDAO.Free;
  end;
end;

procedure TfrmEstoqueInsumosTransportes.SetupEstoque();
begin
  estoque.ID := tbEstoqueID_ESTOQUE.AsInteger;
  estoque.Insumo := tbEstoqueID_INSUMO.AsInteger;
  estoque.Data := tbEstoqueDAT_ESTOQUE.AsDateTime;
  estoque.Qtde := tbEstoqueQTD_ESTOQUE.AsFloat;
  estoque.Unitario := tbEstoqueVAL_UNITARIO.AsFloat;
  estoque.Total := tbEstoqueVAL_TOTAL.AsFloat;
  estoque.Log := tbEstoqueDES_LOG.AsString;
end;


procedure TfrmEstoqueInsumosTransportes.tbEstoqueAfterPost(DataSet: TDataSet);
begin
  try
    estoque := TEstoqueInsumos.Create();
    estoqueDAO := TEstoqueInsumosDAO.Create();
    if tbEstoque.IsLoading then
    begin
      Exit;
    end;
    SetupEstoque();
    if estoque.ID = 0 then
    begin
      if not estoqueDAO.Insert(estoque) then
      begin
        Application.MessageBox('Erro ao incluir o registro!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONERROR);
        Exit;
      end;
      tbEstoque.Edit;
      tbEstoqueID_ESTOQUE.AsInteger := estoque.ID;
      tbEstoque.Post;
    end
    else
    begin
      if not estoqueDAO.Update(estoque) then
      begin
        Application.MessageBox('Erro ao alterar o registro!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONERROR);
        Exit;
      end;
    end;
    Application.MessageBox('Registro gravado com sucesso!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONINFORMATION);
  finally
    estoque.Free;
    estoqueDAO.Free;
  end;
end;

procedure TfrmEstoqueInsumosTransportes.tbEstoqueBeforePost(DataSet: TDataSet);
var
  sLog : TStringList;
begin
  if tbEstoque.IsLoading then
  begin
    Exit;
  end;
  if Application.MessageBox('Confirma gravar este registro ?', PChar('Atenção ' + uGlobais.sUsuario), MB_YESNO + MB_ICONQUESTION) = ID_NO then
  begin
    Abort;
    Exit;
  end;
  sLog := TStringList.Create;
  sLog.Append(DataSet.FieldByName('DES_LOG').asString);
  sLog.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss',Now) + ' manutenção feita por ' + uGlobais.sUsuario);
  Dataset.FieldByName('DES_LOG').AsString := sLog.Text;
  sLog.Free;
end;

procedure TfrmEstoqueInsumosTransportes.tbEstoqueQTD_ESTOQUEValidate(Sender: TField);
begin
  if tbEstoqueID_ESTOQUE.AsInteger = 0 then
  begin
    tbEstoqueVAL_TOTAL.AsFloat := tbEstoqueVAL_UNITARIO.AsFloat * tbEstoqueQTD_ESTOQUE.AsFloat
  end;
end;

procedure TfrmEstoqueInsumosTransportes.tbEstoqueVAL_UNITARIOValidate(Sender: TField);
begin
  if tbEstoqueID_ESTOQUE.AsInteger = 0 then
  begin
    tbEstoqueVAL_TOTAL.AsFloat := tbEstoqueVAL_UNITARIO.AsFloat * tbEstoqueQTD_ESTOQUE.AsFloat
  end;
end;

end.
