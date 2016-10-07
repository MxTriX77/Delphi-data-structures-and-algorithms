program Project1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,Windows;

const
  ALPHABETSIZE=18;
  len=5;
  alpha:array[1..ALPHABETSIZE] of char ='0123456789abcdefgh';  //'0123456789abcdefghijklmnopqrstuvwxyz'
var f:textfile;
    t0,t1:long;

function AlphaToStr:string;
var i:integer;
    s:string;
begin
  s:='';
  for i:=1 to high(alpha) do
     s:=s+alpha[i];
  result:=s;
end;

procedure BrutePass;
var  i:byte;
     str:string[len];
     rank:array[1..len] of byte;

begin
   assignfile(f,'passwords.txt');
   rewrite(f);
   for i:=1 to len do rank[i]:=1;
   repeat
    str:='';
    for i:=1 to len do str:=str+alpha[rank[i]];
     writeln(f,str);    // writeln(str);
    inc(rank[len]);
  for i:=len downto 1 do
  begin
    if rank[i]<=ALPHABETSIZE then break;
    if i=1 then exit;
    rank[i]:=1;
    inc(rank[i-1])
  end;
  until false;
  closefile(f);
end;

begin
  writeln('Alphabet: ',AlphaToStr,', password length: ',len);
  writeln('Generating pass file...');
  t0:=GetTickCount;
  BrutePass;
  t1:=GetTickCount;

  writeln('Done. Time elapsed: ',t1-t0,' ms');
  readln;
end.

