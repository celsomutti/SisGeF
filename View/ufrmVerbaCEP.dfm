object frmVerbaCEP: TfrmVerbaCEP
  Left = 0
  Top = 0
  Caption = 'Verbas por CEP'
  ClientHeight = 454
  ClientWidth = 741
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
    Caption = 'Verbas por CEP'
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
    Width = 735
    AnchorY = 22
  end
  object lcMain: TdxLayoutControl
    Left = 0
    Top = 44
    Width = 741
    Height = 410
    Align = alClient
    TabOrder = 1
    LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
    object grdVerbaCEP: TcxGrid
      Left = 10
      Top = 10
      Width = 719
      Height = 359
      TabOrder = 0
      object tvVerbaCep: TcxGridDBTableView
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
        DataController.DataSource = dsCepVerba
        DataController.KeyFieldNames = 'ID_VERBA'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NewItemRow.InfoText = 'Clique aqui para incluir'
        NewItemRow.Visible = True
        OptionsBehavior.CopyCaptionsToClipboard = False
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsSelection.InvertSelect = False
        OptionsSelection.MultiSelect = True
        OptionsSelection.CellMultiSelect = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        object tvVerbaCepID_VERBA: TcxGridDBColumn
          Caption = 'ID'
          DataBinding.FieldName = 'ID_VERBA'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.IgnoreMaskBlank = True
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d\d\d\d\d\d'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 61
        end
        object tvVerbaCepNUM_CEP_INICIAL: TcxGridDBColumn
          Caption = 'CEP Inicial'
          DataBinding.FieldName = 'NUM_CEP_INICIAL'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.IgnoreMaskBlank = True
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d\d\d\d\d\d\d\d'
          HeaderAlignmentHorz = taCenter
          Width = 140
        end
        object tvVerbaCepNUM_CEP_FINAL: TcxGridDBColumn
          Caption = 'CEP Final'
          DataBinding.FieldName = 'NUM_CEP_FINAL'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.IgnoreMaskBlank = True
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d\d\d\d\d\d\d\d'
          HeaderAlignmentHorz = taCenter
          Width = 140
        end
        object tvVerbaCepVAL_VERBA: TcxGridDBColumn
          Caption = 'Verba Fixa'
          DataBinding.FieldName = 'VAL_VERBA'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ' ,0.00;- ,0.00'
          Properties.Nullable = False
          Properties.Nullstring = '0'
          Properties.UseNullString = True
          HeaderAlignmentHorz = taCenter
          Width = 108
        end
        object tvVerbaCepCOD_GRUPO: TcxGridDBColumn
          Caption = 'Grupo SLA'
          DataBinding.FieldName = 'COD_GRUPO'
          PropertiesClassName = 'TcxSpinEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 89
        end
        object tvVerbaCepID_FAIXA: TcxGridDBColumn
          Caption = 'Faixa Peso'
          DataBinding.FieldName = 'ID_FAIXA'
          PropertiesClassName = 'TcxSpinEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 90
        end
        object tvVerbaCepDES_LOG: TcxGridDBColumn
          Caption = 'LOG'
          DataBinding.FieldName = 'DES_LOG'
          PropertiesClassName = 'TcxBlobEditProperties'
          Properties.BlobEditKind = bekMemo
          Properties.ReadOnly = True
          Visible = False
          HeaderAlignmentHorz = taCenter
          Width = 89
        end
      end
      object lvVerbaCep: TcxGridLevel
        GridView = tvVerbaCep
      end
    end
    object cxButton1: TcxButton
      Left = 656
      Top = 375
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Action = actSair
      TabOrder = 1
    end
    object lcMainGroup_Root: TdxLayoutGroup
      AlignHorz = ahClient
      AlignVert = avClient
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object lcMainItem1: TdxLayoutItem
      Parent = lcMainGroup_Root
      AlignVert = avClient
      CaptionOptions.Text = 'cxGrid1'
      CaptionOptions.Visible = False
      Control = grdVerbaCEP
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lcMainItem2: TdxLayoutItem
      Parent = lcMainGroup_Root
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
    Left = 600
    Top = 8
    object actSair: TAction
      Category = 'Cadastro'
      Caption = 'Sair'
      Hint = 'Sair da Tela'
      ImageIndex = 10
      OnExecute = actSairExecute
    end
  end
  object dsCepVerba: TDataSource
    DataSet = dm.qryCepVerba
    OnStateChange = dsCepVerbaStateChange
    Left = 656
    Top = 16
  end
end
