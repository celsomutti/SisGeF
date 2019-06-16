unit ufrmSegundaViaProtocolo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, dxmdaset, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  System.Actions, Vcl.ActnList, Vcl.Menus, Vcl.StdCtrls, cxButtons, clDevolucoes, cxCalendar, cxTextEdit;

type
  TfrmSegundaViaProtocolo = class(TForm)
    tbListaProtocolos: TdxMemData;
    tbListaProtocolosDAT_DEVOLUCAO: TDateField;
    tbListaProtocolosNUM_LACRE: TStringField;
    tbListaProtocolosNUM_PROTOCOLO: TStringField;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dsListaProtocolos: TDataSource;
    aclSegundaViaProtocolo: TActionList;
    cxGrid1DBTableView1DAT_DEVOLUCAO: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_LACRE: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_PROTOCOLO: TcxGridDBColumn;
    actLocalizar: TAction;
    actSelecionar: TAction;
    actSair: TAction;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    procedure actSairExecute(Sender: TObject);
    procedure actSelecionarExecute(Sender: TObject);
    procedure actLocalizarExecute(Sender: TObject);
    procedure cxGrid1DBTableView1NUM_LACREPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cxGrid1DBTableView1NUM_PROTOCOLOPropertiesValidate(Sender: TObject; var DisplayValue: Variant;
      var ErrorText: TCaption; var Error: Boolean);
    procedure FormShow(Sender: TObject);
    procedure dsListaProtocolosStateChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxGrid1DBTableView1DAT_DEVOLUCAOPropertiesValidate(Sender: TObject; var DisplayValue: Variant;
      var ErrorText: TCaption; var Error: Boolean);
  private
    { Private declarations }
    procedure LocalizaProtocolos;
  public
    { Public declarations }
    sBases: String;
    sProtocolo: String;
  end;

var
  frmSegundaViaProtocolo: TfrmSegundaViaProtocolo;
  sId, sColuna: String;
  devolucao: TDevolucoes;

implementation

{$R *.dfm}

uses udm;

procedure TfrmSegundaViaProtocolo.actLocalizarExecute(Sender: TObject);
begin
  if tbListaProtocolos.Active then
  begin
    tbListaProtocolos.Close;
  end;
  tbListaProtocolos.Open;
  cxGrid1DBTableView1.NewItemRow.Visible := True;
  tbListaProtocolos.Insert;
end;

procedure TfrmSegundaViaProtocolo.actSairExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSegundaViaProtocolo.actSelecionarExecute(Sender: TObject);
begin
  sProtocolo := tbListaProtocolosNUM_PROTOCOLO.AsString;
  ModalResult := mrOk;
end;

procedure TfrmSegundaViaProtocolo.cxGrid1DBTableView1DAT_DEVOLUCAOPropertiesValidate(Sender: TObject; var DisplayValue: Variant;
  var ErrorText: TCaption; var Error: Boolean);
begin
  if VarToStr(DisplayValue).isEmpty then
  begin
    Exit;
  end;
  devolucao.Expedicao := VarToDateTime(DisplayValue);
  sColuna := '_DATA';
  LocalizaProtocolos;
end;

procedure TfrmSegundaViaProtocolo.cxGrid1DBTableView1NUM_LACREPropertiesValidate(Sender: TObject; var DisplayValue: Variant;
  var ErrorText: TCaption; var Error: Boolean);
begin
  if VarToStr(DisplayValue).isEmpty then
  begin
    Exit;
  end;
  devolucao.Lacre := DisplayValue;
  sColuna := '_LACRE';
  LocalizaProtocolos;
end;

procedure TfrmSegundaViaProtocolo.cxGrid1DBTableView1NUM_PROTOCOLOPropertiesValidate(Sender: TObject; var DisplayValue: Variant;
  var ErrorText: TCaption; var Error: Boolean);
begin
  if VarToStr(DisplayValue).isEmpty then
  begin
    Exit;
  end;
  devolucao.Protocolo := DisplayValue;
  sColuna := '_PROTOCOLO';
  LocalizaProtocolos;
end;

procedure TfrmSegundaViaProtocolo.dsListaProtocolosStateChange(Sender: TObject);
begin
  if TDataSource(Sender).DataSet.State in [dsInsert, dsEdit] then
  begin
    actLocalizar.Enabled := False;
    actSelecionar.Enabled := False;
    actSair.Enabled := True;
  end
  else if TDataSource(Sender).DataSet.State in [dsBrowse] then
  begin
    actLocalizar.Enabled := True;
    actSelecionar.Enabled := True;
    actSair.Enabled := True;
    cxGrid1DBTableView1.NewItemRow.Visible := False;
  end;
end;

procedure TfrmSegundaViaProtocolo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if tbListaProtocolos.Active then
  begin
    tbListaProtocolos.Close;
  end;
  devolucao.free;
end;

procedure TfrmSegundaViaProtocolo.FormShow(Sender: TObject);
begin
  devolucao := TDevolucoes.Create;
  sProtocolo := '';
end;

procedure TfrmSegundaViaProtocolo.LocalizaProtocolos;
begin
  tbListaProtocolos.Cancel;
  sId :=  sBases;
  if (not devolucao.getObject(sId, sColuna)) then
  begin
    Application.MessageBox('Nenhum protocolo encontrado!', 'Atenção!',
      MB_OK + MB_ICONEXCLAMATION);
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
    Exit;
  end;
  dm.qryGetObject.First;
  while (not dm.qryGetObject.Eof) do
  begin
    tbListaProtocolos.Insert;
    tbListaProtocolosDAT_DEVOLUCAO.Value := dm.qryGetObject.FieldByName('DAT_DEVOLUCAO').AsDateTime;
    tbListaProtocolosNUM_LACRE.Value := dm.qryGetObject.FieldByName('NUM_LACRE').AsString;
    tbListaProtocolosNUM_PROTOCOLO.Value := dm.qryGetObject.FieldByName('NUM_PROTOCOLO').AsString;
    tbListaProtocolos.Post;
    DM.qryGetObject.Next;
  end;
  tbListaProtocolos.First;
  dm.qryGetObject.Close;
  dm.qryGetObject.SQL.Clear;
end;

end.
