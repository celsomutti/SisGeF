unit ufrmEntregadores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
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
  ActnList, dxBar, cxClasses, clEntregador, clAgentes, clEstados, clEntrega,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, DB, cxDBData, cxMaskEdit, cxTextEdit,
  cxDropDownEdit, Menus, dxmdaset, StdCtrls, cxButtons, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridCustomView, cxGrid, cxMemo, cxCheckBox, cxCalendar, cxLabel,
  cxCurrencyEdit, cxButtonEdit, cxPCdxBarPopupMenu, cxGroupBox, cxPC,
  cxImage, ExtCtrls, clBancos, Vcl.ComCtrls, dxCore, cxDateUtils, cxNavigator;

type
  TfrmEntregadores = class(TForm)
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
    actCadastroImportar: TAction;
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    cxImage1: TcxImage;
    cxLabel27: TcxLabel;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxLabel1: TcxLabel;
    cxCodigo: TcxTextEdit;
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
    cxLabel15: TcxLabel;
    cxAgente: TcxButtonEdit;
    cxNomeAgente: TcxTextEdit;
    cxLabel14: TcxLabel;
    cxTipoEndereco: TcxComboBox;
    cxLabel21: TcxLabel;
    cxCEP: TcxMaskEdit;
    cxLabel17: TcxLabel;
    cxEndereco: TcxTextEdit;
    cxLabel18: TcxLabel;
    cxNumero: TcxTextEdit;
    cxLabel19: TcxLabel;
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
    cxLabel16: TcxLabel;
    cxDatCadastro: TcxDateEdit;
    cxLabel20: TcxLabel;
    cxLabel28: TcxLabel;
    cxVErbaEntrega: TcxCurrencyEdit;
    cxLabel29: TcxLabel;
    cxVerbaCombustivel: TcxCurrencyEdit;
    cxLabel30: TcxLabel;
    cxStatus: TcxComboBox;
    cxTabSheet2: TcxTabSheet;
    cxContatos: TcxGrid;
    cxContatosDBTableView1: TcxGridDBTableView;
    cxContatosDBTableView1SEQ_CONTATO: TcxGridDBColumn;
    cxContatosDBTableView1DES_CONTATO: TcxGridDBColumn;
    cxContatosDBTableView1NUM_TELEFONE: TcxGridDBColumn;
    cxContatosDBTableView1DES_EMAIL: TcxGridDBColumn;
    cxContatosLevel1: TcxGridLevel;
    cxTabSheet3: TcxTabSheet;
    cxLabel26: TcxLabel;
    cxBanco: TcxButtonEdit;
    cxNomeBanco: TcxTextEdit;
    cxLabel31: TcxLabel;
    cxTipoConta: TcxComboBox;
    cxLabel32: TcxLabel;
    cxAgencia: TcxTextEdit;
    cxLabel33: TcxLabel;
    cxConta: TcxTextEdit;
    cxLabel34: TcxLabel;
    cxFavorecido: TcxTextEdit;
    cxLabel35: TcxLabel;
    cxLabel36: TcxLabel;
    cxFormaPagamento: TcxComboBox;
    cxFuncionario: TcxComboBox;
    cxLabel37: TcxLabel;
    cxCpfCnpjFavorecido: TcxTextEdit;
    cxTabSheet4: TcxTabSheet;
    dsPesquisa: TDataSource;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1COD_AGENTE: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_CNPJ: TcxGridDBColumn;
    cxGrid1DBTableView1DES_RAZAO_SOCIAL: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_FANTASIA: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxButton5: TcxButton;
    cxButton6: TcxButton;
    cxButton7: TcxButton;
    actCadastroPesquisa: TAction;
    actCadastroContatos: TAction;
    actCadastroBanco: TAction;
    cxButton8: TcxButton;
    cxButton9: TcxButton;
    cxButton10: TcxButton;
    actCadastroIdentificacao: TAction;
    cxButton11: TcxButton;
    cxButton12: TcxButton;
    cxButton13: TcxButton;
    cxButton14: TcxButton;
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
    procedure actCadastroListaApoioExecute(Sender: TObject);
    procedure cxAgentePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure actCadastroImportarExecute(Sender: TObject);
    procedure cxCodigoPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cxBancoPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cxCpfCnpjFavorecidoPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
      AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure actCadastroEditarExecute(Sender: TObject);
    procedure actCadastroPesquisaExecute(Sender: TObject);
    procedure actCadastroContatosExecute(Sender: TObject);
    procedure actCadastroBancoExecute(Sender: TObject);
    procedure actCadastroIdentificacaoExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetupForm;
    procedure LimpaEndereco;
    procedure SetupEndereco;
    procedure SetupClassEntregador;
    procedure SetupClassEndereco;
    procedure PopulaEstados;
    procedure Modo;
    procedure LimparFields;
    procedure ListaAgentes;
    Procedure ListaBancos;
    procedure ListaEntregadores;

    function TrataComplemento(sLinha: String): String;
    function Importar(): Boolean;

  end;

