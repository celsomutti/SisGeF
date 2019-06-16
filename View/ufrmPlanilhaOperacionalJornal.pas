unit ufrmPlanilhaOperacionalJornal;

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
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxLabel, dxSkinscxPCPainter, dxLayoutContainer, dxLayoutControl, dxLayoutcxEditAdapters,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxDBLookupComboBox, dxLayoutControlAdapters, Vcl.Menus, System.Actions, Vcl.ActnList, Vcl.StdCtrls,
  cxButtons, clOperacaoJornal, clEntregador, System.DateUtils, Vcl.ExtCtrls, clRoteiroEntregador, dxmdaset, cxGridBandedTableView,
  cxGridDBBandedTableView, dxLayoutLookAndFeels;

type
  TfrmPlanilhaOperacionalJornal = class(TForm)
    cxLabel27: TcxLabel;
    ds: TDataSource;
    aclOperacional: TActionList;
    actExecutar: TAction;
    actSair: TAction;
    dsEntregador: TDataSource;
    tbOperacionalJornal: TdxMemData;
    tbOperacionalJornalCOD_ROTEIRO_ANTIGO: TStringField;
    tbOperacionalJornalCOD_ROTEIRO_NOVO: TStringField;
    tbOperacionalJornalCOD_ENTREGADOR: TIntegerField;
    tbOperacionalJornalDES_STATUS_1: TStringField;
    tbOperacionalJornalDES_STATUS_2: TStringField;
    tbOperacionalJornalDES_STATUS_3: TStringField;
    tbOperacionalJornalDES_STATUS_4: TStringField;
    tbOperacionalJornalDES_STATUS_5: TStringField;
    tbOperacionalJornalDES_STATUS_6: TStringField;
    tbOperacionalJornalDES_STATUS_7: TStringField;
    tbOperacionalJornalDES_STATUS_8: TStringField;
    tbOperacionalJornalDES_STATUS_9: TStringField;
    tbOperacionalJornalDES_STATUS_10: TStringField;
    tbOperacionalJornalDES_STATUS_11: TStringField;
    tbOperacionalJornalDES_STATUS_12: TStringField;
    tbOperacionalJornalDES_STATUS_13: TStringField;
    tbOperacionalJornalDES_STATUS_14: TStringField;
    tbOperacionalJornalDES_STATUS_15: TStringField;
    tbOperacionalJornalDES_STATUS_16: TStringField;
    tbOperacionalJornalDES_STATUS_17: TStringField;
    tbOperacionalJornalDES_STATUS_18: TStringField;
    tbOperacionalJornalDES_STATUS_19: TStringField;
    tbOperacionalJornalDES_STATUS_20: TStringField;
    tbOperacionalJornalDES_STATUS_21: TStringField;
    tbOperacionalJornalDES_STATUS_22: TStringField;
    tbOperacionalJornalDES_STATUS_23: TStringField;
    tbOperacionalJornalDES_STATUS_24: TStringField;
    tbOperacionalJornalDES_STATUS_25: TStringField;
    tbOperacionalJornalDES_STATUS_26: TStringField;
    tbOperacionalJornalDES_STATUS_27: TStringField;
    tbOperacionalJornalDES_STATUS_28: TStringField;
    tbOperacionalJornalDES_STATUS_29: TStringField;
    tbOperacionalJornalDES_STATUS_30: TStringField;
    tbOperacionalJornalDES_STATUS_31: TStringField;
    tbOperacionalJornalDES_CHAVE: TStringField;
    actRepositor: TAction;
    actPresenca: TAction;
    cxLabel3: TcxLabel;
    tbOperacionalJornalDES_ENTREGADOR: TStringField;
    tbOperacionalJornalNUM_ORDEM: TIntegerField;
    lcRootGroup_Root: TdxLayoutGroup;
    lcRoot: TdxLayoutControl;
    lcApontamentoGroup_Root: TdxLayoutGroup;
    lcApontamento: TdxLayoutControl;
    lcRootItem1: TdxLayoutItem;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    lcRootItem2: TdxLayoutItem;
    cxData: TcxDateEdit;
    lcApontamentoItem1: TdxLayoutItem;
    cxDataInicial: TcxDateEdit;
    dxLayoutControl1Item1: TdxLayoutItem;
    cxDataFinal: TcxDateEdit;
    dxLayoutControl1Item2: TdxLayoutItem;
    actProcessar: TAction;
    cxButton1: TcxButton;
    dxLayoutControl1Item3: TdxLayoutItem;
    cxButton2: TcxButton;
    lcApontamentoItem2: TdxLayoutItem;
    cxButton3: TcxButton;
    tbReposicao: TdxMemData;
    tbReposicaoCOD_ENTREGADOR: TIntegerField;
    tbReposicaoCOD_ROTEIRO_ANTIGO: TStringField;
    tbReposicaoDAT_OPERACAO: TDateField;
    tbReposicaoCOD_STATUS_OPERACAO: TStringField;
    tbReposicaoCOD_ROTEIRO_NOVO: TStringField;
    tbReposicaoDES_OBSERVACOES: TStringField;
    tbReposicaoDOM_PLANILHA: TStringField;
    tbReposicaoDES_LOG: TMemoField;
    actGravar: TAction;
    cxButton4: TcxButton;
    cxGrid1: TcxGrid;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView1RecId: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1COD_ROTEIRO_ANTIGO: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1COD_ROTEIRO_NOVO: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1COD_ENTREGADOR: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DES_ENTREGADOR: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DES_STATUS_1: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DES_STATUS_2: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DES_STATUS_3: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DES_STATUS_4: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DES_STATUS_5: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DES_STATUS_6: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DES_STATUS_7: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DES_STATUS_8: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DES_STATUS_9: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DES_STATUS_10: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DES_STATUS_11: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DES_STATUS_12: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DES_STATUS_13: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DES_STATUS_14: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DES_STATUS_15: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DES_STATUS_16: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DES_STATUS_17: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DES_STATUS_18: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DES_STATUS_19: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DES_STATUS_20: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DES_STATUS_21: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DES_STATUS_22: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DES_STATUS_23: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DES_STATUS_24: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DES_STATUS_25: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DES_STATUS_26: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DES_STATUS_27: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DES_STATUS_28: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DES_STATUS_29: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DES_STATUS_30: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DES_STATUS_31: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DES_CHAVE: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1NUM_ORDEM: TcxGridDBBandedColumn;
    cxButton5: TcxButton;
    tbReposicaoID_REFERENCIA: TIntegerField;
    tbReposicaoDAT_REFERENCIA: TDateField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actSairExecute(Sender: TObject);
    procedure dsEntregadorStateChange(Sender: TObject);
    procedure actPresencaExecute(Sender: TObject);
    procedure actProcessarExecute(Sender: TObject);
    procedure actExecutarExecute(Sender: TObject);
    procedure actGravarExecute(Sender: TObject);
    procedure tbOperacionalJornalAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
    procedure ProcessaApontamento(sInicio, sFinal: String);
    procedure ProcessaDemonstrativo;
    procedure MontaOperacao(dtInicio, dtFinal: TDate);
    procedure PopulaOperacao(dtInicio, dtFinal: TDate);
    procedure PopulaApontamento(dtData: TDate);
    procedure PopulaEntregador;
    Procedure IniciaOperacao;
    procedure SalvaOperacao;
    procedure MarcaPresenca;
    procedure SetupClass;
    procedure SetupClassRepositor;
  public
{ Public declarations }
  end;

