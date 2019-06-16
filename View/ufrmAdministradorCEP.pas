unit ufrmAdministradorCEP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxLabel, cxImage, Vcl.ExtCtrls, clAgentes, clEstados, dxSkinscxPCPainter,
  cxPCdxBarPopupMenu, cxTextEdit, cxMaskEdit, cxPC, cxDropDownEdit, cxGroupBox, Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar,
  cxMemo, cxCalc, cxButtonEdit, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, dxmdaset,
  Vcl.ActnList, Vcl.Menus, Vcl.StdCtrls, cxButtons, clBancos, clAbastecimentos, clEntregador, clExtravios, clLancamentos,
  clOrdemServico, clPlanilhaCredito, clRestricoes, clVeiculos, clVerbaCEP, clEntrega, clCentroCusto, cxImageComboBox;

type
  TfrmAdministradorCEP = class(TForm)
    tbContatos: TdxMemData;
    tbContatosSEQ_CONTATO: TIntegerField;
    tbContatosDES_CONTATO: TStringField;
    tbContatosNUM_TELEFONE: TStringField;
    tbContatosDES_EMAIL: TStringField;
    ds: TDataSource;
    aclCadastro: TActionList;
    actCadastroIncluir: TAction;
    actCadastroLocalizar: TAction;
    actCadastroEditar: TAction;
    actCadastroExcluir: TAction;
    actCadastroCancelar: TAction;
    actCadastroSalvar: TAction;
    actCadastroSair: TAction;
    actCadastroExcluirEndereco: TAction;
    tbEnderecos: TdxMemData;
    tbEnderecosDES_TIPO: TStringField;
    tbEnderecosDES_LOGRADOURO: TStringField;
    tbEnderecosNUM_LOGRADOURO: TStringField;
    tbEnderecosDES_COMPLEMENTO: TStringField;
    tbEnderecosDOM_CORRESPONDENCIA: TIntegerField;
    tbEnderecosDES_BAIRRO: TStringField;
    tbEnderecosNOM_CIDADE: TStringField;
    tbEnderecosUF_ESTADO: TStringField;
    tbEnderecosNUM_CEP: TStringField;
    tbEnderecosDES_REFERENCIA: TStringField;
    actCadastroApoio: TAction;
    cxLabel34: TcxLabel;
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxCodigo: TcxMaskEdit;
    cxLabel2: TcxLabel;
    CXTipoDocumento: TcxComboBox;
    cxLabel3: TcxLabel;
    cxCPF: TcxMaskEdit;
    cxLabel4: TcxLabel;
    cxNome: TcxTextEdit;
    cxLabel5: TcxLabel;
    cxAlias: TcxTextEdit;
    cxLabel6: TcxLabel;
    cxRGIE: TcxTextEdit;
    cxLabel7: TcxLabel;
    cxIEST: TcxTextEdit;
    cxLabel8: TcxLabel;
    cxIM: TcxTextEdit;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxCRT: TcxMaskEdit;
    cxCNAE: TcxTextEdit;
    cxLabel11: TcxLabel;
    cxCNH: TcxTextEdit;
    cxLabel12: TcxLabel;
    cxValidadeCNH: TcxDateEdit;
    cxLabel13: TcxLabel;
    cxCategoria: TcxTextEdit;
    cxGroupBox2: TcxGroupBox;
    cxLabel14: TcxLabel;
    cxTipoEndereco: TcxComboBox;
    cxLabel15: TcxLabel;
    cxCEP: TcxMaskEdit;
    cxLabel17: TcxLabel;
    cxLogradouro: TcxTextEdit;
    cxLabel18: TcxLabel;
    cxNumero: TcxTextEdit;
    cxLabel19: TcxLabel;
    cxComplemento: TcxTextEdit;
    cxLabel20: TcxLabel;
    cxBairro: TcxTextEdit;
    cxLabel21: TcxLabel;
    cxCidade: TcxTextEdit;
    cxLabel22: TcxLabel;
    cxUF: TcxComboBox;
    cxLabel23: TcxLabel;
    cxReferencia: TcxTextEdit;
    cxButton7: TcxButton;
    cxGroupBox5: TcxGroupBox;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1SEQ_CONTATO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_CONTATO: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_TELEFONE: TcxGridDBColumn;
    cxGrid1DBTableView1DES_EMAIL: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxGroupBox3: TcxGroupBox;
    cxObservações: TcxMemo;
    cxLabel50: TcxLabel;
    cxStatus: TcxImageComboBox;
    cxGroupBox4: TcxGroupBox;
    cxLabel24: TcxLabel;
    cxVerba: TcxCalcEdit;
    cxLabel25: TcxLabel;
    cxFormaPgto: TcxComboBox;
    cxLabel26: TcxLabel;
    cxTipoConta: TcxComboBox;
    cxLabel27: TcxLabel;
    cxBanco: TcxButtonEdit;
    cxNomeBanco: TcxTextEdit;
    cxLabel28: TcxLabel;
    cxAgencia: TcxTextEdit;
    cxLabel29: TcxLabel;
    cxConta: TcxTextEdit;
    cxLabel30: TcxLabel;
    cxFavorecido: TcxTextEdit;
    cxLabel31: TcxLabel;
    cxCPFFavorecido: TcxMaskEdit;
    cxLabel32: TcxLabel;
    cxCentroCusto: TcxButtonEdit;
    cxDescricaoCentroCusto: TcxTextEdit;
    cxLabel33: TcxLabel;
    cxGrupoVerba: TcxComboBox;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure actCadastroIncluirExecute(Sender: TObject);
    procedure actCadastroEditarExecute(Sender: TObject);
    procedure actCadastroCancelarExecute(Sender: TObject);
    procedure cxBancoPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxBancoPropertiesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actCadastroSairExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure actCadastroLocalizarExecute(Sender: TObject);
    procedure actCadastroApoioExecute(Sender: TObject);
    procedure actCadastroExcluirEnderecoExecute(Sender: TObject);
    procedure actCadastroExcluirExecute(Sender: TObject);
    procedure actCadastroSalvarExecute(Sender: TObject);
    procedure cxTipoEnderecoPropertiesChange(Sender: TObject);
    procedure cxCentroCustoPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cxCentroCustoPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    procedure Modo;
    procedure PopulaContatos;
    procedure PopulaEnderecos;
    procedure SetupDados;
    procedure SetupEndereco;
    procedure LimpaEndereco;
    procedure ListaBancos;
    procedure ExcluirEndereco;
    procedure Localizar;
    procedure ExcluirAgente;
    procedure SetupClass;
    procedure SalvaDados;
    procedure SalvaEnderecos;
    procedure SalvaContatos;
    function  SalvaTabelaEndereco(): Boolean;
    procedure PopulaEstados;
    procedure ListaCentroCusto;
    procedure PopulaGrupos;
  public
    { Public declarations }
  end;

