unit clAbastecimentos;

interface

uses System.Classes, clConexao;

type
  TAbastecimentos = Class(TObject)
  private
    function getCupom: String;
    function getData: TDateTime;
    function getEntregador: Integer;
    function getManutencao: TDateTime;
    function getNumero: Integer;
    function getPlaca: String;
    function getProduto: String;
    function getQuantidade: Double;
    function getTotal: Double;
    function getUnitario: Double;
    function getExecutante: String;
    function getDescontado: String;
    function getExtrato: Integer;
    function getDesconto: Double;
    function getVerba: Double;
    function getBase: TDate;

    procedure setCupom(const Value: String);
    procedure setData(const Value: TDateTime);
    procedure setEntregador(const Value: Integer);
    procedure setExecutante(const Value: String);
    procedure setManutencao(const Value: TDateTime);
    procedure setNumero(const Value: Integer);
    procedure setPlaca(const Value: String);
    procedure setProduto(const Value: String);
    procedure setQuantidade(const Value: Double);
    procedure setUnitario(const Value: Double);
    procedure setDescontado(const Value: String);
    procedure setTotal(const Value: Double);
    procedure setExtrato(const Value: Integer);
    procedure setDesconto(const Value: Double);
    procedure setVerba(const Value: Double);
    procedure setBase(const Value: TDate);
    function getNome: String;
    procedure setNome(const Value: String);
    function getControle: Integer;
    procedure setControle(const Value: Integer);

  protected
    _numero: Integer;
    _cupom: String;
    _entregador: Integer;
    _nome: String;
    _placa: String;
    _data: TDateTime;
    _produto: String;
    _quantidade: Double;
    _unitario: Double;
    _total: Double;
    _executante: String;
    _manutencao: TDateTime;
    _descontado: String;
    _extrato: Integer;
    _verba: Double;
    _desconto: Double;
    _base: TDateTime;
    _controle : Integer;
    _conexao: TConexao;
  public

    constructor Create;
    destructor Destroy;
    property Numero: Integer read getNumero write setNumero;
    property Cupom: String read getCupom write setCupom;
    property Entregador: Integer read getEntregador write setEntregador;
    property Nome: String read getNome write setNome;
    property Placa: String read getPlaca write setPlaca;
    property Data: TDateTime read getData write setData;
    property Produto: String read getProduto write setProduto;
    property Quantidade: Double read getQuantidade write setQuantidade;
    property Unitario: Double read getUnitario write setUnitario;
    property Total: Double read getTotal write setTotal;
    property Executante: String read getExecutante write setExecutante;
    property Manutencao: TDateTime read getManutencao write setManutencao;
    property Descontado: String read getDescontado write setDescontado;
    property Extrato: Integer read getExtrato write setExtrato;
    property Verba: Double read getVerba write setVerba;
    property Desconto: Double read getDesconto write setDesconto;
    property Base: TDate read getBase write setBase;
    property Controle: Integer read getControle write setControle;

    procedure MaxNum;

    function Validar(): Boolean;
    function Delete(filtro: String): Boolean;
    function DeletePeriodo(dtInicial, dtFinal: TDateTime): Boolean;
    function getObject(id, filtro: String): Boolean;
    function getObjects(): Boolean;
    function Insert(): Boolean;
    function Update(): Boolean;
    function getField(campo, coluna: String): String;
    function Periodo(sdatInicial, sdatFinal: String): Boolean;
    function TotalPeriodo(sdatInicial, sdatFinal, sEntregador: String): Double;
    function Fechar(sdatInicial, sdatFinal, sEntregador, sNumero: String;
      sTipo: String): Boolean;
    function Exist(): Boolean;
    function PopulaProdutos(filtro: string): TStringList;
    function ConsolidaAbastecimentos(sInicio: String; sTermino: String) : Boolean;
    function TotalControle(iControle: Integer): Double;
  end;

const
  TABLENAME = 'tbabastecimento';

implementation

{ TAbastecimentos }

uses SysUtils, Dialogs, udm, clUtil, ZDataset, ZAbstractRODataset, DB, uGlobais;

constructor TAbastecimentos.Create;
begin
  _conexao := TConexao.Create;
  if (not _conexao.VerifyConnZEOS(0)) then
  begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
      Self.ClassName + ') !', mtError, [mbCancel], 0);
  end;
end;

destructor TAbastecimentos.Destroy;
begin
  _conexao.Free;
end;

function TAbastecimentos.getBase: TDate;
begin
  REsult := _base
end;

function TAbastecimentos.getCupom: String;
begin
  REsult := _cupom;
end;

function TAbastecimentos.getData: TDateTime;
begin
  REsult := _data;
end;

function TAbastecimentos.getEntregador: Integer;
begin
  REsult := _entregador;
end;

