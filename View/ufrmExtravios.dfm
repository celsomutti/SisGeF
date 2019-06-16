object frmExtravios: TfrmExtravios
  Left = 228
  Top = 98
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Controle de Extravios'
  ClientHeight = 543
  ClientWidth = 987
  Color = clWhite
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Icon.Data = {
    0000010001001010000001002000680400001600000028000000100000002000
    0000010020000000000040040000000000000000000000000000000000000000
    00000000000000000000000000000000000000000000000000005FA7D4FF58A3
    D2FFBDDAEDFF95B0E3FF235CC2FF0543BCFF1F59C1FF86A6DDFF000000000000
    00000000000000000000000000000000000078B7DCFF2D8EC8FF8FCDEBFF6FB7
    E2FF2D72C5FF2665C9FF2177E6FF0579EAFF0164DDFF074FBEFF86A6DDFF0000
    0000000000000000000095C9E4FF3F9CCEFF82C4E5FFCCF4FFFFC4EFFFFF8BD2
    F1FF1254BFFF639DF4FF187FFFFF0076F8FF0076EEFF0368E1FF1E59C0FF0000
    0000B1D9ECFF55ABD5FF7DC0E0FFC7EEFCFFCCF2FFFFA8E8FFFF94E0FEFF41BA
    E7FF0442BCFFAECDFEFFFFFFFFFFFFFFFFFFFFFFFFFF187FEFFF0543BCFF73BD
    DEFF77BDDCFFBFE5F6FFDBF6FFFFC1EEFFFFA5E5FFFF9FE3FFFF94E1FEFF46C1
    EAFF0A53BFFF8DB5F6FF4D92FFFF1177FFFF2186FFFF408AEBFF0E50BCFF46AA
    D4FFE7FBFEFFDDF6FFFFC1EFFFFFB7EBFFFFABE8FFFFA4E4FFFF96E1FEFF48C6
    EBFF308DD8FF3875D1FF8DB5F7FFB8D6FEFF72A8F5FF2E6CCBFF1A6AC1FF4FAF
    D7FFE2F6FCFFD4F3FFFFC9F0FFFFBEEDFFFFB3EAFFFFADE7FFFF7CD9FEFF48C7
    EFFF43C4EAFF328ED7FF1459C4FF0442BCFF0A50BEFF4789D4FF338EC8FF52B2
    D7FFE2F6FCFFD7F4FFFFCEF2FFFFC8EFFFFFBAEBFFFF92DBFBFF56C1F1FF48C2
    F9FF3BBDF0FF47C5ECFF45BDE9FF42B5E6FF47B1E6FF88CAEEFF3591C9FF54B5
    D8FFE2F6FDFFDAF4FFFFD5F3FFFFBDEBFFFF89D5F7FF69C9F5FF4CB4E9FF8DDA
    FBFF8CDCFFFF48C4F9FF38B6ECFF48BFE8FF4FBBE8FF8CD0F0FF3794CAFF56B7
    D9FFE2F8FDFFD4F3FFFFB0E4FAFF86CFF1FF7FD0F5FF78D0F5FF4CB1E4FFB0E4
    FAFFB6E9FFFF9BE1FFFF78D6FEFF40BDF5FF3DB5E9FF90D5F1FF3996CBFF50B5
    D9FFE1F8FEFFCDEBF9FF92D2EDFF84CCEBFF6FBFE5FF56B1DBFF3B94C8FFCEEC
    FAFFD9F5FFFFB9EAFFFF95DFFEFF77D5FFFFA5E4FFFF84DCFBFF3294CAFF91D2
    E7FF4EB5D9FFA5D9EDFFD2EBF5FFBEDEEDFF95C9DEFF89C3DBFF70B8D6FF69B9
    DDFF90D7F5FF7FCFF5FF9DDBF8FFAAE3FAFF84CAECFF51A6D5FF7ABADDFF0000
    00000000000078C7E2FF7EC6E0FFD1EEF7FFF6FFFFFFF0FEFFFFCBEDFBFF50AD
    DAFF8BD7F7FFAAE1F9FF95D6F2FF62B2DBFF64B2D9FFC2E1F0FF000000000000
    00000000000000000000B9E2F0FF65BFDEFF92CFE5FFE6F8FCFFE3F6FEFFAFDD
    F2FFB2E4F7FF72C0E1FF56AFD7FFADD8EBFF0000000000000000000000000000
    000000000000000000000000000000000000A3D8EBFF56B7DAFF9CD5EAFF88CC
    E7FF4EB0D7FF98D0E7FF00000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000083CAE4FF7AC5
    E2FF00000000000000000000000000000000000000000000000000000000FE01
    0000F8000000E000000080000000000000000000000000000000000000000000
    0000000000000000000000000000C0010000E0070000F81F0000FE7F0000}
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  Visible = True
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxPageControl1: TcxPageControl
    AlignWithMargins = True
    Left = 3
    Top = 73
    Width = 981
    Height = 467
    Align = alClient
    TabOrder = 0
    Properties.ActivePage = cxTabSheet1
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 465
    ClientRectLeft = 2
    ClientRectRight = 979
    ClientRectTop = 28
    object cxTabSheet1: TcxTabSheet
      Caption = 'Extravio'
      ImageIndex = 0
      object cxGroupBox1: TcxGroupBox
        Left = 0
        Top = 0
        Align = alClient
        Enabled = False
        TabOrder = 0
        Height = 437
        Width = 977
        object cxLabel1: TcxLabel
          Left = 8
          Top = 14
          Caption = '&C'#243'digo:'
          FocusControl = cxCodigo
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object cxCodigo: TcxTextEdit
          Left = 91
          Top = 11
          TabStop = False
          ParentFont = False
          Properties.Alignment.Horz = taRightJustify
          Properties.ReadOnly = True
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 1
          Width = 86
        end
        object cxLabel2: TcxLabel
          Left = 8
          Top = 67
          Caption = '&Descri'#231#227'o:'
          FocusControl = cxDescricao
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object cxLabel3: TcxLabel
          Left = 8
          Top = 96
          Caption = 'D&ata:'
          FocusControl = cxData
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object cxData: TcxDateEdit
          Tag = -1
          Left = 91
          Top = 93
          ParentFont = False
          Properties.ButtonGlyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C40E0000C40E00000000000000000000BE9270A0A0A0
            9191919191919191919191919191919191919191919191919191919191919191
            91919191989898BE9270BE9270959595BFBFBFC3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C4C4C4C5C5C5C2C2C2959595BE9270BE9270BCBCBC
            F0F0F0FBFBFBFCFCFCFCFCFCFCFCFCF9F9F9F6F6F6ECECECD8D8D8E0E0E0FFFF
            FFF7F7F7C7C7C7BE9270BE9270C9C9C9FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF8
            F8F8F3F3F3EBEBEBDBDBDBFDFDFDE2E2E2FFFFFFCCCCCCBE9270BE9270C9C9C9
            FCFCFCFBFBFBFBFBFBFBFBFBAEAEAEF9F9F9BEBEBEE0E0E0DDDDDDFCFCFCFDFD
            FDE0E0E0CBCBCBBE9270BE9270C9C9C9FCFCFCFBFBFBFBFBFBFBFBFBAEAEAEFA
            FAFAE8E8E8BABABAE0E0E0DFDFDFDDDDDDDBDBDBC7C7C7BE9270BE9270C9C9C9
            FCFCFCFBFBFBFCFCFCFCFCFCAEAEAEFAFAFAF8F8F8BCBCBCE5E5E5F6F6F6F3F3
            F3EFEFEFC8C8C8BE9270BE9270C9C9C9FCFCFCFCFCFCFCFCFCCBCBCBAFAFAFFB
            FBFBF9F9F9E8E8E8C2C2C2FBFBFBFAFAFAF8F8F8C8C8C8BE9270BE9270C9C9C9
            FCFCFCFCFCFCFCFCFCF5F5F5CBCBCBEEEEEECACACAC7C7C7B8B8B8FFFFFFFEFE
            FEFCFCFCC9C9C9BE9270BE9270C9C9C9FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
            FCFCFCFCFCFBFBFBF7F7F7F7F7F7FFFFFFFCFCFCC9C9C9BE9270BE92700000DC
            1313F33B3BE93333E82D2DE72828E32323E11E1EDF1B1BDD1717DC1414DB1111
            DC0404ED0000DCBE9270BE92700000DC0F0FEB2828BD1C1C981F1FBC1E1EDD1B
            1BDF1616DE1212D70D0DB50808920606B40101E60000DCBE9270BE92700000DC
            0B0BDAA1A1AEE0E0E09F9FAE1414CE1212E10E0EE10909CC9E9EAEE0E0E09E9E
            AE0000D70000DCBE9270BE92700000DC0707D2C4C4D6E3E3E3C4C4D50303D002
            02ED0202ED0101CFC5C5D6E3E3E3C4C4D60000CF0000DCBE9270BE92700000DC
            0000C7B5B5CBE6E6E6B3B3C90000C70000DC0000DC0000C7B8B8CEE6E6E6B6B6
            CD0000C70000DCBE9270BE9270BE9270BE9270C6C6C6A8A8A8C2C2C2BE9270BE
            9270BE9270BE9270CFCFCFB1B1B1C6C6C6BE9270BE9270BE9270}
          Properties.SaveTime = False
          Properties.ShowTime = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 6
          Width = 90
        end
        object cxLabel4: TcxLabel
          Left = 8
          Top = 42
          Caption = 'Nosso N'#250'&mero:'
          FocusControl = cxNossoNumero
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object cxLabel10: TcxLabel
          Left = 8
          Top = 127
          Caption = '&Entregador:'
          FocusControl = cxEntregador
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object cxEntregador: TcxButtonEdit
          Left = 91
          Top = 123
          Hint = 'C'#243'digo do Entregador'
          ParentFont = False
          Properties.Alignment.Horz = taRightJustify
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
          Properties.MaxLength = 0
          Properties.OnButtonClick = cxAgentePropertiesButtonClick
          Properties.OnValidate = cxEntregadorPropertiesValidate
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 9
          Width = 81
        end
        object cxNomeEntregador: TcxTextEdit
          Left = 172
          Top = 123
          TabStop = False
          ParentFont = False
          Properties.ReadOnly = True
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 10
          Width = 265
        end
        object cxLabel5: TcxLabel
          Left = 8
          Top = 156
          Caption = 'Valor &Produto:'
          FocusControl = cxExtravio
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object cxExtravio: TcxCurrencyEdit
          Left = 92
          Top = 153
          Hint = 'Valor do Produto Extraviado'
          ParentFont = False
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ' ,0.00;- ,0.00'
          Properties.Nullable = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 12
          Width = 89
        end
        object cxLabel6: TcxLabel
          Left = 8
          Top = 186
          Caption = 'Valor &Multa:'
          FocusControl = cxMulta
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object cxMulta: TcxCurrencyEdit
          Left = 92
          Top = 183
          Hint = 'Valor da Multa por Falta Grave/Grav'#237'ssima'
          ParentFont = False
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ' ,0.00;- ,0.00'
          Properties.Nullable = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 14
          Width = 89
        end
        object cxLabel7: TcxLabel
          Left = 8
          Top = 216
          Caption = 'Valor Ver&ba:'
          FocusControl = cxVerba
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object cxVerba: TcxCurrencyEdit
          Left = 92
          Top = 213
          Hint = 'Valor da Verba'
          ParentFont = False
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ' ,0.00;- ,0.00'
          Properties.Nullable = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 16
          Width = 89
        end
        object cxLabel8: TcxLabel
          Left = 8
          Top = 246
          Caption = 'Valor T&otal:'
          FocusControl = cxTotal
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object cxTotal: TcxCalcEdit
          Left = 92
          Top = 243
          Hint = 'Total do Extravio'
          EditValue = 0.000000000000000000
          ParentFont = False
          Properties.Alignment.Horz = taRightJustify
          Properties.ButtonGlyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C40E0000C40E00000000000000000000808040808040
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
          Properties.DisplayFormat = ' ,0.00;- ,0.00'
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 18
          OnEnter = cxTotalEnter
          Width = 89
        end
        object cxLabel11: TcxLabel
          Left = 11
          Top = 358
          Caption = 'Registrado por:'
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object cxManutencao: TcxTextEdit
          Left = 91
          Top = 355
          TabStop = False
          ParentFont = False
          Properties.ReadOnly = True
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 20
          Width = 346
        end
        object cxDescricao: TcxComboBox
          Tag = -1
          Left = 91
          Top = 66
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 3
          Width = 346
        end
        object cxRadioGroup1: TcxRadioGroup
          Left = 3
          Top = 273
          Cursor = crHandPoint
          Alignment = alTopCenter
          Caption = ' '
          ParentFont = False
          Properties.Items = <
            item
              Caption = 'para o Agente'
            end
            item
              Caption = 'para o Entregador'
            end>
          ItemIndex = 0
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.Shadow = False
          Style.IsFontAssigned = True
          TabOrder = 21
          Height = 76
          Width = 134
          object cxRestricao: TcxCheckBox
            Tag = -1
            Left = 3
            Top = 3
            Hint = 'Selecione para gerar a restri'#231#227'o'
            Caption = 'Re&stri'#231#227'o'
            ParentFont = False
            Properties.NullStyle = nssUnchecked
            Properties.ReadOnly = False
            Properties.ValueChecked = 'S'
            Properties.ValueUnchecked = 'N'
            State = cbsChecked
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
            TabOrder = 0
            Transparent = True
            Width = 97
          end
        end
        object cxNossoNumero: TcxMaskEdit
          Left = 91
          Top = 39
          ParentFont = False
          Properties.IgnoreMaskBlank = True
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d\d\d\d\d\d\d\d\d\d\d\d\d\d'
          Properties.OnValidate = cxNossoNumeroPropertiesValidate
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 2
          Width = 121
        end
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'Relat'#243'rio'
      ImageIndex = 1
      DesignSize = (
        977
        437)
      object cxGrid1: TcxGrid
        AlignWithMargins = True
        Left = 0
        Top = 39
        Width = 971
        Height = 358
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        object cxGrid1DBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = ds
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00;- ,0.00'
              Kind = skSum
              Column = cxGrid1DBTableView1VAL_MULTA
            end
            item
              Format = ',0.00;- ,0.00'
              Kind = skSum
              Column = cxGrid1DBTableView1VAL_PRODUTO
            end
            item
              Format = ',0.00;- ,0.00'
              Kind = skSum
              Column = cxGrid1DBTableView1VAL_TOTAL
            end
            item
              Format = ',0.00;- ,0.00'
              Kind = skSum
              Column = cxGrid1DBTableView1VAL_VERBA
            end
            item
              Format = 'TOTAL GERAL'
              Kind = skCount
              Column = cxGrid1DBTableView1DES_EXTRAVIO
            end>
          DataController.Summary.SummaryGroups = <
            item
              Links = <
                item
                end
                item
                  Column = cxGrid1DBTableView1NOM_AGENTE
                end>
              SummaryItems = <
                item
                  Format = ',0.00;- ,0.00'
                  Kind = skSum
                  Position = spFooter
                  Column = cxGrid1DBTableView1VAL_MULTA
                end
                item
                  Format = ',0.00;- ,0.00'
                  Kind = skSum
                  Position = spFooter
                  Column = cxGrid1DBTableView1VAL_PRODUTO
                end
                item
                  Format = ',0.00;- ,0.00'
                  Kind = skSum
                  Position = spFooter
                  Column = cxGrid1DBTableView1VAL_TOTAL
                end
                item
                  Format = ',0.00;- ,0.00'
                  Kind = skSum
                  Position = spFooter
                  Column = cxGrid1DBTableView1VAL_VERBA
                end
                item
                  Format = 'Total do Agente'
                  Kind = skCount
                  Position = spFooter
                  Column = cxGrid1DBTableView1DES_EXTRAVIO
                end>
            end
            item
              Links = <
                item
                end
                item
                  Column = cxGrid1DBTableView1NOM_ENTREGADOR
                end>
              SummaryItems = <
                item
                  Format = ',0.00;- ,0.00'
                  Kind = skSum
                  Position = spFooter
                  Column = cxGrid1DBTableView1VAL_MULTA
                end
                item
                  Format = ',0.00;- ,0.00'
                  Kind = skSum
                  Position = spFooter
                  Column = cxGrid1DBTableView1VAL_PRODUTO
                end
                item
                  Format = ',0.00;- ,0.00'
                  Kind = skSum
                  Position = spFooter
                  Column = cxGrid1DBTableView1VAL_TOTAL
                end
                item
                  Format = ',0.00;- ,0.00'
                  Kind = skSum
                  Position = spFooter
                  Column = cxGrid1DBTableView1VAL_TOTAL
                end
                item
                  Format = 'Total do Entregador'
                  Kind = skCount
                  Position = spFooter
                  Column = cxGrid1DBTableView1DES_EXTRAVIO
                end>
            end>
          FilterRow.InfoText = 'Clique aqui para filtrar os dados'
          FilterRow.Visible = True
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.FocusCellOnCycle = True
          OptionsCustomize.ColumnGrouping = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.NoDataToDisplayInfoText = 'Nenhuma Informa'#231#227'o Dispon'#237'vel'
          OptionsView.CellAutoHeight = True
          OptionsView.Footer = True
          OptionsView.GroupFooters = gfAlwaysVisible
          OptionsView.GroupSummaryLayout = gslAlignWithColumns
          object cxGrid1DBTableView1COD_EXTRAVIO: TcxGridDBColumn
            DataBinding.FieldName = 'COD_EXTRAVIO'
            Width = 39
          end
          object cxGrid1DBTableView1DES_EXTRAVIO: TcxGridDBColumn
            DataBinding.FieldName = 'DES_EXTRAVIO'
            Width = 283
          end
          object cxGrid1DBTableView1DAT_EXTRAVIO: TcxGridDBColumn
            DataBinding.FieldName = 'DAT_EXTRAVIO'
            Width = 91
          end
          object cxGrid1DBTableView1NUM_NOSSONUMERO: TcxGridDBColumn
            DataBinding.FieldName = 'NUM_NOSSONUMERO'
          end
          object cxGrid1DBTableView1DOM_RESTRICAO: TcxGridDBColumn
            DataBinding.FieldName = 'DOM_RESTRICAO'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.ValueChecked = 'S'
            Properties.ValueUnchecked = 'N'
            Width = 69
          end
          object cxGrid1DBTableView1NOM_ENTREGADOR: TcxGridDBColumn
            DataBinding.FieldName = 'NOM_ENTREGADOR'
            Visible = False
            GroupIndex = 1
          end
          object cxGrid1DBTableView1NOM_AGENTE: TcxGridDBColumn
            DataBinding.FieldName = 'NOM_AGENTE'
            Visible = False
            GroupIndex = 0
          end
          object cxGrid1DBTableView1VAL_PRODUTO: TcxGridDBColumn
            DataBinding.FieldName = 'VAL_PRODUTO'
            Width = 77
          end
          object cxGrid1DBTableView1VAL_MULTA: TcxGridDBColumn
            DataBinding.FieldName = 'VAL_MULTA'
            Width = 79
          end
          object cxGrid1DBTableView1VAL_VERBA: TcxGridDBColumn
            DataBinding.FieldName = 'VAL_VERBA'
            Width = 80
          end
          object cxGrid1DBTableView1VAL_TOTAL: TcxGridDBColumn
            DataBinding.FieldName = 'VAL_TOTAL'
            Width = 86
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
      object cxLabel9: TcxLabel
        Left = 0
        Top = 17
        Caption = 'Per'#237'odo:'
        Transparent = True
      end
      object cxDataInicial: TcxDateEdit
        Tag = -1
        Left = 50
        Top = 16
        Hint = 'Data inicial do Per'#237'odo'
        Properties.ButtonGlyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E00000000000000000000BE9270A0A0A0
          9191919191919191919191919191919191919191919191919191919191919191
          91919191989898BE9270BE9270959595BFBFBFC3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C4C4C4C5C5C5C2C2C2959595BE9270BE9270BCBCBC
          F0F0F0FBFBFBFCFCFCFCFCFCFCFCFCF9F9F9F6F6F6ECECECD8D8D8E0E0E0FFFF
          FFF7F7F7C7C7C7BE9270BE9270C9C9C9FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF8
          F8F8F3F3F3EBEBEBDBDBDBFDFDFDE2E2E2FFFFFFCCCCCCBE9270BE9270C9C9C9
          FCFCFCFBFBFBFBFBFBFBFBFBAEAEAEF9F9F9BEBEBEE0E0E0DDDDDDFCFCFCFDFD
          FDE0E0E0CBCBCBBE9270BE9270C9C9C9FCFCFCFBFBFBFBFBFBFBFBFBAEAEAEFA
          FAFAE8E8E8BABABAE0E0E0DFDFDFDDDDDDDBDBDBC7C7C7BE9270BE9270C9C9C9
          FCFCFCFBFBFBFCFCFCFCFCFCAEAEAEFAFAFAF8F8F8BCBCBCE5E5E5F6F6F6F3F3
          F3EFEFEFC8C8C8BE9270BE9270C9C9C9FCFCFCFCFCFCFCFCFCCBCBCBAFAFAFFB
          FBFBF9F9F9E8E8E8C2C2C2FBFBFBFAFAFAF8F8F8C8C8C8BE9270BE9270C9C9C9
          FCFCFCFCFCFCFCFCFCF5F5F5CBCBCBEEEEEECACACAC7C7C7B8B8B8FFFFFFFEFE
          FEFCFCFCC9C9C9BE9270BE9270C9C9C9FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
          FCFCFCFCFCFBFBFBF7F7F7F7F7F7FFFFFFFCFCFCC9C9C9BE9270BE92700000DC
          1313F33B3BE93333E82D2DE72828E32323E11E1EDF1B1BDD1717DC1414DB1111
          DC0404ED0000DCBE9270BE92700000DC0F0FEB2828BD1C1C981F1FBC1E1EDD1B
          1BDF1616DE1212D70D0DB50808920606B40101E60000DCBE9270BE92700000DC
          0B0BDAA1A1AEE0E0E09F9FAE1414CE1212E10E0EE10909CC9E9EAEE0E0E09E9E
          AE0000D70000DCBE9270BE92700000DC0707D2C4C4D6E3E3E3C4C4D50303D002
          02ED0202ED0101CFC5C5D6E3E3E3C4C4D60000CF0000DCBE9270BE92700000DC
          0000C7B5B5CBE6E6E6B3B3C90000C70000DC0000DC0000C7B8B8CEE6E6E6B6B6
          CD0000C70000DCBE9270BE9270BE9270BE9270C6C6C6A8A8A8C2C2C2BE9270BE
          9270BE9270BE9270CFCFCFB1B1B1C6C6C6BE9270BE9270BE9270}
        Properties.SaveTime = False
        Properties.ShowTime = False
        TabOrder = 2
        Width = 103
      end
      object cxLabel12: TcxLabel
        Left = 159
        Top = 17
        Caption = 'a'
        Transparent = True
      end
      object cxDataFinal: TcxDateEdit
        Tag = -1
        Left = 175
        Top = 16
        Hint = 'Data final do Per'#237'odo'
        Properties.ButtonGlyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E00000000000000000000BE9270A0A0A0
          9191919191919191919191919191919191919191919191919191919191919191
          91919191989898BE9270BE9270959595BFBFBFC3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C4C4C4C5C5C5C2C2C2959595BE9270BE9270BCBCBC
          F0F0F0FBFBFBFCFCFCFCFCFCFCFCFCF9F9F9F6F6F6ECECECD8D8D8E0E0E0FFFF
          FFF7F7F7C7C7C7BE9270BE9270C9C9C9FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF8
          F8F8F3F3F3EBEBEBDBDBDBFDFDFDE2E2E2FFFFFFCCCCCCBE9270BE9270C9C9C9
          FCFCFCFBFBFBFBFBFBFBFBFBAEAEAEF9F9F9BEBEBEE0E0E0DDDDDDFCFCFCFDFD
          FDE0E0E0CBCBCBBE9270BE9270C9C9C9FCFCFCFBFBFBFBFBFBFBFBFBAEAEAEFA
          FAFAE8E8E8BABABAE0E0E0DFDFDFDDDDDDDBDBDBC7C7C7BE9270BE9270C9C9C9
          FCFCFCFBFBFBFCFCFCFCFCFCAEAEAEFAFAFAF8F8F8BCBCBCE5E5E5F6F6F6F3F3
          F3EFEFEFC8C8C8BE9270BE9270C9C9C9FCFCFCFCFCFCFCFCFCCBCBCBAFAFAFFB
          FBFBF9F9F9E8E8E8C2C2C2FBFBFBFAFAFAF8F8F8C8C8C8BE9270BE9270C9C9C9
          FCFCFCFCFCFCFCFCFCF5F5F5CBCBCBEEEEEECACACAC7C7C7B8B8B8FFFFFFFEFE
          FEFCFCFCC9C9C9BE9270BE9270C9C9C9FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
          FCFCFCFCFCFBFBFBF7F7F7F7F7F7FFFFFFFCFCFCC9C9C9BE9270BE92700000DC
          1313F33B3BE93333E82D2DE72828E32323E11E1EDF1B1BDD1717DC1414DB1111
          DC0404ED0000DCBE9270BE92700000DC0F0FEB2828BD1C1C981F1FBC1E1EDD1B
          1BDF1616DE1212D70D0DB50808920606B40101E60000DCBE9270BE92700000DC
          0B0BDAA1A1AEE0E0E09F9FAE1414CE1212E10E0EE10909CC9E9EAEE0E0E09E9E
          AE0000D70000DCBE9270BE92700000DC0707D2C4C4D6E3E3E3C4C4D50303D002
          02ED0202ED0101CFC5C5D6E3E3E3C4C4D60000CF0000DCBE9270BE92700000DC
          0000C7B5B5CBE6E6E6B3B3C90000C70000DC0000DC0000C7B8B8CEE6E6E6B6B6
          CD0000C70000DCBE9270BE9270BE9270BE9270C6C6C6A8A8A8C2C2C2BE9270BE
          9270BE9270BE9270CFCFCFB1B1B1C6C6C6BE9270BE9270BE9270}
        Properties.SaveTime = False
        Properties.ShowTime = False
        TabOrder = 4
        Width = 103
      end
      object cxButton1: TcxButton
        Left = 902
        Top = 8
        Width = 72
        Height = 25
        Cursor = crHandPoint
        Action = actCadastroExecutar
        Anchors = [akLeft, akRight]
        TabOrder = 5
      end
      object cxButton2: TcxButton
        Left = 0
        Top = 409
        Width = 78
        Height = 25
        Cursor = crHandPoint
        Action = actCadastroVisualizar
        Anchors = [akLeft, akBottom]
        TabOrder = 6
      end
      object cxButton3: TcxButton
        Left = 896
        Top = 409
        Width = 78
        Height = 25
        Cursor = crHandPoint
        Action = actCadastroExportar
        Anchors = [akRight, akBottom]
        TabOrder = 7
      end
    end
  end
  object cxLabel27: TcxLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alTop
    AutoSize = False
    Caption = 'Extravios'
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -21
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Properties.Alignment.Vert = taVCenter
    Transparent = True
    Height = 38
    Width = 981
    AnchorY = 22
  end
  object aclCadastro: TActionList
    Images = dm.cxImageList1
    Left = 368
    Top = 8
    object actCadastroIncluir: TAction
      Tag = 3
      Category = 'Cadastro'
      Caption = '&Incluir'
      Hint = 'Incluir Extravio'
      ImageIndex = 1
      ShortCut = 113
      OnExecute = actCadastroIncluirExecute
    end
    object actCadastroExcluir: TAction
      Tag = 2
      Category = 'Cadastro'
      Caption = 'E&xcluir'
      Hint = 'Excluir Extravio'
      ImageIndex = 8
      ShortCut = 115
      OnExecute = actCadastroExcluirExecute
    end
    object actCadastroCancelar: TAction
      Tag = 99
      Category = 'Cadastro'
      Caption = 'Cancelar'
      Hint = 'Cancelar opera'#231#227'o atual'
      ImageIndex = 6
      OnExecute = actCadastroCancelarExecute
    end
    object actCadastroSalvar: TAction
      Tag = 3
      Category = 'Cadastro'
      Caption = 'Sal&var'
      Hint = 'Salvar dados'
      ImageIndex = 9
      ShortCut = 116
      OnExecute = actCadastroSalvarExecute
    end
    object actCadastroSair: TAction
      Tag = 99
      Category = 'Cadastro'
      Caption = 'Sai&r'
      Hint = 'Sair da tela'
      ImageIndex = 10
      ShortCut = 16467
      OnExecute = actCadastroSairExecute
    end
    object actCadastroListaApoio: TAction
      Tag = 99
      Category = 'Cadastro'
      Caption = '&Apoio'
      Hint = 'Lista de Apoio'
      ImageIndex = 11
      ShortCut = 120
      OnExecute = actCadastroListaApoioExecute
    end
    object actCadastroRestricao: TAction
      Tag = 2
      Category = 'Cadastro'
      Caption = 'Re&stri'#231#227'o'
      Hint = 'Gerar Restri'#231#227'o'
      ImageIndex = 25
      OnExecute = actCadastroRestricaoExecute
    end
    object actCadastroExportar: TAction
      Tag = 2
      Category = 'Cadastro'
      Caption = 'E&xportar'
      Hint = 'Exportar Dados'
      ImageIndex = 29
      OnExecute = actCadastroExportarExecute
    end
    object actCadastroExecutar: TAction
      Tag = 2
      Category = 'Cadastro'
      Caption = 'Executar'
      Hint = 'Executar Relatr'#243'rio'
      ImageIndex = 27
      OnExecute = actCadastroExecutarExecute
    end
    object actCadastroVisualizar: TAction
      Tag = 2
      Category = 'Cadastro'
      Caption = 'Selecionar'
      Hint = 'Selecionar registro para Visualiza'#231#227'o'
      ImageIndex = 51
      OnExecute = actCadastroVisualizarExecute
    end
    object actCadastroImportar: TAction
      Tag = 3
      Category = 'Cadastro'
      Caption = 'I&mportar'
      Hint = 'Importar Planilhas'
      ImageIndex = 33
      OnExecute = actCadastroImportarExecute
    end
  end
  object ds: TDataSource
    AutoEdit = False
    DataSet = dm.tbExtravios
    Left = 411
    Top = 8
  end
  object SaveDialog: TSaveDialog
    FileName = 'extravios'
    Left = 450
    Top = 9
  end
  object cxImageList1: TcxImageList
    FormatVersion = 1
    DesignInfo = 524776
    ImageInfo = <
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000009140B231E46247D32783ADB33833DF3308139F32871
          2FDB163F197D0511072300000000000000000000000000000000000000000000
          00000000000018321D533E874BE6419950FF7DC28FFF96D0A6FF96CFA6FF78BE
          89FF368D42FF28742FE60D291053000000000000000000000000000000000000
          00001A3420534A9559F464B478FFA8DBB5FF87CC98FF66BC7DFF64BA7CFF86CB
          98FFA5D9B4FF58AA6BFF2A7B32F40D2910530000000000000000000000000C16
          0E224D925CE56AB97DFFA8DBB2FF60BC77FF5CBA73FF59B870FF59B56FFF58B5
          6FFF5BB774FFA5D9B3FF5AAA6CFF28752FE50511062200000000000000002E54
          377E53AB68FFAADDB4FF64C179FF5FBE71FF60BC77FFFFFFFFFFFFFFFFFF59B8
          70FF58B56EFF5CB774FFA6DAB4FF388F43FF16401A7E00000000000000005394
          64DB8ACC98FF89D396FF6BC67AFF63C170FF55AB65FFFFFFFFFFFFFFFFFF59B8
          70FF59B870FF5BB972FF85CC97FF7BBE8DFF297231DB000000000000000061A9
          76F6A9DDB3FF7DCF8AFF75CC81FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF59B870FF67BE7DFF9CD4ABFF32833BF6000000000000000065AC
          7AF6B6E2BEFF8BD597FF7AC986FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF59B870FF69C17EFF9DD4AAFF368640F600000000000000005E9B
          71DBACDDB6FFA6DFAFFF81CB8CFF7CC986FF6EBD79FFFFFFFFFFFFFFFFFF5BAC
          6AFF60BC77FF5CBA73FF8BD199FF80C592FF347A3DDB0000000000000000375B
          437E85C797FFD2EED7FF95D9A0FF8AD394FF7FC889FFFFFFFFFFFFFFFFFF79CD
          85FF6BC37CFF6FC77EFFACDFB5FF459E57FF2048267E00000000000000000F19
          122265A579E5AADAB7FFD8F1DCFF92D89DFF88CD93FF84CC8EFF8BD496FF8AD4
          95FF83D28EFFAFE0B7FF6BB97DFF41894DE509140B2200000000000000000000
          0000253D2D536BB081F4AFDCBBFFDCF2E0FFB6E4BDFF9BDBA5FF96D9A0FFA5DF
          AFFFC0E8C5FF79C28AFF4D975BF419321E530000000000000000000000000000
          000000000000253D2D5366A67AE694CEA4FFC3E6CBFFCFEBD4FFC9E9CEFFAFDD
          B8FF6DB97FFF4F955FE61B342153000000000000000000000000000000000000
          00000000000000000000101A1323375B437D5E9C71DB65AB7AF362A976F35595
          66DB2F54387D0D170F2300000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000090C1B231C275F7D3047A3DB334DB4F32E47B3F32843
          9EDB15255A7D050A192300000000000000000000000000000000000000000000
          000000000000171D41533C4DB3E63C52CCFF757AE8FF8F92EEFF8F92EEFF7178
          E4FF334DC1FF2743A5E60D183B53000000000000000000000000000000000000
          0000191D43534655C2F45C65E0FFA1A6F5FF7E86EFFF5B63E9FF595DE7FF7D84
          EEFF9EA0F4FF515DD7FF2947AFF40D183B530000000000000000000000000B0D
          1C224B57BAE5616BE3FFA1ACF5FF545FECFF505CEAFF4D59E9FF4E59E6FF4C56
          E6FF5056E6FF9EA2F4FF5460D6FF2642A5E5050A182200000000000000002B2F
          697E4B56DBFFA2ABF6FF5664F0FF5266EEFF4D59E9FF4D59E9FF4D59E9FF4D59
          E9FF4C58E6FF525AE6FF9FA3F5FF3450C4FF15255B7E00000000000000004F54
          B9DB818CEEFF7E91F7FF5D73F3FF4D59E9FF4D59E9FF4D59E9FF4D59E9FF4D59
          E9FF4D59E9FF4F5BE9FF7B83F0FF757BE2FF2840A0DB00000000000000005C60
          D2F6A1ABF7FF7086F8FF6882F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF4D59E9FF5C66EAFF969CF1FF304DB5F600000000000000006065
          D3F6AFB9F9FF7F93FAFF7085F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF4D59E9FF5E6AEEFF969DF1FF344CB7F60000000000000000585B
          BFDBA5AFF5FF9DABFAFF778CF0FF545FECFF545FECFF545FECFF545FECFF545F
          ECFF545FECFF6377F2FF818EF4FF787FE9FF3247A5DB00000000000000003434
          6F7E7D83EAFFCDD4FCFF8B9DFAFF7E93F7FF758AEEFF6C84F6FF6C84F6FF6C84
          F6FF6C84F6FF6379F3FFA4AFF8FF3E4FD0FF1F2A607E00000000000000000E0E
          1E225F5EC9E5A3A7F3FFD4DBFDFF879AFAFF7F91F0FF7A8EF1FF7F94F8FF7E92
          F9FF768CF8FFA8B6F8FF636EE3FF3E4EB3E5090B1A2200000000000000000000
          000023234A536564D6F4AAADF2FFD8DCFDFFAEBAFAFF91A3FAFF8B9DFAFF9CA9
          FBFFBAC7FCFF707BE9FF4957C3F4171D42530000000000000000000000000000
          00000000000023234A536060C9E68E93EDFFBEC3F8FFCCD3F9FFC4CBF9FFAAB4
          F4FF6670E2FF4B55BDE61A1E4353000000000000000000000000000000000000
          000000000000000000000F0F1F2334346E7D595BBEDB5E5FD2F35C5FD0F35055
          BADB2D31697D0C0D1D2300000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000683B1E8F834B
          26B5AC6231EEB76835FFB56835FFB46734FFB26634FFB06533FFAE6433FFAC63
          32FFAA6232FFA96132FFA86031FFA66031FE9D5B2EF1814B26C4A25C2EDEEBC6
          ADFFEAC5ADFFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFB
          F8FFFEFBF8FFFEFBF8FFFEFBF8FFC89A7CFFC79879FF9B592EEDB96B37FEEDCA
          B3FFE0A27AFFFEFAF7FF62C088FF62C088FF62C088FF62C088FF62C088FF62C0
          88FF62C088FF62C088FFFDF9F6FFCA8D65FFC99B7CFFA66031FEBB6C38FFEECC
          B6FFE1A27AFFFEFAF7FFBFDCC2FFBFDCC2FFBFDCC2FFBFDCC2FFBFDCC2FFBFDC
          C2FFBFDCC2FFBFDCC2FFFDF9F6FFCD9068FFCC9E81FFA86132FFBB6B38FFEFCE
          B8FFE1A279FFFEFAF7FF62C088FF62C088FF62C088FF62C088FF62C088FF62C0
          88FF62C088FF62C088FFFDF9F6FFCF936AFFCEA384FFAA6132FFBA6A36FFEFD0
          BBFFE2A27AFFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFB
          F8FFFEFBF8FFFEFBF8FFFEFBF8FFD3966DFFD2A78AFFAB6232FFBB6A36FFF0D2
          BEFFE2A37AFFE2A37AFFE1A37AFFE2A37BFFE1A37BFFE0A178FFDE9F77FFDD9F
          76FFDC9D74FFD99B72FFD89971FFD69970FFD5AB8EFFAD6333FFBB6A36FFF2D5
          C2FFE3A37AFFE3A37AFFE2A37BFFE2A37BFFE2A47BFFE1A279FFE0A178FFDEA0
          77FFDE9E75FFDC9D74FFDA9B73FFD99B73FFDAB095FFAF6433FFBB6A36FFF2D8
          C5FFE3A47BFFE3A37AFFE3A47AFFE2A47BFFE2A37BFFE1A37BFFE1A279FFDFA0
          77FFDE9F76FFDD9E74FFDB9C72FFDC9D74FFDDB59AFFB16534FFBB6B36FFF4D9
          C7FFE6A67DFFC88C64FFC98D65FFC98E67FFCB926CFFCB926DFFCA9069FFC88C
          65FFC88C64FFC88C64FFC88C64FFDA9C74FFE1BA9FFFB36634FFBA6B36FEF4DC
          C9FFE7A77DFFF9ECE1FFF9ECE1FFF9EDE3FFFCF4EEFFFDFAF7FFFDF7F3FFFAED
          E5FFF7E7DBFFF7E5D9FFF6E5D8FFDEA077FFE4BEA4FFB46734FFB86935FAF5DD
          CCFFE7A87EFFFAF0E8FFFAF0E8FFC98D66FFFAF0E9FFFDF8F3FFFEFAF8FFFCF4
          EFFFF9E9DFFFF7E7DBFFF7E5D9FFE0A278FFE7C2A9FFB66835FFB16533F0F6DF
          D0FFE8A87EFFFCF6F1FFFCF6F1FFC88C64FFFAF1E9FFFBF4EEFFFDFAF7FFFDF9
          F6FFFAF0E8FFF8E8DDFFF7E6DBFFE1A37AFFEFD5C3FFB66935FE9F5B2ED8F6DF
          D1FFE9AA80FFFEFAF6FFFDFAF6FFC88C64FFFBF3EEFFFBF1EAFFFCF6F2FFFEFB
          F8FFFCF6F1FFF9ECE2FFF8E7DBFFEED0BAFFECD0BDFFB66D3CF87241219BF6E0
          D1FFF7E0D1FFFEFBF8FFFEFBF7FFFDF9F6FFFCF5F0FFFAF0EAFFFBF2EDFFFDF9
          F6FFFDFAF7FFFBF1EBFFF7E8DEFEE8CDBAFBBA7F57EC46291563532F18716A3C
          1E9096562BCCAF6432EEB86935FABA6B36FEBB6B36FFBB6A36FFBB6A36FFBC6C
          39FFBD6E3BFFBB6D3AFFAF6434EF955931CB3C23115400000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000DFEC0000F1FF0000F1FF0000F1FF0000EFFF0000
          EFFF0000EDFF0000DCED00000000000000000000000000000000000000000000
          0000000000000000E3EC1A20F5FF3C4CF9FF3A49F8FF3847F8FF3545F8FF3443
          F7FF3242F7FF141BF1FF0000D8E8000000000000000000000000000000000000
          00000000E5EC1D23F9FF4453FAFF2429F9FF1212F7FF0F0FF6FF0C0CF5FF0909
          F5FF161BF5FF3343F7FF141BF1FF0000D8E80000000000000000000000000000
          E6EC1F25FAFF4A58FBFF4247FBFFC9C9FDFF3B3BF9FF1313F7FF1010F6FF3333
          F7FFC5C5FDFF3035F7FF3444F7FF141BF2FF0000D8E800000000000000000000
          FBFF4F5DFDFF3237FBFFCBCBFEFFF2F2FFFFEBEBFEFF3B3BF9FF3939F8FFEAEA
          FEFFF1F1FEFFC5C5FDFF181DF6FF3343F7FF0000EFFF00000000000000000000
          FDFF525FFDFF2828FCFF4747FCFFECECFFFFF2F2FFFFECECFFFFECECFEFFF1F1
          FFFFEAEAFEFF3434F7FF0B0BF5FF3545F8FF0000EFFF00000000000000000000
          FDFF5562FEFF2C2CFDFF2929FCFF4848FCFFEDEDFFFFF2F2FFFFF2F2FFFFECEC
          FEFF3A3AF9FF1212F7FF0F0FF6FF3848F8FF0000F1FF00000000000000000000
          FDFF5764FEFF3030FDFF2D2DFDFF4B4BFCFFEDEDFFFFF2F2FFFFF2F2FFFFECEC
          FFFF3D3DF9FF1616F8FF1313F7FF3C4BF8FF0000F1FF00000000000000000000
          FFFF5A67FEFF3333FEFF5050FDFFEDEDFFFFF3F3FFFFEDEDFFFFEDEDFFFFF2F2
          FFFFECECFEFF3E3EFAFF1717F8FF3F4EF9FF0000F1FF00000000000000000000
          FFFF5B68FFFF4347FEFFCFCFFFFFF3F3FFFFEDEDFFFF4C4CFCFF4A4AFCFFECEC
          FFFFF2F2FFFFCACAFEFF2A2FFAFF4251FAFF0000F3FF00000000000000000000
          EBEB262BFFFF5D6AFFFF585BFFFFCFCFFFFF5252FEFF2F2FFDFF2C2CFDFF4B4B
          FCFFCCCCFEFF484CFBFF4957FBFF1D23F9FF0000E2EB00000000000000000000
          00000000EBEB262BFFFF5D6AFFFF4347FFFF3434FEFF3232FEFF3030FDFF2D2D
          FDFF383CFCFF4F5DFCFF1F25FAFF0000E4EB0000000000000000000000000000
          0000000000000000EBEB262BFFFF5C69FFFF5B68FFFF5A67FEFF5865FEFF5663
          FEFF5461FEFF2227FCFF0000EEF2000000000000000000000000000000000000
          000000000000000000000000ECEC0000FFFF0000FFFF0000FFFF0000FDFF0000
          FDFF0000FDFF0000EAEC00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000001020302090F1A000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000001020406124268AD22679DFF09304E870000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000103
          04061D4A70AD558DBCFF89B5DDFF185F97FF0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000020304062952
          78AD6497C5FF9DC1E4FF6699C7FF1D5D91EB0000000000000000000000000000
          00000201010280675297BF9676E3D1A47EFDCE9F7AFDB78B6AE48D8078DE75A2
          CCFFABCBE8FF76A4CEFF2C679BEB061019270000000000000000000000000201
          0102A98B71C0E8C9AEFFF5E1CDFFF7E5D3FFF7E5D1FFF3DDC8FFDFBA9CFFC7A8
          91FF86AED5FF3C73A7EB09121B27000000000000000000000000000000008973
          6097EDD0B7FFF8E8D9FFF5DEC8FFF3D8BDFFF3D6BBFFF4DBC2FFF7E4D2FFDFBB
          9DFF988F8DF70B141D270000000000000000000000000000000000000000D2B2
          96E3F7E7D7FFF6E1CCFFF4DBC2FFF4DAC0FFF3D8BDFFF3D7BBFFF4DBC2FFF3DE
          C9FFBA906FE7000000000000000000000000000000000000000000000000EECC
          ADFDF9ECDFFFF5DFC8FFF5DDC6FFF4DCC3FFF4DAC1FFF3D9BEFFF3D7BDFFF8E6
          D3FFD1A47EFD000000000000000000000000000000000000000000000000F2D1
          B3FDF9EDE1FFF6E1CCFFF5DFC9FFF5DEC7FFF4DCC4FFF4DBC2FFF4DAC0FFF8E7
          D6FFD5A985FD000000000000000000000000000000000000000000000000DCBF
          A5E3F9EBDEFFF7E7D6FFF6E1CCFFF5E0CAFFF5DEC8FFF5DDC5FFF6E1CBFFF5E2
          D0FFC39D7DE30000000000000000000000000000000000000000000000009482
          7097F8E2CCFFFAEEE3FFF7E7D6FFF6E2CEFFF6E1CBFFF6E3D0FFF9EADDFFECCF
          B5FF846C57970000000000000000000000000000000000000000000000000202
          0202BCA58FC0F9E2CDFFFAECDEFFF9EEE2FFF9EDE2FFF8E9DAFFF0D5BDFFAE91
          78C0020101020000000000000000000000000000000000000000000000000000
          00000202020294827197DEC1A6E3F4D4B7FDF2D1B3FDD7B89CE38D7865970202
          0102000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000070B1B231825617D283EA8DB2A43B9F32841B7F32239
          A3DB131F5C7D05091A2300000000000000000000000000000000000000000000
          000000000000131B4353334AB8E65264D4FF8490E7FF95A0EEFF959FEDFF838E
          E5FF4C5DCEFF243BAAE60C153D53000000000000000000000000000000000000
          0000151E45533C55CAF47584E3FFA1ACF4FF7F8BECFF5C67E4FF5B66E3FF7D87
          EAFF9FA8F1FF6F7CDDFF2740B7F40D153E530000000000000000000000000A0D
          1D223F56C4E57888E6FFA3B0F5FF5767E7FF5665E6FF8992EDFF8892ECFF535F
          E2FF525DE1FF9FA9F2FF6F7DDDFF273DACE50509192200000000000000002733
          6F7E6073E0FFA4B3F7FF5A6EEBFF596CEAFF5869E8FFFFFFFFFFFFFFFFFF5562
          E5FF5461E3FF535FE2FF9FA9F2FF5061D1FF1623607E0000000000000000465E
          C5DB8E9FF0FF8499F4FF5C73EEFF5B70ECFF5A6EEBFF909DF1FFA6AFF3FF5767
          E7FF5665E6FF5562E5FF7D89EBFF8591E7FF2A40AADB0000000000000000546D
          E1F6A0B3F7FF6580F2FF5F78F0FF5D76EFFF5C73EEFFD3D9FAFFFFFFFFFF596C
          EAFF5869E8FF5767E7FF5D6CE7FF99A5F1FF334CC3F600000000000000005872
          E5F6A1B6F8FF6784F4FF607CF3FF5F7AF1FF5F78F0FFFFFFFFFFFFFFFFFF5B70
          ECFF5A6EEBFF596CEAFF5F6FE9FF9BA8F1FF3850C7F600000000000000005269
          CFDB91A6F3FF88A1F8FF6280F4FF617EF3FF607CF3FFFFFFFFFFFFFFFFFF5D76
          EFFF5C73EEFF5B70ECFF8293F1FF8998ECFF354CB4DB0000000000000000313E
          797E6C81ECFFA9BDFBFF6382F5FF6281F5FF6280F4FFFFFFFFFFFFFFFFFF5F7A
          F1FF5F78F0FF5D76EFFFA5B5F8FF5D70DDFF212E6A7E00000000000000000E11
          21225B72DDE58397F0FFA9BDFBFF6382F5FF6382F5FFFFFFFFFFFFFFFFFF617E
          F3FF607CF3FFA6B9F9FF7B8DEAFF425AC7E50A0D1D2200000000000000000000
          0000222B5153627BEDF48497F1FFA9BDFBFF8AA3F8FF6B89F6FF6B89F6FF89A2
          F8FFA8BCFAFF7F92ECFF4E67DAF41A224A530000000000000000000000000000
          000000000000222B51535E75E1E66E83EEFF92A6F4FFA0B4F8FFA0B4F8FF91A6
          F3FF687DE9FF5068D4E61C254C53000000000000000000000000000000000000
          000000000000000000000F12232333417B7D5870D6DB607AEBF35E78E9F3536A
          D1DB2F3C767D0D10212300000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000309
          0D16061522390824396209304E8808395DA4135B90FC0B5185ED999999FF7171
          71FF545454FF515151FF4F4F4FFF4C4C4CFF4A4A4AFF474747FF454545FF2567
          9DFF3274A8FF3D7CAFFF4784B5FF4E8ABAFF3E7EADFF0B5083EA000000000000
          0000585858FFA2A2A2FFA2A2A2FFA3A3A3FFA4A4A4FFA4A4A4FFA5A5A5FF2F6F
          A5FF78ABD2FF78ABD3FF73A7D1FF69A0CDFF407FAEFF0E5285EA000000000000
          00005C5C5CFFA0A0A0FF3C7340FFA2A2A2FFA3A3A3FFA3A3A3FFA4A4A4FF3674
          AAFF7DAFD4FF5B9AC9FF5495C7FF5896C8FF4180AEFF115488EA000000000000
          0000606060FF3A773FFF3D7641FFA1A1A1FFA2A2A2FFA2A2A2FFA3A3A3FF3D79
          B0FF82B3D7FF629FCCFF5A9AC9FF5E9BCAFF4381AFFF17588BEA000000000000
          000039763EFF4D9554FF499150FF286E2DFF266A2AFF236627FF216325FF457E
          B4FF88B7D9FF67A3CFFF619ECCFF639FCCFF4583B1FF1C5C8FEA000000002F6D
          34D4569D5DFF80C688FF7BC383FF77C17FFF72BE79FF6FBC75FF246728FF4C84
          BAFF8DBBDBFF6EA8D1FF66A6D1FF5FB4DFFF4785B1FF226094EA27582CA15EA5
          66FF8BCC94FF7DC586FF73C07CFF6EBD77FF69BB71FF75BF7CFF276C2CFF5489
          BFFF94BFDDFF75ADD4FF63B8E1FF4BD4FFFF428BB8FF286598EA000000003473
          3AD25FA667FF8DCD96FF89CB92FF84C88DFF80C688FF7BC383FF2A7030FF5A8E
          C4FF98C3E0FF7CB3D7FF74AFD6FF5EC4EDFF4B88B3FF306A9DEA000000000000
          000047894FFF60A769FF5DA465FF37823EFF347E3BFF317937FF2E7534FF6092
          C9FF9EC7E2FF83B8DAFF7DB4D7FF7EB3D7FF4F89B4FF366FA2EA000000000000
          0000777777FF4D9054FF3D8A45FF9B9B9BFF9C9C9CFF9D9D9DFF9D9D9DFF6696
          CCFFA2CBE3FF89BDDCFF83B9DAFF84B9DAFF518BB5FF3D74A7EA000000000000
          00007A7A7AFF989998FF529159FF9A9A9AFF9B9B9BFF9C9C9CFF9C9C9CFF6C9A
          D0FFA7CEE5FF8FC1DFFF89BDDCFF8BBDDCFF538DB6FF4579ADEA000000000000
          00007D7D7DFF999999FF999999FF9A9A9AFF9A9A9AFF9B9B9BFF9B9B9BFF6F9D
          D3FFAAD1E7FFABD1E7FF98C7E1FF91C2DEFF568FB7FF4B7EB1EA000000000000
          0000808080FF7E7E7EFF7C7C7CFF7A7A7AFF777777FF757575FF727272FF719E
          D4FF6F9ED6FF87B2DCFFABD3E8FFA9D0E6FF5890B8FF5282B6EA000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000006088B8DB6D9CD4FF85B1DAFF5A91B9FF5887BAEA000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000003B5472896898CFFB5F8DC1EE}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000265F2AC9215725C400000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000003272
          38D1559E5CFF509856FF245E29CF000000000000000000000000704B36A9C38E
          68FFC08B66FFBE8864FFBB8561FFB9835FFFB47E5CFFB07D5AFF599954FF63AC
          6BFF88C990FF82C68AFF529A58FF407537FF6E4C36AB00000000C8926CFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF84C58BFF57AB61FF6AB4
          73FF90CE97FF8ACB91FF6AB070FF3B8442FF52773DFF00000000CA946EFFFFFF
          FFFFFFFFFFFFFFFFFEFFFFFFFDFFFEFEFDFFFEFEFCFFFEFEFCFFFEFEFCFF54AB
          5EFF96D29FFF91CF99FF539F5BFFD4E6D6FFAA7353FF00000000CC976FFFFFFF
          FFFFFFFFFCFFFFFFFDFFFEFEFCFFFEFEFCFFFEFEFBFFFDFDFAFFFDFDFAFF5BB4
          65FF9DD6A6FF99D3A2FF4B9E53FFFFFFFFFFAC7554FF00000000D19C73FFFFFF
          FFFFFEFEFCFFFEFEFCFFFEFEFCFFFDFDFBFFFDFDFBFFFDFDFAFFFDFDF8FF60BC
          6CFF5CB667FF57B061FF52A85CFFFFFFFFFFB07A58FF00000000D49E75FFFFFF
          FFFFFEFEFCFFFDFDFBFFFDFDFCFFFDFDFBFFFDFDF9FFFCFCF8FFFBF9F7FFFBF9
          F5FFFBF8F4FFFBF7F2FFFBF5F2FFFFFFFFFFB27C5AFF00000000D5A076FFFFFF
          FFFFFDFDFCFFFDFDFBFFFDFDFAFFFCFCF9FFFCFBF7FFFBF9F5FFFBF8F4FFFBF7
          F3FFFBF5F2FFFAF3EFFFF8F2ECFFFFFFFFFFB57E5CFF00000000D8A279FFFFFF
          FFFFFDFDFAFFFCFCFAFFFCFBF9FFFBFAF6FFFBF8F5FFFBF7F4FFFBF6F1FFF8F4
          EEFFF7F2EBFFF7F0EAFFF6ECE8FFFFFFFFFFB7815EFF00000000D9A379FFFFFF
          FFFFFCFBF9FFFCFBF8FFFBF9F7FFFBF7F4FFFAF7F2FFF9F5F0FFF7F3EDFFF6EF
          EAFFF5EBE7FFF3EAE4FFF2E7DEFFFFFFFFFFBA8560FF00000000DBA47AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBD8763FF00000000DCA77BFFDCA7
          7BFFDCA77BFFDCA77BFFDCA77BFFDCA77BFFDCA77BFFDCA77BFFDCA77BFFDCA7
          7BFFDCA77BFFDCA77BFFDCA77BFFDCA77BFFC08B66FF00000000DBAB84FDE8B9
          92FFE8B992FFE8B992FFE8B992FFE8B992FFE8B992FFE8B992FFE8B992FFE8B9
          92FFE8B992FFE8B992FFE8B992FFE8B992FFBF8F6EFD00000000472F226BD3A9
          87F4DCA77BFFDCA67AFFDAA47AFFD8A279FFD5A076FFD49E75FFD29D73FFCF9A
          72FFCE9970FFCB966FFFC9946CFFBC9375F4472F226B00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000003E39
          34FF393430FF332F2BFF2C2925FF272421FF201D1BFF0202021A0F0D0CDB0B0A
          09FF070706FF040403FF000000FF000000FF0000000000000000000000004641
          3BFF857A70FFC3B8AEFF7C7268FF7F756BFF36322DFF0202010F211F1CD49589
          7DFFBAAEA2FF7C7268FF7F756BFF010101FF0000000000000000000000004D47
          41FF83786FFFCCC3BAFF786F65FF7B7167FF2E2A27F9000000011B1916EE9589
          7DFFC2B8ADFF786F65FF7C7268FF060505FF000000000000000000000000524B
          45FC83786FFFCCC3BAFF797066FF71685FFF2E2B26D5000000001F1C1BD5857A
          70FFC2B8ADFF786F65FF7B7167FF0A0908FC000000000000000000000000453F
          3AC39F9286FFCCC3BAFFC0B4AAFFA6988BFF292622A8000000001D1B18A89084
          79FFC2B8ADFFC0B4AAFFA89B8EFF0D0B0BC30000000000000000020202055A53
          4CF9423D38FF58514AFF3D3833FF332F2BFF1F1D1AE504040430151412B51A18
          16FF252220FF191715FF0F0E0DFF010101EE0000000200000000030303059D91
          85FFB1A396FF7F756BFF7C7268FF776D64FF6C635BFF2E2A26FF564F48FF8076
          6CFF7C7268FF776D64FF70675EFF000000FE0000000500000000030202049A8E
          83E1BAAEA2FF82776DFF82776DFFAA917BFFBAA794FFB3A18BFAB09781FF9F8D
          7DFF836D5BFF716357FF95897DFF040403E00000000300000000060505082623
          20489B8E82FF9D9185FF867B71FF564F48FF504A44FF80766CFF6E665DFF826C
          58FFA6917DFF948474FF564F48FF0605057A0000000100000000000000000000
          0000746B62FFA4978AFF95897DFF9F9286FF3E3934FF000000004C4640FF7E74
          6AFF857A70FF3E3934FF2D2926A70202020C0000000200000000000000000000
          000000000000000000007E746AE2C3B8AEFF655D55FF000000007C7268FFA89B
          8EFF8B8075E40000000000000000000000000000000000000000000000000000
          000000000000000000008A7F74E2BCB0A4FF9D9185FF00000000AEA093FF9D91
          85FF565049DA0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000041204230D3E0F7D17691BDB196E1DF3196B1DF31761
          1BDB0D370F7D040F042300000000000000000000000000000000000000000000
          000000000000092D0B5318761CE642A052FF87CA9AFF9BD3ABFF9BD2ABFF83C7
          96FF3D974CFF17631BE609240A53000000000000000000000000000000000000
          0000092F0E531A841FF46DBE83FFA8DBB5FF87CC98FF66BC7DFF64BA7CFF86CB
          98FFA5D9B4FF66B77DFF19671CF409250A530000000000000000000000000415
          072219872AE572C287FFA8DBB2FF60BC77FF5CBA73FF59B870FF59B56FFF58B5
          6FFF5BB774FFA5D9B3FF69B87FFF17651BE5040F042200000000000000000F51
          1E7E4CB064FFAADDB4FF64C179FF5FBE71FF75C585FFD4ECD9FF8ACD99FF56B6
          6CFF58B56EFF5CB774FFA6DAB4FF419B4EFF0D3B0F7E00000000000000001B91
          39DB91D29FFF8DD49AFF64C374FF79C987FFF2FAF4FFFFFFFFFFFDFEFDFF86CB
          96FF57B76DFF5BB972FF85CC97FF87C79AFF17671BDB00000000000000001EA7
          40F6A6DCAFFF70CA7FFF73CA80FFF0F9F1FFFFFFFFFFEBF7EDFFFFFFFFFFFBFD
          FCFF88CD96FF5BB971FF67BE7DFFA0D7AFFF1A761DF6000000000000000025AE
          48F6A7DDB1FF72CC80FF66C773FFB0E1B7FFD2EED6FF63C170FFB8E3BFFFFFFF
          FFFFFBFDFCFF8CD099FF69C17EFFA1D7AEFF1A7B1DF6000000000000000027A1
          48DB95D7A1FF91D79BFF69C976FF64C66FFF61C46EFF61C36FFF61C26FFFB9E4
          C0FFFFFFFFFFE3F4E6FF8BD199FF8BCE9DFF18751BDB00000000000000001A5E
          2C7E57BF70FFAFE1B7FF6DCC7AFF68C872FF65C770FF63C56EFF62C46EFF63C4
          71FFB6E3BEFF6FC77EFFACDFB5FF48A95EFF0E47137E0000000000000000081A
          0C222FAB4CE57FCE90FFAEE1B5FF6DCC7AFF6ACA76FF68C872FF68C874FF68C8
          75FF6BC979FFACDFB4FF76C489FF198728E50414062200000000000000000000
          000013401F5332B851F47FCE90FFAFE1B7FF92D89DFF77CE83FF77CE83FF92D8
          9DFFAEE1B5FF78C88BFF1C9630F4093312530000000000000000000000000000
          00000000000014411F5331AF50E659C274FF96D7A3FFA5DCAEFFA5DCAEFF95D6
          A1FF50B96AFF1C9A3CE60A371553000000000000000000000000000000000000
          00000000000000000000091C0D231D612E7D31A74EDB2FB450F32BB24EF3259F
          46DB155A287D05190B2300000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00000000000008242F3700000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000002290B9D5249AC9E902080A0C0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000002080A0C2DAEDFFF2BABDEFF145A778A00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000238EB5CF4FBCE7FF4CBAE6FF239BCCED030F14170000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000002BAFDFFF84D3F2FF55BDE7FF2EAADEFF145D
          7C90000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000002286A9C070CCEEFF83D2F2FF7ECEF1FF4AB6
          E4FF229CCFF1030F14170000000000000000000000000000000035B7D9F035BB
          E0F834B8DFF832B6DEF830B3DDF82EB1DCF886D7F3FF2FB6EBFF4ABCECFF80CE
          F1FF51B9E6FF2CA8DDFF1664869D00000000000000000000000035B3D4E975DA
          F2FF93E6F8FF91E3F7FF8DE0F6FF8ADCF5FF8ADBF5FF88D7F4FF84D3F2FF7FCF
          F1FF7CCCF0FF7AC9EFFF48B4E3FF229DD1F504161E23000000000D2B32374FCD
          ECFF98E9F9FF4AD5F3FF45CFF1FF40CAF0FF38C2EEFF89D9F4FF2EB3E0FE2BAC
          DAF82AA9D9F828A7D8F826A4D6F824A1D5F82095C7E9000000000000000038BE
          DFF480E1F5FF8EE6F8FF43D2F3FF3FCDF1FF39C7EFFF8CDCF5FF58C6EAFF1552
          6674000000000000000000000000000000000000000000000000000000001442
          4D545BD4EFFF99EAF9FF47D6F4FF42D0F2FF3DCBF0FF6ED5F3FF7FD7F3FF4AC0
          E7FF0E34414A0000000000000000000000000000000000000000000000000000
          00003CC5E4F993E9F9FF72E1F7FF45D4F3FF41CEF2FF3CC9F0FF8ADCF5FF70D0
          EFFF3DBBE4FF06191F2300000000000000000000000000000000000000000000
          00002069798364D9F1FF9AEBFAFF48D8F4FF44D3F3FF3FCEF1FF3AC8F0FF8CDC
          F5FF62CBEDFF30B6E0FC00000000000000000000000000000000000000000000
          0000000000003FCAE9FD9AEDFAFF99EBF9FF97E8F9FF94E5F8FF91E2F7FF8EDF
          F6FF8BDBF5FF56C7EBFF2FAFD8F3000000000000000000000000000000000000
          000000000000298396A23FCCEBFF3ECBEAFF3CC9E9FF3BC7E9FF3AC4E8FF38C2
          E7FF36C0E6FF35BDE5FF33BBE4FF2BA2C8E10000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end>
  end
  object dxBarManager1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.Images = dm.cxImageList1
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 544
    Top = 8
    DockControlHeights = (
      0
      0
      26
      0)
    object dxBarManager1Bar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Cadastro'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 806
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton1'
        end
        item
          Visible = True
          ItemName = 'dxBarButton2'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton3'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton4'
        end
        item
          Visible = True
          ItemName = 'dxBarButton7'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton6'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton5'
        end>
      OneOnRow = True
      Row = 0
      ShowMark = False
      SizeGrip = False
      UseOwnFont = False
      UseRecentItems = False
      UseRestSpace = True
      Visible = True
      WholeRow = False
    end
    object dxBarButton1: TdxBarButton
      Action = actCadastroIncluir
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton2: TdxBarButton
      Action = actCadastroExcluir
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton3: TdxBarButton
      Action = actCadastroCancelar
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton4: TdxBarButton
      Action = actCadastroSalvar
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton5: TdxBarButton
      Action = actCadastroSair
      Align = iaRight
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton6: TdxBarButton
      Action = actCadastroRestricao
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton7: TdxBarButton
      Action = actCadastroImportar
      Category = 0
      PaintStyle = psCaptionGlyph
    end
  end
end
