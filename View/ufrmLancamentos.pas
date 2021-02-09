unit ufrmLancamentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxSkinsdxBarPainter, dxBar, cxClasses, ActnList, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, DB, dxmdaset, cxTextEdit, cxDBEdit, cxLabel, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxCurrencyEdit,
  cxSpinEdit, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxDBData, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxCheckBox,
  clCodigosEntregadores, clLancamentos, Menus,
  StdCtrls, cxButtons, cxPC, cxButtonEdit, cxCalc, cxImage,
  ExtCtrls, cxNavigator, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxGridExportLink, ShellAPI, dxSkinsdxStatusBarPainter,
  dxStatusBar, cxProgressBar, cxImageComboBox,
  uthrPopularLancamentos, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxBarBuiltInMenu, System.Actions, clAcessos, clConexao, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxDateRanges,
  cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TfrmLancamentos = class(TForm)
    aclCadastro: TActionList;
    actCadastroIncluir: TAction;
    actCadastroEditar: TAction;
    actCadastroExcluir: TAction;
    actCadastroCancelar: TAction;
    actCadastroSalvar: TAction;
    actCadastroImprimir: TAction;
    actCadastroLocalizar: TAction;
    actCadastroSair: TAction;
    actCadastroListaApoio: TAction;
    ds: TDataSource;
    actCadastroRecorrencia: TAction;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1COD_LANCAMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_LANCAMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_LANCAMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_ENTREGADOR: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_LANCAMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1DOM_DESCONTO: TcxGridDBColumn;
    cxGrid1DBTableView1DAT_DESCONTO: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_EXTRATO: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxLabel1: TcxLabel;
    cxCodigoCredito: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxDescricaoCredito: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxDataCredito: TcxDateEdit;
    cxLabel9: TcxLabel;
    cxNomeEntregadorCredito: TcxTextEdit;
    cxLabel5: TcxLabel;
    cxEntregadorCredito: TcxButtonEdit;
    cxPersistirCredito: TcxCheckBox;
    cxTabSheet2: TcxTabSheet;
    cxGrid1DBTableView1VAL_DEBITO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_TIPO: TcxGridDBColumn;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxButton5: TcxButton;
    cxLabel4: TcxLabel;
    cxCodigoDebito: TcxTextEdit;
    cxLabel6: TcxLabel;
    cxDescricaoDebito: TcxTextEdit;
    cxLabel7: TcxLabel;
    cxDataDebito: TcxDateEdit;
    cxLabel8: TcxLabel;
    cxNomeEntregadorDebito: TcxTextEdit;
    cxLabel10: TcxLabel;
    cxEntregadorDebito: TcxButtonEdit;
    cxPersistirDebito: TcxCheckBox;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    cxValorCredito: TcxCalcEdit;
    cxValorDebito: TcxCalcEdit;
    cxDescontado: TcxTextEdit;
    actCadastroExportar: TAction;
    cxButton7: TcxButton;
    SaveDialog: TSaveDialog;
    cxLabel27: TcxLabel;
    dxStatusBar1: TdxStatusBar;
    dxStatusBar1Container0: TdxStatusBarContainerControl;
    cxProgressBar: TcxProgressBar;
    cxGrid1DBTableViewCOD_ENTREGADOR: TcxGridDBColumn;
    cxButton8: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actCadastroListaApoioExecute(Sender: TObject);
    procedure actCadastroCancelarExecute(Sender: TObject);
    procedure actCadastroExcluirExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure actCadastroSalvarExecute(Sender: TObject);
    procedure actCadastroSairExecute(Sender: TObject);
    procedure actCadastroImprimirExecute(Sender: TObject);
    procedure cxGrid1DBTableView1CanFocusRecord(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; var AAllow: Boolean);
    procedure actCadastroRecorrenciaExecute(Sender: TObject);
    procedure cxEntregadorCreditoPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxEntregadorDebitoPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure actCadastroExportarExecute(Sender: TObject);
    procedure actCadastroIncluirExecute(Sender: TObject);
  private
    { Private declarations }
    procedure ListaEntregador;
  public
    { Public declarations }
    procedure SetupForm;
    procedure Modo;
    procedure SetupClass;
    procedure AtualizaGrid;
    procedure SalvaGrid;
  end;

