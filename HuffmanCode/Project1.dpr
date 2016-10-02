program Project1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

type THuffmanTree=^HuffmanTree;
 HuffmanTree=record
    sym        : char;
    freq       : integer;
    left,right : THuffmanTree;
 end;
 var HUFFMAN:array of THuffmanTree;
     str,fpath:string;
     manual_s:char;
     cmd,manual_f,index:integer;
     f:textfile;

procedure InitTree(var tree:THuffmanTree;s:char;f:integer);
begin
 if tree=nil then begin
   new(tree);
   tree^.sym:=s;
   tree^.freq:=f;
   tree^.right:=nil;
   tree^.left:=nil;
 end;
end;

procedure HuffmanCompress(source_s:string;mode:byte);
procedure printBroadways(var p:THuffmanTree;offset:integer);
var i: Integer;
begin
 if p<>nil then begin
  printBroadways(p^.right,offset+4);
  for i:=1 to offset do write(' ');
   writeln(p^.freq,'|',p^.sym);
  printBroadways(p^.left,offset+4);
 end;
end;
procedure CalculateCodes(root:THuffmanTree;l:string);
begin
 if (root^.left=nil) and (root^.right=nil) then begin
  writeln(root^.sym,'-',l);
 end else begin
 if root^.left<>nil then begin
  CalculateCodes(root^.left,l+'0');
 end;
 if root^.right<>nil then begin
  CalculateCodes(root^.right,l+'1');
 end;
 end;
end;
procedure Sort(var a:array of THuffmanTree;n:integer);
var i,j:integer;
    buff:THuffmanTree;
begin
  for i:=0 to n-1 do
    for j:=0 to n-1 do
      if a[j].freq<a[j+1].freq then  begin
          buff:=a[j+1];
          a[j+1]:=a[j];
          a[j]:=buff;
      end;
end;
var i,j,c,freq_split:integer;
    trim_s:string;
    x:char;
    buff:THuffmanTree;
begin
if mode=0 then begin
writeln('Source text to compress:  ',source_s,#10#13);
trim_s:=source_s;
 for i:=1 to length(trim_s) do begin
  for j:=length(trim_s) downto i+1 do
   if trim_s[j]=trim_s[i] then
     delete(trim_s,j,1);
 end;
 SetLength(HUFFMAN,length(trim_s));
 i:=1;
 while (i<=length(trim_s)) do begin
 c:=0;
 x:=trim_s[i];
  for j:=1 to length(source_s) do begin
    if x=source_s[j] then
      c:=c+1;
  end;
  InitTree(HUFFMAN[i-1],x,c);
  i:=i+1;
 end;
end;
 writeln('Frequency analysis:');
 for i:=0 to high(HUFFMAN) do
  writeln(huffman[i].sym,'-',huffman[i].freq,'   ');
  writeln(#10#13);
  while length(huffman)<>1 do begin
   Sort(HUFFMAN,high(HUFFMAN));
   New(buff);
   freq_split:=huffman[high(huffman)].freq+huffman[high(huffman)-1].freq;
   buff^.left:=huffman[high(huffman)-1];
   buff^.right:=huffman[high(huffman)];
   buff^.freq:=freq_split;
   buff^.sym:='*';     // empty symbol substitutor
   huffman[high(huffman)-1]:=buff;
   setlength(huffman,length(huffman)-1);
   Sort(HUFFMAN,high(HUFFMAN));
  end;
  writeln('-------- HUFFMAN TREE --------');
  printBroadways(huffman[0],2);
  writeln('------------------------------',#10#13);
  writeln('Huffman codes:');
  CalculateCodes(huffman[0],'');
end;

begin
 writeln('1. Choose file');
 writeln('2. Enter text');
 writeln('3. Manual frequencies');
 writeln('-');
 writeln('0. Exit');
 writeln('Command: ');
 readln(cmd);
 case cmd of
  0:exit;
  1:begin
     writeln('File path: ');
     readln(fpath);
     assignfile(f,fpath);
     reset(f);
     while not EOF(f) do
      read(f,str);
     closefile(f);
     writeln;
     HuffmanCompress(str,0);
    end;
  2:begin
     writeln(#10#13,  'Enter text: ');
     readln(str);
     HuffmanCompress(str,0);
    end;
  3: begin
      index:=0;
      while 1<>0 do begin
       writeln('Enter symbol/frequency (0 0 to finish): ');
       readln(manual_s,manual_f);
       if (manual_s='0') and (manual_f=0) then exit
       else begin
       setlength(huffman,length(huffman)+1);
       InitTree(huffman[index],manual_s,manual_f);
       index:=index+1;
       end;
      end;
      HuffmanCompress('',1);
      readln;
     end;
 end;
 readln;
end.

