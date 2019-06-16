unit clEmpresas;

interface

uses clPessoaJuridica, Vcl.Dialogs, System.SysUtils, clConexao;

type
  TEmpresas = class(TPessoaJuridica)
  protected
    FCodigo: Integer;
    FUsuario: String;
    FDataCadastro: TDateTime;
    FObs: String;
    FManutencao: TDateTime;
    FStatus: String;
    conexao : TConexao;
  private
    FTipoDoc: String;
    procedure SetCodigo(val: Integer);
    procedure SetUsuario(val: String);
    procedure SetManutencao(val: TDateTime);
    procedure SetStatus(val: String);
    procedure SetObs(val: String);
    procedure SetDataCadastro(val: TDateTime);
    procedure SetTipoDoc(val: String);
  public
    property DataCadastro: TDateTime read FDataCadastro write SetDataCadastro;
    property Usuario: String read FUsuario write SetUsuario;
    property Status: String read FStatus write SetStatus;
    property Obs: String read FObs write SetObs;
    property Manutencao: TDateTime read FManutencao write SetManutencao;
    property Codigo: Integer read FCodigo write SetCodigo;
    function Validar: Boolean;
    function Exist(sFiltro: String): Boolean;
    function Insert: Boolean;
    constructor Create;
    destructor Destroy; override;
    function Update: Boolean;
    function getObject(sId: String; sFiltro: String): Boolean;
    function getObjects: Boolean;
    function getField(sCampo: String; sColuna: String): String;
    property TipoDoc: String read FTipoDoc write SetTipoDoc;
  end;

const
  TABLENAME = 'cad_empresas';

implementation

uses clUtil, udm;

procedure TEmpresas.SetCodigo(val: Integer);
begin
  FCodigo :=  val;
end;

procedure TEmpresas.SetUsuario(val: String);
begin
  FUsuario  :=  val;
end;

procedure TEmpresas.SetManutencao(val: TDateTime);
begin
  FManutencao :=  val;
end;

procedure TEmpresas.SetStatus(val: String);
begin
  FStatus :=  val;
end;

procedure TEmpresas.SetObs(val: String);
begin
  FObs  :=  val;
end;

procedure TEmpresas.SetDataCadastro(val: TDateTime);
begin
  FDataCadastro :=  val;
end;