var
  frmAdministradorCEP  : TfrmAdministradorCEP;
  agente              : TAgente;
  estado              : TEstados;
  banco               : TBancos;
  abastecimento       : TAbastecimentos;
  entregador          : TEntregador;
  extravio            : TExtravios;
  lancamento          : TLancamentos;
  os                  : TOrdemServico;
  planilha            : TPlanilhaCredito;
  restricao           : TRestricoes;
  veiculo             : TVeiculos;
  verbacep            : TVerbaCEP;
  entrega             : TEntrega;
  centrocusto         : TCentroCusto;

implementation

{$R *.dfm}

uses
  udm, clUtil, uGlobais, ufrmLocalizar, ufrmListaApoio;

procedure TfrmAdministradorCEP.actCadastroApoioExecute(Sender: TObject);
begin
  if cxBanco.IsFocused then begin
    ListaBancos;
  end;
  if cxCentroCusto.IsFocused then begin
    ListaCentroCusto;
  end;

end;

procedure TfrmAdministradorCEP.actCadastroCancelarExecute(Sender: TObject);
begin
  agente.Operacao               :=  'X';
  TUtil.LimparFields(Self);
  tbEnderecos.Close;
  tbContatos.Close;
  Modo;
  cxCodigo.Properties.ReadOnly  :=  False;
end;

procedure TfrmAdministradorCEP.actCadastroEditarExecute(Sender: TObject);
begin
  agente.Operacao               :=  'U';
  Modo;
  cxCodigo.Properties.ReadOnly  :=  True;
  CXTipoDocumento.SetFocus;
end;

procedure TfrmAdministradorCEP.actCadastroExcluirEnderecoExecute(Sender: TObject);
begin
  ExcluirEndereco;
end;

procedure TfrmAdministradorCEP.actCadastroExcluirExecute(Sender: TObject);
begin
  ExcluirAgente;
end;

procedure TfrmAdministradorCEP.actCadastroIncluirExecute(Sender: TObject);
begin
  agente.Operacao               :=  'I';
  TUtil.LimparFields(Self);
  tbEnderecos.Close;
  tbContatos.Close;
  tbEnderecos.Open;
  tbContatos.Open;
  Modo;
  cxCodigo.Properties.ReadOnly  :=  False;
  cxCodigo.SetFocus;
end;

procedure TfrmAdministradorCEP.actCadastroLocalizarExecute(Sender: TObject);
begin
  Localizar;
end;

procedure TfrmAdministradorCEP.actCadastroSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmAdministradorCEP.actCadastroSalvarExecute(Sender: TObject);
begin
  SalvaDados;
end;

procedure TfrmAdministradorCEP.cxBancoPropertiesChange(Sender: TObject);
begin
  if Pos(agente.Operacao,'IU') = 0 then begin
    Exit;
  end;
  cxNomeBanco.Clear;
end;

procedure TfrmAdministradorCEP.cxBancoPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  if Pos(agente.Operacao,'IU') = 0 then begin
    Exit;
  end;
  if TUtil.Empty(cxBanco.Text) then begin
    cxBanco.Text  :=  '0';
    Exit;
  end;
  if banco.getObject(cxBanco.Text,'CODIGO') then begin
    cxNomeBanco.Text  :=  banco.Nome;
  end
  else begin
    cxNomeBanco.Text  :=  'BANCO NÃO CADASTRADO';
  end;

end;

procedure TfrmAdministradorCEP.cxCentroCustoPropertiesChange(Sender: TObject);
begin
  if Pos(agente.Operacao,'IU') = 0 then begin
    Exit;
  end;
  cxDescricaoCentroCusto.Clear;
end;

procedure TfrmAdministradorCEP.cxCentroCustoPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  if Pos(agente.Operacao,'IU') = 0 then begin
    Exit;
  end;
  if TUtil.Empty(cxCentroCusto.Text) then begin
    cxCentroCusto.Text  :=  '0';
    Exit;
  end;
  if centrocusto.getObject(cxCentroCusto.Text,'CODIGO') then begin
    cxDescricaoCentroCusto.Text  :=  centrocusto.Descricao;
  end
  else begin
    cxDescricaoCentroCusto.Text  :=  'CENTRO DE CUSTO NÃO CADASTRADO';
  end;
end;

procedure TfrmAdministradorCEP.cxTipoEnderecoPropertiesChange(Sender: TObject);
begin
  if Pos(agente.Operacao,'IU' ) = 0 then begin
    Exit;
  end;
  LimpaEndereco;
  SetupEndereco;
end;

procedure TfrmAdministradorCEP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  agente.Free;
  estado.Free;
  banco.Free;
  abastecimento.Free;
  entregador.Free;
  extravio.Free;
  lancamento.Free;
  os.Free;
  planilha.Free;
  restricao.Free;
  veiculo.Free;
  verbacep.Free;
  entrega.Free;
  centrocusto.Free;
  tbEnderecos.Close;
  tbContatos.Close;
  Action              :=  caFree;
  frmAdministradorCEP  :=  Nil;
