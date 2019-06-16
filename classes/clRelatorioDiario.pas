unit clRelatorioDiario;

interface

uses clConexao;

type
  TRelatorioDiario = Class(TObject)
  private
    function getChegadaFranquia: TTime;
    function getData: TDate;
    function getDivergenciaPeso: Integer;
    function getExpedidores: Integer;
    function getMotorista: String;
    function getObservacoes: String;
    function getPlaca: String;
    function getrDivergenciaAvaria: Integer;
    function getRegistro: TDateTime;
    function getSaidaFranquia: TTime;
    function getSaidaOrigem: TTime;
    function getSequencia: Integer;
    function getUsuario: String;
    procedure setChegadaFranquia(const Value: TTime);
    procedure setData(const Value: TDate);
    procedure setDivergenciaAvaria(const Value: Integer);
    procedure setDivergenciaPeso(const Value: Integer);
    procedure setExpedidores(const Value: Integer);
    procedure setMotorista(const Value: String);
    procedure setObservacoes(const Value: String);
    procedure setPlaca(const Value: String);
    procedure setRegistro(const Value: TDateTime);
    procedure setSaidaFranquia(const Value: TTime);
    procedure setSaidaOrigem(const Value: TTime);
    procedure setSequencia(const Value: Integer);
    procedure setUsuario(const Value: String);

    procedure MaxSeq;
    function getOperacao: String;
    procedure setOperacao(const Value: String);

    constructor Create;
    destructor Destroy;
  protected
    _sequencia: Integer;
    _data: TDate;
    _placa: String;
    _motorista: String;
    _saidaorigem: TTime;
    _chegadafranquia: TTime;
    _saidafranquia: TTime;
    _expedidores: Integer;
    _divergenciapeso: Integer;
    _divergenciaavaria: Integer;
    _observacoes: String;
    _usuario: String;
    _registro: TDateTime;
    _operacao: String;
    _conexao: TConexao;
  public
    property Sequencia: Integer read getSequencia write setSequencia;
    property Data: TDate read getData write setData;
    property Placa: String read getPlaca write setPlaca;
    property Motorista: String read getMotorista write setMotorista;
    property SaidaOrigem: TTime read getSaidaOrigem write setSaidaOrigem;
    property ChegadaFranquia: TTime read getChegadaFranquia
      write setChegadaFranquia;
    property SaidaFranquia: TTime read getSaidaFranquia write setSaidaFranquia;
    property Expedidores: Integer read getExpedidores write setExpedidores;
    property DivergenciaPeso: Integer read getDivergenciaPeso
      write setDivergenciaPeso;
    property DivergenciaAvaria: Integer read getrDivergenciaAvaria
      write setDivergenciaAvaria;
    property Observacoes: String read getObservacoes write setObservacoes;
    property Usuario: String read getUsuario write setUsuario;
    property Registro: TDateTime read getRegistro write setRegistro;
    property Operacao: String read getOperacao write setOperacao;

    function Validar(): Boolean;
    function Delete(filtro: String): Boolean;
    function getObject(id, filtro: String): Boolean;
    function getObjects(): Boolean;
    function getField(campo, coluna: String): String;
    function Insert(): Boolean;
    function Update(): Boolean;
  End;

const
  TABLENAME = 'tbrelatoriodiario';

implementation

{ TRelatorioDiario }

uses SysUtils, Dialogs, udm, clUtil, DB, Math, DateUtils;

constructor TRelatorioDiario.Create;
begin
  _conexao := TConexao.Create;
  if (not _conexao.VerifyConnZEOS(0)) then
  begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
      Self.ClassName + ') !', mtError, [mbCancel], 0);
  end;
end;

destructor TRelatorioDiario.Destroy;
begin
  _conexao.Free;
end;

function TRelatorioDiario.getChegadaFranquia: TTime;
begin
  Result := _chegadafranquia;
end;

function TRelatorioDiario.getData: TDate;
begin
  Result := _data;
end;

function TRelatorioDiario.getDivergenciaPeso: Integer;
begin
  Result := _divergenciapeso;
end;

function TRelatorioDiario.getExpedidores: Integer;
begin
  Result := _expedidores;
end;

function TRelatorioDiario.getMotorista: String;
begin
  Result := _motorista;
end;

function TRelatorioDiario.getObservacoes: String;
begin
  Result := _observacoes;
end;

function TRelatorioDiario.getOperacao: String;
begin
  Result := _operacao;
end;

function TRelatorioDiario.getPlaca: String;
begin
  Result := _placa;
end;

function TRelatorioDiario.getrDivergenciaAvaria: Integer;
begin
  Result := _divergenciaavaria;
end;

