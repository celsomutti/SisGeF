object frmOperacaoRepositor: TfrmOperacaoRepositor
  Left = 0
  Top = 0
  Caption = 'Repositor / Entregador'
  ClientHeight = 169
  ClientWidth = 522
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 522
    Height = 169
    Align = alClient
    TabOrder = 0
    LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
    OptionsImage.Images = dm.cxImageList1
    object cxCodigo: TcxButtonEdit
      Left = 10
      Top = 56
      Hint = 'C'#243'digo do Repositor/Entregador'
      Properties.Buttons = <
        item
          Action = acrListaApoio
          Default = True
          Kind = bkGlyph
        end>
      Properties.ClickKey = 120
      Properties.IgnoreMaskBlank = True
      Properties.Images = dm.cxImageList1
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d\d\d\d\d\d'
      Properties.OnValidate = cxCodigoPropertiesValidate
      Style.HotTrack = False
      TabOrder = 1
      Width = 79
    end
    object cxNome: TcxTextEdit
      Left = 95
      Top = 56
      Hint = 'Nome do Entregador/Repositor'
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 2
      Width = 410
    end
    object cxLabel1: TcxLabel
      Left = 23
      Top = 10
      Caption = 
        'Informe o Repositor ou o Entregador que ir'#225' realizar a entrega n' +
        'o setor.'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.IsFontAssigned = True
      Properties.WordWrap = True
      Transparent = True
      Width = 476
    end
    object cxButton1: TcxButton
      Left = 352
      Top = 134
      Width = 79
      Height = 25
      Action = actGravar
      Default = True
      TabOrder = 5
    end
    object cxButton2: TcxButton
      Left = 437
      Top = 134
      Width = 75
      Height = 25
      Action = actSair
      Cancel = True
      TabOrder = 6
    end
    object cxData: TcxDateEdit
      Left = 10
      Top = 103
      Hint = 'Data inicial da aus'#234'ncia'
      Properties.ReadOnly = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.HotTrack = False
      TabOrder = 3
      Width = 111
    end
    object cxDataFinal: TcxDateEdit
      Left = 127
      Top = 103
      Style.HotTrack = False
      TabOrder = 4
      Width = 106
    end
    object dxLayoutControl1Group_Root: TdxLayoutGroup
      AlignHorz = ahParentManaged
      AlignVert = avParentManaged
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object dxLayoutControl1Item1: TdxLayoutItem
      Parent = dxLayoutControl1Group1
      CaptionOptions.ImageIndex = 45
      CaptionOptions.Text = 'C'#243'digo'
      CaptionOptions.Layout = clTop
      Control = cxCodigo
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item2: TdxLayoutItem
      Parent = dxLayoutControl1Group1
      CaptionOptions.ImageIndex = 45
      CaptionOptions.Text = 'Nome'
      CaptionOptions.Layout = clTop
      Control = cxNome
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Item3: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahCenter
      CaptionOptions.Text = 'cxLabel1'
      CaptionOptions.Visible = False
      Control = cxLabel1
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Group1: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutControl1Group_Root
      LayoutDirection = ldHorizontal
      Index = 1
      AutoCreated = True
    end
    object dxLayoutControl1Item4: TdxLayoutItem
      Parent = dxLayoutControl1Group3
      AlignHorz = ahRight
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
      Control = cxButton1
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item5: TdxLayoutItem
      Parent = dxLayoutControl1Group3
      AlignHorz = ahRight
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
      Control = cxButton2
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Group3: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutControl1Group_Root
      AlignVert = avBottom
      LayoutDirection = ldHorizontal
      Index = 3
      AutoCreated = True
    end
    object dxLayoutControl1Group2: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutControl1Group_Root
      LayoutDirection = ldHorizontal
      Index = 2
      AutoCreated = True
    end
    object dxLayoutControl1Item6: TdxLayoutItem
      Parent = dxLayoutControl1Group2
      AlignHorz = ahLeft
      CaptionOptions.ImageIndex = 7
      CaptionOptions.Text = 'Data'
      CaptionOptions.Layout = clTop
      Control = cxData
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item7: TdxLayoutItem
      Parent = dxLayoutControl1Group2
      CaptionOptions.ImageIndex = 7
      CaptionOptions.Text = 'Data Final'
      CaptionOptions.Layout = clTop
      Control = cxDataFinal
      ControlOptions.ShowBorder = False
      Index = 1
    end
  end
  object aclOperacaoRepositor: TActionList
    Images = dm.cxImageList1
    Left = 488
    Top = 88
    object actGravar: TAction
      Category = 'Opera'#231#227'o Repositor'
      Caption = 'Gravar'
      Hint = 'Confirme o Repositor/Entregador'
      ImageIndex = 9
      OnExecute = actGravarExecute
    end
    object actSair: TAction
      Category = 'Opera'#231#227'o Repositor'
      Caption = 'Sair'
      Hint = 'Cancelar e Sair'
      ImageIndex = 103
      OnExecute = actSairExecute
    end
    object acrListaApoio: TAction
      Category = 'Opera'#231#227'o Repositor'
      Caption = 'Lista'
      Hint = 'lista de Apoio de Entregadores/Repositores'
      ImageIndex = 11
      OnExecute = acrListaApoioExecute
    end
  end
end
