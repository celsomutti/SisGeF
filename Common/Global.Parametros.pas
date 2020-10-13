unit Global.Parametros;

interface

uses System.Classes;

var
  pDriverID : System.string;
  pCatalog: System.string;
  pServer : System.string;
  pDatabase : System.string;
  pPort : System.string;
  pUser_Name : System.string;
  pPassword : System.string;
  pEncrypt : System.string;
  pMetaDefSchema : System.string;
  pMetaDefCatalog : System.string;
  pUser_ID : System.Integer;
  pLastUser: System.String;
  pNameUser: System.String;
  pAdmin: System.string;
  pCodigoEntregador: String;
  pBase: Integer;
  pFileIni: String;
  pResult: String;
  pSTDBD: String;
  pLista: TStrings;
  pnivel: Integer;
  pUBD: String;
  pPBD: String;
  pKBD: String;
  pSkin: String;
  pEmailUsuario: String;
  pPasta: String;
const
    STDPWD = 'i8f0';
    ROOTREMOTELOGO = '/root/SisGeF5/Logo/';
    ROOTREMOTEDOC = '/root/SisGeF5/Doc/';
    OPERATORS: TArray<String> = ['', ' and ',' or ',' not '];
    CONDITIONS: TArray<String> = [' = ',' <> ',' > ',' < ',' >= ',' <= ',' between ',' in ',' like '];

implementation

end.
