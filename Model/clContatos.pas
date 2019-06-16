unit clContatos;

interface

type

  TContatos = class(TObject)
  private
    function getContato: String;
    function getEMail: String;
    function getTelefone: String;
    procedure setContato(const Value: String);
    procedure setEMail(const Value: String);
    procedure setTelefone(const Value: String);

  protected
    _contato: String;
    _telefone: String;
    _email: String;

  public
    property Contato: String read getContato write setContato;
    property Telefone: String read getTelefone write setTelefone;
    property EMail: String read getEMail write setEMail;
  end;

implementation

uses SysUtils, Dialogs, udm, clUtil, ZDataset, ZAbstractRODataset, DB;

{ TContatos }

function TContatos.getContato: String;
begin
  Result := _contato;
end;

function TContatos.getEMail: String;
begin
  Result := _email;
end;

function TContatos.getTelefone: String;
begin
  Result := _telefone;
end;

procedure TContatos.setContato(const Value: String);
begin
  _contato := Trim(Value);
end;

procedure TContatos.setEMail(const Value: String);
begin
  _email := Trim(Value);
end;

procedure TContatos.setTelefone(const Value: String);
begin
  _telefone := Trim(Value);
end;

end.
