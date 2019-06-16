object view_OcorrenciasJornal: Tview_OcorrenciasJornal
  Left = 0
  Top = 0
  Caption = 'Ocorr'#234'ncias do Jornal'
  ClientHeight = 669
  ClientWidth = 1168
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
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lcRoot: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 1168
    Height = 669
    Align = alClient
    TabOrder = 0
    LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
    OptionsImage.Images = dm.iml16x16
    object lblTitulo: TcxLabel
      Left = 10
      Top = 10
      Caption = 'Ocorr'#234'ncias do Jornal'
      ParentFont = False
      Style.Edges = [bBottom]
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -19
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      Transparent = True
    end
    object cboFiltro: TcxComboBox
      Left = 72
      Top = 65
      Hint = 'Informe o tipo de filtro a ser aplicado'
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'STATUS'
        'N'#218'MERO'
        'DATA'
        'C'#211'DIGO'
        'NOME'
        'ROTEIRO'
        'PRODUTO'
        'OCORR'#202'NCIA'
        'ENDERE'#199'O')
      Properties.OnChange = cboFiltroPropertiesChange
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 1
      Width = 137
    end
    object datInicial: TcxDateEdit
      Left = 233
      Top = 65
      Hint = 'Data inicial do per'#237'odo'
      ParentFont = False
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 2
      Width = 96
    end
    object datFinal: TcxDateEdit
      Left = 357
      Top = 65
      Hint = 'Data final do per'#237'odo'
      ParentFont = False
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 3
      Width = 100
    end
    object edtTexto: TcxTextEdit
      Left = 496
      Top = 65
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 4
      Width = 249
    end
    object cboLista: TcxComboBox
      Left = 778
      Top = 65
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 5
      Width = 183
    end
    object btnProcessar: TcxButton
      Left = 1073
      Top = 65
      Width = 75
      Height = 25
      Action = actProcessar
      TabOrder = 6
    end
    object dbOcorrenciasJornal: TdxStatusBar
      Left = 10
      Top = 639
      Width = 1148
      Height = 20
      Panels = <
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Fixed = False
        end
        item
          PanelStyleClassName = 'TdxStatusBarContainerPanelStyle'
          PanelStyle.Container = dbOcorrenciasJornalContainer1
          Bevel = dxpbNone
          MinWidth = 200
          Width = 200
        end>
      PaintStyle = stpsUseLookAndFeel
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      object dbOcorrenciasJornalContainer1: TdxStatusBarContainerControl
        Left = 947
        Top = 2
        Width = 202
        Height = 17
        object pbOcorrencias: TcxProgressBar
          Left = 0
          Top = 0
          Align = alClient
          TabOrder = 0
          Visible = False
          Width = 202
        end
      end
    end
    object grdOcorrencias: TcxGrid
      Left = 10
      Top = 129
      Width = 1148
      Height = 473
      TabOrder = 7
      object tvOcorrencias: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.Images = dm.iml16x16
        Navigator.Buttons.First.ImageIndex = 19
        Navigator.Buttons.PriorPage.Visible = False
        Navigator.Buttons.Prior.ImageIndex = 22
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
        Navigator.InfoPanel.Visible = True
        Navigator.Visible = True
        OnCellDblClick = tvOcorrenciasCellDblClick
        DataController.DataSource = ds
        DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoGroupsAlwaysExpanded, dcoImmediatePost]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0;-,0'
            Kind = skSum
            Column = tvOcorrenciasQTD_OCORRENCIAS
          end
          item
            Format = ',0.00;-,0.00'
            Kind = skSum
            Column = tvOcorrenciasVAL_OCORRENCIA
          end>
        DataController.Summary.SummaryGroups = <>
        EditForm.DefaultColumnCount = 1
        EditForm.DefaultStretch = fsHorizontal
        Images = dm.iml16x16
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.EditAutoHeight = eahRow
        OptionsBehavior.FocusCellOnCycle = True
        OptionsView.CellAutoHeight = True
        OptionsView.Footer = True
        OptionsView.Indicator = True
        object tvOcorrenciasRecId: TcxGridDBColumn
          DataBinding.FieldName = 'RecId'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvOcorrenciasDOM_FINALIZAR: TcxGridDBColumn
          DataBinding.FieldName = 'DOM_FINALIZAR'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = 'True'
          Properties.ValueUnchecked = 'False'
          HeaderAlignmentHorz = taCenter
          HeaderGlyphAlignmentHorz = taCenter
          HeaderImageIndex = 3
          VisibleForEditForm = bFalse
          Width = 52
          IsCaptionAssigned = True
        end
        object tvOcorrenciasDOM_IMPRESSAO: TcxGridDBColumn
          DataBinding.FieldName = 'DOM_IMPRESSAO'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.NullStyle = nssUnchecked
          Properties.ReadOnly = True
          Properties.ValueChecked = 'S'
          Properties.ValueUnchecked = 'N'
          HeaderAlignmentHorz = taCenter
          HeaderGlyphAlignmentHorz = taCenter
          HeaderImageIndex = 42
          VisibleForEditForm = bFalse
          Width = 39
          IsCaptionAssigned = True
        end
        object tvOcorrenciasDOM_PROCESSADO: TcxGridDBColumn
          DataBinding.FieldName = 'DOM_PROCESSADO'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.NullStyle = nssUnchecked
          Properties.ReadOnly = True
          Properties.ValueChecked = 'S'
          Properties.ValueUnchecked = 'N'
          HeaderAlignmentHorz = taCenter
          HeaderGlyphAlignmentHorz = taCenter
          HeaderImageIndex = 39
          VisibleForEditForm = bFalse
          Width = 46
          IsCaptionAssigned = True
        end
        object tvOcorrenciasCOD_STATUS: TcxGridDBColumn
          Caption = 'Status'
          DataBinding.FieldName = 'COD_STATUS'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.Images = dm.cxImageList1
          Properties.Items = <
            item
              Description = 'ABERTA'
              ImageIndex = 46
              Value = 0
            end
            item
              Description = 'TRATADA'
              ImageIndex = 41
              Value = 1
            end
            item
              Description = 'PENDENTE'
              ImageIndex = 50
              Value = 2
            end
            item
              Description = 'FINALIZADA'
              ImageIndex = 51
              Value = 3
            end
            item
              Description = 'CONTABILIZADA'
              ImageIndex = 81
              Value = 4
            end
            item
              Description = 'CANCELADA'
              ImageIndex = 62
              Value = 5
            end
            item
              Description = 'DESMEMBRADA'
              ImageIndex = 98
              Value = 6
            end>
          HeaderAlignmentHorz = taCenter
          VisibleForEditForm = bFalse
          Width = 133
        end
        object tvOcorrenciasNUM_OCORRENCIA: TcxGridDBColumn
          Caption = 'N'#250'mero'
          DataBinding.FieldName = 'NUM_OCORRENCIA'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d\d\d\d\d\d'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          VisibleForEditForm = bFalse
          Width = 85
        end
        object tvOcorrenciasDAT_OCORRENCIA: TcxGridDBColumn
          Caption = 'Data'
          DataBinding.FieldName = 'DAT_OCORRENCIA'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.SaveTime = False
          Properties.ShowTime = False
          HeaderAlignmentHorz = taCenter
        end
        object tvOcorrenciasCOD_ASSINATURA: TcxGridDBColumn
          Caption = 'C'#243'digo Assinatura'
          DataBinding.FieldName = 'COD_ASSINATURA'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.OnValidate = tvOcorrenciasCOD_ASSINATURAPropertiesValidate
          HeaderAlignmentHorz = taCenter
        end
        object tvOcorrenciasNOM_ASSINANTE: TcxGridDBColumn
          Caption = 'Nome do Assinante'
          DataBinding.FieldName = 'NOM_ASSINANTE'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 265
        end
        object tvOcorrenciasDES_ROTEIRO: TcxGridDBColumn
          Caption = 'Roteiro'
          DataBinding.FieldName = 'DES_ROTEIRO'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
        end
        object tvOcorrenciasCOD_PRODUTO: TcxGridDBColumn
          Caption = 'C'#243'digo Produto'
          DataBinding.FieldName = 'COD_PRODUTO'
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          HeaderAlignmentHorz = taCenter
          VisibleForEditForm = bFalse
          Width = 104
        end
        object tvOcorrenciasDES_PRODUTO: TcxGridDBColumn
          Caption = 'Descricao do Produto'
          DataBinding.FieldName = 'COD_PRODUTO'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'COD_PRODUTO'
          Properties.ListColumns = <
            item
              FieldName = 'DES_PRODUTO'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dsProduto
          HeaderAlignmentHorz = taCenter
          Width = 274
        end
        object tvOcorrenciasCOD_OCORRENCIA: TcxGridDBColumn
          Caption = 'C'#243'digo Ocorr'#234'ncia'
          DataBinding.FieldName = 'COD_OCORRENCIA'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.IgnoreMaskBlank = True
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d\d\d\d\d\d'
          HeaderAlignmentHorz = taCenter
          Width = 114
        end
        object tvOcorrenciasDES_OCORRENCIA: TcxGridDBColumn
          Caption = 'Descri'#231#227'o da Ocorr'#234'ncia'
          DataBinding.FieldName = 'COD_OCORRENCIA'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'COD_TIPO_OCORRENCIA'
          Properties.ListColumns = <
            item
              FieldName = 'DES_TIPO_OCORRENCIA'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dsTipoOcorrencia
          HeaderAlignmentHorz = taCenter
          Width = 217
        end
        object tvOcorrenciasDOM_REINCIDENTE: TcxGridDBColumn
          Caption = 'Reincidente'
          DataBinding.FieldName = 'DOM_REINCIDENTE'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = 'S'
          Properties.ValueUnchecked = 'N'
          HeaderAlignmentHorz = taCenter
          Width = 76
        end
        object tvOcorrenciasDES_DESCRICAO: TcxGridDBColumn
          Caption = 'Descri'#231#227'o/Capas'
          DataBinding.FieldName = 'DES_DESCRICAO'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 223
        end
        object tvOcorrenciasDES_ENDERECO: TcxGridDBColumn
          Caption = 'Endere'#231'o'
          DataBinding.FieldName = 'DES_ENDERECO'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 259
        end
        object tvOcorrenciasDES_RETORNO: TcxGridDBColumn
          Caption = 'Retorno'
          DataBinding.FieldName = 'DES_RETORNO'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 216
        end
        object tvOcorrenciasCOD_RESULTADO: TcxGridDBColumn
          Caption = 'Resultado'
          DataBinding.FieldName = 'COD_RESULTADO'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.IgnoreMaskBlank = True
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d\d\d\d\d\d'
          HeaderAlignmentHorz = taCenter
          Width = 67
        end
        object tvOcorrenciasCOD_ORIGEM: TcxGridDBColumn
          Caption = 'Origem'
          DataBinding.FieldName = 'COD_ORIGEM'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.IgnoreMaskBlank = True
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d\d\d\d\d\d'
          HeaderAlignmentHorz = taCenter
        end
        object tvOcorrenciasDES_OBS: TcxGridDBColumn
          Caption = 'Observa'#231#245'es'
          DataBinding.FieldName = 'DES_OBS'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 266
        end
        object tvOcorrenciasDES_APURACAO: TcxGridDBColumn
          DataBinding.FieldName = 'DES_APURACAO'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvOcorrenciasQTD_OCORRENCIAS: TcxGridDBColumn
          Caption = 'Qtde.'
          DataBinding.FieldName = 'QTD_OCORRENCIAS'
          PropertiesClassName = 'TcxSpinEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 69
        end
        object tvOcorrenciasVAL_OCORRENCIA: TcxGridDBColumn
          Caption = 'Valor'
          DataBinding.FieldName = 'VAL_OCORRENCIA'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ' ,0.00;- ,0.00'
          HeaderAlignmentHorz = taCenter
          Width = 51
        end
        object tvOcorrenciasDAT_DESCONTO: TcxGridDBColumn
          DataBinding.FieldName = 'DAT_DESCONTO'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvOcorrenciasDES_LOG: TcxGridDBColumn
          DataBinding.FieldName = 'DES_LOG'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvOcorrenciasDES_CHAVE: TcxGridDBColumn
          DataBinding.FieldName = 'DES_CHAVE'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvOcorrenciasDES_ROTEIRO_NOVO: TcxGridDBColumn
          DataBinding.FieldName = 'DES_ROTEIRO_NOVO'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvOcorrenciasDES_ANEXO: TcxGridDBColumn
          DataBinding.FieldName = 'DES_ANEXO'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvOcorrenciasCOD_ENTREGADOR: TcxGridDBColumn
          Caption = 'Entregador'
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
          Width = 208
        end
        object tvOcorrenciasDOM_GRAVAR: TcxGridDBColumn
          DataBinding.FieldName = 'DOM_GRAVAR'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.NullStyle = nssUnchecked
          Properties.ReadOnly = True
          Properties.ValueChecked = 'S'
          Properties.ValueUnchecked = 'N'
          HeaderAlignmentHorz = taCenter
          HeaderGlyphAlignmentHorz = taCenter
          HeaderImageIndex = 32
          VisibleForEditForm = bFalse
          Width = 61
          IsCaptionAssigned = True
        end
      end
      object lvOcorrencias: TcxGridLevel
        GridView = tvOcorrencias
      end
    end
    object btnIncluir: TcxButton
      Left = 10
      Top = 608
      Width = 75
      Height = 25
      Action = actIncluir
      TabOrder = 8
    end
    object btnLimpar: TcxButton
      Left = 91
      Top = 608
      Width = 75
      Height = 25
      Action = actLimpar
      TabOrder = 9
    end
    object btnDeclaracao: TcxButton
      Left = 172
      Top = 608
      Width = 85
      Height = 25
      Action = actDeclaracao
      TabOrder = 10
    end
    object btnCancelarOcorrencia: TcxButton
      Left = 263
      Top = 608
      Width = 75
      Height = 25
      Action = actCancelar
      TabOrder = 11
    end
    object btnFinalizar: TcxButton
      Left = 344
      Top = 608
      Width = 75
      Height = 25
      Action = actFinalizar
      TabOrder = 12
    end
    object btnGravar: TcxButton
      Left = 425
      Top = 608
      Width = 75
      Height = 25
      Action = actGravar
      TabOrder = 13
    end
    object btnFechar: TcxButton
      Left = 1083
      Top = 608
      Width = 75
      Height = 25
      Action = actFechar
      TabOrder = 15
    end
    object cxButton1: TcxButton
      Left = 506
      Top = 608
      Width = 75
      Height = 25
      Action = actExportar
      TabOrder = 14
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
    object lciTitulo: TdxLayoutItem
      Parent = lcgRoot
      CaptionOptions.Text = 'cxLabel1'
      CaptionOptions.Visible = False
      LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
      Control = lblTitulo
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lcgFiltro: TdxLayoutGroup
      Parent = lcgRoot
      CaptionOptions.ImageIndex = 41
      CaptionOptions.Text = 'Filtro'
      LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      Index = 1
    end
    object lctFiltro: TdxLayoutItem
      Parent = lcgFiltro
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Filtrar por'
      Control = cboFiltro
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lciDataInicial: TdxLayoutItem
      Parent = lcgFiltro
      CaptionOptions.Text = 'De'
      Visible = False
      Control = datInicial
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lciDataFinal: TdxLayoutItem
      Parent = lcgFiltro
      CaptionOptions.Text = 'At'#233
      Visible = False
      Control = datFinal
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object lciTexto: TdxLayoutItem
      Parent = lcgFiltro
      CaptionOptions.Text = 'Texto'
      Visible = False
      Control = edtTexto
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object lciLista: TdxLayoutItem
      Parent = lcgFiltro
      CaptionOptions.Text = 'Lista'
      Visible = False
      Control = cboLista
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object lciProcessar: TdxLayoutItem
      Parent = lcgFiltro
      AlignHorz = ahRight
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnProcessar
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object lciStatusBar: TdxLayoutItem
      Parent = lcgRoot
      AlignVert = avBottom
      CaptionOptions.Text = 'Barra de Status'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      Control = dbOcorrenciasJornal
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object lciGradeOcorrencias: TdxLayoutItem
      Parent = lcgRoot
      AlignVert = avClient
      CaptionOptions.ImageIndex = 43
      CaptionOptions.Text = 'Ocorr'#234'ncias'
      CaptionOptions.Layout = clTop
      Control = grdOcorrencias
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object lciBotaoIncluir: TdxLayoutItem
      Parent = lcgOpcoes
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnIncluir
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lcgOpcoes: TdxLayoutAutoCreatedGroup
      Parent = lcgRoot
      AlignVert = avBottom
      LayoutDirection = ldHorizontal
      Index = 3
      AutoCreated = True
    end
    object lciBotaoLimpar: TdxLayoutItem
      Parent = lcgOpcoes
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      Control = btnLimpar
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lciBotaoDeclaracao: TdxLayoutItem
      Parent = lcgOpcoes
      CaptionOptions.Text = 'cxButton3'
      CaptionOptions.Visible = False
      Control = btnDeclaracao
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object lciBotaoCancelar: TdxLayoutItem
      Parent = lcgOpcoes
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnCancelarOcorrencia
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object lcibotaoFinalizar: TdxLayoutItem
      Parent = lcgOpcoes
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnFinalizar
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object lciBotaoGravar: TdxLayoutItem
      Parent = lcgOpcoes
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnGravar
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object lciBotaoFechar: TdxLayoutItem
      Parent = lcgOpcoes
      AlignHorz = ahRight
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnFechar
      ControlOptions.ShowBorder = False
      Index = 7
    end
    object lciExportar: TdxLayoutItem
      Parent = lcgOpcoes
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = cxButton1
      ControlOptions.ShowBorder = False
      Index = 6
    end
  end
  object aclOcorrencias: TActionList
    Images = dm.iml16x16
    Left = 696
    Top = 8
    object actIncluir: TAction
      Category = 'Ocorr'#234'ncias do Jornal'
      Caption = '&Incluir'
      Hint = 'Incluir Ocorr'#234'ncias'
      ImageIndex = 0
      OnExecute = actIncluirExecute
    end
    object actProcessar: TAction
      Category = 'Ocorr'#234'ncias do Jornal'
      Caption = 'Processar'
      Hint = 'Aplicar Filtro'
      ImageIndex = 39
      ShortCut = 32781
      OnExecute = actProcessarExecute
    end
    object actLimpar: TAction
      Category = 'Ocorr'#234'ncias do Jornal'
      Caption = '&Limpar'
      Hint = 'Limpar tela'
      ImageIndex = 12
      OnExecute = actLimparExecute
    end
    object actDeclaracao: TAction
      Category = 'Ocorr'#234'ncias do Jornal'
      Caption = '&Declara'#231#227'o'
      Hint = 'Imprimir Declara'#231#227'o'
      ImageIndex = 44
      OnExecute = actDeclaracaoExecute
    end
    object actCancelar: TAction
      Category = 'Ocorr'#234'ncias do Jornal'
      Caption = 'Cancelar'
      Hint = 'Cancelar Ocorr'#234'ncia'
      ImageIndex = 4
      OnExecute = actCancelarExecute
    end
    object actFinalizar: TAction
      Category = 'Ocorr'#234'ncias do Jornal'
      Caption = 'Fi&nalizar'
      Hint = 'Finalizar Ocorr'#234'ncia'
      ImageIndex = 3
      OnExecute = actFinalizarExecute
    end
    object actGravar: TAction
      Category = 'Ocorr'#234'ncias do Jornal'
      Caption = '&Gravar'
      Hint = 'Gravar ocorr'#234'ncia no banco de dados'
      ImageIndex = 32
      OnExecute = actGravarExecute
    end
    object actFechar: TAction
      Category = 'Ocorr'#234'ncias do Jornal'
      Caption = 'Fechar'
      Hint = 'Fechar janela'
      ImageIndex = 6
      OnExecute = actFecharExecute
    end
    object actExportar: TAction
      Category = 'Ocorr'#234'ncias do Jornal'
      Caption = 'Exportar'
      Hint = 'Exportar Planilha'
      ImageIndex = 29
      OnExecute = actExportarExecute
    end
  end
  object ds: TDataSource
    DataSet = tbPlanilha
    OnStateChange = dsStateChange
    Left = 800
    Top = 8
  end
  object tbPlanilha: TdxMemData
    Active = True
    Indexes = <
      item
        FieldName = 'NUM_OCORRENCIA'
        SortOptions = []
      end>
    SortOptions = []
    BeforeEdit = tbPlanilhaBeforeEdit
    BeforePost = tbPlanilhaBeforePost
    Left = 760
    Top = 8
    object tbPlanilhaNUM_OCORRENCIA: TIntegerField
      FieldName = 'NUM_OCORRENCIA'
    end
    object tbPlanilhaDAT_OCORRENCIA: TDateTimeField
      FieldName = 'DAT_OCORRENCIA'
    end
    object tbPlanilhaCOD_ASSINATURA: TWideStringField
      FieldName = 'COD_ASSINATURA'
    end
    object tbPlanilhaNOM_ASSINANTE: TWideStringField
      FieldName = 'NOM_ASSINANTE'
      Size = 70
    end
    object tbPlanilhaDES_ROTEIRO: TWideStringField
      DisplayWidth = 30
      FieldName = 'DES_ROTEIRO'
      Size = 30
    end
    object tbPlanilhaCOD_ENTREGADOR: TIntegerField
      FieldName = 'COD_ENTREGADOR'
    end
    object tbPlanilhaCOD_PRODUTO: TStringField
      FieldName = 'COD_PRODUTO'
      Size = 10
    end
    object tbPlanilhaCOD_OCORRENCIA: TIntegerField
      FieldName = 'COD_OCORRENCIA'
    end
    object tbPlanilhaDOM_REINCIDENTE: TWideStringField
      FieldName = 'DOM_REINCIDENTE'
      Size = 1
    end
    object tbPlanilhaDES_DESCRICAO: TStringField
      FieldName = 'DES_DESCRICAO'
      Size = 4096
    end
    object tbPlanilhaDES_ENDERECO: TWideStringField
      FieldName = 'DES_ENDERECO'
      Size = 256
    end
    object tbPlanilhaDES_RETORNO: TWideStringField
      DisplayWidth = 1024
      FieldName = 'DES_RETORNO'
      Size = 1024
    end
    object tbPlanilhaCOD_RESULTADO: TIntegerField
      FieldName = 'COD_RESULTADO'
    end
    object tbPlanilhaCOD_ORIGEM: TIntegerField
      FieldName = 'COD_ORIGEM'
    end
    object tbPlanilhaDES_OBS: TWideStringField
      DisplayWidth = 4096
      FieldName = 'DES_OBS'
      Size = 4096
    end
    object tbPlanilhaCOD_STATUS: TIntegerField
      FieldName = 'COD_STATUS'
    end
    object tbPlanilhaDES_APURACAO: TMemoField
      FieldName = 'DES_APURACAO'
      BlobType = ftMemo
    end
    object tbPlanilhaDOM_PROCESSADO: TStringField
      FieldName = 'DOM_PROCESSADO'
      Size = 1
    end
    object tbPlanilhaQTD_OCORRENCIAS: TIntegerField
      FieldName = 'QTD_OCORRENCIAS'
    end
    object tbPlanilhaVAL_OCORRENCIA: TFloatField
      FieldName = 'VAL_OCORRENCIA'
    end
    object tbPlanilhaDAT_DESCONTO: TDateField
      FieldName = 'DAT_DESCONTO'
    end
    object tbPlanilhaDES_LOG: TWideMemoField
      FieldName = 'DES_LOG'
      BlobType = ftWideMemo
    end
    object tbPlanilhaDES_CHAVE: TStringField
      FieldName = 'DES_CHAVE'
      Size = 100
    end
    object tbPlanilhaDOM_FINALIZAR: TBooleanField
      FieldName = 'DOM_FINALIZAR'
    end
    object tbPlanilhaDES_ROTEIRO_NOVO: TStringField
      FieldName = 'DES_ROTEIRO_NOVO'
      Size = 50
    end
    object tbPlanilhaDOM_IMPRESSAO: TStringField
      FieldName = 'DOM_IMPRESSAO'
      Size = 1
    end
    object tbPlanilhaDES_ANEXO: TStringField
      FieldName = 'DES_ANEXO'
      Size = 30
    end
    object tbPlanilhaDES_OCORRENCIA: TStringField
      FieldName = 'DES_OCORRENCIA'
      LookupKeyFields = 'DES_PRODUTO'
      LookupResultField = 'DES_PRODUTO'
      KeyFields = 'COD_PRODUTO'
      Size = 70
    end
    object TStringField
      FieldName = 'DES_PRODUTO'
      Size = 50
    end
    object tbPlanilhaDOM_GRAVAR: TStringField
      FieldName = 'DOM_GRAVAR'
      Size = 1
    end
  end
  object dsProduto: TDataSource
    AutoEdit = False
    DataSet = dm.tbProdutos
    Left = 928
    Top = 8
  end
  object dsTipoOcorrencia: TDataSource
    AutoEdit = False
    DataSet = dm.tbTipoOcorrencias
    Left = 984
    Top = 8
  end
  object OpenDialog: TOpenDialog
    Left = 235
    Top = 7
  end
  object SaveDialog: TSaveDialog
    Left = 299
    Top = 7
  end
  object rptDeclaracaoJornal: TfrxReport
    Version = '5.3.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbNoEmail]
    PreviewOptions.Maximized = False
    PreviewOptions.MDIChild = True
    PreviewOptions.Modal = False
    PreviewOptions.ShowCaptions = True
    PreviewOptions.Zoom = 1.000000000000000000
    PreviewOptions.ZoomMode = zmPageWidth
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42527.519139814800000000
    ReportOptions.LastChange = 42873.033142893520000000
    ScriptLanguage = 'PascalScript'
    StoreInDFM = False
    Left = 360
    Top = 8
  end
  object ZConn: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    HostName = ''
    Port = 0
    Database = ''
    User = ''
    Password = ''
    Protocol = 'ado'
    Left = 488
    Top = 6
  end
  object qryAccess: TZReadOnlyQuery
    Connection = ZConn
    Params = <>
    Left = 528
    Top = 6
  end
  object dsEntregador: TDataSource
    AutoEdit = False
    DataSet = dm.tbListaEntregadores
    Left = 1032
    Top = 8
  end
end
