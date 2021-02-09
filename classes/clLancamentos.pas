unit clLancamentos;

interface

uses clConexao;

type
  TLancamentos = Class(TObject)

  private
    function getCodigo: Integer;
    function getData: TDateTime;
    function getDescnto: TDateTime;
    function getDescontado: String;
    function getDescricao: String;
    function getEntregador: Integer;
    function getTipo: String;
    function getValor: Double;
    procedure setCodigo(const Value: Integer);
    procedure setData(const Value: TDateTime);
    procedure setDescontado(const Value: String);
    procedure setDesconto(const Value: TDateTime);
    procedure setDescricao(const Value: String);
    procedure setEntregador(const Value: Integer);
    procedure setTipo(const Value: String);
    procedure setValor(const Value: Double);
    function getExtrato: String;
    procedure setExtrato(const Value: String);
    function getPersistir: String;
    procedure setPersistir(const Value: String);
    constructor Create;
    destructor Destroy;
    function getCadastro: Integer;
    procedure setCadastro(const Value: Integer);
  protected
    _codigo: Integer;
    _descricao: String;
    _data: TDateTime;
    _entregador: Integer;
    _tipo: String;
    _valor: Double;
    _descontado: String;
    _desconto: TDateTime;
    _extrato: String;
    _persistir: String;
    _conexao: TConexao;
    _cadastro: Integer;
  public
    property Codigo: Integer read getCodigo write setCodigo;
    property Descricao: String read getDescricao write setDescricao;
    property Data: TDateTime read getData write setData;
    property Entregador: Integer read getEntregador write setEntregador;
    property Tipo: String read getTipo write setTipo;
    property Valor: Double read getValor write setValor;
    property Descontado: String read getDescontado write setDescontado;
    property Desconto: TDateTime read getDescnto write setDesconto;
    property Extrato: String read getExtrato write setExtrato;
    property Persistir: String read getPersistir write setPersistir;
    property Cadastro: Integer read getCadastro write setCadastro;

    procedure MaxSeq;

    function Validar(): Boolean;
    function Delete(filtro: String): Boolean;
    function CancelaFechamento(sExtrato: String): Boolean;
    function getObject(id, filtro: String): Boolean;
    function Insert(): Boolean;
    function Update(): Boolean;
    function getField(campo, coluna: String): String;
    function getObjects(): Boolean;
    function Merge(): Boolean;
    function Totalizacao(sdtInicial, sdtFinal, sEntregador, filtro: String): Double;
    function Periodo(sdtInicial, sdtFinal, sEntregador, filtro: String) : Boolean;
    function Fechar(sdtInicial, sdtFinal, sdtDesconto, sNumero, sEntregador, filtro: String): Boolean;
    function Persistecia(): Boolean;
    function ConsolidaLancamentos(sInicio: String; sFinal: String): Boolean;
    function EncontraLancamentos(sFinal: String; sTipo: String): Boolean;
  end;

const
  TABLENAME = 'tblancamentos';

implementation

{ TLancamentos }

uses SysUtils, Dialogs, udm, clUtil, ZDataset, ZAbstractRODataset, DB;

constructor TLancamentos.Create;
begin
  _conexao := TConexao.Create;
  if (not _conexao.VerifyConnZEOS(0)) then
  begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
      Self.ClassName + ') !', mtError, [mbCancel], 0);
  end;
end;

destructor TLancamentos.Destroy;
begin
  _conexao.Free;
end;

function TLancamentos.getCadastro: Integer;
begin
  Result := _cadastro;
end;

function TLancamentos.getCodigo: Integer;
begin
  Result := _codigo;
end;

function TLancamentos.getData: TDateTime;
begin
  Result := _data;
end;

function TLancamentos.getDescnto: TDateTime;
begin
  Result := _desconto;
end;

function TLancamentos.getDescontado: String;
begin
  Result := _descontado;
end;

function TLancamentos.getDescricao: String;
begin
  Result := _descricao;
end;

function TLancamentos.getEntregador: Integer;
begin
  Result := _entregador;
end;

function TLancamentos.getTipo: String;
begin
  Result := _tipo;
end;

function TLancamentos.getValor: Double;
begin
  Result := _valor;
end;

procedure TLancamentos.MaxSeq;
begin
  Try

    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT MAX(COD_LANCAMENTO) AS CODIGO FROM ' + TABLENAME;
      dm.ZConn.PingServer;
      Open;
      if not(IsEmpty) then
        First;
    end;

    Self.Codigo := (dm.QryGetObject.FieldByName('CODIGO').AsInteger) + 1;

    dm.QryGetObject.Close;
    dm.QryGetObject.SQL.Clear;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TLancamentos.Validar(): Boolean;
