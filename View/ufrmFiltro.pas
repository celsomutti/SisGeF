unit ufrmFiltro;

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
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxGroupBox, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLabel, cxListBox, cxCheckBox,
  System.Actions, Vcl.ActnList, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxSpinEdit, cxTimeEdit,
  cxCalendar, cxMemo, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmFiltro = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxCampos: TcxComboBox;
    cxLabel2: TcxLabel;
    cxOperacao: TcxComboBox;
    cxLabel3: TcxLabel;
    cxConcordancia: TcxComboBox;
    cxGroupBox2: TcxGroupBox;
    cxTextoFiltro: TcxListBox;
    aclFiltro: TActionList;
    actFiltroAdicionar: TAction;
    actFiltroExcluirLinha: TAction;
    actFiltroExecutar: TAction;
    actFiltroCancelar: TAction;
    cxLabel4: TcxLabel;
    cxValor: TcxMaskEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxValorFinal: TcxMaskEdit;
    cxValorEm: TcxMemo;
    cxTextoSQL: TcxCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actFiltroAdicionarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxCamposPropertiesCloseUp(Sender: TObject);
    procedure cxOperacaoPropertiesCloseUp(Sender: TObject);
    procedure actFiltroExcluirLinhaExecute(Sender: TObject);
    procedure actFiltroCancelarExecute(Sender: TObject);
    procedure cxTextoSQLPropertiesChange(Sender: TObject);
    procedure actFiltroExecutarExecute(Sender: TObject);
  private
    { Private declarations }
    procedure MontaFiltro;
  public
    { Public declarations }
    slFiltro: TStringList;
    slSQL: TStringList;
    slValores: TStringList;
    slCampos: TStringList;
    slSQLFil: TStringList;
  end;

var
  frmFiltro: TfrmFiltro;
  bSQL: Boolean;

implementation

{$R *.dfm}

uses udm, uGlobais, clUtil;

procedure TfrmFiltro.actFiltroAdicionarExecute(Sender: TObject);
begin
  if cxTextoFiltro.Count > 0 then
  begin
    if cxConcordancia.ItemIndex = -1 then
    begin
      Application.MessageBox('Seleciona uma concordância!', 'Atenção!',
        MB_OK + MB_ICONEXCLAMATION);
      cxConcordancia.SetFocus;
      Exit;
    end;
  end;
  if cxOperacao.Text = 'em' then
  begin
    if TUtil.Empty(cxValorEm.Text) then
    begin
      Application.MessageBox('Informe o valor do parâmetro!', 'Atenção!',
        MB_OK + MB_ICONEXCLAMATION);
      cxValorEm.SetFocus;
      Exit;
    end;
  end
  else
  begin
    if TUtil.Empty(cxValor.Text) then
    begin
      Application.MessageBox('Informe o valor do parâmetro!', 'Atenção!',
        MB_OK + MB_ICONEXCLAMATION);
      cxValor.SetFocus;
      Exit;
    end;
    if cxOperacao.Text = 'entre' then
    begin
      if TUtil.Empty(cxValorFinal.Text) then
      begin
        Application.MessageBox('Informe o valor Final do parâmetro!',
          'Atenção!', MB_OK + MB_ICONEXCLAMATION);
        cxValorFinal.SetFocus;
        Exit;
      end;
    end;
  end;
  MontaFiltro;
  cxConcordancia.Enabled := (cxTextoFiltro.Count > 0);
end;

procedure TfrmFiltro.actFiltroCancelarExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmFiltro.actFiltroExcluirLinhaExecute(Sender: TObject);
var
  i: Integer;
begin
  i := 0;
  if cxTextoFiltro.Count = 0 then
  begin
    Exit;
  end;
  i := cxTextoFiltro.ItemIndex;
  if i = -1 then
  begin
    Exit;
  end;
  if (Trim(slSQLFil[i]) = 'AND') or (Trim(slSQLFil[i]) = 'OR') then
  begin
    Exit;
  end;
  if i = 0 then
  begin
    if cxTextoFiltro.Count > 1 then
    begin
      cxTextoFiltro.Items.Delete(i + 1);
      slSQLFil.Delete(i + 1);
      slFiltro.Delete(i + 1);
    end;
    cxTextoFiltro.Items.Delete(i);
    slSQLFil.Delete(i);
    slFiltro.Delete(i);
  end
  else
  begin
    cxTextoFiltro.Items.Delete(i);
    slSQLFil.Delete(i);
    slFiltro.Delete(i);
    if i > 1 then
    begin
      cxTextoFiltro.Items.Delete(i - 1);
      slSQLFil.Delete(i - 1);
      slFiltro.Delete(i - 1);
    end;
  end;
  cxConcordancia.Enabled := (cxTextoFiltro.Count > 0);
