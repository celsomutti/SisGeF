object frmEntregadorEx: TfrmEntregadorEx
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Entregador'
  ClientHeight = 163
  ClientWidth = 614
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
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alClient
    TabOrder = 0
    Height = 163
    Width = 614
    object cxLabel1: TcxLabel
      Left = 16
      Top = 16
      Caption = '&C'#243'digo:'
      FocusControl = cxCodigoEntregador
      Transparent = True
    end
    object cxLabel2: TcxLabel
      Left = 159
      Top = 16
      Caption = '&Nome:'
      FocusControl = cxNomeEntregador
      Transparent = True
    end
    object cxNomeEntregador: TcxTextEdit
      Left = 200
      Top = 15
      Hint = 'Nome Fantasia ou Apelido do Entregador'
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 0
      Properties.ReadOnly = False
      TabOrder = 3
      Width = 393
    end
    object cxCodigoEntregador: TcxButtonEdit
      Left = 82
      Top = 15
      Hint = 'C'#243'digo do Entregador'
      Properties.Alignment.Horz = taRightJustify
      Properties.Buttons = <
        item
          Action = actEntregadorListaApoio
          Default = True
          Kind = bkGlyph
        end>
      Properties.IgnoreMaskBlank = True
      Properties.Images = dm.cxImageList1
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d\d\d\d\d\d'
      Properties.OnValidate = cxCodigoEntregadorPropertiesValidate
      TabOrder = 1
      Width = 71
    end
    object cxButton1: TcxButton
      Left = 437
      Top = 124
      Width = 75
      Height = 25
      Action = actEntregadorAceitar
      TabOrder = 9
    end
    object cxButton2: TcxButton
      Left = 518
      Top = 124
      Width = 75
      Height = 25
      Action = actEntregadorCancelar
      TabOrder = 13
    end
    object cxLabel3: TcxLabel
      Left = 16
      Top = 43
      Caption = '&Adm. CEP:'
      FocusControl = cxCodAdmCEP
      Transparent = True
    end
    object cxCodAdmCEP: TcxButtonEdit
      Left = 82
      Top = 42
      Hint = 'C'#243'digo do Administrador do CEP'
      Properties.Alignment.Horz = taRightJustify
      Properties.Buttons = <
        item
          Action = actEntregadorListaApoio
          Default = True
          Kind = bkGlyph
        end>
      Properties.IgnoreMaskBlank = True
      Properties.Images = dm.cxImageList1
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d\d\d\d\d\d'
      Properties.OnValidate = cxCodAdmCEPPropertiesValidate
      TabOrder = 4
      Width = 71
    end
    object cxLabel4: TcxLabel
      Left = 159
      Top = 43
      Caption = 'N&ome:'
      FocusControl = cxNomeAdmCEP
      Transparent = True
    end
    object cxNomeAdmCEP: TcxTextEdit
      Left = 200
      Top = 42
      Hint = 'Nome Fantasia ou Apelido do Administrador do CEP'
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 0
      Properties.ReadOnly = True
      TabOrder = 5
      Width = 393
    end
    object cxLabel5: TcxLabel
      Left = 16
      Top = 75
      Caption = '&Grupo:'
      FocusControl = cxGrupoVerba
      Transparent = True
    end
    object cxGrupoVerba: TcxComboBox
      Left = 82
      Top = 69
      Hint = 'C'#243'digo fo Grupo de Verbas'
      Properties.DropDownListStyle = lsEditFixedList
      Properties.MaxLength = 2
      TabOrder = 6
      Width = 48
    end
    object cxLabel6: TcxLabel
      Left = 159
      Top = 69
      Caption = '&Verba:'
      FocusControl = cxVerba
      Transparent = True
    end
    object cxVerba: TcxCalcEdit
      Left = 200
      Top = 69
      Hint = 'Verba ou Ajuda de Custo'
      EditValue = 0.000000000000000000
      Properties.Alignment.Horz = taRightJustify
      Properties.ButtonGlyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000808040808040
        8080408080408080408080408080408080408080408080408080408080408080
        4080804080804080804080804080804091919189888887868687878788888789
        8988898888888888888887878686878685979797808040808040808040808040
        888888C2C2C1BCBCBCBCBCBCBCBCBBBCBCBBBCBCBBBCBCBBBCBCBBBCBCBBC2C2
        C18B8B8A8080408080408080408080408C8C8BFFFFFFEBEBEBEBEBEBE9E9E9E8
        E8E8E7E7E7E7E7E7E6E6E6E6E6E6FFFFFF8E8D8C808040808040808040808040
        929191FFFFFFB4B4B4949494E7E7E7B2B2B2939393E3E3E3B0B0B0919191FBFB
        FB929291808040808040808040808040959595FFFFFFE8E8E8E7E7E7E5E5E5E3
        E3E3E2E2E2E0E0E0DFDFDFDCDCDCFFFFFF959595808040808040808040808040
        9A9A99FFFFFFB1B1B1919191E2E2E2ADADAD8F8F8FDCDCDCA9A9A98D8D8DFBFB
        FB9A99998080408080408080408080409E9D9DFFFFFFE3E3E3E1E1E1DCDCDCDB
        DBDBD7D7D7D3D3D3D3D3D3D1D1D1FFFFFF9E9D9C808040808040808040808040
        A0A0A0FFFFFFADADAD8E8E8ED8D8D8A5A5A58A8A8ACECECE7374E85258DBFBFB
        FB9E9E9E808040808040808040808040A3A3A3FCFCFCDADADAD7D7D7D2D2D2CE
        CECEC9C9C9C5C5C5C2C2C2BFBFBFFFFFFFA0A0A0808040808040808040808040
        A3A3A3FFFFFFB07B56C38D67C58F68C69069C8926BCA946CCA956EB07B56FFFF
        FFA1A09F808040808040808040808040A4A4A4FFFFFFB07B56C18B64C38D66C5
        8F67C69069C8926BCA946CB07B56FFFFFFA0A0A0808040808040808040808040
        A3A3A3FFFFFFA7724DA7724DA7724DA7724DA7724DA7724DA7724DA7724DFFFF
        FF9E9E9E808040808040808040808040AAAAAAFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA3A3A3808040808040808040808040
        B3B3B3A9A9A9A8A8A8ABABABACACACADADADACACACABABABA8A8A8A4A4A4A3A3
        A3B5B5B580804080804080804080804080804080804080804080804080804080
        8040808040808040808040808040808040808040808040808040}
      Properties.DisplayFormat = ' ,0.00;- ,0.00'
      TabOrder = 7
      Width = 88
    end
  end
  object aclEntregador: TActionList
    Images = dm.cxImageList1
    Left = 552
    Top = 80
    object actEntregadorAceitar: TAction
      Category = 'Novo Entregador'
      Caption = 'Aceitar'
      Hint = 'Aceitar Entregador'
      ImageIndex = 0
      OnExecute = actEntregadorAceitarExecute
    end
    object actEntregadorCancelar: TAction
      Category = 'Novo Entregador'
      Caption = 'Ca&ncelar'
      Hint = 'Cancelar a Importa'#231#227'o'
      ImageIndex = 6
      OnExecute = actEntregadorCancelarExecute
    end
    object actEntregadorListaApoio: TAction
      Category = 'Novo Entregador'
      Caption = '&Lista de Apoio'
      Hint = 'Lista de Apoio'
      ImageIndex = 11
      OnExecute = actEntregadorListaApoioExecute
    end
  end
end
