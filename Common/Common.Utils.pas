unit Common.Utils;

{
  Definicao da Classe Common.Utils
  Contem rotinas gerais para os modulos

  @autor  Ryan Bruno C Padilha (ryan.padilha@gmail.com)
  @version 0.1 (02/01/2010)

}

interface

uses Forms, Dialogs, SysUtils, StrUtils, Windows, FileCtrl, IniFiles, Classes, ShellAPI, System.DateUtils;

type
  TUtils = class(TObject)

  private
  protected
  public
    class procedure Atualiza_Versao_Aplicacao;
    class function Empty(texto: String): Boolean;
    class function NotEmpty(texto: String): Boolean;
    class function Sysdate(): String;
    class function CPF(num: String): Boolean;
    class function CNPJ(num: String): Boolean;
    class function SoNumero(kKey: Char): Char;
    class function ReplaceStr(const S, Srch, Replace: String): String;
    class function Sistema(sInfo: String): String;
    class function LeIni(sFile: String; sSecao: String; sChave: String): String;
    class function GravaIni(sFile: String; sSecao: String; sChave: String; sValor: String): Boolean;
    class function CriarIni(sFile: string): Boolean;
    class function FormataCPF(const CPF: String): String;
    class function FormataCNPJ(const CNPJ: String): String;
    class function ValidaEMail(const EMailIn: PChar): Boolean;
    class function NumeroDeLinhasTXT(lcPath: String): Integer;
    class function VersaoExe(): String;
    class function GetStringValue(AHandle: HMODULE; ATexto: String): String;
    class function GetBuildInfo(prog: String): String;
    class function DSiFileSize(const fileName: string): int64;
    class function ENumero(sValor: String): Boolean;
    class function DataOk(Dt: String): Boolean;
  end;

implementation

{ TUtils }

class function TUtils.Empty(texto: String): Boolean;
begin
  if (Length(Trim(texto)) = 0) OR (Trim(texto) = '  /  /') OR
    (Trim(texto) = '.   .   /    -') OR (Trim(texto) = '.   .   -') OR
    (Trim(texto) = '  :  :  ') OR (Trim(texto) = '  :') then
    Result := True
  else
    Result := False;
end;

class function TUtils.NotEmpty(texto: String): Boolean;
begin
  if Empty(texto) then
    Result := False
  else
    Result := True;
end;

class function TUtils.Sysdate: String;
begin
  Result := DateToStr(Date);
end;

class function TUtils.CPF(num: String): Boolean;
var
  n1, n2, n3, n4, n5, n6, n7, n8, n9: Integer;
  d1, d2: Integer;
  numero, digitado, calculado: string;
begin
  numero := ReplaceStr(num, '.', '');
  numero := ReplaceStr(numero, '-', '');
  numero := ReplaceStr(numero, ' ', '');
  numero := ReplaceStr(numero, '_', '');
  numero := ReplaceStr(numero, '/', '');
  num := numero;
  if not(ENumero(num)) then
  begin
    Result := False;
    Exit;
  end;
  if num = '' then
  begin
    Result := False;
    Exit;
  end;
  if num = '11111111111' then
  begin
    Result := False;
    Exit;
  end;
  if num = '22222222222' then
  begin
    Result := False;
    Exit;
  end;
  if num = '33333333333' then
  begin
    Result := False;
    Exit;
  end;
  if num = '44444444444' then
  begin
    Result := False;
    Exit;
  end;
  if num = '55555555555' then
  begin
    Result := False;
    Exit;
  end;
  if num = '66666666666' then
  begin
    Result := False;
    Exit;
  end;
  if num = '77777777777' then
  begin
    Result := False;
    Exit;
  end;
  if num = '88888888888' then
  begin
    Result := False;
    Exit;
  end;
  if num = '99999999999' then
  begin
    Result := False;
    Exit;
  end;
  n1 := StrToInt(num[1]);
  n2 := StrToInt(num[2]);
  n3 := StrToInt(num[3]);
  n4 := StrToInt(num[4]);
  n5 := StrToInt(num[5]);
  n6 := StrToInt(num[6]);
  n7 := StrToInt(num[7]);
  n8 := StrToInt(num[8]);
  n9 := StrToInt(num[9]);
  d1 := n9 * 2 + n8 * 3 + n7 * 4 + n6 * 5 + n5 * 6 + n4 * 7 + n3 * 8 + n2 *
    9 + n1 * 10;
  d1 := 11 - (d1 mod 11);
  if d1 >= 10 then
    d1 := 0;
  d2 := d1 * 2 + n9 * 3 + n8 * 4 + n7 * 5 + n6 * 6 + n5 * 7 + n4 * 8 + n3 * 9 +
    n2 * 10 + n1 * 11;
  d2 := 11 - (d2 mod 11);
  if d2 >= 10 then
    d2 := 0;
  calculado := inttostr(d1) + inttostr(d2);
  digitado := num[10] + num[11];
  if calculado = digitado then
    Result := True
  else
    Result := False;
