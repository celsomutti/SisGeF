object view_CadastroBanca: Tview_CadastroBanca
  Left = 0
  Top = 0
  Caption = 'Cadastro de Bancas e Pontos de Vendas'
  ClientHeight = 508
  ClientWidth = 956
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
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lcBanca: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 956
    Height = 508
    Align = alClient
    TabOrder = 0
    LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
    object lblTitulo: TcxLabel
      Left = 10
      Top = 10
      Caption = 'Cadastro de Bancas e Pontos de Venda'
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
    object mskID: TcxMaskEdit
      Left = 10
      Top = 61
      Hint = 'ID da nanca ou ponto de venda no banco de dados'
      TabStop = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.IgnoreMaskBlank = True
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d\d\d\d\d\d'
      Properties.ReadOnly = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold, fsItalic]
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 1
      Text = '0'
      Width = 71
    end
    object mskCodigo: TcxMaskEdit
      Left = 87
      Top = 61
      Hint = 'C'#243'digo da banca ou ponto de venda'
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.IgnoreMaskBlank = True
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d\d\d\d\d\d'
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 2
      Text = '0'
      Width = 67
    end
    object lcbDistribuidor: TcxLookupComboBox
      Left = 160
      Top = 61
      Hint = 'Selecione o distribuidor'
      ParentFont = False
      Properties.KeyFieldNames = 'COD_DISTRIBUIDOR'
      Properties.ListColumns = <
        item
          Caption = 'C'#243'digo'
          Fixed = True
          HeaderAlignment = taCenter
          SortOrder = soAscending
          FieldName = 'COD_DISTRIBUIDOR'
        end
        item
          Caption = 'Nome'
          HeaderAlignment = taCenter
          FieldName = 'NOM_DISTRIBUIDOR'
        end>
      Properties.ListFieldIndex = 1
      Properties.ListSource = dsDistribuidor
      EditValue = 0
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 3
      Width = 224
    end
    object edtNomeBanca: TcxTextEdit
      Left = 390
      Top = 61
      Hint = 'Nome ou descri'#231#227'o da banca ou ponro de venda'
      ParentFont = False
      Properties.MaxLength = 125
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 4
      Width = 556
    end
    object mskCEP: TcxMaskEdit
      Left = 10
      Top = 106
      Hint = 'CEP do endere'#231'o da banca ou ponto de venda'
      ParentFont = False
      Properties.IgnoreMaskBlank = True
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d\d\d\d\d - \d\d\d'
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 5
      Width = 95
    end
    object edtEndereco: TcxTextEdit
      Left = 10
      Top = 151
      Hint = 'Endere'#231'o da banca ou ponto de venda'
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 50
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 6
      Width = 592
    end
    object edtComplemento: TcxTextEdit
      Left = 608
      Top = 151
      Hint = 'Complemento do endere'#231'o da banca ou ponto de venda'
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 50
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 7
      Width = 338
    end
    object edtBairro: TcxTextEdit
      Left = 10
      Top = 196
      Hint = 'Bairro do endere'#231'o da bancao ou ponto de venda'
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 70
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 8
      Width = 310
    end
    object edtCidade: TcxTextEdit
      Left = 326
      Top = 196
      Hint = 'Cidade do endere'#231'o da banca ou ponto de venda'
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 70
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 9
      Width = 556
    end
    object lcbEstado: TcxLookupComboBox
      Left = 888
      Top = 196
      ParentFont = False
      Properties.KeyFieldNames = 'UF_ESTADO'
      Properties.ListColumns = <
        item
          Caption = 'UF'
          Fixed = True
          FieldName = 'UF_ESTADO'
        end
        item
          Caption = 'Nome'
          Fixed = True
          FieldName = 'NOM_ESTADO'
        end>
      Properties.ListSource = dsEstados
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 10
      Width = 58
    end
    object mskOrdemImpressao: TcxMaskEdit
      Left = 10
      Top = 241
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.IgnoreMaskBlank = True
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d\d\d\d\d\d\d\d\d\d'
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 11
      Width = 95
    end
    object sbBancas: TdxStatusBar
      Left = 10
      Top = 478
      Width = 936
      Height = 20
      Panels = <
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Fixed = False
        end
        item
          PanelStyleClassName = 'TdxStatusBarContainerPanelStyle'
          PanelStyle.Container = sbBancasContainer3
          Bevel = dxpbNone
          Width = 250
        end>
      PaintStyle = stpsUseLookAndFeel
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      object sbBancasContainer3: TdxStatusBarContainerControl
        Left = 685
        Top = 2
        Width = 252
        Height = 17
        object pbBanca: TcxProgressBar
          Left = 0
          Top = 0
          Align = alClient
          TabOrder = 0
          Visible = False
          Width = 252
        end
      end
    end
    object btnIncluir: TcxButton
      Left = 10
      Top = 447
      Width = 75
      Height = 25
      Action = actIncluir
      TabOrder = 13
    end
    object btnLocalizar: TcxButton
      Left = 91
      Top = 447
      Width = 75
      Height = 25
      Action = actLocalizar
      TabOrder = 14
    end
    object btnExcluir: TcxButton
      Left = 172
      Top = 447
      Width = 75
      Height = 25
      Action = actExcluir
      TabOrder = 15
    end
    object btnCancelar: TcxButton
      Left = 253
      Top = 447
      Width = 75
      Height = 25
      Action = actCancelar
      Cancel = True
      TabOrder = 16
    end
    object btnSalvar: TcxButton
      Left = 334
      Top = 447
      Width = 75
      Height = 25
      Action = actSalvar
      TabOrder = 17
    end
    object btnImportar: TcxButton
      Left = 415
      Top = 447
      Width = 75
      Height = 25
      Action = actImportar
      TabOrder = 18
    end
    object btnFechar: TcxButton
      Left = 871
      Top = 447
      Width = 75
      Height = 25
      Action = actFechar
      TabOrder = 19
    end
    object memHistorico: TcxMemo
      Left = 10000
      Top = 10000
      TabStop = False
      Lines.Strings = (
        'nenhum hist'#243'rico registrado')
      ParentFont = False
      Properties.ReadOnly = True
      Properties.ScrollBars = ssBoth
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 12
      Visible = False
      Height = 89
      Width = 185
    end
    object lcgRoot: TdxLayoutGroup
      AlignHorz = ahParentManaged
      AlignVert = avParentManaged
      ButtonOptions.Buttons = <>
      Hidden = True
      ItemIndex = 6
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
    object lciIdBanca: TdxLayoutItem
      Parent = lcgIdBanca
      AlignHorz = ahClient
      CaptionOptions.Text = 'ID'
      CaptionOptions.Layout = clTop
      Control = mskID
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lciCodigo: TdxLayoutItem
      Parent = lcgIdBanca
      AlignHorz = ahClient
      CaptionOptions.Text = 'C'#243'digo'
      CaptionOptions.Layout = clTop
      Control = mskCodigo
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lcgIdBanca: TdxLayoutAutoCreatedGroup
      Parent = lcgRoot
      LayoutDirection = ldHorizontal
      Index = 1
      AutoCreated = True
    end
    object lciDistribuidor: TdxLayoutItem
      Parent = lcgIdBanca
      AlignHorz = ahClient
      CaptionOptions.Text = 'Distribuidor'
      CaptionOptions.Layout = clTop
      Control = lcbDistribuidor
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object lciNomeBanca: TdxLayoutItem
      Parent = lcgIdBanca
      AlignHorz = ahClient
      CaptionOptions.Text = 'Nome'
      CaptionOptions.Layout = clTop
      Control = edtNomeBanca
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object lciCEP: TdxLayoutItem
      Parent = lcgRoot
      AlignHorz = ahLeft
      CaptionOptions.Text = 'CEP'
      CaptionOptions.Layout = clTop
      Control = mskCEP
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object lciEndereco: TdxLayoutItem
      Parent = lcgEndereco
      AlignHorz = ahClient
      CaptionOptions.Text = 'Endereco'
      CaptionOptions.Layout = clTop
      Control = edtEndereco
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lciComplemento: TdxLayoutItem
      Parent = lcgEndereco
      CaptionOptions.Text = 'Complemento'
      CaptionOptions.Layout = clTop
      Control = edtComplemento
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lcgEndereco: TdxLayoutAutoCreatedGroup
      Parent = lcgRoot
      LayoutDirection = ldHorizontal
      Index = 3
      AutoCreated = True
    end
    object lciBairro: TdxLayoutItem
      Parent = lcgLocalidade
      AlignHorz = ahClient
      CaptionOptions.Text = 'Bairro'
      CaptionOptions.Layout = clTop
      Control = edtBairro
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lciCidade: TdxLayoutItem
      Parent = lcgLocalidade
      CaptionOptions.Text = 'Cidade'
      CaptionOptions.Layout = clTop
      Control = edtCidade
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lcgLocalidade: TdxLayoutAutoCreatedGroup
      Parent = lcgRoot
      LayoutDirection = ldHorizontal
      Index = 4
      AutoCreated = True
    end
    object lciEstado: TdxLayoutItem
      Parent = lcgLocalidade
      CaptionOptions.Text = 'UF'
      CaptionOptions.Layout = clTop
      Control = lcbEstado
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object lciOrdemImpressao: TdxLayoutItem
      Parent = lcgRoot
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Ordem Impressao'
      CaptionOptions.Layout = clTop
      Control = mskOrdemImpressao
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object lciBarraStatus: TdxLayoutItem
      Parent = lcgRoot
      AlignVert = avBottom
      CaptionOptions.Text = 'Barra de Status'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      Control = sbBancas
      ControlOptions.ShowBorder = False
      Index = 8
    end
    object lcgOpcoes: TdxLayoutAutoCreatedGroup
      Parent = lcgRoot
      AlignVert = avBottom
      LayoutDirection = ldHorizontal
      Index = 7
      AutoCreated = True
    end
    object lciIncluir: TdxLayoutItem
      Parent = lcgOpcoes
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnIncluir
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lciLocalizar: TdxLayoutItem
      Parent = lcgOpcoes
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnLocalizar
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lciExcluit: TdxLayoutItem
      Parent = lcgOpcoes
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnExcluir
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object lciCancelar: TdxLayoutItem
      Parent = lcgOpcoes
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnCancelar
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object lciSalvar: TdxLayoutItem
      Parent = lcgOpcoes
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnSalvar
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object lciImportar: TdxLayoutItem
      Parent = lcgOpcoes
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnImportar
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object lciFechar: TdxLayoutItem
      Parent = lcgOpcoes
      AlignHorz = ahRight
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnFechar
      ControlOptions.ShowBorder = False
      Index = 6
    end
    object lcgHistorico: TdxLayoutGroup
      Parent = lcgRoot
      AlignVert = avClient
      CaptionOptions.Text = 'Hist'#243'rico'
      ButtonOptions.Buttons = <>
      ButtonOptions.ShowExpandButton = True
      Expanded = False
      OnCaptionClick = lcgHistoricoCaptionClick
      Index = 6
    end
    object lciHistorico: TdxLayoutItem
      Parent = lcgHistorico
      AlignVert = avClient
      CaptionOptions.Text = 'Hist'#243'rico'
      CaptionOptions.Visible = False
      Control = memHistorico
      ControlOptions.ShowBorder = False
      Index = 0
    end
  end
  object dsDistribuidor: TDataSource
    AutoEdit = False
    DataSet = dm.tbDistribuidorVA
    Left = 680
    Top = 8
  end
  object dsEstados: TDataSource
    AutoEdit = False
    DataSet = dm.tbEstados
    Left = 736
    Top = 8
  end
  object aclBancas: TActionList
    Images = dm.iml16x16
    Left = 808
    Top = 8
    object actIncluir: TAction
      Category = 'Cadastro de Bancas'
      Caption = 'Incluir'
      Hint = 'Incluir banca ou ponto de venda'
      ImageIndex = 0
      ShortCut = 16457
      OnExecute = actIncluirExecute
    end
    object actLocalizar: TAction
      Category = 'Cadastro de Bancas'
      Caption = 'Localizar'
      Hint = 'Localizar banca ou ponto de venda'
      ImageIndex = 31
      ShortCut = 16460
      OnExecute = actLocalizarExecute
    end
    object actExcluir: TAction
      Category = 'Cadastro de Bancas'
      Caption = 'Excluir'
      Hint = 'Excluir banca ou ponto de venda'
      ImageIndex = 5
      ShortCut = 32814
      OnExecute = actExcluirExecute
    end
    object actCancelar: TAction
      Category = 'Cadastro de Bancas'
      Caption = 'Cancelar'
      Hint = 'Cancelar opera'#231#227'o (Esc)'
      ImageIndex = 4
      OnExecute = actCancelarExecute
    end
    object actSalvar: TAction
      Category = 'Cadastro de Bancas'
      Caption = 'Salvar'
      Hint = 'Gravar dados da banca ou ponto de venda'
      ImageIndex = 32
      ShortCut = 16467
      OnExecute = actSalvarExecute
    end
    object actImportar: TAction
      Category = 'Cadastro de Bancas'
      Caption = 'Importar'
      Hint = 'Importar planilha gerada no Jones'
      ImageIndex = 29
      OnExecute = actImportarExecute
    end
    object actFechar: TAction
      Category = 'Cadastro de Bancas'
      Caption = 'Fechar'
      Hint = 'Fechar a tela de cadastro'
      ImageIndex = 6
      ShortCut = 16454
      OnExecute = actFecharExecute
    end
  end
  object OpenDialog: TOpenDialog
    Filter = 'CSV (separados por virgulas)|*.csv'
    Title = 'Abrir Planilha Jones'
    Left = 624
    Top = 8
  end
end
