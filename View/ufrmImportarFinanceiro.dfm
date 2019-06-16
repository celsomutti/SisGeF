object frmImportarFinanceiro: TfrmImportarFinanceiro
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Importa'#231#227'o de Dados Financeiros'
  ClientHeight = 332
  ClientWidth = 649
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
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
    Caption = 'Importa'#231#227'o Financeiro'
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
    Width = 643
    AnchorY = 22
  end
  object cxGroupBox1: TcxGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 47
    Align = alLeft
    Caption = 'Op'#231#245'es'
    TabOrder = 1
    Height = 282
    Width = 158
    object cxProgressBar1: TcxProgressBar
      AlignWithMargins = True
      Left = 6
      Top = 248
      Align = alBottom
      Properties.ShowTextStyle = cxtsText
      Style.LookAndFeel.Kind = lfOffice11
      Style.LookAndFeel.NativeStyle = False
      Style.Shadow = False
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 0
      Visible = False
      Width = 146
    end
    object cxButton1: TcxButton
      AlignWithMargins = True
      Left = 6
      Top = 18
      Width = 146
      Height = 25
      Align = alTop
      Action = actImportarImportar
      TabOrder = 1
    end
    object cxButton2: TcxButton
      AlignWithMargins = True
      Left = 6
      Top = 217
      Width = 146
      Height = 25
      Align = alBottom
      Action = actImportarSair
      TabOrder = 2
      ExplicitTop = 219
    end
    object cxButton4: TcxButton
      AlignWithMargins = True
      Left = 6
      Top = 49
      Width = 146
      Height = 25
      Align = alTop
      Action = actImportarCancelar
      Cancel = True
      TabOrder = 3
    end
  end
  object cxGroupBox2: TcxGroupBox
    AlignWithMargins = True
    Left = 167
    Top = 47
    Align = alClient
    Caption = 'Log'
    TabOrder = 2
    Height = 282
    Width = 479
    object cxLog: TcxMemo
      AlignWithMargins = True
      Left = 6
      Top = 18
      Align = alTop
      Anchors = [akLeft, akTop, akRight, akBottom]
      ParentFont = False
      Properties.ReadOnly = True
      Properties.ScrollBars = ssBoth
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -13
      Style.Font.Name = 'Lucida Console'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 0
      ExplicitHeight = 213
      Height = 206
      Width = 467
    end
    object cxButton3: TcxButton
      AlignWithMargins = True
      Left = 6
      Top = 244
      Width = 467
      Height = 25
      Align = alBottom
      Action = actImportarLimparLOG
      TabOrder = 1
    end
  end
  object aclImportaFinanceiro: TActionList
    Images = dm.cxImageList1
    Left = 272
    object actImportarImportar: TAction
      Category = 'Importar'
      Caption = 'Importar'
      Hint = 'Importar Arquivo Financeiro'
      ImageIndex = 27
      OnExecute = actImportarImportarExecute
    end
    object actImportarSair: TAction
      Category = 'Importar'
      Caption = 'Sair'
      Hint = 'Sair da Tela'
      ImageIndex = 10
      OnExecute = actImportarSairExecute
    end
    object actImportarLimparLOG: TAction
      Category = 'Importar'
      Caption = 'Limpar LOG'
      Hint = 'Limpar o LOG'
      OnExecute = actImportarLimparLOGExecute
    end
    object actImportarCancelar: TAction
      Category = 'Importar'
      Caption = 'Cancelar'
      Hint = 'Cancelar Importa'#231#227'o'
      ImageIndex = 6
      Visible = False
      OnExecute = actImportarCancelarExecute
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Arquivos CSV|*entrada*.csv'
    Left = 347
  end
end
