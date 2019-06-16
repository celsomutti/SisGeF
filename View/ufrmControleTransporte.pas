unit ufrmControleTransporte;

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
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxGroupBox, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxLabel, Data.DB, cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid,
  dxSkinsdxStatusBarPainter, dxStatusBar, cxTimeEdit, cxSpinEdit, Vcl.ActnList,
  Vcl.Menus, Vcl.StdCtrls, cxButtons,
  clRelatorioDiario, clDetalheTransporte, cxMemo, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, System.Actions, clAcessos,
  clConexao;

type
  TfrmControleTransporte = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxData: TcxDateEdit;
    cxLabel2: TcxLabel;
    cxOperacao: TcxComboBox;
    cxLabel3: TcxLabel;
    cxPlaca: TcxTextEdit;
    cxLabel4: TcxLabel;
    cxMotorista: TcxComboBox;
    cxLabel5: TcxLabel;
    dsProcedimento: TDataSource;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1SEQ_DETALHE: TcxGridDBColumn;
    cxGrid1DBTableView1DES_TRANSPORTE: TcxGridDBColumn;
    cxGrid1DBTableView1HOR_CHEGADA: TcxGridDBColumn;
    cxGrid1DBTableView1HOR_SAIDA: TcxGridDBColumn;
    cxGrid1DBTableView1DES_OBSERVACOES: TcxGridDBColumn;
    dxStatusBar1: TdxStatusBar;
    cxLabel6: TcxLabel;
    cxSaidaOrigem: TcxTimeEdit;
    aclControle: TActionList;
    actControleInclui: TAction;
    actControleLocalizar: TAction;
    actControleCancelar: TAction;
    actControleSalvar: TAction;
    actControleSair: TAction;
    actControleRelatorios: TAction;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxButton5: TcxButton;
    cxButton6: TcxButton;
    cxGrid1DBTableView1RecId: TcxGridDBColumn;
    cxLabel7: TcxLabel;
    cxChegadaFranquia: TcxTimeEdit;
    cxLabel8: TcxLabel;
    cxGrid1DBTableView1HOR_INICIO_CARGA: TcxGridDBColumn;
    cxGrid1DBTableView1HOR_TERMINO_CARGA: TcxGridDBColumn;
    cxRelatorio: TcxTextEdit;
    cxLabel27: TcxLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ListaMotorista;
    procedure ListaOperacoes;
    procedure actControleIncluiExecute(Sender: TObject);
    procedure Modo;
    procedure actControleCancelarExecute(Sender: TObject);
    procedure SetupClass;
    procedure cxGrid1DBTableView1Editing(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; var AAllow: Boolean);
    procedure LocalizarOperacao;
    procedure cxDataPropertiesChange(Sender: TObject);
    procedure cxOperacaoPropertiesChange(Sender: TObject);
    procedure cxPlacaPropertiesChange(Sender: TObject);
    procedure cxMotoristaPropertiesChange(Sender: TObject);
    procedure cxSaidaOrigemPropertiesChange(Sender: TObject);
    procedure PopulaProcedimento;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure actControleSairExecute(Sender: TObject);
    procedure actControleSalvarExecute(Sender: TObject);
    procedure cxSaidaOrigemPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure Localizar;
    procedure SetupDados;
    procedure actControleLocalizarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmControleTransporte: TfrmControleTransporte;
  relatorio: TRelatorioDiario;
  detalhe: TDetalheTransporte;
  sOperacao: String;
  acessos: TAcessos;
  conexao: TConexao;

implementation

{$R *.dfm}

uses
  udm, uGlobais, clUtil, ufrmLocalizar;

procedure TfrmControleTransporte.actControleCancelarExecute(Sender: TObject);
begin
  TUtil.LimparFields(Self);
  sOperacao := 'X';
  dm.tbProcedimentos.Close;
  Modo;
end;

