unit ufrmControleAbastecimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, clAbastecimentos, clEntregador,cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp,
  dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxPCdxBarPopupMenu, cxPC, dxLayoutLookAndFeels,
  cxContainer, cxEdit, cxTextEdit, cxLabel, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxCalc, cxCurrencyEdit, cxCheckBox, ActnList, Menus,
  StdCtrls, cxButtons, DB, dxmdaset, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  clAgentes, cxGridExportLink, ShellAPI, cxButtonEdit, clVeiculos,
  cxGridDBBandedTableView, cxGridBandedTableView, cxImage, ExtCtrls, Vcl.ComCtrls, dxCore, cxDateUtils, cxNavigator,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxBarBuiltInMenu, System.Actions, clAcessos;

type
  TfrmControleAbastecimento = class(TForm)
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    aclCadastro: TActionList;
    actCadastroExcluir: TAction;
    actCadastroCancelar: TAction;
    actCadastroSalvar: TAction;
    actCadastroSair: TAction;
    actCadastroLocalizar: TAction;
    tbTotal: TdxMemData;
    tbTotalCOD_AGENTE: TIntegerField;
    tbTotalDES_AGENTE: TStringField;
    tbTotalCOD_ENTREGADOR: TIntegerField;
    tbTotalDES_ENTREGADOR: TStringField;
    tbTotalVAL_TOTAL_GERAL: TCurrencyField;
    cxGrid1: TcxGrid;
    cxGrid1Level1: TcxGridLevel;
    ds: TDataSource;
    cxLabel9: TcxLabel;
    cxDatInicial: TcxDateEdit;
    cxLabel10: TcxLabel;
    cxDatFinal: TcxDateEdit;
    actCadastroCalcular: TAction;
    cxButton6: TcxButton;
    SaveDialog: TSaveDialog;
    actCadastroExportar: TAction;
    cxButton7: TcxButton;
    tbTotalDES_PRODUTO: TStringField;
    tbTotalNUM_CUPOM: TStringField;
    tbTotalDES_PLACA: TStringField;
    tbTotalDAT_ABASTECIMENTO: TDateField;
    tbTotalVAL_UNITARIO: TCurrencyField;
    tbTotalQTD_ABASTECIMENTO: TFloatField;
    actCadastroListaApoio: TAction;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView1DES_ENTREGADOR: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DAT_ABASTECIMENTO: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DES_PLACA: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1NUM_CUPOM: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DES_PRODUTO: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1QTD_ABASTECIMENTO: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1VAL_UNITARIO: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1VAL_TOTAL: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DES_AGENTE: TcxGridDBBandedColumn;
    tbTotalVAL_VERBA_COMBUSTIVEL: TFloatField;
    tbTotalVAL_DESCONTO: TFloatField;
    cxGrid1DBBandedTableView1VAL_VERBA_COMBUSTIVEL: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1VAL_DESCONTO: TcxGridDBBandedColumn;
    cxButton5: TcxButton;
    cxLabel1: TcxLabel;
    cxNumeroControle: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxCupom: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxData: TcxDateEdit;
    cxLabel5: TcxLabel;
    cxProduto: TcxTextEdit;
    cxLabel6: TcxLabel;
    cxQuantidade: TcxCalcEdit;
    cxLabel7: TcxLabel;
    cxUnitario: TcxCurrencyEdit;
    cxLabel8: TcxLabel;
    cxTotal: TcxCalcEdit;
    cxDescontado: TcxCheckBox;
    cxNomeEntregador: TcxTextEdit;
    cxLabel11: TcxLabel;
    cxEntregador: TcxButtonEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxVerVerbas: TcxCheckBox;
    cxFuncionartios: TcxCheckBox;
    cxPlaca: TcxButtonEdit;
    cxLabel27: TcxLabel;
    procedure actCadastroLocalizarExecute(Sender: TObject);
    procedure actCadastroExcluirExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actCadastroCancelarExecute(Sender: TObject);
    procedure actCadastroSalvarExecute(Sender: TObject);
    procedure actCadastroSairExecute(Sender: TObject);
    procedure actCadastroCalcularExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure actCadastroExportarExecute(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure cxEntregadorKeyPress(Sender: TObject; var Key: Char);
    procedure actCadastroListaApoioExecute(Sender: TObject);
    procedure cxEntregadorPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cxCupomKeyPress(Sender: TObject; var Key: Char);
    procedure cxVerVerbasPropertiesChange(Sender: TObject);
    procedure cxPlacaPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Modo;
    procedure SetupForm;
    procedure SetupClass;
    procedure Exportar(sArquivo: String);
    procedure ListaEntregador;
    procedure ListaVeiculo;
  end;

var
  frmControleAbastecimento: TfrmControleAbastecimento;
  sOperacao     : String;
  abastecimento : TAbastecimentos;
  agente        : TAgente;
  entregador    : TEntregador;
  veiculo       : TVeiculos;
  acessos       : TAcessos;
implementation

{$R *.dfm}

uses udm, clUtil, ufrmPrincipal,ufrmLocalizar, ZDataset, ufrmListaApoio, uGlobais;

procedure TfrmControleAbastecimento.actCadastroLocalizarExecute(
  Sender: TObject);
begin
  with dm.qryPesquisa do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT TBABASTECIMENTO.NUM_ABASTECIMENTO "Número", ' +
            'TBABASTECIMENTO.DAT_ABASTECIMENTO "Data", ' +
            'TBABASTECIMENTO.NUM_CUPOM "Cupom", ' +
            'TBABASTECIMENTO.DES_PLACA "Placa", ' +
            'TBABASTECIMENTO.VAL_TOTAL "Valor" ' +
            'FROM TBABASTECIMENTO ');
    SQL.Add('');
  end;
  if not Assigned(frmLocalizar) then begin
    frmLocalizar :=  TfrmLocalizar.Create(Application);
  end;
  frmLocalizar.cboCamposDisplay.Clear;
  frmLocalizar.cboCamposSQL.Clear;
  frmLocalizar.cboCamposDisplay.Items.Add('Número');
  frmLocalizar.cboCamposSQL.Items.Add('NUM_ABASTECIMENTO');
  frmLocalizar.cboCamposDisplay.Items.Add('Data');
  frmLocalizar.cboCamposSQL.Items.Add('DAT_ABASTECIMENTO');
  frmLocalizar.cboCamposDisplay.Items.Add('Cupom');
  frmLocalizar.cboCamposSQL.Items.Add('NUM_CUPOM');
  frmLocalizar.cboCamposDisplay.Items.Add('Placa');
  frmLocalizar.cboCamposSQL.Items.Add('DES_PLACA');
  frmLocalizar.cboCamposDisplay.Items.Add('Valor');
  frmLocalizar.cboCamposSQL.Items.Add('VAL_TOTAL');

  frmLocalizar.cboCamposDisplay.ItemIndex :=  0;
  frmLocalizar.cboCamposSQL.ItemIndex     :=  0;
  frmLocalizar.cboOperadores.ItemIndex    :=  0;
  frmLocalizar.cboOperadoresSQL.ItemIndex :=  0;


  if frmLocalizar.ShowModal = mrOk then begin
    if abastecimento.getObject(dm.qryPesquisa.FieldS[0].AsString,'NUMERO') then begin
      TUtil.LimparFields(Self);
      SetupForm;
      cxCupom.SetFocus;
      sOperacao := 'U';
      Modo;
    end;
  end;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
