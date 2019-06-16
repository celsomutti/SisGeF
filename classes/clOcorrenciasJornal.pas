unit clOcorrenciasJornal;

interface

uses clConexao, System.SysUtils, Vcl.Dialogs;

type
  TOcorrenciasJornal = class(TObject)
  private
    FRoteiro: String;
    FEntregador: Integer;
    FAssinatura: String;
    FNome: String;
    FProduto: String;
    FOcorrencia: Integer;
    FReincidencia: String;
    FDescricao: String;
    FEndereco: String;
    FRetorno: String;
    FResultado: Integer;
    FOrigem: Integer;
    FObs: String;
    FStatus: Integer;
    FData: TDateTime;
    conexao: TConexao;
    FNumero: Integer;
    FLog: String;
    FProcessado: String;
    FValor: Double;
    FApuracao: String;
    FQtde: Integer;
    FDataDesconto: System.TDate;
    FImpressao: String;
    FAnexo: String;
    procedure SetRoteiro(val: String);
    procedure SetEntregador(val: Integer);
    procedure SetAssinatura(val: String);
    procedure SetNome(val: String);
    procedure SetProduto(val: String);
    procedure SetOcorrencia(val: Integer);
    procedure SetReincidencia(val: String);
    procedure SetDescricao(val: String);
    procedure SetEndereco(val: String);
    procedure SetRetorno(val: String);
    procedure SetResultado(val: Integer);
    procedure SetOrigem(val: Integer);
    procedure SetObs(val: String);
    procedure SetStatus(val: Integer);
    procedure SetData(val: TDateTime);
    procedure SetNumero(val: Integer);
    procedure SetLog(val: String);
    procedure SetProcessado(val: String);
    procedure SetValor(val: Double);
    procedure SetApuracao(val: String);
    procedure SetQtde(val: Integer);
    procedure SetDataDesconto(val: System.TDate);
    procedure SetImpressao(val: String);
    procedure SetAnexo(val: String);
  public
    property Roteiro: String read FRoteiro write SetRoteiro;
    property Entregador: Integer read FEntregador write SetEntregador;
    property Assinatura: String read FAssinatura write SetAssinatura;
    property Nome: String read FNome write SetNome;
    property Produto: String read FProduto write SetProduto;
    property Ocorrencia: Integer read FOcorrencia write SetOcorrencia;
    property Reincidencia: String read FReincidencia write SetReincidencia;
    property Descricao: String read FDescricao write SetDescricao;
    property Endereco: String read FEndereco write SetEndereco;
    property Retorno: String read FRetorno write SetRetorno;
    property Resultado: Integer read FResultado write SetResultado;
    property Origem: Integer read FOrigem write SetOrigem;
    property Obs: String read FObs write SetObs;
    property Status: Integer read FStatus write SetStatus;
    property Data: TDateTime read FData write SetData;
    property Numero: Integer read FNumero write SetNumero;
    property Log: String read FLog write SetLog;
    property Processado: String read FProcessado write SetProcessado;
    property Valor: Double read FValor write SetValor;
    property Apuracao: String read FApuracao write SetApuracao;
    property Qtde: Integer read FQtde write SetQtde;
    function Validar: Boolean;
    function Insert: Boolean;
    function Update: Boolean;
    function Delete(sFiltro: String): Boolean;
    function getObject(sId: String; sFiltro: String): Boolean;
    function getField(sCampo: String; sColuna: String): String;
    constructor Create;
    destructor Destroy; override;
    function Periodo(sData1: String; sData2: String; iTipo: Integer): Boolean;
    function Exist: Boolean;
    function LocalizaFinanceiro(sAssinatura: String; sData: String): Boolean;
    function Consolidado(sDataInicial: String; sDataFinal: String): Boolean;
    property DataDesconto: System.TDate read FDataDesconto
      write SetDataDesconto;
    property Impressao: String read FImpressao write SetImpressao;
    property Anexo: String read FAnexo write SetAnexo;
  end;

const
  TABLENAME = 'jor_ocorrencias_jornal';

implementation

uses uGlobais, udm;

procedure TOcorrenciasJornal.SetRoteiro(val: String);
begin
  FRoteiro := val;
end;

procedure TOcorrenciasJornal.SetEntregador(val: Integer);
begin
  FEntregador := val;
end;

procedure TOcorrenciasJornal.SetAssinatura(val: String);
begin
  FAssinatura := val;
end;

procedure TOcorrenciasJornal.SetNome(val: String);
begin
  FNome := val;
end;

