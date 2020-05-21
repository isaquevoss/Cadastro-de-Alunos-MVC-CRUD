unit uDao;

interface

type

  TCondition = class
  private
    Ffield: string;
    Fvalue: string;
    Foperator: string;

  public
    property field: string read Ffield write Ffield;
    property operatorType: string read Foperator write Foperator;
    property value: string read Fvalue write Fvalue;

    constructor Create();
  end;

  TOrderBy = class
  private
    Ffield: string;
    Fdirection: string;
  public
  property field: string read Ffield write Ffield;
  property direction: string read Fdirection write Fdirection;

  end;

implementation

{ TCondition }

constructor TCondition.Create;
begin
  operatorType := '=';
end;

end.
