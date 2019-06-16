unit ufrmEmpresas;

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
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxLabel, dxSkinsdxStatusBarPainter, dxSkinscxPCPainter, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, dxmdaset, cxPC, dxStatusBar, System.Actions, Vcl.ActnList,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxImageComboBox, cxMaskEdit, cxTextEdit, clEmpresas, cxGroupBox, cxDBEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxCalendar, cxMemo, cxDBNavigator, cxCheckBox, cxButtonEdit, clBancos, clEstados,
  clContatosEmpresas, clEmpresaContrato, clEnderecosEmpresas, clFinanceiroEmpresa, clTipoContrato;

type
  TfrmEmpresas = class(TForm)
    cxLabel27: TcxLabel;
    dxStatusBar1: TdxStatusBar;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    tbEmpresas: TdxMemData;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    tbEmpresasCOD_EMPRESA: TIntegerField;
    tbEmpresasDES_RAZAO_SOCIAL: TWideStringField;
    tbEmpresasNOM_FANTASIA: TWideStringField;
    tbEmpresasDES_TIPO_DOC: TWideStringField;
    tbEmpresasNUM_CNPJ: TWideStringField;
    tbEmpresasNUM_IE: TWideStringField;
    tbEmpresasNUM_IEST: TWideStringField;
    tbEmpresasNUM_IM: TWideStringField;
    tbEmpresasCOD_CNAE: TWideStringField;
    tbEmpresasCOD_CRT: TIntegerField;
    tbEmpresasDES_OBSERVACAO: TWideMemoField;
    tbEmpresasDAT_CADASTRO: TDateField;
    tbEmpresasNOM_USUARIO: TWideStringField;
    tbEmpresasDAT_MANUTENCAO: TDateTimeField;
    dsEmpresas: TDataSource;
    cxGrid1DBTableView1COD_EMPRESA: TcxGridDBColumn;
    cxGrid1DBTableView1DES_RAZAO_SOCIAL: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_FANTASIA: TcxGridDBColumn;
    cxGrid1DBTableView1DES_TIPO_DOC: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_CNPJ: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_IE: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_IEST: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_IM: TcxGridDBColumn;
    cxGrid1DBTableView1COD_CNAE: TcxGridDBColumn;
    cxGrid1DBTableView1COD_CRT: TcxGridDBColumn;
    cxGrid1DBTableView1COD_STATUS: TcxGridDBColumn;
    cxGrid1DBTableView1DES_OBSERVACAO: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_CADASTRO: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_USUARIO: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_MANUTENCAO: TcxGridDBColumn;
    aclEmpresas: TActionList;
    actIncluir: TAction;
    actExcluir: TAction;
    aclLocalizar: TAction;
    actFiltro: TAction;
    actSelecionar: TAction;
    actExportar: TAction;
    actSair: TAction;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxButton5: TcxButton;
    cxButton6: TcxButton;
    cxButton7: TcxButton;
    actGravar: TAction;
    actCancelar: TAction;
    actRetornar: TAction;
    actEditar: TAction;
    cxTabSheet2: TcxTabSheet;
    tbEnderecos: TdxMemData;
    tbEnderecosCOD_EMPRESA: TIntegerField;
    tbEnderecosSEQ_ENDERECO: TIntegerField;
    tbEnderecosDES_TIPO: TWideStringField;
    tbEnderecosDES_LOGRADOURO: TWideStringField;
    tbEnderecosNUM_LOGRADOURO: TWideStringField;
    tbEnderecosDES_COMPLEMENTO: TWideStringField;
    tbEnderecosDOM_CORRESPONDENCIA: TIntegerField;
    tbEnderecosDES_BAIRRO: TWideStringField;
    tbEnderecosNOM_CIDADE: TWideStringField;
    tbEnderecosUF_ESTADO: TWideStringField;
    tbEnderecosNUM_CEP: TWideStringField;
    tbEnderecosDES_REFERENCIA: TWideStringField;
    tbContatos: TdxMemData;
    tbContatosCOD_EMPRESA: TIntegerField;
    tbContatosSEQ_CONTATO: TIntegerField;
    tbContatosDES_CONTATO: TWideStringField;
    tbContatosNUM_TELEFONE: TWideStringField;
    tbContatosDES_EMAIL: TWideStringField;
    tbContatosDOM_PADRAO: TWideStringField;
    tbFinanceiro: TdxMemData;
    tbFinanceiroCOD_EMPRESA: TIntegerField;
    tbFinanceiroSEQ_FINANCEIRO: TIntegerField;
    tbFinanceiroDES_TIPO_CONTA: TWideStringField;
    tbFinanceiroCOD_BANCO: TWideStringField;
    tbFinanceiroCOD_AGENCIA: TWideStringField;
    tbFinanceiroNUM_CONTA: TWideStringField;
    tbFinanceiroNOM_FAVORECIDO: TWideStringField;
    tbFinanceiroNUM_CPF_CNPJ: TWideStringField;
    tbFinanceiroDES_FORMA_PAGAMENTO: TWideStringField;
    tbFinanceiroDOM_PADRAO: TWideStringField;
    tbContratos: TdxMemData;
    tbContratosCOD_EMPRESA: TIntegerField;
    tbContratosSEQ_CONTRATO: TIntegerField;
    tbContratosDAT_INICIO_CONTRATO: TDateField;
    tbContratosDAT_TERMINO_CONTRATO: TDateField;
    tbContratosCOD_TIPO_CONTRATO: TIntegerField;
    dsEnderecos: TDataSource;
    dsContatos: TDataSource;
    dsFinanceiro: TDataSource;
    dsContratos: TDataSource;
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxCodigo: TcxDBMaskEdit;
    cxLabel2: TcxLabel;
    cxDocumento: TcxDBComboBox;
    cxLabel3: TcxLabel;
    cxCNPJCPF: TcxDBMaskEdit;
    cxLabel4: TcxLabel;
    cxIERG: TcxDBMaskEdit;
    cxLabel5: TcxLabel;
    cxRazaoSocial: TcxDBTextEdit;
    cxLabel6: TcxLabel;
    cxNomeFantasia: TcxDBTextEdit;
    cxLabel7: TcxLabel;
    cxIEST: TcxDBMaskEdit;
    cxLabel8: TcxLabel;
    cxIM: TcxDBMaskEdit;
    cxLabel9: TcxLabel;
    cxCNAE: TcxDBMaskEdit;
    cxLabel10: TcxLabel;
    cxCRT: TcxDBLookupComboBox;
    dsCRT: TDataSource;
    cxLabel11: TcxLabel;
    cxCadastro: TcxDBDateEdit;
    cxLabel12: TcxLabel;
    cxObservacoes: TcxDBMemo;
    cxLabel13: TcxLabel;
    cxLabel14: TcxLabel;
    cxUsuario: TcxDBTextEdit;
    cxData: TcxDBTextEdit;
    cxGroupBox2: TcxGroupBox;
    cxLabel15: TcxLabel;
    cxTipoEndereço: TcxDBComboBox;
    cxLabel16: TcxLabel;
    cxCEP: TcxDBMaskEdit;
    cxDBNavigator1: TcxDBNavigator;
    cxLabel17: TcxLabel;
    cxEndereco: TcxDBTextEdit;
    cxLabel18: TcxLabel;
    cxNumero: TcxDBTextEdit;
    cxLabel19: TcxLabel;
    cxComplemento: TcxDBTextEdit;
    cxLabel20: TcxLabel;
    cxBairro: TcxDBTextEdit;
    cxLabel21: TcxLabel;
    cxCidade: TcxDBTextEdit;
    cxLabel22: TcxLabel;
    cxLabel23: TcxLabel;
    cxReferencia: TcxDBTextEdit;
    cxDBCheckBox1: TcxDBCheckBox;
    cxGroupBox3: TcxGroupBox;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1RecId: TcxGridDBColumn;
    cxGrid2DBTableView1COD_EMPRESA: TcxGridDBColumn;
    cxGrid2DBTableView1SEQ_CONTATO: TcxGridDBColumn;
    cxGrid2DBTableView1DES_CONTATO: TcxGridDBColumn;
    cxGrid2DBTableView1NUM_TELEFONE: TcxGridDBColumn;
    cxGrid2DBTableView1DES_EMAIL: TcxGridDBColumn;
    cxGrid2DBTableView1DOM_PADRAO: TcxGridDBColumn;
    cxGroupBox4: TcxGroupBox;
    dsEstados: TDataSource;
    cxUF: TcxDBLookupComboBox;
    cxLabel24: TcxLabel;
    cxTipoConta: TcxDBComboBox;
    cxLabel25: TcxLabel;
    cxBancos: TcxDBLookupComboBox;
    dsBancos: TDataSource;
    cxLabel26: TcxLabel;
    cxAgencia: TcxDBTextEdit;
    cxLabel28: TcxLabel;
    cxConta: TcxDBTextEdit;
    cxLabel29: TcxLabel;
    cxFavorecido: TcxDBButtonEdit;
    cxLabel30: TcxLabel;
    cxCNPJCPFFavorecido: TcxDBMaskEdit;
    cxLabel31: TcxLabel;
    cxFormaPagamento: TcxDBComboBox;
    cxDBCheckBox2: TcxDBCheckBox;
    cxDBNavigator3: TcxDBNavigator;
    cxGroupBox5: TcxGroupBox;
    cxGrid3: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGridDBTableView1RecId: TcxGridDBColumn;
    cxGridDBTableView1COD_EMPRESA: TcxGridDBColumn;
    cxGridDBTableView1SEQ_CONTRATO: TcxGridDBColumn;
    cxGridDBTableView1DAT_INICIO_CONTRATO: TcxGridDBColumn;
    cxGridDBTableView1DAT_TERMINO_CONTRATO: TcxGridDBColumn;
    cxGridDBTableView1COD_TIPO_CONTRATO: TcxGridDBColumn;
    dsTipoContratos: TDataSource;
    cxButton20: TcxButton;
    cxButton21: TcxButton;
    cxButton22: TcxButton;
    cxButton23: TcxButton;
    tbEmpresasCOD_STATUS: TStringField;
    cxDBImageComboBox1: TcxDBImageComboBox;
    procedure aclLocalizarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actSairExecute(Sender: TObject);
    procedure dsEmpresasStateChange(Sender: TObject);
    procedure cxGrid1DBTableView1CanFocusRecord(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; var AAllow: Boolean);
    procedure actIncluirExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure actFiltroExecute(Sender: TObject);
    procedure actSelecionarExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actRetornarExecute(Sender: TObject);
    procedure cxCNPJCPFPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxCNPJCPFExit(Sender: TObject);
    procedure cxDocumentoPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cxFavorecidoPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure cxCNPJCPFFavorecidoExit(Sender: TObject);
    procedure actGravarExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    procedure PopulaEmpresas; { Private declarations }
    procedure FiltrarDados;
    procedure PopulaBancos;
    procedure PopulaEstados;
    procedure PopulaEnderecos;
    procedure PopulaContatos;
    procedure PopulaFinanceiro;
    procedure PopulaContratos;
    procedure PopulaTiposContratos;
    procedure PopulaFavorecido;
    procedure SetupEmpresas;
    procedure SetupEnderecos;
    procedure SetupContatos;
    procedure SetupFinanceiro;
    procedure SetupContratos;
    procedure SalvarDados;
    procedure TodasEmpresas;

    function VerificaDados(): Boolean;
    { Private declarations }
  end;

