unit ufrmAtribuicoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp,
  dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,     
  cxLabel, cxTextEdit, cxMaskEdit, cxButtonEdit, Menus, ActnList, StdCtrls,
  cxButtons, DB, dxmdaset, cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxCalendar, cxSpinEdit, clEntregador, clAtribuicoes, clEntrega,
  cxProgressBar, cxListBox, cxPCdxBarPopupMenu, cxPC, cxMemo, cxCheckBox, cxNavigator;

type
  TCSVAtribuicoes = record
    _codigoagenteTFO: String;
    _nomeagenteTFO: String;
    _codigoentregador: String;
    _nomeentregador: String;
    _nomeentregadoratribuido: String;
    _dataultimaatribuicao: String;
    _codigocliente: String;
    _nomecliente: String;
    _pedido: String;
    _nossonumero: String;
    _cep: String;
    _volumes: String;
    _pesoreal: String;
    _pesofranquia: String;
    _verbafranquia: String;
    _advalorem: String;
    _pagofranquia: String;
    _situacao: String;
    end;
  TfrmAtribuicoes = class(TForm)
    aclImportaEntrega: TActionList;
    actImportarAtribuicaoImportar: TAction;
    actImportaAtribuicaoSair: TAction;
    OpenDialog1: TOpenDialog;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxLabel1: TcxLabel;
    cxLabel6: TcxLabel;
    cxArquivo: TcxButtonEdit;
    cxButton2: TcxButton;
    cxProgressBar1: TcxProgressBar;
    cxLabel7: TcxLabel;
    cxButton3: TcxButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dsPendencias: TDataSource;
    colNUM_NOSSONUMERO: TcxGridDBColumn;
    colCOD_ENTREGADOR: TcxGridDBColumn;
    colNUM_CEP: TcxGridDBColumn;
    colDAT_ATRIBUICAO: TcxGridDBColumn;
    colCOD_CLIENTE: TcxGridDBColumn;
    colNUM_PEDIDO: TcxGridDBColumn;
    colDES_OCORRENCIA: TcxGridDBColumn;
    cxButton1: TcxButton;
    actImportarAtribuicaoEntregador: TAction;
    cxLabel2: TcxLabel;
    cxButton4: TcxButton;
    actImportarAtribuicaoReprocessar: TAction;
    cxLabel3: TcxLabel;
    cxProgressBar2: TcxProgressBar;
    actImportarAtribuicaoExcluir: TAction;
    cxButton5: TcxButton;
    cxLog: TcxMemo;
    colCOD_STATUS: TcxGridDBColumn;
    colDOM_EXCLUIR: TcxGridDBColumn;
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actImportarAtribuicaoImportarExecute(Sender: TObject);
    procedure actImportaAtribuicaoSairExecute(Sender: TObject);
    procedure cxPageControl1PageChanging(Sender: TObject;
      NewPage: TcxTabSheet; var AllowChange: Boolean);
    procedure actImportarAtribuicaoEntregadorExecute(Sender: TObject);
    procedure dsPendenciasStateChange(Sender: TObject);
    procedure actImportarAtribuicaoReprocessarExecute(Sender: TObject);
    procedure actImportarAtribuicaoExcluirExecute(Sender: TObject);
   private
    { Private declarations }
  public
    { Public declarations }
    function TrataComplemento(sLinha: String): String;
    function Importar(): Boolean;
  end;

var
  frmAtribuicoes: TfrmAtribuicoes;
  entregador: TEntregador;
  atribuicao: TAtribuicoes;
  entrega: TEntrega;
  CSVAtribuicao: TCSVAtribuicoes;
implementation

{$R *.dfm}

uses
  udm, ufrmPrincipal, clUtil, Math, ufrmListaApoio, uGlobais, ufrmFormaExclusao;

procedure TfrmAtribuicoes.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  if OpenDialog1.Execute then
    cxArquivo.Text := OpenDialog1.FileName;
end;

procedure TfrmAtribuicoes.FormShow(Sender: TObject);
begin
  entregador := TEntregador.Create();
  atribuicao := TAtribuicoes.Create();
  entrega := TEntrega.Create();
end;

procedure TfrmAtribuicoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  entregador.Free;
  atribuicao.Free;
  entrega.Free;
  Action := caFree;
  frmAtribuicoes := Nil;
end;

procedure TfrmAtribuicoes.actImportarAtribuicaoImportarExecute(
  Sender: TObject);
