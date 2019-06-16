unit View.FechamentoExpressas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DAO.FechamentosExpressas, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxClasses, dxLayoutContainer, dxLayoutControl, cxContainer, cxEdit, dxLayoutcxEditAdapters, cxLabel,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, System.Actions, Vcl.ActnList, dxLayoutControlAdapters, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  cxCheckBox, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, dxmdaset, cxImageComboBox, cxButtonEdit, cxBlobEdit, dxSkinsdxStatusBarPainter, dxStatusBar, cxProgressBar, Thread.ProcessaFechamento, cxCurrencyEdit,
  Model.FechamentoExpressas, Generics.Collections, cxGridExportLink, ShellAPI, Model.ExtratosExpressas, DAO.ExtratosExpressas, Model.ParcelamentoRestricao,
  DAO.ParcelamentoRestricao, clLancamentos, Model.ExtraviosMultas, DAO.ExtraviosMultas, clRestricoes, Model.Entregadores, DAO.Entregadores, Thread.CancelaFechamentoExtressas,
  Thread.EncerraFechamento, dxActivityIndicator, cxDBLookupComboBox, clBancos;

type
  Tview_FechamentoExpressas = class(TForm)
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    cxLabel1: TcxLabel;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutGroup1: TdxLayoutGroup;
    datInicio: TcxDateEdit;
    dxLayoutItem2: TdxLayoutItem;
    datTermino: TcxDateEdit;
    dxLayoutItem3: TdxLayoutItem;
    aclFechamento: TActionList;
    actProcessar: TAction;
    actReprocessar: TAction;
    btnPesquisar: TcxButton;
    dxLayoutItem4: TdxLayoutItem;
    actCancelar: TAction;
    actEncerrar: TAction;
    actReabrir: TAction;
    btnCancelar: TcxButton;
    dxLayoutItem6: TdxLayoutItem;
    btnEncerrar: TcxButton;
    dxLayoutItem7: TdxLayoutItem;
    dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
    actFechar: TAction;
    cxButton1: TcxButton;
    dxLayoutItem9: TdxLayoutItem;
    chkRestricoes: TcxCheckBox;
    dxLayoutItem10: TdxLayoutItem;
    chkLancamentos: TcxCheckBox;
    dxLayoutItem11: TdxLayoutItem;
    chkSLA: TcxCheckBox;
    dxLayoutItem12: TdxLayoutItem;
    tvFechamento: TcxGridDBTableView;
    lvFechamento: TcxGridLevel;
    grdFechamento: TcxGrid;
    dxLayoutItem13: TdxLayoutItem;
    mtbFechamento: TdxMemData;
    mtbFechamentoID_FECHAMENTO: TIntegerField;
    mtbFechamentoDAT_INICIO: TDateField;
    mtbFechamentoDAT_FINAL: TDateField;
    mtbFechamentoCOD_TIPO: TIntegerField;
    mtbFechamentoCOD_EXPRESSA: TIntegerField;
    mtbFechamentoVAL_SALDO_RESTRICAO: TFloatField;
    mtbFechamentoVAL_RESTRICAO: TFloatField;
    mtbFechamentoVAL_EXTRAVIOS: TFloatField;
    mtbFechamentoVAL_CREDITOS: TFloatField;
    mtbFechamentoVAL_DEBITOS: TFloatField;
    mtbFechamentoVAL_FINANCIADO: TFloatField;
    mtbFechamentoVAL_TOTAL_DEBITOS: TFloatField;
    mtbFechamentoVAL_TOTAL_CREDITOS: TFloatField;
    mtbFechamentoVAL_TOTAL_GERAL: TFloatField;
    mtbFechamentoDES_LOG: TMemoField;
    dsFechamento: TDataSource;
    tvFechamentoRecId: TcxGridDBColumn;
    tvFechamentoID_FECHAMENTO: TcxGridDBColumn;
    tvFechamentoDAT_INICIO: TcxGridDBColumn;
    tvFechamentoDAT_FINAL: TcxGridDBColumn;
    tvFechamentoCOD_TIPO: TcxGridDBColumn;
    tvFechamentoCOD_EXPRESSA: TcxGridDBColumn;
    tvFechamentoVAL_SALDO_RESTRICAO: TcxGridDBColumn;
    tvFechamentoVAL_RESTRICAO: TcxGridDBColumn;
    tvFechamentoVAL_EXTRAVIOS: TcxGridDBColumn;
    tvFechamentoVAL_CREDITOS: TcxGridDBColumn;
    tvFechamentoVAL_DEBITOS: TcxGridDBColumn;
    tvFechamentoVAL_FINANCIADO: TcxGridDBColumn;
    tvFechamentoVAL_TOTAL_DEBITOS: TcxGridDBColumn;
    tvFechamentoVAL_TOTAL_CREDITOS: TcxGridDBColumn;
    tvFechamentoVAL_TOTAL_GERAL: TcxGridDBColumn;
    tvFechamentoDES_LOG: TcxGridDBColumn;
    mtbFechamentoVAL_PRODUCAO: TFloatField;
    mtbFechamentoNOM_EXPRESSA: TStringField;
    tvFechamentoVAL_PRODUCAO: TcxGridDBColumn;
    tvFechamentoNOM_EXPRESSA: TcxGridDBColumn;
    mtbFechamentoDOM_FECHADO: TIntegerField;
    sbFechamento: TdxStatusBar;
    dxLayoutItem14: TdxLayoutItem;
    dxStatusBar1Container1: TdxStatusBarContainerControl;
    pbFechamento: TcxProgressBar;
    mtbFechamentoDES_EXTRATOS: TMemoField;
    mtbFechamentoTOT_ENTREGAS: TIntegerField;
    tvFechamentoTOT_ENTREGAS: TcxGridDBColumn;
    actExtrato: TAction;
    SaveDialog: TSaveDialog;
    ppmFechamento: TPopupMenu;
    Extrato1: TMenuItem;
    actExtravios: TAction;
    Extravios1: TMenuItem;
    actLancamentos: TAction;
    Lanamentos1: TMenuItem;
    mtbFechamentoVAL_VERBA_ENTREGADOR: TFloatField;
    mtbFechamentoTOT_VERBA_FRANQUIA: TFloatField;
    tvFechamentoDOM_FECHADO: TcxGridDBColumn;
    tvFechamentoVAL_VERBA_ENTREGADOR: TcxGridDBColumn;
    tvFechamentoTOT_VERBA_FRANQUIA: TcxGridDBColumn;
    actFinanciar: TAction;
    Financiar1: TMenuItem;
    dxActivityIndicator1: TdxActivityIndicator;
    dxLayoutItem5: TdxLayoutItem;
    dxLayoutAutoCreatedGroup2: TdxLayoutAutoCreatedGroup;
    cxLabel2: TcxLabel;
    dxLayoutItem8: TdxLayoutItem;
    mtbFechamentoQTD_PFP: TIntegerField;
    tvFechamentoQTD_PFP: TcxGridDBColumn;
    mtbFechamentoNOM_FAVORECIDO: TStringField;
    mtbFechamentoNUM_CPF_CNPJ: TStringField;
    mtbFechamentoCOD_BANCO: TIntegerField;
    mtbFechamentoCOD_AGENCIA: TStringField;
    mtbFechamentoNUM_CONTA: TStringField;
    tvFechamentoDES_EXTRATOS: TcxGridDBColumn;
    tvFechamentoNOM_FAVORECIDO: TcxGridDBColumn;
    tvFechamentoNUM_CPF_CNPJ: TcxGridDBColumn;
    tvFechamentoCOD_BANCO: TcxGridDBColumn;
    tvFechamentoCOD_AGENCIA: TcxGridDBColumn;
    tvFechamentoCOD_TIPO_CONTA: TcxGridDBColumn;
    tvFechamentoNUM_CONTA: TcxGridDBColumn;
    mtbFechamentoDES_TIPO_CONTA: TStringField;
    mtbBancos: TdxMemData;
    dsBancos: TDataSource;
    mtbBancosCOD_BANCO: TStringField;
    mtbBancosNOM_BANCO: TStringField;
    procedure actProcessarExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure actFecharExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tvFechamentoNavigatorButtonsButtonClick(Sender: TObject; AButtonIndex: Integer; var ADone: Boolean);
    procedure actExtratoExecute(Sender: TObject);
    procedure actExtraviosExecute(Sender: TObject);
    procedure actLancamentosExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actEncerrarExecute(Sender: TObject);
    procedure actFinanciarExecute(Sender: TObject);
  private
    { Private declarations }
    procedure Exportar;
    procedure Financiar;
    procedure PopulaBancos;
  public
    { Public declarations }
  end;

