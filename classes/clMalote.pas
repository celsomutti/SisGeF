unit clMalote;

interface

uses clConexao;

type
  TMalote = Class(TObject)

  private
    function getData: TDateTime;
    function getDestino: String;
    function getDocumento: String;
    function getExpedidor: String;
    function getOrigem: String;
    function getOs: Integer;
    function getRecebedor: String;
    function getRoteiro: Integer;
    procedure setData(const Value: TDateTime);
    procedure setDestino(const Value: String);
    procedure setDocumento(const Value: String);
    procedure setExpedidor(const Value: String);
    procedure setOrigem(const Value: String);
    procedure setOs(const Value: Integer);
    procedure setRecebedor(const Value: String);
    procedure setRoteiro(const Value: Integer);
    function getLacre: Integer;
    procedure setLacre(const Value: Integer);
    constructor Create;
    destructor Destroy;
  protected
    _os: Integer;
    _roteiro: Integer;
    _data: TDateTime;
    _origem: String;
    _expedidor: String;
    _destino: String;
    _recebedor: String;
    _documento: String;
    _lacre: Integer;
    _conexao: TConexao;
  public
    property Os: Integer read getOs write setOs;
    property Roteiro: Integer read getRoteiro write setRoteiro;
    property Data: TDateTime read getData write setData;
    property Origem: String read getOrigem write setOrigem;
    property Expedidor: String read getExpedidor write setExpedidor;
    property Destino: String read getDestino write setDestino;
    property Recebedor: String read getRecebedor write setRecebedor;
    property Documento: String read getDocumento write setDocumento;
    property Lacre: Integer read getLacre write setLacre;

    function Validar(): Boolean;
    function Delete(filtro: String): Boolean;
    function getObject(id, filtro: String): Boolean;
    function getObjects(): Boolean;
    function Insert(): Boolean;
    function Update(): Boolean;
    function getField(campo, coluna: String): String;

    procedure MaxOS;
    procedure MaxRoteiro;

  end;

const
  TABLENAME = 'tbcontrolemalotes';

implementation

uses SysUtils, Dialogs, udm, clUtil, ZDataset, ZAbstractRODataset, DB;

{ TMalote }

constructor TMalote.Create;
begin
  _conexao := TConexao.Create;
  if (not _conexao.VerifyConnZEOS(0)) then
  begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
      Self.ClassName + ') !', mtError, [mbCancel], 0);
  end;
end;

destructor TMalote.Destroy;
begin
  _conexao.Free;
end;

function TMalote.getData: TDateTime;
begin
  Result := _data;
end;

function TMalote.getDestino: String;
begin
  Result := _destino;
end;

function TMalote.getDocumento: String;
begin
  Result := _documento;
end;

function TMalote.getExpedidor: String;
begin
  Result := _expedidor;
end;

function TMalote.getOrigem: String;
begin
  Result := _origem;
end;

function TMalote.getOs: Integer;
begin
  Result := _os;
end;

function TMalote.getRecebedor: String;
begin
  Result := _recebedor;
end;

function TMalote.getRoteiro: Integer;
begin
  Result := _roteiro;
end;

function TMalote.getLacre: Integer;
begin
  Result := _lacre;
end;

function TMalote.Validar(): Boolean;
begin
  Result := False;
  if TUtil.Empty(DateToStr(Self.Data)) then
  begin
    MessageDlg('Informe a data da OS.', mtWarning, [mbOK], 0);
    Exit;
  end;
  if TUtil.Empty(Self.Origem) then
  begin
    MessageDlg('Informe a Origem.', mtWarning, [mbOK], 0);
    Exit;
  end;
  if TUtil.Empty(Self.Expedidor) then
  begin
    MessageDlg('Informe o Expedidor.', mtWarning, [mbOK], 0);
    Exit;
  end;
  if TUtil.Empty(Self.Destino) then
  begin
    MessageDlg('Informe o Destino.', mtWarning, [mbOK], 0);
    Exit;
  end;
  if TUtil.Empty(Self.Recebedor) then
  begin
    MessageDlg('Informe o Recebedor.', mtWarning, [mbOK], 0);
    Exit;
  end;
  Result := True;
end;

