unit clDetalheTransporte;

interface

uses clConexao;

type
  TDetalheTransporte = Class(TObject)
  private

    constructor Create;
    destructor Destroy;

    procedure MaxSeq;
    function gerRelatorio: Integer;
    function getChegada: TTime;
    function getDetalhe: String;
    function getObservacoes: String;
    function getRegistro: TDateTime;
    function getSaida: TTime;
    function getSequencia: Integer;
    function getUsuario: String;
    procedure setChegada(const Value: TTime);
    procedure setDetalhe(const Value: String);
    procedure setObservacoes(const Value: String);
    procedure setRegistro(const Value: TDateTime);
    procedure setRelatorio(const Value: Integer);
    procedure setSaida(const Value: TTime);
    procedure setSequencia(const Value: Integer);
    procedure setUsuario(const Value: String);
    function getInicio: TTime;
    function getTermino: TTime;
    procedure setInicio(const Value: TTime);
    procedure setTermino(const Value: TTime);
  protected
    _relatorio: Integer;
    _sequencia: Integer;
    _desricao: String;
    _chegada: TTime;
    _inicio: TTime;
    _termino: TTime;
    _saida: TTime;
    _observacoes: String;
    _usuario: String;
    _registro: TDateTime;
    _conexao: TConexao;
  public
    property Relatorio: Integer read gerRelatorio write setRelatorio;
    property Sequencia: Integer read getSequencia write setSequencia;
    property Detalhe: String read getDetalhe write setDetalhe;
    property Chegada: TTime read getChegada write setChegada;
    property Inicio: TTime read getInicio write setInicio;
    property Termino: TTime read getTermino write setTermino;
    property Saida: TTime read getSaida write setSaida;
    property Observacoes: String read getObservacoes write setObservacoes;
    property Usuario: String read getUsuario write setUsuario;
    property Registro: TDateTime read getRegistro write setRegistro;

    function Validar(): Boolean;
    function Delete(filtro: String): Boolean;
    function getObject(id, filtro: String): Boolean;
    function getObjects(): Boolean;
    function getField(campo, coluna: String): String;
    function Insert(): Boolean;
    function Update(): Boolean;
  End;

const
  TABLENAME = 'tbdetalhetransporte';

implementation

{ TDetalheTransporte }

uses SysUtils, Dialogs, udm, clUtil, DB, Math, DateUtils, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

constructor TDetalheTransporte.Create;
begin
  _conexao := TConexao.Create;
  if (not _conexao.VerifyConnZEOS(0)) then
  begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
      Self.ClassName + ') !', mtError, [mbCancel], 0);
  end;
end;

destructor TDetalheTransporte.Destroy;
begin
  _conexao.Free;
end;

function TDetalheTransporte.Validar(): Boolean;
begin
  Result := False;
  if TUTil.Empty(TimeToStr(Self.Chegada)) then
  begin
    MessageDlg('Informe a Hora da Chegada!', mtWarning, [mbOK], 0);
    Exit;
  end;
  if TUTil.Empty(Self.Detalhe) then
  begin
    MessageDlg('Informe o Detalhe do Transporte!', mtWarning, [mbOK], 0);
    Exit;
  end;
  Result := True;
end;

function TDetalheTransporte.Delete(filtro: string): Boolean;
begin
  try
    Result := False;
    with dm.qryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Add('DELETE FROM ' + TABLENAME);
      if filtro = 'RELATORIO' then
      begin
        SQL.Add('WHERE SEQ_RELATORIO = :RELATORIO');
        ParamByName('RELATORIO').AsInteger := Self.Relatorio;
      end;
      if filtro = 'SEQUENCIA' then
      begin
        SQL.Add('WHERE SEQ_RELATORIO = :RELATORIO AND SEQ_DETALHE = :SEQUENCIA');
        ParamByName('RELATORIO').AsInteger := Self.Relatorio;
        ParamByName('SEQUENCIA').AsInteger := Self.Sequencia;
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

