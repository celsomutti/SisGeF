unit ufrmContasReceber;

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
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxGroupBox, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractTable, cxTextEdit,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxButtonEdit, Vcl.ActnList, cxCalc, Vcl.Menus,
  Vcl.StdCtrls, cxButtons, cxCurrencyEdit, clcontasReceber, clCliente,
  clOrdemServico, cxGridExportLink, ShellAPI, cxCheckBox,
  dxmdaset, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White,
  System.Actions, clAcessos, clConexao, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmContasReceber = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGroupBox1: TcxGroupBox;
    ds: TDataSource;
    cxGrid1DBTableView1NUM_LANCAMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_LANCAMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_LANCAMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1COD_CLIENTE: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_VENCIMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_OS: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_NOSSONUMERO: TcxGridDBColumn;
    cxGrid1DBTableView1DOM_BAIXADO: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_PAGO: TcxGridDBColumn;
    cxGrid1DBTableView1ID_DOCUMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_CLIENTE: TcxGridDBColumn;
    cxLabel1: TcxLabel;
    cxTitulo: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxData: TcxDateEdit;
    cxLabel3: TcxLabel;
    cxDescricao: TcxTextEdit;
    cxLabel4: TcxLabel;
    cxCodigoCliente: TcxButtonEdit;
    cxNomeCliente: TcxTextEdit;
    cxLabel5: TcxLabel;
    cxVencimento: TcxDateEdit;
    cxLabel6: TcxLabel;
    cxNumeroOS: TcxButtonEdit;
    cxLabel7: TcxLabel;
    cxNossoNumero: TcxMaskEdit;
    cxLabel8: TcxLabel;
    cxDocumento: TcxTextEdit;
    cxLabel9: TcxLabel;
    cxSituacao: TcxTextEdit;
    aclCadastro: TActionList;
    actCadastroNovo: TAction;
    actCadastroExcluir: TAction;
    actCadastroCancelar: TAction;
    cxLabel10: TcxLabel;
    cxValor: TcxCalcEdit;
    actCadastroSalvar: TAction;
    actCadastroExportar: TAction;
    actCadastroSair: TAction;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxButton5: TcxButton;
    cxButton6: TcxButton;
    cxGrid1DBTableView1VAL_LANCAMENTO: TcxGridDBColumn;
    actCadastroRecebimento: TAction;
    cxButton7: TcxButton;
    actCadastroApoio: TAction;
    SaveDialog: TSaveDialog;
    tbGrid: TdxMemData;
    cxLabel27: TcxLabel;
    procedure actCadastroSairExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure actCadastroNovoExecute(Sender: TObject);
    procedure actCadastroExcluirExecute(Sender: TObject);
    procedure actCadastroCancelarExecute(Sender: TObject);
    procedure actCadastroSalvarExecute(Sender: TObject);
    procedure actCadastroApoioExecute(Sender: TObject);
    procedure cxCodigoClientePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure actCadastroExportarExecute(Sender: TObject);
    procedure cxGrid1DBTableView1CanFocusRecord(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; var AAllow: Boolean);
    procedure actCadastroRecebimentoExecute(Sender: TObject);
  private
    { Private declarations }
    procedure AtualizaGrid;
    procedure Modo;
    procedure SetupForm;
    procedure SetupClass;
    procedure ListaCliente;
    procedure ListaOS;
  public
    { Public declarations }
  end;

var
  frmContasReceber: TfrmContasReceber;
  sOperacao: String;
  contasreceber: TContasReceber;
  cliente: TCliente;
  os: TOrdemServico;
  acessos: TAcessos;
  conexao: TConexao;

implementation

{$R *.dfm}

uses
  udm, ufrmPrincipal, clUtil, Math, ufrmListaApoio, uGlobais,
  ufrmSalvaLancamento, ufrmBaixaContasReceber;

procedure TfrmContasReceber.actCadastroApoioExecute(Sender: TObject);
begin
  if cxCodigoCliente.IsFocused then
  begin
    ListaCliente;
  end
  else if cxNumeroOS.IsFocused then
  begin
    ListaOS;
  end;

end;