procedure TfrmControleTransporte.actControleIncluiExecute(Sender: TObject);
begin
  TUtil.LimparFields(Self);
  sOperacao := 'I';
  dm.tbProcedimentos.Close;
  dm.tbProcedimentos.Open;
  Modo;
  cxData.SetFocus;
end;

procedure TfrmControleTransporte.actControleLocalizarExecute(Sender: TObject);
begin
  Localizar;
end;

procedure TfrmControleTransporte.actControleSairExecute(Sender: TObject);
begin
  frmControleTransporte.Close;
end;

procedure TfrmControleTransporte.actControleSalvarExecute(Sender: TObject);
begin
  if dsProcedimento.State in [dsInsert, dsEdit] then
  begin
    dm.tbProcedimentos.Post;
  end;
  SetupClass;
  if (not relatorio.Validar()) then
  begin
    Exit;
  end;
  if Application.MessageBox('Confirma salvar os dados?', 'Salvar',
    MB_ICONQUESTION + MB_YESNO) = IDNO then
  begin
    Exit;
  end;
  if sOperacao = 'I' then
  begin
    if (not relatorio.Insert()) then
    begin
      MessageDlg('Erro ao tentar incluir!', mtWarning, [mbOK], 0);
      Exit;
    end;
  end
  else
  begin
    if (not relatorio.Update()) then
    begin
      MessageDlg('Erro ao tentar alterar!', mtWarning, [mbOK], 0);
      Exit;
    end;
  end;
  if (not detalhe.Delete('RELATORIO')) then
  begin
    MessageDlg('Erro ao tentar excluir deltalhes!', mtWarning, [mbOK], 0);
    Exit;
  end;
  if (not dm.tbProcedimentos.IsEmpty) then
  begin
    dm.tbProcedimentos.First;
  end;
  while not dm.tbProcedimentos.Eof do
  begin
    detalhe.relatorio := relatorio.Sequencia;
    detalhe.Sequencia := dm.tbProcedimentos.RecIdField.Value;
    detalhe.detalhe := dm.tbProcedimentosDES_TRANSPORTE.Value;
    detalhe.Chegada := dm.tbProcedimentosHOR_CHEGADA.Value;
    detalhe.Saida := dm.tbProcedimentosHOR_SAIDA.Value;
    detalhe.Observacoes := dm.tbProcedimentosDES_OBSERVACOES.Value;
    detalhe.Usuario := uGlobais.sUsuario;
    detalhe.Registro := Now;
    if (not detalhe.Insert()) then
    begin
      MessageDlg('Erro ao tentar incluir o deltalhe ' +
        dm.tbProcedimentosSEQ_DETALHE.AsString + ' !', mtWarning, [mbOK], 0);
    end;
    dm.tbProcedimentos.Next;
  end;
end;

procedure TfrmControleTransporte.cxDataPropertiesChange(Sender: TObject);
begin
  if (not dm.tbProcedimentos.IsEmpty) then
  begin
    dm.tbProcedimentos.Close;
    dm.tbProcedimentos.Open;
  end;
  if sOperacao = 'X' then
  begin
    sOperacao := 'I';
    cxOperacao.ItemIndex := -1;
    cxRelatorio.Clear;
    cxPlaca.Clear;
    cxMotorista.ItemIndex := -1;
    dm.tbProcedimentos.Close;
    dm.tbProcedimentos.Open;
    Modo;
  end;

end;

procedure TfrmControleTransporte.cxGrid1DBTableView1Editing
  (Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  var AAllow: Boolean);
