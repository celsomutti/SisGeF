unit clOS;

interface

uses Vcl.Forms, Vcl.Dialogs, System.SysUtils, System.Classes, System.DateUtils, clOcorrenciasJornal, System.UITypes,
     Winapi.Windows, clEntregador, clCliente;

type
  TOS = class(TObject)
  private
    FNumero: Integer;
    FData: System.TDateTime;
    FCliente: Integer;
    FCadastro: Integer;
    FPlaca: String;
    FRota: String;
    FKMInicial: Integer;
    FHoraSaida: System.TTime;
    FKMFinal: Integer;
    FHoraRetorno: System.TTime;
    FServico: String;
    FValor: Double;
    FStatus: String;
    FLog: String;
    entregador: TEntregador;
    clientes : TCliente;
    procedure SetNumero(val: Integer);
    procedure SetData(val: System.TDateTime);
    procedure SetCliente(val: Integer);
    procedure SetCadastro(val: Integer);
    procedure SetPlaca(val: String);
    procedure SetRota(val: String);
    procedure SetKMInicial(val: Integer);
    procedure SetHoraSaida(val: System.TTime);
    procedure SetKMFinal(val: Integer);
    procedure SetHoraRetorno(val: System.TTime);
    procedure SetServico(val: String);
    procedure SetValor(val: Double);
    procedure SetStatus(val: String);
    procedure SetLog(val: String);
  public
    property Numero: Integer read FNumero write SetNumero;
    property Data: System.TDateTime read FData write SetData;
    property Cliente: Integer read FCliente write SetCliente;
    property Cadastro: Integer read FCadastro write SetCadastro;
    property Placa: String read FPlaca write SetPlaca;
    property Rota: String read FRota write SetRota;
    property KMInicial: Integer read FKMInicial write SetKMInicial;
    property HoraSaida: System.TTime read FHoraSaida write SetHoraSaida;
    property KMFinal: Integer read FKMFinal write SetKMFinal;
    property HoraRetorno: System.TTime read FHoraRetorno write SetHoraRetorno;
    property Servico: String read FServico write SetServico;
    property Valor: Double read FValor write SetValor;
    property Status: String read FStatus write SetStatus;
    property Log: String read FLog write SetLog;
    function Localizar: Boolean;
    function SetupClass(iOs: Integer): Boolean;
    constructor Create;
    destructor Destroy; override;
  end;

implementation

uses udm, ufrmLocalizar, clUtil, uGlobais;

procedure TOS.SetNumero(val: Integer);
begin
  FNumero := val;
end;

procedure TOS.SetData(val: System.TDateTime);
begin
  FData := val;
end;

procedure TOS.SetCliente(val: Integer);
begin
  FCliente := val;
end;

procedure TOS.SetCadastro(val: Integer);
begin
  FCadastro := val;
end;

procedure TOS.SetPlaca(val: String);
begin
  FPlaca := val;
end;

procedure TOS.SetRota(val: String);
begin
  FRota := val;
end;

procedure TOS.SetKMInicial(val: Integer);
begin
  FKMInicial := val;
end;

procedure TOS.SetHoraSaida(val: System.TTime);
begin
  FHoraSaida := val;
end;

procedure TOS.SetKMFinal(val: Integer);
begin
  FKMFinal := val;
end;

procedure TOS.SetHoraRetorno(val: System.TTime);
begin
  FHoraRetorno := val;
end;

procedure TOS.SetServico(val: String);
begin
  FServico := val;
end;

procedure TOS.SetValor(val: Double);
begin
  FValor := val;
end;

procedure TOS.SetStatus(val: String);
begin
  FStatus := val;
end;

procedure TOS.SetLog(val: String);
begin
  FLog := val;
end;

function TOS.Localizar: Boolean;
var
  sSQL : String;