function TAbastecimentos.getExecutante: String;
begin
  REsult := _executante;
end;

function TAbastecimentos.getManutencao: TDateTime;
begin
  REsult := _manutencao;
end;

function TAbastecimentos.getNome: String;
begin
  REsult := _nome;
end;

function TAbastecimentos.getNumero: Integer;
begin
  REsult := _numero;
end;

function TAbastecimentos.getPlaca: String;
begin
  REsult := _placa;
end;

function TAbastecimentos.getProduto: String;
begin
  REsult := _produto;
end;

function TAbastecimentos.getQuantidade: Double;
begin
  REsult := _quantidade;
end;

function TAbastecimentos.getTotal: Double;
begin
  REsult := _total;
end;

function TAbastecimentos.getUnitario: Double;
begin
  REsult := _unitario;
end;

function TAbastecimentos.getExtrato: Integer;
begin
  REsult := _extrato;
end;

function TAbastecimentos.getDesconto: Double;
begin
  REsult := _desconto;
end;

function TAbastecimentos.getVerba: Double;
begin
  REsult := _verba;
end;

function TAbastecimentos.getControle: Integer;
begin
  Result := _controle;
end;

procedure TAbastecimentos.MaxNum;
begin
  try
    dm.QryGetObject.Close;
    dm.QryGetObject.SQL.Clear;
    dm.QryGetObject.SQL.Text := 'SELECT MAX(NUM_ABASTECIMENTO) AS NUMERO FROM '
      + TABLENAME;
    dm.ZConn.PingServer;
    dm.QryGetObject.Open;
    if not(dm.QryGetObject.IsEmpty) then
    begin
      dm.QryGetObject.First;
    end;
    Self.Numero := (dm.QryGetObject.FieldByName('NUMERO').AsInteger) + 1;

    dm.QryGetObject.Close;
    dm.QryGetObject.SQL.Clear;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TAbastecimentos.Validar(): Boolean;
var
  sValor1, sValor2: String;
