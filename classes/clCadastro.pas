unit clCadastro;

interface

uses clpessoajuridica, Vcl.Dialogs,System.SysUtils, clConexao, System.StrUtils;

type
  TCadastro = class(TPessoaJuridica)
  private
    FCodigo: Integer;
    FTipoCadastro: Integer;
    FDepartamento: Integer;
    FSubTipo: Integer;
    FFilial: Integer;
    FFuncao: Integer;
    FTipoDoc: String;
    FDataCadastro: TDateTime;
    FUsuario: Integer;
    FRoteiro: Integer;
    FStatusGR: Integer;
    FStatusCadastro: Integer;
    conexao: TConexao;
    procedure SetCodigo(val: Integer);
    procedure SetTipoCadastro(val: Integer);
    procedure SetDepartamento(val: Integer);
    procedure SetSubTipo(val: Integer);
    procedure SetFilial(val: Integer);
    procedure SetFuncao(val: Integer);
    procedure SetTipoDoc(val: String);
    procedure SetDataCadastro(val: TDateTime);
    procedure SetUsuario(val: Integer);
    procedure SetRoteiro(val: Integer);
    procedure SetStatusGR(val: Integer);
    procedure SetStatusCadastro(val: Integer);
  public
    property Codigo: Integer read FCodigo write SetCodigo;
    property TipoCadastro: Integer read FTipoCadastro write SetTipoCadastro;
    property Departamento: Integer read FDepartamento write SetDepartamento;
    property SubTipo: Integer read FSubTipo write SetSubTipo;
    property Filial: Integer read FFilial write SetFilial;
    property Funcao: Integer read FFuncao write SetFuncao;
    property TipoDoc: String read FTipoDoc write SetTipoDoc;
    property DataCadastro: TDateTime read FDataCadastro write SetDataCadastro;
    property Usuario: Integer read FUsuario write SetUsuario;
    property Roteiro: Integer read FRoteiro write SetRoteiro;
    property StatusGR: Integer read FStatusGR write SetStatusGR;
    property StatusCadastro: Integer read FStatusCadastro
      write SetStatusCadastro;
    function ValidarDados: Boolean;
    function getObject(sId: String; sFiltro: String): Boolean;
    constructor Create;
    function getObjects: Boolean;
    function Delete(sFiltro: String): Boolean;
    destructor Destroy; override;
    function Insert: Boolean;
    function Update: Boolean;
    function getField(sCampo: String; sColuna: String): String;
  end;

CONST
  TABLENAME = 'cad_cadastro';

implementation

uses udm;

procedure TCadastro.SetCodigo(val: Integer);
begin
  FCodigo := val;
end;

procedure TCadastro.SetTipoCadastro(val: Integer);
begin
  FTipoCadastro := val;
end;

procedure TCadastro.SetDepartamento(val: Integer);
begin
  FDepartamento := val;
end;

procedure TCadastro.SetSubTipo(val: Integer);
begin
  FSubTipo := val;
end;

procedure TCadastro.SetFilial(val: Integer);
begin
  FFilial := val;
end;

procedure TCadastro.SetFuncao(val: Integer);
begin
  FFuncao := val;
end;

procedure TCadastro.SetTipoDoc(val: String);
begin
  FTipoDoc := val;
end;

procedure TCadastro.SetDataCadastro(val: TDateTime);
begin
  FDataCadastro := val;
end;

procedure TCadastro.SetUsuario(val: Integer);
begin
  FUsuario := val;
end;

procedure TCadastro.SetRoteiro(val: Integer);
begin
  FRoteiro := val;
end;

procedure TCadastro.SetStatusGR(val: Integer);
begin
  FStatusGR := val;
end;

procedure TCadastro.SetStatusCadastro(val: Integer);
begin
  FStatusCadastro := val;
end;

