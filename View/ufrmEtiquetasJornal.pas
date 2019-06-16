unit ufrmEtiquetasJornal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, clAssinantes, clProdutos,
  clTipoAssinatura, frxClass, frxDBSet, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxLabel, cxGroupBox, cxCheckListBox,
  System.Actions, Vcl.ActnList, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  uthrPopularEtiquetas, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar, cxCheckBox, cxSpinEdit, Data.DB, dxmdaset, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmEtiquetasJornal = class(TForm)
    cxLabel27: TcxLabel;
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    aclImpressaoEtiquetas: TActionList;
    actImpressãoEtiquetaImprimir: TAction;
    actImpressaoEtiquetaSair: TAction;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxProdutos: TcxComboBox;
    cxLabel3: TcxLabel;
    cxEdicao: TcxCheckListBox;
    cxLabel2: TcxLabel;
    cxTipo: TcxCheckListBox;
    cxLabel4: TcxLabel;
    cxRoteiro: TcxCheckListBox;
    cxGroupBox2: TcxGroupBox;
    cxLabel5: TcxLabel;
    cxOrdenacao: TcxComboBox;
    cxDecrescente: TcxCheckBox;
    cxLabel6: TcxLabel;
    cxEtiqueta: TcxSpinEdit;
    cxLabel7: TcxLabel;
    cxTipoImpressao: TcxComboBox;
    cxLabel8: TcxLabel;
    cxCodigoAssinatura: TcxTextEdit;
    tbEtiquetas: TdxMemData;
    tbEtiquetasID_ASSINANTE: TIntegerField;
    tbEtiquetasCOD_ASSINANTE: TStringField;
    tbEtiquetasCOD_PRODUTO: TStringField;
    tbEtiquetasNUM_EDICAO: TStringField;
    tbEtiquetasCOD_TIPO_ASSINATURA: TStringField;
    tbEtiquetasDAT_EDICAO: TDateField;
    tbEtiquetasNOM_ASSINANTE: TStringField;
    tbEtiquetasNOM_CUIDADOS: TStringField;
    tbEtiquetasDES_ENDERECO: TStringField;
    tbEtiquetasDES_COMPLEMENTO: TStringField;
    tbEtiquetasDES_BAIRRO: TStringField;
    tbEtiquetasDES_REFERENCIA: TStringField;
    tbEtiquetasDES_CIDADE: TStringField;
    tbEtiquetasDES_UF: TStringField;
    tbEtiquetasCEP_ENDERECO: TStringField;
    tbEtiquetasQTD_EXEMPLARES: TIntegerField;
    tbEtiquetasCOD_BARRA: TStringField;
    tbEtiquetasNUM_ROTEIRO: TIntegerField;
    tbEtiquetasNUM_ORDEM: TIntegerField;
    tbEtiquetasID_REVISTA: TStringField;
    tbEtiquetasDES_ORDENACAO: TStringField;
    tbEtiquetasDOM_PROTOCOLO: TStringField;
    frxReport: TfrxReport;
    frxDBDataset: TfrxDBDataset;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actImpressaoEtiquetaSairExecute(Sender: TObject);
    procedure actImpressãoEtiquetaImprimirExecute(Sender: TObject);
    procedure cxProdutosPropertiesCloseUp(Sender: TObject);
  private
    { Private declarations }
    procedure PopulaProdutos;
    procedure PopulaTipo;
    procedure PopulaEdicoes;
    procedure PopulaRoteiro;
    procedure FiltraDados;
    procedure PopularEtiquetas;
    procedure Imprimir;
  public
    { Public declarations }
  end;

var
  frmEtiquetasJornal: TfrmEtiquetasJornal;
  produtos: TProdutos;
  tipo: TTipoAssinatura;
  assinatura: TAssinantes;
  sFiltro: String;
  sTitulo: String;
  thrEtiqueta: thrPopularEtiquetas;

implementation

{$R *.dfm}

uses udm, clUtil, uGlobais, ufrmProcesso, ufrmImpressao;

