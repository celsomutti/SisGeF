object view_ApontamentoOperacional: Tview_ApontamentoOperacional
  Left = 0
  Top = 0
  Caption = 'Apontamento Operacional'
  ClientHeight = 596
  ClientWidth = 1154
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
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lcApontamento: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 1154
    Height = 596
    Align = alClient
    TabOrder = 0
    LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
    OptionsImage.Images = dm.iml16x16
    object grdApontamento: TcxGrid
      Left = 10
      Top = 132
      Width = 250
      Height = 450
      TabOrder = 4
      object tvApontamento: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsApontamento
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        object tvApontamentoRecId: TcxGridDBColumn
          DataBinding.FieldName = 'RecId'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvApontamentoID_OPERACAO: TcxGridDBColumn
          DataBinding.FieldName = 'ID_OPERACAO'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvApontamentoCOD_ROTEIRO_ANTIGO: TcxGridDBColumn
          DataBinding.FieldName = 'COD_ROTEIRO_ANTIGO'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Options.Focusing = False
          SortIndex = 0
          SortOrder = soAscending
          Width = 198
        end
        object tvApontamentoDAT_OPERACAO: TcxGridDBColumn
          DataBinding.FieldName = 'DAT_OPERACAO'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvApontamentoCOD_ROTEIRO_NOVO: TcxGridDBColumn
          DataBinding.FieldName = 'COD_ROTEIRO_NOVO'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Options.Focusing = False
          Width = 140
        end
        object tvApontamentoCOD_ENTREGADOR: TcxGridDBColumn
          DataBinding.FieldName = 'COD_ENTREGADOR'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'COD_CADASTRO'
          Properties.ListColumns = <
            item
              FieldName = 'DES_RAZAO_SOCIAL'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dsEntregador
          HeaderAlignmentHorz = taCenter
          Width = 189
        end
        object tvApontamentoCOD_STATUS_OPERACAO: TcxGridDBColumn
          DataBinding.FieldName = 'COD_STATUS_OPERACAO'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Images = dm.cxImageList1
          Properties.Items = <
            item
              Description = 'PRESENTE'
              ImageIndex = 51
              Tag = 1
              Value = 'P'
            end
            item
              Description = 'TREINAMENTO'
              ImageIndex = 83
              Tag = 1
              Value = 'T'
            end
            item
              Description = 'FALTA'
              ImageIndex = 62
              Value = 'F'
            end
            item
              Description = 'F'#201'RIAS'
              ImageIndex = 7
              Value = 'FER'
            end
            item
              Description = 'FOLGA'
              ImageIndex = 31
              Value = 'FOL'
            end
            item
              Description = 'INSS'
              ImageIndex = 25
              Value = 'INSS'
            end
            item
              Description = 'ATESTADO'
              ImageIndex = 50
              Value = 'ATES'
            end
            item
              Description = 'SUSPENS'#195'O'
              ImageIndex = 8
              Value = 'SUSP'
            end
            item
              Description = 'LICEN'#199'A'
              ImageIndex = 52
              Value = 'LICE'
            end>
          HeaderAlignmentHorz = taCenter
          Width = 157
        end
        object tvApontamentoDES_OBSERVACOES: TcxGridDBColumn
          DataBinding.FieldName = 'DES_OBSERVACOES'
          HeaderAlignmentHorz = taCenter
          Width = 448
        end
        object tvApontamentoDOM_PLANILHA: TcxGridDBColumn
          DataBinding.FieldName = 'DOM_PLANILHA'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvApontamentoID_REFERENCIA: TcxGridDBColumn
          DataBinding.FieldName = 'ID_REFERENCIA'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvApontamentoDAT_REFERENCIA: TcxGridDBColumn
          DataBinding.FieldName = 'DAT_REFERENCIA'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvApontamentoDES_LOG: TcxGridDBColumn
          DataBinding.FieldName = 'DES_LOG'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
      end
      object lvApontamento: TcxGridLevel
        GridView = tvApontamento
      end
    end
    object btnGravar: TcxButton
      Left = 10
      Top = 535
      Width = 75
      Height = 25
      Action = actGravar
      TabOrder = 5
    end
    object btnFechar: TcxButton
      Left = 1069
      Top = 535
      Width = 75
      Height = 25
      Action = aftFechar
      TabOrder = 9
    end
    object btnEditar: TcxButton
      Left = 91
      Top = 535
      Width = 75
      Height = 25
      Action = actEditar
      TabOrder = 6
    end
    object lblTitulo: TcxLabel
      Left = 10
      Top = 10
      Caption = 'Apontamento Operacional'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -19
      Style.Font.Name = 'Arial Rounded MT Bold'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.IsFontAssigned = True
      Transparent = True
    end
    object sbApontamento: TdxStatusBar
      Left = 10
      Top = 566
      Width = 0
      Height = 20
      Panels = <
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Fixed = False
        end
        item
          PanelStyleClassName = 'TdxStatusBarContainerPanelStyle'
          PanelStyle.Container = sbApontamentoContainer1
          Bevel = dxpbNone
          MinWidth = 250
          Width = 250
        end>
      PaintStyle = stpsUseLookAndFeel
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      object sbApontamentoContainer1: TdxStatusBarContainerControl
        Left = 24
        Top = 2
        Width = 252
        Height = 17
        object pbApontamento: TcxProgressBar
          Left = 0
          Top = 0
          Align = alClient
          TabOrder = 0
          Visible = False
          Width = 252
        end
      end
    end
    object btnLimpar: TcxButton
      Left = 172
      Top = 535
      Width = 75
      Height = 25
      Action = actLimpar
      TabOrder = 7
    end
    object edtData: TcxDateEdit
      Left = 48
      Top = 68
      Hint = 'Data do Apontamento'
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.HotTrack = False
      TabOrder = 1
      Width = 121
    end
    object edtTipo: TcxComboBox
      Left = 200
      Top = 68
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'ENTREGADORES'
        'AGREGADOS')
      Properties.OnChange = edtTipoPropertiesChange
      Style.HotTrack = False
      TabOrder = 2
      Text = 'ENTREGADORES'
      Width = 121
    end
    object btnProcessar: TcxButton
      Left = 1053
      Top = 68
      Width = 81
      Height = 25
      Action = actProcessar
      TabOrder = 3
    end
    object btnCancelar: TcxButton
      Left = 253
      Top = 535
      Width = 84
      Height = 25
      Action = actCancelar
      TabOrder = 8
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
    object lciGrade: TdxLayoutItem
      Parent = lcgRoot
      AlignVert = avClient
      CaptionOptions.ImageIndex = 43
      CaptionOptions.Text = 'Apontamento'
      CaptionOptions.Layout = clTop
      Control = grdApontamento
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object lciGravar: TdxLayoutItem
      Parent = lcgOpcoes
      AlignHorz = ahLeft
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnGravar
      ControlOptions.ShowBorder = False
      Enabled = False
      Index = 0
    end
    object lcgOpcoes: TdxLayoutAutoCreatedGroup
      Parent = lcgRoot
      LayoutDirection = ldHorizontal
      Index = 3
      AutoCreated = True
    end
    object lciFechar: TdxLayoutItem
      Parent = lcgOpcoes
      AlignHorz = ahRight
      CaptionOptions.Text = 'cxButton3'
      CaptionOptions.Visible = False
      Control = btnFechar
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object lciEditar: TdxLayoutItem
      Parent = lcgOpcoes
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnEditar
      ControlOptions.ShowBorder = False
      Enabled = False
      Index = 1
    end
    object lciTitulo: TdxLayoutItem
      Parent = lcgRoot
      CaptionOptions.Text = 'cxLabel1'
      CaptionOptions.Visible = False
      LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
      Control = lblTitulo
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lctBarraStatus: TdxLayoutItem
      Parent = lcgRoot
      CaptionOptions.Text = 'Barra de Status'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      Control = sbApontamento
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object lciLimpar: TdxLayoutItem
      Parent = lcgOpcoes
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      Control = btnLimpar
      ControlOptions.ShowBorder = False
      Enabled = False
      Index = 2
    end
    object lcgFiltro: TdxLayoutGroup
      Parent = lcgRoot
      AlignVert = avClient
      CaptionOptions.ImageIndex = 41
      CaptionOptions.Text = 'Filtro'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      Index = 1
    end
    object lciData: TdxLayoutItem
      Parent = lcgFiltro
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Data'
      Control = edtData
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lciTipo: TdxLayoutItem
      Parent = lcgFiltro
      CaptionOptions.Text = 'Tipo'
      Control = edtTipo
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lciProcessar: TdxLayoutItem
      Parent = lcgFiltro
      AlignHorz = ahRight
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      Control = btnProcessar
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object lciCancelar: TdxLayoutItem
      Parent = lcgOpcoes
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      Control = btnCancelar
      ControlOptions.ShowBorder = False
      Enabled = False
      Index = 3
    end
  end
  object aclApontamento: TActionList
    Images = dm.iml16x16
    Left = 728
    Top = 24
    object actProcessar: TAction
      Tag = 3
      Category = 'Apontamento'
      Caption = 'Processar'
      Hint = 'Processar dados de pesquisa'
      ImageIndex = 39
      OnExecute = actProcessarExecute
    end
    object actGravar: TAction
      Tag = 3
      Category = 'Apontamento'
      Caption = 'Gravar'
      Enabled = False
      Hint = 'Gravar Planilha'
      ImageIndex = 32
      OnExecute = actGravarExecute
    end
    object actCancelar: TAction
      Tag = 3
      Category = 'Apontamento'
      Caption = 'Cancelar'
      Enabled = False
      Hint = 'Cancelar Apontamento'
      ImageIndex = 4
      OnExecute = actCancelarExecute
    end
    object aftFechar: TAction
      Tag = 3
      Category = 'Apontamento'
      Caption = 'Fechar'
      Hint = 'Fechar tela'
      ImageIndex = 6
      OnExecute = aftFecharExecute
    end
    object actEditar: TAction
      Category = 'Apontamento'
      Caption = 'Editar'
      Enabled = False
      Hint = 'Editar Dados'
      ImageIndex = 27
      OnExecute = actEditarExecute
    end
    object actLimpar: TAction
      Category = 'Apontamento'
      Caption = '&Limpar'
      Enabled = False
      Hint = 'Limpar tela'
      ImageIndex = 12
    end
  end
  object tbApontamento: TdxMemData
    Indexes = <
      item
        FieldName = 'COD_ROTEIRO_ANTIGO'
        SortOptions = []
      end>
    SortOptions = []
    AfterPost = tbApontamentoAfterPost
    Left = 848
    Top = 56
    object tbApontamentoID_OPERACAO: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_OPERACAO'
    end
    object tbApontamentoCOD_ENTREGADOR: TIntegerField
      DisplayLabel = 'Entregador'
      FieldName = 'COD_ENTREGADOR'
    end
    object tbApontamentoCOD_ROTEIRO_ANTIGO: TStringField
      DisplayLabel = 'Roteiro Antigo'
      FieldName = 'COD_ROTEIRO_ANTIGO'
      Size = 100
    end
    object tbApontamentoDAT_OPERACAO: TDateField
      DisplayLabel = 'Data'
      FieldName = 'DAT_OPERACAO'
    end
    object tbApontamentoCOD_STATUS_OPERACAO: TStringField
      DisplayLabel = 'Status'
      FieldName = 'COD_STATUS_OPERACAO'
      Size = 50
    end
    object tbApontamentoCOD_ROTEIRO_NOVO: TStringField
      DisplayLabel = 'Roteiro Novo'
      FieldName = 'COD_ROTEIRO_NOVO'
      Size = 50
    end
    object tbApontamentoDES_OBSERVACOES: TStringField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'DES_OBSERVACOES'
      Size = 256
    end
    object tbApontamentoDOM_PLANILHA: TStringField
      DisplayLabel = 'Planilha'
      FieldName = 'DOM_PLANILHA'
      Size = 1
    end
    object tbApontamentoID_REFERENCIA: TIntegerField
      DisplayLabel = 'ID Refer'#234'ncia'
      FieldName = 'ID_REFERENCIA'
    end
    object tbApontamentoDAT_REFERENCIA: TDateField
      DisplayLabel = 'Data Refer'#234'ncia'
      FieldName = 'DAT_REFERENCIA'
    end
    object tbApontamentoDES_LOG: TMemoField
      DisplayLabel = 'LOG'
      FieldName = 'DES_LOG'
      BlobType = ftMemo
    end
  end
  object dsApontamento: TDataSource
    AutoEdit = False
    DataSet = tbApontamento
    OnStateChange = dsApontamentoStateChange
    Left = 848
    Top = 8
  end
  object dsEntregador: TDataSource
    AutoEdit = False
    DataSet = dm.tbListaEntregadores
    Left = 920
    Top = 8
  end
  object tbAusencias: TdxMemData
    Indexes = <
      item
        FieldName = 'COD_CADASTRO'
        SortOptions = []
      end
      item
        FieldName = 'ID_REFERENCIA'
        SortOptions = []
      end>
    SortOptions = []
    Left = 1000
    Top = 56
    object tbAusenciasID_AUSENCIA: TIntegerField
      FieldName = 'ID_AUSENCIA'
    end
    object tbAusenciasDAT_OPERACAO: TDateField
      FieldName = 'DAT_OPERACAO'
    end
    object tbAusenciasCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
    end
    object tbAusenciasCOD_STATUS_OPERACAO: TStringField
      FieldName = 'COD_STATUS_OPERACAO'
      Size = 50
    end
    object tbAusenciasDES_OBSERVACOES: TStringField
      FieldName = 'DES_OBSERVACOES'
      Size = 256
    end
    object tbAusenciasID_REFERENCIA: TIntegerField
      FieldName = 'ID_REFERENCIA'
    end
    object tbAusenciasDES_LOG: TMemoField
      FieldName = 'DES_LOG'
      BlobType = ftMemo
    end
  end
  object dsAusencias: TDataSource
    AutoEdit = False
    DataSet = tbAusencias
    Left = 1000
    Top = 8
  end
end