function TCadastro.ValidarDados: Boolean;
begin
  try
    Result := False;
    if Self.TipoCadastro = 0 then
    begin
      MessageDlg('Informe o Tipo de Cadastro!',mtWarning,[mbCancel],0);
      Exit;
    end;
    if Self.Departamento = 0 then
    begin
      MessageDlg('Informe o Departamento!',mtWarning,[mbCancel],0);
      Exit;
    end;
    if Self.SubTipo = 0 then
    begin
      MessageDlg('Informe o Sub-Tipo!',mtWarning,[mbCancel],0);
      Exit;
    end;
    if Self.Filial = 0 then
    begin
      MessageDlg('Informe a Filial!',mtWarning,[mbCancel],0);
      Exit;
    end;
    if Self.Nome.IsEmpty then
    begin
      MessageDlg('Informe o Nomeou Razão Social!',mtWarning,[mbCancel],0);
      Exit;
    end;
    //Empresa
    if Self.TipoCadastro = 2 then
    begin
      if Self.Responsavel.IsEmpty then
      begin
        MessageDlg('Informe o nome do Responsável!',mtWarning,[mbCancel],0);
        Exit;
      end;
      if Self.Fantasia.IsEmpty then
      begin
        MessageDlg('Informe o nome Fantasia!',mtWarning,[mbCancel],0);
        Exit;
      end;
      Self.TipoDoc := 'CNPJ';
      if Self.CNPJ.IsEmpty then
      begin
        MessageDlg('Informe o Número do CNPJ!',mtWarning,[mbCancel],0);
        Exit;
      end;
      if (not Self.VerificaCNPJ(Self.CNPJ)) then
      begin
        MessageDlg('CNPJ Inválido!',mtWarning,[mbCancel],0);
        Exit;
      end;
      if (not Self.RG.IsEmpty) then
      begin
        if Self.Expedidor.IsEmpty then
        begin
          MessageDlg('Informe o Orgão Expedidor do RG do Responsável!',mtWarning,[mbCancel],0);
          Exit;
        end;
        if Self.UFRG.IsEmpty then
        begin
          MessageDlg('Informe o Estdo do RG do Resposável!',mtWarning,[mbCancel],0);
          Exit;
        end;
        if Self.Naturalidade.IsEmpty then
        begin
          MessageDlg('Informe a Naturalidade do Responsável!',mtWarning,[mbCancel],0);
          Exit;
        end;
        if Self.UFNaturalidade.IsEmpty then
        begin
          MessageDlg('Informe o Estado da Naturalidade do Responsável!',mtWarning,[mbCancel],0);
          Exit;
        end;
        if Self.DataRG = 0 then
        begin
          MessageDlg('Informe a Data de Emissão do RG do Responsável!',mtWarning,[mbCancel],0);
          Exit;
        end;
      end;
      if (not Self.RegistroCNH.IsEmpty) then
      begin
        if Self.ValidadeCNH = 0 then
        begin
          MessageDlg('Informe a Validade da CNH do Responsável!',mtWarning,[mbCancel],0);
          Exit;
        end;
        if Self.ValidadeCNH <  Now then
        begin
          MessageDlg('CNH do Responsável esta expirada!',mtWarning,[mbCancel],0);
          Exit;
        end;
        if Self.CategoriaCNH.IsEmpty then
        begin
          MessageDlg('Informe o Número da CNH do Responsável!',mtWarning,[mbCancel],0);
          Exit;
        end;
        if Pos(Self.CategoriaCNH, 'ABCDEABACADAE') = 0 then
        begin
          MessageDlg('Categoria do CNH do Responsável inválida!',mtWarning,[mbCancel],0);
          Exit;
        end;
        if Self.UFCNH.IsEmpty then
        begin
          MessageDlg('Informe o Estado da CNH do Responsável!',mtWarning,[mbCancel],0);
          Exit;
        end;
      end;
    end;
    //Funcionarios
    if Self.TipoCadastro = 1 then
    begin
      if Self.CNPJ.IsEmpty then
      begin
        MessageDlg('Informe o Número do CPF!',mtWarning,[mbCancel],0);
        Exit;
      end;
      Self.TipoDoc := 'CPF';
      if (not Self.VerificaCPF(Self.CNPJ)) then
      begin
        MessageDlg('CPF Inválido!',mtWarning,[mbCancel],0);
        Exit;
      end;
      if Self.Funcao = 0 then
      begin
        MessageDlg('Informe a Função!',mtWarning,[mbCancel],0);
        Exit;
      end;
      if Self.SubTipo = 0 then
      begin
        MessageDlg('Informe o Sub-Tipo!',mtWarning,[mbCancel],0);
        Exit;
      end;
      if (not Self.RG.IsEmpty) then
      begin
        if Self.Expedidor.IsEmpty then
        begin
          MessageDlg('Informe o Orgão Expedidor do RG!',mtWarning,[mbCancel],0);
          Exit;
        end;
        if Self.UFRG.IsEmpty then
        begin
          MessageDlg('Informe o Estdo do RG!',mtWarning,[mbCancel],0);
          Exit;
        end;
        if Self.Naturalidade.IsEmpty then
        begin
          MessageDlg('Informe a Naturalidade!',mtWarning,[mbCancel],0);
          Exit;
        end;
        if Self.UFNaturalidade.IsEmpty then
        begin
          MessageDlg('Informe o Estado da Naturalidade!',mtWarning,[mbCancel],0);
          Exit;
        end;
        if Self.DataRG = 0 then
        begin
          MessageDlg('Informe a Data de Emissão do RG!',mtWarning,[mbCancel],0);
          Exit;
        end;
      end;
      if (not Self.RegistroCNH.IsEmpty) then
      begin
        if Self.ValidadeCNH = 0 then
        begin
          MessageDlg('Informe a Validade da CNH!',mtWarning,[mbCancel],0);
          Exit;
        end;
        if Self.ValidadeCNH <  Now then
        begin
          MessageDlg('CNH esta expirada!',mtWarning,[mbCancel],0);
          Exit;
        end;
        if Pos(Self.CategoriaCNH, 'ABCDEABACADAE') = 0 then
        begin
          MessageDlg('Categoria do CNH do Responsável inválida!',mtWarning,[mbCancel],0);
          Exit;
        end;
        if Self.UFCNH.IsEmpty then
        begin
          MessageDlg('Informe o Estado da CNH do Responsável!',mtWarning,[mbCancel],0);
          Exit;
        end;
      end;
      if (not Self.PIS.IsEmpty) then
      begin
        if (not Self.VerificarPIS(Self.PIS)) then
        begin
          MessageDlg('PIS inválido!',mtWarning,[mbCancel],0);
          Exit;
        end;
      end;
      if (not Self.CTPS.IsEmpty) then
      begin
        if Self.SerieCTPS.IsEmpty then
        begin
          MessageDlg('Informe a Série da Carteira Profissional!',mtWarning,[mbCancel],0);
          Exit;
        end;
        if Self.UFCTPS.IsEmpty then
        begin
          MessageDlg('Informe o Estado da Carteira Profissional!',mtWarning,[mbCancel],0);
          Exit;
        end;
      end;
    end;
    //Entregadores / Autonomos
    if (Self.TipoCadastro = 3) or (Self.TipoCadastro = 4) then
    begin
      if Self.CNPJ.IsEmpty then
      begin
        MessageDlg('Informe o Número do CPF!',mtWarning,[mbCancel],0);
        Exit;
      end;
      Self.TipoDoc := 'CPF';
      if (not Self.VerificaCPF(Self.CNPJ)) then
      begin
        MessageDlg('CPF Inválido!',mtWarning,[mbCancel],0);
        Exit;
      end;
      if (not Self.RG.IsEmpty) then
      begin
        if Self.Expedidor.IsEmpty then
        begin
          MessageDlg('Informe o Orgão Expedidor do RG!',mtWarning,[mbCancel],0);
          Exit;
        end;
        if Self.UFRG.IsEmpty then
        begin
          MessageDlg('Informe o Estdo do RG!',mtWarning,[mbCancel],0);
          Exit;
        end;
        if Self.Naturalidade.IsEmpty then
        begin
          MessageDlg('Informe a Naturalidade!',mtWarning,[mbCancel],0);
          Exit;
        end;
        if Self.UFNaturalidade.IsEmpty then
        begin
          MessageDlg('Informe o Estado da Naturalidade!',mtWarning,[mbCancel],0);
          Exit;
        end;
        if Self.DataRG = 0 then
        begin
          MessageDlg('Informe a Data de Emissão do RG!',mtWarning,[mbCancel],0);
          Exit;
        end;
      end;
      if (not Self.RegistroCNH.IsEmpty) then
      begin
        if Self.ValidadeCNH = 0 then
        begin
          MessageDlg('Informe a Validade da CNH!',mtWarning,[mbCancel],0);
          Exit;
        end;
        if Self.ValidadeCNH <  Now then
        begin
          MessageDlg('CNH esta expirada!',mtWarning,[mbCancel],0);
          Exit;
        end;
        if Pos(Self.CategoriaCNH, 'ABCDEABACADAE') = 0 then
        begin
          MessageDlg('Categoria do CNH do Responsável inválida!',mtWarning,[mbCancel],0);
          Exit;
        end;
        if Self.UFCNH.IsEmpty then
        begin
          MessageDlg('Informe o Estado da CNH do Responsável!',mtWarning,[mbCancel],0);
          Exit;
        end;
      end;
    end;
    // Financeiro
    if (not Self.FormaCredito.IsEmpty) then
    begin
      if Pos(Copy(Self.FormaCredito,1,2),'010204') > 0 then
      begin
        if Self.TipoConta.IsEmpty then
        begin
          MessageDlg('Informe o Tipo de Conta Bancária!',mtWarning,[mbCancel],0);
          Exit;
        end;
        if StrToIntDef(Self.Banco,0) = 0 then
        begin
          MessageDlg('Informe o Banco da Conta!',mtWarning,[mbCancel],0);
          Exit;
        end;
        if Self.Agencia.IsEmpty then
        begin
          MessageDlg('Informe a Agência Bancária da Conta!',mtWarning,[mbCancel],0);
          Exit;
        end;
        if Self.Conta.IsEmpty then
        begin
          MessageDlg('Informe o Número da Conta Bancária!',mtWarning,[mbCancel],0);
          Exit;
        end;
        if Self.Favorecido.IsEmpty then
        begin
          MessageDlg('Informe o Nome do Favorecido da Conta Bancária!',mtWarning,[mbCancel],0);
          Exit;
        end;
        if Self.CNPJFavorecido.IsEmpty then
        begin
          MessageDlg('Informe o CPF/CNPJ do Favorecido da Conta Bancária!',mtWarning,[mbCancel],0);
          Exit;
        end
        else
        begin
          if (not Self.VerificaCNPJ(Self.CNPJFavorecido)) then
          begin
            if (not Self.VerificaCPF(Self.CNPJFavorecido)) then
            begin
              MessageDlg('CPF/CNPJ do Favorecido da Conta Bancária é inválido!',mtWarning,[mbCancel],0);
              Exit;
            end;
          end;
        end;
      end;
    end;
    Result := True;
  except on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' + E.Message);
  end;
