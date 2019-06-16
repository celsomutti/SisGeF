object frmValor: TfrmValor
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Valor'
  ClientHeight = 108
  ClientWidth = 277
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lcValor: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 277
    Height = 108
    Align = alClient
    TabOrder = 0
    LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
    OptionsImage.Images = dm.cxImageList1
    object curValor: TcxCurrencyEdit
      Left = 10
      Top = 30
      EditValue = 0.000000000000000000
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0.00;-,0.00'
      Style.HotTrack = False
      TabOrder = 0
      Width = 121
    end
    object cxButton1: TcxButton
      Left = 111
      Top = 57
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Action = actOK
      Default = True
      TabOrder = 1
    end
    object cxButton2: TcxButton
      Left = 192
      Top = 57
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Action = actCancelar
      Cancel = True
      TabOrder = 2
    end
    object lcValorGroup_Root: TdxLayoutGroup
      AlignHorz = ahParentManaged
      AlignVert = avParentManaged
      LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object lciValor: TdxLayoutItem
      Parent = lcValorGroup_Root
      CaptionOptions.ImageIndex = 81
      CaptionOptions.Text = 'Valor'
      CaptionOptions.Layout = clTop
      Control = curValor
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lcValorItem1: TdxLayoutItem
      Parent = lcValorGroup1
      AlignHorz = ahRight
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = cxButton1
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lcValorItem2: TdxLayoutItem
      Parent = lcValorGroup1
      AlignHorz = ahRight
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      Control = cxButton2
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lcValorGroup1: TdxLayoutAutoCreatedGroup
      Parent = lcValorGroup_Root
      LayoutDirection = ldHorizontal
      Index = 1
      AutoCreated = True
    end
  end
  object aclValor: TActionList
    Images = dm.cxImageList1
    Left = 112
    object actOK: TAction
      Category = 'Valor'
      Caption = 'OK'
      ImageIndex = 0
      OnExecute = actOKExecute
    end
    object actCancelar: TAction
      Category = 'Valor'
      Caption = 'Cancelar'
      ImageIndex = 6
      OnExecute = actCancelarExecute
    end
  end
end