var
  view_FechamentoExpressas: Tview_FechamentoExpressas;
  fechamentos : TObjectList<TFechamentoExpressas>;
  fechamento : TFechamentoExpressas;
  fechamentoDAO : TFechamentoExpressasDAO;
  extratos : TObjectList<TExtratosExpressas>;
  extrato: TExtratosExpressas;
  extratoDAO: TExtratosExpressasDAO;
  parcela: TParcelamentoRestricao;
  parcelas: TObjectList<TParcelamentoRestricao>;
  parcelaDAO: TParcelamentoRestricaoDAO;
  extravio: TExtraviosMultas;
  extravios: TObjectList<TExtraviosMultas>;
  extravioDAO: TExtraviosMultasDAO;
  entregadores : TObjectList<TEntregadores>;
  entregador : TEntregadores;
  entregadorDAO : TEntregadoresDAO;
  lancamentos: TLancamentos;
  restricoes: TRestricoes;
  thrFechamento: Thread_ProcessaFechamento;
  thrCancelamento: Thread_CancelaFechamentoExpressas;
  threncerramento : Thread_EncerraFechamento;
  aParam: array of Variant;
  sFiltro: String;
  sTexto : String;
implementation

{$R *.dfm}

uses Common.Utils, Global.Parametros, udm, uGlobais, ufrmLancamentos, View.ExtratoExpressas, View.PesquisaExtravios, ufrmDetalhesLancamentos, ufrmSalvaLancamento, ufrmData;