end;

procedure TfrmControleAbastecimento.actCadastroExcluirExecute(
  Sender: TObject);
begin
  if sOperacao = 'I' then
    Exit;

  if Application.MessageBox('Confirma excluir este Abastecimento?' ,'Extrair Abastecimento',MB_ICONQUESTION + MB_YESNO) = idno then
    Exit;

  if abastecimento.Delete('CODIGO') then begin
    MessageDlg('Registro Excluído.',mtInformation,[mbOK],0);
    TUtil.LimparFields(Self);
    cxCupom.SetFocus;
    sOperacao := 'I';
    Modo;
  end;
end;

procedure TfrmControleAbastecimento.FormShow(Sender: TObject);
begin
  abastecimento :=  TAbastecimentos.Create();
  entregador    :=  TEntregador.Create();
  agente        :=  TAgente.Create();
  veiculo       :=  TVeiculos.Create();
  acessos       :=  TAcessos.Create;
  acessos.SetNivel(aclCadastro);
  sOperacao     :=  'I';
  Modo;
end;

procedure TfrmControleAbastecimento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  abastecimento.Free;
  entregador.Free;
  agente.Free;
  veiculo.Free;
  acessos.Free;
  if tbTotal.Active then
    tbTotal.Close;
  Action                    :=  caFree;
  frmControleAbastecimento  :=  Nil;
