unit clFinanceiroEmpresa;

interface

uses clConexao, Vcl.Dialogs, System.SysUtils, clBancos;

type
  TFinanceiroEmpresa = class(TObject)
  protected
    FConta: String;
    FAgencia: String;
    FBanco: String;
    FTipoConta: String;
    FSequencia: Integer;
    FEmpresa: Integer;
    FPadrao: String;
    FForma: String;
    FCNPJ: String;
    FFavorecido: String;
    conexao: TConexao;
    bancos: TBancos;
  private
    procedure SetEmpresa(val: Integer);
    procedure SetSequencia(val: Integer);
    procedure SetTipoConta(val: String);
    procedure SetBanco(val: String);
    procedure SetAgencia(val: String);
    procedure SetConta(val: String);
    procedure SetFavorecido(val: String);
    procedure SetCNPJ(val: String);
    procedure SetForma(val: String);
    procedure SetPadrao(val: String);
  public
    constructor Create;
    property Empresa: Integer read FEmpresa write SetEmpresa;
    property Sequencia: Integer read FSequencia write SetSequencia;
    property TipoConta: String read FTipoConta write SetTipoConta;
    property Banco: String read FBanco write SetBanco;
    property Agencia: String read FAgencia write SetAgencia;
    property Conta: String read FConta write SetConta;
    property Favorecido: String read FFavorecido write SetFavorecido;
    property CNPJ: String read FCNPJ write SetCNPJ;
    property Forma: String read FForma write SetForma;
    property Padrao: String read FPadrao write SetPadrao;
    procedure MaxSeq;
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

  TABLENAME = 'cad_financeiro_empresa';

implementation

uses udm, clUtil;

constructor TFinanceiroEmpresa.Create;
begin
  inherited Create;
  conexao := TConexao.Create;
  bancos := TBancos.Create;
end;

procedure TFinanceiroEmpresa.SetEmpresa(val: Integer);
begin
  FEmpresa  :=  val;
end;

procedure TFinanceiroEmpresa.SetSequencia(val: Integer);
begin
  FSequencia  :=  val;
end;

procedure TFinanceiroEmpresa.SetTipoConta(val: String);
begin
  FTipoConta := val;
end;

procedure TFinanceiroEmpresa.SetBanco(val: String);
begin
  FBanco := val;
end;

procedure TFinanceiroEmpresa.SetAgencia(val: String);
begin
  FAgencia := val;
end;

procedure TFinanceiroEmpresa.SetConta(val: String);
begin
  FConta := val;
end;

procedure TFinanceiroEmpresa.SetFavorecido(val: String);
begin
  FFavorecido := val;
end;

procedure TFinanceiroEmpresa.SetCNPJ(val: String);
begin
  FCNPJ := val;
end;

procedure TFinanceiroEmpresa.SetForma(val: String);
begin
  FForma := val;
end;

procedure TFinanceiroEmpresa.SetPadrao(val: String);
begin
  FPadrao :=  val;
end;

procedure TFinanceiroEmpresa.MaxSeq;
begin
  try
    if (not conexao.VerifyConnZEOS(0)) then begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados!', mtError, [mbCancel], 0);
      Exit;
    end;
    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT MAX(SEQ_FINANCEIRO) AS SEQUENCIA FROM ' + TABLENAME +
        ' WHERE COD_ENTREGADOR = :CODIGO';
      ParamByName('CODIGO').AsString := IntToStr(Self.Empresa);
      dm.ZConn.PingServer;
      Open;
      if not(IsEmpty) then
      begin
        First;
      end;
    end;

    Self.Sequencia := (dm.QryGetObject.FieldByName('SEQUENCIA').AsInteger) + 1;

    dm.QryGetObject.Close;
    dm.QryGetObject.SQL.Clear;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TFinanceiroEmpresa.Validar: Boolean;