var
  frmLancamentos: TfrmLancamentos;
  entregador: TCodigosEntregadores;
  lancamento: TLancamentos;
  sOperacao, sCadastro: String;
  thrLancamentos: thrPopularLancamentos;
  acessos: TAcessos;
  conexao: TConexao;

implementation

{$R *.dfm}

uses
  udm, clUtil, ufrmPrincipal, ufrmListaApoio, uGlobais, DateUtils,
  ufrmSalvaLancamento;

procedure TfrmLancamentos.FormShow(Sender: TObject);
begin
  cxPageControl1.ActivePageIndex := 0;
  uGlobais.Resultado := False;
  entregador := TCodigosEntregadores.Create();
  lancamento := TLancamentos.Create();
  acessos := TAcessos.Create;
  conexao := TConexao.Create;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    actCadastroSairExecute(Sender);
    Exit;
  end;
  AtualizaGrid;
  if uGlobais.lancamento > 0 then
  begin
    if lancamento.getObject(IntToStr(uGlobais.lancamento), 'CODIGO') then
    begin
      TUtil.LimparFields(Self);
      SetupForm;
      cxDescricaoCredito.SetFocus;
      sOperacao := 'U';
      Modo;
    end;
  end
  else
  begin
    if uGlobais.lancamento = 0 then
      actCadastroCancelarExecute(Self);
  end;
end;

procedure TfrmLancamentos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  entregador.Free;
  lancamento.Free;
  acessos.Free;
  conexao.Free;
  Action := caFree;
  frmLancamentos := Nil;
end;

procedure TfrmLancamentos.SetupForm;
var
  sDescricao: String;
begin
  if lancamento.Tipo = 'CREDITO' then
  begin
    cxPageControl1.ActivePageIndex := 0;
    sDescricao := '';
    cxCodigoCredito.Text := IntToStr(lancamento.Codigo);
    cxDescricaoCredito.Text := lancamento.Descricao;
    cxDataCredito.Date := lancamento.Data;
    cxEntregadorCredito.Text := IntToStr(lancamento.entregador);
    entregador.Codigo := lancamento.entregador;
    entregador.Cadastro := lancamento.cadastro;
    sDescricao := entregador.getField('NOM_FANTASIA', 'CODIGO');
    cxNomeEntregadorCredito.Text := sDescricao;
    cxValorCredito.Value := lancamento.Valor;
    if lancamento.Descontado = 'S' then
    begin
      cxDescontado.Text := 'Processado para Extrato em ' +
        DateToStr(lancamento.Desconto) + ', extrato nº. ' + lancamento.Extrato
    end
    else
    begin
      cxDescontado.Clear;
    end;
    if lancamento.Persistir = 'S' then
    begin
      cxPersistirCredito.Checked := True;
    end
    else
    begin
      cxPersistirCredito.Checked := False;
    end;
  end
  else
  begin
    cxPageControl1.ActivePageIndex := 1;
    sDescricao := '';
    cxCodigoDebito.Text := IntToStr(lancamento.Codigo);
    cxDescricaoDebito.Text := lancamento.Descricao;
    cxDataDebito.Date := lancamento.Data;
    cxEntregadorDebito.Text := IntToStr(lancamento.entregador);
    entregador.Codigo := lancamento.entregador;
    entregador.Cadastro := lancamento.entregador;
    sDescricao := entregador.getField('NOM_FANTASIA', 'CODIGO');
    cxNomeEntregadorDebito.Text := sDescricao;
    cxValorDebito.Value := lancamento.Valor;
    if lancamento.Descontado = 'S' then
    begin
      cxDescontado.Text := 'Processado para Extrato em ' +
        DateToStr(lancamento.Desconto) + ', extrato nº. ' + lancamento.Extrato
    end
    else
    begin
      cxDescontado.Clear;
    end;
    if lancamento.Persistir = 'S' then
    begin
      cxPersistirDebito.Checked := True;
    end
    else
    begin
      cxPersistirDebito.Checked := False;
    end;
  end;
end;

