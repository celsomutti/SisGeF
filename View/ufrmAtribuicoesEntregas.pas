unit ufrmAtribuicoesEntregas;

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
  uthrPopularAero, clCliente, cxCheckBox, uthrSalvaAero, cxGridExportLink,
  ShellAPI, frxClass, frxDBSet, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, System.Actions, clAcessos,
  clCodigosEntregadores, clConexao, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmAtribuicoesEntregas = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxLabel10: TcxLabel;
    aclAtribuicoes: TActionList;
    actAtribuicoesIniciar: TAction;
    actAtribuicoesApoio: TAction;
    cxButton1: TcxButton;
    actAtribuicoesCancelar: TAction;
    actAtribuicoesReatribuir: TAction;
    cxLabel3: TcxLabel;
    actAtribuicoesSalvar: TAction;
    actAtribuicoesSair: TAction;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    ds: TDataSource;
    cxGroupBox2: TcxGroupBox;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxButton5: TcxButton;
    cxLabel4: TcxLabel;
    cxCliente: TcxButtonEdit;
    cxNomeCliente: TcxTextEdit;
    cxData: TcxDateEdit;
    cxNomeEntregador: TcxTextEdit;
    cxCodigoEntregador: TcxButtonEdit;
    cxGrid1DBTableView1NUM_NOSSONUMERO: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_CONSUMIDOR: TcxGridDBColumn;
    cxGrid1DBTableView1DES_ENDERECO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_COMPLEMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_BAIRRO: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_CIDADE: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_CEP: TcxGridDBColumn;
    cxGrid1DBTableView1QTD_VOLUMES: TcxGridDBColumn;
    cxGrid1DBTableView1QTD_PESO_REAL: TcxGridDBColumn;
    cxProgressBar: TcxProgressBar;
    cxNossoNumero: TcxMaskEdit;
    cxButton6: TcxButton;
    cxButton7: TcxButton;
    actAtribuicoesExportar: TAction;
    actAtribuicoesImprimir: TAction;
    SaveDialog: TSaveDialog;
    frxDBDataset: TfrxDBDataset;
    frxAtribuicoes: TfrxReport;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLote: TcxComboBox;
    cxLabel16: TcxLabel;
    procedure actAtribuicoesApoioExecute(Sender: TObject);
    procedure actAtribuicoesIniciarExecute(Sender: TObject);
    procedure cxCodigoEntregadorPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxClientePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxCodigoEntregadorPropertiesChange(Sender: TObject);
    procedure cxClientePropertiesChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure actAtribuicoesCancelarExecute(Sender: TObject);
    procedure cxNossoNumeroPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure actAtribuicoesSairExecute(Sender: TObject);
    procedure actAtribuicoesReatribuirExecute(Sender: TObject);
    procedure actAtribuicoesSalvarExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure actAtribuicoesExportarExecute(Sender: TObject);
    procedure actAtribuicoesImprimirExecute(Sender: TObject);
    procedure cxNossoNumeroPropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
    procedure ListaEntregador;
    procedure ListaClientes;
    procedure LocalizaEntrega;
    procedure ReatribuirEntregas;
    procedure MostraProgresso;
    function VerificaGrade(): Boolean;
  public
    { Public declarations }
  end;

var
  frmAtribuicoesEntregas: TfrmAtribuicoesEntregas;
  entrega: TEntrega;
  entregador: TCodigosEntregadores;
  cliente: TCliente;
  thrAero: thrPopularAero;
  bFlag: Boolean;
  iAgente: Integer;
  iConta: Integer;
  iTotal: Integer;
  dPosicao: Double;
  bFlagSalva: Boolean;
  thrSalva: thrSalvaAero;
  acessos: TAcessos;
  conexao: TConexao;

implementation

{$R *.dfm}

uses
  udm, clUtil, Math, ufrmListaApoio, uGlobais, ufrmEntregadorEx;

procedure TfrmAtribuicoesEntregas.ListaEntregador;
var
  sId: String;