var
  frmEmpresas: TfrmEmpresas;
  sOperacao: String;
  empresas: TEmpresas;
  bancos: TBancos;
  estados: TEstados;
  enderecos: TEndrecosEmpresa;
  contatos: TContatosEmpresas;
  contratos: TEmpresaContrato;
  tipocontrato: TTipoContrato;
  financeiro: TFinanceiroEmpresa;
  sId: String;
  sColuna: String;
implementation

{$R *.dfm}

uses udm, ufrmFiltro, uGlobais, clUtil;

procedure TfrmEmpresas.aclLocalizarExecute(Sender: TObject);
begin
  cxGrid1DBTableView1.FilterRow.Visible := True;
end;

procedure TfrmEmpresas.actCancelarExecute(Sender: TObject);
begin
  if dsEmpresas.State in [dsInsert, dsEdit] then
  begin
    tbEmpresas.Cancel;
    cxPageControl1.ActivePageIndex := 0;
  end;
end;

procedure TfrmEmpresas.actEditarExecute(Sender: TObject);
begin
  tbEmpresas.Edit;
  cxDocumento.SetFocus;
end;

procedure TfrmEmpresas.actFiltroExecute(Sender: TObject);
begin
  FiltrarDados;
end;

procedure TfrmEmpresas.actGravarExecute(Sender: TObject);
begin
  if (not VerificaDados) then
  begin
    Exit;
  end;

