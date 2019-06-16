object frmOS: TfrmOS
  Left = 0
  Top = 0
  Caption = 'Ordem de Servi'#231'o'
  ClientHeight = 517
  ClientWidth = 1053
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  ShowHint = True
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 1053
    Height = 517
    Align = alClient
    TabOrder = 0
    LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
    object cxLabel27: TcxLabel
      AlignWithMargins = True
      Left = 10
      Top = 10
      AutoSize = False
      Caption = 'Ordem de Servi'#231'o'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -21
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.IsFontAssigned = True
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      Height = 39
      Width = 1011
      AnchorY = 30
    end
    object cxDataOS: TcxDateEdit
      Left = 179
      Top = 55
      Hint = 'Data da Ordem de Setvi'#231'o'
      Properties.ButtonGlyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000006565
        65C4919191FF919191FF919191FF919191FF919191FF919191FF919191FF9191
        91FF919191FF919191FF919191FF919191FF797979E000000000000000009595
        95FFBFBFBFFFC3C3C3FFC3C3C3FFC3C3C3FFC3C3C3FFC3C3C3FFC3C3C3FFC3C3
        C3FFC3C3C3FFC4C4C4FFC5C5C5FFC2C2C2FF959595FF0000000000000000BCBC
        BCFFE2E2E2F1F9F9F9FDFCFCFCFFFCFCFCFFFCFCFCFFF9F9F9FFF6F6F6FFECEC
        ECFFD8D8D8FFE0E0E0FFFFFFFFFFF7F7F7FFC7C7C7FF0000000000000000C9C9
        C9FFF9F9F9FDFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFF8F8F8FFF3F3F3FFEBEB
        EBFFDBDBDBFFFDFDFDFFE2E2E2FFFFFFFFFFCCCCCCFF0000000000000001C9C9
        C9FFFCFCFCFFFBFBFBFFFBFBFBFFFBFBFBFFAEAEAEFFF9F9F9FFBEBEBEFFE0E0
        E0FFDDDDDDFFFCFCFCFFFDFDFDFFE0E0E0FFCBCBCBFF0000000000000001C9C9
        C9FFFCFCFCFFFBFBFBFFFBFBFBFFFBFBFBFFAEAEAEFFFAFAFAFFE8E8E8FFBABA
        BAFFE0E0E0FFDFDFDFFFDDDDDDFFDBDBDBFFC7C7C7FF0000000100000001C9C9
        C9FFFCFCFCFFFBFBFBFFFCFCFCFFFCFCFCFFAEAEAEFFFAFAFAFFF8F8F8FFBCBC
        BCFFE5E5E5FFF6F6F6FFF3F3F3FFEFEFEFFFC8C8C8FF0000000100000001C9C9
        C9FFFCFCFCFFFCFCFCFFFCFCFCFFCBCBCBFFAFAFAFFFFBFBFBFFF9F9F9FFE8E8
        E8FFC2C2C2FFFBFBFBFFFAFAFAFFF8F8F8FFC8C8C8FF0000000100000001C9C9
        C9FFFCFCFCFFFCFCFCFFFCFCFCFFF5F5F5FFCBCBCBFFEEEEEEFFCACACAFFC7C7
        C7FFB8B8B8FFFFFFFFFFFEFEFEFFFCFCFCFFC9C9C9FF0000000100000001C9C9
        C9FFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFBFB
        FBFFF7F7F7FFF7F7F7FFFFFFFFFFFCFCFCFFC9C9C9FF00000001000000010000
        DCFF1313F3FF3B3BE9FF3333E8FF2D2DE7FF2828E3FF2323E1FF1E1EDFFF1B1B
        DDFF1717DCFF1414DBFF1111DCFF0404EDFF0000DCFF00000001000000010000
        DCFF0F0FEBFF2828BDFF1C1C98FF1F1FBCFF1E1EDDFF1B1BDFFF1616DEFF1212
        D7FF0D0DB5FF080892FF0606B4FF0101E6FF0000DCFF00000001000000010000
        DCFF0B0BDAFFA1A1AEFFE0E0E0FF9F9FAEFF1414CEFF1212E1FF0E0EE1FF0909
        CCFF9E9EAEFFE0E0E0FF9E9EAEFF0000D7FF0000DCFF00000001000000010000
        DCFF0707D2FFC4C4D6FFE3E3E3FFC4C4D5FF0303D0FF0202EDFF0202EDFF0101
        CFFFC5C5D6FFE3E3E3FFC4C4D6FF0000CFFF0000DCFF00000001000000000000
        DCFF0000C7FFB5B5CBFFE6E6E6FFB3B3C9FF0000C7FF0000DCFF0000DCFF0000
        C7FFB8B8CEFFE6E6E6FFB6B6CDFF0000C7FF0000DCFF00000000000000000000
        0000000000010B0B0B44737373CA0B0B0B480000000400000001000000010000
        00040C0C0C3C797979C70B0B0B44000000010000000000000000}
      Properties.DateButtons = []
      Properties.ReadOnly = True
      Properties.ShowTime = False
      Style.HotTrack = False
      TabOrder = 2
      Width = 150
    end
    object cxCodCliente: TcxButtonEdit
      Left = 389
      Top = 55
      Hint = 'C'#243'digo do Cliente Solicitante'
      Properties.Buttons = <
        item
          Default = True
          ImageIndex = 11
          Kind = bkGlyph
        end>
      Properties.IgnoreMaskBlank = True
      Properties.Images = dm.cxImageList1
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d\d\d\d\d\d'
      Style.HotTrack = False
      TabOrder = 3
      Width = 68
    end
    object cxNomeSolicitante: TcxTextEdit
      Left = 463
      Top = 55
      Hint = 'Nome do Cliente Solicitante'
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 4
      Width = 580
    end
    object cxCodMotorista: TcxButtonEdit
      Left = 77
      Top = 82
      Properties.Buttons = <
        item
          Default = True
          ImageIndex = 11
          Kind = bkGlyph
        end>
      Properties.Images = dm.cxImageList1
      Style.HotTrack = False
      TabOrder = 5
      Width = 68
    end
    object cxNomeMotorista: TcxTextEdit
      Left = 151
      Top = 82
      Hint = 'Nome do Motorista'
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 6
      Width = 178
    end
    object cxPlacaVeiculo: TcxButtonEdit
      Left = 389
      Top = 82
      Hint = 'Placa do Ve'#237'culo'
      Properties.Buttons = <
        item
          Default = True
          ImageIndex = 11
          Kind = bkGlyph
        end>
      Properties.Images = dm.cxImageList1
      Style.HotTrack = False
      TabOrder = 7
      Width = 68
    end
    object cxKMInicial: TcxMaskEdit
      Left = 512
      Top = 82
      Hint = 'Km Inicial'
      Properties.Alignment.Horz = taRightJustify
      Properties.IgnoreMaskBlank = True
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d\d\d\d\d\d'
      Style.HotTrack = False
      TabOrder = 8
      Width = 65
    end
    object cxHoraSaida: TcxTimeEdit
      Left = 614
      Top = 82
      Hint = 'Hora da Sa'#237'da'
      EditValue = 0d
      Properties.TimeFormat = tfHourMin
      Style.HotTrack = False
      TabOrder = 9
      Width = 59
    end
    object cxMaskEdit1: TcxMaskEdit
      Left = 723
      Top = 82
      Properties.Alignment.Horz = taRightJustify
      Properties.IgnoreMaskBlank = True
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d\d\d\d\d\d'
      Style.HotTrack = False
      TabOrder = 10
      Width = 62
    end
    object cxHoraRetorno: TcxTimeEdit
      Left = 791
      Top = 82
      Hint = 'Hora de Retorno'
      EditValue = 0d
      Properties.TimeFormat = tfHourMin
      Style.HotTrack = False
      TabOrder = 11
      Width = 58
    end
    object cxStatus: TcxImageComboBox
      Left = 891
      Top = 82
      Properties.Images = dm.cxImageList1
      Properties.Items = <
        item
          Description = 'ABERTA'
          ImageIndex = 50
          Value = 'A'
        end
        item
          Description = 'FECHADA'
          ImageIndex = 0
          Value = 'F'
        end
        item
          Description = 'PAGA'
          ImageIndex = 81
          Value = 'P'
        end
        item
          Description = 'CANCELADA'
          ImageIndex = 62
          Value = 'C'
        end>
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 12
      Width = 152
    end
    object cxGrid1: TcxGrid
      Left = 10
      Top = 136
      Width = 1031
      Height = 340
      TabOrder = 14
      object cxGrid1DBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsServico
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0.00;- ,0.00'
            Kind = skSum
            Column = cxGrid1DBTableView1VAL_SERVICO
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.CopyCaptionsToClipboard = False
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsSelection.InvertSelect = False
        OptionsSelection.MultiSelect = True
        OptionsSelection.CellMultiSelect = True
        OptionsView.NoDataToDisplayInfoText = '<Nenhuma informa'#231#227'o dispon'#237'vel>'
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        object cxGrid1DBTableView1RecId: TcxGridDBColumn
          Caption = 'N'#186'.'
          DataBinding.FieldName = 'RecId'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.IgnoreMaskBlank = True
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d\d\d\d\d'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 48
        end
        object cxGrid1DBTableView1DES_SERVICO: TcxGridDBColumn
          DataBinding.FieldName = 'DES_SERVICO'
          PropertiesClassName = 'TcxButtonEditProperties'
          Properties.Buttons = <
            item
              Default = True
              ImageIndex = 11
              Kind = bkGlyph
            end>
          Properties.Images = dm.cxImageList1
          HeaderAlignmentHorz = taCenter
          Width = 862
        end
        object cxGrid1DBTableView1VAL_SERVICO: TcxGridDBColumn
          DataBinding.FieldName = 'VAL_SERVICO'
          PropertiesClassName = 'TcxCalcEditProperties'
          Properties.ButtonGlyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000656565D37F7E7EF5878686FF878787FF888887FF898988FF898888FF8888
            88FF888887FF878686FF807F7EF85F5F5FC70000000000000000000000000000
            0000848484FBC1C1C0FEBCBCBCFFBCBCBCFFBCBCBBFFBCBCBBFFBCBCBBFFBCBC
            BBFFBCBCBBFFBCBCBBFFC1C1C0FE828281F60000000000000000000000000000
            00008C8C8BFFFFFFFFFFEBEBEBFFEBEBEBFFE9E9E9FFE8E8E8FFE7E7E7FFE7E7
            E7FFE6E6E6FFE6E6E6FFFFFFFFFF8E8D8CFF0000000000000000000000000000
            0000929191FFFFFFFFFFB4B4B4FF949494FFE7E7E7FFB2B2B2FF939393FFE3E3
            E3FFB0B0B0FF919191FFFBFBFBFF929291FF0000000000000000000000000000
            0000959595FFFFFFFFFFE8E8E8FFE7E7E7FFE5E5E5FFE3E3E3FFE2E2E2FFE0E0
            E0FFDFDFDFFFDCDCDCFFFFFFFFFF959595FF0000000000000000000000000000
            00009A9A99FFFFFFFFFFB1B1B1FF919191FFE2E2E2FFADADADFF8F8F8FFFDCDC
            DCFFA9A9A9FF8D8D8DFFFBFBFBFF9A9999FF0000000000000000000000000000
            00009E9D9DFFFFFFFFFFE3E3E3FFE1E1E1FFDCDCDCFFDBDBDBFFD7D7D7FFD3D3
            D3FFD3D3D3FFD1D1D1FFFFFFFFFF9E9D9CFF0000000000000000000000000000
            0000A0A0A0FFFFFFFFFFADADADFF8E8E8EFFD8D8D8FFA5A5A5FF8A8A8AFFCECE
            CEFF7374E8FF5258DBFFFBFBFBFF9E9E9EFF0000000000000000000000000000
            0000A3A3A3FFFCFCFCFFDADADAFFD7D7D7FFD2D2D2FFCECECEFFC9C9C9FFC5C5
            C5FFC2C2C2FFBFBFBFFFFFFFFFFFA0A0A0FF0000000000000000000000000000
            0000A3A3A3FFFFFFFFFFB07B56FFC38D67FFC58F68FFC69069FFC8926BFFCA94
            6CFFCA956EFFB07B56FFFFFFFFFFA1A09FFF0000000000000000000000000000
            0000A4A4A4FFFFFFFFFFB07B56FFC18B64FFC38D66FFC58F67FFC69069FFC892
            6BFFCA946CFFB07B56FFFFFFFFFFA0A0A0FF0000000000000000000000000000
            00009F9F9FFBFEFEFEFEA7724DFFA7724DFFA7724DFFA7724DFFA7724DFFA772
            4DFFA7724DFFA7724DFFFFFFFFFF9E9E9EFF0000000000000000000000000000
            00007C7C7CD1EFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFF9F9F9F98A8A8AE60000000000000000000000000000
            00003E3E3E8A8D8D8DE3A8A8A8FFABABABFFACACACFFADADADFFACACACFFABAB
            ABFFA8A8A8FFA4A4A4FF8F8F8FEB484848920000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000}
          HeaderAlignmentHorz = taCenter
          Width = 114
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
    object cxRoteiro: TcxComboBox
      Left = 77
      Top = 109
      Hint = 'Rota ou Roteiro'
      Style.HotTrack = False
      TabOrder = 13
      Width = 964
    end
    object cxButton1: TcxButton
      Left = 10
      Top = 482
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Action = actNova
      TabOrder = 15
    end
    object cxButton2: TcxButton
      Left = 91
      Top = 482
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Action = actLocalizar
      TabOrder = 16
    end
    object cxButton3: TcxButton
      Left = 172
      Top = 482
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Action = actFiltrar
      TabOrder = 17
    end
    object cxButton4: TcxButton
      Left = 253
      Top = 482
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Action = actFechar
      TabOrder = 18
    end
    object cxButton5: TcxButton
      Left = 334
      Top = 482
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Action = actCancelar
      TabOrder = 19
    end
    object cxButton6: TcxButton
      Left = 415
      Top = 482
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Action = actImprimir
      TabOrder = 20
    end
    object cxButton7: TcxButton
      Left = 496
      Top = 482
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Action = actGravar
      TabOrder = 21
    end
    object cxButton8: TcxButton
      Left = 968
      Top = 482
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Action = actSair
      TabOrder = 22
    end
    object cxNumOS: TcxMaskEdit
      Left = 77
      Top = 55
      Hint = 'N'#250'mero da Ordem de Servi'#231'o'
      Properties.Alignment.Horz = taRightJustify
      Properties.IgnoreMaskBlank = True
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d\d\d\d\d\d'
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 1
      Width = 68
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
      Parent = dxLayoutControl1Group_Root
      CaptionOptions.Visible = False
      Control = cxLabel27
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item3: TdxLayoutItem
      Parent = dxLayoutControl1Group1
      CaptionOptions.Text = 'Data'
      Control = cxDataOS
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Group1: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutControl1Group_Root
      LayoutDirection = ldHorizontal
      Index = 1
      AutoCreated = True
    end
    object dxLayoutControl1Item4: TdxLayoutItem
      Parent = dxLayoutControl1Group1
      CaptionOptions.Text = 'Solicitante'
      Control = cxCodCliente
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutControl1Item5: TdxLayoutItem
      Parent = dxLayoutControl1Group1
      CaptionOptions.Text = 'cxTextEdit1'
      CaptionOptions.Visible = False
      Control = cxNomeSolicitante
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutControl1Item6: TdxLayoutItem
      Parent = dxLayoutControl1Group2
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Motorista'
      Control = cxCodMotorista
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item7: TdxLayoutItem
      Parent = dxLayoutControl1Group2
      CaptionOptions.Text = 'cxTextEdit2'
      CaptionOptions.Visible = False
      Control = cxNomeMotorista
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Group2: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutControl1Group_Root
      LayoutDirection = ldHorizontal
      Index = 2
      AutoCreated = True
    end
    object dxLayoutControl1Item8: TdxLayoutItem
      Parent = dxLayoutControl1Group2
      CaptionOptions.Text = 'Ve'#237'culo'
      Control = cxPlacaVeiculo
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutControl1Item9: TdxLayoutItem
      Parent = dxLayoutControl1Group2
      CaptionOptions.Text = 'KM Inicial'
      Control = cxKMInicial
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutControl1Item10: TdxLayoutItem
      Parent = dxLayoutControl1Group2
      CaptionOptions.Text = 'Sa'#237'da'
      Control = cxHoraSaida
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutControl1Item11: TdxLayoutItem
      Parent = dxLayoutControl1Group2
      CaptionOptions.Text = 'KM Final'
      Control = cxMaskEdit1
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutControl1Item12: TdxLayoutItem
      Parent = dxLayoutControl1Group2
      Control = cxHoraRetorno
      ControlOptions.ShowBorder = False
      Index = 6
    end
    object dxLayoutControl1Item13: TdxLayoutItem
      Parent = dxLayoutControl1Group2
      CaptionOptions.Text = 'Status'
      Control = cxStatus
      ControlOptions.ShowBorder = False
      Index = 7
    end
    object dxLayoutControl1Item14: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'cxGrid1'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      Control = cxGrid1
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutControl1Item15: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      CaptionOptions.Text = 'Rota/Roteiro'
      Control = cxRoteiro
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutControl1Item16: TdxLayoutItem
      Parent = dxLayoutControl1Group3
      AlignHorz = ahLeft
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = cxButton1
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item17: TdxLayoutItem
      Parent = dxLayoutControl1Group3
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      Control = cxButton2
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Group3: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutControl1Group_Root
      AlignVert = avBottom
      LayoutDirection = ldHorizontal
      Index = 5
      AutoCreated = True
    end
    object dxLayoutControl1Item18: TdxLayoutItem
      Parent = dxLayoutControl1Group3
      CaptionOptions.Text = 'cxButton3'
      CaptionOptions.Visible = False
      Control = cxButton3
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutControl1Item19: TdxLayoutItem
      Parent = dxLayoutControl1Group3
      CaptionOptions.Text = 'cxButton4'
      CaptionOptions.Visible = False
      Control = cxButton4
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutControl1Item20: TdxLayoutItem
      Parent = dxLayoutControl1Group3
      CaptionOptions.Text = 'cxButton5'
      CaptionOptions.Visible = False
      Control = cxButton5
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutControl1Item21: TdxLayoutItem
      Parent = dxLayoutControl1Group3
      CaptionOptions.Text = 'cxButton6'
      CaptionOptions.Visible = False
      Control = cxButton6
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutControl1Item22: TdxLayoutItem
      Parent = dxLayoutControl1Group3
      CaptionOptions.Text = 'cxButton7'
      CaptionOptions.Visible = False
      Control = cxButton7
      ControlOptions.ShowBorder = False
      Index = 6
    end
    object dxLayoutControl1Item23: TdxLayoutItem
      Parent = dxLayoutControl1Group3
      AlignHorz = ahRight
      CaptionOptions.Text = 'cxButton8'
      CaptionOptions.Visible = False
      Control = cxButton8
      ControlOptions.ShowBorder = False
      Index = 7
    end
    object dxLayoutControl1Item2: TdxLayoutItem
      Parent = dxLayoutControl1Group1
      CaptionOptions.Text = 'OS N'#250'mero'
      Control = cxNumOS
      ControlOptions.ShowBorder = False
      Index = 0
    end
  end
  object tbServicos: TdxMemData
    Indexes = <>
    SortOptions = []
    SortedField = 'NUM_ITEM'
    Left = 940
    Top = 8
    object tbServicosDES_SERVICO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DES_SERVICO'
      Size = 256
    end
    object tbServicosVAL_SERVICO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VAL_SERVICO'
      DisplayFormat = ' ,0.00;- ,0.00'
    end
  end
  object dsServico: TDataSource
    DataSet = tbServicos
    OnStateChange = dsServicoStateChange
    Left = 896
    Top = 8
  end
  object aclOS: TActionList
    Images = dm.cxImageList1
    Left = 840
    Top = 8
    object actNova: TAction
      Category = 'Ordem de Servi'#231'o'
      Caption = 'Nova'
      Hint = 'Nova Ordem de Servi'#231'o'
      ImageIndex = 42
      OnExecute = actNovaExecute
    end
    object actLocalizar: TAction
      Category = 'Ordem de Servi'#231'o'
      Caption = 'Localizar'
      Hint = 'Localizar Ordem de Servi'#231'o'
      ImageIndex = 18
    end
    object actFiltrar: TAction
      Category = 'Ordem de Servi'#231'o'
      Caption = 'Filtrar'
      Hint = 'Filtrar Ordens de Servi'#231'os'
      ImageIndex = 67
    end
    object actFechar: TAction
      Category = 'Ordem de Servi'#231'o'
      Caption = 'Fechar'
      Hint = 'Fechar a Ordem de Servi'#231'o'
      ImageIndex = 0
    end
    object actCancelar: TAction
      Category = 'Ordem de Servi'#231'o'
      Caption = 'Cancelar'
      Hint = 'Cancelar Ordem de Servi'#231'o'
      ImageIndex = 62
    end
    object actImprimir: TAction
      Category = 'Ordem de Servi'#231'o'
      Caption = 'Imprimir'
      Hint = 'Imprimir Ordem de Servi'#231'o'
      ImageIndex = 15
    end
    object actGravar: TAction
      Category = 'Ordem de Servi'#231'o'
      Caption = 'Gravar'
      Hint = 'Gravar Ordem de Servi'#231'o'
      ImageIndex = 9
    end
    object actSair: TAction
      Category = 'Ordem de Servi'#231'o'
      Caption = 'Sair'
      Hint = 'Sair da Tela'
      ImageIndex = 10
      OnExecute = actSairExecute
    end
  end
end