procedure TOcorrenciasJornal.SetProduto(val: String);
begin
  FProduto := val;
end;

procedure TOcorrenciasJornal.SetOcorrencia(val: Integer);
begin
  FOcorrencia := val;
end;

procedure TOcorrenciasJornal.SetReincidencia(val: String);
begin
  FReincidencia := val;
end;

procedure TOcorrenciasJornal.SetDescricao(val: String);
begin
  FDescricao := val;
end;

procedure TOcorrenciasJornal.SetEndereco(val: String);
begin
  FEndereco := val;
end;

procedure TOcorrenciasJornal.SetRetorno(val: String);
begin
  FRetorno := val;
end;

procedure TOcorrenciasJornal.SetResultado(val: Integer);
begin
  FResultado := val;
end;

procedure TOcorrenciasJornal.SetOrigem(val: Integer);
begin
  FOrigem := val;
end;

procedure TOcorrenciasJornal.SetObs(val: String);
begin
  FObs := val;
end;

procedure TOcorrenciasJornal.SetStatus(val: Integer);
begin
  FStatus := val;
end;

procedure TOcorrenciasJornal.SetData(val: TDateTime);
begin
  FData := val;
end;

procedure TOcorrenciasJornal.SetNumero(val: Integer);
begin
  FNumero := val;
end;

procedure TOcorrenciasJornal.SetLog(val: String);
begin
  FLog := val;
end;

procedure TOcorrenciasJornal.SetProcessado(val: String);
begin
  FProcessado := val;
end;

procedure TOcorrenciasJornal.SetValor(val: Double);
begin
  FValor := val;
end;

procedure TOcorrenciasJornal.SetApuracao(val: String);
begin
  FApuracao := val;
end;

procedure TOcorrenciasJornal.SetQtde(val: Integer);
begin
  FQtde := val;
end;

procedure TOcorrenciasJornal.SetDataDesconto(val: System.TDate);
begin
  FDataDesconto := val;
end;

procedure TOcorrenciasJornal.SetImpressao(val: String);
begin
  FImpressao := Val;
end;

procedure TOcorrenciasJornal.SetAnexo(val: String);
begin
  FAnexo := Val;
end;

function TOcorrenciasJornal.Validar: Boolean;
begin
  try
    Result := False;
    if Self.Roteiro.IsEmpty then
    begin
      MessageDlg('Informe o Roteiro!',mtWarning,[mbOK],0);
      Exit;
    end;
    if Self.Assinatura.IsEmpty then
    begin
      MessageDlg('Informe o Código da Assinatura!',mtWarning,[mbOK],0);
      Exit;
    end;
    if Self.Nome.IsEmpty then
    begin
      MessageDlg('Informe o Nome do Assinante!',mtWarning,[mbOK],0);
      Exit;
    end;
    if Self.Produto.IsEmpty then
    begin
      MessageDlg('Informe o Produto!',mtWarning,[mbOK],0);
      Exit;
    end;
    if Self.Ocorrencia = 0 then
    begin
      MessageDlg('Informe a Ocorrência!',mtWarning,[mbOK],0);
      Exit;
    end;
    if Self.Reincidencia.IsEmpty then
    begin
      MessageDlg('Informe se há reincidência!',mtWarning,[mbOK],0);
      Exit;
    end;
    if Self.Data = 0 then
    begin
      MessageDlg('Informe a data!',mtWarning,[mbOK],0);
      Exit;
    end;
    Result := True;
  except on E: Exception do
    begin
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

constructor TOcorrenciasJornal.Create;
begin
  inherited Create;
  conexao :=  TConexao.Create;
end;

destructor TOcorrenciasJornal.Destroy;
begin
  conexao.Free;
  inherited Destroy;
end;

