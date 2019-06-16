object frmDadosProtocolo: TfrmDadosProtocolo
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Dados do Protocolo'
  ClientHeight = 158
  ClientWidth = 427
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  DesignSize = (
    427
    158)
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel1: TcxLabel
    Left = 8
    Top = 16
    Caption = 'Nome do Recebedor'
    Transparent = True
  end
  object cxNomeRecebedor: TcxTextEdit
    Left = 8
    Top = 39
    Properties.MaxLength = 70
    TabOrder = 1
    Width = 411
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 66
    Caption = 'Grau de Relacionamento'
    Transparent = True
  end
  object cxGrau: TcxTextEdit
    Left = 8
    Top = 89
    Properties.MaxLength = 50
    TabOrder = 3
    Width = 411
  end
  object cxButton1: TcxButton
    Left = 263
    Top = 125
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    TabOrder = 4
    OnClick = cxButton1Click
    ExplicitTop = 152
  end
  object cxButton2: TcxButton
    Left = 344
    Top = 125
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancelar'
    ModalResult = 2
    TabOrder = 5
    ExplicitTop = 152
  end
end
