unit clAgentes;

interface

uses
  clPessoaJ, clEnderecoAgente, clContatoAgente, clCEPAgentes, clConexao;

type
  TAgente = class(TPessoaJ)
  private

    function getCodigo: String;
    function getdtAlteracao: TDateTime;
    function getdtCadastro: String;
    function getObs: String;
    function getPagina: String;
    function getStatus: String;
    procedure setCodigo(const Value: String);
    procedure setdtAlteracao(const Value: TDateTime);
    procedure setdtCadastro(const Value: String);
    procedure setObs(const Value: String);
    procedure setPagina(const Value: String);
    procedure setStatus(const Value: String);
    function getCategoriaCnh: String;
    function getCnh: String;
    function getValidadeCnh: TDateTime;
    procedure setCategoriaCnh(const Value: String);
    procedure setCnh(const Value: String);
    procedure setValidadeCnh(const Value: TDateTime);
    function getOperacao: String;
    procedure setOperacao(const Value: String);
    function getContato: TContatoAgente;
    function getEndereco: TEnderecoAgente;
    procedure setContato(const Value: TContatoAgente);
    procedure setEndereco(const Value: TEnderecoAgente);
    function getCabecaCEP: TCEPAgentes;
    procedure setCabecaCEP(const Value: TCEPAgentes);
    function getVerba: Double;
    procedure setVerba(const Value: Double);
    function getCentroCusto: Integer;
    procedure setCentroCusto(const Value: Integer);
    function getGrupo: Integer;
    procedure setGrupo(const Value: Integer);

  protected

    _codigo: String;
    _pagina: String;
    _obs: String;
    _status: String;
    _dtCadastro: String;
    _dtAlteracao: TDateTime;
    _cnh: String;
    _categoriacnh: String;
    _validadecnh: TDateTime;
    _operacao: String;
    _verba: Double;
    _endereco: TEnderecoAgente;
    _contato: TContatoAgente;
    _cabecacep: TCEPAgentes;
    _centrocusto: Integer;
    _grupo: Integer;
    _conexao: TConexao;
  public
    destructor Destroy;
    property Codigo: String read getCodigo write setCodigo;
    property Pagina: String read getPagina write setPagina;
    property Obs: String read getObs write setObs;
    property Status: String read getStatus write setStatus;
    property DtCadastro: String read getdtCadastro write setdtCadastro;
    property DtAlteracaop: TDateTime read getdtAlteracao write setdtAlteracao;
    property Cnh: String read getCnh write setCnh;
    property CategoriaCnh: String read getCategoriaCnh write setCategoriaCnh;
    property ValidadeCnh: TDateTime read getValidadeCnh write setValidadeCnh;
    property Operacao: String read getOperacao write setOperacao;
    property Endereco: TEnderecoAgente read getEndereco write setEndereco;
    property Contato: TContatoAgente read getContato write setContato;
    property CabecaCEP: TCEPAgentes read getCabecaCEP write setCabecaCEP;
    property Verba: Double read getVerba write setVerba;
    property CentroCusto: Integer read getCentroCusto write setCentroCusto;
    property Grupo: Integer read getGrupo write setGrupo;

    function Validar(): Boolean;
    function Delete(filtro: String): Boolean;
    function getObject(id, filtro: String): Boolean;
    function Insert(): Boolean;
    function Update(): Boolean;
    function getObjects(): Boolean;
    function getField(campo, coluna: String): String;
    function Search(id, filtro: String): Boolean;
    constructor Create;
  end;

const
  TABLENAME = 'tbagentes';

implementation

{ TAgentes }

uses SysUtils, Dialogs, udm, clUtil, ZDataset, ZAbstractRODataset, DB, Math;

destructor TAgente.Destroy;
begin
  _endereco.Free;
  _contato.Free;
  _cabecacep.Free;
  _conexao.Free
end;

function TAgente.getCategoriaCnh: String;
begin
  Result := _categoriacnh;
end;

function TAgente.getCentroCusto: Integer;
begin
  Result := _centrocusto;
end;

function TAgente.getCnh: String;
begin
  Result := _cnh;
end;

function TAgente.getCodigo: String;
begin
  Result := _codigo;
end;