end;

procedure TfrmControleAbastecimento.Modo;
begin
  if sOperacao = 'I' then begin
    actCadastroExcluir.Enabled := False;
    actCadastroCancelar.Enabled := True;
    actCadastroSalvar.Enabled := True;
    actCadastroLocalizar.Enabled := True;
    actCadastroSair.Enabled := True;
  end
  else if sOperacao = 'U' then begin
    actCadastroCancelar.Enabled := True;
    if abastecimento.Descontado = 'S' then begin
      actCadastroExcluir.Enabled := False;
      actCadastroSalvar.Enabled := False;
    end
    else begin
      actCadastroExcluir.Enabled := True;
      actCadastroSalvar.Enabled := True;
    end;
    actCadastroLocalizar.Enabled := True;
    actCadastroSair.Enabled := True;
  end;
end;

procedure TfrmControleAbastecimento.actCadastroCancelarExecute(
  Sender: TObject);
begin
  TUtil.LimparFields(Self);
  sOperacao :=  'I';
  Modo;
  cxCupom.SetFocus;
end;

procedure TfrmControleAbastecimento.SetupForm;
begin
  cxNumeroControle.Text :=  IntToStr(abastecimento.Numero);
  cxCupom.Text          :=  abastecimento.Cupom;
  cxProduto.Text        :=  abastecimento.Produto;
  cxPlaca.Text          :=  abastecimento.Placa;
  cxEntregador.Text     :=  IntToStr(abastecimento.Entregador);
  if entregador.getObject(InttoStr(abastecimento.Entregador),'CADASTRO') then begin
    cxNomeEntregador.Text :=  entregador.Nome;
  end
  else begin
    cxNomeEntregador.Text :=  '---';
  end;
  cxData.Date           :=  abastecimento.Data;
  cxProduto.Text        :=  abastecimento.Produto;
  cxQuantidade.Value    :=  abastecimento.Quantidade;
  cxUnitario.Value      :=  abastecimento.Unitario;
  cxTotal.Value         :=  abastecimento.Total;
  if abastecimento.Descontado  = 'S' then
    cxDescontado.Checked  :=  True
  else
    cxDescontado.Checked  :=  False;
end;

procedure TfrmControleAbastecimento.SetupClass;
begin
  abastecimento.Cupom       :=  cxCupom.Text;
  abastecimento.Placa       :=  cxPlaca.Text;
  if not (TUtil.Empty(cxData.Text)) then begin
    abastecimento.Data :=  cxData.Date;
  end;
  abastecimento.Produto     :=  cxProduto.Text;
  abastecimento.Quantidade  :=  cxQuantidade.Value;
  abastecimento.Unitario    :=  cxUnitario.Value;
  abastecimento.Total       :=  cxTotal.Value;
  if Not TUtil.Empty(cxEntregador.Text) then begin
    abastecimento.Entregador  :=  StrToInt(cxEntregador.Text);
  end
  else begin
    if veiculo.getObject(abastecimento.Placa,'PLACA') then begin
      abastecimento.Entregador  :=  veiculo.Entregador;
    end
    else begin
      abastecimento.Entregador  := 0;
    end;
  end;
  if cxDescontado.Checked then begin
    abastecimento.Descontado    := 'S';
  end
  else begin
    abastecimento.Descontado    := 'N';
  end;
  abastecimento.Executante    :=  uGlobais.sUsuario;
  abastecimento.Manutencao    :=  Now;
