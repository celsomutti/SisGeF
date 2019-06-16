unit Thread.GravaRemessasVA;

interface

uses
  System.Classes, System.Generics.Collections, System.SysUtils, Model.RemessasVA, DAO.RemessasVA, Vcl.Forms,
  System.UITypes, Model.BancaVA, DAO.BancaVA, uGlobais, Model.ProdutosVA, DAO.ProdutosVA;

type
  Thread_GravaRemessasVA = class(TThread)
  private
    { Private declarations }
    FdPos: Double;
    FTexto: TStringList;
    remessa : TRemessasVA;
    remessas : TObjectList<TRemessasVA>;
    remessaDAO : TRemessasVADAO;
    banca : TBancaVA;
    bancas : TObjectList<TBancaVA>;
    bancaDAO : TBancaVADAO;
    produto : TProdutosVA;
    produtos : TObjectList<TProdutosVA>;
    produtoDAO : TProdutosVADAO;
  protected
    procedure Execute; override;
    procedure IniciaProcesso;
    procedure AtualizaProcesso;
    procedure TerminaProcesso;
    function DataDevolucao(dtData: TDate; sProduto: String): TDate;
  end;

implementation

{
  Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure Thread_GravaRemessasVA.UpdateCaption;
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

{ Thread_GravaRemessasVA }

uses View.ResultatoProcesso, udm, View.ManutencaoRepartes;

procedure Thread_GravaRemessasVA.IniciaProcesso;
begin
  view_ManutencaoRepartesVA.pbRepartes.Visible := True;
  dm.dsImportaRemessa.Enabled := False;
  view_ManutencaoRepartesVA.pbRepartes.Position := 0;
  view_ManutencaoRepartesVA.pbRepartes.Refresh;
end;

procedure Thread_GravaRemessasVA.Execute;
var
  ocorrenciaTMP: TRemessasVA;
  iTotal : Integer;
  iPos : Integer;
  sMensagem: String;
  iId: Integer;
  lLog: TStringList;
begin
  { Place thread code here }
  try
    Synchronize(IniciaProcesso);
    FTexto := TstringList.Create();
    Screen.Cursor := crHourGlass;
    remessaDAO := TRemessasVADAO.Create();
    remessa := TRemessasVA.Create();
    bancaDAO := TBancaVADAO.Create();
    remessas := TObjectList<TRemessasVA>.Create();
    produto := TProdutosVA.Create();
    produtoDAO := TProdutosVADAO.Create();
    produtos := TObjectList<TProdutosVA>.Create();
    bancas := bancaDAO.FindByCodigo(StrToIntDef(dm.fdmRemessaCOD_BANCA.AsString,0));
    iTotal := dm.fdmRemessa.RecordCount;
    iPos := 0;
    FdPos := 0;
    if not dm.fdmRemessa.IsEmpty then dm.fdmRemessa.First;
    while not dm.fdmRemessa.Eof do
    begin
      sMensagem := '';
      remessas := remessaDAO.FindByMovimento(0,dm.fdmRemessaCOD_BANCA.AsInteger, 0, dm.fdmRemessaCOD_PRODUTO.AsString,
                                             dm.fdmRemessaDAT_CIRCULACAO.AsDateTime);
      lLog := TStringList.Create();
      if remessas.Count > 0 then
      begin
        if remessas[0].Inventario = 0 then
        begin
          remessa.Id := remessas[0].Id;
          remessa.Distribuidor := remessas[0].Distribuidor;
          remessa.Banca := remessas[0].Banca;
          remessa.Produto := remessas[0].Produto;
          remessa.DataRemessa := remessas[0].DataRemessa;
          remessa.NumeroRemessa := remessas[0].NumeroRemessa;
          remessa.Remessa := remessas[0].Remessa;
          remessa.DataRecobertura := remessas[0].DataRecobertura;
          remessa.Recobertura := remessas[0].Recobertura;
          remessa.DataChamada := remessas[0].DataChamada;
          remessa.NumeroDevolucao := remessas[0].NumeroDevolucao;
          remessa.Encalhe := remessas[0].Encalhe;
          remessa.ValorCobranca := remessas[0].ValorCobranca;
          remessa.ValorVenda := remessas[0].ValorVenda;
          remessa.Inventario := remessas[0].Inventario;
          lLog.Text := remessas[0].Log;
          if remessa.Id = 0 then
          begin
            lLog.Add('> ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now()) + ' inserido por ' + uGlobais.sUsuario);
          end
          else
          begin
            lLog.Add('> ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now()) + ' alterado por ' + uGlobais.sUsuario);
          end;
          remessa.Log := lLog.Text;
        end;
      end
      else
      begin
        remessa.Id := 0;
        bancas := bancaDAO.FindByCodigo(dm.fdmRemessaCOD_BANCA.AsInteger);
        if bancas.Count > 0 then
        begin
          remessa.Distribuidor := bancas[0].Distribuidor;
        end;
        remessa.Banca := dm.fdmRemessaCOD_BANCA.AsInteger;
        remessa.Produto := dm.fdmRemessaCOD_PRODUTO.AsString;
        remessa.DataRemessa := dm.fdmRemessaDAT_CIRCULACAO.AsDateTime;
        remessa.NumeroRemessa := '0';
        remessa.Remessa := dm.fdmRemessaQTD_REMESSA.AsFloat;
        remessa.DataRecobertura := 0;
        remessa.Recobertura := 0;
        remessa.DataChamada := DataDevolucao(remessa.DataRemessa,remessa.Produto);
        remessa.NumeroDevolucao := '0';
        remessa.Encalhe := 0;
        produtos := produtoDAO.FindByCodigo(dm.fdmRemessaCOD_PRODUTO.AsString);
        if produtos.Count = 0 then
        begin
          remessa.ValorCobranca := 0;
          remessa.ValorVenda := 0;
        end
        else
        begin
          remessa.ValorCobranca := produtos[0].Cobranca;
          remessa.ValorVenda := produtos[0].Venda;
        end;
        remessa.Inventario := 0;
        lLog.Text := '';
        if remessa.Id = 0 then
        begin
          lLog.Add('> ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now()) + ' inserido por ' + uGlobais.sUsuario);
        end
        else
        begin
          lLog.Add('> ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now()) + ' alterado por ' + uGlobais.sUsuario);
        end;
        remessa.Log := lLog.Text;
      end;
      if remessa.Id > 0 then
      begin
        if not remessaDAO.Update(remessa) then
        begin
          sMensagem := 'Erro ao alterar a remessa ' + dm.fdmRemessaCOD_BANCA.AsString + '-' +
                                                      dm.fdmRemessaDAT_CIRCULACAO.AsString +
                                                     '-' + dm.fdmRemessaCOD_PRODUTO.AsString;
        end;
      end
      else
      begin
        if not remessaDAO.Insert(remessa) then
        begin
          sMensagem := 'Erro ao incluir a remessa ' + dm.fdmRemessaCOD_BANCA.AsString + '-' +
                                                      dm.fdmRemessaDAT_CIRCULACAO.AsString +
                                                     '-' + dm.fdmRemessaCOD_PRODUTO.AsString;
        end;
      end;
      if not sMensagem.IsEmpty then FTexto.Add(sMensagem);
      dm.fdmRemessa.Next;
      iPos := iPos + 1;
      FdPos := (iPos / iTotal) * 100;
      Synchronize(AtualizaProcesso);
    end;
  finally
    Screen.Cursor := crDefault;
    remessaDAO.Free;
    remessa.Free;
    bancaDAO.Free;
    lLog.Free;
    Synchronize(TerminaProcesso);
    Self.Free;
  end;
end;

procedure Thread_GravaRemessasVA.AtualizaProcesso;
begin
  view_ManutencaoRepartesVA.pbRepartes.Position := FdPos;
  view_ManutencaoRepartesVA.pbRepartes.Properties.Text := FormatFloat('0.00%',FdPos);
  view_ManutencaoRepartesVA.pbRepartes.Refresh;
end;

procedure Thread_GravaRemessasVA.TerminaProcesso;
begin
  dm.fdmRemessa.Close;
  view_ManutencaoRepartesVA.pbRepartes.Position := 0;
  view_ManutencaoRepartesVA.pbRepartes.Properties.Text := '';
  view_ManutencaoRepartesVA.pbRepartes.Refresh;
  dm.dsImportaRemessa.Enabled := True;
  view_ManutencaoRepartesVA.pbRepartes.Visible := False;
  view_ManutencaoRepartesVA.edtArquivo.Clear;
  if FTexto.Count > 0 then
  begin
    if not Assigned(view_ResultadoProcesso) then
    begin
      view_ResultadoProcesso := Tview_ResultadoProcesso.Create(Application);
    end;
    view_ResultadoProcesso.edtResultado.Text := FTexto.Text;
    view_ResultadoProcesso.Show;
  end;
end;

function Thread_GravaRemessasVA.DataDevolucao(dtData: TDate; sProduto: string): TDate;
var
  iDia: Integer;
  dtDataDevolucao: TDate;
begin
  try
    Result := 0;
    iDia := 0;
    produtoDAO := TProdutosVADAO.Create;
    produtos := produtoDAO.FindByCodigo(sProduto);
    if produtos.Count > 0 then
    begin
      if produtos[0].Diario = 1 then
      begin
        iDia := DayOfWeek(dtData);
        if iDia in [2,3,4,5] then
        begin
          dtDataDevolucao := dtData + 1;
        end
        else if iDia = 6 then
        begin
          dtDataDevolucao := dtData + 3;
        end
        else if iDia = 7 then
        begin
          dtDataDevolucao := dtData + 2;
        end
        else if iDia = 1 then
        begin
          dtDataDevolucao := dtData + 2;
        end;
        Result := dtDataDevolucao;
      end;
    end;
  finally
    produtoTMP.Free;
    produtoDAO.Free;
    produtos.Free;
  end;
end;

end.
