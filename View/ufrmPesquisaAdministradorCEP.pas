unit ufrmPesquisaAdministradorCEP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxLabel, dxBevel, dxSkinsdxStatusBarPainter, dxSkinsdxNavBarPainter, cxClasses,
  dxNavBarBase, dxNavBarCollns, dxNavBar, dxStatusBar, Vcl.ActnList, cxGroupBox, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxTextEdit, clAgentes, cxImageComboBox, cxPCdxBarPopupMenu,
  cxPC, cxMaskEdit, Vcl.ComCtrls, dxCore, cxDateUtils, cxButtonEdit, cxCalc, cxMemo, cxDropDownEdit, cxCalendar, clCentroCusto,
  clEstados, clBancos, dxmdaset;

type
  TfrmPesquisaAdministradorCEP = class(TForm)
    cxLabel27: TcxLabel;
    aclPesquisaAdmCEP: TActionList;
    actPesquisaADMSelecionar: TAction;
    actPesquisaADMSair: TAction;
    cxGroupBox1: TcxGroupBox;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    ds: TDataSource;
    actPesquisaADMAtualizar: TAction;
    cxButton3: TcxButton;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    cxGrid1DBTableView1Column4: TcxGridDBColumn;
    cxGrid1DBTableView1Column5: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxTabSheet2: TcxTabSheet;
    cxGroupBox2: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxCodigo: TcxMaskEdit;
    cxLabel2: TcxLabel;
    CXTipoDocumento: TcxComboBox;
    cxLabel3: TcxLabel;
    cxCPF: TcxMaskEdit;
    cxLabel4: TcxLabel;
    cxNome: TcxTextEdit;
    cxLabel5: TcxLabel;
    cxAlias: TcxTextEdit;
    cxLabel6: TcxLabel;
    cxRGIE: TcxTextEdit;
    cxLabel7: TcxLabel;
    cxIEST: TcxTextEdit;
    cxLabel8: TcxLabel;
    cxIM: TcxTextEdit;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxCRT: TcxMaskEdit;
    cxCNAE: TcxTextEdit;
    cxLabel11: TcxLabel;
    cxCNH: TcxTextEdit;
    cxLabel12: TcxLabel;
    cxValidadeCNH: TcxDateEdit;
    cxLabel13: TcxLabel;
    cxCategoria: TcxTextEdit;
    cxGroupBox3: TcxGroupBox;
    cxObservações: TcxMemo;
    cxLabel50: TcxLabel;
    cxStatus: TcxImageComboBox;
    cxGroupBox4: TcxGroupBox;
    cxLabel14: TcxLabel;
    cxTipoEndereco: TcxComboBox;
    cxLabel15: TcxLabel;
    cxCEP: TcxMaskEdit;
    cxLabel17: TcxLabel;
    cxLogradouro: TcxTextEdit;
    cxLabel18: TcxLabel;
    cxNumero: TcxTextEdit;
    cxLabel19: TcxLabel;
    cxComplemento: TcxTextEdit;
    cxLabel20: TcxLabel;
    cxBairro: TcxTextEdit;
    cxLabel21: TcxLabel;
    cxCidade: TcxTextEdit;
    cxLabel22: TcxLabel;
    cxUF: TcxComboBox;
    cxLabel23: TcxLabel;
    cxReferencia: TcxTextEdit;
    cxButton7: TcxButton;
    cxGroupBox5: TcxGroupBox;
    cxLabel24: TcxLabel;
    cxVerba: TcxCalcEdit;
    cxLabel25: TcxLabel;
    cxFormaPgto: TcxComboBox;
    cxLabel26: TcxLabel;
    cxTipoConta: TcxComboBox;
    cxLabel16: TcxLabel;
    cxBanco: TcxButtonEdit;
    cxNomeBanco: TcxTextEdit;
    cxLabel28: TcxLabel;
    cxAgencia: TcxTextEdit;
    cxLabel29: TcxLabel;
    cxConta: TcxTextEdit;
    cxLabel30: TcxLabel;
    cxFavorecido: TcxTextEdit;
    cxLabel31: TcxLabel;
    cxCPFFavorecido: TcxMaskEdit;
    cxLabel32: TcxLabel;
    cxCentroCusto: TcxButtonEdit;
    cxDescricaoCentroCusto: TcxTextEdit;
    cxLabel33: TcxLabel;
    cxGrupoVerba: TcxComboBox;
    cxGroupBox6: TcxGroupBox;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1SEQ_CONTATO: TcxGridDBColumn;
    cxGrid1DBTableView1DES_CONTATO: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_TELEFONE: TcxGridDBColumn;
    cxGrid1DBTableView1DES_EMAIL: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    actCadastroRetornar: TAction;
    cxButton4: TcxButton;
    tbContatos: TdxMemData;
    tbContatosSEQ_CONTATO: TIntegerField;
    tbContatosDES_CONTATO: TStringField;
    tbContatosNUM_TELEFONE: TStringField;
    tbContatosDES_EMAIL: TStringField;
    ds1: TDataSource;
    procedure actPesquisaADMSelecionarExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actPesquisaADMSairExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actPesquisaADMAtualizarExecute(Sender: TObject);
    procedure cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
      AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure actCadastroRetornarExecute(Sender: TObject);
  private
    { Private declarations }
    procedure SetupDados;
    procedure Modo;
  public
    { Public declarations }
  end;

