unit ufrmRoteiroEntregador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, dxLayoutContainer, dxLayoutControl, Data.DB, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxDBLookupComboBox, clEntregador, clRoteiroEntregador, System.Actions, Vcl.ActnList,
  dxLayoutControlAdapters, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxGridExportLink, ShellAPI, dxmdaset, cxContainer, cxLabel,
  cxTextEdit, cxButtonEdit, cxCheckBox;

type
  TfrmRoteiroEntregador = class(TForm)
    dsRoteiro: TDataSource;
    dsEntregadores: TDataSource;
    aclRoteiro: TActionList;
    actIncluir: TAction;
    actEditar: TAction;
    actImportar: TAction;
    actExportar: TAction;
    actSair: TAction;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    tbRoteiroEntregador: TdxMemData;
    tbRoteiroEntregadorCOD_ROTEIRO_ANTIGO: TWideStringField;
    tbRoteiroEntregadorCOD_ROTEIRO_NOVO: TWideStringField;
    tbRoteiroEntregadorDES_LOG: TWideMemoField;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1RecId: TcxGridDBColumn;
    cxGrid1DBTableView1COD_ROTEIRO_ANTIGO: TcxGridDBColumn;
    cxGrid1DBTableView1COD_ROTEIRO_NOVO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_ROTEIRO: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton4: TcxButton;
    cxButton5: TcxButton;
    cxButton7: TcxButton;
    cxLabel27: TcxLabel;
    actPesquisar: TAction;
    tbRoteiroEntregadorID_ROTEIRO: TIntegerField;
    tbRoteiroEntregadorDES_ROTEIRO: TStringField;
    tbRoteiroEntregadorDOM_MOSTRAR: TStringField;
    cxGrid1DBTableView1DOM_MOSTRAR: TcxGridDBColumn;
    tbRoteiroEntregadorCOD_CADASTRO: TIntegerField;
    cxGrid1DBTableView1ID_ROTEIRO: TcxGridDBColumn;
    cxGrid1DBTableView1COD_CADASTRO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_LOG: TcxGridDBColumn;
    tbListaEntregadores: TdxMemData;
    tbListaEntregadoresCOD_CADASTRO: TIntegerField;
    tbListaEntregadoresDES_RAZAO_SOCIAL: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsRoteiroStateChange(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
    procedure actIncluirExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure tbRoteiroEntregadorAfterPost(DataSet: TDataSet);
    procedure actImportarExecute(Sender: TObject);
    procedure actExportarExecute(Sender: TObject);
    procedure tbRoteiroEntregadorBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    procedure PopulaRoteiroEntregador;
    procedure ImportaPlanilha;
    procedure Exportar;
    procedure SetupClass;
    procedure PopulaEntregadores;
  public
    { Public declarations }
  end;

var
  frmRoteiroEntregador: TfrmRoteiroEntregador;
  entregador : TEntregador;
  roteiro: TRoteiroEntregador;
implementation

{$R *.dfm}

uses udm, ufrmProcesso, uGlobais, clUtil, ufrmListaApoio;

procedure TfrmRoteiroEntregador.actEditarExecute(Sender: TObject);
begin
  tbRoteiroEntregador.Edit;
end;

procedure TfrmRoteiroEntregador.actExportarExecute(Sender: TObject);
begin
  Exportar;
end;

procedure TfrmRoteiroEntregador.actImportarExecute(Sender: TObject);
begin
  ImportaPlanilha;
end;

procedure TfrmRoteiroEntregador.actIncluirExecute(Sender: TObject);
begin
  if (not tbRoteiroEntregador.Active) then
  begin
    tbRoteiroEntregador.Open;
  end;
  tbRoteiroEntregador.Insert;
end;

procedure TfrmRoteiroEntregador.actSairExecute(Sender: TObject);
begin
  Perform(WM_CLOSE, 0, 0);
end;

procedure TfrmRoteiroEntregador.dsRoteiroStateChange(Sender: TObject);
begin
  if TDataSource(Sender).DataSet.State in [dsInsert, dsEdit] then
  begin
    actIncluir.Enabled := False;
    actEditar.Enabled := False;
    actimportar.Enabled := False;
    actExportar.Enabled := False;
    actSair.Enabled := True;
  end
  else if TDataSource(Sender).DataSet.State in [dsInactive] then
  begin
    actIncluir.Enabled := True;
    actEditar.Enabled := True;
    if tbRoteiroEntregador.IsEmpty then
    begin
      actEditar.Enabled := False;
    end;
    actimportar.Enabled := True;
    actExportar.Enabled := True;
    actSair.Enabled := True;
  end
  else if TDataSource(Sender).DataSet.State in [dsBrowse] then
  begin
    actIncluir.Enabled := True;
    actEditar.Enabled := True;
    if tbRoteiroEntregador.IsEmpty then
    begin
      actEditar.Enabled := False;
    end;
    actimportar.Enabled := True;
    actExportar.Enabled := True;
    actSair.Enabled := True;
  end;
end;

procedure TfrmRoteiroEntregador.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tbRoteiroEntregador.Close;
  dm.tbListaEntregadores.Close;
  roteiro.Free;
  entregador.Free;
  action := caFree;
  frmRoteiroEntregador := Nil;
end;

procedure TfrmRoteiroEntregador.FormShow(Sender: TObject);
begin
  roteiro := TRoteiroEntregador.Create;
  entregador := TEntregador.Create;
  PopulaEntregadores;
  PopulaRoteiroEntregador;
end;

procedure TfrmRoteiroEntregador.PopulaRoteiroEntregador;
begin
  tbRoteiroEntregador.Close;
  tbRoteiroEntregador.Open;
  if roteiro.getObject('','') then
  begin
    tbRoteiroEntregador.IsLoading := True;
    while not dm.qryGetObject.Eof do
    begin
      tbRoteiroEntregador.Insert;
      tbRoteiroEntregadorID_ROTEIRO.AsInteger := dm.qryGetObject.FieldByName('ID_ROTEIRO').AsInteger;
      tbRoteiroEntregadorDES_ROTEIRO.AsString := dm.qryGetObject.FieldByName('DES_ROTEIRO').AsString;
      tbRoteiroEntregadorCOD_ROTEIRO_ANTIGO.AsString := dm.qryGetObject.FieldByName('COD_ROTEIRO_ANTIGO').AsString;
      tbRoteiroEntregadorCOD_ROTEIRO_NOVO.AsString := dm.qryGetObject.FieldByName('COD_ROTEIRO_NOVO').AsString;
      tbRoteiroEntregadorCOD_CADASTRO.AsInteger := dm.qryGetObject.FieldByName('COD_CADASTRO').AsInteger;
      tbRoteiroEntregadorDOM_MOSTRAR.AsString := dm.qryGetObject.FieldByName('DOM_MOSTRAR').AsString;
      tbRoteiroEntregador.Post;
      dm.qryGetObject.Next;
    end;
    tbRoteiroEntregador.IsLoading := False;
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
  end;
end;

procedure TfrmRoteiroEntregador.ImportaPlanilha;
var
  sLista: String;
  sDetalhe: TStringList;
  ArquivoCSV: TextFile;
  sArquivo: string;
  i: Integer;
  dPercentual: Double;
  LinhasTotal: Integer;
  Contador: Integer;
begin
  sArquivo := '';
  if OpenDialog.Execute then
  begin
    sArquivo := OpenDialog.FileName;
  end
  else
  begin
    Exit;
  end;
  AssignFile(ArquivoCSV, sArquivo);
  dPercentual := 0;
  if not Assigned(frmProcesso) then
  begin
    frmProcesso := TfrmProcesso.Create(Application);
  end;
  Screen.Cursor := crHourGlass;
  frmProcesso.Show;
  frmProcesso.cxGroupBox1.Caption := 'Importando Planilha. Aguarde...';
  frmProcesso.cxGroupBox1.Refresh;
  LinhasTotal := TUtil.NumeroDeLinhasTXT(sArquivo);
  AssignFile(ArquivoCSV, sArquivo);
  Reset(ArquivoCSV);
  sLista := '';
  sDetalhe := TStringList.Create;
  sDetalhe.StrictDelimiter := True;
  sDetalhe.Delimiter := ';';
  while not Eoln(ArquivoCSV) do
  begin
    sDetalhe.DelimitedText := sLista;
    if sDetalhe.Count > 0 then
    begin
      if TUtil.ENumero(sDetalhe[0]) then
      begin
        roteiro.Descricao :=  sDetalhe[2];
        roteiro.RoteiroAntigo := sDetalhe[0];
        roteiro.RoteiroNovo := sDetalhe[1];
        roteiro.Log := FormatDateTime('dd/mm/yyyy hh:mm:yy', Now) + ' Importação planilha ' + sArquivo + ' por ' + uGlobais.sUsuario;
        if not (roteiro.Exist()) then
        begin
          if not (roteiro.Insert()) then
          begin
            Application.MessageBox(PChar('Erro ao incluir ROTEIRO ' + sDetalhe[0]  + '/' + sDetalhe[1] + '!'),
                                   PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
          end;
        end;
      end;
    end;
    Readln(ArquivoCSV, sLista);
    dPosicao := (Contador / LinhasTotal) * 100;
    Inc(Contador);
    frmProcesso.cxProgressBar1.Position := dPosicao;
    frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
    frmProcesso.cxProgressBar1.Refresh;
  end;
  Screen.Cursor := crDefault;
  frmProcesso.Close;
  FreeAndNil(frmProcesso);
  CloseFile(ArquivoCSV);
  sLista := '';
  FreeAndNil(sDetalhe);
  Application.MessageBox('Importação Concluída!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONINFORMATION);
end;

procedure TfrmRoteiroEntregador.Exportar;
var
  FileExt, sFile: String;
begin
  if not(tbRoteiroEntregador.Active) then
  begin
    Exit;
  end;
  if tbRoteiroEntregador.IsEmpty then
  begin
    Exit;
  end;
  SaveDialog.Filter := '';
  SaveDialog.Filter := 'Excel (*.xls) |*.xls|XML (*.xml) |*.xml|Arquivo Texto (*.txt) |*.txt|Página Web (*.html)|*.html';
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

procedure TfrmRoteiroEntregador.tbRoteiroEntregadorAfterPost(DataSet: TDataSet);
begin
  if tbRoteiroEntregador.IsLoading then
  begin
    Exit;
  end;
  SetupClass;
  if not roteiro.Validar() then
  begin
    Exit;
  end;
  if roteiro.ID > 0 then
  begin
    if not roteiro.Update() then
    begin
      Application.MessageBox('Erro ao tentar atualizar os dados!', 'Erro.', MB_OK + MB_ICONERROR);
      Exit;
    end;
  end
  else
  begin
    if not roteiro.Insert() then
    begin
      Application.MessageBox('Erro ao tentar inserir os dados!', 'Erro.', MB_OK + MB_ICONERROR);
      Exit;
    end;
    tbRoteiroEntregador.IsLoading := True;
    tbRoteiroEntregador.Edit;
    tbRoteiroEntregadorID_ROTEIRO.AsInteger := roteiro.RetornaID();
    tbRoteiroEntregador.Post;
    tbRoteiroEntregador.IsLoading := False;
  end;
end;

procedure TfrmRoteiroEntregador.tbRoteiroEntregadorBeforePost(DataSet: TDataSet);
begin
  if tbRoteiroEntregador.IsLoading then
  begin
    Exit;
  end;
  if Application.MessageBox('Confirma Gravar o Roteiro?', 'Gravar.', MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Abort;
    Exit;
  end;
end;

procedure TfrmRoteiroEntregador.SetupClass;
var
  sLog: String;
begin
  sLog := '';
  roteiro.ID := tbRoteiroEntregadorID_ROTEIRO.AsInteger;
  roteiro.Descricao := tbRoteiroEntregadorDES_ROTEIRO.AsString;
  roteiro.Entregador := tbRoteiroEntregadorCOD_CADASTRO.AsInteger;
  roteiro.RoteiroAntigo := tbRoteiroEntregadorCOD_ROTEIRO_ANTIGO.AsString;
  roteiro.RoteiroNovo := tbRoteiroEntregadorCOD_ROTEIRO_NOVO.AsString;
  roteiro.Mostrar := tbRoteiroEntregadorDOM_MOSTRAR.AsString;
  sLog := roteiro.getField('DES_LOG','FILTRO');
  if sLog.IsEmpty then
  begin
    sLog := FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' inserido por ' + uGlobais.sUsuario;
  end
  else
  begin
    sLog := sLog + #13 + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' editado por ' + uGlobais.sUsuario;
  end;
  roteiro.Log := sLog;
end;

procedure TfrmRoteiroEntregador.PopulaEntregadores;
begin
  tbListaEntregadores.Close;
  tbListaEntregadores.Open;
  if entregador.ListaEntregadores then
  begin
    while not dm.qryPesquisa.Eof do
    begin
      tbListaEntregadores.Insert;
      tbListaEntregadoresCOD_CADASTRO.AsInteger := dm.qryPesquisa.FieldByName('COD_CADASTRO').AsInteger;
      tbListaEntregadoresDES_RAZAO_SOCIAL.AsString := dm.qryPesquisa.FieldByName('NOM_FANTASIA').AsString;
      tbListaEntregadores.Post;
      dm.qryPesquisa.Next;
    end;
  end;
  if not tbListaEntregadores.IsEmpty then
  begin
    tbListaEntregadores.First;
  end;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
end;


end.
