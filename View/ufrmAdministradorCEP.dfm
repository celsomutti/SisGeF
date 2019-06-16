object frmAdministradorCEP: TfrmAdministradorCEP
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Cadastro de Administradores de CEP'
  ClientHeight = 557
  ClientWidth = 916
  Color = clWhite
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
  WindowState = wsMaximized
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  DesignSize = (
    916
    557)
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel34: TcxLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alTop
    AutoSize = False
    Caption = 'Administradores de CEP'
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -21
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Properties.Alignment.Vert = taVCenter
    Transparent = True
    ExplicitWidth = 906
    Height = 38
    Width = 910
    AnchorY = 22
  end
  object cxGroupBox1: TcxGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 47
    BiDiMode = bdRightToLeft
    Caption = 'Identifica'#231#227'o'
    ParentBiDiMode = False
    TabOrder = 1
    Height = 182
    Width = 534
    object cxLabel1: TcxLabel
      Left = 9
      Top = 18
      Caption = 'C'#243'digo'
      FocusControl = cxCodigo
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      Transparent = True
    end
    object cxCodigo: TcxMaskEdit
      Left = 116
      Top = 17
      Hint = 'C'#243'digo da Empresa/Agente'
      Properties.Alignment.Horz = taRightJustify
      Properties.Alignment.Vert = taVCenter
      Properties.IgnoreMaskBlank = True
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d\d\d\d\d\d\d\d'
      Properties.Nullstring = '0'
      Properties.UseNullString = True
      TabOrder = 1
      Text = '0'
      Width = 62
    end
    object cxLabel2: TcxLabel
      Left = 184
      Top = 18
      Caption = 'Tipo &Documento'
      FocusControl = CXTipoDocumento
      Transparent = True
    end
    object CXTipoDocumento: TcxComboBox
      Left = 265
      Top = 17
      Hint = 'Informe o tipo de documento de identifica'#231#227'o'
      Properties.Alignment.Vert = taVCenter
      Properties.Items.Strings = (
        'CNPJ'
        'CPF')
      Properties.MaxLength = 4
      TabOrder = 3
      Text = 'CNPJ'
      Width = 57
    end
    object cxLabel3: TcxLabel
      Left = 328
      Top = 18
      Caption = 'C&PF / CNPJ'
      FocusControl = CXTipoDocumento
      Transparent = True
    end
    object cxCPF: TcxMaskEdit
      Left = 392
      Top = 17
      Hint = 'N'#250'mero do CPF ou CNPJ da Empresa/Agente'
      Properties.Alignment.Horz = taLeftJustify
      Properties.Alignment.Vert = taVCenter
      Properties.IgnoreMaskBlank = True
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '[0-9./-]+'
      Properties.MaxLength = 0
      TabOrder = 5
      Width = 131
    end
    object cxLabel4: TcxLabel
      Left = 9
      Top = 41
      Caption = 'Nome / Ra&z'#227'o Social'
      FocusControl = cxNome
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      Transparent = True
    end
    object cxNome: TcxTextEdit
      Left = 116
      Top = 41
      Hint = 'Nome Completo ou Raz'#227'o Social da Empresa/Agente'
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 70
      TabOrder = 7
      Width = 407
    end
    object cxLabel5: TcxLabel
      Left = 9
      Top = 68
      Caption = 'Alia&s/Nome Fantasia'
      FocusControl = cxAlias
      Transparent = True
    end
    object cxAlias: TcxTextEdit
      Left = 116
      Top = 67
      Hint = 'Alias (Apelido) ou Nome Nome Fantasia da Empresa/Agente'
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 80
      TabOrder = 9
      Width = 407
    end
    object cxLabel6: TcxLabel
      Left = 9
      Top = 94
      Caption = 'N'#186'. R&G/ Ins. Est.'
      FocusControl = cxRGIE
      Transparent = True
    end
    object cxRGIE: TcxTextEdit
      Left = 116
      Top = 94
      Hint = 'N'#250'mero do RG ou Inscri'#231#227'o Estadual da Empresa /Agente'
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 20
      TabOrder = 11
      Width = 93
    end
    object cxLabel7: TcxLabel
      Left = 215
      Top = 94
      Caption = 'N'#186'. IE/S&T'
      FocusControl = cxIEST
      Transparent = True
    end
    object cxIEST: TcxTextEdit
      Left = 270
      Top = 94
      Hint = 
        'N'#250'mero da Inscri'#231#227'o Estadual com Substitui'#231#227'o Tribut'#225'ria da Empr' +
        'esa /Agente'
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 20
      TabOrder = 13
      Width = 99
    end
    object cxLabel8: TcxLabel
      Left = 375
      Top = 94
      Caption = 'Ins. M&un.'
      FocusControl = cxIM
      Transparent = True
    end
    object cxIM: TcxTextEdit
      Left = 424
      Top = 94
      Hint = 'N'#250'mero da Inscri'#231#227'o Municipal da Empresa /Agente'
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 20
      TabOrder = 15
      Width = 99
    end
    object cxLabel9: TcxLabel
      Left = 9
      Top = 122
      Caption = 'N'#186'. &CNAE'
      FocusControl = cxCNAE
      Transparent = True
    end
    object cxLabel10: TcxLabel
      Left = 215
      Top = 122
      Caption = 'N'#186'. C&RT'
      FocusControl = cxCRT
      Transparent = True
    end
    object cxCRT: TcxMaskEdit
      Left = 270
      Top = 121
      Hint = 'C'#243'digo do Regime Tribut'#225'rio da Empresa/Agente'
      Properties.Alignment.Horz = taRightJustify
      Properties.Alignment.Vert = taVCenter
      Properties.IgnoreMaskBlank = True
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d\d\d\d\d\d\d\d'
      Properties.Nullstring = '0'
      Properties.UseNullString = True
      TabOrder = 19
      Text = '0'
      Width = 99
    end
    object cxCNAE: TcxTextEdit
      Left = 116
      Top = 121
      Hint = 'C'#243'digo Nacional de Atividade Econ'#244'mica da Empresa/Agente'
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 10
      TabOrder = 16
      Width = 93
    end
    object cxLabel11: TcxLabel
      Left = 9
      Top = 149
      Caption = 'N'#186'. CN&H'
      FocusControl = cxCNH
      Transparent = True
    end
    object cxCNH: TcxTextEdit
      Left = 116
      Top = 148
      Hint = 'N'#250'mero da Carteira Nacional de Habilita'#231#227'o'
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 15
      TabOrder = 21
      Width = 93
    end
    object cxLabel12: TcxLabel
      Left = 215
      Top = 149
      Caption = '&Val. CNH'
      FocusControl = cxValidadeCNH
      Transparent = True
    end
    object cxValidadeCNH: TcxDateEdit
      Left = 270
      Top = 148
      Hint = 'Validade da Carteira Nacional de Habilita'#231#227'o'
      Properties.ButtonGlyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000BE9270A0A0A0
        9191919191919191919191919191919191919191919191919191919191919191
        91919191989898BE9270BE9270959595BFBFBFC3C3C3C3C3C3C3C3C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3C4C4C4C5C5C5C2C2C2959595BE9270BE9270BCBCBC
        F0F0F0FBFBFBFCFCFCFCFCFCFCFCFCF9F9F9F6F6F6ECECECD8D8D8E0E0E0FFFF
        FFF7F7F7C7C7C7BE9270BE9270C9C9C9FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF8
        F8F8F3F3F3EBEBEBDBDBDBFDFDFDE2E2E2FFFFFFCCCCCCBE9270BE9270C9C9C9
        FCFCFCFBFBFBFBFBFBFBFBFBAEAEAEF9F9F9BEBEBEE0E0E0DDDDDDFCFCFCFDFD
        FDE0E0E0CBCBCBBE9270BE9270C9C9C9FCFCFCFBFBFBFBFBFBFBFBFBAEAEAEFA
        FAFAE8E8E8BABABAE0E0E0DFDFDFDDDDDDDBDBDBC7C7C7BE9270BE9270C9C9C9
        FCFCFCFBFBFBFCFCFCFCFCFCAEAEAEFAFAFAF8F8F8BCBCBCE5E5E5F6F6F6F3F3
        F3EFEFEFC8C8C8BE9270BE9270C9C9C9FCFCFCFCFCFCFCFCFCCBCBCBAFAFAFFB
        FBFBF9F9F9E8E8E8C2C2C2FBFBFBFAFAFAF8F8F8C8C8C8BE9270BE9270C9C9C9
        FCFCFCFCFCFCFCFCFCF5F5F5CBCBCBEEEEEECACACAC7C7C7B8B8B8FFFFFFFEFE
        FEFCFCFCC9C9C9BE9270BE9270C9C9C9FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
        FCFCFCFCFCFBFBFBF7F7F7F7F7F7FFFFFFFCFCFCC9C9C9BE9270BE92700000DC
        1313F33B3BE93333E82D2DE72828E32323E11E1EDF1B1BDD1717DC1414DB1111
        DC0404ED0000DCBE9270BE92700000DC0F0FEB2828BD1C1C981F1FBC1E1EDD1B
        1BDF1616DE1212D70D0DB50808920606B40101E60000DCBE9270BE92700000DC
        0B0BDAA1A1AEE0E0E09F9FAE1414CE1212E10E0EE10909CC9E9EAEE0E0E09E9E
        AE0000D70000DCBE9270BE92700000DC0707D2C4C4D6E3E3E3C4C4D50303D002
        02ED0202ED0101CFC5C5D6E3E3E3C4C4D60000CF0000DCBE9270BE92700000DC
        0000C7B5B5CBE6E6E6B3B3C90000C70000DC0000DC0000C7B8B8CEE6E6E6B6B6
        CD0000C70000DCBE9270BE9270BE9270BE9270C6C6C6A8A8A8C2C2C2BE9270BE
        9270BE9270BE9270CFCFCFB1B1B1C6C6C6BE9270BE9270BE9270}
      Properties.DateButtons = [btnClear, btnNow, btnToday]
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 23
      Width = 99
    end
    object cxLabel13: TcxLabel
      Left = 375
      Top = 149
      Caption = 'C&at. CNH'
      FocusControl = cxCategoria
      Transparent = True
    end
    object cxCategoria: TcxTextEdit
      Left = 424
      Top = 148
      Hint = 'Categoria da Carteira Nacional de Habilita'#231#227'o'
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 2
      TabOrder = 25
      Width = 33
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 3
    Top = 235
    Caption = 'Endere'#231'os'
    TabOrder = 2
    Height = 162
    Width = 534
    object cxLabel14: TcxLabel
      Left = 9
      Top = 18
      Caption = 'T&ipo Endere'#231'o'
      FocusControl = cxTipoEndereco
      Transparent = True
    end
    object cxTipoEndereco: TcxComboBox
      Left = 116
      Top = 17
      Hint = 'Tipo de Endere'#231'o'
      Properties.CharCase = ecUpperCase
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'RESIDENCIAL'
        'COMERCIAL'
        'COBRAN'#199'A'
        'ALTERNATIVO')
      Properties.MaxLength = 20
      Properties.OnChange = cxTipoEnderecoPropertiesChange
      TabOrder = 1
      Text = 'RESIDENCIAL'
      Width = 170
    end
    object cxLabel15: TcxLabel
      Left = 292
      Top = 18
      Caption = 'C&EP'
      FocusControl = cxCEP
      Transparent = True
    end
    object cxCEP: TcxMaskEdit
      Left = 321
      Top = 17
      Hint = 'CEP do Endere'#231'o'
      Properties.Alignment.Horz = taLeftJustify
      Properties.Alignment.Vert = taVCenter
      Properties.IgnoreMaskBlank = True
      Properties.EditMask = '99999\-999;1; '
      TabOrder = 3
      Text = '     -   '
      Width = 73
    end
    object cxLabel17: TcxLabel
      Left = 9
      Top = 45
      Caption = '&Logradouro'
      FocusControl = cxLogradouro
      Transparent = True
    end
    object cxLogradouro: TcxTextEdit
      Left = 116
      Top = 44
      Hint = 'Logradouro do Endere'#231'o'
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 70
      TabOrder = 5
      Width = 308
    end
    object cxLabel18: TcxLabel
      Left = 430
      Top = 45
      Caption = '&N'#186'.'
      FocusControl = cxCategoria
      Transparent = True
    end
    object cxNumero: TcxTextEdit
      Left = 456
      Top = 44
      Hint = 'N'#250'mero do Endere'#231'o'
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 10
      TabOrder = 7
      Width = 67
    end
    object cxLabel19: TcxLabel
      Left = 9
      Top = 72
      Caption = 'Co&mplemento'
      FocusControl = cxComplemento
      Transparent = True
    end
    object cxComplemento: TcxTextEdit
      Left = 116
      Top = 71
      Hint = 'Complemento do Endere'#231'o'
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 50
      TabOrder = 9
      Width = 149
    end
    object cxLabel20: TcxLabel
      Left = 271
      Top = 72
      Caption = '&Bairro'
      FocusControl = cxBairro
      Transparent = True
    end
    object cxBairro: TcxTextEdit
      Left = 309
      Top = 71
      Hint = 'Complemento do Endere'#231'o'
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 70
      TabOrder = 11
      Width = 214
    end
    object cxLabel21: TcxLabel
      Left = 9
      Top = 99
      Caption = 'Ci&dade'
      FocusControl = cxCidade
      Transparent = True
    end
    object cxCidade: TcxTextEdit
      Left = 116
      Top = 98
      Hint = 'Cidade do Endere'#231'o'
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 70
      TabOrder = 13
      Width = 308
    end
    object cxLabel22: TcxLabel
      Left = 430
      Top = 99
      Caption = 'U&F'
      FocusControl = cxUF
      Transparent = True
    end
    object cxUF: TcxComboBox
      Tag = -1
      Left = 466
      Top = 98
      Hint = 'Sigla do Estado do Endere'#231'o'
      Properties.Alignment.Vert = taVCenter
      Properties.MaxLength = 2
      TabOrder = 15
      Width = 57
    end
    object cxLabel23: TcxLabel
      Left = 9
      Top = 125
      Caption = '&Refer'#234'ncia'
      FocusControl = cxReferencia
      Transparent = True
    end
    object cxReferencia: TcxTextEdit
      Left = 116
      Top = 124
      Hint = 'Refer'#234'ncia do Endere'#231'o'
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 256
      TabOrder = 17
      Width = 407
    end
    object cxButton7: TcxButton
      Left = 400
      Top = 18
      Width = 123
      Height = 20
      Cursor = crHandPoint
      Action = actCadastroExcluirEndereco
      TabOrder = 18
    end
  end
  object cxGroupBox5: TcxGroupBox
    Left = 3
    Top = 402
    Caption = 'Contatos'
    Enabled = False
    TabOrder = 3
    Height = 121
    Width = 534
    object cxGrid1: TcxGrid
      Left = 2
      Top = 15
      Width = 530
      Height = 97
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 522
      object cxGrid1DBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.Images = dm.cxImageList1
        Navigator.Buttons.First.Hint = 'Primeiro Contato'
        Navigator.Buttons.Prior.Visible = False
        Navigator.Buttons.Next.Hint = 'Pr'#243'ximo Contato'
        Navigator.Buttons.NextPage.Visible = False
        Navigator.Buttons.Last.Hint = #218'ltimo Contato'
        Navigator.Buttons.Insert.Hint = 'Inserir Contato'
        Navigator.Buttons.Insert.ImageIndex = 1
        Navigator.Buttons.Delete.Hint = 'Excluir Contato'
        Navigator.Buttons.Delete.ImageIndex = 8
        Navigator.Buttons.Edit.Hint = 'Editar Contato'
        Navigator.Buttons.Edit.ImageIndex = 14
        Navigator.Buttons.Post.Hint = 'Salvar Contato'
        Navigator.Buttons.Post.ImageIndex = 9
        Navigator.Buttons.Cancel.Hint = 'Cancelar opera'#231#227'o'
        Navigator.Buttons.Cancel.ImageIndex = 6
        Navigator.Buttons.Refresh.Hint = 'Atualizar Grade'
        Navigator.Buttons.Refresh.ImageIndex = 40
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.Buttons.GotoBookmark.Visible = False
        Navigator.Buttons.Filter.Visible = False
        Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
        Navigator.InfoPanel.Visible = True
        Navigator.Visible = True
        DataController.DataSource = ds
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        Images = dm.cxImageList1
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnHidingOnGrouping = False
        OptionsData.DeletingConfirmation = False
        OptionsView.NoDataToDisplayInfoText = 'Nenhum Contato Encontrado'
        OptionsView.GroupByBox = False
        object cxGrid1DBTableView1SEQ_CONTATO: TcxGridDBColumn
          Caption = '#'
          DataBinding.FieldName = 'SEQ_CONTATO'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          SortIndex = 0
          SortOrder = soAscending
          Width = 33
        end
        object cxGrid1DBTableView1DES_CONTATO: TcxGridDBColumn
          Caption = 'Descri'#231#227'o/Nome'
          DataBinding.FieldName = 'DES_CONTATO'
          PropertiesClassName = 'TcxTextEditProperties'
          Width = 116
        end
        object cxGrid1DBTableView1NUM_TELEFONE: TcxGridDBColumn
          Caption = 'Telefone/Celular'
          DataBinding.FieldName = 'NUM_TELEFONE'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Vert = taVCenter
          Properties.IgnoreMaskBlank = True
          Properties.EditMask = '!\(99\)99999-9999;1; '
        end
        object cxGrid1DBTableView1DES_EMAIL: TcxGridDBColumn
          Caption = 'E-Mail'
          DataBinding.FieldName = 'DES_EMAIL'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Vert = taVCenter
          Properties.CharCase = ecLowerCase
          Width = 256
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
  end
  object cxGroupBox3: TcxGroupBox
    AlignWithMargins = True
    Left = 543
    Top = 47
    Caption = 'Observa'#231#245'es'
    TabOrder = 4
    Height = 182
    Width = 369
    object cxObservações: TcxMemo
      Left = 3
      Top = 17
      Hint = 'Observa'#231#245'es sobre a Empresa/Agente'
      Lines.Strings = (
        '')
      TabOrder = 0
      Height = 120
      Width = 361
    end
    object cxLabel50: TcxLabel
      Left = 3
      Top = 143
      Caption = 'Status'
      Transparent = True
    end
    object cxStatus: TcxImageComboBox
      Tag = 1
      Left = 44
      Top = 141
      EditValue = 1
      Properties.Images = dm.cxImageList1
      Properties.Items = <
        item
          Description = 'ATIVO'
          ImageIndex = 51
          Value = 1
        end
        item
          Description = 'INATIVO'
          ImageIndex = 6
          Value = 0
        end>
      TabOrder = 2
      Width = 320
    end
  end
  object cxGroupBox4: TcxGroupBox
    Left = 543
    Top = 235
    Caption = 'Financeiro'
    TabOrder = 5
    Height = 285
    Width = 367
    object cxLabel24: TcxLabel
      Left = 11
      Top = 18
      Caption = 'Verba/A&j. C.'
      FocusControl = cxVerba
      Transparent = True
    end
    object cxVerba: TcxCalcEdit
      Left = 76
      Top = 17
      Hint = 'Verba ou Ajuda de Custo'
      EditValue = 0.000000000000000000
      Properties.Alignment.Horz = taRightJustify
      Properties.Alignment.Vert = taVCenter
      Properties.ButtonGlyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000808040808040
        8080408080408080408080408080408080408080408080408080408080408080
        4080804080804080804080804080804091919189888887868687878788888789
        8988898888888888888887878686878685979797808040808040808040808040
        888888C2C2C1BCBCBCBCBCBCBCBCBBBCBCBBBCBCBBBCBCBBBCBCBBBCBCBBC2C2
        C18B8B8A8080408080408080408080408C8C8BFFFFFFEBEBEBEBEBEBE9E9E9E8
        E8E8E7E7E7E7E7E7E6E6E6E6E6E6FFFFFF8E8D8C808040808040808040808040
        929191FFFFFFB4B4B4949494E7E7E7B2B2B2939393E3E3E3B0B0B0919191FBFB
        FB929291808040808040808040808040959595FFFFFFE8E8E8E7E7E7E5E5E5E3
        E3E3E2E2E2E0E0E0DFDFDFDCDCDCFFFFFF959595808040808040808040808040
        9A9A99FFFFFFB1B1B1919191E2E2E2ADADAD8F8F8FDCDCDCA9A9A98D8D8DFBFB
        FB9A99998080408080408080408080409E9D9DFFFFFFE3E3E3E1E1E1DCDCDCDB
        DBDBD7D7D7D3D3D3D3D3D3D1D1D1FFFFFF9E9D9C808040808040808040808040
        A0A0A0FFFFFFADADAD8E8E8ED8D8D8A5A5A58A8A8ACECECE7374E85258DBFBFB
        FB9E9E9E808040808040808040808040A3A3A3FCFCFCDADADAD7D7D7D2D2D2CE
        CECEC9C9C9C5C5C5C2C2C2BFBFBFFFFFFFA0A0A0808040808040808040808040
        A3A3A3FFFFFFB07B56C38D67C58F68C69069C8926BCA946CCA956EB07B56FFFF
        FFA1A09F808040808040808040808040A4A4A4FFFFFFB07B56C18B64C38D66C5
        8F67C69069C8926BCA946CB07B56FFFFFFA0A0A0808040808040808040808040
        A3A3A3FFFFFFA7724DA7724DA7724DA7724DA7724DA7724DA7724DA7724DFFFF
        FF9E9E9E808040808040808040808040AAAAAAFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA3A3A3808040808040808040808040
        B3B3B3A9A9A9A8A8A8ABABABACACACADADADACACACABABABA8A8A8A4A4A4A3A3
        A3B5B5B580804080804080804080804080804080804080804080804080804080
        8040808040808040808040808040808040808040808040808040}
      Properties.DisplayFormat = ' ,0.00;- ,0.00'
      TabOrder = 1
      Width = 101
    end
    object cxLabel25: TcxLabel
      Left = 11
      Top = 45
      Caption = 'For&ma Pgto.'
      FocusControl = cxFormaPgto
      Transparent = True
    end
    object cxFormaPgto: TcxComboBox
      Left = 76
      Top = 44
      Hint = 'Informe a forma de pagamento desta Empresa/Agente'
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'NENHUMA'
        'OBB PLUS'
        'DEP'#211'SITO/TRANSFER'#202'NCIA'
        'CHEQUE'
        'TED/DOC'
        'DINHEIRO'
        'FOLHA DE PAGAMENTO')
      Properties.MaxLength = 30
      TabOrder = 4
      Text = 'NENHUMA'
      Width = 288
    end
    object cxLabel26: TcxLabel
      Left = 11
      Top = 72
      Caption = 'Tipo Co&nta'
      FocusControl = cxVerba
      Transparent = True
    end
    object cxTipoConta: TcxComboBox
      Left = 76
      Top = 71
      Hint = 'Informe o tipo de conta banc'#225'ria desta Empresa/Agente'
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'NENHUM'
        'CONTA CORRENTE'
        'CONTA POUPAN'#199'A')
      Properties.MaxLength = 20
      TabOrder = 6
      Text = 'NENHUM'
      Width = 288
    end
    object cxLabel27: TcxLabel
      Left = 11
      Top = 99
      Caption = 'Ban&co'
      FocusControl = cxBanco
      Transparent = True
    end
    object cxBanco: TcxButtonEdit
      Left = 76
      Top = 98
      Hint = 'C'#243'digo do Banco desta Empresa/Agente'
      Properties.Alignment.Horz = taRightJustify
      Properties.Alignment.Vert = taVCenter
      Properties.Buttons = <
        item
          Action = actCadastroApoio
          Default = True
          Kind = bkGlyph
        end>
      Properties.IgnoreMaskBlank = True
      Properties.Images = dm.cxImageList1
      Properties.MaskKind = emkRegExpr
      Properties.Nullstring = '0'
      Properties.EditMask = '\d\d\d\d'
      Properties.MaxLength = 0
      Properties.UseNullString = True
      Properties.OnChange = cxBancoPropertiesChange
      Properties.OnValidate = cxBancoPropertiesValidate
      TabOrder = 8
      Text = '0'
      Width = 61
    end
    object cxNomeBanco: TcxTextEdit
      Left = 136
      Top = 98
      Hint = 'Nome do Banco'
      TabStop = False
      Properties.CharCase = ecUpperCase
      Properties.ReadOnly = True
      TabOrder = 9
      Width = 228
    end
    object cxLabel28: TcxLabel
      Left = 11
      Top = 125
      Caption = 'Ag'#234'nc&ia'
      FocusControl = cxAgencia
      Transparent = True
    end
    object cxAgencia: TcxTextEdit
      Left = 76
      Top = 124
      Hint = 'Ag'#234'ncia Banc'#225'ria desta Empresa/Agente'
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 10
      TabOrder = 11
      Width = 77
    end
    object cxLabel29: TcxLabel
      Left = 159
      Top = 125
      Caption = 'N'#186'. C&onta'
      FocusControl = cxConta
      Transparent = True
    end
    object cxConta: TcxTextEdit
      Left = 217
      Top = 124
      Hint = 'N'#250'mero conta banc'#225'ria da Empresa /Agente'
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 20
      TabOrder = 13
      Width = 147
    end
    object cxLabel30: TcxLabel
      Left = 11
      Top = 151
      Caption = '&Favorecido'
      FocusControl = cxFavorecido
      Transparent = True
    end
    object cxFavorecido: TcxTextEdit
      Left = 76
      Top = 150
      Hint = 'Nome do favorecido da conta banc'#225'ria da Empresa /Agente'
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 70
      TabOrder = 15
      Width = 288
    end
    object cxLabel31: TcxLabel
      Left = 11
      Top = 178
      Caption = 'C&PF/CNPJ'
      FocusControl = cxCPFFavorecido
      Transparent = True
    end
    object cxCPFFavorecido: TcxMaskEdit
      Left = 76
      Top = 177
      Hint = 'CPF ou CNPJ do Favorecido'
      Properties.IgnoreMaskBlank = True
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '[0-9./-]+'
      Properties.MaxLength = 0
      TabOrder = 17
      Width = 121
    end
    object cxLabel32: TcxLabel
      Left = 11
      Top = 205
      Caption = 'C. C&usto'
      FocusControl = cxCentroCusto
      Transparent = True
    end
    object cxCentroCusto: TcxButtonEdit
      Left = 76
      Top = 204
      Hint = 'Centro de Custo Empresa/Agente'
      Properties.Alignment.Horz = taRightJustify
      Properties.Alignment.Vert = taVCenter
      Properties.Buttons = <
        item
          Action = actCadastroApoio
          Default = True
          Kind = bkGlyph
        end>
      Properties.IgnoreMaskBlank = True
      Properties.Images = dm.cxImageList1
      Properties.MaskKind = emkRegExpr
      Properties.Nullstring = '0'
      Properties.EditMask = '\d\d\d\d'
      Properties.UseNullString = True
      Properties.OnChange = cxCentroCustoPropertiesChange
      Properties.OnValidate = cxCentroCustoPropertiesValidate
      TabOrder = 19
      Text = '0'
      Width = 85
    end
    object cxDescricaoCentroCusto: TcxTextEdit
      Left = 160
      Top = 204
      Hint = 'Descri'#231#227'o do Centro de Custo'
      TabStop = False
      Properties.CharCase = ecUpperCase
      Properties.ReadOnly = True
      TabOrder = 20
      Width = 204
    end
    object cxLabel33: TcxLabel
      Left = 183
      Top = 18
      Caption = 'Grupo Verba'
      FocusControl = cxVerba
      Transparent = True
    end
    object cxGrupoVerba: TcxComboBox
      Left = 253
      Top = 17
      Hint = 'C'#243'digo fo Grupo de Verbas'
      Properties.Alignment.Vert = taVCenter
      Properties.DropDownListStyle = lsEditFixedList
      Properties.MaxLength = 2
      TabOrder = 2
      Width = 57
    end
  end
  object cxButton1: TcxButton
    Left = 3
    Top = 529
    Width = 123
    Height = 20
    Cursor = crHandPoint
    Action = actCadastroCancelar
    Anchors = [akLeft, akBottom]
    TabOrder = 6
  end
  object cxButton2: TcxButton
    Left = 132
    Top = 529
    Width = 123
    Height = 20
    Cursor = crHandPoint
    Action = actCadastroExcluir
    Anchors = [akLeft, akBottom]
    TabOrder = 7
  end
  object cxButton3: TcxButton
    Left = 261
    Top = 529
    Width = 123
    Height = 20
    Cursor = crHandPoint
    Action = actCadastroSalvar
    Anchors = [akLeft, akBottom]
    TabOrder = 8
  end
  object cxButton4: TcxButton
    Left = 790
    Top = 529
    Width = 123
    Height = 20
    Cursor = crHandPoint
    Action = actCadastroSair
    Anchors = [akRight, akBottom]
    TabOrder = 9
  end
  object tbContatos: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 800
    Top = 8
    object tbContatosSEQ_CONTATO: TIntegerField
      FieldName = 'SEQ_CONTATO'
    end
    object tbContatosDES_CONTATO: TStringField
      FieldName = 'DES_CONTATO'
      Size = 30
    end
    object tbContatosNUM_TELEFONE: TStringField
      FieldName = 'NUM_TELEFONE'
      Size = 15
    end
    object tbContatosDES_EMAIL: TStringField
      FieldName = 'DES_EMAIL'
      Size = 150
    end
  end
  object ds: TDataSource
    AutoEdit = False
    DataSet = tbContatos
    Left = 760
    Top = 8
  end
  object aclCadastro: TActionList
    Left = 720
    Top = 8
    object actCadastroIncluir: TAction
      Category = 'Cadastro'
      Caption = 'Incluir'
      Hint = 'Incluir Novo Registro'
      ImageIndex = 1
      ShortCut = 113
      OnExecute = actCadastroIncluirExecute
    end
    object actCadastroLocalizar: TAction
      Category = 'Cadastro'
      Caption = 'Localizar'
      Hint = 'Localizar Registro'
      ImageIndex = 18
      ShortCut = 119
      OnExecute = actCadastroLocalizarExecute
    end
    object actCadastroEditar: TAction
      Category = 'Cadastro'
      Caption = 'Editar'
      Hint = 'Editar Registro'
      ImageIndex = 14
      OnExecute = actCadastroEditarExecute
    end
    object actCadastroExcluir: TAction
      Category = 'Cadastro'
      Caption = 'Excluir'
      Hint = 'Excluir Registro'
      ImageIndex = 8
      ShortCut = 115
      OnExecute = actCadastroExcluirExecute
    end
    object actCadastroCancelar: TAction
      Category = 'Cadastro'
      Caption = 'Cancelar'
      Hint = 'Cancelar opera'#231#227'o atual'
      ImageIndex = 6
      OnExecute = actCadastroCancelarExecute
    end
    object actCadastroSalvar: TAction
      Category = 'Cadastro'
      Caption = 'Gravar'
      Hint = 'Salvar Registro'
      ImageIndex = 9
      ShortCut = 116
      OnExecute = actCadastroSalvarExecute
    end
    object actCadastroSair: TAction
      Category = 'Cadastro'
      Caption = 'Sair'
      Hint = 'Sair da tela'
      ImageIndex = 10
      OnExecute = actCadastroSairExecute
    end
    object actCadastroExcluirEndereco: TAction
      Category = 'Cadastro'
      Caption = 'Excluir Endere'#231'o'
      Hint = 'Excluir Endere'#231'o'
      ImageIndex = 8
      ShortCut = 8307
      OnExecute = actCadastroExcluirEnderecoExecute
    end
    object actCadastroApoio: TAction
      Category = 'Cadastro'
      Caption = 'Listagem de Apoio'
      Hint = 'Listagem de Apoio'
      ImageIndex = 11
      ShortCut = 120
      OnExecute = actCadastroApoioExecute
    end
  end
  object tbEnderecos: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 680
    Top = 8
    object tbEnderecosDES_TIPO: TStringField
      DisplayLabel = 'Tipo Endere'#231'o'
      FieldName = 'DES_TIPO'
    end
    object tbEnderecosDES_LOGRADOURO: TStringField
      DisplayLabel = 'Logradouro'
      FieldName = 'DES_LOGRADOURO'
      Size = 70
    end
    object tbEnderecosNUM_LOGRADOURO: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUM_LOGRADOURO'
      Size = 10
    end
    object tbEnderecosDES_COMPLEMENTO: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'DES_COMPLEMENTO'
      Size = 50
    end
    object tbEnderecosDOM_CORRESPONDENCIA: TIntegerField
      DisplayLabel = 'Correspond'#234'ncia'
      FieldName = 'DOM_CORRESPONDENCIA'
    end
    object tbEnderecosDES_BAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'DES_BAIRRO'
      Size = 70
    end
    object tbEnderecosNOM_CIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'NOM_CIDADE'
      Size = 70
    end
    object tbEnderecosUF_ESTADO: TStringField
      DisplayLabel = 'UF'
      DisplayWidth = 2
      FieldName = 'UF_ESTADO'
      Size = 2
    end
    object tbEnderecosNUM_CEP: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'NUM_CEP'
      Size = 9
    end
    object tbEnderecosDES_REFERENCIA: TStringField
      DisplayLabel = 'Refer'#234'ncia'
      FieldName = 'DES_REFERENCIA'
      Size = 256
    end
  end
end
