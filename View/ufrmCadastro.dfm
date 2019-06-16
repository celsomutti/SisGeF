object frmCadastro: TfrmCadastro
  Left = 0
  Top = 0
  Caption = 'Cadastro'
  ClientHeight = 503
  ClientWidth = 965
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 965
    Height = 503
    Align = alClient
    TabOrder = 0
    object lcgRoot: TdxLayoutGroup
      AlignHorz = ahParentManaged
      AlignVert = avParentManaged
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object lcgCadastro: TdxLayoutGroup
      Parent = lcgRoot
      CaptionOptions.Text = 'Cadastro'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      Index = 0
    end
  end
end