end;

function TCadastro.getObject(sId: String; sFiltro: String): Boolean;
begin
  try
    Result := False;
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
    if sFiltro = 'CADASTRO' then begin
      dm.qryGetObject.SQL.Add(' WHERE COD_CADASTRO = :CODIGO');
      dm.qryGetObject.ParamByName('CADASTRO').AsInteger := StrToInt(sId);
    end
    else if sFiltro = 'NOME' then begin
      dm.qryGetObject.SQL.Add(' WHERE NOM_NOME_RAZAO LIKE (:NOME)');
      dm.qryGetObject.ParamByName('CTPS').AsString := QuotedStr('%' + sId + '%');
    end
    else if sFiltro = 'CNPJ' then begin
      dm.qryGetObject.SQL.Add(' WHERE NUM_CNPJ = :CNPJ');
      dm.qryGetObject.ParamByName('CNPJ').AsString := sId;
    end
    else if sFiltro = 'CPF' then begin
      dm.qryGetObject.SQL.Add(' WHERE NUM_CPF = :CPF');
      dm.qryGetObject.ParamByName('CPF').AsString := sId;
    end
    else if sFiltro = 'RG' then begin
      dm.qryGetObject.SQL.Add(' WHERE NUM_RG = :RG');
      dm.qryGetObject.ParamByName('RG').AsString := sId;
    end
    else if sFiltro = 'IE' then begin
      dm.qryGetObject.SQL.Add(' WHERE NUM_IE = :IE');
      dm.qryGetObject.ParamByName('IE').AsString := sId;
    end
    else if sFiltro = 'PIS' then begin
      dm.qryGetObject.SQL.Add(' WHERE NUM_PIS = :PIS');
      dm.qryGetObject.ParamByName('PIS').AsString := sId;
    end
    else if sFiltro = 'CTPS' then begin
      dm.qryGetObject.SQL.Add(' WHERE NUM_CTPS = :CTPS');
      dm.qryGetObject.ParamByName('CTPS').AsString := sId;
    end
    else if sFiltro = 'CNH' then begin
      dm.qryGetObject.SQL.Add(' WHERE NUM_REGISTRO_CNH = :CNH');
      dm.qryGetObject.ParamByName('CNH').AsString := sId;
    end
    else if sFiltro = 'TIPOCADASTRO' then begin
      dm.qryGetObject.SQL.Add(' WHERE COD_TIPO_CADASTRO = :TIPOCADASTRO');
      dm.qryGetObject.ParamByName('TIPOCADASTRO').AsInteger := StrToIntDef(sId,0);
    end
    else if sFiltro = 'DEPARTAMENTO' then begin
      dm.qryGetObject.SQL.Add(' WHERE COD_DEPARTAMENTO = :DEPARTAMENTO');
      dm.qryGetObject.ParamByName('DEPARTAMENTO').AsInteger := StrToIntDef(sId,0);
    end
    else if sFiltro = 'FILIAL' then begin
      dm.qryGetObject.SQL.Add(' WHERE COD_FILIAL = :FILIAL');
      dm.qryGetObject.ParamByName('FILIAL').AsInteger := StrToIntDef(sId,0);
    end
    else if sFiltro = 'FILTRO' then begin
      dm.qryGetObject.SQL.Add(' WHERE ' + sId);
    end;
    dm.ZConn.PingServer;
    dm.qryGetObject.Open;
    if (not dm.qryGetObject.IsEmpty) then
    begin
      dm.qryGetObject.First;
      Self.Codigo := dm.qryGetObject.FieldByName('COD_CADASTRO').AsInteger;
      Self.TipoCadastro := dm.qryGetObject.FieldByName('COD_TIPO_CADASTRO').AsInteger;
      Self.Departamento := dm.qryGetObject.FieldByName('COD_DEPARTAMENTO').AsInteger;
      Self.SubTipo := dm.qryGetObject.FieldByName('COD_SUB_TIPO').AsInteger;
      Self.Filial := dm.qryGetObject.FieldByName('COD_FILIAL').AsInteger;
      Self.Nome := dm.qryGetObject.FieldByName('NOM_NOME_RAZAO').AsString;
      Self.Responsavel := dm.qryGetObject.FieldByName('NOM_RESPONSAVEL').AsString;
      Self.Fantasia := dm.qryGetObject.FieldByName('NOM_FANTASIA').AsString;
      Self.Funcao := dm.qryGetObject.FieldByName('COD_FUNCAO').AsInteger;
      Self.TipoDoc := dm.qryGetObject.FieldByName('DES_TIPO_DOC').AsString;
      Self.CPF := dm.qryGetObject.FieldByName('NUM_CPF').AsString;
      Self.CNPJ := dm.qryGetObject.FieldByName('NUM_CNPJ').AsString;
      Self.RG := dm.qryGetObject.FieldByName('NUM_RG').AsString;
      Self.IE := dm.qryGetObject.FieldByName('NUM_IE').AsString;
      Self.IEST := dm.qryGetObject.FieldByName('NUM_IEST').AsString;
      Self.IM := dm.qryGetObject.FieldByName('NUM_IM').AsString;
      Self.Expedidor := dm.qryGetObject.FieldByName('DES_EXPEDIDOR').AsString;
      Self.UFRG := dm.qryGetObject.FieldByName('UF_EXPEDIDOR').AsString;
      Self.DataRG := dm.qryGetObject.FieldByName('DAT_EMISSAO').AsDateTime;
      Self.Nascimento := dm.qryGetObject.FieldByName('DAT_NASCIMENTO').AsDateTime;
      Self.Pai := dm.qryGetObject.FieldByName('NOM_PAI').AsString;
      Self.Mae := dm.qryGetObject.FieldByName('NOM_MAE').AsString;
      Self.Naturalidade := dm.qryGetObject.FieldByName('DES_NATURALIDADE').AsString;
      Self.UFNaturalidade := dm.qryGetObject.FieldByName('UF_NATURALIDADE').AsString;
      Self.SUFRAMA := dm.qryGetObject.FieldByName('NUM_SUFRAMA').AsString;
      Self.CNH := dm.qryGetObject.FieldByName('NUM_CNH').AsString;
      Self.CNAE := dm.qryGetObject.FieldByName('NUM_CNAE').AsString;
      Self.CRT := dm.qryGetObject.FieldByName('NUM_CRT').AsInteger;
      Self.RegistroCNH := dm.qryGetObject.FieldByName('NUM_REGISTRO_CNH').AsString;
      Self.UFCNH := dm.qryGetObject.FieldByName('UF_CNH').AsString;
      Self.ValidadeCNH := dm.qryGetObject.FieldByName('DAT_VALIDADE_CNH').AsDateTime;
      Self.CategoriaCNH := dm.qryGetObject.FieldByName('DES_CATEGORIA').AsString;
      Self.PrimeiraCNH := dm.qryGetObject.FieldByName('DAT_PRIMEIRA_CNH').AsDateTime;
      Self.PIS := dm.qryGetObject.FieldByName('NUM_PIS').AsString;
      Self.CTPS := dm.qryGetObject.FieldByName('NUM_CTPS').AsString;
      Self.SerieCTPS := dm.qryGetObject.FieldByName('NUM_SERIE_CTPS').AsString;
      Self.UFCTPS := dm.qryGetObject.FieldByName('UF_CTPS').AsString;
      Self.EstadoCivil := dm.qryGetObject.FieldByName('DES_ESTADO_CIVIL').AsString;
      Self.TituloEleitor := dm.qryGetObject.FieldByName('NUM_TITULO_ELEITOR').AsString;
      Self.Reservista := dm.qryGetObject.FieldByName('NUM_RESERVISTA').AsString;
      Self.FormaCredito := dm.qryGetObject.FieldByName('DES_FORMA_CREDITO').AsString;
      Self.TipoConta := dm.qryGetObject.FieldByName('DES_TIPO_CONTA').AsString;
      Self.Banco := dm.qryGetObject.FieldByName('COD_BANCO').AsString;
      Self.Agencia := dm.qryGetObject.FieldByName('NUM_AGENCIA').AsString;
      Self.Conta := dm.qryGetObject.FieldByName('NUM_CONTA').AsString;
      Self.Favorecido := dm.qryGetObject.FieldByName('NOM_FAVORECIDO').AsString;
      Self.CPFFavorecido := dm.qryGetObject.FieldByName('NUM_CPF_CNPJ_FAVORECIDO').AsString;
      Self.DataCadastro := dm.qryGetObject.FieldByName('DAT_CADASTRO').AsDateTime;
      Self.Usuario := dm.qryGetObject.FieldByName('COD_USUARIO_PROPRIETARIO').AsInteger;
      Self.Roteiro := dm.qryGetObject.FieldByName('NUM_ROTEIRO').AsInteger;
      Self.StatusGR := dm.qryGetObject.FieldByName('DES_STATUS_GR').AsInteger;
      Self.StatusCadastro := dm.qryGetObject.FieldByName('DES_STATUS_CADASTRO').AsInteger;
    end
    else
    begin
      dm.qryGetObject.Close;
      dm.qryGetObject.SQL.Clear;
    end;
    Result := True;
  except on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' + E.Message);
  end;
