object frmAcareacoes: TfrmAcareacoes
  Left = 0
  Top = 0
  Caption = 'Acarea'#231#245'es'
  ClientHeight = 527
  ClientWidth = 980
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    980
    527)
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel27: TcxLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alTop
    AutoSize = False
    Caption = 'Acarea'#231#245'es'
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -21
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Properties.Alignment.Vert = taVCenter
    Transparent = True
    Height = 38
    Width = 974
    AnchorY = 22
  end
  object cxGrid1: TcxGrid
    Left = 2
    Top = 47
    Width = 974
    Height = 417
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      OnCanFocusRecord = cxGrid1DBTableView1CanFocusRecord
      DataController.DataSource = dsAcareacoes
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NewItemRow.InfoText = 'Clique aqui para Incluir'
      OptionsBehavior.CopyCaptionsToClipboard = False
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.FocusFirstCellOnNewRecord = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.CopyPreviewToClipboard = False
      OptionsSelection.InvertSelect = False
      OptionsSelection.MultiSelect = True
      OptionsSelection.CellMultiSelect = True
      OptionsView.NoDataToDisplayInfoText = '<Nenhuma informa'#231#227'o dispon'#237'vel>'
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object cxGrid1DBTableView1ID_ACAREACAO: TcxGridDBColumn
        Caption = 'ID'
        DataBinding.FieldName = 'ID_ACAREACAO'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.OnValidate = cxGrid1DBTableView1ID_ACAREACAOPropertiesValidate
        HeaderAlignmentHorz = taCenter
        Width = 119
      end
      object cxGrid1DBTableView1DAT_ACAREACAO: TcxGridDBColumn
        Caption = 'Data'
        DataBinding.FieldName = 'DAT_ACAREACAO'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.ReadOnly = True
        Properties.OnValidate = cxGrid1DBTableView1DAT_ACAREACAOPropertiesValidate
        HeaderAlignmentHorz = taCenter
        Width = 92
      end
      object cxGrid1DBTableView1NUM_NOSSONUMERO: TcxGridDBColumn
        Caption = 'Nosso N'#250'mero'
        DataBinding.FieldName = 'NUM_NOSSONUMERO'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.IgnoreMaskBlank = True
        Properties.MaskKind = emkRegExpr
        Properties.EditMask = '\d\d\d\d\d\d\d\d\d\d\d\d\d\d'
        Properties.OnValidate = cxGrid1DBTableView1NUM_NOSSONUMEROPropertiesValidate
        HeaderAlignmentHorz = taCenter
        Width = 106
      end
      object cxGrid1DBTableView1COD_ENTREGADOR: TcxGridDBColumn
        Caption = 'Entregador'
        DataBinding.FieldName = 'COD_ENTREGADOR'
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.IgnoreMaskBlank = True
        Properties.MaskKind = emkRegExpr
        Properties.EditMask = '\d\d\d\d\d\d'
        Properties.OnValidate = cxGrid1DBTableView1COD_ENTREGADORPropertiesValidate
        HeaderAlignmentHorz = taCenter
        Width = 86
      end
      object cxGrid1DBTableView1NOM_ENTREGADOR: TcxGridDBColumn
        Tag = -1
        Caption = 'Nome'
        DataBinding.FieldName = 'NOM_ENTREGADOR'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 144
      end
      object cxGrid1DBTableView1COD_BASE: TcxGridDBColumn
        Caption = 'Base'
        DataBinding.FieldName = 'COD_BASE'
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.IgnoreMaskBlank = True
        Properties.MaskKind = emkRegExpr
        Properties.EditMask = '\d\d\d\d\d\d'
        Properties.OnValidate = cxGrid1DBTableView1COD_BASEPropertiesValidate
        HeaderAlignmentHorz = taCenter
        Width = 59
      end
      object cxGrid1DBTableView1DES_MOTIVO: TcxGridDBColumn
        Caption = 'Motivo'
        DataBinding.FieldName = 'DES_MOTIVO'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.ImmediateDropDownWhenActivated = True
        Properties.Items.Strings = (
          'EMBALAGEM VAZIA'
          'ITEM FALTANTE'
          'N'#195'O RECEBIMENTO'
          'PRODUTO DIFERENTE DO SOLICITADO'
          'RECEBEDOR DESCONHECIDO')
        Properties.OnValidate = cxGrid1DBTableView1DES_MOTIVOPropertiesValidate
        HeaderAlignmentHorz = taCenter
        Width = 146
      end
      object cxGrid1DBTableView1DES_TRATATIVA: TcxGridDBColumn
        Caption = 'Tratativa'
        DataBinding.FieldName = 'DES_TRATATIVA'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.ImmediateDropDownWhenActivated = True
        Properties.Items.Strings = (
          'ENVIAR A DECLARA'#199#195'O'
          'REALIZAR AUDIO'
          'ENVIO DE E-MAIL CONSTATANDO'
          'ENVIO DE E-MAIL RECORRENDO'
          'APURA'#199#195'O FEITA PELO CONTROLE'
          'SOMENTE RELATO')
        Properties.OnValidate = cxGrid1DBTableView1DES_TRATATIVAPropertiesValidate
        HeaderAlignmentHorz = taCenter
        Width = 120
      end
      object cxGrid1DBTableView1DES_APURACAO: TcxGridDBColumn
        Caption = 'Apura'#231#227'o'
        DataBinding.FieldName = 'DES_APURACAO'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.ImmediateDropDownWhenActivated = True
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
          '12-EXTRAVIO-ENTREGA N'#195'O COMPROVADA')
        Properties.OnValidate = cxGrid1DBTableView1DES_APURACAOPropertiesValidate
        HeaderAlignmentHorz = taCenter
        Width = 122
      end
      object cxGrid1DBTableView1DES_RESULTADO: TcxGridDBColumn
        Caption = 'Resultado'
        DataBinding.FieldName = 'DES_RESULTADO'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.ImmediateDropDownWhenActivated = True
        Properties.Items.Strings = (
          '01-ACAREA'#199#195'O RESOLVIDA'
          '02-BAIXADA COMO EXTRAVIO'
          '03-BAIXADA COMO EXTRAVIO + MULTA'
          '04-MULTA')
        Properties.OnValidate = cxGrid1DBTableView1DES_RESULTADOPropertiesValidate
        HeaderAlignmentHorz = taCenter
        Width = 123
      end
      object cxGrid1DBTableView1VAL_EXTRAVIO: TcxGridDBColumn
        Caption = 'Val. Extravio'
        DataBinding.FieldName = 'VAL_EXTRAVIO'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ' ,0.00;- ,0.00'
        HeaderAlignmentHorz = taCenter
        Width = 80
      end
      object cxGrid1DBTableView1VAL_MULTA: TcxGridDBColumn
        Caption = 'Multa'
        DataBinding.FieldName = 'VAL_MULTA'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ' ,0.00;- ,0.00'
        HeaderAlignmentHorz = taCenter
        Width = 64
      end
      object cxGrid1DBTableView1DES_ENVIO_CORRESPONDENCIA: TcxGridDBColumn
        Caption = 'Correspondencia'
        DataBinding.FieldName = 'DES_ENVIO_CORRESPONDENCIA'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.ImmediateDropDownWhenActivated = True
        Properties.Items.Strings = (
          'ENVIADA'
          'N'#195'O ENVIADA'
          'SUCESSO - ACAREA'#199#195'O RESOLVIDA')
        Properties.OnValidate = cxGrid1DBTableView1DES_ENVIO_CORRESPONDENCIAPropertiesValidate
        HeaderAlignmentHorz = taCenter
        Width = 148
      end
      object cxGrid1DBTableView1DES_RETORNO_CORRESPONDENCIA: TcxGridDBColumn
        Caption = 'Retorno'
        DataBinding.FieldName = 'DES_RETORNO_CORRESPONDENCIA'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.ImmediateDropDownWhenActivated = True
        Properties.Items.Strings = (
          'DEVOLVIDA DIGITALIZADA POR E-MAIL'
          'N'#195'O FOI DEVOLVIDA'
          'DEVOLVIDA POR MALOTE INTERNO'
          'DEVOLVIDA PESSOALMENTE'
          'DEVOLVIDA POR CORREIO')
        Properties.OnValidate = cxGrid1DBTableView1DES_RETORNO_CORRESPONDENCIAPropertiesValidate
        HeaderAlignmentHorz = taCenter
        Width = 138
      end
      object cxGrid1DBTableView1DES_OBSERVACOES: TcxGridDBColumn
        Caption = 'Obs.'
        DataBinding.FieldName = 'DES_OBSERVACOES'
        PropertiesClassName = 'TcxBlobEditProperties'
        Properties.BlobEditKind = bekMemo
        Properties.ImmediateDropDownWhenActivated = False
        HeaderAlignmentHorz = taCenter
        Width = 49
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object dxStatusBar1: TdxStatusBar
    Left = 0
    Top = 501
    Width = 980
    Height = 26
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarContainerPanelStyle'
        PanelStyle.Container = dxStatusBar1Container0
      end>
    PaintStyle = stpsUseLookAndFeel
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    object dxStatusBar1Container0: TdxStatusBarContainerControl
      Left = 3
      Top = 4
      Width = 938
      Height = 19
      object cxProgressBar: TcxProgressBar
        Left = 0
        Top = 0
        Align = alClient
        AutoSize = False
        Properties.BarStyle = cxbsLEDs
        Properties.ShowTextStyle = cxtsText
        TabOrder = 0
        Height = 19
        Width = 938
      end
    end
  end
  object cxButton1: TcxButton
    Left = 8
    Top = 470
    Width = 75
    Height = 25
    Action = actAcareacoesIncluir
    Anchors = [akLeft, akBottom]
    TabOrder = 3
  end
  object cxButton2: TcxButton
    Left = 89
    Top = 470
    Width = 75
    Height = 25
    Action = actAcareacoesEditar
    Anchors = [akLeft, akBottom]
    TabOrder = 4
  end
  object cxButton3: TcxButton
    Left = 170
    Top = 470
    Width = 75
    Height = 25
    Action = actAcareacoesCancelar
    Anchors = [akLeft, akBottom]
    Cancel = True
    TabOrder = 5
  end
  object cxButton4: TcxButton
    Left = 251
    Top = 470
    Width = 75
    Height = 25
    Action = actAcareacoesGravar
    Anchors = [akLeft, akBottom]
    TabOrder = 6
  end
  object cxButton5: TcxButton
    Left = 332
    Top = 470
    Width = 75
    Height = 25
    Action = actAcareacoesLocalizar
    Anchors = [akLeft, akBottom]
    TabOrder = 7
  end
  object cxButton6: TcxButton
    Left = 413
    Top = 470
    Width = 75
    Height = 25
    Action = actAcareacoesExportar
    Anchors = [akLeft, akBottom]
    TabOrder = 8
  end
  object cxButton7: TcxButton
    Left = 897
    Top = 470
    Width = 75
    Height = 25
    Action = actAcareacoesSair
    Anchors = [akRight, akBottom]
    TabOrder = 9
  end
  object cxButton8: TcxButton
    Left = 494
    Top = 470
    Width = 75
    Height = 25
    Action = actAcareacoesFiltrar
    Anchors = [akLeft, akBottom]
    TabOrder = 10
  end
  object cxButton9: TcxButton
    Left = 575
    Top = 470
    Width = 82
    Height = 25
    Action = actAcareacoesPendentes
    Anchors = [akLeft, akBottom]
    TabOrder = 11
  end
  object dsAcareacoes: TDataSource
    AutoEdit = False
    DataSet = dm.tbAcareacoes
    Left = 808
    Top = 8
  end
  object aclAcareacao: TActionList
    Images = dm.cxImageList1
    Left = 848
    Top = 8
    object actAcareacoesIncluir: TAction
      Tag = 3
      Category = 'Acarea'#231#245'es'
      Caption = '&Incluir'
      Hint = 'Incluir Acarea'#231#227'o'
      ImageIndex = 1
      ShortCut = 113
      OnExecute = actAcareacoesIncluirExecute
    end
    object actAcareacoesEditar: TAction
      Tag = 3
      Category = 'Acarea'#231#245'es'
      Caption = '&Editar'
      Hint = 'Editar Acarea'#231#227'o'
      ImageIndex = 14
      ShortCut = 114
      OnExecute = actAcareacoesEditarExecute
    end
    object actAcareacoesLocalizar: TAction
      Tag = 3
      Category = 'Acarea'#231#245'es'
      Caption = '&Localizar'
      Hint = 'Localizar Acarea'#231#245'es'
      ImageIndex = 18
      ShortCut = 119
      OnExecute = actAcareacoesLocalizarExecute
    end
    object actAcareacoesCancelar: TAction
      Tag = 3
      Category = 'Acarea'#231#245'es'
      Caption = 'Cancelar'
      Hint = 'Cancelar Opera'#231#227'o Atual'
      ImageIndex = 6
      OnExecute = actAcareacoesCancelarExecute
    end
    object actAcareacoesGravar: TAction
      Tag = 3
      Category = 'Acarea'#231#245'es'
      Caption = 'Gra&var'
      Hint = 'Gravar Acarea'#231#227'o'
      ImageIndex = 9
      ShortCut = 116
      OnExecute = actAcareacoesGravarExecute
    end
    object actAcareacoesExportar: TAction
      Tag = 3
      Category = 'Acarea'#231#245'es'
      Caption = 'E&xportar'
      Hint = 'Exportar dados da grade'
      ImageIndex = 29
    end
    object actAcareacoesSair: TAction
      Tag = 3
      Category = 'Acarea'#231#245'es'
      Caption = '&Sair'
      Hint = 'Sair da tela'
      ImageIndex = 10
      OnExecute = actAcareacoesSairExecute
    end
    object actAcareacoesFiltrar: TAction
      Category = 'Acarea'#231#245'es'
      Caption = 'Filtrar'
      Hint = 'Filtrar Dados'
      ImageIndex = 67
      OnExecute = actAcareacoesFiltrarExecute
    end
    object actAcareacoesPendentes: TAction
      Tag = 3
      Category = 'Acarea'#231#245'es'
      Caption = 'Pendentes'
      Hint = 'Acarea'#231#245'es Pendentes'
      ImageIndex = 50
      OnExecute = actAcareacoesPendentesExecute
    end
  end
end
