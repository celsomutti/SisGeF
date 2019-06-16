unit ufrmPlanilhaCredito;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans,
  dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp,
  dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, cxLabel,
  cxImage, ExtCtrls, DB, dxmdaset, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, ActnList,
  Menus, StdCtrls, cxButtons, clAgentes, clEntregador, clBancos,
  clPlanilhaCredito, cxGridExportLink, ShellAPI, cxNavigator,
  Vcl.ComCtrls, dxCore, cxDateUtils, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, System.Actions, clAcessos, cxCurrencyEdit, clConexao;

type
  TfrmPlanilhaCredito = class(TForm)
    tbPlanilha: TdxMemData;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxLabel1: TcxLabel;
    cxDataInicial: TcxDateEdit;
    cxLabel2: TcxLabel;
    cxDataFinal: TcxDateEdit;
    ds: TDataSource;
    cxGrid1DBTableView1SEQ_CREDITO: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_PAGO: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_EXTRATO: TcxGridDBColumn;
    cxGrid1DBTableView1COD_AGENTE: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_AGENTE: TcxGridDBColumn;
    cxGrid1DBTableView1COD_ENTREGADOR: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_ENTREGADOR: TcxGridDBColumn;
    cxGrid1DBTableView1DES_TIPO_CONTA: TcxGridDBColumn;
    cxGrid1DBTableView1COD_BANCO: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_BANCO: TcxGridDBColumn;
    cxGrid1DBTableView1COD_AGENCIA: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_CONTA: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_FAVORECIDO: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_CPF_CNPJ_FAVORECIDO: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_CREDITO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_TIPO_PAGAMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_EXECUTOR: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_MANUTENCAO: TcxGridDBColumn;
    aclPlanilha: TActionList;
    actPlanilhaProcessar: TAction;
    actPlanilhaExportar: TAction;
    SaveDialog: TSaveDialog;
    actPlanilhaSair: TAction;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxLabel27: TcxLabel;
    cxGrid1DBTableView1DES_SERVICO: TcxGridDBColumn;
    tbPlanilhaSEQ_CREDITO: TIntegerField;
    tbPlanilhaDAT_PAGO: TDateField;
    tbPlanilhaNUM_EXTRATO: TWideStringField;
    tbPlanilhaCOD_AGENTE: TIntegerField;
    tbPlanilhaNOM_AGENTE: TWideStringField;
    tbPlanilhaCOD_ENTREGADOR: TIntegerField;
    tbPlanilhaNOM_ENTREGADOR: TWideStringField;
    tbPlanilhaDES_SERVICO: TWideStringField;
    tbPlanilhaDES_TIPO_CONTA: TWideStringField;
    tbPlanilhaCOD_BANCO: TWideStringField;
    tbPlanilhaNOM_BANCO: TWideStringField;
    tbPlanilhaCOD_AGENCIA: TWideStringField;
    tbPlanilhaNUM_CONTA: TWideStringField;
    tbPlanilhaNOM_FAVORECIDO: TWideStringField;
    tbPlanilhaNUM_CPF_CNPJ_FAVORECIDO: TWideStringField;
    tbPlanilhaVAL_CREDITO: TFloatField;
    tbPlanilhaDES_TIPO_PAGAMENTO: TWideStringField;
    tbPlanilhaNOM_EXECUTOR: TWideStringField;
    tbPlanilhaDAT_MANUTENCAO: TDateTimeField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actPlanilhaExportarExecute(Sender: TObject);
    procedure actPlanilhaProcessarExecute(Sender: TObject);
    procedure actPlanilhaSairExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AtualizaGrid;
  end;

var
  frmPlanilhaCredito: TfrmPlanilhaCredito;
  agente: TAgente;
  entregador: TEntregador;
  bancos: TBancos;
  planilha: TPlanilhaCredito;
  acessos: TAcessos;
  conexao: TConexao;

implementation

{$R *.dfm}

uses
  udm, ufrmPrincipal, clUtil, uGlobais;

procedure TfrmPlanilhaCredito.FormShow(Sender: TObject);
begin
  agente := TAgente.Create();
  entregador := TEntregador.Create();
  bancos := TBancos.Create();
  planilha := TPlanilhaCredito.Create();
  acessos := TAcessos.Create;
  conexao := TConexao.Create;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    actPlanilhaSairExecute(Sender);
    Exit;
  end;
  cxDataInicial.SetFocus;
end;

procedure TfrmPlanilhaCredito.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  agente.Free;
  entregador.Free;
  bancos.Free;
  planilha.Free;
  acessos.Free;
  conexao.Free;
  Action := caFree;
  frmPlanilhaCredito := Nil;
end;

