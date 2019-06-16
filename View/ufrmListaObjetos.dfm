object frmListaObjetos: TfrmListaObjetos
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Lista de Objetos'
  ClientHeight = 363
  ClientWidth = 776
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
  PixelsPerInch = 96
  TextHeight = 13
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 776
    Height = 363
    Align = alClient
    TabOrder = 0
    LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
    object cxGrid1: TcxGrid
      Left = 10
      Top = 33
      Width = 751
      Height = 288
      TabOrder = 1
      object cxGrid1DBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = ds
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = 'Total de Objetos'
            Kind = skCount
            Column = cxGrid1DBTableView1NUM_NOSSONUMERO
          end
          item
            Format = ',0; -,0'
            Kind = skCount
            Column = cxGrid1DBTableView1NUM_CEP
          end
          item
            Format = ',0'
            Kind = skSum
            Column = cxGrid1DBTableView1QTD_DIAS_ATRASO
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsSelection.InvertSelect = False
        OptionsSelection.MultiSelect = True
        OptionsSelection.CellMultiSelect = True
        OptionsView.NoDataToDisplayInfoText = '<Nenhuma informa'#231#227'o dispon'#237'vel>'
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        object cxGrid1DBTableView1NUM_NOSSONUMERO: TcxGridDBColumn
          Caption = 'Nosso N'#250'mero'
          DataBinding.FieldName = 'NUM_NOSSONUMERO'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 137
        end
        object cxGrid1DBTableView1NUM_CEP: TcxGridDBColumn
          Caption = 'CEP'
          DataBinding.FieldName = 'NUM_CEP'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          Width = 66
        end
        object cxGrid1DBTableView1QTD_DIAS_ATRASO: TcxGridDBColumn
          Caption = 'Atraso'
          DataBinding.FieldName = 'QTD_DIAS_ATRASO'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 76
        end
        object cxGrid1DBTableView1DAT_PREV_DISTRIBUICAO: TcxGridDBColumn
          Caption = 'Previs'#227'o Entrega'
          DataBinding.FieldName = 'DAT_PREV_DISTRIBUICAO'
          HeaderAlignmentHorz = taCenter
          Width = 109
        end
        object cxGrid1DBTableView1DAT_ATRIBUICAO: TcxGridDBColumn
          Caption = #218'ltima Atribui'#231#227'o'
          DataBinding.FieldName = 'DAT_ATRIBUICAO'
          HeaderAlignmentHorz = taCenter
          Width = 134
        end
        object cxGrid1DBTableView1DAT_BAIXA: TcxGridDBColumn
          Caption = 'Data Baixa'
          DataBinding.FieldName = 'DAT_BAIXA'
          HeaderAlignmentHorz = taCenter
          Width = 106
        end
        object cxGrid1DBTableView1DAT_ENTREGA: TcxGridDBColumn
          Caption = 'Data Entrega'
          DataBinding.FieldName = 'DAT_ENTREGA'
          HeaderAlignmentHorz = taCenter
          Width = 121
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
    object cxButton1: TcxButton
      Left = 10
      Top = 327
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Action = actExportar
      TabOrder = 2
    end
    object cxButton2: TcxButton
      Left = 686
      Top = 327
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Action = actSair
      TabOrder = 3
    end
    object cxLabel1: TcxLabel
      Left = 10
      Top = 10
      Caption = 'cxLabel1'
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
      AlignHorz = ahLeft
      AlignVert = avTop
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object dxLayoutControl1Item1: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      CaptionOptions.Text = 'cxGrid1'
      CaptionOptions.Visible = False
      Control = cxGrid1
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Item2: TdxLayoutItem
      Parent = dxLayoutControl1Group1
      AlignHorz = ahLeft
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = cxButton1
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item3: TdxLayoutItem
      Parent = dxLayoutControl1Group1
      AlignHorz = ahRight
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      Control = cxButton2
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Group1: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutControl1Group_Root
      LayoutDirection = ldHorizontal
      Index = 2
      AutoCreated = True
    end
    object dxLayoutControl1Item4: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      CaptionOptions.Text = 'cxLabel1'
      CaptionOptions.Visible = False
      Control = cxLabel1
      ControlOptions.ShowBorder = False
      Index = 0
    end
  end
  object aclLista: TActionList
    Images = dm.cxImageList1
    Left = 176
    Top = 224
    object actExportar: TAction
      Category = 'Lista de Objetos'
      Caption = '&Exportar'
      Hint = 'Exportar informa'#231#245'es da grade'
      ImageIndex = 29
      OnExecute = actExportarExecute
    end
    object actSair: TAction
      Category = 'Lista de Objetos'
      Caption = 'Sair'
      Hint = 'Sair da Tela'
      ImageIndex = 10
      OnExecute = actSairExecute
    end
  end
  object ds: TDataSource
    AutoEdit = False
    DataSet = dm.qryGrid
    Left = 104
    Top = 224
  end
  object SaveDialog: TSaveDialog
    Left = 248
    Top = 224
  end
end
