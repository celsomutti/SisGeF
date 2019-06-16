unit clCodigosEntregadores;

interface

uses clConexao;

type
  TCodigosEntregadores = class(TObject)
  private
    function getAgente: Integer;
    function getCadastro: Integer;
    function getChave: String;
    function getCodigo: Integer;
    function getData: TDate;
    function getNome: String;
    function getExecutor: String;
    function getManutencao: TDateTime;

    function VerificaConexao(): Boolean;

    procedure setAgente(const Value: Integer);
    procedure setCadastro(const Value: Integer);
    procedure setChave(const Value: String);
    procedure setCodigo(const Value: Integer);
    procedure setData(const Value: TDate);
    procedure setNome(const Value: String);
    procedure setExecutor(const Value: String);
    procedure setManutencao(const Value: TDateTime);

    procedure ErrorMessage(sTexto: String);
    function getOperacao: String;
    procedure setOperacao(const Value: String);
    function getGrupo: Integer;
    procedure setGrupo(const Value: Integer);
    procedure setVerba(const Value: Double);
    function getVerba: Double;
  protected
    _cadastro: Integer;
    _codigo: Integer;
    _nome: String;
    _agente: Integer;
    _data: TDate;
    _chave: String;
    _executor: String;
    _manutencao: TDateTime;
    _operacao: String;
    _grupo: Integer;
    _verba: Double;
    _conexao: TConexao;
  public
    constructor Create;
    destructor Destroy;
    property Cadastro: Integer read getCadastro write setCadastro;
    property Codigo: Integer read getCodigo write setCodigo;
    property Nome: String read getNome write setNome;
    property Agente: Integer read getAgente write setAgente;
    property Data: TDate read getData write setData;
    property Chave: String read getChave write setChave;
    property Executor: String read getExecutor write setExecutor;
    property Manutencao: TDateTime read getManutencao write setManutencao;
    property Operacao: String read getOperacao write setOperacao;
    property Grupo: Integer read getGrupo write setGrupo;
    property Verba: Double read getVerba write setVerba;

    function Validar(): Boolean;
    function Merge(): Boolean;
    function Insert(): Boolean;
    function Update(): Boolean;
    function getObject(sId, sColuna: String): Boolean;
    function getField(sCampo, sColuna: String): String;
    function Exist(): Boolean;
    function Delete(filtro: String): Boolean;
    function Desvincular(): Boolean;
    function getObjects(): Boolean;
  end;

const
  TABLENAME = 'tbcodigosentregadores';

implementation

{ TCodigosEntregadores }

uses udm, clUtil, Vcl.Dialogs, System.SysUtils, Variants, uGlobais, DB,
  ZAbstractRODataset, ZDataset;

constructor TCodigosEntregadores.Create;
begin
  _conexao := TConexao.Create;
  if (not _conexao.VerifyConnZEOS(0)) then
  begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
      Self.ClassName + ') !', mtError, [mbCancel], 0);
  end;
end;

destructor TCodigosEntregadores.Destroy;
begin
  _conexao.Free;
end;

function TCodigosEntregadores.getAgente: Integer;
begin
  Result := _agente;
end;

function TCodigosEntregadores.getCadastro: Integer;
begin
  Result := _cadastro;
end;

function TCodigosEntregadores.getChave: String;
begin
  Result := _chave;
end;

function TCodigosEntregadores.getCodigo: Integer;
begin
  Result := _codigo;
end;

function TCodigosEntregadores.getData: TDate;
begin
  Result := _data;
end;

function TCodigosEntregadores.getExecutor: String;
begin
  Result := _executor;
end;

function TCodigosEntregadores.getManutencao: TDateTime;
begin
  Result := _manutencao;
end;

function TCodigosEntregadores.getNome: String;
begin
  Result := _nome;
end;

function TCodigosEntregadores.getOperacao: String;
begin
  Result := _operacao;
end;

function TCodigosEntregadores.getVerba: Double;
begin
  Result := _verba;
end;

function TCodigosEntregadores.getGrupo: Integer;
begin
  Result := _grupo;
end;

