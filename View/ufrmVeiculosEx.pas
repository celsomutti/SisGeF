unit ufrmVeiculosEx;

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
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxLabel, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxCheckBox, cxDropDownEdit, cxCalendar,
  cxMaskEdit, cxButtonEdit, cxTextEdit, cxGroupBox, Vcl.ActnList, Vcl.Menus,
  Vcl.StdCtrls, cxButtons, clVeiculos, clEntregador,
  clEnderecoEntregador, clEstados, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, System.Actions, System.DateUtils, clConexao, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmVeiculosEx = class(TForm)
    cxLabel27: TcxLabel;
    cxGrupo: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxCodigo: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxMarca: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxModelo: TcxTextEdit;
    cxLabel4: TcxLabel;
    cxPlaca: TcxTextEdit;
    cxLabel5: TcxLabel;
    cxTipo: TcxComboBox;
    cxLabel6: TcxLabel;
    cxChassi: TcxTextEdit;
    cxLabel7: TcxLabel;
    cxAno: TcxTextEdit;
    cxLabel8: TcxLabel;
    cxCor: TcxTextEdit;
    cxLabel9: TcxLabel;
    cxRenavan: TcxTextEdit;
    cxLabel11: TcxLabel;
    CXTipoDocumento: TcxComboBox;
    cxLabel12: TcxLabel;
    cxCPF: TcxMaskEdit;
    cxLabel13: TcxLabel;
    cxNome: TcxTextEdit;
    cxLabel36: TcxLabel;
    cxDataNascimento: TcxDateEdit;
    cxLabel41: TcxLabel;
    cxNomeMae: TcxTextEdit;
    cxLabel14: TcxLabel;
    cxRGIE: TcxTextEdit;
    cxLabel15: TcxLabel;
    cxDataEmissaoRG: TcxDateEdit;
    cxLabel16: TcxLabel;
    cxUFRG: TcxComboBox;
    cxLabel17: TcxLabel;
    cxLogradouro: TcxTextEdit;
    cxLabel20: TcxLabel;
    cxBairro: TcxTextEdit;
    cxLabel21: TcxLabel;
    cxCidade: TcxTextEdit;
    cxLabel22: TcxLabel;
    cxUF: TcxComboBox;
    cxLabel18: TcxLabel;
    cxCEP: TcxMaskEdit;
    cxLabel24: TcxLabel;
    cxUFPlaca: TcxComboBox;
    cxLabel25: TcxLabel;
    cxCidadePlaca: TcxTextEdit;
    cxLabel26: TcxLabel;
    cxLicenciamento: TcxComboBox;
    cxRastreamento: TcxCheckBox;
    cxAbastecimento: TcxCheckBox;
    aclCadastro: TActionList;
    actCadastroCancelar: TAction;
    actCadastroSalvar: TAction;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxLabel10: TcxLabel;
    cxNomePai: TcxTextEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actCadastroCancelarExecute(Sender: TObject);
    procedure cxPlacaPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure actCadastroSalvarExecute(Sender: TObject);
    procedure cxCPFExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure SetupForm;
    procedure SetupClass;
    procedure ValidaCPFCNPJ;
    procedure LocalizaProprietario;
    procedure PopulaEstados;
    procedure PopulaLocais;
  public
    { Public declarations }
    iVeiculo: Integer;
    iEntregador: Integer;
    sPlaca: String;
    sOperacao: String;
  end;

var
  frmVeiculosEx: TfrmVeiculosEx;
  veiculo: TVeiculos;
  entregador: TEntregador;
  endereco: TEnderecoEntregador;
  bFlag: Boolean;
  estado: TEstados;
  iVeiculoOld: Integer;
  conexao: TConexao;

implementation

{$R *.dfm}

uses
  udm, uGlobais, clUtil;

