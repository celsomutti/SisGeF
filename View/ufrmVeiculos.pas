unit ufrmVeiculos;

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
   DB, dxmdaset, cxPC, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, clVeiculos, cxContainer,
  cxTextEdit, cxLabel, cxMaskEdit, cxDropDownEdit,
  cxButtonEdit, ActnList, Menus, StdCtrls, cxButtons, clEntregador,
  clAbastecimentos, cxGridExportLink, ShellAPI, cxNavigator,
  cxImage, Vcl.ExtCtrls, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  dxSkinsdxBarPainter, dxBar, cxGroupBox, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxCalendar, cxCheckBox, dxSkinsdxStatusBarPainter,
  dxStatusBar, clEnderecoEntregador, cxProgressBar,
  uthrPopularVeiculos, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, System.Actions, clAcessos, System.DateUtils, clConexao, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxDateRanges,
  cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TfrmVeiculos = class(TForm)
    ds: TDataSource;
    aclCadastro: TActionList;
    actCadastroExcluir: TAction;
    actCadastroCancelar: TAction;
    actCadastroListaApoio: TAction;
    actCadastroSalvar: TAction;
    actCadastroSair: TAction;
    actCadastroExportar: TAction;
    SaveDialog: TSaveDialog;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DES_MODELO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_PLACA: TcxGridDBColumn;
    cxGrid1DBTableView1DES_TIPO: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_CHASSIS: TcxGridDBColumn;
    cxGrid1DBTableView1DES_ANO: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_RENAVAN: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxBarButton1: TdxBarButton;
    actCadastroIncluir: TAction;
    actCadastroEditar: TAction;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    dxBarButton6: TdxBarButton;
    dxBarButton7: TdxBarButton;
    cxGrupo: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxCodigo: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxMarca: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxModelo: TcxTextEdit;
    cxLabel4: TcxLabel;
    cxPlaca: TcxTextEdit;
    cxLabel5: TcxLabel;
    cxTipo: TcxComboBox;
    cxLabel6: TcxLabel;
    cxChassi: TcxTextEdit;
    cxLabel7: TcxLabel;
    cxAno: TcxTextEdit;
    cxLabel8: TcxLabel;
    cxCor: TcxTextEdit;
    cxLabel9: TcxLabel;
    cxRenavan: TcxTextEdit;
    cxLabel10: TcxLabel;
    cxCodigoEntregador: TcxButtonEdit;
    cxNomeEntregador: TcxTextEdit;
    cxLabel11: TcxLabel;
    CXTipoDocumento: TcxComboBox;
    cxLabel12: TcxLabel;
    cxCPF: TcxMaskEdit;
    cxLabel13: TcxLabel;
    cxNome: TcxTextEdit;
    cxLabel36: TcxLabel;
    cxDataNascimento: TcxDateEdit;
    cxLabel41: TcxLabel;
    cxNomeMae: TcxTextEdit;
    cxLabel14: TcxLabel;
    cxRGIE: TcxTextEdit;
    cxLabel15: TcxLabel;
    cxDataEmissaoRG: TcxDateEdit;
    cxLabel16: TcxLabel;
    cxUFRG: TcxComboBox;
    cxLabel17: TcxLabel;
    cxLogradouro: TcxTextEdit;
    cxLabel20: TcxLabel;
    cxBairro: TcxTextEdit;
    cxLabel21: TcxLabel;
    cxCidade: TcxTextEdit;
    cxLabel22: TcxLabel;
    cxUF: TcxComboBox;
    cxLabel18: TcxLabel;
    cxCEP: TcxMaskEdit;
    cxLabel19: TcxLabel;
    cxTelefone1: TcxMaskEdit;
    cxContato1: TcxTextEdit;
    cxLabel23: TcxLabel;
    cxLabel24: TcxLabel;
    cxUFPlaca: TcxComboBox;
    cxLabel25: TcxLabel;
    cxCidadePlaca: TcxTextEdit;
    cxLabel26: TcxLabel;
    cxLicenciamento: TcxComboBox;
    cxRastreamento: TcxCheckBox;
    cxAbastecimento: TcxCheckBox;
    cxContato2: TcxTextEdit;
    cxTelefone2: TcxMaskEdit;
    dxStatusBar1: TdxStatusBar;
    dxStatusBar1Container0: TdxStatusBarContainerControl;
    cxManutencao: TcxTextEdit;
    cxGrid1DBTableView1NOM_PROPRIETARIO: TcxGridDBColumn;
    cxGrid1DBTableView1COD_VEICULO: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_CNPJ: TcxGridDBColumn;
    cxGrid1DBTableView1ANO_EXERCICIO_CLRV: TcxGridDBColumn;
    cxLabel27: TcxLabel;
    cxProgressBar: TcxProgressBar;
    cxGrid1DBTableView1DES_RAZAO_SOCIAL: TcxGridDBColumn;
    cxGrid1DBTableView1UF_PLACA: TcxGridDBColumn;
    cxLabel28: TcxLabel;
    cxNomePai: TcxTextEdit;
    procedure FormShow(Sender: TObject);
    procedure cxCodigoEntregadorPropertiesChange(Sender: TObject);
    procedure cxCodigoEntregadorPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure actCadastroListaApoioExecute(Sender: TObject);
    procedure actCadastroCancelarExecute(Sender: TObject);
    procedure actCadastroExcluirExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actCadastroSalvarExecute(Sender: TObject);
    procedure actCadastroSairExecute(Sender: TObject);
    procedure cxAnoKeyPress(Sender: TObject; var Key: Char);
    procedure cxRenavanKeyPress(Sender: TObject; var Key: Char);
    procedure actCadastroExportarExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cxGrid1DBTableView1CanFocusRecord(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; var AAllow: Boolean);
    procedure actCadastroIncluirExecute(Sender: TObject);
    procedure actCadastroEditarExecute(Sender: TObject);
    procedure cxCPFExit(Sender: TObject);
  private
    { Private declarations }
    procedure ListaEntregador;
    procedure PopulaLocais;
  public
    { Public declarations }
    procedure Modo;
    procedure SetupForm;
    procedure SetupClass;
    procedure AtualizarGrid;
    procedure ValidaCPFCNPJ;
    procedure LocalizaProprietario;
    procedure SalvaGrid;
  end;

