object view_DigitacaoEncalheExpedicao: Tview_DigitacaoEncalheExpedicao
  Left = 0
  Top = 0
  Hint = 'Filtrar os dados'
  Caption = 'Digita'#231#227'o de Encalhes - Expedi'#231#227'o'
  ClientHeight = 546
  ClientWidth = 990
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lcEncalhe: TdxLayoutControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 984
    Height = 540
    Align = alClient
    TabOrder = 0
    LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
    object lblTitulo: TcxLabel
      Left = 10
      Top = 10
      Caption = 'Digita'#231#227'o de Encalhes - Expedi'#231#227'o'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -19
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.IsFontAssigned = True
      Transparent = True
    end
    object edtDataDevolucao: TcxDateEdit
      Left = 20
      Top = 85
      Hint = 'Data da Devolu'#231#227'o'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 1
      Width = 93
    end
    object mskCodigoBanca: TcxMaskEdit
      Left = 152
      Top = 85
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.IgnoreMaskBlank = True
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d\d\d\d\d\d'
      Properties.OnValidate = mskCodigoBancaPropertiesValidate
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 2
      Text = '0'
      Width = 86
    end
    object lcbNomebanca: TcxLookupComboBox
      Left = 274
      Top = 85
      Hint = 'Nome da Banca'
      TabStop = False
      ParentFont = False
      Properties.KeyFieldNames = 'COD_BANCA'
      Properties.ListColumns = <
        item
          FieldName = 'NOM_BANCA'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsBancas
      Properties.ValidationOptions = []
      Properties.OnValidate = lcbNomebancaPropertiesValidate
      EditValue = 0
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 3
      Width = 446
    end
    object btnFiltrar: TcxButton
      Left = 882
      Top = 81
      Width = 82
      Height = 25
      Action = actFiltrar
      TabOrder = 4
    end
    object edtCodigo: TcxTextEdit
      Left = 20
      Top = 192
      Hint = 'Infome'
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Properties.OnEditValueChanged = edtCodigoPropertiesEditValueChanged
      Properties.OnValidate = edtCodigoPropertiesValidate
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 6
      Width = 121
    end
    object grdEncalhe: TcxGrid
      Left = 20
      Top = 219
      Width = 250
      Height = 200
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      object tvEncalhe: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsEncalhes
        DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0;-,0'
            Kind = skSum
            Column = tvEncalheQTD_ENCALHE
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        object tvEncalheCOD_BARRAS: TcxGridDBColumn
          Caption = 'C'#243'd. Barras'
          DataBinding.FieldName = 'COD_BARRAS'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Options.Focusing = False
          Width = 119
        end
        object tvEncalheCOD_PRODUTO: TcxGridDBColumn
          Caption = 'Sigla'
          DataBinding.FieldName = 'COD_PRODUTO'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Options.Focusing = False
          Width = 79
        end
        object tvEncalheDES_PRODUTO: TcxGridDBColumn
          Caption = 'Produto'
          DataBinding.FieldName = 'DES_PRODUTO'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Options.Focusing = False
          Width = 298
        end
        object tvEncalheDAT_REMESSA: TcxGridDBColumn
          Caption = 'Cricula'#231#227'o'
          DataBinding.FieldName = 'DAT_REMESSA'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.ReadOnly = True
          Properties.SaveTime = False
          Properties.ShowTime = False
          HeaderAlignmentHorz = taCenter
          Options.Focusing = False
          Width = 138
        end
        object tvEncalheQTD_REMESSA: TcxGridDBColumn
          Caption = 'Remessa'
          DataBinding.FieldName = 'QTD_REMESSA'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.IgnoreMaskBlank = True
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d\d\d\d\d\d'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Options.Focusing = False
          Width = 101
        end
        object tvEncalheQTD_RECOBERTURA: TcxGridDBColumn
          Caption = 'Recobertura'
          DataBinding.FieldName = 'QTD_RECOBERTURA'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d\d\d\d\d\d'
          HeaderAlignmentHorz = taCenter
          Options.Focusing = False
          Width = 123
        end
        object tvEncalheQTD_ENCALHE: TcxGridDBColumn
          Caption = 'Encalhe'
          DataBinding.FieldName = 'QTD_ENCALHE'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.IgnoreMaskBlank = True
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d\d\d\d\d\d'
          HeaderAlignmentHorz = taCenter
          Width = 84
        end
      end
      object lvEncalhe: TcxGridLevel
        GridView = tvEncalhe
      end
    end
    object btnCancelar: TcxButton
      Left = 10
      Top = 505
      Width = 75
      Height = 25
      Action = actCancelar
      Cancel = True
      TabOrder = 8
    end
    object btnGravar: TcxButton
      Left = 91
      Top = 505
      Width = 75
      Height = 25
      Action = actGravar
      TabOrder = 9
    end
    object btnFechar: TcxButton
      Left = 899
      Top = 505
      Width = 75
      Height = 25
      Action = actFechar
      TabOrder = 10
    end
    object chkAdicionar: TcxCheckBox
      Left = 20
      Top = 149
      Hint = 
        'Selecione esta op'#231#227'o se deve adicionar a cada leitura/localiza'#231#227 +
        'o de produto'
      TabStop = False
      Caption = '&Adicionar na Leitura ou Localiza'#231#227'o'
      State = cbsChecked
      Style.HotTrack = False
      TabOrder = 5
      Transparent = True
    end
    object lcgRoot: TdxLayoutGroup
      AlignHorz = ahParentManaged
      AlignVert = avParentManaged
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object lciTitulo: TdxLayoutItem
      Parent = lcgRoot
      CaptionOptions.Text = 'cxLabel1'
      CaptionOptions.Visible = False
      Control = lblTitulo
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lcgFiltro: TdxLayoutGroup
      Parent = lcgRoot
      CaptionOptions.Text = 'Filtro'
      ButtonOptions.Buttons = <>
      ButtonOptions.ShowExpandButton = True
      LayoutDirection = ldHorizontal
      Index = 1
    end
    object lciDataDevolucao: TdxLayoutItem
      Parent = lcgFiltro
      AlignHorz = ahClient
      CaptionOptions.Text = '&Data Devolu'#231#227'o'
      CaptionOptions.Layout = clTop
      Control = edtDataDevolucao
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lciCodigoBanca: TdxLayoutItem
      Parent = lcgFiltro
      AlignHorz = ahClient
      CaptionOptions.Text = '&C'#243'digo Banca'
      CaptionOptions.Layout = clTop
      Control = mskCodigoBanca
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lciNomeBanca: TdxLayoutItem
      Parent = lcgFiltro
      AlignHorz = ahClient
      CaptionOptions.Text = 'Nome da &Banca'
      CaptionOptions.Layout = clTop
      Control = lcbNomebanca
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object lciFiltrar: TdxLayoutItem
      Parent = lcgFiltro
      AlignVert = avBottom
      CaptionOptions.Text = 'Filtro'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      Control = btnFiltrar
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object lcgEncalhe: TdxLayoutGroup
      Parent = lcgRoot
      AlignVert = avClient
      CaptionOptions.Text = 'Encalhes'
      ButtonOptions.Buttons = <>
      ButtonOptions.ShowExpandButton = True
      Index = 2
    end
    object lciCodigo: TdxLayoutItem
      Parent = lcgEncalhe
      AlignHorz = ahClient
      CaptionOptions.Text = 'C'#243'di&go de Barras, Sigla do Produto ou Descri'#231#227'o'
      CaptionOptions.Layout = clTop
      Control = edtCodigo
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lciEncalhes: TdxLayoutItem
      Parent = lcgEncalhe
      AlignVert = avClient
      CaptionOptions.Text = 'Encalhes'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      Control = grdEncalhe
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object lciCancelar: TdxLayoutItem
      Parent = lcEncalheGroup1
      AlignHorz = ahLeft
      AlignVert = avBottom
      CaptionOptions.Text = 'Cancelar'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      Control = btnCancelar
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lciGravar: TdxLayoutItem
      Parent = lcEncalheGroup1
      CaptionOptions.Text = 'Gravar'
      CaptionOptions.Visible = False
      Control = btnGravar
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lcEncalheGroup1: TdxLayoutAutoCreatedGroup
      Parent = lcgRoot
      AlignVert = avBottom
      LayoutDirection = ldHorizontal
      Index = 3
      AutoCreated = True
    end
    object lciFechar: TdxLayoutItem
      Parent = lcEncalheGroup1
      AlignHorz = ahRight
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      Control = btnFechar
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object lciAdicionar: TdxLayoutItem
      Parent = lcgEncalhe
      AlignHorz = ahClient
      CaptionOptions.Text = 'Adicionar'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      Control = chkAdicionar
      ControlOptions.ShowBorder = False
      Index = 0
    end
  end
  object dsBancas: TDataSource
    AutoEdit = False
    DataSet = dm.fdqBancas
    Left = 771
    Top = 11
  end
  object aclEncalhes: TActionList
    Images = dm.iml16x16
    Left = 715
    Top = 11
    object actFiltrar: TAction
      Category = 'Encalhes'
      Caption = '&Filtrar'
      Hint = 'Filtrar os dados'
      ImageIndex = 41
      OnExecute = actFiltrarExecute
    end
    object actCancelar: TAction
      Category = 'Encalhes'
      Caption = 'Cancelar'
      Hint = 'Cancelar o procedimento'
      ImageIndex = 4
      OnExecute = actCancelarExecute
    end
    object actGravar: TAction
      Category = 'Encalhes'
      Caption = '&Gravar'
      Hint = 'Gravar os encalhes no banco de dados'
      ImageIndex = 32
      ShortCut = 116
      OnExecute = actGravarExecute
    end
    object actFechar: TAction
      Category = 'Encalhes'
      Caption = 'Fechar'
      Hint = 'Sair da tela'
      ImageIndex = 6
      OnExecute = actFecharExecute
    end
  end
  object tbEncalhe: TdxMemData
    Indexes = <
      item
        FieldName = 'COD_PRODUTO'
        SortOptions = []
      end>
    SortOptions = []
    BeforePost = tbEncalheBeforePost
    Left = 835
    Top = 11
    object tbEncalheID_REMESSA: TIntegerField
      FieldName = 'ID_REMESSA'
    end
    object tbEncalheCOD_BARRAS: TStringField
      FieldName = 'COD_BARRAS'
    end
    object tbEncalheCOD_PRODUTO: TStringField
      FieldName = 'COD_PRODUTO'
    end
    object tbEncalheDES_PRODUTO: TStringField
      FieldName = 'DES_PRODUTO'
      Size = 125
    end
    object tbEncalheDAT_REMESSA: TDateField
      FieldName = 'DAT_REMESSA'
    end
    object tbEncalheQTD_REMESSA: TFloatField
      FieldName = 'QTD_REMESSA'
    end
    object tbEncalheQTD_RECOBERTURA: TFloatField
      FieldName = 'QTD_RECOBERTURA'
    end
    object tbEncalheQTD_ENCALHE: TFloatField
      FieldName = 'QTD_ENCALHE'
    end
    object tbEncalheDOM_DIVERGENCIA: TSmallintField
      FieldName = 'DOM_DIVERGENCIA'
    end
    object tbEncalheDES_LOG: TMemoField
      FieldName = 'DES_LOG'
      BlobType = ftMemo
    end
  end
  object dsEncalhes: TDataSource
    DataSet = tbEncalhe
    Left = 883
    Top = 11
  end
end
