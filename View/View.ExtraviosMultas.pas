unit View.ExtraviosMultas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, clBarrTFO, DAO.Entregas, DAO.Pesquisa, Model.Entregas, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter,
  cxClasses, dxLayoutContainer, dxLayoutControl, cxContainer, cxEdit, dxLayoutcxEditAdapters, cxLabel, cxTextEdit, cxMaskEdit, cxDropDownEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxCalendar, cxButtonEdit, DAO.Entregadores, Model.Entregadores, cxCurrencyEdit, cxMemo, cxCheckBox, Data.DB, dxmdaset, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, dxSkinsdxStatusBarPainter, dxStatusBar, cxProgressBar,
  System.Actions, Vcl.ActnList, dxLayoutControlAdapters, Vcl.Menus, Vcl.StdCtrls, cxButtons, DAO.ExtraviosMultas, Model.ExtraviosMultas, DAO.DebitosExtravios,
  Model.DebitosExtravios, Generics.Collections, Model.Usuarios, DAO.Usuarios, clLancamentos, clRestricoes, frxClass, clAgentes, clEntregador;

type
  Tview_ExtraviosMultas = class(TForm)
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    cxLabel1: TcxLabel;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutGroup1: TdxLayoutGroup;
    txtNossoNumero: TcxTextEdit;
    dxLayoutItem2: TdxLayoutItem;
    cboTipo: TcxComboBox;
    dxLayoutItem3: TdxLayoutItem;
    cboMotivo: TcxComboBox;
    dxLayoutItem4: TdxLayoutItem;
    datExtravio: TcxDateEdit;
    dxLayoutItem5: TdxLayoutItem;
    txtNomeEntregador: TcxTextEdit;
    dxLayoutItem7: TdxLayoutItem;
    txtCodigoEntregador: TcxButtonEdit;
    dxLayoutItem6: TdxLayoutItem;
    dxLayoutGroup2: TdxLayoutGroup;
    dblValorProduto: TcxCurrencyEdit;
    dxLayoutItem8: TdxLayoutItem;
    dblMulta: TcxCurrencyEdit;
    dxLayoutItem9: TdxLayoutItem;
    dblVerba: TcxCurrencyEdit;
    dxLayoutItem10: TdxLayoutItem;
    dblTotalExtravio: TcxCurrencyEdit;
    dxLayoutItem11: TdxLayoutItem;
    dxLayoutGroup3: TdxLayoutGroup;
    dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
    cboCorrespondencia: TcxComboBox;
    dxLayoutItem12: TdxLayoutItem;
    cboRetorno: TcxComboBox;
    dxLayoutItem13: TdxLayoutItem;
    memObservacoes: TcxMemo;
    dxLayoutItem14: TdxLayoutItem;
    chkRestricao: TcxCheckBox;
    dxLayoutItem15: TdxLayoutItem;
    dxLayoutGroup4: TdxLayoutGroup;
    chkFranquia: TcxCheckBox;
    dxLayoutItem16: TdxLayoutItem;
    dblValorDebitado: TcxCurrencyEdit;
    dxLayoutItem17: TdxLayoutItem;
    datDebitoFranquia: TcxDateEdit;
    dxLayoutItem18: TdxLayoutItem;
    sbExtravios: TdxStatusBar;
    dxLayoutItem20: TdxLayoutItem;
    sbExtraviosContainer1: TdxStatusBarContainerControl;
    pbExtravios: TcxProgressBar;
    aclExtravios: TActionList;
    actIncluir: TAction;
    actEstornar: TAction;
    actEditar: TAction;
    actPesquisar: TAction;
    actFiltrar: TAction;
    actCancelar: TAction;
    actImportar: TAction;
    actGravar: TAction;
    actFinalizar: TAction;
    actFechar: TAction;
    cxButton1: TcxButton;
    dxLayoutItem21: TdxLayoutItem;
    cxButton2: TcxButton;
    dxLayoutItem22: TdxLayoutItem;
    dxLayoutAutoCreatedGroup2: TdxLayoutAutoCreatedGroup;
    cxButton3: TcxButton;
    dxLayoutItem23: TdxLayoutItem;
    cxButton4: TcxButton;
    dxLayoutItem24: TdxLayoutItem;
    cxButton5: TcxButton;
    dxLayoutItem25: TdxLayoutItem;
    cxButton6: TcxButton;
    dxLayoutItem26: TdxLayoutItem;
    cxButton7: TcxButton;
    dxLayoutItem27: TdxLayoutItem;
    cxButton8: TcxButton;
    dxLayoutItem28: TdxLayoutItem;
    cxButton9: TcxButton;
    dxLayoutItem29: TdxLayoutItem;
    cxButton10: TcxButton;
    dxLayoutItem30: TdxLayoutItem;
    actPesquisaEntregador: TAction;
    actDeclaracao: TAction;
    frxDeclaracao: TfrxReport;
    pbPercentual: TcxProgressBar;
    dxLayoutItem19: TdxLayoutItem;
    procedure actFecharExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actIncluirExecute(Sender: TObject);
    procedure actPesquisarExecute(Sender: TObject);
    procedure actPesquisaEntregadorExecute(Sender: TObject);
    procedure actFiltrarExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actEstornarExecute(Sender: TObject);
    procedure actGravarExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure txtNossoNumeroPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure actDeclaracaoExecute(Sender: TObject);
    procedure dblValorProdutoPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure dblMultaPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure dblVerbaPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure actFinalizarExecute(Sender: TObject);
    procedure cboTipoPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
  private
    { Private declarations }
    procedure Modo(iModo: Integer);
    procedure PopulaCampos(iID: Integer);
    procedure BloqueiaCampos(bFlag: Boolean);
    procedure LimpaCampos;
    procedure PesquisaEntregador;
    procedure Filtro;
    procedure PesquisaExtravios(sFiltro: String);
    procedure Estornar;
    procedure Gravar;
    function ValidarDados(): Boolean;
    procedure SomaExtravio;
    procedure Finalizar;
    procedure ImprimirDeclaracao;
    procedure LocalizaEntrega(sNN: String);
  public
    { Public declarations }
  end;

