unit ufrmOrdemServico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter,
  cxPC, cxContainer, cxEdit, cxTextEdit,
  cxLabel, cxButtonEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxSpinEdit,
  cxTimeEdit, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, dxmdaset, cxCurrencyEdit, Menus, StdCtrls, cxButtons, ActnList,
  clOrdemServico, clEntregador, clVeiculos, clServicos,
  clPlanilhaCredito, cxMemo, cxRichEdit, frxClass, frxDBSet, cxCheckBox,
  clControleKM, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxNavigator, cxImage, Vcl.ExtCtrls, cxGridExportLink, ShellAPI, clAgentes,
  clContasReceber, System.DateUtils, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, System.Actions,
  dxBarBuiltInMenu, clAcessos, clBancos, clConexao, ufrmProcesso, cxDBLookupComboBox, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxDateRanges,
  cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TfrmOrdemServico = class(TForm)
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxLabel1: TcxLabel;
    cxNumero: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxData: TcxDateEdit;
    cxLabel3: TcxLabel;
    cxCodigoEntregador: TcxButtonEdit;
    cxNomeEntregador: TcxTextEdit;
    cxLabel4: TcxLabel;
    cxCodigoVeiculo: TcxButtonEdit;
    cxDescricaoVeiculo: TcxTextEdit;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxKMInicial: TcxTextEdit;
    cxLabel7: TcxLabel;
    cxHoraSaida: TcxTimeEdit;
    cxLabel8: TcxLabel;
    cxKMFinal: TcxTextEdit;
    cxLabel9: TcxLabel;
    cxHoraRetorno: TcxTimeEdit;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    tbServicos: TdxMemData;
    tbServicosDES_SERVICO: TStringField;
    tbServicosVAL_SERVICO: TFloatField;
    DS: TDataSource;
    cxGrid1DBTableView1RecId: TcxGridDBColumn;
    cxGrid1DBTableView1DES_SERVICO: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_SERVICO: TcxGridDBColumn;
    aclCadastro: TActionList;
    actCadastroIncluir: TAction;
    actCadastroEditar: TAction;
    actCadastroExcluir: TAction;
    actCadastroCancelar: TAction;
    actCadastroSalvar: TAction;
    actCadastroImprimir: TAction;
    actCadastroLocalizar: TAction;
    actCadastroSair: TAction;
    actCadastroExcluirEndereco: TAction;
    actCadastroListaApoio: TAction;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton7: TcxButton;
    cxButton6: TcxButton;
    cxButton4: TcxButton;
    cxButton5: TcxButton;
    cxButton1: TcxButton;
    frxReport1: TfrxReport;
    frxDBDataset: TfrxDBDataset;
    tbServicosNUM_ITEM: TIntegerField;
    cxTabSheet2: TcxTabSheet;
    cxLabel10: TcxLabel;
    cxDataInicial: TcxDateEdit;
    cxLabel11: TcxLabel;
    cxDataFinal: TcxDateEdit;
    cxLabel12: TcxLabel;
    cxEntregador: TcxButtonEdit;
    cxNomeMotorista: TcxTextEdit;
    tbExtrato: TdxMemData;
    tbExtratoCOD_ENTREGADOR: TIntegerField;
    tbExtratoNOM_ENTREGADOR: TStringField;
    tbExtratoNUM_SERVICO: TIntegerField;
    tbExtratoDES_SERVICO: TStringField;
    tbExtratoVAL_SERVICO: TFloatField;
    tbExtratoNUM_OS: TIntegerField;
    tbExtratoDAT_OS: TDateField;
    actCadastroExecutar: TAction;
    cxButton8: TcxButton;
    frxDBDataset1: TfrxDBDataset;
    frxReport2: TfrxReport;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    DS1: TDataSource;
    cxGrid2DBTableView1NUM_SERVICO: TcxGridDBColumn;
    cxGrid2DBTableView1DES_SERVICO: TcxGridDBColumn;
    cxGrid2DBTableView1VAL_SERVICO: TcxGridDBColumn;
    cxGrid2DBTableView1NUM_OS: TcxGridDBColumn;
    cxGrid2DBTableView1DAT_OS: TcxGridDBColumn;
    atCadastroImprimirExtrato: TAction;
    cxButton9: TcxButton;
    cxKM: TcxCheckBox;
    tbExtratoDOM_FECHADO: TStringField;
    cxGrid2DBTableView1DOM_FECHADO: TcxGridDBColumn;
    cxButton10: TcxButton;
    actCadastroExportar: TAction;
    SaveDialog: TSaveDialog;
    cxRota: TcxComboBox;
    actCadastroFecharExtrato: TAction;
    tbExtratoNUM_EXTRATO: TStringField;
    cxGrid2DBTableView1NUM_EXTRATO: TcxGridDBColumn;
    cxButton11: TcxButton;
    actCadastroCancelarFechamento: TAction;
    cxButton12: TcxButton;
    cxGrid2DBTableView1NOM_ENTREGADOR: TcxGridDBColumn;
    cxTFO: TcxCheckBox;
    cxLabel27: TcxLabel;
    cxLabel13: TcxLabel;
    cxKMRodado: TcxTextEdit;
    cxUsuario: TcxTextEdit;
    OpenDialog: TOpenDialog;
    actCadastroImportar: TAction;
    cxButton13: TcxButton;
    tbExtratoCOD_CLIENTE: TIntegerField;
    cxGrid2DBTableView1COD_CLIENTE: TcxGridDBColumn;
    dsCliente: TDataSource;
    tbExtratoDES_PLACA: TStringField;
    cxGrid2DBTableView1DES_PLACA: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure actCadastroIncluirExecute(Sender: TObject);
    procedure actCadastroExcluirExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actCadastroCancelarExecute(Sender: TObject);
    procedure actCadastroLocalizarExecute(Sender: TObject);
    procedure actCadastroSairExecute(Sender: TObject);
    procedure actCadastroSalvarExecute(Sender: TObject);
    procedure cxCodigoEntregadorPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxCodigoVeiculoPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure actCadastroImprimirExecute(Sender: TObject);
    procedure tbServicosBeforePost(DataSet: TDataSet);
    procedure cxEntregadorPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure actCadastroExecutarExecute(Sender: TObject);
    procedure cxCodigoEntregadorKeyPress(Sender: TObject; var Key: Char);
    procedure cxKMInicialKeyPress(Sender: TObject; var Key: Char);
    procedure cxKMFinalKeyPress(Sender: TObject; var Key: Char);
    procedure cxEntregadorKeyPress(Sender: TObject; var Key: Char);
    procedure atCadastroImprimirExtratoExecute(Sender: TObject);
    procedure actCadastroListaApoioExecute(Sender: TObject);
    procedure cxLabel1KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure actCadastroExportarExecute(Sender: TObject);
    procedure actCadastroFecharExtratoExecute(Sender: TObject);
    procedure actCadastroCancelarFechamentoExecute(Sender: TObject);
    procedure cxCodigoVeiculoPropertiesChange(Sender: TObject);
    procedure cxCodigoEntregadorPropertiesChange(Sender: TObject);
    procedure cxEntregadorPropertiesChange(Sender: TObject);
    procedure cxKMFinalPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxNumeroExit(Sender: TObject);
    procedure actCadastroImportarExecute(Sender: TObject);
  private
    { Private declarations }
    procedure Modo;
    procedure SetupForm;
    procedure AtualizaGrid;
    procedure SetupClass;
    procedure ConverteServico;
    procedure ListaEntregador;
    Procedure ListaVeiculo;
    procedure ListaRotas;
    procedure FechaExtrato;
    procedure CancelarFechamento;
    procedure ListaServicos;
    procedure GeraContasReceber;
    procedure ExcluirContasReceber;
    procedure ImportaPlanilha;
  public
    { Public declarations }
  end;

