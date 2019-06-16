unit clAcariacoes;

interface

type
  TAcariacoes = Class(Tobject)
  private
    function  getApuracao     : String;
    function  getBase         : Integer;
    function  getEntregador   : Integer;
    function  getEnvio        : String;
    function  getExecutor     : String;
    function  getExtravio     : Double;
    function  getId           : String;
    function  getManutencao   : TDateTime;
    function  getMotivo       : String;
    function  getMulta        : Double;
    function  getNossonumero  : String;
    function  getObs          : String;
    function  getResultado    : String;
    function  getRetorno      : String;
    function  getSequencia    : Integer;
    function  getTratativa    : String;
    function  getData         : TDateTime;
    procedure setApuracao     (const  Value:  String);
    procedure setBase         (const  Value:  Integer);
    procedure setEntregador   (const  Value:  Integer);
    procedure setEnvio        (const  Value:  String);
    procedure setExecutor     (const  Value:  String);
    procedure setExtravio     (const  Value:  Double);
    procedure setId           (const  Value:  String);
    procedure setManutencao   (const  Value:  TDateTime);
    procedure setMotivo       (const  Value:  String);
    procedure setMulta        (const  Value:  Double);
    procedure setNossoNumero  (const  Value:  String);
    procedure setObs          (const  Value:  String);
    procedure setResultado    (const  Value:  String);
    procedure setRetorno      (const  Value:  String);
    procedure setSequencia    (const  Value:  Integer);
    procedure setTratativa    (const  Value:  String);
    procedure setData(const Value: TDateTime);

    procedure MaxSeq;

    function  Validar()                     : Boolean;
    function  Delete(sfiltro: String)       : Boolean;
    function  GetObject(id, filtro: String) : Boolean;
    function  GetObjects()                  : Boolean;
    function  Insert()                      : Boolean;

  protected
    _sequencia    : Integer;
    _id           : String;
    _data         : TDateTime;
    _nossonumero  : String;
    _entregador   : Integer;
    _base         : Integer;
    _motivo       : String;
    _tratativa    : String;
    _apuracao     : String;
    _resultado    : String;
    _extravio     : Double;
    _multa        : Double;
    _envio        : String;
    _retorno      : String;
    _obs          : String;
    _executor     : String;
    _manutencao   : TDateTime;
  public
    property  Sequencia   : Integer   read  getSequencia    write setSequencia;
    property  Id          : String    read  getId           write setId;
    property  Data        : TDateTime read  getData         write setData;
    property  NossoNumero : String    read  getNossonumero  write setNossoNumero;
    property  Entregador  : Integer   read  getEntregador   write setEntregador;
    property  Base        : Integer   read  getBase         write setBase;
    property  Motivo      : String    read  getMotivo       write setMotivo;
    property  Tratativa   : String    read  getTratativa    write setTratativa;
    property  Apuracao    : String    read  getApuracao     write setApuracao;
    property  Resultado   : String    read  getResultado    write setResultado;
    property  Extravio    : Double    read  getExtravio     write setExtravio;
    property  Multa       : Double    read  getMulta        write setMulta;
    property  Envio       : String    read  getEnvio        write setEnvio;
    property  Retorno     : String    read  getRetorno      write setRetorno;
    property  Obs         : String    read  getObs          write setObs;
    property  Executor    : String    read  getExecutor     write setExecutor;
    property  Manutencao  : TDateTime read  getManutencao   write setManutencao;
  end;

  const TABLENAME = 'TBACARIACOES';

implementation

{ TAcariacoes }

uses udm, clUtil, System.SysUtils, System.DateUtils, Vcl.Dialogs;

function TAcariacoes.getApuracao: String;
begin
  Result  :=  _apuracao;
end;

function TAcariacoes.getBase: Integer;
begin
  Result  :=  _base;
end;

function TAcariacoes.getData: TDateTime;
begin
  Result  :=  _data;
end;

function TAcariacoes.getEntregador: Integer;
begin
  Result  :=  _entregador;
end;

