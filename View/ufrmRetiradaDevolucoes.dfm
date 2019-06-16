object frmRetiradaDevolucoes: TfrmRetiradaDevolucoes
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Retirada de Devolu'#231#245'es'
  ClientHeight = 421
  ClientWidth = 599
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  DesignSize = (
    599
    421)
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alTop
    Caption = 'Container'
    TabOrder = 0
    Height = 70
    Width = 593
    object cxLabel2: TcxLabel
      Left = 138
      Top = 15
      Caption = 'N'#186'. Lacre'
      Transparent = True
    end
    object cxLacre: TcxMaskEdit
      Left = 138
      Top = 31
      Hint = 'N'#250'mero do Lacre'
      Properties.Alignment.Horz = taRightJustify
      Properties.IgnoreMaskBlank = True
      Properties.MaskKind = emkRegExpr
      Properties.ReadOnly = True
      TabOrder = 2
      OnExit = cxLacreExit
      Width = 153
    end
    object cxButton1: TcxButton
      Left = 3
      Top = 32
      Width = 110
      Height = 20
      Cursor = crHandPoint
      Action = actRetiradaIniciar
      TabOrder = 0
    end
  end
  object cxGroupBox2: TcxGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 79
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    PanelStyle.Active = True
    TabOrder = 1
    DesignSize = (
      593
      306)
    Height = 306
    Width = 593
    object cxButton3: TcxButton
      Left = 478
      Top = 271
      Width = 110
      Height = 20
      Cursor = crHandPoint
      Action = actRetiradaConcluir
      Anchors = [akRight, akBottom]
      TabOrder = 0
    end
    object cxGrid1: TcxGrid
      Left = 3
      Top = 3
      Width = 355
      Height = 294
      Anchors = [akLeft, akTop, akBottom]
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
        Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
        Navigator.InfoPanel.Visible = True
        Navigator.Visible = True
        DataController.DataSource = ds
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnHidingOnGrouping = False
        OptionsCustomize.ColumnMoving = False
        OptionsCustomize.ColumnSorting = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.NoDataToDisplayInfoText = 'Nenhuma informa'#231#227'o dispon'#237'vel'
        OptionsView.GroupByBox = False
        object cxGrid1DBTableView1RecId: TcxGridDBColumn
          Caption = '#'
          DataBinding.FieldName = 'RecId'
          HeaderAlignmentHorz = taCenter
          SortIndex = 0
          SortOrder = soAscending
          Width = 49
        end
        object cxGrid1DBTableView1NUM_LACRE: TcxGridDBColumn
          Caption = 'Lacre N'#186'.'
          DataBinding.FieldName = 'NUM_LACRE'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          HeaderAlignmentHorz = taCenter
          Width = 119
        end
        object cxGrid1DBTableView1QTDE_VOLUMES: TcxGridDBColumn
          Caption = 'Objetos'
          DataBinding.FieldName = 'QTDE_VOLUMES'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taRightJustify
          HeaderAlignmentHorz = taCenter
          Width = 67
        end
        object cxGrid1DBTableView1DAT_EXPEDICAO: TcxGridDBColumn
          Caption = 'Expedi'#231#227'o'
          DataBinding.FieldName = 'DAT_EXPEDICAO'
          HeaderAlignmentHorz = taCenter
          Width = 94
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
    object cxLabel3: TcxLabel
      Left = 364
      Top = 16
      Caption = 'Containers Pendentes:'
      Transparent = True
    end
    object cxObjetos: TcxTextEdit
      Left = 478
      Top = 15
      TabStop = False
      Properties.Alignment.Horz = taRightJustify
      Properties.ReadOnly = True
      TabOrder = 3
      Text = '0'
      Width = 71
    end
  end
  object cxButton2: TcxButton
    Left = 481
    Top = 393
    Width = 110
    Height = 20
    Cursor = crHandPoint
    Action = actRetiradaSair
    Anchors = [akRight, akBottom]
    TabOrder = 2
  end
  object aclRetirada: TActionList
    Left = 424
    Top = 24
    object actRetiradaIniciar: TAction
      Tag = 3
      Caption = 'Iniciar Retirada'
      ImageIndex = 27
      OnExecute = actRetiradaIniciarExecute
    end
    object actRetiradaConcluir: TAction
      Tag = 3
      Caption = 'Concluir Retirada'
      Enabled = False
      Hint = 'Concluir a Retirada de Devolu'#231#245'es'
      ImageIndex = 51
      OnExecute = actRetiradaConcluirExecute
    end
    object actRetiradaSair: TAction
      Tag = 99
      Caption = 'Sair'
      Hint = 'Sair da Tela'
      ImageIndex = 10
      OnExecute = actRetiradaSairExecute
    end
  end
  object tbRetirada: TdxMemData
    Indexes = <
      item
        FieldName = 'NUM_LACRE'
        SortOptions = []
      end>
    SortOptions = []
    Left = 464
    Top = 24
    object tbRetiradaNUM_LACRE: TStringField
      FieldName = 'NUM_LACRE'
      Size = 9
    end
    object tbRetiradaQTDE_VOLUMES: TIntegerField
      FieldName = 'QTDE_VOLUMES'
    end
    object tbRetiradaDAT_EXPEDICAO: TDateField
      FieldName = 'DAT_EXPEDICAO'
    end
  end
  object ds: TDataSource
    DataSet = tbRetirada
    Left = 504
    Top = 24
  end
end
