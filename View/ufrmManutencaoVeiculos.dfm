object frmManutencaoVeiculos: TfrmManutencaoVeiculos
  Left = 0
  Top = 0
  Caption = 'Manuten'#231#227'o de Ve'#237'culos'
  ClientHeight = 697
  ClientWidth = 1317
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
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel27: TcxLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alTop
    AutoSize = False
    Caption = 'Manuten'#231#227'o de Ve'#237'culos'
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Properties.Alignment.Vert = taVCenter
    Transparent = True
    Height = 22
    Width = 1311
    AnchorY = 14
  end
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 28
    Width = 1317
    Height = 669
    Align = alClient
    TabOrder = 1
    LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
    OptionsImage.Images = dm.cxImageList1
    object cboVisualizar: TcxComboBox
      Left = 79
      Top = 10
      Hint = 'Selecione a visualiza'#231#227'o dos dados'
      Properties.Items.Strings = (
        #218'ltimos 7 dias'
        'M'#234's Corrente'
        'Ano Corrente'
        #218'ltimos 12 meses'
        'Todas as Viagens'
        'Per'#237'odo')
      Style.HotTrack = False
      TabOrder = 0
      Text = #218'ltimos 7 dias'
      Width = 121
    end
    object datInicio: TcxDateEdit
      Left = 1021
      Top = 10
      Hint = 'Data inicial do per'#237'odo'
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.HotTrack = False
      TabOrder = 1
      Width = 88
    end
    object datFinal: TcxDateEdit
      Left = 1126
      Top = 10
      Hint = 'Data final do per'#237'odo'
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.HotTrack = False
      TabOrder = 2
      Width = 86
    end
    object cxButton1: TcxButton
      Left = 1218
      Top = 10
      Width = 89
      Height = 21
      Cursor = crHandPoint
      Action = actPeriodo
      TabOrder = 3
    end
    object grdManutencao: TcxGrid
      Left = 10
      Top = 57
      Width = 250
      Height = 200
      TabOrder = 4
      object tvManutencao: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.Images = dm.cxImageList1
        Navigator.Buttons.First.ImageIndex = 99
        Navigator.Buttons.PriorPage.Visible = False
        Navigator.Buttons.Prior.ImageIndex = 102
        Navigator.Buttons.Next.ImageIndex = 101
        Navigator.Buttons.NextPage.Visible = False
        Navigator.Buttons.Last.ImageIndex = 100
        Navigator.Buttons.Insert.Visible = False
        Navigator.Buttons.Delete.Visible = False
        Navigator.Buttons.Edit.Visible = False
        Navigator.Buttons.Post.Visible = False
        Navigator.Buttons.Cancel.Visible = False
        Navigator.Buttons.Refresh.ImageIndex = 40
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.Buttons.GotoBookmark.Visible = False
        Navigator.Buttons.Filter.ImageIndex = 67
        Navigator.InfoPanel.Visible = True
        Navigator.Visible = True
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.CopyCaptionsToClipboard = False
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsSelection.InvertSelect = False
        OptionsSelection.MultiSelect = True
        OptionsSelection.CellMultiSelect = True
      end
      object lvManutencao: TcxGridLevel
        GridView = tvManutencao
      end
    end
    object edtID: TcxDBMaskEdit
      Left = 60
      Top = 485
      Hint = 'ID da manuten'#231#227'o'
      DataBinding.DataField = 'ID_MANUTENCAO'
      DataBinding.DataSource = dsManutencao
      Properties.Alignment.Horz = taRightJustify
      Properties.IgnoreMaskBlank = True
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d\d\d\d\d\d'
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 5
      Width = 78
    end
    object cboTipoManutencao: TcxDBComboBox
      Left = 193
      Top = 485
      Hint = 'Tipo de manuten'#231#227'o'
      DataBinding.DataField = 'DES_TIPO'
      DataBinding.DataSource = dsManutencao
      Properties.Items.Strings = (
        'MANUTEN'#199#195'O'
        'CONSERTO')
      Style.HotTrack = False
      TabOrder = 6
      Width = 128
    end
    object lcbPlaca: TcxDBLookupComboBox
      Left = 433
      Top = 485
      Hint = 'Palca do ve'#237'culo'
      DataBinding.DataField = 'COD_VEICULO'
      DataBinding.DataSource = dsManutencao
      Properties.CharCase = ecUpperCase
      Properties.KeyFieldNames = 'COD_VEICULO'
      Properties.ListColumns = <
        item
          FieldName = 'DES_PLACA'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsVeiculos
      Style.HotTrack = False
      TabOrder = 7
      Width = 50
    end
    object lcbVeiculo: TcxDBLookupComboBox
      Left = 517
      Top = 485
      Hint = 'Descri'#231#227'o do ve'#237'culo'
      DataBinding.DataField = 'COD_VEICULO'
      DataBinding.DataSource = dsManutencao
      Properties.KeyFieldNames = 'COD_VEICULO'
      Properties.ListColumns = <
        item
          Caption = 'Marca'
          FieldName = 'DES_MARCA'
        end
        item
          Caption = 'Modelo'
          FieldName = 'DES_MODELO'
        end>
      Properties.ListSource = dsVeiculos
      Style.HotTrack = False
      TabOrder = 8
      Width = 226
    end
    object edtCodigoMotorista: TcxDBMaskEdit
      Left = 880
      Top = 485
      Hint = 'C'#243'digo do motorista'
      DataBinding.DataField = 'COD_MOTORISTA'
      DataBinding.DataSource = dsManutencao
      Properties.Alignment.Horz = taRightJustify
      Properties.IgnoreMaskBlank = True
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d\d\d\d\d\d'
      Style.HotTrack = False
      TabOrder = 9
      Width = 54
    end
    object lcbMotorista: TcxDBLookupComboBox
      Left = 972
      Top = 485
      DataBinding.DataField = 'COD_MOTORISTA'
      DataBinding.DataSource = dsManutencao
      Properties.ListColumns = <>
      Style.HotTrack = False
      TabOrder = 10
      Width = 260
    end
    object lcbItemManutencao: TcxDBLookupComboBox
      Left = 144
      Top = 512
      Hint = 'Item de Manuten'#231#227'o'
      DataBinding.DataField = 'ID_ITEM'
      DataBinding.DataSource = dsManutencao
      Properties.KeyFieldNames = 'ID_ITEM'
      Properties.ListColumns = <
        item
          FieldName = 'DES_ITEM'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsItens
      Style.HotTrack = False
      TabOrder = 11
      Width = 323
    end
    object datManutencao: TcxDBDateEdit
      Left = 800
      Top = 512
      Hint = 'Data da manuten'#231#227'o'
      DataBinding.DataField = 'DAT_MANUTENCAO'
      DataBinding.DataSource = dsManutencao
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.HotTrack = False
      TabOrder = 12
      Width = 96
    end
    object edtKMManutencao: TcxDBCurrencyEdit
      Left = 1003
      Top = 512
      Hint = 'KM inicio da manuten'#231#227'o'
      DataBinding.DataField = 'QTD_KM_MANUTENCAO'
      DataBinding.DataSource = dsManutencao
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = ',0;-,0'
      Style.HotTrack = False
      TabOrder = 13
      Width = 101
    end
    object cxDBImageComboBox1: TcxDBImageComboBox
      Left = 1176
      Top = 512
      TabStop = False
      DataBinding.DataField = 'DOM_SITUACAO'
      DataBinding.DataSource = dsManutencao
      Properties.Images = dm.cxImageList1
      Properties.Items = <
        item
          Description = 'EM ANDAMENTO'
          ImageIndex = 50
          Value = 0
        end
        item
          Description = 'FINALIZADA'
          ImageIndex = 51
          Value = 1
        end
        item
          Description = 'CANCELADA'
          ImageIndex = 62
          Value = 2
        end>
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 14
      Width = 121
    end
    object edtObs: TcxDBMemo
      Left = 20
      Top = 559
      Style.HotTrack = False
      TabOrder = 15
      Height = 87
      Width = 809
    end
    object datPrevisao: TcxDBDateEdit
      Left = 920
      Top = 552
      Hint = 'Data da pr'#243'xima manuten'#231#227'o'
      DataBinding.DataField = 'DAT_PREVISAO'
      DataBinding.DataSource = dsManutencao
      Enabled = False
      Style.HotTrack = False
      TabOrder = 16
      Width = 93
    end
    object edtKmPrevisao: TcxDBCurrencyEdit
      Left = 1166
      Top = 552
      Hint = ' KM da pr'#243'xima manuten'#231#227'o'
      Enabled = False
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = ',0;-,0'
      Style.HotTrack = False
      TabOrder = 18
      Width = 121
    end
    object cxDBDateEdit1: TcxDBDateEdit
      Left = 920
      Top = 579
      DataBinding.DataField = 'DAT_LIBERACAO'
      DataBinding.DataSource = dsManutencao
      Enabled = False
      Style.HotTrack = False
      TabOrder = 17
      Width = 121
    end
    object edtcustoManutencao: TcxDBCurrencyEdit
      Left = 1166
      Top = 579
      Hint = 'Custo da manuten'#231#227'o'
      DataBinding.DataField = 'VAL_CUSTO_MANUTENCAO'
      DataBinding.DataSource = dsManutencao
      Enabled = False
      Style.HotTrack = False
      TabOrder = 19
      Width = 89
    end
    object cxButton2: TcxButton
      Left = 1192
      Top = 606
      Width = 95
      Height = 24
      Action = actGravarFinalizacao
      Enabled = False
      TabOrder = 20
    end
    object lcgRoot: TdxLayoutGroup
      AlignHorz = ahParentManaged
      AlignVert = avParentManaged
      CaptionOptions.Visible = False
      LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object lcgVisualizar: TdxLayoutGroup
      Parent = lcgRoot
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'Visualiza'#231#245'es'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object lciVisualizar: TdxLayoutItem
      Parent = lcgVisualizar
      AlignHorz = ahClient
      CaptionOptions.ImageIndex = 88
      CaptionOptions.Text = '&Visualizar'
      Control = cboVisualizar
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lcgPeriodo: TdxLayoutGroup
      Parent = lcgVisualizar
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object lciDataInicio: TdxLayoutItem
      Parent = lcgPeriodo
      AlignHorz = ahLeft
      CaptionOptions.ImageIndex = 7
      CaptionOptions.Text = 'Inicio'
      Control = datInicio
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lciFinal: TdxLayoutItem
      Parent = lcgPeriodo
      CaptionOptions.Text = 'a'
      Control = datFinal
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lciExecutar: TdxLayoutItem
      Parent = lcgPeriodo
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = cxButton1
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object liGrade: TdxLayoutItem
      Parent = lcgRoot
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.ImageIndex = 112
      CaptionOptions.Text = 'Manuten'#231#245'es'
      CaptionOptions.Layout = clTop
      Control = grdManutencao
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lcgDados: TdxLayoutGroup
      Parent = lcgRoot
      AlignHorz = ahClient
      CaptionOptions.ImageIndex = 45
      CaptionOptions.Text = 'Dados'
      ButtonOptions.Buttons = <>
      ButtonOptions.ShowExpandButton = True
      Index = 2
    end
    object lcgDados1: TdxLayoutGroup
      Parent = lcgDados
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object liID: TdxLayoutItem
      Parent = lcgDados1
      CaptionOptions.ImageIndex = 106
      CaptionOptions.Text = 'ID:'
      SizeOptions.AssignedValues = [sovSizableHorz, sovSizableVert]
      SizeOptions.SizableHorz = True
      SizeOptions.SizableVert = True
      Control = edtID
      ControlOptions.AutoControlAreaAlignment = False
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object liTipo: TdxLayoutItem
      Parent = lcgDados1
      AlignHorz = ahClient
      CaptionOptions.ImageIndex = 110
      CaptionOptions.Text = '&Tipo:'
      Control = cboTipoManutencao
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object liVeiculo: TdxLayoutItem
      Parent = lcgDados1
      AlignHorz = ahClient
      CaptionOptions.ImageIndex = 90
      CaptionOptions.Text = '&Ve'#237'culo:'
      Control = lcbPlaca
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object liDescricaoVeiculo: TdxLayoutItem
      Parent = lcgDados1
      AlignHorz = ahClient
      CaptionOptions.Text = 'Descri'#231#227'o do Ve'#237'culo'
      CaptionOptions.Visible = False
      Control = lcbVeiculo
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object liMotorista: TdxLayoutItem
      Parent = lcgDados1
      AlignHorz = ahClient
      CaptionOptions.ImageIndex = 17
      CaptionOptions.Text = '&Motorista:'
      Control = edtCodigoMotorista
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object liNomeMotorista: TdxLayoutItem
      Parent = lcgDados1
      AlignHorz = ahClient
      CaptionOptions.Text = 'Nome do Motorista:'
      CaptionOptions.Visible = False
      Control = lcbMotorista
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object lcgDados2: TdxLayoutGroup
      Parent = lcgDados
      CaptionOptions.ShowAccelChar = False
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object liItens: TdxLayoutItem
      Parent = lcgDados2
      AlignHorz = ahClient
      CaptionOptions.ImageIndex = 112
      CaptionOptions.Text = 'I&tem de Manuten'#231#227'o'
      Control = lcbItemManutencao
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object liDataManutencao: TdxLayoutItem
      Parent = lcgDados2
      CaptionOptions.ImageIndex = 7
      CaptionOptions.Text = 'D&ata'
      Control = datManutencao
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object liKMManutencao: TdxLayoutItem
      Parent = lcgDados2
      CaptionOptions.ImageIndex = 77
      CaptionOptions.Text = 'KM Manuten'#231#227'o'
      Control = edtKMManutencao
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object liSituacao: TdxLayoutItem
      Parent = lcgDados2
      CaptionOptions.ImageIndex = 0
      CaptionOptions.Text = 'Situa'#231#227'o'
      Control = cxDBImageComboBox1
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object lcgDados3: TdxLayoutGroup
      Parent = lcgDados
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 2
    end
    object liObs: TdxLayoutItem
      Parent = lcgDados3
      AlignHorz = ahClient
      CaptionOptions.ImageIndex = 108
      CaptionOptions.Text = 'O&bserva'#231#245'es'
      CaptionOptions.Layout = clTop
      Control = edtObs
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lcgDados4: TdxLayoutGroup
      Parent = lcgDados3
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      Enabled = False
      LayoutDirection = ldHorizontal
      Index = 1
    end
    object liDataPrevisao: TdxLayoutItem
      Parent = dxLayoutControl1Group1
      CaptionOptions.ImageIndex = 7
      CaptionOptions.Text = 'Previs'#227'o:'
      Control = datPrevisao
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object liKmPrevisao: TdxLayoutItem
      Parent = dxLayoutControl1Group2
      CaptionOptions.ImageIndex = 77
      CaptionOptions.Text = 'KM Previs'#227'o:'
      Control = edtKmPrevisao
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Group1: TdxLayoutAutoCreatedGroup
      Parent = lcgDados4
      Index = 0
      AutoCreated = True
    end
    object liLiberacao: TdxLayoutItem
      Parent = dxLayoutControl1Group1
      AlignHorz = ahLeft
      CaptionOptions.ImageIndex = 7
      CaptionOptions.Text = 'Libera'#231#227'o:'
      Control = cxDBDateEdit1
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object liCustoManutencao: TdxLayoutItem
      Parent = dxLayoutControl1Group2
      CaptionOptions.ImageIndex = 81
      CaptionOptions.Text = 'Custo Manuten'#231#227'o:'
      Control = edtcustoManutencao
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Group2: TdxLayoutAutoCreatedGroup
      Parent = lcgDados4
      Index = 1
      AutoCreated = True
    end
    object dxLayoutControl1Item1: TdxLayoutItem
      Parent = dxLayoutControl1Group2
      AlignHorz = ahRight
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      Control = cxButton2
      ControlOptions.ShowBorder = False
      Index = 2
    end
  end
  object tbItens: TdxMemData
    Indexes = <
      item
        FieldName = 'ID_INSUMO'
        SortOptions = []
      end>
    SortOptions = []
    Left = 880
    object tbItensID_ITEM: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_ITEM'
    end
    object tbItensDES_ITEM: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DES_ITEM'
      Size = 100
    end
    object tbItensID_INSUMO: TIntegerField
      DisplayLabel = 'Insumo Relacionado'
      FieldName = 'ID_INSUMO'
    end
    object tbItensDES_LOG: TMemoField
      DisplayLabel = 'LOG'
      FieldName = 'DES_LOG'
      BlobType = ftMemo
    end
  end
  object dsItens: TDataSource
    AutoEdit = False
    DataSet = tbItens
    Left = 840
  end
  object aclManutencao: TActionList
    Images = dm.cxImageList1
    Left = 704
    object actIncluir: TAction
      Tag = 1
      Category = 'Manuten'#231#227'o'
      Caption = '&Incluir'
      Hint = 'Incluir Manuten'#231#227'o'
      ImageIndex = 1
    end
    object actEditar: TAction
      Tag = 1
      Category = 'Manuten'#231#227'o'
      Caption = '&Editar'
      Hint = 'Editar dados'
      ImageIndex = 14
    end
    object actExcluir: TAction
      Category = 'Manuten'#231#227'o'
      Caption = 'E&xcluir'
      Hint = 'Excluir Manuten'#231#227'o'
      ImageIndex = 8
    end
    object actCancelar: TAction
      Tag = 1
      Category = 'Manuten'#231#227'o'
      Caption = 'Cancelar'
      Hint = 'Cancelar Opera'#231#227'o'
      ImageIndex = 6
    end
    object actGravar: TAction
      Tag = 1
      Category = 'Manuten'#231#227'o'
      Caption = 'Gravar'
      Hint = 'Gravar dados'
      ImageIndex = 9
    end
    object actCancelarViagem: TAction
      Category = 'Manuten'#231#227'o'
      Caption = 'Cancelar Viagem'
      Hint = 'Cancelar a Manuten'#231#227'o'
      ImageIndex = 62
    end
    object actFinalizar: TAction
      Category = 'Manuten'#231#227'o'
      Caption = '&Finalizar'
      Hint = 'Finalizar a Manuten'#231#227'o'
      ImageIndex = 51
    end
    object actExportar: TAction
      Tag = 1
      Category = 'Manuten'#231#227'o'
      Caption = 'Ex&portar'
      Hint = 'Exportar dados da grade'
      ImageIndex = 29
    end
    object actFechar: TAction
      Tag = 1
      Category = 'Manuten'#231#227'o'
      Caption = 'Fechar'
      Hint = 'Fechar a tela'
      ImageIndex = 103
    end
    object actLocalizar: TAction
      Tag = 1
      Category = 'Manuten'#231#227'o'
      Caption = 'Localizar'
      Hint = 'Localizar'
      ImageIndex = 11
    end
    object actPeriodo: TAction
      Category = 'Manuten'#231#227'o'
      Caption = 'Executar'
      Hint = 'Executar pesquisa por per'#237'odo'
      ImageIndex = 27
    end
    object actGravarFinalizacao: TAction
      Category = 'Manuten'#231#227'o'
      Caption = 'Gravar'
      Hint = 'Gravar finaliza'#231#227'o'
      ImageIndex = 9
    end
  end
  object tbVeiculos: TdxMemData
    Indexes = <
      item
        FieldName = 'DES_PLACA'
        SortOptions = []
      end>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F230000000400000003000C00434F445F5645494355
      4C4F000800000014000D004445535F5449504F5F444F43002800000014000900
      4E554D5F434E504A008C000000140011004E4F4D5F50524F5052494554415249
      4F000400000009000F004441545F4E415343494D454E544F00A0000000140008
      004E4F4D5F4D414500A0000000140008004E4F4D5F5041490032000000140007
      004E554D5F524700040000001400060055465F5247000400000009000F004441
      545F454D495353414F5F5247000400000014000C0055465F454E44455245434F
      008C00000014000B004E4F4D5F43494441444500AA00000014000D004445535F
      454E44455245434F0012000000140008004E554D5F434550008C00000014000B
      004445535F42414952524F001E00000014000F004E554D5F54454C45464F4E45
      5F31005000000014000F004445535F54454C45464F4E455F31001E0000001400
      0F004E554D5F54454C45464F4E455F32005000000014000F004445535F54454C
      45464F4E455F32000400000003000F00434F445F454E5452454741444F520064
      00000014000A004445535F4D41524341006400000014000B004445535F4D4F44
      454C4F000E00000014000A004445535F504C4143410004000000140009005546
      5F504C414341008C000000140011004E4F4D5F4349444144455F504C41434100
      28000000140009004445535F5449504F006400000014000C004E554D5F434841
      535349530008000000140008004445535F414E4F002800000014000800444553
      5F434F52003200000014000C004E554D5F52454E4156414E0008000000140013
      00414E4F5F45584552434943494F5F434C5256000200000014001100444F4D5F
      524153545245414D454E544F000200000014001200444F4D5F41424153544543
      494D454E544F002800000014000D004E4F4D5F4558454355544F520008000000
      0B000F004441545F4D414E5554454E43414F00}
    SortOptions = []
    Left = 960
    object tbVeiculosCOD_VEICULO: TIntegerField
      FieldName = 'COD_VEICULO'
    end
    object tbVeiculosDES_TIPO_DOC: TWideStringField
      FieldName = 'DES_TIPO_DOC'
      Size = 8
    end
    object tbVeiculosNUM_CNPJ: TWideStringField
      FieldName = 'NUM_CNPJ'
      Size = 40
    end
    object tbVeiculosNOM_PROPRIETARIO: TWideStringField
      FieldName = 'NOM_PROPRIETARIO'
      Size = 140
    end
    object tbVeiculosDAT_NASCIMENTO: TDateField
      FieldName = 'DAT_NASCIMENTO'
    end
    object tbVeiculosNOM_MAE: TWideStringField
      FieldName = 'NOM_MAE'
      Size = 160
    end
    object tbVeiculosNOM_PAI: TWideStringField
      FieldName = 'NOM_PAI'
      Size = 160
    end
    object tbVeiculosNUM_RG: TWideStringField
      FieldName = 'NUM_RG'
      Size = 50
    end
    object tbVeiculosUF_RG: TWideStringField
      FieldName = 'UF_RG'
      Size = 4
    end
    object tbVeiculosDAT_EMISSAO_RG: TDateField
      FieldName = 'DAT_EMISSAO_RG'
    end
    object tbVeiculosUF_ENDERECO: TWideStringField
      FieldName = 'UF_ENDERECO'
      Size = 4
    end
    object tbVeiculosNOM_CIDADE: TWideStringField
      FieldName = 'NOM_CIDADE'
      Size = 140
    end
    object tbVeiculosDES_ENDERECO: TWideStringField
      FieldName = 'DES_ENDERECO'
      Size = 170
    end
    object tbVeiculosNUM_CEP: TWideStringField
      FieldName = 'NUM_CEP'
      Size = 18
    end
    object tbVeiculosDES_BAIRRO: TWideStringField
      FieldName = 'DES_BAIRRO'
      Size = 140
    end
    object tbVeiculosNUM_TELEFONE_1: TWideStringField
      FieldName = 'NUM_TELEFONE_1'
      Size = 30
    end
    object tbVeiculosDES_TELEFONE_1: TWideStringField
      FieldName = 'DES_TELEFONE_1'
      Size = 80
    end
    object tbVeiculosNUM_TELEFONE_2: TWideStringField
      FieldName = 'NUM_TELEFONE_2'
      Size = 30
    end
    object tbVeiculosDES_TELEFONE_2: TWideStringField
      FieldName = 'DES_TELEFONE_2'
      Size = 80
    end
    object tbVeiculosCOD_ENTREGADOR: TIntegerField
      FieldName = 'COD_ENTREGADOR'
    end
    object tbVeiculosDES_MARCA: TWideStringField
      FieldName = 'DES_MARCA'
      Size = 100
    end
    object tbVeiculosDES_MODELO: TWideStringField
      FieldName = 'DES_MODELO'
      Size = 100
    end
    object tbVeiculosDES_PLACA: TWideStringField
      FieldName = 'DES_PLACA'
      Size = 14
    end
    object tbVeiculosUF_PLACA: TWideStringField
      FieldName = 'UF_PLACA'
      Size = 4
    end
    object tbVeiculosNOM_CIDADE_PLACA: TWideStringField
      FieldName = 'NOM_CIDADE_PLACA'
      Size = 140
    end
    object tbVeiculosDES_TIPO: TWideStringField
      FieldName = 'DES_TIPO'
      Size = 40
    end
    object tbVeiculosNUM_CHASSIS: TWideStringField
      FieldName = 'NUM_CHASSIS'
      Size = 100
    end
    object tbVeiculosDES_ANO: TWideStringField
      FieldName = 'DES_ANO'
      Size = 8
    end
    object tbVeiculosDES_COR: TWideStringField
      FieldName = 'DES_COR'
      Size = 40
    end
    object tbVeiculosNUM_RENAVAN: TWideStringField
      FieldName = 'NUM_RENAVAN'
      Size = 50
    end
    object tbVeiculosANO_EXERCICIO_CLRV: TWideStringField
      FieldName = 'ANO_EXERCICIO_CLRV'
      Size = 8
    end
    object tbVeiculosDOM_RASTREAMENTO: TWideStringField
      FieldName = 'DOM_RASTREAMENTO'
      Size = 2
    end
    object tbVeiculosDOM_ABASTECIMENTO: TWideStringField
      FieldName = 'DOM_ABASTECIMENTO'
      Size = 2
    end
    object tbVeiculosNOM_EXECUTOR: TWideStringField
      FieldName = 'NOM_EXECUTOR'
      Size = 40
    end
    object tbVeiculosDAT_MANUTENCAO: TDateTimeField
      FieldName = 'DAT_MANUTENCAO'
    end
  end
  object dsVeiculos: TDataSource
    AutoEdit = False
    DataSet = tbVeiculos
    Left = 920
  end
  object tbManutencao: TdxMemData
    Indexes = <>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F100000000400000003000E0049445F4D414E555445
      4E43414F0032000000140009004445535F5449504F000400000003000C00434F
      445F56454943554C4F000400000003000E00434F445F4D4F544F524953544100
      040000000300080049445F4954454D000400000009000F004441545F4D414E55
      54454E43414F0008000000060012005154445F4B4D5F4D414E5554454E43414F
      000400000009000D004441545F505245564953414F0008000000060010005154
      445F4B4D5F505245564953414F00080000000600150056414C5F435553544F5F
      4D414E5554454E43414F000400000009000E004441545F4C494245524143414F
      000400000003000D00444F4D5F534954554143414F0000000000190008004445
      535F4F4253000001000014000C004445535F4152515549564F00040000000300
      0B00434F445F43435553544F0000000000190008004445535F4C4F4700}
    SortOptions = []
    Left = 784
    object tbManutencaoID_MANUTENCAO: TIntegerField
      FieldName = 'ID_MANUTENCAO'
    end
    object tbManutencaoDES_TIPO: TWideStringField
      FieldName = 'DES_TIPO'
      Size = 50
    end
    object tbManutencaoCOD_VEICULO: TIntegerField
      FieldName = 'COD_VEICULO'
    end
    object tbManutencaoCOD_MOTORISTA: TIntegerField
      FieldName = 'COD_MOTORISTA'
    end
    object tbManutencaoID_ITEM: TIntegerField
      FieldName = 'ID_ITEM'
    end
    object tbManutencaoDAT_MANUTENCAO: TDateField
      FieldName = 'DAT_MANUTENCAO'
    end
    object tbManutencaoQTD_KM_MANUTENCAO: TFloatField
      FieldName = 'QTD_KM_MANUTENCAO'
    end
    object tbManutencaoDAT_PREVISAO: TDateField
      FieldName = 'DAT_PREVISAO'
    end
    object tbManutencaoQTD_KM_PREVISAO: TFloatField
      FieldName = 'QTD_KM_PREVISAO'
    end
    object tbManutencaoVAL_CUSTO_MANUTENCAO: TFloatField
      FieldName = 'VAL_CUSTO_MANUTENCAO'
    end
    object tbManutencaoDAT_LIBERACAO: TDateField
      FieldName = 'DAT_LIBERACAO'
    end
    object tbManutencaoDOM_SITUACAO: TIntegerField
      FieldName = 'DOM_SITUACAO'
    end
    object tbManutencaoDES_OBS: TWideMemoField
      FieldName = 'DES_OBS'
      BlobType = ftWideMemo
    end
    object tbManutencaoDES_ARQUIVO: TWideStringField
      FieldName = 'DES_ARQUIVO'
      Size = 256
    end
    object tbManutencaoCOD_CCUSTO: TIntegerField
      FieldName = 'COD_CCUSTO'
    end
    object tbManutencaoDES_LOG: TWideMemoField
      FieldName = 'DES_LOG'
      BlobType = ftWideMemo
    end
  end
  object dsManutencao: TDataSource
    AutoEdit = False
    DataSet = tbManutencao
    Left = 744
  end
  object dsMotoristas: TDataSource
    AutoEdit = False
    DataSet = tbMotoristas
    Left = 1000
  end
  object tbMotoristas: TdxMemData
    Active = True
    Indexes = <>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F360000000400000003000D00434F445F4341444153
      54524F000200000014001000444F4D5F46554E43494F4E4152494F0004000000
      03000F00434F445F454E5452454741444F52000800000014000D004445535F54
      49504F5F444F43008C000000140011004445535F52415A414F5F534F4349414C
      00A000000014000D004E4F4D5F46414E54415349410028000000140009004E55
      4D5F434E504A0028000000140007004E554D5F494500080000000B000F004441
      545F4E415343494D454E544F00040000001400060055465F524700080000000B
      000F004441545F454D495353414F5F5247000400000014000E0055465F4E4153
      43494D454E544F0090000000140016004E4F4D5F4349444144455F4E41534349
      4D454E544F0090000000140008004E4F4D5F5041490090000000140008004E4F
      4D5F4D41450028000000140009004E554D5F494553540028000000140007004E
      554D5F494D001400000014000900434F445F434E414500040000000300080043
      4F445F435254001E000000140008004E554D5F434E48001E000000140011004E
      554D5F524547495354524F5F434E480004000000140012004445535F43415445
      474F5249415F434E480004000000090011004441545F56414C49444144455F43
      4E4800040000001400070055465F434E4800080000000B0012004441545F315F
      484142494C49544143414F00C800000014000B004445535F504147494E410004
      00000003000B00434F445F4147454E5445000400000003000B00434F445F5354
      41545553000000000019000F004445535F4F42534552564143414F0004000000
      09000D004441545F434144415354524F000400000003000C00434F445F555355
      4152494F000800000006000A0056414C5F564552424100080000000600160056
      414C5F56455242415F434F4D425553544956454C002800000014000F00444553
      5F5449504F5F434F4E5441000800000014000A00434F445F42414E434F001400
      000014000C00434F445F4147454E434941002800000014000A004E554D5F434F
      4E5441008C00000014000F004E4F4D5F4641564F52454349444F002800000014
      0018004E554D5F4350465F434E504A5F4641564F52454349444F003C00000014
      0014004445535F464F524D415F504147414D454E544F00040000000300110043
      4F445F43454E54524F5F435553544F000200000014001100444F4D5F56495449
      4D415F524F55424F0004000000030011005154445F564954494D415F524F5542
      4F000200000014000E00444F4D5F41434944454E544553000400000003000E00
      5154445F41434944454E544553000200000014001700444F4D5F5452414E5350
      4F5254455F454D5052455341000400000003000F005154445F5452414E53504F
      525445000200000014000700444F4D5F47560004000000090007004441545F47
      56003C00000014000F004E4F4D5F455845435554414E544500080000000B000E
      004441545F414C5445524143414F008C00000014000A004445535F4348415645
      000400000003000A00434F445F475255504F003C00000014000C00434F445F52
      4F544549524F00}
    SortOptions = []
    Left = 1032
    object tbMotoristasCOD_CADASTRO: TIntegerField
      FieldName = 'COD_CADASTRO'
    end
    object tbMotoristasDOM_FUNCIONARIO: TWideStringField
      FieldName = 'DOM_FUNCIONARIO'
      Size = 2
    end
    object tbMotoristasCOD_ENTREGADOR: TIntegerField
      FieldName = 'COD_ENTREGADOR'
    end
    object tbMotoristasDES_TIPO_DOC: TWideStringField
      FieldName = 'DES_TIPO_DOC'
      Size = 8
    end
    object tbMotoristasDES_RAZAO_SOCIAL: TWideStringField
      FieldName = 'DES_RAZAO_SOCIAL'
      Size = 140
    end
    object tbMotoristasNOM_FANTASIA: TWideStringField
      FieldName = 'NOM_FANTASIA'
      Size = 160
    end
    object tbMotoristasNUM_CNPJ: TWideStringField
      FieldName = 'NUM_CNPJ'
      Size = 40
    end
    object tbMotoristasNUM_IE: TWideStringField
      FieldName = 'NUM_IE'
      Size = 40
    end
    object tbMotoristasDAT_NASCIMENTO: TDateTimeField
      FieldName = 'DAT_NASCIMENTO'
    end
    object tbMotoristasUF_RG: TWideStringField
      FieldName = 'UF_RG'
      Size = 4
    end
    object tbMotoristasDAT_EMISSAO_RG: TDateTimeField
      FieldName = 'DAT_EMISSAO_RG'
    end
    object tbMotoristasUF_NASCIMENTO: TWideStringField
      FieldName = 'UF_NASCIMENTO'
      Size = 4
    end
    object tbMotoristasNOM_CIDADE_NASCIMENTO: TWideStringField
      FieldName = 'NOM_CIDADE_NASCIMENTO'
      Size = 144
    end
    object tbMotoristasNOM_PAI: TWideStringField
      FieldName = 'NOM_PAI'
      Size = 144
    end
    object tbMotoristasNOM_MAE: TWideStringField
      FieldName = 'NOM_MAE'
      Size = 144
    end
    object tbMotoristasNUM_IEST: TWideStringField
      FieldName = 'NUM_IEST'
      Size = 40
    end
    object tbMotoristasNUM_IM: TWideStringField
      FieldName = 'NUM_IM'
      Size = 40
    end
    object tbMotoristasCOD_CNAE: TWideStringField
      FieldName = 'COD_CNAE'
    end
    object tbMotoristasCOD_CRT: TIntegerField
      FieldName = 'COD_CRT'
    end
    object tbMotoristasNUM_CNH: TWideStringField
      FieldName = 'NUM_CNH'
      Size = 30
    end
    object tbMotoristasNUM_REGISTRO_CNH: TWideStringField
      FieldName = 'NUM_REGISTRO_CNH'
      Size = 30
    end
    object tbMotoristasDES_CATEGORIA_CNH: TWideStringField
      FieldName = 'DES_CATEGORIA_CNH'
      Size = 4
    end
    object tbMotoristasDAT_VALIDADE_CNH: TDateField
      FieldName = 'DAT_VALIDADE_CNH'
    end
    object tbMotoristasUF_CNH: TWideStringField
      FieldName = 'UF_CNH'
      Size = 4
    end
    object tbMotoristasDAT_1_HABILITACAO: TDateTimeField
      FieldName = 'DAT_1_HABILITACAO'
    end
    object tbMotoristasDES_PAGINA: TWideStringField
      FieldName = 'DES_PAGINA'
      Size = 200
    end
    object tbMotoristasCOD_AGENTE: TIntegerField
      FieldName = 'COD_AGENTE'
    end
    object tbMotoristasCOD_STATUS: TIntegerField
      FieldName = 'COD_STATUS'
    end
    object tbMotoristasDES_OBSERVACAO: TWideMemoField
      FieldName = 'DES_OBSERVACAO'
      BlobType = ftWideMemo
    end
    object tbMotoristasDAT_CADASTRO: TDateField
      FieldName = 'DAT_CADASTRO'
    end
    object tbMotoristasCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
    object tbMotoristasVAL_VERBA: TFloatField
      FieldName = 'VAL_VERBA'
    end
    object tbMotoristasVAL_VERBA_COMBUSTIVEL: TFloatField
      FieldName = 'VAL_VERBA_COMBUSTIVEL'
    end
    object tbMotoristasDES_TIPO_CONTA: TWideStringField
      FieldName = 'DES_TIPO_CONTA'
      Size = 40
    end
    object tbMotoristasCOD_BANCO: TWideStringField
      FieldName = 'COD_BANCO'
      Size = 8
    end
    object tbMotoristasCOD_AGENCIA: TWideStringField
      FieldName = 'COD_AGENCIA'
    end
    object tbMotoristasNUM_CONTA: TWideStringField
      FieldName = 'NUM_CONTA'
      Size = 40
    end
    object tbMotoristasNOM_FAVORECIDO: TWideStringField
      FieldName = 'NOM_FAVORECIDO'
      Size = 140
    end
    object tbMotoristasNUM_CPF_CNPJ_FAVORECIDO: TWideStringField
      FieldName = 'NUM_CPF_CNPJ_FAVORECIDO'
      Size = 40
    end
    object tbMotoristasDES_FORMA_PAGAMENTO: TWideStringField
      FieldName = 'DES_FORMA_PAGAMENTO'
      Size = 60
    end
    object tbMotoristasCOD_CENTRO_CUSTO: TIntegerField
      FieldName = 'COD_CENTRO_CUSTO'
    end
    object tbMotoristasDOM_VITIMA_ROUBO: TWideStringField
      FieldName = 'DOM_VITIMA_ROUBO'
      Size = 2
    end
    object tbMotoristasQTD_VITIMA_ROUBO: TIntegerField
      FieldName = 'QTD_VITIMA_ROUBO'
    end
    object tbMotoristasDOM_ACIDENTES: TWideStringField
      FieldName = 'DOM_ACIDENTES'
      Size = 2
    end
    object tbMotoristasQTD_ACIDENTES: TIntegerField
      FieldName = 'QTD_ACIDENTES'
    end
    object tbMotoristasDOM_TRANSPORTE_EMPRESA: TWideStringField
      FieldName = 'DOM_TRANSPORTE_EMPRESA'
      Size = 2
    end
    object tbMotoristasQTD_TRANSPORTE: TIntegerField
      FieldName = 'QTD_TRANSPORTE'
    end
    object tbMotoristasDOM_GV: TWideStringField
      FieldName = 'DOM_GV'
      Size = 2
    end
    object tbMotoristasDAT_GV: TDateField
      FieldName = 'DAT_GV'
    end
    object tbMotoristasNOM_EXECUTANTE: TWideStringField
      FieldName = 'NOM_EXECUTANTE'
      Size = 60
    end
    object tbMotoristasDAT_ALTERACAO: TDateTimeField
      FieldName = 'DAT_ALTERACAO'
    end
    object tbMotoristasDES_CHAVE: TWideStringField
      FieldName = 'DES_CHAVE'
      Size = 140
    end
    object tbMotoristasCOD_GRUPO: TIntegerField
      FieldName = 'COD_GRUPO'
    end
    object tbMotoristasCOD_ROTEIRO: TWideStringField
      FieldName = 'COD_ROTEIRO'
      Size = 60
    end
  end
end