function TAgente.getdtAlteracao: TDateTime;
begin
  Result := _dtAlteracao
end;

function TAgente.getdtCadastro: String;
begin
  Result := _dtCadastro;
end;

function TAgente.getObs: String;
begin
  Result := _obs;
end;

function TAgente.getPagina: String;
begin
  Result := _pagina;
end;

function TAgente.getStatus: String;
begin
  Result := _status;
end;

function TAgente.getValidadeCnh: TDateTime;
begin
  Result := _validadecnh;
end;

function TAgente.Validar(): Boolean;
begin
  try
    Result := False;
    if TUtil.Empty(Self.Codigo) then
    begin
      MessageDlg('Informe o código do Agente!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if StrToInt(Self.Codigo) = 0 then
    begin
      MessageDlg('Código do Agente Inválido!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if Self.Operacao = 'I' then
    begin
      if not TUtil.Empty(Self.getField('COD_AGENTE', 'CODIGO')) then
      begin
        MessageDlg('Código de Agente já Cadastrado!', mtWarning, [mbOK], 0);
        Exit;
      end;
    end;
    if TUtil.Empty(Self.Razao) then
    begin
      MessageDlg('Informe o Nome ou Razão Social', mtWarning, [mbOK], 0);
      Exit;
    end;
    if TUtil.Empty(Self.Fantasia) then
    begin
      If not(TUtil.Empty(Self.Razao)) then
        Self.Fantasia := Self.Razao;
    end;
    if not(TUtil.Empty(Self.Cnpj)) then
    begin
      if Self.TipoDoc = 'CPF' then
      begin
        if not(TUtil.CPF(Self.Cnpj)) then
        begin
          MessageDlg('CPF incorreto!', mtWarning, [mbOK], 0);
          Exit;
        end;
      end
      else
      begin
        if not(TUtil.Cnpj(Self.Cnpj)) then
        begin
          MessageDlg('CNPJ incorreto!', mtWarning, [mbOK], 0);
          Exit;
        end;
      end;
    end;
    if not(TUtil.Empty(Self.CpfCnpjFavorecido)) then
    begin
      if Length(Self.CpfCnpjFavorecido) <= 14 then
      begin
        if not(TUtil.CPF(Self.CpfCnpjFavorecido)) then
        begin
          MessageDlg('CPF do Favorecido incorreto!', mtWarning, [mbOK], 0);
          Exit;
        end;
      end
      else
      begin
        if not(TUtil.Cnpj(Self.CpfCnpjFavorecido)) then
        begin
          MessageDlg('CNPJ Favorecido incorreto!', mtWarning, [mbOK], 0);
          Exit;
        end;
      end;
      if TUtil.Empty(Self.Favorecido) then
      begin
        MessageDlg('Informe o nome do Favorecido!', mtWarning, [mbOK], 0);
        Exit;
      end;
    end;
    if not(TUtil.Empty(Self.Cnh)) then
    begin
      if TUtil.Empty(Self.CategoriaCnh) then
      begin
        MessageDlg('Informe a Categoria da CNH.', mtWarning, [mbOK], 0);
        Exit;
      end;
    end;
    if Self.Status = '-1' then
    begin
      MessageDlg('Informe o Status do Agente!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if not TUtil.Empty(Self.NumeroConta) then
    begin
      if TUtil.Empty(Self.Agencia) then
      begin
        MessageDlg('Informe o código da agência bancária!', mtWarning,
          [mbOK], 0);
        Exit;
      end;
      if TUtil.Empty(Self.TipoConta) then
      begin
        MessageDlg('Informe o tipo de conta!', mtWarning, [mbOK], 0);
        Exit;
      end;
      if TUtil.Empty(Self.Banco) then
      begin
        MessageDlg('Informe o Banco!', mtWarning, [mbOK], 0);
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

function TAgente.Delete(filtro: String): Boolean;
begin
  try
    Result := False;
    with dm.QryCRUD do
    begin
      if not(Self.Endereco.Delete('CODIGO')) then
      begin
        MessageDlg('Erro ao Excluir os Endereços do Agente!', mtError,
          [mbOK], 0);
        Exit;
      end;
      Self.Contato.Codigo := StrToInt(Self.Codigo);
      if not(Self.Contato.Delete('CODIGO')) then
      begin
        MessageDlg('Erro ao Excluir os Contatos do Agente!', mtError,
          [mbOK], 0);
        Exit;
      end;
      Close;
      SQL.Clear;
      SQL.Add('DELETE FROM ' + TABLENAME);
      if filtro = 'CODIGO' then
      begin
        SQL.Add('WHERE COD_AGENTE =:CODIGO');
        ParamByName('CODIGO').AsInteger := StrToInt(Self.Codigo);
      end
      else if filtro = 'CPF' then
      begin
        SQL.Add('WHERE NUM_CNPJ =:CPF');
        ParamByName('CPF').AsString := Self.Cnpj;
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

function TAgente.getObject(id, filtro: String): Boolean;
begin
  Try
    Result := False;

    if TUtil.Empty(id) then
      Exit;
    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);

      if filtro = 'CODIGO' then
      begin
        SQL.Add(' WHERE COD_AGENTE =:CODIGO');
        ParamByName('CODIGO').AsInteger := StrToInt(id);
      end
      else if filtro = 'ALIAS' then
      begin
        SQL.Add(' WHERE NOM_FANTASIA = :ALIAS');
        ParamByName('ALIAS').AsString := id;
      end
      else if filtro = 'CPF' then
      begin
        SQL.Add(' WHERE NUM_CNPJ =:CPF');
        ParamByName('CPF').AsString := id;
      end;
      dm.ZConn.PingServer;
      Open;
      if not IsEmpty then
      begin
        First;
        Self.Codigo := FieldByName('COD_AGENTE').AsString;
        Self.Razao := FieldByName('DES_RAZAO_SOCIAL').AsString;
        Self.Fantasia := FieldByName('NOM_FANTASIA').AsString;
        Self.TipoDoc := FieldByName('DES_TIPO_DOC').AsString;
        Self.Cnpj := FieldByName('NUM_CNPJ').AsString;
        Self.IE := FieldByName('NUM_IE').AsString;
        Self.IEST := FieldByName('NUM_IEST').AsString;
        Self.IM := FieldByName('NUM_IM').AsString;
        Self.Cnae := FieldByName('COD_CNAE').AsString;
        Self.Crt := FieldByName('COD_CRT').AsInteger;
        Self.Cnh := FieldByName('NUM_CNH').AsString;
        Self.CategoriaCnh := FieldByName('DES_CATEGORIA_CNH').AsString;
        Self.ValidadeCnh := FieldByName('DAT_VALIDADE_CNH').AsDateTime;
        Self.Pagina := FieldByName('DES_PAGINA').AsString;
        Self.Status := FieldByName('COD_STATUS').AsString;
        Self.Obs := FieldByName('DES_OBSERVACAO').AsString;
        Self.DtCadastro := FieldByName('DAT_CADASTRO').AsString;
        Self.DtAlteracaop := FieldByName('DAT_ALTERACAO').AsDateTime;
        Self.Verba := FieldByName('VAL_VERBA').AsFloat;
        Self.TipoConta := FieldByName('DES_TIPO_CONTA').AsString;
        Self.Banco := FieldByName('COD_BANCO').AsString;
        Self.Agencia := FieldByName('COD_AGENCIA').AsString;
        Self.NumeroConta := FieldByName('NUM_CONTA').AsString;
        Self.Favorecido := FieldByName('NOM_FAVORECIDO').AsString;
        Self.CpfCnpjFavorecido :=
          FieldByName('NUM_CPF_CNPJ_FAVORECIDO').AsString;
        Self.Forma := FieldByName('DES_FORMA_PAGAMENTO').AsString;
        Self.CentroCusto := FieldByName('COD_CENTRO_CUSTO').AsInteger;
        Self.Grupo := FieldByName('COD_GRUPO').AsInteger;
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

function TAgente.Insert(): Boolean;
begin
  Try
    Result := False;
    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'INSERT INTO ' + TABLENAME + '(' + 'COD_AGENTE, ' +
        'DES_RAZAO_SOCIAL, ' + 'NOM_FANTASIA, ' + 'DES_TIPO_DOC, ' +
        'NUM_CNPJ, ' + 'NUM_IE, ' + 'NUM_IEST, ' + 'NUM_IM, ' + 'COD_CNAE, ' +
        'COD_CRT, ' + 'NUM_CNH, ' + 'DES_CATEGORIA_CNH, ' + 'DAT_VALIDADE_CNH, '
        + 'DES_PAGINA, ' + 'COD_STATUS, ' + 'DES_OBSERVACAO, ' +
        'DAT_CADASTRO, ' + 'VAL_VERBA, ' + 'DES_TIPO_CONTA, ' + 'COD_BANCO, ' +
        'COD_AGENCIA, ' + 'NUM_CONTA, ' + 'NOM_FAVORECIDO, ' +
        'NUM_CPF_CNPJ_FAVORECIDO, ' + 'DES_FORMA_PAGAMENTO, ' +
        'COD_CENTRO_CUSTO, ' + 'COD_GRUPO, ' + 'DAT_ALTERACAO) ' + 'VALUES (' +
        ':CODIGO, ' + ':RAZAO, ' + ':FANTASIA, ' + ':TIPODOC, ' + ':CNPJ, ' +
        ':IE, ' + ':IEST, ' + ':IM, ' + ':CNAE, ' + ':CRT, ' + ':CNH, ' +
        ':CATEGORIACNH, ' + ':VALIDADECNH, ' + ':PAGINA, ' + ':STATUS, ' +
        ':OBS, ' + ':CADASTRO, ' + ':VERBA, ' + ':TIPOCONTA, ' + ':BANCO, ' +
        ':AGENCIA, ' + ':CONTA, ' + ':FAVORECIDO, ' + ':CPFCNPJFAVORECIDO, ' +
        ':FORMA, ' + ':CENTROCUSTO, ' + ':GRUPO, ' + ':ALTERACAO)';

      ParamByName('CODIGO').AsInteger := StrToInt(Self.Codigo);
      ParamByName('RAZAO').AsString := Self.Razao;
      ParamByName('FANTASIA').AsString := Self.Fantasia;
      ParamByName('TIPODOC').AsString := Self.TipoDoc;
      ParamByName('CNPJ').AsString := Self.Cnpj;
      ParamByName('IE').AsString := Self.IE;
      ParamByName('IEST').AsString := Self.IEST;
      ParamByName('IM').AsString := Self.IM;
      ParamByName('CNAE').AsString := Self.Cnae;
      ParamByName('CRT').AsInteger := Self.Crt;
      ParamByName('CNH').AsString := Self.Cnh;
      ParamByName('CATEGORIACNH').AsString := Self.CategoriaCnh;
      ParamByName('VALIDADECNH').AsDate := Self.ValidadeCnh;
      ParamByName('PAGINA').AsString := Self.Pagina;
      ParamByName('STATUS').AsInteger := StrToInt(Self.Status);
      ParamByName('OBS').AsString := Self.Obs;
      ParamByName('CADASTRO').AsDate := StrToDate(Self.DtCadastro);
      ParamByName('VERBA').AsFloat := Self.Verba;
      ParamByName('TIPOCONTA').AsString := Self.TipoConta;
      ParamByName('BANCO').AsString := Self.Banco;
      ParamByName('AGENCIA').AsString := Self.Agencia;
      ParamByName('CONTA').AsString := Self.NumeroConta;
      ParamByName('FAVORECIDO').AsString := Self.Favorecido;
      ParamByName('CPFCNPJFAVORECIDO').AsString := Self.CpfCnpjFavorecido;
      ParamByName('FORMA').AsString := Self.Forma;
      ParamByName('ALTERACAO').AsDateTime := Self.DtAlteracaop;
      ParamByName('CENTROCUSTO').AsInteger := Self.CentroCusto;
      ParamByName('GRUPO').AsInteger := Self.Grupo;
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

function TAgente.Update(): Boolean;
begin
  try
    Result := False;
    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'UPDATE ' + TABLENAME + ' SET ' +
        'DES_RAZAO_SOCIAL = :RAZAO, ' + 'NOM_FANTASIA = :FANTASIA, ' +
        'DES_TIPO_DOC = :TIPODOC, ' + 'NUM_CNPJ = :CNPJ, ' + 'NUM_IE = :IE, ' +
        'NUM_IEST = :IEST, ' + 'NUM_IM = :IM, ' + 'COD_CNAE = :CNAE, ' +
        'COD_CRT = :CRT, ' + 'NUM_CNH = :CNH, ' +
        'DES_CATEGORIA_CNH = :CATEGORIACNH, ' +
        'DAT_VALIDADE_CNH = :VALIDADECNH, ' + 'DES_PAGINA = :PAGINA, ' +
        'COD_STATUS = :STATUS, ' + 'DES_OBSERVACAO = :OBS, ' +
        'DAT_CADASTRO = :CADASTRO, ' + 'VAL_VERBA = :VERBA, ' +
        'DES_TIPO_CONTA = :TIPOCONTA, ' + 'COD_BANCO = :BANCO, ' +
        'COD_AGENCIA = :AGENCIA, ' + 'NUM_CONTA = :CONTA, ' +
        'NOM_FAVORECIDO = :FAVORECIDO, ' +
        'NUM_CPF_CNPJ_FAVORECIDO = :CPFCNPJFAVORECIDO, ' +
        'DES_FORMA_PAGAMENTO = :FORMA, ' + 'COD_CENTRO_CUSTO = :CENTROCUSTO, ' +
        'COD_GRUPO = :GRUPO, ' + 'DAT_ALTERACAO = :ALTERACAO ' + 'WHERE ' +
        'COD_AGENTE = :CODIGO';

      ParamByName('CODIGO').AsInteger := StrToInt(Self.Codigo);
      ParamByName('RAZAO').AsString := Self.Razao;
      ParamByName('FANTASIA').AsString := Self.Fantasia;
      ParamByName('TIPODOC').AsString := Self.TipoDoc;
      ParamByName('CNPJ').AsString := Self.Cnpj;
      ParamByName('IE').AsString := Self.IE;
      ParamByName('IEST').AsString := Self.IEST;
      ParamByName('IM').AsString := Self.IM;
      ParamByName('CNAE').AsString := Self.Cnae;
      ParamByName('CRT').AsInteger := Self.Crt;
      ParamByName('CNH').AsString := Self.Cnh;
      ParamByName('CATEGORIACNH').AsString := Self.CategoriaCnh;
      ParamByName('VALIDADECNH').AsDate := Self.ValidadeCnh;
      ParamByName('PAGINA').AsString := Self.Pagina;
      ParamByName('STATUS').AsInteger := StrToInt(Self.Status);
      ParamByName('OBS').AsString := Self.Obs;
      ParamByName('CADASTRO').AsDate := StrToDate(Self.DtCadastro);
      ParamByName('VERBA').AsFloat := Self.Verba;
      ParamByName('TIPOCONTA').AsString := Self.TipoConta;
      ParamByName('BANCO').AsString := Self.Banco;
      ParamByName('AGENCIA').AsString := Self.Agencia;
      ParamByName('CONTA').AsString := Self.NumeroConta;
      ParamByName('FAVORECIDO').AsString := Self.Favorecido;
      ParamByName('CPFCNPJFAVORECIDO').AsString := Self.CpfCnpjFavorecido;
      ParamByName('FORMA').AsString := Self.Forma;
      ParamByName('ALTERACAO').AsDateTime := Self.DtAlteracaop;
      ParamByName('CENTROCUSTO').AsInteger := Self.CentroCusto;
      ParamByName('GRUPO').AsInteger := Self.Grupo;
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

function TAgente.getObjects(): Boolean;
begin
  try
    Result := False;
    if (not _conexao.VerifyConnZEOS(0)) then begin
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
        First;
    end;
    if dm.QryGetObject.RecordCount > 0 then
      Result := True;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' + E.Message);
  end;
end;

function TAgente.getField(campo, coluna: String): String;
begin
  Try
    Result := '';
    with dm.qryFields do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT ' + campo + ' FROM ' + TABLENAME;

      if coluna = 'CODIGO' then
      begin
        SQL.Add(' WHERE COD_AGENTE =:CODIGO ');
        ParamByName('CODIGO').AsInteger := StrToInt(Self.Codigo);
      end
      else if coluna = 'NOME' then
      begin
        SQL.Add(' WHERE DES_RAZAO_SOCIAL =:NOME ');
        ParamByName('NOME').AsString := Self.Razao;
      end
      else if coluna = 'FANTASIA' then
      begin
        SQL.Add(' WHERE NOM_FANTASIA =:FANTASIA ');
        ParamByName('FANTASIA').AsString := Self.Fantasia;
      end;
      dm.ZConn.PingServer;
      Open;
      if not IsEmpty then
        First;
    end;

    if dm.qryFields.RecordCount > 0 then
      Result := dm.qryFields.FieldByName(campo).AsString;

    dm.qryFields.Close;
    dm.qryFields.SQL.Clear;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TAgente.getGrupo: Integer;
begin
  Result := _grupo;
end;

function TAgente.Search(id, filtro: String): Boolean;
begin
  try

    Result := False;
    with dm.qryGeral do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT COD_AGENTE, DES_RAZAO_SOCIAL, NOM_FANTASIA, NUM_CNPJ FROM '
        + TABLENAME);
      if filtro = 'CODIGO' then
      begin
        SQL.Add(' WHERE COD_AGENTE = :CODIGO ');
        ParamByName('CODIGO').AsInteger := StrToInt(id);
      end
      else if filtro = 'NOME' then
      begin
        SQL.Add(' WHERE DES_RAZAO_SOCIAL LIKE :NOME ');
        ParamByName('NOME').AsString := '%' + id + '%';
      end
      else if filtro = 'ALIAS' then
      begin
        SQL.Add(' WHERE NOM_FANTASIA LIKE :FANTASIA ');
        ParamByName('FANTASIA').AsString := '%' + id + '%';
      end
      else if filtro = 'CPF' then
      begin
        SQL.Add(' WHERE NUM_CNPJ = :CPF ');
        ParamByName('CPF').AsString := id;
      end;
      dm.ZConn.PingServer;
      Open;
      if not(IsEmpty) then
        First
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

procedure TAgente.setCategoriaCnh(const Value: String);
begin
  _categoriacnh := Value;
end;

procedure TAgente.setCentroCusto(const Value: Integer);
begin
  _centrocusto := Value;
end;

procedure TAgente.setCnh(const Value: String);
begin
  _cnh := Value;
end;

procedure TAgente.setCodigo(const Value: String);
begin
  _codigo := Value;
end;

procedure TAgente.setdtAlteracao(const Value: TDateTime);
begin
  _dtAlteracao := Value;
end;

procedure TAgente.setdtCadastro(const Value: String);
begin
  _dtCadastro := Value;
end;

procedure TAgente.setObs(const Value: String);
begin
  _obs := Value;
end;

procedure TAgente.setPagina(const Value: String);
begin
  _pagina := Value;
end;

procedure TAgente.setStatus(const Value: String);
begin
  _status := Value;
end;

procedure TAgente.setValidadeCnh(const Value: TDateTime);
begin
  _validadecnh := Value;
end;

function TAgente.getOperacao: String;
begin
  Result := _operacao;
end;

procedure TAgente.setOperacao(const Value: String);
begin
  _operacao := Value;
end;

function TAgente.getContato: TContatoAgente;
begin
  Result := _contato;
end;

function TAgente.getEndereco: TEnderecoAgente;
begin
  Result := _endereco;
end;

procedure TAgente.setContato(const Value: TContatoAgente);
begin
  _contato := Value;
end;

procedure TAgente.setEndereco(const Value: TEnderecoAgente);
begin
  _endereco := Value;
end;

procedure TAgente.setGrupo(const Value: Integer);
begin
  _grupo := Value;
end;

function TAgente.getCabecaCEP: TCEPAgentes;
begin
  Result := _cabecacep;
end;

procedure TAgente.setCabecaCEP(const Value: TCEPAgentes);
begin
  _cabecacep := Value;
end;

function TAgente.getVerba: Double;
begin
  Result := _verba;
end;

procedure TAgente.setVerba(const Value: Double);
begin
  _verba := Value;
end;

constructor TAgente.Create;
begin
  inherited Create;
  _conexao := TConexao.Create;
  _endereco := TEnderecoAgente.Create();
  _contato := TContatoAgente.Create();
  _cabecacep := TCEPAgentes.Create();

end;

end.
