program Project2;
{$APPTYPE CONSOLE}
uses
  SysUtils, System, Windows;
var
  P: Array[1..10] of LongInt;
  i, n, m, a, c: LongInt;
  e: Real;
begin
SetConsoleOutputCP(1251);
while 1<>0 do begin
  repeat
    write('Enter N (N>0) or -1 to exit: ');
      if N=-1 then exit;
    readln(n);
  until n>0;
  writeln('Step-by-step solution:');
  writeln(#10#13,'Decomposing into prime factors:');
  write(n, ' = 1^1');
  i:=2;
  m:=n;
  c:=0;
  while i*i<=m do
  begin
    if m mod i=0 then
    begin
      a:=0;
      inc(c);
      P[c]:=i;
      while m mod i=0 do
      begin
        inc(a);
        m:=m div i;
      end;
      write(' x ', i, '^',a);
    end;
    Inc(i);
  end;
  if (m>1) then
  begin
    Inc(c);
    P[c]:=m;
    Write(' x ', m, '^1');
  end;
  Writeln(#10#13,#10#13,'Calculating Euler',#39,'s function:');
  e:=n;
  write('Ô(', n, ') = ', n);
  for i:=1 to c do
  begin
    e:=e*(1-1/P[i]);
    write(' x (1-1/',P[i], ')');
  end;
  if n>1 then writeln('=', Round(e),#10#13)
  else writeln;
  writeln('Result: ',round(e),#10#13,#10#13,'-----------------------------');
  end;
end.
