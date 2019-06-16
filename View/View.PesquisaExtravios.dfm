object view_PesquisaExtravios: Tview_PesquisaExtravios
  Left = 0
  Top = 0
  Caption = 'Extravios'
  ClientHeight = 531
  ClientWidth = 1121
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 1121
    Height = 531
    Align = alClient
    TabOrder = 0
    LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
    object txtParametro: TcxTextEdit
      Left = 75
      Top = 34
      Hint = 'Informe o par'#226'metro de pexquisa'
      Style.HotTrack = False
      TabOrder = 0
      OnEnter = txtParametroEnter
      OnExit = txtParametroExit
      Width = 918
    end
    object cxButton1: TcxButton
      Left = 1008
      Top = 34
      Width = 93
      Height = 25
      Cursor = crHandPoint
      Action = actPesquisar
      TabOrder = 1
    end
    object dxStatusBar1: TdxStatusBar
      Left = 10
      Top = 501
      Width = 0
      Height = 20
      Panels = <
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Fixed = False
        end
        item
          PanelStyleClassName = 'TdxStatusBarContainerPanelStyle'
          PanelStyle.Container = dxStatusBar1Container1
          Bevel = dxpbNone
          Width = 200
        end>
      PaintStyle = stpsUseLookAndFeel
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      object dxStatusBar1Container1: TdxStatusBarContainerControl
        Left = 24
        Top = 2
        Width = 202
        Height = 17
        object cxProgressBar1: TcxProgressBar
          Left = 0
          Top = 0
          Align = alClient
          TabOrder = 0
          Visible = False
          Width = 202
        end
      end
    end
    object grdExtravios: TcxGrid
      Left = 10
      Top = 96
      Width = 250
      Height = 329
      TabOrder = 2
      OnEnter = grdExtraviosEnter
      OnExit = grdExtraviosExit
      object tvExtravios: TcxGridDBTableView
        Navigator.Buttons.OnButtonClick = tvExtraviosNavigatorButtonsButtonClick
        Navigator.Buttons.CustomButtons = <
          item
            Hint = 'Exportar dados'
            ImageIndex = 29
          end>
        Navigator.Buttons.Images = dm.iml16x16
        Navigator.Buttons.First.Hint = 'Primeiro registro'
        Navigator.Buttons.First.ImageIndex = 19
        Navigator.Buttons.PriorPage.Visible = False
        Navigator.Buttons.Prior.Hint = 'Registro anterior'
        Navigator.Buttons.Prior.ImageIndex = 22
        Navigator.Buttons.Next.Hint = 'Pr'#243'ximo registro'
        Navigator.Buttons.Next.ImageIndex = 21
        Navigator.Buttons.NextPage.Visible = False
        Navigator.Buttons.Last.Hint = #218'ltimo registro'
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
        OnCellDblClick = tvExtraviosCellDblClick
        DataController.DataSource = dsPesquisa
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsView.Indicator = True
        object tvExtraviosRecId: TcxGridDBColumn
          DataBinding.FieldName = 'RecId'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvExtraviosCOD_EXTRAVIO: TcxGridDBColumn
          DataBinding.FieldName = 'COD_EXTRAVIO'
          HeaderAlignmentHorz = taCenter
        end
        object tvExtraviosNUM_NOSSONUMERO: TcxGridDBColumn
          DataBinding.FieldName = 'NUM_NOSSONUMERO'
          HeaderAlignmentHorz = taCenter
        end
        object tvExtraviosDES_EXTRAVIO: TcxGridDBColumn
          DataBinding.FieldName = 'DES_EXTRAVIO'
          HeaderAlignmentHorz = taCenter
          Width = 283
        end
        object tvExtraviosCOD_AGENTE: TcxGridDBColumn
          Caption = 'Agente'
          DataBinding.FieldName = 'COD_AGENTE'
          HeaderAlignmentHorz = taCenter
        end
        object tvExtraviosNOM_AGENTE: TcxGridDBColumn
          Caption = 'Nome'
          DataBinding.FieldName = 'COD_AGENTE'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'COD_AGENTE'
          Properties.ListColumns = <
            item
              FieldName = 'NOM_FANTASIA'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dsAgentes
          HeaderAlignmentHorz = taCenter
          Width = 195
        end
        object tvExtraviosCOD_ENTREGADOR: TcxGridDBColumn
          Caption = 'Entregador'
          DataBinding.FieldName = 'COD_ENTREGADOR'
          HeaderAlignmentHorz = taCenter
        end
        object tvExtraviosNOM_ENTREGADOR: TcxGridDBColumn
          Caption = 'Nome'
          DataBinding.FieldName = 'COD_ENTREGADOR'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'COD_ENTREGADOR'
          Properties.ListColumns = <
            item
              FieldName = 'NOM_FANTASIA'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dsEntregadores
          HeaderAlignmentHorz = taCenter
          Width = 184
        end
        object tvExtraviosDAT_EXTRAVIO: TcxGridDBColumn
          Caption = 'Data Extravio'
          DataBinding.FieldName = 'DAT_EXTRAVIO'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.SaveTime = False
          Properties.ShowTime = False
          HeaderAlignmentHorz = taCenter
          Width = 84
        end
        object tvExtraviosVAL_PRODUTO: TcxGridDBColumn
          Caption = 'Valor Produto'
          DataBinding.FieldName = 'VAL_PRODUTO'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 81
        end
        object tvExtraviosVAL_MULTA: TcxGridDBColumn
          DataBinding.FieldName = 'VAL_MULTA'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          HeaderAlignmentHorz = taCenter
        end
        object tvExtraviosVAL_VERBA: TcxGridDBColumn
          DataBinding.FieldName = 'VAL_VERBA'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          HeaderAlignmentHorz = taCenter
        end
        object tvExtraviosVAL_TOTAL: TcxGridDBColumn
          DataBinding.FieldName = 'VAL_TOTAL'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          HeaderAlignmentHorz = taCenter
        end
        object tvExtraviosDOM_RESTRICAO: TcxGridDBColumn
          DataBinding.FieldName = 'DOM_RESTRICAO'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = 'S'
          Properties.ValueUnchecked = 'N'
          HeaderAlignmentHorz = taCenter
          Width = 64
        end
        object tvExtraviosCOD_TIPO: TcxGridDBColumn
          DataBinding.FieldName = 'COD_TIPO'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.Images = dm.cxImageList1
          Properties.Items = <
            item
              Description = 'EXTRAVIO'
              ImageIndex = 75
              Value = 0
            end
            item
              Description = 'SINISRO'
              ImageIndex = 62
              Value = 1
            end
            item
              Description = 'MULTA'
              ImageIndex = 8
              Value = 2
            end>
          HeaderAlignmentHorz = taCenter
          Width = 115
        end
        object tvExtraviosVAL_EXTRATO_FRANQUIA: TcxGridDBColumn
          Caption = 'Valor Franquia'
          DataBinding.FieldName = 'VAL_EXTRATO_FRANQUIA'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvExtraviosDOM_EXTRATO_FRANQUIA: TcxGridDBColumn
          Caption = 'Debitado Franquia'
          DataBinding.FieldName = 'DOM_EXTRATO_FRANQUIA'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.ValueChecked = 'S'
          Properties.ValueUnchecked = 'N'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvExtraviosDAT_EXTRAVIO_FRANQUIA: TcxGridDBColumn
          Caption = 'Data Franquia'
          DataBinding.FieldName = 'DAT_EXTRAVIO_FRANQUIA'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.SaveTime = False
          Properties.ShowTime = False
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvExtraviosDES_ENVIO_CORRESPONDENCIA: TcxGridDBColumn
          Caption = 'Correspond'#234'ncia'
          DataBinding.FieldName = 'DES_ENVIO_CORRESPONDENCIA'
          HeaderAlignmentHorz = taCenter
          Width = 263
        end
        object tvExtraviosDES_RETORNO_CORRESPONDENCIA: TcxGridDBColumn
          Caption = 'Retorno'
          DataBinding.FieldName = 'DES_RETORNO_CORRESPONDENCIA'
          HeaderAlignmentHorz = taCenter
          Width = 289
        end
        object tvExtraviosDES_OBSERVACOES: TcxGridDBColumn
          DataBinding.FieldName = 'DES_OBSERVACOES'
          PropertiesClassName = 'TcxBlobEditProperties'
          Properties.BlobEditKind = bekMemo
          Properties.ImmediateDropDownWhenActivated = False
          HeaderAlignmentHorz = taCenter
          Width = 82
        end
        object tvExtraviosVAL_PERCENTUAL_PAGO: TcxGridDBColumn
          Caption = '% Debitado'
          DataBinding.FieldName = 'VAL_PERCENTUAL_PAGO'
          PropertiesClassName = 'TcxProgressBarProperties'
          HeaderAlignmentHorz = taCenter
          Width = 136
        end
        object tvExtraviosNOM_EXECUTOR: TcxGridDBColumn
          DataBinding.FieldName = 'NOM_EXECUTOR'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvExtraviosDAT_MANUTENCAO: TcxGridDBColumn
          DataBinding.FieldName = 'DAT_MANUTENCAO'
          PropertiesClassName = 'TcxDateEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 163
        end
      end
      object lvExtravios: TcxGridLevel
        GridView = tvExtravios
      end
    end
    object cxButton2: TcxButton
      Left = 10
      Top = 470
      Width = 75
      Height = 25
      Action = actSelecionar
      TabOrder = 3
    end
    object cxButton3: TcxButton
      Left = 1036
      Top = 470
      Width = 75
      Height = 25
      Action = actFechar
      Cancel = True
      TabOrder = 5
    end
    object cxButton4: TcxButton
      Left = 91
      Top = 470
      Width = 75
      Height = 25
      Action = actFinalizar
      TabOrder = 4
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
    object dxLayoutGroup1: TdxLayoutGroup
      Parent = dxLayoutControl1Group_Root
      CaptionOptions.Text = 'Pesquisa'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      Index = 0
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Par'#226'metro'
      Control = txtParametro
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = cxButton1
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignVert = avBottom
      CaptionOptions.ShowAccelChar = False
      CaptionOptions.Text = 'Barra de Status'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
      Control = dxStatusBar1
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignVert = avClient
      CaptionOptions.Text = 'Extravios'
      CaptionOptions.Layout = clTop
      Control = grdExtravios
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignHorz = ahLeft
      AlignVert = avBottom
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      Control = cxButton2
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignHorz = ahRight
      AlignVert = avBottom
      CaptionOptions.Text = 'cxButton3'
      CaptionOptions.Visible = False
      Control = cxButton3
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutControl1Group_Root
      AlignVert = avBottom
      LayoutDirection = ldHorizontal
      Index = 2
      AutoCreated = True
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      CaptionOptions.Text = 'cxButton4'
      CaptionOptions.Visible = False
      Control = cxButton4
      ControlOptions.ShowBorder = False
      Index = 1
    end
  end
  object aclPesquisa: TActionList
    Images = dm.cxImageList1
    Left = 656
    object actPesquisar: TAction
      Category = 'Pesquisa'
      Caption = 'Pesquisar'
      Hint = 'Pesquisar par'#226'metro'
      ImageIndex = 11
      OnExecute = actPesquisarExecute
    end
    object actSelecionar: TAction
      Category = 'Pesquisa'
      Caption = 'Selecionar'
      Hint = 'Selecionar item'
      ImageIndex = 0
      OnExecute = actSelecionarExecute
    end
    object actFechar: TAction
      Category = 'Pesquisa'
      Caption = 'Fechar'
      Hint = 'Fechar a pesquisa'
      ImageIndex = 103
      OnExecute = actFecharExecute
    end
    object actFinalizar: TAction
      Category = 'Pesquisa'
      Caption = 'Finalizar'
      Hint = 'Finalizar extravio'
      ImageIndex = 51
      Visible = False
      OnExecute = actFinalizarExecute
    end
  end
  object dsPesquisa: TDataSource
    AutoEdit = False
    DataSet = dm.mtbExtravios
    Left = 712
  end
  object dsAgentes: TDataSource
    AutoEdit = False
    DataSet = dm.qryROAgentes
    Left = 768
  end
  object dsEntregadores: TDataSource
    AutoEdit = False
    DataSet = dm.qryCodigosEntregadores
    Left = 824
  end
  object SaveDialog: TSaveDialog
    Left = 880
  end
end
