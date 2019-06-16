unit ufrmExtrato;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue,
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
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxGroupBox,
  cxRadioGroup, cxButtonEdit, Menus, ActnList, StdCtrls, cxButtons,
  DB, dxmdaset, cxClasses, cxCustomData, cxStyles, cxCustomPivotGrid,
  cxPivotGrid, cxDBPivotGrid, cxCurrencyEdit, dxSkinscxPCPainter, cxFilter,
  cxData, cxDataStorage, cxDBData, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, DateUtils,
  cxGridCustomPopupMenu, cxGridPopupMenu, cxCalc, cxGridExportLink, ShellAPI,
  cxProgressBar, cxCheckBox, cxGridBandedTableView, cxGridDBBandedTableView,
  cxTimeEdit,Vcl.ComCtrls, dxCore, cxDateUtils, cxNavigator, cxImage,
  Vcl.ExtCtrls, uthrCalculaExtrato;
type
  TfrmExtrato = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxDatInicial: TcxDateEdit;
    cxLabel2: TcxLabel;
    cxDatFinal: TcxDateEdit;
    cxRadioGroup1: TcxRadioGroup;
    cxLabel4: TcxLabel;
    cxCodigoAgente: TcxButtonEdit;
    cxNomeAgente: TcxTextEdit;
    cxButton1: TcxButton;
    aclExtrato: TActionList;
    actExtratoCalcular: TAction;
    actExtratoSair: TAction;
    cxGroupBox2: TcxGroupBox;
    dsExtrato: TDataSource;
    actFechamentoListaApoio: TAction;
    actFechamentoExportarResumo: TAction;
    cxButton3: TcxButton;
    SaveDialog: TSaveDialog;
    cxRadioGroup2: TcxRadioGroup;
    actFechamentoFechar: TAction;
    actFechamentoDetalharDebito: TAction;
    actFechamentoDetalharCredito: TAction;
    actFechamentoAjustarRestricao: TAction;
    actFechamentoExportarEntregas: TAction;
    cxButton4: TcxButton;
    cxButton5: TcxButton;
    cxButton6: TcxButton;
    cxButton7: TcxButton;
    tbExtrato: TdxMemData;
    tbExtratoCOD_AGENTE: TIntegerField;
    tbExtratoDES_AGENTE: TStringField;
    tbExtratoCOD_ENTREGADOR: TIntegerField;
    tbExtratoDES_ENTREGADOR: TStringField;
    tbExtratoQTD_VOLUMES: TIntegerField;
    tbExtratoQTD_ENTREGA: TIntegerField;
    tbExtratoVAL_VERBA_TOTAL: TCurrencyField;
    tbExtratoVAL_CREDITO: TCurrencyField;
    tbExtratoVAL_DEBITO: TCurrencyField;
    tbExtratoVAL_RESTRICAO: TCurrencyField;
    tbExtratoVAL_SUB_TOTAL: TCurrencyField;
    tbExtratoQTD_VOLUMES_EXTRA: TFloatField;
    tbExtratoVAL_VOLUMES_EXTRA: TCurrencyField;
    tbExtratoVAL_TOTAL: TCurrencyField;
    tbExtratoVAL_ABASTECIMENTO: TCurrencyField;
    tbExtratoVAL_TOTAL_DESCONTOS: TCurrencyField;
    tbExtratoVAL_TOTAL_CREDITOS: TCurrencyField;
    tbExtratoVAL_TOTAL_GERAL: TCurrencyField;
    cxLabel3: TcxLabel;
    cxLabel5: TcxLabel;
    cxInicioAbastecimento: TcxDateEdit;
    cxLabel6: TcxLabel;
    cxFinalAbastecimento: TcxDateEdit;
    cxLabel7: TcxLabel;
    cxDatPagamento: TcxDateEdit;
    cxButton8: TcxButton;
    tbExtratoVAL_VERBA: TFloatField;
    cxProgressBar: TcxProgressBar;
    cxIncluirRestricoes: TcxCheckBox;
    cxSemEntregas: TcxCheckBox;
    actFechamentoCancelarFechamento: TAction;
    cxButton9: TcxButton;
    tbExtratoDAT_INICIO: TDateField;
    tbExtratoDAT_TERMINO: TDateField;
    tbExtratoDAT_INICIO_ABASTECIMENTO: TDateField;
    tbExtratoDAT_FINAL_ABASTECIMENTO: TDateField;
    tbExtratoDAT_PAGO: TDateField;
    tbExtratoNUM_EXTRATO: TStringField;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView1DES_AGENTE: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1COD_ENTREGADOR: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DES_ENTREGADOR: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1QTD_VOLUMES: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1QTD_ENTREGA: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1VAL_VERBA: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1VAL_VERBA_TOTAL: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1VAL_CREDITO: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1VAL_DEBITO: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1VAL_RESTRICAO: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1VAL_ABASTECIMENTO: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1QTD_VOLUMES_EXTRA: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1VAL_VOLUMES_EXTRA: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1VAL_TOTAL_DESCONTOS: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1VAL_TOTAL_CREDITOS: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1VAL_TOTAL_GERAL: TcxGridDBBandedColumn;
    tbExtratoQTD_1_DIA: TIntegerField;
    tbExtratoQTD_2_DIAS: TIntegerField;
    tbExtratoQTD_MAIS_DIAS: TIntegerField;
    cxGrid1DBBandedTableView1QTD_1_DIA: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1QTD_2_DIAS: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1QTD_MAIS_DIAS: TcxGridDBBandedColumn;
    cxButton2: TcxButton;
    cxGrid1DBBandedTableView1DAT_INICIO: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DAT_TERMINO: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DAT_INICIO_ABASTECIMENTO: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DAT_FINAL_ABASTECIMENTO: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DAT_PAGO: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1NUM_EXTRATO: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1COD_AGENTE: TcxGridDBBandedColumn;
    Panel1: TPanel;
    cxImage1: TcxImage;
    cxLabel16: TcxLabel;
    procedure actExtratoSairExecute(Sender: TObject);
    procedure actExtratoCalcularExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actFechamentoListaApoioExecute(Sender: TObject);
    procedure cxCodigoAgentePropertiesChange(Sender: TObject);
    procedure actFechamentoExportarResumoExecute(Sender: TObject);
    procedure dsExtratoStateChange(Sender: TObject);
    procedure actFechamentoFecharExecute(Sender: TObject);
    procedure actFechamentoDetalharDebitoExecute(Sender: TObject);
    procedure actFechamentoDetalharCreditoExecute(Sender: TObject);
    procedure cxCodigoAgentePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure actFechamentoExportarEntregasExecute(Sender: TObject);
    procedure cxRadioGroup2PropertiesChange(Sender: TObject);
    procedure actFechamentoAjustarRestricaoExecute(Sender: TObject);
    procedure actFechamentoCancelarFechamentoExecute(Sender: TObject);
    procedure cxGroupBox2Resize(Sender: TObject);
    procedure cxRadioGroup1PropertiesChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure ListaAgente;

    Procedure PopulaExtrato;
    procedure PopulaEntrega;
    procedure ExportarEntregas(sArquivo: String);
    function  Validar(): Boolean;
  public
    { Public declarations }
  end;

var
  frmExtrato    : TfrmExtrato;
  thrCalculo    : thrCalculaExtrato;

implementation

{$R *.dfm}

uses udm, ufrmPrincipal, clUtil, Math, ufrmListaApoio, uGlobais, ufrmLancamentos, ufrmTipoExportacao;

procedure TfrmExtrato.actExtratoSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmExtrato.actExtratoCalcularExecute(Sender: TObject);
begin
  if not (Validar()) then begin
    Exit;
  end;

  if cxRadioGroup2.ItemIndex = 0 then begin
    if Application.MessageBox('Confirma a Gerar o Extrato?','Gerar Extrato',MB_ICONQUESTION + MB_YESNO) = IDNO then begin
      Exit;
    end;
    cxProgressBar.Clear;
    thrCalculo                  :=  thrCalculo.Create(True);
    thrCalculo.FreeOnTerminate  :=  True;
    thrCalculo.Priority         :=  tpNormal;
    thrCalculo.Start;
  end
  else begin
    PopulaExtrato;
  end;
end;

procedure TfrmExtrato.FormShow(Sender: TObject);
begin
  cxDatInicial.SetFocus;
end;

procedure TfrmExtrato.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dm.qryGeral.Active then begin
    dm.qryGeral.Close;
    dm.qryGeral.SQL.Clear;
  end;
  agente.Free;
  entregador.Free;
  entrega.Free;
  extrato.Free;
  restricao.Free;
  abastecimento.Free;
  planilha.Free;
  Action      :=  caFree;
  frmExtrato  :=  Nil;
end;

procedure TfrmExtrato.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key = #13 then begin
    if cxGrid1.IsFocused then begin
      Exit;
    end;
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TfrmExtrato.PopulaExtrato;
var
  sData, sData1, sTipo:  String;

