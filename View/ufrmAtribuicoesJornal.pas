unit ufrmAtribuicoesJornal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxLabel, cxImage, Vcl.ExtCtrls,
  cxGroupBox, cxTextEdit, cxMaskEdit, cxButtonEdit,
  clEntrega, clEntregador, Vcl.ComCtrls, dxCore, cxDateUtils, cxDropDownEdit,
  cxCalendar, Vcl.ActnList, Vcl.Menus, Vcl.StdCtrls,
  cxButtons, Data.DB, dxmdaset, cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxProgressBar,
  uthrPopularAtribuicoesJornal, cxCheckBox, cxGridExportLink, ShellAPI,
  frxClass, frxDBSet, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, System.Actions, clAcessos,
  clConexao, dxBarBuiltInMenu, cxPC, uthrSalvaAtribuicoesJornal, clAssinantes,
  clProdutos, clTipoAssinatura, clAtribuicoesJornal,
  ufrmImpressao, dxBevel, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light;

type
  TfrmAtribuicoesJornal = class(TForm)
    aclAtribuicoes: TActionList;
    actAtribuicoesIniciar: TAction;
    actAtribuicoesApoio: TAction;
    actAtribuicoesCancelar: TAction;
    actAtribuicoesReatribuir: TAction;
    actAtribuicoesSalvar: TAction;
    actAtribuicoesSair: TAction;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    actAtribuicoesExportar: TAction;
    actAtribuicoesImprimir: TAction;
    SaveDialog: TSaveDialog;
    cxLabel16: TcxLabel;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxGroupBox1: TcxGroupBox;
    cxLabel10: TcxLabel;
    cxButton1: TcxButton;
    cxLabel3: TcxLabel;
    cxData: TcxDateEdit;
    cxNomeEntregador: TcxTextEdit;
    cxCodigoEntregador: TcxButtonEdit;
    cxNossoNumero: TcxMaskEdit;
    cxLabel1: TcxLabel;
    cxTabSheet2: TcxTabSheet;
    cxGroupBox3: TcxGroupBox;
    cxLabel2: TcxLabel;
    cxDataAtribuicao: TcxDateEdit;
    cxLabel5: TcxLabel;
    cxRoteiro: TcxComboBox;
    cxLabel4: TcxLabel;
    cxCodEntregador: TcxButtonEdit;
    cxNomEntregador: TcxTextEdit;
    actAtribuicoesExecutar: TAction;
    cxButton3: TcxButton;
    cxGrid1DBTableView1RecId: TcxGridDBColumn;
    cxGrid1DBTableView1ID_ASSINANTE: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_ATRIBUICAO: TcxGridDBColumn;
    cxGrid1DBTableView1COD_PRODUTO: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_EDICAO: TcxGridDBColumn;
    cxGrid1DBTableView1COD_ASSINANTE: TcxGridDBColumn;
    cxGrid1DBTableView1COD_TIPO_ASSINATURA: TcxGridDBColumn;
    cxGrid1DBTableView1COD_ENTREGADOR: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_ASSINANTE: TcxGridDBColumn;
    cxGrid1DBTableView1COD_BARRA: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_CUIDADOS: TcxGridDBColumn;
    cxGrid1DBTableView1DES_ENDERECO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_COMPLEMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_BAIRRO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_REFERENCIA: TcxGridDBColumn;
    cxGrid1DBTableView1DES_CIDADE: TcxGridDBColumn;
    cxGrid1DBTableView1DES_UF: TcxGridDBColumn;
    cxGrid1DBTableView1CEP_ENDERECO: TcxGridDBColumn;
    cxGrid1DBTableView1QTD_EXEMPLARES: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_ROTEIRO: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_USUARIO: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_MANUTENCAO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_PRODUTO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_TIPO_ASSINATURA: TcxGridDBColumn;
    cxGroupBox2: TcxGroupBox;
    cxButton2: TcxButton;
    cxButton4: TcxButton;
    cxButton5: TcxButton;
    cxButton6: TcxButton;
    cxButton7: TcxButton;
    frxReport: TfrxReport;
    frxDBDataset: TfrxDBDataset;
    procedure actAtribuicoesApoioExecute(Sender: TObject);
    procedure actAtribuicoesIniciarExecute(Sender: TObject);
    procedure cxCodigoEntregadorPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxCodigoEntregadorPropertiesChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure actAtribuicoesCancelarExecute(Sender: TObject);
    procedure cxNossoNumeroPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure actAtribuicoesSairExecute(Sender: TObject);
    procedure actAtribuicoesSalvarExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure actAtribuicoesExportarExecute(Sender: TObject);
    procedure cxNossoNumeroPropertiesEditValueChanged(Sender: TObject);
    procedure actAtribuicoesExecutarExecute(Sender: TObject);
    procedure actAtribuicoesImprimirExecute(Sender: TObject);
    procedure cxPageControl1Click(Sender: TObject);
  private
    { Private declarations }
    procedure ListaEntregador;
    procedure LocalizaEntrega;
    procedure PopulaRoteiro;
    function VerificaGrade(): Boolean;
  public
    { Public declarations }
  end;