function TEmpresas.Validar: Boolean;
begin
  try
    Result := False;
    if Self.Razao.IsEmpty then begin
      MessageDlg('Informe o Nome ou Razão Social da Empresa!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if Self.Fantasia.IsEmpty then begin
      MessageDlg('Informe o Nome Fantasia da Empresa!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if sELF.TipoDoc.IsEmpty then begin
      MessageDlg('Informe o Tipo de Documento da Empresa (CPF ou CNPJ)!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if (not Self.Cnpj.IsEmpty) then begin
      if Self.TipoDoc = 'CPF' then begin
        if (not TUtil.CPF(Self.Cnpj)) then begin
          MessageDlg('CPF informado está incorreto!', mtWarning, [mbOK], 0);
          Exit;
        end;
      end
      else if (not TUtil.Cnpj(Self.Cnpj)) then begin
        MessageDlg('CNPJ informado está incorreto!', mtWarning, [mbOK], 0);
        Exit;
      end;
    end
    else begin
      if Self.TipoDoc = 'CPF' then begin
        MessageDlg('Informe o CPF da Empresa!', mtWarning, [mbOK], 0);
        Exit;
      end
      else begin
        MessageDlg('Informe o CNPJ da Empresa!', mtWarning, [mbOK], 0);
        Exit;
      end;
    end;
    if Self.Codigo = 0 then begin
      if Self.Exist('CNPJ') then begin
        if Self.TipoDoc = 'CPF' then begin
          MessageDlg('CPF já cadastrado!', mtWarning, [mbOK], 0);
          Exit;
        end
        else begin
          MessageDlg('CNPJ já cadastrado!', mtWarning, [mbOK], 0);
          Exit;
        end;
      end;
      if Self.Exist('RAZAO') then begin
        MessageDlg('Razão Social já cadastrada para outra Empresa!', mtWarning, [mbOK], 0);
        Exit;
      end;
      if Self.Exist('FANTASIA') then begin
        MessageDlg('Nome Fantasia já cadastrado para outra Empresa!', mtWarning, [mbOK], 0);
        Exit;
      end;
      if Self.Exist('IE') then begin
        MessageDlg('Inscrição Estadual já cadastrada para outra Empresa!', mtWarning, [mbOK], 0);
        Exit;
      end;
      if Self.Exist('IEST') then begin
        MessageDlg('Inscrição Estadual Substituição Tributária já cadastrada para outra Empresa!', mtWarning, [mbOK], 0);
        Exit;
      end;
      if Self.Exist('IM') then begin
        MessageDlg('Inscrição Municipal já cadastrada para outra Empresa!', mtWarning, [mbOK], 0);
        Exit;
      end;
    end;
    if Self.Status.IsEmpty then begin
      MessageDlg('Informe o Status da Empresa!', mtWarning, [mbOK], 0);
      Exit;
    end;
    Result := True;
  except on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' + E.Message);
  end;
end;

function TEmpresas.Exist(sFiltro: String): Boolean;
begin
  try
    Result  :=  False;
    if sFiltro.IsEmpty then begin
      Exit;
    end;
    if (not conexao.VerifyConnZEOS(0)) then begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados!', mtError, [mbCancel], 0);
      Exit;
    end;
    if dm.qryGetObject.Active then begin
      dm.qryGetObject.Close;
    end;
    dm.qryGetObject.SQL.Clear;
    dm.qryGetObject.SQL.Add('SELECT * FROM ' + TABLENAME);
    if sFiltro = 'CNPJ' then begin
      dm.qryGetObject.SQL.Add(' WHERE NUM_CNPJ = :CNPJ');
      dm.qryGetObject.ParamByName('CNPJ').AsString := Self.Cnpj;
    end
    else if sFiltro = 'RAZAO' then begin
      dm.qryGetObject.SQL.Add(' WHERE DES_RAZAO_SOCIAL = :RAZAO');
      dm.qryGetObject.ParamByName('RAZAO').AsString := Self.Razao;
    end
    else if sFiltro = 'FANTASIA' then begin
      dm.qryGetObject.SQL.Add(' WHERE NOM_FANTASIA = :FANTASIA');
      dm.qryGetObject.ParamByName('FANTASIA').AsString := Self.Fantasia;
    end
    else if sFiltro = 'IE' then begin
      dm.qryGetObject.SQL.Add(' WHERE NUM_IE = :IE');
      dm.qryGetObject.ParamByName('IE').AsString := Self.IE;
    end
    else if sFiltro = 'IEST' then begin
      dm.qryGetObject.SQL.Add(' WHERE NUM_IEST = :IEST');
      dm.qryGetObject.ParamByName('IEST').AsString := Self.IEST;
    end
    else if sFiltro = 'IM' then begin
      dm.qryGetObject.SQL.Add(' WHERE NUM_IM = :IM');
      dm.qryGetObject.ParamByName('IM').AsString := Self.IM;
    end;
    dm.ZConn.PingServer;
    dm.qryGetObject.Open;
    if (not dm.qryGetObject.IsEmpty) then begin
      Result  :=  True;
    end;
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
  except on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' + E.Message);
  end;
end;

function TEmpresas.Insert: Boolean;
begin
  try
    Result  :=  False;
    if (not conexao.VerifyConnZEOS(0)) then begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados!', mtError, [mbCancel], 0);
      Exit;
    end;
    if dm.qryCRUD.Active then begin
      dm.qryCRUD.Close;
    end;
    dm.qryCRUD.SQL.Clear;
    dm.qryCRUD.SQL.Text :=  'INSERT INTO ' + TABLENAME + '(' +
                            'DES_RAZAO_SOCIAL, ' +
                            'NOM_FANTASIA, ' +
                            'DES_TIPO_DOC, ' +
                            'NUM_CNPJ, ' +
                            'NUM_IE, ' +
                            'NUM_IEST, ' +
                            'NUM_IM, ' +
                            'COD_CNAE, ' +
                            'COD_CRT, ' +
                            'COD_STATUS, ' +
                            'DES_OBSERVACAO, ' +
                            'DAT_CADASTRO, ' +
                            'NOM_USUARIO, ' +
                            'DAT_MANUTENCAO) ' +
                            'VALUES (' +
                            ':CODIGO, ' +
                            ':RAZAO, ' +
                            ':FANTASIA, ' +
                            ':TIPODOC, ' +
                            ':CNPJ, ' +
                            ':IE, ' +
                            ':IEST, ' +
                            ':IM, ' +
                            ':CNAE, ' +
                            ':CRT, ' +
                            ':STATUS, ' +
                            ':OBS, ' +
                            ':CADASTRO, ' +
                            ':USUARIO, ' +
                            ':MANUTENCAO); ';
    dm.qryCRUD.ParamByName('RAZAO').AsString := Self.Razao;
    dm.qryCRUD.ParamByName('FANTASIA').AsString := Self.Fantasia;
    dm.qryCRUD.ParamByName('TIPODOC').AsString := Self.TipoDoc;
    dm.qryCRUD.ParamByName('CNPJ').AsString := Self.Cnpj;
    dm.qryCRUD.ParamByName('IE').AsString := Self.IE;
    dm.qryCRUD.ParamByName('IEST').AsString := Self.IEST;
    dm.qryCRUD.ParamByName('IM').AsString := Self.IM;
    dm.qryCRUD.ParamByName('CNAE').AsString := Self.Cnae;
    dm.qryCRUD.ParamByName('CRT').AsInteger := Self.Crt;
    dm.qryCRUD.ParamByName('STATUS').AsString := Self.Status;
    dm.qryCRUD.ParamByName('OBS').AsString := Self.Obs;
    dm.qryCRUD.ParamByName('CADASTRO').AsDate := Self.DataCadastro;
    dm.qryCRUD.ParamByName('USUARIO').AsString := Self.Usuario;
    dm.qryCRUD.ParamByName('MANUTENCAO').AsDateTime := Self.Manutencao;
    dm.ZConn.PingServer;
    dm.qryCRUD.ExecSQL;
    dm.qryCRUD.Close;
    dm.qryCRUD.SQL.Clear;
    Result  :=  True;
  except on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' + E.Message);
  end;
end;

constructor TEmpresas.Create;
begin
  inherited Create;
  conexao :=  TConexao.Create;
end;

destructor TEmpresas.Destroy;
begin
  conexao.Free;
  inherited Destroy;
end;

function TEmpresas.Update: Boolean;
begin
  try
    Result  :=  False;
    if (not conexao.VerifyConnZEOS(0)) then begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados!', mtError, [mbCancel], 0);
      Exit;
    end;
    if dm.qryCRUD.Active then begin
      dm.qryCRUD.Close;
    end;
    dm.qryCRUD.SQL.Clear;
    dm.qryCRUD.SQL.Text :=  'UPDATE ' + TABLENAME + 'SET ' +
                            'COD_EMPRESA = :CODIGO, ' +
                            'DES_RAZAO_SOCIAL = :RAZAO, ' +
                            'NOM_FANTASIA = :FANTASIA, ' +
                            'DES_TIPO_DOC = :TIPODOC, ' +
                            'NUM_CNPJ = :CNPJ, ' +
                            'NUM_IE = :IE:, ' +
                            'NUM_IEST = :IEST, ' +
                            'NUM_IM = :IM, ' +
                            'COD_CNAE:CNAE, ' +
                            'COD_CRT = :CRT, ' +
                            'COD_STATUS = :STATUS, ' +
                            'DES_OBSERVACAO = :OBS, ' +
                            'DAT_CADASTRO = :CADASTRO, ' +
                            'NOM_USUARIO = :USUARIO, ' +
                            'DAT_MANUTENCAO = :MANUTENCAO ' +
                            'WHERE COD_EMPRESA = :CODIGO; ';
    dm.qryCRUD.ParamByName('CODIGO').AsInteger := Self.Codigo;
    dm.qryCRUD.ParamByName('RAZAO').AsString := Self.Razao;
    dm.qryCRUD.ParamByName('FANTASIA').AsString := Self.Fantasia;
    dm.qryCRUD.ParamByName('TIPODOC').AsString := Self.TipoDoc;
    dm.qryCRUD.ParamByName('CNPJ').AsString := Self.Cnpj;
    dm.qryCRUD.ParamByName('IE').AsString := Self.IE;
    dm.qryCRUD.ParamByName('IEST').AsString := Self.IEST;
    dm.qryCRUD.ParamByName('IM').AsString := Self.IM;
    dm.qryCRUD.ParamByName('CNAE').AsString := Self.Cnae;
    dm.qryCRUD.ParamByName('CRT').AsInteger := Self.Crt;
    dm.qryCRUD.ParamByName('STATUS').AsString := Self.Status;
    dm.qryCRUD.ParamByName('OBS').AsString := Self.Obs;
    dm.qryCRUD.ParamByName('CADASTRO').AsDate := Self.DataCadastro;
    dm.qryCRUD.ParamByName('USUARIO').AsString := Self.Usuario;
    dm.qryCRUD.ParamByName('MANUTENCAO').AsDateTime := Self.Manutencao;
    dm.ZConn.PingServer;
    dm.qryCRUD.ExecSQL;
    dm.qryCRUD.Close;
    dm.qryCRUD.SQL.Clear;
    Result  :=  True;
  except on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' + E.Message);
  end;
end;

function TEmpresas.getObject(sId: String; sFiltro: String): Boolean;
begin
  try
    Result  :=  False;
    if sId.IsEmpty then begin
      Exit;
    end;
    if sFiltro.IsEmpty then begin
      Exit;
    end;
    if (not conexao.VerifyConnZEOS(0)) then begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados!', mtError, [mbCancel], 0);
      Exit;
    end;
    if dm.qryGetObject.Active then begin
      dm.qryGetObject.Close;
    end;
    dm.qryGetObject.SQL.Clear;
    dm.qryGetObject.SQL.Add('SELECT * FROM ' + TABLENAME);
    if sFiltro = 'CODIGO' then begin
      dm.qryGetObject.SQL.Add(' WHERE COD_EMPRESA = :CODIGO');
      dm.qryGetObject.ParamByName('CODIGO').AsInteger := StrToInt(sId);
    end
    else if sFiltro = 'CNPJ' then begin
      dm.qryGetObject.SQL.Add(' WHERE NUM_CNPJ = :CNPJ');
      dm.qryGetObject.ParamByName('CNPJ').AsString := sId;
    end
    else if sFiltro = 'RAZAO' then begin
      dm.qryGetObject.SQL.Add(' WHERE DES_RAZAO_SOCIAL LIKE (:RAZAO)');
      dm.qryGetObject.ParamByName('RAZAO').AsString :=  QuotedStr('%' + sId + '%');
    end
    else if sFiltro = 'FANTASIA' then begin
      dm.qryGetObject.SQL.Add(' WHERE NOM_FANTASIA LIKE (:FANTASIA)');
      dm.qryGetObject.ParamByName('FANTASIA').AsString := QuotedStr('%' + sId + '%');
    end
    else if sFiltro = 'IE' then begin
      dm.qryGetObject.SQL.Add(' WHERE NUM_IE = :IE');
      dm.qryGetObject.ParamByName('IE').AsString := sId;
    end
    else if sFiltro = 'IEST' then begin
      dm.qryGetObject.SQL.Add(' WHERE NUM_IEST = :IEST');
      dm.qryGetObject.ParamByName('IEST').AsString := sId;
    end
    else if sFiltro = 'IM' then begin
      dm.qryGetObject.SQL.Add(' WHERE NUM_IM = :IM');
      dm.qryGetObject.ParamByName('IM').AsString := sId;
    end
    else if sFiltro = 'STATUS' then begin
      dm.qryGetObject.SQL.Add(' WHERE COD_STATUS = :STATUS');
      dm.qryGetObject.ParamByName('STATUS').AsString := sId;
    end;
    dm.ZConn.PingServer;
    dm.qryGetObject.Open;
    if (not dm.qryGetObject.IsEmpty) then begin
      dm.qryGetObject.First;
      Self.Codigo := dm.qryGetObject.FieldByName('COD_EMPRESA').AsInteger;
      Self.Razao := dm.qryGetObject.FieldByName('DES_RAZAO_SOCIAL').AsString;
      Self.Fantasia := dm.qryGetObject.FieldByName('NOM_FANTASIA').AsString;
      Self.TipoDoc := dm.qryGetObject.FieldByName('DES_TIPO_DOC').AsString;
      Self.Cnpj := dm.qryGetObject.FieldByName('NUM_CNPJ').AsString;
      Self.IE := dm.qryGetObject.FieldByName('NUM_IE').AsString;
      Self.IEST := dm.qryGetObject.FieldByName('NUM_IEST').AsString;
      Self.IM := dm.qryGetObject.FieldByName('NUM_IM').AsString;
      Self.Cnae := dm.qryGetObject.FieldByName('COD_CNAE').AsString;
      Self.Crt := dm.qryGetObject.FieldByName('COD_CRT').AsInteger;
      Self.Status := dm.qryGetObject.FieldByName('COD_STATUS').AsString;
      Self.Obs := dm.qryGetObject.FieldByName('DES_OBSERVACAO').AsString;
      Self.DataCadastro := dm.qryGetObject.FieldByName('DAT_CADASTRO').AsDateTime;
      Self.Usuario  := dm.qryGetObject.FieldByName('NOM_USUARIO').AsString;
      Self.Manutencao := dm.qryGetObject.FieldByName('DAT_MANUTENCAO').AsDateTime;
      Result  :=  True;
    end;
    if (not Result) then begin
      dm.qryGetObject.Close;
      dm.qryGetObject.SQL.Clear;
    end;
  except on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' + E.Message);
  end;
end;

function TEmpresas.getObjects: Boolean;
begin
  try
    Result  :=  False;
    if (not conexao.VerifyConnZEOS(0)) then begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados!', mtError, [mbCancel], 0);
      Exit;
    end;
    if dm.qryGetObject.Active then begin
      dm.qryGetObject.Close;
    end;
    dm.qryGetObject.SQL.Clear;
    dm.qryGetObject.SQL.Add('SELECT * FROM ' + TABLENAME);
    dm.ZConn.PingServer;
    dm.qryGetObject.Open;
    if (not dm.qryGetObject.IsEmpty) then begin
      Result  :=  True;
      Exit;
    end;
    dm.qryGetObject.Close;
    dm.qryGetObject.SQL.Clear;
  except on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' + E.Message);
  end;
end;

function TEmpresas.getField(sCampo: String; sColuna: String): String;
begin
  try
    Result  :=  '';
    if sCampo.IsEmpty then begin
      Exit;
    end;
    if sColuna.IsEmpty then begin
      Exit;
    end;
    if (not conexao.VerifyConnZEOS(0)) then begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados!', mtError, [mbCancel], 0);
      Exit;
    end;
    if dm.qryFields.Active then begin
      dm.qryFields.Close;
    end;
    dm.qryFields.SQL.Clear;
    dm.qryFields.SQL.Add('SELECT ' + sCampo + ' FROM ' + TABLENAME);
    if sColuna = 'CODIGO' then begin
      dm.qryFields.SQL.Add(' WHERE COD_EMPRESA = :CODIGO');
      dm.qryFields.ParamByName('CODIGO').AsInteger := Self.Codigo;
    end
    else if sColuna = 'CNPJ' then begin
      dm.qryFields.SQL.Add(' WHERE NUM_CNPJ = :CNPJ');
      dm.qryFields.ParamByName('CNPJ').AsString := Self.Cnpj;
    end
    else if sColuna = 'RAZAO' then begin
      dm.qryFields.SQL.Add(' WHERE DES_RAZAO_SOCIAL = :RAZAO');
      dm.qryFields.ParamByName('RAZAO').AsString := Self.Razao;
    end
    else if sColuna = 'FANTASIA' then begin
      dm.qryFields.SQL.Add(' WHERE NOM_FANTASIA = :FANTASIA');
      dm.qryFields.ParamByName('FANTASIA').AsString := Self.Fantasia;
    end
    else if sColuna = 'IE' then begin
      dm.qryFields.SQL.Add(' WHERE NUM_IE = :IE');
      dm.qryFields.ParamByName('IE').AsString := Self.IE;
    end
    else if sColuna = 'IEST' then begin
      dm.qryFields.SQL.Add(' WHERE NUM_IEST = :IEST');
      dm.qryFields.ParamByName('IEST').AsString := Self.IEST;
    end
    else if sColuna = 'IM' then begin
      dm.qryFields.SQL.Add(' WHERE NUM_IM = :IM');
      dm.qryFields.ParamByName('IM').AsString := Self.IM;
    end;
    dm.ZConn.PingServer;
    dm.qryFields.Open;
    if (not dm.qryFields.IsEmpty) then begin
      dm.qryFields.First;
      Result  :=  dm.qryFields.FieldByName(sCampo).AsString;
    end;
    dm.qryFields.Close;
    dm.qryFields.SQL.Clear;
  except on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' + E.Message);
  end;
end;

procedure TEmpresas.SetTipoDoc(val: String);
begin
  FTIpoDoc := val;
end;

end.
