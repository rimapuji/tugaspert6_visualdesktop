unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnHitung: TButton;
    edtFaktorial: TEdit;
    edtJumlah: TEdit;
    edtDeret: TEdit;
    gbHasil: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

function Factorial(n: integer): integer;
begin
  if n <= 1 then
    Result := 1
  else
    Result := n * Factorial(n - 1);
end;

end.

