object frmEnvioEmail: TfrmEnvioEmail
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Envio de E-mail'
  ClientHeight = 637
  ClientWidth = 703
  Color = clWhite
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
    0000000000000000000000000000000000000000000000000000000000008484
    8400000000000000000000000000000000000000000000000000000000000000
    00000000000000000000000000008484840000846363636B31104A4A4A00005A
    4A4A4A6B31104A4A4A00005A4A4A4A6B31104A4A4A00005A3131310000008484
    84BDBDBDB5B5B58C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C84
    84847B7B7B6B6B6B4A1018000000848484D67B73E7E7E7C6C6C6B5B5B5B5B5B5
    B5B5B5B5B5B5B5B5B5B5B5B5ADADAD9C9C9C8C8C8C7B7B7B4A4A4A0000008484
    84CECECEE7E7E7E7E7E7DE9C84DE9C84DE9C84DE9C84DE9C84CECECECECECEC6
    C6C69C9C9C84848400005A0000008484847373CEF7F7F7F7F7F7F7F7F7000000
    000000000000000000000000F7F7F7CECECEB5B5B58C8C8C4A4A4A0000008484
    84DEDEDEF7F7F7000000DE9C84DE9C84DE9C84DE9C84DE9C84DE9C84F7F7F7DE
    DEDE00219C0000846B3110000000848484DE9C84000000000000000000F7F7F7
    F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7E7E7E70000840000845A5A5A0000008484
    84E7E7E7000000000000F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7E7
    E7E7E7E7E7B5B5B500005A0000008484848484F7E7E7E77373CEDEDEDEDE9C84
    CECECE7373CECECECEDE9C84CECECE7373CECECECEBD735A8484840000008484
    8484848484848484848484848484848484848484848484848484848484848484
    8484848484848484848484848484000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000FFFF
    0000FFFF0000000000000000000000000000000000000000000007C000001000
    000038000000300000000000000000000000FFFF0000FFFF0000FFFF0000}
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    703
    637)
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alTop
    PanelStyle.Active = True
    TabOrder = 0
    DesignSize = (
      697
      206)
    Height = 206
    Width = 697
    object cxLabel2: TcxLabel
      Left = 3
      Top = 3
      Caption = 'Para:'
      Transparent = True
    end
    object cxLabel3: TcxLabel
      Left = 3
      Top = 131
      Caption = 'Assunto:'
      Transparent = True
    end
    object cxAssunto: TcxTextEdit
      Left = 61
      Top = 127
      TabOrder = 3
      Width = 633
    end
    object cxLabel4: TcxLabel
      Left = 3
      Top = 154
      Caption = 'Anexo(s):'
      Transparent = True
    end
    object cxDestintarios: TcxListBox
      Left = 61
      Top = 3
      Width = 602
      Height = 54
      ItemHeight = 13
      TabOrder = 1
    end
    object cxAnexos: TcxListBox
      Left = 61
      Top = 154
      Width = 516
      Height = 46
      ItemHeight = 13
      TabOrder = 4
    end
    object cxButton3: TcxButton
      Left = 583
      Top = 154
      Width = 111
      Height = 20
      Cursor = crHandPoint
      Action = actEMailAnexar
      Anchors = [akRight, akBottom]
      TabOrder = 5
    end
    object cxButton4: TcxButton
      Left = 583
      Top = 180
      Width = 111
      Height = 20
      Cursor = crHandPoint
      Action = actEMailExcluirAnexo
      Anchors = [akRight, akBottom]
      TabOrder = 6
    end
    object cxLabel1: TcxLabel
      Left = 3
      Top = 63
      Caption = 'Cc:'
      Transparent = True
    end
    object cxCopiaCom: TcxListBox
      Left = 61
      Top = 63
      Width = 602
      Height = 54
      ItemHeight = 13
      TabOrder = 2
    end
    object cxButton6: TcxButton
      Left = 669
      Top = 1
      Width = 25
      Height = 25
      Cursor = crHandPoint
      Action = actEMailIncluirDestinatario
      TabOrder = 10
    end
    object cxButton7: TcxButton
      Left = 669
      Top = 32
      Width = 25
      Height = 25
      Cursor = crHandPoint
      Action = actEMailExcluirDestinatario
      TabOrder = 11
    end
    object cxButton8: TcxButton
      Left = 669
      Top = 63
      Width = 25
      Height = 25
      Cursor = crHandPoint
      Action = actEMailIncluirComCopia
      TabOrder = 12
    end
    object cxButton9: TcxButton
      Left = 669
      Top = 92
      Width = 25
      Height = 25
      Cursor = crHandPoint
      Action = actEMailExcluirComCopia
      TabOrder = 13
    end
  end
  object cxGroupBox2: TcxGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 215
    Align = alTop
    PanelStyle.Active = True
    TabOrder = 1
    DesignSize = (
      697
      386)
    Height = 386
    Width = 697
    object cxLabel5: TcxLabel
      Left = 3
      Top = 133
      Anchors = [akLeft, akBottom]
      Caption = 'Mensagem:'
      Transparent = True
    end
    object cxMensagem: TcxMemo
      Left = 61
      Top = 3
      Anchors = [akLeft, akTop, akRight, akBottom]
      Lines.Strings = (
        'Favor solicitar pesquisa GR para o motorista abaixo:'
        ''
        'MOTORISTA'
        ''
        'Nome Completo '#9': $NOME$'
        'Nome de Guerra'#9': $GUERRA$'
        'RG'#9#9': $RG$ '#9#9
        'Orgao Expedidor : $UFRG$'#9#9
        'Data Emissao    : $EMISSAORG$'
        'UF'#9#9': $UFNAT$'#9
        'Naturalizade    : $CIDADENAT$'
        'Data Nascimento'#9': $DATANAS$     '
        'CPF             : $CPF$'
        'CNH'#9#9': $CNH$'#9#9
        'Vencimento CNH  : $VENCCNH$'
        'UF CNH          : $UFCNH$'
        'Registro CNH'#9': $REGCNH$'#9
        'Categoria       : $CAT$'#9#9
        '1a. Habilita'#231'ao : $1CNH$'
        'Nome do Pai'#9': $PAI$'
        'Nome da Mae'#9': $MAE$'
        'Endere'#231'o'#9': $ENDERECO$'#9#9#9
        'CEP     '#9': $CEP$'
        'Bairro'#9#9': $BAIRRO$'
        'UF'#9#9': $UFEND$'#9
        'Cidade          : $CIDADEEND$'
        'Telefone 1'#9': $TEL1$     '
        'Contato         : $CONT1$'
        'Telefone 2      : $TEL2$'
        'Contato         : $CONT2$'
        'Telefone 3      : $TEL3$     '
        'Contato'#9'        : $CONT3$'
        ''
        'PROPRIETARIO DO VEICULO'
        ''
        'Pessoa'#9#9': $PESSOA$'
        'CPF/CNPJ'#9': $CNPJ$'
        'Nome Completo'#9': $PROP$'
        'Data Nascimento'#9': $NASPROP$'
        'Nome da Mae'#9': $MAEPROP$'#9
        'RG'#9#9': $RGPROP$'#9'   '
        'Estado          : $UFRGPROP$'#9
        'Data Emissao    : $EMISSAORGPROP$'
        'UF'#9#9': $UFPROP$'#9'   '
        'Cidade          : $CIDADEPROP$    '
        'Endere'#231'o'#9': $ENDERECOPROP$'#9
        'CEP   '#9'        : $CEPPROP$'
        'Bairro'#9#9': $BAIRROPROP$ '
        'Telefone 1 '#9': $TEL1PROP$'#9#9
        'Contato         : $CONT1PROP$'
        'Telefone 2 '#9': $TEL2PROP$            '
        'Contato         : $CONT2PROP$'
        ''
        'DADOS DO VEICULO'
        ''
        'Placa'#9#9': $PLACA$'
        'UF'#9#9': $UFVEICULO$'#9#9
        'Cidade          : $CIDADEVEICULO$'
        'RENAVAN'#9#9': $RE$'#9#9#9
        'Chassi          : $CHASSI$'
        'Cor'#9#9': $COR$'#9#9#9
        'Modelo          : $MODELO$'
        'Marca           : $MARCA$               '
        'Ano             : $ANO$'
        'Tipo            : $TIPO$'
        ''
        'OBSERVA'#199'OES COMPLEMENTARES SOBRE O MOTORISTA'
        ''
        'Ja foi vitima de roubo ?    '#9'   : $J1$'#9'Quantas vezes ?    : $Q1$'
        
          'Ja se envolveu em acidentes ?  '#9'   : $J2$'#9'Quantas vezes ?    : $' +
          'Q2$'
        
          'Ja transportou para essa empresa ? : $J3$'#9'Quantas vezes ?    : $' +
          'Q3$'
        ''
        'Pesquisa solicitada por $USER$')
      ParentFont = False
      Properties.ScrollBars = ssBoth
      Properties.WordWrap = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Courier New'
      Style.Font.Style = []
      Style.TextStyle = []
      Style.TransparentBorder = True
      Style.IsFontAssigned = True
      TabOrder = 1
      Height = 380
      Width = 633
    end
  end
  object cxButton1: TcxButton
    Left = 544
    Top = 609
    Width = 75
    Height = 20
    Cursor = crHandPoint
    Action = actEMailEnviar
    Anchors = [akRight, akBottom]
    TabOrder = 2
  end
  object cxButton2: TcxButton
    Left = 625
    Top = 609
    Width = 75
    Height = 20
    Cursor = crHandPoint
    Action = actEMailCancelar
    Anchors = [akRight, akBottom]
    Cancel = True
    TabOrder = 3
  end
  object aclEMail: TActionList
    Images = dm.cxImageList1
    Left = 576
    Top = 8
    object actEMailAnexar: TAction
      Tag = 99
      Category = 'E-Mail'
      Caption = 'Anexar Arquivo'
      Hint = 'Anexar Arquivo'
      ImageIndex = 58
      OnExecute = actEMailAnexarExecute
    end
    object actEMailEnviar: TAction
      Tag = 99
      Category = 'E-Mail'
      Caption = 'Enviar'
      Hint = 'Enviar E-Mail'
      ImageIndex = 59
      OnExecute = actEMailEnviarExecute
    end
    object actEMailCancelar: TAction
      Tag = 99
      Category = 'E-Mail'
      Caption = 'Cancelar'
      Hint = 'Cancelar Envio de E-Mail'
      ImageIndex = 6
      OnExecute = actEMailCancelarExecute
    end
    object actEMailExcluirAnexo: TAction
      Tag = 99
      Category = 'E-Mail'
      Caption = 'Exluir Anexo'
      Hint = 'Excuir nome do arquivo da lista de anexos'
      ImageIndex = 60
      OnExecute = actEMailExcluirAnexoExecute
    end
    object actEMailIncluirDestinatario: TAction
      Category = 'E-Mail'
      Caption = '+'
      Hint = 'Incluir Destinat'#225'rios'
      OnExecute = actEMailIncluirDestinatarioExecute
    end
    object actEMailExcluirDestinatario: TAction
      Category = 'E-Mail'
      Caption = '-'
      Hint = 'Excluir Destinatario'
      OnExecute = actEMailExcluirDestinatarioExecute
    end
    object actEMailIncluirComCopia: TAction
      Category = 'E-Mail'
      Caption = '+'
      Hint = 'Incluir Com C'#243'pia'
      OnExecute = actEMailIncluirComCopiaExecute
    end
    object actEMailExcluirComCopia: TAction
      Category = 'E-Mail'
      Caption = '-'
      Hint = 'Excluir Com C'#243'pia'
      OnExecute = actEMailExcluirComCopiaExecute
    end
  end
  object OpenDialog: TOpenDialog
    Title = 'Selecionar Anexo'
    Left = 608
    Top = 8
  end
end
