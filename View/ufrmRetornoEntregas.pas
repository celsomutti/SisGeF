unit ufrmRetornoEntregas;

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
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter,
  cxPC, cxLabel, cxImage, Vcl.ExtCtrls, cxGroupBox,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxButtonEdit, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, clEntrega, Vcl.ActnList,
  cxProgressBar, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  uthrSalvaBaixasConcluidas, clAgentes, clEntregador, uthrSalvaRetornoEntregas,
  clCliente, cxGridExportLink, ShellAPI,
  uthrPopulaRelatorioRetorno, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxBarBuiltInMenu, System.Actions, clAcessos, clConexao, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxDateRanges,
  cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TfrmRetornoEntregas = class(TForm)
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxDataConclusao: TcxDateEdit;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxLabel3: TcxLabel;
    cxNossoNumero: TcxMaskEdit;
    ds: TDataSource;
    cxGrid1DBTableView1NUM_NOSSONUMERO: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_CONSUMIDOR: TcxGridDBColumn;
    cxGrid1DBTableView1DES_ENDERECO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_BAIRRO: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_CIDADE: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_CEP: TcxGridDBColumn;
    cxGrid1DBTableView1QTD_VOLUMES: TcxGridDBColumn;
    cxGrid1DBTableView1QTD_PESO_REAL: TcxGridDBColumn;
    aclRetorno: TActionList;
    actRetornoExecutar: TAction;
    actRetornoCancelar: TAction;
    actRetornoSalvar: TAction;
    actRetornoImprimir: TAction;
    actRetornoExportar: TAction;
    actRetornoSair: TAction;
    cxProgressBar: TcxProgressBar;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxTabSheet2: TcxTabSheet;
    cxGroupBox2: TcxGroupBox;
    cxLabel4: TcxLabel;
    cxNossoNumero1: TcxMaskEdit;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGridDBTableView1NUM_NOSSONUMERO: TcxGridDBColumn;
    cxGridDBTableView1NOM_CONSUMIDOR: TcxGridDBColumn;
    cxGridDBTableView1DES_ENDERECO: TcxGridDBColumn;
    cxGridDBTableView1DES_BAIRRO: TcxGridDBColumn;
    cxGridDBTableView1NUM_CEP: TcxGridDBColumn;
    cxGridDBTableView1QTD_VOLUMES: TcxGridDBColumn;
    cxGridDBTableView1QTD_PESO_REAL: TcxGridDBColumn;
    cxGridDBTableView1DES_RETORNO: TcxGridDBColumn;
    cxProgressBar1: TcxProgressBar;
    cxButton4: TcxButton;
    cxButton5: TcxButton;
    cxButton6: TcxButton;
    Relatório: TcxTabSheet;
    cxGroupBox3: TcxGroupBox;
    cxLabel2: TcxLabel;
    cxDataInicial: TcxDateEdit;
    cxLabel5: TcxLabel;
    cxDataFinal: TcxDateEdit;
    cxLabel6: TcxLabel;
    cxCodigoAgente: TcxButtonEdit;
    acrRetornoApoio: TAction;
    cxNomeAgente: TcxTextEdit;
    cxLabel7: TcxLabel;
    cxCodigoCliente: TcxButtonEdit;
    cxNomeCliente: TcxTextEdit;
    cxButton7: TcxButton;
    cxGrid3: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    cxGridDBTableView2NUM_NOSSONUMERO: TcxGridDBColumn;
    cxGridDBTableView2NOM_CONSUMIDOR: TcxGridDBColumn;
    cxGridDBTableView2DES_ENDERECO: TcxGridDBColumn;
    cxGridDBTableView2DES_BAIRRO: TcxGridDBColumn;
    cxGridDBTableView2NOM_CIDADE: TcxGridDBColumn;
    cxGridDBTableView2NUM_CEP: TcxGridDBColumn;
    cxGridDBTableView2QTD_VOLUMES: TcxGridDBColumn;
    cxGridDBTableView2QTD_PESO_REAL: TcxGridDBColumn;
    cxGridDBTableView2DES_RETORNO: TcxGridDBColumn;
    cxGridDBTableView2DAT_BAIXA: TcxGridDBColumn;
    cxGridDBTableView2NOM_AGENTE: TcxGridDBColumn;
    cxGridDBTableView2NOM_ENTREGADOR: TcxGridDBColumn;
    cxLabel8: TcxLabel;
    cxSituacao: TcxComboBox;
    cxProgressBar2: TcxProgressBar;
    cxButton8: TcxButton;
    cxButton9: TcxButton;
    cxButton10: TcxButton;
    SaveDialog: TSaveDialog;
    cxLabel27: TcxLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actRetornoSairExecute(Sender: TObject);
    procedure actRetornoCancelarExecute(Sender: TObject);
    procedure cxNossoNumeroPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure actRetornoSalvarExecute(Sender: TObject);
    procedure cxNossoNumero1PropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxPageControl1PageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
    procedure actRetornoExecutarExecute(Sender: TObject);
    procedure cxCodigoAgentePropertiesChange(Sender: TObject);
    procedure cxCodigoClientePropertiesChange(Sender: TObject);
    procedure cxCodigoAgentePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxCodigoClientePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure actRetornoExportarExecute(Sender: TObject);
    procedure acrRetornoApoioExecute(Sender: TObject);
    procedure cxNossoNumeroPropertiesEditValueChanged(Sender: TObject);
    procedure cxNossoNumero1PropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
    procedure LocalizaEntrega;
    procedure SalvaConcluidas;
    procedure SalvaRetornos;
    procedure ListaAgentes;
    procedure ListaClientes;
    procedure PopulaRelatorio;
    procedure ExportarRelatorio;
    function VerificaGrade(): Boolean;
    function VerificaRetorno(): Boolean;
  public
    { Public declarations }
  end;

