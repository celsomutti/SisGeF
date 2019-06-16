unit DAO.Cadastro;

interface

uses DAO.Base, Model.Cadastro, Generics.Collections, System.Classes;

type
  TCadastroDAO = class(TDAO)
  public
    function Insert(aCadastro: TCadastro): Boolean;
    function Update(aCadastro: TCadastro): Boolean;
    function Delete(iCodigo: Integer): Boolean;
    function FindByFilter(sFiltro: String): TObjectList<TCadastro>;
  end;
const
  TABLENAME = 'cad_cadastro';

implementation

uses System.SysUtils, FireDAC.Comp.Client, Data.DB;

function TCadastroDAO.Insert(aCadastro: TCadastro): Boolean;
var
  sSQL : String;
begin
  Result := False;
  aCadastro.Codigo := GetKeyValue(TABLENAME, 'ID_CADASTRO');
  sSQL := 'INSERT INTO ' + TABLENAME + ' (' +
  'ID_CADASTRO, COD_PESSOA, NOM_NOME_RAZAO, NOM_FANTASIA, DES_TIPO_DOC, NUM_CPF, NUM_CNPJ, NUM_RG, DES_EXPEDIDOR, UF_EXPEDIDOR, ' +
  'DAT_EMISSAO_RG, DAT_NASCIMENTO, NOM_PAI, NOM_MAE, DES_NATURALIDADE, UF_NATURALIDADE, NUM_SUFRAMA, NUM_CNH, NUM_CNAE, NUM_CRT, ' +
  'NUM_REGISTRO_CNH, UF_CNH, DAT_VALIDADE_CNH, DES_CATEGORIA_CNH, DAT_PRIMEIRA_CNH, NUM_PIS, NUM_CTPS, NUM_SERIE_CTPS, UF_CTPS, ' +
  'DES_ESTADO_CIVIL, NUM_TITULO_ELEITOR, NUM_RESERVISTA, DAT_CADASTRO, COD_USUARIO_PROPRIETARIO, COD_SEXO, ID_STATUS, DES_LOG) ' +
  'VALUES ' +
  '(pID_CADASTRO, pCOD_PESSOA, pNOM_NOME_RAZAO, pNOM_FANTASIA, pDES_TIPO_DOC, pNUM_CPF, pNUM_CNPJ, pNUM_RG, pDES_EXPEDIDOR, ' +
  'pUF_EXPEDIDOR, pDAT_EMISSAO_RG, pDAT_NASCIMENTO, pNOM_PAI, pNOM_MAE, pDES_NATURALIDADE, pUF_NATURALIDADE, pNUM_SUFRAMA, ' +
  'pNUM_CNH, pNUM_CNAE, pNUM_CRT, pNUM_REGISTRO_CNH, pUF_CNH, pDAT_VALIDADE_CNH, pDES_CATEGORIA_CNH, pDAT_PRIMEIRA_CNH, ' +
  'pNUM_PIS, NUM_CTPS, pNUM_SERIE_CTPS, pUF_CTPS, pDES_ESTADO_CIVIL, pNUM_TITULO_ELEITOR, pNUM_RESERVISTA, pDAT_CADASTRO, ' +
  'pCOD_USUARIO_PROPRIETARIO, pCOD_SEXO, pID_STATUS, pDES_LOG);';
  Connection.ExecSQL(sSQL,[aCadastro.Codigo, aCadastro.Pessoa, aCadastro.Nome, aCadastro.Alias, aCadastro.Nascimento,
                           aCadastro.NomePai, aCadastro.NomeMae, aCadastro.TipoDoc, aCadastro.CPFCNPJ, aCadastro.RG,
                           aCadastro.Expedidor, aCadastro.UFRG, aCadastro.DataRG, aCadastro.Naturalidade, aCadastro.UFNaturalidade,
                           aCadastro.CNH, aCadastro.RegistroCNH, aCadastro.ValidadeCNH, aCadastro.CategoriaCNH,
                           aCadastro.PrimeiraCNH, aCadastro.PIS, aCadastro.CTPS, aCadastro.SerieCTPS, aCadastro.UFCTPS,
                           aCadastro.UFCNH, aCadastro.EstadoCivil, aCadastro.TituloEleitor, aCadastro.ZonaEleitoral,
                           aCadastro.SecaoEleitoral, aCadastro.MunicipioEleitoral, aCadastro.UFEleitoral,
                           aCadastro.Reservista, aCadastro.Sexo, aCadastro.CNAE, aCadastro.CRT,
                           aCadastro.SUFRAMA, aCadastro.Responsavel, aCadastro.Cadastro,
                           aCadastro.Usuario, aCadastro.Status, aCadastro.Log],
                           [ftInteger, ftInteger, ftString, ftstring, ftDate, ftString, ftString, ftString, ftString, ftString,
                           ftString, ftString, ftDate, ftString, ftString, ftString, ftString, ftDate, ftString, ftString,
                           ftDate, ftString, ftString, ftString, ftString, ftString, ftString, ftstring, ftstring, ftstring,
                           ftstring, ftString, ftInteger, ftString, ftInteger, ftString, ftInteger, ftDateTime, ftInteger,
                           ftInteger, ftString]);
  Result := True;
