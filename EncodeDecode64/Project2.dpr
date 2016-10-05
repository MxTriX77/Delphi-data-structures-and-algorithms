program Project2;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const code='0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz+/';
var
 a:string;
 r:shortint;
    
function Encode(s:string):string;
var a,b,x,i: Integer;
begin  
  a:=0;   
  b:=0;   
  for i:=1 to length(s) do  
  begin  
    x:=Ord(s[i]);   
    b:= b*256+x;
    inc(a,8);   
    while a>=6 do  
    begin  
      dec(a,6);   
      x:=b div (1 shl a);
      b:=b mod (1 shl a);
      result:=result+code[x+1];
    end;
  end;
  if a>0 then
  begin
    x:=b shl (6-a);
    result:=result+code[x+1];
  end;
end;

function Decode(s:string):string;
var a,b,x,i: Integer;
begin
  a:=0;
  b:=0;
  for i:=1 to length(s) do
  begin
    x:=pos(s[i], code)-1;
    if x>=0 then
    begin
      b:=b*64+x;
      inc(a,6);
      if a>=8 then
      begin
        dec(a,8);
        x:=b shr a;
        b:=b mod (1 shl a);
        x:=x mod 256;
        result:=result+chr(x);
      end;   
    end  
    else
      Exit;
  end;
end;

begin
 while 1<>0 do
 begin
  writeln('Enter 0 to Encode or 1 to Decode: ');
  readln(r);
  if r=-1 then break;
  if r=0 then
  begin
   writeln('Enter text to encode: ');
   readln(a);
   writeln(a,' --> ',Encode(a),#10,#13);
  end
 else
  begin
   writeln('Enter text to decode: ' );
   readln(a);
   writeln(a,' --> ',Decode(a),#10,#13);
   end;
   end;
   end.