function TOcorrenciasJornal.Insert: Boolean;
begin
  try
    Result := False;
    if (not conexao.VerifyConnZEOS(0)) then begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados!', mtError, [mbCancel], 0);
      Exit;
    end;
    if dm.qryCRUD.Active then begin
      dm.qryCRUD.Close;
    end;
    dm.qryCRUD.SQL.Clear;
    dm.qryCRUD.SQL.Text :=  'INSERT INTO ' + TABLENAME + '(' +
                            'DAT_OCORRENCIA, ' +
                            'COD_ASSINATURA, ' +
                            'NOM_ASSINANTE, ' +
                            'DES_ROTEIRO, ' +
                            'COD_ENTREGADOR, ' +
                            'COD_PRODUTO, ' +
                            'COD_OCORRENCIA, ' +
                            'DOM_REINCIDENTE, ' +
                            'DES_DESCRICAO, ' +
                            'DES_ENDERECO, ' +
                            'DES_RETORNO, ' +
                            'COD_RESULTADO, ' +
                            'COD_ORIGEM, ' +
                            'DES_OBS, ' +
                            'COD_STATUS, ' +
                            'DES_APURACAO, ' +
                            'DOM_PROCESSADO, ' +
                            'QTD_OCORRENCIAS, ' +
                            'VAL_OCORRENCIA, ' +
                            'DAT_DESCONTO, ' +
                            'DOM_IMPRESSAO, ' +
                            'DES_ANEXO,' +
                            'DES_LOG) ' +
                            'VALUES ' +
                            '(:DATA, ' +
                            ':ASSINATURA, ' +
                            ':NOME, ' +
                            ':ROTEIRO, ' +
                            ':ENTREGADOR, ' +
                            ':PRODUTO, ' +
                            ':OCORRENCIA, ' +
                            ':REINCIDENTE, ' +
                            ':DESCRICAO, ' +
                            ':ENDERECO, ' +
                            ':RETORNO, ' +
                            ':RESULTADO, ' +
                            ':ORIGEM, ' +
                            ':OBS, ' +
                            ':STATUS, ' +
                            ':APURACAO, ' +
                            ':PROCESSADO, ' +
                            ':QTDE, ' +
                            ':VALOR, ' +
                            ':DATADESCONTO, ' +
                            ':IMPRESSAO, ' +
                            ':ANEXO, ' +
                            ':LOG);';

    dm.qryCRUD.ParamByName('DATA').AsDate := Self.Data;
    dm.qryCRUD.ParamByName('ASSINATURA').AsString := Self.Assinatura;
    dm.qryCRUD.ParamByName('NOME').AsString := Self.Nome;
    dm.qryCRUD.ParamByName('ROTEIRO').AsString := Self.Roteiro;
    dm.qryCRUD.ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
    dm.qryCRUD.ParamByName('PRODUTO').AsString := Self.Produto;
    dm.qryCRUD.ParamByName('OCORRENCIA').AsInteger := Self.Ocorrencia;
    dm.qryCRUD.ParamByName('REINCIDENTE').AsString := Self.Reincidencia;
    dm.qryCRUD.ParamByName('DESCRICAO').AsString := Self.Descricao;
    dm.qryCRUD.ParamByName('ENDERECO').AsString := Self.Endereco;
    dm.qryCRUD.ParamByName('RETORNO').AsString := Self.Retorno;
    dm.qryCRUD.ParamByName('RESULTADO').AsInteger := Self.Resultado;
    dm.qryCRUD.ParamByName('ORIGEM').AsInteger := Self.Origem;
    dm.qryCRUD.ParamByName('OBS').AsString := Self.Obs;
    dm.qryCRUD.ParamByName('STATUS').AsInteger := Self.Status;
    dm.qryCRUD.ParamByName('APURACAO').AsString := Self.Apuracao;
    dm.qryCRUD.ParamByName('PROCESSADO').AsString := Self.Processado;
    dm.qryCRUD.ParamByName('QTDE').AsInteger := Self.Qtde;
    dm.qryCRUD.ParamByName('VALOR').AsFloat := Self.Valor;
    dm.qryCRUD.ParamByName('DATADESCONTO').AsDate := Self.DataDesconto;
    dm.qryCRUD.ParamByName('IMPRESSAO').AsString := Self.Impressao;
    dm.qryCRUD.ParamByName('ANEXO').AsString := Self.Anexo;
    dm.qryCRUD.ParamByName('LOG').AsString := Self.Log;
    dm.ZConn.PingServer;
    dm.qryCRUD.ExecSQL;
    dm.qryCRUD.Close;
    dm.qryCRUD.SQL.Clear;
    Result := True;
  except on E: Exception do
    begin
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

