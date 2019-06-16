unit ufrmManutencaoRestricoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, clAgentes, clCodigosEntregadores,
  clExtravios, clRestricoes, clUtil, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans,
  dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, Data.DB, cxDBData, cxContainer, cxLabel, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxCurrencyEdit,
  dxSkinsdxStatusBarPainter, cxProgressBar, dxStatusBar,
  uthrPopularRestricoes, cxTextEdit, cxCheckBox, System.Actions, Vcl.ActnList,
  Vcl.Menus, Vcl.StdCtrls, cxButtons,
  cxGridExportLink, ShellAPI, cxCalc, clConexao;

type
  TfrmManutencaoRestricoes = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxLabel27: TcxLabel;
    dsRestricoes: TDataSource;
    cxGrid1DBTableView1NOM_AGENTE: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_ENTREGADOR: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_RESTRICAO: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_PAGO: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_DEBITAR: TcxGridDBColumn;
    dxStatusBar1: TdxStatusBar;
    dxStatusBar1Container0: TdxStatusBarContainerControl;
    cxProgressBar: TcxProgressBar;
    cxAgenteAtivo: TcxCheckBox;
    aclManutencaoRestricoes: TActionList;
    actManutencaoRestricoesSair: TAction;
    cxButton1: TcxButton;
    actManutencaoRestricoesExtravios: TAction;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    actManutencaoRestricoesDebitos: TAction;
    cxButton4: TcxButton;
    actManutencaoRestricoesExportar: TAction;
    SaveDialog: TSaveDialog;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxAgenteAtivoPropertiesChange(Sender: TObject);
    procedure actManutencaoRestricoesSairExecute(Sender: TObject);
    procedure actManutencaoRestricoesExtraviosExecute(Sender: TObject);
    procedure cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure actManutencaoRestricoesDebitosExecute(Sender: TObject);
    procedure cxGrid1DBTableView1VAL_DEBITARPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure actManutencaoRestricoesExportarExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    procedure AtualizaGrid;
    procedure ExportarGrade;
    procedure PopularExtravios;
    procedure PopulaDebitos;
    function SalvaDebito(dValor: Double): Boolean;
  public
    { Public declarations }
  end;

var
  frmManutencaoRestricoes: TfrmManutencaoRestricoes;
  thrrestricao: thrPopularRestricoes;
  restricao: TRestricoes;
  conexao: TConexao;

implementation

{$R *.dfm}

uses udm, uGlobais, ufrmDetalhesRestricoes, ufrmDebitosRestricoes;

procedure TfrmManutencaoRestricoes.cxAgenteAtivoPropertiesChange
  (Sender: TObject);
begin
  AtualizaGrid;
end;

procedure TfrmManutencaoRestricoes.cxGrid1DBTableView1CellDblClick
  (Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  if cxGrid1DBTableView1VAL_RESTRICAO.Focused then
  begin
    actManutencaoRestricoesExtraviosExecute(Sender);
  end
  else if cxGrid1DBTableView1VAL_PAGO.Focused then
  begin
    actManutencaoRestricoesDebitosExecute(Sender);
  end;
end;

procedure TfrmManutencaoRestricoes.
  cxGrid1DBTableView1VAL_DEBITARPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if DisplayValue <= dm.tbRestricoesVAL_RESTRICAO.Value then
  begin
    Error := (not SalvaDebito(DisplayValue));
    ErrorText := 'Débito não foi gravado!';
  end
  else
  begin
    ErrorText := 'Valor do débito é maior que o saldo da restrição!';
    Error := True;
  end;
end;

procedure TfrmManutencaoRestricoes.FormActivate(Sender: TObject);
begin
  AtualizaGrid;
end;

procedure TfrmManutencaoRestricoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  restricao.Free;
  conexao.Free;
  dm.tbRestricoes.Close;
  Action := caFree;
  frmManutencaoRestricoes := Nil;
end;

procedure TfrmManutencaoRestricoes.FormShow(Sender: TObject);
begin
  restricao := TRestricoes.Create;
  conexao := TConexao.Create;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    actManutencaoRestricoesSairExecute(Sender);
    Exit;
  end;

end;

procedure TfrmManutencaoRestricoes.actManutencaoRestricoesDebitosExecute
  (Sender: TObject);
begin
  PopulaDebitos;
end;

procedure TfrmManutencaoRestricoes.actManutencaoRestricoesExportarExecute
  (Sender: TObject);
begin
  ExportarGrade;
end;

procedure TfrmManutencaoRestricoes.actManutencaoRestricoesExtraviosExecute
  (Sender: TObject);
begin
  PopularExtravios;
end;

procedure TfrmManutencaoRestricoes.actManutencaoRestricoesSairExecute
  (Sender: TObject);
begin
  try
    Perform(WM_CLOSE, 0, 0);
  except
    on E: Exception do
      MessageDlg(E.Message, mtError, mbOKCancel, 0);
  end;
end;

procedure TfrmManutencaoRestricoes.AtualizaGrid;
begin
  uGlobais.bFlagAtivo := cxAgenteAtivo.Checked;
  dsRestricoes.Enabled := False;
  thrrestricao := thrPopularRestricoes.Create(True);
  thrrestricao.FreeOnTerminate := True;
  thrrestricao.Priority := tpNormal;
  thrrestricao.Start;
end;

procedure TfrmManutencaoRestricoes.ExportarGrade;
var
  FileExt: String;
begin
  if not(dm.tbRestricoes.Active) then
  begin
    Exit;
  end;
  if dm.tbRestricoes.IsEmpty then
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
    ShellExecute(Handle, 'open', pchar(SaveDialog.FileName), nil, nil, SW_SHOW);
  end;
end;

procedure TfrmManutencaoRestricoes.PopularExtravios;
begin
  if not Assigned(frmDetalhesRestricoes) then
  begin
    frmDetalhesRestricoes := TfrmDetalhesRestricoes.Create(Application);
  end;
  frmDetalhesRestricoes.sCodEntregadores :=
    dm.tbRestricoesCOD_ENTREGADOR.AsString;
  frmDetalhesRestricoes.sTipo := dm.tbRestricoesDOM_RESTRICAO.AsString;
  frmDetalhesRestricoes.ShowModal;
end;

procedure TfrmManutencaoRestricoes.PopulaDebitos;
begin
  if not Assigned(frmDebitosRestricoes) then
  begin
    frmDebitosRestricoes := TfrmDebitosRestricoes.Create(Application);
  end;
  frmDebitosRestricoes.sEntregador := dm.tbRestricoesCOD_ENTREGADOR.AsString;
  frmDebitosRestricoes.ShowModal;
end;

function TfrmManutencaoRestricoes.SalvaDebito(dValor: Double): Boolean;
begin
  Result := False;
  if restricao.getObject(dm.tbRestricoesCOD_RESTRICAO.AsString, 'CODIGO') then
  begin
    restricao.Debitar := dValor;
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
    if (not restricao.Update()) then
    begin
      Application.MessageBox('Erro ao tentar gravar o valor do débito!',
        'Atenção!', MB_ICONEXCLAMATION + MB_OK);
      Exit;
    end;
  end
  else
  begin
    Application.MessageBox('Erro ao tentar localizar a restrição!', 'Atenção!',
      MB_ICONEXCLAMATION + MB_OK);
    Exit;
  end;
  Result := True;
end;

end.
