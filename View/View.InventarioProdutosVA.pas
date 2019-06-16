unit View.InventarioProdutosVA;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Model.ProdutosVA, Model.InventarioProdutosVA, DAO.ProdutosVA, DAO.InventarioProdutosVA,
  System.Generics.Collections, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, dxLayoutContainer, dxLayoutControl, cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  dxLayoutcxEditAdapters, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, Data.DB, dxmdaset, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, dxLayoutControlAdapters, Vcl.Menus, System.Actions, Vcl.ActnList, Vcl.StdCtrls, cxButtons,
  cxGridExportLink, ShellAPI;

type
  Tview_InventarioProdutosVA = class(TForm)
    lcgRoot: TdxLayoutGroup;
    lcInventario: TdxLayoutControl;
    edtData: TcxDateEdit;
    lciData: TdxLayoutItem;
    tbInventario: TdxMemData;
    tbInventarioID_PRODUTO: TIntegerField;
    tbInventarioCOD_BANCA: TIntegerField;
    tbInventarioCOD_PRODUTO: TStringField;
    tbInventarioDES_PRODUTO: TStringField;
    tbInventarioCOD_BARRAS: TStringField;
    tbInventarioDAT_INVENTARIO: TDateField;
    tbInventarioQTD_PRODUTO: TFloatField;
    ds: TDataSource;
    tvInventario: TcxGridDBTableView;
    lvInventario: TcxGridLevel;
    grdInventario: TcxGrid;
    lciGrade: TdxLayoutItem;
    tvInventarioRecId: TcxGridDBColumn;
    tvInventarioID_PRODUTO: TcxGridDBColumn;
    tvInventarioCOD_BANCA: TcxGridDBColumn;
    tvInventarioCOD_PRODUTO: TcxGridDBColumn;
    tvInventarioDES_PRODUTO: TcxGridDBColumn;
    tvInventarioCOD_BARRAS: TcxGridDBColumn;
    tvInventarioDAT_INVENTARIO: TcxGridDBColumn;
    tvInventarioQTD_PRODUTO: TcxGridDBColumn;
    edtCodigo: TcxTextEdit;
    lciBarras: TdxLayoutItem;
    aclInventario: TActionList;
    btnGravar: TcxButton;
    lciGravar: TdxLayoutItem;
    actGravar: TAction;
    actCancelar: TAction;
    actFechar: TAction;
    btnCancelar: TcxButton;
    lciCancelar: TdxLayoutItem;
    btnFechar: TcxButton;
    lciFechar: TdxLayoutItem;
    lcgOpcoes: TdxLayoutAutoCreatedGroup;
    actExportar: TAction;
    btnExportar: TcxButton;
    lciExportar: TdxLayoutItem;
    SaveDialog: TSaveDialog;
    procedure edtCodigoPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure edtCodigoPropertiesEditValueChanged(Sender: TObject);
    procedure actGravarExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
    procedure edtDataPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure actExportarExecute(Sender: TObject);
  private
    { Private declarations }
    function VerificaGrade(sCodigo: String): Boolean;
    function ProcuraProduto(sBarras: String): Boolean;
    procedure GravaProduto(sBarras: String);
    procedure GravaBarras(sBarras: String);
    procedure GravaInventarios;
    procedure CancelarInventario;
    procedure PopulaInventario;
    procedure Exportar;
  public
    { Public declarations }
  end;

var
  view_InventarioProdutosVA: Tview_InventarioProdutosVA;
  produto : TProdutosVA;
  produtoTMP: TProdutosVA;
  produtos : TObjectList<TProdutosVA>;
  produtoDAO : TProdutosVADAO;
  inventario : TInventarioProdutosVA;
  inventarioTMP: TInventarioProdutosVA;
  inventarios : TObjectList<TInventarioProdutosVA>;
  inventarioDAO : TInventarioProdutosVADAO;

implementation

{$R *.dfm}

uses udm, uGlobais, View.CadastroProdutoVA;

function Tview_InventarioProdutosVA.VerificaGrade(sCodigo: string): Boolean;
var
  dQtde: Double;
begin
  Result := False;
  dQtde := 0;
  if not tbInventario.Locate('COD_BARRAS',sCodigo,[]) then
  begin
    Exit;
  end;
  dQtde := tbInventarioQTD_PRODUTO.AsFloat;
  dQtde := dQtde + 1;
  tbInventario.Edit;
  tbInventarioQTD_PRODUTO.AsFloat := dQtde;
  tbInventario.Post;
  Result := True;
end;

function Tview_InventarioProdutosVA.ProcuraProduto(sBarras: string): Boolean;
var
  produtoDAO: TProdutosVADAO;
