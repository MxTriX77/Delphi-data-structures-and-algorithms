program Project1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

type
  pNode=^NodeType;
   NodeType=record
    value  : integer;
    left   : pNode;
    right  : pNode;
   end;
var
  Tree:pNode;
  cmd1,cmd2:byte;
  nVal,fnode_l,fnode_r:integer;
  fnode1,fnodepr:pNode;
  lbool,rbool:boolean;


procedure Initialize(var tree:pNode);
begin
 tree:=nil;
end;

{procedure Insert(var tree:pNode;val:integer);  //non-recursial insertion
var temp,loc,prev:pNode;
begin
  new(temp);
  temp^.value:=val;
  temp^.left:=nil;
  temp^.right:=nil;
  if tree=nil then begin
   tree:=temp;
  end
  else begin
   loc:=tree;
   while (loc<>nil) do begin
    prev:=loc;
    if (val<loc^.value) then begin
      loc:=loc^.left;
    end
    else begin
      loc:=loc^.right;
    end;
   end;
   if (val<prev^.value) then begin
    prev^.left:=temp;
   end
   else begin
     prev^.right:=temp;
   end;
  end;
end;}


function countNode(tree:pNode):integer;
var nRet:integer;
begin
 if tree=nil then exit else begin
   if tree^.left<>nil then
     nRet:=countNode(tree^.left)
     else inc(nret);
   if tree^.left<>nil then
     nRet:=countNode(tree^.right)
     else inc(nret);
 end;
     result:=nRet;
end;

function countNodeSum(tree:pNode):integer;
begin
  if tree<>nil then begin
    countNodeSum:=tree^.value+
     (tree^.left.value)+countNodeSum(tree^.right);
  end;
end;


procedure Insert(var tree:pNode;val:integer);   //recursial insertion
begin
 if tree=nil then begin
   new(tree);
   tree^.value:=val;
   tree^.right:=nil;
   tree^.left:=nil;
 end;
 if val<tree^.value then Insert(tree^.left,val);
 if val>tree^.value then Insert(tree^.right,val);
end;

  {+DELETE}
function find(root:pNode; key:integer; var p, parent:pNode):Boolean;
begin
   p:=root;
   while p<>nil do begin
      if key=p^.value then begin
         find:=true;
         exit;
      end;
      parent:=p;
      if key<p^.value then
         p:=p^.left
      else p:=p^.right;
   end;
find:=false;
end;

function godown(p:pNode):pNode;
var
   y:pNode ;
   prev:pNode;
begin
   y:=p^.right;
   if y^.left=nil then y^.left:=p^.left
   else
   begin
      repeat
         prev:=y; y:=y^.left;
      until y^.left=nil;
      y^.left:=p^.left;
      prev^.left:=y^.right;
      y^.right:=p^.right;
   end;
   godown:=y;
end;

procedure Delete(var root:pNode;key:integer);
var
   p:pNode;
   parent:pNode ;
   y:pNode;
begin
    if not find(root, key, p, parent) then begin
     writeln('Node not found');
     exit;
    end;
   if p^.left=nil then y:=p^.right
   else
      if p^.right=nil then y:=p^.left
      else y:=godown(p);
   if p=root then root:=y
   else
      if key<parent^.value then
         parent^.left:=y
      else parent^.right:=y;
   dispose(p)
end;
  {-DELETE}

 {+FIND}
function findNode(root:pnode;x:integer):pnode;
begin
if root=nil then result:=nil;
if x<root^.value then result:=findNode(root^.left,x)
else if x>root^.value then result:=findNode(root^.right,x)
else result:=root;
end;

function findpr(root:pnode;x:integer):pnode;
begin
if root=nil then
result:=nil;
if ((root^.left<>nil ) and (root^.left.value=x)) or
   ((root^.right<>nil ) and (root^.right.value=x)) then
begin
result:=root;
end
else if (root^.value>x) then
result:=findpr(root^.left,x)
else
if (root^.value<x) then
result:=findpr(root^.right,x);
end;
 {-FIND}

procedure printSymmetricalCrossing(t:pnode);
begin
  if t<>nil then
     begin
       printSymmetricalCrossing(t^.left);
       writeln(t^.value);
       printSymmetricalCrossing(t^.Right)
     end;
end;

procedure printDirectDepth(const tree:pNode;l:integer);
var i:integer;
begin
 if tree<>nil then begin
   printDirectDepth(tree.right,l+3);
   for i:=1 to l do write(' ');
   writeln(tree.value);
   printDirectDepth(tree.left,l+3);
 end;
end;

procedure printReverseDepth(var tree:pNode;l:integer);
var i:integer;
begin
  if tree<>nil then  begin
   printReverseDepth(tree.left,l+3);
      for i:=1 to l do write(' ');
   writeln(tree.value);
   printReverseDepth(tree.right,l+3);
  end;
end;

procedure printBroadways(var p:pNode;h:integer);
var i: Integer;
begin
 if p<>nil then begin
  printBroadways(p^.right,h+3);
  for i:=1 to h do write(' ');
   writeln (p^.value);
  printBroadways(p^.left,h+3);
 end;
end;

begin
rbool:=true;
lbool:=true;
fnode_l:=0;
fnode_r:=0;
Initialize(tree);
 while 1<>0 do begin
   writeln('1.Add a new node');
   writeln('2.Search by value');
   writeln('3.Print');
   writeln('4.Delete an element');
   writeln('---');
   writeln('5. Arithmetical mean');
   writeln('6. Which subtree is longer');
   readln(cmd1);
   case cmd1 of
    1:begin     {insert}
      writeln(#10#13,'Value: ');
      readln(nVal);
      Insert(Tree,nVal);
      writeln;
    end;
    4:begin    {delete}
      writeln(#10#13,'Enter value to delete: ');
      readln(nVal);
      Delete(tree,nVal);
      writeln;
    end;
    3:begin   {print}
      writeln(#10#13,'  1.Direct depth crossing');
      writeln('  2.Reverse depth crossing');
      writeln('  3.Symmetrical depth crossing',#10#13,'  --');
      writeln('  4. Broadways');
      readln(cmd2);
       case cmd2 of
        1:begin
         printDirectDepth(tree,8);
         writeln;
        end;
        2:begin
          printReverseDepth(tree,8);
          writeln;
        end;
        3:begin
          printSymmetricalCrossing(tree);
          writeln;
        end;
        4:begin
          printBroadways(tree,8);
          writeln;
        end;
       end;
    end;
    2:begin  {search}
      writeln(#10#13,'Value: ');
      readln(nVal);
      fnode1:=findNode(tree,nVal);
      fnodepr:=findpr(tree,nVal);
      if fnode1^.left<>nil then
       fnode_l:=fnode1^.left.value
       else lbool:=false;
      if fnode1^.right<>nil then
       fnode_r:=fnode1^.right.value else rbool:=false;
      writeln('Node: ',fnode1^.value);
      writeln('Parent:',fnodepr^.value);
      if lbool=true then writeln('Left: ',fnode_l)
      else writeln('Left: nil');
      if rbool=true then writeln('Right: ',fnode_r,#10#13)
      else writeln('Right: nil');
    end;
    5:writeln(countNodeSum(tree)/countNode(tree));
   end;
 end;
end.
