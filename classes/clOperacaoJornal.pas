unit clOperacaoJornal;

interface

uses
Vcl.Forms, System.SysUtils, System.Classes, Vcl.dialogs, clConexao, udm, System.DateUtils;

type
  TOperacionalJornal = class(TObject)
  private
    FEntregador: Integer;
    FRoteiroAntigo: String;
    FData: TDate;
    FStatusOperacao: String;
    FRoteiroNovo: String;
    FObservacoes: String;
    FLog: String;
    conexao: TConexao;
    FMostrar: String;
    FNumId: Integer;
    FIdReferencia: Integer;
    FDataReferencia: System.TDate;
    procedure SetEntregador(val: Integer);
    procedure SetRoteiroAntigo(val: String);
    procedure SetData(val: TDate);
    procedure SetStatusOperacao(val: String);
    procedure SetRoteiroNovo(val: String);
    procedure SetObservacoes(val: String);
    procedure SetLog(val: String);
    procedure SetMostrar(val: String);
    procedure SetNumId(val: Integer);
    procedure SetIdReferencia(val: Integer);
    procedure SetDataReferencia(val: System.TDate);
  public
    property Entregador: Integer read FEntregador write SetEntregador;
    property RoteiroAntigo: String read FRoteiroAntigo write SetRoteiroAntigo;
    property Data: TDate read FData write SetData;
    property StatusOperacao: String read FStatusOperacao write SetStatusOperacao;
    property RoteiroNovo: String read FRoteiroNovo write SetRoteiroNovo;
    property Observacoes: String read FObservacoes write SetObservacoes;
    property Log: String read FLog write SetLog;
    property Mostrar: String read FMostrar write SetMostrar;
    function Validar: Boolean; reintroduce;
    constructor Create;
    destructor Destroy; override;
    function Insert: Boolean;
    function Update: Boolean;
    function Delete(sFiltro: String): Boolean;
    function getObject(sId: String; sFiltro: String): Boolean;
    function getField(sCampo: String; sFiltro: String): String;
    function Planilha(dtInicio: TDateTime; dtTermino: TDateTime; sPlanilha: String): Boolean;
    function Exist(): Integer;
    property NumId: Integer read FNumId write SetNumId;
    function UltimaData: String;
    property IdReferencia: Integer read FIdReferencia write SetIdReferencia;
    property DataReferencia: System.TDate read FDataReferencia
      write SetDataReferencia;
    procedure MaxOperacao;
  end;

const
  TABLENAME = 'jor_operacao_jornal';

implementation

procedure TOperacionalJornal.SetEntregador(val: Integer);
begin
  FEntregador := val;
end;

procedure TOperacionalJornal.SetRoteiroAntigo(val: String);
begin
  FRoteiroAntigo := val;
end;

procedure TOperacionalJornal.SetData(val: TDate);
begin
  FData := val;
end;

procedure TOperacionalJornal.SetStatusOperacao(val: String);
begin
  FStatusOperacao := val;
end;

procedure TOperacionalJornal.SetRoteiroNovo(val: String);
begin
  FRoteiroNovo := val;
end;

procedure TOperacionalJornal.SetObservacoes(val: String);
begin
  FObservacoes := val;
end;

procedure TOperacionalJornal.SetLog(val: String);
begin
  FLog := val;
end;

procedure TOperacionalJornal.SetMostrar(val: String);
begin
  FMostrar := val;
end;

procedure TOperacionalJornal.SetNumId(val: Integer);
begin
  FNumId := val;
end;

procedure TOperacionalJornal.SetIdReferencia(val: Integer);
begin
  FIdReferencia := val;
end;

procedure TOperacionalJornal.SetDataReferencia(val: System.TDate);
begin
  FDataReferencia := val;
end;

function TOperacionalJornal.Validar: Boolean;
begin
  Result := False;
  if Self.Entregador = 0 then
  begin
    MessageDlg('Informe o código do entregador!', mtWarning, [mbOK], 0);
    Exit;
  end;
  if Self.RoteiroAntigo.IsEmpty then
  begin
    MessageDlg('Informe o código do roteiro antigo!', mtWarning, [mbOK], 0);
    Exit;
  end;
  if Self.Data = 0 then
  begin
    MessageDlg('Informe a data da operação!', mtWarning, [mbOK], 0);
    Exit;
  end;
  if Self.StatusOperacao.IsEmpty then
  begin
    MessageDlg('Informe o Status da Operação!', mtWarning, [mbOK], 0);
    Exit;
  end;
  if Self.RoteiroNovo.IsEmpty then
  begin
    MessageDlg('Informe o código do roteiro novo!', mtWarning, [mbOK], 0);
    Exit;
  end;
  Result := True;
