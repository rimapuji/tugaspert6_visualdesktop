unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,
  ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnTotalGaji: TButton;
    btnIsiData: TButton;
    btnClose: TButton;
    cbJabatan: TComboBox;
    edtNama: TEdit;
    edtGapok: TEdit;
    edtTunjangan: TEdit;
    edtGajiBersih: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    rgStatus: TRadioGroup;
    procedure btnCloseClick(Sender: TObject);
    procedure btnIsiDataClick(Sender: TObject);
    procedure btnTotalGajiClick(Sender: TObject);
    procedure cbJabatanChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rgStatusClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.rgStatusClick(Sender: TObject);
begin
  if (rgStatus.ItemIndex = -1) then
      edtTunjangan.Text := '0'
    else
    if (rgStatus.ItemIndex = 0) then
      edtTunjangan.Text := '1500000'
    else
    if (rgStatus.ItemIndex = 1) then
      edtTunjangan.Text := '500000'
    else
end;

procedure TForm1.btnCloseClick(Sender: TObject);
begin
  Form1.Close;
end;

procedure TForm1.btnIsiDataClick(Sender: TObject);
begin
  edtNama.Text := '';
  CbJabatan.Text := 'Pilih Jabatan';
  edtGapok.Text := '0';
  rgStatus.ItemIndex := -1;
  edtTunjangan.Text := '0';
  edtGajiBersih.Text := '0';
end;

procedure TForm1.btnTotalGajiClick(Sender: TObject);
var
   hasil: real;
begin
    try
       if (''.Equals(edtNama.Text)) then
       begin
           raise Exception.Create('');
       end;

       hasil := StrToFloat(edtGapok.Text) + StrToFloat(edtTunjangan.Text);
       edtGajiBersih.Text := CurrToStr(hasil);
    except
       ShowMessage('nama, status dan jabatan wajib diisi');
    end;
end;

procedure TForm1.cbJabatanChange(Sender: TObject);
var
  jabatan: String;
begin
    jabatan := CbJabatan.Text;
    if ('Direktur'.Equals(jabatan)) then
        edtGapok.Text := '5000000'
    else
    if ('Manager'.Equals(jabatan)) then
        edtGapok.Text := '3000000'
    else
    if ('Karyawan'.Equals(jabatan)) then
        edtGapok.Text := '1000000'
    else
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

end.

