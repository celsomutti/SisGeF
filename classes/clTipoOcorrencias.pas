unit clTipoOcorrencias;

interface

type
  TTiposOcorrencias = class(TObject)

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
  TABLENAME = 'jor_tipo_ocorrencia';

implementation

uses System.Variants, System.SysUtils, udm, clUtil, Math, Dialogs, Data.DB,
  ZAbstractRODataset, ZDataset;

{ TTiposOcorrencias }

function TTiposOcorrencias.getCodigo: String;
begin
  Result := _codigo;
end;

function TTiposOcorrencias.getDescricao: String;
begin
  Result := _descricao;
end;

function TTiposOcorrencias.getOperacao: String;
begin
  Result := _operacao;
end;

function TTiposOcorrencias.Validar(): Boolean;
begin
  try
    Result := False;
    if TUtil.Empty(Self.Codigo) then
    begin
      MessageDlg('Informe o código do Tipo de Ocorrência!', mtWarning,
        [mbOK], 0);
      Exit;
    end;
    if Self.Operacao = 'I' then
    begin
      if not(TUtil.Empty(getField('COD_TIPO_OCORRENCIA', 'CODIGO'))) then
      begin
        MessageDlg('Código já cadastrado.', mtWarning, [mbOK], 0);
        Exit;
      end;
    end;
    if TUtil.Empty(Self.Descricao) then
    begin
      MessageDlg('Informe a descrição do Tipo de Ocorrência.', mtWarning,
        [mbOK], 0);
      Exit;
    end;
    Result := True;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TTiposOcorrencias.Insert(): Boolean;
begin
  try
    Result := False;
    with dm.qryCRUD1 do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'INSERT INTO ' + TABLENAME + ' (' +
                  'COD_TIPO_OCORRENCIA, ' +
                  'DES_TIPO_OCORRENCIA) ' +
                  'VALUES (' +
                  ':CODIGO, ' +
                  ':DESCRICAO);';
      ParamByName('CODIGO').AsString := Self.Codigo;
      ParamByName('DESCRICAO').AsString := Self.Descricao;
      dm.ZConn1.Ping;
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

function TTiposOcorrencias.Update(): Boolean;
begin
  try
    Result := False;
    with dm.qryCRUD1 do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'UPDATE ' + TABLENAME + ' SET ' +
                  'DES_TIPO_OCORRENCIA        = :DESCRICAO ' +
                  'WHERE COD_TIPO_OCORRENCIA  = :CODIGO';
      ParamByName('CODIGO').AsString := Self.Codigo;
      ParamByName('DESCRICAO').AsString := Self.Descricao;
      dm.ZConn1.Ping;
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

function TTiposOcorrencias.Delete(filtro: String): Boolean;
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
        SQL.Add('WHERE COD_TIPO_OCORRENCIA  = :CODIGO');
        ParamByName('CODIGO').AsString := Self.Codigo;
      end
      else if filtro = 'DESCRICAO' then
      begin
        SQL.Add('WHERE DES_TIPO_OCORRENCIA  = :DESCRICAO');
        ParamByName('DESCRICAO').AsString := Self.Descricao;
      end;
      dm.ZConn1.Ping;
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

function TTiposOcorrencias.getObject(id, coluna: String): Boolean;
begin
  Try
    Result := False;
    if TUtil.Empty(id) then
    begin
      Exit;
    end;
    with dm.qrygetObject1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);
      if coluna = 'CODIGO' then
      begin
        SQL.Add(' WHERE COD_TIPO_OCORRENCIA = :CODIGO');
        ParamByName('CODIGO').AsString := id;
      end
      else if coluna = 'DESCRICAO' then
      begin
        if Pos('%', id) > 0 then
        begin
          SQL.Add(' WHERE DES_TIPO_OCORENCIA LIKE :DESCRICAO')
        end
        else
        begin
          SQL.Add(' WHERE DES_TIPO_OCORENCIA = :DESCRICAO');
          ParamByName('DESCRICAO').AsString := id;
        end;
      end
      else if coluna = 'FILTRO' then
      begin
        SQL.Add(' WHERE ' + id);
        ParamByName('TABELA').AsString := TABLENAME;
      end;
      dm.ZConn1.Ping;
      Open;
      if not(IsEmpty) then
      begin
        First;
        if RecordCount = 1 then
        begin
          Self.Codigo := FieldByName('COD_TIPO_OCORRENCIA').AsString;
          Self.Descricao := FieldByName('DES_TIPO_OCORRENCIA').AsString;
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

function TTiposOcorrencias.getObjects(): Boolean;
begin
  try
    Result := False;
    with dm.qrygetObject1 do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT * FROM ' + TABLENAME;
      dm.ZConn1.Ping;
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

function TTiposOcorrencias.getField(campo, coluna: String): String;
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
        SQL.Add(' WHERE COD_TIPO_OCORRENCIA = :CODIGO ');
        ParamByName('CODIGO').AsString := Self.Codigo;
      end
      else if coluna = 'DESCRICAO' then
      begin
        SQL.Add(' WHERE DES_TIPO_OCORRENCIA = :DESCRICAO ');
        ParamByName('DESCRICAO').AsString := Self.Descricao;
      end;
      dm.ZConn1.Ping;
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

procedure TTiposOcorrencias.setCodigo(const Value: String);
begin
  _codigo := Value;
end;

procedure TTiposOcorrencias.setDescricao(const Value: String);
begin
  _descricao := Value;
end;

procedure TTiposOcorrencias.setOperacao(const Value: String);
begin
  _operacao := Value;
end;

end.
