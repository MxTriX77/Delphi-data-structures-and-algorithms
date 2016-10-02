unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    encBtn: TButton;
    decBtn: TButton;
    frText: TEdit;
    toText: TEdit;
    lbl1: TLabel;
    key: TEdit;
    moreBtn: TButton;
    bruteLBl: TLabel;
    bruteBtn: TButton;
    brute: TListBox;
    clr: TButton;
    bvl1: TBevel;
    procedure encBtnClick(Sender: TObject);
    procedure decBtnClick(Sender: TObject);
    procedure moreBtnClick(Sender: TObject);
    procedure bruteBtnClick(Sender: TObject);
    procedure clrClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  function Encrypt(x:char;k:integer):char; external 'caesar.dll';
  function Decrypt(x:char;k:integer):char; external 'caesar.dll'
  var full:Byte=0;

implementation

{$R *.dfm}

procedure TForm1.encBtnClick(Sender: TObject);
var i:Integer;
begin
  totext.text:='';
  if key.Text='' then MessageBox(handle, PChar('Enter valid key!'),PChar('Invalid K'), MB_ICONSTOP)
  else begin
 for i:=1 to Length(frText.Text) do
  toText.Text:=toText.Text+Encrypt(frText.Text[i],StrToInt(key.text));
  end;
end;

procedure TForm1.decBtnClick(Sender: TObject);
var i:integer;
begin
  totext.text:='';
  if key.Text='' then MessageBox(handle, PChar('Enter valid key!'),PChar('Invalid K'), MB_ICONSTOP)
  else begin
  totext.text:='';
  for i:=1 to Length(frText.Text) do
  toText.Text:=toText.Text+Decrypt(frText.Text[i],strtoint(key.text));
  end;
end;

procedure TForm1.moreBtnClick(Sender: TObject);
begin
if full=0 then begin
  form1.Height:=565;
  morebtn.Caption:='Less';
  full:=1;
  end
else begin
 form1.Height:=269;
  morebtn.Caption:='More';
  full:=0;
 end
 end;
procedure TForm1.bruteBtnClick(Sender: TObject);
var index,i:integer;
    tmp:string;
begin
  index:=1;
  brute.items.clear;
  while index<=255 do begin
    brute.Items.add('');
    for i:=1 to Length(frText.Text) do
      tmp:=tmp+Decrypt(frText.Text[i],index);
    brute.Items.Add('k='+inttostr(index)+':  '+tmp);
    tmp:='';
    brute.Items.add('');
    inc(index,1);
  end;
end;

procedure TForm1.clrClick(Sender: TObject);
begin
brute.Items.clear;
end;

end.
