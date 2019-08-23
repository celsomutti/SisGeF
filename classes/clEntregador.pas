unit clEntregador;

interface

uses
  clPessoaF, System.Classes, clConexao;

type
  TEntregador = class(TPessoaF)
  private
    function getAcidente: String;
    function getAgente: Integer;
    function getCadastro: Integer;
    function getCentroCusto: Integer;
    function getCodigo: String;
    function getCombustivel: Double;
    function getDataGV: TDate;
    function getdtCadastro: TDate;
    function getdtUsuario: Integer;
    function getExecutante: String;
    function getFuncionario: String;
    function getGV: String;
    function getManutencao: TDateTime;
    function getObs: String;
    function getOperacao: String;
    function getQtdAcidente: Integer;
    function getQtdRoubo: Integer;
    function getQtdTranporte: Integer;
    function getRoubo: String;
    function getStatus: Integer;
    function getTranporte: String;
    function getVerba: Double;
    procedure setAcidente(const Value: String);
    procedure setAgente(const Value: Integer);
    procedure setCadastro(const Value: Integer);
    procedure setCentroCusto(const Value: Integer);
    procedure setCodigo(const Value: String);
    procedure setCombustivel(const Value: Double);
    procedure setDataGV(const Value: TDate);
    procedure setdtCadastro(const Value: TDate);
    procedure setdtUsuario(const Value: Integer);
    procedure setExecutante(const Value: String);
    procedure setFuncionario(const Value: String);
    procedure setGV(const Value: String);
    procedure setManutencao(const Value: TDateTime);
    procedure setObs(const Value: String);
    procedure setOperacao(const Value: String);
    procedure setQtdAcidente(const Value: Integer);
    procedure setQtdRoubo(const Value: Integer);
    procedure setQtdTranporte(const Value: Integer);
    procedure setRoubo(const Value: String);
    procedure setStatus(const Value: Integer);
    procedure setTranporte(const Value: String);
    procedure setVerba(const Value: Double);
    function getChave: String;
    procedure setChave(const Value: String);
    function getGrupo: Integer;
    procedure setGrupo(const Value: Integer);

    constructor Create;
    destructor Destroy;
    function getRoteiro: String;
    procedure setRoteiro(const Value: String);
    function getazaoMEI: String;
    function getCNPJMEI: String;
    function getCodioMEI: String;
    function getFantasiaMEI: String;
    procedure serRazaoMEI(const Value: String);
    procedure setCNPJMEI(const Value: String);
    procedure setCodigoMEI(const Value: String);
    procedure setFantasiaMEI(const Value: String);

  protected
    _cadastro: Integer;
    _funcionario: String;
    _codigo: String;
    _agente: Integer;
    _status: Integer;
    _observacao: String;
    _datacadastro: TDate;
    _usuario: Integer;
    _verba: Double;
    _combustivel: Double;
    _centrocusto: Integer;
    _vitimaroubo: String;
    _qtdvitima: Integer;
    _acidente: String;
    _qtdacidentes: Integer;
    _transporte: String;
    _qtdtransporte: Integer;
    _gv: String;
    _datagv: TDate;
    _executante: String;
    _manutencao: TDateTime;
    _operacao: String;
    _chave: String;
    _grupo: Integer;
    _roteiro: String;
    _codMEI: String;
    _razaoMEI: String;
    _fantasiaMEI: String;
    _cnpjMEI: String;
    _conexao: TConexao;
  public

    property Cadastro: Integer read getCadastro write setCadastro;
    property Funcionario: String read getFuncionario write setFuncionario;
    property Codigo: String read getCodigo write setCodigo;
    property Agente: Integer read getAgente write setAgente;
    property Status: Integer read getStatus write setStatus;
    property Obs: String read getObs write setObs;
    property DtCadastro: TDate read getdtCadastro write setdtCadastro;
    property Usuario: Integer read getdtUsuario write setdtUsuario;
    property Verba: Double read getVerba write setVerba;
    property Combustivel: Double read getCombustivel write setCombustivel;
    property CentroCusto: Integer read getCentroCusto write setCentroCusto;
    property Roubo: String read getRoubo write setRoubo;
    property QtdRoubo: Integer read getQtdRoubo write setQtdRoubo;
    property Acidente: String read getAcidente write setAcidente;
    property QtdAcidente: Integer read getQtdAcidente write setQtdAcidente;
    property Tranporte: String read getTranporte write setTranporte;
    property QtdTranporte: Integer read getQtdTranporte write setQtdTranporte;
    property GV: String read getGV write setGV;
    property DataGV: TDate read getDataGV write setDataGV;
    property Executante: String read getExecutante write setExecutante;
    property Manutencao: TDateTime read getManutencao write setManutencao;
    property Operacao: String read getOperacao write setOperacao;
    property Chave: String read getChave write setChave;
    property Grupo: Integer read getGrupo write setGrupo;
    property Roteiro: String read getRoteiro write setRoteiro;
    property CodigoMEI: String read getCodioMEI write setCodigoMEI;
    property RazaoMEI: String read getazaoMEI write serRazaoMEI;
    property FantasiaMEI: String read getFantasiaMEI write setFantasiaMEI;
    property CNPJMEI: String read getCNPJMEI write setCNPJMEI;

    function Validar(): Boolean;
    function Delete(filtro: String): Boolean;
    function getObject(id, filtro: String): Boolean;
    function Insert(): Boolean;
    function Update(): Boolean;
    function getField(campo, coluna: String): String;
    function Search(id, filtro: String): Boolean;
    function getObjects(): Boolean;
    function JaExiste(): Boolean;
    function Merge(): Boolean;
    function PopulaLocal(filtro: string): TStringList;
    function ListaEntregadores(): Boolean;

    procedure MaxCodigo(sTipo: String);
    procedure MaxCadastro();
  end;

const
  TABLENAME = 'tbentregadores';