var
  frmVeiculos: TfrmVeiculos;
  veiculo: TVeiculos;
  sOperacao: String;
  entregador: TEntregador;
  abastecimento: TAbastecimentos;
  endereco: TEnderecoEntregador;
  thrVeiculos: thrPopularVeiculos;
  acessos: TAcessos;
  conexao: TConexao;

implementation

{$R *.dfm}

uses
  udm, ufrmPrincipal, clUtil, Math, ufrmListaApoio, uGlobais;

procedure TfrmVeiculos.FormShow(Sender: TObject);
begin
  veiculo := TVeiculos.Create();
  entregador := TEntregador.Create();
  abastecimento := TAbastecimentos.Create();
  endereco := TEnderecoEntregador.Create();
  acessos := TAcessos.Create;
  conexao := TConexao.Create;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    actCadastroSairExecute(Sender);
    Exit;
  end;
  cxLicenciamento.Text := IntToStr(YearOf(Now) - 1);
  sOperacao := 'X';
  Modo;
  AtualizarGrid;
end;

procedure TfrmVeiculos.Modo;
begin
  if sOperacao = 'I' then
  begin
    actCadastroIncluir.Enabled := False;
    actCadastroEditar.Enabled := False;
    actCadastroExcluir.Enabled := False;
    actCadastroCancelar.Enabled := True;
    actCadastroSalvar.Enabled := True;
    cxGrupo.Enabled := True;
  end
  else if sOperacao = 'U' then
  begin
    actCadastroIncluir.Enabled := False;
    actCadastroEditar.Enabled := False;
    actCadastroExcluir.Enabled := False;
    actCadastroCancelar.Enabled := True;
    actCadastroSalvar.Enabled := True;
    cxGrupo.Enabled := True;
  end
  else
  begin
    actCadastroIncluir.Enabled := True;
    actCadastroEditar.Enabled := True;
    actCadastroExcluir.Enabled := True;
    actCadastroCancelar.Enabled := False;
    actCadastroSalvar.Enabled := False;
    cxGrupo.Enabled := False;
  end;
  acessos.SetNivel(aclCadastro);
