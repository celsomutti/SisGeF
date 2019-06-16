unit clRoteiroEntregador;

interface

uses
Vcl.Forms, System.SysUtils, System.Classes, Vcl.dialogs, clConexao, udm;

type
  TRoteiroEntregador = class(TObject)
  private
    FRoteiroAntigo: String;
    FRoteiroNovo: String;
    FLog: String;
    conexao: TConexao;
    FID: Integer;
    FDescricao: String;
    FMostrar: String;
    FEntregador: Integer;
    procedure SetRoteiroAntigo(val: String);
    procedure SetRoteiroNovo(val: String);
    procedure SetLog(val: String);
    procedure SetID(val: Integer);
    procedure SetDescricao(val: String);
    procedure SetMostrar(val: String);
    procedure SetEntregador(val: Integer);
  public
    property RoteiroAntigo: String read FRoteiroAntigo write SetRoteiroAntigo;
    property RoteiroNovo: String read FRoteiroNovo write SetRoteiroNovo;
    property Log: String read FLog write SetLog;
    property ID: Integer read FID write SetID;
    property Descricao: String read FDescricao write SetDescricao;
    property Mostrar: String read FMostrar write SetMostrar;
    property Entregador: Integer read FEntregador write SetEntregador;
    function Validar: Boolean; reintroduce;
    function Insert: Boolean;
    function Update: Boolean;
    function Delete(sFiltro: String): Boolean;
    function getObject(sId: String; sFiltro: String): Boolean;
    function getField(sCampo: String; sFiltro: String): String;
    function Exist: Boolean;
    function RetornaID(): Integer;
    constructor Create;
    destructor Destroy; override;

  end;

const
  TABLENAME = 'jor_roteiro_entregador';

implementation

procedure TRoteiroEntregador.SetRoteiroAntigo(val: String);
begin
  FRoteiroAntigo := val;
end;

procedure TRoteiroEntregador.SetRoteiroNovo(val: String);
begin
  FRoteiroNovo := val;
end;

procedure TRoteiroEntregador.SetLog(val: String);
begin
  FLog := val;
end;

procedure TRoteiroEntregador.SetID(val: Integer);
begin
  FID := val;
end;

procedure TRoteiroEntregador.SetDescricao(val: String);
begin
  FDescricao := val;
end;

procedure TRoteiroEntregador.SetMostrar(val: String);
begin
  FMostrar := val;
end;

procedure TRoteiroEntregador.SetEntregador(val: Integer);
begin
  FEntregador := val;
end;

function TRoteiroEntregador.Validar: Boolean;
begin
  Result := False;
  if Self.Descricao.IsEmpty then
  begin
    MessageDlg('Informe a descrição do Roteiro!', mtWarning, [mbOK], 0);
    Exit;
  end;
  if Self.RoteiroAntigo.IsEmpty then
  begin
    MessageDlg('Informe o código do roteiro antigo!', mtWarning, [mbOK], 0);
    Exit;
  end;
  if Self.RoteiroNovo.IsEmpty then
  begin
    MessageDlg('Informe o código do roteiro novo!', mtWarning, [mbOK], 0);
    Exit;
  end;
  Result := True;
end;

function TRoteiroEntregador.Insert: Boolean;
begin
  Result := False;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados (' + Self.ClassName + ') !', mtError, [mbCancel], 0);
    Exit;
  end;
  dm.qryCRUD.Close;
  dm.qryCRUD.SQL.Clear;
  dm.qryCRUD.SQL.Text := 'INSERT INTO ' + TABLENAME + '(' +
                         'DES_ROTEIRO, ' +
                         'COD_CADASTRO, ' +
                         'COD_ROTEIRO_ANTIGO, ' +
                         'COD_ROTEIRO_NOVO, ' +
                         'DOM_MOSTRAR, ' +
                         'DES_LOG) ' +
                         'VALUES (' +
                         ':DESCRICAO, ' +
                         ':ENTREGADOR, ' +
                         ':ROTEIROANTIGO, ' +
                         ':ROTEIRONOVO, ' +
                         ':MOSTRAR, ' +
                         ':LOG);';
  dm.qryCRUD.ParamByName('DESCRICAO').AsString := Self.Descricao;
  dm.qryCRUD.ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
  dm.qryCRUD.ParamByName('ROTEIROANTIGO').AsString := Self.RoteiroAntigo;
  dm.qryCRUD.ParamByName('ROTEIRONOVO').AsString := Self.RoteiroNovo;
  dm.qryCRUD.ParamByName('MOSTRAR').AsString := Self.Mostrar;
  dm.qryCRUD.ParamByName('LOG').AsString := Self.Log;
  dm.ZConn.PingServer;
  dm.qryCRUD.ExecSQL;
  dm.qryCRUD.Close;
  dm.qryCRUD.SQL.Clear;
  Result := True;