procedure Tview_FechamentoExpressas.actCancelarExecute(Sender: TObject);
begin
  if datInicio.Text = '' then
  begin
    Application.MessageBox('Informa a data inicial.', 'Atenção', MB_OK + MB_ICONWARNING);
    datInicio.SetFocus;
    Exit;
  end;
  if datTermino.Text = '' then
  begin
    Application.MessageBox('Informa a data final.', 'Atenção', MB_OK + MB_ICONWARNING);
    datTermino.SetFocus;
    Exit;
  end;
  if datInicio.Date > datTermino.Date then
  begin
    Application.MessageBox('Data final menor que data inicial.', 'Atenção', MB_OK + MB_ICONWARNING);
    datTermino.SetFocus;
    Exit;
  end;
  if mtbFechamentoDOM_FECHADO.Value = 1 then
  begin
    Application.MessageBox('Fechamento já encerrado!', 'Atenção', MB_OK + MB_ICONWARNING);
    datTermino.SetFocus;
    Exit;
  end;
  if Application.MessageBox('Confirma cancelar este fechamento?', 'Canclar Fechamento', MB_YESNO + MB_ICONQUESTION) = IDNO then Exit;
  thrCancelamento := Thread_CancelaFechamentoExpressas.Create(True);
  thrCancelamento.FreeOnTerminate := True;
  thrCancelamento.Priority := tpNormal;
  thrCancelamento.dtInicio := datInicio.Date;
  thrCancelamento.dtFinal := datTermino.Date;
  thrCancelamento.Start;
end;

procedure Tview_FechamentoExpressas.actEncerrarExecute(Sender: TObject);
var
  sMensagem: String;
  dtPagamento : TDate;
  sRaioX: String;
  sRaioX1: String;
  iDivergencia: Integer;