function TOcorrenciasJornal.Update: Boolean;
begin
  try
    Result := False;
    if (not conexao.VerifyConnZEOS(0)) then begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados!', mtError, [mbCancel], 0);
      Exit;
    end;
    if dm.qryCRUD.Active then begin
      dm.qryCRUD.Close;
    end;
    dm.qryCRUD.SQL.Clear;
    dm.qryCRUD.SQL.Text :=  'UPDATE ' + TABLENAME + ' SET ' +
                            'DAT_OCORRENCIA = :DATA, ' +
                            'COD_ASSINATURA = :ASSINATURA, ' +
                            'NOM_ASSINANTE = :NOME, ' +
                            'DES_ROTEIRO = :ROTEIRO, ' +
                            'COD_ENTREGADOR = :ENTREGADOR, ' +
                            'COD_PRODUTO = :PRODUTO, ' +
                            'COD_OCORRENCIA = :OCORRENCIA, ' +
                            'DOM_REINCIDENTE = :REINCIDENTE, ' +
                            'DES_DESCRICAO = :DESCRICAO, ' +
                            'DES_ENDERECO = :ENDERECO, ' +
                            'DES_RETORNO = :RETORNO, ' +
                            'COD_RESULTADO = :RESULTADO, ' +
                            'COD_ORIGEM = :ORIGEM, ' +
                            'DES_OBS = :OBS, ' +
                            'COD_STATUS = :STATUS, ' +
                            'DES_APURACAO = :APURACAO, ' +
                            'DOM_PROCESSADO = :PROCESSADO, ' +
                            'QTD_OCORRENCIAS = :QTDE, ' +
                            'VAL_OCORRENCIA = :VALOR, ' +
                            'DAT_DESCONTO = :DATADESCONTO, ' +
                            'DOM_IMPRESSAO = :IMPRESSAO, ' +
                            'DES_ANEXO = :ANEXO, ' +
                            'DES_LOG = :LOG ' +
                            'WHERE NUM_OCORRENCIA = :NUMERO;';

    dm.qryCRUD.ParamByName('NUMERO').AsInteger := Self.Numero;
    dm.qryCRUD.ParamByName('DATA').AsDate := Self.Data;
    dm.qryCRUD.ParamByName('ASSINATURA').AsString := Self.Assinatura;
    dm.qryCRUD.ParamByName('NOME').AsString := Self.Nome;
    dm.qryCRUD.ParamByName('ROTEIRO').AsString := Self.Roteiro;
    dm.qryCRUD.ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
    dm.qryCRUD.ParamByName('PRODUTO').AsString := Self.Produto;
    dm.qryCRUD.ParamByName('OCORRENCIA').AsInteger := Self.Ocorrencia;
    dm.qryCRUD.ParamByName('REINCIDENTE').AsString := Self.Reincidencia;
    dm.qryCRUD.ParamByName('DESCRICAO').AsString := Self.Descricao;
    dm.qryCRUD.ParamByName('ENDERECO').AsString := Self.Endereco;
    dm.qryCRUD.ParamByName('RETORNO').AsString := Self.Retorno;
    dm.qryCRUD.ParamByName('RESULTADO').AsInteger := Self.Resultado;
    dm.qryCRUD.ParamByName('ORIGEM').AsInteger := Self.Origem;
    dm.qryCRUD.ParamByName('OBS').AsString := Self.Obs;
    dm.qryCRUD.ParamByName('STATUS').AsInteger := Self.Status;
    dm.qryCRUD.ParamByName('APURACAO').AsString := Self.Apuracao;
    dm.qryCRUD.ParamByName('PROCESSADO').AsString := Self.Processado;
    dm.qryCRUD.ParamByName('QTDE').AsInteger := Self.Qtde;
    dm.qryCRUD.ParamByName('VALOR').AsFloat := Self.Valor;
    dm.qryCRUD.ParamByName('DATADESCONTO').AsDate := Self.DataDesconto;
    dm.qryCRUD.ParamByName('IMPRESSAO').AsString := Self.Impressao;
    dm.qryCRUD.ParamByName('ANEXO').AsString := Self.Anexo;
    dm.qryCRUD.ParamByName('LOG').AsString := Self.Log;
    dm.ZConn.PingServer;
    dm.qryCRUD.ExecSQL;
    dm.qryCRUD.Close;
    dm.qryCRUD.SQL.Clear;
    Result := True;
  except on E: Exception do
    begin
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