procedure TfrmLancamentos.Modo;
begin
  if sOperacao = 'I' then
  begin
    actCadastroIncluir.Enabled := False;
    actCadastroExcluir.Enabled := False;
    actCadastroCancelar.Enabled := True;
    actCadastroSalvar.Enabled := True;
    actCadastroImprimir.Enabled := False;
    actCadastroSair.Enabled := True;
    actCadastroRecorrencia.Enabled := True;
  end
  else if sOperacao = 'U' then
  begin
    actCadastroIncluir.Enabled := True;
    actCadastroExcluir.Enabled := True;
    actCadastroCancelar.Enabled := True;
    actCadastroSalvar.Enabled := True;
    actCadastroImprimir.Enabled := True;
    actCadastroSair.Enabled := True;
    actCadastroRecorrencia.Enabled := False;
  end
  else
  begin
    actCadastroIncluir.Enabled := True;
    actCadastroExcluir.Enabled := False;
    actCadastroCancelar.Enabled := True;
    actCadastroSalvar.Enabled := True;
    actCadastroImprimir.Enabled := False;
    actCadastroSair.Enabled := True;
    actCadastroRecorrencia.Enabled := True;
  end;
  acessos.SetNivel(aclCadastro);
end;

procedure TfrmLancamentos.actCadastroListaApoioExecute(Sender: TObject);
begin
  if sOperacao = '' then
  begin
    Exit;
  end;
  if not(cxEntregadorCredito.IsFocused) then
  begin
    if not(cxEntregadorDebito.IsFocused) then
    begin
      Exit;
    end;
  end;
  ListaEntregador;
end;

procedure TfrmLancamentos.actCadastroCancelarExecute(Sender: TObject);
begin
  TUtil.LimparFields(Self);
  sOperacao := 'I';
  Modo;
  cxPageControl1.ActivePageIndex := 0;
  cxDataCredito.Date := Now;
  cxDataDebito.Date := Now;
  cxDescricaoCredito.SetFocus;
end;

procedure TfrmLancamentos.actCadastroExcluirExecute(Sender: TObject);
begin
  if sOperacao <> 'U' then
    Exit;
  if lancamento.Descontado = 'S' then
  begin
    MessageDlg('Lançamento já foi processado em Extrato. Exclusão cancelada.',
      mtWarning, [mbOK], 0);
    Exit;
  end;

  if MessageDlg('Confirma excluir este Lançamento?', mtConfirmation,
    [mbYes, mbNo], 0) = IDNO then
    Exit;

  if lancamento.Delete('CODIGO') then
  begin
    MessageDlg('Registro Excluído.', mtInformation, [mbOK], 0);
    AtualizaGrid;
    actCadastroCancelarExecute(Self);
  end;

end;

procedure TfrmLancamentos.actCadastroExportarExecute(Sender: TObject);
var
  FileExt: String;
begin
  if not(dm.tbLancamentos.Active) then
  begin
    Exit;
  end;
  if dm.tbLancamentos.IsEmpty then
  begin
    Exit;
  end;
  SaveDialog.Filter :=
    'Excel (*.xls) |*.xls|XML (*.xml) |*.xml|Arquivo Texto (*.txt) |*.txt|Página Web (*.html)|*.html';
  SaveDialog.Title := 'Exportar Dados';
  SaveDialog.DefaultExt := 'xls';
  if SaveDialog.Execute then
  begin
    cxGrid1.Refresh;
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