function TDetalheTransporte.getObject(id: string; filtro: string): Boolean;
var
  dsGet: TZQuery;
begin
  try
    Result := False;
    dsGet := dm.qryGetObject;
    with dsGet do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);
      if filtro = 'RELATORIO' then
      begin
        SQL.Add('WHERE SEQ_RELATORIO = :RELATORIO');
        ParamByName('RELATORIO').AsInteger := StrToInt(id);
      end;
      if filtro = 'SEQUENCIA' then
      begin
        SQL.Add('WHERE SEQ_RELATORIO = :RELATORIO AND SEQ_DETALHE = :SEQUENCIA');
        ParamByName('RELATORIO').AsInteger := Self.Relatorio;
        ParamByName('SEQUENCIA').AsInteger := StrToInt(id);
      end;
      dm.ZConn.PingServer;
      Connection := dm.ZConn;
      Open;
      if not(IsEmpty) then
      begin
        if RecordCount >= 1 then
        begin
          Self.Relatorio := FieldByName('SEQ_RELATORIO').AsInteger;
          Self.Sequencia := FieldByName('SEQ_DETALHE').AsInteger;
          Self.Detalhe := FieldByName('DES_TRANSPORTE').AsString;
          Self.Chegada := FieldByName('HOR_CHEGADA').AsDateTime;
          Self.Inicio := FieldByName('HOR_INICIO_CARGA').AsDateTime;
          Self.Termino := FieldByName('HOR_TERMINO_CARGA').AsDateTime;
          Self.Saida := FieldByName('HOR_SAIDA').AsDateTime;
          Self.Observacoes := FieldByName('DES_OBSERVACOES').AsString;
          Self.Usuario := FieldByName('NOM_EXECUTANTE').AsString;
          Self.Registro := FieldByName('DAT_MANUTENCAO').AsDateTime;
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

function TDetalheTransporte.getObjects(): Boolean;
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

function TDetalheTransporte.gerRelatorio: Integer;
begin
  Result := _relatorio;
end;

function TDetalheTransporte.getChegada: TTime;
begin
  Result := _chegada;
end;

function TDetalheTransporte.getDetalhe: String;
begin
  Result := _desricao;
end;

function TDetalheTransporte.getObservacoes: String;
begin
  Result := _observacoes;
end;

function TDetalheTransporte.getRegistro: TDateTime;
begin
  Result := _registro;
end;

function TDetalheTransporte.getSaida: TTime;
begin
  Result := _saida;
end;

function TDetalheTransporte.getSequencia: Integer;
begin
  Result := _sequencia;
end;

function TDetalheTransporte.getTermino: TTime;
begin
  Result := _termino;
end;

function TDetalheTransporte.getUsuario: String;
begin
  Result := _usuario;
end;

function TDetalheTransporte.getField(campo: string; coluna: string): String;
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
        SQL.Add('WHERE SEQ_RELATORIO = :RELATORIO AND SEQ_DETALHE = :SEQUENCIA');
        ParamByName('RELATORIO').AsInteger := Self.Relatorio;
        ParamByName('SEQUENCIA').AsInteger := Self.Sequencia;
      end;
      if coluna = 'SEQUENCIA' then
      begin
        SQL.Add('WHERE SEQ_DETALHE= :SEQUENCIA');
        ParamByName('SEQUENCIA').AsInteger := Self.Sequencia;
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

function TDetalheTransporte.getInicio: TTime;
begin
  Result := _inicio;
end;

procedure TDetalheTransporte.MaxSeq;
begin
  try
    with dm.qryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT MAX(SEQ_DETALHE) AS NUMERO FROM ' + TABLENAME +
        ' WHERE SEQ_RELATORIO = :RELATORIO');
      ParamByName('RELATORIO').AsInteger := Self.Relatorio;
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

procedure TDetalheTransporte.setChegada(const Value: TTime);
begin
  _chegada := Value;
end;

procedure TDetalheTransporte.setDetalhe(const Value: String);
begin
  _desricao := Value;
end;

