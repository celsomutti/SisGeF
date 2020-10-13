unit Model.PlanilhaEntradaCarriers;

interface

uses Generics.Collections;

  type
    TPlanilhaEntradaCarriers = class
    private
      FNRRota: String;
      FRota: String;
      FMotorista: String;
      FOrdemRota: String;
      FEmbarcador: String;
      FDestinatario: String;
      FNREntrega: String;
      FNF: String;
      FPedido: String;
      FTipo: String;
      FTipoFrete: String;
      FVolumes: STring;
      FACobrar: String;
      FOBSEntrega: String;
      FIDViagem: String;
      FDataEntrega: String;
      FDataOcorrencia: String;
      FOcorrencia: String;
      FIDRemessa: String;
      FEndereco: String;
      FBairro: String;
      FMunicipio: String;
      FCEP: String;
      FSituacaoEntrega: String;
      FFreteRemessa: String;
      FFreteCobrar: String;
      FPeso: String;
      FValor: String;
      FTentativa: String;
      FColeta: String;
      FViagem: String;
      FTipoBaixa: String;
      FIDVolume: String;
      FSituacao: String;
      FOBS: String;
      FNomeBase: String;
      FLatitude: String;
      FLongitude: String;
      FIDPedido: String;
    public
      property NRRota : String read FNRRota write FNRRota;
      property Rota : String read FRota write FRota;
      property Motorista: String read FMotorista write FMotorista;
      property OrdemRota: String read FOrdemRota write FOrdemRota;
      property Embarcador: String read FEmbarcador write FEmbarcador;
      property Destinatario: String read FDestinatario write FDestinatario;
      property NREntrega: String read FNREntrega write FNREntrega;
      property NF: String read FNF write FNF;
      property Pedido: String read FPedido write FPedido;
      property Tipo: String read FTipo write FTipo;
      property TipoFrete: String read FTipoFrete write FTipoFrete;
      property Volumes: STring read FVolumes write FVolumes;
      property ACobrar: String read FACobrar write FACobrar;
      property OBSEntrega: String read FOBSEntrega write FOBSEntrega;
      property IDViagem: String read FIDViagem write FIDViagem;
      property DataEntrega: String read FDataEntrega write FDataEntrega;
      property DataOcorrencia: String read FDataOcorrencia write FDataOcorrencia;
      property Ocorrencia: String read FOcorrencia write FOcorrencia;
      property IDRemessa: String read FIDRemessa write FIDRemessa;
      property Endereco: String read FEndereco write FEndereco;
      property Bairro: String read FBairro write FBairro;
      property Municipio: String read FMunicipio write FMunicipio;
      property CEP: String read FCEP write FCEP;
      property SituacaoEntrega: String read FSituacao write FSituacao;
      property FreteRemessa: String read FFreteRemessa write FFreteRemessa;
      property FreteCobrar: String read FFreteCobrar write FFreteCobrar;
      property Peso: String read FPeso write FPeso;
      property Valor: String read FValor write FValor;
      property Tentativa: String read FTentativa write FTentativa;
      property Coleta: String read FColeta write FColeta;
      property Viagem: String read FViagem write FViagem;
      property TipoBaixa: String read FTipoBaixa write FTipoBaixa;
      property IDVolume: String read FIDVolume write FIDVolume;
      property Situacao: String read FSituacao write FSituacao;
      property OBS: String read FOBS write FOBS;
      property NomeBase: String read FNomeBase write FNomeBase;
      property Latitude: String read FLatitude write FLatitude;
      property Longitude: String read FLongitude write FLongitude;
      property IDPedido: String read FIDPedido write FIDPedido;
      function GetPlanilha(sFile: String): TObjectList<TPlanilhaEntradaCarriers>;
    end;


implementation

{ TPlanilhaEntradaEntregas }

uses DAO.PlanilhaEntradaCarriers;

function TPlanilhaEntradaCarriers.GetPlanilha(sFile: String): TObjectList<TPlanilhaEntradaCarriers>;
var
  planilha : TPlanilhaEntradaCarriersDAO;
begin
  try
    planilha := TPlanilhaEntradaCarriersDAO.Create;
    Result := planilha.GetPlanilha(sFile);
  finally
    planilha.Free;
  end;
end;

end.
