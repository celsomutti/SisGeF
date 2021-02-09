unit ufrmPrazosEntrega;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter,
  cxPC, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, dxmdaset, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxGridBandedTableView,
  cxGridDBBandedTableView, cxContainer, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxLabel, ActnList, Menus, StdCtrls, cxButtons,
  clEntrega, cxGridExportLink, ShellAPI, cxNavigator,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxImage, Vcl.ExtCtrls, cxButtonEdit,
  clCliente, clAgentes, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxBarBuiltInMenu,
  System.Actions, clAcessos, clConexao, dxDateRanges, cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TfrmPrazosEntrega = class(TForm)
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxGrid1: TcxGrid;
    tbPrazos: TdxMemData;
    tbPrazosDAT_BAIXA: TDateField;
    tbPrazosQTD_ENTREGAS_0: TIntegerField;
    tbPrazosPER_ENTREGAS_0: TFloatField;
    tbPrazosQTD_ENTREGAS_1: TIntegerField;
    tbPrazosPER_ENTREGAS_1: TFloatField;
    tbPrazosQTD_ENTREGAS_2: TIntegerField;
    tbPrazosPER_ENTREGAS_2: TFloatField;
    tbPrazosQTD_ENTREGAS_3: TIntegerField;
    tbPrazosPER_ENTREGAS_3: TFloatField;
    tbPrazosQTD_ENTREGAS: TIntegerField;
    tbPrazosQTD_FORA_PRAZO: TIntegerField;
    tbPrazosPER_FORA_PRAZO: TFloatField;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1Level1: TcxGridLevel;
    ds: TDataSource;
    cxGrid1DBBandedTableView1DAT_BAIXA: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1QTD_ENTREGAS: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1QTD_ENTREGAS_0: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1PER_ENTREGAS_0: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1QTD_ENTREGAS_1: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1PER_ENTREGAS_1: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1QTD_ENTREGAS_2: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1PER_ENTREGAS_2: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1QTD_ENTREGAS_3: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1PER_ENTREGAS_3: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1QTD_FORA_PRAZO: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1PER_FORA_PRAZO: TcxGridDBBandedColumn;
    cxLabel1: TcxLabel;
    cxDatInicial: TcxDateEdit;
    cxLabel2: TcxLabel;
    cxDatFinal: TcxDateEdit;
    aclPrazos: TActionList;
    actPrazosExecutar: TAction;
    actPrazosSair: TAction;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    tbPrazosDES_GRUPO: TStringField;
    cxGrid1DBBandedTableView1DES_GRUPO: TcxGridDBBandedColumn;
    actPrazosExportar: TAction;
    cxButton3: TcxButton;
    SaveDialog: TSaveDialog;
    cxLabel3: TcxLabel;
    cxCliente: TcxButtonEdit;
    cxLabel4: TcxLabel;
    cxNomeCliente: TcxTextEdit;
    actPrazosApoio: TAction;
    cxLabel5: TcxLabel;
    cxAgente: TcxButtonEdit;
    cxNomeAgente: TcxTextEdit;
    cxLabel27: TcxLabel;
    procedure actPrazosExecutarExecute(Sender: TObject);
    function Validar(): Boolean;
    procedure PopulaPrazos;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actPrazosExportarExecute(Sender: TObject);
    procedure actPrazosSairExecute(Sender: TObject);
    procedure cxClientePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure actPrazosApoioExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cxClietePropertiesChange(Sender: TObject);
    procedure cxAgentePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxAgentePropertiesChange(Sender: TObject);
  private
    { Private declarations }
    procedure ListaCliente;
    procedure ListaAgente;
  public
    { Public declarations }
  end;

var
  frmPrazosEntrega: TfrmPrazosEntrega;
  entrega: TEntrega;
  cliente: TCliente;
  agente: TAgente;
  acessos: TAcessos;
  conexao: TConexao;

implementation

{$R *.dfm}

uses udm, clUtil, ufrmPrincipal, ZDataset, DateUtils, ufrmListaApoio, uGlobais;

