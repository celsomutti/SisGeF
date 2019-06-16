object frmBaixaContaReceber: TfrmBaixaContaReceber
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Baixa de Contas a Receber'
  ClientHeight = 128
  ClientWidth = 244
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel1: TcxLabel
    Left = 8
    Top = 16
    Caption = 'Data da Baixa:'
    Transparent = True
  end
  object cxDataBaixa: TcxDateEdit
    Left = 8
    Top = 39
    Properties.SaveTime = False
    Properties.ShowTime = False
    TabOrder = 1
    Width = 121
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 66
    Caption = 'Valor da Baixa:'
    Transparent = True
  end
  object cxValorBaixa: TcxCalcEdit
    Left = 8
    Top = 89
    EditValue = 0.000000000000000000
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = ' ,0.00;- ,0.00'
    TabOrder = 3
    Width = 121
  end
  object cxButton1: TcxButton
    Left = 152
    Top = 40
    Width = 75
    Height = 20
    Action = actBaixaBaixar
    TabOrder = 4
  end
  object cxButton2: TcxButton
    Left = 152
    Top = 90
    Width = 75
    Height = 20
    Action = actBaixaCancelar
    TabOrder = 5
  end
  object aclBaixa: TActionList
    Images = dm.cxImageList1
    Left = 112
    object actBaixaBaixar: TAction
      Tag = 1
      Category = 'Baixar'
      Caption = 'Baixar'
      Hint = 'Baixar Titulo'
      ImageIndex = 0
      OnExecute = actBaixaBaixarExecute
    end
    object actBaixaCancelar: TAction
      Tag = 99
      Category = 'Baixar'
      Caption = 'Cancelar'
      Hint = 'Cancelar Baixa'
      ImageIndex = 6
      OnExecute = actBaixaCancelarExecute
    end
  end
end