implementation

{ TEntregador }

uses SysUtils, Dialogs, udm, clUtil, ZDataset, ZAbstractRODataset, DB;

constructor TEntregador.Create;
begin
  _conexao := TConexao.Create;
  if (not _conexao.VerifyConnZEOS(0)) then
  begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
      Self.ClassName + ') !', mtError, [mbCancel], 0);
  end;
end;

destructor TEntregador.Destroy;
begin
  _conexao.Free;
end;

function TEntregador.getAcidente: String;
begin
  Result := _acidente;
end;

function TEntregador.getAgente: Integer;
begin
  Result := _agente;
end;

function TEntregador.getazaoMEI: String;
begin
  Result := _razaoMEI;
end;

function TEntregador.getCadastro: Integer;
begin
  Result := _cadastro;
end;

function TEntregador.getCentroCusto: Integer;
begin
  Result := _centrocusto;
end;

function TEntregador.getChave: String;
begin
  Result := _chave;
end;

function TEntregador.getCNPJMEI: String;
begin
  Result := _cnpjMEI;
end;

function TEntregador.getCodigo: String;
begin
  Result := _codigo;
end;

function TEntregador.getCodioMEI: String;
begin
  Result := _codMEI;
end;

function TEntregador.getCombustivel: Double;
begin
  Result := _combustivel;
end;

function TEntregador.getDataGV: TDate;
begin
  Result := _datagv;
end;

function TEntregador.getdtCadastro: TDate;
begin
  Result := _datacadastro;
end;

function TEntregador.getdtUsuario: Integer;
begin
  Result := _usuario;
end;

function TEntregador.getExecutante: String;
begin
  Result := _executante;
end;

function TEntregador.getFuncionario: String;
begin
  Result := _funcionario;
end;

function TEntregador.getGrupo: Integer;
begin
  Result := _grupo;
end;

function TEntregador.getGV: String;
begin
  Result := _gv;
end;

function TEntregador.getManutencao: TDateTime;
begin
  Result := _manutencao;
end;

function TEntregador.getObs: String;
begin
  Result := _observacao;
end;

function TEntregador.getOperacao: String;
begin
  Result := _operacao;
end;

function TEntregador.getQtdAcidente: Integer;
begin
  Result := _qtdacidentes;
end;

function TEntregador.getQtdRoubo: Integer;
begin
  Result := _qtdvitima;
end;

function TEntregador.getQtdTranporte: Integer;
begin
  Result := _qtdtransporte;
end;

function TEntregador.getRoteiro: String;
begin
  Result := _roteiro;
end;

function TEntregador.getRoubo: String;
begin
  Result := _vitimaroubo;
end;

function TEntregador.getStatus: Integer;
begin
  Result := _status;
end;

function TEntregador.getTranporte: String;
begin
  Result := _transporte;
end;

function TEntregador.getVerba: Double;
begin
  Result := _verba;
end;

function TEntregador.Validar(): Boolean;
begin
  try
    Result := False;
    if TUtil.Empty(Self.Nome) then
    begin
      MessageDlg('Informe o Nome Completo.', mtWarning, [mbOK], 0);
      Exit;
    end;
    if not(TUtil.Empty(Self.CPF)) then
    begin
      if Self.TipoDoc = 'CPF' then
      begin
        if not(TUtil.CPF(Self.CPF)) then
        begin
          MessageDlg('CPF incorreto!', mtWarning, [mbOK], 0);
          Exit;
        end;
      end
      else
      begin
        if not(TUtil.CNPJ(Self.CPF)) then
        begin
          MessageDlg('CNPJ incorreto!', mtWarning, [mbOK], 0);
          Exit;
        end;
      end;
      if Self.Operacao = 'I' then
      begin
        if Self.JaExiste then
        begin
          MessageDlg('CPF ou CNPJ já cadastrado!', mtWarning, [mbCancel],0);
          Exit;
        end;
      end;
    end;

    if not(TUtil.Empty(Self.CNPJMEI)) then
    begin
      if not(TUtil.CNPJ(Self.CNPJMEI)) then
      begin
        MessageDlg('CNPJ do MEI incorreto!', mtWarning, [mbOK], 0);
        Exit;
      end;
    end;
    if not(TUtil.Empty(Self.CpfCnpjFavorecido)) then
    begin
      if Length(Self.CpfCnpjFavorecido) = 14 then
      begin
        if not(TUtil.CPF(Self.CpfCnpjFavorecido)) then
        begin
          MessageDlg('CPF do Favorecido incorreto!', mtWarning, [mbOK], 0);
          Exit;
        end;
      end
      else
      begin
        if not(TUtil.CNPJ(Self.CpfCnpjFavorecido)) then
        begin
          MessageDlg('CNPJ Favorecido incorreto!', mtWarning, [mbOK], 0);
          Exit;
        end;
      end;
    end;
    if TUtil.Empty(Self.Favorecido) then
    begin
      Self.Favorecido := Self.Nome;
    end;
    if not(TUtil.Empty(Self.Cnh)) then
    begin
      if TUtil.Empty(Self.CategoriaCnh) then
      begin
        MessageDlg('Informe a Categoria da CNH.', mtWarning, [mbOK], 0);
        Exit;
      end;
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

function TEntregador.Delete(filtro: String): Boolean;
begin
  try

    Result := False;

    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Add('DELETE FROM ' + TABLENAME);
      if filtro = 'CODIGO' then
      begin
        SQL.Add('WHERE COD_ENTREGADOR = :CODIGO');
        ParamByName('CODIGO').AsString := Self.Codigo;
      end
      else if filtro = 'CADASTRO' then
      begin
        SQL.Add(' WHERE COD_CADASTRO = :CADASTRO');
        ParamByName('CADASTRO').AsString := IntToStr(Self.Cadastro);
      end
      else if filtro = 'AGENTE' then
      begin
        SQL.Add(' WHERE COD_AGENTE =:AGENTE');
        ParamByName('AGENTE').AsString := IntToStr(Self.Agente);
      end
      else if filtro = 'CHAVE' then
      begin
        SQL.Add(' WHERE DES_CHAVE =:CHAVE');
        ParamByName('CHAVE').AsString := Self.Chave;
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

