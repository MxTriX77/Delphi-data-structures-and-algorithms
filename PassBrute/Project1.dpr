program Project1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,Windows;

const
  ALPHABETSIZE=12;
  pass_len=6;
  alpha:array[1..ALPHABETSIZE] of char ='012345abcdef';  //'0123456789abcdefghijklmnopqrstuvwxyz'
var f:textfile;
    t0,t1:long;

procedure BrutePass;
var  i:byte;
     str:string[pass_len];
     rank:array[1..pass_len] of byte;

begin
   assignfile(f,'passwords.txt');
   rewrite(f);
   for i:=1 to pass_len do rank[i]:=1;
   repeat
    str:='';
    for i:=1 to pass_len do str:=str+alpha[rank[i]];
     writeln(f,str);    // writeln(str);
    inc(rank[pass_len]);
  for i:=pass_len downto 1 do
  begin
    if rank[i]<=ALPHABETSIZE then break;
    if i=1 then exit;
    rank[i]:=1;
    inc(rank[i-1])
  end;
  until false;
end;

begin
  writeln('Generating pass file...');
  t0:=GetTickCount;
  BrutePass;
  t1:=GetTickCount;
  closefile(f);
  writeln('Done. Time elapsed: ',t1-t0,' ms');
  readln;
end.

