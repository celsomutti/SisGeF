unit ufrmImportaAbastacimentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp,
  dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  cxLabel, cxTextEdit, cxMaskEdit, cxButtonEdit, Menus, ActnList, StdCtrls,
  cxButtons, DB, dxmdaset, cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxCalendar, cxSpinEdit, clVeiculos,
  clAbastecimentos,
  cxProgressBar, cxListBox, cxDropDownEdit, cxMemo, clEntregador, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxImage, Vcl.ExtCtrls,
  DateUtils, uthrImportarAbastecimentosJatinho, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, System.Actions, clConexao;

type
  TfrmImportaAbastecimentos = class(TForm)
    cxLabel1: TcxLabel;
    cxArquivo: TcxButtonEdit;
    aclImportarAbastecimento: TActionList;
    actImportarAbastecimentosImportar: TAction;
    cxButton2: TcxButton;
    actImportaAbastecimentosSair: TAction;
    cxButton3: TcxButton;
    OpenDialog1: TOpenDialog;
    cxProgressBar1: TcxProgressBar;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLog: TcxMemo;
    actImportarAbastecimetosCancelar: TAction;
    cxButton1: TcxButton;
    cxLabel16: TcxLabel;
    cxLabel2: TcxLabel;
    cxDataBase: TcxDateEdit;
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actImportarAbastecimentosImportarExecute(Sender: TObject);
    procedure actImportaAbastecimentosSairExecute(Sender: TObject);
    procedure actImportarAbastecimetosCancelarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImportaAbastecimentos: TfrmImportaAbastecimentos;
  thrAbastecimento: thrImportaAbastecimentosJatinho;
  conexao: TConexao;

implementation

{$R *.dfm}

uses
  udm, ufrmPrincipal, clUtil, Math, uGlobais;

procedure TfrmImportaAbastecimentos.cxButtonEdit1PropertiesButtonClick
  (Sender: TObject; AButtonIndex: Integer);
begin
  if OpenDialog1.Execute then
    cxArquivo.Text := OpenDialog1.FileName;
end;

procedure TfrmImportaAbastecimentos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  conexao.Free;
  Action := caFree;
  frmImportaAbastecimentos := Nil;
end;

procedure TfrmImportaAbastecimentos.FormShow(Sender: TObject);
begin
  conexao := TConexao.Create;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    actImportaAbastecimentosSairExecute(Sender);
    Exit;
  end;
end;

procedure TfrmImportaAbastecimentos.actImportarAbastecimentosImportarExecute
  (Sender: TObject);
begin
  if TUtil.Empty(cxArquivo.Text) then
  begin
    Application.MessageBox('Informe o arquivo de origem.', 'Atenção!',
      MB_OK + MB_ICONEXCLAMATION);
    cxArquivo.SetFocus;
    Exit;
  end;
  if TUtil.Empty(cxDataBase.Text) then
  begin
    Application.MessageBox('Informe a Data Base do Arquivo.', 'Atenção!',
      MB_OK + MB_ICONEXCLAMATION);
    cxDataBase.SetFocus;
    Exit;
  end;

  if Application.MessageBox('Confirma a importação dos dados?',
    'Importar Abastecimentos', MB_ICONQUESTION + MB_YESNO) = IDNO then
    Exit;

  cxLog.Lines.Add('Início da Importação: ' + DateTimeToStr(Now));
  cxLog.Refresh;
  cxLog.Lines.Add('Importando o arquivo ' + cxArquivo.Text);
  cxLog.Refresh;
  cxProgressBar1.Clear;
  thrAbastecimento := thrImportaAbastecimentosJatinho.Create(True);
  thrAbastecimento.FreeOnTerminate := True;
  thrAbastecimento.Priority := tpNormal;
  thrAbastecimento.Start;

end;

procedure TfrmImportaAbastecimentos.actImportarAbastecimetosCancelarExecute
  (Sender: TObject);
begin
  thrAbastecimento.Terminate;
end;

procedure TfrmImportaAbastecimentos.actImportaAbastecimentosSairExecute
  (Sender: TObject);
begin
  Close;
end;

end.
