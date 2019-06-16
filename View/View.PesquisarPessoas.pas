unit View.PesquisarPessoas;

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
  ZAbstractDataset, ZDataset, cxRadioGroup, cxDropDownEdit, dxmdaset, DAO.Pesquisa, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TView_PesquisarPessoas = class(TForm)
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
    cboCampo: TcxComboBox;
    lcParametrosItem1: TdxLayoutItem;
    qryPesquisa: TdxMemData;
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
    procedure BuildSQLString();
  public
    { Public declarations }
    lListaCampos: TStringList;
    sTabela : String;
  end;

var
  View_PesquisarPessoas: TView_PesquisarPessoas;
  sSQL : String;
  pesquisa : TPesquisa;
implementation

{$R *.dfm}

uses FireDAC.Comp.Client, Common.Utils, Data.Module, Global.Parametros;

procedure TView_PesquisarPessoas.actFecharExecute(Sender: TObject);
begin
  ModalResult := mrClose;
end;

procedure TView_PesquisarPessoas.actLocalizarExecute(Sender: TObject);
begin
  InstantSearch();
end;

procedure TView_PesquisarPessoas.actSelecionarExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TView_PesquisarPessoas.edtTextoPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  actLocalizarExecute(Self);
end;

procedure TView_PesquisarPessoas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  lListaCampos.Free;
end;

procedure TView_PesquisarPessoas.FormCreate(Sender: TObject);
begin
  lListaCampos := TStringList.Create();
end;

procedure TView_PesquisarPessoas.FormShow(Sender: TObject);
begin
  edtTexto.SetFocus;
end;

procedure TView_PesquisarPessoas.grdPesquisaEnter(Sender: TObject);
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

procedure TView_PesquisarPessoas.grdPesquisaExit(Sender: TObject);
begin
  cxButton2.Default := False;
end;

procedure TView_PesquisarPessoas.InstantSearch();
var
  sFiltro, sCampo, sSQLNew : String;
  i : Integer;
  FDQuery: TFDQuery;
begin
  try
    sFiltro := '';
    sCampo := '';
    sSQLNew := '';
    pesquisa := TPesquisa.Create;
    FDQuery := TFDQuery.Create(Nil);
    if qryPesquisa.Active then
    begin
      qryPesquisa.Close;
    end;
    BuildSQLString;
    sCampo :=  lListaCampos[cboCampo.ItemIndex];
    if edtTexto.Text <> '' then
    begin
      sFiltro := sCampo + ' LIKE ' + QuotedStr('%' + edtTexto.Text + '%');
    end
    else
    begin
      sFiltro := '';
    end;
    if not sFiltro.IsEmpty then
    begin
      if Pos('WHERE', sTabela) = 0 then
      begin
        sSQLNew := 'SELECT ' + sSQL + ' FROM ' + sTabela + ' WHERE ' + Trim(sFiltro);
      end
      else
      begin
        sSQLNew := 'SELECT ' + sSQL + ' FROM ' + sTabela + ' AND ' + Trim(sFiltro);
      end;
    end
    else
    begin
      if Application.MessageBox('Listar todas as informações pode demandar mais tempo de espera no resultado. Deseja Continuar?',
                                'Atenção!', MB_YESNO + MB_ICONQUESTION) = IDNO then
      begin
        Exit;
      end;
      sSQLNew := 'SELECT ' + sSQL + ' FROM ' + sTabela;
    end;
    FDQuery := pesquisa.FindSQL(sSQLNew);
    if not FDQuery.IsEmpty then
    begin
      qryPesquisa.Open;
      if qryPesquisa.FieldCount = 0 then
      begin
        qryPesquisa.CreateFieldsFromDataSet(FDQuery);
      end;
      qryPesquisa.LoadFromDataSet(FDQuery);
      pesquisa.Free;
      tvPesquisa.ClearItems;
      tvPesquisa.DataController.CreateAllItems();
      if not qryPesquisa.IsEmpty then
      begin
        //Perform(Wm_NextDlgCtl, 0, 0);
        grdPesquisa.SetFocus;
      end
      else
      begin
        edtTexto.SetFocus;
      end;
      tvPesquisa.DataController.Refresh;
    end;
  finally
    FDQuery.Free;
  end;
end;

procedure TView_PesquisarPessoas.tvPesquisaCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  actSelecionarExecute(Sender);
end;

procedure TView_PesquisarPessoas.CaptionColumn();
var
  i : Integer;
begin
  for i := 0 to cboCampo.Properties.Items.Count - 1 do
  begin
    tvPesquisa.Columns[i].Caption := cboCampo.Properties.Items[i];
  end;
end;

procedure TView_PesquisarPessoas.BuildSQLString;
var
  i : integer;
  x : Integer;
begin
  i := 0;
  x := 0;
  sSQL := '';
  for i := 0 to lListaCampos.Count - 1 do
  begin
    if not sSQL.IsEmpty then
    begin
      sSQL := sSQL + ',';
    end;
    sSQL := sSQL + lListaCampos[i] + ' AS ' + QuotedStr(cboCampo.Properties.Items[i]);
  end;
end;

end.
