unit clContasReceber;

interface

uses
  clCliente, clEntrega, clOrdemServico, clConexao;

type
  TContasReceber = Class(TObject)
  private
    function getBaixado: String;
    function getData: TDate;
    function getDescricao: String;
    function getDocumento: String;
    function getExecutor: String;
    function getManutencao: TDateTime;
    function getNossoNumero: String;
    function getNumero: Integer;
    function getOs: Integer;
    function getPago: TDate;
    procedure setBaixado(const Value: String);
    procedure setData(const Value: TDate);
    procedure setDescricao(const Value: String);
    procedure setDocumento(const Value: String);
    procedure setExecutor(const Value: String);
    procedure setManutencao(const Value: TDateTime);
    procedure setNossoNumero(const Value: String);
    procedure setNumero(const Value: Integer);
    procedure setOs(const Value: Integer);
    procedure setPago(const Value: TDate);
    function getCliente: Integer;
    function getVencimento: TDate;
    procedure setCliente(const Value: Integer);
    procedure setVencimento(const Value: TDate);
    function getValor: Double;
    procedure setValor(const Value: Double);
  protected
    _numero: Integer;
    _data: TDate;
    _descricao: String;
    _valor: Double;
    _cliente: Integer;
    _vencimento: TDate;
    _os: Integer;
    _nossonumero: String;
    _baixado: String;
    _pago: TDate;
    _documento: String;
    _executor: String;
    _manutencao: TDateTime;
    _clCliente: TCliente;
    _clEntrega: TEntrega;
    _clOs: TOrdemServico;
    _conexao: TConexao;
  public
    constructor Create;
    destructor Destroy;

    property Numero: Integer read getNumero write setNumero;
    property Data: TDate read getData write setData;
    property Descricao: String read getDescricao write setDescricao;
    property Valor: Double read getValor write setValor;
    property Cliente: Integer read getCliente write setCliente;
    property Vencimento: TDate read getVencimento write setVencimento;
    property Os: Integer read getOs write setOs;
    property NossoNumero: String read getNossoNumero write setNossoNumero;
    property Baixado: String read getBaixado write setBaixado;
    property Pago: TDate read getPago write setPago;
    property Documento: String read getDocumento write setDocumento;
    property Executor: String read getExecutor write setExecutor;
    property Manutencao: TDateTime read getManutencao write setManutencao;

    procedure MaxNum;

    function Validar(): Boolean;
    function getObject(id, filtro: String): Boolean;
    function getObjects(): Boolean;
    function getField(campo, coluna: String): String;
    function Insert(): Boolean;
    function Update(): Boolean;
    function Delete(filtro: String): Boolean;
  end;

const
  TABLENAME = 'tbcontasreceber';

implementation

{ TContasReceber }

uses SysUtils, Dialogs, udm, clUtil, ZDataset, ZAbstractRODataset, DB;

constructor TContasReceber.Create;
begin
  _clCliente := TCliente.Create;
  _clEntrega := TEntrega.Create;
  _clOs := TOrdemServico.Create;
  _conexao := TConexao.Create;
  if (not _conexao.VerifyConnZEOS(0)) then
  begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
      Self.ClassName + ') !', mtError, [mbCancel], 0);
  end;
end;

destructor TContasReceber.Destroy;
begin
  _clCliente.Free;
  _clEntrega.Free;
  _clOs.Free;
  _conexao.Free;
end;

function TContasReceber.getBaixado: String;
begin
  Result := _baixado;
end;

function TContasReceber.getCliente: Integer;
begin
  Result := _cliente;
end;

function TContasReceber.getData: TDate;
begin
  Result := _data;
end;

function TContasReceber.getDescricao: String;
begin
  Result := _descricao;
end;

function TContasReceber.getDocumento: String;
begin
  Result := _documento;
end;

function TContasReceber.getExecutor: String;
begin
  Result := _executor;
end;

function TContasReceber.getManutencao: TDateTime;
begin
  Result := _manutencao;