function TOcorrenciasJornal.Delete(sFiltro: String): Boolean;
begin
  try
    Result := False;
    if sFiltro.IsEmpty then
    begin
      Exit;
    end;
    if (not conexao.VerifyConnZEOS(0)) then
    begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados!', mtError, [mbCancel], 0);
      Exit;
    end;
    dm.QryCRUD.Close;
    dm.QryCRUD.SQL.Clear;
    dm.QryCRUD.SQL.Add('DELETE FROM ' + TABLENAME);
    if sFiltro = 'NUMERO' then
    begin
      dm.QryCRUD.SQL.Add('WHERE NUM_OCORRENCIA = :NUMERO');
      dm.QryCRUD.ParamByName('NUMERO').AsInteger := Self.Numero;
    end
    else if sFiltro = 'ASSINATURA' then
    begin
      dm.QryCRUD.SQL.Add('WHERE COD_ASSINATURA = :ASSINATURA');
      dm.QryCRUD.ParamByName('ASSINATURA').AsString := Self.Assinatura;
    end
    else if sFiltro = 'DATA' then
    begin
      dm.QryCRUD.SQL.Add('WHERE DAT_OCORRENCIA = :DATA');
      dm.QryCRUD.ParamByName('DATA').AsDate := Self.Data;
    end
    else if sFiltro = 'DESCONTO' then
    begin
      dm.QryCRUD.SQL.Add('WHERE DAT_DESCONTO = :DATA');
      dm.QryCRUD.ParamByName('DATA').AsDate := Self.DataDesconto;
    end
    else if sFiltro = 'ROTEIRO' then
    begin
      dm.QryCRUD.SQL.Add('WHERE DES_ROTEIRO = :ROTEIRO');
      dm.QryCRUD.ParamByName('ROTEIRO').AsString := Self.Roteiro;
    end;
    dm.ZConn.PingServer;
    dm.QryCRUD.ExecSQL;
    dm.QryCRUD.Close;
    dm.QryCRUD.SQL.Clear;
    Result := True;
  Except on E: Exception do
    ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' + E.Message);
  end;
end;

function TOcorrenciasJornal.getObject(sId: String; sFiltro: String): Boolean;
begin
  try
    Result := False;
    if (not conexao.VerifyConnZEOS(0)) then
    begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados!', mtError, [mbCancel], 0);
      Exit;
    end;
    dm.QryGetObject.Close;
    dm.QryGetObject.SQL.Clear;
    dm.QryGetObject.SQL.Add('SELECT * FROM ' + TABLENAME);
    if sFiltro = 'NUMERO' then
    begin
      dm.QryGetObject.SQL.Add('WHERE NUM_OCORRENCIA = :NUMERO');
      dm.QryGetObject.ParamByName('NUMERO').AsInteger :=  StrToInt(sId);
    end
    else if sFiltro = 'ASSINATURA' then
    begin
      dm.QryGetObject.SQL.Add('WHERE COD_ASSINATURA = :ASSINATURA');
      dm.QryGetObject.ParamByName('ASSINATURA').AsString :=  sId;
    end
    else if sFiltro = 'ROTEIRO' then
    begin
      dm.QryGetObject.SQL.Add('WHERE DES_ROTEIRO = :ROTEIRO');
      dm.QryGetObject.ParamByName('ROTEIRO').AsString :=  sId;
    end
    else if sFiltro = 'ENDERECO' then
    begin
      dm.QryGetObject.SQL.Add('WHERE DES_LOGRADOURO LIKE :ENDERECO');
      dm.QryGetObject.ParamByName('ENDERECO').AsString :=  '%' +  sId + '%';
    end
    else if sFiltro = 'CHAVE' then
    begin
      dm.QryGetObject.SQL.Add('WHERE COD_ASSINATURA = :ASSINATURA ');
      dm.QryGetObject.SQL.Add('AND COD_PRODUTO = :PRODUTO ');
      dm.QryGetObject.SQL.Add('AND DES_ROTEIRO = :ROTEIRO ');
      dm.QryGetObject.SQL.Add('AND COD_OCORRENCIA = :OCORRENCIA ');
      dm.QryGetObject.SQL.Add('AND DAT_OCORRENCIA = :DATA ');
      dm.QryGetObject.ParamByName('ASSINATURA').AsString :=  Self.Assinatura;
      dm.QryGetObject.ParamByName('PRODUTO').AsString :=  Self.Produto;
      dm.QryGetObject.ParamByName('ROTEIRO').AsString :=  Self.Roteiro;
      dm.QryGetObject.ParamByName('OCORRENCIA').AsInteger :=  Self.Ocorrencia;
      dm.QryGetObject.ParamByName('DATA').AsDateTime :=  Self.Data;
    end;
    dm.ZConn.PingServer;
    dm.QryGetObject.Open;
    if (not dm.QryGetObject.IsEmpty) then
    begin
      dm.QryGetObject.First;
      Self.Numero := dm.QryGetObject.FieldByName('NUM_OCORRENCIA').AsInteger;
      Self.Data := dm.QryGetObject.FieldByName('DAT_OCORRENCIA').AsDateTime;
      Self.Assinatura := dm.QryGetObject.FieldByName('COD_ASSINATURA').AsString;
      Self.Nome := dm.QryGetObject.FieldByName('NOM_ASSINATURA').AsString;
      Self.Roteiro := dm.QryGetObject.FieldByName('DES_ROTEIRO').AsString;
      Self.Entregador := dm.QryGetObject.FieldByName('ENTREGADOR').AsInteger;
      Self.Produto := dm.QryGetObject.FieldByName('COD_PRODUTO').AsString;
      Self.Ocorrencia := dm.QryGetObject.FieldByName('COD_OCORRENCIA').AsInteger;
      Self.Reincidencia := dm.QryGetObject.FieldByName('DOM_REINCIDENTE').AsString;
      Self.Descricao := dm.QryGetObject.FieldByName('DES_DESCRICAO').AsString;
      Self.Endereco := dm.QryGetObject.FieldByName('DES_ENDERECO').AsString;
      Self.Retorno := dm.QryGetObject.FieldByName('DES_RETORNO').AsString;
      Self.Resultado := dm.QryGetObject.FieldByName('COD_RESULTADO').AsInteger;
      Self.Origem := dm.QryGetObject.FieldByName('COD_ORIGEM').AsInteger;
      Self.Obs := dm.QryGetObject.FieldByName('DES_OBS').AsString;
      Self.Status := dm.QryGetObject.FieldByName('COD_STATUS').AsInteger;
      Self.Apuracao := dm.QryGetObject.FieldByName('DES_APURACAO').AsString;
      Self.Processado := dm.QryGetObject.FieldByName('DOM_PROCESSADO').AsString;
      Self.Qtde := dm.QryGetObject.FieldByName('QTD_OCORRENCIAS').AsInteger;
      Self.Valor := dm.QryGetObject.FieldByName('VAL_OCORRENCIA').AsFloat;
      Self.DataDesconto := dm.QryGetObject.FieldByName('DAT_DESCONTO').AsDateTime;
      Self.Impressao := dm.QryGetObject.FieldByName('DOM_IMPRESSAO').AsString;
      Self.Anexo := dm.QryGetObject.FieldByName('DES_ANEXO').AsString;
      Self.Log := dm.QryGetObject.FieldByName('DES_LOG').AsString;
      Result  :=  True;
      Exit;
    end;
    dm.QryGetObject.Close;
    dm.QryGetObject.SQL.Clear;
  except on E: Exception do
    ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' + E.Message);
  end;