var
  frmEntregadores : TfrmEntregadores;
  entregador      : TEntregador;
  agente          : TAgente;
  estado          : TEstados;
  entrega         : TEntrega;
  bancos          : TBancos;
  sArquivo        : String;

implementation

uses udm, clUtil, ufrmPrincipal, ZDataset, ufrmListaApoio, uGlobais;

{$R *.dfm}

procedure TfrmEntregadores.FormShow(Sender: TObject);
begin
  if not (dm.ZConn.Connected) then
    dm.ZConn.Connect;
  entregador  :=  TEntregador.Create();
  agente      :=  TAgente.Create();
  estado      :=  TEstados.Create();
  entrega     :=  TEntrega.Create();
  bancos      :=  TBancos.Create();
  PopulaEstados;
  entregador.Operacao :=  'I';
  Modo;
  cxPageControl1.ActivePageIndex  :=  0;
end;

procedure TfrmEntregadores.cxTipoDocPropertiesChange(Sender: TObject);
begin
  if cxTipoDoc.Text  = 'CPF' then
    cxCPF.Properties.EditMask := '999\.999\.999\-99;1; '
  else
    cxCPF.Properties.EditMask := '99\.999\.999\/9999\-99;1; ';
end;

procedure TfrmEntregadores.cxIESTKeyPress(Sender: TObject; var Key: Char);
begin
  Key :=  TUtil.SoNumero(Key);
end;

procedure TfrmEntregadores.cxCRTKeyPress(Sender: TObject; var Key: Char);
begin
  Key :=  TUtil.SoNumero(Key);
end;

procedure TfrmEntregadores.cxCNAEKeyPress(Sender: TObject; var Key: Char);
begin
  Key :=  TUtil.SoNumero(Key);
end;

procedure TfrmEntregadores.FormActivate(Sender: TObject);
begin
  cxGrid1DBTableView1.OptionsView.NoDataToDisplayInfoText := 'Atualizando o Grid. Aguarde...';
  cxGrid1.Refresh;
  ListaEntregadores;
end;

procedure TfrmEntregadores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  entregador.Free;
  agente.Free;
  estado.Free;
  entrega.Free;
  bancos.Free;
  Action          :=  caFree;
  frmEntregadores :=  Nil;
end;

