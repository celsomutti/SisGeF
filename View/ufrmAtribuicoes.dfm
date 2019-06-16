object frmAtribuicoes: TfrmAtribuicoes
  Left = 301
  Top = 186
  Caption = 'Importa'#231#227'o e Tratativa de Atribui'#231#245'es'
  ClientHeight = 325
  ClientWidth = 867
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001001010000001001800680300001600000028000000100000002000
    0000010018000000000040030000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000FF9C00FF9C00000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    00FFDE7BFF9C00000000000000000000000000000000000000000000AD7B0000
    0000000000000000000000000000000000FFDE7BFF9C00000000000000000000
    000000000000000000000000FF9C29AD7B000000000000000000000000000000
    00FFDE7BFF9C00000000000000000000FF9C00FF9C00FF9C00FF9C00FFBD52FF
    9C29AD7B00000000000000000000000000FFDE7BFF9C00000000000000000000
    FFBD52FFBD52FFBD52FFBD52FFBD52FFBD52FF9C29AD7B000000000000000000
    00FFDE7BFF9C00000000000000000000FFBD52FFBD52FFBD52FFBD52FFBD52FF
    BD52FFBD52FF9C29FFDE7B000000000000FFDE7BFF9C00000000000000000000
    FFBD52FFBD52FFBD52FFBD52FFBD52FFBD52FFBD52FFDE7B0000000000000000
    00FFDE7BFF9C00000000000000000000FFDE7BFFDE7BFFDE7BFFDE7BFFBD52FF
    BD52FFDE7B000000000000000000000000FFDE7BFF9C00000000000000000000
    000000000000000000000000FFBD52FFDE7B0000000000000000000000000000
    00FFDE7BFF9C00000000000000000000000000000000000000000000FFDE7B00
    0000000000000000000000000000000000FFDE7BFFDE7B000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000FFFF
    FFFFFFFFFFFF0FBFFFFF0F9FFFFF0F8FFFFF0807FFFF0803FFFF0801FFFF0800
    FFFF0801FFFF0803FFFF0807FFFF0F8FFFFF0F9FFFFF0FBFFFFFFFFFFFFF}
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxPageControl1: TcxPageControl
    Left = 0
    Top = 0
    Width = 867
    Height = 325
    Align = alClient
    TabOrder = 0
    Properties.ActivePage = cxTabSheet1
    Properties.CustomButtons.Buttons = <>
    OnPageChanging = cxPageControl1PageChanging
    ClientRectBottom = 325
    ClientRectRight = 867
    ClientRectTop = 24
    object cxTabSheet1: TcxTabSheet
      Caption = 'Importa'#231#227'o'
      ImageIndex = 0
      ExplicitLeft = 2
      ExplicitTop = 25
      ExplicitWidth = 859
      ExplicitHeight = 294
      DesignSize = (
        867
        301)
      object cxLabel1: TcxLabel
        Left = 8
        Top = 16
        Caption = 'Arquivo:'
        Transparent = True
      end
      object cxLabel6: TcxLabel
        Left = 8
        Top = 64
        Caption = 'Progresso:'
        Transparent = True
      end
      object cxArquivo: TcxButtonEdit
        Left = 8
        Top = 32
        Hint = 'Informe o nome do Arquivo de Entregas a ser Inportado.'
        Anchors = [akLeft, akTop, akRight]
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
        TabOrder = 2
        ExplicitWidth = 844
        Width = 852
      end
      object cxButton2: TcxButton
        Left = 8
        Top = 269
        Width = 105
        Height = 25
        Action = actImportarAtribuicaoImportar
        Anchors = [akLeft, akBottom]
        OptionsImage.Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000041204230D3E0F7D17691BDB196E1DF3196B1DF31761
          1BDB0D370F7D040F042300000000000000000000000000000000000000000000
          000000000000092D0B5318761CE642A052FF87CA9AFF9BD3ABFF9BD2ABFF83C7
          96FF3D974CFF17631BE609240A53000000000000000000000000000000000000
          0000092F0E531A841FF46DBE83FFA8DBB5FF87CC98FF66BC7DFF64BA7CFF86CB
          98FFA5D9B4FF66B77DFF19671CF409250A530000000000000000000000000415
          072219872AE572C287FFA8DBB2FF60BC77FF5CBA73FF59B870FF59B56FFF58B5
          6FFF5BB774FFA5D9B3FF69B87FFF17651BE5040F042200000000000000000F51
          1E7E4CB064FFAADDB4FF64C179FF5FBE71FF75C585FFD4ECD9FF8ACD99FF56B6
          6CFF58B56EFF5CB774FFA6DAB4FF419B4EFF0D3B0F7E00000000000000001B91
          39DB91D29FFF8DD49AFF64C374FF79C987FFF2FAF4FFFFFFFFFFFDFEFDFF86CB
          96FF57B76DFF5BB972FF85CC97FF87C79AFF17671BDB00000000000000001EA7
          40F6A6DCAFFF70CA7FFF73CA80FFF0F9F1FFFFFFFFFFEBF7EDFFFFFFFFFFFBFD
          FCFF88CD96FF5BB971FF67BE7DFFA0D7AFFF1A761DF6000000000000000025AE
          48F6A7DDB1FF72CC80FF66C773FFB0E1B7FFD2EED6FF63C170FFB8E3BFFFFFFF
          FFFFFBFDFCFF8CD099FF69C17EFFA1D7AEFF1A7B1DF6000000000000000027A1
          48DB95D7A1FF91D79BFF69C976FF64C66FFF61C46EFF61C36FFF61C26FFFB9E4
          C0FFFFFFFFFFE3F4E6FF8BD199FF8BCE9DFF18751BDB00000000000000001A5E
          2C7E57BF70FFAFE1B7FF6DCC7AFF68C872FF65C770FF63C56EFF62C46EFF63C4
          71FFB6E3BEFF6FC77EFFACDFB5FF48A95EFF0E47137E0000000000000000081A
          0C222FAB4CE57FCE90FFAEE1B5FF6DCC7AFF6ACA76FF68C872FF68C874FF68C8
          75FF6BC979FFACDFB4FF76C489FF198728E50414062200000000000000000000
          000013401F5332B851F47FCE90FFAFE1B7FF92D89DFF77CE83FF77CE83FF92D8
          9DFFAEE1B5FF78C88BFF1C9630F4093312530000000000000000000000000000
          00000000000014411F5331AF50E659C274FF96D7A3FFA5DCAEFFA5DCAEFF95D6
          A1FF50B96AFF1C9A3CE60A371553000000000000000000000000000000000000
          00000000000000000000091C0D231D612E7D31A74EDB2FB450F32BB24EF3259F
          46DB155A287D05190B2300000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        TabOrder = 3
        ExplicitTop = 262
      end
      object cxProgressBar1: TcxProgressBar
        Left = 8
        Top = 80
        Anchors = [akLeft, akTop, akRight]
        Properties.ShowTextStyle = cxtsText
        TabOrder = 4
        ExplicitWidth = 844
        Width = 852
      end
      object cxLabel7: TcxLabel
        Left = 8
        Top = 112
        Caption = 'Log da Importa'#231#227'o:'
        Transparent = True
      end
      object cxButton3: TcxButton
        Left = 755
        Top = 269
        Width = 105
        Height = 25
        Action = actImportaAtribuicaoSair
        Anchors = [akRight, akBottom]
        OptionsImage.Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000309
          0D16061522390824396209304E8808395DA4135B90FC0B5185ED999999FF7171
          71FF545454FF515151FF4F4F4FFF4C4C4CFF4A4A4AFF474747FF454545FF2567
          9DFF3274A8FF3D7CAFFF4784B5FF4E8ABAFF3E7EADFF0B5083EA000000000000
          0000585858FFA2A2A2FFA2A2A2FFA3A3A3FFA4A4A4FFA4A4A4FFA5A5A5FF2F6F
          A5FF78ABD2FF78ABD3FF73A7D1FF69A0CDFF407FAEFF0E5285EA000000000000
          00005C5C5CFFA1A1A1FF3C7340FFA0A1A1FFA3A3A3FFA3A3A3FFA4A4A4FF3674
          AAFF7DAFD4FF5B9AC9FF5495C7FF5896C8FF4180AEFF115488EA000000000000
          0000606060FFA0A0A0FF3D7641FF367139FFA2A2A2FFA2A2A2FFA3A3A3FF3D79
          B0FF82B3D7FF629FCCFF5A9AC9FF5E9BCAFF4381AFFF17588BEA37823EFF347E
          3BFF317937FF2E7534FF499150FF468F4CFF39733DFFA1A1A1FFA2A2A2FF457E
          B4FF88B7D9FF67A3CFFF619ECCFF639FCCFF4583B1FF1C5C8FEA3B8742FF89CB
          92FF84C88DFF80C688FF7BC383FF77C17FFF478F4DFF3B743FFFA1A1A1FF4C84
          BAFF8DBBDBFF6EA8D1FF66A6D1FF5FB4DFFF4785B1FF226094EA3E8B46FF8FCE
          99FF7DC687FF78C381FF73C07CFF74C07CFF79C281FF49904FFF547F57FF5489
          BFFF94BFDDFF75ADD4FF63B8E1FF4BD4FFFF428BB8FF286598EA41904AFF94D2
          9FFF91D09AFF8DCD96FF89CB92FF84C88DFF519858FF417C46FF9F9F9FFF5A8E
          C4FF98C3E0FF7CB3D7FF74AFD6FF5EC4EDFF4B88B3FF306A9DEA44944DFF4291
          4BFF3F8D48FF3D8945FF5DA465FF5AA061FF45834BFF9E9E9EFF9E9E9EFF6092
          C9FF9EC7E2FF83B8DAFF7DB4D7FF7EB3D7FF4F89B4FF366FA2EA000000000000
          0000777777FF9A9A9AFF3D8A45FF498A4FFF9C9C9CFF9D9D9DFF9D9D9DFF6696
          CCFFA2CBE3FF89BDDCFF83B9DAFF84B9DAFF518BB5FF3D74A7EA000000000000
          00007A7A7AFF999999FF529159FF999A99FF9B9B9BFF9C9C9CFF9C9C9CFF6C9A
          D0FFA7CEE5FF8FC1DFFF89BDDCFF8BBDDCFF538DB6FF4579ADEA000000000000
          00007D7D7DFF999999FF999999FF9A9A9AFF9A9A9AFF9B9B9BFF9B9B9BFF6F9D
          D3FFAAD1E7FFABD1E7FF98C7E1FF91C2DEFF568FB7FF4B7EB1EA000000000000
          0000808080FF7E7E7EFF7C7C7CFF7A7A7AFF777777FF757575FF727272FF719E
          D4FF6F9ED6FF87B2DCFFABD3E8FFA9D0E6FF5890B8FF5282B6EA000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000006088B8DB6D9CD4FF85B1DAFF5A91B9FF5887BAEA000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000003B5472896898CFFB5F8DC1EE}
        TabOrder = 6
        ExplicitLeft = 747
        ExplicitTop = 262
      end
      object cxLog: TcxMemo
        Left = 8
        Top = 128
        Anchors = [akLeft, akTop, akRight, akBottom]
        ParentFont = False
        Properties.ReadOnly = True
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -13
        Style.Font.Name = 'Lucida Console'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 7
        ExplicitWidth = 843
        ExplicitHeight = 122
        Height = 129
        Width = 851
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'Pend'#234'ncias'
      ImageIndex = 1
      ExplicitLeft = 2
      ExplicitTop = 25
      ExplicitWidth = 859
      ExplicitHeight = 294
      DesignSize = (
        867
        301)
      object cxGrid1: TcxGrid
        Left = 0
        Top = 0
        Width = 867
        Height = 251
        Align = alTop
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        ExplicitWidth = 859
        ExplicitHeight = 244
        object cxGrid1DBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsPendencias
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = '#,###,##0'
              Kind = skCount
              FieldName = 'NUM_NOSSONUMERO'
              Column = colNUM_NOSSONUMERO
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.FocusCellOnCycle = True
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Inserting = False
          OptionsView.NoDataToDisplayInfoText = '<Nenhuma Pend'#234'ncia Encontrada>'
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          object colDOM_EXCLUIR: TcxGridDBColumn
            Caption = 'Excluir'
            DataBinding.FieldName = 'DOM_EXCLUIR'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = 'S'
            Properties.ValueUnchecked = 'N'
          end
          object colNUM_NOSSONUMERO: TcxGridDBColumn
            Caption = 'Nosso N'#250'mero'
            DataBinding.FieldName = 'NUM_NOSSONUMERO'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            FooterAlignmentHorz = taRightJustify
            Width = 87
          end
          object colCOD_ENTREGADOR: TcxGridDBColumn
            Caption = 'Entregador'
            DataBinding.FieldName = 'COD_ENTREGADOR'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.ReadOnly = True
            Width = 72
          end
          object colNUM_CEP: TcxGridDBColumn
            Caption = 'CEP'
            DataBinding.FieldName = 'NUM_CEP'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            Width = 66
          end
          object colDAT_ATRIBUICAO: TcxGridDBColumn
            Caption = 'Data Atribui'#231#227'o'
            DataBinding.FieldName = 'DAT_ATRIBUICAO'
            PropertiesClassName = 'TcxDateEditProperties'
            Width = 124
          end
          object colCOD_CLIENTE: TcxGridDBColumn
            Caption = 'Cliente'
            DataBinding.FieldName = 'COD_CLIENTE'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            Width = 51
          end
          object colNUM_PEDIDO: TcxGridDBColumn
            Caption = 'Pedido N'#186'.'
            DataBinding.FieldName = 'NUM_PEDIDO'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            Width = 67
          end
          object colDES_OCORRENCIA: TcxGridDBColumn
            Caption = 'Ocorr'#234'ncia'
            DataBinding.FieldName = 'DES_OCORRENCIA'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            Width = 254
          end
          object colCOD_STATUS: TcxGridDBColumn
            Caption = 'Status'
            DataBinding.FieldName = 'COD_STATUS'
            Width = 53
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
      object cxButton1: TcxButton
        Left = 8
        Top = 266
        Width = 105
        Height = 25
        Action = actImportarAtribuicaoEntregador
        Anchors = [akLeft, akBottom]
        OptionsImage.ImageIndex = 28
        OptionsImage.Images = dm.cxImageList1
        TabOrder = 1
        ExplicitTop = 259
      end
      object cxLabel2: TcxLabel
        Left = 163
        Top = 227
        Anchors = [akLeft, akBottom]
        Caption = 'Registros Encontrados.'
        Transparent = True
        ExplicitTop = 220
      end
      object cxButton4: TcxButton
        Left = 120
        Top = 266
        Width = 145
        Height = 25
        Action = actImportarAtribuicaoReprocessar
        Anchors = [akLeft, akBottom]
        OptionsImage.ImageIndex = 27
        OptionsImage.Images = dm.cxImageList1
        TabOrder = 3
        ExplicitTop = 259
      end
      object cxLabel3: TcxLabel
        Left = 408
        Top = 271
        Anchors = [akLeft, akBottom]
        Caption = 'Progresso:'
        Transparent = True
        ExplicitTop = 264
      end
      object cxProgressBar2: TcxProgressBar
        Left = 472
        Top = 271
        Anchors = [akLeft, akRight, akBottom]
        Properties.ShowTextStyle = cxtsText
        TabOrder = 5
        ExplicitTop = 264
        ExplicitWidth = 379
        Width = 387
      end
      object cxButton5: TcxButton
        Left = 272
        Top = 266
        Width = 113
        Height = 25
        Action = actImportarAtribuicaoExcluir
        Anchors = [akLeft, akBottom]
        OptionsImage.ImageIndex = 8
        OptionsImage.Images = dm.cxImageList1
        TabOrder = 6
        ExplicitTop = 259
      end
    end
  end
  object aclImportaEntrega: TActionList
    Left = 352
    object actImportarAtribuicaoImportar: TAction
      Category = 'Importar Atribui'#231#245'es'
      Caption = '&Importar'
      Hint = 'Importar os dados'
      OnExecute = actImportarAtribuicaoImportarExecute
    end
    object actImportaAtribuicaoSair: TAction
      Category = 'Importar Atribui'#231#245'es'
      Caption = 'Sai&r'
      Hint = 'Sair da Tela'
      OnExecute = actImportaAtribuicaoSairExecute
    end
    object actImportarAtribuicaoEntregador: TAction
      Category = 'Importar Atribui'#231#245'es'
      Caption = '&Entregador'
      Enabled = False
      Hint = 'Selecionar Entregador'
      OnExecute = actImportarAtribuicaoEntregadorExecute
    end
    object actImportarAtribuicaoReprocessar: TAction
      Category = 'Importar Atribui'#231#245'es'
      Caption = '&Reprocessar Atribui'#231#245'es'
      Enabled = False
      Hint = 'Reprocessar as Pend'#234'ncias de Atribui'#231#245'es'
      OnExecute = actImportarAtribuicaoReprocessarExecute
    end
    object actImportarAtribuicaoExcluir: TAction
      Category = 'Importar Atribui'#231#245'es'
      Caption = 'E&xcluir Pend'#234'ncia'
      Enabled = False
      OnExecute = actImportarAtribuicaoExcluirExecute
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Arquivos CSV|*atribui*.csv'
    Left = 320
  end
  object dsPendencias: TDataSource
    DataSet = dm.qryGeral
    OnStateChange = dsPendenciasStateChange
    Left = 384
  end
end