end;

function TContasReceber.getNossoNumero: String;
begin
  Result := _nossonumero;
end;

function TContasReceber.getNumero: Integer;
begin
  Result := _numero;
end;

function TContasReceber.getOs: Integer;
begin
  Result := _os;
end;

function TContasReceber.getPago: TDate;
begin
  Result := _pago;
end;

function TContasReceber.getValor: Double;
begin
  Result := _valor;
end;

function TContasReceber.getVencimento: TDate;
begin
  Result := _vencimento;
end;

procedure TContasReceber.MaxNum;
begin
  try
    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT MAX(NUM_LANCAMENTO) AS CODIGO FROM ' + TABLENAME;
      dm.ZConn.PingServer;
      Open;
      if not(IsEmpty) then
        First;
    end;

    Self.Numero := (dm.QryGetObject.FieldByName('CODIGO').AsInteger) + 1;

    dm.QryGetObject.Close;
    dm.QryGetObject.SQL.Clear;

  Except
    on E: Exception do
    begin
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

function TContasReceber.Validar(): Boolean;
begin
  Result := False;
  if Self.Data = 0 then
  begin
    MessageDlg('Informe a Data do Lançamento!', mtWarning, [mbOK], 0);
    Exit;
  end;
  if TUtil.Empty(Self.Descricao) then
  begin
    MessageDlg('Informe a Descrição do Lançamento!', mtWarning, [mbOK], 0);
    Exit;
  end;
  if Self.Cliente = 0 then
  begin
    MessageDlg('Informe o Cliente!', mtWarning, [mbOK], 0);
    Exit;
  end
  else if Self.Valor = 0 then
  begin
    MessageDlg('Informe o Valor!', mtWarning, [mbOK], 0);
    Exit;
  end
  else
  begin
    if not(_clCliente.getObject(IntToStr(Self.Cliente), 'CODIGO')) then
    begin
      MessageDlg('Código de Cliente não cadastrado!', mtWarning, [mbOK], 0);
      Exit;
    end;
  end;
  if Self.Vencimento = 0 then
  begin
    MessageDlg('Informe a Data do Vencimento!', mtWarning, [mbOK], 0);
    Exit;
  end;
  if Self.Os <> 0 then
  begin
    if not(_clOs.getObject(IntToStr(Self.Os), 'NUMERO')) then
    begin
      MessageDlg('Número de OS não cadastrado!', mtWarning, [mbOK], 0);
      Exit;
    end;
  end;
  { if not (TUtil.Empty(Self.NossoNumero)) then begin
    if not (_clEntrega.getObject(Self.NossoNumero,'NOSSONUMERO')) then begin
    MessageDlg('Entrega não cadastrada!',mtWarning,[mbOK],0);
    Exit;
    end;
    end; }
  Result := True;
end;