end;


procedure TfrmControleAbastecimento.actCadastroSalvarExecute(
  Sender: TObject);
begin
  SetupClass;
  if not (abastecimento.Validar()) then
    Exit;
  if Application.MessageBox('Confirma salvar este Abastecimento?','Salvar',MB_ICONQUESTION + MB_YESNO) = IDNO then
    Exit;
  if sOperacao = 'I' then begin
    if not (abastecimento.Insert()) then begin
      MessageDlg('Não foi possível incluir este Abastecimento!',mtWarning,[mbOK],0);
      Exit;
    end;
  end
  else begin
    if not (abastecimento.Update()) then
      MessageDlg('Não foi possível alterar este Abastecimento!',mtWarning,[mbOK],0);
      Exit;
  end;
  Application.MessageBox('Dados salvos com sucesso!','Salvar',MB_OK + MB_ICONINFORMATION);
  sOperacao :=  'I';
  TUtil.LimparFields(Self);
  Modo;
  cxCupom.SetFocus;
end;

procedure TfrmControleAbastecimento.actCadastroSairExecute(
  Sender: TObject);
begin
  Close;
end;

procedure TfrmControleAbastecimento.actCadastroCalcularExecute(
  Sender: TObject);
var
  bFlag   : Boolean;
  dVerba  : Double;
begin
  if not (abastecimento.Periodo(cxDatInicial.Text,cxDatFinal.Text)) then
    Exit;
  Screen.Cursor   :=  crHourGlass;
  cxGrid1DBBandedTableView1.OptionsView.NoDataToDisplayInfoText := '<Carregando o Grid. Aguarde ...>';
  cxGrid1.Refresh;
  if tbTotal.Active then
    tbTotal.Close;
  tbTotal.Open;
  dVerba  :=  0;
  while not (dm.qryGeral.Eof) do begin
    bFlag :=  False;
    if cxFuncionartios.Checked then begin
      entregador.Cadastro :=  dm.qryGeral.FieldByName('COD_ENTREGADOR').AsInteger;
      if entregador.getField('DOM_FUNCIONARIO','CADASTRO') = 'S' then begin
        bFlag :=  True;
      end
      else begin
        bFlag :=  False;
      end
    end
    else begin
      bFlag :=  True;
    end;
    if bFlag then begin
      if entregador.getObject(dm.qryGeral.FieldByName('COD_ENTREGADOR').AsString,'CADASTRO') then begin
        dVerba  :=  entregador.Combustivel;
      end
      else begin
        dVerba  :=  0;
      end;
      tbTotal.Insert;
      tbTotalCOD_ENTREGADOR.Value     :=  dm.qryGeral.FieldByName('COD_ENTREGADOR').AsInteger;
      if entregador.getObject(tbTotalCOD_ENTREGADOR.AsString,'CADASTRO') then begin
        tbTotalCOD_AGENTE.Value             :=  entregador.Agente;
        tbTotalDES_ENTREGADOR.Value         :=  entregador.Nome;
        if agente.getObject(tbTotalCOD_AGENTE.AsString,'CODIGO') then begin
          tbTotalDES_AGENTE.Value     :=  agente.Fantasia;
        end
        else begin
          tbTotalDES_AGENTE.Value     :=  '---';
        end;
      end
      else begin
        tbTotalCOD_AGENTE.Value       :=  0;
        tbTotalDES_ENTREGADOR.Value   :=  '---';
        tbTotalDES_AGENTE.Value       :=  '---';
      end;
      tbTotalDAT_ABASTECIMENTO.Value      :=  dm.qryGeral.FieldByName('DAT_ABASTECIMENTO').AsDateTime;
      tbTotalDES_PLACA.Value              :=  dm.qryGeral.FieldByName('DES_PLACA').AsString;
      tbTotalNUM_CUPOM.Value              :=  dm.qryGeral.FieldByName('NUM_CUPOM').AsString;
      tbTotalDES_PRODUTO.Value            :=  dm.qryGeral.FieldByName('DES_PRODUTO').AsString;
      tbTotalQTD_ABASTECIMENTO.Value      :=  dm.qryGeral.FieldByName('QTD_ABASTECIMENTO').AsFloat;
      tbTotalVAL_UNITARIO.Value           :=  dm.qryGeral.FieldByName('VAL_UNITARIO').AsCurrency;
      tbTotalVAL_TOTAL_GERAL.Value        :=  dm.qryGeral.FieldByName('VAL_TOTAL').AsFloat;
      tbTotalVAL_VERBA_COMBUSTIVEL.Value  :=  dVerba;
      tbTotalVAL_DESCONTO.Value           :=  tbTotalVAL_TOTAL_GERAL.Value - dVerba;
      tbTotal.Post;
    end;
    dm.qryGeral.Next;
  end;
  dm.qryGeral.Close;
  dm.qryGeral.SQL.Clear;
  if not (tbTotal.IsEmpty) then begin
    cxGrid1DBBandedTableView1.Bands[0].Caption := 'Abastecimentos no Período de ' + cxDatInicial.Text  + ' a ' + cxDatFinal.Text;
    tbTotal.First;
  end
  else begin
    cxGrid1DBBandedTableView1.Bands[0].Caption := 'Período';
  end;
  Screen.Cursor                                           :=  crDefault;
  cxGrid1DBBandedTableView1.OptionsView.NoDataToDisplayInfoText := '<Nenhuma Informação Disponível>';
  cxGrid1.Refresh;

  cxGrid1DBBandedTableView1.ViewData.Expand(True);

