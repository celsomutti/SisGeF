object frmPesquisarPessoas: TfrmPesquisarPessoas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Pesquisar'
  ClientHeight = 469
  ClientWidth = 809
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Icon.Data = {
    0000010001001010000001001800680300001600000028000000100000002000
    0000010018000000000040030000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000105A8C080808000000000000000000000000000000000000000000000000
    000000000000000000000000000000105A8C0094B5105A8C0808080000000000
    00000000000000000000000000000000000000000000000000000000105A8C00
    94B5105A8C0808080000000000000000000000000000008C8C8C4A4A4A080808
    0808084A4A4A313131105A8C0094B5105A8C0808080000000000000000000000
    000000006B6B6B313131736B4A736B4A736B4A5A5A5A313131183942105A8C08
    08080000000000000000000000000000008C8C8C3131319C8C639C8C639C8C63
    9C8C63736B4A736B4A3131312121210000000000000000000000000000000000
    004A4A4A9C8C63D6C6A5CEBD84B5A57BB5A57B9C8C63736B4A5A5A5A4A4A4A00
    0000000000000000000000000000000000080808D6C6A5EFE7B5EFE7B5D6C6A5
    CEBD84B5A57B9C8C63736B4A0808080000000000000000000000000000000000
    00080808D6C6A5EFE7B5EFE7B5EFE7B5D6C6A5B5A57B9C8C63736B4A08080800
    00000000000000000000000000000000004A4A4AB5A57BEFE7B5EFE7B5EFE7B5
    EFE7B5CEBD849C8C63736B4A4A4A4A0000000000000000000000000000000000
    008C8C8C4A4A4AD6C6A5EFE7B5EFE7B5EFE7B5D6C6A59C8C633131318C8C8C00
    00000000000000000000000000000000000000006B6B6B4A4A4AB5A57BD6C6A5
    D6C6A59C8C633131316B6B6B0000000000000000000000000000000000000000
    000000000000008C8C8C4A4A4A0808080808084A4A4A8C8C8C00000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000FFFF
    0000FFF70000FFE30000FFC10000FF830000E0070000C00F0000801F0000801F
    0000801F0000801F0000801F0000801F0000C03F0000E07F0000FFFF0000}
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lcPesquisa: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 809
    Height = 469
    Align = alClient
    TabOrder = 0
    LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
    OptionsImage.Images = dm.cxImageList1
    object lcParametros: TdxLayoutControl
      Left = 11
      Top = 11
      Width = 661
      Height = 62
      TabOrder = 0
      LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
      OptionsImage.Images = dm.cxImageList1
      object cboCampo: TcxComboBox
        Left = 10
        Top = 28
        Hint = 'Campo de pesquisa'
        Style.HotTrack = False
        TabOrder = 0
        Width = 311
      end
      object edtTexto: TcxMaskEdit
        Left = 327
        Top = 28
        Properties.OnValidate = edtTextoPropertiesValidate
        Style.HotTrack = False
        TabOrder = 1
        Width = 448
      end
      object lcParametrosGroup_Root: TdxLayoutGroup
        AlignHorz = ahParentManaged
        AlignVert = avParentManaged
        ButtonOptions.Buttons = <>
        Hidden = True
        LayoutDirection = ldHorizontal
        ShowBorder = False
        Index = -1
      end
      object lcParametrosItem1: TdxLayoutItem
        Parent = lcParametrosGroup_Root
        CaptionOptions.Text = 'Campo'
        CaptionOptions.Layout = clTop
        Control = cboCampo
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object lcParametrosItem2: TdxLayoutItem
        Parent = lcParametrosGroup_Root
        CaptionOptions.Text = '&Texto a Pesquisar'
        CaptionOptions.Layout = clTop
        Control = edtTexto
        ControlOptions.ShowBorder = False
        Index = 1
      end
    end
    object grdPesquisa: TcxGrid
      Left = 10
      Top = 80
      Width = 789
      Height = 345
      Images = dm.cxImageList1
      TabOrder = 1
      OnEnter = grdPesquisaEnter
      OnExit = grdPesquisaExit
      object tvPesquisa: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.Images = dm.cxImageList1
        Navigator.Buttons.First.ImageIndex = 99
        Navigator.Buttons.First.Visible = True
        Navigator.Buttons.PriorPage.Visible = False
        Navigator.Buttons.Prior.ImageIndex = 102
        Navigator.Buttons.Next.ImageIndex = 101
        Navigator.Buttons.NextPage.Visible = False
        Navigator.Buttons.Last.ImageIndex = 100
        Navigator.Buttons.Insert.Visible = False
        Navigator.Buttons.Delete.Visible = False
        Navigator.Buttons.Edit.Visible = False
        Navigator.Buttons.Post.Visible = False
        Navigator.Buttons.Cancel.Visible = False
        Navigator.Buttons.Refresh.ImageIndex = 40
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.Buttons.GotoBookmark.Visible = False
        Navigator.Buttons.Filter.ImageIndex = 67
        Navigator.InfoPanel.DisplayMask = 'Registros encontrados [RecordCount]'
        Navigator.InfoPanel.Visible = True
        Navigator.Visible = True
        OnCellDblClick = tvPesquisaCellDblClick
        DataController.DataSource = dsPesquisa
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        Images = dm.cxImageList1
        OptionsBehavior.CopyCaptionsToClipboard = False
        OptionsBehavior.IncSearch = True
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.MultiSelect = True
        OptionsView.CellAutoHeight = True
        OptionsView.Indicator = True
      end
      object lvPesquisa: TcxGridLevel
        GridView = tvPesquisa
      end
    end
    object cxButton2: TcxButton
      Left = 629
      Top = 431
      Width = 89
      Height = 25
      Action = actSelecionar
      TabOrder = 3
    end
    object cxButton1: TcxButton
      Left = 535
      Top = 431
      Width = 88
      Height = 25
      Cursor = crHandPoint
      Action = actLocalizar
      TabOrder = 2
    end
    object cxButton3: TcxButton
      Left = 724
      Top = 431
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Action = actFechar
      Cancel = True
      TabOrder = 4
    end
    object lcPesquisaGroup_Root: TdxLayoutGroup
      AlignHorz = ahParentManaged
      AlignVert = avParentManaged
      LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object lcPesquisaItem1: TdxLayoutItem
      Parent = lcPesquisaGroup_Root
      CaptionOptions.ImageIndex = 94
      CaptionOptions.Text = 'Par'#226'metros'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
      Control = lcParametros
      Index = 0
    end
    object lcPesquisaItem2: TdxLayoutItem
      Parent = lcPesquisaGroup_Root
      CaptionOptions.Layout = clTop
      Control = grdPesquisa
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lcPesquisaItem4: TdxLayoutItem
      Parent = lcPesquisaGroup1
      AlignHorz = ahRight
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      Control = cxButton2
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lcPesquisaItem3: TdxLayoutItem
      Parent = lcPesquisaGroup1
      AlignHorz = ahRight
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = cxButton1
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lcPesquisaGroup1: TdxLayoutAutoCreatedGroup
      Parent = lcPesquisaGroup_Root
      LayoutDirection = ldHorizontal
      Index = 2
      AutoCreated = True
    end
    object lcPesquisaItem5: TdxLayoutItem
      Parent = lcPesquisaGroup1
      AlignHorz = ahRight
      CaptionOptions.Text = 'cxButton3'
      CaptionOptions.Visible = False
      Control = cxButton3
      ControlOptions.ShowBorder = False
      Index = 2
    end
  end
  object actPesquisar: TActionList
    Images = dm.cxImageList1
    Left = 584
    object actLocalizar: TAction
      Caption = '&Localizar'
      Hint = ' Localizar registro(s)'
      ImageIndex = 18
      OnExecute = actLocalizarExecute
    end
    object actSelecionar: TAction
      Caption = '&Selecionar'
      Hint = 'Selecionar registro'
      ImageIndex = 51
      OnExecute = actSelecionarExecute
    end
    object actFechar: TAction
      Caption = 'Fechar'
      Hint = 'Fechar tela'
      ImageIndex = 103
      OnExecute = actFecharExecute
    end
  end
  object dsPesquisa: TDataSource
    AutoEdit = False
    DataSet = qryPesquisa
    Left = 584
    Top = 48
  end
  object qryPesquisa: TZQuery
    Connection = dm.ZConn
    Params = <>
    Left = 651
    Top = 27
  end
end
