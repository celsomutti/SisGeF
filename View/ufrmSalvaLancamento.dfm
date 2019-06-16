object frmSalvaLancamento: TfrmSalvaLancamento
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Salvar Lan'#231'amento'
  ClientHeight = 311
  ClientWidth = 386
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alClient
    PanelStyle.Active = True
    PanelStyle.OfficeBackgroundKind = pobkGradient
    TabOrder = 0
    Height = 311
    Width = 386
    object cxLabel1: TcxLabel
      Left = 16
      Top = 11
      Caption = 'Selecione a Opera'#231#227'o:'
      Transparent = True
    end
    object cxOperacao: TcxComboBox
      Left = 16
      Top = 26
      Hint = 'Tipo de Opera'#231#227'o do Lan'#231'amento'
      Properties.Items.Strings = (
        'PARCELA '#218'NICA'
        'PARCELAR'
        'GERAR RECORR'#202'NCIA')
      Properties.OnValidate = cxOperacaoPropertiesValidate
      TabOrder = 1
      Text = 'PARCELA '#218'NICA'
      Width = 137
    end
    object cxLabel2: TcxLabel
      Left = 159
      Top = 11
      Caption = 'Parcelas:'
      Transparent = True
    end
    object cxQuantidade: TcxSpinEdit
      Left = 159
      Top = 26
      Hint = 'Quantidade de Parcelas ou Recorr'#234'ncias'
      Properties.Alignment.Horz = taRightJustify
      Properties.ReadOnly = True
      TabOrder = 3
      Value = 1
      Width = 50
    end
    object cxLabel3: TcxLabel
      Left = 215
      Top = 11
      Caption = 'Intervalo:'
      Transparent = True
    end
    object cxIntervalo: TcxSpinEdit
      Left = 215
      Top = 26
      Hint = 'Intervalo de Dias entre as Parcelas/Recorr'#234'ncias'
      Properties.Alignment.Horz = taRightJustify
      Properties.ReadOnly = True
      TabOrder = 5
      Width = 50
    end
    object cxButton1: TcxButton
      Left = 292
      Top = 27
      Width = 91
      Height = 20
      Cursor = crHandPoint
      Action = actParcelamentoExecutar
      TabOrder = 8
    end
    object cxGrid1: TcxGrid
      Left = 15
      Top = 88
      Width = 250
      Height = 209
      TabOrder = 9
      object cxGrid1DBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = DS
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ' ,0.00;- ,0.00'
            Kind = skSum
            Column = cxGrid1DBTableView1VAL_PARCELA
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsView.NoDataToDisplayInfoText = 'Nenhuma Informa'#231#227'o Dispon'#237'vel'
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        object cxGrid1DBTableView1RecId: TcxGridDBColumn
          Caption = 'Parcela'
          DataBinding.FieldName = 'RecId'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          SortIndex = 0
          SortOrder = soAscending
          Width = 58
        end
        object cxGrid1DBTableView1DAT_PARCELA: TcxGridDBColumn
          DataBinding.FieldName = 'DAT_PARCELA'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.SaveTime = False
          Properties.ShowTime = False
          Width = 83
        end
        object cxGrid1DBTableView1VAL_PARCELA: TcxGridDBColumn
          DataBinding.FieldName = 'VAL_PARCELA'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ' ,0.00;- ,0.00'
          Width = 89
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
    object cxButton2: TcxButton
      Left = 288
      Top = 88
      Width = 91
      Height = 20
      Cursor = crHandPoint
      Action = actParcalamentoLimpar
      TabOrder = 10
    end
    object cxLabel4: TcxLabel
      Left = 159
      Top = 45
      Caption = 'Valor:'
      Transparent = True
    end
    object cxValor: TcxCurrencyEdit
      Left = 157
      Top = 61
      Hint = 'Valor do Lan'#231'amento'
      EditValue = 0.000000000000000000
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ' ,0.00;- ,0.00'
      TabOrder = 7
      Width = 108
    end
    object cxButton3: TcxButton
      Left = 288
      Top = 251
      Width = 91
      Height = 20
      Cursor = crHandPoint
      Action = actParcelamentoSalvar
      TabOrder = 12
    end
    object cxButton4: TcxButton
      Left = 288
      Top = 277
      Width = 91
      Height = 20
      Cursor = crHandPoint
      Action = actPartcelamentoCancelar
      TabOrder = 13
    end
    object cxLabel5: TcxLabel
      Left = 16
      Top = 45
      Caption = 'Data Inicial:'
      Transparent = True
    end
    object cxVencimento: TcxDateEdit
      Left = 16
      Top = 61
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
      Properties.ReadOnly = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 6
      Width = 121
    end
  end
  object aclParcelas: TActionList
    Images = dm.cxImageList1
    Left = 336
    Top = 144
    object actParcelamentoExecutar: TAction
      Tag = 99
      Category = 'Parcelamento'
      Caption = 'Calcular'
      Hint = 'Executar'
      ImageIndex = 30
      OnExecute = actParcelamentoExecutarExecute
    end
    object actParcalamentoLimpar: TAction
      Tag = 99
      Category = 'Parcelamento'
      Caption = 'Limpar Grade'
      Hint = 'Limpar a Grade de Parcelamentos'
      ImageIndex = 28
      OnExecute = actParcalamentoLimparExecute
    end
    object actParcelamentoSalvar: TAction
      Tag = 99
      Category = 'Parcelamento'
      Caption = 'Salvar'
      Hint = 'Salvar Parcelamento'
      ImageIndex = 9
      OnExecute = actParcelamentoSalvarExecute
    end
    object actPartcelamentoCancelar: TAction
      Tag = 99
      Category = 'Parcelamento'
      Caption = 'Cancelar'
      Hint = 'Cancelar Parcelamento'
      ImageIndex = 6
      OnExecute = actPartcelamentoCancelarExecute
    end
  end
  object tbParcelas: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 288
    Top = 152
    object tbParcelasDAT_PARCELA: TDateField
      DisplayLabel = 'Data'
      FieldName = 'DAT_PARCELA'
    end
    object tbParcelasVAL_PARCELA: TCurrencyField
      DisplayLabel = 'Valor'
      FieldName = 'VAL_PARCELA'
    end
  end
  object DS: TDataSource
    DataSet = tbParcelas
    Left = 288
    Top = 200
  end
end