end;

constructor TOperacionalJornal.Create;
begin
  inherited Create;
  conexao := TConexao.Create;
end;

destructor TOperacionalJornal.Destroy;
begin
  conexao.Free;
  inherited Destroy;
end;

function TOperacionalJornal.Insert: Boolean;
begin
  Result := False;
  if (not conexao.VerifyConnZEOS(0)) then begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados!', mtError, [mbCancel], 0);
    Exit;
  end;
  dm.qryCRUD.Close;
  dm.qryCRUD.SQL.Clear;
  dm.qryCRUD.SQL.Text := 'INSERT INTO ' + TABLENAME + '(' +
                         'ID_OPERACAO, ' +
                         'COD_ENTREGADOR, ' +
                         'COD_ROTEIRO_ANTIGO, ' +
                         'DAT_OPERACAO, ' +
                         'COD_STATUS_OPERACAO, ' +
                         'COD_ROTEIRO_NOVO, ' +
                         'DES_OBSERVACOES, ' +
                         'DOM_PLANILHA, ' +
                         'ID_REFERENCIA, ' +
                         'DAT_REFERENCIA, ' +
                         'DES_LOG) ' +
                         'VALUES (' +
                         ':ID, ' +
                         ':ENTREGADOR, ' +
                         ':ROTEIROANTIGO, ' +
                         ':DATA, ' +
                         ':STATUSOPERACAO, ' +
                         ':ROTEIRONOVO, ' +
                         ':OBS, ' +
                         ':PLANILHA,' +
                         ':IDREF,' +
                         ':DATAREF,' +
                         ':LOG);';
  MaxOperacao;
  dm.qryCRUD.ParamByName('ID').AsInteger := Self.NumId;
  dm.qryCRUD.ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
  dm.qryCRUD.ParamByName('ROTEIROANTIGO').AsString := Self.RoteiroAntigo;
  dm.qryCRUD.ParamByName('DATA').AsDate := Self.Data;
  dm.qryCRUD.ParamByName('STATUSOPERACAO').AsString := Self.StatusOperacao;
  dm.qryCRUD.ParamByName('ROTEIRONOVO').AsString := Self.RoteiroNovo;
  dm.qryCRUD.ParamByName('OBS').AsString := Self.Observacoes;
  dm.qryCRUD.ParamByName('PLANILHA').AsString := Self.Mostrar;
  dm.qryCRUD.ParamByName('IDREF').AsInteger := Self.IdReferencia;
  dm.qryCRUD.ParamByName('DATAREF').AsDate := Self.DataReferencia;
  dm.qryCRUD.ParamByName('LOG').AsString := Self.Log;
  dm.ZConn.PingServer;
  dm.qryCRUD.ExecSQL;
  dm.qryCRUD.Close;
  dm.qryCRUD.SQL.Clear;
  Result := True;
end;

function TOperacionalJornal.Update: Boolean;
begin
  Result := False;
  if (not conexao.VerifyConnZEOS(0)) then begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados!', mtError, [mbCancel], 0);
    Exit;
  end;
  dm.qryCRUD.Close;
  dm.qryCRUD.SQL.Clear;
  dm.qryCRUD.SQL.Text := 'UPDATE ' + TABLENAME + ' SET ' +
                         'COD_ENTREGADOR = :ENTREGADOR, ' +
                         'DAT_OPERACAO = :DATA, ' +
                         'COD_ROTEIRO_ANTIGO = :ROTEIROANTIGO, ' +
                         'COD_STATUS_OPERACAO = :STATUSOPERACAO, ' +
                         'COD_ROTEIRO_NOVO = :ROTEIRONOVO, ' +
                         'DES_OBSERVACOES = :OBS, ' +
                         'DOM_PLANILHA = :PLANILHA, ' +
                         'ID_REFERENCIA = :IDREF, ' +
                         'DAT_REFERENCIA = :DATAREF, ' +
                         'DES_LOG = :LOG ' +
                         'WHERE ' +
                         'ID_OPERACAO = :ID;';
  dm.qryCRUD.ParamByName('ID').AsInteger := Self.NumId;
  dm.qryCRUD.ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
  dm.qryCRUD.ParamByName('ROTEIROANTIGO').AsString := Self.RoteiroAntigo;
  dm.qryCRUD.ParamByName('DATA').AsDate := Self.Data;
  dm.qryCRUD.ParamByName('STATUSOPERACAO').AsString := Self.StatusOperacao;
  dm.qryCRUD.ParamByName('ROTEIRONOVO').AsString := Self.RoteiroNovo;
  dm.qryCRUD.ParamByName('OBS').AsString := Self.Observacoes;
  dm.qryCRUD.ParamByName('PLANILHA').AsString := Self.Mostrar;
  dm.qryCRUD.ParamByName('IDREF').AsInteger := Self.IdReferencia;
  dm.qryCRUD.ParamByName('DATAREF').AsDate := Self.DataReferencia;
  dm.qryCRUD.ParamByName('LOG').AsString := Self.Log;
  dm.ZConn.PingServer;
  dm.qryCRUD.ExecSQL;
  dm.qryCRUD.Close;
  dm.qryCRUD.SQL.Clear;
  Result := True;
