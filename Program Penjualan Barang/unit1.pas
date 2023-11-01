unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnHitung: TButton;
    btnUlang: TButton;
    btnKeluar: TButton;
    cbKode: TComboBox;
    edtQTY: TEdit;
    edtNama: TEdit;
    edtHarga: TEdit;
    edtSubTotal: TEdit;
    edtDiskon: TEdit;
    edtTotal: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure btnHitungClick(Sender: TObject);
    procedure btnKeluarClick(Sender: TObject);
    procedure btnUlangClick(Sender: TObject);
    procedure cbKodeChange(Sender: TObject);
    procedure edtQTYChange(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.cbKodeChange(Sender: TObject);
var
  kodeBarang: String;
begin
  kodeBarang := cbKode.Text;
  case kodeBarang of
  'A01':
  begin
    edtNama.Text := 'Speaker';
    edtHarga.Text := '50000';
  end;
  'B02':
  begin
    edtNama.Text := 'Mouse';
    edtHarga.Text := '25000';
  end;
  'C03':
  begin
    edtNama.Text := 'Hardisk';
    edtHarga.Text := '750000';
  end;
  'D04':
  begin
    edtNama.Text := 'Mouse Pad';
    edtHarga.Text := '5000';
  end;
  else
  begin
    // Handle the case where kodeBarang doesn't match any of the specified values
  end;
end;

end;

procedure TForm1.edtQTYChange(Sender: TObject);
var
  quantity: Integer;
  subTotal, hargaSatuan: Real;
begin
  try
    if edtQTY.Text = '' then
    else
      quantity := StrToInt(edtQTY.Text);

    if (quantity > 10) or (quantity < 1) then
    begin
      raise Exception.Create('Quantity tidak boleh lebih dari 10 atau kurang dari 1');
    end;

    hargaSatuan := StrToFloat(edtHarga.Text);
    subTotal := quantity * hargaSatuan;
    edtSubTotal.Text := CurrToStr(subTotal);
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
    end;
  end;
end;

procedure TForm1.btnHitungClick(Sender: TObject);
var
  subTotal: Real;
begin
  subTotal := StrToFloat(edtSubTotal.Text);
   if subTotal >= 100000 then
       begin
         edtDiskon.Text := '15';
         edtTotal.Text := CurrToStr(0.15 * subTotal);
       end
    else
    if subTotal >= 50000 then
       begin
         edtDiskon.Text := '10';
         edtTotal.Text := CurrToStr(0.10 * subTotal);
       end
    else
    if subTotal >= 50000 then
       begin
         edtDiskon.Text := '10';
         edtTotal.Text := CurrToStr(0.10 * subTotal);
       end
    else
    if subTotal >= 25000 then
       begin
         edtDiskon.Text := '5';
         edtTotal.Text := CurrToStr(0.5 * subTotal);
       end
    else
    begin
      edtDiskon.Text := '0';
      edtTotal.Text := CurrToStr(subTotal);
    end;
end;

procedure TForm1.btnKeluarClick(Sender: TObject);
begin
  Form1.Close;
end;

procedure TForm1.btnUlangClick(Sender: TObject);
begin
     cbKode.Text := 'Pilih kode barang';
     edtNama.Text := '';
     edtHarga.Text := '0';
     edtQTY.Text := '';
     edtQTY.TextHint := '0';
     edtSubTotal.Text := '0';
     edtDiskon.Text := '0';
     edtTotal.Text := '0';
end;

end.