end;

procedure TfrmAdministradorCEP.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key = #13 then begin
    if cxGrid1.IsFocused then begin
      Exit;
    end;
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TfrmAdministradorCEP.FormShow(Sender: TObject);
begin
  agente              :=  TAgente.Create;
  estado              :=  TEstados.Create;
  banco               :=  TBancos.Create;
  abastecimento       :=  TAbastecimentos.Create;
  entregador          :=  TEntregador.Create;
  extravio            :=  TExtravios.Create;
  lancamento          :=  TLancamentos.Create;
  os                  :=  TOrdemServico.Create;
  planilha            :=  TPlanilhaCredito.Create;
  restricao           :=  TRestricoes.Create;
  veiculo             :=  TVeiculos.Create;
  verbacep            :=  TVerbaCEP.Create;
  entrega             :=  TEntrega.Create;
  centrocusto         :=  TCentroCusto.Create;
  PopulaEstados;
  PopulaGrupos;
  TUtil.LimparFields(Self);
  agente.Operacao :=  'X';
  Modo;
end;

procedure TfrmAdministradorCEP.Modo;
begin
  if agente.Operacao = 'I' then begin
    cxGroupBox1.Enabled                 :=  True;
    cxGroupBox2.Enabled                 :=  True;
    cxGroupBox3.Enabled                 :=  True;
    cxGroupBox4.Enabled                 :=  True;
    cxGroupBox5.Enabled                 :=  True;
    actCadastroIncluir.Enabled          :=  False;
    actCadastroLocalizar.Enabled        :=  False;
    actCadastroEditar.Enabled           :=  False;
    actCadastroExcluir.Enabled          :=  False;
    actCadastroCancelar.Enabled         :=  True;
    actCadastroSalvar.Enabled           :=  True;
    actCadastroSair.Enabled             :=  True;
    actCadastroExcluirEndereco.Enabled  :=  False;
    with cxGrid1DBTableView1.OptionsData do begin
      Deleting  :=  True;
      Editing   :=  True;
      Inserting :=  True;
    end;
  end
  else if agente.Operacao = 'U' then begin
    cxGroupBox1.Enabled                 :=  True;
    cxGroupBox2.Enabled                 :=  True;
    cxGroupBox3.Enabled                 :=  True;
    cxGroupBox4.Enabled                 :=  True;
    cxGroupBox5.Enabled                 :=  True;
    actCadastroIncluir.Enabled          :=  False;
    actCadastroLocalizar.Enabled        :=  False;
    actCadastroEditar.Enabled           :=  False;
    actCadastroExcluir.Enabled          :=  False;
    actCadastroCancelar.Enabled         :=  True;
    actCadastroSalvar.Enabled           :=  True;
    actCadastroSair.Enabled             :=  True;
    if not (tbEnderecos.Active) then begin
      actCadastroExcluirEndereco.Enabled  :=  False;
    end
    else begin
      if tbEnderecos.IsEmpty then begin
        actCadastroExcluirEndereco.Enabled  :=  False;
      end
      else begin
        actCadastroExcluirEndereco.Enabled  :=  True;
      end;
    end;
    with cxGrid1DBTableView1.OptionsData do begin
      Deleting  :=  True;
      Editing   :=  True;
      Inserting :=  True;
    end;
  end
  else if agente.Operacao = 'S' then begin
    cxGroupBox1.Enabled                 :=  False;
    cxGroupBox2.Enabled                 :=  False;
    cxGroupBox3.Enabled                 :=  False;
    cxGroupBox4.Enabled                 :=  False;
    cxGroupBox5.Enabled                 :=  True;
    actCadastroIncluir.Enabled          :=  False;
    actCadastroLocalizar.Enabled        :=  True;
    actCadastroEditar.Enabled           :=  True;
    actCadastroExcluir.Enabled          :=  True;
    actCadastroCancelar.Enabled         :=  True;
    actCadastroSalvar.Enabled           :=  False;
    actCadastroSair.Enabled             :=  True;
    actCadastroExcluirEndereco.Enabled  :=  False;
    with cxGrid1DBTableView1.OptionsData do begin
      Deleting  :=  False;
      Editing   :=  False;
      Inserting :=  False;
    end;
  end
  else if agente.Operacao = 'X' then begin
    cxGroupBox1.Enabled                 :=  False;
    cxGroupBox2.Enabled                 :=  False;
    cxGroupBox3.Enabled                 :=  False;
    cxGroupBox4.Enabled                 :=  False;
    cxGroupBox5.Enabled                 :=  True;
    actCadastroIncluir.Enabled          :=  True;
    actCadastroLocalizar.Enabled        :=  True;
    actCadastroEditar.Enabled           :=  False;
    actCadastroExcluir.Enabled          :=  False;
    actCadastroCancelar.Enabled         :=  False;
    actCadastroSalvar.Enabled           :=  False;
    actCadastroSair.Enabled             :=  True;
    actCadastroExcluirEndereco.Enabled  :=  False;
    with cxGrid1DBTableView1.OptionsData do begin
      Deleting  :=  False;
      Editing   :=  False;
      Inserting :=  False;
    end;
  end;
end;