procedure TfrmEntregadores.SetupForm;
begin
  cxTipoDoc.ItemIndex         :=  0;
  cxTipoEndereco.ItemIndex    :=  0;
  cxStatus.ItemIndex          :=  1;
  tbContatos.Close;
  tbContatos.Open;
  cxCodigo.Text               :=  entregador.Codigo;
  cxTipoDoc.Text              :=  entregador.TipoDoc;
  cxCPF.Text                  :=  entregador.Cnpj;
  cxNome.Text                 :=  entregador.Razao;
  cxAlias.Text                :=  entregador.Fantasia;
  cxRG.Text                   :=  entregador.IE;
  cxCNH.Text                  :=  entregador.Cnh;
  cxCategoria.Text            :=  entregador.CategoriaCnh;
  cxValidade.Date             :=  entregador.ValidadeCnh;
  cxIEST.Text                 :=  entregador.IEST;
  cxIM.Text                   :=  entregador.IM;
  cxCNAE.Text                 :=  entregador.Cnae;
  cxCRT.Text                  :=  IntToStr(entregador.Crt);
  entregador.Endereco.Codigo  :=  StrToInt(entregador.Codigo);
  if entregador.Endereco.getObject(cxTipoEndereco.Text,'TIPO') then begin
    SetupEndereco;
  end;
  agente.Codigo               :=  IntToStr(entregador.Agente);
  cxAgente.Text               :=  IntToStr(entregador.Agente);
  cxNomeAgente.Text           :=  agente.getField('DES_RAZAO_SOCIAL','CODIGO');
  cxStatus.ItemIndex          :=  StrToInt(entregador.Status);
  cxDatCadastro.Date          :=  StrToDate(entregador.DtCadastro);
  cxObs.Text                  :=  entregador.Obs;
  cxVErbaEntrega.Value        :=  entregador.Verba;
  cxVerbaCombustivel.Value    :=  entregador.Combustivel;
  cxTipoConta.Text            :=  entregador.TipoConta;
  cxBanco.Text                :=  entregador.Banco;
  if not (TUtil.Empty(cxBanco.Text)) then begin
    if bancos.getObject(cxBanco.Text,'CODIGO') then begin
      cxNomeBanco.Text  :=  bancos.Nome;
    end
    else begin
      cxNomeBanco.Text  :=  '- - -';
    end;
    cxNomeBanco.Refresh;
  end;
  cxAgencia.Text              :=  entregador.Agencia;
  cxConta.Text                :=  entregador.NumeroConta;
  cxFavorecido.Text           :=  entregador.Favorecido;
  cxCpfCnpjFavorecido.Text    :=  entregador.CpfCnpjFavorecido;
  cxFormaPagamento.Text       :=  entregador.Forma;
  cxFuncionario.Text          :=  entregador.Funcionario;
  if entregador.Funcionario = 'E' then begin
    cxFuncionario.ItemIndex     :=  0;
  end
  else if entregador.Funcionario = 'F'  then begin
    cxFuncionario.ItemIndex     :=  1;
  end
  else begin
    cxFuncionario.ItemIndex     :=  2;
  end;

  if entregador.Contato.getObject(entregador.Codigo,'CODIGO') then begin
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
  if entregador.Funcionario = 'F' then begin
    cxLabel27.Caption :=  'Funcionário: ' + entregador.Codigo + ' - ' + entregador.Fantasia + ' ';
  end
  else if entregador.Funcionario = 'E' then begin
    cxLabel27.Caption :=  'Entregador: ' + entregador.Codigo + ' - ' + entregador.Fantasia + ' ';
  end
  else begin
    cxLabel27.Caption :=  'Agregado: ' + entregador.Codigo + ' - ' + entregador.Fantasia + ' ';
  end;
  entregador.Operacao :=  'U';
  Modo;
end;

procedure TfrmEntregadores.LimpaEndereco;
begin
if agente.Operacao = 'I' then
    cxTipoEndereco.ItemIndex := 0;
  cxCEP.Clear;
  cxEndereco.Clear;
  cxNumero.Clear;
  cxComplemento.Clear;
  cxBairro.Clear;
  cxCidade.Clear;
  cxEstado.Clear;
  cxReferencia.Clear;
end;

procedure TfrmEntregadores.cxTipoEnderecoPropertiesChange(Sender: TObject);
begin
  if entregador.Operacao = 'U' then begin
    LimpaEndereco;
    entregador.Endereco.Codigo := StrToInt(entregador.Codigo);
    if entregador.Endereco.getObject(cxTipoEndereco.Text,'TIPO') then begin
      SetupEndereco;
    end;
  end;

end;

procedure TfrmEntregadores.SetupEndereco;
begin
  LimpaEndereco;
  cxTipoEndereco.Text     :=  entregador.Endereco.Tipo;
  cxCEP.Text              :=  entregador.Endereco.Cep;
  cxEndereco.Text         :=  entregador.Endereco.Logradouro;
  cxNumero.Text           :=  entregador.Endereco.Numero;
  cxComplemento.Text      :=  entregador.Endereco.Complemento;
  cxBairro.Text           :=  entregador.Endereco.Bairro;
  cxCidade.Text           :=  entregador.Endereco.Cidade;
  cxEstado.Text           :=  entregador.Endereco.UF;
  cxReferencia.Text       :=  entregador.Endereco.Referencia;
end;

procedure TfrmEntregadores.actCadastroContatosExecute(Sender: TObject);
begin
  cxPageControl1.Properties.ActivePage  :=  cxTabSheet2;
end;

procedure TfrmEntregadores.actCadastroEditarExecute(Sender: TObject);
var
  sCodigo : String;
