object frmProdutos: TfrmProdutos
  Left = 382
  Top = 330
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Produtos'
  ClientHeight = 490
  ClientWidth = 894
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alClient
    PanelStyle.Active = True
    PanelStyle.OfficeBackgroundKind = pobkStyleColor
    ParentBackground = False
    ParentColor = False
    Style.BorderStyle = ebsUltraFlat
    Style.Color = clWhite
    Style.LookAndFeel.NativeStyle = False
    Style.LookAndFeel.SkinName = ''
    Style.Shadow = False
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.SkinName = ''
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.SkinName = ''
    StyleHot.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.SkinName = ''
    TabOrder = 0
    DesignSize = (
      894
      490)
    Height = 490
    Width = 894
    object cxButton5: TcxButton
      Left = 797
      Top = 462
      Width = 89
      Height = 20
      Cursor = crHandPoint
      Action = actCadastroSair
      Anchors = [akRight, akBottom]
      TabOrder = 0
    end
    object cxButton1: TcxButton
      Left = 8
      Top = 462
      Width = 89
      Height = 20
      Cursor = crHandPoint
      Action = actCadastroExportar
      Anchors = [akLeft, akBottom]
      TabOrder = 1
    end
    object cxGrid1: TcxGrid
      Left = 8
      Top = 41
      Width = 878
      Height = 415
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 2
      object cxGrid1DBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.Images = dm.cxImageList1
        Navigator.Buttons.First.Hint = 'Primeiro Registro'
        Navigator.Buttons.PriorPage.Visible = False
        Navigator.Buttons.Prior.Hint = 'Registro Anterior'
        Navigator.Buttons.Next.Hint = 'Pr'#243'ximo Registro'
        Navigator.Buttons.NextPage.Visible = False
        Navigator.Buttons.Last.Hint = #218'ltimo Registro'
        Navigator.Buttons.Insert.Hint = 'Inserir Registro'
        Navigator.Buttons.Insert.ImageIndex = 1
        Navigator.Buttons.Append.Visible = False
        Navigator.Buttons.Delete.Hint = 'Excluir Registro'
        Navigator.Buttons.Delete.ImageIndex = 8
        Navigator.Buttons.Edit.Hint = 'Editar Registro'
        Navigator.Buttons.Edit.ImageIndex = 14
        Navigator.Buttons.Post.Hint = 'Salvar Registro'
        Navigator.Buttons.Post.ImageIndex = 9
        Navigator.Buttons.Cancel.Hint = 'Cancelar Opera'#231#227'o'
        Navigator.Buttons.Cancel.ImageIndex = 6
        Navigator.Buttons.Refresh.Hint = 'Atualizar Grid'
        Navigator.Buttons.Refresh.ImageIndex = 40
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
        NewItemRow.InfoText = 'Clique aqui para incluir'
        NewItemRow.Visible = True
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.IncSearch = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsCustomize.ColumnGrouping = False
        OptionsData.DeletingConfirmation = False
        OptionsView.NoDataToDisplayInfoText = '<Nenhuma informa'#231#227'o dispon'#237'vel>'
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        object cxGrid1DBTableView1COD_PRODUTO: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'COD_PRODUTO'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.CharCase = ecUpperCase
        end
        object cxGrid1DBTableView1DES_PRODUTO: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'DES_PRODUTO'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.CharCase = ecUpperCase
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
    object cxLabel16: TcxLabel
      Left = 6
      Top = 6
      Caption = 'Produtos'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -21
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      Transparent = True
    end
  end
  object aclCadastro: TActionList
    Images = dm.cxImageList1
    Left = 520
    Top = 16
    object actCadastroIncluir: TAction
      Category = 'Cadastro'
      Caption = '&Incluir'
      Hint = 'Incluir dados'
      ImageIndex = 1
      ShortCut = 45
    end
    object actCadastroEditar: TAction
      Category = 'Cadastro'
      Caption = '&Editar'
      Hint = 'Editar dados'
      ImageIndex = 14
      ShortCut = 8237
      Visible = False
    end
    object actCadastroExcluir: TAction
      Category = 'Cadastro'
      Caption = 'E&xcluir'
      Hint = 'Excluir dados'
      ImageIndex = 8
      ShortCut = 46
    end
    object actCadastroCancelar: TAction
      Category = 'Cadastro'
      Caption = 'Cancelar'
      Hint = 'Cancelar opera'#231#227'o atual'
      ImageIndex = 6
    end
    object actCadastroSalvar: TAction
      Category = 'Cadastro'
      Caption = 'Sal&var'
      Hint = 'Salvar dados'
      ImageIndex = 9
      ShortCut = 116
    end
    object actCadastroImprimir: TAction
      Category = 'Cadastro'
      Caption = 'Im&primir'
      Hint = 'Imprimir dados'
      ImageIndex = 15
      ShortCut = 16464
    end
    object actCadastroLocalizar: TAction
      Category = 'Cadastro'
      Caption = '&Localizar'
      Hint = 'Localizar dados'
      ImageIndex = 18
      ShortCut = 119
    end
    object actCadastroSair: TAction
      Tag = 99
      Category = 'Cadastro'
      Caption = 'Sai&r'
      Hint = 'Sair da tela'
      ImageIndex = 10
      OnExecute = actCadastroSairExecute
    end
    object actCadastroExcluirEndereco: TAction
      Category = 'Cadastro'
      Caption = 'Excluir Endere'#231'o'
      Enabled = False
      Hint = 'Excluir este endere'#231'o'
      ImageIndex = 8
      ShortCut = 8238
    end
    object actCadastroListaApoio: TAction
      Category = 'Cadastro'
      Caption = '&Apoio'
      Hint = 'Lista de Apoio'
      ImageIndex = 28
      ShortCut = 120
      Visible = False
    end
    object actCadastroExportar: TAction
      Tag = 3
      Category = 'Cadastro'
      Caption = 'E&xportar'
      Hint = 'Exportar dados'
      ImageIndex = 29
      OnExecute = actCadastroExportarExecute
    end
  end
  object tbProdutos: TdxMemData
    Indexes = <>
    SortOptions = []
    BeforeInsert = tbProdutosBeforeInsert
    BeforeEdit = tbProdutosBeforeEdit
    BeforePost = tbProdutosBeforePost
    AfterPost = tbProdutosAfterPost
    BeforeCancel = tbProdutosBeforeCancel
    BeforeDelete = tbProdutosBeforeDelete
    AfterDelete = tbProdutosAfterDelete
    Left = 552
    Top = 16
    object tbProdutosCOD_PRODUTO: TStringField
      FieldName = 'COD_PRODUTO'
      Size = 10
    end
    object tbProdutosDES_PRODUTO: TStringField
      DisplayWidth = 70
      FieldName = 'DES_PRODUTO'
      Size = 50
    end
  end
  object ds: TDataSource
    AutoEdit = False
    DataSet = tbProdutos
    Left = 488
    Top = 16
  end
  object SaveDialog: TSaveDialog
    Left = 456
    Top = 16
  end
end