function TEntregador.getObject(id, filtro: String): Boolean;
begin
  Try
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

      if filtro = 'CADASTRO' then
      begin
        SQL.Add(' WHERE COD_CADASTRO = :CADASTRO');
        ParamByName('CADASTRO').AsInteger := StrToInt(id);
      end
      else if filtro = 'CODIGO' then
      begin
        SQL.Add(' WHERE COD_ENTREGADOR = :CODIGO');
        ParamByName('CODIGO').AsInteger := StrToInt(id);
      end
      else if filtro = 'CPF' then
      begin
        SQL.Add(' WHERE NUM_CNPJ =:CPF');
        ParamByName('CPF').AsString := id;
      end
      else if filtro = 'ALIAS' then
      begin
        SQL.Add(' WHERE NOM_FANTASIA = :ALIAS');
        ParamByName('ALIAS').AsString := id;
      end
      else if filtro = 'AGENTE' then
      begin
        SQL.Add(' WHERE COD_AGENTE =:AGENTE');
        ParamByName('AGENTE').AsInteger := StrToInt(id);
      end
      else if filtro = 'INAGENTE' then
      begin
        SQL.Add(' WHERE COD_AGENTE IN (:AGENTE)');
        ParamByName('AGENTE').AsString := id;
      end
      else if filtro = 'CHAVE' then
      begin
        SQL.Add(' WHERE DES_CHAVE =:CHAVE');
        ParamByName('CHAVE').AsString := id;
      end
      else if filtro = 'FILTRO' then
      begin
        SQL.Add(' WHERE ' + id);
      end;
      dm.ZConn.PingServer;
      Open;
      if not(IsEmpty) then
      begin
        First;
        Self.Cadastro := FieldByName('COD_CADASTRO').AsInteger;
        Self.Funcionario := FieldByName('DOM_FUNCIONARIO').AsString;
        Self.Codigo := FieldByName('COD_ENTREGADOR').AsString;
        Self.TipoDoc := FieldByName('DES_TIPO_DOC').AsString;
        Self.Nome := FieldByName('DES_RAZAO_SOCIAL').AsString;
        Self.Alias := FieldByName('NOM_FANTASIA').AsString;
        Self.CPF := FieldByName('NUM_CNPJ').AsString;
        Self.DtNascimento := FieldByName('DAT_NASCIMENTO').AsDateTime;
        Self.RG := FieldByName('NUM_IE').AsString;
        Self.UFRG := FieldByName('UF_RG').AsString;
        Self.OrgaoRG := FieldByName('NOM_EMISSOR_RG').AsString;
        Self.DataRG := FieldByName('DAT_EMISSAO_RG').AsDateTime;
        Self.UFNatural := FieldByName('UF_NASCIMENTO').AsString;
        Self.Naturalidade := FieldByName('NOM_CIDADE_NASCIMENTO').AsString;
        Self.NomePai := FieldByName('NOM_PAI').AsString;
        Self.NomeMae := FieldByName('NOM_MAE').AsString;
        Self.Cnh := FieldByName('NUM_CNH').AsString;
        Self.CNHRegistro := FieldByName('NUM_REGISTRO_CNH').AsString;
        Self.CategoriaCnh := FieldByName('DES_CATEGORIA_CNH').AsString;
        Self.ValidadeCnh := FieldByName('DAT_VALIDADE_CNH').AsDateTime;
        Self.EmissaoCnh := FieldByName('DAT_EMISSAO_CNH').AsDateTime;
        Self.CNHUF := FieldByName('UF_CNH').AsString;
        Self.DataPrimeiraCNH := FieldByName('DAT_1_HABILITACAO').AsDateTime;
        Self.Agente := FieldByName('COD_AGENTE').AsInteger;
        Self.Status := FieldByName('COD_STATUS').AsInteger;
        Self.Obs := FieldByName('DES_OBSERVACAO').AsString;
        Self.DtCadastro := FieldByName('DAT_CADASTRO').AsDateTime;
        Self.Usuario := FieldByName('COD_USUARIO').AsInteger;
        Self.Verba := FieldByName('VAL_VERBA').AsFloat;
        Self.Combustivel := FieldByName('VAL_VERBA_COMBUSTIVEL').AsFloat;
        Self.TipoConta := FieldByName('DES_TIPO_CONTA').AsString;
        Self.Banco := FieldByName('COD_BANCO').AsString;
        Self.Agencia := FieldByName('COD_AGENCIA').AsString;
        Self.NumeroConta := FieldByName('NUM_CONTA').AsString;
        Self.Favorecido := FieldByName('NOM_FAVORECIDO').AsString;
        Self.CpfCnpjFavorecido := FieldByName('NUM_CPF_CNPJ_FAVORECIDO').AsString;
        Self.Forma := FieldByName('DES_FORMA_PAGAMENTO').AsString;
        Self.CentroCusto := FieldByName('COD_CENTRO_CUSTO').AsInteger;
        Self.Roubo := FieldByName('DOM_VITIMA_ROUBO').AsString;
        Self.QtdRoubo := FieldByName('QTD_VITIMA_ROUBO').AsInteger;
        Self.Acidente := FieldByName('DOM_ACIDENTES').AsString;
        Self.QtdAcidente := FieldByName('QTD_ACIDENTES').AsInteger;
        Self.Tranporte := FieldByName('DOM_TRANSPORTE_EMPRESA').AsString;
        Self.QtdTranporte := FieldByName('QTD_TRANSPORTE').AsInteger;
        Self.GV := FieldByName('DOM_GV').AsString;
        Self.DataGV := FieldByName('DAT_GV').AsDateTime;
        Self.Executante := FieldByName('NOM_EXECUTANTE').AsString;
        Self.Manutencao := FieldByName('DAT_ALTERACAO').AsDateTime;
        Self.Chave := FieldByName('DES_CHAVE').AsString;
        Self.Grupo := FieldByName('COD_GRUPO').AsInteger;
        Self.Roteiro := FieldByName('COD_ROTEIRO').AsString;
        Self.CodigoMEI := FieldByName('COD_MEI').AsString;
        Self.RazaoMEI := FieldByName('NOM_RAZAO_MEI').AsString;
        Self.FantasiaMEI := FieldByName('NOM_FANTASIA_MEI').AsString;
        Self.CNPJMEI := FieldByName('NUM_CNPJ_MEI').AsString;
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

