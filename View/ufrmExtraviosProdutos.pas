unit ufrmExtraviosProdutos;

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
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxLabel, clCodigosEntregadores,
  clAgentes, clEntrega, clEnvioEMail, clRestricoes,
  clExtravios, Data.DB, dxmdaset, cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxMaskEdit,
  cxTextEdit, cxButtonEdit, cxDropDownEdit, cxCurrencyEdit, cxMemo, cxBlobEdit,
  clBarrTFO, StrUtils, System.Actions, Vcl.ActnList,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxCalendar, dxSkinsdxStatusBarPainter,
  cxProgressBar, dxStatusBar, clLancamentos, clAcessos,
  uthrPopularExtravios, cxGridExportLink, ShellAPI, clConexao,
  cxDBLookupComboBox, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light;

type
  TfrmExtraviosProdutos = class(TForm)
    cxLabel27: TcxLabel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dsExtravios: TDataSource;
    aclExtraviosProdutos: TActionList;
    actExtravioProdutosListaEntregadores: TAction;
    actExtraviosProdutosIncluir: TAction;
    actExtraviosProdutosEstornar: TAction;
    actExtraviosProdutosGravar: TAction;
    actExtraviosProdutosSair: TAction;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    actExtraviosProdutosLocalizar: TAction;
    cxButton5: TcxButton;
    dxStatusBar1: TdxStatusBar;
    dxStatusBar1Container0: TdxStatusBarContainerControl;
    cxProgressBar: TcxProgressBar;
    actExtraviosProdutosCancelar: TAction;
    actExtraviosProdutosExportar: TAction;
    SaveDialog: TSaveDialog;
    cxButton6: TcxButton;
    cxButton7: TcxButton;
    cxButton8: TcxButton;
    actExtraviosProdutosEditar: TAction;
    actExtraviosProdutosAgentes: TAction;
    actExtraviosProdutosImportar: TAction;
    cxButton9: TcxButton;
    actExtraviosProdutosFiltrar: TAction;
    cxButton10: TcxButton;
    cxGrid1DBTableView1RecId: TcxGridDBColumn;
    cxGrid1DBTableView1COD_EXTRAVIO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_EXTRAVIO: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_NOSSONUMERO: TcxGridDBColumn;
    cxGrid1DBTableView1COD_AGENTE: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_PRODUTO: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_EXTRAVIO: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_MULTA: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_VERBA: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_TOTAL: TcxGridDBColumn;
    cxGrid1DBTableView1DOM_RESTRICAO: TcxGridDBColumn;
    cxGrid1DBTableView1COD_ENTREGADOR: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_EXECUTOR: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_MANUTENCAO: TcxGridDBColumn;
    cxGrid1DBTableView1COD_TIPO: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_EXTRATO_FRANQUIA: TcxGridDBColumn;
    cxGrid1DBTableView1DES_ENVIO_CORRESPONDENCIA: TcxGridDBColumn;
    cxGrid1DBTableView1DES_RETORNO_CORRESPONDENCIA: TcxGridDBColumn;
    cxGrid1DBTableView1DES_OBSERVACOES: TcxGridDBColumn;
    tbEntregadores: TdxMemData;
    tbEntregadoresCOD_CADASTRO: TIntegerField;
    tbEntregadoresCOD_ENTREGADOR: TIntegerField;
    tbEntregadoresNOM_FANTASIA: TWideStringField;
    tbEntregadoresCOD_AGENTE: TIntegerField;
    tbEntregadoresDAT_CODIGO: TDateField;
    tbEntregadoresDES_CHAVE: TWideStringField;
    tbEntregadoresCOD_GRUPO: TIntegerField;
    tbEntregadoresVAL_VERBA: TFloatField;
    tbEntregadoresNOM_EXECUTANTE: TWideStringField;
    tbEntregadoresDAT_MANUTENCAO: TDateTimeField;
    tbExtravios: TdxMemData;
    tbExtraviosCOD_EXTRAVIO: TIntegerField;
    tbExtraviosDES_EXTRAVIO: TWideStringField;
    tbExtraviosNUM_NOSSONUMERO: TWideStringField;
    tbExtraviosCOD_AGENTE: TIntegerField;
    tbExtraviosVAL_PRODUTO: TFloatField;
    tbExtraviosDAT_EXTRAVIO: TDateField;
    tbExtraviosVAL_MULTA: TFloatField;
    tbExtraviosVAL_VERBA: TFloatField;
    tbExtraviosVAL_TOTAL: TFloatField;
    tbExtraviosDOM_RESTRICAO: TWideStringField;
    tbExtraviosCOD_ENTREGADOR: TIntegerField;
    tbExtraviosNOM_EXECUTOR: TWideStringField;
    tbExtraviosDAT_MANUTENCAO: TDateTimeField;
    tbExtraviosCOD_TIPO: TIntegerField;
    tbExtraviosVAL_EXTRATO_FRANQUIA: TFloatField;
    tbExtraviosDOM_EXTRATO_FRANQUIA: TWideStringField;
    tbExtraviosDES_ENVIO_CORRESPONDENCIA: TWideStringField;
    tbExtraviosDES_RETORNO_CORRESPONDENCIA: TWideStringField;
    tbExtraviosDES_OBSERVACOES: TWideMemoField;
    dsEntregadores: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxGrid1DBTableView1NUM_NOSSONUMEROPropertiesValidate
      (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cxGrid1DBTableView1COD_ENTREGADORPropertiesValidate
      (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure actExtraviosProdutosSairExecute(Sender: TObject);
    procedure actExtraviosProdutosGravarExecute(Sender: TObject);
    procedure actExtraviosProdutosIncluirExecute(Sender: TObject);
    procedure actExtraviosProdutosEstornarExecute(Sender: TObject);
    procedure actExtraviosProdutosCancelarExecute(Sender: TObject);
    procedure actExtraviosProdutosExportarExecute(Sender: TObject);
    procedure actExtraviosProdutosLocalizarExecute(Sender: TObject);
    procedure cxGrid1DBTableView1DAT_EXTRAVIOPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGrid1DBTableView1COD_ADMPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGrid1DBTableView1DES_MOTIVOPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGrid1DBTableView1DES_ENVIO_CORRESPONDENCIAPropertiesValidate
      (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cxGrid1DBTableView1DES_RETORNO_CORRESPONDENCIAPropertiesValidate
      (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure actExtraviosProdutosEditarExecute(Sender: TObject);
    procedure cxGrid1DBTableView1CanFocusRecord(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; var AAllow: Boolean);
    procedure actExtraviosProdutosAgentesExecute(Sender: TObject);
    procedure actExtraviosProdutosImportarExecute(Sender: TObject);
    procedure actExtraviosProdutosFiltrarExecute(Sender: TObject);
  private
    { Private declarations }
    procedure SalvaExtravio;
    procedure GeraRestricao(bAVista: Boolean);
    procedure Estorno;
    procedure Modo;
    procedure LocalizarExtravios;
    procedure GeraCredito(dValor: Double);
    procedure ExportarGrade;
    procedure ListaAgente;
    procedure FiltrarDados;
    procedure PopulaEntregadores;
    function ValidaNN(sNN: String; var sMensagem: TCaption): Boolean;
    function ValidaEntregador(sCodigo: String; var sMensagem: TCaption)
      : Boolean;

  public
    { Public declarations }
    sId: String;
    sColuna: String;
    sOperacao: String;
  end;

var
  frmExtraviosProdutos: TfrmExtraviosProdutos;
  barra: TBarrTFO;
  extravio: TExtravios;
  entregador: TCodigosEntregadores;
  agente: TAgente;
  restricao: TRestricoes;
  lancamento: TLancamentos;
  acessos: TAcessos;
  entrega: TEntrega;
  thrextravios: thrPopularExtravios;
  bSalva: Boolean;
  conexao: TConexao;

implementation

{$R *.dfm}

uses udm, clUtil, uGlobais, ufrmListaApoio, ufrmGravarExtravio, ufrmAutorizacao,
  ufrmImportarExtravios, ufrmFiltro;

procedure TfrmExtraviosProdutos.actExtraviosProdutosAgentesExecute
  (Sender: TObject);
begin
  ListaAgente;
end;

procedure TfrmExtraviosProdutos.actExtraviosProdutosCancelarExecute
  (Sender: TObject);
begin
  tbExtravios.Close;
  tbExtravios.Open;
  sOperacao := 'X';
  Modo;
end;

procedure TfrmExtraviosProdutos.actExtraviosProdutosEditarExecute
  (Sender: TObject);
begin
  cxGrid1DBTableView1NUM_NOSSONUMERO.Properties.ReadOnly := True;
  cxGrid1DBTableView1COD_ENTREGADOR.Properties.ReadOnly := True;
  cxGrid1DBTableView1VAL_PRODUTO.Properties.ReadOnly := True;
  cxGrid1DBTableView1VAL_MULTA.Properties.ReadOnly := True;
  tbExtravios.Edit;
  sOperacao := 'U';
  Modo;
  cxGrid1DBTableView1DES_ENVIO_CORRESPONDENCIA.FocusWithSelection;
end;

procedure TfrmExtraviosProdutos.actExtraviosProdutosEstornarExecute
  (Sender: TObject);
begin
  Estorno;
end;

procedure TfrmExtraviosProdutos.actExtraviosProdutosExportarExecute
  (Sender: TObject);
begin
  ExportarGrade;
end;

procedure TfrmExtraviosProdutos.actExtraviosProdutosFiltrarExecute
  (Sender: TObject);
begin
  FiltrarDados;
end;

procedure TfrmExtraviosProdutos.actExtraviosProdutosGravarExecute
  (Sender: TObject);
begin
  SalvaExtravio;
end;

procedure TfrmExtraviosProdutos.actExtraviosProdutosImportarExecute
  (Sender: TObject);
begin
  if not Assigned(frmImportarExtravios) then
  begin
    frmImportarExtravios := TfrmImportarExtravios.Create(Application);
  end;
  frmImportarExtravios.ShowModal;
end;

procedure TfrmExtraviosProdutos.actExtraviosProdutosIncluirExecute
  (Sender: TObject);
begin
  cxGrid1DBTableView1NUM_NOSSONUMERO.Properties.ReadOnly := False;
  cxGrid1DBTableView1COD_ENTREGADOR.Properties.ReadOnly := False;
  cxGrid1DBTableView1VAL_PRODUTO.Properties.ReadOnly := False;
  cxGrid1DBTableView1VAL_MULTA.Properties.ReadOnly := False;
  sOperacao := 'I';
  Modo;
  tbExtravios.Insert;
  bSalva := True;
end;

procedure TfrmExtraviosProdutos.actExtraviosProdutosLocalizarExecute
  (Sender: TObject);
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
  tbExtravios.Close;
  tbExtravios.Open;
  sOperacao := 'S';
  Modo;
  tbExtravios.Insert;
  cxGrid1DBTableView1COD_AGENTE.Properties.ReadOnly := False;
  cxGrid1DBTableView1NUM_NOSSONUMERO.FocusWithSelection;
end;

procedure TfrmExtraviosProdutos.actExtraviosProdutosSairExecute
  (Sender: TObject);
begin
  try
    Perform(WM_CLOSE, 0, 0);
  except
    on E: Exception do
      MessageDlg(E.Message, mtError, mbOKCancel, 0);
  end;
end;

procedure TfrmExtraviosProdutos.cxGrid1DBTableView1CanFocusRecord
  (Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  var AAllow: Boolean);
var
  sTipo: String;
  iRet: Integer;
begin
  if tbExtravios.Active then
  begin
    sTipo := ARecord.DisplayTexts[11];
    if (not TryStrToInt(sTipo, iRet)) then
    begin
      iRet := 3;
    end;
    if sOperacao = 'S' then
    begin
      actExtraviosProdutosEditar.Enabled := (iRet <> 3);
    end;
  end;
end;

procedure TfrmExtraviosProdutos.cxGrid1DBTableView1COD_ADMPropertiesValidate
  (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  if sOperacao = 'S' then
  begin
    sId := DisplayValue;
    sColuna := 'AGENTE';
    LocalizarExtravios;
  end;
end;

procedure TfrmExtraviosProdutos.
  cxGrid1DBTableView1COD_ENTREGADORPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  entregador.Nome := DisplayValue;
  sId := entregador.getField('COD_ENTREGADOR', 'NOME');
  if sOperacao = 'I' then
  begin
    Error := (not ValidaEntregador(sId, ErrorText));
  end
  else if sOperacao = 'S' then
  begin
    //sId := DisplayValue;
    sColuna := 'ENTREGADOR';
    LocalizarExtravios;
  end;
end;

procedure TfrmExtraviosProdutos.
  cxGrid1DBTableView1DAT_EXTRAVIOPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if sOperacao = 'S' then
  begin
    sId := DisplayValue;
    sColuna := 'DATA';
    LocalizarExtravios;
  end;
end;

procedure TfrmExtraviosProdutos.
  cxGrid1DBTableView1DES_ENVIO_CORRESPONDENCIAPropertiesValidate
  (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  if sOperacao = 'S' then
  begin
    sId := DisplayValue;
    sColuna := 'ENVIO';
    LocalizarExtravios;
  end;
end;

procedure TfrmExtraviosProdutos.cxGrid1DBTableView1DES_MOTIVOPropertiesValidate
  (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  if sOperacao = 'S' then
  begin
    sId := DisplayValue;
    sColuna := 'MOTIVO';
    LocalizarExtravios;
  end;
end;

procedure TfrmExtraviosProdutos.
  cxGrid1DBTableView1DES_RETORNO_CORRESPONDENCIAPropertiesValidate
  (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  if sOperacao = 'S' then
  begin
    sId := DisplayValue;
    sColuna := 'RETORNO';
    LocalizarExtravios;
  end;
end;

procedure TfrmExtraviosProdutos.
  cxGrid1DBTableView1NUM_NOSSONUMEROPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if TUtil.Empty(DisplayValue) then
  begin
    Exit;
  end;
  if sOperacao = 'I' then
  begin
    Error := (not ValidaNN(DisplayValue, ErrorText));
  end
  else if sOperacao = 'S' then
  begin
    sId := DisplayValue;
    sColuna := 'NOSSONUMERO';
    LocalizarExtravios;
  end;
end;

procedure TfrmExtraviosProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tbExtravios.Close;
  barra.Free;
  extravio.Free;
  entregador.Free;
  agente.Free;
  restricao.Free;
  lancamento.Free;
  acessos.Free;
  entrega.Free;
  conexao.Free;
  Action := caFree;
  frmExtraviosProdutos := Nil;
end;

procedure TfrmExtraviosProdutos.FormShow(Sender: TObject);
begin
  barra := TBarrTFO.Create;
  extravio := TExtravios.Create;
  entregador := TCodigosEntregadores.Create;
  agente := TAgente.Create;
  restricao := TRestricoes.Create;
  lancamento := TLancamentos.Create;
  acessos := TAcessos.Create;
  entrega := TEntrega.Create;
  conexao := TConexao.Create;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    actExtraviosProdutosSairExecute(Sender);
    Exit;
  end;
  PopulaEntregadores;
  sOperacao := 'X';
  Modo;
  tbExtravios.Open;
end;

function TfrmExtraviosProdutos.ValidaNN(sNN: String;
  var sMensagem: TCaption): Boolean;
var
  sNumero: String;
begin
  Result := False;
  if sOperacao = 'I' then
  begin
    sNumero := FormatFloat('00000000000', StrToInt(sNN));
    If StrToInt(RightStr(sNumero, 1)) <>
      StrToInt(barra.RetDV(LeftStr(sNumero, 10))) then
    begin
      sMensagem := 'Nosso Número informado é inválido!';
      Exit;
    end;
    if entrega.getObject(sNN, 'NOSSONUMERO') then
    begin
      tbExtraviosNUM_NOSSONUMERO.Value := sNN;
      tbExtraviosCOD_ENTREGADOR.Value := entrega.entregador;
      tbExtraviosVAL_PRODUTO.Value := entrega.ValorProduto;
      entregador.Codigo := entrega.entregador;
      tbExtraviosCOD_AGENTE.Value := entrega.agente;
      dm.qryGetObject.Close;
      dm.qryGetObject.SQL.Clear;
    end;
  end;
  Result := True;
end;

function TfrmExtraviosProdutos.ValidaEntregador(sCodigo: String;
  var sMensagem: TCaption): Boolean;
var
  sCodADm: String;
begin
  Result := False;
  if sOperacao = 'I' then
  begin
    if (not entregador.getObject(sCodigo, 'CODIGO')) then
    begin
      sMensagem := 'Código de Entregador não cadastrado!';
      Exit;
    end;
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
    sCodADm := IntToStr(entregador.agente);
    tbExtraviosCOD_ENTREGADOR.Value := StrToInt(sCodigo);
    tbExtraviosCOD_AGENTE.Value := StrToInt(sCodADm);
  end;
  Result := True;
end;

procedure TfrmExtraviosProdutos.SalvaExtravio;
var
  iTipo: Integer;
  sItens: TStringList;
  bAVista: Boolean;
  dVerba: Double;
  sRastreio: TStringList;
  sNN: String;
begin
  iTipo := 0;
  bAVista := False;
  dVerba := 0;
  sRastreio := TStringList.Create;
  if sOperacao = 'I' then
  begin
    sItens := TStringList.Create();
    if Application.MessageBox('Confirma Gravar os dados?', 'Gravar os Dados',
      MB_YESNO + MB_ICONQUESTION) = IDNO then
    begin
      tbExtravios.Edit;
      cxGrid1DBTableView1DES_ENVIO_CORRESPONDENCIA.FocusWithSelection;
      Exit;
    end;
    if tbExtravios.State = dsInsert then
    begin
      cxGrid1DBTableView1NUM_NOSSONUMERO.FocusWithSelection;
      tbExtravios.Post;
    end;
    if not Assigned(frmGravarExtravio) then
    begin
      frmGravarExtravio := TfrmGravarExtravio.Create(Application);
    end;
    if frmGravarExtravio.ShowModal = mrCancel then
    begin
      FreeAndNil(frmGravarExtravio);
      Exit;
    end;
    sNN := FloatToStr(tbExtraviosNUM_NOSSONUMERO.AsFloat);
    if entrega.getObject(sNN, 'NOSSONUMERO') then
    begin
      if entrega.Fechado = 'S' then
      begin
        dVerba := entrega.VerbaEntregador
      end
      else
      begin
        entrega.Baixado := 'E';
        entrega.DataBaixa := dm.tbAcareacoesDAT_ACAREACAO.AsDateTime;
        sRastreio.Text := entrega.Rastreio;
        sRastreio.Add('Entrega Extraviada em ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' por ' + uGlobais.sNomeUsuario);
        entrega.Rastreio := sRastreio.Text;
        if not entrega.Update then
        begin
          Application.MessageBox('Erro ao atualizar o registro de entrega!', PChar('Atenção ' + uGlobais.sUsuario),
          MB_OK + MB_ICONEXCLAMATION);
        end;
      end;
    end;
    iTipo := frmGravarExtravio.cxComboBox1.ItemIndex;
    bAVista := frmGravarExtravio.cxAVista.Checked;
    FreeAndNil(frmGravarExtravio);
    extravio.Codigo := 0;
    extravio.NossoNumero := tbExtraviosNUM_NOSSONUMERO.AsString;
    extravio.Data := tbExtraviosDAT_EXTRAVIO.AsDateTime;
    extravio.entregador := tbExtraviosCOD_ENTREGADOR.AsInteger;
    extravio.agente := tbExtraviosCOD_AGENTE.AsInteger;
    extravio.Descricao := tbExtraviosDES_EXTRAVIO.AsString;
    extravio.Produto := tbExtraviosVAL_PRODUTO.AsFloat;
    extravio.Multa := tbExtraviosVAL_MULTA.AsFloat;
    extravio.Verba := 0;
    extravio.Envio := tbExtraviosDES_ENVIO_CORRESPONDENCIA.AsString;
    extravio.Retorno := tbExtraviosDES_RETORNO_CORRESPONDENCIA.AsString;
    extravio.Obs := tbExtraviosDES_OBSERVACOES.Text;
    extravio.Total := extravio.Produto + extravio.Multa + extravio.Verba;
    extravio.Excutor := uGlobais.sUsuario;
    extravio.Manutencao := Now;
    if (not extravio.Validar()) then
    begin
      tbExtravios.Edit;
      cxGrid1DBTableView1NUM_NOSSONUMERO.FocusWithSelection;
      Exit;
    end;
    if iTipo = 2 then
    begin
      extravio.restricao := 'N';
    end
    else
    begin
      extravio.restricao := 'S';
    end;
    extravio.Tipo := iTipo;
    extravio.ValDebito := 0;
    extravio.Debito := 'N';
    if (not extravio.Insert()) then
    begin
      Application.MessageBox('Falha ao gravar o extravio!', 'Erro',
        MB_OK + MB_ICONERROR);
      if tbExtravios.Locate('NUM_NOSSONUMERO', extravio.NossoNumero, []) then
      begin
        tbExtravios.Edit;
        cxGrid1DBTableView1NUM_NOSSONUMERO.FocusWithSelection;
        Exit;
      end;
    end;
    GeraRestricao(bAVista);
    sOperacao := 'X';
    Modo;
  end
  else
  begin
    if Application.MessageBox('Confirma Gravar os dados?', 'Gravar os Dados',
      MB_YESNO + MB_ICONQUESTION) = IDNO then
    begin
      tbExtravios.Edit;
      cxGrid1DBTableView1DES_ENVIO_CORRESPONDENCIA.FocusWithSelection;
      Exit;
    end;
    extravio.Codigo := tbExtraviosCOD_EXTRAVIO.AsInteger;
    extravio.NossoNumero := tbExtraviosNUM_NOSSONUMERO.AsString;
    extravio.Data := tbExtraviosDAT_EXTRAVIO.AsDateTime;
    extravio.entregador := tbExtraviosCOD_ENTREGADOR.AsInteger;
    extravio.agente := tbExtraviosCOD_AGENTE.AsInteger;
    extravio.Descricao := tbExtraviosDES_EXTRAVIO.AsString;
    extravio.Produto := tbExtraviosVAL_PRODUTO.AsFloat;
    extravio.Multa := tbExtraviosVAL_MULTA.AsFloat;
    extravio.Verba := tbExtraviosVAL_VERBA.AsFloat;
    extravio.Envio := tbExtraviosDES_ENVIO_CORRESPONDENCIA.AsString;
    extravio.Retorno := tbExtraviosDES_RETORNO_CORRESPONDENCIA.AsString;
    extravio.Obs := tbExtraviosDES_OBSERVACOES.AsString;
    extravio.Total := extravio.Produto + extravio.Multa + extravio.Verba;
    extravio.Excutor := uGlobais.sUsuario;
    extravio.Manutencao := Now;
    extravio.restricao := tbExtraviosDOM_RESTRICAO.AsString;
    extravio.Tipo := tbExtraviosCOD_TIPO.AsInteger;
    if (not extravio.Validar()) then
    begin
      tbExtravios.Edit;
      cxGrid1DBTableView1NUM_NOSSONUMERO.FocusWithSelection;
      Exit;
    end;
    if (not extravio.Update()) then
    begin
      Application.MessageBox('Falha ao gravar a alteração do extravio!', 'Erro',
        MB_OK + MB_ICONERROR);
      if tbExtravios.Locate('NUM_NOSSONUMERO', extravio.NossoNumero, []) then
      begin
        tbExtravios.Edit;
      end;
      cxGrid1DBTableView1DES_ENVIO_CORRESPONDENCIA.FocusWithSelection;
      Exit;
    end;
    sOperacao := 'S';
    Modo;
  end;
end;

procedure TfrmExtraviosProdutos.GeraRestricao(bAVista: Boolean);
var
  dValor: Double;
  iEntregador: Integer;
  sFiltro: String;
begin
  dValor := 0;
  iEntregador := 0;
  sFiltro := '';
  iEntregador := extravio.entregador;
  restricao.entregador := iEntregador;
  sFiltro := 'ENTREGADOR';
  if extravio.Tipo = 0 then
  begin
    iEntregador := extravio.agente;
    restricao.entregador := iEntregador;
    sFiltro := 'AGENTE';
  end;
  if not(agente.getObject(IntToStr(extravio.agente), 'CODIGO')) then
  begin
    MessageDlg('Código de Adm. de CEP não Encontrado!', mtWarning, [mbOK], 0);
    Exit;
  end;
  if restricao.getObject(IntToStr(iEntregador), sFiltro) then
  begin
    dValor := restricao.Valor;
    restricao.Valor := dValor + extravio.Total;
    if bAVista then
    begin
      dValor := 0;
      dValor := restricao.Debitar;
      restricao.Debitar := dValor + extravio.Total;
    end;
    if not(restricao.Update()) then
    begin
      MessageDlg('Erro ao alterar o valor da Restrição!', mtWarning, [mbOK], 0);
    end;
  end
  else
  begin
    restricao.agente := extravio.agente;
    restricao.entregador := iEntregador;
    restricao.Pago := 0;
    if bAVista then
    begin
      dValor := 0;
      dValor := restricao.Debitar;
      restricao.Debitar := dValor + extravio.Total;
    end
    else
    begin
      restricao.Debitar := 0;
    end;
    dValor := extravio.Total;
    restricao.Valor := dValor;
    if not(restricao.Insert()) then
    begin
      MessageDlg('Erro ao incluir o valor da Restrição!', mtWarning, [mbOK], 0);
    end;
  end;
end;

procedure TfrmExtraviosProdutos.Estorno;
var
  sMess, sMess1, sAgente: String;
  dValor, dDebitar: Double;
  sRastreio: TStringList;
  sNN: string;
  dVerba: Double;
begin
  sNN := '';
  dVerba := 0;
  sRastreio := TStringList.Create;
  if sOperacao = 'I' then
  begin
    Exit;
  end;
  if tbExtraviosDOM_RESTRICAO.Value = 'E' then
  begin
    Application.MessageBox('Extravio já estornado!',PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if Pos(sOperacao, 'SU') > 0 then
  begin
    if (not extravio.getObject(tbExtraviosCOD_EXTRAVIO.AsString, 'CODIGO')) then
    begin
      MessageDlg('Extravio não encontrado!', mtWarning, [mbOK], 0);
      Exit;
    end;
    sMess := 'Essa ação acarretará no estorno do valor do extravio do Total da Restrição do Entregador. '
      + #13 + 'Este estorno poderá gerar um lançamento de crédito, caso o valor do Extravio seja maior que '
      + 'o valor Total da Restrição. ' + #13 +
      'Estes procedimentos exigem a autorização do Administrador do Sistema.' +
      #13 + 'Confirma estornar este Extravio?';
    if Application.MessageBox(pChar(sMess), PChar('Atenção ' + uGlobais.sUsuario), MB_ICONQUESTION + MB_YESNO) = IDNO then
    begin
      Exit;
    end;
    if not Assigned(frmAutorizacao) then
      frmAutorizacao := TfrmAutorizacao.Create(Application);
    if frmAutorizacao.ShowModal = mrCancel then
    begin
      FreeAndNil(frmAutorizacao);
      Exit;
    end;
    if (not extravio.getObject(tbExtraviosCOD_EXTRAVIO.AsString, 'CODIGO')) then
    begin
      MessageDlg('Extravio não encontrado!', mtWarning, [mbOK], 0);
      Exit;
    end;
    dValor := 0;
    dDebitar := 0;
    if restricao.getObject(IntToStr(extravio.entregador), 'ENTREGADOR') then
    begin
      dValor := (restricao.Valor - extravio.Total);
      {if restricao.Debitar <= extravio.Total then
      begin
        dDebitar := restricao.Debitar - extravio.Total;
      end
      else
      begin
        dDebitar := 0;
      end;}
    end
    else
    begin
      dValor := 0;
      dDebitar := 0;
      if restricao.getObject(IntToStr(extravio.Agente), 'AGENTE') then
      begin
        dValor := (restricao.Valor - extravio.Total);
        {if restricao.Debitar > extravio.Total then
        begin
          dDebitar := restricao.Debitar - extravio.Total;
        end
        else
        begin
          dDebitar := 0;
        end;}
      end
      else
      begin
        dValor := 0;
        dDebitar := 0;
        MessageDlg('Restrição de Entregador não encontrada!', mtWarning, [mbOK], 0);
        Exit;
      end;
    end;
    if dValor >= 0 then
    begin
      restricao.Valor := dValor;
    end
    else
    begin
      restricao.Valor := 0;
    end;
    //restricao.Debitar := dDebitar;
    if not(restricao.Update()) then
    begin
      MessageDlg('Não foi possível Estornar o valor do Extravio!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if dValor < 0 then
    begin
      GeraCredito(dValor);
    end;
    sMess := 'Extravio NN. ' + extravio.NossoNumero + ' no valor de ' +
      FormatFloat('###,##0.00', extravio.Total) + ', ESTORNADO pelo usuário ' +
      uGlobais.sNomeUsuario + ' autorizado pelo Administrador ' +
      uGlobais.sNomeUsuario + ' em ' + DateTimeToStr(Now);
    extravio.Obs := extravio.Obs + #13 + sMess;
    extravio.restricao := 'E';
    extravio.Tipo := 3;
    tbExtravios.Edit;
    tbExtraviosDES_OBSERVACOES.Value := extravio.Obs;
    tbExtraviosDOM_RESTRICAO.Value := extravio.Restricao;
    tbExtraviosCOD_TIPO.Value := extravio.Tipo;
    tbExtravios.Post;
    if extravio.Update() then
    begin
      MessageDlg('Extravio Estornado.', mtInformation, [mbOK], 0);
    end;
    sRastreio := TStringList.Create;
    sNN := extravio.NossoNumero;
    if entrega.getObject(sNN, 'NOSSONUMERO') then
    begin
      if entrega.Baixado = 'E' then
      begin
        entrega.Baixado := 'N';
        entrega.DataBaixa := 0;
        sRastreio.Text := entrega.Rastreio;
        sRastreio.Add(sMess);
        entrega.Rastreio := sRastreio.Text;
        if not entrega.Update then
        begin
          Application.MessageBox('Erro ao atualizar o registro de entrega!', PChar('Atenção ' + uGlobais.sUsuario),
          MB_OK + MB_ICONEXCLAMATION);
        end;
      end;
    end;
  end;
end;

procedure TfrmExtraviosProdutos.GeraCredito(dValor: Double);
var
  sDes: String;
begin
  sDes := 'Crédito de ' + FormatFloat('###,##0.00', Abs(dValor)) +
    ' referente à exclusão do Extravio Nº. ' + IntToStr(extravio.Codigo) + ', NN ' +
    extravio.NossoNumero + '.';
  lancamento.Descricao := sDes;
  lancamento.Data := Now;
  if extravio.entregador <> 0 then
  begin
    if entregador.getObject(IntToStr(extravio.Entregador),'CODIGO') then
    begin
      lancamento.entregador := entregador.Cadastro;
    end
    else
    begin
      lancamento.entregador := extravio.entregador;
    end;
  end
  else
  begin
    lancamento.entregador := extravio.agente;
  end;
  lancamento.Tipo := 'CREDITO';
  lancamento.Valor := Abs(dValor);
  lancamento.Descontado := 'N';
  if not(lancamento.Insert()) then
  begin
    MessageDlg('Não foi possível gerar o lançamento de crédito!', mtWarning, [mbOK], 0);
  end;
end;

procedure TfrmExtraviosProdutos.Modo;
begin
  if sOperacao = 'I' then
  begin
    actExtraviosProdutosIncluir.Enabled := False;
    actExtraviosProdutosEstornar.Enabled := False;
    actExtraviosProdutosGravar.Enabled := True;
    actExtraviosProdutosLocalizar.Enabled := False;
    actExtraviosProdutosCancelar.Enabled := True;
    actExtraviosProdutosExportar.Enabled := False;
    actExtraviosProdutosEditar.Enabled := False;
    actExtraviosProdutosImportar.Enabled := False;
    actExtraviosProdutosFiltrar.Enabled := False;
    cxGrid1DBTableView1NUM_NOSSONUMERO.Properties.ReadOnly := False;
    cxGrid1DBTableView1COD_ENTREGADOR.Properties.ReadOnly := False;
    cxGrid1DBTableView1VAL_PRODUTO.Properties.ReadOnly := False;
    cxGrid1DBTableView1VAL_MULTA.Properties.ReadOnly := False;
    cxGrid1DBTableView1.NewItemRow.InfoText := 'Clique aqui para Incluir';
    cxGrid1DBTableView1.NewItemRow.Visible := True;
  end
  else if sOperacao = 'U' then
  begin
    actExtraviosProdutosIncluir.Enabled := False;
    actExtraviosProdutosEstornar.Enabled := False;
    actExtraviosProdutosGravar.Enabled := True;
    actExtraviosProdutosLocalizar.Enabled := False;
    actExtraviosProdutosCancelar.Enabled := True;
    actExtraviosProdutosExportar.Enabled := False;
    actExtraviosProdutosEditar.Enabled := False;
    actExtraviosProdutosImportar.Enabled := False;
    actExtraviosProdutosFiltrar.Enabled := False;
    cxGrid1DBTableView1NUM_NOSSONUMERO.Properties.ReadOnly := True;
    cxGrid1DBTableView1COD_ENTREGADOR.Properties.ReadOnly := True;
    cxGrid1DBTableView1VAL_PRODUTO.Properties.ReadOnly := True;
    cxGrid1DBTableView1VAL_MULTA.Properties.ReadOnly := True;
    cxGrid1DBTableView1.NewItemRow.Visible := False;
  end
  else if sOperacao = 'S' then
  begin
    actExtraviosProdutosIncluir.Enabled := True;
    actExtraviosProdutosEstornar.Enabled := True;
    actExtraviosProdutosGravar.Enabled := False;
    actExtraviosProdutosLocalizar.Enabled := False;
    actExtraviosProdutosCancelar.Enabled := True;
    actExtraviosProdutosExportar.Enabled := True;
    actExtraviosProdutosEditar.Enabled := True;
    actExtraviosProdutosImportar.Enabled := False;
    actExtraviosProdutosFiltrar.Enabled := False;
    cxGrid1DBTableView1NUM_NOSSONUMERO.Properties.ReadOnly := False;
    cxGrid1DBTableView1COD_ENTREGADOR.Properties.ReadOnly := False;
    cxGrid1DBTableView1VAL_PRODUTO.Properties.ReadOnly := False;
    cxGrid1DBTableView1VAL_MULTA.Properties.ReadOnly := False;
    cxGrid1DBTableView1.NewItemRow.InfoText := 'Clique aqui para Localizar';
    cxGrid1DBTableView1.NewItemRow.Visible := True;
  end
  else
  begin
    actExtraviosProdutosIncluir.Enabled := True;
    actExtraviosProdutosEstornar.Enabled := True;
    actExtraviosProdutosGravar.Enabled := False;
    actExtraviosProdutosLocalizar.Enabled := True;
    actExtraviosProdutosCancelar.Enabled := False;
    actExtraviosProdutosExportar.Enabled := False;
    actExtraviosProdutosEditar.Enabled := False;
    actExtraviosProdutosImportar.Enabled := True;
    actExtraviosProdutosFiltrar.Enabled := True;
    cxGrid1DBTableView1NUM_NOSSONUMERO.Properties.ReadOnly := True;
    cxGrid1DBTableView1COD_ENTREGADOR.Properties.ReadOnly := True;
    cxGrid1DBTableView1VAL_PRODUTO.Properties.ReadOnly := True;
    cxGrid1DBTableView1VAL_MULTA.Properties.ReadOnly := True;
    cxGrid1DBTableView1.NewItemRow.Visible := False;
  end;
  bSalva := False;
  acessos.SetNivel(aclExtraviosProdutos);

end;

procedure TfrmExtraviosProdutos.LocalizarExtravios;
begin
  cxGrid1DBTableView1.NewItemRow.Visible := False;
  tbExtravios.Close;
  tbExtravios.Open;
  if (not extravio.getObject(sId, sColuna)) then
  begin
    Application.MessageBox('Nenhum extravio encontrada!', 'Atenção!',
      MB_OK + MB_ICONEXCLAMATION);
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
    Exit;
  end;
  tbExtravios.LoadFromDataSet(dm.qryGetObject);
  dm.qryGetObject.Close;
  dm.qryGetObject.SQL.Clear;
end;

procedure TfrmExtraviosProdutos.ExportarGrade;
var
  FileExt: String;
begin
  if not(tbExtravios.Active) then
  begin
    Exit;
  end;
  if tbExtravios.IsEmpty then
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
    ShellExecute(Handle, 'open', pChar(SaveDialog.FileName), nil, nil, SW_SHOW);
  end;
end;

procedure TfrmExtraviosProdutos.ListaAgente;
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
    SQL.Text := 'SELECT COD_AGENTE AS "Código", NOM_FANTASIA AS "Nome" ' +
      'FROM tbagentes ';
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
  frmListaApoio.Caption := 'Administradores de CEP';
  Screen.Cursor := crDefault;
  i := 0;
  if frmListaApoio.ShowModal = mrOk then
  begin
    sId := dm.qryPesquisa.Fields[0].AsString;
    cxGrid1DBTableView1COD_AGENTE.DataBinding.Field.Value := sId;
    agente.Codigo := dm.qryPesquisa.Fields[2].AsString;
    bFlag := True;
  end;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  FreeAndNil(frmListaApoio);
end;

procedure TfrmExtraviosProdutos.FiltrarDados;
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
  LocalizarExtravios;
end;

procedure TfrmExtraviosProdutos.PopulaEntregadores;
begin
  if tbEntregadores.Active then
  begin
    tbEntregadores.Close;
  end;
  tbEntregadores.Open;
  if entregador.getObjects() then
  begin
    tbEntregadores.LoadFromDataSet(dm.qryGetObject);
  end;
  dm.qryGetObject.Close;
  dm.qryGetObject.SQL.Clear;
end;

end.