begin
  if dm.qryPesquisa.IsEmpty then begin
    Exit;
  end;
  if cxPageControl1.ActivePageIndex <> 0 then begin
    Exit;
  end;
  sCodigo :=  cxGrid1DBTableView1COD_AGENTE.DataBinding.Field.AsString;
  if entregador.getObject(sCodigo,'CODIGO') then begin
    LimparFields;
    cxPageControl1.ActivePageIndex  :=  1;
    SetupForm;
    entregador.Operacao :=  'U';
    Modo;
  end;
end;

procedure TfrmEntregadores.actCadastroExcluirEnderecoExecute(
  Sender: TObject);
begin
  if Application.MessageBox('Confirma Excluir este Endereço?','Excluir Endereço',MB_ICONQUESTION + MB_YESNO) = IDNO then begin
    Exit;
  end;
  if not (entregador.Endereco.Delete('TIPO')) then begin
    MessageDlg('Não foi possível Excluir este endereço!',mtWarning,[mbOK],0);
    Exit;
  end;
  if entregador.Endereco.getObject(cxTipoEndereco.Text,'TIPO') then
    SetupEndereco
  else begin
    LimpaEndereco;
  end;
end;

procedure TfrmEntregadores.actCadastroIncluirExecute(Sender: TObject);
begin
  LimparFields;
  tbContatos.Close;
  tbContatos.Open;
  entregador.Operacao := 'I';
  Modo;
  cxPageControl1.ActivePageIndex  := 1;
  cxCodigo.SetFocus;
end;

procedure TfrmEntregadores.actCadastroExcluirExecute(Sender: TObject);
begin
  if cxContatos.IsFocused then
    Exit;
  if dm.qryPesquisa.IsEmpty then begin
    Exit;
  end;
  cxPageControl1.ActivePageIndex  := 1;
{  if entrega.getObject(entregador.Codigo,'ENTREGADOR') then begin
    MessageDlg('Existem entregas atribuidas a este entregador! Impossível Excluir.',mtWarning,[mbOK],0);
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
    Exit;
  end;}
  if Application.MessageBox('Confirma Excluir este Entregador?','Excluir Entregador', MB_ICONQUESTION + MB_YESNO) = IDNO then
    Exit;
  if not (entregador.Delete('CODIGO')) then begin
    MessageDlg('Não foi possível Excluir este Entregador!',mtWarning,[mbOK],0);
    Exit;
  end;
  LimparFields;
  tbContatos.Close;
  tbcontatos.Open;
  ListaEntregadores;
  entregador.Operacao := 'I';
  Modo;
end;

procedure TfrmEntregadores.actCadastroBancoExecute(Sender: TObject);
begin
  cxPageControl1.Properties.ActivePage  :=  cxTabSheet3;
end;

procedure TfrmEntregadores.actCadastroCancelarExecute(Sender: TObject);
begin
  LimparFields;
  tbContatos.Close;
  tbContatos.Open;
  entregador.Operacao := 'I';
  LimpaEndereco;
  cxPageControl1.ActivePageIndex  :=  0;
  Modo;
end;

procedure TfrmEntregadores.SetupClassEntregador;
begin
  entregador.Codigo       :=  cxCodigo.Text;
  entregador.TipoDoc      :=  cxTipoDoc.Text;
  entregador.Cnpj         :=  cxCPF.Text;
  entregador.Razao        :=  cxNome.Text;
  entregador.Fantasia     :=  cxAlias.Text;
  entregador.IE           :=  cxRG.Text;
  entregador.Cnh          :=  cxCNH.Text;
  entregador.CategoriaCnh :=  cxCategoria.Text;
  if not (TUtil.Empty(cxCNH.Text)) then begin
    entregador.ValidadeCnh  := cxValidade.Date;
  end;
  entregador.IEST         :=  cxIEST.Text;
  entregador.IM           :=  cxIM.Text ;
  entregador.Cnae         :=  cxCNAE.Text;
  if not (TUtil.Empty(cxCRT.Text)) then begin
    agente.Crt              :=  StrToInt(cxCRT.Text);
  end
  else begin
    agente.Crt              :=  0;
  end;
  SetupClassEndereco;
  if TUtil.Empty(cxAgente.Text) then begin
    entregador.Agente             :=  0;
  end
  else begin
    entregador.Agente             :=  StrToInt(cxAgente.Text);
  end;
  entregador.Status             :=  IntToStr(cxStatus.ItemIndex);
  if entregador.Operacao = 'I' then begin
    entregador.DtCadastro         :=  FormatDateTime('dd/mm/yyyy', Now);
  end
  else begin
    entregador.DtCadastro         :=  cxDatCadastro.Text;
  end;
  entregador.DtAlteracaop       :=  Now;
  entregador.Obs                :=  cxObs.Text;
  entregador.Verba              :=  cxVErbaEntrega.Value;
  entregador.Combustivel        :=  cxVerbaCombustivel.Value;
  entregador.TipoConta          :=  cxTipoConta.Text;
  entregador.Banco              :=  cxBanco.Text;
  entregador.Agencia            :=  cxAgencia.Text;
  entregador.NumeroConta        :=  cxConta.Text;
  entregador.Favorecido         :=  cxFavorecido.Text;
  entregador.CpfCnpjFavorecido  :=  cxCpfCnpjFavorecido.Text;
  entregador.Forma              :=  cxFormaPagamento.Text;
  entregador.Funcionario        :=  Copy(cxFuncionario.Text,1,1);
