object frmImportarExtravios: TfrmImportarExtravios
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Importa'#231#227'o de Extravios'
  ClientHeight = 573
  ClientWidth = 1114
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 47
    Align = alLeft
    Caption = 'Op'#231#245'es'
    TabOrder = 0
    Height = 523
    Width = 185
    object cxLabel1: TcxLabel
      Left = 5
      Top = 24
      Caption = 'Data do Extravio'
      Transparent = True
    end
    object cxDataExtravio: TcxDateEdit
      Left = 5
      Top = 41
      Hint = 'Data do Extravio'
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
      TabOrder = 1
      Width = 175
    end
    object cxButton1: TcxButton
      AlignWithMargins = True
      Left = 6
      Top = 411
      Width = 173
      Height = 20
      Cursor = crHandPoint
      Align = alBottom
      Action = actImportarLer
      TabOrder = 2
    end
    object cxButton2: TcxButton
      AlignWithMargins = True
      Left = 6
      Top = 437
      Width = 173
      Height = 20
      Cursor = crHandPoint
      Align = alBottom
      Action = actImportarSalvar
      TabOrder = 3
    end
    object cxButton3: TcxButton
      AlignWithMargins = True
      Left = 6
      Top = 463
      Width = 173
      Height = 20
      Cursor = crHandPoint
      Align = alBottom
      Action = actImportarSair
      TabOrder = 4
    end
    object cxProgressBar1: TcxProgressBar
      AlignWithMargins = True
      Left = 6
      Top = 489
      Align = alBottom
      Properties.BarStyle = cxbsLEDs
      Properties.ShowTextStyle = cxtsText
      TabOrder = 5
      Visible = False
      Width = 173
    end
  end
  object cxGrid1: TcxGrid
    AlignWithMargins = True
    Left = 194
    Top = 47
    Width = 917
    Height = 523
    Align = alClient
    TabOrder = 1
    object cxGrid1DBTableView1: TcxGridDBTableView
      PopupMenu = PopupMenu1
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.PriorPage.Visible = False
      Navigator.Buttons.NextPage.Visible = False
      Navigator.Buttons.Insert.Visible = False
      Navigator.Buttons.Refresh.Visible = False
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.Buttons.Filter.Visible = False
      Navigator.InfoPanel.DisplayMask = 'Registro [RecordIndex] de [RecordCount]'
      Navigator.InfoPanel.Visible = True
      Navigator.Visible = True
      DataController.DataSource = DS
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0.00;- ,0.00'
          Kind = skSum
          Column = cxGrid1DBTableView1VAL_PRODUTO
        end
        item
          Format = ',0.00;- ,0.00'
          Kind = skSum
          Column = cxGrid1DBTableView1VAL_MULTA
        end
        item
          Format = ',0.00;- ,0.00'
          Kind = skSum
          Column = cxGrid1DBTableView1VAL_VERBA
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CopyCaptionsToClipboard = False
      OptionsBehavior.CopyPreviewToClipboard = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnHidingOnGrouping = False
      OptionsData.Inserting = False
      OptionsSelection.InvertSelect = False
      OptionsSelection.MultiSelect = True
      OptionsSelection.CellMultiSelect = True
      OptionsView.NoDataToDisplayInfoText = '<Nenhuma informa'#231#227'o dispon'#237'vel>'
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object cxGrid1DBTableView1DAT_EXTRAVIO: TcxGridDBColumn
        Caption = 'Data'
        DataBinding.FieldName = 'DAT_EXTRAVIO'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.SaveTime = False
        Properties.ShowTime = False
        HeaderAlignmentHorz = taCenter
        Width = 99
      end
      object cxGrid1DBTableView1NUM_NOSSONUMERO: TcxGridDBColumn
        Caption = 'Nosso N'#250'mero'
        DataBinding.FieldName = 'NUM_NOSSONUMERO'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 137
      end
      object cxGrid1DBTableView1DES_EXTRAVIO: TcxGridDBColumn
        Caption = 'Descri'#231#227'o'
        DataBinding.FieldName = 'DES_EXTRAVIO'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Items.Strings = (
          'ASSALTO COM GR'#9
          'ASSALTO SEM GR'#9
          'ATRASO NA DEVOLU'#199#195'O'#9
          'AVARIA DO PRODUTO EM PODER DO AGENTE'#9
          'AVARIA DO PRODUTO NA EXPEDI'#199#195'O'#9
          'AVARIA DO PRODUTO NA TRANSFER'#202'NCIA'#9
          'AVARIA NA DEVOLU'#199#195'O'#9
          'EXTRAVIO PARCIAL'#9
          'FALHA DO CONTROLE '#9
          'FOR'#199'ADO POR ATRASO'#9
          'FOR'#199'ADO POR PERDA DO PRODUTO'#9
          'FURTO INTERNO NA FRANQUIA'#9
          'LR - PRODUTO COLETADO FORA DOS PADR'#213'ES'#9
          'FALTA NO CONTAINER OU ROMANEIO  S/ ANOTA'#199#195'O NO ROMANEIO'
          'MULTA POR ENTREGA EM LOCAL INDEVIDO'
          'MULTA POR PROTOCOLO RASURADO/INCORRETO')
        HeaderAlignmentHorz = taCenter
        Width = 437
      end
      object cxGrid1DBTableView1COD_ENTREGADOR: TcxGridDBColumn
        Caption = 'C'#243'd. Entregador'
        DataBinding.FieldName = 'COD_ENTREGADOR'
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Action = actImportarApoio
            Default = True
            Kind = bkGlyph
          end>
        Properties.Images = dm.cxImageList1
        Properties.OnValidate = cxGrid1DBTableView1COD_ENTREGADORPropertiesValidate
        HeaderAlignmentHorz = taCenter
        Width = 99
      end
      object cxGrid1DBTableView1NOM_ENTREGADOR: TcxGridDBColumn
        Caption = 'Nome Entregador'
        DataBinding.FieldName = 'NOM_ENTREGADOR'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
      end
      object cxGrid1DBTableView1VAL_PRODUTO: TcxGridDBColumn
        Caption = 'Valor'
        DataBinding.FieldName = 'VAL_PRODUTO'
        HeaderAlignmentHorz = taCenter
        Width = 84
      end
      object cxGrid1DBTableView1VAL_MULTA: TcxGridDBColumn
        Caption = 'Multa'
        DataBinding.FieldName = 'VAL_MULTA'
        HeaderAlignmentHorz = taCenter
        Width = 75
      end
      object cxGrid1DBTableView1VAL_VERBA: TcxGridDBColumn
        Caption = 'Verba'
        DataBinding.FieldName = 'VAL_VERBA'
        HeaderAlignmentHorz = taCenter
        Width = 75
      end
      object cxGrid1DBTableView1DES_RESTRICAO: TcxGridDBColumn
        Caption = 'Restricao para'
        DataBinding.FieldName = 'DES_RESTRICAO'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.CharCase = ecUpperCase
        Properties.DropDownListStyle = lsEditFixedList
        Properties.Items.Strings = (
          'NINGUEM'
          'ADM.CEP'
          'ENTREGADOR')
        HeaderAlignmentHorz = taCenter
        Width = 106
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
    Caption = 'Importa'#231#227'o de Extravios'
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
    Width = 1108
    AnchorY = 22
  end
  object DS: TDataSource
    DataSet = dm.tbImportacaoExtravio
    Left = 144
    Top = 120
  end
  object aclImportarExtravio: TActionList
    Images = dm.cxImageList1
    Left = 144
    Top = 168
    object actImportarLer: TAction
      Tag = 3
      Category = 'Importa'#231#227'o'
      Caption = 'Ler &Planilha'
      Hint = 'Ler Planilha de Extravios'
      ImageIndex = 28
      OnExecute = actImportarLerExecute
    end
    object actImportarSalvar: TAction
      Tag = 3
      Category = 'Importa'#231#227'o'
      Caption = '&Gravar'
      Enabled = False
      Hint = 'Salvar Extravios no Banco de Dados'
      ImageIndex = 9
      OnExecute = actImportarSalvarExecute
    end
    object actImportarSair: TAction
      Tag = 99
      Category = 'Importa'#231#227'o'
      Caption = 'Sair'
      Hint = 'Sair da Tela'
      ImageIndex = 10
      OnExecute = actImportarSairExecute
    end
    object actImportarApoio: TAction
      Tag = 99
      Category = 'Importa'#231#227'o'
      Caption = 'Lista de Apoio'
      Hint = 'Lista de Apoio'
      ImageIndex = 11
      OnExecute = actImportarApoioExecute
    end
    object actImportarColarTodos: TAction
      Category = 'Importa'#231#227'o'
      Caption = 'Colar em Todos'
      Hint = 'Colar em todas as linhas'
      ImageIndex = 66
      OnExecute = actImportarColarTodosExecute
    end
  end
  object OpenDialog: TOpenDialog
    Filter = 'CSV (separados por virgulas)|*.csv'
    Left = 144
    Top = 216
  end
  object PopupMenu1: TPopupMenu
    Images = dm.cxImageList1
    Left = 144
    Top = 272
    object Colaremtodos1: TMenuItem
      Action = actImportarColarTodos
    end
  end
end