procedure TfrmPlanilhaCredito.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then
  begin
    if cxGrid1.IsFocused then
    begin
      Exit;
    end;
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfrmPlanilhaCredito.AtualizaGrid;
begin
  if TUtil.Empty(cxDataInicial.Text) or (cxDataInicial.Date = 0) then
  begin
    MessageDlg('Informe a data incial do período de pagamento.', mtWarning,
      [mbOK], 0);
    cxDataInicial.SetFocus;
    Exit;
  end;
  if TUtil.Empty(cxDataFinal.Text) or (cxDataFinal.Date = 0) then
  begin
    MessageDlg('Informe a data final do período de pagamento.', mtWarning,
      [mbOK], 0);
    cxDataFinal.SetFocus;
    Exit;
  end;
  if cxDataInicial.Date > cxDataFinal.Date then
  begin
    MessageDlg
      ('A data inicial do período não pode ser maior que a data final! Verifique.',
      mtWarning, [mbOK], 0);
    cxDataInicial.SetFocus;
    Exit;
  end;
  if tbPlanilha.Active then
  begin
    tbPlanilha.Close;
  end;
  cxGrid1DBTableView1.OptionsView.NoDataToDisplayInfoText :=
    'Pesquisando/Atualizando o Grid. Aguarde...';
  cxGrid1.Refresh;
  tbPlanilha.Open;
  if planilha.Periodo(cxDataInicial.Text, cxDataFinal.Text) then
  begin
    tbPlanilha.IsLoading := True;
    tbPlanilha.LoadFromDataSet(dm.qryGeral);
    { with dm.qryGeral do begin
      while not (Eof) do begin
      if FieldByName('VAL_CREDITO').AsFloat > 0 then begin
      tbPlanilha.Insert;
      tbPlanilhaSEQ_CREDITO.AsInteger             :=  FieldByName('SEQ_CREDITO').AsInteger;
      tbPlanilhaDAT_PAGO.AsDateTime               :=  FieldByName('DAT_PAGO').AsDateTime;
      tbPlanilhaNUM_EXTRATO.AsString              :=  FieldByName('NUM_EXTRATO').AsString;
      tbPlanilhaCOD_AGENTE.AsInteger              :=  FieldByName('COD_AGENTE').AsInteger;
      tbPlanilhaCOD_ENTREGADOR.AsInteger          :=  FieldByName('COD_ENTREGADOR').AsInteger;
      tbPlanilhaDES_TIPO_CONTA.AsString           :=  FieldByName('DES_TIPO_CONTA').AsString;
      tbPlanilhaCOD_BANCO.AsString                :=  FieldByName('COD_BANCO').AsString;
      tbPlanilhaCOD_AGENCIA.AsString              :=  FieldByName('COD_AGENCIA').AsString;
      tbPlanilhaNUM_CONTA.AsString                :=  FieldByName('NUM_CONTA').AsString;
      tbPlanilhaNOM_FAVORECIDO.AsString           :=  FieldByName('NOM_FAVORECIDO').AsString;
      tbPlanilhaNUM_CPF_CNPJ_FAVORECIDO.AsString  :=  FieldByName('NUM_CPF_CNPJ_FAVORECIDO').AsString;
      tbPlanilhaVAL_CREDITO.AsFloat               :=  FieldByName('VAL_CREDITO').AsFloat;
      tbPlanilhaDES_TIPO_PAGAMENTO.AsString       :=  FieldByName('DES_TIPO_PAGAMENTO').AsString;
      tbPlanilhaNOM_EXECUTOR.AsString             :=  FieldByName('NOM_EXECUTOR').AsString;
      tbPlanilhaDAT_MANUTENCAO.AsDateTime         :=  FieldByName('DAT_MANUTENCAO').AsDateTime;
      bancos.Codigo                               :=  FieldByName('COD_BANCO').AsString;
      agente.Codigo                               :=  FieldByName('COD_AGENTE').AsString;
      entregador.Cadastro                         :=  FieldByName('COD_ENTREGADOR').AsInteger;
      tbPlanilhaNOM_BANCO.AsString                :=  bancos.getField('NOM_BANCO','CODIGO');
      tbPlanilhaNOM_AGENTE.AsString               :=  agente.getField('NOM_FANTASIA','CODIGO');
      tbPlanilhaNOM_ENTREGADOR.AsString           :=  entregador.getField('DES_RAZAO_SOCIAL','CADASTRO');
      tbPlanilha.Post;
      end;
      Next;
      end;
      tbplanilha.IsLoading  :=  False;
      Close;
      SQL.Clear;
      end; }
  end;
  cxGrid1DBTableView1.OptionsView.NoDataToDisplayInfoText :=
    'Nenhuma Informação Disponível';
  cxGrid1.Refresh;
  if tbPlanilha.IsEmpty then
  begin
    tbPlanilha.Close;
    Exit;
  end;
  tbPlanilha.First;
  acessos.SetNivel(aclPlanilha);
end;

procedure TfrmPlanilhaCredito.actPlanilhaExportarExecute(Sender: TObject);
var
  FileExt: String;
begin
  if not(tbPlanilha.Active) then
  begin
    Exit;
  end;
  if tbPlanilha.IsEmpty then
  begin
    Exit;
  end;
  SaveDialog.Filter :=
    'Excel (*.xls) |*.xls|XML (*.xml) |*.xml|Arquivo Texto (*.txt) |*.txt|Página Web (*.html)|*.html';
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

procedure TfrmPlanilhaCredito.actPlanilhaProcessarExecute(Sender: TObject);
begin
  AtualizaGrid;
end;

procedure TfrmPlanilhaCredito.actPlanilhaSairExecute(Sender: TObject);
begin
  Close;
end;

end.
