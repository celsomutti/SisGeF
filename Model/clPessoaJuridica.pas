unit clPessoaJuridica;

interface

uses clpessoafisica, System.StrUtils;

type
  TPessoaJuridica = class(TPessoaFisica)
  public
  private
  var
    FRazao: String;
    FFantasia: String;
    FCNPJ: String;
    FIE: String;
    FIEST: String;
    FIM: String;
    FCNAE: String;
    FCRT: Integer;
    FSUFRAMA: String;
    FFormaCredito: String;
    FTipoConta: String;
    FBanco: String;
    FAgencia: String;
    FConta: String;
    FFavorecido: String;
    FCNPJFavorecido: String;
    FResponsavel: String;
    procedure SetRazao(val: String);
    procedure SetFantasia(val: String);
    procedure SetCNPJ(val: String);
    procedure SetIE(val: String);
    procedure SetIEST(val: String);
    procedure SetIM(val: String);
    procedure SetCNAE(val: String);
    procedure SetCRT(val: Integer);
    procedure SetSUFRAMA(val: String);
    procedure SetFormaCredito(val: String);
    procedure SetTipoConta(val: String);
    procedure SetBanco(val: String);
    procedure SetAgencia(val: String);
    procedure SetConta(val: String);
    procedure SetFavorecido(val: String);
    procedure SetCNPJFavorecido(val: String);
    procedure SetResponsavel(val: String);
  protected
  public
    property Razao: String read FRazao write SetRazao;
    property Fantasia: String read FFantasia write SetFantasia;
    property CNPJ: String read FCNPJ write SetCNPJ;
    property IE: String read FIE write SetIE;
    property IEST: String read FIEST write SetIEST;
    property IM: String read FIM write SetIM;
    property CNAE: String read FCNAE write SetCNAE;
    property CRT: Integer read FCRT write SetCRT;
    property SUFRAMA: String read FSUFRAMA write SetSUFRAMA;
    property FormaCredito: String read FFormaCredito write SetFormaCredito;
    property TipoConta: String read FTipoConta write SetTipoConta;
    property Banco: String read FBanco write SetBanco;
    property Agencia: String read FAgencia write SetAgencia;
    property Conta: String read FConta write SetConta;
    property Favorecido: String read FFavorecido write SetFavorecido;
    property CNPJFavorecido: String read FCNPJFavorecido
      write SetCNPJFavorecido;
    function VerificaCNPJ(sCNPJ: String): Boolean;
    property Responsavel: String read FResponsavel write SetResponsavel;
  end;

implementation

uses SysUtils;

procedure TPessoaJuridica.SetRazao(val: String);
begin
  FRazao := val;
end;

procedure TPessoaJuridica.SetFantasia(val: String);
begin
  FFantasia := val;
end;

procedure TPessoaJuridica.SetCNPJ(val: String);
begin
  FCNPJ := val;
end;

procedure TPessoaJuridica.SetIE(val: String);
begin
  FIE := val;
end;

procedure TPessoaJuridica.SetIEST(val: String);
begin
  FIEST := val;
end;

procedure TPessoaJuridica.SetIM(val: String);
begin
  FIM := val;
end;

procedure TPessoaJuridica.SetCNAE(val: String);
begin
  FCNAE := val;
end;

procedure TPessoaJuridica.SetCRT(val: Integer);
begin
  FCRT := val;
end;

procedure TPessoaJuridica.SetSUFRAMA(val: String);
begin
  FSUFRAMA := val;
end;

procedure TPessoaJuridica.SetFormaCredito(val: String);
begin
  FFormaCredito := val;
end;

procedure TPessoaJuridica.SetTipoConta(val: String);
begin
  FTipoConta := val;
end;

procedure TPessoaJuridica.SetBanco(val: String);
begin
  FBanco := val;
end;

procedure TPessoaJuridica.SetAgencia(val: String);
begin
  FAgencia := val;
end;

procedure TPessoaJuridica.SetConta(val: String);
begin
  FConta := val;
end;

procedure TPessoaJuridica.SetFavorecido(val: String);
begin
  FFavorecido := val;
end;

procedure TPessoaJuridica.SetCNPJFavorecido(val: String);
begin
  FCNPJFavorecido := val;
end;

procedure TPessoaJuridica.SetResponsavel(val: String);
begin
  FResponsavel := val;
end;

function TPessoaJuridica.VerificaCNPJ(sCNPJ: String): Boolean;
var
  n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12: Integer;
  d1, d2: Integer;
  snumero, digitado, calculado: string;
begin
  snumero := ReplaceStr(sCNPJ, '.', '');
  snumero := ReplaceStr(snumero, '-', '');
  snumero := ReplaceStr(snumero, '/', '');
  snumero := ReplaceStr(snumero, ' ', '');
  snumero := ReplaceStr(snumero, '_', '');
  sCNPJ := snumero;
  if StrToFloatDef(sCNPJ,0) = 0 then
  begin
    Result := False;
    Exit;
  end;
  if sCNPJ = '' then
  begin
    Result := False;
    Exit;
  end;
  if sCNPJ = '11111111111111' then
  begin
    Result := False;
    Exit;
  end;
  if sCNPJ = '22222222222222' then
  begin
    Result := False;
    Exit;
  end;
  if sCNPJ = '33333333333333' then
  begin
    Result := False;
    Exit;
  end;
  if sCNPJ = '44444444444444' then
  begin
    Result := False;
    Exit;
  end;
  if sCNPJ = '55555555555555' then
  begin
    Result := False;
    Exit;
  end;
  if sCNPJ = '66666666666666' then
  begin
    Result := False;
    Exit;
  end;
  if sCNPJ = '77777777777777' then
  begin
    Result := False;
    Exit;
  end;
  if sCNPJ = '88888888888888' then
  begin
    Result := False;
    Exit;
  end;
  if sCNPJ = '99999999999999' then
  begin
    Result := False;
    Exit;
  end;
  n1 := StrToInt(sCNPJ[1]);
  n2 := StrToInt(sCNPJ[2]);
  n3 := StrToInt(sCNPJ[3]);
  n4 := StrToInt(sCNPJ[4]);
  n5 := StrToInt(sCNPJ[5]);
  n6 := StrToInt(sCNPJ[6]);
  n7 := StrToInt(sCNPJ[7]);
  n8 := StrToInt(sCNPJ[8]);
  n9 := StrToInt(sCNPJ[9]);
  n10 := StrToInt(sCNPJ[10]);
  n11 := StrToInt(sCNPJ[11]);
  n12 := StrToInt(sCNPJ[12]);
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
  digitado := sCNPJ[13] + sCNPJ[14];
  if calculado = digitado then
    Result := True
  else
    Result := False;
end;

end.
