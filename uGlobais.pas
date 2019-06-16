unit uGlobais;

interface

uses
  VCL.Forms, VCL.StdCtrls, VCL.ExtCtrls, VCL.Dialogs, SysUtils, StrUtils,
  Windows, Classes;

var
  Resultado: Boolean;
  UserAut: String;
  TipoExclusao: Integer;
  Lancamento: Integer;
  ListaAgentes: String;
  TipoExportacao: Integer;
  sResultado: String;
  sUsuario: String;
  iConta: Integer;
  iTotal: Integer;
  dPosicao: Double;
  sMensagem: String;
  sNomeUsuario: String;
  sSistema: String;
  lAgentes: TStringList;
  sIni: String;
  idUsuario: String;
  idGrupoUsuario: String;
  iNivelUsuario: Integer;
  sEmailUser: String;
  bFlagImprimir: Boolean;
  bFlagAtivo: Boolean;
  sServidor: String;
  sParemetro: String;
  iLinhas: Integer;
  sParametro1: String;
  iEtq: Integer;
  iTotalEtiquetas: Integer;
  ListaAmbiente: TStringList;
  lListas: TStringList;
  pDriverID : String;
  pServer : String;
  pDatabase : String;
  pPort : String;
  pUser_name: String;
  pPassword : String;
  pPrivilegio: String;
implementation

end.
