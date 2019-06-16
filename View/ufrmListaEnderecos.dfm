object frmListaEnderecos: TfrmListaEnderecos
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Endere'#231'os Encontrados'
  ClientHeight = 333
  ClientWidth = 776
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  ShowHint = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lcEndereco: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 776
    Height = 333
    Align = alClient
    TabOrder = 0
    LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
    object grdEnderecos: TcxGrid
      Left = 10
      Top = 63
      Width = 250
      Height = 271
      TabOrder = 1
      object tvEnderecos: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.Images = dm.iml16x16
        Navigator.Buttons.First.ImageIndex = 19
        Navigator.Buttons.PriorPage.Visible = False
        Navigator.Buttons.Prior.ImageIndex = 22
        Navigator.Buttons.Prior.Visible = True
        Navigator.Buttons.Next.ImageIndex = 21
        Navigator.Buttons.NextPage.Visible = False
        Navigator.Buttons.Last.ImageIndex = 20
        Navigator.Buttons.Insert.Visible = False
        Navigator.Buttons.Delete.Visible = False
        Navigator.Buttons.Edit.Visible = False
        Navigator.Buttons.Post.Visible = False
        Navigator.Buttons.Cancel.Visible = False
        Navigator.Buttons.Refresh.Visible = False
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.Buttons.GotoBookmark.Visible = False
        Navigator.Buttons.Filter.Visible = False
        Navigator.InfoPanel.DisplayMask = '[RecordCount] endere'#231'os encontrados.'
        Navigator.InfoPanel.Visible = True
        Navigator.Visible = True
        DataController.DataSource = dsEnderecos
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.IncSearch = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.InvertSelect = False
        OptionsSelection.MultiSelect = True
        OptionsSelection.CellMultiSelect = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.Indicator = True
        object tvEnderecosRecId: TcxGridDBColumn
          DataBinding.FieldName = 'RecId'
          Visible = False
        end
        object tvEnderecosCOD_MODALIDADE: TcxGridDBColumn
          DataBinding.FieldName = 'COD_MODALIDADE'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'COD_MODALIDADE'
          Properties.ListColumns = <
            item
              FieldName = 'DES_MODALIDADE'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dsModalidades
          HeaderAlignmentHorz = taCenter
          Width = 132
        end
        object tvEnderecosNUM_CEP: TcxGridDBColumn
          DataBinding.FieldName = 'NUM_CEP'
          HeaderAlignmentHorz = taCenter
          Width = 75
        end
        object tvEnderecosDES_ENDERECO: TcxGridDBColumn
          DataBinding.FieldName = 'DES_ENDERECO'
          HeaderAlignmentHorz = taCenter
          Width = 535
        end
      end
      object lvEnderecos: TcxGridLevel
        GridView = tvEnderecos
      end
    end
    object cxButton2: TcxButton
      Left = 691
      Top = 298
      Width = 75
      Height = 25
      Action = actCancelar
      Cancel = True
      TabOrder = 3
    end
    object cxButton1: TcxButton
      Left = 610
      Top = 298
      Width = 75
      Height = 25
      Action = actSelecionar
      Default = True
      TabOrder = 2
    end
    object cxLabel1: TcxLabel
      AlignWithMargins = True
      Left = 10
      Top = 10
      AutoSize = False
      Caption = 
        'Mais de um registro foi encontado para este c'#243'digo de assinatura' +
        '. Selecione abaixo o Endere'#231'o/Modalidade a ser inserido na plani' +
        'lha de ocorr'#234'ncias.'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.TransparentBorder = True
      Style.IsFontAssigned = True
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Properties.WordWrap = True
      Transparent = True
      Height = 47
      Width = 1117
      AnchorX = 569
      AnchorY = 34
    end
    object lcgRoot: TdxLayoutGroup
      AlignHorz = ahParentManaged
      AlignVert = avParentManaged
      LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object lciEnderecos: TdxLayoutItem
      Parent = lcgRoot
      AlignVert = avClient
      CaptionOptions.Text = 'Endere'#231'os'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      Control = grdEnderecos
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lciCancelar: TdxLayoutItem
      Parent = lcEnderecoGroup1
      AlignHorz = ahRight
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      Control = cxButton2
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lciSelecionar: TdxLayoutItem
      Parent = lcEnderecoGroup1
      AlignHorz = ahRight
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = cxButton1
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lcEnderecoGroup1: TdxLayoutAutoCreatedGroup
      Parent = lcgRoot
      LayoutDirection = ldHorizontal
      Index = 2
      AutoCreated = True
    end
    object lcEnderecoItem1: TdxLayoutItem
      Parent = lcgRoot
      CaptionOptions.Text = 'cxLabel1'
      CaptionOptions.Visible = False
      Control = cxLabel1
      ControlOptions.ShowBorder = False
      Index = 0
    end
  end
  object tbEnderecos: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 720
    Top = 16
    object tbEnderecosCOD_MODALIDADE: TIntegerField
      DisplayLabel = 'Modalidade'
      FieldName = 'COD_MODALIDADE'
      LookupDataSet = tbModalidades
      LookupKeyFields = 'COD_MODALIDADE'
      LookupResultField = 'DES_MODALIDADE'
    end
    object tbEnderecosNUM_CEP: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'NUM_CEP'
      Size = 8
    end
    object tbEnderecosDES_ENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'DES_ENDERECO'
      Size = 256
    end
    object tbEnderecosID_ASSINATURA: TIntegerField
      FieldName = 'ID_ASSINATURA'
    end
  end
  object tbModalidades: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 656
    Top = 16
    object tbModalidadesCOD_MODALIDADE: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_MODALIDADE'
    end
    object tbModalidadesDES_MODALIDADE: TStringField
      DisplayLabel = 'Descri'#231'ao'
      FieldName = 'DES_MODALIDADE'
      Size = 50
    end
  end
  object dsEnderecos: TDataSource
    AutoEdit = False
    DataSet = tbEnderecos
    Left = 720
    Top = 64
  end
  object dsModalidades: TDataSource
    AutoEdit = False
    DataSet = tbModalidades
    Left = 664
    Top = 64
  end
  object aclEnderecos: TActionList
    Images = dm.iml16x16
    Left = 600
    Top = 16
    object actSelecionar: TAction
      Category = 'Endere'#231'os'
      Caption = 'Selecionar'
      Hint = 'Selecionar Endere'#231'o'
      ImageIndex = 3
      OnExecute = actSelecionarExecute
    end
    object actCancelar: TAction
      Category = 'Endere'#231'os'
      Caption = 'Cancelar'
      Hint = 'Cancelar'
      ImageIndex = 4
      OnExecute = actCancelarExecute
    end
  end
end