function TEntregador.Insert(): Boolean;
begin
  Try
    Result := False;

    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'INSERT INTO ' + TABLENAME + '(' +
        'COD_CADASTRO, ' +
        'DOM_FUNCIONARIO, ' +
        'COD_ENTREGADOR, ' +
        'DES_TIPO_DOC, ' +
        'DES_RAZAO_SOCIAL, '+
        'NOM_FANTASIA, ' +
        'NUM_CNPJ, ' +
        'DAT_NASCIMENTO, ' +
        'NUM_IE, ' +
        'UF_RG, ' +
        'NOM_EMISSOR_RG, ' +
        'DAT_EMISSAO_RG, ' +
        'UF_NASCIMENTO, ' +
        'NOM_CIDADE_NASCIMENTO, ' +
        'NOM_PAI, ' +
        'NOM_MAE, ' +
        'NUM_IEST, ' +
        'NUM_IM, ' +
        'COD_CNAE, ' +
        'COD_CRT, ' +
        'NUM_CNH, ' +
        'NUM_REGISTRO_CNH, ' +
        'DES_CATEGORIA_CNH, ' +
        'DAT_VALIDADE_CNH, ' +
        'DAT_EMISSAO_CNH, ' +
        'UF_CNH, ' +
        'DAT_1_HABILITACAO, ' +
        'DES_PAGINA, ' +
        'COD_AGENTE, ' +
        'COD_STATUS, ' +
        'DES_OBSERVACAO, ' +
        'DAT_CADASTRO, ' +
        'COD_USUARIO, ' +
        'VAL_VERBA, ' +
        'VAL_VERBA_COMBUSTIVEL, ' +
        'DES_TIPO_CONTA, ' +
        'COD_BANCO, ' +
        'COD_AGENCIA, ' +
        'NUM_CONTA, ' +
        'NOM_FAVORECIDO, ' +
        'NUM_CPF_CNPJ_FAVORECIDO, ' +
        'DES_FORMA_PAGAMENTO, ' +
        'COD_CENTRO_CUSTO, ' +
        'DOM_VITIMA_ROUBO, ' +
        'QTD_VITIMA_ROUBO, ' +
        'DOM_ACIDENTES, ' +
        'QTD_ACIDENTES, ' +
        'DOM_TRANSPORTE_EMPRESA, ' +
        'QTD_TRANSPORTE, ' +
        'DOM_GV, ' +
        'DAT_GV, ' +
        'NOM_EXECUTANTE, ' +
        'DAT_ALTERACAO, ' +
        'DES_CHAVE, ' +
        'COD_GRUPO, ' +
        'COD_ROTEIRO, ' +
        'COD_MEI, ' +
        'NOM_RAZAO_MEI, ' +
        'NOM_FANTASIA_MEI, ' +
        'NUM_CNPJ_MEI, ' +
        'COD_CNH) ' +
        'VALUES (' +
        ':CADASTRO, '+
        ':FUNCIONARIO, ' +
        ':CODIGO, ' +
        ':TIPODOC, ' +
        ':NOME, ' +
        ':FANTASIA, ' +
        ':CPF, ' +
        ':NASCIMENTO, ' +
        ':RG, ' +
        ':UFRG, ' +
        ':EMISSORRG, ' +
        ':EMISSAORG, ' +
        ':UFNASCIMENTO, ' +
        ':NATURALIDADE, ' +
        ':PAI, ' +
        ':MAE, ' +
        ':IEST, ' +
        ':IM, ' +
        ':CNAE, ' +
        ':CRT, ' +
        ':CNH, ' +
        ':REGISTROCNH, ' +
        ':CATEGORIACNH, ' +
        ':VALIDADECNH, ' +
        ':EMISSAOCNH, ' +
        ':UFCNH, ' +
        ':DATAHABILITACAO, ' +
        ':PAGINA, ' +
        ':AGENTE, ' +
        ':STATUS, ' +
        ':OBS, ' +
        ':DATACADASTRO, ' +
        ':USUARIO, ' +
        ':VERBA, ' +
        ':COMBUSTIVEL, ' +
        ':TIPOCONTA, ' +
        ':BANCO, ' +
        ':AGENCIA, ' +
        ':CONTA, ' +
        ':FAVORECIDO, ' +
        ':CPFFAVORECIDO, ' +
        ':FORMAPAGAMENTO, ' +
        ':CENTROCUSTO, ' +
        ':ROUBO, ' +
        ':QTDEROUBO, ' +
        ':ACIDENTES, ' +
        ':QTDEACIDENTES, ' +
        ':TRANSPORTE, ' +
        ':QTDETRANSPORTE, ' +
        ':GV, ' +
        ':DATAGV ,' +
        ':EXECUTANTE, ' +
        ':ALTERACAO, ' +
        ':CHAVE, ' +
        ':GRUPO, ' +
        ':ROTEIRO, ' +
        ':MEI, ' +
        ':RAZAOMEI, ' +
        ':FANTASIAMEI, ' +
        ':CNPJMEI, ' +
        ':CODCNH)';
      MaxCadastro;
      // if Self.Funcionario <> 'E' then begin
      // MaxCodigo(Self.Funcionario);
      // end;
      ParamByName('CADASTRO').AsInteger := Self.Cadastro;
      ParamByName('FUNCIONARIO').AsString := Self.Funcionario;
      ParamByName('CODIGO').AsInteger := StrToInt(Self.Codigo);
      ParamByName('NOME').AsString := Self.Nome;
      ParamByName('TIPODOC').AsString := Self.TipoDoc;
      ParamByName('FANTASIA').AsString := Self.Alias;
      ParamByName('CPF').AsString := Self.CPF;
      ParamByName('NASCIMENTO').AsDate := Self.DtNascimento;
      ParamByName('RG').AsString := Self.RG;
      ParamByName('UFRG').AsString := Self.UFRG;
      ParamByName('EMISSORRG').AsString := Self.OrgaoRG;
      ParamByName('EMISSAORG').AsDate := Self.DataRG;
      ParamByName('UFNASCIMENTO').AsString := Self.UFNatural;
      ParamByName('NATURALIDADE').AsString := Self.Naturalidade;
      ParamByName('PAI').AsString := Self.NomePai;
      ParamByName('MAE').AsString := Self.NomeMae;
      ParamByName('IEST').AsString := '';
      ParamByName('IM').AsString := '';
      ParamByName('CNAE').AsString := '';
      ParamByName('CRT').AsInteger := 0;
      ParamByName('CNH').AsString := Self.Cnh;
      ParamByName('REGISTROCNH').AsString := Self.CNHRegistro;
      ParamByName('CATEGORIACNH').AsString := Self.CategoriaCnh;
      ParamByName('VALIDADECNH').AsDate := Self.ValidadeCnh;
      ParamByName('EMISSAOCNH').AsDate := Self.EmissaoCnh;
      ParamByName('UFCNH').AsString := Self.CNHUF;
      ParamByName('DATAHABILITACAO').AsDate := Self.DataPrimeiraCNH;
      ParamByName('PAGINA').AsString := '';
      ParamByName('AGENTE').AsInteger := Self.Agente;
      ParamByName('STATUS').AsInteger := Self.Status;
      ParamByName('OBS').AsString := Self.Obs;
      ParamByName('DATACADASTRO').AsDate := Self.DtCadastro;
      ParamByName('USUARIO').AsInteger := Self.Usuario;
      ParamByName('VERBA').AsFloat := Self.Verba;
      ParamByName('COMBUSTIVEL').AsFloat := Self.Combustivel;
      ParamByName('TIPOCONTA').AsString := Self.TipoConta;
      ParamByName('BANCO').AsString := Self.Banco;
      ParamByName('AGENCIA').AsString := Self.Agencia;
      ParamByName('CONTA').AsString := Self.NumeroConta;
      ParamByName('FAVORECIDO').AsString := Self.Favorecido;
      ParamByName('CPFFAVORECIDO').AsString := Self.CpfCnpjFavorecido;
      ParamByName('FORMAPAGAMENTO').AsString := Self.Forma;
      ParamByName('CENTROCUSTO').AsInteger := Self.CentroCusto;
      ParamByName('ROUBO').AsString := Self.Roubo;
      ParamByName('QTDEROUBO').AsInteger := Self.QtdRoubo;
      ParamByName('ACIDENTES').AsString := Self.Acidente;
      ParamByName('QTDEACIDENTES').AsInteger := Self.QtdAcidente;
      ParamByName('TRANSPORTE').AsString := Self.Tranporte;
      ParamByName('QTDETRANSPORTE').AsInteger := Self.QtdTranporte;
      ParamByName('GV').AsString := Self.GV;
      ParamByName('DATAGV').AsDate := Self.DataGV;
      ParamByName('EXECUTANTE').AsString := Self.Executante;
      ParamByName('ALTERACAO').AsDateTime := Self.Manutencao;
      ParamByName('CHAVE').AsString := Self.Chave;
      ParamByName('GRUPO').AsInteger := Self.Grupo;
      ParamByName('ROTEIRO').AsString := Self.Roteiro;
      ParamByName('MEI').AsString := Self.CodigoMEI;
      ParamByName('RAZAOMEI').AsString := Self.RazaoMEI;
      ParamByName('FANTASIAMEI').AsString := Self.FantasiaMEI;
      ParamByName('CNPJMEI').AsString := Self.CNPJMEI;
      ParamByName('CODCNH').AsString := Self.CodigoCNH;
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