var
  frmOrdemServico: TfrmOrdemServico;
  sOperacao: String;
  os: TOrdemServico;
  entregador: TEntregador;
  veiculo: TVeiculos;
  servico: TServicos;
  km: TControleKM;
  planilha: TPlanilhaCredito;
  agente: TAgente;
  receber: TContasReceber;
  acessos: TAcessos;
  banco: TBancos;
  conexao: TConexao;

implementation

uses udm, clUtil, ufrmPrincipal, ufrmLocalizar, ufrmListaApoio, Math, uGlobais,
  cxGridDBDataDefinitions, ufrmData, ufrmImpressao;

{$R *.dfm}

procedure TfrmOrdemServico.Modo;
begin
  if sOperacao = 'I' then
  begin
    actCadastroIncluir.Enabled := True;
    actCadastroExcluir.Enabled := False;
    actCadastroImprimir.Enabled := False;
    actCadastroCancelar.Enabled := True;
    actCadastroSalvar.Enabled := True;
    cxNumero.Properties.ReadOnly := False;
  end
  else if sOperacao = 'U' then
  begin
    actCadastroIncluir.Enabled := True;
    actCadastroExcluir.Enabled := True;
    actCadastroImprimir.Enabled := True;
    actCadastroCancelar.Enabled := True;
    actCadastroSalvar.Enabled := True;
    cxNumero.Properties.ReadOnly := True;
  end
  else
  begin
    actCadastroIncluir.Enabled := True;
    actCadastroExcluir.Enabled := False;
    actCadastroImprimir.Enabled := False;
    actCadastroCancelar.Enabled := True;
    actCadastroSalvar.Enabled := True;
    cxNumero.Properties.ReadOnly := False;
  end;
  acessos.SetNivel(aclCadastro);
end;

procedure TfrmOrdemServico.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then
  begin
    if cxGrid1.IsFocused then
    begin
      Exit;
    end;
    if cxGrid2.IsFocused then
    begin
      Exit;
    end;
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfrmOrdemServico.FormShow(Sender: TObject);
begin
  os := TOrdemServico.Create();
  entregador := TEntregador.Create();
  veiculo := TVeiculos.Create();
  servico := TServicos.Create();
  km := TControleKM.Create();
  planilha := TPlanilhaCredito.Create();
  agente := TAgente.Create();
  receber := TContasReceber.Create();
  acessos := TAcessos.Create;
  banco := TBancos.Create();
  conexao := TConexao.Create;
  dm.qryROClientes.Open;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    actCadastroSairExecute(Sender);
    Exit;
  end;
  ListaRotas;
  actCadastroIncluirExecute(Sender);
end;

procedure TfrmOrdemServico.actCadastroIncluirExecute(Sender: TObject);
begin
  sOperacao := 'I';
  TUtil.LimparFields(Self);
  cxPageControl1.ActivePageIndex := 0;
  tbServicos.Close;
  tbServicos.Open;
  Modo;
  cxData.Date := Now;
  cxData.SetFocus;
end;

procedure TfrmOrdemServico.actCadastroCancelarFechamentoExecute
  (Sender: TObject);
var
  bFlag: Boolean;
