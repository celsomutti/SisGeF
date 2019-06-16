unit ufrmEntregadorEx;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxGroupBox, cxLabel, cxTextEdit,
  cxMaskEdit, cxSpinEdit, cxButtonEdit, Vcl.ActnList,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, clAgentes, clEntregador, cxCurrencyEdit,
  cxDBEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxDropDownEdit, cxCalendar, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, System.Actions, clCodigosEntregadores, cxCalc,
  clConexao, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light;

type
  TfrmEntregadorEx = class(TForm)
    aclEntregador: TActionList;
    actEntregadorAceitar: TAction;
    actEntregadorCancelar: TAction;
    actEntregadorListaApoio: TAction;
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxNomeEntregador: TcxTextEdit;
    cxCodigoEntregador: TcxButtonEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxLabel3: TcxLabel;
    cxCodAdmCEP: TcxButtonEdit;
    cxLabel4: TcxLabel;
    cxNomeAdmCEP: TcxTextEdit;
    cxLabel5: TcxLabel;
    cxGrupoVerba: TcxComboBox;
    cxLabel6: TcxLabel;
    cxVerba: TcxCalcEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure actEntregadorCancelarExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actEntregadorListaApoioExecute(Sender: TObject);
    procedure cxCodigoEntregadorPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure actEntregadorAceitarExecute(Sender: TObject);
    procedure cxCodAdmCEPPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
  private
    { Private declarations }
    procedure ListaEntregador;
    procedure ListaAdmCEP;
  public
    { Public declarations }
    iCadastro: Integer;
    sOperacao: String;
  end;

var
  frmEntregadorEx: TfrmEntregadorEx;
  entregador: TEntregador;
  codentregador: TCodigosEntregadores;
  agente: TAgente;
  conexao: TConexao;

implementation

{$R *.dfm}

uses
  udm, ufrmListaApoio, uGlobais, clUtil;

procedure TfrmEntregadorEx.actEntregadorAceitarExecute(Sender: TObject);
begin
  if TUtil.Empty(cxCodigoEntregador.Text) then
  begin
    Application.MessageBox('Informe um código de Entregador!', 'Atenção!',
      MB_OK + MB_ICONEXCLAMATION);
    cxCodigoEntregador.SetFocus;
    Exit;
  end;
  if StrToInt(cxCodigoEntregador.Text) = 0 then
  begin
    Application.MessageBox('Informe um código de Entregador!', 'Atenção!',
      MB_OK + MB_ICONEXCLAMATION);
    cxCodigoEntregador.SetFocus;
    Exit;
  end;
  if codentregador.getObject(cxCodigoEntregador.Text, 'CODIGO') then
  begin
    if codentregador.Cadastro <> 0 then
    begin
      if iCadastro <> codentregador.Cadastro then
      begin
        Application.MessageBox('Código de Entregador já Utilizado!', 'Atenção!',
          MB_OK + MB_ICONEXCLAMATION);
        cxCodigoEntregador.SetFocus;
        Exit;
      end
      else
      begin
        if iCadastro <> 0 then
        begin
          if sOperacao <> 'U' then
          begin
            Application.MessageBox
              ('Código de Entregador já pertence a este Cadastro!', 'Atenção!',
              MB_OK + MB_ICONEXCLAMATION);
            cxCodigoEntregador.SetFocus;
            Exit;
          end;
        end;
      end;
    end;
  end;
  if TUtil.Empty(cxNomeEntregador.Text) then
  begin
    Application.MessageBox('Informe O Nome Fantasia do Entregador!', 'Atenção!',
      MB_OK + MB_ICONEXCLAMATION);
    cxCodigoEntregador.SetFocus;
    Exit;
  end;
  if codentregador.getObject(cxNomeEntregador.Text, 'NOME') then
  begin
    if codentregador.Cadastro <> 0 then
    begin
      if iCadastro <> codentregador.Cadastro then
      begin
        Application.MessageBox('Nome de Entregador já Utilizado!', 'Atenção!',
          MB_OK + MB_ICONEXCLAMATION);
        cxNomeEntregador.SetFocus;
        Exit;
      end
      else
      begin
        if iCadastro <> 0 then
        begin
          if sOperacao <> 'U' then
          begin
            Application.MessageBox
              ('Nome de Entregador já pertence a este Cadastro!', 'Atenção!',
              MB_OK + MB_ICONEXCLAMATION);
            cxNomeEntregador.SetFocus;
            Exit;
          end;
        end;
      end;
    end;
  end;
  if TUtil.Empty(cxCodAdmCEP.Text) then
  begin
    Application.MessageBox('Informe um código de Administrador de CEP!',
      'Atenção!', MB_OK + MB_ICONEXCLAMATION);
    cxCodAdmCEP.SetFocus;
    Exit;
  end;
  if StrToInt(cxCodAdmCEP.Text) = 0 then
  begin
    Application.MessageBox('Informe um código de Administrador de CEP!',
      'Atenção!', MB_OK + MB_ICONEXCLAMATION);
    cxCodAdmCEP.SetFocus;
    Exit;
  end;
  if cxGrupoVerba.ItemIndex = -1 then
  begin
    cxGrupoVerba.Text := '0';
  end;

  ModalResult := mrOk;
