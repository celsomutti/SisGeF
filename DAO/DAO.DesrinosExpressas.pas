unit DAO.DesrinosExpressas;

interface

uses DAO.base, Model.DestinosExpressas, Generics.Collections, System.Classes;

type
  TDestinosExpressasDAO = class(TDAO)
  public
    function Insert(aDestinos: TDestiosExpressas): Boolean;
    function Update(aDestinos: TDestiosExpressas): Boolean;
    function Delete(aParam: array of Variant): Boolean;
    function Find(aParam: array of Variant): TObjectList<TDestiosExpressas>;
  end;

implementation

end.