function TMalote.Delete(filtro: String): Boolean;
begin
  try
    Result := False;
    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Add('DELETE FROM ' + TABLENAME);
      if filtro = 'OS' then
      begin
        SQL.Add('WHERE NUM_OS = :OS');
        ParamByName('OS').AsInteger := Self.Os;
      end
      else if filtro = 'LACRE' then
      begin
        SQL.Add('WHERE NUM_LACRE = :LACRE');
        ParamByName('LACRE').AsInteger := Self.Lacre;
      end
      else if filtro = 'DATA' then
      begin
        SQL.Add('WHERE DAT_OS = :DATA');
        ParamByName('DATA').AsDate := Self.Data;
      end
      else if filtro = 'ROTEIRO' then
      begin
        SQL.Add('WHERE NUM_ROTEIRO = :ROTEIRO');
        SQL.Add('AND NUM_OS = :OS');
        ParamByName('ROTEIRO').AsInteger := Self.Roteiro;
        ParamByName('OS').AsInteger := Self.Os;
      end;
      dm.ZConn.PingServer;
      ExecSQL;
    end;
    dm.QryCRUD.Close;
    dm.QryCRUD.SQL.Clear;
    Result := True;
  except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TMalote.getObjects(): Boolean;
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
      if not IsEmpty then
        First;
    end;

    if dm.QryGetObject.RecordCount > 0 then
    begin
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

function TMalote.getObject(id, filtro: String): Boolean;
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

      if filtro = 'OS' then
      begin
        SQL.Add('WHERE NUM_OS = :OS');
        ParamByName('OS').AsInteger := StrToInt(id);
      end
      else if filtro = 'LACRE' then
      begin
        SQL.Add('WHERE NUM_LACRE = :LACRE');
        ParamByName('LACRE').AsInteger := StrToInt(id);
      end
      else if filtro = 'DATA' then
      begin
        SQL.Add('WHERE DAT_OS = :DATA');
        ParamByName('DATA').AsDate := StrToDate(id);
      end
      else if filtro = 'ROTEIRO' then
      begin
        SQL.Add('WHERE NUM_ROTEIRO = :ROTEIRO');
        SQL.Add('AND NUM_OS = :OS');
        ParamByName('ROTEIRO').AsInteger := StrToInt(id);
        ParamByName('OS').AsInteger := Self.Os;
      end;
      dm.ZConn.PingServer;
      Open;
      if not IsEmpty then
        First;
    end;

    if dm.QryGetObject.RecordCount > 0 then
    begin
      Self.Os := dm.QryGetObject.FieldByName('NUM_OS').AsInteger;
      Self.Roteiro := dm.QryGetObject.FieldByName('NUM_ROTEIRO').AsInteger;
      Self.Data := dm.QryGetObject.FieldByName('DAT_OS').AsDateTime;
      Self.Origem := dm.QryGetObject.FieldByName('DES_ORIGEM').AsString;
      Self.Expedidor := dm.QryGetObject.FieldByName('NOM_EXPEDIDOR').AsString;
      Self.Destino := dm.QryGetObject.FieldByName('DES_DESTINO').AsString;
      Self.Recebedor := dm.QryGetObject.FieldByName('NOM_RECEBEDOR').AsString;
      Self.Documento := dm.QryGetObject.FieldByName('DES_DOCUMENTO').AsString;
      Self.Lacre := dm.QryGetObject.FieldByName('NUM_LACRE').AsInteger;
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

function TMalote.Insert(): Boolean;
begin
  try
    Result := False;

    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'INSERT INTO ' + TABLENAME + '(' + 'NUM_OS, ' +
        'NUM_ROTEIRO, ' + 'DAT_OS, ' + 'DES_ORIGEM, ' + 'NOM_EXPEDIDOR, ' +
        'DES_DESTINO, ' + 'NOM_RECEBEDOR, ' + 'DES_DOCUMENTO, ' + 'NUM_LACRE) '
        + 'VALUES (' + ':OS, ' + ':ROTEIRO, ' + ':DATA, ' + ':ORIGEM, ' +
        ':EXPEDIDOR, ' + ':DESTINO, ' + ':RECEBEDOR, ' + ':DOCUMENTO, ' +
        ':LACRE)';

      ParamByName('OS').AsInteger := Self.Os;
      ParamByName('ROTEIRO').AsInteger := Self.Roteiro;
      ParamByName('DATA').AsDate := Self.Data;
      ParamByName('ORIGEM').AsString := Self.Origem;
      ParamByName('EXPEDIDOR').AsString := Self.Expedidor;
      ParamByName('DESTINO').AsString := Self.Destino;
      ParamByName('RECEBEDOR').AsString := Self.Recebedor;
      ParamByName('DOCUMENTO').AsString := Self.Documento;
      ParamByName('LACRE').AsInteger := Self.Lacre;
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