begin
  try
    Result := False;
    if Self.Descontado = 'S' then
    begin
      MessageDlg('Lançamento já descontado. Alteração não é permitida!',
        mtWarning, [mbOK], 0);
      Exit;
    end;
    if Self.Persistir = 'N' then
    begin
      if not(TUtil.Empty(Self.Extrato)) then
      begin
        if Self.Extrato <> '0' then
        begin
          Self.Descontado := 'S';
        end;
      end;
    end;
    if TUtil.Empty(Self.Descricao) then
    begin
      MessageDlg('Informe a Descrição do Lançamento!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if Self.Entregador = 0 then
    begin
      MessageDlg('Informe o Código do Entregador!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if Self.Valor = 0 then
    begin
      MessageDlg('Informe o Valor do Lançamento!', mtWarning, [mbOK], 0);
      Exit;
    end;
    Result := True;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TLancamentos.Delete(filtro: String): Boolean;
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
        SQL.Add('WHERE COD_LANCAMENTO = :CODIGO');
        ParamByName('CODIGO').AsInteger := Self.Codigo;
      end
      else if filtro = 'EXTRATO' then
      begin
        SQL.Add('WHERE NUM_EXTRATO = :EXTRATO');
        ParamByName('EXTRATO').AsString := Self.Extrato;
      end
      else if filtro = 'ENTREGADOR' then
      begin
        SQL.Add('WHERE COD_ENTREGADOR = :ENTREGADOR');
        ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
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

function TLancamentos.getObject(id, filtro: String): Boolean;
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

      if filtro = 'CODIGO' then
      begin
        SQL.Add('WHERE COD_LANCAMENTO = :CODIGO');
        ParamByName('CODIGO').AsInteger := StrToInt(id);
      end
      else if filtro = 'EXTRATO' then
      begin
        SQL.Add('WHERE NUM_EXTRATO = :EXTRATO');
        ParamByName('EXTRATO').AsString := id;
      end
      else if filtro = 'EXTRATOS' then
      begin
        SQL.Add('WHERE CAST(NUM_EXTRATO AS SIGNED) IN (' + id + ')');
      end
      else if filtro = 'ENTREGADOR' then
      begin
        SQL.Add('WHERE COD_ENTREGADOR = :ENTREGADOR');
        ParamByName('ENTREGADOR').AsInteger := StrToInt(id);
      end
      else if filtro = 'PERIODO' then
      begin
        SQL.Add('WHERE DAT_LANCAMENTO<= :DATA AND DOM_DESCONTO <> :DESCONTO');
        ParamByName('DATA').AsDate := StrToDate(id);
        ParamByName('DESCONTO').AsString := 'S';
      end;
      dm.ZConn.PingServer;
      Open;
      if not(IsEmpty) then
      begin
        First;
        Self.Codigo := FieldByName('COD_LANCAMENTO').AsInteger;
        Self.Descricao := FieldByName('DES_LANCAMENTO').AsString;
        Self.Data := FieldByName('DAT_LANCAMENTO').AsDateTime;
        Self.Entregador := FieldByName('COD_ENTREGADOR').AsInteger;
        Self.Tipo := FieldByName('DES_TIPO').AsString;
        Self.Valor := FieldByName('VAL_LANCAMENTO').AsFloat;
        Self.Descontado := FieldByName('DOM_DESCONTO').AsString;
        Self.Desconto := FieldByName('DAT_DESCONTO').AsDateTime;
        Self.Extrato := FieldByName('NUM_EXTRATO').AsString;
        Self.Persistir := FieldByName('DOM_PERSISTIR').AsString;
        Self.Cadastro := FieldByName('COD_CADASTRO').AsInteger;
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

function TLancamentos.Insert(): Boolean;
begin
  Try
    Result := False;
    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'INSERT INTO ' + TABLENAME + '(' + 'COD_LANCAMENTO, ' +
        'DES_LANCAMENTO, ' + 'DAT_LANCAMENTO, ' + 'COD_CADASTRO, COD_ENTREGADOR, ' +
        'DES_TIPO, ' + 'VAL_LANCAMENTO, ' + 'DOM_DESCONTO, ' + 'DAT_DESCONTO, '
        + 'NUM_EXTRATO, ' + 'DOM_PERSISTIR) ' + 'VALUES (' + ':CODIGO, ' +
        ':DESCRICAO, ' + ':DATA, ' + ':CADASTRO, :ENTREGADOR, ' + ':TIPO, ' + ':VALOR, ' +
        ':DESCONTADO, ' + ':DESCONTO, ' + ':EXTRATO, ' + ':PERSISTIR)';

      MaxSeq;

      ParamByName('CODIGO').AsInteger := Self.Codigo;
      ParamByName('DESCRICAO').AsString := Self.Descricao;
      ParamByName('DATA').AsDate := Self.Data;
      ParamByName('CADASTRO').AsInteger := Self.Cadastro;
      ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
      ParamByName('TIPO').AsString := Self.Tipo;
      ParamByName('VALOR').AsFloat := Self.Valor;
      ParamByName('DESCONTADO').AsString := Self.Descontado;
      ParamByName('DESCONTO').AsDate := Self.Desconto;
      ParamByName('EXTRATO').AsString := Self.Extrato;
      ParamByName('PERSISTIR').AsString := Self.Persistir;
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

function TLancamentos.Update(): Boolean;
begin
  try
    Result := False;
    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'UPDATE ' + TABLENAME + ' SET ' +
        'DES_LANCAMENTO = :DESCRICAO, ' + 'DAT_LANCAMENTO = :DATA, ' +
        'COD_CADASTRO = :CADASTRO, ' +
        'COD_ENTREGADOR = :ENTREGADOR, ' + 'DES_TIPO       = :TIPO, ' +
        'VAL_LANCAMENTO = :VALOR, ' + 'DOM_DESCONTO   = :DESCONTADO, ' +
        'DAT_DESCONTO   = :DESCONTO,  ' + 'NUM_EXTRATO    = :EXTRATO, ' +
        'DOM_PERSISTIR  = :PERSISTIR ' + 'WHERE ' + 'COD_LANCAMENTO = :CODIGO';

      ParamByName('CODIGO').AsInteger := Self.Codigo;
      ParamByName('DESCRICAO').AsString := Self.Descricao;
      ParamByName('DATA').AsDate := Self.Data;
      ParamByName('CADASTRO').AsInteger := Self.Cadastro;
      ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
      ParamByName('TIPO').AsString := Self.Tipo;
      ParamByName('VALOR').AsFloat := Self.Valor;
      ParamByName('DESCONTADO').AsString := Self.Descontado;
      ParamByName('DESCONTO').AsDate := Self.Desconto;
      ParamByName('EXTRATO').AsString := Self.Extrato;
      ParamByName('PERSISTIR').AsString := Self.Persistir;
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

function TLancamentos.getField(campo, coluna: String): String;
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
        SQL.Add(' WHERE COD_LANCAMENTO =:CODIGO ');
        ParamByName('CODIGO').AsInteger := Self.Codigo;
      end
      else if coluna = 'DESCRICAO' then
      begin
        SQL.Add(' WHERE DES_LANCAMENTO =:DESCRICAO ');
        ParamByName('DESCRICAO').AsString := Self.Descricao;
      end
      else if coluna = 'ENTREGADOR' then
      begin
        SQL.Add(' WHERE COD_ENTREGADOR = :ENTREGADOR ');
        ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
      end;
      dm.ZConn.PingServer;
      Open;
      if not IsEmpty then
        First;
    end;

    if dm.qryFields.RecordCount > 0 then
      Result := dm.qryFields.FieldByName(campo).AsString;

    dm.qryFields.Close;
    dm.QryCRUD.SQL.Clear;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TLancamentos.getObjects(): Boolean;
begin
  Try
    Result := False;
    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT * FROM ' + TABLENAME + ' ORDER BY COD_LANCAMENTO';
      dm.ZConn.PingServer;
      Open;
      if not IsEmpty then
        First;
    end;

    if dm.QryGetObject.RecordCount > 0 then
      Result := True;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TLancamentos.Merge(): Boolean;
begin
  try
    Result := False;

    if Self.Codigo = 0 then
      Result := Insert()
    else
      Result := Update();
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TLancamentos.Totalizacao(sdtInicial, sdtFinal, sEntregador,
  filtro: String): Double;
var
  iAgente: Integer;
begin
  Try
    Result := 0;
    if TUtil.Empty(sdtInicial) then
      Exit;
    if TUtil.Empty(sdtFinal) then
      Exit;
    with dm.qryCalculo do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT COD_ENTREGADOR, SUM(VAL_LANCAMENTO) VALOR FROM ' +
        TABLENAME);
      SQL.Add(' WHERE DES_TIPO = :TIPO AND DAT_LANCAMENTO <= :TERMINO AND DOM_DESCONTO <> :DESCONTO');
      SQL.Add(' AND COD_ENTREGADOR = :ENTREGADOR');
      SQL.Add(' GROUP BY COD_ENTREGADOR');
      ParamByName('TERMINO').AsDate := StrToDate(sdtFinal);
      ParamByName('DESCONTO').AsString := 'S';
      ParamByName('ENTREGADOR').AsInteger := StrToInt(sEntregador);
      if filtro = 'CREDITO' then
      begin
        ParamByName('TIPO').AsString := 'CRÉDITO';
      end;
      if filtro = 'DEBITO' then
      begin
        ParamByName('TIPO').AsString := 'DÉBITO';
      end;
      dm.ZConn.PingServer;
      Open;
    end;
    if not(dm.qryCalculo.IsEmpty) then
      Result := dm.qryCalculo.FieldByName('VALOR').AsCurrency;
    dm.qryCalculo.Close;
    dm.qryCalculo.SQL.Clear;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TLancamentos.Periodo(sdtInicial, sdtFinal, sEntregador,
  filtro: String): Boolean;
var
  iAgente: Integer;
begin
  Try
    Result := False;
    if TUtil.Empty(sdtInicial) then
      Exit;
    if TUtil.Empty(sdtFinal) then
      Exit;
    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);
      SQL.Add(' WHERE DES_TIPO = :TIPO AND DAT_LANCAMENTO <= :TERMINO AND DOM_DESCONTO <> :DESCONTO');
      SQL.Add(' AND COD_ENTREGADOR = :ENTREGADOR');
      ParamByName('INICIO').AsDate := StrToDate(sdtInicial);
      ParamByName('TERMINO').AsDate := StrToDate(sdtFinal);
      ParamByName('DESCONTO').AsString := 'S';
      ParamByName('ENTREGADOR').AsInteger := StrToInt(sEntregador);
      if filtro = 'CREDITO' then
      begin
        ParamByName('TIPO').AsString := 'CRÉDITO';
      end;
      if filtro = 'DEBITO' then
      begin
        ParamByName('TIPO').AsString := 'DÉBITO';
      end;
      dm.ZConn.PingServer;
      Open;
    end;
    if not(dm.QryGetObject.IsEmpty) then
      Result := True;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TLancamentos.Fechar(sdtInicial, sdtFinal, sdtDesconto, sNumero,
  sEntregador, filtro: String): Boolean;