end;

class function TUtils.CNPJ(num: String): Boolean;
var
  n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12: Integer;
  d1, d2: Integer;
  numero, digitado, calculado: string;
begin
  numero := ReplaceStr(num, '.', '');
  numero := ReplaceStr(numero, '-', '');
  numero := ReplaceStr(numero, '/', '');
  numero := ReplaceStr(numero, ' ', '');
  numero := ReplaceStr(numero, '_', '');
  num := numero;
  if not(ENumero(num)) then
  begin
    Result := False;
    Exit;
  end;
  if num = '' then
  begin
    Result := False;
    Exit;
  end;
  if num = '11111111111111' then
  begin
    Result := False;
    Exit;
  end;
  if num = '22222222222222' then
  begin
    Result := False;
    Exit;
  end;
  if num = '33333333333333' then
  begin
    Result := False;
    Exit;
  end;
  if num = '44444444444444' then
  begin
    Result := False;
    Exit;
  end;
  if num = '55555555555555' then
  begin
    Result := False;
    Exit;
  end;
  if num = '66666666666666' then
  begin
    Result := False;
    Exit;
  end;
  if num = '77777777777777' then
  begin
    Result := False;
    Exit;
  end;
  if num = '88888888888888' then
  begin
    Result := False;
    Exit;
  end;
  if num = '99999999999999' then
  begin
    Result := False;
    Exit;
  end;
  n1 := StrToInt(num[1]);
  n2 := StrToInt(num[2]);
  n3 := StrToInt(num[3]);
  n4 := StrToInt(num[4]);
  n5 := StrToInt(num[5]);
  n6 := StrToInt(num[6]);
  n7 := StrToInt(num[7]);
  n8 := StrToInt(num[8]);
  n9 := StrToInt(num[9]);
  n10 := StrToInt(num[10]);
  n11 := StrToInt(num[11]);
  n12 := StrToInt(num[12]);
  d1 := n12 * 2 + n11 * 3 + n10 * 4 + n9 * 5 + n8 * 6 + n7 * 7 + n6 * 8 + n5 * 9
    + n4 * 2 + n3 * 3 + n2 * 4 + n1 * 5;
  d1 := 11 - (d1 mod 11);
  if d1 >= 10 then
    d1 := 0;
  d2 := d1 * 2 + n12 * 3 + n11 * 4 + n10 * 5 + n9 * 6 + n8 * 7 + n7 * 8 + n6 * 9
    + n5 * 2 + n4 * 3 + n3 * 4 + n2 * 5 + n1 * 6;
  d2 := 11 - (d2 mod 11);
  if d2 >= 10 then
    d2 := 0;
  calculado := inttostr(d1) + inttostr(d2);
  digitado := num[13] + num[14];
  if calculado = digitado then
    Result := True
  else
    Result := False;
end;

class function TUtils.ReplaceStr(const S, Srch, Replace: string): string;
var
  i: Integer;
  Source: string;
begin
  Source := S;
  Result := '';
  repeat
    i := Pos(Srch, Source);
    if i > 0 then
    begin
      Result := Result + Copy(Source, 1, i - 1) + Replace;
      Source := Copy(Source, i + Length(Srch), MaxInt);
    end
    else
      Result := Result + Source;
  until i <= 0;
end;

class function TUtils.SoNumero(kKey: Char): Char;
begin
  if not(kKey in ['0' .. '9', Chr(8)]) then
    Result := #0
  else
    Result := kKey;
end;

{
  Function:     Sistema
  Parâmetros:   variavel de informação
  Autor:        Celso Mutti - celso.mutti@hitech-ps.com.br
  Retorna:      valor encontrado
  Obs.:         função que retorna informações sobre a versão do aplicativo
}

class function TUtils.Sistema(sInfo: String): String;
Var
  Sizever: Integer;
  D: Dword;
  T: UINT;
  InfoVer: PChar;
  Ret, trn: Pointer;
  Iniver: String;
  sMess, sProg: string;