begin
  Result := False;
  try
    produtoDAO := TProdutosVADAO.Create();
    produtos := produtoDAO.FindByBarras(sBarras);
    if produtos.Count > 0 then
    begin
      for produtoTMP in produtos do
      begin
        tbInventario.Insert;
        tbInventarioID_PRODUTO.AsInteger := produtoTMP.ID;
        tbInventarioCOD_BANCA.AsInteger := 0;
        tbInventarioCOD_PRODUTO.AsString := produtoTMP.Codigo;
        tbInventarioDES_PRODUTO.AsString := produtoTMP.Descricao;
        tbInventarioCOD_BARRAS.AsString := produtoTMP.Barras;
        tbInventarioDAT_INVENTARIO.AsDateTime := edtData.Date;
        tbInventarioQTD_PRODUTO.AsFloat := 1;
        tbInventario.Post;
      end;
    end
    else
    begin
      Exit;
    end;
    Result := True;
  finally
    produtoDAO.Free;
  end;
end;

procedure Tview_InventarioProdutosVA.GravaProduto(sBarras: String);
var
  produtoDAO: TProdutosVADAO;
  produto: TProdutosVA;
begin
  produtoDAO := TProdutosVADAO.Create();
  produto := TProdutosVA.Create();
  if not Assigned(view_CadastroProdutoVA) then
  begin
    view_CadastroProdutoVA := Tview_CadastroProdutoVA.Create(Application);
  end;
  view_CadastroProdutoVA.edtBarras.Text := sBarras;
  if view_CadastroProdutoVA.ShowModal = mrOk then
  begin
    produto.Codigo := view_CadastroProdutoVA.edtCodigo.Text;
    produto.Descricao := view_CadastroProdutoVA.edtDescricao.Text;
    produto.Diario := 0;
    produto.Barras := view_CadastroProdutoVA.edtBarras.Text;
    produto.Log := FormatDateTime('dd/mm/yyyy hh:mm:ss', Now())+ ' inserido pelo usuário ' + uGlobais.sUsuario;
    if not produtoDAO.Insert(produto) then
    begin
      Application.MessageBox('Erro ao incluir o produto!','Atenção!', MB_OK + MB_ICONERROR);
    end
    else
    begin
      tbInventario.Insert;
      tbInventarioID_PRODUTO.AsInteger := PRODUTO.ID;
      tbInventarioCOD_BANCA.AsInteger := 0;
      tbInventarioCOD_PRODUTO.AsString := produto.Codigo;
      tbInventarioDES_PRODUTO.AsString := produto.Descricao;
      tbInventarioCOD_BARRAS.AsString := produto.Barras;
      tbInventarioDAT_INVENTARIO.AsDateTime := edtData.Date;
      tbInventarioQTD_PRODUTO.AsFloat := 1;
      tbInventario.Post;
    end;
    FreeAndNil(view_CadastroProdutoVA);
  end;
end;

procedure Tview_InventarioProdutosVA.actCancelarExecute(Sender: TObject);
begin
  if Application.MessageBox('Confirma Cancelar o Inventário?','Cancelar', MB_YESNO + MB_ICONQUESTION) = IDNO then Exit;
  CancelarInventario;
end;

procedure Tview_InventarioProdutosVA.actExportarExecute(Sender: TObject);
begin
  Exportar;
end;

procedure Tview_InventarioProdutosVA.actFecharExecute(Sender: TObject);
begin
  Perform(WM_CLOSE, 0, 0);
end;

procedure Tview_InventarioProdutosVA.actGravarExecute(Sender: TObject);
begin
  if tbInventario.IsEmpty then Exit;
  if Application.MessageBox('Confirma gravar o Inventário no Banco de Dados?','Gravar', MB_YESNO + MB_ICONQUESTION) = IDNO then
    Exit;
  GravaInventarios;
end;

procedure Tview_InventarioProdutosVA.edtCodigoPropertiesEditValueChanged(Sender: TObject);
begin
  edtCodigo.Clear;
  edtCodigo.SetFocus;
end;

procedure Tview_InventarioProdutosVA.edtCodigoPropertiesValidate(Sender: TObject; var DisplayValue: Variant;
  var ErrorText: TCaption; var Error: Boolean);
begin
  GravaBarras(DisplayValue);
end;

procedure Tview_InventarioProdutosVA.edtDataPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  PopulaInventario;
end;

procedure Tview_InventarioProdutosVA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tbInventario.Close;
  Action := caFree;
  view_InventarioProdutosVA := Nil;
end;

procedure Tview_InventarioProdutosVA.FormShow(Sender: TObject);
begin
  tbInventario.Open;
end;

procedure Tview_InventarioProdutosVA.GravaBarras(sBarras: String);
begin
  if VerificaGrade(sBarras) then Exit;
  if ProcuraProduto(sBarras) then Exit;
  GravaProduto(sBarras);
  Beep;
end;

procedure Tview_InventarioProdutosVA.GravaInventarios;
var
  inventarioDAO: TInventarioProdutosVADAO;
  inventario: TInventarioProdutosVA;
  sLog: String;
