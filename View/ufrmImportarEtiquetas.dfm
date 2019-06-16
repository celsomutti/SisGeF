object frmImportarEtiquetas: TfrmImportarEtiquetas
  Left = 0
  Top = 0
  Caption = 'Importa'#231#227'o de Etiquetas'
  ClientHeight = 563
  ClientWidth = 1104
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  Visible = True
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
    Height = 513
    Width = 185
    object cxLabel1: TcxLabel
      Left = 6
      Top = 24
      Caption = 'Data da Edi'#231#227'o'
      Transparent = True
    end
    object cxDataEdicao: TcxDateEdit
      Left = 6
      Top = 41
      Hint = 'Data da Edi'#231#227'o'
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
      Width = 173
    end
    object cxButton1: TcxButton
      AlignWithMargins = True
      Left = 6
      Top = 428
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
      Top = 454
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
      Top = 480
      Width = 173
      Height = 20
      Cursor = crHandPoint
      Align = alBottom
      Action = actImportarSair
      TabOrder = 4
    end
  end
  object cxGrid1: TcxGrid
    AlignWithMargins = True
    Left = 194
    Top = 47
    Width = 907
    Height = 513
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
      DataController.DataSource = dm.dsImportaEtiquetas
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0.00;- ,0.00'
          Kind = skSum
        end
        item
          Format = ',0.00;- ,0.00'
          Kind = skSum
        end
        item
          Format = ',0.00;- ,0.00'
          Kind = skSum
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
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object cxGrid1DBTableView1COD_ASSINANTE: TcxGridDBColumn
        Caption = 'C'#243'digo'
        DataBinding.FieldName = 'COD_ASSINANTE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 58
      end
      object cxGrid1DBTableView1COD_PRODUTO: TcxGridDBColumn
        Caption = 'Produto'
        DataBinding.FieldName = 'COD_PRODUTO'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'COD_PRODUTO'
        Properties.ListColumns = <
          item
            Caption = 'Descri'#231#227'o'
            FieldName = 'DES_PRODUTO'
          end>
        Properties.ListSource = dsProdutos
        Properties.ReadOnly = True
        Width = 107
      end
      object cxGrid1DBTableView1COD_TIPO_ASSINATURA: TcxGridDBColumn
        Caption = 'Tipo'
        DataBinding.FieldName = 'COD_TIPO_ASSINATURA'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'COD_TIPO_ASSINATURA'
        Properties.ListColumns = <
          item
            Caption = 'Descri'#231#227'o'
            FieldName = 'DES_TIPO_ASSINATURA'
          end>
        Properties.ListSource = dsTipo
        Properties.ReadOnly = True
        Width = 80
      end
      object cxGrid1DBTableView1NUM_EDICAO: TcxGridDBColumn
        Caption = 'N'#186'. Edi'#231#227'o'
        DataBinding.FieldName = 'NUM_EDICAO'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 95
      end
      object cxGrid1DBTableView1NUM_ROTEIRO: TcxGridDBColumn
        Caption = 'Roteiro'
        DataBinding.FieldName = 'NUM_ROTEIRO'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.IgnoreMaskBlank = True
        Properties.MaskKind = emkRegExpr
        Properties.EditMask = '\d\d\d\d\d\d\d\d\d\d'
        Width = 75
      end
      object cxGrid1DBTableView1DAT_EDICAO: TcxGridDBColumn
        Caption = 'Data'
        DataBinding.FieldName = 'DAT_EDICAO'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.SaveTime = False
        Properties.ShowTime = False
        Visible = False
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
        Width = 67
      end
      object cxGrid1DBTableView1NOM_ASSINANTE: TcxGridDBColumn
        Caption = 'Nome'
        DataBinding.FieldName = 'NOM_ASSINANTE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 169
      end
      object cxGrid1DBTableView1NOM_CUIDADOS: TcxGridDBColumn
        Caption = 'Aos Cuidados'
        DataBinding.FieldName = 'NOM_CUIDADOS'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 163
      end
      object cxGrid1DBTableView1DES_ENDERECO: TcxGridDBColumn
        Caption = 'Endere'#231'o'
        DataBinding.FieldName = 'DES_ENDERECO'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 188
      end
      object cxGrid1DBTableView1DES_COMPLEMENTO: TcxGridDBColumn
        Caption = 'Complemento'
        DataBinding.FieldName = 'DES_COMPLEMENTO'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 174
      end
      object cxGrid1DBTableView1DES_BAIRRO: TcxGridDBColumn
        Caption = 'Bairro'
        DataBinding.FieldName = 'DES_BAIRRO'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 116
      end
      object cxGrid1DBTableView1DES_REFERENCIA: TcxGridDBColumn
        Caption = 'Refer'#234'ncia'
        DataBinding.FieldName = 'DES_REFERENCIA'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 207
      end
      object cxGrid1DBTableView1DES_CIDADE: TcxGridDBColumn
        Caption = 'Cidade'
        DataBinding.FieldName = 'DES_CIDADE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object cxGrid1DBTableView1DES_UF: TcxGridDBColumn
        Caption = 'UF'
        DataBinding.FieldName = 'DES_UF'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'UF_ESTADO'
        Properties.ListColumns = <
          item
            FieldName = 'UF_ESTADO'
          end>
        Properties.ListSource = dsEstado
        Properties.ReadOnly = True
        Width = 45
      end
      object cxGrid1DBTableView1CEP_ENDERECO: TcxGridDBColumn
        Caption = 'CEP'
        DataBinding.FieldName = 'CEP_ENDERECO'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.IgnoreMaskBlank = True
        Properties.MaskKind = emkRegExpr
        Properties.EditMask = '\d\d\d\d\d\d\d\d'
        Properties.ReadOnly = True
        Width = 73
      end
      object cxGrid1DBTableView1QTD_EXEMPLARES: TcxGridDBColumn
        Caption = 'Exemplares'
        DataBinding.FieldName = 'QTD_EXEMPLARES'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.MinValue = 1.000000000000000000
        Properties.ReadOnly = True
        Width = 64
      end
      object cxGrid1DBTableView1DOM_PROTOCOLO: TcxGridDBColumn
        Caption = 'Protocolo'
        DataBinding.FieldName = 'DOM_PROTOCOLO'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Images = dm.cxImageList1
        Properties.Items = <
          item
            Description = 'IMPRIMIR'
            ImageIndex = 51
            Value = 'S'
          end
          item
            Description = 'N'#195'O IMPRIMIR'
            ImageIndex = 62
            Value = 'N'
          end>
        Properties.ReadOnly = False
        Width = 99
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
    Caption = 'Importa'#231#227'o de Etiquetas'
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
    Width = 1098
    AnchorY = 22
  end
  object aclImportarEtiquetas: TActionList
    Images = dm.cxImageList1
    Left = 144
    Top = 304
    object actImportarLer: TAction
      Tag = 3
      Category = 'Importa'#231#227'o'
      Caption = 'Ler &Planilha'
      Hint = 'Ler Planilha de Assinantes'
      ImageIndex = 28
      OnExecute = actImportarLerExecute
    end
    object actImportarSalvar: TAction
      Tag = 3
      Category = 'Importa'#231#227'o'
      Caption = '&Gravar'
      Hint = 'Salvar Etiquetas no Banco de Dados'
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
    Top = 352
  end
  object PopupMenu1: TPopupMenu
    Images = dm.cxImageList1
    Left = 144
    Top = 408
    object Colaremtodos1: TMenuItem
      Action = actImportarColarTodos
    end
  end
  object dsEstado: TDataSource
    AutoEdit = False
    DataSet = dm.tbEstados
    Left = 552
    Top = 8
  end
  object dsProdutos: TDataSource
    AutoEdit = False
    DataSet = dm.tbProdutos
    Left = 592
    Top = 8
  end
  object dsTipo: TDataSource
    AutoEdit = False
    DataSet = dm.tbTipoAssinatura
    Left = 632
    Top = 8
  end
end
