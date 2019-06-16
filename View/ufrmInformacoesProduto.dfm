object frmInformacoesProduto: TfrmInformacoesProduto
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Informa'#231#245'es do Produto'
  ClientHeight = 129
  ClientWidth = 356
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 356
    Height = 129
    Align = alClient
    TabOrder = 0
    LayoutLookAndFeel = dxLayoutCxLookAndFeel1
    object cxVolume: TcxSpinEdit
      Left = 94
      Top = 10
      Properties.Alignment.Horz = taRightJustify
      Style.HotTrack = False
      TabOrder = 0
      Width = 121
    end
    object cxPesoProduto: TcxCalcEdit
      Left = 94
      Top = 37
      Hint = 'Peso do Produto'
      EditValue = 0.000000000000000000
      Properties.Alignment.Horz = taRightJustify
      Properties.ButtonGlyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000808040808040
        8080408080408080408080408080408080408080408080408080408080408080
        4080804080804080804080804080804091919189888887868687878788888789
        8988898888888888888887878686878685979797808040808040808040808040
        888888C2C2C1BCBCBCBCBCBCBCBCBBBCBCBBBCBCBBBCBCBBBCBCBBBCBCBBC2C2
        C18B8B8A8080408080408080408080408C8C8BFFFFFFEBEBEBEBEBEBE9E9E9E8
        E8E8E7E7E7E7E7E7E6E6E6E6E6E6FFFFFF8E8D8C808040808040808040808040
        929191FFFFFFB4B4B4949494E7E7E7B2B2B2939393E3E3E3B0B0B0919191FBFB
        FB929291808040808040808040808040959595FFFFFFE8E8E8E7E7E7E5E5E5E3
        E3E3E2E2E2E0E0E0DFDFDFDCDCDCFFFFFF959595808040808040808040808040
        9A9A99FFFFFFB1B1B1919191E2E2E2ADADAD8F8F8FDCDCDCA9A9A98D8D8DFBFB
        FB9A99998080408080408080408080409E9D9DFFFFFFE3E3E3E1E1E1DCDCDCDB
        DBDBD7D7D7D3D3D3D3D3D3D1D1D1FFFFFF9E9D9C808040808040808040808040
        A0A0A0FFFFFFADADAD8E8E8ED8D8D8A5A5A58A8A8ACECECE7374E85258DBFBFB
        FB9E9E9E808040808040808040808040A3A3A3FCFCFCDADADAD7D7D7D2D2D2CE
        CECEC9C9C9C5C5C5C2C2C2BFBFBFFFFFFFA0A0A0808040808040808040808040
        A3A3A3FFFFFFB07B56C38D67C58F68C69069C8926BCA946CCA956EB07B56FFFF
        FFA1A09F808040808040808040808040A4A4A4FFFFFFB07B56C18B64C38D66C5
        8F67C69069C8926BCA946CB07B56FFFFFFA0A0A0808040808040808040808040
        A3A3A3FFFFFFA7724DA7724DA7724DA7724DA7724DA7724DA7724DA7724DFFFF
        FF9E9E9E808040808040808040808040AAAAAAFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA3A3A3808040808040808040808040
        B3B3B3A9A9A9A8A8A8ABABABACACACADADADACACACABABABA8A8A8A4A4A4A3A3
        A3B5B5B580804080804080804080804080804080804080804080804080804080
        8040808040808040808040808040808040808040808040808040}
      Style.HotTrack = False
      TabOrder = 1
      Width = 121
    end
    object cxForaContainer: TcxCheckBox
      Left = 10
      Top = 64
      Hint = 
        'Selecione esta op'#231#227'o caso o produto n'#227'o possa ser colocado em co' +
        'ntainer'
      Caption = 'Produto fora do Container'
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'N'
      State = cbsGrayed
      Style.HotTrack = False
      TabOrder = 2
      Transparent = True
      Width = 121
    end
    object cxButton1: TcxButton
      Left = 10
      Top = 89
      Width = 95
      Height = 25
      Cursor = crHandPoint
      Action = actAceitar
      TabOrder = 3
    end
    object cxButton2: TcxButton
      Left = 111
      Top = 89
      Width = 104
      Height = 25
      Cursor = crHandPoint
      Action = actCancelar
      TabOrder = 4
    end
    object dxLayoutControl1Group_Root: TdxLayoutGroup
      AlignHorz = ahLeft
      AlignVert = avTop
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object dxLayoutControl1Item1: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      CaptionOptions.Text = 'Volume N'#186
      Control = cxVolume
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item2: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      CaptionOptions.Text = 'Peso do Produto'
      Control = cxPesoProduto
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Item3: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      CaptionOptions.Text = 'cxCheckBox1'
      CaptionOptions.Visible = False
      Control = cxForaContainer
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutControl1Item4: TdxLayoutItem
      Parent = dxLayoutControl1Group1
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = cxButton1
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item5: TdxLayoutItem
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
      Index = 3
      AutoCreated = True
    end
  end
  object dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList
    Left = 304
    object dxLayoutCxLookAndFeel1: TdxLayoutCxLookAndFeel
    end
  end
  object aclInformacaoProduto: TActionList
    Images = dm.cxImageList1
    Left = 240
    object actAceitar: TAction
      Category = 'Informa'#231#245'es do Produto'
      Caption = 'Aceitar'
      Hint = 'Aceitar Informa'#231#245'es'
      ImageIndex = 0
      OnExecute = actAceitarExecute
    end
    object actCancelar: TAction
      Category = 'Informa'#231#245'es do Produto'
      Caption = 'Cancelar'
      Hint = 'Cancelar'
      ImageIndex = 6
      OnExecute = actCancelarExecute
    end
  end
end
