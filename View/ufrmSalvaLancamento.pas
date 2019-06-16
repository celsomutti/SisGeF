unit ufrmSalvaLancamento;

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
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxGroupBox, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLabel, cxSpinEdit, Vcl.Menus,
  Vcl.ActnList, Vcl.StdCtrls, cxButtons, Data.DB, dxmdaset, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxCalendar, cxCurrencyEdit, Vcl.ComCtrls, dxCore,
  cxDateUtils, System.DateUtils, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, System.Actions, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmSalvaLancamento = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxOperacao: TcxComboBox;
    cxLabel2: TcxLabel;
    cxQuantidade: TcxSpinEdit;
    cxLabel3: TcxLabel;
    cxIntervalo: TcxSpinEdit;
    aclParcelas: TActionList;
    cxButton1: TcxButton;
    actParcelamentoExecutar: TAction;
    tbParcelas: TdxMemData;
    tbParcelasDAT_PARCELA: TDateField;
    tbParcelasVAL_PARCELA: TCurrencyField;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    DS: TDataSource;
    actParcalamentoLimpar: TAction;
    cxButton2: TcxButton;
    cxGrid1DBTableView1DAT_PARCELA: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_PARCELA: TcxGridDBColumn;
    cxGrid1DBTableView1RecId: TcxGridDBColumn;
    cxLabel4: TcxLabel;
    cxValor: TcxCurrencyEdit;
    actParcelamentoSalvar: TAction;
    cxButton3: TcxButton;
    actPartcelamentoCancelar: TAction;
    cxButton4: TcxButton;
    cxLabel5: TcxLabel;
    cxVencimento: TcxDateEdit;
    procedure actParcelamentoSalvarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actParcalamentoLimparExecute(Sender: TObject);
    procedure actPartcelamentoCancelarExecute(Sender: TObject);
    procedure actParcelamentoExecutarExecute(Sender: TObject);
    procedure Calculo;
    procedure cxOperacaoPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSalvaLancamento: TfrmSalvaLancamento;

implementation

{$R *.dfm}

uses
  udm, ufrmPrincipal, clUtil, Math, uGlobais;

procedure TfrmSalvaLancamento.actParcalamentoLimparExecute(Sender: TObject);
begin
  tbParcelas.Close;
  tbParcelas.Open;
end;

procedure TfrmSalvaLancamento.actParcelamentoExecutarExecute(Sender: TObject);
begin
  if (cxOperacao.ItemIndex <> 0) and (cxQuantidade.Value = 0) then
  begin
    Application.MessageBox('Informe a quantidade de Parcelas.', 'Atenção',
      MB_OK + MB_ICONEXCLAMATION);
    cxQuantidade.SetFocus;
    Exit;
  end;
  if (cxOperacao.ItemIndex <> 0) and (cxIntervalo.Value = 0) then
  begin
    Application.MessageBox('Informe a quantidade de Dias do Intervalo.',
      'Atenção', MB_OK + MB_ICONEXCLAMATION);
    cxIntervalo.SetFocus;
    Exit;
  end;
  if (cxQuantidade.Value <> 1) and (cxOperacao.ItemIndex = 0) then
  begin
    cxQuantidade.Value := 1;
  end;
  if (cxIntervalo.Value <> 0) and (cxOperacao.ItemIndex = 0) then
  begin
    cxIntervalo.Value := 0;
  end;
  Calculo;
end;

procedure TfrmSalvaLancamento.actParcelamentoSalvarExecute(Sender: TObject);
begin
  if tbParcelas.IsEmpty then
  begin
    Application.MessageBox
      ('Nenhum valor foi calculado. Informe os parâmetros e clique em Calcular.',
      'Atenção!', MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if cxGrid1DBTableView1.DataController.Summary.FooterSummaryValues[0] <>
    cxValor.Value then
  begin
    if Application.MessageBox
      ('Valor Calculado é Diferente do Valor do Lançamento. Deseja Continuar?.',
      'tenção!', MB_YESNO + MB_ICONQUESTION) = IDNO then
    begin
      Exit;
    end;
  end;
  ModalResult := mrOk
end;

procedure TfrmSalvaLancamento.actPartcelamentoCancelarExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSalvaLancamento.cxOperacaoPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if cxOperacao.ItemIndex = 0 then
  begin
    cxQuantidade.Properties.ReadOnly := True;
    cxQuantidade.Value := 1;
    cxIntervalo.Properties.ReadOnly := True;
    cxIntervalo.Value := 0;
    cxVencimento.Properties.ReadOnly := True;
  end
  else
  begin
    cxQuantidade.Properties.ReadOnly := False;
    cxQuantidade.Value := 1;
    cxIntervalo.Properties.ReadOnly := False;
    cxIntervalo.Value := 15;
    cxVencimento.Properties.ReadOnly := False;
  end;
end;

procedure TfrmSalvaLancamento.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then
  begin
    if cxGrid1.IsFocused then
    begin
      Exit;
    end;
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfrmSalvaLancamento.FormShow(Sender: TObject);
begin
  tbParcelas.Close;
  tbParcelas.Open;
end;

procedure TfrmSalvaLancamento.Calculo;
var
  dValor: Double;
  iParcela, iParcelas, iIntervalo: Integer;
  dtData: TDate;
begin
  iParcela := 0;
  iParcelas := cxQuantidade.Value;
  iIntervalo := cxIntervalo.Value;
  dtData := cxVencimento.Date;
  if cxOperacao.ItemIndex = 1 then
  begin
    dValor := cxValor.Value / iParcelas;
  end
  else
  begin
    dValor := cxValor.Value;
  end;
  tbParcelas.Close;
  tbParcelas.Open;
  for iParcela := 1 to iParcelas do
  begin
    tbParcelas.Insert;
    tbParcelasDAT_PARCELA.AsDateTime := dtData;
    tbParcelasVAL_PARCELA.AsCurrency := dValor;
    tbParcelas.Post;
    dtData := IncDay(dtData, iIntervalo);
  end;
end;

end.
