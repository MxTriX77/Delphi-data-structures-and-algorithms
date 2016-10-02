unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TKMP = class(TForm)
    stLbl: TLabel;
    SText: TMemo;
    ssLbl: TLabel;
    Substring: TEdit;
    searchBtn: TButton;
    Button1: TButton;
    vprefix: TMemo;
    pfx: TLabel;
    procedure searchBtnClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
type kmp_prefix=array of longint;
var
  KMP: TKMP;
  _pi:kmp_prefix;
  size:boolean=false;

implementation

{$R *.dfm}

function KMPSearch(const P,T:string):integer;
//   INTERNAL PREFIX FUNCTION
function Prefix(P:string):kmp_prefix;
var
  i,j : integer;
  pi  : kmp_prefix;
begin
  i:=3;
  j:=1;
  SetLength(pi,Length(P)+1);
  pi[1]:=0;
  if (length(P)>1) then
    pi[2]:=1;
  while (i<=length(P)) do begin
    if (P[i-1]=P[j]) then begin
      pi[i]:=j+1;
      j:=j+1;
      i:=i+1;
    end
    else if (j>1) then begin
      j:=pi[j];
    end
    else begin
      pi[i]:=1;
      i:=i+1;
      j:=1;
    end;
  end;
  _pi:=pi;    // shall be removed for any other purposes
  result:=pi;
end;
var
  pi  : kmp_prefix;
  m,i : integer;
begin
  pi:=prefix(P);
  i:=1;
  m:=1;
  while (((m+i)<=Length(T)) and (i<=Length(P))) do begin
    if (T[m+i]=P[i]) then begin
      inc(i);
    end
    else begin
      m:=m+(i-pi[i] );
      if (i>1) then
        i:=pi[i];
    end;
  end;
  if m=length(T) then
    Result:=0
  else
    result:=m;
end;

procedure TKMP.Button1Click(Sender: TObject);
begin
 if size=false then begin
  kmp.clientheight:=417;
  size:=true;
 end
  else begin
  kmp.ClientHeight:=285;
   size:=false;
  end;
end;

procedure TKMP.searchBtnClick(Sender: TObject);
var   pos,i:integer;
begin
 pos:=-1;
 vprefix.Text:='Prefix: ';
 pos:=KMPSearch(Substring.Text,SText.Text);
 for i:=0 to high(_pi) do
  vprefix.Text:=vprefix.Text+inttostr(_pi[i]);
  vprefix.Lines.Add('Position: '+inttostr(pos));
 if pos<>-1 then  begin
   SText.setfocus;
   SText.selstart:=pos;
   SText.sellength:=length(Substring.text);
 end;
end;

end.
