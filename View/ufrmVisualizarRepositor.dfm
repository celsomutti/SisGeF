object frmVisualizarRepositor: TfrmVisualizarRepositor
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Repositor'
  ClientHeight = 250
  ClientWidth = 492
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 13
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 492
    Height = 250
    Align = alClient
    TabOrder = 0
    LayoutLookAndFeel = dm.dxLayoutCxLookAndFeel1
    object cxDBCodigo: TcxDBTextEdit
      Left = 10
      Top = 28
      Hint = 'C'#243'digo do Repositor/Entregador'
      DataBinding.DataField = 'COD_ENTREGADOR'
      DataBinding.DataSource = dsRepositor
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 0
      Width = 63
    end
    object cxDBNomeEntregador: TcxDBLookupComboBox
      Left = 79
      Top = 28
      Hint = 'Nome do Repositor/Entregador'
      DataBinding.DataField = 'COD_ENTREGADOR'
      DataBinding.DataSource = dsRepositor
      Properties.KeyFieldNames = 'COD_CADASTRO'
      Properties.ListColumns = <
        item
          FieldName = 'DES_RAZAO_SOCIAL'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsListaEntregadores
      Style.HotTrack = False
      TabOrder = 1
      Width = 402
    end
    object cxDBRoteiroAntigo: TcxDBTextEdit
      Left = 143
      Top = 73
      Hint = 'C'#243'digo do Roteiro Antigo'
      DataBinding.DataField = 'COD_ROTEIRO_ANTIGO'
      DataBinding.DataSource = dsRepositor
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 3
      Width = 185
    end
    object cxDBRoteiroNovo: TcxDBTextEdit
      Left = 334
      Top = 73
      Hint = 'C'#243'digo do Roteiro Novo'
      DataBinding.DataField = 'COD_ROTEIRO_NOVO'
      DataBinding.DataSource = dsRepositor
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 4
      Width = 145
    end
    object cxDBObs: TcxDBMemo
      Left = 10
      Top = 118
      DataBinding.DataField = 'DES_OBSERVACOES'
      DataBinding.DataSource = dsRepositor
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 5
      Height = 89
      Width = 185
    end
    object cxButton1: TcxButton
      Left = 406
      Top = 213
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Action = actSair
      Cancel = True
      TabOrder = 6
    end
    object cxDBData: TcxDBDateEdit
      Left = 10
      Top = 73
      Hint = 'Data da Opera'#231#227'o do Repositor'
      DataBinding.DataField = 'DAT_OPERACAO'
      DataBinding.DataSource = dsRepositor
      Properties.ReadOnly = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.HotTrack = False
      TabOrder = 2
      Width = 127
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
      Parent = dxLayoutControl1Group1
      CaptionOptions.Text = 'C'#243'digo'
      CaptionOptions.Layout = clTop
      Control = cxDBCodigo
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item2: TdxLayoutItem
      Parent = dxLayoutControl1Group1
      CaptionOptions.Text = 'Nome do Repositor/Entregador'
      CaptionOptions.Layout = clTop
      Control = cxDBNomeEntregador
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Group1: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutControl1Group_Root
      LayoutDirection = ldHorizontal
      Index = 0
      AutoCreated = True
    end
    object dxLayoutControl1Item4: TdxLayoutItem
      Parent = dxLayoutControl1Group2
      CaptionOptions.Text = 'Roteiro Antigo'
      CaptionOptions.Layout = clTop
      Control = cxDBRoteiroAntigo
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Group2: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutControl1Group_Root
      LayoutDirection = ldHorizontal
      Index = 1
      AutoCreated = True
    end
    object dxLayoutControl1Item5: TdxLayoutItem
      Parent = dxLayoutControl1Group2
      CaptionOptions.Text = 'Roteiro Novo'
      CaptionOptions.Layout = clTop
      Control = cxDBRoteiroNovo
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutControl1Item7: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      CaptionOptions.Text = 'Observa'#231#245'es'
      CaptionOptions.Layout = clTop
      Control = cxDBObs
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutControl1Item6: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahRight
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = cxButton1
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutControl1Item3: TdxLayoutItem
      Parent = dxLayoutControl1Group2
      CaptionOptions.Text = 'Data da Opera'#231#227'o'
      CaptionOptions.Layout = clTop
      Control = cxDBData
      ControlOptions.ShowBorder = False
      Index = 0
    end
  end
  object aclVisualizarRepositor: TActionList
    Images = dm.cxImageList1
    Left = 392
    object actSair: TAction
      Caption = 'Sair'
      Hint = 'Saitr da Tela'
      ImageIndex = 10
      OnExecute = actSairExecute
    end
  end
  object dsRepositor: TDataSource
    AutoEdit = False
    DataSet = dm.qryGetObject
    Left = 424
  end
  object dsListaEntregadores: TDataSource
    AutoEdit = False
    DataSet = dm.tbListaEntregadores
    Left = 456
  end
end
