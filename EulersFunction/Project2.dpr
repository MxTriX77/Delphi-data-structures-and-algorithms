program Project2;
{$APPTYPE CONSOLE}
uses
  SysUtils, Windows;
var
  P:array[1..10] of longint;
  i,j,N,x,y:longint;
  e:real;

function IsPrime(a:longint):boolean;
var i:integer;
begin
if a<2 then IsPrime:=false else
for i:=1 to a div 2 do
if ((a mod i)=0) and (i<>1) then IsPrime:=false;
end;

begin
  while 1<>0 do begin
  repeat
    write('Enter N (N>0) or -1 to exit: ');
      if N=-1 then exit;
    readln(N);
  until N>0;
  writeln('Step-by-step solution:');
  if isPrime(N) then
     writeln(#10#13,'Since ',N,' is prime: ô(N)=N-1=',N-1,#10#13,#10#13,'-----------------------------')
  else begin
  writeln(#10#13,'Decomposing into prime factors:');
  write(N,'=1^1');
  i:=2;
  j:=N;
  y:=0;
  while i*i<=j do
  begin
    if j mod i=0 then
    begin
      x:=0;
      y:=y+1;;
      P[y]:=i;
      while j mod i=0 do
      begin
        x:=x+1;;
        j:=j div i;
      end;
      write(' x ',i,'^',x);
    end;
    Inc(i);
  end;
  if (j>1) then
  begin
    y:=y+1;
    P[y]:=j;
    Write(' x ',j,'^1');
  end;
  Writeln(#10#13,#10#13,'Calculating Euler',#39,'s function:');
  e:=N;
  write('ô(',N,')=',N);
  for i:=1 to y do
  begin
    e:=e*(1-1/P[i]);
    write(' x (1-1/',P[i],')');
  end;
  if N>1 then writeln('=',round(e),#10#13)
  else writeln;
  writeln('Result: ',round(e),#10#13,#10#13,'-----------------------------');
  end;
  end;
end.
