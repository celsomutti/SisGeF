object frmPesquisaCadastro: TfrmPesquisaCadastro
  Left = 0
  Top = 0
  Caption = 'Cadastro'
  ClientHeight = 491
  ClientWidth = 873
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel1: TcxLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alTop
    AutoSize = False
    Caption = 'Cadastro'
    ParentFont = False
    Style.BorderStyle = ebsOffice11
    Style.Edges = [bBottom]
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -21
    Style.Font.Name = 'Century Gothic'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Properties.Alignment.Vert = taVCenter
    Transparent = True
    ExplicitWidth = 1081
    Height = 33
    Width = 867
    AnchorY = 20
  end
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 39
    Width = 873
    Height = 452
    Align = alClient
    TabOrder = 1
    LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
    ExplicitLeft = 496
    ExplicitTop = 272
    ExplicitWidth = 300
    ExplicitHeight = 250
    object dxLayoutControl2: TdxLayoutControl
      Left = 11
      Top = 11
      Width = 846
      Height = 63
      TabOrder = 0
      LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
      object cxTipoCadastro: TcxComboBox
        Left = 97
        Top = 10
        Properties.DropDownListStyle = lsEditFixedList
        Properties.Items.Strings = (
          'Todos'
          'DISTRIBUIDOR'
          'PRESTADOR DE SERVI'#199'O'
          'ENTREGADOR'
          'FUNCION'#193'RIO')
        Style.HotTrack = False
        TabOrder = 0
        Text = 'Todos'
        Width = 168
      end
      object cxDepartamento: TcxComboBox
        Left = 345
        Top = 10
        Properties.DropDownListStyle = lsEditFixedList
        Properties.Items.Strings = (
          'Todos'
          'ADMINISTRA'#199#195'O'
          'EXPEDI'#199#195'O'
          'JORNAL'
          'TRANSPORTE')
        Style.HotTrack = False
        TabOrder = 1
        Text = 'Todos'
        Width = 161
      end
      object cxFilial: TcxComboBox
        Left = 537
        Top = 10
        Properties.DropDownListStyle = lsEditFixedList
        Properties.Items.Strings = (
          'Todos'
          'DUQUE DE CAXIAS'
          'OLARIA'
          'NITER'#211'I'
          'MACA'#201)
        Style.HotTrack = False
        TabOrder = 2
        Text = 'Todos'
        Width = 160
      end
      object dxLayoutControl2Group_Root: TdxLayoutGroup
        AlignHorz = ahLeft
        AlignVert = avTop
        ButtonOptions.Buttons = <>
        Hidden = True
        LayoutDirection = ldHorizontal
        ShowBorder = False
        Index = -1
      end
      object dxLayoutControl2Item1: TdxLayoutItem
        Parent = dxLayoutControl2Group_Root
        CaptionOptions.Text = 'Tipo de Cadastro'
        Control = cxTipoCadastro
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object dxLayoutControl2Item2: TdxLayoutItem
        Parent = dxLayoutControl2Group_Root
        CaptionOptions.Text = 'Departamento'
        Control = cxDepartamento
        ControlOptions.ShowBorder = False
        Index = 1
      end
      object dxLayoutControl2Item3: TdxLayoutItem
        Parent = dxLayoutControl2Group_Root
        CaptionOptions.Text = 'Filial'
        Control = cxFilial
        ControlOptions.ShowBorder = False
        Index = 2
      end
    end
    object cxGrid1: TcxGrid
      Left = 10
      Top = 81
      Width = 250
      Height = 336
      TabOrder = 1
      object cxGrid1DBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsPesquisa
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.NoDataToDisplayInfoText = '<Nenhuma informa'#231#227'o dispon'#237'vel>'
        object cxGrid1DBTableView1RecId: TcxGridDBColumn
          DataBinding.FieldName = 'RecId'
          Visible = False
          VisibleForCustomization = False
          VisibleForEditForm = bFalse
        end
        object cxGrid1DBTableView1COD_CADASTRO: TcxGridDBColumn
          DataBinding.FieldName = 'COD_CADASTRO'
          Width = 20
        end
        object cxGrid1DBTableView1COD_TIPO_CADASTRO: TcxGridDBColumn
          DataBinding.FieldName = 'COD_TIPO_CADASTRO'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'COD_TIPO_CADASTRO'
          Properties.ListColumns = <
            item
              FieldName = 'DES_TIPO_CADASTRO'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dsTipoCadastro
          Visible = False
          GroupIndex = 0
        end
        object cxGrid1DBTableView1COD_DEPARTAMENTO: TcxGridDBColumn
          DataBinding.FieldName = 'COD_DEPARTAMENTO'
          Visible = False
          GroupIndex = 1
        end
        object cxGrid1DBTableView1COD_FILIAL: TcxGridDBColumn
          DataBinding.FieldName = 'COD_FILIAL'
          Visible = False
          GroupIndex = 2
        end
        object cxGrid1DBTableView1COD_SUB_TIPO: TcxGridDBColumn
          DataBinding.FieldName = 'COD_SUB_TIPO'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'COD_SUB_TIPO'
          Properties.ListColumns = <
            item
              FieldName = 'DES_SUB_TIPO'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dsSubTipo
          Visible = False
          VisibleForCustomization = False
          VisibleForEditForm = bTrue
        end
        object cxGrid1DBTableView1NOM_NOME_RAZAO: TcxGridDBColumn
          DataBinding.FieldName = 'NOM_NOME_RAZAO'
        end
        object cxGrid1DBTableView1NOM_RESPONSAVEL: TcxGridDBColumn
          DataBinding.FieldName = 'NOM_RESPONSAVEL'
        end
        object cxGrid1DBTableView1NOM_FANTASIA: TcxGridDBColumn
          DataBinding.FieldName = 'NOM_FANTASIA'
        end
        object cxGrid1DBTableView1COD_FUNCAO: TcxGridDBColumn
          DataBinding.FieldName = 'COD_FUNCAO'
          Visible = False
          VisibleForCustomization = False
          VisibleForEditForm = bFalse
        end
        object cxGrid1DBTableView1DES_TIPO_DOC: TcxGridDBColumn
          DataBinding.FieldName = 'DES_TIPO_DOC'
          Visible = False
          VisibleForCustomization = False
          VisibleForEditForm = bTrue
        end
        object cxGrid1DBTableView1NUM_CPF: TcxGridDBColumn
          DataBinding.FieldName = 'NUM_CPF'
          Visible = False
          VisibleForCustomization = False
          VisibleForEditForm = bTrue
        end
        object cxGrid1DBTableView1NUM_CNPJ: TcxGridDBColumn
          DataBinding.FieldName = 'NUM_CNPJ'
          Visible = False
          VisibleForCustomization = False
          VisibleForEditForm = bTrue
        end
        object cxGrid1DBTableView1NUM_RG: TcxGridDBColumn
          DataBinding.FieldName = 'NUM_RG'
          Visible = False
          VisibleForCustomization = False
          VisibleForEditForm = bTrue
        end
        object cxGrid1DBTableView1NUM_IE: TcxGridDBColumn
          DataBinding.FieldName = 'NUM_IE'
          Visible = False
          VisibleForCustomization = False
          VisibleForEditForm = bTrue
        end
        object cxGrid1DBTableView1NUM_IEST: TcxGridDBColumn
          DataBinding.FieldName = 'NUM_IEST'
          Visible = False
          VisibleForCustomization = False
          VisibleForEditForm = bTrue
        end
        object cxGrid1DBTableView1NUM_IM: TcxGridDBColumn
          DataBinding.FieldName = 'NUM_IM'
          Visible = False
          VisibleForCustomization = False
          VisibleForEditForm = bTrue
        end
        object cxGrid1DBTableView1DES_EXPEDIDOR: TcxGridDBColumn
          DataBinding.FieldName = 'DES_EXPEDIDOR'
          Visible = False
          VisibleForCustomization = False
          VisibleForEditForm = bTrue
        end
        object cxGrid1DBTableView1UF_EXPEDIDOR: TcxGridDBColumn
          DataBinding.FieldName = 'UF_EXPEDIDOR'
          Visible = False
          VisibleForCustomization = False
          VisibleForEditForm = bTrue
        end
        object cxGrid1DBTableView1DAT_EMISSAO_RG: TcxGridDBColumn
          DataBinding.FieldName = 'DAT_EMISSAO_RG'
          Visible = False
          VisibleForCustomization = False
          VisibleForEditForm = bTrue
        end
        object cxGrid1DBTableView1DAT_NASCIMENTO: TcxGridDBColumn
          DataBinding.FieldName = 'DAT_NASCIMENTO'
          Visible = False
          VisibleForCustomization = False
          VisibleForEditForm = bTrue
        end
        object cxGrid1DBTableView1NOM_PAI: TcxGridDBColumn
          DataBinding.FieldName = 'NOM_PAI'
          Visible = False
          VisibleForCustomization = False
          VisibleForEditForm = bTrue
        end
        object cxGrid1DBTableView1NOM_MAE: TcxGridDBColumn
          DataBinding.FieldName = 'NOM_MAE'
          Visible = False
          VisibleForCustomization = False
          VisibleForEditForm = bTrue
        end
        object cxGrid1DBTableView1DES_NATURALIDADE: TcxGridDBColumn
          DataBinding.FieldName = 'DES_NATURALIDADE'
          Visible = False
          VisibleForCustomization = False
          VisibleForEditForm = bTrue
        end
        object cxGrid1DBTableView1UF_NATURALIDADE: TcxGridDBColumn
          DataBinding.FieldName = 'UF_NATURALIDADE'
          Visible = False
          VisibleForCustomization = False
          VisibleForEditForm = bTrue
        end
        object cxGrid1DBTableView1NUM_SUFRAMA: TcxGridDBColumn
          DataBinding.FieldName = 'NUM_SUFRAMA'
          Visible = False
          VisibleForCustomization = False
          VisibleForEditForm = bTrue
        end
        object cxGrid1DBTableView1NUM_CNH: TcxGridDBColumn
          DataBinding.FieldName = 'NUM_CNH'
          Visible = False
          VisibleForCustomization = False
          VisibleForEditForm = bTrue
        end
        object cxGrid1DBTableView1NUM_CNAE: TcxGridDBColumn
          DataBinding.FieldName = 'NUM_CNAE'
          Visible = False
          VisibleForCustomization = False
          VisibleForEditForm = bTrue
        end
        object cxGrid1DBTableView1NUM_CRT: TcxGridDBColumn
          DataBinding.FieldName = 'NUM_CRT'
          Visible = False
          VisibleForCustomization = False
          VisibleForEditForm = bTrue
        end
        object cxGrid1DBTableView1NUM_REGISTRO_CNH: TcxGridDBColumn
          DataBinding.FieldName = 'NUM_REGISTRO_CNH'
          Visible = False
          VisibleForCustomization = False
          VisibleForEditForm = bTrue
        end
        object cxGrid1DBTableView1UF_CNH: TcxGridDBColumn
          DataBinding.FieldName = 'UF_CNH'
          Visible = False
          VisibleForCustomization = False
          VisibleForEditForm = bTrue
        end
        object cxGrid1DBTableView1DAT_VALIDADE_CNH: TcxGridDBColumn
          DataBinding.FieldName = 'DAT_VALIDADE_CNH'
          Visible = False
          VisibleForCustomization = False
          VisibleForEditForm = bTrue
        end
        object cxGrid1DBTableView1DES_CATEGORIA_CNH: TcxGridDBColumn
          DataBinding.FieldName = 'DES_CATEGORIA_CNH'
          Visible = False
          VisibleForCustomization = False
          VisibleForEditForm = bTrue
        end
        object cxGrid1DBTableView1DAT_PRIMEIRA_CNH: TcxGridDBColumn
          DataBinding.FieldName = 'DAT_PRIMEIRA_CNH'
          Visible = False
          VisibleForCustomization = False
          VisibleForEditForm = bTrue
        end
        object cxGrid1DBTableView1NUM_PIS: TcxGridDBColumn
          DataBinding.FieldName = 'NUM_PIS'
          Visible = False
          VisibleForCustomization = False
          VisibleForEditForm = bTrue
        end
        object cxGrid1DBTableView1NUM_CTPS: TcxGridDBColumn
          DataBinding.FieldName = 'NUM_CTPS'
          Visible = False
          VisibleForCustomization = False
          VisibleForEditForm = bTrue
        end
        object cxGrid1DBTableView1NUM_SERIE_CTPS: TcxGridDBColumn
          DataBinding.FieldName = 'NUM_SERIE_CTPS'
          Visible = False
          VisibleForCustomization = False
          VisibleForEditForm = bTrue
        end
        object cxGrid1DBTableView1UF_CTPS: TcxGridDBColumn
          DataBinding.FieldName = 'UF_CTPS'
          Visible = False
          VisibleForCustomization = False
          VisibleForEditForm = bTrue
        end
        object cxGrid1DBTableView1DES_ESTADO_CIVIL: TcxGridDBColumn
          DataBinding.FieldName = 'DES_ESTADO_CIVIL'
          Visible = False
          VisibleForCustomization = False
          VisibleForEditForm = bTrue
        end
        object cxGrid1DBTableView1NUM_TITULO_ELEITOR: TcxGridDBColumn
          DataBinding.FieldName = 'NUM_TITULO_ELEITOR'
          Visible = False
          VisibleForCustomization = False
          VisibleForEditForm = bTrue
        end
        object cxGrid1DBTableView1NUM_RESERVISTA: TcxGridDBColumn
          DataBinding.FieldName = 'NUM_RESERVISTA'
          Visible = False
          VisibleForCustomization = False
          VisibleForEditForm = bTrue
        end
        object cxGrid1DBTableView1DES_FORMA_CREDITO: TcxGridDBColumn
          DataBinding.FieldName = 'DES_FORMA_CREDITO'
          Visible = False
          VisibleForCustomization = False
          VisibleForEditForm = bTrue
        end
        object cxGrid1DBTableView1DES_TIPO_CONTA: TcxGridDBColumn
          DataBinding.FieldName = 'DES_TIPO_CONTA'
          Visible = False
          VisibleForCustomization = False
          VisibleForEditForm = bTrue
        end
        object cxGrid1DBTableView1COD_BANCO: TcxGridDBColumn
          DataBinding.FieldName = 'COD_BANCO'
          Visible = False
          VisibleForCustomization = False
          VisibleForEditForm = bTrue
        end
        object cxGrid1DBTableView1NUM_AGENCIA: TcxGridDBColumn
          DataBinding.FieldName = 'NUM_AGENCIA'
          Visible = False
          VisibleForCustomization = False
          VisibleForEditForm = bTrue
        end
        object cxGrid1DBTableView1NUM_CONTA: TcxGridDBColumn
          DataBinding.FieldName = 'NUM_CONTA'
          Visible = False
          VisibleForCustomization = False
          VisibleForEditForm = bTrue
        end
        object cxGrid1DBTableView1NOM_FAVORECIDO: TcxGridDBColumn
          DataBinding.FieldName = 'NOM_FAVORECIDO'
          Visible = False
          VisibleForCustomization = False
          VisibleForEditForm = bTrue
        end
        object cxGrid1DBTableView1NUM_CPF_CNPJ_FAVORECIDO: TcxGridDBColumn
          DataBinding.FieldName = 'NUM_CPF_CNPJ_FAVORECIDO'
          Visible = False
          VisibleForCustomization = False
          VisibleForEditForm = bTrue
        end
        object cxGrid1DBTableView1DAT_CADASTRO: TcxGridDBColumn
          DataBinding.FieldName = 'DAT_CADASTRO'
          Visible = False
          VisibleForCustomization = False
          VisibleForEditForm = bTrue
        end
        object cxGrid1DBTableView1COD_USUARIO_PROPRIETARIO: TcxGridDBColumn
          DataBinding.FieldName = 'COD_USUARIO_PROPRIETARIO'
          Visible = False
          VisibleForCustomization = False
          VisibleForEditForm = bTrue
        end
        object cxGrid1DBTableView1NUM_ROTEIRO: TcxGridDBColumn
          DataBinding.FieldName = 'NUM_ROTEIRO'
          Visible = False
          VisibleForCustomization = False
          VisibleForEditForm = bTrue
        end
        object cxGrid1DBTableView1DES_STATUS_GR: TcxGridDBColumn
          DataBinding.FieldName = 'DES_STATUS_GR'
          Visible = False
          VisibleForCustomization = False
          VisibleForEditForm = bTrue
        end
        object cxGrid1DBTableView1DES_STATUS_CADASTRO: TcxGridDBColumn
          DataBinding.FieldName = 'DES_STATUS_CADASTRO'
          Visible = False
          VisibleForCustomization = False
          VisibleForEditForm = bTrue
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
    object dxLayoutControl1Group_Root: TdxLayoutGroup
      AlignHorz = ahLeft
      AlignVert = avTop
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object dxLayoutControl1Item1: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      CaptionOptions.Text = 'dxLayoutControl2'
      CaptionOptions.Visible = False
      LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
      Control = dxLayoutControl2
      Index = 0
    end
    object dxLayoutControl1Item2: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      CaptionOptions.Text = 'cxGrid1'
      CaptionOptions.Visible = False
      Control = cxGrid1
      ControlOptions.ShowBorder = False
      Index = 1
    end
  end
  object dsPesquisa: TDataSource
    AutoEdit = False
    DataSet = tbPesquisa
    Left = 683
    Top = 11
  end
  object aclCadastro: TActionList
    Images = dm.cxImageList1
    Left = 720
    Top = 8
    object Action1: TAction
      Caption = 'Cadastro'
    end
  end
  object tbPesquisa: TdxMemData
    Indexes = <>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F340000000400000003000D00434F445F4341444153
      54524F000400000003001200434F445F5449504F5F434144415354524F000400
      000003001100434F445F444550415254414D454E544F000400000003000D0043
      4F445F5355425F5449504F000400000003000B00434F445F46494C49414C0046
      00000014000F004E4F4D5F4E4F4D455F52415A414F0046000000140010004E4F
      4D5F524553504F4E534156454C004600000014000D004E4F4D5F46414E544153
      4941000400000003000B00434F445F46554E43414F000400000014000D004445
      535F5449504F5F444F430014000000140008004E554D5F435046001400000014
      0009004E554D5F434E504A0014000000140007004E554D5F5247001400000014
      0007004E554D5F49450014000000140009004E554D5F49455354001400000014
      0007004E554D5F494D004600000014000E004445535F455850454449444F5200
      0200000014000D0055465F455850454449444F52000400000009000F00444154
      5F454D495353414F5F5247000400000009000F004441545F4E415343494D454E
      544F0046000000140008004E4F4D5F5041490046000000140008004E4F4D5F4D
      41450046000000140011004445535F4E41545552414C49444144450002000000
      1400100055465F4E41545552414C4944414445001400000014000C004E554D5F
      53554652414D410014000000140008004E554D5F434E48001400000014000900
      4E554D5F434E41450004000000030008004E554D5F4352540014000000140011
      004E554D5F524547495354524F5F434E4800020000001400070055465F434E48
      0004000000090011004441545F56414C49444144455F434E4800020000001400
      12004445535F43415445474F5249415F434E480004000000090011004441545F
      5052494D454952415F434E480014000000140008004E554D5F50495300140000
      00140009004E554D5F43545053000A00000014000F004E554D5F53455249455F
      4354505300020000001400080055465F43545053001E00000014001100444553
      5F45535441444F5F434956494C0014000000140013004E554D5F544954554C4F
      5F454C4549544F52001400000014000F004E554D5F5245534552564953544100
      28000000140012004445535F464F524D415F4352454449544F001E0000001400
      0F004445535F5449504F5F434F4E5441000400000014000A00434F445F42414E
      434F000A00000014000C004E554D5F4147454E434941001400000014000A004E
      554D5F434F4E5441004600000014000F004E4F4D5F4641564F52454349444F00
      14000000140018004E554D5F4350465F434E504A5F4641564F52454349444F00
      0400000009000D004441545F434144415354524F000400000003001900434F44
      5F5553554152494F5F50524F50524945544152494F000400000003000C004E55
      4D5F524F544549524F001400000014000E004445535F5354415455535F475200
      04000000030014004445535F5354415455535F434144415354524F00}
    SortOptions = []
    Left = 637
    Top = 13
    object tbPesquisaCOD_CADASTRO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_CADASTRO'
    end
    object tbPesquisaCOD_TIPO_CADASTRO: TIntegerField
      DisplayLabel = 'Tipo de Cadastro'
      FieldName = 'COD_TIPO_CADASTRO'
    end
    object tbPesquisaCOD_DEPARTAMENTO: TIntegerField
      DisplayLabel = 'Departamento'
      FieldName = 'COD_DEPARTAMENTO'
    end
    object tbPesquisaCOD_SUB_TIPO: TIntegerField
      DisplayLabel = 'Sub-Tipo Cadastro'
      FieldName = 'COD_SUB_TIPO'
    end
    object tbPesquisaCOD_FILIAL: TIntegerField
      DisplayLabel = 'Filial'
      FieldName = 'COD_FILIAL'
    end
    object tbPesquisaNOM_NOME_RAZAO: TWideStringField
      DisplayLabel = 'Raz'#227'o Social/Nome'
      FieldName = 'NOM_NOME_RAZAO'
      Size = 70
    end
    object tbPesquisaNOM_RESPONSAVEL: TWideStringField
      DisplayLabel = 'Respons'#225'vel'
      FieldName = 'NOM_RESPONSAVEL'
      Size = 70
    end
    object tbPesquisaNOM_FANTASIA: TWideStringField
      DisplayLabel = 'Nome Fantasia'
      FieldName = 'NOM_FANTASIA'
      Size = 70
    end
    object tbPesquisaCOD_FUNCAO: TIntegerField
      DisplayLabel = 'Fun'#231#227'o'
      FieldName = 'COD_FUNCAO'
    end
    object tbPesquisaDES_TIPO_DOC: TWideStringField
      DisplayLabel = 'Tipo de Documento'
      FieldName = 'DES_TIPO_DOC'
      Size = 4
    end
    object tbPesquisaNUM_CPF: TWideStringField
      DisplayLabel = 'CPF'
      FieldName = 'NUM_CPF'
    end
    object tbPesquisaNUM_CNPJ: TWideStringField
      DisplayLabel = 'CNPJ'
      FieldName = 'NUM_CNPJ'
    end
    object tbPesquisaNUM_RG: TWideStringField
      DisplayLabel = 'RG'
      FieldName = 'NUM_RG'
    end
    object tbPesquisaNUM_IE: TWideStringField
      DisplayLabel = 'Inscr. Estadual'
      FieldName = 'NUM_IE'
    end
    object tbPesquisaNUM_IEST: TWideStringField
      DisplayLabel = 'Inscr. Estadual Subst. Tribut'#225'ria'
      FieldName = 'NUM_IEST'
    end
    object tbPesquisaNUM_IM: TWideStringField
      DisplayLabel = 'Inscr. Municipal'
      FieldName = 'NUM_IM'
    end
    object tbPesquisaDES_EXPEDIDOR: TWideStringField
      DisplayLabel = 'Expedidor RG'
      FieldName = 'DES_EXPEDIDOR'
      Size = 70
    end
    object tbPesquisaUF_EXPEDIDOR: TWideStringField
      DisplayLabel = 'UF Expedidor'
      FieldName = 'UF_EXPEDIDOR'
      Size = 2
    end
    object tbPesquisaDAT_EMISSAO_RG: TDateField
      DisplayLabel = 'Data Emiss'#227'o RG'
      FieldName = 'DAT_EMISSAO_RG'
    end
    object tbPesquisaDAT_NASCIMENTO: TDateField
      DisplayLabel = 'Data Nascimento'
      FieldName = 'DAT_NASCIMENTO'
    end
    object tbPesquisaNOM_PAI: TWideStringField
      DisplayLabel = 'Nome do Pai'
      FieldName = 'NOM_PAI'
      Size = 70
    end
    object tbPesquisaNOM_MAE: TWideStringField
      DisplayLabel = 'Nome da M'#227'e'
      FieldName = 'NOM_MAE'
      Size = 70
    end
    object tbPesquisaDES_NATURALIDADE: TWideStringField
      DisplayLabel = 'Naturalidade'
      FieldName = 'DES_NATURALIDADE'
      Size = 70
    end
    object tbPesquisaUF_NATURALIDADE: TWideStringField
      DisplayLabel = 'UF Naturalidade'
      FieldName = 'UF_NATURALIDADE'
      Size = 2
    end
    object tbPesquisaNUM_SUFRAMA: TWideStringField
      DisplayLabel = 'SUFRAMA'
      FieldName = 'NUM_SUFRAMA'
    end
    object tbPesquisaNUM_CNH: TWideStringField
      DisplayLabel = 'N'#186'. CNH'
      FieldName = 'NUM_CNH'
    end
    object tbPesquisaNUM_CNAE: TWideStringField
      DisplayLabel = 'CNAE'
      FieldName = 'NUM_CNAE'
    end
    object tbPesquisaNUM_CRT: TIntegerField
      DisplayLabel = 'CRT'
      FieldName = 'NUM_CRT'
    end
    object tbPesquisaNUM_REGISTRO_CNH: TWideStringField
      DisplayLabel = 'Registro CNH'
      FieldName = 'NUM_REGISTRO_CNH'
    end
    object tbPesquisaUF_CNH: TWideStringField
      DisplayLabel = 'UF CNH'
      FieldName = 'UF_CNH'
      Size = 2
    end
    object tbPesquisaDAT_VALIDADE_CNH: TDateField
      DisplayLabel = 'Validade CNH'
      FieldName = 'DAT_VALIDADE_CNH'
    end
    object tbPesquisaDES_CATEGORIA_CNH: TWideStringField
      DisplayLabel = 'Categoria CNH'
      FieldName = 'DES_CATEGORIA_CNH'
      Size = 2
    end
    object tbPesquisaDAT_PRIMEIRA_CNH: TDateField
      DisplayLabel = 'Data Primeira CNH'
      FieldName = 'DAT_PRIMEIRA_CNH'
    end
    object tbPesquisaNUM_PIS: TWideStringField
      DisplayLabel = 'PIS'
      FieldName = 'NUM_PIS'
    end
    object tbPesquisaNUM_CTPS: TWideStringField
      DisplayLabel = 'CTPS'
      FieldName = 'NUM_CTPS'
    end
    object tbPesquisaNUM_SERIE_CTPS: TWideStringField
      DisplayLabel = 'S'#233'rie CTPS'
      FieldName = 'NUM_SERIE_CTPS'
      Size = 10
    end
    object tbPesquisaUF_CTPS: TWideStringField
      DisplayLabel = 'UF CTPS'
      FieldName = 'UF_CTPS'
      Size = 2
    end
    object tbPesquisaDES_ESTADO_CIVIL: TWideStringField
      DisplayLabel = 'Estado Civil'
      FieldName = 'DES_ESTADO_CIVIL'
      Size = 30
    end
    object tbPesquisaNUM_TITULO_ELEITOR: TWideStringField
      DisplayLabel = 'Titulo de Eleitor'
      FieldName = 'NUM_TITULO_ELEITOR'
    end
    object tbPesquisaNUM_RESERVISTA: TWideStringField
      DisplayLabel = 'Reservista'
      FieldName = 'NUM_RESERVISTA'
    end
    object tbPesquisaDES_FORMA_CREDITO: TWideStringField
      DisplayLabel = 'Forma de Cr'#233'dito'
      FieldName = 'DES_FORMA_CREDITO'
      Size = 40
    end
    object tbPesquisaDES_TIPO_CONTA: TWideStringField
      DisplayLabel = 'Tipo de Conta'
      FieldName = 'DES_TIPO_CONTA'
      Size = 30
    end
    object tbPesquisaCOD_BANCO: TWideStringField
      DisplayLabel = 'Banco'
      FieldName = 'COD_BANCO'
      Size = 4
    end
    object tbPesquisaNUM_AGENCIA: TWideStringField
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'NUM_AGENCIA'
      Size = 10
    end
    object tbPesquisaNUM_CONTA: TWideStringField
      DisplayLabel = 'N'#186'. Conta Corrente/Poupan'#231'a'
      FieldName = 'NUM_CONTA'
    end
    object tbPesquisaNOM_FAVORECIDO: TWideStringField
      DisplayLabel = 'Nome do Favorecido'
      FieldName = 'NOM_FAVORECIDO'
      Size = 70
    end
    object tbPesquisaNUM_CPF_CNPJ_FAVORECIDO: TWideStringField
      DisplayLabel = 'CPF/CNPJ Favorecido'
      FieldName = 'NUM_CPF_CNPJ_FAVORECIDO'
    end
    object tbPesquisaDAT_CADASTRO: TDateField
      DisplayLabel = 'Data do Cadastro'
      FieldName = 'DAT_CADASTRO'
    end
    object tbPesquisaCOD_USUARIO_PROPRIETARIO: TIntegerField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'COD_USUARIO_PROPRIETARIO'
    end
    object tbPesquisaNUM_ROTEIRO: TIntegerField
      DisplayLabel = 'Roteiro'
      FieldName = 'NUM_ROTEIRO'
    end
    object tbPesquisaDES_STATUS_GR: TWideStringField
      DisplayLabel = 'Status GR'
      FieldName = 'DES_STATUS_GR'
    end
    object tbPesquisaDES_STATUS_CADASTRO: TIntegerField
      DisplayLabel = 'Status Cadastro'
      FieldName = 'DES_STATUS_CADASTRO'
    end
  end
  object dsTipoCadastro: TDataSource
    AutoEdit = False
    DataSet = dm.tbTipoCadastro
    Left = 451
    Top = 11
  end
  object dsSubTipo: TDataSource
    AutoEdit = False
    DataSet = dm.tbSubTipo
    Left = 499
    Top = 11
  end
  object dsDepartamentos: TDataSource
    AutoEdit = False
    DataSet = dm.tbDepartamentos
    Left = 539
    Top = 11
  end
  object dsFilial: TDataSource
    AutoEdit = False
    DataSet = dm.tbFiliais
    Left = 579
    Top = 11
  end
end