begin
  try
    if tbExtrato.Active then
      tbExtrato.Close;
    tbExtrato.Open;

  if cxCodigoAgente.Text = '0' then begin
    cxCodigoAgente.Text :=  '';
  end;

  if cxRadioGroup1.ItemIndex = 2 then begin
    sTipo :=  'PAGAMENTO';
    sData   := cxDatInicial.Text;
    sData1  := cxDatFinal.Text;
  end
  else begin
    sTipo :=  'DATA';
    sData   := cxDatInicial.Text;
    sData1  := cxDatFinal.Text;
  end;

  if not (extrato.Periodo(sData,sData1,cxCodigoAgente.Text, sTipo)) then begin
    cxGrid1DBBandedTableView1.OptionsView.NoDataToDisplayInfoText := '<Nenhuma Informação Disponível>';
    Exit;
  end;

  cxGrid1DBBandedTableView1.OptionsView.NoDataToDisplayInfoText := '<Atualizando o Grid. Aguarde...>';
  cxgrid1.Refresh;

  while not (dm.qryGeral.Eof) do begin
    tbExtrato.Insert;

    tbExtratoCOD_AGENTE.Value               :=  dm.qryGeral.FieldByName('COD_AGENTE').AsInteger;
    tbExtratoDES_AGENTE.Value               :=  dm.qryGeral.FieldByName('DES_AGENTE').AsString;
    tbExtratoCOD_ENTREGADOR.Value           :=  dm.qryGeral.FieldByName('COD_ENTREGADOR').AsInteger;
    tbExtratoDES_ENTREGADOR.Value           :=  dm.qryGeral.FieldByName('DES_ENTREGADOR').AsString;
    tbExtratoQTD_VOLUMES.Value              :=  dm.qryGeral.FieldByName('QTD_VOLUMES').AsInteger;
    tbExtratoQTD_ENTREGA.Value              :=  dm.qryGeral.FieldByName('QTD_ENTREGA').AsInteger;
    tbExtratoVAL_VERBA.Value                :=  dm.qryGeral.FieldByName('VAL_VERBA').AsCurrency;
    tbExtratoVAL_VERBA_TOTAL.Value          :=  dm.qryGeral.FieldByName('VAL_VERBA_TOTAL').AsCurrency;
    tbExtratoVAL_CREDITO.Value              :=  dm.qryGeral.FieldByName('VAL_CREDITO').AsCurrency;
    tbExtratoVAL_DEBITO.Value               :=  dm.qryGeral.FieldByName('VAL_DEBITO').AsCurrency;
    tbExtratoVAL_RESTRICAO.Value            :=  dm.qryGeral.FieldByName('VAL_RESTRICAO').AsCurrency;
    tbExtratoVAL_SUB_TOTAL.Value            :=  dm.qryGeral.FieldByName('VAL_SUB_TOTAL').AsCurrency;
    tbExtratoQTD_VOLUMES_EXTRA.Value        :=  dm.qryGeral.FieldByName('QTD_VOLUMES_EXTRA').AsFloat;
    tbExtratoVAL_VOLUMES_EXTRA.Value        :=  dm.qryGeral.FieldByName('VAL_VOLUMES_EXTRA').AsCurrency;
    tbExtratoVAL_TOTAL.Value                :=  dm.qryGeral.FieldByName('VAL_TOTAL').AsCurrency;
    tbExtratoVAL_ABASTECIMENTO.Value        :=  dm.qryGeral.FieldByName('VAL_ABASTECIMENTO').AsCurrency;
    tbExtratoVAL_TOTAL_DESCONTOS.Value      :=  dm.qryGeral.FieldByName('VAL_TOTAL_DESCONTOS').AsCurrency;
    tbExtratoVAL_TOTAL_CREDITOS.Value       :=  dm.qryGeral.FieldByName('VAL_TOTAL_CREDITOS').AsCurrency;
    tbExtratoVAL_TOTAL_GERAL.Value          :=  dm.qryGeral.FieldByName('VAL_TOTAL_GERAL').AsCurrency;
    tbExtratoDAT_INICIO.Value               :=  dm.qryGeral.FieldByName('DAT_INICIO').AsDateTime;
    tbExtratoDAT_TERMINO.Value              :=  dm.qryGeral.FieldByName('DAT_TERMINO').AsDateTime;
    tbExtratoDAT_INICIO_ABASTECIMENTO.Value :=  dm.qryGeral.FieldByName('DAT_INICIO_ABASTECIMENTO').AsDateTime;
    tbExtratoDAT_FINAL_ABASTECIMENTO.Value  :=  dm.qryGeral.FieldByName('DAT_FINAL_ABASTECIMENTO').AsDateTime;
    tbExtratoDAT_PAGO.Value                 :=  dm.qryGeral.FieldByName('DAT_PAGO').AsDateTime;
    tbExtratoNUM_EXTRATO.Value              :=  dm.qryGeral.FieldByName('NUM_EXTRATO').AsString;
    tbExtratoQTD_1_DIA.Value                :=  dm.qryGeral.FieldByName('QTD_1_DIA').AsInteger;
    tbExtratoQTD_2_DIAS.Value               :=  dm.qryGeral.FieldByName('QTD_2_DIAS').AsInteger;
    tbExtratoQTD_MAIS_DIAS.Value            :=  dm.qryGeral.FieldByName('QTD_MAIS_DIAS').AsInteger;
    tbExtrato.Post;
    dm.qryGeral.Next;
  end;
  dm.qryGeral.Close;
  dm.qryGeral.SQL.Clear;
  if not  (tbExtrato.IsEmpty) then
    tbExtrato.First;

  cxGrid1DBBandedTableView1.OptionsView.NoDataToDisplayInfoText := '<Nenhuma Informação Disponível>';

  Except
    on E : Exception do
      ShowMessage('Classe: '+ e.ClassName + chr(13) + 'Mensagem: '+ e.Message);
  end;

end;

procedure TfrmExtrato.PopulaEntrega;
var
  sDataIni, sDataFim, sAgente, sEntregador, sListaAgente  : String;
  iAgente, iEntregador, iVolumes                          : Integer;
  dVerba, dCredito, dDebito, dRestricao                   : Double;
  bAgente                                                 : Boolean;
begin

  iAgente       :=  0;
  iEntregador   :=  0;
  sAgente       :=  '';
  sEntregador   :=  '';
  dVerba        :=  0;
  sListaAgente  :=  '';
  iVolumes    :=  0;
//  iEntregas   :=  0;
//  dSubTotal   :=  0;
  dCredito    :=  0;
  dDebito     :=  0;
  dRestricao  :=  0;
//  dTotal      :=  0;
  sDataIni    :=  FormatDateTime('dd/mm/yyyy', cxDatInicial.Date);
  sDataFim    :=  FormatDateTime('dd/mm/yyyy', cxDatFinal.Date);
  iAgente     :=  dm.qryGeral.FieldByName('COD_AGENTE').AsInteger;
  iEntregador :=  dm.qryGeral.FieldByName('COD_ENTREGADOR').AsInteger;
  dm.ZConn.PingServer;
  if agente.getObject(IntToStr(iAgente),'CODIGO') then begin
    sAgente     :=  agente.Fantasia;
  end;
  if entregador.getObject(IntToStr(iEntregador),'CODIGO') then begin
    sEntregador :=  entregador.Fantasia;
  end;
  bAgente := True;
  while not (dm.qryGeral.Eof) do begin
    tbExtrato.Insert;
    tbExtratoCOD_AGENTE.Value      :=  dm.qryGeral.FieldByName('COD_AGENTE').AsInteger;
    if agente.getObject(dm.qryGeral.FieldByName('COD_AGENTE').AsString,'CODIGO') then begin
      sAgente := agente.Fantasia;
      dVerba  := agente.Verba;
    end
    else begin
      sAgente :=  '---';
      dVerba  :=  0;
    end;
    tbExtratoDES_AGENTE.Value      :=  sAgente;
    tbExtratoCOD_ENTREGADOR.Value  :=  dm.qryGeral.FieldByName('COD_ENTREGADOR').AsInteger;
    if entregador.getObject(dm.qryGeral.FieldByName('COD_ENTREGADOR').AsString,'CODIGO') then begin
      sEntregador := entregador.Fantasia;
      if dVerba = 0 then dVerba := entregador.Verba;
    end
    else begin
      sEntregador := '---';
    end;
    iVolumes                        :=  dm.qryGeral.FieldByName('VOLUMES').AsInteger -
                                        dm.qryGeral.FieldByName('ENTREGAS').AsInteger;
    tbExtratoDES_ENTREGADOR.Value   :=  sEntregador;
    tbExtratoQTD_VOLUMES.Value      :=  dm.qryGeral.FieldByName('VOLUMES').AsInteger;
    tbExtratoQTD_ENTREGA.Value      :=  dm.qryGeral.FieldByName('ENTREGAS').AsInteger;
    tbExtratoVAL_VERBA_TOTAL.Value  :=  (dVerba * tbExtratoQTD_ENTREGA.AsInteger) + ((dVerba / 2) * iVolumes);
    tbextratoVAL_VERBA.Value        :=  tbExtratoVAL_VERBA_TOTAL.Value / tbExtratoQTD_ENTREGA.Value;
    tbExtratoVAL_CREDITO.Value     :=  dCredito;
    tbExtratoVAL_DEBITO.Value      :=  dDebito;
    tbExtratoVAL_RESTRICAO.Value   :=  dRestricao;
//    tbExtratoVAL_TOTAL_GERAL.Value :=  tbExtratoVAL_VERBA_TOTAL.Value + tbExtratoVAL_CREDITO.Value + tbExtratoVAL_DEBITO.Value +
//                                        tbExtratoVAL_RESTRICAO.Value;
    tbExtrato.Post;

    dm.qryGeral.Next;

  end;

  dm.qryGeral.Close;
  dm.qryGeral.SQL.Clear;

end;

procedure TfrmExtrato.actFechamentoListaApoioExecute(Sender: TObject);
var
  sCampo, sId, sResultado : String;
