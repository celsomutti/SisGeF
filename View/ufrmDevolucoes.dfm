object frmDevolucoes: TfrmDevolucoes
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Devolu'#231#245'es (Log'#237'stica Reversa)'
  ClientHeight = 534
  ClientWidth = 1037
  Color = clWhite
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  DesignSize = (
    1037
    534)
  PixelsPerInch = 96
  TextHeight = 13
  object cxPageControl1: TcxPageControl
    AlignWithMargins = True
    Left = 3
    Top = 47
    Width = 1031
    Height = 458
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Properties.ActivePage = cxTabSheet3
    Properties.CustomButtons.Buttons = <>
    OnClick = cxPageControl1Click
    ClientRectBottom = 456
    ClientRectLeft = 2
    ClientRectRight = 1029
    ClientRectTop = 28
    object cxTabSheet3: TcxTabSheet
      Caption = 'Importa'#231#227'o de Devolu'#231#245'es'
      ImageIndex = 2
      DesignSize = (
        1027
        428)
      object cxLabel4: TcxLabel
        Left = 16
        Top = 8
        Caption = 'Data da Expedi'#231#227'o'
        Transparent = True
      end
      object cxData: TcxDateEdit
        Left = 24
        Top = 24
        Hint = 'Data da Expedi'#231#227'o'
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
        Properties.OnChange = cxExpedicaoExpectativaPropertiesChange
        TabOrder = 1
        Width = 105
      end
      object cxLabel5: TcxLabel
        AlignWithMargins = True
        Left = 135
        Top = 8
        Caption = '&Arquivo:'
        FocusControl = cxArquivo
        Transparent = True
      end
      object cxArquivo: TcxButtonEdit
        AlignWithMargins = True
        Left = 135
        Top = 24
        Hint = 'Informe o nome do Arquivo de Entregas a ser Inportado.'
        Properties.Buttons = <
          item
            Default = True
            ImageIndex = 46
            Kind = bkGlyph
          end>
        Properties.Images = dm.cxImageList1
        Properties.OnButtonClick = cxArquivoPropertiesButtonClick
        TabOrder = 3
        Width = 458
      end
      object cxGrid3: TcxGrid
        Left = 16
        Top = 51
        Width = 715
        Height = 342
        TabOrder = 4
        object cxGrid3DBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.PriorPage.Visible = False
          Navigator.Buttons.NextPage.Visible = False
          Navigator.Buttons.Insert.Visible = False
          Navigator.Buttons.Delete.Visible = False
          Navigator.Buttons.Edit.Visible = False
          Navigator.Buttons.Post.Visible = False
          Navigator.Buttons.Cancel.Visible = False
          Navigator.Buttons.Refresh.Visible = False
          Navigator.Buttons.SaveBookmark.Visible = False
          Navigator.Buttons.GotoBookmark.Visible = False
          Navigator.Buttons.Filter.Visible = False
          Navigator.InfoPanel.DisplayMask = '[RecordCount] Objetos'
          Navigator.InfoPanel.Visible = True
          Navigator.Visible = True
          DataController.DataSource = ds3
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          Images = dm.cxImageList1
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnHidingOnGrouping = False
          OptionsCustomize.ColumnMoving = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Inserting = False
          OptionsView.NoDataToDisplayInfoText = '<Nenhuma Informa'#231#227'o Dispon'#237'vel>'
          OptionsView.CellAutoHeight = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          object cxGrid3DBTableView1COD_BASE: TcxGridDBColumn
            DataBinding.FieldName = 'COD_BASE'
            Visible = False
            SortIndex = 0
            SortOrder = soAscending
          end
          object cxGrid3DBTableView1DES_BASE: TcxGridDBColumn
            Caption = 'Base'
            DataBinding.FieldName = 'DES_BASE'
            Visible = False
            GroupIndex = 0
          end
          object cxGrid3DBTableView1DOM_MARCA: TcxGridDBColumn
            DataBinding.FieldName = 'DOM_MARCA'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.ImmediatePost = True
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = 'S'
            Properties.ValueUnchecked = 'N'
            Properties.OnChange = cxGrid3DBTableView1DOM_MARCAPropertiesChange
            HeaderAlignmentHorz = taCenter
            HeaderGlyphAlignmentHorz = taCenter
            HeaderImageIndex = 51
            Options.ShowCaption = False
            Width = 39
          end
          object cxGrid3DBTableView1DAT_EXPEDICAO: TcxGridDBColumn
            Caption = 'Expedi'#231#227'o'
            DataBinding.FieldName = 'DAT_EXPEDICAO'
            PropertiesClassName = 'TcxDateEditProperties'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Width = 98
          end
          object cxGrid3DBTableView1NUM_NOSSONUMERO: TcxGridDBColumn
            Caption = 'Nosso N'#250'mero'
            DataBinding.FieldName = 'NUM_NOSSONUMERO'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Width = 128
          end
          object cxGrid3DBTableView1NUM_VOLUME: TcxGridDBColumn
            Caption = 'Volume'
            DataBinding.FieldName = 'NUM_VOLUME'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
          end
          object cxGrid3DBTableView1COD_STATUS: TcxGridDBColumn
            Caption = 'Situa'#231#227'o'
            DataBinding.FieldName = 'COD_STATUS'
            PropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.Images = dm.cxImageList1
            Properties.Items = <
              item
                Description = 'PENDENTE'
                ImageIndex = 50
                Value = 0
              end
              item
                Description = 'IMPORTADO'
                ImageIndex = 51
                Value = 1
              end
              item
                Description = 'REJEITADO'
                ImageIndex = 25
                Value = 2
              end>
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Width = 173
          end
          object cxGrid3DBTableView1DES_CEP: TcxGridDBColumn
            Caption = 'CEP'
            DataBinding.FieldName = 'DES_CEP'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Width = 86
          end
        end
        object cxGrid3Level1: TcxGridLevel
          GridView = cxGrid3DBTableView1
        end
      end
      object cxButton11: TcxButton
        Left = 737
        Top = 49
        Width = 122
        Height = 20
        Cursor = crHandPoint
        Action = actDevolucaoImportar
        Anchors = [akRight, akBottom]
        TabOrder = 5
      end
      object cxProgressBar1: TcxProgressBar
        Left = 16
        Top = 399
        Anchors = [akLeft, akTop, akRight]
        Properties.BarStyle = cxbsLEDs
        Properties.ShowTextStyle = cxtsText
        TabOrder = 6
        Width = 577
      end
      object cxButton12: TcxButton
        Left = 737
        Top = 75
        Width = 122
        Height = 20
        Cursor = crHandPoint
        Action = actDevolucaoSalvarImportacao
        Anchors = [akRight, akBottom]
        TabOrder = 7
      end
      object cxButton13: TcxButton
        Left = 737
        Top = 343
        Width = 122
        Height = 20
        Cursor = crHandPoint
        Action = actDevolucaoMarcar
        Anchors = [akRight, akBottom]
        TabOrder = 8
      end
      object cxButton14: TcxButton
        Left = 737
        Top = 369
        Width = 122
        Height = 20
        Cursor = crHandPoint
        Action = actDevolucaoDesmarcar
        Anchors = [akRight, akBottom]
        TabOrder = 9
      end
    end
    object cxTabSheet1: TcxTabSheet
      Caption = 'Expectativa de Devolu'#231#227'o'
      ImageIndex = 0
      DesignSize = (
        1027
        428)
      object cxLabel1: TcxLabel
        Left = 16
        Top = 16
        Caption = 'Data da Expedi'#231#227'o'
        Transparent = True
      end
      object cxExpedicaoExpectativa: TcxDateEdit
        Left = 16
        Top = 32
        Hint = 'Data da Expedi'#231#227'o'
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
        Properties.OnChange = cxExpedicaoExpectativaPropertiesChange
        TabOrder = 1
        Width = 105
      end
      object cxGrid1: TcxGrid
        Left = 16
        Top = 82
        Width = 1001
        Height = 315
        Anchors = [akLeft, akTop, akRight, akBottom]
        Images = dm.cxImageList1
        TabOrder = 4
        object cxGrid1DBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.Images = dm.cxImageList1
          Navigator.Buttons.PriorPage.Visible = False
          Navigator.Buttons.NextPage.Visible = False
          Navigator.Buttons.Insert.Hint = 'Inserir Objeto'
          Navigator.Buttons.Insert.ImageIndex = 1
          Navigator.Buttons.Insert.Visible = False
          Navigator.Buttons.Delete.Hint = 'Excluir Objeto'
          Navigator.Buttons.Delete.ImageIndex = 8
          Navigator.Buttons.Delete.Visible = False
          Navigator.Buttons.Edit.Visible = False
          Navigator.Buttons.Post.Visible = False
          Navigator.Buttons.Cancel.Hint = 'Cancelar Opera'#231#227'o'
          Navigator.Buttons.Cancel.ImageIndex = 6
          Navigator.Buttons.Cancel.Visible = False
          Navigator.Buttons.Refresh.Visible = False
          Navigator.Buttons.SaveBookmark.Visible = False
          Navigator.Buttons.GotoBookmark.Visible = False
          Navigator.Buttons.Filter.Visible = False
          Navigator.InfoPanel.DisplayMask = '[RecordCount] Objetos'
          Navigator.InfoPanel.Visible = True
          Navigator.Visible = True
          DataController.DataSource = ds1
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          Images = dm.cxImageList1
          NewItemRow.InfoText = 'Digite ou Leie o Nosso N'#250'mero'
          NewItemRow.Visible = True
          OptionsBehavior.CopyCaptionsToClipboard = False
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.FocusCellOnCycle = True
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnHidingOnGrouping = False
          OptionsCustomize.ColumnMoving = False
          OptionsCustomize.ColumnSorting = False
          OptionsSelection.InvertSelect = False
          OptionsSelection.MultiSelect = True
          OptionsSelection.CellMultiSelect = True
          OptionsView.NoDataToDisplayInfoText = 'Nenhuma Informa'#231#227'o Dispon'#237'vel'
          OptionsView.CellAutoHeight = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          object cxGrid1DBTableView1DOM_MARCA: TcxGridDBColumn
            DataBinding.FieldName = 'DOM_MARCA'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.ValueChecked = 'S'
            Properties.ValueUnchecked = 'N'
            HeaderAlignmentHorz = taCenter
            HeaderGlyphAlignmentHorz = taCenter
            HeaderImageIndex = 51
            Width = 35
            IsCaptionAssigned = True
          end
          object cxGrid1DBTableView1NUM_NOSSONUMERO: TcxGridDBColumn
            Caption = 'Nosso N'#250'mero'
            DataBinding.FieldName = 'NUM_NOSSONUMERO'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.IgnoreMaskBlank = True
            Properties.MaskKind = emkRegExpr
            Properties.EditMask = '\d\d\d\d\d\d\d\d\d\d\d'
            Properties.OnValidate = cxGrid1DBTableView1NUM_NOSSONUMEROPropertiesValidate
            HeaderAlignmentHorz = taCenter
            Width = 85
          end
          object cxGrid1DBTableView1QTD_VOLUMES: TcxGridDBColumn
            Caption = 'Vol. N'#186'.'
            DataBinding.FieldName = 'QTD_VOLUMES'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.IgnoreMaskBlank = True
            Properties.MaskKind = emkRegExpr
            Properties.EditMask = '\d\d\d\d\d'
            Properties.OnValidate = cxGrid1DBTableView1QTD_VOLUMESPropertiesValidate
            HeaderAlignmentHorz = taCenter
            Width = 58
          end
          object cxGrid1DBTableView1COD_STATUS_OBJETO: TcxGridDBColumn
            Caption = 'Status Objeto'
            DataBinding.FieldName = 'COD_STATUS_OBJETO'
            PropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.Images = dm.cxImageList1
            Properties.Items = <
              item
                Description = 'EM EXPECTATIVA'
                ImageIndex = 25
                Value = 0
              end
              item
                Description = 'EM CONTAINER'
                ImageIndex = 23
                Value = 1
              end
              item
                Description = 'DESCOBERTO'
                ImageIndex = 24
                Value = 2
              end
              item
                Description = 'EXTRAVIADO'
                ImageIndex = 32
                Value = 3
              end
              item
                Description = 'CONFERIDO'
                ImageIndex = 51
                Value = 4
              end>
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Width = 130
          end
          object cxGrid1DBTableView1CD_STATUS_CONTAINER: TcxGridDBColumn
            Caption = 'Status Expedi'#231#227'o'
            DataBinding.FieldName = 'COD_STATUS_CONTAINER'
            PropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.Images = dm.cxImageList1
            Properties.Items = <
              item
                Description = 'EXPEDI'#199#195'O ABERTA'
                ImageIndex = 21
                Value = 0
              end
              item
                Description = 'EXPEDI'#199#195'O FECHADA'
                ImageIndex = 20
                Value = 1
              end
              item
                Description = 'DESPACHADO'
                ImageIndex = 23
                Value = 2
              end
              item
                Description = 'RETIRADO'
                ImageIndex = 53
                Value = 3
              end
              item
                Description = 'RECEBIDO'
                ImageIndex = 54
                Value = 4
              end
              item
                Description = 'CONFERIDO'
                ImageIndex = 51
                Value = 5
              end>
            Properties.ReadOnly = True
            GroupSummaryAlignment = taCenter
            HeaderAlignmentHorz = taCenter
            Width = 147
          end
          object cxGrid1DBTableView1DAT_EXPEDICAO: TcxGridDBColumn
            Caption = 'Expedi'#231#227'o'
            DataBinding.FieldName = 'DAT_EXPEDICAO'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Width = 95
          end
          object cxGrid1DBTableView1DES_DEVOLUCAO: TcxGridDBColumn
            Caption = 'Descri'#231#227'o'
            DataBinding.FieldName = 'DES_DEVOLUCAO'
            PropertiesClassName = 'TcxComboBoxProperties'
            Properties.DropDownListStyle = lsFixedList
            Properties.Items.Strings = (
              'DST-Devolu'#231#227'o Solicita'#231#227'o TFO'
              'RRI-Retorno  Remessa Indevida'
              'RTE-Retorno Troca de Etiquetas'
              'RSS-Retorno Sistema'
              'SER-Simples Envio/Remessa'
              'EGB-Envio Gerado pela Base')
            HeaderAlignmentHorz = taCenter
            Width = 172
          end
          object cxGrid1DBTableView1COD_BASE: TcxGridDBColumn
            Caption = 'Base'
            DataBinding.FieldName = 'COD_BASE'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'COD_AGENTE'
            Properties.ListColumns = <
              item
                FieldName = 'NOM_FANTASIA'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dsBases
            Properties.ReadOnly = True
            Width = 277
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
      object cxLabel3: TcxLabel
        Left = 16
        Top = 59
        Caption = 'Objetos'
        Transparent = True
      end
      object cxButton1: TcxButton
        Left = 16
        Top = 403
        Width = 122
        Height = 20
        Cursor = crHandPoint
        Action = actDevolucaoNovaExpectativa
        Anchors = [akLeft, akBottom]
        TabOrder = 6
      end
      object cxButton2: TcxButton
        Left = 144
        Top = 403
        Width = 122
        Height = 20
        Cursor = crHandPoint
        Action = actDevolucaoExcluirExpectativa
        Anchors = [akLeft, akBottom]
        TabOrder = 7
      end
      object cxButton3: TcxButton
        Left = 272
        Top = 403
        Width = 122
        Height = 20
        Cursor = crHandPoint
        Action = actDevolucaoSalvarExpectativas
        Anchors = [akLeft, akBottom]
        TabOrder = 8
      end
      object cxButton4: TcxButton
        Left = 542
        Top = 403
        Width = 122
        Height = 20
        Cursor = crHandPoint
        Action = actDevolucaoFecharExpectativa
        Anchors = [akLeft, akBottom]
        TabOrder = 10
      end
      object chkTFO: TcxCheckBox
        Left = 78
        Top = 57
        Hint = 'Selecione se a etiqueta do objeto '#233' da Transfolha'
        TabStop = False
        Caption = 'Etiqueta &TFO'
        State = cbsChecked
        TabOrder = 3
        Transparent = True
      end
      object cxButton15: TcxButton
        Left = 400
        Top = 403
        Width = 136
        Height = 20
        Cursor = crHandPoint
        Action = actDEvolucaoAlterarBase
        Anchors = [akLeft, akBottom]
        TabOrder = 9
      end
      object cxButton16: TcxButton
        Tag = 3
        Left = 144
        Top = 31
        Width = 122
        Height = 20
        Cursor = crHandPoint
        Action = actDevolucaoIniciarExpectativa
        Anchors = [akLeft, akBottom]
        TabOrder = 2
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'Confer'#234'ncia da Devolu'#231#227'o'
      ImageIndex = 1
      DesignSize = (
        1027
        428)
      object cxNossoNumero: TcxTextEdit
        Left = 127
        Top = 65
        ParentFont = False
        Properties.CharCase = ecUpperCase
        Properties.ReadOnly = True
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.Shadow = False
        Style.IsFontAssigned = True
        TabOrder = 8
        OnExit = cxNossoNumeroExit
        Width = 153
      end
      object cxNomAgente: TcxTextEdit
        Left = 215
        Top = 24
        Hint = 'Nome da Base'
        TabStop = False
        Properties.ReadOnly = True
        TabOrder = 2
        Width = 386
      end
      object cxCheckBox1: TcxCheckBox
        Left = 16
        Top = 65
        Hint = 'Selecione se a etiqueta do objeto '#233' da Transfolha'
        TabStop = False
        Caption = 'Etiqueta &TFO'
        State = cbsChecked
        TabOrder = 5
        Transparent = True
      end
      object cxLabel6: TcxLabel
        Left = 128
        Top = 51
        Caption = 'Nosso N'#250'mero'
        Transparent = True
      end
      object cxLabel7: TcxLabel
        Left = 719
        Top = 8
        Caption = 'Peso Container'
        Transparent = True
      end
      object cxPesoContainer: TcxTextEdit
        Left = 719
        Top = 24
        TabStop = False
        Properties.Alignment.Horz = taRightJustify
        Properties.ReadOnly = True
        TabOrder = 4
        Width = 77
      end
      object cxLabel8: TcxLabel
        Left = 607
        Top = 8
        Caption = 'N'#186'. Lacre/Protocolo'
        Transparent = True
      end
      object cxLacre: TcxMaskEdit
        Left = 607
        Top = 24
        Hint = 'N'#250'mero do Lacre'
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.IgnoreMaskBlank = True
        Properties.MaskKind = emkRegExpr
        Properties.ReadOnly = True
        Properties.OnEditValueChanged = cxLacrePropertiesEditValueChanged
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 3
        Width = 106
      end
      object cxGrid2: TcxGrid
        Left = 16
        Top = 92
        Width = 780
        Height = 325
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 10
        object cxGridDBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.Images = dm.cxImageList1
          Navigator.Buttons.PriorPage.Visible = False
          Navigator.Buttons.NextPage.Visible = False
          Navigator.Buttons.Insert.Hint = 'Inserir Objeto'
          Navigator.Buttons.Insert.ImageIndex = 1
          Navigator.Buttons.Insert.Visible = False
          Navigator.Buttons.Delete.Hint = 'Excluir Objeto'
          Navigator.Buttons.Delete.ImageIndex = 8
          Navigator.Buttons.Delete.Visible = False
          Navigator.Buttons.Edit.Visible = False
          Navigator.Buttons.Post.Visible = False
          Navigator.Buttons.Cancel.Hint = 'Cancelar Opera'#231#227'o'
          Navigator.Buttons.Cancel.ImageIndex = 6
          Navigator.Buttons.Cancel.Visible = False
          Navigator.Buttons.Refresh.Visible = False
          Navigator.Buttons.SaveBookmark.Visible = False
          Navigator.Buttons.GotoBookmark.Visible = False
          Navigator.Buttons.Filter.Visible = False
          Navigator.InfoPanel.DisplayMask = '[RecordCount] Objetos'
          Navigator.InfoPanel.Visible = True
          Navigator.Visible = True
          DataController.DataSource = ds2
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NewItemRow.InfoText = 'Digite ou Leie o Nosso N'#250'mero'
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.FocusCellOnCycle = True
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnHidingOnGrouping = False
          OptionsCustomize.ColumnMoving = False
          OptionsCustomize.ColumnSorting = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Inserting = False
          OptionsView.NoDataToDisplayInfoText = 'Nenhuma Informa'#231#227'o Dispon'#237'vel'
          OptionsView.GroupByBox = False
          object cxGridDBColumn1: TcxGridDBColumn
            Caption = 'Nosso N'#250'mero'
            DataBinding.FieldName = 'NUM_NOSSONUMERO'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.IgnoreMaskBlank = True
            Properties.MaskKind = emkRegExpr
            Properties.EditMask = '\d\d\d\d\d\d\d\d\d\d\d'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Width = 108
          end
          object cxGrid1DBTableView1QTD_PESO_OBJETO: TcxGridDBColumn
            Caption = 'Peso'
            DataBinding.FieldName = 'QTD_PESO_OBJETO'
            PropertiesClassName = 'TcxCalcEditProperties'
            Properties.DisplayFormat = '0.000;- 0.000'
            Properties.ReadOnly = True
            GroupSummaryAlignment = taCenter
            HeaderAlignmentHorz = taCenter
            Width = 82
          end
          object cxGridDBColumn2: TcxGridDBColumn
            Caption = 'Vol. N'#186'.'
            DataBinding.FieldName = 'QTD_VOLUMES'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.IgnoreMaskBlank = True
            Properties.MaskKind = emkRegExpr
            Properties.EditMask = '\d\d\d\d\d'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
          end
          object cxGridDBColumn3: TcxGridDBColumn
            Caption = 'Status Objeto'
            DataBinding.FieldName = 'COD_STATUS_OBJETO'
            PropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.Images = dm.cxImageList1
            Properties.Items = <
              item
                Description = 'EM EXPECTATIVA'
                ImageIndex = 25
                Value = 0
              end
              item
                Description = 'EM CONTAINER'
                ImageIndex = 23
                Value = 1
              end
              item
                Description = 'DESCOBERTO'
                ImageIndex = 24
                Value = 2
              end
              item
                Description = 'EXTRAVIADO'
                ImageIndex = 32
                Value = 3
              end
              item
                Description = 'CONFERIDO'
                ImageIndex = 51
                Value = 4
              end>
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Width = 199
          end
          object cxGridDBColumn4: TcxGridDBColumn
            Caption = 'Status Expedi'#231#227'o'
            DataBinding.FieldName = 'COD_STATUS_CONTAINER'
            PropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.Images = dm.cxImageList1
            Properties.Items = <
              item
                Description = 'INATIVO'
                ImageIndex = 52
                Value = 0
              end
              item
                Description = 'EM EXPECTATIVA'
                ImageIndex = 25
                Value = 1
              end
              item
                Description = 'DESPACHADO'
                ImageIndex = 23
                Value = 2
              end
              item
                Description = 'RETIRADO'
                ImageIndex = 53
                Value = 3
              end
              item
                Description = 'RECEBIDO'
                ImageIndex = 54
                Value = 4
              end
              item
                Description = 'CONFERIDO'
                ImageIndex = 51
                Value = 5
              end>
            Properties.ReadOnly = True
            GroupSummaryAlignment = taCenter
            HeaderAlignmentHorz = taCenter
            Width = 186
          end
          object cxGridDBTableView1DAT_EXPEDICAO: TcxGridDBColumn
            Caption = 'Expedi'#231#227'o'
            DataBinding.FieldName = 'DAT_EXPEDICAO'
            HeaderAlignmentHorz = taCenter
            Width = 105
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGridDBTableView1
        end
      end
      object cxButton6: TcxButton
        Left = 888
        Top = 396
        Width = 136
        Height = 20
        Cursor = crHandPoint
        Action = actDevolucaoEncerrarConferencia
        TabOrder = 11
      end
      object cxButton7: TcxButton
        Left = 888
        Top = 347
        Width = 136
        Height = 20
        Cursor = crHandPoint
        Action = actDevolucaoExtraviar
        TabOrder = 12
      end
      object cxButton8: TcxButton
        Left = 888
        Top = 321
        Width = 136
        Height = 20
        Cursor = crHandPoint
        Action = actDevolucaoAlterarExpedicao
        TabOrder = 13
      end
      object cxLabel9: TcxLabel
        Left = 16
        Top = 8
        Caption = 'Data da Expedi'#231#227'o'
        Transparent = True
      end
      object cxLabel10: TcxLabel
        Left = 127
        Top = 8
        Caption = 'Base / Agente'
        Transparent = True
      end
      object cxButton9: TcxButton
        Left = 888
        Top = 25
        Width = 136
        Height = 20
        Cursor = crHandPoint
        Action = actDevolucaoIniciarConferencia
        TabOrder = 16
      end
      object cxCodAgente: TcxTextEdit
        Left = 127
        Top = 24
        Hint = 'C'#243'digo da Base'
        TabStop = False
        Properties.Alignment.Horz = taRightJustify
        Properties.ReadOnly = True
        TabOrder = 1
        Width = 82
      end
      object cxDataExpedicao: TcxTextEdit
        Left = 16
        Top = 24
        Hint = 'Data da Expedicao'
        TabStop = False
        Properties.Alignment.Horz = taRightJustify
        Properties.ReadOnly = True
        TabOrder = 0
        Width = 105
      end
      object cxButton10: TcxButton
        Left = 888
        Top = 295
        Width = 136
        Height = 20
        Cursor = crHandPoint
        Action = actDevolucaoDivergencia
        TabOrder = 17
      end
    end
  end
  object cxButton5: TcxButton
    Left = 912
    Top = 511
    Width = 122
    Height = 20
    Cursor = crHandPoint
    Action = actDevolucaoSair
    Anchors = [akRight, akBottom]
    TabOrder = 1
  end
  object cxLabel27: TcxLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alTop
    AutoSize = False
    Caption = 'Devolu'#231#245'es (Log'#237'stica Reversa)'
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
    Width = 1031
    AnchorY = 22
  end
  object tbExpectativas: TdxMemData
    Indexes = <
      item
        FieldName = 'NUM_NOSSONUMERO'
        SortOptions = []
      end
      item
        FieldName = 'DES_CHAVE'
        SortOptions = []
      end>
    SortOptions = []
    AfterInsert = tbExpectativasAfterInsert
    Left = 920
    Top = 8
    object tbExpectativasNUM_NOSSONUMERO: TStringField
      FieldName = 'NUM_NOSSONUMERO'
      Size = 11
    end
    object tbExpectativasQTD_VOLUMES: TIntegerField
      FieldName = 'QTD_VOLUMES'
      Required = True
    end
    object tbExpectativasCOD_STATUS_OBJETO: TIntegerField
      FieldName = 'COD_STATUS_OBJETO'
    end
    object tbExpectativasCOD_STATUS_CONTAINER: TIntegerField
      FieldName = 'COD_STATUS_CONTAINER'
    end
    object tbExpectativasQTD_PESO_OBJETO: TFloatField
      FieldName = 'QTD_PESO_OBJETO'
    end
    object tbExpectativasDAT_EXPEDICAO: TDateField
      FieldName = 'DAT_EXPEDICAO'
    end
    object tbExpectativasDES_DIVERGENCIA: TStringField
      FieldName = 'DES_DIVERGENCIA'
      Size = 256
    end
    object tbExpectativasDES_DEVOLUCAO: TStringField
      FieldName = 'DES_DEVOLUCAO'
      Size = 30
    end
    object tbExpectativasDES_CHAVE: TStringField
      FieldName = 'DES_CHAVE'
    end
    object tbExpectativasCOD_BASE: TIntegerField
      FieldName = 'COD_BASE'
    end
    object tbExpectativasDOM_MARCA: TStringField
      FieldName = 'DOM_MARCA'
      Size = 1
    end
  end
  object ds1: TDataSource
    DataSet = tbExpectativas
    OnStateChange = ds1StateChange
    Left = 920
    Top = 64
  end
  object aclDevolucao: TActionList
    Images = dm.cxImageList1
    Left = 896
    Top = 184
    object actDevolucaoNovaExpectativa: TAction
      Tag = 3
      Category = 'Devolu'#231#227'o'
      Caption = '&Novo'
      Hint = 'Nova Expectativa'
      ImageIndex = 1
      OnExecute = actDevolucaoNovaExpectativaExecute
    end
    object actDevolucaoExcluirExpectativa: TAction
      Tag = 3
      Category = 'Devolu'#231#227'o'
      Caption = 'E&xcluir'
      Hint = 'Excluir Expectativa'
      ImageIndex = 8
      OnExecute = actDevolucaoExcluirExpectativaExecute
    end
    object actDevolucaoFecharExpectativa: TAction
      Tag = 3
      Category = 'Devolu'#231#227'o'
      Caption = '&Fechar'
      Hint = 'Fechar Expectativa'
      ImageIndex = 20
      OnExecute = actDevolucaoFecharExpectativaExecute
    end
    object actDevolucaoListaApoio: TAction
      Tag = 99
      Category = 'Devolu'#231#227'o'
      Caption = '. . .'
      Hint = 'Lista de Apoio'
    end
    object actDevolucaoSair: TAction
      Tag = 99
      Category = 'Devolu'#231#227'o'
      Caption = 'Sair'
      Hint = 'Sair da Tela'
      ImageIndex = 10
      OnExecute = actDevolucaoSairExecute
    end
    object actDevolucaoSalvarExpectativas: TAction
      Tag = 3
      Category = 'Devolu'#231#227'o'
      Caption = 'Sal&var'
      Hint = 'Salvar Expectativas'
      ImageIndex = 9
      OnExecute = actDevolucaoSalvarExpectativasExecute
    end
    object actDevolucaoEncerrarConferencia: TAction
      Tag = 3
      Category = 'Devolu'#231#227'o'
      Caption = 'Encerrar Confer'#234'ncia'
      Enabled = False
      Hint = 'Encerrar o Processo de Confer'#234'ncia deste Container'
      ImageIndex = 51
      OnExecute = actDevolucaoEncerrarConferenciaExecute
    end
    object actDevolucaoAlterarExpedicao: TAction
      Tag = 3
      Category = 'Devolu'#231#227'o'
      Caption = 'Alterar Expedi'#231#227'o'
      Hint = 'Alterar a Data da Expedi'#231#227'o'
      ImageIndex = 63
      OnExecute = actDevolucaoAlterarExpedicaoExecute
    end
    object actDevolucaoExtraviar: TAction
      Tag = 3
      Category = 'Devolu'#231#227'o'
      Caption = 'Extraviar Objeto'
      Hint = 'Extraviar Objeto'
      ImageIndex = 32
      OnExecute = actDevolucaoExtraviarExecute
    end
    object actDevolucaoIniciarConferencia: TAction
      Tag = 3
      Category = 'Devolu'#231#227'o'
      Caption = '&Iniciar'
      Hint = 'Iniciar Confer'#234'ncia'
      ImageIndex = 27
      OnExecute = actDevolucaoIniciarConferenciaExecute
    end
    object actDevolucaoDivergencia: TAction
      Tag = 3
      Category = 'Devolu'#231#227'o'
      Caption = '&Diverg'#234'ncia'
      Hint = 'Informar Diverg'#234'ncia'
      ImageIndex = 62
      OnExecute = actDevolucaoDivergenciaExecute
    end
    object actDevolucaoImportar: TAction
      Tag = 3
      Category = 'Devolu'#231#227'o'
      Caption = 'Importar'
      Hint = 'Importar Arquivos de Devolu'#231#245'es'
      ImageIndex = 33
      OnExecute = actDevolucaoImportarExecute
    end
    object actDevolucaoSalvarImportacao: TAction
      Tag = 3
      Category = 'Devolu'#231#227'o'
      Caption = 'Salva Importa'#231#227'o'
      Enabled = False
      Hint = 'Salvar Importa'#231#227'o'
      ImageIndex = 9
      OnExecute = actDevolucaoSalvarImportacaoExecute
    end
    object actDevolucaoMarcar: TAction
      Tag = 99
      Category = 'Devolu'#231#227'o'
      Caption = 'Marcar Todos'
      Hint = 'Marcar Todos as Devolu'#231#245'es'
      OnExecute = actDevolucaoMarcarExecute
    end
    object actDevolucaoDesmarcar: TAction
      Tag = 99
      Category = 'Devolu'#231#227'o'
      Caption = 'Desmarcar Todos'
      Hint = 'Desmarcar Todas as Devolu'#231#245'es'
      OnExecute = actDevolucaoDesmarcarExecute
    end
    object actDEvolucaoAlterarBase: TAction
      Tag = 3
      Category = 'Devolu'#231#227'o'
      Caption = 'Alterar Base'
      Hint = 'Alterar a Base'
      ImageIndex = 55
      OnExecute = actDEvolucaoAlterarBaseExecute
    end
    object actDevolucaoIniciarExpectativa: TAction
      Tag = 3
      Category = 'Devolu'#231#227'o'
      Caption = 'Iniciar'
      Hint = 'Iniciar Expectativa de Devolu'#231#245'es'
      ImageIndex = 27
      OnExecute = actDevolucaoIniciarExpectativaExecute
    end
  end
  object ds2: TDataSource
    AutoEdit = False
    DataSet = tbExpectativas
    Left = 952
    Top = 64
  end
  object OpenDialog1: TOpenDialog
    Filter = 
      'Arquivos Devolu'#231#227'o CSV|*devolucao*.csv|Arquivos Devolu'#231#227'o TXT|*d' +
      'evolucao*.txt'
    Left = 968
    Top = 200
  end
  object ds3: TDataSource
    DataSet = dm.tbDevolucao
    Left = 984
    Top = 64
  end
  object tbBases: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 856
    Top = 8
    object tbBasesCOD_AGENTE: TIntegerField
      FieldName = 'COD_AGENTE'
    end
    object tbBasesDES_RAZAO_SOCIAL: TWideStringField
      FieldName = 'DES_RAZAO_SOCIAL'
      Size = 70
    end
    object tbBasesNOM_FANTASIA: TWideStringField
      FieldName = 'NOM_FANTASIA'
      Size = 80
    end
    object tbBasesDES_TIPO_DOC: TWideStringField
      FieldName = 'DES_TIPO_DOC'
      Size = 4
    end
    object tbBasesNUM_CNPJ: TWideStringField
      FieldName = 'NUM_CNPJ'
    end
    object tbBasesNUM_IE: TWideStringField
      FieldName = 'NUM_IE'
    end
    object tbBasesNUM_IEST: TWideStringField
      FieldName = 'NUM_IEST'
    end
    object tbBasesNUM_IM: TWideStringField
      FieldName = 'NUM_IM'
    end
    object tbBasesCOD_CNAE: TWideStringField
      FieldName = 'COD_CNAE'
      Size = 10
    end
    object tbBasesCOD_CRT: TIntegerField
      FieldName = 'COD_CRT'
    end
    object tbBasesNUM_CNH: TWideStringField
      FieldName = 'NUM_CNH'
      Size = 15
    end
    object tbBasesDES_CATEGORIA_CNH: TWideStringField
      FieldName = 'DES_CATEGORIA_CNH'
      Size = 2
    end
    object tbBasesDAT_VALIDADE_CNH: TDateField
      FieldName = 'DAT_VALIDADE_CNH'
    end
    object tbBasesDES_PAGINA: TWideStringField
      FieldName = 'DES_PAGINA'
      Size = 100
    end
    object tbBasesCOD_STATUS: TIntegerField
      FieldName = 'COD_STATUS'
    end
    object tbBasesDES_OBSERVACAO: TWideMemoField
      FieldName = 'DES_OBSERVACAO'
      BlobType = ftWideMemo
    end
    object tbBasesDAT_CADASTRO: TDateField
      FieldName = 'DAT_CADASTRO'
    end
    object tbBasesDAT_ALTERACAO: TDateTimeField
      FieldName = 'DAT_ALTERACAO'
    end
    object tbBasesVAL_VERBA: TFloatField
      FieldName = 'VAL_VERBA'
    end
    object tbBasesDES_TIPO_CONTA: TWideStringField
      FieldName = 'DES_TIPO_CONTA'
    end
    object tbBasesCOD_BANCO: TWideStringField
      FieldName = 'COD_BANCO'
      Size = 4
    end
    object tbBasesCOD_AGENCIA: TWideStringField
      FieldName = 'COD_AGENCIA'
      Size = 10
    end
    object tbBasesNUM_CONTA: TWideStringField
      FieldName = 'NUM_CONTA'
    end
    object tbBasesNOM_FAVORECIDO: TWideStringField
      FieldName = 'NOM_FAVORECIDO'
      Size = 70
    end
    object tbBasesNUM_CPF_CNPJ_FAVORECIDO: TWideStringField
      FieldName = 'NUM_CPF_CNPJ_FAVORECIDO'
    end
    object tbBasesDES_FORMA_PAGAMENTO: TWideStringField
      FieldName = 'DES_FORMA_PAGAMENTO'
      Size = 30
    end
    object tbBasesCOD_CENTRO_CUSTO: TIntegerField
      FieldName = 'COD_CENTRO_CUSTO'
    end
    object tbBasesCOD_GRUPO: TIntegerField
      FieldName = 'COD_GRUPO'
    end
  end
  object dsBases: TDataSource
    AutoEdit = False
    DataSet = tbBases
    Left = 856
    Top = 64
  end
end