end;

procedure TfrmVeiculos.SetupForm;
begin
  cxCodigo.Text := IntToStr(veiculo.Codigo);
  CXTipoDocumento.Text := veiculo.TipoDoc;
  cxCPF.Text := veiculo.CPF;
  cxNome.Text := veiculo.Nome;
  cxDataNascimento.Date := veiculo.DtNascimento;
  cxNomeMae.Text := veiculo.NomeMae;
  cxNomePai.Text := veiculo.NomePai;
  cxRGIE.Text := veiculo.RG;
  cxDataEmissaoRG.Date := veiculo.DataRG;
  cxUFRG.Text := veiculo.UFRG;
  cxLogradouro.Text := veiculo.endereco;
  cxCEP.Text := veiculo.CEP;
  cxBairro.Text := veiculo.Bairro;
  cxCidade.Text := veiculo.Cidade;
  cxUF.Text := veiculo.UF;
  cxTelefone1.Text := veiculo.Telefone1;
  cxContato1.Text := veiculo.Descricao1;
  cxTelefone2.Text := veiculo.Telefone2;
  cxContato2.Text := veiculo.Descricao2;
  cxCodigoEntregador.Text := IntToStr(veiculo.entregador);
  if veiculo.entregador > 0 then
  begin
    if entregador.getObject(IntToStr(veiculo.entregador), 'CADASTRO') then
    begin
      cxNomeEntregador.Text := entregador.Alias;
    end
    else
    begin
      cxNomeEntregador.Text := '---';
    end;
  end
  else
  begin
    cxNomeEntregador.Text := 'NÃO ATRIBUIDO';
  end;

  cxModelo.Text := veiculo.Modelo;
  cxMarca.Text := veiculo.Marca;
  cxPlaca.Text := veiculo.Placa;
  cxCidadePlaca.Text := veiculo.CidadePlaca;
  cxUFPlaca.Text := veiculo.UFPlaca;
  cxTipo.Text := veiculo.Tipo;
  cxChassi.Text := veiculo.Chassi;
  cxAno.Text := veiculo.Ano;
  cxCor.Text := veiculo.Cor;
  cxRenavan.Text := veiculo.Renavan;
  cxLicenciamento.Text := veiculo.Exercicio;
  if veiculo.Rastreado = 'S' then
  begin
    cxRastreamento.Checked := True;
  end
  else
  begin
    cxRastreamento.Checked := False;
  end;
  if veiculo.abastecimento = 'S' then
  begin
    cxAbastecimento.Checked := True;
  end
  else
  begin
    cxAbastecimento.Checked := False;
  end;
  cxManutencao.Text := 'Última atualização feita por ' + veiculo.Executor +
    ' em ' + FormatDateTime('dd/mm/yyyy "as" hh:mm:ss', veiculo.Manutencao);
  sOperacao := 'S';
end;

procedure TfrmVeiculos.cxCodigoEntregadorPropertiesChange(Sender: TObject);
begin
  cxNomeEntregador.Clear;
end;

procedure TfrmVeiculos.cxCodigoEntregadorPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if Pos(sOperacao, 'IU') = 0 then
  begin
    Exit;
  end;
  if TUtil.Empty(cxCodigoEntregador.Text) then
  begin
    Exit;
  end;
  if entregador.getObject(cxCodigoEntregador.Text, 'CADASTRO') then
  begin
    cxNomeEntregador.Text := entregador.Alias;
  end
  else
  begin
    cxNomeEntregador.Text := '- - -';
  end;
end;

procedure TfrmVeiculos.cxCPFExit(Sender: TObject);
begin
  if sOperacao = 'I' then
  begin
    ValidaCPFCNPJ;
  end;
end;

procedure TfrmVeiculos.cxGrid1DBTableView1CanFocusRecord
  (Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  var AAllow: Boolean);
var
  sCodigo: String;
begin
  if dm.tbVeiculos.Active then
  begin
    sCodigo := cxGrid1DBTableView1COD_VEICULO.DataBinding.Field.AsString;;
    if veiculo.getObject(sCodigo, 'CODIGO') then
    begin
      sOperacao := 'X';
      SetupForm;
      Modo;
    end;
  end;
