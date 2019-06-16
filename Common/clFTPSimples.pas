unit clFTPSimples;

interface

uses
  IdFTP, IdFTPCommon,System.Classes, Vcl.Dialogs, Vcl.Forms, System.SysUtils;

type
  TFTPSimples = Class(TObject)
  private
    function getFileFrom: String;
    function getFileTo: String;
    function getHost: String;
    function getPassword: String;
    function getUsername: String;
	function getFolder: String;
    procedure setFileFrom(const Value: String);
    procedure setFileTo(const Value: String);
    procedure setHost(const Value: String);
    procedure setPassword(const Value: String);
    procedure setUsername(const Value: String);
	procedure setFolder(const Value: String);
    function getPort: Integer;
    procedure setPort(const Value: Integer);
  protected
    _host: String;
    _username: String;
    _password: String;
    _filefrom: String;
    _fileto: String;
    _port: Integer;
	_folder: String;
  public
    property Servidor: String read getHost write setHost;
    property Usuario: String read getUsername write setUsername;
    property Senha: String read getPassword write setPassword;
    property Origem: String read getFileFrom write setFileFrom;
    property Destino: String read getFileTo write setFileTo;
    property Porta: Integer read getPort write setPort;
    
    procedure FTPSend(sDir: String);
    procedure FTPGet(sDir: String);
    function FTPList(sDir: String): TStringList;
    procedure FTPDelete(sDir: String);
  end;

const
  PASTA = '/rjsmart.com.br/web/Docs';

implementation

{ TFTPSimples }

procedure TFTPSimples.FTPGet(sDir: String);
var
  ftpDownStream: TFileStream;
  ftp: TIdFTP;
  ms: TMemoryStream;
begin
  ftpDownStream := TFileStream.Create(Self.Destino, fmCreate);
  ftp := TIdFTP.Create(Application);
  ms := TMemoryStream.Create;
  try
    try
      ftp.AUTHCmd := tAuto;
      ftp.Passive := True;
      ftp.ReadTimeout := 120 * 1000;
      ftp.ListenTimeout := 120 * 1000;
      ftp.host := Self.Servidor; // Endereço do servidor FTP
      ftp.port := Self.Porta;
      ftp.username := Self.Usuario;
      ftp.password := Self.Senha;
      ftp.TransferType := ftBinary;
      ftp.Connect();
      AssErt(ftp.Connected);
      ftp.List;
      ftp.ChangeDir(PASTA + '/' + sDir); // Definir a pasta no servidor
      ftp.Get(Self.Origem, ftpDownStream, True);
      // Receber o arquivo do servidor
      MessageDlg('Arquivo Recebido.', mtInformation, [mbOK], 0);
      ftp.Disconnect;
    finally
      ms.Free;
      ftp.Free;
      ftpDownStream.Free;
    end;
  except
    MessageDlg('Uma tentativa de receber um arquivo do servidor com falha!',
      mtError, [mbOK], 0);
  end;
end;

procedure TFTPSimples.FTPSend(sDir: String);
var
  ftpUpStream: TFileStream;
  ftp: TIdFTP;
  ms: TMemoryStream;
  i: Integer;
  bExiste: Boolean;
  Lista: TStringList;
begin
  ftpUpStream := TFileStream.Create(Self.Origem, fmOpenRead);
  ftp := TIdFTP.Create(Application);
  ms := TMemoryStream.Create;
  bExiste := False;
  try
    try
      Lista := TStringList.Create;
      ftp.AUTHCmd := tAuto;
      ftp.Passive := True;
      ftp.ReadTimeout := 120 * 1000;
      ftp.ListenTimeout := 120 * 1000;
      ftp.host := Self.Servidor; // Endereço do servidor FTP
      ftp.port := Self.Porta;
      ftp.username := Self.Usuario; // Parametro nome usuario servidor FTP
      ftp.password := Self.Senha; // Parametro senha servidor FTP
      ftp.TransferType := ftBinary;
      ftp.Connect();
      AssErt(ftp.Connected);
      ftp.ChangeDir(PASTA);
      ftp.List(Lista, PASTA, False);
      for i := 0 to Lista.Count - 1 do
      begin
        if Lista[i] = (sDir) then
        begin
          bExiste := True;
        end;
      end;
      if not bExiste then
      begin
        ftp.MakeDir(PASTA + '/' + sDir);
      end;
      ftp.ChangeDir(PASTA + '/' + sDir); // Definir a pasta no servidor
      ftp.Put(ftpUpStream, PASTA + '/' + sDir + '/' + Self.Destino, False);
      // Transferir o arquivo para o servidor
      MessageDlg('Transferido.', mtInformation, [mbOK], 0);
      ftp.Disconnect;
    finally
      ftpUpStream.Free;
      ms.Free;
      ftp.Free;
    end;
  except
    MessageDlg('Uma tentativa de enviar um arquivo para o servidor falhou!',
      mtError, [mbOK], 0);
  end;