function TMalote.Update(): Boolean;
begin
  try
    Result := False;

    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'UPDATE ' + TABLENAME + ' SET ' + 'DAT_OS = :DATA, ' +
        'DES_ORIGEM = :ORIGEM, ' + 'NOM_EXPEDIDOR = :EXPEDIDOR, ' +
        'DES_DESTINO = :DESTINO, ' + 'NOM_RECEBEDOR = :RECEBEDOR, ' +
        'DES_DOCUMENTO = :DOCUMENTO, ' + 'NUM_LACRE = :LACRE ' + 'WHERE ' +
        'NUM_OS = :OS AND NUM_ROTEIRO = :ROTEIRO';

      ParamByName('OS').AsInteger := Self.Os;
      ParamByName('ROTEIRO').AsInteger := Self.Roteiro;
      ParamByName('DATA').AsDate := Self.Data;
      ParamByName('ORIGEM').AsString := Self.Origem;
      ParamByName('EXPEDIDOR').AsString := Self.Expedidor;
      ParamByName('DESTINO').AsString := Self.Destino;
      ParamByName('RECEBEDOR').AsString := Self.Recebedor;
      ParamByName('DOCUMENTO').AsString := Self.Documento;
      ParamByName('LACRE').AsInteger := Self.Lacre;
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

function TMalote.getField(campo, coluna: String): String;
begin
  try
    Result := '';

    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT ' + campo + ' FROM ' + TABLENAME;

      if coluna = 'OS' then
      begin
        SQL.Add('WHERE NUM_OS = :OS');
        ParamByName('OS').AsInteger := Self.Os;
      end
      else if coluna = 'LACRE' then
      begin
        SQL.Add('WHERE NUM_LACRE = :LACRE');
        ParamByName('LACRE').AsInteger := Self.Lacre;
      end
      else if coluna = 'DATA' then
      begin
        SQL.Add('WHERE DAT_OS = :DATA');
        ParamByName('DATA').AsDate := Self.Data;
      end
      else if coluna = 'ROTEIRO' then
      begin
        SQL.Add('WHERE NUM_ROTEIRO = :ROTEIRO');
        SQL.Add('AND NUM_OS = :OS');
        ParamByName('ROTEIRO').AsInteger := Self.Roteiro;
        ParamByName('OS').AsInteger := Self.Os;
      end;
      dm.ZConn.PingServer;
      Open;
      if not IsEmpty then
        First;
    end;

    if dm.QryGetObject.RecordCount > 0 then
      Result := dm.QryGetObject.FieldByName(campo).AsString;

    dm.QryGetObject.Close;
    dm.QryGetObject.SQL.Clear;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

procedure TMalote.MaxOS;
begin
  try
    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT MAX(NUM_OS) AS OS FROM ' + TABLENAME;
      dm.ZConn.PingServer;
      Open;
      if not(IsEmpty) then
        First;
    end;

    Self.Os := (dm.QryGetObject.FieldByName('OS').AsInteger) + 1;

    dm.QryGetObject.Close;
    dm.QryGetObject.SQL.Clear;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

procedure TMalote.MaxRoteiro;
begin
  try
    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT MAX(NUM_ROTEIRO) AS ROTEIRO FROM ' + TABLENAME +
        ' WHERE NUM_OS = :OS';
      ParamByName('OS').AsInteger := Self.Os;
      dm.ZConn.PingServer;
      Open;
      if not(IsEmpty) then
        First;
    end;
    Self.Roteiro := (dm.QryGetObject.FieldByName('ROTEIRO').AsInteger) + 1;

    dm.QryGetObject.Close;
    dm.QryGetObject.SQL.Clear;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

procedure TMalote.setData(const Value: TDateTime);
begin
  _data := Value;
end;

procedure TMalote.setDestino(const Value: String);
begin
  _destino := Value;
end;

procedure TMalote.setDocumento(const Value: String);
begin
  _documento := Value;
end;

procedure TMalote.setExpedidor(const Value: String);
begin
  _expedidor := Value;
end;

procedure TMalote.setOrigem(const Value: String);
begin
  _origem := Value;
end;

procedure TMalote.setOs(const Value: Integer);
begin
  _os := Value;
end;

procedure TMalote.setRecebedor(const Value: String);
begin
  _recebedor := Value;
end;

procedure TMalote.setRoteiro(const Value: Integer);
begin
  _roteiro := Value;
end;

procedure TMalote.setLacre(const Value: Integer);
begin
  _lacre := Value;
end;

end.
