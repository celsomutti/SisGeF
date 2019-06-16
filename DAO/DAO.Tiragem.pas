unit DAO.Tiragem;

interface

uses DAO.Base, Model.Tiragem, Generics.Collections, System.Classes, Vcl.Forms, System.UITypes, Vcl.Dialogs;

type
  TTiragemDAO =  class(TDAO)
  public
    function Insert(aTiragem: Model.Tiragem.TTiragem): Boolean;
    function Update(aTiragem: Model.Tiragem.TTiragem): Boolean;
    function Delete(sFiltro: String): Boolean;
    function FindTiragem(sFiltro: String): TObjectList<Model.Tiragem.TTiragem>;
    function ImportTiragem(sFile: String): TObjectList<Model.Tiragem.TTiragem>;
    function RetornaID(sData: String; sRoteiro: String; sProduto: String): Integer;
  end;
const
    TABLENAME = 'jor_tiragem';

implementation

uses System.SysUtils, FireDAC.Comp.Client, Data.DB, ufrmProcesso, clUtil;

function TTiragemDAO.Insert(aTiragem: TTiragem): Boolean;
var
  sSQL : System.string;
begin
  Result := False;
  aTiragem.ID := GetKeyValue(TABLENAME,'ID_TIRAGEM');
  sSQL := 'INSERT INTO ' + TABLENAME + ' '+
          '(ID_TIRAGEM, DAT_TIRAGEM, COD_ROTEIRO, COD_ENTREGADOR, COD_PRODUTO, QTD_TIRAGEM) ' +
          'VALUES ' +
          '(:ID, :DATA, :ROTEIRO, :ENTREGADOR, :PRODUTO, :TIRAGEM);';
  Connection.ExecSQL(sSQL,[aTiragem.ID, aTiragem.Data, aTiragem.Roteiro, aTiragem.Entregador, aTiragem.Produto, aTiragem.Tiragem],
                          [ftInteger, ftDate, ftString, ftInteger, ftString, ftInteger]);
  Result := True;
end;

function TTiragemDAO.Update(aTiragem: TTiragem): Boolean;
var
  sSQL: System.string;
begin
  Result := False;
  sSQL := 'UPDATE ' + TABLENAME + ' ' +
          'SET ' +
          'DAT_TIRAGEM = :DATA, COD_ROTEIRO = :ROTEIRO, COD_ENTREGADOR = :ENTREGADOR, COD_PRODUTO = :PRODUTO, ' +
          ' QTD_TIRAGEM = :TIRAGEM WHERE ID_TIRAGEM = :ID;';
  Connection.ExecSQL(sSQL,[aTiragem.Data, aTiragem.Roteiro, aTiragem.Entregador, aTiragem.Produto, aTiragem.Tiragem, aTiragem.ID],
                          [ftDate, ftString, ftInteger, ftString, ftInteger, ftInteger]);
  Result := True;
end;

function TTiragemDAO.Delete(sFiltro: string): Boolean;
var
  sSQL : String;
begin
  Result := False;
  sSQL := 'DELETE FROM ' + TABLENAME + ' ';
  if not sFiltro.IsEmpty then
  begin
    sSQl := sSQL + sFiltro;
  end
  else
  begin
    Exit;
  end;
  Connection.ExecSQL(sSQL);
  Result := True;
end;

function TTiragemDAO.FindTiragem(sFiltro: string): TObjectList<Model.Tiragem.TTiragem>;
var
  FDQuery: TFDQuery;
  tiragens: TObjectList<TTiragem>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    if not sFiltro.IsEmpty then
    begin
      FDQuery.SQL.Add(sFiltro);
    end;
    FDQuery.Open();
    tiragens := TObjectList<TTiragem>.Create();
    while not FDQuery.Eof do
    begin
      tiragens.Add(TTiragem.Create(FDQuery.FieldByName('ID_TIRAGEM').AsInteger, FDQuery.FieldByName('DAT_TIRAGEM').AsDateTime,
                 FDQuery.FieldByName('COD_ROTEIRO').AsString, FDQuery.FieldByName('COD_ENTREGADOR').AsInteger,
                 FDQuery.FieldByName('COD_PRODUTO').AsString, FDQuery.FieldByName('QTD_TIRAGEM').AsInteger));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := tiragens;