begin
  Result  :=  False;
  if Self.Empresa = 0 then
  begin
    MessageDlg('Código de Empresa inválido!',mtWarning,[mbCancel],0);
    Exit;
  end;
  if Self.Sequencia = 0 then
  begin
    MessageDlg('Sequência inválida!',mtWarning,[mbCancel],0);
    Exit;
  end;
  if Self.TipoConta.IsEmpty then
  begin
    MessageDlg('Informe o Tipo de Conta!',mtWarning,[mbCancel],0);
    Exit;
  end;
  if Self.Banco.IsEmpty then
  begin
    MessageDlg('Informe o Banco da Conta!',mtWarning,[mbCancel],0);
    Exit;
  end
  else
  begin
    if Self.Bancos.getObject(Self.Banco,'CODIGO') then
    begin
      MessageDlg('Banco não cadastrado!',mtWarning,[mbCancel],0);
      dm.qryGetObject.Close;
      dm.qryGetObject.SQL.Clear;
      Exit;
    end;
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
  end;
  if Self.Agencia.IsEmpty then
  begin
    MessageDlg('Informe a Agência do Banco!',mtWarning,[mbCancel],0);
    Exit;
  end;
  if Self.Conta.IsEmpty then
  begin
    MessageDlg('Informe o Número da Conta!',mtWarning,[mbCancel],0);
    Exit;
  end;
  if Self.Favorecido.IsEmpty then
  begin
    MessageDlg('Informe o Nome do Favorecido!',mtWarning,[mbCancel],0);
    Exit;
  end;
  if Self.CNPJ.IsEmpty then
  begin
    MessageDlg('Informe o CPF ou CNPJ do Favorecido!',mtWarning,[mbCancel],0);
    Exit;
  end
  else
  begin
    if (not TUtil.CPF(Self.CNPJ)) then
    begin
      if (not TUtil.CNPJ(Self.CNPJ)) then
      begin
        MessageDlg('CPF ou CNPJ do Favorecido inválido!',mtWarning,[mbCancel],0);
        Exit;
      end;
    end;
  end;
  Result  :=  True;
end;

function TFinanceiroEmpresa.Insert: Boolean;
begin
  Try
    Result := False;
    MaxSeq;
    if (not conexao.VerifyConnZEOS(0)) then begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados!', mtError, [mbCancel], 0);
      Exit;
    end;
    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'INSERT INTO ' + TABLENAME + '(' +
                  'COD_EMPRESA, ' +
                  'SEQ_FINANCEIRO, ' +
                  'DES_TIPO_CONTA, ' +
                  'COD_BANCO, ' +
                  'COD_AGENCIA, ' +
                  'NUM_CONTA, ' +
                  'NOM_FAVORECIDO, ' +
                  'NUM_CPF_CNPJ, ' +
                  'DES_FORMA_PAGAMENTO, ' +
                  'DOM_PADRAO) ' +
                  'VALUES (' +
                  ':CODIGO, ' +
                  ':SEQUENCIA, ' +
                  ':TIPOCONTA, ' +
                  ':BANCO, ' +
                  ':AGENCIA, ' +
                  ':CONTA, ' +
                  ':FAVORECIDO, ' +
                  ':CPFCNPJ, ' +
                  ':FORMA, ' +
                  ':PADRAO)';
      ParamByName('CODIGO').AsInteger :=Self.Empresa;
      ParamByName('SEQUENCIA').AsInteger := Self.Sequencia;
      ParamByName('TIPOCONTA').AsString := Self.TipoConta;
      ParamByName('BANCO').AsString := Self.Banco;
      ParamByName('AGENCIA').AsString := Self.Agencia;
      ParamByName('CONTA').AsString := Self.Conta;
      ParamByName('FAVORECIDO').AsString := Self.Favorecido;
      ParamByName('CPFCNPJ').AsString := Self.CNPJ;
      ParamByName('FORMA').AsString := Self.Forma;
      ParamByName('PADRAO').AsString := Self.Padrao;
      dm.ZConn.PingServer;
      ExecSQL;
      Close;
      SQL.Clear;
    end;
    Result := True;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TFinanceiroEmpresa.Update: Boolean;
