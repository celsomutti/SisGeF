unit ufrmRetiradaDevolucoes;

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
  System.Actions, clAcessos, clConexao;

type
  TfrmRetiradaDevolucoes = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    cxLabel2: TcxLabel;
    cxLacre: TcxMaskEdit;
    aclRetirada: TActionList;
    actRetiradaIniciar: TAction;
    actRetiradaConcluir: TAction;
    actRetiradaSair: TAction;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    tbRetirada: TdxMemData;
    tbRetiradaQTDE_VOLUMES: TIntegerField;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    ds: TDataSource;
    cxGrid1DBTableView1RecId: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_LACRE: TcxGridDBColumn;
    cxGrid1DBTableView1QTDE_VOLUMES: TcxGridDBColumn;
    cxLabel3: TcxLabel;
    cxObjetos: TcxTextEdit;
    tbRetiradaNUM_LACRE: TStringField;
    tbRetiradaDAT_EXPEDICAO: TDateField;
    cxGrid1DBTableView1DAT_EXPEDICAO: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actRetiradaIniciarExecute(Sender: TObject);
    procedure actRetiradaConcluirExecute(Sender: TObject);
    procedure actRetiradaSairExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cxLacreExit(Sender: TObject);
  private
    { Private declarations }
    procedure LocalizaLacre;
  public
    { Public declarations }
  end;

var
  frmRetiradaDevolucoes: TfrmRetiradaDevolucoes;
  devolucao: TDevolucoes;
  acessos: TAcessos;
  iObjetos: Integer;
  bInicio: Boolean;
  conexao: TConexao;

implementation

{$R *.dfm}

uses
  udm, uGlobais, clUtil;

procedure TfrmRetiradaDevolucoes.actRetiradaConcluirExecute(Sender: TObject);
begin
  if tbRetirada.IsEmpty then
  begin
    Exit;
  end;
  if Application.MessageBox('Confirma a retirada destes containers?',
    'Atenção!', MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;

  tbRetirada.First;
  while not tbRetirada.Eof do
  begin
    devolucao.Lacre := tbRetiradaNUM_LACRE.AsString;
    devolucao.Motorista := uGlobais.sNomeUsuario;
    devolucao.Retirada := Now;
    if (not devolucao.RetirarContainer()) then
    begin
      Application.MessageBox(PChar('Erro ao retirar container com o lacre nº ' +
        tbRetiradaNUM_LACRE.AsString + '!'), 'Atenção', MB_OK + MB_ICONERROR);
      Exit;
    end;
    tbRetirada.Next;
  end;
  Application.MessageBox('Container(s) Retirados.', 'Atenção!',
    MB_OK + MB_ICONINFORMATION);
  tbRetirada.Close;
  actRetiradaConcluir.Enabled := False;
  cxObjetos.Text := '0';
  iObjetos := 0;
  cxLacre.Clear;
  bInicio := False;
end;

procedure TfrmRetiradaDevolucoes.actRetiradaIniciarExecute(Sender: TObject);
begin
  tbRetirada.Close;
  tbRetirada.Open;
  cxLacre.Clear;
  cxLacre.Properties.ReadOnly := False;
  actRetiradaConcluir.Enabled := True;
  bInicio := True;
  cxLacre.SetFocus;
end;

procedure TfrmRetiradaDevolucoes.actRetiradaSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmRetiradaDevolucoes.cxLacreExit(Sender: TObject);
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

procedure TfrmRetiradaDevolucoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  devolucao.Free;
  acessos.Free;
  conexao.Free;
  tbRetirada.Close;
  Action := caFree;
  frmRetiradaDevolucoes := nil;
end;

procedure TfrmRetiradaDevolucoes.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmRetiradaDevolucoes.FormShow(Sender: TObject);
begin
  devolucao := TDevolucoes.Create;
  acessos := TAcessos.Create;
  conexao := TConexao.Create;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    actRetiradaSairExecute(Sender);
    Exit;
  end;
  acessos.SetNivel(aclRetirada);
  iObjetos := 0;
  bInicio := False;
end;

procedure TfrmRetiradaDevolucoes.LocalizaLacre;
var
  iEntregas: Integer;
begin
  try
    if tbRetirada.Locate('NUM_LACRE', cxLacre.Text, []) then
    begin
      Application.MessageBox('Número de Lacre já lançado!', 'Atenção!',
        MB_OK + MB_ICONWARNING);
      cxLacre.Clear;
      cxLacre.SetFocus;
      Exit;
    end;
    iEntregas := 0;
    if iObjetos = 0 then
    begin
      if (not devolucao.getObject('2', 'RETIRADA')) then
      begin
        Application.MessageBox('Lacres não encontrados!', 'Atenção!',
          MB_OK + MB_ICONWARNING);
        bInicio := False;
        cxLacre.Clear;
        Exit;
      end;
      iObjetos := dm.qryGetObject.RecordCount;
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
    { if devolucao.Expedicao <> cxExpedicao.Date then begin
      Application.MessageBox('Lacre pertence a outra expedição!', 'Atenção!', MB_OK + MB_ICONWARNING);
      cxExpedicao.Clear;
      bInicio :=  False;
      cxLacre.Clear;
      Exit;
      end; }
    iEntregas := dm.qryGetObject.RecordCount;
    Dec(iObjetos, 1);
    cxObjetos.Text := IntToStr(iObjetos);
    tbRetirada.Insert;
    tbRetiradaNUM_LACRE.Value := cxLacre.Text;
    tbRetiradaQTDE_VOLUMES.Value := iEntregas;
    tbRetiradaDAT_EXPEDICAO.Value := devolucao.Expedicao;
    tbRetirada.Post;
    if iObjetos = 0 then
    begin
      actRetiradaConcluir.Enabled := True;
      cxLacre.Properties.ReadOnly := True;
      Application.MessageBox('Pode concluir a retirada desta remessa!',
        'Atenção', MB_OK + MB_ICONINFORMATION);
    end;
    acessos.SetNivel(aclRetirada);
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
