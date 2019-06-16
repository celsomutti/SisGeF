unit ufrmAgentes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, ActnList, dxBar, cxClasses, clAgentes, clEstados, clEntregador,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxTextEdit, cxLabel, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxCheckBox, cxMemo, cxButtonEdit, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxmdaset, Menus, StdCtrls,
  cxButtons, cxCurrencyEdit, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinsdxBarPainter,
  cxPCdxBarPopupMenu, cxPC, cxGroupBox, cxCalc, cxImage, ExtCtrls, clBancos, Vcl.ComCtrls, dxCore, cxDateUtils, cxNavigator;

type
  TfrmAgentes = class(TForm)
    aclCadastro: TActionList;
    actCadastroIncluir: TAction;
    actCadastroEditar: TAction;
    actCadastroExcluir: TAction;
    actCadastroCancelar: TAction;
    actCadastroSalvar: TAction;
    actCadastroImprimir: TAction;
    actCadastroLocalizar: TAction;
    actCadastroSair: TAction;
    tbContatos: TdxMemData;
    tbContatosDES_CONTATO: TStringField;
    tbContatosNUM_TELEFONE: TStringField;
    tbContatosDES_EMAIL: TStringField;
    dsContato: TDataSource;
    tbContatosSEQ_CONTATO: TIntegerField;
    actCadastroExcluirEndereco: TAction;
    actCadastroListaApoio: TAction;
    Panel1: TPanel;
    cxImage1: TcxImage;
    cxLabel16: TcxLabel;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxTipoDoc: TcxComboBox;
    cxLabel3: TcxLabel;
    cxCPF: TcxMaskEdit;
    cxLabel4: TcxLabel;
    cxNome: TcxTextEdit;
    cxLabel5: TcxLabel;
    cxAlias: TcxTextEdit;
    cxLabel6: TcxLabel;
    cxRG: TcxTextEdit;
    cxLabel7: TcxLabel;
    cxIEST: TcxTextEdit;
    cxLabel8: TcxLabel;
    cxIM: TcxTextEdit;
    cxLabel9: TcxLabel;
    cxCNAE: TcxTextEdit;
    cxLabel10: TcxLabel;
    cxCRT: TcxTextEdit;
    cxLabel11: TcxLabel;
    cxCNH: TcxTextEdit;
    cxLabel12: TcxLabel;
    cxValidade: TcxDateEdit;
    cxLabel13: TcxLabel;
    cxCategoria: TcxTextEdit;
    cxLabel14: TcxLabel;
    cxLabel21: TcxLabel;
    cxLabel17: TcxLabel;
    cxLabel18: TcxLabel;
    cxLabel19: TcxLabel;
    cxTipoEndereco: TcxComboBox;
    cxCEP: TcxMaskEdit;
    cxEndereco: TcxTextEdit;
    cxNumero: TcxTextEdit;
    cxComplemento: TcxTextEdit;
    cxLabel22: TcxLabel;
    cxBairro: TcxTextEdit;
    cxLabel23: TcxLabel;
    cxCidade: TcxTextEdit;
    cxLabel24: TcxLabel;
    cxEstado: TcxComboBox;
    cxLabel25: TcxLabel;
    cxReferencia: TcxTextEdit;
    cxButton1: TcxButton;
    cxObs: TcxMemo;
    cxLabel33: TcxLabel;
    cxLabel28: TcxLabel;
    cxStatus: TcxComboBox;
    cxLabel29: TcxLabel;
    cxCadastro: TcxDateEdit;
    cxLabel15: TcxLabel;
    cxVerba: TcxCalcEdit;
    cxCodigo: TcxMaskEdit;
    cxTabSheet2: TcxTabSheet;
    cxLabel26: TcxLabel;
    cxBanco: TcxButtonEdit;
    cxNomeBanco: TcxTextEdit;
    cxLabel27: TcxLabel;
    cxTipoConta: TcxComboBox;
    cxLabel30: TcxLabel;
    cxAgencia: TcxTextEdit;
    cxLabel31: TcxLabel;
    cxConta: TcxTextEdit;
    cxLabel32: TcxLabel;
    cxFavorecido: TcxTextEdit;
    cxLabel34: TcxLabel;
    cxLabel35: TcxLabel;
    cxFormaPagamento: TcxComboBox;
    cxTabSheet3: TcxTabSheet;
    cxContatos: TcxGrid;
    cxContatosDBTableView1: TcxGridDBTableView;
    cxContatosDBTableView1SEQ_CONTATO: TcxGridDBColumn;
    cxContatosDBTableView1DES_CONTATO: TcxGridDBColumn;
    cxContatosDBTableView1NUM_TELEFONE: TcxGridDBColumn;
    cxContatosDBTableView1DES_EMAIL: TcxGridDBColumn;
    cxContatosLevel1: TcxGridLevel;
    cxCpfCnpjFavorecido: TcxTextEdit;
    cxTabSheet4: TcxTabSheet;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dsPesquisa: TDataSource;
    cxGrid1DBTableView1COD_AGENTE: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_CNPJ: TcxGridDBColumn;
    cxGrid1DBTableView1DES_RAZAO_SOCIAL: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_FANTASIA: TcxGridDBColumn;
    actCadastroPesquisar: TAction;
    actCadastroIdentificacao: TAction;
    actCadastroContatos: TAction;
    actCadastroBanco: TAction;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxButton5: TcxButton;
    cxButton6: TcxButton;
    cxButton7: TcxButton;
    cxButton8: TcxButton;
    cxButton9: TcxButton;
    cxButton13: TcxButton;
    cxButton10: TcxButton;
    cxButton11: TcxButton;
    cxButton14: TcxButton;
    cxButton12: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure cxTipoDocPropertiesChange(Sender: TObject);
    procedure cxIESTKeyPress(Sender: TObject; var Key: Char);
    procedure cxCRTKeyPress(Sender: TObject; var Key: Char);
    procedure cxCNAEKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxTipoEnderecoPropertiesChange(Sender: TObject);
    procedure actCadastroExcluirEnderecoExecute(Sender: TObject);
    procedure actCadastroIncluirExecute(Sender: TObject);
    procedure actCadastroExcluirExecute(Sender: TObject);
    procedure actCadastroCancelarExecute(Sender: TObject);
    procedure actCadastroSalvarExecute(Sender: TObject);
    procedure actCadastroSairExecute(Sender: TObject);
    procedure actCadastroImprimirExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxEnderecoPropertiesChange(Sender: TObject);
    procedure LimparFields;
    procedure cxCodigoPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure actCadastroListaApoioExecute(Sender: TObject);
    procedure cxBancoPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
      AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure actCadastroEditarExecute(Sender: TObject);
    procedure actCadastroPesquisarExecute(Sender: TObject);
    procedure actCadastroIdentificacaoExecute(Sender: TObject);
    procedure actCadastroContatosExecute(Sender: TObject);
    procedure actCadastroBancoExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetupForm;
    procedure LimpaEndereco;
    procedure SetupEndereco;
    procedure SetupClassAgente;
    procedure SetupClassEndereco;
    procedure PopulaEstados;
    procedure Modo;
    procedure ListaBancos;
    procedure ListaAgentes;
  end;

