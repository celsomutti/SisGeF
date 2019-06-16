unit clEnvioEMail;

interface

uses IdSMTP, IdMessage, IdText, IdAttachmentFile, IdSSLOpenSSL,
  IdExplicitTLSClientServerBase, IdIOHandler, SysUtils, Classes,
  dialogs;

type
  TEnviarEmail = class(TObject)
  private
  protected
    { protected declarations }
  public
    { public declarations }
    function EnviarEmail(Dominio, Porta, Usuario, Senha, DeNome, DeEmail, Para,
      Assunto, Corpo, CC: String; CorpoMIME, AnexoMIME: Integer;
      AutoResposta: Boolean; Anexo: TStrings): Boolean;
    function EmailTipoMIME(TipoMIME: Integer): String;
  published
    { published declarations }
  end;

implementation

{ TEnviarEmail }

uses
  clUtil;

// ————————————————–
// Enviar E-mail via SMTP.
// ————————————————–
function TEnviarEmail.EnviarEmail(Dominio, Porta, Usuario, Senha, DeNome,
  DeEmail, Para, Assunto, Corpo, CC: String; CorpoMIME, AnexoMIME: Integer;
  AutoResposta: Boolean; Anexo: TStrings): Boolean;
var
  i: Integer;
  IdSMTP1: TIdSMTP;
  IdMessage: TIdMessage;
  IdCorpo: TIdText;
  IdAnexo: TIdAttachmentFile;
  IdSSL: TIdSSLIOHandlerSocketOpenSSL;
