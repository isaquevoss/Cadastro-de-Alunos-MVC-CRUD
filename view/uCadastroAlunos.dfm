object frmCadastroAlunos: TfrmCadastroAlunos
  Left = 0
  Top = 0
  Caption = 'frmCadastroAlunos'
  ClientHeight = 542
  ClientWidth = 889
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object BtCadastrarAluno: TButton
    Left = 40
    Top = 48
    Width = 129
    Height = 25
    Caption = 'Cadastrar Novo Aluno'
    TabOrder = 0
    OnClick = BtCadastrarAlunoClick
  end
  object BtAlterarAluno: TButton
    Left = 200
    Top = 48
    Width = 129
    Height = 25
    Caption = 'Alterar Aluno'
    TabOrder = 1
    OnClick = BtAlterarAlunoClick
  end
  object BtDeletarAluno: TButton
    Left = 360
    Top = 48
    Width = 129
    Height = 25
    Caption = 'Deletar Aluno'
    TabOrder = 2
    OnClick = BtDeletarAlunoClick
  end
  object pgControl: TPageControl
    Left = 0
    Top = 86
    Width = 889
    Height = 456
    ActivePage = tsAluno
    Align = alBottom
    TabOrder = 3
    ExplicitTop = 112
    ExplicitWidth = 814
    object tsListaAlunos: TTabSheet
      Caption = 'Lista de Alunos'
      ExplicitWidth = 785
      ExplicitHeight = 397
      object Grid: TStringGrid
        Left = 0
        Top = 0
        Width = 881
        Height = 428
        Align = alClient
        FixedCols = 0
        TabOrder = 0
        OnSelectCell = GridSelectCell
        ExplicitLeft = 192
        ExplicitTop = 88
        ExplicitWidth = 320
        ExplicitHeight = 120
        ColWidths = (
          64
          221
          225
          205
          156)
      end
    end
    object tsAluno: TTabSheet
      Caption = 'Aluno'
      ImageIndex = 1
      ExplicitLeft = 0
      object Label1: TLabel
        Left = 293
        Top = 31
        Width = 14
        Height = 13
        Caption = 'Id:'
      end
      object Label2: TLabel
        Left = 77
        Top = 155
        Width = 34
        Height = 13
        Caption = 'Turma:'
      end
      object Label3: TLabel
        Left = 80
        Top = 59
        Width = 31
        Height = 13
        Caption = 'Nome:'
      end
      object Label4: TLabel
        Left = 53
        Top = 91
        Width = 58
        Height = 13
        Caption = 'Sobrenome:'
      end
      object Label5: TLabel
        Left = 11
        Top = 124
        Width = 100
        Height = 13
        Caption = 'Data de Nascimento:'
      end
      object BtCancelar: TButton
        Left = 36
        Top = 360
        Width = 75
        Height = 25
        Caption = 'Cancelar'
        TabOrder = 0
      end
      object btGravarAluno: TButton
        Left = 140
        Top = 360
        Width = 75
        Height = 25
        Caption = 'Gravar'
        TabOrder = 1
        OnClick = btGravarAlunoClick
      end
      object EdNome: TEdit
        Left = 124
        Top = 56
        Width = 265
        Height = 21
        TabOrder = 3
        Text = 'EdNome'
      end
      object EdTurma: TEdit
        Left = 124
        Top = 153
        Width = 265
        Height = 21
        TabOrder = 6
        Text = 'Edit1'
      end
      object EdId: TEdit
        Left = 320
        Top = 29
        Width = 69
        Height = 21
        Enabled = False
        TabOrder = 2
        Text = 'Edit1'
      end
      object EdSobreNome: TEdit
        Left = 124
        Top = 88
        Width = 265
        Height = 21
        TabOrder = 4
        Text = 'Edit1'
      end
      object DtDataNascimento: TDateTimePicker
        Left = 124
        Top = 121
        Width = 265
        Height = 21
        Date = 43971.000000000000000000
        Time = 0.869422465279058100
        TabOrder = 5
      end
    end
  end
end