end;

constructor TCadastro.Create;
begin
  inherited Create;
  conexao := TConexao.Create;
end;

function TCadastro.getObjects: Boolean;
begin
  try
    Result := False;
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
    if dm.qryGetObject.IsEmpty then
    begin
      dm.qryGetObject.Close;
      dm.qryGetObject.SQL.Clear;
      Exit;
    end;
    dm.qryGetObject.First;
    Result := True;
  except on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' + E.Message);
  end;
end;

function TCadastro.Delete(sFiltro: String): Boolean;
begin
  try
    Result := False;
    if (not conexao.VerifyConnZEOS(0)) then begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados!', mtError, [mbCancel], 0);
      Exit;
    end;
    dm.qryCRUD.Close;
    dm.qryCRUD.SQL.Add('DELETE FROM ' + TABLENAME);
    if sFiltro = 'CADASTRO' then begin
      dm.qryGetObject.SQL.Add(' WHERE COD_CADASTRO = :CODIGO');
      dm.qryGetObject.ParamByName('CADASTRO').AsInteger := Self.Codigo;
    end
    else if sFiltro = 'CNPJ' then begin
      dm.qryGetObject.SQL.Add(' WHERE NUM_CNPJ = :CNPJ');
      dm.qryGetObject.ParamByName('CNPJ').AsString := Self.CNPJ;
    end
    else if sFiltro = 'CPF' then begin
      dm.qryGetObject.SQL.Add(' WHERE NUM_CPF = :CPF');
      dm.qryGetObject.ParamByName('CPF').AsString := Self.CPF;
    end
    else if sFiltro = 'RG' then begin
      dm.qryGetObject.SQL.Add(' WHERE NUM_RG = :RG');
      dm.qryGetObject.ParamByName('RG').AsString := Self.RG;
    end
    else if sFiltro = 'IE' then begin
      dm.qryGetObject.SQL.Add(' WHERE NUM_IE = :IE');
      dm.qryGetObject.ParamByName('IE').AsString := Self.RG;
    end
    else if sFiltro = 'PIS' then begin
      dm.qryGetObject.SQL.Add(' WHERE NUM_PIS = :PIS');
      dm.qryGetObject.ParamByName('PIS').AsString := Self.PIS;
    end
    else if sFiltro = 'CTPS' then begin
      dm.qryGetObject.SQL.Add(' WHERE NUM_CTPS = :CTPS');
      dm.qryGetObject.ParamByName('CTPS').AsString := Self.CTPS;
    end
    else if sFiltro = 'CNH' then begin
      dm.qryGetObject.SQL.Add(' WHERE NUM_REGISTRO_CNH = :CNH');
      dm.qryGetObject.ParamByName('CNH').AsString := Self.RegistroCNH;
    end;
    dm.ZConn.PingServer;
    dm.qryCRUD.ExecSQL;
    dm.qryCRUD.Close;
    dm.qryCRUD.SQL.Clear;
    Result := True;
  except on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' + E.Message);
  end;