end;

procedure TfrmEmpresas.actIncluirExecute(Sender: TObject);
begin
  cxPageControl1.ActivePageIndex := 1;
  tbEmpresas.Insert;
  tbEmpresasDAT_CADASTRO.AsDateTime := Now;
  cxDocumento.SetFocus;
end;

procedure TfrmEmpresas.actRetornarExecute(Sender: TObject);
begin
  cxPageControl1.ActivePageIndex := 0;
end;

procedure TfrmEmpresas.actSairExecute(Sender: TObject);
begin
  try
    Perform(WM_CLOSE, 0, 0);
  except
    on E: Exception do
      MessageDlg(E.Message, mtError, mbOKCancel, 0);
  end;
end;

procedure TfrmEmpresas.actSelecionarExecute(Sender: TObject);
begin
  if (not tbEmpresas.IsEmpty) then
  begin
    SetupEmpresas;
    PopulaEnderecos;
    PopulaContatos;
    PopulaFinanceiro;
    PopulaContratos;
    cxPageControl1.ActivePageIndex := 1;
  end;
end;

procedure TfrmEmpresas.cxCNPJCPFExit(Sender: TObject);
begin
  if cxDocumento.Text = 'CNPJ' then
  begin
    tbEmpresasNUM_CNPJ.AsString := TUtil.FormataCNPJ(TcxDBMaskEdit(Sender).Text);
  end
  else if cxDocumento.Text = 'CPF' then
  begin
    tbEmpresasNUM_CNPJ.AsString := TUtil.FormataCPF(TcxDBMaskEdit(Sender).Text);
  end;
