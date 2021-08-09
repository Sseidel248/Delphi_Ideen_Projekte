unit Unit3;

interface

type
  TMyClass = class(TObject)
  private
    Ftest : String;
  public
    constructor Create( ATest : String );

    property test : String read FTest;
  end;

implementation

constructor TMyClass.Create( ATest : String );
begin
  Self.Ftest := ATest;
end;


end.