begin
  try
    IdMessage := TIdMessage.Create(nil);
    try
      // ——————————————————————————-
      // Cria a Estrutura da Mensagem:
      // ——————————————————————————-

      IdMessage.Clear;
      IdMessage.IsEncoded := True;
      IdMessage.AttachmentEncoding := 'MIME';
      IdMessage.Encoding := meMIME; // meDefault;
      IdMessage.ConvertPreamble := True;
      IdMessage.Priority := mpNormal;
      IdMessage.ContentType := 'multipart/mixed'; // obrigatoriamente!
      IdMessage.CharSet := 'ISO-8859-1';
      IdMessage.Date := Now;

      // ——————————————————————————-
      // Define o Remetente e Destinatário:
      // ——————————————————————————-

      IdMessage.From.Address := DeEmail; // ou ‘[EMAIL PROTECTED]‘
      IdMessage.From.Text := DeNome + '';
      if (not TUtil.Empty(CC)) then
      begin
        IdMessage.CCList.EMailAddresses := CC;
      end;
      // IdMessage.BccList.EMailAddresses    := lista de com cópia oculta
      IdMessage.ReplyTo.EMailAddresses := DeEmail;
      IdMessage.Recipients.EMailAddresses := Trim(Para);
      if AutoResposta then
        IdMessage.ReceiptRecipient.Text := DeEmail;
      // auto-resposta (confirmação de leitura!)
      IdMessage.Subject := Trim(Assunto);

      // ——————————————————————————-
      // Adiciona o CORPO da Mensagem:
      // ——————————————————————————-

      IdCorpo := TIdText.Create(IdMessage.MessageParts, nil);
      IdCorpo.ContentType := EmailTipoMIME(CorpoMIME);
      IdCorpo.ContentDescription := 'multipart-1';
      IdCorpo.CharSet := 'ISO-8859-1'; // NOSSA LINGUAGEM PT-BR (Latin-1)!!!!
      IdCorpo.ContentTransfer := '16bit';
      // para SAIR ACENTUADO !!!! Pois, 8bit SAI SEM ACENTO !!!!
      IdCorpo.ContentDescription := 'Corpo da Mensagem';
      IdCorpo.Body.Clear;
      IdCorpo.Body.Add(Corpo);
      // ——————————————————————————-
      // Define o ANEXO: (pode haver looping para vários anexos)
      // ——————————————————————————-
      for i := 0 to Pred(Anexo.Count) do
      begin
        if FileExists(Anexo.Strings[i]) then
        begin
          try
            IdAnexo := TIdAttachmentFile.Create(IdMessage.MessageParts,
              Anexo.Strings[i]);
            IdAnexo.ContentType := EmailTipoMIME(AnexoMIME) + '; ' + 'name=' +
              ExtractFileName(Anexo.Strings[i]);
            IdAnexo.ContentDescription := 'Arquivo Anexo: ' +
              ExtractFileName(Anexo.Strings[i]);
          except
          end;
        end;
      end;
      //
      IdSMTP1 := TIdSMTP.Create(nil);
      // ——————————————————————————-
      // Se a porta for diferente de 25 então abre o SSL para autenticação segura!
      // ——————————————————————————-
      // Gmail e Globo usam a porta 465 (smtp) e 995 (pop3) com SSL!!!
      // Hotmail usam a porta 25 (smpt.live.com) e 995 (pop3.live.com) sem SSL!
      // Bol usa a porta 25 (smtp.bol.com.br) e 110 (pop3.bol.com.br) sem SSL!
      // ——————————————————————————-
      if Porta <> '587' then
      // ( Se Porta DIFERENTE de ’25’… o sinal de diferente está sumido aqui)
      begin
        With IdSMTP1 Do
          try
            IdSSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
            IdSMTP1.IOHandler := IdSSL;
            UseTLS := utUseImplicitTLS;
          except
            on E: Exception do
            begin
              IOHandler := TIdIOHandler.MakeDefaultIOHandler(nil);
              UseTLS := utNoTLSSupport;
              ShowMessage('SSL da Autenticação Segura Falhou.' + #13 + '' + #13
                + 'Pode ser uma instabilidade temporária na ' + #13 +
                'conexão de sua Internet.' + #13 + '' + #13 +
                'Tente de novo agora ou mais tarde.');
              result := False;
            end;
          end;
        IdSSL.SSLOptions.Method := sslvSSLv2;
        IdSSL.SSLOptions.Mode := sslmClient;
      end;

      With IdSMTP1 Do
        try
          AuthType := satDefault;
          ReadTimeout := 10000; // Leitura da Conexão em 10 segundos!
          Host := Dominio; // ‘smtp.dominio.com.br';
          Port := StrToInt(Porta); // padrão seria 25 ou autenticada 465;
          UserName := Usuario; // ‘usuario';
          Password := Senha; // ‘senha';

          try
            Connect;
            Authenticate;
          except
            on E: Exception do
            begin
              ShowMessage('Autenticação Falhou.' + #13 + '' + #13 +
                'Verifique seu Nome de Usuário e Senha ou ' + #13 +
                'Tente de novo agora ou mais tarde.');
              result := False;
            end;
          end;

          if Connected then
          begin
            Send(IdMessage);
            result := True;
          end
          else
          begin
            raise Exception.Create('A conexão com o Provedor foi interrompida.'
              + #13 + '' + #13 + 'Verifique se a sua Internet está ativa.');
            result := False;
          end;
        finally
          Disconnect;
        end;
    except
      result := False;
    end;
  finally
    FreeAndNil(IdMessage);
    FreeAndNil(IdSMTP1);
  end;
end;

// ———————————————————-
// Função que Retorna o Tipo MIME para Cabeçalho do Email:
// ———————————————————-
function TEnviarEmail.EmailTipoMIME(TipoMIME: Integer): String;
begin
  case TipoMIME of
    0:
      result := 'text/plain';
    1:
      result := 'text/html';
    2:
      result := 'text/richtext';
    3:
      result := 'text/x-aiff';
    4:
      result := 'audio/basic';
    5:
      result := 'audio/wav';
    6:
      result := 'image/gif';
    7:
      result := 'image/jpeg';
    8:
      result := 'image/pjpeg';
    9:
      result := 'image/tiff';
    10:
      result := 'image/x-png';
    11:
      result := 'image/x-xbitmap';
    12:
      result := 'image/bmp';
    13:
      result := 'image/x-jg';
    14:
      result := 'image/x-emf';
    15:
      result := 'image/x-wmf';
    16:
      result := 'video/avi';
    17:
      result := 'video/mpeg';
    18:
      result := 'application/postscript';
    19:
      result := 'application/base64';
    20:
      result := 'application/macbinhex40';
    21:
      result := 'application/pdf'; // arquivos PDF !!!
    22:
      result := 'application/x-compressed';
    23:
      result := 'application/x-zip-compressed';
    24:
      result := 'application/x-gzip-compressed';
    25:
      result := 'application/java';
    26:
      result := 'application/x-msdownload';
    27:
      result := 'application/octet-stream'; // arquivos .dat !!!!
    28:
      result := 'multipart/mixed';
    29:
      result := 'multipart/relative';
    30:
      result := 'multipart/digest';
    31:
      result := 'multipart/alternative';
    32:
      result := 'multipart/related';
    33:
      result := 'multipart/report';
    34:
      result := 'multipart/signed';
    35:
      result := 'multipart/encrypted';
  end;
end;

end.
