object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Pesquisar'
  ClientHeight = 435
  ClientWidth = 683
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
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 13
  object lcPesquisa: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 683
    Height = 435
    Align = alClient
    TabOrder = 0
    LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
    OptionsImage.Images = dm.cxImageList1
    ExplicitLeft = 296
    ExplicitTop = 232
    ExplicitWidth = 300
    ExplicitHeight = 250
    object lcParametros: TdxLayoutControl
      Left = 11
      Top = 31
      Width = 300
      Height = 106
      TabOrder = 0
      LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
      OptionsImage.Images = dm.cxImageList1
      object gbInstantanea: TcxGroupBox
        Left = 10
        Top = 10
        Caption = 'Instant'#226'nea'
        TabOrder = 0
        Height = 47
        Width = 247
        object chkCodigo: TcxCheckBox
          Left = 3
          Top = 16
          Caption = 'C'#243'digo'
          Properties.NullStyle = nssUnchecked
          State = cbsChecked
          TabOrder = 0
          Width = 78
        end
        object cxCheckBox1: TcxCheckBox
          Left = 87
          Top = 16
          Caption = 'Nome'
          State = cbsChecked
          TabOrder = 1
          Width = 121
        end
      end
      object lcParametrosGroup_Root: TdxLayoutGroup
        AlignHorz = ahParentManaged
        AlignVert = avParentManaged
        ButtonOptions.Buttons = <>
        Hidden = True
        ShowBorder = False
        Index = -1
      end
      object lcParametrosItem1: TdxLayoutItem
        Parent = lcParametrosGroup_Root
        AlignHorz = ahLeft
        CaptionOptions.Text = 'cxGroupBox1'
        CaptionOptions.Visible = False
        Control = gbInstantanea
        ControlOptions.AutoColor = True
        ControlOptions.ShowBorder = False
        Index = 0
      end
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
      CaptionOptions.Layout = clTop
      LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
      Control = lcParametros
      Index = 0
    end
  end
end
