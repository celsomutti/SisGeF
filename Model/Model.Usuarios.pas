unit Model.Usuarios;

interface
  type
    TUsuarios = class
    private
      FId : System.Integer;
      FNome: System.string;
      FLogin : System.string;
      FEMail : System.string;
      FSenha: System.String;
      FGrupo : System.Integer;
      FADM : System.String;
      FExpira : System.String;
      FDias : System.SmallInt;
      FAcesso : System.string;
      FAtivo : System.string;
      FData : System.TDate;
      FNivel : System.SmallInt;
      FExecutor : System.string;
      FManutencao : System.TDateTime;
    public
      property ID : System.Integer read FID write FID;
      property Nome: System.string read FNome write FNome;
      property Login : System.string read FLogin write FLogin;
      property EMail : System.string read FEmail write FEmail;
      property Senha : System.String read FSenha write FSenha;
      property Grupo : System.Integer read FGrupo write FGrupo;
      property ADM : System.String read FADM write FADM;
      property Expira : System.String read FExpira write FExpira;
      property Dias : System.SmallInt read FDias write FDias;
      property Acesso : System.string read FAcesso write FAcesso;
      property Ativo : System.string read FAtivo write FAtivo;
      property Data : System.TDate read FData write FData;
      property Nivel : System.SmallInt read FNivel write FNivel;
      property Executor : System.string read FExecutor write FExecutor;
      property Manutencao : System.TDateTime read FManutencao write FManutencao;
      constructor Create; overload;
      constructor Create(pFId : System.Integer; pFNome: System.string; pFLogin : System.string; pFEMail : System.string;
                         pFSenha: System.String; pFGrupo : System.Integer; pFADM : System.String; pFExpira : System.String;
                         pFDias : System.SmallInt; pFAcesso : System.string; pFAtivo : System.string; pFData : System.TDate;
                         pFNivel : System.SmallInt; pFExecutor : System.string; pFManutencao : System.TDateTime); overload;
    end;

implementation

constructor TUsuarios.Create;
begin
  inherited Create;
end;

constructor TUsuarios.Create(pFId: Integer; pFNome: string; pFLogin: string; pFEMail: string; pFSenha: String; pFGrupo: Integer;
                             pFADM: string; pFExpira: string; pFDias: SmallInt; pFAcesso: string; pFAtivo: String; pFData: TDate;
                             pFNivel: SmallInt; pFExecutor: string; pFManutencao: TDateTime);
begin
    FId := pFId;
    FNome := pFNome;
    FLogin := pFLogin;
    FEMail := pFEMail;
    FSenha := pFSenha;
    FGrupo := pFGrupo;
    FADM := pFADM;
    FExpira := pFExpira;
    FDias := pFDias;
    FAcesso := pFAcesso;
    FAtivo := pFAtivo;
    FData := pFData;
    FNivel := pFNivel;
    FExecutor := pFExecutor;
    FManutencao := pFManutencao;
end;

end.
