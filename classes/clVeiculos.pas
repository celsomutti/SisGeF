unit clVeiculos;

interface

uses
  clPessoaF, System.Classes, clConexao;

type
  TVeiculos = class(TPessoaF)

  private
    function getAno: String;
    function getChassi: String;
    function getCodigo: Integer;
    function getCor: String;
    function getEntregador: Integer;
    function getExecutor: String;
    function getManutencao: TDateTime;
    function getMarca: String;
    function getModelo: String;
    function getPlaca: String;
    function getRenavan: String;
    function getTipo: String;
    function getBairro: String;
    function getCEP: String;
    function getCidade: String;
    function getDescricao1: String;
    function getDescricao2: String;
    function getEndereco: String;
    function getExercicio: String;
    function getRastreado: String;
    function getTelefone1: String;
    function getTelefone2: String;
    function getUF: String;
    function getAbastecimento: String;
    function getCidadePlaca: String;
    function getUFPlaca: String;
    procedure setBairro(const Value: String);
    procedure setCEP(const Value: String);
    procedure setCidade(const Value: String);
    procedure setDescricao1(const Value: String);
    procedure setDescricao2(const Value: String);
    procedure setEndereco(const Value: String);
    procedure setExercicio(const Value: String);
    procedure setRastreado(const Value: String);
    procedure setTelefone1(const Value: String);
    procedure setTelefone2(const Value: String);
    procedure setUF(const Value: String);
    procedure setAno(const Value: String);
    procedure setChassi(const Value: String);
    procedure setCodigo(const Value: Integer);
    procedure setCor(const Value: String);
    procedure setEntregador(const Value: Integer);
    procedure setExecutor(const Value: String);
    procedure setManutencao(const Value: TDateTime);
    procedure setMarca(const Value: String);
    procedure setModelo(const Value: String);
    procedure setPlaca(const Value: String);
    procedure setRenavan(const Value: String);
    procedure setTipo(const Value: String);
    procedure setAbastecimento(const Value: String);
    procedure setCidadePlaca(const Value: String);
    procedure setUFPlaca(const Value: String);

    constructor Create;
    destructor Destroy;

  protected
    _codigo: Integer;
    _uf: String;
    _cidade: String;
    _endereco: String;
    _cep: String;
    _bairro: String;
    _telefone1: String;
    _destel1: String;
    _telefone2: String;
    _destel2: String;
    _entregador: Integer;
    _marca: String;
    _modelo: String;
    _placa: String;
    _ufplaca: String;
    _cidadeplaca: String;
    _tipo: String;
    _chassi: String;
    _ano: String;
    _cor: String;
    _renavan: String;
    _exercicio: String;
    _rastreado: String;
    _abastecimento: String;
    _executor: String;
    _manutencao: TDateTime;
    _conexao: TConexao;
  public
    property Codigo: Integer read getCodigo write setCodigo;
    property UF: String read getUF write setUF;
    property Cidade: String read getCidade write setCidade;
    property Endereco: String read getEndereco write setEndereco;
    property CEP: String read getCEP write setCEP;
    property Bairro: String read getBairro write setBairro;
    property Telefone1: String read getTelefone1 write setTelefone1;
    property Descricao1: String read getDescricao1 write setDescricao1;
    property Telefone2: String read getTelefone2 write setTelefone2;
    property Descricao2: String read getDescricao2 write setDescricao2;
    property Entregador: Integer read getEntregador write setEntregador;
    property Marca: String read getMarca write setMarca;
    property Modelo: String read getModelo write setModelo;
    property Placa: String read getPlaca write setPlaca;
    property UFPlaca: String read getUFPlaca write setUFPlaca;
    property CidadePlaca: String read getCidadePlaca write setCidadePlaca;
    property Tipo: String read getTipo write setTipo;
    property Chassi: String read getChassi write setChassi;
    property Ano: String read getAno write setAno;
    property Cor: String read getCor write setCor;
    property Renavan: String read getRenavan write setRenavan;
    property Exercicio: String read getExercicio write setExercicio;
    property Rastreado: String read getRastreado write setRastreado;
    property Abastecimento: String read getAbastecimento write setAbastecimento;
    property Executor: String read getExecutor write setExecutor;
    property Manutencao: TDateTime read getManutencao write setManutencao;

    function Validar(): Boolean;
    function Delete(filtro: String): Boolean;
    function getObject(id, filtro: String): Boolean;
    function Insert(): Boolean;
    function Update(): Boolean;
    function getField(campo, coluna: String): String;
    function getObjects(): Boolean;
    function PopulaLocal(filtro: string): TStringList;

    procedure MaxCodigo;

  end;