begin
  sId := '';
  sCampo := '';
  sResultado := '';
  if cxCodigoAgente.IsFocused then
    begin
      sCampo := 'AGENTE';
      sId := Trim(cxCodigoAgente.Text);
    end
    else
      Exit;
  Screen.Cursor := crHourGlass;
  if not (agente.getObjects()) then
    Exit;
  if dm.tbApoio.Active then
    dm.tbApoio.Close;
  dm.tbApoio.Open;
  dm.tbApoio.CreateFieldsFromDataSet(dm.qryGetObject);
  dm.tbApoio.LoadFromDataSet(dm.qryGetObject);
  if not (dm.tbApoio.IsEmpty) then
    dm.tbApoio.First;
  dm.qryGetObject.Close;
  dm.qryGetObject.SQL.Clear;
  Screen.Cursor := crDefault;
  if not Assigned(frmListaApoio) then
    frmListaApoio := TfrmListaApoio.Create(Application);
  frmListaApoio.ds.DataSet.Refresh;
  frmListaApoio.cxGrid1DBTableView1.DataController.CreateAllItems;
  frmListaApoio.cxGrid1DBTableView1.Columns[1].Caption := 'Código';
  frmListaApoio.cxGrid1DBTableView1.Columns[2].Caption := 'Nome/Razão Social';
  frmListaApoio.cxGrid1DBTableView1.Columns[3].Caption := 'Alias/Nome Fantasia';
  frmListaApoio.iColuna := 3;
  frmListaApoio.Caption := 'Agentes';
  frmListaApoio.ShowModal;
  if Resultado then
    begin
      sId := dm.tbApoio.FieldByName('COD_AGENTE').AsString;
      cxCodigoAgente.Text := sId;
      cxCodigoAgente.Refresh;
      sCampo := 'CODIGO';
      cxNomeAgente.Properties.ReadOnly := False;
      if agente.getObject(sId,sCampo) then
        cxNomeAgente.Text := agente.Fantasia
      else
        cxNomeAgente.Text := '';
      cxNomeAgente.Refresh;
      cxNomeAgente.Properties.ReadOnly := True;
    end;
  dm.tbApoio.Close;
  frmListaApoio.Free;

end;

procedure TfrmExtrato.cxCodigoAgentePropertiesChange(Sender: TObject);
begin
  cxNomeAgente.Clear;
end;

procedure TfrmExtrato.actFechamentoExportarResumoExecute(Sender: TObject);
var
  FileExt, sFile  : String;
begin
  if not (tbExtrato.Active) then begin
    Exit;
  end;
  if tbExtrato.IsEmpty then begin
    Exit;
  end;
  sFile :=  'extrato_' + Trim(tbExtratoCOD_AGENTE.AsString) + '_';
  if cxRadioGroup1.ItemIndex = 2 then begin
    sFile :=  sFile + Copy(tbExtratoDAT_INICIO.AsString,1,2) + Copy(tbExtratoDAT_INICIO.AsString,4,2) +
                      Copy(tbExtratoDAT_INICIO.AsString,7,4) + '_' + Copy(tbExtratoDAT_TERMINO.AsString,1,2) +
                      Copy(tbExtratoDAT_TERMINO.AsString,4,2) + Copy(tbExtratoDAT_TERMINO.AsString,7,4);
  end
  else begin
    sFile :=  sFile + Copy(cxDatInicial.Text,1,2) + Copy(cxDatInicial.Text,4,2) +
                      Copy(cxDatInicial.Text,7,4) + '_' + Copy(cxDatFinal.Text,1,2) +
                      Copy(cxDatFinal.Text,4,2) + Copy(cxDatFinal.Text,7,4);
  end;
  SaveDialog.FileName :=  sFile;
  SaveDialog.Filter :=  '';
  SaveDialog.Filter := 'Excel (*.xls) |*.xls|XML (*.xml) |*.xml|Arquivo Texto (*.txt) |*.txt|Página Web (*.html)|*.html';
  SaveDialog.Title := 'Exportar Dados';
  SaveDialog.DefaultExt:= 'xls';
  if SaveDialog.Execute then
  begin
    FileExt := LowerCase(ExtractFileExt(SaveDialog.FileName));
    if FileExt = '.xls' then
          ExportGridToExcel(SaveDialog.FileName,cxGrid1, False, True, False)
    else if FileExt = '.xml' then
          ExportGridToXML(SaveDialog.FileName,cxGrid1, False)
    else if FileExt = '.txt' then
          ExportGridToText(SaveDialog.FileName,cxGrid1, False)
    else if FileExt = '.html' then
          ExportGridToHTML(SaveDialog.FileName,cxGrid1, False);
    ShellExecute(Handle, 'open', pchar(SaveDialog.FileName), nil, nil, SW_SHOW);
  end;
end;

procedure TfrmExtrato.dsExtratoStateChange(Sender: TObject);
begin
  actFechamentoExportarResumo.Enabled := (dsExtrato.State in [dsBrowse]);
  actFechamentoExportarEntregas.Enabled := (dsExtrato.State in [dsBrowse]);
  actFechamentoDetalharCredito.Enabled := (dsExtrato.State in [dsBrowse]);
  actFechamentoDetalharDebito.Enabled := (dsExtrato.State in [dsBrowse]);
  actFechamentoAjustarRestricao.Enabled := (dsExtrato.State in [dsBrowse]);
end;

procedure TfrmExtrato.actFechamentoFecharExecute(Sender: TObject);
var
  dValor          : Double;
  sChave          : String;
