unit clBaixas;

interface

uses
  clEntrega, clConexao;

type
  TBaixa = Class(TEntrega)

  private

  protected

    _conexao: TConexao;

  public

    constructor Create;
    destructor Destroy;

    function JaExiste(): Boolean;
    function Baixar(): Boolean;
    function UltimaBaixa(): String;

  end;

const
  TABLENAME = 'tbentregas';

implementation

uses SysUtils, Dialogs, udm, clUtil, ZDataset, ZAbstractRODataset, DB, uGlobais;

constructor TBaixa.Create;
begin
  _conexao := TConexao.Create;
  if (not _conexao.VerifyConnZEOS(0)) then
  begin
    MessageDlg('Erro ao estabelecer conexão ao banco de dados (' +
      Self.ClassName + ') !', mtError, [mbCancel], 0);
  end;
end;

destructor TBaixa.Destroy;
begin
  _conexao.Free;
end;

function TBaixa.JaExiste(): Boolean;
begin
  try
    Result := False;

    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + TABLENAME);
      SQL.Add(' WHERE NUM_NOSSONUMERO = :NOSSONUMERO');
      ParamByName('NOSSONUMERO').AsString := Self.NossoNumero;
      dm.ZConn.PingServer;
      Open;
      if not(IsEmpty) then
        Result := True;
    end;

    dm.QryGetObject.Close;
    dm.QryGetObject.SQL.Clear;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TBaixa.Baixar(): Boolean;
begin
  try
    Result := False;
    with dm.qryCRUD do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'UPDATE ' + TABLENAME + ' SET ' +
        'DAT_PREV_DISTRIBUICAO = :PREVDISTRIBUICAO, ' + 'DAT_BAIXA = :BAIXA, ' +
        'DOM_BAIXADO = :BAIXADO, ' + 'DAT_ENTREGA = :ENTREGA, ' +
        'COD_AGENTE = :AGENTE, ' + 'COD_ENTREGADOR = :ENTREGADOR, ' +
        'DAT_ATRIBUICAO = :ATRIBUICAO, ' + 'VAL_VERBA_ENTREGADOR = :VERBA, ' +
        'QTD_DIAS_ATRASO = :DIASATRASO, ' +
        'QTD_VOLUMES_EXTRA = :VOLUMESEXTRA, ' +
        'VAL_VOLUMES_EXTRA = :VALOREXTRA, ' +
        'QTD_PESO_COBRADO = :PESOCOBRADO, ' + 'DES_TIPO_PESO = :TIPOPESO, ' +
        'DES_RASTREIO = :RASTREIO, ' +
        'NUM_CTRC := :CTRC, NUM_PEDIDO = :PEDIDO ' +
        'WHERE ' + 'NUM_NOSSONUMERO = :NOSSONUMERO AND DOM_PAGO <> ' +
        QuotedStr('S');
      Self.Rastreio := Self.Rastreio + #13 + 'Importação de Baixa da Entrega feita em ' +
                       FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' por ' + uGlobais.sNomeUsuario;
      ParamByName('NOSSONUMERO').AsString := Self.NossoNumero;
      ParamByName('PREVDISTRIBUICAO').AsDate := Self.PrevDistribuicao;
      ParamByName('BAIXA').AsDateTime := Self.DataBaixa;
      ParamByName('BAIXADO').AsString := Self.Baixado;
      ParamByName('ENTREGA').AsDate := Self.Entrega;
      ParamByName('ATRIBUICAO').AsDateTime := Self.Atribuicao;
      ParamByName('VERBA').AsFloat := Self.VerbaEntregador;
      ParamByName('AGENTE').AsInteger := Self.Agente;
      ParamByName('ENTREGADOR').AsInteger := Self.Entregador;
      ParamByName('DIASATRASO').AsInteger := Self.DiasAtraso;
      ParamByName('VOLUMESEXTRA').AsFloat := Self.VolumesExtra;
      ParamByName('VALOREXTRA').AsFloat := Self.ValorExtra;
      ParamByName('PESOCOBRADO').AsFloat := Self.PesoCobrado;
      ParamByName('TIPOPESO').AsString := Self.TipoPeso;
      ParamByName('RASTREIO').AsString := Self.Rastreio;
      ParamByName('PEDIDO').AsString := Self.Pedido;
      if Self.DiasAtraso > 0 then
      begin
        ParamByName('CTRC').AsInteger := 1;
      end
      else
      begin
        ParamByName('CTRC').AsInteger := 0;
      end;

      dm.ZConn.PingServer;
      ExecSQL;
      Self.Rastreio := '';
    end;
    dm.qryCRUD.Close;
    dm.qryCRUD.SQL.Clear;
    Result := True;
  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

function TBaixa.UltimaBaixa(): String;
begin
  try
    Result := '';
    with dm.QryGetObject do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT MAX(DAT_BAIXA) DATA FROM ' + TABLENAME);
      dm.ZConn.PingServer;
      Open;
      if not(IsEmpty) then
        Result := dm.QryGetObject.FieldByName('DATA').AsString;
    end;

    dm.QryGetObject.Close;
    dm.QryGetObject.SQL.Clear;

  Except
    on E: Exception do
      ShowMessage('Classe: ' + E.ClassName + chr(13) + 'Mensagem: ' +
        E.Message);
  end;
end;

end.