begin
  try
    sProg := Application.ExeName;
    Sizever := GetFileVersionInfoSize(PChar(paramstr(0)), D);
    if Sizever > 0 then
    begin
      GetMem(InfoVer, Sizever);
      GetFileVersionInfo(PChar(paramstr(0)), 0, Sizever, InfoVer);
      VerQueryValue(InfoVer, '\\VarFileInfo\\Translation', trn, T);
      Iniver := '\\StringFileInfo\\' + inttohex(loword(longint(trn^)), 4) +
        inttohex(hiword(longint(trn^)), 4) + '\\';
      if VerQueryValue(InfoVer, PChar(Iniver + sInfo), Ret, T) then
        if T > 0 then
          Result := String(PChar(Ret));
      FreeMem(InfoVer, Sizever);
    end;
  except
    on e: Exception do
    begin
      sMess := e.Message;
      MessageDlg(sMess, mtError, [mbOK], 0);
    end;
  end;
end;

class function TUtils.LeIni(sFile: String; sSecao: String;
  sChave: String): String;
var
  Ini: TIniFile;
  sMess: String;
Begin
  Result := '';
  Ini := TIniFile.Create(sFile);
  try
    Result := Ini.ReadString(sSecao, sChave, '');
    Ini.Free;
  except
    on e: Exception do
    begin
      sMess := e.Message;
      Ini.Free;
      MessageDlg(sMess, mtError, [mbOK], 0);
    end;
  end;
end;

class function TUtils.GravaIni(sFile: String; sSecao: String; sChave: String;
  sValor: String): Boolean;
var
  Ini: TIniFile;
  sMess: String;
begin
  Result := False;
  Ini := TIniFile.Create(sFile);
  try
    Ini.WriteString(sSecao, sChave, sValor);
    Result := True;
    Ini.Free;
  except
    on e: Exception do
    begin
      sMess := e.Message;
      Ini.Free;
      MessageDlg(sMess, mtError, [mbOK], 0);
    end;
  end;
end;

class function TUtils.CriarIni(sFile: string): Boolean;
var
  Ini: TIniFile;
  sMess: String;
begin
  Result := False;
  Ini := TIniFile.Create(sFile);
  try
    Ini.WriteString('Database', 'Catalog', '');
    Ini.WriteString('Database', 'Database', '.\Database\DBSGE2.FDB');
    Ini.WriteString('Database', 'HostName', '');
    Ini.WriteString('Database', 'Port', '0');
    Ini.WriteString('Database', 'Protocol', 'firebird-2.1');
    Ini.Free;
    Result := True;
  except
    on e: Exception do
    begin
      sMess := e.Message;
      Ini.Free;
      MessageDlg(sMess, mtError, [mbOK], 0);
    end;
  end;
end;

// Esta funcao informa Cpf neste formato: 999.999.999-99
class function TUtils.FormataCPF(const CPF: String): String;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to Length(CPF) do
  begin
    if CPF[i] in ['0' .. '9'] then
      Result := Result + CPF[i];
  end;
  if Length(Result) <> 11 then
    Exit
  else
    Result := Copy(Result, 1, 3) + '.' + Copy(Result, 4, 3) + '.' +
      Copy(Result, 7, 3) + '-' + Copy(Result, 10, 2);
end;

// Esta funcao informa CNPJ neste formato: 99.999.999/9999-99
class function TUtils.FormataCNPJ(const CNPJ: String): String;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to Length(CNPJ) do
  begin
    if CNPJ[i] in ['0' .. '9'] then
      Result := Result + CNPJ[i];
  end;
  if Length(Result) <> 14 then
    Exit
  else
    Result := Copy(Result, 1, 2) + '.' + Copy(Result, 3, 3) + '.' +
      Copy(Result, 6, 3) + '/' + Copy(Result, 9, 4) + '-' + Copy(Result, 13, 4);
end;

class function TUtils.ValidaEMail(const EMailIn: PChar): Boolean;
const
  CaraEsp: array [1 .. 40] of string[1] = ('!', '#', '$', '%', '¨', '&', '*',
    '(', ')', '+', '=', '§', '¬', '¢', '¹', '²', '³', '£', '´', '`', 'ç', 'Ç',
    ',', ';', ':', '<', '>', '~', '^', '?', '/', '', '|', '[', ']', '{', '}',
    'º', 'ª', '°');
