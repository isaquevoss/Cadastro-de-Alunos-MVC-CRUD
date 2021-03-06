unit uHelpers;

interface

uses
  Vcl.Grids, FireDAC.Comp.Client;

procedure ClearStringGrid(const Grid: TStringGrid);
function GetLastInsertRowID(Connection: TFDConnection): Int64;

implementation

uses
  FireDAC.Phys.SQLiteWrapper;

function GetLastInsertRowID(Connection: TFDConnection): Int64;
begin
  Result := Int64((TObject(Connection.CliObj) as TSQLiteDatabase).LastInsertRowid);
end;

procedure ClearStringGrid(const Grid: TStringGrid);
var
  c, r: Integer;
begin
  for c := 0 to Pred(Grid.ColCount) do
    for r := 0 to Pred(Grid.RowCount) do
      Grid.Cells[c, r] := '';
end;

end.