const
  TABLENAME = 'tbveiculos';

implementation

{ TVeiculos }

uses SysUtils, Dialogs, udm, clUtil, ZDataset, ZAbstractRODataset, DB;

constructor TVeiculos.Create;
begin
  _conexao := TConexao.Create;
  if (not _conexao.VerifyConnZEOS(0)) then
  begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
      Self.ClassName + ') !', mtError, [mbCancel], 0);
  end;
end;

destructor TVeiculos.Destroy;
begin
  _conexao.Free;
end;

function TVeiculos.getAbastecimento: String;
begin
  Result := _abastecimento;
end;

function TVeiculos.getAno: String;
begin
  Result := _ano;
end;

function TVeiculos.getBairro: String;
begin
  Result := _bairro;
end;

function TVeiculos.getCEP: String;
begin
  Result := _cep;
end;

function TVeiculos.getChassi: String;
begin
  Result := _chassi;
end;

function TVeiculos.getCidade: String;
begin
  Result := _cidade;
end;

function TVeiculos.getCidadePlaca: String;
begin
  Result := _cidadeplaca;
end;

function TVeiculos.getCodigo: Integer;
begin
  Result := _codigo;
end;

function TVeiculos.getCor: String;
begin
  Result := _cor;
end;

function TVeiculos.getDescricao1: String;
begin
  Result := _destel1;
end;

function TVeiculos.getDescricao2: String;
begin
  Result := _destel2;
end;

function TVeiculos.getEndereco: String;
begin
  Result := _endereco;
end;

function TVeiculos.getEntregador: Integer;
begin
  Result := _entregador;
end;

function TVeiculos.getExecutor: String;
begin
  Result := _executor;
end;

function TVeiculos.getExercicio: String;
begin
  Result := _exercicio
end;

function TVeiculos.getManutencao: TDateTime;
begin
  Result := _manutencao;
end;

function TVeiculos.getMarca: String;
begin
  Result := _marca;
end;

function TVeiculos.getModelo: String;
begin
  Result := _modelo;
end;

function TVeiculos.getPlaca: String;
begin
  Result := _placa;
end;

function TVeiculos.getRastreado: String;
begin
  Result := _rastreado;
end;

function TVeiculos.getRenavan: String;
begin
  Result := _renavan;
end;

function TVeiculos.getTelefone1: String;
begin
  Result := _telefone1;
end;

function TVeiculos.getTelefone2: String;
begin
  Result := _telefone2;
end;

function TVeiculos.getTipo: String;
begin
  Result := _tipo;
end;

function TVeiculos.getUF: String;
begin
  Result := _uf;
end;

function TVeiculos.getUFPlaca: String;
begin
  Result := _ufplaca;
end;

