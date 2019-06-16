unit ufrmTipoExportacao;

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
  cxGroupBox, cxRadioGroup, ActnList, Menus, StdCtrls, cxButtons, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, System.Actions;

type
  TfrmTipoExportacao = class(TForm)
    cxRadioGroup1: TcxRadioGroup;
    aclTipoExportacao: TActionList;
    actTipoExportacaoOK: TAction;
    actTipoExportacaoCancelar: TAction;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    procedure actTipoExportacaoOKExecute(Sender: TObject);
    procedure actTipoExportacaoCancelarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTipoExportacao: TfrmTipoExportacao;

implementation

{$R *.dfm}

uses
  udm, uGlobais, clUtil;

procedure TfrmTipoExportacao.actTipoExportacaoOKExecute(Sender: TObject);
begin
  uGlobais.TipoExportacao := cxRadioGroup1.ItemIndex;
  frmTipoExportacao.ModalResult := mrOk;
end;

procedure TfrmTipoExportacao.actTipoExportacaoCancelarExecute(Sender: TObject);
begin
  uGlobais.TipoExportacao := -1;
  frmTipoExportacao.ModalResult := mrCancel;
end;

end.
