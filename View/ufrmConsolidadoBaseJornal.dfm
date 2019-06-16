object frmConsolidadoBaseJornal: TfrmConsolidadoBaseJornal
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Valor Consolidado por Base'
  ClientHeight = 378
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 418
    Height = 378
    Align = alClient
    TabOrder = 0
    LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
    object cxLabel27: TcxLabel
      AlignWithMargins = True
      Left = 10
      Top = 10
      AutoSize = False
      Caption = 'Valor Consolidado de Ocorr'#234'ncias'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -21
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.IsFontAssigned = True
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      Height = 39
      Width = 1011
      AnchorY = 30
    end
    object cxGrid1: TcxGrid
      Left = 10
      Top = 55
      Width = 250
      Height = 282
      TabOrder = 1
      object cxGrid1DBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsConsolidado
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = 'R$ ,0.00;-R$ ,0.00'
            Kind = skSum
            Column = cxGrid1DBTableView1VAL_OCORRENCIA
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.CopyCaptionsToClipboard = False
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsSelection.InvertSelect = False
        OptionsSelection.MultiSelect = True
        OptionsSelection.CellMultiSelect = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        object cxGrid1DBTableView1DES_ROTEIRO: TcxGridDBColumn
          Caption = 'Base'
          DataBinding.FieldName = 'DES_ROTEIRO'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 183
        end
        object cxGrid1DBTableView1VAL_OCORRENCIA: TcxGridDBColumn
          Caption = 'Total das Ocorr'#234'ncias'
          DataBinding.FieldName = 'VAL_OCORRENCIA'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ' ,0.00;- ,0.00'
          HeaderAlignmentHorz = taCenter
          Width = 213
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
    object cxButton1: TcxButton
      Left = 10
      Top = 343
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Action = actExportar
      TabOrder = 2
    end
    object cxButton2: TcxButton
      Left = 333
      Top = 343
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Action = actSair
      TabOrder = 3
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
      CaptionOptions.Visible = False
      LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
      Control = cxLabel27
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item2: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      CaptionOptions.Text = 'Consolidado'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
      Control = cxGrid1
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Item3: TdxLayoutItem
      Parent = dxLayoutControl1Group1
      AlignHorz = ahLeft
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
      Control = cxButton1
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item4: TdxLayoutItem
      Parent = dxLayoutControl1Group1
      AlignHorz = ahRight
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
      Control = cxButton2
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Group1: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutControl1Group_Root
      LayoutDirection = ldHorizontal
      Index = 2
      AutoCreated = True
    end
  end
  object aclConsolidadoBaseJornal: TActionList
    Images = dm.cxImageList1
    Left = 360
    Top = 56
    object actExportar: TAction
      Category = 'Consolidado'
      Caption = 'Exportar'
      Hint = 'Exportar Grade'
      ImageIndex = 29
      OnExecute = actExportarExecute
    end
    object actSair: TAction
      Category = 'Consolidado'
      Caption = 'Sair'
      Hint = 'Sair da Tela'
      ImageIndex = 10
      OnExecute = actSairExecute
    end
  end
  object SaveDialog: TSaveDialog
    Left = 360
    Top = 16
  end
  object dsConsolidado: TDataSource
    AutoEdit = False
    DataSet = dm.qryCalculo
    Left = 328
    Top = 16
  end
end