begin
  if tbExtrato.IsEmpty then begin
    Exit;
  end;
  if TUtil.Empty(cxDatPagamento.Text) then begin
    MessageDlg('Informe a Data do Pagamento!',mtWarning,[mbOK],0);
    Exit;
  end;
  if MessageDlg('Confirma o Fechamento deste Extrato?',mtConfirmation,[mbYes,mbNo],0) = mrNo then begin
    Exit;
  end;

  Screen.Cursor := crHourGlass;

  tbExtrato.First;
  while not (tbExtrato.Eof) do begin
    extrato.CodigoAgente        :=  tbExtratoCOD_AGENTE.AsInteger;
    extrato.NomeAgente          :=  tbExtratoDES_AGENTE.AsString;
    extrato.CodigoEntregador    :=  tbExtratoCOD_ENTREGADOR.AsInteger;
    extrato.NomeEntregador      :=  tbExtratoDES_ENTREGADOR.AsString;
    extrato.DataBase            :=  cxDatFinal.Date;
    extrato.DataPagamento       :=  cxDatPagamento.Date;
    extrato.GeraNumero;
    extrato.DataInicio          :=  cxDatInicial.Date;
    extrato.DataTermino         :=  cxDatFinal.Date;
    extrato.Volumes             :=  tbExtratoQTD_VOLUMES.AsInteger;
    extrato.Entrega             :=  tbExtratoQTD_ENTREGA.AsInteger;
    extrato.Verba               :=  tbExtratoVAL_VERBA.AsFloat;
    extrato.VerbaTotal          :=  tbExtratoVAL_VERBA_TOTAL.AsCurrency;
    extrato.Credito             :=  tbExtratoVAL_CREDITO.AsCurrency;
    extrato.Debito              :=  tbExtratoVAL_DEBITO.AsCurrency;
    extrato.Restricao           :=  tbExtratoVAL_RESTRICAO.AsCurrency;
    extrato.SubTotal            :=  tbExtratoVAL_SUB_TOTAL.AsCurrency;
    extrato.VolumesExtra        :=  tbExtratoQTD_VOLUMES_EXTRA.AsFloat;
    extrato.ValorVolumesExtra   :=  tbExtratoVAL_VOLUMES_EXTRA.AsCurrency;
    extrato.Total               :=  tbExtratoVAL_TOTAL.AsCurrency;
    extrato.DataPagamento       :=  cxDatPagamento.Date;
    extrato.MarcaPago           :=  'S';
    extrato.ValorAbastecimento  :=  tbExtratoVAL_ABASTECIMENTO.AsCurrency;
    if not (TUtil.Empty(cxInicioAbastecimento.Text)) then begin
      extrato.IncioAbastecimento  :=  cxInicioAbastecimento.Date;
      extrato.FinalAbastecimento  :=  cxFinalAbastecimento.Date;
    end
    else begin
      extrato.IncioAbastecimento  :=  0;
      extrato.FinalAbastecimento  :=  0;
    end;
    extrato.TotalDescontos      :=  tbExtratoVAL_TOTAL_DESCONTOS.AsCurrency;
    extrato.TotalCreditos       :=  tbExtratoVAL_TOTAL_CREDITOS.AsCurrency;
    extrato.TotalGeral          :=  tbExtratoVAL_TOTAL_GERAL.AsCurrency;
    extrato.MarcaFechado        := 'S';
    extrato.DataFechado         :=  Now;
    extrato.Executante          :=  frmprincipal.UserControl.CurrentUser.UserLogin;
    extrato.Manutencao          :=  Now;
    extrato.Dia1                :=  tbExtratoQTD_1_DIA.AsInteger;
    extrato.Dia2                :=  tbExtratoQTD_2_DIAS.AsInteger;
    extrato.Dia3                :=  tbExtratoQTD_MAIS_DIAS.AsInteger;

    // Fechar entregas
    if not (entrega.Fechar(cxDatInicial.Text,cxDatFinal.Text,cxDatPagamento.Text,extrato.NumeroExtrato,
                           tbExtratoCOD_AGENTE.AsString,tbExtratoCOD_ENTREGADOR.AsString,'BAIXA','FECHAR')) then begin
      MessageDlg('Erro Fechamento: ENTREGAS; Agente: ' + tbExtratoCOD_AGENTE.AsString + ' / Entregador: ' +
                 tbExtratoCOD_ENTREGADOR.AsString, mtWarning, [mbOK],0);
      Screen.Cursor := crDefault;
      Exit;
    end;

    // Processar abastecimentos
    if not (TUtil.Empty(cxInicioAbastecimento.Text)) then begin
      if not (abastecimento.Fechar(cxInicioAbastecimento.Text,cxFinalAbastecimento.Text,tbExtratoCOD_ENTREGADOR.AsString,
              extrato.NumeroExtrato)) then begin
        MessageDlg('Erro Fechamento: ABASTECIMENTO; Entregador: ' + tbExtratoCOD_ENTREGADOR.AsString, mtWarning, [mbOK],0);
        Screen.Cursor := crDefault;
        Exit;
      end;
    end;

    // Processar restrições
    if extrato.Restricao <> 0 then begin
      if restricao.getObject(IntToStr(extrato.CodigoEntregador),'ENTREGADOR') then begin
        restricao.Valor   :=  restricao.Valor + extrato.Restricao;
        restricao.Pago    :=  restricao.Pago + ABS(extrato.Restricao);
        restricao.Debitar :=  0;
        if not (restricao.Update) then begin
          MessageDlg('Erro Fechamento: RESTRIÇÃO; Agente: ' + tbExtratoCOD_AGENTE.AsString + ' / Entregador: ' +
                     tbExtratoCOD_ENTREGADOR.AsString, mtWarning, [mbOK],0);
          Screen.Cursor := crDefault;
          Exit;
        end;
      end
      else begin
        if restricao.getObject(IntToStr(extrato.CodigoAgente),'AGENTE') then begin
          restricao.Valor :=  restricao.Valor + extrato.Restricao;
          restricao.Pago  :=  restricao.Pago + ABS(extrato.Restricao);
          restricao.Debitar :=  0;
          if not (restricao.Update) then begin
            MessageDlg('Erro Fechamento: RESTRIÇÃO; Agente: ' + tbExtratoCOD_AGENTE.AsString + ' / Entregador: ' +
                       tbExtratoCOD_ENTREGADOR.AsString, mtWarning, [mbOK],0);
            Screen.Cursor := crDefault;
            Exit;
          end;
        end;
      end;
    end;

    // Fechar lançamentos de débitos e créditos
    if not (lancamento.Fechar(cxDatInicial.Text,cxDatFinal.Text,cxDatPagamento.Text,extrato.NumeroExtrato,
            IntToStr(extrato.CodigoEntregador),'FECHAR')) then begin
      MessageDlg('Erro Fechamento: LANÇAMENTO; Agente: ' + tbExtratoCOD_AGENTE.AsString + ' / Entregador: ' +
                 tbExtratoCOD_ENTREGADOR.AsString, mtWarning, [mbOK],0);
      Screen.Cursor := crDefault;
      Exit;
    end;
    if not (lancamento.Persistecia) then begin
      MessageDlg('Erro Fechamento: Persistência LANÇAMENTO; Agente: ' + tbExtratoCOD_AGENTE.AsString + ' / Entregador: ' +
                 tbExtratoCOD_ENTREGADOR.AsString, mtWarning, [mbOK],0);
      Screen.Cursor := crDefault;
      Exit;
    end;

    // Gera Planilha de Crédito
    dValor  :=  0;
    sChave  :=  '';
    if agente.getObject(IntToStr(extrato.CodigoAgente),'CODIGO') then begin
      if agente.Forma = 'NENHUMA' then begin
        if entregador.getObject(IntToStr(extrato.CodigoEntregador),'CODIGO') then begin
          if entregador.Forma <> 'NENHUMA' then begin
            planilha.DataPagamento      :=  extrato.DataPagamento;
            planilha.Agente             :=  extrato.CodigoEntregador;
            planilha.Entregador         :=  0;
            planilha.TipoConta          :=  entregador.TipoConta;
            planilha.Banco              :=  entregador.Banco;
            planilha.Agencia            :=  entregador.Agencia;
            planilha.Conta              :=  entregador.NumeroConta;
            planilha.Favorecido         :=  entregador.Favorecido;
            planilha.CpfCnpjFavorecido  :=  entregador.CpfCnpjFavorecido;
            planilha.TipoPagamento      :=  entregador.Forma;
            planilha.Extrato            :=  extrato.NumeroExtrato;
            dValor                      :=  extrato.TotalGeral;
            planilha.Executor           :=  frmPrincipal.UserControl.CurrentUser.UserLogin;
            planilha.Manutencao         :=  Now;
            sChave                      :=  Format('%.6d',[planilha.Agente]) + FormatDateTime('dd/mm/yyyy',planilha.DataPagamento);
            if planilha.getObject(sChave,'CHAVE') then begin
              planilha.Valor              :=  planilha.Valor + dValor;
              if not (planilha.Update()) then begin
                MessageDlg('Erro ao alterar os dados na planilha de crédito. Chave: E' + sChave,mtWarning,[mbOK],0);
                Exit;
              end;
            end
            else begin
              planilha.Valor              :=  dValor;
              if not (planilha.Insert()) then begin
                MessageDlg('Erro ao incluir os dados na planilha de crédito. Chave: E' + sChave,mtWarning,[mbOK],0);
                Exit;
              end;
            end
          end;
        end;
      end
      else begin
        planilha.DataPagamento      :=  extrato.DataPagamento;
        planilha.Agente             :=  extrato.CodigoAgente;
        planilha.Entregador         :=  0;
        planilha.TipoConta          :=  agente.TipoConta;
        planilha.Banco              :=  agente.Banco;
        planilha.Agencia            :=  agente.Agencia;
        planilha.Conta              :=  agente.NumeroConta;
        planilha.Favorecido         :=  agente.Favorecido;
        planilha.CpfCnpjFavorecido  :=  agente.CpfCnpjFavorecido;
        planilha.TipoPagamento      :=  agente.Forma;
        planilha.Extrato            :=  extrato.NumeroExtrato;
        dValor                      :=  extrato.TotalGeral;
        planilha.Executor           :=  frmPrincipal.UserControl.CurrentUser.UserLogin;
        planilha.Manutencao         :=  Now;
        sChave                      :=  Format('%.6d',[planilha.Agente]) + FormatDateTime('dd/mm/yyyy',planilha.DataPagamento);
        if planilha.getObject(sChave,'CHAVE') then begin
          planilha.Valor              :=  planilha.Valor + dValor;
          if not (planilha.Update()) then begin
            MessageDlg('Erro ao alterar os dados na planilha de crédito. Chave: A' + sChave,mtWarning,[mbOK],0);
            Exit;
          end;
        end
        else begin
          planilha.Valor              :=  dValor;
          if not (planilha.Insert()) then begin
            MessageDlg('Erro ao incluir os dados na planilha de crédito. Chave: A' + sChave,mtWarning,[mbOK],0);
            Exit;
          end;
        end
      end;
    end;

    // Salvar extrato
    if not (extrato.Insert) then begin
      MessageDlg('Erro Fechamento: EXTRATO; Agente: ' + tbExtratoCOD_AGENTE.AsString + ' / Entregador: ' +
                 tbExtratoCOD_ENTREGADOR.AsString, mtWarning, [mbOK],0);
      Screen.Cursor := crDefault;
      Exit;
    end;

    tbExtrato.Next;

  end;

  Screen.Cursor := crDefault;

  MessageDlg('Extrato fechado!',mtInformation,[mbOK],0);

  tbExtrato.Close;

  TUtil.LimparFields(Self);

  cxDatInicial.SetFocus;

end;

procedure TfrmExtrato.actFechamentoDetalharDebitoExecute(Sender: TObject);
var
  sMess: String;
  sDataIni, sDataFim: String;
begin
{  sMess := '';
  sDataIni := FormatDateTime('dd/mm/yyyy', cxDatInicial.Date);
  sDataFim := FormatDateTime('dd/mm/yyyy', cxDatFinal.Date);
  if not (tbExtrato.Active) then Exit;
  if tbExtrato.IsEmpty then Exit;
  if tbExtratoVAL_DEBITO.Value = 0 then begin
    sMess := 'Não Existem débitos para esse Entregador! Deseja Incluir um Lançamento de Débito?';
    if Application.MessageBox(pChar(sMess),'Atenção',MB_YESNO + MB_ICONQUESTION) = IDYES then begin
      if not Assigned(frmLancamentos) then
        frmLancamentos := TfrmLancamentos.Create(Application);
      frmLancamentos.cxTipo.ItemIndex := 1;
      frmLancamentos.cxEntregador.Text := tbExtratoCOD_ENTREGADOR.AsString;
      frmLancamentos.cxNomeEntregador.Text := tbExtratoDES_ENTREGADOR.Text;
      uGlobais.Lancamento := -1;
      frmLancamentos.Show;
      if uGlobais.Resultado then begin
        actExtratoCalcularExecute(Self);
      end;
    end;
  end
  else begin
    if not (lancamento.Periodo(sDataIni,sDataFim,tbExtratoCOD_ENTREGADOR.AsString,'DEBITO')) then begin
      MessageDlg('Erro ao localizar os Lançamentos!',mtWarning,[mbOK],0);
      Exit;
    end;
    if not Assigned(frmDetalheLancamentos) then
      frmDetalheLancamentos := TfrmDetalheLancamentos.Create(Application);
    frmDetalheLancamentos.tbLancamentos.Open;
    frmDetalheLancamentos.tbLancamentos.LoadFromDataSet(dm.qryGetObject);
    if not (frmDetalheLancamentos.tbLancamentos.IsEmpty) then frmDetalheLancamentos.tbLancamentos.First;
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
    frmDetalheLancamentos.Show;
    if uGlobais.Resultado then begin
      actExtratoCalcularExecute(Self);
    end;
  end;}