function TfrmPrazosEntrega.Validar(): Boolean;
begin
  Result := False;
  if TUtil.Empty(cxDatInicial.Text) then
  begin
    MessageDlg('Informe a data INICIAL do período!', mtWarning, [mbOK], 0);
    cxDatInicial.SetFocus;
    Exit;
  end;
  if TUtil.Empty(cxDatFinal.Text) then
  begin
    MessageDlg('Informe a data FINAL do período!', mtWarning, [mbOK], 0);
    cxDatFinal.SetFocus;
    Exit;
  end;
  if cxDatInicial.Date > cxDatFinal.Date then
  begin
    MessageDlg('A data INICIAL do período não pode ser maior que a data FINAL!',
      mtWarning, [mbOK], 0);
    cxDatInicial.SetFocus;
    Exit;
  end;
  if TUtil.Empty(cxCliente.Text) then
  begin
    cxCliente.Text := '0';
  end;
  if TUtil.Empty(cxAgente.Text) then
  begin
    cxAgente.Text := '0';
  end;
  Result := True;
end;

procedure TfrmPrazosEntrega.actPrazosApoioExecute(Sender: TObject);
begin
  if cxCliente.IsFocused then
  begin
    ListaCliente;
  end;
  if cxAgente.IsFocused then
  begin
    ListaAgente;
  end;

end;

procedure TfrmPrazosEntrega.actPrazosExecutarExecute(Sender: TObject);
begin
  if not(Validar()) then
  begin
    Exit;
  end;

  PopulaPrazos;

  cxGrid1DBBandedTableView1.ViewData.Expand(True);
end;

procedure TfrmPrazosEntrega.PopulaPrazos;
var
  dtDataFinal, dtData: TDate;
  sGrupo: String;
  iEntregas, iEnt: Integer;
begin
  try

    if tbPrazos.Active then
      tbPrazos.Close;
    tbPrazos.Open;

    dtData := cxDatInicial.Date;
    dtDataFinal := cxDatFinal.Date;

    cxGrid1DBBandedTableView1.OptionsView.NoDataToDisplayInfoText :=
      '<Atualizando o Grid. Isso pode demorar alguns minutos.Aguarde...>';
    cxGrid1.Refresh;
    Screen.Cursor := crHourGlass;

    sGrupo := 'Período de ' + cxDatInicial.Text + ' e ' + cxDatFinal.Text;

    while dtData <= dtDataFinal do
    begin
      iEntregas := 0;
      iEnt := 0;
      cxLabel3.Caption := 'Processando o dia ' + DateToStr(dtData) + '...';
      cxLabel3.Refresh;
      entrega.cliente := StrToInt(cxCliente.Text);
      entrega.agente := StrToInt(cxAgente.Text);
      if entrega.Prazo(DateToStr(dtData), '-1') then
      begin
        tbPrazos.Insert;
        tbPrazosDES_GRUPO.Value := sGrupo;
        tbPrazosDAT_BAIXA.Value := dm.qryGeral.FieldByName('DAT_BAIXA')
          .AsDateTime;
        iEntregas := dm.qryGeral.FieldByName('ENTREGAS').AsInteger;
        tbPrazosQTD_ENTREGAS.Value := iEntregas;
        if entrega.Prazo(DateToStr(dtData), '0') then
        begin
          iEnt := dm.qryGeral.FieldByName('ENTREGAS').AsInteger;
          tbPrazosQTD_ENTREGAS_0.Value := iEnt;
          tbPrazosPER_ENTREGAS_0.Value := (iEnt / iEntregas) * 100;
        end
        else
        begin
          tbPrazosQTD_ENTREGAS_0.Value := 0;
          tbPrazosPER_ENTREGAS_0.Value := 0;
        end;
        if entrega.Prazo(DateToStr(dtData), '1') then
        begin
          iEnt := dm.qryGeral.FieldByName('ENTREGAS').AsInteger;
          tbPrazosQTD_ENTREGAS_1.Value := iEnt;
          tbPrazosPER_ENTREGAS_1.Value := (iEnt / iEntregas) * 100;
        end
        else
        begin
          tbPrazosQTD_ENTREGAS_1.Value := 0;
          tbPrazosPER_ENTREGAS_1.Value := 0;
        end;
        if entrega.Prazo(DateToStr(dtData), '2') then
        begin
          iEnt := dm.qryGeral.FieldByName('ENTREGAS').AsInteger;
          tbPrazosQTD_ENTREGAS_2.Value := iEnt;
          tbPrazosPER_ENTREGAS_2.Value := (iEnt / iEntregas) * 100;
        end
        else
        begin
          tbPrazosQTD_ENTREGAS_2.Value := 0;
          tbPrazosPER_ENTREGAS_2.Value := 0;
        end;
        if entrega.Prazo(DateToStr(dtData), '3') then
        begin
          iEnt := dm.qryGeral.FieldByName('ENTREGAS').AsInteger;
          tbPrazosQTD_ENTREGAS_3.Value := iEnt;
          tbPrazosPER_ENTREGAS_3.Value := (iEnt / iEntregas) * 100;
        end
        else
        begin
          tbPrazosQTD_ENTREGAS_3.Value := 0;
          tbPrazosPER_ENTREGAS_3.Value := 0;
        end;
        tbPrazosQTD_FORA_PRAZO.Value := tbPrazosQTD_ENTREGAS_1.Value +
          tbPrazosQTD_ENTREGAS_2.Value + tbPrazosQTD_ENTREGAS_3.Value;
        tbPrazosPER_FORA_PRAZO.Value :=
          (tbPrazosQTD_FORA_PRAZO.Value / tbPrazosQTD_ENTREGAS.Value) * 100;
        tbPrazos.Post;
      end;
      dtData := dtData + 1;
    end;
    dm.qryGeral.Close;
    dm.qryGeral.SQL.Clear;
    if not(tbPrazos.IsEmpty) then
      tbPrazos.First;

    cxGrid1DBBandedTableView1.OptionsView.NoDataToDisplayInfoText :=
      '<Nenhuma Informação Disponível>';
    Screen.Cursor := crDefault;
    cxLabel3.Caption := '';

  Except
    on E: Exception do
    begin
      Screen.Cursor := crDefault;
      cxLabel3.Caption := '';
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;

