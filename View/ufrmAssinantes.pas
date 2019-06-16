unit ufrmAssinantes;

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
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxLabel, clAssinantes, clEnvioEMail,
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxCalendar,
  cxMaskEdit, cxButtonEdit, cxTextEdit, cxDropDownEdit, cxCurrencyEdit, cxMemo,
  System.Actions, Vcl.ActnList, System.StrUtils,
  clAcessos, dxSkinsdxStatusBarPainter, cxProgressBar, dxStatusBar, Vcl.Menus,
  Vcl.StdCtrls, cxButtons, cxBlobEdit,
  clConexao, dxmdaset, cxDBLookupComboBox, cxSpinEdit, clProdutos, clEstados,
  cxImageComboBox, clTipoAssinatura, Vcl.ClipBrd,
  uthrSalvarAssinantes, clAtribuicoesJornal,cxGridExportLink, ShellAPI, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmAssinantes = class(TForm)
    cxLabel27: TcxLabel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    aclAssinatura: TActionList;
    actAssinanteIncluir: TAction;
    actAssinanteEditar: TAction;
    actAssinanteLocalizar: TAction;
    actAssinanteCancelar: TAction;
    actAssinanteGravar: TAction;
    actAssinanteExportar: TAction;
    actAssinanteSair: TAction;
    dxStatusBar1: TdxStatusBar;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxButton5: TcxButton;
    cxButton6: TcxButton;
    cxButton7: TcxButton;
    actAssinanteFiltrar: TAction;
    cxButton8: TcxButton;
    dsTipo: TDataSource;
    dsProdutos: TDataSource;
    dsEstado: TDataSource;
    cxGrid1DBTableView1ID_ASSINANTE: TcxGridDBColumn;
    cxGrid1DBTableView1COD_ASSINANTE: TcxGridDBColumn;
    cxGrid1DBTableView1COD_PRODUTO: TcxGridDBColumn;
    cxGrid1DBTableView1COD_TIPO_ASSINATURA: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_EDICAO: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_EDICAO: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_ASSINANTE: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_CUIDADOS: TcxGridDBColumn;
    cxGrid1DBTableView1DES_ENDERECO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_COMPLEMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_BAIRRO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_REFERENCIA: TcxGridDBColumn;
    cxGrid1DBTableView1DES_CIDADE: TcxGridDBColumn;
    cxGrid1DBTableView1DES_UF: TcxGridDBColumn;
    cxGrid1DBTableView1CEP_ENDERECO: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_ROTEIRO: TcxGridDBColumn;
    cxGrid1DBTableView1QTD_EXEMPLARES: TcxGridDBColumn;
    cxGrid1DBTableView1COD_BARRA: TcxGridDBColumn;
    cxGrid1DBTableView1DOM_PROTOCOLO: TcxGridDBColumn;
    PopupMenu1: TPopupMenu;
    actAssinanteColar: TAction;
    Cancelar1: TMenuItem;
    actAssinantesCopiar: TAction;
    Copiar1: TMenuItem;
    actAssinanteAtribuicoes: TAction;
    cxButton9: TcxButton;
    cxGrid1DBTableView1RecId: TcxGridDBColumn;
    cxGrid1DBTableView1ID_REVISTA: TcxGridDBColumn;
    cxGrid1DBTableView1DOM_BAIXA: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_RECEBEDOR: TcxGridDBColumn;
    cxGrid1DBTableView1DES_GRAU_RELACIONAMENTO: TcxGridDBColumn;
    SaveDialog: TSaveDialog;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actAssinanteIncluirExecute(Sender: TObject);
    procedure actAssinanteEditarExecute(Sender: TObject);
    procedure actAssinanteLocalizarExecute(Sender: TObject);
    procedure actAssinanteCancelarExecute(Sender: TObject);
    procedure actAssinanteSairExecute(Sender: TObject);
    procedure actAssinanteGravarExecute(Sender: TObject);
    procedure actAssinanteFiltrarExecute(Sender: TObject);
    procedure cxGrid1DBTableView1ID_ASSINANTEPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGrid1DBTableView1COD_ASSINANTEPropertiesValidate
      (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cxGrid1DBTableView1COD_PRODUTOPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGrid1DBTableView1NUM_EDICAOPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGrid1DBTableView1DAT_EDICAOPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGrid1DBTableView1NOM_ASSINANTEPropertiesValidate
      (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cxGrid1DBTableView1COD_TIPO_ASSINATURAPropertiesValidate
      (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cxGrid1DBTableView1NUM_ROTEIROPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure actAssinanteColarExecute(Sender: TObject);
    procedure actAssinantesCopiarExecute(Sender: TObject);
    procedure cxGrid1DBTableView1DOM_PROTOCOLOPropertiesValidate
      (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure actAssinanteAtribuicoesExecute(Sender: TObject);
    procedure actAssinanteExportarExecute(Sender: TObject);
  private
    { Private declarations }
    procedure Modo;
    procedure ModoGrid;
    procedure SalvaAssinatura;
    procedure LocalizarAssinatura;
    procedure FiltrarDados;
    procedure PopulaEntregadores;

    procedure PopulaTipos;
    procedure PopulaProdutos;
    procedure PopulaEstados;
    procedure Colar;
    procedure Copiar;
  public
    { Public declarations }

    sId: String;
    sColuna: String;
    sOperacao: String;
  end;

var
  frmAssinantes: TfrmAssinantes;
  assinante: TAssinantes;
  estados: TEStados;
  produtos: TProdutos;
  email: TEnviarEmail;
  acessos: TAcessos;
  tipo: TTipoAssinatura;
  bSalva: Boolean;
  conexao: TConexao;
  thrSalvar: thrSalvarAssinantes;
  atribuicao: TAtribuicoes;

implementation

{$R *.dfm}

uses udm, clUtil, ufrmGravarExtravio, uGlobais, ufrmListaApoio, ufrmFiltro,
  ufrmProcesso, ufrmListaAtribuicoes;

procedure TfrmAssinantes.actAssinanteAtribuicoesExecute(Sender: TObject);
begin
  PopulaEntregadores;
  if (not atribuicao.getObject(dm.tbAssinantesID_ASSINANTE.AsString, 'ID')) then
  begin
    dm.tbCadastro.Close;
    Exit;
  end;
  if not Assigned(frmListaAtribuicoes) then
  begin
    frmListaAtribuicoes := TfrmListaAtribuicoes.Create(Application);
  end;
  frmListaAtribuicoes.ShowModal;
  dm.tbCadastro.Close;
end;

procedure TfrmAssinantes.actAssinanteCancelarExecute(Sender: TObject);
begin
  dm.tbAssinantes.Close;
  dm.tbAssinantes.Open;
  sOperacao := 'X';
  Modo;
  ModoGrid;
end;

procedure TfrmAssinantes.actAssinanteColarExecute(Sender: TObject);
begin
  Colar;
end;

procedure TfrmAssinantes.actAssinanteEditarExecute(Sender: TObject);
begin
  sOperacao := 'U';
  Modo;
  ModoGrid;
  cxGrid1DBTableView1COD_PRODUTO.FocusWithSelection;
  dm.tbAssinantes.Edit;
end;

procedure TfrmAssinantes.actAssinanteExportarExecute(Sender: TObject);
var
  FileExt, sFile: String;
begin
  if not(dm.tbAssinantes.Active) then
  begin
    Exit;
  end;
  if dm.tbAssinantes.IsEmpty then
  begin
    Exit;
  end;
  SaveDialog.Filter := '';
  SaveDialog.Filter := 'Excel (*.xls) |*.xls|XML (*.xml) |*.xml|Arquivo Texto (*.txt) |*.txt|Página Web (*.html)|*.html';
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

procedure TfrmAssinantes.actAssinanteFiltrarExecute(Sender: TObject);
begin
  FiltrarDados;
end;

procedure TfrmAssinantes.actAssinanteGravarExecute(Sender: TObject);
begin
  SalvaAssinatura;
end;

procedure TfrmAssinantes.actAssinanteIncluirExecute(Sender: TObject);
begin
  sOperacao := 'I';
  Modo;
  ModoGrid;
  if (not dm.tbAssinantes.Active) then
  begin
    dm.tbAssinantes.Open;
  end;
  dm.tbAssinantes.Insert;
  bSalva := True;
end;

procedure TfrmAssinantes.actAssinanteLocalizarExecute(Sender: TObject);
begin
  if bSalva then
  begin
    if Application.MessageBox
      ('Existem dados qua ainda não foram salvos. Continuar?', 'Atenção',
      MB_YESNO + MB_ICONQUESTION) = IDNO then
    begin
      Exit;
    end;
  end;
  dm.tbAssinantes.Close;
  dm.tbAssinantes.Open;
  sOperacao := 'S';
  Modo;
  ModoGrid;
  dm.tbAssinantes.Insert;
  cxGrid1DBTableView1ID_ASSINANTE.FocusWithSelection;
end;

procedure TfrmAssinantes.actAssinanteSairExecute(Sender: TObject);
begin
  try
    Perform(WM_CLOSE, 0, 0);
  except
    on E: Exception do
      MessageDlg(E.Message, mtError, mbOKCancel, 0);
  end;
end;

procedure TfrmAssinantes.actAssinantesCopiarExecute(Sender: TObject);
begin
  Copiar;
end;

procedure TfrmAssinantes.cxGrid1DBTableView1COD_ASSINANTEPropertiesValidate
  (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  if sOperacao = 'S' then
  begin
    sId := DisplayValue;
    sColuna := 'CODIGO';
    LocalizarAssinatura;
  end;
end;

procedure TfrmAssinantes.cxGrid1DBTableView1COD_PRODUTOPropertiesValidate
  (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  if sOperacao = 'S' then
  begin
    produtos.Descricao := DisplayValue;
    sId := produtos.getField('COD_PRODUTO', 'DESCRICAO');
    if TUtil.Empty(sId) then
    begin
      Exit;
    end;
    sColuna := 'PRODUTO';
    LocalizarAssinatura;
  end;
end;

procedure TfrmAssinantes.
  cxGrid1DBTableView1COD_TIPO_ASSINATURAPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if sOperacao = 'S' then
  begin
    tipo.Descricao := DisplayValue;
    sId := tipo.getField('COD_TIPO_ASSINATURA', 'DESCRICAO');
    if TUtil.Empty(sId) then
    begin
      Exit;
    end;
    sColuna := 'PRODUTO';
    LocalizarAssinatura;
  end;
end;

procedure TfrmAssinantes.cxGrid1DBTableView1DAT_EDICAOPropertiesValidate
  (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  if sOperacao = 'S' then
  begin
    sId := DisplayValue;
    sColuna := 'DATA';
    LocalizarAssinatura;
  end;
end;

procedure TfrmAssinantes.cxGrid1DBTableView1DOM_PROTOCOLOPropertiesValidate
  (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  if sOperacao = 'S' then
  begin
    if DisplayValue = 'IMPRIMIR' then
    begin
      sId := 'S';
    end
    else
    begin
      sId := 'N';
    end;
    if TUtil.Empty(sId) then
    begin
      Exit;
    end;
    sColuna := 'PROTOCOLO';
    LocalizarAssinatura;
  end;
end;

procedure TfrmAssinantes.cxGrid1DBTableView1ID_ASSINANTEPropertiesValidate
  (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  if sOperacao = 'S' then
  begin
    sId := DisplayValue;
    sColuna := 'ID';
    LocalizarAssinatura;
  end;
end;

procedure TfrmAssinantes.cxGrid1DBTableView1NOM_ASSINANTEPropertiesValidate
  (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  if sOperacao = 'S' then
  begin
    sId := DisplayValue;
    sColuna := 'NOME';
    LocalizarAssinatura;
  end;
end;

procedure TfrmAssinantes.cxGrid1DBTableView1NUM_EDICAOPropertiesValidate
  (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  if sOperacao = 'S' then
  begin
    sId := DisplayValue;
    sColuna := 'EDICAO';
    LocalizarAssinatura;
  end;
end;

procedure TfrmAssinantes.cxGrid1DBTableView1NUM_ROTEIROPropertiesValidate
  (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  if sOperacao = 'S' then
  begin
    sId := DisplayValue;
    sColuna := 'ROTEIRO';
    LocalizarAssinatura;
  end;
end;

procedure TfrmAssinantes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm.tbAssinantes.Close;
  produtos.Free;
  estados.Free;
  acessos.Free;
  tipo.Free;
  assinante.Free;
  atribuicao.Free;
  conexao.Free;
  Action := caFree;
  frmAssinantes := Nil;
end;

procedure TfrmAssinantes.FormShow(Sender: TObject);
begin
  produtos := TProdutos.Create;
  estados := TEStados.Create;
  tipo := TTipoAssinatura.Create;
  acessos := TAcessos.Create;
  assinante := TAssinantes.Create;
  atribuicao := TAtribuicoes.Create;
  conexao := TConexao.Create;
  PopulaProdutos;
  PopulaTipos;
  PopulaEstados;
  if (not conexao.VerifyConnZEOS(1)) then
  begin
    actAssinanteSairExecute(Sender);
    Exit;
  end;
  sOperacao := 'X';
  Modo;
  ModoGrid;
end;

procedure TfrmAssinantes.Modo;
begin
  if sOperacao = 'I' then
  begin
    actAssinanteIncluir.Enabled := False;
    actAssinanteGravar.Enabled := True;
    actAssinanteLocalizar.Enabled := False;
    actAssinanteCancelar.Enabled := True;
    actAssinanteEditar.Enabled := False;
    actAssinanteFiltrar.Enabled := False;
    actAssinanteAtribuicoes.Enabled := False;
    cxGrid1DBTableView1.NewItemRow.InfoText := 'Clique aqui para Incluir';
    cxGrid1DBTableView1.NewItemRow.Visible := True;
  end
  else if sOperacao = 'U' then
  begin
    actAssinanteIncluir.Enabled := False;
    actAssinanteGravar.Enabled := True;
    actAssinanteLocalizar.Enabled := False;
    actAssinanteCancelar.Enabled := True;
    actAssinanteEditar.Enabled := False;
    actAssinanteFiltrar.Enabled := False;
    actAssinanteAtribuicoes.Enabled := True;
    cxGrid1DBTableView1.NewItemRow.Visible := False;
  end
  else if sOperacao = 'S' then
  begin
    actAssinanteIncluir.Enabled := True;
    actAssinanteGravar.Enabled := False;
    actAssinanteLocalizar.Enabled := False;
    actAssinanteCancelar.Enabled := True;
    actAssinanteEditar.Enabled := True;
    actAssinanteFiltrar.Enabled := False;
    actAssinanteAtribuicoes.Enabled := False;
    cxGrid1DBTableView1.NewItemRow.InfoText := 'Clique aqui para Localizar';
    cxGrid1DBTableView1.NewItemRow.Visible := True;
  end
  else
  begin
    actAssinanteIncluir.Enabled := True;
    actAssinanteGravar.Enabled := False;
    actAssinanteLocalizar.Enabled := True;
    actAssinanteCancelar.Enabled := False;
    actAssinanteEditar.Enabled := False;
    actAssinanteFiltrar.Enabled := True;
    actAssinanteAtribuicoes.Enabled := False;
    cxGrid1DBTableView1.NewItemRow.Visible := False;
  end;
  bSalva := False;
  acessos.SetNivel(aclAssinatura);

end;

procedure TfrmAssinantes.ModoGrid;
var
  iResultado: Integer;
begin
  iResultado := 0;
  if sOperacao = 'I' then
  begin
    cxGrid1DBTableView1ID_ASSINANTE.Properties.ReadOnly := True;
    cxGrid1DBTableView1COD_ASSINANTE.Properties.ReadOnly := False;
    cxGrid1DBTableView1NUM_ROTEIRO.Properties.ReadOnly := False;
    cxGrid1DBTableView1COD_PRODUTO.Properties.ReadOnly := False;
    cxGrid1DBTableView1COD_TIPO_ASSINATURA.Properties.ReadOnly := False;
    cxGrid1DBTableView1NUM_EDICAO.Properties.ReadOnly := False;
    cxGrid1DBTableView1DAT_EDICAO.Properties.ReadOnly := False;
    cxGrid1DBTableView1NOM_ASSINANTE.Properties.ReadOnly := False;
    cxGrid1DBTableView1NOM_CUIDADOS.Properties.ReadOnly := False;
    cxGrid1DBTableView1DES_ENDERECO.Properties.ReadOnly := False;
    cxGrid1DBTableView1DES_COMPLEMENTO.Properties.ReadOnly := False;
    cxGrid1DBTableView1DES_BAIRRO.Properties.ReadOnly := False;
    cxGrid1DBTableView1DES_REFERENCIA.Properties.ReadOnly := False;
    cxGrid1DBTableView1DES_CIDADE.Properties.ReadOnly := False;
    cxGrid1DBTableView1DES_UF.Properties.ReadOnly := False;
    cxGrid1DBTableView1CEP_ENDERECO.Properties.ReadOnly := False;
    cxGrid1DBTableView1QTD_EXEMPLARES.Properties.ReadOnly := False;
    cxGrid1DBTableView1DOM_PROTOCOLO.Properties.ReadOnly := False;
  end
  else if sOperacao = 'U' then
  begin
    cxGrid1DBTableView1ID_ASSINANTE.Properties.ReadOnly := True;
    cxGrid1DBTableView1COD_ASSINANTE.Properties.ReadOnly := True;
    cxGrid1DBTableView1NUM_ROTEIRO.Properties.ReadOnly := False;
    cxGrid1DBTableView1COD_PRODUTO.Properties.ReadOnly := True;
    cxGrid1DBTableView1COD_TIPO_ASSINATURA.Properties.ReadOnly := True;
    cxGrid1DBTableView1NUM_EDICAO.Properties.ReadOnly := True;
    cxGrid1DBTableView1DAT_EDICAO.Properties.ReadOnly := True;
    cxGrid1DBTableView1NOM_ASSINANTE.Properties.ReadOnly := True;
    cxGrid1DBTableView1NOM_CUIDADOS.Properties.ReadOnly := True;
    cxGrid1DBTableView1DES_ENDERECO.Properties.ReadOnly := True;
    cxGrid1DBTableView1DES_COMPLEMENTO.Properties.ReadOnly := True;
    cxGrid1DBTableView1DES_BAIRRO.Properties.ReadOnly := True;
    cxGrid1DBTableView1DES_REFERENCIA.Properties.ReadOnly := False;
    cxGrid1DBTableView1DES_CIDADE.Properties.ReadOnly := True;
    cxGrid1DBTableView1DES_UF.Properties.ReadOnly := True;
    cxGrid1DBTableView1CEP_ENDERECO.Properties.ReadOnly := True;
    cxGrid1DBTableView1QTD_EXEMPLARES.Properties.ReadOnly := True;
    cxGrid1DBTableView1DOM_PROTOCOLO.Properties.ReadOnly := False;
  end
  else if sOperacao = 'S' then
  begin
    cxGrid1DBTableView1ID_ASSINANTE.Properties.ReadOnly := False;
    cxGrid1DBTableView1COD_ASSINANTE.Properties.ReadOnly := False;
    cxGrid1DBTableView1NUM_ROTEIRO.Properties.ReadOnly := False;
    cxGrid1DBTableView1COD_PRODUTO.Properties.ReadOnly := False;
    cxGrid1DBTableView1COD_TIPO_ASSINATURA.Properties.ReadOnly := False;
    cxGrid1DBTableView1NUM_EDICAO.Properties.ReadOnly := False;
    cxGrid1DBTableView1DAT_EDICAO.Properties.ReadOnly := False;
    cxGrid1DBTableView1NOM_ASSINANTE.Properties.ReadOnly := False;
    cxGrid1DBTableView1NOM_CUIDADOS.Properties.ReadOnly := True;
    cxGrid1DBTableView1DES_ENDERECO.Properties.ReadOnly := True;
    cxGrid1DBTableView1DES_COMPLEMENTO.Properties.ReadOnly := True;
    cxGrid1DBTableView1DES_BAIRRO.Properties.ReadOnly := True;
    cxGrid1DBTableView1DES_REFERENCIA.Properties.ReadOnly := True;
    cxGrid1DBTableView1DES_CIDADE.Properties.ReadOnly := True;
    cxGrid1DBTableView1DES_UF.Properties.ReadOnly := True;
    cxGrid1DBTableView1CEP_ENDERECO.Properties.ReadOnly := True;
    cxGrid1DBTableView1QTD_EXEMPLARES.Properties.ReadOnly := True;
    cxGrid1DBTableView1DOM_PROTOCOLO.Properties.ReadOnly := False;
  end
  else
  begin
    cxGrid1DBTableView1ID_ASSINANTE.Properties.ReadOnly := True;
    cxGrid1DBTableView1COD_ASSINANTE.Properties.ReadOnly := True;
    cxGrid1DBTableView1NUM_ROTEIRO.Properties.ReadOnly := True;
    cxGrid1DBTableView1COD_PRODUTO.Properties.ReadOnly := True;
    cxGrid1DBTableView1COD_TIPO_ASSINATURA.Properties.ReadOnly := True;
    cxGrid1DBTableView1NUM_EDICAO.Properties.ReadOnly := True;
    cxGrid1DBTableView1DAT_EDICAO.Properties.ReadOnly := True;
    cxGrid1DBTableView1NOM_ASSINANTE.Properties.ReadOnly := True;
    cxGrid1DBTableView1NOM_CUIDADOS.Properties.ReadOnly := True;
    cxGrid1DBTableView1DES_ENDERECO.Properties.ReadOnly := True;
    cxGrid1DBTableView1DES_COMPLEMENTO.Properties.ReadOnly := True;
    cxGrid1DBTableView1DES_BAIRRO.Properties.ReadOnly := True;
    cxGrid1DBTableView1DES_REFERENCIA.Properties.ReadOnly := True;
    cxGrid1DBTableView1DES_CIDADE.Properties.ReadOnly := True;
    cxGrid1DBTableView1DES_UF.Properties.ReadOnly := True;
    cxGrid1DBTableView1CEP_ENDERECO.Properties.ReadOnly := True;
    cxGrid1DBTableView1QTD_EXEMPLARES.Properties.ReadOnly := True;
    cxGrid1DBTableView1DOM_PROTOCOLO.Properties.ReadOnly := True;
  end;
end;

procedure TfrmAssinantes.SalvaAssinatura;
begin
  if dm.tbAssinantes.IsEmpty then
  begin
    Exit;
  end;
  if Application.MessageBox('Confirma gravar as Assinaturas?',
    'Gravar Assinaturas', MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  sOperacao := 'X';
  Modo;
  ModoGrid;
  if not Assigned(frmProcesso) then
  begin
    frmProcesso := TfrmProcesso.Create(Application);
  end;
  frmProcesso.Show;
  dm.dsAssinantes.Enabled := False;
  thrSalvar := thrSalvarAssinantes.Create(True);
  thrSalvar.FreeOnTerminate := True;
  thrSalvar.Priority := tpNormal;
  thrSalvar.Start;
end;

procedure TfrmAssinantes.LocalizarAssinatura;
begin
  dm.tbAssinantes.Close;
  dm.tbAssinantes.Open;
  dm.tbAssinantes.IsLoading := True;
  if assinante.getObject(sId, sColuna) then
  begin
    dm.tbAssinantes.LoadFromDataSet(dm.qryGetObject1);
    dm.tbAssinantes.First;
    sOperacao := 'U';
    Modo;
    ModoGrid;
  end
  else
  begin
    sOperacao := 'X';
    Modo;
    ModoGrid;
  end;
  dm.tbAssinantes.IsLoading := False;
  dm.qryGetObject1.Close;
  dm.qryGetObject1.SQL.Clear;
end;

procedure TfrmAssinantes.FiltrarDados;
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
  sOperacao := 'S';
  Modo;
  ModoGrid;
  LocalizarAssinatura;
end;

procedure TfrmAssinantes.PopulaProdutos;
begin
  dm.tbProdutos.Close;
  dm.tbProdutos.Open;
  dm.tbProdutos.IsLoading := True;
  if produtos.getObjects() then
  begin
    dm.tbProdutos.LoadFromDataSet(dm.qryGetObject1);
  end;
  dm.tbProdutos.IsLoading := False;
  dm.qryGetObject1.Close;
  dm.qryGetObject1.SQL.Clear;
end;

procedure TfrmAssinantes.PopulaEstados;
begin
  dm.tbEstados.Close;
  dm.tbEstados.Open;
  dm.tbEstados.IsLoading := True;
  if estados.getObjects() then
  begin
    dm.tbEstados.LoadFromDataSet(dm.qryGetObject);
  end;
  dm.tbEstados.IsLoading := False;
  dm.qryGetObject.Close;
  dm.qryGetObject.SQL.Clear;
end;

procedure TfrmAssinantes.PopulaTipos;
begin
  dm.tbTipoAssinatura.Close;
  dm.tbTipoAssinatura.Open;
  dm.tbTipoAssinatura.IsLoading := True;
  if tipo.getObjects() then
  begin
    dm.tbTipoAssinatura.LoadFromDataSet(dm.qryGetObject1);
  end;
  dm.tbTipoAssinatura.IsLoading := False;
  dm.qryGetObject1.Close;
  dm.qryGetObject1.SQL.Clear;
end;

procedure TfrmAssinantes.Colar;
var
  i, J, iValor: Integer;
  sChave: String;
begin
  sChave := '';
  iValor := 0;
  if cxGrid1DBTableView1NUM_ROTEIRO.Focused then
  begin
    if TryStrToInt(Clipboard.AsText, iValor) then
    begin
      with cxGrid1DBTableView1.Controller do
      begin
        for i := 0 to SelectedRowCount - 1 do
        begin
          for J := 0 to SelectedColumnCount - 1 do
          begin
            sChave := cxGrid1DBTableView1.ViewData.datacontroller.DisplayTexts
              [SelectedRecords[i].RecordIndex, 0];
            if dm.tbAssinantes.Locate('ID_ASSINANTE', sChave, []) then
            begin
              dm.tbAssinantes.Edit;
              dm.tbAssinantesNUM_ROTEIRO.Value := iValor;
              dm.tbAssinantes.Post;
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure TfrmAssinantes.Copiar;
var
  i, J: Integer;
  s: string;
begin
  with cxGrid1DBTableView1.Controller do
  begin
    for i := 0 to SelectedRowCount - 1 do
    begin
      for J := 0 to SelectedColumnCount - 1 do
      begin
        s := cxGrid1DBTableView1.ViewData.datacontroller.DisplayTexts
          [SelectedRecords[i].RecordIndex, SelectedColumns[J].Index];
      end;
    end;
    Clipboard.AsText := s;
  end;
end;

procedure TfrmAssinantes.PopulaEntregadores;
begin
  with dm.qryPesquisa do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT * FROM tbentregadores WHERE DOM_FUNCIONARIO IN (' + QuotedStr('1') + ',' +
      QuotedStr('2') + ',' + QuotedStr('T') + ',' + QuotedStr('P') + ')';
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
    if dm.tbCadastro.Active then
    begin
      dm.tbCadastro.Close;
    end;
    dm.tbCadastro.Open;
    dm.tbCadastro.LoadFromDataSet(dm.qryPesquisa);
  end;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  FreeAndNil(frmListaApoio);
end;

end.
