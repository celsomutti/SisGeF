unit ufrmLacres;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans,
  dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp,
  dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid,  cxPC, cxContainer, cxTextEdit,
  cxLabel, dxmdaset, Menus, StdCtrls, cxButtons,
  ActnList, clLacres, cxNavigator, cxImage, Vcl.ExtCtrls, cxGridExportLink,
  ShellAPI, cxSpinEdit, cxCheckBox, cxCurrencyEdit,
  cxGroupBox, cxRadioGroup, cxMaskEdit, cxButtonEdit, cxImageComboBox,
  clAgentes, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  System.Actions, clAcessos, clConexao, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxDateRanges, cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TfrmLacres = class(TForm)
    tbLacres: TdxMemData;
    ds: TDataSource;
    aclCadastro: TActionList;
    actCadastroIncluir: TAction;
    actCadastroEditar: TAction;
    actCadastroExcluir: TAction;
    actCadastroCancelar: TAction;
    actCadastroSalvar: TAction;
    actCadastroImprimir: TAction;
    actCadastroLocalizar: TAction;
    actCadastroSair: TAction;
    actCadastroExcluirEndereco: TAction;
    actCadastroListaApoio: TAction;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    actCadastroExportar: TAction;
    SaveDialog: TSaveDialog;
    cxLabel16: TcxLabel;
    cxGroupBox1: TcxGroupBox;
    tbLacresCOD_BASE: TIntegerField;
    tbLacresNUM_LACRE: TStringField;
    tbLacresCOD_STATUS: TIntegerField;
    tbLacresNOM_USUARIO: TStringField;
    tbLacresDAT_MANUTENCAO: TDateTimeField;
    cxGrid1DBTableView1NUM_LACRE: TcxGridDBColumn;
    cxGrid1DBTableView1COD_STATUS: TcxGridDBColumn;
    cxLabel1: TcxLabel;
    cxCodigoAgente: TcxButtonEdit;
    cxNomeAgente: TcxTextEdit;
    cxRadioGroup1: TcxRadioGroup;
    tbLacresDOM_OPERACAO: TIntegerField;
    cxGrid1DBTableView1DOM_OPERACAO: TcxGridDBColumn;
    cxLabel2: TcxLabel;
    cxNumero: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxNumeroFinal: TcxTextEdit;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxButton5: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actCadastroSairExecute(Sender: TObject);
    procedure actCadastroExportarExecute(Sender: TObject);
    procedure cxRadioGroup1PropertiesChange(Sender: TObject);
    procedure actCadastroListaApoioExecute(Sender: TObject);
    procedure actCadastroCancelarExecute(Sender: TObject);
    procedure cxCodigoAgentePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxCodigoAgentePropertiesChange(Sender: TObject);
    procedure actCadastroSalvarExecute(Sender: TObject);
    procedure actCadastroExcluirExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AtualizaGrid;
    procedure ListaAgente;
    procedure ListaLacres;
    procedure SalvaIndividual;
    procedure SalvaIntervalo;
    procedure ExcluirLacre;
  end;

var
  frmLacres: TfrmLacres;
  agente: TAgente;
  lacre: TLacre;
  sOperacao: String;
  acessos: TAcessos;
  conexao: TConexao;

implementation

{$R *.dfm}

uses
  udm, clUtil, ufrmListaApoio, uGlobais;

procedure TfrmLacres.FormShow(Sender: TObject);
begin
  lacre := TLacre.Create;
  agente := TAgente.Create;
  acessos := TAcessos.Create;
  conexao := TConexao.Create;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    actCadastroSairExecute(Sender);
    Exit;
  end;
  acessos.SetNivel(aclCadastro);
  sOperacao := '';
end;

procedure TfrmLacres.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tbLacres.Close;
  lacre.Free;
  agente.Free;
  acessos.Free;
  conexao.Free;
  Action := caFree;
  frmLacres := Nil;
end;

procedure TfrmLacres.AtualizaGrid;
begin
  if (not lacre.getObject(cxCodigoAgente.Text, 'BASE')) then
  begin
    Exit;
  end;
  if not(dm.qryGetObject.IsEmpty) then
  begin
    dm.qryGetObject.First;
  end;
  if tbLacres.Active then
  begin
    tbLacres.Close;
  end;
  tbLacres.IsLoading := True;
  tbLacres.Open;
  while not(dm.qryGetObject.Eof) do
  begin
    tbLacres.Insert;
    tbLacresCOD_BASE.Value := dm.qryGetObject.FieldByName('COD_BASE').AsInteger;
    tbLacresNUM_LACRE.Value := dm.qryGetObject.FieldByName('NUM_LACRE')
      .AsString;
    tbLacresCOD_STATUS.Value := dm.qryGetObject.FieldByName('DOM_AGREGACAO')
      .AsInteger;
    tbLacresNOM_USUARIO.Value := dm.qryGetObject.FieldByName
      ('COD_STATUS').AsString;
    tbLacresDAT_MANUTENCAO.Value := dm.qryGetObject.FieldByName
      ('DAT_MANUTENCAO').AsDateTime;
    tbLacresDOM_OPERACAO.Value := dm.qryGetObject.FieldByName('DOM_OPERACAO')
      .AsInteger;
    tbLacres.Post;
    dm.qryGetObject.Next;
  end;

  dm.qryGetObject.Close;
  dm.qryGetObject.SQL.Clear;

  if not(tbLacres.IsEmpty) then
  begin
    tbLacres.First;
  end;
  tbLacres.IsLoading := False;
