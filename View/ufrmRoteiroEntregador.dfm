object frmRoteiroEntregador: TfrmRoteiroEntregador
  Left = 0
  Top = 0
  Caption = 'Roteiros do Jornal'
  ClientHeight = 546
  ClientWidth = 1218
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
  DesignSize = (
    1218
    546)
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 47
    Width = 1212
    Height = 458
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsRoteiro
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      EditForm.DefaultColumnCount = 1
      EditForm.DefaultStretch = fsHorizontal
      OptionsBehavior.CopyCaptionsToClipboard = False
      OptionsBehavior.CopyRecordsToClipboard = False
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.FocusFirstCellOnNewRecord = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.IncSearch = True
      OptionsBehavior.EditMode = emInplaceEditForm
      OptionsBehavior.FocusCellOnCycle = True
      OptionsCustomize.ColumnGrouping = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsSelection.InvertSelect = False
      OptionsSelection.MultiSelect = True
      OptionsSelection.CellMultiSelect = True
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object cxGrid1DBTableView1RecId: TcxGridDBColumn
        DataBinding.FieldName = 'RecId'
        Visible = False
      end
      object cxGrid1DBTableView1ID_ROTEIRO: TcxGridDBColumn
        Caption = 'ID'
        DataBinding.FieldName = 'ID_ROTEIRO'
        HeaderAlignmentHorz = taCenter
        Width = 55
      end
      object cxGrid1DBTableView1COD_ROTEIRO_ANTIGO: TcxGridDBColumn
        Caption = 'Roteiro Antigo'
        DataBinding.FieldName = 'COD_ROTEIRO_ANTIGO'
        HeaderAlignmentHorz = taCenter
        Width = 377
      end
      object cxGrid1DBTableView1COD_ROTEIRO_NOVO: TcxGridDBColumn
        Caption = 'Roteiro Novo'
        DataBinding.FieldName = 'COD_ROTEIRO_NOVO'
        HeaderAlignmentHorz = taCenter
        Width = 186
      end
      object cxGrid1DBTableView1COD_CADASTRO: TcxGridDBColumn
        DataBinding.FieldName = 'COD_CADASTRO'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'COD_CADASTRO'
        Properties.ListColumns = <
          item
            FieldName = 'DES_RAZAO_SOCIAL'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dsEntregadores
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Width = 363
      end
      object cxGrid1DBTableView1DES_ROTEIRO: TcxGridDBColumn
        Caption = 'Descri'#231#227'o'
        DataBinding.FieldName = 'DES_ROTEIRO'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        HeaderAlignmentHorz = taCenter
        Width = 158
      end
      object cxGrid1DBTableView1DOM_MOSTRAR: TcxGridDBColumn
        Caption = 'Operacional'
        DataBinding.FieldName = 'DOM_MOSTRAR'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 'S'
        Properties.ValueGrayed = 'Null'
        Properties.ValueUnchecked = 'N'
        Width = 38
      end
      object cxGrid1DBTableView1DES_LOG: TcxGridDBColumn
        DataBinding.FieldName = 'DES_LOG'
        Visible = False
        Width = 33
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object cxButton1: TcxButton
    Left = 3
    Top = 511
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Action = actIncluir
    Anchors = [akLeft, akBottom]
    TabOrder = 1
  end
  object cxButton2: TcxButton
    Left = 84
    Top = 511
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Action = actEditar
    Anchors = [akLeft, akBottom]
    TabOrder = 2
  end
  object cxButton4: TcxButton
    Left = 165
    Top = 511
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Action = actImportar
    Anchors = [akLeft, akBottom]
    TabOrder = 3
  end
  object cxButton5: TcxButton
    Left = 246
    Top = 511
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Action = actExportar
    Anchors = [akLeft, akBottom]
    TabOrder = 4
  end
  object cxButton7: TcxButton
    Left = 1140
    Top = 511
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Action = actSair
    Anchors = [akRight, akBottom]
    TabOrder = 5
  end
  object cxLabel27: TcxLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alTop
    AutoSize = False
    Caption = 'Roteiros do Jornal'
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
    Width = 1212
    AnchorY = 22
  end
  object dsRoteiro: TDataSource
    AutoEdit = False
    DataSet = tbRoteiroEntregador
    OnStateChange = dsRoteiroStateChange
    Left = 1080
    Top = 16
  end
  object dsEntregadores: TDataSource
    AutoEdit = False
    DataSet = tbListaEntregadores
    Left = 1080
    Top = 64
  end
  object aclRoteiro: TActionList
    Images = dm.cxImageList1
    Left = 1144
    Top = 24
    object actIncluir: TAction
      Category = 'Cadastro'
      Caption = 'Incluir'
      Hint = 'Incluir Roteiro'
      ImageIndex = 1
      ShortCut = 16457
      OnExecute = actIncluirExecute
    end
    object actEditar: TAction
      Category = 'Cadastro'
      Caption = 'Editar'
      Hint = 'Editar Roteiro'
      ImageIndex = 14
      ShortCut = 16453
      OnExecute = actEditarExecute
    end
    object actImportar: TAction
      Category = 'Cadastro'
      Caption = 'Importar'
      Hint = 'Importar Roteiros'
      ImageIndex = 33
      ShortCut = 16461
      OnExecute = actImportarExecute
    end
    object actExportar: TAction
      Category = 'Cadastro'
      Caption = 'Exportar'
      Hint = 'Exportar Roteiros'
      ImageIndex = 29
      ShortCut = 16472
      OnExecute = actExportarExecute
    end
    object actSair: TAction
      Category = 'Cadastro'
      Caption = 'Sair'
      Hint = 'Sair da Tela'
      ImageIndex = 10
      OnExecute = actSairExecute
    end
    object actPesquisar: TAction
      Category = 'Cadastro'
      Caption = 'Pesquisar'
      Hint = 'Lista de Apoio'
      ImageIndex = 11
    end
  end
  object OpenDialog: TOpenDialog
    Left = 1152
    Top = 80
  end
  object SaveDialog: TSaveDialog
    Left = 1152
    Top = 128
  end
  object tbRoteiroEntregador: TdxMemData
    Indexes = <>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F040000000400000003000D00434F445F4341444153
      54524F001400000014001300434F445F524F544549524F5F414E5449474F0014
      00000014001100434F445F524F544549524F5F4E4F564F000000000019000800
      4445535F4C4F4700}
    SortOptions = []
    BeforePost = tbRoteiroEntregadorBeforePost
    AfterPost = tbRoteiroEntregadorAfterPost
    Left = 1080
    Top = 126
    object tbRoteiroEntregadorID_ROTEIRO: TIntegerField
      FieldName = 'ID_ROTEIRO'
    end
    object tbRoteiroEntregadorCOD_ROTEIRO_ANTIGO: TWideStringField
      DisplayWidth = 50
      FieldName = 'COD_ROTEIRO_ANTIGO'
      Size = 50
    end
    object tbRoteiroEntregadorCOD_ROTEIRO_NOVO: TWideStringField
      FieldName = 'COD_ROTEIRO_NOVO'
      Size = 50
    end
    object tbRoteiroEntregadorCOD_CADASTRO: TIntegerField
      DisplayLabel = 'Entregador'
      FieldName = 'COD_CADASTRO'
    end
    object tbRoteiroEntregadorDES_ROTEIRO: TStringField
      DisplayWidth = 256
      FieldName = 'DES_ROTEIRO'
      Size = 256
    end
    object tbRoteiroEntregadorDOM_MOSTRAR: TStringField
      FieldName = 'DOM_MOSTRAR'
      Size = 1
    end
    object tbRoteiroEntregadorDES_LOG: TWideMemoField
      FieldName = 'DES_LOG'
      BlobType = ftWideMemo
    end
  end
  object tbListaEntregadores: TdxMemData
    Indexes = <
      item
        FieldName = 'COD_CADASTRO'
        SortOptions = []
      end>
    SortOptions = []
    Left = 1096
    Top = 202
    object tbListaEntregadoresCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
    end
    object tbListaEntregadoresDES_RAZAO_SOCIAL: TStringField
      FieldName = 'DES_RAZAO_SOCIAL'
      Size = 70
    end
  end
end