function TCodigosEntregadores.Validar(): Boolean;
begin
  try
    Result := False;
    if Self.Codigo = 0 then
    begin
      MessageDlg('Código do Entregador não pode ser igual a zero!', mtWarning,
        [mbOK], 0);
      Exit;
    end;
    if TUtil.Empty(Self.Nome) then
    begin
      MessageDlg('Nome de Guerrea do Entregador não pode ser vazio!', mtWarning,
        [mbOK], 0);
      Exit;
    end;
    if Self.Agente = 0 then
    begin
      MessageDlg('Código do Agente não pode ser igual a zero!', mtWarning,
        [mbOK], 0);
      Exit;
    end;
    if Self.Data = Null then
    begin
      MessageDlg('Data do Código inválida!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if TUtil.Empty(Self.Chave) then
    begin
      MessageDlg('Chave Inválida!', mtWarning, [mbOK], 0);
      Exit;
    end;
    Result := True;
  Except
    on E: Exception do
    begin
      ErrorMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

function TCodigosEntregadores.Merge(): Boolean;
begin
  try
    Result := False;
    if Self.Operacao = 'I' then
    begin
      Result := Self.Insert();
    end
    else
    begin
      Result := Self.Update();
    end;
  Except
    on E: Exception do
    begin
      ErrorMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

function TCodigosEntregadores.Insert(): Boolean;
begin
  try
    Result := False;
    if (not VerificaConexao()) then
    begin
      MessageDlg('Sem conexão com o banco de dados!', mtWarning, [mbCancel], 0);
      Exit;
    end;
    dm.qryCRUD.Close;
    dm.qryCRUD.SQL.Clear;
    dm.qryCRUD.SQL.Text := 'INSERT INTO ' + TABLENAME + '(' + 'COD_CADASTRO, ' +
      'COD_ENTREGADOR, ' + 'NOM_FANTASIA, ' + 'COD_AGENTE, ' + 'DAT_CODIGO, ' +
      'DES_CHAVE, ' + 'COD_GRUPO, ' + 'VAL_VERBA, ' + 'NOM_EXECUTANTE, ' +
      'DAT_MANUTENCAO) ' + 'VALUES ' + '(:CADASTRO, ' + ':ENTREGADOR, ' +
      ':NOME, ' + ':AGENTE, ' + ':DATA, ' + ':CHAVE, ' + ':GRUPO, ' + ':VERBA, '
      + ':EXECUTANTE, ' + ':MANUTENCAO);';
    dm.qryCRUD.ParamByName('CADASTRO').AsInteger := Self.Cadastro;
    dm.qryCRUD.ParamByName('ENTREGADOR').AsInteger := Self.Codigo;
    dm.qryCRUD.ParamByName('NOME').AsString := Self.Nome;
    dm.qryCRUD.ParamByName('AGENTE').AsInteger := Self.Agente;
    dm.qryCRUD.ParamByName('DATA').AsDate := Self.Data;
    dm.qryCRUD.ParamByName('CHAVE').AsString := Self.Chave;
    dm.qryCRUD.ParamByName('GRUPO').AsInteger := Self.Grupo;
    dm.qryCRUD.ParamByName('VERBA').AsFloat := Self.Verba;
    dm.qryCRUD.ParamByName('EXECUTANTE').AsString := Self.Executor;
    dm.qryCRUD.ParamByName('MANUTENCAO').AsDateTime := Self.Manutencao;
    dm.ZConn.PingServer;
    dm.qryCRUD.ExecSQL;
    dm.qryCRUD.Close;
    dm.qryCRUD.SQL.Clear;
    Result := True;
  Except
    on E: Exception do
    begin
      ErrorMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

function TCodigosEntregadores.Update(): Boolean;
begin
  try
    Result := False;
    if (not VerificaConexao()) then
    begin
      MessageDlg('Sem conexão com o banco de dados!', mtWarning, [mbCancel], 0);
      Exit;
    end;
    dm.qryCRUD.Close;
    dm.qryCRUD.SQL.Clear;
    dm.qryCRUD.SQL.Text := 'UPDATE ' + TABLENAME + ' SET ' +
      'NOM_FANTASIA       = :NOME, ' + 'COD_AGENTE         = :AGENTE, ' +
      'DAT_CODIGO         = :DATA, ' + 'DES_CHAVE          = :CHAVE, ' +
      'COD_GRUPO          = :GRUPO, ' + 'VAL_VERBA          = :VERBA, ' +
      'NOM_EXECUTANTE     = :EXECUTANTE, ' + 'DAT_MANUTENCAO     = :MANUTENCAO '
      + 'WHERE COD_CADASTRO = :CADASTRO AND COD_ENTREGADOR = :CODIGO;';
    dm.qryCRUD.ParamByName('CADASTRO').AsInteger := Self.Cadastro;
    dm.qryCRUD.ParamByName('CODIGO').AsInteger := Self.Codigo;
    dm.qryCRUD.ParamByName('NOME').AsString := Self.Nome;
    dm.qryCRUD.ParamByName('AGENTE').AsInteger := Self.Agente;
    dm.qryCRUD.ParamByName('DATA').AsDate := Self.Data;
    dm.qryCRUD.ParamByName('CHAVE').AsString := Self.Chave;
    dm.qryCRUD.ParamByName('GRUPO').AsInteger := Self.Grupo;
    dm.qryCRUD.ParamByName('VERBA').AsFloat := Self.Verba;
    dm.qryCRUD.ParamByName('EXECUTANTE').AsString := Self.Executor;
    dm.qryCRUD.ParamByName('MANUTENCAO').AsDateTime := Self.Manutencao;
    dm.ZConn.PingServer;
    dm.qryCRUD.ExecSQL;
    dm.qryCRUD.Close;
    dm.qryCRUD.SQL.Clear;
    Result := True;
  Except
    on E: Exception do
    begin
      ErrorMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

function TCodigosEntregadores.getObject(sId, sColuna: string): Boolean;
begin
  try
    Result := False;
    if (not VerificaConexao()) then
    begin
      MessageDlg('Sem conexão com o banco de dados!', mtWarning, [mbCancel], 0);
      Exit;
    end;
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
    dm.qryGetObject.SQL.Add('SELECT * FROM ' + TABLENAME);
    if sColuna = 'CADASTRO' then
    begin
      dm.qryGetObject.SQL.Add('WHERE COD_CADASTRO = :CADASTRO');
      dm.qryGetObject.ParamByName('CADASTRO').AsInteger := StrToInt(sId);
    end
    else if sColuna = 'CODIGO' then
    begin
      dm.qryGetObject.SQL.Add('WHERE COD_ENTREGADOR = :CODIGO');
      dm.qryGetObject.ParamByName('CODIGO').AsInteger := StrToInt(sId);
    end
    else if sColuna = 'NOME' then
    begin
      dm.qryGetObject.SQL.Add('WHERE NOM_FANTASIA = :NOME');
      dm.qryGetObject.ParamByName('NOME').AsString := sId;
    end
    else if sColuna = 'AGENTE' then
    begin
      dm.qryGetObject.SQL.Add('WHERE COD_AGENTE = :AGENTE');
      dm.qryGetObject.ParamByName('AGENTE').AsInteger := StrToInt(sId);
    end
    else if sColuna = 'DATA' then
    begin
      dm.qryGetObject.SQL.Add('WHERE DAT_CODIGO = :DATA');
      dm.qryGetObject.ParamByName('DATA').AsDate := StrToDate(sId);
    end
    else if sColuna = 'CHAVE' then
    begin
      dm.qryGetObject.SQL.Add('WHERE DES_CHAVE = :CHAVE');
      dm.qryGetObject.ParamByName('CHAVE').AsString := sId;
    end
    else if sColuna = 'CHAVE1' then
    begin
      dm.qryGetObject.SQL.Add
        ('WHERE DES_CHAVE = :CHAVE AND DAT_CODIGO <= :DATA');
      dm.qryGetObject.SQL.Add('ORDER BY DAT_CODIGO DESC');
      dm.qryGetObject.ParamByName('CHAVE').AsString := sId;
      dm.qryGetObject.ParamByName('DATA').AsDate := Self.Data;
    end
    else if sColuna = 'CHAVE2' then
    begin
      dm.qryGetObject.SQL.Add
        ('WHERE COD_CADASTRO = :CADASTRO AND COD_ENTREGADOR = :CODIGO');
      dm.qryGetObject.ParamByName('CADASTRO').AsInteger := StrToInt(sId);
      dm.qryGetObject.ParamByName('CODIGO').AsInteger := Self.Codigo;
    end;
    dm.ZConn.PingServer;
    dm.qryGetObject.Open;
    if dm.qryGetObject.IsEmpty then
    begin
      dm.qryGetObject.Close;
      dm.qryGetObject.SQL.Clear;
      Exit;
    end;
    dm.qryGetObject.First;
    Self.Cadastro := dm.qryGetObject.FieldByName('COD_CADASTRO').AsInteger;
    Self.Codigo := dm.qryGetObject.FieldByName('COD_ENTREGADOR').AsInteger;
    Self.Nome := dm.qryGetObject.FieldByName('NOM_FANTASIA').AsString;
    Self.Agente := dm.qryGetObject.FieldByName('COD_AGENTE').AsInteger;
    Self.Data := dm.qryGetObject.FieldByName('DAT_CODIGO').AsDateTime;
    Self.Chave := dm.qryGetObject.FieldByName('DES_CHAVE').AsString;
    Self.Grupo := dm.qryGetObject.FieldByName('COD_GRUPO').AsInteger;
    Self.Verba := dm.qryGetObject.FieldByName('VAL_VERBA').AsFloat;
    Self.Executor := dm.qryGetObject.FieldByName('NOM_EXECUTANTE').AsString;
    Self.Manutencao := dm.qryGetObject.FieldByName('DAT_MANUTENCAO').AsDateTime;
    Result := True;
  Except
    on E: Exception do
    begin
      ErrorMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

function TCodigosEntregadores.getField(sCampo, sColuna: string): String;
begin
  try
    Result := '';
    if (not VerificaConexao()) then
    begin
      MessageDlg('Sem conexão com o banco de dados!', mtWarning, [mbCancel], 0);
      Exit;
    end;
    dm.qryFields.Close;
    dm.qryFields.SQL.Clear;
    dm.qryFields.SQL.Add('SELECT ' + sCampo + ' AS CAMPO FROM ' + TABLENAME);
    if sColuna = 'CADASTRO' then
    begin
      dm.qryFields.SQL.Add('WHERE COD_CADASTRO = :CADASTRO');
      dm.qryFields.ParamByName('CADASTRO').AsInteger := Self.Cadastro;
    end
    else if sColuna = 'CODIGO' then
    begin
      dm.qryFields.SQL.Add('WHERE COD_ENTREGADOR = :CODIGO');
      dm.qryFields.ParamByName('CODIGO').AsInteger := Self.Codigo;
    end
    else if sColuna = 'NOME' then
    begin
      dm.qryFields.SQL.Add('WHERE NOM_FANTASIA = :NOME');
      dm.qryFields.ParamByName('NOME').AsString := Self.Nome;
    end
    else if sColuna = 'AGENTE' then
    begin
      dm.qryFields.SQL.Add('WHERE COD_AGENTE = :AGENTE');
      dm.qryFields.ParamByName('AGENTE').AsInteger := Self.Agente;
    end
    else if sColuna = 'DATA' then
    begin
      dm.qryFields.SQL.Add('WHERE DAT_CODIGO = :DATA');
      dm.qryFields.ParamByName('DATA').AsDate := Self.Data;
    end
    else if sColuna = 'CHAVE' then
    begin
      dm.qryFields.SQL.Add('WHERE DES_CHAVE = :CHAVE');
      dm.qryFields.ParamByName('CHAVE').AsString := Self.Chave;
    end
    else if sColuna = 'CHAVE1' then
    begin
      dm.qryFields.SQL.Add('WHERE DES_CHAVE = :CHAVE AND DAT_CODIGO >= :DATA');
      dm.qryFields.ParamByName('CHAVE').AsString := Self.Chave;
      dm.qryFields.ParamByName('DATA').AsDate := Self.Data;
    end
    else if sColuna = 'CHAVE2' then
    begin
      dm.qryFields.SQL.Add
        ('WHERE COD_CADASTRO = :CADASTRO AND COD_ENTREGADOR = :CODIGO');
      dm.qryFields.ParamByName('CADASTRO').AsInteger := Self.Cadastro;
      dm.qryFields.ParamByName('CODIGO').AsInteger := Self.Codigo;
    end;
    dm.ZConn.PingServer;
    dm.qryFields.Open;
    if dm.qryFields.IsEmpty then
    begin
      dm.qryFields.Close;
      dm.qryFields.SQL.Clear;
      Exit;
    end;
    dm.qryFields.First;
    Result := dm.qryFields.FieldByName('CAMPO').AsString;
    dm.qryFields.Close;
    dm.qryFields.SQL.Clear;
  Except
    on E: Exception do
    begin
      ErrorMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

function TCodigosEntregadores.VerificaConexao(): Boolean;
begin
  try
    Result := False;
    if (not dm.ZConn.Connected) then
    begin
      dm.ZConn.Connect;
    end;
    Result := dm.ZConn.Connected;
  Except
    on E: Exception do
    begin
      ErrorMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

procedure TCodigosEntregadores.ErrorMessage(sTexto: string);
begin
  if TUtil.Empty(sTexto) then
  begin
    Exit;
  end;
  MessageDlg(sTexto, mtError, [mbCancel], 0);
end;

function TCodigosEntregadores.Exist(): Boolean;
begin
end;

function TCodigosEntregadores.Delete(filtro: string): Boolean;
begin
  try
    Result := False;
    with dm.qryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Add('DELETE FROM ' + TABLENAME);
      if filtro = 'CADASTRO' then
      begin
        SQL.Add('WHERE COD_CADASTRO = :CADASTRO');
        ParamByName('CADASTRO').AsInteger := Self.Cadastro;
      end
      else if filtro = 'CODIGO' then
      begin
        SQL.Add('WHERE COD_ENTREGADOR = :CODIGO');
        ParamByName('CODIGO').AsInteger := Self.Codigo;
      end
      else if filtro = 'AGENTE' then
      begin
        SQL.Add('WHERE COD_AGENTE = :AGENTE');
        ParamByName('AGENTE').AsInteger := Self.Agente;
      end;
      dm.ZConn.PingServer;
      ExecSQL;
    end;

    dm.qryCRUD.Close;
    dm.qryCRUD.SQL.Clear;

    Result := True;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TCodigosEntregadores.Desvincular(): Boolean;
begin
  try
    Result := False;
    if (not VerificaConexao()) then
    begin
      MessageDlg('Sem conexão com o banco de dados!', mtWarning, [mbCancel], 0);
      Exit;
    end;
    dm.qryCRUD.Close;
    dm.qryCRUD.SQL.Clear;
    dm.qryCRUD.SQL.Text := 'UPDATE ' + TABLENAME + ' SET ' +
      'COD_CADASTRO       = 0, ' + 'NOM_EXECUTANTE     = :EXECUTANTE, ' +
      'DAT_MANUTENCAO     = :MANUTENCAO ' +
      'WHERE COD_CADASTRO = :CADASTRO AND COD_ENTREGADOR = :CODIGO;';
    dm.qryCRUD.ParamByName('CADASTRO').AsInteger := Self.Cadastro;
    dm.qryCRUD.ParamByName('CODIGO').AsInteger := Self.Codigo;
    dm.qryCRUD.ParamByName('EXECUTANTE').AsString := Self.Executor;
    dm.qryCRUD.ParamByName('MANUTENCAO').AsDateTime := Self.Manutencao;
    dm.ZConn.PingServer;
    dm.qryCRUD.ExecSQL;
    dm.qryCRUD.Close;
    dm.qryCRUD.SQL.Clear;
    Result := True;
  Except
    on E: Exception do
    begin
      ErrorMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

function TCodigosEntregadores.getObjects(): Boolean;
begin
  Try
    Result := False;
    with dm.qryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);
      dm.ZConn.PingServer;
      Open;
      if not IsEmpty then
        First
      else
      begin
        Close;
        SQL.Clear;
      end;
    end;
    if dm.qryGetObject.RecordCount > 0 then
      Result := True;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

procedure TCodigosEntregadores.setAgente(const Value: Integer);
begin
  _agente := Value;
end;

procedure TCodigosEntregadores.setCadastro(const Value: Integer);
begin
  _cadastro := Value;
end;

procedure TCodigosEntregadores.setChave(const Value: String);
begin
  _chave := Value;
end;

procedure TCodigosEntregadores.setCodigo(const Value: Integer);
begin
  _codigo := Value;
end;

procedure TCodigosEntregadores.setData(const Value: TDate);
begin
  _data := Value;
end;

procedure TCodigosEntregadores.setExecutor(const Value: String);
begin
  _executor := Value;
end;

procedure TCodigosEntregadores.setGrupo(const Value: Integer);
begin
  _grupo := Value;
end;

procedure TCodigosEntregadores.setManutencao(const Value: TDateTime);
begin
  _manutencao := Value;
end;

procedure TCodigosEntregadores.setNome(const Value: String);
begin
  _nome := Value;
end;

procedure TCodigosEntregadores.setOperacao(const Value: String);
begin
  _operacao := Value;
end;

procedure TCodigosEntregadores.setVerba(const Value: Double);
begin
  _verba := Value;
end;

end.