end;

procedure TfrmControleAbastecimento.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key = #13 then begin
    if cxGrid1.IsFocused then Exit;
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TfrmControleAbastecimento.Exportar(sArquivo: String);
var
  sLinha          : String;
  fArquivo        : TextFile;
  iConta, iCampos : Integer;
begin
  try
    if TUtil.Empty(sArquivo) then Exit;
    if not (tbTotal.Active) then Exit;
    if tbTotal.IsEmpty then Exit;
    iConta  :=  0;
    iCampos :=  tbTotal.FieldCount - 1;

    AssignFile(fArquivo, sArquivo);
    Rewrite(fArquivo);
    sLinha  :=  'Abastecimentos de Veículos de Entregadores';
    sLinha  :=  sLinha + StringOfChar(';', (iCampos - 2));
    Writeln(fArquivo, sLinha);
    sLinha  :=  'Período de ' + cxDatInicial.Text + ' à ' + cxDatFinal.Text;
    sLinha  :=  sLinha + StringOfChar(';',(iCampos - 2));
    Writeln(fArquivo,sLinha);
    sLinha  :=  StringOfChar(';',(iCampos - 1));
    Writeln(fArquivo,sLinha);
    sLinha  :=  '';
    for iConta  :=  1 to iCampos do begin
      if not (TUtil.Empty(sLinha)) then begin
        sLinha  :=  sLinha + ';' + tbTotal.Fields[iConta].DisplayLabel;
      end
      else begin
        sLinha  :=  tbTotal.Fields[iConta].DisplayLabel;
      end;
    end;
    Writeln(fArquivo,sLinha);
    tbTotal.First;
    while not (tbTotal.Eof) do begin
      sLinha  :=  '';
      for iConta  :=  1 to iCampos do begin
        if not (TUtil.Empty(sLinha)) then begin
          if iConta = 5 then begin
            sLinha  :=  sLinha + ';' + FormatCurr(',0.00;-,0.00',tbTotal.Fields[iConta].AsCurrency);
          end
          else begin
            sLinha  :=  sLinha + ';' + Trim(VarToStr(tbTotal.Fields[iConta].Text));
          end;
        end
        else begin
          sLinha  :=  Trim(VarToStr(tbTotal.Fields[iConta].Value));
        end;
      end;
      Writeln(fArquivo,sLinha);
      tbTotal.Next;
    end;
    sLinha  :=  '';
    sLinha  :=  ';;;Total Geral;' + VarToStr(cxGrid1DBBandedTableView1.DataController.Summary.FooterSummaryValues[0]);
    Writeln(fArquivo,sLinha);
    CloseFile(fArquivo);
  Except
    on  E : Exception do
      ShowMessage('Classe: '+ e.ClassName + chr(13) + 'Mensagem: '+ e.Message);
  end;