end;

destructor TCadastro.Destroy;
begin
  inherited Destroy;
  conexao.Free;
end;

function TCadastro.Insert: Boolean;
begin
  try
    Result := False;
    if (not conexao.VerifyConnZEOS(0)) then begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados!', mtError, [mbCancel], 0);
      Exit;
    end;
    dm.qryCRUD.Close;
    dm.qryCRUD.SQL.Clear;
    dm.qryCRUD.SQL.Text :=  'INSERT INTO ' + TABLENAME + '(' +
                            'COD_TIPO_CADASTRO,' +
                            'COD_DEPARTAMENTO,' +
                            'COD_SUB_TIPO,' +
                            'COD_FILIAL,' +
                            'NOM_NOME_RAZAO,' +
                            'NOM_RESPONSAVEL,' +
                            'NOM_FANTASIA,' +
                            'COD_FUNCAO,' +
                            'DES_TIPO_DOC,' +
                            'NUM_CPF,' +
                            'NUM_CNPJ,' +
                            'NUM_RG,' +
                            'NUM_IE,' +
                            'NUM_IEST,' +
                            'NUM_IM,' +
                            'DES_EXPEDIDOR,' +
                            'UF_EXPEDIDOR,' +
                            'DAT_EMISSAO_RG,' +
                            'DAT_NASCIMENTO,' +
                            'NOM_PAI,' +
                            'NOM_MAE,' +
                            'DES_NATURALIDADE,' +
                            'UF_NATURALIDADE,' +
                            'NUM_SUFRAMA,' +
                            'NUM_CNH,' +
                            'NUM_CNAE,' +
                            'NUM_CRT,' +
                            'NUM_REGISTRO_CNH,' +
                            'UF_CNH,' +
                            'DAT_VALIDADE_CNH,' +
                            'DES_CATEGORIA_CNH,' +
                            'DAT_PRIMEIRA_CNH,' +
                            'NUM_PIS,' +
                            'NUM_CTPS,' +
                            'NUM_SERIE_CTPS,' +
                            'UF_CTPS,' +
                            'DES_ESTADO_CIVIL,' +
                            'NUM_TITULO_ELEITOR,' +
                            'NUM_RESERVISTA,' +
                            'DES_FORMA_CREDITO,' +
                            'DES_TIPO_CONTA,' +
                            'COD_BANCO,' +
                            'NUM_AGENCIA,' +
                            'NUM_CONTA,' +
                            'NOM_FAVORECIDO,' +
                            'NUM_CPF_CNPJ_FAVORECIDO,' +
                            'DAT_CADASTRO,' +
                            'COD_USUARIO_PROPRIETARIO,' +
                            'NUM_ROTEIRO,' +
                            'DES_STATUS_GR,' +
                            'DES_STATUS_CADASTRO) ' +
                            'VALUES (' +
                            ':CODIGO, ' +
                            ':TIPOCADASTRO, ' +
                            ':DEPARTAMENTO, ' +
                            ':SUBTIPO, ' +
                            ':FILIAL, ' +
                            ':NOME, ' +
                            ':RESPONSAVEL, ' +
                            ':FANTASIA, ' +
                            ':FUNCAO, ' +
                            ':TIPODOC, ' +
                            ':CPF, ' +
                            ':CNPJ, ' +
                            ':RG, ' +
                            ':IE, ' +
                            ':IEST, ' +
                            ':IM, ' +
                            ':EXPEDIDOR, ' +
                            ':UFEXPEDIDOR, ' +
                            ':EMISSAO, ' +
                            ':NASCIMENTO, ' +
                            ':PAI, ' +
                            ':MAE, ' +
                            ':NATURALIDADE, ' +
                            'UF_NATURALIDADE, ' +
                            ':SUFRAMA, ' +
                            ':CNH, ' +
                            ':CNAE, ' +
                            ':CRT, ' +
                            ':REGISTROCNH, ' +
                            ':UFCNH, ' +
                            ':VALIDADECNH, ' +
                            ':CATEGORIA, ' +
                            ':PRIMEIRACNH, ' +
                            ':PIS, ' +
                            ':CTPS, ' +
                            ':SERIECTPS, ' +
                            ':UFCTPS, ' +
                            ':ESTADOCIVIL, ' +
                            ':TITULO, ' +
                            ':RESERVISTA, ' +
                            ':FORMACREDITO, ' +
                            ':TIPOCONTA, ' +
                            ':BANCO, ' +
                            ':AGENCIA, ' +
                            ':CONTA, ' +
                            ':FAVORECIDO, ' +
                            ':CPFFAVORECIDO, ' +
                            ':DATACADASTRO, ' +
                            ':USUARIO, ' +
                            ':ROTEIRO, ' +
                            ':STATUSGR, ' +
                            ':STATUSCADASTRO);';
    dm.qryCRUD.ParamByName('TIPOCADASTRO').AsInteger := Self.TipoCadastro;
    dm.qryCRUD.ParamByName('DEPARTAMENTO').AsInteger := Self.Departamento;
    dm.qryCRUD.ParamByName('SUBTIPO').AsInteger := Self.SubTipo;
    dm.qryCRUD.ParamByName('FILIAL').AsInteger := Self.Filial;
    dm.qryCRUD.ParamByName('NOME').AsString := Self.Nome;
    dm.qryCRUD.ParamByName('RESPONSAVEL').AsString := Self.Responsavel;
    dm.qryCRUD.ParamByName('FANTASIA').AsString := Self.Fantasia;
    dm.qryCRUD.ParamByName('FUNCAO').AsInteger := Self.Funcao;
    dm.qryCRUD.ParamByName('TIPODOC').AsString := Self.TipoDoc;
    dm.qryCRUD.ParamByName('CPF').AsString := Self.CPF;
    dm.qryCRUD.ParamByName('CNPJ').AsString := Self.CNPJ;
    dm.qryCRUD.ParamByName('RG').AsString := Self.RG;
    dm.qryCRUD.ParamByName('IE').AsString := Self.IE;
    dm.qryCRUD.ParamByName('IEST').AsString := Self.IEST;
    dm.qryCRUD.ParamByName('IM').AsString := Self.IM;
    dm.qryCRUD.ParamByName('EXPEDIDOR').AsString := Self.Expedidor;
    dm.qryCRUD.ParamByName('UFEXPEDIDOR').AsString := Self.UFRG;
    dm.qryCRUD.ParamByName('EMISSAO').AsDate := Self.DataRG;
    dm.qryCRUD.ParamByName('NASCIMENTO').AsDateTime := Self.Nascimento;
    dm.qryCRUD.ParamByName('PAI').AsString := Self.Pai;
    dm.qryCRUD.ParamByName('MAE').AsString := Self.Mae;
    dm.qryCRUD.ParamByName('NATURALIDADE').AsString := Self.Naturalidade;
    dm.qryCRUD.ParamByName('UFNATURALIDADE').AsString := Self.UFNaturalidade;
    dm.qryCRUD.ParamByName('SUFRAMA').AsString := Self.SUFRAMA;
    dm.qryCRUD.ParamByName('CNH').AsString := Self.CNH;
    dm.qryCRUD.ParamByName('CNAE').AsString := Self.CNAE;
    dm.qryCRUD.ParamByName('CRT').AsInteger := Self.CRT;
    dm.qryCRUD.ParamByName('REGISTROCNH').AsString := Self.RegistroCNH;
    dm.qryCRUD.ParamByName('UFCNH').AsString := Self.UFCNH;
    dm.qryCRUD.ParamByName('VALIDADE').AsDateTime := Self.ValidadeCNH;
    dm.qryCRUD.ParamByName('CATEGORIA').AsString := Self.CategoriaCNH;
    dm.qryCRUD.ParamByName('PRIMEIRACNH').AsDateTime := Self.PrimeiraCNH;
    dm.qryCRUD.ParamByName('PIS').AsString := Self.PIS;
    dm.qryCRUD.ParamByName('CTPS').AsString := Self.CTPS;
    dm.qryCRUD.ParamByName('SERIECTPS').AsString := Self.SerieCTPS;
    dm.qryCRUD.ParamByName('UFCTPS').AsString := Self.UFCTPS;
    dm.qryCRUD.ParamByName('ESTADOCIVIL').AsString := Self.EstadoCivil;
    dm.qryCRUD.ParamByName('TITULO').AsString := Self.TituloEleitor;
    dm.qryCRUD.ParamByName('RESERVISTA').AsString := Self.Reservista;
    dm.qryCRUD.ParamByName('FORMACREDITO').AsString := Self.FormaCredito;
    dm.qryCRUD.ParamByName('TIPOCONTA').AsString := Self.TipoConta;
    dm.qryCRUD.ParamByName('BANCO').AsString := Self.Banco;
    dm.qryCRUD.ParamByName('AGENCIA').AsString := Self.Agencia;
    dm.qryCRUD.ParamByName('CONTA').AsString := Self.Conta;
    dm.qryCRUD.ParamByName('FAVORECIDO').AsString := Self.Favorecido;
    dm.qryCRUD.ParamByName('CPFFAVORECIDO').AsString := Self.CPFFavorecido;
    dm.qryCRUD.ParamByName('DATACADASTRO').AsDateTime := Self.DataCadastro;
    dm.qryCRUD.ParamByName('USUARIO').AsInteger := Self.Usuario;
    dm.qryCRUD.ParamByName('ROTEIRO').AsInteger := Self.Roteiro;
    dm.qryCRUD.ParamByName('STATUSGR').AsInteger := Self.StatusGR;
    dm.qryCRUD.ParamByName('STATUSCADASTRO').AsInteger := Self.StatusCadastro;
    dm.ZConn.PingServer;
    dm.qryCRUD.ExecSQL;
    dm.qryCRUD.Close;
    dm.qryCRUD.SQL.Clear;
    Result := True;
  except on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' + E.Message);
  end;
