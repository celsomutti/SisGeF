object view_ExtraviosMultas: Tview_ExtraviosMultas
  Left = 0
  Top = 0
  Caption = 'Extravios de Produtos e Multas'
  ClientHeight = 543
  ClientWidth = 1075
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  ShowHint = True
  Visible = True
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 1075
    Height = 543
    Align = alClient
    TabOrder = 0
    LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
    object cxLabel1: TcxLabel
      Left = 10
      Top = 10
      Caption = 'Extravios de Produtos e Multas'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -19
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.IsFontAssigned = True
      Transparent = True
    end
    object txtNossoNumero: TcxTextEdit
      Left = 20
      Top = 85
      Hint = 'Nosso n'#250'mero'
      ParentFont = False
      Properties.OnValidate = txtNossoNumeroPropertiesValidate
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.Shadow = False
      Style.IsFontAssigned = True
      TabOrder = 1
      Width = 141
    end
    object cboTipo: TcxComboBox
      Left = 167
      Top = 85
      Hint = 'Tipo de D'#233'bito'
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'EXTRAVIO'
        'SINISTRO'
        'MULTA')
      Properties.OnValidate = cboTipoPropertiesValidate
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 2
      Width = 121
    end
    object cboMotivo: TcxComboBox
      Left = 294
      Top = 85
      Hint = 'Selecione ou informe o motivo do extravio ou da multa'
      ParentFont = False
      Properties.Items.Strings = (
        '01-ENTREGA LOCAL INDEVIDO'
        '02-CORREIO INTERNO'
        '03-EMBALGEM VIOLADA'
        '04-EMBALAGEM LACRADA'
        '05-ENTREGA RESOLVIDA'
        '06-PRODUTO AVARIADO'
        '07-PRODUTO N'#195'O ENTREGUE'
        '08-PRODUTO INCOMPLETO'
        '09-DEVOLU'#199#195'O DA DECLARA'#199#195'O'
        '10-EXTRAVIO - FALTA DE RETORNO'
        '11-PERDEU O PRAZO PARA DEFESA'
        '12-EXTRAVIO-ENTREGA N'#195'O COMPROVADA'
        '13-AVARIA DO PRODUTO NA TRANSFER'#202'NCIA'#9
        '14-AVARIA NA DEVOLU'#199#195'O'#9
        '15-EXTRAVIO PARCIAL'#9
        '16-FALHA DO CONTROLE '#9
        '17-FOR'#199'ADO POR ATRASO'#9
        '18-FOR'#199'ADO POR PERDA DO PRODUTO'#9
        '19-FURTO INTERNO NA FRANQUIA'#9
        '20-LR - PRODUTO COLETADO FORA DOS PADR'#213'ES'#9
        '21-FALTA NO CONTAINER OU ROMANEIO  S/ ANOTA'#199#195'O NO ROMANEIO'
        '22-MULTA POR ENTREGA EM LOCAL INDEVIDO'
        '23-MULTA POR PROTOCOLO RASURADO/INCORRETO'
        '24-EXTRAVIO NA IDA - TFO')
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 3
      Width = 251
    end
    object datExtravio: TcxDateEdit
      Left = 551
      Top = 85
      ParentFont = False
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 4
      Width = 121
    end
    object txtNomeEntregador: TcxTextEdit
      Left = 767
      Top = 85
      ParentFont = False
      Properties.ReadOnly = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 6
      Width = 121
    end
    object txtCodigoEntregador: TcxButtonEdit
      Left = 678
      Top = 85
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.Buttons = <
        item
          Action = actPesquisaEntregador
          Default = True
          Kind = bkGlyph
        end>
      Properties.Images = dm.iml16x16
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d\d\d\d\d\d'
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 5
      Text = '0'
      Width = 83
    end
    object dblValorProduto: TcxCurrencyEdit
      Left = 107
      Top = 149
      Hint = 'Valor do produto'
      EditValue = 0.000000000000000000
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.OnValidate = dblValorProdutoPropertiesValidate
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 7
      Width = 121
    end
    object dblMulta: TcxCurrencyEdit
      Left = 107
      Top = 176
      Hint = 'Valto da Multa'
      EditValue = 0.000000000000000000
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.OnValidate = dblMultaPropertiesValidate
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 8
      Width = 121
    end
    object dblVerba: TcxCurrencyEdit
      Left = 107
      Top = 203
      Hint = 'Valor da verba'
      EditValue = 0.000000000000000000
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.OnValidate = dblVerbaPropertiesValidate
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 9
      Width = 121
    end
    object dblTotalExtravio: TcxCurrencyEdit
      Left = 107
      Top = 230
      EditValue = 0.000000000000000000
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.ReadOnly = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 10
      Width = 121
    end
    object cboCorrespondencia: TcxComboBox
      Left = 340
      Top = 149
      Hint = 'Envio da correspond'#234'ncia'
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'ENVIADA'
        'N'#195'O ENVIADA')
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 12
      Width = 121
    end
    object cboRetorno: TcxComboBox
      Left = 340
      Top = 176
      Hint = 'Retorno da Correspond'#234'ncia'
      ParentFont = False
      Properties.Items.Strings = (
        'N'#195'O FOI DEVOLVIDA'
        'DEVOLVIDA POR MALOTE INTERNO'
        'DEVOLVIDA POR CORREIO'
        'DEVOLVIDA PESSOALMENTE'
        'DEVOLVIDA DIGITALIZADA POR E-MAIL')
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 13
      Width = 157
    end
    object memObservacoes: TcxMemo
      Left = 254
      Top = 221
      Hint = 'Observa'#231#245'es sobre o extravio/multa'
      Lines.Strings = (
        '')
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 14
      Height = 55
      Width = 403
    end
    object chkRestricao: TcxCheckBox
      Left = 107
      Top = 257
      Hint = 'Valor gerou restri'#231#227'o'
      ParentFont = False
      Properties.ReadOnly = True
      Properties.ValueChecked = 'S'
      Properties.ValueGrayed = 'E'
      Properties.ValueUnchecked = 'N'
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 11
      Transparent = True
    end
    object chkFranquia: TcxCheckBox
      Left = 791
      Top = 149
      Hint = 'Valor debitado da franquia'
      ParentFont = False
      Properties.ReadOnly = True
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'N'
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 15
      Transparent = True
    end
    object dblValorDebitado: TcxCurrencyEdit
      Left = 791
      Top = 174
      Hint = 'Valor debitado da franquia'
      EditValue = 0.000000000000000000
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.ReadOnly = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 16
      Width = 121
    end
    object datDebitoFranquia: TcxDateEdit
      Left = 791
      Top = 201
      Hint = 'Data do d'#233'bito para a franquia'
      ParentFont = False
      Properties.ReadOnly = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 17
      Width = 121
    end
    object sbExtravios: TdxStatusBar
      Left = 10
      Top = 513
      Width = 0
      Height = 20
      Panels = <
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Fixed = False
        end
        item
          PanelStyleClassName = 'TdxStatusBarContainerPanelStyle'
          PanelStyle.Container = sbExtraviosContainer1
          Bevel = dxpbNone
          Width = 200
        end>
      PaintStyle = stpsUseLookAndFeel
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      object sbExtraviosContainer1: TdxStatusBarContainerControl
        Left = 24
        Top = 2
        Width = 202
        Height = 17
        object pbExtravios: TcxProgressBar
          Left = 0
          Top = 0
          Hint = 'Percentual debitado'
          Align = alClient
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 0
          Visible = False
          Width = 202
        end
      end
    end
    object cxButton1: TcxButton
      Left = 10
      Top = 482
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Action = actIncluir
      TabOrder = 19
    end
    object cxButton2: TcxButton
      Left = 91
      Top = 482
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Action = actPesquisar
      TabOrder = 20
    end
    object cxButton3: TcxButton
      Left = 172
      Top = 482
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Action = actFiltrar
      TabOrder = 21
    end
    object cxButton4: TcxButton
      Left = 253
      Top = 482
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Action = actEstornar
      TabOrder = 22
    end
    object cxButton5: TcxButton
      Left = 334
      Top = 482
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Action = actEditar
      TabOrder = 23
    end
    object cxButton6: TcxButton
      Left = 415
      Top = 482
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Action = actCancelar
      TabOrder = 24
    end
    object cxButton7: TcxButton
      Left = 496
      Top = 482
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Action = actDeclaracao
      TabOrder = 25
    end
    object cxButton8: TcxButton
      Left = 577
      Top = 482
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Action = actGravar
      TabOrder = 26
    end
    object cxButton9: TcxButton
      Left = 658
      Top = 482
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Action = actFinalizar
      TabOrder = 27
    end
    object cxButton10: TcxButton
      Left = 990
      Top = 482
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Action = actFechar
      TabOrder = 28
    end
    object pbPercentual: TcxProgressBar
      Left = 791
      Top = 228
      TabOrder = 18
      Width = 121
    end
    object dxLayoutControl1Group_Root: TdxLayoutGroup
      AlignHorz = ahParentManaged
      AlignVert = avParentManaged
      LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignVert = avTop
      CaptionOptions.Text = 'cxLabel1'
      CaptionOptions.Visible = False
      LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
      Control = cxLabel1
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup1: TdxLayoutGroup
      Parent = dxLayoutControl1Group_Root
      CaptionOptions.Text = 'Identifica'#231#227'o'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      Index = 1
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = 'Nosso N'#250'mero'
      CaptionOptions.Layout = clTop
      Control = txtNossoNumero
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahLeft
      AlignVert = avClient
      CaptionOptions.Text = 'Tipo'
      CaptionOptions.Layout = clTop
      Control = cboTipo
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignVert = avClient
      CaptionOptions.Text = 'Motivo do Extravio/Multa'
      CaptionOptions.Layout = clTop
      Control = cboMotivo
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup1
      CaptionOptions.Text = 'Data do Extravio'
      CaptionOptions.Layout = clTop
      Control = datExtravio
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahClient
      CaptionOptions.Text = 'Nome'
      CaptionOptions.Layout = clTop
      Control = txtNomeEntregador
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup1
      CaptionOptions.Text = 'Entregador'
      CaptionOptions.Layout = clTop
      Control = txtCodigoEntregador
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutGroup2: TdxLayoutGroup
      Parent = dxLayoutAutoCreatedGroup1
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Valores'
      ButtonOptions.Buttons = <>
      Index = 0
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'Valor do Produto'
      Control = dblValorProduto
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'Valor da Multa'
      Control = dblMulta
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'Valor da Verba'
      Control = dblVerba
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem11: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'Total do Extravio'
      Control = dblTotalExtravio
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutGroup3: TdxLayoutGroup
      Parent = dxLayoutAutoCreatedGroup1
      CaptionOptions.Text = 'Aviso / Observa'#231'oes'
      ButtonOptions.Buttons = <>
      Index = 1
    end
    object dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutControl1Group_Root
      LayoutDirection = ldHorizontal
      Index = 2
      AutoCreated = True
    end
    object dxLayoutItem12: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = 'Correspond'#234'ncia'
      Control = cboCorrespondencia
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem13: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = 'Retorno'
      Control = cboRetorno
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem14: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = 'Oberva'#231#245'es'
      CaptionOptions.Layout = clTop
      Control = memObservacoes
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem15: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'Finalizado'
      Control = chkRestricao
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutGroup4: TdxLayoutGroup
      Parent = dxLayoutAutoCreatedGroup1
      AlignHorz = ahClient
      CaptionOptions.Text = 'Franquia'
      ButtonOptions.Buttons = <>
      Index = 2
    end
    object dxLayoutItem16: TdxLayoutItem
      Parent = dxLayoutGroup4
      CaptionOptions.Text = 'Debitado da Franquia'
      Control = chkFranquia
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem17: TdxLayoutItem
      Parent = dxLayoutGroup4
      CaptionOptions.Text = 'Valor Debitado'
      Control = dblValorDebitado
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem18: TdxLayoutItem
      Parent = dxLayoutGroup4
      CaptionOptions.Text = 'Data D'#233'bito'
      Control = datDebitoFranquia
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem20: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignVert = avBottom
      CaptionOptions.Text = 'Barra de Status'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      Control = sbExtravios
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem21: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup2
      AlignHorz = ahLeft
      AlignVert = avBottom
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = cxButton1
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem22: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup2
      AlignVert = avClient
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      Control = cxButton2
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutAutoCreatedGroup2: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutControl1Group_Root
      AlignVert = avBottom
      LayoutDirection = ldHorizontal
      Index = 3
      AutoCreated = True
    end
    object dxLayoutItem23: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup2
      CaptionOptions.Text = 'cxButton3'
      CaptionOptions.Visible = False
      Control = cxButton3
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem24: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup2
      CaptionOptions.Text = 'cxButton4'
      CaptionOptions.Visible = False
      Control = cxButton4
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem25: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup2
      CaptionOptions.Text = 'cxButton5'
      CaptionOptions.Visible = False
      Control = cxButton5
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem26: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup2
      CaptionOptions.Text = 'cxButton6'
      CaptionOptions.Visible = False
      Control = cxButton6
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutItem27: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup2
      CaptionOptions.Text = 'cxButton7'
      CaptionOptions.Visible = False
      Control = cxButton7
      ControlOptions.ShowBorder = False
      Index = 6
    end
    object dxLayoutItem28: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup2
      CaptionOptions.Text = 'cxButton8'
      CaptionOptions.Visible = False
      Control = cxButton8
      ControlOptions.ShowBorder = False
      Index = 7
    end
    object dxLayoutItem29: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup2
      CaptionOptions.Text = 'cxButton9'
      CaptionOptions.Visible = False
      Control = cxButton9
      ControlOptions.ShowBorder = False
      Index = 8
    end
    object dxLayoutItem30: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup2
      AlignHorz = ahRight
      CaptionOptions.Text = 'cxButton10'
      CaptionOptions.Visible = False
      Control = cxButton10
      ControlOptions.ShowBorder = False
      Index = 9
    end
    object dxLayoutItem19: TdxLayoutItem
      Parent = dxLayoutGroup4
      CaptionOptions.Text = 'Percentual Debitado'
      Control = pbPercentual
      ControlOptions.ShowBorder = False
      Index = 3
    end
  end
  object aclExtravios: TActionList
    Images = dm.iml16x16
    Left = 912
    Top = 8
    object actIncluir: TAction
      Category = 'Extravios'
      Caption = 'Incluir'
      Hint = 'Incluir extravio'
      ImageIndex = 0
      OnExecute = actIncluirExecute
    end
    object actPesquisar: TAction
      Category = 'Extravios'
      Caption = 'Pesquisar'
      Hint = 'Pesquisar dados'
      ImageIndex = 38
      OnExecute = actPesquisarExecute
    end
    object actFiltrar: TAction
      Category = 'Extravios'
      Caption = 'Filtrar'
      Hint = 'Filtrar dados'
      ImageIndex = 41
      OnExecute = actFiltrarExecute
    end
    object actEstornar: TAction
      Category = 'Extravios'
      Caption = 'Estornar'
      Hint = 'Estornar extravio / multa'
      ImageIndex = 16
      OnExecute = actEstornarExecute
    end
    object actEditar: TAction
      Category = 'Extravios'
      Caption = 'Editar'
      Hint = 'Editar dados'
      ImageIndex = 46
      OnExecute = actEditarExecute
    end
    object actCancelar: TAction
      Category = 'Extravios'
      Caption = 'Cancelar'
      Hint = 'Cancelar opera'#231#227'o atual'
      ImageIndex = 4
      OnExecute = actCancelarExecute
    end
    object actImportar: TAction
      Category = 'Extravios'
      Caption = 'Importar'
      Hint = 'Importar extravios'
      ImageIndex = 47
    end
    object actGravar: TAction
      Category = 'Extravios'
      Caption = 'Gravar'
      Hint = 'Gravar dados'
      ImageIndex = 32
      OnExecute = actGravarExecute
    end
    object actFinalizar: TAction
      Category = 'Extravios'
      Caption = 'Finalizar'
      Hint = 'Finalizar extravio'
      ImageIndex = 3
      OnExecute = actFinalizarExecute
    end
    object actFechar: TAction
      Category = 'Extravios'
      Caption = 'Fechar'
      Hint = 'Fechar a tela'
      ImageIndex = 6
      OnExecute = actFecharExecute
    end
    object actPesquisaEntregador: TAction
      Category = 'Extravios'
      Caption = 'Pesquisa Entregador'
      Hint = 'Pesquisar entregador'
      ImageIndex = 38
      OnExecute = actPesquisaEntregadorExecute
    end
    object actDeclaracao: TAction
      Category = 'Extravios'
      Caption = 'Declara'#231#227'o'
      Hint = 'Imprimir Declara'#231#227'o'
      ImageIndex = 42
      OnExecute = actDeclaracaoExecute
    end
  end
  object frxDeclaracao: TfrxReport
    Version = '5.3.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43152.700742719900000000
    ReportOptions.LastChange = 43158.602386458340000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 824
    Top = 8
    Datasets = <>
    Variables = <
      item
        Name = ' Declara'#231#227'o'
        Value = Null
      end
      item
        Name = 'vAgente'
        Value = ''
      end
      item
        Name = 'vEntregador'
        Value = ''
      end
      item
        Name = 'vNN'
        Value = ''
      end
      item
        Name = 'vValor'
        Value = ''
      end
      item
        Name = 'vMulta'
        Value = ''
      end
      item
        Name = 'vVerba'
        Value = ''
      end
      item
        Name = 'vData'
        Value = ''
      end
      item
        Name = 'vImpressao'
        Value = ''
      end
      item
        Name = 'vCPF'
        Value = ''
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      BackPictureStretched = False
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 102.047310000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
      end
      object Memo1: TfrxMemoView
        Top = 166.299320000000000000
        Width = 718.110700000000000000
        Height = 18.897650000000000000
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        HAlign = haCenter
        Memo.UTF8W = (
          'Declara'#231#227'o de Multa e/ou Extravio de Produto')
        ParentFont = False
      end
      object Memo2: TfrxMemoView
        Left = 75.590599999999990000
        Top = 219.212740000000000000
        Width = 151.181200000000000000
        Height = 170.078850000000000000
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        Memo.UTF8W = (
          'Agente: '
          'Entregador: '
          ''
          'Nosso N'#250'mero: '
          ''
          'Valor do Produto: '
          'Valor da Multa: '
          'Valor da Verba:  ')
        ParentFont = False
      end
      object Memo4: TfrxMemoView
        Left = 75.590600000000000000
        Top = 442.205010000000000000
        Width = 559.370440000000000000
        Height = 294.803340000000000000
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Calibri'
        Font.Style = []
        HAlign = haBlock
        LineSpacing = 40.000000000000000000
        Memo.UTF8W = (
          
            '                              Declaro para os devidos fins que o' +
            ' NN acima com seu(s) respectivo(s) valor(es) '#233' de minha inteira ' +
            'responsabilidade ficando a Franquia desde j'#225' autorizada a descon' +
            'tar da minha Presta'#231#227'o de Contas a que tempo lhe convir. ')
        ParentFont = False
      end
      object Memo5: TfrxMemoView
        Left = 75.590600000000000000
        Top = 680.315400000000000000
        Width = 559.370440000000000000
        Height = 200.315090000000000000
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Calibri'
        Font.Style = []
        HAlign = haBlock
        Memo.UTF8W = (
          '[vData]'
          ''
          ''
          ''
          ''
          ''
          '____________________________________________'
          '[vEntregador]'
          '[vCPF]')
        ParentFont = False
      end
      object Memo6: TfrxMemoView
        Left = 3.779530000000000000
        Top = 1028.032160000000000000
        Width = 714.331170000000000000
        Height = 18.897650000000000000
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial Narrow'
        Font.Style = []
        Memo.UTF8W = (
          '[vImpressao]')
        ParentFont = False
      end
      object vAgente: TfrxMemoView
        Left = 249.448980000000000000
        Top = 215.433210000000000000
        Width = 400.630180000000000000
        Height = 22.677180000000000000
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Calibri'
        Font.Style = []
        Memo.UTF8W = (
          '[vAgente]')
        ParentFont = False
      end
      object vEntregador: TfrxMemoView
        Left = 249.448980000000000000
        Top = 238.110390000000000000
        Width = 400.630180000000000000
        Height = 41.574830000000000000
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Calibri'
        Font.Style = []
        Memo.UTF8W = (
          '[vEntregador]')
        ParentFont = False
      end
      object vNN: TfrxMemoView
        Left = 249.448980000000000000
        Top = 283.464750000000000000
        Width = 400.630180000000000000
        Height = 22.677180000000000000
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Calibri'
        Font.Style = []
        Memo.UTF8W = (
          '[vNN]')
        ParentFont = False
      end
      object vValor: TfrxMemoView
        Left = 249.448980000000000000
        Top = 317.480520000000000000
        Width = 400.630180000000000000
        Height = 22.677180000000000000
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Calibri'
        Font.Style = []
        Memo.UTF8W = (
          '[vValor]')
        ParentFont = False
      end
      object vMulta: TfrxMemoView
        Left = 249.448980000000000000
        Top = 343.937230000000000000
        Width = 400.630180000000000000
        Height = 18.897650000000000000
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Calibri'
        Font.Style = []
        Memo.UTF8W = (
          '[vMulta]')
        ParentFont = False
      end
      object vVerba: TfrxMemoView
        Left = 249.448980000000000000
        Top = 366.614410000000000000
        Width = 400.630180000000000000
        Height = 22.677180000000000000
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Calibri'
        Font.Style = []
        Memo.UTF8W = (
          '[vVerba]')
        ParentFont = False
      end
    end
  end
end