var
  view_ExtraviosMultas: Tview_ExtraviosMultas;
  usuario: TUsuarios;
  usuarios: TObjectList<TUsuarios>;
  usuarioDAO: TUsuariosDAO;
  extravio : TExtraviosMultas;
  extravioDAO : TExtraviosMultasDAO;
  extravios : TObjectList<TExtraviosMultas>;
  debito: TDebitosExtravios;
  debitoDAO : TDebitosExtraviosDAO;
  debitos : TObjectList<TDebitosExtravios>;
  entregador : TEntregadores;
  entregadorDAO : TEntregadoresDAO;
  entregadores : TObjectList<TEntregadores>;
  entrega : TEntregas;
  entregaDAO : TEntregasDAO;
  entregas : TObjectList<TEntregas>;
  iStatusModo: Integer;
  iExtravio: Integer;
  bFiltro: Boolean;
  sAgente : String;
  sEntregador: String;
  sCPF: String;
implementation

{$R *.dfm}

uses  clUtil, Global.Parametros, udm, View.PesquisaExtravios, ufrmFiltro, ufrmAutorizacao, uGlobais, ufrmImpressao, ufrmPesquisarPessoas;

procedure Tview_ExtraviosMultas.actCancelarExecute(Sender: TObject);
begin
  Modo(0);
  LimpaCampos;
  BloqueiaCampos(True);
end;

procedure Tview_ExtraviosMultas.actDeclaracaoExecute(Sender: TObject);
begin
  ImprimirDeclaracao;
end;

procedure Tview_ExtraviosMultas.actEditarExecute(Sender: TObject);
begin
  if iStatusModo = 4 then
  begin
    if chkRestricao.Checked  then
    begin
      Application.MessageBox('Extravio/Multa finalizado! Edição não permitida.', 'Atenção', MB_OK + MB_ICONWARNING);
      Exit;
    end;
    Modo(5);
    BloqueiaCampos(False);
    txtNossoNumero.Properties.ReadOnly := True;
  end;
end;

procedure Tview_ExtraviosMultas.actEstornarExecute(Sender: TObject);
begin
  Estornar;
end;

procedure Tview_ExtraviosMultas.actFecharExecute(Sender: TObject);
begin
    Perform(WM_CLOSE, 0, 0);
end;

procedure Tview_ExtraviosMultas.Filtro;
var
  i: Integer;
  sFiltro: String;
begin
  try
    if not Assigned(frmFiltro) then
    begin
      frmFiltro := TfrmFiltro.Create(Application);
    end;
    for i := 1 to 11 do
    begin
      frmFiltro.slCampos.Add(dm.mtbExtravios.Fields[i].DisplayLabel);
      frmFiltro.slSQL.Add(dm.mtbExtravios.Fields[i].FieldName);
      case i of
        1: frmFiltro.slValores.Add('Integer');
        2: frmFiltro.slValores.Add('String');
        3: frmFiltro.slValores.Add('String');
        4: frmFiltro.slValores.Add('Integer');
        5: frmFiltro.slValores.Add('Float');
        6: frmFiltro.slValores.Add('DateTime');
        7: frmFiltro.slValores.Add('Float');
        8: frmFiltro.slValores.Add('Float');
        9: frmFiltro.slValores.Add('Float');
        10: frmFiltro.slValores.Add('String');
        11: frmFiltro.slValores.Add('Integer');
      end;
    end;
    if frmFiltro.ShowModal = mrCancel then
    begin
      sFiltro := '';
      Exit;
    end;
    bFiltro := True;
    i := 0;
    for i := 0 to frmFiltro.slSQLFil.Count - 1 do
    begin
      sFiltro := sFiltro + frmFiltro.slSQLFil[i];
    end;
    PesquisaExtravios(sFiltro);
  finally
    FreeAndNil(frmFiltro);
  end;
end;

procedure Tview_ExtraviosMultas.Finalizar;
var
  extravioTMP: TExtraviosMultas;
  pParam: array of Variant;
  iAgente: Integer;
  lLog : TStringList;
