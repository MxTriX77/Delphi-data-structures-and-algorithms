program Project4;

{$APPTYPE CONSOLE}


uses
  SysUtils,
  windows;

type Telement=integer;

type stack=record
        top:integer;
        element:array of integer;
        end;

type pNode=^stacklist;
  stacklist = record
    next:pNode;
    val:integer;
  end;
type queue=record
      top:integer;
      element:array of integer;
      end;
procedure PushStack(var s:stack);
var x:integer;
begin
  if s.top=length(s.element) then
  begin
    setlength(s.element,length(s.element)+1);
  end;
  if s.top<>length(s.element) then
  begin
    write('Enter number to add: ');
    readln(x);
    s.element[s.top]:=x;
    s.top:=s.top+1;
  end;
end;

procedure PrintStack(var s:stack);
var i :integer;
begin
writeln('===================');
  for i := 0 to High(s.element) do
  begin
    write(s.element[i],' ');
  end;
  writeln;
end;

procedure PopStack(var s :stack);
begin
  if s.top>0 then
    begin
      s.element[s.top-1]:=0;
      dec(s.top);
    end;
end;

function getTop(var s:stack):integer;
var i,n:integer;
begin
n:=0;
  for i := 0 to High(s.element) do
  begin
     if s.element[i]<>0 then
        begin
             n:=s.element[i];
        end;
  end;
  result:=n;
end;

function empty(var s :stack):boolean;
var i:integer;
fl:boolean;
begin
fl:=false;
for i := 0 to High(s.element) do
if s.element[i]<>0 then
begin
fl:=true;
break;
end
else
begin
fl:=false;
end;
if fl=true then
begin
writeln('Stack is empty');
end;
if fl=false then
begin
writeln('Stack is empty');
end;
result:=fl;
end;

procedure Clear(var s :stack);
var i :integer;
begin
if(length(s.element)>0) then
begin
  for i := 0 to High(s.element) do
    begin
      s.element[i]:=0;
    end;
      s.top:=0;
end
else
writeln('Stack has been cleaned.');
end;

procedure stackbymas(var s:stack);
var x ,t:integer;
    f:boolean;
begin
    while true  do
    begin
      writeln('===================');
      writeln('1.Insert');
      writeln('2.Delete');
      writeln('3.Print');
      writeln('4.Show top');
      writeln('5.Clean');
      writeln('6.Check if empty');
      writeln('7.Exit');
      writeln('===================');
         readln(x);
      case x  of
        1:PushStack(s);
        2:PopStack(s);
        3: PrintStack(s);
        4: begin
            writeln('===================');
            t:=getTop(s);
            writeln('Top: ',t);
        end;
        5:clear(s);
        6: f:=empty(s);
        7:break;
      end;
    end;
end;

procedure PushStackList(var head:pNode);
 var n:pNode;
 x:integer;
 begin
 write('Enter number: ');
 readln(x);
   New(n);
   n^.val:=x;
   n^.next:=head;
   head:=n;
 end;

 procedure PrintList(var head:pNode);
 var pt:pNode;
 begin
writeln('===================');
   pt:=head;
   while pt<>nil  do
   begin
   writeln(pt^.val,' ');
   pt:=pt^.next;
   end;
 end;

procedure Pop(var head:pnode);
var pt:pnode;
begin
  if head<>nil then
    begin
       pt:=head;
      head:=head^.next;
      Dispose(pt);
      pt:=nil;
    end;
end;

procedure ClearList(var head:pnode);
var pt :pnode;
begin
  while head<>nil do
  begin
    pt:=head;
    head:=head^.next;
    Dispose(pt);
  end;
end;

procedure stackbylist(var head:pnode);
var x:integer;
begin

    while true  do
    begin
      writeln('===================');
      writeln('1.Insert');
      writeln('2.Delete');
      writeln('3.Print');
      writeln('4.Show top');
      writeln('5.Clear');
      writeln('6.Check if empty');
      writeln('7.Exit');
      writeln('===================');
         readln(x);
      case x  of
        1:PushStackList(head);
        2:Pop(head);
        3: PrintList(head);
        4: begin
          writeln('===================');
          if head<>nil then
          writeln('TOP: ',head^.val)
          else
          writeln('Stack is empty');
        end;
        5: ClearList(head);
        6:  begin
          if head=nil then
           begin
           writeln('===================');
             writeln('Stack is empty');
           end
           else writeln('Stack is not empty');
        end;
        7:break;
      end;

    end;

end;

procedure PushQueueList(var head:pNode);
 var n,pt:pNode;
 x:integer;
 begin
   if head=nil then
   begin
    writeln('Enter number: ');
       readln(x);
     New(head);
     head^.val:=x;
     head^.next:=nil;
   end
   else
   begin
     writeln('Enter number: ');
       readln(x);
     pt:=head;
     while pt^.next<>nil do
      pt:=pt^.next;
      New(n);
      n^.val:=x;
      n^.next:=nil;
      pt^.next:=n;
   end;
 end;

procedure queuebylist(var head:pnode);
var x:integer;
begin

    while true  do
    begin
      writeln('===================');
      writeln('1.Insert');
      writeln('2.Delete');
      writeln('3.Print');
      writeln('4.Show top');
      writeln('5.Clear');
      writeln('6.Check if empty');
      writeln('7.Exit');
      writeln('===================');
         readln(x);
      case x  of
        1:PushQueueList(head);
        2:Pop(head);
        3: PrintList(head);
        4: begin
          writeln('===================');
          if head<>nil then
          writeln('TOP: ',head^.val)
          else
          writeln('Queue is empty');
        end;
        5: ClearList(head);
        6:  begin
          if head=nil then
           begin
           writeln('===================');
             writeln('Queue is empty');
           end
           else writeln('Queue is not empty');
        end;
        7:break;
      end;

    end;

end;
var x:integer;
    a:stack;
    h:pnode;
    k:pnode;
begin
setconsoleoutputcp(1251);
while true do
  begin
  writeln('===================');
  writeln('1.Array stack');
  writeln('2.Pointer stack');
  writeln('3.Pointer queue');
  writeln('===================');
    readln(x);

    case x of
    1:stackbymas(a);
    2:stackbylist(h);
    3:queuebylist(k);
    end;
  end;
end.
