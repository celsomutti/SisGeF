unit ufrmDetalheLancamentos;

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
  cxGroupBox, DB, dxmdaset, cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Menus, ActnList, StdCtrls, cxButtons, cxNavigator;

type
  TfrmDetalheLancamentos = class(TForm)
    cxGroupBox1: TcxGroupBox;
    tbLancamentos: TdxMemData;
    tbLancamentosCOD_LANCAMENTO: TIntegerField;
    tbLancamentosDES_LANCAMENTO: TStringField;
    tbLancamentosDAT_LANCAMENTO: TDateField;
    tbLancamentosCOD_ENTREGADOR: TIntegerField;
    tbLancamentosDES_TIPO: TStringField;
    tbLancamentosVAL_LANCAMENTO: TCurrencyField;
    tbLancamentosDOM_DESCONTO: TStringField;
    tbLancamentosDAT_DESCONTO: TDateField;
    tbLancamentosNUM_EXTRATO: TIntegerField;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    ds: TDataSource;
    cxGrid1DBTableView1DES_LANCAMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_LANCAMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_LANCAMENTO: TcxGridDBColumn;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    aclDetalheLancamento: TActionList;
    actDelhateLancamentoEditar: TAction;
    actDetalheLancamentosSair: TAction;
    procedure actDelhateLancamentoEditarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDetalheLancamentos: TfrmDetalheLancamentos;

implementation

{$R *.dfm}

uses
  udm, ufrmPrincipal, clUtil, ufrmLancamentos, uGlobais;

procedure TfrmDetalheLancamentos.actDelhateLancamentoEditarExecute(
  Sender: TObject);
begin
  if not (tbLancamentos.Active) then Exit;
  if tbLancamentos.IsEmpty then Exit;
  uGlobais.Lancamento := tbLancamentosCOD_LANCAMENTO.Value;
  if not Assigned(frmLancamentos) then
    frmLancamentos := TfrmLancamentos.Create(Application);
  frmLancamentos.Show;
end;

end.