end;

function TOperacionalJornal.Delete(sFiltro: String): Boolean;
begin
  Result := False;
  if (not conexao.VerifyConnZEOS(0)) then begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados!', mtError, [mbCancel], 0);
    Exit;
  end;
  dm.qryCRUD.Close;
  dm.qryCRUD.SQL.Clear;
  dm.qryCRUD.SQL.Add('DELETE FROM ' + TABLENAME);
  if sFiltro = 'ID' then
  begin
    dm.qryCRUD.SQL.Add('WHERE ID_OPERACAO = :ID');
    dm.qryCRUD.ParamByName('ID').AsInteger := Self.NumId;
  end
  else if sFiltro = 'ENTREGADOR' then
  begin
    dm.qryCRUD.SQL.Add('WHERE COD_ENTREGADOR = :ENTREGADOR');
    dm.qryCRUD.ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
  end
  else if sFiltro = 'ANTIGO' then
  begin
    dm.qryCRUD.SQL.Add('WHERE COD_ROTEIRO_ANTIGO = :ROTEIROANTIGO');
    dm.qryCRUD.ParamByName('ROTEIROANTIGO').AsString := Self.RoteiroAntigo;
  end
  else if sFiltro = 'DATA' then
  begin
    dm.qryCRUD.SQL.Add('WHERE DAT_OPERACAO = :DATA');
    dm.qryCRUD.ParamByName('DATA').AsDateTime := Self.Data;
  end
  else if sFiltro = 'NOVO' then
  begin
    dm.qryCRUD.SQL.Add('WHERE COD_ROTEIRO_NOVO = :ROTEIRONOVO');
    dm.qryCRUD.ParamByName('ROTEIRONOVO').AsString := Self.RoteiroNovo;
  end
  else if sFiltro = 'IDREF' then
  begin
    dm.qryCRUD.SQL.Add('WHERE ID_REFERENCIA = :IDREF');
    dm.qryCRUD.ParamByName('IDREF').AsInteger := Self.IdReferencia;
  end
  else if sFiltro = 'DATAREF' then
  begin
    dm.qryCRUD.SQL.Add('WHERE DAT_REFERENCIA = :DATAREF');
    dm.qryCRUD.ParamByName('DATAREF').AsDate := Self.DataReferencia;
  end;
  dm.ZConn.PingServer;
  dm.qryCRUD.ExecSQL;
  dm.qryCRUD.Close;
  dm.qryCRUD.SQL.Clear;
  Result := True;
end;

