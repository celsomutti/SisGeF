unit ufrmInformacoesProduto;

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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, dxLayoutContainer, dxLayoutControl, dxLayoutLookAndFeels, cxClasses, cxContainer, cxEdit,
  dxLayoutcxEditAdapters, cxCheckBox, cxDropDownEdit, cxCalc, cxTextEdit, cxMaskEdit, cxSpinEdit, System.Actions, Vcl.ActnList,
  dxLayoutControlAdapters, Vcl.Menus, Vcl.StdCtrls, cxButtons;

type
  TfrmInformacoesProduto = class(TForm)
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList;
    dxLayoutCxLookAndFeel1: TdxLayoutCxLookAndFeel;
    cxVolume: TcxSpinEdit;
    dxLayoutControl1Item1: TdxLayoutItem;
    cxPesoProduto: TcxCalcEdit;
    dxLayoutControl1Item2: TdxLayoutItem;
    cxForaContainer: TcxCheckBox;
    dxLayoutControl1Item3: TdxLayoutItem;
    aclInformacaoProduto: TActionList;
    actAceitar: TAction;
    cxButton1: TcxButton;
    dxLayoutControl1Item4: TdxLayoutItem;
    cxButton2: TcxButton;
    dxLayoutControl1Item5: TdxLayoutItem;
    dxLayoutControl1Group1: TdxLayoutAutoCreatedGroup;
    actCancelar: TAction;
    procedure actAceitarExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInformacoesProduto: TfrmInformacoesProduto;

implementation

{$R *.dfm}

uses udm, uGlobais;

procedure TfrmInformacoesProduto.actAceitarExecute(Sender: TObject);
begin
  if cxVolume.Value = 0 then
  begin
    Application.MessageBox('Informe o número do Volume!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
    cxVolume.SetFocus;
    Exit;
  end;
  if cxPesoProduto.Value = 0 then
  begin
    Application.MessageBox('Informe o Peso do Produto!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
    cxPesoProduto.SetFocus;
    Exit;
  end;
  ModalResult := mrOK;
end;

procedure TfrmInformacoesProduto.actCancelarExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmInformacoesProduto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

end.
