object frmCadastroUsuarios: TfrmCadastroUsuarios
  Left = 0
  Top = 0
  Caption = 'Usu'#225'rios'
  ClientHeight = 481
  ClientWidth = 966
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 22
    Width = 966
    Height = 459
    Align = alClient
    TabOrder = 0
    object lblTitulo: TcxLabel
      Left = 10
      Top = 10
      AutoSize = False
      Caption = 'Cadastro de Usu'#225'rios '
      ParentFont = False
      Style.Edges = [bBottom]
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -19
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.TextStyle = []
      Style.TransparentBorder = True
      Style.IsFontAssigned = True
      Transparent = True
      Height = 27
      Width = 946
    end
    object edtCodigo: TcxMaskEdit
      Left = 48
      Top = 43
      Properties.Alignment.Horz = taRightJustify
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d\d\d\d\d\d'
      Properties.ReadOnly = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 1
      Text = '0'
      Width = 89
    end
    object edtNome: TcxTextEdit
      Left = 48
      Top = 70
      Properties.MaxLength = 80
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 3
      Width = 908
    end
    object edtLogin: TcxTextEdit
      Left = 48
      Top = 97
      Properties.MaxLength = 30
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 4
      Width = 908
    end
    object edtEMail: TcxTextEdit
      Left = 48
      Top = 124
      Properties.CharCase = ecLowerCase
      Properties.MaxLength = 150
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 5
      Width = 908
    end
    object edtGrupo: TcxButtonEdit
      Left = 48
      Top = 151
      Properties.Alignment.Horz = taRightJustify
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.IgnoreMaskBlank = True
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d\d\d\d\d'
      Properties.OnButtonClick = edtGrupoPropertiesButtonClick
      Properties.OnValidate = edtGrupoPropertiesValidate
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 6
      Text = '0'
      Width = 89
    end
    object lblGrupo: TcxLabel
      Left = 143
      Top = 151
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.Shadow = False
      Style.IsFontAssigned = True
      Properties.Alignment.Vert = taVCenter
      Height = 21
      Width = 813
      AnchorY = 162
    end
    object chkExpiraSenha: TcxCheckBox
      Left = 199
      Top = 178
      Caption = 'Senha expira em'
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'N'
      Properties.OnChange = chkExpiraSenhaPropertiesChange
      State = cbsGrayed
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 9
    end
    object edtDiasExpira: TcxSpinEdit
      Left = 309
      Top = 178
      Enabled = False
      Properties.AssignedValues.MaxValue = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      TabOrder = 10
      Width = 41
    end
    object cxLabel1: TcxLabel
      Left = 356
      Top = 178
      Caption = 'dias.'
      Style.HotTrack = False
    end
    object cboNivel: TcxComboBox
      Left = 48
      Top = 178
      Properties.Items.Strings = (
        'Master'
        'User'
        'Guest'
        'Custom'
        'External')
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 8
      Text = 'User'
      Width = 145
    end
    object chkAtivo: TcxCheckBox
      Left = 389
      Top = 178
      Caption = 'Usu'#225'rio INATIVO'
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'N'
      Properties.OnChange = chkAtivoPropertiesChange
      State = cbsGrayed
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 12
    end
    object grdAcessos: TcxGrid
      Left = 10
      Top = 223
      Width = 946
      Height = 200
      TabOrder = 13
      object tvAcessos: TcxGridDBTableView
        PopupMenu = popgrdAcessos
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsAcessos
        DataController.DetailKeyFieldNames = 'RecId'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnMoving = False
        OptionsCustomize.ColumnSorting = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        object tvAcessosRecId: TcxGridDBColumn
          DataBinding.FieldName = 'RecId'
          Visible = False
        end
        object tvAcessosDOM_SELECAO: TcxGridDBColumn
          DataBinding.FieldName = 'DOM_SELECAO'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = 'S'
          Properties.ValueUnchecked = 'N'
          HeaderAlignmentHorz = taCenter
          Width = 51
        end
        object tvAcessosDES_CATEGORIA: TcxGridDBColumn
          DataBinding.FieldName = 'DES_CATEGORIA'
          Visible = False
          GroupIndex = 0
        end
        object tvAcessosDES_MENU: TcxGridDBColumn
          DataBinding.FieldName = 'DES_MENU'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 872
        end
        object tvAcessosDES_ACTION: TcxGridDBColumn
          DataBinding.FieldName = 'DES_ACTION'
          Visible = False
        end
        object tvAcessosDES_FORM: TcxGridDBColumn
          DataBinding.FieldName = 'DES_FORM'
          Visible = False
        end
      end
      object lvAcessos: TcxGridLevel
        GridView = tvAcessos
      end
    end
    object chkCadastraGrupo: TcxCheckBox
      Left = 143
      Top = 43
      Caption = 'Cadastrar Grupo'
      Properties.OnChange = chkCadastraGrupoPropertiesChange
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 2
    end
    object lcgRoot: TdxLayoutGroup
      AlignHorz = ahParentManaged
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
    object lciCodigo: TdxLayoutItem
      Parent = dxLayoutControl1Group1
      AlignHorz = ahLeft
      CaptionOptions.Text = 'C'#243'digo'
      Control = edtCodigo
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lciNome: TdxLayoutItem
      Parent = lcgRoot
      CaptionOptions.Text = 'Nome'
      Control = edtNome
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object lciLogin: TdxLayoutItem
      Parent = lcgRoot
      CaptionOptions.Text = 'Login'
      Control = edtLogin
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object lciEMail: TdxLayoutItem
      Parent = lcgRoot
      CaptionOptions.Text = 'E-Mail'
      Control = edtEMail
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object lciCodigoGrupo: TdxLayoutItem
      Parent = lcgGrupo
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Grupo'
      Control = edtGrupo
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lciNomeGrupo: TdxLayoutItem
      Parent = lcgGrupo
      CaptionOptions.Text = 'cxLabel2'
      CaptionOptions.Visible = False
      Control = lblGrupo
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lcgGrupo: TdxLayoutAutoCreatedGroup
      Parent = lcgRoot
      LayoutDirection = ldHorizontal
      Index = 5
      AutoCreated = True
    end
    object lciExpira: TdxLayoutItem
      Parent = lcgNivel
      AlignHorz = ahLeft
      CaptionOptions.Visible = False
      Control = chkExpiraSenha
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lciDiasExpira: TdxLayoutItem
      Parent = lcgNivel
      Control = edtDiasExpira
      ControlOptions.ShowBorder = False
      Enabled = False
      Index = 2
    end
    object lcgNivel: TdxLayoutAutoCreatedGroup
      Parent = lcgRoot
      LayoutDirection = ldHorizontal
      Index = 6
      AutoCreated = True
    end
    object lblDias: TdxLayoutItem
      Parent = lcgNivel
      CaptionOptions.Visible = False
      Control = cxLabel1
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object lciNivel: TdxLayoutItem
      Parent = lcgNivel
      AlignHorz = ahLeft
      CaptionOptions.Text = 'N'#237'vel'
      Control = cboNivel
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lciAtivo: TdxLayoutItem
      Parent = lcgNivel
      CaptionOptions.Text = 'Usu'#225'rio Inativo'
      CaptionOptions.Visible = False
      Control = chkAtivo
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object lciAcessos: TdxLayoutItem
      Parent = lcgRoot
      AlignVert = avClient
      CaptionOptions.Text = 'Acessos'
      CaptionOptions.Layout = clTop
      Control = grdAcessos
      ControlOptions.ShowBorder = False
      Index = 7
    end
    object lciCadastraCrupo: TdxLayoutItem
      Parent = dxLayoutControl1Group1
      CaptionOptions.Visible = False
      Control = chkCadastraGrupo
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Group1: TdxLayoutAutoCreatedGroup
      Parent = lcgRoot
      LayoutDirection = ldHorizontal
      Index = 1
      AutoCreated = True
    end
  end
  object aclUsuarios: TActionList
    Images = dm.iml16x16
    Left = 840
    Top = 16
    object actIncluir: TAction
      Category = 'Cadastro'
      Caption = '&Incluir'
      Hint = 'Incluir Usu'#225'rios'
      ImageIndex = 0
      ShortCut = 113
      OnExecute = actIncluirExecute
    end
    object actCancelar: TAction
      Category = 'Cadastro'
      Caption = 'Cancelar'
      Hint = 'Cancelar Opera'#231#227'o'
      ImageIndex = 4
      OnExecute = actCancelarExecute
    end
    object actLocalizar: TAction
      Category = 'Cadastro'
      Caption = '&Localizar'
      Hint = 'Localizar Usu'#225'rios'
      ImageIndex = 31
      ShortCut = 119
      OnExecute = actLocalizarExecute
    end
    object actSenha: TAction
      Category = 'Cadastro'
      Caption = 'Alterar &Senha'
      Hint = 'Alterar a Senha do usu'#225'rio'
      ImageIndex = 35
      OnExecute = actSenhaExecute
    end
    object actConsistir: TAction
      Category = 'Cadastro'
      Caption = 'Consistir Gr&upo'
      Hint = 'Consistir Acessos do Usu'#225'rio com base no Grupo.'
      ImageIndex = 36
      OnExecute = actConsistirExecute
    end
    object actUsuarioBD: TAction
      Category = 'Cadastro'
      Caption = 'Usu'#225'rio &BD'
      Hint = 'Criar Usu'#225'rio do Banco de Dados'
      ImageIndex = 37
      OnExecute = actUsuarioBDExecute
    end
    object actGravar: TAction
      Category = 'Cadastro'
      Caption = '&Gravar'
      Hint = 'Grvar os dados'
      ImageIndex = 32
      ShortCut = 116
      OnExecute = actGravarExecute
    end
    object actFechar: TAction
      Category = 'Cadastro'
      Caption = '&Fechar'
      Hint = 'Fechar tela.'
      ImageIndex = 6
      OnExecute = actFecharExecute
    end
    object actSelecionarTodos: TAction
      Category = 'Cadastro'
      Caption = 'Selecionar Todos'
      Hint = 'Selecionar Todos os Acessos'
      ImageIndex = 3
      OnExecute = actSelecionarTodosExecute
    end
    object actDesmarcarTodos: TAction
      Category = 'Cadastro'
      Caption = 'Demarcar Todos'
      Hint = 'Desmarcar Todos os Acessos'
      ImageIndex = 4
      OnExecute = actDesmarcarTodosExecute
    end
  end
  object bmUsuarios: TdxBarManager
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
    ImageOptions.Images = dm.iml16x16
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 776
    Top = 16
    DockControlHeights = (
      0
      0
      22
      0)
    object bmUsuariosBar1: TdxBar
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
      FloatLeft = 1000
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton1'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton8'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton5'
        end
        item
          Visible = True
          ItemName = 'dxBarButton2'
        end
        item
          Visible = True
          ItemName = 'dxBarButton3'
        end
        item
          Visible = True
          ItemName = 'dxBarButton7'
        end
        item
          Visible = True
          ItemName = 'dxBarButton6'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton4'
        end>
      OneOnRow = True
      Row = 0
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
      Action = actSenha
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton3: TdxBarButton
      Action = actConsistir
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton4: TdxBarButton
      Action = actFechar
      Align = iaRight
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton5: TdxBarButton
      Action = actLocalizar
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton6: TdxBarButton
      Action = actGravar
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton7: TdxBarButton
      Action = actUsuarioBD
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton8: TdxBarButton
      Action = actCancelar
      Category = 0
      PaintStyle = psCaptionGlyph
    end
  end
  object dsAcessos: TDataSource
    AutoEdit = False
    DataSet = tbAcessos
    Left = 688
    Top = 16
  end
  object tbAcessos: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 728
    Top = 16
    object tbAcessosDOM_SELECAO: TStringField
      DisplayLabel = 'Sele'#231#227'o'
      FieldName = 'DOM_SELECAO'
      Size = 1
    end
    object tbAcessosDES_CATEGORIA: TStringField
      DisplayLabel = 'Categoria'
      FieldName = 'DES_CATEGORIA'
      Size = 256
    end
    object tbAcessosDES_MENU: TStringField
      DisplayLabel = 'M'#243'dulo'
      FieldName = 'DES_MENU'
      Size = 256
    end
    object tbAcessosDES_ACTION: TStringField
      DisplayLabel = 'Nome Action'
      FieldName = 'DES_ACTION'
      Size = 256
    end
    object tbAcessosDES_FORM: TStringField
      FieldName = 'DES_FORM'
      Size = 150
    end
  end
  object popgrdAcessos: TPopupMenu
    Left = 640
    Top = 16
    object SelecionarTodos1: TMenuItem
      Action = actSelecionarTodos
    end
    object DemarcarTodos1: TMenuItem
      Action = actDesmarcarTodos
    end
  end
end
