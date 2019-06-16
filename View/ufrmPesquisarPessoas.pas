unit ufrmPesquisarPessoas;

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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, dxLayoutContainer, dxLayoutControl, dxLayoutcxEditAdapters, cxContainer, cxEdit,
  cxGroupBox, cxCheckBox, cxTextEdit, cxMaskEdit, System.Actions, Vcl.ActnList, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, dxLayoutControlAdapters, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxCheckListBox, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, cxRadioGroup, cxDropDownEdit, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light;

type
  TfrmPesquisarPessoas = class(TForm)
    lcPesquisaGroup_Root: TdxLayoutGroup;
    lcPesquisa: TdxLayoutControl;
    lcParametrosGroup_Root: TdxLayoutGroup;
    lcParametros: TdxLayoutControl;
    lcPesquisaItem1: TdxLayoutItem;
    edtTexto: TcxMaskEdit;
    lcParametrosItem2: TdxLayoutItem;
    actPesquisar: TActionList;
    tvPesquisa: TcxGridDBTableView;
    lvPesquisa: TcxGridLevel;
    grdPesquisa: TcxGrid;
    lcPesquisaItem2: TdxLayoutItem;
    actLocalizar: TAction;
    actSelecionar: TAction;
    actFechar: TAction;
    cxButton1: TcxButton;
    lcPesquisaItem3: TdxLayoutItem;
    cxButton2: TcxButton;
    lcPesquisaItem4: TdxLayoutItem;
    lcPesquisaGroup1: TdxLayoutAutoCreatedGroup;
    cxButton3: TcxButton;
    lcPesquisaItem5: TdxLayoutItem;
    dsPesquisa: TDataSource;
    qryPesquisa: TZQuery;
    cboCampo: TcxComboBox;
    lcParametrosItem1: TdxLayoutItem;
    procedure actFecharExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtTextoPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure actLocalizarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actSelecionarExecute(Sender: TObject);
    procedure tvPesquisaCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
      AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure grdPesquisaEnter(Sender: TObject);
    procedure grdPesquisaExit(Sender: TObject);
  private
    { Private declarations }
    procedure InstantSearch();
    procedure CaptionColumn();
  public
    { Public declarations }
    lListaCampos: TStringList;
  end;

var
  frmPesquisarPessoas: TfrmPesquisarPessoas;
  sSQL : String;
implementation

{$R *.dfm}

uses udm, uGlobais, clUtil;

procedure TfrmPesquisarPessoas.actFecharExecute(Sender: TObject);
begin
  ModalResult := mrClose;
end;

procedure TfrmPesquisarPessoas.actLocalizarExecute(Sender: TObject);
begin
  InstantSearch();
end;

procedure TfrmPesquisarPessoas.actSelecionarExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmPesquisarPessoas.edtTextoPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  actLocalizarExecute(Self);
end;

procedure TfrmPesquisarPessoas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  lListaCampos.Free;
end;

procedure TfrmPesquisarPessoas.FormCreate(Sender: TObject);
begin
  lListaCampos := TStringList.Create();
end;

procedure TfrmPesquisarPessoas.FormShow(Sender: TObject);
begin
  sSQL := Trim(qryPesquisa.SQL.Text);
  edtTexto.SetFocus;
end;

procedure TfrmPesquisarPessoas.grdPesquisaEnter(Sender: TObject);
begin
  if not qryPesquisa.IsEmpty then
  begin
    cxButton2.Default := True;
  end
  else
  begin
    cxButton2.Default := False;
  end;
end;

procedure TfrmPesquisarPessoas.grdPesquisaExit(Sender: TObject);
begin
  cxButton2.Default := False;
end;

procedure TfrmPesquisarPessoas.InstantSearch();
var
  sFiltro, sCampo, sSQLNew : String;
  i : Integer;
begin
  try
    sFiltro := '';
    sCampo := '';
    sSQLNew := '';
    if qryPesquisa.Active then
    begin
      qryPesquisa.Close;
    end;
    if edtTexto.Text <> '' then
    begin
      sCampo :=  lListaCampos[cboCampo.ItemIndex];
      sFiltro := sCampo + ' LIKE ' + QuotedStr('%' + edtTexto.Text + '%');
      if not sFiltro.IsEmpty then
      begin
        sSQLNew := sSQL + ' WHERE ' + Trim(sFiltro);
        qryPesquisa.SQL.Text := sSQLNew;
      end;
    end;
    qryPesquisa.Open;
  finally
    tvPesquisa.ClearItems;
    tvPesquisa.DataController.CreateAllItems();
    CaptionColumn();
    tvPesquisa.DataController.Refresh;
    if not dm.qryPesquisa.IsEmpty then
    begin
      grdPesquisa.SetFocus;
    end
    else
    begin
      edtTexto.SetFocus;
    end;
  end;
end;

procedure TfrmPesquisarPessoas.tvPesquisaCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  actSelecionarExecute(Sender);
end;

procedure TfrmPesquisarPessoas.CaptionColumn();
var
  i : Integer;
begin
  for i := 0 to cboCampo.Properties.Items.Count - 1 do
  begin
    tvPesquisa.Columns[i].Caption := cboCampo.Properties.Items[i];
  end;
end;

end.
