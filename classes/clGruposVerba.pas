unit clGruposVerba;

interface

uses clConexao;

type
  TGruposVerba = Class(TObject)

  private
    function getGrupo: Integer;
    function getPercentual: Double;
    function getVerba: Double;
    procedure setGrupo(const Value: Integer);
    procedure setPercentual(const Value: Double);
    procedure setVerba(const Value: Double);
    function getOperacao: String;
    procedure setOperacao(const Value: String);

    constructor Create;
    destructor Destroy;

  protected
    _grupo: Integer;
    _percentual: Double;
    _verba: Double;
    _operacao: String;
    _conexao: TConexao;
  public
    property Grupo: Integer read getGrupo write setGrupo;
    property Percentual: Double read getPercentual write setPercentual;
    property Verba: Double read getVerba write setVerba;
    Property Operacao: String read getOperacao write setOperacao;

    function Validar(): Boolean;
    function Delete(filtro: String): Boolean;
    function getObject(id, filtro: String): Boolean;
    function getObjects(): Boolean;
    function getField(campo, coluna: String): String;
    function Insert(): Boolean;
    function Update(): Boolean;
    function Exists(id: Integer; valor: Double): Boolean;
    function MaxGrupo(): Integer;
    function MinPercentualGrupo(sGrupo: String): Double;
    function MaxPercentualGrupo(sGrupo: String): Double;
    function RetornaVerba(sGrupo: String; dPercentual: Double): Boolean;
    function PercentualCorreto(dPercentual: Double): Double;
  end;

const
  TABLENAME = 'tbgruposverba';

implementation

{ TGruposVerba }

uses SysUtils, Dialogs, udm, clUtil, ZDataset, ZAbstractRODataset, DB;

constructor TGruposVerba.Create;
begin
  _conexao := TConexao.Create;
  if (not _conexao.VerifyConnZEOS(0)) then
  begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
      Self.ClassName + ') !', mtError, [mbCancel], 0);
  end;
end;

destructor TGruposVerba.Destroy;
begin
  _conexao.Free;
end;

function TGruposVerba.Validar(): Boolean;
begin
  Result := False;
  if Self.Grupo = 0 then
  begin
    MessageDlg('Informe Código do Grupo!', mtWarning, [mbOK], 0);
    Exit;
  end;
  if Self.Percentual = 0 then
  begin
    MessageDlg('Informe o Percentual e Entregas!', mtWarning, [mbOK], 0);
    Exit;
  end;
  if Self.Verba = 0 then
  begin
    MessageDlg('Informe o Valor da Verba!', mtWarning, [mbOK], 0);
    Exit;
  end;
  if Self.Operacao = 'I' then
  begin
    if Self.Exists(Self.Grupo, Self.Percentual) then
    begin
      MessageDlg('Percentual já cadastrado para esse Grupo!', mtWarning,
        [mbOK], 0);
      Exit;
    end;
  end;
  Result := True;
end;

function TGruposVerba.Delete(filtro: String): Boolean;
begin
  try
    Result := False;

    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Add('DELETE FROM ' + TABLENAME);
      if filtro = 'GRUPO' then
      begin
        SQL.Add('WHERE COD_GRUPO = :GRUPO');
        ParamByName('GRUPO').AsInteger := Self.Grupo;
      end
      else if filtro = 'PERCENTUAL' then
      begin
        SQL.Add('WHERE COD_GRUPO = :GRUPO AND VAL_PERCENTUAL = :PERCENTUAL');
        ParamByName('GRUPO').AsInteger := Self.Grupo;
        ParamByName('PERCENTUAL').AsFloat := Self.Percentual;
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