end;

procedure TfrmEntregadorEx.actEntregadorCancelarExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmEntregadorEx.actEntregadorListaApoioExecute(Sender: TObject);
begin
  if cxCodigoEntregador.IsFocused then
  begin
    ListaEntregador;
  end;
end;

procedure TfrmEntregadorEx.cxCodAdmCEPPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if TUtil.Empty(DisplayValue) then
  begin
    DisplayValue := '0';
  end;
  agente.Codigo := DisplayValue;
  cxNomeAdmCEP.Text := agente.getField('NOM_FANTASIA', 'CODIGO');
end;

procedure TfrmEntregadorEx.cxCodigoEntregadorPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if TUtil.Empty(cxCodigoEntregador.Text) then
  begin
    cxCodigoEntregador.Text := '0';
  end;
  codentregador.Codigo := StrToInt(cxCodigoEntregador.Text);
  cxNomeEntregador.Text := codentregador.getField('NOM_FANTASIA', 'CODIGO');
end;

procedure TfrmEntregadorEx.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  entregador.Free;
  codentregador.Free;
  agente.Free;
  conexao.Free;
end;

procedure TfrmEntregadorEx.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfrmEntregadorEx.FormShow(Sender: TObject);
begin
  entregador := TEntregador.Create();
  codentregador := TCodigosEntregadores.Create();
  agente := TAgente.Create();
  conexao := TConexao.Create;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    actEntregadorCancelarExecute(Sender);
    Exit;
  end;
  if iCadastro = 0 then
  begin
    codentregador.Operacao := 'I';
  end
  else
  begin
    codentregador.Operacao := 'U';
  end;

end;

procedure TfrmEntregadorEx.ListaEntregador;
var
  sId: String;
begin
  sId := '';
  sId := Trim(cxCodigoEntregador.Text);
  with dm.qryPesquisa do
  begin
    Close;
    SQL.Clear;
    SQL.Text :=
      'SELECT COD_ENTREGADORES AS "Código", NOM_FANTASIA AS "Nome", COD_AGENTE AS "Adm. CEP"  '
      + 'FROM tbcodigosentregadores ';
    dm.ZConn.PingServer;
    Open;
  end;
  if dm.qryPesquisa.IsEmpty then
  begin
    dm.qryPesquisa.Close;
    dm.qryPesquisa.SQL.Clear;
    Exit;
  end
  else
  begin
    dm.qryPesquisa.First;
  end;
  if not Assigned(frmListaApoio) then
  begin
    frmListaApoio := TfrmListaApoio.Create(Application);
  end;
  frmListaApoio.Caption := 'Entregadores';
  if frmListaApoio.ShowModal = mrOk then
  begin
    cxCodigoEntregador.Text := dm.qryPesquisa.Fields[0].AsString;
    cxCodigoEntregador.Refresh;
    cxNomeEntregador.Text := dm.qryPesquisa.Fields[1].AsString;
    cxNomeEntregador.Refresh;
  end;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  FreeAndNil(frmListaApoio);
end;

procedure TfrmEntregadorEx.ListaAdmCEP;
var
  sId: String;
begin
  sId := '';
  sId := Trim(cxCodigoEntregador.Text);
  with dm.qryPesquisa do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT COD_AGENTE AS "Código", NOM_FANTASIA AS "Nome" ' +
      'FROM tbagentes ';
    dm.ZConn.PingServer;
    Open;
  end;
  if dm.qryPesquisa.IsEmpty then
  begin
    dm.qryPesquisa.Close;
    dm.qryPesquisa.SQL.Clear;
    Exit;
  end
  else
  begin
    dm.qryPesquisa.First;
  end;
  if not Assigned(frmListaApoio) then
  begin
    frmListaApoio := TfrmListaApoio.Create(Application);
  end;
  frmListaApoio.Caption := 'Administradores de CEP';
  if frmListaApoio.ShowModal = mrOk then
  begin
    cxCodigoEntregador.Text := dm.qryPesquisa.Fields[0].AsString;
    cxCodigoEntregador.Refresh;
    cxNomeEntregador.Text := dm.qryPesquisa.Fields[1].AsString;
    cxNomeEntregador.Refresh;
  end;
  dm.qryPesquisa.Close;
  dm.qryPesquisa.SQL.Clear;
  FreeAndNil(frmListaApoio);
end;

end.
