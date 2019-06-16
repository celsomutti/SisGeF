unit View.DigitacaoEncalheExpedicao;

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
  Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, Data.DB, System.Actions, Vcl.ActnList, dxLayoutControlAdapters, Vcl.Menus, Vcl.StdCtrls, cxButtons, dxmdaset,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, Model.ProdutosVA, DAO.ProdutosVA, Model.RemessasVA,
  DAO.RemessasVA, Model.BancaVA, DAO.BancaVA, System.Generics.Collections, cxCheckBox, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  Tview_DigitacaoEncalheExpedicao = class(TForm)
    lcgRoot: TdxLayoutGroup;
    lcEncalhe: TdxLayoutControl;
    lblTitulo: TcxLabel;
    lciTitulo: TdxLayoutItem;
    lcgFiltro: TdxLayoutGroup;
    edtDataDevolucao: TcxDateEdit;
    lciDataDevolucao: TdxLayoutItem;
    mskCodigoBanca: TcxMaskEdit;
    lciCodigoBanca: TdxLayoutItem;
    lcbNomebanca: TcxLookupComboBox;
    lciNomeBanca: TdxLayoutItem;
    dsBancas: TDataSource;
    aclEncalhes: TActionList;
    actFiltrar: TAction;
    btnFiltrar: TcxButton;
    lciFiltrar: TdxLayoutItem;
    lcgEncalhe: TdxLayoutGroup;
    edtCodigo: TcxTextEdit;
    lciCodigo: TdxLayoutItem;
    tbEncalhe: TdxMemData;
    tvEncalhe: TcxGridDBTableView;
    lvEncalhe: TcxGridLevel;
    grdEncalhe: TcxGrid;
    lciEncalhes: TdxLayoutItem;
    tbEncalheCOD_BARRAS: TStringField;
    tbEncalheCOD_PRODUTO: TStringField;
    tbEncalheDES_PRODUTO: TStringField;
    tbEncalheQTD_ENCALHE: TFloatField;
    dsEncalhes: TDataSource;
    tvEncalheCOD_BARRAS: TcxGridDBColumn;
    tvEncalheCOD_PRODUTO: TcxGridDBColumn;
    tvEncalheDES_PRODUTO: TcxGridDBColumn;
    tvEncalheQTD_ENCALHE: TcxGridDBColumn;
    actCancelar: TAction;
    actGravar: TAction;
    actFechar: TAction;
    btnCancelar: TcxButton;
    lciCancelar: TdxLayoutItem;
    btnGravar: TcxButton;
    lciGravar: TdxLayoutItem;
    lcEncalheGroup1: TdxLayoutAutoCreatedGroup;
    btnFechar: TcxButton;
    lciFechar: TdxLayoutItem;
    chkAdicionar: TcxCheckBox;
    lciAdicionar: TdxLayoutItem;
    tbEncalheID_REMESSA: TIntegerField;
    tbEncalheDES_LOG: TMemoField;
    tbEncalheQTD_REMESSA: TFloatField;
    tvEncalheQTD_REMESSA: TcxGridDBColumn;
    tbEncalheQTD_RECOBERTURA: TFloatField;
    tbEncalheDAT_REMESSA: TDateField;
    tvEncalheDAT_REMESSA: TcxGridDBColumn;
    tvEncalheQTD_RECOBERTURA: TcxGridDBColumn;
    tbEncalheDOM_DIVERGENCIA: TSmallintField;
    procedure actFiltrarExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure lcbNomebancaPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure mskCodigoBancaPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure actGravarExecute(Sender: TObject);
    procedure tbEncalheBeforePost(DataSet: TDataSet);
    procedure edtCodigoPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure edtCodigoPropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
    function ProcuraBanca(): Boolean;
    function RegraData(sData: String): Boolean;
    procedure FiltroRemessas();
    procedure LocalizaProduto(sValor: String);
    procedure Cancelar();
    procedure GravarRemessa();
  public
    { Public declarations }
  end;

var
  view_DigitacaoEncalheExpedicao: Tview_DigitacaoEncalheExpedicao;
  banca : TBancaVA;
  bancaTMP : TBancaVA;
  bancas : TObjectList<TBancaVA>;
  bancaDAO : TBancaVADAO;

  produto : TProdutosVA;
  produtoTMP : TProdutosVA;
  produtos : TObjectList<TProdutosVA>;
  produtoDAO : TProdutosVADAO;

  remessa : TRemessasVA;
  remessaTMP : TRemessasVA;
  remessas : TObjectList<TRemessasVA>;
  remessaDAO : TRemessasVADAO;

