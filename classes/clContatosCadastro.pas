unit clContatosCadastro;

interface

uses clcontatos, clConexao, Vcl.Dialogs, System.SysUtils;

type
  TContatosCadastro = class(TContatos)
  protected
    FCadastro: Integer;
    FPadrao: String;
    FSequencia: Integer;
    conexao: TConexao;
    FDivulgar: String;
  private
    procedure SetCadastro(val: Integer);
    procedure SetSequencia(val: Integer);
    procedure SetPadrao(val: String);
    procedure SetDivulgar(val: String);
  public
    constructor Create;
    property Cadastro: Integer read FCadastro write SetCadastro;
    property Sequencia: Integer read FSequencia write SetSequencia;
    property Padrao: String read FPadrao write SetPadrao;
    procedure MaxSeq;
    function Validar: Boolean;
    function Insert: Boolean;
    function Update: Boolean;
    function Delete(sFiltro: String): Boolean;
    function getObjects: Boolean;
    function getField(sCampo: String; sColuna: String): String;
    destructor Destroy; override;
    function getObject(sId: String; sFiltro: String): Boolean;
    property Divulgar: String read FDivulgar write SetDivulgar;
  end;

const
  TABLENAME = 'cad_contatos_cadastro';

implementation

uses udm;

constructor TContatosCadastro.Create;
begin
  inherited Create;
  conexao :=  TConexao.Create;
end;

procedure TContatosCadastro.SetCadastro(val: Integer);
begin
  FCadastro  :=  val;
end;

procedure TContatosCadastro.SetSequencia(val: Integer);
begin
  FSequencia  :=  val;
end;

procedure TContatosCadastro.SetPadrao(val: String);
begin
  FPadrao :=  val;
end;

procedure TContatosCadastro.MaxSeq;
begin
  try
    if (not conexao.VerifyConnZEOS(0)) then
    begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados!', mtError, [mbCancel], 0);
      Exit;
    end;
    Self.Sequencia  :=  0;
    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT MAX(SEQ_CONTATO) AS SEQUENCIA FROM ' + TABLENAME +
        ' WHERE COD_CADASTRO = :CODIGO';
      ParamByName('CODIGO').AsInteger := Self.Cadastro;
      dm.ZConn.PingServer;
      Open;
      if not(IsEmpty) then
      begin
        First;
        Self.Sequencia := (FieldByName('SEQUENCIA').AsInteger) + 1;
      end;
    end;
    dm.QryGetObject.Close;
    dm.QryGetObject.SQL.Clear;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TContatosCadastro.Validar: Boolean;
begin
  Result  :=  False;
  if Self.Cadastro = 0 then
  begin
    MessageDlg('Código de Cadastro inválido!',mtWarning,[mbCancel],0);
    Exit;
  end;
  if Self.Sequencia = 0 then
  begin
    MessageDlg('Sequência de inválida!',mtWarning,[mbCancel],0);
    Exit;
  end;
  if Self.Contato.IsEmpty then
  begin
    MessageDlg('Informe uma Descrição ou Nome do Contato!',mtWarning,[mbCancel],0);
    Exit;
  end;
  if (Self.Telefone.IsEmpty) and (Self.EMail.IsEmpty) then
  begin
    MessageDlg('Informe um Número de Telefone ou um E-Mail do Contato!',mtWarning,[mbCancel],0);
    Exit;
  end;
  Result  :=  True;
end;

function TContatosCadastro.Insert: Boolean;
begin
  try
    Result := False;
    if (not conexao.VerifyConnZEOS(0)) then
    begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados!', mtError, [mbCancel], 0);
      Exit;
    end;
    MaxSeq;
    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'INSERT INTO ' + TABLENAME + ' ( ' +
                  'COD_CADASTRO, ' +
                  'SEQ_CONTATO, ' +
                  'DES_CONTATO, ' +
                  'NUM_TELEFONE, ' +
                  'DES_EMAIL, ' +
                  'DOM_PADRAO, ' +
                  'DOM_DIVULGAR) ' +
                  'VALUES(' +
                  ':CODIGO, ' +
                  ':SEQUENCIA, ' +
                  ':CONTATO, ' +
                  ':TELEFONE, ' +
                  ':EMAIL, ' +
                  ':PADRAO, ' +
                  ':DIVULGAR);';
      ParamByName('CODIGO').AsInteger := Self.Cadastro;
      ParamByName('SEQUENCIA').AsInteger := Self.Sequencia;
      ParamByName('CONTATO').AsString := Self.Contato;
      ParamByName('TELEFONE').AsString := Self.Telefone;
      ParamByName('EMAIL').AsString := Self.EMail;
      ParamByName('PADRAO').AsString := Self.Padrao;
      ParamByName('DIVULGAR').AsString := Self.Divulgar;
      dm.ZConn.PingServer;
      ExecSQL;
    end;
    dm.QryCRUD.Close;
    dm.QryCRUD.SQL.Clear;
    Result := True;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TContatosCadastro.Update: Boolean;
begin
  try
    Result := False;
    if (not conexao.VerifyConnZEOS(0)) then
    begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados!', mtError, [mbCancel], 0);
      Exit;
    end;
    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'UPDATE ' + TABLENAME + ' SET ' +
                  'DES_CONTATO = :CONTATO, ' +
                  'NUM_TELEFONE = :TELEFONE, ' +
                  'DES_EMAIL = :EMAIL, ' +
                  'DES_PADRAO = :PADRAO, ' +
                  'DOM_DIVULGAR = :DIVULGAR ' +
                  'WHERE COD_CADASTRO = :CODIGO AND SEQ_CONTATO = :SEQUENCIA';
      ParamByName('CODIGO').AsInteger := Self.Cadastro;
      ParamByName('SEQUENCIA').AsInteger := Self.Sequencia;
      ParamByName('CONTATO').AsString := Self.Contato;
      ParamByName('TELEFONE').AsString := Self.Telefone;
      ParamByName('EMAIL').AsString := Self.EMail;
      ParamByName('PADRAO').AsString := Self.Padrao;
      ParamByName('DIVULGAR').AsString := Self.Divulgar;
      dm.ZConn.PingServer;
      ExecSQL;
    end;

    dm.QryCRUD.Close;
    dm.QryCRUD.SQL.Clear;

    Result := True;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TContatosCadastro.Delete(sFiltro: String): Boolean;
