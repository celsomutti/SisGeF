object view_FechamentoExpressas: Tview_FechamentoExpressas
  Left = 0
  Top = 0
  Caption = 'Fechamento de Expressas'
  ClientHeight = 556
  ClientWidth = 1228
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  ScreenSnap = True
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 1228
    Height = 556
    Align = alClient
    TabOrder = 0
    LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
    object cxLabel1: TcxLabel
      Left = 10
      Top = 10
      Caption = 'Fechamento de Expressas'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.IsFontAssigned = True
      Transparent = True
    end
    object datInicio: TcxDateEdit
      Left = 50
      Top = 71
      Hint = 'Data do in'#237'cio do per'#237'odo'
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
      Width = 103
    end
    object datTermino: TcxDateEdit
      Left = 202
      Top = 71
      Hint = 'Data do t'#233'rmino do per'#237'odo'
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
      Width = 121
    end
    object btnCancelar: TcxButton
      Left = 10
      Top = 495
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Action = actCancelar
      TabOrder = 9
    end
    object btnEncerrar: TcxButton
      Left = 91
      Top = 495
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Action = actEncerrar
      TabOrder = 10
    end
    object cxButton1: TcxButton
      Left = 1143
      Top = 495
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Action = actFechar
      TabOrder = 12
    end
    object chkRestricoes: TcxCheckBox
      Left = 414
      Top = 71
      Hint = 'Aplicar restri'#231#245'es'
      State = cbsChecked
      Style.HotTrack = False
      TabOrder = 4
      Transparent = True
    end
    object chkLancamentos: TcxCheckBox
      Left = 524
      Top = 71
      State = cbsChecked
      Style.HotTrack = False
      TabOrder = 5
      Transparent = True
    end
    object chkSLA: TcxCheckBox
      Left = 613
      Top = 71
      Style.HotTrack = False
      TabOrder = 6
      Transparent = True
    end
    object btnPesquisar: TcxButton
      Left = 1120
      Top = 71
      Width = 88
      Height = 25
      Cursor = crHandPoint
      Action = actProcessar
      TabOrder = 7
    end
    object grdFechamento: TcxGrid
      Left = 10
      Top = 133
      Width = 250
      Height = 200
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      PopupMenu = ppmFechamento
      TabOrder = 8
      object tvFechamento: TcxGridDBTableView
        Navigator.Buttons.OnButtonClick = tvFechamentoNavigatorButtonsButtonClick
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
        Navigator.Buttons.Next.Hint = 'Ptr'#243'ximo registro'
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
        DataController.DataSource = dsFechamento
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0.00;- ,0.00'
            Kind = skSum
            Column = tvFechamentoVAL_PRODUCAO
          end
          item
            Format = ',0.00;- ,0.00'
            Kind = skSum
            Column = tvFechamentoVAL_RESTRICAO
          end
          item
            Format = ',0.00;- ,0.00'
            Kind = skSum
            Column = tvFechamentoVAL_EXTRAVIOS
          end
          item
            Format = ',0.00;- ,0.00'
            Kind = skSum
            Column = tvFechamentoVAL_CREDITOS
          end
          item
            Format = ',0.00;- ,0.00'
            Kind = skSum
            Column = tvFechamentoVAL_DEBITOS
          end
          item
            Format = ',0.00;- ,0.00'
            Kind = skSum
            Column = tvFechamentoVAL_TOTAL_DEBITOS
          end
          item
            Format = ',0.00;- ,0.00'
            Kind = skSum
            Column = tvFechamentoVAL_TOTAL_CREDITOS
          end
          item
            Format = ',0.00;- ,0.00'
            Kind = skSum
            Column = tvFechamentoVAL_TOTAL_GERAL
          end
          item
            Format = ',0.00;- ,0.00'
            Kind = skSum
            Column = tvFechamentoVAL_SALDO_RESTRICAO
          end
          item
            Format = ',0'
            Kind = skSum
            Column = tvFechamentoTOT_ENTREGAS
          end
          item
            Format = ',0.00;- ,0.00'
            Kind = skSum
            Column = tvFechamentoTOT_VERBA_FRANQUIA
          end
          item
            Format = ',0'
            Kind = skSum
            Column = tvFechamentoQTD_PFP
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnMoving = False
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsSelection.InvertSelect = False
        OptionsSelection.MultiSelect = True
        OptionsSelection.CellMultiSelect = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        OptionsView.Indicator = True
        object tvFechamentoRecId: TcxGridDBColumn
          DataBinding.FieldName = 'RecId'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvFechamentoID_FECHAMENTO: TcxGridDBColumn
          Caption = 'ID'
          DataBinding.FieldName = 'ID_FECHAMENTO'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvFechamentoDAT_INICIO: TcxGridDBColumn
          Caption = 'In'#237'cio'
          DataBinding.FieldName = 'DAT_INICIO'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvFechamentoDAT_FINAL: TcxGridDBColumn
          Caption = 'T'#233'rmino'
          DataBinding.FieldName = 'DAT_FINAL'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvFechamentoCOD_TIPO: TcxGridDBColumn
          Caption = 'Tipo'
          DataBinding.FieldName = 'COD_TIPO'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Images = dm.cxImageList1
          Properties.Items = <
            item
              Description = 'Agente'
              ImageIndex = 26
              Value = 1
            end
            item
              Description = 'Entregador'
              ImageIndex = 83
              Value = 2
            end>
          HeaderAlignmentHorz = taCenter
          SortIndex = 0
          SortOrder = soAscending
          Width = 102
        end
        object tvFechamentoCOD_EXPRESSA: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'COD_EXPRESSA'
          HeaderAlignmentHorz = taCenter
          SortIndex = 1
          SortOrder = soAscending
          Width = 100
        end
        object tvFechamentoNOM_EXPRESSA: TcxGridDBColumn
          Caption = 'Nome'
          DataBinding.FieldName = 'NOM_EXPRESSA'
          HeaderAlignmentHorz = taCenter
          Width = 221
        end
        object tvFechamentoTOT_ENTREGAS: TcxGridDBColumn
          Caption = 'Entregas'
          DataBinding.FieldName = 'TOT_ENTREGAS'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0;-,0'
          HeaderAlignmentHorz = taCenter
          Width = 87
        end
        object tvFechamentoVAL_VERBA_ENTREGADOR: TcxGridDBColumn
          Caption = 'Verba'
          DataBinding.FieldName = 'VAL_VERBA_ENTREGADOR'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ' ,0.00;- ,0.00'
          Visible = False
          HeaderAlignmentHorz = taCenter
          Width = 73
        end
        object tvFechamentoQTD_PFP: TcxGridDBColumn
          Caption = 'Acima 25KG'
          DataBinding.FieldName = 'QTD_PFP'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 79
        end
        object tvFechamentoVAL_PRODUCAO: TcxGridDBColumn
          Caption = 'Produ'#231#227'o'
          DataBinding.FieldName = 'VAL_PRODUCAO'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ' ,0.00;- ,0.00'
          HeaderAlignmentHorz = taCenter
          Width = 87
        end
        object tvFechamentoVAL_SALDO_RESTRICAO: TcxGridDBColumn
          Caption = 'Saldo Restri'#231#227'o'
          DataBinding.FieldName = 'VAL_SALDO_RESTRICAO'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ' ,0.00;- ,0.00'
          Visible = False
          HeaderAlignmentHorz = taCenter
          Width = 85
        end
        object tvFechamentoVAL_RESTRICAO: TcxGridDBColumn
          Caption = 'Restri'#231#227'o'
          DataBinding.FieldName = 'VAL_RESTRICAO'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ' ,0.00;- ,0.00'
          Visible = False
          HeaderAlignmentHorz = taCenter
          Width = 72
        end
        object tvFechamentoVAL_EXTRAVIOS: TcxGridDBColumn
          Caption = 'Extravios'
          DataBinding.FieldName = 'VAL_EXTRAVIOS'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ' ,0.00;- ,0.00'
          HeaderAlignmentHorz = taCenter
          Width = 89
        end
        object tvFechamentoVAL_CREDITOS: TcxGridDBColumn
          Caption = 'Cr'#233'ditos'
          DataBinding.FieldName = 'VAL_CREDITOS'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ' ,0.00;- ,0.00'
          HeaderAlignmentHorz = taCenter
          Width = 63
        end
        object tvFechamentoVAL_DEBITOS: TcxGridDBColumn
          Caption = 'D'#233'bitos'
          DataBinding.FieldName = 'VAL_DEBITOS'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ' ,0.00;- ,0.00'
          HeaderAlignmentHorz = taCenter
          Width = 95
        end
        object tvFechamentoVAL_FINANCIADO: TcxGridDBColumn
          Caption = 'Financiado'
          DataBinding.FieldName = 'VAL_FINANCIADO'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ' ,0.00;- ,0.00'
          Visible = False
          HeaderAlignmentHorz = taCenter
          Width = 92
        end
        object tvFechamentoVAL_TOTAL_CREDITOS: TcxGridDBColumn
          Caption = 'Total de Cr'#233'ditos'
          DataBinding.FieldName = 'VAL_TOTAL_CREDITOS'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ' ,0.00;- ,0.00'
          HeaderAlignmentHorz = taCenter
          Width = 88
        end
        object tvFechamentoVAL_TOTAL_DEBITOS: TcxGridDBColumn
          Caption = 'Total de D'#233'bitos'
          DataBinding.FieldName = 'VAL_TOTAL_DEBITOS'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ' ,0.00;- ,0.00'
          HeaderAlignmentHorz = taCenter
          Width = 93
        end
        object tvFechamentoDES_LOG: TcxGridDBColumn
          Caption = 'LOG'
          DataBinding.FieldName = 'DES_LOG'
          PropertiesClassName = 'TcxBlobEditProperties'
          Properties.BlobEditKind = bekMemo
          Visible = False
          HeaderAlignmentHorz = taCenter
          Width = 74
        end
        object tvFechamentoDOM_FECHADO: TcxGridDBColumn
          DataBinding.FieldName = 'DOM_FECHADO'
          Visible = False
          VisibleForCustomization = False
          Width = 50
        end
        object tvFechamentoVAL_TOTAL_GERAL: TcxGridDBColumn
          Caption = 'Total Geral'
          DataBinding.FieldName = 'VAL_TOTAL_GERAL'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ' ,0.00;- ,0.00'
          HeaderAlignmentHorz = taCenter
          Width = 107
        end
        object tvFechamentoTOT_VERBA_FRANQUIA: TcxGridDBColumn
          Caption = 'Recebido Franquia'
          DataBinding.FieldName = 'TOT_VERBA_FRANQUIA'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ' ,0.00;- ,0.00'
          Visible = False
          HeaderAlignmentHorz = taCenter
          Width = 84
        end
        object tvFechamentoDES_EXTRATOS: TcxGridDBColumn
          DataBinding.FieldName = 'DES_EXTRATOS'
          Visible = False
        end
        object tvFechamentoNOM_FAVORECIDO: TcxGridDBColumn
          Caption = 'Favorecido'
          DataBinding.FieldName = 'NOM_FAVORECIDO'
          HeaderAlignmentHorz = taCenter
          Width = 268
        end
        object tvFechamentoNUM_CPF_CNPJ: TcxGridDBColumn
          Caption = 'CPF/CNPJ'
          DataBinding.FieldName = 'NUM_CPF_CNPJ'
          HeaderAlignmentHorz = taCenter
        end
        object tvFechamentoCOD_BANCO: TcxGridDBColumn
          Caption = 'Banco'
          DataBinding.FieldName = 'COD_BANCO'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'COD_BANCO'
          Properties.ListColumns = <
            item
              FieldName = 'NOM_BANCO'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dsBancos
          HeaderAlignmentHorz = taCenter
          Width = 172
        end
        object tvFechamentoCOD_AGENCIA: TcxGridDBColumn
          Caption = 'Ag'#234'ncia'
          DataBinding.FieldName = 'COD_AGENCIA'
          HeaderAlignmentHorz = taCenter
        end
        object tvFechamentoCOD_TIPO_CONTA: TcxGridDBColumn
          Caption = 'Tipo'
          DataBinding.FieldName = 'DES_TIPO_CONTA'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 163
        end
        object tvFechamentoNUM_CONTA: TcxGridDBColumn
          Caption = 'Conta'
          DataBinding.FieldName = 'NUM_CONTA'
          HeaderAlignmentHorz = taCenter
        end
      end
      object lvFechamento: TcxGridLevel
        GridView = tvFechamento
      end
    end
    object sbFechamento: TdxStatusBar
      Left = 10
      Top = 526
      Width = 0
      Height = 20
      Panels = <
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          PanelStyle.Font.Charset = DEFAULT_CHARSET
          PanelStyle.Font.Color = clWindowText
          PanelStyle.Font.Height = -11
          PanelStyle.Font.Name = 'Tahoma'
          PanelStyle.Font.Style = [fsBold]
          PanelStyle.ParentFont = False
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
        object pbFechamento: TcxProgressBar
          Left = 0
          Top = 0
          Align = alClient
          TabOrder = 0
          Visible = False
          Width = 202
        end
      end
    end
    object dxActivityIndicator1: TdxActivityIndicator
      Left = 1191
      Top = 10
      Width = 27
      Height = 31
      PropertiesClassName = 'TdxActivityIndicatorCircularDotsProperties'
    end
    object cxLabel2: TcxLabel
      Left = 630
      Top = 503
      Caption = '0'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.IsFontAssigned = True
      Transparent = True
    end
    object dxLayoutControl1Group_Root: TdxLayoutGroup
      AlignHorz = ahParentManaged
      AlignVert = avParentManaged
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup2
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'cxLabel1'
      CaptionOptions.Visible = False
      Control = cxLabel1
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup1: TdxLayoutGroup
      Parent = dxLayoutControl1Group_Root
      CaptionOptions.Text = 'Par'#226'metros'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      Index = 1
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = 'In'#237'cio'
      Control = datInicio
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahLeft
      AlignVert = avClient
      CaptionOptions.Text = 'T'#233'rmino'
      Control = datTermino
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignHorz = ahLeft
      AlignVert = avBottom
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnCancelar
      ControlOptions.ShowBorder = False
      Enabled = False
      Index = 0
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignVert = avBottom
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnEncerrar
      ControlOptions.ShowBorder = False
      Enabled = False
      Index = 1
    end
    object dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutControl1Group_Root
      AlignVert = avBottom
      LayoutDirection = ldHorizontal
      Index = 3
      AutoCreated = True
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignHorz = ahRight
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = cxButton1
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Aplicar Restri'#231#227'o'
      Control = chkRestricoes
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem11: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahLeft
      CaptionOptions.Text = 'D'#233'bitos/Cr'#233'ditos'
      Control = chkLancamentos
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem12: TdxLayoutItem
      Parent = dxLayoutGroup1
      CaptionOptions.Text = 'Calcular SLA'
      Control = chkSLA
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahRight
      AlignVert = avTop
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnPesquisar
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutItem13: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignVert = avClient
      CaptionOptions.Text = 'Fechamentos'
      CaptionOptions.Layout = clTop
      Control = grdFechamento
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem14: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignVert = avBottom
      CaptionOptions.Text = 'Barra de Status'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      Control = sbFechamento
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup2
      AlignHorz = ahRight
      AlignVert = avTop
      CaptionOptions.Text = 'dxActivityIndicator1'
      CaptionOptions.Visible = False
      Control = dxActivityIndicator1
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutAutoCreatedGroup2: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutControl1Group_Root
      AlignVert = avTop
      LayoutDirection = ldHorizontal
      Index = 0
      AutoCreated = True
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignHorz = ahCenter
      AlignVert = avBottom
      CaptionOptions.Text = 'Raio-X: '
      Control = cxLabel2
      ControlOptions.ShowBorder = False
      Index = 2
    end
  end
  object aclFechamento: TActionList
    Images = dm.iml16x16
    Left = 800
    Top = 8
    object actProcessar: TAction
      Category = 'Fechamento'
      Caption = 'Processar'
      Hint = 'Processar per'#237'odo informado'
      ImageIndex = 39
      OnExecute = actProcessarExecute
    end
    object actReprocessar: TAction
      Category = 'Fechamento'
      Caption = 'Reprocessar'
      Enabled = False
      Hint = 'Reprocessar fechamento'
      ImageIndex = 7
    end
    object actCancelar: TAction
      Category = 'Fechamento'
      Caption = 'Cancelar'
      Enabled = False
      Hint = 'Cancelar fechamento  em aberto'
      ImageIndex = 26
      OnExecute = actCancelarExecute
    end
    object actEncerrar: TAction
      Category = 'Fechamento'
      Caption = 'Encerrar'
      Enabled = False
      Hint = 'Enerrar fechamento'
      ImageIndex = 3
      OnExecute = actEncerrarExecute
    end
    object actReabrir: TAction
      Category = 'Fechamento'
      Caption = 'Reabrir'
      Enabled = False
      Hint = 'Reabrir fechamento encerrado'
      ImageIndex = 13
    end
    object actFechar: TAction
      Category = 'Fechamento'
      Caption = 'Fechar'
      Hint = 'Fechar a tela atual'
      ImageIndex = 6
      OnExecute = actFecharExecute
    end
    object actExtrato: TAction
      Category = 'Fechamento'
      Caption = 'Extrato'
      Hint = 'Visualizar Extrato'
      ImageIndex = 43
      OnExecute = actExtratoExecute
    end
    object actExtravios: TAction
      Category = 'Fechamento'
      Caption = 'Extravios'
      Hint = 'Detalhar extravios'
      ImageIndex = 8
      OnExecute = actExtraviosExecute
    end
    object actLancamentos: TAction
      Category = 'Fechamento'
      Caption = 'Lan'#231'amentos'
      Hint = 'Visualizar os detalhes dos lan'#231'amentos de d'#233'bitos e cr'#233'ditos'
      ImageIndex = 44
      OnExecute = actLancamentosExecute
    end
    object actFinanciar: TAction
      Category = 'Fechamento'
      Caption = 'Financiar'
      Hint = 'Financiar o valor de d'#233'bito'
      ImageIndex = 49
      OnExecute = actFinanciarExecute
    end
  end
  object mtbFechamento: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 840
    Top = 8
    object mtbFechamentoID_FECHAMENTO: TIntegerField
      FieldName = 'ID_FECHAMENTO'
    end
    object mtbFechamentoDAT_INICIO: TDateField
      FieldName = 'DAT_INICIO'
    end
    object mtbFechamentoDAT_FINAL: TDateField
      FieldName = 'DAT_FINAL'
    end
    object mtbFechamentoCOD_TIPO: TIntegerField
      FieldName = 'COD_TIPO'
    end
    object mtbFechamentoCOD_EXPRESSA: TIntegerField
      FieldName = 'COD_EXPRESSA'
    end
    object mtbFechamentoNOM_EXPRESSA: TStringField
      FieldName = 'NOM_EXPRESSA'
      Size = 70
    end
    object mtbFechamentoVAL_PRODUCAO: TFloatField
      FieldName = 'VAL_PRODUCAO'
    end
    object mtbFechamentoVAL_SALDO_RESTRICAO: TFloatField
      FieldName = 'VAL_SALDO_RESTRICAO'
    end
    object mtbFechamentoVAL_RESTRICAO: TFloatField
      FieldName = 'VAL_RESTRICAO'
    end
    object mtbFechamentoVAL_EXTRAVIOS: TFloatField
      FieldName = 'VAL_EXTRAVIOS'
    end
    object mtbFechamentoVAL_CREDITOS: TFloatField
      FieldName = 'VAL_CREDITOS'
    end
    object mtbFechamentoVAL_DEBITOS: TFloatField
      FieldName = 'VAL_DEBITOS'
    end
    object mtbFechamentoVAL_FINANCIADO: TFloatField
      FieldName = 'VAL_FINANCIADO'
    end
    object mtbFechamentoVAL_TOTAL_DEBITOS: TFloatField
      FieldName = 'VAL_TOTAL_DEBITOS'
    end
    object mtbFechamentoVAL_TOTAL_CREDITOS: TFloatField
      FieldName = 'VAL_TOTAL_CREDITOS'
    end
    object mtbFechamentoVAL_TOTAL_GERAL: TFloatField
      FieldName = 'VAL_TOTAL_GERAL'
    end
    object mtbFechamentoDOM_FECHADO: TIntegerField
      FieldName = 'DOM_FECHADO'
    end
    object mtbFechamentoDES_EXTRATOS: TMemoField
      FieldName = 'DES_EXTRATOS'
      BlobType = ftMemo
    end
    object mtbFechamentoTOT_ENTREGAS: TIntegerField
      FieldName = 'TOT_ENTREGAS'
    end
    object mtbFechamentoDES_LOG: TMemoField
      FieldName = 'DES_LOG'
      BlobType = ftMemo
    end
    object mtbFechamentoVAL_VERBA_ENTREGADOR: TFloatField
      FieldName = 'VAL_VERBA_ENTREGADOR'
    end
    object mtbFechamentoTOT_VERBA_FRANQUIA: TFloatField
      FieldName = 'TOT_VERBA_FRANQUIA'
    end
    object mtbFechamentoQTD_PFP: TIntegerField
      FieldName = 'QTD_PFP'
    end
    object mtbFechamentoNOM_FAVORECIDO: TStringField
      FieldName = 'NOM_FAVORECIDO'
      Size = 70
    end
    object mtbFechamentoNUM_CPF_CNPJ: TStringField
      FieldName = 'NUM_CPF_CNPJ'
    end
    object mtbFechamentoCOD_BANCO: TIntegerField
      FieldName = 'COD_BANCO'
    end
    object mtbFechamentoCOD_AGENCIA: TStringField
      FieldName = 'COD_AGENCIA'
      Size = 10
    end
    object mtbFechamentoDES_TIPO_CONTA: TStringField
      FieldName = 'DES_TIPO_CONTA'
      Size = 30
    end
    object mtbFechamentoNUM_CONTA: TStringField
      FieldName = 'NUM_CONTA'
      Size = 30
    end
  end
  object dsFechamento: TDataSource
    AutoEdit = False
    DataSet = mtbFechamento
    Left = 888
    Top = 8
  end
  object SaveDialog: TSaveDialog
    Left = 760
    Top = 8
  end
  object ppmFechamento: TPopupMenu
    Images = dm.iml16x16
    Left = 704
    Top = 8
    object Extrato1: TMenuItem
      Action = actExtrato
    end
    object Extravios1: TMenuItem
      Action = actExtravios
    end
    object Lanamentos1: TMenuItem
      Action = actLancamentos
    end
    object Financiar1: TMenuItem
      Action = actFinanciar
    end
  end
  object mtbBancos: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 592
    Top = 8
    object mtbBancosCOD_BANCO: TStringField
      FieldName = 'COD_BANCO'
      Size = 4
    end
    object mtbBancosNOM_BANCO: TStringField
      FieldName = 'NOM_BANCO'
      Size = 50
    end
  end
  object dsBancos: TDataSource
    AutoEdit = False
    DataSet = mtbBancos
    Left = 640
    Top = 8
  end
end