end;

procedure TfrmVeiculos.actCadastroListaApoioExecute(Sender: TObject);
begin
  if cxCodigoEntregador.IsFocused then
  begin
    ListaEntregador;
  end;

end;

procedure TfrmVeiculos.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmVeiculos.actCadastroCancelarExecute(Sender: TObject);
begin
  sOperacao := 'X';
  Modo;
  TUtil.LimparFields(Self);
end;

procedure TfrmVeiculos.actCadastroEditarExecute(Sender: TObject);
begin
  if sOperacao <> 'S' then
  begin
    Exit;
  end;
  sOperacao := 'U';
  Modo;
end;

procedure TfrmVeiculos.actCadastroExcluirExecute(Sender: TObject);
begin
  if sOperacao <> 'S' then
  begin
    Exit;
  end;

  if Application.MessageBox('Confirma excluir este Veiculo?', 'Excluir Veículo',
    MB_ICONQUESTION + MB_YESNO) = idno then
  begin
    Exit;
  end;
  if abastecimento.getObject(veiculo.Placa, 'PLACA') then
  begin
    MessageDlg('Veiculo com abastecimento vinculado. Impossível Exluir!',
      mtError, [mbOK], 0);
    Exit;
  end;

  if veiculo.Delete('CODIGO') then
  begin
    MessageDlg('Registro Excluído.', mtInformation, [mbOK], 0);
    TUtil.LimparFields(Self);
    sOperacao := 'X';
    Modo;
    AtualizarGrid;
  end;

end;

procedure TfrmVeiculos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm.tbVeiculos.Close;
  veiculo.Free;
  entregador.Free;
  abastecimento.Free;
  endereco.Free;
  acessos.Free;
  conexao.Free;
  Action := caFree;
  frmVeiculos := Nil;
end;

procedure TfrmVeiculos.actCadastroSalvarExecute(Sender: TObject);
begin
  SetupClass;
  if not(veiculo.Validar()) then
    Exit;
  if sOperacao = 'I' then
  begin
    if not(TUtil.Empty(veiculo.Placa)) then
    begin
      if not(TUtil.Empty(veiculo.getField('DES_PLACA', 'PLACA'))) then
      begin
        MessageDlg('Placa já cadastrada!', mtWarning, [mbOK], 0);
        Exit;
      end;
    end;
    if not(TUtil.Empty(veiculo.Chassi)) then
    begin
      if not(TUtil.Empty(veiculo.getField('NUM_CHASSIS', 'CHASSI'))) then
      begin
        MessageDlg('Número de Chassis já cadastrado!', mtWarning, [mbOK], 0);
        Exit;
      end;
    end;
    if not(TUtil.Empty(veiculo.Renavan)) then
    begin
      if not(TUtil.Empty(veiculo.getField('NUM_RENAVAN', 'RENAVAN'))) then
      begin
        MessageDlg('Número de RENAVAN já cadastrado!', mtWarning, [mbOK], 0);
        Exit;
      end;
    end;
  end;
  if Application.MessageBox('Confirma salvar este Veiculo?', 'Salvar',
    MB_ICONQUESTION + MB_YESNO) = idno then
  begin
    Exit;
  end;
  if sOperacao = 'I' then
  begin
    if not(veiculo.Insert()) then
    begin
      MessageDlg('Não foi possível incluir este Veículo!', mtWarning,
        [mbOK], 0);
      Exit;
    end;
  end
  else
  begin
    if not(veiculo.Update()) then
    begin
      MessageDlg('Não foi possível alterar este Veículo!', mtWarning,
        [mbOK], 0);
      Exit;
    end;
  end;
  SalvaGrid;
  sOperacao := 'I';
  MessageDlg('Dados Salvos com Sucesso!', mtInformation, [mbOK], 0);
  TUtil.LimparFields(Self);
  Modo;
  cxMarca.SetFocus;
end;

