object frmDetalhesRestricoes: TfrmDetalhesRestricoes
  Left = 0
  Top = 0
  Caption = 'Detalhes das Restri'#231#245'es'
  ClientHeight = 527
  ClientWidth = 1086
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
    1086
    527)
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel27: TcxLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alTop
    AutoSize = False
    Caption = 'Detalhes das Restri'#231#245'es (Extravios e Multas)'
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
    Width = 1080
    AnchorY = 22
  end
  object cxGrid1: TcxGrid
    AlignWithMargins = True
    Left = 8
    Top = 47
    Width = 1070
    Height = 417
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.PriorPage.Visible = False
      Navigator.Buttons.NextPage.Visible = False
      Navigator.Buttons.Insert.Visible = False
      Navigator.Buttons.Delete.Visible = False
      Navigator.Buttons.Edit.Visible = False
      Navigator.Buttons.Post.Visible = False
      Navigator.Buttons.Cancel.Visible = False
      Navigator.Buttons.Refresh.Visible = False
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Enabled = False
      Navigator.Buttons.Filter.Visible = False
      Navigator.InfoPanel.DisplayMask = 'Registro [RecordIndex] de [RecordCount]'
      Navigator.InfoPanel.Visible = True
      Navigator.Visible = True
      DataController.DataSource = dsDetalhesRestricoes
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ' ,0.00;- ,0.00'
          Kind = skSum
          Column = cxGrid1DBTableView1VAL_PRODUTO
        end
        item
          Format = ' ,0.00;- ,0.00'
          Kind = skSum
          Column = cxGrid1DBTableView1VAL_MULTA
        end
        item
          Format = ' ,0.00;- ,0.00'
          Kind = skSum
          Column = cxGrid1DBTableView1VAL_VERBA
        end
        item
          Format = ' ,0.00;- ,0.00'
          Kind = skSum
          Column = cxGrid1DBTableView1VAL_TOTAL
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CopyCaptionsToClipboard = False
      OptionsBehavior.CopyPreviewToClipboard = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.InvertSelect = False
      OptionsSelection.MultiSelect = True
      OptionsSelection.CellMultiSelect = True
      OptionsView.NoDataToDisplayInfoText = '<nenhuma informa'#231#227'o disponively>'
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object cxGrid1DBTableView1NUM_NOSSONUMERO: TcxGridDBColumn
        Caption = 'Nosso N'#250'mero'
        DataBinding.FieldName = 'NUM_NOSSONUMERO'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 93
      end
      object cxGrid1DBTableView1DES_EXTRAVIO: TcxGridDBColumn
        Caption = 'Descri'#231#227'o'
        DataBinding.FieldName = 'DES_EXTRAVIO'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 230
      end
      object cxGrid1DBTableView1DAT_EXTRAVIO: TcxGridDBColumn
        Caption = 'Data'
        DataBinding.FieldName = 'DAT_EXTRAVIO'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.ReadOnly = True
        Properties.ShowTime = False
        Width = 78
      end
      object cxGrid1DBTableView1COD_ENTREGADOR: TcxGridDBColumn
        Caption = 'C'#243'digo'
        DataBinding.FieldName = 'COD_ENTREGADOR'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 60
      end
      object cxGrid1DBTableView1NOM_ENTREGADOR: TcxGridDBColumn
        Caption = 'Nome Entregador'
        DataBinding.FieldName = 'NOM_ENTREGADOR'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 175
      end
      object cxGrid1DBTableView1VAL_PRODUTO: TcxGridDBColumn
        Caption = 'Valor do Produto'
        DataBinding.FieldName = 'VAL_PRODUTO'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ' ,0.00;- ,0.00'
        Properties.EditFormat = ' ,0.00;- ,0.00'
        Properties.ReadOnly = True
        Width = 102
      end
      object cxGrid1DBTableView1VAL_MULTA: TcxGridDBColumn
        Caption = 'Multa'
        DataBinding.FieldName = 'VAL_MULTA'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ' ,0.00;- ,0.00'
        Properties.EditFormat = ' ,0.00;- ,0.00'
        Properties.ReadOnly = True
        Width = 102
      end
      object cxGrid1DBTableView1VAL_VERBA: TcxGridDBColumn
        Caption = 'Verba'
        DataBinding.FieldName = 'VAL_VERBA'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ' ,0.00;- ,0.00'
        Properties.EditFormat = ' ,0.00;- ,0.00'
        Properties.ReadOnly = True
        Width = 104
      end
      object cxGrid1DBTableView1VAL_TOTAL: TcxGridDBColumn
        Caption = 'Total'
        DataBinding.FieldName = 'VAL_TOTAL'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ' ,0.00;- ,0.00'
        Properties.EditFormat = ' ,0.00;- ,0.00'
        Properties.ReadOnly = True
        Width = 103
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object cxButton1: TcxButton
    Left = 880
    Top = 470
    Width = 98
    Height = 25
    Action = actDetalhesRestricoesExportar
    Anchors = [akRight, akBottom]
    TabOrder = 2
  end
  object cxButton2: TcxButton
    Left = 984
    Top = 470
    Width = 94
    Height = 25
    Action = actDetalhesRestricoesSair
    Anchors = [akRight, akBottom]
    TabOrder = 3
  end
  object dxStatusBar1: TdxStatusBar
    Left = 0
    Top = 501
    Width = 1086
    Height = 26
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarContainerPanelStyle'
        PanelStyle.Container = dxStatusBar1Container0
      end>
    PaintStyle = stpsUseLookAndFeel
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    object dxStatusBar1Container0: TdxStatusBarContainerControl
      Left = 3
      Top = 4
      Width = 1044
      Height = 19
      object cxProgressBar: TcxProgressBar
        Left = 0
        Top = 0
        Align = alClient
        AutoSize = False
        Properties.BarStyle = cxbsLEDs
        Properties.ShowTextStyle = cxtsText
        TabOrder = 0
        Height = 19
        Width = 1044
      end
    end
  end
  object dsDetalhesRestricoes: TDataSource
    AutoEdit = False
    DataSet = dm.tbExtravios
    Left = 856
    Top = 8
  end
  object aclDetalhesRestricoes: TActionList
    Images = dm.cxImageList1
    Left = 920
    object actDetalhesRestricoesExportar: TAction
      Category = 'Detalhes das Restri'#231#245'es'
      Caption = 'E&xportar'
      Hint = 'Exportar informa'#231#245'es da grade'
      ImageIndex = 29
      OnExecute = actDetalhesRestricoesExportarExecute
    end
    object actDetalhesRestricoesSair: TAction
      Category = 'Detalhes das Restri'#231#245'es'
      Caption = 'Sair'
      Hint = 'Sair da Tela'
      ImageIndex = 10
      OnExecute = actDetalhesRestricoesSairExecute
    end
  end
  object SaveDialog: TSaveDialog
    Left = 792
    Top = 8
  end
end
