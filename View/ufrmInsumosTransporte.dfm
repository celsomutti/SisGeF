object frmInsumosTransporte: TfrmInsumosTransporte
  Left = 0
  Top = 0
  Caption = 'Insumos de Transportes'
  ClientHeight = 437
  ClientWidth = 914
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
  object cxLabel27: TcxLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alTop
    AutoSize = False
    Caption = 'Insunos de Transportes'
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
    Width = 908
    AnchorY = 14
  end
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 53
    Width = 914
    Height = 384
    Align = alClient
    TabOrder = 1
    OptionsImage.Images = dm.cxImageList1
    object grdInsumos: TcxGrid
      Left = 10
      Top = 10
      Width = 250
      Height = 319
      TabOrder = 0
      object tvInsumos: TcxGridDBTableView
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
        DataController.DataSource = dsInsumo
        DataController.KeyFieldNames = 'ID_INSUMO'
        DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsView.ColumnAutoWidth = True
        object tvInsumosID_INSUMO: TcxGridDBColumn
          DataBinding.FieldName = 'ID_INSUMO'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.IgnoreMaskBlank = True
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d\d\d\d\d\d'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          SortIndex = 0
          SortOrder = soAscending
          Width = 72
        end
        object tvInsumosDES_INSUMO: TcxGridDBColumn
          DataBinding.FieldName = 'DES_INSUMO'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 591
        end
        object tvInsumosDES_UNIDADE: TcxGridDBColumn
          DataBinding.FieldName = 'DES_UNIDADE'
          PropertiesClassName = 'TcxComboBoxProperties'
          Properties.Items.Strings = (
            'PACOTE'
            'UNIDADE'
            'LITROS'
            'GRAMAS'
            'QUILOS'
            'CAIXA')
          HeaderAlignmentHorz = taCenter
          Width = 113
        end
        object tvInsumosDES_LOG: TcxGridDBColumn
          DataBinding.FieldName = 'DES_LOG'
          PropertiesClassName = 'TcxBlobEditProperties'
          Properties.BlobEditKind = bekMemo
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 116
        end
      end
      object lvInsumos: TcxGridLevel
        GridView = tvInsumos
      end
    end
    object dxLayoutControl1Group_Root: TdxLayoutGroup
      AlignHorz = ahParentManaged
      AlignVert = avParentManaged
      LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object dxLayoutControl1Item1: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'Insumos'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      Control = grdInsumos
      ControlOptions.ShowBorder = False
      Index = 0
    end
  end
  object tbInsumos: TdxMemData
    Indexes = <
      item
        FieldName = 'ID_INSUMO'
        SortOptions = []
      end>
    SortOptions = []
    Left = 736
    Top = 16
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
    OnStateChange = dsInsumoStateChange
    Left = 776
    Top = 16
  end
  object aclInsumos: TActionList
    Images = dm.cxImageList1
    Left = 680
    Top = 8
    object actIncluir: TAction
      Category = 'Insumos de Transportes'
      Caption = '&Incluir'
      Hint = 'Incluir dados'
      ImageIndex = 1
      ShortCut = 113
      OnExecute = actIncluirExecute
    end
    object actEditar: TAction
      Category = 'Insumos de Transportes'
      Caption = '&Editar'
      Hint = 'Editar dados'
      ImageIndex = 14
      ShortCut = 114
      OnExecute = actEditarExecute
    end
    object actExcluir: TAction
      Category = 'Insumos de Transportes'
      Caption = 'E&xcluir'
      Hint = 'Excluir dados'
      ImageIndex = 8
      OnExecute = actExcluirExecute
    end
    object actCancelar: TAction
      Category = 'Insumos de Transportes'
      Caption = 'Cancelar'
      Hint = 'Cancelar opera'#231#227'o atual'
      ImageIndex = 62
      OnExecute = actCancelarExecute
    end
    object actGravar: TAction
      Category = 'Insumos de Transportes'
      Caption = '&Gravar'
      Hint = 'Gravar dados'
      ImageIndex = 9
      ShortCut = 116
      OnExecute = actGravarExecute
    end
    object actExportar: TAction
      Category = 'Insumos de Transportes'
      Caption = 'Ex&portar'
      Hint = 'Exportar dados'
      ImageIndex = 29
      OnExecute = actExportarExecute
    end
    object actFechar: TAction
      Category = 'Insumos de Transportes'
      Caption = 'Fechar'
      Hint = 'Fechar a tela'
      ImageIndex = 103
      OnExecute = actFecharExecute
    end
  end
  object bmInsumos: TdxBarManager
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
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 632
    DockControlHeights = (
      0
      0
      25
      0)
    object bmInsumosBar1: TdxBar
      Caption = 'Cadastro'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 948
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
          ItemName = 'dxBarButton4'
        end
        item
          Visible = True
          ItemName = 'dxBarButton3'
        end
        item
          Visible = True
          ItemName = 'dxBarButton5'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton6'
        end
        item
          Visible = True
          ItemName = 'dxBarButton7'
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
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton2: TdxBarButton
      Action = actEditar
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton3: TdxBarButton
      Action = actCancelar
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton4: TdxBarButton
      Action = actExcluir
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton5: TdxBarButton
      Action = actGravar
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton6: TdxBarButton
      Action = actExportar
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = 'New SubItem'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarButton7: TdxBarButton
      Action = actFechar
      Align = iaRight
      Category = 0
      PaintStyle = psCaptionGlyph
    end
  end
  object SaveDialog: TSaveDialog
    Left = 824
    Top = 24
  end
end
