program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {KMP};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TKMP, KMP);
  Application.Run;
end.
