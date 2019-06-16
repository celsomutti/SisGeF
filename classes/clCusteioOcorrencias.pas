unit clCusteioOcorrencias;

interface

uses udm, clEntregador, clProdutos, Vcl.Forms, Vcl.Dialogs, System.SysUtils, System.Classes, System.DateUtils, clOcorrenciasJornal,
     System.UITypes, Winapi.Windows, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
     cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
     dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
     dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
     dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
     dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
     dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
     dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
     dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
     cxNavigator, Data.DB, cxDBData, dxmdaset, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
     cxGridDBTableView, cxGrid, cxButtons, cxDBLookupComboBox, cxDropDownEdit, cxContainer, dxCore, cxDateUtils, cxMaskEdit,
     cxCalendar;

type
  TCusteioOcorrencias = class(TObject)
  private
    entregador : TEntregador;
    produtos : TProdutos;
    ocorrencias: TOcorrenciasJornal;
    FMensagem: String;
    FDataInicial: String;
    FDataFinal: String;
    FTipo: Integer;
    procedure SetMensagem(val: String);
    procedure SetDataInicial(val: String);
    procedure SetDataFinal(val: String);
    procedure SetTipo(val: Integer);
    function SeparaDatas(sTexto: String): TStringList;
  public
    constructor Create;
    destructor Destroy; override;
    function ProcessaCusteio(sArquivo: String): Boolean;
    procedure PopulaProdutos;
    procedure PopulaEntregadores;
    property Mensagem: String read FMensagem write SetMensagem;
    property DataInicial: String read FDataInicial write SetDataInicial;
    property DataFinal: String read FDataFinal write SetDataFinal;
    property Tipo: Integer read FTipo write SetTipo;
    procedure PopulaOcorrencias(out tb: TdxMemdata);
    function ProcessaEncerramento(out tb: TdxMemdata): Boolean;
    procedure SetupClassOcorrencia(tb: TdxMemdata);
    function Consolidado: Boolean;
  end;

implementation

uses ufrmProcesso, clUtil, uGlobais, ufrmConsolidadoBaseJornal;

constructor TCusteioOcorrencias.Create;
begin
  inherited Create;
  entregador := TEntregador.Create();
  produtos := TProdutos.Create();
  ocorrencias := TOcorrenciasJornal.Create();
end;

destructor TCusteioOcorrencias.Destroy;
begin
  ocorrencias.Free;
  produtos.Free;
  entregador.Free;
  inherited Destroy;
end;

function TCusteioOcorrencias.ProcessaCusteio(sArquivo: String): Boolean;
var
  sLista: String;
  sDetalhe: TStringList;
  ArquivoCSV: TextFile;
  i: Integer;
  dPercentual: Double;
  LinhasTotal: Integer;
  Contador: Integer;
  sProduto: string;
  sCampo: string;
  sNomeEntregador: String;
  sCodigoEntregador: string;
  sData: String;
  sDataTmp: String;
  sDataLonga: String;
  sTexto: String;
  iQtde: Integer;
  dtData: TDate;
  dValor: Double;
  sMarca: string;
  bFlagData: Boolean;
  iTam: Integer;
begin
  Result := False;
  if Application.MessageBox('Confirma a importação?', PChar('Atenção ' + uGlobais.sUsuario), MB_YESNO + MB_ICONQUESTION) = IDNO then
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
  Readln(ArquivoCSV, sLista);
  dValor := 0;
  iTam := 0;
  Self.Mensagem := '';
  while not Eoln(ArquivoCSV) do
  begin
    iQtde := 0;
    sDetalhe.DelimitedText := sLista;
    if sDetalhe.Count > 0 then
    begin
      if TUtil.ENumero(sDetalhe[0]) then
      begin
        sTexto := sDetalhe[8];
        for i := 0 to Length(sTexto) - 1 do
        begin
          iTam := 10;
          bFlagData := False;
          sDataTmp := Copy(sTexto,i,iTam);
          if Length(Trim(sDataTmp)) = iTam then
          begin
            if StrToDateDef(sDataTmp,0) <> 0 then
            begin
              sData := sDataTmp;
              bFlagData := True;
            end;
          end;
          if bFlagData then
          begin
            if YearOf(StrToDate(sData)) >= (YearOf(Now) - 2) then
            begin
              sMarca := Copy(sTexto,i + iTam,2);
              if sMarca = ' (' then
              begin
                if ocorrencias.LocalizaFinanceiro(sDetalhe[3],sData) then
                begin
                  //if iQtde >= 0 then
                  //begin
                    iQtde := ocorrencias.Qtde;
                  //end
                  //else
                  //begin
                  //  iQtde := 0;
                  //end;
                  Inc(iQtde,1);
                  //iQtde := StrToIntDef(sDetalhe[5],0);;
                  dValor := StrToFloatDef(sDetalhe[6],0);
                  //dValor := StrToFloatDef(sDetalhe[7],0);
                  ocorrencias.Valor := dValor * iQtde;
                  //ocorrencias.Valor := dValor;
                  ocorrencias.Qtde := iQtde;
                  ocorrencias.Status := 4;
                  ocorrencias.DataDesconto := StrToDate(sDetalhe[2]);
                  if not ocorrencias.Update then
                  begin
                    Self.Mensagem := Self.Mensagem + '>> Erro ao alterar a ocorrência ' + sDetalhe[3] + ' de ' + sData + ' !' + #13;
                  end;
                end
                else
                begin
                  Self.Mensagem  := Self.Mensagem + '>> Ocorrência não localizada Assinatura Código: ' +
                                    sDetalhe[3] + ' de ' + sData + ' !' + #13;
                end;
              end;
            end;
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
  Result := True;