procedure TfrmEtiquetasJornal.actImpressaoEtiquetaSairExecute(Sender: TObject);
begin
  try
    Perform(WM_CLOSE, 0, 0);
  except
    on E: Exception do
      MessageDlg(E.Message, mtError, mbOKCancel, 0);
  end;
end;

procedure TfrmEtiquetasJornal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  produtos.Free;
  tipo.Free;
  assinatura.Free;
  Action := caFree;
  frmEtiquetasJornal := Nil;
end;

procedure TfrmEtiquetasJornal.FormShow(Sender: TObject);
begin
  produtos := TProdutos.Create;
  tipo := TTipoAssinatura.Create;
  assinatura := TAssinantes.Create;
  PopulaProdutos;
end;

procedure TfrmEtiquetasJornal.PopulaProdutos;
var
  sItem: String;
begin
  cxProdutos.Properties.Items.Clear;
  if produtos.getObjects() then
  begin
    while (not dm.qryGetObject1.Eof) do
    begin
      sItem := dm.qryGetObject1.FieldByName('COD_PRODUTO').AsString + ' - ' +
        dm.qryGetObject1.FieldByName('DES_PRODUTO').AsString;
      cxProdutos.Properties.Items.Add(sItem);
      dm.qryGetObject1.Next;
    end;
  end;
  dm.qryGetObject1.Close;
  dm.qryGetObject1.SQL.Clear;
  cxProdutos.ItemIndex := -1;
end;

procedure TfrmEtiquetasJornal.PopulaTipo;
var
  sItem, sSQL, sCodProduto, sTipos: String;
  i: Integer;
begin
  sSQL := '';
  sCodProduto := '';
  sTipos := '';
  cxTipo.Items.Clear;
  if cxProdutos.ItemIndex = -1 then
  begin
    Exit;
  end;
  sCodProduto := Copy(cxProdutos.Text, 1, Pos(' - ', cxProdutos.Text) - 1);
  sSQL := 'COD_TIPO_ASSINATURA FROM jor_assinantes WHERE COD_PRODUTO = ' +
    QuotedStr(sCodProduto) + ' ORDER BY COD_TIPO_ASSINATURA';
  if assinatura.getObject(sSQL, 'FILTRO3') then
  begin
    cxTipo.Items.Clear;
    while (not dm.qryGetObject1.Eof) do
    begin
      tipo.Codigo := dm.qryGetObject1.FieldByName
        ('COD_TIPO_ASSINATURA').AsString;
      sItem := dm.qryGetObject1.FieldByName('COD_TIPO_ASSINATURA').AsString +
        ' - ' + tipo.getField('DES_TIPO_ASSINATURA', 'CODIGO');
      cxTipo.AddItem(sItem);
      dm.qryGetObject1.Next;
    end;
  end;
  dm.qryGetObject1.Close;
  dm.qryGetObject1.SQL.Clear;
  cxTipo.ItemIndex := 0;
end;

procedure TfrmEtiquetasJornal.PopulaRoteiro;
var
  sItem, sSQL, sCodProduto, sRoteiro: String;
  i: Integer;
begin
  sSQL := '';
  sCodProduto := '';
  sRoteiro := '';
  cxRoteiro.Items.Clear;
  if cxProdutos.ItemIndex = -1 then
  begin
    Exit;
  end;
  sCodProduto := Copy(cxProdutos.Text, 1, Pos(' - ', cxProdutos.Text) - 1);
  sSQL := 'NUM_ROTEIRO FROM jor_assinantes WHERE COD_PRODUTO = ' +
    QuotedStr(sCodProduto) + ' ORDER BY NUM_ROTEIRO';
  if assinatura.getObject(sSQL, 'FILTRO3') then
  begin
    cxRoteiro.Items.Clear;
    while (not dm.qryGetObject1.Eof) do
    begin
      sItem := dm.qryGetObject1.FieldByName('NUM_ROTEIRO').AsString;
      cxRoteiro.AddItem(sItem);
      dm.qryGetObject1.Next;
    end;
  end;
  dm.qryGetObject1.Close;
  dm.qryGetObject1.SQL.Clear;
  cxRoteiro.ItemIndex := 0;