function TContasReceber.getObject(id: string; filtro: string): Boolean;
begin
  try
    Result := False;
    if TUtil.Empty(id) then
    begin
      Exit;
    end;
    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);
      if filtro = 'NUMERO' then
      begin
        SQL.Add('WHERE NUM_LANCAMENTO = :NUMERO');
        ParamByName('NUMERO').AsInteger := StrToInt(id);
      end
      else if filtro = 'DATA' then
      begin
        SQL.Add('WHERE DAT_LANCAMENTO = :DATA');
        ParamByName('DATA').AsDate := StrToDate(id);
      end
      else if filtro = 'DESCRICAO' then
      begin
        if Pos('%', Self.Descricao) = 0 then
        begin
          ParamByName('DESCRICAO').AsString := '%' + id + '%';
        end
        else
        begin
          ParamByName('DESCRICAO').AsString := id;
        end;
        SQL.Add('WHERE DES_LANCAMENTO LIKE :DESCRICAO');
      end
      else if filtro = 'CLIENTE' then
      begin
        SQL.Add('WHERE COD_CLIENTE = :CLIENTE');
        ParamByName('CLIENTE').AsInteger := StrToInt(id);
      end
      else if filtro = 'VENCIMENTO' then
      begin
        SQL.Add('WHERE DAT_VENCIMENTO = :VENCIMENTO');
        ParamByName('VENCIMENTO').AsDate := StrToDate(id);
      end
      else if filtro = 'OS' then
      begin
        SQL.Add('WHERE NUM_OS = :OS');
        ParamByName('OS').AsInteger := StrToInt(id);
      end
      else if filtro = 'NOSSONUMERO' then
      begin
        SQL.Add('WHERE NUM_NOSSONUMERO = :NOSSONUMERO');
        ParamByName('NOSSONUMERO').AsString := id;
      end
      else if filtro = 'DOCUMENTO' then
      begin
        if Pos('%', Self.Documento) = 0 then
        begin
          ParamByName('DOCUMENTO').AsString := '%' + id + '%';
        end
        else
        begin
          ParamByName('DOCUMENTO').AsString := id;
        end;
        SQL.Add('WHERE ID_DOCUMENTO LIKE :DOCUMENTO');
      end;
      dm.ZConn.PingServer;
      Open;
      if not(IsEmpty) then
      begin
        First;
        Self.Numero := FieldByName('NUM_LANCAMENTO').AsInteger;
        Self.Data := FieldByName('DAT_LANCAMENTO').AsDateTime;
        Self.Descricao := FieldByName('DES_LANCAMENTO').AsString;
        Self.Valor := FieldByName('VAL_LANCAMENTO').AsFloat;
        Self.Cliente := FieldByName('COD_CLIENTE').AsInteger;
        Self.Vencimento := FieldByName('DAT_VENCIMENTO').AsDateTime;
        Self.Os := FieldByName('NUM_OS').AsInteger;
        Self.NossoNumero := FieldByName('NUM_NOSSONUMERO').AsString;
        Self.Baixado := FieldByName('DOM_BAIXADO').AsString;
        Self.Pago := FieldByName('DAT_PAGO').AsDateTime;
        Self.Documento := FieldByName('ID_DOCUMENTO').AsString;
        Self.Executor := FieldByName('NOM_EXECUTOR').AsString;
        Self.Manutencao := FieldByName('DAT_MANUTENCAO').AsDateTime;
        if RecordCount = 1 then
        begin
          Close;
          SQL.Clear;
        end;
      end;
    end;
    Result := True;
  except
    on E: Exception do
    begin
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

function TContasReceber.getObjects(): Boolean;
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
      if IsEmpty then
      begin
        Close;
        SQL.Clear;
        Exit;
      end;
      First;
    end;
    Result := True;
  except
    on E: Exception do
    begin
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

function TContasReceber.getField(campo: string; coluna: string): String;
begin
  try
    Result := '';
    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT ' + campo + ' FROM ' + TABLENAME);
      if coluna = 'NUMERO' then
      begin
        SQL.Add('WHERE NUM_LANCAMENTO = :NUMERO');
        ParamByName('NUMERO').AsInteger := Self.Numero;
      end
      else if coluna = 'DATA' then
      begin
        SQL.Add('WHERE DAT_LANCAMENTO = :DATA');
        ParamByName('DATA').AsDate := Self.Data;
      end
      else if coluna = 'CLIENTE' then
      begin
        SQL.Add('WHERE COD_CLIENTE = :CLIENTE');
        ParamByName('CLIENTE').AsInteger := Self.Cliente;
      end
      else if coluna = 'VENCIMENTO' then
      begin
        SQL.Add('WHERE DAT_VENCIMENTO = :VENCIMENTO');
        ParamByName('VENCIMENTO').AsDate := Self.Vencimento;
      end
      else if coluna = 'OS' then
      begin
        SQL.Add('WHERE NUM_OS = :OS');
        ParamByName('OS').AsInteger := Self.Os;
      end
      else if coluna = 'NOSSONUMERO' then
      begin
        SQL.Add('WHERE NUM_NOSSONUMERO = :NOSSONUMERO');
        ParamByName('NOSSONUMERO').AsString := Self.NossoNumero;
      end
      else if coluna = 'DOCUMENTO' then
      begin
        ParamByName('DOCUMENTO').AsString := Self.Documento;
        SQL.Add('WHERE ID_DOCUMENTO = :DOCUMENTO');
      end;
      dm.ZConn.PingServer;
      Open;
      if not(IsEmpty) then
      begin
        Result := FieldByName(campo).AsString;
      end;
      Close;
      SQL.Clear;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

