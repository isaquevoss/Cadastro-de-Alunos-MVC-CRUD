unit uAlunoDao;

interface

uses uAlunoModel, System.Generics.Collections, Data.DB, uDao;

type

  TAlunoDao = class
  private
    function select(where: string): TDataSet;
  public
    procedure delete(aluno: TAluno);
    procedure save(aluno: TAluno);
    function find(_id: integer): TAluno;
    function get(_conditions: TList<TCondition> = nil;
      order: TList<TOrderby> = nil): TList<TAluno>;

  end;

var
  AlunoDao: TAlunoDao;

implementation

uses
  uDb, FireDAC.Comp.Client, System.SysUtils, System.Variants, uHelpers;

procedure TAlunoDao.delete(aluno: TAluno);
var
  qr: TFDQuery;
begin
  DB.instanceQuery(qr);
  try
    qr.SQL.Add('delete from alunos where id = :id');
    qr.ParamByName('id').AsInteger := aluno.id;
    qr.ExecSQL();
  finally
    qr.Free();
  end;

end;

function TAlunoDao.find(_id: integer): TAluno;
var
  ds: TDataSet;
begin
  ds := select('id = ' + IntToStr(_id));

end;

function TAlunoDao.get(_conditions: TList<TCondition> = nil;
  order: TList<TOrderby> = nil): TList<TAluno>;
var
  ds: TDataSet;
  _Aluno: TAluno;
  _Alunos: TList<TAluno>;
begin
  ds := select('');

  try
    ds.First();

    _Alunos := TList<TAluno>.Create();;

    while not ds.Eof do
    begin
      _Aluno := TAluno.Create();
      _Aluno.id := ds.FieldByName('id').AsInteger;
      _Aluno.nome := ds.FieldByName('nome').AsString;
      _Aluno.sobrenome := ds.FieldByName('sobrenome').AsString;
      _Aluno.data_nascimento := ds.FieldByName('data_nascimento').AsDateTime;
      _Aluno.turma := ds.FieldByName('turma').AsString;
      _Alunos.Add(_Aluno);
      ds.Next();
    end;
    Result := _Alunos;
  finally
    ds.Free();
  end;

end;

procedure TAlunoDao.save(aluno: TAluno);
var
  qr: TFDQuery;
begin
  DB.instanceQuery(qr);
  try
    qr.SQL.Add
      ('insert or replace into alunos(id,nome,sobrenome,turma,data_nascimento) values(:id,:nome,:sobrenome,:turma,:data_nascimento);');
    if aluno.id > 0 then
      qr.ParamByName('id').AsInteger := aluno.id
    else
      qr.ParamByName('id').DataType := ftInteger;
    qr.ParamByName('nome').AsString := aluno.nome;
    qr.ParamByName('sobrenome').AsString := aluno.sobrenome;
    qr.ParamByName('turma').AsString := aluno.turma;
    qr.ParamByName('data_nascimento').AsDate := aluno.data_nascimento;
    qr.Prepare();
    qr.ExecSQL();

    aluno.id :=  GetLastInsertRowID(DB.cn);
  finally
    qr.Free();
  end;

end;

function TAlunoDao.select(where: string): TDataSet;
var
  qr: TFDQuery;
begin
  DB.instanceQuery(qr);

  qr.SQL.Add('select * from alunos');
  if where <> '' then
    qr.SQL.Add(' where ' + where);
  qr.Open();

  Result := qr;

end;

end.