var
  i, cont: Integer;
  EMail: ShortString;
begin
  EMail := EMailIn;
  Result := True;
  cont := 0;
  if EMail <> '' then
    if (Pos('@', EMail) <> 0) and (Pos('.', EMail) <> 0) then // existe @ .
    begin
      if (Pos('@', EMail) = 1) or (Pos('@', EMail) = Length(EMail)) or
        (Pos('.', EMail) = 1) or (Pos('.', EMail) = Length(EMail)) or
        (Pos(' ', EMail) <> 0) then
        Result := False
      else // @ seguido de . e vice-versa
        if (abs(Pos('@', EMail) - Pos('.', EMail)) = 1) then
          Result := False
        else
        begin
          for i := 1 to 40 do // se existe Caracter Especial
            if Pos(CaraEsp[i], EMail) <> 0 then
              Result := False;
          for i := 1 to Length(EMail) do
          begin // se existe apenas 1 @
            if EMail[i] = '@' then
              cont := cont + 1; // . seguidos de .
            if (EMail[i] = '.') and (EMail[i + 1] = '.') then
              Result := False;
          end;
          // . no f, 2ou+ @, . no i, - no i, _ no i
          if (cont >= 2) or (EMail[Length(EMail)] = '.') or (EMail[1] = '.') or
            (EMail[1] = '_') or (EMail[1] = '-') then
            Result := False;
          // @ seguido de COM e vice-versa
          if (abs(Pos('@', EMail) - Pos('com', EMail)) = 1) then
            Result := False;
          // @ seguido de - e vice-versa
          if (abs(Pos('@', EMail) - Pos('-', EMail)) = 1) then
            Result := False;
          // @ seguido de _ e vice-versa
          if (abs(Pos('@', EMail) - Pos('_', EMail)) = 1) then
            Result := False;
        end;
    end
    else
      Result := False;
end;

class function TUtils.NumeroDeLinhasTXT(lcPath: String): Integer;
Var
  aList: TStringList;
Begin
  Result := 0;
  // Verifico se o arquivo está onde foi passado pelo parâmetro
  if FileExists(lcPath) then
  Begin
    // Crio a lista que receberá o arquivo
    aList := TStringList.Create;
    Try
      // Carrego o arquivo para dentro da lista
      aList.LoadFromFile(lcPath);
      // Retorno o número de linhas que o arquivo contem
      Result := aList.Count;
    Finally
      // Destruo o objeto
      FreeAndNil(aList);
    End;
  End
  Else
  Begin
    // Caso eu não encontre o arquivo retorno 0.
    Result := 0;
  End;
End;

class function TUtils.GetBuildInfo(prog: String): String;
var
  VerInfoSize: Dword;
  VerInfo: Pointer;
  VerValueSize: Dword;
  VerValue: PVSFixedFileInfo;
  Dummy: Dword;
  V1, V2, V3, V4: Word;
begin
  VerInfoSize := GetFileVersionInfoSize(PChar(prog), Dummy);
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(prog), 0, VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '', Pointer(VerValue), VerValueSize);

  with VerValue^ do
  begin
    V1 := dwFileVersionMS shr 16;
    V2 := dwFileVersionMS and $FFFF;
    V3 := dwFileVersionLS shr 16;
    V4 := dwFileVersionLS and $FFFF;
  end;

  FreeMem(VerInfo, VerInfoSize);
  Result := Copy(inttostr(100 + V1), 3, 2) + '.' + Copy(inttostr(100 + V2), 3,
    2) + '.' + Copy(inttostr(100 + V3), 3, 2) + '.' +
    Copy(inttostr(100 + V4), 3, 2);
end;

// Retorna o tamanho de um arquivo em bytes
class function TUtils.DSiFileSize(const fileName: string): int64;
var
  fHandle: Dword;
begin
  fHandle := CreateFile(PChar(fileName), 0, 0, nil, OPEN_EXISTING,
    FILE_ATTRIBUTE_NORMAL, 0);
  if fHandle = INVALID_HANDLE_VALUE then
    Result := -1
  else
    try
      Int64Rec(Result).Lo := GetFileSize(fHandle, @Int64Rec(Result).Hi);
    finally
      CloseHandle(fHandle);
    end;
end;

class procedure TUtils.Atualiza_Versao_Aplicacao;
var
  versao_local, versao_servidor: string;
  tamanho_original, tamanho_recebido: Integer;
  local_arquivo_servidor, sMess: string;
  iArq: TIniFile;