begin
  try
    if Application.MessageBox('Confirma finalizar este Extravio/Multa?', 'Finalizar', MB_YESNO + MB_ICONQUESTION) = IDNO then Exit;
    entregadorDAO := TEntregadoresDAO.Create;
    SetLength(pParam,1);
    pParam[0] := iExtravio;
    extravios := extravioDAO.FindExtravio('CODIGO', pParam);
    Finalize(pParam);
    entregadores := TObjectList<TEntregadores>.Create;
    Finalize(pParam);
    lLog := TStringList.Create;
    for extravioTMP in extravios do
    begin
      lLog.Text := extravioTMP.Obs;
      lLog.Add('Extravio finalizado em ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now()) + ' por ' + Global.Parametros.pNameUser);
      extravioTMP.Restricao := 'S';
      extravioTMP.Percentual := 0;
      extravioTMP.Executor := uGlobais.sUsuario;
      extravioTMP.Manutencao := Now();
      extravioTMP.Agente := 0;
      SetLength(pParam,1);
      pParam[0] := extravioTMP.Entregador;
      entregadores := entregadorDAO.FindEntregador('AGENTE', pParam);
      Finalize(pParam);
      if entregadores.Count > 0 then
      begin
        extravioTMP.Agente := entregadores[0].Agente;
      end;
      extravioTMP.Obs := lLog.Text;
      extravioTMP.Executor := Global.Parametros.pUser_Name;
      extravioTMP.Manutencao := Now();
      if not extravioDAO.Update(extravioTMP) then
      begin
        application.MessageBox('Erro ao finalizar o extravio!', 'Erro', MB_OK + MB_ICONERROR);
        Exit;
      end;
      application.MessageBox(PChar('Extravio/Multa NN ' + extravioTMP.NN + ' finalizado com sucesso.'), 'Finalizar', MB_OK + MB_ICONINFORMATION);
    end;
    Modo(0);
    LimpaCampos;
    BloqueiaCampos(True);
  finally
    extravioDAO.Free;
    entregadorDAO.Free;
  end;
end;

procedure Tview_ExtraviosMultas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  view_ExtraviosMultas := Nil;
end;

procedure Tview_ExtraviosMultas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure Tview_ExtraviosMultas.FormShow(Sender: TObject);
begin
  Modo(0);
  LimpaCampos;
  BloqueiaCampos(True);
end;

procedure Tview_ExtraviosMultas.Gravar;
var
  pParam: array of Variant;
begin
  try
    SetLength(pParam,1);
    entregadorDAO := TEntregadoresDAO.Create;
    extravioDAO := TExtraviosMultasDAO.Create;
    if not ValidarDados() then Exit;
    if application.MessageBox('Confirma gravar os dados?', 'Gravar', MB_YESNO + MB_ICONQUESTION) = IDNO then Exit;
    extravio := TExtraviosMultas.Create;
    extravio.ID := iextravio;
    extravio.NN := FormatFloat('0',StrToFloatDef(txtNossoNumero.Text,0));
    extravio.Tipo := cboTipo.ItemIndex;
    extravio.Descricao := cboMotivo.Text;
    extravio.Data := datExtravio.Date;
    extravio.Entregador := txtCodigoEntregador.EditValue;
    extravio.ValorProduto := dblValorProduto.Value;
    extravio.Multa := dblMulta.Value;
    extravio.Verba := dblVerba.Value;
    dblTotalExtravio.Value := dblMulta.Value + dblVerba.Value;
    extravio.Total := dblTotalExtravio.Value;
    extravio.Restricao := 'N';
    extravio.EnvioCorrespondencia := cboCorrespondencia.Text;
    extravio.RetornoCorrespondencia := cboRetorno.Text;
    extravio.Obs := memObservacoes.Text;
    extravio.Extrato := chkFranquia.EditValue;
    extravio.ValorFranquia := dblValorDebitado.Value;
    extravio.Percentual := pbPercentual.Position;
    extravio.Executor := uGlobais.sUsuario;
    extravio.Manutencao := Now();
    entregadores := TObjectList<TEntregadores>.Create;
    pParam[0] := extravio.Entregador;
    entregadores := entregadorDAO.FindEntregador('ENTREGADOR', pParam);
    Finalize(pParam);
    if entregadores.Count > 0 then
    begin
      extravio.Agente := entregadores[0].Agente;
    end
    else
    begin
      extravio.Agente := 1;
    end;
    if iExtravio = 0 then
    begin
      if not extravioDAO.Insert(extravio) then
      begin
        Application.MessageBox('Erro ao incluir o extravio!', 'Atenção', MB_OK + MB_ICONERROR);
        Exit;
      end;
    end
    else
    begin
      if not extravioDAO.Update(extravio) then
      begin
        Application.MessageBox('Erro ao alterar o extravio!', 'Atenção', MB_OK + MB_ICONERROR);
        Exit;
      end;
    end;
    Application.MessageBox('Gravação realizada com sucesso!', 'Atenção', MB_OK + MB_ICONINFORMATION);
    Modo(4);
    BloqueiaCampos(True);
finally
  entregadorDAO.Free;
  extravioDAO.Free;
 end;
end;

procedure Tview_ExtraviosMultas.ImprimirDeclaracao;
var
  sImpressao: String;
  sData : String;
begin
  with frxDeclaracao do begin
    if not Assigned(frmImpressao) then begin
      frmImpressao := TfrmImpressao.Create(Application);
    end;
    frmImpressao.cxLabel1.Caption := 'DECLARAÇÃO';
    frmImpressao.cxArquivo.Text := ExtractFilePath(Application.ExeName) + 'Reports\frxDeclaracaoExtravioExpressas.fr3';
    if frmImpressao.ShowModal <> mrOk then
    begin
      FreeAndNil(frmImpressao);
      Exit;
    end
    else begin
      if (not FileExists(frmImpressao.cxArquivo.Text)) then begin
        Application.MessageBox(PChar('Arquivo ' + frmImpressao.cxArquivo.Text +
                               ' não foi encontrado!'), 'Atenção', MB_OK + MB_ICONWARNING);
        Exit;
      end;
    end;
    LoadFromFile(frmImpressao.cxArquivo.Text);
    sImpressao := 'Impresso pelo ' + Application.Title + ' Versão ' + TUtil.VersaoExe + ' por ' + uGlobais.sNomeUsuario +
                  ' em ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now);
    if sEntregador = 'NONE' then
    begin
      sEntregador := txtCodigoEntregador.Text + '-' + txtNomeEntregador.Text;
    end
    else
    begin
      sEntregador := sEntregador + ' (' +  txtNomeEntregador.Text+ ')';
    end;
    sData := FormatDateTime('dddd, dd " de " mmmm " de " yyyy ', Now);
    Variables.Items[Variables.IndexOf('vAgente')].Value :=  QuotedStr(sAgente);
    Variables.Items[Variables.IndexOf('vEntregador')].Value :=  QuotedStr(sEntregador);
    Variables.Items[Variables.IndexOf('vNN')].Value :=  QuotedStr(txtNossoNumero.Text);
    Variables.Items[Variables.IndexOf('vValor')].Value :=  QuotedStr(dblValorProduto.Text);
    Variables.Items[Variables.IndexOf('vMulta')].Value :=  QuotedStr(dblMulta.Text);
    Variables.Items[Variables.IndexOf('vVerba')].Value :=  QuotedStr(dblVerba.Text);
    Variables.Items[Variables.IndexOf('vData')].Value :=  QuotedStr(sData);
    Variables.Items[Variables.IndexOf('vCPF')].Value :=  QuotedStr(sCPF);
    Variables.Items[Variables.IndexOf('vImpressao')].Value :=  QuotedStr(sImpressao);
    FreeAndNil(frmImpressao);
    if (not uGlobais.bFlagImprimir) then
    begin
      ShowReport(True);
    end
    else
    begin
      Print;
    end;
  end;
end;

procedure Tview_ExtraviosMultas.LimpaCampos;
begin
  txtNossoNumero.Text := '';
  cboTipo.ItemIndex := -1;
  cboMotivo.ItemIndex := -1;
  datExtravio.Clear;
  txtCodigoEntregador.EditValue := 0;
  txtNomeEntregador.Text := '';
  dblValorProduto.Value := 0;
  dblMulta.Value := 0;
  dblVerba.Value := 0;
  dblTotalExtravio.Value := 0;
  chkRestricao.EditValue := 'N';
  cboCorrespondencia.Text := '';
  cboRetorno.Text := '';
  memObservacoes.Text := '';
  chkFranquia.EditValue := '';
  dblValorDebitado.Value := 0;
  datDebitoFranquia.Clear;
  iExtravio := 0;
  sAgente := '';
  pbPercentual.Position := 0;
end;

procedure Tview_ExtraviosMultas.LocalizaEntrega(sNN: String);
var
  entregaTMP: TEntregas;
  pParam: array of Variant;
  iId: Integer;
  agentes : TAgente;
begin
  try
    // procura extravio;
    Setlength(pParam,1);
    sNN := FormatFloat('0',StrToFloatDef(sNN,0));
    extravios := TObjectList<TExtraviosMultas>.Create;
    extravioDAO := TExtraviosMultasDAO.Create;
    pParam[0] := 'WHERE NUM_NOSSONUMERO = ' +  sNN + ' AND DOM_RESTRICAO <> ' + QuotedStr('E');
    extravios := extravioDAO.FindExtravio('FILTRO', pParam);
    Finalize(pParam);
    if extravios.Count > 0  then
    begin
      if Application.MessageBox('Extravio já cadastrado! Deseja visualizar?', 'Atenção', MB_YESNO + MB_ICONQUESTION) = IDYES then
      begin
        extravioDAO.Free;
        PopulaCampos(extravios[0].ID);
        Modo(4);
        Exit;
      end
      else
      begin
        extravioDAO.Free;
        Modo(0);
        LimpaCampos;
        BloqueiaCampos(True);
        Exit;
      end;
    end
    else
    begin
      extravioDAO.Free;
    end;

    // procura entrega
    Setlength(pParam,1);
    entregas := TObjectList<TEntregas>.Create;
    entregaDAO := TEntregasDAO.Create;
    pParam[0] := sNN;
    entregas := entregaDAO.FindEntregaNN(pParam);
    Finalize(pParam);
    for entregaTMP in entregas do
    begin
      agentes := TAgente.Create;
      entregadorDAO := TEntregadoresDAO.Create;
      entregadores := TObjectList<TEntregadores>.Create();
      iExtravio := 0;
      txtNossoNumero.Text := entregaTMP.NN;
      cboTipo.ItemIndex := -1;
      cboMotivo.Text := '';
      datExtravio.Clear;
      txtCodigoEntregador.EditValue := entregaTMP.Entregador;
      SetLength(pParam,1);
      pParam[0] := entregaTMP.Entregador;
      entregadores :=  entregadorDAO.FindEntregador('ENTREGADOR',pParam);
      Finalize(pParam);
      entregadorDAO.Free;
      sAgente := 'NONE';
      txtNomeEntregador.Text := '';
      if entregadores.Count > 0 then
      begin
        txtNomeEntregador.Text := entregadores[0].Fantasia;
        if agentes.getObject(IntToStr(entregadores[0].Agente), 'CODIGO') then
        begin
          sAgente := agentes.Fantasia;
        end;
        agentes.Free;
      end;
      if cboTipo.ItemIndex <> 2 then
      begin
        dblValorProduto.Value := entregaTMP.ValorProduto;
        dblVerba.Value := entregaTMP.VerbaEntregador;
      end
      else
      begin
        dblValorProduto.Value := 0;
        dblVerba.Value := 0;
      end;
      dblMulta.Value := 0;
      dblTotalExtravio.Value := entregaTMP.ValorProduto + entregaTMP.VerbaEntregador;
      chkRestricao.EditValue := 'N';
      cboCorrespondencia.Text := '';
      cboRetorno.Text := '';
      memObservacoes.Text := '';
      chkFranquia.EditValue := 'N';
      dblValorDebitado.Value := 0;
      datDebitoFranquia.Clear;
      pbPercentual.Position := 0;
    end;
  finally
    entregaDAO.Free;
  end;
end;

procedure Tview_ExtraviosMultas.actFiltrarExecute(Sender: TObject);
begin
  Filtro;
end;

procedure Tview_ExtraviosMultas.actFinalizarExecute(Sender: TObject);
begin
  if chkRestricao.Checked then Exit;
  Finalizar;

end;

procedure Tview_ExtraviosMultas.actGravarExecute(Sender: TObject);
begin
  Gravar;
end;

procedure Tview_ExtraviosMultas.actIncluirExecute(Sender: TObject);
begin
  LimpaCampos;
  Modo(1);
  BloqueiaCampos(False);
  iExtravio := 0;
  txtNossoNumero.SetFocus;
end;

procedure Tview_ExtraviosMultas.actPesquisaEntregadorExecute(Sender: TObject);
begin
  PesquisaEntregador
end;

procedure Tview_ExtraviosMultas.actPesquisarExecute(Sender: TObject);
begin
  try
    bFiltro := False;
    dm.mtbExtravios.Close;
    dm.mtbExtravios.Open;
    if not Assigned(view_PesquisaExtravios) then
    begin
      view_PesquisaExtravios := Tview_PesquisaExtravios.Create(Application);
    end;
    view_PesquisaExtravios.sFiltro := '';
    view_PesquisaExtravios.actFinalizar.Visible := True;
    if view_PesquisaExtravios.ShowModal = mrOK then
    begin
      PopulaCampos(dm.mtbExtraviosCOD_EXTRAVIO.AsInteger);
    end;
  finally
    FreeAndNil(view_PesquisaExtravios);
    if dm.mtbExtravios.IsEmpty then dm.mtbExtravios.Close;
  end;
end;

procedure Tview_ExtraviosMultas.BloqueiaCampos(bFlag: Boolean);
begin
  txtNossoNumero.Properties.ReadOnly := bFlag;
  cboTipo.Properties.ReadOnly := bFlag;
  cboMotivo.Properties.ReadOnly := bFlag;
  datExtravio.Properties.ReadOnly := bFlag;
  txtCodigoEntregador.Properties.ReadOnly := bFlag;
  dblValorProduto.Properties.ReadOnly := bFlag;
  dblMulta.Properties.ReadOnly :=  bFlag;
  dblVerba.Properties.ReadOnly := bFlag;
  cboCorrespondencia.Properties.ReadOnly := bFlag;;
  cboRetorno.Properties.ReadOnly := bFlag;;
  memObservacoes.Properties.ReadOnly := bFlag;
end;

procedure Tview_ExtraviosMultas.cboTipoPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if iStatusModo = 1 then
  begin
    LocalizaEntrega(txtNossoNumero.Text);
  end;
end;

procedure Tview_ExtraviosMultas.dblMultaPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  SomaExtravio;
end;

procedure Tview_ExtraviosMultas.dblValorProdutoPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  SomaExtravio;
end;

procedure Tview_ExtraviosMultas.dblVerbaPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  SomaExtravio;
end;

procedure Tview_ExtraviosMultas.Estornar;
var
  bFlagReembolso : Boolean;
  extravioTMP: TExtraviosMultas;
  pParam: array of Variant;
  dValor: Double;
  sObs: String;
  restricao : TRestricoes;
  lancamento: TLancamentos;
begin
  try
    if iStatusModo <> 4 then Exit;
    if chkRestricao.EditValue = 'E' then
    begin
      Application.MessageBox('Estorno já processado para este Extravio/Multa!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
    if chkFranquia.EditValue = 'S' then
    begin
      Application.MessageBox('Estorno recusado! Extravio já debitado da Franquia!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
    bFlagReembolso := False;
    dValor := 0;
    sObs := '';
    if Application.MessageBox('Estornar este Extravio/Multa?', 'Estornor', MB_YESNO + MB_ICONQUESTION) = IDNO then Exit;
    bFlagReembolso := (Application.MessageBox('Ressarcir débito efetuado?', 'Atenção', MB_YESNO + MB_ICONQUESTION) = IDYES);
    if chkRestricao.EditValue = 'N' then bFlagReembolso := False;

    extravios := TObjectList<TExtraviosMultas>.Create();
    extravioDAO := TExtraviosMultasDAO.Create();
    SetLength(pParam,1);
    pParam[0] := iExtravio;
    extravios := extravioDAO.FindExtravio('CODIGO', pParam);
    Finalize(pParam);
    for extravioTMP in extravios do
    begin
      sObs := extravioTMP.Obs;
      sObs := sObs + #13 + 'Estorno efetuado por ' + uGlobais.sNomeUsuario + ' em  ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now());
      if bFlagReembolso then
      begin
        dValor := (extravioTMP.Total * (extravioTMP.Percentual / 100));
        // Gerar ressarcimento;
        if restricao.getObject(IntToStr(extravioTMP.Entregador), 'ENTREGADOR') then
        begin
          if restricao.Valor > dValor then
          begin
            restricao.Valor := restricao.Valor - dValor;
            restricao.Debitar := restricao.Valor;
            dValor := 0;
          end
          else
          begin
            dValor := dValor - restricao.Valor;
            restricao.Valor := 0;
            restricao.Debitar := 0;
          end;
          if not restricao.Update() then
          begin
            Application.MessageBox('Erro ao gravar a restrição!', 'Erro', MB_OK + MB_ICONERROR);
            Exit;
          end;
          sObs := sObs + #13 + 'Valor debitado da restrição (R$ ' + FloatToStr(dValor) + ')';
        end;
        if dValor > 0 then
        begin
          lancamento.Codigo := 0;
          lancamento.Descricao := 'Ressarcimento debito extravio/multa NN' + extravioTMP.NN;
          lancamento.Data := Now();
          lancamento.Entregador := extravioTMP.Entregador;
          lancamento.Tipo := 'CREDITO';
          lancamento.Valor := dValor;
          lancamento.Descontado := 'N';
          lancamento.Desconto := 0;
          lancamento.Extrato := '';
          lancamento.Persistir := 'N';
          dValor := 0;
          if not restricao.Insert() then
          begin
            Application.MessageBox('Erro ao gravar o lançamento de crédito!', 'Erro', MB_OK + MB_ICONERROR);
            Exit;
          end;
          sObs := sObs + #13 + 'Lançamento de crédido de R$ ' + FloatToStr(dValor);
        end;
      end;
      extravioTMP.Restricao := 'E';
      extravioTMP.Obs := sObs;
      extravioTMP.Percentual := 100;
      if not extravioDAO.Update(extravioTMP) then
      begin
        Application.MessageBox('Erro ao gravar o estorno!', 'Erro', MB_OK + MB_ICONERROR);
        Exit;
      end;
    end;
  finally
    LimpaCampos;
    BloqueiaCampos(True);
    Modo(0);
    extravioDAO.Free;
    extravioTMP.Free;
  end;
end;

procedure Tview_ExtraviosMultas.Modo(iModo: Integer);
begin
  iStatusModo := iModo;
  if iModo = 0 then //(Stand By)
  begin
    actIncluir.Enabled := True;
    actPesquisar.Enabled := True;
    actFiltrar.Enabled := True;
    actEstornar.Enabled := False;
    actEditar.Enabled := False;
    actCancelar.Enabled := False;
    actDeclaracao.Enabled := False;
    actGravar.Enabled := False;
    actFinalizar.Enabled := False;
    actFechar.Enabled := True;
  end;
  if iModo = 1 then //(Incluir)
  begin
    actIncluir.Enabled := False;
    actPesquisar.Enabled := False;
    actFiltrar.Enabled := False;
    actEstornar.Enabled := False;
    actEditar.Enabled := False;
    actCancelar.Enabled := True;
    actDeclaracao.Enabled := False;
    actGravar.Enabled := True;
    actFinalizar.Enabled := False;
    actFechar.Enabled := True;
  end;
  if iModo = 2 then //(Pesquisar)
  begin
    actIncluir.Enabled := False;
    actPesquisar.Enabled := False;
    actFiltrar.Enabled := False;
    actEstornar.Enabled := False;
    actEditar.Enabled := False;
    actCancelar.Enabled := True;
    actDeclaracao.Enabled := False;
    actGravar.Enabled := False;
    actFinalizar.Enabled := False;
    actFechar.Enabled := True;
  end;
  if iModo = 3 then //(Filtrar)
  begin
    actIncluir.Enabled := False;
    actPesquisar.Enabled := False;
    actFiltrar.Enabled := False;
    actEstornar.Enabled := False;
    actEditar.Enabled := False;
    actCancelar.Enabled := True;
    actDeclaracao.Enabled := False;
    actGravar.Enabled := False;
    actFinalizar.Enabled := False;
    actFechar.Enabled := True;
  end;
  if iModo = 4 then //(Stand By pós retorno pesquisa/Filtro)
  begin
    actIncluir.Enabled := False;
    actPesquisar.Enabled := False;
    actFiltrar.Enabled := False;
    actEstornar.Enabled := True;
    actEditar.Enabled := True;
    actCancelar.Enabled := True;
    actDeclaracao.Enabled := True;
    actGravar.Enabled := True;
    actFinalizar.Enabled := True;
    actFechar.Enabled := True;
  end;
  if iModo = 5 then //(Editar)
  begin
    actIncluir.Enabled := False;
    actPesquisar.Enabled := False;
    actFiltrar.Enabled := False;
    actEstornar.Enabled := False;
    actEditar.Enabled := False;
    actCancelar.Enabled := True;
    actDeclaracao.Enabled := False;
    actGravar.Enabled := True;
    actFinalizar.Enabled := False;
    actFechar.Enabled := True;
  end;
  if iModo = 6 then //(Importar)
  begin
    actIncluir.Enabled := False;
    actPesquisar.Enabled := False;
    actFiltrar.Enabled := False;
    actEstornar.Enabled := False;
    actEditar.Enabled := False;
    actCancelar.Enabled := False;
    actImportar.Enabled := False;
    actGravar.Enabled := False;
    actFinalizar.Enabled := False;
    actFechar.Enabled := True;
  end;
end;

procedure Tview_ExtraviosMultas.PesquisaEntregador;
var
  agentes : TAgente;
  i,x,y : Integer;
  sItem: String;
begin
  try
    agentes := TAgente.Create;
    if dm.qryCodigosEntregadores.Active then
    begin
      dm.qryCodigosEntregadores.Close;
    end;
    x := 0;
    sItem := '';
    if not Assigned(frmPesquisarPessoas) then
    begin
      frmPesquisarPessoas := TfrmPesquisarPessoas.Create(Application);
    end;
    frmPesquisarPessoas.Caption := frmPesquisarPessoas.Caption + ' de Entregadores';
    frmPesquisarPessoas.cboCampo.Clear;
    for i := 0 to dm.qryCodigosEntregadores.FieldCount - 1 do
    begin
      frmPesquisarPessoas.tvPesquisa.ClearItems;
      if dm.qryCodigosEntregadores.Fields[i].Tag = 1 then
      begin
        x := frmPesquisarPessoas.cboCampo.Properties.Items.Add(Trim(dm.qryCodigosEntregadores.Fields[i].DisplayLabel));
        frmPesquisarPessoas.lListaCampos.Add(Trim(dm.qryCodigosEntregadores.Fields[i].FieldName));
      end;
      frmPesquisarPessoas.cboCampo.ItemIndex := 1;
    end;
    frmPesquisarPessoas.qryPesquisa.SQL.Text := 'SELECT COD_CADASTRO, COD_ENTREGADOR, NOM_FANTASIA, COD_AGENTE FROM tbcodigosentregadores';
    if frmPesquisarPessoas.ShowModal = mrOk then
    begin
      txtCodigoEntregador.Text := frmPesquisarPessoas.qryPesquisa.FieldByName('COD_ENTREGADOR').AsString;
      txtNomeEntregador.Text := frmPesquisarPessoas.qryPesquisa.FieldByName('NOM_FANTASIA').AsString;
      if agentes.getObject(frmPesquisarPessoas.qryPesquisa.FieldByName('COD_AGENTE').AsString, 'AGENTE') then
      begin
        sAgente := agentes.Fantasia;
      end
      else
      begin
        sAgente := 'NONE';
      end;
    end;
  finally
    agentes.Free;
    frmPesquisarPessoas.qryPesquisa.Close;
    frmPesquisarPessoas.qryPesquisa.SQL.Clear;
    FreeAndNil(frmPesquisarPessoas);
  end;
end;

procedure Tview_ExtraviosMultas.PesquisaExtravios(sFiltro: String);
begin
  if not Assigned(view_PesquisaExtravios) then
  begin
    view_PesquisaExtravios := Tview_PesquisaExtravios.Create(Application);
  end;
  if bFiltro then
  begin
    view_PesquisaExtravios.sFiltro := sFiltro;
  end;
  if view_PesquisaExtravios.ShowModal = mrOK then
  begin
     PopulaCampos(dm.mtbExtraviosCOD_EXTRAVIO.AsInteger);
  end;
end;

procedure Tview_ExtraviosMultas.PopulaCampos(iID: Integer);
var
  extravioTMP: TExtraviosMultas;
  pParam: array of Variant;
  agentes : TAgente;
  cadastro: TEntregador;
begin
  try
    agentes := TAgente.Create;
    cadastro := TEntregador.Create;
    SetLength(pParam,1);
    extravios := TObjectList<TExtraviosMultas>.Create;
    extravioDAO := TExtraviosMultasDAO.Create;
    entregadorDAO := TEntregadoresDAO.Create;
    pParam[0] := iID;
    extravios := extravioDAO.FindExtravio('CODIGO', pParam);
    Finalize(pParam);
    if extravios.Count = 0 then
    begin
      Modo(0);
      BloqueiaCampos(True);
      LimpaCampos;
      Exit;
    end;
    Modo(4);
    for extravioTMP in extravios do
    begin
      SetLength(pParam,1);
      pParam[0] := extravioTMP.Entregador;
      entregadores :=  entregadorDAO.FindEntregador('ENTREGADOR',pParam);
      Finalize(pParam);
      txtNomeEntregador.Text := entregadores[0].Fantasia;
      if agentes.getObject(IntToStr(entregadores[0].Agente), 'CODIGO') then
      begin
        sAgente := agentes.Fantasia;
      end
      else
      begin
        sAgente := 'NONE';
      end;
      if cadastro.getObject(IntToStr(entregadores[0].Cadastro), 'CADASTRO') then
      begin
        sEntregador := cadastro.Nome;
        sCPF := 'CPF: ' + cadastro.CPF;
      end
      else
      begin
        sEntregador := 'NONE';
        sCPF := '';
      end;
      iExtravio := extravioTMP.ID;
      txtNossoNumero.Text := extravioTMP.NN;
      cboTipo.ItemIndex := extravioTMP.Tipo;
      cboMotivo.Text := extravioTMP.Descricao;
      datExtravio.Date := extravioTMP.Data;
      txtCodigoEntregador.EditValue := extravioTMP.Entregador;
      dblValorProduto.Value := extravioTMP.ValorProduto;
      dblMulta.Value := extravioTMP.Multa;
      dblVerba.Value := extravioTMP.Verba;
      dblTotalExtravio.Value := extravioTMP.ValorProduto + extravioTMP.Multa + extravioTMP.Verba;
      chkRestricao.EditValue := extravioTMP.Restricao;
      cboCorrespondencia.Text := extravioTMP.EnvioCorrespondencia;
      cboRetorno.Text := extravioTMP.RetornoCorrespondencia;
      memObservacoes.Text := extravioTMP.Obs;
      chkFranquia.EditValue := extravioTMP.Extrato;
      dblValorDebitado.Value := extravioTMP.ValorFranquia;
      if extravioTMP.DataFranquia > StrToDate('30/12/1899') then datDebitoFranquia.Date := extravioTMP.DataFranquia;
      pbPercentual.Position := extravioTMP.Percentual;
    end;
  finally
    cadastro.Free;
    agentes.Free;
    entregadorDAO.Free;
    extravioDAO.Free;
  end;
end;

procedure Tview_ExtraviosMultas.SomaExtravio;
begin
  dblTotalExtravio.Value := dblValorProduto.Value + dblMulta.Value + dblVerba.Value;
end;

procedure Tview_ExtraviosMultas.txtNossoNumeroPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if DisplayValue = '' then Exit;
  if iStatusModo = 1 then
  begin
    LocalizaEntrega(txtNossoNumero.Text);
  end;
end;

function Tview_ExtraviosMultas.ValidarDados: Boolean;
begin
  Result := False;
  if txtNossoNumero.Text = '' then
  begin
    Application.MessageBox('Informe o nosso número!', 'Atenção', MB_OK + MB_ICONASTERISK);
    Exit;
  end;
  if cboTipo.Text = '' then
  begin
    Application.MessageBox('Informe o tipo!', 'Atenção', MB_OK + MB_ICONASTERISK);
    Exit;
  end;
  if datExtravio.Text = '' then
  begin
    Application.MessageBox('Informe a data do extravio/multa!', 'Atenção', MB_OK + MB_ICONASTERISK);
    Exit;
  end;
  if txtCodigoEntregador.EditingValue = 0 then
  begin
    Application.MessageBox('Informe o entregador!', 'Atenção', MB_OK + MB_ICONASTERISK);
    Exit;
  end;
  if cboTipo.ItemIndex <> 2 then
  begin
    if dblValorProduto.Value = 0 then
    begin
      Application.MessageBox('Informe o valor do produto!', 'Atenção', MB_OK + MB_ICONASTERISK);
      Exit;
    end;
  end
  else
  begin
    if dblMulta.Value = 0 then
    begin
      Application.MessageBox('Informe o valor da multa!', 'Atenção', MB_OK + MB_ICONASTERISK);
      Exit;
    end;
  end;
  if cboCorrespondencia.Text = '' then
  begin
    Application.MessageBox('Informe o envio da correspondência!', 'Atenção', MB_OK + MB_ICONASTERISK);
    Exit;
  end;
  if cboMotivo.Text = '' then
  begin
    Application.MessageBox('Informe o motivo/descrição do extravio/multa!', 'Atenção', MB_OK + MB_ICONASTERISK);
    Exit;
  end;
  result := True;
end;

end.
