unit ufrmAbastecimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, clAbastecimentos, clAcessos,
  clEntregador, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans,
  dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, cxLabel, Data.DB,
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, System.Actions, Vcl.ActnList, cxMaskEdit,
  cxTextEdit, cxCalendar, cxCalc, cxImageComboBox, Vcl.Menus,
  Vcl.StdCtrls, cxButtons, cxButtonEdit, dxmdaset, cxDropDownEdit,
  dxLayoutContainer, cxGridInplaceEditForm, clVeiculos, clConexao, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmAbastecimentos = class(TForm)
    cxLabel27: TcxLabel;
    dsAbastecimentos: TDataSource;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1NUM_ABASTECIMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_CUPOM: TcxGridDBColumn;
    cxGrid1DBTableView1COD_ENTREGADOR: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_ENTREGADOR: TcxGridDBColumn;
    cxGrid1DBTableView1DES_PLACA: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_ABASTECIMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_PRODUTO: TcxGridDBColumn;
    cxGrid1DBTableView1QTD_ABASTECIMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_UNITARIO: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_TOTAL: TcxGridDBColumn;
    cxGrid1DBTableView1DOM_DESCONTO: TcxGridDBColumn;
    aclAbastecimento: TActionList;
    actAbastecimentoIncluir: TAction;
    actAbastecimentoEditar: TAction;
    actAbastecimentoExportar: TAction;
    actAbastecimentoSair: TAction;
    cxButton1: TcxButton;
    cxButton3: TcxButton;
    cxButton6: TcxButton;
    cxButton7: TcxButton;
    tbAbastecimentos: TdxMemData;
    tbAbastecimentosNUM_ABASTECIMENTO: TIntegerField;
    tbAbastecimentosNUM_CUPOM: TWideStringField;
    tbAbastecimentosCOD_ENTREGADOR: TIntegerField;
    tbAbastecimentosDES_PLACA: TWideStringField;
    tbAbastecimentosDAT_ABASTECIMENTO: TDateField;
    tbAbastecimentosDES_PRODUTO: TWideStringField;
    tbAbastecimentosQTD_ABASTECIMENTO: TFloatField;
    tbAbastecimentosVAL_UNITARIO: TFloatField;
    tbAbastecimentosVAL_TOTAL: TFloatField;
    tbAbastecimentosNOM_EXECUTANTE: TWideStringField;
    tbAbastecimentosDAT_MANUTENCAO: TDateTimeField;
    tbAbastecimentosDOM_DESCONTO: TWideStringField;
    tbAbastecimentosNUM_EXTRATO: TWideStringField;
    tbAbastecimentosVAL_VERBA_COMBUSTIVEL: TFloatField;
    tbAbastecimentosVAL_DESCONTO: TFloatField;
    tbAbastecimentosDAT_BASE: TDateField;
    tbAbastecimentosNOM_ENTREGADOR: TWideStringField;
    actAbastecimentoApoioEntregadores: TAction;
    actAbastecimentosApoioVeiculos: TAction;
    actAbastecimentoExcluir: TAction;
    cxButton2: TcxButton;
    procedure actAbastecimentoSairExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cxGrid1DBTableView1COD_ENTREGADORPropertiesValidate
      (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure actAbastecimentoIncluirExecute(Sender: TObject);
    procedure actAbastecimentoEditarExecute(Sender: TObject);
    procedure actAbastecimentoApoioEntregadoresExecute(Sender: TObject);
    procedure actAbastecimentosApoioVeiculosExecute(Sender: TObject);
    procedure tbAbastecimentosAfterCancel(DataSet: TDataSet);
    procedure tbAbastecimentosBeforeDelete(DataSet: TDataSet);
    procedure tbAbastecimentosBeforePost(DataSet: TDataSet);
    procedure tbAbastecimentosAfterPost(DataSet: TDataSet);
    procedure cxGrid1DBTableView1DES_PLACAPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure actAbastecimentoExcluirExecute(Sender: TObject);
    procedure tbAbastecimentosAfterDelete(DataSet: TDataSet);
  private
    { Private declarations }

    procedure Modo;
    procedure AtualizarGrade;
    procedure ListaEntregador;
    procedure ListaVeiculo;
    procedure SetupClass;

    function ValidaEntregador(sCodigo: String; var sMensagem: TCaption)
      : Boolean;
    function ValidarPlaca(sPlaca: String; var sMensagem: TCaption): Boolean;
  public
    { Public declarations }
    sOperacao: String;
    sId: String;
    sColuna: String;
  end;

var
  frmAbastecimentos: TfrmAbastecimentos;
  acessos: TAcessos;
  entregador: TEntregador;
  abastecimento: TAbastecimentos;
  veiculo: TVeiculos;
  conexao: TConexao;

implementation

{$R *.dfm}

uses clUtil, udm, ufrmListaApoio, uGlobais;

procedure TfrmAbastecimentos.actAbastecimentoApoioEntregadoresExecute
  (Sender: TObject);
begin
  ListaEntregador;
end;

procedure TfrmAbastecimentos.actAbastecimentoEditarExecute(Sender: TObject);
begin
  if tbAbastecimentos.IsEmpty then
  begin
    Exit;
  end;
  sOperacao := 'U';
  Modo;
  tbAbastecimentos.Edit;
  cxGrid1DBTableView1NUM_CUPOM.FocusWithSelection;
end;

procedure TfrmAbastecimentos.actAbastecimentoExcluirExecute(Sender: TObject);
begin
  if sOperacao <> 'S' then
  begin
    Exit;
  end;
  if tbAbastecimentos.IsEmpty then
  begin
    Exit;
  end;
  if tbAbastecimentosDOM_DESCONTO.Value = 'S' then
  begin
    Exit;
  end;
  tbAbastecimentos.Delete;
end;

procedure TfrmAbastecimentos.actAbastecimentoIncluirExecute(Sender: TObject);
begin
  sOperacao := 'I';
  Modo;
  tbAbastecimentos.Insert;
  cxGrid1DBTableView1.OptionsBehavior.FocusCellOnCycle := True;
  cxGrid1DBTableView1NUM_CUPOM.FocusWithSelection;
end;

procedure TfrmAbastecimentos.actAbastecimentoSairExecute(Sender: TObject);
begin
  try
    Perform(WM_CLOSE, 0, 0);
  except
    on E: Exception do
      MessageDlg(E.Message, mtError, mbOKCancel, 0);
  end;
end;

procedure TfrmAbastecimentos.actAbastecimentosApoioVeiculosExecute
  (Sender: TObject);
begin
  ListaVeiculo;
end;

procedure TfrmAbastecimentos.cxGrid1DBTableView1COD_ENTREGADORPropertiesValidate
  (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  if Pos(sOperacao, 'IU') > 0 then
  begin
    Error := (not ValidaEntregador(DisplayValue, ErrorText));
  end
  else if sOperacao = 'S' then
  begin
    sId := DisplayValue;
    sColuna := 'ENTREGADOR';
    // LocalizarAcareacao;
  end;
end;

procedure TfrmAbastecimentos.cxGrid1DBTableView1DES_PLACAPropertiesValidate
  (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  if Pos(sOperacao, 'IU') > 0 then
  begin
    Error := (not ValidarPlaca(DisplayValue, ErrorText));
  end;
end;

procedure TfrmAbastecimentos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tbAbastecimentos.Close;
  acessos.Free;
  entregador.Free;
  abastecimento.Free;
  veiculo.Free;
  conexao.Free;
  Action := caFree;
  frmAbastecimentos := Nil;
end;

procedure TfrmAbastecimentos.FormShow(Sender: TObject);
begin
  acessos := TAcessos.Create;
  entregador := TEntregador.Create;
  abastecimento := TAbastecimentos.Create;
  veiculo := TVeiculos.Create;
  conexao := TConexao.Create;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    actAbastecimentoSairExecute(Sender);
    Exit;
  end;
  AtualizarGrade;
  sId := '';
  sOperacao := 'S';
  Modo;
end;

procedure TfrmAbastecimentos.Modo;
begin
  if sOperacao = 'I' then
  begin
    actAbastecimentoIncluir.Enabled := False;
    actAbastecimentoExportar.Enabled := False;
    actAbastecimentoEditar.Enabled := False;
    actAbastecimentoExcluir.Enabled := False;
  end
  else if sOperacao = 'U' then
  begin
    actAbastecimentoIncluir.Enabled := False;
    actAbastecimentoExportar.Enabled := False;
    actAbastecimentoEditar.Enabled := False;
    actAbastecimentoExcluir.Enabled := False;
  end
  else if sOperacao = 'S' then
  begin
    actAbastecimentoIncluir.Enabled := True;
    actAbastecimentoExportar.Enabled := True;
    actAbastecimentoEditar.Enabled := True;
    actAbastecimentoExcluir.Enabled := True;
  end
  else
  begin
    actAbastecimentoIncluir.Enabled := True;
    actAbastecimentoExportar.Enabled := False;
    actAbastecimentoEditar.Enabled := False;
    actAbastecimentoExcluir.Enabled := False;
  end;
  acessos.SetNivel(aclAbastecimento);
end;

procedure TfrmAbastecimentos.tbAbastecimentosAfterCancel(DataSet: TDataSet);
begin
  sOperacao := 'S';
  Modo;
  AtualizarGrade;
end;

procedure TfrmAbastecimentos.tbAbastecimentosAfterDelete(DataSet: TDataSet);
begin
  abastecimento.Numero := StrToInt(sId);
  if not(abastecimento.Delete('NUMERO')) then
  begin
    Application.MessageBox('Erro ao excluir o cliente!', 'Atenção',
      MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
end;

procedure TfrmAbastecimentos.tbAbastecimentosAfterPost(DataSet: TDataSet);
begin
  if tbAbastecimentos.IsLoading then
  begin
    Exit;
  end;
  SetupClass;
  if (not abastecimento.Validar()) then
  begin
    sOperacao := 'S';
    Modo;
    AtualizarGrade;
  end;
  if sOperacao = 'I' then
  begin
    if (not abastecimento.Insert()) then
    begin
      Application.MessageBox('Erro ao tentar inserir os dados!', 'Erro.',
        MB_OK + MB_ICONERROR);
      sOperacao := 'S';
      Modo;
      AtualizarGrade;
      Exit;
    end;
  end
  else if sOperacao = 'U' then
  begin
    if (not abastecimento.Update()) then
    begin
      Application.MessageBox('Erro ao tentar gravar os dados!', 'Erro.',
        MB_OK + MB_ICONERROR);
      sOperacao := 'S';
      Modo;
      AtualizarGrade;
      Exit;
    end;
  end;
  sOperacao := 'S';
  Modo;
  tbAbastecimentos.IsLoading := True;
  tbAbastecimentos.Edit;
  tbAbastecimentosNUM_ABASTECIMENTO.Value := abastecimento.Numero;
  tbAbastecimentos.Post;
  tbAbastecimentos.IsLoading := False;
  // AtualizarGrade;
  cxGrid1DBTableView1.OptionsBehavior.FocusCellOnCycle := False;
  cxGrid1DBTableView1NUM_CUPOM.FocusWithSelection;
end;

procedure TfrmAbastecimentos.tbAbastecimentosBeforeDelete(DataSet: TDataSet);
begin
  if tbAbastecimentos.IsLoading then
  begin
    Exit;
  end;
  sId := cxGrid1DBTableView1NUM_ABASTECIMENTO.DataBinding.Field.Value;
  if Application.MessageBox('Confirma excluir o registro do Abastecimento?',
    'Excluir.', MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Abort;
    Exit;
  end;
end;

procedure TfrmAbastecimentos.tbAbastecimentosBeforePost(DataSet: TDataSet);
begin
  if tbAbastecimentos.IsLoading then
  begin
    Exit;
  end;
  if Application.MessageBox('Confirma Gravar o registro do Abastecimento?',
    'Gravar.', MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Abort;
    Exit;
  end;
end;

function TfrmAbastecimentos.ValidaEntregador(sCodigo: String;
  var sMensagem: TCaption): Boolean;
var
  sNome: String;
begin
  Result := False;
  if Pos(sOperacao, 'IU') > 0 then
  begin
    if (not entregador.getObject(sCodigo, 'CADASTRO')) then
    begin
      sMensagem := 'Cadastro não encontrado!';
      Exit;
    end;
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
    sNome := entregador.Nome;
    tbAbastecimentosCOD_ENTREGADOR.Value := StrToInt(sCodigo);
    tbAbastecimentosNOM_ENTREGADOR.Value := sNome;
  end;
  Result := True;
end;

procedure TfrmAbastecimentos.AtualizarGrade;
begin
  if tbAbastecimentos.Active then
  begin
    tbAbastecimentos.Close;
  end;
  tbAbastecimentos.Open;
  tbAbastecimentos.IsLoading := True;
  if abastecimento.getObjects() then
  begin
    tbAbastecimentos.LoadFromDataSet(dm.qryGetObject);
  end;
  tbAbastecimentos.IsLoading := False;
end;

procedure TfrmAbastecimentos.ListaEntregador;
var
  sId: String;
  i: Integer;
  bFlag: Boolean;
begin
  sId := '';
  Screen.Cursor := crHourGlass;
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
  frmListaApoio.Caption := 'Entregadores / Funcionários';
  Screen.Cursor := crDefault;
  i := 0;
  if frmListaApoio.ShowModal = mrOk then
  begin
    sId := dm.qryPesquisa.Fields[0].AsString;
    cxGrid1DBTableView1COD_ENTREGADOR.DataBinding.Field.Value := sId;
    cxGrid1DBTableView1NOM_ENTREGADOR.DataBinding.Field.Value :=
      dm.qryPesquisa.Fields[1].AsString;
    bFlag := True;
  end;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  FreeAndNil(frmListaApoio);
end;

procedure TfrmAbastecimentos.ListaVeiculo;
var
  sId: String;
begin
  if Pos(sOperacao, 'IU') = 0 then
  begin
    Exit;
  end;
  sId := '';
  Screen.Cursor := crHourGlass;
  with dm.qryPesquisa do
  begin
    Close;
    SQL.Clear;
    SQL.Text :=
      'SELECT tbveiculos.COD_VEICULO AS "Código", tbveiculos.DES_MARCA AS "Marca", tbveiculos.DES_MODELO AS "Modelo", '
      + 'tbveiculos.DES_PLACA AS "Placa", tbentregadores.DES_RAZAO_SOCIAL AS "Entregador/Motorista",  '
      + 'tbveiculos.COD_ENTREGADOR AS "Cód. Entregador"' +
      'FROM tbveiculos JOIN tbentregadores ON tbveiculos.COD_ENTREGADOR = tbentregadores.COD_CADASTRO';
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
    cxGrid1DBTableView1DES_PLACA.DataBinding.Field.Value :=
      dm.qryPesquisa.Fields[3].AsString;
    cxGrid1DBTableView1COD_ENTREGADOR.DataBinding.Field.Value :=
      dm.qryPesquisa.Fields[5].AsInteger;
    cxGrid1DBTableView1NOM_ENTREGADOR.DataBinding.Field.Value :=
      dm.qryPesquisa.Fields[4].AsString
  end;
  dm.tbApoio.Close;
  FreeAndNil(frmListaApoio);
end;

procedure TfrmAbastecimentos.SetupClass;
begin
  abastecimento.Numero := tbAbastecimentosNUM_ABASTECIMENTO.Value;
  abastecimento.Cupom := tbAbastecimentosNUM_CUPOM.Value;
  abastecimento.Placa := tbAbastecimentosDES_PLACA.Value;
  abastecimento.Data := tbAbastecimentosDAT_ABASTECIMENTO.Value;
  abastecimento.Produto := tbAbastecimentosDES_PRODUTO.Value;
  abastecimento.Quantidade := tbAbastecimentosQTD_ABASTECIMENTO.Value;
  abastecimento.Unitario := tbAbastecimentosVAL_UNITARIO.Value;
  abastecimento.Total := tbAbastecimentosVAL_TOTAL.Value;
  abastecimento.entregador := tbAbastecimentosCOD_ENTREGADOR.Value;
  abastecimento.Nome := tbAbastecimentosNOM_ENTREGADOR.Value;
  abastecimento.Descontado := tbAbastecimentosDOM_DESCONTO.Value;
  abastecimento.Executante := uGlobais.sUsuario;
  abastecimento.Manutencao := Now;
end;

function TfrmAbastecimentos.ValidarPlaca(sPlaca: string;
  var sMensagem: TCaption): Boolean;
begin
  Result := False;
  if Pos(sOperacao, 'IU') > 0 then
  begin
    if (not veiculo.getObject(sPlaca, 'PLACA')) then
    begin
      sMensagem := 'Veículo não encontrado!';
      Exit;
    end;
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
    entregador.Cadastro := veiculo.entregador;
    tbAbastecimentosDES_PLACA.Value := sPlaca;
    tbAbastecimentosCOD_ENTREGADOR.Value := entregador.Cadastro;
    tbAbastecimentosNOM_ENTREGADOR.Value :=
      entregador.getField('DES_RAZAO_SOCIAL', 'CADASTRO');
  end;
  Result := True;
end;

end.
