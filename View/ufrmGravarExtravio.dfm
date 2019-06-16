object frmGravarExtravio: TfrmGravarExtravio
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Confirma Grava'#231#227'o'
  ClientHeight = 137
  ClientWidth = 334
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  DesignSize = (
    334
    137)
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel1: TcxLabel
    Left = 32
    Top = 32
    Caption = '&Extravio para:'
    FocusControl = cxComboBox1
    Transparent = True
  end
  object cxComboBox1: TcxComboBox
    Left = 119
    Top = 31
    Properties.Items.Strings = (
      'ADMINISTRADOR DO CEP'
      'ENTREGADOR'
      'NINGUEM')
    TabOrder = 1
    Text = 'ADMINISTRADOR DO CEP'
    TextHint = 'Extraviado'
    Width = 170
  end
  object cxButton1: TcxButton
    Left = 170
    Top = 104
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Action = actGravarExtravioGravar
    Anchors = [akRight, akBottom]
    Default = True
    TabOrder = 2
  end
  object cxButton2: TcxButton
    Left = 251
    Top = 104
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Action = actGravarExtravioCancelar
    Anchors = [akRight, akBottom]
    Cancel = True
    TabOrder = 3
  end
  object cxAVista: TcxCheckBox
    Left = 119
    Top = 58
    Hint = 'Selecione se d'#233'bito deve ser '#224' vista'
    Caption = 'D'#233'bito '#224' Vista'
    Properties.NullStyle = nssUnchecked
    State = cbsChecked
    TabOrder = 4
    Transparent = True
  end
  object aclGravarExtravio: TActionList
    Images = dm.cxImageList1
    Left = 296
    Top = 16
    object actGravarExtravioGravar: TAction
      Category = 'Gravar Extravio'
      Caption = '&Gravar'
      Hint = 'Gravar o Extravio'
      ImageIndex = 9
      OnExecute = actGravarExtravioGravarExecute
    end
    object actGravarExtravioCancelar: TAction
      Category = 'Gravar Extravio'
      Caption = 'Cancelar'
      Hint = 'Cancelar Grava'#231#227'o'
      ImageIndex = 6
      OnExecute = actGravarExtravioCancelarExecute
    end
  end
end
