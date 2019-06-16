object frmCadastraSenha: TfrmCadastraSenha
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Senha do Usu'#225'rio'
  ClientHeight = 194
  ClientWidth = 333
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
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alClient
    PanelStyle.Active = True
    TabOrder = 0
    Height = 194
    Width = 333
    object cxLabel1: TcxLabel
      Left = 8
      Top = 8
      Caption = 'Senha'
      Transparent = True
    end
    object cxSenha: TcxTextEdit
      Left = 8
      Top = 31
      Properties.EchoMode = eemPassword
      Properties.MaxLength = 256
      TabOrder = 1
      Width = 317
    end
    object cxLabel2: TcxLabel
      Left = 8
      Top = 64
      Caption = 'Confirma'#231#227'o da Senha'
      Transparent = True
    end
    object cxConfirmaSenha: TcxTextEdit
      Left = 8
      Top = 87
      Properties.EchoMode = eemPassword
      Properties.MaxLength = 256
      TabOrder = 3
      Width = 317
    end
    object cxPrimeiroAcesso: TcxCheckBox
      Left = 8
      Top = 122
      Caption = 'Usu'#225'rio Dever'#225' Alterar a Senha no Primeiro Acesso'
      TabOrder = 4
      Transparent = True
      Width = 317
    end
    object cxButton1: TcxButton
      Left = 169
      Top = 161
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Action = actCadastraSenhaCadastrar
      TabOrder = 5
    end
    object cxButton2: TcxButton
      Left = 250
      Top = 166
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Action = actCadastraSenhaCancelar
      Cancel = True
      TabOrder = 6
    end
  end
  object aclCadastraSenha: TActionList
    Left = 232
    Top = 8
    object actCadastraSenhaCadastrar: TAction
      Tag = 99
      Category = 'Cadastrar Senha'
      Caption = 'Ok'
      Hint = 'Cadastrar a Senha'
      ImageIndex = 3
      OnExecute = actCadastraSenhaCadastrarExecute
    end
    object actCadastraSenhaCancelar: TAction
      Tag = 99
      Category = 'Cadastrar Senha'
      Caption = 'Cancelar'
      Hint = 'Cancelar'
      ImageIndex = 4
      OnExecute = actCadastraSenhaCancelarExecute
    end
  end
end
