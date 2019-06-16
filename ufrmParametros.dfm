object frmParametros: TfrmParametros
  Left = 422
  Top = 85
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Par'#226'metros'
  ClientHeight = 567
  ClientWidth = 445
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  Icon.Data = {
    0000010001001010000001002000680400001600000028000000100000002000
    0000010020000000000040040000000000000000000000000000000000000000
    000000000000000000000000000018435AFF2B6289FF4C8ABEFF70A9CCFFE3ED
    F5FF000000000000000000000000000000000000000000000000000000000000
    00000000000000000000000000002E6785FF94C7F9FF91C9F9FF4185C9FF276B
    AEFFD8E6F2FF000000000000000000000000000000000000000000000000C6A1
    8CFFC38E68FFC08B66FFBE8864FF4389AAFFE0F2FFFF549AD8FF1A7ABEFF4998
    C5FF4081B6FF99796BFFAB7554FFA97353FFA97151FFC6A18CFF00000000C892
    6CFFE6E5E5FFE5E5E5FFE5E5E6FF97B5C9FF7AB6D5FF90B7D1FF55C9E4FF5BDF
    F5FF78D0EDFF4F9BDBFFCFD9E3FFE5E6E6FFE6E5E6FFA97251FF00000000CA94
    6EFFE7E7E7FFE8E7E7FFE7E7E7FFE7E7E7FFA4C6D7FF75B8D6FFC2F6FDFF63DF
    F7FF5DE2F8FF79D3F0FF4A99DCFFE6F1FAFFE7E7E7FFAA7353FF00000000CC97
    6FFFE9E9E9FFD28358FFD28358FFD28358FFE9E9E9FF89AEBFFF77CBE7FFC7F7
    FDFF5EDCF5FF5AE1F7FF7BD4F1FF4C9ADEFFC4D7E7FFAC7554FF00000000D19C
    73FFECECECFFECECEBFFECECEBFFECECECFFECEBECFFC3C3C3FF95BDCAFF79D3
    EEFFC7F7FDFF5FDCF5FF5BE2F7FF7AD6F2FF50A0E0FF9C7E6EFF00000000D49E
    75FFEFEEEEFFEFEFEFFFEFEEEEFFEFEEEEFFEEEFEEFFEEEEEEFFEEEFEFFFB5DE
    EBFF7DD4EEFFC4F6FDFF6CDDF6FF6DCAEDFF63A3D7FF6399C9FF00000000D5A0
    76FFF1F1F0FFF1F0F1FFF0F1F1FFF1F0F1FFF1F1F1FFC3C3C3FFFFFFFFFFFFFF
    FFFFB5E6F5FF81D6EEFFB2E3F9FF8BC0E7FFAED3F6FFC4E0FCFF6BA2D4FFD8A2
    79FFF2F2F2FFD28358FFD28358FFD28358FFF2F2F3FFC3C3C3FFFFFFFFFFFFFF
    FFFFFFFFFFFFB1E6F5FF77BEE7FFB4D2F0FFE5F3FFFFACD2EFFF5996CCFFD9A3
    79FFF5F5F5FFF5F5F4FFF4F5F4FFF4F4F4FFF5F5F4FFC3C3C3FFC3C3C3FFC3C3
    C3FFC3C3C3FFC3C3C3FF94BDCCFF58A5D8FF85B1DBFF469DD0FFB1D8EEFFDBA4
    7AFFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
    F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFBD8763FF00000000DCA7
    7BFFDCA77BFFDCA77BFFDCA77BFFDCA77BFFDCA77BFFDCA77BFFDCA77BFFDCA7
    7BFFDCA77BFFDCA77BFFDCA77BFFDCA77BFFDCA77BFFC08B66FF00000000DDAD
    86FFE8B992FFE8B992FFE8B992FFE8B992FFE8B992FFE8B992FFE8B992FFE8B9
    92FFE8B992FFE8B992FFE8B992FFE8B992FFE8B992FFC19170FF00000000DBC3
    B6FFDEB492FFDCA77BFFDCA67AFFDAA47AFFD8A279FFD5A076FFD49E75FFD29D
    73FFCF9A72FFCE9970FFCB966FFFC9946CFFC79E80FFDBC3B6FF000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000F07F
    0000F03F00000001000000010000000100000001000000010000000100000000
    0000000000000000000000010000000100000001000000010000FFFF0000}
  KeyPreview = True
  OldCreateOrder = False
  ShowHint = True
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alClient
    PanelStyle.Active = True
    PanelStyle.OfficeBackgroundKind = pobkGradient
    TabOrder = 0
    DesignSize = (
      445
      567)
    Height = 567
    Width = 445
    object cxGroupBox6: TcxGroupBox
      Left = 8
      Top = 6
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Par'#226'metros de FTP (Global) '
      ParentColor = False
      Style.Color = clBtnFace
      Style.Shadow = False
      Style.TransparentBorder = True
      TabOrder = 0
      Transparent = True
      Height = 155
      Width = 433
      object cxLabel6: TcxLabel
        Left = 16
        Top = 16
        Caption = 'Nome do HOST ou Endere'#231'o IP'
        Transparent = True
      end
      object cxHostName: TcxDBTextEdit
        Left = 16
        Top = 32
        Hint = 'Servidor de Sa'#237'da SMTP'
        DataBinding.DataField = 'DES_HOST_IP'
        DataBinding.DataSource = dsParametros
        TabOrder = 1
        Width = 409
      end
      object cxLabel7: TcxLabel
        Left = 16
        Top = 56
        Caption = 'Usu'#225'rio'
        Transparent = True
      end
      object cxUsuarioFTP: TcxDBTextEdit
        Left = 16
        Top = 72
        Hint = 'Usu'#225'rio FTP'
        DataBinding.DataField = 'NOM_USUARIO_FTP'
        DataBinding.DataSource = dsParametros
        TabOrder = 3
        Width = 137
      end
      object cxLabel8: TcxLabel
        Left = 288
        Top = 56
        Caption = 'Senha'
        Transparent = True
      end
      object cxSenhaFTP: TcxDBTextEdit
        Left = 288
        Top = 72
        Hint = 'Senha FTP'
        DataBinding.DataField = 'DES_SENHA_FTP'
        DataBinding.DataSource = dsParametros
        Properties.EchoMode = eemPassword
        TabOrder = 5
        Width = 137
      end
      object cxLabel9: TcxLabel
        Left = 16
        Top = 96
        Caption = 'Pasta Remota'
        Transparent = True
      end
      object cxPastaRemota: TcxDBTextEdit
        Left = 16
        Top = 112
        Hint = 'Nome da Pasta Remota no Servidor FTP'
        DataBinding.DataField = 'DES_PASTA_REMOTA'
        DataBinding.DataSource = dsParametros
        TabOrder = 7
        Width = 409
      end
    end
    object cxGroupBox3: TcxGroupBox
      Left = 8
      Top = 170
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Par'#226'metros de E-Mail (Global) '
      ParentColor = False
      Style.Color = clBtnFace
      TabOrder = 1
      Transparent = True
      Height = 175
      Width = 433
      object cxLabel1: TcxLabel
        Left = 16
        Top = 40
        Caption = 'Servidor SMTP'
        Transparent = True
      end
      object cxServidorSMTP: TcxDBTextEdit
        Left = 16
        Top = 56
        Hint = 'Servidor de Sa'#237'da SMTP'
        DataBinding.DataField = 'DES_SERVIDOR_SMTP'
        DataBinding.DataSource = dsParametros
        Properties.CharCase = ecLowerCase
        TabOrder = 1
        Width = 409
      end
      object cxLabel2: TcxLabel
        Left = 16
        Top = 80
        Caption = 'Usu'#225'rio'
        Transparent = True
      end
      object cxUsuarioSMTP: TcxDBTextEdit
        Left = 16
        Top = 96
        Hint = 'Usu'#225'rio Login SMTP'
        DataBinding.DataField = 'DES_USERNAME'
        DataBinding.DataSource = dsParametros
        TabOrder = 3
        Width = 137
      end
      object cxLabel3: TcxLabel
        Left = 288
        Top = 80
        Caption = 'Senha'
        Transparent = True
      end
      object cxSenhaSMTP: TcxDBTextEdit
        Left = 288
        Top = 96
        DataBinding.DataField = 'DES_SENHA'
        DataBinding.DataSource = dsParametros
        Properties.EchoMode = eemPassword
        TabOrder = 5
        Width = 137
      end
      object cxLabel4: TcxLabel
        Left = 16
        Top = 120
        Caption = 'Endere'#231'o de E-Mail Remetente'
        Transparent = True
      end
      object cxEMailRemetente: TcxDBTextEdit
        Left = 16
        Top = 136
        Hint = 'Endere'#231'o de E-Mail do Remetente'
        DataBinding.DataField = 'DES_EMAIL_REMETENTE'
        DataBinding.DataSource = dsParametros
        Properties.CharCase = ecLowerCase
        TabOrder = 7
        Width = 409
      end
      object cxAutSMTP: TcxDBCheckBox
        Left = 8
        Top = 16
        Caption = 'Servidor SMTP requer Autentica'#231#227'o'
        DataBinding.DataField = 'DOM_AUTENTICACAO'
        DataBinding.DataSource = dsParametros
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'S'
        Properties.ValueUnchecked = 'N'
        TabOrder = 8
        Transparent = True
        Width = 217
      end
    end
    object cxGroupBox2: TcxGroupBox
      Left = 8
      Top = 350
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Procedimentos de Usu'#225'rios (Global) '
      ParentColor = False
      Style.Color = clBtnFace
      TabOrder = 2
      Transparent = True
      Height = 59
      Width = 433
      object cxDbCbHistorico: TcxDBCheckBox
        Left = 8
        Top = 24
        Hint = 
          'Com essa op'#231#227'o ativa, todas as inclus'#245'es, exclus'#245'es e edi'#231#245'es se' +
          'r'#227'o '#13#10'registradas pelo sistema, permitindo o acompanhamento dos ' +
          'procedimentos'#13#10'dos usu'#225'rios no banco de dados.'#13#10'Peri'#243'dicamente, ' +
          'o administrador do sistema dever'#225' efetuar uma "limpeza" '#13#10'na tab' +
          'ela de registros do Hist'#243'rico.'
        Caption = 'Ativar Hist'#243'rico de Tabelas'
        DataBinding.DataField = 'DOM_HISTORICO'
        DataBinding.DataSource = dsParametros
        Properties.NullStyle = nssUnchecked
        TabOrder = 0
        Transparent = True
        Width = 225
      end
      object cxDBCheckBox1: TcxDBCheckBox
        Left = 184
        Top = 24
        Hint = 
          'Com essa op'#231#227'o ativa, ser'#227'o registrados os Logins dos usu'#225'rios n' +
          'o sistema.'
        Caption = 'Ativar Controle de Usu'#225'rios Logados'
        DataBinding.DataField = 'DOM_USUARIO_LOGADO'
        DataBinding.DataSource = dsParametros
        Properties.NullStyle = nssUnchecked
        TabOrder = 1
        Transparent = True
        Width = 225
      end
    end
    object cxButton1: TcxButton
      Left = 8
      Top = 507
      Width = 433
      Height = 25
      Action = actSalvarSair
      Anchors = [akLeft, akTop, akRight]
      OptionsImage.ImageIndex = 9
      OptionsImage.Images = dm.cxImageList1
      TabOrder = 3
    end
    object cxButton2: TcxButton
      Left = 8
      Top = 536
      Width = 433
      Height = 25
      Action = actSair
      Anchors = [akLeft, akTop, akRight]
      OptionsImage.ImageIndex = 10
      OptionsImage.Images = dm.cxImageList1
      TabOrder = 4
    end
    object cxButton3: TcxButton
      Left = 8
      Top = 477
      Width = 433
      Height = 25
      Action = actBancoDados
      Anchors = [akLeft, akTop, akRight]
      OptionsImage.ImageIndex = 35
      OptionsImage.Images = dm.cxImageList1
      TabOrder = 5
    end
    object cxGroupBox4: TcxGroupBox
      Left = 7
      Top = 413
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Apar'#234'ncia '
      ParentColor = False
      Style.Color = clBtnFace
      TabOrder = 6
      Transparent = True
      Height = 59
      Width = 433
      object cxLabel5: TcxLabel
        Left = 56
        Top = 27
        Caption = 'Skin: '
        Transparent = True
      end
      object cxSkinName: TcxDBComboBox
        Left = 88
        Top = 24
        Hint = 'Nome da Skin'
        DataBinding.DataField = 'NOM_SKIN'
        DataBinding.DataSource = dsParametros
        Properties.Items.Strings = (
          'Black'
          'Blue'
          'Blueprint'
          'Caramel'
          'Coffe'
          'Darkroom'
          'DarkSide'
          'DevExpressDarkStyle'
          'DevExpressStyle'
          'Foggy'
          'GlassOceans'
          'HighContrast'
          'iMaginary'
          'Lilian'
          'LiquidSky'
          'LondonLiquidSky'
          'McSkin'
          'MoneyTwins'
          'Office2007Black'
          'Office2007Blue'
          'Office2007Green'
          'Office2007Pink'
          'Office2007Silver'
          'Office2010Black'
          'Office2010Blue'
          'Office2010Silver'
          'Pumpkin'
          'Seven'
          'SevenClassic'
          'Sharp'
          'SharpPlus'
          'Silver'
          'Springtime'
          'Stardust'
          'Summer2008'
          'TheAsphaltWorld'
          'Valentine'
          'VS2010'
          'Whiteprint'
          'Xmas2008Blue')
        TabOrder = 1
        Width = 225
      end
    end
  end
  object dsParametros: TDataSource
    DataSet = dm.tbParametros
    Left = 352
  end
  object aclParametros: TActionList
    Left = 384
    object actSalvarSair: TAction
      Category = 'Par'#226'metros'
      Caption = 'Sal&var e Sair'
      Hint = 'Salvar os dados e Sair da Tela de Par'#226'metros'
      OnExecute = actSalvarSairExecute
    end
    object actSair: TAction
      Category = 'Par'#226'metros'
      Caption = '&Sair'
      Hint = 'Sair da tela de Par'#226'metros'
      OnExecute = actSairExecute
    end
    object actOK: TAction
      Category = 'Par'#226'metros'
      Caption = 'Ok'
      Hint = 'Atribui a Pasta Seleionada'
    end
    object actSairPasta: TAction
      Category = 'Par'#226'metros'
      Caption = 'S&air'
      Hint = 'Sair da sele'#231#227'o de pastas'
    end
    object actBancoDados: TAction
      Category = 'Par'#226'metros'
      Caption = '&Banco de Dados'
      Hint = 'Selecionar o Arquivo de Banco de Dados'
      OnExecute = actBancoDadosExecute
    end
  end
  object dsParLocal: TDataSource
    DataSet = dm.tbParLocal
    Left = 320
  end
  object SaveDialog1: TSaveDialog
    FileName = 'NCMConsulta.inf'
    Filter = '*.inf|*.inf'
    Title = 'Salvar Arquivos de Inicializa'#231#227'o'
    Left = 280
  end
end