function TAcariacoes.getEnvio: String;
begin
  Result  :=  _envio;
end;

function TAcariacoes.getExecutor: String;
begin
  Result  :=  _executor;
end;

function TAcariacoes.getExtravio: Double;
begin
  Result  :=  _extravio;
end;

function TAcariacoes.getId: String;
begin
  Result  :=  _id;
end;

function TAcariacoes.getManutencao: TDateTime;
begin
  Result  :=  _manutencao;
end;

function TAcariacoes.getMotivo: String;
begin
  Result  :=  _motivo;
end;

function TAcariacoes.getMulta: Double;
begin
  Result  :=  _multa;
end;

function TAcariacoes.getNossonumero: String;
begin
  Result  :=  _nossonumero;
end;

function TAcariacoes.getObs: String;
begin
  Result  :=  _obs;
end;

function TAcariacoes.getResultado: String;
begin
  Result  :=  _resultado;
end;

function TAcariacoes.getRetorno: String;
begin
  Result  :=  _retorno;
end;

function TAcariacoes.getSequencia: Integer;
begin
  Result  :=  _sequencia;
end;

function TAcariacoes.getTratativa: String;
begin
  Result  :=  _tratativa;
end;

procedure TAcariacoes.MaxSeq;
begin
  Try
    with dm.QryGetObject do begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT MAX(SEQ_ACAREACAO) AS SEQUENCIA FROM '+ TABLENAME;
      dm.ZConn.PingServer;
      Open;
      if not (IsEmpty) then
        First;
    end;

    Self.Sequencia  :=  (dm.QryGetObject.FieldByName('SEQUENCIA').AsInteger) + 1;

    dm.QryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
  Except
    on E : Exception do
      ShowMessage('Classe: '+ e.ClassName + chr(13) + 'Mensagem: '+ e.Message);
  end;
end;

function TAcariacoes.Validar(): Boolean;
var
  iApuracao, iResultado : Integer;
begin
  try
    Result      :=  False;
    iApuracao   :=  0;
    iResultado  :=  0;
    if TUtil.Empty(Self.Id) then begin
      MessageDlg('Informe um ID válido para esta Acareação!', mtWarning,[mbOK]);
      Exit;
    end;
    if TUtil.Empty(Self.NossoNumero) then begin
      MessageDlg('Informe o Nosso Número!', mtWarning,[mbOK]);
      Exit;
    end;
    if Self.Entregador = 0 then begin
      MessageDlg('Informe o Código do Entregador!', mtWarning,[mbOK]);
      Exit;
    end;
    if Self.Base = 0 then begin
      MessageDlg('Informe o Código da Base!', mtWarning,[mbOK]);
      Exit;
    end;
    if TUtil.Empty(Self.Motivo) then begin
      MessageDlg('Informe o Motivo desta Acareação!', mtWarning,[mbOK]);
      Exit;
    end;
    if TUtil.Empty(Self.Tratativa) then begin
      MessageDlg('Informe o Motivo desta Acareação!', mtWarning,[mbOK]);
      Exit;
    end;
    if (not TUtil.Empty(Self.Apuracao)) then begin
      iApuracao :=  Copy(Self.Apuracao,1,3);
    end;
    if (not TUtil.Empty(Self.Resultado)) then begin
      if iApuracao = 1 then begin
        if iResultado < 3 then begin
          MessageDlg('Resultado da Acareação inválido para o tipo de Apuração informada!', mtWarning,[mbOK]);
          Exit;
        end;
      end;
      if iApuracao = 3 then begin
        if iResultado > 2 then begin
          MessageDlg('Resultado da Acareação inválido para o tipo de Apuração informada!', mtWarning,[mbOK]);
          Exit;
        end;
      end;
      if iApuracao = 6 then begin
        if iResultado > 2 then begin
          MessageDlg('Resultado da Acareação inválido para o tipo de Apuração informada!', mtWarning,[mbOK]);
          Exit;
        end;
      end;
      if iApuracao = 7 then begin
        if iResultado > 2 then begin
          MessageDlg('Resultado da Acareação inválido para o tipo de Apuração informada!', mtWarning,[mbOK]);
          Exit;
        end;
      end;
      if iApuracao = 10 then begin
        if iResultado > 2 then begin
          MessageDlg('Resultado da Acareação inválido para o tipo de Apuração informada!', mtWarning,[mbOK]);
          Exit;
        end;
      end;
      if iApuracao = 11 then begin
        if iResultado > 2 then begin
          MessageDlg('Resultado da Acareação inválido para o tipo de Apuração informada!', mtWarning,[mbOK]);
          Exit;
        end;
      end;
      if iResultado = 2 then begin
        if Self.Extravio = 0 then begin
          MessageDlg('Informe o Valor do Extravio!', mtWarning,[mbOK]);
          Exit;
        end;
        if Self.Multa > 0 then begin
          MessageDlg('Valor de Multa inválido para o Resultado informado!', mtWarning,[mbOK]);
          Exit;
        end;
      end;
      if iResultado = 3 then begin
        if Self.Extravio = 0 then begin
          MessageDlg('Informe o Valor do Extravio!', mtWarning,[mbOK]);
          Exit;
        end;
        if Self.Multa = 0 then begin
          MessageDlg('Informe o Valor da Multa!', mtWarning,[mbOK]);
          Exit;
        end;
      end;
      if iResultado = 4 then begin
        if Self.Extravio > 0 then begin
          MessageDlg('Valor do Extravio inválido para o Resultado informado!', mtWarning,[mbOK]);
          Exit;
        end;
        if Self.Multa = 0 then begin
          MessageDlg('Informe o Valor da Multa!', mtWarning,[mbOK]);
          Exit;
        end;
      end;
    end;
    Result  :=  True;
  except
    on E : Exception do
      ShowMessage('Classe: '+ e.ClassName + chr(13) + 'Mensagem: '+ e.Message);
  end;