end;

function TFTPSimples.FTPList(sDir: String): TStringList;
var
  Lista: TStringList;
  ftp: TIdFTP;
  bExiste: Boolean;
  sCompara: String;
  i: Integer;
begin
  Lista := TStringList.Create;
  ftp := TIdFTP.Create(Application);
  bExiste := False;
  try
    try
      ftp.AUTHCmd := tAuto;
      ftp.Passive := True;
      ftp.host := Self.Servidor; // Endereço do servidor FTP
      ftp.port := Self.Porta;
      ftp.username := Self.Usuario; // Parametro nome usuario servidor FTP
      ftp.password := Self.Senha; // Parametro senha servidor FTP
      ftp.Connect();
      AssErt(ftp.Connected);
      ftp.List(Lista, PASTA, False);
      for i := 0 to Lista.Count - 1 do
      begin
        if Lista[i] = (sDir) then
        begin
          bExiste := True;
        end;
      end;
      if bExiste then
      begin
        ftp.ChangeDir(PASTA + '/' + sDir); // Definir a pasta no servidor
        ftp.List(Lista, PASTA + '/' + sDir + '/*.*', False);
        ftp.Disconnect;
      end
      else
      begin
        Lista.Free;
      end;
    finally
      ftp.Free;
    end;
  except
    MessageDlg('Uma tentativa de listar os documentos do servidor falhou!',
      mtError, [mbOK], 0);
  end;
  Result := Lista;
end;

procedure TFTPSimples.FTPDelete(sDir: String);
var
  ftp: TIdFTP;
  ms: TMemoryStream;
begin
  ftp := TIdFTP.Create(Application);
  ms := TMemoryStream.Create;
  try
    try
      ftp.AUTHCmd := tAuto;
      ftp.Passive := True;
      ftp.ReadTimeout := 120 * 1000;
      ftp.ListenTimeout := 120 * 1000;
      ftp.host := Self.Servidor; // Endereço do servidor FTP
      ftp.port := Self.Porta;
      ftp.username := Self.Usuario; // Parametro nome usuario servidor FTP
      ftp.password := Self.Senha; // Parametro senha servidor FTP
      ftp.Connect();
      AssErt(ftp.Connected);
      ftp.ChangeDir(PASTA + '/' + sDir); // Definir a pasta no servidor
      ftp.Delete(Self.Origem); // Exluir o arquivo do servidor
      MessageDlg('Arquivo Excluído.', mtInformation, [mbOK], 0);
      ftp.Disconnect;
    finally
      ms.Free;
      ftp.Free;
    end;
  except
    MessageDlg('Uma tentativa de excluir um arquivo do servidor falhou!',
      mtError, [mbOK], 0);
  end;
end;

function TFTPSimples.getFileFrom: String;
begin
  Result := _filefrom;
end;

function TFTPSimples.getFileTo: String;
begin
  Result := _fileto;
end;

function TFTPSimples.getHost: String;
begin
  Result := _host;
end;

function TFTPSimples.getPassword: String;
begin
  Result := _password;
end;

function TFTPSimples.getPort: Integer;
begin
  Result := _port;
end;

function TFTPSimples.getUsername: String;
begin
  Result := _username;
end;

procedure TFTPSimples.setFileFrom(const Value: String);
begin
  _filefrom := Value;
end;

procedure TFTPSimples.setFileTo(const Value: String);
begin
  _fileto := Value;
end;

procedure TFTPSimples.setHost(const Value: String);
begin
  _host := Value;
end;

procedure TFTPSimples.setPassword(const Value: String);
begin
  _password := Value;
end;

procedure TFTPSimples.setPort(const Value: Integer);
begin
  _port := Value;
end;

procedure TFTPSimples.setUsername(const Value: String);
begin
  _username := Value;
end;

end.