var
  frmRetornoEntregas: TfrmRetornoEntregas;
  entrega: TEntrega;
  thrSalva: thrSalvaBaixasConcluidas;
  agente: TAgente;
  entregador: TEntregador;
  cliente: TCliente;
  thrRetorno: thrSalvaRetornoEntregas;
  thrRelatorio: thrPopulaRelatorioRetorno;
  acessos: TAcessos;
  conexao: TConexao;

implementation

{$R *.dfm}

uses
  udm, clUtil, Math, ufrmListaApoio, uGlobais;

procedure TfrmRetornoEntregas.acrRetornoApoioExecute(Sender: TObject);
begin
  if cxCodigoAgente.IsFocused then
  begin
    ListaAgentes;
  end;
  if cxCodigoCliente.IsFocused then
  begin
    ListaClientes;
  end;

end;

procedure TfrmRetornoEntregas.actRetornoCancelarExecute(Sender: TObject);
begin
  if dm.tbRetorno.Active then
  begin
    dm.tbRetorno.Close;
  end;
  dm.tbRetorno.Open;
end;

procedure TfrmRetornoEntregas.actRetornoExecutarExecute(Sender: TObject);
begin
  PopulaRelatorio;
end;

procedure TfrmRetornoEntregas.actRetornoExportarExecute(Sender: TObject);
begin
  ExportarRelatorio;
end;

procedure TfrmRetornoEntregas.actRetornoSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmRetornoEntregas.actRetornoSalvarExecute(Sender: TObject);
begin
  if cxPageControl1.ActivePageIndex = 0 then
  begin
    SalvaConcluidas;
  end
  else if cxPageControl1.ActivePageIndex = 1 then
  begin
    SalvaRetornos;
  end;
end;

procedure TfrmRetornoEntregas.cxCodigoAgentePropertiesChange(Sender: TObject);
begin
  cxNomeAgente.Clear;
end;

procedure TfrmRetornoEntregas.cxCodigoAgentePropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if TUtil.Empty(cxCodigoAgente.Text) then
  begin
    cxCodigoAgente.Text := '0';
  end;
  if agente.getObject(cxCodigoAgente.Text, 'CODIGO') then
  begin
    cxNomeAgente.Text := agente.Fantasia;
  end
  else
  begin
    cxNomeAgente.Text := '';
  end;
