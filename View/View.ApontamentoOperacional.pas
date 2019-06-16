unit View.ApontamentoOperacional;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, dxLayoutContainer, dxLayoutControl, cxContainer, cxEdit, dxLayoutcxEditAdapters, cxLabel,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, dxLayoutControlAdapters, Vcl.Menus,
  Vcl.StdCtrls, cxButtons, System.Actions, Vcl.ActnList, Data.DB, dxmdaset, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxDBLookupComboBox, Model.ApontamentoOperacional, DAO.ApontamentoOperacional, clEntregador, System.Generics.Collections,
  clRoteiroEntregador, cxImageComboBox, DAO.Acessos, Model.RHOperacionalAusencias, DAO.RHOperacionalAusencias, Winapi.ShlObj,
  cxShellCommon, dxBreadcrumbEdit, dxShellBreadcrumbEdit, dxSkinsdxStatusBarPainter, dxStatusBar, cxProgressBar,
  Thread.PopulaApontamentoOperacional, Thread.PopulaEntregadoresJornal, Thread.SalvaApontamentoOperacional;

type
  Tview_ApontamentoOperacional = class(TForm)
    lcgRoot: TdxLayoutGroup;
    lcApontamento: TdxLayoutControl;
    lblTitulo: TcxLabel;
    lciTitulo: TdxLayoutItem;
    edtData: TcxDateEdit;
    lciData: TdxLayoutItem;
    edtTipo: TcxComboBox;
    lciTipo: TdxLayoutItem;
    btnProcessar: TcxButton;
    lciProcessar: TdxLayoutItem;
    aclApontamento: TActionList;
    actProcessar: TAction;
    tbApontamento: TdxMemData;
    tbApontamentoID_OPERACAO: TIntegerField;
    tbApontamentoCOD_ENTREGADOR: TIntegerField;
    tbApontamentoCOD_ROTEIRO_ANTIGO: TStringField;
    tbApontamentoDAT_OPERACAO: TDateField;
    tbApontamentoCOD_STATUS_OPERACAO: TStringField;
    tbApontamentoCOD_ROTEIRO_NOVO: TStringField;
    tbApontamentoDES_OBSERVACOES: TStringField;
    tbApontamentoDOM_PLANILHA: TStringField;
    tbApontamentoID_REFERENCIA: TIntegerField;
    tbApontamentoDAT_REFERENCIA: TDateField;
    tbApontamentoDES_LOG: TMemoField;
    tvApontamento: TcxGridDBTableView;
    lvApontamento: TcxGridLevel;
    grdApontamento: TcxGrid;
    lciGrade: TdxLayoutItem;
    dsApontamento: TDataSource;
    tvApontamentoRecId: TcxGridDBColumn;
    tvApontamentoID_OPERACAO: TcxGridDBColumn;
    tvApontamentoCOD_ENTREGADOR: TcxGridDBColumn;
    tvApontamentoCOD_ROTEIRO_ANTIGO: TcxGridDBColumn;
    tvApontamentoDAT_OPERACAO: TcxGridDBColumn;
    tvApontamentoCOD_STATUS_OPERACAO: TcxGridDBColumn;
    tvApontamentoCOD_ROTEIRO_NOVO: TcxGridDBColumn;
    tvApontamentoDES_OBSERVACOES: TcxGridDBColumn;
    tvApontamentoDOM_PLANILHA: TcxGridDBColumn;
    tvApontamentoID_REFERENCIA: TcxGridDBColumn;
    tvApontamentoDAT_REFERENCIA: TcxGridDBColumn;
    tvApontamentoDES_LOG: TcxGridDBColumn;
    actGravar: TAction;
    actCancelar: TAction;
    aftFechar: TAction;
    btnGravar: TcxButton;
    lciGravar: TdxLayoutItem;
    btnLimpar: TcxButton;
    lciLimpar: TdxLayoutItem;
    lcgOpcoes: TdxLayoutAutoCreatedGroup;
    btnFechar: TcxButton;
    lciFechar: TdxLayoutItem;
    dsEntregador: TDataSource;
    actEditar: TAction;
    btnEditar: TcxButton;
    lciEditar: TdxLayoutItem;
    tbAusencias: TdxMemData;
    tbAusenciasID_AUSENCIA: TIntegerField;
    tbAusenciasDAT_OPERACAO: TDateField;
    tbAusenciasCOD_CADASTRO: TIntegerField;
    tbAusenciasCOD_STATUS_OPERACAO: TStringField;
    tbAusenciasDES_OBSERVACOES: TStringField;
    tbAusenciasID_REFERENCIA: TIntegerField;
    tbAusenciasDES_LOG: TMemoField;
    dsAusencias: TDataSource;
    lcgFiltro: TdxLayoutGroup;
    actLimpar: TAction;
    sbApontamento: TdxStatusBar;
    lctBarraStatus: TdxLayoutItem;
    sbApontamentoContainer1: TdxStatusBarContainerControl;
    pbApontamento: TcxProgressBar;
    btnCancelar: TcxButton;
    lciCancelar: TdxLayoutItem;
    procedure aftFecharExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure actProcessarExecute(Sender: TObject);
    procedure edtTipoPropertiesChange(Sender: TObject);
    procedure dsApontamentoStateChange(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure actEditarExecute(Sender: TObject);
    procedure actGravarExecute(Sender: TObject);
    procedure tbApontamentoAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
    procedure ListaEntregador;
    procedure ProcessaFiltro;
    procedure SetupNivel;
    procedure LimparTela;
    procedure CancelaOperacao;
    procedure SetupApontamento;
    procedure SetupAusencias;
    procedure SalvaOperacao;
    procedure SalvaRepositor;
    function ValidaPlanilha(): Boolean;
  public
    { Public declarations }
  end;

var
  view_ApontamentoOperacional: Tview_ApontamentoOperacional;
  apontamento: TApontamentoOperacional;
  apontamentoTMP: TApontamentoOperacional;
  apontamentos: TObjectList<TApontamentoOperacional>;
  apontamentoDAO: TApontamentoOperacionalDAO;
  ausencia: TRHoperacionalAusencias;
  ausenciaTMP: TRHoperacionalAusencias;
  ausencias: TObjectList<TRHoperacionalAusencias>;
  ausenciaDAO: TRHoperacionalAusenciasDAO;
  entregador: TEntregador;
  roteiro: TRoteiroEntregador;
  acessoDAO: TAcessosDAO;
  thrApotamentos: Thread_PopulaApontamentoOperacional;
  thrEntregadores: Thread_PopulaEntregadoresJornal;
  thrSalvaApontamentos: Thread_SalvaApontamentoOperacional;
implementation

{$R *.dfm}

uses udm, uGlobais, ufrmOperacaoRepositor;

procedure Tview_ApontamentoOperacional.actCancelarExecute(Sender: TObject);
begin
  CancelaOperacao;
end;

procedure Tview_ApontamentoOperacional.actEditarExecute(Sender: TObject);
begin
  tbApontamento.Edit;
end;

procedure Tview_ApontamentoOperacional.actGravarExecute(Sender: TObject);
begin
  if not ValidaPlanilha() then Exit;
  SalvaOperacao;
end;

procedure Tview_ApontamentoOperacional.actProcessarExecute(Sender: TObject);
begin
  if edtData.Text = '' then
  begin
    Application.MessageBox('Informe a data do apontamento.', 'Atenção!', MB_OK + MB_ICONWARNING);
    edtData.SetFocus;
    Exit;
  end;
  if edtTipo.ItemIndex = 0 then ProcessaFiltro;
end;

procedure Tview_ApontamentoOperacional.aftFecharExecute(Sender: TObject);
begin
  Perform(WM_CLOSE, 0, 0);
end;

procedure Tview_ApontamentoOperacional.dsApontamentoStateChange(Sender: TObject);
begin
  if TDataSource(Sender).DataSet.State in [dsInsert, dsEdit] then
  begin
    if not tbApontamento.IsLoading then
    begin
      actGravar.Enabled := True;
      actLimpar.Enabled := True;
      actEditar.Enabled := False;
    end;
  end;
  if TDataSource(Sender).DataSet.State in [dsBrowse] then
  begin
    actLimpar.Enabled := True;
    actEditar.Enabled := True;
  end;
end;

procedure Tview_ApontamentoOperacional.edtTipoPropertiesChange(Sender: TObject);
begin
  if tbApontamento.Active then tbApontamento.Close;
  tbApontamento.Open;
end;

procedure Tview_ApontamentoOperacional.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if tbApontamento.Active then tbApontamento.Close;
  if tbAusencias.Active then tbAusencias.Active;
  if dm.tbListaEntregadores.Active then dm.tbListaEntregadores.Close;
  Action := caFree;
  view_ApontamentoOperacional := Nil;
end;

procedure Tview_ApontamentoOperacional.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if actGravar.Enabled then
  begin
    CanClose := Application.MessageBox('Existem apontamentos a serem gravados. Deseja realmente sair?','Sair',
                              MB_YESNO + MB_ICONQUESTION) = IDYES;
  end;
end;

procedure Tview_ApontamentoOperacional.FormShow(Sender: TObject);
begin
  ListaEntregador;
  SetupNivel;
end;

procedure Tview_ApontamentoOperacional.ListaEntregador;
begin
  thrEntregadores := Thread_PopulaEntregadoresJornal.Create(True);
  thrEntregadores.FreeOnTerminate := True;
  thrEntregadores.Priority := tpNormal;
  thrEntregadores.Start;
end;

procedure Tview_ApontamentoOperacional.ProcessaFiltro;
begin
  if edtData.Date = 0 then
  begin
    Application.MessageBox('Informe a data do apontamento!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if edtTipo.ItemIndex = 0 then
  begin
    thrApotamentos := Thread_PopulaApontamentoOperacional.Create(True);
    thrApotamentos.FreeOnTerminate := True;
    thrApotamentos.Priority := tpNormal;
    thrApotamentos.Data := edtData.Date;
    thrApotamentos.Start;
  end;
end;

procedure Tview_ApontamentoOperacional.SetupNivel;
var
  i: integer;
begin
  acessoDAO := TAcessosDAO.Create();
  for i := 0 to aclApontamento.ActionCount - 1 do
  begin
    TAction(aclApontamento.Actions[i]).Visible := acessoDAO.SetNivelAcessos(TAction(aclApontamento.Actions[i]).Tag,
                                                 uGlobais.iNivelUsuario)
  end;
  acessoDAO.Free;
end;

procedure Tview_ApontamentoOperacional.tbApontamentoAfterPost(DataSet: TDataSet);
begin
  SalvaRepositor;
end;

procedure Tview_ApontamentoOperacional.CancelaOperacao;
var
  lLog : TStringList;
  iId: integer;
begin
  if tbAusencias.IsEmpty then Exit;
  if Application.MessageBox('Confirma Cancelar este Apontamento?', 'Cancelar', MB_YESNO + MB_ICONQUESTION) = IDNO then Exit;
  ausenciaDAO := TRHOperacionalAusenciasDAO.Create();
  lLog := TStringList.Create();
  iId := tbApontamentoID_OPERACAO.AsInteger;
  lLog.Text := tbApontamentoDES_LOG.Text;
  lLog.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' apontamento cancelamento por ' + uGlobais.sUsuario);
  tbApontamento.Edit;
  tbApontamentoCOD_ENTREGADOR.AsInteger := 0;
  tbApontamentoDES_LOG.Text := lLog.Text;
  tbApontamento.Post;
  if tbAusencias.Locate('ID_REFERENCIA',iId,[]) then
  begin
    if not ausenciaDAO.Delete(tbAusenciasID_AUSENCIA.AsInteger) then
    begin
      Application.MessageBox('Erro ao excluir o registro de ausência do banco de dados!', 'Atenção', MB_OK + MB_ICONERROR);
    end;
    tbAusencias.Delete;
  end;
  ausenciaDAO.Free;
end;

procedure Tview_ApontamentoOperacional.SetupApontamento;
var
  lLog : TStringList;
begin
  lLog := TStringList.Create();
  apontamento.ID := tbApontamentoID_OPERACAO.AsInteger;
  apontamento.Entregador := tbApontamentoCOD_ENTREGADOR.AsInteger;
  apontamento.RoteiroAntigo := tbApontamentoCOD_ROTEIRO_ANTIGO.AsString;
  apontamento.Data := tbApontamentoDAT_OPERACAO.AsDateTime;
  apontamento.StatusOperacao := tbApontamentoCOD_STATUS_OPERACAO.AsString;
  apontamento.RoteiroNovo := tbApontamentoCOD_ROTEIRO_NOVO.AsString;
  apontamento.Obs:= tbApontamentoDES_OBSERVACOES.AsString;
  apontamento.Planilha := tbApontamentoDOM_PLANILHA.AsString;
  apontamento.IDReferencia := tbApontamentoID_REFERENCIA.AsInteger;
  apontamento.DataReferencia := tbApontamentoDAT_REFERENCIA.AsDateTime;
  lLog.Text := tbApontamentoDES_LOG.AsString;
  if apontamento.ID = 0 then
  begin
    lLog.Add('> ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' inserido ' + uGlobais.sUsuario);
  end
  else
  begin
    lLog.Add('> ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' alterado ' + uGlobais.sUsuario);
  end;
  apontamento.Log := lLog.Text;
end;

procedure Tview_ApontamentoOperacional.SalvaOperacao;
begin
  if Application.MessageBox('Confirma Salvar a Planilha?', 'Salvar a Planilha.', MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  thrSalvaApontamentos := Thread_SalvaApontamentoOperacional.Create(True);
  thrSalvaApontamentos.FreeOnTerminate := True;
  thrSalvaApontamentos.Priority := tpNormal;
  thrSalvaApontamentos.Start;
end;

procedure Tview_ApontamentoOperacional.SalvaRepositor;
var
  sStatus: String;
  iEntregador: Integer;
  dtData1 : TDate;
  dtData2 : TDate;
  dtData : TDate;
  iReferencia: Integer;
  lLog: TStringList;
begin
  if tbApontamento.IsLoading then Exit;
  if Trim(tbApontamentoCOD_ROTEIRO_ANTIGO.AsString) = 'REPOSITOR' then Exit;
  if (tbApontamentoCOD_STATUS_OPERACAO.AsString = 'P') OR (tbApontamentoCOD_STATUS_OPERACAO.AsString = 'T') then
  begin
    Exit;
  end;
  sStatus := '';
  iEntregador := 0;
  iReferencia := 0;
  if not Assigned(frmOperacaoRepositor) then
  begin
    frmOperacaoRepositor := TfrmOperacaoRepositor.Create(Application);
  end;
  frmOperacaoRepositor.cxData.Date := edtData.Date;
  frmOperacaoRepositor.cxDataFinal.Date := edtData.Date;
  if frmOperacaoRepositor.ShowModal = mrCancel then
  begin
    Application.MessageBox('Operação cancelada para este entregador!',PChar('Atenção ' + uGlobais.sUsuario),
                           MB_OK + MB_ICONEXCLAMATION);
    tbApontamento.IsLoading := True;
    tbApontamento.Edit;
    tbApontamentoCOD_STATUS_OPERACAO.AsString := 'P';
    tbApontamento.Post;
    tbApontamento.IsLoading := False;
    Exit;
  end
  else
  begin
    sStatus := tbApontamentoCOD_STATUS_OPERACAO.AsString;
    iEntregador := tbApontamentoCOD_ENTREGADOR.AsInteger;
    iReferencia := tbApontamentoID_OPERACAO.AsInteger;
    dtData1 := frmOperacaoRepositor.cxData.Date;
    dtData2 := frmOperacaoRepositor.cxDataFinal.Date;
    tbApontamento.IsLoading := True;
    tbApontamento.Edit;
    tbApontamentoCOD_ENTREGADOR.AsInteger := StrToIntDef(frmOperacaoRepositor.cxCodigo.Text,0);
    tbApontamento.Post;
    dtData := dtData1;
    lLog := TStringList.Create();
    while dtData <= dtData2 do
    begin
      if tbAusencias.Locate('COD_CADASTRO',iEntregador,[]) then
      begin
        tbAusencias.Edit;
        lLog.Text := tbAusenciasDES_LOG.Text;
      end
      else
      begin
        tbAusencias.Insert;
        tbAusenciasID_AUSENCIA.AsInteger := 0;
        lLog.Add('>' + FormatDateTime('dd/mm;yyyy hh:mm:ss', now) + ' inserido por '  + uGlobais.sUsuario);
      end;
      tbAusenciasDAT_OPERACAO.AsDateTime := dtData;
      tbAusenciasCOD_CADASTRO.AsInteger := iEntregador;
      tbAusenciasCOD_STATUS_OPERACAO.AsString := sStatus;
      tbAusenciasDES_OBSERVACOES.AsString := '';
      tbAusenciasID_REFERENCIA.AsInteger := iReferencia;
      tbAusenciasDES_LOG.Text := lLog.Text;
      tbAusencias.Post;
    end;
    tbApontamento.IsLoading := False;
  end;
  FreeAndNil(frmOperacaoRepositor);
end;

procedure Tview_ApontamentoOperacional.SetupAusencias;
var
  lLog : TStringList;
begin
  lLog := TStringList.Create();
  ausencia.ID := tbAusenciasID_AUSENCIA.AsInteger;
  ausencia.Data := tbAusenciasDAT_OPERACAO.AsDateTime;
  ausencia.Cadastro := tbAusenciasCOD_CADASTRO.AsInteger;
  ausencia.StatusOperacao := tbAusenciasCOD_STATUS_OPERACAO.AsString;
  ausencia.Obs:= tbAusenciasDES_OBSERVACOES.AsString;
  ausencia.IDReferencia := tbAusenciasID_REFERENCIA.AsInteger;
  lLog.Text := tbAusenciasDES_LOG.AsString;
  if ausencia.ID = 0 then
  begin
    lLog.Add('> ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' inserido ' + uGlobais.sUsuario);
  end
  else
  begin
    lLog.Add('> ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' alterado ' + uGlobais.sUsuario);
  end;
  ausencia.Log := lLog.Text;
end;

function Tview_ApontamentoOperacional.ValidaPlanilha(): Boolean;
var
  sMess: String;
begin
  Result := True;
  sMess := '';
  if not tbApontamento.IsEmpty then tbApontamento.First;
  while Not tbApontamento.Eof do
  begin
    if tbApontamentoCOD_ENTREGADOR.AsInteger = 0 then
    begin
      sMess := 'Informe o entregador do roteiro ' + tbApontamentoCOD_ROTEIRO_ANTIGO.AsString + ' !';
      Application.MessageBox(PChar(sMess), 'Atenção!', MB_OK + MB_ICONWARNING);
      Result := False;
      Exit;
    end;
    if tbApontamentoCOD_STATUS_OPERACAO.AsString.IsEmpty then
    begin
      sMess := 'Informe o Status Operacional do roteiro ' + tbApontamentoCOD_ROTEIRO_ANTIGO.AsString + ' !';
      Application.MessageBox(PChar(sMess), 'Atenção!', MB_OK + MB_ICONWARNING);
      Result := False;
      Exit;
    end;
    if tbAusencias.Locate('COD_CADASTRO',tbApontamentoCOD_ENTREGADOR.AsInteger,[]) then
    begin
      sMess := 'Entregador ' + tbApontamentoCOD_ENTREGADOR.AsString + ' está apontato como ausente!';
      Application.MessageBox(PChar(sMess), 'Atenção!', MB_OK + MB_ICONWARNING);
      Result := False;
      Exit;
    end;
    tbApontamento.Next;
  end;
end;

procedure Tview_ApontamentoOperacional.LimparTela;
begin
  if actGravar.Enabled then
  begin
    if Application.MessageBox('Existem apontamentos a serem gravados. Deseja realmente Cancelar?','Cancelar',
                              MB_YESNO + MB_ICONQUESTION) = IDNO then
    begin
      Exit;
    end;
  end;
  edtData.Clear;
  tbApontamento.Close;
  tbApontamento.Open;
  actGravar.Enabled := False;
  actCancelar.Enabled := False;
  actEditar.Enabled := False;
end;

end.
