unit ufrmRecepcaoContainers;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxGroupBox, Vcl.ActnList, cxTextEdit,
  cxMaskEdit, cxLabel, Vcl.Menus, Vcl.StdCtrls,
  cxButtons, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData,
  cxImageComboBox, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxDropDownEdit, cxCalendar, dxmdaset,
  clDevolucoes, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  System.Actions, clAcessos, clConexao, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmRecepcaoContainers = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    cxLabel2: TcxLabel;
    cxLacre: TcxMaskEdit;
    aclRetirada: TActionList;
    actRecepcaoIniciar: TAction;
    actRecepcaoConcluir: TAction;
    actRecepcaoSair: TAction;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    tbRecepcao: TdxMemData;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    ds: TDataSource;
    cxGrid1DBTableView1RecId: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_LACRE: TcxGridDBColumn;
    cxGrid1DBTableView1QTDE_VOLUMES: TcxGridDBColumn;
    tbRecepcaoNUM_LACRE: TStringField;
    tbRecepcaoDAT_EXPEDICAO: TDateField;
    actListagem: TAction;
    cxButton4: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actRecepcaoIniciarExecute(Sender: TObject);
    procedure actRecepcaoConcluirExecute(Sender: TObject);
    procedure actRecepcaoSairExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cxLacreExit(Sender: TObject);
    procedure actListagemExecute(Sender: TObject);
  private
    { Private declarations }
    procedure LocalizaLacre;
  public
    { Public declarations }
  end;

var
  frmRecepcaoContainers: TfrmRecepcaoContainers;
  devolucao: TDevolucoes;
  bInicio: Boolean;
  acessos: TAcessos;
  conexao: TConexao;

implementation

{$R *.dfm}

uses
  udm, uGlobais, clUtil, ufrmListagemDevolucaoRecebido;

procedure TfrmRecepcaoContainers.actListagemExecute(Sender: TObject);
begin
  if not Assigned(frmListagemDevolucaoRecebida) then
  begin
    frmListagemDevolucaoRecebida := TfrmListagemDevolucaoRecebida.Create(Application);
  end;
  frmListagemDevolucaoRecebida.ShowModal;
end;

procedure TfrmRecepcaoContainers.actRecepcaoConcluirExecute(Sender: TObject);
begin
  if tbRecepcao.IsEmpty then
  begin
    Exit;
  end;
  tbRecepcao.First;
  while not tbRecepcao.Eof do
  begin
    devolucao.Lacre := tbRecepcaoNUM_LACRE.AsString;
    devolucao.Recebedor := uGlobais.sNomeUsuario;
    devolucao.Recepcao := Now;
    if (not devolucao.ReceberContainer()) then
    begin
      Application.MessageBox(PChar('Erro ao receber container com o lacre nº ' +
        tbRecepcaoNUM_LACRE.AsString + '!'), 'Atenção', MB_OK + MB_ICONERROR);
      Exit;
    end;
    tbRecepcao.Next;
  end;
  Application.MessageBox('Container(s) Recebidos.', 'Atenção!',
    MB_OK + MB_ICONINFORMATION);
  tbRecepcao.Close;
  actRecepcaoConcluir.Enabled := False;
  cxLacre.Clear;
  cxLacre.Properties.ReadOnly := True;
  bInicio := False;
end;

procedure TfrmRecepcaoContainers.actRecepcaoIniciarExecute(Sender: TObject);
begin
  tbRecepcao.Close;
  tbRecepcao.Open;
  cxLacre.Clear;
  cxLacre.Properties.ReadOnly := False;
  actRecepcaoConcluir.Enabled := True;
  bInicio := True;
  cxLacre.SetFocus;
end;

procedure TfrmRecepcaoContainers.actRecepcaoSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmRecepcaoContainers.cxLacreExit(Sender: TObject);
begin
  if bInicio then
  begin
    if TUtil.Empty(cxLacre.Text) then
    begin
      Exit;
    end;
    LocalizaLacre;
  end;
end;

procedure TfrmRecepcaoContainers.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  devolucao.Free;
  acessos.Free;
  conexao.Free;
  tbRecepcao.Close;
  Action := caFree;
  frmRecepcaoContainers := nil;
end;

procedure TfrmRecepcaoContainers.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmRecepcaoContainers.FormShow(Sender: TObject);
begin
  devolucao := TDevolucoes.Create;
  acessos := TAcessos.Create;
  conexao := TConexao.Create;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    actRecepcaoSairExecute(Sender);
    Exit;
  end;
  acessos.SetNivel(aclRetirada);
  bInicio := False;
end;

procedure TfrmRecepcaoContainers.LocalizaLacre;
begin
  try
    if tbRecepcao.Locate('NUM_LACRE', cxLacre.Text, []) then
    begin
      Application.MessageBox('Número de Lacre já lançado!', 'Atenção!',
        MB_OK + MB_ICONWARNING);
      cxLacre.Clear;
      cxLacre.SetFocus;
      Exit;
    end;
    devolucao.Lacre := cxLacre.Text;
    if (not devolucao.getObject('', 'LACRE')) then
    begin
      Application.MessageBox('Número de Lacre não encontrado!', 'Atenção!',
        MB_OK + MB_ICONWARNING);
      bInicio := False;
      cxLacre.Clear;
      Exit;
    end;
    tbRecepcao.Insert;
    tbRecepcaoNUM_LACRE.Value := cxLacre.Text;
    tbRecepcaoDAT_EXPEDICAO.Value := devolucao.Expedicao;
    tbRecepcao.Post;
    actRecepcaoConcluir.Enabled := True;
    cxLacre.Properties.ReadOnly := False;
  finally
    cxLacre.Clear;
    if (not cxLacre.Properties.ReadOnly) then
    begin
      cxLacre.SetFocus;
    end;
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
  end;
end;

end.