function TVeiculos.Validar(): Boolean;
begin
  try
    Result := False;
    { if Self.Entregador = 0 then begin
      MessageDlg('Informe o Entregador!',mtWarning,[mbOK],0);
      Exit;
      end; }
    if TUtil.Empty(Self.Placa) then
    begin
      MessageDlg('Informe a Placa do Veículo!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if TUtil.Empty(Self.Tipo) then
    begin
      MessageDlg('Informe o Tipo do Veículo!', mtWarning, [mbOK], 0);
      Exit;
    end;
    Result := True;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TVeiculos.Delete(filtro: String): Boolean;
begin
  try
    Result := False;
    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Add('DELETE FROM ' + TABLENAME);
      if filtro = 'PLACA' then
      begin
        SQL.Add('WHERE DES_PLACA = :PLACA');
        ParamByName('PLACA').AsString := Self.Placa;
      end
      else if filtro = 'ENTREGADOR' then
      begin
        SQL.Add('WHERE COD_ENTREGADOR = :ENTREGADOR');
        ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
      end
      else if filtro = 'CODIGO' then
      begin
        SQL.Add('WHERE COD_VEICULO = :CODIGO');
        ParamByName('CODIGO').AsInteger := Self.Codigo;
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

function TVeiculos.getObject(id, filtro: String): Boolean;
begin
  try
    Result := False;
    if TUtil.Empty(id) then
      Exit;
    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);

      if filtro = 'PLACA' then
      begin
        SQL.Add('WHERE DES_PLACA = :PLACA');
        ParamByName('PLACA').AsString := id;
      end
      else if filtro = 'CODIGO' then
      begin
        SQL.Add('WHERE COD_VEICULO = :CODIGO');
        ParamByName('CODIGO').AsInteger := StrToInt(id);
      end
      else if filtro = 'MARCA' then
      begin
        SQL.Add('WHERE DES_MARCA = :MARCA');
        ParamByName('MARCA').AsString := id;
      end
      else if filtro = 'CHASSI' then
      begin
        SQL.Add('WHERE NUM_CHASSIS = :CHASSI');
        ParamByName('CHASSI').AsString := id;
      end
      else if filtro = 'RENAVAN' then
      begin
        SQL.Add('WHERE NUM_RENAVAN = :RENAVAN');
        ParamByName('RENAVAN').AsString := id;
      end
      else if filtro = 'MODELO' then
      begin
        SQL.Add('WHERE DES_MODELO = :MODELO');
        ParamByName('MODELO').AsString := id;
      end
      else if filtro = 'ENTREGADOR' then
      begin
        SQL.Add('WHERE COD_ENTREGADOR = :ENTREGADOR');
        ParamByName('ENTREGADOR').AsInteger := StrToInt(id);
      end
      else if filtro = 'TIPO' then
      begin
        SQL.Add('WHERE DES_TIPO = :TIPO');
        ParamByName('TIPO').AsString := id;
      end
      else if filtro = 'ANO' then
      begin
        SQL.Add('WHERE DES_ANO = :ANO');
        ParamByName('ANO').AsString := Self.Ano;
      end
      else if filtro = 'CPF' then
      begin
        SQL.Add('WHERE NUM_CNPJ = :CPF');
        ParamByName('CPF').AsString := id;
      end;
      dm.ZConn.PingServer;
      Open;
      if not IsEmpty then
        First;
    end;

    if dm.QryGetObject.RecordCount > 0 then
    begin
      Self.Codigo := dm.QryGetObject.FieldByName('COD_VEICULO').AsInteger;
      Self.TipoDoc := dm.QryGetObject.FieldByName('DES_TIPO_DOC').AsString;
      Self.CPF := dm.QryGetObject.FieldByName('NUM_CNPJ').AsString;
      Self.Nome := dm.QryGetObject.FieldByName('NOM_PROPRIETARIO').AsString;
      Self.DtNascimento := dm.QryGetObject.FieldByName('DAT_NASCIMENTO')
        .AsDateTime;
      Self.NomeMae := dm.QryGetObject.FieldByName('NOM_MAE').AsString;
      Self.NomePai := dm.QryGetObject.FieldByName('NOM_PAI').AsString;
      Self.RG := dm.QryGetObject.FieldByName('NUM_RG').AsString;
      Self.UFRG := dm.QryGetObject.FieldByName('UF_RG').AsString;
      Self.DataRG := dm.QryGetObject.FieldByName('DAT_EMISSAO_RG').AsDateTime;
      Self.UF := dm.QryGetObject.FieldByName('UF_ENDERECO').AsString;
      Self.Cidade := dm.QryGetObject.FieldByName('NOM_CIDADE').AsString;
      Self.Endereco := dm.QryGetObject.FieldByName('DES_ENDERECO').AsString;
      Self.CEP := dm.QryGetObject.FieldByName('NUM_CEP').AsString;
      Self.Bairro := dm.QryGetObject.FieldByName('DES_BAIRRO').AsString;
      Self.Telefone1 := dm.QryGetObject.FieldByName('NUM_TELEFONE_1').AsString;
      Self.Descricao1 := dm.QryGetObject.FieldByName('DES_TELEFONE_1').AsString;
      Self.Telefone2 := dm.QryGetObject.FieldByName('NUM_TELEFONE_2').AsString;
      Self.Descricao2 := dm.QryGetObject.FieldByName('DES_TELEFONE_2').AsString;
      Self.Entregador := dm.QryGetObject.FieldByName('COD_ENTREGADOR')
        .AsInteger;
      Self.Marca := dm.QryGetObject.FieldByName('DES_MARCA').AsString;
      Self.Modelo := dm.QryGetObject.FieldByName('DES_MODELO').AsString;
      Self.Placa := dm.QryGetObject.FieldByName('DES_PLACA').AsString;
      Self.UFPlaca := dm.QryGetObject.FieldByName('UF_PLACA').AsString;
      Self.CidadePlaca := dm.QryGetObject.FieldByName
        ('NOM_CIDADE_PLACA').AsString;
      Self.Tipo := dm.QryGetObject.FieldByName('DES_TIPO').AsString;
      Self.Chassi := dm.QryGetObject.FieldByName('NUM_CHASSIS').AsString;
      Self.Ano := dm.QryGetObject.FieldByName('DES_ANO').AsString;
      Self.Cor := dm.QryGetObject.FieldByName('DES_COR').AsString;
      Self.Renavan := dm.QryGetObject.FieldByName('NUM_RENAVAN').AsString;
      Self.Exercicio := dm.QryGetObject.FieldByName
        ('ANO_EXERCICIO_CLRV').AsString;
      Self.Rastreado := dm.QryGetObject.FieldByName('DOM_RASTREAMENTO')
        .AsString;
      Self.Abastecimento := dm.QryGetObject.FieldByName
        ('DOM_ABASTECIMENTO').AsString;
      Self.Executor := dm.QryGetObject.FieldByName('NOM_EXECUTOR').AsString;
      Self.Manutencao := dm.QryGetObject.FieldByName('DAT_MANUTENCAO')
        .AsDateTime;
      Result := True;
    end
    else
    begin
      dm.QryGetObject.Close;
      dm.QryGetObject.SQL.Clear;
    end;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TVeiculos.Insert(): Boolean;