var
  frmPlanilhaOperacionalJornal: TfrmPlanilhaOperacionalJornal;
  operacao : TOperacionalJornal;
  entregadores: TEntregador;
  roteiro: TRoteiroEntregador;
  sDataColuna : String;
  sAntigo: String;
  sNovo: String;
  iEntregador : Integer;
  iCampo : Integer;
  iCodigoEntregador: Integer;
  sMostrar: String;
  bFlagRepositor: Boolean;
  sCampo: string;
implementation

{$R *.dfm}

uses udm, uGlobais, ufrmOperacaoRepositor, ufrmVisualizarRepositor, clUtil;

procedure TfrmPlanilhaOperacionalJornal.actExecutarExecute(Sender: TObject);
var
  iDias: Integer;
  sData: String;
begin
  if cxData.Text = ''then
  begin
    Application.MessageBox('Informe a data do apontamento!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  sData := operacao.UltimaData;
  if not sData.IsEmpty then
  begin
    if cxData.Date < StrToDate(sData) then
    begin
      Application.MessageBox('Data Solicitada é menor que a data do último apontamento! Solicitação Cancelada.',
                             PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
  end;
  tbOperacionalJornal.Close;
  tbOperacionalJornal.Open;
  tbReposicao.Close;
  tbReposicao.Open;
  MontaOperacao(cxData.Date, cxData.Date);
  PopulaOperacao(cxData.Date, cxData.Date);
  tbOperacionalJornal.IsLoading := False;
end;

procedure TfrmPlanilhaOperacionalJornal.actGravarExecute(Sender: TObject);
begin
  if Application.MessageBox('Confirma Gravar os Dados?', PChar('Atenção ' + uGlobais.sUsuario), MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  SalvaOperacao;
end;

procedure TfrmPlanilhaOperacionalJornal.actPresencaExecute(Sender: TObject);
begin
  MarcaPresenca;
end;

procedure TfrmPlanilhaOperacionalJornal.actProcessarExecute(Sender: TObject);
begin
  ProcessaDemonstrativo;
end;

procedure TfrmPlanilhaOperacionalJornal.actSairExecute(Sender: TObject);
begin
  Perform(WM_CLOSE, 0, 0);
end;

procedure TfrmPlanilhaOperacionalJornal.dsEntregadorStateChange(Sender: TObject);
begin
  if TDataSource(Sender).DataSet.State in [dsInsert, dsEdit] then
  begin
    actRepositor.Enabled := False;
  end
  else if TDataSource(Sender).DataSet.State in [dsBrowse] then
  begin
    actRepositor.Enabled := True;
  end;
end;

procedure TfrmPlanilhaOperacionalJornal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  roteiro.Free;
  entregadores.Free;
  operacao.Free;
  tbOperacionalJornal.Close;
  tbReposicao.Close;
  dm.tbListaEntregadores.Close;
  tbOperacionalJornal.Close;
  Action := caFree;
  frmPlanilhaOperacionalJornal := Nil;
end;

procedure TfrmPlanilhaOperacionalJornal.FormShow(Sender: TObject);
begin
  operacao := TOperacionalJornal.Create;
  entregadores := TEntregador.Create;
  roteiro := TRoteiroEntregador.Create;
  tbReposicao.Open;
  //PopulaEntregador;
end;

procedure TfrmPlanilhaOperacionalJornal.PopulaOperacao(dtInicio, dtFinal: TDate);
var
  i: Integer;
  sCampo: string;
  sChave: string;
  iOrdem: Integer;
  iDias: Integer;
  sNome: string;
  sCodigo: string;
begin
  try
    Screen.Cursor := crHourGlass;
    tbOperacionalJornal.Close;
    tbOperacionalJornal.Open;
    iDias := DaysBetween(dtInicio, dtFinal) + 1;
    if dtInicio = dtFinal then
    begin
      IniciaOperacao;
    end;
    tbOperacionalJornal.IsLoading := True;
    if operacao.Planilha(dtInicio, dtFinal, '') then
    begin
      while not dm.qryGeral.Eof do
      begin
        sChave := dm.qryGeral.FieldByName('COD_ROTEIRO_ANTIGO').AsString +
                  dm.qryGeral.FieldByName('COD_ROTEIRO_NOVO').AsString +
                  dm.qryGeral.FieldByName('COD_ENTREGADOR').AsString;
        if dm.qryGeral.FieldByName('COD_ROTEIRO_ANTIGO').AsString = 'REPOSITOR' then
        begin
          iOrdem := 1;
        end
        else
        begin
          iOrdem := 0;
        end;
        sCodigo := dm.qryGeral.FieldByName('COD_ENTREGADOR').AsString;
        entregadores.Cadastro := StrToIntDef(sCodigo,0);
        sNome := entregadores.getField('NOM_FANTASIA', 'CADASTRO');
        if tbOperacionalJornal.Locate('COD_ENTREGADOR',StrToIntDef(sCodigo,0),[]) then
        begin
          tbOperacionalJornal.Edit;
          tbOperacionalJornalCOD_ROTEIRO_NOVO.AsString := dm.qryGeral.FieldByName('COD_ROTEIRO_NOVO').AsString;
          for i := 1 to iDias do
          begin
            sCampo := 'DES_STATUS_' + IntToStr(i);
            if not dm.qryGeral.FieldByName(sCampo).AsString.IsEmpty then
            begin
              tbOperacionalJornal.FieldByName(sCampo).AsString := dm.qryGeral.FieldByName(sCampo).AsString;
            end;
          end;
          tbOperacionalJornal.Post;
        end
        else
        begin
          tbOperacionalJornal.Insert;
          tbOperacionalJornalCOD_ROTEIRO_ANTIGO.AsString := dm.qryGeral.FieldByName('COD_ROTEIRO_ANTIGO').AsString;
          tbOperacionalJornalCOD_ROTEIRO_NOVO.AsString := dm.qryGeral.FieldByName('COD_ROTEIRO_NOVO').AsString;
          tbOperacionalJornalCOD_ENTREGADOR.AsInteger := dm.qryGeral.FieldByName('COD_ENTREGADOR').AsInteger;
          tbOperacionalJornalDES_ENTREGADOR.AsString := sNome;
          tbOperacionalJornalNUM_ORDEM.AsInteger := iOrdem;
          for i := 1 to iDias do
          begin
            sCampo := 'DES_STATUS_' + IntToStr(i);
            if not dm.qryGeral.FieldByName(sCampo).AsString.IsEmpty then
            begin
              tbOperacionalJornal.FieldByName(sCampo).AsString := dm.qryGeral.FieldByName(sCampo).AsString;
            end;
          end;
          tbOperacionalJornalDES_CHAVE.AsString := sChave;
          tbOperacionalJornal.Post;
        end;
        dm.qryGeral.Next;
      end;
      dm.qryGeral.Close;
      dm.qryGeral.SQL.Clear;
      tbOperacionalJornal.IsLoading := False;
    end;
   finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPlanilhaOperacionalJornal.MontaOperacao(dtInicio, dtFinal: TDate);
var
  dtData: TDate;
  sCabec: String;
  i: Integer;
begin
  tbOperacionalJornal.IsLoading := True;
  for i := 0 to 30 do
  begin
    cxGrid1DBBandedTableView1.Bands[1].Columns[i].Visible := False;
  end;
  sCabec := '';
  dtData := dtInicio;
  i := 0;
  while dtData <= dtFinal do
  begin
    sCabec := FormatDateTime('dd/mm/yyyy dddd', dtData);
    cxGrid1DBBandedTableView1.Bands[1].Columns[i].Caption := sCabec;
    cxGrid1DBBandedTableView1.Bands[1].Columns[i].Visible := True;
    dtData := IncDay(dtData);
    Inc(i);
  end;
  tbOperacionalJornal.IsLoading := False;
end;

procedure TfrmPlanilhaOperacionalJornal.PopulaEntregador;
begin
  dm.tbListaEntregadores.Close;
  dm.tbListaEntregadores.Open;
  if entregadores.ListaEntregadores then
  begin
    while not dm.qryPesquisa.Eof do
    begin
      dm.tbListaEntregadores.Insert;
      dm.tbListaEntregadoresCOD_CADASTRO.AsInteger := dm.qryPesquisa.FieldByName('COD_CADASTRO').AsInteger;
      dm.tbListaEntregadoresDES_RAZAO_SOCIAL.AsString := dm.qryPesquisa.FieldByName('DES_RAZAO_SOCIAL').AsString;
      dm.tbListaEntregadores.Post;
      dm.qryPesquisa.Next;
    end;
  end;
  if not dm.tbListaEntregadores.IsEmpty then
  begin
    dm.tbListaEntregadores.First;
  end;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
end;

procedure TfrmPlanilhaOperacionalJornal.IniciaOperacao;
var
  sChave: String;
  sNome: string;
  sCodigo: string;
  sTipo : String;
  sRoteiroAntigo: String;
  sRoteiroNovo: String;
  sLista: String;
  sDetalhe: TStringList;
  i: Integer;
begin
  tbOperacionalJornal.IsLoading := True;
  sDetalhe := TStringList.Create;
  sDetalhe.StrictDelimiter := True;
  sDetalhe.Delimiter := ';';
  i := 0;
  if roteiro.getObject('','') then
  begin
    while not dm.qryGetObject.Eof do
    begin
      if dm.qryGetObject.FieldByName('DOM_MOSTRAR').AsString = 'S' then
      begin
        entregadores.Roteiro := dm.qryGetObject.FieldByName('COD_ROTEIRO_NOVO').AsString;
        sCodigo := entregadores.getField('COD_CADASTRO', 'ROTEIRO');
        entregadores.Cadastro := StrToIntDef(sCodigo,0);
        sNome := entregadores.getField('NOM_FANTASIA', 'CADASTRO');
        sTipo := entregadores.getField('DOM_FUNCIONARIO', 'CADASTRO');
        if tbOperacionalJornal.Locate('COD_ENTREGADOR', StrToIntDef(sCodigo,0),[]) then
        begin
          sRoteiroAntigo := '';
          sRoteiroNovo := '';
          tbOperacionalJornal.Edit;
          sRoteiroAntigo := tbOperacionalJornalCOD_ROTEIRO_ANTIGO.AsString;
          sRoteiroAntigo := sRoteiroAntigo + '/' + dm.qryGetObject.FieldByName('COD_ROTEIRO_ANTIGO').AsString;
          tbOperacionalJornalCOD_ROTEIRO_ANTIGO.AsString := sRoteiroAntigo;
          sRoteiroNovo := tbOperacionalJornalCOD_ROTEIRO_NOVO.AsString;
          sRoteiroNovo := sRoteiroNovo + '/' + dm.qryGetObject.FieldByName('COD_ROTEIRO_NOVO').AsString;
          tbOperacionalJornalCOD_ROTEIRO_NOVO.AsString := sRoteiroNovo;
          sChave := sRoteiroAntigo + sRoteiroNovo + IntToStr(StrToIntDef(sCodigo,0));
          tbOperacionalJornalDES_CHAVE.AsString := sChave;
        end
        else
        begin
          tbOperacionalJornal.Insert;
          tbOperacionalJornalNUM_ORDEM.AsInteger := 0;
          tbOperacionalJornalCOD_ROTEIRO_ANTIGO.AsString := dm.qryGetObject.FieldByName('COD_ROTEIRO_ANTIGO').AsString;
          tbOperacionalJornalCOD_ROTEIRO_NOVO.AsString := dm.qryGetObject.FieldByName('COD_ROTEIRO_NOVO').AsString;
          tbOperacionalJornalCOD_ENTREGADOR.AsInteger := StrToIntDef(sCodigo,0);
          tbOperacionalJornalDES_ENTREGADOR.AsString := sNome;
          sChave := dm.qryGetObject.FieldByName('COD_ROTEIRO_ANTIGO').AsString +
                    dm.qryGetObject.FieldByName('COD_ROTEIRO_NOVO').AsString +
                    IntToStr(StrToIntDef(sCodigo,0));
          tbOperacionalJornalDES_CHAVE.AsString := sChave;
        end;
        tbOperacionalJornal.Post;
      end;
      dm.qryGetObject.Next;
    end;
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
  end;
  if entregadores.ListaEntregadores() then
  begin
    while not dm.qryPesquisa.Eof do
    begin
      if dm.qryPesquisa.FieldByName('DOM_FUNCIONARIO').AsString = 'P' then
      begin
        if dm.qryPesquisa.FieldByName('COD_ROTEIRO').AsString.IsEmpty then
        begin
          sChave := 'REPOSITOR' + dm.qryPesquisa.FieldByName('COD_CADASTRO').AsString;
          if tbOperacionalJornal.Locate('DES_CHAVE', sChave, []) then
          begin
            tbOperacionalJornal.Edit;
            tbOperacionalJornalCOD_ROTEIRO_ANTIGO.AsString := 'REPOSITOR';
            tbOperacionalJornalDES_CHAVE.AsString := sChave;
          end
          else
          begin
            tbOperacionalJornal.Insert;
            tbOperacionalJornalCOD_ROTEIRO_ANTIGO.AsString := 'REPOSITOR';
            tbOperacionalJornalCOD_ROTEIRO_NOVO.AsString := '';
            tbOperacionalJornalCOD_ENTREGADOR.AsInteger := dm.qryPesquisa.FieldByName('COD_CADASTRO').AsInteger;
            tbOperacionalJornalDES_ENTREGADOR.AsString := dm.qryPesquisa.FieldByName('NOM_FANTASIA').AsString;
            sChave := 'REPOSITOR' + dm.qryPesquisa.FieldByName('COD_CADASTRO').AsString;
            tbOperacionalJornalDES_CHAVE.AsString := sChave;
            tbOperacionalJornalNUM_ORDEM.AsInteger := 1;
          end;
          tbOperacionalJornal.Post;
        end;
      end;
      dm.qryPesquisa.Next;
    end;
  end;
  tbOperacionalJornal.IsLoading := False;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  sDetalhe.Free;
end;

procedure TfrmPlanilhaOperacionalJornal.SalvaOperacao;
var
  sLog: TStringList;
  sObs: string;
  iId: Integer;
  sRoteiro: String;
  bAlteraEntregador: Boolean;
begin
  //Operação
  sLog := TStringList.Create;
  if not tbOperacionalJornal.IsEmpty then
  begin
    tbOperacionalJornal.First;
  end;
  while not tbOperacionalJornal.Eof do
  begin
    SetupClass;
    iId := operacao.Exist();
    if iId > 0 then
    begin
      operacao.NumId := iId;
      sLog.Text := operacao.getField('DES_LOG', 'ID');
      sLog.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss',Now) + ' alterado pelo usuário ' + uGlobais.sUsuario);
      operacao.Log := sLog.Text;
      if not operacao.Update() then
      begin
        Application.MessageBox(PChar('Erro ao Alterar a operação do Entregador! ID: ' + IntToStr(iId) ),
                               PChar('Atenção ' + uGlobais.sUsuario),MB_OK + MB_ICONEXCLAMATION);
        Exit;
      end;
    end
    else
    begin
      sLog.Clear;
      sLog.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss',Now) + ' adicionado pelo usuário ' + uGlobais.sUsuario);
      operacao.Log := sLog.Text;
      if not operacao.Insert() then
      begin
        Application.MessageBox(PChar('Erro ao Incluir operação de Entregador! Código: ' + IntToStr(operacao.Entregador) ),
                               PChar('Atenção ' + uGlobais.sUsuario),MB_OK + MB_ICONEXCLAMATION);
        Exit;
      end;
    end;
    if operacao.RoteiroAntigo = 'REPOSITOR' then
    begin
      sRoteiro := '';
    end
    else
    begin
      sRoteiro := operacao.RoteiroNovo;
    end;
    sRoteiro := TUtil.ReplaceStr(sRoteiro,'/',';');
    if entregadores.getObject(IntToStr(operacao.Entregador),'CADASTRO') then
    begin
      entregadores.Roteiro := sRoteiro;
      if not entregadores.Update() then
      begin
        Application.MessageBox(PChar('Erro ao alterar o entregador ' + IntToStr(operacao.Entregador)),
                               PChar('Atenção ' + uglobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
      end;
    end;
    tbOperacionalJornal.Next;
  end;
  // Reposição
  if not tbReposicao.IsEmpty then
  begin
    tbReposicao.First;
  end;
  while not tbReposicao.Eof do
  begin
    SetupClassRepositor;
    iId := operacao.Exist();
    if iId > 0 then
    begin
      operacao.NumId := iId;
      sLog.Text := operacao.getField('DES_LOG', 'ID');
      sLog.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss',Now) + ' alterado pelo usuário ' + uGlobais.sUsuario);
      if not operacao.Update() then
      begin
        Application.MessageBox(PChar('Erro ao Alterar a operação do Entregador! ID: ' + IntToStr(iId) ),
                               PChar('Atenção ' + uGlobais.sUsuario),MB_OK + MB_ICONEXCLAMATION);
        Exit;
      end;
    end
    else
    begin
      sLog.Clear;
      sLog.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss',Now) + ' adicionado pelo usuário ' + uGlobais.sUsuario);
      if not operacao.Insert() then
      begin
        Application.MessageBox(PChar('Erro ao Incluir operação de Entregador! Código: ' + IntToStr(operacao.Entregador) ),
                               PChar('Atenção ' + uGlobais.sUsuario),MB_OK + MB_ICONEXCLAMATION);
        Exit;
      end;
    end;
    tbReposicao.Next;
  end;
end;

procedure TfrmPlanilhaOperacionalJornal.MarcaPresenca;
var
  dtData: TDateTime;
  dtDataFinal: TDateTime;
  sNomeRepositor: String;
  sChaveOld: string;
  sChave: string;
  sRoteiro: string;
begin
  if Application.MessageBox('Confirma a Marcação da Presença?', PChar('Atenção ' + uGlobais.sUsuario), MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  try
    Screen.Cursor := crHourGlass;
    tbOperacionalJornal.IsLoading := True;
    if not tbOperacionalJornal.IsEmpty then
    begin
      tbOperacionalJornal.First;
      while not tbOperacionalJornal.Eof do
      begin
        if tbOperacionalJornalDES_STATUS_1.AsString.IsEmpty then
        begin
          tbOperacionalJornal.Edit;
          tbOperacionalJornalDES_STATUS_1.AsString := 'P';
          tbOperacionalJornal.Post;
        end
        else if Pos(tbOperacionalJornal.FieldByName('DES_STATUS_1').AsString, 'ATES,SUS') > 0 then
        begin
          if not Assigned(frmOperacaoRepositor) then
          begin
            frmOperacaoRepositor := TfrmOperacaoRepositor.Create(Application);
          end;
          if tbOperacionalJornal.FieldByName('COD_ROTEIRO_ANTIGO').AsString = 'REPOSITOR' then
          begin
            Exit;
          end;
          frmOperacaoRepositor.cxLabel1.Caption := 'Informe o Substituto do entregador ' +
                                                    tbOperacionalJornal.FieldByName('DES_ENTREGADOR').AsString;
          frmOperacaoRepositor.cxData.Date := cxData.Date;
          frmOperacaoRepositor.cxDataFinal.Date := cxData.Date;
          frmOperacaoRepositor.cxData.Properties.ReadOnly := True;
          frmOperacaoRepositor.cxDataFinal.Properties.ReadOnly := True;
          if frmOperacaoRepositor.ShowModal = mrCancel then
          begin
            Application.MessageBox('Operação cancelada para este entregador!',PChar('Atenção ' + uGlobais.sUsuario),
                                   MB_OK + MB_ICONEXCLAMATION);
            tbOperacionalJornal.Edit;
            tbOperacionalJornalDES_STATUS_1.AsString := '';
            tbOperacionalJornal.Post;
            Exit;
          end
          else
          begin
            iCodigoEntregador := StrToIntDef(frmOperacaoRepositor.cxCodigo.Text,0);
            dtData :=  frmOperacaoRepositor.cxData.Date;
            dtDataFinal := frmOperacaoRepositor.cxDataFinal.Date;
            sNomeRepositor := frmOperacaoRepositor.cxNome.Text;
            sMostrar := 'N';
            bFlagRepositor := True;
          end;
          sChaveOld := tbOperacionalJornalDES_CHAVE.AsString;
          sRoteiro := tbOperacionalJornalCOD_ROTEIRO_NOVO.AsString;
          sChave := 'REPOSITOR' + IntToStr(iCodigoEntregador);
          if tbOperacionalJornal.Locate('DES_CHAVE',sChave,[]) then
          begin
            tbOperacionalJornal.Edit;
            tbOperacionalJornalCOD_ROTEIRO_NOVO.AsString := sRoteiro;
            tbOperacionalJornalDES_STATUS_1.AsString := sRoteiro;
            tbOperacionalJornal.Post;
            // Gerar OS
          end;
          tbOperacionalJornal.Locate('DES_CHAVE', sChaveOld,[]);
        end;
        tbOperacionalJornal.Next;
      end;
    end;
  finally
    tbOperacionalJornal.IsLoading := False;
    Screen.Cursor := crDefault;
    Application.MessageBox('Marcação de Presenças concluído!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONINFORMATION);
  end;
end;

procedure TfrmPlanilhaOperacionalJornal.SetupClass;
begin
  operacao.Entregador := tbOperacionalJornalCOD_ENTREGADOR.AsInteger;
  operacao.RoteiroAntigo := tbOperacionalJornalCOD_ROTEIRO_ANTIGO.AsString;
  sDataColuna := Copy(cxGrid1DBBandedTableView1DES_STATUS_1.Caption,1,10);
  operacao.Data := StrToDate(sDataColuna);
  operacao.StatusOperacao := tbOperacionalJornalDES_STATUS_1.AsString;
  operacao.RoteiroNovo := tbOperacionalJornalCOD_ROTEIRO_NOVO.AsString;
  operacao.Mostrar := 'S';
  operacao.IdReferencia := tbOperacionalJornal.RecIdField.AsInteger;
  operacao.DataReferencia := operacao.Data;
end;

procedure TfrmPlanilhaOperacionalJornal.tbOperacionalJornalAfterPost(DataSet: TDataSet);
var
  sLog: TStringList;
  sObs: string;
  iId: Integer;
  dtData: TDate;
  dtDataFinal: TDate;
  sChave: string;
  sRoteiro: string;
  sChaveOld: string;
  sNomeEntregador: string;
  iEntregadorOld: Integer;
  sNomeRepositor: String;
  sRoteiroAntigoEntregador: string;
  sRoteiroNovoEntregador: string;
  sApontamento: string;
  iRec: Integer;
  dtDataReferencia: TDate;
begin
  if tbOperacionalJornal.IsLoading then
  begin
    Exit;
  end;
  try
    sLog := TStringList.Create();
    bFlagRepositor := False;
    iRec := 0;
    dtDataReferencia := 0;
    if Pos(DataSet.FieldByName('DES_STATUS_1').AsString, 'FALTA,ATES,FOLGA,INSS,FÉRIAS,SUS,LINC,PAR') > 0 then
    begin
      if DataSet.FieldByName('DES_STATUS_1').AsString <> 'P' then
      begin
        if DataSet.FieldByName('COD_ROTEIRO_ANTIGO').AsString = 'REPOSITOR' then
        begin
          Exit;
        end;
        if not Assigned(frmOperacaoRepositor) then
        begin
          frmOperacaoRepositor := TfrmOperacaoRepositor.Create(Application);
        end;
        if DataSet.FieldByName('DES_STATUS_1').AsString = 'FALTA' then
        begin
          frmOperacaoRepositor.cxData.Date := cxData.Date;
          frmOperacaoRepositor.cxDataFinal.Date := cxData.Date;
          frmOperacaoRepositor.cxData.Properties.ReadOnly := True;
          frmOperacaoRepositor.cxDataFinal.Properties.ReadOnly := True;
        end;
        if DataSet.FieldByName('DES_STATUS_1').AsString = 'FOLGA' then
        begin
          frmOperacaoRepositor.cxData.Date := cxData.Date;
          frmOperacaoRepositor.cxDataFinal.Date := cxData.Date;
          frmOperacaoRepositor.cxData.Properties.ReadOnly := True;
          frmOperacaoRepositor.cxDataFinal.Properties.ReadOnly := True;
        end;
        if DataSet.FieldByName('DES_STATUS_1').AsString = 'PAR' then
        begin
          frmOperacaoRepositor.cxData.Date := cxData.Date;
          frmOperacaoRepositor.cxDataFinal.Date := cxData.Date;
          frmOperacaoRepositor.cxData.Properties.ReadOnly := True;
          frmOperacaoRepositor.cxDataFinal.Properties.ReadOnly := True;
        end;
        if frmOperacaoRepositor.ShowModal = mrCancel then
        begin
          Application.MessageBox('Operação cancelada para este entregador!',PChar('Atenção ' + uGlobais.sUsuario),
                                 MB_OK + MB_ICONEXCLAMATION);
          tbOperacionalJornal.Edit;
          tbOperacionalJornalDES_STATUS_1.AsString := '';
          tbOperacionalJornal.Post;
          Exit;
        end
        else
        begin
          iCodigoEntregador := StrToIntDef(frmOperacaoRepositor.cxCodigo.Text,0);
          dtData :=  frmOperacaoRepositor.cxData.Date;
          dtDataFinal := frmOperacaoRepositor.cxDataFinal.Date;
          sNomeRepositor := frmOperacaoRepositor.cxNome.Text;
          sMostrar := 'N';
          iRec := DataSet.FieldByName('RecId').AsInteger;
          dtDataReferencia := dtData;
          bFlagRepositor := True;
        end;
      end;
    end;
    if bFlagRepositor then
    begin
      sChaveOld := tbOperacionalJornalDES_CHAVE.AsString;
      if Pos(DataSet.FieldByName('DES_STATUS_1').AsString,'FALTA,FOLGA,PAR') > 0 then
      begin
        sChave := 'REPOSITOR' + IntToStr(iCodigoEntregador);
        sRoteiro := tbOperacionalJornalCOD_ROTEIRO_NOVO.AsString;
        if tbOperacionalJornal.Locate('DES_CHAVE',sChave,[]) then
        begin
          tbOperacionalJornal.Edit;
          if Pos(sRoteiro, tbOperacionalJornalDES_STATUS_1.AsString) = 0 then
          begin
            if not tbOperacionalJornalDES_STATUS_1.AsString.IsEmpty then
            begin
              if Copy(tbOperacionalJornalDES_STATUS_1.AsString,1,1) = 'P' then
              begin
                tbOperacionalJornalDES_STATUS_1.AsString := '';
              end
              else
              begin
                tbOperacionalJornalDES_STATUS_1.AsString := tbOperacionalJornalDES_STATUS_1.AsString + ',';
              end;
            end;
            tbOperacionalJornalDES_STATUS_1.AsString := tbOperacionalJornalDES_STATUS_1.AsString + sRoteiro;
          end;
          tbOperacionalJornal.Post;
          // Gerar OS
        end;
        tbOperacionalJornal.Locate('DES_CHAVE', sChaveOld,[]);
      end
      else if Pos(DataSet.FieldByName('DES_STATUS_1').AsString, 'ATES,INSS,FÉRIAS,SUS,LINC') > 0 then
      begin
        sNomeEntregador  := DataSet.FieldByName('DES_ENTREGADOR').AsString;
        iEntregadorOld := DataSet.FieldByName('COD_ENTREGADOR').AsInteger;
        sRoteiroAntigoEntregador := DataSet.FieldByName('COD_ROTEIRO_ANTIGO').AsString;
        sRoteiroNovoEntregador := DataSet.FieldByName('COD_ROTEIRO_NOVO').AsString;
        sApontamento := DataSet.FieldByName('DES_STATUS_1').AsString;
        sChave := DataSet.FieldByName('COD_ROTEIRO_ANTIGO').AsString + DataSet.FieldByName('COD_ROTEIRO_NOVO').AsString +
                  IntToStr(iCodigoEntregador);
        if Pos(DataSet.FieldByName('DES_STATUS_1').AsString, 'ATES,SUS') = 0 then
        begin
          tbOperacionalJornal.Edit;
          tbOperacionalJornalCOD_ENTREGADOR.AsInteger := iCodigoEntregador;
          tbOperacionalJornalDES_STATUS_1.AsString := 'P';
          tbOperacionalJornalDES_CHAVE.AsString := sChave;
          tbOperacionalJornalDES_ENTREGADOR.AsString := sNomeRepositor;
          tbOperacionalJornal.Post;
          sChave := 'REPOSITOR' + IntToStr(iCodigoEntregador);
          if tbOperacionalJornal.Locate('DES_CHAVE', sChave,[]) then
          begin
            tbOperacionalJornal.Edit;
            tbOperacionalJornalCOD_ENTREGADOR.AsInteger := iEntregadorOld;
            tbOperacionalJornalDES_STATUS_1.AsString := sApontamento;
            tbOperacionalJornalDES_CHAVE.AsString := sChave;
            tbOperacionalJornalDES_ENTREGADOR.AsString := sNomeEntregador;
            tbOperacionalJornalNUM_ORDEM.AsInteger := 1;
            tbOperacionalJornal.Post;
          end
          else
          begin
            tbOperacionalJornal.Insert;
            tbOperacionalJornalCOD_ROTEIRO_ANTIGO.AsString := 'REPOSITOR';
            tbOperacionalJornalCOD_ROTEIRO_NOVO.AsString := '';
            tbOperacionalJornalCOD_ENTREGADOR.AsInteger := iEntregadorOld;
            tbOperacionalJornalDES_STATUS_1.AsString := sApontamento;
            tbOperacionalJornalDES_CHAVE.AsString := sChave;
            tbOperacionalJornalDES_ENTREGADOR.AsString := sNomeEntregador;
            tbOperacionalJornalNUM_ORDEM.AsInteger := 1;
            tbOperacionalJornal.Post;
          end;
        end;
        while dtData <= dtDataFinal do
        begin
          tbReposicao.Insert;
          tbReposicaoCOD_ENTREGADOR.AsInteger := iEntregadorOld;
          tbReposicaoCOD_STATUS_OPERACAO.AsString := sApontamento;
          tbReposicaoDOM_PLANILHA.AsString := 'N';
          sLog.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss',Now) + ' alterado pelo usuário ' + uGlobais.sUsuario);
          tbReposicaoDES_LOG.AsString := sLog.Text;
          tbReposicaoCOD_ROTEIRO_ANTIGO.AsString := 'REPOSITOR';
          tbReposicaoCOD_ROTEIRO_NOVO.AsString := '';
          tbReposicaoDAT_OPERACAO.AsDateTime := dtData;
          tbReposicaoID_REFERENCIA.AsInteger := iRec;
          tbReposicaoDAT_REFERENCIA.AsDateTime := dtDataReferencia;
          tbReposicao.Post;
          dtData := IncDay(dtData,1);
        end;
      end;
    end;
  finally
    FreeAndNil(frmOperacaoRepositor);
    sLog.Free;
  end;
end;

procedure TfrmPlanilhaOperacionalJornal.ProcessaApontamento(sInicio, sFinal: String);
var
  iDias: Integer;
begin
  if sInicio.IsEmpty then
  begin
    Application.MessageBox('Informe a data inicial do período!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if sFinal.IsEmpty then
  begin
    Application.MessageBox('Informe a data final do período!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if StrToDate(sInicio) > StrToDate(sFinal) then
  begin
    Application.MessageBox('A data inicial é maior que a data final!', PChar('Atenção ' + uGlobais.sUsuario),
                           MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  iDias := DaysBetween(StrToDate(sInicio), StrToDate(sFinal)) + 1;
  if iDias > 31 then
  begin
    Application.MessageBox('Quantidade de dias solicitado é maior que 31!',
                           PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  tbOperacionalJornal.Close;
  tbOperacionalJornal.Open;
  tbReposicao.Close;
  tbReposicao.Open;
  MontaOperacao(StrToDate(sInicio), StrToDate(sFinal));
  tbOperacionalJornal.IsLoading := True;
  PopulaOperacao(StrToDate(sInicio), StrToDate(sFinal));
  tbOperacionalJornal.IsLoading := False;
end;

procedure TfrmPlanilhaOperacionalJornal.ProcessaDemonstrativo;
begin
  ProcessaApontamento(cxDataInicial.Text, cxDataFinal.Text);
end;

procedure TfrmPlanilhaOperacionalJornal.SetupClassRepositor;
begin
  operacao.Entregador := tbReposicaoCOD_ENTREGADOR.AsInteger;
  operacao.RoteiroAntigo := tbReposicaoCOD_ROTEIRO_ANTIGO.AsString;
  operacao.Data := tbReposicaoDAT_OPERACAO.AsDateTime;
  operacao.StatusOperacao := tbReposicaoCOD_STATUS_OPERACAO.AsString;
  operacao.RoteiroNovo := tbReposicaoCOD_ROTEIRO_NOVO.AsString;
  operacao.Observacoes := tbReposicaoDES_OBSERVACOES.AsString;
  operacao.Mostrar := tbReposicaoDOM_PLANILHA.AsString;
  operacao.Log := tbReposicaoDES_LOG.AsString;
  operacao.IdReferencia := tbReposicaoID_REFERENCIA.AsInteger;
  operacao.DataReferencia := tbReposicaoDAT_REFERENCIA.AsDateTime;
end;

procedure TfrmPlanilhaOperacionalJornal.PopulaApontamento(dtData: TDate);
var
  iOrdem: Integer;
  sChave: string;
  sNome: string;
  sCodigo: string;
begin
  try
    Screen.Cursor := crHourGlass;
    tbOperacionalJornal.Close;
    tbOperacionalJornal.Open;
    tbOperacionalJornal.IsLoading := True;
    if operacao.getObject(FormatDateTime('dd/mm/yyyy', dtData), 'DATA') then
    begin
      while not dm.qryGetObject.Eof do
      begin
        if dm.qryGetObject.FieldByName('DOM_PLANILHA').AsString = 'S' then
        begin
          iOrdem := 0;
        end
        else
        begin
          iOrdem := 1;
        end;
        entregadores.Roteiro := dm.qryGetObject.FieldByName('COD_ROTEIRO_NOVO').AsString;
        sCodigo := entregadores.getField('COD_CADASTRO', 'ROTEIRO');
        entregadores.Cadastro := StrToIntDef(sCodigo,0);
        sNome := entregadores.getField('NOM_FANTASIA', 'CADASTRO');
        tbOperacionalJornal.Insert;
        if iOrdem = 0 then
        begin
          tbOperacionalJornalCOD_ROTEIRO_ANTIGO.AsString := dm.qryGetObject.FieldByName('COD_ROTEIRO_ANTIGO').AsString;
          tbOperacionalJornalCOD_ROTEIRO_NOVO.AsString := dm.qryGetObject.FieldByName('COD_ROTEIRO_NOVO').AsString;
        end
        else
        begin
          tbOperacionalJornalCOD_ROTEIRO_ANTIGO.AsString := 'REPOSITOR';
          tbOperacionalJornalCOD_ROTEIRO_NOVO.AsString := '';
        end;
        tbOperacionalJornalCOD_ENTREGADOR.AsInteger := dm.qryGetObject.FieldByName('COD_ENTREGADOR').AsInteger;
        tbOperacionalJornalNUM_ORDEM.AsInteger := iOrdem;
        tbOperacionalJornalDES_ENTREGADOR.AsString := sNome;
        if iOrdem = 1 then
        begin
          tbOperacionalJornal.FieldByName('DES_STATUS_1').Value := dm.qryGetObject.FieldByName('COD_ROTEIRO_NOVO').AsString;
        end
        else
        begin
          tbOperacionalJornal.FieldByName('DES_STATUS_1').Value := dm.qryGetObject.FieldByName('COD_STATUS_OPERACAO').AsString;
        end;
        tbOperacionalJornalCOD_ENTREGADOR.AsInteger := dm.qryGetObject.FieldByName('COD_ENTREGADOR').AsInteger;
        entregadores.Cadastro := dm.qryGetObject.FieldByName('COD_ENTREGADOR').AsInteger;
        sChave := dm.qryGetObject.FieldByName('COD_ROTEIRO_ANTIGO').AsString +
                  dm.qryGetObject.FieldByName('COD_ROTEIRO_NOVO').AsString +
                  dm.qryGetObject.FieldByName('COD_ENTREGADOR').AsString;
        tbOperacionalJornalDES_CHAVE.AsString := sChave;
        tbOperacionalJornal.Post;
        dm.qryGetObject.Next;
      end;
      dm.qryGetObject.Close;
      dm.qryGetObject.SQL.Clear;
      tbOperacionalJornal.IsLoading := False;
    end
    else
    begin
      IniciaOperacao;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

end.
