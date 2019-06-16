object SIS09997: TSIS09997
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Ambiente'
  ClientHeight = 104
  ClientWidth = 445
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  ShowHint = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dxBevel2: TdxBevel
    Left = 0
    Top = 22
    Width = 50
    Height = 50
  end
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 445
    Height = 104
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    TabOrder = 0
    LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
    object cxAmbiente: TcxComboBox
      Left = 10
      Top = 28
      Hint = 'Selecione o Ambiente de Trabalho'
      Properties.DropDownListStyle = lsEditFixedList
      Style.HotTrack = False
      TabOrder = 0
      Width = 121
    end
    object cxButton1: TcxButton
      Left = 10
      Top = 55
      Width = 75
      Height = 25
      Action = actMudar
      TabOrder = 1
    end
    object cxButton2: TcxButton
      Left = 91
      Top = 55
      Width = 75
      Height = 25
      Action = actCancelar
      TabOrder = 2
    end
    object dxLayoutControl1Group_Root: TdxLayoutGroup
      AlignHorz = ahParentManaged
      AlignVert = avParentManaged
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object dxLayoutControl1Item2: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      CaptionOptions.Text = 'Ambiente de Trabalho'
      CaptionOptions.Layout = clTop
      Control = cxAmbiente
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item3: TdxLayoutItem
      Parent = dxLayoutControl1Group1
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = cxButton1
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item4: TdxLayoutItem
      Parent = dxLayoutControl1Group1
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      Control = cxButton2
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Group1: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutControl1Group_Root
      LayoutDirection = ldHorizontal
      Index = 1
      AutoCreated = True
    end
  end
  object aclAmbiente: TActionList
    Images = dm.cxImageList1
    Left = 320
    Top = 32
    object actMudar: TAction
      Category = 'Ambiente'
      Caption = 'Mudar'
      Hint = 'Mudar o Ambiente'
      ImageIndex = 51
      OnExecute = actMudarExecute
    end
    object actCancelar: TAction
      Category = 'Ambiente'
      Caption = 'Cancelar'
      Hint = 'Cancelar'
      ImageIndex = 62
      OnExecute = actCancelarExecute
    end
  end
end