begin
  Try
    Result := False;
    if TUtil.Empty(sdtInicial) then
      Exit;
    if TUtil.Empty(sdtFinal) then
      Exit;
    if TUtil.Empty(sdtDesconto) then
      Exit;
    if TUtil.Empty(sNumero) then
      Exit;
    if TUtil.Empty(sEntregador) then
      Exit;
    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE ' + TABLENAME);
      SQL.Add('SET DOM_DESCONTO = :DESCONTO, DAT_DESCONTO = :DATA ');

      if filtro = 'FECHAR' then
      begin
        SQL.Add(', NUM_EXTRATO = :NUMERO');
        SQL.Add('WHERE DAT_LANCAMENTO <= :TERMINO AND COD_ENTREGADOR = :ENTREGADOR AND DOM_DESCONTO <> :DESCONTO');
        ParamByName('TERMINO').AsDate := StrToDate(sdtFinal);
        ParamByName('ENTREGADOR').AsInteger := StrToInt(sEntregador);
        ParamByName('DESCONTO').AsString := 'S';
        ParamByName('DATA').AsDate := StrToDate(sdtDesconto);
        ParamByName('NUMERO').AsString := sNumero;
      end
      else
      begin
        SQL.Add(', NUM_EXTRATO = "0"');
        SQL.Add('WHERE NUM_EXTRATO = :NUMERO');
        ParamByName('DESCONTO').AsString := 'N';
        ParamByName('DATA').AsDate := 0;
        ParamByName('NUMERO').AsString := sNumero;
      end;
      dm.ZConn.PingServer;
      ExecSQL;
    end;

    Result := True;

    dm.QryCRUD.Close;
    dm.QryCRUD.SQL.Clear;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TLancamentos.Persistecia(): Boolean;
