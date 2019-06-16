unit ufrmListaAtribuicoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, dxmdaset, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.Menus,
  Vcl.StdCtrls, cxButtons, cxCalendar, cxDBLookupComboBox, cxTextEdit;

type
  TfrmListaAtribuicoes = class(TForm)
    tbAtribuicoesJornal: TdxMemData;
    tbAtribuicoesJornalID_ASSINANTE: TIntegerField;
    tbAtribuicoesJornalDAT_ATRIBUICAO: TDateField;
    tbAtribuicoesJornalCOD_PRODUTO: TWideStringField;
    tbAtribuicoesJornalNUM_EDICAO: TWideStringField;
    tbAtribuicoesJornalCOD_ASSINANTE: TWideStringField;
    tbAtribuicoesJornalCOD_TIPO_ASSINATURA: TWideStringField;
    tbAtribuicoesJornalCOD_ENTREGADOR: TIntegerField;
    tbAtribuicoesJornalNOM_ASSINANTE: TWideStringField;
    tbAtribuicoesJornalCOD_BARRA: TWideStringField;
    tbAtribuicoesJornalNOM_CUIDADOS: TWideStringField;
    tbAtribuicoesJornalDES_ENDERECO: TWideStringField;
    tbAtribuicoesJornalDES_COMPLEMENTO: TWideStringField;
    tbAtribuicoesJornalDES_BAIRRO: TWideStringField;
    tbAtribuicoesJornalDES_REFERENCIA: TWideStringField;
    tbAtribuicoesJornalDES_CIDADE: TWideStringField;
    tbAtribuicoesJornalDES_UF: TWideStringField;
    tbAtribuicoesJornalCEP_ENDERECO: TWideStringField;
    tbAtribuicoesJornalQTD_EXEMPLARES: TIntegerField;
    tbAtribuicoesJornalNUM_ROTEIRO: TIntegerField;
    tbAtribuicoesJornalNOM_USUARIO: TWideStringField;
    tbAtribuicoesJornalDAT_MANUTENCAO: TDateTimeField;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dsAtribuicoes: TDataSource;
    cxGrid1DBTableView1RecId: TcxGridDBColumn;
    cxGrid1DBTableView1ID_ASSINANTE: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_ATRIBUICAO: TcxGridDBColumn;
    cxGrid1DBTableView1COD_PRODUTO: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_EDICAO: TcxGridDBColumn;
    cxGrid1DBTableView1COD_ASSINANTE: TcxGridDBColumn;
    cxGrid1DBTableView1COD_TIPO_ASSINATURA: TcxGridDBColumn;
    cxGrid1DBTableView1COD_ENTREGADOR: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_ASSINANTE: TcxGridDBColumn;
    cxGrid1DBTableView1COD_BARRA: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_CUIDADOS: TcxGridDBColumn;
    cxGrid1DBTableView1DES_ENDERECO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_COMPLEMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_BAIRRO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_REFERENCIA: TcxGridDBColumn;
    cxGrid1DBTableView1DES_CIDADE: TcxGridDBColumn;
    cxGrid1DBTableView1DES_UF: TcxGridDBColumn;
    cxGrid1DBTableView1CEP_ENDERECO: TcxGridDBColumn;
    cxGrid1DBTableView1QTD_EXEMPLARES: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_ROTEIRO: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_USUARIO: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_MANUTENCAO: TcxGridDBColumn;
    cxButton1: TcxButton;
    dsCadastro: TDataSource;
    procedure cxButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure PopulaAtribuicoes;
  public
    { Public declarations }
  end;

var
  frmListaAtribuicoes: TfrmListaAtribuicoes;

implementation

{$R *.dfm}

uses clUtil, udm;

procedure TfrmListaAtribuicoes.cxButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmListaAtribuicoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tbAtribuicoesJornal.Close;
  dm.qryGetObject1.Close;
  dm.qryGetObject1.SQL.Clear;
  Action := caFree;
  frmListaAtribuicoes := Nil;
end;

procedure TfrmListaAtribuicoes.FormShow(Sender: TObject);
begin
  PopulaAtribuicoes;
end;

procedure TfrmListaAtribuicoes.PopulaAtribuicoes;
begin
  tbAtribuicoesJornal.Close;
  tbAtribuicoesJornal.Open;
  if (not dm.qryGetObject1.Active) then
  begin
    Exit;
  end;
  tbAtribuicoesJornal.LoadFromDataSet(dm.qryGetObject1);
  if (not tbAtribuicoesJornal.IsEmpty) then
  begin
    tbAtribuicoesJornal.First;
  end;
  dm.qryGetObject1.Close;
  dm.qryGetObject1.SQL.Clear;
  if (not tbAtribuicoesJornal.IsEmpty) then
  begin
    tbAtribuicoesJornal.First;
  end;
end;

end.