end;

function TAcariacoes.Delete(sfiltro: String): Boolean;
begin
  try
    Result := False;
    dm.QryCRUD.Close;
    dm.QryCRUD.SQL.Clear;
    dm.QryCRUD.SQL.Add('DELETE FROM '+ TABLENAME);
    if sfiltro = 'SEQUENCIA' then begin
      dm.QryCRUD.SQL.Add('WHERE SEQ_ACAREACAO = :CODIGO');
      dm.QryCRUD.ParamByName('SEQUENCIA').AsInteger := Self.Sequencia;
    end
    else if sfiltro = 'ID' then begin
      dm.QryCRUD.SQL.Add('WHERE ID_ACAREACAO = :ID');
      dm.QryCRUD.ParamByName('ID').AsString := Self.Id;
    end
    else if sfiltro = 'NOSSONUMERO' then begin
      dm.QryCRUD.SQL.Add('WHERE NUM_NOSSONUMERO = :NOSSONUMERO');
      dm.QryCRUD.ParamByName('NOSSORUMERO').AsString := Self.NossoNumero;
    end
    else if sfiltro = 'ENTREGADOR' then begin
      dm.QryCRUD.SQL.Add('WHERE COD_ENTREGADOR = :ENTREGADOR');
      dm.QryCRUD.ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
    end
    else if sfiltro = 'BASE' then begin
      dm.QryCRUD.SQL.Add('WHERE COD_BASE = :BASE');
      dm.QryCRUD.ParamByName('BASE').AsInteger := Self.Base;
    end;
    dm.ZConn.PingServer;
    dm.QryCRUD.ExecSQL;
    dm.QryCRUD.Close;
    dm.QryCRUD.SQL.Clear;
    Result := True;
  except
    on E : Exception do
      ShowMessage('Classe: '+ e.ClassName + chr(13) + 'Mensagem: '+ e.Message);
  end;
end;

