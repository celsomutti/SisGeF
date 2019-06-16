unit ufrmUsuariosAgentes;

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
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxLabel, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, dxSkinsdxStatusBarPainter, cxProgressBar,
  dxStatusBar, cxGroupBox, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, clUsuarios, clAgentes, Vcl.ActnList, Vcl.Menus, Vcl.StdCtrls,
  cxButtons, clConexao, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, System.Actions, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmUsuariosAgentes = class(TForm)
    cxLabel27: TcxLabel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dxStatusBar1: TdxStatusBar;
    dxStatusBar1Container0: TdxStatusBarContainerControl;
    cxProgressBar: TcxProgressBar;
    ds: TDataSource;
    cxGrid1DBTableView1COD_USUARIO: TcxGridDBColumn;
    cxGrid1DBTableView1COD_AGENTE: TcxGridDBColumn;
    cxGrid1DBTableView1NOM_AGENTE: TcxGridDBColumn;
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxUsuarios: TcxComboBox;
    aclCadastro: TActionList;
    actCadastroSalvar: TAction;
    actCadastroSair: TAction;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure actCadastroSairExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure PopulaUsuarios;
  public
    { Public declarations }
  end;

var
  frmUsuariosAgentes: TfrmUsuariosAgentes;
  usuario: TUsuarios;
  agente: TAgente;
  conexao: TConexao;

implementation

{$R *.dfm}

uses
  udm, clUtil, uGlobais;

procedure TfrmUsuariosAgentes.actCadastroSairExecute(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmUsuariosAgentes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  usuario.Free;
  agente.Free;
  conexao.Free;
  if dm.tbUsuariosAgentes.Active then
  begin
    dm.tbUsuariosAgentes.Close;
  end;
  Action := caFree;
  frmUsuariosAgentes := Nil;
end;

procedure TfrmUsuariosAgentes.FormShow(Sender: TObject);
begin
  usuario := TUsuarios.Create;
  agente := TAgente.Create;
  conexao := TConexao.Create;
  if (not conexao.VerifyConnZEOS(0)) then
  begin
    actCadastroSairExecute(Sender);
    Exit;
  end;
  PopulaUsuarios;
end;

procedure TfrmUsuariosAgentes.PopulaUsuarios;
begin
  cxUsuarios.Properties.Items.Clear;
  if usuario.ListSearch('USUARIO') then
  begin
    with dm.qryPesquisa do
    begin
      while not(Eof) do
      begin
        cxUsuarios.Properties.Items.Add(FieldByName('NOM_USUARIO').AsString);
        Next;
      end;
      cxUsuarios.ItemIndex := -1;
      Close;
      SQL.Clear;
    end;
  end;

end;

end.
