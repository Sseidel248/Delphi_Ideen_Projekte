unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, GradientPanel;

type
  TForm2 = class(TForm)
    GradientPanel1: TGradientPanel;
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
var
  r: TRect;
begin
//  if (Screen.MonitorCount > 1) then
//  begin

//    r := Screen.MonitorFromPoint(Mouse.CursorPos).WorkareaRect;
//    Self.Position := poDesigned;
//    Self.Left := r.Left + ((r.Width - Width) div 2);
//    Self.Top := r.Top + ((r.Height - Height) div 2);

//    alternatively:
//    Self.SetBounds(
//      r.Left + ((r.Width - Width) div 2),
//      r.Top + ((r.Height - Height) div 2),
//      Width, Height);
//  end
//  else
//  begin
//    Self.Position := poScreenCenter;
//  end;
end;

end.