begin
  Try
    Result := False;

    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'INSERT INTO ' + TABLENAME + '(' + 'COD_VEICULO, ' +
        'DES_TIPO_DOC, ' + 'NUM_CNPJ, ' + 'NOM_PROPRIETARIO, ' +
        'DAT_NASCIMENTO, ' + 'NOM_MAE, ' + 'NOM_PAI, ' + 'NUM_RG, ' + 'UF_RG, '
        + 'DAT_EMISSAO_RG, ' + 'UF_ENDERECO, ' + 'NOM_CIDADE, ' +
        'DES_ENDERECO, ' + 'NUM_CEP, ' + 'DES_BAIRRO, ' + 'NUM_TELEFONE_1, ' +
        'DES_TELEFONE_1, ' + 'NUM_TELEFONE_2, ' + 'DES_TELEFONE_2, ' +
        'COD_ENTREGADOR, ' + 'DES_MARCA, ' + 'DES_MODELO, ' + 'DES_PLACA, ' +
        'UF_PLACA, ' + 'NOM_CIDADE_PLACA, ' + 'DES_TIPO, ' + 'NUM_CHASSIS, ' +
        'DES_ANO, ' + 'DES_COR, ' + 'NUM_RENAVAN, ' + 'ANO_EXERCICIO_CLRV, ' +
        'DOM_RASTREAMENTO, ' + 'DOM_ABASTECIMENTO, ' + 'NOM_EXECUTOR, ' +
        'DAT_MANUTENCAO) ' + 'VALUES (' + ':CODIGO, ' + ':TIPODOC, ' + ':CNPJ, '
        + ':PROPRIETARIO, ' + ':NASCIMENTO, ' + ':MAE, ' + ':PAI, ' + ':RG, ' +
        ':UFRG, ' + ':DATARG, ' + ':UF, ' + ':CIDADE, ' + ':ENDERECO, ' +
        ':CEP, ' + ':BAIRRO, ' + ':TELEFONE1, ' + ':DESTEL1, ' + ':TELEFONE2, '
        + ':DESTEL2, ' + ':ENTREGADOR, ' + ':MARCA, ' + ':MODELO, ' + ':PLACA, '
        + ':UFPLACA, ' + ':CIDADEPLACA, ' + ':TIPO, ' + ':CHASSIS, ' + ':ANO, '
        + ':COR, ' + ':RENAVAN, ' + ':EXERCICIO, ' + ':RASTREAMENTO, ' +
        ':ABASTECIMENTO, ' + ':EXECUTOR, ' + ':MANUTENCAO)';

      MaxCodigo;

      ParamByName('CODIGO').AsInteger := Self.Codigo;
      ParamByName('TIPODOC').AsString := Self.TipoDoc;
      ParamByName('CNPJ').AsString := Self.CPF;
      ParamByName('PROPRIETARIO').AsString := Self.Nome;
      ParamByName('NASCIMENTO').AsDate := Self.DtNascimento;
      ParamByName('MAE').AsString := Self.NomeMae;
      ParamByName('PAI').AsString := Self.NomePai;
      ParamByName('RG').AsString := Self.RG;
      ParamByName('UFRG').AsString := Self.UFRG;
      ParamByName('DATARG').AsDate := Self.DataRG;
      ParamByName('UF').AsString := Self.UF;
      ParamByName('CIDADE').AsString := Self.Cidade;
      ParamByName('ENDERECO').AsString := Self.Endereco;
      ParamByName('CEP').AsString := Self.CEP;
      ParamByName('BAIRRO').AsString := Self.Bairro;
      ParamByName('TELEFONE1').AsString := Self.Telefone1;
      ParamByName('DESTEL1').AsString := Self.Descricao1;
      ParamByName('TELEFONE2').AsString := Self.Telefone2;
      ParamByName('DESTEL2').AsString := Self.Descricao2;
      ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
      ParamByName('MARCA').AsString := Self.Marca;
      ParamByName('MODELO').AsString := Self.Modelo;
      ParamByName('PLACA').AsString := Self.Placa;
      ParamByName('UFPLACA').AsString := Self.UFPlaca;
      ParamByName('CIDADEPLACA').AsString := Self.CidadePlaca;
      ParamByName('TIPO').AsString := Self.Tipo;
      ParamByName('CHASSIS').AsString := Self.Chassi;
      ParamByName('ANO').AsString := Self.Ano;
      ParamByName('COR').AsString := Self.Cor;
      ParamByName('RENAVAN').AsString := Self.Renavan;
      ParamByName('EXERCICIO').AsString := Self.Exercicio;
      ParamByName('RASTREAMENTO').AsString := Self.Rastreado;
      ParamByName('ABASTECIMENTO').AsString := Self.Abastecimento;
      ParamByName('EXECUTOR').AsString := Self.Executor;
      ParamByName('MANUTENCAO').AsDateTime := Self.Manutencao;
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