function TRelatorioDiario.getRegistro: TDateTime;
begin
  Result := _registro
end;

function TRelatorioDiario.getSaidaFranquia: TTime;
begin
  Result := _saidafranquia;
end;

function TRelatorioDiario.getSaidaOrigem: TTime;
begin
  Result := _saidaorigem;
end;

function TRelatorioDiario.getSequencia: Integer;
begin
  Result := _sequencia;
end;

function TRelatorioDiario.getUsuario: String;
begin
  Result := _usuario;
end;

function TRelatorioDiario.Validar(): Boolean;
begin
  Result := False;
  if TUTil.Empty(DateToStr(Self.Data)) then
  begin
    MessageDlg('Informe a Data da Ocorrência!', mtWarning, [mbOK], 0);
    Exit;
  end;
  if TUTil.Empty(Self.Placa) then
  begin
    MessageDlg('Informe a Placa do Veículo!', mtWarning, [mbOK], 0);
    Exit;
  end;
  if TUTil.Empty(Self.Operacao) then
  begin
    MessageDlg('Informe o Tipo de Operação!', mtWarning, [mbOK], 0);
    Exit;
  end;
  if Length(Trim(Self.Placa)) <> 7 then
  begin
    MessageDlg('Placa do Veículo informada é inválida!', mtWarning, [mbOK], 0);
    Exit;
  end;
  if TUTil.Empty(Self.Motorista) then
  begin
    MessageDlg('Informe o Nome do Motorista!', mtWarning, [mbOK], 0);
    Exit;
  end;
  { if Self.Expedidores = 0 then begin
    MessageDlg('Informe a Quantidade de Expedidores!', mtWarning, [mbOK], 0);
    Exit;
    end; }
  Result := True;
end;

function TRelatorioDiario.Delete(filtro: string): Boolean;
begin
  try
    Result := False;
    with dm.qryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Add('DELETE FROM ' + TABLENAME);
      if filtro = 'SEQUENCIA' then
      begin
        SQL.Add('WHERE SEQ_RELATORIO = :SEQUENCIA');
        ParamByName('SEQUENCIA').AsInteger := Self.Sequencia;
      end;
      if filtro = 'DATA' then
      begin
        SQL.Add('WHERE DAT_RELATORIO = :DATA');
        ParamByName('DATA').AsDate := Self.Data;
      end;
      if filtro = 'PLACA' then
      begin
        SQL.Add('WHERE DES_PLACA = :PLACA');
        ParamByName('PLACA').AsString := Self.Placa;
      end;
      if filtro = 'MOTORISTA' then
      begin
        SQL.Add('WHERE NOM_MOTORISTA = :MOTORISTA');
        ParamByName('MOTORISTA').AsString := Self.Motorista;
      end;
      dm.ZConn.PingServer;
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

function TRelatorioDiario.getObject(id: string; filtro: string): Boolean;
begin
  try
    Result := False;
    with dm.qryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);
      if filtro = 'SEQUENCIA' then
      begin
        SQL.Add('WHERE SEQ_RELATORIO = :SEQUENCIA');
        ParamByName('SEQUENCIA').AsInteger := StrToInt(id);
      end;
      if filtro = 'DATA' then
      begin
        SQL.Add('WHERE DAT_RELATORIO = :DATA');
        ParamByName('DATA').AsDate := StrToDate(id);
      end;
      if filtro = 'PLACA' then
      begin
        SQL.Add('WHERE DES_PLACA = :PLACA');
        ParamByName('PLACA').AsString := id;
      end;
      if filtro = 'MOTORISTA' then
      begin
        SQL.Add('WHERE NOM_MOTORISTA = :MOTORISTA');
        ParamByName('MOTORISTA').AsString := id;
      end;
      if filtro = 'CHAVE' then
      begin
        SQL.Add('WHERE DAT_RELATORIO = :DATA AND DES_OPERACAO = :OPERACAO AND DES_PLACA = :PLACA AND NOM_MOTORISTA = :MOTORISTA '
          + 'AND HOR_SAIDA_FRANQUIA = :SAIDA');
        ParamByName('DATA').AsDate := Self.Data;
        ParamByName('OPERACAO').AsString := Self.Operacao;
        ParamByName('PLACA').AsString := Self.Placa;
        ParamByName('MOTORISTA').AsString := Self.Motorista;
        ParamByName('SAIDA').asTime := Self.SaidaFranquia;
      end;
      dm.ZConn.PingServer;
      Open;
      if not(IsEmpty) then
      begin
        First;
        Self.Sequencia := FieldByName('SEQ_RELATORIO').AsInteger;
        Self.Data := FieldByName('DAT_RELATORIO').AsDateTime;
        Self.Placa := FieldByName('DES_PLACA').AsString;
        Self.Motorista := FieldByName('NOM_MOTORISTA').AsString;
        Self.SaidaOrigem := FieldByName('HOR_SAIDA_ORIGEM').AsDateTime;
        Self.ChegadaFranquia := FieldByName('HOR_CHEGADA_FRANQUIA').AsDateTime;
        Self.SaidaFranquia := FieldByName('HOR_SAIDA_FRANQUIA').AsDateTime;
        Self.Expedidores := FieldByName('QTD_EXPEDIDORES').AsInteger;
        Self.DivergenciaPeso := FieldByName('QTD_PESO_DIVERGENCIA').AsInteger;
        Self.DivergenciaAvaria := FieldByName('QTD_AVARIAS_DIVERGENCIA')
          .AsInteger;
        Self.Observacoes := FieldByName('DES_OBSERVACOES').AsString;
        Self.Usuario := FieldByName('NOM_USUARIO').AsString;
        Self.Registro := FieldByName('DAT_REGISTRO').AsDateTime;
        Self.Operacao := FieldByName('DES_OPERACAO').AsString;
        if RecordCount = 1 then
        begin
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
    begin
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

