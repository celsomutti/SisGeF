object frmOcorrenciasJornal: TfrmOcorrenciasJornal
  Left = 0
  Top = 0
  Caption = 'Acompanhamento de Ocorr'#234'ncias do Jornal'
  ClientHeight = 611
  ClientWidth = 1065
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    1065
    611)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 569
    Width = 1065
    Height = 42
    Align = alBottom
    TabOrder = 13
    object cxButton14: TcxButton
      Left = 758
      Top = 9
      Width = 75
      Height = 25
      Action = actCustear
      TabOrder = 0
    end
    object cxButton15: TcxButton
      Left = 839
      Top = 9
      Width = 130
      Height = 25
      Action = actCancelarOcorrencia
      TabOrder = 1
    end
  end
  object cxGrid1: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 94
    Width = 1059
    Height = 246
    Align = alClient
    Images = dm.cxImageList1
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      OnDblClick = cxGrid1DBTableView1DblClick
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = ds
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = cxGrid1DBTableView1VAL_OCORRENCIA
        end>
      DataController.Summary.SummaryGroups = <
        item
          Links = <
            item
              Column = cxGrid1DBTableView1NOM_ENTREGADOR
            end>
          SummaryItems = <
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Position = spFooter
              Column = cxGrid1DBTableView1VAL_OCORRENCIA
            end>
        end
        item
          Links = <
            item
              Column = cxGrid1DBTableView1DES_ROTEIRO
            end>
          SummaryItems = <
            item
              Format = ',0;-,0'
              Kind = skCount
              Column = cxGrid1DBTableView1COD_OCORRENCIA
            end>
        end>
      EditForm.DefaultColumnCount = 1
      Images = dm.cxImageList1
      OptionsBehavior.CopyCaptionsToClipboard = False
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.FocusFirstCellOnNewRecord = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.FocusCellOnCycle = True
      OptionsSelection.InvertSelect = False
      OptionsSelection.MultiSelect = True
      OptionsSelection.CellMultiSelect = True
      OptionsView.NoDataToDisplayInfoText = '<Nenhuma informa'#231#227'o dispon'#237'vel>'
      OptionsView.CellAutoHeight = True
      OptionsView.Footer = True
      OptionsView.GroupFooters = gfVisibleWhenExpanded
      OptionsView.HeaderAutoHeight = True
      object cxGrid1DBTableView1DOM_FINALIZAR: TcxGridDBColumn
        DataBinding.FieldName = 'DOM_FINALIZAR'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.NullStyle = nssUnchecked
        HeaderGlyphAlignmentHorz = taCenter
        HeaderImageIndex = 51
        IsCaptionAssigned = True
      end
      object cxGrid1DBTableView1DOM_IMPRESSAO: TcxGridDBColumn
        DataBinding.FieldName = 'DOM_IMPRESSAO'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Images = dm.cxImageList1
        Properties.Items = <
          item
            Description = 'Imprimir'
            ImageIndex = 15
            Value = 'P'
          end
          item
            Description = 'J'#225' Impresso'
            ImageIndex = 0
            Value = 'S'
          end
          item
            Description = 'N'#227'o Impresso'
            ImageIndex = 25
            Value = 'N'
          end>
        Properties.ShowDescriptions = False
        HeaderGlyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000000C69460FDCA9865FFCA9765FFCA9765FFCA9765FFCA9764FFC997
          64FFC99764FFCA9865FFC69360FD0000000000000000000000003B3B3B994D4D
          4DD2585858FFC79561FFF9F7F6FFF9F1ECFFF9F1EBFFF8F0E9FFF7EDE6FFF4EA
          E1FFF2E8DEFFFAF8F6FFC79461FF242424FF1D1D1DD11111117A696969FDA7A7
          A7FFB5B5B5FF818181FFAFACAAFFC5C0BDFFC5C0BDFFC5C0BDFFC5C0BDFFC5C0
          BDFFC5C0BDFFADAAA8FF2C2C2CFFB5B5B5FF9B9B9BFF232323FF707070FFB5B5
          B5FFB5B5B5FF959595FF818181FF818181FF797979FF6E6E6EFF616161FF5252
          52FF434343FF424242FF6E6E6EFFB5B5B5FFB5B5B5FF252525FF757575FFBBBB
          BBFFBBBBBBFF8D8D8DFFD4D4D4FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9
          B9FFB9B9B9FFD3D3D3FF838383FFBBBBBBFFBBBBBBFF2A2A2AFF7A7A7AFFD7D7
          D7FFD7D7D7FF979797FFD8D8D8FFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBF
          BFFFBFBFBFFFD7D7D7FF8E8E8EFFD7D7D7FFD7D7D7FF3F3F3FFF7E7E7EFFF9F9
          F9FFF9F9F9FFABABABFFDFDFDFFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFDFDFDFFFA3A3A3FFF9F9F9FFF9F9F9FF616161FF7E7E7EF9FCFC
          FCFFFCFCFCFFCBCBCBFFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2
          F2FFF2F2F2FFF2F2F2FFC6C6C6FFFCFCFCFFFCFCFCFF707070FE6A6A6AD2D2D2
          D2FFE8E8E8FF7D7D7DFF7D7D7DFF7D7D7DFF7D7D7DFF7D7D7DFF7D7D7DFF7D7D
          7DFF7D7D7DFF7D7D7DFF7D7D7DFFE8E8E8FFC4C4C4FF4A4A4ADC232323459A9A
          9AFFCCCCCCFFC78B4EFFF9F4EDFFFEE8D8FFFEE8D7FFFDE5D3FFFCE4D1FFFAE0
          C7FFF9DDC3FFFAF4EDFFC7854AFFC3C3C3FF747474FF13131345000000003232
          32637B7B7BF3C5894CFFF9F4EFFFFEE7D7FFFDE7D5FFFCE6D2FFFBE1CCFFF8DC
          C2FFF6DABDFFFAF4EFFFC48348FF555555F32020206300000000000000000000
          000005050509C08649F9F9F4F0FFFCE6D3FFFDE7D3FFFBE3CDFFFAE0C8FFF5D6
          BBFFF3D4B5FFF8F4F0FFBE7F44F9030303090000000000000000000000000000
          000000000000C08549F7F9F5F1FFFCE3CFFFFCE4CFFFFAE1CAFFF9DDC4FFF4E9
          DFFFF7F2ECFFF5EFE9FFBF7C44FB000000000000000000000000000000000000
          000000000000BF8449F6F9F5F1FFFCE3CDFFFBE3CDFFF9E0C8FFF8DCC2FFFDFB
          F8FFFCE6CDFFE2B684FF7C4F2BA6000000000000000000000000000000000000
          000000000000C08348FAF7F2ECFFF8F4EEFFF8F3EDFFF8F3EDFFF8F2ECFFF2E6
          D7FFE2B27DFFD28C60F605030207000000000000000000000000000000000000
          000000000000492F1A60936638BBC78B4FFEC88C4FFFC2894DF7C3884DF7C488
          4CFE724422940000000000000000000000000000000000000000}
        HeaderGlyphAlignmentHorz = taCenter
        Width = 47
        IsCaptionAssigned = True
      end
      object cxGrid1DBTableView1RecId: TcxGridDBColumn
        DataBinding.FieldName = 'RecId'
        Visible = False
        HeaderAlignmentHorz = taCenter
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1NUM_OCORRENCIA: TcxGridDBColumn
        Caption = 'N'#250'mero'
        DataBinding.FieldName = 'NUM_OCORRENCIA'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1COD_ASSINATURA: TcxGridDBColumn
        Caption = 'C'#243'digo Assinante'
        DataBinding.FieldName = 'COD_ASSINATURA'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = False
        Properties.OnValidate = cxGrid1DBTableView1COD_ASSINATURAPropertiesValidate
        HeaderAlignmentHorz = taCenter
        Width = 120
      end
      object cxGrid1DBTableView1NOM_ASSINANTE: TcxGridDBColumn
        Caption = 'Nome'
        DataBinding.FieldName = 'NOM_ASSINANTE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = False
        HeaderAlignmentHorz = taCenter
        Width = 215
      end
      object cxGrid1DBTableView1DES_ROTEIRO: TcxGridDBColumn
        Caption = 'Roteiro'
        DataBinding.FieldName = 'DES_ROTEIRO'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = False
        HeaderAlignmentHorz = taCenter
        Width = 141
      end
      object cxGrid1DBTableView1COD_PRODUTO: TcxGridDBColumn
        Caption = 'Produto'
        DataBinding.FieldName = 'COD_PRODUTO'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'COD_PRODUTO'
        Properties.ListColumns = <
          item
            FieldName = 'DES_PRODUTO'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dsProduto
        Properties.ReadOnly = False
        HeaderAlignmentHorz = taCenter
        Width = 106
      end
      object cxGrid1DBTableView1COD_OCORRENCIA: TcxGridDBColumn
        Caption = 'C'#243'digo Oc.'
        DataBinding.FieldName = 'COD_OCORRENCIA'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Alignment.Horz = taCenter
        Properties.ReadOnly = False
        HeaderAlignmentHorz = taCenter
        Width = 77
      end
      object cxGrid1DBTableView1DES_OCORRENCIA: TcxGridDBColumn
        Caption = 'Descri'#231#227'o da Ocorr'#234'ncia'
        DataBinding.FieldName = 'COD_OCORRENCIA'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'COD_TIPO_OCORRENCIA'
        Properties.ListColumns = <
          item
            FieldName = 'DES_TIPO_OCORRENCIA'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dsTipoOcorrencia
        Properties.ReadOnly = False
        HeaderAlignmentHorz = taCenter
        Width = 221
      end
      object cxGrid1DBTableView1DAT_OCORRENCIA: TcxGridDBColumn
        Caption = 'Data'
        DataBinding.FieldName = 'DAT_OCORRENCIA'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = False
        HeaderAlignmentHorz = taCenter
        Width = 122
      end
      object cxGrid1DBTableView1DOM_REINCIDENTE: TcxGridDBColumn
        Caption = 'Reinc.'
        DataBinding.FieldName = 'DOM_REINCIDENTE'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Items = <
          item
            Description = 'Sim'
            ImageIndex = 0
            Value = 'S'
          end
          item
            Description = 'N'#227'o'
            Value = 'N'
          end>
        Properties.ReadOnly = False
        HeaderAlignmentHorz = taCenter
        Width = 48
      end
      object cxGrid1DBTableView1DES_DESCRICAO: TcxGridDBColumn
        Caption = 'Descri'#231#227'o'
        DataBinding.FieldName = 'DES_DESCRICAO'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 211
      end
      object cxGrid1DBTableView1DES_ENDERECO: TcxGridDBColumn
        Caption = 'Endere'#231'o'
        DataBinding.FieldName = 'DES_ENDERECO'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = False
        HeaderAlignmentHorz = taCenter
        Width = 231
      end
      object cxGrid1DBTableView1DES_RETORNO: TcxGridDBColumn
        Caption = 'Retorno'
        DataBinding.FieldName = 'DES_RETORNO'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 149
      end
      object cxGrid1DBTableView1DES_ANEXO: TcxGridDBColumn
        Caption = 'Controle'
        DataBinding.FieldName = 'DES_ANEXO'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 135
      end
      object cxGrid1DBTableView1COD_RESULTADO: TcxGridDBColumn
        Caption = 'Resultado'
        DataBinding.FieldName = 'COD_RESULTADO'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 103
      end
      object cxGrid1DBTableView1COD_ORIGEM: TcxGridDBColumn
        Caption = 'Origem'
        DataBinding.FieldName = 'COD_ORIGEM'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
      end
      object cxGrid1DBTableView1DES_OBS: TcxGridDBColumn
        Caption = 'Observa'#231#245'es'
        DataBinding.FieldName = 'DES_OBS'
        PropertiesClassName = 'TcxBlobEditProperties'
        Properties.BlobEditKind = bekMemo
        Properties.BlobPaintStyle = bpsText
        Properties.MemoAutoReplace = True
        Properties.MemoScrollBars = ssBoth
        Properties.MemoWordWrap = False
        HeaderAlignmentHorz = taCenter
        Width = 110
      end
      object cxGrid1DBTableView1DES_LOG: TcxGridDBColumn
        DataBinding.FieldName = 'DES_LOG'
        Visible = False
        HeaderAlignmentHorz = taCenter
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1COD_STATUS: TcxGridDBColumn
        Caption = 'Status'
        DataBinding.FieldName = 'COD_STATUS'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Images = dm.cxImageList1
        Properties.Items = <
          item
            Description = 'Aberta'
            ImageIndex = 50
            Value = 0
          end
          item
            Description = 'Tratada'
            ImageIndex = 74
            Value = 1
          end
          item
            Description = 'Pendente'
            ImageIndex = 25
            Value = 2
          end
          item
            Description = 'Finalizada'
            ImageIndex = 51
            Value = 3
          end
          item
            Description = 'Contabilizada'
            ImageIndex = 81
            Value = 4
          end
          item
            Description = 'Cancelada'
            ImageIndex = 6
            Value = 5
          end
          item
            Description = 'Desmembrada'
            ImageIndex = 113
            Value = 6
          end>
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 133
      end
      object cxGrid1DBTableView1QTD_OCORRENCIAS: TcxGridDBColumn
        Caption = 'Qtde.'
        DataBinding.FieldName = 'QTD_OCORRENCIAS'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.ReadOnly = False
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taRightJustify
      end
      object cxGrid1DBTableView1VAL_OCORRENCIA: TcxGridDBColumn
        Caption = 'Valor'
        DataBinding.FieldName = 'VAL_OCORRENCIA'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ' ,0.00;- ,0.00'
        Properties.ReadOnly = False
        HeaderAlignmentHorz = taCenter
        Width = 99
      end
      object cxGrid1DBTableView1COD_ENTREGADOR: TcxGridDBColumn
        Caption = 'Entregador'
        DataBinding.FieldName = 'COD_ENTREGADOR'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = False
        Visible = False
        HeaderAlignmentHorz = taCenter
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
        Width = 77
      end
      object cxGrid1DBTableView1NOM_ENTREGADOR: TcxGridDBColumn
        Caption = 'Nome do Entregador'
        DataBinding.FieldName = 'COD_ENTREGADOR'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'COD_CADASTRO'
        Properties.ListColumns = <
          item
            FieldName = 'DES_RAZAO_SOCIAL'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dsEntregador
        Visible = False
        HeaderAlignmentHorz = taCenter
        Width = 211
      end
      object cxGrid1DBTableView1DES_APURACAO: TcxGridDBColumn
        DataBinding.FieldName = 'DES_APURACAO'
        Visible = False
        VisibleForCustomization = False
        VisibleForEditForm = bTrue
      end
      object cxGrid1DBTableView1DOM_PROCESSADO: TcxGridDBColumn
        DataBinding.FieldName = 'DOM_PROCESSADO'
        Visible = False
        VisibleForCustomization = False
        VisibleForEditForm = bTrue
      end
      object cxGrid1DBTableView1DES_CHAVE: TcxGridDBColumn
        DataBinding.FieldName = 'DES_CHAVE'
        Visible = False
        VisibleForCustomization = False
        VisibleForEditForm = bTrue
      end
      object cxGrid1DBTableView1DAT_DESCONTO: TcxGridDBColumn
        DataBinding.FieldName = 'DAT_DESCONTO'
        Visible = False
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1DES_ROTEIRO_NOVO: TcxGridDBColumn
        DataBinding.FieldName = 'DES_ROTEIRO_NOVO'
        Visible = False
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object cxLabel27: TcxLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alTop
    AutoSize = False
    Caption = 'Ocorr'#234'ncias do Jornal'
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
    Width = 1059
    AnchorY = 22
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 47
    Width = 1059
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 11
    DesignSize = (
      1059
      41)
    object cxLabel1: TcxLabel
      Left = 0
      Top = 8
      Caption = 'Per'#237'odo de'
      Transparent = True
    end
    object cxDataInicial: TcxDateEdit
      Left = 62
      Top = 7
      Hint = 'Data inicial do per'#237'odo'
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 1
      Width = 91
    end
    object cxLabel2: TcxLabel
      Left = 159
      Top = 8
      Caption = 'a'
    end
    object cxDataFinal: TcxDateEdit
      Left = 175
      Top = 7
      Hint = 'Data final do per'#237'odo'
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 3
      Width = 91
    end
    object cxButton3: TcxButton
      Left = 977
      Top = 0
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Action = actPesquisar
      Anchors = [akTop, akRight]
      TabOrder = 5
    end
    object cxLabel3: TcxLabel
      Left = 272
      Top = 8
      Caption = 'Status de Ocorr'#234'ncias'
      Transparent = True
    end
    object cxStatusOcorrencia: TcxComboBox
      Left = 388
      Top = 7
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'ABERTAS'
        'TRATADAS'
        'PENDENTES'
        'FINALIZADAS'
        'CONTABILIZADAS'
        'CANCELADAS'
        'DESMEMBRADA'
        'TODAS')
      Properties.OnChange = cxStatusOcorrenciaPropertiesChange
      TabOrder = 4
      Text = 'ABERTAS'
      Width = 121
    end
  end
  object cxButton2: TcxButton
    Left = 165
    Top = 578
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Action = actProcessar
    Anchors = [akLeft, akBottom]
    TabOrder = 3
  end
  object cxButton4: TcxButton
    Left = 246
    Top = 578
    Width = 75
    Height = 25
    Action = actGravar
    Anchors = [akLeft, akBottom]
    TabOrder = 4
  end
  object cxButton6: TcxButton
    Left = 408
    Top = 578
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Action = actExportar
    Anchors = [akLeft, akBottom]
    TabOrder = 6
  end
  object cxButton5: TcxButton
    Left = 327
    Top = 578
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Action = actFinalizar
    Anchors = [akLeft, akBottom]
    TabOrder = 5
  end
  object cxButton7: TcxButton
    Left = 987
    Top = 578
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Action = actSair
    Anchors = [akRight, akBottom]
    TabOrder = 10
  end
  object cxButton8: TcxButton
    Left = 489
    Top = 578
    Width = 81
    Height = 25
    Cursor = crHandPoint
    Action = actEntregador
    Anchors = [akLeft, akBottom]
    TabOrder = 7
  end
  object cxButton9: TcxButton
    Left = 3
    Top = 578
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Action = actIncluir
    Anchors = [akLeft, akBottom]
    TabOrder = 1
  end
  object cxButton10: TcxButton
    Left = 84
    Top = 578
    Width = 75
    Height = 25
    Action = actExcluir
    Anchors = [akLeft, akBottom]
    TabOrder = 2
  end
  object cxButton11: TcxButton
    Left = 576
    Top = 578
    Width = 75
    Height = 25
    Action = actCancelar
    Anchors = [akLeft, akBottom]
    TabOrder = 8
  end
  object cxButton12: TcxButton
    Left = 657
    Top = 578
    Width = 95
    Height = 25
    Action = actDeclaracao
    Anchors = [akLeft, akBottom]
    TabOrder = 9
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 343
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Erros Encontrados'
    TabOrder = 14
    Visible = False
    DesignSize = (
      1065
      219)
    Height = 226
    Width = 1065
    object cxGrid2: TcxGrid
      AlignWithMargins = True
      Left = 6
      Top = 18
      Width = 1053
      Height = 132
      Align = alTop
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object cxGrid2DBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsErros
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ' ,0.00;- ,0.00'
            Kind = skSum
            Column = cxGrid2DBTableView1VAL_OCORRENCIA
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.FocusCellOnCycle = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.InvertSelect = False
        OptionsSelection.MultiSelect = True
        OptionsSelection.CellMultiSelect = True
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        object cxGrid2DBTableView1RecId: TcxGridDBColumn
          DataBinding.FieldName = 'RecId'
          Visible = False
        end
        object cxGrid2DBTableView1COD_ASSINATURA: TcxGridDBColumn
          DataBinding.FieldName = 'COD_ASSINATURA'
          HeaderAlignmentHorz = taCenter
          Width = 101
        end
        object cxGrid2DBTableView1NOM_ASSINANTE: TcxGridDBColumn
          Caption = 'Nome'
          DataBinding.FieldName = 'NOM_ASSINANTE'
          HeaderAlignmentHorz = taCenter
          Width = 323
        end
        object cxGrid2DBTableView1QTD_OCORRENCIAS: TcxGridDBColumn
          DataBinding.FieldName = 'QTD_OCORRENCIAS'
          HeaderAlignmentHorz = taCenter
          Width = 62
        end
        object cxGrid2DBTableView1VAL_UNITARIO: TcxGridDBColumn
          DataBinding.FieldName = 'VAL_UNITARIO'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ' ,0.00;- ,0.00'
          HeaderAlignmentHorz = taCenter
          Width = 68
        end
        object cxGrid2DBTableView1VAL_OCORRENCIA: TcxGridDBColumn
          Caption = 'Total'
          DataBinding.FieldName = 'VAL_OCORRENCIAS'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ' ,0.00;- ,0.00'
          HeaderAlignmentHorz = taCenter
          Width = 81
        end
        object cxGrid2DBTableView1DES_DESCRICAO: TcxGridDBColumn
          Caption = 'Capas/Erro'
          DataBinding.FieldName = 'DES_DESCRICAO'
          HeaderAlignmentHorz = taCenter
          Width = 343
        end
      end
      object cxGrid2Level1: TcxGridLevel
        GridView = cxGrid2DBTableView1
      end
    end
    object cxButton1: TcxButton
      Left = 906
      Top = 153
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Action = actExportarErros
      Anchors = [akRight, akBottom]
      TabOrder = 1
    end
    object cxButton13: TcxButton
      Left = 987
      Top = 153
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Action = actFecharErros
      Anchors = [akRight, akBottom]
      TabOrder = 2
    end
  end
  object tbPlanilha: TdxMemData
    Indexes = <
      item
        FieldName = 'NUM_OCORRENCIA'
        SortOptions = []
      end>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F110000000400000003000F004E554D5F4F434F5252
      454E43494100080000000B000F004441545F4F434F5252454E43494100140000
      0014000F00434F445F415353494E4154555241004600000014000E004E4F4D5F
      415353494E414E5445001400000014000C004445535F524F544549524F000400
      000003000F00434F445F454E5452454741444F52000400000003000C00434F44
      5F50524F4455544F000400000003000F00434F445F4F434F5252454E43494100
      0100000014001000444F4D5F5245494E434944454E5445008000000014000E00
      4445535F44455343524943414F000001000014000D004445535F454E44455245
      434F008000000014000C004445535F5245544F524E4F000400000003000E0043
      4F445F524553554C5441444F000400000003000B00434F445F4F524947454D00
      00010000140008004445535F4F4253000400000003000B00434F445F53544154
      55530000000000190008004445535F4C4F4700}
    SortOptions = []
    BeforePost = tbPlanilhaBeforePost
    Left = 776
    Top = 176
    object tbPlanilhaNUM_OCORRENCIA: TIntegerField
      FieldName = 'NUM_OCORRENCIA'
    end
    object tbPlanilhaDAT_OCORRENCIA: TDateTimeField
      FieldName = 'DAT_OCORRENCIA'
    end
    object tbPlanilhaCOD_ASSINATURA: TWideStringField
      FieldName = 'COD_ASSINATURA'
    end
    object tbPlanilhaNOM_ASSINANTE: TWideStringField
      FieldName = 'NOM_ASSINANTE'
      Size = 70
    end
    object tbPlanilhaDES_ROTEIRO: TWideStringField
      DisplayWidth = 30
      FieldName = 'DES_ROTEIRO'
      Size = 30
    end
    object tbPlanilhaCOD_ENTREGADOR: TIntegerField
      FieldName = 'COD_ENTREGADOR'
    end
    object tbPlanilhaCOD_PRODUTO: TStringField
      FieldName = 'COD_PRODUTO'
      Size = 10
    end
    object tbPlanilhaCOD_OCORRENCIA: TIntegerField
      FieldName = 'COD_OCORRENCIA'
    end
    object tbPlanilhaDOM_REINCIDENTE: TWideStringField
      FieldName = 'DOM_REINCIDENTE'
      Size = 1
    end
    object tbPlanilhaDES_DESCRICAO: TStringField
      FieldName = 'DES_DESCRICAO'
      Size = 4096
    end
    object tbPlanilhaDES_ENDERECO: TWideStringField
      FieldName = 'DES_ENDERECO'
      Size = 256
    end
    object tbPlanilhaDES_RETORNO: TWideStringField
      DisplayWidth = 1024
      FieldName = 'DES_RETORNO'
      Size = 1024
    end
    object tbPlanilhaCOD_RESULTADO: TIntegerField
      FieldName = 'COD_RESULTADO'
    end
    object tbPlanilhaCOD_ORIGEM: TIntegerField
      FieldName = 'COD_ORIGEM'
    end
    object tbPlanilhaDES_OBS: TWideStringField
      DisplayWidth = 4096
      FieldName = 'DES_OBS'
      Size = 4096
    end
    object tbPlanilhaCOD_STATUS: TIntegerField
      FieldName = 'COD_STATUS'
    end
    object tbPlanilhaDES_APURACAO: TMemoField
      FieldName = 'DES_APURACAO'
      BlobType = ftMemo
    end
    object tbPlanilhaDOM_PROCESSADO: TStringField
      FieldName = 'DOM_PROCESSADO'
      Size = 1
    end
    object tbPlanilhaQTD_OCORRENCIAS: TIntegerField
      FieldName = 'QTD_OCORRENCIAS'
    end
    object tbPlanilhaVAL_OCORRENCIA: TFloatField
      FieldName = 'VAL_OCORRENCIA'
    end
    object tbPlanilhaDAT_DESCONTO: TDateField
      FieldName = 'DAT_DESCONTO'
    end
    object tbPlanilhaDES_LOG: TWideMemoField
      FieldName = 'DES_LOG'
      BlobType = ftWideMemo
    end
    object tbPlanilhaDES_CHAVE: TStringField
      FieldName = 'DES_CHAVE'
      Size = 100
    end
    object tbPlanilhaDOM_FINALIZAR: TBooleanField
      FieldName = 'DOM_FINALIZAR'
    end
    object tbPlanilhaDES_ROTEIRO_NOVO: TStringField
      FieldName = 'DES_ROTEIRO_NOVO'
      Size = 50
    end
    object tbPlanilhaDOM_IMPRESSAO: TStringField
      FieldName = 'DOM_IMPRESSAO'
      Size = 1
    end
    object tbPlanilhaDES_ANEXO: TStringField
      FieldName = 'DES_ANEXO'
      Size = 30
    end
    object tbPlanilhaDES_OCORRENCIA: TStringField
      FieldName = 'DES_OCORRENCIA'
      Size = 70
    end
    object tbPlanilhaDES_PRODUTO: TStringField
      FieldName = 'DES_PRODUTO'
      Size = 50
    end
    object tbPlanilhaDOM_GRAVAR: TStringField
      FieldName = 'DOM_GRAVAR'
      Size = 1
    end
  end
  object ds: TDataSource
    DataSet = tbPlanilha
    OnStateChange = dsStateChange
    OnDataChange = dsDataChange
    Left = 816
    Top = 176
  end
  object aclOcorrencias: TActionList
    Images = dm.iml16x16
    Left = 928
    Top = 8
    object actColar: TAction
      Tag = 3
      Category = 'Ocorr'#234'ncias'
      Caption = 'Colar'
      Hint = 'Colar dados da ocorr'#234'ncia na grade'
      ImageIndex = 66
    end
    object actProcessar: TAction
      Tag = 3
      Category = 'Ocorr'#234'ncias'
      Caption = 'Processar'
      Hint = 'Processar Ocorr'#234'ncias para atribuir responsabilidade'
      ImageIndex = 39
      OnExecute = actProcessarExecute
    end
    object actPesquisar: TAction
      Tag = 3
      Category = 'Ocorr'#234'ncias'
      Caption = 'Pesquisar'
      Hint = 'Pesquisar Per'#237'odo'
      ImageIndex = 38
      OnExecute = actPesquisarExecute
    end
    object actImportarPlanilha: TAction
      Category = 'Ocorr'#234'ncias'
      Caption = 'Importar'
      Hint = 'Importar Planilha de Ocorr'#234'ncias'
      ImageIndex = 30
      OnExecute = actImportarPlanilhaExecute
    end
    object actGravar: TAction
      Tag = 3
      Category = 'Ocorr'#234'ncias'
      Caption = 'Gravar'
      Hint = 'Gravar a planilha no banco de dados'
      ImageIndex = 32
      OnExecute = actGravarExecute
    end
    object actCustear: TAction
      Category = 'Ocorr'#234'ncias'
      Caption = 'Custear'
      Hint = 'Custear Ocorr'#234'ncias'
      ImageIndex = 40
      OnExecute = actCustearExecute
    end
    object actExportar: TAction
      Tag = 3
      Category = 'Ocorr'#234'ncias'
      Caption = 'Exportar'
      Hint = 'Exportar Planilha'
      ImageIndex = 29
      OnExecute = actExportarExecute
    end
    object actFinalizar: TAction
      Tag = 3
      Category = 'Ocorr'#234'ncias'
      Caption = 'Finalizar'
      Hint = 'Finalizar Ocorr'#234'ncias'
      ImageIndex = 3
      OnExecute = actFinalizarExecute
    end
    object actSair: TAction
      Tag = 3
      Category = 'Ocorr'#234'ncias'
      Caption = 'Sair'
      Hint = 'Sair da Tela'
      ImageIndex = 6
      OnExecute = actSairExecute
    end
    object actEntregador: TAction
      Tag = 3
      Category = 'Ocorr'#234'ncias'
      Caption = 'Entregador'
      Hint = 'Alterar o entregador'
      ImageIndex = 36
      OnExecute = actEntregadorExecute
    end
    object actIncluir: TAction
      Tag = 3
      Category = 'Ocorr'#234'ncias'
      Caption = 'Incluir'
      ImageIndex = 0
      OnExecute = actIncluirExecute
    end
    object actExcluir: TAction
      Tag = 3
      Category = 'Ocorr'#234'ncias'
      Caption = 'Excluir'
      Hint = 'Excluir Ocorr'#234'ncia'
      ImageIndex = 5
      OnExecute = actExcluirExecute
    end
    object actCancelar: TAction
      Tag = 3
      Category = 'Ocorr'#234'ncias'
      Caption = 'Cancelar'
      Hint = 'Cancelar a Opera'#231#227'o Atual'
      ImageIndex = 4
      OnExecute = actCancelarExecute
    end
    object actDeclaracao: TAction
      Tag = 3
      Category = 'Ocorr'#234'ncias'
      Caption = 'Declara'#231#227'o'
      Hint = 'Imprimir Declara'#231#227'o'
      ImageIndex = 12
      OnExecute = actDeclaracaoExecute
    end
    object actFecharErros: TAction
      Category = 'Ocorr'#234'ncias'
      Caption = 'Fechar'
      Hint = 'Fechar tela de erros'
      ImageIndex = 6
      OnExecute = actFecharErrosExecute
    end
    object actExportarErros: TAction
      Category = 'Ocorr'#234'ncias'
      Caption = 'Exportar'
      Hint = 'Exportar tabelas de erros'
      ImageIndex = 29
      OnExecute = actExportarErrosExecute
    end
    object actCancelarOcorrencia: TAction
      Category = 'Ocorr'#234'ncias'
      Caption = 'Cancelar Ocorr'#234'ncia'
      Hint = 'Cancelar Ocorr'#234'ncia Pendente'
      ImageIndex = 4
      OnExecute = actCancelarOcorrenciaExecute
    end
  end
  object dsProduto: TDataSource
    AutoEdit = False
    DataSet = tbProdutos
    Left = 872
    Top = 176
  end
  object dsTipoOcorrencia: TDataSource
    AutoEdit = False
    DataSet = tbTipoOcorrencias
    Left = 816
    Top = 224
  end
  object dsEntregador: TDataSource
    AutoEdit = False
    DataSet = tbListaEntregadores
    Left = 872
    Top = 224
  end
  object OpenDialog: TOpenDialog
    Left = 827
    Top = 65535
  end
  object PopupMenu1: TPopupMenu
    Left = 872
    Top = 8
    object Importar1: TMenuItem
      Action = actImportarPlanilha
    end
  end
  object SaveDialog: TSaveDialog
    Left = 827
    Top = 47
  end
  object rptdsDeclaracaoJornal: TfrxDBDataset
    UserName = 'rptdsDeclaracaoJornal'
    CloseDataSource = False
    FieldAliases.Strings = (
      'RecId=RecId'
      'NUM_OCORRENCIA=NUM_OCORRENCIA'
      'DAT_OCORRENCIA=DAT_OCORRENCIA'
      'COD_ASSINATURA=COD_ASSINATURA'
      'NOM_ASSINANTE=NOM_ASSINANTE'
      'DES_ROTEIRO=DES_ROTEIRO'
      'COD_ENTREGADOR=COD_ENTREGADOR'
      'COD_PRODUTO=COD_PRODUTO'
      'COD_OCORRENCIA=COD_OCORRENCIA'
      'DOM_REINCIDENTE=DOM_REINCIDENTE'
      'DES_DESCRICAO=DES_DESCRICAO'
      'DES_ENDERECO=DES_ENDERECO'
      'DES_RETORNO=DES_RETORNO'
      'COD_RESULTADO=COD_RESULTADO'
      'COD_ORIGEM=COD_ORIGEM'
      'DES_OBS=DES_OBS'
      'COD_STATUS=COD_STATUS'
      'DES_APURACAO=DES_APURACAO'
      'DOM_PROCESSADO=DOM_PROCESSADO'
      'QTD_OCORRENCIAS=QTD_OCORRENCIAS'
      'VAL_OCORRENCIA=VAL_OCORRENCIA'
      'DAT_DESCONTO=DAT_DESCONTO'
      'DES_LOG=DES_LOG'
      'DES_CHAVE=DES_CHAVE'
      'DOM_FINALIZAR=DOM_FINALIZAR'
      'DES_ROTEIRO_NOVO=DES_ROTEIRO_NOVO'
      'DOM_IMPRESSAO=DOM_IMPRESSAO'
      'DES_ANEXO=DES_ANEXO'
      'DES_OCORRENCIA=DES_OCORRENCIA'
      'DES_PRODUTO=DES_PRODUTO')
    DataSet = tbPlanilha
    BCDToCurrency = False
    Left = 592
    Top = 48
  end
  object rptDeclaracaoJornal: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbNoEmail]
    PreviewOptions.Maximized = False
    PreviewOptions.MDIChild = True
    PreviewOptions.Modal = False
    PreviewOptions.ShowCaptions = True
    PreviewOptions.Zoom = 1.000000000000000000
    PreviewOptions.ZoomMode = zmPageWidth
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42527.519139814800000000
    ReportOptions.LastChange = 42528.473735428240000000
    ScriptLanguage = 'PascalScript'
    StoreInDFM = False
    OnAfterPrintReport = rptDeclaracaoJornalAfterPrintReport
    Left = 592
  end
  object tbProdutos: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 904
    Top = 176
    object tbProdutosCOD_PRODUTO: TWideStringField
      FieldName = 'COD_PRODUTO'
      Size = 10
    end
    object tbProdutosDES_PRODUTO: TWideStringField
      FieldName = 'DES_PRODUTO'
      Size = 70
    end
  end
  object tbListaEntregadores: TdxMemData
    Indexes = <
      item
        FieldName = 'COD_CADASTRO'
        SortOptions = []
      end>
    SortOptions = []
    Left = 912
    Top = 226
    object tbListaEntregadoresCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
    end
    object tbListaEntregadoresDES_RAZAO_SOCIAL: TStringField
      FieldName = 'DES_RAZAO_SOCIAL'
      Size = 70
    end
  end
  object tbTipoOcorrencias: TdxMemData
    Indexes = <>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F020000000400000003001400434F445F5449504F5F
      4F434F5252454E4349410046000000140014004445535F5449504F5F4F434F52
      52454E43494100}
    SortOptions = []
    Left = 776
    Top = 224
    object tbTipoOcorrenciasCOD_TIPO_OCORRENCIA: TIntegerField
      FieldName = 'COD_TIPO_OCORRENCIA'
    end
    object tbTipoOcorrenciasDES_TIPO_OCORRENCIA: TWideStringField
      FieldName = 'DES_TIPO_OCORRENCIA'
      Size = 70
    end
  end
  object ZConn: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    HostName = ''
    Port = 0
    Database = ''
    User = ''
    Password = ''
    Protocol = 'ado'
    Left = 688
    Top = 22
  end
  object qryAccess: TZReadOnlyQuery
    Connection = ZConn
    Params = <>
    Left = 728
    Top = 22
  end
  object dsErros: TDataSource
    AutoEdit = False
    DataSet = tbErros
    Left = 704
    Top = 232
  end
  object tbErros: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 704
    Top = 184
    object tbErrosCOD_ASSINATURA: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_ASSINATURA'
      Size = 10
    end
    object tbErrosNOM_ASSINANTE: TStringField
      DisplayLabel = 'Nome Assinante'
      FieldName = 'NOM_ASSINANTE'
      Size = 70
    end
    object tbErrosQTD_OCORRENCIAS: TIntegerField
      DisplayLabel = 'Qtde.'
      FieldName = 'QTD_OCORRENCIAS'
    end
    object tbErrosVAL_UNITARIO: TFloatField
      DisplayLabel = 'Unit'#225'rio'
      FieldName = 'VAL_UNITARIO'
    end
    object tbErrosVAL_OCORRENCIA: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'VAL_OCORRENCIA'
    end
    object tbErrosDES_DESCRICAO: TStringField
      DisplayLabel = 'Capas'
      FieldName = 'DES_DESCRICAO'
      Size = 256
    end
  end
end