var
  frmPesquisaAdministradorCEP : TfrmPesquisaAdministradorCEP;
  agente                      : TAgente;
  banco                       : TBancos;
  centrocusto                 : TCentroCusto;
  estado                      : TEstados;
implementation

{$R *.dfm}

uses
  udm, uGlobais, clUtil, ufrmPrincipal;

procedure TfrmPesquisaAdministradorCEP.actCadastroRetornarExecute(Sender: TObject);
begin
   TUtil.LimparFields(Self);
   agente.Operacao :=  'X';
   Modo;
  cxPageControl1.ActivePageIndex := 0;
end;

procedure TfrmPesquisaAdministradorCEP.actPesquisaADMAtualizarExecute(Sender: TObject);
begin
  dm.ZConn.PingServer;
  dm.qryGrid.Open;
  dm.qryGrid.Refresh;
  cxGrid1.SetFocus;
end;

procedure TfrmPesquisaAdministradorCEP.actPesquisaADMSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmPesquisaAdministradorCEP.actPesquisaADMSelecionarExecute(Sender: TObject);
begin
  if (not dm.qryGrid.IsEmpty) then begin
    TUtil.LimparFields(Self);
    agente.SetupClassFromGrid;
    SetupDados;
    agente.Operacao :=  'S';
    Modo;
    cxPageControl1.ActivePageIndex := 1;
  end;
end;

procedure TfrmPesquisaAdministradorCEP.cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  actPesquisaADMSelecionarExecute(Sender);
end;

procedure TfrmPesquisaAdministradorCEP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm.qryGrid.Close;
  dm.qryGrid.SQL.Clear;
  agente.Free;
  banco.Free;
  centrocusto.Free;
  estado.Free;
  Action                      :=  caFree;
  frmPesquisaAdministradorCEP :=  nil;
end;

procedure TfrmPesquisaAdministradorCEP.FormShow(Sender: TObject);
begin
  agente          :=  TAgente.Create;
  estado          :=  TEstados.Create;
  banco           :=  TBancos.Create;
  centrocusto         :=  TCentroCusto.Create;
  if (not agente.Search('','')) then begin
    Exit;
  end;
end;

