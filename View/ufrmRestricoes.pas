unit ufrmRestricoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxSkinsdxBarPainter, dxBar, cxClasses, ActnList, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, DB, dxmdaset, cxTextEdit, cxDBEdit, cxLabel, cxMaskEdit, cxDropDownEdit, cxCalendar, cxCurrencyEdit, cxSpinEdit, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxCheckBox, clRestricoes, clAgentes, clCodigosEntregadores, Menus, StdCtrls,cxButtons,
  cxImage, ExtCtrls, cxGroupBox, cxCalc, cxButtonEdit, clUtil, cxGridExportLink, ShellAPI, cxNavigator, dxSkinsdxStatusBarPainter,
  dxStatusBar, cxProgressBar, uthrPopularRestricoes, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, System.Actions, clAcessos;

type
  TfrmRestricoes = class(TForm)
    aclCadastro: TActionList;
    actCadastroExcluir: TAction;
    actCadastroCancelar: TAction;
    actCadastroSalvar: TAction;
    actCadastroImprimir: TAction;
    actCadastroLocalizar: TAction;
    actCadastroSair: TAction;
    actCadastroListaApoio: TAction;
    cxGroupBox2: TcxGroupBox;
    cxLabel6: TcxLabel;
    cxCodigo: TcxTextEdit;
    cxLabel14: TcxLabel;
    cxNomeAgente: TcxTextEdit;
    cxLabel15: TcxLabel;
    cxNomeEntregador: TcxTextEdit;
    cxLabel11: TcxLabel;
    ds: TDataSource;
    cxRestricao: TcxCalcEdit;
    cxLabel1: TcxLabel;
    cxPago: TcxCalcEdit;
    cxLabel2: TcxLabel;
    cxDebitar: TcxCalcEdit;
    cxAgente: TcxButtonEdit;
    cxEntregador: TcxButtonEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    actCadastroExportar: TAction;
    SaveDialog: TSaveDialog;
    cxButton5: TcxButton;
    cxLabel27: TcxLabel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1COD_RESTRICAO: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_AGENTE: TcxGridDBColumn;
    cxGrid1DBTableView1COD_ENTREGADOR: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_RESTRICAO: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_PAGO: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_DEBITAR: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    dxStatusBar1: TdxStatusBar;
    dxStatusBar1Container0: TdxStatusBarContainerControl;
    cxProgressBar: TcxProgressBar;
    PopupMenu1: TPopupMenu;
    actCadastroExpandir: TAction;
    actCadastroRetrair: TAction;
    Expandir1: TMenuItem;
    Retrair1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actCadastroSairExecute(Sender: TObject);
    procedure actCadastroExcluirExecute(Sender: TObject);
    procedure actCadastroCancelarExecute(Sender: TObject);
    procedure cxGrid1DBTableView1CanFocusRecord(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      var AAllow: Boolean);
    procedure actCadastroSalvarExecute(Sender: TObject);
    procedure actCadastroExportarExecute(Sender: TObject);
    procedure actCadastroListaApoioExecute(Sender: TObject);
    procedure cxDebitarPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure actCadastroExpandirExecute(Sender: TObject);
    procedure actCadastroRetrairExecute(Sender: TObject);
  private
    { Private declarations }
    procedure ListaAgente;
    procedure ListaEntregador;
  public
    { Public declarations }
    procedure SetupForm;
    procedure Modo;
    procedure AtualizarGrid;
    procedure SetupClass;
    procedure SalvaGrid;
  end;

var
  frmRestricoes : TfrmRestricoes;
  restricao     : TRestricoes;
  agente        : TAgente;
  entregador    : TCodigosEntregadores;
  acessos       : TAcessos;
  sOperacao     : String;
  thrRestricao  : thrPopularRestricoes;
implementation

{$R *.dfm}

uses
  udm, ufrmPrincipal, ufrmListaApoio, uGlobais;

procedure TfrmRestricoes.FormShow(Sender: TObject);
begin
  restricao   :=  TRestricoes.Create();
  agente      :=  TAgente.Create();
  entregador  :=  TCodigosEntregadores.Create();
  acessos     :=  TAcessos.Create;
  acessos.SetNivel(aclCadastro);
  AtualizarGrid;
  sOperacao   := 'I';
end;

procedure TfrmRestricoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  restricao.Free;
  entregador.Free;
  agente.Free;
  acessos.Free;
  dm.tbRestricoes.Close;
  Action        :=  caFree;
  frmRestricoes :=  Nil;
end;

procedure TfrmRestricoes.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key = #13 then begin
    if cxGrid1.IsFocused then begin
      Exit;
    end;
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TfrmRestricoes.SetupForm;
var
  sDescricao  : String;
