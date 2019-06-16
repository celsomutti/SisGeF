unit ufrmVerbaCEP;

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
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxLabel, dxSkinscxPCPainter, dxLayoutContainer, dxLayoutControl, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxMaskEdit, cxCurrencyEdit, cxSpinEdit, cxBlobEdit, System.Actions, Vcl.ActnList,
  dxLayoutControlAdapters, Vcl.Menus, Vcl.StdCtrls, cxButtons;

type
  TfrmVerbaCEP = class(TForm)
    cxLabel27: TcxLabel;
    lcMainGroup_Root: TdxLayoutGroup;
    lcMain: TdxLayoutControl;
    tvVerbaCep: TcxGridDBTableView;
    lvVerbaCep: TcxGridLevel;
    grdVerbaCEP: TcxGrid;
    lcMainItem1: TdxLayoutItem;
    tvVerbaCepID_VERBA: TcxGridDBColumn;
    tvVerbaCepNUM_CEP_INICIAL: TcxGridDBColumn;
    tvVerbaCepNUM_CEP_FINAL: TcxGridDBColumn;
    tvVerbaCepVAL_VERBA: TcxGridDBColumn;
    tvVerbaCepCOD_GRUPO: TcxGridDBColumn;
    tvVerbaCepID_FAIXA: TcxGridDBColumn;
    tvVerbaCepDES_LOG: TcxGridDBColumn;
    aclCadastro: TActionList;
    actSair: TAction;
    cxButton1: TcxButton;
    lcMainItem2: TdxLayoutItem;
    dsCepVerba: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actSairExecute(Sender: TObject);
    procedure dsCepVerbaStateChange(Sender: TObject);
  private
    { Private declarations }
    procedure SetupGrupo;
    procedure SetupFaixas;
  public
    { Public declarations }
  end;

var
  frmVerbaCEP: TfrmVerbaCEP;

implementation

{$R *.dfm}

uses udm, uGlobais;

procedure TfrmVerbaCEP.actSairExecute(Sender: TObject);
begin
  Perform(WM_CLOSE, 0, 0);
end;

procedure TfrmVerbaCEP.dsCepVerbaStateChange(Sender: TObject);
begin
  if TDataSource(Sender).DataSet.State in [dsInsert] then
  begin
    tvVerbaCepDES_LOG.Visible := False;
  end
  else
  begin
    tvVerbaCepDES_LOG.Visible := True;
  end;
end;

procedure TfrmVerbaCEP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm.qryCepVerba.Close;
  Action := caFree;
  frmVerbaCEP := Nil;
end;

procedure TfrmVerbaCEP.FormShow(Sender: TObject);
begin
  if uGlobais.iNivelUsuario = 0 then
  begin
    tvVerbaCepDES_LOG.Visible := True;
  end
  else
  begin
    tvVerbaCepDES_LOG.Visible := False;
  end;
  SetupGrupo;
  SetupFaixas;
  dm.qryCepVerba.Open;
end;

procedure TfrmVerbaCEP.SetupGrupo;
begin
  try
    dm.qryPesquisa.Close;
    dm.qryPesquisa.SQL.Clear;
    dm.qryPesquisa.SQL.Text := 'SELECT MAX(COD_GRUPO) AS GRUPO from tbgruposverba';
    dm.qryPesquisa.Open;
    if not dm.qryPesquisa.IsEmpty then
    begin
      TcxSpinEditProperties(tvVerbaCepCOD_GRUPO.Properties).MaxValue := dm.qryPesquisa.FieldByName('GRUPO').AsInteger;
    end
    else
    begin
      TcxSpinEditProperties(tvVerbaCepCOD_GRUPO.Properties).MaxValue := 0;
    end;
  finally
    dm.qryPesquisa.Close;
    dm.qryPesquisa.SQL.Clear;
  end;
end;

procedure TfrmVerbaCEP.SetupFaixas;
begin
  try
    dm.qryPesquisa.Close;
    dm.qryPesquisa.SQL.Clear;
    dm.qryPesquisa.SQL.Text := 'SELECT MAX(ID_FAIXA) AS FAIXA from tbfaixaverba';
    dm.qryPesquisa.Open;
    if not dm.qryPesquisa.IsEmpty then
    begin
      TcxSpinEditProperties(tvVerbaCepID_FAIXA.Properties).MaxValue := dm.qryPesquisa.FieldByName('FAIXA').AsInteger;
    end
    else
    begin
      TcxSpinEditProperties(tvVerbaCepID_VERBA.Properties).MaxValue := 0;
    end;
  finally
    dm.qryPesquisa.Close;
    dm.qryPesquisa.SQL.Clear;
  end;
end;

end.
