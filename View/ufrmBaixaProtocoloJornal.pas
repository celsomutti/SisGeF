unit ufrmBaixaProtocoloJornal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxLabel, dxSkinscxPCPainter, dxBarBuiltInMenu, cxTextEdit, cxMaskEdit, cxPC, clAssinantes,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, dxmdaset, System.Actions, Vcl.ActnList, Vcl.Menus,
  Vcl.StdCtrls, cxButtons, Vcl.ComCtrls, dxCore, cxDateUtils, cxDropDownEdit, cxCalendar, clTipoAssinatura, clProdutos,
  cxDBLookupComboBox, clAtribuicoesJornal, clEntregador;

type
  TfrmBaixaProtocoloJornal = class(TForm)
    cxLabel27: TcxLabel;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxLabel3: TcxLabel;
    cxNossoNumero: TcxMaskEdit;
    tbAssinantes: TdxMemData;
    tbAssinantesID_ASSINANTE: TIntegerField;
    tbAssinantesCOD_ASSINANTE: TWideStringField;
    tbAssinantesCOD_PRODUTO: TWideStringField;
    tbAssinantesCOD_TIPO_ASSINATURA: TWideStringField;
    tbAssinantesNUM_ROTEIRO: TIntegerField;
    tbAssinantesNUM_EDICAO: TWideStringField;
    tbAssinantesDAT_EDICAO: TDateField;
    tbAssinantesNOM_ASSINANTE: TWideStringField;
    tbAssinantesNOM_CUIDADOS: TWideStringField;
    tbAssinantesDES_ENDERECO: TWideStringField;
    tbAssinantesDES_COMPLEMENTO: TWideStringField;
    tbAssinantesDES_BAIRRO: TWideStringField;
    tbAssinantesDES_REFERENCIA: TWideStringField;
    tbAssinantesDES_CIDADE: TWideStringField;
    tbAssinantesDES_UF: TWideStringField;
    tbAssinantesCEP_ENDERECO: TWideStringField;
    tbAssinantesQTD_EXEMPLARES: TIntegerField;
    tbAssinantesCOD_BARRA: TWideStringField;
    tbAssinantesDOM_PROTOCOLO: TWideStringField;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dsAssinantes: TDataSource;
    cxGrid1DBTableView1RecId: TcxGridDBColumn;
    cxGrid1DBTableView1ID_ASSINANTE: TcxGridDBColumn;
    cxGrid1DBTableView1COD_ASSINANTE: TcxGridDBColumn;
    cxGrid1DBTableView1COD_PRODUTO: TcxGridDBColumn;
    cxGrid1DBTableView1COD_TIPO_ASSINATURA: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_ROTEIRO: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_EDICAO: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_EDICAO: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_ASSINANTE: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_CUIDADOS: TcxGridDBColumn;
    cxGrid1DBTableView1DES_ENDERECO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_COMPLEMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_BAIRRO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_REFERENCIA: TcxGridDBColumn;
    cxGrid1DBTableView1DES_CIDADE: TcxGridDBColumn;
    cxGrid1DBTableView1DES_UF: TcxGridDBColumn;
    cxGrid1DBTableView1CEP_ENDERECO: TcxGridDBColumn;
    cxGrid1DBTableView1QTD_EXEMPLARES: TcxGridDBColumn;
    cxGrid1DBTableView1COD_BARRA: TcxGridDBColumn;
    cxGrid1DBTableView1DOM_PROTOCOLO: TcxGridDBColumn;
    tbAssinantesDOM_BAIXA: TStringField;
    aclBaixa: TActionList;
    actBaixaSair: TAction;
    cxButton1: TcxButton;
    actBaixaLimpar: TAction;
    cxTabSheet2: TcxTabSheet;
    cxLabel1: TcxLabel;
    cxDataInicial: TcxDateEdit;
    cxLabel2: TcxLabel;
    cxDataFinal: TcxDateEdit;
    actBaixaProcessar: TAction;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    dsProdutos: TDataSource;
    dsTipos: TDataSource;
    tbAssinantesCOD_ENTREGADOR: TIntegerField;
    cxGrid1DBTableView1DOM_BAIXA: TcxGridDBColumn;
    cxGrid1DBTableView1COD_ENTREGADOR: TcxGridDBColumn;
    dsEntregador: TDataSource;
    tbAssinantesNOM_RECEBEDOR: TStringField;
    tbAssinantesDES_GRAU_RELACIONAMENTO: TStringField;
    cxGrid1DBTableView1NOM_RECEBEDOR: TcxGridDBColumn;
    cxGrid1DBTableView1DES_GRAU_RELACIONAMENTO: TcxGridDBColumn;
    procedure cxNossoNumeroPropertiesEditValueChanged(Sender: TObject);
    procedure cxNossoNumeroPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actBaixaSairExecute(Sender: TObject);
    procedure actBaixaLimparExecute(Sender: TObject);
    procedure cxTabSheet2Show(Sender: TObject);
    procedure cxTabSheet1Show(Sender: TObject);
    procedure actBaixaProcessarExecute(Sender: TObject);
    procedure dsAssinantesStateChange(Sender: TObject);
  private
    { Private declarations }
    procedure LocalizaEntrega;
    procedure PopulaTipos;
    procedure PopulaProdutos;
    procedure PopulaAssinaturas;
    procedure PopularEntregadores;
    function VerificaGrade(): Boolean;
  public
    { Public declarations }
  end;

