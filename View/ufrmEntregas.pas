unit ufrmEntregas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxLabel, cxGroupBox, cxTextEdit,
  cxMaskEdit, cxButtonEdit, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxDropDownEdit, cxCalendar, cxMemo, clEntrega,
  clCodigosEntregadores, Vcl.Menus, Vcl.StdCtrls, cxButtons, Vcl.ActnList,
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, Datasnap.DBClient,
  Datasnap.Provider, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxListBox, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White,
  System.Actions, dxBarBuiltInMenu, cxPC, cxDBEdit, clAgentes, clCliente,
  clAcessos, clConexao, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, cxCurrencyEdit, cxGridExportLink, ShellAPI, cxDBLookupComboBox, dxActivityIndicator, Vcl.WinXCtrls;

type
  TfrmEntregas = class(TForm)
    cxLabel27: TcxLabel;
    aclEntregas: TActionList;
    actEntregaSair: TAction;
    cxGroupBox1: TcxGroupBox;
    ds: TDataSource;
    cxButton1: TcxButton;
    cxLabel1: TcxLabel;
    cxNossoNomero: TcxMemo;
    cxLabel2: TcxLabel;
    cxExpedicaoInicial: TcxDateEdit;
    cxExpedicaoFinal: TcxDateEdit;
    cxLabel3: TcxLabel;
    cxPrevisaoInicial: TcxDateEdit;
    cxPrevisaoFinal: TcxDateEdit;
    cxLabel4: TcxLabel;
    cxBaixaInicial: TcxDateEdit;
    cxBaixaFinal: TcxDateEdit;
    cxLabel5: TcxLabel;
    cxClientes: TcxMemo;
    actEntregaConsultar: TAction;
    cxButton2: TcxButton;
    actEntregaDetalhar: TAction;
    cxButton3: TcxButton;
    actEntregaApoio: TAction;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    cxGrid1DBTableView1Column4: TcxGridDBColumn;
    cxGrid1DBTableView1Column5: TcxGridDBColumn;
    cxGrid1DBTableView1Column6: TcxGridDBColumn;
    cxGrid1DBTableView1Column7: TcxGridDBColumn;
    cxGrid1DBTableView1Column8: TcxGridDBColumn;
    cxGrid1DBTableView1Column9: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxTabSheet2: TcxTabSheet;
    cxGroupBox2: TcxGroupBox;
    cxLabel6: TcxLabel;
    cxNossoNumero: TcxDBTextEdit;
    actEntregaRetornar: TAction;
    cxButton4: TcxButton;
    cxLabel7: TcxLabel;
    cxCodigoAdmCEP: TcxDBTextEdit;
    cxNomeAdmCEP: TcxTextEdit;
    cxLabel8: TcxLabel;
    cxCodigoEntregador: TcxDBTextEdit;
    cxNomeEntregador: TcxTextEdit;
    cxLabel9: TcxLabel;
    cxCodigoCliente: TcxDBTextEdit;
    cxNomeCliente: TcxTextEdit;
    cxLabel10: TcxLabel;
    cxNotaFiscal: TcxDBTextEdit;
    cxLabel11: TcxLabel;
    cxNomeConsumidor: TcxDBTextEdit;
    cxLabel12: TcxLabel;
    cxCEP: TcxDBTextEdit;
    cxLabel13: TcxLabel;
    cxEndereco: TcxDBTextEdit;
    cxLabel14: TcxLabel;
    cxComplemento: TcxDBTextEdit;
    cxLabel15: TcxLabel;
    cxBairro: TcxDBTextEdit;
    cxLabel16: TcxLabel;
    cxCidade: TcxDBTextEdit;
    cxLabel17: TcxLabel;
    cxTelefone: TcxDBTextEdit;
    cxLabel18: TcxLabel;
    cxExpedicao: TcxDBTextEdit;
    cxLabel19: TcxLabel;
    cxPrevisao: TcxDBTextEdit;
    cxLabel20: TcxLabel;
    cxDataEntrega: TcxDBTextEdit;
    cxLabel21: TcxLabel;
    cxAtribuicao: TcxDBTextEdit;
    cxLabel22: TcxLabel;
    cxVolume: TcxDBTextEdit;
    cxLabel23: TcxLabel;
    cxBaixa: TcxDBTextEdit;
    cxLabel24: TcxLabel;
    cxPeso: TcxDBTextEdit;
    cxLabel25: TcxLabel;
    cxOcorrencia: TcxComboBox;
    cxRastreamento: TcxDBMemo;
    actEntregaIncluirOcorrencia: TAction;
    cxButton5: TcxButton;
    cxLabel26: TcxLabel;
    cxAtraso: TcxDBTextEdit;
    actEntregaAtraso: TAction;
    cxButton6: TcxButton;
    actEntregaEntregador: TAction;
    cxButton7: TcxButton;
    cxGrid1DBTableView1Column10: TcxGridDBColumn;
    cxGrid1DBTableView1Column11: TcxGridDBColumn;
    cxGrid1DBTableView1Column12: TcxGridDBColumn;
    cxGrid1DBTableView1Column13: TcxGridDBColumn;
    cxGrid1DBTableView1Column14: TcxGridDBColumn;
    cxGrid1DBTableView1Column15: TcxGridDBColumn;
    cxGrid1DBTableView1Column16: TcxGridDBColumn;
    cxGrid1DBTableView1Column17: TcxGridDBColumn;
    cxGrid1DBTableView1Column18: TcxGridDBColumn;
    cxGrid1DBTableView1Column19: TcxGridDBColumn;
    SaveDialog: TSaveDialog;
    dsClientes: TDataSource;
    cxGrid1DBTableView1Column20: TcxGridDBColumn;
    cxGrid1DBTableView1Column21: TcxGridDBColumn;
    cxGrid1DBTableView1Column22: TcxGridDBColumn;
    cxGrid1DBTableView1Column23: TcxGridDBColumn;
    dsAgentes: TDataSource;
    dsEntregadores: TDataSource;
    ActivityIndicator1: TActivityIndicator;
    cxGrid1DBTableView1Column24: TcxGridDBColumn;
    cboClienteEmpresa: TcxComboBox;
    cxLabel28: TcxLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actEntregaSairExecute(Sender: TObject);
    procedure actEntregaConsultarExecute(Sender: TObject);
    procedure actEntregaDetalharExecute(Sender: TObject);
    procedure actEntregaRetornarExecute(Sender: TObject);
    procedure cxCodigoAdmCEPPropertiesChange(Sender: TObject);
    procedure cxCodigoEntregadorPropertiesChange(Sender: TObject);
    procedure cxCodigoClientePropertiesChange(Sender: TObject);
    procedure actEntregaIncluirOcorrenciaExecute(Sender: TObject);
    procedure actEntregaEntregadorExecute(Sender: TObject);
    procedure actEntregaAtrasoExecute(Sender: TObject);
    procedure cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGrid1DBTableView1NavigatorButtonsButtonClick(Sender: TObject; AButtonIndex: Integer; var ADone: Boolean);
  private
    { Private declarations }
    procedure Localizar;
    procedure ListaClientes;
    procedure ListaEntregador;
    procedure AlteraExtrato;
    procedure CheckPrivilage;
    procedure ExportaGrid;
  public
    { Public declarations }
  end;

