object frmEntregas: TfrmEntregas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Entregas'
  ClientHeight = 639
  ClientWidth = 1096
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel27: TcxLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alTop
    AutoSize = False
    Caption = 'Entregas'
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
    Width = 1090
    AnchorY = 22
  end
  object cxGroupBox1: TcxGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 47
    Align = alLeft
    Caption = 'Pesquisa'
    TabOrder = 1
    Height = 589
    Width = 174
    object cxButton1: TcxButton
      AlignWithMargins = True
      Left = 6
      Top = 556
      Width = 162
      Height = 20
      Cursor = crHandPoint
      Align = alBottom
      Action = actEntregaSair
      Cancel = True
      TabOrder = 0
    end
    object cxLabel1: TcxLabel
      AlignWithMargins = True
      Left = 6
      Top = 18
      Align = alTop
      Caption = 'Nosso N'#250'mero'
      Transparent = True
    end
    object cxNossoNomero: TcxMemo
      AlignWithMargins = True
      Left = 6
      Top = 41
      Hint = 'Lista de Nosso N'#250'mero'
      Align = alTop
      Properties.ClearKey = 8238
      Properties.ScrollBars = ssVertical
      TabOrder = 2
      Height = 64
      Width = 162
    end
    object cxLabel2: TcxLabel
      AlignWithMargins = True
      Left = 6
      Top = 111
      Align = alTop
      Caption = 'Expedi'#231#227'o'
      Transparent = True
    end
    object cxExpedicaoInicial: TcxDateEdit
      AlignWithMargins = True
      Left = 6
      Top = 134
      Hint = 'Data inicial do per'#237'odo de expedi'#231#227'o'
      Align = alTop
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 4
      Width = 162
    end
    object cxExpedicaoFinal: TcxDateEdit
      AlignWithMargins = True
      Left = 6
      Top = 161
      Hint = 'Data final do per'#237'odo de expedi'#231#227'o'
      Align = alTop
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 5
      Width = 162
    end
    object cxLabel3: TcxLabel
      AlignWithMargins = True
      Left = 6
      Top = 188
      Align = alTop
      Caption = 'Previs'#227'o de Entrega'
      Transparent = True
    end
    object cxPrevisaoInicial: TcxDateEdit
      AlignWithMargins = True
      Left = 6
      Top = 211
      Hint = 'Data inicial da previs'#227'o de entrega'
      Align = alTop
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 7
      Width = 162
    end
    object cxPrevisaoFinal: TcxDateEdit
      AlignWithMargins = True
      Left = 6
      Top = 238
      Hint = 'Data final da previs'#227'o da entrega'
      Align = alTop
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 8
      Width = 162
    end
    object cxLabel4: TcxLabel
      AlignWithMargins = True
      Left = 6
      Top = 265
      Align = alTop
      Caption = 'Baixa'
      Transparent = True
    end
    object cxBaixaInicial: TcxDateEdit
      AlignWithMargins = True
      Left = 6
      Top = 288
      Hint = 'Data inicial da baixa de entrega'
      Align = alTop
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 10
      Width = 162
    end
    object cxBaixaFinal: TcxDateEdit
      AlignWithMargins = True
      Left = 6
      Top = 315
      Hint = 'Data final da baixa da entrega'
      Align = alTop
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 11
      Width = 162
    end
    object cxLabel5: TcxLabel
      AlignWithMargins = True
      Left = 6
      Top = 386
      Align = alTop
      Caption = 'Clientes'
      Transparent = True
    end
    object cxClientes: TcxMemo
      AlignWithMargins = True
      Left = 6
      Top = 409
      Hint = 'Lista de clientes (Tecle F9 para exibir a listagem de apoio)'
      Align = alTop
      Properties.ClearKey = 8238
      Properties.ScrollBars = ssVertical
      TabOrder = 13
      Height = 52
      Width = 162
    end
    object cxButton2: TcxButton
      AlignWithMargins = True
      Left = 6
      Top = 467
      Width = 162
      Height = 20
      Cursor = crHandPoint
      Align = alTop
      Action = actEntregaConsultar
      Cancel = True
      TabOrder = 14
    end
    object cxButton3: TcxButton
      AlignWithMargins = True
      Left = 6
      Top = 493
      Width = 162
      Height = 20
      Cursor = crHandPoint
      Align = alTop
      Action = actEntregaDetalhar
      Cancel = True
      TabOrder = 15
    end
    object ActivityIndicator1: TActivityIndicator
      Left = 64
      Top = 518
      FrameDelay = 10
      IndicatorType = aitRotatingSector
    end
    object cboClienteEmpresa: TcxComboBox
      Left = 3
      Top = 362
      Hint = 'Selecione o Cliente da Empresa'
      Align = alTop
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        '0 - TODOS'
        '1 - TRANSFOLHA'
        '2 - CARRIERS')
      TabOrder = 17
      Text = '0 - TODOS'
      Width = 168
    end
    object cxLabel28: TcxLabel
      AlignWithMargins = True
      Left = 6
      Top = 342
      Align = alTop
      Caption = 'Clientes da Empresa'
      Transparent = True
    end
  end
  object cxPageControl1: TcxPageControl
    AlignWithMargins = True
    Left = 183
    Top = 47
    Width = 910
    Height = 589
    Align = alClient
    TabOrder = 2
    Properties.ActivePage = cxTabSheet1
    Properties.CustomButtons.Buttons = <>
    Properties.HideTabs = True
    ClientRectBottom = 588
    ClientRectLeft = 1
    ClientRectRight = 909
    ClientRectTop = 1
    object cxTabSheet1: TcxTabSheet
      Caption = 'cxTabSheet1'
      ImageIndex = 0
      object cxGrid1: TcxGrid
        Left = 0
        Top = 0
        Width = 908
        Height = 587
        Align = alClient
        TabOrder = 0
        object cxGrid1DBTableView1: TcxGridDBTableView
          Navigator.Buttons.OnButtonClick = cxGrid1DBTableView1NavigatorButtonsButtonClick
          Navigator.Buttons.CustomButtons = <
            item
              Hint = 'Exportar Dados'
              ImageIndex = 30
            end>
          Navigator.Buttons.Images = dm.iml16x16
          Navigator.Buttons.First.Hint = 'Primeiro Registro'
          Navigator.Buttons.PriorPage.Visible = False
          Navigator.Buttons.Prior.Hint = 'Registro Anterior'
          Navigator.Buttons.Next.Hint = 'Pr'#243'ximo Registro'
          Navigator.Buttons.NextPage.Visible = False
          Navigator.Buttons.Last.Hint = #218'ltimo Registro'
          Navigator.Buttons.Insert.Visible = False
          Navigator.Buttons.Delete.Visible = False
          Navigator.Buttons.Edit.Visible = False
          Navigator.Buttons.Post.Visible = False
          Navigator.Buttons.Cancel.Visible = False
          Navigator.Buttons.Refresh.Visible = True
          Navigator.Buttons.SaveBookmark.Visible = False
          Navigator.Buttons.GotoBookmark.Visible = False
          Navigator.Buttons.Filter.Visible = False
          Navigator.InfoPanel.DisplayMask = 'Registro [RecordIndex] de [RecordCount]'
          Navigator.InfoPanel.Visible = True
          Navigator.Visible = True
          OnCellDblClick = cxGrid1DBTableView1CellDblClick
          DataController.DataSource = ds
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0'
              Kind = skSum
              Column = cxGrid1DBTableView1Column6
            end
            item
              Format = ',0.000'
              Kind = skSum
              Column = cxGrid1DBTableView1Column10
            end
            item
              Format = ',0.000'
              Kind = skSum
              Column = cxGrid1DBTableView1Column17
            end
            item
              Format = ',0.00'
              Kind = skSum
              Column = cxGrid1DBTableView1Column13
            end
            item
              Format = ',0.00'
              Kind = skSum
              Column = cxGrid1DBTableView1Column18
            end
            item
              Format = ',0.00'
              Kind = skSum
              Column = cxGrid1DBTableView1Column19
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnsQuickCustomization = True
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.InvertSelect = False
          OptionsSelection.MultiSelect = True
          OptionsSelection.CellMultiSelect = True
          OptionsView.NoDataToDisplayInfoText = '<Nenhuma informa'#231#227'o dispon'#237'vel>'
          OptionsView.Footer = True
          OptionsView.FooterAutoHeight = True
          OptionsView.FooterMultiSummaries = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object cxGrid1DBTableView1Column1: TcxGridDBColumn
            Caption = 'Nosso N'#250'mero'
            DataBinding.FieldName = 'NUM_NOSSONUMERO'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.MaxLength = 14
            HeaderAlignmentHorz = taCenter
            Width = 95
          end
          object cxGrid1DBTableView1Column24: TcxGridDBColumn
            Caption = 'C'#243'd Cliente'
            DataBinding.FieldName = 'COD_CLIENTE'
            HeaderAlignmentHorz = taCenter
          end
          object cxGrid1DBTableView1Column2: TcxGridDBColumn
            Caption = 'Cliente'
            DataBinding.FieldName = 'COD_CLIENTE'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'COD_CLIENTE'
            Properties.ListColumns = <
              item
                FieldName = 'NOM_CLIENTE'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dsClientes
            HeaderAlignmentHorz = taCenter
            Width = 160
          end
          object cxGrid1DBTableView1Column20: TcxGridDBColumn
            Caption = 'C'#243'd. Agente'
            DataBinding.FieldName = 'COD_AGENTE'
            HeaderAlignmentHorz = taCenter
            Width = 85
          end
          object cxGrid1DBTableView1Column21: TcxGridDBColumn
            Caption = 'Nome Agente'
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
            Width = 190
          end
          object cxGrid1DBTableView1Column22: TcxGridDBColumn
            Caption = 'C'#243'd. Entregador'
            DataBinding.FieldName = 'COD_ENTREGADOR'
            HeaderAlignmentHorz = taCenter
            Width = 102
          end
          object cxGrid1DBTableView1Column23: TcxGridDBColumn
            Caption = 'Nome Entregador'
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
            Width = 185
          end
          object cxGrid1DBTableView1Column3: TcxGridDBColumn
            Caption = 'NF '#186'. '
            DataBinding.FieldName = 'NUM_NF'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.MaxLength = 15
            HeaderAlignmentHorz = taCenter
            Width = 83
          end
          object cxGrid1DBTableView1Column4: TcxGridDBColumn
            Caption = 'Nome Consumidor'
            DataBinding.FieldName = 'NOM_CONSUMIDOR'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.MaxLength = 70
            HeaderAlignmentHorz = taCenter
            Width = 246
          end
          object cxGrid1DBTableView1Column5: TcxGridDBColumn
            Caption = 'CEP'
            DataBinding.FieldName = 'NUM_CEP'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.MaxLength = 9
            HeaderAlignmentHorz = taCenter
            Width = 82
          end
          object cxGrid1DBTableView1Column6: TcxGridDBColumn
            Caption = 'Volume'
            DataBinding.FieldName = 'QTD_VOLUMES'
            HeaderAlignmentHorz = taCenter
          end
          object cxGrid1DBTableView1Column7: TcxGridDBColumn
            Caption = 'Expedi'#231#227'o'
            DataBinding.FieldName = 'DAT_EXPEDICAO'
            HeaderAlignmentHorz = taCenter
            Width = 82
          end
          object cxGrid1DBTableView1Column8: TcxGridDBColumn
            Caption = 'Previs'#227'o'
            DataBinding.FieldName = 'DAT_PREV_DISTRIBUICAO'
            HeaderAlignmentHorz = taCenter
            Width = 80
          end
          object cxGrid1DBTableView1Column9: TcxGridDBColumn
            Caption = 'Baixa'
            DataBinding.FieldName = 'DAT_BAIXA'
            HeaderAlignmentHorz = taCenter
            Width = 79
          end
          object cxGrid1DBTableView1Column10: TcxGridDBColumn
            Caption = 'Peso Cobrado'
            DataBinding.FieldName = 'QTD_PESO_COBRADO'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 3
            Properties.DisplayFormat = ' ,0.000;- ,0.000'
            HeaderAlignmentHorz = taCenter
            Width = 95
          end
          object cxGrid1DBTableView1Column17: TcxGridDBColumn
            Caption = 'Peso Real'
            DataBinding.FieldName = 'QTD_PESO_REAL'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ' ,0.000;- ,0.000'
            Properties.HideSelection = False
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Width = 79
          end
          object cxGrid1DBTableView1Column11: TcxGridDBColumn
            Caption = 'Tipo Peso'
            DataBinding.FieldName = 'DES_TIPO_PESO'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Width = 96
          end
          object cxGrid1DBTableView1Column12: TcxGridDBColumn
            Caption = 'N'#186' Container'
            DataBinding.FieldName = 'NUM_CONTAINER'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Width = 88
          end
          object cxGrid1DBTableView1Column14: TcxGridDBColumn
            Caption = 'Altura'
            DataBinding.FieldName = 'QTD_ALTURA'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
          end
          object cxGrid1DBTableView1Column15: TcxGridDBColumn
            Caption = 'Largura'
            DataBinding.FieldName = 'QTD_LARGURA'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
          end
          object cxGrid1DBTableView1Column16: TcxGridDBColumn
            Caption = 'Comprimento'
            DataBinding.FieldName = 'QTD_COMPRIMENTO'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Width = 80
          end
          object cxGrid1DBTableView1Column13: TcxGridDBColumn
            Caption = 'Valor Produto'
            DataBinding.FieldName = 'VAL_PRODUTO'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ' ,0.00;- ,0.00'
            Properties.ReadOnly = True
            Visible = False
            HeaderAlignmentHorz = taCenter
            Width = 84
          end
          object cxGrid1DBTableView1Column18: TcxGridDBColumn
            Caption = 'Verba Franquia'
            DataBinding.FieldName = 'VAL_VERBA_FRANQUIA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ' ,0.00;- ,0.00'
            Properties.ReadOnly = True
            Visible = False
            HeaderAlignmentHorz = taCenter
            Width = 94
          end
          object cxGrid1DBTableView1Column19: TcxGridDBColumn
            Caption = 'Verba Entregador'
            DataBinding.FieldName = 'VAL_VERBA_ENTREGADOR'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ' ,0.00;- ,0.00'
            Properties.ReadOnly = True
            Visible = False
            HeaderAlignmentHorz = taCenter
            Width = 115
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'cxTabSheet2'
      ImageIndex = 1
      object cxGroupBox2: TcxGroupBox
        Left = 0
        Top = 0
        Align = alClient
        Caption = 'Detalhes da Entrega'
        TabOrder = 0
        DesignSize = (
          908
          580)
        Height = 587
        Width = 908
        object cxLabel6: TcxLabel
          Left = 16
          Top = 17
          Caption = 'Nosso N'#250'mero'
          Transparent = True
        end
        object cxNossoNumero: TcxDBTextEdit
          Left = 16
          Top = 32
          Hint = 'Nosso N'#250'mero'
          DataBinding.DataField = 'NUM_NOSSONUMERO'
          DataBinding.DataSource = ds
          ParentFont = False
          Properties.ReadOnly = True
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 1
          Width = 121
        end
        object cxButton4: TcxButton
          AlignWithMargins = True
          Left = 16
          Top = 541
          Width = 150
          Height = 20
          Cursor = crHandPoint
          Action = actEntregaRetornar
          Anchors = [akLeft, akBottom]
          Cancel = True
          TabOrder = 48
        end
        object cxLabel7: TcxLabel
          Left = 143
          Top = 17
          Caption = 'Adm. CEP'
          Transparent = True
        end
        object cxCodigoAdmCEP: TcxDBTextEdit
          Left = 143
          Top = 32
          Hint = 'C'#243'digo do Administrador do CEP'
          DataBinding.DataField = 'COD_AGENTE'
          DataBinding.DataSource = ds
          ParentFont = False
          Properties.ReadOnly = True
          Properties.OnChange = cxCodigoAdmCEPPropertiesChange
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 2
          Width = 51
        end
        object cxNomeAdmCEP: TcxTextEdit
          Left = 200
          Top = 32
          Hint = 'Nome do Administrador do CEP'
          ParentFont = False
          Properties.ReadOnly = True
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 3
          Width = 185
        end
        object cxLabel8: TcxLabel
          Left = 391
          Top = 17
          Caption = 'Entregador'
          Transparent = True
        end
        object cxCodigoEntregador: TcxDBTextEdit
          Left = 391
          Top = 32
          Hint = 'C'#243'digo do Administrador do CEP'
          DataBinding.DataField = 'COD_ENTREGADOR'
          DataBinding.DataSource = ds
          ParentFont = False
          Properties.ReadOnly = True
          Properties.OnChange = cxCodigoEntregadorPropertiesChange
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 4
          Width = 50
        end
        object cxNomeEntregador: TcxTextEdit
          Left = 447
          Top = 32
          Hint = 'Nome do Entregador'
          ParentFont = False
          Properties.ReadOnly = True
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 5
          Width = 186
        end
        object cxLabel9: TcxLabel
          Left = 639
          Top = 17
          Caption = 'Cliente'
          Transparent = True
        end
        object cxCodigoCliente: TcxDBTextEdit
          Left = 639
          Top = 32
          Hint = 'C'#243'digo do Cliente'
          DataBinding.DataField = 'COD_CLIENTE'
          DataBinding.DataSource = ds
          ParentFont = False
          Properties.ReadOnly = True
          Properties.OnChange = cxCodigoClientePropertiesChange
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 6
          Width = 50
        end
        object cxNomeCliente: TcxTextEdit
          Left = 695
          Top = 32
          Hint = 'Nome do Cliente'
          ParentFont = False
          Properties.ReadOnly = True
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 7
          Width = 186
        end
        object cxLabel10: TcxLabel
          Left = 16
          Top = 59
          Caption = 'Nota Fiscal'
          Transparent = True
        end
        object cxNotaFiscal: TcxDBTextEdit
          Left = 16
          Top = 73
          Hint = 'N'#250'mero da Nota Fiscal'
          DataBinding.DataField = 'NUM_NF'
          DataBinding.DataSource = ds
          ParentFont = False
          Properties.ReadOnly = True
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 8
          Width = 121
        end
        object cxLabel11: TcxLabel
          Left = 143
          Top = 59
          Caption = 'Nome do Consumidor'
          Transparent = True
        end
        object cxNomeConsumidor: TcxDBTextEdit
          Left = 143
          Top = 73
          Hint = 'Nome do Consumidor'
          DataBinding.DataField = 'NOM_CONSUMIDOR'
          DataBinding.DataSource = ds
          ParentFont = False
          Properties.ReadOnly = True
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 9
          Width = 242
        end
        object cxLabel12: TcxLabel
          Left = 391
          Top = 59
          Caption = 'CEP'
          Transparent = True
        end
        object cxCEP: TcxDBTextEdit
          Left = 391
          Top = 73
          Hint = 'CEP do Endere'#231'o do Consumidor'
          DataBinding.DataField = 'NUM_CEP'
          DataBinding.DataSource = ds
          ParentFont = False
          Properties.ReadOnly = True
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 10
          Width = 74
        end
        object cxLabel13: TcxLabel
          Left = 471
          Top = 59
          Caption = 'Endere'#231'o'
          Transparent = True
        end
        object cxEndereco: TcxDBTextEdit
          Left = 471
          Top = 73
          Hint = 'Endere'#231'o do Consumidor'
          DataBinding.DataField = 'DES_ENDERECO'
          DataBinding.DataSource = ds
          ParentFont = False
          Properties.ReadOnly = True
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 11
          Width = 410
        end
        object cxLabel14: TcxLabel
          Left = 16
          Top = 99
          Caption = 'Complemento'
          Transparent = True
        end
        object cxComplemento: TcxDBTextEdit
          Left = 16
          Top = 115
          Hint = 'Complemento do Endere'#231'o do Consumidor'
          DataBinding.DataField = 'DES_COMPLEMENTO'
          DataBinding.DataSource = ds
          ParentFont = False
          Properties.ReadOnly = True
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 12
          Width = 121
        end
        object cxLabel15: TcxLabel
          Left = 143
          Top = 99
          Caption = 'Bairro'
          Transparent = True
        end
        object cxBairro: TcxDBTextEdit
          Left = 143
          Top = 115
          Hint = 'Bairro do Endere'#231'o do Consumidor'
          DataBinding.DataField = 'DES_BAIRRO'
          DataBinding.DataSource = ds
          ParentFont = False
          Properties.ReadOnly = True
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 13
          Width = 242
        end
        object cxLabel16: TcxLabel
          Left = 391
          Top = 99
          Caption = 'Cidade'
          Transparent = True
        end
        object cxCidade: TcxDBTextEdit
          Left = 391
          Top = 115
          Hint = 'Cidade do Endere'#231'o do Consumidor'
          DataBinding.DataField = 'NOM_CIDADE'
          DataBinding.DataSource = ds
          ParentFont = False
          Properties.ReadOnly = True
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 14
          Width = 242
        end
        object cxLabel17: TcxLabel
          Left = 639
          Top = 99
          Caption = 'Telefone(s)'
          Transparent = True
        end
        object cxTelefone: TcxDBTextEdit
          Left = 639
          Top = 115
          Hint = 'N'#250'mero(s) do(s) Telefone(s) do Consumidor'
          DataBinding.DataField = 'NUM_TELEFONE'
          DataBinding.DataSource = ds
          ParentFont = False
          Properties.ReadOnly = True
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 15
          Width = 242
        end
        object cxLabel18: TcxLabel
          Left = 16
          Top = 142
          Caption = 'Expedi'#231#227'o'
          Transparent = True
        end
        object cxExpedicao: TcxDBTextEdit
          Left = 16
          Top = 160
          Hint = 'Data da Expedi'#231#227'o'
          DataBinding.DataField = 'DAT_EXPEDICAO'
          DataBinding.DataSource = ds
          ParentFont = False
          Properties.ReadOnly = True
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 16
          Width = 121
        end
        object cxLabel19: TcxLabel
          Left = 143
          Top = 142
          Caption = 'Previs'#227'o'
          Transparent = True
        end
        object cxPrevisao: TcxDBTextEdit
          Left = 143
          Top = 160
          Hint = 'Data da Previs'#227'o de Entrega'
          DataBinding.DataField = 'DAT_PREV_DISTRIBUICAO'
          DataBinding.DataSource = ds
          ParentFont = False
          Properties.ReadOnly = True
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 17
          Width = 121
        end
        object cxLabel20: TcxLabel
          Left = 270
          Top = 142
          Caption = 'Previs'#227'o'
          Transparent = True
        end
        object cxDataEntrega: TcxDBTextEdit
          Left = 270
          Top = 160
          Hint = 'Data da Entrega'
          DataBinding.DataField = 'DAT_ENTREGA'
          DataBinding.DataSource = ds
          ParentFont = False
          Properties.ReadOnly = True
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 18
          Width = 121
        end
        object cxLabel21: TcxLabel
          Left = 397
          Top = 142
          Caption = #218'ltima Atribui'#231#227'o'
          Transparent = True
        end
        object cxAtribuicao: TcxDBTextEdit
          Left = 397
          Top = 160
          Hint = 'Data da '#218'ltima Atribui'#231#227'o'
          DataBinding.DataField = 'DAT_ATRIBUICAO'
          DataBinding.DataSource = ds
          ParentFont = False
          Properties.ReadOnly = True
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 19
          Width = 121
        end
        object cxLabel22: TcxLabel
          Left = 524
          Top = 142
          Caption = 'Volume'
          Transparent = True
        end
        object cxVolume: TcxDBTextEdit
          Left = 524
          Top = 160
          Hint = 'N'#250'mero do Volume'
          DataBinding.DataField = 'QTD_VOLUMES'
          DataBinding.DataSource = ds
          ParentFont = False
          Properties.ReadOnly = True
          Properties.OnChange = cxCodigoAdmCEPPropertiesChange
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 20
          Width = 51
        end
        object cxLabel23: TcxLabel
          Left = 581
          Top = 142
          Caption = 'Baixa'
          Transparent = True
        end
        object cxBaixa: TcxDBTextEdit
          Left = 581
          Top = 160
          Hint = 'Data da Baixa'
          DataBinding.DataField = 'DAT_BAIXA'
          DataBinding.DataSource = ds
          ParentFont = False
          Properties.ReadOnly = True
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 21
          Width = 121
        end
        object cxLabel24: TcxLabel
          Left = 708
          Top = 142
          Caption = 'Peso'
          Transparent = True
        end
        object cxPeso: TcxDBTextEdit
          Left = 708
          Top = 160
          Hint = 'Peso do Produto'
          DataBinding.DataField = 'QTD_PESO_REAL'
          DataBinding.DataSource = ds
          ParentFont = False
          Properties.ReadOnly = True
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 22
          Width = 109
        end
        object cxLabel25: TcxLabel
          Left = 16
          Top = 187
          Caption = 'Rastreamento e Ocorr'#234'ncias'
          Transparent = True
        end
        object cxOcorrencia: TcxComboBox
          Left = 16
          Top = 210
          Hint = 'Selecione ou digite a ocorr'#234'ncia'
          TabOrder = 24
          Width = 793
        end
        object cxRastreamento: TcxDBMemo
          Left = 16
          Top = 237
          Hint = 'Ocorr'#234'ncias e Dados de Rastreamento'
          DataBinding.DataField = 'DES_RASTREIO'
          DataBinding.DataSource = ds
          ParentFont = False
          Properties.ReadOnly = True
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 26
          Height = 179
          Width = 865
        end
        object cxButton5: TcxButton
          AlignWithMargins = True
          Left = 823
          Top = 226
          Width = 58
          Height = 20
          Cursor = crHandPoint
          Action = actEntregaIncluirOcorrencia
          Anchors = [akLeft, akBottom]
          Cancel = True
          TabOrder = 25
        end
        object cxLabel26: TcxLabel
          Left = 823
          Top = 142
          Caption = 'Atraso'
          Transparent = True
        end
        object cxAtraso: TcxDBTextEdit
          Left = 823
          Top = 160
          Hint = 'Quantidade de dias de atraso na entrega'
          DataBinding.DataField = 'QTD_DIAS_ATRASO'
          DataBinding.DataSource = ds
          ParentFont = False
          Properties.ReadOnly = True
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 23
          Width = 58
        end
        object cxButton6: TcxButton
          AlignWithMargins = True
          Left = 16
          Top = 444
          Width = 150
          Height = 20
          Cursor = crHandPoint
          Action = actEntregaAtraso
          Anchors = [akLeft, akBottom]
          Cancel = True
          TabOrder = 27
        end
        object cxButton7: TcxButton
          AlignWithMargins = True
          Left = 172
          Top = 444
          Width = 150
          Height = 20
          Cursor = crHandPoint
          Action = actEntregaEntregador
          Anchors = [akLeft, akBottom]
          Cancel = True
          TabOrder = 28
        end
      end
    end
  end
  object aclEntregas: TActionList
    Left = 808
    object actEntregaSair: TAction
      Tag = 99
      Category = 'Entrega'
      Caption = 'Sair'
      Hint = 'Sair da tela'
      OnExecute = actEntregaSairExecute
    end
    object actEntregaConsultar: TAction
      Tag = 3
      Category = 'Entrega'
      Caption = 'Consultar'
      Hint = 'Consultar entregas'
      OnExecute = actEntregaConsultarExecute
    end
    object actEntregaDetalhar: TAction
      Tag = 3
      Category = 'Entrega'
      Caption = 'Detalhar'
      Hint = 'Detalhar dados da entrega'
      OnExecute = actEntregaDetalharExecute
    end
    object actEntregaApoio: TAction
      Tag = 99
      Category = 'Entrega'
      Caption = 'Listagem de Apoio'
      Hint = 'Listagem de Apoio'
      ShortCut = 120
    end
    object actEntregaRetornar: TAction
      Tag = 99
      Category = 'Entrega'
      Caption = 'Retornar'
      Hint = 'Retornar '#224' grade'
      OnExecute = actEntregaRetornarExecute
    end
    object actEntregaIncluirOcorrencia: TAction
      Tag = 3
      Category = 'Entrega'
      Caption = 'Incluir'
      Hint = 'Incluir Ocorr'#234'ncia'
      OnExecute = actEntregaIncluirOcorrenciaExecute
    end
    object actEntregaAtraso: TAction
      Tag = 2
      Category = 'Entrega'
      Caption = 'Alterar Atraso'
      Hint = 'Alterar o Atraso'
      OnExecute = actEntregaAtrasoExecute
    end
    object actEntregaEntregador: TAction
      Tag = 2
      Category = 'Entrega'
      Caption = 'Alterar Entregador'
      Hint = 'Alterar Entregador Atribuido na Baixa'
      OnExecute = actEntregaEntregadorExecute
    end
  end
  object ds: TDataSource
    AutoEdit = False
    DataSet = dm.qryGrid
    Left = 856
  end
  object SaveDialog: TSaveDialog
    Left = 664
    Top = 8
  end
  object dsClientes: TDataSource
    AutoEdit = False
    DataSet = dm.qryClientes
    Left = 904
  end
  object dsAgentes: TDataSource
    AutoEdit = False
    DataSet = dm.qryAgentes
    Left = 952
  end
  object dsEntregadores: TDataSource
    AutoEdit = False
    DataSet = dm.qryCodigosEntregadores
    Left = 1000
  end
end