end;

procedure TfrmLacres.cxCodigoAgentePropertiesChange(Sender: TObject);
begin
  tbLacres.Close;
  cxNomeAgente.Clear;
  cxNumero.Clear;
  cxNumeroFinal.Clear;
  cxLabel3.Visible := False;
  cxNumeroFinal.Visible := False;
  cxRadioGroup1.ItemIndex := 0;
  cxCodigoAgente.SetFocus;
end;

procedure TfrmLacres.cxCodigoAgentePropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if tbLacres.IsLoading then
  begin
    Exit;
  end;
  if TUtil.Empty(cxCodigoAgente.Text) then
  begin
    cxCodigoAgente.Text := '0';
    Exit;
  end;
  if agente.getObject(cxCodigoAgente.Text, 'CODIGO') then
  begin
    cxNomeAgente.Text := agente.Fantasia;
  end
  else
  begin
    cxNomeAgente.Text := 'AGENTE NÃO CADASTRADO';
  end;
  ListaLacres;
  cxNumero.SetFocus;
end;

procedure TfrmLacres.cxRadioGroup1PropertiesChange(Sender: TObject);
begin
  if cxRadioGroup1.ItemIndex = 0 then
  begin
    cxLabel3.Visible := False;
    cxNumeroFinal.Visible := False;
  end
  else if cxRadioGroup1.ItemIndex = 1 then
  begin
    cxLabel3.Visible := True;
    cxNumeroFinal.Visible := True;
  end
end;

procedure TfrmLacres.actCadastroCancelarExecute(Sender: TObject);
begin
  tbLacres.Close;
  cxCodigoAgente.Clear;
  cxNomeAgente.Clear;
  cxNumero.Clear;
  cxNumeroFinal.Clear;
  cxLabel3.Visible := False;
  cxNumeroFinal.Visible := False;
  cxRadioGroup1.ItemIndex := 0;
  cxCodigoAgente.SetFocus;
end;