var
  frmAgentes  : TfrmAgentes;
  agente      : TAgente;
  estado      : TEstados;
  entregador  : TEntregador;
  bancos      : TBancos;

implementation

uses udm, clUtil, ufrmPrincipal, ZDataset, uGlobais, ufrmListaApoio,
  clPessoaJ;

{$R *.dfm}

procedure TfrmAgentes.FormShow(Sender: TObject);
begin
  if not (dm.ZConn.Connected) then
    dm.ZConn.Connect;
  agente          :=  TAgente.Create();
  estado          :=  TEstados.Create();
  entregador      :=  TEntregador.Create();
  bancos          :=  TBancos.Create();
  PopulaEstados;
  agente.Operacao :=  'I';
  Modo;
  cxPageControl1.ActivePageIndex  :=  0;
end;

procedure TfrmAgentes.cxTipoDocPropertiesChange(Sender: TObject);
begin
  if cxTipoDoc.Text  = 'CPF' then
    cxCPF.Properties.EditMask :=  '000\.000\.000\-00;1; '
  else
    cxCPF.Properties.EditMask :=  '00\.000\.000\/0000\-00;1; ';
end;

procedure TfrmAgentes.cxIESTKeyPress(Sender: TObject; var Key: Char);
begin
  Key         :=  TUtil.SoNumero(Key);
