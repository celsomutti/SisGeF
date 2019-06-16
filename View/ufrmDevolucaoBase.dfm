object frmDevolucaoBase: TfrmDevolucaoBase
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Devolu'#231#227'o de Produtos'
  ClientHeight = 543
  ClientWidth = 1095
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
    1095
    543)
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 47
    Align = alTop
    Caption = 'Expedi'#231#227'o'
    TabOrder = 0
    DesignSize = (
      1089
      63)
    Height = 70
    Width = 1089
    object cxButton2: TcxButton
      Left = 331
      Top = 24
      Width = 107
      Height = 25
      Cursor = crHandPoint
      Action = actDevolucoesAbrirContainer
      TabOrder = 1
    end
    object cxButton4: TcxButton
      Left = 444
      Top = 24
      Width = 117
      Height = 25
      Cursor = crHandPoint
      Action = actDevolucoesReabrirContainer
      TabOrder = 3
    end
    object cxLabel2: TcxLabel
      Left = 684
      Top = 17
      Caption = 'N'#186'. Lacre'
      Transparent = True
    end
    object cxButton1: TcxButton
      Left = 963
      Top = 24
      Width = 107
      Height = 25
      Cursor = crHandPoint
      Action = actDevolucoesCancelar
      Anchors = [akTop, akRight]
      TabOrder = 4
    end
    object cxLacre: TcxTextEdit
      Left = 684
      Top = 32
      Hint = 'N'#250'mero do Lacre ou Protocolo'
      TabStop = False
      ParentFont = False
      Properties.ReadOnly = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      TabOrder = 0
      Width = 150
    end
    object cxLabel4: TcxLabel
      Left = 16
      Top = 17
      Caption = 'Base:'
      Transparent = True
      Visible = False
    end
    object cxCodAdmCEP: TcxButtonEdit
      Left = 16
      Top = 31
      Hint = 'C'#243'digo do Administrador do CEP'
      Properties.Alignment.Horz = taRightJustify
      Properties.Buttons = <
        item
          Action = actDevolucoesBases
          Default = True
          Kind = bkGlyph
        end>
      Properties.IgnoreMaskBlank = True
      Properties.Images = dm.cxImageList1
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d\d\d\d\d\d'
      Properties.OnValidate = cxCodAdmCEPPropertiesValidate
      TabOrder = 6
      Visible = False
      Width = 70
    end
    object cxNomeAdmCEP: TcxTextEdit
      Left = 92
      Top = 32
      Hint = 'Nome Fantasia ou Apelido do Administrador do CEP'
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 0
      Properties.ReadOnly = True
      TabOrder = 7
      Visible = False
      Width = 233
    end
  end
  object cxGroupBox3: TcxGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 123
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Container'
    TabOrder = 1
    DesignSize = (
      1089
      375)
    Height = 382
    Width = 1089
    object cxGrid1: TcxGrid
      Left = 16
      Top = 59
      Width = 1054
      Height = 128
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
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
        Navigator.Buttons.Delete.Visible = True
        Navigator.Buttons.Edit.Visible = False
        Navigator.Buttons.Post.Visible = False
        Navigator.Buttons.Cancel.Hint = 'Cancelar Opera'#231#227'o'
        Navigator.Buttons.Cancel.ImageIndex = 6
        Navigator.Buttons.Cancel.Visible = False
        Navigator.Buttons.Refresh.Visible = False
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.Buttons.GotoBookmark.Visible = False
        Navigator.Buttons.Filter.Visible = False
        Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
        Navigator.InfoPanel.Visible = True
        Navigator.Visible = True
        DataController.DataSource = ds
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0.000;- ,0.000'
            Kind = skSum
            Column = cxGrid1DBTableView1QTD_PESO_OBJETO
          end>
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
        OptionsData.Inserting = False
        OptionsSelection.InvertSelect = False
        OptionsSelection.MultiSelect = True
        OptionsSelection.CellMultiSelect = True
        OptionsView.NoDataToDisplayInfoText = 'Nenhuma Informa'#231#227'o Dispon'#237'vel'
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        object cxGrid1DBTableView1DAT_EXPEDICAO: TcxGridDBColumn
          Caption = 'Expedi'#231#227'o'
          DataBinding.FieldName = 'DAT_EXPEDICAO'
          HeaderAlignmentHorz = taCenter
          Width = 87
        end
        object cxGrid1DBTableView1NUM_NOSSONUMERO: TcxGridDBColumn
          Caption = 'Nosso N'#250'mero'
          DataBinding.FieldName = 'NUM_NOSSONUMERO'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.IgnoreMaskBlank = True
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d\d\d\d\d\d\d\d\d\d\d'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 102
        end
        object cxGrid1DBTableView1QTD_PESO_OBJETO: TcxGridDBColumn
          Caption = 'Peso'
          DataBinding.FieldName = 'QTD_PESO_OBJETO'
          PropertiesClassName = 'TcxCalcEditProperties'
          Properties.DisplayFormat = '0.000;- 0.000'
          Properties.ReadOnly = True
          GroupSummaryAlignment = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 63
        end
        object cxGrid1DBTableView1QTD_VOLUMES: TcxGridDBColumn
          Caption = 'Vol. N'#186'.'
          DataBinding.FieldName = 'QTD_VOLUMES'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.IgnoreMaskBlank = True
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d\d\d\d\d'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 66
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
          Width = 159
        end
        object cxGrid1DBTableView1CD_STATUS_CONTAINER: TcxGridDBColumn
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
          Width = 176
        end
        object cxGrid1DBTableView1NUM_LACRE: TcxGridDBColumn
          Caption = 'N'#186'. Lacre'
          DataBinding.FieldName = 'NUM_LACRE'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 86
        end
        object cxGrid1DBTableView1DES_DEVOLUCAO: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'DES_DEVOLUCAO'
          HeaderAlignmentHorz = taCenter
          Width = 190
        end
        object cxGrid1DBTableView1DOM_DESCOBERTO: TcxGridDBColumn
          DataBinding.FieldName = 'DOM_DESCOBERTO'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Images = dm.cxImageList1
          Properties.Items = <
            item
              Description = 'COBERTO'
              ImageIndex = 72
              Value = 'N'
            end
            item
              Description = 'DESCOBERTO'
              ImageIndex = 73
              Value = 'S'
            end>
          HeaderAlignmentHorz = taCenter
          Width = 123
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
    object chkTFO: TcxCheckBox
      Left = 16
      Top = 34
      Hint = 'Selecione se a etiqueta do objeto '#233' da Transfolha'
      TabStop = False
      Caption = 'Etiqueta &TFO'
      State = cbsChecked
      TabOrder = 1
      Transparent = True
    end
    object cxNossoNumero: TcxMaskEdit
      Left = 153
      Top = 32
      Hint = 'Nosso N'#250'mero'
      Properties.Alignment.Horz = taRightJustify
      Properties.IgnoreMaskBlank = True
      Properties.MaskKind = emkRegExpr
      Properties.ReadOnly = True
      Style.Edges = [bLeft, bTop, bRight, bBottom]
      Style.HotTrack = True
      Style.Shadow = False
      Style.TransparentBorder = True
      StyleDisabled.BorderStyle = ebsOffice11
      TabOrder = 2
      OnExit = cxNossoNumeroExit
      OnKeyPress = cxNossoNumeroKeyPress
      Width = 153
    end
    object cxLabel3: TcxLabel
      Left = 153
      Top = 16
      Caption = 'Nosso N'#250'mero'
      Transparent = True
    end
    object cxButton3: TcxButton
      Left = 963
      Top = 332
      Width = 107
      Height = 25
      Cursor = crHandPoint
      Action = actDevolucoesFecharContainer
      Anchors = [akLeft, akBottom]
      TabOrder = 4
    end
    object cxProtocolo: TcxCheckBox
      Left = 16
      Top = 353
      Hint = 'Selecione para gerar e imprimir o protocolo de devolu'#231#227'o'
      TabStop = False
      Caption = 'Imprimir Protocolo'
      State = cbsChecked
      TabOrder = 5
      Transparent = True
    end
  end
  object cxButton5: TcxButton
    Left = 966
    Top = 511
    Width = 107
    Height = 25
    Cursor = crHandPoint
    Action = actDevolucoesSair
    Anchors = [akRight, akBottom]
    TabOrder = 2
  end
  object cxLabel27: TcxLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alTop
    AutoSize = False
    Caption = 'Devolu'#231#227'o de Produtos'
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
    Width = 1089
    AnchorY = 22
  end
  object cxButton7: TcxButton
    Left = 136
    Top = 469
    Width = 113
    Height = 25
    Action = actDevolucoesProtocolo
    TabOrder = 3
  end
  object aclDevolucao: TActionList
    Images = dm.cxImageList1
    Left = 672
    Top = 8
    object actDevolucaoProcessar: TAction
      Tag = 4
      Category = 'Devolu'#231#245'es'
      Caption = 'Processar'
      Hint = 'Processar Expedi'#231#227'o'
      ImageIndex = 27
      OnExecute = actDevolucaoProcessarExecute
    end
    object actDevolucoesAbrirContainer: TAction
      Tag = 4
      Category = 'Devolu'#231#245'es'
      Caption = 'Abrir Container'
      Hint = 'Abrir Container'
      ImageIndex = 23
      OnExecute = actDevolucoesAbrirContainerExecute
    end
    object actDevolucoesFecharContainer: TAction
      Tag = 4
      Category = 'Devolu'#231#245'es'
      Caption = 'Fechar'
      Enabled = False
      Hint = 'Fechar Container'
      ImageIndex = 53
      OnExecute = actDevolucoesFecharContainerExecute
    end
    object actDevolucoesReabrirContainer: TAction
      Tag = 4
      Category = 'Devolu'#231#245'es'
      Caption = 'Reabrir Container'
      Hint = 'Reabir Container'
      ImageIndex = 21
      OnExecute = actDevolucoesReabrirContainerExecute
    end
    object actDevolucoesSair: TAction
      Tag = 99
      Category = 'Devolu'#231#245'es'
      Caption = 'Sair'
      Hint = 'Sair da tela'
      ImageIndex = 10
      OnExecute = actDevolucoesSairExecute
    end
    object actDevolucoesCancelar: TAction
      Tag = 99
      Category = 'Devolu'#231#245'es'
      Caption = 'Cancelar'
      Enabled = False
      Hint = 'Cancelar Procedimento'
      ImageIndex = 6
      OnExecute = actDevolucoesCancelarExecute
    end
    object actDevolucoesDescoberto: TAction
      Tag = 4
      Category = 'Devolu'#231#245'es'
      Caption = 'Objeto Descoberto'
      Hint = 'Devolu'#231#227'o de Objetos Descobertos'
      ImageIndex = 54
      OnExecute = actDevolucoesDescobertoExecute
    end
    object actDevolucoesListar: TAction
      Tag = 4
      Category = 'Devolu'#231#245'es'
      Caption = 'Listar'
      Hint = 'Listar Expectativas'
      ImageIndex = 28
      OnExecute = actDevolucoesListarExecute
    end
    object actDevolucoesBases: TAction
      Category = 'Devolu'#231#245'es'
      Caption = 'Bases'
      Hint = 'Lista de Bases'
      ImageIndex = 11
      OnExecute = actDevolucoesBasesExecute
    end
    object actDevolucoesProtocolo: TAction
      Tag = 4
      Category = 'Devolu'#231#245'es'
      Caption = 'Protocolo'
      Hint = 'Imprimir Protocolo'
      ImageIndex = 15
      OnExecute = actDevolucoesProtocoloExecute
    end
  end
  object tbDevolucoes: TdxMemData
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
    Left = 592
    Top = 8
    object tbDevolucoesNUM_NOSSONUMERO: TStringField
      FieldName = 'NUM_NOSSONUMERO'
      Size = 11
    end
    object tbDevolucoesQTD_VOLUMES: TIntegerField
      FieldName = 'QTD_VOLUMES'
      Required = True
    end
    object tbDevolucoesCOD_STATUS_OBJETO: TIntegerField
      FieldName = 'COD_STATUS_OBJETO'
    end
    object tbDevolucoesCOD_STATUS_CONTAINER: TIntegerField
      FieldName = 'COD_STATUS_CONTAINER'
    end
    object tbDevolucoesQTD_PESO_OBJETO: TFloatField
      FieldName = 'QTD_PESO_OBJETO'
    end
    object tbDevolucoesNUM_LACRE: TStringField
      FieldName = 'NUM_LACRE'
      Size = 9
    end
    object tbDevolucoesCOD_BASE: TIntegerField
      FieldName = 'COD_BASE'
    end
    object tbDevolucoesDES_DEVOLUCAO: TStringField
      FieldName = 'DES_DEVOLUCAO'
      Size = 30
    end
    object tbDevolucoesDAT_EXPEDICAO: TDateField
      FieldName = 'DAT_EXPEDICAO'
    end
    object tbDevolucoesDES_CHAVE: TStringField
      FieldName = 'DES_CHAVE'
    end
    object tbDevolucoesNUM_PROTOCOLO: TStringField
      FieldName = 'NUM_PROTOCOLO'
      Size = 15
    end
    object tbDevolucoesDOM_DESCOBERTO: TStringField
      DisplayLabel = 'Descoberto'
      FieldName = 'DOM_DESCOBERTO'
      Size = 1
    end
  end
  object ds: TDataSource
    DataSet = tbDevolucoes
    Left = 632
    Top = 8
  end
end