end;


procedure TfrmControleAbastecimento.actCadastroExportarExecute(
  Sender: TObject);
var
  FileExt: String;
begin
  if not (tbTotal.Active) then begin
    Exit;
  end;
  if tbTotal.IsEmpty then begin
    Exit;
  end;
  SaveDialog.Filter := 'Excel (*.xls) |*.xls|XML (*.xml) |*.xml|Arquivo Texto (*.txt) |*.txt|Página Web (*.html)|*.html';
  SaveDialog.Title := 'Exportar Dados';
  SaveDialog.DefaultExt:= 'xls';
  if SaveDialog.Execute then
  begin
    FileExt := LowerCase(ExtractFileExt(SaveDialog.FileName));
    if FileExt = '.xls' then
          ExportGridToExcel(SaveDialog.FileName,cxGrid1, False)
    else if FileExt = '.xml' then
          ExportGridToXML(SaveDialog.FileName,cxGrid1, False)
    else if FileExt = '.txt' then
          ExportGridToText(SaveDialog.FileName,cxGrid1, False)
    else if FileExt = '.html' then
          ExportGridToHTML(SaveDialog.FileName,cxGrid1, False);
    ShellExecute(Handle, 'open', pchar(SaveDialog.FileName), nil, nil, SW_SHOW);
  end;
end;

procedure TfrmControleAbastecimento.dsStateChange(Sender: TObject);
begin
  actCadastroExportar.Enabled := (ds.State in [dsBrowse]);
end;

procedure TfrmControleAbastecimento.cxEntregadorKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := TUtil.SoNumero(Key);
end;

procedure TfrmControleAbastecimento.actCadastroListaApoioExecute(
  Sender: TObject);
begin
  if cxEntregador.IsFocused then begin
    ListaEntregador;
  end
  else if cxPlaca.IsFocused then begin
    ListaVeiculo;
  end;
end;

procedure TfrmControleAbastecimento.cxEntregadorPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  if TUtil.Empty(cxEntregador.Text) then
    Exit;
  if entregador.getObject(Trim(cxEntregador.Text),'CADASTRO') then begin
    cxNomeEntregador.Text :=  entregador.Nome;
  end;
end;