end;

procedure TfrmFiltro.actFiltroExecutarExecute(Sender: TObject);
begin
  if cxTextoFiltro.Count = 0 then
  begin
    Application.MessageBox('Não existem parâmetros para o filtro!', 'Atenção!',
      MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  ModalResult := mrOk;
end;

procedure TfrmFiltro.cxCamposPropertiesCloseUp(Sender: TObject);
begin
  if cxCampos.ItemIndex = -1 then
  begin
    Exit;
  end;
  if cxOperacao.Text = 'em' then
  begin
    cxValor.Clear;
    cxValorFinal.Clear;
    cxValor.Properties.EditMask := '';
    cxValorFinal.Properties.EditMask := '';
  end
  else
  begin
    if slValores[cxCampos.ItemIndex] = 'String' then
    begin
      cxValor.Properties.EditMask := '';
      cxValorFinal.Properties.EditMask := '';
    end
    else if slValores[cxCampos.ItemIndex] = 'Time' then
    begin
      cxValor.Clear;
      cxValorFinal.Clear;
      cxValor.Properties.EditMask :=
        '(0?\d | 1\d | 2[0-3]) : [0-5]\d : [0-5]\d';
      cxValorFinal.Properties.EditMask :=
        '(0?\d | 1\d | 2[0-3]) : [0-5]\d : [0-5]\d';
    end
    else if slValores[cxCampos.ItemIndex] = 'DateTime' then
    begin
      cxValor.Clear;
      cxValorFinal.Clear;
      cxValor.Properties.EditMask :=
        '([012]?[1-9] | [123]0 |31) /(0?[1-9] | 1[012]) / ([123][0-9])? [0-9][0-9]';
      cxValorFinal.Properties.EditMask :=
        '([012]?[1-9] | [123]0 |31) /(0?[1-9] | 1[012]) / ([123][0-9])? [0-9][0-9]';
    end
    else if slValores[cxCampos.ItemIndex] = 'Integer' then
    begin
      cxValor.Clear;
      cxValorFinal.Clear;
      cxValor.Properties.EditMask := '\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d';
      cxValorFinal.Properties.EditMask :=
        '\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d';
    end
    else if slValores[cxCampos.ItemIndex] = 'Float' then
    begin
      cxValor.Clear;
      cxValorFinal.Clear;
      cxValor.Properties.EditMask := ',0.000;- ,0.000';
      cxValorFinal.Properties.EditMask := ',0.000;- ,0.000';
    end
  end;
end;

procedure TfrmFiltro.cxOperacaoPropertiesCloseUp(Sender: TObject);
begin
  if cxOperacao.Text = 'em' then
  begin
    cxValor.Clear;
    cxValorFinal.Clear;
    cxValor.Visible := False;
    cxValorFinal.Visible := False;
    cxValorEm.Clear;
    cxValorEm.Visible := True;
  end
  else if cxOperacao.Text = 'entre' then
  begin
    cxValor.Clear;
    cxValorFinal.Clear;
    cxValor.Visible := True;
    cxValorFinal.Visible := True;
    cxValorEm.Clear;
    cxValorEm.Visible := False;
  end
  else
  begin
    cxValor.Clear;
    cxValorFinal.Clear;
    cxValor.Visible := True;
    cxValorFinal.Visible := False;
    cxValorEm.Clear;
    cxValorEm.Visible := False;
  end;

end;

procedure TfrmFiltro.cxTextoSQLPropertiesChange(Sender: TObject);
begin
  if cxTextoSQL.Checked then
  begin
    cxTextoFiltro.Clear;
    cxTextoFiltro.Items := slSQLFil;
  end
  else
  begin
    cxTextoFiltro.Clear;
    cxTextoFiltro.Items := slFiltro;
  end;

end;

procedure TfrmFiltro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  { slFiltro.Free;
    slSQL.Free;
    slValores.Free;
    slCampos.Free;
    slSQLFil.Free; }
end;

procedure TfrmFiltro.FormCreate(Sender: TObject);
begin
  slFiltro := TStringList.Create;
  slSQL := TStringList.Create;
  slValores := TStringList.Create;
  slCampos := TStringList.Create;
  slSQLFil := TStringList.Create;
  bSQL := False;
end;

procedure TfrmFiltro.FormShow(Sender: TObject);
begin
  cxCampos.Properties.Items := slCampos;
end;

procedure TfrmFiltro.MontaFiltro;
var
  sOperacao, sEm, sLinha, sConcordancia, sFiltro, sItem: String;
  i: Integer;
begin
  sOperacao := '';
  sLinha := '';
  sConcordancia := '';
  sFiltro := '';
  sItem := '';
  sEm := '';
  if cxConcordancia.Text = 'e' then
  begin
    sConcordancia := ' AND ';
  end
  else if cxConcordancia.Text = 'ou' then
  begin
    sConcordancia := ' OR ';
  end
  else
  begin
    sConcordancia := '';
  end;
  sLinha := sConcordancia;
  sFiltro := cxConcordancia.Text + ' ';
  if (not TUtil.Empty(sConcordancia)) then
  begin
    slFiltro.Add(sFiltro);
    slSQLFil.Add(sLinha);
  end;
  sLinha := '';
  sFiltro := '';
  sLinha := sLinha + slSQL[cxCampos.ItemIndex];
  sFiltro := cxCampos.Text + ' ';
  if cxOperacao.Text = 'igual a' then
  begin
    sOperacao := ' = ';
    sFiltro := sFiltro + cxOperacao.Text + ' ';
    if slValores[cxCampos.ItemIndex] = 'String' then
    begin
      sLinha := sLinha + sOperacao + QuotedStr(cxValor.Text);
      sFiltro := sFiltro + QuotedStr(cxValor.Text);
    end
    else if slValores[cxCampos.ItemIndex] = 'DateTime' then
    begin
      sLinha := sLinha + sOperacao +
        QuotedStr(FormatDateTime('yyyy-mm-dd', StrToDate(cxValor.Text)));
      sFiltro := sFiltro + QuotedStr(FormatDateTime('yyyy-mm-dd',
        StrToDate(cxValor.Text)));
    end
    else
    begin
      sLinha := sLinha + sOperacao + cxValor.Text;
      sFiltro := sFiltro + cxValor.Text;;
    end;
  end
  else if cxOperacao.Text = 'diferente de' then
  begin
    sOperacao := ' <> ';
    sFiltro := sFiltro + cxOperacao.Text + ' ';
    if slValores[cxCampos.ItemIndex] = 'String' then
    begin
      sLinha := sLinha + sOperacao + QuotedStr(cxValor.Text);
      sFiltro := sFiltro + QuotedStr(cxValor.Text);
    end
    else if slValores[cxCampos.ItemIndex] = 'DateTime' then
    begin
      sLinha := sLinha + sOperacao +
        QuotedStr(FormatDateTime('yyyy-mm-dd', StrToDate(cxValor.Text)));
      sFiltro := sFiltro + QuotedStr(FormatDateTime('yyyy-mm-dd',
        StrToDate(cxValor.Text)));
    end
    else
    begin
      sLinha := sLinha + sOperacao + cxValor.Text;
      sFiltro := sFiltro + cxValor.Text;;
    end;
  end
  else if cxOperacao.Text = 'maior que' then
  begin
    sOperacao := ' > ';
    sFiltro := sFiltro + cxOperacao.Text + ' ';
    if slValores[cxCampos.ItemIndex] = 'String' then
    begin
      sLinha := sLinha + sOperacao + QuotedStr(cxValor.Text);
      sFiltro := sFiltro + QuotedStr(cxValor.Text);
    end
    else if slValores[cxCampos.ItemIndex] = 'DateTime' then
    begin
      sLinha := sLinha + sOperacao +
        QuotedStr(FormatDateTime('yyyy-mm-dd', StrToDate(cxValor.Text)));
      sFiltro := sFiltro + QuotedStr(FormatDateTime('yyyy-mm-dd',
        StrToDate(cxValor.Text)));
    end
    else
    begin
      sLinha := sLinha + sOperacao + cxValor.Text;
      sFiltro := sFiltro + cxValor.Text;;
    end;
  end
  else if cxOperacao.Text = 'maior ou igual a' then
  begin
    sOperacao := ' >= ';
    sFiltro := sFiltro + cxOperacao.Text + ' ';
    if slValores[cxCampos.ItemIndex] = 'String' then
    begin
      sLinha := sLinha + sOperacao + QuotedStr(cxValor.Text);
      sFiltro := sFiltro + QuotedStr(cxValor.Text);
    end
    else if slValores[cxCampos.ItemIndex] = 'DateTime' then
    begin
      sLinha := sLinha + sOperacao +
        QuotedStr(FormatDateTime('yyyy-mm-dd', StrToDate(cxValor.Text)));
      sFiltro := sFiltro + QuotedStr(FormatDateTime('yyyy-mm-dd',
        StrToDate(cxValor.Text)));
    end
    else
    begin
      sLinha := sLinha + sOperacao + cxValor.Text;
      sFiltro := sFiltro + cxValor.Text;;
    end;
  end
  else if cxOperacao.Text = 'menor que' then
  begin
    sOperacao := ' < ';
    sFiltro := sFiltro + cxOperacao.Text + ' ';
    if slValores[cxCampos.ItemIndex] = 'String' then
    begin
      sLinha := sLinha + sOperacao + QuotedStr(cxValor.Text);
      sFiltro := sFiltro + QuotedStr(cxValor.Text);
    end
    else if slValores[cxCampos.ItemIndex] = 'DateTime' then
    begin
      sLinha := sLinha + sOperacao +
        QuotedStr(FormatDateTime('yyyy-mm-dd', StrToDate(cxValor.Text)));
      sFiltro := sFiltro + QuotedStr(FormatDateTime('yyyy-mm-dd',
        StrToDate(cxValor.Text)));
    end
    else
    begin
      sLinha := sLinha + sOperacao + cxValor.Text;
      sFiltro := sFiltro + cxValor.Text;;
    end;
  end
  else if cxOperacao.Text = 'menor ou igual a' then
  begin
    sOperacao := ' <= ';
    sFiltro := sFiltro + cxOperacao.Text + ' ';
    if slValores[cxCampos.ItemIndex] = 'String' then
    begin
      sLinha := sLinha + sOperacao + QuotedStr(cxValor.Text);
      sFiltro := sFiltro + QuotedStr(cxValor.Text);
    end
    else if slValores[cxCampos.ItemIndex] = 'DateTime' then
    begin
      sLinha := sLinha + sOperacao +
        QuotedStr(FormatDateTime('yyyy-mm-dd', StrToDate(cxValor.Text)));
      sFiltro := sFiltro + QuotedStr(FormatDateTime('yyyy-mm-dd',
        StrToDate(cxValor.Text)));
    end
    else
    begin
      sLinha := sLinha + sOperacao + cxValor.Text;
      sFiltro := sFiltro + cxValor.Text;;
    end;
  end
  else if cxOperacao.Text = 'iniciando com' then
  begin
    sOperacao := ' LIKE ';
    sFiltro := sFiltro + cxOperacao.Text + ' ';
    if slValores[cxCampos.ItemIndex] = 'String' then
    begin
      sLinha := sLinha + sOperacao + QuotedStr(cxValor.Text);
      sFiltro := sFiltro + QuotedStr(cxValor.Text);
    end
    else if slValores[cxCampos.ItemIndex] = 'DateTime' then
    begin
      sLinha := sLinha + sOperacao +
        QuotedStr(FormatDateTime('yyyy-mm-dd', StrToDate(cxValor.Text)));
      sFiltro := sFiltro + QuotedStr(FormatDateTime('yyyy-mm-dd',
        StrToDate(cxValor.Text)));
    end
    else
    begin
      sLinha := sLinha + sOperacao + cxValor.Text;
      sFiltro := sFiltro + cxValor.Text;;
    end;
  end
  else if cxOperacao.Text = 'terminando com' then
  begin
    sOperacao := ' LIKE ';
    sFiltro := sFiltro + cxOperacao.Text + ' ';
    if slValores[cxCampos.ItemIndex] = 'String' then
    begin
      sLinha := sLinha + sOperacao + QuotedStr(cxValor.Text);
      sFiltro := sFiltro + QuotedStr(cxValor.Text);
    end
    else if slValores[cxCampos.ItemIndex] = 'DateTime' then
    begin
      sLinha := sLinha + sOperacao +
        QuotedStr(FormatDateTime('yyyy-mm-dd', StrToDate(cxValor.Text)));
      sFiltro := sFiltro + QuotedStr(FormatDateTime('yyyy-mm-dd',
        StrToDate(cxValor.Text)));
    end
    else
    begin
      sLinha := sLinha + sOperacao + cxValor.Text;
      sFiltro := sFiltro + cxValor.Text;;
    end;
  end
  else if cxOperacao.Text = 'contendo' then
  begin
    sOperacao := ' LIKE ';
    sFiltro := sFiltro + cxOperacao.Text + ' ';
    if slValores[cxCampos.ItemIndex] = 'String' then
    begin
      sLinha := sLinha + sOperacao + QuotedStr('%' + cxValor.Text + '%');
      sFiltro := sFiltro + QuotedStr(cxValor.Text);
    end
    else if slValores[cxCampos.ItemIndex] = 'DateTime' then
    begin
      sLinha := sLinha + sOperacao +
        QuotedStr('%' + FormatDateTime('yyyy-mm-dd',
        StrToDate(cxValor.Text)) + '%');
      sFiltro := sFiltro + QuotedStr(FormatDateTime('yyyy-mm-dd',
        StrToDate(cxValor.Text)));
    end
    else
    begin
      sLinha := sLinha + sOperacao + '%' + cxValor.Text + '%';
      sFiltro := sFiltro + cxValor.Text;;
    end;
  end
  else if cxOperacao.Text = 'entre' then
  begin
    sOperacao := ' BETWEEN ';
    sFiltro := sFiltro + cxOperacao.Text + ' ';
    if slValores[cxCampos.ItemIndex] = 'String' then
    begin
      sLinha := sLinha + sOperacao +
        QuotedStr(cxValor.Text + ' AND ' + cxValorFinal.Text);
    end
    else if slValores[cxCampos.ItemIndex] = 'DateTime' then
    begin
      sLinha := sLinha + sOperacao +
        QuotedStr(FormatDateTime('yyyy-mm-dd', StrToDate(cxValor.Text))) +
        ' AND ' + QuotedStr(FormatDateTime('yyyy-mm-dd',
        StrToDate(cxValorFinal.Text)));
      sFiltro := sFiltro + QuotedStr(FormatDateTime('yyyy-mm-dd',
        StrToDate(cxValor.Text))) + ' e ' +
        QuotedStr(FormatDateTime('yyyy-mm-dd', StrToDate(cxValorFinal.Text)));
    end
    else
    begin
      sLinha := sLinha + sOperacao + cxValor.Text + ' AND ' + cxValorFinal.Text;
      sFiltro := sFiltro + cxValor.Text + ' e ' + cxValorFinal.Text
    end;
  end
  else if cxOperacao.Text = 'em' then
  begin
    sOperacao := ' IN ';
    sEm := '';
    sFiltro := sFiltro + cxOperacao.Text + ' (';
    sLinha := sLinha + sOperacao + ' (';
    for i := 0 to cxValorEm.Lines.Count - 1 do
    begin
      if (slValores[cxCampos.ItemIndex] = 'String') or
        (slValores[cxCampos.ItemIndex] = 'DateTime') then
      begin
        sItem := cxValorEm.Lines[i];
        if TUtil.Empty(sEm) then
        begin
          sEm := QuotedStr(Trim(sItem));
        end
        else
        begin
          sEm := sEm + ',' + QuotedStr(Trim(sItem));
        end;
      end
      else
      begin
        sItem := cxValorEm.Lines[i];
        if TUtil.Empty(sLinha) then
        begin
          sEm := Trim(sItem);
        end
        else
        begin
          sEm := sEm + ',' + Trim(sItem);
        end;
      end;
    end;
    sLinha := sLinha + sEm + ')';
    sFiltro := sFiltro + sEm + ')';
  end;
  slFiltro.Add(sFiltro);
  slSQLFil.Add(sLinha);
  sLinha := '';
  sFiltro := '';
  cxTextoFiltro.Items := slFiltro;
  cxConcordancia.ItemIndex := -1;
  cxCampos.ItemIndex := -1;
  cxOperacao.ItemIndex := -1;
  cxValor.Clear;
  cxValorFinal.Clear;
  cxValorEm.Clear;
  cxValor.Visible := True;
  cxValorFinal.Visible := False;
  cxValorEm.Visible := False;
end;

end.
