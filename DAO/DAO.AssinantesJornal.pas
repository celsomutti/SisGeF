unit DAO.AssinantesJornal;

interface

uses DAO.Base, Generics.Collections, System.Classes, Model.AssinaturaJornal;

type
  TAssinantesJornalDAO = class(TDAO)
public
  function Insert(aAssinaturas: Model.AssinaturaJornal.TAssinaturaJornal): Boolean;
  function Update(aAssinaturas: Model.AssinaturaJornal.TAssinaturaJornal): Boolean;
  function Delete(iId: Integer): Boolean;
  function FindById(iId: Integer): TObjectList<Model.AssinaturaJornal.TAssinaturaJornal>;
  function FindByCodigo(sCodigo: String): TObjectList<Model.AssinaturaJornal.TAssinaturaJornal>;
  function FindByNome(sNome: String): TObjectList<Model.AssinaturaJornal.TAssinaturaJornal>;
  function FindByModalidade(iModalidade: Integer): TObjectList<Model.AssinaturaJornal.TAssinaturaJornal>;
  function FindByProduto(sProduto: String): TObjectList<Model.AssinaturaJornal.TAssinaturaJornal>;
  function FindByEndereco(sEndereco: String): TObjectList<Model.AssinaturaJornal.TAssinaturaJornal>;
  function FindByCEP(sCEP: String): TObjectList<Model.AssinaturaJornal.TAssinaturaJornal>;
  function FindByRoteiro(sRoteiro: String): TObjectList<Model.AssinaturaJornal.TAssinaturaJornal>;
  function FindByAssinatura(sCodigo: String; iModalidade: Integer; sProduto: String):
           TObjectList<Model.AssinaturaJornal.TAssinaturaJornal>;
end;

const
  TABLENAME = 'jor_assinantes_jornal';

implementation

uses System.SysUtils, FireDAC.Comp.Client, Data.DB;

function TAssinantesJornalDAO.Insert(aAssinaturas: Model.AssinaturaJornal.TAssinaturaJornal): Boolean;
var
  sSQL : System.string;
begin
  Result := False;
  aAssinaturas.ID := GetKeyValue(TABLENAME,'ID_ASSINANTE');
  sSQL := 'INSERT INTO ' + TABLENAME + ' '+
          '(ID_ASSINANTE, COD_ASSINANTE, COD_MODALIDADE, COD_PRODUTO, NUM_ORDEM, QTD_EXEMPLARES, NOM_ASSINANTE, ' +
          'DES_TIPO_LOGRADOURO, DES_LOGRADOURO, NUM_LOGRADOURO, DES_COMPLEMENTO, NOM_BAIRRO, NOM_CIDADE, UF_ESTADO, ' +
          'NUM_CEP, DES_REFERENCIA, DES_ROTEIRO, DES_LOG) ' +
          'VALUES ' +
          '(:pID_ASSINANTE, :pCOD_ASSINANTE, :pCOD_MODALIDADE, :pCOD_PRODUTO, :pNUM_ORDEM, :pQTD_EXEMPLARES, :pNOM_ASSINANTE, ' +
          ':pDES_TIPO_LOGRADOURO, :pDES_LOGRADOURO, :pNUM_LOGRADOURO, :pDES_COMPLEMENTO, :pNOM_BAIRRO, :pNOM_CIDADE, ' +
          ':pUF_ESTADO, :pNUM_CEP, :pDES_REFERENCIA, :pDES_ROTEIRO, :pDES_LOG);';

  Connection.ExecSQL(sSQL,[aAssinaturas.ID, aAssinaturas.Codigo, aAssinaturas.Modalidade, aAssinaturas.Produto, aAssinaturas.Ordem,
                          aAssinaturas.Qtde, aAssinaturas.Nome, aAssinaturas.TipoLogradouro, aAssinaturas.NomeLogradouro,
                          aAssinaturas.NumeroLogradouro, aAssinaturas.Complemento, aAssinaturas.Bairro, aAssinaturas.Cidade,
                          aAssinaturas.Estado, aAssinaturas.CEP, aAssinaturas.Referencia, aAssinaturas.Roteiro, aAssinaturas.Log],
                          [ftInteger, ftString, ftInteger, ftString, ftInteger, ftInteger, ftString, ftString, ftString, ftString,
                          ftString, ftString, ftString, ftString, ftString, ftString, ftString, ftString]);
  Result := True;