function TOperacionalJornal.getObject(sId: String; sFiltro: String): Boolean;
begin
  Result := False;
  if (not conexao.VerifyConnZEOS(0)) then begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados!', mtError, [mbCancel], 0);
    Exit;
  end;
  dm.qryGetObject.Close;
  dm.qryGetObject.SQL.Clear;
  dm.qryGetObject.SQL.Add('SELECT * FROM ' + TABLENAME);
  if sFiltro = 'ID' then
  begin
    dm.qryGetObject.SQL.Add('WHERE ID_OPERACAO = :ID');
    dm.qryCRUD.ParamByName('ID').AsInteger := StrToIntDef(sId, 0);
  end
  else if sFiltro = 'ENTREGADOR' then
  begin
    dm.qryGetObject.SQL.Add('WHERE COD_ENTREGADOR = :ENTREGADOR');
    dm.qryGetObject.ParamByName('ENTREGADOR').AsInteger := StrToIntDef(sId, 0);
  end
  else if sFiltro = 'ANTIGO' then
  begin
    dm.qryGetObject.SQL.Add('WHERE COD_ROTEIRO_ANTIGO = :ROTEIROANTIGO');
    dm.qryGetObject.ParamByName('ROTEIROANTIGO').AsString := sId;
  end
  else if sFiltro = 'DATA' then
  begin
    dm.qryGetObject.SQL.Add('WHERE DAT_OPERACAO = :DATA');
    dm.qryGetObject.ParamByName('DATA').AsDateTime := StrToDate(sId);
  end
  else if sFiltro = 'NOVO' then
  begin
    dm.qryGetObject.SQL.Add('WHERE COD_ROTEIRO_NOVO = :ROTEIRONOVO');
    dm.qryGetObject.ParamByName('ROTEIRONOVO').AsString := sId;
  end
  else if sFiltro = 'CHAVE' then
  begin
    dm.qryGetObject.SQL.Add('WHERE COD_ENTREGADOR = :ENTREGADOR AND DAT_OPERACAO = :DATA');
    dm.qryGetObject.ParamByName('ENTREGADOR').AsInteger := StrToInt(sId);
    dm.qryGetObject.ParamByName('DATA').AsDateTime := Self.Data;
  end
  else if sFiltro = 'CHAVE1' then
  begin
    dm.qryGetObject.SQL.Add('WHERE COD_ROTEIRO_ANTIGO LIKE :ANTIGO AND DAT_OPERACAO = :DATA AND ' +
                            'SUBSTRING(COD_STATUS_OPERACAO,1,1) IN (' +
                            QuotedStr('P') + ')');
    dm.qryGetObject.ParamByName('ANTIGO').AsString := '%' + Self.RoteiroAntigo + '%';
    dm.qryGetObject.ParamByName('DATA').AsDate := Self.Data;
  end
  else if sFiltro = 'CHAVE2' then
  begin
    dm.qryGetObject.SQL.Add('WHERE COD_STATUS_OPERACAO LIKE :STATUS AND DAT_OPERACAO = :DATA;');
    dm.qryGetObject.ParamByName('STATUS').AsString := '%' + sId + '%';
    dm.qryGetObject.ParamByName('DATA').AsDate := Self.Data;
  end
  else if sFiltro = 'REPOSITOR' then
  begin
    dm.qryGetObject.SQL.Add('WHERE DOM_PLANILHA = :PLANILHA AND ');
    dm.qryGetObject.SQL.Add('DAT_OPERACAO = :DATA AND ');
    dm.qryGetObject.SQL.Add('COD_ROTEIRO_ANTIGO = :ROTEIROANTIGO AND ');
    dm.qryGetObject.SQL.Add('COD_ROTEIRO_NOVO = :ROTEIRONOVO');
    dm.qryGetObject.ParamByName('PLANILHA').AsString := Self.Mostrar;
    dm.qryGetObject.ParamByName('DATA').AsDateTime := Self.Data;
    dm.qryGetObject.ParamByName('ROTEIROANTIGO').AsString := Self.RoteiroAntigo;
    dm.qryGetObject.ParamByName('ROTEIRONOVO').AsString := Self.RoteiroNovo;
  end
  else if sFiltro = 'PERIODO' then
  begin
    dm.qryGetObject.SQL.Add('WHERE DAT_OPERACAO BETWEEN :DATA AND :DATA1 ORDER BY DAT_OPERACAO');
    dm.qryGetObject.ParamByName('DATA').AsDateTime := StrToDate(sId);
    dm.qryGetObject.ParamByName('DATA1').AsDateTime := Self.Data;
  end
  else if sFiltro = 'IDREF' then
  begin
    dm.qryCRUD.SQL.Add('WHERE ID_REFERENCIA = :IDREF');
    dm.qryCRUD.ParamByName('IDREF').AsInteger := StrToIntDef(sId,0); ;
  end
  else if sFiltro = 'DATAREF' then
  begin
    dm.qryCRUD.SQL.Add('WHERE DAT_REFERENCIA = :DATAREF');
    dm.qryCRUD.ParamByName('DATAREF').AsDate := StrToDate(sId);
  end;
  dm.ZConn.PingServer;
  dm.qryGetObject.Open;
  if dm.qryGetObject.IsEmpty then
  begin
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
    Exit;
  end
  else
  begin
    dm.qryGetObject.First;
    Self.Entregador := dm.qryGetObject.FieldByName('COD_ENTREGADOR').AsInteger;
    Self.RoteiroAntigo := dm.qryGetObject.FieldByName('COD_ROTEIRO_ANTIGO').AsString;
    Self.Data := dm.qryGetObject.FieldByName('DAT_OPERACAO').AsDateTime;
    Self.StatusOperacao := dm.qryGetObject.FieldByName('COD_STATUS_OPERACAO').AsString;
    Self.RoteiroNovo := dm.qryGetObject.FieldByName('COD_ROTEIRO_NOVO').AsString;
    Self.Observacoes := dm.qryGetObject.FieldByName('DES_OBSERVACOES').AsString;
    Self.Mostrar := dm.qryGetObject.FieldByName('DOM_PLANILHA').AsString;
    Self.IdReferencia := dm.qryGetObject.FieldByName('ID_REFERENCIA').AsInteger;
    Self.DataReferencia := dm.qryGetObject.FieldByName('DAT_REFERENCIA').AsDateTime;
    Self.Log := dm.qryGetObject.FieldByName('DES_LOG').AsString;
  end;
  Result := True;
