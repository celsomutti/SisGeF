unit ufrmImportacaoTiragemJornal;

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
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxLabel, dxSkinscxPCPainter, dxLayoutContainer, dxLayoutControl, dxLayoutcxEditAdapters,
  cxTextEdit, cxMaskEdit, cxButtonEdit, Data.DB, dxmdaset, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxDropDownEdit, cxBlobEdit, System.Actions, Vcl.ActnList, dxLayoutControlAdapters, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  clEntregador, clProdutos, DAO.Tiragem, Model.Tiragem, System.Generics.Collections, cxDBLookupComboBox, cxCalendar;

type
  TfrmImportacaoTiragemJornal = class(TForm)
    cxLabel27: TcxLabel;
    lcMainGroup_Root: TdxLayoutGroup;
    lcMain: TdxLayoutControl;
    lcgArquivo: TdxLayoutGroup;
    edtArquivo: TcxButtonEdit;
    lciArquivo: TdxLayoutItem;
    odArquivo: TOpenDialog;
    lcgDadosTiragem: TdxLayoutGroup;
    tbTiragem: TdxMemData;
    tbTiragemDAT_TIRAGEM: TDateField;
    tbTiragemCOD_ROTEIRO: TStringField;
    tbTiragemCOD_ENTREGADOR: TIntegerField;
    tbTiragemCOD_PRODUTO: TStringField;
    tbTiragemQTD_TIRAGEM: TIntegerField;
    tvTiragem: TcxGridDBTableView;
    lvTiragem: TcxGridLevel;
    grdTiragem: TcxGrid;
    lciGradeTiragem: TdxLayoutItem;
    memLogImportacao: TcxBlobEdit;
    lcMainItem1: TdxLayoutItem;
    dsTiragem: TDataSource;
    tvTiragemRecId: TcxGridDBColumn;
    tvTiragemDAT_TIRAGEM: TcxGridDBColumn;
    tvTiragemCOD_ROTEIRO: TcxGridDBColumn;
    tvTiragemCOD_ENTREGADOR: TcxGridDBColumn;
    tvTiragemCOD_PRODUTO: TcxGridDBColumn;
    tvTiragemQTD_TIRAGEM: TcxGridDBColumn;
    aclImportacao: TActionList;
    actAbrir: TAction;
    actImportar: TAction;
    actLimpar: TAction;
    actGravar: TAction;
    actFechar: TAction;
    cxButton1: TcxButton;
    lcMainItem2: TdxLayoutItem;
    cxButton2: TcxButton;
    lcMainItem3: TdxLayoutItem;
    cxButton3: TcxButton;
    lcMainItem4: TdxLayoutItem;
    lcMainGroup1: TdxLayoutAutoCreatedGroup;
    cxButton4: TcxButton;
    lcMainItem5: TdxLayoutItem;
    tbListaEntregadores: TdxMemData;
    tbListaEntregadoresCOD_CADASTRO: TIntegerField;
    tbListaEntregadoresDES_RAZAO_SOCIAL: TStringField;
    dsEntregador: TDataSource;
    tbProdutos: TdxMemData;
    tbProdutosCOD_PRODUTO: TWideStringField;
    tbProdutosDES_PRODUTO: TWideStringField;
    dsProdutos: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actAbrirExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actImportarExecute(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
    procedure actGravarExecute(Sender: TObject);
    procedure actLimparExecute(Sender: TObject);
  private
    { Private declarations }
    procedure PopulaEntregadores;
    procedure PopulaProdutos;
    procedure ImportarTiragem;
    procedure SalvaTiragem;
    procedure SetupTiragem;
  public
    { Public declarations }
  end;

var
  frmImportacaoTiragemJornal: TfrmImportacaoTiragemJornal;
  entregador: TEntregador;
  produto: TProdutos;
  tiragem: TTIragem;
  tiragemDAO: TTiragemDAO;
  tiragens: TObjectList<TTiragem>;
implementation

{$R *.dfm}

uses udm, uGlobais, ufrmProcesso, clUtil;

procedure TfrmImportacaoTiragemJornal.actAbrirExecute(Sender: TObject);
begin
  edtArquivo.Text := '';
  if odArquivo.Execute then
  begin
    edtArquivo.Text := odArquivo.FileName;
  end;
end;

procedure TfrmImportacaoTiragemJornal.actFecharExecute(Sender: TObject);
begin
  Perform(WM_CLOSE, 0, 0);
end;

procedure TfrmImportacaoTiragemJornal.actGravarExecute(Sender: TObject);
begin
  if tbTiragem.IsEmpty then
  begin
    Exit;
  end;
  if Application.MessageBox('Confirma gravar a tiragem no banco de dados?', PChar('Atenção! ' + uGlobais.sUsuario),
                            MB_ICONQUESTION + MB_YESNO) = IDNO then
  begin
    Exit;
  end;
  SalvaTiragem;
end;

procedure TfrmImportacaoTiragemJornal.actImportarExecute(Sender: TObject);
begin
  if edtArquivo.Text = '' then
  begin
    Application.MessageBox('Informe o arquivo a ser importado!', PChar('Atenção! ' + uGlobais.sUsuario),
    MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if not FileExists(Trim(edtArquivo.Text)) then
  begin
    Application.MessageBox('Arquivo não encontrado!', PChar('Atenção! ' + uGlobais.sUsuario),
    MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if Application.MessageBox('Confirma a importação do arquivo?', PChar('Atenção! ' + uGlobais.sUsuario),
                            MB_ICONQUESTION + MB_YESNO) = IDNO then
  begin
    Exit;
  end;
  ImportarTiragem;
end;

procedure TfrmImportacaoTiragemJornal.actLimparExecute(Sender: TObject);
begin
  if tbTiragem.IsEmpty then
  begin
    Exit;
  end;
  tbTiragem.Close;
  tbTiragem.Open;
  memLogImportacao.Clear;
end;

procedure TfrmImportacaoTiragemJornal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tbTiragem.Close;
  Action := caFree;
  frmImportacaoTiragemJornal := Nil;
end;

procedure TfrmImportacaoTiragemJornal.FormShow(Sender: TObject);
begin
  PopulaEntregadores;
  PopulaProdutos;
  tbTiragem.Open;
end;

procedure TfrmImportacaoTiragemJornal.PopulaEntregadores;
begin
  entregador := TEntregador.Create;
  tbListaEntregadores.Close;
  tbListaEntregadores.Open;
  if entregador.ListaEntregadores then
  begin
    while not dm.qryPesquisa.Eof do
    begin
      tbListaEntregadores.Insert;
      tbListaEntregadoresCOD_CADASTRO.AsInteger := dm.qryPesquisa.FieldByName('COD_CADASTRO').AsInteger;
      tbListaEntregadoresDES_RAZAO_SOCIAL.AsString := dm.qryPesquisa.FieldByName('DES_RAZAO_SOCIAL').AsString;
      tbListaEntregadores.Post;
      dm.qryPesquisa.Next;
    end;
  end;
  if not tbListaEntregadores.IsEmpty then
  begin
    tbListaEntregadores.First;
  end;
  entregador.Free;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
end;

procedure TfrmImportacaoTiragemJornal.PopulaProdutos;
begin
  produto := TProdutos.Create;
  tbProdutos.Close;
  tbProdutos.Open;
  if produto.getObjects then
  begin
    tbProdutos.IsLoading := True;
    tbProdutos.LoadFromDataSet(dm.qryGetObject1);
    tbProdutos.IsLoading := False;
    if not tbProdutos.IsEmpty then
    begin
      tbProdutos.First;
    end;
  end;
  produto.Free;
  dm.qryGetObject.Close;
  dm.qryGetObject.SQL.Clear;
end;

procedure TfrmImportacaoTiragemJornal.ImportarTiragem;
var
  tiragemTmp : TTIragem;
  sEntregador : String;
  sProduto : String;
  LinhasTotal: Integer;
  Contador: Integer;
  dPosicao: Double;
begin
  try
    sEntregador := '';
    tbTiragem.Close;
    tbTiragem.Open;
    tiragemDAO := TTiragemDAO.Create;
    produto := TProdutos.Create;
    entregador := TEntregador.Create;
    tiragens := tiragemDAO.ImportTiragem(edtArquivo.Text);
    if not Assigned(frmProcesso) then
    begin
      frmProcesso := TfrmProcesso.Create(Application);
    end;
    Screen.Cursor := crHourGlass;
    frmProcesso.Show;
    frmProcesso.cxGroupBox1.Caption := 'Populando a grade. Aguarde...';
    frmProcesso.cxGroupBox1.Refresh;
    frmProcesso.cxProgressBar1.Position := 0;
    LinhasTotal := tiragens.Count;
    Contador := 0;
    dPosicao := 0;
    for tiragemTmp in tiragens do
    begin
      if produto.getObject(tiragemTmp.Produto + '%','DESCRICAO') then
      begin
        sProduto := produto.Codigo;
        tbTiragem.Insert;
        tbTiragemDAT_TIRAGEM.AsDateTime := tiragemTmp.Data;
        tbTiragemCOD_ROTEIRO.AsString := tiragemTmp.Roteiro;
        entregador.Roteiro := tiragemTmp.Roteiro;
        tbTiragemCOD_ENTREGADOR.AsInteger := StrToIntDef(entregador.getField('COD_CADASTRO','ROTEIRO'),0);
        tbTiragemCOD_PRODUTO.AsString := sProduto;
        tbTiragemQTD_TIRAGEM.AsInteger := tiragemTmp.Tiragem;
        tbTiragem.Post;
      end;
      dPosicao := (Contador / LinhasTotal) * 100;
      Inc(Contador);
      frmProcesso.cxProgressBar1.Position := dPosicao;
      frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
      frmProcesso.cxProgressBar1.Refresh;
    end;
    if not tbTiragem.IsEmpty then
    begin
      tbTiragem.First;
    end;
    memLogImportacao.Text := memLogImportacao.Text + '>> ' + FormatDateTime('dd/mm/yyyy', Now) + 'Importando o arquivo ' +
                             edtArquivo.Text + ' para verificação' + #13;
  finally
    Screen.Cursor := crDefault;
    FreeAndNil(frmProcesso);
    tiragemDAO.Free;
    produto.Free;
    entregador.Free;
  end;
end;

procedure TfrmImportacaoTiragemJornal.SalvaTiragem;
var
  Contador, LinhasTotal, i: Integer;
  dPosicao: Double;
  bFlagErro: Boolean;
begin
  try
    tiragemDAO := TTiragemDAO.Create;
    tiragem := TTiragem.Create;
    if not Assigned(frmProcesso) then
    begin
      frmProcesso := TfrmProcesso.Create(Application);
    end;
    Screen.Cursor := crHourGlass;
    frmProcesso.Show;
    frmProcesso.cxGroupBox1.Caption := 'Gravando as Tiragens. Aguarde...';
    frmProcesso.cxGroupBox1.Refresh;
    LinhasTotal := tbTiragem.RecordCount;
    dPosicao := 0;
    Contador := 0;
    if not tbTiragem.IsEmpty then
    begin
      tbTiragem.First;
    end;
    bFlagErro := False;
    while not tbTiragem.Eof do
    begin
      if tbTiragemCOD_ENTREGADOR.AsInteger <> 0 then
      begin
        SetupTiragem;
        if tiragemDAO.Insert(tiragem) = False then
        begin
          if not bFlagErro then
          begin
            Application.MessageBox('Erro ao gravar a tiragem no banco de dados! Verifique o LOG.',
                                   PChar('Atenção! ' + uGlobais.sUsuario),MB_OK + MB_ICONERROR);
            bFlagErro := True;
          end;
          memLogImportacao.Text := memLogImportacao.Text + '>> ' + FormatDateTime('dd/mm/yyyy', Now) +
                                   'Erro ao gravar a Tiragem no Banco de dados. Roteiro/Produto: ' + tiragem.Roteiro + '/' +
                                   tiragem.Produto + #13;
        end;
      end;
      dPosicao := (Contador / LinhasTotal) * 100;
      Inc(Contador,1);
      frmProcesso.cxProgressBar1.Position := dPosicao;
      frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
      frmProcesso.cxProgressBar1.Refresh;
      tbTiragem.Next;
    end;
    tbTiragem.Close;
    tbTiragem.Open;
    memLogImportacao.Text := memLogImportacao.Text + '>> ' + FormatDateTime('dd/mm/yyyy', Now) +
                             'Gravando a tiragem no banco de dados.' + #13;
    Application.MessageBox('Tiragem gravada com sucesso', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONINFORMATION);
    edtArquivo.Clear;
  finally
    Screen.Cursor := crDefault;
    FreeAndNil(frmProcesso);
    tiragemDAO.Free;
  end;
end;

procedure TfrmImportacaoTiragemJornal.SetupTiragem;
var
  iId: Integer;
begin
  iId := tiragemDAO.RetornaID(tbTiragemDAT_TIRAGEM.AsString, tbTiragemCOD_ROTEIRO.AsString, tbTiragemCOD_PRODUTO.AsString);
  tiragem.ID := iId;
  tiragem.Data := tbTiragemDAT_TIRAGEM.AsDateTime;
  tiragem.Roteiro := tbTiragemCOD_ROTEIRO.AsString;
  tiragem.Entregador := tbTiragemCOD_ENTREGADOR.AsInteger;
  tiragem.Produto := tbTiragemCOD_PRODUTO.AsString;
  tiragem.Tiragem := tbTiragemQTD_TIRAGEM.AsInteger;
end;

end.
