unit uDatabase;

interface

uses
  uDB;

type

  TDataBase = class
  private

    procedure CreateTableAlunos();
  public

    procedure CreateTables();

    procedure CreateDataBase();

  end;

implementation

uses
  FireDAC.Comp.Client;

{ TDataBase }

procedure TDataBase.CreateDataBase;
begin
  CreateTables();
end;

procedure TDataBase.CreateTableAlunos;
var
  Qr: TFDQuery;
begin
  DB.instanceQuery(Qr);
  try
    DB.startTransaction();
    Qr.SQL.Add('Create Table IF NOT EXISTS Alunos ');
    Qr.SQL.Add('( id integer PRIMARY KEY AUTOINCREMENT,');
    Qr.SQL.Add(' nome varchar(100) ,');
    Qr.SQL.Add(' sobrenome varchar(100),');
    Qr.SQL.Add(' data_nascimento date,');
    Qr.SQL.Add(' turma varchar(50));');
    Qr.ExecSQL();
    DB.commit();
  finally
    Qr.Free();
  end;

end;

procedure TDataBase.CreateTables;
begin
  CreateTableAlunos();
end;

end.