procedure TfrmAdministradorCEP.PopulaContatos;
begin
  tbContatos.Close;
  tbContatos.Open;
  tbContatos.IsLoading  :=  True;
  if agente.Contato.getObject(agente.Codigo,'CODIGO') then begin
    while not (dm.qryGetObject.Eof) do begin
      tbContatos.Insert;
      tbContatosSEQ_CONTATO.AsInteger :=  dm.qryGetObject.FieldByName('SEQ_CONTATO').AsInteger;
      tbContatosDES_CONTATO.AsString  :=  dm.qryGetObject.FieldByName('DES_CONTATO').AsString;
      tbContatosNUM_TELEFONE.AsString :=  dm.qryGetObject.FieldByName('NUM_TELEFONE').AsString;
      tbContatosDES_EMAIL.AsString    :=  dm.qryGetObject.FieldByName('DES_EMAIL').AsString;
      tbContatos.Post;
      dm.qryGetObject.Next;
    end;
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
    if not (tbContatos.IsEmpty) then begin
      tbContatos.First;
    end;
    tbContatos.IsLoading  :=  False;
  end;
end;

procedure TfrmAdministradorCEP.PopulaEnderecos;
begin
  tbEnderecos.Close;
  tbEnderecos.Open;
  tbEnderecos.IsLoading  :=  True;
  if agente.Endereco.getObject(agente.Codigo,'CODIGO') then begin
    while not (dm.qryGetObject.Eof) do begin
      tbEnderecos.Insert;
      tbEnderecosDES_TIPO.AsString              :=  dm.qryGetObject.FieldByName('DES_TIPO').AsString;
      tbEnderecosDES_LOGRADOURO.AsString        :=  dm.qryGetObject.FieldByName('DES_LOGRADOURO').AsString;
      tbEnderecosNUM_LOGRADOURO.AsString        :=  dm.qryGetObject.FieldByName('NUM_LOGRADOURO').AsString;
      tbEnderecosDES_COMPLEMENTO.AsString       :=  dm.qryGetObject.FieldByName('DES_COMPLEMENTO').AsString;
      tbEnderecosDOM_CORRESPONDENCIA.AsInteger  :=  dm.qryGetObject.FieldByName('DOM_CORRESPONDENCIA').AsInteger;
      tbEnderecosDES_BAIRRO.AsString            :=  dm.qryGetObject.FieldByName('DES_BAIRRO').AsString;
      tbEnderecosNOM_CIDADE.AsString            :=  dm.qryGetObject.FieldByName('NOM_CIDADE').AsString;
      tbEnderecosUF_ESTADO.AsString             :=  dm.qryGetObject.FieldByName('UF_ESTADO').AsString;
      tbEnderecosNUM_CEP.AsString               :=  dm.qryGetObject.FieldByName('NUM_CEP').AsString;
      tbEnderecosDES_REFERENCIA.AsString        :=  dm.qryGetObject.FieldByName('DES_REFERENCIA').AsString;
      tbEnderecos.Post;
      dm.qryGetObject.Next;
    end;
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
    if not (tbEnderecos.IsEmpty) then begin
      tbEnderecos.First;
    end;
    tbEnderecos.IsLoading  :=  False;
  end;
end;

procedure TfrmAdministradorCEP.SetupDados;
begin
  cxCodigo.Text         :=  agente.Codigo;
  cxTipoDocumento.Text  :=  agente.TipoDoc;
  cxCPF.Text            :=  agente.Cnpj;
  cxNome.Text           :=  agente.Razao;
  cxAlias.Text          :=  agente.Fantasia;
  cxRGIE.Text           :=  agente.IE;
  cxIEST.Text           :=  agente.IEST;
  cxIM.Text             :=  agente.IM;
  cxCNAE.Text           :=  agente.Cnae;
  cxCRT.Text            :=  IntToStr(agente.Crt);
  cxCNH.Text            :=  agente.Cnh;
  cxValidadeCNH.Date    :=  agente.ValidadeCnh;
  cxCategoria.Text      :=  agente.CategoriaCnh;
  cxObservações.Text    :=  agente.Obs;
  cxVerba.Value         :=  agente.Verba;
  cxFormaPgto.Text      :=  agente.Forma;
  cxTipoConta.Text      :=  agente.TipoConta;
  cxBanco.Text          :=  agente.Banco;
  if TUtil.Empty(cxBanco.Text) then begin
    cxBanco.Text  :=  '0';
    Exit;
  end;
  if banco.getObject(cxBanco.Text,'CODIGO') then begin
    cxNomeBanco.Text  :=  banco.Nome;
  end
  else begin
    cxNomeBanco.Text  :=  'BANCO NÃO CADASTRADO';
  end;
  cxAgencia.Text        :=  agente.Agencia;
  cxConta.Text          :=  agente.NumeroConta;
  cxFavorecido.Text     :=  agente.Favorecido;
  cxCPFFavorecido.Text  :=  agente.CpfCnpjFavorecido;
  cxCentroCusto.Text    :=  IntToStr(agente.CentroCusto);
  if TUtil.Empty(cxCentroCusto.Text) then begin
    cxCentroCusto.Text  :=  '0';
    Exit;
  end;
  if centrocusto.getObject(cxCentroCusto.Text,'CODIGO') then begin
    cxDescricaoCentroCusto.Text  :=  centrocusto.Descricao;
  end
  else begin
    cxDescricaoCentroCusto.Text  :=  'CENTRO DE CUSTO NÃO CADASTRADO';
  end;
  cxGrupoVerba.Text     :=  IntToStr(agente.Grupo);
  cxStatus.EditValue    :=  agente.Status;
end;

procedure TfrmAdministradorCEP.SetupEndereco;
var
  sTipo : String;