function TVeiculos.Update(): Boolean;
begin
  try
    Result := False;

    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'UPDATE ' + TABLENAME + ' SET ' + 'DES_TIPO_DOC = :TIPODOC, '
        + 'NUM_CNPJ = :CNPJ, ' + 'NOM_PROPRIETARIO = :PROPRIETARIO, ' +
        'DAT_NASCIMENTO = :NASCIMENTO, ' + 'NOM_MAE = :MAE, ' +
        'NOM_PAI = :PAI, ' + 'NUM_RG = :RG, ' + 'UF_RG = :UFRG, ' +
        'DAT_EMISSAO_RG = :DATARG, ' + 'UF_ENDERECO = :UF, ' +
        'NOM_CIDADE = :CIDADE, ' + 'DES_ENDERECO = :ENDERECO, ' +
        'NUM_CEP = :CEP, ' + 'DES_BAIRRO = :BAIRRO, ' +
        'NUM_TELEFONE_1 = :TELEFONE1, ' + 'DES_TELEFONE_1 = :DESTEL1, ' +
        'NUM_TELEFONE_2 = :TELEFONE2, ' + 'DES_TELEFONE_2 = :DESTEL2, ' +
        'COD_ENTREGADOR = :ENTREGADOR, ' + 'DES_MARCA = :MARCA, ' +
        'DES_MODELO = :MODELO, ' + 'DES_PLACA = :PLACA, ' +
        'UF_PLACA = :UFPLACA, ' + 'NOM_CIDADE_PLACA = :CIDADEPLACA, ' +
        'DES_TIPO = :TIPO, ' + 'NUM_CHASSIS = :CHASSIS, ' + 'DES_ANO = :ANO, ' +
        'DES_COR = :COR, ' + 'NUM_RENAVAN = :RENAVAN, ' +
        'ANO_EXERCICIO_CLRV = :EXERCICIO, ' +
        'DOM_RASTREAMENTO = :RASTREAMENTO, ' +
        'DOM_ABASTECIMENTO = :ABASTECIMENTO, ' + 'NOM_EXECUTOR = :EXECUTOR, ' +
        'DAT_MANUTENCAO = :MANUTENCAO ' + 'WHERE ' + 'COD_VEICULO  = :CODIGO';

      ParamByName('CODIGO').AsInteger := Self.Codigo;
      ParamByName('TIPODOC').AsString := Self.TipoDoc;
      ParamByName('CNPJ').AsString := Self.CPF;
      ParamByName('PROPRIETARIO').AsString := Self.Nome;
      ParamByName('NASCIMENTO').AsDate := Self.DtNascimento;
      ParamByName('MAE').AsString := Self.NomeMae;
      ParamByName('PAI').AsString := Self.NomePai;
      ParamByName('RG').AsString := Self.RG;
      ParamByName('UFRG').AsString := Self.UFRG;
      ParamByName('DATARG').AsDate := Self.DataRG;
      ParamByName('UF').AsString := Self.UF;
      ParamByName('CIDADE').AsString := Self.Cidade;
      ParamByName('ENDERECO').AsString := Self.Endereco;
      ParamByName('CEP').AsString := Self.CEP;
      ParamByName('BAIRRO').AsString := Self.Bairro;
      ParamByName('TELEFONE1').AsString := Self.Telefone1;
      ParamByName('DESTEL1').AsString := Self.Descricao1;
      ParamByName('TELEFONE2').AsString := Self.Telefone2;
      ParamByName('DESTEL2').AsString := Self.Descricao2;
      ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
      ParamByName('MARCA').AsString := Self.Marca;
      ParamByName('MODELO').AsString := Self.Modelo;
      ParamByName('PLACA').AsString := Self.Placa;
      ParamByName('UFPLACA').AsString := Self.UFPlaca;
      ParamByName('CIDADEPLACA').AsString := Self.CidadePlaca;
      ParamByName('TIPO').AsString := Self.Tipo;
      ParamByName('CHASSIS').AsString := Self.Chassi;
      ParamByName('ANO').AsString := Self.Ano;
      ParamByName('COR').AsString := Self.Cor;
      ParamByName('RENAVAN').AsString := Self.Renavan;
      ParamByName('EXERCICIO').AsString := Self.Exercicio;
      ParamByName('RASTREAMENTO').AsString := Self.Rastreado;
      ParamByName('ABASTECIMENTO').AsString := Self.Abastecimento;
      ParamByName('EXECUTOR').AsString := Self.Executor;
      ParamByName('MANUTENCAO').AsDateTime := Self.Manutencao;
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

