uses
  System.SysUtils,Classes;

type
    TStrArray=array of String;

type TrieNode=^Node;                      //
Node = record                             //
 Sym    : array['A'..'ÿ'] of TrieNode;    //   DEFINE: PREFIX TREE STRUCTURE
 IsLeaf : boolean;                        //
end;                                      //

var wordlist,spell:TStrArray;
    word,s,path,_word:String;
    i,cmd:integer;
    TREE:TrieNode;
    mtk:integer;

function NewNode:TrieNode;
var Node:TrieNode;
    i:char;
begin
 new(Node);
 node^.isLeaf:=false;
 for i:='A' to 'ÿ' do
  node^.sym[i]:=nil;
 NewNode:=node;
end;

procedure TrieInsert(var Tree:TrieNode;s:string);
begin
 if tree=nil then tree:=NewNode;
 if s='' then
   tree^.isleaf:=true
    else TrieInsert(tree^.sym[s[1]],copy(s,2,length(s)-1));
end;

procedure Print(Tree:TrieNode;s:string);
var sym_idx:char;
begin
 if tree=nil then
  exit;
 if tree^.isleaf then writeln(s);
 for sym_idx:='A' to 'ÿ' do
  if tree^.sym[sym_idx]<>nil then
   Print(Tree^.sym[sym_idx],s+sym_idx);
end;

function FindNode(word:string;length:integer;t:TrieNode):boolean;
// INTERNAL TREE PRUNING ALGORITHM
 function GoDeep(t:TrieNode;depth:integer):boolean;
   begin
    if depth=length+1 then
     result:=t^.isleaf
    else if
      t^.sym[word[depth]]=nil then
       result:=false
    else result:=GoDeep(t^.sym[word[depth]],depth+1)
   end;
// SEARCH
begin
 FindNode:=GoDeep(t,1);
end;

function CompoundStr(const s:string;dels:TSysCharSet):TStrArray;
var len, index1, index2, idx: integer;
begin
 result:=nil;
 if length(s)=0 then
  exit;
 len:=length(s);
 setlength(result,len);
 index2:=1;
 idx:=0;
  repeat
   index1:=index2;
   while (index2<=len) and not (s[index2] in dels) do       // charinset(s[index2],dels) do
    inc(index2);
   if index1<=index2 then begin
    result[idx]:=(copy(s,index1,index2-index1));
    inc(idx);
   end;
   if (index2<=len) and (s[index2] in dels) then       // charinset(s[index2],dels) then
     inc(index2);
   until index2>len;
  setlength(result, idx);
end;

function Mistakes(__spell:string):integer;
var _mtk,i:integer;
begin
 spell:=CompoundStr(ansiuppercase(__spell),['!','?','"',':','«','»',',','(',')','-',' ']);
 _mtk:=0;
 for i:=0 to high(__spell) do begin
   word:=spell[i];
    if FindNode(word,length(word),tree)=false then  begin
      writeln('The word "',spell[i],'" is incorrect.');
      _mtk:=_mtk+1;
    end;
 end;
 result:=_mtk;
end;

function ReadFile(_path:string):string;
var f:textfile;
s:string;
begin
  writeln(#10#13,'File path: ');
  readln(_path);
  try
   assignfile(f,_path);
   reset(f);
   while not EOF(f) do
   readln(f,s);
   except
    on ex:exception do
     writeln('An error occured while reading the file "',_path,'".',#10#13,'Reason: ',ex.message);
   end;
   closefile(f);
   result:=s;
end;

begin
while 1<>0 do begin
  writeln('1. Text to dictionary');
  writeln('2. Add a word');
  writeln('3. Print dictionary');
  writeln('4. Spell checking');
  writeln('5. Check specified string');
  writeln('--');
  writeln('0. Exit');
  write('Command: ');
  readln(cmd);
  case cmd of
    0: exit;
    1:begin
      s:=ReadFile(path);
      wordlist:=CompoundStr(ansiuppercase(s),['!','?','"',':',';','«','»',',','(',')','-',' ']);
      for i :=0 to high(wordlist) do begin
        word:=trim(wordlist[i]);
        TrieInsert(tree,word);
      end;
      setlength(wordlist,0);
      s:='';
      writeln;
    end;
    2: begin
       write('Word: ');
       readln(_word);
       TrieInsert(tree,_word);
       writeln('"',_word,'" has been added to the dictionary.',#10#13);
    end;
    3: begin
       writeln('---------------- DICTIONARY ----------------');
       if tree=nil then writeln('            Dictionary is empty.')
       else print(tree,'  ');
       writeln('--------------------------------------------',#10#13);
    end;
    4: begin
       s:=ReadFile(path);
       mtk:=Mistakes(s);
       writeln('Spell checking has ended. Mistakes found: ',mtk,#10#13);
       s:='';
       setlength(_word,0);
    end;
    5: begin
       write(#10#13,'String: ');
       readln(_word);
       mtk:=Mistakes(_word);
       writeln('Spell checking has ended. Mistakes found: ',mtk,#10#13);
       _word:='';
       setlength(spell,0);
    end;
  end;
end;
readln;
end.