end;

procedure TfrmAgentes.cxCRTKeyPress(Sender: TObject; var Key: Char);
begin
  Key         :=  TUtil.SoNumero(Key);
end;

procedure TfrmAgentes.cxCNAEKeyPress(Sender: TObject; var Key: Char);
begin
  Key         :=  TUtil.SoNumero(Key);
end;

procedure TfrmAgentes.FormActivate(Sender: TObject);
begin
  ListaAgentes;
end;

procedure TfrmAgentes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  agente.Free;
  estado.Free;
  entregador.Free;
  bancos.Free;
  Action      :=  caFree;
  frmAgentes  :=  Nil;
end;

procedure TfrmAgentes.SetupForm;
begin
  LimparFields;
  cxLabel16.Caption := 'Agentes ';
  if agente.TipoDoc = 'CNPJ' then begin
    cxTipoDoc.ItemIndex :=  0;
  end
  else begin
    cxTipoDoc.ItemIndex :=  1;
  end;
  tbContatos.Close;
  tbContatos.Open;
  cxCodigo.Text             :=  agente.Codigo;
  cxTipoDoc.Text            :=  agente.TipoDoc;
  cxCPF.Text                :=  agente.Cnpj;
  cxNome.Text               :=  agente.Razao;
  cxAlias.Text              :=  agente.Fantasia;
  cxRG.Text                 :=  agente.IE;
  cxCNH.Text                :=  agente.Cnh;
  cxCategoria.Text          :=  agente.CategoriaCnh;
  cxValidade.Date           :=  agente.ValidadeCnh;
  cxIEST.Text               :=  agente.IEST;
  cxIM.Text                 :=  agente.IM;
  cxCNAE.Text               :=  agente.Cnae;
  cxCRT.Text                :=  IntToStr(agente.Crt);
  agente.Endereco.Codigo    :=  StrToInt(agente.Codigo);
  if agente.Endereco.getObject(cxTipoEndereco.Text,'TIPO') then begin
    SetupEndereco;
  end;
  cxStatus.ItemIndex        :=  StrToInt(agente.Status);
  cxCadastro.Date           :=  StrToDate(agente.DtCadastro);
  cxVerba.Value             :=  agente.Verba;
  cxObs.Text                :=  agente.Obs;
  cxTipoConta.Text          :=  agente.TipoConta;
  cxBanco.Text              :=  agente.Banco;
  if not (TUtil.Empty(cxBanco.Text)) then begin
    if bancos.getObject(cxBanco.Text,'CODIGO') then begin
      cxNomeBanco.Text  :=  bancos.Nome;
    end
    else begin
      cxNomeBanco.Text  :=  '- - -';
    end;
    cxNomeBanco.Refresh;
  end;
  cxAgencia.Text            :=  agente.Agencia;
  cxConta.Text              :=  agente.NumeroConta;
  cxFavorecido.Text         :=  agente.Favorecido;
  cxCpfCnpjFavorecido.Text  :=  agente.CpfCnpjFavorecido;
  cxFormaPagamento.Text     :=  agente.Forma;
  if agente.Contato.getObject(agente.Codigo,'CODIGO') then begin
    dm.qryGetObject.First;
    if tbContatos.Active then begin
      tbContatos.Close;
    end;
    tbContatos.Open;
    while not (dm.qryGetObject.Eof) do begin
      tbContatos.Insert;
      tbContatosDES_CONTATO.Value   :=  dm.qryGetObject.FieldByName('DES_CONTATO').AsString;
      tbContatosNUM_TELEFONE.Value  :=  dm.qryGetObject.FieldByName('NUM_TELEFONE').AsString;
      tbContatosDES_EMAIL.Value     :=  dm.qryGetObject.FieldByName('DES_EMAIL').AsString;
      tbContatos.Post;
      dm.qryGetObject.Next;
    end;
  end;
  cxLabel16.Caption :=  'Agente: ' + agente.Codigo + ' - ' + agente.Fantasia + ' ';
  agente.Operacao := 'U';
  Modo;