end;

procedure TfrmEntregadores.SetupClassEndereco;
begin
  entregador.Endereco.Codigo      :=  StrToInt(entregador.Codigo);
  entregador.Endereco.Tipo        :=  cxTipoEndereco.Text;
  entregador.Endereco.Cep         :=  cxCEP.Text;
  entregador.Endereco.Correspondencia :=  0;
  entregador.Endereco.Logradouro  :=  cxEndereco.Text;
  entregador.Endereco.Numero      :=  cxNumero.Text;
  entregador.Endereco.Complemento :=  cxComplemento.Text;
  entregador.Endereco.Bairro      :=  cxBairro.Text;
  entregador.Endereco.Cidade      :=  cxCidade.Text;
  entregador.Endereco.UF          :=  cxEstado.Text;
  entregador.Endereco.Referencia  :=  cxReferencia.Text;
end;

procedure TfrmEntregadores.PopulaEstados;
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
  cxEstado.ItemIndex := -1;
end;

procedure TfrmEntregadores.actCadastroSalvarExecute(Sender: TObject);
begin
  if cxPageControl1.ActivePageIndex = 0 then begin
    Exit;
  end;

  SetupClassEntregador;
  if not (entregador.Validar()) then begin
    Exit;
  end;
  if Application.MessageBox('Deseja salvar os dados?','Salvar',MB_ICONQUESTION + MB_YESNO) = IDNO then begin
    Exit;
  end;
  if entregador.Operacao = 'I' then begin
    if TUtil.Empty(entregador.DtCadastro) then begin
      entregador.DtCadastro :=  DateToStr(Now);
    end;
    if not (entregador.Insert) then begin
      MessageDlg('Não foi Possível Incluir os Dados!', mtWarning, [mbOK],0);
      Exit;
    end;
    if not (TUtil.Empty(cxEndereco.Text)) then begin
      if entregador.Endereco.EnderecoJaExiste then begin
        if not (entregador.Endereco.Update) then begin
          MessageDlg('Não foi possível alterar o Endereço!', mtWarning,[mbOK],0);
        end;
      end
      else if not (entregador.Endereco.Insert) then begin
        MessageDlg('Não foi Possível Incluir o Endereço!', mtWarning, [mbOK],0);
      end;
    end;
  end
  else if entregador.Operacao = 'U' then begin
    if not (entregador.Update) then begin
      MessageDlg('Não foi Possível Alterar os Dados!', mtWarning, [mbOK],0);
      Exit;
    end;
    if not (TUtil.Empty(cxEndereco.Text)) then begin
      if entregador.Endereco.EnderecoJaExiste then begin
        if not (entregador.Endereco.Update) then begin
          MessageDlg('Não foi possível alterar o Endereço!', mtWarning,[mbOK],0);
        end;
      end
      else if not (entregador.Endereco.Insert) then begin
        MessageDlg('Não foi Possível Incluir o Endereço!', mtWarning, [mbOK],0);
      end;
    end;
  end;
  entregador.Contato.Codigo :=  StrToInt(entregador.Codigo);
  if not (entregador.Contato.Delete('CODIGO')) then begin
    MessageDlg('Erro ao tentar Preparar a Tabela de Contatos!',mtError,[mbOK],0);
    Exit;
  end;
  if not (tbContatos.IsEmpty) then
    tbContatos.First;
  while not (tbContatos.Eof) do begin
    entregador.Contato.Codigo   :=  StrToInt(entregador.Codigo);
    entregador.Contato.Contato  :=  tbContatosDES_CONTATO.AsString;
    entregador.Contato.Telefone :=  tbContatosNUM_TELEFONE.AsString;
    entregador.Contato.EMail    :=  tbContatosDES_EMAIL.AsString;
    if not (entregador.Contato.Insert) then begin
      MessageDlg('Erro ao tentar Incluir os Contatos!',mtError,[mbOK],0);
      tbContatos.Last;
    end;
    tbContatos.Next;
  end;
  MessageDlg('Dados Salvos com Sucesso!',mtInformation,[mbOK],0);
  LimparFields;
  entregador.Operacao := 'I';
  ListaEntregadores;
  Modo;
