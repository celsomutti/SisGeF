object frmRecadosJornal: TfrmRecadosJornal
  Left = 0
  Top = 0
  Caption = 'Recados Jornal'
  ClientHeight = 485
  ClientWidth = 945
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
  object cxLabel27: TcxLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alTop
    AutoSize = False
    Caption = 'Recados Jornal'
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
    Width = 939
    AnchorY = 22
  end
  object lcRecadosJornal: TdxLayoutControl
    Left = 0
    Top = 44
    Width = 945
    Height = 441
    Align = alClient
    TabOrder = 1
    LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
    OptionsImage.Images = dm.cxImageList1
    object grdRecados: TcxGrid
      Left = 10
      Top = 57
      Width = 250
      Height = 391
      Images = dm.cxImageList1
      TabOrder = 3
      object tvRecados: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.Images = dm.cxImageList1
        Navigator.Buttons.First.ImageIndex = 99
        Navigator.Buttons.PriorPage.Visible = False
        Navigator.Buttons.Prior.ImageIndex = 102
        Navigator.Buttons.Next.ImageIndex = 101
        Navigator.Buttons.NextPage.Visible = False
        Navigator.Buttons.Last.ImageIndex = 100
        Navigator.Buttons.Insert.ImageIndex = 1
        Navigator.Buttons.Delete.ImageIndex = 8
        Navigator.Buttons.Delete.Visible = True
        Navigator.Buttons.Edit.ImageIndex = 14
        Navigator.Buttons.Edit.Visible = True
        Navigator.Buttons.Post.ImageIndex = 9
        Navigator.Buttons.Cancel.ImageIndex = 6
        Navigator.Buttons.Cancel.Visible = True
        Navigator.Buttons.Refresh.ImageIndex = 40
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.Buttons.GotoBookmark.Visible = False
        Navigator.Buttons.Filter.ImageIndex = 67
        Navigator.Buttons.Filter.Visible = True
        Navigator.InfoPanel.Visible = True
        Navigator.Visible = True
        DataController.DataSource = dsRecados
        DataController.KeyFieldNames = 'ID_RECADO'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        Images = dm.cxImageList1
        OptionsBehavior.CellHints = True
        OptionsBehavior.CopyCaptionsToClipboard = False
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsSelection.InvertSelect = False
        OptionsSelection.MultiSelect = True
        OptionsSelection.CellMultiSelect = True
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        object tvRecadosDOM_IMPRESSAO: TcxGridDBColumn
          DataBinding.FieldName = 'DOM_IMPRESSAO'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Images = dm.cxImageList1
          Properties.Items = <
            item
              Description = 'J'#225' Impresso'
              ImageIndex = 0
              Value = 'S'
            end
            item
              Description = 'N'#227'o Impresso'
              ImageIndex = 25
              Value = 'N'
            end
            item
              Description = 'Imprimir'
              ImageIndex = 15
              Value = 'P'
            end>
          Properties.ShowDescriptions = False
          HeaderGlyphAlignmentHorz = taCenter
          HeaderImageIndex = 15
          Width = 20
          IsCaptionAssigned = True
        end
        object tvRecadosID_RECADO: TcxGridDBColumn
          Caption = 'ID'
          DataBinding.FieldName = 'ID_RECADO'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.IgnoreMaskBlank = True
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d\d\d\d\d\d'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 24
        end
        object tvRecadosDAT_OCORRENCIA: TcxGridDBColumn
          Caption = 'Data Ocorr'#234'ncia'
          DataBinding.FieldName = 'DAT_OCORRENCIA'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.SaveTime = False
          Properties.ShowTime = False
          HeaderAlignmentHorz = taCenter
          Width = 92
        end
        object tvRecadosCOD_ASSINATURA: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'COD_ASSINATURA'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.OnValidate = tvRecadosCOD_ASSINATURAPropertiesValidate
          HeaderAlignmentHorz = taCenter
          Width = 94
        end
        object tvRecadosNOM_ASSINANTE: TcxGridDBColumn
          Caption = 'Nome do Assinante'
          DataBinding.FieldName = 'NOM_ASSINANTE'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 158
        end
        object tvRecadosDES_PRODUTO: TcxGridDBColumn
          Caption = 'Produto'
          DataBinding.FieldName = 'DES_PRODUTO'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'DES_PRODUTO'
          Properties.ListColumns = <
            item
              FieldName = 'DES_PRODUTO'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dsProdutos
          HeaderAlignmentHorz = taCenter
          Width = 69
        end
        object tvRecadosDES_ENDERECO: TcxGridDBColumn
          Caption = 'Endere'#231'o'
          DataBinding.FieldName = 'DES_ENDERECO'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 167
        end
        object tvRecadosDES_RECADO: TcxGridDBColumn
          Caption = 'Recado'
          DataBinding.FieldName = 'DES_RECADO'
          PropertiesClassName = 'TcxMemoProperties'
          HeaderAlignmentHorz = taCenter
          Width = 138
        end
        object tvRecadosCOD_RESULTADO: TcxGridDBColumn
          Caption = 'Resultado'
          DataBinding.FieldName = 'COD_RESULTADO'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'COD_RESULTADO'
          Properties.ListColumns = <
            item
              FieldName = 'COD_RESULTADO'
            end
            item
              FieldName = 'DES_RESULTADO'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dsResultados
          HeaderAlignmentHorz = taCenter
          Width = 40
        end
        object tvRecadosCOD_ORIGEM: TcxGridDBColumn
          Caption = 'Origem'
          DataBinding.FieldName = 'COD_ORIGEM'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'COD_ORIGEM'
          Properties.ListColumns = <
            item
              FieldName = 'COD_ORIGEM'
            end
            item
              FieldName = 'DES_ORIGEM'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dsOrigens
          HeaderAlignmentHorz = taCenter
          Width = 41
        end
        object tvRecadosDES_MOTIVO: TcxGridDBColumn
          Caption = 'Motivo'
          DataBinding.FieldName = 'DES_MOTIVO'
          PropertiesClassName = 'TcxMemoProperties'
          HeaderAlignmentHorz = taCenter
          Width = 80
        end
        object tvRecadosDES_LOG: TcxGridDBColumn
          Caption = 'LOG'
          DataBinding.FieldName = 'DES_LOG'
          PropertiesClassName = 'TcxBlobEditProperties'
          Properties.BlobEditKind = bekMemo
          Properties.ReadOnly = True
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvRecadosDES_ROTEIRO: TcxGridDBColumn
          Caption = 'Roteiro'
          DataBinding.FieldName = 'DES_ROTEIRO'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
      end
      object lvRecados: TcxGridLevel
        GridView = tvRecados
      end
    end
    object cxButton1: TcxButton
      Left = 848
      Top = 406
      Width = 87
      Height = 25
      Cursor = crHandPoint
      Action = actFechar
      TabOrder = 6
    end
    object datInicio: TcxDateEdit
      Left = 10
      Top = 30
      Hint = 'Data inicial do per'#237'odo'
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.HotTrack = False
      TabOrder = 0
      Width = 103
    end
    object datFinal: TcxDateEdit
      Left = 119
      Top = 30
      Hint = 'Data final do per'#237'odo'
      Style.HotTrack = False
      TabOrder = 1
      Width = 98
    end
    object cxButton2: TcxButton
      Left = 848
      Top = 26
      Width = 87
      Height = 25
      Action = actPesquisar
      TabOrder = 2
    end
    object cxButton3: TcxButton
      Left = 760
      Top = 406
      Width = 82
      Height = 25
      Cursor = crHandPoint
      Action = actImprimir
      TabOrder = 5
    end
    object cxButton4: TcxButton
      Left = 10
      Top = 406
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Action = actColar
      TabOrder = 4
    end
    object lcRecadosJornalGroup_Root: TdxLayoutGroup
      AlignHorz = ahParentManaged
      AlignVert = avParentManaged
      LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object lcRecadosJornalItem1: TdxLayoutItem
      Parent = lcRecadosJornalGroup_Root
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'cxGrid1'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      Control = grdRecados
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lcRecadosJornalItem2: TdxLayoutItem
      Parent = lcRecadosJornalGroup2
      AlignHorz = ahRight
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = cxButton1
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object lcRecadosJornalItem3: TdxLayoutItem
      Parent = lcRecadosJornalGroup1
      AlignHorz = ahLeft
      CaptionOptions.ImageIndex = 7
      CaptionOptions.Text = 'Data Inicial'
      CaptionOptions.Layout = clTop
      LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
      Control = datInicio
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lcRecadosJornalItem4: TdxLayoutItem
      Parent = lcRecadosJornalGroup1
      CaptionOptions.ImageIndex = 7
      CaptionOptions.Text = 'Data Final'
      CaptionOptions.Layout = clTop
      Control = datFinal
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lcRecadosJornalGroup1: TdxLayoutAutoCreatedGroup
      Parent = lcRecadosJornalGroup_Root
      LayoutDirection = ldHorizontal
      Index = 0
      AutoCreated = True
    end
    object lcRecadosJornalItem5: TdxLayoutItem
      Parent = lcRecadosJornalGroup1
      AlignHorz = ahRight
      AlignVert = avBottom
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      Control = cxButton2
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object lcRecadosJornalItem6: TdxLayoutItem
      Parent = lcRecadosJornalGroup2
      AlignHorz = ahRight
      CaptionOptions.Text = 'cxButton3'
      CaptionOptions.Visible = False
      Control = cxButton3
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lcRecadosJornalGroup2: TdxLayoutAutoCreatedGroup
      Parent = lcRecadosJornalGroup_Root
      LayoutDirection = ldHorizontal
      Index = 2
      AutoCreated = True
    end
    object lcRecadosJornalItem7: TdxLayoutItem
      Parent = lcRecadosJornalGroup2
      CaptionOptions.Text = 'cxButton4'
      CaptionOptions.Visible = False
      Control = cxButton4
      ControlOptions.ShowBorder = False
      Index = 0
    end
  end
  object dsRecados: TDataSource
    DataSet = dm.qryRecados
    OnStateChange = dsRecadosStateChange
    Left = 872
    Top = 16
  end
  object dsResultados: TDataSource
    AutoEdit = False
    DataSet = dm.qryResultadosRecados
    Left = 816
    Top = 16
  end
  object dsOrigens: TDataSource
    AutoEdit = False
    DataSet = dm.qryOrigensResultadosRecados
    Left = 768
    Top = 16
  end
  object aclRecados: TActionList
    Images = dm.cxImageList1
    Left = 712
    Top = 16
    object actFechar: TAction
      Category = 'Recados'
      Caption = 'Fechar'
      Hint = 'Fechar a Tela'
      ImageIndex = 103
      OnExecute = actFecharExecute
    end
    object actPesquisar: TAction
      Category = 'Recados'
      Caption = 'Pesquisar'
      Hint = 'Pesquisar dados'
      ImageIndex = 11
      OnExecute = actPesquisarExecute
    end
    object actImprimir: TAction
      Category = 'Recados'
      Caption = 'Imprimir'
      Hint = 'Imprimir recados'
      ImageIndex = 15
      OnExecute = actImprimirExecute
    end
    object actColar: TAction
      Category = 'Recados'
      Caption = 'Colar'
      Hint = 'Colar dados'
      ImageIndex = 66
      OnExecute = actColarExecute
    end
  end
  object rptRecados: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.MDIChild = True
    PreviewOptions.Modal = False
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42530.772804178200000000
    ReportOptions.LastChange = 42531.442396747700000000
    ScriptLanguage = 'PascalScript'
    StoreInDFM = False
    Left = 544
    Top = 24
  end
  object dsrepRecados: TfrxDBDataset
    UserName = 'dsrepRecados'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID_RECADO=ID_RECADO'
      'DAT_OCORRENCIA=DAT_OCORRENCIA'
      'COD_ASSINATURA=COD_ASSINATURA'
      'NOM_ASSINANTE=NOM_ASSINANTE'
      'DES_ENDERECO=DES_ENDERECO'
      'DES_RECADO=DES_RECADO'
      'COD_RESULTADO=COD_RESULTADO'
      'COD_ORIGEM=COD_ORIGEM'
      'DES_MOTIVO=DES_MOTIVO'
      'DES_ROTEIRO=DES_ROTEIRO'
      'DES_PRODUTO=DES_PRODUTO'
      'DOM_IMPRESSAO=DOM_IMPRESSAO'
      'DES_LOG=DES_LOG')
    DataSet = dm.qryRecados
    BCDToCurrency = False
    Left = 600
    Top = 24
  end
  object dsProdutos: TDataSource
    AutoEdit = False
    DataSet = dm.qryProdutosJornal
    Left = 768
    Top = 64
  end
end
