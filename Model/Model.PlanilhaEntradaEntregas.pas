unit Model.PlanilhaEntradaEntregas;

interface

uses Generics.Collections;

  type
    TPlanilhaEntradaEntregas = class
    private
    var
      FCodigoDestino : String;
      FNomeDestiono : String;
      FNossoNumero: String;
      FCodigoCliente: String;
      FNumeroNF: String;
      FNomeConsumidor: String;
      FAosCuidados: String;
      FLogradouro: String;
      FComplemento: String;
      FBairro: String;
      FCidade: String;
      FCEP: STring;
      FTelefone: String;
      FExpedicao: String;
      FPrevisao: String;
      FStatus: String;
      FDescricaoStatus: String;
      FNomeEntregador: String;
      FContainer: String;
      FValorProuto: String;
      FValorVerba: String;
      FAltura: String;
      FLargura: String;
      FComprimento: String;
      FPeso: String;
      FVolume: String;
    public
      property CodigoDestino : String read FCodigoDestino write FCodigoDestino;
      property NomeDestino : String read FNomeDestiono write FNomeDestiono;
      property NossoNumero: String read FNossoNumero write FNossoNumero;
      property CodigoCliente: String read FCodigoCliente write FCodigoCliente;
      property NumeroNF: String read FNumeroNF write FNumeroNF;
      property NomeConsumidor: String read FNomeConsumidor write FNomeConsumidor;
      property AosCuidados: String read FAosCuidados write FAosCuidados;
      property Logradouro: String read FLogradouro write FLogradouro;
      property Complemento: String read FComplemento write FComplemento;
      property Bairro: String read FBairro write FBairro;
      property Cidade: String read FCidade write FCidade;
      property CEP: STring read FCEP write FCEP;
      property Telefone: String read FTelefone write FTelefone;
      property Expedicao: String read FExpedicao write FExpedicao;
      property Previsao: String read FPrevisao write FPrevisao;
      property Status: String read FStatus write FStatus;
      property DescricaoStatus: String read FDescricaoStatus write FDescricaoStatus;
      property NomeEntregador: String read FNomeEntregador write FNomeEntregador;
      property Container: String read FContainer write FContainer;
      property ValorProuto: String read FValorProuto write FValorProuto;
      property ValorVerba: String read FValorVerba write FValorVerba;
      property Altura: String read FAltura write FAltura;
      property Largura: String read FLargura write FLargura;
      property Comprimento: String read FComprimento write FComprimento;
      property Peso: String read FPeso write FPeso;
      property Volume: String read FVolume write FVolume;

      function GetPlanilha(sFile: String): TObjectList<TPlanilhaEntradaEntregas>;
    end;


implementation

{ TPlanilhaEntradaEntregas }

uses DAO.PlanilhaEntradaEntregas;

function TPlanilhaEntradaEntregas.GetPlanilha(sFile: String): TObjectList<TPlanilhaEntradaEntregas>;
var
  planilha : TPlanilhaEntradaEntregasDAO;
begin
  try
    planilha := TPlanilhaEntradaEntregasDAO.Create;
    Result := planilha.GetPlanilha(sFile);
  finally
    planilha.Free;
  end;
end;

end.