end;

function TRoteiroEntregador.Update: Boolean;
begin
  Result := False;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados (' + Self.ClassName + ') !', mtError, [mbCancel], 0);
    Exit;
  end;
  dm.qryCRUD.Close;
  dm.qryCRUD.SQL.Clear;
  dm.qryCRUD.SQL.Text := 'UPDATE ' + TABLENAME + ' SET ' +
                         'DES_ROTEIRO = :DESCRICAO, ' +
                         'COD_CADASTRO = :ENTREGADOR, ' +
                         'COD_ROTEIRO_ANTIGO = :ROTEIROANTIGO, ' +
                         'COD_ROTEIRO_NOVO = :ROTEIRONOVO, ' +
                         'DOM_MOSTRAR = :MOSTRAR, ' +
                         'DES_LOG = :LOG ' +
                         'WHERE ' +
                         'ID_ROTEIRO = :ID;';
  dm.qryCRUD.ParamByName('ID').AsInteger := Self.ID;
  dm.qryCRUD.ParamByName('DESCRICAO').AsString := Self.Descricao;
  dm.qryCRUD.ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
  dm.qryCRUD.ParamByName('ROTEIROANTIGO').AsString := Self.RoteiroAntigo;
  dm.qryCRUD.ParamByName('ROTEIRONOVO').AsString := Self.RoteiroNovo;
  dm.qryCRUD.ParamByName('MOSTRAR').AsString := Self.Mostrar;
  dm.qryCRUD.ParamByName('LOG').AsString := Self.Log;
  dm.ZConn.PingServer;
  dm.qryCRUD.ExecSQL;
  dm.qryCRUD.Close;
  dm.qryCRUD.SQL.Clear;
  Result := True;
end;

function TRoteiroEntregador.Delete(sFiltro: String): Boolean;
begin
  Result := False;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados (' + Self.ClassName + ') !', mtError, [mbCancel], 0);
    Exit;
  end;
  dm.qryCRUD.Close;
  dm.qryCRUD.SQL.Clear;
  dm.qryCRUD.SQL.Add('DELETE FROM ' + TABLENAME);
  if sFiltro = 'ID' then
  begin
    dm.qryCRUD.SQL.Add('WHERE ID_ROTEIRO = :ID');
    dm.qryCRUD.ParamByName('ID').AsInteger := Self.ID;
  end
  else if sFiltro = 'ANTIGO' then
  begin
    dm.qryCRUD.SQL.Add('WHERE COD_ROTEIRO_ANTIGO = :ROTEIROANTIGO');
    dm.qryCRUD.ParamByName('ROTEIROANTIGO').AsString := Self.RoteiroAntigo;
  end
  else if sFiltro = 'NOVO' then
  begin
    dm.qryCRUD.SQL.Add('WHERE COD_ROTEIRO_NOVO = :ROTEIRONOVO');
    dm.qryCRUD.ParamByName('ROTEIRONOVO').AsString := Self.RoteiroNovo;
  end;
  dm.ZConn.PingServer;
  dm.qryCRUD.ExecSQL;
  dm.qryCRUD.Close;
  dm.qryCRUD.SQL.Clear;
  Result := True;
end;

function TRoteiroEntregador.getObject(sId: String; sFiltro: String): Boolean;
begin
  Result := False;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados (' + Self.ClassName + ') !', mtError, [mbCancel], 0);
    Exit;
  end;
  dm.qryGetObject.Close;
  dm.qryGetObject.SQL.Clear;
  dm.qryGetObject.SQL.Add('SELECT * FROM ' + TABLENAME);
  if sFiltro = 'ID' then
  begin
    dm.qryGetObject.SQL.Add('WHERE ID_ROTEIRO = :ID');
    dm.qryGetObject.ParamByName('ID').AsInteger := StrToIntDef(sId, 0);
  end
  else if sFiltro = 'DESCRICAO' then
  begin
    dm.qryGetObject.SQL.Add('WHERE DES_ROTEIRO LIKE :DESCRICAO');
    dm.qryGetObject.ParamByName('DESCRICAO').AsString := '%' + sId + '%';
  end
  else if sFiltro = 'ANTIGO' then
  begin
    dm.qryGetObject.SQL.Add('WHERE COD_ROTEIRO_ANTIGO = :ROTEIROANTIGO');
    dm.qryGetObject.ParamByName('ROTEIROANTIGO').AsString := sId;
  end
  else if sFiltro = 'NOVO' then
  begin
    dm.qryGetObject.SQL.Add('WHERE COD_ROTEIRO_NOVO = :ROTEIRONOVO');
    dm.qryGetObject.ParamByName('ROTEIRONOVO').AsString := sId;
  end
  else if sFiltro = 'MOSTRAR' then
  begin
    dm.qryGetObject.SQL.Add('WHERE DOM_MOSTRAR = :MOSTRAR');
    dm.qryGetObject.ParamByName('MOSTRAR').AsString := sId;
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
    Self.ID := dm.qryGetObject.FieldByName('ID_ROTEIRO').AsInteger;
    Self.Descricao := dm.qryGetObject.FieldByName('DES_ROTEIRO').AsString;
    Self.Entregador := dm.qryGetObject.FieldByName('COD_CADASTRO').AsInteger;
    Self.RoteiroAntigo := dm.qryGetObject.FieldByName('COD_ROTEIRO_ANTIGO').AsString;
    Self.RoteiroNovo := dm.qryGetObject.FieldByName('COD_ROTEIRO_NOVO').AsString;
    Self.Mostrar := dm.qryGetObject.FieldByName('DOM_MOSTRAR').AsString;
    Self.Log := dm.qryGetObject.FieldByName('DES_LOG').AsString;
  end;
  Result := True;
