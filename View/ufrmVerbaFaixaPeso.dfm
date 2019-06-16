object frmVerbaFaixaPeso: TfrmVerbaFaixaPeso
  Left = 0
  Top = 0
  Caption = 'Verba por Faixa de Peso'
  ClientHeight = 567
  ClientWidth = 903
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
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
    Caption = 'Verba por Faixa de Peso'
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
    Width = 897
    AnchorY = 22
  end
  object lcMain: TdxLayoutControl
    Left = 0
    Top = 44
    Width = 903
    Height = 523
    Align = alClient
    TabOrder = 1
    LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
    object grdFaixas: TcxGrid
      Left = 10
      Top = 28
      Width = 463
      Height = 218
      Images = dm.cxImageList1
      TabOrder = 0
      object tvFaixas: TcxGridDBTableView
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
        Navigator.Buttons.Cancel.ImageIndex = 6
        Navigator.Buttons.Refresh.ImageIndex = 40
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.Buttons.GotoBookmark.Visible = False
        Navigator.Buttons.Filter.Visible = False
        Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
        Navigator.InfoPanel.Visible = True
        Navigator.Visible = True
        DataController.DataSource = dm.dsFaixasPesos
        DataController.KeyFieldNames = 'ID_VERBA'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NewItemRow.InfoText = 'Clique aqui para incluir'
        NewItemRow.Visible = True
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.ColumnHeaderHints = False
        OptionsBehavior.FocusCellOnCycle = True
        OptionsView.NoDataToDisplayInfoText = '<Nenhuma Informa'#231#227'o Dispon'#237'vel>'
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        object tvFaixasID_VERBA: TcxGridDBColumn
          Caption = 'ID'
          DataBinding.FieldName = 'ID_VERBA'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.IgnoreMaskBlank = True
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d\d\d\d\d'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
        end
        object tvFaixasQTD_PESO_INICIAL: TcxGridDBColumn
          Caption = 'Peso Inicial'
          DataBinding.FieldName = 'QTD_PESO_INICIAL'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DecimalPlaces = 3
          Properties.DisplayFormat = ' ,0.000;- ,0.000'
          HeaderAlignmentHorz = taCenter
          Width = 121
        end
        object tvFaixasQTD_PESO_FINAL: TcxGridDBColumn
          Caption = 'Peso Final'
          DataBinding.FieldName = 'QTD_PESO_FINAL'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DecimalPlaces = 3
          Properties.DisplayFormat = ' ,0.000;- ,0.000'
          HeaderAlignmentHorz = taCenter
          Width = 167
        end
        object tvFaixasDES_LOG: TcxGridDBColumn
          Caption = 'LOG'
          DataBinding.FieldName = 'DES_LOG'
          PropertiesClassName = 'TcxBlobEditProperties'
          Properties.BlobEditKind = bekMemo
          Properties.ReadOnly = True
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
      end
      object lvFaixas: TcxGridLevel
        GridView = tvFaixas
      end
    end
    object grdVerbas: TcxGrid
      Left = 10
      Top = 270
      Width = 463
      Height = 211
      Images = dm.cxImageList1
      TabOrder = 1
      object tvVerbas: TcxGridDBTableView
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
        Navigator.Buttons.Cancel.ImageIndex = 6
        Navigator.Buttons.Refresh.ImageIndex = 40
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.Buttons.GotoBookmark.Visible = False
        Navigator.Buttons.Filter.Visible = False
        Navigator.Visible = True
        DataController.DataSource = dm.dsFaixaVerba
        DataController.KeyFieldNames = 'ID_FAIXA'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NewItemRow.InfoText = 'Clique aqui para incluir'
        NewItemRow.Visible = True
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsView.NoDataToDisplayInfoText = '<Nenhuma Infroma'#231#227'o Dispon'#237'vel>'
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        object tvVerbasID_FAIXA: TcxGridDBColumn
          Caption = 'Faixa'
          DataBinding.FieldName = 'ID_FAIXA'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.IgnoreMaskBlank = True
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d\d\d\d\d'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 94
        end
        object tvVerbasVAL_VERBA: TcxGridDBColumn
          Caption = 'Valor'
          DataBinding.FieldName = 'VAL_VERBA'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ' ,0.00;- ,0.00'
          HeaderAlignmentHorz = taCenter
          Width = 134
        end
        object tvVerbasDES_LOG: TcxGridDBColumn
          Caption = 'LOG'
          DataBinding.FieldName = 'DES_LOG'
          PropertiesClassName = 'TcxBlobEditProperties'
          Properties.BlobEditKind = bekMemo
          Properties.ReadOnly = True
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
      end
      object lvVerbas: TcxGridLevel
        GridView = tvVerbas
      end
    end
    object cxButton1: TcxButton
      Left = 804
      Top = 488
      Width = 89
      Height = 25
      Cursor = crHandPoint
      Action = actSair
      TabOrder = 2
    end
    object lcMainGroup_Root: TdxLayoutGroup
      AlignHorz = ahParentManaged
      AlignVert = avParentManaged
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object lcMainItem1: TdxLayoutItem
      Parent = lcMainGroup_Root
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Faixas de Peso'
      CaptionOptions.Layout = clTop
      LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
      Control = grdFaixas
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lcMainItem2: TdxLayoutItem
      Parent = lcMainGroup_Root
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Faixas de Verbas'
      CaptionOptions.Layout = clTop
      Control = grdVerbas
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lcMainItem3: TdxLayoutItem
      Parent = lcMainGroup_Root
      AlignHorz = ahRight
      AlignVert = avBottom
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = cxButton1
      ControlOptions.ShowBorder = False
      Index = 2
    end
  end
  object aclFaixaVerbas: TActionList
    Images = dm.cxImageList1
    Left = 656
    Top = 12
    object actSair: TAction
      Category = 'Cadastro'
      Caption = 'Sair'
      ImageIndex = 10
      OnExecute = actSairExecute
    end
  end
end
