object frmEmpresas: TfrmEmpresas
  Left = 0
  Top = 0
  Caption = 'Cadastro de Empresas'
  ClientHeight = 664
  ClientWidth = 1265
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesigned
  ShowHint = True
  Visible = True
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel27: TcxLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alTop
    AutoSize = False
    Caption = 'Empresas'
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
    Width = 1259
    AnchorY = 22
  end
  object dxStatusBar1: TdxStatusBar
    Left = 0
    Top = 644
    Width = 1265
    Height = 20
    Panels = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object cxPageControl1: TcxPageControl
    AlignWithMargins = True
    Left = 3
    Top = 47
    Width = 1259
    Height = 594
    Align = alClient
    TabOrder = 2
    Properties.ActivePage = cxTabSheet1
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 592
    ClientRectLeft = 2
    ClientRectRight = 1257
    ClientRectTop = 28
    object cxTabSheet1: TcxTabSheet
      Caption = 'Pesquisa'
      ImageIndex = 0
      DesignSize = (
        1255
        564)
      object cxGrid1: TcxGrid
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 1249
        Height = 527
        Align = alTop
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        object cxGrid1DBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.PriorPage.Visible = False
          Navigator.Buttons.NextPage.Visible = False
          Navigator.Buttons.Insert.Visible = False
          Navigator.Buttons.Delete.Visible = False
          Navigator.Buttons.Edit.Visible = False
          Navigator.Buttons.Post.Visible = False
          Navigator.Buttons.Cancel.Visible = False
          Navigator.Buttons.Refresh.Visible = False
          Navigator.Buttons.SaveBookmark.Visible = False
          Navigator.Buttons.GotoBookmark.Visible = False
          Navigator.Buttons.Filter.Visible = False
          Navigator.InfoPanel.DisplayMask = 'Registro [RecordIndex] de [RecordCount]'
          Navigator.InfoPanel.Visible = True
          Navigator.Visible = True
          OnCanFocusRecord = cxGrid1DBTableView1CanFocusRecord
          DataController.DataSource = dsEmpresas
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          FilterRow.InfoText = 'Clique aqui para localizar'
          FilterRow.ApplyChanges = fracDelayed
          NewItemRow.InfoText = 'Clique aqui para Localizar'
          OptionsSelection.InvertSelect = False
          OptionsSelection.MultiSelect = True
          OptionsSelection.CellMultiSelect = True
          OptionsView.NoDataToDisplayInfoText = '<Nenhuma informa'#231#227'o dispon'#237'vel>'
          OptionsView.CellAutoHeight = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          object cxGrid1DBTableView1COD_EMPRESA: TcxGridDBColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'COD_EMPRESA'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.IgnoreMaskBlank = True
            Properties.MaskKind = emkRegExpr
            Properties.EditMask = '\d\d\d\d\d\d'
            HeaderAlignmentHorz = taCenter
            Width = 83
          end
          object cxGrid1DBTableView1DES_RAZAO_SOCIAL: TcxGridDBColumn
            Caption = 'Raz'#227'o Social'
            DataBinding.FieldName = 'DES_RAZAO_SOCIAL'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
            Width = 232
          end
          object cxGrid1DBTableView1NOM_FANTASIA: TcxGridDBColumn
            Caption = 'Nome Fantasia'
            DataBinding.FieldName = 'NOM_FANTASIA'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
            Width = 213
          end
          object cxGrid1DBTableView1DES_TIPO_DOC: TcxGridDBColumn
            Caption = 'Tipo de Documento'
            DataBinding.FieldName = 'DES_TIPO_DOC'
            Visible = False
            VisibleForCustomization = False
            VisibleForEditForm = bFalse
          end
          object cxGrid1DBTableView1NUM_CNPJ: TcxGridDBColumn
            Caption = 'CNPJ/CPF'
            DataBinding.FieldName = 'NUM_CNPJ'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.IgnoreMaskBlank = True
            Properties.MaskKind = emkRegExpr
            Properties.EditMask = '\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d'
            HeaderAlignmentHorz = taCenter
            Width = 122
          end
          object cxGrid1DBTableView1NUM_IE: TcxGridDBColumn
            Caption = 'Ins. Estadual'
            DataBinding.FieldName = 'NUM_IE'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.IgnoreMaskBlank = True
            Properties.MaskKind = emkRegExpr
            Properties.EditMask = '\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d'
            HeaderAlignmentHorz = taCenter
            Width = 167
          end
          object cxGrid1DBTableView1NUM_IEST: TcxGridDBColumn
            Caption = 'Ins. Estadual Subst. Tribut'#225'ria'
            DataBinding.FieldName = 'NUM_IEST'
            Visible = False
            VisibleForCustomization = False
            VisibleForEditForm = bFalse
          end
          object cxGrid1DBTableView1NUM_IM: TcxGridDBColumn
            Caption = 'Inscri'#231#227'o Municipal'
            DataBinding.FieldName = 'NUM_IM'
            Visible = False
            VisibleForCustomization = False
            VisibleForEditForm = bFalse
          end
          object cxGrid1DBTableView1COD_CNAE: TcxGridDBColumn
            Caption = 'CNAE'
            DataBinding.FieldName = 'COD_CNAE'
            Visible = False
            VisibleForCustomization = False
            VisibleForEditForm = bFalse
          end
          object cxGrid1DBTableView1COD_CRT: TcxGridDBColumn
            Caption = 'CRT'
            DataBinding.FieldName = 'COD_CRT'
            Visible = False
            VisibleForCustomization = False
            VisibleForEditForm = bFalse
          end
          object cxGrid1DBTableView1COD_STATUS: TcxGridDBColumn
            Caption = 'Status'
            DataBinding.FieldName = 'COD_STATUS'
            PropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.Images = dm.cxImageList1
            Properties.Items = <
              item
                Description = 'ATIVO'
                ImageIndex = 51
                Value = 'S'
              end
              item
                Description = 'INATIVO'
                ImageIndex = 62
                Value = 'N'
              end>
            HeaderAlignmentHorz = taCenter
            Width = 182
          end
          object cxGrid1DBTableView1DES_OBSERVACAO: TcxGridDBColumn
            Caption = 'Observa'#231#245'es'
            DataBinding.FieldName = 'DES_OBSERVACAO'
            Visible = False
            VisibleForCustomization = False
            VisibleForEditForm = bFalse
          end
          object cxGrid1DBTableView1DAT_CADASTRO: TcxGridDBColumn
            Caption = 'Data Cadastro'
            DataBinding.FieldName = 'DAT_CADASTRO'
            Visible = False
            VisibleForCustomization = False
            VisibleForEditForm = bFalse
          end
          object cxGrid1DBTableView1NOM_USUARIO: TcxGridDBColumn
            Caption = 'Usu'#225'rio'
            DataBinding.FieldName = 'NOM_USUARIO'
            Visible = False
            VisibleForCustomization = False
            VisibleForEditForm = bFalse
          end
          object cxGrid1DBTableView1DAT_MANUTENCAO: TcxGridDBColumn
            Caption = 'Data Atualiza'#231#227'o'
            DataBinding.FieldName = 'DAT_MANUTENCAO'
            Visible = False
            VisibleForCustomization = False
            VisibleForEditForm = bFalse
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
      object cxButton1: TcxButton
        Left = 3
        Top = 536
        Width = 75
        Height = 25
        Cursor = crHandPoint
        Action = actIncluir
        Anchors = [akLeft, akBottom]
        TabOrder = 1
      end
      object cxButton2: TcxButton
        Left = 84
        Top = 536
        Width = 75
        Height = 25
        Cursor = crHandPoint
        Action = aclLocalizar
        Anchors = [akLeft, akBottom]
        TabOrder = 2
      end
      object cxButton3: TcxButton
        Left = 165
        Top = 536
        Width = 75
        Height = 25
        Cursor = crHandPoint
        Action = actFiltro
        Anchors = [akLeft, akBottom]
        TabOrder = 3
      end
      object cxButton4: TcxButton
        Left = 246
        Top = 536
        Width = 75
        Height = 25
        Cursor = crHandPoint
        Action = actExcluir
        Anchors = [akLeft, akBottom]
        TabOrder = 4
      end
      object cxButton5: TcxButton
        Left = 327
        Top = 536
        Width = 75
        Height = 25
        Cursor = crHandPoint
        Action = actExportar
        Anchors = [akLeft, akBottom]
        TabOrder = 5
      end
      object cxButton6: TcxButton
        Left = 408
        Top = 536
        Width = 75
        Height = 25
        Cursor = crHandPoint
        Action = actSelecionar
        Anchors = [akLeft, akBottom]
        TabOrder = 6
      end
      object cxButton7: TcxButton
        Left = 1177
        Top = 536
        Width = 75
        Height = 25
        Action = actSair
        Anchors = [akRight, akBottom]
        TabOrder = 7
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'Detalhamento'
      ImageIndex = 1
      DesignSize = (
        1255
        564)
      object cxGroupBox1: TcxGroupBox
        Left = 3
        Top = 0
        Align = alCustom
        Caption = 'Identifica'#231#227'o'
        TabOrder = 0
        Height = 233
        Width = 686
        object cxLabel1: TcxLabel
          Left = 3
          Top = 16
          Caption = 'C'#243'digo:'
          Transparent = True
        end
        object cxCodigo: TcxDBMaskEdit
          Left = 50
          Top = 15
          Hint = 'C'#243'digo da Empresa (Automatico)'
          DataBinding.DataField = 'COD_EMPRESA'
          DataBinding.DataSource = dsEmpresas
          Properties.Alignment.Horz = taRightJustify
          Properties.IgnoreMaskBlank = True
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d\d\d\d\d\d'
          Properties.ReadOnly = True
          TabOrder = 1
          Width = 63
        end
        object cxLabel2: TcxLabel
          Left = 119
          Top = 16
          Caption = '*Tipo Documento:'
          Transparent = True
        end
        object cxDocumento: TcxDBComboBox
          Left = 210
          Top = 12
          Hint = 'Tipo de Documento'
          DataBinding.DataField = 'DES_TIPO_DOC'
          DataBinding.DataSource = dsEmpresas
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            'CNPJ'
            'CPF')
          Properties.OnValidate = cxDocumentoPropertiesValidate
          TabOrder = 3
          Width = 71
        end
        object cxLabel3: TcxLabel
          Left = 287
          Top = 16
          Caption = '*N'#186'. CNPJ/CPF: '
          Transparent = True
        end
        object cxCNPJCPF: TcxDBMaskEdit
          Left = 377
          Top = 12
          Hint = 'N'#250'mero do CNPJ ou CPF'
          DataBinding.DataField = 'NUM_CNPJ'
          DataBinding.DataSource = dsEmpresas
          Properties.IgnoreMaskBlank = True
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '[0-9./-]+'
          Properties.OnValidate = cxCNPJCPFPropertiesValidate
          TabOrder = 5
          OnExit = cxCNPJCPFExit
          Width = 120
        end
        object cxLabel4: TcxLabel
          Left = 503
          Top = 16
          Caption = 'N'#186'. IE/RG: '
          Transparent = True
        end
        object cxIERG: TcxDBMaskEdit
          Left = 567
          Top = 15
          Hint = 'N'#250'mero da Inscri'#231#227'o Estadual ou RG'
          DataBinding.DataField = 'NUM_IE'
          DataBinding.DataSource = dsEmpresas
          Properties.IgnoreMaskBlank = True
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d'
          TabOrder = 7
          Width = 110
        end
        object cxLabel5: TcxLabel
          Left = 3
          Top = 40
          Caption = '*Raz'#227'o Social: '
          Transparent = True
        end
        object cxRazaoSocial: TcxDBTextEdit
          Left = 104
          Top = 39
          Hint = 'Raz'#227'o Social ou Nome'
          DataBinding.DataField = 'DES_RAZAO_SOCIAL'
          DataBinding.DataSource = dsEmpresas
          TabOrder = 9
          Width = 573
        end
        object cxLabel6: TcxLabel
          Left = 3
          Top = 63
          Caption = '*Nome Fantasia:'
          Transparent = True
        end
        object cxNomeFantasia: TcxDBTextEdit
          Left = 104
          Top = 62
          Hint = 'Nome Fantasia ou Apelido'
          DataBinding.DataField = 'NOM_FANTASIA'
          DataBinding.DataSource = dsEmpresas
          TabOrder = 11
          Width = 573
        end
        object cxLabel7: TcxLabel
          Left = 3
          Top = 86
          Caption = 'Ins. Est. ST:'
          Transparent = True
        end
        object cxIEST: TcxDBMaskEdit
          Left = 104
          Top = 85
          Hint = 'N'#250'mero da Inscri'#231#227'o Estadual com Substitui'#231#227'o Tribut'#225'ria'
          DataBinding.DataField = 'NUM_IEST'
          DataBinding.DataSource = dsEmpresas
          Properties.IgnoreMaskBlank = True
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d'
          TabOrder = 13
          Width = 116
        end
        object cxLabel8: TcxLabel
          Left = 284
          Top = 86
          Caption = 'Ins. Municipal:'
          Transparent = True
        end
        object cxIM: TcxDBMaskEdit
          Left = 363
          Top = 85
          Hint = 'N'#250'mero da Inscri'#231#227'o Municipal'
          DataBinding.DataField = 'NUM_IM'
          DataBinding.DataSource = dsEmpresas
          Properties.IgnoreMaskBlank = True
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d'
          TabOrder = 15
          Width = 107
        end
        object cxLabel9: TcxLabel
          Left = 491
          Top = 86
          Caption = 'CNAE Fiscal:'
          Transparent = True
        end
        object cxCNAE: TcxDBMaskEdit
          Left = 561
          Top = 85
          Hint = 'Classifica'#231#227'o Nacional de Atividades Econ'#244'micas'
          DataBinding.DataField = 'COD_CNAE'
          DataBinding.DataSource = dsEmpresas
          Properties.IgnoreMaskBlank = True
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d'
          TabOrder = 17
          Width = 116
        end
        object cxLabel10: TcxLabel
          Left = 3
          Top = 109
          Caption = 'Regime Tribut'#225'rio:'
          Transparent = True
        end
        object cxCRT: TcxDBLookupComboBox
          Left = 104
          Top = 109
          Hint = 'C'#243'digo do Regime Tribut'#225'rio'
          DataBinding.DataField = 'COD_CRT'
          DataBinding.DataSource = dsEmpresas
          Properties.KeyFieldNames = 'COD_CRT'
          Properties.ListColumns = <
            item
              FieldName = 'DES_CRT'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dsCRT
          TabOrder = 19
          Width = 366
        end
        object cxLabel11: TcxLabel
          Left = 477
          Top = 109
          Caption = 'Data Cadastro:'
          Transparent = True
        end
        object cxCadastro: TcxDBDateEdit
          Left = 561
          Top = 109
          Hint = 'Data do Cadastro'
          DataBinding.DataField = 'DAT_CADASTRO'
          DataBinding.DataSource = dsEmpresas
          Properties.SaveTime = False
          Properties.ShowTime = False
          TabOrder = 21
          Width = 116
        end
        object cxLabel12: TcxLabel
          Left = 3
          Top = 134
          Caption = 'Observa'#231#245'es:'
          Transparent = True
        end
        object cxObservacoes: TcxDBMemo
          Left = 104
          Top = 133
          Hint = 'Observa'#231#245'es '
          DataBinding.DataField = 'DES_OBSERVACAO'
          DataBinding.DataSource = dsEmpresas
          Properties.ScrollBars = ssVertical
          TabOrder = 23
          Height = 57
          Width = 573
        end
        object cxLabel13: TcxLabel
          Left = 3
          Top = 194
          Caption = 'Status:'
          Transparent = True
        end
        object cxLabel14: TcxLabel
          Left = 254
          Top = 194
          Caption = 'Usu'#225'rio:'
          Transparent = True
        end
        object cxUsuario: TcxDBTextEdit
          Left = 304
          Top = 194
          Hint = 'Usu'#225'rio da '#250'ltima manuten'#231#227'o'
          DataBinding.DataField = 'NOM_USUARIO'
          DataBinding.DataSource = dsEmpresas
          Properties.ReadOnly = True
          TabOrder = 27
          Width = 166
        end
        object cxData: TcxDBTextEdit
          Left = 476
          Top = 194
          Hint = 'Data da '#250'ltima manuten'#231#227'o'
          DataBinding.DataField = 'DAT_MANUTENCAO'
          DataBinding.DataSource = dsEmpresas
          Properties.ReadOnly = True
          TabOrder = 28
          Width = 166
        end
        object cxDBImageComboBox1: TcxDBImageComboBox
          Left = 104
          Top = 194
          DataBinding.DataField = 'COD_STATUS'
          DataBinding.DataSource = dsEmpresas
          Properties.Images = dm.cxImageList1
          Properties.Items = <
            item
              Description = 'ATIVO'
              ImageIndex = 51
              Value = '1'
            end
            item
              Description = 'INATIVO'
              ImageIndex = 62
              Value = '0'
            end>
          TabOrder = 24
          Width = 121
        end
      end
      object cxGroupBox2: TcxGroupBox
        Left = 3
        Top = 239
        Align = alCustom
        Caption = 'Localiza'#231#227'o'
        TabOrder = 1
        DesignSize = (
          686
          211)
        Height = 218
        Width = 686
        object cxLabel15: TcxLabel
          Left = 3
          Top = 16
          Caption = 'Tipo de Endere'#231'o:'
          Transparent = True
        end
        object cxTipoEndereço: TcxDBComboBox
          Left = 100
          Top = 15
          Hint = 'Tipo de Endere'#231'o'
          DataBinding.DataField = 'DES_TIPO'
          DataBinding.DataSource = dsEnderecos
          Properties.CharCase = ecUpperCase
          Properties.Items.Strings = (
            'COMERCIAL'
            'COBRAN'#199'A'
            'ALTERNATIVO')
          TabOrder = 1
          Width = 121
        end
        object cxLabel16: TcxLabel
          Left = 227
          Top = 16
          Caption = 'CEP:'
          Transparent = True
        end
        object cxCEP: TcxDBMaskEdit
          Left = 260
          Top = 15
          Hint = 'CEP do Endere'#231'o'
          DataBinding.DataField = 'NUM_CEP'
          DataBinding.DataSource = dsEnderecos
          Properties.IgnoreMaskBlank = True
          Properties.EditMask = '00000\-999;1; '
          TabOrder = 3
          Width = 85
        end
        object cxDBNavigator1: TcxDBNavigator
          Left = 470
          Top = 181
          Width = 207
          Height = 25
          Cursor = crHandPoint
          Buttons.CustomButtons = <>
          Buttons.Images = dm.cxImageList1
          Buttons.PriorPage.Visible = False
          Buttons.NextPage.Visible = False
          Buttons.Insert.ImageIndex = 1
          Buttons.Insert.Visible = True
          Buttons.Delete.ImageIndex = 8
          Buttons.Delete.Visible = True
          Buttons.Edit.ImageIndex = 14
          Buttons.Edit.Visible = True
          Buttons.Post.ImageIndex = 9
          Buttons.Post.Visible = True
          Buttons.Cancel.ImageIndex = 6
          Buttons.Cancel.Visible = True
          Buttons.Refresh.Visible = False
          Buttons.SaveBookmark.Visible = False
          Buttons.GotoBookmark.Visible = False
          Buttons.Filter.Visible = False
          DataSource = dsEnderecos
          InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
          InfoPanel.Visible = True
          Anchors = [akRight, akBottom]
          TabOrder = 4
        end
        object cxLabel17: TcxLabel
          Left = 3
          Top = 40
          Caption = 'Endere'#231'o:'
          Transparent = True
        end
        object cxEndereco: TcxDBTextEdit
          Left = 100
          Top = 39
          Hint = 'Descri'#231#227'o do Endere'#231'o'
          DataBinding.DataField = 'DES_LOGRADOURO'
          DataBinding.DataSource = dsEnderecos
          TabOrder = 6
          Width = 485
        end
        object cxLabel18: TcxLabel
          Left = 591
          Top = 40
          Caption = 'N'#186'.'
          Transparent = True
        end
        object cxNumero: TcxDBTextEdit
          Left = 612
          Top = 39
          Hint = 'N'#250'mero do Endere'#231'o'
          DataBinding.DataField = 'NUM_LOGRADOURO'
          DataBinding.DataSource = dsEnderecos
          TabOrder = 8
          Width = 65
        end
        object cxLabel19: TcxLabel
          Left = 3
          Top = 64
          Caption = 'Complemento:'
          Transparent = True
        end
        object cxComplemento: TcxDBTextEdit
          Left = 99
          Top = 63
          Hint = 'Complemento do Endere'#231'o'
          DataBinding.DataField = 'DES_COMPLEMENTO'
          DataBinding.DataSource = dsEnderecos
          TabOrder = 10
          Width = 246
        end
        object cxLabel20: TcxLabel
          Left = 351
          Top = 64
          Caption = 'Bairro:'
          Transparent = True
        end
        object cxBairro: TcxDBTextEdit
          Left = 393
          Top = 63
          Hint = 'Bairro do Endere'#231'o'
          DataBinding.DataField = 'DES_BAIRRO'
          DataBinding.DataSource = dsEnderecos
          TabOrder = 12
          Width = 284
        end
        object cxLabel21: TcxLabel
          Left = 3
          Top = 87
          Caption = 'Cidade:'
          Transparent = True
        end
        object cxCidade: TcxDBTextEdit
          Left = 99
          Top = 86
          Hint = 'Cidade do Endere'#231'o'
          DataBinding.DataField = 'NOM_CIDADE'
          DataBinding.DataSource = dsEnderecos
          TabOrder = 14
          Width = 486
        end
        object cxLabel22: TcxLabel
          Left = 591
          Top = 87
          Caption = 'UF:'
          Transparent = True
        end
        object cxLabel23: TcxLabel
          Left = 3
          Top = 110
          Caption = 'Refer'#234'ncia:'
          Transparent = True
        end
        object cxReferencia: TcxDBTextEdit
          Left = 100
          Top = 109
          Hint = 'Reefer'#234'ncia do Endere'#231'o'
          DataBinding.DataField = 'DES_REFERENCIA'
          DataBinding.DataSource = dsEnderecos
          TabOrder = 18
          Width = 577
        end
        object cxDBCheckBox1: TcxDBCheckBox
          Left = 100
          Top = 136
          Hint = 'Selecione caso o enderee'#231'o seja para correspond'#234'ncia'
          Caption = 'Endere'#231'o de Correspond'#234'ncia ?'
          DataBinding.DataField = 'DOM_CORRESPONDENCIA'
          DataBinding.DataSource = dsEnderecos
          Properties.Alignment = taLeftJustify
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = 1
          Properties.ValueGrayed = '0'
          Properties.ValueUnchecked = 0
          TabOrder = 19
          Transparent = True
          Width = 186
        end
        object cxUF: TcxDBLookupComboBox
          Left = 618
          Top = 86
          Hint = 'Siglas dos Estados'
          DataBinding.DataField = 'UF_ESTADO'
          DataBinding.DataSource = dsEnderecos
          Properties.KeyFieldNames = 'UF_ESTADO'
          Properties.ListColumns = <
            item
              FieldName = 'UF_ESTADO'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dsEstados
          TabOrder = 15
          Width = 59
        end
      end
      object cxGroupBox3: TcxGroupBox
        Left = 695
        Top = 0
        Align = alCustom
        Caption = 'Contatos'
        TabOrder = 2
        Height = 158
        Width = 557
        object cxGrid2: TcxGrid
          AlignWithMargins = True
          Left = 6
          Top = 18
          Width = 545
          Height = 127
          Align = alClient
          TabOrder = 0
          object cxGrid2DBTableView1: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            Navigator.Buttons.Images = dm.cxImageList1
            Navigator.Buttons.PriorPage.Visible = False
            Navigator.Buttons.NextPage.Visible = False
            Navigator.Buttons.Insert.ImageIndex = 1
            Navigator.Buttons.Insert.Visible = True
            Navigator.Buttons.Delete.ImageIndex = 8
            Navigator.Buttons.Delete.Visible = True
            Navigator.Buttons.Edit.ImageIndex = 14
            Navigator.Buttons.Edit.Visible = True
            Navigator.Buttons.Post.Enabled = False
            Navigator.Buttons.Post.ImageIndex = 9
            Navigator.Buttons.Post.Visible = True
            Navigator.Buttons.Cancel.ImageIndex = 6
            Navigator.Buttons.Cancel.Visible = True
            Navigator.Buttons.Refresh.Visible = False
            Navigator.Buttons.SaveBookmark.Visible = False
            Navigator.Buttons.GotoBookmark.Visible = False
            Navigator.Buttons.Filter.Visible = False
            Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
            Navigator.InfoPanel.Visible = True
            Navigator.Visible = True
            DataController.DataSource = dsContatos
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnGrouping = False
            OptionsCustomize.ColumnHidingOnGrouping = False
            OptionsData.DeletingConfirmation = False
            OptionsSelection.InvertSelect = False
            OptionsSelection.MultiSelect = True
            OptionsSelection.CellMultiSelect = True
            OptionsView.NoDataToDisplayInfoText = '<Nenhuma informa'#231#227'o dispon'#237'vel>'
            OptionsView.CellAutoHeight = True
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            object cxGrid2DBTableView1RecId: TcxGridDBColumn
              Caption = '#'
              DataBinding.FieldName = 'RecId'
              PropertiesClassName = 'TcxMaskEditProperties'
              Properties.IgnoreMaskBlank = True
              Properties.MaskKind = emkRegExpr
              Properties.EditMask = '\d\d\d\d\d'
              Properties.ReadOnly = True
              HeaderAlignmentHorz = taCenter
              Width = 32
            end
            object cxGrid2DBTableView1COD_EMPRESA: TcxGridDBColumn
              DataBinding.FieldName = 'COD_EMPRESA'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
              VisibleForEditForm = bFalse
            end
            object cxGrid2DBTableView1SEQ_CONTATO: TcxGridDBColumn
              DataBinding.FieldName = 'SEQ_CONTATO'
              Visible = False
              HeaderAlignmentHorz = taCenter
              VisibleForCustomization = False
              VisibleForEditForm = bFalse
            end
            object cxGrid2DBTableView1DES_CONTATO: TcxGridDBColumn
              Caption = 'Contato/Descri'#231#227'o'
              DataBinding.FieldName = 'DES_CONTATO'
              HeaderAlignmentHorz = taCenter
              Width = 151
            end
            object cxGrid2DBTableView1NUM_TELEFONE: TcxGridDBColumn
              Caption = 'N'#186'. Telefone'
              DataBinding.FieldName = 'NUM_TELEFONE'
              PropertiesClassName = 'TcxMaskEditProperties'
              Properties.IgnoreMaskBlank = True
              Properties.EditMask = '!\(999\)99999-9999;1; '
              HeaderAlignmentHorz = taCenter
              Width = 104
            end
            object cxGrid2DBTableView1DES_EMAIL: TcxGridDBColumn
              Caption = 'E-Mail/ID'
              DataBinding.FieldName = 'DES_EMAIL'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.CharCase = ecLowerCase
              HeaderAlignmentHorz = taCenter
              Width = 215
            end
            object cxGrid2DBTableView1DOM_PADRAO: TcxGridDBColumn
              Caption = 'Padr'#227'o'
              DataBinding.FieldName = 'DOM_PADRAO'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.NullStyle = nssUnchecked
              Properties.ValueChecked = 'S'
              Properties.ValueUnchecked = 'N'
              HeaderAlignmentHorz = taCenter
              Width = 47
            end
          end
          object cxGrid2Level1: TcxGridLevel
            GridView = cxGrid2DBTableView1
          end
        end
      end
      object cxGroupBox4: TcxGroupBox
        Left = 695
        Top = 164
        Caption = 'Financeiro'
        TabOrder = 3
        DesignSize = (
          554
          142)
        Height = 149
        Width = 554
        object cxLabel24: TcxLabel
          Left = 3
          Top = 16
          Caption = 'Tipo de Conta: '
          Transparent = True
        end
        object cxTipoConta: TcxDBComboBox
          Left = 87
          Top = 14
          Hint = 'Tipo de Conta'
          DataBinding.DataField = 'DES_TIPO_CONTA'
          DataBinding.DataSource = dsFinanceiro
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            'Conta Corrente F'#237'sica'
            'Conta Corrente Jur'#237'dica'
            'Conta Poupan'#231'a F'#237'sica'
            'Conta Poupan'#231'a Jur'#237'dica'
            'Conta Sal'#225'rio')
          TabOrder = 1
          Width = 121
        end
        object cxLabel25: TcxLabel
          Left = 214
          Top = 16
          Caption = 'Banco:'
          Transparent = True
        end
        object cxBancos: TcxDBLookupComboBox
          Left = 257
          Top = 15
          Hint = 'Nome do Banco'
          DataBinding.DataField = 'COD_BANCO'
          DataBinding.DataSource = dsFinanceiro
          Properties.KeyFieldNames = 'COD_BANCO'
          Properties.ListColumns = <
            item
              FieldName = 'NOM_BANCO'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dsBancos
          TabOrder = 3
          Width = 288
        end
        object cxLabel26: TcxLabel
          Left = 3
          Top = 40
          Caption = 'Ag'#234'ncia:'
          Transparent = True
        end
        object cxAgencia: TcxDBTextEdit
          Left = 87
          Top = 39
          Hint = 'Ag'#234'ncia da Conta'
          DataBinding.DataField = 'COD_AGENCIA'
          DataBinding.DataSource = dsFinanceiro
          TabOrder = 5
          Width = 82
        end
        object cxLabel28: TcxLabel
          Left = 187
          Top = 40
          Caption = 'N'#250'mero da Conta:'
          Transparent = True
        end
        object cxConta: TcxDBTextEdit
          Left = 285
          Top = 39
          Hint = 'N'#250'mero da Conta'
          DataBinding.DataField = 'NUM_CONTA'
          DataBinding.DataSource = dsFinanceiro
          TabOrder = 7
          Width = 260
        end
        object cxLabel29: TcxLabel
          Left = 3
          Top = 63
          Caption = 'Favorecido:'
          Transparent = True
        end
        object cxFavorecido: TcxDBButtonEdit
          Left = 87
          Top = 62
          Hint = 'Nome do Favorecido'
          DataBinding.DataField = 'NOM_FAVORECIDO'
          DataBinding.DataSource = dsFinanceiro
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.OnButtonClick = cxFavorecidoPropertiesButtonClick
          TabOrder = 9
          Width = 458
        end
        object cxLabel30: TcxLabel
          Left = 3
          Top = 86
          Caption = 'CNPJ/CPF: '
          Transparent = True
        end
        object cxCNPJCPFFavorecido: TcxDBMaskEdit
          Left = 87
          Top = 85
          Hint = 'N'#250'mero do CNPJ ou CPF do Favorecido'
          DataBinding.DataField = 'NUM_CPF_CNPJ'
          DataBinding.DataSource = dsFinanceiro
          Properties.IgnoreMaskBlank = True
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '[0-9./-]+'
          TabOrder = 11
          OnExit = cxCNPJCPFFavorecidoExit
          Width = 120
        end
        object cxLabel31: TcxLabel
          Left = 213
          Top = 86
          Caption = 'Forma Pagamento:'
          Transparent = True
        end
        object cxFormaPagamento: TcxDBComboBox
          Left = 314
          Top = 85
          Hint = 'Forma de Cr'#233'dito'
          DataBinding.DataField = 'DES_FORMA_PAGAMENTO'
          DataBinding.DataSource = dsFinanceiro
          Properties.Items.Strings = (
            'OBB PLUS'
            'Dep'#243'sito / Transfr'#234'ncia'
            'Cheque'
            'TED/DOC'
            'Em Esp'#233'cie'
            'Folha de Pagamento')
          TabOrder = 13
          Width = 159
        end
        object cxDBCheckBox2: TcxDBCheckBox
          Left = 483
          Top = 87
          Hint = 'Indica que a conta '#233' padr'#227'o para cr'#233'dito.'
          Caption = 'Padr'#227'o'
          DataBinding.DataField = 'DOM_PADRAO'
          DataBinding.DataSource = dsFinanceiro
          Properties.Alignment = taLeftJustify
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = 'S'
          Properties.ValueUnchecked = 'N'
          TabOrder = 14
          Transparent = True
          Width = 57
        end
        object cxDBNavigator3: TcxDBNavigator
          Left = 338
          Top = 112
          Width = 207
          Height = 25
          Cursor = crHandPoint
          Buttons.CustomButtons = <>
          Buttons.Images = dm.cxImageList1
          Buttons.PriorPage.Visible = False
          Buttons.NextPage.Visible = False
          Buttons.Insert.ImageIndex = 1
          Buttons.Insert.Visible = True
          Buttons.Delete.ImageIndex = 8
          Buttons.Delete.Visible = True
          Buttons.Edit.ImageIndex = 14
          Buttons.Edit.Visible = True
          Buttons.Post.ImageIndex = 9
          Buttons.Post.Visible = True
          Buttons.Cancel.ImageIndex = 6
          Buttons.Cancel.Visible = True
          Buttons.Refresh.Visible = False
          Buttons.SaveBookmark.Visible = False
          Buttons.GotoBookmark.Visible = False
          Buttons.Filter.Visible = False
          DataSource = dsContatos
          InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
          InfoPanel.Visible = True
          Anchors = [akRight, akBottom]
          TabOrder = 15
        end
      end
      object cxGroupBox5: TcxGroupBox
        Left = 695
        Top = 314
        Caption = 'Contratos'
        TabOrder = 4
        Height = 143
        Width = 557
        object cxGrid3: TcxGrid
          AlignWithMargins = True
          Left = 6
          Top = 18
          Width = 545
          Height = 112
          Align = alClient
          TabOrder = 0
          object cxGridDBTableView1: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            Navigator.Buttons.Images = dm.cxImageList1
            Navigator.Buttons.PriorPage.Visible = False
            Navigator.Buttons.NextPage.Visible = False
            Navigator.Buttons.Insert.ImageIndex = 1
            Navigator.Buttons.Insert.Visible = False
            Navigator.Buttons.Delete.ImageIndex = 8
            Navigator.Buttons.Delete.Visible = False
            Navigator.Buttons.Edit.ImageIndex = 14
            Navigator.Buttons.Edit.Visible = False
            Navigator.Buttons.Post.ImageIndex = 9
            Navigator.Buttons.Post.Visible = False
            Navigator.Buttons.Cancel.ImageIndex = 6
            Navigator.Buttons.Cancel.Visible = False
            Navigator.Buttons.Refresh.Visible = False
            Navigator.Buttons.SaveBookmark.Visible = False
            Navigator.Buttons.GotoBookmark.Visible = False
            Navigator.Buttons.Filter.Visible = False
            Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
            Navigator.InfoPanel.Visible = True
            Navigator.Visible = True
            DataController.DataSource = dsContratos
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnGrouping = False
            OptionsCustomize.ColumnHidingOnGrouping = False
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
            object cxGridDBTableView1RecId: TcxGridDBColumn
              DataBinding.FieldName = 'RecId'
              Visible = False
              VisibleForCustomization = False
              VisibleForEditForm = bFalse
            end
            object cxGridDBTableView1COD_EMPRESA: TcxGridDBColumn
              DataBinding.FieldName = 'COD_EMPRESA'
              Visible = False
              VisibleForCustomization = False
              VisibleForEditForm = bFalse
            end
            object cxGridDBTableView1SEQ_CONTRATO: TcxGridDBColumn
              DataBinding.FieldName = 'SEQ_CONTRATO'
              Visible = False
              VisibleForCustomization = False
              VisibleForEditForm = bFalse
            end
            object cxGridDBTableView1COD_TIPO_CONTRATO: TcxGridDBColumn
              Caption = 'Contrato'
              DataBinding.FieldName = 'COD_TIPO_CONTRATO'
              PropertiesClassName = 'TcxLookupComboBoxProperties'
              Properties.KeyFieldNames = 'COD_TIPO_CONTRATO'
              Properties.ListColumns = <
                item
                  FieldName = 'DES_TIPO_CONTRATO'
                end>
              Properties.ListOptions.ShowHeader = False
              Properties.ListSource = dsTipoContratos
              Width = 305
            end
            object cxGridDBTableView1DAT_INICIO_CONTRATO: TcxGridDBColumn
              Caption = 'In'#237'cio do Contrato'
              DataBinding.FieldName = 'DAT_INICIO_CONTRATO'
              PropertiesClassName = 'TcxDateEditProperties'
              Properties.SaveTime = False
              Properties.ShowTime = False
              Width = 113
            end
            object cxGridDBTableView1DAT_TERMINO_CONTRATO: TcxGridDBColumn
              Caption = 'T'#233'rmino do Contrato'
              DataBinding.FieldName = 'DAT_TERMINO_CONTRATO'
              PropertiesClassName = 'TcxDateEditProperties'
              Properties.ReadOnly = True
              Properties.SaveTime = False
              Properties.ShowTime = False
              Width = 122
            end
          end
          object cxGridLevel1: TcxGridLevel
            GridView = cxGridDBTableView1
          end
        end
      end
      object cxButton20: TcxButton
        Left = 3
        Top = 536
        Width = 75
        Height = 25
        Cursor = crHandPoint
        Action = actRetornar
        Anchors = [akLeft, akBottom]
        TabOrder = 5
      end
      object cxButton21: TcxButton
        Left = 84
        Top = 536
        Width = 75
        Height = 25
        Cursor = crHandPoint
        Action = actEditar
        Anchors = [akLeft, akBottom]
        TabOrder = 6
      end
      object cxButton22: TcxButton
        Left = 165
        Top = 536
        Width = 75
        Height = 25
        Cursor = crHandPoint
        Action = actCancelar
        Anchors = [akLeft, akBottom]
        Cancel = True
        TabOrder = 7
      end
      object cxButton23: TcxButton
        Left = 246
        Top = 536
        Width = 75
        Height = 25
        Cursor = crHandPoint
        Action = actGravar
        Anchors = [akLeft, akBottom]
        TabOrder = 8
      end
    end
  end
  object tbEmpresas: TdxMemData
    Indexes = <>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F0F0000000400000003000C00434F445F454D505245
      53410046000000140011004445535F52415A414F5F534F4349414C0050000000
      14000D004E4F4D5F46414E5441534941000400000014000D004445535F544950
      4F5F444F430014000000140009004E554D5F434E504A0014000000140007004E
      554D5F49450014000000140009004E554D5F494553540014000000140007004E
      554D5F494D000A00000014000900434F445F434E414500040000000300080043
      4F445F435254000400000003000B00434F445F53544154555300000000001900
      0F004445535F4F42534552564143414F000400000009000D004441545F434144
      415354524F001400000014000C004E4F4D5F5553554152494F00080000000B00
      0F004441545F4D414E5554454E43414F00}
    SortOptions = []
    Left = 195
    Top = 15
    object tbEmpresasCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
    end
    object tbEmpresasDES_RAZAO_SOCIAL: TWideStringField
      FieldName = 'DES_RAZAO_SOCIAL'
      Size = 70
    end
    object tbEmpresasNOM_FANTASIA: TWideStringField
      FieldName = 'NOM_FANTASIA'
      Size = 80
    end
    object tbEmpresasDES_TIPO_DOC: TWideStringField
      FieldName = 'DES_TIPO_DOC'
      Size = 4
    end
    object tbEmpresasNUM_CNPJ: TWideStringField
      FieldName = 'NUM_CNPJ'
    end
    object tbEmpresasNUM_IE: TWideStringField
      FieldName = 'NUM_IE'
    end
    object tbEmpresasNUM_IEST: TWideStringField
      FieldName = 'NUM_IEST'
    end
    object tbEmpresasNUM_IM: TWideStringField
      FieldName = 'NUM_IM'
    end
    object tbEmpresasCOD_CNAE: TWideStringField
      FieldName = 'COD_CNAE'
      Size = 10
    end
    object tbEmpresasCOD_CRT: TIntegerField
      FieldName = 'COD_CRT'
    end
    object tbEmpresasCOD_STATUS: TStringField
      FieldName = 'COD_STATUS'
      Size = 1
    end
    object tbEmpresasDES_OBSERVACAO: TWideMemoField
      FieldName = 'DES_OBSERVACAO'
      BlobType = ftWideMemo
    end
    object tbEmpresasDAT_CADASTRO: TDateField
      FieldName = 'DAT_CADASTRO'
    end
    object tbEmpresasNOM_USUARIO: TWideStringField
      FieldName = 'NOM_USUARIO'
    end
    object tbEmpresasDAT_MANUTENCAO: TDateTimeField
      FieldName = 'DAT_MANUTENCAO'
    end
  end
  object dsEmpresas: TDataSource
    AutoEdit = False
    DataSet = tbEmpresas
    OnStateChange = dsEmpresasStateChange
    Left = 232
    Top = 16
  end
  object aclEmpresas: TActionList
    Images = dm.cxImageList1
    Left = 600
    Top = 16
    object actIncluir: TAction
      Category = 'Empresas'
      Caption = '&Incluir'
      Hint = 'Incluir Empresa'
      ImageIndex = 1
      ShortCut = 16429
      OnExecute = actIncluirExecute
    end
    object actExcluir: TAction
      Category = 'Empresas'
      Caption = '&Excluir'
      Hint = 'Excluir Empresa'
      ImageIndex = 8
      ShortCut = 16430
    end
    object aclLocalizar: TAction
      Category = 'Empresas'
      Caption = '&Localizar'
      Hint = 'Localizar Empresas'
      ImageIndex = 18
      ShortCut = 119
      OnExecute = aclLocalizarExecute
    end
    object actFiltro: TAction
      Category = 'Empresas'
      Caption = 'Filtro'
      Hint = 'Filtrar dados'
      ImageIndex = 67
      OnExecute = actFiltroExecute
    end
    object actSelecionar: TAction
      Category = 'Empresas'
      Caption = 'Selecionar'
      Hint = 'Selecionar Empresa'
      ImageIndex = 0
      OnExecute = actSelecionarExecute
    end
    object actExportar: TAction
      Category = 'Empresas'
      Caption = 'E&xportar'
      Hint = 'Exportar dados'
      ImageIndex = 29
    end
    object actSair: TAction
      Category = 'Empresas'
      Caption = 'Sair'
      Hint = 'Sair da tela'
      ImageIndex = 10
      OnExecute = actSairExecute
    end
    object actGravar: TAction
      Category = 'Empresas'
      Caption = 'Gra&var'
      Hint = 'Gravar dados'
      ImageIndex = 9
      ShortCut = 116
      OnExecute = actGravarExecute
    end
    object actCancelar: TAction
      Category = 'Empresas'
      Caption = 'Cancelar'
      Hint = 'Cancelar opera'#231#227'o'
      ImageIndex = 6
      OnExecute = actCancelarExecute
    end
    object actRetornar: TAction
      Category = 'Empresas'
      Caption = 'Retornar'
      Hint = 'Retornar '#224' grade'
      ImageIndex = 3
      OnExecute = actRetornarExecute
    end
    object actEditar: TAction
      Category = 'Empresas'
      Caption = '&Editar'
      Hint = 'Editar dados'
      ImageIndex = 14
      OnExecute = actEditarExecute
    end
  end
  object tbEnderecos: TdxMemData
    Indexes = <>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F0C0000000400000003000C00434F445F454D505245
      5341000400000003000D005345515F454E44455245434F001400000014000900
      4445535F5449504F004600000014000F004445535F4C4F475241444F55524F00
      0A00000014000F004E554D5F4C4F475241444F55524F00320000001400100044
      45535F434F4D504C454D454E544F000400000003001400444F4D5F434F525245
      53504F4E44454E434941004600000014000B004445535F42414952524F004600
      000014000B004E4F4D5F434944414445000200000014000A0055465F45535441
      444F0009000000140008004E554D5F434550000001000014000F004445535F52
      45464552454E43494100}
    SortOptions = []
    Left = 272
    Top = 16
    object tbEnderecosCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
    end
    object tbEnderecosSEQ_ENDERECO: TIntegerField
      FieldName = 'SEQ_ENDERECO'
    end
    object tbEnderecosDES_TIPO: TWideStringField
      FieldName = 'DES_TIPO'
    end
    object tbEnderecosDES_LOGRADOURO: TWideStringField
      FieldName = 'DES_LOGRADOURO'
      Size = 70
    end
    object tbEnderecosNUM_LOGRADOURO: TWideStringField
      FieldName = 'NUM_LOGRADOURO'
      Size = 10
    end
    object tbEnderecosDES_COMPLEMENTO: TWideStringField
      FieldName = 'DES_COMPLEMENTO'
      Size = 50
    end
    object tbEnderecosDOM_CORRESPONDENCIA: TIntegerField
      FieldName = 'DOM_CORRESPONDENCIA'
    end
    object tbEnderecosDES_BAIRRO: TWideStringField
      FieldName = 'DES_BAIRRO'
      Size = 70
    end
    object tbEnderecosNOM_CIDADE: TWideStringField
      FieldName = 'NOM_CIDADE'
      Size = 70
    end
    object tbEnderecosUF_ESTADO: TWideStringField
      FieldName = 'UF_ESTADO'
      Size = 2
    end
    object tbEnderecosNUM_CEP: TWideStringField
      FieldName = 'NUM_CEP'
      Size = 9
    end
    object tbEnderecosDES_REFERENCIA: TWideStringField
      FieldName = 'DES_REFERENCIA'
      Size = 256
    end
  end
  object tbContatos: TdxMemData
    Indexes = <>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F060000000400000003000C00434F445F454D505245
      5341000400000003000C005345515F434F4E5441544F001E00000014000C0044
      45535F434F4E5441544F000F00000014000D004E554D5F54454C45464F4E4500
      9600000014000A004445535F454D41494C000100000014000B00444F4D5F5041
      4452414F00}
    SortOptions = []
    Left = 336
    Top = 16
    object tbContatosCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
    end
    object tbContatosSEQ_CONTATO: TIntegerField
      FieldName = 'SEQ_CONTATO'
    end
    object tbContatosDES_CONTATO: TWideStringField
      FieldName = 'DES_CONTATO'
      Size = 30
    end
    object tbContatosNUM_TELEFONE: TWideStringField
      FieldName = 'NUM_TELEFONE'
      Size = 15
    end
    object tbContatosDES_EMAIL: TWideStringField
      FieldName = 'DES_EMAIL'
      Size = 150
    end
    object tbContatosDOM_PADRAO: TWideStringField
      FieldName = 'DOM_PADRAO'
      Size = 1
    end
  end
  object tbFinanceiro: TdxMemData
    Indexes = <>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F0A0000000400000003000C00434F445F454D505245
      5341000400000003000F005345515F46494E414E434549524F00140000001400
      0F004445535F5449504F5F434F4E5441000400000014000A00434F445F42414E
      434F000A00000014000C00434F445F4147454E434941001400000014000A004E
      554D5F434F4E5441004600000014000F004E4F4D5F4641564F52454349444F00
      1400000014000D004E554D5F4350465F434E504A001E00000014001400444553
      5F464F524D415F504147414D454E544F000100000014000B00444F4D5F504144
      52414F00}
    SortOptions = []
    Left = 397
    Top = 16
    object tbFinanceiroCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
    end
    object tbFinanceiroSEQ_FINANCEIRO: TIntegerField
      FieldName = 'SEQ_FINANCEIRO'
    end
    object tbFinanceiroDES_TIPO_CONTA: TWideStringField
      FieldName = 'DES_TIPO_CONTA'
    end
    object tbFinanceiroCOD_BANCO: TWideStringField
      FieldName = 'COD_BANCO'
      Size = 4
    end
    object tbFinanceiroCOD_AGENCIA: TWideStringField
      FieldName = 'COD_AGENCIA'
      Size = 10
    end
    object tbFinanceiroNUM_CONTA: TWideStringField
      FieldName = 'NUM_CONTA'
    end
    object tbFinanceiroNOM_FAVORECIDO: TWideStringField
      FieldName = 'NOM_FAVORECIDO'
      Size = 70
    end
    object tbFinanceiroNUM_CPF_CNPJ: TWideStringField
      FieldName = 'NUM_CPF_CNPJ'
    end
    object tbFinanceiroDES_FORMA_PAGAMENTO: TWideStringField
      FieldName = 'DES_FORMA_PAGAMENTO'
      Size = 30
    end
    object tbFinanceiroDOM_PADRAO: TWideStringField
      FieldName = 'DOM_PADRAO'
      Size = 1
    end
  end
  object tbContratos: TdxMemData
    Indexes = <>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F050000000400000003000C00434F445F454D505245
      5341000400000003000D005345515F434F4E545241544F000400000009001400
      4441545F494E4943494F5F434F4E545241544F0004000000090015004441545F
      5445524D494E4F5F434F4E545241544F000400000003001200434F445F544950
      4F5F434F4E545241544F00}
    SortOptions = []
    Left = 469
    Top = 16
    object tbContratosCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
    end
    object tbContratosSEQ_CONTRATO: TIntegerField
      FieldName = 'SEQ_CONTRATO'
    end
    object tbContratosDAT_INICIO_CONTRATO: TDateField
      FieldName = 'DAT_INICIO_CONTRATO'
    end
    object tbContratosDAT_TERMINO_CONTRATO: TDateField
      FieldName = 'DAT_TERMINO_CONTRATO'
    end
    object tbContratosCOD_TIPO_CONTRATO: TIntegerField
      FieldName = 'COD_TIPO_CONTRATO'
    end
  end
  object dsEnderecos: TDataSource
    AutoEdit = False
    DataSet = tbEnderecos
    Left = 304
    Top = 16
  end
  object dsContatos: TDataSource
    AutoEdit = False
    DataSet = tbContatos
    Left = 368
    Top = 16
  end
  object dsFinanceiro: TDataSource
    AutoEdit = False
    DataSet = tbFinanceiro
    Left = 432
    Top = 16
  end
  object dsContratos: TDataSource
    AutoEdit = False
    DataSet = tbContratos
    Left = 504
    Top = 16
  end
  object dsCRT: TDataSource
    AutoEdit = False
    DataSet = dm.tbCRT
    Left = 680
    Top = 16
  end
  object dsEstados: TDataSource
    AutoEdit = False
    DataSet = dm.tbEstados
    Left = 824
    Top = 16
  end
  object dsBancos: TDataSource
    AutoEdit = False
    DataSet = dm.tbBancos
    Left = 864
    Top = 16
  end
  object dsTipoContratos: TDataSource
    AutoEdit = False
    DataSet = dm.tbContratos
    Left = 904
    Top = 16
  end
end