begin
  if TUtil.Empty(cxArquivo.Text) then begin
    MessageDlg('Informe o nome do arquivo.',mtWarning,[mbOK],0);
    Exit;
  end;

  if not FileExists(cxArquivo.Text) then begin
    MessageDlg('Arquivo informado não foi encontrado!',mtWarning,[mbOK],0);
    Exit;
  end;

  if Application.MessageBox('Confirma a importação dos dados?','Importar Atribuições',MB_ICONQUESTION + MB_YESNO) = IDNO then
    Exit;

  cxLog.Clear;
  cxTabSheet2.Enabled := False;
  cxLog.Lines.Add('Início da Importação: ' + DateTimeToStr(Now));
  cxLog.Refresh;
  if Importar() then begin
    cxLog.Lines.Add('Término da Importação: ' + DateTimeToStr(Now));
    cxLog.Refresh;
    MessageDlg('Importação concluída!',mtInformation,[mbOK],0);
  end;
  cxTabSheet2.Enabled := True;
  cxArquivo.Clear;

  end;

procedure TfrmAtribuicoes.actImportaAtribuicaoSairExecute(
  Sender: TObject);
begin
  Close;
end;

function TfrmAtribuicoes.TrataComplemento(sLinha: String): String;
var
  iConta: Integer;
  sLin: String;
  bFlag: Boolean;
begin

  if Pos('"',sLinha) = 0 then begin
    Result := sLinha;
    Exit;
  end;

  iConta := 1;
  bFlag := False;
  sLin := '';
  while sLinha[iConta] >= ' ' do begin
    if sLinha[iConta] = '"' then begin
      if bFlag then
        bFlag := False
      else
        bFlag := True;
    end;
    if bFlag then begin
      if sLinha[iConta] = ';' then
        sLin := sLin + ' '
      else
        sLin := sLin + sLinha[iConta];
    end
    else
      sLin := sLin + sLinha[iConta];
    Inc(iConta);
  end;
  Result := sLin;
end;

function TfrmAtribuicoes.Importar(): Boolean;
var
  ArquivoCSV: TextFile;
  Contador, I, LinhasTotal,iAgente: Integer;
  Linha,campo,sOcorrencia: String;
  bPendente: Boolean;

   // Lê Linha e Monta os valores
  function MontaValor: String;
  var
    ValorMontado: String;
  begin
    ValorMontado := '';
    inc(I);
    While Linha[I] >= ' ' do
    begin
      If Linha[I] = ';' then // vc pode usar qualquer delimitador ... eu
        // estou usando o ";"
        break;
      ValorMontado := ValorMontado + Linha[I];
      inc(I);
    end;
    result := ValorMontado;
  end;