end;

function TOcorrenciasJornal.getField(sCampo: String; sColuna: String): String;
begin
  try
    Result  :=  '';
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
    dm.qryFields.Close;
    dm.qryFields.SQL.Clear;
    dm.qryFields.SQL.Add('SELECT ' + sCampo + ' FROM ' + TABLENAME);
    if sColuna = 'CODIGO' then
    begin
      dm.qryFields.SQL.Add('WHERE NUM_OCORRENCIA = :NUMERO');
      dm.qryFields.ParamByName('NUMERO').AsInteger := Self.Numero;
    end
    else if sColuna = 'ASSINATURA' then
    begin
      dm.qryFields.SQL.Add('WHERE COD_ASSINATURA = :ASSINATURA');
      dm.qryFields.ParamByName('ASSINATURA').AsString :=  Self.Assinatura;
    end
    else if sColuna = 'ROTEIRO' then
    begin
      dm.qryFields.SQL.Add('WHERE DES_ROTEIRO = :ROTEIRO');
      dm.qryFields.ParamByName('ROTEIRO').AsString :=  Self.Roteiro;
    end
    else if sColuna = 'NOME' then
    begin
      dm.qryFields.SQL.Add('WHERE NOM_ASSINANTE = :NOME');
      dm.qryFields.ParamByName('NOME').AsString :=  Self.Nome;
    end;
    dm.ZConn.PingServer;
    dm.qryFields.Open;
    dm.qryFields.Open;
    if (not dm.qryFields.IsEmpty) then begin
      dm.qryFields.First;
      Result  :=  dm.qryFields.FieldByName(sCampo).AsString;
    end;
    dm.qryFields.Close;
    dm.qryFields.SQL.Clear;
  Except on E: Exception do
    ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' + E.Message);
  end;
end;

