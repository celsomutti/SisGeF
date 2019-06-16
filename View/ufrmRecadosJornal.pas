unit ufrmRecadosJornal;

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
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxLabel, dxSkinscxPCPainter, dxLayoutContainer, dxLayoutControl, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxMaskEdit, cxTextEdit, cxMemo, cxDBLookupComboBox, cxBlobEdit, cxCalendar,
  clAssinantesJornal, dxLayoutControlAdapters, Vcl.Menus, System.Actions, Vcl.ActnList, Vcl.StdCtrls, cxButtons,
  dxLayoutcxEditAdapters, Vcl.ComCtrls, dxCore, cxDateUtils, cxDropDownEdit, frxClass, frxDBSet, clRoteiroEntregador,
  cxImageComboBox, clProdutos, Vcl.Clipbrd;

type
  TfrmRecadosJornal = class(TForm)
    cxLabel27: TcxLabel;
    lcRecadosJornalGroup_Root: TdxLayoutGroup;
    lcRecadosJornal: TdxLayoutControl;
    tvRecados: TcxGridDBTableView;
    lvRecados: TcxGridLevel;
    grdRecados: TcxGrid;
    lcRecadosJornalItem1: TdxLayoutItem;
    dsRecados: TDataSource;
    tvRecadosID_RECADO: TcxGridDBColumn;
    tvRecadosCOD_ASSINATURA: TcxGridDBColumn;
    tvRecadosNOM_ASSINANTE: TcxGridDBColumn;
    tvRecadosDES_ENDERECO: TcxGridDBColumn;
    tvRecadosDES_RECADO: TcxGridDBColumn;
    tvRecadosCOD_RESULTADO: TcxGridDBColumn;
    tvRecadosCOD_ORIGEM: TcxGridDBColumn;
    tvRecadosDES_MOTIVO: TcxGridDBColumn;
    tvRecadosDES_LOG: TcxGridDBColumn;
    tvRecadosDAT_OCORRENCIA: TcxGridDBColumn;
    tvRecadosDES_ROTEIRO: TcxGridDBColumn;
    dsResultados: TDataSource;
    dsOrigens: TDataSource;
    cxButton1: TcxButton;
    lcRecadosJornalItem2: TdxLayoutItem;
    aclRecados: TActionList;
    actFechar: TAction;
    datInicio: TcxDateEdit;
    lcRecadosJornalItem3: TdxLayoutItem;
    datFinal: TcxDateEdit;
    lcRecadosJornalItem4: TdxLayoutItem;
    lcRecadosJornalGroup1: TdxLayoutAutoCreatedGroup;
    actPesquisar: TAction;
    cxButton2: TcxButton;
    lcRecadosJornalItem5: TdxLayoutItem;
    rptRecados: TfrxReport;
    dsrepRecados: TfrxDBDataset;
    tvRecadosDOM_IMPRESSAO: TcxGridDBColumn;
    actImprimir: TAction;
    cxButton3: TcxButton;
    lcRecadosJornalItem6: TdxLayoutItem;
    lcRecadosJornalGroup2: TdxLayoutAutoCreatedGroup;
    tvRecadosDES_PRODUTO: TcxGridDBColumn;
    dsProdutos: TDataSource;
    actColar: TAction;
    cxButton4: TcxButton;
    lcRecadosJornalItem7: TdxLayoutItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tvRecadosCOD_ASSINATURAPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure FormShow(Sender: TObject);
    procedure dsRecadosStateChange(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
    procedure actPesquisarExecute(Sender: TObject);
    procedure actImprimirExecute(Sender: TObject);
    procedure actColarExecute(Sender: TObject);
  private
    { Private declarations }
    procedure AtualizaAssinatura(sAssinatura: String);
    procedure ProcessarFiltro;
    procedure ImprimirRecado;
    procedure SalvaImpressos;
    procedure PasteGrade;
  public
    { Public declarations }
  end;

var
  frmRecadosJornal : TfrmRecadosJornal;
  assinante : TAssinantesJornal;
  roteiro : TRoteiroEntregador;
  produto : TProdutos;
  bFlagPopula : Boolean;
implementation

{$R *.dfm}

uses udm, uGlobais, clUtil, ufrmImpressao, ufrmProcesso;

procedure TfrmRecadosJornal.dsRecadosStateChange(Sender: TObject);
begin
  if TDataSource(Sender).DataSet.State in [dsInsert, dsEdit] then
  begin
    bFlagPopula := False;
    actColar.Enabled := False;
    actImprimir.Enabled := False;
  end
  else if TDataSource(Sender).DataSet.State in [dsBrowse] then
  begin
    bFlagPopula := True;
    actColar.Enabled := True;
    actImprimir.Enabled := True;
  end;
end;

procedure TfrmRecadosJornal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm.qryProdutosJornal.Close;
  dm.qryResultadosRecados.Close;
  dm.qryOrigensResultadosRecados.Close;
  dm.qryRecados.Close;
  Action := caFree;
  frmRecadosJornal := Nil;
end;

procedure TfrmRecadosJornal.FormShow(Sender: TObject);
begin
  bFlagPopula := False;
  if uGlobais.iNivelUsuario = 0 then
  begin
    tvRecadosDES_LOG.Visible := True;
  end
  else
  begin
    tvRecadosDES_LOG.Visible := False;
  end;
  dm.qryProdutosJornal.Open;
  dm.qryResultadosRecados.Open;
  dm.qryOrigensResultadosRecados.Open;
end;

procedure TfrmRecadosJornal.tvRecadosCOD_ASSINATURAPropertiesValidate(Sender: TObject; var DisplayValue: Variant;
  var ErrorText: TCaption; var Error: Boolean);
begin
  if not bFlagPopula then
  begin
    AtualizaAssinatura(DisplayValue);
  end;
end;

procedure TfrmRecadosJornal.actColarExecute(Sender: TObject);
begin
  PasteGrade;
end;

procedure TfrmRecadosJornal.actFecharExecute(Sender: TObject);
begin
  Perform(WM_CLOSE, 0, 0);
end;

procedure TfrmRecadosJornal.actImprimirExecute(Sender: TObject);
begin
  ImprimirRecado;
end;

procedure TfrmRecadosJornal.actPesquisarExecute(Sender: TObject);
begin
  ProcessarFiltro;
end;

procedure TfrmRecadosJornal.AtualizaAssinatura(sAssinatura: String);
var
  sEndereco : String;
  sRoteiro : String;
  sProduto : String;
begin
  try
    sEndereco := '';
    sRoteiro := '';
    sProduto := '';
    if not dm.qryRecados.Active then
    begin
      Exit;
    end;
    assinante := TAssinantesJornal.Create;
    roteiro := TRoteiroEntregador.Create;
    produto := TProdutos.Create;
    if assinante.getObject(sAssinatura,'CODIGO') then
    begin
      produto.Codigo := assinante.Produto;
      sProduto := produto.getField('DES_PRODUTO','CODIGO');
      roteiro.RoteiroNovo := assinante.Roteiro;
      sRoteiro := roteiro.getField('COD_ROTEIRO_ANTIGO','NOVO');
      if sRoteiro.IsEmpty then
      begin
        sRoteiro := assinante.Roteiro;
      end;
      bFlagPopula := False;
      dm.qryRecadosCOD_ASSINATURA.AsString := sAssinatura;
      dm.qryRecadosNOM_ASSINANTE.AsString := assinante.Nome;
      sEndereco := Trim(assinante.TipoLogradouro) + ' ' + Trim(assinante.Logradouro) + ', ' + Trim(assinante.Numero);
      if not assinante.Complemento.IsEmpty then
      begin
        sEndereco := sEndereco + ' - ' + Trim(assinante.Complemento);
      end;
      sEndereco := sEndereco + ' Bairro: ' + Trim(assinante.Bairro) + ' CEP: ' + Trim(assinante.CEP) + ' ' +
                   Trim(assinante.Cidade) + ' - ' + Trim(assinante.Estado) + ' Agente: ' + Trim(sRoteiro);
    end;
    dm.qryRecadosDES_PRODUTO.AsString := sProduto;
    dm.qryRecadosDES_ENDERECO.AsString := sEndereco;
    dm.qryRecadosDES_ROTEIRO.AsString := sRoteiro;
  finally
    assinante.Free;
    roteiro.Free;
    produto.Free;
  end;
end;

procedure TfrmRecadosJornal.ProcessarFiltro;
var
  sFiltro : String;
begin
  bFlagPopula := True;
  sFiltro := '';
  dm.qryRecados.Close;
  dm.qryRecados.Filtered := False;
  if not TUtil.Empty(datInicio.Text) then
  begin
    sFiltro := 'DAT_OCORRENCIA >= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', datInicio.Date));
  end;
  if not TUtil.Empty(datFinal.Text) then
  begin
    if not sFiltro.IsEmpty then
    begin
        sFiltro := sFiltro + ' AND ';
    end;
    sFiltro := sFiltro + 'DAT_OCORRENCIA <= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', datFinal.Date));
  end;
  if (not TUtil.Empty(datFinal.Text)) and (not TUtil.Empty(datInicio.Text))  then
  begin
    if datFinal.Date < datFinal.Date then
    begin
      Application.MessageBox('A data Final do período é menor que a data Inicial!', PChar('Atenção ' + uGlobais.sUsuario),
                             MB_OK + MB_ICONEXCLAMATION);
      datFinal.SetFocus;
      Exit;
    end;
  end;
  if not sFiltro.IsEmpty then
  begin
    dm.qryRecados.FilterOptions := [foCaseInsensitive];
    dm.qryRecados.Filter := sFiltro;
    dm.qryRecados.Filtered := True;
  end;
  dm.qryRecados.Open;
  bFlagPopula := False;