end;

procedure TfrmPrazosEntrega.FormShow(Sender: TObject);
begin
  entrega := TEntrega.Create();
  cliente := TCliente.Create();
  agente := TAgente.Create();
  acessos := TAcessos.Create;
  conexao := TConexao.Create;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    actPrazosSairExecute(Sender);
    Exit;
  end;
  acessos.SetNivel(aclPrazos);
end;

procedure TfrmPrazosEntrega.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tbPrazos.Close;
  entrega.Free;
  cliente.Free;
  agente.Free;
  acessos.Free;
  conexao.Free;
  Action := caFree;
  frmPrazosEntrega := Nil;
end;

procedure TfrmPrazosEntrega.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then
  begin
    if cxGrid1.IsFocused then
    begin
      Exit;
    end;
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfrmPrazosEntrega.actPrazosExportarExecute(Sender: TObject);
var
  FileExt: String;
begin
  if not(tbPrazos.Active) then
  begin
    Exit;
  end;
  if tbPrazos.IsEmpty then
  begin
    Exit;
  end;
  SaveDialog.Filter :=
    'Excel (*.xls) |*.xls|XML (*.xml) |*.xml|Arquivo Texto (*.txt) |*.txt|Página Web (*.html)|*.html';
  SaveDialog.Title := 'Exportar Dados';
  SaveDialog.DefaultExt := 'xls';
  if SaveDialog.Execute then
  begin
    FileExt := LowerCase(ExtractFileExt(SaveDialog.FileName));
    if FileExt = '.xls' then
      ExportGridToExcel(SaveDialog.FileName, cxGrid1, False, True, False)
    else if FileExt = '.xml' then
      ExportGridToXML(SaveDialog.FileName, cxGrid1, False)
    else if FileExt = '.txt' then
      ExportGridToText(SaveDialog.FileName, cxGrid1, False)
    else if FileExt = '.html' then
      ExportGridToHTML(SaveDialog.FileName, cxGrid1, False);
    ShellExecute(Handle, 'open', pchar(SaveDialog.FileName), nil, nil, SW_SHOW);
  end;
end;

procedure TfrmPrazosEntrega.actPrazosSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrazosEntrega.cxClietePropertiesChange(Sender: TObject);
begin
  cxNomeCliente.Properties.ReadOnly := False;
  cxNomeCliente.Clear;
  cxNomeCliente.Properties.ReadOnly := True;