function TEntregador.Update(): Boolean;
begin
  try
    Result := False;

    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'UPDATE ' + TABLENAME + ' SET ' +
        'DOM_FUNCIONARIO = :FUNCIONARIO, ' + 'COD_ENTREGADOR = :CODIGO, ' +
        'DES_TIPO_DOC = :TIPODOC, ' + 'DES_RAZAO_SOCIAL = :NOME, ' +
        'NOM_FANTASIA = :FANTASIA, ' + 'NUM_CNPJ = :CPF, ' +
        'DAT_NASCIMENTO = :NASCIMENTO, ' + 'NUM_IE = :RG , ' + 'UF_RG = :UFRG, ' +
        'NOM_EMISSOR_RG = :EMISSORRG, ' +
        'DAT_EMISSAO_RG = :EMISSAORG, ' + 'UF_NASCIMENTO = :UFNASCIMENTO, ' +
        'NOM_CIDADE_NASCIMENTO = :NATURALIDADE, ' + 'NOM_PAI = :PAI, ' +
        'NOM_MAE = :MAE, ' + 'NUM_IEST = :IEST, ' + 'NUM_IM = :IM, ' +
        'COD_CNAE = :CNAE, ' + 'COD_CRT = :CRT, ' + 'NUM_CNH = :CNH, ' +
        'NUM_REGISTRO_CNH = :REGISTROCNH, ' +
        'DES_CATEGORIA_CNH = :CATEGORIACNH, ' +
        'DAT_VALIDADE_CNH = :VALIDADECNH, ' +
        'DAT_EMISSAO_CNH = :EMISSAOCNH, ' +
        'UF_CNH = :UFCNH, ' +
        'DAT_1_HABILITACAO = :DATAHABILITACAO, ' + 'DES_PAGINA = :PAGINA, ' +
        'COD_AGENTE = :AGENTE, ' + 'COD_STATUS = :STATUS, ' +
        'DES_OBSERVACAO = :OBS, ' + 'DAT_CADASTRO = :DATACADASTRO, ' +
        'COD_USUARIO = :USUARIO, ' + 'VAL_VERBA = :VERBA, ' +
        'VAL_VERBA_COMBUSTIVEL = :COMBUSTIVEL, ' +
        'DES_TIPO_CONTA = :TIPOCONTA, ' + 'COD_BANCO = :BANCO, ' +
        'COD_AGENCIA = :AGENCIA, ' + 'NUM_CONTA = :CONTA, ' +
        'NOM_FAVORECIDO = :FAVORECIDO, ' +
        'NUM_CPF_CNPJ_FAVORECIDO = :CPFFAVORECIDO, ' +
        'DES_FORMA_PAGAMENTO = :FORMAPAGAMENTO, ' +
        'COD_CENTRO_CUSTO = :CENTROCUSTO, ' + 'DOM_VITIMA_ROUBO = :ROUBO, ' +
        'QTD_VITIMA_ROUBO = :QTDEROUBO, ' + 'DOM_ACIDENTES = :ACIDENTES, ' +
        'QTD_ACIDENTES = :QTDEACIDENTES, ' +
        'DOM_TRANSPORTE_EMPRESA = :TRANSPORTE, ' +
        'QTD_TRANSPORTE = :QTDETRANSPORTE, ' + 'DOM_GV = :GV, ' +
        'DAT_GV = :DATAGV, ' + 'NOM_EXECUTANTE = :EXECUTANTE, ' +
        'DAT_ALTERACAO = :ALTERACAO, ' + 'DES_CHAVE  = :CHAVE, ' +
        'COD_GRUPO = :GRUPO, COD_ROTEIRO = :ROTEIRO,  ' +
        'COD_MEI = :MEI, NOM_RAZAO_MEI = :RAZAOMEI,  ' +
        'NOM_FANTASIA_MEI = :FANTASIAMEI, NUM_CNPJ_MEI = :CNPJMEI,  ' +
        'COD_CNH = :CODCNH ' +
        'WHERE ' + 'COD_CADASTRO = :CADASTRO';

      ParamByName('CADASTRO').AsInteger := Self.Cadastro;
      ParamByName('FUNCIONARIO').AsString := Self.Funcionario;
      ParamByName('CODIGO').AsInteger := StrToInt(Self.Codigo);
      ParamByName('NOME').AsString := Self.Nome;
      ParamByName('TIPODOC').AsString := Self.TipoDoc;
      ParamByName('FANTASIA').AsString := Self.Alias;
      ParamByName('CPF').AsString := Self.CPF;
      ParamByName('NASCIMENTO').AsDate := Self.DtNascimento;
      ParamByName('RG').AsString := Self.RG;
      ParamByName('UFRG').AsString := Self.UFRG;
      ParamByName('EMISSORRG').AsString := Self.OrgaoRG;
      ParamByName('EMISSAORG').AsDate := Self.DataRG;
      ParamByName('UFNASCIMENTO').AsString := Self.UFNatural;
      ParamByName('NATURALIDADE').AsString := Self.Naturalidade;
      ParamByName('PAI').AsString := Self.NomePai;
      ParamByName('MAE').AsString := Self.NomeMae;
      ParamByName('IEST').AsString := '';
      ParamByName('IM').AsString := '';
      ParamByName('CNAE').AsString := '';
      ParamByName('CRT').AsInteger := 0;
      ParamByName('CNH').AsString := Self.Cnh;
      ParamByName('REGISTROCNH').AsString := Self.CNHRegistro;
      ParamByName('CATEGORIACNH').AsString := Self.CategoriaCnh;
      ParamByName('VALIDADECNH').AsDate := Self.ValidadeCnh;
      ParamByName('EMISSAOCNH').AsDate := Self.EmissaoCnh;
      ParamByName('UFCNH').AsString := Self.CNHUF;
      ParamByName('DATAHABILITACAO').AsDate := Self.DataPrimeiraCNH;
      ParamByName('PAGINA').AsString := '';
      ParamByName('AGENTE').AsInteger := Self.Agente;
      ParamByName('STATUS').AsInteger := Self.Status;
      ParamByName('OBS').AsString := Self.Obs;
      ParamByName('DATACADASTRO').AsDate := Self.DtCadastro;
      ParamByName('USUARIO').AsInteger := Self.Usuario;
      ParamByName('VERBA').AsFloat := Self.Verba;
      ParamByName('COMBUSTIVEL').AsFloat := Self.Combustivel;
      ParamByName('TIPOCONTA').AsString := Self.TipoConta;
      ParamByName('BANCO').AsString := Self.Banco;
      ParamByName('AGENCIA').AsString := Self.Agencia;
      ParamByName('CONTA').AsString := Self.NumeroConta;
      ParamByName('FAVORECIDO').AsString := Self.Favorecido;
      ParamByName('CPFFAVORECIDO').AsString := Self.CpfCnpjFavorecido;
      ParamByName('FORMAPAGAMENTO').AsString := Self.Forma;
      ParamByName('CENTROCUSTO').AsInteger := Self.CentroCusto;
      ParamByName('ROUBO').AsString := Self.Roubo;
      ParamByName('QTDEROUBO').AsInteger := Self.QtdRoubo;
      ParamByName('ACIDENTES').AsString := Self.Acidente;
      ParamByName('QTDEACIDENTES').AsInteger := Self.QtdAcidente;
      ParamByName('TRANSPORTE').AsString := Self.Tranporte;
      ParamByName('QTDETRANSPORTE').AsInteger := Self.QtdTranporte;
      ParamByName('GV').AsString := Self.GV;
      ParamByName('DATAGV').AsDate := Self.DataGV;
      ParamByName('EXECUTANTE').AsString := Self.Executante;
      ParamByName('ALTERACAO').AsDateTime := Self.Manutencao;
      ParamByName('CHAVE').AsString := Self.Chave;
      ParamByName('GRUPO').AsInteger := Self.Grupo;
      ParamByName('ROTEIRO').AsString := Self.Roteiro;
      ParamByName('MEI').AsString := Self.CodigoMEI;
      ParamByName('RAZAOMEI').AsString := Self.RazaoMEI;
      ParamByName('FANTASIAMEI').AsString := Self.FantasiaMEI;
      ParamByName('CNPJMEI').AsString := Self.CNPJMEI;
      ParamByName('CODCNH').AsString := Self.CodigoCNH;
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

