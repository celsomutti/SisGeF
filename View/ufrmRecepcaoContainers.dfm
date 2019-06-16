object frmRecepcaoContainers: TfrmRecepcaoContainers
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Retirada de Devolu'#231#245'es'
  ClientHeight = 413
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
    413)
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
      Left = 119
      Top = 15
      Caption = 'N'#186'. Lacre'
      Transparent = True
    end
    object cxLacre: TcxMaskEdit
      Left = 119
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
      Action = actRecepcaoIniciar
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
      298)
    Height = 298
    Width = 593
    object cxButton3: TcxButton
      Left = 478
      Top = 263
      Width = 110
      Height = 20
      Cursor = crHandPoint
      Action = actRecepcaoConcluir
      Anchors = [akRight, akBottom]
      TabOrder = 0
    end
    object cxGrid1: TcxGrid
      Left = 3
      Top = 3
      Width = 310
      Height = 286
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
        OptionsCustomize.ColumnHorzSizing = False
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
          Caption = 'Expedi'#231#227'o'
          DataBinding.FieldName = 'DAT_EXPEDICAO'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taRightJustify
          HeaderAlignmentHorz = taCenter
          Width = 107
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
    object cxButton4: TcxButton
      Left = 478
      Top = 237
      Width = 110
      Height = 20
      Cursor = crHandPoint
      Action = actListagem
      Anchors = [akRight, akBottom]
      TabOrder = 2
    end
  end
  object cxButton2: TcxButton
    Left = 481
    Top = 385
    Width = 110
    Height = 20
    Cursor = crHandPoint
    Action = actRecepcaoSair
    Anchors = [akRight, akBottom]
    TabOrder = 2
  end
  object aclRetirada: TActionList
    Images = dm.cxImageList1
    Left = 424
    Top = 24
    object actRecepcaoIniciar: TAction
      Tag = 3
      Caption = 'Iniciar Recep'#231#227'o'
      Hint = 'Iniciar a Recep'#231#227'o dos Containers'
      ImageIndex = 27
      OnExecute = actRecepcaoIniciarExecute
    end
    object actRecepcaoConcluir: TAction
      Tag = 3
      Caption = 'Concluir Recep'#231#227'o'
      Enabled = False
      Hint = 'Concluir a Recep'#231#227'o de Containers'
      ImageIndex = 51
      OnExecute = actRecepcaoConcluirExecute
    end
    object actRecepcaoSair: TAction
      Tag = 99
      Caption = 'Sair'
      Hint = 'Sair da Tela'
      ImageIndex = 10
      OnExecute = actRecepcaoSairExecute
    end
    object actListagem: TAction
      Caption = 'Listagem'
      Hint = 'Listagem de Containers Recebidos'
      ImageIndex = 16
      OnExecute = actListagemExecute
    end
  end
  object tbRecepcao: TdxMemData
    Indexes = <
      item
        FieldName = 'NUM_LACRE'
        SortOptions = []
      end>
    SortOptions = []
    Left = 464
    Top = 24
    object tbRecepcaoNUM_LACRE: TStringField
      FieldName = 'NUM_LACRE'
      Size = 9
    end
    object tbRecepcaoDAT_EXPEDICAO: TDateField
      FieldName = 'DAT_EXPEDICAO'
    end
  end
  object ds: TDataSource
    DataSet = tbRecepcao
    Left = 504
    Top = 24
  end
end