function TRelatorioDiario.getObjects(): Boolean;
begin
  try
    Result := False;
    with dm.qryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);
      dm.ZConn.PingServer;
      Open;
      if IsEmpty then
      begin
        MessageDlg('Nenhum registro encontrado!', mtWarning, [mbOK], 0);
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

function TRelatorioDiario.getField(campo: string; coluna: string): String;
begin
  try
    Result := '';
    with dm.qryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT ' + campo + ' FROM ' + TABLENAME);
      if coluna = 'SEQUENCIA' then
      begin
        SQL.Add('WHERE SEQ_RELATORIO = :SEQUENCIA');
        ParamByName('SEQUENCIA').AsInteger := Self.Sequencia;
      end;
      if coluna = 'PLACA' then
      begin
        SQL.Add('WHERE DES_PLACA = :PLACA');
        ParamByName('PLACA').AsString := Self.Placa;
      end;
      dm.ZConn.PingServer;
      Open;
      if IsEmpty then
      begin
        MessageDlg('Nenhum registro encontrado!', mtWarning, [mbOK], 0);
      end
      else
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

procedure TRelatorioDiario.MaxSeq;
begin
  try
    with dm.qryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT MAX(SEQ_RELATORIO) AS NUMERO FROM ' + TABLENAME);
      dm.ZConn.PingServer;
      Open;
      if not(IsEmpty) then
      begin
        Self.Sequencia := FieldByName('NUMERO').AsInteger + 1;
      end
      else
      begin
        Self.Sequencia := 1;
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

function TRelatorioDiario.Insert(): Boolean;
begin
  try
    Result := False;
    with dm.qryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'INSERT INTO ' + TABLENAME + '(SEQ_RELATORIO, ' +
        'DAT_RELATORIO, ' + 'DES_PLACA, ' + 'NOM_MOTORISTA, ' +
        'HOR_SAIDA_ORIGEM, ' + 'HOR_CHEGADA_FRANQUIA, ' + 'HOR_SAIDA_FRANQUIA, '
        + 'QTD_EXPEDIDORES, ' + 'QTD_PESO_DIVERGENCIA, ' +
        'QTD_AVARIAS_DIVERGENCIA, ' + 'DES_OBSERVACOES, ' + 'NOM_USUARIO, ' +
        'DAT_REGISTRO, ' + 'DES_OPERACAO) ' + 'VALUES (' + ':SEQUENCIA, ' +
        ':DATA, ' + ':PLACA, ' + ':MOTORISTA, ' + ':SAIDAORIGEM, ' +
        ':CHEGADAFRANQUIA, ' + ':SAIDAFRANQUIA, ' + ':EXPEDIDORES, ' +
        ':PESODIVERGENCIA, ' + ':AVARIASDIVERGENCIA, ' + ':OBSERVACOES, ' +
        ':USUARIO, ' + ':REGISTRO, ' + ':OPERACAO)';
      MaxSeq;
      ParamByName('SEQUENCIA').AsInteger := Self.Sequencia;
      ParamByName('DATA').AsDate := Self.Data;
      ParamByName('PLACA').AsString := Self.Placa;
      ParamByName('MOTORISTA').AsString := Self.Motorista;
      ParamByName('SAIDAORIGEM').asTime := Self.SaidaOrigem;
      ParamByName('CHEGADAFRANQUIA').asTime := Self.ChegadaFranquia;
      ParamByName('SAIDAFRANQUIA').asTime := Self.SaidaFranquia;
      ParamByName('EXPEDIDORES').AsInteger := Self.Expedidores;
      ParamByName('PESODIVERGENCIA').AsInteger := Self.DivergenciaPeso;
      ParamByName('AVARIASDIVERGENCIA').AsInteger := Self.DivergenciaAvaria;
      ParamByName('OBSERVACOES').AsString := Self.Observacoes;
      ParamByName('USUARIO').AsString := Self.Usuario;
      ParamByName('REGISTRO').AsDateTime := Self.Registro;
      ParamByName('OPERACAO').AsString := Self.Operacao;
      dm.ZConn.PingServer;
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

