object frmAtribuicoesJornal: TfrmAtribuicoesJornal
  Left = 0
  Top = 0
  Caption = 'Atribui'#231#245'es de Per'#243'dicos'
  ClientHeight = 603
  ClientWidth = 971
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesigned
  ShowHint = True
  Visible = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 202
    Width = 965
    Height = 344
    Align = alClient
    TabOrder = 1
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.Images = dm.cxImageList1
      Navigator.Buttons.PriorPage.Visible = False
      Navigator.Buttons.NextPage.Visible = False
      Navigator.Buttons.Insert.Visible = False
      Navigator.Buttons.Delete.ImageIndex = 8
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = False
      Navigator.Buttons.Post.Visible = False
      Navigator.Buttons.Cancel.Visible = False
      Navigator.Buttons.Refresh.Visible = False
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.Buttons.Filter.Visible = False
      Navigator.InfoPanel.DisplayMask = 'Registro [RecordIndex] de [RecordCount]'
      Navigator.InfoPanel.Visible = True
      Navigator.Visible = True
      DataController.DataSource = dm.dsAtribuicoes
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0;- ,0'
          Kind = skSum
        end
        item
          Format = ',0.000;- ,0.000'
          Kind = skSum
        end
        item
          Format = ',0'
          Kind = skCount
        end
        item
          Format = 'TOTAIS'
          Kind = skCount
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnHidingOnGrouping = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.NoDataToDisplayInfoText = 'Nenhuma Informa'#231#227'o dispon'#237'vel'
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object cxGrid1DBTableView1RecId: TcxGridDBColumn
        DataBinding.FieldName = 'RecId'
        Visible = False
        HeaderAlignmentHorz = taCenter
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1ID_ASSINANTE: TcxGridDBColumn
        DataBinding.FieldName = 'ID_ASSINANTE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1DAT_ATRIBUICAO: TcxGridDBColumn
        DataBinding.FieldName = 'DAT_ATRIBUICAO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1COD_PRODUTO: TcxGridDBColumn
        DataBinding.FieldName = 'COD_PRODUTO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1NUM_EDICAO: TcxGridDBColumn
        DataBinding.FieldName = 'NUM_EDICAO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1COD_ASSINANTE: TcxGridDBColumn
        Caption = 'C'#243'digo'
        DataBinding.FieldName = 'COD_ASSINANTE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 43
      end
      object cxGrid1DBTableView1COD_TIPO_ASSINATURA: TcxGridDBColumn
        DataBinding.FieldName = 'COD_TIPO_ASSINATURA'
        Visible = False
        HeaderAlignmentHorz = taCenter
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1COD_ENTREGADOR: TcxGridDBColumn
        DataBinding.FieldName = 'COD_ENTREGADOR'
        Visible = False
        HeaderAlignmentHorz = taCenter
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1NOM_ASSINANTE: TcxGridDBColumn
        Caption = 'Nome'
        DataBinding.FieldName = 'NOM_ASSINANTE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 81
      end
      object cxGrid1DBTableView1COD_BARRA: TcxGridDBColumn
        DataBinding.FieldName = 'COD_BARRA'
        Visible = False
        HeaderAlignmentHorz = taCenter
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1NOM_CUIDADOS: TcxGridDBColumn
        DataBinding.FieldName = 'NOM_CUIDADOS'
        Visible = False
        HeaderAlignmentHorz = taCenter
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1DES_ENDERECO: TcxGridDBColumn
        Caption = 'Endere'#231'o'
        DataBinding.FieldName = 'DES_ENDERECO'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 115
      end
      object cxGrid1DBTableView1DES_COMPLEMENTO: TcxGridDBColumn
        DataBinding.FieldName = 'DES_COMPLEMENTO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1DES_BAIRRO: TcxGridDBColumn
        Caption = 'Bairro'
        DataBinding.FieldName = 'DES_BAIRRO'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 82
      end
      object cxGrid1DBTableView1DES_REFERENCIA: TcxGridDBColumn
        DataBinding.FieldName = 'DES_REFERENCIA'
        Visible = False
        HeaderAlignmentHorz = taCenter
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1DES_CIDADE: TcxGridDBColumn
        Caption = 'Cidade'
        DataBinding.FieldName = 'DES_CIDADE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 56
      end
      object cxGrid1DBTableView1DES_UF: TcxGridDBColumn
        DataBinding.FieldName = 'DES_UF'
        Visible = False
        HeaderAlignmentHorz = taCenter
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1CEP_ENDERECO: TcxGridDBColumn
        Caption = 'CEP'
        DataBinding.FieldName = 'CEP_ENDERECO'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 105
      end
      object cxGrid1DBTableView1QTD_EXEMPLARES: TcxGridDBColumn
        Caption = 'Exemplares'
        DataBinding.FieldName = 'QTD_EXEMPLARES'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.IgnoreMaskBlank = True
        Properties.LookupItemsSorted = True
        Properties.MaskKind = emkRegExpr
        Properties.EditMask = '\d\d\d\d\d\d'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 87
      end
      object cxGrid1DBTableView1NUM_ROTEIRO: TcxGridDBColumn
        DataBinding.FieldName = 'NUM_ROTEIRO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1NOM_USUARIO: TcxGridDBColumn
        DataBinding.FieldName = 'NOM_USUARIO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1DAT_MANUTENCAO: TcxGridDBColumn
        DataBinding.FieldName = 'DAT_MANUTENCAO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1DES_PRODUTO: TcxGridDBColumn
        Caption = 'Produto'
        DataBinding.FieldName = 'DES_PRODUTO'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 133
      end
      object cxGrid1DBTableView1DES_TIPO_ASSINATURA: TcxGridDBColumn
        Caption = 'Tipo Assinatura'
        DataBinding.FieldName = 'DES_TIPO_ASSINATURA'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 259
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object cxLabel16: TcxLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alTop
    AutoSize = False
    Caption = 'Atribui'#231#245'es de Peri'#243'dicos'
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -21
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Properties.Alignment.Vert = taVCenter
    Transparent = True
    Height = 35
    Width = 965
    AnchorY = 21
  end
  object cxPageControl1: TcxPageControl
    AlignWithMargins = True
    Left = 3
    Top = 44
    Width = 965
    Height = 152
    Align = alTop
    TabOrder = 0
    Properties.ActivePage = cxTabSheet1
    Properties.CustomButtons.Buttons = <>
    OnClick = cxPageControl1Click
    ClientRectBottom = 150
    ClientRectLeft = 2
    ClientRectRight = 963
    ClientRectTop = 28
    object cxTabSheet1: TcxTabSheet
      Caption = 'Atribui'#231#227'o Manual'
      ImageIndex = 0
      ExplicitLeft = 3
      ExplicitTop = 26
      ExplicitWidth = 956
      ExplicitHeight = 120
      object cxGroupBox1: TcxGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Align = alTop
        Caption = 'Atribui'#231#245'es'
        TabOrder = 0
        ExplicitWidth = 950
        Height = 113
        Width = 955
        object cxLabel10: TcxLabel
          Left = 13
          Top = 16
          Caption = '&Entregador'
          Transparent = True
        end
        object cxButton1: TcxButton
          Left = 598
          Top = 37
          Width = 75
          Height = 20
          Cursor = crHandPoint
          Action = actAtribuicoesIniciar
          TabOrder = 4
        end
        object cxLabel3: TcxLabel
          Left = 13
          Top = 59
          Caption = 'ID Assinante'
          Transparent = True
        end
        object cxData: TcxDateEdit
          Left = 415
          Top = 36
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
          Properties.DateButtons = [btnClear, btnToday]
          Properties.SaveTime = False
          Properties.ShowTime = False
          TabOrder = 3
          Width = 87
        end
        object cxNomeEntregador: TcxTextEdit
          Left = 93
          Top = 36
          Hint = 'Nome do Entregador'
          TabStop = False
          Properties.ReadOnly = True
          TabOrder = 2
          Width = 316
        end
        object cxCodigoEntregador: TcxButtonEdit
          Left = 13
          Top = 36
          Hint = 'C'#243'digo do Entregador'
          Properties.Alignment.Horz = taRightJustify
          Properties.Buttons = <
            item
              Action = actAtribuicoesApoio
              Default = True
              Kind = bkGlyph
            end>
          Properties.Images = dm.cxImageList1
          Properties.OnChange = cxCodigoEntregadorPropertiesChange
          Properties.OnValidate = cxCodigoEntregadorPropertiesValidate
          TabOrder = 1
          Width = 74
        end
        object cxNossoNumero: TcxMaskEdit
          Left = 13
          Top = 82
          Properties.IgnoreMaskBlank = True
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d\d\d\d\d\d\d\d\d\d\d\d\d\d'
          Properties.OnEditValueChanged = cxNossoNumeroPropertiesEditValueChanged
          Properties.OnValidate = cxNossoNumeroPropertiesValidate
          TabOrder = 6
          Width = 113
        end
        object cxLabel1: TcxLabel
          Left = 415
          Top = 16
          Caption = '&Data'
          Transparent = True
        end
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'Atribui'#231#227'o Automatica'
      ImageIndex = 1
      ExplicitLeft = 3
      ExplicitTop = 26
      ExplicitWidth = 956
      ExplicitHeight = 120
      object cxGroupBox3: TcxGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Align = alTop
        Caption = 'Atribui'#231#245'es'
        TabOrder = 0
        ExplicitWidth = 950
        Height = 113
        Width = 955
        object cxLabel2: TcxLabel
          Left = 11
          Top = 16
          Caption = 'Roteiro'
          Transparent = True
        end
        object cxDataAtribuicao: TcxDateEdit
          Left = 138
          Top = 39
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
          Properties.DateButtons = [btnClear, btnToday]
          Properties.SaveTime = False
          Properties.ShowTime = False
          TabOrder = 2
          Width = 87
        end
        object cxLabel5: TcxLabel
          Left = 138
          Top = 16
          Caption = '&Data'
          Transparent = True
        end
        object cxRoteiro: TcxComboBox
          Left = 11
          Top = 39
          TabOrder = 1
          Width = 121
        end
        object cxLabel4: TcxLabel
          Left = 231
          Top = 16
          Caption = '&Entregador'
          Transparent = True
        end
        object cxCodEntregador: TcxButtonEdit
          Left = 231
          Top = 39
          Hint = 'C'#243'digo do Entregador'
          Properties.Alignment.Horz = taRightJustify
          Properties.Buttons = <
            item
              Action = actAtribuicoesApoio
              Default = True
              Kind = bkGlyph
            end>
          Properties.Images = dm.cxImageList1
          Properties.OnChange = cxCodigoEntregadorPropertiesChange
          Properties.OnValidate = cxCodigoEntregadorPropertiesValidate
          TabOrder = 3
          Width = 74
        end
        object cxNomEntregador: TcxTextEdit
          Left = 311
          Top = 39
          Hint = 'Nome do Entregador'
          TabStop = False
          Properties.ReadOnly = True
          TabOrder = 4
          Width = 282
        end
        object cxButton3: TcxButton
          Left = 599
          Top = 37
          Width = 75
          Height = 20
          Cursor = crHandPoint
          Action = actAtribuicoesExecutar
          TabOrder = 7
        end
      end
    end
  end
  object cxGroupBox2: TcxGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 552
    Align = alBottom
    TabOrder = 3
    DesignSize = (
      965
      48)
    Height = 48
    Width = 965
    object cxButton2: TcxButton
      Left = 561
      Top = 12
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Action = actAtribuicoesCancelar
      Anchors = [akRight, akBottom]
      TabOrder = 0
    end
    object cxButton4: TcxButton
      Left = 642
      Top = 12
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Action = actAtribuicoesExportar
      Anchors = [akRight, akBottom]
      TabOrder = 1
    end
    object cxButton5: TcxButton
      Left = 723
      Top = 12
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Action = actAtribuicoesImprimir
      Anchors = [akRight, akBottom]
      TabOrder = 2
    end
    object cxButton6: TcxButton
      Left = 804
      Top = 12
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Action = actAtribuicoesSalvar
      Anchors = [akRight, akBottom]
      TabOrder = 3
    end
    object cxButton7: TcxButton
      Left = 885
      Top = 12
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Action = actAtribuicoesSair
      Anchors = [akRight, akBottom]
      TabOrder = 4
    end
  end
  object aclAtribuicoes: TActionList
    Images = dm.cxImageList1
    Left = 536
    Top = 16
    object actAtribuicoesIniciar: TAction
      Tag = 3
      Category = 'Atribui'#231#245'es'
      Caption = 'Iniciar'
      Hint = 'Iniciar Rotina de Atribui'#231#245'es de Entregas'
      ImageIndex = 27
      OnExecute = actAtribuicoesIniciarExecute
    end
    object actAtribuicoesApoio: TAction
      Tag = 3
      Category = 'Atribui'#231#245'es'
      Caption = 'Lista de Apoio'
      Hint = 'Lista de Apoio'
      ImageIndex = 11
      OnExecute = actAtribuicoesApoioExecute
    end
    object actAtribuicoesCancelar: TAction
      Tag = 3
      Category = 'Atribui'#231#245'es'
      Caption = 'Cancelar'
      Hint = 'Cancelar Rotina de Atribui'#231#245'es'
      ImageIndex = 6
      OnExecute = actAtribuicoesCancelarExecute
    end
    object actAtribuicoesReatribuir: TAction
      Tag = 3
      Category = 'Atribui'#231#245'es'
      Caption = 'Reatribuir'
      Enabled = False
      Hint = 'Reatribuir as Entregas a outro Entregador'
      ImageIndex = 31
    end
    object actAtribuicoesSalvar: TAction
      Tag = 3
      Category = 'Atribui'#231#245'es'
      Caption = 'Salvar'
      Hint = 'Salvar Atribui'#231#245'es n o Banco de Dados'
      ImageIndex = 9
      OnExecute = actAtribuicoesSalvarExecute
    end
    object actAtribuicoesSair: TAction
      Tag = 99
      Category = 'Atribui'#231#245'es'
      Caption = 'Sair'
      Hint = 'Sair da Tela'
      ImageIndex = 10
      OnExecute = actAtribuicoesSairExecute
    end
    object actAtribuicoesExportar: TAction
      Tag = 3
      Category = 'Atribui'#231#245'es'
      Caption = 'Exportar'
      Hint = 'Exportar dados da grade'
      ImageIndex = 29
      OnExecute = actAtribuicoesExportarExecute
    end
    object actAtribuicoesImprimir: TAction
      Tag = 3
      Category = 'Atribui'#231#245'es'
      Caption = 'Imprimir'
      Hint = 'Imprimir Relat'#243'rio de Atribui'#231#245'es'
      ImageIndex = 15
      OnExecute = actAtribuicoesImprimirExecute
    end
    object actAtribuicoesExecutar: TAction
      Tag = 3
      Category = 'Atribui'#231#245'es'
      Caption = 'Executar'
      Hint = 'Executar Atribui'#231#227'o'
      ImageIndex = 27
      OnExecute = actAtribuicoesExecutarExecute
    end
  end
  object SaveDialog: TSaveDialog
    Left = 576
    Top = 16
  end
  object frxReport: TfrxReport
    Version = '5.3.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbNavigator, pbExportQuick]
    PreviewOptions.MDIChild = True
    PreviewOptions.Modal = False
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41571.591435173600000000
    ReportOptions.LastChange = 42272.800511921300000000
    ScriptLanguage = 'PascalScript'
    StoreInDFM = False
    Left = 616
    Top = 16
  end
  object frxDBDataset: TfrxDBDataset
    UserName = 'frxDBDataset'
    CloseDataSource = False
    DataSet = dm.tbAtribuicoesJornal
    BCDToCurrency = False
    Left = 656
    Top = 16
  end
end