function TOcorrenciasJornal.Periodo(sData1: String; sData2: String; iTipo: Integer): Boolean;
begin
  Result := False;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados!', mtError, [mbCancel], 0);
    Exit;
  end;
  dm.QryPesquisa.Close;
  dm.QryPesquisa.SQL.Clear;
  dm.QryPesquisa.SQL.Add('SELECT * FROM ' + TABLENAME);
  if iTipo = 4 then
  begin
    dm.QryPesquisa.SQL.Add('WHERE DAT_DESCONTO BETWEEN :DATA1 AND :DATA2 ');
    dm.QryPesquisa.SQL.Add('AND COD_STATUS = :STATUS');
    dm.QryPesquisa.ParamByName('DATA1').AsDate :=  StrToDate(sData1);
    dm.QryPesquisa.ParamByName('DATA2').AsDate :=  StrToDate(sData2);
    dm.QryPesquisa.ParamByName('STATUS').AsInteger :=  iTipo;
  end
  else
  begin
    if (not sData1.IsEmpty) and (not sData2.IsEmpty) then
    begin
      dm.QryPesquisa.SQL.Add('WHERE DAT_OCORRENCIA BETWEEN :DATA1 AND :DATA2 ');
      dm.QryPesquisa.ParamByName('DATA1').AsDate :=  StrToDate(sData1);
      dm.QryPesquisa.ParamByName('DATA2').AsDate :=  StrToDate(sData2);
      if iTipo <> 5 then
      begin
        dm.QryPesquisa.SQL.Add('AND COD_STATUS = :STATUS');
        dm.QryPesquisa.ParamByName('STATUS').AsInteger :=  iTipo;
      end;
    end
    else
    begin
      dm.QryPesquisa.SQL.Add('WHERE COD_STATUS = :STATUS ');
      dm.QryPesquisa.ParamByName('STATUS').AsInteger :=  iTipo;
    end;
  end;
  dm.ZConn.PingServer;
  dm.QryPesquisa.Open;
  if dm.QryPesquisa.IsEmpty then
  begin
    dm.QryPesquisa.Close;
    dm.QryPesquisa.SQL.Clear;
    Exit;
  end;
  dm.QryPesquisa.First;
  Result := True;
end;

function TOcorrenciasJornal.Exist: Boolean;
begin
  Result := False;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados!', mtError, [mbCancel], 0);
    Exit;
  end;
  dm.QryPesquisa.Close;
  dm.QryPesquisa.SQL.Clear;
  dm.QryPesquisa.SQL.Add('SELECT * FROM ' + TABLENAME + ' ');
  dm.QryPesquisa.SQL.Add('WHERE COD_ASSINATURA = :ASSINATURA ');
  dm.QryPesquisa.SQL.Add('AND COD_PRODUTO = :PRODUTO ');
  dm.QryPesquisa.SQL.Add('AND DES_ROTEIRO = :ROTEIRO ');
  dm.QryPesquisa.SQL.Add('AND COD_OCORRENCIA = :OCORRENCIA ');
  dm.QryPesquisa.SQL.Add('AND DAT_OCORRENCIA = :DATA ');
  dm.QryPesquisa.SQL.Add('AND COD_ENTREGADOR = :ENTREGADOR ');
  dm.QryPesquisa.ParamByName('ASSINATURA').AsString :=  Self.Assinatura;
  dm.QryPesquisa.ParamByName('PRODUTO').AsString :=  Self.Produto;
  dm.QryPesquisa.ParamByName('ROTEIRO').AsString :=  Self.Roteiro;
  dm.QryPesquisa.ParamByName('OCORRENCIA').AsInteger :=  Self.Ocorrencia;
  dm.QryPesquisa.ParamByName('DATA').AsDateTime :=  Self.Data;
  dm.QryPesquisa.ParamByName('ENTREGADOR').AsInteger :=  Self.Entregador;
  dm.ZConn.PingServer;
  dm.QryPesquisa.Open;
  if dm.QryPesquisa.IsEmpty then
  begin
    dm.QryPesquisa.Close;
    dm.QryPesquisa.SQL.Clear;
    Exit;
  end;
  Self.Numero := dm.qryPesquisa.FieldByName('NUM_OCORRENCIA').AsInteger;
  dm.QryPesquisa.Close;
  dm.QryPesquisa.SQL.Clear;
  Result := True;
end;