end;
procedure TfrmEntregadores.actCadastroSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmEntregadores.actCadastroImprimirExecute(Sender: TObject);
begin
  if Application.MessageBox('Confirma a impressão da tela?', 'Imprimir',MB_YESNO + MB_ICONQUESTION) = IDYES then
    PrintScale := poProportional;
  {OU}
  //PrintScale := poNone;
  {OU}
  //PrintScale := poPrintToFit;
  Print;
end;

procedure TfrmEntregadores.Modo;
begin
  if entregador.Operacao = 'I' then begin
    actCadastroIncluir.Enabled      :=  True;
    actCadastroExcluir.Enabled      :=  False;
    actCadastroCancelar.Enabled     :=  True;
    actCadastroSalvar.Enabled       :=  True;
    actCadastroLocalizar.Enabled    :=  True;
    actCadastroImprimir.Enabled     :=  True;
    actCadastroSair.Enabled         :=  True;
    cxDatCadastro.Properties.ReadOnly  :=  False;
    cxCodigo.Properties.ReadOnly    :=  False;
    cxTipoEndereco.ItemIndex := 0;
    cxStatus.ItemIndex := 1;
  end
  else if entregador.Operacao = 'U' then begin
    actCadastroIncluir.Enabled      :=  True;
    actCadastroExcluir.Enabled      :=  True;
    actCadastroCancelar.Enabled     :=  True;
    actCadastroSalvar.Enabled       :=  True;
    actCadastroLocalizar.Enabled    :=  False;
    actCadastroImprimir.Enabled     :=  True;
    actCadastroSair.Enabled         :=  True;
    cxDatCadastro.Properties.ReadOnly  :=  True;
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
    cxDatCadastro.Properties.ReadOnly  :=  False;
    cxTipoEndereco.ItemIndex        :=  0;
    cxStatus.ItemIndex              :=  1;
    cxCodigo.Properties.ReadOnly    :=  False;
  end;
end;

procedure TfrmEntregadores.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_UP   : ; // Seta para cima
    VK_DOWN : ; // Seta para baixo
    027 : actCadastroCancelarExecute(Sender);// Esc
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

procedure TfrmEntregadores.cxEnderecoPropertiesChange(Sender: TObject);
begin
  if entregador.Operacao = 'U' then
    actCadastroExcluirEndereco.Enabled  :=  not (TUtil.Empty(cxEndereco.Text));
end;

procedure TfrmEntregadores.cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  actCadastroEditarExecute(Sender);
end;

procedure TfrmEntregadores.actCadastroListaApoioExecute(Sender: TObject);
begin
  if cxAgente.IsFocused then begin
    ListaAgentes;
  end;
  if cxBanco.IsFocused then begin
    ListaBancos;
  end;
end;

procedure TfrmEntregadores.actCadastroPesquisaExecute(Sender: TObject);
begin
  LimparFields;
  cxPageControl1.Properties.ActivePage  :=  cxTabSheet4;
end;

procedure TfrmEntregadores.cxAgentePropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if TUtil.Empty(cxAgente.Text) then begin
    Exit;
  end;
  if agente.getObject(Trim(cxAgente.Text),'CODIGO') then begin
    cxNomeAgente.Text :=  agente.Fantasia;
  end;
end;

