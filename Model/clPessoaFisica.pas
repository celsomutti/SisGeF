unit clPessoaFisica;

interface

uses System.StrUtils, System.SysUtils;

type
  TPessoaFisica = class(Tobject)
  private
    FNome: String;
    FNascimento: TDate;
    FPai: String;
    FMae: String;
    FCPF: String;
    FRG: String;
    FExpedidor: String;
    FUFRG: String;
    FDataRG: TDate;
    FNaturalidade: String;
    FUFNaturalidade: String;
    FCNH: String;
    FRegistroCNH: String;
    FValidadeCNH: TDate;
    FCategoriaCNH: String;
    FPrimeiraCNH: TDate;
    FPIS: String;
    FCTPS: String;
    FSerieCTPS: String;
    FUFCTPS: String;
    FUFCNH: String;
    FEstadoCivil: String;
    FTituloEleitor: String;
    FReservista: String;
    FFormaCredito: String;
    FTipoConta: String;
    FBanco: String;
    FAgencia: String;
    FConta: String;
    FFavorecido: String;
    FCPFFavorecido: String;
    procedure SetNome(val: String);
    procedure SetNascimento(val: TDate);
    procedure SetPai(val: String);
    procedure SetMae(val: String);
    procedure SetCPF(val: String);
    procedure SetRG(val: String);
    procedure SetExpedidor(val: String);
    procedure SetUFRG(val: String);
    procedure SetDataRG(val: TDate);
    procedure SetNaturalidade(val: String);
    procedure SetUFNaturalidade(val: String);
    procedure SetCNH(val: String);
    procedure SetRegistroCNH(val: String);
    procedure SetValidadeCNH(val: TDate);
    procedure SetCategoriaCNH(val: String);
    procedure SetPrimeiraCNH(val: TDate);
    procedure SetPIS(val: String);
    procedure SetCTPS(val: String);
    procedure SetSerieCTPS(val: String);
    procedure SetUFCTPS(val: String);
    procedure SetUFCNH(val: String);
    procedure SetEstadoCivil(val: String);
    procedure SetTituloEleitor(val: String);
    procedure SetReservista(val: String);
    procedure SetFormaCredito(val: String);
    procedure SetTipoConta(val: String);
    procedure SetBanco(val: String);
    procedure SetAgencia(val: String);
    procedure SetConta(val: String);
    procedure SetFavorecido(val: String);
    procedure SetCPFFavorecido(val: String);
  public
    property Nome: String read FNome write SetNome;
    property Nascimento: TDate read FNascimento write SetNascimento;
    property Pai: String read FPai write SetPai;
    property Mae: String read FMae write SetMae;
    property CPF: String read FCPF write SetCPF;
    property RG: String read FRG write SetRG;
    property Expedidor: String read FExpedidor write SetExpedidor;
    property UFRG: String read FUFRG write SetUFRG;
    property DataRG: TDate read FDataRG write SetDataRG;
    property Naturalidade: String read FNaturalidade write SetNaturalidade;
    property UFNaturalidade: String read FUFNaturalidade write SetUFNaturalidade;
    property CNH: String read FCNH write SetCNH;
    property RegistroCNH: String read FRegistroCNH write SetRegistroCNH;
    property ValidadeCNH: TDate read FValidadeCNH write SetValidadeCNH;
    property CategoriaCNH: String read FCategoriaCNH write SetCategoriaCNH;
    property PrimeiraCNH: TDate read FPrimeiraCNH write SetPrimeiraCNH;
    property PIS: String read FPIS write SetPIS;
    property CTPS: String read FCTPS write SetCTPS;
    property SerieCTPS: String read FSerieCTPS write SetSerieCTPS;
    property UFCTPS: String read FUFCTPS write SetUFCTPS;
    property UFCNH: String read FUFCNH write SetUFCNH;
    property EstadoCivil: String read FEstadoCivil write SetEstadoCivil;
    property TituloEleitor: String read FTituloEleitor write SetTituloEleitor;
    property Reservista: String read FReservista write SetReservista;
    property FormaCredito: String read FFormaCredito write SetFormaCredito;
    property TipoConta: String read FTipoConta write SetTipoConta;
    property Banco: String read FBanco write SetBanco;
    property Agencia: String read FAgencia write SetAgencia;
    property Conta: String read FConta write SetConta;
    property Favorecido: String read FFavorecido write SetFavorecido;
    property CPFFavorecido: String read FCPFFavorecido write SetCPFFavorecido;
    /// <author>Celso Mutti</author>
    /// <since>09/2015</since>
    function VerificaCPF(sCPF: String): Boolean;
    /// <author>Celso Mutti</author>
    /// <since>09/2015</since>
    function VerificarPIS(sPIS: String): Boolean;
  end;

implementation

procedure TPessoaFisica.SetNome(val: String);
begin
  FNome := val;
end;

procedure TPessoaFisica.SetNascimento(val: TDate);
begin
  FNascimento := val;
end;

procedure TPessoaFisica.SetPai(val: String);
begin
  FPai := val;
end;

procedure TPessoaFisica.SetMae(val: String);
begin
  FMae := val;
end;

procedure TPessoaFisica.SetCPF(val: String);
begin
  FCPF := val;
end;

procedure TPessoaFisica.SetRG(val: String);
begin
  FRG := val;
end;

procedure TPessoaFisica.SetExpedidor(val: String);
begin
  FExpedidor := val;
end;

procedure TPessoaFisica.SetUFRG(val: String);
begin
  FUFRG := val;
end;