end;

procedure TfrmAgentes.LimpaEndereco;
begin
  if agente.Operacao = 'I' then begin
    cxTipoEndereco.ItemIndex  :=  0;
  end;
  cxCEP.Clear;
  cxEndereco.Clear;
  cxNumero.Clear;
  cxComplemento.Clear;
  cxBairro.Clear;
  cxCidade.Clear;
  cxEstado.Clear;
  cxReferencia.Clear;
end;

procedure TfrmAgentes.cxTipoEnderecoPropertiesChange(Sender: TObject);
begin
  if agente.Operacao = 'U' then begin
    LimpaEndereco;
    agente.Endereco.Codigo  :=  StrToInt(agente.Codigo);
    if agente.Endereco.getObject(cxTipoEndereco.Text,'TIPO') then begin
      SetupEndereco;
    end;
  end;

end;

procedure TfrmAgentes.SetupEndereco;
begin
  LimpaEndereco;
  cxTipoEndereco.Text :=  agente.Endereco.Tipo;
  cxCEP.Text          :=  agente.Endereco.Cep;
  cxEndereco.Text     :=  agente.Endereco.Endereco;
  cxNumero.Text       :=  agente.Endereco.Numero;
  cxComplemento.Text  :=  agente.Endereco.Complemento;
  cxBairro.Text       :=  agente.Endereco.Bairro;
  cxCidade.Text       :=  agente.Endereco.Cidade;
  cxEstado.Text       :=  agente.Endereco.UF;
  cxReferencia.Text   :=  agente.Endereco.Referencia;
end;

procedure TfrmAgentes.actCadastroContatosExecute(Sender: TObject);
begin
  cxPageControl1.Properties.ActivePage  := cxTabSheet3;
end;

procedure TfrmAgentes.actCadastroEditarExecute(Sender: TObject);
var
  sCodigo : String;
begin
  if cxPageControl1.ActivePageIndex <> 0 then begin
    Exit;
  end;
  sCodigo :=  cxGrid1DBTableView1COD_AGENTE.DataBinding.Field.AsString;
  if agente.getObject(sCodigo,'CODIGO') then begin
    SetupForm;
    agente.Operacao :=  'U';
    Modo;
    cxPageControl1.ActivePageIndex  :=  1;
end;
end;

procedure TfrmAgentes.actCadastroExcluirEnderecoExecute(
  Sender: TObject);
begin
  if Application.MessageBox('Confirma Excluir este Endereço?','Excluir Endereço',MB_ICONQUESTION + MB_YESNO) = IDNO then begin
    Exit;
  end;
  if not (agente.Endereco.Delete('TIPO')) then begin
    MessageDlg('Não foi possível Excluir este endereço!',mtWarning,[mbOK],0);
    Exit;
  end;
  if agente.Endereco.getObject(cxTipoEndereco.Text,'TIPO') then
    SetupEndereco
  else begin
    LimpaEndereco;
  end;
end;

procedure TfrmAgentes.actCadastroIncluirExecute(Sender: TObject);
begin
  LimparFields;
  cxLabel16.Caption := 'Agentes ';
  tbContatos.Close;
  tbContatos.Open;
  agente.Operacao :=  'I';
  Modo;
  cxPageControl1.ActivePageIndex  :=  1;
  cxCodigo.SetFocus;
end;

procedure TfrmAgentes.actCadastroExcluirExecute(Sender: TObject);
begin
  if dm.qryPesquisa.IsEmpty then begin
    Exit;
  end;
  if cxContatos.IsFocused then begin
    Exit;
  end;
  cxPageControl1.ActivePageIndex  := 1;
  entregador.Codigo :=  agente.Codigo;
  if entregador.getObject(agente.Codigo,'AGENTE') then begin
    MessageDlg('Existem Entregadores cadastrados para este Agente! Exclusão de Agente Cancelada.',mtWarning,[mbOK],0);
    Exit;
  end;
  if Application.MessageBox('Confirma Excluir este Agente?','Excluir Agente', MB_ICONQUESTION + MB_YESNO) = IDNO then
    Exit;
  if not (agente.Delete('CODIGO')) then begin
    MessageDlg('Não foi possível Excluir este Agente!',mtWarning,[mbOK],0);
    Exit;
  end;