end;

function TCadastroDAO.Update(aCadastro: TCadastro): Boolean;
var
  sSQL : String;
begin
  Result := False;
  sSQL := 'UPDATE ' + TABLENAME + 'SET ' +
  'COD_PESSOA = pCOD_PESSOA, NOM_NOME_RAZAO = pNOM_NOME_RAZAO, NOM_FANTASIA = pNOM_FANTASIA, DES_TIPO_DOC = pDES_TIPO_DOC, ' +
  'NUM_CPF = pNUM_CPF, NUM_CNPJ = pNUM_CNPJ, NUM_RG = pNUM_RG, DES_EXPEDIDOR = pDES_EXPEDIDOR, UF_EXPEDIDOR = pUF_EXPEDIDOR, ' +
  'DAT_EMISSAO_RG = pDAT_EMISSAO_RG, DAT_NASCIMENTO = pDAT_NASCIMENTO, NOM_PAI = pNOM_PAI, NOM_MAE = pNOM_MAE, ' +
  'DES_NATURALIDADE = pDES_NATURALIDADE, UF_NATURALIDADE = pUF_NATURALIDADE, NUM_SUFRAMA = pNUM_SUFRAMA, NUM_CNH = pNUM_CNH, ' +
  'NUM_CNAE = pNUM_CNAE, NUM_CRT = pNUM_CRT, NUM_REGISTRO_CNH = pNUM_REGISTRO_CNH, UF_CNH = pUF_CNH, ' +
  'DAT_VALIDADE_CNH = pDAT_VALIDADE_CNH, DES_CATEGORIA_CNH = pDES_CATEGORIA_CNH, DAT_PRIMEIRA_CNH = pDAT_PRIMEIRA_CNH, ' +
  'NUM_PIS = pNUM_PIS, NUM_CTPS = pNUM_CTPS, NUM_SERIE_CTPS = pNUM_SERIE_CTPS, UF_CTPS = pUF_CTPS, ' +
  'DES_ESTADO_CIVIL = pDES_ESTADO_CIVIL, NUM_TITULO_ELEITOR = pNUM_TITULO_ELEITOR, NUM_RESERVISTA = pNUM_RESERVISTA, ' +
  'DAT_CADASTRO = pDAT_CADASTRO, COD_USUARIO_PROPRIETARIO = pCOD_USUARIO_PROPRIETARIO, COD_SEXO = pCOD_SEXO, ' +
  'ID_STATUS = pID_STATUS, DES_LOG = pDES_LOG ' +
  'WHERE ' +
  'ID_CADASTRO = pID_CADASTRO;';
  Connection.ExecSQL(sSQL,[aCadastro.Pessoa, aCadastro.Nome, aCadastro.Alias, aCadastro.Nascimento,
                           aCadastro.NomePai, aCadastro.NomeMae, aCadastro.TipoDoc, aCadastro.CPFCNPJ, aCadastro.RG,
                           aCadastro.Expedidor, aCadastro.UFRG, aCadastro.DataRG, aCadastro.Naturalidade, aCadastro.UFNaturalidade,
                           aCadastro.CNH, aCadastro.RegistroCNH, aCadastro.ValidadeCNH, aCadastro.CategoriaCNH,
                           aCadastro.PrimeiraCNH, aCadastro.PIS, aCadastro.CTPS, aCadastro.SerieCTPS, aCadastro.UFCTPS,
                           aCadastro.UFCNH, aCadastro.EstadoCivil, aCadastro.TituloEleitor, aCadastro.ZonaEleitoral,
                           aCadastro.SecaoEleitoral, aCadastro.MunicipioEleitoral, aCadastro.UFEleitoral,
                           aCadastro.Reservista, aCadastro.Sexo, aCadastro.CNAE, aCadastro.CRT,
                           aCadastro.SUFRAMA, aCadastro.Responsavel, aCadastro.Cadastro,
                           aCadastro.Usuario, aCadastro.Status, aCadastro.Log, aCadastro.Codigo],
                           [ftInteger, ftString, ftstring, ftDate, ftString, ftString, ftString, ftString, ftString,
                           ftString, ftString, ftDate, ftString, ftString, ftString, ftString, ftDate, ftString, ftString,
                           ftDate, ftString, ftString, ftString, ftString, ftString, ftString, ftstring, ftstring, ftstring,
                           ftstring, ftString, ftInteger, ftString, ftInteger, ftString, ftInteger, ftDateTime, ftInteger,
                           ftInteger, ftString, ftInteger]);

  Result := True;