procedure TfrmContasReceber.actCadastroCancelarExecute(Sender: TObject);
begin
  actCadastroNovoExecute(Self);
end;

procedure TfrmContasReceber.actCadastroExcluirExecute(Sender: TObject);
begin
  if contasreceber.Baixado = 'S' then
  begin
    Application.MessageBox('Titulo já foi baixado. Impossível Excluir!',
      'Atenção!', MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if Application.MessageBox('Confirma excluir este lançamento?', 'Excluir',
    MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  if not(contasreceber.Delete('NUMERO')) then
  begin
    Application.MessageBox('Erro ao excluir o lançamento!', 'Erro',
      MB_OK + MB_ICONERROR);
    Exit;
  end;
  Application.MessageBox('Lançamento Excluído!', 'Atenção!',
    MB_OK + MB_ICONINFORMATION);
  TUtil.LimparFields(Self);
  AtualizaGrid;
  sOperacao := 'I';
  Modo;
end;

procedure TfrmContasReceber.actCadastroExportarExecute(Sender: TObject);
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
    cxGrid1.Refresh;
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

procedure TfrmContasReceber.actCadastroNovoExecute(Sender: TObject);
begin
  TUtil.LimparFields(Self);
  sOperacao := 'I';
  Modo;
  cxData.SetFocus;
end;

procedure TfrmContasReceber.actCadastroRecebimentoExecute(Sender: TObject);
begin
  if contasreceber.Baixado = 'S' then
  begin
    Application.MessageBox('Titulo já baixado!', 'Atenção',
      MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if not Assigned(frmBaixaContaReceber) then
  begin
    frmBaixaContaReceber := TfrmBaixaContaReceber.Create(Application);
  end;
  frmBaixaContaReceber.cxDataBaixa.Date := cxVencimento.Date;
  frmBaixaContaReceber.cxValorBaixa.Value := cxValor.Value;
  if frmBaixaContaReceber.ShowModal = mrCancel then
  begin
    FreeAndNil(frmBaixaContaReceber);
    Exit;
  end;
  if frmBaixaContaReceber.cxDataBaixa.Date < contasreceber.Data then
  begin
    Application.MessageBox('A Data da Baixa é menor que a Data do Titulo!',
      'Baixa', MB_OK + MB_ICONEXCLAMATION);
    FreeAndNil(frmBaixaContaReceber);
    Exit;
  end;
  if frmBaixaContaReceber.cxValorBaixa.Value < contasreceber.Valor then
  begin
    if Application.MessageBox
      ('O Valor baixado é menor que o valor do Titulo. Confirma a Baixa assim mesmo?',
      'Baixa', MB_YESNO + MB_ICONQUESTION) = IDNO then
    begin
      FreeAndNil(frmBaixaContaReceber);
      Exit;
    end;
  end;
  if Application.MessageBox('Confirma a baixa deste titulo?', 'Baixa',
    MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    FreeAndNil(frmBaixaContaReceber);
    Exit;
  end;
  contasreceber.Pago := frmBaixaContaReceber.cxDataBaixa.Date;
  contasreceber.Valor := frmBaixaContaReceber.cxValorBaixa.Value;
  contasreceber.Baixado := 'S';
  FreeAndNil(frmBaixaContaReceber);
  if not(contasreceber.Update()) then
  begin
    Application.MessageBox('Erro ao Baixar o Titulo!', 'Atenção',
      MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  Application.MessageBox('Titulo Baixado com sucesso!', 'Atenção',
    MB_OK + MB_ICONINFORMATION);
  AtualizaGrid;
end;

procedure TfrmContasReceber.actCadastroSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmContasReceber.actCadastroSalvarExecute(Sender: TObject);
var
  sDescricao, sParcela: String;
begin
  SetupClass;
  if not(contasreceber.Validar()) then
  begin
    Exit;
  end;
  sDescricao := contasreceber.Descricao;
  if sOperacao = 'I' then
  begin
    if not Assigned(frmSalvaLancamento) then
    begin
      frmSalvaLancamento := TfrmSalvaLancamento.Create(Application);
    end;
    frmSalvaLancamento.cxVencimento.Date := cxVencimento.Date;
    frmSalvaLancamento.cxValor.Value := cxValor.Value;
    if frmSalvaLancamento.ShowModal = mrCancel then
    begin
      FreeAndNil(frmSalvaLancamento);
      Exit;
    end;
    if Application.MessageBox('Confirma incluir o(s) lançamento(s)?', 'Incluir',
      MB_YESNO + MB_ICONQUESTION) = IDNO then
    begin
      FreeAndNil(frmSalvaLancamento);
      Exit;
    end;
    frmSalvaLancamento.tbParcelas.First;
    while not(frmSalvaLancamento.tbParcelas.Eof) do
    begin
      if frmSalvaLancamento.cxQuantidade.Value > 1 then
      begin
        sParcela := frmSalvaLancamento.tbParcelas.RecIdField.AsString + '/' +
          frmSalvaLancamento.cxQuantidade.Text;
        contasreceber.Descricao := sDescricao + ': ' + sParcela;
      end;
      contasreceber.Vencimento := frmSalvaLancamento.tbParcelasDAT_PARCELA.
        AsDateTime;
      contasreceber.Valor := frmSalvaLancamento.tbParcelasVAL_PARCELA.
        AsCurrency;
      if not(contasreceber.Insert()) then
      begin
        Application.MessageBox(pchar('Erro ao incluir Parcela ' + sParcela),
          'Atenção', MB_OK + MB_ICONEXCLAMATION);
      end;
      frmSalvaLancamento.tbParcelas.Next;
    end;
    FreeAndNil(frmSalvaLancamento);
  end
  else
  begin
    if Application.MessageBox('Confirma Alterar o lançamento?', 'Alterar',
      MB_YESNO + MB_ICONQUESTION) = IDNO then
    begin
      Exit;
    end;
    if not(contasreceber.Update()) then
    begin
      Application.MessageBox('Erro ao Alterar Dados!', 'Atenção',
        MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
  end;
  Application.MessageBox('Dados Salvos com sucesso!', 'Atenção',
    MB_OK + MB_ICONINFORMATION);
  AtualizaGrid;
end;

procedure TfrmContasReceber.AtualizaGrid;
begin
  if dm.qryGrid.Active then
  begin
    dm.qryGrid.Close;
    dm.qryGrid.SQL.Clear;
  end;
  dm.qryGrid.SQL.Text := 'select ' +
    'tbcontasreceber.NUM_LANCAMENTO AS NUM_LANCAMENTO, ' +
    'tbcontasreceber.DAT_LANCAMENTO AS DAT_LANCAMENTO, ' +
    'tbcontasreceber.DES_LANCAMENTO AS DES_LANCAMENTO, ' +
    'tbcontasreceber.VAL_LANCAMENTO AS VAL_LANCAMENTO, ' +
    'tbcontasreceber.COD_CLIENTE AS COD_CLIENTE, ' +
    'tbcontasreceber.DAT_VENCIMENTO AS DAT_VENCIMENTO, ' +
    'tbcontasreceber.NUM_OS AS NUM_OS, ' +
    'tbcontasreceber.NUM_NOSSONUMERO AS NUM_NOSSONUMERO, ' +
    'tbcontasreceber.DOM_BAIXADO AS DOM_BAIXADO, ' +
    'tbcontasreceber.DAT_PAGO AS DAT_PAGO, ' +
    'tbcontasreceber.ID_DOCUMENTO AS ID_DOCUMENTO, ' +
    'tbcontasreceber.NOM_EXECUTOR AS NOM_EXECUTOR, ' +
    'tbcontasreceber.DAT_MANUTENCAO AS DAT_MANUTENCAO, ' +
    'tbclientes.NOM_CLIENTE AS NOM_CLIENTE ' + 'from  ' + '(tbcontasreceber ' +
    'LEFT JOIN tbclientes ON ((tbcontasreceber.COD_CLIENTE = tbclientes.COD_CLIENTE)))';
  dm.ZConn.PingServer;
  dm.qryGrid.Open;
  if tbGrid.Active then
  begin
    tbGrid.Close;
  end;
  tbGrid.CreateFieldsFromDataSet(dm.qryGrid);
  tbGrid.LoadFromDataSet(dm.qryGrid);
  dm.qryGrid.Close;
  dm.qryGrid.SQL.Clear;
  cxGrid1DBTableView1.ViewData.Expand(True);
end;

procedure TfrmContasReceber.cxCodigoClientePropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  cxNomeCliente.Properties.ReadOnly := False;
  if TUtil.Empty(cxCodigoCliente.Text) then
  begin
    cxCodigoCliente.Text := '0';
  end;
  if cliente.getObject(cxCodigoCliente.Text, 'CODIGO') then
  begin
    cxNomeCliente.Text := cliente.Razao;
  end
  else
  begin
    cxNomeCliente.Text := '- - -';
  end;
  cxNomeCliente.Properties.ReadOnly := True;
end;

procedure TfrmContasReceber.cxGrid1DBTableView1CanFocusRecord
  (Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  var AAllow: Boolean);
var
  sCodigo: String;
  i, iRet: Integer;
begin
  dm.ZConn.PingServer;
  if tbGrid.Active then
  begin
    sCodigo := cxGrid1DBTableView1NUM_LANCAMENTO.DataBinding.Field.AsString;
    Val(sCodigo, i, iRet);
    if iRet <> 0 then
    begin
      TUtil.LimparFields(Self);
      Exit;
    end;
    if contasreceber.getObject(sCodigo, 'NUMERO') then
    begin
      TUtil.LimparFields(Self);
      SetupForm;
      sOperacao := 'U';
      Modo;
    end
    else
    begin
      TUtil.LimparFields(Self);
      sOperacao := 'I';
      Modo;
    end;
  end;
end;

procedure TfrmContasReceber.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  contasreceber.Free;
  cliente.Free;
  os.Free;
  acessos.Free;
  conexao.Free;
  tbGrid.Close;
  Action := caFree;
  frmContasReceber := Nil;
end;

procedure TfrmContasReceber.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmContasReceber.FormShow(Sender: TObject);
begin
  contasreceber := TContasReceber.Create();
  cliente := TCliente.Create();
  os := TOrdemServico.Create();
  acessos := TAcessos.Create;
  conexao := TConexao.Create;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    actCadastroSairExecute(Sender);
    Exit;
  end;
  acessos.SetNivel(aclCadastro);
  AtualizaGrid;
  sOperacao := 'U';
  cxData.SetFocus;
  Modo;
end;

procedure TfrmContasReceber.Modo;
begin
  if sOperacao = 'I' then
  begin
    actCadastroNovo.Enabled := False;
    actCadastroExcluir.Enabled := False;
    actCadastroCancelar.Enabled := True;
    actCadastroSalvar.Enabled := True;
    actCadastroRecebimento.Enabled := False;
  end
  else if sOperacao = 'U' then
  begin
    actCadastroNovo.Enabled := True;
    actCadastroExcluir.Enabled := True;
    actCadastroCancelar.Enabled := True;
    if contasreceber.Baixado = 'S' then
    begin
      actCadastroSalvar.Enabled := False;
    end
    else
    begin
      actCadastroSalvar.Enabled := True;
    end;
    actCadastroRecebimento.Enabled := True;
  end
  else
  begin
    actCadastroNovo.Enabled := True;
    actCadastroExcluir.Enabled := False;
    actCadastroCancelar.Enabled := True;
    actCadastroSalvar.Enabled := False;
    actCadastroRecebimento.Enabled := False;
  end;
end;

procedure TfrmContasReceber.SetupForm;
begin
  cxTitulo.Text := IntToStr(contasreceber.Numero);
  cxData.Date := contasreceber.Data;
  cxDescricao.Text := contasreceber.Descricao;
  cxValor.Value := contasreceber.Valor;
  cxCodigoCliente.Text := IntToStr(contasreceber.cliente);
  if cliente.getObject(IntToStr(contasreceber.cliente), 'CODIGO') then
  begin
    cxNomeCliente.Text := cliente.Razao;
  end
  else
  begin
    cxNomeCliente.Text := '- - -';
  end;
  cxVencimento.Date := contasreceber.Vencimento;
  cxNumeroOS.Text := IntToStr(contasreceber.os);
  cxNossoNumero.Text := contasreceber.NossoNumero;
  cxDocumento.Text := contasreceber.Documento;
  if contasreceber.Baixado = 'S' then
  begin
    cxSituacao.Style.TextColor := clWindowText;
    cxSituacao.Text := 'Conta Baixada em ' + DateToStr(contasreceber.Pago);
  end
  else
  begin
    cxSituacao.Style.TextColor := clRed;
    cxSituacao.Text := 'PENDENTE';
  end;
end;

procedure TfrmContasReceber.SetupClass;
begin
  if TUtil.Empty(cxTitulo.Text) then
  begin
    cxTitulo.Text := '0';
  end;
  if TUtil.Empty(cxValor.Text) then
  begin
    cxValor.Value := 0;
  end;
  if TUtil.Empty(cxCodigoCliente.Text) then
  begin
    cxCodigoCliente.Text := '0';
  end;
  if TUtil.Empty(cxNumeroOS.Text) then
  begin
    cxNumeroOS.Text := '0';
  end;
  contasreceber.Numero := StrToInt(cxTitulo.Text);
  contasreceber.Data := cxData.Date;
  contasreceber.Descricao := cxDescricao.Text;
  contasreceber.Valor := cxValor.Value;
  contasreceber.cliente := StrToInt(cxCodigoCliente.Text);
  contasreceber.Vencimento := cxVencimento.Date;
  contasreceber.os := StrToInt(cxNumeroOS.Text);
  contasreceber.NossoNumero := cxNossoNumero.Text;
  contasreceber.Documento := cxDocumento.Text;
  contasreceber.Baixado := 'N';
  contasreceber.Executor := uGlobais.sUsuario;
  contasreceber.Manutencao := Now();
end;

procedure TfrmContasReceber.ListaCliente;
var
  sId, sResultado: String;
begin
  with dm.qryPesquisa do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT COD_CLIENTE "Número", NOM_CLIENTE "Nome" ' +
      'FROM tbclientes';
    dm.ZConn.PingServer;
    Open;
    if IsEmpty then
    begin
      Close;
      SQL.Clear;
      Exit;
    end;
  end;
  dm.qryPesquisa.First;
  if not Assigned(frmListaApoio) then
  begin
    frmListaApoio := TfrmListaApoio.Create(Application);
  end;
  frmListaApoio.Caption := 'Clientes';
  if frmListaApoio.ShowModal = mrOk then
  begin
    cxCodigoCliente.Text := dm.qryPesquisa.Fields[0].AsString;
    cxNomeCliente.Text := dm.qryPesquisa.Fields[1].AsString;
  end;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  FreeAndNil(frmListaApoio);
end;

procedure TfrmContasReceber.ListaOS;
var
  sId, sResultado: String;
begin
  with dm.qryPesquisa do
  begin
    Close;
    SQL.Clear;
    SQL.Text :=
      'SELECT tbordemservico.NUM_OS "Número", tbordemservico.DAT_OS "Data", tbordemservico.DES_ROTA "Rota",  '
      + 'tbordemservico.VAL_DIARIA AS "Valor", tbentregadores.NOM_FANTASIA "Entregador/Motorista" FROM tbordemservico '
      + 'JOIN tbentregadores ON tbordemservico.COD_ENTREGADOR = tbentregadores.COD_ENTREGADOR ';
    dm.ZConn.PingServer;
    Open;
    if IsEmpty then
    begin
      Application.MessageBox('Nenhuma OS foi encontrada!', 'Atenção!',
        MB_OK + MB_ICONEXCLAMATION);
      Close;
      SQL.Clear;
      Exit;
    end;
  end;
  dm.qryPesquisa.First;
  if not Assigned(frmListaApoio) then
  begin
    frmListaApoio := TfrmListaApoio.Create(Application);
  end;
  frmListaApoio.Caption := 'Ordens de Serviço';
  if frmListaApoio.ShowModal = mrOk then
  begin
    cxNumeroOS.Text := dm.qryPesquisa.Fields[0].AsString;
  end;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  FreeAndNil(frmListaApoio);
end;

end.