function TEntregador.getFantasiaMEI: String;
begin
  Result := _fantasiaMEI;
end;

function TEntregador.getField(campo, coluna: String): String;
begin
  Try
    Result := '';

    with dm.qryFields do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT ' + campo + ' FROM ' + TABLENAME;

      if coluna = 'CADASTRO' then
      begin
        SQL.Add(' WHERE COD_CADASTRO = :CADASTRO ');
        ParamByName('CADASTRO').AsInteger := Self.Cadastro;
      end
      else if coluna = 'CODIGO' then
      begin
        SQL.Add(' WHERE COD_ENTREGADOR =:CODIGO ');
        ParamByName('CODIGO').AsInteger := StrToInt(Self.Codigo);
      end
      else if coluna = 'NOME' then
      begin
        SQL.Add(' WHERE DES_RAZAO_SOCIAL =:NOME ');
        ParamByName('NOME').AsString := Self.Nome;
      end
      else if coluna = 'ALIAS' then
      begin
        SQL.Add(' WHERE NOM_FANTASIA =:FANTASIA ');
        ParamByName('FANTASIA').AsString := Self.Alias;
      end
      else if coluna = 'CPF' then
      begin
        SQL.Add(' WHERE NUM_CNPJ =:CPF ');
        ParamByName('CPF').AsString := Self.CPF;
      end
      else if coluna = 'ROTEIRO' then
      begin
        SQL.Add(' WHERE COD_ROTEIRO LIKE :ROTEIRO ');
        ParamByName('ROTEIRO').AsString :=  '%' + Self.Roteiro + '%';
      end
      else if coluna = 'CHAVE' then
      begin
        SQL.Add(' WHERE DES_CHAVE =:CHAVE');
        ParamByName('CHAVE').AsString := Self.Chave;
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

