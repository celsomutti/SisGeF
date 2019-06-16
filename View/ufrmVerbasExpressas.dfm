object frmVerbasExpressas: TfrmVerbasExpressas
  Left = 0
  Top = 0
  Caption = 'Verbas Expressas'
  ClientHeight = 666
  ClientWidth = 1492
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel27: TcxLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alTop
    AutoSize = False
    Caption = 'Verbas Expressas'
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
    Width = 1486
    AnchorY = 22
  end
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 44
    Width = 1492
    Height = 622
    Align = alClient
    TabOrder = 1
    LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
    OptionsImage.Images = dm.cxImageList1
    object grdVerbaCEP: TcxGrid
      Left = 20
      Top = 43
      Width = 668
      Height = 275
      TabOrder = 0
      object tvVerbaCEP: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.Images = dm.cxImageList1
        Navigator.Buttons.First.Hint = 'Primeiro registro'
        Navigator.Buttons.First.ImageIndex = 99
        Navigator.Buttons.PriorPage.Visible = False
        Navigator.Buttons.Prior.Hint = 'Pr'#243'ximo registro'
        Navigator.Buttons.Prior.ImageIndex = 102
        Navigator.Buttons.Next.Hint = 'Pr'#243'ximo registro'
        Navigator.Buttons.Next.ImageIndex = 101
        Navigator.Buttons.NextPage.Visible = False
        Navigator.Buttons.Last.Hint = #250'ltimo registro'
        Navigator.Buttons.Last.ImageIndex = 100
        Navigator.Buttons.Insert.Hint = 'Inserir dados'
        Navigator.Buttons.Insert.ImageIndex = 1
        Navigator.Buttons.Delete.Hint = 'Excluir registro'
        Navigator.Buttons.Delete.ImageIndex = 8
        Navigator.Buttons.Edit.Hint = 'Editar dados'
        Navigator.Buttons.Edit.ImageIndex = 14
        Navigator.Buttons.Post.Hint = 'Gravar dados'
        Navigator.Buttons.Post.ImageIndex = 9
        Navigator.Buttons.Cancel.Hint = 'Cancelar a opera'#231#227'o atual'
        Navigator.Buttons.Cancel.ImageIndex = 62
        Navigator.Buttons.Refresh.Hint = 'Atualizar'
        Navigator.Buttons.Refresh.ImageIndex = 40
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.Buttons.GotoBookmark.Visible = False
        Navigator.Buttons.Filter.Hint = 'Filtrar dados'
        Navigator.Buttons.Filter.ImageIndex = 67
        Navigator.InfoPanel.Visible = True
        Navigator.Visible = True
        DataController.DataSource = dsVerbaCEP
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.DeletingConfirmation = False
        OptionsSelection.InvertSelect = False
        OptionsSelection.MultiSelect = True
        OptionsSelection.CellMultiSelect = True
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        object tvVerbaCEPRecId: TcxGridDBColumn
          DataBinding.FieldName = 'RecId'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvVerbaCEPID_VERBA: TcxGridDBColumn
          DataBinding.FieldName = 'ID_VERBA'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.IgnoreMaskBlank = True
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d\d\d\d\d\d'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          SortIndex = 0
          SortOrder = soAscending
        end
        object tvVerbaCEPNUM_CEP_INICIAL: TcxGridDBColumn
          DataBinding.FieldName = 'NUM_CEP_INICIAL'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.IgnoreMaskBlank = True
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d\d\d\d\d\d\d\d'
          HeaderAlignmentHorz = taCenter
        end
        object tvVerbaCEPNUM_CEP_FINAL: TcxGridDBColumn
          DataBinding.FieldName = 'NUM_CEP_FINAL'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.IgnoreMaskBlank = True
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d\d\d\d\d\d\d\d'
          HeaderAlignmentHorz = taCenter
        end
        object tvVerbaCEPVAL_VERBA: TcxGridDBColumn
          DataBinding.FieldName = 'VAL_VERBA'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;-,0.00'
          HeaderAlignmentHorz = taCenter
        end
        object tvVerbaCEPCOD_GRUPO: TcxGridDBColumn
          DataBinding.FieldName = 'COD_GRUPO'
          PropertiesClassName = 'TcxSpinEditProperties'
          HeaderAlignmentHorz = taCenter
        end
        object tvVerbaCEPID_FAIXA: TcxGridDBColumn
          DataBinding.FieldName = 'ID_FAIXA'
          PropertiesClassName = 'TcxSpinEditProperties'
          HeaderAlignmentHorz = taCenter
        end
        object tvVerbaCEPDES_LOG: TcxGridDBColumn
          DataBinding.FieldName = 'DES_LOG'
          PropertiesClassName = 'TcxBlobEditProperties'
          Properties.BlobEditKind = bekMemo
          Properties.ImmediateDropDownWhenActivated = False
          Properties.ImmediateDropDownWhenKeyPressed = False
          HeaderAlignmentHorz = taCenter
        end
      end
      object lvVerbaCEP: TcxGridLevel
        GridView = tvVerbaCEP
      end
    end
    object grdVerbaFixa: TcxGrid
      Left = 714
      Top = 43
      Width = 631
      Height = 275
      TabOrder = 1
      object tvVerbaFixa: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.Images = dm.cxImageList1
        Navigator.Buttons.First.Hint = 'Primeiro registro'
        Navigator.Buttons.First.ImageIndex = 99
        Navigator.Buttons.PriorPage.Visible = False
        Navigator.Buttons.Prior.Hint = 'Registro anterior'
        Navigator.Buttons.Prior.ImageIndex = 102
        Navigator.Buttons.Next.Hint = 'Pr'#243'ximo registro'
        Navigator.Buttons.Next.ImageIndex = 101
        Navigator.Buttons.NextPage.Visible = False
        Navigator.Buttons.Last.Hint = #218'ltimo registro'
        Navigator.Buttons.Last.ImageIndex = 100
        Navigator.Buttons.Insert.Hint = 'Incluir dados'
        Navigator.Buttons.Insert.ImageIndex = 1
        Navigator.Buttons.Delete.Hint = 'Excluir dados'
        Navigator.Buttons.Delete.ImageIndex = 8
        Navigator.Buttons.Edit.Hint = 'Editar dados'
        Navigator.Buttons.Edit.ImageIndex = 14
        Navigator.Buttons.Post.Hint = 'Gravar dados'
        Navigator.Buttons.Post.ImageIndex = 9
        Navigator.Buttons.Cancel.Hint = 'Cancelar opera'#231#227'o'
        Navigator.Buttons.Cancel.ImageIndex = 62
        Navigator.Buttons.Refresh.Hint = 'Atualizar dados'
        Navigator.Buttons.Refresh.ImageIndex = 40
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.Buttons.GotoBookmark.Visible = False
        Navigator.Buttons.Filter.Hint = 'Filtrar dados'
        Navigator.Buttons.Filter.ImageIndex = 67
        Navigator.InfoPanel.Visible = True
        Navigator.Visible = True
        DataController.DataSource = dsVerbaFixa
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        Images = dm.cxImageList1
        OptionsBehavior.CopyCaptionsToClipboard = False
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsData.DeletingConfirmation = False
        OptionsSelection.InvertSelect = False
        OptionsSelection.MultiSelect = True
        OptionsSelection.CellMultiSelect = True
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        object tvVerbaFixaRecId: TcxGridDBColumn
          DataBinding.FieldName = 'RecId'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvVerbaFixaID_VERBA_FIXA: TcxGridDBColumn
          DataBinding.FieldName = 'ID_VERBA_FIXA'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.IgnoreMaskBlank = True
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d\d\d\d\d\d'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          SortIndex = 0
          SortOrder = soAscending
          Width = 65
        end
        object tvVerbaFixaID_GRUPO: TcxGridDBColumn
          DataBinding.FieldName = 'ID_GRUPO'
          HeaderAlignmentHorz = taCenter
        end
        object tvVerbaFixaDAT_VERBA_FIXA: TcxGridDBColumn
          DataBinding.FieldName = 'DAT_VERBA_FIXA'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.SaveTime = False
          Properties.ShowTime = False
          HeaderAlignmentHorz = taCenter
          Width = 95
        end
        object tvVerbaFixaDES_VERBA_FIXA: TcxGridDBColumn
          DataBinding.FieldName = 'DES_VERBA_FIXA'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 263
        end
        object tvVerbaFixaVAL_VERBA_FIXA: TcxGridDBColumn
          DataBinding.FieldName = 'VAL_VERBA_FIXA'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;-,0.00'
          HeaderAlignmentHorz = taCenter
          Width = 84
        end
        object tvVerbaFixaDOM_ATIVO: TcxGridDBColumn
          DataBinding.FieldName = 'DOM_ATIVO'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.ValueChecked = 1
          Properties.ValueUnchecked = 0
          HeaderAlignmentHorz = taCenter
          Width = 60
        end
        object tvVerbaFixaDES_LOG: TcxGridDBColumn
          DataBinding.FieldName = 'DES_LOG'
          PropertiesClassName = 'TcxBlobEditProperties'
          Properties.BlobEditKind = bekMemo
          Properties.ImmediateDropDownWhenActivated = False
          Properties.ImmediateDropDownWhenKeyPressed = False
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 62
        end
      end
      object lvVerbaFixa: TcxGridLevel
        GridView = tvVerbaFixa
      end
    end
    object grdPenalizacoes: TcxGrid
      Left = 20
      Top = 370
      Width = 517
      Height = 175
      TabOrder = 2
      object tvPenalizacoes: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.Images = dm.cxImageList1
        Navigator.Buttons.First.Hint = 'Primeiro registro'
        Navigator.Buttons.First.ImageIndex = 99
        Navigator.Buttons.PriorPage.Visible = False
        Navigator.Buttons.Prior.Hint = 'Registro anterior'
        Navigator.Buttons.Prior.ImageIndex = 102
        Navigator.Buttons.Next.Hint = 'Pr'#243'ximo registro'
        Navigator.Buttons.Next.ImageIndex = 101
        Navigator.Buttons.NextPage.Visible = False
        Navigator.Buttons.Last.Hint = #218'ltimo registro'
        Navigator.Buttons.Last.ImageIndex = 100
        Navigator.Buttons.Insert.Hint = 'Inserir dados'
        Navigator.Buttons.Insert.ImageIndex = 1
        Navigator.Buttons.Delete.Hint = 'Excluir registro'
        Navigator.Buttons.Delete.ImageIndex = 8
        Navigator.Buttons.Edit.Hint = 'Editar dados'
        Navigator.Buttons.Edit.ImageIndex = 14
        Navigator.Buttons.Post.Hint = 'Gravar dados'
        Navigator.Buttons.Post.ImageIndex = 9
        Navigator.Buttons.Cancel.Hint = 'Cancelar a opera'#231#227'o atual'
        Navigator.Buttons.Cancel.ImageIndex = 62
        Navigator.Buttons.Refresh.Hint = 'Atualizar'
        Navigator.Buttons.Refresh.ImageIndex = 40
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.Buttons.GotoBookmark.Visible = False
        Navigator.Buttons.Filter.Hint = 'Filtrar dados'
        Navigator.Buttons.Filter.ImageIndex = 67
        Navigator.InfoPanel.Visible = True
        Navigator.Visible = True
        DataController.DataSource = dsPenalizacao
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsData.DeletingConfirmation = False
        OptionsSelection.InvertSelect = False
        OptionsSelection.MultiSelect = True
        OptionsSelection.CellMultiSelect = True
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        object tvPenalizacoesRecId: TcxGridDBColumn
          DataBinding.FieldName = 'RecId'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvPenalizacoesID_PENALIZACAO: TcxGridDBColumn
          DataBinding.FieldName = 'ID_PENALIZACAO'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.IgnoreMaskBlank = True
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d\d\d\d\d\d'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          SortIndex = 0
          SortOrder = soAscending
          Width = 81
        end
        object tvPenalizacoesDAT_PENALIZACAO: TcxGridDBColumn
          DataBinding.FieldName = 'DAT_PENALIZACAO'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.SaveTime = False
          Properties.ShowTime = False
          HeaderAlignmentHorz = taCenter
          Width = 101
        end
        object tvPenalizacoesQTD_DIAS_ATRASO: TcxGridDBColumn
          DataBinding.FieldName = 'QTD_DIAS_ATRASO'
          PropertiesClassName = 'TcxSpinEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 106
        end
        object tvPenalizacoesVAL_PENALIZACAO: TcxGridDBColumn
          DataBinding.FieldName = 'VAL_PENALIZACAO'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;-,0.00'
          HeaderAlignmentHorz = taCenter
          Width = 83
        end
        object tvPenalizacoesPER_PENALIZACAO: TcxGridDBColumn
          DataBinding.FieldName = 'PER_PENALIZACAO'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DecimalPlaces = 3
          Properties.DisplayFormat = ',0.000;-,0.000'
          HeaderAlignmentHorz = taCenter
          Width = 76
        end
        object tvPenalizacoesDES_LOG: TcxGridDBColumn
          DataBinding.FieldName = 'DES_LOG'
          PropertiesClassName = 'TcxBlobEditProperties'
          Properties.BlobEditKind = bekMemo
          Properties.ImmediateDropDownWhenActivated = False
          Properties.ImmediateDropDownWhenKeyPressed = False
          HeaderAlignmentHorz = taCenter
          Width = 68
        end
      end
      object lvPenalizacoes: TcxGridLevel
        GridView = tvPenalizacoes
      end
    end
    object grdTabelaDistribuicao: TcxGrid
      Left = 563
      Top = 370
      Width = 782
      Height = 177
      TabOrder = 3
      object tvTabelaDistribuicao: TcxGridDBTableView
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
        Navigator.Buttons.Edit.ImageIndex = 14
        Navigator.Buttons.Post.ImageIndex = 9
        Navigator.Buttons.Cancel.ImageIndex = 62
        Navigator.Buttons.Refresh.ImageIndex = 40
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.Buttons.GotoBookmark.Visible = False
        Navigator.Buttons.Filter.ImageIndex = 67
        Navigator.InfoPanel.Visible = True
        Navigator.Visible = True
        DataController.DataSource = dsTabelaDistribuicao
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsData.DeletingConfirmation = False
        OptionsSelection.InvertSelect = False
        OptionsSelection.MultiSelect = True
        OptionsSelection.CellMultiSelect = True
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        object tvTabelaDistribuicaoRecId: TcxGridDBColumn
          DataBinding.FieldName = 'RecId'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object tvTabelaDistribuicaoID_TABELA: TcxGridDBColumn
          DataBinding.FieldName = 'ID_TABELA'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.IgnoreMaskBlank = True
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d\d\d\d\d\d'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 54
        end
        object tvTabelaDistribuicaoDAT_TABELA: TcxGridDBColumn
          DataBinding.FieldName = 'DAT_TABELA'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.SaveTime = False
          Properties.ShowTime = False
          HeaderAlignmentHorz = taCenter
          Width = 89
        end
        object tvTabelaDistribuicaoCOD_TABELA: TcxGridDBColumn
          DataBinding.FieldName = 'COD_TABELA'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.Images = dm.cxImageList1
          Properties.Items = <
            item
              Description = 'VERBA FIXA'
              ImageIndex = 81
              Value = 1
            end
            item
              Description = 'SLA'
              ImageIndex = 81
              Value = 2
            end
            item
              Description = 'CEP/FAIXA DE PESO'
              ImageIndex = 81
              Value = 3
            end
            item
              Description = 'CEP'
              ImageIndex = 81
              Value = 4
            end
            item
              Description = 'FAIXA DE PESO'
              ImageIndex = 81
              Value = 5
            end>
          HeaderAlignmentHorz = taCenter
          Width = 122
        end
        object tvTabelaDistribuicaoCOD_GRUPO: TcxGridDBColumn
          DataBinding.FieldName = 'COD_GRUPO'
          PropertiesClassName = 'TcxSpinEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 44
        end
        object tvTabelaDistribuicaoCOD_TIPO: TcxGridDBColumn
          DataBinding.FieldName = 'COD_TIPO'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.Images = dm.cxImageList1
          Properties.Items = <
            item
              Description = 'DISTRIBUIDOR'
              ImageIndex = 26
              Value = 1
            end
            item
              Description = 'ENTREGADOR'
              ImageIndex = 57
              Value = '2'
            end>
          HeaderAlignmentHorz = taCenter
          Width = 131
        end
        object tvTabelaDistribuicaoCOD_ENTREGADOR: TcxGridDBColumn
          DataBinding.FieldName = 'COD_ENTREGADOR'
          PropertiesClassName = 'TcxButtonEditProperties'
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.IgnoreMaskBlank = True
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d\d\d\d\d\d'
          Properties.OnButtonClick = tvTabelaDistribuicaoCOD_ENTREGADORPropertiesButtonClick
          HeaderAlignmentHorz = taCenter
          Width = 69
        end
        object tvTabelaDistribuicaoNOM_ENTREGADOR: TcxGridDBColumn
          DataBinding.FieldName = 'NOM_ENTREGADOR'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 230
        end
        object tvTabelaDistribuicaoDES_LOG: TcxGridDBColumn
          DataBinding.FieldName = 'DES_LOG'
          PropertiesClassName = 'TcxBlobEditProperties'
          Properties.BlobEditKind = bekMemo
          Properties.ImmediateDropDownWhenActivated = False
          Properties.ImmediateDropDownWhenKeyPressed = False
          HeaderAlignmentHorz = taCenter
          Width = 41
        end
      end
      object lvTabelaDistribuicao: TcxGridLevel
        GridView = tvTabelaDistribuicao
      end
    end
    object lcgRoot: TdxLayoutGroup
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object lcgVerbaCEP: TdxLayoutGroup
      Parent = dxLayoutControl1Group1
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.ImageIndex = 28
      CaptionOptions.Text = 'Verba por CEP'
      ButtonOptions.Buttons = <>
      ButtonOptions.ShowExpandButton = True
      Index = 0
    end
    object lciVerbaCEP: TdxLayoutItem
      Parent = lcgVerbaCEP
      CaptionOptions.ImageIndex = 110
      CaptionOptions.Text = 'Verba por CEP'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      Control = grdVerbaCEP
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lcgVerbaFixa: TdxLayoutGroup
      Parent = dxLayoutControl1Group1
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.ImageIndex = 28
      CaptionOptions.Text = 'Verba Fixa'
      ButtonOptions.Buttons = <>
      ButtonOptions.ShowExpandButton = True
      Index = 1
    end
    object lciVerbaFixa: TdxLayoutItem
      Parent = lcgVerbaFixa
      CaptionOptions.ImageIndex = 110
      CaptionOptions.Text = 'Verbas Fixas'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      Control = grdVerbaFixa
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Group1: TdxLayoutAutoCreatedGroup
      Parent = lcgRoot
      LayoutDirection = ldHorizontal
      Index = 0
      AutoCreated = True
    end
    object lcgPenalizacoes: TdxLayoutGroup
      Parent = dxLayoutControl1Group2
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.ImageIndex = 28
      CaptionOptions.Text = 'Penaliza'#231#245'es por Atraso'
      ButtonOptions.Buttons = <>
      ButtonOptions.ShowExpandButton = True
      Index = 0
    end
    object lciPenalizacoes: TdxLayoutItem
      Parent = lcgPenalizacoes
      CaptionOptions.ImageIndex = 28
      CaptionOptions.Text = 'Penaliza'#231#245'es'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      Control = grdPenalizacoes
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lcgTabelaDistribuicao: TdxLayoutGroup
      Parent = dxLayoutControl1Group2
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.ImageIndex = 28
      CaptionOptions.Text = 'Distribuidores/Entregadores/Tabelas'
      ButtonOptions.Buttons = <>
      ButtonOptions.ShowExpandButton = True
      Index = 1
    end
    object lciTabelaDistribuicao: TdxLayoutItem
      Parent = lcgTabelaDistribuicao
      CaptionOptions.Text = 'Distribuicores/Entregadores/Tabelas'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      Control = grdTabelaDistribuicao
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Group2: TdxLayoutAutoCreatedGroup
      Parent = lcgRoot
      AlignVert = avTop
      LayoutDirection = ldHorizontal
      Index = 1
      AutoCreated = True
    end
  end
  object tbVerbaFixa: TdxMemData
    Indexes = <>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F060000000400000003000E0049445F56455242415F
      46495841000400000009000F004441545F56455242415F464958410032000000
      14000F004445535F56455242415F46495841000800000006000F0056414C5F56
      455242415F46495841000400000003000A00444F4D5F415449564F0000000000
      190008004445535F4C4F4700}
    SortOptions = []
    AfterInsert = tbVerbaFixaAfterInsert
    BeforePost = tbVerbaFixaBeforePost
    AfterPost = tbVerbaFixaAfterPost
    BeforeDelete = tbVerbaFixaBeforeDelete
    Left = 256
    object tbVerbaFixaID_VERBA_FIXA: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_VERBA_FIXA'
    end
    object tbVerbaFixaID_GRUPO: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'ID_GRUPO'
    end
    object tbVerbaFixaDAT_VERBA_FIXA: TDateField
      DisplayLabel = 'Data'
      FieldName = 'DAT_VERBA_FIXA'
    end
    object tbVerbaFixaDES_VERBA_FIXA: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DES_VERBA_FIXA'
      Size = 50
    end
    object tbVerbaFixaVAL_VERBA_FIXA: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VAL_VERBA_FIXA'
    end
    object tbVerbaFixaDOM_ATIVO: TIntegerField
      DisplayLabel = 'Ativo'
      FieldName = 'DOM_ATIVO'
    end
    object tbVerbaFixaDES_LOG: TWideMemoField
      DisplayLabel = 'LOG'
      FieldName = 'DES_LOG'
      BlobType = ftWideMemo
    end
  end
  object dsVerbaFixa: TDataSource
    AutoEdit = False
    DataSet = tbVerbaFixa
    Left = 296
  end
  object tbVerbaCEP: TdxMemData
    Indexes = <>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F07000000040000000300090049445F564552424100
      10000000140010004E554D5F4345505F494E494349414C001000000014000E00
      4E554D5F4345505F46494E414C000800000006000A0056414C5F564552424100
      0400000003000A00434F445F475255504F00040000000300090049445F464149
      58410000000000190008004445535F4C4F4700}
    SortOptions = []
    AfterInsert = tbVerbaCEPAfterInsert
    BeforePost = tbVerbaCEPBeforePost
    AfterPost = tbVerbaCEPAfterPost
    BeforeDelete = tbVerbaCEPBeforeDelete
    Left = 360
    object tbVerbaCEPID_VERBA: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_VERBA'
    end
    object tbVerbaCEPNUM_CEP_INICIAL: TWideStringField
      DisplayLabel = 'CEP Inicial'
      FieldName = 'NUM_CEP_INICIAL'
      Size = 16
    end
    object tbVerbaCEPNUM_CEP_FINAL: TWideStringField
      DisplayLabel = 'CEP Final'
      FieldName = 'NUM_CEP_FINAL'
      Size = 16
    end
    object tbVerbaCEPVAL_VERBA: TFloatField
      DisplayLabel = 'Verba'
      FieldName = 'VAL_VERBA'
    end
    object tbVerbaCEPCOD_GRUPO: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'COD_GRUPO'
    end
    object tbVerbaCEPID_FAIXA: TIntegerField
      DisplayLabel = 'Faixa'
      FieldName = 'ID_FAIXA'
    end
    object tbVerbaCEPDES_LOG: TWideMemoField
      DisplayLabel = 'LOG'
      FieldName = 'DES_LOG'
      BlobType = ftWideMemo
    end
  end
  object dsVerbaCEP: TDataSource
    AutoEdit = False
    DataSet = tbVerbaCEP
    Left = 400
  end
  object tbPenalizacao: TdxMemData
    Indexes = <>
    SortOptions = []
    AfterInsert = tbPenalizacaoAfterInsert
    BeforePost = tbPenalizacaoBeforePost
    AfterPost = tbPenalizacaoAfterPost
    BeforeDelete = tbPenalizacaoBeforeDelete
    Left = 456
    object tbPenalizacaoID_PENALIZACAO: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_PENALIZACAO'
    end
    object tbPenalizacaoDAT_PENALIZACAO: TDateField
      DisplayLabel = 'Data'
      FieldName = 'DAT_PENALIZACAO'
    end
    object tbPenalizacaoQTD_DIAS_ATRASO: TIntegerField
      DisplayLabel = 'Atraso'
      FieldName = 'QTD_DIAS_ATRASO'
    end
    object tbPenalizacaoVAL_PENALIZACAO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VAL_PENALIZACAO'
    end
    object tbPenalizacaoPER_PENALIZACAO: TFloatField
      DisplayLabel = 'Percentual'
      FieldName = 'PER_PENALIZACAO'
    end
    object tbPenalizacaoDES_LOG: TMemoField
      DisplayLabel = 'LOG'
      FieldName = 'DES_LOG'
      BlobType = ftMemo
    end
  end
  object dsPenalizacao: TDataSource
    AutoEdit = False
    DataSet = tbPenalizacao
    Left = 496
  end
  object tbTabelaDistribuicao: TdxMemData
    Indexes = <>
    SortOptions = []
    AfterInsert = tbTabelaDistribuicaoAfterInsert
    BeforePost = tbTabelaDistribuicaoBeforePost
    AfterPost = tbTabelaDistribuicaoAfterPost
    BeforeDelete = tbTabelaDistribuicaoBeforeDelete
    Left = 552
    object tbTabelaDistribuicaoID_TABELA: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_TABELA'
    end
    object tbTabelaDistribuicaoDAT_TABELA: TDateField
      DisplayLabel = 'Data'
      FieldName = 'DAT_TABELA'
    end
    object tbTabelaDistribuicaoCOD_TABELA: TIntegerField
      DisplayLabel = 'Tabela'
      FieldName = 'COD_TABELA'
    end
    object tbTabelaDistribuicaoCOD_GRUPO: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'COD_GRUPO'
    end
    object tbTabelaDistribuicaoCOD_TIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'COD_TIPO'
    end
    object tbTabelaDistribuicaoCOD_ENTREGADOR: TIntegerField
      DisplayLabel = 'Entregador'
      FieldName = 'COD_ENTREGADOR'
      OnValidate = tbTabelaDistribuicaoCOD_ENTREGADORValidate
    end
    object tbTabelaDistribuicaoNOM_ENTREGADOR: TStringField
      DisplayLabel = 'Nome Distribuidor/Entregador'
      FieldName = 'NOM_ENTREGADOR'
      Size = 80
    end
    object tbTabelaDistribuicaoDES_LOG: TMemoField
      DisplayLabel = 'LOG'
      FieldName = 'DES_LOG'
      BlobType = ftMemo
    end
  end
  object dsTabelaDistribuicao: TDataSource
    AutoEdit = False
    DataSet = tbTabelaDistribuicao
    Left = 592
  end
end
