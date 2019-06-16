object frmDetalhesLancamentos: TfrmDetalhesLancamentos
  Left = 0
  Top = 0
  Caption = 'Detalhes de Lan'#231'amentos'
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
    Caption = 'Detalhes de Lan'#231'amentos de Cr'#233'ditos e D'#233'bitos'
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
  object cxButton2: TcxButton
    Left = 984
    Top = 470
    Width = 94
    Height = 25
    Action = actDetalhesRestricoesSair
    Anchors = [akRight, akBottom]
    TabOrder = 1
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
  object cxGrid1: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 47
    Width = 1080
    Height = 417
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Images = dm.cxImageList1
    ParentFont = False
    TabOrder = 3
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.OnButtonClick = cxGrid1DBTableView1NavigatorButtonsButtonClick
      Navigator.Buttons.CustomButtons = <
        item
          Hint = '?Exportar dados'
          ImageIndex = 29
        end>
      Navigator.Buttons.Images = dm.iml16x16
      Navigator.Buttons.First.Hint = 'Primeiro registro'
      Navigator.Buttons.First.ImageIndex = 19
      Navigator.Buttons.PriorPage.Visible = False
      Navigator.Buttons.Prior.Hint = 'REgistro anterior'
      Navigator.Buttons.Prior.ImageIndex = 22
      Navigator.Buttons.Next.Hint = 'Pr'#243'ximo registro'
      Navigator.Buttons.Next.ImageIndex = 21
      Navigator.Buttons.NextPage.Visible = False
      Navigator.Buttons.Last.Hint = #218'ltimo registro'
      Navigator.Buttons.Last.ImageIndex = 20
      Navigator.Buttons.Insert.Visible = False
      Navigator.Buttons.Delete.Visible = False
      Navigator.Buttons.Edit.Visible = False
      Navigator.Buttons.Post.Visible = False
      Navigator.Buttons.Cancel.Visible = False
      Navigator.Buttons.Refresh.Visible = False
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.Buttons.Filter.Visible = False
      Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
      Navigator.InfoPanel.Visible = True
      Navigator.Visible = True
      DataController.DataSource = dsDetalhesLancamentos
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ' ,0.00;- ,0.00'
          Kind = skSum
          Column = cxGrid1DBTableView1VAL_LANCAMENTO
        end
        item
          Format = ' ,0.00;- ,0.00'
          Kind = skSum
          Column = cxGrid1DBTableView1VAL_DEBITO
        end>
      DataController.Summary.SummaryGroups = <
        item
          Links = <
            item
              Column = cxGrid1DBTableView1NOM_ENTREGADOR
            end>
          SummaryItems = <
            item
              Format = ' ,0.00;- ,0.00'
              Kind = skSum
              Position = spFooter
              Column = cxGrid1DBTableView1VAL_LANCAMENTO
            end
            item
              Format = ' ,0.00;- ,0.00'
              Kind = skSum
              Position = spFooter
              Column = cxGrid1DBTableView1VAL_DEBITO
            end>
        end>
      FilterRow.InfoText = 'Clique aqui para pesquisar'
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.IncSearch = True
      OptionsBehavior.FocusCellOnCycle = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.NoDataToDisplayInfoText = 'Nenhuma informa'#231#227'o dispon'#237'vel'
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GridLines = glNone
      OptionsView.GroupByBox = False
      OptionsView.GroupFooterMultiSummaries = True
      OptionsView.GroupFooters = gfAlwaysVisible
      OptionsView.GroupSummaryLayout = gslAlignWithColumns
      object cxGrid1DBTableView1COD_LANCAMENTO: TcxGridDBColumn
        Caption = 'Seq.'
        DataBinding.FieldName = 'COD_LANCAMENTO'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Visible = False
        HeaderAlignmentHorz = taCenter
        Width = 33
      end
      object cxGrid1DBTableView1DOM_DESCONTO: TcxGridDBColumn
        DataBinding.FieldName = 'DOM_DESCONTO'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Images = dm.cxImageList1
        Properties.Items = <
          item
            Description = 'Pendente'
            ImageIndex = 50
            Value = 'N'
          end
          item
            Description = 'Descontado'
            ImageIndex = 51
            Value = 'S'
          end>
        Properties.ShowDescriptions = False
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        HeaderImageIndex = 51
        Width = 39
        IsCaptionAssigned = True
      end
      object cxGrid1DBTableViewCOD_ENTREGADOR: TcxGridDBColumn
        Caption = 'C'#243'd. Entregador'
        DataBinding.FieldName = 'COD_ENTREGADOR'
        HeaderAlignmentHorz = taCenter
        Width = 104
      end
      object cxGrid1DBTableView1NOM_ENTREGADOR: TcxGridDBColumn
        DataBinding.FieldName = 'NOM_ENTREGADOR'
        HeaderAlignmentHorz = taCenter
        Width = 256
      end
      object cxGrid1DBTableView1DES_LANCAMENTO: TcxGridDBColumn
        DataBinding.FieldName = 'DES_LANCAMENTO'
        HeaderAlignmentHorz = taCenter
        Width = 313
      end
      object cxGrid1DBTableView1DAT_LANCAMENTO: TcxGridDBColumn
        DataBinding.FieldName = 'DAT_LANCAMENTO'
        HeaderAlignmentHorz = taCenter
        SortIndex = 0
        SortOrder = soAscending
        Width = 79
      end
      object cxGrid1DBTableView1VAL_LANCAMENTO: TcxGridDBColumn
        DataBinding.FieldName = 'VAL_LANCAMENTO'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ' ,0.00;- ,0.00'
        HeaderAlignmentHorz = taCenter
        Width = 83
      end
      object cxGrid1DBTableView1VAL_DEBITO: TcxGridDBColumn
        DataBinding.FieldName = 'VAL_DEBITO'
        HeaderAlignmentHorz = taCenter
      end
      object cxGrid1DBTableView1DAT_DESCONTO: TcxGridDBColumn
        DataBinding.FieldName = 'DAT_DESCONTO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        Width = 94
      end
      object cxGrid1DBTableView1NUM_EXTRATO: TcxGridDBColumn
        Caption = 'Extrato N'#186'.'
        DataBinding.FieldName = 'NUM_EXTRATO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        Width = 103
      end
      object cxGrid1DBTableView1DES_TIPO: TcxGridDBColumn
        DataBinding.FieldName = 'DES_TIPO'
        Visible = False
        HeaderAlignmentHorz = taCenter
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object dsDetalhesLancamentos: TDataSource
    AutoEdit = False
    DataSet = dm.tbLancamentos
    Left = 856
    Top = 8
  end
  object aclDetalhesLancamentos: TActionList
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