end;

procedure TfrmRecadosJornal.ImprimirRecado;
var
  sImpressao: string;
begin
  with rptRecados do begin
    if not Assigned(frmImpressao) then begin
      frmImpressao := TfrmImpressao.Create(Application);
    end;
    frmImpressao.cxLabel1.Caption := 'DECLARAÇÃO';
    frmImpressao.cxArquivo.Text := ExtractFilePath(Application.ExeName) + 'Reports\frxRecadosJornal.fr3';
    if frmImpressao.ShowModal <> mrOk then
    begin
      FreeAndNil(frmImpressao);
      Exit;
    end
    else begin
      if (not FileExists(frmImpressao.cxArquivo.Text)) then begin
        Application.MessageBox(PChar('Arquivo ' + frmImpressao.cxArquivo.Text +
                               ' não foi encontrado!'), 'Atenção', MB_OK + MB_ICONWARNING);
        Exit;
      end;
    end;
    LoadFromFile(frmImpressao.cxArquivo.Text);
    sImpressao := 'Impresso pelo ' + Application.Title + ' Versão ' + TUtil.VersaoExe + ' por ' + uGlobais.sNomeUsuario +
                  ' em ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now);
    Variables.Items[Variables.IndexOf('parImpressao')].Value :=  QuotedStr(sImpressao);
    FreeAndNil(frmImpressao);
    if (not uGlobais.bFlagImprimir) then
    begin
      ShowReport(True);
    end
    else
    begin
      Print;
    end;
  end;
