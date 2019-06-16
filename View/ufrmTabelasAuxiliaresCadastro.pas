unit ufrmTabelasAuxiliaresCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxLabel, dxSkinscxPCPainter, dxLayoutContainer, dxLayoutControl, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxmdaset, cxMaskEdit, cxTextEdit, cxImageComboBox, cxCheckBox, cxBlobEdit,
  DAO.TipoCadastro, Model.TipoCadastro, Generics.Collections, Model.Departamentos, DAO.Departamentos, Model.Funcoes, DAO.Funcoes,
  Model.StatusCadastro, DAO.StatusCadastro, dxLayoutControlAdapters, Vcl.Menus, System.Actions, Vcl.ActnList, Vcl.StdCtrls,
  cxButtons;

type
  TfrmTabelasAuxiliaresCadastro = class(TForm)
    cxLabel27: TcxLabel;
    lcMainGroup_Root: TdxLayoutGroup;
    lcMain: TdxLayoutControl;
    lgTipoCadastro: TdxLayoutGroup;
    tvTipoCadastro: TcxGridDBTableView;
    lvTipoCadastro: TcxGridLevel;
    grdTipoCadastro: TcxGrid;
    liGrdTipoCadastro: TdxLayoutItem;
    tbTipoCadastro: TdxMemData;
    tbTipoCadastroCOD_TIPO: TIntegerField;
    tbTipoCadastroDES_TIPO: TStringField;
    tbTipoCadastroDOM_PESSOA: TIntegerField;
    tbTipoCadastroDES_LOG: TMemoField;
    dsTipoCadastro: TDataSource;
    tvTipoCadastroCOD_TIPO: TcxGridDBColumn;
    tvTipoCadastroDES_TIPO: TcxGridDBColumn;
    tvTipoCadastroDOM_PESSOA: TcxGridDBColumn;
    tvTipoCadastroDOM_RH: TcxGridDBColumn;
    tvTipoCadastroDOM_JORNAL: TcxGridDBColumn;
    tvTipoCadastroDOM_EXPRESSAS: TcxGridDBColumn;
    tvTipoCadastroDES_LOG: TcxGridDBColumn;
    lcDepartamentos: TdxLayoutGroup;
    dsDepartamento: TDataSource;
    tbDepartamentos: TdxMemData;
    tbDepartamentosCOD_DEPARTAMENTO: TIntegerField;
    tbDepartamentosDES_DEPARTAMENTO: TStringField;
    tbDepartamentosDES_LOG: TMemoField;
    tvDepartamentos: TcxGridDBTableView;
    lvDepartamentos: TcxGridLevel;
    grdDepartamentos: TcxGrid;
    liGrdDepartamento: TdxLayoutItem;
    tvDepartamentosRecId: TcxGridDBColumn;
    tvDepartamentosCOD_DEPARTAMENTO: TcxGridDBColumn;
    tvDepartamentosDES_DEPARTAMENTO: TcxGridDBColumn;
    tvDepartamentosDES_LOG: TcxGridDBColumn;
    lgFuncoes: TdxLayoutGroup;
    tbFuncoes: TdxMemData;
    tbFuncoesID_FUNCAO: TIntegerField;
    tbFuncoesDES_FUNCAO: TStringField;
    tbFuncoesDES_LOG: TMemoField;
    tbStatus: TdxMemData;
    tbStatusID_STATUS: TIntegerField;
    tbStatusDES_STATUS: TStringField;
    tbStatusDES_LOG: TMemoField;
    tvFuncoes: TcxGridDBTableView;
    lvFuncoes: TcxGridLevel;
    grdFuncoes: TcxGrid;
    liGrdFuncao: TdxLayoutItem;
    dsFuncoes: TDataSource;
    tvFuncoesRecId: TcxGridDBColumn;
    tvFuncoesID_FUNCAO: TcxGridDBColumn;
    tvFuncoesDES_FUNCAO: TcxGridDBColumn;
    tvFuncoesDES_LOG: TcxGridDBColumn;
    lgStatus: TdxLayoutGroup;
    tvStatus: TcxGridDBTableView;
    lvStatus: TcxGridLevel;
    grdStatus: TcxGrid;
    lcMainItem3: TdxLayoutItem;
    dsStatus: TDataSource;
    tvStatusRecId: TcxGridDBColumn;
    tvStatusID_STATUS: TcxGridDBColumn;
    tvStatusDES_STATUS: TcxGridDBColumn;
    tvStatusDOM_ATIVO: TcxGridDBColumn;
    tvStatusDES_LOG: TcxGridDBColumn;
    cxButton1: TcxButton;
    lcMainItem1: TdxLayoutItem;
    aclTabelasAuxiliares: TActionList;
    aclFechar: TAction;
    tbTipoCadastroDOM_RH: TBooleanField;
    tbTipoCadastroDOM_JORNAL: TBooleanField;
    tbTipoCadastroDOM_EXPRESSAS: TBooleanField;
    tbStatusDOM_ATIVO: TBooleanField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbTipoCadastroAfterInsert(DataSet: TDataSet);
    procedure tbTipoCadastroAfterPost(DataSet: TDataSet);
    procedure tbTipoCadastroBeforeDelete(DataSet: TDataSet);
    procedure tbTipoCadastroBeforePost(DataSet: TDataSet);
    procedure tbDepartamentosAfterInsert(DataSet: TDataSet);
    procedure tbDepartamentosAfterPost(DataSet: TDataSet);
    procedure tbDepartamentosBeforeDelete(DataSet: TDataSet);
    procedure tbDepartamentosBeforePost(DataSet: TDataSet);
    procedure tbFuncoesAfterInsert(DataSet: TDataSet);
    procedure tbFuncoesAfterPost(DataSet: TDataSet);
    procedure tbFuncoesBeforeDelete(DataSet: TDataSet);
    procedure tbFuncoesBeforePost(DataSet: TDataSet);
    procedure tbStatusAfterInsert(DataSet: TDataSet);
    procedure tbStatusAfterPost(DataSet: TDataSet);
    procedure tbStatusBeforeDelete(DataSet: TDataSet);
    procedure tbStatusBeforePost(DataSet: TDataSet);
    procedure aclFecharExecute(Sender: TObject);
  private
    { Private declarations }
    procedure PopulaTipoCadastro;
    procedure SetupTipoCadastro;
    procedure ExcluirTipoCadastro;
    procedure PopulaDepartamentos;
    procedure SetupDepartamentos;
    procedure ExcluirDepartamento;
    procedure PopulaFuncoes;
    procedure SetupFuncoes;
    procedure ExcluirFuncoes;
    procedure PopulaStatus;
    procedure SetupStatus;
    procedure ExcluirStatus;
  public
    { Public declarations }
  end;