end;

procedure TfrmAgentes.actCadastroBancoExecute(Sender: TObject);
begin
  cxPageControl1.Properties.ActivePage  := cxTabSheet2;
end;

procedure TfrmAgentes.actCadastroCancelarExecute(Sender: TObject);
begin
  LimparFields;
  cxLabel16.Caption := 'Agentes ';
  tbContatos.Close;
  tbContatos.Open;
  agente.Operacao :=  'I';
  LimpaEndereco;
  Modo;
  cxPageControl1.ActivePageIndex := 0;
end;

procedure TfrmAgentes.SetupClassAgente;
begin
  agente.Codigo             :=  Trim(cxCodigo.Text);
  agente.TipoDoc            :=  cxTipoDoc.Text;
  agente.Cnpj               :=  cxCPF.Text;
  agente.Razao              :=  cxNome.Text;
  agente.Fantasia           :=  cxAlias.Text;
  agente.IE                 :=  cxRG.Text;
  agente.Cnh                :=  cxCNH.Text;
  agente.CategoriaCnh       :=  cxCategoria.Text;
  if not (TUtil.Empty(cxValidade.Text)) then begin
    agente.ValidadeCnh  :=  cxValidade.Date;
  end;
  agente.IEST               :=  cxIEST.Text;
  agente.IM                 :=  cxIM.Text ;
  agente.Cnae               :=  cxCNAE.Text;
  if not (TUtil.Empty(cxCRT.Text)) then
    agente.Crt  :=  StrToInt(cxCRT.Text)
  else
    agente.Crt  :=  0;
  SetupClassEndereco;
  agente.Status             :=  IntToStr(cxStatus.ItemIndex);
  agente.DtCadastro         :=  cxCadastro.Text;
  agente.Verba              :=  cxVerba.Value;
  agente.DtAlteracaop       :=  Now;
  agente.Obs                :=  cxObs.Text;
  agente.TipoConta          :=  cxTipoConta.Text;
  agente.Banco              :=  cxBanco.Text;
  agente.Agencia            :=  cxAgencia.Text;
  agente.NumeroConta        :=  cxConta.Text;
  agente.Favorecido         :=  cxFavorecido.Text;
  agente.CpfCnpjFavorecido  :=  cxCpfCnpjFavorecido.Text;
  agente.Forma              :=  cxFormaPagamento.Text;
end;

procedure TfrmAgentes.SetupClassEndereco;
begin
  agente.Endereco.Codigo          :=  StrToInt(agente.Codigo);
  agente.Endereco.Tipo            :=  cxTipoEndereco.Text;
  agente.Endereco.Cep             :=  cxCEP.Text;
  agente.Endereco.Correspondencia :=  0;
  agente.Endereco.Endereco        :=  cxEndereco.Text;
  agente.Endereco.Numero          :=  cxNumero.Text;
  agente.Endereco.Complemento     :=  cxComplemento.Text;
  agente.Endereco.Bairro          :=  cxBairro.Text;
  agente.Endereco.Cidade          :=  cxCidade.Text;
  agente.Endereco.UF              :=  cxEstado.Text;
  agente.Endereco.Referencia      :=  cxReferencia.Text;
end;

procedure TfrmAgentes.PopulaEstados;
begin
  cxEstado.Properties.Items.Clear;
  if estado.getObjects then begin
    while not (dm.qryGetObject.Eof) do begin
      cxEstado.Properties.Items.Add(dm.qryGetObject.FieldByName('UF_ESTADO').AsString);
      dm.qryGetObject.Next;
    end;
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
  end;
  cxEstado.ItemIndex  :=  -1;
end;