procedure TfrmControleAbastecimento.cxPlacaPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  if Pos(sOperacao,'IU') = 0 then begin
    Exit;
  end;
  if veiculo.getObject(cxPlaca.Text,'PLACA') then begin
    if entregador.getObject(IntToStr(veiculo.Entregador),'CADASTRO') then begin
      cxEntregador.Text :=  IntToStr(entregador.Cadastro);
      cxNomeEntregador.Text   :=  entregador.Nome;
    end
    else begin
      cxEntregador.Text :=  '0';
      cxNomeEntregador.Text   :=  '- - -';
    end;
  end
  else begin
    Application.MessageBox('Placa não cadastrada! Verifique.','Atenção',MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
end;

procedure TfrmControleAbastecimento.cxCupomKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key :=  TUtil.SoNumero(Key);
end;

procedure TfrmControleAbastecimento.cxVerVerbasPropertiesChange(
  Sender: TObject);
begin
  cxFuncionartios.Checked := cxVerVerbas.Checked;
  if cxVerVerbas.Checked then begin
    cxGrid1DBBandedTableView1VAL_VERBA_COMBUSTIVEL.Visible  :=  True;
    cxGrid1DBBandedTableView1VAL_DESCONTO.Visible           :=  True;
  end
  else begin
    cxGrid1DBBandedTableView1VAL_VERBA_COMBUSTIVEL.Visible  :=  False;
    cxGrid1DBBandedTableView1VAL_DESCONTO.Visible           :=  False;
  end;
end;


procedure TfrmControleAbastecimento.ListaEntregador;
var
  sId, sResultado : String;
begin
  if Pos(sOperacao,'IU') = 0 then begin
    Exit;
  end;
  sId         :=  '';
  Screen.Cursor :=  crHourGlass;
  sId           :=  Trim(cxEntregador.Text);
  with dm.qryPesquisa do begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT COD_CADASTRO AS "Código", NOM_FANTASIA AS "Nome" ' +
                'FROM TBENTREGADORES ';
    dm.ZConn.PingServer;
    Open;
  end;
  if dm.qryPesquisa.IsEmpty then begin
    dm.qryPesquisa.Close;
    dm.qryPesquisa.SQL.Clear;
    Exit;
  end
  else begin
    dm.qryPesquisa.First;
  end;
  if not Assigned(frmListaApoio) then begin
    frmListaApoio :=  TfrmListaApoio.Create(Application);
  end;
  frmListaApoio.Caption                                 :=  'Entregadores';
  Screen.Cursor                                         :=  crDefault;
  if frmListaApoio.ShowModal = mrOk then begin
    cxEntregador.Text :=  dm.qryPesquisa.Fields[0].AsString;
    cxEntregador.Refresh;
    cxNomeEntregador.Text   :=  dm.qryPesquisa.Fields[1].AsString;
    cxNomeentregador.Refresh;
  end;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  FreeAndNil(frmListaApoio);
end;

procedure TfrmControleAbastecimento.ListaVeiculo;
var
  sId : String;
begin
  if Pos(sOperacao,'IU') = 0 then begin
    Exit;
  end;
  sId         :=  '';
  Screen.Cursor :=  crHourGlass;
  sId           :=  Trim(cxPlaca.Text);
  with dm.qryPesquisa do begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT TBVEICULOS.COD_VEICULO AS "Código", TBVEICULOS.DES_MARCA AS "Marca", TBVEICULOS.DES_MODELO AS "Modelo", ' +
                'TBVEICULOS.DES_PLACA AS "Placa", TBENTREGADORES.NOM_FANTASIA AS "Entregador/Motorista" ' +
                'FROM TBVEICULOS JOIN TBENTREGADORES ON TBVEICULOS.COD_ENTREGADOR = TBENTREGADORES.COD_CADASTRO';
    dm.ZConn.PingServer;
    Open;
  end;
  if dm.qryPesquisa.IsEmpty then begin
    dm.qryPesquisa.Close;
    dm.qryPesquisa.SQL.Clear;
    Exit;
  end
  else begin
    dm.qryPesquisa.First;
  end;
  if not Assigned(frmListaApoio) then begin
    frmListaApoio :=  TfrmListaApoio.Create(Application);
  end;
  frmListaApoio.Caption                                 :=  'Veículos';
  Screen.Cursor                                         :=  crDefault;
  if frmListaApoio.ShowModal = mrOk then begin
    cxPlaca.Text              :=  dm.qryPesquisa.Fields[3].AsString;
    if TUtil.Empty(cxEntregador.Text) then begin
      cxEntregador.Text       :=  '0';
      cxNomeEntregador.Clear
    end;
    if StrToInt(cxEntregador.Text) = 0 then begin
      if entregador.getObject(dm.qryPesquisa.Fields[4].AsString,'NOME') then begin
        cxEntregador.Text     := IntToStr(entregador.Cadastro);
        cxNomeEntregador.Text :=  entregador.Nome;
      end
      else begin
        cxEntregador.Text     :=  '0';
        cxNomeEntregador.Clear;
      end;
    end;
  end;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  FreeAndNil(frmListaApoio);
end;


end.
