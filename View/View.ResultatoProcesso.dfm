object view_ResultadoProcesso: Tview_ResultadoProcesso
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Resultado do Processo'
  ClientHeight = 324
  ClientWidth = 718
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object lcResultado: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 718
    Height = 324
    Align = alClient
    TabOrder = 0
    LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
    object edtResultado: TcxMemo
      Left = 10
      Top = 28
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 0
      Height = 237
      Width = 698
    end
    object btnOK: TcxButton
      Left = 633
      Top = 289
      Width = 75
      Height = 25
      Action = actOK
      TabOrder = 1
    end
    object lcgRoot: TdxLayoutGroup
      AlignHorz = ahParentManaged
      AlignVert = avClient
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object lctResultado: TdxLayoutItem
      Parent = lcgRoot
      AlignVert = avClient
      CaptionOptions.Text = 'Resultado'
      CaptionOptions.Layout = clTop
      Control = edtResultado
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lciOK: TdxLayoutItem
      Parent = lcgRoot
      AlignHorz = ahRight
      AlignVert = avBottom
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnOK
      ControlOptions.ShowBorder = False
      Index = 1
    end
  end
  object aclResultado: TActionList
    Images = dm.iml16x16
    Left = 584
    Top = 16
    object actOK: TAction
      Caption = 'OK'
      ImageIndex = 3
      OnExecute = actOKExecute
    end
  end
end