end;

procedure TCusteioOcorrencias.PopulaProdutos;
begin
  if dm.tbProdutos.Active then
  begin
    dm.tbProdutos.Close;
  end;
  dm.tbProdutos.Open;
  if produtos.getObjects then
  begin
    dm.tbProdutos.IsLoading := True;
    dm.tbProdutos.LoadFromDataSet(dm.qryGetObject1);
    dm.tbProdutos.IsLoading := False;
    if not dm.tbProdutos.IsEmpty then
    begin
      dm.tbProdutos.First;
    end;
  end;
  dm.qryGetObject1.Close;
  dm.qryGetObject1.SQL.Clear;
end;

procedure TCusteioOcorrencias.PopulaEntregadores;
begin
  dm.tbListaEntregadores.Close;
  dm.tbListaEntregadores.Open;
  if entregador.ListaEntregadores then
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

procedure TCusteioOcorrencias.SetMensagem(val: String);
begin
  FMensagem := val;
end;

procedure TCusteioOcorrencias.SetDataInicial(val: String);
begin
  FDataInicial := val;
end;

procedure TCusteioOcorrencias.SetDataFinal(val: String);
begin
  FDataFinal := val;
end;

procedure TCusteioOcorrencias.SetTipo(val: Integer);
begin
  FTipo := val;
end;

procedure TCusteioOcorrencias.PopulaOcorrencias(out tb: TdxMemdata);
var
  i: Integer;
  iRecords: Integer;
  iContador: Integer;