begin
  try
    sValor1 := '';
    sValor2 := '';
    REsult := False;
    if TUtil.Empty(Self.Cupom) then
    begin
      MessageDlg('Informe Número do Cupom!', mtWarning, [mbOK], 0);
      Exit;
    end
    else
    begin
      if StrToInt(Self.Cupom) = 0 then
      begin
        MessageDlg('Informe Número do Cupom!', mtWarning, [mbOK], 0);
        Exit;
      end;
    end;
    if TUtil.Empty(Self.Produto) then
    begin
      MessageDlg('Informe a Descrição do Abastecimento!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if TUtil.Empty(Self.Placa) then
    begin
      MessageDlg('Informe a Placa do Veículo!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if TUtil.Empty(DateToStr(Self.Data)) then
    begin
      MessageDlg('Informe a Data do Abastecimento!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if TUtil.Empty(DateToStr(Self.Base)) then
    begin
      MessageDlg('Informe a Data Base do Abastecimento!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if Self.Quantidade = 0 then
    begin
      MessageDlg('Informe a Quantidade do Abastecimento!', mtWarning,
        [mbOK], 0);
      Exit;
    end;
    if Self.Unitario = 0 then
    begin
      MessageDlg('Informe o Valor Unitário do Abastecimento!', mtWarning,
        [mbOK], 0);
      Exit;
    end;
    if Self.Total = 0 then
    begin
      MessageDlg('Informe o Valor Total do Abastecimento!', mtWarning,
        [mbOK], 0);
      Exit;
    end;
    sValor1 := FormatFloat(',0.00', Self.Total);
    sValor2 := FormatFloat(',0.00', (Self.Quantidade * Self.Unitario));
    if sValor1 <> sValor2 then
    begin
      MessageDlg
        ('Verifique os Valores Unitário e Quantidade pois o Valor Total do Abastecimento está Incorreto!',
        mtWarning, [mbOK], 0);
    end;
    REsult := True;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TAbastecimentos.Delete(filtro: String): Boolean;
begin
  try
    REsult := False;
    dm.QryCRUD.Close;
    dm.QryCRUD.SQL.Clear;
    dm.QryCRUD.SQL.Add('DELETE FROM ' + TABLENAME);
    if filtro = 'NUMERO' then
    begin
      dm.QryCRUD.SQL.Add('WHERE NUM_ABASTECIMENTO = :NUMERO');
      dm.QryCRUD.ParamByName('NUMERO').AsInteger := Self.Numero;
    end
    else if filtro = 'CONTROLE' then
    begin
      dm.QryGetObject.SQL.Add('WHERE ID_CONTROLE = :CONTROLE');
      dm.QryGetObject.ParamByName('CONTROLE').AsInteger := Self.Controle;
    end
    else if filtro = 'CUPOM' then
    begin
      dm.QryCRUD.SQL.Add('WHERE NUM_CUPOM = :CUPOM');
      dm.QryCRUD.ParamByName('CUPOM').AsString := Self.Cupom;
    end
    else if filtro = 'ENTREGADOR' then
    begin
      dm.QryCRUD.SQL.Add('WHERE COD_ENTREGADOR = :ENTREGADOR');
      dm.QryCRUD.ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
    end
    else if filtro = 'BASE' then
    begin
      dm.QryCRUD.SQL.Add('WHERE DAT_BASE = :BASE');
      dm.QryCRUD.ParamByName('BASE').AsDate := Self.Base;
    end;
    dm.ZConn.PingServer;
    dm.QryCRUD.ExecSQL;

    dm.QryCRUD.Close;
    dm.QryCRUD.SQL.Clear;

    REsult := True;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TAbastecimentos.DeletePeriodo(dtInicial, dtFinal: TDateTime): Boolean;
begin
  try

    REsult := False;
    dm.QryCRUD.Close;
    dm.QryCRUD.SQL.Clear;
    dm.QryCRUD.SQL.Add('DELETE FROM ' + TABLENAME);
    dm.QryCRUD.SQL.Add('WHERE DAT_ABASTECIMENTO BETWEEN :INICIO AND :FINAL');
    dm.QryCRUD.SQL.Add(' AND DOM_DESCONTO = ' + QuotedStr('N'));
    dm.QryCRUD.ParamByName('INICIO').AsDate := dtInicial;
    dm.QryCRUD.ParamByName('FINAL').AsDate := dtFinal;
    dm.ZConn.PingServer;
    dm.QryCRUD.ExecSQL;

    dm.QryCRUD.Close;
    dm.QryCRUD.SQL.Clear;

    REsult := True;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TAbastecimentos.getObject(id, filtro: String): Boolean;
begin
  try
    REsult := False;
    if TUtil.Empty(id) then
    begin
      if filtro <> 'CHAVE' then
      begin
        Exit;
      end;
    end;

    dm.QryGetObject.Close;
    dm.QryGetObject.SQL.Clear;
    dm.QryGetObject.SQL.Add('SELECT * FROM ' + TABLENAME);

    if filtro = 'NUMERO' then
    begin
      dm.QryGetObject.SQL.Add('WHERE NUM_ABASTECIMENTO = :NUMERO');
      dm.QryGetObject.ParamByName('NUMERO').AsInteger := StrToInt(id);
    end
    else if filtro = 'CONTROLE' then
    begin
      dm.QryGetObject.SQL.Add('WHERE ID_CONTROLE = :CONTROLE');
      dm.QryGetObject.ParamByName('CONTROLE').AsInteger := StrToIntDef(id,0);
    end
    else if filtro = 'CUPOM' then
    begin
      dm.QryGetObject.SQL.Add('WHERE NUM_CUPOM = :CUPOM');
      dm.QryGetObject.ParamByName('CUPOM').AsString := id;
    end
    else if filtro = 'PLACA' then
    begin
      dm.QryGetObject.SQL.Add('WHERE DES_PLACA = :PLACA');
      dm.QryGetObject.ParamByName('PLACA').AsString := id;
    end
    else if filtro = 'ENTREGADOR' then
    begin
      dm.QryGetObject.SQL.Add('WHERE COD_ENTREGADOR = :ENTREGADOR');
      dm.QryGetObject.ParamByName('ENTREGADOR').AsInteger := StrToInt(id);
    end
    else if filtro = 'DATA' then
    begin
      dm.QryGetObject.SQL.Add('WHERE DAT_ABASTECIMENTO = :DATA');
      dm.QryGetObject.ParamByName('DATA').AsDate := StrToDate(id);
    end
    else if filtro = 'CHAVE' then
    begin
      dm.QryGetObject.SQL.Add
        ('WHERE NUM_CUPOM = :CUPOM AND DES_PLACA = :PLACA AND ' +
        'DAT_ABASTECIMENTO = :DATA AND DES_PRODUTO = :PRODUTO AND ' +
        'FORMAT(QTD_ABASTECIMENTO,3) = :QTDE AND ' +
        'FORMAT(VAL_UNITARIO,3) = :UNIDARIO ' +
        'AND FORMAT(VAL_TOTAL,2) = :TOTAL AND DAT_BASE = ::BASE');
      dm.QryGetObject.ParamByName('CUPOM').AsString := Self.Cupom;
      dm.QryGetObject.ParamByName('PLACA').AsString := Self.Placa;
      dm.QryGetObject.ParamByName('DATA').AsDate := Self.Data;
      dm.QryGetObject.ParamByName('PRODUTO').AsString :=
        Copy(Self.Produto, 1, 30);
      dm.QryGetObject.ParamByName('QTDE').AsFloat := Self.Total;
      dm.QryGetObject.ParamByName('UNIDARIO').AsFloat := Self.Total;
      dm.QryGetObject.ParamByName('TOTAL').AsFloat := Self.Total;
      dm.QryGetObject.ParamByName('BASE').AsDate := Self.Base;
    end;
    dm.ZConn.PingServer;
    dm.QryGetObject.Open;
    if (not dm.QryGetObject.IsEmpty) then
    begin
      dm.QryGetObject.First;
    end;
    if dm.QryGetObject.RecordCount > 0 then
    begin
      Self.Numero := dm.QryGetObject.FieldByName('NUM_ABASTECIMENTO').AsInteger;
      Self.Cupom := dm.QryGetObject.FieldByName('NUM_CUPOM').AsString;
      Self.Entregador := dm.QryGetObject.FieldByName('COD_ENTREGADOR')
        .AsInteger;
      Self.Nome := dm.QryGetObject.FieldByName('NOM_ENTREGADOR').AsString;
      Self.Placa := dm.QryGetObject.FieldByName('DES_PLACA').AsString;
      Self.Data := dm.QryGetObject.FieldByName('DAT_ABASTECIMENTO').AsDateTime;
      Self.Produto := dm.QryGetObject.FieldByName('DES_PRODUTO').AsString;
      Self.Quantidade := dm.QryGetObject.FieldByName
        ('QTD_ABASTECIMENTO').AsFloat;
      Self.Unitario := dm.QryGetObject.FieldByName('VAL_UNITARIO').AsFloat;
      Self.Total := dm.QryGetObject.FieldByName('VAL_TOTAL').AsFloat;
      Self.Executante := dm.QryGetObject.FieldByName('NOM_EXECUTANTE').AsString;
      Self.Manutencao := dm.QryGetObject.FieldByName('DAT_MANUTENCAO')
        .AsDateTime;
      Self.Descontado := dm.QryGetObject.FieldByName('DOM_DESCONTO').AsString;
      Self.Verba := dm.QryGetObject.FieldByName
        ('VAL_VERBA_COMBUSTIVEL').AsFloat;
      Self.Desconto := dm.QryGetObject.FieldByName('VAL_DESCONTO').AsFloat;
      Self.Base := dm.QryGetObject.FieldByName('DAT_BASE').AsDateTime;
      Self.Controle := dm.QryGetObject.FieldByName('ID_controle').AsInteger;
      REsult := True;
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

function TAbastecimentos.Insert(): Boolean;
begin
  try
    REsult := False;
    dm.QryCRUD.Close;
    dm.QryCRUD.SQL.Clear;
    dm.QryCRUD.SQL.Text := 'INSERT INTO ' + TABLENAME + '(' +
                           'NUM_ABASTECIMENTO, ' +
                           'NUM_CUPOM, ' +
                           'DES_PLACA, ' +
                           'COD_ENTREGADOR, ' +
                           'NOM_ENTREGADOR, ' +
                           'DAT_ABASTECIMENTO, ' +
                           'DES_PRODUTO, ' +
                           'QTD_ABASTECIMENTO, ' +
                           'VAL_UNITARIO, ' +
                           'VAL_TOTAL, ' +
                           'VAL_VERBA_COMBUSTIVEL, ' +
                           'VAL_DESCONTO, ' +
                           'NOM_EXECUTANTE, ' +
                           'DAT_MANUTENCAO, ' +
                           'DOM_DESCONTO, ' +
                           'NUM_EXTRATO, ' +
                           'DAT_BASE, ' +
                           'ID_controle)' +
                           'VALUES (' +
                           ':NUMERO, ' +
                           ':CUPOM, ' +
                           ':PLACA, ' +
                           ':ENTREGADOR, ' +
                           ':NOME, ' +
                           ':DATA, ' +
                           ':PRODUTO, ' +
                           ':QUANTIDADE, ' +
                           ':UNITARIO, ' +
                           ':TOTAL, ' +
                           ':VERBA, ' +
                           ':DESCONTO, ' +
                           ':EXECUTANTE, ' +
                           ':MANUTENCAO, ' +
                           ':DESCONTADO, ' +
                           ':EXTRATO, ' +
                           ':BASE, ' +
                           ':CONTROLE)';

    MaxNum;

    dm.QryCRUD.ParamByName('NUMERO').AsInteger := Self.Numero;
    dm.QryCRUD.ParamByName('CUPOM').AsString := Self.Cupom;
    dm.QryCRUD.ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
    dm.QryCRUD.ParamByName('NOME').AsString := Self.Nome;
    dm.QryCRUD.ParamByName('PLACA').AsString := Self.Placa;
    dm.QryCRUD.ParamByName('DATA').AsDate := Self.Data;
    dm.QryCRUD.ParamByName('PRODUTO').AsString := Self.Produto;
    dm.QryCRUD.ParamByName('QUANTIDADE').AsFloat := Self.Quantidade;
    dm.QryCRUD.ParamByName('UNITARIO').AsFloat := Self.Unitario;
    dm.QryCRUD.ParamByName('TOTAL').AsFloat := Self.Total;
    dm.QryCRUD.ParamByName('VERBA').AsFloat := Self.Verba;
    dm.QryCRUD.ParamByName('DESCONTO').AsFloat := Self.Desconto;
    dm.QryCRUD.ParamByName('EXECUTANTE').AsString := Self.Executante;
    dm.QryCRUD.ParamByName('MANUTENCAO').AsDateTime := Self.Manutencao;
    dm.QryCRUD.ParamByName('DESCONTADO').AsString := Self.Descontado;
    dm.QryCRUD.ParamByName('EXTRATO').AsInteger := Self.Extrato;
    dm.QryCRUD.ParamByName('BASE').AsDate := Self.Base;
    dm.qryCRUD.ParamByName('CONTROLE').AsInteger := Self.Controle;
    dm.ZConn.PingServer;
    dm.QryCRUD.ExecSQL;

    dm.QryCRUD.Close;
    dm.QryCRUD.SQL.Clear;

    REsult := True;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TAbastecimentos.Update(): Boolean;
begin
  try
    REsult := False;
    dm.QryCRUD.Close;
    dm.QryCRUD.SQL.Clear;
    dm.QryCRUD.SQL.Text := 'UPDATE ' + TABLENAME + ' SET ' +
                           'NUM_CUPOM = :CUPOM, ' +
                           'COD_ENTREGADOR = :ENTREGADOR, ' +
                           'NOM_ENTREGADOR = :NOME, ' +
                           'DES_PLACA = :PLACA, ' +
                           'DAT_ABASTECIMENTO = :DATA, ' +
                           'DES_PRODUTO = :PRODUTO, ' +
                           'QTD_ABASTECIMENTO = :QUANTIDADE, ' +
                           'VAL_UNITARIO = :UNITARIO, ' +
                           'VAL_TOTAL = :TOTAL, ' +
                           'VAL_VERBA_COMBUSTIVEL = :VERBA, ' +
                           'VAL_DESCONTO = :DESCONTO, ' +
                           'NOM_EXECUTANTE = :EXECUTANTE, ' +
                           'DAT_MANUTENCAO = :MANUTENCAO, ' +
                           'DOM_DESCONTO = :DESCONTADO, ' +
                           'NUM_EXTRATO = :EXTRATO, ' +
                           'DAT_BASE = :BASE, ' +
                           'ID_CONTROLE := :CONTROLE ' +
                           'WHERE ' +
                           'NUM_ABASTECIMENTO = :NUMERO';
    dm.QryCRUD.ParamByName('NUMERO').AsInteger := Self.Numero;
    dm.QryCRUD.ParamByName('CUPOM').AsString := Self.Cupom;
    dm.QryCRUD.ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
    dm.QryCRUD.ParamByName('NOME').AsString := Self.Nome;
    dm.QryCRUD.ParamByName('PLACA').AsString := Self.Placa;
    dm.QryCRUD.ParamByName('DATA').AsDate := Self.Data;
    dm.QryCRUD.ParamByName('PRODUTO').AsString := Self.Produto;
    dm.QryCRUD.ParamByName('QUANTIDADE').AsFloat := Self.Quantidade;
    dm.QryCRUD.ParamByName('UNITARIO').AsFloat := Self.Unitario;
    dm.QryCRUD.ParamByName('TOTAL').AsFloat := Self.Total;
    dm.QryCRUD.ParamByName('VERBA').AsFloat := Self.Verba;
    dm.QryCRUD.ParamByName('DESCONTO').AsFloat := Self.Desconto;
    dm.QryCRUD.ParamByName('EXECUTANTE').AsString := Self.Executante;
    dm.QryCRUD.ParamByName('MANUTENCAO').AsDateTime := Self.Manutencao;
    dm.QryCRUD.ParamByName('DESCONTADO').AsString := Self.Descontado;
    dm.QryCRUD.ParamByName('EXTRATO').AsInteger := Self.Extrato;
    dm.QryCRUD.ParamByName('BASE').AsDate := Self.Base;
    dm.qryCRUD.ParamByName('CONTROLE').AsInteger := Self.Controle;
    dm.ZConn.PingServer;
    dm.QryCRUD.ExecSQL;

    dm.QryCRUD.Close;
    dm.QryCRUD.SQL.Clear;

    REsult := True;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TAbastecimentos.getField(campo, coluna: String): String;
begin
  try
    REsult := '';
    dm.QryGetObject.Close;
    dm.QryGetObject.SQL.Clear;
    dm.QryGetObject.SQL.Text := 'SELECT ' + campo + ' FROM ' + TABLENAME;

    if coluna = 'NUMERO' then
    begin
      dm.QryGetObject.SQL.Add(' WHERE NUM_ABASTECIMENTO =:NUMERO ');
      dm.QryGetObject.ParamByName('NUMERO').AsInteger := Self.Numero;
    end
    else if coluna = 'CONTROLE' then
    begin
      dm.QryGetObject.SQL.Add(' WHERE ID_CONTROLE =:CONTROLE ');
      dm.QryGetObject.ParamByName('CONTROLE').AsInteger := Self.Controle;
    end
    else if coluna = 'CUPOM' then
    begin
      dm.QryGetObject.SQL.Add(' WHERE NUM_CUPOM =:CUPOM ');
      dm.QryGetObject.ParamByName('CUPOM').AsString := Self.Cupom;
    end
    else if coluna = 'DATA' then
    begin
      dm.QryGetObject.SQL.Add(' WHERE DAT_ABASTECIMENTO =:DATA ');
      dm.QryGetObject.ParamByName('DATA').AsDate := Self.Data;
    end
    else if coluna = 'ENTREGADOR' then
    begin
      dm.QryGetObject.SQL.Add(' WHERE COD_ENTREGADOR = :ENTREGADOR ');
      dm.QryGetObject.ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
    end;
    dm.ZConn.PingServer;
    dm.QryGetObject.Open;
    if (not dm.QryGetObject.IsEmpty) then
    begin
      dm.QryGetObject.First;
    end;

    if dm.QryGetObject.RecordCount > 0 then
    begin
      REsult := dm.QryGetObject.FieldByName(campo).AsString;
    end;

    dm.QryGetObject.Close;
    dm.QryGetObject.SQL.Clear;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TAbastecimentos.Periodo(sdatInicial, sdatFinal: String): Boolean;
begin
  try
    REsult := False;

    if TUtil.Empty(sdatInicial) then
      Exit;

    if TUtil.Empty(sdatFinal) then
      Exit;
    dm.qryGeral.Close;
    dm.qryGeral.SQL.Clear;
    dm.qryGeral.SQL.Add('SELECT * FROM ' + TABLENAME);
    dm.qryGeral.SQL.Add('WHERE DAT_ABASTECIMENTO BETWEEN :INICIO AND :FINAL ');
    dm.qryGeral.ParamByName('INICIO').AsDate := StrToDate(sdatInicial);
    dm.qryGeral.ParamByName('FINAL').AsDate := StrToDate(sdatFinal);
    dm.qryGeral.SQL.Add
      ('ORDER BY COD_ENTREGADOR, DAT_ABASTECIMENTO, DES_PLACA');
    dm.ZConn.PingServer;
    dm.qryGeral.Open;
    if (not dm.qryGeral.IsEmpty) then
    begin
      dm.qryGeral.First;
    end
    else
    begin
      dm.qryGeral.Close;
      dm.qryGeral.SQL.Clear;
      Exit;
    end;
    REsult := True;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TAbastecimentos.TotalPeriodo(sdatInicial, sdatFinal,
  sEntregador: String): Double;
begin
  try
    REsult := 0;

    if TUtil.Empty(sdatInicial) then
    begin
      Exit;
    end;

    if TUtil.Empty(sdatFinal) then
    begin
      Exit;
    end;

    if TUtil.Empty(sEntregador) then
    begin
      Exit;
    end;
    dm.qryCalculo.Close;
    dm.qryCalculo.SQL.Clear;
    dm.qryCalculo.SQL.Add('SELECT COD_ENTREGADOR, SUM(VAL_TOTAL) TOTAL FROM ' +
      TABLENAME);
    dm.qryCalculo.SQL.Add
      ('WHERE DAT_ABASTECIMENTO BETWEEN :INICIO AND :FINAL ');
    dm.qryCalculo.SQL.Add
      ('AND COD_ENTREGADOR = :ENTREGADOR AND DOM_DESCONTO <> :DESCONTADO');

    dm.qryCalculo.ParamByName('INICIO').AsDate := StrToDate(sdatInicial);
    dm.qryCalculo.ParamByName('FINAL').AsDate := StrToDate(sdatFinal);
    dm.qryCalculo.ParamByName('ENTREGADOR').AsInteger := StrToInt(sEntregador);
    dm.qryCalculo.ParamByName('DESCONTADO').AsString := 'S';

    dm.qryCalculo.SQL.Add('GROUP BY COD_ENTREGADOR');
    dm.ZConn.PingServer;
    dm.qryCalculo.Open;
    if (not dm.qryCalculo.IsEmpty) then
    begin
      dm.qryCalculo.First;
    end
    else
    begin
      dm.qryCalculo.Close;
      dm.qryCalculo.SQL.Clear;
      Exit;
    end;
    REsult := dm.qryCalculo.FieldByName('TOTAL').AsFloat;
    dm.qryCalculo.Close;
    dm.qryCalculo.SQL.Clear;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TAbastecimentos.Fechar(sdatInicial, sdatFinal, sEntregador,
  sNumero: String; sTipo: String): Boolean;
begin
  try
    REsult := False;

    if TUtil.Empty(sdatInicial) then
    begin
      Exit;
    end;

    if TUtil.Empty(sdatFinal) then
    begin
      Exit;
    end;

    if TUtil.Empty(sEntregador) then
    begin
      Exit;
    end;

    if TUtil.Empty(sNumero) then
    begin
      Exit;
    end;

    dm.QryCRUD.Close;
    dm.QryCRUD.SQL.Clear;
    dm.QryCRUD.SQL.Add('UPDATE ' + TABLENAME);
    dm.QryCRUD.SQL.Add('SET DOM_DESCONTO = :DESCONTADO, ');
    if sTipo = 'FECHAR' then
    begin
      dm.QryCRUD.SQL.Add('NUM_EXTRATO = :EXTRATO ');
      dm.QryCRUD.SQL.Add('WHERE DAT_ABASTECIMENTO <= :FINAL ');
      dm.QryCRUD.SQL.Add('AND COD_ENTREGADOR = :ENTREGADOR ');
      dm.QryCRUD.ParamByName('FINAL').AsDate := StrToDate(sdatFinal);
      dm.QryCRUD.ParamByName('ENTREGADOR').AsInteger := StrToInt(sEntregador);
      dm.QryCRUD.ParamByName('DESCONTADO').AsString := 'S';
      dm.QryCRUD.ParamByName('EXTRATO').AsString := sNumero;
    end
    else
    begin
      dm.QryCRUD.SQL.Add('NUM_EXTRATO = "0" ');
      dm.QryCRUD.SQL.Add('WHERE NUM_EXTRATO = :EXTRATO ');
      dm.QryCRUD.SQL.Add('AND COD_ENTREGADOR = :ENTREGADOR ');
      dm.QryCRUD.ParamByName('ENTREGADOR').AsInteger := StrToInt(sEntregador);
      dm.QryCRUD.ParamByName('DESCONTADO').AsString := 'N';
      dm.QryCRUD.ParamByName('EXTRATO').AsString := sNumero;
    end;
    dm.ZConn.PingServer;
    dm.QryCRUD.ExecSQL;
    dm.QryCRUD.Close;
    dm.QryCRUD.SQL.Clear;
    REsult := True;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TAbastecimentos.Exist(): Boolean;
begin
  try
    Result := False;
    Self.Numero := 0;
    dm.QryGetObject.Close;
    dm.QryGetObject.SQL.Clear;
    dm.QryGetObject.SQL.Add('SELECT * FROM ' + TABLENAME);
    dm.QryGetObject.SQL.Add
      ('WHERE NUM_CUPOM = :CUPOM AND DES_PLACA = :PLACA AND ' +
      'DAT_ABASTECIMENTO = :DATA AND DES_PRODUTO = :PRODUTO AND ' +
      'QTD_ABASTECIMENTO = :QTDE AND ' +
      'DAT_BASE = :BASE');
    dm.QryGetObject.ParamByName('CUPOM').AsString := Self.Cupom;
    dm.QryGetObject.ParamByName('PLACA').AsString := Self.Placa;
    dm.QryGetObject.ParamByName('DATA').AsDate := Self.Data;
    dm.QryGetObject.ParamByName('PRODUTO').AsString := Self.Produto;
    dm.QryGetObject.ParamByName('QTDE').AsFloat := Self.Quantidade;
    dm.QryGetObject.ParamByName('BASE').AsDate := Self.Base;
    dm.ZConn.PingServer;
    dm.QryGetObject.Open;
    if dm.QryGetObject.IsEmpty then
    begin
      dm.QryGetObject.Close;
      dm.QryGetObject.SQL.Clear;
      Exit;
    end;
    Self.Numero := dm.qryGetObject.FieldByName('NUM_ABASTECIMENTO').AsInteger;
    dm.QryGetObject.Close;
    dm.QryGetObject.SQL.Clear;
    REsult := True;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TAbastecimentos.getObjects(): Boolean;
begin
  try
    REsult := False;
    dm.QryGetObject.Close;
    dm.QryGetObject.SQL.Clear;
    dm.QryGetObject.SQL.Add('SELECT * FROM ' + TABLENAME);
    dm.ZConn.PingServer;
    dm.QryGetObject.Open;
    if (not dm.QryGetObject.IsEmpty) then
    begin
      dm.QryGetObject.First;
      REsult := True;
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

function TAbastecimentos.PopulaProdutos(filtro: string): TStringList;
var
  lista: TStringList;
  campo: String;
begin
  lista := TStringList.Create;
  REsult := lista;
  if filtro = 'PRODUTO' then
  begin
    campo := 'DES_PRODUTO';
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
  REsult := lista;
end;

procedure TAbastecimentos.setBase(const Value: TDate);
begin
  _base := Value;
end;

procedure TAbastecimentos.setCupom(const Value: String);
begin
  _cupom := Value;
end;

procedure TAbastecimentos.setData(const Value: TDateTime);
begin
  _data := Value;
end;

procedure TAbastecimentos.setEntregador(const Value: Integer);
begin
  _entregador := Value;
end;

procedure TAbastecimentos.setExecutante(const Value: String);
begin
  _executante := Value;
end;

procedure TAbastecimentos.setManutencao(const Value: TDateTime);
begin
  _manutencao := Value;
end;

procedure TAbastecimentos.setNome(const Value: String);
begin
  _nome := Value;
end;

procedure TAbastecimentos.setNumero(const Value: Integer);
begin
  _numero := Value;
end;

procedure TAbastecimentos.setPlaca(const Value: String);
begin
  _placa := Value;
end;

procedure TAbastecimentos.setProduto(const Value: String);
begin
  _produto := Value;
end;

procedure TAbastecimentos.setQuantidade(const Value: Double);
begin
  _quantidade := Value;
end;

procedure TAbastecimentos.setUnitario(const Value: Double);
begin
  _unitario := Value;
end;

function TAbastecimentos.getDescontado: String;
begin
  REsult := _descontado;
end;

procedure TAbastecimentos.setDescontado(const Value: String);
begin
  _descontado := Value;
end;

procedure TAbastecimentos.setTotal(const Value: Double);
begin
  _total := Value;
end;

procedure TAbastecimentos.setExtrato(const Value: Integer);
begin
  _extrato := Value;
end;

procedure TAbastecimentos.setDesconto(const Value: Double);
begin
  _desconto := Value;
end;

procedure TAbastecimentos.setVerba(const Value: Double);
begin
  _verba := Value;
end;

procedure TAbastecimentos.setControle(const Value: Integer);
begin
  _controle := Value;
end;

function TAbastecimentos.ConsolidaAbastecimentos(sInicio: String; sTermino: String): Boolean;
begin
  Result := False;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  dm.qryPesquisa.SQL.Text := 'SELECT ' +
                             'tbabastecimento.COD_ENTREGADOR, ' +
                             'SUM(tbabastecimento.VAL_TOTAL) AS VAL_TOTAL ' +
                             'FROM ' + TABLENAME +
                             ' WHERE tbabastecimento.DAT_ABASTECIMENTO <= :TERMINO AND DOM_DESCONTO <> :DESCONTO ' +
                             'GROUP BY tbabastecimento.COD_ENTREGADOR;';
  //dm.qryPesquisa.ParamByName('INICIO').AsDate := StrToDate(sInicio);
  dm.qryPesquisa.ParamByName('TERMINO').AsDate := StrToDate(sTermino);
  dm.qryPesquisa.ParamByName('DESCONTO').AsString := 'S';
  dm.ZConn.PingServer;
  dm.qryPesquisa.Open;
  if dm.qryPesquisa.IsEmpty then
  begin
    dm.qryPesquisa.Close;
    dm.qryPesquisa.SQL.Clear;
    Exit;
  end;
  dm.qryPesquisa.First;
  Result := True;
end;

function TAbastecimentos.TotalControle(iControle: Integer): Double;
begin
  try
    Result := 0;
    dm.qryCalculo.Close;
    dm.qryCalculo.SQL.Clear;
    dm.qryCalculo.SQL.Add('SELECT ID_CONTROLE, SUM(VAL_TOTAL) TOTAL FROM ' +
      TABLENAME);
    dm.qryCalculo.SQL.Add('WHERE ID_CONTROLE = :ID');
    dm.qryCalculo.ParamByName('ID').AsInteger := iControle;
    dm.qryCalculo.SQL.Add('GROUP BY COD_ENTREGADOR');
    dm.ZConn.PingServer;
    dm.qryCalculo.Open;
    if (not dm.qryCalculo.IsEmpty) then
    begin
      dm.qryCalculo.First;
    end
    else
    begin
      dm.qryCalculo.Close;
      dm.qryCalculo.SQL.Clear;
      Exit;
    end;
    Result := dm.qryCalculo.FieldByName('TOTAL').AsFloat;
    dm.qryCalculo.Close;
    dm.qryCalculo.SQL.Clear;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;


end.
