unit ufrmItensManutencao;

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
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxLabel, Model.ItensManutencao, DAO.ItensManutencao, dxSkinscxPCPainter,
  dxLayoutContainer, dxLayoutControl, Data.DB, dxmdaset, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxMaskEdit,
  cxTextEdit, cxBlobEdit, cxDropDownEdit, System.Actions, Vcl.ActnList, Generics.Collections, dxSkinsdxBarPainter, dxBar,
  cxGridExportLink, ShellAPI, cxDBLookupComboBox, DAO.InsumosTransportes, Model.InsumosTransportes;

type
  TfrmItensManutencao = class(TForm)
    cxLabel27: TcxLabel;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    tbItens: TdxMemData;
    dsItens: TDataSource;
    tvitens: TcxGridDBTableView;
    lvItens: TcxGridLevel;
    grdItens: TcxGrid;
    dxLayoutControl1Item1: TdxLayoutItem;
    aclItens: TActionList;
    actIncluir: TAction;
    actEditar: TAction;
    actExcluir: TAction;
    actCancelar: TAction;
    actGravar: TAction;
    actExportar: TAction;
    actFechar: TAction;
    bmIntens: TdxBarManager;
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
    tbItensID_ITEM: TIntegerField;
    tbItensDES_ITEM: TStringField;
    tbItensID_INSUMO: TIntegerField;
    tbItensDES_LOG: TMemoField;
    tvitensID_ITEM: TcxGridDBColumn;
    tvitensDES_ITEM: TcxGridDBColumn;
    tvitensID_INSUMO: TcxGridDBColumn;
    tvitensDES_LOG: TcxGridDBColumn;
    tbInsumos: TdxMemData;
    tbInsumosID_INSUMO: TIntegerField;
    tbInsumosDES_INSUMO: TStringField;
    tbInsumosDES_UNIDADE: TStringField;
    tbInsumosDES_LOG: TMemoField;
    dsInsumo: TDataSource;
    procedure actIncluirExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actFecharExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure dsItensStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actGravarExecute(Sender: TObject);
    procedure actExportarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure ExcluirInsumo();
    procedure GravaInsumo();
    procedure SetupItens();
    procedure PopulaInsumos();
    procedure PopulaItens();
    procedure Exportar();
  public
    { Public declarations }
  end;

var
  frmItensManutencao: TfrmItensManutencao;
  item: TItensManutencao;
  itens: TObjectList<TItensManutencao>;
  itemDAO: TItensManutencaoDAO;
  insumo: TInsumosTransportes;
  insumos: TObjectList<TInsumosTransportes>;
  insumoDAO: TInsumosTransportesDAO;

implementation

{$R *.dfm}

uses udm, uGlobais, ufrmProcesso;

procedure TfrmItensManutencao.actCancelarExecute(Sender: TObject);
begin
  tbItens.Cancel;
end;

procedure TfrmItensManutencao.actEditarExecute(Sender: TObject);
begin
  tbItens.Edit;
  tvitensDES_ITEM.FocusWithSelection;
end;

procedure TfrmItensManutencao.actExcluirExecute(Sender: TObject);
begin
  ExcluirInsumo();
end;

procedure TfrmItensManutencao.actExportarExecute(Sender: TObject);
begin
  Exportar()
end;

procedure TfrmItensManutencao.actFecharExecute(Sender: TObject);
begin
  Perform(WM_CLOSE, 0, 0);
end;

procedure TfrmItensManutencao.actGravarExecute(Sender: TObject);
begin
  GravaInsumo();
end;

procedure TfrmItensManutencao.actIncluirExecute(Sender: TObject);
begin
  tbItens.Insert;
  tbItensID_ITEM.AsInteger := 0;
  tbItensID_INSUMO.AsInteger := 0;
  tvitensDES_ITEM.FocusWithSelection;
end;

procedure TfrmItensManutencao.dsItensStateChange(Sender: TObject);
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

procedure TfrmItensManutencao.ExcluirInsumo();
var
  sSQL : String;
begin
  try
    //Verificamanutencao();
    if Application.MessageBox('Confirma a exclusão deste registro ?', PChar('Atenção ' + uGlobais.sUsuario), MB_YESNO + MB_ICONQUESTION) = ID_NO then
    begin
      Exit;
    end;
    itemDAO := TItensManutencaoDAO.Create();
    sSQL := 'WHERE ID_ITEM = ' + tbItensID_ITEM.AsString;
    if  itemDAO.Delete(sSQL) then
    begin
      tbItens.Delete;
    end;
  finally
    itemDAO.Free;
  end;
end;

procedure TfrmItensManutencao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tbItens.Close;
  tbInsumos.Close;
  Action := caFree;
  frmItensManutencao := Nil;
end;

procedure TfrmItensManutencao.FormCreate(Sender: TObject);
begin
  PopulaInsumos();
  PopulaItens();
end;

procedure TfrmItensManutencao.FormShow(Sender: TObject);
begin
  PopulaInsumos();
  tvitensDES_LOG.Visible := (uGlobais.iNivelUsuario = 0);
end;

procedure TfrmItensManutencao.GravaInsumo();
var
  sLog : TStringList;
