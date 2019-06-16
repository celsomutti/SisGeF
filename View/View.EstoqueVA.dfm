object view_EstoqueVA: Tview_EstoqueVA
  Left = 0
  Top = 0
  Caption = 'Estoque de Produtos de Venda Avulsa'
  ClientHeight = 615
  ClientWidth = 1115
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
  PixelsPerInch = 96
  TextHeight = 13
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 1115
    Height = 615
    Align = alClient
    TabOrder = 0
    LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
    ExplicitLeft = 640
    ExplicitTop = 360
    ExplicitWidth = 1
    ExplicitHeight = 17
    object cxGrid1: TcxGrid
      Left = 10
      Top = 28
      Width = 250
      Height = 200
      TabOrder = 0
      object cxGrid1DBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
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
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignVert = avTop
      CaptionOptions.Text = 'Produtos'
      CaptionOptions.Layout = clTop
      Control = cxGrid1
      ControlOptions.ShowBorder = False
      Index = 0
    end
  end
  object mtbEstoque: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 864
    Top = 96
    object mtbEstoqueID_ESTOQUE: TIntegerField
      FieldName = 'ID_ESTOQUE'
    end
    object mtbEstoqueID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object mtbEstoqueDAT_ESTOQUE: TDateField
      FieldName = 'DAT_ESTOQUE'
    end
    object mtbEstoqueQTD_ESTOQUE: TFloatField
      FieldName = 'QTD_ESTOQUE'
    end
    object mtbEstoqueVAL_UNITARIO: TFloatField
      FieldName = 'VAL_UNITARIO'
    end
    object mtbEstoqueVAL_ESTOQUE: TFloatField
      FieldName = 'VAL_ESTOQUE'
    end
    object mtbEstoqueDES_LOG: TMemoField
      FieldName = 'DES_LOG'
      BlobType = ftMemo
    end
  end
  object dsEstoque: TDataSource
    AutoEdit = False
    DataSet = mtbEstoque
    Left = 928
    Top = 96
  end
end