end;

procedure TfrmRecadosJornal.SalvaImpressos;
var
  iRecords: Integer;
  iContador: Integer;
begin
  try
    if not dm.qryRecados.Active then
    begin
      Exit;
    end;
    if dm.qryRecados.IsEmpty then
    begin
      Exit;
    end;
    Screen.Cursor := crHourGlass;
    if not Assigned(frmProcesso) then
    begin
      frmProcesso := TfrmProcesso.Create(Application);
    end;
    frmProcesso.Show;
    frmProcesso.cxGroupBox1.Caption := 'Aguarde...';
    frmProcesso.cxGroupBox1.Refresh;
    iRecords := dm.qryRecados.RecordCount;
    iContador := 1;
    dPosicao := 0;
    dm.qryRecados.First;
    while not dm.qryRecados.Eof do
    begin
      if dm.qryRecadosDOM_IMPRESSAO.AsString = 'P' then
      begin
        dm.qryRecados.Edit;
        dm.qryRecadosDOM_IMPRESSAO.AsString := 'S';
        dm.qryRecados.Post;
      end;
      dPosicao := (iContador / iRecords) * 100;
      Inc(iContador,1);
      frmProcesso.cxProgressBar1.Position := dPosicao;
      frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
      frmProcesso.cxProgressBar1.Refresh;
      dm.qryRecados.Next;
    end;
  finally
    Screen.Cursor := crDefault;
    frmProcesso.Close;
    FreeAndNil(frmProcesso);
    if not dm.qryRecados.IsEmpty then
    begin
      dm.qryRecados.First;
    end;
  end;