end;

procedure TfrmEmpresas.cxCNPJCPFFavorecidoExit(Sender: TObject);
begin
  if TUtil.CNPJ(TcxDBMaskEdit(Sender).Text) then
  begin
    tbFinanceiroNUM_CPF_CNPJ.AsString := TUtil.FormataCNPJ(TcxDBMaskEdit(Sender).Text);
  end
  else if TUtil.CPF(TcxDBMaskEdit(Sender).Text) then
  begin
    tbFinanceiroNUM_CPF_CNPJ.AsString := TUtil.FormataCPF(TcxDBMaskEdit(Sender).Text);
  end;
end;

procedure TfrmEmpresas.cxCNPJCPFPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
  sResult : String;
begin
  if dsEmpresas.State = dsInsert then
  begin
    if (not VarToStr(DisplayValue).IsEmpty) then
    begin
      if cxDocumento.Text = '' then
      begin
        ErrorText := 'Informe o tipo de documento!';
        Error := True;
        Exit;
      end;
    end
    else
    begin
      if cxDocumento.Text = '' then
      begin
        Exit;
      end
      else
      begin
        ErrorText := 'Informe o CNPJ ou o CPF!!';
        Error := True;
        Exit;
      end;
    end;
    empresas.TipoDoc := cxDocumento.Text;
    if empresas.TipoDoc = 'CNPJ' then
    begin
      sResult := TUtil.FormataCNPJ(DisplayValue);
    end
    else
    begin
      sResult := TUtil.FormataCPF(DisplayValue);
    end;
    empresas.Cnpj := sResult;
    if empresas.TipoDoc = 'CNPJ' then
    begin
      if (not TUtil.CNPJ(sResult)) then
      begin
        ErrorText := 'CNPJ Incorreto!!';
        Error := True;
        Exit;
      end;
    end
    else
    begin
      if (not TUtil.CPF(sResult)) then
      begin
        ErrorText := 'CPF Incorreto!!';
        Error := True;
        Exit;
      end;
    end;
    if empresas.Exist('CNPJ') then begin
      ErrorText := 'CNPJ ou CPF já cadastrado!';
      Error := True;
      Exit;
    end;
  end;
end;

procedure TfrmEmpresas.cxDocumentoPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  if dsEmpresas.State = dsInsert then
  begin
    if VarToStr(DisplayValue).IsEmpty then
    begin
      ErrorText := 'Informe o Tipo de Documento!';
      Error := True;
    end;
  end;
end;

procedure TfrmEmpresas.cxFavorecidoPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  PopulaFavorecido;
end;

procedure TfrmEmpresas.cxGrid1DBTableView1CanFocusRecord(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  var AAllow: Boolean);
begin
  cxGrid1DBTableView1.FilterRow.Visible := False;
end;

procedure TfrmEmpresas.dsEmpresasStateChange(Sender: TObject);
begin
  if TDataSource(Sender).DataSet.State in [dsInsert, dsEdit] then
  begin
    actIncluir.Enabled := False;
    actExcluir.Enabled := False;
    actFiltro.Enabled := False;
    actSelecionar.Enabled := False;
    actExportar.Enabled := False;
    actSair.Enabled := True;
    actGravar.Enabled := True;
    actCancelar.Enabled := True;
    actEditar.Enabled := False;
    actRetornar.Enabled := False;
    cxGrid1DBTableView1.FilterRow.Visible := False;
    dsEnderecos.AutoEdit := True;
    dsContatos.AutoEdit := True;
    dsFinanceiro.AutoEdit := True;
    if TDataSource(Sender).DataSet.State in [dsEdit] then
    begin
      cxTipoEndereço.Properties.ReadOnly := True;
      cxCNPJCPF.Properties.ReadOnly := True;
    end
    else begin
      cxTipoEndereço.Properties.ReadOnly := False;
      cxCNPJCPF.Properties.ReadOnly := False;
    end;
  end
  else if TDataSource(Sender).DataSet.State in [dsBrowse] then
  begin
    actIncluir.Enabled := True;
    actExcluir.Enabled := True;
    actFiltro.Enabled := True;
    actSelecionar.Enabled := True;
    actExportar.Enabled := True;
    actSair.Enabled := True;
    actGravar.Enabled := False;
    actCancelar.Enabled := False;
    actEditar.Enabled := True;
    actRetornar.Enabled := True;
    dsEnderecos.AutoEdit := False;
    dsContatos.AutoEdit := False;
    dsFinanceiro.AutoEdit := False;
    cxGrid1DBTableView1.FilterRow.Visible := False;
  end;