procedure TfrmVeiculos.SetupClass;
begin
  if sOperacao = 'U' then
  begin
    veiculo.Codigo := StrToInt(cxCodigo.Text);
  end;
  veiculo.TipoDoc := CXTipoDocumento.Text;
  veiculo.CPF := cxCPF.Text;
  veiculo.Nome := cxNome.Text;
  if not(TUtil.Empty(cxDataNascimento.Text)) then
  begin
    veiculo.DtNascimento := cxDataNascimento.Date;
  end;
  veiculo.NomeMae := cxNomeMae.Text;
  veiculo.NomePai := cxNomePai.Text;
  veiculo.RG := cxRGIE.Text;
  if not(TUtil.Empty(cxDataEmissaoRG.Text)) then
  begin
    veiculo.DataRG := cxDataEmissaoRG.Date;
  end;
  veiculo.UFRG := cxUFRG.Text;
  veiculo.endereco := cxLogradouro.Text;
  veiculo.CEP := cxCEP.Text;
  veiculo.Bairro := cxBairro.Text;
  veiculo.Cidade := cxCidade.Text;
  veiculo.UF := cxUF.Text;
  veiculo.Telefone1 := cxTelefone1.Text;
  veiculo.Descricao1 := cxContato1.Text;
  veiculo.Telefone2 := cxTelefone2.Text;
  veiculo.Descricao2 := cxContato2.Text;
  veiculo.entregador := StrToInt(cxCodigoEntregador.Text);
  veiculo.Marca := cxMarca.Text;
  veiculo.Modelo := cxModelo.Text;
  veiculo.Placa := cxPlaca.Text;
  veiculo.UFPlaca := cxUFPlaca.Text;
  veiculo.CidadePlaca := cxCidadePlaca.Text;
  veiculo.Tipo := cxTipo.Text;
  veiculo.Chassi := cxChassi.Text;
  veiculo.Ano := cxAno.Text;
  veiculo.Cor := cxCor.Text;
  veiculo.Renavan := cxRenavan.Text;
  veiculo.Exercicio := cxLicenciamento.Text;
  if cxRastreamento.Checked then
  begin
    veiculo.Rastreado := 'S';
  end
  else
  begin
    veiculo.Rastreado := 'N';
  end;
  if cxAbastecimento.Checked then
  begin
    veiculo.abastecimento := 'S';
  end
  else
  begin
    veiculo.abastecimento := 'N';
  end;
  veiculo.Executor := uGlobais.sUsuario;
  veiculo.Manutencao := Now;
end;

procedure TfrmVeiculos.actCadastroSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmVeiculos.cxAnoKeyPress(Sender: TObject; var Key: Char);
begin
  Key := TUtil.SoNumero(Key);
end;

procedure TfrmVeiculos.cxRenavanKeyPress(Sender: TObject; var Key: Char);
begin
  Key := TUtil.SoNumero(Key);
end;

procedure TfrmVeiculos.AtualizarGrid;
begin
  ds.Enabled := False;
  thrVeiculos := thrPopularVeiculos.Create(True);
  thrVeiculos.FreeOnTerminate := True;
  thrVeiculos.Priority := tpNormal;
  thrVeiculos.Start;
end;

procedure TfrmVeiculos.actCadastroExportarExecute(Sender: TObject);
var
  FileExt: String;
begin
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

procedure TfrmVeiculos.actCadastroIncluirExecute(Sender: TObject);
begin
  TUtil.LimparFields(Self);
  sOperacao := 'I';
  Modo;
  CXTipoDocumento.SetFocus;
end;

procedure TfrmVeiculos.ListaEntregador;
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
    cxCodigoEntregador.Text := dm.qryPesquisa.Fields[0].AsString;
    cxCodigoEntregador.Refresh;
    cxNomeEntregador.Text := dm.qryPesquisa.Fields[1].AsString;
    cxNomeEntregador.Refresh;
  end;
  dm.tbApoio.Close;
  FreeAndNil(frmListaApoio);
end;