begin
  try
    if Application.MessageBox('Confirma gravar este registro ?', PChar('Atenção ' + uGlobais.sUsuario), MB_YESNO + MB_ICONQUESTION) = ID_NO then
    begin
      Exit;
    end;
    tbItens.Post;
    item := TItensManutencao.Create();
    itemDAO := TItensManutencaoDAO.Create();
    sLog := TStringList.Create();
    sLog.Text := tbItensDES_LOG.AsString;
    sLog.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now()) + ' manutenção feita por ' + uGlobais.sUsuario);
    tbItens.Edit;
    tbItensDES_LOG.AsString := sLog.Text;
    tbItens.Post;
    SetupItens();
    if item.ID = 0 then
    begin
      if not itemDAO.Insert(item) then
      begin
        Application.MessageBox('Erro ao incluir o registro!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONERROR);
        Exit;
      end;
      tbItens.Edit;
      tbItensID_ITEM.AsInteger := item.ID;
      tbItens.Post;
    end
    else
    begin
      if not itemDAO.Update(item) then
      begin
        Application.MessageBox('Erro ao alterar o registro!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONERROR);
        Exit;
      end;
    end;
    Application.MessageBox('Registro gravado com sucesso!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONINFORMATION);
  finally
    itemDAO.Free;
    item.Free;
    sLog.Free;
  end;
end;

procedure TfrmItensManutencao.SetupItens();
begin
  item.ID := tbItensID_ITEM.AsInteger;
  item.Descricao := tbItensDES_ITEM.AsString;
  item.Insumo := tbItensID_INSUMO.AsInteger;
  Item.Log := tbItensDES_LOG.AsString;
end;

procedure TfrmItensManutencao.PopulaInsumos();
var
  insumoTmp : TInsumosTransportes;
begin
  try
    tbInsumos.Close;
    tbInsumos.Open;
    tbInsumos.Insert;
    tbInsumosID_INSUMO.AsInteger := 0;
    tbInsumosDES_INSUMO.AsString := 'NENHUM INSUMO RELACIONADO';
    tbInsumosDES_UNIDADE.AsString := 'NONE';
    tbInsumosDES_LOG.AsString := '';
    tbInsumos.Post;
    insumoDAO := TInsumosTransportesDAO.Create();
    insumos := insumoDAO.FindInsumo('');
    for insumoTmp in insumos do
    begin
      tbInsumos.Insert;
      tbInsumosID_INSUMO.AsInteger := insumoTmp.ID;
      tbInsumosDES_INSUMO.AsString := insumoTmp.Descricao;
      tbInsumosDES_UNIDADE.AsString := insumoTmp.Unidade;
      tbInsumosDES_LOG.AsString := insumoTmp.Log;
      tbInsumos.Post;
    end;
  finally
    insumoDAO.Free;
  end;
end;

procedure TfrmItensManutencao.PopulaItens();
var
  iRecords: Integer;
  iContador: Integer;
  itemTmp : TItensManutencao;
begin
  try
    tbInsumos.Close;
    if not Assigned(frmProcesso) then
    begin
      frmProcesso := TfrmProcesso.Create(Application);
    end;
    tbItens.Open;
    itemDAO := TItensManutencaoDAO.Create();
    itens := itemDAO.FindItem('');
    iRecords := insumos.Count ;
    iContador := 0;
    frmProcesso.cxGroupBox1.Caption := 'Gerando a grade. Aguarde...';
    frmProcesso.cxGroupBox1.Refresh;
    frmProcesso.cxProgressBar1.Position := 0;
    frmProcesso.Show;
    for itemTmp in itens do
    begin
      tbItens.Insert;
      tbItensID_ITEM.AsInteger := itemTmp.ID;
      tbItensDES_ITEM.AsString := itemTmp.Descricao;
      tbItensID_INSUMO.AsInteger := itemTmp.Insumo;
      tbItensDES_LOG.AsString := itemTmp.Log;
      dPosicao := (iContador / iRecords) * 100;
      Inc(iContador,1);
      frmProcesso.cxProgressBar1.Position := dPosicao;
      frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
      frmProcesso.cxProgressBar1.Refresh;
      tbItens.Post;
    end;
    if not tbItens.IsEmpty then
    begin
      tbItens.First;
    end;
  finally
    FreeAndNil(frmProcesso);
    itemDAO.Free;
    tvitensDES_ITEM.FocusWithSelection;
  end;
end;

procedure TfrmItensManutencao.Exportar();
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
    tvitensDES_LOG.Visible := False;
    sFile := 'itensmanutencao_';
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
        ExportGridToExcel(SaveDialog.FileName, grdItens, False, True, False)
      else if FileExt = '.xml' then
        ExportGridToXML(SaveDialog.FileName, grdItens, False)
      else if FileExt = '.txt' then
        ExportGridToText(SaveDialog.FileName, grdItens, False)
      else if FileExt = '.html' then
        ExportGridToHTML(SaveDialog.FileName, grdItens, False);
      ShellExecute(Handle, 'open', pchar(SaveDialog.FileName), nil, nil, SW_SHOW);
    end;
  finally
    tvitensDES_LOG.Visible := True;
  end;

end;


end.