procedure TDetalheTransporte.setInicio(const Value: TTime);
begin
  _inicio := Value;
end;

procedure TDetalheTransporte.setObservacoes(const Value: String);
begin
  _observacoes := Value;
end;

procedure TDetalheTransporte.setRegistro(const Value: TDateTime);
begin
  _registro := Value;
end;

procedure TDetalheTransporte.setRelatorio(const Value: Integer);
begin
  _relatorio := Value;
end;

procedure TDetalheTransporte.setSaida(const Value: TTime);
begin
  _saida := Value;
end;

procedure TDetalheTransporte.setSequencia(const Value: Integer);
begin
  _sequencia := Value;
end;

procedure TDetalheTransporte.setTermino(const Value: TTime);
begin
  _termino := Value;
end;

procedure TDetalheTransporte.setUsuario(const Value: String);
begin
  _usuario := Value;
end;

function TDetalheTransporte.Insert(): Boolean;
begin
  try
    Result := False;
    with dm.qryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'INSERT INTO ' + TABLENAME + '(SEQ_RELATORIO, ' +
        'SEQ_DETALHE, ' + 'DES_TRANSPORTE, ' + 'HOR_CHEGADA, ' +
        'HOR_INICIO_CARGA, ' + 'HOR_TERMINO_CARGA, ' + 'HOR_SAIDA, ' +
        'DES_OBSERVACOES, ' + 'NOM_EXECUTANTE, ' + 'DAT_MANUTENCAO) ' +
        'VALUES (' + ':RELATORIO, ' + ':SEQUENCIA, ' + ':DETALHE, ' +
        ':CHEGADA, ' + ':INICIO, ' + ':TERMINO, ' + ':SAIDA, ' +
        ':OBSERVACOES, ' + ':USUARIO, ' + ':REGISTRO)';
      ParamByName('RELATORIO').AsInteger := Self.Relatorio;
      ParamByName('SEQUENCIA').AsInteger := Self.Sequencia;
      ParamByName('DETALHE').AsString := Self.Detalhe;
      ParamByName('CHEGADA').AsTime := Self.Chegada;
      ParamByName('INICIO').AsTime := Self.Inicio;
      ParamByName('TERMINO').AsTime := Self.Termino;
      ParamByName('SAIDA').AsTime := Self.Saida;
      ParamByName('OBSERVACOES').AsString := Self.Observacoes;
      ParamByName('USUARIO').AsString := Self.Usuario;
      ParamByName('REGISTRO').AsDateTime := Self.Registro;
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

function TDetalheTransporte.Update(): Boolean;
begin
  try
    Result := False;
    with dm.qryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'UPDATE ' + TABLENAME + ' SET ' +
        'DES_TRANSPORTE     = :DETALHE, ' + 'HOR_CHEGADA        = :CHEGADA, ' +
        'HOR_INICIO_CARGA   = :INICIO, ' + 'HOR_TERMINO_CARGA  = :TERMINO ' +
        'HOR_SAIDA          = :SAIDA, ' + 'DES_OBSERVACOES    = :OBSERVACOES, '
        + 'NOM_USUARIO        = :USUARIO, ' + 'DAT_MANUTENCAO     = :REGISTRO '
        + 'WHERE ' + 'SEQ_RELATORIO = :RELATORIO AND SEQ_DETALHE = :SEQUENCIA';
      ParamByName('RELATORIO').AsInteger := Self.Relatorio;
      ParamByName('SEQUENCIA').AsInteger := Self.Sequencia;
      ParamByName('DETALHE').AsString := Self.Detalhe;
      ParamByName('CHEGADA').AsTime := Self.Chegada;
      ParamByName('INICIO').AsTime := Self.Inicio;
      ParamByName('TERMINO').AsTime := Self.Termino;
      ParamByName('SAIDA').AsTime := Self.Saida;
      ParamByName('OBSERVACOES').AsString := Self.Observacoes;
      ParamByName('USUARIO').AsString := Self.Usuario;
      ParamByName('REGISTRO').AsDateTime := Self.Registro;
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

end.
