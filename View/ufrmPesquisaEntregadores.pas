unit ufrmPesquisaEntregadores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, clEntregador, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin,
  dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxSkinsdxStatusBarPainter, cxContainer, cxEdit, cxProgressBar, dxStatusBar,
  cxGroupBox, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  Vcl.ActnList, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  uthrPopularEntregadores, cxCheckBox, cxImageComboBox, cxLabel,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, System.Actions, clAcessos,
  uthrPopularEntregadoresVencidos, cxGridExportLink,
  ShellAPI, clConexao, cxTextEdit, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmPesquisaEntregadores = class(TForm)
    dxStatusBar1: TdxStatusBar;
    dxStatusBar1Container0: TdxStatusBarContainerControl;
    cxProgressBar: TcxProgressBar;
    cxGroupBox1: TcxGroupBox;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    ds: TDataSource;
    cxGrid1DBTableView1NOM_AGENTE: TcxGridDBColumn;
    cxGrid1DBTableView1COD_ENTREGADOR: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_ENTREGADOR: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_GV: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_CNH: TcxGridDBColumn;
    aclPesquisa: TActionList;
    actPesquisaSelecionar: TAction;
    actPesquisaNovo: TAction;
    actPesquisaSair: TAction;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxGrid1DBTableView1COD_AGENTE: TcxGridDBColumn;
    cxGrid1DBTableView1COD_CADASTRO: TcxGridDBColumn;
    cxAgenteAtivo: TcxCheckBox;
    cxEntregadoresAtivos: TcxCheckBox;
    cxGrid1DBTableView1COD_STATUS: TcxGridDBColumn;
    actPesquisaAtualizar: TAction;
    cxButton4: TcxButton;
    cxGrid1DBTableView1DES_ENTREGADOR: TcxGridDBColumn;
    cxDetalhes: TcxCheckBox;
    cxLabel52: TcxLabel;
    cxGrid1DBTableView1NUM_CPF: TcxGridDBColumn;
    actPesquisaVeicidos: TAction;
    cxButton5: TcxButton;
    acPesquisaExportar: TAction;
    SaveDialog: TSaveDialog;
    cxButton6: TcxButton;
    cxGrid1DBTableView1RecId: TcxGridDBColumn;
    cxGrid1DBTableView1ANO_EXERCICIO_CLRV: TcxGridDBColumn;
    cxGrid1DBTableView1DES_PLACA: TcxGridDBColumn;
    cxGrid1DBTableView1DES_MODELO: TcxGridDBColumn;
    cxGrid1DBTableView1DOM_FUNCIONARIO: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actPesquisaSairExecute(Sender: TObject);
    procedure actPesquisaSelecionarExecute(Sender: TObject);
    procedure actPesquisaNovoExecute(Sender: TObject);
    procedure cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxAgenteAtivoClick(Sender: TObject);
    procedure cxEntregadoresAtivosClick(Sender: TObject);
    procedure actPesquisaAtualizarExecute(Sender: TObject);
    procedure cxDetalhesPropertiesChange(Sender: TObject);
    procedure actPesquisaVeicidosExecute(Sender: TObject);
    procedure acPesquisaExportarExecute(Sender: TObject);
  private
    { Private declarations }
    procedure AtualizaGrid;
    procedure AtualizaVencidos;
  public
    { Public declarations }
  end;

var
  frmPesquisaEntregadores: TfrmPesquisaEntregadores;
  thrPesquisa: thrPopularEntregadores;
  thrPesquisaVencida: thrPopularEntregadoresVencidos;
  acessos: TAcessos;
  conexao: TConexao;

implementation

{$R *.dfm}

uses
  udm, uGlobais, clUtil, ufrmEntregadoresFuncionarios;

procedure TfrmPesquisaEntregadores.acPesquisaExportarExecute(Sender: TObject);
var
  FileExt, sFile: String;
