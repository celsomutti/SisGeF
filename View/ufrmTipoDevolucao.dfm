object frmTipoDevolucao: TfrmTipoDevolucao
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Tipo de Devolu'#231#227'o / Envio / Remessa'
  ClientHeight = 134
  ClientWidth = 327
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 13
  object cxTipoDevolucao: TcxRadioGroup
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alTop
    Caption = 'Selecione o Tipo de Devolu'#231#227'o'
    Properties.Items = <
      item
        Caption = 'Devolu'#231#227'o de Remessa Indevida (DRI)'
      end
      item
        Caption = 'Devolu'#231#227'o de Troca de Etiquetas (DTE)'
      end
      item
        Caption = 'Devolu'#231#227'o pela Base (DBS)'
      end
      item
        Caption = 'Simples Envio/Remessa (SER)'
      end>
    ItemIndex = 0
    TabOrder = 0
    Height = 97
    Width = 321
  end
  object cxButton1: TcxButton
    Left = 244
    Top = 106
    Width = 75
    Height = 20
    Cursor = crHandPoint
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
end
