object frmControleTransportes: TfrmControleTransportes
  Left = 0
  Top = 0
  Caption = 'Controle de Transportes'
  ClientHeight = 709
  ClientWidth = 1374
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel27: TcxLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alTop
    AutoSize = False
    Caption = 'Controle de Transportes'
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Properties.Alignment.Vert = taVCenter
    Transparent = True
    Height = 22
    Width = 1368
    AnchorY = 14
  end
  object lcTransporte: TdxLayoutControl
    Left = 0
    Top = 54
    Width = 1374
    Height = 655
    Align = alClient
    TabOrder = 1
    LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
    OptionsImage.Images = dm.cxImageList1
    object lcbMotorista: TcxDBLookupComboBox
      Left = 161
      Top = 459
      Hint = 'Nome do Motorista'
      DataBinding.DataField = 'COD_MOTORISTA'
      DataBinding.DataSource = dsTransporte
      Properties.KeyFieldNames = 'COD_CADASTRO'
      Properties.ListColumns = <
        item
          FieldName = 'DES_RAZAO_SOCIAL'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsEntregadores
      Style.HotTrack = False
      TabOrder = 13
      Width = 505
    end
    object edtCodigoMotorista: TcxDBMaskEdit
      Left = 80
      Top = 459
      Hint = 'C'#243'digo do Motorista'
      DataBinding.DataField = 'COD_MOTORISTA'
      DataBinding.DataSource = dsTransporte
      Properties.Alignment.Horz = taRightJustify
      Properties.IgnoreMaskBlank = True
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d\d\d\d\d\d'
      Properties.ReadOnly = False
      Style.HotTrack = False
      TabOrder = 12
      Width = 75
    end
    object edtID: TcxDBMaskEdit
      Left = 80
      Top = 432
      Hint = 'ID do Transporte'
      TabStop = False
      DataBinding.DataField = 'ID_CONTROLE'
      DataBinding.DataSource = dsTransporte
      Properties.Alignment.Horz = taRightJustify
      Properties.IgnoreMaskBlank = True
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d\d\d\d\d\d'
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 5
      Width = 63
    end
    object edtServicos: TcxDBButtonEdit
      Left = 80
      Top = 486
      Hint = 'Descri'#231#227'o dos Servi'#231'os'
      DataBinding.DataField = 'DES_SERVICO'
      DataBinding.DataSource = dsTransporte
      Properties.Buttons = <
        item
          Action = actLocalizar
          Default = True
          Kind = bkGlyph
        end>
      Properties.Images = dm.cxImageList1
      Style.HotTrack = False
      TabOrder = 18
      Width = 585
    end
    object grdViagens: TcxGrid
      Left = 10
      Top = 37
      Width = 1354
      Height = 390
      TabOrder = 4
      object tvViagens: TcxGridDBTableView
        OnDblClick = tvViagensDblClick
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.Images = dm.cxImageList1
        Navigator.Buttons.First.ImageIndex = 99
        Navigator.Buttons.PriorPage.Visible = False
        Navigator.Buttons.Prior.ImageIndex = 102
        Navigator.Buttons.Next.ImageIndex = 101
        Navigator.Buttons.NextPage.Visible = False
        Navigator.Buttons.Last.ImageIndex = 100
        Navigator.Buttons.Insert.Visible = False
        Navigator.Buttons.Delete.Visible = False
        Navigator.Buttons.Edit.Visible = False
        Navigator.Buttons.Post.Visible = False
        Navigator.Buttons.Cancel.Visible = False
        Navigator.Buttons.Refresh.ImageIndex = 40
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.Buttons.GotoBookmark.Visible = False
        Navigator.Buttons.Filter.ImageIndex = 67
        Navigator.Buttons.Filter.Visible = True
        Navigator.InfoPanel.Visible = True
        Navigator.Visible = True
        OnCanSelectRecord = tvViagensCanSelectRecord
        DataController.DataSource = dsTransporte
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0;-,0'
            Kind = skSum
            Column = tvViagensQTD_KM_RODADO
          end
          item
            Format = ',0.00;-,0.00'
            Kind = skSum
            Column = tvViagensVAL_SERVICO
          end
          item
            Format = ',0.00;-,0.00'
            Kind = skSum
            Column = tvViagensVAL_TOTAL_COMBUSTIVEL
          end
          item
            Format = ',0.00;-,0.00'
            Kind = skSum
            Column = tvViagensVAL_TOTAL_INSUMOS
          end>
        DataController.Summary.SummaryGroups = <
          item
            Links = <
              item
                Column = tvViagensCOD_CLIENTE
              end>
            SummaryItems = <
              item
                Format = ',0;-,0'
                Kind = skSum
                Position = spFooter
                Column = tvViagensQTD_KM_RODADO
              end
              item
                Format = ',0.00;-,0.00'
                Kind = skSum
                Position = spFooter
                Column = tvViagensVAL_SERVICO
              end>
          end
          item
            Links = <
              item
                Column = tvViagensDES_SERVICO
              end>
            SummaryItems = <
              item
                Format = ',0.00;-,0.00'
                Kind = skSum
                Position = spFooter
                Column = tvViagensVAL_SERVICO
              end
              item
                Format = ',0;-,0;'
                Kind = skSum
                Position = spFooter
                Column = tvViagensQTD_KM_RODADO
              end>
          end>
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsSelection.InvertSelect = False
        OptionsSelection.MultiSelect = True
        OptionsSelection.CellMultiSelect = True
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupFooters = gfAlwaysVisible
        OptionsView.GroupSummaryLayout = gslAlignWithColumns
        OptionsView.Indicator = True
        object tvViagensID_CONTROLE: TcxGridDBColumn
          Caption = 'ID'
          DataBinding.FieldName = 'ID_CONTROLE'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.IgnoreMaskBlank = True
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d\d\d\d\d\d'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 41
        end
        object tvViagensNUM_SM: TcxGridDBColumn
          Caption = 'N'#186'. SM'
          DataBinding.FieldName = 'NUM_SM'
          HeaderAlignmentHorz = taCenter
          Width = 127
        end
        object tvViagensDAT_TRANSPORTE: TcxGridDBColumn
          Caption = 'Data'
          DataBinding.FieldName = 'DAT_TRANSPORTE'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.ReadOnly = True
          Properties.SaveTime = False
          Properties.ShowTime = False
          HeaderAlignmentHorz = taCenter
          Width = 51
        end
        object tvViagensCOD_CLIENTE: TcxGridDBColumn
          Caption = 'Cliente'
          DataBinding.FieldName = 'COD_CLIENTE'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'COD_CLIENTE'
          Properties.ListColumns = <
            item
              FieldName = 'NOM_CLIENTE'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dsCliente
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 92
        end
        object tvViagensDES_OPERACAO: TcxGridDBColumn
          Caption = 'Opera'#231#227'o'
          DataBinding.FieldName = 'DES_OPERACAO'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 90
        end
        object tvViagensDES_PLACA: TcxGridDBColumn
          Caption = 'Placa'
          DataBinding.FieldName = 'DES_PLACA'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 54
        end
        object tvViagensDES_MODELO: TcxGridDBColumn
          Caption = 'Modelo'
          DataBinding.FieldName = 'DES_PLACA'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.HideSelection = False
          Properties.KeyFieldNames = 'DES_PLACA'
          Properties.ListColumns = <
            item
              FieldName = 'DES_MODELO'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dsVeiculos
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 96
        end
        object tvViagensCOD_MOTORISTA: TcxGridDBColumn
          Caption = 'Motorista'
          DataBinding.FieldName = 'COD_MOTORISTA'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'COD_CADASTRO'
          Properties.ListColumns = <
            item
              FieldName = 'DES_RAZAO_SOCIAL'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dsEntregadores
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 132
        end
        object tvViagensQTD_KM_SAIDA: TcxGridDBColumn
          Caption = 'KM Sa'#237'da'
          DataBinding.FieldName = 'QTD_KM_SAIDA'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DecimalPlaces = 0
          Properties.DisplayFormat = ',0;-0'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 43
        end
        object tvViagensHOR_SAIDA: TcxGridDBColumn
          Caption = 'Hora Sa'#237'da'
          DataBinding.FieldName = 'HOR_SAIDA'
          PropertiesClassName = 'TcxTimeEditProperties'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 48
        end
        object tvViagensQTD_KM_RETORNO: TcxGridDBColumn
          Caption = 'KM Retorno'
          DataBinding.FieldName = 'QTD_KM_RETORNO'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DecimalPlaces = 0
          Properties.DisplayFormat = ',0;-,0'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 45
        end
        object tvViagensHOR_RETORNO: TcxGridDBColumn
          Caption = 'Hora Retorno'
          DataBinding.FieldName = 'HOR_RETORNO'
          PropertiesClassName = 'TcxTimeEditProperties'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 52
        end
        object tvViagensQTD_KM_RODADO: TcxGridDBColumn
          Caption = 'KM Rodado'
          DataBinding.FieldName = 'QTD_KM_RODADO'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DecimalPlaces = 0
          Properties.DisplayFormat = ',0;-,0'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 47
        end
        object tvViagensDES_SERVICO: TcxGridDBColumn
          Caption = 'Servi'#231'o'
          DataBinding.FieldName = 'DES_SERVICO'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 227
        end
        object tvViagensVAL_TOTAL_COMBUSTIVEL: TcxGridDBColumn
          Caption = 'Total Combust'#237'vel'
          DataBinding.FieldName = 'VAL_TOTAL_COMBUSTIVEL'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ' ,0.00;- ,0.00'
          Width = 39
        end
        object tvViagensVAL_TOTAL_INSUMOS: TcxGridDBColumn
          Caption = 'Total Insumos'
          DataBinding.FieldName = 'VAL_TOTAL_INSUMOS'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ' ,0.00;- ,0.00'
          Width = 38
        end
        object tvViagensDES_OBS: TcxGridDBColumn
          Caption = 'Observa'#231#245'es'
          DataBinding.FieldName = 'DES_OBS'
          PropertiesClassName = 'TcxBlobEditProperties'
          Properties.BlobEditKind = bekMemo
          Properties.ReadOnly = True
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvViagensCOD_STATUS: TcxGridDBColumn
          Caption = 'Status'
          DataBinding.FieldName = 'COD_STATUS'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.Images = dm.cxImageList1
          Properties.Items = <
            item
              Description = 'Em Aberto'
              ImageIndex = 50
              Value = 0
            end
            item
              Description = 'Finalizada'
              ImageIndex = 51
              Value = 1
            end
            item
              Description = 'Cancelada'
              ImageIndex = 6
              Value = 2
            end>
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 118
        end
        object tvViagensVAL_SERVICO: TcxGridDBColumn
          Caption = 'Valor'
          DataBinding.FieldName = 'VAL_SERVICO'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.ReadOnly = True
          Visible = False
          HeaderAlignmentHorz = taCenter
          Width = 108
        end
        object tvViagensDES_LOG: TcxGridDBColumn
          Caption = 'LOG'
          DataBinding.FieldName = 'DES_LOG'
          PropertiesClassName = 'TcxBlobEditProperties'
          Properties.BlobEditKind = bekMemo
          Properties.ReadOnly = True
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
      end
      object lvViagens: TcxGridLevel
        GridView = tvViagens
      end
    end
    object edtKMSaida: TcxDBCurrencyEdit
      Left = 740
      Top = 459
      Hint = 'KM de Sa'#237'da'
      DataBinding.DataField = 'QTD_KM_SAIDA'
      DataBinding.DataSource = dsTransporte
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = ',0;-,0'
      Style.HotTrack = False
      TabOrder = 14
      Width = 105
    end
    object timSaida: TcxDBTimeEdit
      Left = 928
      Top = 459
      Hint = 'Hora de Sa'#237'da'
      DataBinding.DataField = 'HOR_SAIDA'
      DataBinding.DataSource = dsTransporte
      Style.HotTrack = False
      TabOrder = 15
      Width = 76
    end
    object edtKMRetorno: TcxDBCurrencyEdit
      Left = 1091
      Top = 459
      Hint = 'KM no Retorno'
      DataBinding.DataField = 'QTD_KM_RETORNO'
      DataBinding.DataSource = dsTransporte
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = ',0;-,0'
      Style.HotTrack = False
      TabOrder = 16
      Width = 87
    end
    object timRetorno: TcxDBTimeEdit
      Left = 1274
      Top = 459
      Hint = 'Hora do retorno'
      DataBinding.DataField = 'HOR_RETORNO'
      DataBinding.DataSource = dsTransporte
      Style.HotTrack = False
      TabOrder = 17
      Width = 90
    end
    object cboVisualizacao: TcxComboBox
      Left = 80
      Top = 10
      Hint = 'Visualiza'#231#227'o de dados'
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        #218'ltimos 7 dias'
        'M'#234's Corrente'
        'Ano Corrente'
        #218'ltimos 12 meses'
        'Todas as Viagens'
        'Per'#237'odo')
      Properties.OnChange = cboVisualizacaoPropertiesChange
      Style.HotTrack = False
      TabOrder = 0
      Text = #218'ltimos 7 dias'
      Width = 1057
    end
    object datTransporte: TcxDBDateEdit
      Left = 197
      Top = 432
      DataBinding.DataField = 'DAT_TRANSPORTE'
      DataBinding.DataSource = dsTransporte
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.HotTrack = False
      TabOrder = 6
      Width = 110
    end
    object cboOperacao: TcxDBComboBox
      Left = 791
      Top = 432
      Hint = 'Tipo de Opera'#231#227'o'
      DataBinding.DataField = 'DES_OPERACAO'
      DataBinding.DataSource = dsTransporte
      Properties.Items.Strings = (
        'COLETA'
        'DISTRIBUI'#199#195'O'
        'ENTREGA'
        'TRANSFER'#202'NCIA'
        'MANUTEN'#199#195'O')
      Style.HotTrack = False
      TabOrder = 9
      Width = 148
    end
    object lcbClientes: TcxDBLookupComboBox
      Left = 488
      Top = 432
      Hint = 'Clientes'
      DataBinding.DataField = 'COD_CLIENTE'
      DataBinding.DataSource = dsTransporte
      Properties.KeyFieldNames = 'COD_CLIENTE'
      Properties.ListColumns = <
        item
          FieldName = 'NOM_CLIENTE'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsCliente
      Style.HotTrack = False
      TabOrder = 8
      Width = 225
    end
    object edtPlaca: TcxDBTextEdit
      Left = 1031
      Top = 432
      Hint = 'Placa do ve'#237'culo'
      DataBinding.DataField = 'DES_PLACA'
      DataBinding.DataSource = dsTransporte
      Properties.CharCase = ecUpperCase
      Style.HotTrack = False
      TabOrder = 10
      Width = 65
    end
    object lcbVeiculo: TcxDBLookupComboBox
      Left = 1102
      Top = 432
      Hint = 'Descri'#231#227'o do ve'#237'culo'
      DataBinding.DataField = 'DES_PLACA'
      DataBinding.DataSource = dsTransporte
      Properties.KeyFieldNames = 'DES_PLACA'
      Properties.ListColumns = <
        item
          FieldName = 'DES_MODELO'
        end
        item
          FieldName = 'DES_PLACA'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsVeiculos
      Style.HotTrack = False
      TabOrder = 11
      Width = 262
    end
    object edtCodigoCliente: TcxDBMaskEdit
      Left = 371
      Top = 432
      DataBinding.DataField = 'COD_CLIENTE'
      DataBinding.DataSource = dsTransporte
      Properties.IgnoreMaskBlank = True
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d\d\d\d\d\d'
      Style.HotTrack = False
      TabOrder = 7
      Width = 111
    end
    object grdAbastecimentos: TcxGrid
      Left = 10
      Top = 533
      Width = 405
      Height = 112
      TabOrder = 21
      object tvAbastecimentos: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.Images = dm.cxImageList1
        Navigator.Buttons.First.Visible = False
        Navigator.Buttons.PriorPage.Visible = False
        Navigator.Buttons.Prior.Visible = False
        Navigator.Buttons.Next.Visible = False
        Navigator.Buttons.NextPage.Visible = False
        Navigator.Buttons.Last.Visible = False
        Navigator.Buttons.Insert.ImageIndex = 1
        Navigator.Buttons.Delete.ImageIndex = 8
        Navigator.Buttons.Edit.ImageIndex = 14
        Navigator.Buttons.Post.ImageIndex = 9
        Navigator.Buttons.Cancel.ImageIndex = 62
        Navigator.Buttons.Refresh.ImageIndex = 40
        Navigator.Buttons.Refresh.Visible = True
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.Buttons.GotoBookmark.Visible = False
        Navigator.Buttons.Filter.Visible = False
        Navigator.Visible = True
        DataController.DataSource = dsAbastecimento
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0.00;-,0.00'
            Kind = skSum
            Column = tvAbastecimentosVAL_TOTAL
          end
          item
            Format = ',0.000;-,0.000'
            Kind = skSum
            Column = tvAbastecimentosQTD_ABASTECIMENTO
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsSelection.InvertSelect = False
        OptionsSelection.MultiSelect = True
        OptionsSelection.CellMultiSelect = True
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        object tvAbastecimentosNUM_ABASTECIMENTO: TcxGridDBColumn
          DataBinding.FieldName = 'NUM_ABASTECIMENTO'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvAbastecimentosNUM_CUPOM: TcxGridDBColumn
          DataBinding.FieldName = 'NUM_CUPOM'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.IgnoreMaskBlank = True
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d\d\d\d\d\d\d\d\d'
          Properties.OnValidate = tvAbastecimentosNUM_CUPOMPropertiesValidate
          HeaderAlignmentHorz = taCenter
          Width = 106
        end
        object tvAbastecimentosCOD_ENTREGADOR: TcxGridDBColumn
          DataBinding.FieldName = 'COD_ENTREGADOR'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvAbastecimentosDES_PLACA: TcxGridDBColumn
          DataBinding.FieldName = 'DES_PLACA'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvAbastecimentosDAT_ABASTECIMENTO: TcxGridDBColumn
          DataBinding.FieldName = 'DAT_ABASTECIMENTO'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvAbastecimentosDES_PRODUTO: TcxGridDBColumn
          DataBinding.FieldName = 'DES_PRODUTO'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvAbastecimentosQTD_ABASTECIMENTO: TcxGridDBColumn
          DataBinding.FieldName = 'QTD_ABASTECIMENTO'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DecimalPlaces = 3
          Properties.DisplayFormat = ',0.000;-,0.000'
          HeaderAlignmentHorz = taCenter
          Width = 96
        end
        object tvAbastecimentosVAL_UNITARIO: TcxGridDBColumn
          DataBinding.FieldName = 'VAL_UNITARIO'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DecimalPlaces = 3
          Properties.DisplayFormat = ',0.000;-,0.000'
          HeaderAlignmentHorz = taCenter
          Width = 94
        end
        object tvAbastecimentosVAL_TOTAL: TcxGridDBColumn
          DataBinding.FieldName = 'VAL_TOTAL'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;-,0.00'
          HeaderAlignmentHorz = taCenter
          Width = 95
        end
        object tvAbastecimentosNOM_EXECUTANTE: TcxGridDBColumn
          DataBinding.FieldName = 'NOM_EXECUTANTE'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvAbastecimentosDAT_MANUTENCAO: TcxGridDBColumn
          DataBinding.FieldName = 'DAT_MANUTENCAO'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvAbastecimentosDOM_DESCONTO: TcxGridDBColumn
          DataBinding.FieldName = 'DOM_DESCONTO'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvAbastecimentosNUM_EXTRATO: TcxGridDBColumn
          DataBinding.FieldName = 'NUM_EXTRATO'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvAbastecimentosVAL_VERBA_COMBUSTIVEL: TcxGridDBColumn
          DataBinding.FieldName = 'VAL_VERBA_COMBUSTIVEL'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvAbastecimentosVAL_DESCONTO: TcxGridDBColumn
          DataBinding.FieldName = 'VAL_DESCONTO'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvAbastecimentosDAT_BASE: TcxGridDBColumn
          DataBinding.FieldName = 'DAT_BASE'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvAbastecimentosNOM_ENTREGADOR: TcxGridDBColumn
          DataBinding.FieldName = 'NOM_ENTREGADOR'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
      end
      object lvAbastecimentos: TcxGridLevel
        GridView = tvAbastecimentos
      end
    end
    object grdInsumos: TcxGrid
      Left = 421
      Top = 533
      Width = 424
      Height = 112
      TabOrder = 22
      object tvInsumos: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.Images = dm.cxImageList1
        Navigator.Buttons.First.ImageIndex = 99
        Navigator.Buttons.First.Visible = False
        Navigator.Buttons.PriorPage.Visible = False
        Navigator.Buttons.Prior.ImageIndex = 102
        Navigator.Buttons.Prior.Visible = False
        Navigator.Buttons.Next.ImageIndex = 101
        Navigator.Buttons.Next.Visible = False
        Navigator.Buttons.NextPage.Visible = False
        Navigator.Buttons.Last.ImageIndex = 100
        Navigator.Buttons.Last.Visible = False
        Navigator.Buttons.Insert.ImageIndex = 1
        Navigator.Buttons.Delete.ImageIndex = 8
        Navigator.Buttons.Edit.ImageIndex = 14
        Navigator.Buttons.Post.ImageIndex = 9
        Navigator.Buttons.Cancel.ImageIndex = 62
        Navigator.Buttons.Refresh.ImageIndex = 40
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.Buttons.GotoBookmark.Visible = False
        Navigator.Buttons.Filter.Visible = False
        Navigator.Visible = True
        DataController.DataSource = dsConsumo
        DataController.KeyFieldNames = 'ID_CONSUMO'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.ExpandMasterRowOnDblClick = False
        OptionsBehavior.FocusCellOnCycle = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        object tvInsumosRecId: TcxGridDBColumn
          DataBinding.FieldName = 'RecId'
          Visible = False
        end
        object tvInsumosID_CONSUMO: TcxGridDBColumn
          DataBinding.FieldName = 'ID_CONSUMO'
          Visible = False
        end
        object tvInsumosID_INSUMO: TcxGridDBColumn
          DataBinding.FieldName = 'ID_INSUMO'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'ID_INSUMO'
          Properties.ListColumns = <
            item
              FieldName = 'DES_INSUMO'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dsInsumos
          HeaderAlignmentHorz = taCenter
          Width = 183
        end
        object tvInsumosDES_PLACA: TcxGridDBColumn
          DataBinding.FieldName = 'DES_PLACA'
          Visible = False
        end
        object tvInsumosDAT_CONSUMO: TcxGridDBColumn
          DataBinding.FieldName = 'DAT_CONSUMO'
          Visible = False
        end
        object tvInsumosQTD_KM_CONSUMO: TcxGridDBColumn
          DataBinding.FieldName = 'QTD_KM_CONSUMO'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DecimalPlaces = 0
          Properties.DisplayFormat = ',0;-,0'
          HeaderAlignmentHorz = taCenter
          Width = 79
        end
        object tvInsumosID_CONTROLE: TcxGridDBColumn
          DataBinding.FieldName = 'ID_CONTROLE'
          Visible = False
        end
        object tvInsumosQTD_CONSUMO: TcxGridDBColumn
          DataBinding.FieldName = 'QTD_CONSUMO'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DecimalPlaces = 0
          Properties.DisplayFormat = ',0.000;-,0.000'
          HeaderAlignmentHorz = taCenter
          Width = 81
        end
        object tvInsumosVAL_CONSUMO: TcxGridDBColumn
          DataBinding.FieldName = 'VAL_CONSUMO'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;-,0.00'
          HeaderAlignmentHorz = taCenter
          Width = 79
        end
        object tvInsumosDES_LOG: TcxGridDBColumn
          DataBinding.FieldName = 'DES_LOG'
          Visible = False
        end
      end
      object lvInsumos: TcxGridLevel
        GridView = tvInsumos
      end
    end
    object memObs: TcxDBMemo
      Left = 851
      Top = 533
      Hint = 'Observa'#231#245'es'
      DataBinding.DataField = 'DES_OBS'
      DataBinding.DataSource = dsTransporte
      Properties.ScrollBars = ssVertical
      Style.HotTrack = False
      TabOrder = 23
      Height = 107
      Width = 513
    end
    object cxDBImageComboBox1: TcxDBImageComboBox
      Left = 624
      Top = 486
      TabStop = False
      DataBinding.DataField = 'COD_STATUS'
      DataBinding.DataSource = dsTransporte
      Properties.Alignment.Horz = taLeftJustify
      Properties.Images = dm.cxImageList1
      Properties.Items = <
        item
          Description = 'Em Aberto'
          ImageIndex = 50
          Value = 0
        end
        item
          Description = 'Finalizada'
          ImageIndex = 51
          Value = 1
        end
        item
          Description = 'Cancelada'
          ImageIndex = 6
          Value = 2
        end>
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 19
      Width = 637
    end
    object datInicio: TcxDateEdit
      Left = 1082
      Top = 10
      Hint = 'In'#237'cio do per'#237'odo'
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.HotTrack = False
      TabOrder = 1
      Width = 94
    end
    object datFinal: TcxDateEdit
      Left = 1193
      Top = 10
      Style.HotTrack = False
      TabOrder = 2
      Width = 83
    end
    object cxButton1: TcxButton
      Left = 1282
      Top = 10
      Width = 82
      Height = 21
      Cursor = crHandPoint
      Action = actPeriodo
      TabOrder = 3
    end
    object mskSM: TcxDBMaskEdit
      Left = 1216
      Top = 486
      Hint = 'N'#250'mero do SM'
      DataBinding.DataField = 'NUM_SM'
      DataBinding.DataSource = dsTransporte
      Properties.IgnoreMaskBlank = True
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d'
      Style.HotTrack = False
      TabOrder = 20
      Width = 148
    end
    object lcgTransporte_Root: TdxLayoutGroup
      AlignHorz = ahClient
      AlignVert = avClient
      LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object lcTransporteItem8: TdxLayoutItem
      Parent = lcTransporteGroup5
      AlignHorz = ahClient
      CaptionOptions.ImageIndex = 17
      CaptionOptions.Text = 'Nome do Motorista'
      CaptionOptions.Visible = False
      Control = lcbMotorista
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lcTransporteItem7: TdxLayoutItem
      Parent = lcTransporteGroup5
      AlignHorz = ahClient
      CaptionOptions.ImageIndex = 17
      CaptionOptions.Text = 'Motorista'
      Control = edtCodigoMotorista
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lcTransporteGroup5: TdxLayoutAutoCreatedGroup
      Parent = lcgTransporte_Root
      LayoutDirection = ldHorizontal
      Index = 3
      AutoCreated = True
    end
    object lcTransporteGroup6: TdxLayoutAutoCreatedGroup
      Parent = lcgTransporte_Root
      LayoutDirection = ldHorizontal
      Index = 2
      AutoCreated = True
    end
    object lcTransporteItem1: TdxLayoutItem
      Parent = lcTransporteGroup6
      AlignHorz = ahClient
      CaptionOptions.ImageIndex = 106
      CaptionOptions.Text = 'ID'
      Control = edtID
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lcTransporteItem13: TdxLayoutItem
      Parent = lcTransporteGroup1
      AlignHorz = ahClient
      CaptionOptions.ImageIndex = 69
      CaptionOptions.Text = 'Servi'#231'os'
      Control = edtServicos
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lcTransporteItem16: TdxLayoutItem
      Parent = lcgTransporte_Root
      AlignVert = avClient
      CaptionOptions.ImageIndex = 90
      CaptionOptions.Text = 'Viagens'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      Control = grdViagens
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lcTransporteItem9: TdxLayoutItem
      Parent = lcTransporteGroup5
      AlignHorz = ahClient
      CaptionOptions.ImageIndex = 77
      CaptionOptions.Text = 'KM Sa'#237'da'
      Control = edtKMSaida
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object lcTransporteItem10: TdxLayoutItem
      Parent = lcTransporteGroup5
      AlignHorz = ahClient
      CaptionOptions.ImageIndex = 107
      CaptionOptions.Text = 'Hora Sa'#237'da'
      Control = timSaida
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object lcTransporteItem11: TdxLayoutItem
      Parent = lcTransporteGroup5
      AlignHorz = ahClient
      CaptionOptions.ImageIndex = 77
      CaptionOptions.Text = 'KM Retorno'
      Control = edtKMRetorno
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object lcTransporteItem12: TdxLayoutItem
      Parent = lcTransporteGroup5
      AlignHorz = ahClient
      CaptionOptions.ImageIndex = 107
      CaptionOptions.Text = 'Hora Retorno'
      Control = timRetorno
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object lcTransporteItem27: TdxLayoutItem
      Parent = lcTransporteGroup2
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.ImageIndex = 88
      CaptionOptions.Text = '&Visualizar'
      Control = cboVisualizacao
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lcTransporteItem2: TdxLayoutItem
      Parent = lcTransporteGroup6
      AlignHorz = ahClient
      CaptionOptions.ImageIndex = 7
      CaptionOptions.Text = 'Data'
      Control = datTransporte
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lcTransporteItem4: TdxLayoutItem
      Parent = lcTransporteGroup6
      AlignHorz = ahClient
      CaptionOptions.ImageIndex = 45
      CaptionOptions.Text = 'Opera'#231#227'o'
      Control = cboOperacao
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object lcTransporteItem3: TdxLayoutItem
      Parent = lcTransporteGroup6
      AlignHorz = ahClient
      CaptionOptions.ImageIndex = 56
      CaptionOptions.Text = 'Cliente'
      CaptionOptions.Visible = False
      Control = lcbClientes
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object lcTransporteItem5: TdxLayoutItem
      Parent = lcTransporteGroup6
      AlignHorz = ahClient
      CaptionOptions.ImageIndex = 90
      CaptionOptions.Text = 'Placa Ve'#237'culo'
      Control = edtPlaca
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object lcTransporteItem6: TdxLayoutItem
      Parent = lcTransporteGroup6
      AlignHorz = ahClient
      CaptionOptions.ImageIndex = 90
      CaptionOptions.Text = 'Ve'#237'culo'
      CaptionOptions.Visible = False
      Control = lcbVeiculo
      ControlOptions.ShowBorder = False
      Index = 6
    end
    object lcTransporteItem28: TdxLayoutItem
      Parent = lcTransporteGroup6
      AlignHorz = ahClient
      CaptionOptions.ImageIndex = 56
      CaptionOptions.Text = 'Cliente'
      Control = edtCodigoCliente
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object lcTransporteItem29: TdxLayoutItem
      Parent = lcTransporteGroup3
      AlignHorz = ahLeft
      CaptionOptions.ImageIndex = 76
      CaptionOptions.Text = 'Abastecimentos'
      CaptionOptions.Layout = clTop
      Control = grdAbastecimentos
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lcTransporteItem17: TdxLayoutItem
      Parent = lcTransporteGroup3
      CaptionOptions.ImageIndex = 111
      CaptionOptions.Text = 'Insumos'
      CaptionOptions.Layout = clTop
      LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
      Control = grdInsumos
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lcTransporteGroup3: TdxLayoutAutoCreatedGroup
      Parent = lcgTransporte_Root
      LayoutDirection = ldHorizontal
      Index = 5
      AutoCreated = True
    end
    object lcTransporteItem14: TdxLayoutItem
      Parent = lcTransporteGroup3
      CaptionOptions.ImageIndex = 108
      CaptionOptions.Text = 'Observa'#231#245'es'
      CaptionOptions.Layout = clTop
      Control = memObs
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object lcTransporteItem15: TdxLayoutItem
      Parent = lcTransporteGroup1
      AlignHorz = ahClient
      CaptionOptions.ImageIndex = 0
      CaptionOptions.Text = 'Status'
      Control = cxDBImageComboBox1
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lcTransporteGroup1: TdxLayoutAutoCreatedGroup
      Parent = lcgTransporte_Root
      LayoutDirection = ldHorizontal
      Index = 4
      AutoCreated = True
    end
    object lcTransporteGroup2: TdxLayoutAutoCreatedGroup
      Parent = lcgTransporte_Root
      AlignVert = avTop
      LayoutDirection = ldHorizontal
      Index = 0
      AutoCreated = True
    end
    object liInicio: TdxLayoutItem
      Parent = lgPeriodo
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.ImageIndex = 7
      CaptionOptions.Text = 'Per'#237'odo'
      Control = datInicio
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object liFinal: TdxLayoutItem
      Parent = lgPeriodo
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = #224
      Control = datFinal
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lgPeriodo: TdxLayoutGroup
      Parent = lcTransporteGroup2
      CaptionOptions.Layout = clLeft
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object liExecutar: TdxLayoutItem
      Parent = lgPeriodo
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = cxButton1
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = lcTransporteGroup1
      AlignVert = avBottom
      CaptionOptions.ImageIndex = 90
      CaptionOptions.Text = 'N'#186'. SM'
      Control = mskSM
      ControlOptions.ShowBorder = False
      Index = 2
    end
  end
  object dsTransporte: TDataSource
    AutoEdit = False
    DataSet = tbControle
    OnStateChange = dsTransporteStateChange
    Left = 472
  end
  object dsCliente: TDataSource
    AutoEdit = False
    DataSet = tbClientes
    Left = 520
  end
  object dsVeiculos: TDataSource
    AutoEdit = False
    DataSet = tbVeiculos
    Left = 576
  end
  object dsEntregadores: TDataSource
    AutoEdit = False
    DataSet = tbMotoristas
    Left = 624
  end
  object aclTransporte: TActionList
    Images = dm.cxImageList1
    Left = 672
    object actIncluir: TAction
      Tag = 1
      Category = 'Transportes'
      Caption = '&Incluir'
      Hint = 'Incluir Viagens'
      ImageIndex = 1
      OnExecute = actIncluirExecute
    end
    object actEditar: TAction
      Tag = 1
      Category = 'Transportes'
      Caption = '&Editar'
      Hint = 'Editar dados'
      ImageIndex = 14
      OnExecute = actEditarExecute
    end
    object actExcluir: TAction
      Category = 'Transportes'
      Caption = 'E&xcluir'
      Hint = 'Excluir Viagem'
      ImageIndex = 8
      OnExecute = actExcluirExecute
    end
    object actCancelar: TAction
      Tag = 1
      Category = 'Transportes'
      Caption = 'Cancelar'
      Hint = 'Cancelar Opera'#231#227'o'
      ImageIndex = 6
      OnExecute = actCancelarExecute
    end
    object actGravar: TAction
      Tag = 1
      Category = 'Transportes'
      Caption = 'Gravar'
      Hint = 'Gravar dados'
      ImageIndex = 9
      OnExecute = actGravarExecute
    end
    object actCancelarViagem: TAction
      Category = 'Transportes'
      Caption = 'Cancelar Viagem'
      Hint = 'Cancelar a Viagem'
      ImageIndex = 62
      OnExecute = actCancelarViagemExecute
    end
    object actFinalizar: TAction
      Category = 'Transportes'
      Caption = '&Finalizar'
      Hint = 'Finalizar a Viagem'
      ImageIndex = 51
      OnExecute = actFinalizarExecute
    end
    object actExportar: TAction
      Tag = 1
      Category = 'Transportes'
      Caption = 'Ex&portar'
      Hint = 'Exportar dados da grade'
      ImageIndex = 29
      OnExecute = actExportarExecute
    end
    object actFechar: TAction
      Tag = 1
      Category = 'Transportes'
      Caption = 'Fechar'
      Hint = 'Fechar a tela'
      ImageIndex = 103
      OnExecute = actFecharExecute
    end
    object actLocalizar: TAction
      Tag = 1
      Category = 'Transportes'
      Caption = 'Localizar'
      Hint = 'Localizar Servi'#231'os'
      ImageIndex = 11
      OnExecute = actLocalizarExecute
    end
    object actPeriodo: TAction
      Tag = 1
      Category = 'Transportes'
      Caption = 'Executar'
      Hint = 'Executar pesquisa por per'#237'odo'
      ImageIndex = 27
      OnExecute = actPeriodoExecute
    end
  end
  object SaveDialog: TSaveDialog
    Left = 720
  end
  object dsAbastecimento: TDataSource
    DataSet = tbAbastecimentos
    Left = 776
  end
  object tbAbastecimentos: TdxMemData
    Indexes = <>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F1200000004000000030012004E554D5F4142415354
      4543494D454E544F001400000014000A004E554D5F4355504F4D000400000003
      000F00434F445F454E5452454741444F52000E00000014000A004445535F504C
      4143410004000000090012004441545F41424153544543494D454E544F006400
      000014000C004445535F50524F4455544F0008000000060012005154445F4142
      4153544543494D454E544F000800000006000D0056414C5F554E49544152494F
      000800000006000A0056414C5F544F54414C002800000014000F004E4F4D5F45
      5845435554414E544500080000000B000F004441545F4D414E5554454E43414F
      000200000014000D00444F4D5F444553434F4E544F001E00000014000C004E55
      4D5F4558545241544F00080000000600160056414C5F56455242415F434F4D42
      5553544956454C000800000006000D0056414C5F444553434F4E544F00040000
      00090009004441545F42415345008C00000014000F004E4F4D5F454E54524547
      41444F52000400000003000C0049445F434F4E54524F4C4500}
    SortOptions = []
    BeforeDelete = tbAbastecimentosBeforeDelete
    AfterDelete = tbAbastecimentosAfterDelete
    Left = 840
    object tbAbastecimentosNUM_ABASTECIMENTO: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUM_ABASTECIMENTO'
    end
    object tbAbastecimentosNUM_CUPOM: TWideStringField
      DisplayLabel = 'Cupom'
      FieldName = 'NUM_CUPOM'
    end
    object tbAbastecimentosCOD_ENTREGADOR: TIntegerField
      DisplayLabel = 'Entregador'
      FieldName = 'COD_ENTREGADOR'
    end
    object tbAbastecimentosDES_PLACA: TWideStringField
      DisplayLabel = 'Placa'
      FieldName = 'DES_PLACA'
      Size = 14
    end
    object tbAbastecimentosDAT_ABASTECIMENTO: TDateField
      DisplayLabel = 'Data'
      FieldName = 'DAT_ABASTECIMENTO'
    end
    object tbAbastecimentosDES_PRODUTO: TWideStringField
      DisplayLabel = 'Produto'
      FieldName = 'DES_PRODUTO'
      Size = 100
    end
    object tbAbastecimentosQTD_ABASTECIMENTO: TFloatField
      DisplayLabel = 'Qtde.'
      FieldName = 'QTD_ABASTECIMENTO'
      OnValidate = tbAbastecimentosQTD_ABASTECIMENTOValidate
    end
    object tbAbastecimentosVAL_UNITARIO: TFloatField
      DisplayLabel = 'Unit'#225'rio'
      FieldName = 'VAL_UNITARIO'
      OnValidate = tbAbastecimentosVAL_UNITARIOValidate
    end
    object tbAbastecimentosVAL_TOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'VAL_TOTAL'
    end
    object tbAbastecimentosNOM_EXECUTANTE: TWideStringField
      DisplayLabel = 'Executante'
      FieldName = 'NOM_EXECUTANTE'
      Size = 40
    end
    object tbAbastecimentosDAT_MANUTENCAO: TDateTimeField
      DisplayLabel = 'Manuten'#231#227'o'
      FieldName = 'DAT_MANUTENCAO'
    end
    object tbAbastecimentosDOM_DESCONTO: TWideStringField
      DisplayLabel = 'Descontado'
      FieldName = 'DOM_DESCONTO'
      Size = 2
    end
    object tbAbastecimentosNUM_EXTRATO: TWideStringField
      DisplayLabel = 'Extrato N'#186'.'
      FieldName = 'NUM_EXTRATO'
      Size = 30
    end
    object tbAbastecimentosVAL_VERBA_COMBUSTIVEL: TFloatField
      DisplayLabel = 'Verba'
      FieldName = 'VAL_VERBA_COMBUSTIVEL'
    end
    object tbAbastecimentosVAL_DESCONTO: TFloatField
      DisplayLabel = 'Valor Desconto'
      FieldName = 'VAL_DESCONTO'
    end
    object tbAbastecimentosDAT_BASE: TDateField
      DisplayLabel = 'Data Base'
      FieldName = 'DAT_BASE'
    end
    object tbAbastecimentosNOM_ENTREGADOR: TWideStringField
      DisplayLabel = 'Nome Entregador'
      FieldName = 'NOM_ENTREGADOR'
      Size = 140
    end
    object tbAbastecimentosID_CONTROLE: TIntegerField
      DisplayLabel = 'Controle'
      FieldName = 'ID_CONTROLE'
    end
  end
  object tbControle: TdxMemData
    Indexes = <>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F100000000400000003000C0049445F434F4E54524F
      4C45000400000009000F004441545F5452414E53504F52544500040000000300
      0C00434F445F434C49454E5445006400000014000D004445535F4F5045524143
      414F000E00000014000A004445535F504C414341000400000003000E00434F44
      5F4D4F544F5249535441000800000006000D005154445F4B4D5F534149444100
      040000000A000A00484F525F5341494441000800000006000F005154445F4B4D
      5F5245544F524E4F00040000000A000C00484F525F5245544F524E4F00080000
      0006000E005154445F4B4D5F524F4441444F002C01000014000C004445535F53
      45525649434F0000000000190008004445535F4F4253000800000006000C0056
      414C5F5345525649434F000400000003000B00434F445F535441545553000000
      0000190008004445535F4C4F4700}
    SortOptions = []
    Left = 896
    object tbControleID_CONTROLE: TIntegerField
      FieldName = 'ID_CONTROLE'
    end
    object tbControleDAT_TRANSPORTE: TDateField
      FieldName = 'DAT_TRANSPORTE'
    end
    object tbControleCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
    end
    object tbControleDES_OPERACAO: TWideStringField
      FieldName = 'DES_OPERACAO'
      Size = 100
    end
    object tbControleDES_PLACA: TWideStringField
      FieldName = 'DES_PLACA'
      Size = 14
    end
    object tbControleCOD_MOTORISTA: TIntegerField
      FieldName = 'COD_MOTORISTA'
    end
    object tbControleQTD_KM_SAIDA: TFloatField
      FieldName = 'QTD_KM_SAIDA'
    end
    object tbControleHOR_SAIDA: TTimeField
      FieldName = 'HOR_SAIDA'
    end
    object tbControleQTD_KM_RETORNO: TFloatField
      FieldName = 'QTD_KM_RETORNO'
    end
    object tbControleHOR_RETORNO: TTimeField
      FieldName = 'HOR_RETORNO'
    end
    object tbControleQTD_KM_RODADO: TFloatField
      FieldName = 'QTD_KM_RODADO'
    end
    object tbControleDES_SERVICO: TWideStringField
      FieldName = 'DES_SERVICO'
      Size = 300
    end
    object tbControleDES_OBS: TWideMemoField
      FieldName = 'DES_OBS'
      BlobType = ftWideMemo
    end
    object tbControleVAL_SERVICO: TFloatField
      FieldName = 'VAL_SERVICO'
    end
    object tbControleCOD_STATUS: TIntegerField
      FieldName = 'COD_STATUS'
    end
    object tbControleDES_LOG: TWideMemoField
      FieldName = 'DES_LOG'
      BlobType = ftWideMemo
    end
    object tbControleVAL_TOTAL_COMBUSTIVEL: TFloatField
      FieldName = 'VAL_TOTAL_COMBUSTIVEL'
    end
    object tbControleVAL_TOTAL_INSUMOS: TFloatField
      FieldName = 'VAL_TOTAL_INSUMOS'
    end
    object tbControleNUM_SM: TStringField
      FieldName = 'NUM_SM'
      Size = 15
    end
  end
  object bmControle: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    LookAndFeel.NativeStyle = False
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 944
    Top = 4
    DockControlHeights = (
      0
      0
      26
      0)
    object bmControleBar1: TdxBar
      Caption = 'Controle'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = -8
      FloatTop = 756
      FloatClientWidth = 51
      FloatClientHeight = 22
      Images = dm.cxImageList1
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton1'
        end
        item
          Visible = True
          ItemName = 'dxBarButton2'
        end
        item
          Visible = True
          ItemName = 'dxBarButton4'
        end
        item
          Visible = True
          ItemName = 'dxBarButton5'
        end
        item
          Visible = True
          ItemName = 'dxBarButton6'
        end
        item
          Visible = True
          ItemName = 'dxBarButton7'
        end
        item
          Visible = True
          ItemName = 'dxBarButton8'
        end
        item
          Visible = True
          ItemName = 'dxBarButton9'
        end>
      OneOnRow = True
      Row = 0
      ShowMark = False
      UseOwnFont = False
      UseRestSpace = True
      Visible = True
      WholeRow = False
    end
    object dxBarButton1: TdxBarButton
      Action = actIncluir
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton2: TdxBarButton
      Action = actEditar
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton3: TdxBarButton
      Action = actExcluir
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton4: TdxBarButton
      Action = actCancelar
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton5: TdxBarButton
      Action = actGravar
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton6: TdxBarButton
      Action = actCancelarViagem
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton7: TdxBarButton
      Action = actFinalizar
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton8: TdxBarButton
      Action = actExportar
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton9: TdxBarButton
      Action = actFechar
      Align = iaRight
      Category = 0
      PaintStyle = psCaptionGlyph
    end
  end
  object tbClientes: TdxMemData
    Indexes = <
      item
        FieldName = 'COD_CLIENTE'
        SortOptions = []
      end>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F030000000400000003000C00434F445F434C49454E
      544500A000000014000C004E4F4D5F434C49454E544500040000000300070044
      4F4D5F4F5300}
    SortOptions = []
    Left = 1008
    object tbClientesCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
    end
    object tbClientesNOM_CLIENTE: TWideStringField
      FieldName = 'NOM_CLIENTE'
      Size = 160
    end
    object tbClientesDOM_OS: TIntegerField
      FieldName = 'DOM_OS'
    end
  end
  object tbVeiculos: TdxMemData
    Indexes = <
      item
        FieldName = 'DES_PLACA'
        SortOptions = []
      end>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F230000000400000003000C00434F445F5645494355
      4C4F000800000014000D004445535F5449504F5F444F43002800000014000900
      4E554D5F434E504A008C000000140011004E4F4D5F50524F5052494554415249
      4F000400000009000F004441545F4E415343494D454E544F00A0000000140008
      004E4F4D5F4D414500A0000000140008004E4F4D5F5041490032000000140007
      004E554D5F524700040000001400060055465F5247000400000009000F004441
      545F454D495353414F5F5247000400000014000C0055465F454E44455245434F
      008C00000014000B004E4F4D5F43494441444500AA00000014000D004445535F
      454E44455245434F0012000000140008004E554D5F434550008C00000014000B
      004445535F42414952524F001E00000014000F004E554D5F54454C45464F4E45
      5F31005000000014000F004445535F54454C45464F4E455F31001E0000001400
      0F004E554D5F54454C45464F4E455F32005000000014000F004445535F54454C
      45464F4E455F32000400000003000F00434F445F454E5452454741444F520064
      00000014000A004445535F4D41524341006400000014000B004445535F4D4F44
      454C4F000E00000014000A004445535F504C4143410004000000140009005546
      5F504C414341008C000000140011004E4F4D5F4349444144455F504C41434100
      28000000140009004445535F5449504F006400000014000C004E554D5F434841
      535349530008000000140008004445535F414E4F002800000014000800444553
      5F434F52003200000014000C004E554D5F52454E4156414E0008000000140013
      00414E4F5F45584552434943494F5F434C5256000200000014001100444F4D5F
      524153545245414D454E544F000200000014001200444F4D5F41424153544543
      494D454E544F002800000014000D004E4F4D5F4558454355544F520008000000
      0B000F004441545F4D414E5554454E43414F00}
    SortOptions = []
    Left = 1064
    object tbVeiculosCOD_VEICULO: TIntegerField
      FieldName = 'COD_VEICULO'
    end
    object tbVeiculosDES_TIPO_DOC: TWideStringField
      FieldName = 'DES_TIPO_DOC'
      Size = 8
    end
    object tbVeiculosNUM_CNPJ: TWideStringField
      FieldName = 'NUM_CNPJ'
      Size = 40
    end
    object tbVeiculosNOM_PROPRIETARIO: TWideStringField
      FieldName = 'NOM_PROPRIETARIO'
      Size = 140
    end
    object tbVeiculosDAT_NASCIMENTO: TDateField
      FieldName = 'DAT_NASCIMENTO'
    end
    object tbVeiculosNOM_MAE: TWideStringField
      FieldName = 'NOM_MAE'
      Size = 160
    end
    object tbVeiculosNOM_PAI: TWideStringField
      FieldName = 'NOM_PAI'
      Size = 160
    end
    object tbVeiculosNUM_RG: TWideStringField
      FieldName = 'NUM_RG'
      Size = 50
    end
    object tbVeiculosUF_RG: TWideStringField
      FieldName = 'UF_RG'
      Size = 4
    end
    object tbVeiculosDAT_EMISSAO_RG: TDateField
      FieldName = 'DAT_EMISSAO_RG'
    end
    object tbVeiculosUF_ENDERECO: TWideStringField
      FieldName = 'UF_ENDERECO'
      Size = 4
    end
    object tbVeiculosNOM_CIDADE: TWideStringField
      FieldName = 'NOM_CIDADE'
      Size = 140
    end
    object tbVeiculosDES_ENDERECO: TWideStringField
      FieldName = 'DES_ENDERECO'
      Size = 170
    end
    object tbVeiculosNUM_CEP: TWideStringField
      FieldName = 'NUM_CEP'
      Size = 18
    end
    object tbVeiculosDES_BAIRRO: TWideStringField
      FieldName = 'DES_BAIRRO'
      Size = 140
    end
    object tbVeiculosNUM_TELEFONE_1: TWideStringField
      FieldName = 'NUM_TELEFONE_1'
      Size = 30
    end
    object tbVeiculosDES_TELEFONE_1: TWideStringField
      FieldName = 'DES_TELEFONE_1'
      Size = 80
    end
    object tbVeiculosNUM_TELEFONE_2: TWideStringField
      FieldName = 'NUM_TELEFONE_2'
      Size = 30
    end
    object tbVeiculosDES_TELEFONE_2: TWideStringField
      FieldName = 'DES_TELEFONE_2'
      Size = 80
    end
    object tbVeiculosCOD_ENTREGADOR: TIntegerField
      FieldName = 'COD_ENTREGADOR'
    end
    object tbVeiculosDES_MARCA: TWideStringField
      FieldName = 'DES_MARCA'
      Size = 100
    end
    object tbVeiculosDES_MODELO: TWideStringField
      FieldName = 'DES_MODELO'
      Size = 100
    end
    object tbVeiculosDES_PLACA: TWideStringField
      FieldName = 'DES_PLACA'
      Size = 14
    end
    object tbVeiculosUF_PLACA: TWideStringField
      FieldName = 'UF_PLACA'
      Size = 4
    end
    object tbVeiculosNOM_CIDADE_PLACA: TWideStringField
      FieldName = 'NOM_CIDADE_PLACA'
      Size = 140
    end
    object tbVeiculosDES_TIPO: TWideStringField
      FieldName = 'DES_TIPO'
      Size = 40
    end
    object tbVeiculosNUM_CHASSIS: TWideStringField
      FieldName = 'NUM_CHASSIS'
      Size = 100
    end
    object tbVeiculosDES_ANO: TWideStringField
      FieldName = 'DES_ANO'
      Size = 8
    end
    object tbVeiculosDES_COR: TWideStringField
      FieldName = 'DES_COR'
      Size = 40
    end
    object tbVeiculosNUM_RENAVAN: TWideStringField
      FieldName = 'NUM_RENAVAN'
      Size = 50
    end
    object tbVeiculosANO_EXERCICIO_CLRV: TWideStringField
      FieldName = 'ANO_EXERCICIO_CLRV'
      Size = 8
    end
    object tbVeiculosDOM_RASTREAMENTO: TWideStringField
      FieldName = 'DOM_RASTREAMENTO'
      Size = 2
    end
    object tbVeiculosDOM_ABASTECIMENTO: TWideStringField
      FieldName = 'DOM_ABASTECIMENTO'
      Size = 2
    end
    object tbVeiculosNOM_EXECUTOR: TWideStringField
      FieldName = 'NOM_EXECUTOR'
      Size = 40
    end
    object tbVeiculosDAT_MANUTENCAO: TDateTimeField
      FieldName = 'DAT_MANUTENCAO'
    end
  end
  object tbMotoristas: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 1128
    object tbMotoristasCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
    end
    object tbMotoristasDOM_FUNCIONARIO: TWideStringField
      FieldName = 'DOM_FUNCIONARIO'
      Size = 2
    end
    object tbMotoristasCOD_ENTREGADOR: TIntegerField
      FieldName = 'COD_ENTREGADOR'
    end
    object tbMotoristasDES_TIPO_DOC: TWideStringField
      FieldName = 'DES_TIPO_DOC'
      Size = 8
    end
    object tbMotoristasDES_RAZAO_SOCIAL: TWideStringField
      FieldName = 'DES_RAZAO_SOCIAL'
      Size = 140
    end
    object tbMotoristasNOM_FANTASIA: TWideStringField
      FieldName = 'NOM_FANTASIA'
      Size = 160
    end
    object tbMotoristasNUM_CNPJ: TWideStringField
      FieldName = 'NUM_CNPJ'
      Size = 40
    end
    object tbMotoristasNUM_IE: TWideStringField
      FieldName = 'NUM_IE'
      Size = 40
    end
    object tbMotoristasDAT_NASCIMENTO: TDateTimeField
      FieldName = 'DAT_NASCIMENTO'
    end
    object tbMotoristasUF_RG: TWideStringField
      FieldName = 'UF_RG'
      Size = 4
    end
    object tbMotoristasDAT_EMISSAO_RG: TDateTimeField
      FieldName = 'DAT_EMISSAO_RG'
    end
    object tbMotoristasUF_NASCIMENTO: TWideStringField
      FieldName = 'UF_NASCIMENTO'
      Size = 4
    end
    object tbMotoristasNOM_CIDADE_NASCIMENTO: TWideStringField
      FieldName = 'NOM_CIDADE_NASCIMENTO'
      Size = 144
    end
    object tbMotoristasNOM_PAI: TWideStringField
      FieldName = 'NOM_PAI'
      Size = 144
    end
    object tbMotoristasNOM_MAE: TWideStringField
      FieldName = 'NOM_MAE'
      Size = 144
    end
    object tbMotoristasNUM_IEST: TWideStringField
      FieldName = 'NUM_IEST'
      Size = 40
    end
    object tbMotoristasNUM_IM: TWideStringField
      FieldName = 'NUM_IM'
      Size = 40
    end
    object tbMotoristasCOD_CNAE: TWideStringField
      FieldName = 'COD_CNAE'
    end
    object tbMotoristasCOD_CRT: TIntegerField
      FieldName = 'COD_CRT'
    end
    object tbMotoristasNUM_CNH: TWideStringField
      FieldName = 'NUM_CNH'
      Size = 30
    end
    object tbMotoristasNUM_REGISTRO_CNH: TWideStringField
      FieldName = 'NUM_REGISTRO_CNH'
      Size = 30
    end
    object tbMotoristasDES_CATEGORIA_CNH: TWideStringField
      FieldName = 'DES_CATEGORIA_CNH'
      Size = 4
    end
    object tbMotoristasDAT_VALIDADE_CNH: TDateField
      FieldName = 'DAT_VALIDADE_CNH'
    end
    object tbMotoristasUF_CNH: TWideStringField
      FieldName = 'UF_CNH'
      Size = 4
    end
    object tbMotoristasDAT_1_HABILITACAO: TDateTimeField
      FieldName = 'DAT_1_HABILITACAO'
    end
    object tbMotoristasDES_PAGINA: TWideStringField
      FieldName = 'DES_PAGINA'
      Size = 200
    end
    object tbMotoristasCOD_AGENTE: TIntegerField
      FieldName = 'COD_AGENTE'
    end
    object tbMotoristasCOD_STATUS: TIntegerField
      FieldName = 'COD_STATUS'
    end
    object tbMotoristasDES_OBSERVACAO: TWideMemoField
      FieldName = 'DES_OBSERVACAO'
      BlobType = ftWideMemo
    end
    object tbMotoristasDAT_CADASTRO: TDateField
      FieldName = 'DAT_CADASTRO'
    end
    object tbMotoristasCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
    object tbMotoristasVAL_VERBA: TFloatField
      FieldName = 'VAL_VERBA'
    end
    object tbMotoristasVAL_VERBA_COMBUSTIVEL: TFloatField
      FieldName = 'VAL_VERBA_COMBUSTIVEL'
    end
    object tbMotoristasDES_TIPO_CONTA: TWideStringField
      FieldName = 'DES_TIPO_CONTA'
      Size = 40
    end
    object tbMotoristasCOD_BANCO: TWideStringField
      FieldName = 'COD_BANCO'
      Size = 8
    end
    object tbMotoristasCOD_AGENCIA: TWideStringField
      FieldName = 'COD_AGENCIA'
    end
    object tbMotoristasNUM_CONTA: TWideStringField
      FieldName = 'NUM_CONTA'
      Size = 40
    end
    object tbMotoristasNOM_FAVORECIDO: TWideStringField
      FieldName = 'NOM_FAVORECIDO'
      Size = 140
    end
    object tbMotoristasNUM_CPF_CNPJ_FAVORECIDO: TWideStringField
      FieldName = 'NUM_CPF_CNPJ_FAVORECIDO'
      Size = 40
    end
    object tbMotoristasDES_FORMA_PAGAMENTO: TWideStringField
      FieldName = 'DES_FORMA_PAGAMENTO'
      Size = 60
    end
    object tbMotoristasCOD_CENTRO_CUSTO: TIntegerField
      FieldName = 'COD_CENTRO_CUSTO'
    end
    object tbMotoristasDOM_VITIMA_ROUBO: TWideStringField
      FieldName = 'DOM_VITIMA_ROUBO'
      Size = 2
    end
    object tbMotoristasQTD_VITIMA_ROUBO: TIntegerField
      FieldName = 'QTD_VITIMA_ROUBO'
    end
    object tbMotoristasDOM_ACIDENTES: TWideStringField
      FieldName = 'DOM_ACIDENTES'
      Size = 2
    end
    object tbMotoristasQTD_ACIDENTES: TIntegerField
      FieldName = 'QTD_ACIDENTES'
    end
    object tbMotoristasDOM_TRANSPORTE_EMPRESA: TWideStringField
      FieldName = 'DOM_TRANSPORTE_EMPRESA'
      Size = 2
    end
    object tbMotoristasQTD_TRANSPORTE: TIntegerField
      FieldName = 'QTD_TRANSPORTE'
    end
    object tbMotoristasDOM_GV: TWideStringField
      FieldName = 'DOM_GV'
      Size = 2
    end
    object tbMotoristasDAT_GV: TDateField
      FieldName = 'DAT_GV'
    end
    object tbMotoristasNOM_EXECUTANTE: TWideStringField
      FieldName = 'NOM_EXECUTANTE'
      Size = 60
    end
    object tbMotoristasDAT_ALTERACAO: TDateTimeField
      FieldName = 'DAT_ALTERACAO'
    end
    object tbMotoristasDES_CHAVE: TWideStringField
      FieldName = 'DES_CHAVE'
      Size = 140
    end
    object tbMotoristasCOD_GRUPO: TIntegerField
      FieldName = 'COD_GRUPO'
    end
    object tbMotoristasCOD_ROTEIRO: TWideStringField
      FieldName = 'COD_ROTEIRO'
      Size = 60
    end
  end
  object tbInsumos: TdxMemData
    Indexes = <>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F040000000400000003000A0049445F494E53554D4F
      006400000014000B004445535F494E53554D4F000A00000014000C004445535F
      554E49444144450000000000190008004445535F4C4F4700}
    SortOptions = []
    Left = 1176
    object tbInsumosID_INSUMO: TIntegerField
      FieldName = 'ID_INSUMO'
    end
    object tbInsumosDES_INSUMO: TWideStringField
      FieldName = 'DES_INSUMO'
      Size = 100
    end
    object tbInsumosDES_UNIDADE: TWideStringField
      FieldName = 'DES_UNIDADE'
      Size = 10
    end
    object tbInsumosDES_LOG: TWideMemoField
      FieldName = 'DES_LOG'
      BlobType = ftWideMemo
    end
  end
  object tbConsumo: TdxMemData
    Indexes = <>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F090000000400000003000B0049445F434F4E53554D
      4F000400000003000A0049445F494E53554D4F000400000003000C00434F445F
      56454943554C4F000400000009000C004441545F434F4E53554D4F0008000000
      06000F005154445F4B4D5F434F4E53554D4F000400000003000C0049445F434F
      4E54524F4C45000800000006000C005154445F434F4E53554D4F000800000006
      000C0056414C5F434F4E53554D4F0000000000190008004445535F4C4F4700}
    SortOptions = []
    AfterInsert = tbConsumoAfterInsert
    BeforePost = tbConsumoBeforePost
    Left = 1224
    object tbConsumoID_CONSUMO: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_CONSUMO'
    end
    object tbConsumoID_INSUMO: TIntegerField
      DisplayLabel = 'Insumo'
      FieldName = 'ID_INSUMO'
    end
    object tbConsumoDES_PLACA: TStringField
      DisplayLabel = 'Placa'
      FieldName = 'DES_PLACA'
      Size = 7
    end
    object tbConsumoDAT_CONSUMO: TDateField
      DisplayLabel = 'Data'
      FieldName = 'DAT_CONSUMO'
    end
    object tbConsumoQTD_KM_CONSUMO: TFloatField
      DisplayLabel = 'KM'
      FieldName = 'QTD_KM_CONSUMO'
    end
    object tbConsumoID_CONTROLE: TIntegerField
      DisplayLabel = 'Controle'
      FieldName = 'ID_CONTROLE'
    end
    object tbConsumoQTD_CONSUMO: TFloatField
      DisplayLabel = 'Qtde.'
      FieldName = 'QTD_CONSUMO'
    end
    object tbConsumoVAL_CONSUMO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VAL_CONSUMO'
    end
    object tbConsumoDOM_CONSUMO: TStringField
      FieldName = 'DOM_CONSUMO'
      Size = 1
    end
    object tbConsumoDES_LOG: TWideMemoField
      DisplayLabel = 'LOG'
      FieldName = 'DES_LOG'
      BlobType = ftWideMemo
    end
  end
  object dsInsumos: TDataSource
    AutoEdit = False
    DataSet = tbInsumos
    Left = 312
  end
  object dsConsumo: TDataSource
    AutoEdit = False
    DataSet = tbConsumo
    Left = 376
    Top = 65528
  end
end