begin
  try
    Result := False;
    if (not conexao.VerifyConnZEOS(0)) then begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados!', mtError, [mbCancel], 0);
      Exit;
    end;
    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'UPDATE ' + TABLENAME + ' SET ' +
                  'DES_TIPO_CONTA = :TIPOCONTA, ' +
                  'COD_BANCO = :BANCO, ' +
                  'COD_AGENCIA = :AGENCIA, ' +
                  'NUM_CONTA = :CONTA, ' +
                  'NOM_FAVORECIDO = :FAVORECIDO, ' +
                  'NUM_CPF_CNPJ = :CPFCNPJ, ' +
                  'DES_FORMA_PAGAMENTO = :FORMA, ' +
                  'DOM_PADRAO = :PADRAO ' +
                  'WHERE COD_EMPRESA = :CODIGO AND SEQ_FINANCEIRO = :SEQUENCIA';

      ParamByName('CODIGO').AsInteger :=Self.Empresa;
      ParamByName('SEQUENCIA').AsInteger := Self.Sequencia;
      ParamByName('TIPOCONTA').AsString := Self.TipoConta;
      ParamByName('BANCO').AsString := Self.Banco;
      ParamByName('AGENCIA').AsString := Self.Agencia;
      ParamByName('CONTA').AsString := Self.Conta;
      ParamByName('FAVORECIDO').AsString := Self.Favorecido;
      ParamByName('CPFCNPJ').AsString := Self.CNPJ;
      ParamByName('FORMA').AsString := Self.Forma;
      ParamByName('PADRAO').AsString := Self.Padrao;
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

function TFinanceiroEmpresa.Delete(sFiltro: String): Boolean;
begin
  Try
    Result := False;
    if (not conexao.VerifyConnZEOS(0)) then begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados!', mtError, [mbCancel], 0);
      Exit;
    end;
    if sFiltro.IsEmpty then
    begin
      Exit;
    end;
    with dm.qryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Add('DELETE FROM ' + TABLENAME);
      if sFiltro = 'CODIGO' then
      begin
        SQL.Add(' WHERE COD_EMPRESA = :CODIGO');
        ParamByName('CODIGO').AsInteger := Self.Empresa;
      end
      else if sFiltro = 'SEQUENCIA' then
      begin
        SQL.Add(' WHERE COD_EMPRESA = :CODIGO AND SEQ_FINANCEIRO = :SEQUENCIA');
        ParamByName('CODIGO').AsInteger := Self.Empresa;
        ParamByName('SEQUENCIA').AsInteger := Self.Sequencia;
      end
      else if sFiltro = 'CNPJ' then
      begin
        SQL.Add(' WHERE NUM_CPF_CNPJ = :CPFCNPJ');
        ParamByName('CPFCNPJ').AsString := Self.CNPJ;
      end
      else if sFiltro = 'BANCO' then
      begin
        SQL.Add(' WHERE COD_BANCO = :BANCO');
        ParamByName('BANCO').AsString := Self.Banco;
      end
      else if sFiltro = 'TIPO' then
      begin
        SQL.Add(' WHERE DES_TIPO_CONTA = :TIPO');
        ParamByName('TIPO').AsString := Self.TipoConta;
      end
      else if sFiltro = 'NOME' then
      begin
        SQL.Add(' WHERE NOM_FAVORECIDO = :NOME');
        ParamByName('NOME').AsString := Self.Favorecido;
      end;
      dm.ZConn.PingServer;
      ExecSQL;
      Close;
      SQL.Clear;
    end;
    Result := True;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TFinanceiroEmpresa.getObject(sId: String; sFiltro: String): Boolean;
