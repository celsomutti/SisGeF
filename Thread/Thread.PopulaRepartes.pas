unit Thread.PopulaRepartes;

interface

uses
  System.Classes, System.Generics.Collections, System.SysUtils, Vcl.Forms, System.UITypes, Model.ProdutosVA, Model.BancaVA,
  Model.DistribuidorVA, Model.RemessasVA, DAO.ProdutosVA, DAO.BancaVA, DAO.DistribuidorVA, DAO.RemessasVA;

type
  Thread_PopulaRepartes = class(TThread)
  private
    { Private declarations }
    FDistribuidor: Integer;
    FBanca: Integer;
    FTipo: Integer;
    FData: TDate;
    FdPos: Double;
    banca : TBancaVA;
    bancas : TObjectList<TBancaVA>;
    bancaDAO : TBancaVADAO;
    distribuidor : TDistribuidorVA;
    distribuidores : TObjectList<TDistribuidorVA>;
    distribuidorDAO : TDistribuidorVADAO;
    produto : TProdutosVA;
    produtos : TObjectList<TProdutosVA>;
    produtoDAO : TProdutosVADAO;
    remessa : TRemessasVA;
    remessas : TObjectList<TRemessasVA>;
    remessaDAO : TRemessasVADAO;
  protected
    procedure Execute; override;
    procedure IniciaProcesso;
    procedure AtualizaProcesso;
    procedure TerminaProcesso;
  public
    property CodDistribuidor: Integer read FDistribuidor write FDistribuidor;
    property CodBanca: Integer read FBanca write FBanca;
    property Tipo: Integer read FTipo write FTipo;
    property Data: TDate read FData write FData;
  end;

implementation

{ 
  Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);  

  and UpdateCaption could look like,

    procedure Thread_PopulaRepartes.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end;

    or

    Synchronize(
      procedure
      begin
        Form1.Caption := 'Updated in thread via an anonymous method'
      end
      )
    );

  where an anonymous method is passed.

  Similarly, the developer can call the Queue method with similar parameters as
  above, instead passing another TThread class as the first parameter, putting
  the calling thread in a queue with the other thread.

}

uses View.ManutencaoRepartes, udm, clUtil;

{ Thread_PopulaRepartes }

procedure Thread_PopulaRepartes.Execute;
var
  bancaTMP: TBancaVA;
  distribuidorTMP: TDistribuidorVA;
  produtoTMP: TProdutosVA;
  remessaTMP: TRemessasVA;
  iTotal : Integer;
  iPos : Integer;
  sCampo: String;