begin
  if TUtil.Empty(cxData.Text) then
  begin
    MessageDlg('Informe a Data da Operação!', mtWarning, [mbOK], 0);
    AAllow := False;
    dm.tbProcedimentos.Cancel;
    cxData.SetFocus;
    Exit;
  end;
  if TUtil.Empty(cxOperacao.Text) then
  begin
    MessageDlg('Informe o Tipo da Operação!', mtWarning, [mbOK], 0);
    AAllow := False;
    dm.tbProcedimentos.Cancel;
    cxOperacao.SetFocus;
    Exit;
  end;
  if TUtil.Empty(cxPlaca.Text) then
  begin
    MessageDlg('Informe a Placa do Veículo!', mtWarning, [mbOK], 0);
    AAllow := False;
    dm.tbProcedimentos.Cancel;
    cxPlaca.SetFocus;
    Exit;
  end;
  if TUtil.Empty(cxMotorista.Text) then
  begin
    MessageDlg('Informe o Motorista do Veículo!', mtWarning, [mbOK], 0);
    AAllow := False;
    dm.tbProcedimentos.Cancel;
    cxMotorista.SetFocus;
    Exit;
  end;
end;

procedure TfrmControleTransporte.cxMotoristaPropertiesChange(Sender: TObject);
begin
  if (not dm.tbProcedimentos.IsEmpty) then
  begin
    dm.tbProcedimentos.Close;
    dm.tbProcedimentos.Open;
  end;
  if sOperacao = 'X' then
  begin
    sOperacao := 'I';
    cxRelatorio.Clear;
    cxData.Clear;
    cxOperacao.ItemIndex := -1;
    cxPlaca.Clear;
    dm.tbProcedimentos.Close;
    dm.tbProcedimentos.Open;
    Modo;
  end;
end;

procedure TfrmControleTransporte.cxOperacaoPropertiesChange(Sender: TObject);
begin
  if (not dm.tbProcedimentos.IsEmpty) then
  begin
    dm.tbProcedimentos.Close;
    dm.tbProcedimentos.Open;
  end;
  if sOperacao = 'X' then
  begin
    sOperacao := 'I';
    cxRelatorio.Clear;
    cxData.Clear;
    cxPlaca.Clear;
    cxMotorista.ItemIndex := -1;
    dm.tbProcedimentos.Close;
    dm.tbProcedimentos.Open;
    Modo;
  end;
end;

procedure TfrmControleTransporte.cxPlacaPropertiesChange(Sender: TObject);
begin
  if (not dm.tbProcedimentos.IsEmpty) then
  begin
    dm.tbProcedimentos.Close;
    dm.tbProcedimentos.Open;
  end;
  if sOperacao = 'X' then
  begin
    sOperacao := 'I';
    cxRelatorio.Clear;
    cxData.Clear;
    cxOperacao.ItemIndex := -1;
    cxMotorista.ItemIndex := -1;
    dm.tbProcedimentos.Close;
    dm.tbProcedimentos.Open;
    Modo;
  end;
end;

procedure TfrmControleTransporte.cxSaidaOrigemPropertiesChange(Sender: TObject);
begin
  if (not dm.tbProcedimentos.IsEmpty) then
  begin
    dm.tbProcedimentos.Close;
    dm.tbProcedimentos.Open;
  end;
end;