begin

  Result := False;

  LinhasTotal := TUtil.NumeroDeLinhasTXT(cxArquivo.Text);

  // Carregando o arquivo ...
  AssignFile(ArquivoCSV, cxArquivo.Text);
  try
    Reset(ArquivoCSV);
    Readln(ArquivoCSV, Linha);
    if Copy(Linha,0,18) <> 'EXPRESSA DATA BASE' then begin
      MessageDlg('Arquivo informado não é de EXTRATO DE EXPRESSA.',mtWarning,[mbOK],0);
      Exit;
    end;
    Readln(ArquivoCSV, Linha);
    Readln(ArquivoCSV, Linha);
    Readln(ArquivoCSV, Linha);
    Linha := TrataComplemento(Linha);
    contador := 4;
    cxProgressBar1.Clear;
    while not Eoln(ArquivoCSV) do begin
      bPendente := False;
      sOcorrencia := '';
      iAgente := 0;
      with CSVAtribuicao do begin
        _codigoagenteTFO := MontaValor;
        _nomeagenteTFO := MontaValor;
        _codigoentregador := MontaValor;
        _nomeentregador := MontaValor;
        _nomeentregadoratribuido := MontaValor;
        _dataultimaatribuicao := MontaValor;
        _codigocliente := MontaValor;
        _nomecliente := MontaValor;
        _pedido := MontaValor;
        _nossonumero := MontaValor;
        _cep := MontaValor;
        _volumes := MontaValor;
        _pesoreal := MontaValor;
        _pesofranquia := MontaValor;
        _verbafranquia := MontaValor;
        _advalorem := MontaValor;
        _pagofranquia := MontaValor;
        _situacao:= MontaValor;
      end;
      atribuicao.Entregador := StrToInt(CSVAtribuicao._codigoentregador);
      if atribuicao.Entregador = 0 then begin
        atribuicao.Entregador := 1;
        iAgente := 1;
      end
      else if not (entregador.getObject(IntToStr(atribuicao.Entregador),'CODIGO')) then begin
        bPendente := True;
        sOcorrencia := sOcorrencia + '<Código de Entregador não cadastrado.>';
        iAgente := 0;
      end
      else begin
        iAgente := entregador.Agente;
      end;
      if not (TUtil.Empty(CSVAtribuicao._dataultimaatribuicao)) then
        atribuicao.Data := StrToDateTime(CSVAtribuicao._dataultimaatribuicao);
      atribuicao.Cliente := StrToInt(CSVAtribuicao._codigocliente);
      atribuicao.Pedido  := CSVAtribuicao._pedido;
      atribuicao.NossoNumero := CSVAtribuicao._nossonumero;
      atribuicao.Cep := CSVAtribuicao._cep;
      atribuicao.PesoReal := StrToFloat(CSVAtribuicao._pesoreal);
      atribuicao.PesoFranquia := StrToFloat(CSVAtribuicao._pesofranquia);
      atribuicao.VerbaFranquia := StrToFloat(CSVAtribuicao._verbafranquia);
      atribuicao.Advalorem := StrToFloat(CSVAtribuicao._advalorem);
      atribuicao.PagoFranquia := StrToFloat(CSVAtribuicao._pagofranquia);
      if not (entrega.getObject(atribuicao.NossoNumero,'NOSSONUMERO')) then begin
        bPendente := True;
        sOcorrencia := sOcorrencia + '<Entrega não encontrada na base de dados.>';
      end;
      atribuicao.Status := entrega.Status;
      if entrega.Baixado = 'N' then begin
        bPendente := True;
        sOcorrencia := sOcorrencia + '<Entrega NÃO foi baixada.>';
      end;
      if not (bPendente) then begin
        entrega.Agente := iAgente;
        entrega.Cliente := atribuicao.Cliente;
        entrega.PesoReal := atribuicao.PesoReal;
        entrega.PesoFranquia := atribuicao.PesoFranquia;
        entrega.VerbaDistribuicao := atribuicao.VerbaFranquia;
        entrega.Advalorem := atribuicao.Advalorem;
        entrega.ValorFranquia := atribuicao.PagoFranquia;
        if not (entrega.Update()) then begin
          cxLog.Lines.Add('Erro ao Atribuir a Entrega NN ' + atribuicao.NossoNumero + '.');
          cxLog.Refresh;
          sOcorrencia :=  sOcorrencia + '<Falha da Atribuição desta Entrega.>';
          bPendente := True;
        end;
      end;
      atribuicao.Ocorrencia := sOcorrencia;
      if bPendente then begin
        if atribuicao.JaExiste() then begin
          if not (atribuicao.Update()) then begin
            cxLog.Lines.Add('Erro ao Alterar a Pendência da NN ' + atribuicao.NossoNumero + '.');
            cxLog.Refresh;
          end
        end
        else begin
          if not (atribuicao.Insert()) then begin
            cxLog.Lines.Add('Erro ao Incluir a Pendência da NN ' + atribuicao.NossoNumero + '.');
            cxLog.Refresh;
          end;
        end;
      end;
      I := 1;
      Readln(ArquivoCSV, Linha);
      Linha := TrataComplemento(Linha);
      Contador := Contador + 1;
      cxProgressBar1.Position := (contador / LinhasTotal) * 100;
      cxProgressBar1.Properties.Text := 'Registro ' + IntToStr(contador) + ' de ' + IntToStr(LinhasTotal);
      cxProgressBar1.Refresh;
    end;
    cxProgressBar1.Clear;
    cxProgressBar1.Properties.Text := '';
    Result := True;
  finally
    CloseFile(ArquivoCSV);
  end;
end;


procedure TfrmAtribuicoes.cxPageControl1PageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  if NewPage.TabIndex = 1 then begin
    if dm.qryGeral.Active then
      dm.qryGeral.Close;
    dm.qryGeral.SQL.Clear;
    dm.qryGeral.SQL.Add('SELECT * FROM TBATRIBUICOESPENDENTES');
    dm.qryGeral.Open;
  end
  else begin
    dm.qryGeral.Close;
    dm.qryGeral.SQL.Clear;
  end;
end;

procedure TfrmAtribuicoes.actImportarAtribuicaoEntregadorExecute(
  Sender: TObject);
var
  sCampo, sId, sResultado : String;
