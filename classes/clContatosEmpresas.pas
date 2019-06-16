unit clContatosEmpresas;

interface

uses clcontatos, clConexao, Vcl.Dialogs, System.SysUtils;

type
  TContatosEmpresas = class(TContatos)
  protected
    FEmpresa: Integer;
    FPadrao: String;
    FSequencia: Integer;
    conexao : TConexao;
  private
    procedure SetEmpresa(val: Integer);
    procedure SetSequencia(val: Integer);
    procedure SetPadrao(val: String);
  public
    constructor Create;
    property Empresa: Integer read FEmpresa write SetEmpresa;
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
  end;

const
  TABLENAME = 'cad_contatos_empresa';

implementation

uses udm;

constructor TContatosEmpresas.Create;
begin
  inherited Create;
  conexao :=  TConexao.Create;
end;

procedure TContatosEmpresas.SetEmpresa(val: Integer);
begin
  FEmpresa  :=  val;
end;

procedure TContatosEmpresas.SetSequencia(val: Integer);
begin
  FSequencia  :=  val;
end;

procedure TContatosEmpresas.SetPadrao(val: String);
begin
  FPadrao :=  val;
end;

procedure TContatosEmpresas.MaxSeq;
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
        ' WHERE COD_EMPRESA = :CODIGO';
      ParamByName('CODIGO').AsInteger := Self.Empresa;
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

function TContatosEmpresas.Validar: Boolean;
begin
  Result  :=  False;
  if Self.Empresa = 0 then
  begin
    MessageDlg('Código de Empresa inválido!',mtWarning,[mbCancel],0);
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

function TContatosEmpresas.Insert: Boolean;
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
                  'COD_EMPRESA, ' +
                  'SEQ_CONTATO, ' +
                  'DES_CONTATO, ' +
                  'NUM_TELEFONE, ' +
                  'DES_EMAIL, ' +
                  'DOM_PADRAO) ' +
                  'VALUES(' +
                  ':CODIGO, ' +
                  ':SEQUENCIA, ' +
                  ':CONTATO, ' +
                  ':TELEFONE, ' +
                  ':EMAIL, ' +
                  ':PADRAO)';
      ParamByName('CODIGO').AsInteger := Self.Empresa;
      ParamByName('SEQUENCIA').AsInteger := Self.Sequencia;
      ParamByName('CONTATO').AsString := Self.Contato;
      ParamByName('TELEFONE').AsString := Self.Telefone;
      ParamByName('EMAIL').AsString := Self.EMail;
      ParamByName('PADRAO').AsString := Self.Padrao;
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

function TContatosEmpresas.Update: Boolean;
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
                  'DES_PADRAO = :PADRAO ' +
                  'WHERE COD_EMPRESA = :CODIGO AND SEQ_CONTATO = :SEQUENCIA';
      ParamByName('CODIGO').AsInteger := Self.Empresa;
      ParamByName('SEQUENCIA').AsInteger := Self.Sequencia;
      ParamByName('CONTATO').AsString := Self.Contato;
      ParamByName('TELEFONE').AsString := Self.Telefone;
      ParamByName('EMAIL').AsString := Self.EMail;
      ParamByName('PADRAO').AsString := Self.Padrao;
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

function TContatosEmpresas.Delete(sFiltro: String): Boolean;
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
        SQL.Add('WHERE COD_EMPRESA = :CODIGO');
        ParamByName('CODIGO').AsInteger := Self.Empresa;
      end
      else if sFiltro = 'SEQUENCIA' then
      begin
        SQL.Add('WHERE COD_EMPRESA = :CODIGO AND SEQ_CONTATO = :SEQUENCIA');
        ParamByName('CODIGO').AsInteger := Self.Empresa;
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

function TContatosEmpresas.getObjects: Boolean;
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

function TContatosEmpresas.getField(sCampo: String; sColuna: String): String;
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
        SQL.Add(' WHERE COD_EMPRESA = :CODIGO AND SEQ_CONTATO = :SEQUENCIA ORDER BY SEQ_CONTATO');
        ParamByName('CODIGO').AsInteger := Self.Empresa;
        ParamByName('SEQUENCIA').AsInteger := Self.Sequencia;
      end
      else if sColuna = 'CODIGO' then
      begin
        SQL.Add(' WHERE COD_EMPRESA = :CODIGO ORDER BY SEQ_CONTATO');
        ParamByName('CODIGO').AsInteger := Self.Empresa;
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

destructor TContatosEmpresas.Destroy;
begin
  conexao.Free;
  inherited Destroy;
end;

function TContatosEmpresas.getObject(sId: String; sFiltro: String): Boolean;
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
        SQL.Add('WHERE COD_EMPRESA = :CODIGO');
        ParamByName('CODIGO').AsInteger := StrToInt(sId);
      end
      else if sFiltro = 'SEQUENCIA' then
      begin
        SQL.Add('WHERE COD_EMPRESA = :CODIGO AND SEQ_CONTATO = :SEQUENCIA');
        ParamByName('CODIGO').AsInteger := Self.Empresa;
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
        Self.Empresa := FieldByName('COD_EMPRESA').AsInteger;
        Self.Sequencia := FieldByName('SEQ_CONTATO').AsInteger;
        Self.Contato := FieldByName('DES_CONTATO').AsString;
        Self.Telefone := FieldByName('NUM_TELEFONE').AsString;
        Self.EMail := FieldByName('DES_EMAIL').AsString;
        Self.Padrao := FieldByName('DOM_PADRAO').AsString;
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

end.
