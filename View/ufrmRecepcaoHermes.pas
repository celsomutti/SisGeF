unit ufrmRecepcaoHermes;

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
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxLabel, cxImage, Vcl.ExtCtrls,
  cxGroupBox, Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, dxSkinscxPCPainter,
  cxPCdxBarPopupMenu, cxPC, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Vcl.ActnList, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  clEntrega, cxProgressBar,
  uthrSalvaRecepcao, cxGridBandedTableView, cxGridDBBandedTableView,
  uthrPopulaRecepcao, cxGridExportLink, ShellAPI, cxCurrencyEdit,
  clConexao, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxBarBuiltInMenu, System.Actions;

type
  TfrmRecepcaoHermes = class(TForm)
    Panel1: TPanel;
    cxImage1: TcxImage;
    cxLabel16: TcxLabel;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxGroupBox1: TcxGroupBox;
    cxLabel3: TcxLabel;
    cxNossoNumero: TcxMaskEdit;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    aclRecepcao: TActionList;
    actRecepcaoSalvar: TAction;
    actRecepcaoSair: TAction;
    ds: TDataSource;
    cxGrid1DBTableView1NUM_MANIFESTO: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_CTRC: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_NOSSONUMERO: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_CONSUMIDOR: TcxGridDBColumn;
    cxGrid1DBTableView1DES_ENDERECO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_BAIRRO: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_CIDADE: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_CEP: TcxGridDBColumn;
    cxGrid1DBTableView1QTD_VOLUMES: TcxGridDBColumn;
    cxGrid1DBTableView1QTD_PESO_REAL: TcxGridDBColumn;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    actRecepcaoCancelar: TAction;
    cxButton3: TcxButton;
    cxProgressBar: TcxProgressBar;
    cxTabSheet2: TcxTabSheet;
    cxGroupBox2: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxManifesto: TcxMaskEdit;
    cxGrid2: TcxGrid;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2DBBandedTableView2: TcxGridDBBandedTableView;
    cxGrid2DBBandedTableView2NUM_MANIFESTO: TcxGridDBBandedColumn;
    cxGrid2DBBandedTableView2NUM_CTRC: TcxGridDBBandedColumn;
    cxGrid2DBBandedTableView2NUM_NOSSONUMERO: TcxGridDBBandedColumn;
    cxGrid2DBBandedTableView2NOM_CONSUMIDOR: TcxGridDBBandedColumn;
    cxGrid2DBBandedTableView2DES_ENDERECO: TcxGridDBBandedColumn;
    cxGrid2DBBandedTableView2DES_BAIRRO: TcxGridDBBandedColumn;
    cxGrid2DBBandedTableView2NOM_CIDADE: TcxGridDBBandedColumn;
    cxGrid2DBBandedTableView2NUM_CEP: TcxGridDBBandedColumn;
    cxGrid2DBBandedTableView2QTD_VOLUMES: TcxGridDBBandedColumn;
    cxGrid2DBBandedTableView2QTD_PESO_REAL: TcxGridDBBandedColumn;
    actRecepcaoListar: TAction;
    cxButton4: TcxButton;
    cxLabel2: TcxLabel;
    cxSituacao: TcxComboBox;
    actRecepcaoExportar: TAction;
    cxButton5: TcxButton;
    SaveDialog: TSaveDialog;
    procedure FormShow(Sender: TObject);
    procedure actRecepcaoCancelarExecute(Sender: TObject);
    procedure cxNossoNumeroPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure actRecepcaoSairExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxNossoNumeroPropertiesEditValueChanged(Sender: TObject);
    procedure actRecepcaoSalvarExecute(Sender: TObject);
    procedure cxPageControl1PageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
    procedure actRecepcaoListarExecute(Sender: TObject);
    procedure actRecepcaoExportarExecute(Sender: TObject);
  private
    { Private declarations }
    procedure LocalizaEntrega;
    function VerificaGrade(sNossoNumero: String): Boolean;
  public
    { Public declarations }
  end;

var
  frmRecepcaoHermes: TfrmRecepcaoHermes;
  entrega: TEntrega;
  thrSalva: thrSalvaRecepcao;
  thrPopula: thrPopularecepcao;
  conexao: TConexao;

