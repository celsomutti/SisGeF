object view_InventarioProdutosVA: Tview_InventarioProdutosVA
  Left = 0
  Top = 0
  Caption = 'Invent'#225'rios de Produtos VA'
  ClientHeight = 499
  ClientWidth = 997
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
  object lcInventario: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 997
    Height = 499
    Align = alClient
    TabOrder = 0
    LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
    object edtData: TcxDateEdit
      Left = 10
      Top = 28
      Hint = 'Informe a Data do Invent'#225'rio'
      Properties.ImmediatePost = True
      Properties.OnValidate = edtDataPropertiesValidate
      Style.HotTrack = False
      TabOrder = 0
      Width = 121
    end
    object grdInventario: TcxGrid
      Left = 10
      Top = 118
      Width = 960
      Height = 275
      TabOrder = 2
      object tvInventario: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = ds
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnHidingOnGrouping = False
        OptionsSelection.InvertSelect = False
        OptionsSelection.MultiSelect = True
        OptionsSelection.CellMultiSelect = True
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        object tvInventarioRecId: TcxGridDBColumn
          DataBinding.FieldName = 'RecId'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvInventarioID_PRODUTO: TcxGridDBColumn
          DataBinding.FieldName = 'ID_PRODUTO'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvInventarioCOD_BANCA: TcxGridDBColumn
          DataBinding.FieldName = 'COD_BANCA'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvInventarioCOD_BARRAS: TcxGridDBColumn
          DataBinding.FieldName = 'COD_BARRAS'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 181
        end
        object tvInventarioCOD_PRODUTO: TcxGridDBColumn
          DataBinding.FieldName = 'COD_PRODUTO'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 158
        end
        object tvInventarioDES_PRODUTO: TcxGridDBColumn
          DataBinding.FieldName = 'DES_PRODUTO'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 523
        end
        object tvInventarioDAT_INVENTARIO: TcxGridDBColumn
          DataBinding.FieldName = 'DAT_INVENTARIO'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvInventarioQTD_PRODUTO: TcxGridDBColumn
          DataBinding.FieldName = 'QTD_PRODUTO'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 101
        end
      end
      object lvInventario: TcxGridLevel
        GridView = tvInventario
      end
    end
    object edtCodigo: TcxTextEdit
      Left = 10
      Top = 73
      Properties.ValidateOnEnter = True
      Properties.OnEditValueChanged = edtCodigoPropertiesEditValueChanged
      Properties.OnValidate = edtCodigoPropertiesValidate
      Style.HotTrack = False
      TabOrder = 1
      Width = 121
    end
    object btnGravar: TcxButton
      Left = 669
      Top = 464
      Width = 75
      Height = 25
      Action = actGravar
      TabOrder = 3
    end
    object btnCancelar: TcxButton
      Left = 831
      Top = 464
      Width = 75
      Height = 25
      Action = actCancelar
      Cancel = True
      TabOrder = 5
    end
    object btnFechar: TcxButton
      Left = 912
      Top = 464
      Width = 75
      Height = 25
      Action = actFechar
      TabOrder = 6
    end
    object btnExportar: TcxButton
      Left = 750
      Top = 464
      Width = 75
      Height = 25
      Action = actExportar
      TabOrder = 4
    end
    object lcgRoot: TdxLayoutGroup
      AlignHorz = ahParentManaged
      AlignVert = avParentManaged
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object lciData: TdxLayoutItem
      Parent = lcgRoot
      CaptionOptions.Text = '&Data'
      CaptionOptions.Layout = clTop
      Control = edtData
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lciGrade: TdxLayoutItem
      Parent = lcgRoot
      AlignVert = avClient
      CaptionOptions.Text = 'Invent'#225'rio'
      CaptionOptions.Layout = clTop
      Control = grdInventario
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object lciBarras: TdxLayoutItem
      Parent = lcgRoot
      CaptionOptions.Text = 'C'#243'digo'
      CaptionOptions.Layout = clTop
      Control = edtCodigo
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lciGravar: TdxLayoutItem
      Parent = lcgOpcoes
      AlignHorz = ahRight
      AlignVert = avBottom
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnGravar
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lciCancelar: TdxLayoutItem
      Parent = lcgOpcoes
      AlignHorz = ahRight
      AlignVert = avBottom
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      Control = btnCancelar
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object lcgOpcoes: TdxLayoutAutoCreatedGroup
      Parent = lcgRoot
      LayoutDirection = ldHorizontal
      Index = 3
      AutoCreated = True
    end
    object lciFechar: TdxLayoutItem
      Parent = lcgOpcoes
      AlignHorz = ahRight
      AlignVert = avBottom
      CaptionOptions.Text = 'cxButton3'
      CaptionOptions.Visible = False
      Control = btnFechar
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object lciExportar: TdxLayoutItem
      Parent = lcgOpcoes
      AlignHorz = ahRight
      AlignVert = avBottom
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnExportar
      ControlOptions.ShowBorder = False
      Index = 1
    end
  end
  object tbInventario: TdxMemData
    Indexes = <
      item
        FieldName = 'COD_BARRAS'
        SortOptions = []
      end
      item
        FieldName = 'ID_PRODUTO'
        SortOptions = []
      end
      item
        FieldName = 'COD_BARRAS'
        SortOptions = []
      end>
    SortOptions = []
    Left = 784
    Top = 56
    object tbInventarioID_PRODUTO: TIntegerField
      DisplayLabel = 'ID Produto'
      FieldName = 'ID_PRODUTO'
    end
    object tbInventarioCOD_BANCA: TIntegerField
      DisplayLabel = 'C'#243'd. Banca'
      FieldName = 'COD_BANCA'
    end
    object tbInventarioCOD_PRODUTO: TStringField
      DisplayLabel = 'C'#243'd. Produto'
      FieldName = 'COD_PRODUTO'
    end
    object tbInventarioDES_PRODUTO: TStringField
      DisplayLabel = 'Descri'#231#227'o do Produto'
      FieldName = 'DES_PRODUTO'
      Size = 70
    end
    object tbInventarioCOD_BARRAS: TStringField
      DisplayLabel = 'C'#243'd. Barras'
      FieldName = 'COD_BARRAS'
    end
    object tbInventarioDAT_INVENTARIO: TDateField
      DisplayLabel = 'Data'
      FieldName = 'DAT_INVENTARIO'
    end
    object tbInventarioQTD_PRODUTO: TFloatField
      DisplayLabel = 'Qtde.'
      FieldName = 'QTD_PRODUTO'
    end
  end
  object ds: TDataSource
    AutoEdit = False
    DataSet = tbInventario
    Left = 824
    Top = 56
  end
  object aclInventario: TActionList
    Images = dm.iml16x16
    Left = 864
    Top = 56
    object actGravar: TAction
      Category = 'Invent'#225'rio'
      Caption = 'Gravar'
      Hint = 'Gravar o invent'#225'rio no banco de dados'
      ImageIndex = 32
      OnExecute = actGravarExecute
    end
    object actCancelar: TAction
      Category = 'Invent'#225'rio'
      Caption = 'Cancelar'
      Hint = 'Cancelar invent'#225'rio'
      ImageIndex = 4
      OnExecute = actCancelarExecute
    end
    object actFechar: TAction
      Category = 'Invent'#225'rio'
      Caption = 'Fechar'
      Hint = 'Fechar a tela'
      ImageIndex = 6
      OnExecute = actFecharExecute
    end
    object actExportar: TAction
      Category = 'Invent'#225'rio'
      Caption = 'E&xportar'
      Hint = 'Exportar dados da grade'
      ImageIndex = 29
      OnExecute = actExportarExecute
    end
  end
  object SaveDialog: TSaveDialog
    Left = 912
    Top = 56
  end
end
