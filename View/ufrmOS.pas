unit ufrmOS;

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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, dxLayoutContainer, dxLayoutControl, cxContainer, cxEdit, dxLayoutcxEditAdapters, cxLabel,
  cxGroupBox, cxTextEdit, cxMaskEdit, Vcl.ComCtrls, dxCore, cxDateUtils, cxDropDownEdit, cxCalendar, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxButtonEdit, cxSpinEdit, cxTimeEdit, cxImageComboBox, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, cxCurrencyEdit, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, dxmdaset, cxCalc, System.Actions, Vcl.ActnList, dxLayoutControlAdapters,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, clOS;

type
  TfrmOS = class(TForm)
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    dxLayoutControl1Item1: TdxLayoutItem;
    cxLabel27: TcxLabel;
    cxNumOS: TcxMaskEdit;
    dxLayoutControl1Item2: TdxLayoutItem;
    cxDataOS: TcxDateEdit;
    dxLayoutControl1Item3: TdxLayoutItem;
    dxLayoutControl1Group1: TdxLayoutAutoCreatedGroup;
    cxCodCliente: TcxButtonEdit;
    dxLayoutControl1Item4: TdxLayoutItem;
    cxNomeSolicitante: TcxTextEdit;
    dxLayoutControl1Item5: TdxLayoutItem;
    cxCodMotorista: TcxButtonEdit;
    dxLayoutControl1Item6: TdxLayoutItem;
    cxNomeMotorista: TcxTextEdit;
    dxLayoutControl1Item7: TdxLayoutItem;
    dxLayoutControl1Group2: TdxLayoutAutoCreatedGroup;
    cxPlacaVeiculo: TcxButtonEdit;
    dxLayoutControl1Item8: TdxLayoutItem;
    cxKMInicial: TcxMaskEdit;
    dxLayoutControl1Item9: TdxLayoutItem;
    cxHoraSaida: TcxTimeEdit;
    dxLayoutControl1Item10: TdxLayoutItem;
    cxMaskEdit1: TcxMaskEdit;
    dxLayoutControl1Item11: TdxLayoutItem;
    cxHoraRetorno: TcxTimeEdit;
    dxLayoutControl1Item12: TdxLayoutItem;
    cxStatus: TcxImageComboBox;
    dxLayoutControl1Item13: TdxLayoutItem;
    tbServicos: TdxMemData;
    tbServicosDES_SERVICO: TStringField;
    tbServicosVAL_SERVICO: TFloatField;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dxLayoutControl1Item14: TdxLayoutItem;
    dsServico: TDataSource;
    cxGrid1DBTableView1RecId: TcxGridDBColumn;
    cxGrid1DBTableView1DES_SERVICO: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_SERVICO: TcxGridDBColumn;
    cxRoteiro: TcxComboBox;
    dxLayoutControl1Item15: TdxLayoutItem;
    aclOS: TActionList;
    actNova: TAction;
    actFechar: TAction;
    actCancelar: TAction;
    actLocalizar: TAction;
    actFiltrar: TAction;
    actSair: TAction;
    actGravar: TAction;
    actImprimir: TAction;
    cxButton1: TcxButton;
    dxLayoutControl1Item16: TdxLayoutItem;
    cxButton2: TcxButton;
    dxLayoutControl1Item17: TdxLayoutItem;
    dxLayoutControl1Group3: TdxLayoutAutoCreatedGroup;
    cxButton3: TcxButton;
    dxLayoutControl1Item18: TdxLayoutItem;
    cxButton4: TcxButton;
    dxLayoutControl1Item19: TdxLayoutItem;
    cxButton5: TcxButton;
    dxLayoutControl1Item20: TdxLayoutItem;
    cxButton6: TcxButton;
    dxLayoutControl1Item21: TdxLayoutItem;
    cxButton7: TcxButton;
    dxLayoutControl1Item22: TdxLayoutItem;
    cxButton8: TcxButton;
    dxLayoutControl1Item23: TdxLayoutItem;
    procedure dsServicoStateChange(Sender: TObject);
    procedure actNovaExecute(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Novo();
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOS: TfrmOS;

implementation

{$R *.dfm}

uses udm, uGlobais, clUtil;

procedure TfrmOS.actNovaExecute(Sender: TObject);
begin
  Novo();
end;

procedure TfrmOS.actSairExecute(Sender: TObject);
begin
  Perform(WM_CLOSE, 0, 0);
end;

procedure TfrmOS.dsServicoStateChange(Sender: TObject);
begin
  if TDataSource(Sender).DataSet.State in [dsInsert, dsEdit] then
  begin
    actNova.Enabled := True;
    actLocalizar.Enabled := False;
    actFiltrar.Enabled := False;
    actFechar.Enabled := True;
    actCancelar.Enabled := False;
    actImprimir.Enabled := False;
    actGravar.Enabled := True;
    actSair.Enabled := True;
  end
  else if TDataSource(Sender).DataSet.State in [dsBrowse] then
  begin
    actNova.Enabled := True;
    actLocalizar.Enabled := True;
    actFiltrar.Enabled := True;
    actFechar.Enabled := False;
    if TDataSource(Sender).DataSet.IsEmpty then
    begin
      actCancelar.Enabled := False;
    end
    else
    begin
      actCancelar.Enabled := True;
    end;
    if TDataSource(Sender).DataSet.IsEmpty then
    begin
      actImprimir.Enabled := False;
    end
    else
    begin
      actImprimir.Enabled := True;
    end;
    actGravar.Enabled := False;
    actSair.Enabled := True;
  end;
end;

procedure TfrmOS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tbServicos.Close;
  Action := caFree;
  frmOS := Nil;
end;

procedure TfrmOS.Novo();
begin
  TUtil.LimparFields(frmOS);
  tbServicos.Close;
  tbServicos.Open;
end;

end.
