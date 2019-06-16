unit ufrmInsumosTransporte;

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
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxLabel, Model.InsumosTransportes, DAO.InsumosTransportes, dxSkinscxPCPainter,
  dxLayoutContainer, dxLayoutControl, Data.DB, dxmdaset, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxMaskEdit,
  cxTextEdit, cxBlobEdit, cxDropDownEdit, System.Actions, Vcl.ActnList, Generics.Collections, dxSkinsdxBarPainter, dxBar,
  cxGridExportLink, ShellAPI;

type
  TfrmInsumosTransporte = class(TForm)
    cxLabel27: TcxLabel;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    tbInsumos: TdxMemData;
    tbInsumosID_INSUMO: TIntegerField;
    tbInsumosDES_INSUMO: TStringField;
    tbInsumosDES_UNIDADE: TStringField;
    tbInsumosDES_LOG: TMemoField;
    dsInsumo: TDataSource;
    tvInsumos: TcxGridDBTableView;
    lvInsumos: TcxGridLevel;
    grdInsumos: TcxGrid;
    dxLayoutControl1Item1: TdxLayoutItem;
    tvInsumosID_INSUMO: TcxGridDBColumn;
    tvInsumosDES_INSUMO: TcxGridDBColumn;
    tvInsumosDES_UNIDADE: TcxGridDBColumn;
    tvInsumosDES_LOG: TcxGridDBColumn;
    aclInsumos: TActionList;
    actIncluir: TAction;
    actEditar: TAction;
    actExcluir: TAction;
    actCancelar: TAction;
    actGravar: TAction;
    actExportar: TAction;
    actFechar: TAction;
    bmInsumos: TdxBarManager;
    bmInsumosBar1: TdxBar;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    dxBarButton6: TdxBarButton;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton7: TdxBarButton;
    SaveDialog: TSaveDialog;
    procedure actIncluirExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actFecharExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure dsInsumoStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actGravarExecute(Sender: TObject);
    procedure actExportarExecute(Sender: TObject);
  private
    { Private declarations }
    procedure ExcluirInsumo();
    procedure GravaInsumo();
    procedure SetupInsumo();
    procedure PopulaInsumos();
    procedure Exportar();
  public
    { Public declarations }
  end;

var
  frmInsumosTransporte: TfrmInsumosTransporte;
  insumo: TInsumosTransportes;
  insumos: TObjectList<TInsumosTransportes>;
  insumoDAO: TInsumosTransportesDAO;
implementation

{$R *.dfm}

uses udm, uGlobais, ufrmProcesso;

procedure TfrmInsumosTransporte.actCancelarExecute(Sender: TObject);
begin
  tbInsumos.Cancel;
end;

procedure TfrmInsumosTransporte.actEditarExecute(Sender: TObject);
begin
  tbInsumos.Edit;
  tvInsumosDES_INSUMO.FocusWithSelection;
end;

procedure TfrmInsumosTransporte.actExcluirExecute(Sender: TObject);
begin
  ExcluirInsumo();
end;

procedure TfrmInsumosTransporte.actExportarExecute(Sender: TObject);
begin
  Exportar()
end;

procedure TfrmInsumosTransporte.actFecharExecute(Sender: TObject);
begin
  Perform(WM_CLOSE, 0, 0);
end;

procedure TfrmInsumosTransporte.actGravarExecute(Sender: TObject);
begin
  GravaInsumo();
end;

procedure TfrmInsumosTransporte.actIncluirExecute(Sender: TObject);
begin
  tbInsumos.Insert;
  tbInsumosID_INSUMO.AsInteger := 0;
  tvInsumosDES_INSUMO.FocusWithSelection;
end;

procedure TfrmInsumosTransporte.dsInsumoStateChange(Sender: TObject);
begin
  if TDataSource(Sender).DataSet.State in [dsInsert] then
  begin
    actIncluir.Enabled := False;
    actEditar.Enabled := False;
    actExcluir.Enabled := False;
    actCancelar.Enabled := True;
    actGravar.Enabled := True;
    actExportar.Enabled := False;
    actFechar.Enabled := True;
  end
  else if TDataSource(Sender).DataSet.State in [dsEdit] then
  begin
    actIncluir.Enabled := False;
    actEditar.Enabled := False;
    actExcluir.Enabled := False;
    actCancelar.Enabled := True;
    actGravar.Enabled := True;
    actExportar.Enabled := False;
    actFechar.Enabled := True;
  end
  else if TDataSource(Sender).DataSet.State in [dsBrowse] then
  begin
    actIncluir.Enabled := True;
    actEditar.Enabled := True;
    actExcluir.Enabled := True;
    actCancelar.Enabled := False;
    actGravar.Enabled := False;
    actExportar.Enabled := True;
    actFechar.Enabled := True;
  end;

