unit ufrmListagemDevolucaoRecebido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxLabel, Vcl.Menus, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, dxmdaset,
  Vcl.StdCtrls, cxButtons, clDevolucoes;

type
  TfrmListagemDevolucaoRecebida = class(TForm)
    cxLabel1: TcxLabel;
    datInicio: TcxDateEdit;
    cxLabel2: TcxLabel;
    datFinal: TcxDateEdit;
    cxButton1: TcxButton;
    tbContainers: TdxMemData;
    tvContainers: TcxGridDBTableView;
    lvContainers: TcxGridLevel;
    grdContainers: TcxGrid;
    dsContainers: TDataSource;
    tbContainersNUM_LACRE: TStringField;
    tbContainersNOM_RECEBEDOR: TStringField;
    tvContainersRecId: TcxGridDBColumn;
    tvContainersNUM_LACRE: TcxGridDBColumn;
    tvContainersDAT_RECEPCAO: TcxGridDBColumn;
    tvContainersNOM_RECEBEDOR: TcxGridDBColumn;
    cxButton2: TcxButton;
    tbContainersDAT_RECEPCAO: TDateTimeField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListagemDevolucaoRecebida: TfrmListagemDevolucaoRecebida;
  devolucao : TDevolucoes;

implementation

{$R *.dfm}

uses udm;

procedure TfrmListagemDevolucaoRecebida.cxButton1Click(Sender: TObject);
var
  sID: String;
begin
  if datInicio.Date = 0 then
  begin
    Application.MessageBox('Informe a data inicial!', 'Data inicial', MB_OK + MB_ICONWARNING);
    datInicio.SetFocus
  end;
  if datFinal.Date = 0 then
  begin
    Application.MessageBox('Informe a data final!', 'Data inicial', MB_OK + MB_ICONWARNING);
    datFinal.SetFocus
  end;
  if datFinal.Date < datInicio.Date then
  begin
    Application.MessageBox('Data final menor data inicial!', 'Data inicial', MB_OK + MB_ICONWARNING);
    datFinal.SetFocus
  end;
  sId := QuotedStr(FormatDateTime('yyyy-mm-dd', datInicio.Date)) + ' AND ' + QuotedStr(FormatDateTime('yyyy-mm-dd', datFinal.Date));
  if devolucao.getObject(sId,'CONTAINER') then
  begin
    if tbContainers.Active then tbContainers.Close;
    tbContainers.Open;
    dm.qryGetObject.First;
    while not dm.qryGetObject.Eof do
    begin
      tbContainers.Insert;
      tbContainersNUM_LACRE.AsString := dm.qryGetObject.FieldByName('NUM_LACRE').AsString;
      tbContainersDAT_RECEPCAO.AsDateTime := dm.qryGetObject.FieldByName('DAT_RECEPCAO').AsDateTime;
      tbContainersNOM_RECEBEDOR.AsString := dm.qryGetObject.FieldByName('NOM_RECEBEDOR').AsString;
      tbContainers.Post;
      dm.qryGetObject.Next;
    end;
    dm.qryGetObject.Close;
    if not tbContainers.IsEmpty then tbContainers.First;
  end;
end;

procedure TfrmListagemDevolucaoRecebida.cxButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmListagemDevolucaoRecebida.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tbContainers.Close;
  devolucao.Free;
  Action := caFree;
  frmListagemDevolucaoRecebida := Nil;
end;

procedure TfrmListagemDevolucaoRecebida.FormShow(Sender: TObject);
begin
  devolucao := TDevolucoes.Create();
end;

end.