end;

function TAssinantesJornalDAO.Update(aAssinaturas: TAssinaturaJornal): Boolean;
var
  sSQL : System.string;
begin
  Result := False;
  sSQL := 'UPDATE ' + TABLENAME + ' SET '+
          'COD_ASSINANTE = :pCOD_ASSINANTE, ' +
          'COD_MODALIDADE = :pCOD_MODALIDADE, ' +
          'COD_PRODUTO = :pCOD_PRODUTO, ' +
          'NUM_ORDEM = :pNUM_ORDEM, ' +
          'QTD_EXEMPLARES = :pQTD_EXEMPLARES, ' +
          'NOM_ASSINANTE = :pNOM_ASSINANTE, ' +
          'DES_TIPO_LOGRADOURO = :pDES_TIPO_LOGRADOURO, ' +
          'DES_LOGRADOURO = :pDES_LOGRADOURO, ' +
          'NUM_LOGRADOURO = :pNUM_LOGRADOURO, ' +
          'DES_COMPLEMENTO = :pDES_COMPLEMENTO, ' +
          'NOM_BAIRRO = :pNOM_BAIRRO, ' +
          'NOM_CIDADE = :pNOM_CIDADE, ' +
          'UF_ESTADO = :pUF_ESTADO, ' +
          'NUM_CEP = :pNUM_CEP, ' +
          'DES_REFERENCIA = :pDES_REFERENCIA, ' +
          'DES_ROTEIRO = :pDES_ROTEIRO, ' +
          'DES_LOG = :pDES_LOG ' +
          'WHERE ID_ASSINANTE = :pID_ASSINANTE;';

  Connection.ExecSQL(sSQL,[aAssinaturas.Codigo,aAssinaturas.Modalidade, aAssinaturas.Produto, aAssinaturas.Ordem, aAssinaturas.Qtde,
                          aAssinaturas.Nome, aAssinaturas.TipoLogradouro, aAssinaturas.NomeLogradouro,
                          aAssinaturas.NumeroLogradouro, aAssinaturas.Complemento, aAssinaturas.Bairro, aAssinaturas.Cidade,
                          aAssinaturas.Estado, aAssinaturas.CEP, aAssinaturas.Referencia, aAssinaturas.Roteiro, aAssinaturas.Log,
                          aAssinaturas.ID],
                          [ftString, ftInteger, ftString, ftInteger, ftInteger, ftString, ftString, ftString, ftString,
                          ftString, ftString, ftString, ftString, ftString, ftString, ftString, ftString, ftInteger]);
  Result := True;
end;

function TAssinantesJornalDAO.Delete(iId: Integer): Boolean;
var
  sSQL : String;
begin
  Result := False;
  sSQL := 'DELETE FROM ' + TABLENAME + ' WHERE ID_ASSINANTE = :pID_ASSINANTE;';
  Connection.ExecSQL(sSQL,[iId],[ftInteger]);
  Result := True;
end;