procedure TfrmVeiculos.ValidaCPFCNPJ;
begin
  if not(TUtil.Empty(cxCPF.Text)) then
  begin
    if CXTipoDocumento.Text = 'CPF' then
    begin
      if not(TUtil.CPF(cxCPF.Text)) then
      begin
        Application.MessageBox('CPF INVÁLIDO!', 'Atenção!',
          MB_OK + MB_ICONWARNING);
        Exit;
      end;
      cxCPF.Text := TUtil.FormataCPF(cxCPF.Text);
    end
    else
    begin
      if not(TUtil.CNPJ(cxCPF.Text)) then
      begin
        Application.MessageBox('CNPJ INVÁLIDO!', 'Atenção!',
          MB_OK + MB_ICONWARNING);
        Exit;
      end;
      cxCPF.Text := TUtil.FormataCNPJ(cxCPF.Text);
    end;
  end
  else
  begin
    Exit;
  end;
  LocalizaProprietario;
end;

procedure TfrmVeiculos.LocalizaProprietario;
begin
  if entregador.getObject(cxCPF.Text, 'CPF') then
  begin
    cxNome.Text := entregador.Nome;
    cxDataNascimento.Date := entregador.DtNascimento;
    cxNomeMae.Text := entregador.NomeMae;
    cxRGIE.Text := entregador.RG;
    cxDataEmissaoRG.Date := entregador.DataRG;
    cxUFRG.Text := entregador.UFRG;
    if endereco.getObject(IntToStr(entregador.Cadastro), 'CODIGO') then
    begin
      cxLogradouro.Text := endereco.endereco + ', ' + endereco.Numero;
      if not(TUtil.Empty(endereco.Complemento)) then
      begin
        cxLogradouro.Text := cxLogradouro.Text + '-' + endereco.Complemento;
      end;
      cxCEP.Text := endereco.CEP;
      cxBairro.Text := endereco.Bairro;
      cxUF.Text := endereco.UF;
      cxCidade.Text := endereco.Cidade;
    end;
  end;
end;

procedure TfrmVeiculos.SalvaGrid;
var
  sNome: String;
begin
  if sOperacao = 'I' then
  begin
    dm.tbVeiculos.Insert;
  end
  else
  begin
    dm.tbVeiculos.Edit;
  end;
  dm.tbVeiculosCOD_VEICULO.Value := veiculo.Codigo;
  dm.tbVeiculosDES_PLACA.Value := veiculo.Placa;
  dm.tbVeiculosNUM_CNPJ.Value := veiculo.CPF;
  dm.tbVeiculosNOM_PROPRIETARIO.Value := veiculo.Nome;
  if veiculo.entregador > 0 then
  begin
    entregador.Cadastro := veiculo.entregador;
    sNome := entregador.getField('DES_RAZAO_SOCIAL', 'CADASTRO');
  end
  else
  begin
    sNome := 'NÃO ATRIBUIDO';
  end;
  dm.tbVeiculosDES_RAZAO_SOCIAL.Value := sNome;
  dm.tbVeiculosDES_MODELO.Value := veiculo.Modelo;
  dm.tbVeiculosDES_TIPO.Value := veiculo.Tipo;
  dm.tbVeiculosNUM_CHASSIS.Value := veiculo.Chassi;
  dm.tbVeiculosDES_ANO.Value := veiculo.Ano;
  dm.tbVeiculosNUM_RENAVAN.Value := veiculo.Renavan;
  dm.tbVeiculosANO_EXERCICIO_CLRV.Value := veiculo.Exercicio;
  dm.tbVeiculos.Post;
  dm.tbVeiculos.Refresh;
end;

procedure TfrmVeiculos.PopulaLocais;
var
  sLocais: TStringList;
begin
  sLocais := TStringList.Create;
  sLocais := veiculo.PopulaLocal('BAIRRO');
  cxBairro.Properties.LookupItems.Clear;
  cxBairro.Properties.LookupItems.AddStrings(sLocais);
  sLocais.Clear;
  sLocais := veiculo.PopulaLocal('CIDADE');
  cxCidade.Properties.LookupItems.Clear;
  cxCidade.Properties.LookupItems.AddStrings(sLocais);
  sLocais.Clear;
  sLocais := veiculo.PopulaLocal('PLACA');
  cxCidadePlaca.Properties.LookupItems.Clear;
  cxCidadePlaca.Properties.LookupItems.AddStrings(sLocais);
  sLocais.Clear;
end;

end.
