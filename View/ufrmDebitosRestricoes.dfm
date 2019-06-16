object frmDebitosRestricoes: TfrmDebitosRestricoes
  Left = 0
  Top = 0
  Caption = 'D'#233'bitos das Restri'#231#245'es'
  ClientHeight = 384
  ClientWidth = 662
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    662
    384)
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel27: TcxLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alTop
    AutoSize = False
    Caption = 'D'#233'bitos de Restri'#231#245'es'
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
    Width = 656
    AnchorY = 22
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 47
    Width = 646
    Height = 274
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
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.Buttons.Filter.Visible = False
      Navigator.InfoPanel.DisplayMask = 'Registro [RecordIndex] de [RecordCount]'
      Navigator.InfoPanel.Visible = True
      Navigator.Visible = True
      DataController.DataSource = dsDebitosRestricoes
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ' ,0.00;- ,0.00'
          Kind = skSum
          Column = cxGrid1DBTableView1VAL_RESTRICAO
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CopyCaptionsToClipboard = False
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.CopyPreviewToClipboard = False
      OptionsBehavior.FocusCellOnCycle = True
      OptionsCustomize.ColumnGrouping = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.InvertSelect = False
      OptionsSelection.MultiSelect = True
      OptionsSelection.CellMultiSelect = True
      OptionsView.NoDataToDisplayInfoText = '<nenhuma informa'#231#227'o disponivel>'
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object cxGrid1DBTableView1VAL_RESTRICAO: TcxGridDBColumn
        Caption = 'Valor Debitado'
        DataBinding.FieldName = 'VAL_RESTRICAO'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.EditFormat = ' ,0.00;- ,0.00'
        Properties.ReadOnly = True
      end
      object cxGrid1DBTableView1DAT_INICIO: TcxGridDBColumn
        Caption = 'In'#237'cio do Per'#237'odo'
        DataBinding.FieldName = 'DAT_INICIO'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.ReadOnly = True
        Properties.ShowTime = False
      end
      object cxGrid1DBTableView1DAT_TERMINO: TcxGridDBColumn
        Caption = 'T'#233'rmino do Per'#237'odo'
        DataBinding.FieldName = 'DAT_TERMINO'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.ReadOnly = True
        Properties.ShowTime = False
      end
      object cxGrid1DBTableView1DAT_PAGO: TcxGridDBColumn
        Caption = 'Data do Pagamento'
        DataBinding.FieldName = 'DAT_PAGO'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.ReadOnly = True
        Properties.ShowTime = False
        SortIndex = 0
        SortOrder = soAscending
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object dxStatusBar1: TdxStatusBar
    Left = 0
    Top = 358
    Width = 662
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
      Width = 620
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
        Width = 620
      end
    end
  end
  object cxButton1: TcxButton
    Left = 465
    Top = 327
    Width = 89
    Height = 25
    Cursor = crHandPoint
    Action = actDebitosRestricoesExportar
    Anchors = [akRight, akBottom]
    TabOrder = 3
  end
  object cxButton2: TcxButton
    Left = 560
    Top = 327
    Width = 94
    Height = 25
    Cursor = crHandPoint
    Action = actDebitosRestricoesSair
    Anchors = [akRight, akBottom]
    TabOrder = 4
  end
  object dsDebitosRestricoes: TDataSource
    AutoEdit = False
    DataSet = dm.tbExtrato
    Left = 480
    Top = 8
  end
  object aclDebitosRestricoes: TActionList
    Images = dm.cxImageList1
    Left = 536
    Top = 8
    object actDebitosRestricoesExportar: TAction
      Category = 'D'#233'bitos das Restri'#231#245'es'
      Caption = 'E&xportar'
      Hint = 'Exportar os dados da grade'
      ImageIndex = 29
      OnExecute = actDebitosRestricoesExportarExecute
    end
    object actDebitosRestricoesSair: TAction
      Category = 'D'#233'bitos das Restri'#231#245'es'
      Caption = '&Sair'
      Hint = 'Sair da Tela'
      ImageIndex = 10
      OnExecute = actDebitosRestricoesSairExecute
    end
  end
  object SaveDialog: TSaveDialog
    Left = 600
    Top = 8
  end
end