function TVeiculos.getField(campo, coluna: String): String;
begin
  Try
    Result := '';

    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT ' + campo + ' FROM ' + TABLENAME;

      if coluna = 'ENTREGADOR' then
      begin
        SQL.Add(' WHERE COD_ENTREGADOR  = :ENTREGADOR ');
        ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
      end
      else if coluna = 'CODIGO' then
      begin
        SQL.Add(' WHERE COD_VEICULO     = :CODIGO ');
        ParamByName('CODIGO').AsInteger := Self.Codigo;
      end
      else if coluna = 'CHASSI' then
      begin
        SQL.Add(' WHERE NUM_CHASSIS      = :CHASSI ');
        ParamByName('CHASSI').AsString := Self.Chassi;
      end
      else if coluna = 'RENAVAN' then
      begin
        SQL.Add(' WHERE NUM_RENAVAN     = :RENAVAN ');
        ParamByName('RENAVAN').AsString := Self.Renavan;
      end
      else if coluna = 'PLACA' then
      begin
        SQL.Add(' WHERE DES_PLACA       = :PLACA ');
        ParamByName('PLACA').AsString := Self.Placa;
      end;
      dm.ZConn.PingServer;
      Open;
      if not IsEmpty then
      begin
        First;
        Result := FieldByName(campo).AsString;
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