begin
  if not mtbFechamento.Active then Exit;
  if mtbFechamento.IsEmpty then Exit;
  if mtbFechamentoDOM_FECHADO.Value = 1 then
  begin
    Application.MessageBox('Fechamento já encerrado!', 'Atenção', MB_OK + MB_ICONWARNING);
    datTermino.SetFocus;
    Exit;
  end;

  sRaioX1 := Common.Utils.TUtils.LeIni(uGlobais.sIni,'Common','RaioX');
  if sRaioX1.IsEmpty then sRaioX1 := '0';

  sRaioX := tvFechamento.DataController.Summary.FooterSummaryValues[9];

  sRaioX := common.Utils.TUtils.ReplaceStr(sRaioX,'.','');

  if StrToIntDef(sRaioX1,0) = 0 then
  begin
    if Application.MessageBox('Não foi possível conferir a quantidade do Raio-X. Deseja continuar assim mesmo?', 'Encerrar', MB_YESNO + MB_ICONQUESTION) = IDNO then Exit;
  end;

  iDivergencia := StrToIntDef(sRaioX1,0) -  StrToIntDef(sRaioX,0);

  if (iDivergencia > 10) or (iDivergencia < -10) then
  begin
    if Application.MessageBox(PChar('Quantidade do Raio-X diverge em ' + iDiVergencia.toString +  ' entregas. Deseja continuar assim mesmo?'), 'Encerrar', MB_YESNO + MB_ICONWARNING) = IDNO then Exit;
  end;

  if not Assigned(frmData) then
  begin
    frmData := TfrmData.Create(Application);
  end;
  if frmData.ShowModal = mrCancel then Exit;
  dtPagamento := frmData.cxData.Date;
  FreeAndNil(frmData);
  if datTermino.Date > dtPagamento then
  begin
    Application.MessageBox('Data do pagamento não pode ser menor que a data final do período processado!', 'Atenção', MB_OK + MB_ICONWARNING);
    Exit;
  end;

  sMensagem := 'Se confirmar o encerramento deste fechamento não será mais possível nenhuma alteração nos valores demonstrados!'  + #13 + 'Confirma o encerramernto?';
  if Application.MessageBox(pChar(sMensagem), 'Encerrar', MB_YESNO + MB_ICONQUESTION) = IDNO then Exit;
  threncerramento := Thread_EncerraFechamento.Create(True);
  threncerramento.FreeOnTerminate := True;
  threncerramento.Priority := tpNormal;
  threncerramento.dtInicio := datInicio.Date;
  threncerramento.dtFinal := datTermino.Date;
  threncerramento.dtPagamento := dtPagamento;
  threncerramento.Start;
end;

procedure Tview_FechamentoExpressas.actExtratoExecute(Sender: TObject);
begin
  if not mtbFechamento.Active then Exit;
  if mtbFechamento.IsEmpty then Exit;

  if not Assigned(view_ExtratoExpressas) then
  begin
    view_ExtratoExpressas := Tview_ExtratoExpressas.Create(Application);
  end;
  view_ExtratoExpressas.dtInicial := datInicio.Date;
  view_ExtratoExpressas.dtTermino := datTermino.Date;
  view_ExtratoExpressas.ShowModal;
end;

procedure Tview_FechamentoExpressas.actExtraviosExecute(Sender: TObject);
begin
  if not mtbFechamento.Active then Exit;
  if mtbFechamento.IsEmpty then Exit;
  if mtbFechamentoVAL_EXTRAVIOS.AsFloat = 0 then Exit;
  if not Assigned(view_PesquisaExtravios) then
  begin
    view_PesquisaExtravios := Tview_PesquisaExtravios.Create(Application);
  end;
  sTexto := mtbFechamentoDES_EXTRATOS.Value;
  sFiltro := 'ID_EXTRATO IN (' + sTexto + ')';
  view_PesquisaExtravios.sFiltro := sFiltro;
  view_PesquisaExtravios.dxLayoutGroup1.Visible := False;
  view_PesquisaExtravios.dxLayoutItem5.Visible := False;
  view_PesquisaExtravios.ShowModal;
  dm.mtbExtravios.Close;
end;

procedure Tview_FechamentoExpressas.actFecharExecute(Sender: TObject);
begin
  Perform(WM_CLOSE, 0, 0);
end;