procedure TfrmEntregadores.actCadastroIdentificacaoExecute(Sender: TObject);
begin
  cxPageControl1.Properties.ActivePage  :=  cxTabSheet1;
end;

procedure TfrmEntregadores.actCadastroImportarExecute(Sender: TObject);
begin
  if not (OpenDialog1.Execute) then begin
    Exit;
  end
  else begin
    sArquivo := OpenDialog1.FileName;
  end;

  if TUtil.Empty(sArquivo) then begin
    MessageDlg('Informe o nome do arquivo.',mtWarning,[mbOK],0);
    Exit;
  end;

  if not FileExists(sArquivo) then begin
    MessageDlg('Arquivo informado não foi encontrado!',mtWarning,[mbOK],0);
    Exit;
  end;

  if Application.MessageBox(pChar('Confirma a importação do arquivo ' + sArquivo + ' ?'),'Importar Entregas',MB_ICONQUESTION + MB_YESNO) = IDNO then begin
    Exit;
  end;

  if Importar() then begin
    MessageDlg('Importação concluída!',mtInformation,[mbOK],0);
  end;
end;

function TfrmEntregadores.TrataComplemento(sLinha: String): String;
var
  iConta: Integer;
  sLin: String;
  bFlag: Boolean;
begin

  if Pos('"',sLinha) = 0 then begin
    Result := sLinha;
    Exit;
  end;

  iConta := 1;
  bFlag := False;
  sLin := '';
  while sLinha[iConta] >= ' ' do begin
    if sLinha[iConta] = '"' then begin
      if bFlag then
        bFlag := False
      else
        bFlag := True;
    end;
    if bFlag then begin
      if sLinha[iConta] = ';' then
        sLin := sLin + ' '
      else
        sLin := sLin + sLinha[iConta];
    end
    else
      sLin := sLin + sLinha[iConta];
    Inc(iConta);
  end;
  Result := sLin;
end;

function TfrmEntregadores.Importar(): Boolean;
var
  ArquivoCSV: TextFile;
  Contador, I, LinhasTotal: Integer;
  Linha,campo,codigo: String;

   // Lê Linha e Monta os valores
  function MontaValor: String;
  var
    ValorMontado: String;
  begin
    ValorMontado := '';
    inc(I);
    While Linha[I] >= ' ' do
    begin
      If Linha[I] = ';' then // vc pode usar qualquer delimitador ... eu
        // estou usando o ";"
        break;
      ValorMontado := ValorMontado + Linha[I];
      inc(I);
    end;
    result := ValorMontado;
  end;

begin

  Result := False;

  LinhasTotal := TUtil.NumeroDeLinhasTXT(sArquivo);

  // Carregando o arquivo ...
  AssignFile(ArquivoCSV, sArquivo);
  try
    Reset(ArquivoCSV);
    Readln(ArquivoCSV, Linha);
    if Copy(Linha,0,12) <> 'ENTREGADORES' then begin
      MessageDlg('Arquivo informado não é de ENTREGADORES.',mtWarning,[mbOK],0);
      Exit;
    end;
    Readln(ArquivoCSV, Linha);
    Linha := TrataComplemento(Linha);
    contador := 2;
    while not Eoln(ArquivoCSV) do
    begin
      entregador.Codigo := MontaValor;
      entregador.Razao := MontaValor;
      entregador.Fantasia := MontaValor;
      entregador.Agente  := StrToInt(MontaValor);
      entregador.Status := '1';
      entregador.DtCadastro := DateToStr(Now);
      entregador.DtAlteracaop := Now;
      if entregador.JaExiste then begin
        if not (entregador.Update) then
          MessageDlg('Erro ao Alterar o entregador ' + entregador.Fantasia + ' !',mtWarning,[mbOK],0);
      end
      else begin
        if not (entregador.Insert) then
          MessageDlg('Erro ao Incluir entregador ' + entregador.Fantasia + ' !',mtWarning,[mbOK],0);
      end;
      I := 0;
      Readln(ArquivoCSV, Linha);
      Linha := TrataComplemento(Linha);
      Contador := Contador + 1;
    end;
    Result := True;
  finally
    CloseFile(ArquivoCSV);
  end;
end;


