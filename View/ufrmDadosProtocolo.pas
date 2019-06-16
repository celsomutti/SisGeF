unit ufrmDadosProtocolo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxTextEdit, cxLabel, Vcl.Menus, Vcl.StdCtrls, cxButtons;

type
  TfrmDadosProtocolo = class(TForm)
    cxLabel1: TcxLabel;
    cxNomeRecebedor: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxGrau: TcxTextEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDadosProtocolo: TfrmDadosProtocolo;

implementation

{$R *.dfm}

uses udm, clUtil, uGlobais;

procedure TfrmDadosProtocolo.cxButton1Click(Sender: TObject);
begin
  if TUtil.Empty(cxNomeRecebedor.Text) then
  begin
    Application.MessageBox('Informe o Nome do Recebedor.', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
    cxNomeRecebedor.SetFocus;
    Exit
  end;
  if TUtil.Empty(cxGrau.Text) then
  begin
    Application.MessageBox('Informe o Grau de Relacionamento.', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
    cxGrau.SetFocus;
    Exit
  end;
  Self.ModalResult := mrOk;
end;

end.
