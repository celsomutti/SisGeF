unit ufrmVerbasExpressas;

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
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxMaskEdit, cxCalendar, cxTextEdit, cxCurrencyEdit, cxCheckBox,
  cxBlobEdit, Model.VerbaFixa, DAO.VerbaFixa, Generics.Collections, cxGridExportLink, ShellAPI, cxSpinEdit, Model.VerbaCEP,
  DAO.VerbaCEP, Model.PenalizacaoAtrasos, DAO.PenalizacaoAtrasos, Model.TabelasDistribuicao, DAO.TabelaDistribuicao, cxImageComboBox,
  clCodigosEntregadores, clAgentes, cxButtonEdit, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmVerbasExpressas = class(TForm)
    cxLabel27: TcxLabel;
    lcgRoot: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    tbVerbaFixa: TdxMemData;
    tbVerbaFixaID_VERBA_FIXA: TIntegerField;
    tbVerbaFixaDAT_VERBA_FIXA: TDateField;
    tbVerbaFixaDES_VERBA_FIXA: TWideStringField;
    tbVerbaFixaVAL_VERBA_FIXA: TFloatField;
    tbVerbaFixaDOM_ATIVO: TIntegerField;
    tbVerbaFixaDES_LOG: TWideMemoField;
    dsVerbaFixa: TDataSource;
    tvVerbaFixa: TcxGridDBTableView;
    lvVerbaFixa: TcxGridLevel;
    grdVerbaFixa: TcxGrid;
    lciVerbaFixa: TdxLayoutItem;
    tvVerbaFixaRecId: TcxGridDBColumn;
    tvVerbaFixaID_VERBA_FIXA: TcxGridDBColumn;
    tvVerbaFixaDAT_VERBA_FIXA: TcxGridDBColumn;
    tvVerbaFixaDES_VERBA_FIXA: TcxGridDBColumn;
    tvVerbaFixaVAL_VERBA_FIXA: TcxGridDBColumn;
    tvVerbaFixaDOM_ATIVO: TcxGridDBColumn;
    tvVerbaFixaDES_LOG: TcxGridDBColumn;
    tbVerbaFixaID_GRUPO: TIntegerField;
    tvVerbaFixaID_GRUPO: TcxGridDBColumn;
    lcgVerbaFixa: TdxLayoutGroup;
    tvVerbaCEP: TcxGridDBTableView;
    lvVerbaCEP: TcxGridLevel;
    grdVerbaCEP: TcxGrid;
    lciVerbaCEP: TdxLayoutItem;
    lcgVerbaCEP: TdxLayoutGroup;
    tbVerbaCEP: TdxMemData;
    tbVerbaCEPID_VERBA: TIntegerField;
    tbVerbaCEPNUM_CEP_INICIAL: TWideStringField;
    tbVerbaCEPNUM_CEP_FINAL: TWideStringField;
    tbVerbaCEPVAL_VERBA: TFloatField;
    tbVerbaCEPCOD_GRUPO: TIntegerField;
    tbVerbaCEPID_FAIXA: TIntegerField;
    tbVerbaCEPDES_LOG: TWideMemoField;
    dsVerbaCEP: TDataSource;
    tvVerbaCEPRecId: TcxGridDBColumn;
    tvVerbaCEPID_VERBA: TcxGridDBColumn;
    tvVerbaCEPNUM_CEP_INICIAL: TcxGridDBColumn;
    tvVerbaCEPNUM_CEP_FINAL: TcxGridDBColumn;
    tvVerbaCEPVAL_VERBA: TcxGridDBColumn;
    tvVerbaCEPCOD_GRUPO: TcxGridDBColumn;
    tvVerbaCEPID_FAIXA: TcxGridDBColumn;
    tvVerbaCEPDES_LOG: TcxGridDBColumn;
    tbPenalizacao: TdxMemData;
    tbPenalizacaoID_PENALIZACAO: TIntegerField;
    tbPenalizacaoDAT_PENALIZACAO: TDateField;
    tbPenalizacaoQTD_DIAS_ATRASO: TIntegerField;
    tbPenalizacaoVAL_PENALIZACAO: TFloatField;
    tbPenalizacaoPER_PENALIZACAO: TFloatField;
    tbPenalizacaoDES_LOG: TMemoField;
    dsPenalizacao: TDataSource;
    tvPenalizacoes: TcxGridDBTableView;
    lvPenalizacoes: TcxGridLevel;
    grdPenalizacoes: TcxGrid;
    lciPenalizacoes: TdxLayoutItem;
    dxLayoutControl1Group1: TdxLayoutAutoCreatedGroup;
    lcgPenalizacoes: TdxLayoutGroup;
    tvPenalizacoesRecId: TcxGridDBColumn;
    tvPenalizacoesID_PENALIZACAO: TcxGridDBColumn;
    tvPenalizacoesDAT_PENALIZACAO: TcxGridDBColumn;
    tvPenalizacoesQTD_DIAS_ATRASO: TcxGridDBColumn;
    tvPenalizacoesVAL_PENALIZACAO: TcxGridDBColumn;
    tvPenalizacoesPER_PENALIZACAO: TcxGridDBColumn;
    tvPenalizacoesDES_LOG: TcxGridDBColumn;
    tbTabelaDistribuicao: TdxMemData;
    tbTabelaDistribuicaoID_TABELA: TIntegerField;
    tbTabelaDistribuicaoDAT_TABELA: TDateField;
    tbTabelaDistribuicaoCOD_TABELA: TIntegerField;
    tbTabelaDistribuicaoCOD_GRUPO: TIntegerField;
    tbTabelaDistribuicaoCOD_TIPO: TIntegerField;
    tbTabelaDistribuicaoCOD_ENTREGADOR: TIntegerField;
    tbTabelaDistribuicaoNOM_ENTREGADOR: TStringField;
    tbTabelaDistribuicaoDES_LOG: TMemoField;
    tvTabelaDistribuicao: TcxGridDBTableView;
    lvTabelaDistribuicao: TcxGridLevel;
    grdTabelaDistribuicao: TcxGrid;
    lciTabelaDistribuicao: TdxLayoutItem;
    lcgTabelaDistribuicao: TdxLayoutGroup;
    dxLayoutControl1Group2: TdxLayoutAutoCreatedGroup;
    dsTabelaDistribuicao: TDataSource;
    tvTabelaDistribuicaoRecId: TcxGridDBColumn;
    tvTabelaDistribuicaoID_TABELA: TcxGridDBColumn;
    tvTabelaDistribuicaoDAT_TABELA: TcxGridDBColumn;
    tvTabelaDistribuicaoCOD_TABELA: TcxGridDBColumn;
    tvTabelaDistribuicaoCOD_GRUPO: TcxGridDBColumn;
    tvTabelaDistribuicaoCOD_TIPO: TcxGridDBColumn;
    tvTabelaDistribuicaoCOD_ENTREGADOR: TcxGridDBColumn;
    tvTabelaDistribuicaoNOM_ENTREGADOR: TcxGridDBColumn;
    tvTabelaDistribuicaoDES_LOG: TcxGridDBColumn;
    procedure tbVerbaFixaBeforeDelete(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure tbVerbaFixaAfterInsert(DataSet: TDataSet);
    procedure tbVerbaFixaBeforePost(DataSet: TDataSet);
    procedure tbVerbaFixaAfterPost(DataSet: TDataSet);
    procedure tbVerbaCEPAfterInsert(DataSet: TDataSet);
    procedure tbVerbaCEPAfterPost(DataSet: TDataSet);
    procedure tbVerbaCEPBeforeDelete(DataSet: TDataSet);
    procedure tbVerbaCEPBeforePost(DataSet: TDataSet);
    procedure tbPenalizacaoAfterInsert(DataSet: TDataSet);
    procedure tbPenalizacaoAfterPost(DataSet: TDataSet);
    procedure tbPenalizacaoBeforeDelete(DataSet: TDataSet);
    procedure tbPenalizacaoBeforePost(DataSet: TDataSet);
    procedure tbTabelaDistribuicaoAfterInsert(DataSet: TDataSet);
    procedure tbTabelaDistribuicaoAfterPost(DataSet: TDataSet);
    procedure tbTabelaDistribuicaoBeforeDelete(DataSet: TDataSet);
    procedure tbTabelaDistribuicaoBeforePost(DataSet: TDataSet);
    procedure tbTabelaDistribuicaoCOD_ENTREGADORValidate(Sender: TField);
    procedure tvTabelaDistribuicaoCOD_ENTREGADORPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
  private
    { Private declarations }
    procedure PopulaVerbasFixas();
    procedure ExcluirVervaFixa();
    procedure SetupVerbaFixa();
    procedure PopulaVerbasCEP();
    procedure ExcluirVerbaCEP();
    procedure SetupVerbaCEP();
    procedure PopulaPenalizacoes();
    procedure SetupPenalizacoes();
    procedure ExcluirPenalizacao();
    procedure PopulaTabelas();
    procedure ExcluirTabelas();
    procedure SetupTabelas();
    procedure FindEntregador();
    procedure SearchDistribuidor();
    procedure SearchEntregadores();
  public
    { Public declarations }
  end;

var
  frmVerbasExpressas: TfrmVerbasExpressas;
  verbafixa : TVerbaFixa;
  verbafixaDAO : TVerbaFixaDAO;
  verbasfixa : TObjectList<TVerbaFixa>;
  verbacep : TVerbaCEP;
  verbacepDAO : TVerbaCEPDAO;
  verbascep : TObjectList<TVerbacep>;
  pena : TPenalizacaoAtrasos;
  penaDAO : TPenalizacaoAtrasosDAO;
  penas : TObjectList<TPenalizacaoAtrasos>;
  tabela : TTabelasDistribuicao;
  tabelaDAO : TTabelaDistribuicaoDAO;
  tabelas : TObjectList<TTabelasDistribuicao>;

implementation

{$R *.dfm}

uses udm, uGlobais, ufrmProcesso, ufrmPesquisarPessoas;

procedure TfrmVerbasExpressas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tbVerbaFixa.Close;
  tbVerbaCEP.Close;
  Action := caFree;
  frmVerbasExpressas := Nil;
end;

procedure TfrmVerbasExpressas.FormCreate(Sender: TObject);
begin
  PopulaVerbasFixas();
  PopulaVerbasCEP();
  PopulaPenalizacoes();
  PopulaTabelas();
end;

procedure TfrmVerbasExpressas.PopulaVerbasFixas();
var
  verbaTmp : TVerbaFixa;
  dPosicao: Double;
  iContador: Integer;
  iRecords: Integer;
begin
  try
    if not Assigned(frmProcesso) then
    begin
      frmProcesso := TfrmProcesso.Create(Application);
    end;
    dPosicao := 0;
    tbVerbaFixa.IsLoading := True;
    frmProcesso.cxGroupBox1.Caption := 'Populando Verbas Fixas. Aguarde...';
    frmProcesso.cxGroupBox1.Refresh;
    frmProcesso.cxProgressBar1.Position := 0;
    frmProcesso.Show;
    tbVerbaFixa.Close;
    tbVerbaFixa.Open;
    verbafixaDAO := TVerbaFixaDAO.Create();
    verbasfixa := verbafixaDAO.FindVerba('');
    for verbaTmp in verbasfixa do
    begin
      tbVerbaFixa.Insert;
      tbVerbaFixaID_VERBA_FIXA.AsInteger := verbaTmp.ID;
      tbVerbaFixaID_GRUPO.AsInteger := verbaTmp.Grupo;
      tbVerbaFixaDAT_VERBA_FIXA.AsDateTime := verbaTmp.Data;
      tbVerbaFixaDES_VERBA_FIXA.AsString := verbaTmp.Descricao;
      tbVerbaFixaVAL_VERBA_FIXA.AsFloat := verbaTmp.Valor;
      tbVerbaFixaDOM_ATIVO.AsInteger :=verbaTmp.Ativo;
      tbVerbaFixaDES_LOG.AsString :=verbaTmp.Log;
      tbVerbaFixa.Post;
      dPosicao := (iContador / iRecords) * 100;
      Inc(iContador,1);
      frmProcesso.cxProgressBar1.Position := dPosicao;
      frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
      frmProcesso.cxProgressBar1.Refresh;
    end;
    if not tbVerbaFixa.IsEmpty then
    begin
      tbVerbaFixa.First;
    end;
  finally
    verbafixaDAO.Free;
    tbVerbaFixa.IsLoading := False;
    frmProcesso.Close;
    FreeAndNil(frmProcesso);
  end;
end;

procedure TfrmVerbasExpressas.tbPenalizacaoAfterInsert(DataSet: TDataSet);
begin
  if not tbPenalizacao.IsLoading then
  begin
    tbPenalizacaoID_PENALIZACAO.AsInteger := 0;
    tvPenalizacoesDAT_PENALIZACAO.FocusWithSelection;
  end;
end;

procedure TfrmVerbasExpressas.tbPenalizacaoAfterPost(DataSet: TDataSet);
begin
  if tbPenalizacao.IsLoading then
  begin
    Exit;
  end;
  try
    pena := TPenalizacaoAtrasos.Create();
    penaDAO := TPenalizacaoAtrasosDAO.Create();
    SetupPenalizacoes();
    if pena.ID = 0 then
    begin
      if not penaDAO.Insert(pena) then
      begin
        Application.MessageBox('Erro ao gravar dados!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONERROR);
      end;
    end
    else
    begin
      if not penaDAO.Update(pena) then
      begin
        Application.MessageBox('Erro ao gravar dados!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONERROR);
      end;
    end;
    Application.MessageBox('Dados gravados com sucesso!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONINFORMATION);
  finally
    if tbPenalizacaoID_PENALIZACAO.AsInteger = 0 then
    begin
      tbPenalizacao.IsLoading := True;
      tbPenalizacao.Edit;
      tbPenalizacaoID_PENALIZACAO.AsInteger := pena.ID;
      tbPenalizacao.Post;
      tbPenalizacao.IsLoading := False;
    end;
    pena.Free;
    penaDAO.Free;
  end;
end;

procedure TfrmVerbasExpressas.tbPenalizacaoBeforeDelete(DataSet: TDataSet);
begin
  ExcluirPenalizacao();
end;

procedure TfrmVerbasExpressas.tbPenalizacaoBeforePost(DataSet: TDataSet);
var
  sLog : TStringList;
  sMensagem : String;
begin
  if Application.MessageBox('Confirma gravar os dados?', PChar('Atenção ' + uGlobais.sUsuario), MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Abort;
    Exit;
  end;
  if DataSet.FieldByName('ID_PENALIZACAO').AsInteger = 0 then
  begin
    sMensagem := ' inclusão feita por ';
  end
  else
  begin
    sMensagem := ' alteração feita por ';
  end;
  sLog := TStringList.Create;
  sLog.Append(DataSet.FieldByName('DES_LOG').asString);
  sLog.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss',Now) + sMensagem + uGlobais.sUsuario);
  Dataset.FieldByName('DES_LOG').AsString := sLog.Text;
  sLog.Free;
end;

procedure TfrmVerbasExpressas.tbTabelaDistribuicaoAfterInsert(DataSet: TDataSet);
begin
  if not tbTabelaDistribuicao.IsLoading then
  begin
    tbTabelaDistribuicaoID_TABELA.AsInteger := 0;
    tbTabelaDistribuicaoCOD_TABELA.AsInteger := 1;
    tbTabelaDistribuicaoCOD_GRUPO.AsInteger := 0;
    tbTabelaDistribuicaoCOD_TIPO.AsInteger := 1;
    tvTabelaDistribuicaoDAT_TABELA.FocusWithSelection;
  end;
end;

procedure TfrmVerbasExpressas.tbTabelaDistribuicaoAfterPost(DataSet: TDataSet);
begin
  if tbTabelaDistribuicao.IsLoading then
  begin
    Exit;
  end;
  try
    tabela := TTabelasDistribuicao.Create();
    tabelaDAO := TTabelaDistribuicaoDAO.Create();
    SetupTabelas();
    if tabela.ID = 0 then
    begin
      if not tabelaDAO.Insert(tabela) then
      begin
        Application.MessageBox('Erro ao gravar dados!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONERROR);
      end;
    end
    else
    begin
      if not tabelaDAO.Update(tabela) then
      begin
        Application.MessageBox('Erro ao gravar dados!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONERROR);
      end;
    end;
    Application.MessageBox('Dados gravados com sucesso!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONINFORMATION);
  finally
    if tbTabelaDistribuicaoID_TABELA.AsInteger = 0 then
    begin
      tbTabelaDistribuicao.IsLoading := True;
      tbTabelaDistribuicao.Edit;
      tbTabelaDistribuicaoID_TABELA.AsInteger := tabela.ID;
      tbTabelaDistribuicao.Post;
      tbTabelaDistribuicao.IsLoading := False;
    end;
    tabela.Free;
    tabelaDAO.Free;
  end;
end;

procedure TfrmVerbasExpressas.tbTabelaDistribuicaoBeforeDelete(DataSet: TDataSet);
begin
  ExcluirTabelas();
end;

procedure TfrmVerbasExpressas.tbTabelaDistribuicaoBeforePost(DataSet: TDataSet);
var
  sLog : TStringList;
  sMensagem : String;
begin
  if Application.MessageBox('Confirma gravar os dados?', PChar('Atenção ' + uGlobais.sUsuario), MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Abort;
    Exit;
  end;
  if DataSet.FieldByName('ID_TABELA').AsInteger = 0 then
  begin
    sMensagem := ' inclusão feita por ';
  end
  else
  begin
    sMensagem := ' alteração feita por ';
  end;
  sLog := TStringList.Create;
  sLog.Append(DataSet.FieldByName('DES_LOG').asString);
  sLog.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss',Now) + sMensagem + uGlobais.sUsuario);
  Dataset.FieldByName('DES_LOG').AsString := sLog.Text;
  sLog.Free;
end;

procedure TfrmVerbasExpressas.tbTabelaDistribuicaoCOD_ENTREGADORValidate(Sender: TField);
begin
  FindEntregador();
end;

procedure TfrmVerbasExpressas.tbVerbaCEPAfterInsert(DataSet: TDataSet);
begin
  if not tbVerbaCEP.IsLoading then
  begin
    tbVerbaCEPID_VERBA.AsInteger := 0;
    tbVerbaCEPCOD_GRUPO.AsInteger := 0;
    tbVerbaCEPID_FAIXA.AsInteger := 1;
    tvVerbaCEPNUM_CEP_INICIAL.FocusWithSelection;
  end;
end;

procedure TfrmVerbasExpressas.tbVerbaCEPAfterPost(DataSet: TDataSet);
begin
  if tbVerbaCEP.IsLoading then
  begin
    Exit;
  end;
  try
    verbacep := TVerbaCEP.Create();
    verbacepDAO := TVerbaCEPDAO.Create();
    SetupVerbaCEP();
    if verbacep.ID = 0 then
    begin
      if not verbacepDAO.Insert(verbacep) then
      begin
        Application.MessageBox('Erro ao gravar dados!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONERROR);
      end;
    end
    else
    begin
      if not verbacepDAO.Update(verbacep) then
      begin
        Application.MessageBox('Erro ao gravar dados!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONERROR);
      end;
    end;
    Application.MessageBox('Dados gravados com sucesso!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONINFORMATION);
  finally
    if tbVerbaCEPID_VERBA.AsInteger = 0 then
    begin
      tbVerbaCEP.IsLoading := True;
      tbVerbaCEP.Edit;
      tbVerbaCEPID_VERBA.AsInteger := verbacep.ID;
      tbVerbaCEP.Post;
      tbVerbaCEP.IsLoading := False;
    end;
    verbacep.Free;
    verbacepDAO.Free;
  end;
end;

procedure TfrmVerbasExpressas.tbVerbaCEPBeforeDelete(DataSet: TDataSet);
begin
  ExcluirVerbaCEP();
end;

procedure TfrmVerbasExpressas.tbVerbaCEPBeforePost(DataSet: TDataSet);
var
  sLog : TStringList;
  sMensagem : String;
begin
  if Application.MessageBox('Confirma gravar os dados?', PChar('Atenção ' + uGlobais.sUsuario), MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Abort;
    Exit;
  end;
  if DataSet.FieldByName('ID_VERBA').AsInteger = 0 then
  begin
    sMensagem := ' inclusão feita por ';
  end
  else
  begin
    sMensagem := ' alteração feita por ';
  end;
  sLog := TStringList.Create;
  sLog.Append(DataSet.FieldByName('DES_LOG').asString);
  sLog.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss',Now) + sMensagem + uGlobais.sUsuario);
  Dataset.FieldByName('DES_LOG').AsString := sLog.Text;
  sLog.Free;
end;

procedure TfrmVerbasExpressas.tbVerbaFixaAfterInsert(DataSet: TDataSet);
begin
  if not tbVerbaFixa.IsLoading then
  begin
    tbVerbaFixaID_VERBA_FIXA.AsInteger := 0;
    tbVerbaFixaID_GRUPO.AsInteger := 0;
    tbVerbaFixaDOM_ATIVO.AsInteger := 1;
    tvVerbaFixaID_GRUPO.FocusWithSelection;
  end;
end;

procedure TfrmVerbasExpressas.tbVerbaFixaAfterPost(DataSet: TDataSet);
begin
  if tbVerbaFixa.IsLoading then
  begin
    Exit;
  end;
  try
    verbafixa := TVerbaFixa.Create();
    verbafixaDAO := TVerbaFixaDAO.Create();
    SetupVerbaFixa();
    if verbafixa.ID = 0 then
    begin
      if not verbafixaDAO.Insert(verbafixa) then
      begin
        Application.MessageBox('Erro ao gravar dados!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONERROR);
      end;
    end
    else
    begin
      if not verbafixaDAO.Update(verbafixa) then
      begin
        Application.MessageBox('Erro ao gravar dados!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONERROR);
      end;
    end;
    Application.MessageBox('Dados gravados com sucesso!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONINFORMATION);
  finally
    if tbVerbaFixaID_VERBA_FIXA.AsInteger = 0 then
    begin
      tbVerbaFixa.IsLoading := True;
      tbVerbaFixa.Edit;
      tbVerbaFixaID_VERBA_FIXA.AsInteger := verbafixa.ID;
      tbVerbaFixa.Post;
      tbVerbaFixa.IsLoading := False;
    end;
    verbafixa.Free;
    verbafixaDAO.Free;
  end;
end;

procedure TfrmVerbasExpressas.tbVerbaFixaBeforeDelete(DataSet: TDataSet);
begin
  ExcluirVervaFixa();
end;

procedure TfrmVerbasExpressas.tbVerbaFixaBeforePost(DataSet: TDataSet);
var
  sLog : TStringList;
  sMensagem : String;
begin
  if Application.MessageBox('Confirma gravar os dados?', PChar('Atenção ' + uGlobais.sUsuario), MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Abort;
    Exit;
  end;
  if DataSet.FieldByName('ID_VERBA_FIXA').AsInteger = 0 then
  begin
    sMensagem := ' inclusão feita por ';
  end
  else
  begin
    sMensagem := ' alteração feita por ';
  end;
  sLog := TStringList.Create;
  sLog.Append(DataSet.FieldByName('DES_LOG').asString);
  sLog.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss',Now) + sMensagem + uGlobais.sUsuario);
  Dataset.FieldByName('DES_LOG').AsString := sLog.Text;
  sLog.Free;
end;

procedure TfrmVerbasExpressas.tvTabelaDistribuicaoCOD_ENTREGADORPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  if tbTabelaDistribuicaoCOD_TIPO.AsInteger = 1 then
  begin
    SearchDistribuidor();
  end
  else if tbTabelaDistribuicaoCOD_TIPO.AsInteger = 2 then
  begin
    SearchEntregadores();
  end;
end;

procedure TfrmVerbasExpressas.ExcluirVervaFixa();
var
  verbaDAO : TVerbaFixaDAO;
  sFiltro : String;
begin
  try
    verbaDAO := TVerbaFixaDAO.Create();
    if Application.MessageBox('Confirma a exclusão?', PChar('Atenção ' + uGlobais.sUsuario), MB_YESNO + MB_ICONQUESTION) = IDNO then
    begin
      Abort;
      Exit;
    end;
    sFiltro := 'WHERE ID_VERBA_FIXA = ' + tbVerbaFixaID_VERBA_FIXA.AsString;
    if not verbaDAO.Delete(sFiltro) then
    begin
      Application.MessageBox(PChar('Erro ao excluir a verba ID ' + tbVerbaFixaID_VERBA_FIXA.AsString + ' !'),
                             Pchar('Atenção ' + uglobais.sUsuario), MB_OK + MB_ICONERROR);
      Abort;
      Exit;
    end;
  finally
    verbaDAO.Free;
  end;
end;

procedure TfrmVerbasExpressas.SetupVerbaFixa();
begin
  verbafixa.ID := tbVerbaFixaID_VERBA_FIXA.AsInteger;
  verbafixa.Grupo := tbVerbaFixaID_GRUPO.AsInteger;
  verbafixa.Data := tbVerbaFixaDAT_VERBA_FIXA.AsDateTime;
  verbafixa.Descricao := tbVerbaFixaDES_VERBA_FIXA.AsString;
  verbafixa.Valor := tbVerbaFixaVAL_VERBA_FIXA.AsFloat;
  verbafixa.Ativo := tbVerbaFixaDOM_ATIVO.AsInteger;
  verbafixa.Log := tbVerbaFixaDES_LOG.AsString;
end;

procedure TfrmVerbasExpressas.ExcluirVerbaCEP();
var
  verbaDAO : TVerbaCEPDAO;
  sFiltro : String;
begin
  try
    verbaDAO := TVerbaCEPDAO.Create();
    if Application.MessageBox('Confirma a exclusão?', PChar('Atenção ' + uGlobais.sUsuario), MB_YESNO + MB_ICONQUESTION) = IDNO then
    begin
      Abort;
      Exit;
    end;
    sFiltro := 'WHERE ID_VERBA = ' + tbVerbaCEPID_VERBA.AsString;
    if not verbaDAO.Delete(sFiltro) then
    begin
      Application.MessageBox(PChar('Erro ao excluir a verba ID ' + tbVerbaCEPID_VERBA.AsString + ' !'),
                             Pchar('Atenção ' + uglobais.sUsuario), MB_OK + MB_ICONERROR);
      Abort;
      Exit;
    end;
  finally
    verbaDAO.Free;
  end;
end;

procedure TfrmVerbasExpressas.SetupVerbaCEP();
begin
  verbacep.ID := tbVerbaCEPID_VERBA.AsInteger;
  verbacep.CEPInicial := tbVerbaCEPNUM_CEP_INICIAL.AsString;
  verbacep.CEPFinal := tbVerbaCEPNUM_CEP_FINAL.AsString;
  verbacep.Verba := tbVerbaCEPVAL_VERBA.AsFloat;
  verbacep.Grupo := tbVerbaCEPCOD_GRUPO.AsInteger;
  verbacep.Faixa := tbVerbaCEPID_FAIXA.AsInteger;
  verbacep.Log := tbVerbaCEPDES_LOG.AsString;
end;

procedure TfrmVerbasExpressas.PopulaVerbasCEP();
var
  verbaTmp : TVerbaCEP;
  dPosicao: Double;
  iContador: Integer;
  iRecords: Integer;
begin
  try
    if not Assigned(frmProcesso) then
    begin
      frmProcesso := TfrmProcesso.Create(Application);
    end;
    dPosicao := 0;
    tbVerbaCEP.IsLoading := True;
    frmProcesso.cxGroupBox1.Caption := 'Populando Verbas por CEP. Aguarde...';
    frmProcesso.cxGroupBox1.Refresh;
    frmProcesso.cxProgressBar1.Position := 0;
    frmProcesso.Show;
    tbVerbaCEP.Close;
    tbVerbaCEP.Open;
    verbacepDAO := TVerbaCEPDAO.Create();
    verbascep := verbacepDAO.FindVerba('');
    for verbaTmp in verbascep do
    begin
      tbVerbaCEP.Insert;
      tbVerbaCEPID_VERBA.AsInteger := verbaTmp.ID;
      tbVerbaCEPNUM_CEP_INICIAL.AsString := verbaTmp.CEPInicial;
      tbVerbaCEPNUM_CEP_FINAL.AsString := verbaTmp.CEPFinal;
      tbVerbaCEPVAL_VERBA.AsFloat := verbaTmp.Verba;
      tbVerbaCEPCOD_GRUPO.AsInteger := verbaTmp.Grupo;
      tbVerbaCEPID_FAIXA.AsInteger :=verbaTmp.Faixa;
      tbVerbaCEPDES_LOG.AsString :=verbaTmp.Log;
      tbVerbaCEP.Post;
      dPosicao := (iContador / iRecords) * 100;
      Inc(iContador,1);
      frmProcesso.cxProgressBar1.Position := dPosicao;
      frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
      frmProcesso.cxProgressBar1.Refresh;
    end;
    if not tbVerbaCEP.IsEmpty then
    begin
      tbVerbaCEP.First;
    end;
  finally
    verbacepDAO.Free;
    tbVerbaCEP.IsLoading := False;
    frmProcesso.Close;
    FreeAndNil(frmProcesso);
  end;
end;

procedure TfrmVerbasExpressas.PopulaPenalizacoes();
var
  penaTmp : TPenalizacaoAtrasos;
  dPosicao: Double;
  iContador: Integer;
  iRecords: Integer;
begin
  try
    if not Assigned(frmProcesso) then
    begin
      frmProcesso := TfrmProcesso.Create(Application);
    end;
    dPosicao := 0;
    tbPenalizacao.IsLoading := True;
    frmProcesso.cxGroupBox1.Caption := 'Populando Penalizações por Atraso. Aguarde...';
    frmProcesso.cxGroupBox1.Refresh;
    frmProcesso.cxProgressBar1.Position := 0;
    frmProcesso.Show;
    tbPenalizacao.Close;
    tbPenalizacao.Open;
    penaDAO := TPenalizacaoAtrasosDAO.Create();
    penas := penaDAO.FindPenalizacao('');
    for penaTmp in penas do
    begin
      tbPenalizacao.Insert;
      tbPenalizacaoID_PENALIZACAO.AsInteger := penaTmp.ID;
      tbPenalizacaoDAT_PENALIZACAO.AsDateTime := penaTmp.Data;
      tbPenalizacaoQTD_DIAS_ATRASO.AsInteger := penaTmp.Atraso;
      tbPenalizacaoVAL_PENALIZACAO.AsFloat := penaTmp.Valor;
      tbPenalizacaoPER_PENALIZACAO.AsFloat := penaTmp.Percentual;
      tbPenalizacaoDES_LOG.AsString := penaTmp.Log;
      tbPenalizacao.Post;
      dPosicao := (iContador / iRecords) * 100;
      Inc(iContador,1);
      frmProcesso.cxProgressBar1.Position := dPosicao;
      frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
      frmProcesso.cxProgressBar1.Refresh;
    end;
    if not tbPenalizacao.IsEmpty then
    begin
      tbPenalizacao.First;
    end;
  finally
    penaDAO.Free;
    tbPenalizacao.IsLoading := False;
    frmProcesso.Close;
    FreeAndNil(frmProcesso);
  end;
end;

procedure TfrmVerbasExpressas.SetupPenalizacoes();
begin
  pena.ID := tbPenalizacaoID_PENALIZACAO.AsInteger;
  pena.Data := tbPenalizacaoDAT_PENALIZACAO.AsDateTime;
  pena.Atraso := tbPenalizacaoQTD_DIAS_ATRASO.AsInteger;
  pena.Valor := tbPenalizacaoVAL_PENALIZACAO.AsFloat;
  pena.Percentual := tbPenalizacaoPER_PENALIZACAO.AsFloat;
  pena.Log := tbPenalizacaoDES_LOG.AsString;
end;

procedure TfrmVerbasExpressas.ExcluirPenalizacao();
var
  atrasoDAO : TPenalizacaoAtrasosDAO;
  sFiltro : String;
begin
  try
    atrasoDAO := TPenalizacaoAtrasosDAO.Create();
    if Application.MessageBox('Confirma a exclusão?', PChar('Atenção ' + uGlobais.sUsuario), MB_YESNO + MB_ICONQUESTION) = IDNO then
    begin
      Abort;
      Exit;
    end;
    sFiltro := 'WHERE ID_PENALIZACAO = ' + tbPenalizacaoID_PENALIZACAO.AsString;
    if not atrasoDAO.Delete(sFiltro) then
    begin
      Application.MessageBox(PChar('Erro ao excluir a verba ID ' + tbPenalizacaoID_PENALIZACAO.AsString + ' !'),
                             Pchar('Atenção ' + uglobais.sUsuario), MB_OK + MB_ICONERROR);
      Abort;
      Exit;
    end;
  finally
    atrasoDAO.Free;
  end;
end;

procedure TfrmVerbasExpressas.PopulaTabelas();
var
  tabelaTmp : TTabelasDistribuicao;
  dPosicao: Double;
  iContador: Integer;
  iRecords: Integer;
begin
  try
    if not Assigned(frmProcesso) then
    begin
      frmProcesso := TfrmProcesso.Create(Application);
    end;
    dPosicao := 0;
    tbTabelaDistribuicao.IsLoading := True;
    frmProcesso.cxGroupBox1.Caption := 'Populando Distribuição/Entregadores e Tabelas. Aguarde...';
    frmProcesso.cxGroupBox1.Refresh;
    frmProcesso.cxProgressBar1.Position := 0;
    frmProcesso.Show;
    tbTabelaDistribuicao.Close;
    tbTabelaDistribuicao.Open;
    tabelaDAO := TTabelaDistribuicaoDAO.Create();
    tabelas := tabelaDAO.FindTabela('');
    for tabelaTmp in tabelas do
    begin
      tbTabelaDistribuicao.Insert;
      tbTabelaDistribuicaoID_TABELA.AsInteger := tabelaTmp.ID;
      tbTabelaDistribuicaoDAT_TABELA.AsDateTime := tabelaTmp.Data;
      tbTabelaDistribuicaoCOD_TABELA.AsInteger := tabelaTmp.Tabela;
      tbTabelaDistribuicaoCOD_GRUPO.AsInteger := tabelaTmp.Grupo;
      tbTabelaDistribuicaoCOD_TIPO.AsInteger := tabelaTmp.Tipo;
      tbTabelaDistribuicaoCOD_ENTREGADOR.AsInteger := tabelaTmp.Entregador;
      tbTabelaDistribuicaoDES_LOG.AsString := tabelaTmp.Log;
      FindEntregador();
      tbTabelaDistribuicao.Post;
      dPosicao := (iContador / iRecords) * 100;
      Inc(iContador,1);
      frmProcesso.cxProgressBar1.Position := dPosicao;
      frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
      frmProcesso.cxProgressBar1.Refresh;
    end;
    if not tbTabelaDistribuicao.IsEmpty then
    begin
      tbTabelaDistribuicao.First;
    end;
  finally
    tabelaDAO.Free;
    tbTabelaDistribuicao.IsLoading := False;
    frmProcesso.Close;
    FreeAndNil(frmProcesso);
  end;
end;

procedure TfrmVerbasExpressas.ExcluirTabelas();
var
  tabelaDAO : TTabelaDistribuicaoDAO;
  sFiltro : String;
begin
  try
    tabelaDAO := TTabelaDistribuicaoDAO.Create();
    if Application.MessageBox('Confirma a exclusão?', PChar('Atenção ' + uGlobais.sUsuario), MB_YESNO + MB_ICONQUESTION) = IDNO then
    begin
      Abort;
      Exit;
    end;
    sFiltro := 'WHERE ID_TABELA = ' + tbTabelaDistribuicaoID_TABELA.AsString;
    if not tabelaDAO.Delete(sFiltro) then
    begin
      Application.MessageBox(PChar('Erro ao excluir a tabela ID ' + tbTabelaDistribuicaoID_TABELA.AsString + ' !'),
                             Pchar('Atenção ' + uglobais.sUsuario), MB_OK + MB_ICONERROR);
      Abort;
      Exit;
    end;
  finally
    tabelaDAO.Free;
  end;
end;

procedure TfrmVerbasExpressas.SetupTabelas();
begin
  tabela.ID := tbTabelaDistribuicaoID_TABELA.AsInteger;
  tabela.Data := tbTabelaDistribuicaoDAT_TABELA.AsDateTime;
  tabela.Tabela := tbTabelaDistribuicaoCOD_TABELA.AsInteger;
  tabela.Grupo := tbTabelaDistribuicaoCOD_GRUPO.AsInteger;
  tabela.Tipo := tbTabelaDistribuicaoCOD_TIPO.AsInteger;
  tabela.Entregador := tbTabelaDistribuicaoCOD_ENTREGADOR.AsInteger;
  tabela.Log := tbTabelaDistribuicaoDES_LOG.AsString;
end;

procedure TfrmVerbasExpressas.FindEntregador();
var
  entregador : TCodigosEntregadores;
  agente : TAgente;
  sNome : string;
begin
  try
    agente := TAgente.Create;
    entregador := TCodigosEntregadores.Create;
    sNome := '';
    if tbTabelaDistribuicaoCOD_TIPO.AsInteger = 1 then
    begin
      agente.Codigo := tbTabelaDistribuicaoCOD_ENTREGADOR.AsString;
      sNome := agente.getField('NOM_FANTASIA','CODIGO');
    end
    else if tbTabelaDistribuicaoCOD_TIPO.AsInteger = 2 then
    begin
      entregador.Codigo := tbTabelaDistribuicaoCOD_ENTREGADOR.AsInteger;
      sNome := entregador.getField('NOM_FANTASIA','CODIGO');
    end;
    tbTabelaDistribuicaoNOM_ENTREGADOR.AsString := sNome;
  finally
    agente.Free;
    entregador.Free;
  end;

end;

procedure TfrmVerbasExpressas.SearchDisTribuidor();
var
  i,x,y : Integer;
begin
  try
    x := 0;
    if not Assigned(frmPesquisarPessoas) then
    begin
      frmPesquisarPessoas := TfrmPesquisarPessoas.Create(Application);
    end;
    frmPesquisarPessoas.Caption := frmPesquisarPessoas.Caption + ' de Distribuidores';
    frmPesquisarPessoas.cboCampo.Clear;
    for i := 0 to dm.qryAgentes.FieldCount - 1 do
    begin
      frmPesquisarPessoas.tvPesquisa.ClearItems;
      if dm.qryAgentes.Fields[i].Tag = 1 then
      begin
        x := frmPesquisarPessoas.cboCampo.Properties.Items.Add(Trim(dm.qryAgentes.Fields[i].DisplayLabel));
        frmPesquisarPessoas.lListaCampos.Add(Trim(dm.qryAgentes.Fields[i].FieldName));
      end;
      frmPesquisarPessoas.cboCampo.ItemIndex := 2;
    end;
    frmPesquisarPessoas.qryPesquisa.SQL.Text := 'SELECT COD_AGENTE, DES_RAZAO_SOCIAL, NOM_FANTASIA, NUM_CNPJ FROM tbagentes';
    if frmPesquisarPessoas.ShowModal = mrOk then
    begin
      for y := 0 to frmPesquisarPessoas.tvPesquisa.Controller.SelectedRowCount - 1 do
      begin
        tbTabelaDistribuicaoCOD_ENTREGADOR.AsInteger :=
                                          StrToIntDef(frmPesquisarPessoas.tvPesquisa.Controller.SelectedRows[y].DisplayTexts[0],0);
        tbTabelaDistribuicaoNOM_ENTREGADOR.AsString := frmPesquisarPessoas.tvPesquisa.Controller.SelectedRows[y].DisplayTexts[1];
      end;
    end;
  finally
    frmPesquisarPessoas.qryPesquisa.Close;
    frmPesquisarPessoas.qryPesquisa.SQL.Clear;
    FreeAndNil(frmPesquisarPessoas);
  end;
end;

procedure TfrmVerbasExpressas.SearchEntregadores();
var
  i,x,y : Integer;
begin
  try
    x := 0;
    if not Assigned(frmPesquisarPessoas) then
    begin
      frmPesquisarPessoas := TfrmPesquisarPessoas.Create(Application);
    end;
    frmPesquisarPessoas.Caption := frmPesquisarPessoas.Caption + ' de Entregadores';
    frmPesquisarPessoas.cboCampo.Clear;
    for i := 0 to dm.qryCodigosEntregadores.FieldCount - 1 do
    begin
      frmPesquisarPessoas.tvPesquisa.ClearItems;
      if dm.qryCodigosEntregadores.Fields[i].Tag = 1 then
      begin
        x := frmPesquisarPessoas.cboCampo.Properties.Items.Add(Trim(dm.qryCodigosEntregadores.Fields[i].DisplayLabel));
        frmPesquisarPessoas.lListaCampos.Add(Trim(dm.qryCodigosEntregadores.Fields[i].FieldName));
      end;
      frmPesquisarPessoas.cboCampo.ItemIndex := 2;
    end;
    frmPesquisarPessoas.qryPesquisa.SQL.Text := 'SELECT COD_CADASTRO, COD_ENTREGADOR, NOM_FANTASIA FROM tbcodigosentregadores ';
    if frmPesquisarPessoas.ShowModal = mrOk then
    begin
      for y := 0 to frmPesquisarPessoas.tvPesquisa.Controller.SelectedRowCount - 1 do
      begin
        tbTabelaDistribuicaoCOD_ENTREGADOR.AsInteger :=
                                          StrToIntDef(frmPesquisarPessoas.tvPesquisa.Controller.SelectedRows[y].DisplayTexts[0],0);
        tbTabelaDistribuicaoNOM_ENTREGADOR.AsString := frmPesquisarPessoas.tvPesquisa.Controller.SelectedRows[y].DisplayTexts[1];
      end;
    end;
  finally
    frmPesquisarPessoas.qryPesquisa.Close;
    frmPesquisarPessoas.qryPesquisa.SQL.Clear;
    FreeAndNil(frmPesquisarPessoas);
  end;
end;



end.