end;

procedure TfrmEtiquetasJornal.actImpressãoEtiquetaImprimirExecute(Sender: TObject);
var
  bProtocolo: Boolean;
begin
  if Application.MessageBox('Confirma a emissão?', 'Impressão', MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  bProtocolo := False;
  FiltraDados;
  if cxTipoImpressao.ItemIndex <> 1 then
  begin
    bProtocolo := assinatura.ExistProtocol(sFiltro, 'FILTRO');
    if bProtocolo then
    begin
      Application.MessageBox('Existem protocolos que devem ser impressos antes da emissão das etiquetas!', PChar('Atenção ' +
                             uGlobais.sUsuario), MB_OK + MB_ICONINFORMATION);
      cxTipoImpressao.ItemIndex := 1;
      Imprimir;
      cxTipoImpressao.ItemIndex := 0;
      Imprimir;
    end
    else
    begin
      Imprimir;
    end;
  end
  else
  begin
    Imprimir;
  end;
end;

procedure TfrmEtiquetasJornal.cxProdutosPropertiesCloseUp(Sender: TObject);
begin
  if TUtil.Empty(cxProdutos.Text) then
  begin
    Exit;
  end;
  PopulaEdicoes;
  PopulaTipo;
  PopulaRoteiro;
end;

procedure TfrmEtiquetasJornal.FiltraDados;
var
  sCodigo: String;
  i: Integer;
begin
  sFiltro := '';
  if cxProdutos.ItemIndex = -1 then
  begin
    Application.MessageBox('Informe o produto!', 'Atenção',
      MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  sFiltro := sFiltro + 'COD_PRODUTO = ' + QuotedStr(Copy(cxProdutos.Text, 1, Pos(' - ', cxProdutos.Text) - 1));
  // filtro por edição
  sCodigo := '';
  for i := 0 to cxEdicao.Items.Count - 1 do
  begin
    if cxEdicao.Items[i].Checked then
    begin
      if (not sCodigo.IsEmpty) then
      begin
        sCodigo := sCodigo + ',';
      end;
      sCodigo := sCodigo + QuotedStr(cxEdicao.Items[i].Text);
    end;
  end;
  if (not sCodigo.IsEmpty) then
  begin
    if (not sFiltro.IsEmpty) then
    begin
      sFiltro := sFiltro + ' AND ';
    end;
    sFiltro := sFiltro + ' NUM_EDICAO IN (' + sCodigo + ')';
  end;
  // tipo de assinaturas
  sCodigo := '';
  for i := 0 to cxTipo.Items.Count - 1 do
  begin
    if cxTipo.Items[i].Checked then
    begin
      if (not sCodigo.IsEmpty) then
      begin
        sCodigo := sCodigo + ',';
      end;
      sCodigo := sCodigo + QuotedStr(Copy(cxTipo.Items[i].Text, 1, Pos(' - ', cxTipo.Items[i].Text) - 1));
    end;
  end;
  if (not sCodigo.IsEmpty) then
  begin
    if (not sFiltro.IsEmpty) then
    begin
      sFiltro := sFiltro + ' AND ';
    end;
    sFiltro := sFiltro + ' COD_TIPO_ASSINATURA IN (' + sCodigo + ')';
  end;
  // roteiros
  sCodigo := '';
  for i := 0 to cxRoteiro.Items.Count - 1 do
  begin
    if cxRoteiro.Items[i].Checked then
    begin
      if (not sCodigo.IsEmpty) then
      begin
        sCodigo := sCodigo + ',';
      end;
      sCodigo := sCodigo + cxRoteiro.Items[i].Text;
    end;
  end;
  if (not sCodigo.IsEmpty) then
  begin
    if (not sFiltro.IsEmpty) then
    begin
      sFiltro := sFiltro + ' AND ';
    end;
    sFiltro := sFiltro + ' NUM_ROTEIRO IN (' + sCodigo + ')';
  end;
  //seleção de assinatura
  if (not TUtil.Empty(cxCodigoAssinatura.Text)) then
  begin
    if (not sFiltro.IsEmpty) then
    begin
      sFiltro := sFiltro + ' AND ';
    end;
    sFiltro := sFiltro + ' COD_ASSINANTE = ' + QuotedStr(cxCodigoAssinatura.Text);
  end;
  //ordenação
  if cxOrdenacao.ItemIndex = 0 then
  begin
    sFiltro := sFiltro + ' ORDER BY NUM_ROTEIRO, COD_TIPO_ASSINATURA';
    if cxDecrescente.Checked then
    begin
      sFiltro := sFiltro + ' ASC';
    end
    else
    begin
      sFiltro := sFiltro + ' DESC';
    end;
  end
  else if cxOrdenacao.ItemIndex = 1 then
  begin
    sFiltro := sFiltro + ' ORDER BY NUM_ROTEIRO, COD_TIPO_ASSINATURA, CEP_ENDERECO';
    if cxDecrescente.Checked then
    begin
      sFiltro := sFiltro + ' ASC';
    end
    else
    begin
      sFiltro := sFiltro + ' DESC';
    end;
  end
  else if cxOrdenacao.ItemIndex = 2 then
  begin
    sFiltro := sFiltro + ' ORDER BY NUM_ROTEIRO, COD_TIPO_ASSINATURA, COD_ASSINANTE';
    if cxDecrescente.Checked then
    begin
      sFiltro := sFiltro + ' ASC';
    end
    else
    begin
      sFiltro := sFiltro + ' DESC';
    end;
  end
  else if cxOrdenacao.ItemIndex = 3 then
  begin
    sFiltro := sFiltro + ' ORDER BY NUM_ROTEIRO, COD_TIPO_ASSINATURA, COD_BARRA';
    if cxDecrescente.Checked then
    begin
      sFiltro := sFiltro + ' ASC';
    end
    else
    begin
      sFiltro := sFiltro + ' DESC';
    end;
  end
  else if cxOrdenacao.ItemIndex = 4 then
  begin
    sFiltro := sFiltro + ' ORDER BY NUM_ROTEIRO, COD_TIPO_ASSINATURA, DES_BAIRRO';
    if cxDecrescente.Checked then
    begin
      sFiltro := sFiltro + ' ASC';
    end
    else
    begin
      sFiltro := sFiltro + ' DESC';
    end;
  end;
end;

procedure TfrmEtiquetasJornal.PopulaEdicoes;
var
  sItem, sSQL, sCodProduto: String;
  i: Integer;
begin
  sSQL := '';
  sCodProduto := '';
  if cxProdutos.ItemIndex = -1 then
  begin
    Exit;
  end;
  cxEdicao.Items.Clear;
  sCodProduto := Copy(cxProdutos.Text, 1, Pos(' - ', cxProdutos.Text) - 1);
  sSQL := 'NUM_EDICAO FROM jor_assinantes WHERE COD_PRODUTO = ' +
    QuotedStr(sCodProduto) + ' ORDER BY NUM_EDICAO DESC';
  if assinatura.getObject(sSQL, 'FILTRO3') then
  begin
    cxEdicao.Items.Clear;
    while (not dm.qryGetObject1.Eof) do
    begin
      sItem := dm.qryGetObject1.FieldByName('NUM_EDICAO').AsString;
      cxEdicao.AddItem(sItem);
      dm.qryGetObject1.Next;
    end;
  end;
  dm.qryGetObject1.Close;
  dm.qryGetObject1.SQL.Clear;
  cxEdicao.ItemIndex := 0;
end;

procedure TfrmEtiquetasJornal.PopularEtiquetas;
var
  iLinhas, iEtiquetas, iEtiqueta, iLinhasTotal, iContador, iRet, iPos: Integer;
  iTotalRoteiro, iTotalGeral, iRoteiro: Integer;
  sDescricao: String;
begin
  iLinhas := dm.qrygetObject1.RecordCount;
  iLinhasTotal := iLinhas;
  iEtiquetas := 1;
  iEtiqueta := cxEtiqueta.Value;;
  iTotalRoteiro := 0;
  iTotalGeral := uGlobais.iTotalEtiquetas;
  iRoteiro := dm.qrygetObject1.FieldByName('NUM_ROTEIRO').AsInteger;
// Carregando o arquivo ...
  dm.qrygetObject1.First;
  iContador := 0;
  sDescricao  :=  '';
  while (not dm.qrygetObject1.Eof) do
  begin
    iRet := dm.qrygetObject1.FieldByName('QTD_EXEMPLARES').AsInteger;
    iPos := 0;
    if iRoteiro = dm.qrygetObject1.FieldByName('NUM_ROTEIRO').AsInteger then
    begin
      for iPos := 1 to iRet do
      begin
        tbEtiquetas.Insert;
        tbEtiquetasID_ASSINANTE.Value := dm.qrygetObject1.FieldByName('ID_ASSINANTE').AsInteger;
        tbEtiquetasCOD_ASSINANTE.Value := dm.qrygetObject1.FieldByName('COD_ASSINANTE').AsString;
        produtos.Codigo :=  dm.qrygetObject1.FieldByName('COD_PRODUTO').AsString;
        sDescricao := '';
        sDescricao  := produtos.getField('DES_PRODUTO','CODIGO');
        if sDescricao.IsEmpty then
        begin
          sDescricao := dm.qrygetObject1.FieldByName('COD_PRODUTO').AsString;
        end;
        tbEtiquetasCOD_PRODUTO.Value := sDescricao;
        tbEtiquetasNUM_EDICAO.Value := dm.qrygetObject1.FieldByName('NUM_EDICAO').AsString;
        tipo.Codigo := dm.qrygetObject1.FieldByName('COD_TIPO_ASSINATURA').AsString;
        sDescricao := '';
        sDescricao  := tipo.getField('DES_TIPO_ASSINATURA','CODIGO');
        if sDescricao.IsEmpty then
        begin
          sDescricao := dm.qrygetObject1.FieldByName('COD_TIPO_ASSINATURA').AsString;
        end;
        tbEtiquetasCOD_TIPO_ASSINATURA.Value := sDescricao;
        tbEtiquetasDAT_EDICAO.Value := dm.qrygetObject1.FieldByName('DAT_EDICAO').AsDateTime;
        tbEtiquetasNOM_ASSINANTE.Value := dm.qrygetObject1.FieldByName('NOM_ASSINANTE').AsString;
        if TUtil.Empty(tbEtiquetasNOM_CUIDADOS.Value) then
        begin
          tbEtiquetasNOM_CUIDADOS.Value := 'A/C: ' + dm.qrygetObject1.FieldByName('NOM_CUIDADOS').AsString;
        end
        else
        begin
          tbEtiquetasNOM_CUIDADOS.Value := '';
        end;
        tbEtiquetasDES_ENDERECO.Value := Trim(dm.qrygetObject1.FieldByName('DES_ENDERECO').AsString);
        tbEtiquetasDES_COMPLEMENTO.Value := Trim(dm.qrygetObject1.FieldByName('DES_COMPLEMENTO').AsString);
        tbEtiquetasDES_BAIRRO.Value := dm.qrygetObject1.FieldByName('DES_BAIRRO').AsString;
        tbEtiquetasDES_REFERENCIA.Value := dm.qrygetObject1.FieldByName('DES_REFERENCIA').AsString;
        tbEtiquetasDES_CIDADE.Value := Trim(dm.qrygetObject1.FieldByName('DES_CIDADE').AsString);
        tbEtiquetasDES_UF.Value := dm.qrygetObject1.FieldByName('DES_UF').AsString;
        tbEtiquetasCEP_ENDERECO.Value := Copy(dm.qrygetObject1.FieldByName('CEP_ENDERECO').AsString, 1, 5) +
                                              '-' + Copy(dm.qrygetObject1.FieldByName('CEP_ENDERECO').AsString, 6, 3);
        tbEtiquetasQTD_EXEMPLARES.Value := dm.qrygetObject1.FieldByName('QTD_EXEMPLARES').AsInteger;
        tbEtiquetasCOD_BARRA.Value := dm.qrygetObject1.FieldByName('COD_BARRA').AsString;
        tbEtiquetasNUM_ROTEIRO.Value := dm.qrygetObject1.FieldByName('NUM_ROTEIRO').AsInteger;
        tbEtiquetasNUM_ORDEM.Value := iEtiquetas;
        tbEtiquetasID_REVISTA.Value := dm.qrygetObject1.FieldByName('ID_REVISTA').AsString;
        tbEtiquetasDES_ORDENACAO.Value := Format('%.6d', [dm.qrygetObject1.FieldByName('NUM_ROTEIRO').AsInteger]) +
                                             Format('%.4d', [iEtiquetas]);
        tbEtiquetasDOM_PROTOCOLO.Value := dm.qrygetObject1.FieldByName('DOM_PROTOCOLO').AsString;
        tbEtiquetas.Post;
        Inc(iEtiquetas);
        Inc(iTotalRoteiro);
      end;
    end
    else begin
      if iTotalRoteiro > 0 then
      begin
        tbEtiquetas.Insert;
        tbEtiquetasID_ASSINANTE.Value := 0;
        tbEtiquetasCOD_ASSINANTE.Value := '';
        sDescricao := '';
        sDescricao  := produtos.getField('DES_PRODUTO','CODIGO');
        if sDescricao.IsEmpty then
        begin
          sDescricao := dm.qrygetObject1.FieldByName('COD_PRODUTO').AsString;
        end;
        tbEtiquetasCOD_PRODUTO.Value := sDescricao;
        tbEtiquetasNUM_EDICAO.Value := '';
        sDescricao := '';
        sDescricao  := tipo.getField('DES_TIPO_ASSINATURA','CODIGO');
        if sDescricao.IsEmpty then
        begin
          sDescricao := dm.qrygetObject1.FieldByName('COD_TIPO_ASSINATURA').AsString;
        end;
        tbEtiquetasCOD_TIPO_ASSINATURA.Value := sDescricao;
        tbEtiquetasDAT_EDICAO.Value := dm.qrygetObject1.FieldByName('DAT_EDICAO').AsDateTime;
        tbEtiquetasNOM_ASSINANTE.Value := '';
        tbEtiquetasNOM_CUIDADOS.Value := '';
        tbEtiquetasDES_ENDERECO.Value := 'TOTAL DO ROTEIRO ' + IntToStr(iRoteiro) +
        ': ' + IntToStr(iTotalRoteiro);
        tbEtiquetasDES_COMPLEMENTO.Value := '';
        tbEtiquetasDES_BAIRRO.Value := '';
        tbEtiquetasDES_REFERENCIA.Value := '';
        tbEtiquetasDES_CIDADE.Value := '';
        tbEtiquetasDES_UF.Value := '';
        tbEtiquetasCEP_ENDERECO.Value := '';
        tbEtiquetasQTD_EXEMPLARES.Value := 0;
        tbEtiquetasCOD_BARRA.Value := '';
        tbEtiquetasNUM_ROTEIRO.Value := iRoteiro;
        tbEtiquetasNUM_ORDEM.Value := iEtiquetas;
        tbEtiquetasID_REVISTA.Value := '';
        tbEtiquetasDES_ORDENACAO.Value := Format('%.6d', [iRoteiro]) +
                                          Format('%.4d', [iEtiquetas]);
        tbEtiquetas.Post;
        iTotalRoteiro := 0;
        Inc(iEtiquetas);
        iRoteiro := dm.qrygetObject1.FieldByName('NUM_ROTEIRO').AsInteger;
        if (not dm.qryGetObject1.Bof) then
        begin
          dm.qryGetObject1.Prior
        end;
      end;
    end;
    dm.qrygetObject1.Next;
    dPosicao := (iContador / iLinhasTotal) * 100;
    frmProcesso.cxProgressBar1.Position := dPosicao;
    frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
    frmProcesso.cxProgressBar1.Refresh;
    Inc(iContador, 1);
  end;
  if iTotalRoteiro > 0 then
  begin
    tbEtiquetas.Insert;
    tbEtiquetasID_ASSINANTE.Value := 0;
    tbEtiquetasCOD_ASSINANTE.Value := '';
    sDescricao := '';
    sDescricao  := produtos.getField('DES_PRODUTO','CODIGO');
    if sDescricao.IsEmpty then
    begin
      sDescricao := dm.qrygetObject1.FieldByName('COD_PRODUTO').AsString;
    end;
    tbEtiquetasCOD_PRODUTO.Value := sDescricao;
    tbEtiquetasNUM_EDICAO.Value := '';
    sDescricao := '';
    sDescricao  := tipo.getField('DES_TIPO_ASSINATURA','CODIGO');
    if sDescricao.IsEmpty then
    begin
      sDescricao := dm.qrygetObject1.FieldByName('COD_TIPO_ASSINATURA').AsString;
    end;
    tbEtiquetasCOD_TIPO_ASSINATURA.Value := sDescricao;
    tbEtiquetasDAT_EDICAO.Value := dm.qrygetObject1.FieldByName('DAT_EDICAO').AsDateTime;
    tbEtiquetasNOM_ASSINANTE.Value := '';
    tbEtiquetasNOM_CUIDADOS.Value := '';
    tbEtiquetasDES_ENDERECO.Value := 'TOTAL DO ROTEIRO ' + IntToStr(iRoteiro) +
    ': ' + IntToStr(iTotalRoteiro);
    tbEtiquetasDES_COMPLEMENTO.Value := '';
    tbEtiquetasDES_BAIRRO.Value := '';
    tbEtiquetasDES_REFERENCIA.Value := '';
    tbEtiquetasDES_CIDADE.Value := '';
    tbEtiquetasDES_UF.Value := '';
    tbEtiquetasCEP_ENDERECO.Value := '';
    tbEtiquetasQTD_EXEMPLARES.Value := 0;
    tbEtiquetasCOD_BARRA.Value := '';
    tbEtiquetasNUM_ROTEIRO.Value := iRoteiro;
    tbEtiquetasNUM_ORDEM.Value := iEtiquetas;
    tbEtiquetasID_REVISTA.Value := '';
    tbEtiquetasDES_ORDENACAO.Value := Format('%.6d', [iRoteiro]) +
                                         Format('%.4d', [iEtiquetas]);
    tbEtiquetas.Post;
    iTotalRoteiro := 0;
    Inc(iEtiquetas);
  end;
  iRoteiro  :=  999999;
  tbEtiquetas.Insert;
  tbEtiquetasID_ASSINANTE.Value := 0;
  tbEtiquetasCOD_ASSINANTE.Value := '';
  sDescricao := '';
  sDescricao  := produtos.getField('DES_PRODUTO','CODIGO');
  if sDescricao.IsEmpty then
  begin
    sDescricao := dm.qrygetObject1.FieldByName('COD_PRODUTO').AsString;
  end;
  tbEtiquetasCOD_PRODUTO.Value := sDescricao;
  tbEtiquetasNUM_EDICAO.Value := '';
  sDescricao := '';
  sDescricao  := tipo.getField('DES_TIPO_ASSINATURA','CODIGO');
  if sDescricao.IsEmpty then
  begin
    sDescricao := dm.qrygetObject1.FieldByName('COD_TIPO_ASSINATURA').AsString;
  end;
  tbEtiquetasCOD_TIPO_ASSINATURA.Value := sDescricao;
  tbEtiquetasDAT_EDICAO.Value := dm.qrygetObject1.FieldByName('DAT_EDICAO').AsDateTime;
  tbEtiquetasNOM_ASSINANTE.Value := '';
  tbEtiquetasNOM_CUIDADOS.Value := '';
  tbEtiquetasDES_ENDERECO.Value := 'TOTAL GERAL : ' + IntToStr(iTotalGeral);
  tbEtiquetasDES_COMPLEMENTO.Value := '';
  tbEtiquetasDES_BAIRRO.Value := '';
  tbEtiquetasDES_REFERENCIA.Value := '';
  tbEtiquetasDES_CIDADE.Value := '';
  tbEtiquetasDES_UF.Value := '';
  tbEtiquetasCEP_ENDERECO.Value := '';
  tbEtiquetasQTD_EXEMPLARES.Value := 0;
  tbEtiquetasCOD_BARRA.Value := '';
  tbEtiquetasNUM_ROTEIRO.Value := iRoteiro;
  tbEtiquetasNUM_ORDEM.Value := iEtiquetas;
  tbEtiquetasID_REVISTA.Value := '';
  tbEtiquetasDES_ORDENACAO.Value := Format('%.6d', [iRoteiro]) +
                                    Format('%.4d', [iEtiquetas]);
  tbEtiquetas.Post;
  iTotalRoteiro := 0;
  dm.qrygetObject1.Close;
  dm.qrygetObject1.SQL.Clear;
  frmProcesso.Close;
  FreeAndNil(frmProcesso);
end;

procedure TfrmEtiquetasJornal.Imprimir;
begin
  if cxTipoImpressao.ItemIndex = 1 then
  begin
    sTitulo := 'PROTOCOLOS';
  end
  else
  begin
    sTitulo := 'ETIQUETAS';
  end;
  uGlobais.iTotalEtiquetas := assinatura.TotalEtiquetas(sFiltro, 'FILTRO');
  if not(assinatura.getObject(sFiltro, 'FILTRO')) then
  begin
    Application.MessageBox('Nenhuma assinatura encontrada conforme os parâmetros!', PChar(sTitulo), MB_OK + MB_ICONEXCLAMATION);
    sFiltro := '';
    Exit;
  end;
  tbEtiquetas.Close;
  tbEtiquetas.Open;
  if not Assigned(frmProcesso) then
  begin
    frmProcesso := TfrmProcesso.Create(Application);
  end;
  frmProcesso.Show;
  tbEtiquetas.Open;
  PopularEtiquetas;
  with frxReport do
  begin
    if not Assigned(frmImpressao) then
    begin
      frmImpressao := TfrmImpressao.Create(Application);
    end;
    if cxTipoImpressao.Text = 'ETIQUETAS' then
    begin
      frmImpressao.cxLabel1.Caption := 'ETIQUETAS JORNAL';
      frmImpressao.cxArquivo.Text := ExtractFilePath(Application.ExeName) + 'Reports\frxEtiquetasJornal.fr3';
    end
    else
    begin
      frmImpressao.cxLabel1.Caption := 'PROTOCOLOS JORNAL';
      frmImpressao.cxArquivo.Text := ExtractFilePath(Application.ExeName) + 'Reports\frxProtocoloJornal.fr3';
    end;
    if frmImpressao.ShowModal <> mrOk then
    begin
      FreeAndNil(frmImpressao);
      Exit;
    end
    else
    begin
      if (not FileExists(frmImpressao.cxArquivo.Text)) then
      begin
        Application.MessageBox(PChar('Arquivo ' + frmImpressao.cxArquivo.Text + ' não foi encontrado!'), 'Atenção',
                               MB_OK + MB_ICONWARNING);
        Exit;
      end;
    end;
    LoadFromFile(frmImpressao.cxArquivo.Text);
    if cxTipoImpressao.Text = 'PROTOCOLOS' then
    begin
      Variables.Items[Variables.IndexOf('Sistema')].Value := QuotedStr(TUtil.Sistema('Internalname') + ' Versão ' +
                      TUtil.VersaoExe);
    end;
    if cxTipoImpressao.Text = 'ETIQUETAS' then
    begin
      Variables.Items[Variables.IndexOf('pEtiqueta')].Value := QuotedStr(cxEtiqueta.Text);
    end;
    FreeAndNil(frmImpressao);
    if (not uGlobais.bFlagImprimir) then
    begin
      ShowReport(True);
    end
    else
    begin
      PrepareReport(True);
      Print;
    end;
  end;
end;
end.
