object view_ManutencaoRepartesVA: Tview_ManutencaoRepartesVA
  Left = 0
  Top = 0
  Caption = 'Manuten'#231#227'o de Repartes'
  ClientHeight = 666
  ClientWidth = 1085
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  ShowHint = True
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lcRepartes: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 1085
    Height = 666
    Align = alClient
    TabOrder = 0
    LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
    object lblTitulo: TcxLabel
      Left = 10
      Top = 10
      Caption = 'Manuten'#231#227'o de Repartes'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -19
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.IsFontAssigned = True
      Transparent = True
    end
    object lcbNomeDistribuidor: TcxLookupComboBox
      Left = 10000
      Top = 10000
      Hint = 'Nome do distribuidor'
      ParentFont = False
      Properties.GridMode = True
      Properties.KeyFieldNames = 'COD_DISTRIBUIDOR'
      Properties.ListColumns = <
        item
          Caption = 'C'#243'digo'
          Fixed = True
          HeaderAlignment = taCenter
          FieldName = 'COD_DISTRIBUIDOR'
        end
        item
          Caption = 'Nome'
          HeaderAlignment = taCenter
          FieldName = 'NOM_DISTRIBUIDOR'
        end>
      Properties.ListFieldIndex = 1
      Properties.ListSource = dsDistribuidor
      Properties.OnValidate = lcbNomeDistribuidorPropertiesValidate
      EditValue = 0
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 7
      Visible = False
      Width = 242
    end
    object mskCodigoBanca: TcxMaskEdit
      Left = 10000
      Top = 10000
      Hint = 'C'#243'digo da Banca'
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.IgnoreMaskBlank = True
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d\d\d\d\d\d'
      Properties.OnValidate = mskCodigoBancaPropertiesValidate
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 8
      Text = '0'
      Visible = False
      Width = 74
    end
    object lcbNomeBanca: TcxLookupComboBox
      Left = 10000
      Top = 10000
      Hint = 'Nome da Banca'
      ParentFont = False
      Properties.KeyFieldNames = 'COD_BANCA'
      Properties.ListColumns = <
        item
          Caption = 'C'#243'digo'
          Fixed = True
          HeaderAlignment = taCenter
          FieldName = 'COD_BANCA'
        end
        item
          Caption = 'Nome'
          HeaderAlignment = taCenter
          FieldName = 'NOM_BANCA'
        end>
      Properties.ListFieldIndex = 1
      Properties.ListSource = dsBancas
      Properties.OnChange = lcbNomeBancaPropertiesChange
      EditValue = 0
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 9
      Visible = False
      Width = 290
    end
    object cbotipodata: TcxComboBox
      Left = 10000
      Top = 10000
      Hint = 'Tipo de Data'
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'REMESSA'
        'DEVOLU'#199#195'O')
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 10
      Text = 'REMESSA'
      Visible = False
      Width = 98
    end
    object datData: TcxDateEdit
      Left = 10000
      Top = 10000
      Hint = 'Data da remessa ou devolu'#231#227'o'
      ParentFont = False
      Properties.DateButtons = [btnClear, btnNow, btnToday]
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 11
      Visible = False
      Width = 98
    end
    object sbRepartes: TdxStatusBar
      Left = 10
      Top = 636
      Width = 0
      Height = 20
      Panels = <
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Fixed = False
        end
        item
          PanelStyleClassName = 'TdxStatusBarContainerPanelStyle'
          PanelStyle.Container = sbRepartesContainer1
          Bevel = dxpbNone
          Width = 250
        end>
      PaintStyle = stpsUseLookAndFeel
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      object sbRepartesContainer1: TdxStatusBarContainerControl
        Left = 24
        Top = 2
        Width = 252
        Height = 17
        object pbRepartes: TcxProgressBar
          Left = 0
          Top = 0
          Align = alClient
          TabOrder = 0
          Visible = False
          Width = 252
        end
      end
    end
    object btnProcessar: TcxButton
      Left = 10000
      Top = 10000
      Width = 75
      Height = 25
      Action = actProcessar
      TabOrder = 12
      Visible = False
    end
    object mskCodigoDistribuidor: TcxMaskEdit
      Left = 10000
      Top = 10000
      Hint = 'C'#243'digo do distribuidor'
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.IgnoreMaskBlank = True
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d\d\d\d\d\d'
      Properties.OnValidate = mskCodigoDistribuidorPropertiesValidate
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 6
      Text = '0'
      Visible = False
      Width = 93
    end
    object grdRepartes: TcxGrid
      Left = 10000
      Top = 10000
      Width = 1021
      Height = 358
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      PopupMenu = pmRepartes
      TabOrder = 13
      Visible = False
      object tvRepartes: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsRepartes
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <
          item
            Links = <
              item
                Column = tvRepartesCOD_DISTRIBUIDOR
              end
              item
                Column = tvRepartesCOD_PRODUTO
              end>
            SummaryItems = <
              item
                Format = ',0;-,0'
                Kind = skSum
                Column = tvRepartesQTD_REMESSA
              end>
          end>
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsCustomize.ColumnGrouping = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        object tvRepartesRecId: TcxGridDBColumn
          DataBinding.FieldName = 'RecId'
          Visible = False
        end
        object tvRepartesID_REMESSA: TcxGridDBColumn
          Caption = 'ID'
          DataBinding.FieldName = 'ID_REMESSAS'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.IgnoreMaskBlank = True
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d\d\d\d\d\d'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 38
        end
        object tvRepartesCOD_DISTRIBUIDOR: TcxGridDBColumn
          DataBinding.FieldName = 'COD_DISTRIBUIDOR'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d\d\d\d\d\d'
          Properties.ReadOnly = True
          Visible = False
        end
        object tvRepartesNOM_DISTRIBUIDOR: TcxGridDBColumn
          Caption = 'Distribuidor'
          DataBinding.FieldName = 'COD_DISTRIBUIDOR'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'COD_DISTRIBUIDOR'
          Properties.ListColumns = <
            item
              FieldName = 'NOM_DISTRIBUIDOR'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dsDistribuidor
          Properties.ReadOnly = True
          Visible = False
          GroupIndex = 0
          HeaderAlignmentHorz = taCenter
          Width = 243
        end
        object tvRepartesCOD_BANCA: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'COD_BANCA'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.IgnoreMaskBlank = True
          Properties.MaskKind = emkRegExprEx
          Properties.EditMask = '\d\d\d\d\d\d'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 76
        end
        object tvRepartesNOM_BANCA: TcxGridDBColumn
          Caption = 'Nome Banca'
          DataBinding.FieldName = 'COD_BANCA'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'COD_BANCA'
          Properties.ListColumns = <
            item
              FieldName = 'NOM_BANCA'
            end>
          Properties.ListSource = dsBancas
          Properties.ReadOnly = True
          Visible = False
          FooterAlignmentHorz = taCenter
          GroupIndex = 1
          HeaderAlignmentHorz = taCenter
          Width = 201
        end
        object tvRepartesCOD_PRODUTO: TcxGridDBColumn
          Caption = 'Produto'
          DataBinding.FieldName = 'COD_PRODUTO'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 72
        end
        object tvRepartesDES_PRODUTO: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'COD_PRODUTO'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'COD_PRODUTO'
          Properties.ListColumns = <
            item
              FieldName = 'DES_PRODUTO'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dsProduto
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 190
        end
        object tvRepartesDAT_REMESSA: TcxGridDBColumn
          Caption = 'Data Remessa'
          DataBinding.FieldName = 'DAT_REMESSA'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.ReadOnly = True
          Properties.SaveTime = False
          Properties.ShowTime = False
          HeaderAlignmentHorz = taCenter
          Width = 77
        end
        object tvRepartesNUM_REMESSA: TcxGridDBColumn
          DataBinding.FieldName = 'NUM_REMESSA'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          Visible = False
        end
        object tvRepartesQTD_REMESSA: TcxGridDBColumn
          Caption = 'Qtd. Remessa'
          DataBinding.FieldName = 'QTD_REMESSA'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.;-,0.'
          HeaderAlignmentHorz = taCenter
          Width = 77
        end
        object tvRepartesDAT_RECOBERTURA: TcxGridDBColumn
          DataBinding.FieldName = 'DAT_RECOBERTURA'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.SaveTime = False
          Properties.ShowTime = False
          Visible = False
        end
        object tvRepartesQTD_RECOBERTURA: TcxGridDBColumn
          DataBinding.FieldName = 'QTD_RECOBERTURA'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.;-,0.'
          Properties.EditFormat = ',0.;-,0.'
          Properties.ReadOnly = True
          Visible = False
        end
        object tvRepartesDAT_CHAMADA: TcxGridDBColumn
          Caption = 'Data Chamada'
          DataBinding.FieldName = 'DAT_CHAMADA'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.SaveTime = False
          Properties.ShowTime = False
          HeaderAlignmentHorz = taCenter
          Width = 88
        end
        object tvRepartesNUM_DEVOLUCAO: TcxGridDBColumn
          DataBinding.FieldName = 'NUM_DEVOLUCAO'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          Visible = False
        end
        object tvRepartesQTD_ENCALHE: TcxGridDBColumn
          Caption = 'Qtd. Encalhe'
          DataBinding.FieldName = 'QTD_ENCALHE'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.;-,0.'
          Properties.EditFormat = ',0.;-,0.'
          HeaderAlignmentHorz = taCenter
          Width = 102
        end
        object tvRepartesVAL_COBRANCA: TcxGridDBColumn
          DataBinding.FieldName = 'VAL_COBRANCA'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ' ,0.00;- ,0.00'
          Properties.EditFormat = ' ,0.00;- ,0.00'
          Visible = False
        end
        object tvRepartesVAL_VENDA: TcxGridDBColumn
          DataBinding.FieldName = 'VAL_VENDA'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ' ,0.00;- ,0.00'
          Properties.EditFormat = ' ,0.00;- ,0.00'
          Visible = False
        end
        object tvRepartesDOM_INVENTARIO: TcxGridDBColumn
          Caption = 'Invent'#225'rio'
          DataBinding.FieldName = 'DOM_INVENTARIO'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.Images = dm.iml16x16
          Properties.Items = <
            item
              Description = 'Pendente'
              ImageIndex = 45
              Value = 0
            end
            item
              Description = 'Finalizado'
              ImageIndex = 3
              Value = 1
            end>
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 77
        end
      end
      object lvRepartes: TcxGridLevel
        GridView = tvRepartes
      end
    end
    object edtArquivo: TcxButtonEdit
      Left = 64
      Top = 81
      Hint = 'Selecione o arquivo a ser inportado'
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = edtArquivoPropertiesButtonClick
      Style.HotTrack = False
      TabOrder = 1
      Width = 121
    end
    object grdRemessas: TcxGrid
      Left = 22
      Top = 130
      Width = 250
      Height = 307
      TabOrder = 3
      object tvRemessas: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dm.dsImportaRemessa
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.ImmediateEditor = False
        OptionsBehavior.FocusCellOnCycle = True
        OptionsCustomize.ColumnGrouping = False
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
        OptionsView.GroupByBox = False
        object tvRemessasCOD_BANCA: TcxGridDBColumn
          Caption = 'C'#243'digo Banca'
          DataBinding.FieldName = 'COD_BANCA'
          HeaderAlignmentHorz = taCenter
        end
        object tvRemessasDAT_CIRCULACAO: TcxGridDBColumn
          Caption = 'Data Circula'#231#227'o'
          DataBinding.FieldName = 'DAT_CIRCULACAO'
          HeaderAlignmentHorz = taCenter
        end
        object tvRemessasCOD_PRODUTO: TcxGridDBColumn
          Caption = 'Sigla Produto'
          DataBinding.FieldName = 'COD_PRODUTO'
          HeaderAlignmentHorz = taCenter
        end
        object tvRemessasDES_PRODUTO: TcxGridDBColumn
          Caption = 'Descri'#231#227'o Produto'
          DataBinding.FieldName = 'DES_PRODUTO'
          HeaderAlignmentHorz = taCenter
        end
        object tvRemessasQTD_REMESSA: TcxGridDBColumn
          Caption = 'Quantidade'
          DataBinding.FieldName = 'QTD_REMESSA'
          HeaderAlignmentHorz = taCenter
        end
      end
      object lvRemessas: TcxGridLevel
        GridView = tvRemessas
      end
    end
    object btnImportarRemessa: TcxButton
      Left = 988
      Top = 81
      Width = 75
      Height = 25
      Action = actImportarRemessa
      TabOrder = 2
    end
    object btnGravarImportacao: TcxButton
      Left = 22
      Top = 562
      Width = 75
      Height = 25
      Action = actGravarImportacao
      TabOrder = 4
    end
    object btnFechar: TcxButton
      Left = 1000
      Top = 605
      Width = 75
      Height = 25
      Action = actFechar
      TabOrder = 18
    end
    object btnCancelarOperacao: TcxButton
      Left = 10000
      Top = 10000
      Width = 75
      Height = 25
      Action = actCancelarOperacao
      TabOrder = 14
      Visible = False
    end
    object btnLimparDados: TcxButton
      Left = 103
      Top = 562
      Width = 75
      Height = 25
      Action = actLimparDados
      TabOrder = 5
    end
    object btnImprimirRemessas: TcxButton
      Left = 10000
      Top = 10000
      Width = 75
      Height = 25
      Action = actImprimir
      TabOrder = 15
      Visible = False
    end
    object btnEditar: TcxButton
      Left = 10000
      Top = 10000
      Width = 75
      Height = 25
      Action = actEditar
      TabOrder = 16
      Visible = False
    end
    object btnGravar: TcxButton
      Left = 10000
      Top = 10000
      Width = 75
      Height = 25
      Action = actGravar
      TabOrder = 17
      Visible = False
    end
    object lcgRoot: TdxLayoutGroup
      AlignHorz = ahParentManaged
      AlignVert = avParentManaged
      ButtonOptions.Buttons = <>
      Hidden = True
      ItemIndex = 1
      ShowBorder = False
      Index = -1
    end
    object lciTitulo: TdxLayoutItem
      Parent = lcgRoot
      AlignVert = avTop
      CaptionOptions.Text = 'cxLabel1'
      CaptionOptions.Visible = False
      Control = lblTitulo
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lcgFiltro: TdxLayoutGroup
      Parent = lcgManutencao
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Filtro'
      ButtonOptions.Buttons = <>
      ButtonOptions.ShowExpandButton = True
      ItemIndex = 5
      LayoutDirection = ldHorizontal
      Index = 0
    end
    object lciNomeDistribuidor: TdxLayoutItem
      Parent = lcgFiltro
      AlignHorz = ahClient
      CaptionOptions.Text = 'Nome do Distribuidor'
      CaptionOptions.Layout = clTop
      Control = lcbNomeDistribuidor
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lciCodigoBanca: TdxLayoutItem
      Parent = lcgFiltro
      CaptionOptions.Text = 'C'#243'digo Banca'
      CaptionOptions.Layout = clTop
      Control = mskCodigoBanca
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object lciNomeBanca: TdxLayoutItem
      Parent = lcgFiltro
      AlignHorz = ahClient
      CaptionOptions.Text = 'Nome da Banca'
      CaptionOptions.Layout = clTop
      Control = lcbNomeBanca
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object lciTipoData: TdxLayoutItem
      Parent = lcgFiltro
      CaptionOptions.Text = 'Tipo de Data'
      CaptionOptions.Layout = clTop
      Control = cbotipodata
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object lciData: TdxLayoutItem
      Parent = lcgFiltro
      CaptionOptions.Text = 'Data'
      CaptionOptions.Layout = clTop
      Control = datData
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object lciBarraStatus: TdxLayoutItem
      Parent = lcgRoot
      AlignVert = avBottom
      CaptionOptions.Text = 'Barra de Status'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      Control = sbRepartes
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object lciProcessar: TdxLayoutItem
      Parent = lcgFiltro
      AlignVert = avBottom
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      Control = btnProcessar
      ControlOptions.ShowBorder = False
      Index = 6
    end
    object lciCodigoDistribuidor: TdxLayoutItem
      Parent = lcgFiltro
      CaptionOptions.Text = 'C'#243'digo Distribuidor'
      CaptionOptions.Layout = clTop
      Control = mskCodigoDistribuidor
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lcgRepartes: TdxLayoutGroup
      Parent = lcgManutencao
      AlignVert = avClient
      CaptionOptions.Text = 'Repartes'
      ButtonOptions.Buttons = <>
      Index = 1
    end
    object lciRepartes: TdxLayoutItem
      Parent = lcgRepartes
      AlignVert = avClient
      CaptionOptions.Text = 'Repartes'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      Control = grdRepartes
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lcgManutencao: TdxLayoutGroup
      Parent = lcgGeral
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'Manuten'#231#227'o'
      ButtonOptions.Buttons = <>
      ButtonOptions.ShowExpandButton = True
      Index = 1
    end
    object lcgGeral: TdxLayoutAutoCreatedGroup
      Parent = lcgRoot
      AlignVert = avClient
      LayoutDirection = ldTabbed
      Index = 1
      AutoCreated = True
    end
    object lcgImportacao: TdxLayoutGroup
      Parent = lcgGeral
      CaptionOptions.Text = 'Importa'#231#227'o'
      ButtonOptions.Buttons = <>
      Index = 0
    end
    object lciArquivo: TdxLayoutItem
      Parent = lcgArquivo
      AlignHorz = ahClient
      CaptionOptions.Text = '&Arquivo'
      Control = edtArquivo
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lciGradeRemessas: TdxLayoutItem
      Parent = lcgImportacao
      AlignVert = avClient
      CaptionOptions.Text = 'Repartes'
      CaptionOptions.Layout = clTop
      Control = grdRemessas
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lciImportar: TdxLayoutItem
      Parent = lcgArquivo
      CaptionOptions.Text = 'Importar'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      Control = btnImportarRemessa
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lcgArquivo: TdxLayoutAutoCreatedGroup
      Parent = lcgImportacao
      LayoutDirection = ldHorizontal
      Index = 0
      AutoCreated = True
    end
    object lciBotaoGravar: TdxLayoutItem
      Parent = lcRepartesGroup1
      AlignHorz = ahLeft
      AlignVert = avBottom
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      Control = btnGravarImportacao
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lciFechar: TdxLayoutItem
      Parent = lcgRoot
      AlignHorz = ahRight
      AlignVert = avBottom
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnFechar
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object lciCancelarOperacao: TdxLayoutItem
      Parent = lcRepartesGroup2
      AlignHorz = ahLeft
      AlignVert = avBottom
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnCancelarOperacao
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lciLimparDados: TdxLayoutItem
      Parent = lcRepartesGroup1
      AlignHorz = ahLeft
      AlignVert = avBottom
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      Control = btnLimparDados
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lcRepartesGroup1: TdxLayoutAutoCreatedGroup
      Parent = lcgImportacao
      AlignVert = avBottom
      LayoutDirection = ldHorizontal
      Index = 2
      AutoCreated = True
    end
    object lciImprimirRemessas: TdxLayoutItem
      Parent = lcRepartesGroup2
      AlignHorz = ahLeft
      AlignVert = avBottom
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnImprimirRemessas
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lcRepartesGroup2: TdxLayoutAutoCreatedGroup
      Parent = lcgManutencao
      AlignVert = avBottom
      LayoutDirection = ldHorizontal
      Index = 2
      AutoCreated = True
    end
    object lciEditar: TdxLayoutItem
      Parent = lcRepartesGroup2
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnEditar
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object lciGravar: TdxLayoutItem
      Parent = lcRepartesGroup2
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnGravar
      ControlOptions.ShowBorder = False
      Index = 3
    end
  end
  object dsDistribuidor: TDataSource
    AutoEdit = False
    DataSet = dm.fdqDistribuidor
    Left = 528
    Top = 16
  end
  object dsBancas: TDataSource
    AutoEdit = False
    DataSet = dm.fdqBancas
    Left = 576
    Top = 16
  end
  object aclRemessas: TActionList
    Images = dm.iml16x16
    Left = 632
    Top = 16
    object actProcessar: TAction
      Category = 'Repartes'
      Caption = 'Processar'
      Hint = 'Processar filtro'
      ImageIndex = 39
      ShortCut = 16397
      OnExecute = actProcessarExecute
    end
    object actCancelarOperacao: TAction
      Category = 'Repartes'
      Caption = 'Cancelar'
      Hint = 'Cancelar Opera'#231#227'o'
      ImageIndex = 4
      OnExecute = actCancelarOperacaoExecute
    end
    object actImportarRemessa: TAction
      Category = 'Repartes'
      Caption = 'Importar'
      Hint = 'Importar Arquivo de Remessas'
      ImageIndex = 10
      OnExecute = actImportarRemessaExecute
    end
    object actGravarImportacao: TAction
      Category = 'Repartes'
      Caption = 'Gravar'
      Hint = 'Gravar Importa'#231#227'o no Banco de Dados'
      ImageIndex = 32
      OnExecute = actGravarImportacaoExecute
    end
    object actFechar: TAction
      Category = 'Repartes'
      Caption = 'Fechar'
      Hint = 'Fechar a tela'
      ImageIndex = 6
      OnExecute = actFecharExecute
    end
    object actpmExpandir: TAction
      Category = 'Popup'
      Caption = 'E&xpandir'
      Hint = 'Expandir os grupos para visualizar os detalhes'
      ShortCut = 16453
      OnExecute = actpmExpandirExecute
    end
    object actpmRecolher: TAction
      Category = 'Popup'
      Caption = '&Recolher'
      Hint = 'Recolher detalhes'
      ShortCut = 16466
      OnExecute = actpmRecolherExecute
    end
    object actLimparDados: TAction
      Category = 'Repartes'
      Caption = 'Limpar'
      Hint = 'Limpar dados'
      ImageIndex = 5
      OnExecute = actLimparDadosExecute
    end
    object actImprimir: TAction
      Category = 'Repartes'
      Caption = 'Imprimir'
      Hint = 'Imprimir Grade de Remessas'
      ImageIndex = 42
      OnExecute = actImprimirExecute
    end
    object actEditar: TAction
      Category = 'Repartes'
      Caption = 'Editar'
      Hint = 'Editar dados'
      ImageIndex = 46
      ShortCut = 114
      OnExecute = actEditarExecute
    end
    object actGravar: TAction
      Category = 'Repartes'
      Caption = 'Gravar'
      Hint = 'Gravar as altera'#231#245'es no banco de dados'
      ImageIndex = 32
      ShortCut = 116
      OnExecute = actGravarExecute
    end
  end
  object dsRepartes: TDataSource
    AutoEdit = False
    DataSet = dm.fdqRemessasVA
    Left = 760
    Top = 16
  end
  object dsProduto: TDataSource
    AutoEdit = False
    DataSet = dm.fdqProdutosVA
    Left = 472
    Top = 16
  end
  object OpenDialog: TOpenDialog
    Filter = 'Arquivos de Remessas|FRANQREM*.txt'
    Title = 'Abrir Arquivos de Remessas'
    Left = 816
    Top = 16
  end
  object pmRepartes: TPopupMenu
    Left = 952
    Top = 360
    object Expandir1: TMenuItem
      Action = actpmExpandir
    end
    object Recolher1: TMenuItem
      Action = actpmRecolher
    end
  end
  object gpmREpartes: TcxGridPopupMenu
    Grid = grdRepartes
    PopupMenus = <
      item
        GridView = tvRepartes
        HitTypes = []
        Index = 0
        PopupMenu = pmRepartes
      end>
    Left = 856
    Top = 360
  end
  object ComponentPrinter: TdxComponentPrinter
    CurrentLink = ComponentPrinterLink1
    PrintTitle = 'Repartes de Jornais e Produtos'
    TimeFormat = 3
    Version = 0
    Left = 504
    Top = 568
    object ComponentPrinterLink1: TdxGridReportLink
      Active = True
      Component = grdRepartes
      PrinterPage.CenterOnPageH = True
      PrinterPage.CenterOnPageV = True
      PrinterPage.DMPaper = 9
      PrinterPage.Footer = 6350
      PrinterPage.GrayShading = True
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.Orientation = poLandscape
      PrinterPage.PageFooter.CenterTitle.Strings = (
        '[Page # of Pages #]')
      PrinterPage.PageFooter.RightTitle.Strings = (
        '[Date & Time Printed]')
      PrinterPage.PageHeader.CenterTitle.Strings = (
        'Repartes de Jornais e Produtos')
      PrinterPage.PageHeader.LeftTitle.Strings = (
        'Venda Avulsa')
      PrinterPage.PageSize.X = 210000
      PrinterPage.PageSize.Y = 297000
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportDocument.CreationDate = 43147.663290844910000000
      OptionsExpanding.ExpandGroupRows = True
      OptionsOnEveryPage.FilterBar = False
      OptionsSize.AutoWidth = True
      OptionsView.FilterBar = False
      BuiltInReportLink = True
    end
  end
end