procedure TfrmLancamentos.SetupClass;
begin
  if cxPageControl1.ActivePageIndex = 0 then
  begin
    if not(TUtil.Empty(cxCodigoCredito.Text)) then
    begin
      lancamento.Codigo := StrToInt(cxCodigoCredito.Text);
    end
    else
    begin
      lancamento.Codigo := 0;
    end;
    lancamento.Descricao := cxDescricaoCredito.Text;
    lancamento.Data := cxDataCredito.Date;
    lancamento.Tipo := 'CREDITO';
    lancamento.entregador := StrToInt(cxEntregadorCredito.Text);
    lancamento.Cadastro := StrToIntDef(sCadastro,0);
    lancamento.Valor := cxValorCredito.Value;
    if sOperacao = 'I' then
    begin
      lancamento.Extrato := '0';
      lancamento.Descontado := 'N';
      lancamento.Desconto := 0;
    end;
    if cxPersistirCredito.Checked then
    begin
      lancamento.Persistir := 'S';
    end
    else
    begin
      lancamento.Persistir := 'N';
    end;
  end
  else
  begin
    if not(TUtil.Empty(cxCodigoDebito.Text)) then
    begin
      lancamento.Codigo := StrToInt(cxCodigoDebito.Text);
    end
    else
    begin
      lancamento.Codigo := 0;
    end;
    lancamento.Descricao := cxDescricaoDebito.Text;
    lancamento.Data := cxDataDebito.Date;
    lancamento.Tipo := 'DEBITO';
    lancamento.entregador := StrToInt(cxEntregadorDebito.Text);
    lancamento.Valor := cxValorDebito.Value;
    if sOperacao = 'I' then
    begin
      lancamento.Extrato := '0';
      lancamento.Descontado := 'N';
      lancamento.Desconto := 0;
    end;
    if cxPersistirDebito.Checked then
    begin
      lancamento.Persistir := 'S';
    end
    else
    begin
      lancamento.Persistir := 'N';
    end;
  end;
end;

procedure TfrmLancamentos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_UP:
      ; // Seta para cima
    VK_DOWN:
      ; // Seta para baixo
    027:
      actCadastroCancelarExecute(Self); // Esc
    112:
      ; // F1
    113:
      ; // F2
    114:
      ; // F3
    115:
      ; // F4
    116:
      ; // F5
    117:
      ; // F6
    118:
      ; // F7
    119:
      ; // F8
    120:
      ; // F9
    121:
      ; // F10
    122:
      ; // F11
    123:
      ; // F12
  end;
end;

procedure TfrmLancamentos.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmLancamentos.actCadastroSalvarExecute(Sender: TObject);
var
  dValor: Double;
  sParcela, sDescricao: String;
