unit ufrmImportaBaixas;

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
  cxTextEdit, cxMaskEdit, cxButtonEdit, Menus,
  ActnList, StdCtrls, cxButtons, DB, dxmdaset, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxCalendar,
  cxSpinEdit, cxProgressBar, cxListBox, cxMemo, clVerbaCEP, cxImage,
  Vcl.ExtCtrls, uthrImportarBaixas, clEntrega,
  clCodigosEntregadores, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, System.Actions, clConexao, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, Model.ControleBaixasTFO, DAO.ControleBaixasTFO,
  Generics.Collections;

type

  TfrmImportaBaixas = class(TForm)
    cxLabel1: TcxLabel;
    cxArquivo: TcxButtonEdit;
    aclImportaBaixa: TActionList;
    actImportarBaixaImportar: TAction;
    cxButton2: TcxButton;
    actImportaBaixaSair: TAction;
    cxButton3: TcxButton;
    OpenDialog1: TOpenDialog;
    cxProgressBar1: TcxProgressBar;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLog: TcxMemo;
    actImportarBaixaCancelar: TAction;
    cxButton1: TcxButton;
    cxLabel27: TcxLabel;
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actImportarBaixaImportarExecute(Sender: TObject);
    procedure actImportaBaixaSairExecute(Sender: TObject);
    procedure actImportarBaixaCancelarExecute(Sender: TObject);
    procedure SalvaAgente;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImportaBaixas: TfrmImportaBaixas;
  thrBaixa: thrImportaBaixas;
  entrega: TEntrega;
  entregador: TCodigosEntregadores;
  conexao: TConexao;
  controle : TControleBaixasTFO;
  controleDAO : TControleBaixaTFODAO;
  controles : TObjectList<TControleBaixasTFO>;


implementation

{$R *.dfm}

uses
  udm, ufrmPrincipal, clUtil, Math, DateUtils;

procedure TfrmImportaBaixas.cxButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  if OpenDialog1.Execute then
    cxArquivo.Text := OpenDialog1.FileName;
end;

procedure TfrmImportaBaixas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  entrega.Free;
  entregador.Free;
  conexao.Free;
  Action := caFree;
  frmImportaBaixas := Nil;
end;

procedure TfrmImportaBaixas.FormShow(Sender: TObject);
begin
  entrega := TEntrega.Create;
  entregador := TCodigosEntregadores.Create;
  conexao := TConexao.Create;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    actImportaBaixaSairExecute(Sender);
    Exit;
  end;

end;

procedure TfrmImportaBaixas.actImportarBaixaCancelarExecute(Sender: TObject);
begin
  thrBaixa.Terminate;
end;

procedure TfrmImportaBaixas.actImportarBaixaImportarExecute(Sender: TObject);
begin

  { SalvaAgente;
    Exit; }

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

  if Application.MessageBox('Confirma a importação das Baixas?',
    'Importar Baixas', MB_ICONQUESTION + MB_YESNO) = IDNO then
    Exit;

  cxLog.Lines.Add('Início da Importação: ' + DateTimeToStr(Now));
  cxLog.Refresh;
  cxLog.Lines.Add('Importando o arquivo ' + cxArquivo.Text);
  cxLog.Refresh;
  cxProgressBar1.Clear;
  thrBaixa := thrImportaBaixas.Create(True);
  thrBaixa.FreeOnTerminate := True;
  thrBaixa.Priority := tpNormal;
  thrBaixa.Start;

end;

procedure TfrmImportaBaixas.actImportaBaixaSairExecute(Sender: TObject);
begin
  dm.qryGetObject.Close;
  dm.qryGetObject.SQL.Clear;
  Close;
end;

procedure TfrmImportaBaixas.SalvaAgente;
var
  iAgente, iTotal: Integer;
begin
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  dm.qryPesquisa.SQL.Add
    ('SELECT * FROM tbentregas WHERE DAT_BAIXA >= :DATA AND DOM_BAIXADO = :BAIXADO');
  dm.qryPesquisa.ParamByName('DATA').AsDate := StrToDate('11/11/2014');
  dm.qryPesquisa.ParamByName('BAIXADO').AsString := 'S';
  dm.qryPesquisa.Open;
  iAgente := 0;
  if (not dm.qryPesquisa.IsEmpty) then
  begin
    iTotal := dm.qryPesquisa.RecordCount;
    dm.qryPesquisa.First;
  end;
  while (not dm.qryPesquisa.Eof) do
  begin
    if entregador.getObject(dm.qryPesquisa.FieldByName('COD_ENTREGADOR')
      .AsString, 'CODIGO') then
    begin
      iAgente := entregador.Agente;
      if entrega.getObject(dm.qryPesquisa.FieldByName('NUM_NOSSONUMERO')
        .AsString, 'NOSSONUMERO') then
      begin
        entrega.Agente := iAgente;
        if (not entrega.Update()) then
        begin
          Application.MessageBox('Erro', 'Erro', MB_OK + MB_ICONERROR);
        end;
      end;
    end;
    cxLabel6.Caption := IntToStr(dm.qryPesquisa.RecNo) + ' de ' +
      IntToStr(iTotal);
    cxLabel6.Refresh;
    dm.qryPesquisa.Next
  end;
  Application.MessageBox('Pronto', 'Pronto', MB_OK + MB_ICONERROR);
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
end;

end.