end;

procedure TfrmPrazosEntrega.cxAgentePropertiesChange(Sender: TObject);
begin
  cxNomeAgente.Clear;
end;

procedure TfrmPrazosEntrega.cxAgentePropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  cxNomeAgente.Properties.ReadOnly := False;
  if TUtil.Empty(cxAgente.Text) then
  begin
    cxAgente.Text := '0';
  end;
  if agente.getObject(cxAgente.Text, 'CODIGO') then
  begin
    cxNomeAgente.Text := agente.Fantasia;
  end
  else
  begin
    cxNomeAgente.Text := '- - -';
  end;
  cxNomeAgente.Properties.ReadOnly := True;
end;

procedure TfrmPrazosEntrega.cxClientePropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  cxNomeCliente.Properties.ReadOnly := False;
  if TUtil.Empty(cxCliente.Text) then
  begin
    cxCliente.Text := '0';
  end;
  if cliente.getObject(cxCliente.Text, 'CODIGO') then
  begin
    cxNomeCliente.Text := cliente.Razao;
  end
  else
  begin
    cxNomeCliente.Text := '- - -';
  end;
  cxNomeCliente.Properties.ReadOnly := True;
end;

procedure TfrmPrazosEntrega.ListaAgente;
var
  sCampo, sId, sResultado: String;
begin
  sId := '';
  sCampo := '';
  sResultado := '';
  Screen.Cursor := crHourGlass;
  if not(agente.getObjects()) then
    Exit;
  if dm.tbApoio.Active then
    dm.tbApoio.Close;
  dm.tbApoio.Open;
  dm.tbApoio.CreateFieldsFromDataSet(dm.qryGetObject);
  dm.tbApoio.LoadFromDataSet(dm.qryGetObject);
  if not(dm.tbApoio.IsEmpty) then
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
    cxAgente.Text := sId;
    sCampo := 'CODIGO';
    if agente.getObject(sId, sCampo) then
      cxNomeAgente.Text := agente.Fantasia
    else
      cxNomeAgente.Text := '- - -';
  end;
  dm.tbApoio.Close;
  frmListaApoio.Free;
end;

procedure TfrmPrazosEntrega.ListaCliente;
var
  sId, sResultado: String;
begin

  if not(cliente.getObjects()) then
  begin
    Application.MessageBox('Não existem clientes cadastrados!', 'Atenção!',
      MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  Screen.Cursor := crHourGlass;
  if dm.tbApoio.Active then
    dm.tbApoio.Close;
  dm.tbApoio.FieldDefs.Clear;
  dm.tbApoio.Open;
  dm.tbApoio.CreateFieldsFromDataSet(dm.qryGetObject);
  dm.tbApoio.LoadFromDataSet(dm.qryGetObject);
  if not(dm.tbApoio.IsEmpty) then
    dm.tbApoio.First;
  dm.qryGetObject.Close;
  dm.qryGetObject.SQL.Clear;
  Screen.Cursor := crDefault;
  if not Assigned(frmListaApoio) then
    frmListaApoio := TfrmListaApoio.Create(Application);
  frmListaApoio.ds.DataSet.Refresh;
  frmListaApoio.cxGrid1DBTableView1.DataController.CreateAllItems;
  frmListaApoio.cxGrid1DBTableView1.Columns[1].Caption := 'Código';
  frmListaApoio.cxGrid1DBTableView1.Columns[2].Caption := 'Nome';
  frmListaApoio.iColuna := 3;
  frmListaApoio.Caption := 'Clientes';
  frmListaApoio.ShowModal;
  if Resultado then
  begin
    sId := dm.tbApoio.FieldByName('COD_CLIENTE').AsString;
    cxCliente.Text := sId;
    cxNomeCliente.Properties.ReadOnly := False;
    if cliente.getObject(sId, 'CODIGO') then
    begin
      cxNomeCliente.Text := cliente.Razao;
    end
    else
    begin
      cxCliente.Text := '- - -';
    end;
  end;
  cxNomeCliente.Properties.ReadOnly := True;
  dm.tbApoio.Close;
  frmListaApoio.Free;
end;

end.