begin
  sTipo :=  '';
  if not (tbEnderecos.Active) then begin
    Exit;
  end;
  if tbEnderecos.IsEmpty then begin
    Exit;
  end;
  if TUtil.Empty(cxTipoEndereco.Text) then begin
    Exit;
  end;
  sTipo :=  cxTipoEndereco.Text;
  LimpaEndereco;
  tbEnderecos.First;
  while not (tbEnderecos.Eof) do begin
    if tbEnderecosDES_TIPO.AsString = sTipo then begin
      cxCEP.Text            :=  tbEnderecosNUM_CEP.AsString;
      cxLogradouro.Text     :=  tbEnderecosDES_LOGRADOURO.AsString;
      cxNumero.Text         :=  tbEnderecosNUM_LOGRADOURO.AsString;
      cxComplemento.Text    :=  tbEnderecosDES_COMPLEMENTO.AsString;
      cxBairro.Text         :=  tbEnderecosDES_BAIRRO.AsString;
      cxCidade.Text         :=  tbEnderecosNOM_CIDADE.AsString;
      cxUF.Text             :=  tbEnderecosUF_ESTADO.AsString;
      cxReferencia.Text     :=  tbEnderecosDES_REFERENCIA.AsString;
      Break;
    end;
    tbEnderecos.Next;
  end;
  tbEnderecos.First;
end;

procedure TfrmAdministradorCEP.LimpaEndereco;
begin
  cxCEP.Clear;
  cxLogradouro.Clear;
  cxNumero.Clear;
  cxComplemento.Clear;
  cxBairro.Clear;
  cxCidade.Clear;
  cxUF.Clear;
  cxReferencia.Clear;
end;

procedure TfrmAdministradorCEP.ListaBancos;
var
  sId : String;
begin
  if Pos(agente.Operacao,'IU') = 0 then begin
    Exit;
  end;
  sId         :=  '';
  Screen.Cursor :=  crHourGlass;
  sId           :=  Trim(cxBanco.Text);
  with dm.qryPesquisa do begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT COD_BANCO AS "Código", NOM_BANCO AS "Nome" ' +
                'FROM TBBANCOS ';
    dm.ZConn.PingServer;
    Open;
  end;
  if dm.qryPesquisa.IsEmpty then begin
    dm.qryPesquisa.Close;
    dm.qryPesquisa.SQL.Clear;
    Exit;
  end
  else begin
    dm.qryPesquisa.First;
  end;
  if not Assigned(frmListaApoio) then begin
    frmListaApoio :=  TfrmListaApoio.Create(Application);
  end;
  frmListaApoio.Caption                                 :=  'Bancos';
  Screen.Cursor                                         :=  crDefault;
  if frmListaApoio.ShowModal = mrOk then begin
    cxBanco.Text      :=  dm.qryPesquisa.Fields[0].AsString;
    cxBanco.Refresh;
    cxNomeBanco.Text  :=  dm.qryPesquisa.Fields[1].AsString;
    cxNomeBanco.Refresh;
  end;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  FreeAndNil(frmListaApoio);
end;

procedure TfrmAdministradorCEP.ExcluirEndereco;
var
  sTipo: String;
begin
  sTipo :=  '';
  if Pos(agente.Operacao,'IU') = 0 then begin
    Exit;
  end;
  if not (tbEnderecos.Active) then begin
    Exit;
  end;
  if tbEnderecos.IsEmpty then begin
    Exit;
  end;
  if TUtil.Empty(cxTipoEndereco.Text) then begin
    Exit;
  end;
  sTipo :=  cxTipoEndereco.Text;
  tbEnderecos.First;
  while not (tbEnderecos.Eof) do begin
    if tbEnderecosDES_TIPO.AsString = sTipo then begin
      tbEnderecos.Delete;
      LimpaEndereco;
    end;
    if not (tbEnderecos.Eof) then begin
      tbEnderecos.Next;
    end;
  end;
  if not (tbEnderecos.IsEmpty) then begin
    tbEnderecos.First;
  end;
end;

procedure TfrmAdministradorCEP.Localizar;
begin
  with dm.qryPesquisa do begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT COD_AGENTE AS "Código", NUM_CNPJ AS "CPF/CNPJ", DES_RAZAO_SOCIAL AS "Nome/Razão Social", ' +
                'NOM_FANTASIA AS "Alias/Nome Fantasia", NUM_IE AS "Nº. RG/Ins. Est.", NUM_IEST AS "Nº. IE/ST", ' +
                'NUM_IM AS "Ins. Mun.", COD_CNAE AS "Nº. CNAE", COD_CRT AS "Nº. CRT", NUM_CNH AS "Nº. CNH" ' +
                'FROM TBAGENTES ';
    SQL.Add('');
  end;
  if not Assigned(frmLocalizar) then begin
    frmLocalizar :=  TfrmLocalizar.Create(Application);
  end;
  frmLocalizar.cboCamposDisplay.Clear;
  frmLocalizar.cboCamposSQL.Clear;
  frmLocalizar.cboCamposDisplay.Items.Add('Código');
  frmLocalizar.cboCamposSQL.Items.Add('COD_AGENTE');
  frmLocalizar.cboCamposDisplay.Items.Add('CPF/CNPJ');
  frmLocalizar.cboCamposSQL.Items.Add('NUM_CNPJ');
  frmLocalizar.cboCamposDisplay.Items.Add('Nome/Razão Social');
  frmLocalizar.cboCamposSQL.Items.Add('DES_RAZAO_SOCIAL');
  frmLocalizar.cboCamposDisplay.Items.Add('Alias/Nome Fantasia');
  frmLocalizar.cboCamposSQL.Items.Add('NOM_FANTASIA');
  frmLocalizar.cboCamposDisplay.Items.Add('Nº. RG/Inscrição Estadual');
  frmLocalizar.cboCamposSQL.Items.Add('NUM_IE');
  frmLocalizar.cboCamposDisplay.Items.Add('Nº. Ins. Estadual com Subst. Tributária');
  frmLocalizar.cboCamposSQL.Items.Add('NUM_IEST');
  frmLocalizar.cboCamposDisplay.Items.Add('Inscrição Municipal');
  frmLocalizar.cboCamposSQL.Items.Add('NUM_IM');
  frmLocalizar.cboCamposDisplay.Items.Add('N°. CNAE');
  frmLocalizar.cboCamposSQL.Items.Add('COD_CNAE');
  frmLocalizar.cboCamposDisplay.Items.Add('Nº. CRT');
  frmLocalizar.cboCamposSQL.Items.Add('COD_CRT');
  frmLocalizar.cboCamposDisplay.Items.Add('Nº. CNH');
  frmLocalizar.cboCamposSQL.Items.Add('NUM_CNH');

  frmLocalizar.cboCamposDisplay.ItemIndex := 0;
  frmLocalizar.cboCamposSQL.ItemIndex := 0;

  if frmLocalizar.ShowModal = mrOk then begin
    if agente.getObject(dm.qryPesquisa.Fields[0].AsString,'CODIGO') then begin
      TUtil.LimparFields(Self);
      SetupDados;
      PopulaContatos;
      PopulaEnderecos;
      SetupEndereco;
      agente.Operacao :=  'S';
      Modo;
    end;
  end;
  FreeAndNil(frmLocalizar);
