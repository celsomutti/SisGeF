object frmEtiquetasJornal: TfrmEtiquetasJornal
  Left = 0
  Top = 0
  Caption = 'Impress'#227'o de Etiquetas e Protocolos'
  ClientHeight = 534
  ClientWidth = 862
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    862
    534)
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel27: TcxLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alTop
    AutoSize = False
    Caption = 'Impress'#227'o de Etiquetas e Protocolos'
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
    Width = 856
    AnchorY = 22
  end
  object cxGroupBox1: TcxGroupBox
    AlignWithMargins = True
    Left = 8
    Top = 47
    Caption = 'Filtro'
    TabOrder = 1
    Height = 306
    Width = 390
    object cxLabel1: TcxLabel
      Left = 3
      Top = 65
      Caption = 'Produto'
      Transparent = True
    end
    object cxProdutos: TcxComboBox
      Left = 3
      Top = 88
      Hint = 'Descri'#231#227'o do Produto'
      Properties.DropDownListStyle = lsFixedList
      Properties.OnCloseUp = cxProdutosPropertiesCloseUp
      TabOrder = 2
      Width = 376
    end
    object cxLabel3: TcxLabel
      Left = 3
      Top = 115
      Caption = 'N'#186'. Edi'#231#227'o'
      Transparent = True
    end
    object cxEdicao: TcxCheckListBox
      Left = 3
      Top = 138
      Width = 121
      Height = 97
      Hint = 'N'#250'mero da Edi'#231#227'o'
      EditValueFormat = cvfStatesString
      Items = <>
      TabOrder = 4
    end
    object cxLabel2: TcxLabel
      Left = 130
      Top = 115
      Caption = 'Tipo de Assinatura'
      Transparent = True
    end
    object cxTipo: TcxCheckListBox
      Left = 130
      Top = 138
      Width = 121
      Height = 97
      Hint = 'Tipos de Assinaturas'
      EditValueFormat = cvfStatesString
      Items = <>
      TabOrder = 6
    end
    object cxLabel4: TcxLabel
      Left = 257
      Top = 115
      Caption = 'Roteiros'
      Transparent = True
    end
    object cxRoteiro: TcxCheckListBox
      Left = 257
      Top = 138
      Width = 122
      Height = 97
      Hint = 'Roteiros'
      EditValueFormat = cvfStatesString
      Items = <>
      TabOrder = 8
    end
    object cxLabel6: TcxLabel
      Left = 130
      Top = 241
      Caption = 'Imprimir da Etiqueta N'#186'. '
      Transparent = True
    end
    object cxEtiqueta: TcxSpinEdit
      Left = 130
      Top = 264
      Hint = 'N'#250'mero da Etiqueta Inicial;'
      Properties.AssignedValues.MaxValue = True
      Properties.MinValue = 1.000000000000000000
      TabOrder = 11
      Value = 1
      Width = 121
    end
    object cxLabel7: TcxLabel
      Left = 3
      Top = 16
      Caption = 'Tipo de Impress'#227'o'
      Transparent = True
    end
    object cxTipoImpressao: TcxComboBox
      Left = 3
      Top = 39
      Hint = 'Tipo de Impress'#227'o'
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'ETIQUETAS'
        'PROTOCOLOS')
      Properties.OnCloseUp = cxProdutosPropertiesCloseUp
      TabOrder = 1
      Text = 'ETIQUETAS'
      Width = 376
    end
    object cxLabel8: TcxLabel
      Left = 3
      Top = 241
      Caption = 'C'#243'digo Assinante'
      Transparent = True
    end
    object cxCodigoAssinatura: TcxTextEdit
      Left = 3
      Top = 264
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 15
      TabOrder = 10
      Width = 121
    end
  end
  object cxButton1: TcxButton
    Left = 703
    Top = 501
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Action = actImpressãoEtiquetaImprimir
    Anchors = [akRight, akBottom]
    TabOrder = 2
  end
  object cxButton2: TcxButton
    Left = 784
    Top = 501
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Action = actImpressaoEtiquetaSair
    Anchors = [akRight, akBottom]
    TabOrder = 3
  end
  object cxGroupBox2: TcxGroupBox
    Left = 8
    Top = 359
    Caption = 'Ordena'#231#227'o'
    TabOrder = 4
    Visible = False
    Height = 126
    Width = 390
    object cxLabel5: TcxLabel
      Left = 3
      Top = 24
      Caption = 'Ordem de Impress'#227'o:'
      Transparent = True
    end
    object cxOrdenacao: TcxComboBox
      Left = 3
      Top = 47
      Hint = 'Ordem de Impress'#227'o'
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'ROTEIRO, MODALIDADE'
        'ROTEIRO, MODALIDADE, CEP'
        'ROTEIRO, MODALIDADE, C'#211'DIGO ASSINANTE'
        'ROTEIRO, MODALIDADE, C'#211'DIGO DE BARRAS'
        'ROTEIRO, MODALIDADE, BAIRRO')
      TabOrder = 1
      Text = 'ROTEIRO, MODALIDADE'
      Width = 376
    end
    object cxDecrescente: TcxCheckBox
      Left = 3
      Top = 82
      Caption = 'Decrescente'
      TabOrder = 2
      Transparent = True
    end
  end
  object aclImpressaoEtiquetas: TActionList
    Images = dm.cxImageList1
    Left = 440
    Top = 16
    object actImpressãoEtiquetaImprimir: TAction
      Category = 'Impress'#227'o de Etiquetas'
      Caption = 'Im&primir'
      Hint = 'Iniciar Impress'#227'o'
      ImageIndex = 15
      OnExecute = actImpressãoEtiquetaImprimirExecute
    end
    object actImpressaoEtiquetaSair: TAction
      Category = 'Impress'#227'o de Etiquetas'
      Caption = 'Sair'
      Hint = 'Sair da Tela'
      ImageIndex = 10
      OnExecute = actImpressaoEtiquetaSairExecute
    end
  end
  object tbEtiquetas: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    SortedField = 'DES_ORDENACAO'
    Left = 440
    Top = 184
    object tbEtiquetasID_ASSINANTE: TIntegerField
      FieldName = 'ID_ASSINANTE'
    end
    object tbEtiquetasCOD_ASSINANTE: TStringField
      FieldName = 'COD_ASSINANTE'
      Size = 12
    end
    object tbEtiquetasCOD_PRODUTO: TStringField
      FieldName = 'COD_PRODUTO'
      Size = 50
    end
    object tbEtiquetasNUM_EDICAO: TStringField
      FieldName = 'NUM_EDICAO'
      Size = 12
    end
    object tbEtiquetasCOD_TIPO_ASSINATURA: TStringField
      FieldName = 'COD_TIPO_ASSINATURA'
      Size = 10
    end
    object tbEtiquetasDAT_EDICAO: TDateField
      FieldName = 'DAT_EDICAO'
    end
    object tbEtiquetasNOM_ASSINANTE: TStringField
      FieldName = 'NOM_ASSINANTE'
      Size = 70
    end
    object tbEtiquetasNOM_CUIDADOS: TStringField
      FieldName = 'NOM_CUIDADOS'
      Size = 70
    end
    object tbEtiquetasDES_ENDERECO: TStringField
      FieldName = 'DES_ENDERECO'
      Size = 70
    end
    object tbEtiquetasDES_COMPLEMENTO: TStringField
      FieldName = 'DES_COMPLEMENTO'
      Size = 50
    end
    object tbEtiquetasDES_BAIRRO: TStringField
      FieldName = 'DES_BAIRRO'
      Size = 70
    end
    object tbEtiquetasDES_REFERENCIA: TStringField
      FieldName = 'DES_REFERENCIA'
      Size = 126
    end
    object tbEtiquetasDES_CIDADE: TStringField
      FieldName = 'DES_CIDADE'
      Size = 70
    end
    object tbEtiquetasDES_UF: TStringField
      FieldName = 'DES_UF'
      Size = 2
    end
    object tbEtiquetasCEP_ENDERECO: TStringField
      FieldName = 'CEP_ENDERECO'
      Size = 9
    end
    object tbEtiquetasQTD_EXEMPLARES: TIntegerField
      FieldName = 'QTD_EXEMPLARES'
    end
    object tbEtiquetasCOD_BARRA: TStringField
      FieldName = 'COD_BARRA'
      Size = 10
    end
    object tbEtiquetasNUM_ROTEIRO: TIntegerField
      FieldName = 'NUM_ROTEIRO'
    end
    object tbEtiquetasNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
    end
    object tbEtiquetasID_REVISTA: TStringField
      FieldName = 'ID_REVISTA'
      Size = 15
    end
    object tbEtiquetasDES_ORDENACAO: TStringField
      FieldName = 'DES_ORDENACAO'
      Size = 10
    end
    object tbEtiquetasDOM_PROTOCOLO: TStringField
      FieldName = 'DOM_PROTOCOLO'
      Size = 1
    end
  end
  object frxReport: TfrxReport
    Version = '5.3.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbNavigator, pbExportQuick]
    PreviewOptions.MDIChild = True
    PreviewOptions.Modal = False
    PreviewOptions.Zoom = 1.000000000000000000
    PreviewOptions.ZoomMode = zmPageWidth
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.Author = 'Celso Mutti'
    ReportOptions.CreateDate = 42200.499154606500000000
    ReportOptions.Description.Strings = (
      'Etiquetas de Assinaturas de Jornais e Revistas')
    ReportOptions.Name = 'Etiqueta de Revista e Jornal'
    ReportOptions.LastChange = 43609.617544780090000000
    ReportOptions.VersionBuild = '0'
    ReportOptions.VersionMajor = '1'
    ReportOptions.VersionMinor = '0'
    ReportOptions.VersionRelease = '0'
    ScriptLanguage = 'PascalScript'
    StoreInDFM = False
    Left = 440
    Top = 80
  end
  object frxDBDataset: TfrxDBDataset
    UserName = 'frxDBDataset'
    CloseDataSource = False
    DataSet = tbEtiquetas
    BCDToCurrency = False
    Left = 440
    Top = 128
  end
end
