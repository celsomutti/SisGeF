object frmExtratosExpressas: TfrmExtratosExpressas
  Left = 0
  Top = 0
  Caption = 'Extrato de Expressas'
  ClientHeight = 506
  ClientWidth = 1058
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object lcMain: TdxLayoutControl
    Left = 0
    Top = 44
    Width = 1058
    Height = 462
    Align = alClient
    TabOrder = 0
    LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
    OptionsImage.Images = dm.cxImageList2
    ExplicitWidth = 985
    object lcParametros: TdxLayoutControl
      Left = 11
      Top = 11
      Width = 1014
      Height = 198
      TabOrder = 0
      LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
      OptionsImage.Images = dm.cxImageList1
      object cxTipoPeríodo: TcxComboBox
        Left = 322
        Top = 10
        Hint = 'Tipo de Per'#237'odo'
        Properties.Items.Strings = (
          'Baixas'
          'Entregas'
          'Atribui'#231#245'es'
          'Pagamento')
        Style.HotTrack = False
        TabOrder = 1
        Text = 'Baixas'
        Width = 103
      end
      object cxData: TcxDateEdit
        Left = 509
        Top = 10
        Hint = 'Data Inicial ou Data de Pagamento'
        Properties.SaveTime = False
        Properties.ShowTime = False
        Style.HotTrack = False
        TabOrder = 2
        Width = 92
      end
      object cxDataFinal: TcxDateEdit
        Left = 680
        Top = 10
        Hint = 'Data Final do Per'#237'odo'
        Properties.SaveTime = False
        Properties.ShowTime = False
        Style.HotTrack = False
        TabOrder = 3
        Width = 97
      end
      object cxTipoExtrato: TcxComboBox
        Left = 109
        Top = 10
        Hint = 'Tipo de Extrato'
        Properties.DropDownListStyle = lsEditFixedList
        Properties.Items.Strings = (
          'Pr'#233'via'
          'Fechado')
        Style.HotTrack = False
        TabOrder = 0
        Text = 'Pr'#233'via'
        Width = 108
      end
      object grdEntregadores: TcxGrid
        Left = 10
        Top = 57
        Width = 250
        Height = 128
        TabOrder = 4
        object grdEntregadoresDBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsEntregador
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          Images = dm.cxImageList1
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.NoDataToDisplayInfoText = '<Nenhuma Informa'#231#227'o Dispon'#237'vel>'
          OptionsView.ColumnAutoWidth = True
          OptionsView.GridLines = glNone
          OptionsView.GroupByBox = False
          object grdEntregadoresDBTableView1DOM_SELECIONAR: TcxGridDBColumn
            PropertiesClassName = 'TcxCheckBoxProperties'
            HeaderGlyphAlignmentHorz = taCenter
            HeaderImageIndex = 51
            Width = 35
          end
          object grdEntregadoresDBTableView1COD_ENTREGADOR: TcxGridDBColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'COD_ENTREGADOR'
            Width = 55
          end
          object grdEntregadoresDBTableView1DES_ENTREGADOR: TcxGridDBColumn
            Caption = 'Nome'
            DataBinding.FieldName = 'DES_ENTREGADOR'
            Width = 158
          end
        end
        object grdEntregadoresLevel1: TcxGridLevel
          GridView = grdEntregadoresDBTableView1
        end
      end
      object cxComboBox1: TcxComboBox
        Left = 855
        Top = 10
        Hint = 'Filtrar por Distribuidor ou Entregador'
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          'Distribuidor'
          'Entregador')
        Style.HotTrack = False
        TabOrder = 5
        Text = 'Distribuidor'
        Width = 121
      end
      object lcParametrosGroup_Root: TdxLayoutGroup
        AlignHorz = ahLeft
        AlignVert = avTop
        ButtonOptions.Buttons = <>
        Hidden = True
        LayoutDirection = ldHorizontal
        ShowBorder = False
        Index = -1
      end
      object lcParametrosItem2: TdxLayoutItem
        Parent = lcParametrosGroup1
        CaptionOptions.ImageIndex = 98
        CaptionOptions.Text = 'Tipo de Per'#237'odo'
        Control = cxTipoPeríodo
        ControlOptions.ShowBorder = False
        Index = 1
      end
      object lcParametrosItem3: TdxLayoutItem
        Parent = lcParametrosGroup1
        CaptionOptions.ImageIndex = 7
        CaptionOptions.Text = 'Data Inicial'
        Control = cxData
        ControlOptions.ShowBorder = False
        Index = 2
      end
      object lcParametrosItem4: TdxLayoutItem
        Parent = lcParametrosGroup1
        CaptionOptions.ImageIndex = 7
        CaptionOptions.Text = 'Data Final'
        Control = cxDataFinal
        ControlOptions.ShowBorder = False
        Index = 3
      end
      object lcParametrosItem1: TdxLayoutItem
        Parent = lcParametrosGroup1
        CaptionOptions.ImageIndex = 28
        CaptionOptions.Text = 'Tipo de Extrato'
        Control = cxTipoExtrato
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcParametrosItem5: TdxLayoutItem
        Parent = lcParametrosGroup2
        AlignHorz = ahLeft
        CaptionOptions.ImageIndex = 57
        CaptionOptions.Text = 'Distribuidores/Entregadores'
        CaptionOptions.Layout = clTop
        Control = grdEntregadores
        ControlOptions.ShowBorder = False
        Index = 1
      end
      object lcParametrosGroup1: TdxLayoutAutoCreatedGroup
        Parent = lcParametrosGroup2
        LayoutDirection = ldHorizontal
        Index = 0
        AutoCreated = True
      end
      object lcParametrosItem6: TdxLayoutItem
        Parent = lcParametrosGroup_Root
        CaptionOptions.ImageIndex = 55
        CaptionOptions.Text = 'Filtrar por'
        Control = cxComboBox1
        ControlOptions.ShowBorder = False
        Index = 1
      end
      object lcParametrosGroup2: TdxLayoutAutoCreatedGroup
        Parent = lcParametrosGroup_Root
        Index = 0
        AutoCreated = True
      end
    end
    object lcMainGroup_Root: TdxLayoutGroup
      AlignHorz = ahLeft
      AlignVert = avTop
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object lcMainItem1: TdxLayoutItem
      Parent = lcMainGroup_Root
      CaptionOptions.Text = 'Par'#226'metros'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      Control = lcParametros
      Index = 0
    end
  end
  object cxLabel27: TcxLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alTop
    AutoSize = False
    Caption = 'Extrato de Expressas'
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -21
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Properties.Alignment.Vert = taVCenter
    Transparent = True
    ExplicitWidth = 979
    Height = 38
    Width = 1052
    AnchorY = 22
  end
  object tbEntregadores: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 864
    Top = 12
    object tbEntregadoresCOD_ENTREGADOR: TIntegerField
      FieldName = 'COD_ENTREGADOR'
    end
    object tbEntregadoresDES_ENTREGADOR: TStringField
      FieldName = 'DES_ENTREGADOR'
      Size = 70
    end
    object tbEntregadoresDOM_SELECIONAR: TBooleanField
      FieldName = 'DOM_SELECIONAR'
    end
  end
  object dsEntregador: TDataSource
    AutoEdit = False
    DataSet = tbEntregadores
    Left = 904
    Top = 8
  end
end
