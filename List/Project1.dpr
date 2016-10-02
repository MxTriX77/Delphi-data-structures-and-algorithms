program Project1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

type
 pNode=^Node;
 Node=record
   value:integer;
   next:pNode;
 end;
var  head:pNode;
     cmd,acmd:integer;
     z,x,value,num,nums,numd:integer;
  pt,f:pNode;

 procedure PushFront(var head:pNode;x:integer);
 var n:pNode;
 begin
   New(n);
   n^.value:=x;
   n^.next:=head;
   head:=n;
 end;

 procedure PushBack(var head:pNode);
 var n,pt:pNode;
 x:integer;
 begin
   if head=nil then
   begin
    writeln('Enter number: ');
       readln(x);
     New(head);
     head^.value:=x;
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
      n^.value:=x;
      n^.next:=nil;
      pt^.next:=n;
   end;
 end;

 procedure afterFirstMatch(var head:pNode);
var x,pos:integer;
pt,n:pNode;
begin
  if head=nil then
    begin
      write('Enter number: ');
      readln(x);
      New(head);
      head^.value:=x;
      head^.next:=nil;
    end
  else
    begin
       write('Enter number: ');
       readln(x);
       write('Enter number to add after: ');
       readln(pos);
       pt:=head;
       while pt<>nil do
        if pt^.value=pos then
        begin
          New(n);
          n^.value:=x;
          n^.next:=pt^.next;
          pt^.next:=n;
          break;
        end
        else pt:=pt^.next;
    end;
end;
procedure afterAllMatches(var head:pNode);
var x,pos:integer;
pt,n:pNode;
begin
      write('Enter number: ');
      readln(x);
       write('Enter number to add after: ');
       readln(pos);
       pt:=head;
       while pt<>nil do
       if pt^.value=pos then
       begin
         New(n);
         n^.value:=x;
         n^.next:=pt^.next;
         pt^.next:=n;
         pt:=pt^.next;
       end
       else
       pt:=pt^.next;
end;


 procedure Print(var head:pNode);
 var pt:pNode;
 begin
 writeln(#10#13,'------------LIST----------------');
   pt:=head;
   while pt<>nil  do
   begin
   write(pt^.value,' ');
   pt:=pt^.next;
   end;
   writeln;
   writeln('---------------------------------');
 end;

 function findl(var head:pNode;x:integer):boolean;
  var pt,pt1:pnode;
      f:boolean;
   begin
   f:=false;
   pt:=head;
   pt1:=nil;
   while pt<>nil do
   begin
      if pt^.value=x then
      begin
      f:=true;
      writeln('-------------------------------------');
       if(pt1<>nil)then writeln('Previous: ',pt1^.value,' at ',integer(pt1));
        writeln('Current: ',pt^.value,' at ',integer(pt));
        if (pt^.next<>nil) then
        begin
          writeln('Next: ',pt^.next.value,' at ',integer(pt^.next));
        end;
          writeln('-------------------------------------',#10#13);
      end;

      pt1:=pt;
      pt:=pt^.next;
      end;

   result:=f;
   end;

 procedure Delete(var head:pNode;x:integer);
var  pt,n:pNode;
begin
     pt:=head;
     while pt<>nil do
      if pt^.value=x then
        begin
          if pt=head then
            begin
              head:=head^.next;
              Dispose(pt);
              pt:=head;
            end
          else
            begin
              n^.next:=pt^.next;
              Dispose(pt);
              pt:=n^.next;
            end;
      end
      else
      begin
        n:=pt;
        pt:=pt^.next;
      end;
end;

begin
  try
    while 1<>0 do begin
    writeln('1. Print');
    writeln('2. Add a new element');
    writeln('3. Search an element');
    writeln('4. Delete');
    writeln('5. Exit');
    readln(cmd);
    case (cmd) of
     1:print(pt);  // print list
     2:begin  // adding a new element
       writeln(#10#13,'1. To the beginning');
       writeln('2. To the ending');
       writeln('3. After a certain value');
       writeln('4. After all certain values');
       readln(acmd);
       case (acmd) of
       1:begin
         writeln('Enter number: ');
         readln(num);
         PushFront(pt,num);
         Print(pt);
       end;
       2:begin
       PushBack(pt);
       print(pt);
       end;
       3:begin
         afterFirstMatch(pt);
         Print(pt);
       end;
       4: begin
         afterAllMatches(pt);
         print(pt);
       end;
       end;
     end;
     3:begin //  search
      writeln('Enter number to search: ');
      readln(nums);
      if (findl(pt,nums)=false) then writeln(
      #10#13,'Nothing was found.'#10#13)
      else findl(pt,nums);
     end;
     4:begin  //   delete
      writeln('Enter number to delete: ');
      readln(numd);
      Delete(pt, numd);
     end;
     5: exit;
    end;
    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
