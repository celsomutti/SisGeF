unit ufrmRelatorioDiarioOperacional;

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
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxLabel, cxImage, Vcl.ExtCtrls, cxGroupBox, cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.ActnList, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxTimeEdit, cxSpinEdit, cxMemo,
  cxCalendar, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus, Vcl.StdCtrls, cxButtons, clRelatorioDiario, DateUtils, cxGridExportLink,
  ShellAPI;

type
  TfrmRelatorioDiarioOperacional = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    aclRelatorio: TActionList;
    cxLabel11: TcxLabel;
    cxVisualizar: TcxComboBox;
    cxGrid1DBTableView1DAT_RELATORIO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_PLACA: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_MOTORISTA: TcxGridDBColumn;
    cxGrid1DBTableView1HOR_SAIDA_ORIGEM: TcxGridDBColumn;
    cxGrid1DBTableView1HOR_CHEGADA_FRANQUIA: TcxGridDBColumn;
    cxGrid1DBTableView1HOR_SAIDA_FRANQUIA: TcxGridDBColumn;
    cxGrid1DBTableView1QTD_EXPEDIDORES: TcxGridDBColumn;
    cxGrid1DBTableView1QTD_PESO_DIVERGENCIA: TcxGridDBColumn;
    cxGrid1DBTableView1QTD_AVARIAS_DIVERGENCIA: TcxGridDBColumn;
    cxGrid1DBTableView1DES_OBSERVACOES: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_USUARIO: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_REGISTRO: TcxGridDBColumn;
    ds: TDataSource;
    actCadastroNovo: TAction;
    actCadastroExcluir: TAction;
    actCadastroCancelar: TAction;
    actCadastroSalvar: TAction;
    actCadastroExportar: TAction;
    actCadastroSair: TAction;
    cxLabel1: TcxLabel;
    cxData: TcxDateEdit;
    cxLabel2: TcxLabel;
    cxPlaca: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxSaidaTFO: TcxTimeEdit;
    cxLabel5: TcxLabel;
    cxChegadaFranquia: TcxTimeEdit;
    cxLabel6: TcxLabel;
    cxSaidaFranquia: TcxTimeEdit;
    cxLabel7: TcxLabel;
    cxExpedidores: TcxSpinEdit;
    cxLabel8: TcxLabel;
    cxDivergenciaPeso: TcxSpinEdit;
    cxLabel9: TcxLabel;
    cxDivergenciaAvarias: TcxSpinEdit;
    cxLabel10: TcxLabel;
    cxObservacoes: TcxMemo;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxButton5: TcxButton;
    cxButton6: TcxButton;
    cxLabel12: TcxLabel;
    cxRegistro: TcxTextEdit;
    cxGrid1DBTableView1SEQ_RELATORIO: TcxGridDBColumn;
    cxMotorista: TcxComboBox;
    SaveDialog: TSaveDialog;
    cxGrid1DBTableView1DES_OPERACAO: TcxGridDBColumn;
    cxLabel13: TcxLabel;
    cxOperacao: TcxComboBox;
    cxLabel27: TcxLabel;
    procedure actCadastroNovoExecute(Sender: TObject);
    procedure actCadastroExcluirExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actCadastroCancelarExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actCadastroSairExecute(Sender: TObject);
    procedure actCadastroSalvarExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cxGrid1DBTableView1CanFocusRecord(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; var AAllow: Boolean);
    procedure actCadastroExportarExecute(Sender: TObject);
    procedure cxVisualizarPropertiesCloseUp(Sender: TObject);
  private
    { Private declarations }
    procedure Modo;
    procedure SetupClass;
    procedure AtualizarGrid;
    procedure SetupForm;
    procedure ListaMotorista;
  public
    { Public declarations }
  end;

var
  frmRelatorioDiarioOperacional : TfrmRelatorioDiarioOperacional;
  sOperacao                     : String;
  relatorio                     : TRelatorioDiario;
implementation

{$R *.dfm}

uses
  udm, ufrmPrincipal, clUtil, Math, uGlobais;

procedure TfrmRelatorioDiarioOperacional.Modo;
begin
  if sOperacao = 'I' then begin
    actCadastroNovo.Enabled     :=  False;
    actCadastroExcluir.Enabled  :=  False;
    actCadastroCancelar.Enabled :=  True;
    actCadastroSalvar.Enabled   :=  True;
    actCadastroExportar.Enabled :=  False;
  end
  else if sOperacao = 'U' then begin
    actCadastroNovo.Enabled     :=  True;
    actCadastroExcluir.Enabled  :=  True;
    actCadastroCancelar.Enabled :=  True;
    actCadastroSalvar.Enabled   :=  True;
    actCadastroExportar.Enabled :=  True;
  end
  else begin
    actCadastroNovo.Enabled     :=  False;
    actCadastroExcluir.Enabled  :=  False;
    actCadastroCancelar.Enabled :=  True;
    actCadastroSalvar.Enabled   :=  True;
    actCadastroExportar.Enabled :=  False;
  end;