begin
  try
    // Verifico onde esta armazenado o arquivo a ser atualizado
    if FileExists(GetCurrentDir + '\database.ini') then
    begin
      try
        iArq := TIniFile.Create(GetCurrentDir + '\database.ini');
        local_arquivo_servidor := iArq.ReadString('UPDATE', 'Local', '');
      finally
        iArq.Free;
      end;
    end;

    // Armazeno a versão da aplicação atualmente em uso
    versao_local := GetBuildInfo(Application.ExeName);

    // Armazeno a versão do aplicação que esta disponivel no servidor
    versao_servidor := GetBuildInfo(local_arquivo_servidor);

    // Comparo as versões
    if versao_local < versao_servidor then
    begin
      MessageDlg('Uma atualização do ' + Application.Title +
        'está disponível. Clique em OK para atualizar sua instalação.',
        mtInformation, [mbOK], 0);

      // Guardo na váriavel o tamanho do arquivo que esta no servidor
      tamanho_original := DSiFileSize(local_arquivo_servidor);

      // Copio a versão que esta no servidor para o computador atual
      CopyFile(PChar(local_arquivo_servidor),
        PChar(ExtractFilePath(Application.ExeName) +
        '\UpdateSisGef.NEW'), False);

      // Guardo na váriavel o tamanho do arquivo copiado
      tamanho_recebido := DSiFileSize(ExtractFilePath(Application.ExeName) +
        '\UpdateSisGef.NEW');

      // Verifico se o arquivo copiado chegou intacto
      if tamanho_original = tamanho_recebido then
      begin
        // Apago se existir versão antiga
        DeleteFile(PChar(ExtractFilePath(Application.ExeName) +
          '\UpdateSisGef.exe'));

        // Renomeio o arquivo atual
        // RenameFile(Application.ExeName, Application.ExeName + '_OLD');

        // Renomeio o arquivo novo para poder usa-lo
        RenameFile(ExtractFilePath(Application.ExeName) + '\UpdateSisGef.NEW',
          ExtractFilePath(Application.ExeName) + '\UpdateSisGef.exe');

        // Informo que a aplicação foi atualizado com sucesso
        ShowMessage('Aplicação atualizada com sucesso!');

        // Mando abrir a nova versão do teclado
        ShellExecute(0, Nil, PChar(ExtractFilePath(Application.ExeName) +
          '\UpdateSisGef.exe'), '', Nil, SW_SHOWNORMAL);

        // Fecho a aberta
        Application.Terminate;
        ExitProcess(0);
      end
      else
      begin
        // Caso o arquivo copiado não seja copiado com sucesso
        ShowMessage('Copia de arquivo falhou! Tente novamente!');
      end;
    end
    else
    begin
      // Se a aplicação já estiver atualizada
      // ShowMessage('Aplicativo já possui a ultima atualização disponível!');
    end;
  except
    on e: Exception do
    begin
      sMess := e.Message;
      iArq.Free;
      MessageDlg(sMess, mtError, [mbOK], 0);
    end;
  end;
end;

class function TUtils.ENumero(sValor: String): Boolean;
var
  i, iRet: Integer;
  D: Double;
begin
  Result := False;
  Val(sValor, i, iRet);
  if iRet <> 0 then
  begin
    Val(sValor, D, iRet);
    if iRet <> 0 then
    begin
      Exit;
    end;
  end;
  Result := True;
end;

{ ===============================
  Desenvolvida Por :  Ricardo S. Belardinuci
  e-mail :  ri-taqua@ig.com.br
  ===============================

  função verifica se a data é válida,
  inclusive se for ano bisexto ela valida o 29/02,
  caso contrário, ela retorna false; }

class function TUtils.DataOk(Dt: String): Boolean;
var
  Dia, Mes: Byte;
  Ano: Integer;
  function AnoBissesto(Year: Integer): Boolean;
  begin
    AnoBissesto := (Ano mod 4 = 0) and (Ano mod 100 <> 0) or (Ano Mod 400 = 0);
  end;