end;

function TTiragemDAO.RetornaID(sData: String; sRoteiro: String; sProduto: String): Integer;
var
  FDQuery: TFDQuery;
begin
  Result := 0;
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE DAT_TIRAGEM = :DATA AND COD_ROTEIRO = :ROTEIRO AND COD_PRODUTO = :PRODUTO');
    FDQuery.ParamByName('DATA').AsDate := StrToDate(sData);
    FDQuery.ParamByName('ROTEIRO').AsString := sRoteiro;
    FDQuery.ParamByName('PRODUTO').AsString := sProduto;
    FDQuery.Open();
    if FDQuery.IsEmpty then
    begin
      Exit;
    end;
    Result := FDQuery.FieldByName('ID_TIRAGEM').AsInteger;
  finally
    FDQuery.Free;
  end;
end;

function TTiragemDAO.ImportTiragem(sFile: string): TObjectList<Model.Tiragem.TTiragem>;
var
  sArquivo : TextFile;
  sLinha, sData : String;
  Str : TStringList;
  Cab : TStringList;
  Contador, LinhasTotal, i: Integer;
  dPosicao: Double;
  tiragens: TObjectList<TTiragem>;
  bFlagFile: Boolean;
  bFlagLoop: Boolean;
begin
  try
    Cab := TStringList.Create;
    Cab.StrictDelimiter := True;
    Cab.Delimiter := ';';
    Str := TStringList.Create;
    Str.StrictDelimiter := True;
    Str.Delimiter := ';';
    AssignFile(sArquivo, sFile);
    tiragens := TObjectList<TTiragem>.Create();
    dPosicao := 0;
    bFlagFile := False;
    bFlagLoop := False;
    if not Assigned(frmProcesso) then
    begin
      frmProcesso := TfrmProcesso.Create(Application);
    end;
    Screen.Cursor := crHourGlass;
    frmProcesso.Show;
    frmProcesso.cxGroupBox1.Caption := 'Importando Planilha. Aguarde...';
    frmProcesso.cxGroupBox1.Refresh;
    LinhasTotal := TUtil.NumeroDeLinhasTXT(sFile);
    AssignFile(sArquivo, sFile);
    Reset(sArquivo);
    sLinha := '';
    while not bFlagLoop do
    begin
      Readln(sArquivo, sLinha);
      if Copy(sLinha,0,22) = 'TABELA DE CARREGAMENTO' then
      begin
        sData := Copy(sLinha,23,11);
        bFlagFile := True;
      end;
      if Copy(sLinha,0,6) = 'AGENTE' then
      begin
        Cab.DelimitedText := sLinha;
        Readln(sArquivo, sLinha);
        bFlagLoop := True;
      end;
    end;
    if not bFlagFile then
    begin
      MessageDlg('Arquivo informado não é de TABELA DE CARREGAMENTO.',mtWarning,[mbOK],0);
      Exit;
    end;
    Contador := 4;
    while not Eoln(sArquivo) do
    begin
      for i := 2 to Cab.Count - 1 do
      begin
        if Cab[i] <> 'TOTAL' then
        begin
          Str.DelimitedText := sLinha;
          tiragens.Add(TTiragem.Create(0,StrtoDate(sData),Str[0],0,Cab[i],StrtoIntDef(Str[i],0)));
        end;
      end;
      Readln(sArquivo, sLinha);
      dPosicao := (Contador / LinhasTotal) * 100;
      Inc(Contador);
      frmProcesso.cxProgressBar1.Position := dPosicao;
      frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
      frmProcesso.cxProgressBar1.Refresh;
    end;
  finally
    Result := tiragens;
    Screen.Cursor := crDefault;
    frmProcesso.Close;
    FreeAndNil(frmProcesso);
    CloseFile(sArquivo);
    sLinha := '';
    FreeAndNil(Str);
    FreeAndNil(Cab);
  end;
end;

end.
