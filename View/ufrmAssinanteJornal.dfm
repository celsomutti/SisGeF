object frmAssinanteJornal: TfrmAssinanteJornal
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Assinantes Jornal'
  ClientHeight = 533
  ClientWidth = 984
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  ShowHint = True
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lcCadastro: TdxLayoutControl
    Left = 0
    Top = 22
    Width = 984
    Height = 511
    Align = alClient
    TabOrder = 0
    object lblTitulo: TcxLabel
      Left = 10
      Top = 10
      AutoSize = False
      Caption = 'Cadastro de Assinantes do Jornal'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -19
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.IsFontAssigned = True
      Height = 31
      Width = 954
    end
    object edtID: TcxMaskEdit
      Left = 60
      Top = 47
      Hint = 'ID da Assinatura no Banco de Dados'
      Properties.Alignment.Horz = taRightJustify
      Properties.IgnoreMaskBlank = True
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d\d\d\d\d\d\d\d\d\d'
      Properties.ReadOnly = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 1
      Text = '0'
      Width = 67
    end
    object edtCodigoAssinatura: TcxMaskEdit
      Left = 172
      Top = 47
      Hint = 'C'#243'digo da Assinatura'
      Properties.Alignment.Horz = taRightJustify
      Properties.IgnoreMaskBlank = True
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d'
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 2
      Text = '0'
      Width = 78
    end
    object edtModalidade: TcxButtonEdit
      Left = 317
      Top = 47
      Hint = 'C'#243'digo da Modalidade'
      Properties.Alignment.Horz = taRightJustify
      Properties.Buttons = <
        item
          Default = True
          ImageIndex = 38
          Kind = bkGlyph
        end>
      Properties.ClickKey = 120
      Properties.IgnoreMaskBlank = True
      Properties.Images = dm.iml16x16
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d\d\d\d\d'
      Properties.OnButtonClick = edtModalidadePropertiesButtonClick
      Properties.OnValidate = edtModalidadePropertiesValidate
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 3
      Text = '0'
      Width = 50
    end
    object lblModalidade: TcxLabel
      Left = 374
      Top = 47
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.IsFontAssigned = True
      Properties.Alignment.Vert = taVCenter
      Height = 17
      Width = 178
      AnchorY = 56
    end
    object edtCodigoProduto: TcxButtonEdit
      Left = 603
      Top = 47
      Hint = 'C'#243'digo do Produto'
      Properties.Alignment.Horz = taRightJustify
      Properties.Buttons = <
        item
          Default = True
          ImageIndex = 38
          Kind = bkGlyph
        end>
      Properties.ClickKey = 120
      Properties.IgnoreMaskBlank = True
      Properties.Images = dm.iml16x16
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d\d\d\d\d\d\d\d\d\d'
      Properties.OnButtonClick = edtCodigoProdutoPropertiesButtonClick
      Properties.OnValidate = edtCodigoProdutoPropertiesValidate
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 5
      Text = '0'
      Width = 68
    end
    object lblProduto: TcxLabel
      Left = 678
      Top = 47
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.IsFontAssigned = True
      Height = 17
      Width = 202
    end
    object edtNome: TcxTextEdit
      Left = 60
      Top = 77
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 8
      Width = 904
    end
    object edtTipoLogradouro: TcxTextEdit
      Left = 60
      Top = 131
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 10
      Width = 67
    end
    object edtLogradouro: TcxTextEdit
      Left = 134
      Top = 131
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 11
      Width = 492
    end
    object edtNumeroEndereco: TcxTextEdit
      Left = 638
      Top = 131
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 12
      Width = 85
    end
    object edtComplemento: TcxTextEdit
      Left = 799
      Top = 131
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 13
      Width = 172
    end
    object edtCEP: TcxButtonEdit
      Left = 60
      Top = 104
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.IgnoreMaskBlank = True
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d\d\d\d\d\d\d\d'
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 9
      Width = 95
    end
    object edtBairro: TcxTextEdit
      Left = 60
      Top = 158
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 14
      Width = 260
    end
    object edtCidade: TcxTextEdit
      Left = 374
      Top = 158
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 15
      Width = 496
    end
    object cboUF: TcxComboBox
      Left = 911
      Top = 158
      Properties.CharCase = ecUpperCase
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 16
      Width = 61
    end
    object grdOcorrencias: TcxGrid
      Left = 10
      Top = 230
      Width = 954
      Height = 264
      TabOrder = 20
      object tvOcorrencias: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsOcorrencias
        DataController.DetailKeyFieldNames = 'NUM_OCORRENCIA'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.InvertSelect = False
        OptionsSelection.MultiSelect = True
        OptionsSelection.CellMultiSelect = True
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        object tvOcorrenciasRecId: TcxGridDBColumn
          DataBinding.FieldName = 'RecId'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvOcorrenciasNUM_OCORRENCIA: TcxGridDBColumn
          DataBinding.FieldName = 'NUM_OCORRENCIA'
          HeaderAlignmentHorz = taCenter
          Width = 60
        end
        object tvOcorrenciasDAT_OCORRENCIA: TcxGridDBColumn
          DataBinding.FieldName = 'DAT_OCORRENCIA'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.IgnoreMaskBlank = True
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = 
            '(0?[1-9] | 1[012]) / ([012]?[1-9] | [123]0 |31) / ([123][0-9])? ' +
            '[0-9][0-9]'
          HeaderAlignmentHorz = taCenter
          SortIndex = 0
          SortOrder = soDescending
          Width = 61
        end
        object tvOcorrenciasCOD_ASSINATURA: TcxGridDBColumn
          DataBinding.FieldName = 'COD_ASSINATURA'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 111
        end
        object tvOcorrenciasNOM_ASSINANTE: TcxGridDBColumn
          DataBinding.FieldName = 'NOM_ASSINANTE'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 130
        end
        object tvOcorrenciasRES_ROTEIRO: TcxGridDBColumn
          DataBinding.FieldName = 'RES_ROTEIRO'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 91
        end
        object tvOcorrenciasCOD_ENTREGADOR: TcxGridDBColumn
          DataBinding.FieldName = 'COD_ENTREGADOR'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvOcorrenciasCOD_PRODUTO: TcxGridDBColumn
          DataBinding.FieldName = 'COD_PRODUTO'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvOcorrenciasCOD_OCORRENCIA: TcxGridDBColumn
          DataBinding.FieldName = 'COD_OCORRENCIA'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvOcorrenciasDOM_REINCIDENTE: TcxGridDBColumn
          DataBinding.FieldName = 'DOM_REINCIDENTE'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvOcorrenciasDES_DESCRICAO: TcxGridDBColumn
          DataBinding.FieldName = 'DES_DESCRICAO'
          PropertiesClassName = 'TcxMemoProperties'
          HeaderAlignmentHorz = taCenter
          Width = 175
        end
        object tvOcorrenciasDES_ENDERECO: TcxGridDBColumn
          DataBinding.FieldName = 'DES_ENDERECO'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 217
        end
        object tvOcorrenciasDES_RETORNO: TcxGridDBColumn
          DataBinding.FieldName = 'DES_RETORNO'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvOcorrenciasCOD_RESULTADO: TcxGridDBColumn
          DataBinding.FieldName = 'COD_RESULTADO'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvOcorrenciasCOD_ORIGEM: TcxGridDBColumn
          DataBinding.FieldName = 'COD_ORIGEM'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvOcorrenciasDES_OBS: TcxGridDBColumn
          DataBinding.FieldName = 'DES_OBS'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvOcorrenciasCOD_STATUS: TcxGridDBColumn
          DataBinding.FieldName = 'COD_STATUS'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvOcorrenciasDES_APURACAO: TcxGridDBColumn
          DataBinding.FieldName = 'DES_APURACAO'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvOcorrenciasDOM_PROCESSADO: TcxGridDBColumn
          DataBinding.FieldName = 'DOM_PROCESSADO'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvOcorrenciasQTD_OCORRENCIAS: TcxGridDBColumn
          DataBinding.FieldName = 'QTD_OCORRENCIAS'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.IgnoreMaskBlank = True
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d\d\d\d\d\d'
          HeaderAlignmentHorz = taCenter
          Width = 52
        end
        object tvOcorrenciasVAL_OCORRENCIAS: TcxGridDBColumn
          DataBinding.FieldName = 'VAL_OCORRENCIAS'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ' ,0.00;- ,0.00'
          HeaderAlignmentHorz = taCenter
          Width = 51
        end
        object tvOcorrenciasDAT_DESCONTO: TcxGridDBColumn
          DataBinding.FieldName = 'DAT_DESCONTO'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvOcorrenciasDOM_IMPRESSAO: TcxGridDBColumn
          DataBinding.FieldName = 'DOM_IMPRESSAO'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvOcorrenciasDES_ANEXO: TcxGridDBColumn
          DataBinding.FieldName = 'DES_ANEXO'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvOcorrenciasDES_LOG: TcxGridDBColumn
          DataBinding.FieldName = 'DES_LOG'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
      end
      object lvOcorrencias: TcxGridLevel
        GridView = tvOcorrencias
      end
    end
    object edtRoteiro: TcxTextEdit
      Left = 60
      Top = 185
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 17
      Width = 121
    end
    object edtOrdem: TcxMaskEdit
      Left = 226
      Top = 185
      Hint = 'Ordena'#231#227'o da Assinatura'
      Properties.Alignment.Horz = taRightJustify
      Properties.IgnoreMaskBlank = True
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d\d\d\d\d\d\d\d'
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 18
      Text = '0'
      Width = 96
    end
    object edtReferencia: TcxTextEdit
      Left = 386
      Top = 185
      Hint = 'refer'#234'ncia do Endere'#231'o'
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 19
      Width = 581
    end
    object edtQtde: TcxMaskEdit
      Left = 921
      Top = 47
      Hint = 'Quantidade de Exemplares'
      Properties.Alignment.Horz = taRightJustify
      Properties.IgnoreMaskBlank = True
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d\d\d\d\d'
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 7
      Text = '0'
      Width = 52
    end
    object lcgRoot: TdxLayoutGroup
      AlignHorz = ahClient
      AlignVert = avParentManaged
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object lciTitulo: TdxLayoutItem
      Parent = lcgRoot
      CaptionOptions.Text = 'cxLabel1'
      CaptionOptions.Visible = False
      Control = lblTitulo
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lciId: TdxLayoutItem
      Parent = lcgIdentificacao
      AlignHorz = ahClient
      CaptionOptions.Text = 'ID'
      Control = edtID
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lciCodigoAssinatura: TdxLayoutItem
      Parent = lcgIdentificacao
      AlignHorz = ahClient
      CaptionOptions.Text = 'C'#243'digo'
      Control = edtCodigoAssinatura
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lcgIdentificacao: TdxLayoutAutoCreatedGroup
      Parent = lcgRoot
      LayoutDirection = ldHorizontal
      Index = 1
      AutoCreated = True
    end
    object lciCodigoModalidade: TdxLayoutItem
      Parent = lcgIdentificacao
      AlignHorz = ahClient
      CaptionOptions.Text = 'Modalidade'
      Control = edtModalidade
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object lciDescricaoModalidade: TdxLayoutItem
      Parent = lcgIdentificacao
      AlignHorz = ahClient
      CaptionOptions.Text = 'cxLabel1'
      CaptionOptions.Visible = False
      Control = lblModalidade
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object lciCodigoProduto: TdxLayoutItem
      Parent = lcgIdentificacao
      AlignHorz = ahClient
      CaptionOptions.Text = 'Produto'
      Control = edtCodigoProduto
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object lciDescricaoProduto: TdxLayoutItem
      Parent = lcgIdentificacao
      AlignHorz = ahClient
      CaptionOptions.Visible = False
      Control = lblProduto
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object lciNome: TdxLayoutItem
      Parent = lcgRoot
      CaptionOptions.Text = 'Nome'
      Control = edtNome
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object lciTipoLogradouro: TdxLayoutItem
      Parent = lcgLogradouro
      AlignHorz = ahClient
      CaptionOptions.Text = 'Endere'#231'o'
      Control = edtTipoLogradouro
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lciLogradouro: TdxLayoutItem
      Parent = lcgLogradouro
      AlignHorz = ahClient
      CaptionOptions.Text = 'Endere'#231'o'
      CaptionOptions.Visible = False
      Control = edtLogradouro
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lcgLogradouro: TdxLayoutAutoCreatedGroup
      Parent = lcgRoot
      LayoutDirection = ldHorizontal
      Index = 4
      AutoCreated = True
    end
    object lciNumeroEndereco: TdxLayoutItem
      Parent = lcgLogradouro
      AlignHorz = ahClient
      CaptionOptions.Text = 'N'#250'mero'
      CaptionOptions.Visible = False
      Control = edtNumeroEndereco
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object lciComplemento: TdxLayoutItem
      Parent = lcgLogradouro
      AlignHorz = ahClient
      CaptionOptions.Text = 'Complemento'
      Control = edtComplemento
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object lciCEP: TdxLayoutItem
      Parent = lcgRoot
      AlignHorz = ahLeft
      CaptionOptions.Text = 'CEP'
      Control = edtCEP
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object lciBairro: TdxLayoutItem
      Parent = lcgEndereco
      AlignHorz = ahClient
      CaptionOptions.Text = 'Bairro'
      Control = edtBairro
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lciCidade: TdxLayoutItem
      Parent = lcgEndereco
      AlignHorz = ahClient
      CaptionOptions.Text = 'Cidade'
      Control = edtCidade
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lcgEndereco: TdxLayoutAutoCreatedGroup
      Parent = lcgRoot
      LayoutDirection = ldHorizontal
      Index = 5
      AutoCreated = True
    end
    object lciUF: TdxLayoutItem
      Parent = lcgEndereco
      AlignHorz = ahClient
      CaptionOptions.Text = 'UF'
      Control = cboUF
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object lciOcorrencias: TdxLayoutItem
      Parent = lcgRoot
      AlignVert = avClient
      CaptionOptions.Text = 'Ocorr'#234'ncias'
      CaptionOptions.Layout = clTop
      Control = grdOcorrencias
      ControlOptions.ShowBorder = False
      Index = 7
    end
    object lciRoteiro: TdxLayoutItem
      Parent = lcgRoteiro
      AlignHorz = ahClient
      CaptionOptions.Text = 'Roteiro'
      Control = edtRoteiro
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lciOrdem: TdxLayoutItem
      Parent = lcgRoteiro
      AlignHorz = ahClient
      CaptionOptions.Text = 'Ordem'
      Control = edtOrdem
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lcgRoteiro: TdxLayoutAutoCreatedGroup
      Parent = lcgRoot
      LayoutDirection = ldHorizontal
      Index = 6
      AutoCreated = True
    end
    object lciReferencia: TdxLayoutItem
      Parent = lcgRoteiro
      AlignHorz = ahClient
      CaptionOptions.Text = 'Refer'#234'ncia'
      Control = edtReferencia
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object lciQtde: TdxLayoutItem
      Parent = lcgIdentificacao
      AlignHorz = ahClient
      CaptionOptions.Text = 'Qtde.'
      Control = edtQtde
      ControlOptions.ShowBorder = False
      Index = 6
    end
  end
  object tbOcorrencias: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 808
    Top = 24
    object tbOcorrenciasNUM_OCORRENCIA: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUM_OCORRENCIA'
    end
    object tbOcorrenciasDAT_OCORRENCIA: TDateField
      DisplayLabel = 'Data'
      FieldName = 'DAT_OCORRENCIA'
    end
    object tbOcorrenciasCOD_ASSINATURA: TStringField
      DisplayLabel = 'C'#243'd. Assinatura'
      FieldName = 'COD_ASSINATURA'
    end
    object tbOcorrenciasNOM_ASSINANTE: TStringField
      DisplayLabel = 'Nome Assinante'
      FieldName = 'NOM_ASSINANTE'
      Size = 70
    end
    object tbOcorrenciasRES_ROTEIRO: TStringField
      DisplayLabel = 'Roteiro'
      FieldName = 'RES_ROTEIRO'
      Size = 30
    end
    object tbOcorrenciasCOD_ENTREGADOR: TIntegerField
      DisplayLabel = 'C'#243'd. Entregador'
      FieldName = 'COD_ENTREGADOR'
    end
    object tbOcorrenciasCOD_PRODUTO: TStringField
      DisplayLabel = 'C'#243'd. Produto'
      FieldName = 'COD_PRODUTO'
      Size = 10
    end
    object tbOcorrenciasCOD_OCORRENCIA: TIntegerField
      DisplayLabel = 'C'#243'd. Ocorr'#234'ncia'
      FieldName = 'COD_OCORRENCIA'
    end
    object tbOcorrenciasDOM_REINCIDENTE: TStringField
      DisplayLabel = 'Reincidente'
      FieldName = 'DOM_REINCIDENTE'
      Size = 1
    end
    object tbOcorrenciasDES_DESCRICAO: TMemoField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DES_DESCRICAO'
      BlobType = ftMemo
    end
    object tbOcorrenciasDES_ENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'DES_ENDERECO'
      Size = 256
    end
    object tbOcorrenciasDES_RETORNO: TMemoField
      DisplayLabel = 'Retorno'
      FieldName = 'DES_RETORNO'
      BlobType = ftMemo
    end
    object tbOcorrenciasCOD_RESULTADO: TIntegerField
      DisplayLabel = 'Resultado'
      FieldName = 'COD_RESULTADO'
    end
    object tbOcorrenciasCOD_ORIGEM: TIntegerField
      DisplayLabel = 'Origem'
      FieldName = 'COD_ORIGEM'
    end
    object tbOcorrenciasDES_OBS: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'DES_OBS'
      BlobType = ftMemo
    end
    object tbOcorrenciasCOD_STATUS: TIntegerField
      DisplayLabel = 'Status'
      FieldName = 'COD_STATUS'
    end
    object tbOcorrenciasDES_APURACAO: TMemoField
      DisplayLabel = 'Apura'#231#227'o'
      FieldName = 'DES_APURACAO'
      BlobType = ftMemo
    end
    object tbOcorrenciasDOM_PROCESSADO: TStringField
      DisplayLabel = 'Processado'
      FieldName = 'DOM_PROCESSADO'
      Size = 1
    end
    object tbOcorrenciasQTD_OCORRENCIAS: TIntegerField
      DisplayLabel = 'Qtde.'
      FieldName = 'QTD_OCORRENCIAS'
    end
    object tbOcorrenciasVAL_OCORRENCIAS: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VAL_OCORRENCIAS'
    end
    object tbOcorrenciasDAT_DESCONTO: TDateField
      DisplayLabel = 'Data Desconto'
      FieldName = 'DAT_DESCONTO'
    end
    object tbOcorrenciasDOM_IMPRESSAO: TStringField
      DisplayLabel = 'Impresso'
      FieldName = 'DOM_IMPRESSAO'
      Size = 1
    end
    object tbOcorrenciasDES_ANEXO: TStringField
      DisplayLabel = 'Anexo'
      FieldName = 'DES_ANEXO'
      Size = 70
    end
    object tbOcorrenciasDES_LOG: TMemoField
      DisplayLabel = 'LOG'
      FieldName = 'DES_LOG'
      BlobType = ftMemo
    end
  end
  object dsOcorrencias: TDataSource
    AutoEdit = False
    DataSet = tbOcorrencias
    Left = 856
    Top = 24
  end
  object aclAssinantes: TActionList
    Images = dm.iml16x16
    Left = 472
    Top = 24
    object actIncluir: TAction
      Category = 'Cadastro'
      Caption = '&Incluir'
      Hint = 'Incluir Assinatura'
      ImageIndex = 0
      ShortCut = 113
      OnExecute = actIncluirExecute
    end
    object actExcluir: TAction
      Category = 'Cadastro'
      Caption = 'E&xcluir'
      Hint = 'E&xcluir'
      ImageIndex = 5
      ShortCut = 114
      OnExecute = actExcluirExecute
    end
    object actLocalizar: TAction
      Category = 'Cadastro'
      Caption = '&Localizar'
      Hint = 'Localizar'
      ImageIndex = 31
      ShortCut = 119
      OnExecute = actLocalizarExecute
    end
    object actLocalizarSTD: TAction
      Category = 'Cadastro'
      Caption = 'Localizar STD'
      Hint = 'Localizar dados no STD.'
      ImageIndex = 31
      ShortCut = 16503
      OnExecute = actLocalizarSTDExecute
    end
    object actCancelar: TAction
      Category = 'Cadastro'
      Caption = 'Cancelar'
      Hint = 'Cancelar Opera'#231#227'o Atual'
      ImageIndex = 4
      OnExecute = actCancelarExecute
    end
    object actGravar: TAction
      Category = 'Cadastro'
      Caption = '&Gravar'
      Hint = 'Gravar dados'
      ImageIndex = 32
      ShortCut = 116
      OnExecute = actGravarExecute
    end
    object actFechar: TAction
      Category = 'Cadastro'
      Caption = 'Fechar'
      Hint = 'Fechar tela'
      ImageIndex = 6
      OnExecute = actFecharExecute
    end
    object actBancoSTD: TAction
      Category = 'Cadastro'
      Caption = 'Banco STD'
      Hint = 'Localizar o banco de dados do Jornal do STD'
      ImageIndex = 37
      OnExecute = actBancoSTDExecute
    end
  end
  object fmCadastro: TdxBarManager
    AllowReset = False
    AutoDockColor = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    DockColor = clBtnFace
    ImageOptions.Images = dm.iml16x16
    ImageOptions.StretchGlyphs = False
    ImageOptions.UseLargeImagesForLargeIcons = True
    PopupMenuLinks = <>
    ShowShortCutInHint = True
    UseSystemFont = True
    Left = 904
    Top = 24
    DockControlHeights = (
      0
      0
      22
      0)
    object fmCadastroBar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      BorderStyle = bbsNone
      Caption = 'Cadastro'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 1004
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton1'
        end
        item
          Visible = True
          ItemName = 'dxBarButton2'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarSubItem1'
        end
        item
          Visible = True
          ItemName = 'dxBarButton8'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton4'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton5'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton6'
        end>
      OneOnRow = True
      Row = 0
      ShowMark = False
      UseOwnFont = False
      UseRecentItems = False
      UseRestSpace = True
      Visible = True
      WholeRow = False
    end
    object dxBarButton1: TdxBarButton
      Action = actIncluir
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton2: TdxBarButton
      Action = actExcluir
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton3: TdxBarButton
      Action = actLocalizar
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton4: TdxBarButton
      Action = actCancelar
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton5: TdxBarButton
      Action = actGravar
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton6: TdxBarButton
      Action = actFechar
      Align = iaRight
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = 'Localizar'
      Category = 0
      Visible = ivAlways
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000003E39
        34FF393430FF332F2BFF2C2925FF272421FF201D1BFF0202021A0F0D0CDB0B0A
        09FF070706FF040403FF000000FF000000FF0000000000000000000000004641
        3BFF857A70FFC3B8AEFF7C7268FF7F756BFF36322DFF0202010F211F1CD49589
        7DFFBAAEA2FF7C7268FF7F756BFF010101FF0000000000000000000000004D47
        41FF83786FFFCCC3BAFF786F65FF7B7167FF2E2A27F9000000011B1916EE9589
        7DFFC2B8ADFF786F65FF7C7268FF060505FF000000000000000000000000524B
        45FC83786FFFCCC3BAFF797066FF71685FFF2E2B26D5000000001F1C1BD5857A
        70FFC2B8ADFF786F65FF7B7167FF0A0908FC000000000000000000000000453F
        3AC39F9286FFCCC3BAFFC0B4AAFFA6988BFF292622A8000000001D1B18A89084
        79FFC2B8ADFFC0B4AAFFA89B8EFF0D0B0BC30000000000000000020202055A53
        4CF9423D38FF58514AFF3D3833FF332F2BFF1F1D1AE504040430151412B51A18
        16FF252220FF191715FF0F0E0DFF010101EE0000000200000000030303059D91
        85FFB1A396FF7F756BFF7C7268FF776D64FF6C635BFF2E2A26FF564F48FF8076
        6CFF7C7268FF776D64FF70675EFF000000FE0000000500000000030202049A8E
        83E1BAAEA2FF82776DFF82776DFFAA917BFFBAA794FFB3A18BFAB09781FF9F8D
        7DFF836D5BFF716357FF95897DFF040403E00000000300000000060505082623
        20489B8E82FF9D9185FF867B71FF564F48FF504A44FF80766CFF6E665DFF826C
        58FFA6917DFF948474FF564F48FF0605057A0000000100000000000000000000
        0000746B62FFA4978AFF95897DFF9F9286FF3E3934FF000000004C4640FF7E74
        6AFF857A70FF3E3934FF2D2926A70202020C0000000200000000000000000000
        000000000000000000007E746AE2C3B8AEFF655D55FF000000007C7268FFA89B
        8EFF8B8075E40000000000000000000000000000000000000000000000000000
        000000000000000000008A7F74E2BCB0A4FF9D9185FF00000000AEA093FF9D91
        85FF565049DA0000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton3'
        end
        item
          Visible = True
          ItemName = 'dxBarButton7'
        end>
    end
    object dxBarButton7: TdxBarButton
      Action = actLocalizarSTD
      Category = 0
    end
    object dxBarButton8: TdxBarButton
      Action = actBancoSTD
      Category = 0
      PaintStyle = psCaptionGlyph
    end
  end
  object OpenDialog: TOpenDialog
    Filter = 'Banco de Dados|*.mdb'
    Left = 520
    Top = 22
  end
  object ZConn: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    HostName = ''
    Port = 0
    Database = ''
    User = ''
    Password = ''
    Protocol = 'ado'
    Left = 648
    Top = 22
  end
  object qryAccess: TZReadOnlyQuery
    Connection = ZConn
    Params = <>
    Left = 696
    Top = 22
  end
end
