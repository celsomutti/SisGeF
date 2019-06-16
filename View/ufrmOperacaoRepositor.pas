unit ufrmOperacaoRepositor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, dxLayoutContainer, dxLayoutControl, cxContainer, cxEdit, dxLayoutcxEditAdapters,
  cxTextEdit, cxMaskEdit, cxButtonEdit, cxLabel, System.Actions, Vcl.ActnList, dxLayoutControlAdapters, Vcl.Menus, Vcl.StdCtrls,
  cxButtons, clEntregador, Vcl.ComCtrls, dxCore, cxDateUtils, cxDropDownEdit, cxCalendar;

type
  TfrmOperacaoRepositor = class(TForm)
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    cxCodigo: TcxButtonEdit;
    dxLayoutControl1Item1: TdxLayoutItem;
    cxNome: TcxTextEdit;
    dxLayoutControl1Item2: TdxLayoutItem;
    cxLabel1: TcxLabel;
    dxLayoutControl1Item3: TdxLayoutItem;
    aclOperacaoRepositor: TActionList;
    dxLayoutControl1Group1: TdxLayoutAutoCreatedGroup;
    actGravar: TAction;
    actSair: TAction;
    cxButton1: TcxButton;
    dxLayoutControl1Item4: TdxLayoutItem;
    cxButton2: TcxButton;
    dxLayoutControl1Item5: TdxLayoutItem;
    acrListaApoio: TAction;
    cxData: TcxDateEdit;
    dxLayoutControl1Item6: TdxLayoutItem;
    cxDataFinal: TcxDateEdit;
    dxLayoutControl1Item7: TdxLayoutItem;
    dxLayoutControl1Group3: TdxLayoutAutoCreatedGroup;
    dxLayoutControl1Group2: TdxLayoutAutoCreatedGroup;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actGravarExecute(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
    procedure acrListaApoioExecute(Sender: TObject);
    procedure cxCodigoPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
  private
    { Private declarations }
    procedure ListaEntregadores;
  public
    { Public declarations }
  end;

var
  frmOperacaoRepositor: TfrmOperacaoRepositor;
  entregador: TEntregador;

implementation

{$R *.dfm}

uses udm, uGlobais, ufrmListaApoio, clUtil;

procedure TfrmOperacaoRepositor.acrListaApoioExecute(Sender: TObject);
begin
  ListaEntregadores;
end;

procedure TfrmOperacaoRepositor.actGravarExecute(Sender: TObject);
begin
  if not TUtil.DataOk(cxData.Text) then
  begin
    Application.MessageBox('Informa a data inicial do período!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
    cxData.SetFocus;
    Exit;
  end;
  if not TUtil.DataOk(cxDataFinal.Text) then
  begin
    Application.MessageBox('Informa a data final do período!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
    cxDataFinal.SetFocus;
    Exit;
  end;
  if cxData.Date > cxDataFinal.Date then
  begin
    Application.MessageBox('Data inicial maior que a data final do período!',
                           PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
    cxData.SetFocus;
    Exit;
  end;
  if StrToIntDef(cxCodigo.Text,0) = 0 then
  begin
    Application.MessageBox('Informe o código do Repositor ou Entregador!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK +
                           MB_ICONEXCLAMATION);
    cxCodigo.SetFocus;
    Exit;
  end;
  ModalResult := mrOk;
end;

procedure TfrmOperacaoRepositor.actSairExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmOperacaoRepositor.cxCodigoPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  entregador.Cadastro := DisplayValue;
  cxNome.Text := entregador.getField('NOM_FANTASIA','CADASTRO');
  if TUtil.Empty(cxNome.Text) then
  begin
    ErrorText := 'Código de Entregador não encontrado!';
    Error := True;
  end;

end;

procedure TfrmOperacaoRepositor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  entregador.Free;
end;

procedure TfrmOperacaoRepositor.FormShow(Sender: TObject);
begin
  entregador := TEntregador.Create;
end;

procedure TfrmOperacaoRepositor.ListaEntregadores;
var
  sId: String;
begin
  sId := '';
  Screen.Cursor := crHourGlass;
  sId := '';
  if not entregador.ListaEntregadores then
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
  frmListaApoio.Caption := 'Repositores/Entregadores';
  frmListaApoio.cxGrid1DBTableView1.OptionsView.Header := False;
  Screen.Cursor := crDefault;
  if frmListaApoio.ShowModal = mrOk then
  begin
    cxCodigo.Text := dm.qryPesquisa.Fields[0].AsString;
    cxCodigo.Refresh;
    cxNome.Text := dm.qryPesquisa.Fields[1].AsString;
    cxNome.Refresh;
  end;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  FreeAndNil(frmListaApoio);
end;

end.