end;

procedure TfrmRecadosJornal.PasteGrade;
var
  sLista: TStringList;
  sDetalhe: TStringList;
  sEndereco: String;
  i, x: integer;
  sChave: String;
  sRoteiro: string;
  ixC: Integer;
  sAssinante: String;
begin
  if Clipboard.AsText.IsEmpty then
  begin
    Exit;
  end;
  if not dm.qryRecados.Active then
  begin
    Exit;
  end;
  try
    bFlagPopula := True;
    sAssinante := '';
    sLista := TStringList.Create;
    sLista.Text := Clipboard.AsText;
    sDetalhe := TStringList.Create;
    sDetalhe.StrictDelimiter := True;
    sDetalhe.Delimiter := #9;
    assinante := TAssinantesJornal.Create;
    roteiro := TRoteiroEntregador.Create;
    produto := TProdutos.Create;
    i := 0;
    ixC := 0;
    for i := 0 to sLista.Count - 1 do
    begin
      sDetalhe.DelimitedText := sLista[i];
      ixC := sDetalhe.Count - 1;
      x := 0;
      if sDetalhe.Count > 0 then
      begin
        if StrToFloatDef(sDetalhe[x],-1) >= 0 then
        begin
          dm.qryRecados.Insert;
          sAssinante :=  FloatToStr(StrToFloatDef(sDetalhe[x],0));
          dm.qryRecadosCOD_ASSINATURA.AsString := sAssinante;
          Inc(x);
          if x <= ixC then
          begin
            dm.qryRecadosNOM_ASSINANTE.AsString := sDetalhe[x];
          end;
          Inc(x);
          sEndereco := '';
          if assinante.getObject(sAssinante,'CODIGO') then
          begin
            dm.qryRecadosNOM_ASSINANTE.AsString := Trim(assinante.Nome);
            roteiro.RoteiroNovo := assinante.Roteiro;
            sRoteiro := roteiro.getField('COD_ROTEIRO_ANTIGO', 'NOVO');
            sEndereco := Trim(assinante.TipoLogradouro) + ' ' + Trim(assinante.Logradouro) + ', ' + Trim(assinante.Numero) + ' ' +
                         Trim(assinante.Complemento) + ' ' + Trim(assinante.Bairro) + ', ' + Trim(assinante.Cidade) + '/'
                         + assinante.Estado + ', ' + Copy(assinante.CEP,1,5) + '-' + Copy(assinante.CEP,6,3) + ' Agente:' +
                         Trim(sRoteiro);
            produto.Codigo := assinante.Produto;
            dm.qryRecadosDES_PRODUTO.AsString := produto.getField('DES_PRODUTO','CODIGO');
            if not sRoteiro.isEmpty then
            begin
              dm.qryRecadosDES_ROTEIRO.AsString := sRoteiro;
            end
            else
            begin
              dm.qryRecadosDES_ROTEIRO.AsString := assinante.Roteiro;
            end;
            dm.qryRecadosDES_ENDERECO.Text := sEndereco;
            dm.qryGetObject.Close;
            dm.qryGetObject.SQL.Clear;
          end;
        end;
      end;
    end;
    tvRecadosDAT_OCORRENCIA.FocusWithSelection;
  finally
    assinante.Free;
    roteiro.Free;
    produto.Free;
    FreeAndNil(sLista);
    FreeAndNil(sDetalhe);
    Clipboard.Clear;
    bFlagPopula := False;
  end;
end;


end.
