object frmImportacaoTiragemJornal: TfrmImportacaoTiragemJornal
  Left = 0
  Top = 0
  Caption = 'Importa'#231#227'o de Tiragem de Jornal'
  ClientHeight = 525
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
    Caption = 'Importa'#231#227'o de Tiragem de Jornal'
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
    Width = 838
    AnchorY = 22
  end
  object lcMain: TdxLayoutControl
    Left = 0
    Top = 44
    Width = 844
    Height = 481
    Align = alClient
    TabOrder = 1
    LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
    OptionsImage.Images = dm.cxImageList1
    object edtArquivo: TcxButtonEdit
      Left = 82
      Top = 36
      Hint = 'Arquivo a ser importado'
      ParentShowHint = False
      Properties.Buttons = <
        item
          Action = actAbrir
          Default = True
          Kind = bkGlyph
        end>
      Properties.Images = dm.cxImageList1
      ShowHint = True
      Style.HotTrack = False
      TabOrder = 0
      Width = 661
    end
    object grdTiragem: TcxGrid
      Left = 20
      Top = 126
      Width = 250
      Height = 200
      TabOrder = 2
      object tvTiragem: TcxGridDBTableView
        Navigator.Buttons.ConfirmDelete = True
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.Images = dm.cxImageList1
        Navigator.Buttons.First.ImageIndex = 99
        Navigator.Buttons.PriorPage.Visible = False
        Navigator.Buttons.Prior.ImageIndex = 102
        Navigator.Buttons.Next.ImageIndex = 101
        Navigator.Buttons.NextPage.Visible = False
        Navigator.Buttons.Last.ImageIndex = 100
        Navigator.Buttons.Insert.ImageIndex = 1
        Navigator.Buttons.Delete.ImageIndex = 8
        Navigator.Buttons.Edit.ImageIndex = 14
        Navigator.Buttons.Post.ImageIndex = 9
        Navigator.Buttons.Cancel.ImageIndex = 62
        Navigator.Buttons.Refresh.ImageIndex = 40
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.Buttons.GotoBookmark.Visible = False
        Navigator.Buttons.Filter.ImageIndex = 67
        Navigator.InfoPanel.Visible = True
        Navigator.Visible = True
        DataController.DataSource = dsTiragem
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0;-,0'
            Kind = skSum
            Column = tvTiragemQTD_TIRAGEM
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.ExpandMasterRowOnDblClick = False
        OptionsBehavior.FocusCellOnCycle = True
        OptionsCustomize.ColumnGrouping = False
        OptionsData.DeletingConfirmation = False
        OptionsSelection.InvertSelect = False
        OptionsSelection.MultiSelect = True
        OptionsSelection.CellMultiSelect = True
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        object tvTiragemRecId: TcxGridDBColumn
          DataBinding.FieldName = 'RecId'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvTiragemDAT_TIRAGEM: TcxGridDBColumn
          DataBinding.FieldName = 'DAT_TIRAGEM'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.SaveTime = False
          Properties.ShowTime = False
          HeaderAlignmentHorz = taCenter
          Width = 92
        end
        object tvTiragemCOD_ROTEIRO: TcxGridDBColumn
          DataBinding.FieldName = 'COD_ROTEIRO'
          HeaderAlignmentHorz = taCenter
          Width = 197
        end
        object tvTiragemCOD_ENTREGADOR: TcxGridDBColumn
          DataBinding.FieldName = 'COD_ENTREGADOR'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'COD_CADASTRO'
          Properties.ListColumns = <
            item
              FieldName = 'DES_RAZAO_SOCIAL'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dsEntregador
          HeaderAlignmentHorz = taCenter
          Width = 272
        end
        object tvTiragemCOD_PRODUTO: TcxGridDBColumn
          DataBinding.FieldName = 'COD_PRODUTO'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'COD_PRODUTO'
          Properties.ListColumns = <
            item
              FieldName = 'DES_PRODUTO'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dsProdutos
          HeaderAlignmentHorz = taCenter
          Width = 119
        end
        object tvTiragemQTD_TIRAGEM: TcxGridDBColumn
          DataBinding.FieldName = 'QTD_TIRAGEM'
          HeaderAlignmentHorz = taCenter
          Width = 122
        end
      end
      object lvTiragem: TcxGridLevel
        GridView = tvTiragem
      end
    end
    object memLogImportacao: TcxBlobEdit
      Left = 20
      Top = 406
      Hint = 'LOG de Importa'#231#227'o da Tiragem'
      Properties.BlobEditKind = bekMemo
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 3
      Width = 121
    end
    object cxButton1: TcxButton
      Left = 749
      Top = 36
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Action = actImportar
      TabOrder = 1
    end
    object cxButton3: TcxButton
      Left = 749
      Top = 355
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Action = actGravar
      TabOrder = 5
    end
    object cxButton2: TcxButton
      Left = 668
      Top = 355
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Action = actLimpar
      TabOrder = 4
    end
    object cxButton4: TcxButton
      Left = 759
      Top = 446
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Action = actFechar
      TabOrder = 6
    end
    object lcMainGroup_Root: TdxLayoutGroup
      AlignHorz = ahParentManaged
      AlignVert = avParentManaged
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object lcgArquivo: TdxLayoutGroup
      Parent = lcMainGroup_Root
      CaptionOptions.ImageIndex = 41
      CaptionOptions.Text = 'Arquivo'
      CaptionOptions.Visible = False
      LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
      ButtonOptions.Buttons = <>
      ButtonOptions.ShowExpandButton = True
      LayoutDirection = ldHorizontal
      Index = 0
    end
    object lciArquivo: TdxLayoutItem
      Parent = lcgArquivo
      AlignHorz = ahClient
      CaptionOptions.ImageIndex = 41
      CaptionOptions.Text = 'Arquivo'
      Control = edtArquivo
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lcgDadosTiragem: TdxLayoutGroup
      Parent = lcMainGroup_Root
      AlignVert = avClient
      CaptionOptions.ImageIndex = 109
      CaptionOptions.Text = 'Dados da Tiragem'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      ButtonOptions.ShowExpandButton = True
      Index = 1
    end
    object lciGradeTiragem: TdxLayoutItem
      Parent = lcgDadosTiragem
      AlignVert = avClient
      CaptionOptions.ImageIndex = 109
      CaptionOptions.Text = 'Tiragem'
      CaptionOptions.Layout = clTop
      Control = grdTiragem
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lcMainItem1: TdxLayoutItem
      Parent = lcgDadosTiragem
      AlignVert = avBottom
      CaptionOptions.ImageIndex = 86
      CaptionOptions.Text = 'LOG de Importa'#231#227'o da Tiragem'
      CaptionOptions.Layout = clTop
      Control = memLogImportacao
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lcMainItem2: TdxLayoutItem
      Parent = lcgArquivo
      AlignHorz = ahRight
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = cxButton1
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lcMainItem4: TdxLayoutItem
      Parent = lcMainGroup1
      AlignHorz = ahRight
      AlignVert = avBottom
      CaptionOptions.Text = 'cxButton3'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      Control = cxButton3
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lcMainItem3: TdxLayoutItem
      Parent = lcMainGroup1
      AlignHorz = ahRight
      AlignVert = avBottom
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      Control = cxButton2
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lcMainGroup1: TdxLayoutAutoCreatedGroup
      Parent = lcgDadosTiragem
      LayoutDirection = ldHorizontal
      Index = 2
      AutoCreated = True
    end
    object lcMainItem5: TdxLayoutItem
      Parent = lcMainGroup_Root
      AlignHorz = ahRight
      AlignVert = avBottom
      CaptionOptions.Text = 'cxButton4'
      CaptionOptions.Visible = False
      Control = cxButton4
      ControlOptions.ShowBorder = False
      Index = 2
    end
  end
  object odArquivo: TOpenDialog
    Filter = 'Arquivo Separado por Virgula|*.csv|Arquivo Texto|*.txt'
    Title = 'Abrir arquivo de Tiragem de Jornal'
    Left = 648
    Top = 8
  end
  object tbTiragem: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 704
    Top = 8
    object tbTiragemDAT_TIRAGEM: TDateField
      DisplayLabel = 'Data'
      FieldName = 'DAT_TIRAGEM'
    end
    object tbTiragemCOD_ROTEIRO: TStringField
      DisplayLabel = 'Roteiro'
      FieldName = 'COD_ROTEIRO'
      Size = 50
    end
    object tbTiragemCOD_ENTREGADOR: TIntegerField
      DisplayLabel = 'Entregador'
      FieldName = 'COD_ENTREGADOR'
    end
    object tbTiragemCOD_PRODUTO: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'COD_PRODUTO'
      Size = 10
    end
    object tbTiragemQTD_TIRAGEM: TIntegerField
      DisplayLabel = 'Tiragem'
      FieldName = 'QTD_TIRAGEM'
    end
  end
  object dsTiragem: TDataSource
    DataSet = tbTiragem
    Left = 736
    Top = 8
  end
  object aclImportacao: TActionList
    Images = dm.cxImageList1
    Left = 792
    Top = 8
    object actAbrir: TAction
      Category = 'Importa'#231#227'o'
      Caption = 'Abrir'
      Hint = 'Abrir arquivo de importa'#231#227'o'
      ImageIndex = 46
      OnExecute = actAbrirExecute
    end
    object actImportar: TAction
      Category = 'Importa'#231#227'o'
      Caption = 'Importar'
      Hint = 'Importar arquivo'
      ImageIndex = 33
      OnExecute = actImportarExecute
    end
    object actLimpar: TAction
      Category = 'Importa'#231#227'o'
      Caption = 'Limpar'
      Hint = 'Limpar grade de importa'#231#227'o'
      ImageIndex = 47
      OnExecute = actLimparExecute
    end
    object actGravar: TAction
      Category = 'Importa'#231#227'o'
      Caption = 'Gravar'
      Hint = 'Gravar tiragem no banco de dados'
      ImageIndex = 9
      OnExecute = actGravarExecute
    end
    object actFechar: TAction
      Category = 'Importa'#231#227'o'
      Caption = 'Fechar'
      Hint = 'Fechar tela'
      ImageIndex = 103
      OnExecute = actFecharExecute
    end
  end
  object tbListaEntregadores: TdxMemData
    Indexes = <
      item
        FieldName = 'COD_CADASTRO'
        SortOptions = []
      end>
    SortOptions = []
    Left = 352
    Top = 9
    object tbListaEntregadoresCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
    end
    object tbListaEntregadoresDES_RAZAO_SOCIAL: TStringField
      FieldName = 'DES_RAZAO_SOCIAL'
      Size = 70
    end
  end
  object dsEntregador: TDataSource
    AutoEdit = False
    DataSet = tbListaEntregadores
    Left = 384
    Top = 8
  end
  object tbProdutos: TdxMemData
    Active = True
    Indexes = <>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F020000000A00000014000C00434F445F50524F4455
      544F004600000014000C004445535F50524F4455544F00}
    SortOptions = []
    Left = 440
    Top = 8
    object tbProdutosCOD_PRODUTO: TWideStringField
      FieldName = 'COD_PRODUTO'
      Size = 10
    end
    object tbProdutosDES_PRODUTO: TWideStringField
      FieldName = 'DES_PRODUTO'
      Size = 70
    end
  end
  object dsProdutos: TDataSource
    AutoEdit = False
    DataSet = tbProdutos
    Left = 480
    Top = 8
  end
end