end;

function TOperacionalJornal.getField(sCampo: String; sFiltro: String): String;
begin
  Result := '';
  if (not conexao.VerifyConnZEOS(0)) then begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados!', mtError, [mbCancel], 0);
    Exit;
  end;
  dm.qryFields.Close;
  dm.qryFields.SQL.Clear;
  dm.qryFields.SQL.Add('SELECT ' + sCampo + ' FROM ' + TABLENAME);
  if sFiltro = 'ENTREGADOR' then
  begin
    dm.qryFields.SQL.Add('WHERE COD_ENTREGADOR = :ENTREGADOR');
    dm.qryFields.ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
  end
  else if sFiltro = 'ANTIGO' then
  begin
    dm.qryFields.SQL.Add('WHERE COD_ROTEIRO_ANTIGO = :ROTEIROANTIGO');
    dm.qryFields.ParamByName('ROTEIROANTIGO').AsString := Self.RoteiroAntigo;
  end
  else if sFiltro = 'DATA' then
  begin
    dm.qryFields.SQL.Add('WHERE DAT_OPERACAO = :DATA');
    dm.qryFields.ParamByName('DATA').AsDateTime := Self.Data;
  end
  else if sFiltro = 'CHAVE1' then
  begin
    dm.qryFields.SQL.Add('WHERE COD_ENTREGADOR = :ENTREGADOR ');
    dm.qryFields.SQL.Add('AND COD_ROTEIRO_ANTIGO = :ANTIGO ');
    dm.qryFields.SQL.Add('AND COD_ROTEIRO_NOVO = :NOVO ');
    dm.qryFields.SQL.Add('AND DAT_OPERACAO = :DATA');
    dm.qryFields.ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
    dm.qryFields.ParamByName('ANTIGO').AsString := Self.RoteiroAntigo;
    dm.qryFields.ParamByName('NOVO').AsString := Self.RoteiroNovo;
    dm.qryFields.ParamByName('DATA').AsDate := Self.Data;
  end
  else if sFiltro = 'NOVO' then
  begin
    dm.qryFields.SQL.Add('WHERE COD_ROTEIRO_NOVO = :ROTEIRONOVO');
    dm.qryFields.ParamByName('ROTEIRONOVO').AsString := Self.RoteiroNovo;
  end;
  dm.ZConn.PingServer;
  dm.qryFields.Open;
  if not dm.qryFields.IsEmpty then
  begin
    Result := dm.qryFields.FieldByName(sCampo).AsString;
  end;
  dm.qryFields.Close;
  dm.qryFields.SQL.Clear;
end;

function TOperacionalJornal.Planilha(dtInicio: TDateTime; dtTermino: TDateTime; sPlanilha: String): Boolean;
var
  sSQL: string;
  iDias: Integer;
  i: Integer;
  dtData: TDateTime;
