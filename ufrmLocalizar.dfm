object frmLocalizar: TfrmLocalizar
  Left = 299
  Top = 205
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Localizar'
  ClientHeight = 528
  ClientWidth = 995
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100001000400E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000008870000000000000000088700000000088
    7000000000000000008870000000008870000000000000000088700000000088
    7000000000000000008870000000000000000000000000000000000000000000
    0000000000000000000000000000008800000000000000088000000000000088
    0700000000000008807000000000008807000000080000088070000000000088
    0700000008000008807000000000008807000000080000088070000000000088
    0700000008000008807000000000000007000000000000000070000000000000
    0700000000000000007000000000000000000000000000000000000000000000
    0088870000000088870000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0007700000000007700000000000000000077000000000077000000000000000
    0007700000000007700000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000FFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFF803FF803803FF803803FF803803FF803803F
    F803800380038003800380038003800000038000000380000003800000038000
    0003C0000007C0000007C0000007F803803FF803803FF803803FF803803FFC07
    C07FFC07C07FFC07C07FFC07C07FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 491
    Width = 995
    Height = 37
    Align = alBottom
    ParentColor = True
    TabOrder = 0
    DesignSize = (
      995
      37)
    object cxButton1: TcxButton
      Left = 810
      Top = 8
      Width = 89
      Height = 20
      Cursor = crHandPoint
      Hint = 'Selecionar o registro'
      Anchors = [akTop, akRight]
      Caption = 'Selecionar'
      Default = True
      Enabled = False
      LookAndFeel.Kind = lfOffice11
      ModalResult = 1
      OptionsImage.ImageIndex = 0
      OptionsImage.Images = dm.cxImageList1
      TabOrder = 0
    end
    object cxButton2: TcxButton
      Left = 904
      Top = 8
      Width = 83
      Height = 20
      Cursor = crHandPoint
      Hint = 'Sair da tela de filtro'
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Sai&r'
      ModalResult = 2
      OptionsImage.ImageIndex = 10
      OptionsImage.Images = dm.cxImageList1
      TabOrder = 1
    end
  end
  object cxGroupBox1: TcxGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alTop
    Caption = 'Crit'#233'rios'
    TabOrder = 1
    DesignSize = (
      989
      114)
    Height = 121
    Width = 989
    object Label1: TLabel
      Left = 3
      Top = 24
      Width = 38
      Height = 13
      Caption = 'Campos'
      Transparent = True
      Layout = tlCenter
    end
    object Label2: TLabel
      Left = 784
      Top = 24
      Width = 55
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Operadores'
      Transparent = True
      Layout = tlCenter
      ExplicitLeft = 576
    end
    object Label3: TLabel
      Left = 3
      Top = 64
      Width = 48
      Height = 13
      Caption = 'Par'#226'metro'
      Transparent = True
      Layout = tlCenter
    end
    object cboOperadoresSQL: TComboBox
      Left = 783
      Top = 40
      Width = 201
      Height = 21
      Hint = 'Operadores SQL'
      Anchors = [akTop, akRight]
      ItemIndex = 0
      TabOrder = 0
      TabStop = False
      Text = ' = '
      OnClick = cboOperadoresSQLClick
      Items.Strings = (
        ' = '
        ' <> '
        ' LIKE '
        ' > '
        ' < '
        ' <= '
        ' >= ')
    end
    object cboCamposSQL: TComboBox
      Left = 3
      Top = 40
      Width = 775
      Height = 21
      Hint = 'Nome dos campos da tabela'
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      TabStop = False
      OnClick = cboCamposSQLClick
    end
    object cboCamposDisplay: TComboBox
      Left = 3
      Top = 40
      Width = 775
      Height = 21
      Hint = 'Descri'#231#227'o dos campos na tabela'
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      OnClick = cboCamposDisplayClick
    end
    object cboOperadores: TComboBox
      Left = 784
      Top = 40
      Width = 201
      Height = 21
      Hint = 'Operadores'
      Anchors = [akTop, akRight]
      TabOrder = 3
      Text = 'igual a '
      OnClick = cboOperadoresClick
      Items.Strings = (
        'igual a '
        'diferente de '
        'come'#231'ando, terminando ou contendo '
        'maior que '
        'menor que '
        'maior ou igual a '
        'menor ou igual a ')
    end
    object txtParametro: TEdit
      Left = 3
      Top = 80
      Width = 878
      Height = 21
      Hint = 'Par'#226'metro do filtro'
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      OnEnter = txtParametroEnter
    end
    object cxButton3: TcxButton
      Left = 887
      Top = 81
      Width = 97
      Height = 20
      Cursor = crHandPoint
      Action = actExecutar
      Anchors = [akTop, akRight]
      OptionsImage.Images = dm.cxImageList1
      TabOrder = 5
    end
  end
  object cxGrid1: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 130
    Width = 989
    Height = 358
    Align = alClient
    TabOrder = 2
    OnEnter = cxGrid1Enter
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.PriorPage.Visible = False
      Navigator.Buttons.NextPage.Visible = False
      Navigator.Buttons.Insert.Visible = False
      Navigator.Buttons.Delete.Visible = False
      Navigator.Buttons.Edit.Visible = False
      Navigator.Buttons.Post.Visible = False
      Navigator.Buttons.Cancel.Visible = False
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.Buttons.Filter.Visible = False
      Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
      Navigator.InfoPanel.Visible = True
      Navigator.Visible = True
      OnCellDblClick = cxGrid1DBTableView1CellDblClick
      DataController.DataSource = dsPesquisa
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnHidingOnGrouping = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.NoDataToDisplayInfoText = '<Aguardando Consulta>'
      OptionsView.ColumnAutoWidth = True
      OptionsView.GridLines = glNone
      OptionsView.GroupByBox = False
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object actFiltro: TActionList
    Images = dm.cxImageList1
    Left = 480
    Top = 5
    object actSair: TAction
      Caption = 'Sai&r'
      Hint = 'Sair da tela de filtro'
      ImageIndex = 10
    end
    object actExecutar: TAction
      Caption = 'Executar'
      Hint = 'Executar Filtro'
      ImageIndex = 27
      OnExecute = actExecutarExecute
    end
    object actSelecionar: TAction
      Caption = 'Selecionar'
      Hint = 'Selecionar o registro'
      ImageIndex = 0
    end
  end
  object dsPesquisa: TDataSource
    AutoEdit = False
    DataSet = dm.qryPesquisa
    OnStateChange = dsPesquisaStateChange
    Left = 448
    Top = 5
  end
end