procedure TPessoaFisica.SetDataRG(val: TDate);
begin
  FDataRG := val;
end;

procedure TPessoaFisica.SetNaturalidade(val: String);
begin
  FNaturalidade := val;
end;

procedure TPessoaFisica.SetUFNaturalidade(val: String);
begin
  FUFNaturalidade := val;
end;

procedure TPessoaFisica.SetCNH(val: String);
begin
  FCNH := val;
end;

procedure TPessoaFisica.SetRegistroCNH(val: String);
begin
  FRegistroCNH := val;
end;

procedure TPessoaFisica.SetValidadeCNH(val: TDate);
begin
  FValidadeCNH := val;
end;

procedure TPessoaFisica.SetCategoriaCNH(val: String);
begin
  FCategoriaCNH := val;
end;

procedure TPessoaFisica.SetPrimeiraCNH(val: TDate);
begin
  FPrimeiraCNH := val;
end;

procedure TPessoaFisica.SetPIS(val: String);
begin
  FPIS := val;
end;

procedure TPessoaFisica.SetCTPS(val: String);
begin
  FCTPS := val;
end;

procedure TPessoaFisica.SetSerieCTPS(val: String);
begin
  FSerieCTPS := val;
end;

procedure TPessoaFisica.SetUFCTPS(val: String);
begin
  FUFCTPS := val;
end;

procedure TPessoaFisica.SetUFCNH(val: String);
begin
  FUFCNH := val;
end;

procedure TPessoaFisica.SetEstadoCivil(val: String);
begin
  FEstadoCivil := val;
end;

procedure TPessoaFisica.SetTituloEleitor(val: String);
begin
  FTituloEleitor := val;
end;

procedure TPessoaFisica.SetReservista(val: String);
begin
  FReservista := val;
end;

procedure TPessoaFisica.SetFormaCredito(val: String);
begin
  FFormaCredito := val;
end;

procedure TPessoaFisica.SetTipoConta(val: String);
begin
  FTipoConta := val;
end;

procedure TPessoaFisica.SetBanco(val: String);
begin
  FBanco := val;
end;

procedure TPessoaFisica.SetAgencia(val: String);
begin
  FAgencia := val;
end;

procedure TPessoaFisica.SetConta(val: String);
begin
  FConta := val;
end;

procedure TPessoaFisica.SetFavorecido(val: String);
begin
  FFavorecido := val;
end;

procedure TPessoaFisica.SetCPFFavorecido(val: String);
begin
  FCPFFavorecido := val;
end;

function TPessoaFisica.VerificaCPF(sCPF: String): Boolean;
var
  n1, n2, n3, n4, n5, n6, n7, n8, n9: Integer;
  d1, d2: Integer;
  numero, digitado, calculado: string;
begin
  numero := ReplaceStr(sCPF, '.', '');
  numero := ReplaceStr(numero, '-', '');
  numero := ReplaceStr(numero, ' ', '');
  numero := ReplaceStr(numero, '_', '');
  numero := ReplaceStr(numero, '/', '');
  sCPF := numero;
  if StrToFloatDef(sCPF,0) = 0 then
  begin
    Result := False;
    Exit;
  end;
  if sCPF = '' then
  begin
    Result := False;
    Exit;
  end;
  if sCPF = '11111111111' then
  begin
    Result := False;
    Exit;
  end;
  if sCPF = '22222222222' then
  begin
    Result := False;
    Exit;
  end;
  if sCPF = '33333333333' then
  begin
    Result := False;
    Exit;
  end;
  if sCPF = '44444444444' then
  begin
    Result := False;
    Exit;
  end;
  if sCPF = '55555555555' then
  begin
    Result := False;
    Exit;
  end;
  if sCPF = '66666666666' then
  begin
    Result := False;
    Exit;
  end;
  if sCPF = '77777777777' then
  begin
    Result := False;
    Exit;
  end;
  if sCPF = '88888888888' then
  begin
    Result := False;
    Exit;
  end;
  if sCPF = '99999999999' then
  begin
    Result := False;
    Exit;
  end;
  n1 := StrToInt(sCPF[1]);
  n2 := StrToInt(sCPF[2]);
  n3 := StrToInt(sCPF[3]);
  n4 := StrToInt(sCPF[4]);
  n5 := StrToInt(sCPF[5]);
  n6 := StrToInt(sCPF[6]);
  n7 := StrToInt(sCPF[7]);
  n8 := StrToInt(sCPF[8]);
  n9 := StrToInt(sCPF[9]);
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
  digitado := sCPF[10] + sCPF[11];
  if calculado = digitado then
    Result := True
  else
    Result := False;
end;

function TPessoaFisica.VerificarPIS(sPIS: String): Boolean;
var
  i, wsoma, Wm11, Wdv,wdigito : Integer;
begin
  if (not Trim(sPIS).IsEmpty) then
  begin
    wdv := StrToInt(copy(sPIS, 11, 1));
    wsoma := 0;
    wm11 := 2;
    for i := 1 to 10 do
    begin
      wsoma := wsoma + (wm11 * StrToInt(copy(sPIS,11 - I, 1)));
      if wm11 < 9 then
      begin
        wm11 := wm11+1
      end
      else
      begin
        wm11 := 2;
      end;
    end;
    wdigito := 11 - (wsoma MOD 11);
    if wdigito > 9 then
    begin
      wdigito := 0;
    end;
    if wdv = wdigito then
    begin
      Result := true;
    end
    else
    begin
      Result := false;
    end;
  end;
end;

end.