function TRelatorioDiario.Update(): Boolean;
begin
  try
    Result := False;
    with dm.qryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'UPDATE ' + TABLENAME + ' SET ' +
        'DAT_RELATORIO            = :DATA, ' +
        'DES_PLACA                = :PLACA, ' +
        'NOM_MOTORISTA            = :MOTORISTA, ' +
        'HOR_SAIDA_ORIGEM         = :SAIDAORIGEM, ' +
        'HOR_CHEGADA_FRANQUIA     = :CHEGADAFRANQUIA, ' +
        'HOR_SAIDA_FRANQUIA       = :SAIDAFRANQUIA, ' +
        'QTD_EXPEDIDORES          = :EXPEDIDORES, ' +
        'QTD_PESO_DIVERGENCIA     = :PESODIVERGENCIA, ' +
        'QTD_AVARIAS_DIVERGENCIA  = :AVARIASDIVERGENCIA, ' +
        'DES_OBSERVACOES          = :OBSERVACOES, ' +
        'NOM_USUARIO              = :USUARIO, ' +
        'DAT_REGISTRO             = :REGISTRO, ' +
        'DES_OPERACAO             = :OPERACAO ' + 'WHERE ' +
        'SEQ_RELATORIO            = :SEQUENCIA';
      ParamByName('SEQUENCIA').AsInteger := Self.Sequencia;
      ParamByName('DATA').AsDate := Self.Data;
      ParamByName('PLACA').AsString := Self.Placa;
      ParamByName('MOTORISTA').AsString := Self.Motorista;
      ParamByName('SAIDAORIGEM').asTime := Self.SaidaOrigem;
      ParamByName('CHEGADAFRANQUIA').asTime := Self.ChegadaFranquia;
      ParamByName('SAIDAFRANQUIA').asTime := Self.SaidaFranquia;
      ParamByName('EXPEDIDORES').AsInteger := Self.Expedidores;
      ParamByName('PESODIVERGENCIA').AsInteger := Self.DivergenciaPeso;
      ParamByName('AVARIASDIVERGENCIA').AsInteger := Self.DivergenciaAvaria;
      ParamByName('OBSERVACOES').AsString := Self.Observacoes;
      ParamByName('USUARIO').AsString := Self.Usuario;
      ParamByName('REGISTRO').AsDateTime := Self.Registro;
      ParamByName('OPERACAO').AsString := Self.Operacao;
      dm.ZConn.PingServer;
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

procedure TRelatorioDiario.setChegadaFranquia(const Value: TTime);
begin
  _chegadafranquia := Value;
end;

procedure TRelatorioDiario.setData(const Value: TDate);
begin
  _data := Value;
end;

procedure TRelatorioDiario.setDivergenciaAvaria(const Value: Integer);
begin
  _divergenciaavaria := Value;
end;

procedure TRelatorioDiario.setDivergenciaPeso(const Value: Integer);
begin
  _divergenciapeso := Value;
end;

procedure TRelatorioDiario.setExpedidores(const Value: Integer);
begin
  _expedidores := Value;
end;

procedure TRelatorioDiario.setMotorista(const Value: String);
begin
  _motorista := Value;
end;

procedure TRelatorioDiario.setObservacoes(const Value: String);
begin
  _observacoes := Value;
end;

procedure TRelatorioDiario.setOperacao(const Value: String);
begin
  _operacao := Value;
end;

procedure TRelatorioDiario.setPlaca(const Value: String);
begin
  _placa := Value;
end;

procedure TRelatorioDiario.setRegistro(const Value: TDateTime);
begin
  _registro := Value;
end;

procedure TRelatorioDiario.setSaidaFranquia(const Value: TTime);
begin
  _saidafranquia := Value;
end;

procedure TRelatorioDiario.setSaidaOrigem(const Value: TTime);
begin
  _saidaorigem := Value;
end;

procedure TRelatorioDiario.setSequencia(const Value: Integer);
begin
  _sequencia := Value;
end;

procedure TRelatorioDiario.setUsuario(const Value: String);
begin
  _usuario := Value;
end;

end.