end;

procedure TfrmRetornoEntregas.cxCodigoClientePropertiesChange(Sender: TObject);
begin
  cxNomeCliente.Clear;
end;

procedure TfrmRetornoEntregas.cxCodigoClientePropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if TUtil.Empty(cxCodigoCliente.Text) then
  begin
    cxCodigoCliente.Text := '0';
  end;
  if cliente.getObject(cxCodigoCliente.Text, 'CODIGO') then
  begin
    cxNomeCliente.Text := cliente.Razao;
  end
  else
  begin
    cxNomeCliente.Text := '';
  end;
end;

procedure TfrmRetornoEntregas.cxNossoNumero1PropertiesEditValueChanged
  (Sender: TObject);
begin
  cxNossoNumero1.Clear;
  cxNossoNumero1.SetFocus;
end;

procedure TfrmRetornoEntregas.cxNossoNumero1PropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if not(VerificaGrade()) then
  begin
    LocalizaEntrega;
  end;
end;

procedure TfrmRetornoEntregas.cxNossoNumeroPropertiesEditValueChanged
  (Sender: TObject);
begin
  cxNossoNumero.Clear;
  cxNossoNumero.SetFocus;
end;

procedure TfrmRetornoEntregas.cxNossoNumeroPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if not(VerificaGrade()) then
  begin
    LocalizaEntrega;
  end;
end;

procedure TfrmRetornoEntregas.cxPageControl1PageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  if dm.tbRetorno.Active then
  begin
    dm.tbRetorno.Close;
  end;
  dm.tbRetorno.Open;
end;

procedure TfrmRetornoEntregas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  entrega.Free;
  agente.Free;
  entregador.Free;
  cliente.Free;
  acessos.Free;
  conexao.Free;
  dm.tbRetorno.Close;
  Action := caFree;
  frmRetornoEntregas := Nil;
end;

procedure TfrmRetornoEntregas.FormShow(Sender: TObject);
begin
  entrega := TEntrega.Create;
  agente := TAgente.Create;
  entregador := TEntregador.Create;
  cliente := TCliente.Create;
  acessos := TAcessos.Create;
  conexao := TConexao.Create;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    actRetornoSairExecute(Sender);
    Exit;
  end;
  acessos.SetNivel(aclRetorno);
  cxDataConclusao.Date := Now;
  if dm.tbRetorno.Active then
  begin
    dm.tbRetorno.Close;
  end;
  dm.tbRetorno.Open;
end;

procedure TfrmRetornoEntregas.LocalizaEntrega;
var
  sMess, sNossoNumero, sAgente, sEntregador: String;
  bFlagSave: Boolean;
