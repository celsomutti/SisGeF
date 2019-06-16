unit Model.OcorrenciasJornal;

interface
  type
    TOcorrenciasJornal = class
    private
    var
      FNumero: Integer;
      FDataOcorrencia: TDate;
      FCodigoAssinstura: String;
      FNome: String;
      FRoteiro: String;
      FEntregador: integer;
      FProduto: String;
      FCodigoOcorrencia: Integer;
      FReincidente: String;
      FDescricao: String;
      FEndereco: String;
      FRetorno: String;
      FResultado: Integer;
      FOrigem: Integer;
      FObs: String;
      FStatus: Integer;
      FApuracao: String;
      FProcessado: String;
      FQtde: Integer;
      FValor: Double;
      FDataDesconto: TDate;
      FImpressao: String;
      FAnexo: String;
      FLog: String;
    public
      property Numero: Integer read FNumero write FNumero;
      property DataOcorrencia: TDate read FDataOcorrencia write FDataOcorrencia;
      property CodigoAssinstura: String read FCodigoAssinstura write FCodigoAssinstura;
      property Nome: String read FNome write FNome;
      property Roteiro: String read FRoteiro write FRoteiro;
      property Entregador: integer read FEntregador write FEntregador;
      property Produto: String read FProduto write FProduto;
      property CodigoOcorrencia: Integer read FCodigoOcorrencia write FCodigoOcorrencia;
      property Reincidente: String read FReincidente write FReincidente;
      property Descricao: String read FDescricao write FDescricao;
      property Endereco: String read FEndereco write FEndereco;
      property Retorno: String read FRetorno write FRetorno;
      property Resultado: Integer read FResultado write FResultado;
      property Origem: Integer read FOrigem write FOrigem;
      property Obs: String read FObs write FObs;
      property Status: Integer read FStatus write FStatus;
      property Apuracao: String read FApuracao write FApuracao;
      property Processado: String read FProcessado write FProcessado;
      property Qtde: Integer read FQtde write FQtde;
      property Valor: Double read FValor write FValor;
      property DataDesconto: TDate read FDataDesconto write FDataDesconto;
      property Impressao: String read FImpressao write FImpressao;
      property Anexo: String read FAnexo write FAnexo;
      property Log: String read FLog write FLog;
      constructor Create; overload;
      constructor Create(pFNumero: Integer; pFDataOcorrencia: TDate; pFCodigoAssinstura: String; pFNome: String; pFRoteiro: String;
                         pFEntregador: integer; pFProduto: String; pFCodigoOcorrencia: Integer; pFReincidente: String;
                         pFDescricao: String; pFEndereco: String; pFRetorno: String; pFResultado: Integer; pFOrigem: Integer;
                         pFObs: String; pFStatus: Integer; pFApuracao: String; pFProcessado: String; pFQtde: Integer;
                         pFValor: Double; pFDataDesconto: TDate; pFImpressao: String; pFAnexo: String; pFLog: String) overload;

    end;

implementation

constructor TOcorrenciasJornal.Create;
begin
  inherited Create;
end;

constructor TOcorrenciasJornal.Create(pFNumero: Integer; pFDataOcorrencia: TDate; pFCodigoAssinstura: string; pFNome: string;
                                      pFRoteiro: string; pFEntregador: Integer; pFProduto: string; pFCodigoOcorrencia: Integer;
                                      pFReincidente: string; pFDescricao: string; pFEndereco: string; pFRetorno: string;
                                      pFResultado: Integer; pFOrigem: Integer; pFObs: string; pFStatus: Integer;
                                      pFApuracao: string; pFProcessado: string; pFQtde: Integer; pFValor: Double;
                                      pFDataDesconto: TDate; pFImpressao: string; pFAnexo: string; pFLog: string);
begin
  FNumero := pFNumero;
  FDataOcorrencia := pFDataOcorrencia;
  FCodigoAssinstura := pFCodigoAssinstura;
  FNome := pFNome;
  FRoteiro := pFRoteiro;
  FEntregador := pFEntregador;
  FProduto := pFProduto;
  FCodigoOcorrencia := pFCodigoOcorrencia;
  FReincidente := pFReincidente;
  FDescricao := pFDescricao;
  FEndereco := pFEndereco;
  FRetorno := pFRetorno;
  FResultado := pFResultado;
  FOrigem := pFOrigem;
  FObs := pFObs;
  FStatus := pFStatus;
  FApuracao := pFApuracao;
  FProcessado := pFProcessado;
  FQtde := pFQtde;
  FValor := pFValor;
  FDataDesconto := pFDataDesconto;
  FImpressao := pFImpressao;
  FAnexo := pFAnexo;
  FLog := pFLog;
end;

end.