procedure Tview_FechamentoExpressas.actFinanciarExecute(Sender: TObject);
begin
  if mtbFechamento.IsEmpty then Exit;
  if mtbFechamentoDOM_FECHADO.Value = 1 then
  begin
    Application.MessageBox('Extrato já encerrado!', 'Atenção', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  if mtbFechamentoVAL_TOTAL_DEBITOS.Value = 0 then Exit;
  if Application.MessageBox('Confirmado o Financiamento o Fechamento deverá ser cancelado reprocessado. Deseja continuar?', 'Atenção', MB_YESNO + MB_ICONQUESTION) = IDNO then
     Exit;
  Financiar;
end;

procedure Tview_FechamentoExpressas.actLancamentosExecute(Sender: TObject);
begin
  if mtbFechamentoVAL_CREDITOS.Value = 0 then
  begin
    if mtbFechamentoVAL_DEBITOS.Value = 0 then
    begin
      Exit;
    end;
  end;

  if not Assigned(frmDetalhesLancamentos) then
  begin
    frmDetalhesLancamentos := TfrmDetalhesLancamentos.Create(Application);
  end;
  frmDetalhesLancamentos.sId := mtbFechamentoDES_EXTRATOS.Value;
  frmDetalhesLancamentos.sFiltro := 'EXTRATOS';
  frmDetalhesLancamentos.ShowModal;
end;

procedure Tview_FechamentoExpressas.actProcessarExecute(Sender: TObject);
var
  sRaioX: String;
begin
  if datInicio.Text = '' then
  begin
    Application.MessageBox('Informe a data inicial.', 'Atenção', MB_OK + MB_ICONWARNING);
    datInicio.SetFocus;
    Exit;
  end;
  if datTermino.Text = '' then
  begin
    Application.MessageBox('Informe a data final.', 'Atenção', MB_OK + MB_ICONWARNING);
    datTermino.SetFocus;
    Exit;
  end;
  if datInicio.Date > datTermino.Date then
  begin
    Application.MessageBox('Data final menor que data inicial.', 'Atenção', MB_OK + MB_ICONWARNING);
    datTermino.SetFocus;
    Exit;
  end;

  sRaioX := Common.Utils.TUtils.LeIni(uGlobais.sIni, 'Common', 'RaioX');

  if StrToIntDef(sRaioX,0) = 0 then
  begin
    sRaioX := InputBox('Quantidade de Entregas no Raio-X','Quantidade RaioX:','0');

    if not Common.Utils.TUtils.ENumero(sRaioX) then
    begin
      Application.MessageBox('Informe um número válido para quantidade do Raio-X!', 'Atenção', MB_OK + MB_ICONWARNING);
      Exit;
    end;

    if StrToIntDef(sRaioX,0) = 0 then
    begin
      Application.MessageBox('Informe um número válido para quantidade do Raio-X!', 'Atenção', MB_OK + MB_ICONWARNING);
      Exit;
    end;
  end;

  cxLabel2.Caption := sRaioX;
  cxLabel2.Refresh;

  Common.Utils.TUtils.GravaIni(uGlobais.sIni,'Common', 'RaioX',sRaioX);

  thrFechamento := Thread_ProcessaFechamento.Create(True);
  thrFechamento.FreeOnTerminate := True;
  thrFechamento.Priority := tpNormal;
  thrFechamento.dtInicio := datInicio.Date;
  thrFechamento.dtFinal := datTermino.Date;
  thrFechamento.bRestricao := chkRestricoes.Checked;
  thrFechamento.bLancamentos := chkLancamentos.Checked;
  thrFechamento.bSLA := chkSLA.Checked;
  thrFechamento.Start;
end;

procedure Tview_FechamentoExpressas.Exportar;
var
  FileExt, sFile: String;
begin
  if not (mtbFechamento.Active) then
  begin
    Exit;
  end;
  if mtbFechamento.IsEmpty then
  begin
    Exit;
  end;
  sFile := 'fechamento';
  SaveDialog.FileName := sFile;
  SaveDialog.Filter := '';
  SaveDialog.Filter := 'Excel (*.xls) |*.xls|XML (*.xml) |*.xml|Arquivo Texto (*.txt) |*.txt|Página Web (*.html)|*.html';
  SaveDialog.Title := 'Exportar Dados';
  SaveDialog.DefaultExt := 'xls';
  if SaveDialog.Execute then
  begin
    FileExt := LowerCase(ExtractFileExt(SaveDialog.FileName));
    if FileExt = '.xls' then
      ExportGridToExcel(SaveDialog.FileName, grdFechamento, False, True, True)
    else if FileExt = '.xml' then
      ExportGridToXML(SaveDialog.FileName, grdFechamento, False)
    else if FileExt = '.txt' then
      ExportGridToText(SaveDialog.FileName, grdFechamento, False)
    else if FileExt = '.html' then
      ExportGridToHTML(SaveDialog.FileName, grdFechamento, False);
    ShellExecute(Handle, 'open', pchar(SaveDialog.FileName), nil, nil, SW_SHOW);
  end;
end;

procedure Tview_FechamentoExpressas.Financiar;
var
  extratoTMP: TExtratosExpressas;
  fechamentoTMP : TFechamentoExpressas;
  extravioTMP: TExtraviosMultas;
  iRestricao: Integer;
  iAgente : Integer;
  iEntregador : Integer;
  dTotal: Double;
  dParcela: Double;
  iExtrato: integer;
begin
  try
    iRestricao := 0;
    fechamentos := TObjectList<TFechamentoExpressas>.Create;
    extratos := TObjectList<TExtratosExpressas>.Create;
    extravios := TObjectList<TExtraviosMultas>.Create;
    fechamentoDAO := TFechamentoExpressasDAO.Create;
    extratoDAO := TExtratosExpressasDAO.Create;
    extravioDAO := TExtraviosMultasDAO.Create;
    entregadores := TObjectList<TEntregadores>.Create;
    entregadorDAO := TEntregadoresDAO.Create;
    lancamentos := TLancamentos.Create;
    if not Assigned(frmSalvaLancamento) then
    begin
      frmSalvaLancamento := TfrmSalvaLancamento.Create(Application);
    end;

    if frmSalvaLancamento.ShowModal = mrOk then
    begin
      dTotal := 0;
      if frmSalvaLancamento.cxValor.Value > 0 then
      begin
        if mtbFechamentoVAL_TOTAL_DEBITOS.Value <  frmSalvaLancamento.cxValor.Value then
        begin
          Application.MessageBox('Valor financiado maior que o total de débitos!, Financiamento cancelado.', 'Atenção', MB_OK +MB_ICONWARNING);
          Exit;
        end;
        iEntregador := 0;
        if mtbFechamentoCOD_TIPO.Value = 1 then
        begin
          SetLength(aParam,1);
          aParam[0] := mtbFechamentoCOD_EXPRESSA.AsInteger;
          entregadores := entregadorDAO.FindEntregador('AGENTE', aParam);
          Finalize(aParam);
          if entregadores.Count > 0 then iAgente := entregadores[0].Agente;
          if entregadores.Count > 0 then iEntregador := entregadores[0].Entregador;
        end
        else
        begin
          SetLength(aParam,1);
          aParam[0] := mtbFechamentoCOD_EXPRESSA.AsInteger;
          entregadores := entregadorDAO.FindEntregador('ENTREGADOR', aParam);
          Finalize(aParam);
          if entregadores.Count > 0 then iAgente := entregadores[0].Agente;
          if entregadores.Count > 0 then iEntregador := entregadores[0].Entregador;
        end;
        iExtrato := 0;
        SetLength(aParam,3);
        aParam[0] := datInicio.Date;
        aParam[1] := datTermino.Date;
        aParam[2] := iEntregador;
        extratos := extratoDAO.FindExtrato('REFERENCIA', aParam);
        Finalize(aParam);
        if EXTRATOS.Count > 0 then iExtrato := extratos[0].Id;
        restricoes.Entregador := iEntregador;
        if restricoes.getObject(iEntregador.ToString,'ENTREGADOR') then
        begin
          iRestricao := dm.qryGetObject.FieldByName('COD_RESTRICAO').AsInteger;
          dTotal := dm.qryGetObject.FieldByName('VAL_DEBITAR').AsFloat + frmSalvaLancamento.cxValor.Value;
          dm.qryGetObject.Edit;
          dm.qryGetObject.FieldByName('VAL_RESTRICAO').AsFloat := dTotal;
          dm.qryGetObject.FieldByName('VAL_DEBITAR').AsFloat := dTotal;
          dm.qryGetObject.Post;
        end
        else
        begin
          restricoes.Codigo := 0;
          restricoes.Valor := dTotal;
          restricoes.Agente := iAgente;
          restricoes.Entregador := mtbFechamentoCOD_EXPRESSA.AsInteger;
          restricoes.Pago := 0;
          restricoes.Debitar := dTotal;
          if not restricoes.Insert() then
          begin
            Application.MessageBox(PChar('Erro ao incluir a restrição do entregador ' + mtbFechamentoCOD_EXPRESSA.AsString + ' !'), 'Erro', MB_OK + MB_ICONERROR);
            Exit;
          end;
          iRestricao := restricoes.Codigo;
          end;
        parcelas := TObjectList<TParcelamentoRestricao>.Create;
        parcelaDAO := TParcelamentoRestricaoDAO.Create;
        parcela := TParcelamentoRestricao.Create;
        if Not parcelaDAO.DeleteCodigo(iRestricao) then
        begin
          Application.MessageBox('Erro  ao excluir as parcelar pendentes!', 'Erro', MB_OK + MB_ICONERROR);
          Exit;
        end;
        while not frmSalvaLancamento.tbParcelas.Eof do
        begin
          parcela.Restricao := iRestricao;
          parcela.Parcela := frmSalvaLancamento.tbParcelas.RecIdField.AsInteger;
          parcela.TotalParcelas := frmSalvaLancamento.cxQuantidade.Value;
          parcela.Debitado := 0;
          parcela.Extrato := iExtrato;
          parcela.Valor := frmSalvaLancamento.tbParcelasVAL_PARCELA.AsFloat;
          parcela.Data := frmSalvaLancamento.tbParcelasDAT_PARCELA.AsDateTime;
        end;
      end;
    end;
  finally
    entregadorDAO.Free;
    restricoes.Free;
    FreeAndNil(frmSalvaLancamento);
    extratoDAO.Free;
    fechamentoDAO.Free;
    extravioDAO.Free;
    parcelaDAO.Free;
  end;
end;

procedure Tview_FechamentoExpressas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  mtbFechamento.Close;
  mtbBancos.Close;
  Action := caFree;
  view_FechamentoExpressas := nil;
end;

procedure Tview_FechamentoExpressas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then
  begin
    if grdFechamento.IsFocused then
    begin
      Exit;
    end;
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure Tview_FechamentoExpressas.FormShow(Sender: TObject);
begin
  Self.Left := 0;
  self.Top := 0;
  Self.Width := Screen.WorkAreaWidth;
  Self.Height := Screen.WorkAreaHeight;
  SetLength(aParam,1);
  PopulaBancos;
  fechamentos := TObjectList<TFechamentoExpressas>.Create;
  fechamentoDAO := TFechamentoExpressasDAO.Create;
  aParam[0] := 0;
  fechamentos := fechamentoDAO.FindFechamento('FECHADO', aParam);
  Finalize(aParam);
  fechamentoDAO.Free;
  if fechamentos.Count > 0 then
  begin
    datInicio.Date := fechamentos[0].DataInicio;
    datInicio.Properties.ReadOnly := True;
    datTermino.Date := fechamentos[0].DataFinal;
    datTermino.Properties.ReadOnly := True;
    actProcessarExecute(Sender);
  end;
end;

procedure Tview_FechamentoExpressas.PopulaBancos;
var
  bancos : TBancos;
begin
  try
    bancos := TBancos.Create;
    if bancos.getObjects() then
    begin
      if mtbBancos.Active then mtbBancos.Close;
      mtbBancos.Open;

      dm.qryGetObject.First;
      while not dm.qryGetObject.Eof do
      begin
        mtbBancos.Insert;
        mtbBancosCOD_BANCO.AsInteger :=  StrToIntDef(dm.qryGetObject.FieldByName('COD_BANCO').AsString, 0);
        mtbBancosNOM_BANCO.AsString := dm.qryGetObject.FieldByName('NOM_BANCO').AsString;
        mtbBancos.Post;
        dm.qryGetObject.Next;
      end;
    end;
  finally
    dm.qryGetObject.Close;
    bancos.Free;
  end;
end;

procedure Tview_FechamentoExpressas.tvFechamentoNavigatorButtonsButtonClick(Sender: TObject; AButtonIndex: Integer; var ADone: Boolean);
begin
  case AButtonIndex of
    16: Exportar;
  end;
end;

end.
