object frmAssinantesJornal: TfrmAssinantesJornal
  Left = 0
  Top = 0
  Caption = 'Assinaturas Jornais'
  ClientHeight = 464
  ClientWidth = 944
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
  DesignSize = (
    944
    464)
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel27: TcxLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alTop
    AutoSize = False
    Caption = 'Assinantes Jornal'
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
    Width = 938
    AnchorY = 22
  end
  object cxGrid1: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 47
    Width = 938
    Height = 378
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
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
      Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
      Navigator.InfoPanel.Visible = True
      Navigator.Visible = True
      DataController.DataSource = dsAssinaturas
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.NoDataToDisplayInfoText = '<Nenhuma informa'#231#227'o dispon'#237'vel>'
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
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.IgnoreMaskBlank = True
        Properties.MaskKind = emkRegExpr
        Properties.EditMask = '\d\d\d\d\d\d'
        Properties.OnValidate = cxGrid1DBTableView1ID_ASSINANTEPropertiesValidate
        HeaderAlignmentHorz = taCenter
      end
      object cxGrid1DBTableView1DES_ROTEIRO: TcxGridDBColumn
        Caption = 'Roteiro'
        DataBinding.FieldName = 'DES_ROTEIRO'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 98
      end
      object cxGrid1DBTableView1COD_ASSINANTE: TcxGridDBColumn
        Caption = 'C'#243'digo'
        DataBinding.FieldName = 'COD_ASSINANTE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.OnValidate = cxGrid1DBTableView1COD_ASSINANTEPropertiesValidate
        HeaderAlignmentHorz = taCenter
        Width = 72
      end
      object cxGrid1DBTableView1COD_MODALIDADE: TcxGridDBColumn
        Caption = 'Modalidade'
        DataBinding.FieldName = 'COD_MODALIDADE'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Items = <
          item
            Description = 'DI'#193'RIO'
            ImageIndex = 0
            Value = 1
          end
          item
            Description = 'SEGUNDA A SEXTA'
            Value = 2
          end
          item
            Description = 'S'#193'BADO E DOMINGO'
            Value = 3
          end
          item
            Description = 'DOMINGO'
            Value = 4
          end
          item
            Description = 'S'#193'BADO'
            Value = 5
          end
          item
            Description = 'SEXTA A SEGUNDA'
            Value = 6
          end
          item
            Description = 'TER'#199'A A DOMENTO'
            Value = 7
          end
          item
            Description = 'SEGUNDA'
            Value = 8
          end
          item
            Description = 'TER'#199'A A SEXTA'
            Value = 9
          end
          item
            Description = 'TER'#199'A A S'#193'BADO'
            Value = 10
          end
          item
            Description = 'SEXTA, S'#193'BADO E DOMINGO'
            Value = 11
          end
          item
            Description = 'SEXTA'
            Value = 90
          end>
        Properties.OnValidate = cxGrid1DBTableView1COD_MODALIDADEPropertiesValidate
        HeaderAlignmentHorz = taCenter
        Width = 157
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
        Properties.OnValidate = cxGrid1DBTableView1COD_PRODUTOPropertiesValidate
        HeaderAlignmentHorz = taCenter
        Width = 113
      end
      object cxGrid1DBTableView1NUM_ORDEM: TcxGridDBColumn
        Caption = 'Ordena'#231#227'o'
        DataBinding.FieldName = 'NUM_ORDEM'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.IgnoreMaskBlank = True
        Properties.MaskKind = emkRegExpr
        Properties.EditMask = '\d\d\d\d\d\d'
        HeaderAlignmentHorz = taCenter
      end
      object cxGrid1DBTableView1QTD_EXEMPLARES: TcxGridDBColumn
        Caption = 'Exemplares'
        DataBinding.FieldName = 'QTD_EXEMPLARES'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.IgnoreMaskBlank = True
        Properties.MaskKind = emkRegExpr
        Properties.EditMask = '\d\d\d\d\d'
        HeaderAlignmentHorz = taCenter
        Width = 87
      end
      object cxGrid1DBTableView1NOM_ASSINANTE: TcxGridDBColumn
        Caption = 'Nome'
        DataBinding.FieldName = 'NOM_ASSINANTE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.OnValidate = cxGrid1DBTableView1NOM_ASSINANTEPropertiesValidate
        HeaderAlignmentHorz = taCenter
        Width = 288
      end
      object cxGrid1DBTableView1DES_TIPO_LOGRADOURO: TcxGridDBColumn
        Caption = 'Tipo Logradouro'
        DataBinding.FieldName = 'DES_TIPO_LOGRADOURO'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 103
      end
      object cxGrid1DBTableView1DES_LOGRADOURO: TcxGridDBColumn
        Caption = 'Logradouro'
        DataBinding.FieldName = 'DES_LOGRADOURO'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 262
      end
      object cxGrid1DBTableView1NUM_LOGRADOURO: TcxGridDBColumn
        Caption = 'N'#250'mero'
        DataBinding.FieldName = 'NUM_LOGRADOURO'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
      end
      object cxGrid1DBTableView1DES_COMPLEMENTO: TcxGridDBColumn
        Caption = 'Complemento'
        DataBinding.FieldName = 'DES_COMPLEMENTO'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 189
      end
      object cxGrid1DBTableView1NOM_BAIRRO: TcxGridDBColumn
        Caption = 'Bairro'
        DataBinding.FieldName = 'NOM_BAIRRO'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 246
      end
      object cxGrid1DBTableView1NOM_CIDADE: TcxGridDBColumn
        Caption = 'Cidade'
        DataBinding.FieldName = 'NOM_CIDADE'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 276
      end
      object cxGrid1DBTableView1UF_ESTADO: TcxGridDBColumn
        Caption = 'UF'
        DataBinding.FieldName = 'UF_ESTADO'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'UF_ESTADO'
        Properties.ListColumns = <
          item
            FieldName = 'UF_ESTADO'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dsEstados
        HeaderAlignmentHorz = taCenter
        Width = 39
      end
      object cxGrid1DBTableView1NUM_CEP: TcxGridDBColumn
        Caption = 'CEP'
        DataBinding.FieldName = 'NUM_CEP'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.IgnoreMaskBlank = True
        Properties.MaskKind = emkRegExpr
        Properties.EditMask = '\d\d\d\d\d - \d\d\d'
        HeaderAlignmentHorz = taCenter
        Width = 78
      end
      object cxGrid1DBTableView1DES_REFERENCIA: TcxGridDBColumn
        DataBinding.FieldName = 'DES_REFERENCIA'
        PropertiesClassName = 'TcxTextEditProperties'
        Visible = False
        HeaderAlignmentHorz = taCenter
        VisibleForCustomization = False
        VisibleForEditForm = bFalse
      end
      object cxGrid1DBTableView1DES_LOG: TcxGridDBColumn
        Caption = 'LOG'
        DataBinding.FieldName = 'DES_LOG'
        PropertiesClassName = 'TcxTextEditProperties'
        Visible = False
        HeaderAlignmentHorz = taCenter
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
    Top = 431
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Action = actimportar
    Anchors = [akLeft, akBottom]
    TabOrder = 2
  end
  object cxButton2: TcxButton
    Left = 84
    Top = 431
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Action = actLocalizar
    Anchors = [akLeft, akBottom]
    TabOrder = 3
  end
  object cxButton3: TcxButton
    Left = 165
    Top = 431
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Action = actFiltrar
    Anchors = [akLeft, akBottom]
    TabOrder = 4
  end
  object cxButton4: TcxButton
    Left = 246
    Top = 431
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Action = actExportar
    Anchors = [akLeft, akBottom]
    TabOrder = 5
  end
  object cxButton5: TcxButton
    Left = 327
    Top = 431
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Action = actCancelar
    Anchors = [akLeft, akBottom]
    TabOrder = 6
  end
  object cxButton6: TcxButton
    Left = 866
    Top = 431
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Action = actSair
    Anchors = [akRight, akBottom]
    TabOrder = 7
  end
  object dsAssinaturas: TDataSource
    AutoEdit = False
    DataSet = dm.tbAssinantesJornal
    OnStateChange = dsAssinaturasStateChange
    Left = 792
    Top = 8
  end
  object dsProdutos: TDataSource
    AutoEdit = False
    DataSet = dm.tbProdutos
    Left = 832
    Top = 8
  end
  object dsEstados: TDataSource
    AutoEdit = False
    DataSet = dm.tbEstados
    Left = 872
    Top = 8
  end
  object aclAssinantesJornal: TActionList
    Images = dm.cxImageList1
    Left = 904
    Top = 8
    object actimportar: TAction
      Tag = 4
      Category = 'Assinantes'
      Caption = 'Importar'
      Hint = 'Importar Assinaturas do STD Cliente'
      ImageIndex = 33
      OnExecute = actimportarExecute
    end
    object actLocalizar: TAction
      Tag = 4
      Category = 'Assinantes'
      Caption = 'Localizar'
      Hint = 'Localizar Assinaturas'
      ImageIndex = 18
      ShortCut = 119
      OnExecute = actLocalizarExecute
    end
    object actFiltrar: TAction
      Tag = 4
      Category = 'Assinantes'
      Caption = 'Filtrar'
      Hint = 'Filtrar dados'
      ImageIndex = 67
      OnExecute = actFiltrarExecute
    end
    object actExportar: TAction
      Tag = 4
      Category = 'Assinantes'
      Caption = 'Exportar'
      Hint = 'Exportar dados da grade'
      ImageIndex = 29
      OnExecute = actExportarExecute
    end
    object actCancelar: TAction
      Tag = 4
      Category = 'Assinantes'
      Caption = 'Cancelar'
      Hint = 'Cancelar opera'#231#227'o'
      ImageIndex = 62
      OnExecute = actCancelarExecute
    end
    object actSair: TAction
      Tag = 4
      Category = 'Assinantes'
      Caption = 'Sair'
      Hint = 'Sair da Tela'
      ImageIndex = 10
      OnExecute = actSairExecute
    end
  end
  object OpenDialog: TOpenDialog
    Filter = 'Banco de Dados|*.mdb'
    Left = 752
    Top = 8
  end
  object SaveDialog: TSaveDialog
    Left = 560
    Top = 432
  end
end