begin
  sDescricao        :=  '';
  cxCodigo.Text     :=  IntToStr(restricao.Codigo);
  cxRestricao.Value :=  restricao.Valor;
  cxPago.Value      :=  restricao.Pago;
  cxDebitar.Value   :=  restricao.Debitar;
  cxAgente.Text     :=  IntToStr(restricao.Agente);
  cxEntregador.Text :=  IntToStr(restricao.Entregador);
  agente.Codigo     :=  IntToStr(restricao.Agente);
  sDescricao        :=  agente.getField('NOM_FANTASIA','CODIGO');
  if not (TUtil.Empty(sDescricao)) then begin
    cxNomeAgente.Text     :=  sDescricao;
  end
  else begin
    cxNomeAgente.Text     :=  '- - -';
  end;
  entregador.Codigo :=  restricao.Entregador;
  sDescricao        := entregador.getField('NOM_FANTASIA','CODIGO');
  if not (TUtil.Empty(sDescricao)) then begin
    cxNomeEntregador.Text := sDescricao;
  end
  else begin
    cxNomeEntregador.Text :=  '- - -';
  end;
end;

procedure TfrmRestricoes.actCadastroCancelarExecute(Sender: TObject);
begin
  TUtil.LimparFields(Self);
  TUtil.LimparFields(Self);;
  cxAgente.SetFocus;
end;

procedure TfrmRestricoes.cxGrid1DBTableView1CanFocusRecord(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  var AAllow: Boolean);
var
  sCodigo : String;
  i, iRet : Integer;
begin
  dm.ZConn.PingServer;
  if dm.tbRestricoes.Active then begin
    sCodigo    := ARecord.Values[0];
    Val(sCodigo,i,iRet);
    if iRet <> 0 then begin
      TUtil.LimparFields(Self);
      Exit;
    end;
    if restricao.getObject(sCodigo, 'CODIGO') then begin
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


procedure TfrmRestricoes.actCadastroSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmRestricoes.actCadastroRetrairExecute(Sender: TObject);
begin
  cxGrid1DBTableView1.ViewData.Collapse(True);
end;

procedure TfrmRestricoes.actCadastroExcluirExecute(Sender: TObject);
begin
  if sOperacao <> 'U' then begin
    Exit;
  end;
  if restricao.Valor <> 0 then begin
    MessageDlg('Restrição com valor pendente. Impossível excluir!',mtWarning,[mbOK],0);
    Exit;
  end;
  if MessageDlg('Confirma excluir esta restrição?',mtConfirmation,[mbYes,mbNo],0) = IDNO then begin
    Exit;
  end;
  if not (restricao.Delete('CODIGO')) then begin
    MessageDlg('Erro ao excluir esta restrição!',mtWarning,[mbOK],0);
    Exit;
  end;
  TUtil.LimparFields(Self);;
  AtualizarGrid;
  sOperacao :=  'I';
end;

procedure TfrmRestricoes.Modo;
begin
  if sOperacao = 'I' then begin
    actCadastroExcluir.Enabled  :=  False;
    actCadastroCancelar.Enabled :=  True;
    actCadastroSalvar.Enabled   :=  True;
    actCadastroImprimir.Enabled :=  False;
    actCadastroSair.Enabled     :=  True;
  end
  else if sOperacao = 'U' then begin
    actCadastroExcluir.Enabled  := True;
    actCadastroCancelar.Enabled := True;
    actCadastroSalvar.Enabled   := True;
    actCadastroImprimir.Enabled := True;
    actCadastroSair.Enabled     := True;
  end
  else begin
    actCadastroExcluir.Enabled  :=  False;
    actCadastroCancelar.Enabled :=  True;
    actCadastroSalvar.Enabled   :=  True;
    actCadastroImprimir.Enabled :=  False;
    actCadastroSair.Enabled     :=  True;
  end;
end;

procedure TfrmRestricoes.AtualizarGrid;
begin
  ds.Enabled                    :=  False;
  thrRestricao                  :=  thrPopularRestricoes.Create(True);
  thrRestricao.FreeOnTerminate  :=  True;
  thrRestricao.Priority         :=  tpNormal;
  thrRestricao.Start;
end;