begin
  Try
    Result := False;

    with dm.QryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE ' + TABLENAME);
      SQL.Add('SET DOM_DESCONTO = :DESCONTO ');
      SQL.Add('WHERE DOM_PERSISTIR = :PERSISTIR');
      ParamByName('DESCONTO').AsString := 'N';
      ParamByName('PERSISTIR').AsString := 'S';
      dm.ZConn.PingServer;
      ExecSQL;
    end;

    Result := True;

    dm.QryCRUD.Close;
    dm.QryCRUD.SQL.Clear;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

procedure TLancamentos.setCadastro(const Value: Integer);
begin
  _cadastro := Value;
end;

procedure TLancamentos.setCodigo(const Value: Integer);
begin
  _codigo := Value;
end;

procedure TLancamentos.setData(const Value: TDateTime);
begin
  _data := Value;
end;

procedure TLancamentos.setDescontado(const Value: String);
begin
  _descontado := Value;
end;

procedure TLancamentos.setDesconto(const Value: TDateTime);
begin
  _desconto := Value;
end;

procedure TLancamentos.setDescricao(const Value: String);
begin
  _descricao := Value;
end;

procedure TLancamentos.setEntregador(const Value: Integer);
begin
  _entregador := Value;
end;

procedure TLancamentos.setTipo(const Value: String);
begin
  _tipo := Value;
