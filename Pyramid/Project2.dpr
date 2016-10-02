program Project2;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const Max=200;
var
 i,el:longint;
 heap:array [1..Max] of longint;
 current,tmp:longint;
 cmd:byte;

procedure InitHeap;
begin
 current:=0;
end;

function HighVal:longint;
var i:longint;
begin
 for i:=1 to Max do begin
  if heap[i]=0 then break;
 end;
 result:=i;
end;

procedure SwapUp(ind:longint);
var k:longint;
begin
 k:=ind div 2;
 if ind>1 then begin
  if heap[ind]<heap[k] then begin
   tmp:=heap[ind];
   heap[ind]:=heap[k];
   heap[k]:=tmp;
   SwapUp(k);
  end;
 end;
end;

procedure SwapDown(ind:longint);
var k:longint;
begin
 k:=ind*2;
 if k<current then begin
  if (k+1<=heap[ind]) and (heap[k]>heap[k+1]) then
    k:=k+1;
  if heap[ind]>heap[k] then begin
    tmp:=heap[ind];
    heap[ind]:=heap[k];
    heap[k]:=tmp;
    SwapDown(k);
  end;
 end;
end;

procedure HeapAdd(x:longint);
begin
 current:=current+1;
 heap[current]:=x;
 SwapUp(current);
end;

function ExtractMin:longint;
var val:longint;
begin
  val:=heap[1];
  heap[1]:=heap[current];
  heap[current]:=0;
  current:=current-1;
  SwapDown(1);
  ExtractMin:=val;
end;

procedure HeapDelete(x:longint);
begin
 current:=current-1;
 heap[1]:=heap[highval-1];
 SwapDown(current);
 heap[highval-1]:=0;
end;

begin
  InitHeap;
  while 1<>0 do begin
  writeln('1. Add');
  writeln('2. Print');
  writeln('3. Delete');
  writeln('4. Exit');
  readln(cmd);
  case cmd of
   1:begin
      while 1<>0 do begin
       writeln('Element: ');
       readln(el);
        if el=0 then begin
         writeln('Done.',#10#13);
         break;
        end
       else begin
        HeapAdd(el);
       end;
      end;
     end;
     2:begin
        writeln;
        for i:=1 to highval-1 do
         write(heap[i],' ');
        writeln(#10#13);
       end;
     3: begin
         writeln('Index (1..N) to delete: ');
         readln(el);
         HeapDelete(el);
        end;
     4: exit;
   end;
  end;
   readln;
end.