begin
  if not(tbExtrato.Active) then
  begin
    Exit;
  end;
  if tbExtrato.IsEmpty then
  begin
    Exit;
  end;
  bFlag := False;
  tbExtrato.First;
  while not(tbExtrato.Eof) do
  begin
    if not(bFlag) then
    begin
      if tbExtratoDOM_FECHADO.Value = 'S' then
      begin
        bFlag := True;
      end;
    end;
    tbExtrato.Next;
  end;
  tbExtrato.First;
  if not(bFlag) then
  begin
    Application.MessageBox('Todas as OSs da seleção acima NÃO estão fechadas.',
      'Atenção', MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if Application.MessageBox('Confirma Cancelar o fechamento do extrato?',
    'Cancelar Fechamento', MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  CancelarFechamento;
  actCadastroExecutarExecute(Self);
end;

procedure TfrmOrdemServico.actCadastroExcluirExecute(Sender: TObject);
begin
  if sOperacao <> 'U' then
  begin
    Exit;
  end;
  if MessageDlg('Confirma excluir esta OS?', mtConfirmation, [mbYes, mbNo], 0) = IDNO
  then
  begin
    Exit;
  end;
  receber.os := os.Numero;
  ExcluirContasReceber;
  if os.Delete('NUMERO') then
  begin
    MessageDlg('OS Excluida com sucesso!', mtInformation, [mbOK], 0);
    actCadastroIncluirExecute(Self);
  end
  else
  begin
    MessageDlg('Erro ao excluir a OS!', mtWarning, [mbOK], 0);
  end;
end;

procedure TfrmOrdemServico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  veiculo.Free;
  entregador.Free;
  servico.Free;
  os.Free;
  km.Free;
  acessos.Free;
  planilha.Free;
  agente.Free;
  receber.Free;
  banco.Free;
  conexao.Free;
  dm.qryROClientes.Close;
  if tbServicos.Active then
  begin
    tbServicos.Close;
  end;
  Action := caFree;
  frmOrdemServico := Nil;
end;

procedure TfrmOrdemServico.actCadastroCancelarExecute(Sender: TObject);
begin
  sOperacao := 'X';
  TUtil.LimparFields(Self);
  cxPageControl1.ActivePageIndex := 0;
  tbServicos.Close;
  tbServicos.Open;
  Modo;
  cxData.SetFocus;
end;

procedure TfrmOrdemServico.actCadastroListaApoioExecute(Sender: TObject);
begin
  if cxCodigoEntregador.IsFocused then
  begin
    ListaEntregador;
  end
  else if cxEntregador.IsFocused then
  begin
    ListaEntregador;
  end
  else if cxCodigoVeiculo.IsFocused then
  begin
    ListaVeiculo;
  end
  else if cxGrid1DBTableView1DES_SERVICO.Focused then
  begin
    ListaServicos;
  end;
end;

procedure TfrmOrdemServico.actCadastroLocalizarExecute(Sender: TObject);
begin
  with dm.qryPesquisa do
  begin
    Close;
    SQL.Clear;
    SQL.Text :=
      'SELECT tbordemservico.NUM_OS "Número", tbordemservico.DAT_OS "Data", tbordemservico.DES_ROTA "Rota",  '
      + 'tbentregadores.NOM_FANTASIA "Entregador/Motorista" FROM tbordemservico '
      + 'JOIN tbentregadores ON tbordemservico.COD_ENTREGADOR = tbentregadores.COD_ENTREGADOR ';
    SQL.Add('');
  end;
  if not Assigned(frmLocalizar) then
  begin
    frmLocalizar := TfrmLocalizar.Create(Application);
  end;
  frmLocalizar.cboCamposDisplay.Clear;
  frmLocalizar.cboCamposSQL.Clear;
  frmLocalizar.cboCamposDisplay.Items.Add('Número');
  frmLocalizar.cboCamposSQL.Items.Add('NUM_OS');
  frmLocalizar.cboCamposDisplay.Items.Add('Data');
  frmLocalizar.cboCamposSQL.Items.Add('DAT_OS');
  frmLocalizar.cboCamposDisplay.Items.Add('Rota');
  frmLocalizar.cboCamposSQL.Items.Add('DES_ROTA');
  frmLocalizar.cboCamposDisplay.Items.Add('Entregador/Motorista');
  frmLocalizar.cboCamposSQL.Items.Add('NOM_FANTASIA');
  frmLocalizar.cboCamposDisplay.ItemIndex := 0;
  frmLocalizar.cboCamposSQL.ItemIndex := 0;

  if frmLocalizar.ShowModal = mrOk then
  begin
    if os.getObject(dm.qryPesquisa.Fields[0].AsString, 'NUMERO') then
    begin
      TUtil.LimparFields(Self);
      tbServicos.Close;
      tbServicos.Open;
      SetupForm;
      cxData.SetFocus;
      sOperacao := 'U';
      Modo;
    end;
  end;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
end;

procedure TfrmOrdemServico.SetupForm;
var
  iKM: Integer;
begin
  cxNumero.Text := IntToStr(os.Numero);
  cxData.Date := os.Data;
  cxCodigoEntregador.Text := IntToStr(os.entregador);
  if entregador.getObject(cxCodigoEntregador.Text, 'CADASTRO') then
  begin
    cxNomeEntregador.Text := entregador.Nome;
  end
  else
  begin
    cxNomeEntregador.Text := '- - -';
  end;
  if dm.qryGetObject.Active then
  begin
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
  end;
  cxCodigoVeiculo.Text := IntToStr(os.veiculo);
  if veiculo.getObject(cxCodigoVeiculo.Text, 'CODIGO') then
  begin
    cxDescricaoVeiculo.Text := 'Marca ' + veiculo.Marca + ', Modelo ' +
      veiculo.Modelo + ', Placa ' + veiculo.Placa;
  end
  else
  begin
    cxDescricaoVeiculo.Text := '- - -';
  end;
  if dm.qryGetObject.Active then
  begin
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
  end;
  cxRota.Text := os.Rota;
  cxKMInicial.Text := IntToStr(os.KmInicial);
  cxHoraSaida.Time := StrToTime(os.HoraSaida);
  cxKMFinal.Text := IntToStr(os.KmFinal);
  cxHoraRetorno.Time := StrToTime(os.HoraRetorno);
  iKM := os.KmFinal - os.KmInicial;
  if iKM < 0 then
  begin
    iKM := 0;
  end;
  cxKMRodado.Text := IntToStr(iKM);
  cxUsuario.Text := os.Executor + ' - ' + FormatDateTime('dd/mm/yyyy hh:mm:ss',
    os.Manutencao);
  AtualizaGrid;
end;

procedure TfrmOrdemServico.AtualizaGrid;
var
  Contador, i, ITam: Integer;
  Linha, sItem, sDescricao, sValor: String;
  sItens: TStringList;

  // Lê Linha e Monta os valores
  function MontaValor: String;
  var
    ValorMontado: String;
  begin
    ValorMontado := '';
    inc(i);
    While Linha[i] >= ' ' do
    begin
      If Linha[i] = '|' then // vc pode usar qualquer delimitador ... eu
        // estou usando o "|"
        break;
      ValorMontado := ValorMontado + Linha[i];
      inc(i);
    end;
    result := ValorMontado;
  end;

begin
  if tbServicos.Active then
  begin
    tbServicos.Close;
  end;
  tbServicos.Open;
  Linha := os.Descricao;
  Contador := 1;
  i := 0;
  ITam := Length(Linha);
  while ITam > i do
  begin
    if Contador = 1 then
    begin
      sItem := MontaValor;
      while TUtil.Empty(sItem) do
      begin
        sItem := MontaValor;
      end;
      inc(Contador);
    end;
    if Contador = 2 then
    begin
      sDescricao := MontaValor;
      inc(Contador);
    end;
    if Contador = 3 then
    begin
      sValor := MontaValor;
      inc(Contador);
    end;
    if Contador > 3 then
    begin
      Contador := 1;
    end;
    if ITam > i then
    begin
      tbServicos.Insert;
      tbServicosDES_SERVICO.AsString := sDescricao;
      tbServicosVAL_SERVICO.AsFloat := StrToFloat(sValor);
      tbServicos.Post;
    end;
  end;
  if not(tbServicos.IsEmpty) then
  begin
    tbServicos.First;
  end;
end;

procedure TfrmOrdemServico.SetupClass;
begin
  if TUtil.Empty(cxNumero.Text) then
  begin
    cxNumero.Text := '0';
  end;
  os.Numero := StrToInt(cxNumero.Text);
  os.Data := cxData.Date;
  if TUtil.Empty(cxCodigoEntregador.Text) then
  begin
    cxCodigoEntregador.Text := '0';
  end;
  os.entregador := StrToInt(cxCodigoEntregador.Text);
  if TUtil.Empty(cxCodigoVeiculo.Text) then
  begin
    cxCodigoVeiculo.Text := '0';
  end;
  os.veiculo := StrToInt(cxCodigoVeiculo.Text);
  os.Rota := cxRota.Text;
  if TUtil.Empty(cxKMInicial.Text) then
  begin
    cxKMInicial.Text := '0';
  end;
  os.KmInicial := StrToInt(cxKMInicial.Text);
  os.HoraSaida := cxHoraSaida.Text;
  if TUtil.Empty(cxKMFinal.Text) then
  begin
    cxKMFinal.Text := '0';
  end;
  os.KmFinal := StrToInt(cxKMFinal.Text);
  os.HoraRetorno := cxHoraRetorno.Text;
  ConverteServico;
  os.ValorDiaria := cxGrid1DBTableView1.DataController.Summary.
    FooterSummaryValues[0];
  os.Executor := uGlobais.sUsuario;
  os.Manutencao := Now;
end;

procedure TfrmOrdemServico.ConverteServico;
var
  sItens: TStringList;
begin
  os.Descricao := '';
  sItens := TStringList.Create();
  if not(tbServicos.Active) then
  begin
    Exit;
  end;
  if not(tbServicos.IsEmpty) then
  begin
    tbServicos.SortedField := 'RecIdField';
    tbServicos.First;
  end;
  while not(tbServicos.Eof) do
  begin
    if TUtil.Empty(tbServicosVAL_SERVICO.AsString) then
    begin
      tbServicosVAL_SERVICO.Value := 0;
    end;
    sItens.Add(tbServicos.RecIdField.AsString + '|' +
      tbServicosDES_SERVICO.AsString + '|' +
      tbServicosVAL_SERVICO.AsString + '|');
    tbServicos.Next;
  end;
  os.Descricao := sItens.Text;
end;

procedure TfrmOrdemServico.actCadastroSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmOrdemServico.actCadastroSalvarExecute(Sender: TObject);
var
  iSeqKM: Integer;
  sPlaca: String;
begin
  iSeqKM := 0;
  SetupClass;
  if not(os.Validar()) then
  begin
    Exit;
  end;
  if (os.KmInicial = 0) or (os.KmFinal = 0) then
  begin
    cxKM.Checked := False;
  end;
  if Application.MessageBox('Confirma salvar os dados?', 'Salvar',
    MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  if sOperacao = 'I' then
  begin
    if not(os.Insert()) then
    begin
      MessageDlg('Erro ao incluir os dados!', mtWarning, [mbOK], 0);
      Exit;
    end;
    cxNumero.Text := IntToStr(os.Numero);
    cxNumero.Refresh;
  end;
  if sOperacao = 'U' then
  begin
    if not(os.Update()) then
    begin
      MessageDlg('Erro ao alterar os dados!', mtWarning, [mbOK], 0);
      Exit;
    end;
  end;
  ListaRotas;
  if cxKM.Checked then
  begin
    if veiculo.getObject(IntToStr(os.veiculo), 'CODIGO') then
    begin
      sPlaca := veiculo.Placa;
      iSeqKM := km.getSeq(IntToStr(os.KmInicial), IntToStr(os.KmFinal),
        DateToStr(os.Data), sPlaca);
    end
    else
    begin
      sPlaca := '';
    end;
    if not(TUtil.Empty(sPlaca)) then
    begin
      km.Sequencia := iSeqKM;
      km.Data := os.Data;
      km.Placa := sPlaca;
      km.KmInicial := os.KmInicial;
      km.KmFinal := os.KmFinal;
      km.HoraSaida := os.HoraSaida;
      km.HoraRetorno := os.HoraRetorno;
      km.entregador := os.entregador;
      km.Obs := os.Rota;
      km.Executor := uGlobais.sUsuario;
      km.Manutencao := Now;
      if km.Sequencia = 0 then
      begin
        if not(km.Insert()) then
        begin
          MessageDlg('Erro ao incluir o KM!', mtError, [mbOK], 0);
        end;
      end
      else
      begin
        if not(km.Update()) then
        begin
          MessageDlg('Erro ao alterar o KM!', mtError, [mbOK], 0);
        end;
      end;
    end;
  end;
  Application.MessageBox('Dados Salvos com Sucesso.', 'Atenção',
    MB_OK + MB_ICONINFORMATION);
  if cxTFO.Checked then
  begin
    GeraContasReceber;
  end;
  if sOperacao = 'I' then
  begin
    if Application.MessageBox('Deseja imprimir esta OS?', 'Imprimir',
      MB_YESNO + MB_ICONQUESTION) = IDYES then
    begin
      actCadastroImprimirExecute(Self);
    end;
    TUtil.LimparFields(Self);
    cxData.Date := Now;
    tbServicos.Close;
    tbServicos.Open;
  end;
  Modo;
  cxData.SetFocus;
end;

procedure TfrmOrdemServico.cxCodigoEntregadorPropertiesChange(Sender: TObject);
begin
  if Pos(sOperacao, 'IU') = 0 then
  begin
    Exit;
  end;
  cxNomeEntregador.Clear;
end;

procedure TfrmOrdemServico.cxCodigoEntregadorPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if Pos(sOperacao, 'IU') = 0 then
  begin
    Exit;
  end;
  if TUtil.Empty(cxCodigoEntregador.Text) then
  begin
    cxCodigoEntregador.Text := '0';
  end;
  if entregador.getObject(cxCodigoEntregador.Text, 'CADASTRO') then
  begin
    cxNomeEntregador.Text := entregador.Nome;
  end
  else
  begin
    cxNomeEntregador.Text := '- - -';
  end;
end;

procedure TfrmOrdemServico.cxCodigoVeiculoPropertiesChange(Sender: TObject);
begin
  if Pos(sOperacao, 'IU') = 0 then
  begin
    Exit;
  end;
  cxDescricaoVeiculo.Clear;
end;

procedure TfrmOrdemServico.cxCodigoVeiculoPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if Pos(sOperacao, 'IU') = 0 then
  begin
    Exit;
  end;
  if TUtil.Empty(cxCodigoVeiculo.Text) then
  begin
    cxCodigoVeiculo.Text := '0';
  end;
  if veiculo.getObject(cxCodigoVeiculo.Text, 'CODIGO') then
  begin
    cxDescricaoVeiculo.Text := 'Marca ' + veiculo.Marca + ', Modelo ' +
      veiculo.Modelo + ', Placa ' + veiculo.Placa;
  end
  else
  begin
    cxDescricaoVeiculo.Text := '- - -';
  end;
  if entregador.getObject(IntToStr(veiculo.entregador), 'CADASTRO') then
  begin
    cxCodigoEntregador.Text := IntToStr(entregador.Cadastro);
    cxNomeEntregador.Text := entregador.Nome;
  end
  else
  begin
    cxCodigoEntregador.Text := '0';
    cxNomeEntregador.Text := '- - -';
  end;
end;

procedure TfrmOrdemServico.actCadastroImportarExecute(Sender: TObject);
begin
  ImportaPlanilha;
end;

procedure TfrmOrdemServico.actCadastroImprimirExecute(Sender: TObject);
begin
  if Pos(sOperacao, 'IU') = 0 then
  begin
    Exit;
  end;
  with frxReport1 do
  begin
    if not Assigned(frmImpressao) then
    begin
      frmImpressao := TfrmImpressao.Create(Application);
    end;
    frmImpressao.cxLabel1.Caption := 'ORDENS DE SERVIÇOS';
    frmImpressao.cxArquivo.Text := ExtractFilePath(Application.ExeName) +
      'Reports\frxOS.fr3';
    if frmImpressao.ShowModal <> mrOk then
    begin
      FreeAndNil(frmImpressao);
      Exit;
    end
    else
    begin
      if (not FileExists(frmImpressao.cxArquivo.Text)) then
      begin
        Application.MessageBox(PChar('Arquivo ' + frmImpressao.cxArquivo.Text +
          ' não foi encontrado!'), 'Atenção', MB_OK + MB_ICONWARNING);
        Exit;
      end;
    end;
    LoadFromFile(frmImpressao.cxArquivo.Text);
    FreeAndNil(frmImpressao);
    Variables.Items[Variables.IndexOf('numero')].Value :=
      QuotedStr(FormatFloat('###,###,##0', os.Numero));
    Variables.Items[Variables.IndexOf('data')].Value :=
      QuotedStr(FormatDateTime('dd/mm/yyyy', os.Data));
    Variables.Items[Variables.IndexOf('motorista')].Value :=
      QuotedStr(cxNomeEntregador.Text);
    Variables.Items[Variables.IndexOf('veiculo')].Value :=
      QuotedStr(cxDescricaoVeiculo.Text);
    Variables.Items[Variables.IndexOf('rota')].Value := QuotedStr(os.Rota);
    if os.KmInicial > 0 then
    begin
      Variables.Items[Variables.IndexOf('kminicial')].Value :=
        QuotedStr(FormatFloat('###,###,##0', os.KmInicial));
    end
    else
    begin
      Variables.Items[Variables.IndexOf('kminicial')].Value := QuotedStr(' ');
    end;
    if (os.HoraSaida = '00:00') and (os.HoraRetorno = '00:00') then
    begin
      Variables.Items[Variables.IndexOf('horasaida')].Value := QuotedStr(' ');
    end
    else
    begin
      Variables.Items[Variables.IndexOf('horasaida')].Value :=
        QuotedStr(os.HoraSaida);
    end;
    if os.KmInicial > 0 then
    begin
      Variables.Items[Variables.IndexOf('kmfinal')].Value :=
        QuotedStr(FormatFloat('###,###,##0', os.KmFinal));
    end
    else
    begin
      Variables.Items[Variables.IndexOf('kmfinal')].Value := QuotedStr(' ');
    end;
    if (os.HoraSaida = '00:00') and (os.HoraRetorno = '00:00') then
    begin
      Variables.Items[Variables.IndexOf('horaretorno')].Value := QuotedStr(' ');
    end
    else
    begin
      Variables.Items[Variables.IndexOf('horaretorno')].Value :=
        QuotedStr(os.HoraRetorno);
    end;
    Variables.Items[Variables.IndexOf('total')].Value :=
      QuotedStr(FormatFloat('###,###,##0.00',
      cxGrid1DBTableView1.DataController.Summary.FooterSummaryValues[0]));
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

procedure TfrmOrdemServico.tbServicosBeforePost(DataSet: TDataSet);
begin
  tbServicosNUM_ITEM.AsInteger := tbServicos.RecIdField.AsInteger;
end;

procedure TfrmOrdemServico.cxEntregadorPropertiesChange(Sender: TObject);
begin
  if Pos(sOperacao, 'IU') = 0 then
  begin
    Exit;
  end;
  cxNomeMotorista.Clear;
end;

procedure TfrmOrdemServico.cxEntregadorPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if TUtil.Empty(cxEntregador.Text) then
  begin
    cxEntregador.Text := '0';
    Exit;
  end;
  if entregador.getObject(cxEntregador.Text, 'CADASTRO') then
  begin
    cxNomeMotorista.Text := entregador.Alias;
  end
  else
  begin
    cxNomeMotorista.Text := '- - -';
  end;
end;

procedure TfrmOrdemServico.actCadastroExecutarExecute(Sender: TObject);
var
  iItem: Integer;
  sPlaca: String;
begin
  if TUtil.Empty(cxDataInicial.Text) then
  begin
    MessageDlg('Informe a Data Inicial !', mtWarning, [mbOK], 0);
    cxDataInicial.SetFocus;
    Exit;
  end;
  if TUtil.Empty(cxDataFinal.Text) then
  begin
    MessageDlg('Informe a Data Final !', mtWarning, [mbOK], 0);
    cxDataFinal.SetFocus;
    Exit;
  end;
  if TUtil.Empty(cxEntregador.Text) then
  begin
    cxEntregador.Text := '0';
  end;
  if cxDataFinal.Date < cxDataInicial.Date then
  begin
    MessageDlg('A Data Final não pode ser menor que a Data Inicial !',
      mtWarning, [mbOK], 0);
    cxDataFinal.SetFocus;
    Exit;
  end;
  if tbExtrato.Active then
  begin
    tbExtrato.Close;
  end;
  tbExtrato.Open;
  iItem := 1;
  if os.Periodo(cxDataInicial.Text, cxDataFinal.Text, cxEntregador.Text) then
  begin
    with dm.qryGeral do
    begin
      while not(Eof) do
      begin
        if os.getObject(FieldByName('NUM_OS').AsString, 'NUMERO') then
        begin
          AtualizaGrid;
          if not(tbServicos.IsEmpty) then
          begin
            tbServicos.First;
          end;
          while not(tbServicos.Eof) do
          begin
            tbExtrato.Insert;
            tbExtratoCOD_ENTREGADOR.AsInteger := os.entregador;
            if entregador.getObject(IntToStr(os.entregador), 'CADASTRO') then
            begin
              tbExtratoNOM_ENTREGADOR.AsString := entregador.Nome;
            end
            else
            begin
              tbExtratoNOM_ENTREGADOR.AsString := '- - -';
            end;
            tbExtratoNUM_SERVICO.AsInteger := iItem;
            inc(iItem, 1);
            tbExtratoDES_SERVICO.AsString := tbServicosDES_SERVICO.AsString;
            tbExtratoVAL_SERVICO.AsFloat := tbServicosVAL_SERVICO.AsFloat;
            tbExtratoNUM_OS.AsInteger := os.Numero;
            tbExtratoDAT_OS.AsDateTime := os.Data;
            tbExtratoCOD_CLIENTE.AsInteger := os.Cliente;
            tbExtratoNUM_EXTRATO.AsString := os.Extrato;
            tbExtratoDOM_FECHADO.AsString := os.Fechado;
            veiculo.Codigo := os.Veiculo;
            sPlaca := veiculo.getField('DES_PLACA','CODIGO');
            tbExtratoDES_PLACA.asString := sPlaca;
            tbExtrato.Post;
            tbServicos.Next;
          end;
          tbServicos.Close;
        end;
        Next;
      end;
    end;
  end;
  if tbExtrato.Active then
  begin
    if not(tbExtrato.IsEmpty) then
    begin
      tbExtrato.First;
    end;
  end;
end;

procedure TfrmOrdemServico.actCadastroExportarExecute(Sender: TObject);
var
  FileExt: String;
begin
  if not(tbExtrato.Active) then
  begin
    Exit;
  end;
  if tbExtrato.IsEmpty then
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
      ExportGridToExcel(SaveDialog.FileName, cxGrid2, False, True, False)
    else if FileExt = '.xml' then
      ExportGridToXML(SaveDialog.FileName, cxGrid2, False)
    else if FileExt = '.txt' then
      ExportGridToText(SaveDialog.FileName, cxGrid2, False)
    else if FileExt = '.html' then
      ExportGridToHTML(SaveDialog.FileName, cxGrid2, False);
    ShellExecute(Handle, 'open', PChar(SaveDialog.FileName), nil, nil, SW_SHOW);
  end;
end;

procedure TfrmOrdemServico.actCadastroFecharExtratoExecute(Sender: TObject);
var
  bFlag: Boolean;
begin
  if not(tbExtrato.Active) then
  begin
    Exit;
  end;
  if tbExtrato.IsEmpty then
  begin
    Exit;
  end;
  bFlag := False;
  tbExtrato.First;
  while not(tbExtrato.Eof) do
  begin
    if not(bFlag) then
    begin
      if tbExtratoDOM_FECHADO.Value <> 'S' then
      begin
        bFlag := True;
      end;
    end;
    tbExtrato.Next;
  end;
  tbExtrato.First;
  if not(bFlag) then
  begin
    Application.MessageBox('Todas as OSs da seleção acima já estão fechadas.',
      'Atenção', MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if Application.MessageBox('Confirma fechar o extrato?', 'Fechar Exttato',
    MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  FechaExtrato;
  actCadastroExecutarExecute(Self);
end;

procedure TfrmOrdemServico.cxCodigoEntregadorKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := TUtil.SoNumero(Key);
end;

procedure TfrmOrdemServico.cxKMInicialKeyPress(Sender: TObject; var Key: Char);
begin
  Key := TUtil.SoNumero(Key);
end;

procedure TfrmOrdemServico.cxLabel1KeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then
  begin
    if cxGrid1.IsFocused then
      Exit;
    if cxGrid2.IsFocused then
      Exit;
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfrmOrdemServico.cxNumeroExit(Sender: TObject);
begin
  if Pos(sOperacao, 'IUX') = 0 then
  begin
    Exit;
  end;
  if TUtil.Empty(cxNumero.Text) then
  begin
    cxNumero.Text := '0';
  end;
  if os.getObject(cxNumero.Text, 'NUMERO') then
  begin
    sOperacao := 'U';
    SetupForm;
    Modo;
  end;
end;

procedure TfrmOrdemServico.cxKMFinalKeyPress(Sender: TObject; var Key: Char);
begin
  Key := TUtil.SoNumero(Key);
end;

procedure TfrmOrdemServico.cxKMFinalPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if (not TUtil.Empty(cxKMInicial.Text)) then
  begin
    if (not TUtil.Empty(cxKMFinal.Text)) then
    begin
      cxKMRodado.Text := IntToStr(StrToInt(cxKMFinal.Text) -
        StrToInt(cxKMInicial.Text));
    end
    else
    begin
      cxKMRodado.Text := '0';
    end;
  end;

end;

procedure TfrmOrdemServico.cxEntregadorKeyPress(Sender: TObject; var Key: Char);
begin
  Key := TUtil.SoNumero(Key);
end;

procedure TfrmOrdemServico.atCadastroImprimirExtratoExecute(Sender: TObject);
begin
  if not(tbExtrato.Active) then
  begin
    Exit;
  end;
  if tbExtrato.IsEmpty then
  begin
    Exit;
  end;
  tbExtrato.First;
  with frxReport2 do
  begin
    if not Assigned(frmImpressao) then
    begin
      frmImpressao := TfrmImpressao.Create(Application);
    end;
    frmImpressao.cxLabel1.Caption := 'EXTRATO DE ORDENS DE SERVIÇOS';
    frmImpressao.cxArquivo.Text := ExtractFilePath(Application.ExeName) +
      'Reports\frxExtratoOS.fr3';
    if frmImpressao.ShowModal <> mrOk then
    begin
      FreeAndNil(frmImpressao);
      Exit;
    end
    else
    begin
      if (not FileExists(frmImpressao.cxArquivo.Text)) then
      begin
        Application.MessageBox(PChar('Arquivo ' + frmImpressao.cxArquivo.Text +
          ' não foi encontrado!'), 'Atenção', MB_OK + MB_ICONWARNING);
        Exit;
      end;
    end;
    LoadFromFile(frmImpressao.cxArquivo.Text);
    FreeAndNil(frmImpressao);
    Variables.Items[Variables.IndexOf('DataInicial')].Value :=
      QuotedStr(cxDataInicial.Text);
    Variables.Items[Variables.IndexOf('DataFinal')].Value :=
      QuotedStr(cxDataFinal.Text);
    Variables.Items[Variables.IndexOf('Entregador')].Value :=
      QuotedStr(tbExtratoCOD_ENTREGADOR.AsString + ' - ' +
      tbExtratoNOM_ENTREGADOR.AsString);
    Variables.Items[Variables.IndexOf('Usuario')].Value :=
      QuotedStr(uGlobais.sNomeUsuario);
    Variables.Items[Variables.IndexOf('Total')].Value :=
      QuotedStr(FormatFloat('###,###,##0.00',
      cxGrid2DBTableView1.DataController.Summary.FooterSummaryValues[0]));
    ShowReport(True);
  end;
end;

procedure TfrmOrdemServico.ListaEntregador;
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
    SQL.Text := 'SELECT COD_CADASTRO AS "Código", DES_RAZAO_SOCIAL AS "Nome" ' +
      'FROM tbentregadores ';
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
    if cxPageControl1.ActivePageIndex = 0 then
    begin
      cxCodigoEntregador.Text := dm.qryPesquisa.Fields[0].AsString;
      cxCodigoEntregador.Refresh;
      cxNomeEntregador.Text := dm.qryPesquisa.Fields[1].AsString;
      cxNomeEntregador.Refresh;
    end
    else if cxPageControl1.ActivePageIndex = 1 then
    begin
      cxEntregador.Text := dm.qryPesquisa.Fields[0].AsString;
      cxEntregador.Refresh;
      cxNomeMotorista.Text := dm.qryPesquisa.Fields[1].AsString;
      cxNomeEntregador.Refresh;
    end;
  end;
  dm.tbApoio.Close;
  FreeAndNil(frmListaApoio);
end;

procedure TfrmOrdemServico.ListaVeiculo;
var
  sId: String;
begin
  if Pos(sOperacao, 'IU') = 0 then
  begin
    Exit;
  end;
  sId := '';
  Screen.Cursor := crHourGlass;
  sId := Trim(cxCodigoVeiculo.Text);
  with dm.qryPesquisa do
  begin
    Close;
    SQL.Clear;
    SQL.Text :=
      'SELECT tbveiculos.COD_VEICULO AS "Código", tbveiculos.DES_MARCA AS "Marca", tbveiculos.DES_MODELO AS "Modelo", '
      + 'tbveiculos.DES_PLACA AS "Placa", tbentregadores.DES_RAZAO_SOCIAL AS "Entregador/Motorista" '
      + 'FROM tbveiculos JOIN tbentregadores ON tbveiculos.COD_ENTREGADOR = tbentregadores.COD_CADASTRO';
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
  frmListaApoio.Caption := 'Veículos';
  Screen.Cursor := crDefault;
  if frmListaApoio.ShowModal = mrOk then
  begin
    cxCodigoVeiculo.Text := dm.qryPesquisa.Fields[0].AsString;
    cxCodigoVeiculo.Refresh;
    cxDescricaoVeiculo.Text := 'Marca ' + dm.qryPesquisa.Fields[1].AsString +
      ', Modelo ' + dm.qryPesquisa.Fields[2].AsString + ', Placa ' +
      dm.qryPesquisa.Fields[3].AsString;
    cxDescricaoVeiculo.Refresh;
    if TUtil.Empty(cxCodigoEntregador.Text) then
    begin
      cxCodigoEntregador.Text := '0';
      cxNomeEntregador.Clear
    end;
    if StrToInt(cxCodigoEntregador.Text) = 0 then
    begin
      if entregador.getObject(dm.qryPesquisa.Fields[4].AsString, 'ALIAS') then
      begin
        cxCodigoEntregador.Text := IntToStr(entregador.Cadastro);
        cxNomeEntregador.Text := entregador.Alias;
      end
      else
      begin
        cxCodigoEntregador.Text := '0';
        cxNomeEntregador.Clear;
      end;
    end;
  end;
  dm.tbApoio.Close;
  FreeAndNil(frmListaApoio);
end;

procedure TfrmOrdemServico.ListaRotas;
begin
  with dm.qryGeral do
  begin
    Close;
    SQL.Clear;
    SQL.Text :=
      'SELECT DISTINCT DES_ROTA FROM tbordemservico ORDER BY DES_ROTA';
    dm.ZConn.PingServer;
    Open;
    if not(IsEmpty) then
    begin
      First;
    end;
    cxRota.Properties.Items.Clear;
    while not(Eof) do
    begin
      cxRota.Properties.Items.Add(FieldByName('DES_ROTA').AsString);
      Next;
    end;
    cxRota.ItemIndex := -1;
    Close;
    SQL.Clear;
  end;

end;

procedure TfrmOrdemServico.FechaExtrato;
var
  dtData: TDate;
  sExtrato, sMensagem, sAgente, sNome, sChave: String;
  dValor: Double;
begin
  if not Assigned(frmData) then
  begin
    frmData := TfrmData.Create(Application);
  end;
  if frmData.ShowModal <> mrOk then
  begin
    FreeAndNil(frmData);
    Exit;
  end;
  dtData := frmData.cxData.Date;
  FreeAndNil(frmData);
  tbExtrato.First;
  dValor := 0;
  sAgente := '';
  sExtrato := '';
  while not(tbExtrato.Eof) do
  begin
    if tbExtratoDOM_FECHADO.Value <> 'S' then
    begin
      if os.getObject(tbExtratoNUM_OS.AsString, 'NUMERO') then
      begin
        os.DataPago := dtData;
        os.Fechado := 'S';
        os.GeraNumeroExtrato;
        if TUtil.Empty(sExtrato) then
        begin
          sExtrato := os.Extrato;
        end;
        if not(os.Update()) then
        begin
          sMensagem := 'Erro ao fechar a OS Nº. ' + tbExtratoNUM_OS.AsString +
            ' ! Verifique.';
          Application.MessageBox(PChar(sMensagem), 'Atenção!',
            MB_OK + MB_ICONERROR);
          Exit;
        end;
      end
      else
      begin
        sMensagem := 'OS Nº. ' + tbExtratoNUM_OS.AsString +
          ' não encontrada no banco de dados! Verifique.';
        Application.MessageBox(PChar(sMensagem), 'Atenção!',
          MB_OK + MB_ICONWARNING);
        Exit;
      end;
    end;
    tbExtrato.Next;
  end;
  tbExtrato.First;
  if planilha.getObject(sExtrato, 'EXTRATO') then
  begin
    dValor := planilha.Valor;
    planilha.Valor := dValor + cxGrid2DBTableView1.DataController.Summary.
      FooterSummaryValues[0];
    if not(planilha.Update()) then
    begin
      sMensagem := 'Erro ao Alterar  valor da Planilha! (' + os.Extrato + ')';
      Application.MessageBox(PChar(sMensagem), 'Atenção',
        MB_OK + MB_ICONWARNING);
      Exit;
    end;
  end
  else
  begin
    if entregador.getObject(cxEntregador.Text, 'CADASTRO') then
    begin
      sAgente := IntToStr(entregador.agente);
    end;
    if agente.getObject(sAgente, 'CODIGO') then
    begin
      if agente.Forma <> 'NENHUMA' then
      begin
        planilha.DataPagamento := dtData;
        planilha.Extrato := sExtrato;
        planilha.agente := StrToInt(agente.Codigo);
        planilha.NomeAgente := agente.Razao;
        planilha.entregador := 0;
        planilha.servico := 'ORDEM DE SERVIÇO';
        planilha.NomeEntregador := '';
        planilha.TipoConta := agente.TipoConta;
        planilha.banco := agente.banco;
        banco.Codigo := planilha.banco;
        sNome := banco.getField('NOM_BANCO', 'CODIGO');
        if TUtil.Empty(sNome) then
        begin
          sNome := 'BANCO NÃO CADASTRADO';
        end;
        planilha.NomeBanco := sNome;
        planilha.Agencia := agente.Agencia;
        planilha.Conta := agente.NumeroConta;
        planilha.Favorecido := agente.Favorecido;
        planilha.CpfCnpjFavorecido := agente.CpfCnpjFavorecido;
        planilha.Valor := cxGrid2DBTableView1.DataController.Summary.
          FooterSummaryValues[0];
        planilha.TipoPagamento := agente.Forma;
        planilha.Executor := uGlobais.sUsuario;
        planilha.Manutencao := Now;
      end;
    end;
    if entregador.Forma <> 'NENHUMA' then
    begin
      planilha.DataPagamento := dtData;
      planilha.Extrato := sExtrato;
      planilha.agente := entregador.Cadastro;
      planilha.NomeAgente := entregador.Nome;
      planilha.entregador := 0;
      planilha.servico := 'ORDEM DE SERVIÇO';
      planilha.NomeEntregador := '';
      planilha.TipoConta := entregador.TipoConta;
      planilha.banco := entregador.banco;
      banco.Codigo := planilha.banco;
      sNome := banco.getField('NOM_BANCO', 'CODIGO');
      if TUtil.Empty(sNome) then
      begin
        sNome := 'BANCO NÃO CADASTRADO';
      end;
      planilha.NomeBanco := sNome;
      planilha.Agencia := entregador.Agencia;
      planilha.Conta := entregador.NumeroConta;
      planilha.Favorecido := entregador.Favorecido;
      planilha.CpfCnpjFavorecido := entregador.CpfCnpjFavorecido;
      planilha.Valor := cxGrid2DBTableView1.DataController.Summary.
        FooterSummaryValues[0];
      planilha.TipoPagamento := entregador.Forma;
      planilha.Executor := uGlobais.sUsuario;
      planilha.Manutencao := Now;
    end;
    sChave := '';
    if planilha.getObject(sChave, 'CHAVE') then
    begin
      planilha.Valor := planilha.Valor + dValor;
      if not(planilha.Update()) then
      begin
        MessageDlg('Erro ao alterar os dados na planilha de crédito. Chave: A' +
          sChave, mtWarning, [mbOK], 0);
        Exit;
      end;
    end
    else
    begin
      planilha.Valor := dValor;
      if not(planilha.Insert()) then
      begin
        MessageDlg('Erro ao incluir os dados na planilha de crédito. Chave: A' +
          sChave, mtWarning, [mbOK], 0);
        Exit;
      end;
    end;
  end;
  Application.MessageBox('Fechamento concluído.', 'Atenção',
    MB_OK + MB_ICONINFORMATION);
end;

procedure TfrmOrdemServico.CancelarFechamento;
var
  sExtrato, sMensagem, sAgente: String;
  dValor: Double;
begin
  tbExtrato.First;
  dValor := cxGrid2DBTableView1.DataController.Summary.FooterSummaryValues[0];
  sAgente := '';
  sExtrato := '';
  while not(tbExtrato.Eof) do
  begin
    if tbExtratoDOM_FECHADO.Value = 'S' then
    begin
      if os.getObject(tbExtratoNUM_OS.AsString, 'NUMERO') then
      begin
        os.DataPago := 0;
        os.Fechado := 'N';
        if TUtil.Empty(sExtrato) then
        begin
          sExtrato := os.Extrato;
        end;
        os.Extrato := 'OS0';
        if not(os.Update()) then
        begin
          sMensagem := 'Erro ao Cancelar o fechamento da OS Nº. ' +
            tbExtratoNUM_OS.AsString + ' ! Verifique.';
          Application.MessageBox(PChar(sMensagem), 'Atenção!',
            MB_OK + MB_ICONERROR);
          Exit;
        end;
      end
      else
      begin
        sMensagem := 'OS Nº. ' + tbExtratoNUM_OS.AsString +
          ' não encontrada no banco de dados! Verifique.';
        Application.MessageBox(PChar(sMensagem), 'Atenção!',
          MB_OK + MB_ICONWARNING);
        Exit;
      end;
    end;
    tbExtrato.Next;
  end;
  if planilha.getObject(sExtrato, 'EXTRATO') then
  begin
    if dValor = planilha.Valor then
    begin
      if not(planilha.Delete('EXTRATO')) then
      begin
        sMensagem := 'Erro ao Excluir  valor da Planilha! (' + sExtrato + ')';
        Application.MessageBox(PChar(sMensagem), 'Atenção',
          MB_OK + MB_ICONWARNING);
        Exit;
      end;
    end;
    if dValor < planilha.Valor then
    begin
      planilha.Valor := planilha.Valor - dValor;
      if not(planilha.Update()) then
      begin
        sMensagem := 'Erro ao Alterar  valor da Planilha! (' + os.Extrato + ')';
        Application.MessageBox(PChar(sMensagem), 'Atenção',
          MB_OK + MB_ICONWARNING);
        Exit;
      end;
    end;
  end;
  Application.MessageBox('Fechamento Cancelado.', 'Atenção',
    MB_OK + MB_ICONINFORMATION);
end;

procedure TfrmOrdemServico.ListaServicos;
var
  sId, sFlag, sCodigo: String;
  dValor: Double;
begin
  if TUtil.Empty(sOperacao) then
  begin
    Exit;
  end;
  sId := '';
  sFlag := '';
  sCodigo := '';
  dValor := 0;
  Screen.Cursor := crHourGlass;
  sId := Trim(cxCodigoEntregador.Text);
  with dm.qryPesquisa do
  begin
    Close;
    SQL.Clear;
    SQL.Text :=
      'SELECT COD_SERVICO AS "Código", DES_SERVICO AS "Descrição", DOM_AGREGACAO AS "Agregação" FROM tbservicos';
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
  frmListaApoio.Caption := 'Serviços';
  Screen.Cursor := crDefault;
  if frmListaApoio.ShowModal = mrOk then
  begin
    sCodigo := dm.qryPesquisa.Fields.Fields[0].AsString;
    sId := dm.qryPesquisa.Fields.Fields[1].AsString;
    sFlag := dm.qryPesquisa.Fields.Fields[2].AsString;
    dm.qryPesquisa.Close;
    dm.qryPesquisa.SQL.Clear;
    if sFlag = 'S' then
    begin
      if entregador.getObject(cxCodigoEntregador.Text, 'CADASTRO') then
      begin
        dValor := entregador.Verba;
      end;
    end
    else
    begin
      if servico.getObject(sCodigo, 'CODIGO') then
      begin
        dValor := servico.Valor;
      end;
    end;
    cxGrid1DBTableView1DES_SERVICO.EditValue := sId;
    cxGrid1DBTableView1VAL_SERVICO.EditValue := dValor;
  end;
  FreeAndNil(frmListaApoio);
end;

procedure TfrmOrdemServico.GeraContasReceber;
var
  sData, sDescricao: String;
begin
  sData := '';
  sDescricao := '';
  if receber.getObject(IntToStr(os.Numero), 'OS') then
  begin
    if receber.Baixado = 'S' then
    begin
      Application.MessageBox
        ('Lançamento em Contas a Receber referente a esta OS já foi baixado.',
        'Atenção', MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
    if not(receber.Delete('OS')) then
    begin
      Application.MessageBox
        ('Erro ao Excluir o Lançamento em Contas a Receber referente a esta OS.',
        'Atenção', MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
    receber.Data := os.Data;
    if not(tbServicos.IsEmpty) then
    begin
      tbServicos.First;
    end;
    while not(tbServicos.Eof) do
    begin
      if not(TUtil.Empty(sDescricao)) then
      begin
        sDescricao := sDescricao + ', ';
      end;
      sDescricao := sDescricao + tbServicosDES_SERVICO.Text;
      tbServicos.Next;
    end;
    receber.Descricao := Copy(sDescricao, 1, 255);
    receber.Valor := os.ValorDiaria;
    receber.Cliente := 3;
    if Dayof(os.Data) < 16 then
    begin
      sData := '16/' + IntToStr(MonthOf(os.Data)) + '/' +
        IntToStr(YearOf(os.Data));
    end
    else
    begin
      sData := '01/' + IntToStr(MonthOf(IncDay(os.Data, 30))) + '/' +
        IntToStr(YearOf(IncDay(os.Data, 30)));
    end;
    receber.Vencimento := StrToDate(sData);
    receber.os := os.Numero;
    receber.NossoNumero := '';
    receber.Baixado := 'N';
    receber.Documento := 'OS Nº. ' + IntToStr(os.Numero);
    receber.Executor := uGlobais.sUsuario;
    receber.Manutencao := Now;
    if not(receber.Insert()) then
    begin
      Application.MessageBox
        ('Erro ao Incluir o Lançamento em Contas a Receber referente a esta OS.',
        'Atenção', MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
    Application.MessageBox
      ('Lançamento em Contas a Receber Incluído com Sucesso.', 'Atenção',
      MB_OK + MB_ICONINFORMATION);
  end;
end;

procedure TfrmOrdemServico.ExcluirContasReceber;
begin
  if receber.getObject(IntToStr(os.Numero), 'OS') then
  begin
    if receber.Baixado = 'S' then
    begin
      Exit;
    end;
    if not(receber.Delete('OS')) then
    begin
      Application.MessageBox
        ('Erro ao Excluir o Lançamento em Contas a Receber referente a esta OS.',
        'Atenção', MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
  end;
end;

procedure TfrmOrdemServico.ImportaPlanilha;
var
  sLista: String;
  sDetalhe: TStringList;
  ArquivoCSV: TextFile;
  sArquivo: string;
  i: Integer;
  dPercentual: Double;
  LinhasTotal: Integer;
  Contador: Integer;
begin
  sArquivo := '';
  if OpenDialog.Execute then
  begin
    sArquivo := OpenDialog.FileName;
  end
  else
  begin
    Exit;
  end;
  AssignFile(ArquivoCSV, sArquivo);
  dPercentual := 0;
  if not Assigned(frmProcesso) then
  begin
    frmProcesso := TfrmProcesso.Create(Application);
  end;
  Screen.Cursor := crHourGlass;
  frmProcesso.Show;
  frmProcesso.cxGroupBox1.Caption := 'Importando Planilha. Aguarde...';
  frmProcesso.cxGroupBox1.Refresh;
  LinhasTotal := TUtil.NumeroDeLinhasTXT(sArquivo);
  AssignFile(ArquivoCSV, sArquivo);
  Reset(ArquivoCSV);
  sLista := '';
  sDetalhe := TStringList.Create;
  sDetalhe.StrictDelimiter := True;
  sDetalhe.Delimiter := ';';
  while not Eoln(ArquivoCSV) do
  begin
    sDetalhe.DelimitedText := sLista;
    if sDetalhe.Count > 0 then
    begin
      if TUtil.ENumero(sDetalhe[0]) then
      begin
        os.Data := StrToDateDef(sDetalhe[1],Now);
        os.Entregador :=  StrToIntDef(sDetalhe[3],1);
        os.Veiculo := StrToIntDef(sDetalhe[5],0);
        os.Rota := 'TRANSFERÊNCIA';
        os.KmInicial := StrToIntDef(sDetalhe[7],0);
        os.HoraSaida := sDetalhe[8];
        os.KmFinal := StrToIntDef(sDetalhe[9],0);
        os.HoraRetorno := sDetalhe[10];
        os.Descricao := '1|' + sDetalhe[6] + '|0|';
        os.ValorDiaria := 0;
        os.Fechado := 'N';
        os.DataPago := 0;
        os.Executor := uGlobais.sUsuario;
        os.Manutencao := Now;
        if not (os.Exist()) then
        begin
          if not (os.Insert()) then
          begin
            Application.MessageBox(PChar('Erro ao incluir OS do dia ' + sDetalhe[1]  + ' do veículo ' + sDetalhe[5] + '!'),
                                   PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
          end
          else
          begin
            km.Data := os.Data;
            veiculo.Codigo := os.Veiculo;
            km.Placa := veiculo.getField('DES_PLACA', 'CODIGO');
            km.KMInicial := os.KmInicial;
            km.HoraSaida := os.HoraSaida;
            km.KMFinal := os.KmFinal;
            km.HoraRetorno := os.HoraRetorno;
            km.Entregador := os.Entregador;
            km.Obs := 'Inclusão através de planilha de OS';
            km.Executor := uGlobais.sUsuario;
            km.Manutencao := Now;
            if not (km.Exist()) then
            begin
              if not (km.Insert()) then
              begin
                Application.MessageBox(PChar('Erro ao incluir KM do dia ' + sDetalhe[1]  + ' do veículo ' + km.Placa + '!'),
                                       PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
              end;
            end;
          end;
        end;
      end;
    end;
    Readln(ArquivoCSV, sLista);
    dPosicao := (Contador / LinhasTotal) * 100;
    Inc(Contador);
    frmProcesso.cxProgressBar1.Position := dPosicao;
    frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
    frmProcesso.cxProgressBar1.Refresh;
  end;
  Screen.Cursor := crDefault;
  frmProcesso.Close;
  FreeAndNil(frmProcesso);
  CloseFile(ArquivoCSV);
  sLista := '';
  FreeAndNil(sDetalhe);
  Application.MessageBox('Importação Concluída!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONINFORMATION);
end;

end.