function TGruposVerba.getObject(id, filtro: String): Boolean;
begin
  try
    Result := False;
    if TUtil.Empty(id) then
      Exit;
    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);

      if filtro = 'GRUPO' then
      begin
        SQL.Add('WHERE COD_GRUPO = :GRUPO');
        ParamByName('GRUPO').AsInteger := StrToInt(id);
      end
      else if filtro = 'PERCENTUAL' then
      begin
        SQL.Add('WHERE COD_GRUPO = :GRUPO AND VAL_PERCENTUAL = :PERCENTUAL');
        ParamByName('GRUPO').AsInteger := StrToInt(id);
        ParamByName('PERCENTUAL').AsFloat := Self.Percentual;
      end;
      dm.ZConn.PingServer;
      Open;
      if not IsEmpty then
      begin
        First;
      end;
    end;

    if dm.QryGetObject.RecordCount > 0 then
    begin
      Self.Grupo := dm.QryGetObject.FieldByName('COD_GRUPO').AsInteger;
      Self.Percentual := dm.QryGetObject.FieldByName('VAL_PERCENTUAL').AsFloat;
      Self.Verba := dm.QryGetObject.FieldByName('VAL_VERBA').AsFloat;
      Result := True;
    end
    else
    begin
      dm.QryGetObject.Close;
      dm.QryGetObject.SQL.Clear;
    end;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TGruposVerba.getObjects(): Boolean;
begin
  try

    Result := False;
    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);
      dm.ZConn.PingServer;
      Open;
      if not(IsEmpty) then
      begin
        Result := True;
        First;
      end;
    end;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TGruposVerba.getOperacao: String;
begin
  Result := _operacao;
end;

function TGruposVerba.getPercentual: Double;
begin
  Result := _percentual
end;

function TGruposVerba.getVerba: Double;
begin
  Result := _verba;
end;

function TGruposVerba.getField(campo, coluna: String): String;
begin
  Try
    Result := '';

    with dm.qryFields do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT ' + campo + ' FROM ' + TABLENAME;

      if coluna = 'GRUPO' then
      begin
        SQL.Add('WHERE COD_GRUPO = :GRUPO');
        ParamByName('GRUPO').AsInteger := Self.Grupo;
      end
      else if coluna = 'PERCENTUAL' then
      begin
        SQL.Add('WHERE COD_GRUPO = :GRUPO AND VAL_PERCENTUAL = :PERCENTUAL');
        ParamByName('GRUPO').AsInteger := Self.Grupo;
        ParamByName('PERCENTUAL').AsFloat := Self.Percentual;
      end;
      dm.ZConn.PingServer;
      Open;
      if not IsEmpty then
        First;
    end;

    if dm.qryFields.RecordCount > 0 then
    begin
      Result := dm.qryFields.FieldByName(campo).AsString;
    end;

    dm.qryFields.Close;
    dm.qryFields.SQL.Clear;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TGruposVerba.getGrupo: Integer;
begin
  Result := _grupo;
end;

function TGruposVerba.Insert(): Boolean;
begin
  Try

    Result := False;

    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'INSERT INTO ' + TABLENAME + '(' + 'COD_GRUPO, ' +
        'VAL_PERCENTUAL, ' + 'VAL_VERBA) ' + 'VALUES (' + ':GRUPO, ' +
        ':PERCENTUAL, ' + ':VERBA)';

      ParamByName('GRUPO').AsInteger := Self.Grupo;
      ParamByName('PERCENTUAL').AsFloat := Self.Percentual;
      ParamByName('VERBA').AsFloat := Self.Verba;
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

function TGruposVerba.Update(): Boolean;
begin
  Try

    Result := False;

    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'UPDATE ' + TABLENAME + ' SET ' + 'VAL_VERBA        = :VERBA '
        + 'WHERE ' + 'COD_GRUPO = :GRUPO AND VAL_PERCENTUAL = :PERCENTUAL';
      ParamByName('GRUPO').AsInteger := Self.Grupo;
      ParamByName('PERCENTUAL').AsFloat := Self.Percentual;
      ParamByName('VERBA').AsFloat := Self.Verba;
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

function TGruposVerba.Exists(id: Integer; valor: Double): Boolean;
begin
  try
    Result := False;
    if id = 0 then
    begin
      Exit;
    end;
    with dm.qryGeral do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);
      SQL.Add('WHERE COD_GRUPO = :GRUPO AND VAL_PERCENTUAL = :PERCENTUAL');
      ParamByName('GRUPO').AsInteger := id;
      ParamByName('PERCENTUAL').AsFloat := valor;
      dm.ZConn.PingServer;
      Open;
      if not IsEmpty then
      begin
        First;
      end;
    end;

    if dm.qryGeral.RecordCount > 0 then
    begin
      Result := True;
    end;
    dm.qryGeral.Close;
    dm.qryGeral.SQL.Clear;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TGruposVerba.MaxGrupo(): Integer;
