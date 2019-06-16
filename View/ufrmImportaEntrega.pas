unit ufrmImportaEntrega;

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
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxLabel, cxTextEdit, cxMaskEdit,
  cxButtonEdit, Menus, ActnList, StdCtrls, cxButtons, DB, dxmdaset, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxCalendar, cxSpinEdit, cxProgressBar, cxListBox, cxMemo, cxImage,
  Vcl.ExtCtrls, uthrImportarEntregas, clCliente,
  uthrImportarAero, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, System.Actions, clConexao, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmImportaEntregas = class(TForm)
    cxLabel1: TcxLabel;
    cxArquivo: TcxButtonEdit;
    aclImportaEntrega: TActionList;
    actImportarEntregaImportar: TAction;
    cxButton2: TcxButton;
    actImportaEntregaSair: TAction;
    cxButton3: TcxButton;
    OpenDialog1: TOpenDialog;
    cxProgressBar1: TcxProgressBar;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLog: TcxMemo;
    cxButton1: TcxButton;
    actImportaEntregaCancelar: TAction;
    cxLabel4: TcxLabel;
    cxCliente: TcxButtonEdit;
    cxNomeCliente: TcxTextEdit;
    actImportarEntregasApoio: TAction;
    cxLabel27: TcxLabel;
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actImportarEntregaImportarExecute(Sender: TObject);
    procedure actImportaEntregaSairExecute(Sender: TObject);
    procedure actImportaEntregaCancelarExecute(Sender: TObject);
    procedure cxClientePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure FormShow(Sender: TObject);
    procedure actImportarEntregasApoioExecute(Sender: TObject);
  private
    { Private declarations }
    procedure ListaClientes;
  public
    { Public declarations }
  end;

var
  frmImportaEntregas: TfrmImportaEntregas;
  thrEntrega: thrImportarEntregas;
  cliente: TCliente;
  thrAero: thrImportarAero;
  conexao: TConexao;

implementation

{$R *.dfm}

uses
  udm, ufrmPrincipal, clUtil, Math, ufrmListaApoio;

procedure TfrmImportaEntregas.cxButtonEdit1PropertiesButtonClick
  (Sender: TObject; AButtonIndex: Integer);
begin
  if OpenDialog1.Execute then
  begin
    cxArquivo.Text := OpenDialog1.FileName;
  end;
end;

procedure TfrmImportaEntregas.cxClientePropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if TUtil.Empty(cxCliente.Text) then
  begin
    cxCliente.Text := '0';
  end;
  if cliente.getObject(cxCliente.Text, 'CODIGO') then
  begin
    cxNomeCliente.Text := cliente.Razao;
  end
  else
  begin
    cxNomeCliente.Text := '';
  end;
end;

procedure TfrmImportaEntregas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cliente.Free;
  conexao.Free;
  Action := caFree;
  frmImportaEntregas := Nil;
end;

procedure TfrmImportaEntregas.FormShow(Sender: TObject);
begin
  cliente := TCliente.Create;
  conexao := TConexao.Create;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    actImportaEntregaSairExecute(Sender);
    Exit;
  end;
end;

procedure TfrmImportaEntregas.actImportarEntregaImportarExecute
  (Sender: TObject);
begin
  if TUtil.Empty(cxArquivo.Text) then
  begin
    MessageDlg('Informe o nome do arquivo.', mtWarning, [mbOK], 0);
    Exit;
  end;
  if not FileExists(cxArquivo.Text) then
  begin
    MessageDlg('Arquivo informado não foi encontrado!', mtWarning, [mbOK], 0);
    Exit;
  end;
  if TUtil.Empty(cxCliente.Text) then
  begin
    Application.MessageBox('Informe o Código do Cliente.', 'Atenção',
      MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if Application.MessageBox('Confirma a importação dos dados?',
    'Importar Entregas', MB_ICONQUESTION + MB_YESNO) = IDNO then
  begin
    Exit;
  end;

  cxLog.Lines.Add('Início da Importação: ' + DateTimeToStr(Now));
  cxLog.Refresh;
  cxLog.Lines.Add('Importando o arquivo ' + cxArquivo.Text);
  cxLog.Refresh;
  cxProgressBar1.Clear;
  if StrToInt(cxCliente.Text) = 99991 then
  begin
    thrAero := thrImportarAero.Create(True);
    thrAero.FreeOnTerminate := True;
    thrAero.Priority := tpNormal;
    thrAero.Start;
  end
  else
  begin
    thrEntrega := thrImportarEntregas.Create(True);
    thrEntrega.FreeOnTerminate := True;
    thrEntrega.Priority := tpNormal;
    thrEntrega.Start;
  end;

end;

procedure TfrmImportaEntregas.actImportarEntregasApoioExecute(Sender: TObject);
begin
  if cxCliente.IsFocused then
  begin
    ListaClientes;
  end;
end;

procedure TfrmImportaEntregas.actImportaEntregaCancelarExecute(Sender: TObject);
begin
  thrEntrega.Terminate;
end;

procedure TfrmImportaEntregas.actImportaEntregaSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmImportaEntregas.ListaClientes;
var
  sId: String;
begin
  sId := Trim(cxCliente.Text);
  with dm.qryPesquisa do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT COD_CLIENTE AS "Código", NOM_CLIENTE AS "Nome" ' +
      'FROM tbclientes ';
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
  frmListaApoio.Caption := 'Clientes';
  if frmListaApoio.ShowModal = mrOk then
  begin
    cxCliente.Text := dm.qryPesquisa.Fields[0].AsString;
    cxCliente.Refresh;
    cxNomeCliente.Text := dm.qryPesquisa.Fields[1].AsString;
    cxNomeCliente.Refresh;
  end;
  dm.qryPesquisa.Close;
  FreeAndNil(frmListaApoio);
end;

end.