function TContasReceber.Insert(): Boolean;
begin
  try
    Result := False;
    with dm.qryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'INSERT INTO ' + TABLENAME + '(' + 'NUM_LANCAMENTO, ' +
        'DAT_LANCAMENTO, ' + 'DES_LANCAMENTO, ' + 'VAL_LANCAMENTO, ' +
        'COD_CLIENTE, ' + 'DAT_VENCIMENTO, ' + 'NUM_OS, ' + 'NUM_NOSSONUMERO, '
        + 'DOM_BAIXADO, ' + 'DAT_PAGO, ' + 'ID_DOCUMENTO, ' + 'NOM_EXECUTOR, ' +
        'DAT_MANUTENCAO) ' + 'VALUES (' + ':NUMERO, ' + ':DATA, ' +
        ':DESCRICAO, ' + ':VALOR, ' + ':CLIENTE, ' + ':VENCIMENTO, ' + ':OS, ' +
        ':NOSSONUMERO, ' + ':BAIXADO, ' + ':PAGO, ' + ':DOCUMENTO, ' +
        ':EXECUTOR, ' + ':MANUTENCAO)';
      MaxNum;
      ParamByName('NUMERO').AsInteger := Self.Numero;
      ParamByName('DATA').AsDate := Self.Data;
      ParamByName('DESCRICAO').AsString := Self.Descricao;
      ParamByName('VALOR').AsFloat := Self.Valor;
      ParamByName('CLIENTE').AsInteger := Self.Cliente;
      ParamByName('VENCIMENTO').AsDate := Self.Vencimento;
      ParamByName('OS').AsInteger := Self.Os;
      ParamByName('NOSSONUMERO').AsString := Self.NossoNumero;
      ParamByName('BAIXADO').AsString := Self.Baixado;
      ParamByName('PAGO').AsDate := Self.Pago;
      ParamByName('DOCUMENTO').AsString := Self.Documento;
      ParamByName('EXECUTOR').AsString := Self.Executor;
      ParamByName('MANUTENCAO').AsDateTime := Self.Manutencao;
      dm.ZConn.PingServer;
      ExecSQL;
      Close;
      SQL.Clear;
    end;
    Result := True;
  except
    on E: Exception do
    begin
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

function TContasReceber.Update(): Boolean;
begin
  try
    Result := False;
    with dm.qryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'UPDATE ' + TABLENAME + ' SET ' + 'DAT_LANCAMENTO = :DATA, ' +
        'DES_LANCAMENTO = :DESCRICAO, ' + 'VAL_LANCAMENTO = :VALOR, ' +
        'COD_CLIENTE = :CLIENTE, ' + 'DAT_VENCIMENTO = :VENCIMENTO, ' +
        'NUM_OS = :OS, ' + 'NUM_NOSSONUMERO = :NOSSONUMERO, ' +
        'DOM_BAIXADO = :BAIXADO, ' + 'DAT_PAGO = :PAGO, ' +
        'ID_DOCUMENTO = :DOCUMENTO, ' + 'NOM_EXECUTOR = :EXECUTOR, ' +
        'DAT_MANUTENCAO = :MANUTENCAO ' + 'WHERE NUM_LANCAMENTO = :NUMERO';
      ParamByName('NUMERO').AsInteger := Self.Numero;
      ParamByName('DATA').AsDate := Self.Data;
      ParamByName('DESCRICAO').AsString := Self.Descricao;
      ParamByName('VALOR').AsFloat := Self.Valor;
      ParamByName('CLIENTE').AsInteger := Self.Cliente;
      ParamByName('VENCIMENTO').AsDate := Self.Vencimento;
      ParamByName('OS').AsInteger := Self.Os;
      ParamByName('NOSSONUMERO').AsString := Self.NossoNumero;
      ParamByName('BAIXADO').AsString := Self.Baixado;
      ParamByName('PAGO').AsDate := Self.Pago;
      ParamByName('DOCUMENTO').AsString := Self.Documento;
      ParamByName('EXECUTOR').AsString := Self.Executor;
      ParamByName('MANUTENCAO').AsDateTime := Self.Manutencao;
      dm.ZConn.PingServer;
      ExecSQL;
      Close;
      SQL.Clear;
    end;
    Result := True;
  except
    on E: Exception do
    begin
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