procedure TfrmControleTransporte.cxSaidaOrigemPropertiesValidate
  (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  if (not TUtil.Empty(cxData.Text)) and (not TUtil.Empty(cxOperacao.Text)) and
    (not TUtil.Empty(cxPlaca.Text)) and (not TUtil.Empty(cxMotorista.Text)) then
  begin
    LocalizarOperacao;
  end;
end;

procedure TfrmControleTransporte.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dm.tbProcedimentos.Close;
  relatorio.Free;
  detalhe.Free;
  acessos.Free;
  conexao.Free;
  Action := caFree;
  frmControleTransporte := Nil
end;

procedure TfrmControleTransporte.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmControleTransporte.FormShow(Sender: TObject);
begin
  relatorio := TRelatorioDiario.Create();
  detalhe := TDetalheTransporte.Create();
  conexao := TConexao.Create;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    actControleSairExecute(Sender);
    Exit;
  end;
  ListaOperacoes;
  ListaMotorista;
  sOperacao := 'X';
  acessos := TAcessos.Create;
  Modo;
end;

procedure TfrmControleTransporte.ListaMotorista;
begin
  with dm.qryGeral do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT DISTINCT NOM_MOTORISTA FROM TBRELATORIODIARIO';
    dm.ZConn.PingServer;
    Open;
    if not(IsEmpty) then
    begin
      First;
    end;
    cxMotorista.Properties.Items.Clear;
    while not(Eof) do
    begin
      cxMotorista.Properties.Items.Add(FieldByName('NOM_MOTORISTA').AsString);
      Next;
    end;
    cxMotorista.ItemIndex := -1;
    Close;
    SQL.Clear;
  end;
end;

procedure TfrmControleTransporte.ListaOperacoes;
begin
  with dm.qryGeral do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT DISTINCT DES_OPERACAO FROM TBRELATORIODIARIO';
    dm.ZConn.PingServer;
    Open;
    if not(IsEmpty) then
    begin
      First;
    end;
    cxOperacao.Properties.Items.Clear;
    while not(Eof) do
    begin
      cxOperacao.Properties.Items.Add(FieldByName('DES_OPERACAO').AsString);
      Next;
    end;
    cxMotorista.ItemIndex := -1;
    Close;
    SQL.Clear;
  end;
end;

procedure TfrmControleTransporte.Modo;
begin
  if sOperacao = 'I' then
  begin
    actControleInclui.Enabled := False;
    actControleLocalizar.Enabled := False;
    actControleCancelar.Enabled := True;
    actControleSalvar.Enabled := True;
    actControleRelatorios.Enabled := False;
  end
  else if sOperacao = 'U' then
  begin
    actControleInclui.Enabled := True;
    actControleLocalizar.Enabled := True;
    actControleCancelar.Enabled := True;
    actControleSalvar.Enabled := True;
    actControleRelatorios.Enabled := False;
  end
  else if sOperacao = 'X' then
  begin
    actControleInclui.Enabled := True;
    actControleLocalizar.Enabled := True;
    actControleCancelar.Enabled := False;
    actControleSalvar.Enabled := False;
    actControleRelatorios.Enabled := True;
  end;
  acessos.SetNivel(aclControle);
end;

procedure TfrmControleTransporte.SetupClass;
begin
  if sOperacao = 'I' then
  begin
    relatorio.Sequencia := 0;
  end;
  relatorio.Data := cxData.Date;
  relatorio.Placa := cxPlaca.Text;
  relatorio.Motorista := cxMotorista.Text;
  relatorio.SaidaOrigem := 0;
  relatorio.ChegadaFranquia := 0;
  relatorio.SaidaFranquia := cxSaidaOrigem.Time;
  relatorio.Expedidores := 0;
  relatorio.DivergenciaPeso := 0;
  relatorio.DivergenciaAvaria := 0;
  relatorio.Observacoes := '';
  relatorio.Usuario := uGlobais.sNomeUsuario;
  relatorio.Registro := Now;
  relatorio.Operacao := cxOperacao.Text;
end;

procedure TfrmControleTransporte.LocalizarOperacao;
begin
  relatorio.Data := cxData.Date;
  relatorio.Operacao := cxOperacao.Text;
  relatorio.Placa := cxPlaca.Text;
  relatorio.Motorista := cxMotorista.Text;
  relatorio.SaidaFranquia := cxSaidaOrigem.Time;
  if (not relatorio.getObject('', 'CHAVE')) then
  begin
    if (not dm.tbProcedimentos.IsEmpty) then
    begin
      dm.tbProcedimentos.Close;
      dm.tbProcedimentos.Open;
    end;
    Exit;
  end;
  if sOperacao = 'I' then
  begin
    sOperacao := 'U';
  end;
  PopulaProcedimento;
end;

procedure TfrmControleTransporte.PopulaProcedimento;
var
  iRelatorio: Integer;
begin
  iRelatorio := 0;
  iRelatorio := relatorio.Sequencia;
  if (not detalhe.getObject(IntToStr(iRelatorio), 'RELATORIO')) then
  begin
    Exit;
  end;
  if dm.tbProcedimentos.Active then
  begin
    dm.tbProcedimentos.Close;
    dm.tbProcedimentos.Open;
  end;
  while not dm.qryGetObject.Eof do
  begin
    dm.tbProcedimentos.Insert;
    dm.tbProcedimentosSEQ_DETALHE.Value := dm.qryGetObject.FieldByName
      ('SEQ_DETALHE').AsInteger;
    dm.tbProcedimentosDES_TRANSPORTE.Value := dm.qryGetObject.FieldByName
      ('DES_TRANSPORTE').AsString;
    dm.tbProcedimentosHOR_CHEGADA.Value := dm.qryGetObject.FieldByName
      ('HOR_CHEGADA').AsDateTime;
    dm.tbProcedimentosHOR_SAIDA.Value := dm.qryGetObject.FieldByName
      ('HOR_SAIDA').AsDateTime;
    dm.tbProcedimentosDES_OBSERVACOES.Value := dm.qryGetObject.FieldByName
      ('DES_OBSERVACOES').AsString;
    dm.tbProcedimentos.Post;
    dm.qryGetObject.Next;
  end;
  dm.qryGetObject.Close;
  dm.qryGetObject.SQL.Clear;
  if (not dm.tbProcedimentos.IsEmpty) then
  begin
    dm.tbProcedimentos.First;
  end;
end;

procedure TfrmControleTransporte.Localizar;
begin
  with dm.qryPesquisa do
  begin
    Close;
    SQL.Clear;
    SQL.Text :=
      'SELECT DAT_RELATORIO AS "Data", DES_PLACA AS "Placa", DES_OPERACAO AS "Operação", '
      + 'NOM_MOTORISTA AS "Motorista", SEQ_RELATORIO AS "Código"  ' +
      'FROM TBRELATORIODIARIO ';
    SQL.Add('');
  end;
  if not Assigned(frmLocalizar) then
  begin
    frmLocalizar := TfrmLocalizar.Create(Application);
  end;
  frmLocalizar.cboCamposDisplay.Clear;
  frmLocalizar.cboCamposSQL.Clear;
  frmLocalizar.cboCamposDisplay.Items.Add('Data');
  frmLocalizar.cboCamposSQL.Items.Add('DAT_RELATORIO');
  frmLocalizar.cboCamposDisplay.Items.Add('Placa');
  frmLocalizar.cboCamposSQL.Items.Add('DES_PLACA');
  frmLocalizar.cboCamposDisplay.Items.Add('Operação');
  frmLocalizar.cboCamposSQL.Items.Add('DES_OPERACAO');
  frmLocalizar.cboCamposDisplay.Items.Add('Motorista');
  frmLocalizar.cboCamposSQL.Items.Add('NOM_MOTORISTA');
  frmLocalizar.cboCamposDisplay.Items.Add('Código');
  frmLocalizar.cboCamposSQL.Items.Add('SEQ_RELATORIO');

  frmLocalizar.cboCamposDisplay.ItemIndex := 0;
  frmLocalizar.cboCamposSQL.ItemIndex := 0;

  if frmLocalizar.ShowModal = mrOk then
  begin
    if relatorio.getObject(dm.qryPesquisa.Fields[4].AsString, 'SEQUENCIA') then
    begin
      TUtil.LimparFields(Self);
      SetupDados;
      PopulaProcedimento;
      sOperacao := 'U';
      Modo;
    end;
  end;
  FreeAndNil(frmLocalizar);
end;

procedure TfrmControleTransporte.SetupDados;
begin
  cxRelatorio.Text := IntToStr(relatorio.Sequencia);
  cxData.Date := relatorio.Data;
  cxOperacao.Text := relatorio.Operacao;
  cxPlaca.Text := relatorio.Placa;
  cxMotorista.Text := relatorio.Motorista;
  cxSaidaOrigem.Time := relatorio.SaidaFranquia;
end;

end.