function TAssinantesJornalDAO.FindById(iId: Integer): TObjectList<TAssinaturaJornal>;
var
  FDQuery: TFDQuery;
  assinantes: TObjectList<TAssinaturaJornal>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE ID_ASSINANTE = :pID_ASSINANTE');
    FDQuery.ParamByName('pID_ASSINANTE').AsInteger := iId;
    FDQuery.Open();
    assinantes := TObjectList<TAssinaturaJornal>.Create();
    while not FDQuery.Eof do
    begin
      assinantes.Add(TAssinaturaJornal.Create(FDQuery.FieldByName('ID_ASSINANTE').AsInteger,
                                              FDQuery.FieldByName('COD_ASSINANTE').AsString,
                                              FDQuery.FieldByName('COD_MODALIDADE').AsInteger,
                                              FDQuery.FieldByName('COD_PRODUTO').AsString,
                                              FDQuery.FieldByName('NUM_ORDEM').AsInteger,
                                              FDQuery.FieldByName('QTD_EXEMPLARES').AsInteger,
                                              FDQuery.FieldByName('NOM_ASSINANTE').AsString,
                                              FDQuery.FieldByName('DES_TIPO_LOGRADOURO').AsString,
                                              FDQuery.FieldByName('DES_LOGRADOURO').AsString,
                                              FDQuery.FieldByName('NUM_LOGRADOURO').AsString,
                                              FDQuery.FieldByName('DES_COMPLEMENTO').AsString,
                                              FDQuery.FieldByName('NOM_BAIRRO').AsString,
                                              FDQuery.FieldByName('NOM_CIDADE').AsString,
                                              FDQuery.FieldByName('UF_ESTADO').AsString,
                                              FDQuery.FieldByName('NUM_CEP').AsString,
                                              FDQuery.FieldByName('DES_REFERENCIA').AsString,
                                              FDQuery.FieldByName('DES_ROTEIRO').AsString,
                                              FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := assinantes;
end;

function TAssinantesJornalDAO.FindByCodigo(sCodigo: string): TObjectList<TAssinaturaJornal>;
var
  FDQuery: TFDQuery;
  assinantes: TObjectList<TAssinaturaJornal>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE COD_ASSINANTE LIKE :pCOD_ASSINANTE');
    FDQuery.ParamByName('pCOD_ASSINANTE').AsString := '%' + sCodigo;
    FDQuery.Open();
    assinantes := TObjectList<TAssinaturaJornal>.Create();
    while not FDQuery.Eof do
    begin
      assinantes.Add(TAssinaturaJornal.Create(FDQuery.FieldByName('ID_ASSINANTE').AsInteger,
                                              FDQuery.FieldByName('COD_ASSINANTE').AsString,
                                              FDQuery.FieldByName('COD_MODALIDADE').AsInteger,
                                              FDQuery.FieldByName('COD_PRODUTO').AsString,
                                              FDQuery.FieldByName('NUM_ORDEM').AsInteger,
                                              FDQuery.FieldByName('QTD_EXEMPLARES').AsInteger,
                                              FDQuery.FieldByName('NOM_ASSINANTE').AsString,
                                              FDQuery.FieldByName('DES_TIPO_LOGRADOURO').AsString,
                                              FDQuery.FieldByName('DES_LOGRADOURO').AsString,
                                              FDQuery.FieldByName('NUM_LOGRADOURO').AsString,
                                              FDQuery.FieldByName('DES_COMPLEMENTO').AsString,
                                              FDQuery.FieldByName('NOM_BAIRRO').AsString,
                                              FDQuery.FieldByName('NOM_CIDADE').AsString,
                                              FDQuery.FieldByName('UF_ESTADO').AsString,
                                              FDQuery.FieldByName('NUM_CEP').AsString,
                                              FDQuery.FieldByName('DES_REFERENCIA').AsString,
                                              FDQuery.FieldByName('DES_ROTEIRO').AsString,
                                              FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := assinantes;
end;

function TAssinantesJornalDAO.FindByNome(sNome: string): TObjectList<TAssinaturaJornal>;
var
  FDQuery: TFDQuery;
  assinantes: TObjectList<TAssinaturaJornal>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE NOM_ASSINANTE LIKE :pNOM_ASSINANTE');
    FDQuery.ParamByName('pNOM_ASSINANTE').AsString := sNome;
    FDQuery.Open();
    assinantes := TObjectList<TAssinaturaJornal>.Create();
    while not FDQuery.Eof do
    begin
      assinantes.Add(TAssinaturaJornal.Create(FDQuery.FieldByName('ID_ASSINANTE').AsInteger,
                                              FDQuery.FieldByName('COD_ASSINANTE').AsString,
                                              FDQuery.FieldByName('COD_MODALIDADE').AsInteger,
                                              FDQuery.FieldByName('COD_PRODUTO').AsString,
                                              FDQuery.FieldByName('NUM_ORDEM').AsInteger,
                                              FDQuery.FieldByName('QTD_EXEMPLARES').AsInteger,
                                              FDQuery.FieldByName('NOM_ASSINANTE').AsString,
                                              FDQuery.FieldByName('DES_TIPO_LOGRADOURO').AsString,
                                              FDQuery.FieldByName('DES_LOGRADOURO').AsString,
                                              FDQuery.FieldByName('NUM_LOGRADOURO').AsString,
                                              FDQuery.FieldByName('DES_COMPLEMENTO').AsString,
                                              FDQuery.FieldByName('NOM_BAIRRO').AsString,
                                              FDQuery.FieldByName('NOM_CIDADE').AsString,
                                              FDQuery.FieldByName('UF_ESTADO').AsString,
                                              FDQuery.FieldByName('NUM_CEP').AsString,
                                              FDQuery.FieldByName('DES_REFERENCIA').AsString,
                                              FDQuery.FieldByName('DES_ROTEIRO').AsString,
                                              FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := assinantes;
end;

function TAssinantesJornalDAO.FindByModalidade(iModalidade: Integer): TObjectList<TAssinaturaJornal>;
var
  FDQuery: TFDQuery;
  assinantes: TObjectList<TAssinaturaJornal>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE COD_MODALIDADE = :pCOD_MODALIDADE');
    FDQuery.ParamByName('pCOD_MODALIDADE').AsInteger := iModalidade;
    FDQuery.Open();
    assinantes := TObjectList<TAssinaturaJornal>.Create();
    while not FDQuery.Eof do
    begin
      assinantes.Add(TAssinaturaJornal.Create(FDQuery.FieldByName('ID_ASSINANTE').AsInteger,
                                              FDQuery.FieldByName('COD_ASSINANTE').AsString,
                                              FDQuery.FieldByName('COD_MODALIDADE').AsInteger,
                                              FDQuery.FieldByName('COD_PRODUTO').AsString,
                                              FDQuery.FieldByName('NUM_ORDEM').AsInteger,
                                              FDQuery.FieldByName('QTD_EXEMPLARES').AsInteger,
                                              FDQuery.FieldByName('NOM_ASSINANTE').AsString,
                                              FDQuery.FieldByName('DES_TIPO_LOGRADOURO').AsString,
                                              FDQuery.FieldByName('DES_LOGRADOURO').AsString,
                                              FDQuery.FieldByName('NUM_LOGRADOURO').AsString,
                                              FDQuery.FieldByName('DES_COMPLEMENTO').AsString,
                                              FDQuery.FieldByName('NOM_BAIRRO').AsString,
                                              FDQuery.FieldByName('NOM_CIDADE').AsString,
                                              FDQuery.FieldByName('UF_ESTADO').AsString,
                                              FDQuery.FieldByName('NUM_CEP').AsString,
                                              FDQuery.FieldByName('DES_REFERENCIA').AsString,
                                              FDQuery.FieldByName('DES_ROTEIRO').AsString,
                                              FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := assinantes;
end;

function TAssinantesJornalDAO.FindByProduto(sProduto: string): TObjectList<TAssinaturaJornal>;
var
  FDQuery: TFDQuery;
  assinantes: TObjectList<TAssinaturaJornal>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE COD_PRODUTO = :pCOD_PRODUTO');
    FDQuery.ParamByName('pCOD_PRODUTO').AsString := sProduto;
    FDQuery.Open();
    assinantes := TObjectList<TAssinaturaJornal>.Create();
    while not FDQuery.Eof do
    begin
      assinantes.Add(TAssinaturaJornal.Create(FDQuery.FieldByName('ID_ASSINANTE').AsInteger,
                                              FDQuery.FieldByName('COD_ASSINANTE').AsString,
                                              FDQuery.FieldByName('COD_MODALIDADE').AsInteger,
                                              FDQuery.FieldByName('COD_PRODUTO').AsString,
                                              FDQuery.FieldByName('NUM_ORDEM').AsInteger,
                                              FDQuery.FieldByName('QTD_EXEMPLARES').AsInteger,
                                              FDQuery.FieldByName('NOM_ASSINANTE').AsString,
                                              FDQuery.FieldByName('DES_TIPO_LOGRADOURO').AsString,
                                              FDQuery.FieldByName('DES_LOGRADOURO').AsString,
                                              FDQuery.FieldByName('NUM_LOGRADOURO').AsString,
                                              FDQuery.FieldByName('DES_COMPLEMENTO').AsString,
                                              FDQuery.FieldByName('NOM_BAIRRO').AsString,
                                              FDQuery.FieldByName('NOM_CIDADE').AsString,
                                              FDQuery.FieldByName('UF_ESTADO').AsString,
                                              FDQuery.FieldByName('NUM_CEP').AsString,
                                              FDQuery.FieldByName('DES_REFERENCIA').AsString,
                                              FDQuery.FieldByName('DES_ROTEIRO').AsString,
                                              FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := assinantes;
end;

function TAssinantesJornalDAO.FindByEndereco(sEndereco: string): TObjectList<Model.AssinaturaJornal.TAssinaturaJornal>;
var
  FDQuery: TFDQuery;
  assinantes: TObjectList<TAssinaturaJornal>;
  sCampos: TStringList;
  i: Integer;
  bFiltro: Boolean;
begin
  FDQuery := TFDQuery.Create(nil);
  if sEndereco.IsEmpty then
  begin
    Exit;
  end;
  sCampos.Delimiter := ';';
  sCampos.StrictDelimiter := True;
  sCampos.DelimitedText := sEndereco;
  bFiltro := False;
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME + ' WHERE ');
    for i := 0 to sCampos.Count - 1 do
    begin
      if not sCampos[i].IsEmpty then
      begin
        if i = 0 then
        begin
          FDQuery.SQL.Add('DES_TIPO_LOGRADOURO LIKE :pDES_TIPO_LOGRADOURO');
          FDQuery.ParamByName('pDES_TIPO_LOGRADOURO').AsString := sCampos[i];
          bFiltro := True;
        end;
        if i = 1 then
        begin
          if bFiltro then
          begin
            FDQuery.SQL.Add(' OR DES_LOGRADOURO LIKE :pDES_LOGRADOURO');
          end
          else
          begin
            FDQuery.SQL.Add('DES_LOGRADOURO LIKE :pDES_LOGRADOURO');
          end;
          FDQuery.ParamByName('pDES_LOGRADOURO').AsString := sCampos[i];
        end;
        if i = 2 then
        begin
          if bFiltro then
          begin
            FDQuery.SQL.Add(' OR NUM_LOGRADOURO LIKE :pNUM_LOGRADOURO');
          end
          else
          begin
            FDQuery.SQL.Add('NUM_LOGRADOURO LIKE :pNUM_LOGRADOURO');
          end;
          FDQuery.ParamByName('pNUM_LOGRADOURO').AsString := sCampos[i];
        end;
      end;
    end;
    FDQuery.Open();
    assinantes := TObjectList<TAssinaturaJornal>.Create();
    while not FDQuery.Eof do
    begin
      assinantes.Add(TAssinaturaJornal.Create(FDQuery.FieldByName('ID_ASSINANTE').AsInteger,
                                              FDQuery.FieldByName('COD_ASSINANTE').AsString,
                                              FDQuery.FieldByName('COD_MODALIDADE').AsInteger,
                                              FDQuery.FieldByName('COD_PRODUTO').AsString,
                                              FDQuery.FieldByName('NUM_ORDEM').AsInteger,
                                              FDQuery.FieldByName('QTD_EXEMPLARES').AsInteger,
                                              FDQuery.FieldByName('NOM_ASSINANTE').AsString,
                                              FDQuery.FieldByName('DES_TIPO_LOGRADOURO').AsString,
                                              FDQuery.FieldByName('DES_LOGRADOURO').AsString,
                                              FDQuery.FieldByName('NUM_LOGRADOURO').AsString,
                                              FDQuery.FieldByName('DES_COMPLEMENTO').AsString,
                                              FDQuery.FieldByName('NOM_BAIRRO').AsString,
                                              FDQuery.FieldByName('NOM_CIDADE').AsString,
                                              FDQuery.FieldByName('UF_ESTADO').AsString,
                                              FDQuery.FieldByName('NUM_CEP').AsString,
                                              FDQuery.FieldByName('DES_REFERENCIA').AsString,
                                              FDQuery.FieldByName('DES_ROTEIRO').AsString,
                                              FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := assinantes;
end;

function TAssinantesJornalDAO.FindByCEP(sCEP: string): TObjectList<TAssinaturaJornal>;
var
  FDQuery: TFDQuery;
  assinantes: TObjectList<TAssinaturaJornal>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE NOM_ASSINANTE LIKE :pNUM_CEP');
    FDQuery.ParamByName('pNUM_CEP').AsString := sCEP;
    FDQuery.Open();
    assinantes := TObjectList<TAssinaturaJornal>.Create();
    while not FDQuery.Eof do
    begin
      assinantes.Add(TAssinaturaJornal.Create(FDQuery.FieldByName('ID_ASSINANTE').AsInteger,
                                              FDQuery.FieldByName('COD_ASSINANTE').AsString,
                                              FDQuery.FieldByName('COD_MODALIDADE').AsInteger,
                                              FDQuery.FieldByName('COD_PRODUTO').AsString,
                                              FDQuery.FieldByName('NUM_ORDEM').AsInteger,
                                              FDQuery.FieldByName('QTD_EXEMPLARES').AsInteger,
                                              FDQuery.FieldByName('NOM_ASSINANTE').AsString,
                                              FDQuery.FieldByName('DES_TIPO_LOGRADOURO').AsString,
                                              FDQuery.FieldByName('DES_LOGRADOURO').AsString,
                                              FDQuery.FieldByName('NUM_LOGRADOURO').AsString,
                                              FDQuery.FieldByName('DES_COMPLEMENTO').AsString,
                                              FDQuery.FieldByName('NOM_BAIRRO').AsString,
                                              FDQuery.FieldByName('NOM_CIDADE').AsString,
                                              FDQuery.FieldByName('UF_ESTADO').AsString,
                                              FDQuery.FieldByName('NUM_CEP').AsString,
                                              FDQuery.FieldByName('DES_REFERENCIA').AsString,
                                              FDQuery.FieldByName('DES_ROTEIRO').AsString,
                                              FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := assinantes;
end;

function TAssinantesJornalDAO.FindByRoteiro(sRoteiro: String): TObjectList<TAssinaturaJornal>;
var
  FDQuery: TFDQuery;
  assinantes: TObjectList<TAssinaturaJornal>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE DES_ROTEIRO = :pDES_ROTEIRO');
    FDQuery.ParamByName('pDES_ROTEIRO').AsString := sRoteiro;
    FDQuery.Open();
    assinantes := TObjectList<TAssinaturaJornal>.Create();
    while not FDQuery.Eof do
    begin
      assinantes.Add(TAssinaturaJornal.Create(FDQuery.FieldByName('ID_ASSINANTE').AsInteger,
                                              FDQuery.FieldByName('COD_ASSINANTE').AsString,
                                              FDQuery.FieldByName('COD_MODALIDADE').AsInteger,
                                              FDQuery.FieldByName('COD_PRODUTO').AsString,
                                              FDQuery.FieldByName('NUM_ORDEM').AsInteger,
                                              FDQuery.FieldByName('QTD_EXEMPLARES').AsInteger,
                                              FDQuery.FieldByName('NOM_ASSINANTE').AsString,
                                              FDQuery.FieldByName('DES_TIPO_LOGRADOURO').AsString,
                                              FDQuery.FieldByName('DES_LOGRADOURO').AsString,
                                              FDQuery.FieldByName('NUM_LOGRADOURO').AsString,
                                              FDQuery.FieldByName('DES_COMPLEMENTO').AsString,
                                              FDQuery.FieldByName('NOM_BAIRRO').AsString,
                                              FDQuery.FieldByName('NOM_CIDADE').AsString,
                                              FDQuery.FieldByName('UF_ESTADO').AsString,
                                              FDQuery.FieldByName('NUM_CEP').AsString,
                                              FDQuery.FieldByName('DES_REFERENCIA').AsString,
                                              FDQuery.FieldByName('DES_ROTEIRO').AsString,
                                              FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := assinantes;
end;

function TAssinantesJornalDAO.FindByAssinatura(sCodigo: string; iModalidade: Integer; sProduto: string):
                                               TObjectList<TAssinaturaJornal>;
var
  FDQuery: TFDQuery;
  assinantes: TObjectList<TAssinaturaJornal>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    FDQuery.SQL.Add('WHERE COD_ASSINANTE = :pCOD_ASSINANTE AND COD_MODALIDADE = :pCOD_MODALIDADE AND COD_PRODUTO = :pCOD_PRODUTO');
    FDQuery.ParamByName('pCOD_ASSINANTE').AsString := sCodigo;
    FDQuery.ParamByName('pCOD_MODALIDADE').AsInteger := iModalidade;
    FDQuery.ParamByName('pCOD_PRODUTO').AsString := sProduto;
    FDQuery.Open();
    assinantes := TObjectList<TAssinaturaJornal>.Create();
    while not FDQuery.Eof do
    begin
      assinantes.Add(TAssinaturaJornal.Create(FDQuery.FieldByName('ID_ASSINANTE').AsInteger,
                                              FDQuery.FieldByName('COD_ASSINANTE').AsString,
                                              FDQuery.FieldByName('COD_MODALIDADE').AsInteger,
                                              FDQuery.FieldByName('COD_PRODUTO').AsString,
                                              FDQuery.FieldByName('NUM_ORDEM').AsInteger,
                                              FDQuery.FieldByName('QTD_EXEMPLARES').AsInteger,
                                              FDQuery.FieldByName('NOM_ASSINANTE').AsString,
                                              FDQuery.FieldByName('DES_TIPO_LOGRADOURO').AsString,
                                              FDQuery.FieldByName('DES_LOGRADOURO').AsString,
                                              FDQuery.FieldByName('NUM_LOGRADOURO').AsString,
                                              FDQuery.FieldByName('DES_COMPLEMENTO').AsString,
                                              FDQuery.FieldByName('NOM_BAIRRO').AsString,
                                              FDQuery.FieldByName('NOM_CIDADE').AsString,
                                              FDQuery.FieldByName('UF_ESTADO').AsString,
                                              FDQuery.FieldByName('NUM_CEP').AsString,
                                              FDQuery.FieldByName('DES_REFERENCIA').AsString,
                                              FDQuery.FieldByName('DES_ROTEIRO').AsString,
                                              FDQuery.FieldByName('DES_LOG').AsString));
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := assinantes;
end;


end.
