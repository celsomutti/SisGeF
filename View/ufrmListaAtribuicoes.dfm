object frmListaAtribuicoes: TfrmListaAtribuicoes
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Atribui'#231#245'es'
  ClientHeight = 338
  ClientWidth = 805
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    805
    338)
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 799
    Height = 294
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsAtribuicoes
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.InvertSelect = False
      OptionsSelection.MultiSelect = True
      OptionsSelection.CellMultiSelect = True
      OptionsView.NoDataToDisplayInfoText = '<Nenhuma Informa'#231#227'o Dispon'#237'vel>'
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object cxGrid1DBTableView1RecId: TcxGridDBColumn
        DataBinding.FieldName = 'RecId'
        Visible = False
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1ID_ASSINANTE: TcxGridDBColumn
        Caption = 'ID'
        DataBinding.FieldName = 'ID_ASSINANTE'
        Visible = False
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1COD_ASSINANTE: TcxGridDBColumn
        Caption = 'C'#243'digo'
        DataBinding.FieldName = 'COD_ASSINANTE'
        Visible = False
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
        Width = 90
      end
      object cxGrid1DBTableView1DAT_ATRIBUICAO: TcxGridDBColumn
        Caption = 'Data Atribui'#231#227'o'
        DataBinding.FieldName = 'DAT_ATRIBUICAO'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.ReadOnly = True
        Properties.SaveTime = False
        Properties.ShowTime = False
        HeaderAlignmentHorz = taCenter
        SortIndex = 1
        SortOrder = soDescending
        Width = 120
      end
      object cxGrid1DBTableView1COD_PRODUTO: TcxGridDBColumn
        DataBinding.FieldName = 'COD_PRODUTO'
        Visible = False
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1NUM_EDICAO: TcxGridDBColumn
        DataBinding.FieldName = 'NUM_EDICAO'
        Visible = False
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1COD_TIPO_ASSINATURA: TcxGridDBColumn
        DataBinding.FieldName = 'COD_TIPO_ASSINATURA'
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
        Properties.ListOptions.ColumnSorting = False
        Properties.ListSource = dsCadastro
        Properties.ReadOnly = True
        Width = 292
      end
      object cxGrid1DBTableView1NOM_ASSINANTE: TcxGridDBColumn
        DataBinding.FieldName = 'NOM_ASSINANTE'
        Visible = False
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1COD_BARRA: TcxGridDBColumn
        DataBinding.FieldName = 'COD_BARRA'
        Visible = False
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1NOM_CUIDADOS: TcxGridDBColumn
        DataBinding.FieldName = 'NOM_CUIDADOS'
        Visible = False
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1DES_ENDERECO: TcxGridDBColumn
        DataBinding.FieldName = 'DES_ENDERECO'
        Visible = False
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1DES_COMPLEMENTO: TcxGridDBColumn
        DataBinding.FieldName = 'DES_COMPLEMENTO'
        Visible = False
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1DES_BAIRRO: TcxGridDBColumn
        DataBinding.FieldName = 'DES_BAIRRO'
        Visible = False
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1DES_REFERENCIA: TcxGridDBColumn
        DataBinding.FieldName = 'DES_REFERENCIA'
        Visible = False
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1DES_CIDADE: TcxGridDBColumn
        DataBinding.FieldName = 'DES_CIDADE'
        Visible = False
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1DES_UF: TcxGridDBColumn
        DataBinding.FieldName = 'DES_UF'
        Visible = False
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1CEP_ENDERECO: TcxGridDBColumn
        DataBinding.FieldName = 'CEP_ENDERECO'
        Visible = False
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1QTD_EXEMPLARES: TcxGridDBColumn
        DataBinding.FieldName = 'QTD_EXEMPLARES'
        Visible = False
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1NUM_ROTEIRO: TcxGridDBColumn
        DataBinding.FieldName = 'NUM_ROTEIRO'
        Visible = False
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1NOM_USUARIO: TcxGridDBColumn
        Caption = 'Usu'#225'rio'
        DataBinding.FieldName = 'NOM_USUARIO'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 187
      end
      object cxGrid1DBTableView1DAT_MANUTENCAO: TcxGridDBColumn
        Caption = 'Manuten'#231#227'o'
        DataBinding.FieldName = 'DAT_MANUTENCAO'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        SortIndex = 0
        SortOrder = soDescending
        Width = 198
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object cxButton1: TcxButton
    Left = 722
    Top = 305
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Sair'
    TabOrder = 1
    OnClick = cxButton1Click
  end
  object tbAtribuicoesJornal: TdxMemData
    Indexes = <>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F150000000400000003000D0049445F415353494E41
      4E5445000400000009000F004441545F4154524942554943414F000A00000014
      000C00434F445F50524F4455544F000C00000014000B004E554D5F4544494341
      4F000C00000014000E00434F445F415353494E414E5445000A00000014001400
      434F445F5449504F5F415353494E4154555241000400000003000F00434F445F
      454E5452454741444F52004600000014000E004E4F4D5F415353494E414E5445
      000A00000014000A00434F445F4241525241004600000014000D004E4F4D5F43
      55494441444F53006400000014000D004445535F454E44455245434F00320000
      00140010004445535F434F4D504C454D454E544F004600000014000B00444553
      5F42414952524F007E00000014000F004445535F5245464552454E4349410046
      00000014000B004445535F4349444144450002000000140007004445535F5546
      000800000014000D004345505F454E44455245434F000400000003000F005154
      445F4558454D504C41524553000400000003000C004E554D5F524F544549524F
      001400000014000C004E4F4D5F5553554152494F00080000000B000F00444154
      5F4D414E5554454E43414F00}
    SortOptions = []
    Left = 72
    Top = 208
    object tbAtribuicoesJornalID_ASSINANTE: TIntegerField
      FieldName = 'ID_ASSINANTE'
    end
    object tbAtribuicoesJornalDAT_ATRIBUICAO: TDateField
      FieldName = 'DAT_ATRIBUICAO'
    end
    object tbAtribuicoesJornalCOD_PRODUTO: TWideStringField
      FieldName = 'COD_PRODUTO'
      Size = 10
    end
    object tbAtribuicoesJornalNUM_EDICAO: TWideStringField
      FieldName = 'NUM_EDICAO'
      Size = 12
    end
    object tbAtribuicoesJornalCOD_ASSINANTE: TWideStringField
      FieldName = 'COD_ASSINANTE'
      Size = 12
    end
    object tbAtribuicoesJornalCOD_TIPO_ASSINATURA: TWideStringField
      FieldName = 'COD_TIPO_ASSINATURA'
      Size = 10
    end
    object tbAtribuicoesJornalCOD_ENTREGADOR: TIntegerField
      FieldName = 'COD_ENTREGADOR'
    end
    object tbAtribuicoesJornalNOM_ASSINANTE: TWideStringField
      FieldName = 'NOM_ASSINANTE'
      Size = 70
    end
    object tbAtribuicoesJornalCOD_BARRA: TWideStringField
      FieldName = 'COD_BARRA'
      Size = 10
    end
    object tbAtribuicoesJornalNOM_CUIDADOS: TWideStringField
      FieldName = 'NOM_CUIDADOS'
      Size = 70
    end
    object tbAtribuicoesJornalDES_ENDERECO: TWideStringField
      FieldName = 'DES_ENDERECO'
      Size = 100
    end
    object tbAtribuicoesJornalDES_COMPLEMENTO: TWideStringField
      FieldName = 'DES_COMPLEMENTO'
      Size = 50
    end
    object tbAtribuicoesJornalDES_BAIRRO: TWideStringField
      FieldName = 'DES_BAIRRO'
      Size = 70
    end
    object tbAtribuicoesJornalDES_REFERENCIA: TWideStringField
      FieldName = 'DES_REFERENCIA'
      Size = 126
    end
    object tbAtribuicoesJornalDES_CIDADE: TWideStringField
      FieldName = 'DES_CIDADE'
      Size = 70
    end
    object tbAtribuicoesJornalDES_UF: TWideStringField
      FieldName = 'DES_UF'
      Size = 2
    end
    object tbAtribuicoesJornalCEP_ENDERECO: TWideStringField
      FieldName = 'CEP_ENDERECO'
      Size = 8
    end
    object tbAtribuicoesJornalQTD_EXEMPLARES: TIntegerField
      FieldName = 'QTD_EXEMPLARES'
    end
    object tbAtribuicoesJornalNUM_ROTEIRO: TIntegerField
      FieldName = 'NUM_ROTEIRO'
    end
    object tbAtribuicoesJornalNOM_USUARIO: TWideStringField
      FieldName = 'NOM_USUARIO'
    end
    object tbAtribuicoesJornalDAT_MANUTENCAO: TDateTimeField
      FieldName = 'DAT_MANUTENCAO'
    end
  end
  object dsAtribuicoes: TDataSource
    AutoEdit = False
    DataSet = tbAtribuicoesJornal
    Left = 32
    Top = 208
  end
  object dsCadastro: TDataSource
    AutoEdit = False
    DataSet = dm.tbCadastro
    Left = 120
    Top = 208
  end
end