begin
  try
    inventarioDAO := TInventarioProdutosVADAO.Create();
    inventario := TInventarioProdutosVA.Create();
    sLog := '';
    if not tbInventario.IsEmpty then tbInventario.First;
    while not tbInventario.Eof do
    begin
      inventario.ID := 0;
      inventarios := inventarioDAO.FindByInventario(tbInventarioID_PRODUTO.AsInteger, tbInventarioDAT_INVENTARIO.AsDateTime,
                                                    tbInventarioCOD_BANCA.AsInteger);
      for inventarioTMP in inventarios do
      begin
        if inventarioTMP.ID <> 0 then
        begin
          inventario.ID := inventarioTMP.ID;
          sLog := inventarioTMP.Log;
        end;
      end;
      inventario.Produto := tbInventarioID_PRODUTO.AsInteger;
      inventario.Data := tbInventarioDAT_INVENTARIO.AsDateTime;
      inventario.Qtde := tbInventarioQTD_PRODUTO.AsFloat;
      if sLog.IsEmpty then
      begin
        inventario.Log := FormatDateTime('dd/mm/yyyy hh:mm:ss', Now()) + ' inserido por ' + uGlobais.sUsuario;
      end
      else
      begin
        inventario.Log := sLog + #13 + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now()) + ' editado por ' + uGlobais.sUsuario;
      end;
      if inventario.ID = 0 then
      begin
        if not inventarioDAO.Insert(inventario) then
        begin
          Application.MessageBox('Erro ao incluir o Inventário!','Atenção!', MB_OK + MB_ICONERROR);
        end;
      end
      else
      begin
        if not inventarioDAO.Update(inventario) then
        begin
          Application.MessageBox('Erro ao editar o Inventário!','Atenção!', MB_OK + MB_ICONERROR);
        end;
      end;
      tbInventario.Next;
    end;
    Application.MessageBox('Inventário gravado com sucesso!','Atenção!', MB_OK + MB_ICONINFORMATION);
    CancelarInventario;
  finally
    inventario.Free;
    inventarioDAO.Free;
  end;
end;

procedure Tview_InventarioProdutosVA.CancelarInventario;
begin
  tbInventario.Close;
  tbInventario.Open;
  edtData.Clear;
  edtCodigo.Clear;
  edtCodigo.Enabled := True;
  actGravar.Enabled := True;
  edtData.SetFocus;
end;

procedure Tview_InventarioProdutosVA.PopulaInventario;
var
  inventarioDAO: TInventarioProdutosVADAO;
  produtoDAO: TProdutosVADAO;
begin
  inventarioDAO := TInventarioProdutosVADAO.Create();
  produtoDAO := TProdutosVADAO.Create();
  tbInventario.Close;
  tbInventario.Open;
  inventarios := inventarioDAO.FindByData(edtData.Date);
  for inventarioTMP in inventarios do
  begin
    tbInventario.Insert;
    tbInventarioDAT_INVENTARIO.AsDateTime := inventarioTMP.Data;
    tbInventarioQTD_PRODUTO.AsFloat := inventarioTMP.Qtde;
    produtos := produtoDAO.FindByID(inventarioTMP.Produto);
    for produtoTMP in produtos do
    begin
      tbInventarioCOD_PRODUTO.AsString := produtoTMP.Codigo;
      tbInventarioDES_PRODUTO.AsString := produtoTMP.Descricao;
      tbInventarioCOD_BARRAS.AsString := produtoTMP.Barras;
    end;
    tbInventario.Post;
  end;
  if not tbInventario.IsEmpty then
  begin
    edtCodigo.Enabled := False;
    actGravar.Enabled := False;
    tbInventario.First;
  end
  else
  begin
    edtCodigo.Enabled := True;
    actGravar.Enabled := True;
    edtCodigo.SetFocus;
  end;
  inventarioDAO.Free;
  produtoDAO.Free;
end;

procedure Tview_InventarioProdutosVA.Exportar;
var
  FileExt, sFile: String;
begin
  if not tbInventario.Active then
  begin
    Exit;
  end;
  if tbInventario.IsEmpty then
  begin
    Exit;
  end;
  try
    tvInventario.ViewData.Expand(True);
    sFile := 'inventario_VA_';
    SaveDialog.FileName := sFile;
    SaveDialog.Filter := '';
    SaveDialog.Filter :=
      'Excel (*.xls) |*.xls|XML (*.xml) |*.xml|Arquivo Texto (*.txt) |*.txt|Página Web (*.html)|*.html';
    SaveDialog.Title := 'Exportar Dados';
    SaveDialog.DefaultExt := 'xls';
    if SaveDialog.Execute then
    begin
      FileExt := LowerCase(ExtractFileExt(SaveDialog.FileName));
      if FileExt = '.xls' then
        ExportGridToExcel(SaveDialog.FileName, grdInventario, False, True, False)
      else if FileExt = '.xml' then
        ExportGridToXML(SaveDialog.FileName, grdInventario, False)
      else if FileExt = '.txt' then
        ExportGridToText(SaveDialog.FileName, grdInventario, False)
      else if FileExt = '.html' then
        ExportGridToText(SaveDialog.FileName, grdInventario, False);
      ShellExecute(Handle, 'open', pchar(SaveDialog.FileName), nil, nil, SW_SHOW);
    end;
  finally
  end;
end;

end.