procedure TfrmAgentes.actCadastroSalvarExecute(Sender: TObject);
begin
  if cxPageControl1.ActivePageIndex = 0 then begin
    Exit;
  end;
  SetupClassAgente;
  if not (agente.Validar()) then
    Exit;
  if Application.MessageBox('Deseja salvar os dados?','Salvar',MB_ICONQUESTION + MB_YESNO) = IDNO then begin
    Exit;
  end;
  if agente.Operacao = 'I' then begin
    if TUtil.Empty(agente.DtCadastro) then begin
      agente.DtCadastro := DateToStr(Now);
    end;
    if not (agente.Insert) then begin
      MessageDlg('Não foi Possível Incluir os Dados!', mtWarning, [mbOK],0);
      Exit;
    end;
    if not (TUtil.Empty(cxEndereco.Text)) then begin
      if agente.Endereco.EnderecoJaExiste then begin
        if not (agente.Endereco.Update) then begin
          MessageDlg('Não foi possível alterar o Endereço!', mtWarning,[mbOK],0);
        end;
      end
      else if not (agente.Endereco.Insert) then begin
        MessageDlg('Não foi Possível Incluir o Endereço!', mtWarning, [mbOK],0);
      end;
    end;
  end
  else if agente.Operacao = 'U' then begin
    if not (agente.Update) then begin
      MessageDlg('Não foi Possível Alterar os Dados!', mtWarning, [mbOK],0);
      Exit;
    end;
    if not (TUtil.Empty(cxEndereco.Text)) then begin
      if agente.Endereco.EnderecoJaExiste then begin
        if not (agente.Endereco.Update) then begin
          MessageDlg('Não foi possível alterar o Endereço!', mtWarning,[mbOK],0);
        end;
      end
      else if not (agente.Endereco.Insert) then begin
        MessageDlg('Não foi Possível Incluir o Endereço!', mtWarning, [mbOK],0);
      end;
    end;
  end;
  agente.Contato.Codigo := StrToInt(agente.Codigo);
  if not (agente.Contato.Delete('CODIGO')) then begin
    MessageDlg('Erro ao tentar Preparar a Tabela de Contatos!',mtError,[mbOK],0);
    Exit;
  end;
  if tbContatos.RecordCount > 0 then begin
    tbContatos.First;
  end;
  while not (tbContatos.Eof) do begin
    agente.Contato.Codigo     :=  StrToInt(agente.Codigo);
    agente.Contato.Contato    :=  tbContatosDES_CONTATO.AsString;
    agente.Contato.Telefone   :=  tbContatosNUM_TELEFONE.AsString;
    agente.Contato.EMail      :=  tbContatosDES_EMAIL.AsString;
    if not (agente.Contato.Insert) then begin
      MessageDlg('Erro ao tentar Incluir os Contatos!',mtError,[mbOK],0);
      tbContatos.Last;
    end;
    tbContatos.Next;
  end;
  agente.Operacao :=  'U';
  Modo;
  MessageDlg('Dados Salvos com Sucesso!',mtInformation,[mbOK],0);
  LimparFields;
  ListaAgentes;
end;
procedure TfrmAgentes.actCadastroSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmAgentes.actCadastroIdentificacaoExecute(Sender: TObject);
begin
  cxPageControl1.Properties.ActivePage  := cxTabSheet1;
end;

procedure TfrmAgentes.actCadastroImprimirExecute(Sender: TObject);
begin
  if Application.MessageBox('Confirma a impressão da tela?', 'Imprimir',MB_YESNO + MB_ICONQUESTION) = IDYES then
    PrintScale := poProportional;
  {OU}
  //PrintScale := poNone;
  {OU}
  //PrintScale := poPrintToFit;
  Print;
end;