end;

function TCadastro.Update: Boolean;
begin
  try
    Result := False;
    if (not conexao.VerifyConnZEOS(0)) then begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados!', mtError, [mbCancel], 0);
      Exit;
    end;
    dm.qryCRUD.Close;
    dm.qryCRUD.SQL.Clear;
    dm.qryCRUD.SQL.Text :=  'UPDATE ' + TABLENAME + 'SET ' +
                            'COD_CADASTRO = :CODIGO,' +
                            'COD_TIPO_CADASTRO = :TIPOCADASTRO,' +
                            'COD_DEPARTAMENTO = :DEPARTAMENTO,' +
                            'COD_SUB_TIPO = :SUBTIPO,' +
                            'COD_FILIAL = :FILIAL,' +
                            'NOM_NOME_RAZAO = :NOME,' +
                            'NOM_RESPONSAVEL = :RESPONSAVEL,' +
                            'NOM_FANTASIA = :FANTASIA,' +
                            'COD_FUNCAO = :FUNCAO,' +
                            'DES_TIPO_DOC = :TIPODOC,' +
                            'NUM_CPF = :CPF,' +
                            'NUM_CNPJ = :CNPJ,' +
                            'NUM_RG = :RG,' +
                            'NUM_IE = :IE,' +
                            'NUM_IEST = :IEST,' +
                            'NUM_IM = :IM,' +
                            'DES_EXPEDIDOR = :EXPEDIDOR,' +
                            'UF_EXPEDIDOR = :UFEXPEDIDOR,' +
                            'DAT_EMISSAO_RG = :EMISSAO,' +
                            'DAT_NASCIMENTO = :NASCIMENTO,' +
                            'NOM_PAI = :PAI,' +
                            'NOM_MAE = :MAE,' +
                            'DES_NATURALIDADE = :NATURALIDADE,' +
                            'UF_NATURALIDADE = :UFNATURALIDADE,' +
                            'NUM_SUFRAMA = :SUFRAMA,' +
                            'NUM_CNH = :CNH,' +
                            'NUM_CNAE = :CNAE,' +
                            'NUM_CRT = :CRT,' +
                            'NUM_REGISTRO_CNH = :REGISTROCNH,' +
                            'UF_CNH = :UFCNH,' +
                            'DAT_VALIDADE_CNH = :VALIDADE,' +
                            'DES_CATEGORIA_CNH = :CATEGORIA,' +
                            'DAT_PRIMEIRA_CNH = :PRIMEIRACNH,' +
                            'NUM_PIS = :PIS,' +
                            'NUM_CTPS = :CTPS,' +
                            'NUM_SERIE_CTPS = :SERIECTPS,' +
                            'UF_CTPS = :UFCTPS,' +
                            'DES_ESTADO_CIVIL = :ESTADOCIVIL,' +
                            'NUM_TITULO_ELEITOR = :TITULO,' +
                            'NUM_RESERVISTA = :RESERVISTA,' +
                            'DES_FORMA_CREDITO = :FORMACREDITO,' +
                            'DES_TIPO_CONTA = :TIPOCONTA,' +
                            'COD_BANCO = :BANCO,' +
                            'NUM_AGENCIA = :AGENCIA,' +
                            'NUM_CONTA = :CONTA,' +
                            'NOM_FAVORECIDO = :FAVORECIDO,' +
                            'NUM_CPF_CNPJ_FAVORECIDO = :CPFFAVORECIDO,' +
                            'DAT_CADASTRO = :DATACADASTRO,' +
                            'COD_USUARIO_PROPRIETARIO = :USUARIO,' +
                            'NUM_ROTEIRO = :ROTEIRO, ' +
                            'DES_STATUS_GR = :STATUSGR,' +
                            'DES_STATUS_CADASTRO = :STATUSCADASTRO, ' +
                            'WHERE COD_CADASTRO = :CODIGO;';
    dm.qryCRUD.ParamByName('CODIGO').AsInteger := Self.Codigo;
    dm.qryCRUD.ParamByName('TIPOCADASTRO').AsInteger := Self.TipoCadastro;
    dm.qryCRUD.ParamByName('DEPARTAMENTO').AsInteger := Self.Departamento;
    dm.qryCRUD.ParamByName('SUBTIPO').AsInteger := Self.SubTipo;
    dm.qryCRUD.ParamByName('FILIAL').AsInteger := Self.Filial;
    dm.qryCRUD.ParamByName('NOME').AsString := Self.Nome;
    dm.qryCRUD.ParamByName('RESPONSAVEL').AsString := Self.Responsavel;
    dm.qryCRUD.ParamByName('FANTASIA').AsString := Self.Fantasia;
    dm.qryCRUD.ParamByName('FUNCAO').AsInteger := Self.Funcao;
    dm.qryCRUD.ParamByName('TIPODOC').AsString := Self.TipoDoc;
    dm.qryCRUD.ParamByName('CPF').AsString := Self.CPF;
    dm.qryCRUD.ParamByName('CNPJ').AsString := Self.CNPJ;
    dm.qryCRUD.ParamByName('RG').AsString := Self.RG;
    dm.qryCRUD.ParamByName('IE').AsString := Self.IE;
    dm.qryCRUD.ParamByName('IEST').AsString := Self.IEST;
    dm.qryCRUD.ParamByName('IM').AsString := Self.IM;
    dm.qryCRUD.ParamByName('EXPEDIDOR').AsString := Self.Expedidor;
    dm.qryCRUD.ParamByName('UFEXPEDIDOR').AsString := Self.UFRG;
    dm.qryCRUD.ParamByName('EMISSAO').AsDate := Self.DataRG;
    dm.qryCRUD.ParamByName('NASCIMENTO').AsDateTime := Self.Nascimento;
    dm.qryCRUD.ParamByName('PAI').AsString := Self.Pai;
    dm.qryCRUD.ParamByName('MAE').AsString := Self.Mae;
    dm.qryCRUD.ParamByName('NATURALIDADE').AsString := Self.Naturalidade;
    dm.qryCRUD.ParamByName('UFNATURALIDADE').AsString := Self.UFNaturalidade;
    dm.qryCRUD.ParamByName('SUFRAMA').AsString := Self.SUFRAMA;
    dm.qryCRUD.ParamByName('CNH').AsString := Self.CNH;
    dm.qryCRUD.ParamByName('CNAE').AsString := Self.CNAE;
    dm.qryCRUD.ParamByName('CRT').AsInteger := Self.CRT;
    dm.qryCRUD.ParamByName('REGISTROCNH').AsString := Self.RegistroCNH;
    dm.qryCRUD.ParamByName('UFCNH').AsString := Self.UFCNH;
    dm.qryCRUD.ParamByName('VALIDADE').AsDateTime := Self.ValidadeCNH;
    dm.qryCRUD.ParamByName('CATEGORIA').AsString := Self.CategoriaCNH;
    dm.qryCRUD.ParamByName('PRIMEIRACNH').AsDateTime := Self.PrimeiraCNH;
    dm.qryCRUD.ParamByName('PIS').AsString := Self.PIS;
    dm.qryCRUD.ParamByName('CTPS').AsString := Self.CTPS;
    dm.qryCRUD.ParamByName('SERIECTPS').AsString := Self.SerieCTPS;
    dm.qryCRUD.ParamByName('UFCTPS').AsString := Self.UFCTPS;
    dm.qryCRUD.ParamByName('ESTADOCIVIL').AsString := Self.EstadoCivil;
    dm.qryCRUD.ParamByName('TITULO').AsString := Self.TituloEleitor;
    dm.qryCRUD.ParamByName('RESERVISTA').AsString := Self.Reservista;
    dm.qryCRUD.ParamByName('FORMACREDITO').AsString := Self.FormaCredito;
    dm.qryCRUD.ParamByName('TIPOCONTA').AsString := Self.TipoConta;
    dm.qryCRUD.ParamByName('BANCO').AsString := Self.Banco;
    dm.qryCRUD.ParamByName('AGENCIA').AsString := Self.Agencia;
    dm.qryCRUD.ParamByName('CONTA').AsString := Self.Conta;
    dm.qryCRUD.ParamByName('FAVORECIDO').AsString := Self.Favorecido;
    dm.qryCRUD.ParamByName('CPFFAVORECIDO').AsString := Self.CPFFavorecido;
    dm.qryCRUD.ParamByName('DATACADASTRO').AsDateTime := Self.DataCadastro;
    dm.qryCRUD.ParamByName('USUARIO').AsInteger := Self.Usuario;
    dm.qryCRUD.ParamByName('ROTEIRO').AsInteger := Self.Roteiro;
    dm.qryCRUD.ParamByName('STATUSGR').AsInteger := Self.StatusGR;
    dm.qryCRUD.ParamByName('STATUSCADASTRO').AsInteger := Self.StatusCadastro;
    dm.ZConn.PingServer;
    dm.qryCRUD.ExecSQL;
    dm.qryCRUD.Close;
    dm.qryCRUD.SQL.Clear;
    Result := True;
  except on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' + E.Message);
  end;