function TVeiculos.getObjects(): Boolean;
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
      end
      else
      begin
        First;
      end;
    end;

    Result := True;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

procedure TVeiculos.MaxCodigo;
begin
  try
    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT MAX(COD_VEICULO) AS CODIGO FROM ' + TABLENAME;
      dm.ZConn.PingServer;
      Open;
      if not(IsEmpty) then
      begin
        First;
        Self.Codigo := (FieldByName('CODIGO').AsInteger + 1);
      end
      else
      begin
        Self.Codigo := 1;
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

function TVeiculos.PopulaLocal(filtro: string): TStringList;
var
  lista: TStringList;
  campo: String;
begin
  lista := TStringList.Create;
  Result := lista;
  if filtro = 'BAIRRO' then
  begin
    campo := 'DES_BAIRRO';
  end
  else if filtro = 'CIDADE' then
  begin
    campo := 'NOM_CIDADE';
  end
  else if filtro = 'PLACA' then
  begin
    campo := 'NOM_CIDADE_PLACA';
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

procedure TVeiculos.setAbastecimento(const Value: String);
begin
  _abastecimento := Value;
end;

procedure TVeiculos.setAno(const Value: String);
begin
  _ano := Value;
end;

procedure TVeiculos.setBairro(const Value: String);
begin
  _bairro := Value;
end;

procedure TVeiculos.setCEP(const Value: String);
begin
  _cep := Value;
end;

procedure TVeiculos.setChassi(const Value: String);
begin
  _chassi := Value;
end;

procedure TVeiculos.setCidade(const Value: String);
begin
  _cidade := Value;
end;

procedure TVeiculos.setCidadePlaca(const Value: String);
begin
  _cidadeplaca := Value;
end;

procedure TVeiculos.setCodigo(const Value: Integer);
begin
  _codigo := Value;
end;

procedure TVeiculos.setCor(const Value: String);
begin
  _cor := Value;
end;

procedure TVeiculos.setDescricao1(const Value: String);
begin
  _destel1 := Value;
end;

procedure TVeiculos.setDescricao2(const Value: String);
begin
  _destel2 := Value;
end;

procedure TVeiculos.setEndereco(const Value: String);
begin
  _endereco := Value;
end;

procedure TVeiculos.setEntregador(const Value: Integer);
begin
  _entregador := Value;
end;

procedure TVeiculos.setExecutor(const Value: String);
begin
  _executor := Value;
end;

procedure TVeiculos.setExercicio(const Value: String);
begin
  _exercicio := Value;
end;

procedure TVeiculos.setManutencao(const Value: TDateTime);
begin
  _manutencao := Value;
end;

procedure TVeiculos.setMarca(const Value: String);
begin
  _marca := Value;
end;

procedure TVeiculos.setModelo(const Value: String);
begin
  _modelo := Value;
end;

procedure TVeiculos.setPlaca(const Value: String);
begin
  _placa := Value;
end;

procedure TVeiculos.setRastreado(const Value: String);
begin
  _rastreado := Value;
end;

procedure TVeiculos.setRenavan(const Value: String);
begin
  _renavan := Value;
end;

procedure TVeiculos.setTelefone1(const Value: String);
begin
  _telefone1 := Value;
end;

procedure TVeiculos.setTelefone2(const Value: String);
begin
  _telefone2 := Value;
end;

procedure TVeiculos.setTipo(const Value: String);
begin
  _tipo := Value;
end;

procedure TVeiculos.setUF(const Value: String);
begin
  _uf := Value;
end;

procedure TVeiculos.setUFPlaca(const Value: String);
begin
  _ufplaca := Value;
end;

end.