end;

procedure TLancamentos.setValor(const Value: Double);
begin
  _valor := Value;
end;

function TLancamentos.getExtrato: String;
begin
  Result := _extrato;
end;

procedure TLancamentos.setExtrato(const Value: String);
begin
  _extrato := Value;
end;

function TLancamentos.getPersistir: String;
begin
  Result := _persistir;
end;

procedure TLancamentos.setPersistir(const Value: String);
begin
  _persistir := Value;
end;

function TLancamentos.CancelaFechamento(sExtrato: String): Boolean;
begin
  Result := False;
  with dm.QryCRUD do
  begin
    Close;
    SQL.Clear;
    SQL.Add('UPDATE  ' + TABLENAME + ' SET NUM_EXTRATO = :NUMERO WHERE NUM_EXTRATO = :EXTRATO');
    ParamByName('NUMERO').AsString := '';
    ParamByName('EXTRATO').AsString := sExtrato;
    dm.ZConn.PingServer;
    ExecSQL;
  end;
  dm.QryCRUD.Close;
  dm.QryCRUD.SQL.Clear;
  Result := True;
end;

function TLancamentos.ConsolidaLancamentos(sInicio: String;
  sFinal: String): Boolean;
begin
  Result := False;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  dm.qryPesquisa.SQL.Text := 'SELECT ' +
                             'tblancamentos.COD_ENTREGADOR, ' +
                             'tblancamentos.DES_TIPO, ' +
                             'SUM(tblancamentos.VAL_LANCAMENTO) AS VAL_LANCAMENTO, ' +
                             'CONCAT(CAST(tblancamentos.COD_ENTREGADOR AS CHAR(6)),tblancamentos.DES_TIPO) AS CHAVE ' +
                             'FROM ' + TABLENAME +
                             ' WHERE DAT_LANCAMENTO <= :TERMINO AND DOM_DESCONTO <> :DESCONTO ' +
                             'GROUP BY tblancamentos.COD_ENTREGADOR, tblancamentos.DES_TIPO;';
//  dm.qryPesquisa.ParamByName('INICIO').AsDate := StrToDate(sInicio);
  dm.qryPesquisa.ParamByName('TERMINO').AsDate := StrToDate(sFinal);
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

function TLancamentos.EncontraLancamentos(sFinal: String; sTipo: String): Boolean;
begin
  Result := False;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  dm.qryPesquisa.SQL.Text := 'SELECT ' +
                             'tblancamentos.COD_ENTREGADOR, ' +
                             'tblancamentos.DES_TIPO, ' +
                             'SUM(tblancamentos.VAL_LANCAMENTO) AS VAL_LANCAMENTO, ' +
                             'CONCAT(CAST(tblancamentos.COD_ENTREGADOR AS CHAR(6)),tblancamentos.DES_TIPO) AS CHAVE ' +
                             'FROM ' + TABLENAME +
                             ' WHERE DAT_LANCAMENTO <= :TERMINO AND DOM_DESCONTO <> :DESCONTO ' +
                             'AND DES_TIPO = :TIPO ' +
                             'GROUP BY tblancamentos.COD_ENTREGADOR;';
  dm.qryPesquisa.ParamByName('TIPO').AsString := sTipo;
  dm.qryPesquisa.ParamByName('TERMINO').AsDate := StrToDate(sFinal);
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


end.