var
  frmTabelasAuxiliaresCadastro: TfrmTabelasAuxiliaresCadastro;
  tipocadastro : TTipoCadastro;
  tipocadastroDAO : TTipoCadastroDAO;
  tiposcadastro : TObjectList<TTipoCadastro>;
  departamento : TDepartamentos;
  departamentoDAO : TDepartamentosDAO;
  departamentos : TObjectList<TDepartamentos>;
  funcao : TFuncoes;
  funcaoDAO : TFuncoesDAO;
  funcoes : TObjectList<TFuncoes>;
  status : TStatusCadastro;
  statusDAO : TStatusCadastroDAO;
  statusC : TObjectList<TStatusCadastro>;
implementation

{$R *.dfm}

uses udm, ufrmProcesso, uGlobais;

procedure TfrmTabelasAuxiliaresCadastro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tbTipoCadastro.Close;
  Action := caFree;
  frmTabelasAuxiliaresCadastro := Nil;
end;

procedure TfrmTabelasAuxiliaresCadastro.FormCreate(Sender: TObject);
begin
  PopulaTipoCadastro;
  PopulaDepartamentos;
  PopulaFuncoes;
  PopulaStatus;
end;

procedure TfrmTabelasAuxiliaresCadastro.PopulaTipoCadastro;
var
  tipoTmp : TTipoCadastro;
  dPosicao: Double;
  iContador: Integer;
  iRecords: Integer;
