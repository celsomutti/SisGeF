object frmExtratoExpressa: TfrmExtratoExpressa
  Left = 0
  Top = 0
  Caption = 'Extrato Expressas'
  ClientHeight = 650
  ClientWidth = 1250
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
    Caption = 'Extrato de Expressas'
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
    Width = 1244
    AnchorY = 22
  end
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 44
    Width = 1250
    Height = 606
    Align = alClient
    TabOrder = 1
    LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
    OptionsImage.Images = dm.cxImageList1
    object dxLayoutControl2: TdxLayoutControl
      Left = 10
      Top = 10
      Width = 1200
      Height = 199
      TabOrder = 0
      LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
      OptionsImage.Images = dm.cxImageList1
      object dxLayoutControl3: TdxLayoutControl
        Left = 22
        Top = 49
        Width = 1151
        Height = 122
        TabOrder = 0
        LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
        OptionsImage.Images = dm.cxImageList1
        object datinicioExtrato: TcxDateEdit
          Left = 111
          Top = 30
          Hint = 'Data inicial do per'#237'odo do extrato'
          Properties.SaveTime = False
          Properties.ShowTime = False
          Style.HotTrack = False
          TabOrder = 1
          Width = 87
        end
        object datFinalExtrato: TcxDateEdit
          Left = 204
          Top = 30
          Hint = 'Data final do per'#237'odo do extrato'
          Style.HotTrack = False
          TabOrder = 2
          Width = 82
        end
        object cboTipoExtrato: TcxComboBox
          Left = 292
          Top = 30
          Hint = 'Tipo de extrato'
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            'Distribuidores'
            'Entregadores')
          Properties.OnChange = cboTipoExtratoPropertiesChange
          Style.HotTrack = False
          TabOrder = 3
          Text = 'Distribuidores'
          Width = 99
        end
        object cboTipoCalculo: TcxComboBox
          Left = 397
          Top = 30
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            'SLA'
            'FAIXAS DE PESO X CEP'
            'VERBA FIXA')
          Properties.OnChange = cboTipoCalculoPropertiesChange
          Style.HotTrack = False
          TabOrder = 4
          Text = 'SLA'
          Width = 116
        end
        object curValorVerba: TcxCurrencyEdit
          Left = 519
          Top = 30
          Hint = 'Valor da verba fixa'
          EditValue = 0.000000000000000000
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ' ,0.00;- ,0.00'
          Style.HotTrack = False
          TabOrder = 5
          Width = 91
        end
        object cboTipoPeriodo: TcxComboBox
          Left = 10
          Top = 30
          Properties.DropDownListStyle = lsEditFixedList
          Properties.Items.Strings = (
            'BAIXAS'
            'ENTREGAS'
            'ATRIBUI'#199#213'ES')
          Style.HotTrack = False
          TabOrder = 0
          Text = 'BAIXAS'
          Width = 95
        end
        object chkLancamentos: TcxCheckBox
          Left = 212
          Top = 57
          Hint = 'Considerar lan'#231'amentos de d'#233'bitos e cr'#233'ditos'
          Caption = 'D'#233'bitos e Cr'#233'ditos'
          State = cbsChecked
          Style.HotTrack = False
          TabOrder = 8
          Transparent = True
        end
        object chkAbastecimento: TcxCheckBox
          Left = 414
          Top = 57
          Hint = 'Considerar d'#233'bitos de abastecimentos'
          Caption = 'Abastecimentos'
          State = cbsChecked
          Style.HotTrack = False
          TabOrder = 9
          Transparent = True
        end
        object chkRestricoes: TcxCheckBox
          Left = 10
          Top = 57
          Hint = 'Selecione para considerar as restri'#231#245'es'
          Caption = 'Restri'#231#245'es'
          State = cbsChecked
          Style.HotTrack = False
          TabOrder = 6
          Transparent = True
        end
        object lbClientes: TcxListBox
          Left = 616
          Top = 30
          Width = 209
          Height = 47
          Hint = 
            'Lista de Clientes (clique com o bot'#227'o direito do mouse para op'#231#245 +
            'es)'
          ItemHeight = 13
          MultiSelect = True
          PopupMenu = pupClientes
          TabOrder = 10
        end
        object lbDistribuidores: TcxListBox
          Left = 831
          Top = 30
          Width = 226
          Height = 47
          Hint = 
            'Lista de Distribuidores ou Entregadores (clique com o bot'#227'o dire' +
            'ito do mouse para op'#231#245'es)'
          ItemHeight = 13
          MultiSelect = True
          PopupMenu = pupDistribuidores
          TabOrder = 11
        end
        object chkAtribuirVerbas: TcxCheckBox
          Left = 10
          Top = 82
          Hint = 'Atribuir Verbas'
          Caption = 'Atribuir Verbas'
          State = cbsChecked
          Style.HotTrack = False
          TabOrder = 7
          Transparent = True
        end
        object cxButton1: TcxButton
          Left = 1063
          Top = 45
          Width = 108
          Height = 25
          Cursor = crHandPoint
          Action = actProcessar
          TabOrder = 12
        end
        object cxButton4: TcxButton
          Left = 1063
          Top = 76
          Width = 108
          Height = 25
          Cursor = crHandPoint
          Action = actFecharExtrato
          TabOrder = 13
        end
        object dxLayoutControl3Group_Root: TdxLayoutGroup
          AlignHorz = ahParentManaged
          AlignVert = avTop
          LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
          AllowRemove = False
          ButtonOptions.Buttons = <>
          Hidden = True
          LayoutDirection = ldHorizontal
          ShowBorder = False
          Index = -1
        end
        object lcDataInicialExtrato: TdxLayoutItem
          Parent = dxLayoutControl3Group1
          CaptionOptions.ImageIndex = 7
          CaptionOptions.Text = 'Data inicial'
          CaptionOptions.Layout = clTop
          LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
          Control = datinicioExtrato
          ControlOptions.ShowBorder = False
          Index = 1
        end
        object lciDataFinalExtrato: TdxLayoutItem
          Parent = dxLayoutControl3Group1
          CaptionOptions.ImageIndex = 7
          CaptionOptions.Text = 'Data final'
          CaptionOptions.Layout = clTop
          Control = datFinalExtrato
          ControlOptions.ShowBorder = False
          Index = 2
        end
        object lciTipoExtrato: TdxLayoutItem
          Parent = dxLayoutControl3Group1
          CaptionOptions.ImageIndex = 24
          CaptionOptions.Text = 'Tipo de Extrato'
          CaptionOptions.Layout = clTop
          Control = cboTipoExtrato
          ControlOptions.ShowBorder = False
          Index = 3
        end
        object lcitipoCalculo: TdxLayoutItem
          Parent = dxLayoutControl3Group1
          CaptionOptions.ImageIndex = 30
          CaptionOptions.Text = 'Tipo de C'#225'lculo'
          CaptionOptions.Layout = clTop
          Control = cboTipoCalculo
          ControlOptions.ShowBorder = False
          Index = 4
        end
        object lciVerbaFixa: TdxLayoutItem
          Parent = dxLayoutControl3Group1
          CaptionOptions.ImageIndex = 81
          CaptionOptions.Text = 'Valor da Verba'
          CaptionOptions.Layout = clTop
          Visible = False
          Control = curValorVerba
          ControlOptions.ShowBorder = False
          Index = 5
        end
        object lciTipoPeriodo: TdxLayoutItem
          Parent = dxLayoutControl3Group1
          CaptionOptions.ImageIndex = 98
          CaptionOptions.Text = 'Tipo de Per'#237'odo'
          CaptionOptions.Layout = clTop
          LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
          Control = cboTipoPeriodo
          ControlOptions.ShowBorder = False
          Index = 0
        end
        object dxLayoutControl3Group1: TdxLayoutAutoCreatedGroup
          Parent = dxLayoutControl3Group3
          LayoutDirection = ldHorizontal
          Index = 0
          AutoCreated = True
        end
        object dxLayoutControl3Group3: TdxLayoutAutoCreatedGroup
          Parent = dxLayoutControl3Group_Root
          Index = 0
          AutoCreated = True
        end
        object cliLancamentos: TdxLayoutItem
          Parent = dxLayoutControl3Group2
          AlignHorz = ahClient
          CaptionOptions.Text = 'cxCheckBox2'
          CaptionOptions.Visible = False
          Control = chkLancamentos
          ControlOptions.ShowBorder = False
          Index = 1
        end
        object cliAbastecimento: TdxLayoutItem
          Parent = dxLayoutControl3Group2
          AlignHorz = ahClient
          CaptionOptions.Text = 'cxCheckBox1'
          CaptionOptions.Visible = False
          Control = chkAbastecimento
          ControlOptions.ShowBorder = False
          Index = 2
        end
        object cliRestricoes: TdxLayoutItem
          Parent = dxLayoutControl3Group5
          AlignHorz = ahClient
          CaptionOptions.Text = 'cxCheckBox1'
          CaptionOptions.Visible = False
          Control = chkRestricoes
          ControlOptions.ShowBorder = False
          Index = 0
        end
        object lciClientes: TdxLayoutItem
          Parent = dxLayoutControl3Group_Root
          CaptionOptions.ImageIndex = 56
          CaptionOptions.Text = 'Clientes'
          CaptionOptions.Layout = clTop
          Control = lbClientes
          ControlOptions.ShowBorder = False
          Index = 1
        end
        object lciDistribuidores: TdxLayoutItem
          Parent = dxLayoutControl3Group_Root
          CaptionOptions.ImageIndex = 57
          CaptionOptions.Text = 'Distribuidores'
          CaptionOptions.Layout = clTop
          Control = lbDistribuidores
          ControlOptions.ShowBorder = False
          Index = 2
        end
        object cliAtribuirVerbas: TdxLayoutItem
          Parent = dxLayoutControl3Group5
          AlignHorz = ahClient
          CaptionOptions.Text = 'cxCheckBox1'
          CaptionOptions.Visible = False
          Visible = False
          Control = chkAtribuirVerbas
          ControlOptions.ShowBorder = False
          Index = 1
        end
        object dxLayoutControl3Group5: TdxLayoutAutoCreatedGroup
          Parent = dxLayoutControl3Group2
          AlignHorz = ahClient
          Index = 0
          AutoCreated = True
        end
        object dxLayoutControl3Group2: TdxLayoutAutoCreatedGroup
          Parent = dxLayoutControl3Group3
          LayoutDirection = ldHorizontal
          Index = 1
          AutoCreated = True
        end
        object dxLayoutControl3Item1: TdxLayoutItem
          Parent = dxLayoutControl3Group4
          AlignVert = avBottom
          CaptionOptions.Text = 'cxButton1'
          CaptionOptions.Visible = False
          LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
          Control = cxButton1
          ControlOptions.ShowBorder = False
          Index = 0
        end
        object dxLayoutControl3Item2: TdxLayoutItem
          Parent = dxLayoutControl3Group4
          AlignVert = avBottom
          CaptionOptions.Text = 'cxButton4'
          CaptionOptions.Visible = False
          LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
          Control = cxButton4
          ControlOptions.ShowBorder = False
          Index = 1
        end
        object dxLayoutControl3Group4: TdxLayoutAutoCreatedGroup
          Parent = dxLayoutControl3Group_Root
          Index = 3
          AutoCreated = True
        end
      end
      object dxLayoutControl4: TdxLayoutControl
        Left = 10000
        Top = 10000
        Width = 1151
        Height = 122
        TabOrder = 1
        Visible = False
        OptionsImage.Images = dm.cxImageList1
        object cboDatas: TcxComboBox
          Left = 10
          Top = 30
          Properties.DropDownListStyle = lsFixedList
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebs3D
          Style.HotTrack = False
          Style.ButtonStyle = bts3D
          Style.PopupBorderStyle = epbsFrame3D
          TabOrder = 0
          Width = 143
        end
        object cboTipoExtratoFechado: TcxComboBox
          Left = 159
          Top = 30
          Properties.Items.Strings = (
            'Distribuidores'
            'Entregadores')
          Properties.OnChange = cboTipoExtratoFechadoPropertiesChange
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebs3D
          Style.HotTrack = False
          Style.ButtonStyle = bts3D
          Style.PopupBorderStyle = epbsFrame3D
          TabOrder = 1
          Text = 'Distribuidores'
          Width = 130
        end
        object lbDistribuidoresFechado: TcxListBox
          Left = 295
          Top = 30
          Width = 235
          Height = 51
          ItemHeight = 13
          PopupMenu = pupDistribuidoresFechado
          TabOrder = 2
        end
        object cxButton5: TcxButton
          Left = 536
          Top = 10
          Width = 105
          Height = 25
          Cursor = crHandPoint
          Action = actEmitirExtrato
          TabOrder = 3
        end
        object dxLayoutControl4Group_Root: TdxLayoutGroup
          AlignHorz = ahLeft
          AlignVert = avTop
          ButtonOptions.Buttons = <>
          Hidden = True
          LayoutDirection = ldHorizontal
          ShowBorder = False
          Index = -1
        end
        object lciDatasPagamento: TdxLayoutItem
          Parent = dxLayoutControl4Group_Root
          CaptionOptions.ImageIndex = 98
          CaptionOptions.Text = 'Datas de Pagamento'
          CaptionOptions.Layout = clTop
          Control = cboDatas
          ControlOptions.ShowBorder = False
          Index = 0
        end
        object lciTipoExtratoFechado: TdxLayoutItem
          Parent = dxLayoutControl4Group_Root
          CaptionOptions.ImageIndex = 24
          CaptionOptions.Text = 'Tipo de Extrato'
          CaptionOptions.Layout = clTop
          Control = cboTipoExtratoFechado
          ControlOptions.ShowBorder = False
          Index = 1
        end
        object lciDistribuidoresFechado: TdxLayoutItem
          Parent = dxLayoutControl4Group_Root
          CaptionOptions.ImageIndex = 57
          CaptionOptions.Text = 'Distribuidores'
          CaptionOptions.Layout = clTop
          Control = lbDistribuidoresFechado
          ControlOptions.ShowBorder = False
          Index = 2
        end
        object dxLayoutControl4Item4: TdxLayoutItem
          Parent = dxLayoutControl4Group_Root
          CaptionOptions.Text = 'cxButton5'
          CaptionOptions.Visible = False
          Control = cxButton5
          ControlOptions.ShowBorder = False
          Index = 3
        end
      end
      object dxLayoutControl2Group_Root: TdxLayoutGroup
        AlignHorz = ahParentManaged
        AlignVert = avTop
        LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
        SizeOptions.AssignedValues = [sovSizableVert]
        SizeOptions.SizableVert = False
        ButtonOptions.Buttons = <>
        Hidden = True
        LayoutDirection = ldTabbed
        ShowBorder = False
        Index = -1
      end
      object lciExtrato: TdxLayoutItem
        Parent = dxLayoutControl2Group_Root
        CaptionOptions.ImageIndex = 37
        CaptionOptions.Text = 'Extrato'
        CaptionOptions.Visible = False
        CaptionOptions.Layout = clTop
        LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
        Control = dxLayoutControl3
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object dxLayoutControl2Item2: TdxLayoutItem
        Parent = dxLayoutControl2Group_Root
        CaptionOptions.ImageIndex = 96
        CaptionOptions.Text = 'Demonstrativo'
        CaptionOptions.Visible = False
        CaptionOptions.Layout = clTop
        Control = dxLayoutControl4
        ControlOptions.ShowBorder = False
        Index = 1
      end
    end
    object grdExtrato: TcxGrid
      Left = 10
      Top = 215
      Width = 1200
      Height = 350
      TabOrder = 1
      object tvExtrato: TcxGridDBBandedTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsExtrato
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0;-,0'
            Kind = skSum
            Column = tvExtratoQTD_ATRASOS
          end
          item
            Format = ',0;-,0'
            Kind = skSum
            Column = tvExtratoQTD_ENTREGA
          end
          item
            Format = ',0;-,0'
            Kind = skSum
            Column = tvExtratoQTD_VOLUMES
          end
          item
            Format = ',0.0;-,0.0'
            Kind = skSum
            Column = tvExtratoQTD_VOLUMES_EXTRA
          end
          item
            Format = ',0.00;-,0.00'
            Kind = skSum
            Column = tvExtratoVAL_ABASTECIMENTO
          end
          item
            Format = ',0.00;-,0.00'
            Kind = skSum
            Column = tvExtratoVAL_CREDITO
          end
          item
            Format = ',0.00;-,0.00'
            Kind = skSum
            Column = tvExtratoVAL_DEBITO
          end
          item
            Format = ',0.00;-,0.00'
            Kind = skSum
            Column = tvExtratoVAL_PENALIDADE_ATRASOS
          end
          item
            Format = ',0.00;-,0.00'
            Kind = skSum
            Column = tvExtratoVAL_RESTRICAO
          end
          item
            Format = ',0.00;-,0.00'
            Kind = skSum
            Column = tvExtratoVAL_TOTAL_CREDITOS
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
            Column = tvExtratoVAL_VERBA_TOTAL
          end
          item
            Format = ',0.00;-,0.00'
            Kind = skSum
            Column = tvExtratoVAL_VOLUMES_EXTRA
          end>
        DataController.Summary.SummaryGroups = <
          item
            Links = <
              item
                Column = tvExtratoNOM_DISTRIBUIDOR
              end>
            SummaryItems = <
              item
                Format = ',0;-,0'
                Kind = skSum
                Position = spFooter
                Column = tvExtratoQTD_ATRASOS
              end
              item
                Format = ',0;-,0'
                Kind = skSum
                Position = spFooter
                Column = tvExtratoQTD_ENTREGA
              end
              item
                Format = ',0;-,0'
                Kind = skSum
                Position = spFooter
                Column = tvExtratoQTD_VOLUMES
              end
              item
                Format = ',0.0;-,0.0'
                Kind = skSum
                Position = spFooter
                Column = tvExtratoQTD_VOLUMES_EXTRA
              end
              item
                Format = ',0.00;-,0.00'
                Kind = skSum
                Position = spFooter
                Column = tvExtratoVAL_ABASTECIMENTO
              end
              item
                Format = ',0.00;-,0.00'
                Kind = skSum
                Position = spFooter
                Column = tvExtratoVAL_CREDITO
              end
              item
                Format = ',0.00;-,0.00'
                Kind = skSum
                Position = spFooter
                Column = tvExtratoVAL_DEBITO
              end
              item
                Format = ',0.00;-,0.00'
                Kind = skSum
                Position = spFooter
                Column = tvExtratoVAL_PENALIDADE_ATRASOS
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
                Column = tvExtratoVAL_TOTAL_CREDITOS
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
                Column = tvExtratoVAL_VERBA_TOTAL
              end
              item
                Kind = skSum
                Position = spFooter
                Column = tvExtratoVAL_VOLUMES_EXTRA
              end>
          end>
        OptionsBehavior.CopyCaptionsToClipboard = False
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.ColumnHeaderHints = False
        OptionsBehavior.FocusCellOnCycle = True
        OptionsCustomize.ColumnGrouping = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.InvertSelect = False
        OptionsSelection.MultiSelect = True
        OptionsSelection.CellMultiSelect = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.GroupFooterMultiSummaries = True
        OptionsView.GroupFooters = gfAlwaysVisible
        OptionsView.GroupSummaryLayout = gslAlignWithColumns
        OptionsView.Indicator = True
        Bands = <
          item
            Caption = 'Identifica'#231#227'o'
            Width = 694
          end
          item
            Caption = 'Entregas'
          end
          item
            Caption = 'Cr'#233'ditos'
            Width = 281
          end
          item
            Caption = 'D'#233'bitos'
            Width = 354
          end
          item
            Caption = 'Totaliza'#231#227'o'
            Width = 301
          end
          item
            Caption = 'Par'#226'metros'
            Visible = False
            Width = 391
          end>
        object tvExtratoRecId: TcxGridDBBandedColumn
          DataBinding.FieldName = 'RecId'
          Visible = False
          HeaderAlignmentHorz = taCenter
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object tvExtratoCOD_TIPO: TcxGridDBBandedColumn
          DataBinding.FieldName = 'COD_TIPO'
          Visible = False
          HeaderAlignmentHorz = taCenter
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object tvExtratoCOD_DISTRIBUIDOR: TcxGridDBBandedColumn
          DataBinding.FieldName = 'COD_DISTRIBUIDOR'
          Visible = False
          HeaderAlignmentHorz = taCenter
          SortIndex = 1
          SortOrder = soAscending
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
        object tvExtratoNOM_DISTRIBUIDOR: TcxGridDBBandedColumn
          DataBinding.FieldName = 'NOM_DISTRIBUIDOR'
          Visible = False
          GroupIndex = 0
          HeaderAlignmentHorz = taCenter
          Width = 307
          Position.BandIndex = 0
          Position.ColIndex = 3
          Position.RowIndex = 0
        end
        object tvExtratoCOD_CADASTRO: TcxGridDBBandedColumn
          DataBinding.FieldName = 'COD_CADASTRO'
          Visible = False
          HeaderAlignmentHorz = taCenter
          Position.BandIndex = 0
          Position.ColIndex = 4
          Position.RowIndex = 0
        end
        object tvExtratoCOD_ENTREGADOR: TcxGridDBBandedColumn
          DataBinding.FieldName = 'COD_ENTREGADOR'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0'
          HeaderAlignmentHorz = taCenter
          SortIndex = 0
          SortOrder = soAscending
          Width = 60
          Position.BandIndex = 0
          Position.ColIndex = 5
          Position.RowIndex = 0
        end
        object tvExtratoNOM_ENTREGADOR: TcxGridDBBandedColumn
          DataBinding.FieldName = 'NOM_ENTREGADOR'
          HeaderAlignmentHorz = taCenter
          Width = 241
          Position.BandIndex = 0
          Position.ColIndex = 6
          Position.RowIndex = 0
        end
        object tvExtratoVAL_PERCENTUAL_DISTRIBUIDOR: TcxGridDBBandedColumn
          DataBinding.FieldName = 'VAL_PERCENTUAL_DISTRIBUIDOR'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DecimalPlaces = 3
          Properties.DisplayFormat = ',0.0;-,0.0'
          Visible = False
          HeaderAlignmentHorz = taCenter
          Width = 110
          Position.BandIndex = 0
          Position.ColIndex = 7
          Position.RowIndex = 0
        end
        object tvExtratoCOD_CLIENTE: TcxGridDBBandedColumn
          DataBinding.FieldName = 'COD_CLIENTE'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'COD_CLIENTE'
          Properties.ListColumns = <
            item
              FieldName = 'NOM_CLIENTE'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dsClientes
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 174
          Position.BandIndex = 0
          Position.ColIndex = 9
          Position.RowIndex = 0
        end
        object tvExtratoVAL_PERCENTUAL_ENTREGADOR: TcxGridDBBandedColumn
          DataBinding.FieldName = 'VAL_PERCENTUAL_ENTREGADOR'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DecimalPlaces = 3
          Properties.DisplayFormat = ',0.0;-,0.0'
          HeaderAlignmentHorz = taCenter
          Width = 124
          Position.BandIndex = 0
          Position.ColIndex = 8
          Position.RowIndex = 0
        end
        object tvExtratoVAL_VERBA: TcxGridDBBandedColumn
          DataBinding.FieldName = 'VAL_VERBA'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;-,0.00'
          HeaderAlignmentHorz = taCenter
          Width = 77
          Position.BandIndex = 0
          Position.ColIndex = 10
          Position.RowIndex = 0
        end
        object tvExtratoQTD_VOLUMES: TcxGridDBBandedColumn
          DataBinding.FieldName = 'QTD_VOLUMES'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0'
          HeaderAlignmentHorz = taCenter
          Position.BandIndex = 1
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object tvExtratoQTD_VOLUMES_EXTRA: TcxGridDBBandedColumn
          DataBinding.FieldName = 'QTD_VOLUMES_EXTRA'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DecimalPlaces = 1
          Properties.DisplayFormat = ',0.0'
          HeaderAlignmentHorz = taCenter
          Width = 88
          Position.BandIndex = 1
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object tvExtratoQTD_ENTREGA: TcxGridDBBandedColumn
          DataBinding.FieldName = 'QTD_ENTREGA'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0'
          HeaderAlignmentHorz = taCenter
          Position.BandIndex = 1
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
        object tvExtratoQTD_ATRASOS: TcxGridDBBandedColumn
          DataBinding.FieldName = 'QTD_ATRASOS'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0'
          HeaderAlignmentHorz = taCenter
          Position.BandIndex = 1
          Position.ColIndex = 3
          Position.RowIndex = 0
        end
        object tvExtratoVAL_VERBA_TOTAL: TcxGridDBBandedColumn
          DataBinding.FieldName = 'VAL_VERBA_TOTAL'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;-,0.00'
          HeaderAlignmentHorz = taCenter
          Position.BandIndex = 2
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object tvExtratoVAL_VOLUMES_EXTRA: TcxGridDBBandedColumn
          DataBinding.FieldName = 'VAL_VOLUMES_EXTRA'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;-,0.00'
          HeaderAlignmentHorz = taCenter
          Position.BandIndex = 2
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object tvExtratoVAL_CREDITO: TcxGridDBBandedColumn
          DataBinding.FieldName = 'VAL_CREDITO'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;-,0.00'
          HeaderAlignmentHorz = taCenter
          Position.BandIndex = 2
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
        object tvExtratoVAL_RESTRICAO: TcxGridDBBandedColumn
          DataBinding.FieldName = 'VAL_RESTRICAO'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;-,0.00'
          HeaderAlignmentHorz = taCenter
          Position.BandIndex = 3
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object tvExtratoVAL_ABASTECIMENTO: TcxGridDBBandedColumn
          DataBinding.FieldName = 'VAL_ABASTECIMENTO'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;-,0.00'
          HeaderAlignmentHorz = taCenter
          Position.BandIndex = 3
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object tvExtratoVAL_PENALIDADE_ATRASOS: TcxGridDBBandedColumn
          DataBinding.FieldName = 'VAL_PENALIDADE_ATRASOS'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;-,0.00'
          Visible = False
          HeaderAlignmentHorz = taCenter
          Position.BandIndex = 3
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
        object tvExtratoVAL_DEBITO: TcxGridDBBandedColumn
          DataBinding.FieldName = 'VAL_DEBITO'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;-,0.00'
          HeaderAlignmentHorz = taCenter
          Position.BandIndex = 3
          Position.ColIndex = 3
          Position.RowIndex = 0
        end
        object tvExtratoVAL_TOTAL_CREDITOS: TcxGridDBBandedColumn
          DataBinding.FieldName = 'VAL_TOTAL_CREDITOS'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;-,0.00'
          HeaderAlignmentHorz = taCenter
          Position.BandIndex = 4
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object tvExtratoVAL_TOTAL_DEBITOS: TcxGridDBBandedColumn
          DataBinding.FieldName = 'VAL_TOTAL_DEBITOS'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;-,0.00'
          HeaderAlignmentHorz = taCenter
          Position.BandIndex = 4
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object tvExtratoVAL_TOTAL_GERAL: TcxGridDBBandedColumn
          DataBinding.FieldName = 'VAL_TOTAL_GERAL'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;-,0.00'
          HeaderAlignmentHorz = taCenter
          Position.BandIndex = 4
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
        object tvExtratoDAT_INICIO: TcxGridDBBandedColumn
          DataBinding.FieldName = 'DAT_INICIO'
          HeaderAlignmentHorz = taCenter
          Width = 103
          Position.BandIndex = 5
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object tvExtratoDAT_TERMINO: TcxGridDBBandedColumn
          DataBinding.FieldName = 'DAT_TERMINO'
          HeaderAlignmentHorz = taCenter
          Width = 101
          Position.BandIndex = 5
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object tvExtratoDAT_PAGAMENTO: TcxGridDBBandedColumn
          DataBinding.FieldName = 'DAT_PAGAMENTO'
          HeaderAlignmentHorz = taCenter
          Width = 101
          Position.BandIndex = 5
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
        object tvExtratoNUM_EXTRATO: TcxGridDBBandedColumn
          DataBinding.FieldName = 'NUM_EXTRATO'
          HeaderAlignmentHorz = taCenter
          Width = 85
          Position.BandIndex = 5
          Position.ColIndex = 3
          Position.RowIndex = 0
        end
      end
      object lvExtrato: TcxGridLevel
        GridView = tvExtrato
      end
    end
    object cxButton2: TcxButton
      Left = 1165
      Top = 571
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Action = actFechar
      TabOrder = 3
    end
    object cxButton3: TcxButton
      Left = 1084
      Top = 571
      Width = 75
      Height = 25
      Action = actExportar
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
    object dxLayoutControl1Item1: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      CaptionOptions.ImageIndex = 28
      CaptionOptions.Text = 'Op'#231#245'es'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
      Control = dxLayoutControl2
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item3: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignVert = avClient
      CaptionOptions.Text = 'Extrato'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
      Control = grdExtrato
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Item2: TdxLayoutItem
      Parent = dxLayoutControl1Group1
      AlignHorz = ahRight
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      Control = cxButton2
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Item4: TdxLayoutItem
      Parent = dxLayoutControl1Group1
      AlignHorz = ahRight
      CaptionOptions.Text = 'cxButton3'
      CaptionOptions.Visible = False
      Control = cxButton3
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Group1: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutControl1Group_Root
      LayoutDirection = ldHorizontal
      Index = 2
      AutoCreated = True
    end
  end
  object aclExtrato: TActionList
    Images = dm.cxImageList1
    Left = 488
    Top = 8
    object actSelecionarTodosClientes: TAction
      Category = 'Extrato'
      Caption = 'Selecionar Todos'
      Hint = 'Marcar todos os Clientes'
      ImageIndex = 104
      OnExecute = actSelecionarTodosClientesExecute
    end
    object actDesmarcarTodosClientes: TAction
      Category = 'Extrato'
      Caption = 'Desmarcar Todos'
      Hint = 'Desmarcar todos os Clientes'
      ImageIndex = 105
      OnExecute = actDesmarcarTodosClientesExecute
    end
    object actSelecionarTodosDistribuidores: TAction
      Category = 'Extrato'
      Caption = 'Selecionar Todos'
      Hint = 'Selecionar todos os distribuidores/entregadores'
      ImageIndex = 104
      OnExecute = actSelecionarTodosDistribuidoresExecute
    end
    object actDesmarcarTodosDistribuidores: TAction
      Category = 'Extrato'
      Caption = 'Desmarcar todos'
      Hint = 'Desmarcar todos os distribuidores/entregadores'
      ImageIndex = 105
      OnExecute = actDesmarcarTodosDistribuidoresExecute
    end
    object actProcessar: TAction
      Category = 'Extrato'
      Caption = '&Processar'
      Hint = 'Processar extrato'
      ImageIndex = 27
      OnExecute = actProcessarExecute
    end
    object actFechar: TAction
      Category = 'Extrato'
      Caption = 'Fechar'
      Hint = 'Fechar a tela'
      ImageIndex = 103
      OnExecute = actFecharExecute
    end
    object actgPesquisarClientes: TAction
      Category = 'Extrato'
      Caption = 'Pesquisar'
      Hint = 'Pesquisar Clientes'
      ImageIndex = 11
      OnExecute = actgPesquisarClientesExecute
    end
    object actExcluirCliente: TAction
      Category = 'Extrato'
      Caption = 'Excluir'
      Hint = 'Excluir Cliente selecionado'
      ImageIndex = 8
      OnExecute = actExcluirClienteExecute
    end
    object actPesquisarDistribuidores: TAction
      Category = 'Extrato'
      Caption = 'Pesquisa'
      Hint = 'Pesquisa Distribuidores / Entregadores'
      ImageIndex = 11
      OnExecute = actPesquisarDistribuidoresExecute
    end
    object actExcluirDistribuidores: TAction
      Category = 'Extrato'
      Caption = 'Excluir'
      Hint = 'Excluir Distribuidores / Entregadores'
      ImageIndex = 8
      OnExecute = actExcluirDistribuidoresExecute
    end
    object actOpcoesClientes: TAction
      Category = 'Extrato'
      Hint = 'Op'#231#245'es de par'#226'metros de Clientes'
      ImageIndex = 45
    end
    object actOpcoesDistribuidores: TAction
      Category = 'Extrato'
      Hint = 'Op'#231#245'es de par'#226'metros de Distribuidores / Entregadores '
      ImageIndex = 45
    end
    object actExportar: TAction
      Category = 'Extrato'
      Caption = 'Exportar'
      Hint = 'Exportar Extrato'
      ImageIndex = 29
      OnExecute = actExportarExecute
    end
    object actFecharExtrato: TAction
      Category = 'Extrato'
      Caption = 'Fechar Extrato'
      Hint = 'Fechar &Extrato'
      ImageIndex = 20
      OnExecute = actFecharExtratoExecute
    end
    object actSelecionarDistribuidoresFechado: TAction
      Category = 'Extrato'
      Caption = 'Selecionar Todos'
      Hint = 'Seleciona Todos os Distribuidores/Entregadores'
      ImageIndex = 104
      OnExecute = actSelecionarDistribuidoresFechadoExecute
    end
    object actDesmarcarTodosDistribuidoresFechados: TAction
      Category = 'Extrato'
      Caption = 'Desmarcar Todos'
      Hint = 'Desmarcar todos os Distribuidores/Entregadores'
      ImageIndex = 105
      OnExecute = actDesmarcarTodosDistribuidoresFechadosExecute
    end
    object actPesquisaDistribuidoresFechado: TAction
      Category = 'Extrato'
      Caption = 'Pesquisar'
      Hint = 'Pesquisar Distribuidores/Entregadores'
      ImageIndex = 11
      OnExecute = actPesquisaDistribuidoresFechadoExecute
    end
    object actExcluirDistribuicaoFechado: TAction
      Category = 'Extrato'
      Caption = 'Excluir'
      Hint = 'Excluir Itens Selecionados'
      ImageIndex = 8
      OnExecute = actExcluirDistribuicaoFechadoExecute
    end
    object actEmitirExtrato: TAction
      Category = 'Extrato'
      Caption = 'Emitir'
      Hint = 'Emitir Extrato'
      ImageIndex = 0
      OnExecute = actEmitirExtratoExecute
    end
    object actReabrirExtrato: TAction
      Category = 'Extrato'
      Caption = 'Reabrir'
      Hint = 'Reabrir Extrato'
      ImageIndex = 21
    end
  end
  object pupClientes: TPopupMenu
    Images = dm.cxImageList1
    Left = 528
    Top = 8
    object Pesquisar1: TMenuItem
      Action = actgPesquisarClientes
    end
    object SelecionarTodos1: TMenuItem
      Action = actSelecionarTodosClientes
    end
    object DesmarcarTodos1: TMenuItem
      Action = actDesmarcarTodosClientes
    end
    object Excluir1: TMenuItem
      Action = actExcluirCliente
    end
  end
  object pupDistribuidores: TPopupMenu
    Images = dm.cxImageList1
    Left = 592
    Top = 8
    object Pesquisa1: TMenuItem
      Action = actPesquisarDistribuidores
    end
    object SelecionarTodos2: TMenuItem
      Action = actSelecionarTodosDistribuidores
    end
    object Desmarcartodos2: TMenuItem
      Action = actDesmarcarTodosDistribuidores
    end
    object Excluir2: TMenuItem
      Action = actExcluirDistribuidores
    end
  end
  object tbExtrato: TdxMemData
    Indexes = <
      item
        FieldName = 'COD_CADASTRO'
        SortOptions = []
      end
      item
        FieldName = 'COD_ENTREGADOR'
        SortOptions = []
      end>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F240000000400000003000B00434F445F4147454E54
      45005000000014000B004445535F4147454E5445000400000003000F00434F44
      5F454E5452454741444F52004600000014000F004445535F454E545245474144
      4F52000800000015000C005154445F564F4C554D4553000800000015000C0051
      54445F454E5452454741000800000006000A0056414C5F564552424100080000
      000600100056414C5F56455242415F544F54414C000800000006000C0056414C
      5F4352454449544F000800000006000B0056414C5F44454249544F0008000000
      06000E0056414C5F52455354524943414F000800000006000E0056414C5F5355
      425F544F54414C0008000000060012005154445F564F4C554D45535F45585452
      4100080000000600120056414C5F564F4C554D45535F45585452410008000000
      0600120056414C5F41424153544543494D454E544F0008000000060016005641
      4C5F50455243454E5455414C5F4147454E5445000800000006001A0056414C5F
      50455243454E5455414C5F454E5452454741444F52000800000006000A005641
      4C5F544F54414C00080000000600140056414C5F544F54414C5F444553434F4E
      544F5300080000000600130056414C5F544F54414C5F4352454449544F530008
      0000000600100056414C5F544F54414C5F474552414C000400000009000B0044
      41545F494E4943494F000400000009000C004441545F5445524D494E4F000400
      0000090019004441545F494E4943494F5F41424153544543494D454E544F0004
      000000090018004441545F46494E414C5F41424153544543494D454E544F0004
      000000090009004441545F5041474F000100000014000C004E554D5F45585452
      41544F000800000015000C005154445F41545241534F53000800000015000B00
      5154445F325F44494153000800000015000E005154445F4D4149535F44494153
      000400000003000D00434F445F434144415354524F000400000003001700434F
      445F475255504F5F444953545249425549444F5200080000000600170056414C
      5F56455242415F444953545249425549444F52000400000003001500434F445F
      475255504F5F454E5452454741444F5200080000000600150056414C5F564552
      42415F454E5452454741444F52000800000006000F0056414C5F50455243454E
      5455414C00}
    SortOptions = []
    Left = 656
    Top = 8
    object tbExtratoCOD_TIPO: TIntegerField
      DisplayLabel = 'Tipo Extrato'
      FieldName = 'COD_TIPO'
    end
    object tbExtratoCOD_DISTRIBUIDOR: TIntegerField
      DisplayLabel = 'Distribuidor'
      FieldName = 'COD_DISTRIBUIDOR'
    end
    object tbExtratoNOM_DISTRIBUIDOR: TWideStringField
      DisplayLabel = 'Nome Distribuidor'
      FieldName = 'NOM_DISTRIBUIDOR'
      Size = 80
    end
    object tbExtratoCOD_CADASTRO: TIntegerField
      DisplayLabel = 'Cadastro'
      FieldName = 'COD_CADASTRO'
    end
    object tbExtratoCOD_ENTREGADOR: TIntegerField
      DisplayLabel = 'Entregador'
      FieldName = 'COD_ENTREGADOR'
    end
    object tbExtratoNOM_ENTREGADOR: TWideStringField
      DisplayLabel = 'Nome do Entregador'
      FieldName = 'NOM_ENTREGADOR'
      Size = 70
    end
    object tbExtratoVAL_PERCENTUAL_DISTRIBUIDOR: TFloatField
      DisplayLabel = '% SLA Distribuidor'
      FieldName = 'VAL_PERCENTUAL_DISTRIBUIDOR'
    end
    object tbExtratoVAL_PERCENTUAL_ENTREGADOR: TFloatField
      DisplayLabel = '% SLA Entregador'
      FieldName = 'VAL_PERCENTUAL_ENTREGADOR'
    end
    object tbExtratoVAL_VERBA: TFloatField
      DisplayLabel = 'Valor da Verba'
      FieldName = 'VAL_VERBA'
    end
    object tbExtratoQTD_VOLUMES: TLargeintField
      DisplayLabel = 'Volumes'
      FieldName = 'QTD_VOLUMES'
    end
    object tbExtratoQTD_VOLUMES_EXTRA: TFloatField
      DisplayLabel = 'Volumes Extra'
      FieldName = 'QTD_VOLUMES_EXTRA'
    end
    object tbExtratoQTD_ENTREGA: TLargeintField
      DisplayLabel = 'Entregas'
      FieldName = 'QTD_ENTREGA'
    end
    object tbExtratoQTD_ATRASOS: TLargeintField
      DisplayLabel = 'Atrasos'
      FieldName = 'QTD_ATRASOS'
    end
    object tbExtratoVAL_VERBA_TOTAL: TFloatField
      DisplayLabel = 'Total Verba'
      FieldName = 'VAL_VERBA_TOTAL'
    end
    object tbExtratoVAL_VOLUMES_EXTRA: TFloatField
      DisplayLabel = 'Val. Vol. Extras'
      FieldName = 'VAL_VOLUMES_EXTRA'
    end
    object tbExtratoVAL_CREDITO: TFloatField
      DisplayLabel = 'Outros Cr'#233'ditos'
      FieldName = 'VAL_CREDITO'
    end
    object tbExtratoVAL_RESTRICAO: TFloatField
      DisplayLabel = 'Restri'#231#227'o'
      FieldName = 'VAL_RESTRICAO'
    end
    object tbExtratoVAL_ABASTECIMENTO: TFloatField
      DisplayLabel = 'Abastecimento'
      FieldName = 'VAL_ABASTECIMENTO'
    end
    object tbExtratoVAL_PENALIDADE_ATRASOS: TFloatField
      DisplayLabel = 'Pen. Atrasos'
      FieldName = 'VAL_PENALIDADE_ATRASOS'
    end
    object tbExtratoVAL_DEBITO: TFloatField
      DisplayLabel = 'Outros D'#233'bitos'
      FieldName = 'VAL_DEBITO'
    end
    object tbExtratoVAL_TOTAL_CREDITOS: TFloatField
      DisplayLabel = 'Total Cr'#233'ditos'
      FieldName = 'VAL_TOTAL_CREDITOS'
    end
    object tbExtratoVAL_TOTAL_DEBITOS: TFloatField
      DisplayLabel = 'Total D'#233'bitos'
      FieldName = 'VAL_TOTAL_DEBITOS'
    end
    object tbExtratoVAL_TOTAL_GERAL: TFloatField
      DisplayLabel = 'Total Geral'
      FieldName = 'VAL_TOTAL_GERAL'
    end
    object tbExtratoDAT_INICIO: TDateField
      DisplayLabel = 'In'#237'cio Per'#237'odo'
      FieldName = 'DAT_INICIO'
    end
    object tbExtratoDAT_TERMINO: TDateField
      DisplayLabel = 'T'#233'rmino Per'#237'odo'
      FieldName = 'DAT_TERMINO'
    end
    object tbExtratoDAT_PAGAMENTO: TDateField
      DisplayLabel = 'Data Pagamento'
      FieldName = 'DAT_PAGAMENTO'
    end
    object tbExtratoNUM_EXTRATO: TWideStringField
      DisplayLabel = 'N'#186' Extrato'
      DisplayWidth = 15
      FieldName = 'NUM_EXTRATO'
      Size = 15
    end
    object tbExtratoCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'COD_CLIENTE'
    end
  end
  object dsExtrato: TDataSource
    AutoEdit = False
    DataSet = tbExtrato
    Left = 712
    Top = 8
  end
  object SaveDialog: TSaveDialog
    Left = 776
    Top = 8
  end
  object pupDistribuidoresFechado: TPopupMenu
    Images = dm.cxImageList1
    Left = 840
    Top = 8
    object MenuItem1: TMenuItem
      Action = actPesquisaDistribuidoresFechado
    end
    object MenuItem2: TMenuItem
      Action = actSelecionarDistribuidoresFechado
    end
    object MenuItem3: TMenuItem
      Action = actDesmarcarTodosDistribuidoresFechados
    end
    object MenuItem4: TMenuItem
      Action = actExcluirDistribuicaoFechado
    end
  end
  object dsClientes: TDataSource
    AutoEdit = False
    DataSet = tbClientes
    Left = 928
    Top = 8
  end
  object tbClientes: TdxMemData
    Indexes = <
      item
        FieldName = 'COD_CLIENTE'
        SortOptions = []
      end
      item
        FieldName = 'NOM_CLIENTE'
        SortOptions = []
      end>
    SortOptions = []
    Left = 976
    Top = 8
    object tbClientesCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
    end
    object tbClientesNOM_CLIENTE: TStringField
      FieldName = 'NOM_CLIENTE'
      Size = 160
    end
    object tbClientesDOM_OS: TStringField
      FieldName = 'DOM_OS'
      Size = 1
    end
  end
end