end;

procedure TfrmExtrato.actFechamentoDetalharCreditoExecute(Sender: TObject);
var
  sMess: String;
  sDataIni, sDataFim: String;
begin
  {sMess := '';
  sDataIni := FormatDateTime('dd/mm/yyyy', cxDatInicial.Date);
  sDataFim := FormatDateTime('dd/mm/yyyy', cxDatFinal.Date);
  if not (tbExtrato.Active) then Exit;
  if tbExtrato.IsEmpty then Exit;
  if tbExtratoVAL_CREDITO.Value = 0 then begin
    sMess := 'Não Existem créditos para esse Entregador! Deseja Incluir um Lançamento de Crédito?';
    if Application.MessageBox(pChar(sMess),'Atenção',MB_YESNO + MB_ICONQUESTION) = IDYES then begin
      if not Assigned(frmLancamentos) then
        frmLancamentos := TfrmLancamentos.Create(Application);
      frmLancamentos.cxTipo.ItemIndex := 0;
      frmLancamentos.cxEntregador.Text := tbExtratoCOD_ENTREGADOR.AsString;
      frmLancamentos.cxNomeEntregador.Text := tbExtratoDES_ENTREGADOR.Text;
      uGlobais.Lancamento := -1;
      frmLancamentos.Show;
      if uGlobais.Resultado then begin
        actExtratoCalcularExecute(Self);
      end;
    end;
  end
  else begin
    if not (lancamento.Periodo(sDataIni,sDataFim,tbExtratoCOD_ENTREGADOR.AsString,'DEBITO')) then begin
      MessageDlg('Erro ao localizar os Lançamentos!',mtWarning,[mbOK],0);
      Exit;
    end;
    if not Assigned(frmDetalheLancamentos) then
      frmDetalheLancamentos := TfrmDetalheLancamentos.Create(Application);
    frmDetalheLancamentos.tbLancamentos.Open;
    frmDetalheLancamentos.tbLancamentos.LoadFromDataSet(dm.qryGetObject);
    if not (frmDetalheLancamentos.tbLancamentos.IsEmpty) then frmDetalheLancamentos.tbLancamentos.First;
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
    frmDetalheLancamentos.Show;
    if uGlobais.Resultado then begin
      actExtratoCalcularExecute(Self);
    end;
  end; }
end;

procedure TfrmExtrato.cxCodigoAgentePropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if TUtil.Empty(cxCodigoAgente.Text) then Exit;
  if StrToInt(cxCodigoAgente.Text) = 0 then Exit;
  if not (agente.getObject(cxCodigoAgente.Text,'CODIGO')) then begin
    MessageDlg('Código de Agente Não Cadastrado!',mtWarning,[mbOK],0);
    Exit;
  end
  else begin
    cxNomeAgente.Text := agente.Fantasia;
  end;
end;

procedure TfrmExtrato.ExportarEntregas(sArquivo: String);
var
  sAgente, sDataIni, sDataFim, sEntregador, filtro, sLinha, sTipo               : String;
  fArquivo                                                                      : TextFile;
  iConta, iPagina, iAgente, iEntregador, iTotEntregador, iTotAgente, iTotGeral  : Integer;
begin
  try
    sAgente     :=  '';
    sEntregador :=  '';
    iAgente     :=  0;
    iEntregador :=  0;
    if cxRadioGroup1.ItemIndex = 2 then begin
      sDataIni    :=  tbExtratoDAT_INICIO.AsString;
      sDataFim    :=  tbExtratoDAT_TERMINO.AsString;
    end
    else begin
      sDataIni    :=  FormatDateTime('dd/mm/yyyy', cxDatInicial.Date);
      sDataFim    :=  FormatDateTime('dd/mm/yyyy', cxDatFinal.Date);
    end;
    iConta      :=  0;

    Screen.Cursor := crHourGlass;

    if TUtil.Empty(sArquivo) then Exit;
    sAgente     :=  tbExtratoCOD_AGENTE.AsString;
    sEntregador :=  tbExtratoCOD_ENTREGADOR.AsString;
    if cxRadioGroup1.ItemIndex = 1 then
      filtro  :=  'ATRIBUICAO'
    else
      filtro  :=  'BAIXA';
    if uGlobais.TipoExportacao  = 0 then begin
      sAgente     :=  '';
      sEntregador :=  '';
    end
    else if uGlobais.TipoExportacao = 1 then begin
      sEntregador :=  '';
    end
    else if uGlobais.TipoExportacao = 2 then begin
      sAgente     := '';
    end;
    if entrega.Periodo(sDataIni,sDataFim,sAgente,sEntregador,filtro) then begin
      if not (dm.qryGeral.Active) then Exit;
      if dm.qryGeral.IsEmpty then Exit;
      dm.qryGeral.First;
      if cxRadioGroup1.ItemIndex  = 0 then begin
        sTipo :=  'Digitalização (Baixas)';
      end
      else begin
        sTipo :=  'Atribuições';
      end;
      AssignFile(fArquivo, sArquivo);
      Rewrite(fArquivo);
      iPagina         :=  0;
      iAgente         :=  0;
      iEntregador     :=  0;
      iTotAgente      :=  0;
      iTotEntregador  :=  0;
      iTotGeral       :=  0;
      sLinha  :=  '';
      while not (dm.qryGeral.Eof) do begin
        sLinha  :=  'Entregas de Encomendas Expressas por ' + sTipo + ' de Protocolos (Detalhado)';
        Writeln(fArquivo,sLinha);
        if agente.getObject(dm.qryGeral.FieldByName('COD_AGENTE').AsString,'CODIGO') then begin
          iagente :=  StrToInt(agente.Codigo);
          sAgente :=  agente.Fantasia;
        end
        else begin
          iagente :=  StrToInt(agente.Codigo);
          sAgente :=  '---';
        end;
        if entregador.getObject(dm.qryGeral.FieldByName('COD_ENTREGADOR').AsString,'CODIGO') then begin
          iEntregador :=  StrToInt(entregador.Codigo);
          sEntregador :=  entregador.Fantasia;
        end
        else begin
          iEntregador :=  StrToInt(entregador.Codigo);
          sEntregador :=  '---';
        end;
        sLinha  :=  'Período de ' + sDataIni + ' à ' + sDataFim;
        sLinha  :=  sLinha + StringOfChar(';',7);
        Writeln(fArquivo,sLinha);
        sLinha  :=  'Agente:;' + IntToStr(iAgente) + '/' + sAgente + ';Entregador:;' + IntToStr(iEntregador) + '/' + sEntregador;
        Writeln(fArquivo,sLinha);
        sLinha  :=  'Nosso Número;Volumes;Data Atribuição;Data Baixa;Nosso Número;Volumes;Data Atribuição;Data Baixa;' +
                    'Nosso Número;Volumes;Data Atribuição;Data Baixa;';
        Writeln(fArquivo,sLinha);
        iConta  :=  1;
        sLinha  :=  '';
        while (iAgente      = dm.qryGeral.FieldByName('COD_AGENTE').AsInteger) and
              (iEntregador  = dm.qryGeral.FieldByName('COD_ENTREGADOR').AsInteger) and
              (not (dm.qryGeral.Eof)) do begin
          if iConta <= 3 then begin
            sLinha    :=  sLinha + dm.qryGeral.FieldByName('NUM_NOSSONUMERO').AsString + ';';
            sLinha    :=  sLinha + dm.qryGeral.FieldByName('QTD_VOLUMES').AsString + ';';
            sLinha    :=  sLinha + dm.qryGeral.FieldByName('DAT_ATRIBUICAO').AsString + ';';
            sLinha    :=  sLinha + dm.qryGeral.FieldByName('DAT_BAIXA').AsString + ';';
            Inc(iConta);
            Inc(iTotAgente);
            Inc(iTotEntregador);
            Inc(iTotGeral);
            dm.qryGeral.Next;
          end
          else begin
            if not (TUtil.Empty(sLinha)) then begin
              Writeln(fArquivo,sLinha);
              sLinha  :=  '';
              iConta  :=  1;
            end;
          end;
        end;
        if not (TUtil.Empty(sLinha)) then begin
          Writeln(fArquivo,sLinha);
          sLinha  :=  '';
        end;
        if not (dm.qryGeral.Eof) then begin
          if iEntregador  <> dm.qryGeral.FieldByName('COD_ENTREGADOR').AsInteger then begin
            if iTotEntregador > 0 then begin
              sLinha  :=  ';Total do Entregador;' + IntToStr(iTotEntregador);
              Writeln(fArquivo,sLinha);
              iTotEntregador  :=  0;
              sLinha          :=  '';
            end;
          end;
          if iAgente  <> dm.qryGeral.FieldByName('COD_AGENTE').AsInteger then begin
            if iTotAgente > 0 then begin
              sLinha  :=  ';Total do Agente;' + IntToStr(iTotAgente);
              Writeln(fArquivo,sLinha);
              iTotAgente  :=  0;
              sLinha      :=  '';
            end;
          end;
        end
        else begin
          if iTotEntregador > 0 then begin
            sLinha          :=  ';Total do Entregador;' + IntToStr(iTotEntregador);
            Writeln(fArquivo,sLinha);
            iTotAgente  :=  0;
            sLinha      :=  '';
          end;
          if iTotAgente > 0 then begin
            sLinha          :=  ';Total do Agente;' + IntToStr(iTotAgente);
            Writeln(fArquivo,sLinha);
            iTotAgente  :=  0;
            sLinha      :=  '';
          end;
          if iTotGeral > 0 then begin
            sLinha      :=  ';Total GERAL;' + IntToStr(iTotGeral);
            iTotGeral   :=  0;
            Writeln(fArquivo,sLinha);
          end;
        end;
      end;
    end;
    dm.qryGeral.Close;
    dm.qryGeral.SQL.Clear;

    Screen.Cursor := crDefault;

    CloseFile(fArquivo);

    MessageDlg('Exportação concluída!',mtInformation,[mbOK],0);

  Except
    on  E : Exception do
      ShowMessage('Classe: '+ e.ClassName + chr(13) + 'Mensagem: '+ e.Message);
  end;