function TContasReceber.Delete(filtro: String): Boolean;
begin
  try
    Result := False;
    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('DELETE FROM ' + TABLENAME);
      if filtro = 'NUMERO' then
      begin
        SQL.Add('WHERE NUM_LANCAMENTO = :NUMERO');
        ParamByName('NUMERO').AsInteger := Self.Numero;
      end
      else if filtro = 'DATA' then
      begin
        SQL.Add('WHERE DAT_LANCAMENTO = :DATA');
        ParamByName('DATA').AsDate := Self.Data;
      end
      else if filtro = 'CLIENTE' then
      begin
        SQL.Add('WHERE COD_CLIENTE = :CLIENTE');
        ParamByName('CLIENTE').AsInteger := Self.Cliente;
      end
      else if filtro = 'VENCIMENTO' then
      begin
        SQL.Add('WHERE DAT_VENCIMENTO = :VENCIMENTO');
        ParamByName('VENCIMENTO').AsDate := Self.Vencimento;
      end
      else if filtro = 'OS' then
      begin
        SQL.Add('WHERE NUM_OS = :OS');
        ParamByName('OS').AsInteger := Self.Os;
      end
      else if filtro = 'NOSSONUMERO' then
      begin
        SQL.Add('WHERE NUM_NOSSONUMERO = :NOSSONUMERO');
        ParamByName('NOSSONUMERO').AsString := Self.NossoNumero;
      end
      else if filtro = 'DOCUMENTO' then
      begin
        SQL.Add('WHERE ID_DOCUMENTO = :DOCUMENTO');
        ParamByName('DOCUMENTO').AsString := Self.Documento;
      end;
      dm.ZConn.PingServer;
      ExecSQL;
      Close;
      SQL.Clear;
    end;
    Result := True;
  except
    on E: Exception do
    begin
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

procedure TContasReceber.setBaixado(const Value: String);
begin
  _baixado := Value;
end;

procedure TContasReceber.setCliente(const Value: Integer);
begin
  _cliente := Value;
end;

procedure TContasReceber.setData(const Value: TDate);
begin
  _data := Value;
end;

procedure TContasReceber.setDescricao(const Value: String);
begin
  _descricao := Value;
end;

procedure TContasReceber.setDocumento(const Value: String);
begin
  _documento := Value;
end;

procedure TContasReceber.setExecutor(const Value: String);
begin
  _executor := Value;
end;

procedure TContasReceber.setManutencao(const Value: TDateTime);
begin
  _manutencao := Value;
end;

procedure TContasReceber.setNossoNumero(const Value: String);
begin
  _nossonumero := Value;
end;

procedure TContasReceber.setNumero(const Value: Integer);
begin
  _numero := Value;
end;

procedure TContasReceber.setOs(const Value: Integer);
begin
  _os := Value;
end;

procedure TContasReceber.setPago(const Value: TDate);
begin
  _pago := Value;
end;

procedure TContasReceber.setValor(const Value: Double);
begin
  _valor := Value;
end;

procedure TContasReceber.setVencimento(const Value: TDate);
begin
  _vencimento := Value;
end;

end.
