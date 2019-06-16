object view_CadastroProdutoVA: Tview_CadastroProdutoVA
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro de Produdos de Venda Avulsa'
  ClientHeight = 178
  ClientWidth = 531
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 13
  object lcCadastro: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 531
    Height = 178
    Align = alClient
    TabOrder = 0
    LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
    object edtBarras: TcxTextEdit
      Left = 10
      Top = 28
      Hint = 'C'#243'digo de Barras'
      TabStop = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 0
      Width = 121
    end
    object edtCodigo: TcxTextEdit
      Left = 10
      Top = 73
      Hint = 'C'#243'digo do Produto'
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 20
      Style.HotTrack = False
      TabOrder = 1
      Width = 103
    end
    object edtDescricao: TcxTextEdit
      Left = 119
      Top = 73
      Hint = 'Descri'#231#227'o do Produto'
      Properties.CharCase = ecUpperCase
      Style.HotTrack = False
      TabOrder = 2
      Width = 121
    end
    object btnGravar: TcxButton
      Left = 365
      Top = 143
      Width = 75
      Height = 25
      Action = actGravar
      TabOrder = 3
    end
    object btnCancelar: TcxButton
      Left = 446
      Top = 143
      Width = 75
      Height = 25
      Action = actCancelar
      Cancel = True
      TabOrder = 4
    end
    object lcgRoot: TdxLayoutGroup
      AlignHorz = ahParentManaged
      AlignVert = avParentManaged
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object lciBarras: TdxLayoutItem
      Parent = lcgRoot
      CaptionOptions.Text = 'C'#243'digo de Barras'
      CaptionOptions.Layout = clTop
      Control = edtBarras
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lciCodigo: TdxLayoutItem
      Parent = lcgProduto
      AlignHorz = ahLeft
      CaptionOptions.Text = 'C'#243'digo Produto'
      CaptionOptions.Layout = clTop
      Control = edtCodigo
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lciDescricao: TdxLayoutItem
      Parent = lcgProduto
      AlignHorz = ahClient
      CaptionOptions.Text = 'Descri'#231#227'o do Produto'
      CaptionOptions.Layout = clTop
      Control = edtDescricao
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lcgProduto: TdxLayoutAutoCreatedGroup
      Parent = lcgRoot
      LayoutDirection = ldHorizontal
      Index = 1
      AutoCreated = True
    end
    object lciGravar: TdxLayoutItem
      Parent = lcgOpcoes
      AlignHorz = ahRight
      AlignVert = avBottom
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnGravar
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lciCancelar: TdxLayoutItem
      Parent = lcgOpcoes
      AlignHorz = ahRight
      AlignVert = avBottom
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnCancelar
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lcgOpcoes: TdxLayoutAutoCreatedGroup
      Parent = lcgRoot
      AlignVert = avBottom
      LayoutDirection = ldHorizontal
      Index = 2
      AutoCreated = True
    end
  end
  object aclCadastro: TActionList
    Images = dm.iml16x16
    Left = 448
    object actGravar: TAction
      Category = 'Cadastro'
      Caption = 'Gravar'
      Hint = 'Gravar os dados'
      ImageIndex = 32
      OnExecute = actGravarExecute
    end
    object actCancelar: TAction
      Category = 'Cadastro'
      Caption = 'Cancelar'
      Hint = 'Cancelar'
      ImageIndex = 4
      OnExecute = actCancelarExecute
    end
  end
end
