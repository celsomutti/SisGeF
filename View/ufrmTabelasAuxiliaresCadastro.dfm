object frmTabelasAuxiliaresCadastro: TfrmTabelasAuxiliaresCadastro
  Left = 0
  Top = 0
  Caption = 'Tabelas Auxiliares de Cadastro'
  ClientHeight = 760
  ClientWidth = 921
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel27: TcxLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alTop
    AutoSize = False
    Caption = 'Tabelas Auxiliares de Cadastro'
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
    Width = 915
    AnchorY = 22
  end
  object lcMain: TdxLayoutControl
    Left = 0
    Top = 44
    Width = 921
    Height = 716
    Align = alClient
    TabOrder = 1
    LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
    OptionsImage.Images = dm.cxImageList1
    ExplicitHeight = 680
    object grdTipoCadastro: TcxGrid
      Left = 20
      Top = 43
      Width = 250
      Height = 158
      TabOrder = 0
      object tvTipoCadastro: TcxGridDBTableView
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
        DataController.DataSource = dsTipoCadastro
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsData.DeletingConfirmation = False
        OptionsSelection.InvertSelect = False
        OptionsSelection.MultiSelect = True
        OptionsSelection.CellMultiSelect = True
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        object tvTipoCadastroCOD_TIPO: TcxGridDBColumn
          DataBinding.FieldName = 'COD_TIPO'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.IgnoreMaskBlank = True
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d\d\d\d\d\d'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          SortIndex = 0
          SortOrder = soAscending
        end
        object tvTipoCadastroDES_TIPO: TcxGridDBColumn
          DataBinding.FieldName = 'DES_TIPO'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
        end
        object tvTipoCadastroDOM_PESSOA: TcxGridDBColumn
          DataBinding.FieldName = 'DOM_PESSOA'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.Images = dm.cxImageList1
          Properties.Items = <
            item
              Description = 'Todos'
              ImageIndex = 0
              Value = 0
            end
            item
              Description = 'F'#237'sica'
              ImageIndex = 17
              Value = 1
            end
            item
              Description = 'Jur'#237'dica'
              ImageIndex = 55
              Value = 2
            end>
          HeaderAlignmentHorz = taCenter
        end
        object tvTipoCadastroDOM_RH: TcxGridDBColumn
          DataBinding.FieldName = 'DOM_RH'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.NullStyle = nssUnchecked
          HeaderAlignmentHorz = taCenter
        end
        object tvTipoCadastroDOM_JORNAL: TcxGridDBColumn
          DataBinding.FieldName = 'DOM_JORNAL'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.NullStyle = nssUnchecked
          HeaderAlignmentHorz = taCenter
        end
        object tvTipoCadastroDOM_EXPRESSAS: TcxGridDBColumn
          Caption = 'Expressas'
          DataBinding.FieldName = 'DOM_EXPRESSAS'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.NullStyle = nssUnchecked
          HeaderAlignmentHorz = taCenter
        end
        object tvTipoCadastroDES_LOG: TcxGridDBColumn
          DataBinding.FieldName = 'DES_LOG'
          PropertiesClassName = 'TcxBlobEditProperties'
          Properties.BlobEditKind = bekMemo
          HeaderAlignmentHorz = taCenter
        end
      end
      object lvTipoCadastro: TcxGridLevel
        GridView = tvTipoCadastro
      end
    end
    object grdDepartamentos: TcxGrid
      Left = 20
      Top = 253
      Width = 605
      Height = 100
      TabOrder = 1
      object tvDepartamentos: TcxGridDBTableView
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
        DataController.DataSource = dsDepartamento
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsData.DeletingConfirmation = False
        OptionsSelection.InvertSelect = False
        OptionsSelection.MultiSelect = True
        OptionsSelection.CellMultiSelect = True
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        object tvDepartamentosRecId: TcxGridDBColumn
          DataBinding.FieldName = 'RecId'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvDepartamentosCOD_DEPARTAMENTO: TcxGridDBColumn
          DataBinding.FieldName = 'COD_DEPARTAMENTO'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.IgnoreMaskBlank = True
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d\d\d\d\d\d'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          SortIndex = 0
          SortOrder = soAscending
          Width = 80
        end
        object tvDepartamentosDES_DEPARTAMENTO: TcxGridDBColumn
          DataBinding.FieldName = 'DES_DEPARTAMENTO'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 729
        end
        object tvDepartamentosDES_LOG: TcxGridDBColumn
          DataBinding.FieldName = 'DES_LOG'
          PropertiesClassName = 'TcxBlobEditProperties'
          Properties.BlobEditKind = bekMemo
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 70
        end
      end
      object lvDepartamentos: TcxGridLevel
        GridView = tvDepartamentos
      end
    end
    object grdFuncoes: TcxGrid
      Left = 20
      Top = 405
      Width = 250
      Height = 102
      TabOrder = 2
      object tvFuncoes: TcxGridDBTableView
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
        DataController.DataSource = dsFuncoes
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsData.DeletingConfirmation = False
        OptionsSelection.InvertSelect = False
        OptionsSelection.MultiSelect = True
        OptionsSelection.CellMultiSelect = True
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        object tvFuncoesRecId: TcxGridDBColumn
          DataBinding.FieldName = 'RecId'
          Visible = False
        end
        object tvFuncoesID_FUNCAO: TcxGridDBColumn
          DataBinding.FieldName = 'ID_FUNCAO'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d\d\d\d\d\d'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          SortIndex = 0
          SortOrder = soAscending
          Width = 102
        end
        object tvFuncoesDES_FUNCAO: TcxGridDBColumn
          DataBinding.FieldName = 'DES_FUNCAO'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 707
        end
        object tvFuncoesDES_LOG: TcxGridDBColumn
          DataBinding.FieldName = 'DES_LOG'
          PropertiesClassName = 'TcxBlobEditProperties'
          Properties.BlobEditKind = bekMemo
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 70
        end
      end
      object lvFuncoes: TcxGridLevel
        GridView = tvFuncoes
      end
    end
    object grdStatus: TcxGrid
      Left = 20
      Top = 559
      Width = 881
      Height = 98
      TabOrder = 3
      object tvStatus: TcxGridDBTableView
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
        DataController.DataSource = dsStatus
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsSelection.InvertSelect = False
        OptionsSelection.MultiSelect = True
        OptionsSelection.CellMultiSelect = True
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        object tvStatusRecId: TcxGridDBColumn
          DataBinding.FieldName = 'RecId'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvStatusID_STATUS: TcxGridDBColumn
          DataBinding.FieldName = 'ID_STATUS'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.IgnoreMaskBlank = True
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d\d\d\d\d\d'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          SortIndex = 0
          SortOrder = soAscending
          Width = 96
        end
        object tvStatusDES_STATUS: TcxGridDBColumn
          DataBinding.FieldName = 'DES_STATUS'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 636
        end
        object tvStatusDOM_ATIVO: TcxGridDBColumn
          Caption = 'Ativo'
          DataBinding.FieldName = 'DOM_ATIVO'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.NullStyle = nssUnchecked
          HeaderAlignmentHorz = taCenter
          Width = 73
        end
        object tvStatusDES_LOG: TcxGridDBColumn
          DataBinding.FieldName = 'DES_LOG'
          PropertiesClassName = 'TcxBlobEditProperties'
          Properties.BlobEditKind = bekMemo
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 74
        end
      end
      object lvStatus: TcxGridLevel
        GridView = tvStatus
      end
    end
    object cxButton1: TcxButton
      Left = 836
      Top = 681
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Action = aclFechar
      TabOrder = 4
    end
    object lcMainGroup_Root: TdxLayoutGroup
      AlignHorz = ahParentManaged
      AlignVert = avClient
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object lgTipoCadastro: TdxLayoutGroup
      Parent = lcMainGroup_Root
      CaptionOptions.ImageIndex = 28
      CaptionOptions.Text = 'Tipos de Cadastro'
      ButtonOptions.Buttons = <>
      ButtonOptions.ShowExpandButton = True
      Index = 0
    end
    object liGrdTipoCadastro: TdxLayoutItem
      Parent = lgTipoCadastro
      CaptionOptions.Text = 'Departamentos'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
      Control = grdTipoCadastro
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lcDepartamentos: TdxLayoutGroup
      Parent = lcMainGroup_Root
      CaptionOptions.ImageIndex = 28
      CaptionOptions.Text = 'Departamentos'
      ButtonOptions.Buttons = <>
      ButtonOptions.ShowExpandButton = True
      Index = 1
    end
    object liGrdDepartamento: TdxLayoutItem
      Parent = lcDepartamentos
      CaptionOptions.Text = 'Departamentos'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      Control = grdDepartamentos
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lgFuncoes: TdxLayoutGroup
      Parent = lcMainGroup_Root
      CaptionOptions.ImageIndex = 28
      CaptionOptions.Text = 'Fun'#231#245'es'
      ButtonOptions.Buttons = <>
      ButtonOptions.ShowExpandButton = True
      Index = 2
    end
    object liGrdFuncao: TdxLayoutItem
      Parent = lgFuncoes
      CaptionOptions.Text = 'Fun'#231#245'es'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      Control = grdFuncoes
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lgStatus: TdxLayoutGroup
      Parent = lcMainGroup_Root
      CaptionOptions.ImageIndex = 28
      CaptionOptions.Text = 'Status de Cadastro'
      ButtonOptions.Buttons = <>
      ButtonOptions.ShowExpandButton = True
      Index = 3
    end
    object lcMainItem3: TdxLayoutItem
      Parent = lgStatus
      CaptionOptions.Text = 'Status'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      Control = grdStatus
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lcMainItem1: TdxLayoutItem
      Parent = lcMainGroup_Root
      AlignHorz = ahRight
      AlignVert = avBottom
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = cxButton1
      ControlOptions.ShowBorder = False
      Index = 4
    end
  end
  object tbTipoCadastro: TdxMemData
    Indexes = <>
    SortOptions = []
    AfterInsert = tbTipoCadastroAfterInsert
    BeforePost = tbTipoCadastroBeforePost
    AfterPost = tbTipoCadastroAfterPost
    BeforeDelete = tbTipoCadastroBeforeDelete
    Left = 320
    Top = 8
    object tbTipoCadastroCOD_TIPO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_TIPO'
    end
    object tbTipoCadastroDES_TIPO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DES_TIPO'
      Size = 50
    end
    object tbTipoCadastroDOM_PESSOA: TIntegerField
      DisplayLabel = 'Pessoa'
      FieldName = 'DOM_PESSOA'
    end
    object tbTipoCadastroDOM_RH: TBooleanField
      DisplayLabel = 'RH'
      FieldName = 'DOM_RH'
    end
    object tbTipoCadastroDOM_JORNAL: TBooleanField
      DisplayLabel = 'Jornal'
      FieldName = 'DOM_JORNAL'
    end
    object tbTipoCadastroDOM_EXPRESSAS: TBooleanField
      DisplayLabel = 'Expressas'
      FieldName = 'DOM_EXPRESSAS'
    end
    object tbTipoCadastroDES_LOG: TMemoField
      DisplayLabel = 'LOG'
      FieldName = 'DES_LOG'
      BlobType = ftMemo
    end
  end
  object dsTipoCadastro: TDataSource
    AutoEdit = False
    DataSet = tbTipoCadastro
    Left = 360
    Top = 8
  end
  object dsDepartamento: TDataSource
    AutoEdit = False
    DataSet = tbDepartamentos
    Left = 464
    Top = 8
  end
  object tbDepartamentos: TdxMemData
    Indexes = <>
    SortOptions = []
    AfterInsert = tbDepartamentosAfterInsert
    BeforePost = tbDepartamentosBeforePost
    AfterPost = tbDepartamentosAfterPost
    BeforeDelete = tbDepartamentosBeforeDelete
    Left = 432
    Top = 8
    object tbDepartamentosCOD_DEPARTAMENTO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_DEPARTAMENTO'
    end
    object tbDepartamentosDES_DEPARTAMENTO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DES_DEPARTAMENTO'
      Size = 50
    end
    object tbDepartamentosDES_LOG: TMemoField
      DisplayLabel = 'LOG'
      FieldName = 'DES_LOG'
      BlobType = ftMemo
    end
  end
  object tbFuncoes: TdxMemData
    Indexes = <>
    SortOptions = []
    AfterInsert = tbFuncoesAfterInsert
    BeforePost = tbFuncoesBeforePost
    AfterPost = tbFuncoesAfterPost
    BeforeDelete = tbFuncoesBeforeDelete
    Left = 536
    Top = 8
    object tbFuncoesID_FUNCAO: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_FUNCAO'
    end
    object tbFuncoesDES_FUNCAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DES_FUNCAO'
      Size = 70
    end
    object tbFuncoesDES_LOG: TMemoField
      DisplayLabel = 'LOG'
      FieldName = 'DES_LOG'
      BlobType = ftMemo
    end
  end
  object tbStatus: TdxMemData
    Indexes = <>
    SortOptions = []
    AfterInsert = tbStatusAfterInsert
    BeforePost = tbStatusBeforePost
    AfterPost = tbStatusAfterPost
    BeforeDelete = tbStatusBeforeDelete
    Left = 656
    Top = 8
    object tbStatusID_STATUS: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_STATUS'
    end
    object tbStatusDES_STATUS: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DES_STATUS'
      Size = 70
    end
    object tbStatusDOM_ATIVO: TBooleanField
      DisplayLabel = 'Ativo'
      FieldName = 'DOM_ATIVO'
    end
    object tbStatusDES_LOG: TMemoField
      DisplayLabel = 'LOG'
      FieldName = 'DES_LOG'
      BlobType = ftMemo
    end
  end
  object dsFuncoes: TDataSource
    AutoEdit = False
    DataSet = tbFuncoes
    Left = 576
    Top = 8
  end
  object dsStatus: TDataSource
    AutoEdit = False
    DataSet = tbStatus
    Left = 696
    Top = 8
  end
  object aclTabelasAuxiliares: TActionList
    Images = dm.cxImageList1
    Left = 800
    Top = 16
    object aclFechar: TAction
      Category = 'Tabelas Auxiliares'
      Caption = 'Fechar'
      Hint = 'Fechar a tela'
      ImageIndex = 103
      OnExecute = aclFecharExecute
    end
  end
end