end;

procedure TfrmEmpresas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tbEmpresas.Close;
  tbEnderecos.Close;
  tbContatos.Close;
  tbFinanceiro.Close;
  tbContratos.Close;
  dm.tbContratos.Close;
  dm.tbBancos.Close;
  dm.tbEstados.Close;
  dm.tbCRT.Close;
  empresas.Free;
  enderecos.Free;
  contatos.Free;
  financeiro.Free;
  contratos.Free;
  tipocontrato.Free;
  bancos.Free;
  estados.Free;
  Action := caFree;
  frmEmpresas := Nil;
end;

procedure TfrmEmpresas.FormKeyPress(Sender: TObject; var Key: Char);
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
    if cxGrid3.IsFocused then
    begin
      Exit;
    end;
    if cxObservacoes.IsFocused then
    begin
      Exit;
    end;
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfrmEmpresas.FormShow(Sender: TObject);
begin
  empresas := TEmpresas.Create;
  enderecos := TEndrecosEmpresa.Create;
  contatos := TContatosEmpresas.Create;
  contratos := TEmpresaContrato.Create;
  financeiro := TFinanceiroEmpresa.Create;
  tipocontrato := TTipoContrato.Create;
  bancos := TBancos.Create;
  estados := TEstados.Create;
  tbEmpresas.Open;
  tbEnderecos.Open;
  tbContatos.Open;
  tbFinanceiro.Open;
  tbContratos.Open;
  PopulaBancos;
  PopulaEstados;
  PopulaTiposContratos;
  dm.tbCRT.Open;
end;


procedure TfrmEmpresas.PopulaEmpresas;
begin
  if (not dm.qryGetObject.IsEmpty) then
  begin
    tbEmpresas.Close;
    tbEmpresas.Open;
    tbEmpresas.LoadFromDataSet(dm.qryGetObject);
    if (not tbEmpresas.IsEmpty) then
    begin
      tbEmpresas.First;
    end;
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
  end;
end;

procedure TfrmEmpresas.FiltrarDados;
var
  i: Integer;
  sFiltro: String;
begin
  if not Assigned(frmFiltro) then
  begin
    frmFiltro := TfrmFiltro.Create(Application);
  end;
  for i := 0 to cxGrid1DBTableView1.ColumnCount - 1 do
  begin
    if (cxGrid1DBTableView1.Columns[i].Visible) and
      (cxGrid1DBTableView1.Columns[i].Tag >= 0) then
    begin
      frmFiltro.slCampos.Add(cxGrid1DBTableView1.Columns[i].Caption);
      frmFiltro.slSQL.Add(cxGrid1DBTableView1.Columns[i].DataBinding.FieldName);
      frmFiltro.slValores.Add(cxGrid1DBTableView1.Columns[i]
        .DataBinding.ValueType);
    end;
  end;
  if frmFiltro.ShowModal = mrCancel then
  begin
    FreeAndNil(frmFiltro);
    Exit;
  end;
  sFiltro := '';
  i := 0;
  for i := 0 to frmFiltro.slSQLFil.Count - 1 do
  begin
    sFiltro := sFiltro + frmFiltro.slSQLFil[i];
  end;
  sId := sFiltro;
  sColuna := 'FILTRO';
  FreeAndNil(frmFiltro);
  if (not empresas.getObject(sId, sColuna)) then
  begin
    Application.MessageBox('Nenhuma Empresa encontrada!', 'Atenção!', MB_OK + MB_ICONINFORMATION);
    sOperacao := 'X';
    Exit;
  end
  else
  begin
    PopulaEmpresas;
    sOperacao := 'U';
  end;
end;

procedure TfrmEmpresas.PopulaBancos;
begin
  if dm.tbBancos.Active then
  begin
    dm.tbBancos.Close;
  end;
  dm.tbBancos.Open;
  if bancos.getObjects then
  begin
    dm.tbBancos.LoadFromDataSet(dm.qryGetObject);
  end;
  dm.qryGetObject.Close;
  dm.qryGetObject.SQL.Clear;