implementation

{$R *.dfm}

uses udm, View.ListaProdutosVA, uGlobais;

function Tview_DigitacaoEncalheExpedicao.ProcuraBanca(): Boolean;
begin
  Result := False;
  bancaDAO := TBancaVADAO.Create();
  bancas := bancaDAO.FindByCodigo(StrToIntDef(mskCodigoBanca.Text,0));
  if bancas.Count = 0 then
  begin
    Application.MessageBox('Código de Banca não cadastrado!', 'Atenção!', MB_ICONEXCLAMATION + MB_OK);
    mskCodigoBanca.SetFocus;
    Exit;
  end;
  for bancaTMP in bancas do
  begin
    lcbNomebanca.EditValue :=  bancaTMP.Codigo;
  end;
  bancaDAO.Free;
  bancaTMP.Free;
  Result := True;
end;

procedure Tview_DigitacaoEncalheExpedicao.actCancelarExecute(Sender: TObject);
begin
  if Application.MessageBox('Confirma Cancelar a Operação?', 'Cancelar', MB_YESNO + MB_ICONQUESTION) = IDNO then Exit;
  Cancelar;
end;

procedure Tview_DigitacaoEncalheExpedicao.actFecharExecute(Sender: TObject);
begin
  Perform(WM_CLOSE, 0, 0);
end;

procedure Tview_DigitacaoEncalheExpedicao.actFiltrarExecute(Sender: TObject);
begin
  if uGlobais.iNivelUsuario > 1 then
  begin
    if not RegraData(edtDataDevolucao.Text) then Exit;
  end;
  if not ProcuraBanca() then Exit;
  FiltroRemessas;
end;

procedure Tview_DigitacaoEncalheExpedicao.actGravarExecute(Sender: TObject);
begin
  if Application.MessageBox('Confirma gravar os encalhes?', 'Gravar', MB_YESNO + MB_ICONQUESTION) = IDNO then Exit;
  GravarRemessa;
end;

procedure Tview_DigitacaoEncalheExpedicao.FiltroRemessas;
var
  iInventario : SmallInt;
