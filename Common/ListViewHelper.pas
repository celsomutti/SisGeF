unit ListViewHelper;

interface

uses
  FMX.ListView,
  FMX.SearchBox,
  FMX.Edit;

type
  TListViewHelper = class helper for TListView
    procedure ClearSearchBox();
    procedure SetText(sText: String);
    function GetText(): String;
  end;

implementation

{ TListViewHelper }

procedure TListViewHelper.ClearSearchBox;
var
  sb: TSearchBox;
  i: Integer;
begin
  sb := nil;
  for i := 0 to Self.ComponentCount-1 do
    if (Self.Components[i] is TSearchBox) then
    begin
      sb := Self.Components[i] as TSearchBox;
      break;
    end;
  if (sb <> nil) then
    sb.Text := '';
end;

function TListViewHelper.GetText: String;
var
  sb: TSearchBox;
  i: Integer;
begin
  Result := '';
  sb := nil;
  for i := 0 to Self.ComponentCount-1 do
    if (Self.Components[i] is TSearchBox) then
    begin
      sb := Self.Components[i] as TSearchBox;
      break;
    end;
  if (sb <> nil) then
    Result := sb.Text;
end;

procedure TListViewHelper.SetText(sText: String);
var
  sb: TSearchBox;
  i: Integer;
begin
  sb := nil;
  for i := 0 to Self.ComponentCount-1 do
    if (Self.Components[i] is TSearchBox) then
    begin
      sb := Self.Components[i] as TSearchBox;
      break;
    end;
  if (sb <> nil) then
    sb.Text := sText;
end;

end.