function TAcariacoes.GetObject(id: string; filtro: string): Boolean;
begin
  try
    Result := False;
    if TUtil.Empty(Id) then begin
      Exit;
    end;
    dm.QryGetObject.Close;
    dm.QryGetObject.SQL.Clear;
    dm.QryGetObject.SQL.Add('SELECT * FROM '+ TABLENAME);
    if filtro = 'SEQUENCIA' then begin
      dm.QryGetObject.SQL.Add('WHERE SEQ_ACAREACAO = :SEQUENCIA');
      dm.QryGetObject.ParamByName('SEQUENCIA').AsInteger := StrToInt(id);
    end
    else if Filtro = 'ID' then begin
      dm.QryGetObject.SQL.Add('WHERE ID_ACAREACAO = :ID');
      dm.QryGetObject.ParamByName('ID').AsString := id;
    end
    else if filtro = 'NOSSONUMERO' then begin
      dm.QryGetObject.SQL.Add('WHERE NUM_NOSSONUMERO = :NOSSONUMERO');
      dm.QryGetObject.ParamByName('NOSSONUMERO').AsString := id;
    end
    else if filtro = 'MOTIVO' then begin
      dm.QryGetObject.SQL.Add('WHERE DES_EXTRAVIO = :MOTIVO');
      dm.QryGetObject.ParamByName('MOTIVO').AsString := id;
    end
    else if filtro = 'ENVIO' then begin
      dm.QryGetObject.SQL.Add('WHERE DES_ENVIO_CORRESPONDENCIA = :ENVIO');
      dm.QryGetObject.ParamByName('ENVIO').AsString := id;
      end
    else if filtro = 'RETORNO' then begin
      dm.QryGetObject.SQL.Add('WHERE DES_RETORNO_CORRESPONDENCIA = :RETORNO');
      dm.QryGetObject.ParamByName('RETORNO').AsString := id;
    end
    else if filtro = 'DATA' then begin
      dm.QryGetObject.SQL.Add('WHERE DAT_EXTRAVIO = :DATA');
      dm.QryGetObject.ParamByName('DATA').AsDate := StrToDate(id);
    end
    else if filtro = 'ENTREGADOR' then begin
      dm.QryGetObject.SQL.Add('WHERE COD_ENTREGADOR = :ENTREGADOR');
      dm.QryGetObject.ParamByName('ENTREGADOR').AsInteger := StrToInt(id);
    end
    else if filtro = 'ENTREGADORES' then begin
      dm.QryGetObject.SQL.Add('WHERE COD_ENTREGADOR IN (:ENTREGADOR)');
      dm.QryGetObject.ParamByName('ENTREGADOR').AsString := id;
    end
    else if filtro = 'AGENTE' then begin
      dm.QryGetObject.SQL.Add('WHERE COD_AGENTE = :AGENTE');
      dm.QryGetObject.ParamByName('AGENTE').AsInteger := StrToInt(id);
    end;
    dm.ZConn.PingServer;
    dm.QryGetObject.Open;
    if (not dm.QryGetObject.IsEmpty) then begin
      dm.QryGetObject.First;
    end;
    if (not dm.qryGetObject.IsEmpty) then begin
      Self.Sequencia    :=  dm.QryGetObject.FieldByName('SEQ_ACAREACAO').AsInteger;
      Self.Id           :=  dm.QryGetObject.FieldByName('ID_ACAREACAO').AsString;
      self.Data         :=  dm.QryGetObject.FieldByName('DAT_ACAREACAO').AsDateTime;
      Self.NossoNumero  :=  dm.QryGetObject.FieldByName('NUM_NOSSONUMERO').AsString;
      Self.Entregador   :=  dm.QryGetObject.FieldByName('COD_ENTREGADOR').AsInteger;
      Self.Base         :=  dm.QryGetObject.FieldByName('COD_BASE').AsInteger;
      Self.Motivo       :=  dm.QryGetObject.FieldByName('DES_MOTIVO').AsString;
      Self.Tratativa    :=  dm.QryGetObject.FieldByName('DES_TRATATIVA').AsString;
      Self.Apuracao     :=  dm.QryGetObject.FieldByName('DES_APURACAO').AsString;
      Self.Resultado    :=  dm.QryGetObject.FieldByName('DES_RESULTADO').AsString;
      Self.Extravio     :=  dm.QryGetObject.FieldByName('VAL_EXTRAVIO').AsFloat;
      Self.Multa        :=  dm.QryGetObject.FieldByName('VAL_MULTA').AsFloat;
      Self.Envio        :=  dm.qryGetObject.FieldByName('DES_ENVIO_CORRESPONDENCIA').AsString;
      Self.Retorno      :=  dm.qryGetObject.FieldByName('DES_RETORNO_CORRESPONDENCIA').AsString;
      Self.Obs          :=  dm.qryGetObject.FieldByName('DES_OBSERVACOES').AsString;
      Self.Executor     :=  dm.QryGetObject.FieldByName('NOM_EXECUTOR').AsString;
      Self.Manutencao   :=  dm.QryGetObject.FieldByName('DAT_MANUTENCAO').AsDateTime;
      Result := True;
    end
    else begin
      dm.QryGetObject.Close;
      dm.QryGetObject.SQL.Clear;
    end;
  Except
    on E : Exception do
      ShowMessage('Classe: '+ e.ClassName + chr(13) + 'Mensagem: '+ e.Message);
  end;