procedure TfrmRestricoes.SetupClass;
begin
  if TUtil.Empty(cxCodigo.Text) then begin
    cxCodigo.Text     :=  '0';
  end;
  restricao.Codigo      :=  StrToInt(cxCodigo.Text);
  restricao.Valor       :=  cxRestricao.Value;
  if TUtil.Empty(cxAgente.Text) then begin
    cxAgente.Text     :=  '0';
  end;
  restricao.Agente      :=  StrToInt(cxAgente.Text);
  if TUtil.Empty(cxEntregador.Text) then begin
    cxEntregador.Text :=  '0';
  end;
  restricao.Entregador  :=  StrToInt(cxEntregador.Text);
  restricao.Pago        :=  cxPago.Value;
  restricao.Debitar     :=  cxDebitar.Value;
end;

procedure TfrmRestricoes.actCadastroSalvarExecute(Sender: TObject);
begin
  SetupClass;
  if not (restricao.Validar()) then begin
    Exit;
  end;
  if MessageDlg('Confirma salvar os dados?',mtConfirmation,[mbYes,mbNo],0) = IDNO then begin
    Exit;
  end;
  if sOperacao = 'I' then begin
    if not (restricao.Insert()) then begin
      MessageDlg('Erro ao incluir a Restrição!',mtWarning,[mbOK],0);
      Exit;
    end
    else begin
      SalvaGrid;
    end;
  end
  else begin
    if not (restricao.Update()) then begin
      MessageDlg('Erro ao alterar a Restrição!',mtWarning,[mbOK],0);
      Exit;
    end;
    SalvaGrid;
  end;
  MessageDlg('Dados salvos com sucesso!',mtInformation,[mbOK],0);
  TUtil.LimparFields(Self);;
  cxAgente.SetFocus;
end;

procedure TfrmRestricoes.actCadastroExpandirExecute(Sender: TObject);
begin
  cxGrid1DBTableView1.ViewData.Expand(True);
end;

procedure TfrmRestricoes.actCadastroExportarExecute(Sender: TObject);
var
  FileExt: String;
begin
  if not (dm.tbRestricoes.Active) then begin
    Exit;
  end;
  if dm.tbRestricoes.IsEmpty then begin
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


procedure TfrmRestricoes.actCadastroListaApoioExecute(Sender: TObject);
begin
  if sOperacao = '' then begin
    Exit;
  end;
  if cxAgente.IsFocused then begin
    ListaAgente;
  end
  else if cxEntregador.IsFocused then begin
    ListaEntregador;
  end;


end;

procedure TfrmRestricoes.cxDebitarPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  Perform(Wm_NextDlgCtl,0,0);
end;

procedure TfrmRestricoes.ListaEntregador;
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
    SQL.Text := 'SELECT COD_AGENTE AS "Código", NOM_FANTASIA AS "Nome" ' +
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
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  FreeAndNil(frmListaApoio);
end;

procedure TfrmRestricoes.ListaAgente;
var
  sId : String;
begin
  if Pos(entregador.Operacao,'IU') = 0 then begin
    Exit;
  end;
  sId         :=  '';
  Screen.Cursor :=  crHourGlass;
  sId           :=  Trim(cxAgente.Text);
  with dm.qryPesquisa do begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT COD_AGENTE AS "Código", NOM_FANTASIA AS "Nome" ' +
                'FROM TBAGENTES ';
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
  frmListaApoio.Caption                                 :=  'Agentes';
  Screen.Cursor                                         :=  crDefault;
  if frmListaApoio.ShowModal = mrOk then begin
    cxAgente.Text     :=  dm.qryPesquisa.Fields[0].AsString;
    cxAgente.Refresh;
    cxNomeAgente.Text :=  dm.qryPesquisa.Fields[1].AsString;
    cxNomeAgente.Refresh;
  end;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  FreeAndNil(frmListaApoio);
end;

procedure TfrmRestricoes.SalvaGrid;
var
  sNome : String;
begin
  sNome :=  '';
  if sOperacao = 'I' then begin
    dm.tbRestricoes.Insert;
    dm.tbRestricoesCOD_RESTRICAO.Value  :=  restricao.Codigo;
    sNome                               :=  cxAgente.Text + '-' + cxNomeAgente.Text;
    dm.tbRestricoesNOM_AGENTE.Value     :=  sNome;
    sNome                               :=  cxEntregador.Text + '-' + cxNomeEntregador.Text;
    dm.tbRestricoesNOM_ENTREGADOR.Value :=  sNome;
  end
  else begin
    dm.tbRestricoes.Edit;
  end;
  dm.tbRestricoesVAL_RESTRICAO.Value  :=  restricao.Valor;
  dm.tbRestricoesVAL_PAGO.Value       :=  restricao.Pago;
  dm.tbRestricoesVAL_DEBITAR.Value    :=  restricao.Debitar;
  dm.tbRestricoes.Post;
  dm.tbRestricoes.Refresh;
end;


end.