begin
  sId := '';
  sCampo := '';
  sResultado := '';
  Screen.Cursor := crHourGlass;
  if not (entregador.getObjects()) then
    Exit;
  if dm.tbApoio.Active then
    dm.tbApoio.Close;
  dm.tbApoio.Open;
  dm.tbApoio.CreateFieldsFromDataSet(dm.qryGetObject);
  dm.tbApoio.LoadFromDataSet(dm.qryGetObject);
  if not (dm.tbApoio.IsEmpty) then
    dm.tbApoio.First;
  dm.qryGetObject.Close;
  dm.qryGetObject.SQL.Clear;
  Screen.Cursor := crDefault;
  if not Assigned(frmListaApoio) then
    frmListaApoio := TfrmListaApoio.Create(Application);
  frmListaApoio.ds.DataSet.Refresh;
  frmListaApoio.cxGrid1DBTableView1.DataController.CreateAllItems;
  frmListaApoio.cxGrid1DBTableView1.Columns[0].Caption := 'Código';
  frmListaApoio.cxGrid1DBTableView1.Columns[1].Caption := 'Nome/Razão Social';
  frmListaApoio.cxGrid1DBTableView1.Columns[2].Caption := 'Alias/Nome Fantasia';
  frmListaApoio.iColuna := 3;
  frmListaApoio.Caption := 'Entregadores';
  frmListaApoio.ShowModal;
  if Resultado then
    begin
      sId := dm.qryGetObject.FieldByName('COD_ENTREGADOR').AsString;
      if atribuicao.getObject(dm.qryGeral.FieldByName('NUM_NOSSONUMERO').AsString,'NOSSONUMERO') then begin
        atribuicao.Entregador := StrToInt(sId);
        if not (atribuicao.Update()) then begin
          MessageDlg('Erro ao alterar o Entregador!',mtWarning,[mbOK],0);
        end
        else begin
          dm.qryGeral.Refresh;
        end;
      end;
    end;
  dm.tbApoio.Close;
  dm.tbApoio.ClearFields;
  frmListaApoio.Free;
end;

procedure TfrmAtribuicoes.dsPendenciasStateChange(Sender: TObject);
begin
  if dsPendencias.State = dsInactive then begin
    actImportarAtribuicaoEntregador.Enabled := False;
    actImportarAtribuicaoReprocessar.Enabled := False;
    actImportarAtribuicaoExcluir.Enabled := False;
  end
  else begin
    if dm.qryGeral.RecordCount > 0 then begin
      actImportarAtribuicaoEntregador.Enabled := True;
      actImportarAtribuicaoReprocessar.Enabled := True;
      actImportarAtribuicaoExcluir.Enabled := True;
    end;
  end;
end;

procedure TfrmAtribuicoes.actImportarAtribuicaoReprocessarExecute(
  Sender: TObject);
var
  Contador, LinhasTotal, iAgente: Integer;
  sOcorrencia: String;
  bPendente: Boolean;