end;

procedure TfrmExtrato.actFechamentoExportarEntregasExecute(
  Sender: TObject);
var
  sArquivo, sMess: String;
begin
  if tbExtrato.IsEmpty then
    Exit;
  uGlobais.TipoExportacao :=  -1;
  if not Assigned(frmTipoExportacao) then
    frmTipoExportacao := TfrmTipoExportacao.Create(Application);
  frmTipoExportacao.cxRadioGroup1.Properties.Items[1].Caption := 'Pelo Agente (' + tbExtratoDES_AGENTE.AsString + ')';
  frmTipoExportacao.cxRadioGroup1.Properties.Items[2].Caption := 'Pelo Entregador (' + tbExtratoDES_ENTREGADOR.AsString + ')';
  if frmTipoExportacao.ShowModal = mrCancel then Exit;
  frmTipoExportacao.Free;
  frmTipoExportacao :=  Nil;
  if uGlobais.TipoExportacao = -1 then Exit;
  SaveDialog.Filter := 'Arquivo Valores Separados por Virgulas (*.csv) |*.csv';
  SaveDialog.DefaultExt := 'csv';
  if SaveDialog.Execute then begin
    sArquivo  :=  SaveDialog.FileName;
    if FileExists(sArquivo) then begin
      sMess :=  'Arquivo ' + sArquivo + ' já existe! Deseja sobrescrever este arquivo?';
      if Application.MessageBox(pChar(sMess),'Atenção', MB_YESNO + MB_ICONQUESTION) = IDNO then begin
        Exit;
      end
      else begin
        DeleteFile(sArquivo);
      end;
    end;
    ExportarEntregas(sArquivo);
  end;
end;

function TfrmExtrato.Validar(): Boolean;
begin
  Result  :=  False;
  if TUtil.Empty(cxDatInicial.Text) then begin
    MessageDlg('Informe a data INICIAL do período!',mtWarning,[mbOK],0);
    cxDatInicial.SetFocus;
    Exit;
  end;
  if TUtil.Empty(cxDatFinal.Text) then begin
    MessageDlg('Informe a data FINAL do período!',mtWarning,[mbOK],0);
    cxDatFinal.SetFocus;
    Exit;
  end;
  if cxDatInicial.Date > cxDatFinal.Date then begin
    MessageDlg('A data INICIAL do período não pode ser maior que a data FINAL!',mtWarning,[mbOK],0);
    cxDatInicial.SetFocus;
    Exit;
  end;
  if TUtil.Empty(cxInicioAbastecimento.Text) then begin
    if not (TUtil.Empty(cxFinalAbastecimento.Text)) then begin
      MessageDlg('Informe a data INICIAL do período de Abastecimento!',mtWarning,[mbOK],0);
      cxInicioAbastecimento.SetFocus;
      Exit;
    end;
  end;
  if TUtil.Empty(cxFinalAbastecimento.Text) then begin
    if not (TUtil.Empty(cxInicioAbastecimento.Text)) then begin
      MessageDlg('Informe a data FINAL do período de Abastecimento!',mtWarning,[mbOK],0);
      cxFinalAbastecimento.SetFocus;
      Exit;
    end;
  end;
  if (not (TUtil.Empty(cxInicioAbastecimento.Text))) and (not (TUtil.Empty(cxFinalAbastecimento.Text))) then begin
    if cxInicioAbastecimento.Date > cxFinalAbastecimento.Date then begin
      MessageDlg('A data INICIAL do período de abastecimento não pode ser maior que a data FINAL!',mtWarning,[mbOK],0);
      cxInicioAbastecimento.SetFocus;
      Exit;
    end;
  end;
  if not (TUtil.Empty(cxCodigoAgente.Text)) then begin
    if StrToInt(cxCodigoAgente.Text) > 0 then begin
      if not (agente.getObject(cxCodigoAgente.Text,'CODIGO')) then begin
        MessageDlg('Código de Agente Não Cadastrado!',mtWarning,[mbOK],0);
        cxCodigoAgente.SetFocus;
        Exit;
      end;
    end;
  end;
  Result  :=  True;
end;

procedure TfrmExtrato.LimpaRecord;
begin
  with RegExtrato do begin
    _codigoagente         :=  0;
    _nomeagente           :=  '';
    _codigoentregador     :=  0;
    _nomeentregador       :=  '';
    _volumes              :=  0;
    _entrega              :=  0;
    _verbatotal           :=  0;
    _credito              :=  0;
    _debito               :=  0;
    _restricao            :=  0;
    _subtotal             :=  0;
    _qtdvolumesextra      :=  0;
    _valvolumesextra      :=  0;
    _total                :=  0;
    _datapagamento        :=  0;
    _valorabastecimento   :=  0;
    _inicioabastecimento  :=  0;
    _finalabastecimento   :=  0;
    _totaldescontos       :=  0;
    _totalcreditos        :=  0;
    _totalgeral           :=  0;
    _datafechamento       :=  0;
    _1diaatraso           :=  0;
    _2diasatraso          :=  0;
    _3diasatraso          :=  0;
  end;

end;


procedure TfrmExtrato.Calculo;
var
  lLista            : TStringList;
  sFiltro, sAgente  : String;
  iConta            : Integer;
  bFlag             : Boolean;
begin
  try
    lLista  :=  TStringList.Create();
    lLista.Clear;

    if not (TUtil.Empty(cxCodigoAgente.Text)) then begin
      if entregador.getObject(cxCodigoAgente.Text, 'AGENTE') then begin
        if dm.qryGetObject.Active then begin
          dm.qryGetObject.First;
          while not (dm.qryGetObject.Eof) do begin
            //if dm.qryGetObject.FieldByName('COD_STATUS').AsInteger = 1 then begin
              lLista.Add(dm.qryGetObject.FieldByName('COD_ENTREGADOR').AsString);