begin
  Result := False;
  sSQL := 'SELECT ' +
          'A.NUM_OS AS "Número", ' +
          'B.NOM_CLIENTE AS "Solicitante", ' +
          'C.DES_RAZAO_SOCIAL AS "Motorista", ' +
          'A.DES_PLACA AS "Placa", ' +
          'A.DES_ROTA AS "Rota" ' +
          'FROM TSV_ORDEM_SERVICO AS A ' +
          'LEFT JOIN TBCLIENTES AS B ' +
          'ON B.COD_CLIENTE = A.COD_CLIENTE ' +
          'LEFT JOIN TBENTREGADORES AS C ' +
          'ON C.COD_CADASTRO = A.COD_CADASTRO';
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  dm.qryPesquisa.SQL.Text := sSQL;
  dm.qryPesquisa.Open;
  if dm.qryPesquisa.IsEmpty then
  begin
    dm.qryPesquisa.Close;
    dm.qryPesquisa.SQL.Clear;
    Exit;
  end;
  if not Assigned(frmLocalizar) then
  begin
    frmLocalizar := TfrmLocalizar.Create(Application);
  end;
  frmLocalizar.cboCamposDisplay.Clear;
  frmLocalizar.cboCamposSQL.Clear;
  frmLocalizar.cboCamposDisplay.Items.Add('Número');
  frmLocalizar.cboCamposSQL.Items.Add('NUM_OS');
  frmLocalizar.cboCamposDisplay.Items.Add('Solicitante');
  frmLocalizar.cboCamposSQL.Items.Add('NOM_CLIENTE');
  frmLocalizar.cboCamposDisplay.Items.Add('Motorista');
  frmLocalizar.cboCamposSQL.Items.Add('DES_RAZAO_SOCIAL');
  frmLocalizar.cboCamposDisplay.Items.Add('Placa');
  frmLocalizar.cboCamposSQL.Items.Add('DES_PLACA');
  frmLocalizar.cboCamposDisplay.Items.Add('Rota');
  frmLocalizar.cboCamposSQL.Items.Add('DES_ROTA');
  frmLocalizar.cboCamposDisplay.ItemIndex := 0;
  frmLocalizar.cboCamposSQL.ItemIndex := 0;
  if frmLocalizar.ShowModal = mrOk then
  begin
    if not SetupClass(dm.qryPesquisa.Fields[0].AsInteger) then
    begin
      Application.MessageBox('Erro ao tentar configurar os campos!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK +
                             MB_ICONEXCLAMATION);
      dm.qryPesquisa.Close;
      dm.qryPesquisa.SQL.Clear;
      FreeAndNil(frmLocalizar);
      Exit;
    end;
  end;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  FreeAndNil(frmLocalizar);
  Result := True;
end;

function TOS.SetupClass(iOs: Integer): Boolean;
begin
  Result := False;
  if iOs = 0 then
  begin
    Exit;
  end;
  dm.qryOS.Close;
  dm.qryOS.Filter := 'NUM_OS = ' + IntToStr(iOs);
  dm.qryOS.Open();
  if not dm.qryOS.IsEmpty then
  begin
    Self.Numero := dm.qryOS.FieldByName('NUM_OS').AsInteger;
    Self.Data := dm.qryOS.FieldByName('DAT_OS').AsDateTime;
    Self.Cliente := dm.qryOS.FieldByName('COD_CLIENTE').AsInteger;
    Self.Cadastro := dm.qryOS.FieldByName('COD_CADASTRO').AsInteger;
    Self.Placa := dm.qryOS.FieldByName('DES_PLACA').AsString;
    Self.Rota := dm.qryOS.FieldByName('DES_ROTA').AsString;
    Self.KMInicial := dm.qryOS.FieldByName('QTD_KM_INICIAL').AsInteger;
    Self.HoraSaida := dm.qryOS.FieldByName('DAT_HORA_SAIDA').AsDateTime;
    Self.KMFinal := dm.qryOS.FieldByName('QTD_KM_FINAL').AsInteger;
    Self.HoraRetorno := dm.qryOS.FieldByName('DAT_HORA_RETORNO').AsDateTime;
    Self.Servico := dm.qryOS.FieldByName('DES_SERVICO').AsString;
    Self.Valor := dm.qryOS.FieldByName('VAL_OS').AsFloat;
    Self.Status := dm.qryOS.FieldByName('DOM_STATUS').AsString;
    Self.Log := dm.qryOS.FieldByName('DES_LOG').AsString;
    Result := True;
  end;
  dm.qryOS.Close;
  dm.qryOS.Filter := '';
end;

constructor TOS.Create;
begin
  inherited Create;
  entregador := TEntregador.Create();
  clientes := TCliente.Create();
end;

destructor TOS.Destroy;
begin
  entregador.Free;
  clientes.Free;
  inherited Destroy;
end;

end.
