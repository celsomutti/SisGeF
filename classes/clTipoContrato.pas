unit clTipoContrato;

interface

uses clConexao, Vcl.Dialogs, System.SysUtils, clCentroCusto;

type
  TTipoContrato = class(TObject)
  protected
    FContrato: Integer;
    FCCusto: Integer;
    FDescricao: String;
    conexao: TConexao;
    centrocusto: TCentroCusto;
  private
    procedure SetDescricao(val: String);
    procedure SetContrato(val: Integer);
    procedure SetCCusto(val: Integer);
  public
    constructor Create;
    property Descricao: String read FDescricao write SetDescricao;
    property Contrato: Integer read FContrato write SetContrato;
    property CCusto: Integer read FCCusto write SetCCusto;
    function Validar: Boolean;
    function Insert: Boolean;
    function Update: Boolean;
    function Delete(sFiltro: String): Boolean;
    function getObject(sId: String; sFiltro: String): Boolean;
    function getObjects: Boolean;
    function getField(sCampo: String; sColuna: String): String;
    destructor Destroy; override;
  end;

const
  TABLENAME = 'fin_tipo_contrato';

implementation

uses udm;

constructor TTipoContrato.Create;
begin
  inherited Create;
  conexao := TConexao.Create;
  centrocusto := TCentroCusto.Create;
end;

procedure TTipoContrato.SetDescricao(val: String);
begin
  FDescricao := val;
end;

procedure TTipoContrato.SetContrato(val: Integer);
begin
  FContrato := val;
end;

procedure TTipoContrato.SetCCusto(val: Integer);
begin
  FCCusto := val;
end;

function TTipoContrato.Validar: Boolean;
begin
  Result := False;
  if Self.Contrato = 0 then
  begin
    MessageDlg('Informe o código do Contrato!', mtWarning, [mbCancel], 0);
    Exit;
  end;
  if Self.Contrato = 0 then
  begin
    MessageDlg('Informe a Descrição Contrato!', mtWarning, [mbCancel], 0);
    Exit;
  end;
  if Self.CCusto > 0 then
  begin
    if (not centrocusto.getObject(IntToStr(Self.CCusto),'CODIGO')) then
    begin
      MessageDlg('Código de Centro de Custo não cadastrado!', mtWarning, [mbCancel], 0);
      Exit;
    end
    else
    begin
      dm.qryGetObject.Close;
      dm.qryGetObject.SQL.Clear;
    end;
  end;
  Result := True;
end;

function TTipoContrato.Insert: Boolean;
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
      SQL.Text := 'INSERT INTO ' + TABLENAME + ' ( ' +
                  'COD_TIPO_CONTRATO, ' +
                  'DES_TIPO_CONTRATO, ' +
                  'COD_CENTRO_CUSTO) ' +
                  'VALUES(' +
                  ':CODIGO, ' +
                  ':DESCRICAO, ' +
                  ':CUSTO)';
      ParamByName('CODIGO').AsInteger := Self.Contrato;
      ParamByName('DESCRICAO').AsString := Self.Descricao;
      ParamByName('CUSTO').AsDate := Self.CCusto;
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

function TTipoContrato.Update: Boolean;
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
                  'DES_TIPO_CONTRATO = :DESCRICAO, ' +
                  'COD_CENTRO_CUSTO = :CUSTO ' +
                  'WHERE COD_TIPO_CONTRATO - :CODIGO';
      ParamByName('CODIGO').AsInteger := Self.Contrato;
      ParamByName('DESCRICAO').AsString := Self.Descricao;
      ParamByName('CUSTO').AsDate := Self.CCusto;
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

function TTipoContrato.Delete(sFiltro: String): Boolean;
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
        SQL.Add('WHERE COD_TIPO_CONTRATO = :CODIGO');
        ParamByName('CODIGO').AsInteger := Self.Contrato;
      end
      else if sFiltro = 'CUSTP' then
      begin
        SQL.Add('WHERE COD_CENTRO_CUSTO = :CUSTO');
        ParamByName('CUSTO').AsInteger := Self.CCusto;
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

function TTipoContrato.getObject(sId: String; sFiltro: String): Boolean;
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
    with dm.qryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);
      if sFiltro = 'CODIGO' then
      begin
        SQL.Add('WHERE COD_TIPO_CONTRATO = :CODIGO');
        ParamByName('CODIGO').AsInteger := StrToInt(sId);
      end
      else if sFiltro = 'DESCRICAO' then
      begin
        SQL.Add('WHERE DES_TIPO_CONTRATO LIKE :DESCRICAO');
        ParamByName('DESCRICAO').AsString := QuotedStr('%' + sId + '%');
      end
      else if sFiltro = 'CUSTO' then
      begin
        SQL.Add('WHERE COD_CENTRO_CUSTO = :CUSTO');
        ParamByName('CUSTO').AsInteger := StrToInt(sId);
      end;
      dm.ZConn.PingServer;
      Open;
      if (not IsEmpty) then
      begin
        First;
         Self.Contrato := FieldByName('COD_TIPO_CONTRATO').AsInteger;
        Self.Descricao := FieldByName('DES_TIPO_CONTRATO').AsString;
        Self.CCusto := FieldByName('COD_CENTRO_CUSTO').AsInteger;
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

function TTipoContrato.getObjects: Boolean;
begin
  try
    Result := False;
    if (not conexao.VerifyConnZEOS(0)) then
    begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados!', mtError, [mbCancel], 0);
      Exit;
    end;
    with dm.qryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);
      dm.ZConn.PingServer;
      Open;
      if (not IsEmpty) then
      begin
        First;
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

function TTipoContrato.getField(sCampo: String; sColuna: String): String;
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
    if (not conexao.VerifyConnZEOS(0)) then
    begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados!', mtError, [mbCancel], 0);
      Exit;
    end;
    with dm.qryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);
      if sColuna = 'CODIGO' then
      begin
        SQL.Add('WHERE COD_TIPO_CONTRATO = :CODIGO');
        ParamByName('CODIGO').AsInteger := Self.Contrato;
      end
      else if sColuna = 'DESCRICAO' then
      begin
        SQL.Add('WHERE DES_TIPO_CONTRATO = :DESCRICAO');
        ParamByName('DESCRICAO').AsString := Self.Descricao;
      end
      else if sColuna = 'CUSTO' then
      begin
        SQL.Add('WHERE COD_CENTRO_CUSTO = :CUSTO');
        ParamByName('CUSTO').AsInteger := Self.CCusto;
      end;
      dm.ZConn.PingServer;
      Open;
      if (not IsEmpty) then
      begin
        First;
        Result := FieldByName(sCampo).AsString;
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

destructor TTipoContrato.Destroy;
begin
  conexao.Free;
  inherited Destroy;
end;

end.
