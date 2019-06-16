object frmPlanilhaOperacionalJornal: TfrmPlanilhaOperacionalJornal
  Left = 754
  Top = 463
  Caption = 'Operacional (Jornal)'
  ClientHeight = 530
  ClientWidth = 1054
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDesigned
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    1054
    530)
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel27: TcxLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alTop
    AutoSize = False
    Caption = 'Planilha Operacional (Jornal)'
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
    Width = 1048
    AnchorY = 22
  end
  object cxLabel3: TcxLabel
    Left = 113
    Top = 505
    Anchors = [akLeft, akBottom]
    Caption = '-'
  end
  object lcRoot: TdxLayoutControl
    Left = 0
    Top = 44
    Width = 1054
    Height = 486
    Align = alClient
    TabOrder = 2
    LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
    OptionsImage.Images = dm.cxImageList1
    object lcApontamento: TdxLayoutControl
      Left = 22
      Top = 49
      Width = 300
      Height = 48
      TabOrder = 0
      LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
      OptionsImage.Images = dm.cxImageList1
      object cxData: TcxDateEdit
        Left = 62
        Top = 10
        Hint = 'Data do Apontamento'
        Properties.SaveTime = False
        Properties.ShowTime = False
        Style.HotTrack = False
        TabOrder = 0
        Width = 95
      end
      object cxButton2: TcxButton
        Left = 163
        Top = 10
        Width = 78
        Height = 25
        Cursor = crHandPoint
        Action = actExecutar
        TabOrder = 1
      end
      object lcApontamentoGroup_Root: TdxLayoutGroup
        AlignHorz = ahLeft
        AlignVert = avTop
        ButtonOptions.Buttons = <>
        Hidden = True
        LayoutDirection = ldHorizontal
        ShowBorder = False
        Index = -1
      end
      object lcApontamentoItem1: TdxLayoutItem
        Parent = lcApontamentoGroup_Root
        CaptionOptions.ImageIndex = 7
        CaptionOptions.Text = 'Data:'
        Control = cxData
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcApontamentoItem2: TdxLayoutItem
        Parent = lcApontamentoGroup_Root
        CaptionOptions.Text = 'cxButton2'
        CaptionOptions.Visible = False
        Control = cxButton2
        ControlOptions.ShowBorder = False
        Index = 1
      end
    end
    object dxLayoutControl1: TdxLayoutControl
      Left = 10000
      Top = 10000
      Width = 300
      Height = 48
      TabOrder = 1
      Visible = False
      LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
      OptionsImage.Images = dm.cxImageList1
      object cxDataInicial: TcxDateEdit
        Left = 92
        Top = 10
        Properties.SaveTime = False
        Properties.ShowTime = False
        Style.HotTrack = False
        TabOrder = 0
        Width = 93
      end
      object cxDataFinal: TcxDateEdit
        Left = 268
        Top = 10
        Properties.SaveTime = False
        Properties.ShowTime = False
        Style.HotTrack = False
        TabOrder = 1
        Width = 93
      end
      object cxButton1: TcxButton
        Left = 367
        Top = 10
        Width = 82
        Height = 25
        Cursor = crHandPoint
        Action = actProcessar
        TabOrder = 2
      end
      object dxLayoutControl1Group_Root: TdxLayoutGroup
        AlignHorz = ahLeft
        AlignVert = avTop
        ButtonOptions.Buttons = <>
        Hidden = True
        LayoutDirection = ldHorizontal
        ShowBorder = False
        Index = -1
      end
      object dxLayoutControl1Item1: TdxLayoutItem
        Parent = dxLayoutControl1Group_Root
        CaptionOptions.ImageIndex = 7
        CaptionOptions.Text = 'Data Inicial:'
        Control = cxDataInicial
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object dxLayoutControl1Item2: TdxLayoutItem
        Parent = dxLayoutControl1Group_Root
        CaptionOptions.ImageIndex = 7
        CaptionOptions.Text = 'Data Final:'
        Control = cxDataFinal
        ControlOptions.ShowBorder = False
        Index = 1
      end
      object dxLayoutControl1Item3: TdxLayoutItem
        Parent = dxLayoutControl1Group_Root
        CaptionOptions.Text = 'cxButton1'
        CaptionOptions.Visible = False
        Control = cxButton1
        ControlOptions.ShowBorder = False
        Index = 2
      end
    end
    object lcRootGroup_Root: TdxLayoutGroup
      AlignHorz = ahParentManaged
      AlignVert = avTop
      ButtonOptions.Buttons = <>
      Hidden = True
      LayoutDirection = ldTabbed
      ShowBorder = False
      Index = -1
    end
    object lcRootItem1: TdxLayoutItem
      Parent = lcRootGroup_Root
      CaptionOptions.ImageIndex = 63
      CaptionOptions.Text = 'Apontamento'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
      Control = lcApontamento
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lcRootItem2: TdxLayoutItem
      Parent = lcRootGroup_Root
      CaptionOptions.ImageIndex = 98
      CaptionOptions.Text = 'Demonstrativo'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
      Control = dxLayoutControl1
      ControlOptions.ShowBorder = False
      Index = 1
    end
  end
  object cxButton3: TcxButton
    Left = 976
    Top = 497
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Action = actSair
    Anchors = [akRight, akBottom]
    TabOrder = 3
  end
  object cxButton4: TcxButton
    Left = 3
    Top = 497
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Action = actGravar
    Anchors = [akLeft, akBottom]
    TabOrder = 4
  end
  object cxGrid1: TcxGrid
    Left = 3
    Top = 160
    Width = 1048
    Height = 331
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 5
    object cxGrid1DBBandedTableView1: TcxGridDBBandedTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = ds
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.FocusCellOnCycle = True
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.BandMoving = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsSelection.InvertSelect = False
      OptionsSelection.MultiSelect = True
      OptionsSelection.CellMultiSelect = True
      OptionsView.CellAutoHeight = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      OptionsView.BandHeaders = False
      Bands = <
        item
          FixedKind = fkLeft
        end
        item
        end>
      object cxGrid1DBBandedTableView1RecId: TcxGridDBBandedColumn
        DataBinding.FieldName = 'RecId'
        Visible = False
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object cxGrid1DBBandedTableView1COD_ROTEIRO_ANTIGO: TcxGridDBBandedColumn
        Caption = 'Roteiro Antigo'
        DataBinding.FieldName = 'COD_ROTEIRO_ANTIGO'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        SortIndex = 0
        SortOrder = soAscending
        Width = 132
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1COD_ROTEIRO_NOVO: TcxGridDBBandedColumn
        Caption = 'Roteiro Novo'
        DataBinding.FieldName = 'COD_ROTEIRO_NOVO'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 91
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1COD_ENTREGADOR: TcxGridDBBandedColumn
        Caption = 'C'#243'd. Entregador'
        DataBinding.FieldName = 'COD_ENTREGADOR'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 90
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1DES_ENTREGADOR: TcxGridDBBandedColumn
        Caption = 'Nome Entregador'
        DataBinding.FieldName = 'DES_ENTREGADOR'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 145
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1DES_STATUS_1: TcxGridDBBandedColumn
        Caption = '**'
        DataBinding.FieldName = 'DES_STATUS_1'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Alignment.Horz = taCenter
        Properties.DropDownListStyle = lsEditFixedList
        Properties.Items.Strings = (
          ' '
          'P'
          'PAR'
          'FALTA'
          'F'#201'RIAS'
          'FOLGA'
          'INSS'
          'ATES'
          'SUS'
          'LINC'
          'DOB'
          '')
        Visible = False
        HeaderAlignmentHorz = taCenter
        Width = 85
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1DES_STATUS_2: TcxGridDBBandedColumn
        Caption = '**'
        DataBinding.FieldName = 'DES_STATUS_2'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Alignment.Horz = taCenter
        Properties.DropDownListStyle = lsEditFixedList
        Properties.Items.Strings = (
          ' '
          'P'
          'PAR'
          'FALTA'
          'F'#201'RIAS'
          'FOLGA'
          'INSS'
          'ATES'
          'SUS'
          'LINC'
          'DOB'
          '')
        Visible = False
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 1
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1DES_STATUS_3: TcxGridDBBandedColumn
        Caption = '**'
        DataBinding.FieldName = 'DES_STATUS_3'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Alignment.Horz = taCenter
        Properties.DropDownListStyle = lsEditFixedList
        Properties.Items.Strings = (
          ' '
          'P'
          'PAR'
          'FALTA'
          'F'#201'RIAS'
          'FOLGA'
          'INSS'
          'ATES'
          'SUS'
          'LINC'
          'DOB'
          '')
        Visible = False
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 1
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1DES_STATUS_4: TcxGridDBBandedColumn
        Caption = '**'
        DataBinding.FieldName = 'DES_STATUS_4'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Alignment.Horz = taCenter
        Properties.DropDownListStyle = lsEditFixedList
        Properties.Items.Strings = (
          ' '
          'P'
          'PAR'
          'FALTA'
          'F'#201'RIAS'
          'FOLGA'
          'INSS'
          'ATES'
          'SUS'
          'LINC'
          'DOB'
          '')
        Visible = False
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 1
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1DES_STATUS_5: TcxGridDBBandedColumn
        Caption = '**'
        DataBinding.FieldName = 'DES_STATUS_5'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Alignment.Horz = taCenter
        Properties.DropDownListStyle = lsEditFixedList
        Properties.Items.Strings = (
          ' '
          'P'
          'PAR'
          'FALTA'
          'F'#201'RIAS'
          'FOLGA'
          'INSS'
          'ATES'
          'SUS'
          'LINC'
          'DOB'
          '')
        Visible = False
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 1
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1DES_STATUS_6: TcxGridDBBandedColumn
        Caption = '**'
        DataBinding.FieldName = 'DES_STATUS_6'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Alignment.Horz = taCenter
        Properties.DropDownListStyle = lsEditFixedList
        Properties.Items.Strings = (
          ' '
          'P'
          'PAR'
          'FALTA'
          'F'#201'RIAS'
          'FOLGA'
          'INSS'
          'ATES'
          'SUS'
          'LINC'
          'DOB'
          '')
        Visible = False
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 1
        Position.ColIndex = 5
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1DES_STATUS_7: TcxGridDBBandedColumn
        Caption = '**'
        DataBinding.FieldName = 'DES_STATUS_7'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Alignment.Horz = taCenter
        Properties.DropDownListStyle = lsEditFixedList
        Properties.Items.Strings = (
          ' '
          'P'
          'PAR'
          'FALTA'
          'F'#201'RIAS'
          'FOLGA'
          'INSS'
          'ATES'
          'SUS'
          'LINC'
          'DOB'
          '')
        Visible = False
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 1
        Position.ColIndex = 6
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1DES_STATUS_8: TcxGridDBBandedColumn
        Caption = '**'
        DataBinding.FieldName = 'DES_STATUS_8'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Alignment.Horz = taCenter
        Properties.DropDownListStyle = lsEditFixedList
        Properties.Items.Strings = (
          ' '
          'P'
          'PAR'
          'FALTA'
          'F'#201'RIAS'
          'FOLGA'
          'INSS'
          'ATES'
          'SUS'
          'LINC'
          'DOB'
          '')
        Visible = False
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 1
        Position.ColIndex = 7
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1DES_STATUS_9: TcxGridDBBandedColumn
        Caption = '**'
        DataBinding.FieldName = 'DES_STATUS_9'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Alignment.Horz = taCenter
        Properties.DropDownListStyle = lsEditFixedList
        Properties.Items.Strings = (
          ' '
          'P'
          'PAR'
          'FALTA'
          'F'#201'RIAS'
          'FOLGA'
          'INSS'
          'ATES'
          'SUS'
          'LINC'
          'DOB'
          '')
        Visible = False
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 1
        Position.ColIndex = 8
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1DES_STATUS_10: TcxGridDBBandedColumn
        Caption = '**'
        DataBinding.FieldName = 'DES_STATUS_10'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Alignment.Horz = taCenter
        Properties.DropDownListStyle = lsEditFixedList
        Properties.Items.Strings = (
          ' '
          'P'
          'PAR'
          'FALTA'
          'F'#201'RIAS'
          'FOLGA'
          'INSS'
          'ATES'
          'SUS'
          'LINC'
          'DOB'
          '')
        Visible = False
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 1
        Position.ColIndex = 9
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1DES_STATUS_11: TcxGridDBBandedColumn
        Caption = '**'
        DataBinding.FieldName = 'DES_STATUS_11'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Alignment.Horz = taCenter
        Properties.DropDownListStyle = lsEditFixedList
        Properties.Items.Strings = (
          ' '
          'P'
          'PAR'
          'FALTA'
          'F'#201'RIAS'
          'FOLGA'
          'INSS'
          'ATES'
          'SUS'
          'LINC'
          'DOB'
          '')
        Visible = False
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 1
        Position.ColIndex = 10
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1DES_STATUS_12: TcxGridDBBandedColumn
        Caption = '**'
        DataBinding.FieldName = 'DES_STATUS_12'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Alignment.Horz = taCenter
        Properties.DropDownListStyle = lsEditFixedList
        Properties.Items.Strings = (
          ' '
          'P'
          'PAR'
          'FALTA'
          'F'#201'RIAS'
          'FOLGA'
          'INSS'
          'ATES'
          'SUS'
          'LINC'
          'DOB'
          '')
        Visible = False
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 1
        Position.ColIndex = 11
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1DES_STATUS_13: TcxGridDBBandedColumn
        Caption = '**'
        DataBinding.FieldName = 'DES_STATUS_13'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Alignment.Horz = taCenter
        Properties.DropDownListStyle = lsEditFixedList
        Properties.Items.Strings = (
          ' '
          'P'
          'PAR'
          'FALTA'
          'F'#201'RIAS'
          'FOLGA'
          'INSS'
          'ATES'
          'SUS'
          'LINC'
          'DOB'
          '')
        Visible = False
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 1
        Position.ColIndex = 12
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1DES_STATUS_14: TcxGridDBBandedColumn
        Caption = '**'
        DataBinding.FieldName = 'DES_STATUS_14'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Alignment.Horz = taCenter
        Properties.DropDownListStyle = lsEditFixedList
        Properties.Items.Strings = (
          ' '
          'P'
          'PAR'
          'FALTA'
          'F'#201'RIAS'
          'FOLGA'
          'INSS'
          'ATES'
          'SUS'
          'LINC'
          'DOB'
          '')
        Visible = False
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 1
        Position.ColIndex = 13
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1DES_STATUS_15: TcxGridDBBandedColumn
        Caption = '**'
        DataBinding.FieldName = 'DES_STATUS_15'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Alignment.Horz = taCenter
        Properties.DropDownListStyle = lsEditFixedList
        Properties.Items.Strings = (
          ' '
          'P'
          'PAR'
          'FALTA'
          'F'#201'RIAS'
          'FOLGA'
          'INSS'
          'ATES'
          'SUS'
          'LINC'
          'DOB'
          '')
        Visible = False
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 1
        Position.ColIndex = 14
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1DES_STATUS_16: TcxGridDBBandedColumn
        Caption = '**'
        DataBinding.FieldName = 'DES_STATUS_16'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Alignment.Horz = taCenter
        Properties.DropDownListStyle = lsEditFixedList
        Properties.Items.Strings = (
          ' '
          'P'
          'PAR'
          'FALTA'
          'F'#201'RIAS'
          'FOLGA'
          'INSS'
          'ATES'
          'SUS'
          'LINC'
          'DOB'
          '')
        Visible = False
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 1
        Position.ColIndex = 15
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1DES_STATUS_17: TcxGridDBBandedColumn
        Caption = '**'
        DataBinding.FieldName = 'DES_STATUS_17'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Alignment.Horz = taCenter
        Properties.DropDownListStyle = lsEditFixedList
        Properties.Items.Strings = (
          ' '
          'P'
          'PAR'
          'FALTA'
          'F'#201'RIAS'
          'FOLGA'
          'INSS'
          'ATES'
          'SUS'
          'LINC'
          'DOB'
          '')
        Visible = False
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 1
        Position.ColIndex = 16
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1DES_STATUS_18: TcxGridDBBandedColumn
        Caption = '**'
        DataBinding.FieldName = 'DES_STATUS_18'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Alignment.Horz = taCenter
        Properties.DropDownListStyle = lsEditFixedList
        Properties.Items.Strings = (
          ' '
          'P'
          'PAR'
          'FALTA'
          'F'#201'RIAS'
          'FOLGA'
          'INSS'
          'ATES'
          'SUS'
          'LINC'
          'DOB'
          '')
        Visible = False
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 1
        Position.ColIndex = 17
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1DES_STATUS_19: TcxGridDBBandedColumn
        Caption = '**'
        DataBinding.FieldName = 'DES_STATUS_19'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Alignment.Horz = taCenter
        Properties.DropDownListStyle = lsEditFixedList
        Properties.Items.Strings = (
          ' '
          'P'
          'PAR'
          'FALTA'
          'F'#201'RIAS'
          'FOLGA'
          'INSS'
          'ATES'
          'SUS'
          'LINC'
          'DOB'
          '')
        Visible = False
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 1
        Position.ColIndex = 18
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1DES_STATUS_20: TcxGridDBBandedColumn
        Caption = '**'
        DataBinding.FieldName = 'DES_STATUS_20'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Alignment.Horz = taCenter
        Properties.DropDownListStyle = lsEditFixedList
        Properties.Items.Strings = (
          ' '
          'P'
          'PAR'
          'FALTA'
          'F'#201'RIAS'
          'FOLGA'
          'INSS'
          'ATES'
          'SUS'
          'LINC'
          'DOB'
          '')
        Visible = False
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 1
        Position.ColIndex = 19
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1DES_STATUS_21: TcxGridDBBandedColumn
        Caption = '**'
        DataBinding.FieldName = 'DES_STATUS_21'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Alignment.Horz = taCenter
        Properties.DropDownListStyle = lsEditFixedList
        Properties.Items.Strings = (
          ' '
          'P'
          'PAR'
          'FALTA'
          'F'#201'RIAS'
          'FOLGA'
          'INSS'
          'ATES'
          'SUS'
          'LINC'
          'DOB'
          '')
        Visible = False
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 1
        Position.ColIndex = 20
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1DES_STATUS_22: TcxGridDBBandedColumn
        Caption = '**'
        DataBinding.FieldName = 'DES_STATUS_22'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Alignment.Horz = taCenter
        Properties.DropDownListStyle = lsEditFixedList
        Properties.Items.Strings = (
          ' '
          'P'
          'PAR'
          'FALTA'
          'F'#201'RIAS'
          'FOLGA'
          'INSS'
          'ATES'
          'SUS'
          'LINC'
          'DOB'
          '')
        Visible = False
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 1
        Position.ColIndex = 21
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1DES_STATUS_23: TcxGridDBBandedColumn
        Caption = '**'
        DataBinding.FieldName = 'DES_STATUS_23'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Alignment.Horz = taCenter
        Properties.DropDownListStyle = lsEditFixedList
        Properties.Items.Strings = (
          ' '
          'P'
          'PAR'
          'FALTA'
          'F'#201'RIAS'
          'FOLGA'
          'INSS'
          'ATES'
          'SUS'
          'LINC'
          'DOB'
          '')
        Visible = False
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 1
        Position.ColIndex = 22
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1DES_STATUS_24: TcxGridDBBandedColumn
        Caption = '**'
        DataBinding.FieldName = 'DES_STATUS_24'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Alignment.Horz = taCenter
        Properties.DropDownListStyle = lsEditFixedList
        Properties.Items.Strings = (
          ' '
          'P'
          'PAR'
          'FALTA'
          'F'#201'RIAS'
          'FOLGA'
          'INSS'
          'ATES'
          'SUS'
          'LINC'
          'DOB'
          '')
        Visible = False
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 1
        Position.ColIndex = 23
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1DES_STATUS_25: TcxGridDBBandedColumn
        Caption = '**'
        DataBinding.FieldName = 'DES_STATUS_25'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Alignment.Horz = taCenter
        Properties.DropDownListStyle = lsEditFixedList
        Properties.Items.Strings = (
          ' '
          'P'
          'PAR'
          'FALTA'
          'F'#201'RIAS'
          'FOLGA'
          'INSS'
          'ATES'
          'SUS'
          'LINC'
          'DOB'
          '')
        Visible = False
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 1
        Position.ColIndex = 24
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1DES_STATUS_26: TcxGridDBBandedColumn
        Caption = '**'
        DataBinding.FieldName = 'DES_STATUS_26'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Alignment.Horz = taCenter
        Properties.DropDownListStyle = lsEditFixedList
        Properties.Items.Strings = (
          ' '
          'P'
          'PAR'
          'FALTA'
          'F'#201'RIAS'
          'FOLGA'
          'INSS'
          'ATES'
          'SUS'
          'LINC'
          'DOB'
          '')
        Visible = False
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 1
        Position.ColIndex = 25
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1DES_STATUS_27: TcxGridDBBandedColumn
        Caption = '**'
        DataBinding.FieldName = 'DES_STATUS_27'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Alignment.Horz = taCenter
        Properties.DropDownListStyle = lsEditFixedList
        Properties.Items.Strings = (
          ' '
          'P'
          'PAR'
          'FALTA'
          'F'#201'RIAS'
          'FOLGA'
          'INSS'
          'ATES'
          'SUS'
          'LINC'
          'DOB'
          '')
        Visible = False
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 1
        Position.ColIndex = 26
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1DES_STATUS_28: TcxGridDBBandedColumn
        Caption = '**'
        DataBinding.FieldName = 'DES_STATUS_28'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Alignment.Horz = taCenter
        Properties.DropDownListStyle = lsEditFixedList
        Properties.Items.Strings = (
          ' '
          'P'
          'PAR'
          'FALTA'
          'F'#201'RIAS'
          'FOLGA'
          'INSS'
          'ATES'
          'SUS'
          'LINC'
          'DOB'
          '')
        Visible = False
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 1
        Position.ColIndex = 27
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1DES_STATUS_29: TcxGridDBBandedColumn
        Caption = '**'
        DataBinding.FieldName = 'DES_STATUS_29'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Alignment.Horz = taCenter
        Properties.DropDownListStyle = lsEditFixedList
        Properties.Items.Strings = (
          ' '
          'P'
          'PAR'
          'FALTA'
          'F'#201'RIAS'
          'FOLGA'
          'INSS'
          'ATES'
          'SUS'
          'LINC'
          'DOB'
          '')
        Visible = False
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 1
        Position.ColIndex = 28
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1DES_STATUS_30: TcxGridDBBandedColumn
        Caption = '**'
        DataBinding.FieldName = 'DES_STATUS_30'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Alignment.Horz = taCenter
        Properties.DropDownListStyle = lsEditFixedList
        Properties.Items.Strings = (
          ' '
          'P'
          'PAR'
          'FALTA'
          'F'#201'RIAS'
          'FOLGA'
          'INSS'
          'ATES'
          'SUS'
          'LINC'
          'DOB'
          '')
        Visible = False
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 1
        Position.ColIndex = 29
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1DES_STATUS_31: TcxGridDBBandedColumn
        Caption = '**'
        DataBinding.FieldName = 'DES_STATUS_31'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Alignment.Horz = taCenter
        Properties.DropDownListStyle = lsEditFixedList
        Properties.Items.Strings = (
          ' '
          'P'
          'PAR'
          'FALTA'
          'F'#201'RIAS'
          'FOLGA'
          'INSS'
          'ATES'
          'SUS'
          'LINC'
          'DOB'
          '')
        Visible = False
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 1
        Position.ColIndex = 30
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1DES_CHAVE: TcxGridDBBandedColumn
        DataBinding.FieldName = 'DES_CHAVE'
        Visible = False
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object cxGrid1DBBandedTableView1NUM_ORDEM: TcxGridDBBandedColumn
        DataBinding.FieldName = 'NUM_ORDEM'
        Visible = False
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBBandedTableView1
    end
  end
  object cxButton5: TcxButton
    Left = 84
    Top = 497
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Action = actPresenca
    Anchors = [akLeft, akBottom]
    TabOrder = 6
  end
  object ds: TDataSource
    DataSet = tbOperacionalJornal
    Left = 824
    Top = 4
  end
  object aclOperacional: TActionList
    Images = dm.cxImageList1
    Left = 696
    object actRepositor: TAction
      Category = 'Planilha Operacional'
      Caption = 'Repositor'
      Hint = 'Visualizar Repositor'
      ImageIndex = 57
    end
    object actExecutar: TAction
      Category = 'Planilha Operacional'
      Caption = 'Executar'
      Hint = 'Executar planilha operacional'
      ImageIndex = 27
      OnExecute = actExecutarExecute
    end
    object actSair: TAction
      Category = 'Planilha Operacional'
      Caption = 'Sair'
      Hint = 'Sair e fechar a tela'
      ImageIndex = 10
      OnExecute = actSairExecute
    end
    object actPresenca: TAction
      Category = 'Planilha Operacional'
      Caption = 'Presen'#231'a'
      Hint = 'Marcar Presen'#231'a'
      ImageIndex = 51
      OnExecute = actPresencaExecute
    end
    object actProcessar: TAction
      Category = 'Planilha Operacional'
      Caption = 'Processar'
      Hint = 'Processar Demonstrativo'
      ImageIndex = 0
      OnExecute = actProcessarExecute
    end
    object actGravar: TAction
      Category = 'Planilha Operacional'
      Caption = 'Gravar'
      Hint = 'Gravar os dados'
      ImageIndex = 9
      OnExecute = actGravarExecute
    end
  end
  object dsEntregador: TDataSource
    AutoEdit = False
    DataSet = dm.tbListaEntregadores
    OnStateChange = dsEntregadorStateChange
    Left = 760
  end
  object tbOperacionalJornal: TdxMemData
    Indexes = <
      item
        FieldName = 'DES_CHAVE'
        SortOptions = []
      end
      item
        FieldName = 'COD_ENTREGADOR'
        SortOptions = []
      end>
    SortOptions = []
    AfterPost = tbOperacionalJornalAfterPost
    Left = 864
    Top = 6
    object tbOperacionalJornalCOD_ROTEIRO_ANTIGO: TStringField
      DisplayWidth = 100
      FieldName = 'COD_ROTEIRO_ANTIGO'
      Size = 100
    end
    object tbOperacionalJornalCOD_ROTEIRO_NOVO: TStringField
      FieldName = 'COD_ROTEIRO_NOVO'
      Size = 50
    end
    object tbOperacionalJornalCOD_ENTREGADOR: TIntegerField
      FieldName = 'COD_ENTREGADOR'
    end
    object tbOperacionalJornalDES_ENTREGADOR: TStringField
      FieldName = 'DES_ENTREGADOR'
      Size = 70
    end
    object tbOperacionalJornalDES_STATUS_1: TStringField
      FieldName = 'DES_STATUS_1'
    end
    object tbOperacionalJornalDES_STATUS_2: TStringField
      FieldName = 'DES_STATUS_2'
    end
    object tbOperacionalJornalDES_STATUS_3: TStringField
      FieldName = 'DES_STATUS_3'
    end
    object tbOperacionalJornalDES_STATUS_4: TStringField
      FieldName = 'DES_STATUS_4'
    end
    object tbOperacionalJornalDES_STATUS_5: TStringField
      FieldName = 'DES_STATUS_5'
    end
    object tbOperacionalJornalDES_STATUS_6: TStringField
      FieldName = 'DES_STATUS_6'
    end
    object tbOperacionalJornalDES_STATUS_7: TStringField
      FieldName = 'DES_STATUS_7'
    end
    object tbOperacionalJornalDES_STATUS_8: TStringField
      FieldName = 'DES_STATUS_8'
    end
    object tbOperacionalJornalDES_STATUS_9: TStringField
      FieldName = 'DES_STATUS_9'
    end
    object tbOperacionalJornalDES_STATUS_10: TStringField
      FieldName = 'DES_STATUS_10'
    end
    object tbOperacionalJornalDES_STATUS_11: TStringField
      FieldName = 'DES_STATUS_11'
    end
    object tbOperacionalJornalDES_STATUS_12: TStringField
      FieldName = 'DES_STATUS_12'
    end
    object tbOperacionalJornalDES_STATUS_13: TStringField
      FieldName = 'DES_STATUS_13'
    end
    object tbOperacionalJornalDES_STATUS_14: TStringField
      FieldName = 'DES_STATUS_14'
    end
    object tbOperacionalJornalDES_STATUS_15: TStringField
      FieldName = 'DES_STATUS_15'
    end
    object tbOperacionalJornalDES_STATUS_16: TStringField
      FieldName = 'DES_STATUS_16'
    end
    object tbOperacionalJornalDES_STATUS_17: TStringField
      FieldName = 'DES_STATUS_17'
    end
    object tbOperacionalJornalDES_STATUS_18: TStringField
      FieldName = 'DES_STATUS_18'
    end
    object tbOperacionalJornalDES_STATUS_19: TStringField
      FieldName = 'DES_STATUS_19'
    end
    object tbOperacionalJornalDES_STATUS_20: TStringField
      FieldName = 'DES_STATUS_20'
    end
    object tbOperacionalJornalDES_STATUS_21: TStringField
      FieldName = 'DES_STATUS_21'
    end
    object tbOperacionalJornalDES_STATUS_22: TStringField
      FieldName = 'DES_STATUS_22'
    end
    object tbOperacionalJornalDES_STATUS_23: TStringField
      FieldName = 'DES_STATUS_23'
    end
    object tbOperacionalJornalDES_STATUS_24: TStringField
      FieldName = 'DES_STATUS_24'
    end
    object tbOperacionalJornalDES_STATUS_25: TStringField
      FieldName = 'DES_STATUS_25'
    end
    object tbOperacionalJornalDES_STATUS_26: TStringField
      FieldName = 'DES_STATUS_26'
    end
    object tbOperacionalJornalDES_STATUS_27: TStringField
      FieldName = 'DES_STATUS_27'
    end
    object tbOperacionalJornalDES_STATUS_28: TStringField
      FieldName = 'DES_STATUS_28'
    end
    object tbOperacionalJornalDES_STATUS_29: TStringField
      FieldName = 'DES_STATUS_29'
    end
    object tbOperacionalJornalDES_STATUS_30: TStringField
      FieldName = 'DES_STATUS_30'
    end
    object tbOperacionalJornalDES_STATUS_31: TStringField
      FieldName = 'DES_STATUS_31'
    end
    object tbOperacionalJornalDES_CHAVE: TStringField
      DisplayWidth = 256
      FieldName = 'DES_CHAVE'
      Size = 256
    end
    object tbOperacionalJornalNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
    end
  end
  object tbReposicao: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 936
    Top = 8
    object tbReposicaoCOD_ENTREGADOR: TIntegerField
      FieldName = 'COD_ENTREGADOR'
    end
    object tbReposicaoCOD_ROTEIRO_ANTIGO: TStringField
      FieldName = 'COD_ROTEIRO_ANTIGO'
      Size = 100
    end
    object tbReposicaoDAT_OPERACAO: TDateField
      FieldName = 'DAT_OPERACAO'
    end
    object tbReposicaoCOD_STATUS_OPERACAO: TStringField
      FieldName = 'COD_STATUS_OPERACAO'
      Size = 50
    end
    object tbReposicaoCOD_ROTEIRO_NOVO: TStringField
      FieldName = 'COD_ROTEIRO_NOVO'
      Size = 50
    end
    object tbReposicaoDES_OBSERVACOES: TStringField
      FieldName = 'DES_OBSERVACOES'
      Size = 256
    end
    object tbReposicaoDOM_PLANILHA: TStringField
      FieldName = 'DOM_PLANILHA'
      Size = 1
    end
    object tbReposicaoDES_LOG: TMemoField
      FieldName = 'DES_LOG'
      BlobType = ftMemo
    end
    object tbReposicaoID_REFERENCIA: TIntegerField
      FieldName = 'ID_REFERENCIA'
    end
    object tbReposicaoDAT_REFERENCIA: TDateField
      FieldName = 'DAT_REFERENCIA'
    end
  end
end