begin
  try
    sMess := '';
    if cxPageControl1.ActivePageIndex = 0 then
    begin
      sNossoNumero := Trim(cxNossoNumero.Text);
    end
    else
    begin
      sNossoNumero := Trim(cxNossoNumero1.Text);
    end;
    if TUtil.Empty(sNossoNumero) then
    begin
      Exit;
    end;
    if TUtil.Empty(cxDataConclusao.Text) then
    begin
      cxDataConclusao.Date := Now;
    end;
    if entrega.getObject(sNossoNumero, 'NOSSONUMERO') then
    begin
      if entrega.Recebido <> 'S' then
      begin
        Application.MessageBox('Entrega não foi recebida!', 'Atenção',
          MB_OK + MB_ICONEXCLAMATION);
        Exit;
      end;
      if entrega.entregador = 0 then
      begin
        Application.MessageBox('Entrega não foi Atribuída!', 'Atenção',
          MB_OK + MB_ICONEXCLAMATION);
        Exit;
      end;
      if entrega.Baixado = 'S' then
      begin
        Application.MessageBox('Entrega já foi baixada!', 'Atenção',
          MB_OK + MB_ICONEXCLAMATION);
        Exit;
      end;
      if cxPageControl1.ActivePageIndex = 0 then
      begin
        if entrega.Status = 6 then
        begin
          Application.MessageBox('Entrega aguardando Reatribuição!', 'Atenção',
            MB_OK + MB_ICONEXCLAMATION);
          Exit;
        end;
      end;
      agente.Codigo := IntToStr(entrega.agente);
      sAgente := IntToStr(entrega.agente) + ' - ' +
        agente.getField('NOM_FANTASIA', 'CODIGO');
      entregador.Codigo := IntToStr(entrega.entregador);
      sEntregador := IntToStr(entrega.entregador) + ' - ' +
        entregador.getField('NOM_FANTASIA', 'CODIGO');
      with dm do
      begin
        tbRetorno.Insert;
        tbRetornoNUM_NOSSONUMERO.Value := entrega.NossoNumero;
        tbRetornoNOM_CONSUMIDOR.Value := entrega.Consumidor;
        tbRetornoDES_ENDERECO.Value := entrega.Endereco;
        tbRetornoDES_BAIRRO.Value := entrega.Bairro;
        tbRetornoNOM_CIDADE.Value := entrega.Cidade;
        tbRetornoNUM_CEP.Value := entrega.Cep;
        tbRetornoQTD_VOLUMES.Value := entrega.Volumes;
        tbRetornoQTD_PESO_REAL.Value := entrega.PesoReal;
        tbRetornoCOD_AGENTE.Value := entrega.agente;
        tbRetornoCOD_ENTREGADOR.Value := entrega.entregador;
        tbRetornoDES_RASTREIO.Value := entrega.Rastreio;
        tbRetornoDAT_BAIXA.Value := cxDataConclusao.Date;
        tbRetornoNOM_AGENTE.Value := sAgente;
        tbRetornoNOM_ENTREGADOR.Value := sEntregador;
        tbRetorno.Post;
      end;
    end
    else if entrega.getObject(Copy(sNossoNumero, 1, Length(sNossoNumero) - 2),
      'NOSSONUMERO') then
    begin
      if entrega.Recebido <> 'S' then
      begin
        Application.MessageBox('Entrega não foi recebida!', 'Atenção',
          MB_OK + MB_ICONEXCLAMATION);
        Exit;
      end;
      if entrega.entregador = 0 then
      begin
        Application.MessageBox('Entrega não foi Atribuída!', 'Atenção',
          MB_OK + MB_ICONEXCLAMATION);
        Exit;
      end;
      if entrega.Baixado = 'S' then
      begin
        Application.MessageBox('Entrega já foi baixada!', 'Atenção',
          MB_OK + MB_ICONEXCLAMATION);
        Exit;
      end;
      if cxPageControl1.ActivePageIndex = 0 then
      begin
        if entrega.Status = 6 then
        begin
          Application.MessageBox('Entrega aguardando Reatribuição!', 'Atenção',
            MB_OK + MB_ICONEXCLAMATION);
          Exit;
        end;
      end;
      agente.Codigo := IntToStr(entrega.agente);
      sAgente := IntToStr(entrega.agente) + ' - ' +
        agente.getField('NOM_FANTASIA', 'CODIGO');
      entregador.Codigo := IntToStr(entrega.entregador);
      sEntregador := IntToStr(entrega.entregador) + ' - ' +
        entregador.getField('NOM_FANTASIA', 'CODIGO');
      with dm do
      begin
        tbRetorno.Insert;
        tbRetornoNUM_NOSSONUMERO.Value := entrega.NossoNumero;
        tbRetornoNOM_CONSUMIDOR.Value := entrega.Consumidor;
        tbRetornoDES_ENDERECO.Value := entrega.Endereco;
        tbRetornoDES_BAIRRO.Value := entrega.Bairro;
        tbRetornoNOM_CIDADE.Value := entrega.Cidade;
        tbRetornoNUM_CEP.Value := entrega.Cep;
        tbRetornoQTD_VOLUMES.Value := entrega.Volumes;
        tbRetornoQTD_PESO_REAL.Value := entrega.PesoReal;
        tbRetornoCOD_AGENTE.Value := entrega.agente;
        tbRetornoCOD_ENTREGADOR.Value := entrega.entregador;
        tbRetornoDES_RASTREIO.Value := entrega.Rastreio;
        tbRetornoDAT_BAIXA.Value := cxDataConclusao.Date;
        tbRetornoNOM_AGENTE.Value := sAgente;
        tbRetornoNOM_ENTREGADOR.Value := sEntregador;
        tbRetorno.Post;
      end;
    end
    else if entrega.getObject(sNossoNumero, 'CTRC') then
    begin
      bFlagSave := True;
      while not(dm.qryGetObject.Eof) do
      begin
        agente.Codigo := dm.qryGetObject.FieldByName('COD_AGENTE').AsString;
        entregador.Codigo := dm.qryGetObject.FieldByName
          ('COD_ENTREGADOR').AsString;
        sAgente := dm.qryGetObject.FieldByName('COD_AGENTE').AsString + ' - ' +
          agente.getField('NOM_FANTASIA', 'CODIGO');
        sEntregador := dm.qryGetObject.FieldByName('COD_ENTREGADOR').AsString +
          ' - ' + entregador.getField('NOM_FANTASIA', 'CODIGO');
        if dm.qryGetObject.FieldByName('DOM_RECEBIDO').AsString <> 'S' then
        begin
          sMess := 'Entrega NN ' + dm.qryGetObject.FieldByName
            ('NUM_NOSSONUMERO').AsString + ' não foi recebida!';
          Application.MessageBox(PChar(sMess), 'Atenção',
            MB_OK + MB_ICONEXCLAMATION);
          bFlagSave := False;
        end;
        if dm.qryGetObject.FieldByName('COD_ENTREGADOR').AsInteger = 0 then
        begin
          sMess := 'Entrega NN ' + dm.qryGetObject.FieldByName
            ('NUM_NOSSONUMERO').AsString + ' não foi atribuída!';
          Application.MessageBox(PChar(sMess), 'Atenção',
            MB_OK + MB_ICONEXCLAMATION);
          bFlagSave := False;
        end;
        if dm.qryGetObject.FieldByName('DOM_BAIXADO').AsString = 'S' then
        begin
          sMess := 'Entrega NN ' + dm.qryGetObject.FieldByName
            ('NUM_NOSSONUMERO').AsString + ' já foi baixada!';
          Application.MessageBox(PChar(sMess), 'Atenção',
            MB_OK + MB_ICONEXCLAMATION);
          bFlagSave := False;
        end;
        if cxPageControl1.ActivePageIndex = 0 then
        begin
          if dm.qryGetObject.FieldByName('COD_STATUS').AsInteger = 6 then
          begin
            sMess := 'Entrega NN ' + dm.qryGetObject.FieldByName
              ('NUM_NOSSONUMERO').AsString + ' aguardando Reatribuição!';
            Application.MessageBox(PChar(sMess), 'Atenção',
              MB_OK + MB_ICONEXCLAMATION);
            bFlagSave := False;
          end;
        end;
        if bFlagSave then
        begin
          with dm do
          begin
            tbRetorno.Insert;
            tbRetornoNUM_NOSSONUMERO.Value := dm.qryGetObject.FieldByName
              ('NUM_NOSSONUMERO').AsString;
            tbRetornoNOM_CONSUMIDOR.Value := dm.qryGetObject.FieldByName
              ('NOM_CONSUMIDOR').AsString;
            tbRetornoDES_ENDERECO.Value := dm.qryGetObject.FieldByName
              ('DES_ENDERECO').AsString;
            tbRetornoDES_BAIRRO.Value := dm.qryGetObject.FieldByName
              ('DES_BAIRRO').AsString;
            tbRetornoNOM_CIDADE.Value := dm.qryGetObject.FieldByName
              ('NOM_CIDADE').AsString;
            tbRetornoNUM_CEP.Value := dm.qryGetObject.FieldByName
              ('NUM_CEP').AsString;
            tbRetornoQTD_VOLUMES.Value := dm.qryGetObject.FieldByName
              ('QTD_VOLUMES').AsInteger;
            tbRetornoQTD_PESO_REAL.Value := dm.qryGetObject.FieldByName
              ('QTD_PESO_REAL').AsFloat;
            tbRetornoCOD_AGENTE.Value := dm.qryGetObject.FieldByName
              ('COD_AGENTE').AsInteger;
            tbRetornoCOD_ENTREGADOR.Value := dm.qryGetObject.FieldByName
              ('COD_ENTREGADOR').AsInteger;
            tbRetornoDES_RASTREIO.Value := dm.qryGetObject.FieldByName
              ('DES_RASTREIO').AsString;
            tbRetornoDAT_BAIXA.Value := cxDataConclusao.Date;
            tbRetornoNOM_AGENTE.Value := sAgente;
            tbRetornoNOM_ENTREGADOR.Value := sEntregador;
            tbRetorno.Post;
          end;
        end;
        dm.qryGetObject.Next;
      end;
    end
    else
    begin
      Application.MessageBox('Entrega não localizada!', 'Atenção',
        MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
  finally
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
    if cxPageControl1.ActivePageIndex = 0 then
    begin
      cxNossoNumero.Clear;
      cxNossoNumero.SetFocus;
    end
    else
    begin
      cxGridDBTableView1DES_RETORNO.FocusWithSelection;
    end;
  end;
end;

function TfrmRetornoEntregas.VerificaGrade(): Boolean;
var
  sNossoNumero: String;
begin
  Result := False;
  with dm.tbRetorno do
  begin
    if IsEmpty then
    begin
      Exit;
    end;
    if not(Active) then
    begin
      Exit;
    end;
    if cxPageControl1.ActivePageIndex = 0 then
    begin
      sNossoNumero := Trim(cxNossoNumero.Text);
    end
    else
    begin
      sNossoNumero := Trim(cxNossoNumero1.Text);
    end;
    First;
    while not(Eof) do
    begin
      if sNossoNumero = FieldByName('NUM_NOSSONUMERO').AsString then
      begin
        Result := True;
        Break;
      end;
      Next;
    end;
    if not(Result) then
    begin
      sNossoNumero := Copy(Trim(cxNossoNumero.Text), 1,
        Length(Trim(cxNossoNumero.Text)) - 2);
      First;
      while not(Eof) do
      begin
        if sNossoNumero = FieldByName('NUM_NOSSONUMERO').AsString then
        begin
          Result := True;
          Break;
        end;
        Next;
      end;
    end;
  end;
end;

procedure TfrmRetornoEntregas.SalvaConcluidas;
begin
  if not(dm.tbRetorno.Active) then
  begin
    Exit;
  end;
  if dm.tbRetorno.IsEmpty then
  begin
    Exit;
  end;
  if Application.MessageBox('Confirma Salvar estas Baixas no Banco de Dados?',
    'Salvar Baixas', MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  ds.Enabled := False;
  thrSalva := thrSalvaBaixasConcluidas.Create(True);
  thrSalva.FreeOnTerminate := True;
  thrSalva.Priority := tpNormal;
  thrSalva.Start;
  acessos.SetNivel(aclRetorno);
end;

procedure TfrmRetornoEntregas.SalvaRetornos;
begin
  if not(dm.tbRetorno.Active) then
  begin
    Exit;
  end;
  if dm.tbRetorno.IsEmpty then
  begin
    Exit;
  end;
  if not(VerificaRetorno()) then
  begin
    Application.MessageBox
      ('Existem entregas sem a descrição do Retorno! Verifique.', 'Atenção',
      MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if Application.MessageBox('Confirma Salvar estes Retornos no Banco de Dados?',
    'Salvar Retornos', MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  ds.Enabled := False;
  thrRetorno := thrSalvaRetornoEntregas.Create(True);
  thrRetorno.FreeOnTerminate := True;
  thrRetorno.Priority := tpNormal;
  thrRetorno.Start;
  acessos.SetNivel(aclRetorno);
end;

function TfrmRetornoEntregas.VerificaRetorno(): Boolean;
begin
  Result := False;
  with dm.tbRetorno do
  begin
    First;
    while not(Eof) do
    begin
      if TUtil.Empty(FieldByName('DES_RETORNO').AsString) then
      begin
        Break;
        Exit;
      end;
      Next;
    end;
  end;
  Result := True;
end;

procedure TfrmRetornoEntregas.ListaAgentes;
var
  sId: String;
begin
  sId := '';
  sId := Trim(cxCodigoAgente.Text);
  with dm.qryPesquisa do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT COD_AGENTE AS "Código", NOM_FANTASIA AS "Nome" ' +
      'FROM tbagentes ';
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
  frmListaApoio.Caption := 'Agentes';
  if frmListaApoio.ShowModal = mrOk then
  begin
    cxCodigoAgente.Text := dm.qryPesquisa.Fields[0].AsString;
    cxCodigoAgente.Refresh;
    cxNomeAgente.Text := dm.qryPesquisa.Fields[1].AsString;
    cxNomeAgente.Refresh;
  end;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  FreeAndNil(frmListaApoio);
end;

procedure TfrmRetornoEntregas.ListaClientes;
var
  sId: String;
begin
  sId := Trim(cxCodigoCliente.Text);
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
  if frmListaApoio.ShowModal = mrOk then
  begin
    cxCodigoCliente.Text := dm.qryPesquisa.Fields[0].AsString;
    cxCodigoCliente.Refresh;
    cxNomeCliente.Text := dm.qryPesquisa.Fields[1].AsString;
    cxNomeCliente.Refresh;
  end;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  FreeAndNil(frmListaApoio);
end;

procedure TfrmRetornoEntregas.PopulaRelatorio;
begin
  if TUtil.Empty(cxCodigoCliente.Text) then
  begin
    Application.MessageBox('Informe o Código do Cliente.', 'Atenção',
      MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if StrtoInt(cxCodigoCliente.Text) = 0 then
  begin
    Application.MessageBox('Informe o Código do Cliente.', 'Atenção',
      MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if TUtil.Empty(cxDataInicial.Text) then
  begin
    Application.MessageBox('Informe a Data Inicial do Período.', 'Atenção',
      MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if TUtil.Empty(cxDataFinal.Text) then
  begin
    Application.MessageBox('Informe a Data Final do Período.', 'Atenção',
      MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if cxDataFinal.Date < cxDataInicial.Date then
  begin
    Application.MessageBox
      ('A Data Final do Período não pode ser menor qua a Data Inicial.',
      'Atenção', MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  ds.Enabled := False;
  thrRelatorio := thrPopulaRelatorioRetorno.Create(True);
  thrRelatorio.FreeOnTerminate := True;
  thrRelatorio.Priority := tpNormal;
  thrRelatorio.Start;
  acessos.SetNivel(aclRetorno);
end;

procedure TfrmRetornoEntregas.ExportarRelatorio;
var
  FileExt, sFile: String;
begin
  if not(dm.tbRetorno.Active) then
  begin
    Exit;
  end;
  if dm.tbRetorno.IsEmpty then
  begin
    Exit;
  end;
  sFile := 'relatorio_retorno_';
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
      ExportGridToExcel(SaveDialog.FileName, cxGrid3, False, True, False)
    else if FileExt = '.xml' then
      ExportGridToXML(SaveDialog.FileName, cxGrid3, False)
    else if FileExt = '.txt' then
      ExportGridToText(SaveDialog.FileName, cxGrid3, False)
    else if FileExt = '.html' then
      ExportGridToHTML(SaveDialog.FileName, cxGrid3, False);
    ShellExecute(Handle, 'open', PChar(SaveDialog.FileName), nil, nil, SW_SHOW);
  end;
end;

end.