begin
  Try
    Result := False;
    if (not conexao.VerifyConnZEOS(0)) then begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados!', mtError, [mbCancel], 0);
      Exit;
    end;
    if sId.IsEmpty then
    begin
      Exit;
    end;
    if sFiltro.IsEmpty then
    begin
      Exit;
    end;
    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);
      if sFiltro = 'CODIGO' then
      begin
        SQL.Add(' WHERE COD_EMPRESA = :CODIGO');
        ParamByName('CODIGO').AsInteger := StrToInt(sId);
      end
      else if sFiltro = 'SEQUENCIA' then
      begin
        SQL.Add(' WHERE COD_EMPRESA = :CODIGO AND SEQ_FINANCEIRO = :SEQUENCIA');
        ParamByName('CODIGO').AsInteger := Self.Empresa;
        ParamByName('SEQUENCIA').AsInteger := StrToInt(sId);
      end
      else if sFiltro = 'CNPJ' then
      begin
        SQL.Add(' WHERE NUM_CPF_CNPJ = :CPFCNPJ');
        ParamByName('CPFCNPJ').AsString := sId;
      end
      else if sFiltro = 'BANCO' then
      begin
        SQL.Add(' WHERE COD_BANCO = :BANCO');
        ParamByName('BANCO').AsString := sId;
      end
      else if sFiltro = 'TIPO' then
      begin
        SQL.Add(' WHERE DES_TIPO_CONTA = :TIPO');
        ParamByName('TIPO').AsString := sId;
      end
      else if sFiltro = 'NOME' then
      begin
        SQL.Add(' WHERE NOM_FAVORECIDO LIKE :NOME');
        ParamByName('NOME').AsString := QuotedStr('%' + sId + '%');
      end;
      dm.ZConn.PingServer;
      Open;
      if not IsEmpty then
      begin
        First;
        Self.Empresa := FieldByName('COD_EMPRESA').AsInteger;
        Self.Sequencia := FieldByName('SEQ_FINANCEIRO').AsInteger;
        Self.TipoConta := FieldByName('DES_TIPO_CONTA').AsString;
        Self.Banco := FieldByName('COD_BANCO').AsString;
        Self.Agencia := FieldByName('COD_AGENCIA').AsString;
        Self.Conta := FieldByName('NUM_CONTA').AsString;
        Self.Favorecido := FieldByName('NOM_FAVORECIDO').AsString;
        Self.CNPJ := FieldByName('NUM_CPF_CNPJ').AsString;
        Self.Forma := FieldByName('DES_FORMA_PAGAMENTO').AsString;
        Self.Padrao := FieldByName('DOM_PADRAO').AsString;
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
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TFinanceiroEmpresa.getObjects: Boolean;
begin
  Try
    Result := False;
    if (not conexao.VerifyConnZEOS(0)) then begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados!', mtError, [mbCancel], 0);
      Exit;
    end;
    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);
      dm.ZConn.PingServer;
      Open;
      if not IsEmpty then
      begin
        First;
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
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TFinanceiroEmpresa.getField(sCampo: String; sColuna: String): String;
begin
  Try
    Result := '';
    if (not conexao.VerifyConnZEOS(0)) then begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados!', mtError, [mbCancel], 0);
      Exit;
    end;
    if sCampo.IsEmpty then
    begin
      Exit;
    end;
    if sColuna.IsEmpty then
    begin
      Exit;
    end;
    with dm.qryFields do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT ' + sCampo + ' FROM ' + TABLENAME);
      if sColuna = 'CODIGO' then
      begin
        SQL.Add(' WHERE COD_EMPRESA = :CODIGO');
        ParamByName('CODIGO').AsInteger := Self.Empresa;
      end
      else if sColuna = 'SEQUENCIA' then
      begin
        SQL.Add(' WHERE COD_EMPRESA = :CODIGO AND SEQ_FINANCEIRO = :SEQUENCIA');
        ParamByName('CODIGO').AsInteger := Self.Empresa;
        ParamByName('SEQUENCIA').AsInteger := Self.Sequencia;
      end
      else if sColuna = 'CNPJ' then
      begin
        SQL.Add(' WHERE NUM_CPF_CNPJ = :CPFCNPJ');
        ParamByName('CPFCNPJ').AsString := Self.CNPJ;
      end
      else if sColuna = 'BANCO' then
      begin
        SQL.Add(' WHERE COD_BANCO = :BANCO');
        ParamByName('BANCO').AsString := Self.Banco;
      end
      else if sColuna = 'TIPO' then
      begin
        SQL.Add(' WHERE DES_TIPO_CONTA = :TIPO');
        ParamByName('TIPO').AsString := Self.TipoConta;
      end
      else if sColuna = 'NOME' then
      begin
        SQL.Add(' WHERE NOM_FAVORECIDO = :NOME');
        ParamByName('NOME').AsString := Self.Favorecido;
      end;
      dm.ZConn.PingServer;
      Open;
      if not IsEmpty then
      begin
        First;
        Result := FieldByName(sCampo).AsString;
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

destructor TFinanceiroEmpresa.Destroy;
begin
  conexao.Free;
  bancos.Free;
  inherited Destroy;
end;

end.