procedure TfrmVeiculosEx.actCadastroCancelarExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmVeiculosEx.actCadastroSalvarExecute(Sender: TObject);
begin
  if Application.MessageBox('Confirma salvar os dados?', 'Salvar!',
    MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  if iVeiculo > 0 then
  begin
    if not(veiculo.getObject(IntToStr(iVeiculo), 'CODIGO')) then
    begin
      Application.MessageBox('Erro ao localizar o veiculo anterior!',
        'Atenção!', MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
    veiculo.entregador := 0;
    if not(veiculo.Update()) then
    begin
      Application.MessageBox('Erro ao desvincular o veiculo anterior!',
        'Atenção!', MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
  end;
  SetupClass;
  if not(veiculo.Validar) then
  begin
    Exit;
  end;
  if sOperacao = 'U' then
  begin
    if not(veiculo.Update()) then
    begin
      Application.MessageBox('Erro ao alterar os dados do veiculo!', 'Atenção!',
        MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
  end
  else
  begin
    if not(veiculo.Insert()) then
    begin
      Application.MessageBox('Erro ao incluir os dados do veiculo!', 'Atenção!',
        MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
  end;
  ModalResult := mrOk;
end;

procedure TfrmVeiculosEx.cxCPFExit(Sender: TObject);
begin
  ValidaCPFCNPJ
end;

procedure TfrmVeiculosEx.cxPlacaPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if TUtil.Empty(cxPlaca.Text) then
  begin
    Exit;
  end;
  if sPlaca <> DisplayValue then
  begin
    if veiculo.getObject(VarToStr(DisplayValue), 'PLACA') then
    begin
      if veiculo.entregador > 0 then
      begin
        if veiculo.entregador <> iEntregador then
        begin
          if Application.MessageBox
            ('A placa informada pertence a um veíulo que está vinculado a outro entregador! Deseja Continuar?',
            'Atenção!', MB_YESNO + MB_ICONQUESTION) = IDNO then
          begin
            veiculo.getObject(IntToStr(iVeiculo), 'CODIGO');
            Exit;
          end
          else
          begin
            SetupForm;
            sOperacao := 'U';
          end;
        end
        else
        begin
          SetupForm;
          sOperacao := 'U';
        end;
      end
      else
      begin
        SetupForm;
        sOperacao := 'U';
      end;
    end
    else
    begin
      TUtil.LimparFields(Self);
      sOperacao := 'I';
    end;
  end;
end;

procedure TfrmVeiculosEx.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  veiculo.Free;
  entregador.Free;
  endereco.Free;
  estado.Free;
  conexao.Free;
  if iVeiculo > 0 then
  begin
    SetupForm;
  end;

end;

procedure TfrmVeiculosEx.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfrmVeiculosEx.FormShow(Sender: TObject);
begin
  veiculo := TVeiculos.Create;
  entregador := TEntregador.Create;
  endereco := TEnderecoEntregador.Create;
  estado := TEstados.Create;
  conexao := TConexao.Create;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    actCadastroCancelarExecute(Sender);
    Exit;
  end;
  PopulaEstados;
  PopulaLocais;
  cxLicenciamento.Text := IntToStr(YearOf(Now));
  if veiculo.getObject(sPlaca, 'PLACA') then
  begin
    SetupForm;
  end;
end;

procedure TfrmVeiculosEx.SetupForm;
begin
  iVeiculoOld := veiculo.Codigo;
  cxCodigo.Text := IntToStr(veiculo.Codigo);
  CXTipoDocumento.Text := veiculo.TipoDoc;
  cxCPF.Text := veiculo.CPF;
  cxNome.Text := veiculo.Nome;
  cxDataNascimento.Date := veiculo.DtNascimento;
  cxNomeMae.Text := veiculo.NomeMae;
  cxNomePai.Text := veiculo.NomePai;
  cxRGIE.Text := veiculo.RG;
  cxDataEmissaoRG.Date := veiculo.DataRG;
  cxUFRG.Text := veiculo.UFRG;
  cxLogradouro.Text := veiculo.endereco;
  cxCEP.Text := veiculo.CEP;
  cxBairro.Text := veiculo.Bairro;
  cxCidade.Text := veiculo.Cidade;
  cxUF.Text := veiculo.UF;
  cxModelo.Text := veiculo.Modelo;
  cxMarca.Text := veiculo.Marca;
  cxPlaca.Text := veiculo.Placa;
  cxCidadePlaca.Text := veiculo.CidadePlaca;
  cxUFPlaca.Text := veiculo.UFPlaca;
  cxTipo.Text := veiculo.Tipo;
  cxChassi.Text := veiculo.Chassi;
  cxAno.Text := veiculo.Ano;
  cxCor.Text := veiculo.Cor;
  cxRenavan.Text := veiculo.Renavan;
  cxLicenciamento.Text := veiculo.Exercicio;
  if veiculo.Rastreado = 'S' then
  begin
    cxRastreamento.Checked := True;
  end
  else
  begin
    cxRastreamento.Checked := False;
  end;
  if veiculo.Abastecimento = 'S' then
  begin
    cxAbastecimento.Checked := True;
  end
  else
  begin
    cxAbastecimento.Checked := False;
  end;
end;

procedure TfrmVeiculosEx.SetupClass;
begin
  if sOperacao = 'U' then
  begin
    veiculo.Codigo := StrToInt(cxCodigo.Text);
  end;
  veiculo.TipoDoc := CXTipoDocumento.Text;
  veiculo.CPF := cxCPF.Text;
  veiculo.Nome := cxNome.Text;
  if not(TUtil.Empty(cxDataNascimento.Text)) then
  begin
    veiculo.DtNascimento := cxDataNascimento.Date;
  end;
  veiculo.NomeMae := cxNomeMae.Text;
  veiculo.NomePai := cxNomePai.Text;
  veiculo.RG := cxRGIE.Text;
  if not(TUtil.Empty(cxDataEmissaoRG.Text)) then
  begin
    veiculo.DataRG := cxDataEmissaoRG.Date;
  end;
  veiculo.UFRG := cxUFRG.Text;
  veiculo.endereco := cxLogradouro.Text;
  veiculo.CEP := cxCEP.Text;
  veiculo.Bairro := cxBairro.Text;
  veiculo.Cidade := cxCidade.Text;
  veiculo.UF := cxUF.Text;
  veiculo.entregador := iEntregador;
  veiculo.Marca := cxMarca.Text;
  veiculo.Modelo := cxModelo.Text;
  veiculo.Placa := cxPlaca.Text;
  veiculo.UFPlaca := cxUFPlaca.Text;
  veiculo.CidadePlaca := cxCidadePlaca.Text;
  veiculo.Tipo := cxTipo.Text;
  veiculo.Chassi := cxChassi.Text;
  veiculo.Ano := cxAno.Text;
  veiculo.Cor := cxCor.Text;
  veiculo.Renavan := cxRenavan.Text;
  veiculo.Exercicio := cxLicenciamento.Text;
  if cxRastreamento.Checked then
  begin
    veiculo.Rastreado := 'S';
  end
  else
  begin
    veiculo.Rastreado := 'N';
  end;
  if cxAbastecimento.Checked then
  begin
    veiculo.Abastecimento := 'S';
  end
  else
  begin
    veiculo.Abastecimento := 'N';
  end;
  veiculo.Executor := uGlobais.sUsuario;
  veiculo.Manutencao := Now;
end;

procedure TfrmVeiculosEx.ValidaCPFCNPJ;
begin
  if not(TUtil.Empty(cxCPF.Text)) then
  begin
    if CXTipoDocumento.Text = 'CPF' then
    begin
      if not(TUtil.CPF(cxCPF.Text)) then
      begin
        Application.MessageBox('CPF INVÁLIDO!', 'Atenção!',
          MB_OK + MB_ICONWARNING);
        Exit;
      end;
      cxCPF.Text := TUtil.FormataCPF(cxCPF.Text);
    end
    else
    begin
      if not(TUtil.CNPJ(cxCPF.Text)) then
      begin
        Application.MessageBox('CNPJ INVÁLIDO!', 'Atenção!',
          MB_OK + MB_ICONWARNING);
        Exit;
      end;
      cxCPF.Text := TUtil.FormataCNPJ(cxCPF.Text);
    end;
  end
  else
  begin
    Exit;
  end;
  LocalizaProprietario;
end;

procedure TfrmVeiculosEx.LocalizaProprietario;
begin
  if entregador.getObject(cxCPF.Text, 'CPF') then
  begin
    cxNome.Text := entregador.Nome;
    cxDataNascimento.Date := entregador.DtNascimento;
    cxNomeMae.Text := entregador.NomeMae;
    cxNomePai.Text := entregador.NomePai;
    cxRGIE.Text := entregador.RG;
    cxDataEmissaoRG.Date := entregador.DataRG;
    cxUFRG.Text := entregador.UFRG;
    if endereco.getObject(IntToStr(entregador.Cadastro), 'CODIGO') then
    begin
      cxLogradouro.Text := endereco.endereco + ', ' + endereco.Numero;
      if not(TUtil.Empty(endereco.Complemento)) then
      begin
        cxLogradouro.Text := cxLogradouro.Text + '-' + endereco.Complemento;
      end;
      cxCEP.Text := endereco.CEP;
      cxBairro.Text := endereco.Bairro;
      cxUF.Text := endereco.UF;
      cxCidade.Text := endereco.Cidade;
    end;
  end
  else if veiculo.getObject(cxCPF.Text, 'CPF') then
  begin
    cxNome.Text := veiculo.Nome;
    cxDataNascimento.Date := veiculo.DtNascimento;
    cxNomeMae.Text := veiculo.NomeMae;
    cxNomePai.Text := veiculo.NomePai;
    cxRGIE.Text := veiculo.RG;
    cxDataEmissaoRG.Date := veiculo.DataRG;
    cxUFRG.Text := veiculo.UFRG;
    cxLogradouro.Text := veiculo.endereco;
    cxCEP.Text := veiculo.CEP;
    cxBairro.Text := veiculo.Bairro;
    cxUF.Text := veiculo.UF;
    cxCidade.Text := veiculo.Cidade;
  end;

end;

procedure TfrmVeiculosEx.PopulaEstados;
begin
  if not(estado.getObjects()) then
  begin
    Exit;
  end;
  cxUF.Properties.Items.Clear;
  cxUFRG.Properties.Items.Clear;
  cxUFPlaca.Properties.Items.Clear;
  dm.qryGetObject.First;
  while not(dm.qryGetObject.Eof) do
  begin
    cxUF.Properties.Items.Add(dm.qryGetObject.FieldByName('UF_ESTADO')
      .AsString);
    cxUFRG.Properties.Items.Add(dm.qryGetObject.FieldByName('UF_ESTADO')
      .AsString);
    cxUFPlaca.Properties.Items.Add(dm.qryGetObject.FieldByName('UF_ESTADO')
      .AsString);
    dm.qryGetObject.Next;
  end;
  dm.qryGetObject.Close;
  dm.qryGetObject.SQL.Clear;
end;

procedure TfrmVeiculosEx.PopulaLocais;
var
  sLocais: TStringList;
begin
  sLocais := TStringList.Create;
  sLocais := veiculo.PopulaLocal('BAIRRO');
  cxBairro.Properties.LookupItems.Clear;
  cxBairro.Properties.LookupItems.AddStrings(sLocais);
  sLocais.Clear;
  sLocais := veiculo.PopulaLocal('CIDADE');
  cxCidade.Properties.LookupItems.Clear;
  cxCidade.Properties.LookupItems.AddStrings(sLocais);
  sLocais.Clear;
  sLocais := veiculo.PopulaLocal('PLACA');
  cxCidadePlaca.Properties.LookupItems.Clear;
  cxCidadePlaca.Properties.LookupItems.AddStrings(sLocais);
  sLocais.Clear;
end;

end.
