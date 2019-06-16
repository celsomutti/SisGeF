object frmSegundaViaProtocolo: TfrmSegundaViaProtocolo
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Impress'#227'o de 2'#170'. via de Protocolo'
  ClientHeight = 222
  ClientWidth = 442
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
  DesignSize = (
    442
    222)
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 436
    Height = 182
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsListaProtocolos
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsSelection.InvertSelect = False
      OptionsSelection.MultiSelect = True
      OptionsSelection.CellMultiSelect = True
      OptionsView.NoDataToDisplayInfoText = '<Nenhuma Informa'#231#227'o Dispon'#237'vel>'
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object cxGrid1DBTableView1DAT_DEVOLUCAO: TcxGridDBColumn
        Caption = 'Data'
        DataBinding.FieldName = 'DAT_DEVOLUCAO'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.OnValidate = cxGrid1DBTableView1DAT_DEVOLUCAOPropertiesValidate
      end
      object cxGrid1DBTableView1NUM_LACRE: TcxGridDBColumn
        Caption = 'N'#186'. Lacre'
        DataBinding.FieldName = 'NUM_LACRE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.OnValidate = cxGrid1DBTableView1NUM_LACREPropertiesValidate
        Width = 86
      end
      object cxGrid1DBTableView1NUM_PROTOCOLO: TcxGridDBColumn
        Caption = 'N'#186'. Protocolo'
        DataBinding.FieldName = 'NUM_PROTOCOLO'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.OnValidate = cxGrid1DBTableView1NUM_PROTOCOLOPropertiesValidate
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object cxButton1: TcxButton
    Left = 3
    Top = 191
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Action = actLocalizar
    Anchors = [akLeft, akBottom]
    TabOrder = 1
  end
  object cxButton2: TcxButton
    Left = 84
    Top = 191
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Action = actSelecionar
    Anchors = [akLeft, akBottom]
    TabOrder = 2
  end
  object cxButton3: TcxButton
    Left = 364
    Top = 191
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Action = actSair
    Anchors = [akRight, akBottom]
    TabOrder = 3
  end
  object tbListaProtocolos: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 392
    Top = 8
    object tbListaProtocolosDAT_DEVOLUCAO: TDateField
      FieldName = 'DAT_DEVOLUCAO'
    end
    object tbListaProtocolosNUM_LACRE: TStringField
      FieldName = 'NUM_LACRE'
      Size = 9
    end
    object tbListaProtocolosNUM_PROTOCOLO: TStringField
      FieldName = 'NUM_PROTOCOLO'
      Size = 15
    end
  end
  object dsListaProtocolos: TDataSource
    AutoEdit = False
    DataSet = tbListaProtocolos
    OnStateChange = dsListaProtocolosStateChange
    Left = 392
    Top = 56
  end
  object aclSegundaViaProtocolo: TActionList
    Images = dm.cxImageList1
    Left = 392
    Top = 104
    object actLocalizar: TAction
      Category = 'Segunda Via de Protocolo'
      Caption = 'Localizar'
      Hint = 'Localizar Protocolos'
      ImageIndex = 18
      OnExecute = actLocalizarExecute
    end
    object actSelecionar: TAction
      Category = 'Segunda Via de Protocolo'
      Caption = 'Selecionar'
      Hint = 'Selecionar Protocolo'
      ImageIndex = 0
      OnExecute = actSelecionarExecute
    end
    object actSair: TAction
      Category = 'Segunda Via de Protocolo'
      Caption = 'Sair'
      Hint = 'Sair da Tela'
      ImageIndex = 10
      OnExecute = actSairExecute
    end
  end
end
