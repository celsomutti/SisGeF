unit Model.TabelasDistribuicao;

interface
  type
    TTabelasDistribuicao = class
    private
    var
      FID: System.Integer;
      FData: System.TDate;
      FTabela: System.Integer;
      FGrupo: System.Integer;
      FTipo: System.Integer;
      FEntregador: System.Integer;
      FLog: system.String;
    public
      property ID: System.Integer read FID write FID;
      property Data: System.TDate read FDATA write FData;
      property Tabela: System.Integer read FTabela write FTabela;
      property Grupo: System.Integer read FGrupo write FGrupo;
      property Tipo: System.Integer read FTipo write FTipo;
      property Entregador: System.Integer read FEntregador write FEntregador;
      property Log: System.string read FLog write FLog;
      constructor Create; overload;
      constructor Create(pFID: System.Integer; pFData: System.TDate; pFTabela: System.Integer; pFGrupo: System.Integer;
                         pFTipo: System.Integer; pFEntregador: System.Integer; pFLog: System.string); overload;
    end;

implementation

constructor TTabelasDistribuicao.Create;
begin
  inherited Create;
end;

constructor TTabelasDistribuicao.Create(pFID: Integer; pFData: TDate; pFTabela: Integer; pFGrupo: Integer; pFTipo: Integer;
                                        pFEntregador: Integer; pFLog: string);
begin
  FID := pFID;
  FData := pFData;
  FTabela := pFTabela;
  FGrupo := pFGrupo;
  FTipo := pFTipo;
  FEntregador := pFEntregador;
  FLog := pFLog;
end;

end.