procedure TfrmPesquisaAdministradorCEP.SetupDados;
begin
  cxCodigo.Text         :=  agente.Codigo;
  cxTipoDocumento.Text  :=  agente.TipoDoc;
  cxCPF.Text            :=  agente.Cnpj;
  cxNome.Text           :=  agente.Razao;
  cxAlias.Text          :=  agente.Fantasia;
  cxRGIE.Text           :=  agente.IE;
  cxIEST.Text           :=  agente.IEST;
  cxIM.Text             :=  agente.IM;
  cxCNAE.Text           :=  agente.Cnae;
  cxCRT.Text            :=  IntToStr(agente.Crt);
  cxCNH.Text            :=  agente.Cnh;
  cxValidadeCNH.Date    :=  agente.ValidadeCnh;
  cxCategoria.Text      :=  agente.CategoriaCnh;
  cxObservações.Text    :=  agente.Obs;
  cxVerba.Value         :=  agente.Verba;
  cxFormaPgto.Text      :=  agente.Forma;
  cxTipoConta.Text      :=  agente.TipoConta;
  cxBanco.Text          :=  agente.Banco;
  if TUtil.Empty(cxBanco.Text) then begin
    cxBanco.Text  :=  '0';
    Exit;
  end;
  if banco.getObject(cxBanco.Text,'CODIGO') then begin
    cxNomeBanco.Text  :=  banco.Nome;
  end
  else begin
    cxNomeBanco.Text  :=  'BANCO NÃO CADASTRADO';
  end;
  cxAgencia.Text        :=  agente.Agencia;
  cxConta.Text          :=  agente.NumeroConta;
  cxFavorecido.Text     :=  agente.Favorecido;
  cxCPFFavorecido.Text  :=  agente.CpfCnpjFavorecido;
  cxCentroCusto.Text    :=  IntToStr(agente.CentroCusto);
  if TUtil.Empty(cxCentroCusto.Text) then begin
    cxCentroCusto.Text  :=  '0';
    Exit;
  end;
  if centrocusto.getObject(cxCentroCusto.Text,'CODIGO') then begin
    cxDescricaoCentroCusto.Text  :=  centrocusto.Descricao;
  end
  else begin
    cxDescricaoCentroCusto.Text  :=  'CENTRO DE CUSTO NÃO CADASTRADO';
  end;
  cxGrupoVerba.Text     :=  IntToStr(agente.Grupo);
  cxStatus.EditValue    :=  agente.Status;
end;

procedure TfrmPesquisaAdministradorCEP.Modo;
begin
  if agente.Operacao = 'I' then begin
    actCadastroRetornar.Enabled         :=  True;
    //actCadastroExcluir.Enabled         :=  False;
    //actCadastroCancelar.Enabled        :=  True;
    //actCadastroSalvar.Enabled          :=  True;
    actPesquisaADMSair.Enabled          :=  True;
    actPesquisaADMSelecionar.Enabled    := False;
    actPesquisaADMAtualizar.Enabled     :=  False;
{    actCadastroExcluirEndereco.Enabled  :=  False;
    with cxGrid1DBTableView1.OptionsData do begin
      Deleting  :=  True;
      Editing   :=  True;
      Inserting :=  True;
    end;}
  end
  else if agente.Operacao = 'U' then begin
    actCadastroRetornar.Enabled         :=  True;
    //actCadastroExcluir.Enabled         :=  True;
    //actCadastroCancelar.Enabled        :=  True;
    //actCadastroSalvar.Enabled          :=  True;
    actPesquisaADMSair.Enabled          :=  True;
    actPesquisaADMSelecionar.Enabled    := False;
    actPesquisaADMAtualizar.Enabled     :=  False;
{    actCadastroExcluirEndereco.Enabled  :=  True;
    with cxGrid1DBTableView1.OptionsData do begin
      Deleting  :=  True;
      Editing   :=  True;
      Inserting :=  True;
    end;}
  end
  else if agente.Operacao = 'S' then begin
    actCadastroRetornar.Enabled         :=  True;
    //actCadastroExcluir.Enabled         :=  True;
    //actCadastroCancelar.Enabled        :=  False
    //actCadastroSalvar.Enabled          :=  False;
    actPesquisaADMSair.Enabled          :=  True;
    actPesquisaADMSelecionar.Enabled    :=  False;
    actPesquisaADMAtualizar.Enabled     :=  False;
{    actCadastroExcluirEndereco.Enabled  :=  False;
    with cxGrid1DBTableView1.OptionsData do begin
      Deleting  :=  False;
      Editing   :=  False;
      Inserting :=  False;
    end}
  end
  else if agente.Operacao = 'X' then begin
    actCadastroRetornar.Enabled         :=  False;
    //actCadastroExcluir.Enabled         :=  False;
    //actCadastroCancelar.Enabled        :=  False
    //actCadastroSalvar.Enabled          :=  False;
    actPesquisaADMSair.Enabled          :=  True;
    actPesquisaADMSelecionar.Enabled    :=  True;
    actPesquisaADMAtualizar.Enabled     :=  True;
{    actCadastroExcluirEndereco.Enabled  :=  False;
    with cxGrid1DBTableView1.OptionsData do begin
      Deleting  :=  False;
      Editing   :=  False;
      Inserting :=  False;
    end;}
  end;
end;


end.
