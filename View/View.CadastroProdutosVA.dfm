object view_CadastroProdutosVA: Tview_CadastroProdutosVA
  Left = 0
  Top = 0
  Caption = 'Cadastro de Produtos de Venda Avulsa'
  ClientHeight = 444
  ClientWidth = 844
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
  object lciRoot: TdxLayoutControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 838
    Height = 438
    Align = alClient
    TabOrder = 0
    LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
    object lblTitulo: TcxLabel
      Left = 10
      Top = 10
      Caption = 'Cadastro de Produtos de Venda Avulsa'
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
    object grdProdutos: TcxGrid
      Left = 10
      Top = 61
      Width = 250
      Height = 324
      TabOrder = 1
      object tvProdutos: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.PriorPage.Visible = False
        Navigator.Buttons.NextPage.Visible = False
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.Visible = True
        DataController.DataSource = dsProduto
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsSelection.InvertSelect = False
        OptionsSelection.MultiSelect = True
        OptionsSelection.CellMultiSelect = True
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        object tvProdutosID_PRODUTO: TcxGridDBColumn
          Caption = 'ID'
          DataBinding.FieldName = 'ID_PRODUTO'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.IgnoreMaskBlank = True
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d\d\d\d\d'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 66
        end
        object tvProdutosCOD_BARRAS: TcxGridDBColumn
          Caption = 'C'#243'digo de Barras'
          DataBinding.FieldName = 'COD_BARRAS'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.IgnoreMaskBlank = True
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d'
          HeaderAlignmentHorz = taCenter
          Width = 186
        end
        object tvProdutosCOD_PRODUTO: TcxGridDBColumn
          Caption = 'Sigla'
          DataBinding.FieldName = 'COD_PRODUTO'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.CharCase = ecUpperCase
          HeaderAlignmentHorz = taCenter
          Width = 70
        end
        object tvProdutosDES_PRODUTO: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'DES_PRODUTO'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.CharCase = ecUpperCase
          HeaderAlignmentHorz = taCenter
          Width = 379
        end
        object tvProdutosQTD_PADRAO: TcxGridDBColumn
          Caption = 'Padr'#227'o'
          DataBinding.FieldName = 'QTD_PADRAO'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.IgnoreMaskBlank = True
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d\d\d\d\d'
          HeaderAlignmentHorz = taCenter
          Width = 57
        end
        object tvProdutosDOM_DIARIO: TcxGridDBColumn
          Caption = 'Di'#225'rio'
          DataBinding.FieldName = 'DOM_DIARIO'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = '1'
          Properties.ValueUnchecked = '0'
          HeaderAlignmentHorz = taCenter
          Width = 58
        end
        object tvProdutosDES_LOG: TcxGridDBColumn
          DataBinding.FieldName = 'DES_LOG'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
      end
      object lvProdutos: TcxGridLevel
        GridView = tvProdutos
      end
    end
    object btnSair: TcxButton
      Left = 753
      Top = 403
      Width = 75
      Height = 25
      Action = actSair
      TabOrder = 2
    end
    object lcgProdutosVA: TdxLayoutGroup
      AlignHorz = ahParentManaged
      AlignVert = avParentManaged
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object lciTitulo: TdxLayoutItem
      Parent = lcgProdutosVA
      CaptionOptions.Text = 'Titulo'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      Control = lblTitulo
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lciGrade: TdxLayoutItem
      Parent = lcgProdutosVA
      AlignVert = avClient
      CaptionOptions.Text = 'Produtos'
      CaptionOptions.Layout = clTop
      Control = grdProdutos
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lciSair: TdxLayoutItem
      Parent = lcgProdutosVA
      AlignHorz = ahRight
      AlignVert = avBottom
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnSair
      ControlOptions.ShowBorder = False
      Index = 2
    end
  end
  object dsProduto: TDataSource
    DataSet = dm.fdqProdutosVA
    Left = 683
    Top = 19
  end
  object actCadastro: TActionList
    Images = dm.iml16x16
    Left = 739
    Top = 19
    object actSair: TAction
      Category = 'Cadastro'
      Caption = 'Sair'
      Hint = 'Sair da tela'
      ImageIndex = 6
      OnExecute = actSairExecute
    end
  end
end
