unit clBancos;

interface

uses clConexao;

type
  TBancos = class(TObject)

  private
    function getCodigo: String;
    function getNome: String;
    procedure setCodigo(const Value: String);
    procedure setNome(const Value: String);
    function getOperacao: String;
    procedure setOperacao(const Value: String);

  protected
    _codigo: String;
    _nome: String;
    _operacao: String;
    _conexao: TConexao;

  public

    constructor Create;
    destructor Destroy;

    property Codigo: String read getCodigo write setCodigo;
    property Nome: String read getNome write setNome;
    property Operacao: String read getOperacao write setOperacao;

    function Validar(): Boolean;
    function Exist(): Boolean;
    function getObject(id, filtro: String): Boolean;
    function getObjects(): Boolean;
    function getField(campo, coluna: String): String;
    function Insert(): Boolean;
    function Update(): Boolean;

  end;

const
  TABLENAME = 'tbbancos';

implementation

uses Variants, SysUtils, udm, clUtil, Math, Dialogs, DB, ZAbstractRODataset,
  ZDataset,
  ZAbstractDataset;

{ TBancos }

constructor TBancos.Create;
begin
  _conexao := TConexao.Create;
  if (not _conexao.VerifyConnZEOS(0)) then
  begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
      Self.ClassName + ') !', mtError, [mbCancel], 0);
  end;
end;

destructor TBancos.Destroy;
begin
  _conexao.Free;
end;

function TBancos.getCodigo: String;
begin
  Result := _codigo;
end;

function TBancos.getNome: String;
begin
  Result := _nome;
end;

function TBancos.getOperacao: String;
begin
  Result := _operacao;
end;

function TBancos.Validar(): Boolean;
begin
  Result := False;
  if TUtil.Empty(Self.Codigo) then
  begin
    MessageDlg('Informe o código do Banco.', mtWarning, [mbOK], 0);
    Exit;
  end;
  if TUtil.Empty(Self.Nome) then
  begin
    MessageDlg('Informe o nome do Banco.', mtWarning, [mbOK], 0);
    Exit;
  end;
  if Self.Operacao = 'I' then
  begin
    if Self.Exist() then
    begin
      MessageDlg('Código de Banco já cadastrado!', mtWarning, [mbOK], 0);
      Exit
    end;
  end;
  Result := True;
end;

function TBancos.Exist(): Boolean;
begin
  try
    Result := False;
    with dm.qryGeral do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);
      SQL.Add('WHERE COD_BANCO = :CODIGO');
      ParamByName('CODIGO').AsString := Self.Codigo;
      dm.ZConn.Reconnect;
      Open;
      if not(IsEmpty) then
      begin
        Result := True;
      end;
      Close;
      SQL.Clear;
    end;
  Except
    on E: Exception do
    begin
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

function TBancos.getObject(id, filtro: String): Boolean;
begin
  try
    Result := False;
    with dm.qryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);
      if filtro = 'CODIGO' then
      begin
        SQL.Add('WHERE COD_BANCO = :CODIGO');
        ParamByName('CODIGO').AsString := id;
      end;
      if filtro = 'NOME' then
      begin
        SQL.Add('WHERE NOM_BANCO = :NOME');
        ParamByName('NOME').AsString := id;
      end;
      dm.ZConn.Reconnect;
      Open;
      if not(IsEmpty) then
      begin
        First;
        if RecordCount = 1 then
        begin
          Self.Codigo := FieldByName('COD_BANCO').AsString;
          Self.Nome := FieldByName('NOM_BANCO').AsString;
          Close;
          SQL.Clear;
        end
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
    begin
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

function TBancos.getObjects(): Boolean;
begin
  try
    Result := False;
    with dm.qryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);
      dm.ZConn.Reconnect;
      Open;
      if IsEmpty then
      begin
        Close;
        SQL.Clear;
        Exit;
      end;
      First;
    end;
    Result := True;
  Except
    on E: Exception do
    begin
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

function TBancos.getField(campo, coluna: String): String;
begin
  try
    Result := '';
    if TUtil.Empty(campo) then
    begin
      Exit;
    end;
    if TUtil.Empty(coluna) then
    begin
      Exit;
    end;
    with dm.qryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT ' + campo + ' FROM ' + TABLENAME);
      if coluna = 'CODIGO' then
      begin
        SQL.Add('WHERE COD_BANCO = :CODIGO');
        ParamByName('CODIGO').AsString := Self.Codigo;
      end;
      if coluna = 'NOME' then
      begin
        SQL.Add('WHERE NOM_BANCO = :NOME');
        ParamByName('NOME').AsString := Self.Nome;
      end;
      dm.ZConn.Reconnect;
      Open;
      if not(IsEmpty) then
      begin
        Result := FieldByName(campo).AsString;
      end;
      Close;
      SQL.Clear;
    end;
  Except
    on E: Exception do
    begin
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

function TBancos.Insert(): Boolean;
begin
  try
    Result := False;
    with dm.qryCRUD do
    begin
      SQL.Text := 'INSERT INTO ' + TABLENAME + ' (' + 'COD_BANCO, ' +
        'NOM_BANCO) ' + 'VALUES (' + ':CODIGO, ' + ':NOME)';
      ParamByName('CODIGO').AsString := Self.Codigo;
      ParamByName('NOME').AsString := Self.Nome;
      dm.ZConn.Reconnect;
      ExecSQL;
      Close;
      SQL.Clear;
    end;
    Result := True;
  Except
    on E: Exception do
    begin
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

function TBancos.Update(): Boolean;
begin
  try
    Result := False;
    with dm.qryCRUD do
    begin
      SQL.Text := 'UPDATE ' + TABLENAME + ' SET ' + 'NOM_BANCO = :NOME ' +
        'WHERE COD_BANCO = :CODIGO';
      ParamByName('CODIGO').AsString := Self.Codigo;
      ParamByName('NOME').AsString := Self.Nome;
      dm.ZConn.Reconnect;
      ExecSQL;
      Close;
      SQL.Clear;
    end;
    Result := True;
  Except
    on E: Exception do
    begin
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

procedure TBancos.setCodigo(const Value: String);
begin
  _codigo := Value;
end;

procedure TBancos.setNome(const Value: String);
begin
  _nome := Value;
end;

procedure TBancos.setOperacao(const Value: String);
begin
  _operacao := Value;
end;

end.