end;

procedure TfrmEmpresas.PopulaEstados;
begin
  if dm.tbEstados.Active then
  begin
    if (not dm.tbEstados.IsEmpty) then
    begin
      Exit;
    end;
    dm.tbEstados.Close;
  end;
  dm.tbEstados.Open;
  if estados.getObjects then
  begin
    dm.tbEstados.LoadFromDataSet(dm.qryGetObject);
  end;
  dm.qryGetObject.Close;
  dm.qryGetObject.SQL.Clear;
end;

procedure TfrmEmpresas.PopulaEnderecos;
begin
  if tbEnderecos.Active then
  begin
    tbEnderecos.Close;
  end;
  tbEnderecos.Open;
  if (not enderecos.getObject(IntToStr(empresas.Codigo),'CODIGO')) then
  begin
    Exit;
  end;
  tbEnderecos.LoadFromDataSet(dm.qryGetObject);
  if (not tbEnderecos.IsEmpty) then
  begin
    tbEnderecos.First;
  end;
  dm.qryGetObject.Close;
  dm.qryGetObject.SQL.Clear;
end;

procedure TfrmEmpresas.PopulaContatos;
begin
  if tbContatos.Active then
  begin
    tbContatos.Close;
  end;
  tbContatos.Open;
  if (not contatos.getObject(IntToStr(empresas.Codigo),'CODIGO')) then
  begin
    Exit;
  end;
  tbContatos.LoadFromDataSet(dm.qryGetObject);
  if (not tbContatos.IsEmpty) then
  begin
    tbContatos.First;
  end;
  dm.qryGetObject.Close;
  dm.qryGetObject.SQL.Clear;
end;

procedure TfrmEmpresas.PopulaFinanceiro;
begin
  if tbFinanceiro.Active then
  begin
    tbFinanceiro.Close;
  end;
  tbFinanceiro.Open;
  if (not financeiro.getObject(IntToStr(empresas.Codigo),'CODIGO')) then
  begin
    Exit;
  end;
  tbFinanceiro.LoadFromDataSet(dm.qryGetObject);
  if (not tbFinanceiro.IsEmpty) then
  begin
    tbFinanceiro.First;
  end;
  dm.qryGetObject.Close;
  dm.qryGetObject.SQL.Clear;
end;

procedure TfrmEmpresas.PopulaContratos;
begin
  if tbContratos.Active then
  begin
    tbContratos.Close;
  end;
  tbContratos.Open;
  if (not contratos.getObject(IntToStr(empresas.Codigo),'CODIGO')) then
  begin
    Exit;
  end;
  dm.qryGetObject.First;
  while (not dm.qryGetObject.Eof) do
  begin
    tbContratos.Insert;
    tbContratosCOD_EMPRESA.Value := dm.qryGetObject.FieldByName('COD_EMPRESA').AsInteger;
    tbContatosSEQ_CONTATO.Value := dm.qryGetObject.FieldByName('SEQ_CONTATO').AsInteger;
    tbContratosDAT_INICIO_CONTRATO.Value := dm.qryGetObject.FieldByName('DAT_INICIO_CONTRATO').AsDateTime;
    if dm.qryGetObject.FieldByName('DAT_TERMINO_CONTRATO').Value <> 0 then
    begin
      tbContratosDAT_TERMINO_CONTRATO.Value := dm.qryGetObject.FieldByName('DAT_TERMINO_CONTRATO').AsDateTime;
    end;
    tbContratosCOD_TIPO_CONTRATO.Value := dm.qryGetObject.FieldByName('COD_TIPO_CONTRATO').AsInteger;
    tbContratos.Post;
    dm.qryGetObject.Next;
  end;
  if (not tbContatos.IsEmpty) then
  begin
    tbContatos.First;
  end;
  dm.qryGetObject.Close;
  dm.qryGetObject.SQL.Clear;
end;

procedure TfrmEmpresas.PopulaTiposContratos;
begin
  if dm.tbContratos.Active then
  begin
    dm.tbContratos.Close;
  end;
  dm.tbContratos.Open;
  if (not tipocontrato.getObjects) then
  begin
    Exit;
  end;
  dm.tbContratos.LoadFromDataSet(dm.qryGetObject);
  if (not dm.tbContratos.IsEmpty) then
  begin
    dm.tbContratos.First;
  end;
  dm.qryGetObject.Close;
  dm.qryGetObject.SQL.Clear;
end;