end;

function TAcariacoes.GetObjects(): Boolean;
begin
  try
    Result := False;
    if TUtil.Empty(Id) then begin
      Exit;
    end;
    dm.QryGetObject.Close;
    dm.QryGetObject.SQL.Clear;
    dm.QryGetObject.SQL.Add('SELECT * FROM '+ TABLENAME);
    dm.ZConn.PingServer;
    dm.QryGetObject.Open;
    if (not dm.QryGetObject.IsEmpty) then begin
      dm.QryGetObject.First;
      Result := True;
    end
    else begin
      dm.QryGetObject.Close;
      dm.QryGetObject.SQL.Clear;
    end;
  Except
    on E : Exception do
      ShowMessage('Classe: '+ e.ClassName + chr(13) + 'Mensagem: '+ e.Message);
  end;
end;

function TAcariacoes.Insert(): Boolean;
begin
  try

  Except
    on E : Exception do
      ShowMessage('Classe: '+ e.ClassName + chr(13) + 'Mensagem: '+ e.Message);
  end;
end;

procedure TAcariacoes.setApuracao(const Value: String);
begin
  _apuracao     :=  Value;
end;

procedure TAcariacoes.setBase(const Value: Integer);
begin
  _base         :=  Value;
end;

procedure TAcariacoes.setData(const Value: TDateTime);
begin
  _data         :=  Value;
end;

procedure TAcariacoes.setEntregador(const Value: Integer);
begin
  _entregador   :=  Value;
end;

procedure TAcariacoes.setEnvio(const Value: String);
begin
  _envio        :=  Value;
end;

procedure TAcariacoes.setExecutor(const Value: String);
begin
  _executor     :=  Value;
end;

procedure TAcariacoes.setExtravio(const Value: Double);
begin
  _extravio     :=  Value;
end;

procedure TAcariacoes.setId(const Value: String);
begin
  _id           :=  Value;
end;

procedure TAcariacoes.setManutencao(const Value: TDateTime);
begin
  _manutencao   :=  Value;
end;

procedure TAcariacoes.setMotivo(const Value: String);
begin
  _motivo       :=  Value;
end;

procedure TAcariacoes.setMulta(const Value: Double);
begin
  _multa        :=  Value;
end;

procedure TAcariacoes.setNossoNumero(const Value: String);
begin
  _nossonumero  :=  Value;
end;

procedure TAcariacoes.setObs(const Value: String);
begin
  _obs          :=  Value;
end;

procedure TAcariacoes.setResultado(const Value: String);
begin
  _resultado    :=  Value;
end;

procedure TAcariacoes.setRetorno(const Value: String);
begin
  _retorno      :=  Value;
end;

procedure TAcariacoes.setSequencia(const Value: Integer);
begin
  _sequencia    :=  Value;
end;

procedure TAcariacoes.setTratativa(const Value: String);
begin
  _tratativa    :=  Value;
end;

end.
