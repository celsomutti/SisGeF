object frmAssinantes: TfrmAssinantes
  Left = 0
  Top = 0
  Caption = 'Assinantes'
  ClientHeight = 640
  ClientWidth = 1126
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
    1126
    640)
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel27: TcxLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alTop
    AutoSize = False
    Caption = 'Assinantes'
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
    Width = 1120
    AnchorY = 22
  end
  object cxGrid1: TcxGrid
    Left = -2
    Top = 47
    Width = 1120
    Height = 530
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    object cxGrid1DBTableView1: TcxGridDBTableView
      PopupMenu = PopupMenu1
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
      DataController.DataSource = dm.dsAssinantes
      DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      EditForm.DefaultColumnCount = 1
      EditForm.ItemHotTrack = True
      EditForm.DefaultStretch = fsHorizontal
      NewItemRow.InfoText = 'Clique aqui para Incluir'
      OptionsBehavior.CopyCaptionsToClipboard = False
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.FocusFirstCellOnNewRecord = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.ColumnHeaderHints = False
      OptionsBehavior.FocusCellOnCycle = True
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsSelection.InvertSelect = False
      OptionsSelection.MultiSelect = True
      OptionsSelection.CellMultiSelect = True
      OptionsView.NoDataToDisplayInfoText = '<Nenhuma informa'#231#227'o dispon'#237'vel>'
      OptionsView.CellAutoHeight = True
      OptionsView.GroupByBox = False
      object cxGrid1DBTableView1ID_ASSINANTE: TcxGridDBColumn
        Caption = 'ID'
        DataBinding.FieldName = 'ID_ASSINANTE'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.IgnoreMaskBlank = True
        Properties.MaskKind = emkRegExpr
        Properties.EditMask = '\d\d\d\d\d\d\d\d\d'
        Properties.ReadOnly = True
        Properties.OnValidate = cxGrid1DBTableView1ID_ASSINANTEPropertiesValidate
        HeaderAlignmentHorz = taCenter
        Width = 81
      end
      object cxGrid1DBTableView1COD_ASSINANTE: TcxGridDBColumn
        Caption = 'C'#243'digo'
        DataBinding.FieldName = 'COD_ASSINANTE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Properties.OnValidate = cxGrid1DBTableView1COD_ASSINANTEPropertiesValidate
        HeaderAlignmentHorz = taCenter
        Width = 76
      end
      object cxGrid1DBTableView1COD_PRODUTO: TcxGridDBColumn
        Caption = 'Produto'
        DataBinding.FieldName = 'COD_PRODUTO'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'COD_PRODUTO'
        Properties.ListColumns = <
          item
            Caption = 'Descri'#231#227'o'
            FieldName = 'DES_PRODUTO'
          end>
        Properties.ListSource = dsProdutos
        Properties.ReadOnly = True
        Properties.OnValidate = cxGrid1DBTableView1COD_PRODUTOPropertiesValidate
        HeaderAlignmentHorz = taCenter
        Width = 123
      end
      object cxGrid1DBTableView1COD_TIPO_ASSINATURA: TcxGridDBColumn
        Caption = 'Tipo Assinatura'
        DataBinding.FieldName = 'COD_TIPO_ASSINATURA'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'COD_TIPO_ASSINATURA'
        Properties.ListColumns = <
          item
            Caption = 'Descri'#231#227'o'
            FieldName = 'DES_TIPO_ASSINATURA'
          end>
        Properties.ListSource = dsTipo
        Properties.ReadOnly = True
        Properties.OnValidate = cxGrid1DBTableView1COD_TIPO_ASSINATURAPropertiesValidate
        HeaderAlignmentHorz = taCenter
        Width = 116
      end
      object cxGrid1DBTableView1NUM_ROTEIRO: TcxGridDBColumn
        Caption = 'Roteiro'
        DataBinding.FieldName = 'NUM_ROTEIRO'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.IgnoreMaskBlank = True
        Properties.MaskKind = emkRegExpr
        Properties.EditMask = '\d\d\d\d\d\d'
        Properties.OnValidate = cxGrid1DBTableView1NUM_ROTEIROPropertiesValidate
        HeaderAlignmentHorz = taCenter
        Width = 69
      end
      object cxGrid1DBTableView1NUM_EDICAO: TcxGridDBColumn
        Caption = 'Edi'#231#227'o'
        DataBinding.FieldName = 'NUM_EDICAO'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Properties.OnValidate = cxGrid1DBTableView1NUM_EDICAOPropertiesValidate
        HeaderAlignmentHorz = taCenter
        Width = 93
      end
      object cxGrid1DBTableView1DAT_EDICAO: TcxGridDBColumn
        Caption = 'Data'
        DataBinding.FieldName = 'DAT_EDICAO'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.ReadOnly = True
        Properties.SaveTime = False
        Properties.ShowTime = False
        Properties.OnValidate = cxGrid1DBTableView1DAT_EDICAOPropertiesValidate
        HeaderAlignmentHorz = taCenter
        Width = 82
      end
      object cxGrid1DBTableView1NOM_ASSINANTE: TcxGridDBColumn
        Caption = 'Nome'
        DataBinding.FieldName = 'NOM_ASSINANTE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Properties.OnValidate = cxGrid1DBTableView1NOM_ASSINANTEPropertiesValidate
        HeaderAlignmentHorz = taCenter
        Width = 186
      end
      object cxGrid1DBTableView1NOM_CUIDADOS: TcxGridDBColumn
        Caption = 'Aos Cuidados'
        DataBinding.FieldName = 'NOM_CUIDADOS'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 142
      end
      object cxGrid1DBTableView1DES_ENDERECO: TcxGridDBColumn
        Caption = 'Endere'#231'o'
        DataBinding.FieldName = 'DES_ENDERECO'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 134
      end
      object cxGrid1DBTableView1DES_COMPLEMENTO: TcxGridDBColumn
        Caption = 'Complemento'
        DataBinding.FieldName = 'DES_COMPLEMENTO'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 104
      end
      object cxGrid1DBTableView1DES_BAIRRO: TcxGridDBColumn
        Caption = 'Bairro'
        DataBinding.FieldName = 'DES_BAIRRO'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 136
      end
      object cxGrid1DBTableView1DES_REFERENCIA: TcxGridDBColumn
        Caption = 'Refer'#234'ncia'
        DataBinding.FieldName = 'DES_REFERENCIA'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 158
      end
      object cxGrid1DBTableView1DES_CIDADE: TcxGridDBColumn
        Caption = 'Cidade'
        DataBinding.FieldName = 'DES_CIDADE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 180
      end
      object cxGrid1DBTableView1DES_UF: TcxGridDBColumn
        Caption = 'UF'
        DataBinding.FieldName = 'DES_UF'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'UF_ESTADO'
        Properties.ListColumns = <
          item
            FieldName = 'UF_ESTADO'
          end>
        Properties.ListSource = dsEstado
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 44
      end
      object cxGrid1DBTableView1CEP_ENDERECO: TcxGridDBColumn
        Caption = 'CEP'
        DataBinding.FieldName = 'CEP_ENDERECO'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 76
      end
      object cxGrid1DBTableView1QTD_EXEMPLARES: TcxGridDBColumn
        Caption = 'Qtde.'
        DataBinding.FieldName = 'QTD_EXEMPLARES'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.IgnoreMaskBlank = True
        Properties.MaskKind = emkRegExpr
        Properties.EditMask = '\d\d\d\d\d'
        HeaderAlignmentHorz = taCenter
        Width = 63
      end
      object cxGrid1DBTableView1COD_BARRA: TcxGridDBColumn
        DataBinding.FieldName = 'COD_BARRA'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Visible = False
        HeaderAlignmentHorz = taCenter
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1DOM_PROTOCOLO: TcxGridDBColumn
        Caption = 'Protocolo'
        DataBinding.FieldName = 'DOM_PROTOCOLO'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Images = dm.cxImageList1
        Properties.Items = <
          item
            Description = 'IMPRIMIR'
            ImageIndex = 51
            Value = 'S'
          end
          item
            Description = 'N'#195'O IMPRIMIR'
            ImageIndex = 62
            Value = 'N'
          end>
        Properties.OnValidate = cxGrid1DBTableView1DOM_PROTOCOLOPropertiesValidate
        HeaderAlignmentHorz = taCenter
        Width = 101
      end
      object cxGrid1DBTableView1RecId: TcxGridDBColumn
        DataBinding.FieldName = 'RecId'
        Visible = False
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1ID_REVISTA: TcxGridDBColumn
        DataBinding.FieldName = 'ID_REVISTA'
        Visible = False
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1DOM_BAIXA: TcxGridDBColumn
        DataBinding.FieldName = 'DOM_BAIXA'
        Visible = False
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1NOM_RECEBEDOR: TcxGridDBColumn
        Caption = 'Nome do Recebedor'
        DataBinding.FieldName = 'NOM_RECEBEDOR'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 177
      end
      object cxGrid1DBTableView1DES_GRAU_RELACIONAMENTO: TcxGridDBColumn
        Caption = 'Grau de Relacionamento'
        DataBinding.FieldName = 'DES_GRAU_RELACIONAMENTO'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 174
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object dxStatusBar1: TdxStatusBar
    Left = 0
    Top = 614
    Width = 1126
    Height = 26
    Panels = <
      item
      end>
    PaintStyle = stpsUseLookAndFeel
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object cxButton1: TcxButton
    Left = 8
    Top = 583
    Width = 75
    Height = 25
    Action = actAssinanteIncluir
    Anchors = [akLeft, akBottom]
    TabOrder = 3
  end
  object cxButton2: TcxButton
    Left = 89
    Top = 583
    Width = 75
    Height = 25
    Action = actAssinanteEditar
    Anchors = [akLeft, akBottom]
    TabOrder = 4
  end
  object cxButton3: TcxButton
    Left = 170
    Top = 583
    Width = 75
    Height = 25
    Action = actAssinanteCancelar
    Anchors = [akLeft, akBottom]
    Cancel = True
    TabOrder = 5
  end
  object cxButton4: TcxButton
    Left = 251
    Top = 583
    Width = 75
    Height = 25
    Action = actAssinanteGravar
    Anchors = [akLeft, akBottom]
    TabOrder = 6
  end
  object cxButton5: TcxButton
    Left = 332
    Top = 583
    Width = 75
    Height = 25
    Action = actAssinanteLocalizar
    Anchors = [akLeft, akBottom]
    TabOrder = 7
  end
  object cxButton6: TcxButton
    Left = 413
    Top = 583
    Width = 75
    Height = 25
    Action = actAssinanteExportar
    Anchors = [akLeft, akBottom]
    TabOrder = 8
  end
  object cxButton7: TcxButton
    Left = 1043
    Top = 583
    Width = 75
    Height = 25
    Action = actAssinanteSair
    Anchors = [akRight, akBottom]
    TabOrder = 9
  end
  object cxButton8: TcxButton
    Left = 494
    Top = 583
    Width = 75
    Height = 25
    Action = actAssinanteFiltrar
    Anchors = [akLeft, akBottom]
    TabOrder = 10
  end
  object cxButton9: TcxButton
    Left = 575
    Top = 583
    Width = 82
    Height = 25
    Action = actAssinanteAtribuicoes
    Anchors = [akLeft, akBottom]
    TabOrder = 11
  end
  object aclAssinatura: TActionList
    Images = dm.cxImageList1
    Left = 848
    Top = 8
    object actAssinanteIncluir: TAction
      Category = 'Assinantes'
      Caption = '&Incluir'
      Hint = 'Incluir Acarea'#231#227'o'
      ImageIndex = 1
      ShortCut = 113
      OnExecute = actAssinanteIncluirExecute
    end
    object actAssinanteEditar: TAction
      Category = 'Assinantes'
      Caption = '&Editar'
      Hint = 'Editar Acarea'#231#227'o'
      ImageIndex = 14
      ShortCut = 114
      OnExecute = actAssinanteEditarExecute
    end
    object actAssinanteLocalizar: TAction
      Tag = 3
      Category = 'Assinantes'
      Caption = '&Localizar'
      Hint = 'Localizar Acarea'#231#245'es'
      ImageIndex = 18
      ShortCut = 119
      OnExecute = actAssinanteLocalizarExecute
    end
    object actAssinanteCancelar: TAction
      Tag = 3
      Category = 'Assinantes'
      Caption = 'Cancelar'
      Hint = 'Cancelar Opera'#231#227'o Atual'
      ImageIndex = 6
      OnExecute = actAssinanteCancelarExecute
    end
    object actAssinanteGravar: TAction
      Tag = 3
      Category = 'Assinantes'
      Caption = 'Gra&var'
      Hint = 'Gravar Acarea'#231#227'o'
      ImageIndex = 9
      ShortCut = 116
      OnExecute = actAssinanteGravarExecute
    end
    object actAssinanteExportar: TAction
      Tag = 3
      Category = 'Assinantes'
      Caption = 'E&xportar'
      Hint = 'Exportar dados da grade'
      ImageIndex = 29
      OnExecute = actAssinanteExportarExecute
    end
    object actAssinanteSair: TAction
      Tag = 3
      Category = 'Assinantes'
      Caption = '&Sair'
      Hint = 'Sair da tela'
      ImageIndex = 10
      OnExecute = actAssinanteSairExecute
    end
    object actAssinanteFiltrar: TAction
      Tag = 3
      Category = 'Assinantes'
      Caption = 'Filtrar'
      Hint = 'Filtrar Dados'
      ImageIndex = 67
      OnExecute = actAssinanteFiltrarExecute
    end
    object actAssinanteColar: TAction
      Tag = 3
      Category = 'Assinantes'
      Caption = 'Colar nas Seleionadas'
      Hint = 'Colar nas c'#233'lulas celecionadas'
      ImageIndex = 66
      ShortCut = 16468
      OnExecute = actAssinanteColarExecute
    end
    object actAssinantesCopiar: TAction
      Tag = 3
      Category = 'Assinantes'
      Caption = 'Copiar'
      Hint = 'Copiar'
      ImageIndex = 87
      ShortCut = 16451
      OnExecute = actAssinantesCopiarExecute
    end
    object actAssinanteAtribuicoes: TAction
      Tag = 3
      Category = 'Assinantes'
      Caption = 'Atribui'#231#245'es'
      Hint = 'Lista de Atribui'#231#245'es'
      ImageIndex = 28
      OnExecute = actAssinanteAtribuicoesExecute
    end
  end
  object dsTipo: TDataSource
    AutoEdit = False
    DataSet = dm.tbTipoAssinatura
    Left = 592
    Top = 8
  end
  object dsProdutos: TDataSource
    AutoEdit = False
    DataSet = dm.tbProdutos
    Left = 632
    Top = 8
  end
  object dsEstado: TDataSource
    AutoEdit = False
    DataSet = dm.tbEstados
    Left = 552
    Top = 8
  end
  object PopupMenu1: TPopupMenu
    Images = dm.cxImageList1
    Left = 912
    Top = 8
    object Copiar1: TMenuItem
      Action = actAssinantesCopiar
    end
    object Cancelar1: TMenuItem
      Action = actAssinanteColar
    end
  end
  object SaveDialog: TSaveDialog
    FileName = 'assinantes_jornal'
    Left = 968
    Top = 8
  end
end