end;

function TCadastroDAO.Delete(iCodigo: Integer): Boolean;
var
  sSQL : String;
begin
  Result := False;
  sSQL := 'DELETE FROM ' + TABLENAME + 'WHERE ID_CADASTRO = pID_CADASTRO;';
  Connection.ExecSQL(sSQL,[iCodigo],[ftInteger]);
  Result := True;
end;

function TCadastroDAO.FindByFilter(sFiltro: String): TObjectList<TCadastro>;
var
  FDQuery: TFDQuery;
  cadastros: TObjectList<TCadastro>;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := Connection;
    FDQuery.SQL.Clear;
    FDQuery.SQL.Add('SELECT * FROM ' + TABLENAME);
    if not sFiltro.IsEmpty then
    begin
      FDQuery.SQL.Add('WHERE ' + sFiltro);
    end;
    FDQuery.Open();
    cadastros := TObjectList<TCadastro>.Create();
    while not FDQuery.Eof do
    begin
      {cadastros.Add(TCadastro.Create(FDQuery.FieldByName('ID_CADASTRO').AsInteger, FDQuery.FieldByName('COD_PESSOA').AsInteger,
                   FDQuery.FieldByName('NOM_NOME_RAZAO').AsString, FDQuery.FieldByName('NOM_FANTASIA').AsString,
                   FDQuery.FieldByName('DES_TIPO_DOC').AsString, FDQuery.FieldByName('NUM_CPF_CNPJ').AsString,
                   FDQuery.FieldByName('NUM_CNPJ').AsString, FDQuery.FieldByName('NUM_RG').AsString,
                   FDQuery.FieldByName('DES_EXPEDIDOR').AsString, FDQuery.FieldByName('UF_EXPEDIDOR').AsString,
                   FDQuery.FieldByName('DAT_EMISSAO_RG').AsDateTime, FDQuery.FieldByName('DAT_NASCIMENTO').AsDateTime,
                   FDQuery.FieldByName('NOM_PAI').AsString, FDQuery.FieldByName('NOM_MAE').AsString,
                   FDQuery.FieldByName('DES_NATURALIDADE').AsString, FDQuery.FieldByName('UF_NATURALIDADE').AsString,
                   FDQuery.FieldByName('NUM_SUFRAMA').AsString, FDQuery.FieldByName('NUM_CNH').AsString,
                   FDQuery.FieldByName('NUM_CNAE').AsString, FDQuery.FieldByName('NUM_CRT').AsInteger,
                   FDQuery.FieldByName('NUM_REGISTRO_CNH').AsString, FDQuery.FieldByName('UF_CNH').AsString,
                   FDQuery.FieldByName('DAT_VALIDADE_CNH').AsDateTime, FDQuery.FieldByName('DES_CATEGORIA_CNH').AsString,
                   FDQuery.FieldByName('DAT_PRIMEIRA_CNH').AsDateTime, FDQuery.FieldByName('NUM_PIS').AsString,
                   FDQuery.FieldByName('NUM_CTPS').AsString, FDQuery.FieldByName('NUM_SERIE_CTPS').AsString,
                   FDQuery.FieldByName('UF_CTPS').AsString, FDQuery.FieldByName('DES_ESTADO_CIVIL').AsString,
                   FDQuery.FieldByName('NUM_TITULO_ELEITOR').AsString, FDQuery.FieldByName('NUM_RESERVISTA').AsString,
                   FDQuery.FieldByName('DAT_CADASTRO').AsDateTime, FDQuery.FieldByName('COD_USUARIO_PROPRIETARIO').AsInteger,
                   FDQuery.FieldByName('COD_SEXO').AsInteger, FDQuery.FieldByName('ID_STATUS').AsInteger,
                   FDQuery.FieldByName('DES_LOG').AsString));}
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
  Result := cadastros;
end;

end.