var
  frmEntregas: TfrmEntregas;
  entrega: TEntrega;
  entregador: TCodigosEntregadores;
  agente: TAgente;
  cliente: TCliente;
  acessos: TAcessos;
  conexao: TConexao;

implementation

{$R *.dfm}

uses
  udm, uGlobais, clUtil, ufrmListaApoio;

procedure TfrmEntregas.actEntregaAtrasoExecute(Sender: TObject);
begin
  if dm.qryGrid.FieldByName('DOM_BAIXADO').AsString <> 'S' then
  begin
    Application.MessageBox
      ('Entrega ainda não foi baixada! Aguarde a baixa para alterar o Atraso.',
      'Atenção', MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  AlteraExtrato;
end;

procedure TfrmEntregas.actEntregaConsultarExecute(Sender: TObject);
begin
  Localizar;
end;

procedure TfrmEntregas.actEntregaDetalharExecute(Sender: TObject);
begin
  cxPageControl1.ActivePageIndex := 1;
end;

procedure TfrmEntregas.actEntregaEntregadorExecute(Sender: TObject);
begin
  if dm.qryGrid.FieldByName('DOM_BAIXADO').AsString <> 'S' then
  begin
    Application.MessageBox
      ('Entrega ainda não foi baixada! Aguarde a baixa para alterar o Entregador/Adm. de CEP.',
      'Atenção', MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  ListaEntregador;
end;

procedure TfrmEntregas.actEntregaIncluirOcorrenciaExecute(Sender: TObject);
var
  sItens: TStringList;
begin
  sItens := TStringList.Create();
  if TUtil.Empty(cxOcorrencia.Text) then
  begin
    Application.MessageBox('Informe ou selecione a ocorrência!', 'Atenção',
      MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if Application.MessageBox('Confirma incluir esta ocorrência?',
    'Incluir Ocorrência.', MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  cxRastreamento.Lines.Add('> ' + FormatDateTime('dd/mm/yyyy hh:mm', Now) +
    ' - ' + uGlobais.sUsuario + ' - ' + cxOcorrencia.Text);
  sItens.Text := cxRastreamento.Text;
  if entrega.getObject(cxNossoNumero.Text, 'NOSSONUMERO') then
  begin
    entrega.Rastreio := sItens.Text;
    if entrega.Update() then
    begin
      Application.MessageBox('Ocorrência gravada com sucesso!', 'Atenção',
        MB_OK + MB_ICONINFORMATION);
      Exit;
    end
    else
    begin
      Application.MessageBox('Erro ao tentar salvar a ocorrência!', 'Atenção',
        MB_OK + MB_ICONERROR);
      Exit;
    end;
  end
  else
  begin
    Application.MessageBox('Erro ao localizar o registro da entrega!',
      'Atenção', MB_OK + MB_ICONERROR);
    Exit;
  end;
end;

procedure TfrmEntregas.actEntregaRetornarExecute(Sender: TObject);
begin
  cxPageControl1.ActivePageIndex := 0;
end;

procedure TfrmEntregas.actEntregaSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmEntregas.cxCodigoAdmCEPPropertiesChange(Sender: TObject);
begin
  if not(TUtil.Empty(cxCodigoAdmCEP.Text)) then
  begin
    agente.Codigo := cxCodigoAdmCEP.Text;
    cxNomeAdmCEP.Text := agente.getField('NOM_FANTASIA', 'CODIGO');
  end;
end;

procedure TfrmEntregas.cxCodigoClientePropertiesChange(Sender: TObject);
begin
  if not(TUtil.Empty(cxCodigoCliente.Text)) then
  begin
    cliente.Codigo := StrToInt(cxCodigoCliente.Text);
    cxNomeCliente.Text := cliente.getField('NOM_CLIENTE', 'CODIGO');
  end;
end;

procedure TfrmEntregas.cxCodigoEntregadorPropertiesChange(Sender: TObject);
begin
  if not(TUtil.Empty(cxCodigoEntregador.Text)) then
  begin
    entregador.Codigo := StrToInt(cxCodigoEntregador.Text);
    cxNomeEntregador.Text := entregador.getField('NOM_FANTASIA', 'CODIGO');
  end;
end;

procedure TfrmEntregas.cxGrid1DBTableView1CellDblClick
  (Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  actEntregaDetalharExecute(Sender);
end;

procedure TfrmEntregas.cxGrid1DBTableView1NavigatorButtonsButtonClick(Sender: TObject; AButtonIndex: Integer; var ADone: Boolean);
begin
  case AButtonIndex of
    16: ExportaGrid;
  end;
end;

procedure TfrmEntregas.ExportaGrid;
var
  FileExt, sFile: String;
begin
  if not dm.qryGrid.Active then
  begin
    Exit;
  end;
  if dm.qryGrid.IsEmpty then
  begin
    Exit;
  end;
  try
    cxGrid1DBTableView1.ViewData.Expand(True);
    sFile := 'entregas_';
    SaveDialog.FileName := sFile;
    SaveDialog.Filter := '';
    SaveDialog.Filter :=
      'Excel (*.xls) |*.xls|XML (*.xml) |*.xml|Arquivo Texto (*.txt) |*.txt|Página Web (*.html)|*.html';
    SaveDialog.Title := 'Exportar Dados';
    SaveDialog.DefaultExt := 'xls';
    if SaveDialog.Execute then
    begin
      if FileExists(SaveDialog.FileName) then
      begin
        if Application.MessageBox(PChar('Arquivo ' + SaveDialog.FileName + ' já existe. Substituir?'), 'Atenção', MB_YESNO + MB_ICONQUESTION) = IDNO then
        begin
          Exit;
        end;
      end;
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
  finally
    //Exit;
  end;
end;

procedure TfrmEntregas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm.qryClientes.Active := False;
  dm.qryAgentes.Active := False;
  dm.qryCodigosEntregadores.Active := False;
  dm.qryGrid.Close;
  dm.qryGrid.SQL.Clear;
  entrega.Free;
  entregador.Free;
  agente.Free;
  cliente.Free;
  acessos.Free;
  conexao.Free;
  Action := caFree;
  frmEntregas := Nil;
end;

procedure TfrmEntregas.FormShow(Sender: TObject);
begin
  CheckPrivilage;
  entrega := TEntrega.Create;
  entregador := TCodigosEntregadores.Create;
  agente := TAgente.Create;
  cliente := TCliente.Create;
  acessos := TAcessos.Create;
  conexao := TConexao.Create;
  dm.qryClientes.Active := True;
  dm.qryAgentes.Active := True;
  dm.qryCodigosEntregadores.Active := True;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    actEntregaSairExecute(Sender);
    Exit;
  end;
  acessos.SetNivel(aclEntregas);
end;

procedure TfrmEntregas.Localizar;
var
  sNossoNumero, sClientes, sNN: String;
  i, iNN, iClienteEmpresa: Integer;
begin
  sNossoNumero := '';
  sNN := '';
  sClientes := '';
  i := 0;
  iNN := 0;
  ActivityIndicator1.Animate := True;
  ActivityIndicator1.Refresh;
  cxPageControl1.ActivePageIndex := 0;
  for i := 0 to cxNossoNomero.Lines.Count - 1 do
  begin
    if TryStrToInt(cxNossoNomero.Lines[i], iNN) then
    begin
      sNN := IntToStr(iNN);
      if TUtil.Empty(sNossoNumero) then
      begin
        sNossoNumero := #039 + Trim(sNN) + #039;
      end
      else
      begin
        if (not TUtil.Empty(sNN)) then
        begin
          sNossoNumero := sNossoNumero + ',' + #039 + Trim(sNN) + #039;
        end;
      end;
    end;
  end;
  i := 0;
  for i := 0 to cxClientes.Lines.Count - 1 do
  begin
    if TUtil.Empty(sClientes) then
    begin
      sClientes := sClientes + cxClientes.Lines[i];
    end
    else
    begin
      sClientes := sClientes + ',' + cxClientes.Lines[i];
    end;
  end;
  iClienteEmpresa := cboClienteEmpresa.ItemIndex;
  if iClienteEmpresa < 0 then iClienteEmpresa := 0;

  if (not entrega.PesquisaEntrega(sNossoNumero, cxExpedicaoInicial.Text,
    cxExpedicaoFinal.Text, cxPrevisaoInicial.Text, cxPrevisaoFinal.Text,
    cxBaixaInicial.Text, cxBaixaFinal.Text, sClientes,'','','S', '', iClienteEmpresa)) then
  begin
    Application.MessageBox('Nenhum registro encontrado!', 'Atenção',
      MB_OK + MB_ICONEXCLAMATION);
  end;
  ActivityIndicator1.Animate := False;
end;

procedure TfrmEntregas.ListaClientes;
var
  sId: String;
  i: Integer;
  bFlag: Boolean;
begin
  sId := '';
  Screen.Cursor := crHourGlass;
  with dm.qryPesquisa do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT COD_CLIENTE AS "Código", NOM_CLIENTE AS "Nome" ' +
      'FROM tbclientes ';
    dm.ZConn.PingServer;
    Open;
  end;
  if dm.qryPesquisa.IsEmpty then
  begin
    dm.qryPesquisa.Close;
    dm.qryPesquisa.SQL.Clear;
    Exit;
  end
  else
  begin
    dm.qryPesquisa.First;
  end;
  if not Assigned(frmListaApoio) then
  begin
    frmListaApoio := TfrmListaApoio.Create(Application);
  end;
  frmListaApoio.Caption := 'Clientes';
  Screen.Cursor := crDefault;
  i := 0;
  if frmListaApoio.ShowModal = mrOk then
  begin
    sId := dm.qryPesquisa.Fields[0].AsString;
    cxClientes.Lines.Add(sId);
    bFlag := True;
  end;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  FreeAndNil(frmListaApoio);
end;

procedure TfrmEntregas.ListaEntregador;
var
  sId, sNome, sAgente, sNomeAgente, sOcorrencia: String;
  i: Integer;
  sItens: TStringList;
begin
  sId := '';
  Screen.Cursor := crHourGlass;
  sItens := TStringList.Create();
  sOcorrencia := '';
  with dm.qryPesquisa do
  begin
    Close;
    SQL.Clear;
    SQL.Text :=
      'SELECT COD_ENTREGADOR AS "Código", NOM_FANTASIA AS "Nome", COD_AGENTE as "Adm. CEP" '
      + 'FROM tbentregadores ';
    dm.ZConn.PingServer;
    Open;
  end;
  if dm.qryPesquisa.IsEmpty then
  begin
    dm.qryPesquisa.Close;
    dm.qryPesquisa.SQL.Clear;
    Exit;
  end
  else
  begin
    dm.qryPesquisa.First;
  end;
  if not Assigned(frmListaApoio) then
  begin
    frmListaApoio := TfrmListaApoio.Create(Application);
  end;
  frmListaApoio.Caption := 'Entregadores';
  Screen.Cursor := crDefault;
  i := 0;
  sAgente := '';
  if frmListaApoio.ShowModal = mrOk then
  begin
    if Application.MessageBox('Alterar o código do Adm. de CEP também?',
      'Atenção!', MB_YESNO + MB_ICONQUESTION) = IDYES then
    begin
      sAgente := dm.qryPesquisa.Fields[2].AsString;
    end;
    sId := dm.qryPesquisa.Fields[0].AsString;
    sNome := dm.qryPesquisa.Fields[1].AsString;
    if (not TUtil.Empty(sAgente)) then
    begin
      agente.Codigo := sAgente;
      sNomeAgente := agente.getField('NOM_FANTASIA', 'CODIGO');
      if TUtil.Empty(sNomeAgente) then
      begin
        sNomeAgente := 'ADM. DE CEP NÃO CADASTRADO';
      end;
      cxCodigoAdmCEP.Text := sAgente;
      cxNomeAdmCEP.Text := sNome;
    end;
    cxCodigoEntregador.Text := sId;
    cxNomeEntregador.Text := sNome;
    sOcorrencia := 'Alteração do Entregador';
    if (not TUtil.Empty(sAgente)) then
    begin
      sOcorrencia := sOcorrencia + ' e de Administrador de CEP';
    end;
    cxRastreamento.Lines.Add('> ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) +
      ' - ' + uGlobais.sUsuario + ' - ' + sOcorrencia);
    sItens.Text := cxRastreamento.Text;
    if entrega.getObject(cxNossoNumero.Text, 'NOSSONUMERO') then
    begin
      entrega.Rastreio := sItens.Text;
      if (not TUtil.Empty(sAgente)) then
      begin
        entrega.agente := StrToInt(sAgente);
      end;
      entrega.entregador := StrToInt(sId);
      if entrega.Update() then
      begin
        Application.MessageBox
          ('Alteração de Entregador/Adm. do CEP gravada com sucesso!',
          'Atenção', MB_OK + MB_ICONINFORMATION);
        Exit;
      end
      else
      begin
        Application.MessageBox
          ('Erro ao tentar gravar a alteração de Entregador/Adm. do CEP!',
          'Atenção', MB_OK + MB_ICONERROR);
        Exit;
      end;
    end
    else
    begin
      Application.MessageBox('Erro ao localizar o registro da entrega!',
        'Atenção', MB_OK + MB_ICONERROR);
      Exit;
    end;
  end;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  FreeAndNil(frmListaApoio);
end;

procedure TfrmEntregas.AlteraExtrato;
var
  sAtrasosOld, sAtrasos, sOcorrencia: String;
  iAtrasos: Integer;
  sItens: TStringList;
begin
  sItens := TStringList.Create();
  sOcorrencia := '';
  iAtrasos := 0;
  sAtrasos := InputBox('Dias de Atraso.',
    'Informe a quantidade de dias de atraso', '0');
  if (not TryStrToInt(sAtrasos, iAtrasos)) then
  begin
    Application.MessageBox('Valor informado não é númérico!', 'Atenção',
      MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  sOcorrencia := 'Alteração dos dias de atraso de entrega.';
  cxRastreamento.Lines.Add('> ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) +
    ' - ' + uGlobais.sUsuario + ' - ' + sOcorrencia);
  sItens.Text := cxRastreamento.Text;
  if entrega.getObject(cxNossoNumero.Text, 'NOSSONUMERO') then
  begin
    cxAtraso.Text := sAtrasos;
    entrega.Rastreio := sItens.Text;
    entrega.DiasAtraso := iAtrasos;
    if entrega.Update() then
    begin
      Application.MessageBox
        ('Alteração dos dias de Atraso gravada com sucesso!', 'Atenção',
        MB_OK + MB_ICONINFORMATION);
      Exit;
    end
    else
    begin
      Application.MessageBox
        ('Erro ao tentar gravar a alteração dos dias de Atraso!', 'Atenção',
        MB_OK + MB_ICONERROR);
      Exit;
    end;
  end
  else
  begin
    Application.MessageBox('Erro ao localizar o registro da entrega!',
      'Atenção', MB_OK + MB_ICONERROR);
    Exit;
  end;

end;

procedure TfrmEntregas.CheckPrivilage;
begin
  if uGlobais.pPrivilegio = 'S' then
  begin
    cxGrid1DBTableView1Column13.VisibleForCustomization := True;
    cxGrid1DBTableView1Column18.VisibleForCustomization := True;
    cxGrid1DBTableView1Column19.VisibleForCustomization := True;
  end
  else
  begin
    cxGrid1DBTableView1Column13.VisibleForCustomization := False;
    cxGrid1DBTableView1Column18.VisibleForCustomization := False;
    cxGrid1DBTableView1Column19.VisibleForCustomization := True;
  end;

end;

end.