begin
  tb.Close;
  tb.Open;
  if not ocorrencias.Periodo(Self.DataInicial, Self.DataFinal, Self.Tipo) then
  begin
    Application.MessageBox('Nenhuma ocorrência encontrada no período informado!', PChar('Atenção ' + uGlobais.sUsuario),
                           MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if not Assigned(frmProcesso) then
  begin
    frmProcesso := TfrmProcesso.Create(Application);
  end;
  frmProcesso.Show;
  frmProcesso.cxGroupBox1.Caption := 'Aguarde...';
  frmProcesso.cxGroupBox1.Refresh;
  iRecords := dm.qryPesquisa.RecordCount;
  iContador := 1;
  dPosicao := 0;
  while not dm.qryPesquisa.Eof do
  begin
    tb.Insert;
    for i := 0 to dm.qryPesquisa.Fields.Count - 1 do
    begin
      tb.FieldByName(dm.qryPesquisa.Fields[i].FieldName).Value := dm.qryPesquisa.Fields[i].Value;
    end;
    tb.Post;
    dPosicao := (iContador / iRecords) * 100;
    Inc(iContador,1);
    frmProcesso.cxProgressBar1.Position := dPosicao;
    frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
    frmProcesso.cxProgressBar1.Refresh;
    dm.qryPesquisa.Next;
  end;
  frmProcesso.Close;
  FreeAndNil(frmProcesso);
  if not tb.IsEmpty then
  begin
    tb.First;
  end;
end;

function TCusteioOcorrencias.ProcessaEncerramento(out tb: TdxMemdata): Boolean;
var
  sCodigo: string;
  sData: string;
  i: Integer;
  iRecords: Integer;
  iContador: Integer;
  dPosicao : Double;
begin
  Result := False;
  try
    if not tb.Active then
    begin
      Exit;
    end;
    if not tb.IsEmpty then
    begin
      Exit;
    end;
    if Application.MessageBox('Confirma o Encerramento?', PChar('Atenção ' + uGlobais.sUsuario), MB_YESNO + MB_ICONQUESTION) = IDNO then
    begin
      Exit;
    end;
    if not Assigned(frmProcesso) then
    begin
      frmProcesso := TfrmProcesso.Create(Application);
    end;
    frmProcesso.Show;
    frmProcesso.cxGroupBox1.Caption := 'Aguarde...';
    frmProcesso.cxGroupBox1.Refresh;
    iRecords := tb.RecordCount;
    iContador := 0;
    dPosicao := 0;
    Self.Mensagem := '';
    while not tb.Eof do
    begin
      if tb.FieldByName('COD_STATUS').AsInteger < 1 then
      begin
        SetupClassOcorrencia(tb);
        ocorrencias.Status := 3;
        if not ocorrencias.Update() then
        begin
          sCodigo := tb.FieldByName('COD_ASSINATURA').AsString;
          sData := tb.FieldByName('DAT_OCORRENCIA').AsString;
          Self.Mensagem := Self.Mensagem + '>> Erro ao alterar a ocorrência ' + sCodigo + ' de ' + sData + ' !' + #13;
        end;
      end;
      dPosicao := (iContador / iRecords) * 100;
      Inc(iContador,1);
      frmProcesso.cxProgressBar1.Position := dPosicao;
      frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
      frmProcesso.cxProgressBar1.Refresh;
      tb.Next
    end;
  finally
  frmProcesso.Close;
  FreeAndNil(frmProcesso);
  tb.Close;
  Application.MessageBox('Importação Concluída!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONINFORMATION);
  Result := True;
  end;
end;

procedure TCusteioOcorrencias.SetupClassOcorrencia(tb: TdxMemdata);
begin
  ocorrencias.Numero :=  tb.FieldByName('NUM_OCORRENCIA').AsInteger;
  ocorrencias.Data := tb.FieldByName('DAT_OCORRENCIA').AsDateTime;
  ocorrencias.Assinatura := tb.FieldByName('COD_ASSINATURA').AsString;
  ocorrencias.Nome := tb.FieldByName('NOM_ASSINANTE').AsString;
  ocorrencias.Roteiro := tb.FieldByName('DES_ROTEIRO').AsString;
  ocorrencias.Entregador := tb.FieldByName('COD_ENTREGADOR').AsInteger;
  ocorrencias.Produto := tb.FieldByName('COD_PRODUTO').AsString;
  ocorrencias.Ocorrencia := tb.FieldByName('COD_OCORRENCIA').AsInteger;
  ocorrencias.Reincidencia := tb.FieldByName('DOM_REINCIDENTE').AsString;
  ocorrencias.Descricao := tb.FieldByName('DES_DESCRICAO').AsString;
  ocorrencias.Endereco := tb.FieldByName('DES_ENDERECO').AsString;
  ocorrencias.Retorno := tb.FieldByName('DES_RETORNO').AsString;
  ocorrencias.Resultado := tb.FieldByName('COD_RESULTADO').AsInteger;
  ocorrencias.Origem := tb.FieldByName('COD_ORIGEM').AsInteger;
  ocorrencias.Obs := tb.FieldByName('DES_OBS').AsString;
  ocorrencias.Status := tb.FieldByName('COD_STATUS').AsInteger;
  ocorrencias.Apuracao := tb.FieldByName('DES_APURACAO').AsString;
  ocorrencias.Qtde := tb.FieldByName('QTD_OCORRENCIAS').AsInteger;
  ocorrencias.Valor := tb.FieldByName('VAL_OCORRENCIA').AsFloat;
  ocorrencias.DataDesconto := tb.FieldByName('DAT_DESCONTO').AsDateTime;
  ocorrencias.Log := tb.FieldByName('DES_LOG').AsString;
end;

function TCusteioOcorrencias.Consolidado: Boolean;
begin
try
  Result := False;
  if not ocorrencias.Consolidado(Self.DataInicial,Self.DataFinal) then
  begin
    Application.MessageBox('Periodo não encontrado!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if not Assigned(frmConsolidadoBaseJornal) then
  begin
    frmConsolidadoBaseJornal := TfrmConsolidadoBaseJornal.Create(Application);
  end;
  frmConsolidadoBaseJornal.ShowModal;
  Result := True;
finally
  FreeAndNil(frmConsolidadoBaseJornal);
end;
end;

function TCusteioOcorrencias.SeparaDatas(sTexto: string): TStringList;
var
  lResultado : TStringList;
  i : Integer;
  sCaracter : String;
  sData: String;
begin
  try
    lResultado := TStringList.Create();
    sCaracter := '';
    sData := '';
    for i := 0 to Length(sTexto) - 1 do
    begin
      sCaracter := Copy(sTexto,i,1);
      if Pos(sCaracter,'0123456789/') <> 0 then
      begin
        sData := sData + sCaracter;
      end
      else
      begin
        if StrToDateDef(sData,0) <> 0 then
        begin
          lResultado.Add(sData);
        end;
        sData := '';
      end;
    end;
    Result := lResultado;
  finally
    lResultado.Free;
  end;
end;

end.
