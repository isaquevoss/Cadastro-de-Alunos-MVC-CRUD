unit uAlunoController;

interface

  uses
    uAlunoModel, uAlunoDao, System.Generics.Collections;

type

  TAlunoController = class
  private

  public
    function BuscarTodosAlunos(): TList<TAluno>;
    function GravarAluno(_Aluno: TAluno): Boolean;
    function DeletarAluno(_Aluno: TAluno): Boolean;
  end;

  var
    AlunoController: TAlunoController;

implementation

{ TAlunoController }

function TAlunoController.BuscarTodosAlunos: TList<TAluno>;
begin
  Result := AlunoDao.get();
end;

function TAlunoController.DeletarAluno(_Aluno: TAluno): Boolean;
begin
  try
    AlunoDao.delete(_Aluno);
  except
    Result := False;
  end;
  Result := true;
end;

function TAlunoController.GravarAluno(_Aluno: TAluno): Boolean;

begin
  try
    AlunoDao.save(_Aluno);
  except
    Result := False;
  end;
  Result := true;
end;

end.
