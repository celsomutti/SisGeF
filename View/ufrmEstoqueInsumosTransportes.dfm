object frmEstoqueInsumosTransportes: TfrmEstoqueInsumosTransportes
  Left = 0
  Top = 0
  Caption = 'Estoque de Insumos'
  ClientHeight = 405
  ClientWidth = 929
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
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel27: TcxLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alTop
    AutoSize = False
    Caption = 'Estoques de Insunos de Transportes'
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Properties.Alignment.Vert = taVCenter
    Transparent = True
    Height = 22
    Width = 923
    AnchorY = 14
  end
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 53
    Width = 929
    Height = 352
    Align = alClient
    TabOrder = 1
    object grdEstoque: TcxGrid
      Left = 10
      Top = 10
      Width = 250
      Height = 343
      TabOrder = 0
      object tvEstoque: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.Images = dm.cxImageList1
        Navigator.Buttons.First.ImageIndex = 99
        Navigator.Buttons.PriorPage.Visible = False
        Navigator.Buttons.Prior.ImageIndex = 102
        Navigator.Buttons.Next.ImageIndex = 101
        Navigator.Buttons.NextPage.Visible = False
        Navigator.Buttons.Last.ImageIndex = 100
        Navigator.Buttons.Insert.Visible = False
        Navigator.Buttons.Delete.Visible = False
        Navigator.Buttons.Edit.Visible = False
        Navigator.Buttons.Post.Visible = False
        Navigator.Buttons.Cancel.Visible = False
        Navigator.Buttons.Refresh.ImageIndex = 40
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.Buttons.GotoBookmark.Visible = False
        Navigator.Buttons.Filter.ImageIndex = 67
        Navigator.InfoPanel.Visible = True
        Navigator.Visible = True
        DataController.DataSource = dsEstoque
        DataController.KeyFieldNames = 'ID_ESTOQUE'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0.000;-,0.000'
            Kind = skSum
            Column = tvEstoqueQTD_ESTOQUE
          end
          item
            Format = ',0.00;-,0.00'
            Kind = skSum
            Column = tvEstoqueVAL_TOTAL
          end>
        DataController.Summary.SummaryGroups = <
          item
            Links = <
              item
                Column = tvEstoqueID_INSUMO
              end>
            SummaryItems = <
              item
                Format = ',0.000;-,0.000'
                Kind = skSum
                Position = spFooter
                Column = tvEstoqueQTD_ESTOQUE
              end
              item
                Format = ',0.00;-,0.00'
                Kind = skSum
                Position = spFooter
                Column = tvEstoqueVAL_TOTAL
              end>
          end>
        EditForm.DefaultColumnCount = 1
        EditForm.ItemHotTrack = True
        EditForm.DefaultStretch = fsHorizontal
        OptionsBehavior.CopyCaptionsToClipboard = False
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.EditMode = emInplaceEditForm
        OptionsBehavior.FocusCellOnCycle = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupFooters = gfAlwaysVisible
        OptionsView.GroupSummaryLayout = gslAlignWithColumns
        OptionsView.Indicator = True
        object tvEstoqueRecId: TcxGridDBColumn
          DataBinding.FieldName = 'RecId'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvEstoqueID_ESTOQUE: TcxGridDBColumn
          DataBinding.FieldName = 'ID_ESTOQUE'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.IgnoreMaskBlank = True
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d\d\d\d\d\d'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          SortIndex = 0
          SortOrder = soAscending
          Width = 78
        end
        object tvEstoqueID_INSUMO: TcxGridDBColumn
          DataBinding.FieldName = 'ID_INSUMO'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'ID_INSUMO'
          Properties.ListColumns = <
            item
              FieldName = 'DES_INSUMO'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dsInsumo
          HeaderAlignmentHorz = taCenter
          Width = 234
        end
        object tvEstoqueDAT_ESTOQUE: TcxGridDBColumn
          DataBinding.FieldName = 'DAT_ESTOQUE'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.SaveTime = False
          Properties.ShowTime = False
          HeaderAlignmentHorz = taCenter
          Width = 118
        end
        object tvEstoqueQTD_ESTOQUE: TcxGridDBColumn
          Caption = 'Qtde.'
          DataBinding.FieldName = 'QTD_ESTOQUE'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DecimalPlaces = 3
          Properties.DisplayFormat = ',0.000;-,0.000'
          HeaderAlignmentHorz = taCenter
          Width = 115
        end
        object tvEstoqueVAL_UNITARIO: TcxGridDBColumn
          DataBinding.FieldName = 'VAL_UNITARIO'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;-,0.00'
          HeaderAlignmentHorz = taCenter
          Width = 117
        end
        object tvEstoqueVAL_TOTAL: TcxGridDBColumn
          DataBinding.FieldName = 'VAL_TOTAL'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;-,0.00'
          HeaderAlignmentHorz = taCenter
          Width = 162
        end
        object tvEstoqueDES_LOG: TcxGridDBColumn
          DataBinding.FieldName = 'DES_LOG'
          PropertiesClassName = 'TcxBlobEditProperties'
          Properties.BlobEditKind = bekMemo
          HeaderAlignmentHorz = taCenter
          Width = 71
        end
      end
      object lvEstoque: TcxGridLevel
        GridView = tvEstoque
      end
    end
    object dxLayoutControl1Group_Root: TdxLayoutGroup
      AlignHorz = ahParentManaged
      AlignVert = avParentManaged
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object lciGrid: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignVert = avClient
      CaptionOptions.Text = 'cxGrid1'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
      Control = grdEstoque
      ControlOptions.ShowBorder = False
      Index = 0
    end
  end
  object tbEstoque: TdxMemData
    Indexes = <>
    SortOptions = []
    BeforePost = tbEstoqueBeforePost
    AfterPost = tbEstoqueAfterPost
    Left = 712
    object tbEstoqueID_ESTOQUE: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_ESTOQUE'
    end
    object tbEstoqueID_INSUMO: TIntegerField
      DisplayLabel = 'Insumo'
      FieldName = 'ID_INSUMO'
    end
    object tbEstoqueDAT_ESTOQUE: TDateField
      DisplayLabel = 'Data'
      FieldName = 'DAT_ESTOQUE'
    end
    object tbEstoqueQTD_ESTOQUE: TFloatField
      DisplayLabel = 'Data'
      FieldName = 'QTD_ESTOQUE'
      OnValidate = tbEstoqueQTD_ESTOQUEValidate
    end
    object tbEstoqueVAL_UNITARIO: TFloatField
      DisplayLabel = 'Unit'#225'rio'
      FieldName = 'VAL_UNITARIO'
      OnValidate = tbEstoqueVAL_UNITARIOValidate
    end
    object tbEstoqueVAL_TOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'VAL_TOTAL'
    end
    object tbEstoqueDES_LOG: TMemoField
      DisplayLabel = 'LOG'
      FieldName = 'DES_LOG'
      BlobType = ftMemo
    end
  end
  object dsEstoque: TDataSource
    AutoEdit = False
    DataSet = tbEstoque
    OnStateChange = dsEstoqueStateChange
    Left = 752
  end
  object tbInsumos: TdxMemData
    Indexes = <
      item
        FieldName = 'ID_INSUMO'
        SortOptions = []
      end>
    SortOptions = []
    Left = 800
    object tbInsumosID_INSUMO: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_INSUMO'
    end
    object tbInsumosDES_INSUMO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DES_INSUMO'
      Size = 100
    end
    object tbInsumosDES_UNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'DES_UNIDADE'
      Size = 10
    end
    object tbInsumosDES_LOG: TMemoField
      DisplayLabel = 'LOG'
      FieldName = 'DES_LOG'
      BlobType = ftMemo
    end
  end
  object dsInsumo: TDataSource
    AutoEdit = False
    DataSet = tbInsumos
    Left = 840
  end
  object aclEstoque: TActionList
    Left = 672
    object actIncluir: TAction
      Category = 'Cadastro'
      Caption = '&Incluir'
      Hint = 'Incluir dados'
      ShortCut = 113
      OnExecute = actIncluirExecute
    end
    object actEditar: TAction
      Category = 'Cadastro'
      Caption = '&Editar'
      Hint = 'Editar dados'
      ShortCut = 114
      OnExecute = actEditarExecute
    end
    object actExcluir: TAction
      Category = 'Cadastro'
      Caption = 'E&xcluir'
      Hint = 'Excluir dados'
    end
    object actExportar: TAction
      Category = 'Cadastro'
      Caption = 'Ex&portar'
      Hint = 'Exportar dados'
      OnExecute = actExportarExecute
    end
    object actFechar: TAction
      Category = 'Cadastro'
      Caption = 'Fechar'
      Hint = 'Fechatr tela'
      OnExecute = actFecharExecute
    end
  end
  object bmEstoque: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.Images = dm.cxImageList1
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 616
    DockControlHeights = (
      0
      0
      25
      0)
    object bmEstoqueBar1: TdxBar
      AllowClose = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Cadastro'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 963
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      Images = dm.cxImageList1
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton1'
        end
        item
          Visible = True
          ItemName = 'dxBarButton2'
        end
        item
          Visible = True
          ItemName = 'dxBarButton3'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton4'
        end
        item
          Visible = True
          ItemName = 'dxBarButton5'
        end>
      OneOnRow = True
      Row = 0
      ShowMark = False
      UseOwnFont = False
      UseRecentItems = False
      UseRestSpace = True
      Visible = True
      WholeRow = False
    end
    object dxBarButton1: TdxBarButton
      Action = actIncluir
      Category = 0
      ImageIndex = 1
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton2: TdxBarButton
      Action = actEditar
      Category = 0
      ImageIndex = 14
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton3: TdxBarButton
      Action = actExcluir
      Category = 0
      ImageIndex = 8
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton4: TdxBarButton
      Action = actExportar
      Category = 0
      ImageIndex = 29
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton5: TdxBarButton
      Action = actFechar
      Align = iaRight
      Category = 0
      ImageIndex = 103
      PaintStyle = psCaptionGlyph
    end
  end
  object SaveDialog: TSaveDialog
    Left = 568
  end
end
