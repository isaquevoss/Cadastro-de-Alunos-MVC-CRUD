unit uDB;

interface

uses
  FireDAC.Comp.Client, System.Classes;

type
  TDB = class
  private
    Fqr: TFDQuery;
    Ftr: TFDTransaction;
    Fcn: TFDConnection;

    procedure CreateTableAlunos();
    procedure CreateTables();
    procedure CreateDataBase();

  public
    property cn: TFDConnection read Fcn write Fcn;
    property qr: TFDQuery read Fqr write Fqr;
    property tr: TFDTransaction read Ftr write Ftr;

    procedure startTransaction();
    procedure commit();
    procedure rollback();
    procedure instanceQuery(var _qr: TFDQuery);
    procedure connect();

    constructor Create(_cn: TFDConnection);
  end;

var
  DB: TDB;

implementation

uses
  FireDAC.Stan.Option;

{ TDB }

procedure TDB.commit;
begin
  if tr.Active then
    tr.commit();
end;

procedure TDB.connect;

begin
  cn.Params.Clear();
  cn.Params.Add('DriverID=SQLite');
  cn.Params.Add('Database=AlunoCrudMVC.sdb');
  cn.Open();

  CreateDataBase();
end;

constructor TDB.Create(_cn: TFDConnection);
begin
  Self.cn := _cn;
  Self.qr := TFDQuery.Create(nil);
  Self.tr := TFDTransaction.Create(nil);

  Self.tr.Connection := _cn;
  Self.qr.Connection := Self.cn;
  Self.qr.Transaction := Self.tr;
  Self.qr.updateTransaction := Self.tr;
  Self.tr.Options.AutoCommit := false;
  Self.tr.Options.AutoStart := true;
  Self.tr.Options.AutoStop := false;
  Self.tr.Options.DisconnectAction := xdRollback;

end;

procedure TDB.CreateDataBase;
begin
  CreateTables();
end;

procedure TDB.CreateTableAlunos;
var
  qr: TFDQuery;
begin
  instanceQuery(qr);
  try
    startTransaction();
    qr.SQL.Add('Create Table IF NOT EXISTS Alunos ');
    qr.SQL.Add('( id integer PRIMARY KEY AUTOINCREMENT,');
    qr.SQL.Add(' nome varchar(100) ,');
    qr.SQL.Add(' sobrenome varchar(100),');
    qr.SQL.Add(' data_nascimento date,');
    qr.SQL.Add(' turma varchar(50));');
    qr.ExecSQL();
    commit();
  finally
    qr.Free();
  end;
end;

procedure TDB.CreateTables;
begin
  CreateTableAlunos();
end;

procedure TDB.instanceQuery(var _qr: TFDQuery);
begin
  _qr := TFDQuery.Create(nil);
  _qr.Connection := cn;
  _qr.Transaction := tr;
end;

procedure TDB.rollback;
begin
  if tr.Active then
    tr.rollback();
end;

procedure TDB.startTransaction();
begin
  if not(tr.Active) then
    tr.startTransaction();
end;

end.