end;

function TRoteiroEntregador.getField(sCampo: String; sFiltro: String): String;
begin
  Result := '';
  //if (not conexao.VerifyConnZEOS(0)) then
  //begin
  //  MessageDlg('Erro ao estabelecer conexão ao banco de dados (' + Self.ClassName + ') !', mtError, [mbCancel], 0);
  //  Exit;
  //end;
  dm.qryFields.Close;
  dm.qryFields.SQL.Clear;
  dm.qryFields.SQL.Add('SELECT ' + sCampo + ' FROM ' + TABLENAME);
  if sFiltro = 'ID' then
  begin
    dm.qryFields.SQL.Add('WHERE ID_ROTEIRO = :ID');
    dm.qryFields.ParamByName('ID').AsInteger := Self.ID;
  end
  else if sFiltro = 'ANTIGO' then
  begin
    dm.qryFields.SQL.Add('WHERE COD_ROTEIRO_ANTIGO = :ROTEIROANTIGO');
    dm.qryFields.ParamByName('ROTEIROANTIGO').AsString := Self.RoteiroAntigo;
  end
  else if sFiltro = 'NOVO' then
  begin
    dm.qryFields.SQL.Add('WHERE COD_ROTEIRO_NOVO = :ROTEIRONOVO');
    dm.qryFields.ParamByName('ROTEIRONOVO').AsString := Self.RoteiroNovo;
  end
  else if sFiltro = 'CHAVE' then
  begin
    dm.qryFields.SQL.Add('WHERE COD_ROTEIRO_ANTIGO = :ROTEIROANTIGO AND COD_ROTEIRO_NOVO = :ROTEIRONOVO');
    dm.qryFields.ParamByName('ROTEIROANTIGO').AsString := Self.RoteiroAntigo;
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

function TRoteiroEntregador.Exist: Boolean;
begin
  Result := False;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados (' + Self.ClassName + ') !', mtError, [mbCancel], 0);
    Exit;
  end;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  dm.qryPesquisa.SQL.Add('SELECT * FROM ' + TABLENAME);
  dm.qryPesquisa.SQL.Add('WHERE COD_ROTEIRO_ANTIGO = :ROTEIROANTIGO AND COD_ROTEIRO_NOVO = :ROTEIRONOVO');
  dm.qryPesquisa.ParamByName('ROTEIROANTIGO').AsString := Self.RoteiroAntigo;
  dm.qryPesquisa.ParamByName('ROTEIRONOVO').AsString := Self.RoteiroNovo;
  dm.ZConn.PingServer;
  dm.qryPesquisa.Open;
  if dm.qryPesquisa.IsEmpty then
  begin
    dm.qryPesquisa.Close;
    dm.qryPesquisa.SQL.Clear;
    Exit;
  end
  else
  begin
    dm.qryPesquisa.Close;
    dm.qryPesquisa.SQL.Clear;
  end;
  Result := True;
end;

constructor TRoteiroEntregador.Create;
begin
  inherited Create;
  conexao := TConexao.Create;
end;

destructor TRoteiroEntregador.Destroy;
begin
  conexao.Free;
  inherited Destroy;
end;

function TRoteiroEntregador.RetornaID(): Integer;
begin
  Result := 0;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados (' + Self.ClassName + ') !', mtError, [mbCancel], 0);
    Exit;
  end;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  dm.qryPesquisa.SQL.Add('SELECT MAX(ID_ROTEIRO) AS ID FROM ' + TABLENAME);
  dm.ZConn.PingServer;
  dm.qryPesquisa.Open;
  if dm.qryPesquisa.IsEmpty then
  begin
    dm.qryPesquisa.Close;
    dm.qryPesquisa.SQL.Clear;
    Exit;
  end
  else
  begin
    Result := dm.qryPesquisa.FieldByName('ID').AsInteger;
    dm.qryPesquisa.Close;
    dm.qryPesquisa.SQL.Clear;
  end;
end;

end.
