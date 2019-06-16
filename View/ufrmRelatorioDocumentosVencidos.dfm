object frmRelatorioDocumentosVencidos: TfrmRelatorioDocumentosVencidos
  Left = 0
  Top = 0
  Caption = 'Vencimentos de Documentos'
  ClientHeight = 417
  ClientWidth = 809
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel16: TcxLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alTop
    Caption = 'Vencimentos de Documentos'
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -21
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Transparent = True
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 35
    Width = 809
    Height = 318
    Align = alTop
    TabOrder = 1
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object colCOD_CADASTRO: TcxGridDBColumn
        Caption = 'Cadastro'
        DataBinding.FieldName = 'COD_CADASTRO'
        Width = 70
      end
      object colDES_RAZAO_SOCIAL: TcxGridDBColumn
        Caption = 'Nome'
        DataBinding.FieldName = 'DES_RAZAO_SOCIAL'
        Width = 250
      end
      object colNOM_FANTASIA: TcxGridDBColumn
        Caption = 'Alias'
        DataBinding.FieldName = 'NOM_FANTASIA'
        Width = 236
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
end
