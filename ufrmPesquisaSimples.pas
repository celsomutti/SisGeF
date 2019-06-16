unit ufrmPesquisaSimples;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  ActnList, Menus, StdCtrls, cxButtons, ExtCtrls, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
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
  dxSkinscxPCPainter;

type
  TfrmPesquisaSimples = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    ds: TDataSource;
    cxSelecionar: TcxButton;
    cxSair: TcxButton;
    aclApoio: TActionList;
    actApoioSelecionar: TAction;
    actApoioSair: TAction;
    procedure FormShow(Sender: TObject);
    procedure actApoioSelecionarExecute(Sender: TObject);
    procedure actApoioSairExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iColuna: Integer;
  end;

var
  frmPesquisaSimples: TfrmPesquisaSimples;

implementation

{$R *.dfm}

uses
  udm, clUtil;

procedure TfrmPesquisaSimples.FormShow(Sender: TObject);
var
  i: Integer;
begin
  for i := iColuna to dm.qryGetObject.FieldCount -1 do begin
    cxGrid1DBTableView1.Columns[i].Visible := False;
  end;
end;

procedure TfrmPesquisaSimples.actApoioSelecionarExecute(Sender: TObject);
begin
  ModalResult := mrOk;
  Close;
end;

procedure TfrmPesquisaSimples.actApoioSairExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

end.