begin
  remessaDAO := TRemessasVADAO.Create();
  produtoDAO := TProdutosVADAO.Create();
  remessas := remessaDAO.FindByMovimento(0,StrToIntDef(mskCodigoBanca.Text,0),1,'',edtDataDevolucao.Date);
  tbEncalhe.Close;
  tbEncalhe.Open;
  edtCodigo.Enabled := True;
  dsEncalhes.AutoEdit := True;
  btnGravar.Enabled := True;
  iInventario := 0;
  for remessaTMP in remessas do
  begin
    tbEncalhe.Insert;
    produtos := produtoDAO.FindByCodigo(remessaTMP.Produto);
    if produtos.Count > 0 then
    begin
      tbEncalheCOD_BARRAS.AsString := produtos[0].Barras;
      tbEncalheDES_PRODUTO.AsString := produtos[0].Descricao;
    end;
    tbEncalheDAT_REMESSA.AsDateTime := remessaTMP.DataRemessa;
    tbEncalheCOD_PRODUTO.AsString := remessaTMP.Produto;
    tbEncalheQTD_REMESSA.AsFloat := remessaTMP.Remessa;
    tbEncalheQTD_RECOBERTURA.AsFloat := remessaTMP.Recobertura;
    tbEncalheQTD_ENCALHE.AsFloat := remessaTMP.Encalhe;
    tbEncalheID_REMESSA.AsInteger:= remessaTMP.Id;
    tbEncalheDES_LOG.Text := remessaTMP.Log;
    if remessaTMP.Inventario > 0 then iInventario := remessaTMP.Inventario;
  end;
  remessaDAO.Free;
  produtoDAO.Free;
  if not tbEncalhe.IsEmpty then tbEncalhe.First;
  if iInventario > 0 then
  begin
    Application.MessageBox('DEVOLUÇÃO COM REMESSA FECHADA! Digitação Bloqueada.', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    edtCodigo.Enabled := False;
    dsEncalhes.AutoEdit := False;
    btnGravar.Enabled := False;
    Exit;
  end;
  edtCodigo.SetFocus;
end;

procedure Tview_DigitacaoEncalheExpedicao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm.fdqBancas.Close;
  dm.FDConn.Close;
  tbEncalhe.Close;
  Action := caFree;
  view_DigitacaoEncalheExpedicao := Nil;
end;

procedure Tview_DigitacaoEncalheExpedicao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then
  begin
    if grdEncalhe.IsFocused then
    begin
      Exit;
    end;
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure Tview_DigitacaoEncalheExpedicao.FormShow(Sender: TObject);
begin
  dm.fdqBancas.Open();
end;

procedure Tview_DigitacaoEncalheExpedicao.lcbNomebancaPropertiesValidate(Sender: TObject; var DisplayValue: Variant;
  var ErrorText: TCaption; var Error: Boolean);
begin
  mskCodigoBanca.Text := lcbNomebanca.EditValue;
end;

procedure Tview_DigitacaoEncalheExpedicao.LocalizaProduto(sValor: String);
begin
  try
    if sValor.IsEmpty then Exit;
    if not tbEncalhe.Active then Exit;
    produtoDAO := TProdutosVADAO.Create();
    produtos := produtoDAO.FindByEncalhe(sValor);
    remessaDAO := TRemessasVADAO.Create();
    if produtos.Count = 1 then
    begin
      if tbEncalhe.Locate('COD_PRODUTO',produtos[0].Codigo,[]) then
      begin
        if chkAdicionar.Checked then
        begin
          tbencalhe.IsLoading := True;
          tbEncalhe.Edit;
          tbEncalheQTD_ENCALHE.AsFloat := tbEncalheQTD_ENCALHE.AsFloat + 1;
          tbEncalhe.Post;
          tbencalhe.IsLoading := False;
          edtCodigo.SetFocus;
        end
        else
        begin
          tvEncalheQTD_ENCALHE.FocusWithSelection;
        end;
      end
          else
      begin
        if produtos[0].Diario = 0 then
        begin
          remessas := remessaDAO.FindByMovimento(0,StrToIntDef(mskCodigoBanca.Text,0),-1,produtos[0].Codigo,0);
          if remessas.Count > 0 then
          begin
            if remessas[0].Inventario = 0 then
            begin
              tbencalhe.IsLoading := True;
              tbEncalhe.Insert;
              tbEncalheCOD_BARRAS.AsString := produtos[0].Barras;
              tbEncalheCOD_PRODUTO.AsString := produtos[0].Codigo;
              tbEncalheDES_PRODUTO.AsString := produtos[0].Descricao;
              tbEncalheDAT_REMESSA.AsDateTime := remessas[0].DataRemessa;
              tbEncalheQTD_REMESSA.AsFloat := remessas[0].Remessa;
              tbEncalheQTD_ENCALHE.AsFloat := 1;
              tbEncalheID_REMESSA.AsInteger := remessas[0].Id;
              tbEncalheDOM_DIVERGENCIA.AsInteger := 0;
              tbEncalhe.Post;
              tbencalhe.IsLoading := False;
            end
            else
            begin
              Application.MessageBox('Produto com o encalhe encerrado para esta banca!', 'Atenção!', MB_OK + MB_ICONASTERISK);
              Exit;
            end;
          end
          else
          begin
            Application.MessageBox('Não existe remessa para este produto!', 'Atenção!', MB_OK + MB_ICONASTERISK);
            Exit;
          end;
        end;
      end;
      produtos.Clear;
    end
    else if produtos.Count > 1 then
    begin
      if not Assigned(view_ListaProdutosVA) then
      begin
        view_ListaProdutosVA := Tview_ListaProdutosVA.Create(Application);
      end;
      view_ListaProdutosVA.tbProdutos.Open;
      for produtoTMP in produtos do
      begin
        view_ListaProdutosVA.tbProdutos.Insert;
        view_ListaProdutosVA.tbProdutosCOD_BARRAS.AsString := produtoTMP.Barras;
        view_ListaProdutosVA.tbProdutosCOD_PRODUTO.AsString := produtoTMP.Codigo;
        view_ListaProdutosVA.tbProdutosDES_PRODUTO.AsString := produtoTMP.Descricao;
        view_ListaProdutosVA.tbProdutos.Post;
      end;
      if not view_ListaProdutosVA.tbProdutos.IsEmpty then view_ListaProdutosVA.tbProdutos.First;
      if view_ListaProdutosVA.ShowModal = mrOK then
      begin
        if tbEncalhe.Locate('COD_PRODUTO',view_ListaProdutosVA.tbProdutosCOD_PRODUTO.AsString,[]) then
        begin
          if chkAdicionar.Checked then
          begin
            if tbEncalheQTD_ENCALHE.AsFloat < tbEncalheQTD_REMESSA.AsFloat then
            begin
              tbencalhe.IsLoading := True;
              tbEncalhe.Edit;
              tbEncalheQTD_ENCALHE.AsFloat := tbEncalheQTD_ENCALHE.AsFloat + 1;
              tbEncalhe.Post;
              tbencalhe.IsLoading := False;
            end
            else
            begin
              Application.MessageBox('Quantidade de encalhe não pode ser maior que a quantidade de remessa!', 'Atenção', MB_OK +
                                      MB_ICONASTERISK);
            end;
          end
          else
          begin
            tvEncalheQTD_ENCALHE.FocusWithSelection;
          end;
        end
        else
        begin
          if produtos[0].Diario = 0 then
          begin
            remessas := remessaDAO.FindByMovimento(0,StrToIntDef(mskCodigoBanca.Text,0),-1,
                                                   view_ListaProdutosVA.tbProdutosCOD_PRODUTO.AsString,0);
            if remessas.Count > 0 then
            begin
              if remessas[0].Inventario = 0 then
              begin
                tbencalhe.IsLoading := True;
                tbEncalhe.Insert;
                tbEncalheCOD_BARRAS.AsString := view_ListaProdutosVA.tbProdutosCOD_BARRAS.AsString;
                tbEncalheCOD_PRODUTO.AsString := view_ListaProdutosVA.tbProdutosCOD_PRODUTO.AsString;
                tbEncalheDES_PRODUTO.AsString := view_ListaProdutosVA.tbProdutosDES_PRODUTO.AsString;
                tbEncalheDAT_REMESSA.AsDateTime := remessas[0].DataRemessa;
                tbEncalheQTD_REMESSA.AsFloat := remessas[0].Remessa;
                tbEncalheQTD_ENCALHE.AsFloat := 1;
                tbEncalheID_REMESSA.AsInteger := remessas[0].Id;
                tbEncalhe.Post;
                tbencalhe.IsLoading := False;
              end
              else
              begin
                Application.MessageBox('Produto com o encalhe encerrado para esta banca!', 'Atenção!', MB_OK + MB_ICONASTERISK);
                Exit;
              end;
            end
            else
            begin
              Application.MessageBox('Não existe remessa para este produto!', 'Atenção!', MB_OK + MB_ICONASTERISK);
              Exit;
            end;
          end;
        end;
      end;
      FreeAndNil(view_ListaProdutosVA);
      produtos.Clear;
    end;
  finally
    produtos.Free;
    produtoDAO.Free;
    remessaDAO.Free;
  end;
end;

procedure Tview_DigitacaoEncalheExpedicao.mskCodigoBancaPropertiesValidate(Sender: TObject; var DisplayValue: Variant;
  var ErrorText: TCaption; var Error: Boolean);
begin
  lcbNomebanca.EditValue := StrToIntDef(mskCodigoBanca.Text, 0);
end;

procedure Tview_DigitacaoEncalheExpedicao.Cancelar;
begin
  edtDataDevolucao.Clear;
  mskCodigoBanca.Clear;
  lcbNomebanca.Clear;
  edtCodigo.Clear;
  tbEncalhe.Close;
  tbEncalhe.Open;
  edtDataDevolucao.SetFocus;
end;

procedure Tview_DigitacaoEncalheExpedicao.edtCodigoPropertiesEditValueChanged(Sender: TObject);
begin
  edtCodigo.Clear;
  edtCodigo.SetFocus;
end;

procedure Tview_DigitacaoEncalheExpedicao.edtCodigoPropertiesValidate(Sender: TObject; var DisplayValue: Variant;
  var ErrorText: TCaption; var Error: Boolean);
begin
  LocalizaProduto(DisplayValue);
end;

function Tview_DigitacaoEncalheExpedicao.RegraData(sData: String): Boolean;
var
  dtDataLimite: TDate;
  dtDataAtual: TDate;
  dtDataInformada: TDate;
  iDia: Integer;
begin
  Result := False;
  if sData.IsEmpty then
  begin
    Application.MessageBox('Informe a Data da Devolução!', 'Atenção!', MB_ICONEXCLAMATION + MB_OK);
    edtDataDevolucao.SetFocus;
    Exit;
  end;
  dtDataInformada := StrToDateDef(sData,Date());
  dtDataAtual := Date();
  iDia := DayOfWeek(dtDataAtual);
  if iDia = 2 then
  begin
    dtDataLimite := Date() - 4;
  end
  else if iDia = 3 then
  begin
    dtDataLimite := Date() - 4;
  end
  else if (iDia > 3) and (iDia < 7) then
  begin
    dtDataLimite := Date() - 1;
  end;
  if dtDataInformada < dtDataLimite then
  begin
    Application.MessageBox('Data de Devolução vencida! Digitação de encalhe bloqueada.', 'Atenção!', MB_ICONEXCLAMATION + MB_OK);
    edtDataDevolucao.SetFocus;
    Exit;
  end;
  if dtDataInformada > dtDataAtual then
  begin
    Application.MessageBox('Data de Devolução ainda não liberada! Digitação de encalhe bloqueada.', 'Atenção!',
                           MB_ICONEXCLAMATION + MB_OK);
    edtDataDevolucao.SetFocus;
    Exit;
  end;
  Result := True;
end;

procedure Tview_DigitacaoEncalheExpedicao.tbEncalheBeforePost(DataSet: TDataSet);
begin
  if not tbEncalhe.IsLoading then
  begin
    if tbEncalheQTD_ENCALHE.AsFloat > tbEncalheQTD_REMESSA.AsFloat then
    begin
      Application.MessageBox('Quantidade de encalhe não pode ser maior que a quantidade de remessa!', 'Atenção', MB_OK +
                             MB_ICONASTERISK);
      tvEncalheQTD_ENCALHE.FocusWithSelection;
      Abort;
    end;
  end;
end;

procedure Tview_DigitacaoEncalheExpedicao.GravarRemessa;
var
  iDistribuidor : Integer;
  lLog : TStringList;
begin
  if tbEncalhe.IsEmpty then Exit;
  lLog := TStringList.Create();
  remessa := TRemessasVA.Create();
  remessaDAO := TRemessasVADAO.Create();
  bancaDAO := TBancaVADAO.Create();
  bancas := bancaDAO.FindByCodigo(StrToIntDef(mskCodigoBanca.Text,0));
  if bancas.Count > 0 then
  begin
    iDistribuidor := bancas[0].Distribuidor;
  end;
  tbEncalhe.First;
  while not tbEncalhe.Eof do
  begin
    if tbEncalheID_REMESSA.AsInteger > 0 then
    begin
      remessas := remessaDAO.FindByID(tbEncalheID_REMESSA.AsInteger);
      for remessaTMP in remessas do
      begin
        lLog.Text := tbEncalheDES_LOG.Text;
        if remessaTMP.DataChamada = 0 then remessaTMP.DataChamada := edtDataDevolucao.Date;
        remessaTMP.Encalhe := tbEncalheQTD_ENCALHE.AsFloat;
      end;
      lLog.Add('>' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now()) + ' alterado por ' + uGlobais.sUsuario);
      remessaTMP.Log := lLog.Text;
      if not remessaDAO.Update(remessaTMP) then
      begin
        Application.MessageBox(PChar('Erro ao gravar o encalhe ' + FormatDateTime('dd/mm/yyyy', remessa.DataChamada) +
                               '/' + remessa.Produto), 'Atenção!', MB_ICONEXCLAMATION + MB_OK);
      end;
    end
    else
    begin
      remessa.Id := tbEncalheID_REMESSA.AsInteger;
      remessa.Distribuidor := iDistribuidor;
      remessa.Banca := StrToIntDef(mskCodigoBanca.Text,0);
      remessa.Produto := tbEncalheCOD_PRODUTO.AsString;
      remessa.DataRemessa := tbEncalheDAT_REMESSA.AsDateTime;
      remessa.NumeroRemessa := '';
      remessa.Remessa := tbEncalheQTD_REMESSA.AsInteger;
      remessa.DataRecobertura := 0;
      remessa.Recobertura := 0;
      remessa.DataChamada := edtDataDevolucao.Date;
      remessa.NumeroDevolucao := '';
      remessa.Encalhe := tbEncalheQTD_ENCALHE.AsFloat;
      remessa.ValorCobranca := 0;
      remessa.ValorVenda := 0;
      remessa.Inventario := 0;
      remessa.Divergencia := 1;
      lLog.Text := tbEncalheDES_LOG.Text;
      lLog.Add('>' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now()) + ' inserido (Divergência) por ' + uGlobais.sUsuario);
      remessa.Log := lLog.Text;
      if not remessaDAO.Insert(remessa) then
      begin
        Application.MessageBox(PChar('Erro ao incluir a divegência do encalhe ' + FormatDateTime('dd/mm/yyyy', remessa.DataChamada) +
                               '/' + remessa.Produto), 'Atenção!', MB_ICONEXCLAMATION + MB_OK);
      end;
    end;
    tbEncalhe.Next;
  end;
  Application.MessageBox('Gravação concluida.', 'Pronto', MB_OK + MB_ICONINFORMATION);
  Cancelar;
end;

end.