procedure TfrmEntregadores.cxCodigoPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if TUtil.Empty(cxCodigo.Text) then begin
    cxCodigo.Text :=  '0';
  end;
  if cxCodigo.Text = '0' then begin
    Exit;
  end;
  if entregador.Operacao = 'I' then begin
    if entregador.getObject(Trim(cxCodigo.Text),'CODIGO') then begin
      LimparFields;
      SetupForm;
      entregador.Operacao :=  'U';
      Modo;
      Perform(WM_NEXTDLGCTL, 0, 0);
    end
    else begin
      Perform(WM_NEXTDLGCTL, 0, 0);
    end;
  end;
end;

procedure TfrmEntregadores.LimparFields;
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

{    if Components[i] is TcxCalcEdit  then
      (Components[i] as TcxCalcEdit).Value := 0;}

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
  cxLabel27.Caption := 'Entregadores / Funcionários / Agregados';
  cxPageControl1.ActivePageIndex  :=  0;
end;


procedure TfrmEntregadores.ListaAgentes;
var
  sCampo, sId, sResultado : String;
begin
  if entregador.Operacao = '' then begin
    Exit;
  end;
  sId           :=  '';
  sCampo        :=  '';
  sResultado    :=  '';
  Screen.Cursor :=  crHourGlass;
  sId           :=  Trim(cxAgente.Text);
  if not (agente.getObjects()) then begin
    Exit;
  end;
  if dm.tbApoio.Active then begin
    dm.tbApoio.Close;
  end;
  dm.tbApoio.Open;
  dm.tbApoio.CreateFieldsFromDataSet(dm.qryGetObject);
  dm.tbApoio.LoadFromDataSet(dm.qryGetObject);
  if not (dm.tbApoio.IsEmpty) then begin
    dm.tbApoio.First;
  end;
  dm.qryGetObject.Close;
  dm.qryGetObject.SQL.Clear;
  if not Assigned(frmListaApoio) then begin
    frmListaApoio :=  TfrmListaApoio.Create(Application);
  end;
  frmListaApoio.ds.DataSet.Refresh;
  frmListaApoio.cxGrid1DBTableView1.DataController.CreateAllItems;
  frmListaApoio.cxGrid1DBTableView1.Columns[0].Caption  :=  'Código';
  frmListaApoio.cxGrid1DBTableView1.Columns[1].Caption  :=  'Nome/Razão Social';
  frmListaApoio.cxGrid1DBTableView1.Columns[2].Caption  :=  'Alias/Nome Fantasia';
  frmListaApoio.iColuna                                 :=  3;
  frmListaApoio.Caption                                 :=  'Agentes';
  Screen.Cursor                                         :=  crDefault;
  frmListaApoio.ShowModal;
  if Resultado then begin
    sId           :=  dm.tbApoio.FieldByName('COD_AGENTE').AsString;
    cxAgente.Text :=  sId;
    cxAgente.Refresh;
    sCampo                            :=  'CODIGO';
    cxNomeAgente.Properties.ReadOnly  :=  False;
    if agente.getObject(sId,sCampo) then begin
      cxNomeAgente.Text :=  agente.Fantasia
    end
    else begin
      cxNomeAgente.Text                 :=  '';
      cxNomeAgente.Refresh;
      cxNomeAgente.Properties.ReadOnly  :=  True;
    end;
  end;
  dm.tbApoio.Close;
  frmListaApoio.Free;
end;


procedure TfrmEntregadores.ListaBancos;
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

procedure TfrmEntregadores.cxBancoPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if TUtil.Empty(cxBanco.Text) then begin
    Exit;
  end;
  cxNomeBanco.Properties.ReadOnly :=  False;
  if bancos.getObject(cxBanco.Text,'CODIGO') then begin
    cxNomeBanco.Text  :=  bancos.Nome;
  end
  else begin
    cxNomeBanco.Text  :=  '- - -';
  end;
  cxNomeBanco.Properties.ReadOnly :=  True;
end;

procedure TfrmEntregadores.cxCpfCnpjFavorecidoPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  if Pos('IU',agente.Operacao) = 0 then begin
    Exit;
  end;
end;

procedure TfrmEntregadores.ListaEntregadores;
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
      SQL.Add('SELECT TBENTREGADORES.COD_ENTREGADOR, TBENTREGADORES.NUM_CNPJ, TBENTREGADORES.DES_RAZAO_SOCIAL, ');
      SQL.Add('TBENTREGADORES.NOM_FANTASIA FROM TBENTREGADORES');
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