procedure TfrmEmpresas.SetupEmpresas;
begin
  empresas.Codigo := tbEmpresasCOD_EMPRESA.AsInteger;
  empresas.TipoDoc := tbEmpresasDES_TIPO_DOC.AsString;
  empresas.Cnpj := tbEmpresasNUM_CNPJ.AsString;
  empresas.IE := tbEmpresasNUM_IE.AsString;
  empresas.Razao := tbEmpresasDES_RAZAO_SOCIAL.AsString;
  empresas.Fantasia := tbEmpresasNOM_FANTASIA.AsString;
  empresas.IEST := tbEmpresasNUM_IEST.AsString;
  empresas.IM := tbEmpresasNUM_IM.AsString;
  empresas.Cnae := tbEmpresasCOD_CNAE.AsString;
  empresas.Crt := tbEmpresasCOD_CRT.AsInteger;
  empresas.Status := tbEmpresasCOD_STATUS.AsString;
  empresas.Obs := tbEmpresasDES_OBSERVACAO.AsString;
  empresas.DataCadastro := tbEmpresasDAT_CADASTRO.AsDateTime;
  empresas.Usuario := uGlobais.sUsuario;
  empresas.Manutencao := Now;
end;

procedure TfrmEmpresas.SetupEnderecos;
begin
  enderecos.Empresa := tbEnderecosCOD_EMPRESA.AsInteger;
  enderecos.Sequencia := tbEnderecos.RecIdField.AsInteger;
  enderecos.Tipo := tbEnderecosDES_TIPO.AsString;
  enderecos.Logradouro := tbEnderecosDES_LOGRADOURO.AsString;
  enderecos.Numero := tbEnderecosNUM_LOGRADOURO.AsString;
  enderecos.Complemento := tbEnderecosDES_COMPLEMENTO.AsString;
  enderecos.Correspondencia := tbEnderecosDOM_CORRESPONDENCIA.AsInteger;
  enderecos.Bairro := tbEnderecosDES_BAIRRO.AsString;
  enderecos.Cidade := tbEnderecosNOM_CIDADE.AsString;
  enderecos.UF  := tbEnderecosUF_ESTADO.AsString;
  enderecos.Cep := tbEnderecosNUM_CEP.AsString;
  enderecos.Referencia := tbEnderecosDES_REFERENCIA.AsString;
end;

procedure TfrmEmpresas.SetupContatos;
begin
  contatos.Empresa := tbContatosCOD_EMPRESA.AsInteger;
  contatos.Sequencia := tbContatos.RecIdField.AsInteger;
  contatos.Contato := tbContatosDES_CONTATO.AsString;
  contatos.Telefone := tbContatosNUM_TELEFONE.AsString;
  contatos.EMail := tbContatosDES_EMAIL.AsString;
  contatos.Padrao := tbContatosDOM_PADRAO.AsString;
end;

procedure TfrmEmpresas.SetupFinanceiro;
begin
  financeiro.Empresa := tbFinanceiroCOD_EMPRESA.AsInteger;
  financeiro.Sequencia := tbFinanceiro.RecIdField.AsInteger;
  financeiro.TipoConta := tbFinanceiroDES_TIPO_CONTA.AsString;
  financeiro.Banco := tbFinanceiroCOD_BANCO.AsString;
  financeiro.Agencia := tbFinanceiroCOD_AGENCIA.AsString;
  financeiro.Conta := tbFinanceiroNUM_CONTA.AsString;
  financeiro.Favorecido := tbFinanceiroNOM_FAVORECIDO.AsString;
  financeiro.CNPJ := tbFinanceiroNUM_CPF_CNPJ.AsString;
  financeiro.Forma := tbFinanceiroDES_FORMA_PAGAMENTO.AsString;
  financeiro.Padrao := tbFinanceiroDOM_PADRAO.AsString;
end;

procedure TfrmEmpresas.SetupContratos;
begin
  contratos.Empresa := tbContratosCOD_EMPRESA.AsInteger;
  contratos.Contrato := tbContratosCOD_TIPO_CONTRATO.AsInteger;
  contratos.Inicio := tbContratosDAT_INICIO_CONTRATO.AsDateTime;
  if tbContratosDAT_TERMINO_CONTRATO.Value > 0 then
  begin
    contratos.Termino := tbContratosDAT_TERMINO_CONTRATO.AsDateTime;
  end;
end;

procedure TfrmEmpresas.PopulaFavorecido;
begin
  if dsFinanceiro.State in [dsInsert,dsEdit] then
  begin
    tbFinanceiroNOM_FAVORECIDO.AsString := tbEmpresasDES_RAZAO_SOCIAL.AsString;
    tbFinanceiroNUM_CPF_CNPJ.AsString := tbEmpresasNUM_CNPJ.AsString;
  end;
end;