var
  frmAtribuicoesJornal: TfrmAtribuicoesJornal;
  assinante: TAssinantes;
  entregador: TEntregador;
  thrPopula: thrPopularAtribuicoes;
  bFlag: Boolean;
  iAgente: Integer;
  iConta: Integer;
  iTotal: Integer;
  dPosicao: Double;
  bFlagSalva: Boolean;
  thrSalva: thrSalvaAtribuicoes;
  acessos: TAcessos;
  conexao: TConexao;
  produto: TProdutos;
  tipo: TTipoAssinatura;
  atribuicao: TAtribuicoes;

implementation

{$R *.dfm}

uses
  udm, clUtil, Math, ufrmListaApoio, uGlobais, ufrmEntregadorEx, ufrmProcesso;

procedure TfrmAtribuicoesJornal.ListaEntregador;
var
  sId: String;
begin
  sId := '';
  if cxCodigoEntregador.IsFocused then
  begin
    sId := Trim(cxCodigoEntregador.Text);
  end
  else if cxCodEntregador.IsFocused then
  begin
    sId := Trim(cxCodEntregador.Text);
  end;
  with dm.qryPesquisa do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT COD_CADASTRO AS "Código", DES_RAZAO_SOCIAL AS "Nome" ' +
      'FROM tbentregadores WHERE DOM_FUNCIONARIO IN (' + QuotedStr('1') + ',' +
      QuotedStr('2') + ',' + QuotedStr('T') + ',' + QuotedStr('P') + ')';
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
  if frmListaApoio.ShowModal = mrOk then
  begin
    if cxCodigoEntregador.IsFocused then
    begin
      cxCodigoEntregador.Text := dm.qryPesquisa.Fields[0].AsString;
      cxCodigoEntregador.Refresh;
      cxNomeEntregador.Text := dm.qryPesquisa.Fields[1].AsString;
      cxNomeEntregador.Refresh;
    end
    else if cxCodEntregador.IsFocused then
    begin
      cxCodEntregador.Text := dm.qryPesquisa.Fields[0].AsString;
      cxCodEntregador.Refresh;
      cxNomEntregador.Text := dm.qryPesquisa.Fields[1].AsString;
      cxNomEntregador.Refresh;
    end;
  end;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  FreeAndNil(frmListaApoio);
end;

procedure TfrmAtribuicoesJornal.actAtribuicoesApoioExecute(Sender: TObject);
begin
  if cxCodigoEntregador.IsFocused then
  begin
    ListaEntregador;
  end
  else if cxCodEntregador.IsFocused then
  begin
    ListaEntregador;
  end;

end;