function TEntregador.getObjects(): Boolean;
begin
  Try
    Result := False;

    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);
      dm.ZConn.PingServer;
      Open;
      if not IsEmpty then
        First
      else
      begin
        Close;
        SQL.Clear;
      end;
    end;
    if dm.QryGetObject.RecordCount > 0 then
      Result := True;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TEntregador.Search(id, filtro: String): Boolean;
var
  sSQL: String;
begin
  try

    Result := False;

    with dm.qryGeral do
    begin
      SQL.Add('SELECT COD_ENTREGADOR, DES_RAZAO_SOCIAL, NOM_FANTASIA, NUM_CNPJ FROM '
        + TABLENAME);
      if filtro = 'CADASTRO' then
      begin
        SQL.Add(' WHERE COD_CADASTRO = :CADASTRO ');
        ParamByName('CADASTRO').AsInteger := Self.Cadastro;
      end
      else if filtro = 'CODIGO' then
      begin
        SQL.Add(' WHERE COD_ENTREGADOR =:CODIGO ');
        ParamByName('CODIGO').AsString := Self.Codigo;
      end
      else if filtro = 'NOME' then
      begin
        SQL.Add(' WHERE DES_RAZAO_SOCIAL LIKE %:NOME% ');
        ParamByName('NOME').AsString := Self.Nome;
      end
      else if filtro = 'ALIAS' then
      begin
        SQL.Add(' WHERE NOM_FANTASIA LIKE %:FANTASIA% ');
        ParamByName('FANTASIA').AsString := Self.Alias;
      end
      else if filtro = 'CPF' then
      begin
        SQL.Add(' WHERE NUM_CNPJ = :CPF ');
        ParamByName('CPF').AsString := Self.CPF;
      end
      else if filtro = 'CHAVE' then
      begin
        SQL.Add(' WHERE DES_CHAVE = :CHAVE ');
        ParamByName('CHAVE').AsString := Self.Chave;
      end;
    end;
    dm.ZConn.PingServer;
    dm.qryGeral.Open;

    if dm.qryGeral.IsEmpty then
    begin
      dm.qryGeral.Close;
      dm.qryGeral.SQL.Clear;
      Exit;
    end;

    Result := True;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TEntregador.JaExiste(): Boolean;
begin
  try
    Result := False;

    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);
      SQL.Add(' WHERE NUM_CNPJ = :CNPJ');
      ParamByName('CNPJ').AsString := Self.CPF;
      dm.ZConn.PingServer;
      Open;
      if not(IsEmpty) then
        Result := True;
    end;

    dm.QryGetObject.Close;
    dm.QryGetObject.SQL.Clear;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TEntregador.Merge(): Boolean;