procedure TfrmAgentes.Modo;
begin
  if agente.operacao = 'I' then begin
    actCadastroIncluir.Enabled      :=  True;
    actCadastroExcluir.Enabled      :=  False;
    actCadastroCancelar.Enabled     :=  True;
    actCadastroSalvar.Enabled       :=  True;
    actCadastroLocalizar.Enabled    :=  True;
    actCadastroImprimir.Enabled     :=  True;
    actCadastroSair.Enabled         :=  True;
    cxCadastro.Properties.ReadOnly  :=  False;
    cxTipoEndereco.ItemIndex        :=  0;
    cxStatus.ItemIndex              :=  1;
    cxCodigo.Properties.ReadOnly    :=  False;
  end
  else if agente.operacao = 'U' then begin
    actCadastroIncluir.Enabled      :=  True;
    actCadastroExcluir.Enabled      :=  True;
    actCadastroCancelar.Enabled     :=  True;
    actCadastroSalvar.Enabled       :=  True;
    actCadastroLocalizar.Enabled    :=  False;
    actCadastroImprimir.Enabled     :=  True;
    actCadastroSair.Enabled         :=  True;
    cxCadastro.Properties.ReadOnly  :=  True;
    cxCodigo.Properties.ReadOnly    :=  True;
  end
  else begin
    actCadastroIncluir.Enabled      :=  True;
    actCadastroExcluir.Enabled      :=  False;
    actCadastroCancelar.Enabled     :=  True;
    actCadastroSalvar.Enabled       :=  True;
    actCadastroLocalizar.Enabled    :=  True;
    actCadastroImprimir.Enabled     :=  True;
    actCadastroSair.Enabled         :=  True;
    cxCadastro.Properties.ReadOnly  :=  False;
    cxTipoEndereco.ItemIndex        :=  0;
    cxStatus.ItemIndex              :=  1;
    cxCodigo.Properties.ReadOnly    :=  False;
  end;
end;

procedure TfrmAgentes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_UP   : ; // Seta para cima;
    VK_DOWN : ; // Seta para baixo;
    027 : actCadastroCancelarExecute(sender) ;// Esc
    112 : ;// F1
    113 : ;// F2
    114 : ;// F3
    115 : ;// F4
    116 : ;// F5
    117 : ;// F6
    118 : ;// F7
    119 : ;// F8
    120 : ;// F9
    121 : ;// F10
    122 : ;// F11
    123 : ;// F12
  end;
end;

procedure TfrmAgentes.cxEnderecoPropertiesChange(Sender: TObject);
begin
  if agente.Operacao = 'U' then
    actCadastroExcluirEndereco.Enabled := not (TUtil.Empty(cxEndereco.Text));
end;


procedure TfrmAgentes.cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  if not (dm.qryPesquisa.IsEmpty) then begin
    actCadastroEditarExecute(Sender);
  end;
end;

procedure TfrmAgentes.LimparFields;
var
  i : integer;
begin
  for i:=0 to ComponentCount - 1 do begin
    // componentes CX
    if Components[i] is TcxTextEdit then
      (Components[i] as TcxTextEdit).Clear;

    if Components[i] is TcxComboBox then begin
      if (Components[i] as TcxComboBox).Tag <> -1 then begin
        (Components[i] as TcxComboBox).ItemIndex := -1;
      end;
    end;

    if Components[i] is TcxMemo then
      (Components[i] as TcxMemo).Clear;

    if Components[i] is TcxButtonEdit then
      (Components[i] as TcxButtonEdit).Clear;

    if Components[i] is TcxMaskEdit then
      (Components[i] as TcxMaskEdit).Clear;

{    if Components[i] is TcxSpinEdit  then
      (Components[i] as TcxSpinEdit).Value := 0;}

    if Components[i] is TcxCurrencyEdit  then
      (Components[i] as TcxCurrencyEdit).Value := 0;

    if Components[i] is TcxCalcEdit  then
      (Components[i] as TcxCalcEdit).Value := 0;

    if Components[i] is TcxCheckBox  then begin
      if (Components[i] as TcxCheckBox).Tag <> -1 then begin
        (Components[i] as TcxCheckBox).Checked := False;
      end;
    end;

    if Components[i] is TcxDateEdit  then begin
      (Components[i] as TcxDateEdit).Date   := 0;
      (Components[i] as TcxDateEdit).Clear;
    end;

{    if Components[i] is TcxTimeEdit  then begin
      (Components[i] as TcxTimeEdit).Time   := 0;
      (Components[i] as TcxTimeEdit).Clear;
    end;}
  end;
  cxLabel16.Caption := 'Agentes';
  cxPageControl1.ActivePageIndex  :=  0;
end;


procedure TfrmAgentes.cxCodigoPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if TUtil.Empty(cxCodigo.Text) then begin
    cxCodigo.Text :=  '0';
  end;
  if cxCodigo.Text = '0' then begin
    Exit;
  end;
  if agente.Operacao = 'I' then begin
    if agente.getObject(Trim(cxCodigo.Text),'CODIGO') then begin
      LimparFields;
      SetupForm;
      agente.Operacao :=  'U';
      Modo;
      Perform(WM_NEXTDLGCTL, 0, 0);
    end
    else begin
      Perform(WM_NEXTDLGCTL, 0, 0);
    end;
  end;
