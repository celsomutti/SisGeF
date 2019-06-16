unit ufrmAmbientes;

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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, dxLayoutContainer, dxLayoutControl, dxLayoutcxEditAdapters, cxContainer, cxEdit, cxLabel,
  dxBevel, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxImageComboBox, dxLayoutControlAdapters, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  System.Actions, Vcl.ActnList;

type
  TSIS09997 = class(TForm)
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    dxBevel2: TdxBevel;
    cxAmbiente: TcxComboBox;
    dxLayoutControl1Item2: TdxLayoutItem;
    aclAmbiente: TActionList;
    actMudar: TAction;
    actCancelar: TAction;
    cxButton1: TcxButton;
    dxLayoutControl1Item3: TdxLayoutItem;
    cxButton2: TcxButton;
    dxLayoutControl1Item4: TdxLayoutItem;
    dxLayoutControl1Group1: TdxLayoutAutoCreatedGroup;
    procedure actMudarExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sAmbiente: String;
  end;

var
  SIS09997: TSIS09997;
implementation

{$R *.dfm}

uses udm, uGlobais;

procedure TSIS09997.actCancelarExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TSIS09997.actMudarExecute(Sender: TObject);
begin
  if cxAmbiente.ItemIndex = -1 then
  begin
    Application.MessageBox('Selecione uma Área de Trabalho!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
    cxAmbiente.SetFocus;
    Exit;
  end;
  ModalResult := mrOk;
end;

procedure TSIS09997.FormShow(Sender: TObject);
begin
  cxAmbiente.Properties.Items.Clear;
  cxAmbiente.Properties.Items.Text := uGlobais.ListaAmbiente.Text;
  cxAmbiente.Text := sAmbiente;
end;

end.