begin
  if Application.MessageBox('Confirma o Reprocesso destas Pendências?','Reprocessar',MB_ICONQUESTION + MB_YESNO) = IDNO then
    Exit;
  cxProgressBar2.Clear;
  if not (dm.qryGeral.IsEmpty) then
    dm.qryGeral.First;
  LinhasTotal := dm.qryGeral.RecordCount;
  while not dm.qryGeral.Eof do begin
    bPendente := False;
    iAgente := 0;
    sOcorrencia := '';
    atribuicao.NossoNumero := dm.qryGeral.FieldByName('NUM_NOSSONUMERO').AsString;
    atribuicao.Entregador := dm.qryGeral.FieldByName('COD_ENTREGADOR').AsInteger;
    atribuicao.Cep := dm.qryGeral.FieldByName('NUM_CEP').AsString;
    atribuicao.Data := dm.qryGeral.FieldByName('DAT_ATRIBUICAO').AsDateTime;
    atribuicao.Cliente := dm.qryGeral.FieldByName('COD_CLIENTE').AsInteger;
    atribuicao.Pedido := dm.qryGeral.FieldByName('NUM_PEDIDO').AsString;
    atribuicao.Ocorrencia := '';
    if atribuicao.Entregador = 0 then begin
      bPendente := True;
      sOcorrencia := sOcorrencia + '<Código de Entregador igual a zero.>';
    end
    else if not (entregador.getObject(IntToStr(atribuicao.Entregador),'CODIGO')) then begin
      bPendente := True;
      sOcorrencia := sOcorrencia + '<Código de Entregador não cadastrado.>';
      iAgente := 0;
    end
    else begin
      iAgente := entregador.Agente;
    end;
      if not (entrega.getObject(atribuicao.NossoNumero,'NOSSONUMERO')) then begin
        bPendente := True;
        sOcorrencia := sOcorrencia + '<Entrega não encontrada na base de dados.>';
      end;
    if not (bPendente) then begin
      entrega.Agente := iAgente;
      entrega.Entregador := atribuicao.Entregador;
      entrega.Atribuicao := atribuicao.Data;
      entrega.Cliente := atribuicao.Cliente;
      if not (entrega.Update()) then begin
        cxLog.Lines.Add('Erro ao Atribuir a Entrega NN ' + atribuicao.NossoNumero + '.');
        cxLog.Refresh;
        sOcorrencia :=  sOcorrencia + '<Falha da Atribuição desta Entrega.>';
        bPendente := True;
      end
      else begin
        dm.qryGeral.Edit;
        dm.qryGeral.FieldByName('DOM_EXCLUIR').AsString := 'S';
        dm.qryGeral.Post;
        dm.qryGeral.ApplyUpdates; 
      end;
    end;
    atribuicao.Ocorrencia := sOcorrencia;
    if bPendente then begin
      if atribuicao.JaExiste() then begin
        if not (atribuicao.Update()) then begin
          cxLog.Lines.Add('Erro ao Alterar a Pendência da NN ' + atribuicao.NossoNumero + '.');
          cxLog.Refresh;
        end
      end
      else begin
        if not (atribuicao.Insert()) then begin
          cxLog.Lines.Add('Erro ao Incluir a Pendência da NN ' + atribuicao.NossoNumero + '.');
          cxLog.Refresh;
        end;
      end;
    end;
    dm.qryGeral.Next;
    Contador := Contador + 1;
    cxProgressBar2.Position := (contador / LinhasTotal) * 100;
    cxProgressBar2.Properties.Text := 'Registro ' + IntToStr(contador) + ' de ' + IntToStr(LinhasTotal);
    cxProgressBar2.Refresh;
  end;
  if not (atribuicao.Delete('EXCLUIR')) then
    MessageDlg('Falha ao excluir os Reprocessados.',mtWarning,[mbOK],0);
  MessageDlg('Reprocesso Concluído!',mtInformation,[mbOK],0);
end;

procedure TfrmAtribuicoes.actImportarAtribuicaoExcluirExecute(
  Sender: TObject);
var
  sNossoNumero: String;
  iEntregador: Integer;
begin
  if dsPendencias.State = dsEdit then begin
    dm.qryGeral.Post;
    dm.qryGeral.ApplyUpdates;
  end;
  if frmFormaExclusao.ShowModal = mrCancel then begin
    Exit;
  end;
  sNossoNumero := dm.qryGeral.FieldByName('NUM_NOSSONUMERO').AsString;
  iEntregador := dm.qryGeral.FieldByName('COD_ENTREGADOR').AsInteger;
  if TipoExclusao >= 0 then begin
    if not (atribuicao.getObject(sNossoNumero,'NOSSONUMERO')) then begin
      MessageDlg('Erro ao Localizar a Pendência!',mtWarning,[mbOK],0);
      Exit;
    end;
  end;

  if Application.MessageBox('Confirma a exclusão?','Excluir',MB_YESNO + MB_ICONQUESTION) = IDNO then
    Exit;

  if TipoExclusao = 0 then begin
    if atribuicao.Delete('NOSSONUMERO') then begin
      MessageDlg('Exclusão de Pendência concluída.',mtInformation,[mbOK],0);
    end;
  end;
  if TipoExclusao = 1 then begin
    if atribuicao.Delete('ENTREGADOR') then begin
      MessageDlg('Exclusão de Pendências concluída.',mtInformation,[mbOK],0);
    end;
  end;
  if TipoExclusao = 2 then begin
    if atribuicao.Delete('STATUS') then begin
      MessageDlg('Exclusão de Pendências concluída.',mtInformation,[mbOK],0);
    end;
  end;
  if TipoExclusao = 3 then begin
    if atribuicao.Delete('EXCLUIR') then begin
      MessageDlg('Exclusão de Pendências concluída.',mtInformation,[mbOK],0);
    end;
  end;
  if TipoExclusao = 4 then begin
    if Application.MessageBox('Confirma realmente excluir todas as Pendências?','Excluir',MB_YESNO + MB_ICONQUESTION) = IDYES then begin
      if atribuicao.Delete('') then begin
        MessageDlg('Exclusão de Pendências concluída.',mtInformation,[mbOK],0);
      end;
    end;
  end;
  dm.qryGeral.Refresh;
end;

end.
