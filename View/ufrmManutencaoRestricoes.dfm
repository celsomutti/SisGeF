object frmManutencaoRestricoes: TfrmManutencaoRestricoes
  Left = 0
  Top = 0
  Caption = 'Manuten'#231#227'o de Restri'#231#245'es'
  ClientHeight = 571
  ClientWidth = 1034
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
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    1034
    571)
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 8
    Top = 72
    Width = 1018
    Height = 433
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
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
      OnCellDblClick = cxGrid1DBTableView1CellDblClick
      DataController.DataSource = dsRestricoes
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ' ,0.00;- ,0.00'
          Kind = skSum
          Column = cxGrid1DBTableView1VAL_RESTRICAO
        end
        item
          Format = ' ,0.00;- ,0.00'
          Kind = skSum
          Column = cxGrid1DBTableView1VAL_PAGO
        end
        item
          Format = ' ,0.00;- ,0.00'
          Kind = skSum
          Column = cxGrid1DBTableView1VAL_DEBITAR
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.AlwaysShowEditor = True
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.FocusCellOnCycle = True
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsSelection.InvertSelect = False
      OptionsSelection.MultiSelect = True
      OptionsSelection.CellMultiSelect = True
      OptionsView.NoDataToDisplayInfoText = '<nenhuma informa'#231#227'o disponivel>'
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object cxGrid1DBTableView1NOM_AGENTE: TcxGridDBColumn
        Caption = 'Adm. CEP'
        DataBinding.FieldName = 'NOM_AGENTE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        SortIndex = 0
        SortOrder = soAscending
        Width = 332
      end
      object cxGrid1DBTableView1NOM_ENTREGADOR: TcxGridDBColumn
        Caption = 'Entregador'
        DataBinding.FieldName = 'NOM_ENTREGADOR'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        SortIndex = 1
        SortOrder = soAscending
        Width = 330
      end
      object cxGrid1DBTableView1VAL_RESTRICAO: TcxGridDBColumn
        Caption = 'Restri'#231#227'o Pendente'
        DataBinding.FieldName = 'VAL_RESTRICAO'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ' ,0.00;- ,0.00'
        Properties.ReadOnly = True
        Width = 124
      end
      object cxGrid1DBTableView1VAL_PAGO: TcxGridDBColumn
        Caption = 'Valor Debitado'
        DataBinding.FieldName = 'VAL_PAGO'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ' ,0.00;- ,0.00'
        Properties.ReadOnly = True
        Width = 125
      end
      object cxGrid1DBTableView1VAL_DEBITAR: TcxGridDBColumn
        Caption = 'Valor a Debitar'
        DataBinding.FieldName = 'VAL_DEBITAR'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.ButtonGlyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E00000000000000000000808040808040
          8080408080408080408080408080408080408080408080408080408080408080
          4080804080804080804080804080804091919189888887868687878788888789
          8988898888888888888887878686878685979797808040808040808040808040
          888888C2C2C1BCBCBCBCBCBCBCBCBBBCBCBBBCBCBBBCBCBBBCBCBBBCBCBBC2C2
          C18B8B8A8080408080408080408080408C8C8BFFFFFFEBEBEBEBEBEBE9E9E9E8
          E8E8E7E7E7E7E7E7E6E6E6E6E6E6FFFFFF8E8D8C808040808040808040808040
          929191FFFFFFB4B4B4949494E7E7E7B2B2B2939393E3E3E3B0B0B0919191FBFB
          FB929291808040808040808040808040959595FFFFFFE8E8E8E7E7E7E5E5E5E3
          E3E3E2E2E2E0E0E0DFDFDFDCDCDCFFFFFF959595808040808040808040808040
          9A9A99FFFFFFB1B1B1919191E2E2E2ADADAD8F8F8FDCDCDCA9A9A98D8D8DFBFB
          FB9A99998080408080408080408080409E9D9DFFFFFFE3E3E3E1E1E1DCDCDCDB
          DBDBD7D7D7D3D3D3D3D3D3D1D1D1FFFFFF9E9D9C808040808040808040808040
          A0A0A0FFFFFFADADAD8E8E8ED8D8D8A5A5A58A8A8ACECECE7374E85258DBFBFB
          FB9E9E9E808040808040808040808040A3A3A3FCFCFCDADADAD7D7D7D2D2D2CE
          CECEC9C9C9C5C5C5C2C2C2BFBFBFFFFFFFA0A0A0808040808040808040808040
          A3A3A3FFFFFFB07B56C38D67C58F68C69069C8926BCA946CCA956EB07B56FFFF
          FFA1A09F808040808040808040808040A4A4A4FFFFFFB07B56C18B64C38D66C5
          8F67C69069C8926BCA946CB07B56FFFFFFA0A0A0808040808040808040808040
          A3A3A3FFFFFFA7724DA7724DA7724DA7724DA7724DA7724DA7724DA7724DFFFF
          FF9E9E9E808040808040808040808040AAAAAAFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA3A3A3808040808040808040808040
          B3B3B3A9A9A9A8A8A8ABABABACACACADADADACACACABABABA8A8A8A4A4A4A3A3
          A3B5B5B580804080804080804080804080804080804080804080804080804080
          8040808040808040808040808040808040808040808040808040}
        Properties.DisplayFormat = ' ,0.00;- ,0.00'
        Properties.OnValidate = cxGrid1DBTableView1VAL_DEBITARPropertiesValidate
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      Caption = 'Restri'#231#245'es'
      GridView = cxGrid1DBTableView1
    end
  end
  object cxLabel27: TcxLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alTop
    AutoSize = False
    Caption = 'Manuten'#231#227'o das Restri'#231#245'es'
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
    Width = 1028
    AnchorY = 22
  end
  object dxStatusBar1: TdxStatusBar
    Left = 0
    Top = 545
    Width = 1034
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
      Width = 992
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
        Width = 992
      end
    end
  end
  object cxAgenteAtivo: TcxCheckBox
    Left = 8
    Top = 47
    Hint = 'Lista Somente Administradores de CEP Ativos'
    Caption = 'Somente Adm. CEP Ativos'
    Properties.NullStyle = nssUnchecked
    Properties.OnChange = cxAgenteAtivoPropertiesChange
    State = cbsChecked
    TabOrder = 3
    Transparent = True
    Width = 156
  end
  object cxButton1: TcxButton
    Left = 928
    Top = 511
    Width = 98
    Height = 25
    Cursor = crHandPoint
    Action = actManutencaoRestricoesSair
    Anchors = [akRight, akBottom]
    TabOrder = 7
  end
  object cxButton2: TcxButton
    Left = 616
    Top = 511
    Width = 98
    Height = 25
    Cursor = crHandPoint
    Action = actManutencaoRestricoesExtravios
    Anchors = [akRight, akBottom]
    TabOrder = 4
  end
  object cxButton3: TcxButton
    Left = 720
    Top = 511
    Width = 98
    Height = 25
    Cursor = crHandPoint
    Action = actManutencaoRestricoesDebitos
    Anchors = [akRight, akBottom]
    TabOrder = 5
  end
  object cxButton4: TcxButton
    Left = 824
    Top = 511
    Width = 98
    Height = 25
    Cursor = crHandPoint
    Action = actManutencaoRestricoesExportar
    Anchors = [akRight, akBottom]
    TabOrder = 6
  end
  object dsRestricoes: TDataSource
    DataSet = dm.tbRestricoes
    Left = 896
  end
  object aclManutencaoRestricoes: TActionList
    Images = dm.cxImageList1
    Left = 840
    object actManutencaoRestricoesSair: TAction
      Category = 'Manuten'#231#227'o de Restri'#231#245'es'
      Caption = '&Sair'
      Hint = 'Sair da Tela'
      ImageIndex = 10
      OnExecute = actManutencaoRestricoesSairExecute
    end
    object actManutencaoRestricoesExtravios: TAction
      Category = 'Manuten'#231#227'o de Restri'#231#245'es'
      Caption = '&Restri'#231#227'o'
      Hint = 'Detalhar Restri'#231#245'es'
      ImageIndex = 32
      OnExecute = actManutencaoRestricoesExtraviosExecute
    end
    object actManutencaoRestricoesDebitos: TAction
      Category = 'Manuten'#231#227'o de Restri'#231#245'es'
      Caption = '&D'#233'bitos'
      Hint = 'Detalhar D'#233'bitos'
      ImageIndex = 36
      OnExecute = actManutencaoRestricoesDebitosExecute
    end
    object actManutencaoRestricoesExportar: TAction
      Category = 'Manuten'#231#227'o de Restri'#231#245'es'
      Caption = 'E&xportar'
      Hint = 'Exportar od dados da grade'
      ImageIndex = 29
      OnExecute = actManutencaoRestricoesExportarExecute
    end
  end
  object SaveDialog: TSaveDialog
    Left = 784
  end
end
