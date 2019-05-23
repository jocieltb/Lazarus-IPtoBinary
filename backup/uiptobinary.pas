unit uIPtoBinary;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, windows,
  Clipbrd, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    CheckBox1: TCheckBox;
    Auxiliar: TComboBox;
    EdtDec01: TEdit;
    EdtDec02: TEdit;
    EdtDec03: TEdit;
    EdtDec04: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ListBox1: TListBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    function DecToBin(Valor: integer): string;
    procedure EdtDec01Change(Sender: TObject);
    procedure EdtDec02Change(Sender: TObject);
    procedure EdtDec03Change(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;


implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button2Click(Sender: TObject);
begin
  ListBox1.Clear;
end;

procedure TForm1.CheckBox1Change(Sender: TObject);
begin
  if CheckBox1.Checked = True then
  begin
    ListBox1.Color := rgb(40, 41, 35);
    ListBox1.Font.Color := rgb(231, 219, 116);

    EdtDec01.Color := rgb(40, 41, 35);
    EdtDec02.Color := rgb(40, 41, 35);
    EdtDec03.Color := rgb(40, 41, 35);
    EdtDec04.Color := rgb(40, 41, 35);

    EdtDec01.Font.Color := rgb(0, 201, 228);
    EdtDec02.Font.Color := rgb(0, 201, 228);
    EdtDec03.Font.Color := rgb(0, 201, 228);
    EdtDec04.Font.Color := rgb(0, 201, 228);

    color := rgb(0, 0, 0);

    Label1.Font.Color := rgb(255, 255, 255);
    Label2.Font.Color := rgb(255, 255, 255);
    Label3.Font.Color := rgb(255, 255, 255);

  end
  else
  begin
    ListBox1.Color := rgb(255, 255, 255);
    ListBox1.Font.Color := rgb(128, 0, 0);

    EdtDec01.Color := rgb(255, 255, 255);
    EdtDec02.Color := rgb(255, 255, 255);
    EdtDec03.Color := rgb(255, 255, 255);
    EdtDec04.Color := rgb(255, 255, 255);

    EdtDec01.Font.Color := rgb(0, 0, 0);
    EdtDec02.Font.Color := rgb(0, 0, 0);
    EdtDec03.Font.Color := rgb(0, 0, 0);
    EdtDec04.Font.Color := rgb(0, 0, 0);

    color := rgb(240, 240, 240);

    Label1.Font.Color := rgb(0, 0, 0);
    Label2.Font.Color := rgb(0, 0, 0);
    Label3.Font.Color := rgb(0, 0, 0);
  end;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  EdtDec01.SetFocus:= true;
end;

function TForm1.DecToBin(Valor: integer): string;
var
  Binario: string;
begin
  while (valor >= 1) do
  begin
    Binario := IntToStr(valor mod 2) + Binario;
    Valor := (Valor div 2);
  end;
  if Binario.Length < 8 then
  begin
    while (Binario.Length < 8) do
    begin
      Binario := '0' + Binario;
    end;
  end;
  Result := Binario;

end;

procedure TForm1.EdtDec01Change(Sender: TObject);
var
  texto: string;
begin
  texto := EdtDec01.Text;
  if texto.Length >= 3 then
  begin
    EdtDec02.SetFocus;
  end;
end;

procedure TForm1.EdtDec02Change(Sender: TObject);
var
  texto: string;
begin
  texto := EdtDec02.Text;
  if texto.Length >= 3 then
  begin
    EdtDec03.SetFocus;
  end;

end;

procedure TForm1.EdtDec03Change(Sender: TObject);
var
  texto: string;
begin
  texto := EdtDec03.Text;
  if texto.Length >= 3 then
  begin
    EdtDec04.SetFocus;
  end;

end;

procedure TForm1.Label1Click(Sender: TObject);
begin
  if CheckBox1.Checked = false then
  begin
    CheckBox1.Checked:= true;
  end
  else
    CheckBox1.Checked:= false;
end;

procedure TForm1.ListBox1Click(Sender: TObject);
begin
  Label3.caption:= 'TCP/IP: '+ Auxiliar.Items.Strings[ListBox1.ItemIndex];
end;

procedure TForm1.ListBox1DblClick(Sender: TObject);
begin
  Clipboard.asText := ListBox1.items.strings[ListBox1.itemIndex];
end;

procedure TForm1.Button1Click(Sender: TObject);
var
 dec, bin: string;
begin
  if (StrToInt(EdtDec01.Text) <= 255) and (StrToInt(EdtDec02.Text) <= 255)
  and (StrToInt(EdtDec03.Text) <= 255) and (StrToInt(EdtDec04.Text) <= 255) then
  begin
  dec:= EdtDec01.Text + '.' +EdtDec02.Text +'.'+ EdtDec03.Text +'.'+ EdtDec04.Text;

  Auxiliar.Items.Add(dec);

  bin:= DecToBin(StrToInt(EdtDec01.Text)) + ' ' + DecToBin(StrToInt(EdtDec02.Text))
        +' ' + DecToBin(StrToInt(EdtDec03.Text)) + ' ' + DecToBin(StrToInt(EdtDec04.Text));
  ListBox1.Items.Add(bin);
  end
  else
  begin
    ShowMessage('Blocos de TCP/IP não podem ser maiores que 255...');
  end;

end;

end.