function TfrmEmpresas.VerificaDados(): Boolean;
begin
  Result := True;
  // validando dados da empresa
  SetupEmpresas;
  Result := empresas.Validar;
  if (not Result) then
  begin
    Exit;
  end;
  // validando endereços
  if (not tbEnderecos.IsEmpty) then
  begin
    tbEnderecos.First;
  end;
  while (not tbEnderecos.Eof) do
  begin
    SetupEnderecos;
    if (not enderecos.Validar) then
    begin
      if Result then
      begin
        Result := False;
      end;
    end;
    tbEnderecos.Next;
  end;
  if (not Result) then
  begin
    Exit;
  end;
  // validando contatos
  if (not tbContatos.IsEmpty) then
  begin
    tbContatos.First;
  end;
  while (not tbContatos.Eof) do
  begin
    SetupContatos;
    if (not contatos.Validar) then
    begin
      if Result then
      begin
        Result := False;
      end;
    end;
    tbContatos.Next;
  end;
  if (not Result) then
  begin
    Exit;
  end;
  // validando financeiro
  if (not tbFinanceiro.IsEmpty) then
  begin
    tbFinanceiro.First;
  end;
  while (not tbFinanceiro.Eof) do
  begin
    SetupFinanceiro;
    if (not financeiro.Validar) then
    begin
      if Result then
      begin
        Result := False;
      end;
    end;
    tbFinanceiro.Next;
  end;
  if (not Result) then
  begin
    Exit;
  end;
  // validando contratos
  if (not tbContratos.IsEmpty) then
  begin
    tbContratos.First;
  end;
  while (not tbContratos.Eof) do
  begin
    SetupContratos;
    if (not contratos.Validar) then
    begin
      if Result then
      begin
        Result := False;
      end;
    end;
    tbContratos.Next;
  end;
  if (not Result) then
  begin
    Exit;
  end;
end;

procedure TfrmEmpresas.SalvarDados;
var
  sCodigo: String;
begin
  sCodigo := '';
  // sanvando dados da empresa
  SetupEmpresas;
  if empresas.Codigo = 0 then
  begin
    if (not empresas.Insert) then
    begin
      Exit;
    end;
    sCodigo := empresas.getField('COD_EMPRESA', 'CNPJ');
    if sCodigo.IsEmpty then
    begin
      sCodigo := '0';
    end;
    tbEmpresas.Edit;
    tbEmpresasCOD_EMPRESA.Value := StrToInt(sCodigo);
    tbempresas.Post;
    empresas.Codigo := StrToInt(sCodigo);
  end
  else
  begin
    if (not empresas.Update) then
    begin
      Exit;
    end;
  end;
  // salvando endereços
  enderecos.Empresa := empresas.Codigo;
  if (not enderecos.Delete('CODIGO')) then
  begin
    Exit;
  end;
  if (not tbEnderecos.IsEmpty) then
  begin
    tbEnderecos.First;
  end;
  while (not tbEnderecos.Eof) do
  begin
    SetupEnderecos;
    if (not enderecos.Insert) then
    begin
      Exit;
    end;
    tbEnderecos.Next;
  end;
  // sanvando contatos
  contatos.Empresa := empresas.Codigo;
  if (not contatos.Delete('CODIGO')) then
  begin
    Exit;
  end;
  if (not tbContatos.IsEmpty) then
  begin
    tbContatos.First;
  end;
  while (not tbContatos.Eof) do
  begin
    SetupContatos;
    if (not contatos.Insert) then
    begin
      Exit;
    end;
    tbContatos.Next;
  end;
  // salvando financeiro
  financeiro.Empresa := empresas.Codigo;
  if (not financeiro.Delete('CODIGO')) then
  begin
    Exit;
  end;
  if (not tbFinanceiro.IsEmpty) then
  begin
    tbFinanceiro.First;
  end;
  while (not tbFinanceiro.Eof) do
  begin
    SetupFinanceiro;
    if (not enderecos.Insert) then
    begin
      Exit;
    end;
    tbEnderecos.Next;
  end;
  // salvando contratos;
  contratos.Empresa := empresas.Codigo;
  if (not contratos.Delete('CODIGO')) then
  begin
    Exit;
  end;
  if (not tbContratos.IsEmpty) then
  begin
    tbContratos.First;
  end;
  while (not tbContratos.Eof) do
  begin
    SetupContratos;
    if (not contratos.Insert) then
    begin
      Exit;
    end;
    tbContratos.Next;
  end;

end;

procedure TfrmEmpresas.TodasEmpresas;
begin
  if empresas.getObjects then
  begin
    PopulaEmpresas;
  end;

end;

end.
