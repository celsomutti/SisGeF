object frmFiltro: TfrmFiltro
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Filtro'
  ClientHeight = 305
  ClientWidth = 697
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    697
    305)
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alTop
    Caption = 'Par'#226'metros'
    TabOrder = 0
    DesignSize = (
      691
      111)
    Height = 118
    Width = 691
    object cxValorEm: TcxMemo
      Left = 64
      Top = 59
      Properties.ScrollBars = ssVertical
      TabOrder = 7
      Visible = False
      Height = 49
      Width = 393
    end
    object cxLabel1: TcxLabel
      Left = 128
      Top = 16
      Caption = 'Campo'
      Transparent = True
    end
    object cxCampos: TcxComboBox
      Left = 128
      Top = 32
      Anchors = [akLeft, akTop, akRight]
      Properties.DropDownListStyle = lsFixedList
      Properties.OnCloseUp = cxCamposPropertiesCloseUp
      TabOrder = 0
      Width = 193
    end
    object cxLabel2: TcxLabel
      Left = 327
      Top = 16
      Caption = 'Opera'#231#227'o'
      Transparent = True
    end
    object cxOperacao: TcxComboBox
      Left = 327
      Top = 32
      Anchors = [akTop, akRight]
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'igual a'
        'maior que'
        'maior ou igual a'
        'menor que'
        'menor ou igual a'
        'iniciando com'
        'terminando com'
        'contendo'
        'em'
        'entre'
        'diferente de')
      Properties.OnCloseUp = cxOperacaoPropertiesCloseUp
      TabOrder = 1
      Width = 130
    end
    object cxLabel3: TcxLabel
      Left = 11
      Top = 16
      Caption = 'Concord'#226'ncia'
      Transparent = True
    end
    object cxConcordancia: TcxComboBox
      Left = 11
      Top = 32
      Enabled = False
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'e'
        'ou')
      TabOrder = 2
      Width = 111
    end
    object cxLabel4: TcxLabel
      Left = 11
      Top = 59
      Caption = 'Valor(es)'
      Transparent = True
    end
    object cxValor: TcxMaskEdit
      Left = 11
      Top = 79
      Hint = 'Valor do par'#226'metro'
      Anchors = [akLeft, akTop, akRight]
      Properties.IgnoreMaskBlank = True
      Properties.MaskKind = emkRegExpr
      TabOrder = 3
      Width = 238
    end
    object cxButton1: TcxButton
      Left = 610
      Top = 77
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Action = actFiltroAdicionar
      Anchors = [akRight, akBottom]
      TabOrder = 8
    end
    object cxValorFinal: TcxMaskEdit
      Left = 255
      Top = 79
      Hint = 'Valor Final do par'#226'metro'
      Anchors = [akLeft, akTop, akRight]
      Properties.IgnoreMaskBlank = True
      Properties.MaskKind = emkRegExpr
      TabOrder = 4
      Visible = False
      Width = 238
    end
  end
  object cxGroupBox2: TcxGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 127
    Align = alTop
    Caption = 'Parametriza'#231#227'o do Filtro'
    TabOrder = 1
    DesignSize = (
      691
      136)
    Height = 143
    Width = 691
    object cxTextoFiltro: TcxListBox
      AlignWithMargins = True
      Left = 6
      Top = 18
      Width = 679
      Height = 63
      Align = alTop
      Anchors = [akLeft, akTop, akRight, akBottom]
      ItemHeight = 13
      TabOrder = 0
    end
    object cxButton2: TcxButton
      Left = 610
      Top = 87
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Action = actFiltroExcluirLinha
      Anchors = [akRight, akBottom]
      TabOrder = 1
    end
  end
  object cxButton3: TcxButton
    Left = 538
    Top = 276
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Action = actFiltroExecutar
    Anchors = [akRight, akBottom]
    Default = True
    TabOrder = 2
  end
  object cxButton4: TcxButton
    Left = 619
    Top = 276
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Action = actFiltroCancelar
    Anchors = [akRight, akBottom]
    Cancel = True
    TabOrder = 3
  end
  object cxTextoSQL: TcxCheckBox
    Left = 8
    Top = 276
    Caption = 'Texto SQL'
    Properties.OnChange = cxTextoSQLPropertiesChange
    TabOrder = 4
    Transparent = True
  end
  object aclFiltro: TActionList
    Left = 504
    object actFiltroAdicionar: TAction
      Category = 'Filtro'
      Caption = 'Adicionar'
      Hint = 'Adicionar par'#226'metro ao filtro'
      OnExecute = actFiltroAdicionarExecute
    end
    object actFiltroExcluirLinha: TAction
      Category = 'Filtro'
      Caption = 'Excluir Linha'
      Hint = 'Excluir linha da descri'#231#227'o do filtro'
      OnExecute = actFiltroExcluirLinhaExecute
    end
    object actFiltroExecutar: TAction
      Category = 'Filtro'
      Caption = 'Executar'
      Hint = 'Excutar Filtro'
      OnExecute = actFiltroExecutarExecute
    end
    object actFiltroCancelar: TAction
      Category = 'Filtro'
      Caption = 'Cancelar'
      Hint = 'Cancelar filtro'
      OnExecute = actFiltroCancelarExecute
    end
  end
end