begin
  try
    if not Assigned(frmProcesso) then
    begin
      frmProcesso := TfrmProcesso.Create(Application);
    end;
    dPosicao := 0;
    tbTipoCadastro.IsLoading := True;
    frmProcesso.cxGroupBox1.Caption := 'Populando Tipos de Cadastro. Aguarde...';
    frmProcesso.cxGroupBox1.Refresh;
    frmProcesso.cxProgressBar1.Position := 0;
    frmProcesso.Show;
    tbTipoCadastro.Close;
    tbTipoCadastro.Open;
    tipocadastroDAO := TTipoCadastroDAO.Create();
    tiposcadastro := tipocadastroDAO.FindTipo('');
    for tipoTmp in tiposcadastro do
    begin
      tbTipoCadastro.Insert;
      tbTipoCadastroCOD_TIPO.AsInteger := tipoTmp.Codigo;
      tbTipoCadastroDES_TIPO.AsString := tipoTmp.Descricao;
      tbTipoCadastroDOM_PESSOA.AsInteger := tipoTmp.Pessoa;
      tbTipoCadastroDOM_RH.AsBoolean := tipoTmp.RH;
      tbTipoCadastroDOM_JORNAL.AsBoolean := tipoTmp.Jornal;
      tbTipoCadastroDOM_EXPRESSAS.AsBoolean := tipoTmp.Expressas;
      tbTipoCadastroDES_LOG.AsString := tipoTmp.Log;
      tbTipoCadastro.Post;
      dPosicao := (iContador / iRecords) * 100;
      Inc(iContador,1);
      frmProcesso.cxProgressBar1.Position := dPosicao;
      frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
      frmProcesso.cxProgressBar1.Refresh;
    end;
    if not tbTipoCadastro.IsEmpty then
    begin
      tbTipoCadastro.First;
    end;
  finally
    tipocadastroDAO.Free;
    tbTipoCadastro.IsLoading := False;
    frmProcesso.Close;
    FreeAndNil(frmProcesso);
  end;
end;

procedure TfrmTabelasAuxiliaresCadastro.tbDepartamentosAfterInsert(DataSet: TDataSet);
begin
  if not tbDepartamentos.IsLoading then
  begin
    tbDepartamentosCOD_DEPARTAMENTO.AsInteger := 0;
    tvDepartamentosDES_DEPARTAMENTO.FocusWithSelection;
  end;
end;

