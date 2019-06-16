unit clConexao;

{
  Definição da Classe Conexão
  Possui Rotinas de Verifição e Estabeleciomento de Conexção com o Banco de Dados
  Autor: Celso Mutti (celsomutti@gmail.com.br)
  versão: 1.0
}

interface

uses
  clUtil, System.SysUtils, System.Classes, Vcl.Dialogs, Vcl.Forms;

type
  TConexao = Class(TObject)
  private
  protected
  public
    class function SetupConnFromIniZEOS(iId: Integer): Boolean;
    class function VerifyConnZEOS(iId: Integer): Boolean;
    class function CreateUserMySQL(sUsuario: string; sSenha: string): Boolean;
  end;

implementation

uses udm, uGlobais, Global.Parametros;

class function TConexao.SetupConnFromIniZEOS(iId: Integer): Boolean;
var
  iKey : Integer;
begin
  try
    Result := False;
    iKey := 0;
    dm.ZConn.Port := StrToInt(TUtil.LeIni(uGlobais.sIni, 'Database', 'Port'));
    dm.ZConn.Catalog := TUtil.LeIni(uGlobais.sIni, 'Database', 'Catalog');
    dm.ZConn.Database := TUtil.LeIni(uGlobais.sIni, 'Database', 'Database');
    dm.ZConn.HostName := TUtil.LeIni(uGlobais.sIni, 'Database', 'HostName');
    dm.ZConn.Protocol := TUtil.LeIni(uGlobais.sIni, 'Database', 'Protocol');
    iKey := StrToInt(TUtil.LeIni(uGlobais.sIni, 'Database', 'KBD'));
    {if dm.ZConn.HostName = 'localhost' then
    begin
      dm.ZConn.User := 'root';
      dm.ZConn.Password := 'rjsmart01';
    end
    else
    begin
      dm.ZConn.User := 'usersisgef';
      dm.ZConn.Password := 'al0c@rioca';
    end;}
    dm.ZConn.User := TUTil.DesCriptografa(TUtil.LeIni(uGlobais.sIni, 'Database', 'UBD'), iKey);
    dm.ZConn.Password := TUTil.DesCriptografa(TUtil.LeIni(uGlobais.sIni, 'Database', 'PBD'), iKey);
    uGlobais.pDriverID := 'MySQL';
    uGlobais.pServer := dm.ZConn.HostName;
    uGlobais.pDatabase := dm.ZConn.Database;
    uGlobais.pPort := IntToStr(dm.ZConn.Port);
    uGlobais.pUser_name := dm.ZConn.User;
    uGlobais.pPassword := dm.ZConn.Password;
    Result := True;
  Except
    on E: Exception do
    begin
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

class function TConexao.VerifyConnZEOS(iId: Integer): Boolean;
begin
  try
    Result := False;
    {if iId = 0 then
    begin}
      if dm.ZConn.Connected then
      begin
        Result := True;
        Exit;
      end;
      if (not dm.ZConn.Connected) then
      begin
        if (not FileExists(uGlobais.sIni)) then
        begin
          MessageDlg
            ('Arquivo de parâmetros de conexão com o Banco de Dados inexistente!',
            mtError, [mbCancel], 0);
          Exit;
        end;
        if (not SetupConnFromIniZEOS(iId)) then
        begin
          MessageDlg
            ('Erro ao carregar os parâmetros de conexão com o Banco de Dados!',
            mtError, [mbCancel], 0);
          Exit;
        end;
        dm.ZConn.Connect;
      end;
      if (not dm.ZConn.Connected) then
      begin
        MessageDlg('Erro na conexção ao banco de dados!', mtError,
          [mbCancel], 0);
      end;
    {end
    else if iId = 1 then
    begin
      if dm.ZConn1.Connected then
      begin
        dm.ZConn1.Disconnect;
      end;
      if (not dm.ZConn1.Connected) then
      begin
        if (not FileExists(uGlobais.sIni)) then
        begin
          MessageDlg
            ('Arquivo de parâmetros de conexão com o Banco de Dados inexistente!',
            mtError, [mbCancel], 0);
          Exit;
        end;
        if (not SetupConnFromIniZEOS(iId)) then
        begin
          MessageDlg
            ('Erro ao carregar os parâmetros de conexão com o Banco de Dados!',
            mtError, [mbCancel], 0);
          Exit;
        end;
        dm.ZConn1.Connect;
      end;
      if (not dm.ZConn1.Connected) then
      begin
        MessageDlg('Erro na conexção ao banco de dados!', mtError,
          [mbCancel], 0);
      end;
    end;}
    Result := True;
  Except
    on E: Exception do
    begin
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
    end;
  end;
end;

class function TConexao.CreateUserMySQL(sUsuario: string;
  sSenha: string): Boolean;
var
  sMess: String;
begin
  try
    Result := False;
    sMess := '';
    dm.qryCRUD.Close;
    dm.qryCRUD.SQL.Clear;
    dm.qryCRUD.SQL.Text := 'CREATE USER ' + QuotedStr(sUsuario) + '@' +
      dm.ZConn.HostName + ' IDENTIFIED BY ' + QuotedStr(sSenha) + ';';
    dm.ZConn.Ping;
    dm.qryCRUD.ExecSQL;
    sMess := 'Usuário Criado no Banco de Dados!';
    dm.qryCRUD.Close;
    dm.qryCRUD.SQL.Clear;
    dm.qryCRUD.SQL.Text := 'GRANT ALL PRIVILEGES ON *.* TO ' +
      QuotedStr(sUsuario) + '@' + dm.ZConn.HostName + 'WITH GRANT OPTION;';
    dm.ZConn.PingServer;
    dm.qryCRUD.ExecSQL;
    MessageDlg('Usuários e Senha criados no Banco de Dados!', mtInformation,
      [mbOK], 0);
    Result := True;
  except
    on E: Exception do
    begin
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' + sMess +
        E.Message);
    end;
  end;
end;

end.
