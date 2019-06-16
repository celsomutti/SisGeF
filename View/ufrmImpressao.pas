unit ufrmImpressao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxGroupBox, cxLabel, cxTextEdit,
  cxMaskEdit, cxButtonEdit, System.Actions, Vcl.ActnList,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, dxGDIPlusClasses, cxImage, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmImpressao = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxArquivo: TcxButtonEdit;
    aclImpressao: TActionList;
    OpenDialog: TOpenDialog;
    PrinterSetupDialog: TPrinterSetupDialog;
    actImpressoraVisualizar: TAction;
    actImpressaoImprimir: TAction;
    actImpressaoSair: TAction;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    actImpressaoArquivo: TAction;
    cxImage1: TcxImage;
    procedure actImpressaoSairExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actImpressoraVisualizarExecute(Sender: TObject);
    procedure actImpressaoImprimirExecute(Sender: TObject);
    procedure actImpressaoArquivoExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImpressao: TfrmImpressao;

implementation

{$R *.dfm}

uses udm, uGlobais;


procedure TfrmImpressao.actImpressaoArquivoExecute(Sender: TObject);
begin
  if OpenDialog.Execute then
  begin
    cxArquivo.Text := OpenDialog.FileName;
  end;
end;

procedure TfrmImpressao.actImpressaoImprimirExecute(Sender: TObject);
begin
  uGlobais.bFlagImprimir := True;
  ModalResult := mrOk;
end;

procedure TfrmImpressao.actImpressaoSairExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmImpressao.actImpressoraVisualizarExecute(Sender: TObject);
begin
  uGlobais.bFlagImprimir := False;
  ModalResult := mrOk;
end;

procedure TfrmImpressao.FormShow(Sender: TObject);
begin
  uGlobais.bFlagImprimir := False;
end;

end.
