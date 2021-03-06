program projeto;

uses
  Vcl.Forms,
  uViewAlunos in 'view\uViewAlunos.pas' {frmCadastroAlunos},
  uAlunoModel in 'model\uAlunoModel.pas',
  uAlunoController in 'controller\uAlunoController.pas',
  uAlunoDao in 'dao\uAlunoDao.pas',
  uDB in 'helpers\uDB.pas',
  uDao in 'helpers\uDao.pas',
  uHelpers in 'helpers\uHelpers.pas',
  uDmDatabase in 'db\uDmDatabase.pas' {DmDatabase: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCadastroAlunos, frmCadastroAlunos);
  Application.CreateForm(TDmDatabase, DmDatabase);
  AlunoDao := TAlunoDao.Create();
  AlunoController := TAlunoController.Create();
  DB := TDB.Create(DmDatabase.cn);
  DB.connect();

  frmCadastroAlunos.BuscarAlunos();

  Application.Run;
end.