end;

function TCadastro.getField(sCampo: String; sColuna: String): String;
begin
  try
    Result := '';
    if sCampo.IsEmpty then
    begin
      Exit;
    end;
    if sColuna.IsEmpty then
    begin
      Exit;
    end;
    if (not conexao.VerifyConnZEOS(0)) then begin
      MessageDlg('Erro ao estabelecer conexão ao banco de dados!', mtError, [mbCancel], 0);
      Exit;
    end;
    dm.qryFields.Close;
    dm.qryFields.SQL.Clear;
    dm.qryFields.SQL.Add('SELECT ' + sCampo + ' FROM ' + TABLENAME);
    if sColuna = 'CADASTRO' then begin
      dm.qryfields.SQL.Add(' WHERE COD_CADASTRO = :CODIGO');
      dm.qryfields.ParamByName('CADASTRO').AsInteger := Self.Codigo;
    end
    else if sColuna = 'CNPJ' then begin
      dm.qryfields.SQL.Add(' WHERE NUM_CNPJ = :CNPJ');
      dm.qryfields.ParamByName('CNPJ').AsString := Self.CNPJ;
    end
    else if sColuna = 'CPF' then begin
      dm.qryfields.SQL.Add(' WHERE NUM_CPF = :CPF');
      dm.qryfields.ParamByName('CPF').AsString := Self.CPF;
    end
    else if sColuna = 'RG' then begin
      dm.qryfields.SQL.Add(' WHERE NUM_RG = :RG');
      dm.qryfields.ParamByName('RG').AsString := Self.RG;
    end
    else if sColuna = 'IE' then begin
      dm.qryfields.SQL.Add(' WHERE NUM_IE = :IE');
      dm.qryfields.ParamByName('IE').AsString := Self.RG;
    end
    else if sColuna = 'PIS' then begin
      dm.qryfields.SQL.Add(' WHERE NUM_PIS = :PIS');
      dm.qryfields.ParamByName('PIS').AsString := Self.PIS;
    end
    else if sColuna = 'CTPS' then begin
      dm.qryfields.SQL.Add(' WHERE NUM_CTPS = :CTPS');
      dm.qryfields.ParamByName('CTPS').AsString := Self.CTPS;
    end
    else if sColuna = 'CNH' then begin
      dm.qryfields.SQL.Add(' WHERE NUM_REGISTRO_CNH = :CNH');
      dm.qryfields.ParamByName('CNH').AsString := Self.RegistroCNH;
    end;
    dm.ZConn.PingServer;
    dm.qryFields.Open;
    if (not dm.qryFields.IsEmpty) then
    begin
      dm.qryFields.First;
      Result := dm.qryFields.FieldByName(sCampo).AsString;
    end;
    dm.qryFields.Close;
    dm.qryFields.SQL.Clear;
  except on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' + E.Message);
  end;
end;

end.
