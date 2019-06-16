object frmBaixaProtocoloJornal: TfrmBaixaProtocoloJornal
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Baixa de Protocolos de Jornal'
  ClientHeight = 456
  ClientWidth = 906
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
  OnShow = FormShow
  DesignSize = (
    906
    456)
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel27: TcxLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alTop
    AutoSize = False
    Caption = 'Baixa de Protocolos de Jornal e Revistas'
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
    Width = 900
    AnchorY = 22
  end
  object cxPageControl1: TcxPageControl
    AlignWithMargins = True
    Left = 3
    Top = 47
    Width = 900
    Height = 98
    Align = alTop
    TabOrder = 1
    Properties.ActivePage = cxTabSheet1
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 96
    ClientRectLeft = 2
    ClientRectRight = 898
    ClientRectTop = 28
    object cxTabSheet1: TcxTabSheet
      Caption = 'Baixas'
      ImageIndex = 0
      OnShow = cxTabSheet1Show
      object cxLabel3: TcxLabel
        Left = 3
        Top = 8
        Caption = 'ID Assinante'
        Transparent = True
      end
      object cxNossoNumero: TcxMaskEdit
        Left = 3
        Top = 31
        Properties.IgnoreMaskBlank = True
        Properties.MaskKind = emkRegExpr
        Properties.EditMask = '\d\d\d\d\d\d\d\d\d\d\d\d\d\d'
        Properties.OnEditValueChanged = cxNossoNumeroPropertiesEditValueChanged
        Properties.OnValidate = cxNossoNumeroPropertiesValidate
        TabOrder = 1
        Width = 113
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'Pend'#234'ncias'
      ImageIndex = 1
      OnShow = cxTabSheet2Show
      DesignSize = (
        896
        68)
      object cxLabel1: TcxLabel
        Left = 3
        Top = 11
        Caption = 'Data Inicial'
        Transparent = True
      end
      object cxDataInicial: TcxDateEdit
        Left = 3
        Top = 34
        Hint = 'Data inicial do per'#237'odo'
        Properties.SaveTime = False
        Properties.ShowTime = False
        TabOrder = 1
        Width = 121
      end
      object cxLabel2: TcxLabel
        Left = 130
        Top = 11
        Caption = 'Data Final'
        Transparent = True
      end
      object cxDataFinal: TcxDateEdit
        Left = 130
        Top = 34
        Hint = 'Data final do per'#237'odo'
        Properties.SaveTime = False
        Properties.ShowTime = False
        TabOrder = 3
        Width = 121
      end
      object cxButton3: TcxButton
        Left = 818
        Top = 40
        Width = 75
        Height = 25
        Cursor = crHandPoint
        Action = actBaixaProcessar
        Anchors = [akRight, akBottom]
        TabOrder = 4
      end
    end
  end
  object cxGrid1: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 151
    Width = 900
    Height = 266
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsAssinantes
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.InvertSelect = False
      OptionsSelection.MultiSelect = True
      OptionsSelection.CellMultiSelect = True
      OptionsView.NoDataToDisplayInfoText = '<Nenhuma informa'#231#227'o dispon'#237'vel>'
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object cxGrid1DBTableView1RecId: TcxGridDBColumn
        DataBinding.FieldName = 'RecId'
        Visible = False
        HeaderAlignmentHorz = taCenter
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1ID_ASSINANTE: TcxGridDBColumn
        Caption = 'ID'
        DataBinding.FieldName = 'ID_ASSINANTE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        VisibleForEditForm = bFalse
        Width = 43
      end
      object cxGrid1DBTableView1COD_ASSINANTE: TcxGridDBColumn
        Caption = 'C'#243'digo'
        DataBinding.FieldName = 'COD_ASSINANTE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        VisibleForEditForm = bFalse
        Width = 45
      end
      object cxGrid1DBTableView1COD_PRODUTO: TcxGridDBColumn
        Caption = 'Produto'
        DataBinding.FieldName = 'COD_PRODUTO'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'COD_PRODUTO'
        Properties.ListColumns = <
          item
            FieldName = 'DES_PRODUTO'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dsProdutos
        HeaderAlignmentHorz = taCenter
        VisibleForEditForm = bFalse
        Width = 70
      end
      object cxGrid1DBTableView1COD_TIPO_ASSINATURA: TcxGridDBColumn
        Caption = 'Modalidade'
        DataBinding.FieldName = 'COD_TIPO_ASSINATURA'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'COD_TIPO_ASSINATURA'
        Properties.ListColumns = <
          item
            FieldName = 'DES_TIPO_ASSINATURA'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dsTipos
        HeaderAlignmentHorz = taCenter
        VisibleForEditForm = bFalse
        Width = 78
      end
      object cxGrid1DBTableView1NUM_ROTEIRO: TcxGridDBColumn
        Caption = 'Roteiro'
        DataBinding.FieldName = 'NUM_ROTEIRO'
        HeaderAlignmentHorz = taCenter
        VisibleForEditForm = bFalse
        Width = 36
      end
      object cxGrid1DBTableView1NUM_EDICAO: TcxGridDBColumn
        Caption = 'Edi'#231#227'o'
        DataBinding.FieldName = 'NUM_EDICAO'
        HeaderAlignmentHorz = taCenter
        VisibleForEditForm = bFalse
        Width = 47
      end
      object cxGrid1DBTableView1DAT_EDICAO: TcxGridDBColumn
        DataBinding.FieldName = 'DAT_EDICAO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1NOM_ASSINANTE: TcxGridDBColumn
        Caption = 'Nome'
        DataBinding.FieldName = 'NOM_ASSINANTE'
        HeaderAlignmentHorz = taCenter
        VisibleForEditForm = bFalse
        Width = 135
      end
      object cxGrid1DBTableView1NOM_CUIDADOS: TcxGridDBColumn
        DataBinding.FieldName = 'NOM_CUIDADOS'
        Visible = False
        HeaderAlignmentHorz = taCenter
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1DES_ENDERECO: TcxGridDBColumn
        DataBinding.FieldName = 'DES_ENDERECO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1DES_COMPLEMENTO: TcxGridDBColumn
        DataBinding.FieldName = 'DES_COMPLEMENTO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1DES_BAIRRO: TcxGridDBColumn
        DataBinding.FieldName = 'DES_BAIRRO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1DES_REFERENCIA: TcxGridDBColumn
        DataBinding.FieldName = 'DES_REFERENCIA'
        Visible = False
        HeaderAlignmentHorz = taCenter
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1DES_CIDADE: TcxGridDBColumn
        DataBinding.FieldName = 'DES_CIDADE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1DES_UF: TcxGridDBColumn
        DataBinding.FieldName = 'DES_UF'
        Visible = False
        HeaderAlignmentHorz = taCenter
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1CEP_ENDERECO: TcxGridDBColumn
        DataBinding.FieldName = 'CEP_ENDERECO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1QTD_EXEMPLARES: TcxGridDBColumn
        Caption = 'Quantidade'
        DataBinding.FieldName = 'QTD_EXEMPLARES'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.MaskKind = emkRegExpr
        Properties.EditMask = '\d\d\d\d\d\d'
        HeaderAlignmentHorz = taCenter
        VisibleForEditForm = bFalse
        Width = 124
      end
      object cxGrid1DBTableView1COD_BARRA: TcxGridDBColumn
        DataBinding.FieldName = 'COD_BARRA'
        Visible = False
        HeaderAlignmentHorz = taCenter
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1DOM_PROTOCOLO: TcxGridDBColumn
        DataBinding.FieldName = 'DOM_PROTOCOLO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1DOM_BAIXA: TcxGridDBColumn
        DataBinding.FieldName = 'DOM_BAIXA'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'COD_CADASTRO'
        Properties.ListColumns = <
          item
            FieldName = 'DES_RAZAO_SOCIAL'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dsEntregador
        Visible = False
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1COD_ENTREGADOR: TcxGridDBColumn
        Caption = 'Entregador'
        DataBinding.FieldName = 'COD_ENTREGADOR'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'COD_CADASTRO'
        Properties.ListColumns = <
          item
            FieldName = 'DES_RAZAO_SOCIAL'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dsEntregador
        Visible = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1NOM_RECEBEDOR: TcxGridDBColumn
        Caption = 'Recebedor'
        DataBinding.FieldName = 'NOM_RECEBEDOR'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 159
      end
      object cxGrid1DBTableView1DES_GRAU_RELACIONAMENTO: TcxGridDBColumn
        Caption = 'Grau de Relacionamento'
        DataBinding.FieldName = 'DES_GRAU_RELACIONAMENTO'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 161
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object cxButton1: TcxButton
    Left = 828
    Top = 423
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Action = actBaixaSair
    Anchors = [akRight, akBottom]
    TabOrder = 3
  end
  object cxButton2: TcxButton
    Left = 3
    Top = 423
    Width = 93
    Height = 25
    Cursor = crHandPoint
    Action = actBaixaLimpar
    Anchors = [akLeft, akBottom]
    TabOrder = 4
  end
  object tbAssinantes: TdxMemData
    Indexes = <
      item
        FieldName = 'ID_ASSINANTE'
        SortOptions = []
      end>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F130000000400000003000D0049445F415353494E41
      4E5445000C00000014000E00434F445F415353494E414E5445000A0000001400
      0C00434F445F50524F4455544F000A00000014001400434F445F5449504F5F41
      5353494E4154555241000C00000014000B004E554D5F45444943414F00040000
      0009000B004441545F45444943414F004600000014000E004E4F4D5F41535349
      4E414E5445004600000014000D004E4F4D5F4355494441444F53006400000014
      000D004445535F454E44455245434F0032000000140010004445535F434F4D50
      4C454D454E544F004600000014000B004445535F42414952524F007E00000014
      000F004445535F5245464552454E434941004600000014000B004445535F4349
      444144450002000000140007004445535F5546000800000014000D004345505F
      454E44455245434F000400000003000C004E554D5F524F544549524F00040000
      0003000F005154445F4558454D504C41524553000A00000014000A00434F445F
      4241525241000100000014000E00444F4D5F50524F544F434F4C4F00}
    SortOptions = []
    Left = 568
    Top = 8
    object tbAssinantesID_ASSINANTE: TIntegerField
      FieldName = 'ID_ASSINANTE'
    end
    object tbAssinantesCOD_ASSINANTE: TWideStringField
      FieldName = 'COD_ASSINANTE'
      Size = 12
    end
    object tbAssinantesCOD_PRODUTO: TWideStringField
      FieldName = 'COD_PRODUTO'
      Size = 10
    end
    object tbAssinantesCOD_TIPO_ASSINATURA: TWideStringField
      FieldName = 'COD_TIPO_ASSINATURA'
      Size = 10
    end
    object tbAssinantesNUM_ROTEIRO: TIntegerField
      FieldName = 'NUM_ROTEIRO'
    end
    object tbAssinantesNUM_EDICAO: TWideStringField
      FieldName = 'NUM_EDICAO'
      Size = 12
    end
    object tbAssinantesDAT_EDICAO: TDateField
      FieldName = 'DAT_EDICAO'
    end
    object tbAssinantesNOM_ASSINANTE: TWideStringField
      FieldName = 'NOM_ASSINANTE'
      Size = 70
    end
    object tbAssinantesNOM_CUIDADOS: TWideStringField
      FieldName = 'NOM_CUIDADOS'
      Size = 70
    end
    object tbAssinantesDES_ENDERECO: TWideStringField
      FieldName = 'DES_ENDERECO'
      Size = 100
    end
    object tbAssinantesDES_COMPLEMENTO: TWideStringField
      FieldName = 'DES_COMPLEMENTO'
      Size = 50
    end
    object tbAssinantesDES_BAIRRO: TWideStringField
      FieldName = 'DES_BAIRRO'
      Size = 70
    end
    object tbAssinantesDES_REFERENCIA: TWideStringField
      FieldName = 'DES_REFERENCIA'
      Size = 126
    end
    object tbAssinantesDES_CIDADE: TWideStringField
      FieldName = 'DES_CIDADE'
      Size = 70
    end
    object tbAssinantesDES_UF: TWideStringField
      FieldName = 'DES_UF'
      Size = 2
    end
    object tbAssinantesCEP_ENDERECO: TWideStringField
      FieldName = 'CEP_ENDERECO'
      Size = 8
    end
    object tbAssinantesQTD_EXEMPLARES: TIntegerField
      FieldName = 'QTD_EXEMPLARES'
    end
    object tbAssinantesCOD_BARRA: TWideStringField
      FieldName = 'COD_BARRA'
      Size = 10
    end
    object tbAssinantesDOM_PROTOCOLO: TWideStringField
      FieldName = 'DOM_PROTOCOLO'
      Size = 1
    end
    object tbAssinantesDOM_BAIXA: TStringField
      FieldName = 'DOM_BAIXA'
      Size = 1
    end
    object tbAssinantesNOM_RECEBEDOR: TStringField
      FieldName = 'NOM_RECEBEDOR'
      Size = 70
    end
    object tbAssinantesDES_GRAU_RELACIONAMENTO: TStringField
      FieldName = 'DES_GRAU_RELACIONAMENTO'
      Size = 50
    end
    object tbAssinantesCOD_ENTREGADOR: TIntegerField
      FieldName = 'COD_ENTREGADOR'
    end
  end
  object dsAssinantes: TDataSource
    AutoEdit = False
    DataSet = tbAssinantes
    OnStateChange = dsAssinantesStateChange
    Left = 632
    Top = 8
  end
  object aclBaixa: TActionList
    Images = dm.cxImageList1
    Left = 696
    Top = 8
    object actBaixaSair: TAction
      Category = 'Baixa Protocolos'
      Caption = 'Sair'
      Hint = 'SAir da Tela'
      ImageIndex = 10
      OnExecute = actBaixaSairExecute
    end
    object actBaixaLimpar: TAction
      Category = 'Baixa Protocolos'
      Caption = 'Limpar Grade'
      Hint = 'Limpar a Grade'
      ImageIndex = 6
      OnExecute = actBaixaLimparExecute
    end
    object actBaixaProcessar: TAction
      Category = 'Baixa Protocolos'
      Caption = 'Processar'
      Hint = 'Processar Per'#237'odo'
      ImageIndex = 27
      OnExecute = actBaixaProcessarExecute
    end
  end
  object dsProdutos: TDataSource
    AutoEdit = False
    DataSet = dm.tbProdutos
    Left = 752
    Top = 8
  end
  object dsTipos: TDataSource
    AutoEdit = False
    DataSet = dm.tbTipoAssinatura
    Left = 792
    Top = 8
  end
  object dsEntregador: TDataSource
    AutoEdit = False
    DataSet = dm.tbCadastro
    Left = 832
    Top = 8
  end
end