procedure TfrmTabelasAuxiliaresCadastro.tbDepartamentosAfterPost(DataSet: TDataSet);
begin
  if tbDepartamentos.IsLoading then
  begin
    Exit;
  end;
  try
    departamento := TDepartamentos.Create();
    departamentoDAO := TDepartamentosDAO.Create();
    SetupDepartamentos();
    if departamento.Codigo = 0 then
    begin
      if not departamentoDAO.Insert(departamento) then
      begin
        Application.MessageBox('Erro ao gravar dados!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONERROR);
      end;
    end
    else
    begin
      if not departamentoDAO.Update(departamento) then
      begin
        Application.MessageBox('Erro ao gravar dados!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONERROR);
      end;
    end;
    Application.MessageBox('Dados gravados com sucesso!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONINFORMATION);
  finally
    if tbDepartamentosCOD_DEPARTAMENTO.AsInteger = 0 then
    begin
      tbDepartamentos.IsLoading := True;
      tbDepartamentos.Edit;
      tbDepartamentosCOD_DEPARTAMENTO.AsInteger := departamento.Codigo;
      tbDepartamentos.Post;
      tbDepartamentos.IsLoading := False;
    end;
    departamento.Free;
    departamentoDAO.Free;
  end;
end;

procedure TfrmTabelasAuxiliaresCadastro.tbDepartamentosBeforeDelete(DataSet: TDataSet);
begin
  ExcluirDepartamento;
end;

procedure TfrmTabelasAuxiliaresCadastro.tbDepartamentosBeforePost(DataSet: TDataSet);
var
  sLog : TStringList;
  sMensagem : String;
begin
  if Application.MessageBox('Confirma gravar os dados?', PChar('Atenção ' + uGlobais.sUsuario), MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Abort;
    Exit;
  end;
  if DataSet.FieldByName('COD_DEPARTAMENTO').AsInteger = 0 then
  begin
    sMensagem := ' inclusão feita por ';
  end
  else
  begin
    sMensagem := ' alteração feita por ';
  end;
  sLog := TStringList.Create;
  sLog.Append(DataSet.FieldByName('DES_LOG').asString);
  sLog.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss',Now) + sMensagem + uGlobais.sUsuario);
  Dataset.FieldByName('DES_LOG').AsString := sLog.Text;
  sLog.Free;
end;

procedure TfrmTabelasAuxiliaresCadastro.tbFuncoesAfterInsert(DataSet: TDataSet);
begin
  if not tbFuncoes.IsLoading then
  begin
    tbFuncoesID_FUNCAO.AsInteger := 0;
    tvFuncoesID_FUNCAO.FocusWithSelection;
  end;
end;

procedure TfrmTabelasAuxiliaresCadastro.tbFuncoesAfterPost(DataSet: TDataSet);
begin
  if tbFuncoes.IsLoading then
  begin
    Exit;
  end;
  try
    funcao := TFuncoes.Create();
    funcaoDAO := TFuncoesDAO.Create();
    SetupFuncoes();
    if funcao.ID = 0 then
    begin
      if not funcaoDAO.Insert(funcao) then
      begin
        Application.MessageBox('Erro ao gravar dados!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONERROR);
      end;
    end
    else
    begin
      if not funcaoDAO.Update(funcao) then
      begin
        Application.MessageBox('Erro ao gravar dados!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONERROR);
      end;
    end;
    Application.MessageBox('Dados gravados com sucesso!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONINFORMATION);
  finally
    if tbFuncoesID_FUNCAO.AsInteger = 0 then
    begin
      tbFuncoes.IsLoading := True;
      tbFuncoes.Edit;
      tbFuncoesID_FUNCAO.AsInteger := funcao.ID;
      tbFuncoes.Post;
      tbFuncoes.IsLoading := False;
    end;
    funcao.Free;
    funcaoDAO.Free;
  end;
end;

procedure TfrmTabelasAuxiliaresCadastro.tbFuncoesBeforeDelete(DataSet: TDataSet);
begin
  ExcluirFuncoes;
end;

procedure TfrmTabelasAuxiliaresCadastro.tbFuncoesBeforePost(DataSet: TDataSet);
var
  sLog : TStringList;
  sMensagem : String;
begin
  if Application.MessageBox('Confirma gravar os dados?', PChar('Atenção ' + uGlobais.sUsuario), MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Abort;
    Exit;
  end;
  if DataSet.FieldByName('ID_FUNCAO').AsInteger = 0 then
  begin
    sMensagem := ' inclusão feita por ';
  end
  else
  begin
    sMensagem := ' alteração feita por ';
  end;
  sLog := TStringList.Create;
  sLog.Append(DataSet.FieldByName('DES_LOG').asString);
  sLog.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss',Now) + sMensagem + uGlobais.sUsuario);
  Dataset.FieldByName('DES_LOG').AsString := sLog.Text;
  sLog.Free;
end;

procedure TfrmTabelasAuxiliaresCadastro.tbStatusAfterInsert(DataSet: TDataSet);
begin
  if not tbStatus.IsLoading then
  begin
    tbStatusID_STATUS.AsInteger := 0;
    tvStatusID_STATUS.FocusWithSelection;
  end;
end;

procedure TfrmTabelasAuxiliaresCadastro.tbStatusAfterPost(DataSet: TDataSet);
begin
  if tbStatus.IsLoading then
  begin
    Exit;
  end;
  try
    status := TStatusCadastro.Create();
    statusDAO := TStatusCadastroDAO.Create();
    SetupStatus();
    if status.ID = 0 then
    begin
      if not statusDAO.Insert(status) then
      begin
        Application.MessageBox('Erro ao gravar dados!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONERROR);
      end;
    end
    else
    begin
      if not statusDAO.Update(status) then
      begin
        Application.MessageBox('Erro ao gravar dados!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONERROR);
      end;
    end;
    Application.MessageBox('Dados gravados com sucesso!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONINFORMATION);
  finally
    if tbStatusID_STATUS.AsInteger = 0 then
    begin
      tbStatus.IsLoading := True;
      tbStatus.Edit;
      tbStatusID_STATUS.AsInteger := status.ID;
      tbStatus.Post;
      tbStatus.IsLoading := False;
    end;
    status.Free;
    statusDAO.Free;
  end;
end;

procedure TfrmTabelasAuxiliaresCadastro.tbStatusBeforeDelete(DataSet: TDataSet);
begin
  ExcluirStatus;
end;

procedure TfrmTabelasAuxiliaresCadastro.tbStatusBeforePost(DataSet: TDataSet);
var
  sLog : TStringList;
  sMensagem : String;
begin
  if Application.MessageBox('Confirma gravar os dados?', PChar('Atenção ' + uGlobais.sUsuario), MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Abort;
    Exit;
  end;
  if DataSet.FieldByName('ID_STATUS').AsInteger = 0 then
  begin
    sMensagem := ' inclusão feita por ';
  end
  else
  begin
    sMensagem := ' alteração feita por ';
  end;
  sLog := TStringList.Create;
  sLog.Append(DataSet.FieldByName('DES_LOG').asString);
  sLog.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss',Now) + sMensagem + uGlobais.sUsuario);
  Dataset.FieldByName('DES_LOG').AsString := sLog.Text;
  sLog.Free;
end;

procedure TfrmTabelasAuxiliaresCadastro.tbTipoCadastroAfterInsert(DataSet: TDataSet);
begin
  if not tbTipoCadastro.IsLoading then
  begin
    tbTipoCadastroCOD_TIPO.AsInteger := 0;
    tbTipoCadastroDOM_PESSOA.AsInteger := 0;
    tvTipoCadastroDES_TIPO.FocusWithSelection;
  end;
end;

procedure TfrmTabelasAuxiliaresCadastro.tbTipoCadastroAfterPost(DataSet: TDataSet);
begin
  if tbTipoCadastro.IsLoading then
  begin
    Exit;
  end;
  try
    tipocadastro := TTipoCadastro.Create();
    tipocadastroDAO := TTipoCadastroDAO.Create();
    SetupTipoCadastro();
    if tipocadastro.Codigo = 0 then
    begin
      if not tipocadastroDAO.Insert(tipocadastro) then
      begin
        Application.MessageBox('Erro ao gravar dados!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONERROR);
      end;
    end
    else
    begin
      if not tipocadastroDAO.Update(tipocadastro) then
      begin
        Application.MessageBox('Erro ao gravar dados!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONERROR);
      end;
    end;
    Application.MessageBox('Dados gravados com sucesso!', PChar('Atenção ' + uGlobais.sUsuario), MB_OK + MB_ICONINFORMATION);
  finally
    if tbTipoCadastroCOD_TIPO.AsInteger = 0 then
    begin
      tbTipoCadastro.IsLoading := True;
      tbTipoCadastro.Edit;
      tbTipoCadastroCOD_TIPO.AsInteger := tipocadastro.Codigo;
      tbTipoCadastro.Post;
      tbTipoCadastro.IsLoading := False;
    end;
    tipocadastro.Free;
    tipocadastroDAO.Free;
  end;
end;

procedure TfrmTabelasAuxiliaresCadastro.tbTipoCadastroBeforeDelete(DataSet: TDataSet);
begin
  ExcluirTipoCadastro;
end;

procedure TfrmTabelasAuxiliaresCadastro.tbTipoCadastroBeforePost(DataSet: TDataSet);
var
  sLog : TStringList;
  sMensagem : String;
begin
  if Application.MessageBox('Confirma gravar os dados?', PChar('Atenção ' + uGlobais.sUsuario), MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Abort;
    Exit;
  end;
  if DataSet.FieldByName('COD_TIPO').AsInteger = 0 then
  begin
    sMensagem := ' inclusão feita por ';
  end
  else
  begin
    sMensagem := ' alteração feita por ';
  end;
  sLog := TStringList.Create;
  sLog.Append(DataSet.FieldByName('DES_LOG').asString);
  sLog.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss',Now) + sMensagem + uGlobais.sUsuario);
  Dataset.FieldByName('DES_LOG').AsString := sLog.Text;
  sLog.Free;
end;

procedure TfrmTabelasAuxiliaresCadastro.SetupTipoCadastro;
begin
  tipocadastro.Codigo := tbTipoCadastroCOD_TIPO.AsInteger;
  tipocadastro.Descricao := tbTipoCadastroDES_TIPO.AsString;
  tipocadastro.Pessoa := tbTipoCadastroDOM_PESSOA.AsInteger;
  tipocadastro.RH := tbTipoCadastroDOM_RH.AsBoolean;
  tipocadastro.Jornal := tbTipoCadastroDOM_JORNAL.AsBoolean;
  tipocadastro.Expressas := tbTipoCadastroDOM_EXPRESSAS.AsBoolean;
  tipocadastro.Log := tbTipoCadastroDES_LOG.AsString;
end;

procedure TfrmTabelasAuxiliaresCadastro.ExcluirTipoCadastro;
var
  tipocadastroDAO : TTipoCadastroDAO;
  sFiltro : String;
begin
  try
    tipocadastroDAO := TTipoCadastroDAO.Create();
    if Application.MessageBox('Confirma a exclusão?', PChar('Atenção ' + uGlobais.sUsuario), MB_YESNO + MB_ICONQUESTION) = IDNO then
    begin
      Abort;
      Exit;
    end;
    sFiltro := 'WHERE COD_TIPO = ' + tbTipoCadastroCOD_TIPO.AsString;
    if not tipocadastroDAO.Delete(sFiltro) then
    begin
      Application.MessageBox(PChar('Erro ao excluir o Tipo de Cadastro ' + tbTipoCadastroCOD_TIPO.AsString + ' !'),
                             Pchar('Atenção ' + uglobais.sUsuario), MB_OK + MB_ICONERROR);
      Abort;
      Exit;
    end;
  finally
    tipocadastroDAO.Free;
  end;
end;

procedure TfrmTabelasAuxiliaresCadastro.PopulaDepartamentos;
var
  departamentoTmp : TDepartamentos;
  dPosicao: Double;
  iContador: Integer;
  iRecords: Integer;
begin
  try
    if not Assigned(frmProcesso) then
    begin
      frmProcesso := TfrmProcesso.Create(Application);
    end;
    dPosicao := 0;
    tbDepartamentos.IsLoading := True;
    frmProcesso.cxGroupBox1.Caption := 'Populando Departamentos. Aguarde...';
    frmProcesso.cxGroupBox1.Refresh;
    frmProcesso.cxProgressBar1.Position := 0;
    frmProcesso.Show;
    tbDepartamentos.Close;
    tbDepartamentos.Open;
    departamentoDAO := TDepartamentosDAO.Create();
    departamentos := departamentoDAO.FindDepartamento('');
    for departamentoTmp in departamentos do
    begin
      tbDepartamentos.Insert;
      tbDepartamentosCOD_DEPARTAMENTO.AsInteger := departamentoTmp.Codigo;
      tbDepartamentosDES_DEPARTAMENTO.AsString := departamentoTmp.Descricao;
      tbDepartamentosDES_LOG.AsString := departamentoTmp.Log;
      tbDepartamentos.Post;
      dPosicao := (iContador / iRecords) * 100;
      Inc(iContador,1);
      frmProcesso.cxProgressBar1.Position := dPosicao;
      frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
      frmProcesso.cxProgressBar1.Refresh;
    end;
    if not tbDepartamentos.IsEmpty then
    begin
      tbDepartamentos.First;
    end;
  finally
    departamentoDAO.Free;
    tbDepartamentos.IsLoading := False;
    frmProcesso.Close;
    FreeAndNil(frmProcesso);
  end;
end;

procedure TfrmTabelasAuxiliaresCadastro.SetupDepartamentos;
begin
  departamento.Codigo := tbDepartamentosCOD_DEPARTAMENTO.AsInteger;
  departamento.Descricao := tbDepartamentosDES_DEPARTAMENTO.AsString;
  departamento.Log := tbDepartamentosDES_LOG.AsString;
end;

procedure TfrmTabelasAuxiliaresCadastro.aclFecharExecute(Sender: TObject);
begin
  Perform(WM_CLOSE, 0, 0);
end;

procedure TfrmTabelasAuxiliaresCadastro.ExcluirDepartamento;
var
  departamentoDAO : TDepartamentosDAO;
  sFiltro : String;
begin
  try
    departamentoDAO := TDepartamentosDAO.Create();
    if Application.MessageBox('Confirma a exclusão?', PChar('Atenção ' + uGlobais.sUsuario), MB_YESNO + MB_ICONQUESTION) = IDNO then
    begin
      Abort;
      Exit;
    end;
    sFiltro := 'WHERE COD_DEPARTAMENTO = ' + tbDepartamentosCOD_DEPARTAMENTO.AsString;
    if not departamentoDAO.Delete(sFiltro) then
    begin
      Application.MessageBox(PChar('Erro ao excluir o DEpartamento ' + tbDepartamentosCOD_DEPARTAMENTO.AsString + ' !'),
                             Pchar('Atenção ' + uglobais.sUsuario), MB_OK + MB_ICONERROR);
      Abort;
      Exit;
    end;
  finally
    departamentoDAO.Free;
  end;
end;

procedure TfrmTabelasAuxiliaresCadastro.PopulaFuncoes;
var
  funcaoTmp : TFuncoes;
  dPosicao: Double;
  iContador: Integer;
  iRecords: Integer;
begin
  try
    if not Assigned(frmProcesso) then
    begin
      frmProcesso := TfrmProcesso.Create(Application);
    end;
    dPosicao := 0;
    tbFuncoes.IsLoading := True;
    frmProcesso.cxGroupBox1.Caption := 'Populando as Funçoes. Aguarde...';
    frmProcesso.cxGroupBox1.Refresh;
    frmProcesso.cxProgressBar1.Position := 0;
    frmProcesso.Show;
    tbFuncoes.Close;
    tbFuncoes.Open;
    funcaoDAO := TFuncoesDAO.Create();
    funcoes := funcaoDAO.FindFuncoes('');
    for funcaoTmp in funcoes do
    begin
      tbFuncoes.Insert;
      tbFuncoesID_FUNCAO.AsInteger := funcaoTmp.ID;
      tbFuncoesDES_FUNCAO.AsString := funcaoTmp.Descricao;
      tbFuncoesDES_LOG.AsString := funcaoTmp.Log;
      tbFuncoes.Post;
      dPosicao := (iContador / iRecords) * 100;
      Inc(iContador,1);
      frmProcesso.cxProgressBar1.Position := dPosicao;
      frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
      frmProcesso.cxProgressBar1.Refresh;
    end;
    if not tbFuncoes.IsEmpty then
    begin
      tbFuncoes.First;
    end;
  finally
    funcaoDAO.Free;
    tbFuncoes.IsLoading := False;
    frmProcesso.Close;
    FreeAndNil(frmProcesso);
  end;
end;

procedure TfrmTabelasAuxiliaresCadastro.SetupFuncoes;
begin
  funcao.ID := tbFuncoesID_FUNCAO.AsInteger;
  funcao.Descricao := tbFuncoesDES_FUNCAO.AsString;
  funcao.Log := tbFuncoesDES_LOG.AsString;
end;

procedure TfrmTabelasAuxiliaresCadastro.ExcluirFuncoes;
var
  funcaoDAO : TFuncoesDAO;
  sFiltro : String;
begin
  try
    funcaoDAO := TFuncoesDAO.Create();
    if Application.MessageBox('Confirma a exclusão?', PChar('Atenção ' + uGlobais.sUsuario), MB_YESNO + MB_ICONQUESTION) = IDNO then
    begin
      Abort;
      Exit;
    end;
    sFiltro := 'WHERE ID_FUNCAO = ' + tbFuncoesID_FUNCAO.AsString;
    if not funcaoDAO.Delete(sFiltro) then
    begin
      Application.MessageBox(PChar('Erro ao excluir a Função ' + tbDepartamentosCOD_DEPARTAMENTO.AsString + ' !'),
                             Pchar('Atenção ' + uglobais.sUsuario), MB_OK + MB_ICONERROR);
      Abort;
      Exit;
    end;
  finally
    funcaoDAO.Free;
  end;
end;

procedure TfrmTabelasAuxiliaresCadastro.PopulaStatus;
var
  statusTmp : TStatusCadastro;
  dPosicao: Double;
  iContador: Integer;
  iRecords: Integer;
begin
  try
    if not Assigned(frmProcesso) then
    begin
      frmProcesso := TfrmProcesso.Create(Application);
    end;
    dPosicao := 0;
    tbStatus.IsLoading := True;
    frmProcesso.cxGroupBox1.Caption := 'Populando os Status. Aguarde...';
    frmProcesso.cxGroupBox1.Refresh;
    frmProcesso.cxProgressBar1.Position := 0;
    frmProcesso.Show;
    tbStatus.Close;
    tbStatus.Open;
    statusDAO := TStatusCadastroDAO.Create();
    statusC := statusDAO.FindStatus('');
    for statusTmp in statusC do
    begin
      tbStatus.Insert;
      tbStatusID_STATUS.AsInteger := statusTmp.ID;
      tbStatusDES_STATUS.AsString := statusTmp.Descricao;
      tbStatusDOM_ATIVO.AsBoolean := statusTmp.Ativo;
      tbStatusDES_LOG.AsString := statusTmp.Log;
      tbStatus.Post;
      dPosicao := (iContador / iRecords) * 100;
      Inc(iContador,1);
      frmProcesso.cxProgressBar1.Position := dPosicao;
      frmProcesso.cxProgressBar1.Properties.Text := FormatFloat('0.00%',dPosicao);
      frmProcesso.cxProgressBar1.Refresh;
    end;
    if not tbStatus.IsEmpty then
    begin
      tbStatus.First;
    end;
  finally
    statusDAO.Free;
    tbStatus.IsLoading := False;
    frmProcesso.Close;
    FreeAndNil(frmProcesso);
  end;
end;

procedure TfrmTabelasAuxiliaresCadastro.SetupStatus;
begin
  status.ID := tbStatusID_STATUS.AsInteger;
  status.Descricao := tbStatusDES_STATUS.AsString;
  status.Ativo := tbStatusDOM_ATIVO.AsBoolean;
  status.Log := tbStatusDES_LOG.AsString;
end;

procedure TfrmTabelasAuxiliaresCadastro.ExcluirStatus;
var
  statusDAO : TStatusCadastroDAO;
  sFiltro : String;
begin
  try
    statusDAO := TStatusCadastroDAO.Create();
    if Application.MessageBox('Confirma a exclusão?', PChar('Atenção ' + uGlobais.sUsuario), MB_YESNO + MB_ICONQUESTION) = IDNO then
    begin
      Abort;
      Exit;
    end;
    sFiltro := 'WHERE ID_STATUS = ' + tbStatusID_STATUS.AsString;
    if not statusDAO.Delete(sFiltro) then
    begin
      Application.MessageBox(PChar('Erro ao excluir o Status ' + tbStatusID_STATUS.AsString + ' !'),
                             Pchar('Atenção ' + uglobais.sUsuario), MB_OK + MB_ICONERROR);
      Abort;
      Exit;
    end;
  finally
    statusDAO.Free;
  end;
end;

end.
