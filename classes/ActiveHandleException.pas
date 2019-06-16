unit ActiveHandleException;

interface

uses
Vcl.Forms, System.SysUtils, System.Classes, Vcl.dialogs;

type
  TActiveHandleException = class
  private
    FLogFile: String;
    procedure AppException(Sender: System.TObject; E: Exception);
  public
    constructor Create;
  end;

implementation

procedure TActiveHandleException.AppException(Sender: System.TObject;
  E: Exception);
var
  Log: TextFile;
begin
  {$I-}
  AssignFile(Log, FLogFile);
  if FileExists(FLogFile) then
  begin
    Append(Log);
  end
  else
  begin
    Rewrite(Log);
  end;
  try
    Writeln(Log, 'Exception ocorrida em ' + FormatDateTime('dd" de "mmm" de "yyyy" às "hh:mm:ss',Now));
    Writeln(Log, '----------------------------------------');
    if TComponent(Sender) is TForm then
    begin
      Writeln(Log, 'Form.................: ' + TForm(Sender).Name);
      Writeln(Log, 'Caption do Form......: ' + TForm(Sender).Caption);
    end
    else
    begin
      Writeln(Log, 'Form.................: ' + TForm(TComponent(Sender).Owner).Name);
      Writeln(Log, 'Caption do Form......: ' + TForm(TComponent(Sender).Owner).Caption);
    end;
    Writeln(Log, '----------------------------------------');
    Writeln(Log, 'Classe da Exception..: ' + E.ClassName);
    Writeln(Log, 'Mensagem de Exception: ' + E.Message);
    Writeln(Log, '');
    MessageDlg(E.Message, mtError, [mbOK], 0);
  finally
    CloseFile(Log);
  end;
  {$I+}
end;

constructor TActiveHandleException.Create;
begin
  inherited Create;
  Application.OnException := AppException;
  FLogFile := ChangeFileExt(Paramstr(0), '.log');
end;

var
  ActiveException: TActiveHandleException;

Initialization
  ActiveException := TActiveHandleException.Create;

Finalization
  ActiveException.Free;


end.