begin
  if not(dm.tbPesquisaEntregador.Active) then
  begin
    Exit;
  end;
  if dm.tbPesquisaEntregador.IsEmpty then
  begin
    Exit;
  end;
  sFile := 'pesquisa_entregador';
  SaveDialog.FileName := sFile;
  SaveDialog.Filter := '';
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

procedure TfrmPesquisaEntregadores.actPesquisaAtualizarExecute(Sender: TObject);
begin
  AtualizaGrid;
end;

procedure TfrmPesquisaEntregadores.actPesquisaNovoExecute(Sender: TObject);
begin
  if not Assigned(frmEntregadoresFuncionarios) then
  begin
    frmEntregadoresFuncionarios := TfrmEntregadoresFuncionarios.Create
      (Application);
  end;
  frmEntregadoresFuncionarios.iCodigo := 0;
  frmEntregadoresFuncionarios.ShowModal;
end;

procedure TfrmPesquisaEntregadores.actPesquisaSairExecute(Sender: TObject);
begin
  frmPesquisaEntregadores.Close;
end;

procedure TfrmPesquisaEntregadores.actPesquisaSelecionarExecute
  (Sender: TObject);
begin
  if not Assigned(frmEntregadoresFuncionarios) then
  begin
    frmEntregadoresFuncionarios := TfrmEntregadoresFuncionarios.Create
      (Application);
  end;
  frmEntregadoresFuncionarios.iCodigo :=
    cxGrid1DBTableView1COD_CADASTRO.DataBinding.Field.AsInteger;
  frmEntregadoresFuncionarios.ShowModal;
end;

procedure TfrmPesquisaEntregadores.actPesquisaVeicidosExecute(Sender: TObject);
begin
  AtualizaVencidos
end;

procedure TfrmPesquisaEntregadores.AtualizaGrid;
begin
  cxDetalhes.Checked := False;
  ds.Enabled := False;
  thrPesquisa := thrPopularEntregadores.Create(True);
  thrPesquisa.FreeOnTerminate := True;
  thrPesquisa.Priority := tpNormal;
  thrPesquisa.Start;
  acessos.SetNivel(aclPesquisa);
end;

procedure TfrmPesquisaEntregadores.cxAgenteAtivoClick(Sender: TObject);
begin
  AtualizaGrid;
end;

procedure TfrmPesquisaEntregadores.cxDetalhesPropertiesChange(Sender: TObject);
begin
  if cxDetalhes.Checked then
  begin
    cxGrid1DBTableView1.ViewData.Expand(True);
  end
  else
  begin
    cxGrid1DBTableView1.ViewData.Collapse(True);
  end;
end;

procedure TfrmPesquisaEntregadores.cxEntregadoresAtivosClick(Sender: TObject);
begin
  AtualizaGrid;
end;

procedure TfrmPesquisaEntregadores.cxGrid1DBTableView1CellDblClick
  (Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  actPesquisaSelecionarExecute(Sender);
end;

procedure TfrmPesquisaEntregadores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  acessos.Free;
  conexao.Free;
  Action := caFree;
  frmPesquisaEntregadores := Nil;
end;

procedure TfrmPesquisaEntregadores.FormShow(Sender: TObject);
begin
  acessos := TAcessos.Create;
  conexao := TConexao.Create;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    actPesquisaSairExecute(Sender);
    Exit;
  end;
  AtualizaGrid;
  if (not dm.tbPesquisaEntregador.IsEmpty) then
  begin
    dm.tbPesquisaEntregador.First;
  end;

end;

procedure TfrmPesquisaEntregadores.AtualizaVencidos;
begin
  cxDetalhes.Checked := False;
  ds.Enabled := False;
  thrPesquisaVencida := thrPopularEntregadoresVencidos.Create(True);
  thrPesquisaVencida.FreeOnTerminate := True;
  thrPesquisaVencida.Priority := tpNormal;
  thrPesquisaVencida.Start;
  acessos.SetNivel(aclPesquisa);
end;

end.
