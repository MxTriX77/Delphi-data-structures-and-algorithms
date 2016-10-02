library Caesar;

uses
  SysUtils,
  Classes;

function Encrypt(x:char;k:integer):char;
var index,y:Integer;
begin
 index:=ord(x);
 y:=(index+k) mod 256;
 result:=chr(y);
end;

function Decrypt(y:Char;k:integer):char;
var index,x:integer;
begin
 index:=Ord(y);
 x:=(index-k+256) mod 256;
 result:=chr(x);
end;

exports
        Encrypt;
         exports decrypt;
{$R *.res}
begin
end.
 