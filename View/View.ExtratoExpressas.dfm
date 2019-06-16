object view_ExtratoExpressas: Tview_ExtratoExpressas
  Left = 0
  Top = 0
  Caption = 'Extrato de Expressas'
  ClientHeight = 527
  ClientWidth = 1144
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  ShowHint = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 1144
    Height = 527
    Align = alClient
    TabOrder = 0
    LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
    object cxLabel1: TcxLabel
      Left = 10
      Top = 10
      Caption = 'Extrato de Expressas'
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
    object grdExtrato: TcxGrid
      Left = 10
      Top = 61
      Width = 250
      Height = 380
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object tvExtrato: TcxGridDBTableView
        Navigator.Buttons.OnButtonClick = tvExtratoNavigatorButtonsButtonClick
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
        Navigator.Buttons.Filter.Hint = 'Filtrar dados'
        Navigator.Buttons.Filter.ImageIndex = 41
        Navigator.Buttons.Filter.Visible = True
        Navigator.InfoPanel.Visible = True
        Navigator.Visible = True
        DataController.DataSource = dsExtrato
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0;-,0'
            Kind = skSum
            Column = tvExtratoQTD_ENTREGAS
          end
          item
            Format = ',0;-,0'
            Kind = skSum
            Column = tvExtratoQTD_ITENS_ATRASO
          end
          item
            Format = ',0;-,0'
            Kind = skSum
            Column = tvExtratoQTD_VOLUMES
          end
          item
            Format = ',0;-,0.0'
            Kind = skSum
            Column = tvExtratoQTD_VOLUMES_EXTRA
          end
          item
            Format = ',0.00;-,0.00'
            Kind = skSum
            Column = tvExtratoVAL_CREDITOS
          end
          item
            Format = ',0.00;-,0.00'
            Kind = skSum
            Column = tvExtratoVAL_DEBITOS
          end
          item
            Format = ',0.00;-,0.00'
            Kind = skSum
            Column = tvExtratoVAL_ENTREGAS
          end
          item
            Format = ',0.00;-,0.00'
            Kind = skSum
            Column = tvExtratoVAL_EXTRAVIOS
          end
          item
            Format = ',0.00;-,0.00'
            Kind = skSum
            Column = tvExtratoVAL_PRODUCAO
          end
          item
            Format = ',0.00;-,0.00'
            Kind = skSum
            Column = tvExtratoVAL_RESTRICAO
          end
          item
            Format = ',0.00;-,0.00'
            Kind = skSum
            Column = tvExtratoVAL_TOTAL_CREDTOS
          end
          item
            Format = ',0.00;-,0.00'
            Kind = skSum
            Column = tvExtratoVAL_TOTAL_DEBITOS
          end
          item
            Format = ',0.00;-,0.00'
            Kind = skSum
            Column = tvExtratoVAL_TOTAL_GERAL
          end
          item
            Format = ',0.00;-,0.00'
            Kind = skSum
            Column = tvExtratoVAL_VOLUMES_EXTRA
          end
          item
            Column = tvExtratoNOM_ENTREGADOR
            DisplayText = 'Total Geral'
          end>
        DataController.Summary.SummaryGroups = <
          item
            Links = <
              item
                Column = tvExtratoNOM_AGENTE
              end>
            SummaryItems = <
              item
                Format = ',0;-,0'
                Kind = skSum
                Position = spFooter
                Column = tvExtratoQTD_ENTREGAS
              end
              item
                Format = ',0;-,0'
                Kind = skSum
                Position = spFooter
                Column = tvExtratoQTD_ITENS_ATRASO
              end
              item
                Format = ',0;-,0'
                Kind = skSum
                Position = spFooter
                Column = tvExtratoQTD_VOLUMES
              end
              item
                Format = ',0;-,0'
                Kind = skSum
                Position = spFooter
                Column = tvExtratoQTD_VOLUMES_EXTRA
              end
              item
                Format = ',0.00;-,0.00'
                Kind = skSum
                Position = spFooter
                Column = tvExtratoVAL_CREDITOS
              end
              item
                Format = ',0.00;-,0.00'
                Kind = skSum
                Position = spFooter
                Column = tvExtratoVAL_DEBITOS
              end
              item
                Format = ',0.00;-,0.00'
                Kind = skSum
                Position = spFooter
                Column = tvExtratoVAL_ENTREGAS
              end
              item
                Format = ',0.00;-,0.00'
                Kind = skSum
                Position = spFooter
                Column = tvExtratoVAL_EXTRAVIOS
              end
              item
                Format = ',0.00;-,0.00'
                Kind = skSum
                Position = spFooter
                Column = tvExtratoVAL_PRODUCAO
              end
              item
                Format = ',0.00;-,0.00'
                Kind = skSum
                Position = spFooter
                Column = tvExtratoVAL_RESTRICAO
              end
              item
                Format = ',0.00;-,0.00'
                Kind = skSum
                Position = spFooter
                Column = tvExtratoVAL_TOTAL_CREDTOS
              end
              item
                Format = ',0.00;-,0.00'
                Kind = skSum
                Position = spFooter
                Column = tvExtratoVAL_TOTAL_DEBITOS
              end
              item
                Format = ',0.00;-,0.00'
                Kind = skSum
                Position = spFooter
                Column = tvExtratoVAL_TOTAL_GERAL
              end
              item
                Format = ',0.00;-,0.00'
                Kind = skSum
                Position = spFooter
                Column = tvExtratoVAL_VOLUMES_EXTRA
              end>
          end>
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnSorting = False
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.InvertSelect = False
        OptionsSelection.MultiSelect = True
        OptionsSelection.CellMultiSelect = True
        OptionsView.Footer = True
        OptionsView.GroupFooterMultiSummaries = True
        OptionsView.GroupFooters = gfAlwaysVisible
        OptionsView.GroupSummaryLayout = gslAlignWithColumns
        OptionsView.Indicator = True
        object tvExtratoRecId: TcxGridDBColumn
          DataBinding.FieldName = 'RecId'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvExtratoID_EXTRATO: TcxGridDBColumn
          Caption = 'ID'
          DataBinding.FieldName = 'ID_EXTRATO'
          Visible = False
          HeaderAlignmentHorz = taCenter
          Width = 27
        end
        object tvExtratoCOD_AGENTE: TcxGridDBColumn
          Caption = 'Agente'
          DataBinding.FieldName = 'COD_AGENTE'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvExtratoNOM_AGENTE: TcxGridDBColumn
          Caption = 'Nome do Agente'
          DataBinding.FieldName = 'NOM_AGENTE'
          Visible = False
          GroupIndex = 0
          HeaderAlignmentHorz = taCenter
        end
        object tvExtratoCOD_ENTREGADOR: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'COD_ENTREGADOR'
          HeaderAlignmentHorz = taCenter
          SortIndex = 0
          SortOrder = soAscending
          Width = 54
        end
        object tvExtratoNOM_ENTREGADOR: TcxGridDBColumn
          Caption = 'Nome do Entregador'
          DataBinding.FieldName = 'NOM_ENTREGADOR'
          HeaderAlignmentHorz = taCenter
          Width = 202
        end
        object tvExtratoDAT_INICIO: TcxGridDBColumn
          Caption = 'In'#237'cio'
          DataBinding.FieldName = 'DAT_INICIO'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.SaveTime = False
          Properties.ShowTime = False
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvExtratoDAT_FINAL: TcxGridDBColumn
          Caption = 'Final'
          DataBinding.FieldName = 'DAT_FINAL'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.SaveTime = False
          Properties.ShowTime = False
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvExtratoDAT_PAGAMENTO: TcxGridDBColumn
          Caption = 'Pagamento'
          DataBinding.FieldName = 'DAT_PAGAMENTO'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.SaveTime = False
          Properties.ShowTime = False
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvExtratoVAL_PERCENTUAL_SLA: TcxGridDBColumn
          Caption = '% SLA'
          DataBinding.FieldName = 'VAL_PERCENTUAL_SLA'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ' ,0.000;- ,0.000'
          HeaderAlignmentHorz = taCenter
        end
        object tvExtratoVAL_VERBA: TcxGridDBColumn
          Caption = 'Verba'
          DataBinding.FieldName = 'VAL_VERBA'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ' ,0.00;- ,0.00'
          HeaderAlignmentHorz = taCenter
        end
        object tvExtratoQTD_VOLUMES: TcxGridDBColumn
          Caption = 'Volumes'
          DataBinding.FieldName = 'QTD_VOLUMES'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.;-,0'
          HeaderAlignmentHorz = taCenter
        end
        object tvExtratoQTD_ENTREGAS: TcxGridDBColumn
          Caption = 'Entregas'
          DataBinding.FieldName = 'QTD_ENTREGAS'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.;-,0'
          HeaderAlignmentHorz = taCenter
        end
        object tvExtratoQTD_ITENS_ATRASO: TcxGridDBColumn
          Caption = 'Atraso'
          DataBinding.FieldName = 'QTD_ITENS_ATRASO'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.;-,0'
          HeaderAlignmentHorz = taCenter
        end
        object tvExtratoQTD_VOLUMES_EXTRA: TcxGridDBColumn
          Caption = 'PFP'
          DataBinding.FieldName = 'QTD_PFP'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DecimalPlaces = 0
          Properties.DisplayFormat = ',0;-,0'
          HeaderAlignmentHorz = taCenter
        end
        object tvExtratoVAL_VOLUMES_EXTRA: TcxGridDBColumn
          Caption = 'Valor PFP'
          DataBinding.FieldName = 'VAL_VOLUMES_EXTRA'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ' ,0.00;- ,0.00'
          HeaderAlignmentHorz = taCenter
          Width = 101
        end
        object tvExtratoVAL_ENTREGAS: TcxGridDBColumn
          Caption = 'Valor Entregas'
          DataBinding.FieldName = 'VAL_ENTREGAS'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ' ,0.00;- ,0.00'
          HeaderAlignmentHorz = taCenter
          Width = 87
        end
        object tvExtratoVAL_PRODUCAO: TcxGridDBColumn
          Caption = 'Valor Produ'#231#227'o'
          DataBinding.FieldName = 'VAL_PRODUCAO'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ' ,0.00;- ,0.00'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvExtratoVAL_CREDITOS: TcxGridDBColumn
          Caption = 'Valor Cr'#233'ditos'
          DataBinding.FieldName = 'VAL_CREDITOS'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ' ,0.00;- ,0.00'
          HeaderAlignmentHorz = taCenter
          Width = 84
        end
        object tvExtratoVAL_RESTRICAO: TcxGridDBColumn
          Caption = 'Valor Restri'#231#227'o'
          DataBinding.FieldName = 'VAL_RESTRICAO'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ' ,0.00;- ,0.00'
          HeaderAlignmentHorz = taCenter
          Width = 102
        end
        object tvExtratoVAL_EXTRAVIOS: TcxGridDBColumn
          Caption = 'Valor Extravios'
          DataBinding.FieldName = 'VAL_EXTRAVIOS'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ' ,0.00;- ,0.00'
          HeaderAlignmentHorz = taCenter
          Width = 90
        end
        object tvExtratoVAL_DEBITOS: TcxGridDBColumn
          Caption = 'Valor D'#233'bitos'
          DataBinding.FieldName = 'VAL_DEBITOS'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ' ,0.00;- ,0.00'
          HeaderAlignmentHorz = taCenter
          Width = 80
        end
        object tvExtratoVAL_TOTAL_CREDTOS: TcxGridDBColumn
          Caption = 'Total Cr'#233'ditos'
          DataBinding.FieldName = 'VAL_TOTAL_CREDTOS'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ' ,0.00;- ,0.00'
          HeaderAlignmentHorz = taCenter
          Width = 84
        end
        object tvExtratoVAL_TOTAL_DEBITOS: TcxGridDBColumn
          Caption = 'Total D'#233'bitos'
          DataBinding.FieldName = 'VAL_TOTAL_DEBITOS'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ' ,0.00;- ,0.00'
          HeaderAlignmentHorz = taCenter
          Width = 80
        end
        object tvExtratoVAL_TOTAL_GERAL: TcxGridDBColumn
          Caption = 'Total Geral'
          DataBinding.FieldName = 'VAL_TOTAL_GERAL'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ' ,0.00;- ,0.00'
          HeaderAlignmentHorz = taCenter
          Width = 88
        end
        object tvExtratoDOM_FECHADO: TcxGridDBColumn
          Caption = 'Fechado'
          DataBinding.FieldName = 'DOM_FECHADO'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.Images = dm.iml16x16
          Properties.Items = <
            item
              Description = 'ABERTO'
              ImageIndex = 45
              Value = 0
            end
            item
              Description = 'FECHADO'
              ImageIndex = 3
              Value = 1
            end>
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvExtratoDES_LOG: TcxGridDBColumn
          Caption = 'Log'
          DataBinding.FieldName = 'DES_LOG'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
      end
      object lvExtrato: TcxGridLevel
        GridView = tvExtrato
      end
    end
    object sbExtrato: TdxStatusBar
      Left = 10
      Top = 497
      Width = 0
      Height = 20
      Panels = <
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Fixed = False
        end
        item
          PanelStyleClassName = 'TdxStatusBarContainerPanelStyle'
          PanelStyle.Container = sbExtratoContainer1
          Bevel = dxpbNone
          Width = 200
        end>
      PaintStyle = stpsUseLookAndFeel
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      object sbExtratoContainer1: TdxStatusBarContainerControl
        Left = 24
        Top = 2
        Width = 202
        Height = 17
        object pbExtrato: TcxProgressBar
          Left = 0
          Top = 0
          Align = alClient
          TabOrder = 0
          Visible = False
          Width = 202
        end
      end
    end
    object btnFechar: TcxButton
      Left = 1059
      Top = 466
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Action = actFechar
      TabOrder = 2
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
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'cxLabel1'
      CaptionOptions.Visible = False
      Control = cxLabel1
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignVert = avClient
      CaptionOptions.Text = 'Extrato'
      CaptionOptions.Layout = clTop
      Control = grdExtrato
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahClient
      AlignVert = avBottom
      CaptionOptions.Text = 'Barra de Status'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      Control = sbExtrato
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahRight
      AlignVert = avTop
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnFechar
      ControlOptions.ShowBorder = False
      Index = 2
    end
  end
  object mtbExtrato: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 880
    Top = 8
    object mtbExtratoID_EXTRATO: TIntegerField
      FieldName = 'ID_EXTRATO'
    end
    object mtbExtratoCOD_AGENTE: TIntegerField
      FieldName = 'COD_AGENTE'
    end
    object mtbExtratoNOM_AGENTE: TStringField
      FieldName = 'NOM_AGENTE'
      Size = 70
    end
    object mtbExtratoCOD_ENTREGADOR: TIntegerField
      FieldName = 'COD_ENTREGADOR'
    end
    object mtbExtratoNOM_ENTREGADOR: TStringField
      FieldName = 'NOM_ENTREGADOR'
      Size = 70
    end
    object mtbExtratoDAT_INICIO: TDateField
      FieldName = 'DAT_INICIO'
    end
    object mtbExtratoDAT_FINAL: TDateField
      FieldName = 'DAT_FINAL'
    end
    object mtbExtratoDAT_PAGAMENTO: TDateField
      FieldName = 'DAT_PAGAMENTO'
    end
    object mtbExtratoQTD_VOLUMES: TIntegerField
      FieldName = 'QTD_VOLUMES'
    end
    object mtbExtratoQTD_ENTREGAS: TIntegerField
      FieldName = 'QTD_ENTREGAS'
    end
    object mtbExtratoQTD_ITENS_ATRASO: TIntegerField
      FieldName = 'QTD_ITENS_ATRASO'
    end
    object mtbExtratoQTD_VOLUMES_EXTRA: TFloatField
      FieldName = 'QTD_VOLUMES_EXTRA'
    end
    object mtbExtratoVAL_PERCENTUAL_SLA: TFloatField
      FieldName = 'VAL_PERCENTUAL_SLA'
    end
    object mtbExtratoVAL_VERBA: TFloatField
      FieldName = 'VAL_VERBA'
    end
    object mtbExtratoVAL_ENTREGAS: TFloatField
      FieldName = 'VAL_ENTREGAS'
    end
    object mtbExtratoVAL_VOLUMES_EXTRA: TFloatField
      FieldName = 'VAL_VOLUMES_EXTRA'
    end
    object mtbExtratoVAL_PRODUCAO: TFloatField
      FieldName = 'VAL_PRODUCAO'
    end
    object mtbExtratoVAL_CREDITOS: TFloatField
      FieldName = 'VAL_CREDITOS'
    end
    object mtbExtratoVAL_RESTRICAO: TFloatField
      FieldName = 'VAL_RESTRICAO'
    end
    object mtbExtratoVAL_EXTRAVIOS: TFloatField
      FieldName = 'VAL_EXTRAVIOS'
    end
    object mtbExtratoVAL_DEBITOS: TFloatField
      FieldName = 'VAL_DEBITOS'
    end
    object mtbExtratoVAL_TOTAL_CREDTOS: TFloatField
      FieldName = 'VAL_TOTAL_CREDTOS'
    end
    object mtbExtratoVAL_TOTAL_DEBITOS: TFloatField
      FieldName = 'VAL_TOTAL_DEBITOS'
    end
    object mtbExtratoVAL_TOTAL_GERAL: TFloatField
      FieldName = 'VAL_TOTAL_GERAL'
    end
    object mtbExtratoDOM_FECHADO: TIntegerField
      FieldName = 'DOM_FECHADO'
    end
    object mtbExtratoDES_LOG: TMemoField
      FieldName = 'DES_LOG'
      BlobType = ftMemo
    end
    object mtbExtratoQTD_PFP: TIntegerField
      FieldName = 'QTD_PFP'
    end
  end
  object dsExtrato: TDataSource
    AutoEdit = False
    DataSet = mtbExtrato
    Left = 944
    Top = 8
  end
  object aclExtrato: TActionList
    Images = dm.iml16x16
    Left = 1000
    Top = 8
    object actFechar: TAction
      Caption = 'Fechar'
      Hint = 'Fechar a tela'
      ImageIndex = 6
      OnExecute = actFecharExecute
    end
  end
  object SaveDialog: TSaveDialog
    Left = 1056
    Top = 8
  end
end