//            end;
            dm.qryGetObject.Next;
          end;
        end
        else begin
          lLista.Add(entregador.Codigo);
        end;
      end;
    end
    else begin
      if entregador.getObjects then begin
        dm.qryGetObject.First;
        while not (dm.qryGetObject.Eof) do begin
        //  if dm.qryGetObject.FieldByName('COD_STATUS').AsInteger = 1 then begin
            lLista.Add(dm.qryGetObject.FieldByName('COD_ENTREGADOR').AsString);
        //  end;
          dm.qryGetObject.Next;
        end;
      end;
    end;

  iConta  :=  0;

  if cxRadioGroup1.ItemIndex = 0 then begin
    sFiltro :=  'BAIXA';
  end
  else if cxRadioGroup1.ItemIndex = 1 then begin
    sFiltro :=  'ATRIBUICAO';
  end
  else begin
    sFiltro :=  'PAGAMENTO';
  end;

  LimpaRecord;

  if tbExtrato.Active then
    tbExtrato.Close;
  tbExtrato.Open;

  bFlag :=  False;
  sAgente :=  '';

  cxGrid1DBBandedTableView1.OptionsView.NoDataToDisplayInfoText :=  '<Atualizando o Grid. Aguarde...>';
  cxGrid1.Refresh;

  cxProgressBar.Clear;
  cxProgressBar.Visible :=  True;

  for iConta := 0 to lLista.Count - 1 do begin

    LimpaRecord;

    // localiza os dados do entregador e agente

    if entregador.getObject(lLista[iConta],'CODIGO') then begin
      RegExtrato._codigoentregador  :=  StrToInt(entregador.Codigo);
      RegExtrato._nomeentregador    :=  entregador.Fantasia;
      RegExtrato._codigoagente      :=  entregador.Agente;
      if agente.getObject(IntToStr(RegExtrato._codigoagente),'CODIGO') then begin
        RegExtrato._nomeagente  :=  agente.Fantasia;
      end
      else begin
        RegExtrato._nomeagente  :=  'AGENTE ' + IntToStr(RegExtrato._codigoagente);
      end;
    end
    else begin
      RegExtrato._codigoentregador  :=  StrToInt(entregador.Codigo);
      RegExtrato._nomeentregador    :=  'ENTREGADOR ' + entregador.Codigo;
      RegExtrato._codigoagente      :=  0;
      RegExtrato._nomeagente        :=  'AGENTE 0';
    end;

    //totaliza as entregas baixadas no período especificado

    if entrega.TotalPeriodo(cxDatInicial.Text,cxDatFinal.Text,'',lLista[iconta],sFiltro) then begin
      RegExtrato._volumes         :=  dm.qryGeral.FieldByName('VOLUMES').AsInteger;
      RegExtrato._entrega         :=  dm.qryGeral.FieldByName('ENTREGAS').AsInteger;
      RegExtrato._verbatotal      :=  dm.qryGeral.FieldByName('VERBA').AsFloat;
      RegExtrato._qtdvolumesextra :=  dm.qryGeral.FieldByName('EXTRA').AsFloat;
      RegExtrato._valvolumesextra :=  dm.qryGeral.FieldByName('VALOR').AsFloat;
    end
    else begin
      RegExtrato._volumes         :=  0;
      RegExtrato._entrega         :=  0;
      RegExtrato._verbatotal      :=  0;
      RegExtrato._qtdvolumesextra :=  0;
      RegExtrato._valvolumesextra :=  0;
    end;

    //verifica se período de abastecimento foi informado. Se foi, totaliza o período informado.

    if not (TUtil.Empty(cxInicioAbastecimento.Text)) then begin
      RegExtrato._inicioabastecimento :=  cxInicioAbastecimento.Date;
      RegExtrato._finalabastecimento  :=  cxFinalAbastecimento.Date;
      RegExtrato._valorabastecimento  :=  0 - (abastecimento.TotalPeriodo(cxInicioAbastecimento.Text,cxFinalAbastecimento.Text,
                                                                          IntToStr(RegExtrato._codigoentregador)));
    end
    else begin
      RegExtrato._inicioabastecimento :=  0;
      RegExtrato._finalabastecimento  :=  0;
      RegExtrato._valorabastecimento  :=  0;
    end;

    //totaliza os valores de crédito

    RegExtrato._credito   :=  lancamento.Totalizacao(cxDatInicial.Text,cxDatFinal.Text,lLista[iconta],'CREDITO');

    //totaliza os valores de débito

    RegExtrato._debito    :=  ( 0 - lancamento.Totalizacao(cxDatInicial.Text,cxDatFinal.Text,lLista[iconta],'DEBITO'));

    //calcula os dias de atraso

    RegExtrato._1diaatraso  :=  entrega.PrazoExtrato(cxDatInicial.Text,cxDatFinal.Text,IntToStr(RegExtrato._codigoentregador),'1');
    RegExtrato._2diasatraso  :=  entrega.PrazoExtrato(cxDatInicial.Text,cxDatFinal.Text,IntToStr(RegExtrato._codigoentregador),'2');
    RegExtrato._3diasatraso  :=  entrega.PrazoExtrato(cxDatInicial.Text,cxDatFinal.Text,IntToStr(RegExtrato._codigoentregador),'3');

    //apanha o valor a debitar da restrição do agente ou do entregador caso seja solicitada

    if cxIncluirRestricoes.Checked then begin
      if restricao.getObject(IntToStr(RegExtrato._codigoentregador),'ENTREGADOR') then begin
        RegExtrato._restricao := (0 - restricao.Debitar);
      end
      else if restricao.getObject(IntToStr(RegExtrato._codigoentregador),'AGENTE') then begin
        if Pos(IntToStr(RegExtrato._codigoagente),sAgente) = 0 then begin
          RegExtrato._restricao := (0 - restricao.Debitar);
          if not (TUtil.Empty(sAgente)) then begin
            sAgente :=  sAgente + ',';
          end;
          sAgente :=  sAgente + Trim(IntToStr(RegExtrato._codigoagente));
        end
        else begin
          RegExtrato._restricao :=  0;
        end;
      end
      else begin
        RegExtrato._restricao :=  0;
      end;
    end
    else begin
      RegExtrato._restricao :=  0;
    end;
    RegExtrato._subtotal        :=  RegExtrato._verbatotal + RegExtrato._credito + RegExtrato._debito + RegExtrato._restricao +
                                    RegExtrato._valorabastecimento;
    RegExtrato._total           :=  RegExtrato._subtotal + RegExtrato._valvolumesextra;
    RegExtrato._totaldescontos  :=  RegExtrato._debito + RegExtrato._restricao + RegExtrato._valorabastecimento;
    RegExtrato._totalcreditos   :=  RegExtrato._verbatotal + RegExtrato._credito + RegExtrato._valvolumesextra;
    RegExtrato._totalgeral      :=  RegExtrato._totalcreditos + RegExtrato._totaldescontos;

    if RegExtrato._totaldescontos = 0 then begin
      if RegExtrato._totalcreditos = 0 then begin
        if RegExtrato._entrega =  0 then begin
          bFlag :=  False;
        end
        else begin
          bFlag := True;
        end
      end
      else begin
        bFlag :=  True;
      end;
    end
    else begin
      bFlag :=  True;
    end;
    if cxSemEntregas.Checked then begin
      if RegExtrato._entrega = 0 then begin
        bFlag :=  False;
      end;
    end;
    if bflag then begin
      tbExtrato.IsLoading                 :=  True;
      tbExtrato.Insert;
      tbExtratoCOD_AGENTE.Value           :=  RegExtrato._codigoagente;
      tbExtratoDES_AGENTE.Value           :=  RegExtrato._nomeagente;
      tbExtratoCOD_ENTREGADOR.Value       :=  RegExtrato._codigoentregador;
      tbExtratoDES_ENTREGADOR.Value       :=  RegExtrato._nomeentregador;
      tbExtratoQTD_VOLUMES.Value          :=  RegExtrato._volumes;
      tbExtratoQTD_ENTREGA.Value          :=  RegExtrato._entrega;
      if RegExtrato._entrega > 0 then begin
        tbExtratoVAL_VERBA.Value  :=  RegExtrato._verbatotal / RegExtrato._entrega;
      end
      else begin
        tbExtratoVAL_VERBA.Value  :=  0;
      end;
      tbExtratoVAL_VERBA_TOTAL.Value      :=  RegExtrato._verbatotal;
      tbExtratoVAL_CREDITO.Value          :=  RegExtrato._credito;
      tbExtratoVAL_DEBITO.Value           :=  RegExtrato._debito;
      tbExtratoVAL_RESTRICAO.Value        :=  RegExtrato._restricao;
      tbExtratoVAL_SUB_TOTAL.Value        :=  RegExtrato._subtotal;
      tbExtratoQTD_VOLUMES_EXTRA.Value    :=  RegExtrato._qtdvolumesextra;
      tbExtratoVAL_VOLUMES_EXTRA.Value    :=  RegExtrato._valvolumesextra;
      tbExtratoVAL_TOTAL.Value            :=  RegExtrato._total;
      tbExtratoVAL_ABASTECIMENTO.Value    :=  RegExtrato._valorabastecimento;
      tbExtratoVAL_TOTAL_DESCONTOS.Value  :=  RegExtrato._totaldescontos;
      tbExtratoVAL_TOTAL_CREDITOS.Value   :=  RegExtrato._totalcreditos;
      tbExtratoVAL_TOTAL_GERAL.Value      :=  RegExtrato._totalgeral;
      tbExtratoQTD_1_DIA.Value            :=  RegExtrato._1diaatraso;
      tbExtratoQTD_2_DIAS.Value           :=  RegExtrato._2diasatraso;
      tbExtratoQTD_MAIS_DIAS.Value        :=  RegExtrato._3diasatraso;
      tbExtrato.Post;
      tbExtrato.IsLoading                 :=  False;      
    end;

    cxProgressBar.Position := (iConta / lLista.Count) * 100;
    cxProgressBar.Refresh;

  end;
  cxGrid1DBBandedTableView1.OptionsView.NoDataToDisplayInfoText := '<Nenhuma Informação Disponível>';
  cxProgressBar.Visible :=  False;

  Except
    on E : Exception do begin
      cxProgressBar.Visible :=  False;
      ShowMessage('Classe: '+ e.ClassName + chr(13) + 'Mensagem: '+ e.Message);
    end;
  end;
end;


procedure TfrmExtrato.cxRadioGroup2PropertiesChange(Sender: TObject);
begin
  if cxRadioGroup2.ItemIndex = 1 then begin
    actFechamentoAjustarRestricao.Enabled   :=  False;
    actFechamentoFechar.Enabled             :=  False;
    actFechamentoCancelarFechamento.Enabled :=  True;
  end
  else begin
    actFechamentoAjustarRestricao.Enabled   :=  True;
    actFechamentoFechar.Enabled             :=  True;
    actFechamentoCancelarFechamento.Enabled :=  False;
    cxRadioGroup1.ItemIndex                 :=  0;
  end;
end;

procedure TfrmExtrato.actFechamentoAjustarRestricaoExecute(
  Sender: TObject);
var
  sTitulo, sValor, sVal : String;
  dValor, dValor1       : Double;
