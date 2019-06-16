object frmAbastecimentos: TfrmAbastecimentos
  Left = 0
  Top = 0
  Caption = 'Abastecimentos'
  ClientHeight = 512
  ClientWidth = 1113
  Color = clBtnFace
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
  DesignSize = (
    1113
    512)
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel27: TcxLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alTop
    AutoSize = False
    Caption = 'Abastecimentos'
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
    Width = 1107
    AnchorY = 22
  end
  object cxGrid1: TcxGrid
    Left = 3
    Top = 47
    Width = 1107
    Height = 430
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    object cxGrid1DBTableView1: TcxGridDBTableView
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
      Navigator.InfoPanel.DisplayMask = 'Registro [RecordIndex] de [RecordCount]'
      Navigator.InfoPanel.Visible = True
      Navigator.Visible = True
      DataController.DataSource = dsAbastecimentos
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0.000;- ,0.000'
          Kind = skSum
          Column = cxGrid1DBTableView1QTD_ABASTECIMENTO
        end
        item
          Format = ',0.000;- ,0.000'
          Kind = skSum
          Column = cxGrid1DBTableView1VAL_TOTAL
        end>
      DataController.Summary.SummaryGroups = <>
      EditForm.DefaultColumnCount = 1
      EditForm.ItemHotTrack = True
      EditForm.DefaultStretch = fsHorizontal
      NewItemRow.InfoText = 'Clique aqui para incluir'
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.FocusFirstCellOnNewRecord = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.ColumnHeaderHints = False
      OptionsBehavior.EditMode = emInplaceEditForm
      OptionsBehavior.ExpandMasterRowOnDblClick = False
      OptionsCustomize.ColumnGrouping = False
      OptionsData.DeletingConfirmation = False
      OptionsSelection.InvertSelect = False
      OptionsSelection.MultiSelect = True
      OptionsSelection.CellMultiSelect = True
      OptionsView.NoDataToDisplayInfoText = '<Nenhuma informa'#231#227'o dispon'#237'vel>'
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object cxGrid1DBTableView1NUM_ABASTECIMENTO: TcxGridDBColumn
        Caption = 'N'#186'.'
        DataBinding.FieldName = 'NUM_ABASTECIMENTO'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.IgnoreMaskBlank = True
        Properties.MaskKind = emkRegExpr
        Properties.EditMask = '\d\d\d\d\d'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 54
      end
      object cxGrid1DBTableView1NUM_CUPOM: TcxGridDBColumn
        Caption = 'Cupom N'#186'.'
        DataBinding.FieldName = 'NUM_CUPOM'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.IgnoreMaskBlank = True
        Properties.MaskKind = emkRegExpr
        Properties.EditMask = '\d\d\d\d\d\d\d\d\d\d'
        HeaderAlignmentHorz = taCenter
        Width = 84
      end
      object cxGrid1DBTableView1DES_PLACA: TcxGridDBColumn
        Caption = 'Placa'
        DataBinding.FieldName = 'DES_PLACA'
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Action = actAbastecimentosApoioVeiculos
            Default = True
            Kind = bkEllipsis
          end>
        Properties.CharCase = ecUpperCase
        Properties.IgnoreMaskBlank = True
        Properties.MaskKind = emkRegExpr
        Properties.OnValidate = cxGrid1DBTableView1DES_PLACAPropertiesValidate
        HeaderAlignmentHorz = taCenter
        Width = 89
      end
      object cxGrid1DBTableView1COD_ENTREGADOR: TcxGridDBColumn
        Caption = 'Cadastro'
        DataBinding.FieldName = 'COD_ENTREGADOR'
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Action = actAbastecimentoApoioEntregadores
            Default = True
            Kind = bkEllipsis
          end>
        Properties.MaskKind = emkRegExpr
        Properties.EditMask = '\d\d\d\d\d\d'
        Properties.OnValidate = cxGrid1DBTableView1COD_ENTREGADORPropertiesValidate
        HeaderAlignmentHorz = taCenter
        Width = 75
      end
      object cxGrid1DBTableView1NOM_ENTREGADOR: TcxGridDBColumn
        Caption = 'Nome'
        DataBinding.FieldName = 'NOM_ENTREGADOR'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 197
      end
      object cxGrid1DBTableView1DAT_ABASTECIMENTO: TcxGridDBColumn
        Caption = 'Data'
        DataBinding.FieldName = 'DAT_ABASTECIMENTO'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.SaveTime = False
        Properties.ShowTime = False
        HeaderAlignmentHorz = taCenter
        Width = 88
      end
      object cxGrid1DBTableView1DES_PRODUTO: TcxGridDBColumn
        Caption = 'Produto'
        DataBinding.FieldName = 'DES_PRODUTO'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.ImmediateDropDownWhenActivated = True
        Properties.Items.Strings = (
          'GASOLINA COMUM'
          'GASOLINA ADITIVADA'
          'ETANOL COMUM'
          'ETANOL E. HIDRATADO'
          'BIO DIESEL')
        HeaderAlignmentHorz = taCenter
        Width = 185
      end
      object cxGrid1DBTableView1QTD_ABASTECIMENTO: TcxGridDBColumn
        Caption = 'Qtde.'
        DataBinding.FieldName = 'QTD_ABASTECIMENTO'
        PropertiesClassName = 'TcxCalcEditProperties'
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
        Properties.DisplayFormat = ',0.000;- ,0.000'
        Properties.ImmediateDropDownWhenActivated = True
        Properties.ImmediateDropDownWhenKeyPressed = True
        HeaderAlignmentHorz = taCenter
        Width = 69
      end
      object cxGrid1DBTableView1VAL_UNITARIO: TcxGridDBColumn
        Caption = 'Unit'#225'rio'
        DataBinding.FieldName = 'VAL_UNITARIO'
        PropertiesClassName = 'TcxCalcEditProperties'
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
        Properties.DisplayFormat = ',0.000;- ,0.000'
        Properties.ImmediateDropDownWhenActivated = True
        Properties.ImmediateDropDownWhenKeyPressed = True
        HeaderAlignmentHorz = taCenter
        Width = 71
      end
      object cxGrid1DBTableView1VAL_TOTAL: TcxGridDBColumn
        Caption = 'Total'
        DataBinding.FieldName = 'VAL_TOTAL'
        PropertiesClassName = 'TcxCalcEditProperties'
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
        Properties.DisplayFormat = ',0.00;- ,0.00'
        Properties.ImmediateDropDownWhenActivated = True
        Properties.ImmediateDropDownWhenKeyPressed = True
        HeaderAlignmentHorz = taCenter
        Width = 70
      end
      object cxGrid1DBTableView1DOM_DESCONTO: TcxGridDBColumn
        Caption = 'Descontado'
        DataBinding.FieldName = 'DOM_DESCONTO'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Images = dm.cxImageList1
        Properties.ImmediateDropDownWhenActivated = True
        Properties.ImmediatePost = True
        Properties.Items = <
          item
            Description = 'Descontado'
            ImageIndex = 51
            Value = 'S'
          end
          item
            Description = 'Pendente'
            ImageIndex = 52
            Value = 'N'
          end>
        HeaderAlignmentHorz = taCenter
        Width = 76
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object cxButton1: TcxButton
    Left = 3
    Top = 483
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Action = actAbastecimentoIncluir
    Anchors = [akLeft, akBottom]
    TabOrder = 2
  end
  object cxButton3: TcxButton
    Left = 84
    Top = 483
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Action = actAbastecimentoEditar
    Anchors = [akLeft, akBottom]
    TabOrder = 3
  end
  object cxButton6: TcxButton
    Left = 246
    Top = 483
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Action = actAbastecimentoExportar
    Anchors = [akLeft, akBottom]
    TabOrder = 5
  end
  object cxButton7: TcxButton
    Left = 1030
    Top = 483
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Action = actAbastecimentoSair
    Anchors = [akRight, akBottom]
    TabOrder = 6
  end
  object cxButton2: TcxButton
    Left = 165
    Top = 483
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Action = actAbastecimentoExcluir
    Anchors = [akLeft, akBottom]
    TabOrder = 4
  end
  object dsAbastecimentos: TDataSource
    AutoEdit = False
    DataSet = tbAbastecimentos
    Left = 744
  end
  object aclAbastecimento: TActionList
    Images = dm.cxImageList1
    Left = 808
    object actAbastecimentoIncluir: TAction
      Tag = 3
      Category = 'Abastecimentos'
      Caption = '&Incluir'
      Hint = 'Incluir Abastecimento'
      ImageIndex = 1
      ShortCut = 113
      OnExecute = actAbastecimentoIncluirExecute
    end
    object actAbastecimentoEditar: TAction
      Tag = 3
      Category = 'Abastecimentos'
      Caption = '&Editar'
      Hint = 'Editar Abastecimento'
      ImageIndex = 14
      ShortCut = 114
      OnExecute = actAbastecimentoEditarExecute
    end
    object actAbastecimentoExportar: TAction
      Tag = 3
      Category = 'Abastecimentos'
      Caption = 'E&xportar'
      Hint = 'Exportar dados da grade'
      ImageIndex = 29
    end
    object actAbastecimentoSair: TAction
      Tag = 3
      Category = 'Abastecimentos'
      Caption = '&Sair'
      Hint = 'Sair da tela'
      ImageIndex = 10
      OnExecute = actAbastecimentoSairExecute
    end
    object actAbastecimentoApoioEntregadores: TAction
      Category = 'Abastecimentos'
      Caption = 'Lista de Apoio Entregadores'
      Hint = 'Lista de Apoio de Entregadores'
      ImageIndex = 11
      OnExecute = actAbastecimentoApoioEntregadoresExecute
    end
    object actAbastecimentosApoioVeiculos: TAction
      Category = 'Abastecimentos'
      Caption = 'Lista Apoio Ve'#237'culos'
      Hint = 'Lista de Apoio de Ve'#237'culos'
      ImageIndex = 11
      OnExecute = actAbastecimentosApoioVeiculosExecute
    end
    object actAbastecimentoExcluir: TAction
      Category = 'Abastecimentos'
      Caption = 'Exluir'
      Hint = 'Excluir Dados'
      ImageIndex = 8
      OnExecute = actAbastecimentoExcluirExecute
    end
  end
  object tbAbastecimentos: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    BeforePost = tbAbastecimentosBeforePost
    AfterPost = tbAbastecimentosAfterPost
    AfterCancel = tbAbastecimentosAfterCancel
    BeforeDelete = tbAbastecimentosBeforeDelete
    AfterDelete = tbAbastecimentosAfterDelete
    Left = 864
    object tbAbastecimentosNUM_ABASTECIMENTO: TIntegerField
      FieldName = 'NUM_ABASTECIMENTO'
    end
    object tbAbastecimentosNUM_CUPOM: TWideStringField
      FieldName = 'NUM_CUPOM'
      Size = 10
    end
    object tbAbastecimentosCOD_ENTREGADOR: TIntegerField
      FieldName = 'COD_ENTREGADOR'
    end
    object tbAbastecimentosDES_PLACA: TWideStringField
      FieldName = 'DES_PLACA'
      Size = 7
    end
    object tbAbastecimentosDAT_ABASTECIMENTO: TDateField
      FieldName = 'DAT_ABASTECIMENTO'
    end
    object tbAbastecimentosDES_PRODUTO: TWideStringField
      FieldName = 'DES_PRODUTO'
      Size = 50
    end
    object tbAbastecimentosQTD_ABASTECIMENTO: TFloatField
      FieldName = 'QTD_ABASTECIMENTO'
    end
    object tbAbastecimentosVAL_UNITARIO: TFloatField
      FieldName = 'VAL_UNITARIO'
    end
    object tbAbastecimentosVAL_TOTAL: TFloatField
      FieldName = 'VAL_TOTAL'
    end
    object tbAbastecimentosNOM_EXECUTANTE: TWideStringField
      FieldName = 'NOM_EXECUTANTE'
    end
    object tbAbastecimentosDAT_MANUTENCAO: TDateTimeField
      FieldName = 'DAT_MANUTENCAO'
    end
    object tbAbastecimentosDOM_DESCONTO: TWideStringField
      FieldName = 'DOM_DESCONTO'
      Size = 1
    end
    object tbAbastecimentosNUM_EXTRATO: TWideStringField
      FieldName = 'NUM_EXTRATO'
      Size = 15
    end
    object tbAbastecimentosVAL_VERBA_COMBUSTIVEL: TFloatField
      FieldName = 'VAL_VERBA_COMBUSTIVEL'
    end
    object tbAbastecimentosVAL_DESCONTO: TFloatField
      FieldName = 'VAL_DESCONTO'
    end
    object tbAbastecimentosDAT_BASE: TDateField
      FieldName = 'DAT_BASE'
    end
    object tbAbastecimentosNOM_ENTREGADOR: TWideStringField
      FieldName = 'NOM_ENTREGADOR'
      Size = 70
    end
  end
end