var
  frmBaixaProtocoloJornal: TfrmBaixaProtocoloJornal;
  assinante: TAssinantes;
  tipo: TTipoAssinatura;
  produtos: TProdutos;
  entregador: TEntregador;
  atribuicoes: TAtribuicoes;

implementation

{$R *.dfm}

uses udm, uGlobais, clUtil, ufrmDadosProtocolo;

procedure TfrmBaixaProtocoloJornal.actBaixaLimparExecute(Sender: TObject);
begin
  tbAssinantes.Close;
  tbAssinantes.Open;
end;

procedure TfrmBaixaProtocoloJornal.actBaixaProcessarExecute(Sender: TObject);
begin
  if  (TUtil.Empty(cxDataInicial.Text)) or (cxDataInicial.Date = 0)  then
  begin
    Application.MessageBox('Informe a data inicial!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
    cxDataInicial.SetFocus;
    Exit;
  end;
  if  (TUtil.Empty(cxDataFinal.Text)) or (cxDataFinal.Date = 0)  then
  begin
    Application.MessageBox('Informe a data final!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
    cxDataFinal.SetFocus;
    Exit;
  end;
  if cxDataFinal.Date < cxDataInicial.Date then
  begin
    Application.MessageBox('Data final informada é menor que a Data inicial!',
                           PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
    cxDataFinal.SetFocus;
    Exit;
  end;
  PopulaAssinaturas;
end;

procedure TfrmBaixaProtocoloJornal.actBaixaSairExecute(Sender: TObject);
begin
  try
    Perform(WM_CLOSE, 0, 0);
  except
    on E: Exception do
      MessageDlg(E.Message, mtError, mbOKCancel, 0);
  end;
end;

procedure TfrmBaixaProtocoloJornal.cxNossoNumeroPropertiesEditValueChanged(Sender: TObject);
begin
  cxNossoNumero.Clear;
  cxNossoNumero.SetFocus;
end;

procedure TfrmBaixaProtocoloJornal.cxNossoNumeroPropertiesValidate(Sender: TObject; var DisplayValue: Variant;
  var ErrorText: TCaption; var Error: Boolean);
begin
  if not(VerificaGrade()) then
  begin
    LocalizaEntrega;
  end;
end;

procedure TfrmBaixaProtocoloJornal.cxTabSheet1Show(Sender: TObject);
begin
  tbAssinantes.Close;
  tbAssinantes.Open;
  cxGrid1DBTableView1COD_ENTREGADOR.Visible := False;
  cxGrid1DBTableView1NOM_RECEBEDOR.Visible := True;
  cxGrid1DBTableView1DES_GRAU_RELACIONAMENTO.Visible := True;
end;

procedure TfrmBaixaProtocoloJornal.cxTabSheet2Show(Sender: TObject);
begin
  tbAssinantes.Close;
  tbAssinantes.Open;
  cxGrid1DBTableView1COD_ENTREGADOR.Visible := True;
  cxGrid1DBTableView1NOM_RECEBEDOR.Visible := False;
  cxGrid1DBTableView1DES_GRAU_RELACIONAMENTO.Visible := False;
end;

procedure TfrmBaixaProtocoloJornal.dsAssinantesStateChange(Sender: TObject);
begin
  if TDataSource(Sender).State in [dsBrowse] then
  begin
    actBaixaLimpar.Enabled := True;
  end
  else
  begin
    actBaixaLimpar.Enabled := False;
  end;
  if tbAssinantes.IsEmpty then
  begin
    actBaixaLimpar.Enabled := False;
  end
  else
    begin
    actBaixaLimpar.Enabled := True;
  end;
end;

procedure TfrmBaixaProtocoloJornal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  atribuicoes.Free;
  assinante.Free;
  tipo.Free;
  produtos.Free;
  entregador.Free;
  tbAssinantes.Close;
  Action := caFree;
  frmBaixaProtocoloJornal := Nil;
end;

procedure TfrmBaixaProtocoloJornal.FormShow(Sender: TObject);
begin
  atribuicoes := TAtribuicoes.Create;
  entregador := TEntregador.Create;
  tipo := TTipoAssinatura.Create;
  produtos := TProdutos.Create;
  assinante := TAssinantes.Create;
  PopulaTipos;
  PopulaProdutos;
  PopularEntregadores;
  if tbAssinantes.Active then
  begin
    tbAssinantes.Close;
  end;
  tbAssinantes.Open;
  cxDataInicial.Date := Now;
  cxDataFinal.Date := Now;
end;

procedure TfrmBaixaProtocoloJornal.LocalizaEntrega;
var
  sMess, sNossoNumero, sRecebedor, sGrau, sNN: String;
  bFlagSave: Boolean;
begin
  try
    sMess := '';
    sNossoNumero := Trim(cxNossoNumero.Text);
    if sNossoNumero.IsEmpty then
    begin
      Exit;
    end;
    sNN := FormatFloat('0000000000',StrToInt(sNossoNumero));
    sNossoNumero := sNN;
    if assinante.getObject(sNossoNumero, 'BARRA') then
    begin
      if assinante.Protocolo <> 'S' then
      begin
        Application.MessageBox('Protocolo não solicitado para esta Assinatura!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
        dm.qryGetObject1.Close;
        dm.qryGetObject1.SQL.Clear;
        Exit;
      end;
      if assinante.Baixa = 'S' then
      begin
        Application.MessageBox('Protocolo já Baixado!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
        dm.qryGetObject1.Close;
        dm.qryGetObject1.SQL.Clear;
        Exit;
      end;
      dm.qryGetObject1.Close;
      dm.qryGetObject1.SQL.Clear;
      sRecebedor := '';
      sGrau := '';
      if not Assigned(frmDadosProtocolo) then
      begin
        frmDadosProtocolo := TfrmDadosProtocolo.Create(Application);
      end;
      if frmDadosProtocolo.ShowModal = mrCancel then
      begin
        FreeAndNil(frmDadosProtocolo);
        Exit;
      end;
      sRecebedor := frmDadosProtocolo.cxNomeRecebedor.Text;
      sGrau := frmDadosProtocolo.cxGrau.Text;
      FreeAndNil(frmDadosProtocolo);
      tbAssinantes.Insert;
      tbAssinantesNOM_RECEBEDOR.Value := sRecebedor;
      tbAssinantesDES_GRAU_RELACIONAMENTO.Value := sGrau;
      tbAssinantesID_ASSINANTE.Value := assinante.Id;
      tbAssinantesCOD_ASSINANTE.Value := assinante.Codigo;
      tbAssinantesCOD_PRODUTO.Value := assinante.Produto;
      tbAssinantesCOD_TIPO_ASSINATURA.Value := assinante.Tipo;
      tbAssinantesNUM_EDICAO.Value := assinante.Edicao;
      tbAssinantesDAT_EDICAO.Value := assinante.Data;
      tbAssinantesNOM_ASSINANTE.Value := assinante.Nome;
      tbAssinantesNOM_CUIDADOS.Value := assinante.Cuidados;
      tbAssinantesDES_ENDERECO.Value := assinante.Endereco;
      tbAssinantesDES_COMPLEMENTO.Value := assinante.Complemento;
      tbAssinantesDES_BAIRRO.Value := assinante.Bairro;
      tbAssinantesDES_REFERENCIA.Value := assinante.Referencia;
      tbAssinantesDES_CIDADE.Value := assinante.Cidade;
      tbAssinantesDES_UF.Value := assinante.UF;
      tbAssinantesCEP_ENDERECO.Value := assinante.CEP;
      tbAssinantesNUM_ROTEIRO.Value := assinante.Roteiro;
      tbAssinantesQTD_EXEMPLARES.Value := assinante.Quantidade;
      tbAssinantesCOD_BARRA.Value := assinante.Barra;
      tbAssinantesDOM_PROTOCOLO.Value := assinante.Protocolo;
      tbAssinantesDOM_BAIXA.Value :=  assinante.Baixa;
      tbAssinantes.Post;
      assinante.Baixa := 'S';
      assinante.Recebedor := sRecebedor;
      assinante.Grau := sGrau;
      if (not assinante.Update) then
      begin
        Application.MessageBox('Erro ao Baixar o Protocolo!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
        Exit;
      end;
      cxGrid1.Refresh;
    end
    else
    begin
      Application.MessageBox('Assinatura não localizada!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
  finally
    dm.qryGetObject1.Close;
    dm.qryGetObject1.SQL.Clear;
    cxNossoNumero.Clear;
    cxNossoNumero.SetFocus;
  end;
end;

function TfrmBaixaProtocoloJornal.VerificaGrade(): Boolean;
var
  sNossoNumero: String;
begin
  Result := False;
  sNossoNumero := Trim(cxNossoNumero.Text);
  if (not tbAssinantes.Active) then
  begin
    Exit;
  end;
  if tbAssinantes.IsEmpty then
  begin
    Exit;
  end;
  if tbAssinantes.Locate('ID_ASSINANTE',StrToInt(sNossoNumero),[]) then
  begin
    Application.MessageBox(PChar('ID ' + sNossoNumero + ' já Baixado!'),
                           PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
    Result := True;
  end;
end;

procedure TfrmBaixaProtocoloJornal.PopulaAssinaturas;
var
  sSQL: String;
begin
  sSQL := '';
  if tbAssinantes.Active then
  begin
    tbAssinantes.Close;
  end;
  tbAssinantes.Open;
  sSQL := 'DAT_EDICAO BETWEEN ' + QuotedStr(FormatDateTime('yyyy-mm-dd', cxDataInicial.Date)) + ' AND ' +
          QuotedStr(FormatDateTime('yyyy-mm-dd', cxDataFinal.Date)) + ' AND DOM_PROTOCOLO = ' + QuotedStr('S') +
          ' AND DOM_BAIXA <> ' + QuotedStr('S') + ' ORDER BY DAT_EDICAO DESC';
  if (not assinante.getObject(sSQL, 'FILTRO')) then
  begin
    Application.MessageBox(PChar('Edições de ' + cxDataInicial.Text + ' e ' + cxDataFinal.Text + ' não foram encontradas!'),
                           PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  Screen.Cursor := crHourGlass;
  tbAssinantes.LoadFromDataSet(dm.qryGetObject1);
  dm.qryGetObject1.Close;
  dm.qryGetObject1.SQL.Clear;
  if (not tbAssinantes.IsEmpty) then
  begin
    tbAssinantes.First
  end;
  while (not tbAssinantes.Eof) do
  begin
    if atribuicoes.getObject(tbAssinantesID_ASSINANTE.AsString, 'ID') then
    begin
      tbAssinantes.Edit;
      tbAssinantesCOD_ENTREGADOR.Value := atribuicoes.Entregador;
      tbAssinantes.Post;
    end
    else
    begin
      tbAssinantes.Edit;
      tbAssinantesCOD_ENTREGADOR.Value := 0;
      tbAssinantes.Post;
    end;
    tbAssinantes.Next;
  end;
  tbAssinantes.First;
  Screen.Cursor := crDefault;
end;

procedure TfrmBaixaProtocoloJornal.PopulaTipos;
begin
  dm.tbTipoAssinatura.Close;
  dm.tbTipoAssinatura.Open;
  dm.tbTipoAssinatura.IsLoading := True;
  if tipo.getObjects() then
  begin
    dm.tbTipoAssinatura.LoadFromDataSet(dm.qryGetObject1);
  end;
  dm.tbTipoAssinatura.IsLoading := False;
  dm.qryGetObject1.Close;
  dm.qryGetObject1.SQL.Clear;
end;

procedure TfrmBaixaProtocoloJornal.PopulaProdutos;
begin
  dm.tbProdutos.Close;
  dm.tbProdutos.Open;
  dm.tbProdutos.IsLoading := True;
  if produtos.getObjects() then
  begin
    dm.tbProdutos.LoadFromDataSet(dm.qryGetObject1);
  end;
  dm.tbProdutos.IsLoading := False;
  dm.qryGetObject1.Close;
  dm.qryGetObject1.SQL.Clear;
end;

procedure TfrmBaixaProtocoloJornal.PopularEntregadores;
var
  sSQL: String;
begin
  sSQL := '';
  sSQL := 'DOM_FUNCIONARIO IN (' + QuotedStr('1') + ',' + QuotedStr('2') + ',' + QuotedStr('T') + ',' + QuotedStr('P') + ')';
  dm.tbCadastro.Close;
  dm.tbCadastro.Open;
  dm.tbCadastro.IsLoading := True;
  if entregador.getObject(sSQL, 'FILTRO') then
  begin
    dm.tbCadastro.LoadFromDataSet(dm.qryGetObject);
    if (not dm.tbCadastro.IsEmpty) then
    begin
      dm.tbCadastro.First;
    end;
  end;
  dm.tbCadastro.IsLoading := False;
  dm.qryGetObject.Close;
  dm.qryGetObject.SQL.Clear;
end;

end.