begin
  try
    Result := False;
    if (not conexao.VerifyConnZEOS(0)) then
    begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados!', mtError, [mbCancel], 0);
      Exit;
    end;
    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Add('DELETE FROM ' + TABLENAME);
      if sFiltro = 'CODIGO' then
      begin
        SQL.Add('WHERE COD_CADASTRO = :CODIGO');
        ParamByName('CODIGO').AsInteger := Self.Cadastro;
      end
      else if sFiltro = 'SEQUENCIA' then
      begin
        SQL.Add('WHERE COD_CADASTRO = :CODIGO AND SEQ_CONTATO = :SEQUENCIA');
        ParamByName('CODIGO').AsInteger := Self.Cadastro;
        ParamByName('SEQUENCIA').AsInteger := Self.Sequencia;
      end;
      dm.ZConn.PingServer;
      ExecSQL;
    end;

    dm.QryCRUD.Close;
    dm.QryCRUD.SQL.Clear;

    Result := True;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TContatosCadastro.getObjects: Boolean;
begin
  try
    Result := False;
    if (not conexao.VerifyConnZEOS(0)) then
    begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados!', mtError, [mbCancel], 0);
      Exit;
    end;
    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);
      dm.ZConn.PingServer;
      Open;
      if not(IsEmpty) then
      begin
        First;
      end
      else
      begin
        Close;
        SQL.Clear;
        Exit;
      end;
    end;
    Result := True;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TContatosCadastro.getField(sCampo: String; sColuna: String): String;
begin
  try
    Result := '';
    if sCampo.IsEmpty then
    begin
      Exit;
    end;
    if sColuna.IsEmpty then
    begin
      Exit;
    end;
    with dm.qryFields do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT ' + sCampo + ' FROM ' + TABLENAME);

      if sColuna = 'SEQUENCIA' then
      begin
        SQL.Add(' WHERE COD_CADASTRO = :CODIGO AND SEQ_CONTATO = :SEQUENCIA ORDER BY SEQ_CONTATO');
        ParamByName('CODIGO').AsInteger := Self.Cadastro;
        ParamByName('SEQUENCIA').AsInteger := Self.Sequencia;
      end
      else if sColuna = 'CODIGO' then
      begin
        SQL.Add(' WHERE COD_CADASTRO = :CODIGO ORDER BY SEQ_CONTATO');
        ParamByName('CODIGO').AsInteger := Self.Cadastro;
      end;
      dm.ZConn.PingServer;
      Open;
      if not(IsEmpty) then
      begin
        First;
        Result  :=  FieldByName(sCampo).AsString;
      end;
      Close;
      SQL.Clear;
      Exit;
    end;
  Except on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

destructor TContatosCadastro.Destroy;
begin
  conexao.Free;
  inherited Destroy;
end;

function TContatosCadastro.getObject(sId: String; sFiltro: String): Boolean;
begin
  try
    Result := False;
    if sId.IsEmpty then
    begin
      Exit;
    end;
    if sFiltro.IsEmpty then
    begin
      Exit;
    end;
    if (not conexao.VerifyConnZEOS(0)) then
    begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados!', mtError, [mbCancel], 0);
      Exit;
    end;
    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);
      if sFiltro = 'CODIGO' then
      begin
        SQL.Add('WHERE COD_CADASTRO = :CODIGO');
        ParamByName('CODIGO').AsInteger := StrToInt(sId);
      end
      else if sFiltro = 'SEQUENCIA' then
      begin
        SQL.Add('WHERE COD_CADASTRO = :CODIGO AND SEQ_CONTATO = :SEQUENCIA');
        ParamByName('CODIGO').AsInteger := Self.Cadastro;
        ParamByName('SEQUENCIA').AsInteger := StrToInt(sId);
      end
      else if sFiltro = 'CONTATO' then
      begin
        SQL.Add('WHERE DES_CONTATO LIKE :CONTATO');
        ParamByName('CONTATO').AsString := QuotedStr('%' + sId + '%');
      end
      else if sFiltro = 'EMAIL' then
      begin
        SQL.Add('WHERE DES_EMAIL = :EMAIL');
        ParamByName('EMAIL').AsString := sId;
      end;
      dm.ZConn.PingServer;
      Open;
      if (not IsEmpty) then
      begin
        First;
        Self.Cadastro := FieldByName('COD_CADASTRO').AsInteger;
        Self.Sequencia := FieldByName('SEQ_CONTATO').AsInteger;
        Self.Contato := FieldByName('DES_CONTATO').AsString;
        Self.Telefone := FieldByName('NUM_TELEFONE').AsString;
        Self.EMail := FieldByName('DES_EMAIL').AsString;
        Self.Padrao := FieldByName('DOM_PADRAO').AsString;
        sELF.Divulgar := FieldByName('DOM_DIVULGAR').AsString;
        Result := True;
        Exit;
      end;
      Close;
      SQL.Clear;
    end;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

procedure TContatosCadastro.SetDivulgar(val: String);
begin
  FDivulgar := val;
end;

end.