procedure TfrmAtribuicoesJornal.actAtribuicoesCancelarExecute(Sender: TObject);
begin
  if not(bFlag) then
  begin
    Exit;
  end;
  if Application.MessageBox('Confirma Cancelar a Atribuição?',
    'Cancelar Atribuição', MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  TUtil.LimparFields(Self);
  dm.tbAtribuicoesJornal.Close;
  dm.tbAtribuicoesJornal.Open;
  bFlag := False;
  iAgente := 0;
end;

procedure TfrmAtribuicoesJornal.actAtribuicoesExecutarExecute(Sender: TObject);
begin
  if TUtil.Empty(cxCodEntregador.Text) then
  begin
    Application.MessageBox('Informe o Código do Entregador.', 'Atenção',
      MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if TUtil.Empty(cxDataAtribuicao.Text) then
  begin
    Application.MessageBox('Informe a Data da Atribuição.', 'Atenção',
      MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if TUtil.Empty(cxRoteiro.Text) then
  begin
    Application.MessageBox('Informe o Roteiro.', 'Atenção',
      MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if (not assinante.getObject(cxRoteiro.Text, 'ROTEIRO')) then
  begin
    Application.MessageBox('Nenhuma assinatura encontrada!', 'Atenção',
      MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if dm.tbAtribuicoesJornal.Active then
  begin
    dm.tbAtribuicoesJornal.Close;
  end;
  dm.tbAtribuicoesJornal.Open;
  uGlobais.sResultado := cxCodEntregador.Text;
  if not Assigned(frmProcesso) then
  begin
    frmProcesso := TfrmProcesso.Create(Application);
  end;
  frmProcesso.Show;
  dm.dsAtribuicoes.Enabled := False;
  thrPopula := thrPopularAtribuicoes.Create(True);
  thrPopula.FreeOnTerminate := True;
  thrPopula.Priority := tpNormal;
  thrPopula.Start;
end;

procedure TfrmAtribuicoesJornal.actAtribuicoesExportarExecute(Sender: TObject);
var
  FileExt, sFile: String;
begin
  if not(dm.tbAtribuicoesJornal.Active) then
  begin
    Exit;
  end;
  if dm.tbAtribuicoesJornal.IsEmpty then
  begin
    Exit;
  end;
  sFile := 'atribuicoes_' +
    Trim(dm.tbAtribuicoesJornalCOD_ENTREGADOR.AsString) + '_';
  sFile := sFile + Copy(dm.tbAtribuicoesJornalDAT_ATRIBUICAO.AsString, 1, 2) +
    Copy(dm.tbAtribuicoesJornalDAT_ATRIBUICAO.AsString, 4, 2) +
    Copy(dm.tbAtribuicoesJornalDAT_ATRIBUICAO.AsString, 7, 4);
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

procedure TfrmAtribuicoesJornal.actAtribuicoesImprimirExecute(Sender: TObject);
begin
  if dm.tbAtribuicoesJornal.IsEmpty then
  begin
    Exit;
  end;
  with frxReport do
  begin
    if not Assigned(frmImpressao) then
    begin
      frmImpressao := TfrmImpressao.Create(Application);
    end;
    frmImpressao.cxLabel1.Caption := 'ATRIBUIÇÕES JORNAL';
    frmImpressao.cxArquivo.Text := ExtractFilePath(Application.ExeName) + 'Reports\frxAtribuicoesJornal.fr3';
    if frmImpressao.ShowModal <> mrOk then
    begin
      FreeAndNil(frmImpressao);
      Exit;
    end
    else
    begin
      if (not FileExists(frmImpressao.cxArquivo.Text)) then
      begin
        Application.MessageBox(pchar('Arquivo ' + frmImpressao.cxArquivo.Text + ' não foi encontrado!'), 'Atenção',
                               MB_OK + MB_ICONWARNING);
        Exit;
      end;
    end;
    LoadFromFile(frmImpressao.cxArquivo.Text);
    Variables.Items[Variables.IndexOf('pEntregador')].Value := QuotedStr(cxCodigoEntregador.Text + ' - ' + cxNomeEntregador.Text);
    Variables.Items[Variables.IndexOf('pSistema')].Value := QuotedStr(TUtil.Sistema('Internalname') + ' Versão ' + TUtil.VersaoExe);
    Variables.Items[Variables.IndexOf('pUsuario')].Value := QuotedStr(uGlobais.sNomeUsuario);
    FreeAndNil(frmImpressao);
    if (not uGlobais.bFlagImprimir) then
    begin
      ShowReport(True);
    end
    else
    begin
      Print;
    end;
  end;
end;

procedure TfrmAtribuicoesJornal.actAtribuicoesIniciarExecute(Sender: TObject);
begin
  if TUtil.Empty(cxCodigoEntregador.Text) then
  begin
    Application.MessageBox('Informe o Código do Entregador.', 'Atenção',
      MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if TUtil.Empty(cxData.Text) then
  begin
    Application.MessageBox('Informe a Data da Atribuição.', 'Atenção',
      MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  bFlag := True;
  bFlagSalva := False;
  if dm.tbAtribuicoesJornal.Active then
  begin
    dm.tbAtribuicoesJornal.Close;
  end;
  dm.tbAtribuicoesJornal.Open;
  cxNossoNumero.SetFocus;
  atribuicao.entregador := StrToInt(cxCodigoEntregador.Text);
  atribuicao.Data := cxData.Date;
  if (not atribuicao.getObject('0', 'CHAVE2')) then
  begin
    Exit;
  end;
  if not Assigned(frmProcesso) then
  begin
    frmProcesso := TfrmProcesso.Create(Application);
  end;
  frmProcesso.Show;
  dm.dsAtribuicoes.Enabled := False;
  thrPopula := thrPopularAtribuicoes.Create(True);
  thrPopula.FreeOnTerminate := True;
  thrPopula.Priority := tpNormal;
  thrPopula.Start;
end;

procedure TfrmAtribuicoesJornal.actAtribuicoesSairExecute(Sender: TObject);
begin
  try
    Perform(WM_CLOSE, 0, 0);
  except
    on E: Exception do
      MessageDlg(E.Message, mtError, mbOKCancel, 0);
  end;
end;

procedure TfrmAtribuicoesJornal.actAtribuicoesSalvarExecute(Sender: TObject);
begin
  if (not dm.tbAtribuicoesJornal.Active) then
  begin
    Exit;
  end;
  if dm.tbAtribuicoesJornal.IsEmpty then
  begin
    Exit;
  end;
  if Application.MessageBox ('Confirma Salvar estas Atribuições no Banco de Dados?', 'Salvar Atribuicoes',
                             MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  if not Assigned(frmProcesso) then
  begin
    frmProcesso := TfrmProcesso.Create(Application);
  end;
  frmProcesso.Show;
  dm.dsAtribuicoes.Enabled := False;
  thrSalva := thrSalvaAtribuicoes.Create(True);
  thrSalva.FreeOnTerminate := True;
  thrSalva.Priority := tpNormal;
  thrSalva.Start;
  bFlagSalva := False;
end;

procedure TfrmAtribuicoesJornal.cxCodigoEntregadorPropertiesChange
  (Sender: TObject);
begin
  cxNomeEntregador.Clear;
end;

procedure TfrmAtribuicoesJornal.cxCodigoEntregadorPropertiesValidate
  (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  if TUtil.Empty(DisplayValue) then
  begin
    cxCodigoEntregador.Text := '0';
  end;
  if entregador.getObject(DisplayValue, 'CADASTRO') then
  begin
    cxNomeEntregador.Text := entregador.Nome;
  end
  else
  begin
    cxNomeEntregador.Text := '';
  end;
end;

procedure TfrmAtribuicoesJornal.cxNossoNumeroPropertiesEditValueChanged
  (Sender: TObject);
begin
  cxNossoNumero.Clear;
  cxNossoNumero.SetFocus;
end;

procedure TfrmAtribuicoesJornal.cxNossoNumeroPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if not(VerificaGrade()) then
  begin
    LocalizaEntrega;
  end;
end;

procedure TfrmAtribuicoesJornal.cxPageControl1Click(Sender: TObject);
begin
  if cxPageControl1.ActivePageIndex = 1 then
  begin
    actAtribuicoesImprimir.Enabled := False;
  end
  else
  begin
    actAtribuicoesImprimir.Enabled := True;
  end;
end;

procedure TfrmAtribuicoesJornal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dm.tbAtribuicoesJornal.Close;
  atribuicao.Free;
  produto.Free;
  tipo.Free;
  entregador.Free;
  assinante.Free;
  acessos.Free;
  conexao.Free;
  Action := caFree;
  frmAtribuicoesJornal := Nil;
end;

procedure TfrmAtribuicoesJornal.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if bFlagSalva then
  begin
    CanClose :=
      (Application.MessageBox
      ('Existem Atribuições que não foram Salvas! Confirma sair assim mesmo?',
      'Sair', MB_YESNO + MB_ICONQUESTION) = IDYES);
  end;
end;

procedure TfrmAtribuicoesJornal.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then
  begin
    if cxGrid1.IsFocused then
    begin
      Exit;
    end;
    if cxNossoNumero.IsFocused then
    begin
      Key := #0;
      Exit;
    end;
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfrmAtribuicoesJornal.FormShow(Sender: TObject);
begin
  produto := TProdutos.Create;
  tipo := TTipoAssinatura.Create;
  atribuicao := TAtribuicoes.Create;
  entregador := TEntregador.Create;
  assinante := TAssinantes.Create;
  acessos := TAcessos.Create;
  conexao := TConexao.Create;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    actAtribuicoesSairExecute(Sender);
    Exit;
  end;
  acessos.SetNivel(aclAtribuicoes);
  PopulaRoteiro;
  bFlag := False;
  iAgente := 0;
end;

procedure TfrmAtribuicoesJornal.LocalizaEntrega;
var
  sMess, sNossoNumero: String;
  bFlagSave: Boolean;
begin
  try
    sMess := '';
    sNossoNumero := Trim(cxNossoNumero.Text);

    if TUtil.Empty(sNossoNumero) then
    begin
      Exit;
    end;
    if not(bFlag) then
    begin
      Exit;
    end;
    if assinante.getObject(sNossoNumero, 'BARRA') then
    begin
      with dm do
      begin
        if assinante.Quantidade > 1 then
        begin
          Application.MessageBox(PChar('ATENÇÃO! São ' + IntToStr(assinante.Quantidade) + ' exemplares para esta assinatura!'),
                                 PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
        end;
        tbAtribuicoesJornal.Insert;
        tbAtribuicoesJornalID_ASSINANTE.Value := assinante.Id;
        tbAtribuicoesJornalDAT_ATRIBUICAO.Value := cxData.Date;
        tbAtribuicoesJornalCOD_PRODUTO.Value := assinante.produto;
        tbAtribuicoesJornalNUM_EDICAO.Value := assinante.Edicao;
        tbAtribuicoesJornalCOD_ASSINANTE.Value := assinante.Codigo;
        tbAtribuicoesJornalCOD_TIPO_ASSINATURA.Value := assinante.tipo;
        tbAtribuicoesJornalCOD_ENTREGADOR.Value := StrToInt(cxCodigoEntregador.Text);
        tbAtribuicoesJornalNOM_ASSINANTE.Value := assinante.Nome;
        tbAtribuicoesJornalCOD_BARRA.Value := assinante.Barra;
        tbAtribuicoesJornalNOM_CUIDADOS.Value := assinante.Cuidados;
        tbAtribuicoesJornalDES_ENDERECO.Value := assinante.Endereco;
        tbAtribuicoesJornalDES_COMPLEMENTO.Value := assinante.Complemento;
        tbAtribuicoesJornalDES_BAIRRO.Value := assinante.Bairro;
        tbAtribuicoesJornalDES_CIDADE.Value := assinante.Cidade;
        tbAtribuicoesJornalDES_UF.Value := assinante.UF;
        tbAtribuicoesJornalCEP_ENDERECO.Value := assinante.Cep;
        tbAtribuicoesJornalQTD_EXEMPLARES.Value := assinante.Quantidade;
        tbAtribuicoesJornalNUM_ROTEIRO.Value := assinante.Roteiro;
        produto.Codigo := assinante.produto;
        tbAtribuicoesJornalDES_PRODUTO.Value := produto.getField('DES_PRODUTO','CODIGO');
        tipo.Codigo := assinante.tipo;
        tbAtribuicoesJornalDES_TIPO_ASSINATURA.Value := tipo.getField('DES_TIPO_ASSINATURA', 'CODIGO');
        tbAtribuicoesJornal.Post;
        bFlagSalva := True;
        cxGrid1.Refresh;
      end;
    end
    else
    begin
      Application.MessageBox('Assinatura não localizada!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
  finally
    dm.qryGetObject1.Close;
    dm.qryGetObject1.SQL.Clear;
    cxNossoNumero.Clear;
    cxNossoNumero.SetFocus;
  end;
end;

function TfrmAtribuicoesJornal.VerificaGrade(): Boolean;
var
  sNossoNumero: String;
begin
  Result := False;
  sNossoNumero := FormatFloat('0000000000',StrToFloatDef(cxNossoNumero.Text,0));
  if (not dm.tbAtribuicoesJornal.Active) then
  begin
    Exit;
  end;
  if dm.tbAtribuicoesJornal.IsEmpty then
  begin
    Exit;
  end;
  if dm.tbAtribuicoesJornal.Locate('COD_BARRA',sNossoNumero,[]) then
  begin
    Application.MessageBox(PChar('ID ' + sNossoNumero + ' já lançado nesta atribuição! Verifique a quantidade de exemplares.'),
                           PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
    Result := True;
  end;
end;

procedure TfrmAtribuicoesJornal.PopulaRoteiro;
var
  sItem: String;
begin
  sItem := '';
  cxRoteiro.Properties.Items.Clear;
  if assinante.getObject('NUM_ROTEIRO', 'FILTRO1') then
  begin
    while (not dm.qryGetObject1.Eof) do
    begin
      sItem := dm.qryGetObject1.FieldByName('NUM_ROTEIRO').AsString;
      cxRoteiro.Properties.Items.Add(sItem);
      dm.qryGetObject1.Next;
    end;
  end;
  dm.qryGetObject1.Close;
  dm.qryGetObject1.SQL.Clear;
  cxRoteiro.ItemIndex := -1;
end;

end.