begin
  sId := '';
  sId := Trim(cxCodigoEntregador.Text);
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
  if frmListaApoio.ShowModal = mrOk then
  begin
    cxCodigoEntregador.Text := dm.qryPesquisa.Fields[0].AsString;
    cxCodigoEntregador.Refresh;
    cxNomeEntregador.Text := dm.qryPesquisa.Fields[1].AsString;
    cxNomeEntregador.Refresh;
    if entregador.getObject(cxCodigoEntregador.Text, 'CODIGO') then
    begin
      iAgente := entregador.Agente;
    end
    else
    begin
      iAgente := 0;
    end;

  end;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  FreeAndNil(frmListaApoio);
end;

procedure TfrmAtribuicoesEntregas.actAtribuicoesApoioExecute(Sender: TObject);
begin
  if cxCodigoEntregador.IsFocused then
  begin
    ListaEntregador;
  end;
  if cxCliente.IsFocused then
  begin
    ListaClientes;
  end;
end;

procedure TfrmAtribuicoesEntregas.actAtribuicoesCancelarExecute
  (Sender: TObject);
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
  dm.tbAtribuicoes.Close;
  dm.tbAtribuicoes.Open;
  actAtribuicoesIniciar.Enabled := True;
  actAtribuicoesCancelar.Enabled := True;
  actAtribuicoesReatribuir.Enabled := False;
  actAtribuicoesSalvar.Enabled := False;
  actAtribuicoesSair.Enabled := True;
  bFlag := False;
  iAgente := 0;
end;

procedure TfrmAtribuicoesEntregas.actAtribuicoesExportarExecute
  (Sender: TObject);
var
  FileExt, sFile: String;
begin
  if not(dm.tbAtribuicoes.Active) then
  begin
    Exit;
  end;
  if dm.tbAtribuicoes.IsEmpty then
  begin
    Exit;
  end;
  sFile := 'atribuicoes_' + Trim(dm.tbAtribuicoesCOD_ENTREGADOR.AsString) + '_';
  sFile := sFile + Copy(dm.tbAtribuicoesDAT_ATRIBUICAO.AsString, 1, 2) +
    Copy(dm.tbAtribuicoesDAT_ATRIBUICAO.AsString, 4, 2) +
    Copy(dm.tbAtribuicoesDAT_ATRIBUICAO.AsString, 7, 4);
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

procedure TfrmAtribuicoesEntregas.actAtribuicoesImprimirExecute
  (Sender: TObject);
var
  sFile: String;
