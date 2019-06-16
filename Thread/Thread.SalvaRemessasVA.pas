unit Thread.SalvaRemessasVA;

interface

uses
  System.Classes, System.Generics.Collections, System.SysUtils, Model.RemessasVA, DAO.RemessasVA, Vcl.Forms,
  System.UITypes, Model.BancaVA, DAO.BancaVA, uGlobais;

type
  Thread_SalvaRemessasVA = class(TThread)
  private
    { Private declarations }
    FdPos: Double;
    FTexto: String;
    remessa : TRemessasVA;
    remessas : TObjectList<TRemessasVA>;
    remessaDAO : TRemessasVADAO;
    banca : TBancaVA;
    bancas : TObjectList<TBancaVA>;
    bancaDAO : TBancaVADAO;
  protected
    procedure Execute; override;
    procedure IniciaProcesso;
    procedure AtualizaProcesso;
    procedure TerminaProcesso;
    procedure SetupClass;
  end;

implementation

{ 
  Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);  

  and UpdateCaption could look like,

    procedure Thread_SalvaRemessasVA.UpdateCaption;
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

{ Thread_SalvaRemessasVA }

uses View.ResultatoProcesso, udm, View.ManutencaoRepartes;

procedure Thread_SalvaRemessasVA.IniciaProcesso;
begin
  view_ManutencaoRepartesVA.pbRepartes.Visible := True;
  view_ManutencaoRepartesVA.dsRepartes.Enabled := False;
  view_ManutencaoRepartesVA.pbRepartes.Position := 0;
  view_ManutencaoRepartesVA.pbRepartes.Refresh;
end;

procedure Thread_SalvaRemessasVA.Execute;
var
  ocorrenciaTMP: TRemessasVA;
  iTotal : Integer;
  iPos : Integer;
  sMensagem: String;
  iId: Integer;
begin
  { Place thread code here }
  try
    Synchronize(IniciaProcesso);
    if not Assigned(view_ResultadoProcesso) then
    begin
      view_ResultadoProcesso := Tview_ResultadoProcesso.Create(Application);
    end;
    view_ResultadoProcesso.Show;
    Screen.Cursor := crHourGlass;
    remessaDAO := TRemessasVADAO.Create();
    remessa := TRemessasVA.Create();
    iTotal := view_ManutencaoRepartesVA.tbRepartes.RecordCount;
    iPos := 0;
    FdPos := 0;
    if not view_ManutencaoRepartesVA.tbRepartes.IsEmpty then view_ManutencaoRepartesVA.tbRepartes.First;
    while not view_ManutencaoRepartesVA.tbRepartes.Eof do
    begin
      sMensagem := '';
      SetupClass;
      if remessa.Id > 0 then
      begin
        if not remessaDAO.Update(remessa) then
        begin
          sMensagem := 'Erro ao alterar a remessa ' + view_ManutencaoRepartesVA.tbRepartesCOD_BANCA.AsString + '-' +
                                                      view_ManutencaoRepartesVA.tbRepartesDAT_REMESSA.AsString +
                                                     '-' + view_ManutencaoRepartesVA.tbRepartesCOD_PRODUTO.AsString;
        end;
      end
      else
      begin
        if not remessaDAO.Insert(remessa) then
        begin
          sMensagem := 'Erro ao incluir a remessa ' + view_ManutencaoRepartesVA.tbRepartesCOD_BANCA.AsString + '-' +
                                                      view_ManutencaoRepartesVA.tbRepartesDAT_REMESSA.AsString +
                                                     '-' + view_ManutencaoRepartesVA.tbRepartesCOD_PRODUTO.AsString;
        end;
      end;
      if not sMensagem.IsEmpty then
      begin
        view_ResultadoProcesso.edtResultado.Lines.Add(sMensagem);
        view_ResultadoProcesso.edtResultado.Refresh;
      end;
      view_ManutencaoRepartesVA.tbRepartes.Next;
      iPos := iPos + 1;
      FdPos := (iPos / iTotal) * 100;
      Synchronize(AtualizaProcesso);
    end;
  finally
    Synchronize(TerminaProcesso);
    Screen.Cursor := crDefault;
    remessaDAO.Free;
    remessa.Free;
  end;
end;

procedure Thread_SalvaRemessasVA.AtualizaProcesso;
begin
  view_ManutencaoRepartesVA.pbRepartes.Position := FdPos;
  view_ManutencaoRepartesVA.pbRepartes.Properties.Text := FormatFloat('0.00%',FdPos);
  view_ManutencaoRepartesVA.pbRepartes.Refresh;
end;

procedure Thread_SalvaRemessasVA.TerminaProcesso;
begin
  view_ManutencaoRepartesVA.pbRepartes.Position := 0;
  view_ManutencaoRepartesVA.pbRepartes.Properties.Text := '';
  view_ManutencaoRepartesVA.pbRepartes.Refresh;
  view_ManutencaoRepartesVA.tbRepartes.IsLoading := False;
  view_ManutencaoRepartesVA.dsRepartes.Enabled := True;
  view_ManutencaoRepartesVA.pbRepartes.Visible := False;
end;

procedure Thread_SalvaRemessasVA.SetupClass;
var
  lLog: TStringList;
begin
  lLog := TStringList.Create();
  remessa.Id := view_ManutencaoRepartesVA.tbRepartesID_REMESSA.AsInteger;
  remessa.Distribuidor := view_ManutencaoRepartesVA.tbRepartesCOD_DISTRIBUIDOR.AsInteger;
  remessa.Banca := view_ManutencaoRepartesVA.tbRepartesCOD_BANCA.AsInteger;
  remessa.Produto := view_ManutencaoRepartesVA.tbRepartesCOD_PRODUTO.AsString;
  remessa.DataRemessa := view_ManutencaoRepartesVA.tbRepartesDAT_REMESSA.AsDateTime;
  remessa.NumeroRemessa := view_ManutencaoRepartesVA.tbRepartesNUM_REMESSA.AsString;
  remessa.Remessa := view_ManutencaoRepartesVA.tbRepartesQTD_REMESSA.AsFloat;
  remessa.DataRecobertura := view_ManutencaoRepartesVA.tbRepartesDAT_RECOBERTURA.AsDateTime;
  remessa.Recobertura := view_ManutencaoRepartesVA.tbRepartesQTD_RECOBERTURA.AsFloat;
  remessa.DataChamada := view_ManutencaoRepartesVA.tbRepartesDAT_CHAMADA.AsDateTime;
  remessa.NumeroDevolucao := view_ManutencaoRepartesVA.tbRepartesNUM_DEVOLUCAO.AsString;
  remessa.Encalhe := view_ManutencaoRepartesVA.tbRepartesQTD_ENCALHE.AsFloat;
  remessa.ValorCobranca := view_ManutencaoRepartesVA.tbRepartesVAL_COBRANCA.AsFloat;
  remessa.ValorVenda := view_ManutencaoRepartesVA.tbRepartesVAL_VENDA.AsFloat;
  remessa.Inventario := view_ManutencaoRepartesVA.tbRepartesDOM_INVENTARIO.AsInteger;
  lLog.Text := view_ManutencaoRepartesVA.tbRepartesDES_LOG.AsString;
  if remessa.Id = 0 then
  begin
    lLog.Add('> ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now()) + ' inserido por ' + uGlobais.sUsuario);
  end
  else
  begin
    lLog.Add('> ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now()) + ' alterado por ' + uGlobais.sUsuario);
  end;
  remessa.Log := lLog.Text;
  lLog.Free;
end;

end.
