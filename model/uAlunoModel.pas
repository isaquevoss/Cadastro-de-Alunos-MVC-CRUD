unit uAlunoModel;

interface

type

  TAluno = class
  private
    Fid: integer;
    Fnome: string;
    Fsobrenome: string;
    Fturma: string;
    Fdata_nascimento: TDate;
  public
    property id: integer read Fid write Fid;
    property nome: string read Fnome write Fnome;
    property sobrenome: string read Fsobrenome write Fsobrenome;
    property turma: string read Fturma write Fturma;
    property data_nascimento: TDate read Fdata_nascimento write Fdata_nascimento;

  end;

implementation

end.