begin
  if not(dm.tbAtribuicoes.Active) then
  begin
    Exit;
  end;
  if dm.tbAtribuicoes.IsEmpty then
  begin
    Exit;
  end;
  if Application.MessageBox('Confirma a impressão?', 'Imprimir Relatório',
    MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  with frxAtribuicoes do
  begin
    // sFile := 'C:\Projetos\Delphi\OO\SisGeF\Reports\frxAtribuicoes.fr3';
    sFile := ExtractFilePath(Application.ExeName) +
      'Reports\frxAtribuicoes.fr3';
    LoadFromFile(sFile);
    Variables['pEntregador'] := QuotedStr(cxCodigoEntregador.Text + '-' +
      cxNomeEntregador.Text);
    Variables['pData'] := QuotedStr(cxData.Text);
    Variables['pUsuario'] := QuotedStr(uGlobais.sNomeUsuario);
    Variables['pSistema'] := QuotedStr(uGlobais.sSistema);
    Variables['pLote'] := QuotedStr(cxLote.Text);
    ShowReport(True);
  end;
end;

procedure TfrmAtribuicoesEntregas.actAtribuicoesIniciarExecute(Sender: TObject);
begin
  if TUtil.Empty(cxCodigoEntregador.Text) then
  begin
    Application.MessageBox('Informe o Código do Entregador.', 'Atenção',
      MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if TUtil.Empty(cxCliente.Text) then
  begin
    Application.MessageBox('Informe o Código do Cliente.', 'Atenção',
      MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if TUtil.Empty(cxData.Text) then
  begin
    Application.MessageBox('Informe a Data Inicial da Atribuição.', 'Atenção',
      MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if cxLote.ItemIndex <= 0 then
  begin
    Application.MessageBox('Informe o Lote de Remessa.', 'Atenção',
      MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if StrToInt(cxCliente.Text) = 99991 then
  begin
    ds.Enabled := False;
    thrAero := thrPopularAero.Create(True);
    thrAero.FreeOnTerminate := True;
    thrAero.Priority := tpNormal;
    thrAero.Start;
  end;
  bFlag := True;
  bFlagSalva := False;
end;

procedure TfrmAtribuicoesEntregas.actAtribuicoesReatribuirExecute
  (Sender: TObject);
begin
  if not(dm.tbAtribuicoes.Active) then
  begin
    Exit;
  end;
  if dm.tbAtribuicoes.IsEmpty then
  begin
    Exit;
  end;
  if not Assigned(frmEntregadorEx) then
  begin
    frmEntregadorEx := TfrmEntregadorEx.Create(Application);
  end;
  // frmEntregadorEx.cxData.Date :=  cxData.Date;
  if frmEntregadorEx.ShowModal = mrCancel then
  begin
    FreeAndNil(frmEntregadorEx);
    Exit;
  end;
  if frmEntregadorEx.cxCodigoEntregador.Text = cxCodigoEntregador.Text then
  begin
    FreeAndNil(frmEntregadorEx);
    Exit;
    Application.MessageBox('Foi informado o mesmo entregador!', 'Atenção',
      MB_OK + MB_ICONEXCLAMATION);
  end;
  if Application.MessageBox('Confirma Reatribuir estas entregas?', 'Reatribuir',
    MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    FreeAndNil(frmEntregadorEx);
    Exit;
  end;
  cxCodigoEntregador.Text := frmEntregadorEx.cxCodigoEntregador.Text;
  cxNomeEntregador.Text := frmEntregadorEx.cxNomeEntregador.Text;
  // cxData.Date             :=  frmEntregadorEx.cxData.Date;
  FreeAndNil(frmEntregadorEx);
  ReatribuirEntregas;
end;

procedure TfrmAtribuicoesEntregas.actAtribuicoesSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmAtribuicoesEntregas.actAtribuicoesSalvarExecute(Sender: TObject);
begin
  if not(dm.tbAtribuicoes.Active) then
  begin
    Exit;
  end;
  if dm.tbAtribuicoes.IsEmpty then
  begin
    Exit;
  end;
  if Application.MessageBox
    ('Confirma Salvar estas Atribuições no Banco de Dados?',
    'Salvar Atribuicoes', MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  ds.Enabled := False;
  thrSalva := thrSalvaAero.Create(True);
  thrSalva.FreeOnTerminate := True;
  thrSalva.Priority := tpNormal;
  thrSalva.Start;
  bFlagSalva := False;
end;

procedure TfrmAtribuicoesEntregas.cxClientePropertiesChange(Sender: TObject);
begin
  cxNomeCliente.Clear;
end;

procedure TfrmAtribuicoesEntregas.cxClientePropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if TUtil.Empty(cxCliente.Text) then
  begin
    cxCliente.Text := '0';
  end;
  if cliente.getObject(cxCliente.Text, 'CODIGO') then
  begin
    cxNomeCliente.Text := cliente.Razao;
  end
  else
  begin
    cxNomeCliente.Text := '';
  end;
end;

procedure TfrmAtribuicoesEntregas.cxCodigoEntregadorPropertiesChange
  (Sender: TObject);
begin
  cxNomeEntregador.Clear;
end;

procedure TfrmAtribuicoesEntregas.cxCodigoEntregadorPropertiesValidate
  (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  if TUtil.Empty(cxCodigoEntregador.Text) then
  begin
    cxCodigoEntregador.Text := '0';
  end;
  if entregador.getObject(cxCodigoEntregador.Text, 'CODIGO') then
  begin
    cxNomeEntregador.Text := entregador.Nome;
    iAgente := entregador.Agente;
  end
  else
  begin
    cxNomeEntregador.Text := '';
    iAgente := 0;
  end;
end;

procedure TfrmAtribuicoesEntregas.cxNossoNumeroPropertiesEditValueChanged
  (Sender: TObject);
begin
  cxNossoNumero.Clear;
  cxNossoNumero.SetFocus;
end;

procedure TfrmAtribuicoesEntregas.cxNossoNumeroPropertiesValidate
  (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  if not(VerificaGrade()) then
  begin
    LocalizaEntrega;
  end;
end;

procedure TfrmAtribuicoesEntregas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dm.tbAtribuicoes.Close;
  entregador.Free;
  entrega.Free;
  cliente.Free;
  acessos.Free;
  conexao.Free;
  Action := caFree;
  frmAtribuicoesEntregas := Nil;
end;

procedure TfrmAtribuicoesEntregas.FormCloseQuery(Sender: TObject;
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

procedure TfrmAtribuicoesEntregas.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmAtribuicoesEntregas.FormShow(Sender: TObject);
begin
  entregador := TCodigosEntregadores.Create;
  entrega := TEntrega.Create;
  cliente := TCliente.Create;
  acessos := TAcessos.Create;
  conexao := TConexao.Create;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    actAtribuicoesSairExecute(Sender);
    Exit;
  end;
  acessos.SetNivel(aclAtribuicoes);
  bFlag := False;
  iAgente := 0;
end;

procedure TfrmAtribuicoesEntregas.ListaClientes;
var
  sId: String;
begin
  sId := Trim(cxCliente.Text);
  with dm.qryPesquisa do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT COD_CLIENTE AS "Código", NOM_CLIENTE AS "Nome" ' +
      'FROM tbclientes ';
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
  frmListaApoio.Caption := 'Clientes';
  if frmListaApoio.ShowModal = mrOk then
  begin
    cxCliente.Text := dm.qryPesquisa.Fields[0].AsString;
    cxCliente.Refresh;
    cxNomeCliente.Text := dm.qryPesquisa.Fields[1].AsString;
    cxNomeCliente.Refresh;
  end;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  FreeAndNil(frmListaApoio);
end;

procedure TfrmAtribuicoesEntregas.LocalizaEntrega;
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
    if entrega.getObject(sNossoNumero, 'NOSSONUMERO') then
    begin
      if entrega.Recebido <> 'S' then
      begin
        Application.MessageBox('Entrega não foi recebida!', 'Atenção',
          MB_OK + MB_ICONEXCLAMATION);
        Exit;
      end;
      if entrega.Baixado = 'S' then
      begin
        Application.MessageBox('Entrega já foi baixada!', 'Atenção',
          MB_OK + MB_ICONEXCLAMATION);
        Exit;
      end;
      if entrega.entregador = StrToInt(cxCodigoEntregador.Text) then
      begin
        Application.MessageBox('Entrega já atribuida a este entregador.',
          'Atenção', MB_OK + MB_ICONEXCLAMATION);
        Exit;
      end;
      if (entrega.entregador <> StrToInt(cxCodigoEntregador.Text)) and
        (entrega.entregador > 0) then
      begin
        if entregador.getObject(IntToStr(entrega.entregador), 'CODIGO') then
        begin

          sMess := 'Entrega já atribuida ao entregador ' +
            IntToStr(entregador.Codigo) + ' - ' + entregador.Nome +
            '. Deseja reatribuir?';
        end
        else
        begin
          sMess := 'Entrega já atribuida ao entregador ' +
            IntToStr(entrega.entregador) + '. Deseja reatribuir?';
        end;
        if Application.MessageBox(pchar(sMess), 'Atenção',
          MB_YESNO + MB_ICONQUESTION) = IDNO then
        begin
          Exit;
        end;
      end;
      if entrega.cliente <> StrToInt(cxCliente.Text) then
      begin
        if StrToInt(cxCliente.Text) = 99991 then
        begin
          Application.MessageBox('Entrega não pertence a este cliente!',
            'Atenção', MB_OK + MB_ICONEXCLAMATION);
          Exit;
        end;
      end;
      with dm do
      begin
        tbAtribuicoes.Insert;
        tbAtribuicoesNUM_NOSSONUMERO.Value := entrega.NossoNumero;
        tbAtribuicoesNOM_CONSUMIDOR.Value := entrega.Consumidor;
        tbAtribuicoesDES_ENDERECO.Value := entrega.Endereco;
        tbAtribuicoesDES_COMPLEMENTO.Value := entrega.Complemento;
        tbAtribuicoesDES_BAIRRO.Value := entrega.Bairro;
        tbAtribuicoesNOM_CIDADE.Value := entrega.Cidade;
        tbAtribuicoesNUM_CEP.Value := entrega.Cep;
        tbAtribuicoesQTD_VOLUMES.Value := entrega.Volumes;
        tbAtribuicoesQTD_PESO_REAL.Value := entrega.PesoReal;
        tbAtribuicoesCOD_AGENTE.Value := iAgente;
        tbAtribuicoesCOD_ENTREGADOR.Value := StrToInt(cxCodigoEntregador.Text);
        tbAtribuicoesDAT_ATRIBUICAO.Value := cxData.Date;
        tbAtribuicoes.Post;
        bFlagSalva := True;
      end;
    end
    else if entrega.getObject(Copy(sNossoNumero, 1, Length(sNossoNumero) - 2),
      'NOSSONUMERO') then
    begin
      if entrega.Recebido <> 'S' then
      begin
        Application.MessageBox('Entrega não foi recebida!', 'Atenção',
          MB_OK + MB_ICONEXCLAMATION);
        Exit;
      end;
      if entrega.Baixado = 'S' then
      begin
        Application.MessageBox('Entrega já foi baixada!', 'Atenção',
          MB_OK + MB_ICONEXCLAMATION);
        Exit;
      end;
      if entrega.entregador = StrToInt(cxCodigoEntregador.Text) then
      begin
        Application.MessageBox('Entrega já atribuida a este entregador.',
          'Atenção', MB_OK + MB_ICONEXCLAMATION);
        Exit;
      end;
      if (entrega.entregador <> StrToInt(cxCodigoEntregador.Text)) and
        (entrega.entregador > 0) then
      begin
        if entregador.getObject(IntToStr(entrega.entregador), 'CODIGO') then
        begin

          sMess := 'Entrega já atribuida ao entregador ' +
            IntToStr(entregador.Codigo) + ' - ' + entregador.Nome +
            '. Deseja reatribuir?';
        end
        else
        begin
          sMess := 'Entrega já atribuida ao entregador ' +
            IntToStr(entrega.entregador) + '. Deseja reatribuir?';
        end;
        if Application.MessageBox(pchar(sMess), 'Atenção',
          MB_YESNO + MB_ICONQUESTION) = IDNO then
        begin
          Exit;
        end;
      end;
      if entrega.cliente <> StrToInt(cxCliente.Text) then
      begin
        if StrToInt(cxCliente.Text) = 99991 then
        begin
          Application.MessageBox('Entrega não pertence a este cliente!',
            'Atenção', MB_OK + MB_ICONEXCLAMATION);
          Exit;
        end;
      end;
      with dm do
      begin
        tbAtribuicoes.Insert;
        tbAtribuicoesNUM_NOSSONUMERO.Value := entrega.NossoNumero;
        tbAtribuicoesNOM_CONSUMIDOR.Value := entrega.Consumidor;
        tbAtribuicoesDES_ENDERECO.Value := entrega.Endereco;
        tbAtribuicoesDES_COMPLEMENTO.Value := entrega.Complemento;
        tbAtribuicoesDES_BAIRRO.Value := entrega.Bairro;
        tbAtribuicoesNOM_CIDADE.Value := entrega.Cidade;
        tbAtribuicoesNUM_CEP.Value := entrega.Cep;
        tbAtribuicoesQTD_VOLUMES.Value := entrega.Volumes;
        tbAtribuicoesQTD_PESO_REAL.Value := entrega.PesoReal;
        tbAtribuicoesCOD_AGENTE.Value := iAgente;
        tbAtribuicoesCOD_ENTREGADOR.Value := StrToInt(cxCodigoEntregador.Text);
        tbAtribuicoesDAT_ATRIBUICAO.Value := cxData.Date;
        tbAtribuicoes.Post;
        bFlagSalva := True;
      end;
    end
    else if entrega.getObject(sNossoNumero, 'CTRC') then
    begin
      bFlagSave := True;
      while not(dm.qryGetObject.Eof) do
      begin
        if dm.qryGetObject.FieldByName('DOM_RECEBIDO').AsString <> 'S' then
        begin
          sMess := 'Entrega NN ' + dm.qryGetObject.FieldByName
            ('NUM_NOSSONUMERO').AsString + ' não foi Recebida!';
          Application.MessageBox(pchar(sMess), 'Atenção',
            MB_OK + MB_ICONEXCLAMATION);
          bFlagSave := False;
        end;
        if dm.qryGetObject.FieldByName('DOM_BAIXADO').AsString = 'S' then
        begin
          sMess := 'Entrega NN ' + dm.qryGetObject.FieldByName
            ('NUM_NOSSONUMERO').AsString + ' já foi Baixada!';
          Application.MessageBox(pchar(sMess), 'Atenção',
            MB_OK + MB_ICONEXCLAMATION);
          bFlagSave := False;
        end;
        if dm.qryGetObject.FieldByName('COD_ENTREGADOR')
          .AsInteger = StrToInt(cxCodigoEntregador.Text) then
        begin
          sMess := 'Entrega NN ' + dm.qryGetObject.FieldByName
            ('NUM_NOSSONUMERO').AsString + ' já atribuida a este entregador.';
          Application.MessageBox(pchar(sMess), 'Atenção',
            MB_OK + MB_ICONEXCLAMATION);
          bFlagSave := False;
        end;
        if (dm.qryGetObject.FieldByName('COD_ENTREGADOR').AsInteger <>
          StrToInt(cxCodigoEntregador.Text)) and (entrega.entregador > 0) then
        begin
          if entregador.getObject(dm.qryGetObject.FieldByName('COD_ENTREGADOR')
            .AsString, 'CODIGO') then
          begin
            sMess := 'Entrega NN ' + dm.qryGetObject.FieldByName
              ('NUM_NOSSONUMERO').AsString + ' já atribuida ao entregador ' +
              IntToStr(entregador.Codigo) + ' - ' + entregador.Nome +
              '. Deseja reatribuir?';
          end
          else
          begin
            sMess := 'Entrega NN ' + dm.qryGetObject.FieldByName
              ('NUM_NOSSONUMERO').AsString + ' já atribuida ao entregador ' +
              IntToStr(entrega.entregador) + '. Deseja reatribuir?';
          end;
          if Application.MessageBox(pchar(sMess), 'Atenção',
            MB_YESNO + MB_ICONQUESTION) = IDNO then
          begin
            bFlagSave := False;
          end;
        end;
        if entrega.cliente <> StrToInt(cxCliente.Text) then
        begin
          if StrToInt(cxCliente.Text) = 99991 then
          begin
            sMess := 'Entrega NN ' + dm.qryGetObject.FieldByName
              ('NUM_NOSSONUMERO').AsString + ' não pertence a este cliente!';
            Application.MessageBox(pchar(sMess), 'Atenção',
              MB_OK + MB_ICONEXCLAMATION);
            bFlagSave := False;
          end;
        end;
        if bFlagSave then
        begin
          with dm do
          begin
            tbAtribuicoes.Insert;
            tbAtribuicoesNUM_NOSSONUMERO.Value :=
              dm.qryGetObject.FieldByName('NUM_NOSSONUMERO').AsString;
            tbAtribuicoesNOM_CONSUMIDOR.Value :=
              dm.qryGetObject.FieldByName('NOM_CONSUMIDOR').AsString;
            tbAtribuicoesDES_ENDERECO.Value := dm.qryGetObject.FieldByName
              ('DES_ENDERECO').AsString;
            tbAtribuicoesDES_COMPLEMENTO.Value :=
              dm.qryGetObject.FieldByName('DES_COMPLEMENTO').AsString;
            tbAtribuicoesDES_BAIRRO.Value := dm.qryGetObject.FieldByName
              ('DES_BAIRRO').AsString;
            tbAtribuicoesNOM_CIDADE.Value := dm.qryGetObject.FieldByName
              ('NOM_CIDADE').AsString;
            tbAtribuicoesNUM_CEP.Value := dm.qryGetObject.FieldByName
              ('NUM_CEP').AsString;
            tbAtribuicoesQTD_VOLUMES.Value := dm.qryGetObject.FieldByName
              ('QTD_VOLUMES').AsInteger;
            tbAtribuicoesQTD_PESO_REAL.Value :=
              dm.qryGetObject.FieldByName('QTD_PESO_REAL').AsFloat;
            tbAtribuicoesCOD_AGENTE.Value := iAgente;
            tbAtribuicoesCOD_ENTREGADOR.Value :=
              StrToInt(cxCodigoEntregador.Text);
            tbAtribuicoesDAT_ATRIBUICAO.Value := cxData.Date;
            tbAtribuicoes.Post;
            bFlagSalva := True;
          end;
        end;
        dm.qryGetObject.Next;
      end;
    end
    else
    begin
      Application.MessageBox('Entrega não localizada!', 'Atenção',
        MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
  finally
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
    cxNossoNumero.Clear;
    cxNossoNumero.SetFocus;
  end;
end;

procedure TfrmAtribuicoesEntregas.ReatribuirEntregas;
begin
  with dm do
  begin
    iTotal := tbAtribuicoes.RecordCount;
    tbAtribuicoes.First;
    while not tbAtribuicoes.Eof do
    begin
      tbAtribuicoes.Edit;
      tbAtribuicoesCOD_AGENTE.Value := iAgente;
      tbAtribuicoesCOD_ENTREGADOR.Value := StrToInt(cxCodigoEntregador.Text);
      tbAtribuicoesDAT_ATRIBUICAO.Value := cxData.Date;
      tbAtribuicoes.Post;
      tbAtribuicoes.Next;
      bFlagSalva := True;
      MostraProgresso;
    end;
  end;
  Application.MessageBox('Reatribuição concluída.', 'Atenção!',
    MB_OK + MB_ICONINFORMATION);
  cxProgressBar.Visible := False;
end;

procedure TfrmAtribuicoesEntregas.MostraProgresso;
begin
  cxProgressBar.Visible := True;
  Inc(iConta);
  dPosicao := (iConta / iTotal) * 100;
  cxProgressBar.Position := dPosicao;
  cxProgressBar.Properties.Text := IntToStr(Round(dPosicao)) + '%';
end;

function TfrmAtribuicoesEntregas.VerificaGrade(): Boolean;
var
  sNossoNumero: String;
begin
  Result := False;
  with dm.tbAtribuicoes do
  begin
    if IsEmpty then
    begin
      Exit;
    end;
    if not(Active) then
    begin
      Exit;
    end;
    sNossoNumero := Trim(cxNossoNumero.Text);
    First;
    while not(Eof) do
    begin
      if sNossoNumero = FieldByName('NUM_NOSSONUMERO').AsString then
      begin
        Result := True;
        Break;
      end;
      Next;
    end;
    if not(Result) then
    begin
      sNossoNumero := Copy(Trim(cxNossoNumero.Text), 1,
        Length(Trim(cxNossoNumero.Text)) - 2);
      First;
      while not(Eof) do
      begin
        if sNossoNumero = FieldByName('NUM_NOSSONUMERO').AsString then
        begin
          Result := True;
          Break;
        end;
        Next;
      end;
    end;
  end;
end;

end.
