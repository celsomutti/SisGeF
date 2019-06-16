object frmCepDistribuidores: TfrmCepDistribuidores
  Left = 0
  Top = 0
  Caption = 'CEP por Distribuidores'
  ClientHeight = 407
  ClientWidth = 764
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
    Caption = 'Faixas de CEP por Distribuidores'
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
    Width = 758
    AnchorY = 22
  end
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 44
    Width = 764
    Height = 363
    Align = alClient
    TabOrder = 1
    LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
    object grdCep: TcxGrid
      Left = 10
      Top = 28
      Width = 250
      Height = 293
      TabOrder = 0
      object tvCep: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.Images = dm.cxImageList1
        Navigator.Buttons.First.ImageIndex = 99
        Navigator.Buttons.PriorPage.Visible = False
        Navigator.Buttons.Prior.ImageIndex = 102
        Navigator.Buttons.Next.ImageIndex = 101
        Navigator.Buttons.NextPage.Visible = False
        Navigator.Buttons.Last.ImageIndex = 100
        Navigator.Buttons.Insert.ImageIndex = 1
        Navigator.Buttons.Append.Visible = False
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
        DataController.DataSource = dm.dsCepDistribuidor
        DataController.KeyFieldNames = 'ID_CEP'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NewItemRow.InfoText = 'Clique aqui para Incluir'
        NewItemRow.Visible = True
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.ColumnHeaderHints = False
        OptionsBehavior.FocusCellOnCycle = True
        OptionsSelection.InvertSelect = False
        OptionsSelection.MultiSelect = True
        OptionsSelection.CellMultiSelect = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        object tvCepID_CEP: TcxGridDBColumn
          Caption = 'ID'
          DataBinding.FieldName = 'ID_CEP'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.IgnoreMaskBlank = True
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d\d\d\d\d\d'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 70
        end
        object tvCepCOD_DISTRIBUIDOR: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'COD_DISTRIBUIDOR'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.IgnoreMaskBlank = True
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d\d\d\d\d\d'
          HeaderAlignmentHorz = taCenter
          Width = 94
        end
        object tvCepNOM_DISTRIBUIDOR: TcxGridDBColumn
          Caption = 'Nome do Distribuidor'
          DataBinding.FieldName = 'COD_DISTRIBUIDOR'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'COD_AGENTE'
          Properties.ListColumns = <
            item
              FieldName = 'NOM_FANTASIA'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dsAgentes
          HeaderAlignmentHorz = taCenter
          Width = 331
        end
        object tvCepDES_CEP_INICIAL: TcxGridDBColumn
          Caption = 'CEP Inicial'
          DataBinding.FieldName = 'DES_CEP_INICIAL'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.IgnoreMaskBlank = True
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d\d\d\d\d\d\d\d'
          HeaderAlignmentHorz = taCenter
          Width = 124
        end
        object tvCepDES_CEP_FINAL: TcxGridDBColumn
          Caption = 'CEP Final'
          DataBinding.FieldName = 'DES_CEP_FINAL'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.IgnoreMaskBlank = True
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d\d\d\d\d\d\d\d'
          HeaderAlignmentHorz = taCenter
          Width = 123
        end
        object tvCepDES_LOG: TcxGridDBColumn
          Caption = 'LOG'
          DataBinding.FieldName = 'DES_LOG'
          PropertiesClassName = 'TcxBlobEditProperties'
          Properties.BlobEditKind = bekMemo
          Properties.ReadOnly = True
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
      end
      object lvCep: TcxGridLevel
        GridView = tvCep
      end
    end
    object cxButton1: TcxButton
      Left = 679
      Top = 328
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Action = actSair
      TabOrder = 1
    end
    object lcMain: TdxLayoutGroup
      AlignHorz = ahParentManaged
      AlignVert = avParentManaged
      LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object dxLayoutControl1Item1: TdxLayoutItem
      Parent = lcMain
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'Faixas de CEP'
      CaptionOptions.Layout = clTop
      LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
      Control = grdCep
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item2: TdxLayoutItem
      Parent = lcMain
      AlignHorz = ahRight
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = cxButton1
      ControlOptions.ShowBorder = False
      Index = 1
    end
  end
  object aclCadastro: TActionList
    Images = dm.cxImageList1
    Left = 616
    Top = 24
    object actSair: TAction
      Category = 'Cadastro'
      Caption = 'Sair'
      Hint = 'Sair da tela'
      ImageIndex = 10
      OnExecute = actSairExecute
    end
  end
  object dsAgentes: TDataSource
    AutoEdit = False
    DataSet = dm.qryROAgentes
    Left = 680
    Top = 24
  end
end