begin
  Result := False;
  dtData := dtInicio;
  sSQL := 'SELECT COD_ROTEIRO_ANTIGO, COD_ROTEIRO_NOVO, COD_ENTREGADOR, DOM_PLANILHA';
  iDias :=DaysBetween(dtInicio, dtTermino) + 1;
  for i := 1 to iDias do
  begin
    sSQL := sSQL + ', ';
    sSql := sSQL + 'GROUP_CONCAT((CASE WHEN DAT_OPERACAO = ' + QuotedStr(FormatDateTime('yyyy.mm.dd', dtData)) +
    ' THEN COD_STATUS_OPERACAO ELSE NULL END)) AS DES_STATUS_' + IntToStr(i);
    dtData := IncDay(dtData);
  end;
  sSQL := sSQL + ' FROM ' + TABLENAME ;
  sSQL := sSQL + ' WHERE DAT_OPERACAO BETWEEN ' + QuotedStr(FormatDateTime('yyyy.mm.dd', dtInicio)) + ' AND ' +
                 QuotedStr(FormatDateTime('yyyy.mm.dd', dtTermino));
  if not sPlanilha.IsEmpty then
  begin
    sSQL := sSQL + ' AND DOM_PLANILHA = ' + QuotedStr(sPlanilha)
  end;
  sSQL := sSQL + ' GROUP BY COD_ENTREGADOR';
  if (not conexao.VerifyConnZEOS(0)) then begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados!', mtError, [mbCancel], 0);
    Exit;
  end;
  dm.qryGeral.Close;
  dm.qryGeral.SQL.Clear;
  dm.qryGeral.SQL.Text := sSQL;
  dm.qryGeral.Open;
  if dm.qryGeral.IsEmpty then
  begin
    dm.qryGeral.Close;
    dm.qryGeral.SQL.Clear;
    Exit;
  end;
  dm.qryGeral.First;
  Result := true;
end;

function TOperacionalJornal.Exist: Integer;
var
  sSQLentregador: String;
begin
  Result := 0;
  if (not conexao.VerifyConnZEOS(0)) then begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados!', mtError, [mbCancel], 0);
    Exit;
  end;
  sSQLentregador := 'COD_ENTREGADOR = :ENTREGADOR AND ';
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  dm.qryPesquisa.SQL.Text := 'SELECT * FROM ' + TABLENAME + ' WHERE ' +
                             sSQLentregador +
                             'COD_ROTEIRO_ANTIGO = :ANTIGO AND ' +
                             'COD_ROTEIRO_NOVO = :NOVO AND ' +
                             'DAT_OPERACAO = :DATA ';
  dm.qryPesquisa.ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
  dm.qryPesquisa.ParamByName('ANTIGO').AsString := Self.RoteiroAntigo;
  dm.qryPesquisa.ParamByName('NOVO').AsString := Self.RoteiroNovo;
  dm.qryPesquisa.ParamByName('DATA').AsDate := Self.Data;
  dm.qryPesquisa.Open;
  if dm.qryPesquisa.IsEmpty then
  begin
    dm.qryPesquisa.Close;
    dm.qryPesquisa.SQL.Clear;
    Exit;
  end;
  Result := dm.qryPesquisa.FieldByName('ID_OPERACAO').AsInteger;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
end;

function TOperacionalJornal.UltimaData: String;
var
  sSQL: string;
begin
  Result := '';
  sSQL := 'SELECT MAX(DAT_OPERACAO) AS DATA ';
  sSQL := sSQL + ' FROM ' + TABLENAME ;
  sSQL := sSQL + ' WHERE SUBSTRING(COD_STATUS_OPERACAO,1,1) IN (' +
                            QuotedStr('P') + ', ' +
                            QuotedStr('1') + ', ' +
                            QuotedStr('2') + ', ' +
                            QuotedStr('3') + ', ' +
                            QuotedStr('4') + ', ' +
                            QuotedStr('5') + ', ' +
                            QuotedStr('6') + ', ' +
                            QuotedStr('7') + ', ' +
                            QuotedStr('8') + ', ' +
                            QuotedStr('9') + ')';
  if (not conexao.VerifyConnZEOS(0)) then begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados!', mtError, [mbCancel], 0);
    Exit;
  end;
  dm.qryGeral.Close;
  dm.qryGeral.SQL.Clear;
  dm.qryGeral.SQL.Text := sSQL;
  dm.qryGeral.Open;
  if dm.qryGeral.IsEmpty then
  begin
    dm.qryGeral.Close;
    dm.qryGeral.SQL.Clear;
    Exit;
  end;
  dm.qryGeral.First;
  Result := FormatDateTime('dd/mm/yyyy', dm.qryGeral.FieldByName('DATA').AsDateTime);
  dm.qryGeral.Close;
  dm.qryGeral.SQL.Clear;
end;

procedure TOperacionalJornal.MaxOperacao;
begin
  try
    with dm.qryGeral do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT MAX(ID_OPERACAO) AS ID FROM ' + TABLENAME);
      dm.ZConn.PingServer;
      Open;
      if not(IsEmpty) then
      begin
        Self.NumId := FieldByName('ID').AsInteger + 1;
      end
      else
      begin
        Self.NumId := 1;
      end;
      Close;
      SQL.Clear;
    end;
  except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

end.
