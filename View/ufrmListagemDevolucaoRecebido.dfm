object frmListagemDevolucaoRecebida: TfrmListagemDevolucaoRecebida
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Listagem de Containers de Devolu'#231#227'o Recebidos'
  ClientHeight = 272
  ClientWidth = 490
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel1: TcxLabel
    Left = 8
    Top = 8
    Caption = 'Per'#237'odo de '
  end
  object datInicio: TcxDateEdit
    Left = 72
    Top = 8
    Hint = 'Data do in'#237'cio'
    Properties.SaveTime = False
    Properties.ShowTime = False
    TabOrder = 1
    Width = 89
  end
  object cxLabel2: TcxLabel
    Left = 164
    Top = 8
    Caption = ' '#224' '
  end
  object datFinal: TcxDateEdit
    Left = 186
    Top = 8
    Hint = 'Final do per'#237'odo'
    TabOrder = 3
    Width = 89
  end
  object cxButton1: TcxButton
    Left = 407
    Top = 8
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Hint = 'Pesquisar'
    Caption = 'Pesquisar'
    TabOrder = 4
    OnClick = cxButton1Click
  end
  object grdContainers: TcxGrid
    Left = 8
    Top = 35
    Width = 474
    Height = 200
    TabOrder = 5
    object tvContainers: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsContainers
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CopyCaptionsToClipboard = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.MultiSelect = True
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object tvContainersRecId: TcxGridDBColumn
        DataBinding.FieldName = 'RecId'
        Visible = False
      end
      object tvContainersNUM_LACRE: TcxGridDBColumn
        Caption = 'Lacre N'#186'. '
        DataBinding.FieldName = 'NUM_LACRE'
        HeaderAlignmentHorz = taCenter
        SortIndex = 0
        SortOrder = soAscending
        Width = 111
      end
      object tvContainersDAT_RECEPCAO: TcxGridDBColumn
        Caption = 'Data da Recep'#231#227'o'
        DataBinding.FieldName = 'DAT_RECEPCAO'
        HeaderAlignmentHorz = taCenter
        SortIndex = 1
        SortOrder = soAscending
        Width = 116
      end
      object tvContainersNOM_RECEBEDOR: TcxGridDBColumn
        Caption = 'Recebedor'
        DataBinding.FieldName = 'NOM_RECEBEDOR'
        HeaderAlignmentHorz = taCenter
        Width = 245
      end
    end
    object lvContainers: TcxGridLevel
      GridView = tvContainers
    end
  end
  object cxButton2: TcxButton
    Left = 407
    Top = 239
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Caption = 'Sair'
    TabOrder = 6
    OnClick = cxButton2Click
  end
  object tbContainers: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 296
    Top = 8
    object tbContainersNUM_LACRE: TStringField
      FieldName = 'NUM_LACRE'
      Size = 9
    end
    object tbContainersDAT_RECEPCAO: TDateTimeField
      FieldName = 'DAT_RECEPCAO'
    end
    object tbContainersNOM_RECEBEDOR: TStringField
      FieldName = 'NOM_RECEBEDOR'
      Size = 70
    end
  end
  object dsContainers: TDataSource
    AutoEdit = False
    DataSet = tbContainers
    Left = 336
    Top = 8
  end
end