implementation

{$R *.dfm}

uses
  udm, clUtil, Math, uGlobais;

procedure TfrmRecepcaoHermes.actRecepcaoCancelarExecute(Sender: TObject);
begin
  if dm.TbRecepcao.IsEmpty then
  begin
    Exit;
  end;
  if Application.MessageBox('Confirma Cancelar a Recepção?', 'Cancelar',
    MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  dm.TbRecepcao.Close;
  dm.TbRecepcao.Open;
  TUtil.LimparFields(Self);
  cxNossoNumero.SetFocus;
end;

procedure TfrmRecepcaoHermes.actRecepcaoExportarExecute(Sender: TObject);
var
  FileExt, sFile: String;
begin
  if not(dm.TbRecepcao.Active) then
  begin
    Exit;
  end;
  if dm.TbRecepcao.IsEmpty then
  begin
    Exit;
  end;
  SaveDialog.Filter := '';
  SaveDialog.Filter :=
    'Excel (*.xls) |*.xls|XML (*.xml) |*.xml|Arquivo Texto (*.txt) |*.txt|Página Web (*.html)|*.html';
  SaveDialog.Title := 'Exportar Dados';
  SaveDialog.DefaultExt := 'xls';
  if SaveDialog.Execute then
  begin
    FileExt := LowerCase(ExtractFileExt(SaveDialog.FileName));
    if FileExt = '.xls' then
      ExportGridToExcel(SaveDialog.FileName, cxGrid2, False, True, False)
    else if FileExt = '.xml' then
      ExportGridToXML(SaveDialog.FileName, cxGrid2, False)
    else if FileExt = '.txt' then
      ExportGridToText(SaveDialog.FileName, cxGrid2, False)
    else if FileExt = '.html' then
      ExportGridToHTML(SaveDialog.FileName, cxGrid2, False);
    ShellExecute(Handle, 'open', pchar(SaveDialog.FileName), nil, nil, SW_SHOW);
  end;
end;

procedure TfrmRecepcaoHermes.actRecepcaoListarExecute(Sender: TObject);
begin
  if TUtil.Empty(cxManifesto.Text) then
  begin
    cxManifesto.Text := '0';
  end;
  ds.Enabled := False;
  thrPopula := thrPopularecepcao.Create(True);
  thrPopula.FreeOnTerminate := True;
  thrPopula.Priority := tpNormal;
  thrPopula.Start;
end;

procedure TfrmRecepcaoHermes.actRecepcaoSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmRecepcaoHermes.actRecepcaoSalvarExecute(Sender: TObject);
begin
  if not(dm.TbRecepcao.Active) then
  begin
    Exit;
  end;
  if dm.TbRecepcao.IsEmpty then
  begin
    Exit;
  end;
  if Application.MessageBox('Confirma Salvar as Recepções no Banco de Dados?',
    'Salvar Recepções', MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  ds.Enabled := False;
  thrSalva := thrSalvaRecepcao.Create(True);
  thrSalva.FreeOnTerminate := True;
  thrSalva.Priority := tpNormal;
  thrSalva.Start;
end;

procedure TfrmRecepcaoHermes.cxNossoNumeroPropertiesEditValueChanged
  (Sender: TObject);
begin
  cxNossoNumero.Clear;
  cxNossoNumero.SetFocus;
end;

procedure TfrmRecepcaoHermes.cxNossoNumeroPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  LocalizaEntrega;
end;

procedure TfrmRecepcaoHermes.cxPageControl1PageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  if dm.TbRecepcao.Active then
  begin
    dm.TbRecepcao.Close
  end;
  dm.TbRecepcao.Open;
end;

procedure TfrmRecepcaoHermes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if dm.TbRecepcao.Active then
  begin
    dm.TbRecepcao.Close;
  end;
  entrega.Free;
  conexao.Free;
  Action := caFree;
  frmRecepcaoHermes := Nil;
end;

procedure TfrmRecepcaoHermes.FormShow(Sender: TObject);
begin
  entrega := TEntrega.Create;
  conexao := TConexao.Create;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    actRecepcaoSairExecute(Sender);
    Exit;
  end;
  if dm.TbRecepcao.Active then
  begin
    dm.TbRecepcao.Close;
  end;
  dm.TbRecepcao.Open;
  cxNossoNumero.SetFocus;
end;

procedure TfrmRecepcaoHermes.LocalizaEntrega;
var
  sMess, sNossoNumero: String;
begin
  try
    sMess := '';
    sNossoNumero := Trim(cxNossoNumero.Text);
    if TUtil.Empty(sNossoNumero) then
    begin
      Exit;
    end;
    if entrega.getObject(sNossoNumero, 'NOSSONUMERO') then
    begin
      if entrega.Baixado = 'S' then
      begin
        Application.MessageBox('Entrega já foi baixada!', 'Atenção',
          MB_OK + MB_ICONEXCLAMATION);
        Exit;
      end;
      if entrega.Recebido = 'S' then
      begin
        Application.MessageBox('Entrega já Recebida.', 'Atenção',
          MB_OK + MB_ICONEXCLAMATION);
        Exit;
      end;
      if entrega.Entregador > 0 then
      begin
        if Application.MessageBox('Entrega já Atribuida!', 'Atenção',
          MB_YESNO + MB_ICONQUESTION) = IDNO then
        begin
          Exit;
        end;
      end;
      if entrega.Cliente <> 99991 then
      begin
        Application.MessageBox('Entrega não pertence a este cliente!',
          'Atenção', MB_OK + MB_ICONEXCLAMATION);
        Exit;
      end;
      if VerificaGrade(sNossoNumero) then
      begin
        Exit;
      end;
    end
    else if entrega.getObject(Copy(sNossoNumero, 1, Length(sNossoNumero) - 2),
      'NOSSONUMERO') then
    begin
      if entrega.Baixado = 'S' then
      begin
        Application.MessageBox('Entrega já foi baixada!', 'Atenção',
          MB_OK + MB_ICONEXCLAMATION);
        Exit;
      end;
      if entrega.Recebido = 'S' then
      begin
        Application.MessageBox('Entrega já Recebida.', 'Atenção',
          MB_OK + MB_ICONEXCLAMATION);
        Exit;
      end;
      if entrega.Entregador > 0 then
      begin
        if Application.MessageBox('Entrega já Atribuida!', 'Atenção',
          MB_YESNO + MB_ICONQUESTION) = IDNO then
        begin
          Exit;
        end;
      end;
      if entrega.Cliente <> 99991 then
      begin
        Application.MessageBox('Entrega não pertence a este cliente!',
          'Atenção', MB_OK + MB_ICONEXCLAMATION);
        Exit;
      end;
      if VerificaGrade(Copy(sNossoNumero, 1, Length(sNossoNumero) - 2)) then
      begin
        Exit;
      end;
    end
    else
    begin
      Application.MessageBox('Entrega não localizada!', 'Atenção',
        MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
    with dm do
    begin
      TbRecepcao.Insert;
      TbRecepcaoNUM_MANIFESTO.Value := entrega.Manifesto;
      TbRecepcaoNUM_CTRC.Value := entrega.Ctrc;
      tbRecepcaoNUM_NOSSONUMERO.Value := entrega.NossoNumero;
      tbRecepcaoNOM_CONSUMIDOR.Value := entrega.Consumidor;
      tbRecepcaoDES_ENDERECO.Value := entrega.Endereco;
      tbRecepcaoDES_COMPLEMENTO.Value := entrega.Complemento;
      tbRecepcaoDES_BAIRRO.Value := entrega.Bairro;
      tbRecepcaoNOM_CIDADE.Value := entrega.Cidade;
      tbRecepcaoNUM_CEP.Value := entrega.Cep;
      tbRecepcaoQTD_VOLUMES.Value := entrega.Volumes;
      tbRecepcaoQTD_PESO_REAL.Value := entrega.PesoReal;
      TbRecepcao.Post;
    end;
  finally
    cxNossoNumero.SetFocus;
  end;
end;

function TfrmRecepcaoHermes.VerificaGrade(sNossoNumero: String): Boolean;
begin
  Result := False;
  with dm.TbRecepcao do
  begin
    if IsEmpty then
    begin
      Exit;
    end;
    if not(Active) then
    begin
      Exit;
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

end.
