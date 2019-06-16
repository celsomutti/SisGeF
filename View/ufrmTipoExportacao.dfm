object frmTipoExportacao: TfrmTipoExportacao
  Left = 503
  Top = 267
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Tipo de Exporta'#231#227'o'
  ClientHeight = 138
  ClientWidth = 401
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cxRadioGroup1: TcxRadioGroup
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alTop
    Caption = 'Selecione'
    Properties.Items = <
      item
        Caption = 'Tudo'
      end
      item
        Caption = 'Pelo Agente'
      end
      item
        Caption = 'Pelo Entregador'
      end>
    ItemIndex = 0
    Style.Shadow = False
    TabOrder = 0
    ExplicitLeft = -8
    ExplicitTop = 0
    Height = 105
    Width = 395
  end
  object cxButton1: TcxButton
    Left = 237
    Top = 111
    Width = 75
    Height = 20
    Action = actTipoExportacaoOK
    Default = True
    TabOrder = 1
  end
  object cxButton2: TcxButton
    Left = 318
    Top = 111
    Width = 75
    Height = 20
    Action = actTipoExportacaoCancelar
    Cancel = True
    TabOrder = 2
  end
  object aclTipoExportacao: TActionList
    Images = dm.cxImageList1
    Left = 320
    Top = 40
    object actTipoExportacaoOK: TAction
      Category = 'Tipo Exporta'#231#227'o'
      Caption = 'OK'
      Hint = 'OK'
      ImageIndex = 0
      OnExecute = actTipoExportacaoOKExecute
    end
    object actTipoExportacaoCancelar: TAction
      Category = 'Tipo Exporta'#231#227'o'
      Caption = 'Cancelar'
      Hint = 'Cancelar'
      ImageIndex = 6
      OnExecute = actTipoExportacaoCancelarExecute
    end
  end
end