end;

procedure TfrmAgentes.ListaBancos;
var
  sId, sResultado : String;
begin
  if TUtil.Empty(agente.Operacao) then begin
    Exit;
  end;
  sId         :=  '';
  sResultado  :=  '';
  Screen.Cursor :=  crHourGlass;
  sId           :=  Trim(cxBanco.Text);
  if not (bancos.getObjects()) then begin
    Exit;
  end;
  if dm.tbApoio.Active then begin
    dm.tbApoio.Close;
  end;
  dm.tbApoio.Open;
  dm.tbApoio.CreateFieldsFromDataSet(dm.qryGetObject);
  dm.tbApoio.LoadFromDataSet(dm.qryGetObject);
  dm.qryGetObject.Close;
  dm.qryGetObject.SQL.Clear;
  if not (dm.tbApoio.IsEmpty) then begin
    dm.tbApoio.First;
  end
  else begin
    dm.tbApoio.Close;
    Exit;
  end;
  if not Assigned(frmListaApoio) then begin
    frmListaApoio :=  TfrmListaApoio.Create(Application);
  end;
  frmListaApoio.ds.DataSet.Refresh;
  frmListaApoio.cxGrid1DBTableView1.DataController.CreateAllItems;
  frmListaApoio.cxGrid1DBTableView1.Columns[1].Caption  :=  'Código';
  frmListaApoio.cxGrid1DBTableView1.Columns[2].Caption  :=  'Nome';
  frmListaApoio.iColuna                                 :=  3;
  frmListaApoio.Caption                                 :=  'Bancos';
  Screen.Cursor                                         :=  crDefault;
  frmListaApoio.ShowModal;
  if Resultado then begin
    sId                             :=  dm.tbApoio.FieldByName('COD_BANCO').AsString;
    cxBanco.Text                    :=  sId;
    cxBanco.Refresh;
    cxNomeBanco.Properties.ReadOnly :=  False;
    if bancos.getObject(sId,'CODIGO') then begin
      cxNomeBanco.Text  :=  bancos.Nome;
    end
    else begin
      cxNomeBanco.Text  :=  '- - -';
    end;
    cxNomeBanco.Refresh;
    cxNomeBanco.Properties.ReadOnly :=  True;
  end;
  dm.tbApoio.Close;
  frmListaApoio.Free;
end;

procedure TfrmAgentes.actCadastroListaApoioExecute(Sender: TObject);
begin
  if cxBanco.IsFocused then begin
    ListaBancos;
  end;
end;

procedure TfrmAgentes.actCadastroPesquisarExecute(Sender: TObject);
begin
  LimparFields;
  cxPageControl1.Properties.ActivePage  :=  cxTabSheet4;
end;

procedure TfrmAgentes.cxBancoPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if not (TUtil.Empty(cxBanco.Text)) then begin
    cxNomeBanco.Properties.ReadOnly :=  False;
    if bancos.getObject(cxBanco.Text,'CODIGO') then begin
      cxNomeBanco.Text  :=  bancos.Nome;
    end
    else begin
      cxNomeBanco.Text  :=  '- - -';
    end;
    cxNomeBanco.Refresh;
    cxNomeBanco.Properties.ReadOnly :=  True;
  end;
end;

procedure tfrmAgentes.ListaAgentes;
begin
  try
    dm.qryPesquisa.Close;
    dm.qryPesquisa.SQL.Clear;
    dm.ZConn.PingServer;
    with dm.qryPesquisa do begin
      if Active then begin
        Close;
        SQL.Clear;
      end;
      SQL.Add('SELECT COD_AGENTE, NUM_CNPJ, DES_RAZAO_SOCIAL, ');
      SQL.Add('NOM_FANTASIA FROM TBAGENTES');
      Open;
      if IsEmpty then begin
        Close;
        SQL.Clear;
        Exit;
      end;
      First;
    end;
  except on E: Exception do begin
      MessageDlg(E.Message,mtError,mbOKCancel,0);
    end;
  end;
end;

end.
