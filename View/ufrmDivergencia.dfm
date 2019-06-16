object frmDivergencia: TfrmDivergencia
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Diverg'#234'ncia'
  ClientHeight = 213
  ClientWidth = 408
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alClient
    Caption = 'Descri'#231#227'o'
    PanelStyle.Active = True
    TabOrder = 0
    Height = 207
    Width = 402
    object cxDivergencia: TcxMemo
      Left = 3
      Top = 16
      Hint = 'Informe a Diverg'#234'ncia'
      Properties.ReadOnly = False
      Properties.ScrollBars = ssVertical
      StyleDisabled.BorderStyle = ebsNone
      TabOrder = 0
      Height = 161
      Width = 396
    end
    object cxButton1: TcxButton
      Left = 243
      Top = 183
      Width = 75
      Height = 20
      Action = actDivergenciaGravar
      Default = True
      TabOrder = 1
    end
    object cxButton2: TcxButton
      Left = 324
      Top = 183
      Width = 75
      Height = 20
      Action = actDivergenciaCancelar
      Cancel = True
      TabOrder = 2
    end
  end
  object aclDivergencia: TActionList
    Images = dm.cxImageList1
    Left = 256
    Top = 8
    object actDivergenciaGravar: TAction
      Tag = 3
      Category = 'Diverg'#234'ncia'
      Caption = 'Gravar'
      Hint = 'Gravar Diverg'#234'ncia'
      ImageIndex = 9
      OnExecute = actDivergenciaGravarExecute
    end
    object actDivergenciaCancelar: TAction
      Tag = 99
      Category = 'Diverg'#234'ncia'
      Caption = 'Cancelar'
      Hint = 'Cancelar'
      ImageIndex = 6
      OnExecute = actDivergenciaCancelarExecute
    end
  end
end
