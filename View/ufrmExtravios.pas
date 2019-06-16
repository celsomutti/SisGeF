unit ufrmExtravios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint,   dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,   dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy,   dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinsdxBarPainter, dxBar, cxClasses, ActnList, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, DB, dxmdaset, cxTextEdit, cxDBEdit, cxLabel, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxCurrencyEdit, cxSpinEdit, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxCheckBox, clExtravios, clAgentes, clRestricoes, clLancamentos, clEntrega, clCodigosEntregadores, Menus, StdCtrls, cxButtons,
  cxPCdxBarPopupMenu, cxPC, cxButtonEdit, cxCalc, cxGridExportLink, ShellAPI, cxGroupBox, cxRadioGroup, DateUtils,   ExtCtrls,
  cxImage, cxNavigator, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.ImgList, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White, dxBarBuiltInMenu, System.Actions, clAcessos,
  clGruposVerba;

type
  TfrmExtravios = class(TForm)
    aclCadastro               : TActionList;
    actCadastroIncluir        : TAction;
    actCadastroExcluir        : TAction;
    actCadastroCancelar       : TAction;
    actCadastroSalvar         : TAction;
    actCadastroSair           : TAction;
    actCadastroListaApoio     : TAction;
    ds                        : TDataSource;
    actCadastroRestricao      : TAction;
    actCadastroExportar: TAction;
    SaveDialog: TSaveDialog;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxImageList1: TcxImageList;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    cxTabSheet2: TcxTabSheet;
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxCodigo: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxData: TcxDateEdit;
    cxLabel4: TcxLabel;
    cxLabel10: TcxLabel;
    cxEntregador: TcxButtonEdit;
    cxNomeEntregador: TcxTextEdit;
    cxLabel5: TcxLabel;
    cxExtravio: TcxCurrencyEdit;
    cxLabel6: TcxLabel;
    cxMulta: TcxCurrencyEdit;
    cxLabel7: TcxLabel;
    cxVerba: TcxCurrencyEdit;
    cxLabel8: TcxLabel;
    cxTotal: TcxCalcEdit;
    cxLabel11: TcxLabel;
    cxManutencao: TcxTextEdit;
    cxDescricao: TcxComboBox;
    cxRadioGroup1: TcxRadioGroup;
    cxRestricao: TcxCheckBox;
    cxNossoNumero: TcxMaskEdit;
    dxBarButton6: TdxBarButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxLabel9: TcxLabel;
    cxDataInicial: TcxDateEdit;
    cxLabel12: TcxLabel;
    cxDataFinal: TcxDateEdit;
    actCadastroExecutar: TAction;
    cxButton1: TcxButton;
    actCadastroVisualizar: TAction;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxGrid1DBTableView1COD_EXTRAVIO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_EXTRAVIO: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_EXTRAVIO: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_NOSSONUMERO: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_TOTAL: TcxGridDBColumn;
    cxGrid1DBTableView1DOM_RESTRICAO: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_ENTREGADOR: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_AGENTE: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_PRODUTO: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_MULTA: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_VERBA: TcxGridDBColumn;
    cxLabel27: TcxLabel;
    actCadastroImportar: TAction;
    dxBarButton7: TdxBarButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actCadastroIncluirExecute(Sender: TObject);
    procedure actCadastroListaApoioExecute(Sender: TObject);
    procedure actCadastroCancelarExecute(Sender: TObject);
    procedure actCadastroExcluirExecute(Sender: TObject);
    procedure actCadastroSalvarExecute(Sender: TObject);
    procedure actCadastroSairExecute(Sender: TObject);
    procedure cxAgentePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure actCadastroRestricaoExecute(Sender: TObject);
    procedure cxTotalEnter(Sender: TObject);
    procedure actCadastroExportarExecute(Sender: TObject);
    procedure cxGrid1DBTableView1CanFocusRecord(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      var AAllow: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cxNossoNumeroPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure actCadastroVisualizarExecute(Sender: TObject);
    procedure actCadastroExecutarExecute(Sender: TObject);
    procedure cxEntregadorPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure actCadastroImportarExecute(Sender: TObject);
  private
    { Private declarations }
    procedure ListaEntregador;
    procedure SetupForm;
    procedure Modo;
    procedure SetupClass;
    procedure GeraCredito;
    procedure AtualizaGrid;
    procedure GeraRestricao;
    procedure ListaDescricao;
    procedure VisualizarDados;
    procedure RetornaVerba(sCodigoEntregador: String);
  public
    { Public declarations }
  end;

var
  frmExtravios  : TfrmExtravios;
  extravio      : TExtravios;
  agente        : TAgente;
  restricao     : TRestricoes;
  lancamento    : TLancamentos;
  entrega       : TEntrega;
  entregador    : TCodigosEntregadores;
  sOperacao     : String;
  sExtravio     : String;
  acessos       : TAcessos;
  verba         : TGruposVerba;
implementation

{$R *.dfm}

uses
  udm, clUtil, ufrmPrincipal,ufrmListaApoio, ufrmLocalizar, ufrmAutorizacao, uGlobais, ufrmImportarExtravios;

procedure TfrmExtravios.FormShow(Sender: TObject);
begin
  extravio    :=  TExtravios.Create();
  agente      :=  TAgente.Create();
  restricao   :=  TRestricoes.Create();
  lancamento  :=  TLancamentos.Create();
  entrega     :=  TEntrega.Create();
  entregador  :=  TCodigosEntregadores.Create();
  acessos     :=  TAcessos.Create;
  verba       :=  TGruposVerba.Create();
  sOperacao   :=  '';
  Modo;
end;

procedure TfrmExtravios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  extravio.Free;
  agente.Free;
  restricao.Free;
  lancamento.Free;
  entrega.Free;
  entregador.Free;
  acessos.Free;
  verba.Free;
  if dm.tbExtravios.Active then begin
    dm.tbExtravios.Close;
  end;
  Action        :=  caFree;
  frmExtravios  :=  Nil;
end;

procedure TfrmExtravios.SetupForm;
var
  sDescricao: String;
begin
  sDescricao              :=  '';
  cxCodigo.Text           :=  IntToStr(extravio.Codigo);
  cxDescricao.Text        :=  extravio.Descricao;
  cxData.Date             :=  extravio.Data;
  agente.Codigo           :=  IntToStr(extravio.Agente);
  cxNossoNumero.Text      :=  extravio.NossoNumero;
  cxExtravio.Value        :=  extravio.Produto;
  cxMulta.Value           :=  extravio.Multa;
  cxVerba.Value           :=  extravio.Verba;
  cxTotal.Value           :=  extravio.Total;
  if extravio.Restricao = 'S' then
    cxRestricao.Checked :=  True
  else
    cxRestricao.Checked := False;
  entregador.Codigo       :=  extravio.Entregador;
  cxEntregador.Text       :=  IntToStr(extravio.Entregador);
  cxRadioGroup1.ItemIndex :=  extravio.Tipo;
  sDescricao              :=  entregador.getField('NOM_FANTASIA','CODIGO');
  cxNomeEntregador.Text   :=  sDescricao;
  cxManutencao.Text       :=  extravio.Excutor + ' em ' + DateTimeToStr(extravio.Manutencao);
end;

procedure TfrmExtravios.Modo;
begin
  if TUtil.Empty(sOperacao) then begin
    cxPageControl1.ActivePageIndex  :=  0;
    actCadastroIncluir.Enabled      :=  True;
    actCadastroExcluir.Enabled      :=  False;
    actCadastroSalvar.Enabled       :=  False;
    actCadastroRestricao.Enabled    :=  False;
    actCadastroCancelar.Enabled     :=  False;
    actCadastroSair.Enabled         :=  True;
    cxGroupBox1.Enabled             :=  False;
  end
  else if sOperacao = 'I' then begin
    cxPageControl1.ActivePageIndex  :=  0;
    actCadastroIncluir.Enabled      :=  False;
    actCadastroExcluir.Enabled      :=  False;
    actCadastroSalvar.Enabled       :=  True;
    actCadastroRestricao.Enabled    :=  False;
    actCadastroCancelar.Enabled     :=  True;
    actCadastroSair.Enabled         :=  True;
    cxGroupBox1.Enabled             :=  True;
    ListaDescricao;
  end
  else if sOperacao = 'S' then begin
    cxPageControl1.ActivePageIndex  :=  0;
    actCadastroIncluir.Enabled      :=  False;
    actCadastroExcluir.Enabled      :=  True;
    actCadastroSalvar.Enabled       :=  False;
    actCadastroCancelar.Enabled     :=  True;
    actCadastroSair.Enabled         :=  True;
    cxGroupBox1.Enabled             :=  False;
  end;
  acessos.SetNivel(aclCadastro);
end;


procedure TfrmExtravios.actCadastroImportarExecute(Sender: TObject);
begin
  if not Assigned(frmImportarExtravios) then begin
    frmImportarExtravios :=  TfrmImportarExtravios.Create(Application);
  end;
  frmImportarExtravios.ShowModal;
end;

procedure TfrmExtravios.actCadastroIncluirExecute(Sender: TObject);
begin
  TUtil.LimparFields(Self);
  cxCodigo.Text :=  '0';
  sOperacao     :=  'I';
  Modo;
  cxNossoNumero.SetFocus;
end;

procedure TfrmExtravios.actCadastroListaApoioExecute(Sender: TObject);
begin
  if sOperacao = '' then begin
    Exit;
  end;
if cxEntregador.IsFocused then begin
    ListaEntregador;
  end;
end;

procedure TfrmExtravios.actCadastroCancelarExecute(Sender: TObject);
begin
  TUtil.LimparFields(Self);
  sOperacao :=  '';
  Modo;
end;

procedure TfrmExtravios.actCadastroExcluirExecute(Sender: TObject);
var
  sMess, sMess1, sAgente: String;
  dValor: Double;
begin
  if sOperacao = 'I' then
    Exit;

  if extravio.Restricao = 'S' then begin
    sMess := 'Excluir um Extravio acarretará no estorno do valor do mesmo do Total da Restrição do Agente. ' + #13 +
             'Este estorno poderá gerar um lançamento de crédito, caso o valor do Extravio seja maior que ' +
             'o valor Total da Restrição. ' + #13 +
             'Estes procedimentos exigem a autorização do Administrador do Sistema.' + #13 +
             'Confirma excluir este Extravio?';

    if Application.MessageBox(pChar(sMess) ,'Excluir Extravio',MB_ICONQUESTION + MB_YESNO) = idno then
      Exit;
    if not Assigned(frmAutorizacao) then
      frmAutorizacao := TfrmAutorizacao.Create(Application);
    if frmAutorizacao.ShowModal = mrCancel then begin
      FreeAndNil(frmAutorizacao);
      Exit;
    end;
    dValor := 0;
    if extravio.Tipo = 0 then begin
      if restricao.getObject(IntToStr(extravio.Agente),'AGENTE') then begin
        dValor := (restricao.Valor - extravio.Total);
      end
      else begin
        dValor  :=  0;
        MessageDlg('Restrição de Agente não encontrada!',mtWarning,[mbOK],0);
        Exit;
      end;
    end
    else begin
      if restricao.getObject(IntToStr(extravio.Entregador),'ENTREGADOR') then begin
        dValor := (restricao.Valor - extravio.Total);
      end
      else begin
        dValor  :=  0;
        MessageDlg('Restrição de Entregador não encontrada!',mtWarning,[mbOK],0);
        Exit;
      end;
    end;
    if dValor >= 0 then begin
      restricao.Valor := dValor;
      if restricao.Valor = 0 then begin
        if not (restricao.Delete('AGENTE')) then begin
          MessageDlg('Não foi possível Excluir o valor do Extravio!',mtWarning,[mbOK],0);
          Exit;
        end;
      end
      else begin
        if not (restricao.Update()) then begin
          MessageDlg('Não foi possível Estornar o valor do Extravio!',mtWarning,[mbOK],0);
          Exit;
        end;
      end;
    end
    else begin
      GeraCredito;
      sMess := 'Extravio Nº. ' + IntToStr(extravio.Codigo) + ' no valor de ' + FormatFloat('###,##0.00',extravio.Total) +
               ', EXCLUIDO pelo usuário ' + uGlobais.sNomeUsuario +
               ' autorizado pelo Administrador ' + uGlobais.sNomeUsuario + ' em ' + DateTimeToStr(Now);
    end;
  end
  else begin
    if Application.MessageBox('Deseja Excluir este Extravio?' ,'Excluir Extravio',MB_ICONQUESTION + MB_YESNO) = idno then
      Exit;
  end;
  if extravio.Delete('CODIGO') then begin
    MessageDlg('Registro Excluído.',mtInformation,[mbOK],0);
    TUtil.LimparFields(Self);
    sOperacao := 'I';
    Modo;
  end;
  if (not dm.tbExtravios.Active) then begin
    Exit;
  end;
  AtualizaGrid;
end;

procedure TfrmExtravios.actCadastroExecutarExecute(Sender: TObject);
begin
  AtualizaGrid;
end;

procedure TfrmExtravios.SetupClass;
var
  sCodigo: String;
begin
  cxTotal.Value := cxExtravio.Value + cxMulta.Value + cxVerba.Value;
  if TUtil.Empty(cxCodigo.Text) then begin
    cxCodigo.Text := '0';
  end;
  extravio.Codigo       :=  StrToInt(cxCodigo.Text);
  extravio.Descricao    :=  cxDescricao.Text;
  if TUtil.Empty(cxData.Text) then begin
    extravio.Data         :=  0;
  end
  else begin
    extravio.Data         :=  cxData.Date;
  end;
  extravio.NossoNumero  :=  cxNossoNumero.Text;
  extravio.Produto      :=  cxExtravio.Value;
  extravio.Multa        :=  cxMulta.Value;
  extravio.Verba        :=  cxVerba.Value;
  extravio.Total        :=  cxTotal.Value;
  extravio.Tipo         :=  cxRadioGroup1.ItemIndex;
  if cxRestricao.Checked then begin
    extravio.Restricao    :=  'S';
  end
  else begin
    extravio.Restricao    :=  'N';
  end;
  if TUtil.Empty(cxEntregador.Text) then begin
    cxEntregador.Text  := '0';
  end;
  extravio.Entregador   :=  StrToInt(cxEntregador.Text);
  entregador.Codigo     :=  StrToInt(cxEntregador.Text);
  sCodigo               :=  entregador.getField('COD_AGENTE','CODIGO');
  if TUtil.Empty(sCodigo) then begin
    sCodigo :=  '0';
  end;
  extravio.Agente       :=  StrToInt(sCodigo);
  extravio.Excutor      :=  uGlobais.sUsuario;
  extravio.Manutencao   :=  Now;
end;

procedure TfrmExtravios.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key = #13 then begin
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;


end;

procedure TfrmExtravios.GeraCredito;
var
  sDes: String;
begin
  sDes := 'Crédito de ' + FormatFloat('###,##0.00',Abs(restricao.Valor)) + ' referente à exclusão do Extravio Nº. ' +
          IntToStr(extravio.Codigo);
  lancamento.Descricao  :=  sDes;
  lancamento.Data       :=  Now;
  if extravio.Entregador <> 0 then
    lancamento.Entregador :=  extravio.Entregador
  else
    lancamento.Entregador :=  extravio.agente;
  lancamento.Tipo       :=  'CRÉDITO';
  lancamento.Valor      :=  Abs(restricao.Valor);
  lancamento.Descontado :=  'N';
  lancamento.Desconto   :=  Null;
  if not (lancamento.Insert()) then
    MessageDlg('Não foi possível gerar o lançamento de crédito!',mtWarning,[mbOK],0);
end;

procedure TfrmExtravios.actCadastroSalvarExecute(Sender: TObject);
begin
  if (sOperacao = 'U') and (extravio.Restricao = 'S') then begin
    MessageDlg('Este extravio já gerou uma restrição. Impossível Alterar!',mtWarning,[mbOK],0);
    Exit;
  end;
  SetupClass;
  if not (extravio.Validar()) then
    Exit;
  if sOperacao = 'I' then begin
    if extravio.NNExiste(extravio.NossoNumero) then begin
      MessageDlg('Extravio referente a esta NN já cadastrado!',mtWarning,[mbOK],0);
      Exit;
    end;
  end;
  if Application.MessageBox('Confirma salvar este extravio?','Salvar',MB_ICONQUESTION + MB_YESNO) = IDNO then
    Exit;
  if sOperacao = 'I' then begin
    if not (extravio.Insert()) then begin
      MessageDlg('Não foi possível incluir este Extravio!',mtWarning,[mbOK],0);
      Exit;
    end;
  end;
  if cxRestricao.Checked then begin
    GeraRestricao;
  end;
  Application.MessageBox('Registro gravado com sucesso!', 'Atenção', MB_OK + MB_ICONINFORMATION);
  ListaDescricao;
  dm.tbExtravios.IsLoading :=  True;
  TUtil.LimparFields(Self);
  dm.tbExtravios.IsLoading :=  False;
  sOperacao := 'I';
  Modo;
  cxCodigo.Text :=  '0';
  cxNossoNumero.SetFocus;
end;

procedure TfrmExtravios.actCadastroVisualizarExecute(Sender: TObject);
begin
  sExtravio :=  cxGrid1DBTableView1COD_EXTRAVIO.DataBinding.Field.AsString;
  VisualizarDados;
end;

procedure TfrmExtravios.actCadastroSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmExtravios.AtualizaGrid;
begin
  if dm.tbExtravios.IsLoading then begin
    Exit;
  end;
  if TUtil.Empty(cxDataInicial.Text) then begin
    Application.MessageBox('Informe a Data inicial do Período!','Atenção', MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if TUtil.Empty(cxDataFinal.Text) then begin
    Application.MessageBox('Informe a Data final do Período!','Atenção', MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if cxDataInicial.Date > cxDataFinal.Date then begin
    Application.MessageBox('A Data inicial do Período não pode ser menor que Data Final!','Atenção', MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if not (extravio.Periodo(cxDataInicial.Date,cxDataFinal.Date)) then begin
    Application.MessageBox('Nenhum registro de extravio no período informado!','Atenção', MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  dm.qryPesquisa.First;
  if dm.tbExtravios.Active then begin
    dm.tbExtravios.Close;
  end;
  dm.tbExtravios.Open;
  while not (dm.qryPesquisa.Eof) do begin
    dm.tbExtravios.Insert;
    dm.tbExtraviosCOD_EXTRAVIO.Value     :=  dm.qryPesquisa.FieldByName('COD_EXTRAVIO').AsInteger;
    dm.tbExtraviosDES_EXTRAVIO.Value     :=  dm.qryPesquisa.FieldByName('DES_EXTRAVIO').AsString;
    dm.tbExtraviosDAT_EXTRAVIO.Value     :=  dm.qryPesquisa.FieldByName('DAT_EXTRAVIO').AsDateTime;
    dm.tbExtraviosNUM_NOSSONUMERO.Value  :=  dm.qryPesquisa.FieldByName('NUM_NOSSONUMERO').AsString;
    if agente.getObject(dm.qryPesquisa.FieldByName('COD_AGENTE').AsString,'CODIGO') then begin
      dm.tbExtraviosNOM_AGENTE.Value     :=  dm.qryPesquisa.FieldByName('COD_AGENTE').AsString + ' - ' + agente.Fantasia;
    end
    else begin
      dm.tbExtraviosNOM_AGENTE.Value     :=  dm.qryPesquisa.FieldByName('COD_AGENTE').AsString + ' - NÃO ENCONTRADO';
    end;
    if entregador.getObject(dm.qryPesquisa.FieldByName('COD_ENTREGADOR').AsString,'CODIGO') then begin
      dm.tbExtraviosNOM_ENTREGADOR.Value :=  dm.qryPesquisa.FieldByName('COD_ENTREGADOR').AsString + ' - ' + entregador.Nome;
    end
    else begin
      dm.tbExtraviosNOM_ENTREGADOR.Value :=  dm.qryPesquisa.FieldByName('COD_ENTREGADOR').AsString + ' - NÃO ENCONTRADO';
    end;
    dm.tbExtraviosVAL_PRODUTO.Value      :=  dm.qryPesquisa.FieldByName('VAL_PRODUTO').AsCurrency;
    dm.tbExtraviosVAL_VERBA.Value        :=  dm.qryPesquisa.FieldByName('VAL_VERBA').AsCurrency;
    dm.tbExtraviosVAL_MULTA.Value        :=  dm.qryPesquisa.FieldByName('VAL_MULTA').AsCurrency;
    dm.tbExtraviosVAL_TOTAL.Value        :=  dm.qryPesquisa.FieldByName('VAL_TOTAL').AsCurrency;
    dm.tbExtraviosDOM_RESTRICAO.Value    :=  dm.qryPesquisa.FieldByName('DOM_RESTRICAO').AsString;
    dm.tbExtravios.Post;
    dm.qryPesquisa.Next;
  end;
  if not (dm.tbExtravios.IsEmpty) then begin
    dm.tbExtravios.First;
  end;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  cxGrid1DBTableView1.ViewData.Expand(True);
end;

procedure TfrmExtravios.cxAgentePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  actCadastroListaApoioExecute(Self);
end;

procedure TfrmExtravios.cxEntregadorPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  if entregador.getObject(DisplayValue,'CODIGO') then begin
    cxNomeEntregador.Text :=  entregador.Nome;
    RetornaVerba(DisplayValue);
  end
  else begin
    cxNomeEntregador.Text :=  '- - -';
  end;

end;

procedure TfrmExtravios.actCadastroRestricaoExecute(Sender: TObject);
begin
  if extravio.Restricao = 'S' then begin
    Exit;
  end;
  if Application.MessageBox('Confirma Gerar Restrição deste Extravio?','Restrição',MB_YESNO + MB_ICONQUESTION) = IDYES then begin
    GeraRestricao;
    AtualizaGrid;
  end;
end;

procedure TfrmExtravios.cxTotalEnter(Sender: TObject);
begin
  if sOperacao = 'I' then begin
    cxTotal.Value :=  cxExtravio.Value + cxMulta.Value + cxVerba.Value;
  end;
end;

procedure TfrmExtravios.GeraRestricao;
var
  dValor      : Double;
  iEntregador : Integer;
begin
  dValor                :=  0;
  iEntregador           :=  0;
  extravio.Restricao    :=  'S';
  if not (extravio.Update()) then begin
    MessageDlg('Erro ao alterar o Status do Extravio!',mtError,[mbOK],0);
    Exit;
  end;
  iEntregador           :=  extravio.Entregador;
  restricao.Entregador  :=  iEntregador;
  if extravio.Tipo = 0 then begin
    iEntregador           :=  extravio.Agente;
    restricao.Entregador  :=  iEntregador;
  end;
  if not (agente.getObject(IntToStr(extravio.Agente),'CODIGO')) then begin
    MessageDlg('Código de Agente não Encontrado!',mtWarning,[mbOK],0);
    Exit;
  end;
  if restricao.getObject(IntToStr(extravio.agente),'AGENTE') then begin
    dValor                :=  restricao.Valor;
    restricao.Valor       :=  dValor + extravio.Total;
    if not (restricao.Update()) then begin
      MessageDlg('Erro ao alterar o valor da Restrição!', mtWarning,[mbOK],0);
    end;
  end
  else begin
    restricao.Agente      :=  extravio.Agente;
    restricao.Entregador  :=  iEntregador;
    restricao.Pago        :=  0;
    restricao.Debitar     :=  0;
    dValor                :=  extravio.Total;
    restricao.Valor       :=  dValor;
    if not (restricao.Insert()) then begin
      MessageDlg('Erro ao incluir o valor da Restrição!', mtWarning,[mbOK],0);
    end;
  end;
  TUtil.LimparFields(Self);
end;


procedure TfrmExtravios.actCadastroExportarExecute(Sender: TObject);
var
  FileExt: String;
begin
  if not (dm.tbExtravios.Active) then begin
    Exit;
  end;
  if dm.tbExtravios.IsEmpty then begin
    Exit;
  end;
  SaveDialog.Filter := 'Excel (*.xls) |*.xls|XML (*.xml) |*.xml|Arquivo Texto (*.txt) |*.txt|Página Web (*.html)|*.html';
  SaveDialog.Title := 'Exportar Dados';
  SaveDialog.DefaultExt:= 'xls';
  if SaveDialog.Execute then
  begin
    FileExt := LowerCase(ExtractFileExt(SaveDialog.FileName));
    if FileExt = '.xls' then
          ExportGridToExcel(SaveDialog.FileName,cxGrid1, False, True, False)
    else if FileExt = '.xml' then
          ExportGridToXML(SaveDialog.FileName,cxGrid1, False)
    else if FileExt = '.txt' then
          ExportGridToText(SaveDialog.FileName,cxGrid1, False)
    else if FileExt = '.html' then
          ExportGridToHTML(SaveDialog.FileName,cxGrid1, False);
    ShellExecute(Handle, 'open', pchar(SaveDialog.FileName), nil, nil, SW_SHOW);
  end;
end;


procedure TfrmExtravios.cxGrid1DBTableView1CanFocusRecord(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  var AAllow: Boolean);
var
  sCodigo : String;
  i, iRet : Integer;
begin
  if dm.tbExtravios.Active then begin
    sCodigo    := ARecord.DisplayTexts[4];
    Val(sCodigo,i,iRet);
    if iRet <> 0 then begin
      TUtil.LimparFields(Self);
      Exit;
    end;
    if extravio.getObject(sCodigo, 'CODIGO') then begin
      TUtil.LimparFields(Self);
      SetupForm;
      sOperacao := 'U';
      Modo;
    end
    else begin
      TUtil.LimparFields(Self);
      sOperacao :=  'I';
      Modo;
    end;
  end;
end;


procedure TfrmExtravios.cxNossoNumeroPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
  sNN:  String;
begin
  sNN := IntToStr(StrToInt(DisplayValue));
  DisplayValue  :=  sNN;
  if sOperacao <> 'I' then begin
    Exit;
  end;
  if TUtil.Empty(cxNossoNumero.Text) then begin
    Exit;
  end;
  if extravio.NNExiste(sNN) then begin
    sOperacao := '';
    if application.MessageBox('Extravio já Registrado! Deseja Visualizar?', 'Atenção!', MB_YESNO + MB_ICONQUESTION) = IDYES then begin
      if extravio.getObject(sNN,'NOSSONUMERO') then begin
        SetupForm;
        sOperacao :=  'S';
        Modo;
      end
      else begin
        Application.MessageBox('Erro ao tentar localizar dados de Extravio!','Erro!', MB_OK + MB_ICONERROR);
        TUtil.LimparFields(Self);
        sOperacao :=  '';
        Modo;
        Exit;
      end;
    end
    else begin
      TUtil.LimparFields(Self);
      sOperacao :=  'I';
      Modo;
      cxNossoNumero.SetFocus;
    end;
  end;
  if sOperacao = 'I' then begin
    if entrega.getObject(sNN,'NOSSONUMERO') then begin
      if entrega.Entregador <> 0 then begin
        cxEntregador.Text     :=  IntToStr(entrega.Entregador);
        entregador.Codigo     :=  StrToInt(cxEntregador.Text);
        cxNomeEntregador.Text :=  entregador.getField('NOM_FANTASIA','CODIGO');
      end;
    end;
  end;
end;

procedure TfrmExtravios.ListaDescricao;
begin
  with dm.qryPesquisa do begin
    Close;
    SQL.Clear;
    SQL.Text  :=  'SELECT DISTINCT DES_EXTRAVIO FROM TBEXTRAVIOS ORDER BY DES_EXTRAVIO';
    dm.ZConn.PingServer;
    Open;
    if not (IsEmpty) then begin
      First;
    end;
    cxDescricao.Properties.Items.Clear;
    while not (Eof) do begin
      cxDescricao.Properties.Items.Add(FieldByName('DES_EXTRAVIO').AsString);
      Next;
    end;
    cxDescricao.ItemIndex  :=  -1;
    Close;
    SQL.Clear;
  end;
end;

procedure TfrmExtravios.ListaEntregador;
var
  sId : String;
begin
  if Pos(sOperacao,'IU') = 0 then begin
    Exit;
  end;
  sId         :=  '';
  Screen.Cursor :=  crHourGlass;
  sId           :=  Trim(cxEntregador.Text);
  with dm.qryPesquisa do begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT COD_ENTREGADOR AS "Código", NOM_FANTASIA AS "Nome" ' +
                'FROM TBENTREGADORES ';
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
  frmListaApoio.Caption                                 :=  'Entregadores/Motoristas';
  Screen.Cursor                                         :=  crDefault;
  if frmListaApoio.ShowModal = mrOk then begin
    cxEntregador.Text :=  dm.qryPesquisa.Fields[0].AsString;
    cxEntregador.Refresh;
    cxNomeEntregador.Text   :=  dm.qryPesquisa.Fields[1].AsString;
    cxNomeentregador.Refresh;
  end;
  dm.tbApoio.Close;
  FreeAndNil(frmListaApoio);
end;

procedure TfrmExtravios.VisualizarDados;
begin
  if extravio.getObject(sExtravio,'CODIGO') then begin
    sOperacao :=  'S';
    Modo;
    SetupForm;
  end
  else begin
    Application.MessageBox('Erro ao localizar o registro de extravio!','Erro!',MB_OK + MB_ICONERROR);
    Exit;
  end;

end;

procedure TfrmExtravios.RetornaVerba(sCodigoEntregador: String);
var
  sGrupo  : String;
  iGrupo  : Integer;
  dVerba  : Double;
  iagente : Integer;
begin
  iGrupo  :=  0;
  dVerba  :=  0;
  sGrupo  :=  '';
  iagente :=  0;
  iGrupo  :=  entregador.Grupo;
  dVerba  :=  entregador.Verba;
  iagente :=  entregador.Agente;
  if iGrupo <> 0 then begin
    if dVerba = 0 then begin
      sGrupo  :=  IntToStr(iGrupo);
    end
    else begin
      sGrupo  := '';
    end;
  end;
  if dVerba = 0 then begin
    if (not TUtil.Empty(sGrupo)) then begin
      if dVerba = 0 then begin
        if verba.RetornaVerba(sGrupo,100) then begin
          dverba := verba.Verba;
        end;
      end;
    end
    else begin
      if agente.getObject(IntToStr(iagente),'CODIGO') then begin
        sGrupo  :=  IntToStr(agente.Grupo);
        if verba.RetornaVerba(sGrupo,100) then begin
          dverba := verba.Verba;
        end;
      end;
    end;
  end;
  cxVerba.Value :=  dVerba;
end;

end.
