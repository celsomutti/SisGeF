unit ufrmLocalizar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ActnList, DB, Grids, DBGrids,
  DBCtrls, Provider, DBClient, FMTBcd, SqlExpr, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxNavigator, cxDBNavigator, Menus, cxLookAndFeelPainters, cxButtons,
  cxLookAndFeels, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter,
  cxContainer, cxGroupBox, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, System.Actions;

type
  TfrmLocalizar = class(TForm)
    Panel1: TPanel;
    actFiltro: TActionList;
    actSair: TAction;
    actExecutar: TAction;
    actSelecionar: TAction;
    dsPesquisa: TDataSource;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxGroupBox1: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cboOperadoresSQL: TComboBox;
    cboCamposSQL: TComboBox;
    cboCamposDisplay: TComboBox;
    cboOperadores: TComboBox;
    txtParametro: TEdit;
    cxButton3: TcxButton;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    procedure cboCamposDisplayClick(Sender: TObject);
    procedure cboCamposSQLClick(Sender: TObject);
    procedure cboOperadoresClick(Sender: TObject);
    procedure cboOperadoresSQLClick(Sender: TObject);
    procedure actExecutarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure dsPesquisaStateChange(Sender: TObject);
    procedure txtParametroEnter(Sender: TObject);
    procedure cxGrid1Enter(Sender: TObject);
  private
    { Private declarations }
    sSQL, sOrdem, sFlagOrdem: string;
  public
    { Public declarations }
  end;

var
  frmLocalizar: TfrmLocalizar;

implementation

{$R *.dfm}

uses
  ufrmPrincipal, udm, StrUtils, RTLConsts, uGlobais, clUtil;

procedure TfrmLocalizar.cboCamposDisplayClick(Sender: TObject);
begin
  try
    cboCamposSQL.ItemIndex := cboCamposDisplay.ItemIndex;
  except
    on E: Exception do
      MessageDlg(E.Message, mtError, mbOKCancel, 0);
  end;
end;

procedure TfrmLocalizar.cboCamposSQLClick(Sender: TObject);
begin
  try
    cboCamposDisplay.ItemIndex := cboCamposSQL.ItemIndex;
  except
    on E: Exception do
      MessageDlg(E.Message, mtError, mbOKCancel, 0);
  end;
end;

procedure TfrmLocalizar.cboOperadoresClick(Sender: TObject);
begin
  try
    cboOperadoresSQL.ItemIndex := cboOperadores.ItemIndex;
  except
    on E: Exception do
      MessageDlg(E.Message, mtError, mbOKCancel, 0);
  end;
end;

procedure TfrmLocalizar.cboOperadoresSQLClick(Sender: TObject);
begin
  try
    cboOperadores.ItemIndex := cboOperadoresSQL.ItemIndex;
  except
    on E: Exception do
      MessageDlg(E.Message, mtError, mbOKCancel, 0);
  end;
end;

procedure TfrmLocalizar.actExecutarExecute(Sender: TObject);
var
  sParametro: string;
  iConta, i, iRet: Integer;
  d: Real;

begin
  try
    if txtParametro.Text = '' then
    begin
      Application.MessageBox('Nenhum parâmetro foi informado!', 'Atenção',
        MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
    sSQL := '';
    sOrdem := '';
    sFlagOrdem := '';
    cxGrid1DBTableView1.OptionsView.NoDataToDisplayInfoText := 'Aguarde...';
    cxGrid1.Refresh;
    dm.ZConn.PingServer;
    dm.qryPesquisa.Open;
    if dm.qryPesquisa.Fields[cboCamposSQL.ItemIndex].DataType
      in [ftWideString, ftFixedChar, ftFmtMemo, ftMemo, ftString, ftBlob] then
    begin
      if cboOperadoresSQL.ItemIndex = 2 then
      begin
        if pos('%', txtParametro.Text) > 0 then
        begin
          sParametro := QuotedStr(UpperCase(txtParametro.Text));
        end
        else
        begin
          sParametro := QuotedStr(UpperCase('%' + txtParametro.Text + '%'));
        end;
      end
      else
      begin
        sParametro := QuotedStr(UpperCase(txtParametro.Text));
      end;
    end
    else if dm.qryPesquisa.Fields[cboCamposSQL.ItemIndex].DataType
      in [ftDate, ftDateTime] then
    begin
      if not(TUtil.DataOk(txtParametro.Text)) then
      begin
        Application.MessageBox('Informe uma Data Válida!', 'Atenção!',
          MB_OK + MB_ICONWARNING);
        Exit;
      end;
      sParametro := QuotedStr(FormatDateTime('yyyy-mm-dd',
        StrToDate(txtParametro.Text)));
    end
    else if dm.qryPesquisa.Fields[cboCamposSQL.ItemIndex].DataType
      in [ftSmallint, ftInteger] then
    begin
      sParametro := txtParametro.Text;
      Val(sParametro, i, iRet);
      if iRet <> 0 then
      begin
        Application.MessageBox('Informe um Valor númérico, sem fração!',
          'Atenção!', MB_OK + MB_ICONWARNING);
        Exit;
      end;
    end
    else
    begin
      sParametro := txtParametro.Text;
      Val(sParametro, d, iRet);
      if iRet <> 0 then
      begin
        Application.MessageBox
          ('Informe um Valor númérico podendo conter fração!', 'Atenção!',
          MB_OK + MB_ICONWARNING);
        Exit;
      end;
    end;
    dm.qryPesquisa.Close;
    sSQL := cboCamposSQL.Text + cboOperadoresSQL.Text + sParametro;
    sOrdem := cboCamposSQL.Text;
    dm.qryPesquisa.SQL[1] := 'WHERE ' + sSQL;
    dm.ZConn.PingServer;
    dm.qryPesquisa.Open;
    frmLocalizar.cxGrid1DBTableView1.ClearItems;
    frmLocalizar.cxGrid1DBTableView1.DataController.CreateAllItems;
    for iConta := 0 to frmLocalizar.cboCamposDisplay.Items.Count - 1 do
      frmLocalizar.cxGrid1DBTableView1.Columns[iConta].Caption :=
        frmLocalizar.cboCamposDisplay.Items.Strings[iConta];
    if dm.qryPesquisa.RecordCount > 0 then
    begin
      cxGrid1.SetFocus;
      if dm.qryPesquisa.RecordCount = 1 then
      begin
        ModalResult := mrOk;
      end;
    end
    else
    begin
      cxGrid1DBTableView1.OptionsView.NoDataToDisplayInfoText :=
        '<Nenhum Registro Encontrado>';
      cxGrid1.Refresh;
      txtParametro.SetFocus;
    end;
  except
    on E: Exception do
      MessageDlg(E.Message, mtError, mbOKCancel, 0);
  end;
end;

procedure TfrmLocalizar.FormShow(Sender: TObject);
begin
  txtParametro.SetFocus;
end;

procedure TfrmLocalizar.txtParametroEnter(Sender: TObject);
begin
  cxButton1.Default := False;
  cxButton3.Default := True;
end;

procedure TfrmLocalizar.cxGrid1DBTableView1CellDblClick
  (Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  ModalResult := mrOk;
end;

procedure TfrmLocalizar.cxGrid1Enter(Sender: TObject);
begin
  cxButton1.Default := True;
  cxButton3.Default := False;
end;

procedure TfrmLocalizar.dsPesquisaStateChange(Sender: TObject);
begin
  if dsPesquisa.State = dsInactive then
    cxButton1.Enabled := False
  else
  begin
    if dm.qryPesquisa.RecordCount > 0 then
      cxButton1.Enabled := True;
  end;
end;

end.