procedure TfrmLacres.actCadastroExcluirExecute(Sender: TObject);
begin
  if Application.MessageBox('Confirma a Exclusão dos dados?', 'Salvar',
    MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  ExcluirLacre;
end;

procedure TfrmLacres.actCadastroExportarExecute(Sender: TObject);
var
  FileExt, sFile: String;
begin
  if not(tbLacres.Active) then
  begin
    Exit;
  end;
  if tbLacres.IsEmpty then
  begin
    Exit;
  end;
  sFile := 'servicos';
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
      ExportGridToExcel(SaveDialog.FileName, cxGrid1, False)
    else if FileExt = '.xml' then
      ExportGridToXML(SaveDialog.FileName, cxGrid1, False)
    else if FileExt = '.txt' then
      ExportGridToText(SaveDialog.FileName, cxGrid1, False)
    else if FileExt = '.html' then
      ExportGridToHTML(SaveDialog.FileName, cxGrid1, False);
    ShellExecute(Handle, 'open', pchar(SaveDialog.FileName), nil, nil, SW_SHOW);
  end;
end;

procedure TfrmLacres.actCadastroListaApoioExecute(Sender: TObject);
begin
  ListaAgente;
end;

procedure TfrmLacres.actCadastroSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmLacres.actCadastroSalvarExecute(Sender: TObject);
begin
  if Application.MessageBox('Confirma salvar os dados?', 'Salvar',
    MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  if cxRadioGroup1.ItemIndex = 0 then
  begin
    SalvaIndividual;
  end
  else
  begin
    SalvaIntervalo;
  end;

end;

procedure TfrmLacres.ListaAgente;
var
  sId: String;
begin
  sId := '';
  Screen.Cursor := crHourGlass;
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
  Screen.Cursor := crDefault;
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

procedure TfrmLacres.ListaLacres;
var
  sMess: String;
begin
  try
    tbLacres.IsLoading := True;
    if not(lacre.getObject(cxCodigoAgente.Text, 'BASE')) then
    begin
      Exit;
    end;
    tbLacres.Close;
    tbLacres.Open;
    while (not dm.qryGetObject.Eof) do
    begin
      tbLacres.Insert;
      tbLacresCOD_BASE.Value := dm.qryGetObject.FieldByName('COD_BASE')
        .AsInteger;
      tbLacresNUM_LACRE.Value := dm.qryGetObject.FieldByName
        ('NUM_LACRE').AsString;
      tbLacresCOD_STATUS.Value := dm.qryGetObject.FieldByName('COD_STATUS')
        .AsInteger;
      tbLacresNOM_USUARIO.Value := dm.qryGetObject.FieldByName
        ('NOM_USUARIO').AsString;
      tbLacresDAT_MANUTENCAO.Value := dm.qryGetObject.FieldByName
        ('DAT_MANUTENCAO').AsDateTime;
      tbLacres.Post;
      dm.qryGetObject.Next;
    end;
  finally
    if (not tbLacres.IsEmpty) then
    begin
      tbLacres.First;
    end;
    tbLacres.IsLoading := False;
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
  end;
end;

procedure TfrmLacres.SalvaIndividual;
begin
  if (not tbLacres.Active) then
  begin
    tbLacres.Open;
  end;
  if tbLacres.Locate('NUM_LACRE', cxNumero.Text, []) then
  begin
    Application.MessageBox('Lacre já cadastrado para esta Base!', 'Atenção!',
      MB_OK + MB_ICONWARNING);
    cxNumero.SetFocus;
    Exit;
  end;
  tbLacres.Insert;
  lacre.Base := StrToInt(cxCodigoAgente.Text);
  tbLacresCOD_BASE.Value := lacre.Base;
  lacre.Numero := cxNumero.Text;
  tbLacresNUM_LACRE.Value := lacre.Numero;
  lacre.Status := 0;
  tbLacresCOD_STATUS.Value := lacre.Status;
  lacre.Usuario := uGlobais.sUsuario;
  tbLacresNOM_USUARIO.Value := lacre.Usuario;
  lacre.Manutencao := Now;
  tbLacresDAT_MANUTENCAO.Value := lacre.Manutencao;
  tbLacresDOM_OPERACAO.Value := 0;
  if (not lacre.Insert) then
  begin
    tbLacres.Cancel;
  end
  else
  begin
    tbLacres.Post;
    tbLacres.First;
  end;
end;

procedure TfrmLacres.SalvaIntervalo;
var
  iInicio, iFinal, i: Integer;
begin
  iInicio := 0;
  iFinal := 0;
  i := 0;
  if (not TryStrToInt(cxNumero.Text, iInicio)) then
  begin
    Application.MessageBox('Informe um valor númérico no campo "Número"!',
      'Atenção', MB_OK + MB_ICONWARNING);
    cxNumero.SetFocus;
    Exit;
  end;
  if (not TryStrToInt(cxNumeroFinal.Text, iFinal)) then
  begin
    Application.MessageBox('Informe um valor númérico no campo "Número Final"!',
      'Atenção', MB_OK + MB_ICONWARNING);
    cxNumeroFinal.SetFocus;
    Exit;
  end;
  tbLacres.Open;
  for i := iInicio to iFinal do
  begin
    if not(tbLacres.Locate('NUM_LACRE', IntToStr(i), [])) then
    begin
      tbLacres.Insert;
      lacre.Base := StrToInt(cxCodigoAgente.Text);
      tbLacresCOD_BASE.Value := lacre.Base;
      lacre.Numero := IntToStr(i);
      tbLacresNUM_LACRE.Value := lacre.Numero;
      lacre.Status := 0;
      tbLacresCOD_STATUS.Value := lacre.Status;
      lacre.Usuario := uGlobais.sUsuario;
      tbLacresNOM_USUARIO.Value := lacre.Usuario;
      lacre.Manutencao := Now;
      tbLacresDAT_MANUTENCAO.Value := lacre.Manutencao;
      tbLacresDOM_OPERACAO.Value := 0;
      if (not lacre.Insert) then
      begin
        tbLacres.Cancel;
      end
      else
      begin
        tbLacres.Post;
        tbLacres.First;
      end;
    end;
  end;
end;

procedure TfrmLacres.ExcluirLacre;
begin
  tbLacres.First;
  while (not tbLacres.Eof) do
  begin
    if tbLacresDOM_OPERACAO.Value = 1 then
    begin
      if tbLacresCOD_STATUS.Value = 0 then
      begin
        tbLacres.Insert;
        lacre.Base := tbLacresCOD_BASE.Value;
        lacre.Numero := tbLacresNUM_LACRE.Value;
        if lacre.Delete('NUMERO') then
        begin
          tbLacres.Delete;
        end;
      end;
    end;
    if (not tbLacres.IsEmpty) then
    begin
      tbLacres.Next;
    end;
  end;
  if (not tbLacres.IsEmpty) then
  begin
    tbLacres.Next;
  end;
end;

end.
