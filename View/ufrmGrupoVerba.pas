unit ufrmGrupoVerba;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp,
  dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxSkinscxPCPainter,  cxPC, DB, dxmdaset, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxContainer, cxLabel,
  cxCurrencyEdit, cxTextEdit, Menus, StdCtrls, cxButtons, clGruposVerba,
  cxNavigator, cxImage, Vcl.ExtCtrls, cxMaskEdit,
  cxGridExportLink, ShellAPI, cxButtonEdit, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, System.Actions, clConexao, dxDateRanges,
  cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TfrmGrupoVerba = class(TForm)
    aclCadastro: TActionList;
    actCadastroExcluir: TAction;
    actCadastroCancelar: TAction;
    actCadastroListaApoio: TAction;
    actCadastroSalvar: TAction;
    actCadastroSair: TAction;
    actCadastroExportar: TAction;
    tbVerba: TdxMemData;
    ds: TDataSource;
    tbVerbaVAL_VERBA: TFloatField;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxButton4: TcxButton;
    SaveDialog: TSaveDialog;
    cxButton1: TcxButton;
    actCadastroApoio: TAction;
    tbVerbaCOD_GRUPO: TIntegerField;
    tbVerbaVAL_PERCENTUAL: TFloatField;
    cxGrid1DBTableView1COD_GRUPO: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_PERCENTUAL: TcxGridDBColumn;
    cxGrid1DBTableView1VAL_VERBA: TcxGridDBColumn;
    actCadastroGrupo: TAction;
    cxButton2: TcxButton;
    cxLabel27: TcxLabel;
    procedure FormShow(Sender: TObject);
    procedure actCadastroSairExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure AtualizaGrid;
    procedure SalvaGrid;
    procedure tbVerbaAfterDelete(DataSet: TDataSet);
    procedure tbVerbaAfterPost(DataSet: TDataSet);
    procedure tbVerbaBeforeCancel(DataSet: TDataSet);
    procedure tbVerbaBeforeDelete(DataSet: TDataSet);
    procedure tbVerbaBeforeEdit(DataSet: TDataSet);
    procedure tbVerbaBeforeInsert(DataSet: TDataSet);
    procedure tbVerbaBeforePost(DataSet: TDataSet);
    procedure actCadastroExportarExecute(Sender: TObject);
    procedure actCadastroGrupoExecute(Sender: TObject);

  private
    { Private declarations }
    procedure InserirGrupo;
  public
    { Public declarations }
  end;

var
  frmGrupoVerba: TfrmGrupoVerba;
  sOperacao: String;
  verbagrp: TGruposVerba;
  conexao: TConexao;

implementation

{$R *.dfm}

uses
  udm, ufrmPrincipal, clUtil, Math, uGlobais, ufrmListaApoio;

procedure TfrmGrupoVerba.FormShow(Sender: TObject);
begin
  verbagrp := TGruposVerba.Create();
  conexao := TConexao.Create;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    actCadastroSairExecute(Sender);
    Exit;
  end;
  verbagrp.Operacao := 'I';
  AtualizaGrid;
end;

procedure TfrmGrupoVerba.actCadastroExportarExecute(Sender: TObject);
var
  FileExt, sFile: String;
begin
  if not(tbVerba.Active) then
  begin
    Exit;
  end;
  if tbVerba.IsEmpty then
  begin
    Exit;
  end;
  sFile := 'grupos_verbas';
  SaveDialog.FileName := sFile;
  SaveDialog.Filter := '';
  SaveDialog.Filter :=
    'Excel (*.xls) |*.xls|XML (*.xml) |*.xml|Arquivo Texto (*.txt) |*.txt|Página Web (*.html)|*.html';
  SaveDialog.Title := 'Exportar Dados';
  SaveDialog.DefaultExt := 'xls';
  if SaveDialog.Execute then
  begin
    FileExt := LowerCase(ExtractFileExt(SaveDialog.FileName));
    if FileExt = '.xls' then
      ExportGridToExcel(SaveDialog.FileName, cxGrid1, False, True, False)
    else if FileExt = '.xml' then
      ExportGridToXML(SaveDialog.FileName, cxGrid1, False)
    else if FileExt = '.txt' then
      ExportGridToText(SaveDialog.FileName, cxGrid1, False)
    else if FileExt = '.html' then
      ExportGridToHTML(SaveDialog.FileName, cxGrid1, False);
    ShellExecute(Handle, 'open', pchar(SaveDialog.FileName), nil, nil, SW_SHOW);
  end;
end;

procedure TfrmGrupoVerba.actCadastroGrupoExecute(Sender: TObject);
begin
  InserirGrupo;
end;

procedure TfrmGrupoVerba.actCadastroSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmGrupoVerba.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  verbagrp.Free;
  conexao.Free;
  tbVerba.Cancel;
  tbVerba.Close;
  Action := caFree;
  frmGrupoVerba := Nil;
end;