begin
  Result := False;
  if Length(Trim(Dt)) = 8 then
  begin
    Dia := StrToIntDef(Copy(Dt, 1, 2), 0);
    Mes := StrToIntDef(Copy(Dt, 4, 2), 0);
    Ano := StrToInt(Copy(Dt, 7, 2));
    if ((Mes in [1, 3, 5, 7, 8, 10, 12]) and (Dia in [1 .. 31])) or
      ((Mes in [4, 6, 9, 11]) and (Dia in [1 .. 30])) or
      ((Mes = 2) and (AnoBissesto(Ano)) and (Dia in [1 .. 29])) or
      ((Mes = 2) and (not AnoBissesto(Ano)) and (Dia in [1 .. 28])) then
      Result := True;
  end
  else if Length(Trim(Dt)) = 10 then
  begin
    Dia := StrToIntDef(Copy(Dt, 1, 2), 0);
    Mes := StrToIntDef(Copy(Dt, 4, 2), 0);
    Ano := StrToInt(Copy(Dt, 7, 4));
    if ((Mes in [1, 3, 5, 7, 8, 10, 12]) and (Dia in [1 .. 31])) or
      ((Mes in [4, 6, 9, 11]) and (Dia in [1 .. 30])) or
      ((Mes = 2) and (AnoBissesto(Ano)) and (Dia in [1 .. 29])) or
      ((Mes = 2) and (not AnoBissesto(Ano)) and (Dia in [1 .. 28])) then
      Result := True;
  end;

end;

{ ///////////////////////////////////////////////////////////////////////
  Observações:
  pode ser chamada no evento OnChange do componente que recebe a data
  notem também que existe uma função interna na função principal, é assim mesmo pessoal

  exemplo de chamada da função:

  procedure TFormAjustarEntrada.DataEditChange(Sender: TObject);
  begin
  if DataOk(EditData.Text) then
  Comando ...

  //Obs no lugar de um edit pode ser também um dbedit( aí é só passar no //parametro:     if DataOk(DBEditData.Text) then

  end;

  dúvidas mande e-mail.
  não esqueçam de avaliar, se não como vou saber se está sendo útil né?
  Falo pessoal!!!!!!

  /////////////////////////////////////////////////////////////////////// }

class Function TUtils.VersaoExe(): String;
type
  PFFI = ^vs_FixedFileInfo;
var
  F: PFFI;
  Handle: Dword;
  Len: longint;
  Data: PChar;
  Buffer: Pointer;
  Tamanho: Dword;
  Parquivo: PChar;
  Arquivo: String;
begin
  Arquivo := Application.ExeName;
  Parquivo := StrAlloc(Length(Arquivo) + 1);
  StrPcopy(Parquivo, Arquivo);
  Len := GetFileVersionInfoSize(Parquivo, Handle);
  Result := '';
  if Len > 0 then
  begin
    Data := StrAlloc(Len + 1);
    if GetFileVersionInfo(Parquivo, Handle, Len, Data) then
    begin
      VerQueryValue(Data, '', Buffer, Tamanho);
      F := PFFI(Buffer);
      Result := Format('%d.%d.%d.%d', [hiword(F^.dwFileVersionMS),
        loword(F^.dwFileVersionMS), hiword(F^.dwFileVersionLS),
        loword(F^.dwFileVersionLS)]);
    end;
    StrDispose(Data);
  end;
  StrDispose(Parquivo);
end;

class function TUtils.GetStringValue(AHandle: HMODULE; ATexto: String): String;
var
  lIgnore, lTamInfo: Dword;
  lBuffer: LPVOID;
  lInfo: PChar;
  lPath, lTrans: String;
  lModulo: array [0 .. MAX_PATH] of Char;
begin
  { Obtem o nome do executável, DLL ou pacote cujo handle foi informado no parâmetro }
  GetModuleFileName(AHandle, lModulo, sizeof(lModulo));

  { Calcula o tamanho que deve ter o buffer para recuperar as informações de versão }
  lTamInfo := GetFileVersionInfoSize(lModulo, lIgnore);
  GetMem(lBuffer, lTamInfo);

  { Recupera as informações no buffer alocado }
  if GetFileVersionInfo(lModulo, lIgnore, lTamInfo, lBuffer) then
  begin
    { Lingua 0409 com code page 04B0. No arquivo de recurso desse exemplo existe apenas textos nessa lingua. }
    lTrans := '040904B0';

    { Monta o caminho onde está o texto procurado no buffer }
    lPath := '\StringFileInfo\' + lTrans + '\' + ATexto;

    { Recupera o valor do texto solicitado }
    if VerQueryValue(lBuffer, PChar(lPath), Pointer(lInfo), lTamInfo) then
      Result := lInfo
    else
      Result := '';
  end;
  FreeMem(lBuffer);
end;

end.