begin
  { Place thread code here }
  try
    Synchronize(IniciaProcesso);
    Screen.Cursor := crHourGlass;
    if view_ManutencaoRepartesVA.tbRepartes.Active then view_ManutencaoRepartesVA.tbRepartes.Close;
    view_ManutencaoRepartesVA.tbRepartes.Open;
    bancaDAO := TBancaVADAO.Create();
    distribuidorDAO := TDistribuidorVADAO.Create();
    produtoDAO := TProdutosVADAO.Create();
    remessaDAO := TRemessasVADAO.Create();
    view_ManutencaoRepartesVA.tbRepartes.IsLoading := True;
    remessas := remessaDAO.FindByMovimento(FDistribuidor,FBanca,FTipo,'',Data);
    if remessas.Count > 0 then
    begin
      iTotal := remessas.Count;
      for remessaTMP in remessas do
      begin
        view_ManutencaoRepartesVA.tbRepartes.Insert;
        view_ManutencaoRepartesVA.tbRepartesID_REMESSA.AsInteger := remessaTMP.ID;
        view_ManutencaoRepartesVA.tbRepartesCOD_DISTRIBUIDOR.AsInteger := remessaTMP.Distribuidor;
        distribuidores := distribuidorDAO.FindByCodigo(remessaTMP.Distribuidor);
        sCampo := TUtil.AlinhaD(Trim(IntToStr(remessaTMP.Distribuidor)),6);
        if distribuidores.Count > 0 then
        begin
          view_ManutencaoRepartesVA.tbRepartesNOM_DISTRIBUIDOR.AsString := sCampo + '-' + Trim(distribuidores[0].Nome);
        end
        else
        begin
          view_ManutencaoRepartesVA.tbRepartesNOM_DISTRIBUIDOR.AsString := sCampo;
        end;
        view_ManutencaoRepartesVA.tbRepartesCOD_BANCA.AsInteger := remessaTMP.Banca;
        bancas := bancaDAO.FindByCodigo(remessaTMP.Banca);
        sCampo := TUtil.AlinhaD(Trim(IntToStr(remessaTMP.Banca)),6);
        if bancas.Count > 0 then
        begin
          view_ManutencaoRepartesVA.tbRepartesNOM_BANCA.AsString := sCampo + '-' + Trim(bancas[0].Nome);
        end
        else
        begin
          view_ManutencaoRepartesVA.tbRepartesNOM_BANCA.AsString := sCampo;
        end;
        view_ManutencaoRepartesVA.tbRepartesCOD_PRODUTO.AsString := remessaTMP.Produto;
        produtos := produtoDAO.FindByCodigo(remessaTMP.Produto);
        if produtos.Count > 0 then
        begin
          view_ManutencaoRepartesVA.tbRepartesDES_PRODUTO.AsString := Trim(produtos[0].Descricao);
        end
        else
        begin
          view_ManutencaoRepartesVA.tbRepartesNOM_BANCA.AsString := remessaTMP.Produto;
        end;
        view_ManutencaoRepartesVA.tbRepartesDAT_REMESSA.AsDateTime := remessaTMP.DataRemessa;
        view_ManutencaoRepartesVA.tbRepartesNUM_REMESSA.AsString := remessaTMP.NumeroRemessa;
        view_ManutencaoRepartesVA.tbRepartesQTD_REMESSA.AsFloat := remessaTMP.Remessa;
        view_ManutencaoRepartesVA.tbRepartesDAT_RECOBERTURA.AsDateTime := remessaTMP.DataRecobertura;
        view_ManutencaoRepartesVA.tbRepartesQTD_RECOBERTURA.AsFloat := remessaTMP.Recobertura;
        view_ManutencaoRepartesVA.tbRepartesDAT_CHAMADA.AsDateTime := remessaTMP.DataChamada;
        view_ManutencaoRepartesVA.tbRepartesNUM_DEVOLUCAO.AsString := remessaTMP.NumeroDevolucao;
        view_ManutencaoRepartesVA.tbRepartesQTD_ENCALHE.AsFloat :=  remessaTMP.Encalhe;
        view_ManutencaoRepartesVA.tbRepartesVAL_COBRANCA.AsFloat := remessaTMP.ValorCobranca;
        view_ManutencaoRepartesVA.tbRepartesVAL_VENDA.AsFloat := remessaTMP.ValorVenda;
        view_ManutencaoRepartesVA.tbRepartesDOM_INVENTARIO.AsInteger := remessaTMP.Inventario;
        view_ManutencaoRepartesVA.tbRepartesDES_LOG.asString := remessaTMP.Log;
        view_ManutencaoRepartesVA.tbRepartes.Post;
        iPos := iPos + 1;
        FdPos := (iPos / iTotal) * 100;
        Synchronize(AtualizaProcesso);
      end;
    end;
    if not view_ManutencaoRepartesVA.tbRepartes.IsEmpty then view_ManutencaoRepartesVA.tbRepartes.First;
  finally
    Synchronize(TerminaProcesso);
    bancaDAO.Free;
    distribuidorDAO.Free;
    produtoDAO.Free;
    remessaDAO.Free;
  end;
end;

procedure Thread_PopulaRepartes.IniciaProcesso;
begin
  view_ManutencaoRepartesVA.pbRepartes.Visible := True;
  view_ManutencaoRepartesVA.dsRepartes.Enabled := False;
  view_ManutencaoRepartesVA.tbRepartes.IsLoading := True;
  view_ManutencaoRepartesVA.pbRepartes.Position := 0;
  view_ManutencaoRepartesVA.pbRepartes.Refresh;
end;

procedure Thread_PopulaRepartes.AtualizaProcesso;
begin
  view_ManutencaoRepartesVA.pbRepartes.Position := FdPos;
  view_ManutencaoRepartesVA.pbRepartes.Properties.Text := FormatFloat('0.00%',FdPos);
  view_ManutencaoRepartesVA.pbRepartes.Refresh;
end;

procedure Thread_PopulaRepartes.TerminaProcesso;
begin
  view_ManutencaoRepartesVA.pbRepartes.Position := 0;
  view_ManutencaoRepartesVA.pbRepartes.Properties.Text := '';
  view_ManutencaoRepartesVA.pbRepartes.Refresh;
  view_ManutencaoRepartesVA.tbRepartes.IsLoading := False;
  view_ManutencaoRepartesVA.dsDistribuidor.Enabled := True;
  view_ManutencaoRepartesVA.pbRepartes.Visible := False;
end;


end.
