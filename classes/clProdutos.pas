unit clProdutos;

interface

type
  TProdutos = class(TObject)

  private
    function getCodigo(): String;
    function getDescricao(): String;
    procedure setCodigo(const Value: String);
    procedure setDescricao(const Value: String);
    function getOperacao: String;
    procedure setOperacao(const Value: String);

  protected
    _codigo: String;
    _descricao: String;
    _operacao: String;
  public
    property Codigo: String read getCodigo write setCodigo;
    property Descricao: String read getDescricao write setDescricao;
    property Operacao: String read getOperacao write setOperacao;

    function Validar(): Boolean;
    function getObject(id, coluna: String): Boolean;
    function getObjects(): Boolean;
    function getField(campo, coluna: String): String;
    function Delete(filtro: String): Boolean;
    function Insert(): Boolean;
    function Update(): Boolean;

  end;

const
  TABLENAME = 'jor_produtos';

implementation

uses System.Variants, System.SysUtils, udm, clUtil, Math, Dialogs, Data.DB,
  ZAbstractRODataset, ZDataset;

{ TProdutos }

function TProdutos.getCodigo: String;
begin
  Result := _codigo;
end;

function TProdutos.getDescricao: String;
begin
  Result := _descricao;
end;

function TProdutos.getOperacao: String;
begin
  Result := _operacao;
end;

function TProdutos.Validar(): Boolean;
begin
  try
    Result := False;
    if TUtil.Empty(Self.Codigo) then
    begin
      MessageDlg('Informe o código do Produto!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if Self.Operacao = 'I' then
    begin
      if not(TUtil.Empty(getField('COD_PRODUTO', 'CODIGO'))) then
      begin
        MessageDlg('Código já cadastrado.', mtWarning, [mbOK], 0);
        Exit;
      end;
    end;
    if TUtil.Empty(Self.Descricao) then
    begin
      MessageDlg('Informe a descrição do Produto.', mtWarning, [mbOK], 0);
      Exit;
    end;
    Result := True;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TProdutos.Insert(): Boolean;
begin
  try
    Result := False;
    dm.qryCRUD1.Close;
    dm.qryCRUD1.SQL.Clear;
    dm.qryCRUD1.SQL.Text := 'INSERT INTO ' + TABLENAME + '(COD_PRODUTO, ' +
      'DES_PRODUTO) ' + 'VALUES (' + ':CODIGO, ' + ':DESCRICAO);';
    dm.qryCRUD1.ParamByName('CODIGO').AsString := Self.Codigo;
    dm.qryCRUD1.ParamByName('DESCRICAO').AsString := Self.Descricao;
    dm.ZConn1.PingServer;
    dm.qryCRUD1.ExecSQL;
    dm.qryCRUD1.Close;
    dm.qryCRUD1.SQL.Clear;
    Result := True;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TProdutos.Update(): Boolean;
begin
  try
    Result := False;
    with dm.qryCRUD1 do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'UPDATE ' + TABLENAME + ' SET ' +
        'DES_PRODUTO        = :DESCRICAO ' + 'WHERE COD_PRODUTO  = :CODIGO';
      ParamByName('CODIGO').AsString := Self.Codigo;
      ParamByName('DESCRICAO').AsString := Self.Descricao;
      dm.ZConn1.PingServer;
      ExecSQL;
      dm.ZConn1.Commit;
      Close;
      SQL.Clear;
    end;
    Result := True;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TProdutos.Delete(filtro: String): Boolean;
begin
  Try
    Result := False;
    with dm.qryCRUD1 do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'DELETE FROM ' + TABLENAME;
      if filtro = 'CODIGO' then
      begin
        SQL.Add('WHERE COD_PRODUTO  = :CODIGO');
        ParamByName('CODIGO').AsString := Self.Codigo;
      end
      else if filtro = 'DESCRICAO' then
      begin
        SQL.Add('WHERE DES_PRODUTO  = :DESCRICAO');
        ParamByName('DESCRICAO').AsString := Self.Descricao;
      end;
      dm.ZConn1.PingServer;
      ExecSQL;
      Close;
      SQL.Clear;
    end;
    Result := True;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TProdutos.getObject(id, coluna: String): Boolean;
begin
  Try
    Result := False;
    if TUtil.Empty(id) then
    begin
      Exit;
    end;
    with dm.QryGetObject1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);
      if coluna = 'CODIGO' then
      begin
        SQL.Add(' WHERE COD_PRODUTO = :CODIGO');
        ParamByName('CODIGO').AsString := id;
      end
      else if coluna = 'DESCRICAO' then
      begin
        if Pos('%', id) > 0 then
        begin
          SQL.Add(' WHERE DES_PRODUTO LIKE :DESCRICAO');
          ParamByName('DESCRICAO').AsString := id;
        end
        else
        begin
          SQL.Add(' WHERE DES_PRODUTO = :DESCRICAO');
          ParamByName('DESCRICAO').AsString := id;
        end;
      end;
      dm.ZConn1.PingServer;
      Open;
      if not(IsEmpty) then
      begin
        First;
        if RecordCount = 1 then
        begin
          Self.Codigo := FieldByName('COD_PRODUTO').AsString;
          Self.Descricao := FieldByName('DES_PRODUTO').AsString;
          Close;
          SQL.Clear;
        end;
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

function TProdutos.getObjects(): Boolean;
begin
  try
    Result := False;
    with dm.QryGetObject1 do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT * FROM ' + TABLENAME;
      dm.ZConn1.PingServer;
      Open;
      if not(IsEmpty) then
      begin
        First;
      end
      else
      begin
        ShowMessage('Nenhum Registro não encontrado!');
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

function TProdutos.getField(campo, coluna: String): String;
begin
  try
    Result := '';
    with dm.qryFields1 do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT ' + campo + ' FROM ' + TABLENAME;
      if coluna = 'CODIGO' then
      begin
        SQL.Add(' WHERE COD_PRODUTO = :CODIGO ');
        ParamByName('CODIGO').AsString := Self.Codigo;
      end
      else if coluna = 'DESCRICAO' then
      begin
        SQL.Add(' WHERE DES_PRODUTO = :DESCRICAO ');
        ParamByName('DESCRICAO').AsString := Self.Descricao;
      end;
      dm.ZConn1.PingServer;
      Open;
      if not(IsEmpty) then
      begin
        First;
        Result := FieldByName(campo).AsString;
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

procedure TProdutos.setCodigo(const Value: String);
begin
  _codigo := Value;
end;

procedure TProdutos.setDescricao(const Value: String);
begin
  _descricao := Value;
end;

procedure TProdutos.setOperacao(const Value: String);
begin
  _operacao := Value;
end;

end.