begin
  Result := False;
  if Self.Operacao = 'I' then
  begin
    if not(Self.Insert()) then
    begin
      MessageDlg('Erro ao tentar incluir dados!', mtWarning, [mbOK], 0);
      Exit;
    end;
  end
  else if Self.Operacao = 'U' then
  begin
    if not(Self.Update()) then
    begin
      MessageDlg('Erro ao tentar alterar dados!', mtWarning, [mbOK], 0);
      Exit;
    end;
  end;
  Result := True;
end;

procedure TEntregador.MaxCodigo(sTipo: string);
begin
  try
    with dm.qryGeral do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT MAX(COD_ENTREGADOR) AS CODIGO FROM ' + TABLENAME +
        ' WHERE DOM_FUNCIONARIO = :TIPO');
      ParamByName('TIPO').AsString := sTipo;
      dm.ZConn.PingServer;
      Open;
      if not(IsEmpty) then
      begin
        Self.Codigo := IntToStr(FieldByName('CODIGO').AsInteger + 1);
      end
      else
      begin
        Self.Codigo := '1';
      end;
      Close;
      SQL.Clear;
    end;
  except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

procedure TEntregador.MaxCadastro();
begin
  try
    with dm.qryGeral do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT MAX(COD_CADASTRO) AS CADASTRO FROM ' + TABLENAME);
      dm.ZConn.PingServer;
      Open;
      if not(IsEmpty) then
      begin
        Self.Cadastro := FieldByName('CADASTRO').AsInteger + 1;
      end
      else
      begin
        Self.Cadastro := 1;
      end;
      Close;
      SQL.Clear;
    end;
  except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TEntregador.ListaEntregadores: Boolean;
begin
  Result := False;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  dm.qryPesquisa.SQL.Text := 'SELECT COD_CADASTRO, DES_RAZAO_SOCIAL, NOM_FANTASIA, DOM_FUNCIONARIO, COD_ROTEIRO FROM ' + TABLENAME +
                             ' WHERE DOM_FUNCIONARIO IN ('  + QuotedStr('T') + ',' +  QuotedStr('P') + ')';
  dm.ZConn.PingServer;
  dm.qryPesquisa.Open;
  if dm.qryPesquisa.IsEmpty then
  begin
    dm.qryPesquisa.Close;
    dm.qryPesquisa.SQL.Clear;
    Exit;
  end;
  Result := True;
end;

function TEntregador.PopulaLocal(filtro: string): TStringList;
var
  lista: TStringList;
  campo: String;
begin
  lista := TStringList.Create;
  Result := lista;
  if filtro = 'NATURAL' then
  begin
    campo := 'NOM_CIDADE_NASCIMENTO';
  end
  else
  begin
    Exit;
  end;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  dm.qryPesquisa.SQL.Text := 'SELECT DISTINCT(' + campo + ') FROM ' + TABLENAME;
  dm.ZConn.PingServer;
  dm.qryPesquisa.Open;
  while (not dm.qryPesquisa.Eof) do
  begin
    lista.Add(dm.qryPesquisa.FieldByName(campo).AsString);
    dm.qryPesquisa.Next;
  end;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  Result := lista;
end;

procedure TEntregador.serRazaoMEI(const Value: String);
begin
  _razaoMEI := value;
end;

procedure TEntregador.setAcidente(const Value: String);
begin
  _acidente := Value;
end;

procedure TEntregador.setAgente(const Value: Integer);
begin
  _agente := Value;
end;

procedure TEntregador.setCadastro(const Value: Integer);
begin
  _cadastro := Value;
end;

procedure TEntregador.setCentroCusto(const Value: Integer);
begin
  _centrocusto := Value;
end;

procedure TEntregador.setChave(const Value: String);
begin
  _chave := Value;
end;

procedure TEntregador.setCNPJMEI(const Value: String);
begin
  _cnpjMEI := value;
end;

procedure TEntregador.setCodigo(const Value: String);
begin
  _codigo := Value;
end;

procedure TEntregador.setCodigoMEI(const Value: String);
begin
  _codMEI := value;
end;

procedure TEntregador.setCombustivel(const Value: Double);
begin
  _combustivel := Value;
end;

procedure TEntregador.setDataGV(const Value: TDate);
begin
  _datagv := Value;
end;

procedure TEntregador.setdtCadastro(const Value: TDate);
begin
  _datacadastro := Value;
end;

procedure TEntregador.setdtUsuario(const Value: Integer);
begin
  _usuario := Value;
end;

procedure TEntregador.setExecutante(const Value: String);
begin
  _executante := Value;
end;

procedure TEntregador.setFantasiaMEI(const Value: String);
begin
  _fantasiaMEI := value;
end;

procedure TEntregador.setFuncionario(const Value: String);
begin
  _funcionario := Value;
end;

procedure TEntregador.setGrupo(const Value: Integer);
begin
  _grupo := Value;
end;

procedure TEntregador.setGV(const Value: String);
begin
  _gv := Value;
end;

procedure TEntregador.setManutencao(const Value: TDateTime);
begin
  _manutencao := Value;
end;

procedure TEntregador.setObs(const Value: String);
begin
  _observacao := Value;
end;

procedure TEntregador.setOperacao(const Value: String);
begin
  _operacao := Value;
end;

procedure TEntregador.setQtdAcidente(const Value: Integer);
begin
  _qtdacidentes := Value;
end;

procedure TEntregador.setQtdRoubo(const Value: Integer);
begin
  _qtdvitima := Value;
end;

procedure TEntregador.setQtdTranporte(const Value: Integer);
begin
  _qtdtransporte := Value;
end;

procedure TEntregador.setRoteiro(const Value: String);
begin
  _roteiro := Value;
end;

procedure TEntregador.setRoubo(const Value: String);
begin
  _vitimaroubo := Value;
end;

procedure TEntregador.setStatus(const Value: Integer);
begin
  _status := Value;
end;

procedure TEntregador.setTranporte(const Value: String);
begin
  _transporte := Value;
end;

procedure TEntregador.setVerba(const Value: Double);
begin
  _verba := Value;
end;

end.
