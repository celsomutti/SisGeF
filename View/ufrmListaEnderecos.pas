unit ufrmListaEnderecos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, dxLayoutContainer, dxLayoutControl, Data.DB, dxmdaset, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, System.Actions, Vcl.ActnList, dxLayoutControlAdapters, Vcl.Menus, Vcl.StdCtrls,
  cxButtons, System.Generics.Collections, Model.Modalidades, DAO.Modalidade, cxDBLookupComboBox, dxLayoutcxEditAdapters,
  cxContainer, cxLabel;

type
  TfrmListaEnderecos = class(TForm)
    lcgRoot: TdxLayoutGroup;
    lcEndereco: TdxLayoutControl;
    tbEnderecos: TdxMemData;
    tbEnderecosCOD_MODALIDADE: TIntegerField;
    tbEnderecosNUM_CEP: TStringField;
    tbEnderecosDES_ENDERECO: TStringField;
    tbModalidades: TdxMemData;
    tbModalidadesCOD_MODALIDADE: TIntegerField;
    tbModalidadesDES_MODALIDADE: TStringField;
    dsEnderecos: TDataSource;
    dsModalidades: TDataSource;
    tvEnderecos: TcxGridDBTableView;
    lvEnderecos: TcxGridLevel;
    grdEnderecos: TcxGrid;
    lciEnderecos: TdxLayoutItem;
    tvEnderecosRecId: TcxGridDBColumn;
    tvEnderecosCOD_MODALIDADE: TcxGridDBColumn;
    tvEnderecosNUM_CEP: TcxGridDBColumn;
    tvEnderecosDES_ENDERECO: TcxGridDBColumn;
    aclEnderecos: TActionList;
    actSelecionar: TAction;
    actCancelar: TAction;
    cxButton1: TcxButton;
    lciSelecionar: TdxLayoutItem;
    cxButton2: TcxButton;
    lciCancelar: TdxLayoutItem;
    lcEnderecoGroup1: TdxLayoutAutoCreatedGroup;
    tbEnderecosID_ASSINATURA: TIntegerField;
    cxLabel1: TcxLabel;
    lcEnderecoItem1: TdxLayoutItem;
    procedure actSelecionarExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure PopulaModalidades;
  public
    { Public declarations }
  end;

var
  frmListaEnderecos: TfrmListaEnderecos;
  modalidadeTMP: TModalidades;
  modalidades: TObjectList<TModalidades>;
  modalidadeDAO: TModalidadeDAO;
implementation

{$R *.dfm}

uses udm;

procedure TfrmListaEnderecos.actCancelarExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmListaEnderecos.actSelecionarExecute(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfrmListaEnderecos.FormCreate(Sender: TObject);
begin
  PopulaModalidades;
end;

procedure TfrmListaEnderecos.PopulaModalidades;
begin
  modalidadeDAO := TModalidadeDAO.Create();
  modalidades := modalidadeDAO.FindByDescricao('');
  if tbModalidades.Active then tbModalidades.Close;
  tbModalidades.Open;
  for modalidadeTMP in modalidades do
  begin
    tbModalidades.Insert;
    tbModalidadesCOD_MODALIDADE.AsInteger := modalidadeTMP.Codigo;
    tbModalidadesDES_MODALIDADE.AsString := modalidadeTMP.Descricao;
    tbModalidades.Post;
  end;
  if not tbModalidades.IsEmpty then tbModalidades.First;
  modalidadeDAO.Free;
end;

end.