begin
  cxGrid1DBBandedTableView1VAL_RESTRICAO.FocusWithSelection;

  sTitulo :=  'Novo valor da Restrição do Agente/Antregador ' + VarToStr(cxGrid1DBBandedTableView1.Columns[0].EditValue) + '-' +
                                                                VarToStr(cxGrid1DBBandedTableView1.Columns[1].EditValue) + '/' +
                                                                VarToStr(cxGrid1DBBandedTableView1.Columns[2].EditValue) + '-' +
                                                                VarToStr(cxGrid1DBBandedTableView1.Columns[3].EditValue);
  sValor := InputBox('Ajuste Restrição',sTitulo,'0');
  if TUtil.Empty(sValor)then begin
    Exit;
  end;
  sVal  :=  TUtil.ReplaceStr(sValor,',','.');
  if not (Tutil.ENumero(sVal)) then begin
    MessageDlg('Informe o valor numérico apenas!', mtWarning, [mbOK],0);
    Exit;
  end;
  if MessageDlg('Deseja realmente alterar esta restrição?', mtConfirmation, [mbYes,mbNo], 0) = IDNO then begin
    Exit;
  end;
  dValor  :=  0;
  dValor1 :=  0;
  dValor1 :=  StrToFloat(sValor);
  if not (tbExtrato.IsLoading) then begin
    if dValor1 > 0 then begin
      dValor  :=  (0 - dValor1);
      dValor1  :=  dValor;
    end;
    tbExtrato.Edit;
    tbExtratoVAL_RESTRICAO.Value        :=  dValor1;
    tbExtratoVAL_SUB_TOTAL.Value        :=  tbExtratoVAL_VERBA_TOTAL.Value + tbExtratoVAL_CREDITO.Value +
                                            tbExtratoVAL_DEBITO.Value + dValor1 +
                                            tbExtratoVAL_ABASTECIMENTO.Value;
    tbExtratoVAL_TOTAL.Value            :=  tbExtratoVAL_SUB_TOTAL.Value + tbExtratoVAL_VOLUMES_EXTRA.Value;
    tbExtratoVAL_TOTAL_DESCONTOS.Value  :=  tbExtratoVAL_DEBITO.Value + dValor1 +
                                            tbExtratoVAL_ABASTECIMENTO.Value;
    tbExtratoVAL_TOTAL_CREDITOS.Value   :=  tbExtratoVAL_VERBA_TOTAL.Value + tbExtratoVAL_CREDITO.Value +
                                            tbExtratoVAL_VOLUMES_EXTRA.Value;
    tbExtratoVAL_TOTAL_GERAL.Value      :=  tbExtratoVAL_TOTAL_CREDITOS.Value + tbExtratoVAL_TOTAL_DESCONTOS.Value;
    tbExtrato.Post;
    if restricao.getObject(VarToStr(cxGrid1DBBandedTableView1.Columns[1].EditValue),'ENTREGADOR') then begin
      restricao.Debitar :=  ABS(dValor1);
      if not (restricao.Update()) then begin
        MessageDlg('Não foi possível salvar o valor a debitar na restrição deste entregador!',mtWarning,[mbOK],0);
      end;
    end
    else if restricao.getObject(VarToStr(cxGrid1DBBandedTableView1.Columns[25].EditValue),'AGENTE') then begin
      restricao.Debitar :=  ABS(dValor1);
      if not (restricao.Update()) then begin
        MessageDlg('Não foi possível salvar o valor a debitar na restrição deste agente!',mtWarning,[mbOK],0);
      end;
    end;
  end;
end;

procedure TfrmExtrato.actFechamentoCancelarFechamentoExecute(
  Sender: TObject);
begin
  if tbExtrato.IsEmpty then begin
    Exit;
  end;
  if MessageDlg('Confirma o Cancelamnto do Fechamento deste Extrato?',mtConfirmation,[mbYes,mbNo],0) = mrNo then begin
    Exit;
  end;

  Screen.Cursor := crHourGlass;

  tbExtrato.First;
  while not (tbExtrato.Eof) do begin
    // Cancela fechamento das entregas
    if not (entrega.Fechar(tbExtratoDAT_INICIO.AsString,tbExtratoDAT_TERMINO.AsString,tbExtratoDAT_PAGO.AsString,
                           tbExtratoNUM_EXTRATO.AsString,tbExtratoCOD_AGENTE.AsString,tbExtratoCOD_ENTREGADOR.AsString,
                           'BAIXA','CANCELAR')) then begin
      MessageDlg('Erro Cancelamento de Fechamento: ENTREGAS; Agente: ' + tbExtratoCOD_AGENTE.AsString + ' / Entregador: ' +
                 tbExtratoCOD_ENTREGADOR.AsString, mtWarning, [mbOK],0);
      Screen.Cursor := crDefault;
      Exit;
    end;
    // Cancela fechameto dos extravios
    if not (TUtil.Empty(tbExtratoDAT_INICIO_ABASTECIMENTO.AsString)) then begin
      if not (abastecimento.Fechar(tbExtratoDAT_INICIO_ABASTECIMENTO.AsString,tbExtratoDAT_FINAL_ABASTECIMENTO.AsString,
                                   tbExtratoCOD_ENTREGADOR.AsString,'0')) then begin
        MessageDlg('Erro Cancelamento Fechamento: ENTREGAS; Agente: ' + tbExtratoCOD_AGENTE.AsString + ' / Entregador: ' +
                   tbExtratoCOD_ENTREGADOR.AsString, mtWarning, [mbOK],0);
        Screen.Cursor := crDefault;
        Exit;
      end;
    end;
    // Retorna valores das restrições
    if tbExtratoVAL_RESTRICAO.Value < 0 then begin
      if restricao.getObject(tbExtratoCOD_ENTREGADOR.AsString,'ENTREGADOR') then begin
        restricao.Valor :=  restricao.Valor + ABS(tbExtratoVAL_RESTRICAO.Value);
        restricao.Pago  :=  restricao.Pago + tbExtratoVAL_RESTRICAO.Value;
        restricao.Debitar :=  ABS(tbExtratoVAL_RESTRICAO.Value);
        if not (restricao.Update) then begin
          MessageDlg('Erro Cancelamento do Fechamento: RESTRIÇÃO; Agente: ' + tbExtratoCOD_AGENTE.AsString + ' / Entregador: ' +
                     tbExtratoCOD_ENTREGADOR.AsString, mtWarning, [mbOK],0);
          Screen.Cursor := crDefault;
          Exit;
        end;
      end
      else begin
        if restricao.getObject(tbExtratoCOD_AGENTE.AsString,'AGENTE') then begin
          restricao.Valor   :=  restricao.Valor + ABS(tbExtratoVAL_RESTRICAO.Value);
          restricao.Pago    :=  restricao.Pago + tbExtratoVAL_RESTRICAO.Value;
          restricao.Debitar :=  ABS(tbExtratoVAL_RESTRICAO.Value);
          if not (restricao.Update) then begin
            MessageDlg('Erro Cancelamento Fechamento: RESTRIÇÃO; Agente: ' + tbExtratoCOD_AGENTE.AsString + ' / Entregador: ' +
                       tbExtratoCOD_ENTREGADOR.AsString, mtWarning, [mbOK],0);
            Screen.Cursor := crDefault;
            Exit;
          end;
        end;
      end;
    end;
    // Cancela fechamento de lançamentos de débitos e créditos
    if not (lancamento.Fechar(tbExtratoDAT_INICIO.AsString,tbExtratoDAT_TERMINO.AsString,tbExtratoDAT_PAGO.AsString,
                              tbExtratoNUM_EXTRATO.AsString,tbExtratoCOD_ENTREGADOR.AsString,'CANCELAR')) then begin
      MessageDlg('Erro Cancelamento Fechamento: LANÇAMENTO; Agente: ' + tbExtratoCOD_AGENTE.AsString + ' / Entregador: ' +
                 tbExtratoCOD_ENTREGADOR.AsString, mtWarning, [mbOK],0);
      Screen.Cursor := crDefault;
      Exit;
    end;

    //Excluir planilha de crédito
    planilha.Extrato          :=  tbExtratoNUM_EXTRATO.AsString;
    if not (planilha.Delete('EXTRATO'))then begin
      MessageDlg('Erro Cancelamento Fechamento: PLANILHA: Agente: ' + tbExtratoCOD_AGENTE.AsString + ' / Entregador: ' +
                 tbExtratoCOD_ENTREGADOR.AsString, mtWarning, [mbOK],0);
      Screen.Cursor := crDefault;
      Exit;
    end;
    
    // Excluir registro do extrato
    extrato.CodigoAgente      :=  tbExtratoCOD_AGENTE.Value;
    extrato.CodigoEntregador  :=  tbExtratoCOD_ENTREGADOR.Value;
    extrato.DataBase          :=  tbExtratoDAT_TERMINO.Value;

    if not (extrato.Delete('BASE1'))then begin
      MessageDlg('Erro Fechamento: EXTRATO; Agente: ' + tbExtratoCOD_AGENTE.AsString + ' / Entregador: ' +
                 tbExtratoCOD_ENTREGADOR.AsString, mtWarning, [mbOK],0);
      Screen.Cursor := crDefault;
      Exit;
    end;

    tbExtrato.Next;

  end;

  Screen.Cursor := crDefault;

  MessageDlg('Fechamento do Extrato Cancelado!',mtInformation,[mbOK],0);

  tbExtrato.Close;

  TUtil.LimparFields(Self);

  cxDatInicial.SetFocus;


end;

procedure TfrmExtrato.cxGroupBox2Resize(Sender: TObject);
begin
  cxGrid1.Realign;
end;

procedure TfrmExtrato.cxRadioGroup1PropertiesChange(Sender: TObject);
begin
  if cxRadioGroup1.ItemIndex = 2 then begin
    cxRadioGroup2.ItemIndex := 1;
  end
  else begin
    cxRadioGroup2.ItemIndex := 0;
  end;
end;

procedure TfrmExtrato.ListaAgente;
var
  sId : String;
begin
  if Pos(entregador.Operacao,'IU') = 0 then begin
    Exit;
  end;
  sId         :=  '';
  Screen.Cursor :=  crHourGlass;
  sId           :=  Trim(cxCodigoAgente.Text);
  with dm.qryPesquisa do begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT COD_AGENTE AS "Código", NOM_FANTASIA AS "Nome" ' +
                'FROM TBAGENTES ';
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
  frmListaApoio.Caption                                 :=  'Agentes';
  Screen.Cursor                                         :=  crDefault;
  if frmListaApoio.ShowModal = mrOk then begin
    cxCodigoAgente.Text     :=  dm.qryPesquisa.Fields[0].AsString;
    cxCodigoAgente.Refresh;
    cxNomeAgente.Text :=  dm.qryPesquisa.Fields[1].AsString;
    cxNomeAgente.Refresh;
  end;
  dm.tbApoio.Close;
  FreeAndNil(frmListaApoio);
end;


end.
