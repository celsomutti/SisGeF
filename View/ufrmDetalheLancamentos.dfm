object frmDetalheLancamentos: TfrmDetalheLancamentos
  Left = 496
  Top = 222
  BorderStyle = bsToolWindow
  Caption = 'Detalhes Lan'#231'amentos'
  ClientHeight = 171
  ClientWidth = 494
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alClient
    Caption = 'Detalhes'
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -12
    Style.Font.Name = 'Berlin Sans FB'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 0
    Height = 171
    Width = 494
    object cxGrid1: TcxGrid
      Left = 2
      Top = 18
      Width = 490
      Height = 122
      Align = alTop
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -12
      Font.Name = 'Berlin Sans FB'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitLeft = 3
      ExplicitTop = 15
      ExplicitWidth = 488
      object cxGrid1DBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = ds
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0.00;-,0.00'
            Kind = skSum
            Column = cxGrid1DBTableView1VAL_LANCAMENTO
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.NoDataToDisplayInfoText = '<Nenhum Lan'#231'amento Encontrado>'
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        object cxGrid1DBTableView1DAT_LANCAMENTO: TcxGridDBColumn
          Caption = 'Data'
          DataBinding.FieldName = 'DAT_LANCAMENTO'
          Width = 71
        end
        object cxGrid1DBTableView1DES_LANCAMENTO: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'DES_LANCAMENTO'
          Width = 322
        end
        object cxGrid1DBTableView1VAL_LANCAMENTO: TcxGridDBColumn
          Caption = 'Valor'
          DataBinding.FieldName = 'VAL_LANCAMENTO'
          Width = 79
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
    object cxButton1: TcxButton
      Left = 336
      Top = 142
      Width = 75
      Height = 17
      Action = actDelhateLancamentoEditar
      TabOrder = 1
    end
    object cxButton2: TcxButton
      Left = 416
      Top = 142
      Width = 75
      Height = 17
      Action = actDetalheLancamentosSair
      Cancel = True
      TabOrder = 2
    end
  end
  object tbLancamentos: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 456
    object tbLancamentosCOD_LANCAMENTO: TIntegerField
      FieldName = 'COD_LANCAMENTO'
    end
    object tbLancamentosDES_LANCAMENTO: TStringField
      FieldName = 'DES_LANCAMENTO'
      Size = 100
    end
    object tbLancamentosDAT_LANCAMENTO: TDateField
      FieldName = 'DAT_LANCAMENTO'
    end
    object tbLancamentosCOD_ENTREGADOR: TIntegerField
      FieldName = 'COD_ENTREGADOR'
    end
    object tbLancamentosDES_TIPO: TStringField
      FieldName = 'DES_TIPO'
      Size = 10
    end
    object tbLancamentosVAL_LANCAMENTO: TCurrencyField
      FieldName = 'VAL_LANCAMENTO'
    end
    object tbLancamentosDOM_DESCONTO: TStringField
      FieldName = 'DOM_DESCONTO'
      Size = 1
    end
    object tbLancamentosDAT_DESCONTO: TDateField
      FieldName = 'DAT_DESCONTO'
    end
    object tbLancamentosNUM_EXTRATO: TIntegerField
      FieldName = 'NUM_EXTRATO'
    end
  end
  object ds: TDataSource
    AutoEdit = False
    DataSet = tbLancamentos
    Left = 424
  end
  object aclDetalheLancamento: TActionList
    Left = 384
    object actDelhateLancamentoEditar: TAction
      Category = 'Detalhes Lan'#231'amentos'
      Caption = '&Editar'
      Hint = 'Editar Dados de Lan'#231'amento'
      OnExecute = actDelhateLancamentoEditarExecute
    end
    object actDetalheLancamentosSair: TAction
      Category = 'Detalhes Lan'#231'amentos'
      Caption = 'Sair'
      Hint = 'Sair da tela de Detalhes de Lan'#231'amentos'
    end
  end
end