end;

procedure TfrmInsumosTransporte.ExcluirInsumo();
var
  sSQL : String;
begin
  try
    //VerificaConsumo();
    //VerificaEstoque();
    if Application.MessageBox('Confirma a exclusão deste registro ?', PChar('Atenção ' + uGlobais.sUsuario), MB_YESNO + MB_ICONQUESTION) = ID_NO then
    begin
      Exit;
    end;
    insumoDAO := TInsumosTransportesDAO.Create();
    sSQL := 'WHERE ID_INSUMO = ' + tbInsumosID_INSUMO.AsString;
    if  insumoDAO.Delete(sSQL) then
    begin
      tbInsumos.Delete;
    end;
  finally
    insumoDAO.Free;
  end;
end;

procedure TfrmInsumosTransporte.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tbInsumos.Close;
  Action := caFree;
  frmInsumosTransporte := Nil;
end;

procedure TfrmInsumosTransporte.FormShow(Sender: TObject);
begin
  PopulaInsumos();
  tvInsumosDES_LOG.Visible := (uGlobais.iNivelUsuario = 0);
end;

procedure TfrmInsumosTransporte.GravaInsumo();
var
  sLog : TStringList;
begin
  try
    if Application.MessageBox('Confirma gravar este registro ?', PChar('Atenção ' + uGlobais.sUsuario), MB_YESNO + MB_ICONQUESTION) = ID_NO then
    begin
      Exit;
    end;
    tbInsumos.Post;
    insumo := TInsumosTransportes.Create();
    insumoDAO := TInsumosTransportesDAO.Create();
    sLog := TStringList.Create();
    sLog.Text := tbInsumosDES_LOG.AsString;
    sLog.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now()) + ' manutenção feita por ' + uGlobais.sUsuario);
    tbInsumos.Edit;
    tbInsumosDES_LOG.AsString := sLog.Text;
    tbInsumos.Post;
    SetupInsumo();
    if insumo.ID = 0 then
    begin
      if not insumoDAO.Insert(insumo) then
      begin
        Application.MessageBox('Erro ao incluir o registro!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONERROR);
        Exit;
      end;
      tbInsumos.Edit;
      tbInsumosID_INSUMO.AsInteger := insumo.ID;
      tbInsumos.Post;
    end
    else
    begin
      if not insumoDAO.Update(insumo) then
      begin
        Application.MessageBox('Erro ao alterar o registro!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONERROR);
        Exit;
      end;
    end;
    Application.MessageBox('Registro gravado com sucesso!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONINFORMATION);
  finally
    insumoDAO.Free;
    insumo.Free;
    sLog.Free;
  end;
end;

procedure TfrmInsumosTransporte.SetupInsumo();
begin
  insumo.ID := tbInsumosID_INSUMO.AsInteger;
  insumo.Descricao := tbInsumosDES_INSUMO.AsString;
  insumo.Unidade := tbInsumosDES_UNIDADE.AsString;
  insumo.Log := tbInsumosDES_LOG.AsString;
end;

procedure TfrmInsumosTransporte.PopulaInsumos();
var
  iRecords: Integer;
  iContador: Integer;
  insumoTmp : TInsumosTransportes;
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
    frmProcesso.cxGroupBox1.Caption := 'Gerando a grade. Aguarde...';
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
    if not tbInsumos.IsEmpty then
    begin
      tbInsumos.First;
    end;
  finally
    FreeAndNil(frmProcesso);
    insumoDAO.Free;
    tvInsumosDES_INSUMO.FocusWithSelection;
  end;
end;

procedure TfrmInsumosTransporte.Exportar();
var
  FileExt, sFile: String;
begin
  if not tbInsumos.Active then
  begin
    Exit;
  end;
  if tbInsumos.IsEmpty then
  begin
    Exit;
  end;
  try
    tvInsumosDES_LOG.Visible := False;
    sFile := 'transporte_';
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
        ExportGridToExcel(SaveDialog.FileName, grdInsumos, False, True, False)
      else if FileExt = '.xml' then
        ExportGridToXML(SaveDialog.FileName, grdInsumos, False)
      else if FileExt = '.txt' then
        ExportGridToText(SaveDialog.FileName, grdInsumos, False)
      else if FileExt = '.html' then
        ExportGridToHTML(SaveDialog.FileName, grdInsumos, False);
      ShellExecute(Handle, 'open', pchar(SaveDialog.FileName), nil, nil, SW_SHOW);
    end;
  finally
    tvInsumosDES_LOG.Visible := True;
  end;

end;


end.