procedure TfrmGrupoVerba.AtualizaGrid;
begin
  if tbVerba.Active then
  begin
    tbVerba.Close;
  end;
  tbVerba.Open;
  if not(verbagrp.getObjects()) then
  begin
    Exit;
  end;
  tbVerba.IsLoading := True;
  dm.qryGetObject.First;
  while not(dm.qryGetObject.Eof) do
  begin
    tbVerba.Insert;
    tbVerbaCOD_GRUPO.Value := dm.qryGetObject.FieldByName('COD_GRUPO')
      .AsInteger;
    tbVerbaVAL_PERCENTUAL.Value := dm.qryGetObject.FieldByName
      ('VAL_PERCENTUAL').AsFloat;
    tbVerbaVAL_VERBA.Value := dm.qryGetObject.FieldByName('VAL_VERBA').AsFloat;
    tbVerba.Post;
    dm.qryGetObject.Next;
  end;
  dm.qryGetObject.Close;
  dm.qryGetObject.SQL.Clear;
  tbVerba.IsLoading := False;
end;

procedure TfrmGrupoVerba.SalvaGrid;
begin
  if not(tbVerba.Active) then
  begin
    tbVerba.Open;
  end;
  tbVerba.IsLoading := True;
  tbVerba.Insert;
  tbVerbaCOD_GRUPO.AsInteger := verbagrp.Grupo;
  tbVerbaVAL_PERCENTUAL.AsFloat := verbagrp.Percentual;
  tbVerbaVAL_VERBA.AsFloat := verbagrp.Verba;
  tbVerba.Post;
  tbVerba.IsLoading := True;
end;

procedure TfrmGrupoVerba.tbVerbaAfterDelete(DataSet: TDataSet);
begin
  if not(verbagrp.Delete('PERCENTUAL')) then
  begin
    Application.MessageBox('Erro ao excluir a Verba!', 'Atenção',
      MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  Application.MessageBox('Verba Excluída com sucesso !', 'Atenção',
    MB_OK + MB_ICONINFORMATION);
end;

procedure TfrmGrupoVerba.tbVerbaAfterPost(DataSet: TDataSet);
begin
  if tbVerba.IsLoading then
  begin
    Exit;
  end;
  if verbagrp.Operacao = 'I' then
  begin
    if not(verbagrp.Insert) then
    begin
      Application.MessageBox('Erro ao incluir a Verba!', 'Atenção',
        MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
  end
  else if verbagrp.Operacao = 'U' then
  begin
    if not(verbagrp.Update) then
    begin
      Application.MessageBox('Erro ao alterar a Verba!', 'Atenção',
        MB_OK + MB_ICONEXCLAMATION);
      Exit;
    end;
  end;
end;

procedure TfrmGrupoVerba.tbVerbaBeforeCancel(DataSet: TDataSet);
begin
  verbagrp.Operacao := '';
end;

procedure TfrmGrupoVerba.tbVerbaBeforeDelete(DataSet: TDataSet);
var
  sMess: String;
begin
  verbagrp.Grupo := tbVerbaCOD_GRUPO.AsInteger;
  verbagrp.Percentual := tbVerbaVAL_PERCENTUAL.AsFloat;
  sMess := 'Deseja Excluir a Verba ?';
  if Application.MessageBox(pchar(sMess), 'Excluir', MB_YESNO + MB_ICONQUESTION)
    = IDNO then
  begin
    Abort;
    Exit;
  end;

end;

procedure TfrmGrupoVerba.tbVerbaBeforeEdit(DataSet: TDataSet);
begin
  verbagrp.Operacao := 'U';
end;

procedure TfrmGrupoVerba.tbVerbaBeforeInsert(DataSet: TDataSet);
begin
  verbagrp.Operacao := 'I';
end;

procedure TfrmGrupoVerba.tbVerbaBeforePost(DataSet: TDataSet);
begin
  if tbVerba.IsLoading then
  begin
    Exit;
  end;
  verbagrp.Grupo := tbVerbaCOD_GRUPO.AsInteger;
  verbagrp.Percentual := tbVerbaVAL_PERCENTUAL.AsFloat;
  verbagrp.Verba := tbVerbaVAL_VERBA.AsFloat;
  if not(verbagrp.Validar) then
  begin
    Abort;
    tbVerba.Refresh;
    Exit;
  end;
end;

procedure TfrmGrupoVerba.InserirGrupo;
var
  iGrupo: Integer;
  sMess: String;
begin
  if ds.State in [dsInsert, dsEdit] then
  begin
    tbVerba.Cancel;
  end;
  iGrupo := 0;
  iGrupo := verbagrp.MaxGrupo;
  if iGrupo = 0 then
  begin
    Exit;
  end;
  sMess := 'Confirma a criação do Grupo de Verbas Nº. ' +
    IntToStr(iGrupo) + ' ?';
  if Application.MessageBox(pchar(sMess), 'Inserir Grupo',
    MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;
  tbVerba.IsLoading := True;
  tbVerba.Append;
  tbVerbaCOD_GRUPO.Value := iGrupo;
  tbVerbaVAL_PERCENTUAL.Value := 0;
  tbVerbaVAL_VERBA.Value := 0;
  tbVerba.Post;
  verbagrp.Grupo := iGrupo;
  verbagrp.Percentual := 0;
  verbagrp.Verba := 0;
  if not(verbagrp.Insert()) then
  begin
    Application.MessageBox('Erro ao tentar criar o Grupo!', 'Erro',
      MB_OK + MB_ICONEXCLAMATION);
  end;
  tbVerba.IsLoading := False;
end;

end.
