unit uDmDatabase;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteDef, FireDAC.ConsoleUI.Wait, FireDAC.Comp.UI,
  FireDAC.Phys.SQLite, Data.DB, FireDAC.Comp.Client, FireDAC.dAPT;

type
  TDmDatabase = class(TDataModule)
    cn: TFDConnection;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDSQLiteSecurity1: TFDSQLiteSecurity;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmDatabase: TDmDatabase;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