function TOcorrenciasJornal.LocalizaFinanceiro(sAssinatura: String; sData: String): Boolean;
begin
  Result := False;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados!', mtError, [mbCancel], 0);
    Exit;
  end;
  dm.QryPesquisa.Close;
  dm.QryPesquisa.SQL.Clear;
  dm.QryPesquisa.SQL.Add('SELECT * FROM ' + TABLENAME + ' ');
  dm.QryPesquisa.SQL.Add('WHERE COD_ASSINATURA LIKE :ASSINATURA AND DES_DESCRICAO LIKE :DATA');
  dm.QryPesquisa.ParamByName('ASSINATURA').AsString := '%' + sAssinatura;
  dm.QryPesquisa.ParamByName('DATA').AsString :=  '%' +  sData + '%';
  dm.ZConn.PingServer;
  dm.QryPesquisa.Open;
  if dm.QryPesquisa.IsEmpty then
  begin
    dm.QryPesquisa.Close;
    dm.QryPesquisa.SQL.Clear;
    Exit;
  end;
  dm.QryPesquisa.First;
  Self.Numero := dm.qryPesquisa.FieldByName('NUM_OCORRENCIA').AsInteger;
  Self.Data := dm.qryPesquisa.FieldByName('DAT_OCORRENCIA').AsDateTime;
  Self.Assinatura := dm.qryPesquisa.FieldByName('COD_ASSINATURA').AsString;
  Self.Nome := dm.qryPesquisa.FieldByName('NOM_ASSINANTE').AsString;
  Self.Roteiro := dm.qryPesquisa.FieldByName('DES_ROTEIRO').AsString;
  Self.Entregador := dm.qryPesquisa.FieldByName('COD_ENTREGADOR').AsInteger;
  Self.Produto := dm.qryPesquisa.FieldByName('COD_PRODUTO').AsString;
  Self.Ocorrencia := dm.qryPesquisa.FieldByName('COD_OCORRENCIA').AsInteger;
  Self.Reincidencia := dm.qryPesquisa.FieldByName('DOM_REINCIDENTE').AsString;
  Self.Descricao := dm.qryPesquisa.FieldByName('DES_DESCRICAO').AsString;
  Self.Endereco := dm.qryPesquisa.FieldByName('DES_ENDERECO').AsString;
  Self.Retorno := dm.qryPesquisa.FieldByName('DES_RETORNO').AsString;
  Self.Resultado := dm.qryPesquisa.FieldByName('COD_RESULTADO').AsInteger;
  Self.Origem := dm.qryPesquisa.FieldByName('COD_ORIGEM').AsInteger;
  Self.Obs := dm.qryPesquisa.FieldByName('DES_OBS').AsString;
  Self.Status := dm.qryPesquisa.FieldByName('COD_STATUS').AsInteger;
  Self.Apuracao := dm.qryPesquisa.FieldByName('DES_APURACAO').AsString;
  Self.Processado := dm.qryPesquisa.FieldByName('DOM_PROCESSADO').AsString;
  Self.Qtde := dm.qryPesquisa.FieldByName('QTD_OCORRENCIAS').AsInteger;
  Self.Valor := dm.qryPesquisa.FieldByName('VAL_OCORRENCIA').AsFloat;
  Self.DataDesconto := dm.qryPesquisa.FieldByName('DAT_DESCONTO').AsDateTime;
  Self.Impressao := dm.qryPesquisa.FieldByName('DOM_IMPRESSAO').AsString;
  Self.Anexo := dm.qryPesquisa.FieldByName('DES_ANEXO').AsString;
  Self.Log := dm.qryPesquisa.FieldByName('DES_LOG').AsString;
  Result := True;
end;

function TOcorrenciasJornal.Consolidado(sDataInicial: String; sDataFinal: String): Boolean;
var
  sSQL: string;
begin
  Result := False;
  sSQL := 'SELECT A.DES_ROTEIRO, SUM(B.VAL_OCORRENCIA) AS VAL_OCORRENCIA ' +
          'FROM jor_roteiro_entregador AS A ' +
          'LEFT JOIN jor_ocorrencias_jornal AS B ' +
          'ON B.DES_ROTEIRO = A.COD_ROTEIRO_ANTIGO ' +
          'WHERE B.DAT_DESCONTO BETWEEN :DATAINI AND :DATAFIM AND A.DOM_MOSTRAR = :MOSTRAR ' +
          'GROUP BY A.DES_ROTEIRO';
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados!', mtError, [mbCancel], 0);
    Exit;
  end;
  dm.qryCalculo.Close;
  dm.qryCalculo.SQL.Clear;
  dm.qryCalculo.SQL.Text := sSQL;
  dm.qryCalculo.ParamByName('DATAINI').AsDate := StrToDate(sDataInicial);
  dm.qryCalculo.ParamByName('DATAFIM').AsDate := StrToDate(sDataFinal);
  dm.qryCalculo.ParamByName('MOSTRAR').AsString := 'N';
  dm.ZConn.PingServer;
  dm.qryCalculo.Open;
  if dm.qryCalculo.IsEmpty then
  begin
    dm.qryCalculo.Close;
    dm.qryCalculo.SQL.Clear;
    Exit;
  end;
  Result := True;
end;

end.
