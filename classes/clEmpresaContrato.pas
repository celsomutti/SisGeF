unit clEmpresaContrato;

interface

uses clConexao, Vcl.Dialogs, System.SysUtils, clTipoContrato;

type
  TEmpresaContrato = class(TObject)
  protected
    FContrato: Integer;
    FInicio: TDateTime;
    FEmpresa: Integer;
    FTermino: TDateTime;
    conexao: TConexao;
    tipocontrato: TTipoContrato;
  private
    procedure SetEmpresa(val: Integer);
    procedure SetContrato(val: Integer);
    procedure SetInicio(val: TDateTime);
    procedure SetTermino(val: TDateTime);
  public
    constructor Create;
    property Empresa: Integer read FEmpresa write SetEmpresa;
    property Contrato: Integer read FContrato write SetContrato;
    property Inicio: TDateTime read FInicio write SetInicio;
    property Termino: TDateTime read FTermino write SetTermino;
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
  TABLENAME = 'cad_empresa_contato';

implementation

uses udm;

constructor TEmpresaContrato.Create;
begin
  inherited Create;
  conexao := TConexao.Create;
  tipocontrato := TTipoContrato.Create;
end;

procedure TEmpresaContrato.SetEmpresa(val: Integer);
begin
  FEmpresa := val;
end;

procedure TEmpresaContrato.SetContrato(val: Integer);
begin
  FContrato := val;
end;

procedure TEmpresaContrato.SetInicio(val: TDateTime);
begin
  FInicio := val;
end;

procedure TEmpresaContrato.SetTermino(val: TDateTime);
begin
 FTermino := val;
end;

function TEmpresaContrato.Validar: Boolean;
begin
  Result := False;
  if Self.Empresa = 0 then
  begin
    MessageDlg('Informe o código da empresa!', mtWarning, [mbCancel], 0);
    Exit;
  end;
  if Self.Contrato = 0 then
  begin
    MessageDlg('Informe tipo de contrato da empresa!', mtWarning, [mbCancel], 0);
    Exit;
  end
  else
  begin
    if (not tipocontrato.getObject(IntToStr(Self.Contrato),'CODIGO') ) then
    begin
      MessageDlg('Código de Tipo de Contrato não cadastrado!', mtWarning, [mbCancel], 0);
      Exit;
    end
    else
    begin
      dm.qryGetObject.Close;
      dm.qryGetObject.SQL.Clear;
    end;

  end;
  if Self.Inicio = 0 then
  begin
    MessageDlg('Informe a data de início do contrato!', mtWarning, [mbCancel], 0);
    Exit;
  end;
  Result := True;
end;

function TEmpresaContrato.Insert: Boolean;
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
                  'COD_EMPRESA, ' +
                  'COD_TIPO_CONTRATO, ' +
                  'DAT_INICIO, ' +
                  'DAT_TERMINO) ' +
                  'VALUES(' +
                  ':CODIGO, ' +
                  ':TIPO, ' +
                  ':INICIO, ' +
                  ':TERMINO)';
      ParamByName('CODIGO').AsInteger := Self.Empresa;
      ParamByName('TIPO').AsInteger := Self.Contrato;
      ParamByName('INICIO').AsDate := Self.Inicio;
      ParamByName('TERMINO').AsDate := Self.Termino;
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

function TEmpresaContrato.Update: Boolean;
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
                  'DAT_INICIO = :INICIO, ' +
                  'DAT_TERMINO = :TERMINO ' +
                  'WHERE COD_EMPRESA = :EMPRESA AND COD_TIPO_CONTRATO = :TIPO';
      ParamByName('CODIGO').AsInteger := Self.Empresa;
      ParamByName('TIPO').AsInteger := Self.Contrato;
      ParamByName('INICIO').AsDate := Self.Inicio;
      ParamByName('TERMINO').AsDate := Self.Termino;
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

function TEmpresaContrato.Delete(sFiltro: String): Boolean;
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
        SQL.Add('WHERE COD_EMPRESA = :CODIGO AND COD_TIPO_CONTRATO = :TIPO');
        ParamByName('CODIGO').AsInteger := Self.Empresa;
        ParamByName('TIPO').AsInteger := Self.Contrato;
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

function TEmpresaContrato.getObject(sId: String; sFiltro: String): Boolean;
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
        SQL.Add('WHERE COD_EMPRESA = :CODIGO');
        ParamByName('CODIGO').AsInteger := StrToInt(sId);
      end
      else if sFiltro = 'TIPO' then
      begin
        SQL.Add('WHERE COD_EMPRESA = :CODIGO AND COD_TIPO_CONTRATO = :TIPO');
        ParamByName('CODIGO').AsInteger := Self.Empresa;
        ParamByName('TIPO').AsInteger := StrToInt(sId);
      end
      else if sFiltro = 'INICIO' then
      begin
        SQL.Add('WHERE DAT_INICIO = :INICIO');
        ParamByName('INICIO').AsDate := StrToDate(sId);
      end
      else if sFiltro = 'TERMINO' then
      begin
        SQL.Add('WHERE DAT_TERMINO = :TERMINO');
        ParamByName('TERMINO').AsDate := StrToDate(sId);
      end;
      dm.ZConn.PingServer;
      Open;
      if (not IsEmpty) then
      begin
        First;
        Self.Empresa := FieldByName('COD_EMPRESA').AsInteger;
        Self.Contrato := FieldByName('COD_TIPO_CONTRATO').AsInteger;
        Self.Inicio := FieldByName('DAT_INICIO').AsDateTime;
        Self.Termino := FieldByName('DAT_TERMINO').AsDateTime;
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

function TEmpresaContrato.getObjects: Boolean;
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

function TEmpresaContrato.getField(sCampo: String; sColuna: String): String;
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
        SQL.Add('WHERE COD_EMPRESA = :CODIGO');
        ParamByName('CODIGO').AsInteger := Self.Empresa;
      end
      else if sColuna = 'TIPO' then
      begin
        SQL.Add('WHERE COD_EMPRESA = :CODIGO AND COD_TIPO_CONTRATO = :TIPO');
        ParamByName('CODIGO').AsInteger := Self.Empresa;
        ParamByName('TIPO').AsInteger := Self.Contrato;
      end
      else if sColuna = 'INICIO' then
      begin
        SQL.Add('WHERE DAT_INICIO = :INICIO');
        ParamByName('INICIO').AsDate := Self.Inicio;
      end
      else if sColuna = 'TERMINO' then
      begin
        SQL.Add('WHERE DAT_TERMINO = :TERMINO');
        ParamByName('TERMINO').AsDate := Self.Termino;
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

destructor TEmpresaContrato.Destroy;
begin
  conexao.Free;
  tipocontrato.Free;
  inherited Destroy;
end;

end.