end;

procedure TfrmAdministradorCEP.ExcluirAgente;
begin
  if agente.Operacao <> 'S' then begin
    Exit;
  end;
  if abastecimento.getObject(agente.Codigo,'ENTREGADOR') then begin
    Application.MessageBox('Existem Abastecimentos Registrados para este Agente! Exclusão Cancelada.', 'Excluir Agente', MB_OK +
                           MB_ICONEXCLAMATION);
    Exit;
  end;
  if entregador.getObject(agente.Codigo,'AGENTE') then begin
    Application.MessageBox('Existem Entregadores Registrados para este Agente! Exclusão Cancelada.', 'Excluir Agente', MB_OK +
                           MB_ICONEXCLAMATION);
    Exit;
  end;
  if extravio.getObject(agente.Codigo,'AGENTE') then begin
    Application.MessageBox('Existem Extravios Registrados para este Agente! Exclusão Cancelada.', 'Excluir Agente', MB_OK +
                           MB_ICONEXCLAMATION);
    Exit;
  end;
  if lancamento.getObject(agente.Codigo,'ENTREGADOR') then begin
    Application.MessageBox('Existem Lançamentos de Débitos/Créditos Registrados para este Agente! Exclusão Cancelada.',
                           'Excluir Agente', MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if os.getObject(agente.Codigo,'ENTREGADOR') then begin
    Application.MessageBox('Existem Ordens de Serviço Registradas para este Agente! Exclusão Cancelada.', 'Excluir Agente', MB_OK +
                           MB_ICONEXCLAMATION);
    Exit;
  end;
  if planilha.getObject(agente.Codigo,'AGENTE') then begin
    Application.MessageBox('Existem Créditos Registrados para este Agente! Exclusão Cancelada.', 'Excluir Agente', MB_OK +
                           MB_ICONEXCLAMATION);
    Exit;
  end;
  if restricao.getObject(agente.Codigo,'AGENTE') then begin
    Application.MessageBox('Existem Restrições Registradas para este Agente! Exclusão Cancelada.', 'Excluir Agente', MB_OK +
                           MB_ICONEXCLAMATION);
    Exit;
  end;
  if veiculo.getObject(agente.Codigo,'ENTREGADOR') then begin
    Application.MessageBox('Existem Veículos Registrados para este Agente! Exclusão Cancelada.', 'Excluir Agente', MB_OK +
                           MB_ICONEXCLAMATION);
    Exit;
  end;
  if entrega.getObject(agente.Codigo,'AGENTE') then begin
    Application.MessageBox('Existem Entregas Registrados para este Agente! Exclusão Cancelada.', 'Excluir Agente', MB_OK +
                           MB_ICONEXCLAMATION);
    Exit;
  end;

  if Application.MessageBox('Confirma a Exclusão deste Agente?', 'Excluir Agente', MB_YESNO + MB_ICONQUESTION) = IDNO then begin
    Exit;
  end;
  agente.Contato.Codigo   :=  StrToInt(agente.Codigo);
  agente.Endereco.Codigo  :=  StrToInt(agente.Codigo);
  verbacep.Agente         :=  StrToInt(agente.Codigo);
  if not (agente.Contato.Delete('CODIGO')) then begin
    Application.MessageBox('Erro ao excluir os contatos deste Agente! Exclusão Cancelada.', 'Excluir Agente', MB_OK +
                           MB_ICONEXCLAMATION);
    Exit;
  end;
  if not (agente.Endereco.Delete('CODIGO')) then begin
    Application.MessageBox('Erro ao excluir os Endereços deste Agente! Exclusão Cancelada.', 'Excluir Agente', MB_OK +
                           MB_ICONEXCLAMATION);
    Exit;
  end;
  if not (verbacep.Delete('AGENTE')) then begin
    Application.MessageBox('Erro ao excluir as Verbas por CEP deste Agente! Exclusão Cancelada.', 'Excluir Agente', MB_OK +
                           MB_ICONEXCLAMATION);
    Exit;
  end;
  if not (agente.Delete('CODIGO')) then begin
    Application.MessageBox('Erro ao excluir este Agente!', 'Excluir Agente', MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  Application.MessageBox('Exclusão concluída!', 'Excluir Agente', MB_OK + MB_ICONINFORMATION);
  TUtil.LimparFields(Self);
  agente.Operacao :=  'X';
  Modo;
end;

procedure TfrmAdministradorCEP.SetupClass;
begin
  agente.Codigo             :=  cxCodigo.Text;
  agente.TipoDoc            :=  cxTipoDocumento.Text;
  agente.Cnpj               :=  cxCPF.Text;
  agente.Razao              :=  cxNome.Text;
  agente.Fantasia           :=  cxAlias.Text;
  agente.IE                 :=  cxRGIE.Text;
  agente.IEST               :=  cxIEST.Text;
  agente.IM                 :=  cxIM.Text;
  agente.Cnae               :=  cxCNAE.Text;
  agente.Crt                :=  StrToInt(cxCRT.Text);
  agente.Cnh                :=  cxCNH.Text;
  if not (TUtil.Empty(cxCNH.Text)) then begin
    entregador.ValidadeCnh        :=  cxValidadeCNH.Date;
  end;
  agente.CategoriaCnh       :=  cxCategoria.Text;
  agente.Obs                :=  cxObservações.Text;
  agente.Verba              :=  cxVerba.Value;
  agente.Forma              :=  cxFormaPgto.Text;
  agente.TipoConta          :=  cxTipoConta.Text;
  agente.Banco              :=  cxBanco.Text;
  agente.Agencia            :=  cxAgencia.Text;
  agente.NumeroConta        :=  cxConta.Text;
  agente.Favorecido         :=  cxFavorecido.Text;
  agente.CpfCnpjFavorecido  :=  cxCPFFavorecido.Text;
  agente.CentroCusto        :=  StrToInt(cxCentroCusto.Text);
  agente.Grupo              :=  StrToInt(cxGrupoVerba.Text);
  agente.Status             :=  cxStatus.Properties.Items[cxStatus.ItemIndex].Value;
  if agente.Operacao = 'I' then begin
    agente.DtCadastro :=  FormatDateTime('dd/mm/yyyy', Now);
  end;
  agente.DtAlteracaop       :=  Now;
end;

procedure TfrmAdministradorCEP.SalvaDados;
begin
  SetupClass;
  if not (agente.Validar()) then begin
    Exit;
  end;
  if not (SalvaTabelaEndereco()) then begin
    Exit;
  end;
  if Application.MessageBox('Confirma Salvar os dados?','Salvar Dados', MB_YESNO + MB_ICONQUESTION) = IDNO then begin
    Exit;
  end;
  if agente.Operacao = 'I' then begin
    if not (agente.Insert()) then begin
      Application.MessageBox('Erro ao incluir o Agente!', 'Salvar Dados', MB_OK + MB_ICONERROR);
      Exit;
    end;
  end
  else if agente.Operacao = 'U' then begin
    if not (agente.Update()) then begin
      Application.MessageBox('Erro ao alterar o Agente!', 'Salvar Dados', MB_OK + MB_ICONERROR);
      Exit;
    end;
  end;
  SalvaEnderecos;
  SalvaContatos;
  Application.MessageBox('Salvar Dados Concluído!', 'Salvar Dados', MB_OK + MB_ICONINFORMATION);
  if agente.Operacao = 'I' then begin
    if Application.MessageBox('Deseja incluir outro Registro?','Incluir', MB_YESNO + MB_ICONQUESTION) = IDNO then begin
      actCadastroCancelarExecute(Self);
    end
    else begin
      actCadastroIncluirExecute(Self);
    end;
  end
  else begin
    agente.Operacao :=  'S';
    Modo;
  end;
end;

procedure TfrmAdministradorCEP.SalvaEnderecos;
begin
  if not (tbEnderecos.Active) then begin
    Exit;
  end;
  agente.Endereco.Codigo  :=  StrToInt(agente.Codigo);
  if not (agente.Endereco.Delete('CODIGO')) then begin
    Application.MessageBox('Erro ao Atualizar os Endereços o Agente (EX) !', 'Salvar Dados', MB_OK + MB_ICONERROR);
    Exit;
  end;
  if tbEnderecos.IsEmpty then begin
    Exit;
  end;
  tbEnderecos.First;
  while not (tbEnderecos.Eof) do begin
    agente.Endereco.Codigo          :=  StrToInt(agente.Codigo);
    agente.Endereco.MaxSeq;
    agente.Endereco.Tipo            :=  tbEnderecosDES_TIPO.AsString;
    agente.Endereco.Correspondencia :=  0;
    agente.Endereco.Endereco        :=  tbEnderecosDES_LOGRADOURO.AsString;
    agente.Endereco.Numero          :=  tbEnderecosNUM_LOGRADOURO.AsString;
    agente.Endereco.Complemento     :=  tbEnderecosDES_COMPLEMENTO.AsString;
    agente.Endereco.Cep             :=  tbEnderecosNUM_CEP.AsString;
    agente.Endereco.Referencia      :=  tbEnderecosDES_REFERENCIA.AsString;
    agente.Endereco.Bairro          :=  tbEnderecosDES_BAIRRO.AsString;
    agente.Endereco.Cidade          :=  tbEnderecosNOM_CIDADE.AsString;
    agente.Endereco.UF              :=  tbEnderecosUF_ESTADO.AsString;
    if not (agente.Endereco.Insert()) then begin
      Application.MessageBox('Erro ao Atualizar os Endereços o Agente (INS) !', 'Salvar Dados', MB_OK + MB_ICONERROR);
      Break;
      Exit;
    end;
    tbEnderecos.Next;
  end;
  tbEnderecos.First;
end;

procedure TfrmAdministradorCEP.SalvaContatos;
begin
    if not (tbContatos.Active) then begin
    Exit;
  end;
  if tbContatos.IsEmpty then begin
    Exit;
  end;
  agente.Contato.Codigo  :=  StrToInt(agente.Codigo);
  if not (agente.Contato.Delete('CODIGO')) then begin
    Application.MessageBox('Erro ao Atualizar os Contatos o Agente (EX) !', 'Salvar Dados', MB_OK + MB_ICONERROR);
    Exit;
  end;
  tbContatos.First;
  while not (tbContatos.Eof) do begin
    agente.Contato.Codigo     :=  StrToInt(agente.Codigo);
    agente.Contato.MaxSeq;
    agente.Contato.Contato    :=  tbContatosDES_CONTATO.AsString;
    agente.Contato.Telefone   :=  tbContatosNUM_TELEFONE.AsString;
    agente.Contato.EMail      :=  tbContatosDES_EMAIL.AsString;
    if not (agente.Contato.Insert()) then begin
      Application.MessageBox('Erro ao Atualizar os Endereços o Agente (INS) !', 'Salvar Dados', MB_OK + MB_ICONERROR);
      Break;
      Exit;
    end;
    tbContatos.Next;
  end;
  tbContatos.First;
end;

function TfrmAdministradorCEP.SalvaTabelaEndereco(): Boolean;
var
  bFlag : Boolean;
begin
  bFlag   :=  False;
  Result  :=  bFlag;
  if TUtil.Empty(cxLogradouro.Text) then begin
    Result  :=  True;
    Exit;
  end;
  if TUtil.Empty(cxTipoEndereco.Text) then begin
    Application.MessageBox('Informe o Tipo de Endereço!','Atenção!', MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if not (tbEnderecos.IsEmpty) then begin
    tbEnderecos.First;
  end;
  while not (tbEnderecos.Eof) do begin
    if tbEnderecosDES_TIPO.AsString = cxTipoEndereco.Text then begin
      tbEnderecos.Edit;
      tbEnderecosDES_LOGRADOURO.AsString        :=  cxLogradouro.Text;
      tbEnderecosNUM_LOGRADOURO.AsString        :=  cxNumero.Text;
      tbEnderecosDES_COMPLEMENTO.AsString       :=  cxComplemento.Text;
      tbEnderecosDOM_CORRESPONDENCIA.AsInteger  :=  0;
      tbEnderecosDES_BAIRRO.AsString            :=  cxBairro.Text;
      tbEnderecosNOM_CIDADE.AsString            :=  cxCidade.Text;
      tbEnderecosUF_ESTADO.AsString             :=  cxUF.Text;
      tbEnderecosNUM_CEP.AsString               :=  cxCEP.Text;
      tbEnderecosDES_REFERENCIA.AsString        :=  cxReferencia.Text;
      tbEnderecos.Post;
      bFlag :=  True;
    end;
    tbEnderecos.Next;
  end;
  if not (bFlag) then begin
    tbEnderecos.Insert;
    tbEnderecosDES_TIPO.AsString              :=  cxTipoEndereco.Text;
    tbEnderecosDES_LOGRADOURO.AsString        :=  cxLogradouro.Text;
    tbEnderecosNUM_LOGRADOURO.AsString        :=  cxNumero.Text;
    tbEnderecosDES_COMPLEMENTO.AsString       :=  cxComplemento.Text;
    tbEnderecosDOM_CORRESPONDENCIA.AsInteger  :=  0;
    tbEnderecosDES_BAIRRO.AsString            :=  cxBairro.Text;
    tbEnderecosNOM_CIDADE.AsString            :=  cxCidade.Text;
    tbEnderecosUF_ESTADO.AsString             :=  cxUF.Text;
    tbEnderecosNUM_CEP.AsString               :=  cxCEP.Text;
    tbEnderecosDES_REFERENCIA.AsString        :=  cxReferencia.Text;
    tbEnderecos.Post;
    bFlag :=  True;
  end;
  if not (tbEnderecos.IsEmpty) then begin
    tbEnderecos.First;
  end;
  Result  :=  bFlag;
end;

procedure TfrmAdministradorCEP.PopulaEstados;
begin
  cxUF.Properties.Items.Clear;
  if not (estado.getObjects()) then begin
    Exit;
  end;
  dm.qryGetObject.First;
  while not (dm.qryGetObject.Eof) do begin
    cxUF.Properties.Items.Add(dm.qryGetObject.FieldByName('UF_ESTADO').AsString);
    dm.qryGetObject.Next;
  end;
  dm.qryGetObject.Close;
  dm.qryGetObject.SQL.Clear;
end;

procedure TfrmAdministradorCEP.ListaCentroCusto;
var
  sId : String;
begin
  if Pos(agente.Operacao,'IU') = 0 then begin
    Exit;
  end;
  sId         :=  '';
  Screen.Cursor :=  crHourGlass;
  sId           :=  Trim(cxBanco.Text);
  with dm.qryPesquisa do begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT COD_CENTRO_CUSTO AS "Código", DES_CENTRO_CUSTO AS "Descrição" ' +
                'FROM TBCENTROCUSTO ';
    dm.ZConn.PingServer;
    Open;
  end;
  if dm.qryPesquisa.IsEmpty then begin
    dm.qryPesquisa.Close;
    dm.qryPesquisa.SQL.Clear;
    Exit;
  end
  else begin
    dm.qryPesquisa.First;
  end;
  if not Assigned(frmListaApoio) then begin
    frmListaApoio :=  TfrmListaApoio.Create(Application);
  end;
  frmListaApoio.Caption                                 :=  'Centro de custo';
  Screen.Cursor                                         :=  crDefault;
  if frmListaApoio.ShowModal = mrOk then begin
    cxCentroCusto.Text          :=  dm.qryPesquisa.Fields[0].AsString;
    cxCentroCusto.Refresh;
    cxDescricaoCentroCusto.Text :=  dm.qryPesquisa.Fields[1].AsString;
    cxDescricaoCentroCusto.Refresh;
  end;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  FreeAndNil(frmListaApoio);
end;

procedure TfrmAdministradorCEP.PopulaGrupos;
begin
  cxGrupoVerba.Properties.Items.Clear;
  with dm.qryPesquisa do begin
    Close;
    SQL.Clear;
    SQL.Text  :=  'SELECT DISTINCT(COD_GRUPO) AS GRUPO FROM TBGRUPOSVERBA';
    dm.ZConn.PingServer;
    Open;
    if not (Eof) then begin
      First;
    end;
    cxGrupoVerba.Properties.Items.Add('0');
    while not (Eof) do begin
      cxGrupoVerba.Properties.Items.Add(dm.qryPesquisa.FieldByName('GRUPO').AsString);
      Next;
    end;
    Close;
    SQL.Clear;
  end;
end;

end.