begin
  Try
    Result := 0;
    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT MAX(COD_GRUPO) AS CODIGO FROM ' + TABLENAME;
      dm.ZConn.PingServer;
      Open;
      if not(IsEmpty) then
        First;
    end;

    Result := (dm.QryGetObject.FieldByName('CODIGO').AsInteger) + 1;

    dm.QryGetObject.Close;
    dm.QryGetObject.SQL.Clear;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TGruposVerba.MinPercentualGrupo(sGrupo: string): Double;
begin
  Try
    Result := 0;
    with dm.qryPesquisa do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT MIN(VAL_PERCENTUAL) AS MINIMO FROM ' + TABLENAME +
        ' WHERE COD_GRUPO = :GRUPO';
      ParamByName('GRUPO').AsInteger := StrToInt(sGrupo);
      dm.ZConn.PingServer;
      Open;
      if not(IsEmpty) then
        First;
    end;
    Result := (dm.qryPesquisa.FieldByName('MINIMO').AsFloat);
    dm.qryPesquisa.Close;
    dm.qryPesquisa.SQL.Clear;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TGruposVerba.MaxPercentualGrupo(sGrupo: string): Double;
begin
  Try
    Result := 0;
    with dm.qryPesquisa do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT MAX(VAL_PERCENTUAL) AS MAXIMO FROM ' + TABLENAME +
        ' WHERE COD_GRUPO = :GRUPO';
      ParamByName('GRUPO').AsInteger := StrToInt(sGrupo);
      dm.ZConn.PingServer;
      Open;
      if not(IsEmpty) then
        First;
    end;
    Result := (dm.qryPesquisa.FieldByName('MAXIMO').AsFloat);
    dm.qryPesquisa.Close;
    dm.qryPesquisa.SQL.Clear;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TGruposVerba.RetornaVerba(sGrupo: String; dPercentual: Double): Boolean;
var
  dMin, dMax: Double;
begin
  try
    Result := False;
    dMin := MinPercentualGrupo(sGrupo);
    dMax := MaxPercentualGrupo(sGrupo);
    if dPercentual > dMax then
    begin
      dPercentual := dMax;
    end;
    if dPercentual < dMin then
    begin
      dPercentual := dMin;
    end;
    with dm.qryPesquisa do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT * FROM ' + TABLENAME +
                  ' WHERE COD_GRUPO = :GRUPO AND VAL_PERCENTUAL <= :PERCENTUAL ORDER BY COD_GRUPO, VAL_PERCENTUAL';
      ParamByName('GRUPO').AsInteger := StrToInt(sGrupo);
      ParamByName('PERCENTUAL').AsFloat := Trunc(dPercentual);
      dm.ZConn.PingServer;
      Open;
      if not(IsEmpty) then
      begin
        Last;
        Self.Grupo := FieldByName('COD_GRUPO').AsInteger;
        Self.Percentual := FieldByName('VAL_PERCENTUAL').AsFloat;
        Self.Verba := FieldByName('VAL_VERBA').AsFloat;
        Result := True;
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

procedure TGruposVerba.setGrupo(const Value: Integer);
begin
  _grupo := Value;
end;

procedure TGruposVerba.setOperacao(const Value: String);
begin
  _operacao := Value;
end;

procedure TGruposVerba.setPercentual(const Value: Double);
begin
  _percentual := Value;
end;

procedure TGruposVerba.setVerba(const Value: Double);
begin
  _verba := Value;
end;

function TGruposVerba.PercentualCorreto(dPercentual: Double): Double;
var
  dMin, dMax: Double;
  sGrupo: String;
begin
  Result := dPercentual;
  sGrupo := FloatToStr(dPercentual);
  dMin := MinPercentualGrupo(sGrupo);
  dMax := MaxPercentualGrupo(sGrupo);
  if dPercentual > dMax then
  begin
    dPercentual := dMax;
  end;
  if dPercentual < dMin then
  begin
    dPercentual := dMin;
  end;
  Result := dPercentual;
end;

end.
