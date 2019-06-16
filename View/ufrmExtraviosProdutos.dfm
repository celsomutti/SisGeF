object frmExtraviosProdutos: TfrmExtraviosProdutos
  Left = 0
  Top = 0
  Caption = 'Extravios de Produtos / Multas'
  ClientHeight = 506
  ClientWidth = 1114
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    1114
    506)
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel27: TcxLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alTop
    AutoSize = False
    Caption = 'Extravios de Produtos / Multas'
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
  object cxGrid1: TcxGrid
    AlignWithMargins = True
    Left = 8
    Top = 47
    Width = 1108
    Height = 396
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.Images = dm.cxImageList1
      Navigator.Buttons.PriorPage.Visible = False
      Navigator.Buttons.NextPage.Visible = False
      Navigator.Buttons.Insert.ImageIndex = 1
      Navigator.Buttons.Insert.Visible = False
      Navigator.Buttons.Delete.ImageIndex = 8
      Navigator.Buttons.Delete.Visible = False
      Navigator.Buttons.Edit.ImageIndex = 14
      Navigator.Buttons.Edit.Visible = False
      Navigator.Buttons.Post.ImageIndex = 9
      Navigator.Buttons.Post.Visible = False
      Navigator.Buttons.Cancel.ImageIndex = 6
      Navigator.Buttons.Cancel.Visible = False
      Navigator.Buttons.Refresh.Visible = False
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.Buttons.Filter.Visible = False
      Navigator.InfoPanel.DisplayMask = '[RecordCount] Registros'
      Navigator.InfoPanel.Visible = True
      Navigator.Visible = True
      OnCanFocusRecord = cxGrid1DBTableView1CanFocusRecord
      DataController.DataSource = dsExtravios
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ' ,0.00;- ,0.00'
          Kind = skSum
        end
        item
          Format = ' ,0.00;- ,0.00'
          Kind = skSum
        end>
      DataController.Summary.SummaryGroups = <>
      NewItemRow.InfoText = 'Clique aqui para incluir'
      OptionsBehavior.CopyCaptionsToClipboard = False
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.FocusFirstCellOnNewRecord = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.CopyPreviewToClipboard = False
      OptionsData.DeletingConfirmation = False
      OptionsView.NoDataToDisplayInfoText = '<nenhuma informa'#231#227'o disponivel>'
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      object cxGrid1DBTableView1RecId: TcxGridDBColumn
        DataBinding.FieldName = 'RecId'
        Visible = False
        HeaderAlignmentHorz = taCenter
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1COD_EXTRAVIO: TcxGridDBColumn
        DataBinding.FieldName = 'COD_EXTRAVIO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1NUM_NOSSONUMERO: TcxGridDBColumn
        Caption = 'Nosso N'#250'mero'
        DataBinding.FieldName = 'NUM_NOSSONUMERO'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.IgnoreMaskBlank = True
        Properties.MaskKind = emkRegExpr
        Properties.EditMask = '\d\d\d\d\d\d\d\d\d\d\d'
        Properties.ReadOnly = True
        Properties.OnValidate = cxGrid1DBTableView1NUM_NOSSONUMEROPropertiesValidate
        HeaderAlignmentHorz = taCenter
        Width = 108
      end
      object cxGrid1DBTableView1DAT_EXTRAVIO: TcxGridDBColumn
        Caption = 'Data do Extravio'
        DataBinding.FieldName = 'DAT_EXTRAVIO'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.ReadOnly = False
        Properties.SaveTime = False
        Properties.ShowTime = False
        Properties.OnValidate = cxGrid1DBTableView1DAT_EXTRAVIOPropertiesValidate
        HeaderAlignmentHorz = taCenter
        Width = 73
      end
      object cxGrid1DBTableView1COD_ENTREGADOR: TcxGridDBColumn
        Caption = 'Entregador'
        DataBinding.FieldName = 'COD_ENTREGADOR'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'COD_ENTREGADOR'
        Properties.ListColumns = <
          item
            Caption = 'C'#242'digo'
            HeaderAlignment = taCenter
            SortOrder = soAscending
            FieldName = 'COD_ENTREGADOR'
          end
          item
            Caption = 'Nome'
            HeaderAlignment = taCenter
            FieldName = 'NOM_FANTASIA'
          end>
        Properties.ListFieldIndex = 1
        Properties.ListSource = dsEntregadores
        Properties.OnValidate = cxGrid1DBTableView1COD_ENTREGADORPropertiesValidate
        HeaderAlignmentHorz = taCenter
        Width = 194
      end
      object cxGrid1DBTableView1COD_AGENTE: TcxGridDBColumn
        Caption = 'Base'
        DataBinding.FieldName = 'COD_AGENTE'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.IgnoreMaskBlank = True
        Properties.MaskKind = emkRegExpr
        Properties.EditMask = '\d\d\d\d\d\d'
        Properties.OnValidate = cxGrid1DBTableView1COD_ADMPropertiesValidate
        HeaderAlignmentHorz = taCenter
        Width = 64
      end
      object cxGrid1DBTableView1DES_EXTRAVIO: TcxGridDBColumn
        Caption = 'Motivo do Extravio'
        DataBinding.FieldName = 'DES_EXTRAVIO'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Items.Strings = (
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
          'MULTA POR PROTOCOLO RASURADO/INCORRETO'
          'EXTRAVIO NA IDA - TFO')
        Properties.ReadOnly = False
        Properties.OnValidate = cxGrid1DBTableView1DES_MOTIVOPropertiesValidate
        HeaderAlignmentHorz = taCenter
        Width = 135
      end
      object cxGrid1DBTableView1VAL_PRODUTO: TcxGridDBColumn
        Caption = 'Valor do Extravio'
        DataBinding.FieldName = 'VAL_PRODUTO'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ' ,0.00;- ,0.00'
        Properties.ReadOnly = False
        HeaderAlignmentHorz = taCenter
        Width = 80
      end
      object cxGrid1DBTableView1VAL_MULTA: TcxGridDBColumn
        Caption = 'Multa'
        DataBinding.FieldName = 'VAL_MULTA'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ' ,0.00;- ,0.00'
        Properties.ReadOnly = False
        HeaderAlignmentHorz = taCenter
        Width = 75
      end
      object cxGrid1DBTableView1VAL_VERBA: TcxGridDBColumn
        Caption = 'Verba'
        DataBinding.FieldName = 'VAL_VERBA'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ' ,0.00;- ,0.00'
        Properties.ReadOnly = True
        Visible = False
        HeaderAlignmentHorz = taCenter
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
        Width = 20
      end
      object cxGrid1DBTableView1VAL_TOTAL: TcxGridDBColumn
        Caption = 'Total'
        DataBinding.FieldName = 'VAL_TOTAL'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ' ,0.00;- ,0.00'
        Properties.ReadOnly = True
        Visible = False
        HeaderAlignmentHorz = taCenter
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
        Width = 20
      end
      object cxGrid1DBTableView1DOM_RESTRICAO: TcxGridDBColumn
        DataBinding.FieldName = 'DOM_RESTRICAO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1NOM_EXECUTOR: TcxGridDBColumn
        DataBinding.FieldName = 'NOM_EXECUTOR'
        Visible = False
        HeaderAlignmentHorz = taCenter
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
        Width = 30
      end
      object cxGrid1DBTableView1DAT_MANUTENCAO: TcxGridDBColumn
        DataBinding.FieldName = 'DAT_MANUTENCAO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
        Width = 29
      end
      object cxGrid1DBTableView1COD_TIPO: TcxGridDBColumn
        DataBinding.FieldName = 'COD_TIPO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
        Width = 20
      end
      object cxGrid1DBTableView1VAL_EXTRATO_FRANQUIA: TcxGridDBColumn
        DataBinding.FieldName = 'VAL_EXTRATO_FRANQUIA'
        Visible = False
        HeaderAlignmentHorz = taCenter
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
        Width = 20
      end
      object cxGrid1DBTableView1DES_ENVIO_CORRESPONDENCIA: TcxGridDBColumn
        Caption = 'Envio Correspond'#234'ncia'
        DataBinding.FieldName = 'DES_ENVIO_CORRESPONDENCIA'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Items.Strings = (
          'ENVIADA'
          'N'#195'O ENVIADA')
        Properties.ReadOnly = False
        Properties.OnValidate = cxGrid1DBTableView1DES_ENVIO_CORRESPONDENCIAPropertiesValidate
        HeaderAlignmentHorz = taCenter
        Width = 222
      end
      object cxGrid1DBTableView1DES_RETORNO_CORRESPONDENCIA: TcxGridDBColumn
        Caption = 'Retorno Correspond'#234'ncia'
        DataBinding.FieldName = 'DES_RETORNO_CORRESPONDENCIA'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Items.Strings = (
          'DEVOLVIDA POR MALOTE INTERNO'
          'N'#195'O FOI DEVOLVIDA'
          'DEVOLVIDA POR CORREIO'
          'DEVOLVIDA PESSOALMENTE'
          'DEVOLVIDA DIGITALIZADA POR E-MAIL')
        Properties.ReadOnly = False
        Properties.OnValidate = cxGrid1DBTableView1DES_RETORNO_CORRESPONDENCIAPropertiesValidate
        HeaderAlignmentHorz = taCenter
        Width = 107
      end
      object cxGrid1DBTableView1DES_OBSERVACOES: TcxGridDBColumn
        Caption = 'Obs.'
        DataBinding.FieldName = 'DES_OBSERVACOES'
        PropertiesClassName = 'TcxBlobEditProperties'
        Properties.BlobEditKind = bekMemo
        Properties.ImmediateDropDownWhenActivated = False
        HeaderAlignmentHorz = taCenter
        Width = 48
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object cxButton1: TcxButton
    Left = 3
    Top = 449
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Action = actExtraviosProdutosIncluir
    Anchors = [akLeft, akBottom]
    TabOrder = 2
  end
  object cxButton2: TcxButton
    Left = 84
    Top = 449
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Action = actExtraviosProdutosEstornar
    Anchors = [akLeft, akBottom]
    TabOrder = 3
  end
  object cxButton3: TcxButton
    Left = 246
    Top = 449
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Action = actExtraviosProdutosGravar
    Anchors = [akLeft, akBottom]
    TabOrder = 5
  end
  object cxButton4: TcxButton
    Left = 1036
    Top = 449
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Action = actExtraviosProdutosSair
    Anchors = [akRight, akBottom]
    TabOrder = 9
  end
  object cxButton5: TcxButton
    Left = 165
    Top = 449
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Action = actExtraviosProdutosLocalizar
    Anchors = [akLeft, akBottom]
    TabOrder = 4
  end
  object dxStatusBar1: TdxStatusBar
    Left = 0
    Top = 480
    Width = 1114
    Height = 26
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarContainerPanelStyle'
        PanelStyle.Container = dxStatusBar1Container0
      end>
    PaintStyle = stpsUseLookAndFeel
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    object dxStatusBar1Container0: TdxStatusBarContainerControl
      Left = 3
      Top = 4
      Width = 1072
      Height = 19
      object cxProgressBar: TcxProgressBar
        Left = 0
        Top = 0
        Align = alClient
        AutoSize = False
        Properties.BarStyle = cxbsLEDs
        Properties.ShowTextStyle = cxtsText
        TabOrder = 0
        Height = 19
        Width = 1072
      end
    end
  end
  object cxButton6: TcxButton
    Left = 327
    Top = 449
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Action = actExtraviosProdutosExportar
    Anchors = [akLeft, akBottom]
    TabOrder = 6
  end
  object cxButton7: TcxButton
    Left = 408
    Top = 449
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Action = actExtraviosProdutosCancelar
    Anchors = [akLeft, akBottom]
    TabOrder = 7
  end
  object cxButton8: TcxButton
    Left = 489
    Top = 449
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Action = actExtraviosProdutosEditar
    Anchors = [akLeft, akBottom]
    TabOrder = 8
  end
  object cxButton9: TcxButton
    Left = 570
    Top = 449
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Action = actExtraviosProdutosImportar
    Anchors = [akLeft, akBottom]
    TabOrder = 11
  end
  object cxButton10: TcxButton
    Left = 651
    Top = 449
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Action = actExtraviosProdutosFiltrar
    Anchors = [akLeft, akBottom]
    TabOrder = 12
  end
  object dsExtravios: TDataSource
    AutoEdit = False
    DataSet = tbExtravios
    Left = 504
    Top = 16
  end
  object aclExtraviosProdutos: TActionList
    Images = dm.cxImageList1
    Left = 976
    Top = 8
    object actExtravioProdutosListaEntregadores: TAction
      Tag = 3
      Category = 'Extravio de Produtos'
      Caption = 'Lista de Entregadores'
      Hint = 'List de Entregadores'
      ImageIndex = 11
      ShortCut = 120
    end
    object actExtraviosProdutosIncluir: TAction
      Tag = 3
      Category = 'Extravio de Produtos'
      Caption = '&Incluir'
      Hint = 'Incluir Extravio'
      ImageIndex = 1
      ShortCut = 113
      OnExecute = actExtraviosProdutosIncluirExecute
    end
    object actExtraviosProdutosEstornar: TAction
      Category = 'Extravio de Produtos'
      Caption = '&Estornar'
      Hint = 'Extornar Extravio'
      ImageIndex = 8
      ShortCut = 32883
      OnExecute = actExtraviosProdutosEstornarExecute
    end
    object actExtraviosProdutosGravar: TAction
      Tag = 3
      Category = 'Extravio de Produtos'
      Caption = '&Gravar'
      Hint = 'Gravar Extravio'
      ImageIndex = 9
      ShortCut = 116
      OnExecute = actExtraviosProdutosGravarExecute
    end
    object actExtraviosProdutosSair: TAction
      Tag = 3
      Category = 'Extravio de Produtos'
      Caption = '&Sair'
      Hint = 'Sair da Tela'
      ImageIndex = 10
      OnExecute = actExtraviosProdutosSairExecute
    end
    object actExtraviosProdutosLocalizar: TAction
      Tag = 3
      Category = 'Extravio de Produtos'
      Caption = '&Localizar'
      Hint = 'Localizar Extravios'
      ImageIndex = 18
      ShortCut = 119
      OnExecute = actExtraviosProdutosLocalizarExecute
    end
    object actExtraviosProdutosCancelar: TAction
      Tag = 3
      Category = 'Extravio de Produtos'
      Caption = 'Cancelar'
      Hint = 'Cancelar Opera'#231#227'o Atual'
      ImageIndex = 6
      OnExecute = actExtraviosProdutosCancelarExecute
    end
    object actExtraviosProdutosExportar: TAction
      Tag = 2
      Category = 'Extravio de Produtos'
      Caption = 'E&xportar'
      Hint = 'Exportar dados da grade'
      ImageIndex = 29
      ShortCut = 32884
      OnExecute = actExtraviosProdutosExportarExecute
    end
    object actExtraviosProdutosEditar: TAction
      Category = 'Extravio de Produtos'
      Caption = 'E&ditar'
      Hint = 'Editar Dados'
      ImageIndex = 14
      ShortCut = 114
      OnExecute = actExtraviosProdutosEditarExecute
    end
    object actExtraviosProdutosAgentes: TAction
      Category = 'Extravio de Produtos'
      Caption = 'Lista Adm. CEP'
      Hint = 'Lista de Administradores de CEP'
      ImageIndex = 11
      OnExecute = actExtraviosProdutosAgentesExecute
    end
    object actExtraviosProdutosImportar: TAction
      Category = 'Extravio de Produtos'
      Caption = 'I&mportar'
      Hint = 'Importar Planilha de Extravios (Roubos)'
      ImageIndex = 33
      OnExecute = actExtraviosProdutosImportarExecute
    end
    object actExtraviosProdutosFiltrar: TAction
      Category = 'Extravio de Produtos'
      Caption = 'Filtro'
      ImageIndex = 67
      OnExecute = actExtraviosProdutosFiltrarExecute
    end
  end
  object SaveDialog: TSaveDialog
    Left = 1024
    Top = 8
  end
  object tbEntregadores: TdxMemData
    Indexes = <>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F0A0000000400000003000D00434F445F4341444153
      54524F000400000003000F00434F445F454E5452454741444F52004600000014
      000D004E4F4D5F46414E5441534941000400000003000B00434F445F4147454E
      5445000400000009000B004441545F434F4449474F004600000014000A004445
      535F4348415645000400000003000A00434F445F475255504F00080000000600
      0A0056414C5F5645524241001400000014000F004E4F4D5F455845435554414E
      544500080000000B000F004441545F4D414E5554454E43414F00}
    SortOptions = []
    Left = 600
    Top = 16
    object tbEntregadoresCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
    end
    object tbEntregadoresCOD_ENTREGADOR: TIntegerField
      FieldName = 'COD_ENTREGADOR'
    end
    object tbEntregadoresNOM_FANTASIA: TWideStringField
      FieldName = 'NOM_FANTASIA'
      Size = 70
    end
    object tbEntregadoresCOD_AGENTE: TIntegerField
      FieldName = 'COD_AGENTE'
    end
    object tbEntregadoresDAT_CODIGO: TDateField
      FieldName = 'DAT_CODIGO'
    end
    object tbEntregadoresDES_CHAVE: TWideStringField
      FieldName = 'DES_CHAVE'
      Size = 70
    end
    object tbEntregadoresCOD_GRUPO: TIntegerField
      FieldName = 'COD_GRUPO'
    end
    object tbEntregadoresVAL_VERBA: TFloatField
      FieldName = 'VAL_VERBA'
    end
    object tbEntregadoresNOM_EXECUTANTE: TWideStringField
      FieldName = 'NOM_EXECUTANTE'
    end
    object tbEntregadoresDAT_MANUTENCAO: TDateTimeField
      FieldName = 'DAT_MANUTENCAO'
    end
  end
  object tbExtravios: TdxMemData
    Indexes = <>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F130000000400000003000D00434F445F4558545241
      56494F009600000014000D004445535F455854524156494F0014000000140010
      004E554D5F4E4F53534F4E554D45524F000400000003000B00434F445F414745
      4E5445000800000006000C0056414C5F50524F4455544F000400000009000D00
      4441545F455854524156494F000800000006000A0056414C5F4D554C54410008
      00000006000A0056414C5F5645524241000800000006000A0056414C5F544F54
      414C000100000014000E00444F4D5F52455354524943414F000400000003000F
      00434F445F454E5452454741444F52001400000014000D004E4F4D5F45584543
      55544F5200080000000B000F004441545F4D414E5554454E43414F0004000000
      03000900434F445F5449504F00080000000600150056414C5F4558545241544F
      5F4652414E51554941000100000014001500444F4D5F4558545241544F5F4652
      414E51554941001400000014001A004445535F454E56494F5F434F5252455350
      4F4E44454E434941004600000014001C004445535F5245544F524E4F5F434F52
      524553504F4E44454E4349410000000000190010004445535F4F425345525641
      434F455300}
    SortOptions = []
    Left = 536
    Top = 16
    object tbExtraviosCOD_EXTRAVIO: TIntegerField
      FieldName = 'COD_EXTRAVIO'
    end
    object tbExtraviosDES_EXTRAVIO: TWideStringField
      FieldName = 'DES_EXTRAVIO'
      Size = 150
    end
    object tbExtraviosNUM_NOSSONUMERO: TWideStringField
      FieldName = 'NUM_NOSSONUMERO'
    end
    object tbExtraviosCOD_AGENTE: TIntegerField
      FieldName = 'COD_AGENTE'
    end
    object tbExtraviosVAL_PRODUTO: TFloatField
      FieldName = 'VAL_PRODUTO'
    end
    object tbExtraviosDAT_EXTRAVIO: TDateField
      FieldName = 'DAT_EXTRAVIO'
    end
    object tbExtraviosVAL_MULTA: TFloatField
      FieldName = 'VAL_MULTA'
    end
    object tbExtraviosVAL_VERBA: TFloatField
      FieldName = 'VAL_VERBA'
    end
    object tbExtraviosVAL_TOTAL: TFloatField
      FieldName = 'VAL_TOTAL'
    end
    object tbExtraviosDOM_RESTRICAO: TWideStringField
      FieldName = 'DOM_RESTRICAO'
      Size = 1
    end
    object tbExtraviosCOD_ENTREGADOR: TIntegerField
      FieldName = 'COD_ENTREGADOR'
    end
    object tbExtraviosNOM_EXECUTOR: TWideStringField
      FieldName = 'NOM_EXECUTOR'
    end
    object tbExtraviosDAT_MANUTENCAO: TDateTimeField
      FieldName = 'DAT_MANUTENCAO'
    end
    object tbExtraviosCOD_TIPO: TIntegerField
      FieldName = 'COD_TIPO'
    end
    object tbExtraviosVAL_EXTRATO_FRANQUIA: TFloatField
      FieldName = 'VAL_EXTRATO_FRANQUIA'
    end
    object tbExtraviosDOM_EXTRATO_FRANQUIA: TWideStringField
      FieldName = 'DOM_EXTRATO_FRANQUIA'
      Size = 1
    end
    object tbExtraviosDES_ENVIO_CORRESPONDENCIA: TWideStringField
      FieldName = 'DES_ENVIO_CORRESPONDENCIA'
    end
    object tbExtraviosDES_RETORNO_CORRESPONDENCIA: TWideStringField
      FieldName = 'DES_RETORNO_CORRESPONDENCIA'
      Size = 70
    end
    object tbExtraviosDES_OBSERVACOES: TWideMemoField
      FieldName = 'DES_OBSERVACOES'
      BlobType = ftWideMemo
    end
  end
  object dsEntregadores: TDataSource
    AutoEdit = False
    DataSet = tbEntregadores
    Left = 568
    Top = 16
  end
end