end;

procedure TfrmRelatorioDiarioOperacional.actCadastroCancelarExecute(Sender: TObject);
begin
  TUtil.LimparFields(Self);
  actCadastroNovoExecute(Self);
end;

procedure TfrmRelatorioDiarioOperacional.actCadastroExcluirExecute(Sender: TObject);
begin
  if sOperacao <> 'U' then begin
    Exit;
  end;
  if Application.MessageBox('Confirma Exluir Registro?','Exluir',MB_YESNO + MB_ICONQUESTION) = IDNO then begin
    Exit;
  end;


end;

procedure TfrmRelatorioDiarioOperacional.actCadastroExportarExecute(Sender: TObject);
var
  FileExt: String;
begin
  if not (dm.qryGrid.Active) then begin
    Exit;
  end;
  if dm.qryGrid.IsEmpty then begin
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

procedure TfrmRelatorioDiarioOperacional.actCadastroNovoExecute(Sender: TObject);
begin
  sOperacao :=  'I';
  TUtil.LimparFields(Self);
  cxData.SetFocus;
end;

procedure TfrmRelatorioDiarioOperacional.actCadastroSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmRelatorioDiarioOperacional.actCadastroSalvarExecute(Sender: TObject);
begin
  SetupClass;
  if not (relatorio.Validar()) then begin
    Exit;
  end;
  if Application.MessageBox('Confirma Salvar os dados?','Salvar',MB_YESNO + MB_ICONQUESTION) = IDNO then begin
    Exit;
  end;
  if sOperacao = 'I' then begin
    if not (relatorio.Insert()) then begin
      Application.MessageBox('Erro ao Incluir o Registro!','Atenção!', MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
  end
  else begin
    if not (relatorio.Update()) then begin
      Application.MessageBox('Erro ao Alterar o Registro!','Atenção!', MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
  end;
  Application.MessageBox('Registro Salvo com Sucesso!','Atenção!', MB_OK + MB_ICONINFORMATION);
  AtualizarGrid;
  actCadastroNovoExecute(Self);
end;

procedure TfrmRelatorioDiarioOperacional.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm.qryGrid.Close;
  dm.qryGrid.SQL.Clear;
  relatorio.Free;
  Action                        :=  caFree;
  frmRelatorioDiarioOperacional :=  Nil;
end;

procedure TfrmRelatorioDiarioOperacional.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key = #13 then begin
    if cxGrid1.IsFocused then begin
      Exit;
    end;
    if cxObservacoes.IsFocused then begin
      Exit;
    end;

    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TfrmRelatorioDiarioOperacional.FormShow(Sender: TObject);
begin
  relatorio :=  TRelatorioDiario.Create();
  AtualizarGrid;
  actCadastroNovoExecute(Self);
end;

procedure TfrmRelatorioDiarioOperacional.SetupClass;
begin
  if sOperacao = 'I' then begin
    relatorio.Sequencia       :=  0;
  end;
  relatorio.Data              :=  cxData.Date;
  relatorio.Placa             :=  cxPlaca.Text;
  relatorio.Motorista         :=  cxMotorista.Text;
  relatorio.SaidaOrigem       :=  cxSaidaTFO.Time;
  relatorio.ChegadaFranquia   :=  cxChegadaFranquia.Time;
  relatorio.SaidaFranquia     :=  cxSaidaFranquia.Time;
  relatorio.Expedidores       :=  cxExpedidores.Value;
  relatorio.DivergenciaPeso   :=  cxDivergenciaPeso.Value;
  relatorio.DivergenciaAvaria :=  cxDivergenciaAvarias.Value;
  relatorio.Observacoes       :=  cxObservacoes.Text;
  relatorio.Usuario           :=  uGlobais.sNomeUsuario;
  relatorio.Registro          :=  Now;
  relatorio.Operacao          :=  cxOperacao.Text;
end;

procedure TfrmRelatorioDiarioOperacional.AtualizarGrid;
var
  sMesAno, sData  : String;
  dtData          : TDate;
  iMes, iAno      : Integer;
begin
  iMes  :=  0;
  iAno  :=  0;
  dm.ZConn.PingServer;
  dm.qryGrid.Close;
  dm.qryGrid.SQL.Clear;
  dm.qryGrid.SQL.Add('SELECT * FROM TBRELATORIODIARIO ');
  if cxVisualizar.ItemIndex = 1 then begin
    iMes                                      :=  MonthOf(Now);
    iAno                                      :=  YearOf(Now);
    dm.qryGrid.SQL.Add('WHERE EXTRACT(MONTH FROM DAT_RELATORIO) = :MES AND EXTRACT(YEAR FROM DAT_RELATORIO) = :ANO');
    dm.qryGrid.ParamByName('MES').AsInteger  :=  iMes;
    dm.qryGrid.ParamByName('ANO').AsInteger  :=  iAno;
  end;
  if cxVisualizar.ItemIndex = 2 then begin
    iAno                                      :=  YearOf(Now);
    dm.qryGrid.SQL.Add('WHERE EXTRACT(YEAR FROM DAT_RELATORIO) = :ANO');
    dm.qryGrid.ParamByName('ANO').AsInteger  :=  iAno;
  end;
  if cxVisualizar.ItemIndex = 3 then begin
    iMes    :=  MonthOf(Now);
    iAno    :=  YearOf(Now);
    sData   :=  '01/' + IntToStr(iMes) + '/' + IntToStr(iAno);
    dtData  :=  StrToDate(sData) - 90;
    dm.qryGrid.SQL.Add('WHERE DAT_RELATORIO >= :DATA');
    dm.qryGrid.ParamByName('DATA').AsDate  :=  dtData;
  end;
  if cxVisualizar.ItemIndex = 4 then begin
    iMes    :=  MonthOf(Now);
    iAno    :=  YearOf(Now);
    sData   :=  '01/' + IntToStr(iMes) + '/' + IntToStr(iAno);
    dtData  :=  StrToDate(sData) - 365;
    dm.qryGrid.SQL.Add('WHERE DAT_RELATORIO >= :DATA');
    dm.qryGrid.ParamByName('DATA').AsDate  :=  dtData;
  end;
  dm.ZConn.PingServer;
  dm.qryGrid.Open;
  if not (dm.qryGrid.IsEmpty) then begin
    dm.qryGrid.First;
  end;
end;

procedure TfrmRelatorioDiarioOperacional.cxGrid1DBTableView1CanFocusRecord(Sender: TcxCustomGridTableView;
  ARecord: TcxCustomGridRecord; var AAllow: Boolean);
var
  sCodigo : String;
  i, iRet : Integer;
begin
  AAllow  :=  True;
  if dm.qryGrid.Active then begin
    sCodigo    := ARecord.DisplayTexts[13];
    Val(sCodigo,i,iRet);
    if iRet <> 0 then begin
      TUtil.LimparFields(Self);
      Exit;
    end;
    if relatorio.getObject(sCodigo, 'SEQUENCIA') then begin
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

procedure TfrmRelatorioDiarioOperacional.cxVisualizarPropertiesCloseUp(Sender: TObject);
begin
  AtualizarGrid;
end;

procedure TfrmRelatorioDiarioOperacional.SetupForm;
begin
  cxData.Date                 :=  relatorio.Data;
  cxPlaca.Text                :=  relatorio.Placa;
  cxMotorista.Text            :=  relatorio.Motorista;
  cxSaidaTFO.Time             :=  relatorio.SaidaOrigem;
  cxChegadaFranquia.Time      :=  relatorio.ChegadaFranquia;
  cxSaidaFranquia.Time        :=  relatorio.SaidaFranquia;
  cxExpedidores.Value         :=  relatorio.Expedidores;
  cxDivergenciaPeso.Value     :=  relatorio.DivergenciaPeso;
  cxDivergenciaAvarias.Value  :=  relatorio.DivergenciaAvaria;
  cxObservacoes.Text          :=  relatorio.Observacoes;
  cxRegistro.Text             :=  relatorio.Usuario + ' em ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', relatorio.Registro);
  cxOperacao.Text             :=  relatorio.Operacao;
end;

procedure TfrmRelatorioDiarioOperacional.ListaMotorista;
begin
  with dm.qryGeral do begin
    Close;
    SQL.Clear;
    SQL.Text  :=  'SELECT DISTINCT NOM_MOTORISTA FROM TBRELATORIODIARIO';
    dm.ZConn.PingServer;
    Open;
    if not (IsEmpty) then begin
      First;
    end;
    while not (Eof) do begin
      cxMotorista.Properties.Items.Add(FieldByName('NOM_MOTORISTA').AsString);
      Next;
    end;
    cxMotorista.ItemIndex  :=  -1;
    Close;
    SQL.Clear;
  end;
end;

end.