begin
  dValor := 0;
  sParcela := '';
  sDescricao := '';
  SetupClass;
  if not(lancamento.Validar()) then
  begin
    Exit;
  end;
  if sOperacao = 'I' then
  begin
    if not Assigned(frmSalvaLancamento) then
    begin
      frmSalvaLancamento := TfrmSalvaLancamento.Create(Application);
    end;
    if cxPageControl1.ActivePageIndex = 0 then
    begin
      frmSalvaLancamento.cxVencimento.Date := cxDataCredito.Date;
      frmSalvaLancamento.cxValor.Value := cxValorCredito.Value;
    end
    else
    begin
      frmSalvaLancamento.cxVencimento.Date := cxDataDebito.Date;
      frmSalvaLancamento.cxValor.Value := cxValorDebito.Value;
    end;
    if frmSalvaLancamento.ShowModal = mrCancel then
    begin
      FreeAndNil(frmSalvaLancamento);
      Exit;
    end;
    if Application.MessageBox('Confirma incluir o(s) lançamento(s)?', 'Incluir',
      MB_YESNO + MB_ICONQUESTION) = IDNO then
    begin
      FreeAndNil(frmSalvaLancamento);
      Exit;
    end;
    frmSalvaLancamento.tbParcelas.First;
    while not(frmSalvaLancamento.tbParcelas.Eof) do
    begin
      if frmSalvaLancamento.cxQuantidade.Value > 1 then
      begin
        sDescricao := lancamento.Descricao;
        sParcela := frmSalvaLancamento.tbParcelas.RecIdField.AsString + '/' +
          frmSalvaLancamento.cxQuantidade.Text;
        lancamento.Descricao := sDescricao + ': ' + sParcela;
      end;
      lancamento.Data := frmSalvaLancamento.tbParcelasDAT_PARCELA.AsDateTime;
      lancamento.Valor := frmSalvaLancamento.tbParcelasVAL_PARCELA.AsCurrency;
      if not(lancamento.Insert()) then
      begin
        Application.MessageBox(pchar('Erro ao incluir Parcela ' + sParcela),
          'Atenção', MB_OK + MB_ICONEXCLAMATION);
      end;
      SalvaGrid;
      frmSalvaLancamento.tbParcelas.Next;
    end;
    FreeAndNil(frmSalvaLancamento);
    TUtil.LimparFields(Self);
  end
  else
  begin
    if Application.MessageBox('Confirma Alterar o lançamento?', 'Alterar',
      MB_YESNO + MB_ICONQUESTION) = IDNO then
    begin
      Exit;
    end;
    if not(lancamento.Update()) then
    begin
      Application.MessageBox('Erro ao Alterar Dados!', 'Atenção',
        MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
    SalvaGrid;
  end;
  Application.MessageBox('Dados Salvos com sucesso!', 'Atenção',
    MB_OK + MB_ICONINFORMATION);
end;

procedure TfrmLancamentos.actCadastroSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmLancamentos.actCadastroImprimirExecute(Sender: TObject);
begin
  PrintScale := poProportional;
  { OU }
  // PrintScale := poNone;
  { OU }
  // PrintScale := poPrintToFit;
  Print;
end;

procedure TfrmLancamentos.actCadastroIncluirExecute(Sender: TObject);
begin
  TUtil.LimparFields(Self);
  sOperacao := 'I';
  Modo;
end;

procedure TfrmLancamentos.AtualizaGrid;
begin
  ds.Enabled := False;
  thrLancamentos := thrPopularLancamentos.Create(True);
  thrLancamentos.FreeOnTerminate := True;
  thrLancamentos.Priority := tpNormal;
  thrLancamentos.Start;
end;

procedure TfrmLancamentos.SalvaGrid;
begin
  if sOperacao = 'I' then
  begin
    dm.tbLancamentos.Insert;
  end
  else
  begin
    dm.tbLancamentos.Edit;
  end;
  dm.tbLancamentosCOD_LANCAMENTO.Value := lancamento.Codigo;
  dm.tbLancamentosDES_LANCAMENTO.Value := lancamento.Descricao;
  dm.tbLancamentosDAT_LANCAMENTO.Value := lancamento.Data;
  dm.tbLancamentosCOD_ENTREGADOR.Value := lancamento.entregador;
  dm.ZConn.PingServer;
  if entregador.getObject(IntToStr(lancamento.entregador), 'CODIGO') then
  begin
    dm.tbLancamentosNOM_ENTREGADOR.Value := entregador.Nome;
  end
  else
  begin
    dm.tbLancamentosNOM_ENTREGADOR.Value := '- - -';
  end;
  dm.tbLancamentosDES_TIPO.Value := lancamento.Tipo;
  if lancamento.Tipo = 'CREDITO' then
  begin
    dm.tbLancamentosVAL_LANCAMENTO.Value := lancamento.Valor;
  end
  else
  begin
    dm.tbLancamentosVAL_DEBITO.Value := lancamento.Valor;
  end;
  dm.tbLancamentosDOM_DESCONTO.Value := lancamento.Descontado;
  dm.tbLancamentosNUM_EXTRATO.Value := lancamento.Extrato;
  dm.tbLancamentos.Post;
  dm.tbLancamentos.Refresh;
end;

procedure TfrmLancamentos.cxGrid1DBTableView1CanFocusRecord
  (Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  var AAllow: Boolean);
var
  sCodigo: String;
  i, iRet: Integer;
begin
  if dm.tbLancamentos.Active then
  begin
    sCodigo := ARecord.DisplayTexts[0];
    Val(sCodigo, i, iRet);
    if iRet <> 0 then
    begin
      Exit;
    end;
    if lancamento.getObject(sCodigo, 'CODIGO') then
    begin
      TUtil.LimparFields(Self);
      SetupForm;
      sOperacao := 'U';
      Modo;
    end
    else
    begin
      TUtil.LimparFields(Self);
      sOperacao := 'I';
      Modo;
    end;
  end;
end;

procedure TfrmLancamentos.actCadastroRecorrenciaExecute(Sender: TObject);
var
  sDias, sVezes, sMensagem, sDescricao: String;
  i: Integer;
  dtData: TDate;
begin
  SetupClass;
  if not(lancamento.Validar()) then
  begin
    Exit;
  end;
  if lancamento.Persistir = 'S' then
  begin
    Exit;
  end;
  i := 0;
  sDias := InputBox('Recorrência', 'Informe o intervalo de dias.', '15');
  if not(TUtil.ENumero(sDias)) then
  begin
    MessageDlg
      ('Informe um valor nunérico para o intervalo de dias! Data Inicial: ' +
      DateToStr(lancamento.Data), mtWarning, [mbOK], 0);
    Exit;
  end;
  sVezes := InputBox('Recorrência',
    'Informe a quantidade de Ocorrências.', '1');
  if not(TUtil.ENumero(sVezes)) then
  begin
    MessageDlg('Informe um valor nunérico para a quantidade de ocorrências!',
      mtWarning, [mbOK], 0);
    Exit;
  end;
  sMensagem := 'Confirma a recorrência deste lançamento em ' + sVezes +
    ' vezes?';
  if MessageDlg(sMensagem, mtConfirmation, [mbYes, mbNo], 0) = IDNO then
  begin
    Exit;
  end;
  sDescricao := lancamento.Descricao;
  for i := 1 to StrToInt(sVezes) do
  begin
    lancamento.Data := IncDay(lancamento.Data, StrToInt(sDias) + 1);
    lancamento.Descricao := sDescricao + ' - (' + IntToStr(i) + '/' +
      sVezes + ')';
    if not(lancamento.Insert()) then
    begin
      MessageDlg('Erro ao gerar ocorrência nº. ' + IntToStr(i) + ' !',
        mtWarning, [mbOK], 0);
      Exit;
    end;
  end;
  AtualizaGrid;
end;

procedure TfrmLancamentos.cxEntregadorCreditoPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if TUtil.Empty(cxEntregadorCredito.Text) then
    Exit;
  if entregador.getObject(Trim(cxEntregadorCredito.Text), 'CADASTRO') then
  begin
    cxNomeEntregadorCredito.Properties.ReadOnly := False;
    cxNomeEntregadorCredito.Text := entregador.Nome;
    cxNomeEntregadorCredito.Properties.ReadOnly := True;
  end;
end;

procedure TfrmLancamentos.cxEntregadorDebitoPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if TUtil.Empty(cxEntregadorDebito.Text) then
    Exit;
  if entregador.getObject(Trim(cxEntregadorDebito.Text), 'CADASTRO') then
  begin
    cxNomeEntregadorDebito.Properties.ReadOnly := False;
    cxNomeEntregadorDebito.Text := entregador.Nome;
    cxNomeEntregadorDebito.Properties.ReadOnly := True;
  end;
end;

procedure TfrmLancamentos.ListaEntregador;
var
  sId: String;
begin
  if Pos(sOperacao, 'IU') = 0 then
  begin
    Exit;
  end;
  sId := '';
  Screen.Cursor := crHourGlass;
  sId := '';
  with dm.qryPesquisa do
  begin
    Close;
    SQL.Clear;
    SQL.Text :=
      'SELECT COD_ENTREGADOR AS "Código", NOM_FANTASIA AS "Nome", COD_CADASTRO AS "Cadastro" '
      + 'FROM tbcodigosentregadores ';
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
  if frmListaApoio.ShowModal = mrOk then
  begin
    if cxEntregadorCredito.IsFocused then
    begin
      cxEntregadorCredito.Text := dm.qryPesquisa.Fields[0].AsString;
      cxEntregadorCredito.Refresh;
      cxNomeEntregadorCredito.Text := dm.qryPesquisa.Fields[1].AsString;
      cxNomeEntregadorCredito.Refresh;
    end
    else if cxEntregadorDebito.IsFocused then
    begin
      cxEntregadorDebito.Text := dm.qryPesquisa.Fields[0].AsString;
      cxEntregadorDebito.Refresh;
      cxNomeEntregadorDebito.Text := dm.qryPesquisa.Fields[1].AsString;
      cxNomeEntregadorDebito.Refresh;
    end;
  end;
  sCadastro := dm.qryPesquisa.Fields[2].AsString;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  FreeAndNil(frmListaApoio);
end;

end.
